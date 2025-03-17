/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Simulação de Cálculo de Frete usando as regras do TotvsGFE ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
#Include "Protheus.ch"
#Include "TOTVS.CH"
#Include "RwMake.ch"
#Include "TopConn.CH"

//Constantes
#Define STR_PULA    Chr(13)+Chr(10)

User Function GFE_DAI()
	Local bBtnOK := { || GFE_Proc() }
	Local nxOpc  := 0
	Local nAux   := 0
	Local cAux   := ""
	Local cCodVeicC  := Space(TamSX3("DA3_DESC"  )[1])
	Local c_ClsFrt := ""
	Local a_RetPer := {}
	Local aPergs := {}

	Private cTRBCCF, cTRBITE, cTRBTRE, cTRBTCF, cTRBUNC, cTRBGRU, cTRBDOC, cTRBAGRU, cTRBSIM    //variaveis utilizadas na rotina de calculo de frete
	Private cArqCCF, cArqITE, cArqTRE, cArqTCF, cArqUNC, cArqGRU, cArqDOC, cArqAGR,  cArqSIM    //variaveis utilizadas na rotina de calculo de frete

	Private oDlgGfe
	//Private cTpVeic   := Space(TamSX3("GV3_CDTPVC")[1])
	Private cCodVeic    := DAK->DAK_CAMINH
	Private nKM         := 0 //DAK->DAK_X_KM
	Private cRedesp1    := " " //DAK->DAK_X_CRD1  //Space( TamSX3("GU7_NRCID" )[1])
	Private cRedesp2    := " " //DAK->DAK_X_CRD2  //Space( TamSX3("GU7_NRCID" )[1])
	Private cRedesp3    := " " //DAK->DAK_X_CRD3  //Space( TamSX3("GU7_NRCID" )[1])
	Private cRedesp4    := " " //DAK->DAK_X_CRD4  //Space( TamSX3("GU7_NRCID" )[1])
	Private cRedesp5    := " " //DAK->DAK_X_CRD5  //Space( TamSX3("GU7_NRCID" )[1])
	Private cDAK_X_COND := " " //DAK->DAK_X_COND
	Private cDAK_MOTORI := DAK->DAK_MOTORI
	Private nDAK_X_VPED := 0 //DAK->DAK_X_VPED
	Private nDAK_X_RPA  := 0 //DAK->DAK_X_RPA
	Private nDAK_X_PENV := 0 //DAK->DAK_X_PENV  // Pallet's Enviados

	Private cRedesp1C  := Space(TamSX3("GU7_NMCID" )[1])
	Private cRedesp1E  := Space(TamSX3("GU7_CDUF"  )[1])
	Private cRedesp2C  := Space(TamSX3("GU7_NMCID" )[1])
	Private cRedesp2E  := Space(TamSX3("GU7_CDUF"  )[1])
	Private cRedesp3C  := Space(TamSX3("GU7_NMCID" )[1])
	Private cRedesp3E  := Space(TamSX3("GU7_CDUF"  )[1])
	Private cRedesp4C  := Space(TamSX3("GU7_NMCID" )[1])
	Private cRedesp4E  := Space(TamSX3("GU7_CDUF"  )[1])
	Private cRedesp5C  := Space(TamSX3("GU7_NMCID" )[1])
	Private cRedesp5E  := Space(TamSX3("GU7_CDUF"  )[1])

	Private aRedesp  := {}

	Private oTbNeg
	Private lxTbNeg  := .F.
	Private lTabTemp := .T.

	// Variáveis Públicas do GFE - Usados na exibição do Log
	Private aAgrFrt  := {}
	Private aDocCarg := {}
	Private aTrchDoc := {}
	Private aItDoc   := {}
	Private aDocCar2
	Private aTRBCCF1 := {} // Indice 1
	Private aTRBCCF2 := {} // Indice 2
	Private aTRBCCF3 := {} // Indice 3
	Private aTRBTRE1 := {} // Indice 1
	Private aTRBTRE2 := {} // Indice 2
	Private aTRBTRE3 := {} // Indice 3
	Private aTRBTRE4 := {} // Indice 4
	Private aTrbUnc2 := {}
	Private idpCCF   := 1 // posição do array cTRBCCF
	Private idxCCF   := 1 // Indice  da array cTRBCCF
	Private idpDOC   := 1 // posição do array de Documentos de carga cTRBDOC
	Private idxDOC   := 1 // Indice da array de Documentos de carga cTRBDOC
	Private idpGRU   := 1 // Posição do array de agrupamento cTRBAGRU
	Private idxGRU   := 1 // Indice da array de agrupamento cTRBAGRU
	Private idpTRE   := 1 // posição do array cTRBTRE
	Private idxTRE   := 1 // Indice  da array cTRBTRE
	Private idpUNC   := 1 // posição do array cTRBUNC
	Private idxUNC   := 1 // Indice  da array cTRBUNC


	DbSelectArea("GWN")
	DbSetOrder(1)
	DbSeek(FWxFilial("GWN") + DAK->DAK_COD + DAK->DAK_SEQCAR)

	c_ClsFrt := GWN->GWN_CDCLFR

	aAdd( aPergs ,{1,"Class Frt: "	,c_ClsFrt,"@!",'NAOVAZIO()',"GUB",'.T.',10,.F.})


	If ! ParamBox(aPergs ,"Parametros ",@a_RetPer)      
		Return    
	EndIf

	RecLock("GWN",.F.)

	Replace GWN_CDCLFR	With a_RetPer[1]
	
	GWN->(MsUnLock())


	If !Empty( cCodVeic )
		GFE_CodVeic(@cCodVeicC)
	EndIf
	For nAux := 1 to 5
		cAux := "cRedesp" + AllTrim(Str(nAux,1))
		If Empty( &cAux ) == .F.
			GU7->( dbSetOrder(1) )
			If GU7->( dbSeek( xFilial("GU7") + &cAux ) )
				cAux := "cRedesp" + AllTrim(Str(nAux,1)) + "C"
				&cAux := GU7->GU7_NMCID

				cAux := "cRedesp" + AllTrim(Str(nAux,1)) + "E"
				&cAux := GU7->GU7_CDUF
			EndIf
		EndIf
	Next

	//	DEFINE MSDIALOG oDlgGfe TITLE "Simular Carga no GFE" FROM 0,0 TO 340,538 PIXEL
	//
	//	@ 002, 010 Say "Pedidos da Carga: " + DAK->DAK_COD + "/" + DAK->DAK_SEQCAR Of oDlgGfe PIXEL
	//
	//	@ 012, 010 Say "Veículo 1º Trecho:" Of oDlgGfe PIXEL
	//	@ 010, 070 Get cCodVeic   Picture "@!" F3 "DA3" Size 040,08 Valid GFE_CodVeic(@cCodVeicC) When .F.
	//	@ 010, 115 Get cCodVeicC  Size 100,13 When .F.
	//
	//	@ 002, 220 Say "KMs" Of oDlgGfe PIXEL
	//	@ 010, 220 Get nKM        Picture "@E 999,999.99" Size 040,08  When .F. Of oDlgGfe PIXEL Valid nKM >= 0 MESSAGE "Percurso em Kilometros"
	//
	//	@ 025, 005 To 109,265 Of oDlgGfe PIXEL
	//
	//	@ 028, 070 Say "Cód. Cidade" Of oDlgGfe PIXEL
	//	@ 028, 115 Say "Nome Cidade" Of oDlgGfe PIXEL
	//	@ 028, 220 Say "UF" Of oDlgGfe PIXEL
	//
	//	@ 037, 010 Say "Cidade Redespacho 1:" Of oDlgGfe PIXEL
	//	@ 035, 070 Get cRedesp1   Picture "@!" F3 "GU7" Size 040,08  When .F. Valid Empty(cRedesp1) .Or. GFEExistC("GU7", 1, cRedesp1, "GU7->GU7_SIT == '1'")
	//	@ 035, 115 Get cRedesp1C  Size 100,13 When .F.
	//	@ 035, 220 Get cRedesp1E  Size 040,13 When .F.
	//
	//	@ 052, 010 Say "Cidade Redespacho 2:" Of oDlgGfe PIXEL
	//	@ 050, 070 Get cRedesp2   Picture "@!" F3 "GU7" Size 040,08 Valid Empty(cRedesp2) .Or. GFEExistC("GU7", 1, cRedesp2, "GU7->GU7_SIT == '1'") When !Empty(cRedesp1) 
	//	@ 050, 115 Get cRedesp2C  Size 100,13 When .F.
	//	@ 050, 220 Get cRedesp2E  Size 040,13 When .F.
	//
	//	@ 067, 010 Say "Cidade Redespacho 3:" Of oDlgGfe PIXEL
	//	@ 065, 070 Get cRedesp3   Picture "@!" F3 "GU7" Size 040,08 Valid Empty(cRedesp3) .Or. GFEExistC("GU7", 1, cRedesp3, "GU7->GU7_SIT == '1'") When !Empty(cRedesp2) 
	//	@ 065, 115 Get cRedesp3C  Size 100,13 When .F.
	//	@ 065, 220 Get cRedesp3E  Size 040,13 When .F.
	//
	//	@ 082, 010 Say "Cidade Redespacho 4:" Of oDlgGfe PIXEL
	//	@ 080, 070 Get cRedesp4   Picture "@!" F3 "GU7" Size 040,08 Valid Empty(cRedesp4) .Or. GFEExistC("GU7", 1, cRedesp4, "GU7->GU7_SIT == '1'") When !Empty(cRedesp3) 
	//	@ 080, 115 Get cRedesp4C  Size 100,13 When .F.
	//	@ 080, 220 Get cRedesp4E  Size 040,13 When .F.
	//
	//	@ 097, 010 Say "Cidade Redespacho 5:" Of oDlgGfe PIXEL
	//	@ 095, 070 Get cRedesp5   Picture "@!" F3 "GU7" Size 040,08 Valid Empty(cRedesp5) .Or. GFEExistC("GU7", 1, cRedesp5, "GU7->GU7_SIT == '1'") When !Empty(cRedesp4) 
	//	@ 095, 115 Get cRedesp5C  Size 100,13 When .F.
	//	@ 095, 220 Get cRedesp5E  Size 040,13 When .F.
	//
	//	@ 111, 005 To 145,265 Of oDlgGfe PIXEL
	//	@ 117, 010 Say "Motorista:" Of oDlgGfe PIXEL
	//	@ 115, 070 Get cDAK_MOTORI Picture "@!" F3 "DA4" Size 040,08  When .F.
	//
	//	@ 117, 115 Say "Vlr Motorista:" Of oDlgGfe PIXEL
	//	@ 115, 150 Get nDAK_X_RPA  Picture "@E 999,999,999.99" Size 040,08  When .F. Of oDlgGfe PIXEL Valid Empty(cDAK_MOTORI) = .F. .And. nDAK_X_RPA >= 0 READONLY Message "Valor do RPA será calculado automaticamente"  
	//
	//	@ 117, 195 Say "Pedágio:" Of oDlgGfe PIXEL
	//	@ 115, 220 Get nDAK_X_VPED Picture "@E 999,999,999.99" Size 040,08  When .F. Of oDlgGfe PIXEL Valid Empty(cDAK_MOTORI) = .F. .And. nDAK_X_VPED >= 0 Message "Valor do Vale Pedágio"  
	//
	//	@ 132, 010 Say "Condição de Pagamento:" Of oDlgGfe PIXEL
	//	@ 130, 070 Get cDAK_X_COND Picture "@!" F3 "SE4" Size 040,08 When .F.
	//
	//	@ 132, 115 Say "Pallet's:" Of oDlgGfe PIXEL
	//	@ 130, 150 Get nDAK_X_PENV Picture "@E 999" Size 040,08  When .F. Of oDlgGfe PIXEL Valid nDAK_X_PENV >= 0 Message "Quantidade de Pallet's enviados"  
	//
	//	@ 150, 010 CHECKBOX "Aceitar Tabelas em Negociação" VAR lxTbNeg OBJECT oTbNeg
	//
	//	@ 150, 155 Button OemToAnsi("_Simular") Size 50,16 Action EVal( { || nxOpc := 1, Close(oDlgGfe) } )
	//	@ 150, 210 Button OemToAnsi("_Cancelar") Size 50,16 Action EVal( { || nxOpc := 0, Close(oDlgGfe) } )
	//
	//	ACTIVATE MSDIALOG oDlgGfe

	nxOpc := 1

	If nxOpc == 1
		For nAux := 1 to 5
			If !Empty( &( "cRedesp" + Str(nAux,1) ) )
				aadd( aRedesp, &( "cRedesp" + Str(nAux,1) ) )
			EndIf
		Next 
		EVal( bBtnOK )
	EndIf

	If Type("cTRBAGRU") == "C" .And. !Empty(cTRBAGRU)
		//Deletar as tabelas usadas na rotina do calculo de frete
		GFEDelTab(cTRBCCF)
		GFEDelTab(cTRBITE)
		GFEDelTab(cTRBTRE)
		GFEDelTab(cTRBTCF)
		GFEDelTab(cTRBUNC)
		GFEDelTab(cTRBGRU)
		GFEDelTab(cTRBDOC)
		GFEDelTab(cTRBAGRU)
		If !Empty(cTRBSIM)
			GFEDelTab(cTRBSIM)
		EndIf
	EndIf
Return

Static Function GFE_CodVeic(cCodVeicC)
	Local lRet := .T.

	If !Empty(cCodVeic)
		//lRet     := .T.
		cCodVeicC := Posicione("DA3",1,xFilial("DA3")+cCodVeic,"DA3_DESC")
	Endif
Return lRet

Static Function GFE_TpVeic(cTpVeicC)
	Local lRet := .T.

	If !Empty(cTpVeic)
		//lRet     := .T.
		cTpVeicC := Posicione("GV3",1,xFilial("GV3")+cTpVeic,"GV3_DSTPVC")
	Endif
Return lRet

Static Function GFE_PROC()
	Local aArea        := GetArea()
	Local aAreaDAI     := DAI->( GetArea() )
	Local aTMPs        := {}

	Private cxAliasPed := GetNextAlias()
	Private cxAliasFrt := GetNextAlias()
	Private cxAliasTra := GetNextAlias()
	Private cxAliasCmp := GetNextAlias()
	Private aFrete     := {}
	Private aLogProc   := {}
	Private aTransp    := {}
	Private nPedidos   := 0
	Private cxTraVenc  := ""

	aTMPs := CriarTMPs()
	//	If Empty( DAK->DAK_X_GFE )
	//		RecLock("DAK",.F.)
	//		DAK->DAK_X_GFE  := "C"
	//		DAK->( MsUnlock() )
	//	EndIf

	If .F. //Empty(cTpVeic) // Por Pedido
		Processa( { || GFE_DAIProc() }, "Preparando Simulação no GFE...", "Aguarde...", .F. )
	Else  // Por Carga
		Processa( { || GFE_DAKProc() }, "Preparando Simulação no GFE...", "Aguarde...", .F. )
	EndIf

	MostraFrt( aFrete )

	u_MatarTMPs(aTMPs)

	DAI->( RestArea(aAreaDAI) )
	RestArea(aArea)
Return

Static Function GFE_DAIProc()
	Local aRet        := {}
	Local nAux        := 0
	Local nPos        := 0
	Local nTotalPed   := 0  // Total da NF com Impostos
	Local aTotalItem  := {}
	Local cxAlias     := GetNextAlias()

	(cxAliasPed)->( dbSetOrder( 1 ) )
	(cxAliasFrt)->( dbSetOrder( 1 ) )

	DAI->( dbSetOrder(1) )
	DAI->( dbSeek( xFilial("DAI") + DAK->DAK_COD + DAK->DAK_SEQCAR ) )
	While !DAI->( Eof() ) .And. DAI->DAI_FILIAL = xFilial("DAI") ; 
	.And. DAI->DAI_COD = DAK->DAK_COD .And. DAI->DAI_SEQCAR = DAK->DAK_SEQCAR

		nAux++		
		DAI->( dbSkip() )
	End

	ProcRegua( nAux )

	BeginSQL Alias cxAlias
	SELECT ' '  AS TIPO, DAI.DAI_PEDIDO, DAI.DAI_SEQUEN
	FROM %table:DAI% DAI
	WHERE DAI.%NotDel%
	AND DAI.DAI_FILIAL = %xFilial:DAI%
	AND DAI.DAI_COD = %exp:DAK->DAK_COD%
	AND DAI.DAI_SEQCAR = %exp:DAK->DAK_SEQCAR%
	ORDER BY TIPO
	EndSQL 

	//DAI->( dbSetOrder(1) )
	//DAI->( dbSeek( xFilial("DAI") + DAK->DAK_COD + DAK->DAK_SEQCAR ) )
	//While !DAI->( Eof() ) .And. DAI->DAI_FILIAL = xFilial("DAI") ;
	//	.And. DAI->DAI_COD = DAK->DAK_COD .And. DAI->DAI_SEQCAR = DAK->DAK_SEQCAR
	While !(cxAlias)->( Eof() )

		DAI->( dbSetOrder(1) )
		DAI->( dbSeek( xFilial("DAI") + DAK->DAK_COD + DAK->DAK_SEQCAR + (cxAlias)->DAI_SEQUEN + (cxAlias)->DAI_PEDIDO ) )

		nPedidos++
		IncProc( "Pedido " + DAI->DAI_PEDIDO + " " + Alltrim(Str(nPedidos)) + "/" + Alltrim(Str(nAux)) )

		nTotalPed := GFE_TotPed( DAI->DAI_PEDIDO, @aTotalItem )

		SC5->( dbSetOrder(1) )
		SC5->( dbSeek( xFilial("SC5") + DAI->DAI_PEDIDO ) )

		RecLock(cxAliasPed,.T.)
		If SC5->C5_TPFRETE = "F"
			(cxAliasPed)->STATUS     := "F"
		Else
			(cxAliasPed)->STATUS     := " "
		EndIf
		(cxAliasPed)->TIPO       := (cxAlias)->TIPO
		(cxAliasPed)->DAI_SEQUEN := DAI->DAI_SEQUEN
		(cxAliasPed)->C5_NUM     := DAI->DAI_PEDIDO
		(cxAliasPed)->C5_CLIENTE := SC5->C5_CLIENTE
		(cxAliasPed)->C5_LOJACLI := SC5->C5_LOJACLI
		(cxAliasPed)->DAI_PESO   := DAI->DAI_PESO
		(cxAliasPed)->DAI_CAPVOL := DAI->DAI_CAPVOL
		(cxAliasPed)->TOTALPED   := nTotalPed
		If SC5->C5_TIPO $ "BD"
			SA2->( dbSetOrder(1) )
			If SA2->( dbSeek( xFilial("SA2") + SC5->C5_CLIENTE + SC5->C5_LOJACLI ) )
				(cxAliasPed)->A1_NOME := SA2->A2_NOME
				(cxAliasPed)->A1_EST  := SA2->A2_EST
			EndIf
		Else
			SA1->( dbSetOrder(1) )
			If SA1->( dbSeek( xFilial("SA1") + SC5->C5_CLIENTE + SC5->C5_LOJACLI ) )
				(cxAliasPed)->A1_NOME := SA1->A1_NOME
				(cxAliasPed)->A1_EST  := SA1->A1_EST
			EndIf
		EndIf		
		(cxAliasPed)->( MsUnlock() )

		If (cxAliasPed)->STATUS = "F"
			aRet := { .F., "Pedido FOB" }
		Else
			aRet := GFE_Pedido(aRedesp)
			If (aRet[1])
				RecLock(cxAliasPed,.F.)
				(cxAliasPed)->STATUS := "S"
				(cxAliasPed)->( MsUnlock() )
			Endif
		EndIf
		aadd( aLogProc, { DAI->DAI_PEDIDO, aRet[2], aRet[3] } )

		(cxAlias)->( dbSkip() )
	End
	(cxAlias)->( dbCloseArea() )

	GFE_FimCalc()
Return

Static Function GFE_FimCalc()	
	Local cxCpoTra    := ""
	Local cxCpoVal    := ""
	Local cxCpoSeq    := ""
	Local cxCpoMun    := ""
	Local nxTotal     := 0
	Local aAgrup      := {}
	Local cAux        := ""
	Local nPos        := 0
	Local cLastPed    := ""
	Local nVLRRPA     := 0
	Local nPerICM     := 0
	Local nMV_X_MLLOG := 0 //SuperGetMV( "MV_X_MLLOG", .F., 0.00 ) // Percentual da Margem de Lucro
	Local cMV_ALIQFRE := SuperGetMV( "MV_ALIQFRE", .F., "" ) // Percentual de ICMS em Frete Autonomo
	Local aEstFre     := {}

	For nPos := 1 To Len( cMV_ALIQFRE ) Step 4
		cAux := SubStr( cMV_ALIQFRE, nPos, 4 )

		aadd( aEstFre, { Left(cAux,2), Val(Right(cAux,2) ) } )
	Next

	(cxAliasFrt)->( dbGoTop() )
	While !(cxAliasFrt)->( Eof() )

		(cxAliasPed)->( dbSeek( (cxAliasFrt)->C5_NUM ) )

		nPerICM := 0
		nPos    := aScan( aEstFre, { |aOpc| aOpc[1] == (cxAliasPed)->A1_EST } )
		If nPos > 0
			nPerICM := aEstFre[nPos,2]
		EndIf 

		RecLock(cxAliasPed,.F.)
		(cxAliasPed)->STATUS := "S"
		If (cxAliasFrt)->AGRUPADO == "S"
			(cxAliasPed)->AGRUPADO := "S"
		Endif

		cxCpoTra := "TRA" + (cxAliasFrt)->SEQ
		cxCpoVal := "VAL" + (cxAliasFrt)->SEQ
		cxCpoSeq := "SEQ" + (cxAliasFrt)->SEQ
		cxCpoMun := "MUN" + (cxAliasFrt)->SEQ
		If (cxAliasPed)->&( cxCpoVal ) = 0 .Or. (cxAliasPed)->&( cxCpoVal ) > (cxAliasFrt)->VLRFRETE 
			(cxAliasPed)->&( cxCpoTra ) := (cxAliasFrt)->CDTRP
			(cxAliasPed)->&( cxCpoSeq ) := (cxAliasFrt)->A4_COD
			//If (cxAliasFrt)->AGRUPADO != "S"
			(cxAliasPed)->&( cxCpoVal ) := (cxAliasFrt)->VLRFRETE
			//EndIf
			(cxAliasPed)->&( cxCpoMun ) := (cxAliasFrt)->ORIGEM
		EndIf
		(cxAliasPed)->( MsUnlock() )

		/*
		If (cxAliasPed)->VLRFRETE = 0 .Or. (cxAliasPed)->VLRFRETE > (cxAliasFrt)->VLRFRETE
		RecLock(cxAliasPed,.F.)
		(cxAliasPed)->A4_COD   := (cxAliasFrt)->A4_COD
		(cxAliasPed)->VLRFRETE := (cxAliasFrt)->VLRFRETE
		(cxAliasPed)->( MsUnlock() )
		EndIf
		*/

		If (cxAliasTra)->( dbSeek( (cxAliasFrt)->A4_COD + (cxAliasFrt)->SEQ ) )
			RecLock(cxAliasTra,.F.)
		Else
			RecLock(cxAliasTra,.T.)
			(cxAliasTra)->SEQ      := (cxAliasFrt)->SEQ
			(cxAliasTra)->A4_COD   := (cxAliasFrt)->A4_COD
			(cxAliasTra)->A4_NOME  := (cxAliasFrt)->A4_NOME
			(cxAliasTra)->CDTRP    := (cxAliasFrt)->CDTRP
			(cxAliasTra)->ORIGEM   := (cxAliasFrt)->ORIGEM
			(cxAliasTra)->VLRFRETE := 0
		EndIf
		If (cxAliasFrt)->FRVIAGEM <> "S" .And. (cxAliasFrt)->FECHADA <> "S" //.Or. (cxAliasTra)->VLRFRETE == 0) 
			//(cxAliasTra)->VLRFRETE += (cxAliasFrt)->VLRFRETE
			(cxAliasTra)->VLRISS   += (cxAliasFrt)->VLISS
			//if (cxAliasFrt)->VLICMS <> 0
			(cxAliasTra)->VLRICMS  += (cxAliasFrt)->VLICMS
			//Else
			//	(cxAliasTra)->VLRICMS  += (cxAliasFrt)->VLRFRETE * nPerICM / 100
			//EndIf
			(cxAliasFrt)->VLPIS  := (cxAliasFrt)->VLPIS
			(cxAliasFrt)->VLCOFI := (cxAliasFrt)->VLCOFI
		EndIf
		If cLastPed <> ( (cxAliasFrt)->C5_NUM + (cxAliasFrt)->SEQ + (cxAliasFrt)->CDTRP )
			(cxAliasTra)->PEDIDOS  += 1
		EndIf
		(cxAliasTra)->( MsUnlock() )

		cLastPed := (cxAliasFrt)->C5_NUM + (cxAliasFrt)->SEQ + (cxAliasFrt)->CDTRP

		(cxAliasFrt)->( dbSkip() )
	End

	(cxAliasTra)->( dbGoTop() )
	While !(cxAliasTra)->( Eof() )

		// Primeiro Techo Bel Logística
		If (cxAliasTra)->SEQ == "01" .And. Left((cxAliasTra)->CDTRP,08) == "09379336"
			DA4->( dbSetOrder(1) )
			If DA4->( dbSeek( xFilial("DA4") + cDAK_MOTORI ) )
				If Len(Alltrim(DA4->DA4_CGC)) <= 11
					nTotRPA := (cxAliasTra)->VLRFRETE
					nTotRPA -= (cxAliasTra)->VLRICMS
					nTotRPA /= 1 + ( nMV_X_MLLOG / 100 )

					(cxAliasTra)->VLRRPA := nTotRPA 
				EndIf
			EndIf
		EndIf

		(cxAliasTra)->( dbSkip() )
	End
Return

Static Function GFE_DAKProc()
	Local aRet := {}

	aRet := GFE_Carga()
	aadd( aLogProc, { "CARGA", aRet[2], aRet[3] } )

	GFE_FimCalc()

Return

