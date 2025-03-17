/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Rotinas para tratamento de Janelas                         บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
#Include "TOTVS.CH"
#Include "FONT.CH"
//#Include "BEL.CH"

User Function BrwIncCampos( oBrowse, cTabela, aCampos, nFreeze )
	Local bBlock
	Local lEdit  := .F.
	Local nxAux  := 0
	Local oCol   := nil
	Local bBlock

	Default nFreeze := 0

	For nxAux := 1 to Len( aCampos )
		While Len( aCampos[nxAux] ) < 9
			aadd( aCampos[nxAux], nil )
		End
		If aCampos[nxAux,6] == Nil  // lImagem
			aCampos[nxAux,6] := .F.
		Endif
		If aCampos[nxAux,7] != Nil .And. ValType(aCampos[nxAux,7]) == "B" // Campo
			bBlock := aCampos[nxAux,7]
		Else
			bBlock := &( "{ || " + cTabela + "->" + aCampos[nxAux,1] + " }" )
		EndIf
		If aCampos[nxAux,8] == Nil  // lEdit
			aCampos[nxAux,8] := .F.
		EndIf 
		If aCampos[nxAux,9] == Nil  // bValid
			aCampos[nxAux,9] := { || .T. }
		EndIf 

		//               1        2     3        4        5        6      7      8       9     10    11     12     13      14     15
		//TCColumn():New(cHeading,bData,cPicture,bClrFore,bClrBack,uAlign,nWidth,lBitMap,lEdit,cMsg, bValid,cError,lNoLite,cOrder,cSeekType)
		//                      1                 2       3                  6                7                8                9                 11               13
		oCol := TCColumn():New( aCampos[nxAux,2], bBlock, aCampos[nxAux,3],,,aCampos[nxAux,4],aCampos[nxAux,5],aCampos[nxAux,6],aCampos[nxAux,8],,aCampos[nxAux,9],,.F., )
		oBrowse:AddColumn( oCol )
	Next
	oBrowse:nFreeze := nFreeze
Return

User Function BrwHeaderCpo( aCampos, cxCpoSX3, cxCampo, cxTitulo, cxPicture, nTam, cAlign, bConteudo, lEdit, lImagem )
	Local aCpo := {}

	Default cxCampo   := cxCpoSX3
	Default cxTitulo  := ""
	Default cxPicture := ""
	Default cAlign    := ""
	Default lEdit     := .T.
	Default lImagem   := .F.

	cxCampo := Left( cxCampo + Space(10), 10 )

	If !Empty( cxCpoSX3 )
		SX3->( dbSetOrder(2) )
		If SX3->( dbSeek( cxCpoSX3 ) )
			cxTitulo  := If( Empty(cxTitulo) , X3TITULO()     , cxTitulo  )
			cxPicture := If( Empty(cxPicture), SX3->X3_PICTURE, cxPicture )
			nTam      := If( Empty(nTam)     , SX3->X3_TAMANHO, nTam      )
			If Empty( cAlign ) .And. SX3->X3_TIPO = "N"
				cAlign := "RIGHT"
			EndIf
		EndIf
	EndIf
	cAlign := If( Empty( cAlign ), "LEFT", cAlign )

	aadd( aCpo, cxCampo         )  // Campo
	aadd( aCpo, cxTitulo        )  // Titulo
	aadd( aCpo, cxPicture       )  // Picture
	aadd( aCpo, cAlign          )  // Alinhamento
	aadd( aCpo, nTam            )  // Tamanho
	aadd( aCpo, lImagem         )  // ษ campo imagem?
	aadd( aCpo, bConteudo       )  // CodeBlock de Preenchimento
	aadd( aCpo, lEdit           )  // Permite Edi็ใo
	aadd( aCpo, { || .T. }      )  // CodeBlock Valid

	aadd( aCampos, aCpo )
Return

