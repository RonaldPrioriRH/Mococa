#Include "PROTHEUS.CH"
#INCLUDE "COLORS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "rwmake.ch"

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³ RFATA001 ³ Autor ³ Tarcisio Silva Miranda³ Data ³ 07/11/17 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Amarração de Produto X Contaminantes.					  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Uso       ³ Mococa.                                                    ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/

User Function INSPR001()

	Private cCadastro := "Produto X Contaminantes"

	Private aRotina := { {"Pesquisar","AxPesqui",0,1} ,;
	{"Visualizar","u_CadCtm1('V')",0,2} ,;
	{"Incluir","u_CadCtm1('I')",0,3} ,;
	{"Alterar","u_CadCtm1('A')",0,4} ,;
	{"Excluir","u_CadCtm1('E')",0,5} }

	Private cDelFunc := ".T." // Validacao para a exclusao. Pode-se utilizar ExecBlock

	Private cString := "ZZD"

	ZZD->(DbSelectArea("ZZD"))
	ZZD->(DbSetOrder(1))
	ZZD->(DbSelectArea(cString))
	
	mBrowse( 6,1,22,75,cString)

Return()

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³ CadCtm1 ³ Autor ³ Tarcisio Silva Miranda³ Data ³ 07/11/17   ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Manipula toda a tela de cadastro.						  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Uso       ³ Mococa.                                                    ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/

