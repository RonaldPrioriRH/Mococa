#INCLUDE "SPEDNFE.ch"
#Include "TOTVS.ch"
#Include "TopConn.ch"
#Include "RPTDef.ch"
#Include "FWPrintSetup.ch"
#INCLUDE "APWIZARD.CH"
#INCLUDE "FILEIO.CH"
#INCLUDE "PARMTYPE.CH"

/*/----------------{Protheus.doc} -----------------------------------
|@author Jackson Capelato "Rotina transmissão" Reformulada
|@since 12/08/2024                                                  |
|@version 1.0                                                       |
|@type function                                                     |
-------------------------------------------------------------------/*/

User Function CARC5AF2()

	Local aArea         := FWGetArea()
	Local aPergs        := {}

	Private cEof        := chr(13)+chr(10)
	Private cEmpresa    :='01'
	Private	cFilix      :='0101'
	Private cFilDe      := Space(04)
	Private cFilAte     := Space(04)
	Private cForneDe    := Space(15)
	Private cForneAte   := Space(15)
	Private cDatade     := FirstDate(Date())
	Private cDataate    := LastDate(Date())
	Private cPerg       := FUNNAME()+'A'
	Private lCarcSaf2   := IsBlind() // Usado para apresentar ou não msgs em tela nas rotinas de transmissão já existentes da Mococa ou identificar que vem de JOB

	//Se for execução automática, não mostra pergunta, executa direto
	If lCarcSaf2
		RpcSetType(3)
		If RpcSetEnv(cEmpresa,cFilix,,,"FAT","MATA410")
			conout("Executnado EM JOB.")
			If LockByName("CARC5AF2", .T., .T.)
				fProcTrf()
			Endif
		Endif
	Else
		//Adicionando os parametros do ParamBox
		aAdd(aPergs,{"Intereção em Tela?","N",1,0,"",{"Não","Sim","","",""}})

		u_SX1ATU(cPerg,aPergs)
		If Pergunte(cPerg,.T.)
			lCarcSaf2   := MV_PAR01== 1
			If lCarcSaf2
				If LockByName("CARC5AF2", .T., .T.)
					fProcTrf()
				Endif
			Else
				If LockByName("CARC5AF2", .T., .T.)
					Processa({|| fProcTrf()}, "Processando...")
				Endif
			Endif
		EndIf
	EndIf
	FWRestArea(aArea)
	UnlockByName("CARC5AF2", .T., .T.)
Return

Static Function fProcTrf()
	Local cBDconex      := "@SIGOFC"
	Local aLinha        := {}
	Local aEtapas       := {}
	Local cFilOld       := ''
	Local CFILINIC      := cFilAnt

	Private nChave      := 0
	Private aItmPV      := {}
	Private cNumPV      := ''
	Private cTpOpSai    := SUPERGETMV( "XX_OPTRFS", .T., "10")
	Private cTpOpEnt    := SUPERGETMV( "XX_OPTRFE", .T., '70') //Tipo de operação para escolha da TES
	Private cErroSef	:= ''
	Private nPrcVen		:= 0

	cQry    := " SELECT CHV, ORIGEM FROM MOCMM0004"+cBDconex
	cQry    += " WHERE CHV NOT IN  "
	cQry    += " (SELECT ZA0_CHAVE FROM ZA0010 ZA0 WHERE ZA0.D_E_L_E_T_ <> '*' AND CHV = ZA0_CHAVE GROUP BY ZA0_CHAVE) "
	cQry    += " AND FILIALARMDESTINO <> ''   "
	cQry    += " AND CHV = 6322 "
