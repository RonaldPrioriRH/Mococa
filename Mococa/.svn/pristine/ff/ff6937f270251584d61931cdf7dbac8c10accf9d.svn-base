#include "protheus.ch"
#include "apvt100.ch"
#include "topconn.ch"
#include "RwMake.ch"

#DEFINE NEWLINE CHR(13)+CHR(10)

User function RACDA008()
	Local nQtCx 	//Quantidade de caixa
	Local nQtPorCx  //Quantidade por Caixa
	Local lContinua := .F.

	Local cNum     := PADR("000053",TAMSX3("C2_NUM")[1])
	Local cItem    := PADR("01",TAMSX3("C2_ITEM")[1])
	Local cSequen  := PADR("001",TAMSX3("C2_SEQUEN")[1])
	Local cItemGrd := PADR("",TAMSX3("C2_ITEMGRD")[1])

	Local cCodOrdemP := PADR(cNum+cItem+cSequen+cItemGrd,TAMSX3("CYY_NRORPO")[1])
	Local cCodOrdemF
	Local cEtqta:= space(TAMSX3("C2_NUM")[1]+TAMSX3("C2_ITEM")[1]+TAMSX3("C2_SEQUEN")[1])+" " //+TAMSX3("C2_ITEMGRD")[1]
	local cPerg:= "RACDA001"
	Local c_PdLt := ""
	Local d_OpPai := CtoD("")
	Local c_Qry := ""
	Local c_SeqMRP := ""
	Local n_RegSC2 := 0
	Local n_QtdTnt := 0
	Local aDifs := {}
	Local c_RegOP := " "
	Local a_Regs := {}

	Local cLetraMq :="A"

	Local cCodProFil
	Local cCodProPai
	Local cSilo:="01"

	Local cProdAtu:=""
	Local cLogRACD :=""
	Local nQtdMax := GetMv("MV_XMAXETQ")	
	Private lACD := .T.

	if alltrim(cModulo) <> "ACD"
		lACD := .F.
	endif

	if lACD

		If ! U_VerDtFl(.T.)
			Return
		Endif

		VtClear()
		nLin:=1

		@nLin,00 VtSay "Leia Etiqueta da OP:" //"Apontamento Produção"
		nLin++
		@nLin,00 VtGet cEtqta
		VtRead

		lRet:= .T.

		If VTLastkey() == 27  // Tecla ESC
			lRet := .F.
		EndIf

		if !lRet
			Return
		endif
		cEtqta := substr(cEtqta,1,len(cEtqta)-1)

		cLogRACD+="Etiqueta OP = '"+cEtqta+"'"+ chr(13)+ chr(10)
	else
		ValidPerg(cPerg)
		if !pergunte(cPerg)
			return
		endif

		cEtqta := MV_PAR01
		_cEtqPallet := MV_PAR02
	endif

	cNum:= substr(cEtqta,1,TAMSX3("C2_NUM")[1])
	cItem:= substr(cEtqta,TAMSX3("C2_NUM")[1]+1,TAMSX3("C2_ITEM")[1])
	cSequen := substr(cEtqta,TAMSX3("C2_NUM")[1]+TAMSX3("C2_ITEM")[1]+1,TAMSX3("C2_SEQUEN")[1])
	cItemGrd := PADR("",TAMSX3("C2_ITEMGRD")[1])//substr(cEtqta,TAMSX3("C2_NUM")[1]+TAMSX3("C2_ITEM")[1]+TAMSX3("C2_SEQUEN")[1]+1,TAMSX3("C2_ITEMGRD")[1])	
	cCodOrdemP := PADR(cNum+cItem+cSequen+cItemGrd,TAMSX3("CYY_NRORPO")[1])


	DbSelectarea("SC2")
	SC2->(DbSetOrder(1))
	If SC2->(DbSeek(xFilial("SC2")+cCodOrdemP))
		cCodProPai := SC2->C2_PRODUTO
		nQtTotOp := SC2->C2_QUANT
		nQtApOp := RetQtApon(SC2->C2_QUJE)
		d_OpPai := SC2->C2_DATPRI
		c_SeqMRP := SC2->C2_SEQMRP
		c_Opcional := SC2->C2_OPC

		cLogRACD+="Produto OP = '" + cCodProPai + "'"+ chr(13)+ chr(10)

		c_Qry := "SELECT G1_COMP "
		c_Qry += "FROM SG1010, SB1010 "
		c_Qry += "WHERE SG1010.D_E_L_E_T_ = ' ' AND SB1010.D_E_L_E_T_ = ' ' "
		c_Qry += "AND G1_FILIAL = '"+ xFilial("SG1") +"' "
		c_Qry += "AND B1_FILIAL = '"+ xFilial("SB1") +"' "
		c_Qry += "AND B1_COD = G1_COMP "
		c_Qry += "AND G1_COD = '" + cCodProPai + "' "
		c_Qry += "AND B1_TIPO = 'PA' "

		PlsQuery(c_Qry, "_Q01")

		If Eof()
			if lACD
				VTAlert("Nao foi encontrado Produto tipo PA no nivel 1 da estrutura do Produto Pai","Falha")
			else
				Alert("Nao foi encontrado Produto tipo PA no nivel 1 da estrutura do Produto Pai")
			endif
			_Q01->(DbCloseArea())
			Return
		Else

			c_PdLt := _Q01->G1_COMP

			Count to n_Reg
			If n_Reg >1
				if lACD
					VTAlert("Foi encontrado mais de 1 Produto tipo PA no nivel 1 da estrutura do Produto Pai","Falha")
				else
					Alert("Foi encontrado mais de 1 Produto tipo PA no nivel 1 da estrutura do Produto Pai")
				endif
				_Q01->(DbCloseArea())
				Return
			Endif
		Endif
		_Q01->(DbCloseArea())


		//Verifica se a OP foi aberta via MRP
		If c_SeqMRP <> ' '

			//Query ajustada para buscar a Op do produto unitário com data de produção inicial mais próxima
			//a data de produção do produto Bandeja
			c_Qry := " SELECT * FROM SC2010 "
			c_Qry += " WHERE D_E_L_E_T_ = ' ' "
			c_Qry += " AND C2_FILIAL = '"+ xFilial("SC2") +"' "
			c_Qry += " AND C2_PRODUTO = '"+ c_PdLt +"' "
			//c_Qry += "AND C2_DATPRI = '"+ DtoS(d_OpPai) +"' "
			c_Qry += " AND C2_DATPRI <= '"+DtoS(d_OpPai)+"' "
			c_Qry += " AND C2_SEQMRP = '"+ c_SeqMRP +"'"
			c_Qry += "  AND C2_OPC = '"+Alltrim(c_Opcional)+"' " 
			c_Qry += " ORDER BY C2_FILIAL,C2_DATPRI DESC "

			PlsQuery(c_Qry, "_Q01")

			If Eof()
				_Q01->(DbCloseArea())
			Endif
		EndIf

		//Tratativa para OPs abertas manualmente
		If !(Select("_Q01") > 0)

			if empty(c_SeqMRP)
				c_Qry := "SELECT * FROM SC2010 "
				c_Qry += "WHERE D_E_L_E_T_ = ' ' "
				c_Qry += "AND C2_FILIAL = '"+ xFilial("SC2") +"' "
				c_Qry += "AND C2_PRODUTO = '"+ c_PdLt +"' "
				//c_Qry += "AND C2_DATPRI = '"+ DtoS(d_OpPai) +"' "
				c_Qry += "AND C2_NUM = '"+ cNum +"'"

				PlsQuery(c_Qry, "_Q01")

				If !Eof()
					n_RegSC2 := _Q01->R_E_C_N_O_
				Else
					_Q01->(DbCloseArea())
					c_Qry := "SELECT * FROM SC2010 "
					c_Qry += "WHERE D_E_L_E_T_ = ' ' "
					c_Qry += "AND C2_FILIAL = '"+ xFilial("SC2") +"' "
					c_Qry += "AND C2_PRODUTO = '"+ c_PdLt +"' "
					//c_Qry += "AND C2_DATPRI = '"+ DtoS(d_OpPai) +"' "
					c_Qry += "AND C2_QUJE < C2_QUANT "

					PlsQuery(c_Qry, "_Q01")

					If ! Eof()
						Count to n_Reg
						If n_Reg = 1
							n_RegSC2 := _Q01->R_E_C_N_O_
						Else
							if lACD
								VTAlert("Não encontrado OP do Produto Unidade associado, (tratativa em desenvolvimento)","Falha")
							else
								Alert("Não encontrado OP do Produto Unidade associado, (tratativa em desenvolvimento)")
							endif
							_Q01->(DbCloseArea())
							Return
						Endif
					Else
						if lACD
							VTAlert("Não encontrado OP do Produto Unidade","Falha")
						else
							Alert("Não encontrado OP do Produto Unidade")
						endif
						_Q01->(DbCloseArea())
						Return
					Endif
				Endif
			else
				if lACD
					VTAlert("MRP:"+Alltrim(c_SeqMRP)+" - Não encontrado OP do Produto Unidade","Falha")
				else
					Alert("MRP:"+Alltrim(c_SeqMRP)+" - Não encontrado OP do Produto Unidade")
				endif
				_Q01->(DbCloseArea())
				Return
			endif
		Else
			n_RegSC2 := _Q01->R_E_C_N_O_
		Endif
		_Q01->(DbCloseArea())

		DbSelectarea("SC2")
		DbGoTo(n_RegSC2)
		//SC2->(DbOrderNickName("C2PDLT"))
		//If SC2->(DbSeek(xFilial("SC2") + c_PdLt + DtoS(d_OpPai)))
		cCodOrdemF := PADR(SC2->(C2_NUM+C2_ITEM+C2_SEQUEN+C2_ITEMGRD),TAMSX3("CYY_NRORPO")[1])
		cCodProFil := SC2->C2_PRODUTO
		cLogRACD+="Produto Filho = '"+cCodProFil+"'"+ chr(13)+ chr(10)
		dbSelectarea("SB5")
		SB5->(dbSetOrder(1))
		if SB5->(dbSeek(xFilial("SB5")+cCodProPai))
			dbselectarea("SB1")
			SB1->(DbSetOrder(1))
			if SB1->(DbSeek(xFilial("SB1")+cCodProPai))
				DbSelectarea("SG1")
				SG1->(DbSetOrder(1))
				if SG1->(DbSeek(xFilial("SG1")+cCodProPai+cCodProFil))
					nQtCx 	 := SB5->B5_QEL
					nQtCxBkp := nQtCx
					//TODO Verificar a variavel nQtPorCx
					nQtPorCx := SG1->G1_QUANT / iif(SB1->B1_QB > 0,SB1->B1_QB,1)  //SB5->B5_EAN144

					cLogRACD+="Quantidade de Caixa = '" + cvaltochar(nQtCx)+"'"+ chr(13)+ chr(10)
					cLogRACD+="Quantidade do Produto Filho Por Caixa = '" + cvaltochar(nQtPorCx)+"'"+ chr(13)+ chr(10)

					if nQtCx > 0
						if nQtPorCx > 0
							while .T.

								If ! U_VerDtFl(.T.)
									Return
								Endif
								nQtCx := nQtCxBkp
								nQtCx:= strzero(nQtCx,3)//Transform(nQtCx, "@E 999" )

								if lACD
									VtClear()
									nLin:=1
									_cEtqPallet := space(U_DecEtq() + 1) //14+TamSx3("D3_LOTECTL")[1]+5

									@nLin,00 VtSay "OP: "+cCodOrdemP //"Apontamento Produção"
									nLin++
									//TODO Pegar o saldo da OP quando menor q nQtCx
									@nLin,00 VtSay "Quantidade: " VtGet nQtCx //Picture "@E 999"

									nLin++
									@nLin,00 VtSay "Leia Etiq Pallet: "
									nLin++
									@nLin,00 VtGet _cEtqPallet

									nLin++
									@nLin,00 VtSay "Qt. Total: " + cvaltochar(nQtTotOP)
									nLin++
									@nLin,00 VtSay "Qt. Apontada: " + cvaltochar(nQtApOp)
									nLin++
									//TODO Ajustar para pegar o saldo das etiquetas nao apontadas 
									@nLin,00 VtSay "Saldo: " + cvaltochar(nQtTotOP - nQtApOp)

									VTKeyBoard( chr(13))

									VtRead

									If VTLastkey() == 27  // Tecla ESC
										exit
									EndIf

									VtClear()
								endif
								cLogRACD+="Etiqueta Pallet = '"+_cEtqPallet+"'"+ chr(13)+ chr(10)



								if VldEtq(_cEtqPallet,nQtdMax,cEtqta,(nQtTotOP - nQtApOp),Val(nQtCx))

									//Begin Transaction

									Reclock("Z0E",.T.)
									Replace Z0E_FILIAL	with xFilial("Z0E")
									Replace Z0E_OPP		with cCodOrdemP
									Replace Z0E_OPF		with cCodOrdemF
									Replace Z0E_QTDP	with Val(nQtCx)
									Replace Z0E_QTDF	with nQtPorCx
									Replace Z0E_ETIQ	with _cEtqPallet
									Replace Z0E_STATUS	with '1'
									Replace Z0E_MENS	with 'Aguardando Apontamento'
									Replace Z0E_DATA	with Date()
									Replace Z0E_HORA	with Time()
									Replace Z0E_USER	with cUserName

									MsUnLock()

									nQtApOp += Val(nQtCx)

									//End Transaction

									DbCommit()

								endif

								if !lACD
									exit
								endif

							EndDo
						else
							if lACD
								VTAlert("Produto "+cCodProFil+" com quantidade invalida na estrutura.",AllTrim("Falha"))
							else
								Alert("Produto "+cCodProFil+" com quantidade inválida na estrutura.")
							endif

						endif
					else
						if lACD
							VTAlert("Produto "+cCodProPai+" com quantidade invalida informada no campo Qtd na Estrutura.",AllTrim("Falha"))
						else
							Alert("Produto "+cCodProPai+" com quantidade inválida informada no campo Qtd na Estrutura.")
						endif

					endif
				else
					if lACD
						VTAlert("Produto "+cCodProPai+" e complemento "+cCodProFil+"  nao encontrados na tabela SG1.",AllTrim("Falha"))
					else
						Alert("Produto "+cCodProPai+" e complemento "+cCodProFil+"  nao encontrados na tabela SG1.")
					endif

				endif
			else
				if lACD
					VTAlert("Produto "+cCodProPai+" nao encontrado na tabela SB1.",AllTrim("Falha"))
				else
					Alert("Produto "+cCodProPai+" nao encontrado na tabela SB1.")
				endif

			endif
		else
			if lACD
				VTAlert("Produto "+cCodProPai+" nao encontrado na tabela SB5.",AllTrim("Falha"))
			else
				Alert("Produto "+cCodProPai+" nao encontrado na tabela SB5.")
			endif

		endif
	else
		if lACD
			VTAlert("Ordem de Preducao "+cCodOrdemP+" nao encontrada.",AllTrim("Falha"))
		else
			Alert("Ordem de Preducao "+cCodOrdemP+" nao encontrada.")
		endif

	endif
	MsUnlockAll()

	DbUnlockAll() 

return

