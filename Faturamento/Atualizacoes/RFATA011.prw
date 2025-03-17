#INCLUDE 'Protheus.ch'

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³RFATA011  ºAutor  ³Tarcisio Silva MirandaºData³  05/01/2018 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Rotina de inclusão de containner na Sf2.	    			  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Após gravação da Sf2.                                      º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function RFATA011()

	Local aArea 	:= GetArea()
	Local aAreaSF2 	:= SF2->(GetArea())
	Local aAreaSD2 	:= SD2->(GetArea())
	Local aButtons 	:= {}
	Local oGet1
	Local cGet1 	:= SF2->F2_FILIAL
	Local oGet2
	Local cGet2 	:= SF2->F2_DOC
	Local cCodCli	:= SF2->F2_CLIENTE
	Local cLojaCli	:= SF2->F2_LOJA
	Local oGet3
	Local cGet3 	:= SF2->F2_XCONTAI //space(50)//SF2->F2_XCONTAI
	Local oGet4
	Local cGet4 	:= SF2->F2_XLACRE //space(50) //SF2->F2_XLACRE
	Local oGet5	
	Local cGet5		:= SF2->F2_XDADOS //space(100) //SF2->F2_XDADOS	
	Local oGet6
	Local cGet6 	:= SF2->F2_XARMAZ //space(254)
	Local lCliDif	:= .F. // General Mills
	Local cTransp	:= SF2->F2_TRANSP
	Local cCarga	:= SF2->F2_CARGA
	Local nFlag 	:= 0 //Flag para o Grupo Manteiga 1009

	Local oGroup1
	Local oGroup2
	Local oGroup3
	Local oSay1
	Local oSay2
	Local oSay3
	Local oSay4
	Local oSay5
	Local oSay6
	
	Static oDlg
	
	If !Empty(cCarga)
		//msginfo("Entrei na carga")
		//D2_FILIAL+D2_DOC+D2_SERIE+D2_CLIENTE+D2_LOJA+D2_COD+D2_ITEM
		SD2->(DbSetOrder(3))
		If SD2->(DbSeek(xFilial("SD2")+SF2->F2_DOC+SF2->F2_SERIE))
			While SD2->(!EOF());
			.AND. SD2->D2_FILIAL+SD2->D2_DOC+SD2->D2_SERIE == xFilial("SD2")+SF2->F2_DOC+SF2->F2_SERIE
						If SD2->D2_GRUPO == "1009"
							nFlag++ 
						Endif
				  SD2->(DbSkip())
			EndDo
		Endif
	Endif
	//msginfo("Contador"+ str(nFlag) + "Carga" + cCarga)
	
	//Regra Clientes de Exportação ou (Transportador Aliança e  faturamento Filial 0105)
	if AllTrim(Posicione("SA1",1,xFilial("SA1")+cCodCli+cLojaCli,"A1_TIPO"))$"X" .OR. (AllTrim(cTransp) == "T0004T"  .AND. SF2->F2_FILIAL == '0105')
		
		DEFINE MSDIALOG oDlg TITLE "Container" FROM 000, 000  TO 270, 380 COLORS 0, 16777215 PIXEL

	@ 030, 004 GROUP oGroup1 TO 130, 180 PROMPT "Container | " OF oDlg COLOR 0, 16777215 PIXEL
	@ 040, 010 GROUP oGroup2 TO 061, 173 PROMPT "Parâmetros | " OF oDlg COLOR 0, 16777215 PIXEL
	@ 063, 010 GROUP oGroup3 TO 125, 173 PROMPT "Container | " OF oDlg COLOR 0, 16777215 PIXEL
	@ 049, 015 SAY oSay1 PROMPT "Filial : " SIZE 016, 007 OF oDlg COLORS 0, 16777215 PIXEL
	@ 047, 031 MSGET oGet1 VAR cGet1 SIZE 032, 010 OF oDlg COLORS 0, 16777215 When .F. PIXEL
	@ 049, 068 SAY oSay2 PROMPT "Nota Fiscal : " SIZE 032, 007 OF oDlg COLORS 0, 16777215 PIXEL
	@ 047, 101 MSGET oGet2 VAR cGet2 SIZE 060, 010 OF oDlg COLORS 0, 16777215 When .F. PIXEL
	@ 081, 015 SAY oSay3 PROMPT "Container : " SIZE 028, 007 OF oDlg COLORS 0, 16777215 PIXEL
	@ 080, 043 MSGET oGet3 VAR cGet3 SIZE 120, 010 OF oDlg COLORS 0, 16777215 PIXEL
	@ 095, 015 SAY oSay4 PROMPT "Lacre : " SIZE 028, 007 OF oDlg COLORS 0, 16777215 PIXEL
	@ 094, 043 MSGET oGet4 VAR cGet4 SIZE 120, 010 OF oDlg COLORS 0, 16777215 PIXEL
	@ 110, 015 SAY oSay5 PROMPT "Dados : " SIZE 028, 007 OF oDlg COLORS 0, 16777215 PIXEL
	@ 0109, 043 MSGET oGet5 VAR cGet5 SIZE 120, 010 OF oDlg COLORS 0, 16777215 PIXEL
	
	EnchoiceBar(oDlg, {||funAltera(UPPER(cGet3),UPPER(cGet4),UPPER(cGet5),UPPER(cGet6),aArea,aAreaSF2,lCliDif)}, {||oDlg:end()},,aButtons)
	
		ACTIVATE MSDIALOG oDlg CENTERED
	
	//Regra cliente General Mills exibir campo Lacre 
	ElseIf   AllTrim(cCodCli) == "C02408" 
		lCliDif := .T.
		
		DEFINE MSDIALOG oDlg TITLE "Lacre" FROM 000, 000  TO 270, 380 COLORS 0, 16777215 PIXEL

	@ 030, 004 GROUP oGroup1 TO 130, 180 PROMPT "Lacre| " OF oDlg COLOR 0, 16777215 PIXEL
	@ 040, 010 GROUP oGroup2 TO 061, 173 PROMPT "Parâmetros | " OF oDlg COLOR 0, 16777215 PIXEL
	@ 063, 010 GROUP oGroup3 TO 125, 173 PROMPT "Lacre | " OF oDlg COLOR 0, 16777215 PIXEL
	@ 049, 015 SAY oSay1 PROMPT "Filial : " SIZE 016, 007 OF oDlg COLORS 0, 16777215 PIXEL
	@ 047, 031 MSGET oGet1 VAR cGet1 SIZE 032, 010 OF oDlg COLORS 0, 16777215 When .F. PIXEL
	@ 049, 068 SAY oSay2 PROMPT "Nota Fiscal : " SIZE 032, 007 OF oDlg COLORS 0, 16777215 PIXEL
	@ 047, 101 MSGET oGet2 VAR cGet2 SIZE 060, 010 OF oDlg COLORS 0, 16777215 When .F. PIXEL
	@ 081, 015 SAY oSay4 PROMPT "Lacre : " SIZE 028, 007 OF oDlg COLORS 0, 16777215 PIXEL
	@ 080, 043 MSGET oGet4 VAR cGet4 SIZE 120, 010 OF oDlg COLORS 0, 16777215 PIXEL
		
	EnchoiceBar(oDlg, {||funAltera(UPPER(cGet3),UPPER(cGet4),UPPER(cGet5),UPPER(cGet6),aArea,aAreaSF2,lCliDif)}, {||oDlg:end()},,aButtons)
	
		ACTIVATE MSDIALOG oDlg CENTERED
	
	//Regra se exister itens que estão no Grupo da Manteiga SD2->D2_GRUPO == "1009"
	ElseIf  !Empty(cCarga) .And. nFlag > 0 
	
	DEFINE MSDIALOG oDlg TITLE "End. Armazem Logística" FROM 000, 000  TO 270, 380 COLORS 0, 16777215 PIXEL

	@ 030, 004 GROUP oGroup1 TO 130, 180 PROMPT "End. Armazem Logística| " OF oDlg COLOR 0, 16777215 PIXEL
	@ 040, 010 GROUP oGroup2 TO 061, 173 PROMPT "Parâmetros | " OF oDlg COLOR 0, 16777215 PIXEL
	@ 063, 010 GROUP oGroup3 TO 125, 173 PROMPT "End. Armazem Logística | " OF oDlg COLOR 0, 16777215 PIXEL
	@ 049, 015 SAY oSay1 PROMPT "Filial : " SIZE 016, 007 OF oDlg COLORS 0, 16777215 PIXEL
	@ 047, 031 MSGET oGet1 VAR cGet1 SIZE 032, 010 OF oDlg COLORS 0, 16777215 When .F. PIXEL
	@ 049, 068 SAY oSay2 PROMPT "Nota Fiscal : " SIZE 032, 007 OF oDlg COLORS 0, 16777215 PIXEL
	@ 047, 101 MSGET oGet2 VAR cGet2 SIZE 060, 010 OF oDlg COLORS 0, 16777215 When .F. PIXEL
	@ 081, 015 SAY oSay6 PROMPT "End. : " SIZE 028, 007 OF oDlg COLORS 0, 16777215 PIXEL
	@ 080, 043 GET oGet6 VAR cGet6 MULTILINE SIZE 120, 040 OF oDlg COLORS 0, 16777215 HSCROLL PIXEL
	//oGet6:= tMultiget():New(80,43,{|u|if(Pcount()>0,cGet6:=u,cGet6)},oDlg,120,040,,,,,,.T.)
	//tMultiget grava as informações se eu não selecione a tela ou se copiar o TEXTO direto. Caso eu selecionar o cursos vai para o final
	// da linha e conteudo não é gravado na SF2->F2_XARMAZ, momento do video minuto 4:00 
	/*
	tMultiget e MSGGET
	https://tdn.totvs.com/pages/viewpage.action?pageId=203771190
	nRow	Numérico	Indica a coordenada vertical em pixels ou caracteres.	 	 
	nCol	Numérico	Indica a coordenada horizontal em pixels ou caracteres.	 	 
	nWidth	Numérico	Indica a largura em pixels do objeto.	 	 
	nHeight	Numérico	Indica a altura em pixels do objeto.
	*/
	EnchoiceBar(oDlg, {||funAltera(UPPER(cGet3),UPPER(cGet4),UPPER(cGet5),UPPER(cGet6),aArea,aAreaSF2,lCliDif)}, {||oDlg:end()},,aButtons)
	
		ACTIVATE MSDIALOG oDlg CENTERED	
			
	Else
		
		RestArea(aAreaSD2)
		RestArea(aAreaSF2)
		RestArea(aArea)
		return()
	endif