//	cQry    += " AND (SUBSTR(DTINICIO,9,2) = '13') "
	cQry    += " GROUP BY CHV, ORIGEM"
	cQry    += " ORDER BY 1 "

	MemoWrite("c:\temp\fProcTrf.sql",cQry)

	cQry := ChangeQuery(cQry)

	If Select("CTRF")
		ctrf->(dBcloseArea())
	Endif
	TcQuery cQry New Alias "CTRF"
    /*
    ZA0_ETAPA 0=Iniciado;1=Ped.Venda;2=Docto Saida;3=Transmissão;4=Danfe;5=Doc.Entrada
    ZA0_STATUS I=Iniciado;E=Erro;F=Finalizado
    */
	cFilAnt := CTRF->ORIGEM
	cStart  := '0'  // Flag para startar fila
	cStatus := 'I'  // Iniciado
	cFilPed := cFilEnt := cPedVen  := cSerSai  := cNotSai  := cLogZa0  := cCodCli  := cLojCli := ''

	Do While !ctrf->(eof())     //  Envia registros para fila de processamento
		u_atualza0(ctrf->CHV,cStart,cStatus,cFilPed,cFilEnt,cPedVen,cSerSai,cNotSai,'',cCodCli,cLojCli)
		ctrf->(dbskip())
	Enddo
	ctrf->(dBcloseArea())

    /*
    ZA0_ETAPA 0=Iniciado;1=Ped.Venda;2=Docto Saida;3=Transmissão;5=Doc.Entrada
    ZA0_STATUS I=Iniciado;E=Erro;F=Finalizado
    */

	aadd(aEtapas,{'0','Iniciado'})
	aadd(aEtapas,{'1','Ped.Venda'})
	aadd(aEtapas,{'2','Docto Saida'})
	aadd(aEtapas,{'3','Transmissao'})
	aadd(aEtapas,{'5','Doc.Entrada'})

	// Busca registros pendentes de processanto
	cQry    := " SELECT * FROM ZA0010 ZA0 "
	cQry    += " WHERE ZA0.D_E_L_E_T_ = ' ' "
	cQry    += " AND ZA0_STATUS IN ('I') "
	cQry    += " ORDER BY 1,2 "

	If Select("CZA0")
		cza0->(dBcloseArea())
	Endif
	TcQuery cQry New Alias "CZA0"
        /*
        ZA0_ETAPA 0=Iniciado;1=Ped.Venda;2=Docto Saida;3=Transmissão;5=Doc.Entrada
        ZA0_STATUS I=Iniciado;E=Erro;F=Finalizado
        */

	nChave := cza0->za0_chave

	Do While !cza0->(eof())

		cCarga   := ''  // Verificar necessidade
		nStatus  := '0'  // Verificar necessidade
		cEtapa   := '0'

		ZA0->(dbSetOrder(1))

		za0->(dBseek(str(nChave,10)+cza0->za0_etapa))

		If za0->za0_etapa == '0'
			cFilPed := cFilEnt := cPedVen := cSerSai := cNotSai := cLogZa0 := cCodCli := cLojCli := ''
			cEtapa := '1'
			cStatus:= 'I'
			u_atualza0(cza0->za0_chave,cEtapa        ,cStatus,cFilPed,cFilEnt,cPedVen,cSerSai,cNotSai,'',cCodCli,cLojCli)  // Inicia proxima etapa
		Endif

		If za0->za0_etapa == '1'   // Preparando pedido de Venda
			cQry    := ' SELECT CHV, CODPROD, SUM(QTDCAIXA) AS QUANT, ORIGEM, FILIALARMDESTINO AS DESTINO'
			cQry    += '    FROM MOCMM0004@SIGOFC '
			cQry    += ' WHERE CHV = '
			cQry    += " "+str(cza0->za0_chave,10)+" "
			cQry    += " GROUP BY CHV, CODPROD, ORIGEM, FILIALARMDESTINO "
			cQry    += " ORDER BY CHV, CODPROD "
			If Select("CTRF")
				ctrf->(dBcloseArea())
			Endif
			cQry := ChangeQuery(cQry)
			TcQuery cQry New Alias "CTRF"

			cFilPed     := ALLTRIM(CTRF->ORIGEM)
			cFilEnt     := ALLTRIM(CTRF->DESTINO)

			cQryComp := "SELECT M0_CODFIL, M0_CGC FROM SYS_COMPANY "
			cQryComp += "WHERE D_E_L_E_T_ =  ' ' "
			cQryComp += "AND M0_CODFIL = '"+alltrim(cFilEnt)+"' "

			If Select("CSM0")
				csm0->(dBcloseArea())
			Endif
			TcQuery cQryComp New Alias "CSM0"
			cCliente := cLojaCli := cTabPreco := cNaturez := cCondPag := ""

			Do While !csm0->(Eof())
				sa1->(DBSetOrder(3))
				If sa1->(dBseek(xFilial('SA1')+csm0->m0_cgc))
					cCliente := sa1->a1_cod
					cLojaCli := sa1->a1_loja
					cTabPreco:= sa1->a1_tabela
					cNaturez := sa1->a1_naturez
					cCondPag := sa1->a1_cond
				Endif
				csm0->(dBskip())
			Enddo
			csm0->(dBcloseArea())
			cFilOld     := cFilAnt
			cFilAnt     := cFilPed
			cNumPV      := GetSx8Num("SC5","C5_NUM")
			cFilAnt     := cFilOld

			aItmPV      := {}
			Do While nChave == CTRF->CHV   // chaveagrup
				aLinha	:= {}

				DbSelectArea("DA1")
				da1->(DBSetOrder(1))

				If da1->(DBSeek(xFilial('DA1')+cTabPreco+substr(CTRF->CODPROD,1,15)))
					nPrcVen := da1->da1_prcven
				Else
					ConOut("XX Sem tabela: "+CTRF->CODPROD+" XX")
					nPrcVen := 1
				EndIf

				aAdd(aLinha,{"C6_FILIAL"	,cFilPed	                                        ,Nil}) // Filial do Pedido de Venda
				aAdd(aLinha,{"C6_NUM"		,cNumPV										        ,Nil}) // Numero do Pedido de Venda (Chave Estrangeira)
				aAdd(aLinha,{"C6_ITEM"		,StrZero( (Len(aItmPV)+1) , (TamSX3("C6_ITEM")[1]) ),Nil}) // Sequencial do Item
				aAdd(aLinha,{"C6_PRODUTO"	,CTRF->CODPROD							            ,Nil}) // Codigo do Produto
				// jackson
				aAdd(aLinha,{"C6_LOCAL"		,'09'			        		                    ,Nil}) // Codigo do Produto
				aAdd(aLinha,{"C6_QTDVEN"	,CTRF->QUANT						                ,Nil}) // Quantidade
				aAdd(aLinha,{"C6_QTDLIB"	,CTRF->QUANT							            ,Nil}) // Quantidade
				aAdd(aLinha,{"C6_PRCVEN"	,nPrcVen       								        ,Nil}) // Preco da tabela de venda
				aAdd(aLinha,{"C6_VALOR"		,nPrcVen*CTRF->QUANT       			                ,Nil}) // Valor Total
				aAdd(aLinha,{"C6_OPER"		,cTpOpSai		    		                        ,Nil}) // Tipo de operação para tes inteligente
				aAdd(aLinha,{"C6_CLI"		,cCliente	        						        ,Nil}) // Codigo do Cliente
				aAdd(aLinha,{"C6_LOJA"		,cLojaCli								            ,Nil}) // Loja do Cliente
				aadd(aItmPV,aLinha)

				ctrf->(dBskip())
			Enddo
			if !Empty(cCliente)
				if !Empty(cLojaCli)
					lRet := GrvPVInt(cFilPed, cFilEnt, cCliente, cLojaCli, cCarga, @nStatus,nChave)
				Endif
			Endif
		Endif

		cFilPed := za0->za0_filped
		cFilEnt := za0->za0_filent
		cNumPV  := za0->za0_pedido
		cDocInt := za0->za0_nota
		cSerie  := za0->za0_sersai

		If za0->za0_etapa == '2'   // Preparando documento de saida
			lRet := FatPVInt(cFilPed, cFilEnt, cCarga, cNumPV, @cDocInt, @nStatus,cza0->za0_chave)
			If !lRet .and. !Empty(lRet)
				Return .f.
			EndIf
		Endif
		If za0->za0_etapa == '3'   // Transmissao
			sf2->(dBsetOrder(1))
			If sf2->(dBseek(za0->(za0_filped+za0_nota+za0_sersai+za0_client+za0_lojcli) ))
				If sf2->f2_fimp == 'S' .and. !empty(sf2->f2_chvnfe)
					cEtapa := '4' // jackson - ver aqui
					cStatus:= 'I'
					u_atualza0(nChave,cEtapa,cStatus,za0->za0_filped,ZA0->za0_filent,ZA0->za0_pedido,ZA0->za0_sersai,ZA0->za0_nota,'',ZA0->za0_client,ZA0->za0_lojcli)   // Inicializa fila para preparar documento de saida
				Else
					lRet := fTransNFe(cEmpresa,ZA0->za0_filped,'','',SF2->F2_SERIE, SF2->F2_DOC, SF2->F2_DOC)

					if lret
						cEtapa := '5'
						cStatus:= 'I'
						cErroSef:= ''
						u_atualza0(nChave,cEtapa,cStatus,ZA0->za0_filped,ZA0->za0_filent,ZA0->za0_pedido,ZA0->za0_sersai,ZA0->za0_nota,'',ZA0->za0_client,ZA0->za0_lojcli)   // Inicializa fila para preparar documento de saida
					else
						cEtapa := '5' // erro na transmissao
						cStatus:= 'E'
						if Empty(cErroSef)
							cErroSef := 'Verificar erro de transmissao no monitor'
						Endif
						u_atualza0(nChave,cEtapa,cStatus,ZA0->za0_filped,ZA0->za0_filent,ZA0->za0_pedido,ZA0->za0_sersai,ZA0->za0_nota,cErroSef,ZA0->za0_client,ZA0->za0_lojcli)   // Inicializa fila para preparar documento de saida
						lRet := .F.
					Endif
				Endif
			Endif
		Endif
		If za0->za0_etapa == '5'   // Preparando documento de entrada
			cChvNfe := ''
			cQryComp := "SELECT M0_CODFIL, M0_CGC FROM SYS_COMPANY "
			cQryComp += "WHERE D_E_L_E_T_ =  ' ' "
			cQryComp += "AND M0_CODFIL = '"+cFilPed+"' "

			If Select("CSM0")
				csm0->(dBcloseArea())
			Endif
			TcQuery cQryComp New Alias "CSM0"
			cFornec := cLojaFor := cTabPreco := cNaturez := cCondPag := ""

			Do While !csm0->(Eof())
				sa2->(DBSetOrder(3))
				If sa2->(dBseek(xFilial('SA2')+csm0->m0_cgc))
					cFornec  := sa2->a2_cod
					cLojaFor := sa2->a2_loja
				Endif
				csm0->(dBskip())
			Enddo
			csm0->(dBcloseArea())

			lRet := EntDocInt(cFilPed, cFilEnt, cFornec, cLojaFor, cCarga, ZA0->za0_nota, cChvNfe, @nStatus,ZA0->za0_sersai,nChave,lRet,cErroSef)

		Endif
		cza0->(dbskip())
		nChave := cza0->za0_chave
	Enddo
	cFilAnt:=CFILINIC