Static Function ApontaAtuo(cOrdemProd,cOperacao,cMaquina,nQtdApont,aMsgRet,lfilho)
	Local aCabec := {}
	Local lRet := .T.
	local i
	Local lTemSplit := .T.
	Local cNovoSplit:=""
	Local _cSplit      := ""
	Local nI := 0

	PRIVATE lMsErroAuto := .F.
	Private lAutoErrNoFile 	:= .F.


	lAutoErrNoFile 	:= .T.

	//se tiver apenas uma máquina, aa função PosiSplit pode dar problema

	dbselectarea("CYY")
	CYY->(DbSetOrder(7)) //CYY_FILIAL+CYY_NRORPO+CYY_IDAT+CYY_CDMQ (Ord Prod + ID Oper SFC + Maquina)	
	if (!CYY->(DbSeek(xFilial("CYY") + cOrdemProd + cOperacao + cMaquina))) .OR. (CYY->CYY_QTAT - CYY->CYY_QTATRP < nQtdApont)
		lTemSplit := .F.
		if CYY->(dbSeek(xFilial("CYY") + cOrdemProd + cOperacao))
			While (!CYY->(EOF())) .AND. (CYY->(CYY_FILIAL+CYY_NRORPO+CYY_IDAT) == xFilial("CYY") + cOrdemProd + cOperacao)
				if CYY->CYY_QTAT - CYY->CYY_QTATRP >= nQtdApont
					ACDConOut({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio Dividindo Split"})

					lTemSplit := SFCA315D(cOrdemProd, cOperacao, CYY->CYY_IDATQO, .F., CYY->CYY_QTAT - (nQtdApont)) // Dividir Split

					ACDConout({cFilAnt+" - "+cOrdemProd, cOperacao, CYY->CYY_IDATQO, .F., CYY->CYY_QTAT - (nQtdApont),'Retorno',lTemSplit})

					ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim Dividindo Split"})
					if lTemSplit
						ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio PosiSplit 01"})

						cNovoSplit := PosiSplit(cOrdemProd,cOperacao,space(tamsx3("CYY_CDMQ")[1]),nQtdApont,@aMsgRet)

						ACDConout({cFilAnt+" - "+cOrdemProd,cOperacao,space(tamsx3("CYY_CDMQ")[1]),nQtdApont,"Retorno",cNovoSplit})

						ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim PosiSplit 01"})

						if !empty(cNovoSplit)
							ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio Aloca Split"})

							lTemSplit := SFCA315A(cOrdemProd, cOperacao, cNovoSplit, .F., cMaquina) //Alocar Slip

							ACDConout({cFilAnt+" - "+cOrdemProd, cOperacao, cNovoSplit, .F., cMaquina,'Retorno',lTemSplit})
							ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim Aloca Split"})

							//lRet := UnirSplit(cOrdemProd,cOperacao,cMaquina,cNovoSplit)  //SFCA315U

							ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio UnirSplit"})
							ACDConout({cFilAnt+" - "+cOrdemProd,cOperacao,cMaquina,cNovoSplit})

							UnirSplit(cOrdemProd,cOperacao,cMaquina,cNovoSplit,@aMsgRet)  //SFCA315U

							ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim UnirSplit"})
						else
							lTemSplit := .F.
						endif
					endif
					if lTemSplit
						exit
					endif

				endif
				CYY->(dBSkip())
			end

			if !lTemSplit
				AtuZ0E("Não existe split com saldo Suficiente"+chr(13)+chr(10)+"Ordem Produção: "+cOrdemProd,,,@aMsgRet)

				lRet:=.F.
			endif
		else
			AtuZ0E("Não existe Split para esta Ordem de Produção."+chr(13)+chr(10)+"Ordem Produção: "+cOrdemProd,,,@aMsgRet)

			lRet:=.F.
		endif
	endif

	if lRet

		ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio PosiSplit 02"})
		ACDConout({cFilAnt+" - "+cOrdemProd,cOperacao,cMaquina,nQtdApont})

		_cSplit := PosiSplit(cOrdemProd,cOperacao,cMaquina,nQtdApont,@aMsgRet)   //PosiSplit(cOrdemProd,cOperacao,cMaquina,nQtdApont+1) --> Retirado pois dava erro de Não tem Splits disponíveis

		ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim PosiSplit 02"})

		if !(empty(_cSplit))
			cCDMQ := cMaquina
			cIDATQO := _cSplit
			cIDAT := cOperacao
			cNRORPO := cOrdemProd
			nQTAPRP := nQtdApont
			cCDOE := CBRETOPE()//Operador logado

			aHora := RetHora(cCDMQ,@aMsgRet,lFilho,Alltrim(DtoS(Z0E->Z0E_DATA))+Alltrim(Z0E->Z0E_HORA),Alltrim(Z0E->Z0E_ETIQ))
			dDtIn:=  aHora[1]
			cHrIn := aHora[2]
			dDtFi := aHora[3]
			cHrFi := aHora[4]
			cCeTrab      := ""

			//Inserido tratamento para mensagem a680hora
			//Data,hora e minuto final da produção não pode ser o mesmo da data, hora e minuto inicial 
			//30/12/2017

			nTempoOper := A680Tempo(dDtIn, Substr(cHrIn,1,5), dDtFi, Substr(cHrFi,1,5))

			if nTempoOper <=0 
				//				AtuZ0E("Tempo da operação de apontamento abaixo do limite permitido! "+chr(13)+chr(10)+;
				//				"Data/Hora Inicial: "+dtoc(dDtIn)+"-"+cHrIn+chr(13)+chr(10)+;
				//				"Data/Hora Final  : "+dtoc(dDtFi)+"-"+cHrFi,,,@aMsgRet)
				//				return( .f. )
				nHor  :=  Val(Substr(cHrFi,1,2))
				nMin  :=  Val(Substr(cHrFi,4,2))
				nSeg  :=  Val(Substr(cHrFi,7,2))

				//				ConOut("Alteração de Data/Hora "+ AllTrim(Z0E->Z0E_ETIQ)  +" de")
				//				ConOut(dDtIn, Substr(cHrIn,1,5), dDtFi, Substr(cHrFi,1,5))
				//				ConOut("nTempoOper",nTempoOper)

				nMin++
				if nMin > 59
					nMin := 00
					nHor++
					if nHor > 23
						nHor := 00
						dDtFi+= 1
					endif
				endif

				cHrFi := StrZero(nHor,2)+":"+StrZero(nMin,2)+":"+StrZero(nSeg,2)

				nTempoOper := A680Tempo(dDtIn, Substr(cHrIn,1,5), dDtFi, Substr(cHrFi,1,5))

				aHora[3] := dDtFi
				aHora[4] := cHrFi

				//				ConOut("para")
				//				ConOut(dDtIn, Substr(cHrIn,1,5), dDtFi, Substr(cHrFi,1,5))
				//				ConOut("nTempoOper",nTempoOper)
			endif




			//O tratamento abaixo foi necessário, para o seguinte caso:
			//Ultima etiqueta lida: 31/12/2017 as 18h22
			//Etiqueta atual: 01/01/2018 as 10h43
			//Lote do Granel gerado em 01/01/2018
			//Com isso, a data de criação do saldo do Granel ficou superior a data do inicio da OP
			//e o sistema não enxerga que existe saldo para apontamento na data de inicio da OP do envaze 
			if nTempoOper  > 2 .and. dDtIn < dDtFi
				dDtIn := dDtFi
				cHrIn := "00:01:00"
				aHora[1] := dDtIn
				aHora[2] := cHrIn
			endif

			if !A314VlOpe(cNRORPO,cIDAT,@aMsgRet)
				return .F.
			endif

			if ! A314VlSp(cNRORPO,cIDAT,cIDATQO,@aMsgRet)
				return .F.
			endif

			// Grava Inicio
			//Begin Transaction
			lFinIni      := .F.
			cCDTR:='01'
			cTPTR:= ""
			if !A314VlTr(cCDTR,@aMsgRet)
				return .F.
			endif

			if !A314VlQt(@aMsgRet)
				return .F.
			endif

			//Grava informações A314Grava
			ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio A314Grava() - Grava Apontamento na tabela CZH 01"})

			lRet := A314Grava(@aMsgRet) //Grava Apontamento na tabela CZH

			ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim A314Grava() - Grava Apontamento na tabela CZH 01"})

			If lRet
				//Grava informações SFC A314Auto
				ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio Envia movimentações para o módulo SFC 01"})

				lRet := ACDV314(cNRORPO,cIDAT,cIDATQO,cCDMQ,@aMsgRet) //Envia movimentações para o módulo SFC

				//				ConOut("lRet",lRet)

				ACDConout({cFilAnt+" - "+cNRORPO,cIDAT,cIDATQO,cCDMQ,'Retorno',lRet})
				ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim Envia movimentações para o módulo SFC 01"})

				if lRet
					cHrIn := aHora[2]//Time()
					cHrFi := aHora[4]//Time()
					// Grava Apontamento

					lFinIni      := .F.

					cCDTR:='02'
					cTPTR:= ""
					if !A314VlTr(cCDTR,@aMsgRet)
						return .F.
					endif

					if !A314VlQt(@aMsgRet)
						return .F.
					endif

					//Grava informações A314Grava
					ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio A314Grava() - Grava Apontamento na tabela CZH 02"})
					lRet := A314Grava(@aMsgRet) //Grava Apontamento na tabela CZH
					ACDConout({cFilAnt+" - "+'Retorno',lRet})
					ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim A314Grava() - Grava Apontamento na tabela CZH 02"})

					If lRet
						//Grava informações SFC A314Auto
						ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio Envia movimentações para o módulo SFC 02"})

						lRet := ACDV314(cNRORPO,cIDAT,cIDATQO,cCDMQ,@aMsgRet) //Envia movimentações para o módulo SFC

						ACDConout({cFilAnt+" - "+cNRORPO,cIDAT,cIDATQO,cCDMQ,'Retorno',lRet})
						ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim Envia movimentações para o módulo SFC 02"})
					Endif
				endif
			endif
			If !lRet

				//				aErroAuto := GetAutoGRLog()
				//
				//				c_Txt := ""
				//
				//				For nI := 1 To Len(aErroAuto)
				//					c_Txt += aErroAuto[nI] + Chr(13) + Chr(10)
				//				Next
				//
				//				cMsgErr := "Falha execauto!" + CRLF
				//
				//				ACDConout({"ACD - "+ cMsgErr + c_Txt})
				//
				//				cMsgErr += U_NoChrEsp(c_Txt)
				//
				//				AtuZ0E(cMsgErr)

				//DisarmTransaction()
			Endif
			//End Transaction

		else
			AtuZ0E("Nao existe Slipts disponiveis.",,,@aMsgRet)

			lRet := .F.
		endif
	endif
Return lRet



//Posiciona no ultimo split da máquina
static function PosiSplit(cOrdem,cOper,cMaq,nQtdApont,aMsgRet)
	Local aArea:=GetArea()
	Local aAreaCYY := CYY->(GetArea())
	Local cRet:= ""

	dbselectarea("CYY")
	CYY->(DbSetOrder(7)) //CYY_FILIAL+CYY_NRORPO+CYY_IDAT+CYY_CDMQ (Ord Prod + ID Oper SFC + Maquina)
	if CYY->(DbSeek(xFilial("CYY") + cOrdem + cOper + cMaq))
		While (!CYY->(EOF())) .AND. (CYY->(CYY_FILIAL+CYY_NRORPO+CYY_IDAT+CYY_CDMQ) == xFilial("CYY") + cOrdem + cOper + cMaq)
			if (CYY->CYY_QTAT - CYY->CYY_QTATRP >= nQtdApont)
				cRet := CYY->CYY_IDATQO
			endif
			CYY->(dBSkip())
		end
	endif

	restarea(aAreaCYY)
	restarea(aArea)
return cRet

Static function UnirSplit(cOrdemProd,cOperacao,cMaquina,cSplit1,aMsgRet)  //SFCA315U
	Local aArea:=GetArea()
	Local aAreaCYY := CYY->(GetArea())
	Local aRetorno := {}
	Local aErro    := {}
	Local oModelCYY
	Local cNRORPO  // Ordem Split 1
	Local cNRORPO2 // Ordem Split 2
	Local cIDAT     // Operação Split 1
	Local cIDAT2   // Operação Split 2
	Local cIDATQO  // Split 1
	Local cIDATQO2 // Split 2
	Local cTPSTAT  // Estado Split 1
	Local cTPSTAT2 // Estado Split 2
	Local nQTAT    // Qtd Prevista Split 1
	Local nQTAT2   // Qtd Prevista Split 2
	Local nNovaQTD
	Local lRet     := .F.

	dbselectarea("CYY")
	CYY->(DbSetOrder(1)) //CYY_FILIAL+CYY_NRORPO+CYY_IDAT+CYY_IDATQO (Ord Prod + ID Oper SFC + Split)
	if (CYY->(DbSeek(xFilial("CYY") + cOrdemProd + cOperacao + cSplit1)))
		cNRORPO := CYY->CYY_NRORPO
		cIDAT   := CYY->CYY_IDAT
		cIDATQO := CYY->CYY_IDATQO
		cTPSTAT := CYY->CYY_TPSTAT
		nQTAT   := CYY->CYY_QTAT

		CYY->(DbSetOrder(7)) //CYY_FILIAL+CYY_NRORPO+CYY_IDAT+CYY_CDMQ (Ord Prod + ID Oper SFC + Maquina)
		if (CYY->(DbSeek(xFilial("CYY") + cOrdemProd + cOperacao + cMaquina)))
			while (!(CYY->(EOF()))) .AND. CYY->(CYY_FILIAL+CYY_NRORPO+CYY_IDAT+CYY_CDMQ) == xFilial("CYY") + cOrdemProd + cOperacao + cMaquina
				if alltrim(CYY->CYY_IDATQO) <> alltrim(cIDATQO) .AND. CYY->CYY_TPSTAT <> '5'

					ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio Verifica se existe apontamento de produção em aberto para split"})
					// Verifica se existe apontamento de produção em aberto para split
					lRet := SFCApAbeSp(CYY->CYY_NRORPO, CYY->CYY_IDAT, CYY->CYY_IDATQO)

					ACDConout({cFilAnt+" - "+CYY->CYY_NRORPO, CYY->CYY_IDAT, CYY->CYY_IDATQO,'Retorno',lRet})
					ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim Verifica se existe apontamento de produção em aberto para split"})

					IF !lRet
						Exit
					Endif

					cNRORPO2 := CYY->CYY_NRORPO
					cIDAT2   := CYY->CYY_IDAT
					cIDATQO2 := CYY->CYY_IDATQO
					cTPSTAT2 := CYY->CYY_TPSTAT
					nQTAT2   := CYY->CYY_QTAT
				endif
				CYY->(dBSkip())
			end
		Endif

		if lRet

			if lRet .AND.;
			(cTPSTAT  == '5' .OR.;
			cTPSTAT2 == '5')
				AtuZ0E('Splits nao podem estar finalizados',,,@aMsgRet) //
				lRet := .F.
			Endif

			if lRet .AND.;
			cTPSTAT  == '4' .AND.;
			cTPSTAT2 == '4'
				AtuZ0E('Somente um dos Splits pode estar iniciado',,,@aMsgRet) //
				lRet := .F.
			Endif

			if lRet
				//Begin Transaction

				dbSelectArea('CYY')
				CYY->(dbSetOrder(1))

				IF cTPSTAT2 == '4'
					CYY->(dbSeek(xFilial('CYY')+cNRORPO2+cIDAT2+cIDATQO2))
				Else
					CYY->(dbSeek(xFilial('CYY')+cNRORPO+cIDAT+cIDATQO))
				Endif

				dbSelectArea('CYI')
				CYI->(dbSetOrder(1))
				CYI->(dbSeek(xFilial('CYI')+CYY->CYY_CDCETR))

				nNovaQTD := CYY->CYY_QTAT + IF(cTPSTAT2=='4',nQTAT,nQTAT2)

				oModelCYY := FWLoadModel('SFCA315')
				oModelCYY:SetOperation(4)
				oModelCYY:Activate()

				ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio SFCA314OPER"})
				aRetorno := SFCA314OPER ( CYY->CYY_CDCETR, CYY->CYY_NRORPO, CYY->CYY_IDAT, nNovaQTD, 2, CYY->CYY_CDFE )

				ACDConout({cFilAnt+" - "+CYY->CYY_CDCETR, CYY->CYY_NRORPO, CYY->CYY_IDAT, nNovaQTD, 2, CYY->CYY_CDFE,'Retorno',aRetorno })
				ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim SFCA314OPER"})

				oModelCYY:SetValue( 'CYYMASTER', 'CYY_QTAT'  , nNovaQTD)
				oModelCYY:SetValue( 'CYYMASTER', 'CYY_QTPAMQ', if(CYI->CYI_TPPC == '4',0,aRetorno[1]))
				oModelCYY:SetValue( 'CYYMASTER', 'CYY_QTPAOE', if(CYI->CYI_TPPC != '4',0,aRetorno[1]))
				oModelCYY:SetValue( 'CYYMASTER', 'CYY_QTVMAT', aRetorno[2])
				oModelCYY:SetValue( 'CYYMASTER', 'CYY_QTPAAT', aRetorno[1])

				if oModelCYY:VldData()
					oModelCYY:CommitData()
				Else
					aErro := oModelCYY:GetErrorMessage()
					AtuZ0E(aErro[6],,,@aMsgRet)
					lRet := .F.
				Endif
				oModelCYY:DeActivate()

				if !lRet
					//DisarmTransaction()
				Endif

				IF cTPSTAT2 == '4'
					CYY->(dbSeek(xFilial('CYY')+cNRORPO+cIDAT+cIDATQO))
				Else
					CYY->(dbSeek(xFilial('CYY')+cNRORPO2+cIDAT2+cIDATQO2))
				Endif

				//				ConOut("FWLoadModel('SFCA315')",Z0E->Z0E_ETIQ)
				oModelCYY := FWLoadModel('SFCA315')
				oModelCYY:SetOperation(5)
				oModelCYY:Activate()

				if oModelCYY:VldData()

					oModelCYY:CommitData()
				Else
					aErro := oModelCYY:GetErrorMessage()
					AtuZ0E(aErro[6],,,@aMsgRet)
					lRet := .F.
				Endif
				oModelCYY:DeActivate()

				if !lRet
					//DisarmTransaction()
				Else
					//_MaqSFC310:= cMaquina
					//SFCA310P(.F.)
				Endif

				//End Transaction
			Endif
		Endif
	endif
	restarea(aAreaCYY)
	restarea(aArea)
return lRet
//return

Static Function A314Grava(aMsgRet)
	Local oModelCYY
	Local aData   := A314ADtIn(cNRORPO,cIDAT,cIDATQO,cCDMQ,@aMsgRet)
	Local lRet    := .T.
	Local cTpTran := Space(1)

	If cTPTR == "2" .Or. lFinIni   //Finaliza split inicial
		dbSelectArea("CZH")
		dbSetOrder(4)
		If CZH->(dbSeek(xFilial("CZH")+cNRORPO+cIDAT+cIDATQO+"1"))
			While CZH->(!Eof()) .And. xFilial("CZH")+cNRORPO+cIDAT+cIDATQO+"1" == CZH->(CZH_FILIAL+CZH_NRORPO+CZH_IDAT+CZH_IDATQO+CZH_STTR)
				cTpTran := A314GtTr(CZH->CZH_CDTR,2,@aMsgRet)
				If cTpTran == "1" .And. Empty(CZH->CZH_DTRPED) .And. Empty(CZH->CZH_HRRPED)
					Exit
				Endif
				CZH->(DbSkip())
			End
		EndIf

		Reclock("CZH",.F.)
		CZH->CZH_DTRPED := dDtFi
		CZH->CZH_HRRPED := cHrFi
		CZH->(MsUnLock())
	Endif

	dbSelectArea("CZH")
	RecLock("CZH",.T.) // Cria Split de Movimentação
	CZH->CZH_FILIAL := xFilial("CZH")
	CZH->CZH_NRORPO := cNRORPO
	CZH->CZH_CDOE   := cCDOE
	CZH->CZH_IDAT   := cIDAT
	CZH->CZH_IDATQO := cIDATQO
	CZH->CZH_CDMQ   := cCDMQ
	CZH->CZH_CDTR   := cCDTR
	CZH->CZH_TPTR   := cTPTR
	CZH->CZH_STTR   := "1" //Pendente de envio ao Chão de Fábrica

	If cTPTR == "1" //Iniciar Produção
		CZH->CZH_DTRPBG := dDtIn
		CZH->CZH_HRRPBG := cHrIn
	Endif

	//Produção
	If cTPTR $ "245"
		CZH->CZH_DTRPBG    := aData[1]
		CZH->CZH_HRRPBG    := aData[2]
		If !GetMV('MV_SFCAPON') .And. cTPTR != "2" .And. !lFinIni
			CZH->CZH_DTRPED := CZH->CZH_DTRPBG
			CZH->CZH_HRRPED := SumTime(CZH->CZH_HRRPBG)
		Else
			CZH->CZH_DTRPED := dDtFi
			CZH->CZH_HRRPED := cHrFi
		Endif
		CZH->CZH_QTAPRP := nQTAPRP
	Endif

	If cTPTR $ "5"
		CZH->CZH_CDRF := cCDRF
	Endif

	CZH->(MsUnLock())
	//CZH->(dbCloseArea())

	If cTPTR == "1" .And. lRet //Se transação inicial, alocar máquina para o split
		dbSelectArea("CYY")
		CYY->(dbSetOrder(1))
		CYY->(dbGoTop())
		If CYY->(dbSeek(xFilial("CYY")+cNRORPO+cIDAT+cIDATQO))
			If Empty(CYY_CDMQ)
				oModelCYY := FWLoadModel( "SFCA315" )
				oModelCYY:SetOperation( 4 )
				oModelCYY:Activate()

				oModelCYY:SetValue( "CYYMASTER", "CYY_CDMQ", cCDMQ)
				if oModelCYY:VldData()
					if !oModelCYY:CommitData()
						lRet := .F.
					endif
					oModelCYY:DeActivate()
				else
					lRet := .F.
				endif
			Endif
		Endif
	Endif

Return lRet

static function ACDV314(cOp, cOper, cSplit, cMaq,aMsgRet)
	Local l_Ret := .F.

	l_Ret := A314Auto(cOp, cOper, cSplit, cMaq,@aMsgRet)

return l_Ret 

Static Function A314Auto(cOp, cOper, cSplit, cMaq,aMsgRet)
	Local nI
	Local nX
	Local oModel
	Local oModelCY0
	Local oModelCYW
	Local oModelCZ0
	Local nQtdAp := 0
	Local nQtdRf := 0
	Local nQtdRt := 0
	Local nQtdRp := 0
	Local dDtFim
	Local cHrFim
	Local dDtIni
	Local cHrIni
	Local aRefugo    := {}
	Local cTpTran    := Space(1)
	Local aOperador  := {}
	Local aFerrament := {}
	Local lEmpPrev   := If(SuperGetMV("MV_QTDPREV")== "S",.T.,.F.)
	Local cLocProc   := GetMv("MV_LOCPROC")
	Local lIndireto  
	Local nW := 0

	If cTPTR != "2" .And. !lFinIni //Envia informações para o Chão de Fábrica
		Return .T.
	Endif

	If !IsInCallStack("SFCA310")
		Private _IsSFCA318 := .F.
	Endif

	aOperador  := A314CarOE(@aMsgRet)
	aFerrament := A314CarFR(@aMsgRet)

	//Posicionar no split para ativar o model
	DbSelectArea("CYY")
	CYY->(DbSetOrder(1))
	If CYY->(!DbSeek(xFilial("CYY")+cOp+cOper+cSplit))
		Return .F.
	Endif

	// Instancia o modelo
	oModel := FWLoadModel( "SFCA314" )
	oModel:SetOperation( 3 ) //incluir apontamento
	If !oModel:Activate()
		AtuZ0E(AllTrim("Erro")+": "+oModel:GetErrorMessage()[6] +", " + oModel:GetErrorMessage()[5],,,@aMsgRet)

		Return .F.
	EndIf

	oModelCY0 := oModel:GetModel( "CY0DETAIL" )

	DbSelectArea("CZH")
	CZH->(DbSetOrder(4))

	If CZH->(dbSeek(xFilial("CZH")+cOp+cOper+cSplit+"1"))
		While CZH->(!Eof()) .And.;
		CZH->CZH_FILIAL    == xFilial("CZH")   .And. ;
		CZH->CZH_NRORPO    == cOp              .And. ;
		CZH->CZH_IDAT      == cOper            .And. ;
		CZH->CZH_IDATQO    == cSplit           .And. ;
		CZH->CZH_STTR      == "1"

			cTpTran := A314GtTr(CZH->CZH_CDTR,2,@aMsgRet)
			If cTpTran == "1" //Inicialização
				oModel:SetValue("CYVMASTER","CYV_NRORPO",CZH->CZH_NRORPO)
				oModel:SetValue("CYVMASTER","CYV_IDAT"  ,CZH->CZH_IDAT)
				oModel:SetValue("CYVMASTER","CYV_IDATQO",CZH->CZH_IDATQO)
				oModel:SetValue("CYVMASTER","CYV_CDMQ"  ,CZH->CZH_CDMQ)
				oModel:SetValue("CYVMASTER","CYV_DTRPBG",CZH->CZH_DTRPBG)
				oModel:SetValue("CYVMASTER","CYV_HRRPBG",CZH->CZH_HRRPBG)
				dDtIni := CZH->CZH_DTRPBG
				cHrIni := CZH->CZH_HRRPBG
				dDtFim := CZH->CZH_DTRPED
				cHrFim := CZH->CZH_HRRPED
				oModel:SetValue("CYVMASTER","CYV_DTRPED",CZH->CZH_DTRPED)
				oModel:SetValue("CYVMASTER","CYV_HRRPED",CZH->CZH_HRRPED)			
				//oModel:SetValue("CYVMASTER","CYV_DTRP",CZH->CZH_DTRPED)
				//oModel:SetValue("CYVMASTER","CYV_HRRP",CZH->CZH_HRRPED)
				
				//Alterado Kleber 06/04/2018
				//enviar para a geração 
				oModel:SetValue("CYVMASTER","CYV_DTRP",CZH->CZH_DTRPBG)
				oModel:SetValue("CYVMASTER","CYV_HRRP",CZH->CZH_HRRPBG)

				//				ConOut(cFilAnt+"-"+Alltrim(Z0E->Z0E_OPP)+" --- "+Z0E->Z0E_ETIQ +"CYV_DTRPBG",CZH->CZH_DTRPBG)
				//				ConOut(cFilAnt+"-"+Alltrim(Z0E->Z0E_OPP)+" --- "+Z0E->Z0E_ETIQ +"CYV_HRRPBG",CZH->CZH_HRRPBG)
				//				ConOut(cFilAnt+"-"+Alltrim(Z0E->Z0E_OPP)+" --- "+Z0E->Z0E_ETIQ +"CYV_DTRPED",CZH->CZH_DTRPED) 
				//				ConOut(cFilAnt+"-"+Alltrim(Z0E->Z0E_OPP)+" --- "+Z0E->Z0E_ETIQ +"CYV_HRRPED",CZH->CZH_HRRPED)
			Endif

			If cTpTran $ "24" //Aprovada
				nQtdAp += CZH->CZH_QTAPRP
			Endif

			If cTpTran == "5" //Refugo
				nQtdRf += CZH->CZH_QTAPRP

				A314AddRe(aRefugo,1,CZH->CZH_CDRF, CZH->CZH_QTAPRP,@aMsgRet)
			Endif

			CZH->(DbSkip())
		End
	EndIf

	nQtdRp = nQtdAp + nQtdRf
	If nQtdRp <= 0
		Return .F.
	Endif

	If oModelCY0:Length() == 1
		oModelCY0:GoLine( 1 )
		oModelCY0:DeleteLine()
	Endif

	//Adiciona quantidades refugadas e retrabalhadas, e seus respectivos motivos
	For nI := 1 To Len(aRefugo)
		oModelCY0:AddLine()
		oModelCY0:SetValue("CY0_CDRF",aRefugo[nI][1])
		If aRefugo[nI][2] > 0
			oModelCY0:SetValue("CY0_QTRF",aRefugo[nI][2])
		Endif
	Next

	oModel:SetValue("CYVMASTER","CYV_QTATRP",nQtdRp)
	oModel:SetValue("CYVMASTER","CYV_QTATRF",nQtdRf)
	oModel:SetValue("CYVMASTER","CYV_QTATRT",nQtdRt)
	oModel:SetValue("CYVMASTER","CYV_QTATAP",nQtdAp)
	oModel:SetValue("CYVMASTER","CYV_DTRPBG",dDtIni)
	oModel:SetValue("CYVMASTER","CYV_HRRPBG",cHrIni)
	oModel:SetValue("CYVMASTER","CYV_DTRPED",dDtFim)
	oModel:SetValue("CYVMASTER","CYV_HRRPED",cHrFim)	
	oModel:SetValue("CYVMASTER","CYV_DTRP",dDtFim)
	oModel:SetValue("CYVMASTER","CYV_HRRP",cHrFim)
	oModel:SetValue("CYVMASTER","CYV_CDLOSR", cLoteOp)

	oModelCYW := oModel:GetModel( "CYWDETAIL" )

	For nI := 1 To Len(aOperador)
		If nI > 1
			oModelCYW:AddLine()
		Else
			oModelCYW:GoLine(nI)
		Endif
		If aOperador[nI][1] == '1'
			oModelCYW:SetValue("CYW_CDOE",aOperador[nI][2])
		Else
			oModelCYW:SetValue("CYW_CDGROE",aOperador[nI][2])
		Endif
		oModelCYW:SetValue("CYW_DTBGRP",dDtIn)
		oModelCYW:SetValue("CYW_HRBGRP",cHrIn)
		oModelCYW:SetValue("CYW_DTEDRP",dDtFi)
		oModelCYW:SetValue("CYW_HREDRP",cHrFi)
	Next nI

	oModelCZ0 := oModel:GetModel( "CZ0DETAIL" )

	For nI := 1 To Len(aFerrament)
		If nI > 1
			oModelCZ0:AddLine()
		Else
			oModelCZ0:GoLine(nI)
		Endif
		oModelCZ0:SetValue("CZ0_CDFE",aFerrament[nI])
	Next nI

	oModelCZP := oModel:GetModel( "CZPDETAIL" )

	aProds:= {}
	//Seta o Lote do produto
	For nI :=1 to oModelCZP:Length()
		oModelCZP:GoLine(nI)
		cProdLote := alltrim(oModelCZP:GetValue('CZP_CDMT'))

		//		if Rastro(cProdLote,"L")
		//			nB8 := 0
		//			nB2 := 0
		//			if DivB2xB8(cProdLote,oModelCZP:GetValue('CZP_CDDP'),@nB2,@nB8)
		//				AtuZ0E("Desbalanceamento de saldos SB2xSB8 "+chr(13)+chr(10)+;
		//				"Produto: "+cProdLote+;
		//				"Armazém: "+oModelCZP:GetValue('CZP_CDDP')+chr(13)+chr(10)+;
		//				"Quantidade Física (SB2): "+Alltrim(Str(nB2))+chr(13)+chr(10)+;
		//				"Quantidade Lote (SB8): "+Alltrim(Str(nB8)),,,@aMsgRet)
		//				return .f.
		//			endif
		//		endif

		if alltrim(cProdLote) == alltrim(cCodProFil) // Produto unitário sendo consumido pela caixa com vários
			IF oModelCZP:GetValue('CZP_QTRPPO') == 0
				nQtdConsumo := QtdConsumo(cOp,oModelCZP:GetValue('CZP_CDMT'),oModelCZP:GetValue('CZP_QTRPPO'),nQtdAp)
				oModelCZP:SetValue('CZP_QTRPPO',nQtdConsumo)
			endif
			oModelCZP:SetValue('CZP_CDLO',cLoteOp)
		else
			DbSelectarea("SB5")
			SB5->(DbSetOrder(1))
			if SB5->(DbSeek(xFilial("SB5")+cProdLote)) .AND. SB5->B5_TIPUNIT == '0' //Produto unitário consumindo granel
				IF oModelCZP:GetValue('CZP_QTRPPO') == 0
					nQtdConsumo := QtdConsumo(cOp,oModelCZP:GetValue('CZP_CDMT'),oModelCZP:GetValue('CZP_QTRPPO'),nQtdAp)
					oModelCZP:SetValue('CZP_QTRPPO',nQtdConsumo)
				endif

				oModelCZP:SetValue('CZP_CDLO',substr(cLoteOp,1,10))
				oModelCZP:SetValue('CZP_CDDP',substr(cLoteOp,9,2))
			else
				if rastro(cProdLote,"L") //Se produto controla rastro
					nQtdConsumo := QtdConsumo(cOp,oModelCZP:GetValue('CZP_CDMT'),oModelCZP:GetValue('CZP_QTRPPO'),nQtdAp)
					if nQtdConsumo == 0
						AtuZ0E("Não foi possível determinar o saldo a ser requisitado! "+chr(13)+chr(10)+;
						"Produto: "+oModelCZP:GetValue('CZP_CDMT')+;
						"Ordem de Produção: "+cOP,,,@aMsgRet)
						return .f.
					endif
					aLotes := loteapt(oModelCZP:GetValue('CZP_CDMT'),nQtdConsumo,@aMsgRet)
					if len(aLotes) > 0

						nQtdConf := 0
						cLotesDisp := ""
						For nW :=1 to len(aLotes)
							nQtdConf += aLotes[nW][2]
							cLotesDisp += "Local: "+ aLotes[nW][3] +" Lote: "+aLotes[nW,1]+" Qtd: "+Alltrim(Str(aLotes[nW,2]))+chr(13)+chr(10)
						next nW

						if nQtdConf < oModelCZP:GetValue('CZP_QTRPPO') 
							AtuZ0E("Produto com saldo insuficiente nos lotes do armazém "+Alltrim(oModelCZP:GetValue('CZP_CDDP'))+"."+ chr(13)+ chr(10)+"Produto: "+ alltrim(oModelCZP:GetValue('CZP_CDMT'))+chr(13)+chr(10)+;
							" Lotes diposníveis: "+ chr(13)+ chr(10)+;
							cLotesDisp+chr(13)+chr(10)+;
							" Qtd Necessária: "+ Alltrim(cvaltochar(oModelCZP:GetValue('CZP_QTRPPO'))),,,@aMsgRet)
							return .f.						
						endif

						oModelCZP:SetValue('CZP_CDLO',aLotes[1][1])
						oModelCZP:SetValue('CZP_QTRPPO',aLotes[1][2])
						oModelCZP:SetValue('CZP_CDDP',aLotes[1][3])
						For nX := 2 to len(aLotes)
							aadd(aProds,{oModelCZP:GetValue('CZP_CDMT'),aLotes[nX][1],aLotes[nX][2],oModelCZP:GetValue('CZP_CDACPI'),oModelCZP:GetValue('CZP_CDDP')})
						next nX
					endif
				else
					if oModelCZP:GetValue('CZP_QTRPPO') == 0
						nQtdConsumo := QtdConsumo(cOp,oModelCZP:GetValue('CZP_CDMT'),oModelCZP:GetValue('CZP_QTRPPO'),nQtdAp)
						oModelCZP:SetValue('CZP_QTRPPO',nQtdConsumo)
					endif
				endif
			endif
		endif
	Next nI

	for nI := 1 to len(aProds)
		oModelCZP:AddLine()
		oModelCZP:GoLine(oModelCZP:Length())

		oModelCZP:SetValue('CZP_CDMT',aProds[nI][1])
		oModelCZP:SetValue('CZP_QTRPPO',aProds[nI][3])
		oModelCZP:SetValue('CZP_CDLO',aProds[nI][2])
		oModelCZP:SetValue('CZP_CDACPI',aProds[nI][4])
		oModelCZP:SetValue('CZP_CDDP',aProds[nI][5])
	next

	//Valida se todos os produtos possuem saldo suficiente
	For nI :=1 to oModelCZP:Length()
		oModelCZP:GoLine(nI)
		_cProd  := oModelCZP:GetValue('CZP_CDMT')
		_cLote  := oModelCZP:GetValue('CZP_CDLO')
		_nQtd   := oModelCZP:GetValue('CZP_QTRPPO')
		_cLocal := oModelCZP:GetValue('CZP_CDDP')
		lLocalizPrd := Localiza(_cProd)



		DbSelectarea("SB1")
		SB1->(DbSetOrder(1))
		if SB1->(DbSeek(xFilial("SB1")+_cProd))

			if _nQtd == 0 .and. SB1->B1_TIPO<>"MO"
				AtuZ0E("Quantidade zerada nos insumos!"+chr(13)+chr(10)+;
				"Produto:"+_cProd+chr(13)+chr(10)+;
				"Ordem de Produção: "+cOP,,,@aMsgRet)
				return .f.
			endif


			lIndireto := ( sb1->b1_apropri =="I")
			//Verifica se o produto tem SB2 cadastrada
			DbSelectArea("SB2")
			DbSetOrder(1)
			if !DbSeek(FwxFilial("SB2")+_cProd+if(!lIndireto,_cLocal,cLocProc))
				AtuZ0E("Local de Estoque "+if(!lIndireto,_cLocal,cLocProc)+" não cadastrado para o produto "+_cProd+" !",,,@aMsgRet)

				Return .F.
			endif

			DbSelectArea("SB1")

			if SB1->B1_TIPO <> 'MO' //Não validar quando é mão de obra
				_cDescPrd := alltrim(SB1->B1_DESC)
				if !empty(_cLote) //Se possuir lote, verifico o saldo/validade do lote

					//Mesmo produto controlando rastreabilidade, verifica o saldo da SB2
					//para checar se não tem desbalanceamento e evitar a mensagem
					//SFCA314:POST:::/ no Monitor do Job
					//30/12/2017


					dbSelectArea("SB2")
					SB2->(dbSetOrder(1))
					if SB2->(DbSeek(xFilial("SB2")+_cProd+if(!lIndireto,_cLocal,cLocProc)))
						nSaldoSB2 := SaldoSB2(.f.,.f.)
					endif	




					DbSelectarea("SB8")
					SB8->(DbSetOrder(3))
					if SB8->(DbSeek(xFilial("SB8")+_cProd+_cLocal+_cLote))
						dDataLote := SB8->B8_DATA
						dVencLote := SB8->B8_DTVALID
						_lDataOk := .F.
						while (!SB8->(EOF())) .AND. SB8->(B8_FILIAL+B8_PRODUTO+B8_LOCAL+B8_LOTECTL) == xFilial("SB8")+_cProd+_cLocal+_cLote
							if SB8->B8_DTVALID >= dDataZ0E .and. SB8->B8_DATA <= dDataZ0E //dDataBase
								_lDataOk := .T.
								exit
							endif
							SB8->(DbSkip())
						end

						if _lDataOk
							if !lLocalizPrd .and. SB8->B8_QACLASS > 0
								AtuZ0E("Produto não controla endereçamento mas possui quantidade a classificar."+chr(13)+chr(10)+;
								"Verifique as configurações do produto e também a base de dados (B2_QACLASS/B8_QACLASS).",,,@aMsgRet)
								Return .F.								
							endif
							nSaldo := SB8SALDO(,,,,"SB8",lEmpPrev,,,.T.)												
							if nSaldo < _nQtd .OR. (_cProd ==cCodProPai)
								AtuZ0E("Produto sem saldo no Lote."+ chr(13)+ chr(10)+"Produto: "+ alltrim(_cProd)+;
								" - " + _cDescPrd + " Lote: "+_cLote+ chr(13)+ chr(10)+;
								"Armazem: "+_cLocal+ chr(13)+ chr(10)+;
								" Saldo: "+ cvaltochar(nSaldo)+" Qtd requisitada: "+ cvaltochar(_nQtd),,,@aMsgRet)

								Return .F.
							endif
							ACDConout({cFilAnt+" - "+"Produto: "+_cProd+"Armazém: "+_cLocal+" --> Lote :"+_cLote+"  --> Quant. Prod: "+Alltrim(Str(_nQtd)) + "  Saldo -->"+Alltrim(Str(_nQtd))})


							//Mesmo produto controlando rastreabilidade, verifica o saldo da SB2
							//para checar se não tem desbalanceamento e evitar a mensagem
							//SFCA314:POST:::/ no Monitor do Job
							//30/12/2017

							if nSaldoSB2 <_nQtd
								AtuZ0E("Divergência entre saldo por lote e saldo físico (SB2xSB8) "+ chr(13)+ chr(10)+"Produto: "+ alltrim(_cProd)+;
								" - " + _cDescPrd + " Lote: "+_cLote+ chr(13)+ chr(10)+;
								"Armazem: "+_cLocal+ chr(13)+ chr(10)+;
								" Saldo por lote (SB8): "+ cvaltochar(nSaldo)+chr(13)+chr(10)+;
								" Saldo físico (SB2): "+cvaltochar(nSaldoSB2)+chr(13)+chr(10)+;
								" Qtd requisitada: "+ cvaltochar(_nQtd)+chr(13)+chr(10)+;
								" Verifique provavel desbalanceamento de saldos!",,,@aMsgRet)
								Return .F.							
							endif

						else
							AtuZ0E("Produto "+ alltrim(_cProd)+" - " + _cDescPrd + ;
							" com lote vencido, ou então o Lote foi criado com data posterior a data de necessidade. "+chr(13)+chr(10)+;
							"Lote: "+_cLote+" Armazem: "+_cLocal+chr(13)+chr(10)+;
							"Data geração Lote: "+dtoc(dDataLote)+chr(13)+chr(10)+;
							"Data Vencto Lote: "+dtoc(dVencLote)+chr(13)+chr(10)+;
							"Data Necessidade "+dtoc(dDataZ0E),,,@aMsgRet)

							Return .F.
						endif
					else
						AtuZ0E( "Nao foi encontrado registro de saldo por lote para o produto "+ alltrim(_cProd)+;
						" - " + _cDescPrd + " no lote "+_cLote+ " e Armazem: "+_cLocal,,,@aMsgRet)

						Return .F.
					endif
				else
					if Rastro(_cProd,"L")
						sb1->(DbSetOrder(1))
						lIndireto := (sb1->(DbSeek(FwxFilial("SB1")+_cProd)) .and. sb1->b1_apropri =="I")
						c_Mens := "Produto sem Saldo por Lote no Armazém informado."+ chr(13)+ chr(10)+;
						"Produto "+ alltrim(_cProd)+	" - " + _cDescPrd +  chr(13)+ chr(10)+;
						"Armazem: "+iif(lIndireto,cLocProc,_cLocal)
						AtuZ0E( c_Mens,,,@aMsgRet)
						return .f.		  
					else
						dbSelectArea("SB2")
						SB2->(dbSetOrder(1))
						if SB2->(DbSeek(xFilial("SB2")+_cProd+_cLocal))
							nSaldo := SaldoSB2()
							if nSaldo < _nQtd
								c_Mens := "Produto sem saldo no armazém informado."+ chr(13)+ chr(10)+;
								"Produto: "+ alltrim(_cProd)+" - " + _cDescPrd + chr(13)+ chr(10)+;
								"Armazem: "+_cLocal+ chr(13)+ chr(10)+;
								" Saldo: "+ cvaltochar(nSaldo)+" Qtd requisitada: " + cvaltochar(_nQtd)

								AtuZ0E( c_Mens,,,@aMsgRet)

								Return .F.
							endif
						else
							c_Mens := "Nao foi encontrado registro de saldo para o armazem informado."+ chr(13)+ chr(10)+;
							"Produto "+ alltrim(_cProd)+	" - " + _cDescPrd +  chr(13)+ chr(10)+;
							" Armazem: "+_cLocal

							AtuZ0E( c_Mens,,,@aMsgRet)

							Return .F.
						endif
					endif
				endif
			endif
		else
			AtuZ0E( "Produto nao encontrado."+ chr(13)+ chr(10)+Chr(13)+Chr(10)+;
			"OP: "+cOp+;
			" Produto ---> "+ alltrim(_cProd),,,@aMsgRet)



			Return .F.
		endif
	next

	// Valida o modelo
	If oModel:VldData()

		If !oModel:CommitData()

			aErro := oModel:GetErrorMessage()

			c_Mens := aErro[1]+":"+;
			aErro[2]+":"+;
			aErro[3]+":"+;
			aErro[4]+":"+;
			aErro[5]+", "+;
			aErro[6]+"/"+aErro[7]

			aErroAuto := GetAutoGRLog()

			For nI := 1 To 5 //Len(aErroAuto)
				c_Mens += aErroAuto[nI] + Chr(13) + Chr(10)
			Next

			AtuZ0E( c_Mens,,,@aMsgRet)


			Return .F.
		EndIf
	Else

		aErro := oModel:GetErrorMessage()

		c_Mens := aErro[1]+":"+;
		aErro[2]+":"+;
		aErro[3]+":"+;
		aErro[4]+":"+;
		aErro[5]+", "+;
		aErro[6]+"/"+aErro[7]

		aErroAuto := GetAutoGRLog()

		nMaxCtrl := iif(Len(aErroAuto)>=5,5,Len(aErroAuto))
		For nI := 1 To nMaxCtrl //Len(aErroAuto)		
			c_Mens += aErroAuto[nI] + Chr(13) + Chr(10)

			c_Mens  += "Data Inicio Apontamento " +dtoc(dDtIni)+chr(13)+chr(10)
			c_Mens  += "Hora Inicio Apontamento " +cHrIni+chr(13)+chr(10)
			c_Mens  += "Data Inicio Apontamento " +dtoc(dDtFim)+chr(13)+chr(10)
			c_Mens  += "Hora Inicio Apontamento " +cHrFim+chr(13)+chr(10)
			c_Mens  += "Data Reporte " +dtoc(dDtFim)+chr(13)+chr(10)
			c_Mens  += "Hora Reporte " +cHrFim+chr(13)+chr(10)


		Next

		AtuZ0E( c_Mens,,,@aMsgRet)

		Return .F.
	EndIf

	//Atualiza informações de apontamento da tabela temporária CZH,
	//caso seja uma finalização de apontamento
	dbSelectArea("CZH")
	CZH->(dbSetOrder(2))

	If CZH->(dbSeek(xFilial("CZH")+cNRORPO+cIDAT+cIDATQO))
		While CZH->(!Eof()) .And. ;
		CZH->CZH_FILIAL == xFilial("CZH") .And. ;
		CZH->CZH_NRORPO == cNRORPO .And. ;
		CZH->CZH_IDAT == cIDAT .And. ;
		CZH->CZH_IDATQO == cIDATQO

			If CZH->CZH_STTR == "1"
				RecLock("CZH",.F.)
				CZH->CZH_STTR := "2" //Enviado ao Chão de Fábrica
				CZH->(MsUnLock())
			Endif
			CZH->(DbSkip())
		End
	EndIf
Return .T.

//-------------------------------------------------------------------
/*/{Protheus.doc} A314ADtIn
Retorna data de início para as transações de "Produção", "Refugo"
e "Pausar com apontamento"

@param   cOp    Identifica a ordem informada
cOper  Identifica a operação informada
cSplit Identifica o split informado
cMaq   Identifica a máquina informada

@return  aData   Retorna data/hora inicial

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314ADtIn(cOp, cOper, cSplit, cMaq,aMsgRet)
	Local aData   := {"",""}
	Local cTpTran := Space(1)

	DbSelectArea("CZH")
	DbSetOrder(4)

	If CZH->(dbSeek(xFilial("CZH")+cOp+cOper+cSplit+"1"))
		While CZH->(!Eof()) .And. ;
		CZH->CZH_FILIAL == xFilial("CZH") .And. ;
		CZH->CZH_NRORPO == cOp .And. ;
		CZH->CZH_IDAT == cOper .And. ;
		CZH->CZH_IDATQO == cSplit .And. ;
		CZH->CZH_STTR == "1"

			cTpTran := A314GtTr(CZH->CZH_CDTR,2,@aMsgRet)
			If cTpTran == "1" //Se transação for "Iniciar Produção"
				If Empty(aData[1]) .Or.;
				(aData[1] < CZH->CZH_DTRPBG .Or. ;
				(aData[1] == CZH->CZH_DTRPBG .And. aData[2] < CZH->CZH_HRRPBG) )

					aData[1] := CZH->CZH_DTRPBG
					aData[2] := CZH->CZH_HRRPBG
				Endif
			Else
				If Empty(aData[1]) .Or.;
				(aData[1] < CZH->CZH_DTRPED .Or. ;
				(aData[1] == CZH->CZH_DTRPED .And. aData[2] < CZH->CZH_HRRPED) )

					aData[1] := CZH->CZH_DTRPED
					aData[2] := CZH->CZH_HRRPED
				Endif
			Endif

			CZH->(DbSkip())
		End
	EndIf
Return aData

//-------------------------------------------------------------------
/*/{Protheus.doc} A314GtTr
Retorna tipo de transação equivalente ao código de transação passado

@param     cCdTrans Código da transação na CBI

@return  cTpTrans  Retorna tipo de transação. Os tipos sao: 1-Inicio,
2-Pausa c/,3-Pausa s/,4-Producao,5-Perda

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314GtTr(cCdTrans,nTipo,aMsgRet)
	Local cTpTrans := Space(1)

	dbSelectArea("CBI")
	CBI->(DbSetOrder(1))
	If ! CBI->(DbSeek(xFilial("CBI")+cCdTrans))
		Return cTpTrans
	EndIf

	If CBI->CBI_TIPO <> "3" //Pausa sem apontamento
		cTpTrans := CBI->CBI_TIPO
	Endif
	If nTipo == 1
		lFinIni := IIf(CBI->CBI_FIMINI == "1",.T.,.F.)
	Endif
Return cTpTrans

//-------------------------------------------------------------------
/*/{Protheus.doc} A314CarOE
Função para tratamento de dados necessários quando o tipo de reporte
do centro de trabalho em que o apontamento está acontecendo é por
operador ou equipe.

@param

@return  aDados   Retorna array com as informações de equipe/operador

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314CarOE(aMsgRet)
	Local aDados    := {}
	Local cTpMod    := Space(1)
	Local nSFCOEA   := SuperGetMv("MV_SFCOEA",.F.,1)
	Private cCDOERP := Space(TamSX3("CYC_CDRC")[1])

	dbSelectArea("CYB")
	CYB->(dbSetOrder(1))
	If CYB->(dbSeek(xFilial("CYB")+cCDMQ))
		DbSelectArea("CYI")
		CYI->(DbSetOrder(1))
		If CYI->(dbSeek(xFilial("CYI")+CYB->CYB_CDCETR))
			If CYI->CYI_TPMOD == "1" //Não reporta
				Return aDados
			Endif

			dbSelectArea("CYC")
			CYC->(dbSetOrder(1))
			CYC->(dbSeek(xFilial("CYC")+cCDMQ))

			If CYI->CYI_TPMOD == "2" //Reporta por operador
				cTpMod := "1"
			Endif

			If CYI->CYI_TPMOD == "3" //Reporta por equipe
				cTpMod := "3"
			Endif

		EndIf
	EndIf

	If nSFCOEA == 1 //Primeira equipe/operador cadastrada para a máquina
		If CYC->(dbSeek(xFilial("CYC")+cCDMQ+cTpMod))
			aAdd(aDados,{cTpMod,CYC->CYC_CDRC})
		EndIf
	ElseIf nSFCOEA == 2 //Informa a equipe/operador
		//ABRE TELA PARA INFORMACAO DO OPERADOR OU EQUIPE
		If !A314MonT4(CYI->CYI_TPMOD)
			Return aDados
		Else
			If CYI->CYI_TPMOD == "2"
				aAdd(aDados,{'1',cCDOERP}) //REVER
			Else
				aAdd(aDados,{'3',cCDOERP}) //REVER
			Endif
			Return aDados
		Endif
	ElseIf nSFCOEA == 3 //Todas as esquipes/operadores cadastrados para a máquina.
		If CYC->(dbSeek(xFilial("CYC")+cCDMQ+cTpMod))
			While CYC->( !Eof() ) .And. CYC->(CYC_FILIAL+CYC_CDMQ+CYC_TPRC) == xFilial("CYC")+cCDMQ+cTpMod
				aAdd(aDados,{cTpMod,CYC->CYC_CDRC})
				CYC->(dbSkip())
			End
		EndIf
	EndIf
Return aDados

//-------------------------------------------------------------------
/*/{Protheus.doc} A314CarFR
Função para tratamento de dados necessários quando o tipo de tratamento
de tempo da operação é dependente de ferramenta.

@param

@return  aDados      Retorna array com as informações de ferramenta

@author  Lucas Konrad França
@since   21/01/2016
@version P118
/*/
//-------------------------------------------------------------------
Static Function A314CarFR(aMsgRet)
	Local aDados   := {}
	Local nSFCFEA  := SuperGetMv("MV_SFCFEA",.F.,1)

	Private cCdFer := Space(TamSX3("CYC_CDRC")[1])

	dbSelectArea("CY9")
	CY9->(dbSetOrder(1))
	If CY9->(dbSeek(xFilial("CY9")+cNRORPO+cIDAT))
		If CY9->CY9_TPTE == "4" // Operação dependente de ferramenta.
			dbSelectArea("CYC")
			CYC->(dbSetOrder(1))
			If nSFCFEA == 1 //Primeira ferramenta cadastrada para a máquina
				If CYC->(dbSeek(xFilial("CYC")+cCDMQ+"2"))
					aAdd(aDados,CYC->CYC_CDRC)
				EndIf
			ElseIf nSFCFEA == 2 //Informa a ferramenta
				CYC->(dbSeek(xFilial("CYC")+cCDMQ+"2"))
				If !A314MonT7()
					Return aDados
				Else
					aAdd(aDados,cCdFer)
				EndIf
			ElseIf nSFCFEA == 3 //Todas as ferramentas cadastradas para a máquina
				If CYC->(dbSeek(xFilial("CYC")+cCDMQ+"2"))
					While CYC->( !Eof() ) .And. CYC->(CYC_FILIAL+CYC_CDMQ+CYC_TPRC) == xFilial("CYC")+cCDMQ+"2"
						aAdd(aDados,CYC->CYC_CDRC)
						CYC->(dbSkip())
					End
				EndIf
			EndIf
		EndIf
	EndIf

Return aDados

//-------------------------------------------------------------------
/*/{Protheus.doc} A314AddRe
Adiciona Refugo/Retrabalho no array enviado, comparando os motivos
já utilizados para agrupá-los se necessário.

@param     aDadRe Identifica o array onde o item será adicionado
cCdRf  Identifica o código do refugo/retrabalho
nQtRf  Identifica a quantidade do refugo/retrabalho

@return  aDadRe   Retorna array com a informação adicionada

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314AddRe(aDadRe, nTipo, cCdRf, nQtRf,aMsgRet)
	Local nI     := 0
	Local lAchou := .F.

	For nI := 1 To Len(aDadRe)
		If aDadRe[nI][1] == cCdRf
			If nTipo == 1
				aDadRe[nI][2] += nQtRf
				aDadRe[nI][3] += 0
			Else
				aDadRe[nI][2] += 0
				aDadRe[nI][3] += nQtRf
			Endif
			lAchou := .T.
			Exit
		Endif
	Next

	If !lAchou
		If nTipo == 1
			aAdd(aDadRe,{cCdRf,nQtRf,0})
		Else
			aAdd(aDadRe,{cCdRf,0,nQtRf})
		Endif
	Endif
Return aDadRe

//-------------------------------------------------------------------
/*/{Protheus.doc} A314VlTr
Valida a transação informada

@param

@return  lRet   Retorna se é possível realizar a transação
informada

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314VlTr(cCDTR,aMsgRet)
	dDtIn := aHora[1]
	cHrIn := aHora[2]
	dDtFi := aHora[3]
	cHrFi := aHora[4]

	cTPTR := A314GtTr(cCDTR,1,@aMsgRet)
	If Empty(cTPTR)
		AtuZ0E( "Transação da produção não cadastrada ou inválida.",,,@aMsgRet)

		Return .f.
	Endif

	If cTPTR $ "1" .And. A314VlIn(@aMsgRet)
		Return .T.
	Endif
	If cTPTR $ "245" .And. A314VlAp(@aMsgRet)
		Return .T.
	Endif
Return .F.

//-------------------------------------------------------------------
/*/{Protheus.doc} A314VlSp
Retorna se split é válido para apontamento

@param   cOp    Identifica a ordem de produção informada
cOper  Identifica a operação informada
cSplit Identifica o split informado

@return  lRet   Retorna se valor informado é válido

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
static Function A314VlSp(cOp,cOper,cSplit,aMsgRet)
	Local lRet := .T.
	Local nQt  := (1/100)

	dbSelectArea("CYY")
	CYY->(dbSetOrder(1))
	CYY->(dbGoTop())
	If CYY->(dbSeek(xFilial("CYY")+cOp+cOper+cSplit))
		//Verifica se o status está finalizado(5) ou suspenso(6)
		If CYY->CYY_TPSTAT $ "56"
			AtuZ0E( "Split ja finalizado ou suspenso.",,,@aMsgRet)

			lRet := .F.
		Else
			//Verifica se possui uma máquina alocada ao slit e grava o código da mesma
			cCDMQ := CYY->CYY_CDMQ
			If Empty(cCDMQ)
				lAlocado := .F.
			Else
				lAlocado := .T.
			Endif
		Endif
	Else
		AtuZ0E( "Split inexistente",,,@aMsgRet)

		lRet := .F.
	Endif

	If lRet
		//Valida operador - transação já iniciada por outro operador
		DbSelectArea("CZH")
		DbSetOrder(2)
		CZH->(dbSeek(xFilial("CZH")+cOp+cOper+cSplit))
		While CZH->(!Eof()) .And. CZH->CZH_NRORPO == cOp .And.;
		CZH->CZH_IDAT == cOper .And. CZH->CZH_IDATQO == cSplit
			If Empty(CZH->CZH_DTRPED) .And. Empty(CZH->CZH_HRRPED)
				//Inserido AllTrim para remover os espaços desnecessários
				If AllTrim(CZH->CZH_CDOE) != AllTrim(cCDOE)
					lRet := .F.

					AtuZ0E( "Split já iniciado por outro operador.",,,@aMsgRet)


					Exit
				Endif
			Endif
			CZH->(DbSkip())
		End
		//CZH->(DbCloseArea())
	Endif

	If lRet
		//Valida se é possível apontar algo no split informado
		If !A314VlQtR(nQt,@aMsgRet)
			lRet := .F.
		Endif
	Endif

Return lRet

//-------------------------------------------------------------------
/*/{Protheus.doc} A314VlQt
Valida campo quantidade reportada

@param

@return  lRet   Retorna se todos os dados foram informados
corretamente e/ou se houve cancelamento

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314VlQt(aMsgRet)
	Local lRet := .T.
	Local nQtdAp := 0
	Local nQtdRf := 0
	Local nQtdRp := 0
	Local cTpTran

	//Cálculo de quantidade total reportada até o momento
	DbSelectArea("CZH")
	CZH->(DbSetOrder(4))
	CZH->(dbSeek(xFilial("CZH")+cNRORPO+cIDAT+cIDATQO+"1"))

	While CZH->(!Eof()) .And.;
	CZH->CZH_FILIAL  == xFilial("CZH")   .And. ;
	CZH->CZH_NRORPO  == cNRORPO          .And. ;
	CZH->CZH_IDAT    == cIDAT            .And. ;
	CZH->CZH_IDATQO  == cIDATQO          .And. ;
	CZH->CZH_STTR    == "1"

		cTpTran := A314GtTr(CZH->CZH_CDTR,2,@aMsgRet)
		If cTpTran $ "24" //Aprovada
			nQtdAp += CZH->CZH_QTAPRP
		Endif

		If cTpTran $ "5" //Refugo
			nQtdRf += CZH->CZH_QTAPRP
		Endif

		CZH->(dbSkip())
	End

	nQtdRp := nQtdAp + nQtdRf + nQTAPRP

	If !A314VlQtR(nQtdRp,@aMsgRet)
		Return .F.
	Endif

Return lRet

//-------------------------------------------------------------------
/*/{Protheus.doc} A314VlOpe
Retorna se a operação é válida para apontamento

@param      cOp        Identifica a ordem informada
cOper      Identifica a operação informada

@return  lRet   Retorna se valor informado é válido

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314VlOpe(cOp, cOper,aMsgRet)
	Local lRet := .T.

	If Empty(cOper)
		AtuZ0E( "Operacao invalida",,,@aMsgRet)

		Return .F.
	EndIf

	DbSelectArea("CY9")
	CY9->(dbSetOrder(1))
	If !(CY9->(dbSeek(xFilial("CY9")+cOp+cOper)))
		AtuZ0E( "Operacao nao existente para a ordem informada.",,,@aMsgRet)

		lRet := .F.
	Endif
	//Atribui o centro de trabalho a variavel private para ser filtrada na seleção de máquina
	cCeTrab := CY9->(CY9_CDCETR)

Return lRet

//-------------------------------------------------------------------
/*/{Protheus.doc} A314VlQtR
Validação da quantidade informada

@param   nQtTotal   Quantidade total reportada

@return  lRet       Retorna se motivo será enviado para consulta padrão

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314VlQtR(nQtTotal,aMsgRet)
	Local lRet := .T.

	dbSelectArea("CYQ")
	CYQ->(dbSetOrder(1))
	CYQ->(dbGoTop())
	CYQ->(dbSeek(xFilial("CYQ")+cNRORPO))

	If (CYQ->CYQ_TPRPOR == "2" .OR. CYQ->CYQ_TPRPOR == "3") // Reporte por Operação ou Ponto de Controle
		// Verificar se a operação anterior é externa, pois se for, não deverá ser verificada
		dbSelectArea("CY9")
		CY9->(dbSetOrder(1))
		CY9->(dbGoTop())
		CY9->(dbSeek(xFilial("CY9")+cNRORPO+CYD->CYD_IDATPV))

		If CY9->CY9_TPAT == "1"
			nQtdMax := SFCA314QRP(cNRORPO,cIDAT,cIDATQO,0,.T.,1,dDataBase,Time(),.F.,1)
		Else
			nQtdMax := nQtTotal
		Endif
		Pergunte('MTA680',.F.)
		If MV_PAR07 != 3
			If nQtdMax == 0 .AND. nQtTotal > 0
				c_Mens := "Operação anterior ainda não foi reportada ou quantidade desejada não disponível para reporte na data informada. " + NEWLINE +; //"Operação anterior ainda não foi reportada ou quantidade desejada não disponível para reporte na data informada. "
				"Ordem: "+": " + cNRORPO + NEWLINE +;
				" Operação: "+": " + cIDAT + NEWLINE +;
				" Split: "+": " + cIDATQO

				AtuZ0E( c_Mens,,,@aMsgRet)


				lRet := .F.
			Else
				If nQtdMax < nQtTotal
					c_Mens := "Quantidade maior que a quantidade da operação anterior" + NEWLINE +; //"Quantidade maior que a quantidade da operação anterior"
					"Ordem"+": " + cNRORPO + NEWLINE +;
					"Operação"+": " + cIDAT + NEWLINE +;
					"Split "+": " + cIDATQO + NEWLINE +;
					"Quantidade"+": " + STR(nQtdMax)

					AtuZ0E( c_Mens,,,@aMsgRet)

					lRet := .F.
				Endif
			EndIf
		Endif
	Endif
Return lRet

//-------------------------------------------------------------------
/*/{Protheus.doc} A314VlIn
Valida a possibilidade de inicialização do apontamento do split

@param

@return    lRet   Retorna se é possível inicializar o
apontamento do split

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314VlIn(aMsgRet)
	Local cTpTran
	Local cMsg := ''
	//Verifica se o apontamento do split já foi iniciado
	DbSelectArea("CZH")
	DbSetOrder(2)
	If CZH->(dbSeek(xFilial("CZH")+cNRORPO+cIDAT+cIDATQO+cCDMQ+"1"))
		While CZH->(!Eof()) .And. xFilial("CZH")+cNRORPO+cIDAT+cIDATQO+cCDMQ+"1" == CZH->(CZH_FILIAL+CZH_NRORPO+CZH_IDAT+CZH_IDATQO+CZH_CDMQ+CZH_STTR)
			If Empty(CZH->CZH_DTRPED) .And. Empty(CZH->CZH_HRRPED)
				cTpTran := A314GtTr(CZH->CZH_CDTR,2,@aMsgRet)
				If cTpTran == cTPTR
					AtuZ0E( "Apontamento ja iniciado",,,@aMsgRet)

					Return .F.
				Endif
			Endif
			CZH->(DbSkip())
		End
	EndIf
	//CZH->(DbCloseArea())

	//Verifica se a máquina informada já possui um apontamento iniciado
	DbSelectArea("CZH")
	DbSetOrder(3)
	If CZH->(dbSeek(xFilial("CZH")+cCDMQ))
		While CZH->(!Eof()) .And. xFilial("CZH")+cCDMQ == CZH->(CZH_FILIAL+CZH_CDMQ)
			If Empty(CZH->CZH_DTRPED) .And. Empty(CZH->CZH_HRRPED) .And. CZH->CZH_STTR != "2"
				cTpTran := A314GtTr(CZH->CZH_CDTR,2,@aMsgRet)
				If cTpTran == cTPTR
					cMsg := "Maquina ja possui apontamento iniciado" + ; //"Maquina ja possui apontamento iniciado"
					chr(13) +  chr(10) + ;
					"OP: " + AllTrim(CZH->CZH_NRORPO) + ; // "OP: "
					CHR(13) + CHR(10) + ;
					"Operacao " + ": " + AllTrim(CZH->CZH_IDAT) // "Operação: "
					AtuZ0E(cMsg,,,@aMsgRet)

					Return .F.
				Endif
			Endif
			CZH->(DbSkip())
		End
	EndIf
	//CZH->(DbCloseArea())

Return .T.

//-------------------------------------------------------------------
/*/{Protheus.doc} A314VlAp
Valida a possibilidade de apontamento do split

@param

@return  lRet   Retorna se é possível fazer o
apontamento do split

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314VlAp(aMsgRet)
	Local lRet := .F.
	Local cTpTran := Space(1)

	//Verifica se o apontamento do split já foi iniciado
	DbSelectArea("CZH")
	DbSetOrder(2)



	If CZH->(dbSeek(xFilial("CZH")+cNRORPO+cIDAT+cIDATQO+cCDMQ))
		While CZH->(!Eof()) .And. xFilial("CZH")+cNRORPO+cIDAT+cIDATQO+cCDMQ == CZH->(CZH_FILIAL+CZH_NRORPO+CZH_IDAT+CZH_IDATQO+CZH_CDMQ)
			cTpTran := A314GtTr(CZH->CZH_CDTR,2,@aMsgRet)
			If cTpTran == "1" .And. Empty(CZH->CZH_DTRPED) .And. Empty(CZH->CZH_HRRPED)
				lRet    := .T.
				dDtIn   := CZH->CZH_DTRPBG
				cHrIn   := CZH->CZH_HRRPBG
				Exit
			Endif
			CZH->(DbSkip())
		End
		If !lRet
			AtuZ0E("O apontamento do split nro "+ cIDATQO +" já foi iniciado na máquina "+cCDMQ,,,@aMsgRet)

			Return lRet
		Endif
	Else
		//ConOut(Z0E->Z0E_ETIQ+" Verifica se o apontamento do split já foi iniciado --> " + xFilial("CZH") +" - "+ cNRORPO+" - "+cIDAT+" - "+cIDATQO+" - "+cCDMQ)
		AtuZ0E("Não foi encontrado apontamento de inicio do split nro "+ cIDATQO +" na máquina "+cCDMQ,,,@aMsgRet)
	EndIf


Return lRet

static function RetHora(cMaq,aMsgRet,lfilho,cStrHora,cEtiqueta)
	Local aRet:= {'20180101','00:01:00',StoD(Substr(cStrHora,1,8)),Substr(cStrHora,9,8)}
	Local cQuery := ''
	Local aArea := GetArea()
	LOCAL aAreaCYB := CYB->(GetArea())
	Local cletraMaq := Substr(cEtiqueta,19,1)

	cQuery := " SELECT Z0E_DATA,Z0E_HORA FROM ( "
	cQuery += "	SELECT  Z0E_DATA,Z0E_HORA FROM  "+RetSqlName("Z0E")+"  WHERE Z0E_FILIAL='"+FwxFilial("Z0E")+"' AND D_E_L_E_T_ = ' ' AND SUBSTR(Z0E_ETIQ,19,1) = '"+Alltrim(cLetraMaq)+"' "
	cQuery += " AND Z0E_DATA||Z0E_HORA < '"+cStrHora+"' "  
	cQuery += " ORDER BY Z0E_DATA DESC,Z0E_HORA DESC ) WHERE ROWNUM < 2 "
	If Select("QHora") > 0
		QHora->(DbCloseArea())
	endif	
	TcQuery cQuery new alias "QHora"

	If !Qhora->(Eof())
		aRet[1] := Stod(QHora->Z0E_DATA)
		aRet[2] := QHora->Z0E_HORA
	else
		aRet[1] := dDataZ0E
		aRet[2] := "00:00:01"
	endif

	aRet := AjustaTempo(aRet)

	QHora->(DbCloseArea())
	restarea(aAreaCYB)
	restarea(aArea)
return aRet

//Retorna o Lote que será utilizado no apontamento.
static function loteapt(cProdSld,nQtd,aMsgRet)
	Local aArea:= GetARea()
	Local aRet := {}
	Local cQry := ""
	Local nSaldo := 0
	Local lEmpPrev   := If(SuperGetMV("MV_QTDPREV")== "S",.T.,.F.)
	Local lIndireto := .f.
	Local cLocProc := GetMv("MV_LOCPROC")

	sb1->(dbSetOrder(1))
	lIndireto := ( sb1->(DbSeek(FwxFilial("SB1")+cProdSld)) .and. sb1->(b1_apropri) =="I" )


	cQuery:="SELECT B8_LOTECTL, SB8.R_E_C_N_O_ RECSB8,B8_LOCAL from "+RetSqlName("SB8")+" SB8 "
	cQuery+="where B8_FILIAL = '"+xFilial("SB8")+"' AND B8_PRODUTO = '"+cProdSld+"' and SB8.D_E_L_E_T_=' ' and B8_LOTECTL<> ' ' "
	//cQuery+="AND B8_LOCAL = '"+cSilo+"' "

	if lIndireto
		cQuery += " AND B8_LOCAL = '"+cLocProc+"' "
	endif	
	cQuery += " AND B8_DATA <= '"+DTOS(dDataZ0E)+"' AND "
	cQuery += " B8_DTVALID >= '"+DTOS(dDataZ0E)+"' "
	cQuery += " ORDER BY substr(B8_LOTECTL,1,8),B8_DATA desc "

	if select("QSB8") >0
		QSB8->(DbCLoseArea())
	endif

	TcQuery cQuery new alias "QSB8"

	While !QSB8->(EOF())
		dbselectarea("SB8")
		SB8->(DbGoto(QSB8->RECSB8))
		nSaldo := SB8SALDO(,,,,"SB8",lEmpPrev,,,.T.)

		if nSaldo > 0
			if nSaldo >= nQtd
				aadd(aRet,{QSB8->B8_LOTECTL,nQtd,QSB8->B8_LOCAL})
				exit
			else
				aadd(aRet,{QSB8->B8_LOTECTL,nSaldo,QSB8->B8_LOCAL})
			endif
		endif

		QSB8->(DbSkip())
	end

	QSB8->(DbCLoseArea())

	RestArea(aArea)
return aRet



static Function SFCXTEMPOS (cCDTN, cNRTN, nOper, cMaq, dIni, dFim, cHoraIni, cHoraFim, lCalc, cProgram,aMsgRet )
	Local dData
	Local cHoraIniCalc := '00:00:00'
	Local aArea        := GetArea()
	Local aAreaCYI     := CYI->( GetArea() )
	Local aAreaCYB     := CYB->( GetArea() )
	Local aAreaCYZ     := CYZ->( GetArea() )
	Local nDia		   := 0
	Local nSegUtil     := 0
	Local nSegExtra    := 0
	Local nHoraAnt     := 0
	Local aRetorno     := {}
	Local a2Retorno    := {}
	Local cQuery       := ''
	Local lOk		   := .T.
	Local nRecNumb     := 0
	Local cTmp
	Local cHora
	Local cCDCL		   := ''
	Local dIniVal      := CTOD('01/01/2000')
	Local dFimVal      := CTOD('01/01/2100')

	cCDCL := SFCCalendario(cMaq)

	if nOper == 3 .OR.;
	(nOper == 4 .AND. Empty(cCDTN))

		aRetorno := SFCA314GTU(,,cMaq,dIni)
		cCDTN    := aRetorno[1]
		dIniVal  := aRetorno[2]
		dFimVal  := aRetorno[3]

		IF Empty(cCDTN)
			if IsInCallStack( 'SFCA314PRE' ) .OR. IsInCallStack( 'SFCA311CalculaTempos' ) .OR. IsInCallStack( 'SFCA311POS' ) .OR. IsInCallStack( 'SFCA317CMM' )
				AtuZ0E('Nao encontrado Modelo Turno para a Maquina informada',,,@aMsgRet)
			Endif
			lOk := .F.
		Endif
	Endif

	if dIni > dFim .OR.;
	(dIni == dFim .AND. cHoraIni >= cHoraFim)

		Return {cCDTN,'00000',0,0,lOk}
	Endif

	if lOk
		for dData := dIni to dFim

			dbSelectArea('CYR')
			CYR->(dbSetOrder(2))
			CYR->(dbGoTop())
			IF CYR->(DbSeek(xFilial('CYR')+cCDTN+ alltrIM(STR(DOW(dData)))))
				cHoraIniCalc := CYR->CYR_HRBG
				cNRTN		 := CYR->CYR_NRTN
				nRecNumb     := CYR->(RecNo())
			Endif

			While CYR->(!EOF()) .AND. CYR->CYR_CDTN == cCDTN .AND. CYR->CYR_NRDYWK == ALLTRIM(STR(DOW(dData)))
				IF CYR->CYR_TPTE == '1' .AND. cHoraIni >= cHoraIniCalc .AND.;
				CYR->CYR_HRBG <= cHoraIni .AND. CYR->CYR_HRED >= cHoraIni

					cNRTN        := CYR->CYR_NRTN
					cHoraIniCalc := CYR->CYR_HRBG
					nRecNumb     := CYR->(RecNo())
				Endif

				CYR->(dbSkip())
			End

			if !Empty(cNRTN)
				dbSelectArea('CYR')
				CYR->(dbSetOrder(2))
				CYR->(dbGoTop())
				IF CYR->(DbSeek(xFilial('CYR')+cCDTN+ alltrIM(STR(DOW(dData)))+cHoraIniCalc))
					nRecNumb := CYR->(Recno())
				Endif

				Exit
			Endif
		Next

		IF Empty(cNRTN) .OR. nRecNumb == 0
			if IsInCallStack( 'SFCA310' ) .OR. IsInCallStack( 'SFCA311CalculaTempos' ) .OR. IsInCallStack( 'SFCA311POS' ) .OR. IsInCallStack( 'SFCA317CMM' )
				AtuZ0E('Nao encontrado Turno para a Maquina informada',,,@aMsgRet)
			Endif
			lOk   := .F.
		Endif

		if nRecNumb != 0 .AND. lOk
			cQuery := ""
			cQuery += "SELECT * FROM " + RetSQLName( 'CYR' ) + " CYR WHERE "
			cQuery += "		R_E_C_N_O_ = " + STR(nRecNumb)

			cTmp := GetNextAlias()

			dbUseArea( .T., 'TOPCONN', TcGenQry(,,cQuery), cTmp, .T., .F. )
		Endif
	Endif

	if lOk

		// Somente calculo hora útil e extra quando a data final for determinada
		if dFim <> CTOD('31/12/9999')

			nDia := DOW(dIni) // Dia da semana

			if cHoraIni < (cTmp)->CYR_HRBG
				if dIni == dFim
					IF cHoraFim < (cTmp)->CYR_HRBG
						nSegExtra := SFCXHourToSeg(ELAPTIME(cHoraIni,cHoraFim))
						cHora     := cHoraFim

						Return {cCDTN,'00000',0,nSegExtra,lOk}
					Else
						nSegExtra := SFCXHourToSeg(ELAPTIME(cHoraIni,(cTmp)->CYR_HRBG))
						cHora     := (cTmp)->CYR_HRBG // Atualiza hora referência com valor que deve-se iniciar os cálculos
					Endif
				Else
					nSegExtra := SFCXHourToSeg(ELAPTIME(cHoraIni,(cTmp)->CYR_HRBG))
					cHora     := (cTmp)->CYR_HRBG
				Endif
			Else
				cHora := cHoraIni
			Endif

			(cTmp)->(dbCloseArea())

			for dData := dData to dFim // Vai dia a dia calcular o tempo util e extra

				if dFimVal < dData
					if dData != dFim
						nSegExtra += 86400
					Else
						nSegExtra += SFCXHourToSeg(cHoraFim)
					Endif
				Else

					// verifica se o dia é útil no calendário
					CYZ->(dbSetOrder(1))
					CYZ->(dbGoTop())
					IF CYZ->(DbSeek(xFilial('CYZ')+cCDCL+DTOS(dData))) .AND. CYZ->CYZ_TPDY == '1'

						// Busca todos os turnos úteis para o dia da semana
						cQuery := ""
						cQuery += "SELECT * FROM " + RetSQLName( 'CYR' ) + " CYR WHERE "
						cQuery += "		CYR_FILIAL = '" + xFilial('CYR') + "' AND "
						cQuery += "		CYR_CDTN   = '" + cCDTN + "' AND "
						cQuery += "		CYR_NRDYWK = '" + ALLTRIM(STR(nDia)) + "' AND "
						cQuery += "		CYR_TPTE   = '1' AND "
						cQuery += "     D_E_L_E_T_ = ' ' ORDER BY CYR_HRBG"

						cTmp := GetNextAlias()

						dbUseArea( .T., 'TOPCONN', TcGenQry(,,cQuery), cTmp, .T., .F. )

						While (cTmp)->(!EOF())

							// Se a chegar na data de término, deverá ficar de olho nos horários
							if dData == dFim
								IF cHora == '00:00:00' .AND. (cTmp)->CYR_HRBG > cHora
									if cHoraFim <= (cTmp)->CYR_HRBG
										nSegExtra += SFCXHourToSeg(ELAPTIME(cHora,cHoraFim))
										nSegExtra += nHoraAnt
										nHoraAnt  := 0
										cHora := cHoraFim

										IF cNRTN != (cTmp)->CYR_NRTN
											cNRTN := '00000'
										Endif

										Exit
									Else
										if lCalc // e aqui? same
											nSegExtra += SFCXHourToSeg(ELAPTIME(cHora,(cTmp)->CYR_HRBG))
										Endif
										cHora := (cTmp)->CYR_HRBG

										IF cNRTN != (cTmp)->CYR_NRTN
											cNRTN := '00000'
										Endif
									Endif
								Endif

								if (cTmp)->CYR_HRED >= cHoraFim
									if (cTmp)->CYR_HRBG >= cHoraFim
										nSegExtra += SFCXHourToSeg(ELAPTIME(cHora,cHoraFim))
										cHora     := cHoraFim
									Else
										if cHora < (cTmp)->CYR_HRBG
											IF lCalc
												nSegExtra += SFCXHourToSeg(ELAPTIME(cHora,(cTmp)->CYR_HRBG))
											Endif
											cHora := (cTmp)->CYR_HRBG
										Endif

										aRetorno  := SFCA311VTP(cCDTN,ALLTRIM(STR(DOW(dData))),cHora,cHoraFim,nSegUtil,nSegExtra)

										nSegUtil  := aRetorno[1]
										nSegExtra := aRetorno[2]
										cHora     := (cTmp)->CYR_HRED

										IF cNRTN != (cTmp)->CYR_NRTN
											cNRTN := '00000'
										Endif
									Endif

									Exit
								Else
									if cHora < (cTmp)->CYR_HRED
										if cHora < (cTmp)->CYR_HRBG
											IF lCalc
												nSegExtra += SFCXHourToSeg(ELAPTIME(cHora,(cTmp)->CYR_HRBG))
											Endif

											cHora := (cTmp)->CYR_HRBG
										Endif

										aRetorno  := SFCA311VTP(cCDTN,ALLTRIM(STR(DOW(dData))),cHora,(cTmp)->CYR_HRED,nSegUtil,nSegExtra)
										nSegUtil  := aRetorno[1]
										nSegExtra := aRetorno[2]
										cHora     := (cTmp)->CYR_HRED

										IF cNRTN != (cTmp)->CYR_NRTN
											cNRTN := '00000'
										Endif
									Endif
								Endif
							Else
								// Tratamento para primeiro turno encontrado para o dia
								// Se o turno começar depois de 00:00:00
								// deve considerar esse tempo como extra
								if cHora == '00:00:00' .AND. (cTmp)->CYR_HRBG > cHora
									if lCalc
										nSegExtra += SFCXHourToSeg(ELAPTIME(cHora,(cTmp)->CYR_HRBG))
									Endif

									cHora := (cTmp)->CYR_HRBG
								Endif

								if cHora < (cTmp)->CYR_HRED
									if cHora < (cTmp)->CYR_HRBG
										cHora := (cTmp)->CYR_HRBG
									Endif

									aRetorno  := SFCA311VTP(cCDTN,ALLTRIM(STR(DOW(dData))),cHora,(cTmp)->CYR_HRED,nSegUtil,nSegExtra)

									nSegUtil  := aRetorno[1]
									nSegExtra := aRetorno[2]
									cHora     := (cTmp)->CYR_HRED

									IF cNRTN != (cTmp)->CYR_NRTN
										cNRTN := '00000'
									Endif
								Endif
							Endif

							(cTmp)->(dbSkip())
						End

						(cTmp)->(dbCloseArea())
					Endif

					// Caso no último dia tenham acabado os turnos e ainda falte chegar até o fim, conta como extra
					if dData == dFim
						if cHora < cHoraFim
							nSegExtra += SFCXHourToSeg(ELAPTIME(cHora,cHoraFim))
						Endif

						Exit
					Else
						nHoraAnt := SFCXHourToSeg(ELAPTIME(cHora,'24:00:00'))
						cHora := '00:00:00'
					Endif

					// Troca o dia da Semana
					nDia := DOW(dData) + 1

					// Se 8, quer dizer que começou a semana de novo
					if nDia == 8
						nDia := 1
					Endif
				Endif
			next

			RestArea( aAreaCYZ )
		Endif
	Endif

	RestArea(aArea)
	RestArea(aAreaCYI)
	RestArea(aAreaCYB)

	nSegUtil := ROUND(nSegUtil,0)
	nSegExtra := ROUND(nSegExtra,0)

	AADD(a2Retorno,cCDTN)
	AADD(a2Retorno,cNRTN)
	AADD(a2Retorno,nSegUtil)
	AADD(a2Retorno,nSegExtra)
	AADD(a2Retorno,lOk)

Return a2Retorno

//Retorna a maquina de acordo com o centro de trabalho e a Letra inforamda na etiqeuta
static function RetMaqPai(cLetra,aMsgRet)
	Local cRet := ""
	Local cCentro:= PADR(cCentro,TAMSX3("CYB_CDCETR")[1])
	Local cQuery

	/*
	DbSelectarea("CYB")
	CYB->(DbSetOrder(1))
	if CYB->(DbSeek(xFilial("CYB")))
	while (!CYB->(EOF())) .AND. CYB->CYB_FILIAL == xFilial("CYB")
	if alltrim(CYB->CYB_X_LTMQ) == alltrim(cLetra)
	cRet:= CYB->CYB_CDMQ
	exit
	endif
	CYB->(DbSkip())
	end
	endif*/


	cQuery := "Select CYB_CDMQ "
	cQuery += " From "
	cQuery += RetSqlName("CYB")
	cQuery += " where "
	cQuery += " CYB_FILIAL = '"+FwxFilial("CYB")+"' and "
	cQuery += " TRIM(CYB_X_LTMQ) = '"+Alltrim(cLetra)+"' and D_E_L_E_T_ = ' ' "
	if Select("QCDMQ") > 0
		QCDMQ->(DbCloseArea())
	endif
	TcQUery cQuery new alias "QCDMQ"
	if !Eof()
		cRet := QCDMQ->CYB_CDMQ
	endif
	QCDMQ->(DbCloseArea())

	ACDConout({cFilAnt+" - "+"Verificando Maquina ... Letra: "+cLetra+" Filial: "+FwxFilial("CYB")})
	ACDConout({cFilAnt+" - "+"Resultado: "+cRet})

return cRet

static function RetMaqFil(cMaqPai,aMsgRet)
	Local cRet := ""

	DbSelectarea("CYB")
	CYB->(DbSetOrder(1))
	if CYB->(DbSeek(xFilial("CYB")+cMaqPai))
		DbSelectarea("CYI")
		CYI->(DbSetOrder(1))
		if CYI->(DbSeek(xFilial("CYI")+CYB->CYB_CDCETR))
			if !(empty(CYI->CYI_X_CTEN))
				DbSelectarea("CYB")
				CYB->(DbSetOrder(2))
				if CYB->(DbSeek(xFilial("CYB")+CYI->CYI_X_CTEN))
					cRet := CYB->CYB_CDMQ
				else
					AtuZ0E( "Nao encontrada maquina com este centro de trabalho: '"+CYI->CYI_CDCETR+"'",,,@aMsgRet)

				endif
			else
				AtuZ0E( "Centro de trabalho da maquina encaixotadora nao informado na maquina "+cMaqPai,,,@aMsgRet)

			endif
		else
			AtuZ0E( "Nao encontrado centro de trabalho com este codigo: '"+CYB->CYB_CDCETR+"'",,,@aMsgRet)

		endif
	else
		AtuZ0E( "Nao encontrada maquina com este codigo: '"+cLetraMq+"'",,,@aMsgRet)

	endif
return cRet

Static Function VldEtq(cEtq,nQtdMax,cEtqta,nSaldoApto,nQtdApto)
	Local lRet:= .T.
	Local cQuery := ""
	Local n_Plt := 0
	Local n_OP := 0
	Local cFinal:= " "


	Conout("["+cEtq+"] "+"LEITURA :"+Dtoc(Date())+"-"+Time())

	cQuery := "SELECT COUNT(*) QTD FROM "+RetSqlname("Z0E")+" Z0E "
	cQuery += "WHERE D_E_L_E_T_= ' ' "
	cQuery += "AND Z0E_FILIAL = '"+xFilial("Z0E")+"' "
	cQuery += "AND Z0E_ESTORN <> 'S' "
	cQuery += "AND Z0E_STATUS <> '0' "
	cQuery += "AND TRIM(Z0E_OPP) = '"+Alltrim(cEtqta)+"' "

	PlSQuery(cQuery, "_QZ0E")

	If _QZ0E->QTD > nQtdMax
		if lACD
			VtClear()
			VTAlert("Fila de apontamentos muito cheia ! Entre em contato com o T.I.","Erro")
		else
			Alert("Fila de apontamentos muito cheia ! Entre em contato com o T.I.")
		endif


		Return .F.
	Endif

	_QZ0E->(DbCloseArea())


	if len( Alltrim(cEtq) ) == 23 //14+TamSx3("D3_LOTECTL")[1]+4


		If SubStr(cEtq,1,8) <> Alltrim(Posicione("SC2",1,xFilial("SC2") + Alltrim(cEtqta) , "C2_PRODUTO"))
			if lACD
				VtClear()
				VTAlert("Produto da Etiqueta nao e o mesmo da O.P.","Erro")
			else
				Alert("Produto da Etiqueta nao e o mesmo da O.P.")
			endif
			Return .F.
		EndIf





		cQuery := "SELECT COUNT(*) QTD FROM "+RetSqlname("Z0E")+" Z0E "
		cQuery += "WHERE D_E_L_E_T_= ' ' "
		cQuery += "AND Z0E_FILIAL = '"+xFilial("Z0E")+"' "
		cQuery += "AND Z0E_ESTORN <> 'S' "
		cQuery += "AND LTRIM(RTRIM(Z0E_ETIQ)) = '" + AllTrim(cEtq)+ "' "

		TcQuery cQuery New Alias "QSD3E"

		if QSD3E->QTD > 0
			lRet:= .F.
			if lACD
				VtClear()
				VTAlert("Etiqueta "+cEtq+" ja apontada.",AllTrim("Erro"))
			else
				Alert("Etiqueta "+cEtq+" ja apontada.")
			endif
		endif

		QSD3E->(DbCloseArea())

		If lRet


			//Valida a quantidade da Etiqueta x Saldo disponivel


			n_Plt := Val(SubStr(Alltrim(cEtq),Len(Alltrim(cEtq))-3,4)) -1

			If n_Plt > 0

				//cEtq := SubStr(Alltrim(cEtq),1,Len(Alltrim(cEtq))-5) + StrZero(n_Plt,4)
				cEtq := SubStr(Alltrim(cEtq),1,Len(Alltrim(cEtq))-4) + StrZero(n_Plt,4)

				//Valida a Etiqueta Anterior
				cQuery := "SELECT COUNT(*) QTD FROM "+RetSqlname("Z0E")+" Z0E "
				cQuery += "WHERE D_E_L_E_T_= ' ' "
				cQuery += "AND Z0E_FILIAL = '"+xFilial("Z0E")+"' "
				cQuery += "AND Z0E_ESTORN <> 'S' "
				cQuery += "AND LTRIM(RTRIM(Z0E_ETIQ)) = '" + AllTrim(cEtq)+ "' "

				if select("QSD3E") > 0
					QSD3E->(DbCloseArea())
				endif

				TcQuery cQuery New Alias "QSD3E"

				if QSD3E->QTD = 0

					if lACD

						VtClear()
						nLin:= 1
						cFinal:= " "
						@nLin,00 VtSay "Etiqueta Anterior não apontada."
						nLin++
						@nLin,00 VtSay cEtq
						nLin++
						@nLin,00 VtSay "Continuar ? (S/N)"
						nLin++

						@nLin,00 VtGet cFinal
						VtRead

						If VTLastkey() == 27  // Tecla ESC
							VtClear()
							Return .F.
						EndIf

						cFinal := upper(cFinal)

						if cFinal == "S"
							lRet:= .T.
						Else
							lRet:= .F.
						Endif
						VtClear()
					else
						n_OP := Aviso("Atenção","Etiqueta Anterior "+cEtq+" não apontada. Continuar?",{"Sim","Nao"})

						If n_OP = 1
							lRet:= .T.
						Else
							lRet:= .F.
						Endif
					endif
				endif
				QSD3E->(DbCloseArea())



				if lRet 

					lRet := VldSaldo(SC2->C2_NUM+SC2->C2_ITEM+SC2->C2_SEQUEN,nQtdApto)

				endif


				if lRet
					lRet := VldTempo(cEtq)
				endif

			Endif

		Endif
	else
		lRet:= .F.
		if lACD
			VtClear()
			VTAlert("Etiqueta " + alltrim(cEtq) + " invalida. Tam "+Str(len(Alltrim(cEtq))),AllTrim("Erro"))
		else
			Alert("Etiqueta " + alltrim(cEtq) + " invalida. Tam "+Str(len(Alltrim(cEtq))))
		endif
	endif
return lRet



Static Function ValidPerg(cPerg)
	Local aRegs := {}
	Local i,j

	dbSelectArea("SX1")
	dbSetOrder(1)
	cPerg := PADR(cPerg,10)

	aAdd(aRegs,{cPerg,"01","OP: ","","","mv_ch1" ,"C", TAMSX3("C2_NUM")[1]+TAMSX3("C2_ITEM")[1]+TAMSX3("C2_SEQUEN")[1],0,0,"C","","mv_par01"  ,"","","","","","","","","","","","","","","","","","","","","","","","","",""})
	aAdd(aRegs,{cPerg,"02","Palete: ","","","mv_ch2" ,"C", U_DecEtq(),0,0,"C","","mv_par02"  ,"","","","","","","","","","","","","","","","","","","","","","","","","",""})

	For i:=1 to Len(aRegs)
		If !dbSeek(cPerg+aRegs[i,2])
			RecLock("SX1",.T.)
			For j:=1 to FCount()
				If j <= Len(aRegs[i])
					FieldPut(j,aRegs[i,j])
				Endif
			Next
			MsUnlock()
		Endif
	Next
return

static Function SFCA313E(xRotAuto,aMsgRet)
	Local oDlg, oCombo
	Local lRet         := .T.
	Local dDataEstorno := DATE()
	Local cNRORPO  := ''
	Local cIDAT    := ''
	Local cIDATQO  := ''
	Local aArea    := GetArea()
	Local aAreaCYV := CYV->(GetArea())
	Local lAutoExe := xRotAuto != nil

	if Ascan(xRotAuto,{|x|Alltrim(x[1]) == 'CYV_NRSQRP'}) == 0

		AutoGRLog('É preciso informar a sequencia do apontamento para realizar o estorno. Campos CYV_NRSQRP') //

		AtuZ0E( 'É preciso informar a sequencia do apontamento para realizar o estorno. Campos CYV_NRSQRP',,,@aMsgRet)


		lMsErroAuto := .T.

		lRet := .F.
	Else
		cNRSQRP := PadR(xRotAuto[Ascan(xRotAuto,{|x|Alltrim(x[1]) == 'CYV_NRSQRP'})][2],TamSX3('CYV_NRSQRP')[1])

		if Ascan(xRotAuto,{|x|Alltrim(x[1]) == 'CYV_DTEO'}) > 0
			dDataEstorno := xRotAuto[Ascan(xRotAuto,{|x|Alltrim(x[1]) == 'CYV_NRSQRP'})][2]
		Endif

		dbSelectArea('CYV')
		CYV->(dbSetOrder(1))
		CYV->(dbSeek(xFilial('CYV')+cNRSQRP))
	Endif

	if CYV->CYV_TPSTRP == '1'
		AtuZ0E( 'Somente apontamentos finalizados podem ser estornados',,,@aMsgRet)




		lRet := .F.
	Endif

	if CYV->CYV_LGRPEO
		AtuZ0E( 'Apontamento de Produção já foi estornado no dia ' + DTOC(CYV->CYV_DTEO),,,@aMsgRet)


		lRet := .F.
	Endif

	dbSelectArea('CYY')
	CYY->(dbSetOrder(1))
	CYY->(dbSeek(CYV->CYV_FILIAL+CYV->CYV_NRORPO+CYV->CYV_IDAT+CYV->CYV_IDATQO))

	if lRet

		cNRORPO := CYV->CYV_NRORPO
		cIDAT   := CYV->CYV_IDAT
		cIDATQO := CYV->CYV_IDATQO
		cNRSQRP := CYV->CYV_NRSQRP
		nQTATRP := CYV->CYV_QTATRP
		nQTATRF := CYV->CYV_QTATRF

		lRet := SFCA313OK(CYV->CYV_NRSQRP,dDataEstorno,,.T.,CYV->CYV_CDMQ,@aMsgRet)
	Endif

	RestArea(aArea)
	RestArea(aAreaCYV)

Return lRet

static Function SFCA313OK(cNRSQRP, dEstorno, lAlteraEst, lRotAut,cCDMQ,aMsgRet)
	Local lRet := .T.
	Local oModelCYV
	Local cNRORPO   := ''
	Local cIDAT     := ''
	Local oView     := FwViewActive()
	Private lOk     := .T. // Sinaliza se respondeu sim para reabrir operação e splits

	//Begin Transaction

	oModelCYV := FWLoadModel( 'SFCA313' )
	oModelCYV:SetOperation( 4 )

	dbSelectArea('CYV')
	CYV->(dbSetOrder(1))
	CYV->(dbGoTop())
	CYV->(dbSeek(xFilial('CYV')+cNRSQRP))

	cNRORPO := CYV->CYV_NRORPO
	cIDAT   := CYV->CYV_IDAT

	oModelCYV:Activate()

	oModelCYV:SetValue('CYVMASTER','CYV_DTEO'  , dEstorno)
	oModelCYV:SetValue('CYVMASTER','CYV_LGRPEO', .T.)
	oModelCYV:SetValue('CYVMASTER','CYV_CDUSOE', RetCodUsr())
	oModelCYV:SetValue('CYVMASTER','CYV_CDMQ', cCdMQ)

	if oModelCYV:VldData()
		oModelCYV:CommitData()
	Else
		aErro := oModelCYV:GetErrorMessage()
		AtuZ0E(aErro[6],,,@aMsgRet)
		lRet := .F.
	Endif
	oModelCYV:DeActivate()

	//CYV->(dbCloseArea())

	if !lRet
		//DisarmTransaction()

		IF oView != NIL
			oView:Refresh()
		Endif
	Endif

	//End Transaction

Return lRet



User Function JobApon(lManual,aMsgRet)	
	Local cLoteEtq		:= ""
	Local cQuery		:= ""

	Local c_Mens		:= ""
	Local cCodOrdemP	:= ""
	Local cCodOrdemF	:= ""
	Local cLetraMq		:= ""
	Local CNRSQRP		:= ""
	Local nQtCx			:= 0
	Local nQtPorCx		:= 0
	Local lContinua		:= .T.
	Local nZ			:= 0
	Local lOkTran		:= .F.
	Local cFilApon      := "XXXX"
	Local aArea
	Local n_QtdET		:= 0
	Local n_QtdE		:= 0
	Local aDifs			:= {}
	Local nQtdAptPai	:= 0
	Local nQtdAptFil	:= 0
	Local cMqPai		:= 0
	Local cMqFilho		:= 0   


	Private lAcdConout := .f.
	//Local cFilApon      := ParamIxb[1]
	DEFAULT lManual 	:= .F.

	Private lApontafilho := .T.
	Private cProdAtu	:= ""
	Private c_Mns		:= ""
	Private cLoteOp		:= ""
	Private cCodProFil	:= ""
	Private cCodProPai	:= ""
	Private _cEtqPallet	:= ""
	Private dDataZ0E
	Private lAutoErrNoFile 	:= .T.


	if IsInCallStack("U_JApon02")
		cFilApon := "0102"
	elseif IsInCallStack("U_JApon03")
		cFilApon := "0103"
	endif

	If !(Select("SX2") > 0)
		RPCCLEARENV()
		RPCSetType(3)
		RPCSetEnv("01",cFilApon,"","","","",{})	
	Endif
	aArea := GetArea()
	ACDConout({cFilAnt+" - "+"Filial para apontamento.... ["+cFilApon+"]"})



	if ValType(lManual) <> "L"
		lManual := .f.
	endif

	if ValType(aMsgRet) <> "A"
		aMsgRet := {}
	endif

	ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +")" +"JobApon****************************************"})


	if !lManual

		//Alterado porque como está usando indice de Status, quando dava reclock no campo status, desposicionada 
		//o registro

		//DbSelectArea("Z0E")
		//DbSetOrder(1)
		//DbSeek(xFilial("Z0E") + '1',.T.)
		cQuery := " Select R_E_C_N_O_ as RecnoZ0E "
		cQuery += " from "+RetSqlName("Z0E")
		cQuery += " where "
		cQuery += " Z0E_FILIAL = '"+cFilApon+"' "
		cQuery += " AND Z0E_STATUS<> '0' "
		//cQuery += " AND Z0E_SUSPEN <>'S' "
		cQuery += " AND Z0E_ESTORN <>'S' "
		cQuery += " AND D_E_L_E_T_ = ' ' "
		cQuery += " ORDER BY Z0E_STATUS,Z0E_DTUATU,Z0E_HRUATU,Z0E_DATA,Z0E_HORA  "
		if Select("QZ0E") > 0
			QZ0E->(DbCloseArea())
		endif
	else
		cQuery := " Select R_E_C_N_O_ as RecnoZ0E "
		cQuery += " from "+RetSqlName("Z0E")
		cQuery += " where "
		cQuery += " R_E_C_N_O_ =  "+Alltrim(Str(Z0E->(Recno())))+" "
		cQuery += " AND D_E_L_E_T_ = ' ' "
		if Select("QZ0E") > 0
			QZ0E->(DbCloseArea())
		endif	

		lAutoErrNoFile 	:= .F.
	endif	

	TcQuery cQuery new alias "QZ0E"

	Count to n_QtdET

	DbSelectArea("QZ0E")
	DbGoTop()



	If lManual .and. QZ0E->(Eof())
		ApMsgInfo("Não foi possível reservar registro para apontamento !")
		QZ0E->(DbCloseArea())
		DbSelectArea("Z0E")
		return(nil)		
	endif



	lExecutado := .f.

	ACDConout({"Apontamento iniciado para filial "+cFilApon+"["+Dtoc(Date())+"-"+Time()+"]"},.t.)

	While !QZ0E->(Eof()) 

		cLoteEtq	:= ""
		c_Mens		:= ""
		cCodOrdemP	:= ""
		cCodOrdemF	:= ""
		cLetraMq	:= ""
		CNRSQRP		:= ""
		nQtCx		:= 0
		nQtPorCx	:= 0
		lContinua	:= .T.
		nZ			:= 0
		lOkTran		:= .F.
		aDifs		:= {}
		nQtdAptPai	:= 0
		nQtdAptFil	:= 0
		cMqPai		:= ""
		cMqFilho	:= ""

		lApontafilho := .T.
		lAcdConout	:= .f.
		cProdAtu	:= ""
		c_Mns		:= ""
		cLoteOp		:= ""
		cCodProFil	:= ""
		cCodProPai	:= ""
		_cEtqPallet	:= ""
		dDataZ0E	:= Ctod('')

		ACDConout({"RECNO> >>>>>>", QZ0E->(RecnoZ0E)})
		if lExecutado
			exit
		endif
		lExecutado := lManual

		DbSelectArea("Z0E")
		Z0E->(DbGoTo(QZ0E->RecnoZ0E))
		dDataZ0E := Z0E->Z0E_DATA

		dDataBase := dDataZ0E 



		if Z0E->Z0E_SUSPEN == "S" .and. Z0E->Z0E_ESTORN<>'S'
			if !lManual
				DbSelectArea("QZ0E")
				DbSkip()
				Loop
			endif		
		elseif lManual .and. Z0E->Z0E_ESTORN == "S"
			ApMsgStop("Essa etiqueta não pode ser apontada pois foi estornada !")
			restarea(aArea)
			return(nil)
		elseIf Z0E->Z0E_STATUS == '0'
			if lManual
				ACDConout({Time()+" OP Pai:"+cFilApon+"-"+Alltrim(Z0E->Z0E_OPP)+"  --- Etiqueta: "+Z0E->Z0E_ETIQ},.t.)
				ApMsgInfo("Esse apontamento já foi realizado !")
				return( nil )
			else
				DbSelectArea("QZ0E")
				DbSkip()
				Loop
			endif	
		ElseIf !RecLock("Z0E")
			if lManual
				ACDConout({Time()+" OP Pai:"+cFilApon+"-"+Alltrim(Z0E->Z0E_OPP)+"  --- Etiqueta: "+Z0E->Z0E_ETIQ},.t.)
				ApMsgInfo("Não foi possível reservar este registro para apontamneto. Pode ser que ele já esteja sendo apontado pelo Job !")
				return ( nil )
			else
				DbSelectArea("QZ0E")
				DbSkip()
				Loop
			endif	
		Endif

		Z0E->Z0E_DTUATU := Date()
		Z0E->Z0E_HRUATU := Time()


		MsUnLock()
		RecLock("Z0E",.F.)

		n_QtdE ++
		ACDConout({Time()+" OP Pai:"+cFilApon+"-"+Alltrim(Z0E->Z0E_OPP)+"  --- Etiqueta: "+Z0E->Z0E_ETIQ + "("+ StrZero(n_QtdE,5)+"/"+ StrZero(n_QtdET,5) +")"},.t.)





		SM0->(DbSetOrder(1))
		SM0->(DbSeek("01"+Z0E->Z0E_FILIAL))
		cFilAnt := Z0E->Z0E_FILIAL

		_cEtqPallet := Z0E->Z0E_ETIQ


		//Tratativa para tamanho da Etiqueta Invalido
		if Len(Alltrim(Z0E->Z0E_ETIQ)) <> 23
			AtuZ0E("Etiqueta inválida"+chr(13)+chr(10)+"Tamanho: "+alltrim(str(len(Alltrim(Z0E->Z0E_ETIQ))))+chr(13)+chr(10)+"Correto: 23",.T. , '2',@aMsgRet)
			DbSelectArea("Z0E")
			MsUnLock()
			DbSelectArea("QZ0E")
			DbSkip()
			Loop					
		elseif " "$Alltrim(Z0E->Z0E_ETIQ)
			AtuZ0E("Etiqueta inválida"+chr(13)+chr(10)+"Há espaços em branco no código de barras da etiqueta! ",.T. , '2',@aMsgRet)
			DbSelectArea("Z0E")
			MsUnLock()
			DbSelectArea("QZ0E")
			DbSkip()
			Loop		
		endif

		//Tratativa para verificar se a OP existe
		if !VerificaOP(Z0E->Z0E_OPP,Z0E->Z0E_OPF,@aMsgRet)
			DbSelectArea("Z0E")
			MsUnLock()
			DbSelectArea("QZ0E")
			DbSkip()
			Loop
		endif

		cCodProPai := Posicione("SC2",1,xFilial("SC2") + Z0E->Z0E_OPP,"C2_PRODUTO")
		cCodProFil := Posicione("SC2",1,xFilial("SC2") + Z0E->Z0E_OPF,"C2_PRODUTO") 

		ACDConout({"Filial :"+Z0E_FILIAL+" / "+FwxFilial("Z0E")+"x-x-x-x-x-x-x-x-x-x-x-x-x-xx-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-xx-x-"})

		nQtCx 	 := Z0E->Z0E_QTDP
		nQtPorCx := Z0E->Z0E_QTDF

		cCodOrdemP := Z0E->Z0E_OPP
		cCodOrdemF := Z0E->Z0E_OPF


		cQuery := "SELECT COUNT(*) QTD FROM "+RetSqlname("SD3")+" SD3 "
		cQuery += "WHERE SD3.D_E_L_E_T_= ' ' "
		cQuery += "AND D3_FILIAL = '"+xFilial("SD3")+"' "
		cQuery += "AND LTRIM(RTRIM(D3_X_ETQ)) = '" + alltrim(_cEtqPallet)+"' "
		cQuery += "AND D3_ESTORNO <> 'S' "

		if Select("QSD3E") > 0
			QSD3E->(DbCloseArea())
		endif
		TcQuery cQuery New Alias "QSD3E"

		if QSD3E->QTD > 0
			AtuZ0E("Apontamento efetuado com Sucesso!!!",.T. , '0',@aMsgRet)
			MsUnLock()
			DbSelectArea("QZ0E")
			DbSkip()
			Loop
		endif

		QSD3E->(DbCloseArea())

		lApontafilho := .t.
		cLoteEtq := Substr(_cEtqPallet,9,11)


		//Implementado verificação de incosistência de apontamentos entre produto Acabado e 
		//produto unitário.
		//O número de apontamento de produtos acabados tem que coincidir com o número de apontamentos
		//de produtos filho.


		aDifs := {}
		cQuery :=" SELECT D3_LOTECTL,COUNT(*) AS APONTAMENTOS FROM "+RetSqlName("SD3")
		cQuery += " WHERE D3_FILIAL = '"+FwxFilial("SD3")+"' "
		cQuery += "AND D3_COD = '"+cCodProPai+"' "
		cQuery += "AND D3_LOTECTL = '"+cLoteEtq+"' "
		cQuery += "AND D_E_L_E_T_= ' ' "
		cQuery += "AND D3_ESTORNO = ' ' "
		cQuery += "AND D3_CF ='PR0' "
		cQuery += " GROUP BY D3_LOTECTL "


		TcQUery cQuery new alias "QCHKAPTO"

		nQtdAptPai := QChkApto->Apontamentos

		While !QChkApto->(Eof())

			aadd(aDifs,{QchkAPto->D3_LOTECTL,nQtdAptPai,0})

			QChkApto->(DbsKip())
		Enddo

		QChkAPto->(DbCloseArea())



		cQuery :=" SELECT D3_LOTECTL,COUNT(*) AS APONTAMENTOS FROM "+RetSqlName("SD3")
		cQuery += " WHERE D3_FILIAL='"+FwxFilial("SD3")+"' "
		cQuery += "AND D3_COD = '"+cCodProFil+"' "
		cQuery += "AND D3_LOTECTL = '"+cLoteEtq+"' "
		cQuery += "AND D_E_L_E_T_=' ' "
		cQuery += "AND D3_ESTORNO=' ' "
		cQuery += "AND D3_CF ='PR0' "
		cQuery += " GROUP BY D3_LOTECTL "

		TcQUery cQuery new alias "QCHKAPTO"

		While !QChkApto->(Eof())
			nQtdAptFil := QChkApto->Apontamentos
			if (nPosApto := Ascan(aDifs,{|x|Alltrim(x[1]) == QChkApto->D3_LOTECTL }) ) > 0
				aDifs[nPosApto,3] := QChkApto->Apontamentos
			else
				aadd(aDifs,{QchkAPto->D3_LOTECTL,0,nQtdAptFil})
			endif	
			QChkApto->(DbSkip())
		Enddo

		QChkAPto->(DbCloseArea())

		lContinua		:= .T.

		For nZ :=1 to Len(aDifs)

			if aDifs[nz,2] < aDifs[nz,3] //Tem mais unitários apontados do que produto final
				
				if !IsInCallStak("U_RACDA009") .or. !ApMsgYesNo("ATENÇÃO ! Esse lote tem mais Ops Filhas apontados do que Ops Pai. Deseja Continuar ?")
					lApontafilho := .f.
				endif
				
			elseif aDifs[nz,2] > aDifs[nz,3] //Tem mais produtos acabados do que unitários apontados.
				c_Mens := "Divergencia apontamentos !"+chr(13)+chr(10)+;
				"OP Pai  : " + cCodOrdemP +chr(13)+chr(10)+;
				"OP Filho: " + cCodOrdemF +chr(13)+chr(10)+;
				Alltrim(cCodProPai)+" - Pai  : "+Alltrim(Str(aDifs[nZ,2]))+chr(13)+chr(10)+;
				Alltrim(cCodProFil)+" - Filho: "+Alltrim(Str(aDifs[nZ,3]))

				AtuZ0E( c_Mens,,,@aMsgRet)

				lContinua := .F.
				Exit
			endif

		Next NZ

		If ! lContinua
			DbSelectArea("Z0E")
			MsUnLock()
			AtuZ0E( ' ', .T.,,@aMsgRet)

			DbSelectArea("QZ0E")
			DbSkip()
			Loop
		Endif




		If ! LockByName("RACDA001"+cCodOrdemP,.T.,.T.)
			Z0E->(MsUnLock())
			DbSelectArea("QZ0E")		
			DbSkip()
			Loop

		EndIf

		Begin Transaction
			ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +")" +"Inicio****************************************"})

			U_DecEtq(_cEtqPallet,,@cLoteOp,@cLetraMq,,.T.)		

			nLin:=1
			cMqPai:= RetMaqPai(cLetraMq,@aMsgRet)

			if !(empty(cMqPai))
				cMqFilho:= RetMaqFil(cMqPai,@aMsgRet)

				//Verifica se os roteiros de Operação estão devidamente configurados para calcular corretamente o tempo de produção

				//Roteiro de Operação da Máquina de Envaze



				if !(empty(cMqFilho)) //.and.lMaqPaiOk .and. lMaqFilOk

					//Aponta Filho
					cProdAtu:=	cCodProFil



					ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +")" +"Inicio Apontamento Filho("+ cCodOrdemF +")****************************************"})


					if lApontaFilho
						lContinua:= ApontaAtuo(cCodOrdemF,"0000000001",cMqPai,nQtCx * nQtPorCx,@aMsgRet,.t.)

						if lContinua
							RecLock("Z0E",.f.)
							Z0E->Z0E_FILHOK := "S"
							Z0E->(MsUnLock())
						endif
					else
						lContinua := .t.
					endif


					ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +")" +"Fim Apontamento Filho****************************************"})

					//CNRSQRP := CYV->CYV_NRSQRP
					//cCdMq   := CYV->CYV_CDMQ
					if !lContinua
						DisarmTransaction()
						UneSplit(cCodOrdemF,"0000000001",cMqPai)												
					endif


					if lContinua
						//Aponta Pai
						cProdAtu:=	cCodProPai
						lOkTran := .F.

						ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +")" +"Inicio Apontamento Pai("+ cCodOrdemP +")****************************************"})

						if ApontaAtuo(cCodOrdemP,"0000000001",cMqFilho,nQtCx,@aMsgRet,.f.)

							lOkTran := .T.
							AtuZ0E("Apontamento efetuado com Sucesso!!!",.T. , '0',@aMsgRet)
						else
							DisarmTransaction()
							UneSplit(cCodOrdemP,"0000000001",cMqFilho)

						endif
						ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +")" +"Fim Apontamento Pai****************************************"})

						if !lOkTran //Se não deu certo o apontamento do pai, Estorna o apontamento do filho

							RecLock("Z0E",.f.)
							Z0E->Z0E_FILHOK := "S"
							Z0E->(MsUnLock())


						endif
					endif

				endif
			else

				//if lMaqPaiOk
				AtuZ0E( "Nao encontrada maquina com a letra de referencia '"+cLetraMq+"'",,,@aMsgRet)
				//endif		

			endif

			UnLockByName("RACDA001"+cCodOrdemP,.T.,.T.)
			ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +")" +"Fim*******************************************"})

		End Transaction

		DbSelectArea("Z0E")
		if ! lOkTran
			AtuZ0E( ' ', .T.,,@aMsgRet)
		Endif


		DbSelectArea("QZ0E")
		DbSkip()
	EndDo
	ACDConout({"Apontamento finalizado para filial "+cFilApon},.t.)
