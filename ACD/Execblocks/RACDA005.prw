#Include 'Protheus.ch'
#Include 'Topconn.ch'
#include "apvt100.ch"

/*

Rotina de Expedição MOCOCA - Tem o objetivo ler as etiquetas na expedição e liberar o pedido
após a leitura total de todas etiquetas.

Desenvolvida por Gabriel Cisneiro Lopes
*/

User Function RACDA005()
	Local nLin:=1
	Local cNumPed := space(TamSx3("C5_NUM")[1] + 1)
	Local cContinua := " "
	Local lok := .T.
	Local nI
	Local c_Prd := ""
	Local c_Lt := ""
	Local c_Plt := "" 
	Local c_Pds := ""
	Local n_I := 0

	Private a_Pds := {}
	Private aItems := {}

	DbSelectarea("Z0C")

	If ! U_VerDtFl(.F.)
		Return
	Endif

	While .T.
		VtClear()
		cNumPed := space(TamSx3("C5_NUM")[1] + 1)
		nLin:=1
		@nLin,00 VtSay "N. Pedido: "
		@nLin,12 VtGet cNumPed
		nLin += 1
		@nLin,00 VtSay "Pedido(s) lido(s): "
		nLin += 1
		n_I := 1
		While n_I <= Len(a_Pds)

			c_Pds += a_Pds[n_I] + " "

			If Len(c_Pds) > 18 .or. n_I = Len(a_Pds) 
				@nLin,00 VtSay c_Pds
				nLin += 1
				c_Pds := ""
			Endif

			n_I ++
		EndDo

		VtRead

		If VTLastkey() == 27  // Tecla ESC
			VtClear()
			Exit
		EndIf

		cNumPed := PadR(cNumPed,TamSx3("C5_NUM")[1])

		dbselectarea("SC5")
		SC5->(DbSetOrder(1))
		if SC5->(DbSeek(xFilial("SC5")+cNumPed))
			dbselectarea("Z0C")
			Z0C->(DbSetOrder(3))
			if Z0C->(DbSeek(xFilial("Z0C")+cNumPed)) .AND. Z0C->Z0C_STATUS == '2'
				VtClear()
				VTAlert("Pedido ja finalizado.",AllTrim("Falha"))
			else
				AADD(a_Pds,cNumPed)
			Endif
		else
			VtClear()
			VTAlert("Pedido "+cNumPed+" nao encontrado.",AllTrim("Falha"))
		endif
	EndDo

	If Len(a_Pds) = 0
		Return
	Endif

	while .T.

		if AtuItems() //Verifica se o pedido já está 100% conferido
			while .T.
				VtClear()
				nLin:= 1
				cEtq	 := Space(U_DecEtq() + 1) //space(tamsx3("Z0C_PRODUT")[1]+tamsx3("Z0C_LOTE")[1]+tamsx3("Z0C_PALLET")[1] + 1)
				//@nLin,00 VtSay "N. Pedido: "+cNumPed
				//nLin++
				@nLin,00 VtSay "Etiqueta: "
				@nLin,11 VtGet cEtq

				nLin++
				nLin++
				cMsg:=""
				if len(aItems) > 0
					for nI := 1 to len(aItems)
						if nI <= 5 
							@nLin,00 VtSay aItems[nI][3]
							nLin++
							@nLin,00 VtSay cvaltochar(aItems[nI][5]) + " de "+cvaltochar(aItems[nI][4]) +;
							iif(aItems[nI][6]<> 0," (+ " + cvaltochar(Int((aItems[nI][4] - aItems[nI][5]) / aItems[nI][6])) + " Plt)"," ") +;
							iif(aItems[nI][6]<> 0," (+ " + cvaltochar( aItems[nI][4] - aItems[nI][5] - (Int((aItems[nI][4] - aItems[nI][5]) / aItems[nI][6]) * aItems[nI][6])) + " Un)",;
							" (+" + cvaltochar((aItems[nI][4] - aItems[nI][5])) + " Un" )
							nLin++
						endif
					next nI
				else
					@nLin,00 VtSay "Ped(s). 100% conferido."
				endif

				VtRead

				If VTLastkey() == 27  // Tecla ESC
					VtClear()
					return
				EndIf

				U_DecEtq(cEtq, @c_Prd, @c_Lt,, @c_Plt)

				DbSelectarea("Z0B")
				Z0B->(DbSetOrder(1))
				if Z0B->(DbSeek(xFilial("Z0B") + alltrim(cEtq))) //Se for fracionamento entra aqui

					//Valida para que a quantidade total dos itens nao ultrapasse a quantidade total esperada no pedido
					if VldJaConf(cEtq,Z0B->Z0B_CODIGO) .AND. VldSldPed(Z0B->Z0B_CODIGO,cEtq)

						//Valida para que todos os itens sejam esperados no pedido
						if VldItFrac(Z0B->Z0B_CODIGO,cEtq)

							Begin Transaction
								while (!Z0B->(EOF())) .AND. Z0B->(Z0B_FILIAL+Z0B_CODIGO) == xFilial("Z0B")+alltrim(cEtq)
									lOk:= ValidaEtq(cNumPed,Z0B->(Alltrim(Z0B_PRODUT) + Z0B_LOTE + Alltrim(Z0B_PALLET)),Z0B->Z0B_QTD,Z0B->Z0B_CODIGO)
									if !lOk
										exit
									endif
									Z0B->(DbSkip())
								end

								if !lok
									DisarmTransaction()
								endif
							end Transaction

						else
							lOk := .F.
						endif
					else
						lOk := .F.
					endif
				else
					if c_Prd = " "
						VtClear()
						VTAlert("Etiqueta nao Encontrada!!!."+ Chr(13) + Chr(10) + cEtq ,AllTrim("Falha"))
						lOk := .F.
					Else
						Z0B->(DbSetOrder(2))
						if Z0B->(DbSeek(xFilial("Z0B") + c_Prd + c_Lt + c_Plt)) //Se estiver bipando o pallet que deu origem a um fracionamento
							VtClear()
							VTAlert("Palete fracionado nao pode ser expedido com a etiqueta original.",AllTrim("Falha"))
							lOk := .F.
						else
							//Nao francionado
							//Valida para que a quantidade total dos itens nao ultrapasse a quantidade total esperada no pedido
							if VldJaConf(cEtq,"") .AND. VldSldPed("",cEtq)
								Begin Transaction
									lOk:=  ValidaEtq(cNumPed,cEtq)
									if !lOk
										DisarmTransaction()
									endif
								End Transaction
							else
								lOk := .F.
							endif
						endif
					Endif
				endif

				if lOk
					VtClear()
					//VTAlert("Palete conferido com sucesso.",AllTrim("Sucesso"))
				endif

				if !AtuItems()
					Return
				endif
			endDo
		Else
			Exit
		endif
	EndDo