Static Function GFE_TotPed( c_Ped, aTotalItem )
	Local nTotal := 0
	//Local nTotIcm := 0
	//	Local _nValIcm := 0



	dbSelectArea("SC5")
	dbSetOrder(1)
	dbSeek(xFilial("SC5") + c_Ped)

	dbSelectArea("SC6")
	dbSetOrder(1)
	dbSeek(xFilial("SC6") + SC5->C5_NUM)

	MaFisIni(SC5->C5_CLIENTE,SC5->C5_LOJACLI,"C","N",SC5->C5_TIPOCLI,MaFisRelImp("MTR700",{"SC5","SC6"}),,,"SB1","MTR700")

	While !Eof() .And. SC6->C6_NUM ==SC5->C5_NUM
		// Calculo ST e Outros Impostos                      
		MaFisAdd(        SC6->C6_PRODUTO,;
		SC6->C6_TES,;
		SC6->C6_QTDVEN,;
		SC6->C6_PRCVEN,;
		SC6->C6_VALDESC,;
		"",;
		"",;
		0,;
		0,;
		0,;
		0,;
		0,;
		(SC6->C6_QTDVEN * SC6->C6_PRCVEN),;
		0,;
		0,;
		0)

		//		_nAliqIcm	:= MaFisRet(1,"IT_ALIQICM")
		//		_nValIcm	:= MaFisRet(1,"IT_VALICM" )
		//		_nBaseIcm	:= MaFisRet(1,"IT_BASEICM")
		//		_nValIpi	:= MaFisRet(1,"IT_VALIPI" )
		//		_nBaseIpi	:= MaFisRet(1,"IT_BASEICM")
		//		_nValMerc	:= MaFisRet(1,"IT_VALMERC")
		//		_nValSol	:= MaFisRet(1,"IT_VALSOL" )

		//		nTotSol += _nValSol
		//		nTotIcm += Round(_nValIcm,2) 

		//		If !Empty(_nValSol)
		//			_nValSol := Round(_nValSol/SC6->C6_QTDVEN,2)
		//		Endif

		DbSkip()
	EndDo

	//	nTotIcm := MaFisRet(,"NF_VALICM")
	nTotal := MaFisRet(,"NF_TOTAL")

	MaFisEnd()





Return nTotal

Static Function MostraFrt( aFrete )
	Local oDlgFrt
	Local aSize     := MsAdvSize()
	Local aObjetos  := {}
	Local nPos      := 0
	Local nVlrFrete := 0
	Local axTraVenc := {}
	Local nAux := 0

	Private oBrwPed
	Private oBrwFrt
	Private oBrwTra
	Private oLabelTotal

	(cxAliasPed)->( dbGoTop() )

	// Default:                    .T.   .T.   .F.
	//                Larg X Alt Y Dim X Dim Y, lPixel
	AADD( aObjetos, { 100   ,  10 , .T. , .F. ,  } )
	AADD( aObjetos, { 100   , 100 , .T. , .T. ,  } )
	AADD( aObjetos, { 100   ,  10 , .T. , .F. ,  } )
	AADD( aObjetos, { 200   , 200 , .T. , .T. ,  } )
	AADD( aObjetos, { 100   ,  10 , .T. , .F. ,  } )
	//         X           Y           X Size      Y Size      Sep X  Sep Y  X Borda Y Borda
	aInfo := { aSize[ 1 ], aSize[ 2 ], aSize[ 3 ], aSize[ 4 ], 0    , 0    , 3     , 3       }

	aPosObj := MsObjSize( aInfo, aObjetos )

	DEFINE MSDIALOG oDlgFrt TITLE "Resultado do Orçamento de Frete Realizado no GFE" FROM aSize[7],0 TO aSize[6],aSize[5] PIXEL

	@ aPosObj[1,1]+2, aPosObj[1,2] Say "Pedidos da Carga: " + DAK->DAK_COD + "/" + DAK->DAK_SEQCAR Of oDlgFrt PIXEL
	oBrwPed   := TBelBrowse():New( { aPosObj[2,1], aPosObj[2,2], aPosObj[2,4]/2-2, aPosObj[2,3] - aPosObj[2,1] }, cxAliasPed, oDlgFrt )
	oBrwPed:SetWidthMethod( .T. )
	oBrwPed:SetChangeLine( { || MudaFiltro() } )
	oBrwPed:SetDoubleClick( { || ConsPedido() } )
	oBrwPed:AddCampo( ""           ,,,,  8, "CENTER", { || BEGFE_PedCor() }, .F., .T. )
	oBrwPed:AddCampo( "C5_NUM"     ,,,,   ,,, .F. )
	oBrwPed:AddCampo( "C5_CLIENTE" ,,,,   ,,, .F. )
	oBrwPed:AddCampo( "C5_LOJACLI" ,,,,  2,,, .F. )
	oBrwPed:AddCampo( "A1_NOME"    ,,,, 20,,, .F. )
	oBrwPed:AddCampo( "TOTALPED"   , "TOTALPED" , "Vl Pedido", "@E 999,999,999.99", 8, "RIGHT",, .F. )
	oBrwPed:AddCampo( "DAI_PESO"   ,,,,  8,,, .F. )
	oBrwPed:AddCampo( "DAI_CAPVOL" ,, "M3"   ,,  6,,, .F. )
	oBrwPed:AddCampo( "EMITGFE"    ,, "Emit" ,,  1,,, .F. )
	oBrwPed:AddCampo( "AGRUPADO"   ,, "Agrup",,  1,,, .F. )

	//If u_PodeEditar( "000025" )
	//	For nAux := 1 to 6
	//		oBrwPed:AddCampo( "SEQ" + StrZero(nAux,2), "SEQ" + StrZero(nAux,2), "SEQ" + StrZero(nAux,2),,   ,,, .F. )
	//		oBrwPed:AddCampo( "VAL" + StrZero(nAux,2), "VAL" + StrZero(nAux,2), "VAL" + StrZero(nAux,2),,   ,,, .F. )
	//	Next
	//EndIf

	@ aPosObj[1,1]+2, aPosObj[2,4]/2+4 Say "Transportadoras por Trecho" Of oDlgFrt PIXEL
	oBrwTra   := TBelBrowse():New( { aPosObj[2,1], aPosObj[2,4]/2+4, aPosObj[2,4]/2, aPosObj[2,3] - aPosObj[2,1] }, cxAliasTra, oDlgFrt )
	oBrwTra:AddCampo( ""           ,,,,  8, "CENTER", { || BEGFE_TraCor() }, .F., .T. )
	oBrwTra:AddCampo( "SEQ"        , "SEQ"     , "Trecho"   ,, 22, "CENTER",, .F. )
	oBrwTra:AddCampo( "A4_COD"     ,,,,    ,,, .F. )
	oBrwTra:AddCampo( "A4_NOME"    ,,,, 100,,, .F. )
	oBrwTra:AddCampo( "VLRFRETE"   , "VLRFRETE", "Vlr Frete", "@E 999,999.99", 35,,, .F. )
	oBrwTra:AddCampo( "VLRRPA"     , "VLRRPA"  , "Vlr RPA"  , "@E 999,999.99", 35,,, .F. )
	//If u_PodeEditar( "000025" )
	oBrwTra:AddCampo( "VLRICMS" , "VLRICMS" , "Vlr ICMS" , "@E 999,999.99", 35,,, .F. )
	oBrwTra:AddCampo( "VLRISS"  , "VLRISS"  , "Vlr ISS"  , "@E 999,999.99", 35,,, .F. )
	//EndIf
	oBrwTra:AddCampo( "VLNEG" , "VLNEG" , "Vlr Triang" , "@E 999,999.99", 35,,, .F. )
	oBrwTra:AddCampo( "PEDIDOS"    , "PEDIDOS" , "Pedidos"  , "@E 999,999"   , 25,,, .F. )

	@ aPosObj[3,1]+2, aPosObj[3,2] Say "Transportadoras Orçadas para o Pedido Selecionado" Of oDlgFrt PIXEL
	oBrwFrt   := TBelBrowse():New( { aPosObj[4,1], aPosObj[4,2], aPosObj[4,4], aPosObj[4,3] - aPosObj[4,1] }, cxAliasFrt, oDlgFrt )
	oBrwFrt:SetWidthMethod( .T. )
	oBrwFrt:SetDoubleClick( { || ConsComp( (cxAliasFrt)->NRCALC ) } )
	oBrwFrt:AddCampo( ""           ,           ,               ,     ,  8, "CENTER", { || BEGFE_FrtCor() }, .F., .T. )
	oBrwFrt:AddCampo( "SEQ"        , "SEQ"     , "Trecho"      , ""  ,  2, "CENTER",, .F. )  // Sequencia de Trechos
	oBrwFrt:AddCampo( "A4_COD"     ,           ,               ,     ,   ,         ,, .F. )
	oBrwFrt:AddCampo( "A4_NOME"    ,           ,               ,     , 20,         ,, .F. )
	oBrwFrt:AddCampo( "DTPREN"     , "DTPREN"  , "Prev Entrega", ""  ,  8, "CENTER",, .F. )
	oBrwFrt:AddCampo( "VLRFRETE"   , "VLRFRETE", "Vlr Frete"   , "@E 999,999.99",  9, "RIGHT" ,, .F. )
	oBrwFrt:AddCampo( "ORIGEM"     , "ORIGEM"  , "Origem"      , ""  , TamSx3("GU3_NRCID")[1], "CENTER",, .F. )
	oBrwFrt:AddCampo( "DESTIN"     , "DESTIN"  , "Destino"     , ""  , TamSx3("GU3_NRCID")[1], "CENTER",, .F. )
	oBrwFrt:AddCampo( "NRCALC"     , "NRCALC"  , "NrCalc"      , ""  ,  6, "CENTER",, .F. )
	//oBrwFrt:AddCampo( "TIPO"       , "TIPO"    , "Tipo"        , ""  ,  1, "CENTER",, .F. ) // 1-Redespacho | 2-Primeiro Trecho
	oBrwFrt:AddCampo( "TPFRET"     , "TPFRET"  , "Tp. Frete"   , ""  ,  1, "CENTER",, .F. )
	oBrwFrt:AddCampo( "NRGRUP"     , "NRGRUP"  , "Nr. Agru"    , ""  ,  6, "CENTER",, .F. )
	oBrwFrt:AddCampo( "CDTRP"      , "CDTRP"   , "CDTrp"       , ""  , TamSX3("GU3_CDEMIT")[1], "CENTER",, .F. )
	oBrwFrt:AddCampo( "VLPIS"      , "VLPIS"   , "V. PIS"      , "@E 999,999.99"  ,  8, "RIGHT" ,, .F. )
	oBrwFrt:AddCampo( "VLCOFI"     , "VLCOFI"  , "V. Cofins"   , "@E 999,999.99"  ,  8, "RIGHT" ,, .F. )
	oBrwFrt:AddCampo( "VLISS"      , "VLISS"   , "V. ISS"      , "@E 999,999.99"  ,  8, "RIGHT" ,, .F. )
	oBrwFrt:AddCampo( "VLICMS"     , "VLICMS"  , "V. ICMS"     , "@E 999,999.99"  ,  8, "RIGHT" ,, .F. )
	//If u_PodeEditar( "000025" )
	//	oBrwFrt:AddCampo( "FRVIAGEM", "FRVIAGEM", "Frt Viagem"  ,     ,   ,         ,, .F. )
	//	oBrwFrt:AddCampo( "FECHADA" , "FECHADA" , "Cg Fechada"  ,     ,   ,         ,, .F. )
	//EndIf

	MudaFiltro()

	// Encontrando Transportadora vencedora por Trecho
	(cxAliasTra)->( dbGoTop() )
	While !(cxAliasTra)->( Eof() )
		nAux := aScan( axTraVenc, { |aOpc| aOpc[1] = (cxAliasTra)->SEQ } )

		If nAux <= 0
			aadd( axTraVenc, { (cxAliasTra)->SEQ, "", 0, 0 } )
			nAux := Len( axTraVenc )
		Endif

		nVlrFrete := axTraVenc[ nAux, 3 ]

		If ( nVlrFrete = 0 .Or. nVlrFrete > (cxAliasTra)->VLRFRETE ) .And. nPedidos = (cxAliasTra)->PEDIDOS
			axTraVenc[ nAux, 2 ] := (cxAliasTra)->A4_COD
			axTraVenc[ nAux, 3 ] := (cxAliasTra)->VLRFRETE
		EndIf

		(cxAliasTra)->( dbSkip() )
	End

	// Marcando Transportadora Vencedora por Trecho
	(cxAliasTra)->( dbGoTop() )
	While !(cxAliasTra)->( Eof() )
		If aScan( axTraVenc, { |aOpc| aOpc[1] = (cxAliasTra)->SEQ .And. aOpc[2] = (cxAliasTra)->A4_COD } ) > 0
			RecLock(cxAliasTra,.F.)
			(cxAliasTra)->TRA_VENC := "S"
			(cxAliasTra)->( MsUnlock() )
		EndIf

		(cxAliasTra)->( dbSkip() )
	End
	(cxAliasTra)->( dbGoTop() )

	@ aPosObj[5,1], aPosObj[5,2] Say "" Object oLabelTotal Size 200 COLOR CLR_GREEN

	BEGFE_Total()

	ACTIVATE MSDIALOG oDlgFrt ON INIT BEGFE_BAR(oDlgFrt, { || If( BEGFE_TudoOK(oDlgFrt), BEGFE_Gravar(oDlgFrt, nPos), .F. ) }, { || oDlgFrt:End() } )
Return

Static Function BEGFE_BAR(oDlg, bOK, bCancel )
	Local aButtons := {}

	aadd( aButtons, { 'TOTAIS' , { || BEGFE_TOT() }    , "Totais obtidos com cálculo do GFE", "Totais" } )
	//aadd( aButtons, { 'LOGGFE1', { || BEGFE_LOG(1) }    , "Log de Cálculo do GFE", "Log GFE" } )
	//aadd( aButtons, { 'LOGGFE2', { || BEGFE_LOG(2) }    , "Exportar Log de Cálculo do GFE", "Exp Log GFE" } )
	aadd( aButtons, { 'LEGENDA', { || BEGFE_LEGENDA() }, "Legenda dos browse's" , "Legenda" } )
	// TI
	//If u_PodeEditar("000025")
	//aadd( aButtons, { 'TOTAIS', { || BEGFE_ViewTMP() }, "Visualizar TMPs/Arrays" , "View TMPs/Arrays" } )
	//EndIf

Return (EnchoiceBar(oDlg,bOK,bCancel,,aButtons))

