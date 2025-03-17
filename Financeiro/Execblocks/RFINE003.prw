#Include 'Protheus.ch'
#INCLUDE "topconn.ch"

/*/{Protheus.doc} RFINE003

Comissão:

Tratamento para informar valor do reembolso de frete para notas de devoluções
Chamado no ponto de entrada M530FIL

@author Danilo Brito
@since 20/03/2017
@version P12
@param Nao recebe parametros
@return xRet
/*/
User Function RFINE003(cFilSQL)
	
	Local cRet 		:= ""
	Local cQry 		:= ""
	Local aAreaSE3 	:= SE3->(GetArea())
	Local nPos		:= 0
	Default cFilSQL := ""
	
	Private aRecSE3	:= {}
	
	//buscando itens de comissão que serão processados
	cQry := " SELECT E3_VEND, SE3.R_E_C_N_O_ FROM " + RetSqlName("SE3") + " SE3 "
	cQry += " INNER JOIN " + RetSqlName("DHI") + " DHI ON (DHI.D_E_L_E_T_ <> '*' AND DHI_FILIAL = '"+xFilial("DHI")+"' AND DHI_CODIGO = E3_XMOTDEV) "
	cQry += " WHERE SE3.D_E_L_E_T_ <> '*' "
	cQry += "   AND E3_FILIAL = '"+xFilial("SE3")+"'"
	cQry += "   AND E3_EMISSAO BETWEEN '"+DTOS(mv_par02)+"' AND '"+DTOS(mv_par03)+"'"
	cQry += "   AND E3_VEND BETWEEN '"+mv_par04+"' AND '"+mv_par05+"'"
	cQry += "   AND E3_VENCTO BETWEEN '"+DTOS(mv_par10)+"' AND '"+DTOS(mv_par11)+"'"
	if mv_par01 == 1 //gerados pela emissão
		cQry += "   AND E3_BAIEMI = 'E' "
	elseif mv_par01 == 2 //gerados pela baixa e NCC
		cQry += "   AND (E3_BAIEMI = 'B' OR (E3_TIPO = 'NCC' AND E3_BAIEMI = 'E'))"
	elseif mv_par01 == 4 //gerados manual
		cQry += "   AND E3_BAIEMI = ' ' " 
	endif
	cQry += "   AND E3_DATA = ' '"
	cQry += "   AND E3_XMOTDEV <> ' '" //que tenha motivo de devoluçao
	cQry += "   AND DHI_XFRETE = 'S' " //que motivo marcado para reembolsar frete
	if !empty(cFilSQL)
		cQry += cFilSQL
	endif
	cQry += " ORDER BY E3_FILIAL, E3_VEND"
		
	If Select("QAUXCOM") > 0
		QAUXCOM->(dbCloseArea())
	EndIf
	
	cQry := ChangeQuery(cQry)
	dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUXCOM", .F., .T.)
	
	DbSelectArea("SE3")
	While QAUXCOM->(!Eof()) 
		
		if (nPos:=aScan(aRecSE3, {|x| x[1]==QAUXCOM->E3_VEND }) ) > 0
			aadd(aRecSE3[nPos][2], QAUXCOM->R_E_C_N_O_)
		else
			aAdd(aRecSE3, { QAUXCOM->E3_VEND, {QAUXCOM->R_E_C_N_O_} })
		endif 
		
		QAUXCOM->(DbSkip())
	Enddo
	
	QAUXCOM->(dbCloseArea())

	//se tem registros, mostra tela
	if !empty(aRecSE3)
		if !ShowTela(aRecSE3)
			cRet := ".F." //se cancelou tela
		endif
	endif
	
	RestArea(aAreaSE3)

Return cRet