Return


//Rotina que Valida osdados da etiqueta e grava a leitura
static function ValidaEtq(cNumPed,cEtq,nQtd,cNumFrac)
	Local lFrac := .F.
	Local nSaldo := 0
	Local lRet := .T.
	Local c_Prd := ""
	Local c_Lt := ""
	Local c_Plt := "" 
	Local n_I := 0

	Default nQtd := 0
	Default cNumFrac := ""

	U_DecEtq(cEtq, @c_Prd, @c_Lt,, @c_Plt)

	lFrac := nQtd > 0

	If lFrac
		dbselectarea("Z0B")
		Z0B->(DbSetOrder(1))
		if Z0B->(DbSeek(xFilial("Z0B")+cNumFrac))
			if Z0B->Z0B_STATUS == '1' 
				Z0C->(DbSetOrder(1))
				if !(Z0C->(DbSeek(xFilial("Z0C") + c_Prd + c_Lt + c_Plt + cNumFrac)))
					While Z0B->(Z0B_FILIAL + Z0B_CODIGO) = xFilial("Z0B") + cNumFrac 
						dbselectarea("SC6")
						SC6->(DbSetOrder(2))
						For n_I := 1 To Len(a_Pds)
							if ! SC6->(DbSeek(xFilial("SC6") + c_Prd + a_Pds[n_I]))

								lRet := .F.
								//Exit
							Else
								lRet := .T.
								Exit
							endif
						Next
						If !lRet
							VtClear()
							VTAlert("Produto "+ c_Prd +" nao encontrado no(s) pedido(s) ",AllTrim("Falha"))
							Exit
						Endif
						Z0B->(DBSkip())
					EndDo

					If lRet
						Z0B->(DbSetOrder(1))
						Z0B->(DbSeek(xFilial("Z0B")+cNumFrac))

						While Z0B->(Z0B_FILIAL + Z0B_CODIGO) = xFilial("Z0B") + cNumFrac

							GravaZ0C(Z0B->(Alltrim(Z0B_PRODUT) + Z0B_LOTE + Alltrim(Z0B_PALLET)),Z0B->Z0B_QTD,cNumFrac)

							DbSelectarea("Z0B")
							Reclock("Z0B",.F.)
							Replace Z0B_STATUS with '2'
							MsUnlock()

							Z0B->(DBSkip())

						EndDo
					Endif
				else
					VtClear()
					VTAlert("Etiqueta ja expedida para o pedido "+Z0C->Z0C_PEDIDO+".",AllTrim("Falha"))
					lRet := .F.
				endif
			else
				VtClear()
				VTAlert("Separacao com status("+Z0B->Z0B_STATUS+") diferente de 'separado'.",AllTrim("Falha"))
				lRet := .F.
			endif
		else
			VtClear()
			VTAlert("Separacao nao encontrada.",AllTrim("Falha"))
			lRet := .F.
		endif
	Else
		dbselectarea("Z0A")
		Z0A->(DbSetOrder(1))
		if Z0A->(DbSeek(xFilial("Z0A")+ c_Prd + c_Lt + c_Plt))
			if Z0A->Z0A_STATUS == '1' 
				dbselectarea("Z0C")
				Z0C->(DbSetOrder(1))
				if !(Z0C->(DbSeek(xFilial("Z0C") + c_Prd + c_Lt + c_Plt)))
					dbselectarea("SC6")
					SC6->(DbSetOrder(2))
					For n_I := 1 To Len(a_Pds)
						if ! SC6->(DbSeek(xFilial("SC6") + c_Prd + a_Pds[n_I]))

							lRet := .F.
							//Exit
						Else
							lRet := .T.
							Exit
						endif
					Next
					If !lRet
						VtClear()
						VTAlert("Produto "+ c_Prd +" nao encontrado no(s) pedido(s) ",AllTrim("Falha"))
					Else
						nQtd := Z0A->Z0A_QTD

						GravaZ0C(cEtq,nQtd,cNumFrac)

						DbSelectarea("Z0A")
						Reclock("Z0A",.F.)
						Replace Z0A_STATUS with '2'
						MsUnlock()

					endif
				else
					VtClear()
					VTAlert("Etiqueta ja expedida para o pedido "+Z0C->Z0C_PEDIDO+".",AllTrim("Falha"))
					lRet := .F.
				endif
			else
				VtClear()
				VTAlert("Separacao com status("+Z0A->Z0A_STATUS+") diferente de 'separado'.",AllTrim("Falha"))
				lRet := .F.
			endif
		else
			VtClear()
			VTAlert("Separacao nao encontrada.",AllTrim("Falha"))
			lRet := .F.
		endif
	Endif
	DbCommit()
