#Include 'Protheus.ch'
#INCLUDE "topconn.ch"

/*/{Protheus.doc} RFINE004

Comissão:

Tratamento para vincular nota de entrada com itens de comissão
Chamado no ponto de entrada MT103FIM

@author Danilo Brito
@since 20/03/2017
@version P12
@param Nao recebe parametros
@return xRet
/*/

User Function RFINE004(nOpcao,nConfirma)

	Local aAreaSF1 	:= SF1->(GetArea())
	Local aAreaSE3 	:= SE3->(GetArea())
	Local cProdCom	:= SuperGetMv("MV_XPRDCOM",,"")
	Local cQry 		:= ""
	Local cPrefixo  := &(GetMv("MV_3DUPREF"))
	Local nPProd 	:= aScan(aHeader,{|x| Trim(x[2])=="D1_COD"})
	Local nPNFOri 	:= aScan(aHEADER,{|x| Trim(x[2])=="D1_NFORI"})
	Local lDevolu	:= .F.
	Private aDados	:= {}
	
	if nConfirma <> 1 //se não confirmou tela 
		 Return
	endif
		
	//verifico se é nota de devolução de vendas, 
	lDevolu := aScan(aCols, {|x| !empty(x[nPNFOri]) }) > 0
	
	if lDevolu //se é nota de devolução de venda
		Return
	endif
	
	if nOpcao == 3 .OR. nOpcao == 5 //se inclusao ou exclusao
	
		//verifico se na nota tem o produto de comissão na nota
		if !empty(cProdCom) .AND. aScan(aCols, {|x| Alltrim(x[nPProd]) == Alltrim(cProdCom) }) > 0
			
			cQry := " SELECT * FROM "+RetSqlName("SE2")+" SE2 "
			cQry += " WHERE SE2.D_E_L_E_T_ <> '*' " 
			//cQry += "   AND E2_FILIAL = '"+xFilial("SE2")+"' "
			cQry += "   AND E2_PREFIXO = '"+PadR(cPrefixo, TamSX3("E1_PREFIXO")[1])+"' "
			cQry += "   AND E2_TIPO = 'DP ' "
			cQry += "   AND E2_FORNECE = '"+SF1->F1_FORNECE+"' "
			cQry += "   AND E2_LOJA = '"+SF1->F1_LOJA+"' "
			if nOpcao == 3 //inclusao
				cQry += "   AND (E2_XNFCOMI = ' ' " //que não vinculou NF ainda
				cQry += "   	 OR E2_XNFCOMI = '"+SF1->F1_FILIAL+SF1->F1_DOC+SF1->F1_SERIE+"' ) " //dos titulos que foram vinculados
			else //exclusao
				cQry += "   AND E2_XNFCOMI = '"+SF1->F1_FILIAL+SF1->F1_DOC+SF1->F1_SERIE+"' " //dos titulos que foram vinculados
			endif
			cQry += " ORDER BY R_E_C_N_O_ "
			
			If Select("QAUXCOM") > 0
				QAUXCOM->(dbCloseArea())
			EndIf
			
			cQry := ChangeQuery(cQry)
			dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUXCOM", .F., .T.)
			
			if QAUXCOM->(!Eof()) 		
				While QAUXCOM->(!Eof()) 
					
					aadd(aDados, { ;
						iif(empty(QAUXCOM->E2_XNFCOMI),"LBNO","LBTIK") ,;
						QAUXCOM->E2_PREFIXO ,;
						QAUXCOM->E2_NUM ,;
						QAUXCOM->E2_PARCELA ,;
						QAUXCOM->E2_TIPO ,;
						QAUXCOM->E2_VALOR ,;
						STOD(QAUXCOM->E2_EMISSAO) ,;
						STOD(QAUXCOM->E2_VENCREA) ,;
						QAUXCOM->R_E_C_N_O_ ,;
						.F. ; //deletado
					})
					
					QAUXCOM->(DbSkip())
				Enddo
				
			else
				MsgInfo("Não foram encontrados titulos de comissão para vincular a esta nota!","COMISSÃO")
			Endif
			
			QAUXCOM->(dbCloseArea())
			
			//se tem registros, mostra tela
			if !empty(aDados)
				if nOpcao == 3 //inclusao
					ShowTela(aDados)
				else
					GravaDados(.T.)
				endif
			endif
			
		endif
	
	endif
	
	RestArea(aAreaSF1)
	RestArea(aAreaSE3)
	