Return

/*
Funcao responsavel por gravar o pedido de venda
*/
Static Function GrvPVInt(cFilPed, cFilEnt, cCliente, cLojaCli, cCarga, nStatus,nChave)
	Local lRet          := .T.
	Local cLog          := ""
	Local nX            := 0
	Local nY            := 0
	Local aCabPV        := {}
	Local aErroAuto     := {}
	Local cFilBkp       := cFilAnt
	Local cNumEmpBkp    := cNumEmp
	Private lMsErroAuto := .F.
	Private lMsHelpAuto := .T.

	ConOut(Repl("-",80))
	ConOut(PadC("Função: GrvPVInt", 80))
	ConOut(Repl("-",80))
	ConOut("-Inicio: "+DtoC(Date())+Time())
	ConOut("--Preparando Ambiente"+cFilPed)

	cFilAnt     := cFilPed
	cNumEmp     := cEmpAnt+cFilPed
	ConOut("--Numero para o Pedido (GetSX8Num): "+cNumPV)

	aAdd(aCabPV, {"C5_FILIAL"	, cFilPed	        ,Nil})
	aAdd(aCabPV, {"C5_NUM"		, cNumPV		    ,Nil})
	aAdd(aCabPV, {"C5_TIPO"		, "N"	    	    ,Nil})
	aAdd(aCabPV, {"C5_CLIENTE"	, cCliente		    ,Nil})
	aAdd(aCabPV, {"C5_LOJACLI"	, cLojaCli 		    ,Nil})
	aAdd(aCabPV, {"C5_CONDPAG"	, cCondPag		    ,Nil})
	aAdd(aCabPV, {"C5_TABELA"	, cTabPreco         ,Nil})
	aAdd(aCabPV, {"C5_NATUREZ"	, cNaturez	        ,Nil})  // VER GODINHO
	aAdd(aCabPV, {"C5_EMISSAO"	, dDataBase		    ,Nil})
	aAdd(aCabPV, {"C5_MOEDA"	, 1                 ,Nil})
	aAdd(aCabPV, {"C5_TPFRETE"	, 'C'			    ,Nil})
	aAdd(aCabPV, {"C5_TRANSP"	, '000001'		    ,Nil})

	ConOut("**** Gerando Pedido de Venda ****")

	ConfirmSX8()  // Retirar daqui

	if !Empty(cCliente)
		if !Empty(cLojaCli)
			MsExecAuto({|X,Y,Z| MATA410(X,Y,Z)}, aCabPV, aItmPV, 3) // 3 = INCLUSAO
		Endif
	Endif
	cSerSai := cNotSai := ''
	IF LMSERROAUTO
		lRet := .F.
		RollBackSX8()
		If !lCarcSaf2
			MostraErro()
		Endif

		cLog := "Ocorreu um erro na geracao do pedido de venda, "+cNumPV+", na filial: "+cFilPed

		ConOut(cLog)
		ConOut("cEmpAnt: "+cEmpAnt)
		ConOut("cFilAnt: "+cFilAnt)

		ConOut(PadC("Dados do Pedido", 80))
		ConOut("CABEC:")
		For nX := 1 to Len(aCabPV)
			ConOut('-'+aCabPV[nX][1]+": "+U_fConvChar(aCabPV[nX][2]))
		Next

		ConOut("ITENS:")
		cLogErro := ''
		For nY := 1 to Len(aItmPV)
			ConOut("-"+StrZero(nY,3))
			For nX := 1 to Len(aItmPV[nY])
				ConOut("--"+aItmPV[nY][nX][1]+": "+U_fConvChar(aItmPV[nY][nX][2]))
			Next
		Next

		aErroAuto := GetAutoGRLog()
		For nX := 1 To Len(aErroAuto)
			cLogErro += StrTran(StrTran(aErroAuto[nX], "<", ""), "-", "") + " "
			ConOut(cLogErro)
		Next
		cNumPV := '' // Zera o numero pois não concluiu a gravação do pedido de vendas
		u_atualza0(nChave,'1','E',cFilPed,cFilEnt,cNumPV,cSerSai,cNotSai,cLogErro,cCliente,cLojaCli)
	Else
		ConfirmSX8()
		cEtapa := '2'  // Preparar Documento Saida
		cStatus:= 'I'  // Inicia Fila
		u_atualza0(nChave,cEtapa,cStatus,cFilPed,cFilEnt,cNumPV,cSerSai,cNotSai,'',cCliente,cLojaCli)   // Inicializa fila para preparar documento de saida
	Endif

	cFilAnt := cFilBkp
	cNumEmp := cNumEmpBkp

	ConOut("-Fim: "+DtoC(Date())+Time())
Return lRet