Static Function BEGFE_Log(nOpc)
	Local nAux     := 0
	Local cAux     := ""
	Local cNumPed  := (cxAliasPed)->C5_NUM
	Local cNomLog  := ""
	Local cNome    := ""
	Local cPathTMP := "c:\TMP"

	Default nOpc := 1

	// Variáveis para chamada da ShowErrLog
	Private lSaveLog   := .T.  // Indica se salva ou não o log (arquivo)
	Private lSimulacao := .T.  // Indica se é simulação ou não
	Private lCalcServ  := .F.
	Private lError     := .F.  // Indica se houve erro durante uma das etapas do processo de calculo
	Private aErroCalc  := {}   // Recebe o número do cálculo relacionado ao número do erro.
	Private aErroDoc   := {}

	For nAux := 1 to Len(aLogProc)
		If aLogProc[nAux,1] == cNumPed
			cAux := aLogProc[nAux,2]
		ElseIf aLogProc[nAux,1] == "CARGA"
			cNumPed   := "CARGA"
			cAux      := aLogProc[nAux,2]
			If Len(aLogProc[nAux,3]) >= 2
				cNomLog   := aLogProc[nAux,3,2]
			EndIf
			If Len(aLogProc[nAux,3]) >= 3
				aErroCalc := aLogProc[nAux,3,3]
			EndIf
			If Len(aLogProc[nAux,3]) >= 4
				aErroDoc  := aLogProc[nAux,3,4]
			EndIf
		EndIf
	Next
	If Empty(cNomLog)
		nOpc := 0
		cAux := "Não Há Log"
	EndIf

	If cNumPed <> "CARGA"
		ShowMemo( cAux, "Processamento do Pedido " + cNumPed )
	ElseIf nOpc == 1
		&("StaticCall( GFEXFUNB, ShowErrLog, cNomLog )")
	ElseIf nOpc == 2
		If CpyS2T( "\" + cNomLog, cPathTMP, .F. )
			shellExecute("Open", cPathTMP + "\" + RetFileName(cNomLog) + ".log", "", cPathTMP, 1)
		Else
			MsgStop( "Erro ao Copiar Log", "BEGFEA01" )
		EndIf
	EndIf
Return

Static Function BEGFE_SetTra( cSEQ, cCodTra, lPosTra )
	Local cxCpoVal := "VAL" + cSEQ				
	Local cxCpoSeq := "SEQ" + cSEQ				
	Local cxCpoMun := "MUN" + cSEQ				

	If lPosTra
		(cxAliasTra)->( dbSeek( cSEQ + cCodTra ) )
	EndIf

	(cxAliasPed)->( dbGoTop() )
	While !(cxAliasPed)->( Eof() )
		RecLock(cxAliasPed,.F.)
		(cxAliasPed)->&( cxCpoSeq ) := (cxAliasTra)->A4_COD
		(cxAliasPed)->&( cxCpoMun ) := (cxAliasTra)->ORIGEM
		//(cxAliasPed)->C5_TRANSP := (cxAliasTra)->A4_COD

		If (cxAliasFrt)->( dbSeek( (cxAliasPed)->C5_NUM + (cxAliasTra)->SEQ + (cxAliasTra)->CDTRP ) )						
			(cxAliasPed)->&( cxCpoVal ) := (cxAliasFrt)->VLRFRETE						
		Endif

		(cxAliasPed)->( MsUnlock() )

		(cxAliasPed)->( dbSkip() )
	End
Return

Static Function BEGFE_Tot()
	Private oxDlgTot
	Private oxBrwTra

	DEFINE MSDIALOG oxDlgTot TITLE "Transportadoras com cotação gerada pelo GFE" FROM 0,0 TO 300,500 PIXEL

	@ 2, 5 Say "Selecione a transportadora vencedora por trecho" Of oxDlgTot PIXEL
	oxBrwTra   := TBelBrowse():New( { 9, 5, 243, 120 }, cxAliasTra, oxDlgTot )
	oxBrwTra:SetDoubleClick( { || oxBrwTra:TrocaMarca("TRA_OK") } )
	oxBrwTra:AddCpoMark("TRA_OK")
	oxBrwTra:AddCampo( "SEQ"        , "SEQ"     , "Trecho"      ,     , 22,         ,, .F. )
	oxBrwTra:AddCampo( "A4_COD"     ,           ,               ,     ,   ,         ,, .F. )
	oxBrwTra:AddCampo( "A4_NOME"    ,           ,               ,     , 80,         ,, .F. )
	oxBrwTra:AddCampo( "VLRFRETE"   , "VLRFRETE", "Vlr Frete"   , "@E 999,999.99", 25, "RIGHT" ,, .F. )
	oxBrwTra:AddCampo( "PEDIDOS"    , "PEDIDOS" , "Pedidos"     , "@E 9999"      ,  6, "RIGHT" ,, .F. )

	(cxAliasTra)->( dbGoTop() )
	While !(cxAliasTra)->( Eof() )
		If (cxAliasTra)->TRA_VENC == "S"
			RecLock(cxAliasTra,.F.)
			(cxAliasTra)->TRA_OK := oxBrwTra:GetMarca()
			(cxAliasTra)->( MsUnlock() )
		EndIf

		(cxAliasTra)->( dbSkip() )
	End
	(cxAliasTra)->( dbGoTop() )

	@ 130, 5 Say "Pedidos na carga: " + Alltrim(Str(nPedidos)) Of oxDlgTot PIXEL

	@ 137,160 Button OemToAnsi("&Selecionar") Size 50,10 Action BEGFE_GrvTot() PIXEL
	@ 137,218 Button OemToAnsi("&Voltar") Size 30,10 Action oxDlgTot:End() PIXEL

	ACTIVATE MSDIALOG oxDlgTot
Return

Static Function BEGFE_GrvTot()
	Local lxOk      := .T.
	Local cxCpoVal  := ""
	Local cxCpoSeq  := ""
	Local cxCpoMun  := ""
	Local nAux      := 0
	Local axTraVenc := {}

	(cxAliasTra)->( dbGoTop() )
	While !(cxAliasTra)->( Eof() )
		If (cxAliasTra)->TRA_OK == oxBrwTra:GetMarca()
			If nPedidos != (cxAliasTra)->PEDIDOS
				lxOK := .F.
				MsgStop( "A Transportadora " + (cxAliasTra)->A4_NOME + " não atende todos os pedidos!", "BEGFE_GRVTOT" )
			Else
				If aScan( axTraVenc, { |aOpc| aOpc[1] = (cxAliasTra)->SEQ } ) > 0
					lxOk := .F.
				EndIf

				aadd( axTraVenc, { (cxAliasTra)->SEQ, (cxAliasTra)->A4_COD } )
			EndIf
		EndIf

		(cxAliasTra)->( dbSkip() )
	End

	For nAux := 1 to Len(aRedesp) + 1
		If aScan( axTraVenc, { |aOpc| aOpc[1] = StrZero(nAux,2) } ) = 0
			lxOk := .F.
		EndIf
	Next

	If lxOk
		(cxAliasFrt)->( dbClearFilter() )
		(cxAliasFrt)->( dbSetOrder( 1 ) )
		(cxAliasFrt)->( dbGoTop() )

		(cxAliasTra)->( dbGoTop() )
		While !(cxAliasTra)->( Eof() )

			cxCpoVal := "VAL" + (cxAliasTra)->SEQ				
			cxCpoSeq := "SEQ" + (cxAliasTra)->SEQ				
			cxCpoMun := "MUN" + (cxAliasTra)->SEQ				
			RecLock(cxAliasTra,.F.)
			If (cxAliasTra)->TRA_OK == oxBrwTra:GetMarca()
				(cxAliasTra)->TRA_VENC := "S"

				(cxAliasPed)->( dbGoTop() )
				While !(cxAliasPed)->( Eof() )
					RecLock(cxAliasPed,.F.)
					(cxAliasPed)->&( cxCpoSeq ) := (cxAliasTra)->A4_COD
					(cxAliasPed)->&( cxCpoMun ) := (cxAliasTra)->ORIGEM
					//(cxAliasPed)->C5_TRANSP := (cxAliasTra)->A4_COD

					If (cxAliasFrt)->( dbSeek( (cxAliasPed)->C5_NUM + (cxAliasTra)->SEQ + (cxAliasTra)->CDTRP ) )						
						(cxAliasPed)->&( cxCpoVal ) := (cxAliasFrt)->VLRFRETE						
					Endif

					(cxAliasPed)->( MsUnlock() )

					(cxAliasPed)->( dbSkip() )
				End
			Else
				(cxAliasTra)->TRA_VENC := "N"
			EndIf
			(cxAliasTra)->( MsUnlock() )

			(cxAliasTra)->( dbSkip() )
		End
		oxDlgTot:End()

		(cxAliasPed)->( dbGoTop() )

		(cxAliasFrt)->( dbSetOrder( 1 ) )
		(cxAliasFrt)->( dbGoTop() )

		MudaFiltro()
		BEGFE_Total()
		oBrwPed:BeRefresh()
	Else
		MsgStop("Você selecionou nenhum ou mais de 1 vencedor em cada trecho. Corrija, por favor.","Erro na Seleção")
	EndIf

	(cxAliasTra)->( dbGoTop() )
Return

Static Function BEGFE_Legenda()       
	Local aCores := {}

	aadd( aCores, { "BR_VERDE"   , "Pedido tem pelo menos 1 cotação de frete válida" } )
	aadd( aCores, { "BR_VERMELHO", "Nenhuma cotação de frete válida para o pedido" } )
	aadd( aCores, { "BR_BRANCO"  , "Cotação de frete vencedora" } )
	aadd( aCores, { "BR_PRETO"   , "Cotação de frete perdedora" } )
	aadd( aCores, { "BR_AZUL"    , "Codigo da transportadora é inválido no OMS" } )
	aadd( aCores, { "BR_AMARELO" , "Pedido agrupado com outro na mesma carga" } )

	BrwLegenda("Cotação de Frete GFE", "Legenda dos Browse's", aCores)
Return

Static Function BEGFE_PedCor()
	Local oCor

	If (cxAliasPed)->AGRUPADO == "S"
		oCor := LoadBitmap(GetResources(),'BR_AMARELO')
	ElseIf (cxAliasPed)->STATUS <> "S"
		oCor := LoadBitmap(GetResources(),'BR_VERMELHO')
	Else
		oCor := LoadBitmap(GetResources(),'BR_VERDE')
	EndIf

Return oCor

Static Function BEGFE_FrtCor()
	Local oCor     := LoadBitmap(GetResources(),'BR_AZUL')
	Local nAux     := 0
	Local cxCpoVal := ""
	Local cxCpoSeq := ""

	If !(cxAliasFrt)->( Eof() )
		cxCpoVal := "VAL" + (cxAliasFrt)->SEQ
		cxCpoSeq := "SEQ" + (cxAliasFrt)->SEQ
		If Empty( (cxAliasPed)->&( cxCpoSeq ) )
			oCor := LoadBitmap(GetResources(),'BR_AZUL')
		ElseIf (cxAliasFrt)->A4_COD = (cxAliasPed)->&( cxCpoSeq )
			oCor := LoadBitmap(GetResources(),'BR_BRANCO')
		Else
			oCor := LoadBitmap(GetResources(),'BR_PRETO')
		EndIf
	EndIf
Return oCor

Static Function BEGFE_Total()
	Local cTexto    := ""
	Local nValor    := 0
	Local lOK       := .T.
	Local axTraVenc := {}
	Local nAux      := 0

	(cxAliasTra)->( dbGoTop() )
	While !(cxAliasTra)->( Eof() )
		If (cxAliasTra)->TRA_VENC = "S"
			nValor += (cxAliasTra)->VLRFRETE
			If (cxAliasTra)->PEDIDOS <> nPedidos
				lOK := .F.
			EndIf

			aadd( axTraVenc, { (cxAliasTra)->SEQ } )
		EndIf

		(cxAliasTra)->( dbSkip() ) 
	End
	(cxAliasTra)->( dbGoTop() )

	For nAux := 1 to Len(aRedesp) + 1
		If aScan( axTraVenc, { |aOpc| aOpc[1] = StrZero(nAux,2) } ) = 0
			lxOK := .F.
		EndIf
	Next

	cTexto := "Valor Total do Frete " + Transform(nValor,"@E 999,999.99")
	oLabelTotal:SetText(cTexto)

	If lOK
		oLabelTotal:SetColor(CLR_GREEN)
	Else
		oLabelTotal:SetColor(CLR_RED)
	EndIf
Return

Static Function BEGFE_TraCor()
	Local oCor

	If (cxAliasTra)->TRA_VENC = "S"
		oCor := LoadBitmap(GetResources(),'BR_BRANCO')
	Else
		oCor := LoadBitmap(GetResources(),'BR_PRETO')
	EndIf

Return oCor

Static Function BEGFE_Gravar(oDlg, nPos)
	Local lRet        := .T.
	Local nAux        := 0
	Local aFrete      := {}
	Local lOK         := .T.
	Local cTransp     := ""
	Local cxRedesp1   := ""
	Local cxRedesp2   := ""
	Local cxRedesp3   := ""
	Local cxRedesp4   := ""
	Local cxRedesp5   := ""
	Local aFechada    := {}
	Local nFrete      := 0

	Local lIntGFE     := SuperGetMv("MV_INTGFE",,.F.)
	Local aFieldValue := {}
	Local aStruModel  := {}
	Local cBaseRat    := "M3"
	Local nBaseRat    := 0
	Local nDAK_CAPVOL := 0
	Local nDAK_PESO   := 0

	For nAux := 1 to Len( aRedesp ) + 1
		aadd( aFrete, 0 )
		aadd( aFechada, .F. )
	Next

	(cxAliasTra)->( dbGoTop() )
	While !(cxAliasTra)->( Eof() )

		If (cxAliasTra)->TRA_VENC = "S"
			cTransp := (cxAliasTra)->A4_COD

			BEGFE_SetTra( (cxAliasTra)->SEQ, (cxAliasTra)->A4_COD, .F. )
		EndIf

		(cxAliasTra)->( dbSkip() )
	End

	(cxAliasPed)->( dbSetOrder(1) )
	(cxAliasPed)->( dbGoTop() )
	While !(cxAliasPed)->( Eof() )
		For nAux := 1 to Len( aRedesp ) + 1
			If Empty( (cxAliasPed)->&( "SEQ" + StrZero(nAux,2) ) )
				lOK := .F.
			EndIf

			If (cxAliasTra)->( dbSeek( (cxAliasPed)->&( "SEQ" + StrZero(nAux,2) ) + StrZero(nAux,2) ) )
				aFrete[nAux] := (cxAliasTra)->VLRFRETE

				// Localizando Valor do RPA Calculado se a transportadora for a Bel Logística
				If nAux == 1 .And. (cxAliasTra)->VLRRPA <> 0
					nDAK_X_RPA := (cxAliasTra)->VLRRPA
				EndIf
			EndIf

			If (cxAliasFrt)->( dbSeek( (cxAliasPed)->C5_NUM + StrZero(nAux,2) + (cxAliasPed)->&( "TRA" + StrZero(nAux,2) ) ) )
				If (cxAliasFrt)->FECHADA == "S"
					aFechada[nAux] := .T.
				EndIf
			EndIf
		Next	

		(cxAliasPed)->( dbSkip() )
	End

	If DAK->DAK_FEZNF == "1"
		// Verificar STATUS do Romaneio e do Cálculo 
		GWN->( dbSetOrder(1) )
		If GWN->( dbSeek( xFilial("GWN") + DAK->DAK_COD + DAK->DAK_SEQCAR ) )
			If GWN->GWN_SIT <> "1" .Or. GWN->GWN_CALC == "1"
				lOK := .F.
			EndIf
		EndIf
		If lOK // Romaneio Bloqueado ou Não Calculado pode alterar
			MsgAlert( "Carga Já Faturada. Grave somente se tiver certeza...", "BEGFEA01" )
		Else
			MsgStop( "Carga Já Faturada. Gravação não será efetuada...", "BEGFEA01" )
		EndIf
	EndIf


	If lOK .And. MsgYesNo("Gravar os dados da transportadora " + cxTraVenc + " nos pedidos da carga?", "Confirmação?")

		Begin Transaction

			(cxAliasPed)->( dbGoTop() )

			(cxAliasFrt)->( dbClearFilter() )
			(cxAliasFrt)->( dbSetOrder( 1 ) )
			(cxAliasFrt)->( dbGoTop() )

			GU7->( dbSetOrder(1) )

			cTransp   := (cxAliasPed)->SEQ01
			cxRedesp1 := (cxAliasPed)->SEQ02
			cxRedesp2 := (cxAliasPed)->SEQ03
			cxRedesp3 := (cxAliasPed)->SEQ04
			cxRedesp4 := (cxAliasPed)->SEQ05
			cxRedesp5 := (cxAliasPed)->SEQ06

			SA4->( dbSetOrder(1) )
			SA4->( dbSeek( xFilial("SA4") + cTransp ) )

			// Totalizar M3 e Peso da carga
			nDAK_CAPVOL := 0
			nDAK_PESO   := 0
			DAI->( dbSetOrder(1) )
			DAI->( dbSeek( xFilial("DAI") + DAK->DAK_COD + DAK->DAK_SEQCAR, .T. ) )
			While !DAI->( Eof() ) .And. DAI->DAI_FILIAL = xFilial("DAI") ;
			.And. DAI->DAI_COD = DAK->DAK_COD .And. DAI->DAI_SEQCAR = DAK->DAK_SEQCAR

				nDAK_CAPVOL += DAI->DAI_CAPVOL
				nDAK_PESO   += DAI->DAI_PESO 

				DAI->( dbSkip() )
			End

			RecLock("DAK",.F.)
			//DAK->DAK_X_GFE  := "I"
			DAK->DAK_TRANSP := cTransp        // Transportadora 1º Trecho - Novo Campo
			//DAK->DAK_X_TRA1 := cTransp        // Transportadora 1º Trecho
			//			For nAux := 1 to 5
			//				If nAux <= Len( aRedesp )
			//					DAK->&( "DAK_X_CRD" + Alltrim(Str(nAux)) ) := aRedesp[nAux]
			//				Else
			//					DAK->&( "DAK_X_CRD" + Alltrim(Str(nAux)) ) := ""
			//				EndIf
			//			Next 
			DAK->DAK_CAMINH := cCodVeic
			//			DAK->DAK_X_COND := cDAK_X_COND
			DAK->DAK_MOTORI := cDAK_MOTORI
			//			DAK->DAK_X_KM   := nKM 
			DAK->DAK_CAPVOL := nDAK_CAPVOL
			DAK->DAK_PESO   := nDAK_PESO
			//			DAK->DAK_X_MG   := SuperGetMV( "MV_X_MLLOG", .F., 0.00 )

			// Limpar Valores Anteriores
			//			DAK->DAK_X_VR1  := 0
			//			DAK->DAK_X_VR2  := 0
			//			DAK->DAK_X_VR3  := 0
			//			DAK->DAK_X_VR4  := 0
			//			DAK->DAK_X_VR5  := 0

			// Gravar Novos Valores
			//			For nAux := 1 To Len( aFrete )
			//				If nAux == 1
			//					DAK->DAK_X_VPAG := aFrete[nAux]  // Valor do Frete do 1º Trecho
			//				Else
			//					DAK->&( "DAK_X_VR" + AllTrim(Str(nAux-1)) ) := aFrete[nAux]
			//				EndIf
			//			Next
			//			DAK->DAK_X_VPED := nDAK_X_VPED   // Valor do Pedágio Pago ao Transportador/Motorista
			//			DAK->DAK_X_PENV := nDAK_X_PENV   // Quantidade de Pallet's Enviados
			//			DAK->DAK_X_RPA  := nDAK_X_RPA    // Valor Pago ao Transportador/Motorista
			DAK->( MsUnlock() )

			DAI->( dbSeek( xFilial("DAI") + DAK->DAK_COD + DAK->DAK_SEQCAR, .T. ) )
			While !DAI->( Eof() ) .And. DAI->DAI_FILIAL = xFilial("DAI") ;
			.And. DAI->DAI_COD = DAK->DAK_COD .And. DAI->DAI_SEQCAR = DAK->DAK_SEQCAR

				SC5->( dbSetOrder(1) )
				SC5->( dbSeek( xFilial("SC5") + DAI->DAI_PEDIDO ) )
				RecLock("SC5",.F.)
				SC5->C5_TRANSP  := cTransp
				SC5->C5_REDESP  := cxRedesp1
				//				SC5->C5_REDESP2 := cxRedesp2
				//				SC5->C5_REDESP3 := cxRedesp3
				//				SC5->C5_REDESP4 := cxRedesp4
				//				SC5->C5_REDESP5 := cxRedesp5

				For nAux := 2 To 6
					If !Empty( (cxAliasPed)->&( "SEQ" + StrZero(nAux,2) ) )
						//If GU7->( dbSeek( xFilial("GU7") + aRedesp[nAux] ) )
						If GU7->( dbSeek( xFilial("GU7") + (cxAliasPed)->&( "MUN" + StrZero(nAux,2) ) ) )
							SC5->&( "C5_TFRDP"  + Str(nAux-1,1) ) := "C"
							SC5->&( "C5_ESTRDP" + Str(nAux-1,1) ) := GU7->GU7_CDUF
							SC5->&( "C5_CMURDP" + Str(nAux-1,1) ) := Right(GU7->GU7_NRCID,5)
						EndIf
					EndIf
				Next
				SC5->( MsUnlock() )

				If (cxAliasPed)->( dbSeek( DAI->DAI_PEDIDO ) )

					If cBaseRat = "M3"
						nBaseRat := DAI->DAI_CAPVOL / nDAK_CAPVOL
					Else
						nBaseRat := DAI->DAI_PESO / nDAK_PESO 
					EndIf

					RecLock("DAI",.F.)
					DAI->DAI_VALFRE := 0
					//					DAI->DAI_X_VR1  := 0
					//					DAI->DAI_X_VR2  := 0
					//					DAI->DAI_X_VR3  := 0
					//					DAI->DAI_X_VR4  := 0
					//					DAI->DAI_X_VR5  := 0
					//					DAI->DAI_X_RPA  := nBaseRat * nDAK_X_RPA
					//					DAI->DAI_X_VPED := nBaseRat * nDAK_X_VPED

					//If (cxAliasPed)->AGRUPADO <> "S"
					For nAux := 1 to Len(aRedesp)+1
						If nAux == 1	
							If aFechada[nAux]
								DAI->DAI_VALFRE += nBaseRat * (cxAliasPed)->&( "VAL" + StrZero(nAux,2) )
							ElseIf (cxAliasPed)->AGRUPADO <> "S"
								DAI->DAI_VALFRE += (cxAliasPed)->&( "VAL" + StrZero(nAux,2) )
							EndIf
						Else
							//							If aFechada[nAux]
							//								DAI->&( "DAI_X_VR" + AllTrim(Str(nAux-1)) ) := nBaseRat * (cxAliasPed)->&( "VAL" + StrZero(nAux,2) )
							//							ElseIf (cxAliasPed)->AGRUPADO <> "S"
							//								DAI->&( "DAI_X_VR" + AllTrim(Str(nAux-1)) ) := (cxAliasPed)->&( "VAL" + StrZero(nAux,2) )
							//							EndIf
						EndIf
					Next
					//EndIf
					DAI->( MsUnlock() )

					nFrete := 0
					For nAux := 1 to Len(aRedesp)+1
						If aFechada[nAux]
							nFrete += nBaseRat * (cxAliasPed)->&( "VAL" + StrZero(nAux,2) )
						Else
							nFrete += (cxAliasPed)->&( "VAL" + StrZero(nAux,2) )
						EndIf
					Next

					// No pedido armazenar todo o valor
					If Empty( DAI->DAI_NFISCA ) == .F.
						SF2->( dbSetOrder(1) )
						If SF2->( dbSeek( xFilial("SF2") + DAI->DAI_NFISCA + DAI->DAI_SERIE ) )

							//							RecLock("SF2",.F.)
							//							SF2->F2_X_FRETT := nFrete
							//							SF2->( MsUnlock() )

							SD2->( dbSetOrder(3) )
							SD2->( dbSeek( xFilial("SD2") + SF2->F2_DOC + SF2->F2_SERIE ) )
							While !SD2->( Eof() ) .And. SD2->D2_FILIAL = xFilial("SD2") .And. ;
							SD2->D2_DOC = SF2->F2_DOC .And. SD2->D2_SERIE = SF2->F2_SERIE

								//								RecLock("SD2",.F.)
								//								SD2->D2_X_FRETE := Round( SD2->D2_TOTAL / SF2->F2_VALMERC * nFrete, 2 )
								//								SD2->( MsUnlock() )

								SD2->( dbSkip() )
							End  
						EndIf
					EndIf
				EndIf

				// Chama a Integração Padrão TOTVS

				//				If lIntGFE .And. FindFunction("MaEnvEAI")
				//				cCgcTransp := SA4->A4_CGC
				//
				//				If !Empty(cTransp)
				//				aFieldValue := { { "DAK_CDTPOP", { || SuperGetMv("MV_CDTPOP",.F.,"")} },;
				//				{ "DAK_CGCTRA", { || cCGCTransp                    } } }
				//
				//				Aadd(aStruModel, { "DAK", "OMSA200_DAK", NIL, NIL, NIL, aFieldValue } )
				//				MaEnvEAI(,,4,"OMSA200",aStruModel)
				//				EndIf
				//				ElseIf FindFunction("MaEnvEAI")
				//				Aadd(aStruModel, { "DAK", "OMSA200_DAK", NIL, NIL, NIL, aFieldValue } )
				//				MaEnvEAI(,,4,"OMSA200",aStruModel)
				//				EndIf	
				//				

				// Integrar com o SigaGFE -> Tabela GWN
				GWN->( dbSetOrder(1) )
				If GWN->( dbSeek( xFilial("GWN") + DAK->DAK_COD + DAK->DAK_SEQCAR ) )
					RecLock("GWN",.F.)
					GWN->GWN_CDTRP  := SA4->A4_CGC
					GWN->GWN_DISTAN := nKM
					GWN->( MsUnlock() )

					// Chama a Rotina de Integração Via ModelDef
					u_DAK_GFE( 4, .T. )
				EndIf

				DAI->( dbSkip() )
			End
			//			RecLock("DAK",.F.)
			//			DAK->DAK_X_GFE  := "S"
			//			DAK->( MsUnlock() )

		End Transaction

		oDlg:End()
	EndIf
Return lRet

Static Function BEGFE_TudoOK(oDlg)
	Local lRet := .T.

Return lRet

Static Function MudaFiltro()

	(cxAliasFrt)->( dbClearFilter() )
	(cxAliasFrt)->( dbSetFilter( &( "{ || (cxAliasFrt)->C5_NUM = '" + (cxAliasPed)->C5_NUM + "' }" ), "(cxAliasFrt)->C5_NUM = '" + (cxAliasPed)->C5_NUM + "'" ) )
	(cxAliasFrt)->( dbGoTop() )

	If oBrwFrt != Nil
		oBrwFrt:BeRefresh()
	EndIf
Return

Static Function BeGFE_ViewTMP()
	While lTabTemp //.And. MsgYesNo("Exibir Tabelas?")
		(cTRBDOC)->( dbGoTop() )
		(cTRBAGRU)->( dbGoTop() )
		(cTRBTCF)->( dbGoTop() )
		(cTRBUNC)->( dbGoTop() )
		(cTRBTRE)->( dbGoTop() )
		(cTRBITE)->( dbGoTop() )
		(cTRBCCF)->( dbGoTop() )
		// Descriçao dos TMPs em GFEXFUNB.prw
		//u_dbEdit( cTRBAGRU )
		u_dbEdit( cTRBDOC , "cTRBDOC"  )
		//u_dbEdit( cTRBGRU )
		u_dbEdit( cTRBAGRU, "cTRBAGRU" )
		u_dbEdit( cTRBTCF , "cTRBTCF"  )
		u_dbEdit( cTRBUNC , "cTRBUNC"  )
		u_dbEdit( cTRBTRE , "cTRBTRE"  )
		u_dbEdit( cTRBITE , "cTRBITE"  )
		u_dbEdit( cTRBCCF , "cTRBCCF"  )

		If MsgYesNo( "Reexibir?" ) == .F.
			Exit
		EndIf
	End
Return 

Static Function ConsComp( cNRCalc )
	Local aArea := GetArea()
	Local oDlgBrw
	Local oBrowse
	Local nAux    := 0

	(cxAliasCmp)->( dbSetFilter( &( "{ || (cxAliasCmp)->NRCALC = '" + cNRCalc + "' }" ), "(cxAliasCmp)->NRCALC = '" + cNRCalc + "'" ) )
	(cxAliasCmp)->( dbGoTop() )

	DEFINE MSDIALOG oDlgBrw TITLE "Componentes do Cálculo" FROM 0,0 TO 400,800 PIXEL

	oBrowse := TBelBrowse():New( { 2, 2, 399, 175 }, cxAliasCmp, oDlgBrw )
	oBrowse:AddCampo( "CDCOMP",,"Componente",                 , 20,,, .F. )
	oBrowse:AddCampo( "DSCOMP",,"Descrição" ,                 , 40,,, .F. )
	oBrowse:AddCampo( "QTDE"  ,,"Quantidade", "@E 999,999.999", 11,,, .F. )
	oBrowse:AddCampo( "VALOR" ,,"Valor"     , "@E 999,999.99" , 10,,, .F. )

	@ 180, 345 BUTTON "Voltar" SIZE 50, 15 ACTION oDlgBrw:End() OF oDlgBrw PIXEL

	ACTIVATE MSDIALOG oDlgBrw 

	(cxAliasCmp)->( dbClearFilter() )

	RestArea(aArea)	
Return

Static Function ConsPedido()
	Local aArea := GetArea()

	dbSelectArea("SC5")
	dbSetOrder(1)
	dbSeek( xFilial("SC5") + (cxAliasPed)->C5_NUM )

	A410Visual("SC5", Recno(), 2)

	RestArea(aArea)	
Return

Static Function GFE_Carga()
	Local aAuxAgrFrt   := {}
	Local aAuxDocCarg  := {}
	Local aAuxTrchDoc  := {}
	Local aAuxItDoc    := {}

	//Local aAgrFrt      := {}
	//Local aDocCarg     := {}
	//Local aTrchDoc     := {}
	//Local aItDoc       := {}

	Local aRet         := { .F., "" }
	//Local aFrete       := {}
	Local aAuxFrete    := {}
	Local cTxtLog      := ""
	Local aGrupos      := {}

	Local nRegua       := 0
	Local cAgrup       := DAK->DAK_COD + DAK->DAK_SEQCAR
	Local cCdClFr      := Posicione("GWN", 1, xFilial("GWN") + DAK->DAK_COD + DAK->DAK_SEQCAR, "GWN_CDCLFR") //"    " //-- simulacao de frete: considerar todas a negociacoes cadastradas no GFE.
	Local cTpOp        := "GERAL"    //-- simulacao de frete: considerar todas a negociacoes cadastradas no GFE.
	Local cTpDoc       := "NF   "
	Local cSerie       := "TST"
	Local nTotCarga    := 0
	Local nTotFrete    := 0
	Local nTotRPA      := 0
	Local lFrViagem    := .F.

	Local nAux         := 0
	Local cAux         := ""

	Local nM3          := 0

	Local cxAlias      := GetNextAlias()
	Local cxAliasDAI   := GetNextAlias()
	Local cxAliasAux   := GetNextAlias()
	Local cTpVeic      := ""
	Local cFechada     := ""
	Local nTotalPed    := 0
	Local aTotalItem   := {}
	Local lCalcBase    := .F.
	Local aComponentes := {}
	Local cAgrupado    := ""
	Local cGrupoAtual  := ""
	Local aErros       := {}

	Local aChaveDC := {}
	Local nVlFrete := 0
	Local dDataRef := Date()	
	Local cHoraRef := Substr(Time(), 1, 5)
	Local dDtPrev
	Local cCDTRP   := ""
	Local nPos := 0
	Local c_EmiRem := ""
	Local c_Dest := ""

	Local nMV_X_PCUB   := 0 //SuperGetMV( "MV_X_PCUB" , .F., 0 )    // Padrão de KG por M3 para Frete Cubado.
	Local lMV_X_GFECB  := .F. //SuperGetMV( "MV_X_GFECB", .F., .F.  ) // Enviar Frete Cubado para GFE?

	Private lTabTemp := .F.
	Private aTRBSIM1 := {}
	Private acServ   := {}  // Usuada internamente pelo GFE

	Private idpCCF   := 1   // posição do array cTRBCCF
	Private idxCCF   := 1   // Indice  da array cTRBCCF
	Private aTRBCCF1 := {}

	Private idpTCF   := 1   // posição do array de Documentos de carga cTRBTCF
	Private idxTCF   := 1   // Indice da array de Documentos de carga cTRBTCF
	Private aTRBTCF1 := {}

	Private idpTRE   := 1   // posição do array cTRBTRE
	Private idxTRE   := 1   // Indice  da array cTRBTRE
	Private aTRBTRE1 := {}

	Private idpUNC   := 1   // posição do array cTRBUNC
	Private idxUNC   := 1   // Indice  da array cTRBUNC
	Private aTRBUNC1 := {}

	Private _aCmpGRU := {"NRAGRU",;	//Numero do Agrupador
	"CDTRP" ,;	//Transportador
	"CDTPVC",;	//Tipo de Veiculo
	"CDCLFR",;	//Classificacao de Frete
	"CDTPOP",;	//Tipo de Operacao
	"DISTAN",;	//Distancia Percorrida
	"NRCIDD",;	//Cidade Destino
	"CEPD"  ,;	//CEP Destino
	"ERRO"  }	//Parametro criado para verificação de erro no momento da montagem do cálculo do romaneio

	/*************************************************************/
	Private _aCmpDOC := {"EMISDC",; //Emitente do Documento
	"SERDC" ,; //Serie do Documento
	"NRDC"  ,; //Numero do Documento
	"CDTPDC",; //Tipo do Documento
	"CDREM" ,; //Remetente do Documento
	"CDDEST",; //Destinatario do Documento
	"ENTEND",; //Endereco de Entrega
	"ENTBAI",; //Bairro de entrega
	"ENTNRC",; //Cidade de Entrega
	"ENTCEP",; //CEP de Entrega
	"NRREG" ,; //Região de destino
	"TPFRET",; //Tipo de Frete
	"ICMSDC",; //ICMS?
	"USO"   ,; //Finalidade da mercadoria
	"CARREG",; //Número do carregamento
	"NRAGRU",; //Numero do Agrupador
	"QTUNIT" }  //Quantidade de Unitizadores

	/*************************************************************/
	Private _aCmpSTF := {"NRROM"  ,; //Numero do Romaneio
	"DOCS"   ,; //Documentos de Carga
	"CDTRP"  ,; //Codigo do Transportador (Base ou Vinculo)
	"NRTAB"  ,; //Numero da Tabela (Base ou Vinculo)
	"NRNEG"  ,; //Negociacao (Base ou Vinculo)
	"NRCALC" ,; //Numero do Calculo
	"CDCLFR" ,; //Classificacao de Frete
	"CDTPOP" ,; //Tipo Operacao
	"CDFXTV" ,; //Seq. Faixa
	"CDTPVC" ,; //Tipo de Veiculo
	"NRROTA" ,; //Rota
	"DESROT" ,; //Descricao da Rota
	"DTVALI" ,; //Data Vigencia Inicio
	"DTVALF" ,; //Data Vigencia Fim
	"VLFRT"  ,; //Valor Frete
	"PRAZO"  ,; //Prazo Entrega
	"TPTAB"  ,; //Tipo Tabela (1=Normal; 2=Vinculo)
	"EMIVIN" ,; //Emitente Vinculo (Original)
	"TABVIN" ,; //Tabela Vinculo (Original)
	"NRTAB1" ,; //Não usado. Mantido por compatibilidade.
	"ATRFAI" ,; //Atributo da Faixa
	"QTKGM3" ,; //K3/M3 - Fator de Cubagem
	"UNIFAI" ,; //Unidade da Faixa
	"TPLOTA" ,; //Tipo Lotacao
	"TPVCFX" ,; //Grava se foi selecionada uma faixa ou um tipo de veiculo, usado na Simulação do Calculo de frete
	"DEMCID" ,; //Indica se rota eh demais cidades
	"QTFAIXA",; //Quantidade usada para determinação da faixa, usada como quantidade para calculo quando a rota eh selecionada
	"CONTPZ" ,; //Indica a forma de contagem do prazo, dias corridos, uteis ou horas
	"QTCOTA" ,; //Cota Do tipo de Veículo, para validação
	"VLALUG" ,; //Valor da locação do tipo Veículo, para validação
	"FRQKM"  ,;  //Franquia em km, para validação
	"VLKMEX" ,;  //Valor excedente da franquia, para validação
	"ERRO"   ,;
	"TPROTA"} //Tipo da rota

	/*************************************************************/
	Private _aCmpSIM :={"NRROM"  ,; //Numero do Romaneio
	"DOCS"   ,;
	"CDTRP"  ,;
	"NRTAB"  ,;
	"NRNEG"  ,;
	"NRCALC" ,;
	"CDCLFR" ,;
	"CDTPOP" ,;
	"CDFXTV" ,;
	"CDTPVC" ,;
	"NRROTA" ,;
	"DESROT" ,;
	"DTVALI" ,;
	"DTVALF" ,;
	"VLFRT"  ,;
	"PRAZO"  ,;
	"TPTAB"  ,;
	"EMIVIN" ,;
	"TABVIN" ,;
	"NRTAB1" ,;
	"ATRFAI" ,;
	"QTKGM3" ,;
	"UNIFAI" ,;
	"TPLOTA" ,;
	"DEMCID" ,;
	"QTFAIXA",;
	"TPVCFX" ,;
	"SELEC"  ,;
	"VALROT" ,;
	"VALFAI" ,;
	"VALTPVC",;
	"VALDATA",;
	"ROTSEL" ,;
	"ERRO"}

	/*************************************************************/
	Private _aCmpGRB :={"NRGRUP",;
	"EMISDC",;
	"SERDC" ,;
	"NRDC"  ,;
	"CDTPDC",;
	"CDREM" ,;
	"CDDEST",;
	"ENTEND",;
	"ENTBAI",;
	"ENTNRC",;
	"ENTCEP",;
	"NRREG" ,;
	"TPFRET",;
	"USO"   ,;
	"CARREG",;
	"NRAGRU",;
	"QTUNIT"}
	/*************************************************************/
	Private _aCmpTCF := {"NRCALC"   ,; //1
	"CDCLFR"   ,; //2
	"CDTPOP"   ,; //3
	"SEQ"      ,; //4
	"DTVIGE"   ,; //5
	"ITEM"     ,; //6
	"CDTRP"    ,; //7
	"NRTAB"    ,; //8
	"NRNEG"    ,; //9
	"CDFXTV"   ,; //10
	"CDTPVC"   ,; //11
	"NRROTA"   ,; //12
	"QTCALC"   ,; //13
	"QTDE"     ,; //14
	"PESOR"    ,; //15
	"PESCUB"   ,; //16
	"QTDALT"   ,; //17
	"VALOR"    ,; //18
	"VOLUME"   ,; //19
	"NRGRUP"   ,; //20
	"CDEMIT"   ,; //21
	"PEDROM"   ,; //22
	"PESPED"   ,; //23
	"PRAZO"    ,; //24
	"DELETADO" ,;
	"PERCOUT"  ,; //26
	"PESORORG"  ,;//27
	"PESCUBORG" ,;//28
	"VALORORG"  ,;//29
	"VOLUMEORG" ,;//30
	"QTDEORG"   }//31

	/*************************************************************/
	Private _aCmpUNC := {"NRCALC",; // 1
	"TIPO"  ,; // 2
	"FINALI",; // 3
	"DTPREN",; // 4
	"HRPREN",; // 5
	"TPTRIB",; // 6
	"BASICM",; // 7
	"PCICMS",; // 8
	"VLICMS",; // 9
	"ICMRET",; // 10
	"BASISS",; // 11
	"PCISS" ,; // 12
	"VLISS" ,; // 13
	"BAPICO",; // 14
	"VLPIS" ,; // 15
	"VLCOFI",; // 16
	"PCREIC",; // 17
	"VALTAB",; // 18
	"NRAGRU",; // 19
	"IDFRVI",; // 20
	"SEQTRE",; // 21
	"CALBAS",; // 22
	"ADICIS",; // 23
	"CHVGWU",; // 24
	"DELETADO",; // 25
	"NRLCENT"} // 26 

	/*************************************************************/
	Private _aCmpTRE := {"EMISDC",;  // 1
	"SERDC" ,;  // 2
	"NRDC"  ,;  // 3
	"CDTPDC",;  // 4
	"SEQ"   ,;  // 5
	"CDTRP" ,;  // 6
	"NRCIDD",;  // 7
	"CDTPVC",;  // 8
	"PAGAR" ,;  // 9
	"NRCIDO",;  // 10
	"CEPO"  ,;  // 11
	"CEPD"  ,;  // 12
	"CDCLFR",;  // 13
	"CDTPOP",;  // 14
	"ORIGEM",;  // 15
	"DESTIN",;  // 16
	"NRGRUP",;  // 17
	"NRCALC",;  // 18
	"DELETADO"} // 19 
	/*************************************************************/
	Private _aCmpITE := {"EMISDC",; // 1
	"SERDC" ,; // 2
	"NRDC"	,; // 3
	"CDTPDC",; // 4
	"ITEM"  ,; // 5
	"CDCLFR",; // 6
	"TPITEM",; // 7
	"QTDE"  ,; // 8
	"PESOR" ,; // 9
	"PESOC" ,; // 10
	"QTDALT",; // 11
	"VALOR" ,; // 12
	"VOLUME",; // 13
	"TRIBP" ,; // 14
	"NRGRUP"} // 15
	/*************************************************************/

	Private _aCmpCCF := {"NRCALC" ,; // 1
	"CDCLFR" ,; // 2
	"CDTPOP" ,; // 3
	"SEQ"    ,; // 4
	"CDCOMP" ,; // 5
	"CATVAL" ,; // 6
	"QTDE"   ,; // 7
	"VALOR"  ,; // 8
	"TOTFRE" ,; // 9
	"BASIMP" ,; // 10
	"BAPICO" ,; // 11
	"FREMIN" ,; // 12
	"IDMIN"  ,; // 13
	"VLFRMI" ,; // 14
	"DELETADO" ,; // 15
	"NRLCENT",; // 16
	"CPEMIT"}   // 17
	/*************************************************************/
	Private _aCmpPED := {	"NRCALC" ,; // 1
	"CDCLFR" ,; // 2
	"CDTPOP" ,; // 3
	"CDTRP"  ,; // 4
	"NRTAB"  ,; // 5
	"NRNEG"  ,; // 6
	"TPLOTA" ,; // 7
	"CDFXTV" ,; // 8
	"CDTPVC" ,; // 9
	"NRROTA" ,; // 10
	"ATRFAI" ,; // 11
	"UNIFAI" ,; // 12
	"UNICAL" ,; // 13
	"QTDE"   ,; // 14
	"PESOR"  ,; // 15
	"PESCUB" ,; // 16
	"QTDALT" ,; // 17
	"VALOR"  ,; // 18
	"VOLUME" ,; // 19
	"VLPED"  ,; // 20
	"QTCALC" ,; // 21
	"CDCOMP"}   // 22
	/*************************************************************/
	Private _aCmpENT := {"NRLCENT",; // Local Entrega
	"CDTRP" ,; // Transportador
	"SEQTRE",; // Sequencia do Trecho
	"ORIGEM",; // Cidade de Origem
	"DESTIN",; // Cidade de Destino
	"CDREM" ,; // Remetente
	"CDDEST",;// Destinatário
	"ENTNRC",; //Cidade de Entrega
	"ENTEND",; //Endereco de Entrega
	"ENTBAI",; //Bairro de entrega
	"CDCOMP",; // Componente
	"CDCLFR",; // Classificacao de Frete
	"CDTPOP",; // Tipo de Operacao
	"QTDCOMP",;	// Quantidade de Componentes Entrega compartilhado.
	"QTDENTR"}	// Quantidade de UNIDADES Entrega compartilhado.
	/*************************************************************/
	Private _aCmpROT := {"NRCALC"  ,; //Numero do Calculo
	"CDTRP"   ,; //Chave negociação pai
	"NRTAB"   ,; //Chave negociação pai
	"NRNEG"   ,; //Chave negociação pai
	"NRROTA"   ,; //Chave negociação pai
	"CDFXTV"  ,; //Chave negociação pai
	"CDTRPCOD",; //Chave negociação filha
	"NRTABCOD",; //Chave negociação filha
	"NRNEGCOD",; //Chave negociação filha
	"PRIORI"  ,; //Prioridade
	"PRIFAI"  ,; //Prioridade faixa
	"NRRTTOD" ,; //Todas as rotas
	"CDFXTOD" }  //Todas as faixas

	Private n_TVlCar := 0

	// Variáveis Públicas do GFE
	aAgrFrt  := {}
	aDocCarg := {}
	aTrchDoc := {}
	aItDoc   := {}
	aTrbUnc2 := {}

	If !Empty( cCodVeic )
		DA3->( dbSetOrder(1) )
		If DA3->( dbSeek( xFilial("DA3") + cCodVeic ) )
			cTpVeic := DA3->DA3_TIPVEI
		EndIf
	EndIf
	nPedidos := 0

	DAI->( dbSeek( xFilial("DAI") + DAK->DAK_COD + DAK->DAK_SEQCAR ) )
	While !DAI->( Eof() ) .And. DAI->DAI_COD = DAK->DAK_COD .And. DAI->DAI_SEQCAR = DAK->DAK_SEQCAR

		nRegua++
		DAI->( dbSkip() )
	End

	ProcRegua(nRegua)

	//Armazenando o valor dos agrupadores de frete 		
	aAuxAgrFrt := {}
	AADD(aAuxAgrFrt, u_VerTamCpo( cAgrup , "GWN_NRROM"  ) )  // GWN_NRROM  - Numero do Agrupador
	AADD(aAuxAgrFrt, u_VerTamCpo( ""     , "GWN_CDTRP"  ) )  // GWN_CDTRP  - Transportador (GU3)
	//If Len(aRedesp) > 0
	AADD(aAuxAgrFrt, u_VerTamCpo( ""     , "GWN_CDTPVC" ) )  // GWN_CDTPVC - Tipo de Veiculo - F3[GV3]
	//Else
	//AADD(aAuxAgrFrt, u_VerTamCpo( cTpVeic, "GWN_CDTPVC" ) )  // GWN_CDTPVC - Tipo de Veiculo - F3[GV3]
	//	EndIf
	AADD(aAuxAgrFrt, u_VerTamCpo( cCdClFr     , "GWN_CDCLFR" ) )  // GWN_CDCLFR - Classificacao de Frete
	AADD(aAuxAgrFrt, u_VerTamCpo( cTpOp  , "GWN_CDTPOP" ) )  // GWN_CDTPOP - Tipo de Operacao (GV4)
	AADD(aAuxAgrFrt, nKM                                  )  // GWN_DISTAN - Distancia Percorrida
	AADD(aAuxAgrFrt, u_VerTamCpo( ""     , "GWN_NRCIDD" ) )  // GWN_NRCIDD - Cidade Destino
	AADD(aAuxAgrFrt, u_VerTamCpo( ""     , "GWN_CEPD"   ) )  // GWN_CEPD   - CEP Destino
	AADD(aAuxAgrFrt, "0" )

	AADD(aAgrFrt, aAuxAgrFrt)

	BeginSQL Alias cxAliasDAI
	SELECT ' ' AS TIPO, DAI.DAI_PEDIDO, DAI.DAI_SEQUEN
	FROM %table:DAI% DAI
	WHERE DAI.%NotDel%
	AND DAI.DAI_FILIAL = %xFilial:DAI%
	AND DAI.DAI_COD = %exp:DAK->DAK_COD%
	AND DAI.DAI_SEQCAR = %exp:DAK->DAK_SEQCAR%
	ORDER BY TIPO
	EndSQL 

	While !(cxAliasDAI)->( Eof() )
		DAI->( dbSetOrder(1) )
		DAI->( dbSeek( xFilial("DAI") + DAK->DAK_COD + DAK->DAK_SEQCAR + (cxAliasDAI)->DAI_SEQUEN + (cxAliasDAI)->DAI_PEDIDO ) )

		IncProc()

		BeginSQL Alias cxAliasAux
		SELECT COUNT(*) QTD
		FROM %table:SC6% SC6
		INNER JOIN %table:SF4% SF4 ON SF4.%NotDel% AND SF4.F4_FILIAL = %xFilial:SF4%
		AND SF4.F4_CODIGO = SC6.C6_TES
		//AND SF4.F4_ESTOQUE = 'S'
		WHERE SC6.%NotDel% AND SC6.C6_FILIAL = %xFilial:SC6%
		AND SC6.C6_NUM = %exp:DAI->DAI_PEDIDO%
		EndSQL 

		If (cxAliasAux)->QTD == 0
			(cxAliasAux)->( dbCloseArea() )

			(cxAliasDAI)->( dbSkip() )
			Loop
		EndIf
		(cxAliasAux)->( dbCloseArea() )

		nPedidos++

		nTotalPed := GFE_TotPed( DAI->DAI_PEDIDO, @aTotalItem )
		n_TVlCar += nTotalPed

		SC5->( dbSetOrder(1) )
		SC5->( dbSeek( xFilial("SC5") + DAI->DAI_PEDIDO ) )

		If !Empty(SC5->C5_CLIENT) .And. !Empty(SC5->C5_LOJAENT)

			RecLock(cxAliasPed,.T.)
			(cxAliasPed)->STATUS     := " "
			(cxAliasPed)->TIPO       := (cxAliasDAI)->TIPO
			(cxAliasPed)->DAI_SEQUEN := DAI->DAI_SEQUEN
			(cxAliasPed)->AGRUPADO   := " "
			(cxAliasPed)->C5_NUM     := DAI->DAI_PEDIDO
			(cxAliasPed)->C5_CLIENTE := SC5->C5_CLIENTE
			(cxAliasPed)->C5_LOJACLI := SC5->C5_LOJACLI
			(cxAliasPed)->DAI_PESO   := DAI->DAI_PESO
			(cxAliasPed)->DAI_CAPVOL := DAI->DAI_CAPVOL
			(cxAliasPed)->TOTALPED   := nTotalPed
			If SC5->C5_TIPO $ "BD"
				SA2->( dbSetOrder(1) )
				If SA2->( dbSeek( xFilial("SA2") + SC5->C5_CLIENTE + SC5->C5_LOJACLI ) )
					(cxAliasPed)->A1_NOME := SA2->A2_NOME
					(cxAliasPed)->A1_EST  := SA2->A2_EST

					GU3->( dbSetOrder(11) )
					If GU3->( dbSeek( xFilial("GU3") + SA2->A2_CGC ) ) == .F.
						// Cliente Não Integrado no GFE
						aadd( aErros, "Fornecedor " + SA2->A2_COD + "/" + SA2->A2_LOJA + " não integrado ao GFE ("+ SA2->A2_CGC +")" )
					EndIf

				EndIf
			Else
				SA1->( dbSetOrder(1) )
				If SA1->( dbSeek( xFilial("SA1") + SC5->C5_CLIENTE + SC5->C5_LOJACLI ) )
					(cxAliasPed)->A1_NOME := SA1->A1_NOME
					(cxAliasPed)->A1_EST  := SA1->A1_EST

					GU3->( dbSetOrder(11) )
					If GU3->( dbSeek( xFilial("GU3") + SA1->A1_CGC ) ) == .F.
						// Cliente Não Integrado no GFE
						aadd( aErros, "Cliente " + SA1->A1_COD + "/" + SA1->A1_LOJA + " não integrado ao GFE("+ SA1->A1_CGC +")" )
					EndIf

				EndIf
			EndIf
			(cxAliasPed)->EMITGFE := "N"

			If SC5->C5_TIPO $ "BD"
				SA2->( dbSeek( xFilial("SA1") + SC5->C5_CLIENT + SC5->C5_LOJAENT ) )
				If SA2->( dbSeek( xFilial("SA2") + SC5->C5_CLIENTE + SC5->C5_LOJACLI ) )
					(cxAliasPed)->A1_NOME := SA2->A2_NOME
					GU3->( dbSetOrder(11) )
					If GU3->( dbSeek( xFilial("GU3") + SA2->A2_CGC ) )
						If GU3->GU3_FORN = "1"
							(cxAliasPed)->EMITGFE := "S"
						EndIf
					Else
						// Fornecedor Não Integrado no GFE
						aadd( aErros, "Fornecedor " + SA2->A2_COD + "/" + SA2->A2_LOJA + " não integrado ao GFE("+ c_Dest +")" )
					EndIf
				EndIf
			Else
				SA1->( dbSeek( xFilial("SA1") + SC5->C5_CLIENT + SC5->C5_LOJAENT ) )
				If SA1->( dbSeek( xFilial("SA1") + SC5->C5_CLIENTE + SC5->C5_LOJACLI ) )
					(cxAliasPed)->A1_NOME := SA1->A1_NOME
					GU3->( dbSetOrder(11) )
					If GU3->( dbSeek( xFilial("GU3") + SA1->A1_CGC ) )
						If GU3->GU3_CLIEN = "1"
							(cxAliasPed)->EMITGFE := "S"
						EndIf
					Else
						// Cliente Não Integrado no GFE
						aadd( aErros, "Cliente " + SA1->A1_COD + "/" + SA1->A1_LOJA + " não integrado ao GFE("+ SA1->A1_CGC +")" )
					EndIf
				EndIf
			EndIf
			(cxAliasPed)->( MsUnlock() )

			//Documento de Carga

			c_EmiRem := Posicione("GU3",11,xFilial("GU3") + SM0->M0_CGC,"GU3_CDEMIT")
			c_Dest := Posicione("GU3",11,xFilial("GU3") + SM0->M0_CGC,"GU3_CDEMIT")

			aAuxDocCarg   := {}
			AADD(aAuxDocCarg, u_VerTamCpo( c_EmiRem, "GW1_EMISDC" ) ) // Emitente do Documento
			AADD(aAuxDocCarg, u_VerTamCpo( cSerie     , "GW1_SERDC"  ) ) // Serie do Documento
			AADD(aAuxDocCarg, u_VerTamCpo( SC5->C5_NUM, "GW1_NRDC"   ) ) // Numero do Documento
			AADD(aAuxDocCarg, u_VerTamCpo( cTpDoc     , "GW1_CDTPDC" ) ) // Tipo do Documento
			AADD(aAuxDocCarg, u_VerTamCpo( c_EmiRem, "GW1_CDREM"  ) ) // Remetente do Documento
			If SC5->C5_TIPO $ "BD"
				c_Dest := Posicione("GU3",11,xFilial("GU3") + SA2->A2_CGC,"GU3_CDEMIT")
				AADD(aAuxDocCarg, u_VerTamCpo( c_Dest, "GW1_CDDEST" ) ) // Destinatario do Documento
			Else
				c_Dest := Posicione("GU3",11,xFilial("GU3") + SA1->A1_CGC,"GU3_CDEMIT")
				AADD(aAuxDocCarg, u_VerTamCpo(c_Dest, "GW1_CDDEST" ) ) // Destinatario do Documento
			EndIf
			AADD(aAuxDocCarg, u_VerTamCPO( ""         , "GW1_ENTEND" ) ) // Endereco de Entrega
			AADD(aAuxDocCarg, u_VerTamCPO( ""         , "GW1_ENTBAI" ) ) // Bairro de Entrega
			AADD(aAuxDocCarg, u_VerTamCPO( ""         , "GW1_ENTNRC" ) ) // Cidade de Entrega
			AADD(aAuxDocCarg, u_VerTamCPO( ""         , "GW1_ENTCEP" ) ) // CEP de Entrega
			AADD(aAuxDocCarg, u_VerTamCPO( ""         , "GW1_NRREG"  ) ) // Região de destino
			If Len(aRedesp) > 0
				AADD(aAuxDocCarg, u_VerTamCPO( "2"     , "GW1_TPFRET" ) ) // Tipo de Frete: 1=CIF;2=CIF Redesp.;3=FOB;4=FOB Redesp.;5=Consignado;6=Consig. Redesp.
			Else
				AADD(aAuxDocCarg, u_VerTamCPO( "1"     , "GW1_TPFRET" ) ) // Tipo de Frete: 1=CIF;2=CIF Redesp.;3=FOB;4=FOB Redesp.;5=Consignado;6=Consig. Redesp.
			EndIf
			AADD(aAuxDocCarg, u_VerTamCpo( "1"        , "GW1_ICMSDC" ) ) // ICMS: 1=Sim;2=Nao
			AADD(aAuxDocCarg, u_VerTamCpo( "1"        , "GW1_USO"    ) ) // Finalidade da mercadoria: 1-Industrialização/Venda 2-Uso/Consumo 3-Ativo Imobilizado
			AADD(aAuxDocCarg, u_VerTamCpo( ""         , "GW1_CARREG" ) ) // Número do carregamento
			AADD(aAuxDocCarg, u_VerTamCpo( cAgrup     , "GW1_NRROM"  ) ) // Numero do Agrupador
			AADD(aAuxDocCarg, 1 )                                        // GW1_QTUNI  - Quantidade de Unitizadores

			AADD(aDocCarg, aAuxDocCarg)

			//Armazenando os Trechos (Redespachos)
			cSeq := "01"
			For nAux := 1 to Len( aRedesp )
				If !Empty(aRedesp[nAux])
					aAuxTrchDoc := {}
					AADD(aAuxTrchDoc, u_VerTamCpo( c_EmiRem  , "GWU_EMISDC" ) ) // Emitente do Documento
					AADD(aAuxTrchDoc, u_VerTamCPO( cSerie       , "GWU_SERDC"  ) ) // Serie do Documento
					AADD(aAuxTrchDoc, u_VerTamCPO( SC5->C5_NUM  , "GWU_NRDC"   ) ) // Numero do Documento
					AADD(aAuxTrchDoc, u_VerTamCPO( cTpDoc       , "GWU_CDTPDC" ) ) // Tipo do Documento
					AADD(aAuxTrchDoc, u_VerTamCPO( cSeq         , "GWU_SEQ"    ) ) // Sequencia do Trecho
					AADD(aAuxTrchDoc, u_VerTamCPO( ""           , "GWU_CDTRP"  ) ) // Transportador do Trecho
					AADD(aAuxTrchDoc, u_VerTamCPO( aRedesp[nAux], "GWU_NRCIDD" ) ) // Cidade Destino
					If !Empty( cTpVeic ) .And. cSeq = "01"
						AADD(aAuxTrchDoc, u_VerTamCPO( cTpVeic   , "GWU_CDTPVC" ) ) // Tipo de Veiculo do Trecho - F3[GV3]
					Else
						AADD(aAuxTrchDoc, u_VerTamCPO( ""        , "GWU_CDTPVC" ) ) // Tipo de Veiculo do Trecho - F3[GV3]
					EndIf
					AADD(aAuxTrchDoc, u_VerTamCPO( "1"          , "GWU_PAGAR"  ) ) // Paga o trecho ou nao (sempre pagar '1')

					AADD(aTrchDoc, aAuxTrchDoc)

					cSeq := Soma1(cSeq)
				EndIf
			Next

			cAux := AllTrim(TMS120CdUf(SA1->A1_EST, "1") + SA1->A1_COD_MUN)

			// Destino Final
			aAuxTrchDoc := {}
			AADD(aAuxTrchDoc, u_VerTamCPO( c_EmiRem, "GWU_EMISDC" ) ) // Emitente do Documento
			AADD(aAuxTrchDoc, u_VerTamCPO( cSerie     , "GWU_SERDC"  ) ) // Serie do Documento
			AADD(aAuxTrchDoc, u_VerTamCPO( SC5->C5_NUM, "GWU_NRDC"   ) ) // Numero do Documento
			AADD(aAuxTrchDoc, u_VerTamCPO( cTpDoc     , "GWU_CDTPDC" ) ) // Tipo do Documento
			AADD(aAuxTrchDoc, u_VerTamCPO( cSeq       , "GWU_SEQ"    ) ) // Sequencia do Trecho
			AADD(aAuxTrchDoc, u_VerTamCPO( ""         , "GWU_CDTRP"  ) ) // Transportador do Trecho
			AADD(aAuxTrchDoc, u_VerTamCPO( cAux       , "GWU_NRCIDD" ) ) // Cidade Destino
			If !Empty( cTpVeic ) .And. cSeq = "01"
				AADD(aAuxTrchDoc, u_VerTamCPO( cTpVeic, "GWU_CDTPVC" ) ) // Tipo de Veiculo do Trecho - F3[GV3]
			Else
				AADD(aAuxTrchDoc, u_VerTamCPO( ""     , "GWU_CDTPVC" ) ) // Tipo de Veiculo do Trecho - F3[GV3]
			EndIf
			AADD(aAuxTrchDoc, u_VerTamCPO( "1"        , "GWU_PAGAR"  ) ) // Paga o trecho ou nao (sempre pagar '1')

			AADD(aTrchDoc, aAuxTrchDoc)

			//Armazenando o valor dos Itens de carga 
			BeginSql Alias cxAlias
			SELECT SC9.C9_ITEM, SC9.C9_PRODUTO, SB1.B1_DESC, SC9.C9_QTDLIB,
			SC9.C9_QTDLIB * SB1.B1_PESBRU AS PESOB,
			SC9.C9_QTDLIB * SB1.B1_PESO AS PESOL,
			SC9.C9_QTDLIB * SC6.C6_VALOR / SC6.C6_QTDVEN AS C6_VALOR,
			SC9.C9_QTDLIB * SB5.B5_ALTURLC * SB5.B5_COMPRLC * SB5.B5_LARGLC AS CUBICAGEM
			FROM %table:SC9% SC9
			INNER JOIN %table:SB1% SB1 ON SB1.%NotDel% AND SB1.B1_FILIAL = %xFilial:SB1% 
			AND SB1.B1_COD = SC9.C9_PRODUTO
			INNER JOIN %table:SC6% SC6 ON SC6.%NotDel% AND SC6.C6_FILIAL = %xFilial:SC6%
			AND SC6.C6_NUM = SC9.C9_PEDIDO AND SC6.C6_ITEM = SC9.C9_ITEM
			INNER JOIN %table:SB5% SB5 ON SB5.%NotDel% AND SB5.B5_FILIAL = %xFilial:SB5%
			AND SB5.B5_COD = SC9.C9_PRODUTO
			WHERE SC9.%NotDel%
			AND SC9.C9_FILIAL = %xFilial:SC9%
			AND SC9.C9_CARGA = %exp:DAI->DAI_COD%
			AND SC9.C9_SEQCAR = %exp:DAI->DAI_SEQCAR%
			AND SC9.C9_PEDIDO = %exp:DAI->DAI_PEDIDO%
			EndSql

			While !(cxAlias)->( Eof() )

				nxValorTotal := (cxAlias)->C6_VALOR
				If ( nPos := aScan( aTotalItem, { |aOpc| aOpc[1] == (cxAlias)->C9_PRODUTO } ) ) > 0
					nxValorTotal := aTotalItem[nPos,3] / aTotalItem[nPos,2] * (cxAlias)->C9_QTDLIB
				EndIf
				If (cxAlias)->CUBICAGEM == 0
					nM3 := 1
				Else
					nM3 := (cxAlias)->CUBICAGEM
				EndIf

				aAuxItDoc := {}
				AADD(aAuxItDoc, u_VerTamCPO( c_EmiRem, "GWU_EMISDC"  ) ) // GW8_EMISDC - Emitente do Documento
				AADD(aAuxItDoc, u_VerTamCPO( cSerie     , "GW8_SERDC"   ) ) // GW8_SERDC  - Serie do Documento
				AADD(aAuxItDoc, u_VerTamCPO( SC5->C5_NUM, "GW8_NRDC"    ) ) // GW8_NRDC   - Numero do Documento
				AADD(aAuxItDoc, u_VerTamCPO( cTpDoc     , "GW8_CDTPDC"  ) ) // Tipo do Documento
				AADD(aAuxItDoc, u_VerTamCPO( (cxAlias)->C9_PRODUTO, "GW8_ITEM" ) ) // Item
				AADD(aAuxItDoc, u_VerTamCPO( cCdClFr    , "GW8_CDCLFR"  ) ) // Classificacao de Frete
				AADD(aAuxItDoc, u_VerTamCPO( ""         , "GW8_TPITEM"  ) ) // Tipo de Item
				AADD(aAuxItDoc, (cxAlias)->C9_QTDLIB )                      // GW8_QTDE   - Quantidade do Item
				AADD(aAuxItDoc, (cxAlias)->PESOB     )                      // GW8_PESOR  - Peso Bruto do Item
				If lMV_X_GFECB // Enviar Frete Cubado
					//AADD(aAuxItDoc, nM3 * nMV_X_PCUB     )                  // GW8_PESOC  - Peso Cubado
				Else
					AADD(aAuxItDoc, 0                    )                  // GW8_PESOC  - Peso Cubado
				EndIf
				AADD(aAuxItDoc, (cxAlias)->PESOL     )                      // GW8_QTDALT - Quantidade/Peso Alternativo
				AADD(aAuxItDoc, nxValorTotal         )                      // GW8_VALOR  - Valor do Item
				AADD(aAuxItDoc, nM3                  )                      // GW8_VOLUME - Volume ocupado (m3)
				AADD(aAuxItDoc, u_VerTamCPO( "1"        , "GW8_TRIBP"   ) ) // GW8_TRIBP  - Trib PIS/COFINS

				AADD(aItDoc, aAuxItDoc)

				(cxAlias)->( dbSkip() )
			End
			(cxAlias)->( dbCloseArea() )
		EndIf
		(cxAliasDAI)->( dbSkip() )
	End
	(cxAliasDAI)->( dbCloseArea() )

	If Len(aErros) != 0

		u_ShowLogArray( aErros, "Erros nos dados para simulação..." )
		Return .F.

		//rodando a rotina do calculo de frete
	ElseIf Len(aAgrFrt) != 0 .And. Len(aDocCarg) != 0 .And. Len(aTrchDoc) != 0 .And. Len(aItDoc) != 0
		/*
		GFEXFUNB.PRW -> GFECLCFRT()
		@param  1 aAgrFrt        Agrupadores de Frete -> Romaneios
		@param  2 aDocCarg       Documentos de Carga -> NF, etc.
		@param  3 aTrchDoc       Trechos do Documento de Carga
		@param  4 aItDoc         Itens do Documento de Carga
		@param  5 [aTblFrt]      Tabela de Frete
		@param  6 [lReal]        Calculo Real? (ou simulacao) default = .T.
		@param  7 [iLogProc]     Apresenta log ao final do processo? 0: Não apresentar, 1: Somente erros, 2: Sempre 
		@param  8 [nTabProv]     Cálculo de Provisão? 0: Não, 1: Sim, utilizando tabela dos parametros, 2: Sim, utilizando tabela do transportador. Default = 0
		@param  9 [lParCons]     Considerar Tabelas de frete com a situação 'Em negociação'? default = .F.
		@param 10 [iTpSimul]     Tipo de simulação: 0=simulação geral, 1=simulação específica default 0
		@param 11 lCalcLote      Recebe ".T." se rotina que chamou a função é GFEA081
		@param 12 lHideProgress  Esconde a barra de progresso
		@param 13 lLog           Indica se deve ou não salvar arquivo de log. Default ".T."
		@param 14 lServ          Indica se o cálculo deve ser de Serviço. Default ".F."
		@param 15 pServTpImp     Indica o tipo de imposto que o cálculo de serviço irá usar [1: Conforme regra cidade origem x destino, 2: ISS - Cidade Origem, 3: ISS - Cidade Destino]
		@param 16 pCalcDatabase  Força a data de criação GWF_DTCRIA como dDataBase ou Date(). Default .T. dDataBase | .F. Date() 

		@Return Vetor contendo dados do cálculo
		[1] Sucesso (.T. Sim | .F. Não)
		[2] Arquivo de Log Gerado
		[3] Array com os erros dos Cálculos
		[4] aErroDoc
		*/
		//                 1        2         3         4      5  6    7  8  9        10  11   12   13   14   15
		aRet := GFECLCFRT( aAgrFrt,  aDocCarg, aTrchDoc, aItDoc,           , .F.        , 0           , 0          , lxTbNeg    , 0          , .F.            , .F.                 , .T. , .F.  , "1" )
		//		        GFECLCFRT(aAgrFrt,   aDocCarg, aTrchDoc, aItDoc,/*aTblFrt*/,.T./*lReal*/,2/*iLogProc*/,/*nTabProv*/,/*lParCons*/,/*iTpSimul*/,.F./*lCalcLote*/, .F./*lHideProgress*/, .f.)
		//		        GFECLCFRT(aAgrFrt1, aDocCarg1, aTrchDoc, aItDoc, aTblFrt   , lReal      , iLogProc    , nTabProv   , lParCons   , iTpSimul   , lCalcLote      , lHideProgress       , lLog, lServ, pServTpImp, pCalcDataBase,aNoCalc,lShowTabFr)
	Else
		//If u_PodeEditar("000025")
		//		If MsgYesNo( "Algumas arrays sem valor. Examinar?" )
		//			u_ExpArray( { aAgrFrt, aDocCarg, aTrchDoc, aItDoc } )
		//		EndIf
		//EndIf
	EndIf

	If ValType(aRet) <> "A"

		//        lError, cArqLog, aErroCalc, aErroDoc
		aRet := { .F., "", {}, {} }

		// Se o cálculo foi OK e MV_GFEBRF == "1", retornam tambem os itens abaixo na array:
		/*
		aAdd(aRet, aTRBGRB3)	// Array para ser utilizado para listar a simulações
		aAdd(aRet, aTRBTCF1)
		aAdd(aRet, lTabTemp)
		aAdd(aRet, aTRBUNC1)
		aAdd(aRet, aTRBTRE1)
		aAdd(aRet, aTRBCCF3)
		aAdd(aRet, aTRBSIM1)
		*/
	EndIf

	If aRet[1] // Simulação OK
		/*
		DBFs Temporários
		cTRBAGRU := GFECriaTab(GetStrAgr())	// DEFINIR AGRUPADORES DE CARGA
		cTRBDOC	 := GFECriaTab(GetStrDoc()) // DOCUMENTOS DE CARGA
		cTRBTCF	 := GFECriaTab(GetStrTCF()) // TABELA DO CALCULO DE FRETE
		cTRBUNC	 := GFECriaTab(GetStrUNC()) // UNIDADES DE CALCULO
		cTRBTRE	 := GFECriaTab(GetStrTRE())	// TRECHOS DA CARGA
		cTRBITE	 := GFECriaTab(GetStrITE())	// ITENS DA CARGA
		cTRBCCF	 := GFECriaTab(GetStrCCF()) // COMPONENTE DO CALCULO DE FRETE
		*/

		/*
		lOK       := aRet[01] // Cálculo Ok/ Cálculo com Erro
		cArqLog   := aRet[02] // Arquivo de log
		aErroCalc := aRet[03] // Array com os erros dos Cálculos.
		aErroDoc  := aRet[04] // Array ErroDoc
		aTRBGRB3  := aRet[05] // Array para ser utilizado para listar as simulações
		*/
		aTRBTCF1 := aRet[06]// TABELA DO CALCULO DE FRETE
		lTabTemp := aRet[07]// 
		aTRBUNC1 := aRet[08]// UNIDADES DE CALCULO
		aTRBTRE1 := aRet[09]// TRECHOS DA CARGA
		aTRBCCF1 := aRet[10]// COMPONENTE DO CALCULO DE FRETE
		aTRBSIM1 := aRet[11]// Documentos de carga

		//		U_zArrToTxt(aTRBTCF1, .T., "i:\tmp\tcf1.txt")
		//		U_zArrToTxt(aTRBUNC1, .T., "i:\tmp\unc1.txt")
		//		U_zArrToTxt(aTRBTRE1, .T., "i:\tmp\tre1.txt")
		//		U_zArrToTxt(aTRBCCF1, .T., "i:\tmp\ccf1.txt")
		//		U_zArrToTxt(aTRBSIM1, .T., "i:\tmp\sim1.txt")

		// TI
		//If u_PodeEditar("000025")

		//				If MsgYesNo( "Examinar Array de Retorno?" )
		//					u_ExpArray( aRet )
		//				EndIf
		//				While lTabTemp .And. MsgYesNo("Exibir Tabelas?")
		//		
		//					u_ExpArray( { cTRBDOC, cTRBAGRU, cTRBTCF, cTRBUNC, cTRBTRE, cTRBITE, cTRBCCF } )
		//		
		//					(cTRBDOC)->( dbGoTop() )
		//					(cTRBAGRU)->( dbGoTop() )
		//					(cTRBTCF)->( dbGoTop() )
		//					(cTRBUNC)->( dbGoTop() )
		//					(cTRBTRE)->( dbGoTop() )
		//					(cTRBITE)->( dbGoTop() )
		//					(cTRBCCF)->( dbGoTop() )
		//					// Descriçao dos TMPs em GFEXFUNB.prw
		//					//u_dbEdit( cTRBAGRU )
		//					u_dbEdit( cTRBDOC , "cTRBDOC"  )
		//					//u_dbEdit( cTRBGRU )
		//					u_dbEdit( cTRBAGRU, "cTRBAGRU" )
		//					u_dbEdit( cTRBTCF , "cTRBTCF"  )
		//					u_dbEdit( cTRBUNC , "cTRBUNC"  )
		//					u_dbEdit( cTRBTRE , "cTRBTRE"  )
		//					u_dbEdit( cTRBITE , "cTRBITE"  )
		//					u_dbEdit( cTRBCCF , "cTRBCCF"  )
		//				End
		//		EndIf


		//cGrupoAtual  := ""
		aComponentes := {}



		GFEXFB_1AREA(lTabTemp,cTRBUNC, @aTRBUNC1) //dbSelectArea(cTRBUNC)
		GFEXFB_BORDER(lTabTemp,cTRBUNC,01,6) //dbSetOrder(01)
		GFEXFB_2TOP(lTabTemp, cTRBUNC, @aTRBUNC1, 6) //dbGoTop()

		GWN->(dbSetOrder(1))

		While !GFEXFB_3EOF(lTabTemp, cTRBUNC, @aTRBUNC1, 6)
			aChaveDC := {}
			aadd( aChaveDC, aDocCarg[nAux,4] )
			aadd( aChaveDC, aDocCarg[nAux,1] )
			aadd( aChaveDC, aDocCarg[nAux,2] )
			aadd( aChaveDC, aDocCarg[nAux,3] )

			GFEXFB_1AREA(lTabTemp,cTRBTRE, @aTRBTRE1) //dbSelectArea(cTRBTRE)
			GFEXFB_BORDER(lTabTemp,cTRBTRE,01,7) //dbSetOrder(01)
			If !GFEXFB_CSEEK(lTabTemp, cTRBTRE, @aTRBTRE1, 7,{GFEXFB_5CMP(lTabTemp, cTRBUNC, @aTRBUNC1, 6,"NRCALC")}) 
				GFEXFB_CSEEK(lTabTemp, cTRBTRE, @aTRBTRE1, 7,{GFEXFB_5CMP(lTabTemp, cTRBUNC, @aTRBUNC1, 6,"CALBAS")})
			Endif
			//While !GFEXFB_3EOF(lTabTemp, cTRBTRE, @aTRBTRE1, 7) .And. GFEXFB_5CMP(lTabTemp, cTRBUNC, @aTRBUNC1, 6,"NRCALC") == GFEXFB_5CMP(lTabTemp, cTRBTRE, @aTRBTRE1, 7,"NRCALC")

			nVlFrete  := 0
			cFechada  := ""
			cCDTRP    := ""
			lFrViagem := .F.

			// Obtem o prazo
			GFEXFB_1AREA(lTabTemp,cTRBTCF, @aTRBTCF1)
			GFEXFB_BORDER(lTabTemp,cTRBTCF,01,05)
			If GFEXFB_CSEEK(lTabTemp, cTRBTCF, @aTRBTCF1, 05,{GFEXFB_5CMP(lTabTemp, cTRBUNC, @aTRBUNC1, 6,"NRCALC")})


				//nPrazo := 0
				While !GFEXFB_3EOF(lTabTemp, cTRBTCF, @aTRBTCF1, 05) .AND. GFEXFB_5CMP(lTabTemp, cTRBTCF, @aTRBTCF1, 05,"NRCALC") == GFEXFB_5CMP(lTabTemp, cTRBUNC, @aTRBUNC1, 6,"NRCALC")
					//nPrazo := If(GFEXFB_5CMP(lTabTemp, cTRBTCF, @aTRBTCF1, 05,"PRAZO") > nPrazo,GFEXFB_5CMP(lTabTemp, cTRBTCF, @aTRBTCF1, 05,"PRAZO"),nPrazo)

					cCDTRP := GFEXFB_5CMP(lTabTemp, cTRBTCF, @aTRBTCF1, 5, "CDTRP" )							

					dbSelectArea("GV9")
					GV9->( dbSetOrder(1) )
					GV9->( msSeek(xFilial("GV9") + GFEXFB_5CMP(lTabTemp, cTRBTCF, @aTRBTCF1, 05,"CDTRP")+GFEXFB_5CMP(lTabTemp, cTRBTCF, @aTRBTCF1, 05,"NRTAB")))

					If GV9->GV9_TPLOTA == "2"
						cFechada := "S"
					EndIf
					If GV9->GV9_FREVIA == "1" .Or. GV9->GV9_ATRFAI $ "6 |7 "
						lFrViagem := .T.
					EndIf

					dbSelectArea("GV6")
					GV6->( dbSetOrder(1) )
					GV6->( msSeek(xFilial("GV6")+GV9->GV9_CDEMIT+GV9->GV9_NRTAB+GV9->GV9_NRNEG) )

					dDtPrev := PrevDtEnt(dDataRef, cHoraRef, GV6->GV6_CDEMIT, GV6->GV6_NRTAB, GV6->GV6_NRNEG, GV6->GV6_CDFXTV, GV6->GV6_NRROTA)			


					// Soma os valores de frete
					GFEXFB_1AREA(lTabTemp,cTRBCCF, @aTRBCCF1) //dbSelectArea(cTRBCCF)
					GFEXFB_BORDER(lTabTemp,cTRBCCF,03,09) //dbSetOrder(1)
					If GFEXFB_CSEEK(lTabTemp, cTRBCCF, @aTRBCCF1, 09,{GFEXFB_5CMP(lTabTemp, cTRBTCF, @aTRBTCF1, 05,"NRCALC"),;
					GFEXFB_5CMP(lTabTemp, cTRBTCF, @aTRBTCF1, 05,"CDCLFR"),;
					GFEXFB_5CMP(lTabTemp, cTRBTCF, @aTRBTCF1, 05,"CDTPOP")}) //msSeek()
//					GFEXFB_5CMP(lTabTemp, cTRBTCF, @aTRBTCF1, 05,"SEQ")
						While  !GFEXFB_3EOF(lTabTemp, cTRBCCF, @aTRBCCF1, 09) .AND. ;
						GFEXFB_5CMP(lTabTemp, cTRBCCF, @aTRBCCF1, 09,"NRCALC") == GFEXFB_5CMP(lTabTemp, cTRBUNC, @aTRBUNC1, 6,"NRCALC") ;
						.AND. (GFEXFB_5CMP(lTabTemp, cTRBCCF, @aTRBCCF1, 09,"SEQ") == GFEXFB_5CMP(lTabTemp, cTRBTCF, @aTRBTCF1, 05,"SEQ");
						.OR. GFEXFB_5CMP(lTabTemp, cTRBCCF, @aTRBCCF1, 09,"SEQ") = ' ')

							nVlrCCF  := If(GFEXFB_5CMP(lTabTemp, cTRBCCF, @aTRBCCF1, 09,"TOTFRE") == "1",GFEXFB_5CMP(lTabTemp, cTRBCCF, @aTRBCCF1, 09,"VALOR"),0)
							nVlFrete += If(GFEXFB_5CMP(lTabTemp, cTRBCCF, @aTRBCCF1, 09,"TOTFRE") == "1",GFEXFB_5CMP(lTabTemp, cTRBCCF, @aTRBCCF1, 09,"VALOR"),0)

							GV2->( dbSetOrder(1) )
							GV2->( dbSeek( xFilial("GV2") + GFEXFB_5CMP(lTabTemp, cTRBCCF, @aTRBCCF1, 09,"CDCOMP") ) )

							RecLock(cxAliasCmp, .T.)
							(cxAliasCmp)->NRCALC := GFEXFB_5CMP(lTabTemp, cTRBTRE, @aTRBTRE1, 07,"NRCALC")
							(cxAliasCmp)->CDCOMP := GFEXFB_5CMP(lTabTemp, cTRBCCF, @aTRBCCF1, 09,"CDCOMP")
							(cxAliasCmp)->DSCOMP := GV2->GV2_DSCOMP
							(cxAliasCmp)->QTDE   := GFEXFB_5CMP(lTabTemp, cTRBCCF, @aTRBCCF1, 09,"QTDE")
							(cxAliasCmp)->VALOR  := GFEXFB_5CMP(lTabTemp, cTRBCCF, @aTRBCCF1, 09,"VALOR")
							(cxAliasCmp)->( MsUnlock() )

							If ( nPos := aScan( aComponentes, { |aOpc| aOpc[1] == cCDTRP .And. aOpc[2] == GFEXFB_5CMP(lTabTemp, cTRBCCF, @aTRBCCF1, 09,"CDCOMP") } ) ) <= 0
								aadd( aComponentes, { cCDTRP, GFEXFB_5CMP(lTabTemp, cTRBCCF, @aTRBCCF1, 09,"CDCOMP"), nVlrCCF } )
							Else
								// TAXA                         Qt Entrega                   Valor p/ RC
								If GV2->GV2_CATVAL == "3" .And. GV2->GV2_ATRCAL == "7" .And. GV2->GV2_IDVLRC != "1"
									// Não somar 2 vezes pois componente cadastrado errado...
									If aComponentes[nPos,3] < nVlrCCF
										aComponentes[nPos,3] := nVlrCCF
									EndIf
								ElseIf GV2->GV2_IDVLRC != "1" .And. !lFrViagem .And. cFechada <> "S"
									aComponentes[nPos,3] += nVlrCCF
								Else
									If aComponentes[nPos,3] < nVlrCCF
										aComponentes[nPos,3] := nVlrCCF
									EndIf
								EndIf
							Endif

							GFEXFB_1AREA(lTabTemp,cTRBCCF, @aTRBCCF1)
							GFEXFB_8SKIP(lTabTemp, cTRBCCF, 09)
						EndDo
					EndIf

					(cxAliasFrt)->( dbSetOrder( 1 ) )
					(cxAliasFrt)->( dbGoTop() )
					IF !(cxAliasFrt)->( dbSeek( GFEXFB_5CMP( lTabTemp, cTRBTRE , @aTRBTRE1, 07, "NRDC"   )))

						RecLock(cxAliasFrt,.T.)
						(cxAliasFrt)->C5_NUM   := GFEXFB_5CMP( lTabTemp, cTRBTRE , @aTRBTRE1, 07, "NRDC"   )
						(cxAliasFrt)->SEQ      := GFEXFB_5CMP( lTabTemp, cTRBTRE , @aTRBTRE1, 07, "SEQ"    ) 
						(cxAliasFrt)->NRCALC   := GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "NRCALC" )
						(cxAliasFrt)->TIPO     := GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "TIPO"   ) // 1-Redespacho | 2-Primeiro Trecho
						(cxAliasFrt)->TPFRET   := GFEXFB_5CMP( lTabTemp, cTRBDOC , @aDocCarg, 01, "TPFRET" ) // 1-CIF | 2-CIF com Redes | 3-FOB
						(cxAliasFrt)->ORIGEM   := GFEXFB_5CMP( lTabTemp, cTRBTRE , @aTRBTRE1, 07, "ORIGEM" )
						(cxAliasFrt)->DESTIN   := GFEXFB_5CMP( lTabTemp, cTRBTRE , @aTRBTRE1, 07, "DESTIN" )
						(cxAliasFrt)->NRGRUP   := GFEXFB_5CMP( lTabTemp, cTRBTRE , @aTRBTRE1, 07, "NRGRUP" )