return lRet


//Grava os dados na tabela transitoria Z0C
Static function GravaZ0C(cEtq,nQtd,cNumFrac)
	Local c_Prd := ""
	Local c_Lt := ""
	Local c_Plt := "" 
	Local n_SlPd := 0
	Local n_Quant := 0
	Local n_I := 0


	U_DecEtq(cEtq, @c_Prd, @c_Lt, ,@c_Plt)

	For n_I := 1 To Len(a_Pds)
		n_SlPd := SldPed(a_Pds[n_I],c_Prd)

		If n_SlPd > 0 

			If n_SlPd < nQtd
				n_Quant := n_SlPd
			Else
				n_Quant := nQtd
			Endif

			dbselectarea("Z0C")
			Reclock("Z0C",.T.)
			Replace Z0C_FILIAL with xFilial("Z0C")
			Replace Z0C_PEDIDO with a_Pds[n_I]
			Replace Z0C_PRODUT with c_Prd
			Replace Z0C_LOTE   with c_Lt
			Replace Z0C_PALLET with c_Plt
			Replace Z0C_QTD   with n_Quant
			Replace Z0C_FRACIO with cNumFrac
			Replace Z0C_STATUS with '1'
			MsUnLock()

			If n_Quant = nQtd
				Exit
			Else
				nQtd := nQtd - n_Quant
			Endif
		Endif
	Next
return


//Verifica se o pedido foi 100% conferido. Caso verdadeiro, pergunta se deseja finaliza-lo
Static function atuItems()
	Local cFinal:= " "
	Local lRet := .T.
	Local n_I := 0


	aItems:= RetItems()
	if len(aItems) == 0
		VtClear()
		nLin:= 1
		cFinal:= " "
		@nLin,00 VtSay "Pedido(s) ja conferido(s). "
		nLin++
		@nLin,00 VtSay "Finalizar ? (S/N)"
		nLin++

		@nLin,00 VtGet cFinal
		VtRead

		If VTLastkey() == 27  // Tecla ESC
			VtClear()
			Return .F.
		EndIf
		cFinal := upper(cFinal)
		if cFinal == "S"
			For n_I := 1 to Len(a_Pds)
				VtClear()
				@1,00 VtSay "Aguarde, processando Pedido: " + a_Pds[n_I] 
				FinalizaPd(a_Pds[n_I])
			Next
		Else
			VtClear()
			nLin:= 1
			cFinal:= " "
			@nLin,00 VtSay "Ped(s). 100% conferido."
			nLin++
			@nLin,00 VtSay "Deseja alterar? (S/N)"
			nLin++

			@nLin,00 VtGet cFinal
			VtRead

			If VTLastkey() == 27  // Tecla ESC
				VtClear()
				Return .F.
			EndIf
			cFinal := upper(cFinal)
			if cFinal == "S"
				Return .T.
			Endif
		endif
		lRet := .F.
	endif

return lRet