Static Function FatPVInt(cFilPed, cFilEnt, cCarga, cNumPV, cDocInt, nStatus,nChave)
    /*
    Funcao responsavel por faturar o pedido gerado para a intercompany
    */
	Local lRet          := .T.
	Local cFilBkp       := cFilAnt
	Local cNumEmpBkp    := cNumEmp
	Local aPvlNfs       := {}
	Local aBloqueio     := {}
	Local cLogErro      := ''
	Local cSerSai       := '001'
	Local cSC9			:= GetNextAlias()

	ConOut(Repl("-",80))
	ConOut(PadC("Função: FatPVInt", 80))
	ConOut(Repl("-",80))
	ConOut("-Inicio: "+DtoC(Date())+Time())
	ConOut("--Preparando Ambiente: "+cFilPed)

	cFilAnt := cFilPed
	cNumEmp := cEmpAnt+cFilPed

	DBSelectArea("SC5")
	SC5->(DbSetOrder(1))
	SC5->(DbGoTop())

	If !SC5->(DBSeek(cFilPed+cNumPV))
		ConOut("Xx Erro no posicionamento dos Itens da Intercompany SC5 xX")
		cLogErro += "Xx Erro no posicionamento dos Itens da Intercompany SC5 xX"+cEof
		cFilAnt := cFilBkp
		cNumEmp := cNumEmpBkp
		lRet  := .f.
	EndIf

	If lRet
		cCodCli := sc5->c5_cliente
		cLojCli := sc5->c5_lojacli
		ConOut("Analisando liberacao do pedido de venda")
		Ma410LbNfs( 2, @aPvlNfs, @aBloqueio )
		Ma410LbNfs( 1, @aPvlNfs, @aBloqueio )

		If !Empty(aBloqueio)
			aAreaSC9       := sc9->(GetArea())
			ConOut("O pedido contem "+CValToChar(Len(aBloqueio))+" itens bloqueados.")
			cFilAnt := cFilBkp
			cNumEmp := cNumEmpBkp
			cLogErro += "O pedido contem "+CValToChar(Len(aBloqueio))+" itens bloqueados."+cEof

			// Força Liberação de estoque
			lRet := LiberarPV(cNumPV,@aPvlNfs) //retirado funcao original

			sc5->(DBSeek(cFilPed+cNumPV))
			sc9->(RestArea(aAreaSC9))

			xTeste:=0
		Else
			If Empty(aPvlNfs)
				ConOut("O pedido sem itens para faturar bloqueados.")
				cFilAnt := cFilBkp
				cNumEmp := cNumEmpBkp
				cLogErro += "O pedido sem itens para faturar bloqueados."+cEof
				lRet  := .f.
			EndIf
		EndIf
	Endif
	If lRet
		If empty(aPvlNfs)
			ConOut("Aparentemente foi zerado no momento da liberação, ignora a etapa para que retorno no proximo processamento da FILA")
			return .f.
		Endif
		ConOut("***** Faturando pedido de venda: "+cNumPV+" *****")
		cDocInt := MaPvlNfs(/*aPvlNfs*/     aPvlNfs,;       // 01 - Array com os itens a serem gerados
                            /*cSerieNFS*/     '001',;       // 02 - Serie da Nota Fiscal
                            /*lMostraCtb*/      .F.,;       // 03 - Mostra Lançamento Contábil
                            /*lAglutCtb*/       .F.,;       // 04 - Aglutina Lançamento Contábil
                            /*lCtbOnLine*/      .F.,;       // 05 - Contabiliza On-Line
                            /*lCtbCusto*/       .F.,;       // 06 - Contabiliza Custo On-Line
                            /*lReajuste*/       .F.,;       // 07 - Reajuste de preço na Nota Fiscal
                            /*nCalAcrs*/        0,;         // 08 - Tipo de Acréscimo Financeiro
                            /*nArredPrcLis*/    0,;         // 09 - Tipo de Arredondamento
                            /*lAtuSA7*/         .T.,;       // 10 - Atualiza Amarração Cliente x Produto
                            /*lECF*/            .F.,;       // 11 - Cupom Fiscal
                            /*cEmbExp*/         "",;        // 12 - Número do Embarque de Exportação
                            /*bAtuFin*/         {||},;      // 13 - Bloco de Código para complemento de atualização dos títulos financeiros
                            /*bAtuPGerNF*/      {||},;      // 14 - Bloco de Código para complemento de atualização dos dados após a geração da Nota Fiscal
                            /*bAtuPvl*/         {||},;      // 15 - Bloco de Código de atualização do Pedido de Venda antes da geração da Nota Fiscal
                            /*bFatSE1*/         {|| .T. },; // 16 - Bloco de Código para indicar se o valor do Titulo a Receber será gravado no campo F2_VALFAT quando o parâmetro MV_TMSMFAT estiver com o valor igual a "2".
                            /*dDataMoe*/        dDatabase,; // 17 - Data da cotação para conversão dos valores da Moeda do Pedido de Venda para a Moeda Forte
                            /*lJunta*/          .F.)        // 18 - Aglutina Pedido Iguais

		If Empty(cDocInt)
			lRet := .F.

			ConOut("-cFilAnt: " +cFilAnt    )
			ConOut("-FilForn: " +cFilPed   )
			ConOut("-FilVend: " +cFilEnt   )
			ConOut("-cCarga: "  +cCarga     )
			ConOut("-cNumPV: "  +cNumPV     )

			cLogErro += "Erro no faturamento do pedido: "+cNumPV

			ConOut(cLogErro)
		Else
			cLogErro += "Pedido de venda: "+cNumPV+" gerou a nota: "+cDocInt
			ConOut(cLogErro)
			lRet := .T.
		EndIf
	Endif
	//hora f2_hora - gravar
	cFilAnt := cFilBkp
	cNumEmp := cNumEmpBkp
	If !lRet
		cStatus:= 'E' // Erro
		u_atualza0(nChave,za0->za0_etapa,cStatus,cFilPed,cFilEnt,cNumPV,cSerSai,cDocInt,cLogErro,cCodCli,cLojCli)
	Else
		cStatus:= 'I' // Inicia Fila
		cEtapa := '3' // Fila transmissao
		u_atualza0(nChave,cEtapa,cStatus,cFilPed,cFilEnt,cNumPV,cSerSai,cDocInt,cLogErro,cCodCli,cLojCli)
		BEGINSQL ALIAS cSC9
			SELECT SC9.R_E_C_N_O_ SC9REC
			FROM %table:SC9% SC9
			WHERE SC9.%notDel%
			AND C9_FILIAL  = %XFILIAL:SC9%
			AND C9_PEDIDO  = %EXP:za0->za0_pedido%
			AND C9_NFISCAL = ''
			AND C9_SEQUEN  = '02'
		ENDSQL

		do While !(cSC9)->(Eof())
			SC9->(MsGoTo((cSC9)->SC9REC))
			Reclock("SC9",.F.)
			SC9->C9_PEDIDO := ''
			SC9->(DbDelete())
			MsUnlock()
			(cSC9)->(dBSkip())
		enddo

	Endif
Return lRet

Static Function TranDocInt(cFilPed, cFilEnt, cCarga, cDocInt, cChave, nStatus)
    /*
    Funcao responsavel por executar a transmissao da NFe da Intercompany
    */
	Local lRet := .T.
	Local cFilBkp := cFilAnt
	Local cNumEmpBkp := cNumEmp

	ConOut(Repl("-",80))
	ConOut(PadC("Função: FatPVInt", 80))
	ConOut(Repl("-",80))
	ConOut("-Inicio: "+DtoC(Date())+Time())
	ConOut("--Preparando Ambiente: "+cFilPed)

	cFilAnt := cFilPed
	cNumEmp := cEmpAnt+cFilPed

	DbSelectArea("SF2")
	SF2->(DbSetOrder(1))

	If SF2->(DBSeek(cFilPed+cDocInt))
		If !Empty(SF2->F2_CHVNFE)
			ConOut("Nota ja transmitida")
			cFilAnt := cFilBkp
			cNumEmp := cNumEmpBkp
			Return .T.
		EndIf
	else
		ConOut("Erro no posicionemaneto do documento")
		cFilAnt := cFilBkp
		cNumEmp := cNumEmpBkp
		Return .F.
	EndIf

	If !fTransNFe(cEmpAnt, cFilEnt, "0", "1", SF2->F2_SERIE, SF2->F2_DOC, SF2->F2_DOC)
		cLog := "Erro na transmissao: "+cDocInt
		If Z00->(DBSeek(cFilEnt+cCarga))
			If RecLock("Z00", .F.)
				Z00->Z00_LOG := Z00->Z00_LOG+CRLF+cLog
				Z00->(MsUnlock())
			EndIf
		EndIf
		ConOut(cLog)
		cFilAnt := cFilBkp
		cNumEmp := cNumEmpBkp
		Return .F.
	else
		cLog := "Documento: "+cDocInt+" transmitido com sucesso!"
		If Z00->(DBSeek(cFilEnt+cCarga))
			If RecLock("Z00", .F.)
				Z00->Z00_LOG := Z00->Z00_LOG+CRLF+cLog
				Z00->Z00_STATUS := '3'
				Z00->(MsUnlock())
			EndIf
			nStatus := Z00->Z00_STATUS
		EndIf
		ConOut(cLog)
		cFilAnt := cFilBkp
		cNumEmp := cNumEmpBkp
	EndIf