Class TBelBrowse From TCBrowse
	Data axCampos
	Data cxAlias
	Data cxMarca
	Data cxCpoMarca
	Data oNoMarked
	Data oMarked
	Data bAllowEdit
	Data bChangeMark
	Data bDoubleClick
	Data lxPixel
	Data lxAutoEditCell
	Data lxAutoMark

	Method New( aPosicao, cAlias, oWnd, bChange, bDblClick, bRClick ) CONSTRUCTOR

	Method AddCampo( cxCpoSX3, cxCampo, cxTitulo, cxPicture, nTam, cAlign, bConteudo, lEdit, lImagem, bValid, cF3, aCBox )
	Method AddCpoMark( cxCampo )
	Method AutoEditCell( lxAtivado )
	Method AutoMark( lxAtivado )
	Method Congelar( nxNumColunas )
	Method EditCell( nxColuna )
	Method DoubleClick()
	Method IncCampos( aCampos, nFreeze )
	Method ImgMarca()
	Method GetMarca()
	Method GetSelect()
	Method BeRefresh()

	Method SetWidthMethod( lPixel )

	Method SetAllowEdit( bBlock )  // Executado antes de Editar uma celula
	Method SetChangeMark( bBlock ) // Executado ap๓s a troca do Mark
	Method SetChangeLine( bBlock ) // Quando Muda de Registro
	Method SetHeaderClick( bBlock )
	Method SetDoubleClick( bBlock )
	Method SetPixelMode( lPixel )  // Ativar/Desativar o modo de medida em Pixels
	Method SetRightClick( bBlock )

	Method TrocaMarca( cxCampo )
EndClass

// aPosicao  = { nLinI, nColI, nLinF, nColF }  <-- Em pixel
// cAlias    = Alias da tabela em uso. Aceita tabela temporแria
// bChange   = Bloco a ser executado na altera็ใo
// bDblClick = Bloco a ser executado no Double Click do mouse
// bRClick   = Bloco a ser executado no Right Click do mouse
// lPixel    = Habilita coordenadas em Pixel. Default .F. para caracteres.
Method New( aPosicao, cAlias, oWnd, bChange, bDblClick, bRClick ) Class TBelBrowse
	:New( aPosicao[1], aPosicao[2], aPosicao[3], aPosicao[4],,,, oWnd,,,, bChange, , bRClick,,,,,, .F., cAlias, .T.,, )

	//                            1     2     3       4        5      6         7                        
	//oBrwPro  := TCBrowse():New( nRow, nCol, nWidth, nHeight, bLine, aHeaders, aColSizes,
	//8     9       10       11       12       13         14       15     16       17       
	//oWnd, cField, uValue1, uValue2, bChange, bDblClick, bRClick, oFont, oCursor, nClrFore,
	//18        19    20        21      22      23     24        25      26        27
	//nClrBack, cMsg, uParam20, cAlias, lPixel, bWhen, uParam24, bValid, lHScroll, lVScroll )

	Self:axCampos       := {}
	Self:bAllowEdit     := Nil
	Self:bChangeMark    := Nil
	Self:bDoubleClick   := bDblClick
	Self:bLDblClick     := { || ::DoubleClick() }
	Self:cxAlias        := cAlias
	Self:cxMarca        := (cAlias)->( GetMark() )
	Self:cxCpoMarca     := ""
	Self:oNoMarked      := LoadBitmap( GetResources(), "LBNO" )
	Self:oMarked        := LoadBitmap( GetResources(), "LBOK" )
	Self:lxPixel        := .F.
	Self:lxAutoEditCell := .F.
	Self:lxAutoMark     := .F.
Return Self

