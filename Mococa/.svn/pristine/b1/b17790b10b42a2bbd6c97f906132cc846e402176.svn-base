#Include 'Protheus.ch'
#Include 'Topconn.ch'
#include "apvt100.ch"
//Fracionamento MOCOCA

User Function RACDA004(cNumFrac)
	Local nLin := 1
	Local cContinua := " "
	Local c_Fraq := " "


	Default cNumFrac := RetProxZ0B() + " "
	
	If ! U_VerDtFl(.F.)
		Return
	Endif

	VtClear()

	dbselectarea("Z0B")



	@nLin,00 VtSay "Etiq. Frac: " VtGet cNumFrac

	VtRead

	cNumFrac := AllTrim(cNumFrac)


	If ImpFrq(cNumFrac, .T. )
		Return
	Else
		If cNumFrac = Z0B->Z0B_CODIGO 
			VtClear()
			nLin:=1
			@nLin,00 VtSay "Continuar Fracionando? (S/N) " VtGet c_Fraq
			VtRead

			If VTLastkey() == 27  // Tecla ESC
				VtClear()
				return 
			EndIf

			c_Fraq := upper(c_Fraq)

			if c_Fraq <> 'S'
				Return
			endif
		Else
			cNumFrac := RetProxZ0B()
		EndIf
	Endif



	nLin++




	while .T.

		cEtq := Space(U_DecEtq() + 1) //space(tamsx3("Z0B_PRODUT")[1] + tamsx3("Z0B_LOTE")[1] + tamsx3("Z0B_PALLET")[1] + 1)
		nQtd:= strzero(0,3)
		VtClear()
		nLin:=1

		@nLin,00 VtSay "Etiq. Frac: " + cNumFrac

		nLin++

		@nLin,00 VtSay "Etiq. Origem: " VtGet cEtq

		nLin++
		@nLin,00 VtSay "Quantidade:  " VtGet nQtd

		VtRead

		If VTLastkey() == 27  // Tecla ESC

			If ImpFrq(cNumFrac, .F. )
				Return
			Else
				VtClear()
				nLin:=1
				@nLin,00 VtSay "Continuar Fracionando? (S/N) " VtGet c_Fraq
				VtRead

				If VTLastkey() == 27  // Tecla ESC
					VtClear()
					return 
				EndIf

				c_Fraq := upper(c_Fraq)

				if c_Fraq <> 'S'
					Return
				Else
					Loop
				endif
			Endif

		Endif
		nQtd:= val(nQtd)
		GravaZ0B(cNumFrac,cEtq,nQtd)
	end


Return

Static Function ImpFrq(cNumFrac, l_RImp )
	Local cImprime := " "
	If VTLastkey() == 27 .OR. l_RImp  // Tecla ESC

		DbSelectarea("Z0B")
		Z0B->(DbSetOrder(1))
		if Z0B->(DbSeek(xFilial("Z0B")+cNumFrac))
			If StsEtq(cNuMFrac)
				VtClear()
				nLin:=1
				@nLin,00 VtSay "Imprimir Etiqueta? (S/N) " VtGet cImprime
				VtRead

				If VTLastkey() == 27  // Tecla ESC
					VtClear()
					return l_RImp
				EndIf

				cImprime := upper(cImprime)

				if cImprime == 'S'
					U_RACDR001(cNumFrac) //Impressão da Etiqueta Frac
					Return .T.
				Else
					If l_RImp
						Return .F.
					Else
						Return l_RImp
					Endif
				endif
			Else
				VtClear()
				VTAlert("Etiqueta já Conferida ou Estornar.","Falha")
			EndIf
		endif

	EndIf
Return .F.