User Function CadCtm1(_cRotina)
	
	Local aButtons := {}
	Local oGroup1
	Local oGroup2
	Local oGroup3
	Local oSay1
	Local oSay2  
	Local oSay3
	
	Private _cXrotina := _cRotina
	Private oGet1
	Private oGet2
	Private oGet3

	iF _cXrotina == "I"
		Private cGet1 := space(4)
		Private cGet2 := Space(100)
		Private dGet3 := date()+365
	ElseiF _cXrotina == "V" .OR. _cXrotina == "A"
		Private cGet1 := ZZD->ZZD_GRUPO
		Private cGet2 := ZZD->ZZD_DESCGP
		Private dGet3 := ZZD->ZZD_DTVIG
	EndiF

	Static oDlg

	iF _cXrotina == "I"
		
		DEFINE MSDIALOG oDlg TITLE "Inclusão do Grupo de produtos Vs Contaminantes" FROM 000, 000  TO 500, 800 COLORS 0, 16777215 PIXEL Style 128
		@ 040, 011 GROUP oGroup1 TO 230, 390 PROMPT "Produtos Vs Contaminantes " OF oDlg COLOR 0, 16777215 PIXEL
		@ 050, 016 GROUP oGroup2 TO 083, 378 PROMPT "Parametros : " OF oDlg COLOR 0, 16777215 PIXEL
		@ 095, 018 GROUP oGroup3 TO 223, 380 PROMPT "Usuarios : " OF oDlg COLOR 0, 16777215 PIXEL

		fMSNewGe3(_cXrotina)
		EnchoiceBar(oDlg, {||FunSalv()}, {||oDlg:end(),ROLLBACKSXE()},,aButtons)

		@ 061, 022 SAY oSay1 PROMPT "Codigo : " SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
		@ 059, 048 MSGET oGet1 VAR cGet1 SIZE 030, 010 OF oDlg COLORS 0, 16777215 F3 "SBM" valid gatGrupo() HASBUTTON PIXEL

		@ 061, 087 SAY oSay2 PROMPT "Descrição : " SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
		@ 059, 120 MSGET oGet2 VAR cGet2 SIZE 153, 010 OF oDlg COLORS 0, 16777215 When.F. PIXEL

		@ 061, 288 SAY oSay3 PROMPT "Data : " SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
		@ 059, 305 MSGET oGet3 VAR dGet3 SIZE 060, 010 OF oDlg COLORS 0, 16777215 when .F. HASBUTTON PIXEL

		ACTIVATE MSDIALOG oDlg CENTERED

	ElseiF _cXrotina == "V"

		DEFINE MSDIALOG oDlg TITLE "Visualização do Grupo de produtos Vs Contaminantes" FROM 000, 000  TO 500, 800 COLORS 0, 16777215 PIXEL Style 128
		@ 040, 011 GROUP oGroup1 TO 230, 390 PROMPT "Produtos Vs Contaminantes " OF oDlg COLOR 0, 16777215 PIXEL
		@ 050, 016 GROUP oGroup2 TO 083, 378 PROMPT "Parametros : " OF oDlg COLOR 0, 16777215 PIXEL
		@ 095, 018 GROUP oGroup3 TO 223, 380 PROMPT "Usuarios : " OF oDlg COLOR 0, 16777215 PIXEL

		fMSNewGe3(_cXrotina)
		EnchoiceBar(oDlg, {||oDlg:end()}, {||oDlg:end(),ROLLBACKSXE()},,aButtons)

		@ 061, 022 SAY oSay1 PROMPT "Codigo : " SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
		@ 059, 048 MSGET oGet1 VAR cGet1 SIZE 030, 010 OF oDlg COLORS 0, 16777215 When.F. HASBUTTON PIXEL

		@ 061, 087 SAY oSay2 PROMPT "Descrição : " SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
		@ 059, 120 MSGET oGet2 VAR cGet2 SIZE 153, 010 OF oDlg COLORS 0, 16777215 When.F. PIXEL

		@ 061, 288 SAY oSay3 PROMPT "Data : " SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
		@ 059, 305 MSGET oGet3 VAR dGet3 SIZE 060, 010 OF oDlg COLORS 0, 16777215 When.F. HASBUTTON PIXEL

		ACTIVATE MSDIALOG oDlg CENTERED

	ElseiF _cXrotina == "A"

		DEFINE MSDIALOG oDlg TITLE "Alteração do Grupo de produtos Vs Contaminantes" FROM 000, 000  TO 500, 800 COLORS 0, 16777215 PIXEL Style 128
		@ 040, 011 GROUP oGroup1 TO 230, 390 PROMPT "Produtos Vs Contaminantes " OF oDlg COLOR 0, 16777215 PIXEL
		@ 050, 016 GROUP oGroup2 TO 083, 378 PROMPT "Parametros : " OF oDlg COLOR 0, 16777215 PIXEL
		@ 095, 018 GROUP oGroup3 TO 223, 380 PROMPT "Usuarios : " OF oDlg COLOR 0, 16777215 PIXEL

		fMSNewGe3(_cXrotina)
		EnchoiceBar(oDlg, {||FunAlt()}, {||oDlg:end(),ROLLBACKSXE()},,aButtons)

		@ 061, 022 SAY oSay1 PROMPT "Codigo : " SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
		@ 059, 048 MSGET oGet1 VAR cGet1 SIZE 030, 010 OF oDlg COLORS 0, 16777215 F3 "SBM" valid gatGrupo() HASBUTTON PIXEL

		@ 061, 087 SAY oSay2 PROMPT "Descrição : " SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
		@ 059, 120 MSGET oGet2 VAR cGet2 SIZE 153, 010 OF oDlg COLORS 0, 16777215 When.F. PIXEL

		@ 061, 288 SAY oSay3 PROMPT "Data : " SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
		@ 059, 305 MSGET oGet3 VAR dGet3 SIZE 060, 010 OF oDlg COLORS 0, 16777215 When.F. HASBUTTON PIXEL

		ACTIVATE MSDIALOG oDlg CENTERED
		
	ElseiF _cXrotina == "E"
	
		FunExcl(_cXrotina)
	
	EndiF

Return()

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³ fMSNewGe3 ³ Autor ³ Tarcisio Silva Miranda³ Data ³ 07/11/17³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Manipula toda a grid.									  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Uso       ³ Mococa.                                                    ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/