Return

Static Function AtuZ0E( c_Mens, l_Grv, c_Status,aMsgRet)

	DEFAULT l_Grv := .F.
	DEFAULT c_Status := '2'

	ACDConout({cFilAnt+" - "+DtoC(Date()) +"-" + Time() +"("+ cUserName +") " + c_Mens})
	If c_Mens <> ' '
		c_Mns := c_Mens
	EndIf

	if l_Grv
		aadd(aMsgRet,c_Mns)
		DbSelectArea("Z0E")
		RecLock("Z0E",.F.)

		Replace Z0E_STATUS	with c_Status

		If c_Status = '0'
			Replace Z0E_SUSPEN with ' '
		Endif

		Replace Z0E_MENS	with DtoC(Date()) +"-" + Time() + Chr(13) + Chr(10) + c_Mns

		MsUnLock()
	Endif

Return





Static Function RetQtApon(nQtdC2)
	LOCAL nRet := nQtdC2
	LOCAL aArea := GetArea()
	LOCAL cQuery
	//Verifica as quantidades de etiquetas Lidas e ainda não apontadas:

	cQuery := " Select SUM(Z0E_QTDP) as QTD "
	cQUery += " from "+RetSqlName("Z0E")
	cQuery += " Where "
	cQuery += " Z0E_FILIAL = '"+SC2->C2_FILIAL+"' AND "
	cQUery += " Z0E_OPP = '"+SC2->C2_NUM+SC2->C2_ITEM+SC2->C2_SEQUEN+"'  AND Z0E_STATUS<>'0' and Z0E_ESTORN <>'S' AND "
	cQuery += " D_E_L_E_T_ = ' ' "

	if Select ("QQTDETQ") > 0
		QQTDETQ->(DbCloseArea())
	endif

	TcQUery cQUery new alias "QQTDETQ"

	if !QQTDETQ->(Eof())
		nRet += QQTDETQ->QTD
	endif
	QQTDETQ->(DbCloseArea())

	restarea(aArea)