//Retorna todos itens do pedido que ainda precisam ser conferidos
static function RetItems()
	Local cQuery:=""
	Local aRet := {}
	Local cPedido := ""
	Local n_I := 0

	For n_I := 1 To Len(a_Pds)
		cPedido += "'" + a_Pds[n_I] + "',"
	Next

	cPedido :=  SubStr(cPedido,1,Len(cPedido)-1)

	cQuery += "SELECT B1_DESC,C6_PRODUTO,SUM(C6_QTDVEN) C6_QTDVEN, "
	cQuery += "(SELECT SUM(Z0C_QTD) FROM "+RetSqlName("Z0C")+" Z0C "
	cQuery += "WHERE Z0C_FILIAL ='"+xFilial("Z0C")+"' "
	cQuery += "AND Z0C_PEDIDO IN ("+ cPedido +")  "
	cQuery += "AND Z0C_PRODUT = C6_PRODUTO "
	cQuery += "AND Z0C.D_E_L_E_T_=' '  ) Z0C_QTD "
	cQuery += "FROM "+RetSqlName("SC6")+" SC6, "
	cQuery +=  RetSqlName("SB1")+" SB1  "
	cQuery += "WHERE C6_FILIAL = '"+xFilial("SC6")+"' "
	cQuery += "AND SC6.D_E_L_E_T_=' ' "
	cQuery += "AND C6_NUM IN ("+ cPedido +") "
	cQuery += "AND B1_COD = C6_PRODUTO "
	cQuery += "AND SB1.D_E_L_E_T_=' ' "
	cQuery += "GROUP BY B1_DESC,C6_PRODUTO "
	cQuery += "ORDER BY 3 DESC"

	if select("QSC6")>0
		QSC6->(DbCloseArea())
	endif

	TcQUery cQuery new alias "QSC6"

	while !QSC6->(EOF())
		if QSC6->C6_QTDVEN - QSC6->Z0C_QTD > 0
			aadd(aRet,{cPedido, QSC6->C6_PRODUTO,;
			substr(QSC6->B1_DESC,1,14) + "..." + substr(Alltrim(QSC6->B1_DESC),Len(Alltrim(QSC6->B1_DESC))-13,13),;
			QSC6->C6_QTDVEN, QSC6->Z0C_QTD, Posicione("SB5", 1, xFilial("SB5") + QSC6->C6_PRODUTO, "B5_QEL")})
		endif
		QSC6->(DbSkip())
	end

	QSC6->(DbCloseArea())	

return aRet


//Verifica se todos os itens do fracionamento são esperados para o Pedido
static function VldItFrac(cNumFrac,cEtq)
	Local aArea := GetArea()
	Local aAreaZ0B := Z0B->(GetArea())
	Local aAreaZ0A := Z0A->(GetArea())
	Local lRet := .T.
	Local n_I := 0


	DbSelectarea("Z0B")
	Z0B->(DbSetOrder(1))

	if Z0B->(DbSeek(xFilial("Z0B")+cNumFrac))
		while (!Z0B->(EOF())) .AND. Z0B->(Z0B_FILIAL+Z0B_CODIGO) == xFilial("Z0B") + cNumFrac
			dbselectarea("SC6")
			SC6->(DbSetOrder(2))
			For n_I := 1 To Len(a_Pds)

				if !SC6->(DbSeek(xFilial("SC6") + Z0B->Z0B_PRODUT + a_Pds[n_I]))

					lRet := .F.
					//exit
				Else
					lRet := .T.
					Exit
				endif
			Next

			If !lRet
				VtClear()
				VTAlert("Produto "+ alltrim(Z0B->Z0B_PRODUT)+" - "+ alltrim(POSICIONE("SB1",1,xFilial("SB1")+Z0B->Z0B_PRODUT,"B1_DESC"))+" nao esperado para o pedido.",AllTrim("Falha"))
				Exit
			Endif

			Z0B->(DbSkip())
		end
	else
		VtClear()
		VTAlert("Etiqueta de fracionamento nao encontrada.",AllTrim("Falha"))
		lRet := .F.
	endif

	restarea(aAreaZ0A)
	restarea(aAreaZ0B)
	restarea(aArea)
return lRet