//------------------------------------------------
Static Function fMSNewGe3(_cXrotina)
	//------------------------------------------------
	Local nX
	Local aHeaderEx := {}
	Local aColsEx := {}
	Local aFieldFill := {}
	Local aFields := {"ZZD_DESC","ZZD_SIMBOL","ZZD_DESCSB","ZZD_VALOR","ZZD_VALOR2"}
	Local aAlterFields := {"ZZD_DESC","ZZD_SIMBOL","ZZD_DESCSB","ZZD_VALOR","ZZD_VALOR2"}
	Static oMSNewGe3
	// Define field properties
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	For nX := 1 to Len(aFields)
		If SX3->(DbSeek(aFields[nX]))
			Aadd(aHeaderEx, {AllTrim(X3Titulo()),SX3->X3_CAMPO,SX3->X3_PICTURE,SX3->X3_TAMANHO,SX3->X3_DECIMAL,SX3->X3_VALID,;
			SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})
		Endif
	Next nX

	_cSQL := ""
	_cSQL := " SELECT ZZD_CODIGO,ZZD_DESC,ZZD_SIMBOL,ZZD_DESCSB,ZZD_VALOR,ZZD_DTVIG,ZZD_GRUPO,ZZD_VALOR2 "
	_cSQL += " FROM "+RetSqlName("ZZD")
	_cSQL += " WHERE D_E_L_E_T_ <> '*' "
	iF _cXrotina == "I"
		_cSQL += " AND ZZD_CODIGO = '000000'     "
	ElseiF _cXrotina == "V" .OR. _cXrotina == "A"
		_cSQL += " AND ZZD_CODIGO = '"+ZZD->ZZD_CODIGO+"'    "
	EndiF

	If Select("TMP") > 0
		TMP->(dbCloseArea())
	EndIf
	
	dbUseArea(.T.,"TOPCONN", TCGenQry(,,_cSQL), "TMP", .F., .T.)

	TMP->(dBGotop())
	While !TMP->(EOF())
		Aadd(aFieldFill, {(TMP->ZZD_DESC),(TMP->ZZD_SIMBOL),(TMP->ZZD_DESCSB),(TMP->ZZD_VALOR),(TMP->ZZD_VALOR2), .F. } )
		TMP->(dbskip())
	end

	if len(aFieldFill) == 0
		Aadd(aFieldFill, {(TMP->ZZD_DESC),(TMP->ZZD_SIMBOL),(TMP->ZZD_DESCSB),(TMP->ZZD_VALOR),(TMP->ZZD_VALOR2), .F. } )
	endif

	if len(aFieldFill) == 0
		For nX := 1 to Len(aFields)
			If DbSeek(aFields[nX])
				Aadd(aFieldFill, CriaVar(SX3->X3_CAMPO))
			Endif
		Next nX
	endif

	aColsEx := aClone(aFieldFill)
	iF _cXrotina == "I"
		oMSNewGe3 := MsNewGetDados():New( 104, 026, 213, 372, GD_INSERT+GD_DELETE+GD_UPDATE, "AllwaysTrue", "AllwaysTrue", "+Field1+Field2", aAlterFields,, 999, "AllwaysTrue", "", "AllwaysTrue", oDlg, aHeaderEx, aColsEx)
	ElseiF _cXrotina == "V"
		oMSNewGe3 := MsNewGetDados():New( 104, 026, 213, 372,, "AllwaysTrue", "AllwaysTrue", "+Field1+Field2", aAlterFields,, 999, "AllwaysTrue", "", "AllwaysTrue", oDlg, aHeaderEx, aColsEx)
	ElseiF _cXrotina == "A"
		oMSNewGe3 := MsNewGetDados():New( 104, 026, 213, 372, GD_INSERT+GD_DELETE+GD_UPDATE, "AllwaysTrue", "AllwaysTrue", "+Field1+Field2", aAlterFields,, 999, "AllwaysTrue", "", "AllwaysTrue", oDlg, aHeaderEx, aColsEx)
	EndiF
	