Return lRet

Static Function fTransNFe(cEmpresa,cFilProc,cWait,cOpc,cSerie,cNotaIni,cNotaFim)
    /*
    Funcao responsavel pela transmissao automatica  e retorno do processo de transmissao 
    */
	Local lRet        := .T.
	Local aArea       := GetArea()
	Local aParam      := {Space(Len(SF2->F2_SERIE)),Space(Len(SF2->F2_DOC)),Space(Len(SF2->F2_DOC))}
	Local aXML        := {}
	Local cRetorno    := ""
	Local cModalidade := ""
	Local cAmbiente   := ""
	Local cVersao     := ""
	Local cMonitorSEF := ""
	Local cSugestao   := ""
	Local cURL        := PadR(GetNewPar("MV_SPEDURL","http://"),250)
	Local nX          := 0
	Local lOk         := .T.
	Local oWs         := Nil

	MV_PAR01 := aParam[01] := cSerie
	MV_PAR02 := aParam[02] := cNotaIni
	MV_PAR03 := aParam[03] := cNotaFim
	
	If lOk
		oWS := WsSpedCfgNFe():New()
		oWS:cUSERTOKEN := "TOTVS"
		oWS:cID_ENT    := GetIdEnt()
		oWS:nAmbiente  := 0
		oWS:_URL       := AllTrim(cURL)+"/SPEDCFGNFe.apw"
		lOk			   := execWSRet( oWS, "CFGAMBIENTE")

		If lOk
			cAmbiente := oWS:cCfgAmbienteResult
		Else
			Conout(IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3)))
			Return .F.
		EndIf

		If lOk
			oWS:cUSERTOKEN := "TOTVS"
			oWS:cID_ENT    := GetIdEnt()
			oWS:nModalidade:= 0
			oWS:_URL       := AllTrim(cURL)+"/SPEDCFGNFe.apw"
			oWs:cModelo	   := "55"
			lOk 		   := execWSRet( oWS, "CFGModalidade" )
			If lOk
				cModalidade:= oWS:cCfgModalidadeResult
			Else
				Conout(IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3)))
				cErroSef := IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3))
				Return .F.
			EndIf
		EndIf

		If lOk
			oWS:cUSERTOKEN := "TOTVS"
			oWS:cID_ENT    := GetIdEnt()
			oWS:cVersao    := "0.00"
			oWS:_URL       := AllTrim(cURL)+"/SPEDCFGNFe.apw"
			lOk			   := execWSRet( oWs, "CFGVersao" )
			If lOk
				cVersao    := oWS:cCfgVersaoResult
			Else
				Conout(IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3)))
				cErroSef := IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3))
				Return .F.
			EndIf
		EndIf

		If lOk
			oWS:= WSNFeSBRA():New()
			oWS:cUSERTOKEN := "TOTVS"
			oWS:cID_ENT    := GetIdEnt()
			oWS:_URL       := AllTrim(cURL)+"/NFeSBRA.apw"
			lOk := oWS:MONITORSEFAZMODELO()
			If lOk
				aXML := oWS:oWsMonitorSefazModeloResult:OWSMONITORSTATUSSEFAZMODELO

				For nX := 1 To Len(aXML)
					Do Case
					Case aXML[nX]:cModelo == "55"
						cMonitorSEF += "- NFe"+CRLF
						cMonitorSEF += "Versao do layout: "+cVersao+CRLF	//"Versao do layout: "
						If !Empty(aXML[nX]:cSugestao)
							cSugestao += "Sugestão (NFe)"+": "+aXML[nX]:cSugestao+CRLF //"Sugestão"
						EndIf
					EndCase

					cMonitorSEF += Space(6)+"Versao da mensagem: "+aXML[nX]:cVersaoMensagem+CRLF //"Versão da mensagem"
					cMonitorSEF += Space(6)+"Codigo do Status: "+aXML[nX]:cStatusCodigo+"-"+aXML[nX]:cStatusMensagem+CRLF //"Código do Status"
					cMonitorSEF += Space(6)+"UF Origem: "+aXML[nX]:cUFOrigem //"UF Origem"

					If !Empty(aXML[nX]:cUFResposta)
						cMonitorSEF += "("+aXML[nX]:cUFResposta+")"+CRLF //" Resposta"
					Else
						cMonitorSEF += CRLF
					EndIf

					If aXML[nX]:nTempoMedioSEF <> Nil
						cMonitorSEF += Space(6)+"Tempo de espera: "+Str(aXML[nX]:nTempoMedioSEF,6)+CRLF //"Tempo de espera"
					EndIf

					If !Empty(aXML[nX]:cMotivo)
						cMonitorSEF += Space(6)+"Motivo: "+aXML[nX]:cMotivo+CRLF
					EndIf

					If !Empty(aXML[nX]:cObservacao)
						cMonitorSEF += Space(6)+"Observacao: "+aXML[nX]:cObservacao+CRLF
					EndIf
				Next nX

				ConOut(cMonitorSEF)
			Else
				ConOut(IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3)))
				cErroSef := IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3))
				Return .F.
			EndIf
		EndIf

		Conout("[JOB  ] - Iniciando transmissao NF-e de saida!")

		cRetorno := SpedNFeTrf("SF2",aParam[1],aParam[2],aParam[3],GetIdEnt(),cAmbiente,cModalidade,cVersao,@lEnd,.F.,.T.)

		If AT("RECUSADAS", UPPER(cRetorno)) > 0
			conout("SPED","Erro na transmissao: "+CRLF+cRetorno)
			cErroSef := "Erro na transmissao: "+CRLF+cRetorno
			Return .F.
		EndIf

		conout("SPED","Transmissao ok")
//		Else
//			conout("SPED","Empresa nao encontrada pois esta vazia!")
//			cErroSef := "Empresa nao encontrada pois esta vazia!"
//			Return .F.
//		EndIf
	Else
		Conout("SPED","Execute o modulo de configuracao do servico, antes de utilizar esta opcao!!!")
		cErroSef := "Execute o modulo de configuracao do servico, antes de utilizar esta opcao!!!"
		Return .F.
	EndIf

	RestArea(aArea)
