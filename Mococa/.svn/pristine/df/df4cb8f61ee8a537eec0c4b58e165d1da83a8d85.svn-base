#INCLUDE 'Protheus.ch'

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³RFATA012  ºAutor  ³Tarcisio Silva MirandaºData³  09/01/2018 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Rotina responsavel pela gravação da chave da nfe na SE1.   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Após gravação da Sf2, colocado no fonte NfeSefaz.          º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function RFATA012(_cChave)

	Local aArea 	:= GetArea()
	Local aAreaSF2 	:= SF2->(GetArea())
	Local aAreaSE1 	:= SE1->(GetArea())
	Local cFilials 	:= SF2->F2_FILIAL
	Local cNumNf	:= SF2->F2_DOC
	Local cTipoNf	:= "NF"
	Local lHabRot	:= GetMv("MV_XHABROT",,.T.)
	Default _cChave := ""

	if lHabRot

		SE1->(DbSelectArea("SE1"))
		SE1->(DbSetOrder(32))
		SE1->(DbGotop())
		if SE1->(DbSeek(cFilials+cNumNf))

			While !SE1->(Eof()) .AND. SE1->E1_NUM$cNumNf .AND. SE1->E1_FILIAL$cFilials

				if AllTrim(SE1->E1_TIPO)$cTipoNf

					SE1->(RecLock("SE1",.F.))
					SE1->E1_XCHAVE := _cChave
					SE1->(MsUnlock())

				endif
				
				SE1->(DbSkip()) 
				
			Enddo

		endif

	endif
	
	RestArea(aAreaSF2)
	RestArea(aAreaSE1)
	RestArea(aArea)

Return()