Return()

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³ gatGrupo  ³ Autor ³ Tarcisio Silva Miranda³ Data ³ 07/11/17³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Gatilha a descrição do grupo, pelo codigo.				  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Uso       ³ Mococa.                                                    ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/

Static Function gatGrupo()

	cGet2 := AllTrim(Posicione("SBM",1,xFilial("SBM")+cGet1,"BM_DESC")) 
	
	iif(!Empty(cGet2),cGet2:=cGet2,cGet2:="")
	
	if empty(cGet2)
		MsgAlert("Por favor verifique se o campo do grupo esta preenchido","Atenção!")
		Return(.F.)
	endif

Return()

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³ FunSalv  ³ Autor ³ Tarcisio Silva Miranda³ Data ³ 07/11/17 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Função que salva todo o registro.						  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Uso       ³ Mococa.                                                    ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/


Static Function FunSalv()

	Local nX
	Local cCodigo 	:= GetSxeNum("ZZD","ZZD_CODIGO")
	Local nUsado  	:= Len(oMSNewGe3:aHeader)+1
	Local nPosDesc	:= aScan(oMSNewGe3:aHeader,{|x| AllTrim(x[2])=="ZZD_DESC"})
	Local nPosSimb	:= aScan(oMSNewGe3:aHeader,{|x| AllTrim(x[2])=="ZZD_SIMBOL"})
	Local nPosDsb	:= aScan(oMSNewGe3:aHeader,{|x| AllTrim(x[2])=="ZZD_DESCSB"})
	Local nPosVlr	:= aScan(oMSNewGe3:aHeader,{|x| AllTrim(x[2])=="ZZD_VALOR"})
	Local nPosVlr2	:= aScan(oMSNewGe3:aHeader,{|x| AllTrim(x[2])=="ZZD_VALOR2"})
	
	ZZD->(DbSelectArea("ZZD"))
	ZZD->(DbSetOrder(2))
	ZZD->(DbGotop())
	
	if ZZD->(DbSeek(xFilial("ZZD")+cGet1))
	
		if dGet3>=date()

			MsgAlert("Grupo já cadastrado para esse periodo!","Atenção!")
			Return(.F.)
		
		endif
	
	endif

	iF empty(cGet2) .Or. empty(dGet3)
		MsgAlert("Por favor preencha o grupo!","Atenção!")
		Return(.F.)	
	Else
	
		for nX := 1 to len(oMSNewGe3:aCols)

			iF oMSNewGe3:aCols[nX][nUsado] != .T.

				ZZD->(Reclock("ZZD", .T.))

					ZZD->ZZD_FILIAL := 	xFilial("ZZD")
					ZZD->ZZD_CODIGO := 	cCodigo
					ZZD->ZZD_GRUPO	:= 	cGet1
					ZZD->ZZD_DESCGP :=  cGet2
					ZZD->ZZD_DTVIG	:= 	dGet3	
					ZZD->ZZD_DESC	:= 	oMSNewGe3:aCols[nX][nPosDesc]
					ZZD->ZZD_SIMBOL	:= 	oMSNewGe3:aCols[nX][nPosSimb]
					ZZD->ZZD_DESCSB	:=	oMSNewGe3:aCols[nX][nPosDsb]
					ZZD->ZZD_VALOR	:=	oMSNewGe3:aCols[nX][nPosVlr]
					ZZD->ZZD_VALOR2	:=	oMSNewGe3:aCols[nX][nPosVlr2]

				ZZD->(MsUnlock())

			EndiF

		Next nX

	EndiF

	iF _cXrotina == "I"
		ConfirmSX8()
	EndiF
	
	oDlg:End()

Return()

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³ FunAlt   ³ Autor ³ Tarcisio Silva Miranda³ Data ³ 07/11/17 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Função que Altera todo o registro.						  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Uso       ³ Mococa.                                                    ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/