/*
Rotina responsável por verificar se a quantidade total dos itens da etiqueta nao ultrapassará
o total do pedido
*/
Static function VldSldPed(cNumFrac,cNumEtq)
	Local cQuery := ""
	Local lRet := .T.
	Local c_Prd := ""
	Local c_Lt := ""
	Local c_Plt := "" 
	Local cNumPed := ""
	Local n_I := 0

	For n_I := 1 To Len(a_Pds)
		cNumPed += "'" + a_Pds[n_I] + "',"
	Next

	cNumPed :=  SubStr(cNumPed,1,Len(cNumPed)-1)

	U_DecEtq(cEtq, @c_Prd, @c_Lt,, @c_Plt)

	cQuery+="SELECT B1_DESC,C6_PRODUTO,SUM(C6_QTDVEN) C6_QTDVEN, "
	cQuery+="COALESCE((SELECT SUM(Z0C_QTD) FROM "+RetSqlName("Z0C")+" Z0C WHERE Z0C_FILIAL ='"+xFilial("Z0C")+"' "
	cQuery+="AND Z0C_PEDIDO IN ("+cNumPed+") AND Z0C_PRODUT = C6_PRODUTO AND Z0C.D_E_L_E_T_=' '  ),0) Z0C_QTD, "

	if !(empty(cNumFrac))
		cQuery+="COALESCE((SELECT SUM(Z0B_QTD) FROM "+RetSqlName("Z0B")+" Z0B WHERE Z0B_FILIAL='"+xFilial("Z0B")+"' "
		cQuery+="AND Z0B_PRODUT = C6_PRODUTO AND Z0B.D_E_L_E_T_=' ' "
		cQuery+="AND Z0B_CODIGO='"+cNumFrac+"' ),0) QTD_APT "
	else
		cQuery+="COALESCE((SELECT SUM(Z0A_QTD) FROM "+RetSqlName("Z0A")+" Z0A WHERE Z0A_FILIAL='"+xFilial("Z0A")+"' "
		cQuery+="AND Z0A_PRODUT = C6_PRODUTO AND Z0A.D_E_L_E_T_=' ' "
		cQuery+="AND Z0A_PRODUT||Z0A_LOTE||Z0A_PALLET='"+ c_Prd + c_Lt + c_Plt +"' ),0) QTD_APT "
	endif

	cQuery+="FROM "+RetSqlName("SC6")+" SC6 "
	cQuery+=","+RetSqlName("SB1")+" SB1  WHERE C6_FILIAL = '"+xFilial("SC6")+"' AND SC6.D_E_L_E_T_=' ' "
	cQuery+="AND C6_NUM IN ("+cNumPed+") AND B1_FILIAL = '"+xFilial("SB1")+"' AND B1_COD = C6_PRODUTO AND SB1.D_E_L_E_T_=' ' "
	cQuery+="GROUP BY B1_DESC,C6_PRODUTO "


	if select("QSLD") > 0
		QSLD->(DbCLoseArea())
	endif

	TcQuery cQuery New Alias "QSLD"

	While !QSLD->(EOF())
		if QSLD->C6_QTDVEN < QSLD->(Z0C_QTD+QTD_APT)
			lRet := .F.
			VtClear()
			VTAlert("Produto "+ alltrim(QSLD->C6_PRODUTO)+" - "+ substr(alltrim(QSLD->B1_DESC),1,15)+" ultrapassa ";
			+"qtd esperada. "+chr(13)+chr(10);
			+"Tot Esperado: "+ cvaltochar(QSLD->C6_QTDVEN)+chr(13)+chr(10);
			+"Ja apontado: "+ cvaltochar(QSLD->Z0C_QTD)+chr(13)+chr(10);
			+"Apontando: "+ cvaltochar(QSLD->QTD_APT),AllTrim("Falha"))
			exit
		endif
		QSLD->(DbSkip())
	End

	QSLD->(DbCLoseArea())

return lRet


Static function SldPed(c_Ped, c_Pro)
	Local cQuery := ""
	Local n_Ret := 0
	Local c_Prd := ""
	Local c_Lt := ""
	Local c_Plt := "" 


	cQuery += "SELECT B1_DESC,C6_PRODUTO,SUM(C6_QTDVEN) C6_QTDVEN, "
	cQuery += "COALESCE((SELECT SUM(Z0C_QTD) FROM "+RetSqlName("Z0C")+" Z0C WHERE Z0C_FILIAL ='"+xFilial("Z0C")+"' "
	cQuery += "AND Z0C_PEDIDO = '" + c_Ped + "' AND Z0C_PRODUT = C6_PRODUTO AND Z0C.D_E_L_E_T_=' '  ),0) Z0C_QTD "
	cQuery += "FROM "+RetSqlName("SC6")+" SC6 ,"+RetSqlName("SB1")+" SB1  "
	cQuery += "WHERE SC6.D_E_L_E_T_=' ' AND SB1.D_E_L_E_T_=' ' "
	cQuery += "AND B1_FILIAL = '"+xFilial("SB1")+"'
	cQuery += "AND C6_FILIAL = '"+xFilial("SC6")+"'
	cQuery += "AND C6_NUM = '" + c_Ped + "' "
	cQuery += "AND C6_PRODUTO = '"+ c_Pro +"' "
	cQuery += "AND B1_COD = C6_PRODUTO "
	cQuery += "GROUP BY B1_DESC,C6_PRODUTO "


	if select("QSLD") > 0
		QSLD->(DbCLoseArea())
	endif

	TcQuery cQuery New Alias "QSLD"

	If ! Eof()
		n_Ret := QSLD->C6_QTDVEN - QSLD->(Z0C_QTD)
	Endif

	QSLD->(DbCLoseArea())