//						If nTotFrete != 0
							(cxAliasFrt)->VLPIS    := GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "VLPIS"  )
							(cxAliasFrt)->VLCOFI   := GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "VLCOFI" )
							(cxAliasFrt)->VLISS    := GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "VLISS"  )
							(cxAliasFrt)->VLICMS   := GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "VLICMS" )
//						EndIf
						If ValType(dDtPrev) == "D"
							(cxAliasFrt)->DTPREN   := dDtPrev
						EndIf
						(cxAliasFrt)->CDTRP    := cCDTRP
						(cxAliasFrt)->VLRFRETE := nVlFrete

						(cxAliasFrt)->FECHADA  := cFechada
						(cxAliasFrt)->FRVIAGEM := If( lFrViagem, "S", "N" )
						If Empty( GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "CALBAS" ) )
							(cxAliasFrt)->AGRUPADO := "N"
						Else
							(cxAliasFrt)->AGRUPADO := "S"
						EndIf

						SA4->( dbSetOrder(1) )

						If Empty( (cxAliasFrt)->CDTRP ) == .F. .And. SA4->( dbSeek( xFilial("SA4") + (Posicione("GU3",1,xFilial("GU3") + (cxAliasFrt)->CDTRP,"GU3_CDERP")))) //(cxAliasFrt)->CDTRP )
							(cxAliasFrt)->A4_COD  := SA4->A4_COD
							(cxAliasFrt)->A4_NOME := SA4->A4_NOME


						EndIf
						If cFechada == "S" .Or. lFrViagem
							If GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "VLPIS"  ) > (cxAliasFrt)->VLPIS
								(cxAliasFrt)->VLPIS   := GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "VLPIS"  )
							EndIf
							If GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "VLCOFI" ) > (cxAliasFrt)->VLCOFI
								(cxAliasFrt)->VLCOFI  := GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "VLCOFI" )
							EndIf
						ElseIf cAgrupado <> "S"					
							//(cxAliasTra)->VLRISS  += (cTRBUNC)->VLISS
							//(cxAliasTra)->VLRICMS += (cTRBUNC)->VLICMS
							(cxAliasFrt)->VLPIS   += GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "VLPIS"  )
							(cxAliasFrt)->VLCOFI  += GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "VLCOFI" )						
						EndIf
						(cxAliasFrt)->( MsUnlock() )
					EndIf

					If (cxAliasTra)->( dbSeek( SA4->A4_COD + (cxAliasFrt)->SEQ ) )
						RecLock(cxAliasTra,.F.)
					Else
						RecLock(cxAliasTra,.T.)
						(cxAliasTra)->SEQ      := (cxAliasFrt)->SEQ
						(cxAliasTra)->A4_COD   := (cxAliasFrt)->A4_COD
						(cxAliasTra)->A4_NOME  := (cxAliasFrt)->A4_NOME
						(cxAliasTra)->CDTRP    := (cxAliasFrt)->CDTRP
						(cxAliasTra)->ORIGEM   := (cxAliasFrt)->ORIGEM
						(cxAliasTra)->VLNEG    := 0
						(cxAliasTra)->VLRFRETE := 0
					EndIf

					If cFechada == "S" .Or. lFrViagem
						If GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "VLISS"  ) > (cxAliasTra)->VLRISS
							(cxAliasTra)->VLRISS  := GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "VLISS"  )
						EndIf
						If GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "VLICMS" ) > (cxAliasTra)->VLRICMS 
							(cxAliasTra)->VLRICMS := GFEXFB_5CMP( lTabTemp, cTRBUNC , @aTRBUNC1, 06, "VLICMS" )
						EndIf
					Endif

					(cxAliasTra)->( MsUnlock() )

					GFEXFB_1AREA(lTabTemp,cTRBTCF, @aTRBTCF1)
					GFEXFB_8SKIP(lTabTemp, cTRBTCF, 05)
				EndDo
			EndIf		

			//				GFEXFB_1AREA(lTabTemp,cTRBTRE, @aTRBTRE1)
			//				GFEXFB_8SKIP(lTabTemp, cTRBTRE, 07)
			//			EndDo

			GFEXFB_1AREA(lTabTemp,cTRBUNC, @aTRBUNC1) //dbSelectArea(cTRBUNC)
			GFEXFB_8SKIP(lTabTemp, cTRBUNC, 6) //dbSkip()
		EndDo

		(cxAliasTra)->( dbGoTop() )
		While (cxAliasTra)->( Eof() ) == .F.
			For nPos := 1 To Len( aComponentes )
				If aComponentes[nPos,1] == (cxAliasTra)->CDTRP
					(cxAliasTra)->VLRFRETE += aComponentes[nPos,3]
				EndIf
			Next

			GetVlNeg()

			(cxAliasTra)->( dbSkip() )
		EndDo


	Else


		If Len( aRet ) >= 2 .And. Empty(aRet[2]) = .F.
			cTxtLog := MemoRead(AllTrim(aRet[2]))
		EndIf

		If Empty( cTxtLog )
			cTxtLog := "Simulação Falhou. Sem Log."
		EndIf
	EndIf