return(nRet)



User Function JApon02()
	U_JobApon()
return

User Function JApon03()
	U_JobApon()
return




Static Function VldSaldo(cNumOP,nQtdApto)
	LOCAL aArea := GetArea()
	LOCAL cQuery 
	LOCAL QSC2
	LOCAL nSaldoC2
	LOCAL QZ0E
	LOCAL nSaldoZ0E

	cQuery := " Select C2_QUANT-C2_QUJE as SaldoC2 "
	cQuery += " From "+RetSqlName("SC2")+" "
	cQuery += " Where " 
	cQUery += " C2_FILIAL = '"+FwXFilial("SC2")+"' AND  "
	cQuery += " C2_NUM||C2_ITEM||C2_SEQUEN = '"+cNumOP+"' AND "
	cQuery += " D_E_L_E_T_=' ' "

	if Select("QSC2") > 0
		QSC2->(DbCloseArea())
	endif
	TcQuery cQuery new alias "QSC2"
	nSaldoC2 := QSC2->SALDOC2
	QSC2->(DbCloseArea())


	cQuery := " Select sum(Z0E_QTDP) as SaldoZ0E "
	cQuery += " From "+RetSqlName("Z0E")+" "
	cQuery += " Where " 
	cQUery += " Z0E_FILIAL = '"+FwXFilial("Z0E")+"' AND  "
	cQuery += " Z0E_OPP = '"+cNumOP+"' AND Z0E_STATUS<>'0' and Z0E_ESTORN <>'S' AND "
	cQuery += " D_E_L_E_T_=' ' "

	if Select("QZ0E") > 0
		QZ0E->(DbCloseArea())
	endif
	TcQuery cQuery new alias "QZ0E"
	nSaldoZ0E := QZ0E->SALDOZ0E
	QZ0E->(DbCloseArea())


	if nSaldoC2-nSaldoZ0E-nQtdApto < 0
		if lAcd
			VTAlert("Saldo insuficiente !"+chr(13)+chr(10)+"Saldo: "+Alltrim(Str(nSaldoC2-nSaldoZ0E))+chr(13)+chr(10)+"Qto apontamento: "+Alltrim(Str(nQtdAPto)),AllTrim("Erro"))
			lRet := .f.
		else
			Alert("Saldo insuficiente !"+chr(13)+chr(10)+"Saldo: "+Alltrim(Str(nSaldoC2-nSaldoZ0E))+chr(13)+chr(10)+"Qto apontamento: "+Alltrim(Str(nQtdAPto)))
			lRet := .f.				
		endif

	endif


	restArea(aArea)
