#include 'protheus.ch'
#include 'parmtype.ch'
#include "apvt100.ch"

user function RACDA011()

	Local nLin:=1
	Local cEndereco
	Local cArmazem
	Local cEtq
	Local c_Opc := " "
	Local c_Prd := ""



	while .T.
		If ! U_VerDtFl(.T.)
			Return
		Endif

		cEndereco := space(TamSx3("Z0G_ENDERE")[1] + 1)
		cArmazem := space(TamSx3("Z0G_LOCAL")[1])
		cEtq	 := Space(U_DecEtq() + 1)


		//		cArmazem := '09'
		//		cEndereco := 'A PR.09 AN.01'
		//		cEtq	 := '100400041735609930E0004'


		VtClear()
		nLin:=1
		@nLin,00 VtSay "           Envio C.Q. "
		nLin++
		nLin++
		@nLin,00 VtSay "Etiqueta: "
		@nLin,10 VtGet cEtq
		nLin++
		@nLin,00 VtSay "Armazem: "
		@nLin,10 VtGet cArmazem
		nLin++
		@nLin,00 VtSay "Endereco: "
		@nLin,10 VtGet cEndereco

		VtRead

		If VTLastkey() == 27  // Tecla ESC
			VtClear()
			return
		EndIf

		U_DecEtq(cEtq, @c_Prd, /*c_Lt*/, /*c_LtMq*/, /*c_Plt*/,.T.)

		if c_Prd = " "
			VtClear()
			VTAlert("Etiqueta nao Encontrada!!!."+ Chr(13) + Chr(10) + cEtq ,AllTrim("Falha"))
		Else

			DbSelectArea("SB1")
			DbSetOrder(1)
			DbSeek(xFilial("SB1") + c_Prd)

			DbSelectArea("SBE")
			DbSetOrder(1)
			If !DbSeek(xFilial("SBE") + PadR(cArmazem,TamSx3("Z0G_LOCAL")[1]) + PadR(cEndereco,TamSx3("Z0G_ENDERE")[1]))
				VtClear()
				VTAlert("Endereco nao Encontrado!!!.",AllTrim("Falha"))
			Else


				VtClear()

				nLin:= 1
				@nLin,00 VtSay "           Envio C.Q. "
				nLin++
				nLin++
				@nLin,00 VtSay "Produto: " + AllTrim(SB1->B1_COD)
				nLin++
				@nLin,00 VtSay substr(SB1->B1_DESC,1,14) + "..." + substr(Alltrim(SB1->B1_DESC),Len(Alltrim(SB1->B1_DESC))-13,13)
				nLin++
				@nLin,00 VtSay "Endereco:"
				nLin++
				@nLin,00 VtSay AllTrim(cArmazem) +'-'+ AllTrim(cEndereco)
				nLin++
				@nLin,00 VtSay "Confirma o Envio? (S/N) "
				nLin++
				@nLin,00 VtGet c_Opc
				VtRead

				If ! (VTLastkey() == 27 .or. Upper(c_Opc) = 'N')
					GravaZ0G(cEndereco,cArmazem,cEtq)
				Else
					VtClear()
					VTAlert("Envio para C.Q. Cancelado!!!.","Atenção")
				EndIf
			Endif
		Endif
	EndDo
return


Static function GravaZ0G(cEndereco,cArmazem,cEtq)
	Local cEstorna:= " "
	Local c_Prd := ""
	Local c_Lt := ""
	Local c_Plt := ""
	Local n_EstLoc := 0 
	Local c_Txt := "" 
	Local n_Qtd := 0

	cEndereco := PadR(cEndereco,TamSX3("BF_LOCALIZ")[1])
	cArmazem := PadR(cArmazem,TamSX3("BF_LOCAL")[1])

	U_DecEtq(cEtq, @c_Prd, @c_Lt, ,@c_Plt,.T.)

	if c_Prd = " "
		VtClear()
		VTAlert("Etiqueta nao Encontrada!!!."+ Chr(13) + Chr(10) + cEtq ,AllTrim("Falha"))
		Return
	Endif

	dbselectarea("Z0G")
	Z0G->(DbSetOrder(1)) 

	if ! Z0G->(DbSeek(xFilial("Z0G") + cEtq))

		Begin Transaction

			Reclock("Z0G",.T.)
			Replace Z0G_FILIAL 	with xFilial("Z0G")
			Replace Z0G_LOCAL	with cArmazem
			Replace Z0G_ENDERE	with cEndereco
			Replace Z0G_ETIQ	with cEtq
			Replace Z0G_STATUS	with '1'
			Replace Z0G_USER	with cUserName
			Replace Z0G_DATAEN	with date()
			Replace Z0G_HORAEN	with time()
			MsUnLock()

		End Transaction

		DbCommit()
	else

		VtClear()

		nLin:= 1
		@nLin,00 VtSay "Etiq. Ja Enviada! "
		nLin++
		@nLin,00 VtSay "Deseja Estornar o Envio C.Q.? "
		nLin++
		@nLin,00 VtSay "(S/N) "
		nLin++
		@nLin,00 VtGet cEstorna
		VtRead

		If VTLastkey() == 27  // Tecla ESC
			VtClear()
			Return
		EndIf
		Begin Transaction

			cEstorna:= Upper(cEstorna)
			if cEstorna == "S"
				VtClear()
				if Z0G->Z0G_STATUS =='0'
					VTAlert("Nao e possivel estornar pois ja foi Processada, utilize a rotina de Transferencia!!!.",AllTrim("Falha"))
				else
					Reclock("Z0G",.F.)
					Replace Z0G_STATUS with '4'
					MsUnlock()

					Reclock("Z0G",.F.)
					Z0G->(DbDelete())
					MsUnlock()
					VTAlert("Envio C.Q. estornada com sucesso.",AllTrim("Sucesso"))
				endif
			endif
		End Transaction

	endif
	DbCommit()
return