Static function GravaZ0B(cCod,cEtq,nQtd)
	Local cEstorna:= " "

	Local c_Prd := ""
	Local c_Lt := ""
	Local c_Plt := ""

	U_DecEtq(cEtq, @c_Prd, @c_Lt,, @c_Plt)

	if c_Prd = " "
		VtClear()
		VTAlert("Etiqueta nao Encontrada!!!."+ Chr(13) + Chr(10) + cEtq ,AllTrim("Falha"))
		Return
	Endif

	if nQtd>0
		dbselectarea("Z0A")
		Z0A->(DbSetORder(1))
		if Z0A->(DbSeek(xFilial("Z0A") + c_Prd + c_Lt + c_Plt))

			if Z0A->Z0A_STATUS=='1'

				dbselectarea("Z0B")
				Z0B->(DbSetOrder(1)) //Z0B_FILIAL, Z0B_CODIGO, Z0B_PRODUT, Z0B_LOTE, Z0B_PALLET

				if (!Z0B->(DbSeek(xFilial("Z0B") + cCod + c_Prd + c_Lt + c_Plt)))
					if ValidaQtd(cCod,cEtq,Z0A->Z0A_QTD,nQtd)
						Reclock("Z0B",.T.)
						Replace Z0B_FILIAL with xFilial("Z0B")
						Replace Z0B_CODIGO with cCod
						Replace Z0B_PRODUT with c_Prd
						Replace Z0B_LOTE   with c_Lt
						Replace Z0B_PALLET with c_Plt
						Replace Z0B_STATUS with '1'
						Replace Z0B_USUFRA with cUserName
						Replace Z0B_DTFRAC with date()
						Replace Z0B_HRFRAC with time()
						Replace Z0B_QTD   with nQtd
						MsUnLock()

					endif
				else

					VtClear()
					VTAlert("Produto "+alltrim(c_Prd)+" - "+substr(POSICIONE("SB1",1,xFilial("SB1")+c_Prd,"B1_DESC"),15)+ Chr(13) + Chr(10)+;
					"Palete: "+c_Plt+" ja fracionado.",AllTrim("Sucesso"))
					VtClear()
					nLin:= 1

					@nLin,00 VtSay "Etiq. Ja Fracionada! "

					nLin++
					@nLin,00 VtSay "Selecione:"
					nLin++
					@nLin,00 VtSay "E - Estornar"
					nLin++

					@nLin,00 VtSay "N - Novo Fracionamento"

					nLin++
					@nLin,00 VtSay "V - Voltar"
					nLin++
					@nLin,00 VtGet cEstorna
					VtRead

					If VTLastkey() == 27  // Tecla ESC
						VtClear()
						Return
					EndIf

					cEstorna:= Upper(cEstorna)
					VtClear()
					if cEstorna == "E"
						if Z0B->Z0B_STATUS $ '2/4'

							VTAlert("Nao e possivel estornar uma fracionamento ja separado.",AllTrim("Falha"))

						else
							Reclock("Z0B",.F.)
							Replace Z0B_STATUS with '4'
							MsUnlock()

							Reclock("Z0B",.F.)
							Z0B->(DbDelete())
							MsUnlock()

						endif
					elseif cEstorna == 'N'
						if ValidaQtd(cCod,cEtq,Z0A->Z0A_QTD,nQtd)
							DbSelectarea("Z0B")
							Reclock("Z0B",.F.)
							Replace Z0B_QTD   with Z0B_QTD + nQtd
							MsUnLock()

						endif
					endif
				endif
			else
				VtClear()

				VTAlert("Nao e possivel fracionar um palete que nao esteja com o satus 'separado'.",AllTrim("Falha"))

			endif

		else
			VtClear()
			VTAlert("Palete nao encontrada.",AllTrim("Falha"))
		endif
	else
		VtClear()
		VTAlert("Quantidade informada deve ser maior que zero.",AllTrim("Falha"))
	endif

	DbCommit()
return





Static function RetProxZ0B()
	Local aAreaZ0B:= Z0B->(GetArea())
	Local cQuery := " "
	Local cRet:=""
	local cNum:="000000"
	Local c_Tipo := 'FRAC'

	if select("QZ0B")>0
		QZ0B->(dbCloseArea())
	endif


	cQuery := "SELECT MAX(SUBSTR(Z0B_CODIGO,5,6)) Z0B_CODIGO "
	cQuery += "FROM "+RetSqlName("Z0B")+" Z0B "
	cQuery += "WHERE Z0B_FILIAL='"+xFilial("Z0B")+"'  "
	cQuery += "AND SUBSTR(Z0B_CODIGO,1,4) = '"+ c_Tipo +"' "



	TcQUery cQuery new alias "QZ0B"

	if !QZ0B->(EOF())
		if !empty(QZ0B->Z0B_CODIGO)
			cNum:= QZ0B->Z0B_CODIGO
		endif
	endif
	QZ0B->(dbCloseArea())

	cRet	:= Soma1(cNum,6)
	cMay    := "Z0B"+xFilial("Z0B") + c_Tipo + cRet

	DbSelectArea("Z0B")
	Z0B->(DbSetOrder(1))
	While Z0B->(DbSeek(xFilial("Z0B")+cRet)) .Or. !MayIUseCode(cMay)
		cRet := Soma1(cRet)
		cMay    := "Z0B" + xFilial("Z0B") + c_Tipo + cRet
	EndDo

	FreeUsedCode()

	restarea(aAreaZ0B)
return c_Tipo + cRet