return(lRet)




Static Function UneSplit(cOrdemProd,cOperacao,cMaquina)
	LOCAL aArea := GetArea()
	LOCAL aAreaQZ0E :=  QZ0E->(GetArea())
	LOCAL cQuery

	cQuery := " Select CYY_QTAT,R_E_C_N_O_ RECNOCYY from "
	cQUery += RetSqlName("CYY")
	cQuery += " where "
	cQuery += " CYY_FILIAL = '"+FwXFilial("CYY")+"' AND "
	cQuery += " CYY_NRORPO = '"+cOrdemProd+"' AND "
	cQuery += " CYY_IDAT = '"+cOperacao+"' AND "
	cQuery += " CYY_CDMQ = '"+cMaquina+"' AND "
	cQuery += " CYY_TPSTAT = '3' AND "
	cQuery += " CYY_QTATRP = 0 AND " 
	cQuery += " D_E_L_E_T_ = ' ' "
	if Select("QSplit") > 0
		QSplit->(DbCloseArea())
	endif
	TcQuery cQuery new alias "QSplit"


	cQuery := " Select R_E_C_N_O_ as RECNOCYY from "
	cQUery += RetSqlName("CYY")
	cQuery += " where "
	cQuery += " CYY_FILIAL = '"+FwXFilial("CYY")+"' AND "
	cQuery += " CYY_NRORPO = '"+cOrdemProd+"' AND "
	cQuery += " CYY_IDAT = '"+cOperacao+"' AND "
	cQuery += " CYY_CDMQ = ' ' AND "
	cQuery += " CYY_TPSTAT IN ('3','4') AND "
	cQuery += " D_E_L_E_T_ = ' ' "
	if Select("QSplit2") > 0
		QSplit2->(DbCloseArea())
	endif
	TcQuery cQuery new alias "QSplit2"

	if !QSplit2->(Eof())


		WHile !QSplit->(Eof())

			DbSelectArea("CYY")
			DBGoTo(QSplit2->RECNOCYY)

			RecLock("CYY",.f.)
			CYY->CYY_QTAT += QSplit->CYY_QTAT 
			CYY->(MsUnLock())
			CYY->(DbGoTo(QSplit->RECNOCYY))
			RecLock("CYY",.f.)
			DbDelete()
			CYY->(MsUnlock())

			DbSelectArea("QSplit")
			DbSkip()
		Enddo

	Endif

	restArea(aAreaQZ0E)
	restArea(aArea)