Return

//----------------------------------------------------------
// tela de seleçao dos titulos para vincular a nota fiscal
//----------------------------------------------------------
Static Function ShowTela()

	Local cBkpCad := iif(type("cCadastro")=="U","",cCadastro)
	Local bOk := {|| Processa({|| GravaDados() },"Processando ...") } 
	Local bCancel := {|| oDlgCom:End() }
	Local aButtons := {}
	Local oFontGrid := TFont():New('Arial',,18,.T.,.T.)
	Local nCorGrid	:= 7888896
	
	Private cNomeFor  := Posicione("SA2",1,xFilial("SA2")+SF1->F1_FORNECE+SF1->F1_LOJA,"A2_NOME")
	Private cCadastro := "Vincular NF Comissão"
	Private oDlgCom
	Private oGridE2
	Private nMarkG	:= 0   //Variavel de controle da função MarcaTodos
	Private __XVEZ	:= "0" //Variavel de controle da função MarcaTodos
	Private nTotSel := 0
	Private oTotSel

	DEFINE MSDIALOG oDlgCom TITLE "Vincular NF Comissão" FROM 0,0 TO 500, 650 PIXEL STYLE DS_MODALFRAME 
	oDlgCom:lEscClose := .F.
	
	aadd(aButtons, {'Desvincular Todos', {|| GravaDados(.T.,.T.) }, 'Desvincular Todos'})
	
	//barra de menus e titulo
	EnchoiceBar(oDlgCom, bOk, bCancel,.F.,@aButtons,0,"SE2", .F., .F., .T., .T., .F.)
	
	TGroup():New(35,05,98,325,'Detalhes da Nota Fiscal',oDlgCom,,,.T.)
	
	//campos da tela
	TSay():New( 45,10,{|| "Num.Doc." }, oDlgCom,,,,,,.T.,CLR_BLACK,,50,9 )
	TGet():New( 53,10, {|u| SF1->F1_DOC },oDlgCom,70,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .F.},.F.,.F.,/*bChange*/,.F.,.F.,,"",,,,.T.,.F.)
	
	TSay():New( 45,85,{|| "Série" }, oDlgCom,,,,,,.T.,CLR_BLACK,,50,9 )
	TGet():New( 53,85, {|u| SF1->F1_SERIE },oDlgCom,30,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .F.},.F.,.F.,/*bChange*/,.F.,.F.,,"",,,,.T.,.F.)
	
	TSay():New( 45,120,{|| "Total NF" }, oDlgCom,,,,,,.T.,CLR_BLACK,,50,9 )
	TGet():New( 53,120, {|u| SF1->F1_VALBRUT },oDlgCom,70,12,PesqPict("SF1","F1_VALBRUT"),/*bValid*/,,,,.F.,,.T.,,.F.,{|| .F.},.F.,.F.,/*bChange*/,.F.,.F.,,"",,,,.T.,.F.)
	
	TSay():New( 71,10,{|| "Fornecedor" }, oDlgCom,,,,,,.T.,CLR_BLACK,,50,9 )
	TGet():New( 79,10, {|u| SF1->F1_FORNECE },oDlgCom,45,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .F.},.F.,.F.,/*bChange*/,.F.,.F.,,"",,,,.T.,.F.)
	TGet():New( 79,60, {|u| SF1->F1_LOJA },oDlgCom,20,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .F.},.F.,.F.,/*bChange*/,.F.,.F.,,"",,,,.T.,.F.)
	TGet():New( 79,85, {|u| cNomeFor },oDlgCom,150,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .F.},.F.,.F.,/*bChange*/,.F.,.F.,,"",,,,.T.,.F.)
	
	//GRID
	TSay():New( 100,05,{|| "Selecione os Titulos de Comissão" }, oDlgCom,,oFontGrid,,,,.T.,nCorGrid,,200,15 )
	TSay():New( 100,05,{|| Replicate("_",325) }, oDlgCom,,oFontGrid,,,,.T.,nCorGrid,,320,15 )
	oGridE2 := DoGridE2(oDlgCom, 110, 05, 225, 325)
	oGridE2:aCols := aDados 
	bSvblDb5 := oGridE2:oBrowse:bLDblClick
	oGridE2:oBrowse:bHeaderClick := {|oBrw,nCol| if(oGridE2:oBrowse:nColPos<>111 .and. nCol == 1,(MarcaTodos(@oGridE2,@nMarkG),oBrw:SetFocus()),)}
	oGridE2:oBrowse:bLDblClick := {|| if(oGridE2:oBrowse:nColPos!=0, Clique(@oGridE2), GdRstDblClick(@oGridE2, @bSvblDb5))}
	
	TSay():New( 232,210,{|| "Total Selecionado" }, oDlgCom,,,,,,.T.,CLR_BLACK,,50,9 )
	oTotSel := TGet():New( 228,255, {|u| iif( PCount()==0,nTotSel,nTotSel:= u) },oDlgCom,70,12,PesqPict("SF1","F1_VALBRUT"),/*bValid*/,,,,.F.,,.T.,,.F.,{|| .F.},.F.,.F.,/*bChange*/,.F.,.F.,,"",,,,.T.,.F.)
	
	AtuTot()
	
	oDlgCom:lCentered := .T.
	oDlgCom:Activate()
	
	cCadastro := cBkpCad
	