//----------------------------------------
// monta tela para digitação
// aRecSE3 recnos por vendedor
//----------------------------------------
Static Function ShowTela()
	
	Local lRet := .F.
	Local nX, nY
	Local aAreaSF1 	:= SF1->(GetArea())
	Local aAreaSA1 	:= SA1->(GetArea())
	
	//dimensionamento de tela e componentes
	Local aSize 	:= MsAdvSize() // Retorna a área útil das janelas Protheus 
	Local aInfo 	:= {aSize[1], aSize[2], aSize[3], aSize[4], 2, 2}
	Local aPObj 	:= MsObjSize(aInfo, {{ 100, 100, .T., .T.}, { 100, 000, .T., .F.}})
	
	//enchoicebar
	Local bOk := {|| Processa({|| lRet := GravaFrete() },"Processando Reembolso...") } 
	Local bCancel := {|| oDlgFrete:End() }
	Local aButtons := {}
	Local oFontGrid := TFont():New('Arial',,18,.T.,.T.)
	Local nCorGrid	:= 7888896
	
	Private cCadastro := "Reembolso Frete - Informar Valores"
	Private nVendSel := 1
	Private cMotDev := ""
	Private cHisDev := ""
	Private nVlrNF := 0
	Private nTotReemb := 0
	
	Private oMotDev
	Private oHisDev
	Private oVlrNF
	Private oTotReemb
	Private oDlgFrete
	Private oListVend
	Private oGridNF
	
	Private aVendList := {}
	Private aDados := {} //{cVend, nRecno, nVlrFrete, cMotDev, cHistDev, cNota, cSerie, cCliente, cLoja, cNomeCli, dEmissao} 
	
	//montando lista de vendedores e dados para tela
	For nX := 1 to len(aRecSE3)
	
		aadd(aVendList, Posicione("SA3",1,xFilial("SA3")+aRecSE3[nX][1],"A3_NOME") )
		
		For nY := 1 to len(aRecSE3[nX][2])
			
			SE3->(DbGoTo(aRecSE3[nX][2][nY]))
			
			aadd(aDados, { ;
				aRecSE3[nX][1],; //vendedor
				aRecSE3[nX][2][nY],; //recno
				0 ,; //valor frete
				SE3->E3_XMOTDEV,; //motivo devoluçao
				Posicione("SF1",1,xFilial("SF1")+SE3->E3_NUM+SE3->E3_SERIE+SE3->E3_CODCLI+SE3->E3_LOJA,"F1_HISTRET") ,;
				SE3->E3_NUM ,; //nota fiscal
				SE3->E3_SERIE ,; //serie
				SE3->E3_CODCLI ,; //cliente
				SE3->E3_LOJA ,; //loja
				Posicione("SA1",1,xFilial("SA1")+SE3->E3_CODCLI+SE3->E3_LOJA,"A1_NOME") ,;
				SE3->E3_EMISSAO ; //data emissao
			})
			
		next nY
		
	next nX
	
	DEFINE MSDIALOG oDlgFrete TITLE cCadastro FROM aSize[7],aSize[1] TO aSize[6],aSize[5] PIXEL OF GetWndDefault() STYLE nOr(WS_VISIBLE, WS_POPUP)
	
	//barra de menus e titulo
	EnchoiceBar(oDlgFrete, bOk, bCancel,.F.,@aButtons,0,"Z07", .F., .F., .T., .T., .F.)
	
	TSay():New( aPObj[1,1]+5 , 10,{|| "ATENÇÃO:" }, oDlgFrete,,,,,,.T.,,,1000,15 )
	TSay():New( aPObj[1,1]+5 , 45,{|| "Foram encontrados itens de comissão negativos referente a devoluções, que precisam informar o valor de reeembolso de frete." }, oDlgFrete,,,,,,.T.,,,1000,15 )
	TSay():New( aPObj[1,1]+13, 45,{|| "Preencha os valores de reembolso para cada nota fiscal de cada vendedor." }, oDlgFrete,,,,,,.T.,,,1000,15 )
	TSay():New( aPObj[1,1]+17, aPObj[1,2],{|| Replicate("_",aPObj[1,4]) }, oDlgFrete,,,,,,.T.,,,aPObj[1,4],15 )
	
	TSay():New( aPObj[1,1]+35,aPObj[1,2],{|| "Vendedores" }, oDlgFrete,,oFontGrid,,,,.T.,nCorGrid,,200,15 )
	TSay():New( aPObj[1,1]+35,aPObj[1,2],{|| Replicate("_",100) }, oDlgFrete,,oFontGrid,,,,.T.,nCorGrid,,100,15 )
	oListVend := TListBox():New(aPObj[1,1]+48, aPObj[1,2],{|u| iif(Pcount()>0,nVendSel:=u,nVendSel)},aVendList,100,aPObj[1,3]-70,{|| CarregaGrid() },oDlgFrete,,,,.T.)
	
	TSay():New( aPObj[1,1]+35,aPObj[1,2]+110,{|| "Notas de Devoluções" }, oDlgFrete,,oFontGrid,,,,.T.,nCorGrid,,200,15 )
	TSay():New( aPObj[1,1]+35,aPObj[1,2]+110,{|| Replicate("_",aPObj[1,4]-110) }, oDlgFrete,,oFontGrid,,,,.T.,nCorGrid,,aPObj[1,4]-110,15 )
	oGridNF := DoGridNF(oDlgFrete, aPObj[1,1]+48, aPObj[1,2]+110, aPObj[1,3]-75, aPObj[1,4])
	oGridNF:oBrowse:bchange := {|| CarrDetNF() }
	
	TSay():New( aPObj[1,3]-67, aPObj[1,4]-125,{|| "Total Reembolso" }, oDlgFrete,,,,,,.T.,CLR_BLACK,,100,9 )
	oTotReemb := TGet():New( aPObj[1,3]-71, aPObj[1,4]-80, {|u| iif( PCount()==0,nTotReemb,nTotReemb:= u) },oDlgFrete,80,12,PesqPict("SE3","E3_BASE"),{|| .T./*valid*/ },,,,.F.,,.T.,,.F.,{|| .F.},.F.,.F.,/*bChange*/,.F.,.F.,,"",,,,.T.,.F.)
	
	TGroup():New(aPObj[1,3]-55,aPObj[1,2]+110,aPObj[1,3]+10,aPObj[1,4],'Detalhes da nota de Devoução:',oDlgFrete,,,.T.)
	
	TSay():New( aPObj[1,3]-45,aPObj[1,2]+120,{|| "Motivo Devolução" }, oDlgFrete,,,,,,.T.,CLR_BLACK,,100,9 )
	oMotDev := TGet():New( aPObj[1,3]-37,aPObj[1,2]+120,{|u| cMotDev },oDlgFrete,160,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .F.},.F.,.F.,/*bChange*/,.F.,.F.,,"",,,,.T.,.F.)

	TSay():New( aPObj[1,3]-45, aPObj[1,2]+285,{|| "Histórico" }, oDlgFrete,,,,,,.T.,CLR_BLACK,,50,9 )
	oHisDev := TMultiGet():new(aPObj[1,3]-37,aPObj[1,2]+285,{|u| cHisDev },oDlgFrete,220,43,,,,,,.T.,,,{|| .T. },,,.T.)
	
	TSay():New( aPObj[1,3]-17, aPObj[1,2]+120,{|| "Valor Nota Fiscal" }, oDlgFrete,,,,,,.T.,CLR_BLACK,,100,9 )
	oVlrNF := TGet():New( aPObj[1,3]-09, aPObj[1,2]+120, {|u| iif( PCount()==0,nVlrNF,nVlrNF:= u) },oDlgFrete,80,12,PesqPict("SE3","E3_BASE"),{|| .T./*valid*/ },,,,.F.,,.T.,,.F.,{|| .F.},.F.,.F.,/*bChange*/,.F.,.F.,,"",,,,.T.,.F.)
	
	TButton():New( aPObj[1,3]-09, aPObj[1,2]+210, "Ver Nota Devoluçao", oDlgFrete,{|| MsAguarde({|| VerNFDev() },"Aguarde...","Abrindo tela",.T.) }, 70,14,,,.F.,.T.,.F.,,.F.,,,.F. )
		
	CarregaGrid()
	
	oDlgFrete:lCentered := .T.
	oDlgFrete:Activate()
	
	RestArea(aAreaSA1)
	RestArea(aAreaSF1)
	