return



Static Function VerificaOP(cOpPai,cOpFilha,aMsgRet)
	Local aArea := GetArea()
	LOCAL aAreaSC2 := SC2->(GetArea())
	Local lRet := .t.

	DbSelectArea("SC2")
	DbSetOrder(1)

	if !DbSeek(FwxFilial("SC2")+cOPPai)
		lRet := .f.
		AtuZ0E("Ordem de Produção "+cOPPai+" não encontrada."+chr(13)+chr(10)+"Verifique se ela não foi excluida !",.t.,"2",@aMsgRet)
	elseif !DbSeek(FwxFilial("SC2")+cOpFilha)
		lRet := .f.
		AtuZ0E("Ordem de Produção "+cOPFilha+" não encontrada."+chr(13)+chr(10)+"Verifique se ela não foi excluida !",.t.,"2",@aMsgRet)
	endif

	restArea(aAreaSC2)
	restArea(aArea)
return(lRet)



Static Function ACDConout(aMsg,lForcaMsg)
	LOCAL nX
	DEFAULT lForcaMsg := .f.
	if lAcdConout .or. lForcaMsg
		For nX :=1 to len(aMsg)
			Conout(aMsg[nX])
		next nX
	endif			
return



Static Function VldTempo(cEtqPlt)
	LOCAL lRet := .t.
	LOCAL aArea := GetArea()
	Local cletraMaq := Substr(cEtqPlt,19,1)
	Local aRet:= {'20180101','00:01:00',Date(),Time()}
	Local cStrHora := dtos(Date())+Time()

	cQuery := " SELECT Z0E_DATA,Z0E_HORA FROM ( "
	cQuery += "	SELECT  Z0E_DATA,Z0E_HORA FROM  "+RetSqlName("Z0E")+"  WHERE Z0E_FILIAL='"+FwxFilial("Z0E")+"' AND D_E_L_E_T_ = ' ' AND SUBSTR(Z0E_ETIQ,19,1) = '"+Alltrim(cLetraMaq)+"' "
	cQuery += " AND Z0E_DATA||Z0E_HORA < '"+cStrHora+"' "  
	cQuery += " ORDER BY Z0E_DATA DESC,Z0E_HORA DESC ) WHERE ROWNUM < 2 "
	If Select("QHora") > 0
		QHora->(DbCloseArea())
	endif	
	TcQuery cQuery new alias "QHora"
	if !Eof()
		aRet[1] := StoD(QHora->Z0E_DATA)
		aRet[2] := QHora->Z0E_HORA

		nTempoOper := A680Tempo(aRet[1], Substr(aRet[2],1,5), aRet[3], Substr(aRet[4],1,5))

		if nTempoOper <=0
			lRet := .f.
			if lACD
				VTAlert("Leitura inválida."+chr(13)+chr(14)+"Deve ser respeitado o tempo de operação ! ","Falha")
			else
				Alert("Leitura inválida."+chr(13)+chr(14)+"Deve ser respeitado o tempo de operação ! ")
			endif		

		endif 

	endif

	QHora->(DbCloseArea())
	restArea(aArea)