Static Function FunAlt()

	Local nX
	Local nUsado  	:= Len(oMSNewGe3:aHeader)+1
	Local nPosDesc	:= aScan(oMSNewGe3:aHeader,{|x| AllTrim(x[2])=="ZZD_DESC"})
	Local nPosSimb	:= aScan(oMSNewGe3:aHeader,{|x| AllTrim(x[2])=="ZZD_SIMBOL"})
	Local nPosDsb	:= aScan(oMSNewGe3:aHeader,{|x| AllTrim(x[2])=="ZZD_DESCSB"})
	Local nPosVlr	:= aScan(oMSNewGe3:aHeader,{|x| AllTrim(x[2])=="ZZD_VALOR"})
	Local nPosVlr2	:= aScan(oMSNewGe3:aHeader,{|x| AllTrim(x[2])=="ZZD_VALOR2"})
	Local cZDCod	:= ZZD->ZZD_CODIGO

	iF empty(cGet2) .Or. empty(dGet3)
		MsgAlert("Por favor preencha o grupo!","Atenção!")
		Return(.F.)
	Else

		ZZD->(DbSelectArea("ZZD")) // tenho que excluir esse pedido na zzh
		ZZD->(DbSetOrder(1))
		ZZD->(DbGotop())
	
		iF ZZD->(DbSeek(xFilial("ZZD")+cZDCod))
			
			WHILE !ZZD->(eof()) .AND. xFilial("ZZD") == ZZD->ZZD_FILIAL .AND. ZZD->ZZD_CODIGO == cZDCod
				
				ZZD->(Reclock("ZZD", .F.))
				ZZD->(dbdelete())
				ZZD->(MsUnlock())	
				ZZD->(dbskip())
			
			enddo
			
		EndiF

		for nX := 1 to len(oMSNewGe3:aCols)
			
			iF oMSNewGe3:aCols[nX][nUsado] != .T.
				
				ZZD->(Reclock("ZZD", .T.))
				
					ZZD->ZZD_FILIAL := 	xFilial("ZZD")
					ZZD->ZZD_CODIGO := 	cZDCod
					ZZD->ZZD_GRUPO	:= 	cGet1
					ZZD->ZZD_DESCGP :=  cGet2
					ZZD->ZZD_DTVIG	:= 	dGet3	
					ZZD->ZZD_DESC	:= 	oMSNewGe3:aCols[nX][nPosDesc]
					ZZD->ZZD_SIMBOL	:= 	oMSNewGe3:aCols[nX][nPosSimb]
					ZZD->ZZD_DESCSB	:=	oMSNewGe3:aCols[nX][nPosDsb]
					ZZD->ZZD_VALOR	:=	oMSNewGe3:aCols[nX][nPosVlr]
					ZZD->ZZD_VALOR2	:=	oMSNewGe3:aCols[nX][nPosVlr2]

				ZZD->(MsUnlock())
				
			EndiF
			
		Next nX
		
	endif
	
	oDlg:End()
	
Return()

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³ FunAlt   ³ Autor ³ Tarcisio Silva Miranda³ Data ³ 07/11/17 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Função que deleta todo o registro.						  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Uso       ³ Mococa.                                                    ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/

Static Function FunExcl(_cXrotina)

	if MsgYesNo("Deseja realmente excluir esse registro ?")
	
		cZDCod:= ZZD->ZZD_CODIGO
	
		ZZD->(DbSelectArea("ZZD"))
		ZZD->(DbSetOrder(1))      
		ZZD->(DbGotop())
		ZZD->(DbSeek(xFilial("ZZD")+cZDCod))
	
		While(ZZD->(!Eof()) .AND. cZDCod == ZZD->ZZD_CODIGO .and. ZZD->ZZD_FILIAL == xFilial("ZZD"))
			ZZD->(RecLock("ZZD",.F.))
			ZZD->(DbDelete())
			ZZD->(MsUnlock())
			ZZD->(DbSkip())
		EndDo                          
	
		ZZD->(DbCloseArea()) 
	
	endif

Return()