return n_Ret


/*
Rotina responsável por verificar se a etiqueta que está sendo bipada
já foi bipada anteriormente. Se sim, pergunta se deseja estornar
*/
Static Function VldJaConf(cEtq,cNumFrac)
	Local lRet := .T.
	Local lPodeEstor := .F.
	Local lExisteZ0C := .F.
	local cEstorna := " "
	Local c_Prd := ""
	Local c_Lt := ""
	Local c_Plt := "" 

	U_DecEtq(cEtq, @c_Prd, @c_Lt,, @c_Plt)

	dbselectarea("Z0C")

	if !(empty(cNumFrac))
		Z0C->(DbSetOrder(2))
		if Z0C->(DbSeek(xFilial("Z0C")+cNumFrac))
			lExisteZ0C := .T.
			lPodeEstor:= Z0C->Z0C_STATUS=='1'
		endif
	else
		Z0C->(DbSetOrder(1))
		if Z0C->(DbSeek(xFilial("Z0C") + c_Prd + c_Lt + c_Plt))
			lExisteZ0C := .T.
			lPodeEstor:= Z0C->Z0C_STATUS=='1'
		endif
	endif

	Begin Transaction

		if lExisteZ0C
			if lPodeEstor
				VtClear()

				nLin:= 1
				@nLin,00 VtSay "Etiq. Ja Conferida! "
				nLin++
				@nLin,00 VtSay "Deseja Estornar "
				nLin++
				@nLin,00 VtSay "A Conferencia? (S/N) "
				nLin++
				@nLin,00 VtGet cEstorna
				VtRead

				If VTLastkey() == 27  // Tecla ESC
					VtClear()
					Return
				EndIf

				cEstorna:= Upper(cEstorna)
				if cEstorna == "S"
					VtClear()
					@1,00 VtSay "Aguarde, estornando... "

					if !(empty(cNumFrac))
						Z0C->(DbSetOrder(2))
						if Z0C->(DbSeek(xFilial("Z0C")+cNumFrac))

							if Z0B->(DbSeek(Z0C->(Z0C_FILIAL+Z0C_FRACIO)))
								RecLock("Z0B",.F.)
								Replace Z0B_STATUS with '1'
								MsUnlock()

								Z0C->(DbSetOrder(2))
								while Z0C->(DbSeek(xFilial("Z0C")+cNumFrac))

									DbSelectarea("Z0C")
									RecLock("Z0C",.F.)
									Replace Z0C_STATUS with '3'
									MsUnLock()

									Reclock("Z0C",.F.)
									Z0C->(DbDelete())
									MsUnlock()
								EndDo
							else
								VtClear()
								VTAlert("Fracionamento nao encontrado.",AllTrim("Falha"))
								lRet := .F.
							endif
						else
							VtClear()
							VTAlert("Fracionamento nao encontrada.",AllTrim("Falha"))
							lRet := .F.
						endif

						if lRet
							VtClear()
							VTAlert("Separacao estornada com sucesso.",AllTrim("Sucesso"))
						endif


					else
						DbSelectarea("Z0A")
						Z0A->(DbSetORder(1))
						if Z0A->(DbSeek(Z0C->(Z0C_FILIAL+Z0C_PRODUT+Z0C_LOTE+Z0C_PALLET)))
							RecLock("Z0A",.F.)
							Replace Z0A_STATUS with '1'
							MsUnlock()

							DbSelectarea("Z0C")
							RecLock("Z0C",.F.)
							Replace Z0C_STATUS with '3'
							MsUnLock()

							Reclock("Z0C",.F.)
							Z0C->(DbDelete())
							MsUnlock()
						else
							VtClear()
							VTAlert("Separacao nao encontrada.",AllTrim("Falha"))
							lRet := .F.
						endif
					endif
				endif
			else
				VtClear()
				VTAlert("Etiqueda ja utilizada em Pedido finalizado.",AllTrim("Falha"))
				lRet := .F.
			endif
		endif

		if !lRet
			DisarmTransaction()
		endif
	end transaction

	if lRet
		lRet := !lExisteZ0C
	endif

	DbCommit()
return lRet