Return { aRet[1], cTxtLog, aRet }

// Calculo Inativo...
Static Function GFE_Carga2()
	Local oModelSim  	:= FWLoadModel("GFEX010")
	Local oModelNeg  	:= oModelSim:GetModel("GFEX010_01")
	Local oModelAgr  	:= oModelSim:GetModel("DETAIL_01")  // oModel do grid "Agrupadores"
	Local oModelDC   	:= oModelSim:GetModel("DETAIL_02")  // oModel do grid "Doc Carga"
	Local oModelIt   	:= oModelSim:GetModel("DETAIL_03")  // oModel do grid "Item Carga"
	Local oModelTr   	:= oModelSim:GetModel("DETAIL_04")  // oModel do grid "Trechos"
	Local oModelInt  	:= oModelSim:GetModel("SIMULA")     // oModel do field que dispara a simulação
	Local oModelCal1 	:= oModelSim:GetModel("DETAIL_05")  // oModel do calculo do frete
	Local oModelCal2 	:= oModelSim:GetModel("DETAIL_06")  // oModel das informações complemetares do calculo
	Local oModelCal3	:= oModelSim:GetModel("DETAIL_07")  // oModel do terceiro grid da aba de "Cálculos"
	Local oModelOI1	:= oModelSim:GetModel("DETAIL_08")  // oModel do primeiro grid da aba de "Outras informações"
	Local oModelOI2	:= oModelSim:GetModel("DETAIL_09")  // oModel do segundo grid da aba de "Outras informações"

	// Excluir Depois
	Local aAuxAgrFrt  := {}
	Local aAgrFrt     := {}
	Local aAuxDocCarg := {}
	Local aDocCarg    := {}
	Local aAuxTrchDoc := {}
	Local atrchDoc    := {}
	Local aAuxItDoc   := {}
	Local aItDoc      := {}

	Local aRet        := { .F. }
	//Local aFrete      := {}
	Local aAuxFrete   := {}
	Local cTxtLog     := ""

	Local nRegua      := 0
	Local cAgrup      := "ROMANEIO"
	Local cCdClFr     := ""    //-- Simulacao de frete: considerar todas a negociacoes cadastradas no GFE.
	Local cTpOp       := ""    //-- Simulacao de frete: considerar todas a negociacoes cadastradas no GFE.
	Local cTpDoc      := "NFS"
	Local nTotFrete   := 0

	Local nAux        := 0

	Local cxAlias     := GetNextAlias()
	Local cTpVeic     := ""
	Local cFechada    := ""
	Local nTotalPed   := 0
	Local aTotalItem  := {}

	Local lItemPri    := .T.

	Private cTRBCCF, cTRBITE, cTRBTRE, cTRBTCF, cTRBUNC, cTRBGRU, cTRBDOC, cTRBAGRU, cTRBSIM    //variaveis utilizadas na rotina de calculo de frete
	Private cArqCCF, cArqITE, cArqTRE, cArqTCF, cArqUNC, cArqGRU, cArqDOC, cArqAGR,  cArqSIM    //variaveis utilizadas na rotina de calculo de frete

	If !Empty( cCodVeic )
		DA3->( dbSetOrder(1) )
		If DA3->( dbSeek( xFilial("DA3") + cCodVeic ) )
			cTpVeic := DA3->DA3_TIPVEI
		EndIf
	EndIf
	nPedidos := 0

	DAI->( dbSeek( xFilial("DAI") + DAK->DAK_COD + DAK->DAK_SEQCAR ) )
	While !DAI->( Eof() ) .And. DAI->DAI_COD = DAK->DAK_COD .And. DAI->DAI_SEQCAR = DAK->DAK_SEQCAR

		nRegua++
		DAI->( dbSkip() )
	End

	ProcRegua(nRegua)

	oModelSim:SetOperation(3) //Seta como inclusão
	oModelSim:Activate() 			

	oModelNeg:LoadValue('CONSNEG' , "2" ) // 1=Considera Tab.Frete em Negociacao; 2=Considera apenas Tab.Frete Aprovadas

	//Agrupadores - Não obrigatorio
	oModelAgr:LoadValue('GWN_CDCLFR', cCdClFr    ) // Classificação de frete                                 
	oModelAgr:LoadValue('GWN_CDTPOP', cTpOp      ) // Tipo da operação
	oModelAgr:LoadValue('GWN_DOC'   , cAgrup     )
	If nKM <> 0           
		oModelAgr:LoadValue('GWN_DISTAN', nKM        )
	EndIf           

	DAI->( dbSeek( xFilial("DAI") + DAK->DAK_COD + DAK->DAK_SEQCAR ) )
	While !DAI->( Eof() ) .And. DAI->DAI_COD = DAK->DAK_COD .And. DAI->DAI_SEQCAR = DAK->DAK_SEQCAR

		IncProc()

		nPedidos++

		nTotalPed := GFE_TotPed( DAI->DAI_PEDIDO, @aTotalItem )

		SC5->( dbSetOrder(1) )
		SC5->( dbSeek( xFilial("SC5") + DAI->DAI_PEDIDO ) )

		If !Empty(SC5->C5_CLIENT) .And. !Empty(SC5->C5_LOJAENT)

			RecLock(cxAliasPed,.T.)
			(cxAliasPed)->STATUS     := " "
			(cxAliasPed)->C5_NUM     := DAI->DAI_PEDIDO
			(cxAliasPed)->C5_CLIENTE := SC5->C5_CLIENTE
			(cxAliasPed)->C5_LOJACLI := SC5->C5_LOJACLI
			(cxAliasPed)->DAI_PESO   := DAI->DAI_PESO
			(cxAliasPed)->DAI_CAPVOL := DAI->DAI_CAPVOL
			(cxAliasPed)->TOTALPED   := nTotalPed
			If SC5->C5_TIPO $ "BD"
				SA2->( dbSetOrder(1) )
				If SA2->( dbSeek( xFilial("SA2") + SC5->C5_CLIENTE + SC5->C5_LOJACLI ) )
					(cxAliasPed)->A1_NOME := SA2->A2_NOME
					(cxAliasPed)->A1_EST  := SA2->A2_EST
				EndIf
			Else
				SA1->( dbSetOrder(1) )
				If SA1->( dbSeek( xFilial("SA1") + SC5->C5_CLIENTE + SC5->C5_LOJACLI ) )
					(cxAliasPed)->A1_NOME := SA1->A1_NOME
					(cxAliasPed)->A1_EST  := SA1->A1_EST
				EndIf
			EndIf		
			(cxAliasPed)->EMITGFE := "N"

			GU3->( dbSetOrder(11) )
			If SC5->C5_TIPO $ "BD"
				SA2->( dbSeek( xFilial("SA2") + SC5->C5_CLIENT + SC5->C5_LOJAENT ) )
				If GU3->( dbSeek( xFilial("GU3") + SA2->A1_CGC ) )
					If GU3->GU3_FORN = "1"
						(cxAliasPed)->EMITGFE := "S"
					EndIf
				EndIf
			Else
				SA1->( dbSeek( xFilial("SA1") + SC5->C5_CLIENT + SC5->C5_LOJAENT ) )
				If GU3->( dbSeek( xFilial("GU3") + SA1->A1_CGC ) )
					If GU3->GU3_CLIEN = "1"
						(cxAliasPed)->EMITGFE := "S"
					EndIf
				EndIf
			EndIf
			(cxAliasPed)->( MsUnlock() )

			//Documento de Carga
			If nPedidos <> 1
				oModelDC:AddLine(.T.)
			EndIf
			oModelDC:LoadValue('GW1_EMISDC', c_EmiRem ) //codigo do emitente - chave
			oModelDC:LoadValue('GW1_NRDC'  , SC5->C5_NUM ) //numero da nota - chave
			oModelDC:LoadValue('GW1_CDTPDC', cTpDoc      ) // tipo do documento - chave
			oModelDC:LoadValue('GW1_CDREM' , c_EmiRem ) //remetente
			If SC5->C5_TIPO $ "BD"
				oModelDC:LoadValue('GW1_CDDEST', c_Dest ) //destinatario
			Else
				oModelDC:LoadValue('GW1_CDDEST', c_Dest ) //destinatario
			EndIf
			oModelDC:LoadValue('GW1_TPFRET', "1"    )
			oModelDC:LoadValue('GW1_ICMSDC', "2"    )
			oModelDC:LoadValue('GW1_USO'   , "1"    )
			oModelDC:LoadValue('GW1_QTUNI' , 1      )   
			oModelDC:LoadValue('GW1_NRROM' , cAgrup )   

			//Armazenando os Trechos (Redespachos)
			cSeq := "01"
			For nAux := 1 to Len( aRedesp )
				If !Empty(aRedesp[nAux])

					//Trechos
					If cSeq <> "01"
						oModelTr:AddLine(.T.)
					EndIf
					oModelTr:LoadValue('GWU_EMISDC' , c_EmiRem   ) //codigo do emitente - chave
					oModelTr:LoadValue('GWU_NRDC'   , SC5->C5_NUM   ) //numero da nota - chave
					oModelTr:LoadValue('GWU_CDTPDC' , cTpDoc        ) // tipo do documento - chave
					oModelTr:LoadValue('GWU_SEQ'    , cSeq          ) //sequencia - chave
					oModelTr:LoadValue('GWU_NRCIDD' , aRedesp[nAux] ) // codigo da cidade para o calculo
					If !Empty( cTpVeic ) .And. cSeq = "01"
						oModelTr:LoadValue('GWU_CDTPVC' , cTpVeic   ) // codigo da cidade para o calculo
					EndIf

					cSeq := Soma1(cSeq)
				EndIf
			Next

			// Destino Final
			If cSeq <> "01"
				oModelTr:AddLine(.T.)
			EndIf
			oModelTr:LoadValue('GWU_EMISDC' , c_EmiRem ) //codigo do emitente - chave
			oModelTr:LoadValue('GWU_NRDC'   , SC5->C5_NUM ) //numero da nota - chave
			oModelTr:LoadValue('GWU_CDTPDC' , cTpDoc      ) // tipo do documento - chave
			oModelTr:LoadValue('GWU_SEQ'    , cSeq        ) //sequencia - chave
			oModelTr:LoadValue('GWU_NRCIDD' , AllTrim(TMS120CdUf(SA1->A1_EST, "1") + SA1->A1_COD_MUN))   // codigo da cidade para o calculo

			//Armazenando o valor dos Itens de carga 
			BeginSql Alias cxAlias
			SELECT SC9.C9_ITEM, SC9.C9_PRODUTO, SB1.B1_DESC, SC9.C9_QTDLIB,
			SC9.C9_QTDLIB * SB1.B1_PESBRU AS PESOB,
			0 AS PESOC,
			SC6.C6_VALOR / SC6.C6_QTDVEN * SC9.C9_QTDLIB AS C6_VALOR
			FROM %table:SC9% SC9
			INNER JOIN %table:SB1% SB1 ON SB1.%NotDel% AND SB1.B1_FILIAL = %xFilial:SB1%
			AND SB1.B1_COD = SC9.C9_PRODUTO
			INNER JOIN %table:SC6% SC6 ON SC6.%NotDel% AND SC6.C6_FILIAL = %xFilial:SC6%
			AND SC6.C6_NUM = SC9.C9_PEDIDO AND SC6.C6_ITEM = SC9.C9_ITEM
			WHERE SC9.%NotDel%
			AND SC9.C9_FILIAL = %xFilial:SC9%
			AND SC9.C9_CARGA = %exp:DAI->DAI_COD%
			AND SC9.C9_SEQCAR = %exp:DAI->DAI_SEQCAR%
			AND SC9.C9_PEDIDO = %exp:DAI->DAI_PEDIDO%
			EndSql

			While !(cxAlias)->( Eof() )

				nxValorTotal := (cxAlias)->C6_VALOR
				If ( nPos := aScan( aTotalItem, { |aOpc| aOpc[1] == (cxAlias)->C9_PRODUTO } ) ) > 0
					nxValorTotal := aTotalItem[nPos,3] / aTotalItem[nPos,2] * (cxAlias)->C9_QTDLIB
				EndIf

				If !lItemPri
					oModelIt:AddLine(.T.)
				EndIf

				//Itens								
				oModelIt:LoadValue('GW8_EMISDC', c_EmiRem ) // codigo do emitente - chave
				oModelIt:LoadValue('GW8_NRDC'  , SC5->C5_NUM ) // numero da nota - chave
				oModelIt:LoadValue('GW8_CDTPDC', cTpDoc      ) // tipo do documento - chave
				oModelIt:LoadValue('GW8_ITEM'  , (cxAlias)->C9_PRODUTO  ) //codigo do item    -
				oModelIt:LoadValue('GW8_DSITEM', (cxAlias)->B1_DESC     ) //descrição do item -
				oModelIt:LoadValue('GW8_CDCLFR', cCdClFr                ) //classificação de frete
				oModelIt:LoadValue('GW8_QTDE'  , (cxAlias)->C9_QTDLIB   ) //Quantidade do Item
				oModelIt:LoadValue('GW8_PESOR' , (cxAlias)->PESOB       ) //peso real
				oModelIt:LoadValue('GW8_PESOC' , (cxAlias)->PESOC       ) //peso cubado
				oModelIt:LoadValue('GW8_VALOR' , nxValorTotal           ) //valor do item
				oModelIt:LoadValue('GW8_TRIBP' , "1"                    ) // Trib PIS
				If GW8->( FieldPos( "GW8_TRIBC" ) ) > 0
					oModelIt:LoadValue('GW8_TRIBC' , "1"                ) // Trib COFINS
				EndIf
				lItemPri := .F.

				(cxAlias)->( dbSkip() )
			End
			(cxAlias)->( dbCloseArea() )
		EndIf
		DAI->( dbSkip() )
	End

	//Limpando os dados dos grid caso haja informações de uma simulação anterior
	oModelCal1:DeActivate(.T.)
	oModelCal1:Activate()
	oModelCal2:DeActivate(.T.)
	oModelCal2:Activate() 
	oModelCal3:DeActivate(.T.)
	oModelCal3:Activate()
	oModelOI1:DeActivate(.T.)  
	oModelOI1:Activate()  
	oModelOI2:DeActivate(.T.) 
	oModelOI2:Activate() 

	oModelCal1:setNoUpdateLine(.F.)
	oModelCal2:setNoUpdateLine(.F.)
	oModelCal3:setNoUpdateLine(.F.)

	If &("StaticCall( GFEX010, GFEX010VAL, oModelAgr, oModelDC, oModelIt, oModelTr )")

		// Dispara a simulação
		oModelInt:SetValue("INTEGRA" ,"A") 	

		//Verifica se há linhas no model do calculo, se não há linhas significa que a simulação falhou
		If oModelCal1:GetQtdLine() > 1 .Or. !Empty( oModelCal1:GetValue('C1_NRCALC'  ,1) )
			//Percorre o grid, cada linha corresponde a um calculo diferente
			//		For nCont := 1 to oModelCal1:GetQtdLine()
			//			oModelCal1:GoLine( nCont )                                 			

			/*
			DBFs Temporários
			cTRBAGRU := GFECriaTab(GetStrAgr())  // DEFINIR AGRUPADORES DE CARGA
			cTRBDOC  := GFECriaTab(GetStrDoc())  // DOCUMENTOS DE CARGA
			cTRBGRU  := GFECriaTab(GetStrGrup()) // GRUPOS DE ENTREGA
			cTRBUNC  := GFECriaTab(GetStrUNC())  // UNIDADES DE CALCULO	
			cTRBTCF  := GFECriaTab(GetStrTCF())  // TABELA DO CALCULO DE FRETE
			cTRBTRE  := GFECriaTab(GetStrTRE())  // TRECHOS DA CARGA
			cTRBITE  := GFECriaTab(GetStrITE())  // ITENS DA CARGA		
			cTRBCCF  := GFECriaTab(GetStrCCF())  // COMPONENTE DO CALCULO DE FRETE
			*/


			While .F. //MsgYesNo("Exibir Tabelas?")
				// Descriçao dos TMPs em GFEXFUNB.prw
				//cTRBAGRU->( dbGoTop() )
				//cTRBDOC->( dbGoTop() )
				//cTRBGRU->( dbGoTop() )
				cTRBUNC->( dbGoTop() )			
				cTRBTCF->( dbGoTop() )			
				cTRBGRU->( dbGoTop() )			
				cTRBTRE->( dbGoTop() )			
				cTRBCCF->( dbGoTop() )			

				//u_dbEdit( cTRBAGRU )
				//u_dbEdit( cTRBDOC )
				//u_dbEdit( cTRBGRU )
				u_dbEdit( cTRBUNC )
				u_dbEdit( cTRBTCF )
				u_dbEdit( cTRBGRU )
				u_dbEdit( cTRBTRE )
				u_dbEdit( cTRBCCF )
			End


			//Armazenar os valores dos grids que precisam de informações
			(cTRBUNC)->( dbSetOrder(1) )
			(cTRBUNC)->( dbGoTop() )
			While !(cTRBUNC)->( Eof() )

				cFechada := "N"

				(cTRBTCF)->( dbSetOrder(1) )
				If (cTRBTCF)->( dbSeek((cTRBUNC)->NRCALC) )

					// Negociação Tabela de Frete
					GV9->( dbSetOrder(1) )
					If GV9->( dbSeek( xFilial("GV9") + (cTRBTCF)->CDTRP + (cTRBTCF)->NRTAB + (cTRBTCF)->NRNEG ) )
						// "1" = Carga Fracionada | "2" = Carga Fechada
						If GV9->GV9_TPLOTA == "2"
							cFechada := "S"
						EndIf
					EndIf

					(cTRBGRU)->( dbSetOrder(3) )
					(cTRBGRU)->( dbSeek((cTRBTCF)->NRGRUP) )
				EndIf

				(cTRBTRE)->( dbSetOrder(1) )
				(cTRBTRE)->( dbSeek( (cTRBUNC)->NRCALC ) )
				//If !(cTRBTRE)->( dbSeek( (cTRBUNC)->NRCALC ) )
				//	(cTRBTRE)->( dbSeek( (cTRBUNC)->CALBAS ) )
				//EndIf
				While !(cTRBTRE)->( Eof() ) .And. (cTRBTRE)->NRCALC = (cTRBUNC)->NRCALC

					//Calculando total do frete simulado
					nTotFrete := 0
					(cTRBTCF)->( dbSetOrder(1) )
					If (cTRBTCF)->( dbSeek( Alltrim((cTRBUNC)->NRCALC) ) )
						(cTRBCCF)->( dbSetOrder(3) )
						If (cTRBCCF)->( dbSeek((cTRBTCF)->NRCALC) )
							While !(cTRBCCF)->(Eof()) .And. (cTRBCCF)->NRCALC  == (cTRBTCF)->NRCALC

								If (cTRBCCF)->TOTFRE == '1'
									nTotFrete := nTotFrete + (cTRBCCF)->VALOR
									If (cTRBCCF)->CATVAL == '2'
										cFechada := "S"
									EndIf
								EndIf

								(cTRBCCF)->( dbSkip() )
							EndDo
						EndIf
					EndIf

					RecLock(cxAliasFrt,.T.)
					(cxAliasFrt)->C5_NUM   := Left((cTRBTRE)->NRDC,TamSX3("C5_NUM")[1])
					(cxAliasFrt)->SEQ      := (cTRBTRE)->SEQ    // Trecho
					(cxAliasFrt)->NRCALC   := (cTRBUNC)->NRCALC
					(cxAliasFrt)->TIPO     := (cTRBUNC)->TIPO
					(cxAliasFrt)->TPFRET   := (cTRBGRU)->TPFRET
					(cxAliasFrt)->ORIGEM   := (cTRBTRE)->ORIGEM
					(cxAliasFrt)->DESTIN   := (cTRBTRE)->DESTIN
					(cxAliasFrt)->NRAGRU   := (cTRBUNC)->NRAGRU
					(cxAliasFrt)->VLPIS    := (cTRBUNC)->VLPIS
					(cxAliasFrt)->VLCOFI   := (cTRBUNC)->VLCOFI
					(cxAliasFrt)->VLISS    := (cTRBUNC)->VLISS
					(cxAliasFrt)->VLICMS   := (cTRBUNC)->VLICMS
					(cxAliasFrt)->DTPREN   := (cTRBUNC)->DTPREN
					(cxAliasFrt)->CDTRP    := (cTRBTCF)->CDTRP
					(cxAliasFrt)->VLRFRETE := nTotFrete
					(cxAliasFrt)->FECHADA  := cFechada

					SA4->( dbSetOrder(3) )
					If SA4->( dbSeek( xFilial("SA4") + (cTRBTCF)->CDTRP ) )
						(cxAliasFrt)->A4_COD  := SA4->A4_COD
						(cxAliasFrt)->A4_NOME := SA4->A4_NOME
					EndIf

					(cxAliasFrt)->( MsUnlock() )
					/*
					aAuxFrete := {} 	    
					aadd( aAuxFrete, SC5->C5_NUM       )
					aadd( aAuxFrete, (cTRBUNC)->NRCALC )  // C1_NRCALC
					aadd( aAuxFrete, (cTRBUNC)->TIPO   )  // C1_TPCALC
					aadd( aAuxFrete, (cTRBGRU)->TPFRET )  // C1_TPFRT
					aadd( aAuxFrete, (cTRBTRE)->ORIGEM )  // C1_CDCOLT
					aadd( aAuxFrete, POSICIONE("GU7",1,XFILIAL("GU7")+(cTRBTRE)->ORIGEM,"GU7_NMCID") )
					aadd( aAuxFrete, (cTRBTRE)->DESTIN )  // C1_CDCALC
					aadd( aAuxFrete, POSICIONE("GU7",1,XFILIAL("GU7")+(cTRBTRE)->DESTIN,"GU7_NMCID") )
					aadd( aAuxFrete, (cTRBUNC)->NRAGRU )  // C1_NRAGR
					aadd( aAuxFrete, (cTRBUNC)->VLPIS  )  // C1_VLPIS
					aadd( aAuxFrete, (cTRBUNC)->VLCOFI )  // C1_VLCOF
					aadd( aAuxFrete, (cTRBUNC)->VLISS  )  // C1_VLISS
					aadd( aAuxFrete, (cTRBUNC)->VLICMS )
					aadd( aAuxFrete, (cTRBUNC)->DTPREN )  // C1_DTPREN
					aadd( aAuxFrete, (cTRBTCF)->CDTRP  )  // C2_CDEMIT
					aadd( aAuxFrete, nTotFrete         )  // C1_VALFRT
					aadd( aFrete, aAuxFrete )
					*/

					(cTRBTRE)->( dbSkip() )
				End
				(cTRBUNC)->( dbSkip() )
			EndDo
			cTxtLog := MemoRead(AllTrim(aRet[2]))
			//Else
			//	cTxtLog := "Retorno inválido: GFECLCFRT()"
			//EndIf

			//Deletar as tabelas usadas na rotina do calculo de frete
			GFEDelTab(cTRBCCF)
			GFEDelTab(cTRBITE)
			GFEDelTab(cTRBTRE)
			GFEDelTab(cTRBTCF)
			GFEDelTab(cTRBUNC)
			GFEDelTab(cTRBGRU)
			GFEDelTab(cTRBDOC)
			GFEDelTab(cTRBAGRU)
			If !Empty(cTRBSIM)
				GFEDelTab(cTRBSIM)
			EndIf
		EndIf
	EndIf