Return lRet
Static Function EntDocInt(cFilPed, cFilEnt, cFornec, cLojaFor, cCarga, cDocInt, cChave, nStatus,cSerDoc,nChave,lproc,cMeer)
        /*
        Funcao responsavel por dar entrada no documento da intercompany
        */
	Local lRet      := .T.
	Local cLogErro  := ""
	Local aCabDE    := {}
	Local aItmDE    := {}
	Local cMVCHVNFE := GetMV("MV_CHVNFE")
	Local cBkpFAnt  := cFilAnt
	Local Nx
	Private lMsErroAuto := .F.
	Private lMsHelpAuto := .T.

	ConOut(Repl("-",80))
	ConOut(PadC("Função: EntDocInt", 80))
	ConOut(Repl("-",80))
	ConOut("-Inicio: "+DtoC(Date())+Time())
	ConOut("--Preparando Ambiente: "+cFilEnt)

	DBSelectArea("SF2")
	SF2->(DBSetOrder(1))

	If !SF2->(DBSeek(cFilPed+cDocInt+cSerDoc))
		ConOut("Erro no posicionamento da nota faturada para a intercompany: "+cDocInt)
		cLogErro += "Erro no posicionamento da nota faturada para a intercompany: "+cDocInt+cEof
		lRet := .f.
	Endif
	cFilAnt := cFilEnt
	If lRet
		aadd(aCabDE,{"F1_FILIAL"   , cFilEnt					})
		aadd(aCabDE,{"F1_TIPO"   	, "N"						})
		aadd(aCabDE,{"F1_FORMUL" 	, "N"						})
		aadd(aCabDE,{"F1_DOC"    	, SF2->F2_DOC     			})
		aadd(aCabDE,{"F1_SERIE"  	, SF2->F2_SERIE        		})
		aadd(aCabDE,{"F1_EMISSAO"	, SF2->F2_EMISSAO        	})
		aadd(aCabDE,{"F1_FORNECE"	, cFornec             		})
		aadd(aCabDE,{"F1_LOJA"   	, cLojaFor     				})
		aadd(aCabDE,{"F1_ESPECIE"	, "SPED" 					})
		aadd(aCabDE,{"F1_COND"		, "001"        				})

		DBSelectArea("SD2")
		SD2->(DbSetOrder(3))

		If !SD2->(DBSeek(cFilPed+SF2->F2_DOC+SF2->F2_SERIE))
			ConOut("Erro no posicionamento do item: "+cDocInt)
			cLogErro += "Erro no posicionamento da nota faturada para a intercompany: "+cDocInt+cEof
			lRet := .f.
		EndIf
		If lRet
			Do While !SD2->(EoF()) .and. SD2->D2_DOC == cDocInt
				aLinha := {}
				aadd(aLinha,{"D1_FILIAL"	, cFilEnt					    , Nil})
				aadd(aLinha,{"D1_DOC"  		, SD2->D2_DOC   			    , Nil})
				aadd(aLinha,{"D1_COD"  		, SD2->D2_COD   			    , Nil})
				aadd(aLinha,{"D1_QUANT"		, SD2->D2_QUANT	    		    , Nil})
				aadd(aLinha,{"D1_VUNIT"		, SD2->D2_PRCVEN			    , Nil})
				aadd(aLinha,{"D1_TOTAL"		, SD2->(D2_QUANT * D2_PRCVEN)   , Nil})
				aadd(aItmDE,aLinha)
				SD2->(DBSkip())
			EndDo
			//Desabilitar as validacoes da chave para evitar erro
			PUTMV("MV_CHVNFE", .F.)

			MsExecAuto({|X,Y,Z| MATA140(X,Y,Z)},aCabDE,aItmDE,3) // 3 = INCLUSAO

			If lMsErroAuto
				cLogErro += "Ocorreu no documento de entrada: "+cDocInt+" na filial: "+cFilEnt

				ConOut(cLogErro)
				If !lCarcSaf2
					MostraErro()
				Else
					aErroAuto := GetAutoGRLog()
					For nX := 1 To Len(aErroAuto)
						cLogErro += StrTran(StrTran(aErroAuto[nX], "<", ""), "-", "") + " "
						ConOut(cLogErro)
					Next

				Endif
				ConOut(cLogErro)

				lRet := .f.
				u_atualza0(nChave,'5'   ,'E'    ,cFilPed,cFilEnt,cNumPV,SF2->F2_SERIE,SF2->F2_DOC,cLog   ,cFornec,cLojaFor)
			Else
				cLog := 'Processo concluido'
				if !lproc
					clog += " - mas "+cMeer
					u_atualza0(nChave,'5'   ,'E'    ,cFilPed,cFilEnt,cNumPV,SF2->F2_SERIE,SF2->F2_DOC,cLog   ,cFornec,cLojaFor)
				else
					If u_atualza0(nChave,'5'   ,'F'    ,cFilPed,cFilEnt,cNumPV,SF2->F2_SERIE,SF2->F2_DOC,cLog   ,cFornec,cLojaFor)
						ConOut(cLog)
					Endif
				endif
			Endif

			PUTMV("MV_CHVNFE", cMVCHVNFE) //valida no portal a chave da nota
		Endif
	Endif
	cFilAnt := cBkpFAnt
Return lRet

Static Function checexisc5(cChvGrupo)

	Local cQry := ""
	Local lRet := .f.
	If valtype(cChvGrupo) == 'C'
		cChvGrupo := val(cChvGrupo)
	Endif

	cQry += "SELECT C5_XCHVTRF FROM "+retsqlname("SC5")+" C5 "
	cQry += "WHERE D_E_L_E_T_ =  ' ' "
	cQry += "AND C5_XCHVTRF = "+str(cChvGrupo)+" "


	If Select("CSC5")
		csc5->(dBcloseArea())
	Endif
	TcQuery cQry New Alias "CSC5"

	Do While !csc5->(Eof())
		lRet := .t.
		csc5->(dBskip())
	Enddo
Return lRet