Return lRet


//---------------------------------------------------------
// Monta Grid de Notas Fiscais
//---------------------------------------------------------
Static Function DoGridNF(oDlg, nTop, nLeft, nBottom, nRight)

	Local nX
	Local aHeaderEx    := {}
	Local aColsEx      := {}
	Local aFieldFill   := {}
	Local aFields      := {"E3_NUM","E3_SERIE","E3_EMISSAO","E3_CODCLI","E3_LOJA","A1_NOME","Z07_PREVOL"}
	Local aAlterFields := {"Z07_PREVOL"}
	Local nLinMax 	   := 999  // Quantidade de linha na getdados
	Local cLabel	   := ""
	
	// Define field properties
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	For nX := 1 to Len(aFields)
		If SX3->(DbSeek(aFields[nX]))
			cLabel := AllTrim(X3Titulo())
			if Alltrim(SX3->X3_CAMPO) == "E3_NUM"
				cLabel := "Nota Fiscal"
			elseif Alltrim(SX3->X3_CAMPO) == "E3_EMISSAO"
				cLabel := "Dt.Emissao"
			elseif Alltrim(SX3->X3_CAMPO) == "Z07_PREVOL"
				cLabel := "Vlr.Reembolso (Frete)"
			endif
			
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

Return MsNewGetDados():New( nTop, nLeft, nBottom, nRight, GD_UPDATE , "StaticCall(RFINE003,VldLinha)", "AllwaysTrue", "AllwaysTrue",;
							aAlterFields, , nLinMax, "AllwaysTrue", "AllwaysTrue", "AllwaysTrue", oDlg, aHeaderEx, aColsEx)