Return { aRet[1], cTxtLog, aRet }

Static Function GFE_Pedido(aRedesp)
	Local aAuxAgrFrt  := {}
	Local aAgrFrt     := {}
	Local aAuxDocCarg := {}
	Local aDocCarg    := {}
	Local aAuxTrchDoc := {}
	Local atrchDoc    := {}
	Local aAuxItDoc   := {}
	Local aItDoc      := {}

	Local aRet        := { .F. }
	//Local aFrete      := {}
	Local aAuxFrete   := {}
	Local cTxtLog     := ""

	Local nRegua      := 0
	Local cCdClFr		:= "" //-- simulacao de frete: considerar todas a negociacoes cadastradas no GFE.
	Local cTpOp			:= "" //-- simulacao de frete: considerar todas a negociacoes cadastradas no GFE.
	Local cTpDoc		:= ''
	Local nTotFrete   := 0

	Local nAux        := 0

	Local cxAlias     := GetNextAlias()

	Private cTRBCCF, cTRBITE, cTRBTRE, cTRBTCF, cTRBUNC, cTRBGRU, cTRBDOC, cTRBAGRU, cTRBSIM    //variaveis utilizadas na rotina de calculo de frete
	Private cArqCCF, cArqITE, cArqTRE, cArqTCF, cArqUNC, cArqGRU, cArqDOC, cArqAGR,  cArqSIM    //variaveis utilizadas na rotina de calculo de frete

	SC5->( dbSetOrder(1) )
	SC5->( dbSeek( xFilial("SC5") + DAI->DAI_PEDIDO ) )

	If !Empty(SC5->C5_CLIENT) .And. !Empty(SC5->C5_LOJAENT) .And. SC5->C5_TPFRETE <> "F"
		// .And. !Empty(aCols[n,nPProduto]) .And. !Empty(aCols[n,nPQtdVen]) .And. !Empty(aCols[n,nPValor])	

		ProcRegua(nRegua)

		SA1->(dbSeek(xFilial("SA1")+SC5->C5_CLIENT+SC5->C5_LOJAENT))

		//Armazenando o valor dos agrupadores de frete 		
		aAuxAgrFrt := {}
		AADD(aAuxAgrFrt, "" )       // GWN_NRROM  - Numero do Agrupador
		AADD(aAuxAgrFrt, "" )       // GWN_CDTRP  - Transportador (GU3)
		AADD(aAuxAgrFrt, "" )       // GWN_CDTPVC - Tipo de Veiculo - F3[GV3]
		AADD(aAuxAgrFrt, cCdClFr )  // GWN_CDCLFR - Classificacao de Frete
		AADD(aAuxAgrFrt, cTpOp )    // GWN_CDTPOP - Tipo de Operacao (GV4)
		AADD(aAuxAgrFrt, 0 )        // GWN_DISTAN - Distancia Percorrida
		AADD(aAuxAgrFrt, "" )       // GWN_NRCIDD - Cidade Destino
		AADD(aAuxAgrFrt, "" )       // GWN_CEPD   - CEP Destino

		AADD(aAgrFrt, aAuxAgrFrt)

		//Documento de Carga
		aAuxDocCarg   := {}
		AADD(aAuxDocCarg, c_EmiRem ) // GW1_EMISDC - Emitente do Documento
		AADD(aAuxDocCarg, "" )          // GW1_SERDC  - Serie do Documento
		AADD(aAuxDocCarg, SC5->C5_NUM ) // GW1_NRDC   - Numero do Documento
		AADD(aAuxDocCarg, cTpDoc )      // GW1_CDTPDC - Tipo do Documento
		AADD(aAuxDocCarg, c_EmiRem ) // GW1_CDREM  - Remetente do Documento
		AADD(aAuxDocCarg, c_Dest ) // GW1_CDDEST - Destinatario do Documento
		AADD(aAuxDocCarg, "" )          // GW1_ENTEND - Endereco de Entrega
		AADD(aAuxDocCarg, "" )          // GW1_ENTBAI - Bairro de entrega
		AADD(aAuxDocCarg, "" )          // GW1_ENTNRC - Cidade de Entrega
		AADD(aAuxDocCarg, "" )          // GW1_ENTCEP - CEP de Entrega
		AADD(aAuxDocCarg, "" )          // GW1_NRREG  - Região de destino
		AADD(aAuxDocCarg, "1" )         // GW1_TPFRET - Tipo de Frete
		AADD(aAuxDocCarg, "2" )         // GW1_ICMSDC - ICMS?
		AADD(aAuxDocCarg, "1" )         // GW1_USO    - Finalidade da mercadoria
		AADD(aAuxDocCarg, "" )          // GW1_CARREG - Número do carregamento
		AADD(aAuxDocCarg, "" )          // GW1_NRROM  - Numero do Agrupador
		AADD(aAuxDocCarg, 1 )           // GW1_QTUNI  - Quantidade de Unitizadores

		AADD(aDocCarg, aAuxDocCarg)


		//Armazenando os Trechos (Redespachos)
		cSeq := "01"
		For nAux := 1 to Len( aRedesp )
			If !Empty(aRedesp[nAux])
				aAuxTrchDoc := {}
				AADD(aAuxTrchDoc, c_EmiRem )   // GWU_EMISDC - Emitente do Documento
				AADD(aAuxTrchDoc, "" )            // GWU_SERDC  - Serie do Documento
				AADD(aAuxTrchDoc, SC5->C5_NUM )   // GWU_NRDC   - Numero do Documento
				AADD(aAuxTrchDoc, cTpDoc )        // GWU_CDTPDC - Tipo do Documento
				AADD(aAuxTrchDoc, cSeq )          // GWU_SEQ    - Sequencia do Trecho
				AADD(aAuxTrchDoc, "" )            // GWU_CDTRP  - Transportador do Trecho
				AADD(aAuxTrchDoc, aRedesp[nAux] ) // GWU_NRCIDD - Cidade Destino
				If !Empty( cTpVeic ) .And. cSeq = "01"
					AADD(aAuxTrchDoc, cTpVeic )    // GWU_CDTPVC - Tipo de Veiculo do Trecho - F3[GV3]
				Else
					AADD(aAuxTrchDoc, "" )         // GWU_CDTPVC - Tipo de Veiculo do Trecho - F3[GV3]
				EndIf
				AADD(aAuxTrchDoc, "1" )           // Paga o trecho ou nao (sempre pagar '1')

				AADD(aTrchDoc, aAuxTrchDoc)

				cSeq := Soma1(cSeq)
			EndIf
		Next

		// Destino Final
		aAuxTrchDoc := {}
		AADD(aAuxTrchDoc, c_EmiRem ) // GWU_EMISDC - Emitente do Documento
		AADD(aAuxTrchDoc, "" )          // GWU_SERDC  - Serie do Documento
		AADD(aAuxTrchDoc, SC5->C5_NUM ) // GWU_NRDC   - Numero do Documento
		AADD(aAuxTrchDoc, cTpDoc )      // GWU_CDTPDC - Tipo do Documento
		AADD(aAuxTrchDoc, cSeq )        // GWU_SEQ    - Sequencia do Trecho
		AADD(aAuxTrchDoc, "" )          // GWU_CDTRP  - Transportador do Trecho
		AADD(aAuxTrchDoc, AllTrim(TMS120CdUf(SA1->A1_EST, "1") + SA1->A1_COD_MUN) )  // GWU_NRCIDD - Cidade Destino
		AADD(aAuxTrchDoc, "" )          // GWU_CDTPVC - Tipo de Veiculo do Trecho - F3[GV3]
		//AADD(aAuxTrchDoc, cTpVeic )     // GWU_CDTPVC - Tipo de Veiculo do Trecho - F3[GV3]
		AADD(aAuxTrchDoc, "1" )         // Paga o trecho ou nao (sempre pagar '1')

		AADD(aTrchDoc, aAuxTrchDoc)

		IncProc()

		//Armazenando o valor dos Itens de carga 
		BeginSql Alias cxAlias
		SELECT SC9.C9_ITEM, SC9.C9_PRODUTO, SB1.B1_DESC, SC9.C9_QTDLIB,
		SC9.C9_QTDLIB * SB1.B1_PESBRU AS PESOB,
		0 AS PESOC,
		SC6.C6_VALOR / SC6.C6_QTDVEN * SC9.C9_QTDLIB AS C6_VALOR
		FROM %table:SC9% SC9
		INNER JOIN %table:SB1% SB1 ON SB1.%NotDel% AND SB1.B1_FILIAL = %xFilial:SB1%
		AND SB1.B1_COD = SC9.C9_PRODUTO
		INNER JOIN %table:SC6% SC6 ON SC6.%NotDel% AND SC6.C6_FILIAL = %xFilial:SC6%
		AND SC6.C6_NUM = SC9.C9_PEDIDO AND SC6.C6_ITEM = SC9.C9_ITEM
		WHERE SC9.%NotDel%
		AND SC9.C9_FILIAL = %xFilial:SC9%
		AND SC9.C9_CARGA = %exp:DAI->DAI_COD%
		AND SC9.C9_SEQCAR = %exp:DAI->DAI_SEQCAR%
		AND SC9.C9_PEDIDO = %exp:DAI->DAI_PEDIDO%
		EndSql

		While !(cxAlias)->( Eof() )

			aAuxItDoc := {}
			AADD(aAuxItDoc, c_EmiRem )           // GW8_EMISDC - Emitente do Documento
			AADD(aAuxItDoc, "" )                    // GW8_SERDC  - Serie do Documento
			AADD(aAuxItDoc, SC5->C5_NUM )           // GW8_NRDC   - Numero do Documento
			AADD(aAuxItDoc, cTpDoc )                // GW8_CDTPDC - Tipo do Documento
			AADD(aAuxItDoc, (cxAlias)->C9_PRODUTO ) // GW8_ITEM   - Item
			AADD(aAuxItDoc, cCdClFr )               // GW8_CDCLFR - Classificacao de Frete
			AADD(aAuxItDoc, "" )                    // GW8_TPITEM - Tipo de Item
			AADD(aAuxItDoc, (cxAlias)->C9_QTDLIB )  // GW8_QTDE   - Quantidade do Item
			AADD(aAuxItDoc, (cxAlias)->PESOB )      // GW8_PESOR  - Peso Bruto do Item
			AADD(aAuxItDoc, (cxAlias)->PESOC )      // GW8_PESOC  - Peso Cubado
			AADD(aAuxItDoc, 0 )                     // GW8_QTDALT - Peso Cubado
			AADD(aAuxItDoc, (cxAlias)->C6_VALOR )   // GW8_VALOR  - Valor do Item
			AADD(aAuxItDoc, 0 )                     // GW8_VOLUME - Volume ocupado (m3)
			AADD(aAuxItDoc, "1" )                   // GW8_TRIBP  - Trib PIS
			AADD(aAuxItDoc, "1" )                   // GW8_TRIBC  - Trib COFINS

			AADD(aItDoc, aAuxItDoc)

			(cxAlias)->( dbSkip() )
		End

		IncProc()

		//rodando a rotina do calculo de frete
		If Len(aDocCarg) != 0 .And. Len(aTrchDoc) != 0 .And. Len(aItDoc) != 0
			/*
			GFEXFUNB.PRW -> GFECLCFRT()
			@param  1 aAgrFrt        Agrupadores de Frete -> Romaneios
			@param  2 aDocCarg       Documentos de Carga -> NF, etc.
			@param  3 aTrchDoc       Trechos do Documento de Carga
			@param  4 aItDoc         Itens do Documento de Carga
			@param  5 [aTblFrt]      Tabela de Frete
			@param  6 [lReal]        Calculo Real? (ou simulacao) default = .T.
			@param  7 [iLogProc]     Apresenta log ao final do processo? 0: Não apresentar, 1: Somente erros, 2: Sempre
			@param  8 [lTabProv]     Cálculo de Provisão? default = .F.
			@param  9 [lParCons]     Considerar Tabelas de frete com a situação 'Em negociação'? default = .F.
			@param 10 [iTpSimul]     Tipo de simulação: 0=simulação geral, 1=simulação específica default 0
			*/
			//                 1        2         3         4      5  6    7 8  9
			aRet := GFECLCFRT( aAgrFrt, aDocCarg, aTrchDoc, aItDoc, , .F., 0, , .F. )
		EndIf

		If !Empty(aRet)

			If aRet[1] // Simulação OK

				/*
				DBFs Temporários
				cTRBAGRU := GFECriaTab(GetStrAgr())  // DEFINIR AGRUPADORES DE CARGA
				cTRBDOC  := GFECriaTab(GetStrDoc())  // DOCUMENTOS DE CARGA
				cTRBGRU  := GFECriaTab(GetStrGrup()) // GRUPOS DE ENTREGA
				cTRBUNC  := GFECriaTab(GetStrUNC())  // UNIDADES DE CALCULO	
				cTRBTCF  := GFECriaTab(GetStrTCF())  // TABELA DO CALCULO DE FRETE
				cTRBTRE  := GFECriaTab(GetStrTRE())  // TRECHOS DA CARGA
				cTRBITE  := GFECriaTab(GetStrITE())  // ITENS DA CARGA		
				cTRBCCF  := GFECriaTab(GetStrCCF())  // COMPONENTE DO CALCULO DE FRETE
				*/

				/*
				While MsgYesNo("Exibir Tabelas?")			
				u_dbEdit( cTRBUNC )
				u_dbEdit( cTRBTCF )
				u_dbEdit( cTRBGRU )
				u_dbEdit( cTRBTRE )
				u_dbEdit( cTRBCCF )
				End
				*/

				//Armazenar os valores dos grids que precisam de informações
				(cTRBUNC)->( dbSetOrder(1) )
				(cTRBUNC)->( dbGoTop() )
				While !(cTRBUNC)->( Eof() )

					(cTRBTCF)->( dbSetOrder(1) )
					If (cTRBTCF)->( dbSeek((cTRBUNC)->NRCALC) )
						(cTRBGRU)->( dbSetOrder(3) )
						(cTRBGRU)->( dbSeek((cTRBTCF)->NRGRUP) )
					EndIf

					(cTRBTRE)->( dbSetOrder(1) )
					If !(cTRBTRE)->( dbSeek( (cTRBUNC)->NRCALC ) )
						(cTRBTRE)->( dbSeek( (cTRBUNC)->CALBAS ) )
					EndIf

					//Calculando total do frete simulado
					nTotFrete := 0
					(cTRBTCF)->( dbSetOrder(1) )
					If (cTRBTCF)->( dbSeek( Alltrim((cTRBUNC)->NRCALC) ) )
						(cTRBCCF)->( dbSetOrder(3) )
						If (cTRBCCF)->( dbSeek((cTRBTCF)->NRCALC) )
							While !(cTRBCCF)->(Eof()) .And. (cTRBCCF)->NRCALC  == (cTRBTCF)->NRCALC
								If !Empty( (cTRBCCF)->CDCLFR+(cTRBCCF)->CDTPOP ) .And. (cTRBCCF)->TOTFRE == '1'
									nTotFrete := nTotFrete + (cTRBCCF)->VALOR
								Elseif Empty( (cTRBCCF)->CDCLFR+(cTRBCCF)->CDTPOP ) .And. (cTRBCCF)->TOTFRE == '1'
									nTotFrete := nTotFrete + (cTRBCCF)->VALOR
								EndIf
								(cTRBCCF)->( dbSkip() )
							EndDo
						EndIf
					EndIf

					RecLock(cxAliasFrt,.T.)
					(cxAliasFrt)->C5_NUM   := SC5->C5_NUM
					(cxAliasFrt)->SEQ      := (cTRBTRE)->SEQ    // Trecho
					(cxAliasFrt)->NRCALC   := (cTRBUNC)->NRCALC
					(cxAliasFrt)->TIPO     := (cTRBUNC)->TIPO
					(cxAliasFrt)->TPFRET   := (cTRBGRU)->TPFRET
					(cxAliasFrt)->ORIGEM   := (cTRBTRE)->ORIGEM
					(cxAliasFrt)->DESTIN   := (cTRBTRE)->DESTIN
					(cxAliasFrt)->NRAGRU   := (cTRBUNC)->NRAGRU
					(cxAliasFrt)->VLPIS    := (cTRBUNC)->VLPIS
					(cxAliasFrt)->VLCOFI   := (cTRBUNC)->VLCOFI
					(cxAliasFrt)->VLISS    := (cTRBUNC)->VLISS
					(cxAliasFrt)->VLICMS   := (cTRBUNC)->VLICMS
					(cxAliasFrt)->DTPREN   := (cTRBUNC)->DTPREN
					(cxAliasFrt)->CDTRP    := (cTRBTCF)->CDTRP
					(cxAliasFrt)->VLRFRETE := nTotFrete

					SA4->( dbSetOrder(3) )
					If SA4->( dbSeek( xFilial("SA4") + (cTRBTCF)->CDTRP ) )
						(cxAliasFrt)->A4_COD  := SA4->A4_COD
						(cxAliasFrt)->A4_NOME := SA4->A4_NOME
					EndIf

					(cxAliasFrt)->( MsUnlock() )
					/*
					aAuxFrete := {} 	    
					aadd( aAuxFrete, SC5->C5_NUM       )
					aadd( aAuxFrete, (cTRBUNC)->NRCALC )  // C1_NRCALC
					aadd( aAuxFrete, (cTRBUNC)->TIPO   )  // C1_TPCALC
					aadd( aAuxFrete, (cTRBGRU)->TPFRET )  // C1_TPFRT
					aadd( aAuxFrete, (cTRBTRE)->ORIGEM )  // C1_CDCOLT
					aadd( aAuxFrete, POSICIONE("GU7",1,XFILIAL("GU7")+(cTRBTRE)->ORIGEM,"GU7_NMCID") )
					aadd( aAuxFrete, (cTRBTRE)->DESTIN )  // C1_CDCALC
					aadd( aAuxFrete, POSICIONE("GU7",1,XFILIAL("GU7")+(cTRBTRE)->DESTIN,"GU7_NMCID") )
					aadd( aAuxFrete, (cTRBUNC)->NRAGRU )  // C1_NRAGR
					aadd( aAuxFrete, (cTRBUNC)->VLPIS  )  // C1_VLPIS
					aadd( aAuxFrete, (cTRBUNC)->VLCOFI )  // C1_VLCOF
					aadd( aAuxFrete, (cTRBUNC)->VLISS  )  // C1_VLISS
					aadd( aAuxFrete, (cTRBUNC)->VLICMS )
					aadd( aAuxFrete, (cTRBUNC)->DTPREN )  // C1_DTPREN
					aadd( aAuxFrete, (cTRBTCF)->CDTRP  )  // C2_CDEMIT
					aadd( aAuxFrete, nTotFrete         )  // C1_VALFRT
					aadd( aFrete, aAuxFrete )
					*/

					(cTRBUNC)->( dbSkip() )
				EndDo
			EndIf
			cTxtLog := MemoRead(AllTrim(aRet[2]))
		Else
			cTxtLog := "Retorno inválido: GFECLCFRT()"
		EndIf

		//Deletar as tabelas usadas na rotina do calculo de frete
		GFEDelTab(cTRBCCF)
		GFEDelTab(cTRBITE)
		GFEDelTab(cTRBTRE)
		GFEDelTab(cTRBTCF)
		GFEDelTab(cTRBUNC)
		GFEDelTab(cTRBGRU)
		GFEDelTab(cTRBDOC)
		GFEDelTab(cTRBAGRU)
		If !Empty(cTRBSIM)
			GFEDelTab(cTRBSIM)
		EndIf
	EndIf