//               1         2        3         4          5     6       7          8      9        10      11   12     13
Method AddCampo( cxCpoSX3, cxCampo, cxTitulo, cxPicture, nTam, cAlign, bConteudo, lEdit, lImagem, bValid, cF3, aCbox ) CLASS TBelBrowse
	Local aCpo		  := {}
	Local bBlock
	Local nxAux	  := 0
	Local oCol		  := nil
	Local nWidthDef := 5

	Default cxCampo	:= cxCpoSX3
	Default cxTitulo	:= ""
	Default cxPicture	:= ""
	Default nTam		:= 0
	Default cAlign	:= ""
	Default lEdit		:= .T.
	Default lImagem	:= .F.
	Default bValid	:= { || .T. }
	Default cF3		:= ""
	Default aCbox		:= {}

	cxCampo := Left( cxCampo + Space(10), 10 )

	If !Empty( cxCpoSX3 )
		SX3->( dbSetOrder(2) )
		If SX3->( dbSeek( cxCpoSX3 ) )
			cxTitulo	 := If( Empty(cxTitulo)	,X3TITULO()     							,cxTitulo 	)
			cxPicture := If( Empty(cxPicture),SX3->X3_PICTURE							,cxPicture	)
			If Empty(cxPicture)
				cxPicture := "@X"
			EndIf
			nTam		 := If( Empty(nTam)		,SX3->X3_TAMANHO							,nTam		)
			aCbox		 := If( Empty(aCbox)		,U_Split(AllTrim(SX3->X3_CBOX),";")	,aCbox		)
			If Empty( cAlign ) .And. SX3->X3_TIPO = "N"
				cAlign := "RIGHT"
			EndIf
		EndIf
	EndIf
	cAlign := If( Empty( cAlign ), "LEFT", cAlign )

	If nTam == 0
		nTam := 10
	EndIf

	If ::lxPixel
		nTam *= nWidthDef
	EndIf

	aadd( aCpo, cxCampo		)	// 01 - Campo
	aadd( aCpo, cxTitulo		)	// 02 - Titulo
	aadd( aCpo, cxPicture	)	// 03 - Picture
	aadd( aCpo, cAlign		)	// 04 - Alinhamento
	aadd( aCpo, nTam			)	// 05 - Tamanho
	aadd( aCpo, lImagem		)	// 06 - ษ campo imagem?
	aadd( aCpo, bConteudo	)	// 07 - CodeBlock de Preenchimento
	aadd( aCpo, lEdit			)	// 08 - Permite Edi็ใo
	aadd( aCpo, bValid		)	// 09 - CodeBlock Valid
	aadd( aCpo, cF3			)	// 10 - Consulta padrao F3
	aadd( aCpo, aCbox			)	// 11 - Lista de op็๕es

	aadd( ::axCampos, aCpo )

	If aCpo[7] != Nil .And. ValType(aCpo[7]) == "B" // Campo
		bBlock := aCpo[7]
	Else
		bBlock := &( "{ || " + Self:cxAlias + "->" + aCpo[1] + " }" )
	EndIf

	//               1       2     3        4        5        6            7        8       9     10   11     12     13      14     15
	//TCColumn():New(cTitulo,bData,cPicture,bClrFore,bClrBack,cAlinhamento,nLargura,lBitMap,lEdit,cMsg,bValid,cError,lNoLite,cOrder,cSeekType)
	//                      1        2       3         6       7       8       9       10   13
	oCol := TCColumn():New( aCpo[2], bBlock, aCpo[3],,,aCpo[4],aCpo[5],aCpo[6],aCpo[8],  ,,,.F., )
	Self:AddColumn( oCol )

Return

Method AddCpoMark( cxCampo ) CLASS TBelBrowse
	Local	bMark	:=	{ || ::ImgMarca() }

	Self:cxCpoMarca := cxCampo
	Self:AddCampo( , cxCampo, "", "", 8, "CENTER", bMark, .F., .T. )		
Return

Method AutoEditCell( lxAtivado ) CLASS TBelBrowse
	::lxAutoEditCell := lxAtivado 
Return

Method AutoMark( lxAtivado ) CLASS TBelBrowse
	::lxAutoMark := lxAtivado 
Return

Method Congelar( nxNumColunas ) CLASS TBelBrowse
	Self:nFreeze := nxNumColunas
Return