//---------------------------------------------------------
// Carrega Grid conforme vendedor selecionado
//---------------------------------------------------------
Static Function CarregaGrid()

	Local nX
	Local cVendAtu := aRecSE3[oListVend:nAt][1]
	
	if !empty(oGridNF:aCols[oGridNF:nAT][1])
		VldLinha()//gravo antes de sair
	endif
	
	oGridNF:aCols := {}
	
	//aDados := {{cVend, nRecno, nVlrFrete, cMotDev, cHistDev, cNota, cSerie, cCliente, cLoja, cNomeCli, dEmissao},...}
	for nX := 1 to len(aDados)
		if  aDados[nX][1] == cVendAtu
			//{"E3_NUM","E3_SERIE","E3_EMISSAO","E3_CODCLI","E3_LOJA","A1_NOME","E3_BASE"} 
			aadd(oGridNF:aCols, { ; 
				aDados[nX][6] ,; //nota
				aDados[nX][7] ,; //serie
				aDados[nX][11] ,; //emissao
				aDados[nX][8] ,; //cliente
				aDados[nX][9] ,; //loja
				aDados[nX][10] ,; //nome
				aDados[nX][3] ,; //Vlr Reembolso
				aDados[nX][2] ,; //RECNO
			.F.})
		endif
	next nX
	
	oGridNF:Refresh()
	oGridNF:GoTo(1) //vai para primeira linha
	CarrDetNF()
	AtuTotal()
	
Return

