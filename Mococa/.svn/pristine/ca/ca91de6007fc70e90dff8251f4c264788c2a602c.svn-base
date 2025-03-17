#Include 'Protheus.ch'

User Function AGLT303()
	
	Local _cAliasMED := GetNextAlias()
	
	Private aCoors := FWGetDialogSize( oMainWnd )
	Private oPanelUp, oFWLayer, oPanelDown, oPanelRight, oBrowse, oBrowseUp, oBrowseDown, oRelacZAA, oPanel1
	
	Private oDlgPrinc
	
	Define MsDialog oDlgPrinc Title '[AGLT303] Medidor de Vazใo' From aCoors[1] * 0.8, aCoors[2] * 0.8 To aCoors[3] * 0.8, aCoors[4] * 0.8 Pixel
	
	//
	// Cria o conteiner onde serใo colocados os browses
	//
	oFWLayer := FWLayer():New()
	oFWLayer:Init( oDlgPrinc, .F., .T. )
	
	//
	// Define Painel Superior
	//
	oFWLayer:AddLine( 'UP', 100, .F. )// Cria uma "linha" com 40% da tela
	oFWLayer:AddCollumn( 'ALL', 100, .T., 'UP' )// Na "linha" criada eu crio uma coluna com 100% da tamanho dela
	oPanelUp := oFWLayer:GetColPanel( 'ALL', 'UP' )// Pego o objeto desse peda็o do container
	
	oPanel1    := TPanel():New( 0-1,0-4,"",oPanelUp,,.F.,.F.,,,268,101,.T.,.F. )
	oPanel1:Align := CONTROL_ALIGN_ALLCLIENT
	
	// Grava parโmetros da Rotina
	GrvSX6()
	
	// Cria arquivo temporแrio com os dados do medidor de vazใo
	CriaTMP(@_cAliasMED)
	
	// Cria campos para o MarkBrowse
	aCampos  := RetCampos()
	
	dbSelectArea(_cAliasMed)
	(_cAliasMed)->(dbGoTOp())
	
	// Cria MarkBrowse com os dados do medidor de vazใo.
	oMark := FWMarkBrowse():New()
	cMarca := GetMark()
	oMark:SetOwner( oPanel1 )
	
	oMark:SetAlias(_cAliasMED)
	oMark:SetDescription('Sele็ใo de medi็๕es')
	oMark:SetFieldMark( 'MBR_OK' )
	oMark:DisableConfig()
	oMark:SetFields(aCampos)
	oMark:SetWalkThru(.F.)
	oMark:SetAmbiente(.F.)
	oMark:SetMenuDef("")
	oMark:SetAfterMark({|| ChangeMRK(_cAliasMED, (_cAliasMED)->(Recno()), @oMark)})
	oMark:Activate()
	Activate MsDialog oDlgPrinc Center
	
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRetStru   บAutor  ณCleiton Campos      บ Data ณ  05/27/12   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณRetorna estrutura.                                          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Aula de MVC                                                บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function RetCampos()
	
	Local _aRetorno := {}
	
	aAdd(_aRetorno,{"Filial"     , "TMP_FILIAL" , "C",,, 02,0, "@!"})
	aAdd(_aRetorno,{"Ticket"     , "TMP_TICKET" , "C",,, 05,0, "@!"})
	aAdd(_aRetorno,{"Data"       , "TMP_DTMED"  , "D",,, 08,0,     })
	aAdd(_aRetorno,{"Hora"       , "TMP_HORA"   , "C",,, 08,0,     })
	aAdd(_aRetorno,{"Placa"      , "TMP_PLACA"  , "C",,, 08,0,  "@!"})
	aAdd(_aRetorno,{"Quantidade" , "TMP_QTDMED" , "N",,, 14,2,  "@x 999,999,999.99"})
	aAdd(_aRetorno,{"Temperatura", "TMP_TEMPER" , "N",,, 06,2,  "@x 999.9"})
	
