#include 'protheus.ch'
#include 'parmtype.ch'
// Incluir filtro na monagem da Carga que filtre a Carga do campo C5_XCARGA, não trazer os pedidos para montagem que tenha o campo preenchido quando não utilizar o campo
// Gravar no campo DAK_XCARGA o valor de C5_XCARGA quando utilizado no FILTRO

user function ROMSE016()
	//Local c_Qry := ""
	Local n_Opc := 0
	Local lHabFatAnt := GetMv("MV_XFATANT",,.F.)//Habilita Faturamento antecipado. 
	

	Private oProcess := nil   // Variável que receberá a regua de processamento
	Private c_CrgOri := DAK->DAK_COD

	if !lHabFatAnt
	
		MsgAlert("Rotina desabilitada!","MV_XFATANT")
		return()
		
	endif
	
	If DAK->DAK_FEZNF = '1'
		MsgInfo("Carga já foi Faturada.")
		Return
	Endif

	If DAK->DAK_XIDTRI <> ' '
		MsgInfo("Carga já esta em processo de Triangulação.")
		Return
	Endif

	If DAK->DAK_XTIPO = 'E'
		MsgInfo("Para Estorno, posicionae na Carga Origem")
		Return
	Endif

	If DAK->DAK_XTIPO = 'F'
		n_Opc := Aviso("Atenção","Deseja estornar A. Fat",{"Ok","Cancela"})
		If n_Opc = 2
			Return
		Endif

		oProcess := MsNewProcess():New({|| RunExc()}, "Preparando", "Iniciando processo...")
		oProcess:Activate()
	Else

		oProcess := MsNewProcess():New({|| RunProc()}, "Preparando", "Iniciando processo...")
		oProcess:Activate()
	Endif



return


Static Function RunExc()
	Local c_Qry := ""
	//Local l_Ret := .T.
	Local n_I := 0
	Local a_PdCrg := {}
	Local c_Crg := ""

	Private lMsErroAuto := .F.

	Begin Transaction
		oProcess:setRegua1(2)
		oProcess:incRegua1("Ajustando Pedidos...")

		c_Qry := "SELECT C5_NUM, A.R_E_C_N_O_ AS REC, C9_CARGA, C5_XPEDIDO "
		c_Qry += "FROM SC5010 A, "
		c_Qry += "SC6010 B INNER JOIN SC9010 ON SC9010.D_E_L_E_T_ = ' ' "
		c_Qry += "AND C9_FILIAL = '"+ xFilial("SC9") +"'
		c_Qry += "AND C9_PEDIDO = C6_NUM  "
		c_Qry += "AND C9_ITEM = C6_ITEM  "
		c_Qry += "AND C9_PRODUTO = C6_PRODUTO  "
		c_Qry += "WHERE A.D_E_L_E_T_ = ' ' AND B.D_E_L_E_T_ = ' ' "
		c_Qry += "AND C5_FILIAL = '"+ xFilial('SC5') +"' "
		c_Qry += "AND C6_FILIAL = '"+ xFilial('SC6') +"' "
		c_Qry += "AND C5_NUM = C6_NUM "
		c_Qry += "AND C5_XCARGA = '"+ c_CrgOri +"' "
		c_Qry += "GROUP BY C5_NUM, A.R_E_C_N_O_, C9_CARGA, C5_XPEDIDO "
		c_Qry += "ORDER BY C5_NUM  "

		PlSQuery(c_Qry, "_C5PD")

		Count to n_Reg
		oProcess:setRegua2(n_Reg)
		DbGoTop()

		c_Crg := _C5PD->C9_CARGA

		While ! Eof()
			oProcess:incRegua2("Buscando Pedidos...")

			AADD(a_PdCrg,{_C5PD->C5_NUM,_C5PD->REC,_C5PD->C5_XPEDIDO})

			DbSelectArea("_C5PD")
			DbSkip()
		EndDo

		_C5PD->(DbCloseArea())

		oProcess:setRegua2(1)
		oProcess:incRegua2("Excluindo Carga ("+ c_Crg +")...")

		DbSelectArea("DAK")
		DbSetOrder(1)
		DbSeek(xFilial("DAK") + c_Crg)

		//Estono da Carga
		Os200ProcEst(DAK->DAK_COD)

		If lMsErroAuto
			DisarmTransaction()
			MostraErro()
			Return
		EndIf

		oProcess:setRegua2(Len(a_PdCrg))

		For n_I := 1 to Len (a_PdCrg)

			oProcess:incRegua2("Excluindo Pedidos...")

			DbSelectArea("SC6")
			DbSetOrder(1)
			DbSeek(xFilial("SC6") + a_PdCrg[n_I,1])

			While !SC6->(eof()) .and. SC6->C6_NUM == a_PdCrg[n_I,1]
				dbSelectArea("SC9")
				dbSetOrder(1)
				If MsSeek(xFilial("SC9")+SC6->C6_NUM+SC6->C6_ITEM)
					SC9->(a460Estorna())
				Endif


				DbSelectArea("SC6")
				DbSkip()

			Enddo

			DbSelectArea("SC5")
			DbGoTo(a_PdCrg[n_I,2])

			aCabec := {}
			aItens := {}
			aadd(aCabec,{"C5_NUM",a_PdCrg[n_I,1],Nil})

			lMsErroAuto := .F.

			MATA410(aCabec,aItens,5)

			If lMsErroAuto
				DisarmTransaction()
				MostraErro()

				Return
			EndIf

		Next

		oProcess:incRegua1("Alterando o TES...")

		oProcess:setRegua2(Len(a_PdCrg))

		For n_I := 1 to Len (a_PdCrg)

		oProcess:incRegua2("Alterando...")

			c_Ped := a_PdCrg[n_I,3]

			DbSelectArea("SC5")
			DbSetOrder(1)
			if DbSeek(xFilial("SC5") + c_Ped)
				RecLock("SC5",.F.)
					SC5->C5_XPEDIDO := ' '
				SC5->(MsUnLock())
			endif

			DbSelectArea("SC6")
			DbSetOrder(1)
			DbSeek(xFilial("SC6") + c_Ped)

			While ! Eof() .AND.  SC6->C6_NUM = c_Ped

				DbSelectArea("SC6")
				RecLock("SC6",.F.)
				SC6->C6_TES := SC6->C6_XTES
				SC6->C6_XTES := ' '
				SC6->(MsUnLock())

				DbSkip()
			enddo

		Next


		DbSelectArea("DAK")
		DbSetOrder(1)
		DbSeek(xFilial("DAK") + c_CrgOri)

		RecLock("DAK",.F.)

		DAK->DAK_XTIPO := ' '

		DAK->(MsUnLock())

	End Transaction