//---------------------------------------------------------
// Carrega detalhe da NF, para informar valor reembolso
//---------------------------------------------------------
Static Function CarrDetNF()
	
	Local nPosLin  := aScan(aDados, {|x| x[2] == oGridNF:aCols[oGridNF:nAt][len(oGridNF:aHeader)+1] })
	
	//limpo variaveis
	cMotDev := ""
	cHisDev := ""
	nVlrNF := 0
	
	if nPosLin > 0
		//aDados := {{cVend, nRecno, nVlrFrete, cMotDev, cHistDev, cNota, cSerie, cCliente, cLoja, cNomeCli, dEmissao},...}
		cMotDev := aDados[nPosLin][4] + " - " + Posicione("DHI",1,xFilial("DHI")+aDados[nPosLin][4],"DHI_DESCRI")
		cHisDev := aDados[nPosLin][5]
		nVlrNF := Posicione("SF1",1,xFilial("SF1")+aDados[nPosLin][6]+aDados[nPosLin][7]+aDados[nPosLin][8]+aDados[nPosLin][9],"F1_VALBRUT")
	endif
	
	oMotDev:Refresh()
	oHisDev:Refresh()
	oVlrNF:Refresh()
	
Return


//---------------------------------------------------------
// validaçao da linha do getdados. grava valor reembolso no aDados
//---------------------------------------------------------
Static Function VldLinha()

	Local nPosLin  := aScan(aDados, {|x| x[2] == oGridNF:aCols[oGridNF:nAt][len(oGridNF:aHeader)+1] })
	
	if nPosLin > 0
		//aDados := {{cVend, nRecno, nVlrFrete, cMotDev, cHistDev, cNota, cSerie, cCliente, cLoja, cNomeCli, dEmissao},...}
		aDados[nPosLin][3] := oGridNF:aCols[oGridNF:nAt][len(oGridNF:aHeader)]
	endif
	
	AtuTotal()

Return .T.

//---------------------------------------------------------
// Atualiza campo total reembolso
//---------------------------------------------------------
Static Function AtuTotal()
	
	Local nX := 0 
	Local nPosVlr := len(oGridNF:aHeader)
	
	nTotReemb := 0
	
	for nX := 1 to len(oGridNF:aCols)
		nTotReemb += oGridNF:aCols[nX][nPosVlr]
	next 
	
	oTotReemb:Refresh()
	
Return

