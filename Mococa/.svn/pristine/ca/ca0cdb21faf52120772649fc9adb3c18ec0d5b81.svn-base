#INCLUDE 'PROTHEUS.CH'
#INCLUDE "rwmake.ch"
#INCLUDE "topconn.ch"

#DEFINE CRLF CHR(13)+CHR(10)

/*/{Protheus.doc} RFINR001

Relatório de Resultados da Apuração Comissão CLT

@author Danilo Brito
@since 16/03/2017
@version Desenvolvido para P12
@param Nao recebe parametros
@return nulo
/*/
User Function RFINR001(_aIdApura)

	Local oReport
	Default _aIdApura := {}
	
	Private aIdApura := _aIdApura
	
	if empty(aIdApura)
		if !BuscaApura()	
			Return
		endif
	endif
	
	oReport:= ReportDef()
	oReport:PrintDialog()

Return

//---------------------------------------------------------
// Definiçao da estrutura do relatorio
//---------------------------------------------------------
Static Function ReportDef()

	Local oReport
	Local oApura
	Local oDetalhe
	Local cTitle    	:= "Resultados da Apuração Comissão CLT"

	oReport:= TReport():New("RFINR001",cTitle,"",{|oReport| PrintReport(oReport,oApura,oDetalhe)},"Este relatório apresenta o detalhamento de comissões por Vendedor, a partir dos movimentos bancários.")
	//oReport:SetPortrait() 		// Orientação retrato
	oReport:SetLandscape()			// Orientação paisagem 
	//oReport:HideHeader()  		// Nao imprime cabeçalho padrão do Protheus
	//oReport:HideFooter()			// Nao imprime rodapé padrão do Protheus
	oReport:HideParamPage()			// Inibe impressão da pagina de parametros
	oReport:SetUseGC(.T.) 			// Habilita o botão <Gestao Corporativa> do relatório
	//oReport:DisableOrientation()  // Desabilita a seleção da orientação (retrato/paisagem)
	//oReport:cFontBody := "Arial"
	//oReport:nFontBody := 8
		
	oApura := TRSection():New(oReport,"Apuração",{"SA3","Z07"},{"Produto/Grupo"})
	TRCell():New(oApura,"A3_COD"	, "SA3", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oApura,"A3_NOME"	, "SA3", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oApura,"Z07_DTINI", "Z07", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oApura,"Z07_DTFIM", "Z07", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oApura,"Z07_CODIGO", "Z07", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	
	oDetalhe := TRSection():New(oApura,"Detalhe",{"Z07"})	
	TRCell():New(oDetalhe,"Z07_PROD"	, "Z07", "Produto/Grupo"/*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDetalhe,"B1_DESC"		, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDetalhe,"Z07_METVOL"	, "Z07", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDetalhe,"Z07_REAVOL"	, "Z07", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDetalhe,"Z07_PATVOL"	, "Z07", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDetalhe,"Z07_METFAT"	, "Z07", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDetalhe,"Z07_REAFAT"	, "Z07", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDetalhe,"Z07_PATFAT"	, "Z07", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDetalhe,"Z07_PMETMC"	, "Z07", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDetalhe,"Z07_PREAMC"	, "Z07", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDetalhe,"Z07_PATMCT"	, "Z07", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDetalhe,"Z07_PREVOL"	, "Z07", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDetalhe,"Z07_PREFAT"	, "Z07", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDetalhe,"Z07_PREMCT"	, "Z07", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	
Return(oReport) 

//---------------------------------------------------------
// Faz impressão do relatório
//---------------------------------------------------------
Static Function PrintReport(oReport,oApura,oDetalhe)

	Local cDescric	:= ""
	Local nRecTot	:= 0
	Local nRetAux	:= 0
	Local nX
	
	Private cTotalVend := 0
	Private cTotalGer:= 0
	
	DbSelectArea("SA3")
	SA3->(DbSetOrder(1))
	
	For nX:=1 to len(aIdApura)
	
		DbSelectArea("Z07")
		Z07->(DbSetOrder(1))
		if Z07->(DbSeek(xFilial("Z07")+aIdApura[nX] ))
			
			//seto o vendedor
			SA3->(DbSeek(xFilial("SA3")+Z07->Z07_VEND))
			cTotalVend := 0
			nRecTot	:= 0
			nRetAux	:= 0
			
			oApura:Init()
			oApura:PrintLine()
			
			oDetalhe:Init()
			
			//laço com todos os registros do cIdApura
			While Z07->(!Eof()) .AND. Z07->Z07_FILIAL+Z07->Z07_CODIGO <= xFilial("Z07")+aIdApura[nX]
				
				If oReport:Cancel()
					Exit
				EndIf
			
				if !empty(Z07->Z07_PROD)//produto
					cDescric := Posicione("SB1",1,xFilial("SB1")+Z07->Z07_PROD,"B1_DESC")
					oDetalhe:Cell("Z07_PROD"):SetValue(Z07->Z07_PROD)
				elseif !empty(Z07->Z07_GRUPO) //grupo
					cDescric := Posicione("SBM",1,xFilial("SBM")+Z07->Z07_GRUPO,"BM_DESC")
					oDetalhe:Cell("B1_DESC"):SetValue(cDescric)
					oDetalhe:Cell("Z07_PROD"):SetValue(Z07->Z07_GRUPO)
				else //TOTAL REGIÃO
					nRecTot	:= Z07->(Recno())
					Z07->(DbSkip())
					LOOP
				endif
				
				oDetalhe:Cell("B1_DESC"):SetValue(cDescric)
				
				oDetalhe:PrintLine()
				
				cTotalVend += Z07->Z07_PREVOL
				cTotalVend += Z07->Z07_PREFAT
				cTotalVend += Z07->Z07_PREMCT
				
				Z07->(DbSkip())
			Enddo
			
			//imprimindo TOTAL REGIÃO
			nRetAux	:= Z07->(Recno())
			if nRecTot > 0
				Z07->(DbGoTo(nRecTot))
				oDetalhe:Cell("Z07_PROD"):SetValue("")
				oDetalhe:Cell("B1_DESC"):SetValue("TOTAL REGIÃO")
				
				oDetalhe:PrintLine()
				
				cTotalVend += Z07->Z07_PREVOL
				cTotalVend += Z07->Z07_PREFAT
				cTotalVend += Z07->Z07_PREMCT
				
				Z07->(DbGoTo(nRetAux))
			endif
			
			oDetalhe:Finish()			
			
			oReport:ThinLine()
			oReport:PrintText("  Total Vendedor: " + Transform(cTotalVend,PesqPict("SE3","E3_COMIS")) )
			oReport:SkipLine()
			
			cTotalGer += cTotalVend
			
			oApura:Finish()
			
		endif
		
	next nX
	
	oReport:SkipLine()
	oReport:ThinLine()
	oReport:PrintText("  TOTAL GERAL...: " + Transform(cTotalGer,PesqPict("SE3","E3_COMIS")) )

Return

//---------------------------------------------------------
// Faz busca dos dados para relatório
//---------------------------------------------------------
Static Function BuscaApura()
	
	Local nX := 0
	Local lRet := .F.
	Local bOk := {|| (lRet := .T.), oDlgRel:End() } 
	Local bCancel := {|| oDlgRel:End() }
	Local aButtons := {}
	Local oFontTitle := TFont():New('Arial',,23,.T.,.F.)
	Local nCorTitle := 12557067
	Local oEnchoice
	
	Private oDlgRel
	Private dDtFim := LastDay(dDataBase)
	Private dDtIni := YearSub( dDtFim , 1 )
	Private cVendIni := Space(6)
	Private cVendFim := "ZZZZZZ"
	Private nMarkG	:= 0   //Variavel de controle da função MarcaTodos
	Private __XVEZ	:= "0" //Variavel de controle da função MarcaTodos
	Private aEmptyLin := {}
	
	DEFINE MSDIALOG oDlgRel TITLE "Relatório" FROM 0,0 TO 500, 800 PIXEL //STYLE nOr(WS_VISIBLE, WS_POPUP)
	
	//barra de menus e titulo
	EnchoiceBar(oDlgRel, bOk, bCancel,.F.,@aButtons,0,"Z07", .F., .F., .T., .T., .F.)
	oEnchoice := oDlgRel:aControls[2]
	TSay():New( 03, 12,{|| "Escolha as apurações para o relatório" }, oEnchoice,,oFontTitle,,,,.T.,nCorTitle,,200,15 )
	
	TGroup():New(35,05,67,395,'Filtros',oDlgRel,,,.T.)
	
	TSay():New( 42, 10,{|| "Data Inicio" }, oDlgRel,,,,,,.T.,CLR_BLACK,,50,9 )
	TGet():New( 50, 10, {|u| iif( PCount()==0,dDtIni,dDtIni:= u) },oDlgRel,50,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.F.,.F.,,"Z07_DTINI",,,,.T.,.F.)

	TSay():New( 42, 70,{|| "Data Fim" }, oDlgRel,,,,,,.T.,CLR_BLACK,,50,9 )
	TGet():New( 50, 70, {|u| iif( PCount()==0,dDtFim,dDtFim:= u) },oDlgRel,50,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.F.,.F.,,"Z07_DTFIM",,,,.T.,.F.)
		
	TSay():New( 42, 130,{|| "Vendedor De" }, oDlgRel,,,,,,.T.,CLR_BLACK,,50,9 )
	TGet():New( 50, 130, {|u| iif( PCount()==0,cVendIni,cVendIni:= u) },oDlgRel,50,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.F.,.F.,"SA3","Z07_DTINI",,,,.T.,.F.)

	TSay():New( 42, 190,{|| "Vendedor Até" }, oDlgRel,,,,,,.T.,CLR_BLACK,,50,9 )
	TGet():New( 50, 190, {|u| iif( PCount()==0,cVendFim,cVendFim:= u) },oDlgRel,50,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.F.,.F.,"SA3","Z07_DTFIM",,,,.T.,.F.)
	
	TButton():New( 51, 250, "Buscar", oDlgRel,{|| AtuGrid() }, 40,12,,,.F.,.T.,.F.,,.F.,,,.F. )	
	
	oGridApur := DoGridApur(oDlgRel, 70, 01, 258, 403) 
	bSvblDb5 := oGridApur:oBrowse:bLDblClick
	oGridApur:oBrowse:bHeaderClick := {|oBrw,nCol| if(oGridApur:oBrowse:nColPos<>111 .and. nCol == 1,(MarcaTodos(@oGridApur,@nMarkG),oBrw:SetFocus()),)}
	oGridApur:oBrowse:bLDblClick := {|| if(oGridApur:oBrowse:nColPos!=0, Clique(@oGridApur), GdRstDblClick(@oGridApur, @bSvblDb5))}
	
	AtuGrid()
			
	oDlgRel:lCentered := .T.
	oDlgRel:Activate()
	
	if lRet
		for nX := 1 to len(oGridApur:aCols)
			if oGridApur:aCols[nX][1] == "LBOK" .AND. !Empty(oGridApur:aCols[nX][7])
				aadd(aIdApura, oGridApur:aCols[nX][7]) 
			endif
		next nX
	endif
	
Return lRet

//---------------------------------------------------------
// Faz busca dos dados para atualizar no grid.
//---------------------------------------------------------
Static Function AtuGrid()
	
	Local cQry  := ""
	
	oGridApur:aCols := {} 
	
	cQry := " SELECT DISTINCT Z07_CODIGO, Z07_DTINI, Z07_DTFIM, Z07_VEND, Z07_EMISSA FROM " + RetSqlName("Z07") 
	cQry += " WHERE D_E_L_E_T_ <> '*' AND Z07_FILIAL = '"+xFilial("Z07")+"' "
	cQry += "   AND Z07_VEND BETWEEN '"+cVendIni+"' AND '"+cVendFim+"'" 
	cQry += "   AND ((Z07_DTINI BETWEEN '"+DTOS(dDtIni)+"' AND '"+DTOS(dDtFim)+"' )" 
	cQry += "    OR  (Z07_DTFIM BETWEEN '"+DTOS(dDtIni)+"' AND '"+DTOS(dDtFim)+"' ))"
	cQry += " ORDER BY Z07_CODIGO"
	
	cQry := ChangeQuery(cQry)
	
	If Select("QAUX") > 0
		QAUX->(dbCloseArea())
	EndIf
	
	dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUX", .F., .T.)
	
	While QAUX->(!Eof())
		
		aadd(oGridApur:aCols, { ;
			"LBNO",;
			STOD(QAUX->Z07_DTINI),;
			STOD(QAUX->Z07_DTFIM),;
			QAUX->Z07_VEND,;
			Posicione("SA3",1,xFilial("SA3")+QAUX->Z07_VEND,"A3_NOME"),;
			STOD(QAUX->Z07_EMISSA),;
			QAUX->Z07_CODIGO,;
			.F.;
		})
		
		QAUX->(dbSkip())
	enddo
	
	QAUX->(dbCloseArea())
	
	if empty(oGridApur:aCols)
		aadd(oGridApur:aCols, aClone(aEmptyLin))	
	endif
	
	oGridApur:Refresh()
	
Return

//---------------------------------------------------------
// Monta Grid de Apurações
//---------------------------------------------------------
Static Function DoGridApur(oDlg, nTop, nLeft, nBottom, nRight)

	Local nX
	Local aHeaderEx    := {}
	Local aColsEx      := {}
	Local aFieldFill   := {}
	Local aFields      := {"MARK","Z07_DTINI","Z07_DTFIM","Z07_VEND","A3_NOME","Z07_EMISSA","Z07_CODIGO"}
	Local aAlterFields := {}
	Local nLinMax 	   := 999  // Quantidade de linha na getdados
	
	Aadd(aHeaderEx,{'','MARK','@BMP',2,0,'','€€€€€€€€€€€€€€','C','','','',''})
	Aadd(aFieldFill,"LBNO")
	
	// Define field properties
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	For nX := 1 to Len(aFields)
		If SX3->(DbSeek(aFields[nX]))		
			Aadd(aHeaderEx, {AllTrim(X3Titulo()),SX3->X3_CAMPO,SX3->X3_PICTURE,SX3->X3_TAMANHO,SX3->X3_DECIMAL,SX3->X3_VALID,;
							SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})
			if SX3->X3_TIPO == "N"
				Aadd(aFieldFill,0)
			elseif SX3->X3_TIPO == "D"
				Aadd(aFieldFill,CTOD(""))
			elseif SX3->X3_TIPO == "L"
				Aadd(aFieldFill,.F.)
			else
				Aadd(aFieldFill,"")
			endif
		Endif
	Next nX
	Aadd(aFieldFill,.F.) //deletado
	
	Aadd(aColsEx, aFieldFill)
	
	aEmptyLin := aClone(aFieldFill)	

Return MsNewGetDados():New( nTop, nLeft, nBottom, nRight, , "AllwaysTrue", "AllwaysTrue", "AllwaysTrue",;
							aAlterFields, , nLinMax, "AllwaysTrue", "AllwaysTrue", "AllwaysTrue", oDlg, aHeaderEx, aColsEx)

//---------------------------------------------------------
// Seleciona linha grid Um a Um
//---------------------------------------------------------
Static Function Clique(oMsMark)
	 
	if oMsMark:aCols[oMsMark:nAt][1] == "LBOK"
		oMsMark:aCols[oMsMark:nAt][1] := "LBNO"
	else
		oMsMark:aCols[oMsMark:nAt][1] := "LBOK"	
	endif

	oMsMark:oBrowse:Refresh()	
	
Return 

//---------------------------------------------------------
// Seleciona/Desmarca todas linhas do grid
//---------------------------------------------------------
Static Function MarcaTodos(oMsMark,nMarca)
	
	Local nX
	
	if __XVEZ == "0"
		__XVEZ := "1"
	else
		if __XVEZ == "1"
			__XVEZ := "2"
		endif
	endif
	
	if __XVEZ == "2"
		if nMarca == 0
			for nX := 1 to len(oMsMark:aCols)
				oMsMark:aCols[nX][1] := "LBOK"
			next
			nMarca := 1                      
		else
			for nX := 1 to len(oMsMark:aCols)
				oMsMark:aCols[nX][1] := "LBNO"
			next
			nMarca := 0
		endif 
		__XVEZ:="0"
	
		oMsMark:oBrowse:Refresh()
	    
	endif

Return