Return


//---------------------------------------------------------
// Monta Grid de Notas Fiscais
//---------------------------------------------------------
Static Function DoGridE2(oDlg, nTop, nLeft, nBottom, nRight)

	Local nX
	Local aHeaderEx    := {}
	Local aColsEx      := {}
	Local aFieldFill   := {}
	Local aFields      := {"MARK","E2_PREFIXO","E2_NUM","E2_PARCELA","E2_TIPO","E2_VALOR","E2_EMISSAO","E2_VENCREA"}
	Local aAlterFields := {}
	Local nLinMax 	   := 999  // Quantidade de linha na getdados
	Local cLabel	   := ""
	
	Aadd(aHeaderEx,{'','MARK','@BMP',2,0,'','€€€€€€€€€€€€€€','C','','','',''})
	Aadd(aFieldFill,"LBNO")
	
	// Define field properties
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	For nX := 1 to Len(aFields)
		If SX3->(DbSeek(aFields[nX]))
			cLabel := AllTrim(X3Titulo())
			
			Aadd(aHeaderEx, {cLabel,SX3->X3_CAMPO,SX3->X3_PICTURE,SX3->X3_TAMANHO,SX3->X3_DECIMAL,SX3->X3_VALID,;
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

Return MsNewGetDados():New( nTop, nLeft, nBottom, nRight, , "AllwaysTrue", "AllwaysTrue", "AllwaysTrue",;
							aAlterFields, , nLinMax, "AllwaysTrue", "AllwaysTrue", "AllwaysTrue", oDlg, aHeaderEx, aColsEx)

//---------------------------------------------------------
// Seleciona linha grid Um a Um
//---------------------------------------------------------
Static Function Clique(oMsMark)
	
	if oMsMark:aCols[oMsMark:nAt][1] == "LBOK"
		oMsMark:aCols[oMsMark:nAt][1] := "LBNO"
	elseif oMsMark:aCols[oMsMark:nAt][1] == "LBNO"
		oMsMark:aCols[oMsMark:nAt][1] := "LBOK"
	elseif oMsMark:aCols[oMsMark:nAt][1] == "LBTIK"
		MsgInfo("Titulo ja vinculado! Para desvincular, utilize a opção 'Desvincular Todos'.")
	endif
	
	oMsMark:oBrowse:Refresh()
	AtuTot()
	
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
				if oMsMark:aCols[nX][1] <> "LBTIK"
					oMsMark:aCols[nX][1] := "LBOK"
				endif
			next
			nMarca := 1                      
		else
			for nX := 1 to len(oMsMark:aCols)
				if oMsMark:aCols[nX][1] <> "LBTIK"
					oMsMark:aCols[nX][1] := "LBNO"
				endif
			next
			nMarca := 0
		endif 
		__XVEZ:="0"
	
		oMsMark:oBrowse:Refresh()
		AtuTot()
	    
	endif

Return

//---------------------------------------------------------
// Atualiza campo total selecionado
//---------------------------------------------------------
Static Function AtuTot()
	
	Local nX := 1 
	
	nTotSel := 0
	
	for nX := 1 to len(aDados)
		if aDados[nX][1] $ "LBOK,LBTIK"
			nTotSel += aDados[nX][6] //valor
		endif
	next nX
	
	oTotSel:Refresh()

Return

//---------------------------------------------------------
// faz o vinculo dos titulos e comissão a nota fiscal
//---------------------------------------------------------
Static Function GravaDados(lExclui, lTela)
	
	Local nX := 1 
	Local nPosRec := len(aDados[1])-1
	Default lExclui := .F.
	Default lTela := .F.
	
	if !lExclui
		if nTotSel == 0
			MsgInfo("Selecione pelo menos um titulo!")
			Return
		endif
		
		if nTotSel <> SF1->F1_VALBRUT
			if !MsgYesNo("Total selecionado diferente do total da Nota. Deseja continuar mesmo assim?")
				Return
			endif
		endif
	endif
	
	if lTela
		if !MsgYesNo("Confirma desvincular todos os titulos de comissão?")
			Return
		endif
	endif
	
	BeginTran()
	
	//iniciar gravações
	for nX := 1 to len(aDados)
		if aDados[nX][1] == "LBOK" .OR. (lExclui .AND. aDados[nX][1] == "LBTIK")
			DbSelectArea("SE2")
			SE2->(DbGoTo(aDados[nX][nPosRec]))
			
			RecLock("SE2", .F.)
				SE2->E2_XNFCOMI := iif(lExclui,"",SF1->F1_FILIAL + SF1->F1_DOC + SF1->F1_SERIE)
			SE2->(MsUnlock())
			
			DbSelectArea("SE3")
			SE3->(DbSetOrder(4)) //E3_FILIAL+E3_PROCCOM
			if SE3->(DbSeek(xFilial("SE3")+SE2->E2_FILIAL+SE2->E2_PREFIXO+SE2->E2_NUM+SE2->E2_PARCELA ))
				While SE3->(!Eof()) .AND. SE3->E3_FILIAL+RTrim(SE3->E3_PROCCOM) == xFilial("SE3")+RTrim(SE2->E2_FILIAL+SE2->E2_PREFIXO+SE2->E2_NUM+SE2->E2_PARCELA)
					
					RecLock("SE3", .F.)
						SE3->E3_XNFCOMI := iif(lExclui,"",SF1->F1_FILIAL + SF1->F1_DOC + SF1->F1_SERIE)
					SE3->(MsUnlock())
					
					SE3->(DbSkip())
				EndDo
			endif
		endif
	next nX
	
	EndTran()
	
	if lTela
		for nX := 1 to len(aDados)
			aDados[nX][1] := "LBNO"
		next nX
		oGridE2:oBrowse:Refresh()
	endif
	
	if !lExclui
		oDlgCom:End()
	endif
	
Return