//---------------------------------------------------------
// Grava valores gerando movimentos na SE3
//---------------------------------------------------------
Static Function GravaFrete()

	Local nX
	Local nPos
	Local lValZero := .F.
	Local aGrava := {} //{cVend, nTotReemb}
	Local cCliComiss := SuperGetMv("MV_XCLICOM",,"") //cliente para inclusao do movimento de comissão (codcli;loja) Ex: 000001;01
	Local aCliCom := StrToKArr(Alltrim(cCliComiss),";")
	Local aSE3 := {}
	Local cPrefix
	Local cNum
	Local cParcel 
	Local dDataCom
	Local lRet := .T.
	Private lMsErroAuto := .F.
	
	VldLinha() //atualiza aDados
	
	if empty(aCliCom) .OR. len(aCliCom) < 2 .OR. empty(Posicione("SA1",1,xFilial("SA1")+aCliCom[1]+aCliCom[2],"A1_COD"))
		MsgInfo("Parametro MV_XCLICOM não configurado. Sintaxe: codigo;loja .")
		Return .F.
	Endif
	
	//validando notas que nao foi informado valor frete
	//aDados := {{cVend, nRecno, nVlrFrete, cMotDev, cHistDev, cNota, cSerie, cCliente, cLoja, cNomeCli, dEmissao},...} 
	for nX := 1 to len(aDados)
		if empty(aDados[nX][3]) .AND. !lValZero
			if MsgYesNo("Não foi informado o valor de frete para algumas notas do vendedor "+Alltrim(Posicione("SA3",1,xFilial("SA3")+aDados[nX][1],"A3_NOME"))+"."+;
						chr(13)+chr(10)+;
						"Deseja continuar mesmo assim?","Atenção")
						
				lValZero := .T.
			else
				Return .F.
			endif
		endif
		
		//montando array aGrava, somando todos os valores reembolso por vendedor
		if (nPos := aScan(aGrava, {|x| x[1] == aDados[nX][1] })) > 0
			aGrava[nPos][2] += aDados[nX][3]			
		else
			aadd(aGrava, {aDados[nX][1], aDados[nX][3]} )
		endif
		
	next nX
	
	BeginTran()
	
	for nX := 1 to len(aGrava)
		aSE3 := {}
		lMsErroAuto := .F.
		
		if aGrava[nX][2] > 0
			
			cPrefix := PadR("RF",TamSx3("E3_PREFIXO")[1])
			cNum    := PadR(DTOS(mv_par06),TamSx3("E3_NUM")[1])
			cParcel := StrZero(0,TamSx3("E3_PARCELA")[1])
			
			//valido não repetiçao de chave
			//Indice 2: E3_FILIAL+E3_VEND+E3_PREFIXO+E3_NUM+E3_PARCELA+E3_SEQ
			While !empty(Posicione("SE3",2,xFilial("SE3")+aGrava[nX][1]+cPrefix+cNum+cParcel,"E3_VEND"))
				cParcel := Soma1(cParcel)
			enddo
			
			dDataCom := dDataBase
			if dDataCom > mv_par03 //data fim emissão
				dDataCom := mv_par03 
			elseif dDataCom > mv_par11 //data fim vencto
				dDataCom := mv_par11 
			endif
			
			//Incluindo movimento de comissão (padrão) 
			aAdd(aSE3,{"E3_VEND" 		,aGrava[nX][1]	,Nil})
			aAdd(aSE3,{"E3_PREFIXO" 	,cPrefix		,Nil})
			aAdd(aSE3,{"E3_NUM" 		,cNum			,Nil})
			aAdd(aSE3,{"E3_PARCELA" 	,cParcel		,Nil})
			aAdd(aSE3,{"E3_EMISSAO" 	,dDataCom 		,Nil})
			aAdd(aSE3,{"E3_CODCLI" 		,SA1->A1_COD 	,Nil})
			aAdd(aSE3,{"E3_LOJA" 		,SA1->A1_LOJA 	,Nil})
			aAdd(aSE3,{"E3_BASE" 		,(aGrava[nX][2]*(-1)) ,Nil})
			aAdd(aSE3,{"E3_PORC" 		,100 			,Nil})
			aAdd(aSE3,{"E3_VENCTO" 		,dDataCom 		,Nil})
			aAdd(aSE3,{"E3_MOEDA" 		,"01" 			,Nil})
			
			MSExecAuto({|x,y| Mata490(x,y)}, aSE3, 3) //Inclusao
				
			If lMsErroAuto
				MostraErro()
				DisarmTransaction()
				lRet := .F.
				EXIT
			Endif
		endif
				
	next nX
	
	EndTran()
	
	Pergunte("MTA530",.F.) //restauro perguntas
	oDlgFrete:End() //fecha tela
	
Return lRet

//---------------------------------------------------------
// Visualiza NF de Devoluçao
//---------------------------------------------------------
Static Function VerNFDev()

	Local nPosLin  := aScan(aDados, {|x| x[2] == oGridNF:aCols[oGridNF:nAt][len(oGridNF:aHeader)+1] })
	Local aArea := GetArea()
	Private aRotina := {{},{"Visualizar","A140NFiscal"	, 0 , 2, 0, .F.}} 
	Private cCadastro := "Documento de Entrada - VISUALIZAR"
	
	//aDados := {{cVend, nRecno, nVlrFrete, cMotDev, cHistDev, cNota, cSerie, cCliente, cLoja, cNomeCli, dEmissao},...}
	SF1->(DbSetOrder(1))
	If SF1->(DbSeek( xFilial("SF1")+aDados[nPosLin][6]+aDados[nPosLin][7]+aDados[nPosLin][8]+aDados[nPosLin][9] ))
		A103NFiscal("SF1",SF1->(Recno()),2)
	else
		MsgInfo("Não foi possível encontrar NF de devoulção!")
	EndIf
	
	Pergunte("MTA530",.F.) //restauro perguntas
	
	RestArea(aArea)
	
Return