Return { aRet[1], cTxtLog, aRet }

Static Function CriarTMPs()
	Local aRet := {}
	Local cArq := ""
	Local aTMP := {}
	Local aIND := {}
	Local nAux := 0

	aadd( aTMP, { "STATUS"  , "C",  1, 0 } )
	aadd( aTMP, { "TIPO"    , "C",  1, 0 } )
	u_TMPCpoX3( @aTMP, "DAI_SEQUEN" )
	u_TMPCpoX3( @aTMP, "C5_NUM"     )
	u_TMPCpoX3( @aTMP, "C5_CLIENTE" )
	u_TMPCpoX3( @aTMP, "C5_LOJACLI" )
	u_TMPCpoX3( @aTMP, "A1_NOME"    )
	u_TMPCpoX3( @aTMP, "A1_EST"     )
	u_TMPCpoX3( @aTMP, "DAI_PESO"   )
	u_TMPCpoX3( @aTMP, "DAI_PESO"  , "PESOAGRUP" )
	u_TMPCpoX3( @aTMP, "DAI_CAPVOL" )
	aadd( aTMP, { "A4_COD"  , "C", TamSX3("A4_COD")[1], 0 } ) // Excluir este campo...
	aadd( aTMP, { "AGRUPADO", "C",  1, 0 } ) // Pedido agrupado com outro: Mesmo cliente na carga
	aadd( aTMP, { "EMITGFE" , "C",  1, 0 } ) // Existe como Emitente no GFE
	aadd( aTMP, { "TOTALPED", "N", 16, 2 } ) // Total do Pedido com Impostos
	aadd( aTMP, { "VLRFRETE", "N", 12, 2 } ) // Excluir este campo...
	For nAux := 1 to 6
		aadd( aTMP, { "TRA" + StrZero(nAux,2), "C", TamSX3("GU3_CDEMIT")[1], 0 } )
		aadd( aTMP, { "SEQ" + StrZero(nAux,2), "C", TamSX3("A4_COD")[1]    , 0 } )
		aadd( aTMP, { "MUN" + StrZero(nAux,2), "C", TamSX3("GU3_NRCID")[1] , 0 } )
		aadd( aTMP, { "VAL" + StrZero(nAux,2), "N", 12                     , 2 } )
	Next

	aadd( aIND, { "IPED"   , "C5_NUM"   ,, } )
	aadd( aIND, { "ITIPO"  , "TIPO + DAI_SEQUEN + C5_NUM"   ,, } )

	cArq := {}
	u_CriaTmp( @cArq, aTMP, cxAliasPed, aInd,,, "GF", @aRet )


	aTMP := {}
	aInd := {}
	u_TMPCpoX3( @aTMP, "C5_NUM"    )
	aadd( aTMP, { "STATUS"  , "C",  1, 0 } )
	aadd( aTMP, { "NRCALC"  , "C",  6, 0 } )
	aadd( aTMP, { "SEQ"     , "C",  2, 0 } )
	aadd( aTMP, { "TIPO"    , "C",  1, 0 } )
	aadd( aTMP, { "FRVIAGEM", "C",  1, 0 } )  // Frete Viagem?
	aadd( aTMP, { "FECHADA" , "C",  1, 0 } )  // Carga Fechada?
	aadd( aTMP, { "AGRUPADO", "C",  1, 0 } )  // Pedido agrupado com outro: Mesmo cliente na carga
	aadd( aTMP, { "TPFRET"  , "C",  1, 0 } )
	aadd( aTMP, { "ORIGEM"  , "C", TamSx3("GU3_NRCID")[1] , 0 } )
	aadd( aTMP, { "DESTIN"  , "C", TamSx3("GU3_NRCID")[1] , 0 } )
	aadd( aTMP, { "NRGRUP"  , "C", 10, 0 } )
	aadd( aTMP, { "VLPIS"   , "N", 12, 2 } )
	aadd( aTMP, { "VLCOFI"  , "N", 12, 2 } )
	aadd( aTMP, { "VLISS"   , "N", 12, 2 } )
	aadd( aTMP, { "VLICMS"  , "N", 12, 2 } )
	aadd( aTMP, { "DTPREN"  , "D",  8, 0 } )
	aadd( aTMP, { "CDTRP"   , "C", TamSX3("GU3_CDEMIT")[1], 0 } )
	aadd( aTMP, { "A4_COD"  , "C", TamSX3("A4_COD")[1]    , 0 } )
	aadd( aTMP, { "A4_NOME" , "C", TamSX3("A4_NOME")[1]   , 0 } )
	aadd( aTMP, { "VLRFRETE", "N", 12, 2 } )

	aadd( aIND, { "IPED"   , "C5_NUM + SEQ + CDTRP"   ,, } )

	cArq := {}
	u_CriaTmp( @cArq, aTMP, cxAliasFrt, aInd,,, "GF", @aRet )

	aTMP := {}
	aInd := {}
	aadd( aTMP, { "SEQ"     , "C",  2, 0 } )
	u_TMPCpoX3( @aTMP, "A4_COD"    )
	u_TMPCpoX3( @aTMP, "A4_NOME"   )
	aadd( aTMP, { "CDTRP"   , "C", TamSX3("GU3_CDEMIT")[1], 0 } )
	aadd( aTMP, { "ORIGEM"  , "C", TamSx3("GU3_NRCID")[1] , 0 } )
	aadd( aTMP, { "PEDIDOS" , "N",  4, 0 } )
	aadd( aTMP, { "VLRFRETE", "N", 12, 2 } )
	aadd( aTMP, { "VLRICMS" , "N", 12, 2 } )
	aadd( aTMP, { "VLNEG"   , "N", 12, 2 } )
	aadd( aTMP, { "VLRISS"  , "N", 12, 2 } )
	aadd( aTMP, { "VLRRPA"  , "N", 12, 2 } )
	aadd( aTMP, { "TRA_OK"  , "C",  2, 0 } )
	aadd( aTMP, { "TRA_VENC", "C",  1, 0 } )

	aadd( aIND, { "ITRA"   , "A4_COD + SEQ",, } )

	cArq := {}
	u_CriaTmp( @cArq, aTMP, cxAliasTra, aInd,,, "GF", @aRet )

	aTMP := {}
	aInd := {}
	aadd( aTMP, { "NRCALC"  , "C",  6, 0 } )
	u_TMPCpoX3( @aTMP, "GV2_CDCOMP", "CDCOMP"    )
	u_TMPCpoX3( @aTMP, "GV2_DSCOMP", "DSCOMP"    )
	u_TMPCpoX3( @aTMP, "GWI_QTCALC", "QTDE"      )
	u_TMPCpoX3( @aTMP, "GWI_VLFRET", "VALOR"     )

	aadd( aIND, { "ICALC"   , "NRCALC + CDCOMP",, } )

	cArq := {}
	u_CriaTmp( @cArq, aTMP, cxAliasCmp, aInd,,, "GF", @aRet )

Return aRet