Method DoubleClick() CLASS TBelBrowse
	Local lOK   := .T.
	Local lMark := .T.

	If ::bDoubleClick != Nil
		EVal( ::bDoubleClick, Self:ColPos() )
	EndIf

	If ::lxAutoEditCell
		If ::bAllowEdit != Nil
			lOK := EVal( ::bAllowEdit )
		EndIf

		If lOK
			If Self:axCampos[Self:ColPos(),8]
				lMark := .F.
			EndIf

			Self:EditCell( Self:ColPos() )
		EndIf
	EndIf

	If lMark .And. ::lxAutoMark .And. Empty(::cxCpoMarca) == .F.
		::TrocaMarca(::cxCpoMarca)
	EndIf 
Return

Method EditCell( nxColuna ) CLASS TBelBrowse
	Local oDlg
	Local oRect
	Local oGet1
	Local oCbox
	Local oBtn
	Local cMacro	:=	""
	Local nRow		:=	Self:nAt
	Local oOwner	:=	Self:oWnd
	Local cPict	:=	""
	Local bValid
	Local cF3		:=	""
	Local aCbox	:=	{}

	If Self:axCampos[nxColuna,8]
		oRect := tRect():New(0,0,0,0)       // obtem as coordenadas da celula (lugar onde
		Self:GetCellRect(nxColuna,,oRect)   // a janela de edicao deve ficar)
		aDim  := {oRect:nTop,oRect:nLeft,oRect:nBottom,oRect:nRight}

		DEFINE DIALOG oDlg OF oOwner  FROM 0, 0 TO 0, 0 STYLE nOR( WS_VISIBLE, WS_POPUP ) PIXEL

		cMacro		:=	"M->CELL"+StrZero(nRow,6)
		&cMacro	:=	( ::cxAlias )->&( ::axCampos[nxColuna,1] )
		cPict		:=	::axCampos[nxColuna,3]
		bValid		:=	::axCampos[nxColuna,9]
		cF3			:=	::axCampos[nxColuna,10]
		aCbox		:=	::axCampos[nxColuna,11]

		If Empty(aCbox)
			@ 0,0 MSGET oGet1 VAR &(cMacro) SIZE 0,0 OF oDlg FONT oOwner:oFont PICTURE cPict PIXEL F3 cF3 VALID bValid
			oGet1:Move(-2,-2, (aDim[ 4 ] - aDim[ 2 ]) + 4, aDim[ 3 ] - aDim[ 1 ] + 4 )
			oGet1:cReadVar  := cMacro
		Else		
			@ 0,0 MSCOMBOBOX oCbox VAR &(cMacro) ITEMS aCbox SIZE 0,0 OF oDlg FONT oOwner:oFont VALID bValid
			//@ 0,0 COMBOBOX cOpc ITEMS aCbox SIZE 0,0 OBJECT oCbox
			oCbox:Move(-2,-2, (aDim[ 4 ] - aDim[ 2 ]) + 4, aDim[ 3 ] - aDim[ 1 ] + 4 )
			oCbox:cReadVar  := cMacro
		EndIf

		@ 0, 0 BUTTON oBtn PROMPT "ze" SIZE 0,0 OF oDlg
		oBtn:bGotFocus := {|| oDlg:nLastKey := VK_RETURN, oDlg:End(0)}

		ACTIVATE DIALOG oDlg ON INIT oDlg:Move(aDim[1],aDim[2],aDim[4]-aDim[2], aDim[3]-aDim[1])

		RecLock(::cxAlias,.F.)
		( ::cxAlias )->&( ::axCampos[nxColuna,1] ) := &cMacro
		( ::cxAlias )->( MsUnlock() )
		Self:nAt := nRow
		SetFocus(Self:hWnd)
		Self:Refresh()
	EndIf

Return .T.

Method GetSelect() CLASS TBelBrowse
Return Self:aArray[Self:nAt,Self:ColPos]

Method ImgMarca() CLASS TBelBrowse
	Local oImg := Nil

	If (::cxAlias)->&( ::cxCpoMarca ) == ::cxMarca
		oImg := ::oMarked
	Else
		oImg := ::oNoMarked
	EndIf

	If ::bChangeMark != nil
		eval( ::bChangeMark )
	EndIf
Return oImg

Method IncCampos( aCampos, nFreeze ) CLASS TBelBrowse

	U_BrwIncCampos( Self, Self:cxAlias, aCampos, nFreeze )