return(lRet)



Static Function AjustaTempo(aRet)
	LOCAL aArea := GetArea()
	LOCAL dDataIni := aRet[1]
	LOCAL cHoraIni := aRet[2]
	LOCAL dDataFim := aRet[3]
	LOCAL cHoraFim := aRet[4]


	//Somar 1 segundo ho horário inicial
	nHor  :=  Val(Substr(cHoraIni,1,2))
	nMin  :=  Val(Substr(cHoraIni,4,2))
	nSeg  :=  Val(Substr(cHoraIni,7,2))

	nSeg++
	if nSeg > 59
		nSeg := 00
		nMin++
		if nMin > 59
			nMin := 00
			nHor++
			if nHor > 23
				nHor := 00
				dDataIni+= 1
			endif
		endif
	endif
	cHoraIni := StrZero(nHor,2)+":"+StrZero(nMin,2)+":"+StrZero(nSeg,2)

	//Subtrair 1 segundo do horário final
	nHor  :=  Val(Substr(cHoraFim,1,2))
	nMin  :=  Val(Substr(cHoraFim,4,2))
	nSeg  :=  Val(Substr(cHoraFim,7,2))

	nSeg--
	if nSeg < 0
		nSeg := 59
		nMin--
		if nMin < 0
			nMin := 59
			nHor--
			if nHor < 0
				nHor :=23
				dDataFim -= 1
			endif
		endif
	endif

	cHoraFim := StrZero(nHor,2)+":"+StrZero(nMin,2)+":"+StrZero(nSeg,2)

	aRet[1] := dDataIni
	aRet[2] := cHoraIni
	aRet[3] := dDataFim
	aRet[4] := cHoraFim
	restArea(aArea)