User Function CriaTMP( cNOMEF, aESTRU, xALIAS, aINDIC, xEXCLU, xPATH, xPREFIXO, xArrayArq )
	Local cTEMPO   := ""
	Local cPATH    := "\TEMP\"
	Local cALIAS   := "TMP"
	Local lEXCLU   := .T.
	Local cPrefixo := "FT"
	Local cFileTMP := ""
	Local nxTenta  := 0
	Local lRet     := .T.
	Local nINDEX   := 0

	cPATH     := if( u_isnil( xPATH )    , cPath   , Alltrim( xPATH ) )
	cALIAS    := if( u_isnil( xALIAS )   , cAlias  , Alltrim( upper(xALIAS) ) )
	lEXCLU    := if( u_isnil( xEXCLU )   , lExclu  , xEXCLU )
	cPATH     := cPATH + if( Right( cPATH, 1 ) = "\", "", "\" )
	cPREFIXO  := if( u_isnil( xPREFIXO ) , cPrefixo, Alltrim( xPREFIXO ) )
	cFileTMP  := if( empty( cNOMEF ), cPrefixo + u_ftime(), alltrim( cNOMEF ) )
	cTEMPO    := cPATH + cFileTMP
	xArrayArq := if( u_IsNil( xArrayArq ), {}      , xArrayArq )

	If Empty( cNOMEF )
		While File( cTEMPO + ".TMP" ) .Or. File( cTEMPO + ".CDX" )
			cFileTMP := cPrefixo + u_ftime()
			cTEMPO   := cPATH + cFileTMP
		End
	EndIf
	nxTenta := 0
	While nxTenta < 5 .And. ( File( cTEMPO + ".TMP" ) .Or. File( cTEMPO + ".CDX" ) ) .and. lEXCLU
		nxTenta++
		If fErase( cTEMPO + ".TMP" ) < 0
			u_ConLog( "Erro " + Alltrim(Str(FError())) + " ao Excluir " + cTEMPO + ".TMP" )
		EndIf
		If fErase( cTEMPO + ".CDX" ) < 0
			u_ConLog( "Erro " + Alltrim(Str(FError())) + " ao Excluir " + cTEMPO + ".CDX" )
		EndIf
	End
	If File( cTEMPO + ".TMP" ) .Or. File( cTEMPO + ".CDX" )
		u_ConLog( "Cancelando Criacao do TMP" )
		lRet := .F.
	Endif

	If lRet
		nxTenta := 0
		While nxTenta < 5 .And. !File( cTEMPO + ".TMP" )
			nxTenta++
			dbCreate( cTEMPO + ".TMP", aESTRU, "DBFCDX" )
		End
		If !File( cTEMPO + ".TMP" )
			u_ConLog( "Nao foi possivel criar " + cTEMPO + ".TMP" )
			lRet := .F.
		EndIf
	EndIf

	While lRet
		dbUseArea(.T., "DBFCDX", cTEMPO + ".TMP", cALIAS, .F., .F. )
		If Alias() != cALIAS
			u_ConLog( "Nao foi possivel abrir " + cTEMPO + ".TMP" )
			If !MsgYesNo("Nao posso abrir o arquivo " + cTEMPO + ".TMP", "Tentar Novamente?" )
				lRet := .F.
				Exit
			EndIf
			LOOP
		EndIf
		if u_isnil( aINDIC ) = .F.
			for nINDEX := 1 to len( aINDIC ) step 1
				While Len(aINDIC[ nINDEX ]) < 4
					aadd( aINDIC[ nINDEX ], Nil )
				End
				if u_isnil( aINDIC[ nINDEX,4 ] )
					aINDIC[ nINDEX, 4 ] := .F.
				endif
				if u_isnil( aINDIC[ nINDEX,3 ] )
					ordcondset( NIL,NIL,NIL,NIL,NIL,NIL, recno(),NIL,NIL,NIL, aINDIC[ nINDEX, 4 ] )
				else
					bFOR := &( "{||" + alltrim( aINDIC[ nINDEX, 3 ] ) + "}" )
					ordcondset( alltrim( aINDIC[ nINDEX, 3 ] ), bFOR,NIL,NIL,NIL,NIL, recno(),NIL,NIL,NIL, aINDIC[ nINDEX, 4 ] )
				endif
				bKEY := &( "{||" + alltrim( aINDIC[ nINDEX, 2 ] ) + "}" )
				ordcreate( cTEMPO + '.CDX', alltrim( aINDIC[ nINDEX, 1 ] ), alltrim( aINDIC[ nINDEX, 2 ] ), bKEY )
			next
			ordsetfocus( aINDIC[ 1, 1 ] )
		endif
		exit
	end

	If lRet    
		cNOMEF := cTEMPO

		//                     Alias   Path+Nome  Path   Nome
		u_AddTMPs( @xArrayArq, cAlias, cTempo   , cPath, cFileTMP )
	EndIf
Return lRet

User Function TMPCpoX3( aCampos, cxCampo, cxNome )
	Local aCpo := {}
	Local lRet := .F.

	If cxNome = nil
		cxNome := ""
	EndIf

	SX3->( dbSetOrder(2) )
	If SX3->( dbSeek( cxCampo ) )
		lRet := .T.
		If Empty(cxNome)
			aadd( aCpo, SX3->X3_CAMPO )  // Campo
		Else
			aadd( aCpo, cxNome       )  // Campo
		EndIf
		aadd( aCpo, SX3->X3_TIPO    )  // Tipo
		aadd( aCpo, SX3->X3_TAMANHO )  // Tamanho
		aadd( aCpo, SX3->X3_DECIMAL )  // Decimais

		aadd( aCampos, aCpo )
	EndIf
Return lRet

User Function AddTMPs( aTMPs, cxAlias, cxPathNome, cxPath, cxNome )
	aadd( aTMPs, { cxAlias, cxPathNome, cxPath, cxNome } )
Return

User Function MatarTMPs(aTMPs)
	Local nAux := 0

	For nAux := 1 to Len( aTMPs )
		If Select( aTMPs[nAux, 1] ) > 0
			&( aTMPs[ nAux, 1 ] )->( dbCloseArea() )
		EndIf
		fErase( aTMPs[ nAux, 2 ] + ".TMP" )
		fErase( aTMPs[ nAux, 2 ] + '.CDX' )
	Next
Return

Static Function ShowMemo( cVarMemo, cTitulo )
	Local oDlgMemo
	Local oFont
	Local oMemo
	Local aLog      := { cVarMemo }   
	Local cPrograma := "ExpArrayPrn"

	Default cTitulo := "Exibição Memo"

	DEFINE FONT oFont NAME "Courier New" SIZE 5,0
	DEFINE MSDIALOG oDlgMemo TITLE cTitulo From 3,0 to 340,417 COLOR CLR_BLACK,CLR_WHITE PIXEL

	@ 5,5 GET oMemo VAR cVarMemo MEMO SIZE 202,145 OF oDlgMemo PIXEL
	oMemo:bRClicked := { || AllwaysTrue() }
	oMemo:oFont     := oFont
	oMemo:lReadOnly := .T.

	DEFINE SBUTTON FROM 154,180 TYPE 1 ACTION oDlgMemo:End() ENABLE OF oDlgMemo PIXEL
	//DEFINE SBUTTON FROM 153,145 TYPE 13 ACTION (cFile:=cGetFile(cMask,OemToAnsi(STR0327)),If(cFile="",.t.,MemoWrite(cFile,cTxtLog)),oDlg:End()) ENABLE OF oDlg PIXEL //"Salvar Como..."
	//DEFINE SBUTTON FROM 153,115 TYPE 6 ACTION LOGPRINT(aLog,cPrograma) ENABLE OF oDlgMemo PIXEL
	ACTIVATE MSDIALOG oDlgMemo CENTERED


Return NIL

User Function DAK_GFE(nOperation,lCommit)

	Local lRet := .T.

	Local lIntGFE := SuperGetMv("MV_INTGFE",.F.,.F.)

	Local cIntGFE2 := SuperGetMv("MV_INTGFE2",.F.,"2")

	Local cIntCarga := SuperGetMv("MV_GFEI12",.F.,"2")



	Default lCommit   := .T.



	If lIntGFE == .T. .And. cIntGFE2 $ "1" .And. cIntCarga == "1"

		If !DAK_GFEAtt(nOperation,lCommit)

			lRet := .F.

		EndIf

	EndIf



Return lRet



Static Function DAK_GFEAtt(nOperation,lCommit)
	Local aAreaGWN := GWN->( GetArea() )
	Local aAreaGU3 := GU3->( GetArea() )
	Local lRet :=  .T.
	Local oModelGWN := FWLoadModel("GFEA050")
	Local nTpOpSetad
	Local lPula := .F.
	Local cMsg
	Local cTransp := ""
	Local cCgcTransp := ""
	Local lNumProp := SuperGetMv("MV_EMITMP",.F.,"0") == "1" .And. SuperGetMv("MV_INTGFE2",.F.,"2") == "1"
	Local MODEL_OPERATION_INSERT := 3
	Local MODEL_OPERATION_DELETE := 5

	dbSelectArea("GWN")
	GWN->( dbSetOrder(1) )
	GWN->( dbSeek( xFilial("GWN") + DAK->DAK_COD + DAK->DAK_SEQCAR ) )
	If !GWN->( Eof() ) .And. GWN->GWN_FILIAL == xFilial("GWN") .And. AllTrim(GWN->GWN_NRROM) == AllTrim( DAK->DAK_COD + DAK->DAK_SEQCAR )

		If nOperation == MODEL_OPERATION_INSERT
			oModelGWN:SetOperation( MODEL_OPERATION_UPDATE )
			nTpOpSetad := MODEL_OPERATION_UPDATE
		Else
			oModelGWN:SetOperation( nOperation )    
		EndIf
	Else
		If nOperation == MODEL_OPERATION_INSERT
			oModelGWN:SetOperation( MODEL_OPERATION_INSERT )
			nTpOpSetad := MODEL_OPERATION_INSERT
		Else
			oModelGWN:SetOperation( MODEL_OPERATION_INSERT )
			nTpOpSetad := MODEL_OPERATION_INSERT
		EndIf
	EndIf

	If !lPula
		oModelGWN:Activate()

		If !oModelGWN:IsActive()
			cMsg := oModelGWN:GetErrorMessage()[6]
			lRet := .F.
		Else
			If nOperation <> MODEL_OPERATION_DELETE
				//cCgcTransp := Posicione('SA4',1,xFilial('SA4')+DAK->DAK_TRANSP,'A4_CGC')
				//oModelGWN:SetValue( 'GFEA050_GWN', 'GWN_CDTRP'  , cCGCTransp )      

				oModelGWN:SetValue( 'GFEA050_GWN', 'GWN_CDMTR'  , DAK->DAK_MOTORI )
				//oModelGWN:SetValue( 'GFEA050_GWN', 'GWN_DISTAN' , DAK->DAK_X_KM )

				DA3->( dbSetOrder(1) )                  
				If !Empty(DAK->DAK_CAMINH) .And. DA3->( dbSeek( xFilial("DA3") + DAK->DAK_CAMINH ) )
					oModelGWN:LoadValue( 'GFEA050_GWN', 'GWN_CDTPVC', DA3->DA3_TIPVEI )
					oModelGWN:SetValue( 'GFEA050_GWN', 'GWN_PLACAD' , DA3->DA3_PLACA )
					//If DA3->DA3_TIPTRA == "1"
					//    oModelGWN:SetValue( 'GFEA050_GWN', 'GWN_CDCLFR' , "RODO" )
					//EndIf
				EndIf

				If oModelGWN:VldData()
					If lCommit
						oModelGWN:CommitData()
					EndIf
				Else
					cMsg := "Inconsistência com o Frete Embarcador (SIGAGFE): " + CRLF + CRLF + oModelGWN:GetErrorMessage()[6]
					lRet := .F.
				EndIf
			EndIf
		EndIf

		oModelGWN:Deactivate()
	EndIf

	If !lRet
		Help( ,, "Atenção - ZDA",,cMsg, 1, 0 ) //"Atenção"
	EndIf

	RestArea( aAreaGWN )
	RestArea( aAreaGU3 )

Return lRet 

User Function dbEdit( cxAlias, cTitulo )
	Local oDlgBrw
	Local oBrowse
	Local aArea
	Local nAux    := 0
	Local aStruct := {}

	Default cxAlias := GetArea()[1]
	Default cTitulo := "Consulta da Tabela - Alias: " + cxAlias

	aArea := (cxAlias)->( GetArea() )

	dbSelectArea(cxAlias)
	aStruct := (cxAlias)->( dbStruct() )

	DEFINE MSDIALOG oDlgBrw TITLE cTitulo FROM 0,0 TO 400,800 PIXEL

	oBrowse := TBelBrowse():New( { 2, 2, 399, 175 }, cxAlias, oDlgBrw )

	For nAux := 1 to Len(aStruct)
		oBrowse:AddCampo( aStruct[nAux,1],,aStruct[nAux,1],, aStruct[nAux,3]*8,,, .F. )
	Next
	@ 180, 345 BUTTON "Voltar" SIZE 50, 15 ACTION oDlgBrw:End() OF oDlgBrw PIXEL

	ACTIVATE MSDIALOG oDlgBrw

	(cxAlias)->( RestArea( aArea ) )
Return

User Function VerTamCpo( cTxt, cCpo )
	Loca c_Ret := ""

	c_Ret := Left( cTxt + Space( TamSX3(cCpo)[1] ), TamSX3(cCpo)[1] )

Return c_Ret 

User Function ShowLogArray( aArray, cTitulo )
	Local oDlgMemo
	Local oFont
	Local oMemo
	Local cPrograma := "ShowLogArray"
	Local cVarMemo  := ""
	Local cFile     := ""
	Local cMask     := "Arquivos Texto (*.TXT) |*.txt|"
	Local nAux := 0

	Default cTitulo := "Exibição de Array"

	For nAux := 1 to Len( aArray )
		If ValType( aArray[nAux] ) == "C"
			cVarMemo += aArray[nAux] + CRLF
		EndIf
	Next

	DEFINE MSDIALOG oDlgMemo TITLE cTitulo From 0,0 to 340,600 COLOR CLR_BLACK,CLR_WHITE PIXEL
	oFont := TFont():New('Courier new',,-16,.T.)

	@ 5,5 GET oMemo VAR cVarMemo MEMO SIZE 291,150 OF oDlgMemo PIXEL FONT oFont READONLY
	oMemo:bRClicked := { || AllwaysTrue() }
	//oMemo:lReadOnly := .T.

	DEFINE SBUTTON FROM 158,240 TYPE 13 ACTION (cFile := cGetFile(cMask,"Salvar Log Como..."),If(cFile="",.T.,MemoWrite(cFile,cVarMemo))) ENABLE OF oDlgMemo PIXEL //"Salvar Como..."
	DEFINE SBUTTON FROM 158,270 TYPE 1  ACTION oDlgMemo:End() ENABLE OF oDlgMemo PIXEL
	ACTIVATE MSDIALOG oDlgMemo CENTERED

Return NIL

User Function ExpArray( aArray, cTitulo )
	Local nTop    := 000 //oMainWnd:nTop+23
	Local nLeft   := 000 //oMainWnd:nLeft+5
	Local nBottom := 400 //oMainWnd:nBottom-60
	Local nRight  := 585 //oMainWnd:nRight-10
	Local oBtExp
	Local oBtVis
	Local oBtSair
	Local cTitle  := "Explorador de ARRAYs"

	// Teste
	//aArray := { { "Teste", Nil }, { cTod("01/01/2012"), .T., 156.32 }, { { "XX1", "XX2" }, 1 } }

	Private oDlgArray
	Private oDlgTree
	Private aArrayPrv := aArray

	Default cTitulo := ""

	If aArray == nil
		MsgStop("Array is Nil")
		Return .F.
	Endif
	If !Empty( cTitulo )
		cTitle += " - " + cTitulo
	EndIf

	DEFINE DIALOG oDlgArray TITLE cTitle FROM nTop,nLeft TO nBottom,nRight PIXEL

	oDlgTree := dbTree():New(2, 2,((nBottom-nTop)/2)-24,293,oDlgArray,,,.T.)
	//oDlgTree:bChange := {|| IIF(Val(SubStr(oTree:GetCargo(),6,12))<>0,Eval({||(SubStr(oTree:GetCargo(),3,3))->(MsGoto(Val(SubStr(oTree:GetCargo(),6,12)))),RegToMemory(SubStr(oTree:GetCargo(),3,3),.F.,aScan(aSVAlias,SubStr(oTree:GetCargo(),3,3))==0)}),Nil),MTC050DlgV(@oTree,aSValias,@aEnch,{0,0,((nBottom-nTop)/2)-24,(nRight-nLeft)/2-160},@nOldEnch,@oPanel,aTotais,aMrp,nSaldoIni),Eval(bChange)}
	//oDlgTree:SetFont(oFont)
	oDlgTree:lShowHint:= .F.

	If ValType( aArray ) = "A"
		oDlgTree:BeginUpdate()
		MontaTree( @oDlgTree, aArray, "", 1 )
		oDlgTree:EndUpdate()
	EndIf
	oDlgTree:EndTree()

	oBtExp  := TButton():New( 180, 126, "&Exportar"  ,oDlgArray,{ || VisItemArray(2)  },50,14,,,.F.,.T.,.F.,,.F.,,,.F. )
	oBtVis  := TButton():New( 180, 184, "&Visualizar",oDlgArray,{ || VisItemArray(1)  },50,14,,,.F.,.T.,.F.,,.F.,,,.F. )
	oBtSair := TButton():New( 180, 242, "&Sair"      ,oDlgArray,{ || oDlgArray:End()  },50,14,,,.F.,.T.,.F.,,.F.,,,.F. )

	ACTIVATE DIALOG oDlgArray CENTERED

Return

Static Function MontaTree( oTree, aArray, cItem, nNivel )
	Local nAux     := 0
	Local cValType := ""
	Local cTxtItem := ""

	If Empty( cItem )
		cItem := "R000"
		cTxtItem := "(A) "+Alltrim(Str(Len(aArray)))
		If Len(aArray) > 1
			cTxtItem += " itens"
		Else
			cTxtItem += " item"
		EndIf

		//                                       Icone       Icone
		//             Nome                lOpen Aberto      Fechado
		oTree:AddTree( ArrayDesc(cTxtItem), .F., "FOLDER10", "FOLDER6",,, ArrayID(cItem) )
	EndIf

	For nAux := 1 to Len( aArray )
		cValType  := Upper( ValType( aArray[nAux] ) )
		cTxtItem  := "[" + Alltrim( Str( nAux, 12, 0 ) ) + "]"
		cNomeItem := cItem + "A" + StrZero(nAux,3)

		oTree:TreeSeek( ArrayID(cItem) )
		If cValType = "A"

			cTxtItem += " (A) "+Alltrim(Str(Len(aArray[nAux])))
			If Len(aArray[nAux]) > 1
				cTxtItem += " itens"
			Else
				cTxtItem += " item"
			EndIf
			//                                                      Icone       Icone        1-Mesmo Nível
			//             Nome                 ID                  Aberto      Fechado      2-Nível Abaixo
			oTree:AddItem( ArrayDesc(cTxtItem), ArrayID(cNomeItem), "FOLDER10", "FOLDER6",,, 2 )

			MontaTree( @oTree, aArray[nAux], cNomeItem, nNivel+1 )
		Else
			cTxtItem += " ("+cValType+")= "
			If cValType = "C"
				cTxtItem += "'"+aArray[nAux]+"'"
			ElseIf cValType = "D"
				cTxtItem += dToc(aArray[nAux])
			ElseIf cValType = "N"
				cTxtItem += Alltrim(Str(aArray[nAux]))
			ElseIf cValType = "L"
				cTxtItem += If(aArray[nAux],".T.",".F.")
			ElseIf cValType = "U"
				cTxtItem += "Nil"
			ElseIf cValType = "O"
				cTxtItem += ""
			EndIf

			//                                                      Icone       Icone        1-Mesmo Nível
			//             Nome                 ID                  Aberto      Fechado      2-Nível Abaixo
			oTree:AddItem( ArrayDesc(cTxtItem), ArrayID(cNomeItem), "FOLDER10", "FOLDER6",,, 2 )
		EndIf
	Next
Return

Static Function ArrayID( cTxt )
Return Left( cTxt + Replic("0", 255), 80 ) 

Static Function ArrayDesc( cTxt )
Return Left( cTxt + Space(80), 80 )

Static Function VisItemArray(nxTipo)
	Local aPosicao  := {}
	Local cChave    := oDlgTree:GetCargo()
	Local nPos      := 0
	Local cVariavel := ""
	Local nValor    := ""
	Local cValor    := ""
	Local lPri      := .T.

	While ( nPos := At( "A", cChave ) ) > 0
		aadd( aPosicao, Val( SubStr( cChave, nPos+1, 3 ) ) )
		If !lPri
			cVariavel += ","
		EndIf
		cVariavel += Alltrim( Str( Val( SubStr( cChave, nPos+1, 3 ) ) ) )
		cChave    := SubStr( cChave, nPos + 4, Len( cChave ) - ( nPos + 3 ) )
		lPri      := .F.
	End
	cVariavel := "[" + cVariavel + "]"

	nValor := &( "aArrayPrv" + cVariavel )
	If ValType( nValor ) = "C"
		If nxTipo == 1
			cValor := "'" + nValor + "'"
		Else
			cValor := nValor
		EndIf
	ElseIf ValType( nValor ) = "D"
		cValor := dToc(nValor)
	ElseIf ValType( nValor ) = "N"
		cValor := Alltrim(Str(nValor))
	ElseIf ValType( nValor ) = "L"
		cValor := If(nValor,".T.",".F.")
	ElseIf ValType( nValor ) = "U"
		cValor := "Nil"
	ElseIf ValType( nValor ) = "O"
		cValor := ""
	EndIf 
	If nxTipo == 1
		ShowMemo( cValor, "Memo: A" + cVariavel )
	Else
		MemoWrite( "c:\TMP\ItemArray.txt", cValor )

		If MsgYesNo( "Gravado em c:\TMP\ItemArray.txt. Abrir?", "Item Exportado" )
			WinExec("NOTEPAD c:\TMP\ItemArray.txt",1)
		EndIf
	EndIf
Return

Static Function LOGPRINT( aLog, cPrograma )
	Local aTitle   := { "Memo " + cPrograma }
	CursorWait()
	fMakeLog( aLog,aTitle,,.T.,cPrograma,aTitle[1],"G","P",,.F.)
	CursorArrow()
Return NIL

// Explorar a Estrutura de Métodos de um Objeto
User Function LogObjeto( oObj )

	u_ConSysArray( "ShowLog", { ClassMethArr( oObj, .T. ), ClassDataArr( oObj, .T. ) } )

Return

User Function ExpProtheus()
	Local oDlgMemo
	Local oFont
	Local cTitulo := "Explorar Objetos"

	RPCSetType(3)
	RPCSetEnv("01","07","","","","",{})

	//Processa( { |lEnd| aObj := __ClsArr() } )

	//u_ExpArray( aObj, "Objetos Existentes" )


	//DEFINE FONT oFont NAME "Courier New" SIZE 5,0
	//DEFINE MSDIALOG oDlgMemo TITLE cTitulo From 3,0 to 340,417 COLOR CLR_BLACK,CLR_WHITE PIXEL

	//DEFINE SBUTTON FROM 154,180 TYPE 1 ACTION oDlgMemo:End() ENABLE OF oDlgMemo PIXEL
	//ACTIVATE MSDIALOG oDlgMemo CENTERED

	RpcClearEnv()
Return

User Function Isnil( xParam )
	Local l_Ret := .F.

	l_Ret := if( xParam = Nil, .T., .F. )

Return l_Ret 

User Function fTime()
	Local cTIME := time()
	Loca c_Hr := ""

	c_Hr := substr(cTIME,1,2)+substr(cTIME,4,2)+substr(cTIME,7,2)

return c_Hr 

User Function ConLog( cMsg, lDtHr )
	Default lDtHr := .T.

	If lDtHr
		cMsg := dToc( Date() ) + " " + Time() + " " + cMsg
	EndIf
	ConOut(cMsg)
Return

User Function Split( cLinha, cSepara )
	Local aRet   := {}
	Local cCampo := ""
	Local nAux   := 0
	Default cSepara := ";"
	For nAux := 1 to Len( cLinha )
		If SubString( cLinha, nAux, 1 ) = cSepara .Or. nAux = Len( cLinha )
			If nAux = Len( cLinha ) .And. Right( cLinha, 1 ) <> cSepara
				cCampo += SubString( cLinha, nAux, 1 )
			EndIf
			aadd( aRet, cCampo )
			cCampo := ""
		Else
			cCampo += SubString( cLinha, nAux, 1 )
		EndIf
	Next
	If SubString( cLinha, Len( cLinha ), 1 ) = cSepara
		aadd( aRet, "" )
	EndIf
Return aRet


/*/{Protheus.doc} zArrToTxt
Função que exporta um array para Texto
@author Atilio
@since 21/08/2015
@version 1.0
@param aAuxiliar, Array, Array com os dados que serão impressos
@param lQuebr, Lógico, Define se a cada posição do array, quebra o texto
@param cArqGera, Caracter, Arquivo a ser gerado com o conteúdo do array
@example
u_zArrToTxt(aArray, .T., "E:\teste_aux.txt")
@return cTextoAux, Variável que é retornada (contendo o array em formato txt)
/*/

User Function zArrToTxt(aAuxiliar, lQuebr, cArqGera)
	Local cTextoAux    := ""
	Local nLimite        := 63000 //Forçando o tamanho máximo a 63.000 bytes
	Local nLinha        := 0
	Local nColuna        := 0
	Local nNivel        := 0
	Default aAuxiliar    := {}
	Default lQuebr    := .T.
	Default cArqGera    := ""

	//Se tiver linhas para serem processadas
	If Len(aAuxiliar) > 0
		//Percorrendo o Array
		For nLinha := 1 To Len(aAuxiliar)
			fImprArray(aAuxiliar[nLinha], @cTextoAux, nNivel, lQuebr, nLimite, nLinha)
		Next

		//Se não tiver em branco, gera o arquivo
		If !Empty(cArqGera)
			MemoWrite(cArqGera, cTextoAux)
		EndIf
	EndIf
Return cTextoAux

/*---------------------------------------------------------------------*
| Func:  fImprArray                                                   |
| Autor: Daniel Atilio                                                |
| Data:  21/08/2015                                                   |
| Desc:  Função que gera a linha do arquivo (recursivamente)          |
*---------------------------------------------------------------------*/

Static Function fImprArray(xDadAtu, cTextoAux, nNivel, lQuebr, nLimite, nPosicao)
	Local cEspac := Space(nNivel)
	Local nColuna := 0

	//Finaliza o laço
	If Len(cTextoAux) >= nLimite
		Return
	EndIf

	//Se o tipo for numérico
	If ValType(xDadAtu) == "N"
		cTextoAux += cEspac+"["+StrZero(nPosicao, 4)+"][Type:N] "+cValToChar(xDadAtu) + Iif(lQuebr, STR_PULA, '')

		//Se for Data
	ElseIf ValType(xDadAtu) == "D"
		cTextoAux += cEspac+"["+StrZero(nPosicao, 4)+"][Type:D] "+dToC(xDadAtu) + Iif(lQuebr, STR_PULA, '')

		//Se for Array
	ElseIf ValType(xDadAtu) == "A"
		cTextoAux += cEspac+"["+StrZero(nPosicao, 4)+"][Type:A]" + Iif(lQuebr, STR_PULA, '')
		nNivel++
		//Percorrendo o Array
		For nColuna := 1 To Len(xDadAtu)
			fImprArray(xDadAtu[nColuna], @cTextoAux, nNivel, lQuebr, nLimite, nColuna)
		Next

		//Se for Lógico
	ElseIf ValType(xDadAtu) == "L"
		cTextoAux += cEspac+"["+StrZero(nPosicao, 4)+"][Type:L] "+cValToChar(xDadAtu) + Iif(lQuebr, STR_PULA, '')

		//Senão, apenas mostra o conteúdo (Memo, Char, etc)
	Else
		cTextoAux += cEspac+"["+StrZero(nPosicao, 4)+"][Type:"+ValType(xDadAtu)+"] "+Alltrim(xDadAtu) + Iif(lQuebr, STR_PULA, '')
	EndIf
Return


Static function GetVlNeg()
	Local a_VlT := {}
	Local c_Qry := ""
	Local a_Rt	:= {}
	Local n_I := 0

	Private n_VlTrn := 0

	c_Qry := "SELECT C5_FILIAL, C5_XFILEST, C5_XFILINT "
	c_Qry += "FROM SC5010, SC9010 "
	c_Qry += "WHERE SC5010.D_E_L_E_T_ = ' ' AND SC9010.D_E_L_E_T_ = ' ' " 
	c_Qry += "AND C5_FILIAL = '"+ xFilial("SC5") +"' "
	c_Qry += "AND C9_FILIAL = '"+ xFilial("SC9") +"' "
	c_Qry += "AND C5_NUM  = C9_PEDIDO "
	c_Qry += "AND C9_CARGA = '"+ DAK->DAK_COD +"' "
	c_Qry += "GROUP BY C5_FILIAL, C5_XFILEST, C5_XFILINT "

	PlsQuery(c_Qry, "_Q01")

	If _Q01->C5_XFILINT <> " "
		AADD(a_Rt,{Posicione("GW0",1,Space(TamSx3("GW0_FILIAL")[1])+PadR( "FILIALEMIT",TamSx3("GW0_TABELA")[1] ) + _Q01->C5_XFILEST,"ALLTRIM(GW0_CHAR01)"),;
		Posicione("GW0",1,Space(TamSx3("GW0_FILIAL")[1])+PadR( "FILIALEMIT",TamSx3("GW0_TABELA")[1] ) + _Q01->C5_XFILINT,"ALLTRIM(GW0_CHAR01)")})

		AADD(a_Rt,{Posicione("GW0",1,Space(TamSx3("GW0_FILIAL")[1])+PadR( "FILIALEMIT",TamSx3("GW0_TABELA")[1] ) + _Q01->C5_XFILINT,"ALLTRIM(GW0_CHAR01)"),;
		Posicione("GW0",1,Space(TamSx3("GW0_FILIAL")[1])+PadR( "FILIALEMIT",TamSx3("GW0_TABELA")[1] ) + _Q01->C5_FILIAL,"ALLTRIM(GW0_CHAR01)")})

	Else
		AADD(a_Rt,{Posicione("GW0",1,Space(TamSx3("GW0_FILIAL")[1])+PadR( "FILIALEMIT",TamSx3("GW0_TABELA")[1] ) + _Q01->C5_XFILEST,"ALLTRIM(GW0_CHAR01)"),;
		Posicione("GW0",1,Space(TamSx3("GW0_FILIAL")[1])+PadR( "FILIALEMIT",TamSx3("GW0_TABELA")[1] ) + _Q01->C5_FILIAL,"ALLTRIM(GW0_CHAR01)")})

	Endif

	_Q01->(DbCloseArea())

	For n_I := 1 to Len(a_Rt)
		GFEX011SIM(a_Rt[n_I,1],a_Rt[n_I,2],(cxAliasTra)->CDTRP,DAK->DAK_PESO,n_TVlCar)
	Next

	(cxAliasTra)->VLNEG    := n_VlTrn
	(cxAliasTra)->VLRFRETE += n_VlTrn

Return 

Static Function GFEX011SIM(cCodRem,cCodDes,cCdTrp,nPsReal,nVlFrt)
	Local oModelSim 		:= FWLoadModel("GFEX010")
	Local oModelNeg  		:= oModelSim:GetModel("GFEX010_01")
	Local oModelAgr  		:= oModelSim:GetModel("DETAIL_01")  // oModel do grid "Agrupadores"
	Local oModelDC   		:= oModelSim:GetModel("DETAIL_02")  // oModel do grid "Doc Carga"
	Local oModelIt   		:= oModelSim:GetModel("DETAIL_03")  // oModel do grid "Item Carga"
	Local oModelTr   		:= oModelSim:GetModel("DETAIL_04")  // oModel do grid "Trechos"
	Local oModelInt  		:= oModelSim:GetModel("SIMULA")
	Local oModelCal1 		:= oModelSim:GetModel("DETAIL_05")
	Local oModelCal2 		:= oModelSim:GetModel("DETAIL_06")
	Local nCont, nRegua 	:= 0

	Local cCdClFr	:= "0003"
	Local cTpOp		:= "GERAL"
	Local nDistan	:= 0
	Local cCdTpVc 	:= SPACE(TamSX3("GWU_CDTPVC")[1])  
	Local nVolume	:= 0
	Local cSitTab	:= "2"

	oModelSim:SetOperation(3)
	oModelSim:Activate() 

	//SetRegua(nRegua)   

	dbSelectArea("GV5")
	dbSetOrder(3)
	dbSeek(xFilial("GV5")+"1")   

	oModelNeg:LoadValue('CONSNEG', cSitTab )
	//IncRegua()
	//Agrupadores
	oModelAgr:LoadValue('GWN_NRROM' , "01" )
	oModelAgr:LoadValue('GWN_CDCLFR', cCdClFr)                                   
	oModelAgr:LoadValue('GWN_CDTPOP', cTpOp)
	oModelAgr:LoadValue('GWN_DOC'   , "ROMANEIO")  
	oModelAgr:LoadValue('GWN_DISTAN', nDistan)             
	//Documento de Carga
	oModelDC:LoadValue('GW1_EMISDC', cCodRem)
	oModelDC:LoadValue('GW1_NRDC'  , "00001")
	oModelDC:LoadValue('GW1_CDTPDC', GV5->GV5_CDTPDC)
	oModelDC:LoadValue('GW1_CDREM' , cCodRem)
	oModelDC:LoadValue('GW1_CDDEST', cCodDes)
	oModelDC:LoadValue('GW1_TPFRET', "1")
	oModelDC:LoadValue('GW1_ICMSDC', "2")
	oModelDC:LoadValue('GW1_USO'   , "1")
	oModelDC:LoadValue('GW1_NRROM' , "01")
	oModelDC:LoadValue('GW1_QTUNI' , 1)   
	//Trechos
	oModelTr:LoadValue('GWU_EMISDC', cCodRem)
	oModelTr:LoadValue('GWU_NRDC'  , "00001")
	oModelTr:LoadValue('GWU_CDTPDC', GV5->GV5_CDTPDC)
	oModelTr:LoadValue('GWU_SEQ'   , "01")

	oModelTr:LoadValue('GWU_NRCIDD', POSICIONE("GU3",1,xFilial("GU3")+cCodDes,"GU3_NRCID"))

	oModelTr:LoadValue('GWU_CDTRP', cCdTrp)

	oModelTr:LoadValue('GWU_CDTPVC', cCdTpVc)
	//Itens								
	oModelIt:LoadValue('GW8_EMISDC', cCodRem)
	oModelIt:LoadValue('GW8_NRDC'  , "00001")
	oModelIt:LoadValue('GW8_CDTPDC', GV5->GV5_CDTPDC)
	oModelIt:LoadValue('GW8_ITEM'  , "ItemA"  )
	oModelIt:LoadValue('GW8_DSITEM', "Item Generico")
	oModelIt:LoadValue('GW8_CDCLFR', cCdClFr)
	oModelIt:LoadValue('GW8_PESOR' , nPsReal)
	oModelIt:LoadValue('GW8_VALOR' , nVlFrt)
	oModelIt:LoadValue('GW8_VOLUME', nVolume)	
	oModelIt:LoadValue('GW8_TRIBP' , "1")
	// Dispara a simulação
	oModelInt:SetValue("INTEGRA", "A")
	//IncRegua()


	If oModelCal1:GetQtdLine() > 1 .Or. !Empty( oModelCal1:GetValue('C1_NRCALC'  ,1) )
		For nCont := 1 to oModelCal1:GetQtdLine()
			oModelCal1:GoLine( nCont )

			n_VlTrn += oModelCal1:GetValue('C1_VALFRT'  ,nCont)


		Next nCont 

	EndIf		
Return 

User Function GFEX0101()
	Local n_Ret := 1

	If IsInCallStack('U_GFE_DAI')
		n_Ret := 0
	Endif

Return n_Ret