Return()

Static Function funAltera(_cGet3,_cGet4,_cGet5,_cGet6,_aArea,_aAreaSF2,_lCliDif)

	Default _cGet3 		:= ""
	Default _cGet4 		:= ""
	Default _cGet5 		:= ""
	Default _cGet6 		:= ""
	Default _aArea		:= {}
	Default _aAreaSF2 	:= {}
	Default _lCliDif    := .F.
	
	//Apenas Lacre
	If _lCliDif == .T.
	
	SF2->(RecLock("SF2",.F.))
	SF2->F2_XLACRE 	:= _cGet4
	SF2->(MsUnlock())

	Aviso("Informação!","Informação de Lacre Atualizada com sucesso!",{"Ok"})
	
	//Grupo Manteiga 1009
	ElseIf !Empty(_cGet6)
	SF2->(RecLock("SF2",.F.))
	SF2->F2_XARMAZ 	:= _cGet6
	SF2->(MsUnlock())
	
	Aviso("Informação!","Informação de End. Armazem Logística Atualizada com sucesso!",{"Ok"})

	//Exportação e ALIANCA NAVEGACAO E LOGISTICA LTDA. 
	Else
	
	SF2->(RecLock("SF2",.F.))
	SF2->F2_XCONTAI := _cGet3
	SF2->F2_XLACRE 	:= _cGet4
	SF2->F2_XDADOS	:= _cGet5
	SF2->(MsUnlock())

	Aviso("Informação!","Informação Atualizada sucesso!",{"Ok"})
	
	EndIf
	
	RestArea(_aArea)
	RestArea(_aAreaSF2)

	oDlg:End()

Return()