//Valida se o pallet ainda posui saldo para ser fracionado
static function ValidaQtd(cCod,cEtq,nQtdOri,nQtd)
	Local aArea := GetArea()
	Local aAreaZ0B := Z0B->(GetArea())
	Local lRet := .T.
	Local nQtdFrac := 0
	Local c_Prd := ""
	Local c_Lt := ""
	Local c_Plt := ""

	U_DecEtq(cEtq, @c_Prd, @c_Lt,, @c_Plt)


	DbSelectarea("Z0B")
	Z0B->(DbSetOrder(2))
	if Z0B->(DbSeek(xFilial("Z0B") + c_Prd + c_Lt + c_Plt))
		while (!Z0B->(EOF())) .AND. Alltrim(Z0B->(Z0B_FILIAL+Z0B_PRODUT+Z0B_LOTE+Z0B_PALLET)) == xFilial("Z0B") + c_Prd + c_Lt + c_Plt
			nQtdFrac += Z0B->Z0B_QTD
			Z0B->(DbSkip())
		end
	endif

	if nQtdOri < nQtdFrac + nQtd
		VtClear()
		VTAlert("Quantidade informada("+ cvaltochar(nQtd)+") ultrapassa o saldo do palete("+ cvaltochar(nQtdOri-nQtdFrac)+").",AllTrim("Falha"))
		lRet := .F.
	endif

	RestArea(aAreaZ0B)
	RestArea(aArea)
return lRet



User Function RACDA007()
	Local nLin:=1
	Local cNumFrac := Space(TAMSX3("Z0B_CODIGO")[1])
	Local cContinua := " "
	Local cImprime := " "
	Local cAcao:= " "

	VtClear()

	dbselectarea("Z0B")

	while .T.
		cAcao:= " "
		cNumFrac := Space(TAMSX3("Z0B_CODIGO")[1])

		VtClear()
		nLin:=1
		@nLin,00 VtSay "Fracionamento: " VtGet cNumFrac
		VtRead

		If VTLastkey() == 27  // Tecla ESC
			VtClear()
			return
		EndIf

		DbSelectarea("Z0B")
		Z0B->(DbSetOrder(1))
		if Z0B->(DbSeek(xFilial("Z0B")+cNuMFrac))
			VtClear()
			nLin:=1
			@nLin,00 VtSay "Escolha uma acao: "
			nLin++
			@nLin,00 VtSay "E = Estornar Fracionamento"
			nLin++
			@nLin,00 VtSay "C = Continuar Fracionando"
			nLin++
			@nLin,00 VtGet cAcao

			VtRead

			If VTLastkey() == 27  // Tecla ESC
				VtClear()
				return
			EndIf

			cAcao := upper(cAcao)
			lOk:= .T.
			if cAcao == 'E'
				while (!Z0B->(EOF())) .AND. Z0B->(Z0B_FILIAL+Z0B_CODIGO) == xFilial("Z0B")+cNumFrac
					if alltrim(Z0B->Z0B_STATUS) == '2'
						VtClear()
						VTAlert("Produto "+Z0B->Z0B_PRODUT + alltrim(POSICIONE("SB1",1,xFilial("SB1")+Z0B->Z0B_PRODUT,"B1_DESC"))+" ja conferido.",AllTrim("Falha"))
						lOk := .F.
						exit
					endif
					Z0B->(DbSkip())
				end

				if lOk
					Z0B->(DbSeek(xFilial("Z0B")+cNuMFrac))
					while (!Z0B->(EOF())) .AND. Z0B->(Z0B_FILIAL+Z0B_CODIGO) == xFilial("Z0B")+cNumFrac
						Reclock("Z0B",.F.)
						Replace Z0B_STATUS with '4'
						MsUnlock()

						Reclock("Z0B",.F.)
						Z0B->(DbDelete())
						MsUnlock()
						Z0B->(DbSeek(xFilial("Z0B")+cNuMFrac))
					end
				endif
			elseif cAcao == 'C'
				U_RACDA004(cNuMFrac)
			endif

		else
			VtClear()
			VTAlert("Fracionamento "+cNuMFrac+" nao encontrado.",AllTrim("Falha"))
		endif

	end

return

Static Function StsEtq(cNuMFrac)
	Local l_Ret := .F.

	DbSelectarea("Z0B")
	Z0B->(DbSetOrder(1))
	if Z0B->(DbSeek(xFilial("Z0B") + cNuMFrac))
		while (!Z0B->(EOF())) .AND. Z0B->(Z0B_FILIAL+Z0B_CODIGO) == xFilial("Z0B")+cNumFrac
			if alltrim(Z0B->Z0B_STATUS) = '1'
				l_Ret := .T.
				exit
			endif
			Z0B->(DbSkip())
		endDo
	EndIf
Return l_Ret