User Function SX1ATU(_cGRP,_aPar)
    /*
    Função responsavel por incluir \ atualizar perguntas na tabela SX1
    */
	Local _I := 0
	Local _cSeq := "00"
	Local _cVrvl := "0"
	Local _lRec := .F.
	Local _cGSC := "G"
	_cGrp := Pad(_cGRP,Len(SX1->X1_GRUPO))
	SX1->(dbSetOrder(1))
	//Primeiro Cria ou Altera os registros
	For _I := 1 To Len(_aPar)
		_cSeq := Soma1(_cSeq)
		_cVrvl := Soma1(_cVrvl)
		_cGSC := "G"
		_lRec := !SX1->(dbSeek(_cGrp+_cSeq))
		RecLock("SX1",_lRec)
		SX1->X1_GRUPO		:= _cGrp
		SX1->X1_ORDEM		:= _cSeq
		SX1->X1_PERGUNT	:= _aPar[_I,01]
		SX1->X1_TIPO		:= _aPar[_I,02]
		SX1->X1_TAMANHO	:= _aPar[_I,03]
		SX1->X1_DECIMAL	:= _aPar[_I,04]
		SX1->X1_F3			:= _aPar[_I,05]
		If Len(_aPar[_I]) >= 6 .AND. _aPar[_I,6] <> Nil
			SX1->X1_DEF01		:= _aPar[_I,06,1]
			SX1->X1_DEF02		:= _aPar[_I,06,2]
			SX1->X1_DEF03		:= _aPar[_I,06,3]
			SX1->X1_DEF04		:= _aPar[_I,06,4]
			SX1->X1_DEF05		:= _aPar[_I,06,5]
			_cGSC := "C"
		Else
			SX1->X1_DEF01		:= ""
			SX1->X1_DEF02		:= ""
			SX1->X1_DEF03		:= ""
			SX1->X1_DEF04		:= ""
			SX1->X1_DEF05		:= ""
		EndIf
		If Len(_aPar[_I]) >= 7
			SX1->X1_VALID	:= _aPar[_I,07]
		EndIf
		SX1->X1_VAR01		:= ("MV_PAR"+_cSeq)
		SX1->X1_GSC		:= _cGSC
		SX1->X1_VARIAVL	:= ("MV_CH"+_cVrvl)
		SX1->(MsUnLock())
	Next _I

	SX1->(dbGoTop())
	If SX1->(dbSeek(_cGrp+"01"))
		While !SX1->(EOF()) .AND. SX1->X1_GRUPO == _cGrp
			If SX1->X1_ORDEM > _cSeq
				RecLock("SX1",_lRec)
				SX1->(dbDelete())
				SX1->(MsUnLock())
			EndIf
			SX1->(dbSkip())
		EndDo
	EndIf
Return

User Function fConvChar(xIn)

	Local cRet := ""
	Do Case
	Case ValType(xIn) == 'C'
		cRet := AllTrim(xIn)
	Case ValType(xIn) == 'D'
		cRet := DtoC(xIn)
	Case ValType(xIn) == 'N'
		cRet := CValToChar(xIn)
	Case ValType(xIn) == 'U'
		cRet := ""
	Case ValType(xIn) == 'L'
		If xIn
			cRet := "Verdadeiro"
		Else
			cRet := "Falso"
		EndIf
	OtherWise
		cRet := "Nao definido um tipo de conversao para este tipo"
	EndCase
return cRet

User Function atualza0(nChave,cStart,cStatus,cFilPed,cFilEnt,cPedVen,cSerSai     ,cNotSai    ,cLogZa0,cCodCli,cLojCli)

    /*
    cStart = '0' Inicializa processo   
    */
	Local lRet := .t.
	If valtype(nChave) == 'C'
		nChave := val(nChave)
	Endif

	If !za0->(dBseek(str(nChave,10)+cStart)) .and. cStart = '0'
		IF Empty(CFILPED)
			CFILPED:=cFilAnt
		EndIf

		RecLock('ZA0',.t.)
		za0->za0_filial := cFilPed
		za0->za0_chave  := nChave
	Else
		za0->(dBseek(str(nChave,10)))
		RecLock('ZA0',.f.)
	Endif
	za0->za0_etapa  := cStart
	za0->za0_client := cCodCli
	za0->za0_lojcli := cLojCli
	za0->za0_status := cStatus
	za0->za0_filped := cFilPed
	za0->za0_filent := cFilEnt
	za0->za0_pedido := cPedVen
	za0->za0_sersai := cSerSai
	za0->za0_nota   := cNotSai
	za0->za0_log    := cLogZa0
	za0->za0_data   := date()
	za0->za0_hora   := time()
	MsUnlock()

	za0->(dBseek(str(nChave,10)+za0->za0_etapa))

Return lRet

Static Function LiberarPV(cNumPV,aPvlNfs)
	Local cQuery    := ""
	Local nQtdLib   := 0
	Local lRet := .t.

	cQuery := " SELECT"
	cQuery += "     C5.R_E_C_N_O_ AS C5_RECNO,"
	cQuery += "     C6.R_E_C_N_O_ AS C6_RECNO,"
	cQuery += "     C5.*, "
	cQuery += "     C6.* "
	cQuery += " FROM " + RetSqlName("SC5") + " C5 (NOLOCK)"
	cQuery += " INNER JOIN " + RetSqlName("SC6") + " C6 (NOLOCK) ON"
	cQuery += "     C5.C5_FILIAL = C6.C6_FILIAL"
	cQuery += " AND C5.C5_NUM = C6.C6_NUM"
	cQuery += " AND C5.C5_CLIENT = C6.C6_CLI"
	cQuery += " AND C5.C5_LOJACLI = C6.C6_LOJA"
	cQuery += " WHERE C5.D_E_L_E_T_ = ''"
	cQuery += "   AND C6.D_E_L_E_T_ = ''"
	cQuery += "   AND C5.C5_FILIAL = '" + cFilAnt + "'"
	cQuery += "   AND C5.C5_NUM = '" + cNumPV + "'"
	cQuery += " ORDER BY C5.C5_FILIAL, C5.C5_NUM, C6.C6_ITEM "

	cQuery := ChangeQuery(cQuery)

	If Select("TSC5") > 0
		TSC5->(dbCloseArea())
	EndIf
	TcQuery cQuery New Alias TSC5

	If TSC5->(EoF())
		lRet := .F.
		cMsg := "Erro ao Liberar Pedido de Venda: Pedido de Venda n? " + cNumPV + " não encontrado no sistema."
		Return lRet
	EndIf

	While !TSC5->(EoF())
		dbSelectArea("SC5")
		SC5->(dbSetOrder(1))
		SC5->(MsGoTo(TSC5->C5_RECNO))

		dbSelectArea("SC6")
		SC6->(dbSetOrder(1))
		SC6->(MsGoTo(TSC5->C6_RECNO))

		dbSelectArea("SC9")
		SC9->(dbSetOrder(1))

		if SC9->(MsSeek(TSC5->C5_FILIAL + TSC5->C5_NUM + TSC5->C6_ITEM))

			nQtdLib := MaLibDoFat(TSC5->C6_RECNO, TSC5->C6_QTDVEN, .T., .T.)

			If TSC5->C6_QTDVEN <> nQtdLib
				lRet := .F.
				cMsg := "Erro ao Liberar o Pedido de Venda No " + cNumPV + ": Item " + Alltrim(TSC5->C6_ITEM) + " - " + Alltrim(TSC5->C6_PRODUTO) + " não liberado. Quantidade a Liberar: " + cValToChar(TSC5->C6_QTDVEN) + " / Quantidade Liberada: " + cValToChar(nQtdLib) + "."
				exit
			EndIf

			aAdd(aPvlNfs,{ SC9->C9_PEDIDO,;
				SC9->C9_ITEM,;
				SC9->C9_SEQUEN,;
				SC9->C9_QTDLIB,;
				nPrcVen,;
				SC9->C9_PRODUTO,;
				.f.,;
				SC9->(RecNo()),;
				SC5->(RecNo()),;
				SC6->(RecNo()),;
				SE4->(RecNo()),;
				SB1->(RecNo()),;
				SB2->(RecNo()),;
				SF4->(RecNo()),;
				SB2->B2_LOCAL,;
				0,;
				SC9->C9_QTDLIB2})
		else
			lRet := .F.
			exit
		Endif
		TSC5->(dbSkip())
	EndDo
	TSC5->(dbCloseArea())

	MaLiberOk({cNumPV}, .T.)