/*
Rotina responsável por Atualizar e Liberar o pedido de vendas
de acordo com o que foi conferido.
*/
static function FinalizaPd(cNumPed)
	Local cQuery := ""
	Local cProdAtu := ""
	Local aAux := {}
	Local aIteAuto:= {}
	Local aCabAuto:= {}
	Local aSaldos := {}
	Local nX
	Local lRet := .T.
	Local c_Txt := ""
	Local aErroAuto := {}
	Local nI := 0
	Local nQtdLib := 0

	Private lMsErroAuto := .F.
	Private lAutoErrNoFile 	:= .T.

	Begin Transaction

		DbSelectarea("SC5")
		SC5->(DbSetOrder(1))
		If SC5->(DbSeek(xFilial("SC5")+cNumPed))

			cQuery+="select Z0C_PRODUT,Z0C_LOTE,Z0A_ENDERE, SUM(Z0C_QTD) Z0C_QTD  "
			cQuery+="from "+RetSqlName("Z0C")+" Z0C ,"+RetSqlName("Z0A")+" Z0A  where "
			cQuery+="Z0C_FILIAL='"+xFilial("Z0C")+"' AND "
			cQuery+="Z0C_FILIAL = Z0A_FILIAL and Z0C_PRODUT = Z0A_PRODUT and Z0C_LOTE = Z0A_LOTE and Z0C_PALLET = Z0A_PALLET "
			cQuery+="and Z0A.D_E_L_E_T_= ' ' and Z0C.D_E_L_E_T_= ' ' "
			cQuery+="and Z0C_PEDIDO = '"+cNumPed+"' "
			cQuery+="group by Z0C_PRODUT,Z0C_LOTE,Z0A_ENDERE "

			if select("QPED")>0
				QPED->(DbCloseArea())
			endif

			Tcquery cQuery new alias "QPED"

			while (!QPED->(EOF()))
				AADD(aSaldos,{alltrim(QPED->Z0C_PRODUT),QPED->Z0C_LOTE,QPED->Z0A_ENDERE,QPED->Z0C_QTD})
				QPED->(DbSKip())
			end
			QPED->(DbCloseArea())

			if len(aSaldos)>0

				aAdd(aCabAuto, {"C5_FILIAL" , SC5->C5_FILIAL	, nil})
				aAdd(aCabAuto, {"C5_NUM"   	, SC5->C5_NUM		, nil})
				aAdd(aCabAuto, {"C5_TIPO"   , SC5->C5_TIPO     , nil}) // TIPO DO PEDIDO
				aAdd(aCabAuto, {"C5_CLIENTE", SC5->C5_CLIENTE   , nil}) // CÓDIGO DO CLIENTE
				aAdd(aCabAuto, {"C5_LOJACLI", SC5->C5_LOJACLI  , nil}) // LOJA DO CLIENTE

				dbselectarea("SC6")
				SC6->(DbSetOrder(1))
				if SC6->(DbSeek(SC5->(C5_FILIAL+C5_NUM)))
					while (!SC6->(EOF())).AND. SC6->(C6_FILIAL+C6_NUM) == xFilial("SC6")+SC5->C5_NUM
						cUltItem:= SC6->C6_ITEM
						SC6->(DbSKip())
					end
				endif

				dbselectarea("SC6")
				SC6->(DbSetOrder(1))
				if SC6->(DbSeek(SC5->(C5_FILIAL+C5_NUM)))

					while (!SC6->(EOF())).AND. SC6->(C6_FILIAL+C6_NUM) == xFilial("SC6")+SC5->C5_NUM
						lInc := .F.
						nSaldoSC6 := SC6->C6_QTDVEN
						while nSaldoSC6 > 0
							aAux := {}
							nPos := (aScan(aSaldos,{|x| x[1] == alltrim(SC6->C6_PRODUTO) .AND. x[4] > 0 }))
							if nPos > 0

								if !lInc
									cItem := SC6->C6_ITEM
								else
									cItem := Soma1(cUltItem)
									cUltItem:= cItem
								endif

								if nSaldoSC6 >= aSaldos[nPos][4]
									nQtdApon := aSaldos[nPos][4]
								else
									nQtdApon := nSaldoSC6
								endif

								aSaldos[nPos][4] -= nQtdApon
								nSaldoSC6-= nQtdApon

								aAdd(aAux, {"C6_ITEM"   , cItem            , nil}) //  ITEM DO PEDIDO
								aAdd(aAux, {"C6_PRODUTO", SC6->C6_PRODUTO  , nil}) //  CÓDIGO DO PRODUTO
								aAdd(aAux, {"C6_QTDVEN" , nQtdApon    , nil}) //  QUANTIDADE VENDIDA
								aAdd(aAux, {"C6_PRCVEN" , SC6->C6_PRCVEN   , nil}) //  PREÇO DE VENDA
								aadd(aAux, {"C6_QTDLIB" , nQtdApon	   , nil}) //  LIBERAÇAO ESTOQUE AUTOMATICA
								aadd(aAux, {"C6_LOCAL" 	, SC6->C6_LOCAL	   , nil}) //  LIBERAÇAO ESTOQUE AUTOMATICA
								aadd(aAux, {"C6_TES" 	, SC6->C6_TES	   , nil}) //  LIBERAÇAO ESTOQUE AUTOMATICA
								aadd(aAux, {"C6_LOTECTL", aSaldos[nPos][2] , Nil}) //Lote
								aadd(aAux, {"C6_LOCALIZ", aSaldos[nPos][3] , Nil}) // Endereço

								//if lInc
								for nX := 1 to SC6->(FCount())
									if ! alltrim(SC6->(FieldName(nX))) $ ("C6_ITEM/C6_PRODUTO/C6_QTDVEN/C6_PRCVEN/C6_OPER/C6_QTDLIB/C6_VALOR/C6_LOTECTL/C6_LOCAL/C6_LOCALIZ/C6_IPIDEV")
										if !empty(&("SC6->"+SC6->(FieldName(nX))))											
											aAdd(aAux, {SC6->(FieldName(nX)),&("SC6->"+SC6->(FieldName(nX))),Nil})
										endif
									endif
								next

								//	endif

								if nSaldoSC6  > 0 .OR. aSaldos[nPos][4] == 0
									lInc:= .T.
								endif

							else
								VtClear()
								VTAlert("Produto "+SC6->C6_PRODUTO+" nao foi completamente conferido.",AllTrim("Falha"))
								lRet:= .F.
								exit
							endif

							aAdd(aIteAuto, aClone(aAux) )
						endDo

						if !lRet
							exit
						endif

						SC6->(DbSkip())
					endDo
					if lRet
						ASORT(aIteAuto, , , { |x,y| x[1,2] < y[1,2] } )
						lMsErroAuto := .F.
						MSExecAuto({|x,y,z| Mata410(x,y,z)}, aCabAuto, aIteAuto, 4)

						if lMsErroAuto
							VtClear()

							aErroAuto := GetAutoGRLog()

							c_Txt := ""

							For nI := 1 To Len(aErroAuto)
								c_Txt += aErroAuto[nI] + Chr(13) + Chr(10)
							Next

							cMsgErr := "Falha execauto do pedido de vendas!" + CRLF

							ConOut("ACD - "+ cMsgErr + c_Txt)

							cMsgErr += U_NoChrEsp(c_Txt)

							VtAlert(cMsgErr,alltrim("Falha"))

							lRet := .F.
						else
							DbSelectArea("SC6")
							DbSetOrder(1)
							DbSeek(xFilial("SC6") + cNumPed)

							While !SC6->(eof()) .and. SC6->C6_NUM == cNumPed
								dbSelectArea("SC9")
								dbSetOrder(1)
								If MsSeek(xFilial("SC9")+SC6->C6_NUM+SC6->C6_ITEM)
									SC9->(a460Estorna())
								Endif

								nQtdLib  := SC6->C6_QTDVEN

								RecLock("SC6",.F.)

								REPLACE C6_QTDLIB    with nQtdLib

								MaLibDoFat(SC6->(RecNo()), @nQtdLib,.T.,.T.,.F.,.F.,.F.,.F.)

								MsUnLock()
								If nQtdLib = 0
									VtClear()

									aErroAuto := GetAutoGRLog()

									c_Txt := ""

									For nI := 1 To Len(aErroAuto)
										c_Txt += aErroAuto[nI] + Chr(13) + Chr(10)
									Next

									cMsgErr := "Falha na Liberacao do Estoque!" + CRLF

									ConOut("ACD - "+ cMsgErr + c_Txt)

									cMsgErr += U_NoChrEsp(c_Txt)

									VtAlert(cMsgErr,alltrim("Falha"))

									lRet := .F.
								Endif


								DbSelectArea("SC6")
								DbSkip()  

							Enddo



							dbselectarea("Z0C")
							Z0C->(DbSetOrder(3))
							if Z0C->(DbSeek(xFilial("Z0C")+cNumPed))
								while (!Z0C->(EOF())) .AND. Z0C->(Z0C_FILIAL+Z0C_PEDIDO) == xFilial("Z0C")+cNumPed
									nRecZ0C := Z0C->(Recno())
									Reclock("Z0C",.F.)
									Replace Z0C_STATUS with '2'
									MsUnlock()
									Z0C->(DbGoto(nRecZ0C))
									Z0C->(DbSkip())
								end
								//VtClear()
								//VTAlert("Pedido Finalizado com sucesso..",AllTrim("Sucesso"))								
							else
								VtClear()
								VTAlert("Nao encontrado Etiquetas para o pedido: "+cNumPed,AllTrim("Falha"))
								lRet := .F.
							endif

						endif
					endif
				else
					VtClear()
					VTAlert("Nao foi encontrado itens para o pedido "+cNumPed,AllTrim("Falha"))
					lRet := .F.
				endif
			else
				VtClear()
				VTAlert("Apontamentos nao encontrados. Pedido: "+cNumPed,AllTrim("Falha"))
				lRet := .F.
			endif
		else
			VtClear()
			VTAlert("Pedido nao encontrado: "+cNumPed,AllTrim("Falha"))
			lRet := .F.
		endif

		if !lRet
			DisarmTransaction()
		endif
	End Transaction
	DbCommit()
return


/*user function RETCLASS()

return ""*/