Return

Method BeRefresh() CLASS TBelBrowse
	Self:ResetLen()
	Self:Refresh()
Return

Method GetMarca() CLASS TBelBrowse
Return ::cxMarca

Method SetChangeMark( bBlock ) CLASS TBelBrowse
	::bChangeMark := bBlock
Return

Method SetAllowEdit( bBlock ) CLASS TBelBrowse
	::bAllowEdit := bBlock
Return

Method SetWidthMethod( lPixel ) CLASS TBelBrowse
	::lxPixel := lPixel
Return ::lxPixel

// bBlock := { |oObj,nCol| Funcao( oObj, nCol ) }
Method SetHeaderClick( bBlock ) CLASS TBelBrowse
	Self:bHeaderClick := bBlock
Return

Method SetDoubleClick( bBlock ) CLASS TBelBrowse
	//Self:bLDblClick := bBlock
	Self:bDoubleClick := bBlock
Return

Method SetChangeLine( bBlock ) CLASS TBelBrowse
	Self:bChange := bBlock
Return

Method SetPixelMode( lPixel ) CLASS TBelBrowse

	Default lPixel := .F.

	Self:lxPixel := lPixel
Return

Method SetRightClick( bBlock ) CLASS TBelBrowse
	Self:bRClicked := bBlock
Return

Method TrocaMarca( cxCampo ) CLASS TBelBrowse

	If cxCampo = Nil .And. !Empty(::cxCpoMarca)
		cxCampo := ::cxCpoMarca
	EndIf

	If (::cxAlias)->( Bof() ) .Or. (::cxAlias)->( Eof() )
		// Ponteiro fora dos dados...
		// Ignorar
	Else	
		RecLock(::cxAlias,.F.)
		If (::cxAlias)->&( cxCampo ) == ::cxMarca
			(::cxAlias)->&( cxCampo ) := ""
		Else
			(::cxAlias)->&( cxCampo ) := ::cxMarca
		EndIf
		(::cxAlias)->( MsUnlock() )
	EndIf
Return .T.

// Pesquisa em MBrowse baseada em arquivo temporแrio.
User Function PesqTMP( aOrd )
	Local oDlgPesq
	Local oBigGet
	Local oCBX
	Local nOldOrd    := IndexOrd()
	Local nRet       := 0
	Local nOrd       := 0
	Local cOrd       := ""
	Local aOrd       := {}
	Local lSeek      := .F.
	Local cAlias     := Alias()
	Local cCampo     := Space(100)
	Local nTAGs      := 0

	nTAGs   := (cAlias)->( dbOrderInfo(DBOI_ORDERCOUNT) )
	For nOrd := 1 to nTAGs
		(cAlias)->( dbSetOrder(nOrd) )
		aadd( aOrd, Alltrim( (cAlias)->( IndexKey(nOrd) ) ) )
	Next

	DEFINE MSDIALOG oDlgPesq FROM 00,00 TO 100,490 PIXEL TITLE "Pesquisa"

	@ 05,05 COMBOBOX oCBX VAR cOrd ITEMS aOrd SIZE 206,36 PIXEL OF oDlgPesq FONT oDlgPesq:oFont
	@ 22,05 MSGET oBigGet VAR cCampo SIZE 206,10 PIXEL

	DEFINE SBUTTON FROM 05,215 TYPE 1 OF oDlgPesq ENABLE ACTION (lSeek := .T., oDlgPesq:End())
	DEFINE SBUTTON FROM 20,215 TYPE 2 OF oDlgPesq ENABLE ACTION oDlgPesq:End()

	ACTIVATE MSDIALOG oDlgPesq CENTERED

	If lSeek
		nRet := 1
		nOrd := aScan( aOrd, { |cOpc| cOpc = cOrd } )
		If nOrd > 0
			(cAlias)->( dbSetOrder( nOrd ) )
			(cAlias)->( dbSeek( cCampo, .T. ) )
		EndIf
		(cAlias)->( dbSetOrder( nOldOrd ) )
	EndIf
Return nRet