Return lRet
Static Function zGerDanfe(cNota, cSerie, cPasta)
	Local aArea     := GetArea()
	Local cIdent    := ""
	Local cArquivo  := ""
	Local oDanfe    := Nil
	Local lEnd      := .F.
	Local nTamNota  := TamSX3('F2_DOC')[1]
	Local nTamSerie := TamSX3('F2_SERIE')[1]
	Local dDataDe   := sToD("20190101")
	Local dDataAt   := Date()
	Private PixelX
	Private PixelY
	Private nConsNeg
	Private nConsTex
	Private oRetNF
	Private nColAux
	Default cNota   := ""
	Default cSerie  := ""
	Default cPasta  := GetTempPath()

	//Se existir nota
	If ! Empty(cNota)
		//Pega o IDENT da empresa
		cIdent := RetIdEnti()

		//Se o último caracter da pasta não for barra, será barra para integridade
		If SubStr(cPasta, Len(cPasta), 1) != "\"
			cPasta += "\"
		EndIf

		//Gera o XML da Nota
		cArquivo := cNota + "_" + dToS(Date()) + "_" + StrTran(Time(), ":", "-")
//        u_zSpedXML(cNota, cSerie, cPasta + cArquivo  + ".xml", .F.)

		//Define as perguntas da DANFE
		Pergunte("NFSIGW",.F.)
		MV_PAR01 := PadR(cNota,  nTamNota)     //Nota Inicial
		MV_PAR02 := PadR(cNota,  nTamNota)     //Nota Final
		MV_PAR03 := PadR(cSerie, nTamSerie)    //Série da Nota
		MV_PAR04 := 2                          //NF de Saida
		MV_PAR05 := 1                          //Frente e Verso = Sim
		MV_PAR06 := 2                          //DANFE simplificado = Nao
		MV_PAR07 := dDataDe                    //Data De
		MV_PAR08 := dDataAt                    //Data Até

		//Cria a Danfe
		oDanfe := FWMSPrinter():New(cArquivo, IMP_PDF, .F., , .T.)

		//Propriedades da DANFE
		oDanfe:SetResolution(78)
		oDanfe:SetPortrait()
		oDanfe:SetPaperSize(DMPAPER_A4)
		oDanfe:SetMargin(60, 60, 60, 60)

		//Força a impressão em PDF
		oDanfe:nDevice  := 6
		oDanfe:cPathPDF := cPasta
		oDanfe:lServer  := .F.
		oDanfe:lViewPDF := .F.

		//Variáveis obrigatórias da DANFE (pode colocar outras abaixo)
		PixelX    := oDanfe:nLogPixelX()
		PixelY    := oDanfe:nLogPixelY()
		nConsNeg  := 0.4
		nConsTex  := 0.5
		oRetNF    := Nil
		nColAux   := 0

		//Chamando a impressão da danfe no RDMAKE
		RptStatus({|lEnd| u_DanfeProc(@oDanfe, @lEnd, cIdent, , , .F.)}, "Imprimindo Danfe...")
		oDanfe:Print()
	EndIf

	RestArea(aArea)
Return

Static Function GetIdEnt()

	Local aArea  := GetArea()
	Local cIdEnt := ""
	Local cURL   := PadR(GetNewPar("MV_SPEDURL","http://"),250)
	Local oWs
	Local lUsaGesEmp := Iif(FindFunction("FWFilialName") .And. FindFunction("FWSizeFilial") .And. FWSizeFilial() > 2,.T.,.F.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Obtem o codigo da entidade                                              ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

	oWS := WsSPEDAdm():New()

	oWS:cUSERTOKEN := "TOTVS"

	oWS:oWSEMPRESA:cCNPJ       := IIF(SM0->M0_TPINSC==2 .Or. Empty(SM0->M0_TPINSC),SM0->M0_CGC,"")
	oWS:oWSEMPRESA:cCPF        := IIF(SM0->M0_TPINSC==3,SM0->M0_CGC,"")
	oWS:oWSEMPRESA:cIE         := SM0->M0_INSC
	oWS:oWSEMPRESA:cIM         := SM0->M0_INSCM
	oWS:oWSEMPRESA:cNOME       := SM0->M0_NOMECOM
	oWS:oWSEMPRESA:cFANTASIA   := IIF(lUsaGesEmp,FWFilialName(),Alltrim(SM0->M0_NOME))
	oWS:oWSEMPRESA:cENDERECO   := FisGetEnd(SM0->M0_ENDENT)[1]
	oWS:oWSEMPRESA:cNUM        := FisGetEnd(SM0->M0_ENDENT)[3]
	oWS:oWSEMPRESA:cCOMPL      := FisGetEnd(SM0->M0_ENDENT)[4]
	oWS:oWSEMPRESA:cUF         := SM0->M0_ESTENT
	oWS:oWSEMPRESA:cCEP        := SM0->M0_CEPENT
	oWS:oWSEMPRESA:cCOD_MUN    := SM0->M0_CODMUN
	oWS:oWSEMPRESA:cCOD_PAIS   := "1058"
	oWS:oWSEMPRESA:cBAIRRO     := SM0->M0_BAIRENT
	oWS:oWSEMPRESA:cMUN        := SM0->M0_CIDENT
	oWS:oWSEMPRESA:cCEP_CP     := Nil
	oWS:oWSEMPRESA:cCP         := Nil
	oWS:oWSEMPRESA:cDDD        := Str(FisGetTel(SM0->M0_TEL)[2],3)
	oWS:oWSEMPRESA:cFONE       := AllTrim(Str(FisGetTel(SM0->M0_TEL)[3],15))
	oWS:oWSEMPRESA:cFAX        := AllTrim(Str(FisGetTel(SM0->M0_FAX)[3],15))
	oWS:oWSEMPRESA:cEMAIL      := UsrRetMail(RetCodUsr())
	oWS:oWSEMPRESA:cNIRE       := SM0->M0_NIRE
	oWS:oWSEMPRESA:dDTRE       := SM0->M0_DTRE
	oWS:oWSEMPRESA:cNIT        := IIF(SM0->M0_TPINSC==1,SM0->M0_CGC,"")
	oWS:oWSEMPRESA:cINDSITESP  := ""
	oWS:oWSEMPRESA:cID_MATRIZ  := ""
	oWS:oWSOUTRASINSCRICOES:oWSInscricao := SPEDADM_ARRAYOFSPED_GENERICSTRUCT():New()
	oWS:_URL := AllTrim(cURL)+"/SPEDADM.apw"

	If oWs:ADMEMPRESAS()
		cIdEnt  := oWs:cADMEMPRESASRESULT
	Else
		Aviso("SPED",IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3)),{"Confirmar"},3)
	EndIf

	RestArea(aArea)

Return(cIdEnt)