Return

Static Function RunProc()
	Local c_Ped := ""
	Local c_Ped2 := ""
	Local c_TES := ""
	Local aCabAuto := {}
	Local aIteAuto := {}
	Local aAux := {}

	Private lMsErroAuto := .F.

	//Selecionar os Pedidos da Carga Selecionada
	Begin Transaction
		oProcess:setRegua1(2)
		oProcess:incRegua1("Gerando Pedidos...")
		//Posicionar no Pedido e "Copiar" alterando o TES ou Tipo de Operacao (COM Fiscal, COM Financeito, SEM Estoque), Gravar o Carga no campo C5_XCARGA e Liberando o Pedido

		c_Qry := "SELECT C5_NUM, A.R_E_C_N_O_ AS REC "
		c_Qry += "FROM SC5010 A, "
		c_Qry += "SC6010 B INNER JOIN SC9010 ON SC9010.D_E_L_E_T_ = ' ' "
		c_Qry += "AND C9_FILIAL = '"+ xFilial("SC9") +"'
		c_Qry += "AND C9_PEDIDO = C6_NUM  "
		c_Qry += "AND C9_ITEM = C6_ITEM  "
		c_Qry += "AND C9_PRODUTO = C6_PRODUTO  "
		c_Qry += "AND C9_CARGA = '"+ c_CrgOri +"' "
		c_Qry += "WHERE A.D_E_L_E_T_ = ' ' AND B.D_E_L_E_T_ = ' ' "
		c_Qry += "AND C5_FILIAL = '"+ xFilial('SC5') +"' "
		c_Qry += "AND C6_FILIAL = '"+ xFilial('SC6') +"' "
		c_Qry += "AND C5_NUM = C6_NUM "
		c_Qry += "AND C5_TIPO = 'N' "
		c_Qry += "AND C6_NOTA = ' ' "
		c_Qry += "AND C6_BLQ <> 'R' "
		c_Qry += "GROUP BY C5_NUM, A.R_E_C_N_O_ "
		c_Qry += "ORDER BY C5_NUM  "

		PlSQuery(c_Qry, "_C5PD")

		Count to n_Reg
		DbGoTop()

		oProcess:setRegua2(n_Reg)
		While ! Eof()
			oProcess:incRegua2("Gerando...")

			DbSelectArea("SC5")
			DbSetOrder(1)
			DbGoTo(_C5PD->REC)


			aAdd(aCabAuto, {"C5_TIPO"	, SC5->C5_TIPO		, nil}) // TIPO DO PEDIDO
			aAdd(aCabAuto, {"C5_CLIENTE", SC5->C5_CLIENTE	, nil}) // CÓDIGO DO CLIENTE
			aAdd(aCabAuto, {"C5_LOJACLI", SC5->C5_LOJACLI	, nil}) // LOJA DO CLIENTE
			aAdd(aCabAuto, {"C5_EMISSAO", SC5->C5_EMISSAO	, nil}) // DATA DE EMISSÃO
			aAdd(aCabAuto, {"C5_CONDPAG", SC5->C5_CONDPAG	, nil}) // CONDIÇÃO
			aAdd(aCabAuto, {"C5_TIPLIB"	, SC5->C5_TIPLIB	, nil}) // libera por item
			aAdd(aCabAuto, {"C5_XPVSGAC", SC5->C5_XPVSGAC	, nil}) // TABELA PREÇO
			aAdd(aCabAuto, {"C5_VEND1"	, SC5->C5_VEND1		, nil}) // VENDEDOR
			aAdd(aCabAuto, {"C5_TPFRETE", SC5->C5_TPFRETE	, nil}) // TIPO FRETE
			aAdd(aCabAuto, {"C5_FRETE"	, SC5->C5_FRETE		, nil}) // VALOR FRETE
			aAdd(aCabAuto, {"C5_XFILEST", SC5->C5_XFILEST	, nil}) // FILIAL ESTOQUE
			aAdd(aCabAuto, {"C5_XFILINT", SC5->C5_XFILINT	, nil}) // FILIAL INTERMEDIARIA
			aAdd(aCabAuto, {"C5_XOBSNF"	, SC5->C5_XOBSNF	, nil}) // OBS NOTA
			aAdd(aCabAuto, {"C5_XOBSPV"	, SC5->C5_XOBSPV	, nil}) // OBS PEDIDO
			//aAdd(aCabAuto, {"C5_XVBCDES", SC5->C5_XVBCDES	, nil}) // DESCONTO VBC TOTAL
			//aAdd(aCabAuto, {"C5_XPVSGAC", SC5->C5_XPVSGAC	, nil}) // PEDIDO SGAC
			aAdd(aCabAuto, {"C5_XCARGA" , c_CrgOri			, nil})
			aAdd(aCabAuto, {"C5_XPEDIDO", SC5->C5_NUM		, nil})

			aIteAuto := {}

			c_Ped := _C5PD->C5_NUM

			DbSelectArea("SC6")
			DbSetOrder(1)
			DbSeek(xFilial("SC6") + c_Ped)

			While ! Eof() .AND.  SC6->C6_NUM = c_Ped

				aAux := {}

				c_TES := Posicione("SF4",1, xFilial("SF4") + SC6->C6_TES, "F4_XTESEST")
				//c_TES := SC6->C6_TES



				aAdd(aAux, {"C6_ITEM"   , SC6->C6_ITEM		, nil}) //  ITEM DO PEDIDO
				aAdd(aAux, {"C6_PRODUTO", SC6->C6_PRODUTO	, nil}) //  CÓDIGO DO PRODUTO
				aAdd(aAux, {"C6_QTDVEN" , SC6->C6_QTDVEN	, nil}) //  QUANTIDADE VENDIDA
				aAdd(aAux, {"C6_PRCVEN" , SC6->C6_PRCVEN	, nil}) //  PREÇO DE VENDA
				//aAdd(aAux, {"C6_VALOR"  , SC6->C6_VALOR		, nil}) //  VALOR TOTAL
				aAdd(aAux, {"C6_TES"    , c_TES				, nil}) //  TIPO OPERAÇÂO TRANSFERENCIA
				aAdd(aAux, {"C6_LOCAL"  , SC6->C6_LOCAL		, nil}) //  FILLIAL PEDIDO DE ORIGEM
				//aadd(aAux, {"C6_QTDLIB" , SC6->C6_QTDVEN	, nil}) //  LIBERAÇAO ESTOQUE AUTOMATICA


				aAdd(aIteAuto, aClone(aAux) )


				DbSelectArea("SC6")
				DbSkip()
			enddo


			lMsErroAuto := .F.

			MSExecAuto({|x,y,z| Mata410(x,y,z)}, aCabAuto, aIteAuto, 3)

			If lMsErroAuto

				DisarmTransaction()

				MostraErro()

				Return
			Else
				c_Ped2 := SC5->C5_NUM

				DbSelectArea("SC6")
				DbSetOrder(1)
				DbSeek(xFilial("SC6") + c_Ped2)

				While !SC6->(eof()) .and. SC6->C6_NUM == c_Ped2
					dbSelectArea("SC9")
					dbSetOrder(1)

					If MsSeek(xFilial("SC9")+SC6->C6_NUM+SC6->C6_ITEM)
						SC9->(a460Estorna())
					Endif

					nQtdLib  := SC6->C6_QTDVEN

					RecLock("SC6",.F.)

					REPLACE C6_QTDLIB    with nQtdLib

					MaLibDoFat(SC6->(RecNo()), @nQtdLib,.T.,.T.,.F.,.T.,.F.,.F.)

					SC6->(MsUnLock())
					If nQtdLib = 0
						DisarmTransaction()
						MsgAlert("Falha na liberaçao o pedido de estoque gerado. Processamento abortado!", "MaLibDoFat")
						//MostraErro()
						Return
					Endif

					DbSelectArea("SC6")
					DbSkip()

				Enddo


				//gravando no pedido de origem
				DbSelectArea("SC5")
				DbSetOrder(1)
				DbGoTo(_C5PD->REC)

				RecLock("SC5",.F.)

				SC5->C5_XPEDIDO := c_Ped2

				SC5->(MsUnLock())

				//liberando bloqueio de estoque no pedido origem
				DbSelectArea("SC6")
				DbSetOrder(1)
				DbSeek(xFilial("SC6") + SC5->C5_NUM)
				While !SC6->(eof()) .and. SC6->C6_NUM == SC5->C5_NUM
					dbSelectArea("SC9")
					dbSetOrder(1)
					If MsSeek(xFilial("SC9")+SC6->C6_NUM+SC6->C6_ITEM)
						SC9->(Reclock("SC9",.F.))
							SC9->C9_BLEST := ""
						SC9->(MsUnLock())
					Endif

					SC6->(DbSkip())
				Enddo

			endif

			DbSelectArea("_C5PD")
			DbSkip()
		EndDo


		oProcess:incRegua1("Alterando o TES...")
		//Alterar o TES dos pedidos da Carga (SEM Fiscal, SEM Financeito, COM Estoque)

		DbGoTop()

		oProcess:setRegua2(n_Reg)
		While ! Eof()
			oProcess:incRegua2("Alterando...")

			c_Ped := _C5PD->C5_NUM

			DbSelectArea("SC6")
			DbSetOrder(1)
			DbSeek(xFilial("SC6") + c_Ped)

			While ! Eof() .AND.  SC6->C6_NUM = c_Ped
				c_TES := Posicione("SF4",1, xFilial("SF4") + SC6->C6_TES, "F4_XTESFIN")
				//c_TES := SC6->C6_TES

				IF Empty(c_TES)
					DisarmTransaction()
					MsgAlert("Falha na busca da TES Financeira. Verifique o campo F4_XTESFIN no cadastro da TES: "+SC6->C6_TES+". Processamento abortado!", "MaLibDoFat")
					//MostraErro()
					Return
				EndIf

				DbSelectArea("SC6")
				RecLock("SC6",.F.)
				SC6->C6_XTES := SC6->C6_TES
				SC6->C6_TES :=c_TES
				SC6->(MsUnLock())

				SC6->(DbSkip())
			enddo

			DbSelectArea("_C5PD")
			DbSkip()
		EndDo

		_C5PD->(DbCloseArea())

		DbSelectArea("DAK")
		RecLock("DAK",.F.)

		DAK->DAK_XTIPO := 'F'

		DAK->(MsUnLock())

	End Transaction

Return