return(aRet)



Static Function QtdConsumo(cOp,cProd,nQtd,nQtdReport)
	Local nRet := nQtd
	LOCAL aArea   := GetArea()
	LOCAL aAreaC2 := SC2->(GetArea())
	LOCAL aAreaBZ := SBZ->(GetArea())
	LOCAL aAreaB1 := SB1->(GetArea())

	if nQtd == 0
		DbSelectArea("SC2")
		DbSetOrder(1)
		if DbSeek(FwxFilial("SC2")+Alltrim(cOp))
			DbSelectArea("SG1")
			DbSetOrder(1)
			if DbSeek(FwxFilial("SG1")+SC2->C2_PRODUTO+Alltrim(cProd))
				nQtdG1 := SG1->G1_QUANT
				DbSelectArea("SBZ")
				DbSetOrder(1) 
				if DbSeek(FwXFilial("SBZ")+SC2->C2_PRODUTO)
					nQtdBZ := if (SBZ->BZ_QB > 0, SBZ->BZ_QB,1)
					nRet := (nQtdG1 / nQtdBZ) * nQtdReport
				else
					DbSelectArea("SB1")
					DbSetOrder(1) 
					if DbSeek(FwXFilial("SB1")+SC2->C2_PRODUTO)
						nQtdB1 := if (SB1->B1_QB > 0, SB1->B1_QB,1)
						nRet := (nQtdG1 / nQtdB1) * nQtdReport
					endif
				endif
			endif
		endif
	endif
	restArea(aAreaC2)
	restArea(aAreaBZ) 
	restArea(aAreaB1) 
	restarea(aArea)
return(nRet)



Static Function DivB2xB8(cProdB2,cLocalB2,nQtdB2,nQtdB8)
	LOCAL aArea := GetArea()
	LOCAL lRet  := .t.
	LOCAL cQuery


	cQuery := " SELECT SUM(B2_QATU) AS B2QATU "
	cQuery += " From "
	cQuery += RetSqlName("SB2")
	cQuery += " Where "
	cQuery += " B2_FILIAL = '"+FwxFilial("SB2")+"' AND "
	cQuery += " B2_COD = '"+cProdB2+"' AND B2_LOCAL = '"+cLocalB2+"' AND D_E_L_E_T_=' ' "
	If Select("QB2") > 0
		QB2->(DbCloseArea())
	endif
	TcQuery cQuery new alias "QB2"
	nQtdB2 := QB2->B2QATU 

	QB2->(DbCloseArea())


	cQuery := " SELECT SUM(B8_SALDO) AS B8SALDO "
	cQuery += " From "
	cQuery += RetSqlName("SB8")
	cQuery += " Where "
	cQuery += " B8_FILIAL = '"+FwxFilial("SB8")+"' AND "
	cQuery += " B8_PRODUTO = '"+cProdB2+"' AND B8_LOCAL = '"+cLocalB2+"' AND D_E_L_E_T_=' ' "
	If Select("QB8") > 0
		QB8->(DbCloseArea())
	endif
	TcQuery cQuery new alias "QB8"
	nQtdB8 := QB8->B8SALDO 
	QB8->(DbCloseArea())

	lRet := ( nQtdB2 <> nQtdB8 )

	RestArea(aArea)
return(lRet)