Return(_aRetorno)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณCriaREC   บAutor  ณCleiton Campos      บ Data ณ  05/27/12   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณCria arquivo de recepcao para Markbrowse.                   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Aula de MVC                                                บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function CriaTMP(_cAliasMED)
	
	Local cArqTxt := GetMv("LT_MEDIDOR")
	Local aStruSQL := RetStru()
	Local _aCabec  := {}
	Local _aLinha  := {}
	
	cArqTrb := CriaTrab(aStruSQL,(.T.))
	dbUseArea((.T.),__LOCALDRIVER,cArqTrb,_cAliasMED,(.T.),(.F.))
	
	// Abre o arquivo de peso da balan็a
	FT_FUSE(cArqTxt)
	
	// Posiciona na primeira linha do arquivo
	FT_FGoTop()
	
	_aCabec := STRTOKARR(FT_FReadLn(),";")
	
	_nData   := aScan(_aCabec, "Data")
	_nHora   := aScan(_aCabec, "Hora")
	_nColeta := aScan(_aCabec, "NumeroColeta")
	_nPlaca  := aScan(_aCabec, "Placa")
	_nQtdade := aScan(_aCabec, "QtdMedidor")
	
	FT_FSkip()
	
	While !FT_FEof()
		
		_aLinha := STRTOKARR(FT_FReadLn(),";")
		
		dbSelectArea(_cAliasMED)
		RecLock(_cAliasMED,.T.)
		
		(_cAliasMED)->TMP_FILIAL := '  '
		(_cAliasMED)->TMP_TICKET := _aLinha[_nColeta]
		(_cAliasMED)->TMP_DTMED	 := CtoD(_aLinha[_nData])
		(_cAliasMED)->TMP_HORA 	 := _aLinha[_nHora]
		(_cAliasMED)->TMP_PLACA  := _aLinha[_nPlaca]
		(_cAliasMED)->TMP_QTDMED := Val(_aLinha[_nQtdade])
		
		MsUnLock()
		
		FT_FSkip()
		
	EndDo
	
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRetStru   บAutor  ณCleiton Campos      บ Data ณ  05/27/12   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณRetorna estrutura.                                          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Aula de MVC                                                บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function RetStru()
	
	Local _aRetorno := {}
	Local _lFormas
	
	aAdd(_aRetorno,{"TMP_FILIAL" , "C", 02,0})
	aAdd(_aRetorno,{"TMP_TICKET" , "C", 05,0})
	aAdd(_aRetorno,{"TMP_DTMED"  , "D", 08,0})
	aAdd(_aRetorno,{"TMP_HORA"   , "C", 08,0})
	aAdd(_aRetorno,{"TMP_PLACA"  , "C", 08,0})
	aAdd(_aRetorno,{"TMP_QTDMED" , "N", 14,2})
	aAdd(_aRetorno,{"TMP_TEMPER" , "N", 06,2})
	aAdd(_aRetorno,{"MBR_OK" , "C", 02,0})
	
Return(_aRetorno)
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFun…o    ณChangeMRK ณ Autor ณFabio Rogerio Pereira  ณ Data ณ19/02/02  ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescri…o ณ Marca desmarca registros marcados para nใo permitir que    ณฑฑ
ฑฑณ          ณ mais de um registro seja marcado.                          ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ Empr้stimos bancแrios.                                     ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ChangeMRK(_cAliasMED, _nRecno, oBrwMrk)

(_cAliasMED)->(dbGoTOp())
While !(_cAliasMED)->(Eof())
	
	If (_cAliasMED)->(Recno()) <> _nRecno .and. oBrwMrk:IsMark()
		oBrwMrk:MarkRec()
	EndIf
	
	(_cAliasMED)->(dbSkip())
	
EndDo
oBrwMrk:GoTo(_nRecno)
//oBrwMrk:MarkRec()

Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFun…o    ณGrvSX6    ณ Autor ณFabio Rogerio Pereira  ณ Data ณ19/02/02  ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescri…o ณ Funcao de processamento da gravacao do SX6                 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ Empr้stimos bancแrios.                                     ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GrvSX6()
	//  X6_FIL   X6_VAR     X6_TIPO    X6_DESCRIC X6_DSCSPA  X6_DSCENG  X6_DESC1 X6_DSCSPA1 X6_DSCENG1
	//  X6_DESC2 X6_DSCSPA2 X6_DSCENG2 X6_CONTEUD X6_CONTSPA X6_CONTENG X6_PROPRI
	
	Local aSX6   := {}
	Local aEstrut:= {}
	Local i      := 0
	Local j      := 0
	Local lSX6	 := .F.
	Local cTexto := ''
	Local cAlias := ''
	
	aEstrut := {"X6_FIL","X6_VAR","X6_TIPO","X6_DESCRIC","X6_DSCSPA","X6_DSCENG","X6_DESC1","X6_DSCSPA1","X6_DSCENG1","X6_DESC2","X6_DSCSPA2","X6_DSCENG2","X6_CONTEUD","X6_CONTSPA","X6_CONTENG","X6_PROPRI","X6_PYME"}
	
	aAdd(asx6,{xFilial("SX6"), "LT_MEDIDOR", "C", "Caminho e nome do arquivo do medidor de vazใo", "", "", "", "", "", "", "","","C:\TOTVS\Medidor\coletas.txt","C:\TOTVS\Medidor\coletas.txt","C:\TOTVS\Medidor\coletas.txt","S","S"})
	
	ProcRegua(Len(aSX6))
	
	dbSelectArea("SX6")
	dbSetOrder(1)
	For i:= 1 To Len(aSX6)
		If !Empty(aSX6[i][2])
			If !dbSeek("  "+aSX6[i,2]) .And. !dbSeek(xFilial("SX6")+aSX6[i,2])
				lSX6	:= .T.
				If !(aSX6[i,2]$cAlias)
					cAlias += aSX6[i,2] //+ ":"+aSX6[i,4]+aSX6[i,7]+aSX6[i,10]+CHR(13)+CHR(10)
				EndIf
				RecLock("SX6",.T.)
				For j:=1 To Len(aSX6[i])
					If !Empty(FieldName(FieldPos(aEstrut[j])))
						FieldPut(FieldPos(aEstrut[j]),aSX6[i,j])
					EndIf
				Next j
				
				dbCommit()
				MsUnLock()
				cTexto += "Incluido o parametro " + aSX6[i,2] + Chr(13) + Chr(10)
			Else
				cTexto += "O parametro " + aSX6[i,2] + " ja existe e nao foi alterado." + Chr(13) + Chr(10)
			EndIf
			
		EndIf
	Next i
	
	cTexto := 'Incluidos novos parametros. Verifique as suas configuracoes e funcionalidades : '+ Chr(13) + Chr(10) + cTexto + Chr(13) + Chr(10)
	
Return cTexto
