#INCLUDE 'PROTHEUS.CH'
#INCLUDE "rwmake.ch"
#INCLUDE "topconn.ch"

/*/{Protheus.doc} RFINA005

Rotina de Apuração de Comissão CLT

@author Danilo Brito
@since 07/03/2017
@version Desenvolvido para P12
@param Nao recebe parametros
@return nulo
/*/

User Function RFINA005()
	
	Local lOk := .F.
	
	Private cPerg 	:= "RFINA005"
	Private dDataIni
	Private dDataFim
	Private cVendIni
	Private cVendFim
	
	AjustaSX1()	//Inclui perguntas no dicionário	
	while Pergunte(cPerg, .T.) //Chama a tela de parametros
		
		dDataIni	:= MV_PAR01
		dDataFim	:= MV_PAR02
		cVendIni	:= MV_PAR03
		cVendFim	:= MV_PAR04
		
		if dDataIni > dDataFim
			MsgAlert("Parametros de datas não preenchidos corretamente!","Atenção")
		elseif cVendIni > cVendFim
			MsgAlert("Parametros de vendedor não preenchidos corretamente!","Atenção")
		else
			lOk := .T.
			EXIT
		endif
		
	enddo
	
	if lOk 
		MsAguarde({||  AbreRotina()  },"Aguarde...","Buscando vendedores para apuração...",.T.)
	endif
	
Return

//---------------------------------------------------------
// Monta tela e todos processamentos da rotina
//---------------------------------------------------------
Static Function AbreRotina()

	Local nX		:= 0
	
	//dimensionamento de tela e componentes
	Local aSize 	:= MsAdvSize() // Retorna a área útil das janelas Protheus 
	Local aInfo 	:= {aSize[1], aSize[2], aSize[3], aSize[4], 2, 2}
	Local aPObj 	:= MsObjSize(aInfo, {{ 100, 100, .T., .T.}, { 100, 000, .T., .F.}})
	
	//enchoicebar
	Local bOk := {|| MsAguarde({||  GravaApura()  },"Aguarde...","Gravando registros...",.T.), oDlgApura:End() } 
	Local bCancel := {|| oDlgApura:End() }
	Local aButtons := {}
	Local oFontTitle := TFont():New('Arial',,23,.T.,.F.)
	Local oFontGrid := TFont():New('Arial',,18,.T.,.T.)
	Local nCorGrid	:= 7888896
	
	//variáveis de dados
	Private cCadastro := "Apuração de Comissão CLT"
	Private dEmissao := dDataBase
	Private nVlrTotal := 0
	Private aObjCalc  := {}
	Private aColsVend := {}
	Private aDetApura := {} 
	Private aLinApura := {}
	Private cObserv   := ""
	
	//variaveis objetos da tela
	Private oDlgApura	
	Private oDataIni
	Private oDataFim
	Private oEmissao
	Private oGridVend
	Private oGridApura
	Private oVlrTotal 
	Private oObserv
	
	
	DbSelectArea("SA3")
	SA3->(DbSetOrder(1))
	if !empty(cVendIni)
		SA3->(DbSeek(xFilial("SA3")+cVendIni))
	else
		SA3->(DbGoTop())
	endif
	
	While SA3->(!Eof()) .AND. SA3->A3_FILIAL+SA3->A3_COD <= xFilial("SA3")+cVendFim
		
		if !empty(SA3->A3_XREGRA) .AND. !empty(SA3->A3_XBASPRE)
			//posiciona na regra
			if !empty(Posicione("Z01",1,xFilial("Z01")+SA3->A3_XREGRA, "Z01_DESCRI"))
				//posiciona na base premio
				if !empty(Posicione("Z03",1,xFilial("Z03")+SA3->A3_XBASPRE, "Z03_DESCRI"))
					//posiciona na META
					if !empty(Posicione("Z05",1,xFilial("Z05")+SA3->A3_COD+STRZERO(YEAR(dDataIni),4)+STRZERO(MONTH(dDataIni),2),"Z05_VEND"))
						
						//verificando se ja existe apuração realizada com as datas
						if !TemApuracao( SA3->A3_COD )
						
							aadd(aColsVend, { ;
								SA3->A3_COD,;
								SA3->A3_NOME,;
								SA3->A3_XREGRA,;
								Z01->Z01_DESCRI,;
								Z03->Z03_VLBASE,;
								Z03->Z03_PATMIN,;
								Z03->Z03_PATMAX,;
								.F.; //deletado
							})
							
						else
							MsgInfo("Vendedor " + SA3->A3_COD + " - " + Alltrim(SA3->A3_NOME) + chr(13) + chr(10) + ;
								  " já possui apuração nessas datas." + chr(13) + chr(10) + ;
								  chr(13) + chr(10) + ;
								  " Código da Apuraçao: " + Z07->Z07_CODIGO + chr(13) + chr(10) + ;
								  " Período Apurado: de " + DTOC(Z07->Z07_DTINI) + " a " + DTOC(Z07->Z07_DTFIM)  + chr(13) + chr(10) + ;
								  chr(13) + chr(10) + ;
								  " Vendedor não será considerado nesta apuração." )
						endif
					endif
				endif
			endif				
		endif
		
		SA3->(DbSkip())
	Enddo
	
	//se encontrou os vendedores
	if !empty(aColsVend)
		For nX := 1 to len(aColsVend)
			//cria instancias da classe por vendedor
			aadd(aObjCalc, CALCCOMISSAO():New(aColsVend[nX][1], .F.) )				
		Next nX 

		//começa montagem do DLG
		//oDlgApura := TDialog():New(aSize[7],aSize[1],aSize[6],aSize[5],"Apuração de Comissão CLT",,,,,,,,,.T.)
		DEFINE MSDIALOG oDlgApura TITLE "Apuração de Comissão CLT" FROM aSize[7],aSize[1] TO aSize[6],aSize[5] PIXEL OF GetWndDefault() STYLE nOr(WS_VISIBLE, WS_POPUP) 
		
		//barra de menus e titulo
		EnchoiceBar(oDlgApura, bOk, bCancel,.F.,@aButtons,0,"Z07", .F., .F., .T., .T., .F.)
		
		//campos da tela
		TSay():New( 38,10,{|| "Data Inicio" }, oDlgApura,,,,,,.T.,CLR_BLACK,,50,9 )
		oDataIni := TGet():New( 35, 45, {|u| iif( PCount()==0,dDataIni,dDataIni:= u) },oDlgApura,50,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.T.,.F.,,"Z07_DTINI",,,,.T.,.F.)

		TSay():New( 38,120,{|| "Data Fim" }, oDlgApura,,,,,,.T.,CLR_BLACK,,50,9 )
		oDataFim := TGet():New( 35, 155, {|u| iif( PCount()==0,dDataFim,dDataFim:= u) },oDlgApura,50,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.T.,.F.,,"Z07_DTFIM",,,,.T.,.F.)
		
		TSay():New( 38,230,{|| "Dt.Apuração" }, oDlgApura,,,,,,.T.,CLR_BLACK,,50,9 )
		oEmissao := TGet():New( 35, 270, {|u| iif( PCount()==0,dEmissao,dEmissao:= u) },oDlgApura,50,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.T.,.F.,,"Z07_EMISSA",,,,.T.,.F.)
		
		//grid vendedores
		TSay():New( aPObj[1,1]+25,07,{|| "Vendedores" }, oDlgApura,,oFontGrid,,,,.T.,nCorGrid,,200,15 )
		TSay():New( aPObj[1,1]+25,aPObj[1,2],{|| Replicate("_",aPObj[1,4]) }, oDlgApura,,oFontTitle,,,,.T.,nCorGrid,,aPObj[1,4],15 )
		oGridVend := DoGridVend(oDlgApura, aPObj[1,1]+38, aPObj[1,2], aPObj[1,1]+120, aPObj[1,4]+3) 
		oGridVend:aCols := aColsVend 
		oGridVend:oBrowse:bchange := {|| CarrDetVend() }
		
		//grid valores apurados
		TSay():New( aPObj[1,1]+125,07,{|| "Valores apurados do vendedor" }, oDlgApura,,oFontGrid,,,,.T.,nCorGrid,,200,15 )
		TSay():New( aPObj[1,1]+125,aPObj[1,2],{|| Replicate("_",aPObj[1,4]) }, oDlgApura,,oFontTitle,,,,.T.,nCorGrid,,aPObj[1,4],15 )
		oGridApura := DoGridApura(oDlgApura, aPObj[1,1]+138, aPObj[1,2], aPObj[1,3]-15, aPObj[1,4]+3)			 
		
		TSay():New( aPObj[1,3]-5,aPObj[1,4]-175,{|| "Valor Premio Total" }, oDlgApura,,oFontGrid,,,,.T.,nCorGrid,,160,10 )
		oVlrTotal := TGet():New( aPObj[1,3]-13, aPObj[1,4]-100, {|u| iif( PCount()==0,nVlrTotal,nVlrTotal:= u) },oDlgApura,100,20,PesqPict("Z07","Z07_PREVOL"),/*bValid*/,,,oFontTitle,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.T.,.F.,,"premio",,,,.T.,.F.)
		
		//observações
		oObserv := TSay():New( aPObj[1,3]-5,10,{|| cObserv }, oDlgApura,,,,,,.T.,CLR_BLUE,,300,9 )
		
		//encerra montagem DLG
		oDlgApura:bInit := {||( MsAguarde({||  FazApuracao()  },"Aguarde...","Processando apuração...",.T.) )}  
		oDlgApura:lCentered := .T.
		oDlgApura:Activate()
	
		//destruindo instancia dos objetos
		For nX := 1 to len(aColsVend)
			aObjCalc[nX]:Destroy()
		Next nX
	else
		MsgAlert("Não foram encontrados vendedores configurados para apuração!","Atenção")
	endif
	
Return

//---------------------------------------------------------
// Monta Grid de Vendedores
//---------------------------------------------------------
Static Function DoGridVend(oDlg, nTop, nLeft, nBottom, nRight)

	Local nX
	Local aHeaderEx    := {}
	Local aColsEx      := {}
	Local aFieldFill   := {}
	Local aFields      := {"A3_COD","A3_NOME","A3_XREGRA","Z01_DESCRI","Z03_VLBASE","Z03_PATMIN","Z03_PATMAX"}
	Local aAlterFields := {}
	Local nLinMax 	   := 999  // Quantidade de linha na getdados
	
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

Return MsNewGetDados():New( nTop, nLeft, nBottom, nRight, , "AllwaysTrue", "AllwaysTrue", "AllwaysTrue",;
							aAlterFields, , nLinMax, "AllwaysTrue", "AllwaysTrue", "AllwaysTrue", oDlg, aHeaderEx, aColsEx)


//---------------------------------------------------------
// Monta Grid de Apuração
//---------------------------------------------------------
Static Function DoGridApura(oDlg, nTop, nLeft, nBottom, nRight)

	Local nX
	Local aHeaderEx    := {}
	Local aColsEx      := {}
	Local aFieldFill   := {}
	Local aFields      := {"Z07_PROD","Z07_GRUPO","B1_DESC","Z07_METVOL","Z07_REAVOL","Z07_PATVOL","Z07_METFAT","Z07_REAFAT","Z07_PATFAT","Z07_PMETMC","Z07_PREAMC","Z07_PATMCT","Z07_PREVOL","Z07_PREFAT","Z07_PREMCT"}
	Local aAlterFields := {}
	Local nLinMax 	   := 999  // Quantidade de linha na getdados
	
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
	
	aLinApura := aClone(aFieldFill) //salvo linha vazia para utilizar quando nao há registros a mostrar
	
Return MsNewGetDados():New( nTop, nLeft, nBottom, nRight, , "AllwaysTrue", "AllwaysTrue", "AllwaysTrue",;
							aAlterFields, , nLinMax, "AllwaysTrue", "AllwaysTrue", "AllwaysTrue", oDlg, aHeaderEx, aColsEx)


//----------------------------------------------------------------
// Carrega o detalhamento da apuração do vendedor selecionado 
//----------------------------------------------------------------
Static Function CarrDetVend()
	
	Local nX
	Local nVend := oGridVend:nAt
	Local cDescric
	
	//limpo grid e totalizador
	oGridApura:aCols := {}
	nVlrTotal := 0
	
	if !empty(aDetApura)
		
		//aDetApura{1"Z07_PROD",2"Z07_GRUPO",3"Z07_METVOL",4"Z07_REAVOL",5"Z07_PATVOL",6"Z07_PREVOL",7"Z07_PMETMC",
		// 			8"Z07_PREAMC",9"Z07_PATMCT",10"Z07_PREMCT",11"Z07_DTINI",12"Z07_DTFIM",13"Z02_PVOL",14"Z02_PMARG",
		// 			15"Z07_METFAT",16"Z07_REAFAT",17"Z07_PATFAT",18"Z07_PREFAT",19"Z02_PFATUR"}
		for nX := 1 to len(aDetApura[nVend]) 
			
			if !empty(aDetApura[nVend][nX][1])//produto
				cDescric := Posicione("SB1",1,xFilial("SB1")+aDetApura[nVend][nX][1],"B1_DESC")
			elseif !empty(aDetApura[nVend][nX][2]) //grupo
				cDescric := Posicione("SBM",1,xFilial("SBM")+aDetApura[nVend][nX][2],"BM_DESC")
			else
				cDescric := "TOTAL REGIÃO"
			endif 
			
			//aCols{"Z07_PROD","Z07_GRUPO","B1_DESC","Z07_METVOL","Z07_REAVOL","Z07_PATVOL","Z07_METFAT","Z07_REAFAT",
			//		"Z07_PATFAT","Z07_PMETMC","Z07_PREAMC","Z07_PATMCT","Z07_PREVOL","Z07_PREFAT","Z07_PREMCT"}
			aadd(oGridApura:aCols, { ;
				aDetApura[nVend][nX][1],; //Z07_PROD
				aDetApura[nVend][nX][2],; //Z07_GRUPO
				cDescric ,; //B1_DESC
				aDetApura[nVend][nX][3],; //Z07_METVOL
				aDetApura[nVend][nX][4],; //Z07_REAVOL
				aDetApura[nVend][nX][5],; //Z07_PATVOL
				aDetApura[nVend][nX][15],; //Z07_METFAT
				aDetApura[nVend][nX][16],; //Z07_REAFAT
				aDetApura[nVend][nX][17],; //Z07_PATFAT
				aDetApura[nVend][nX][7],; //Z07_PMETMC
				aDetApura[nVend][nX][8],; //Z07_PREAMC
				aDetApura[nVend][nX][9],; //Z07_PATMCT
				aDetApura[nVend][nX][6],; //Z07_PREVOL
				aDetApura[nVend][nX][18],; //Z07_PREFAT
				aDetApura[nVend][nX][10],; //Z07_PREMCT
				.F. ; //deletado
			})
			
			//totaliza premios
			nVlrTotal += aDetApura[nVend][nX][6] //Z07_PREVOL
			nVlrTotal += aDetApura[nVend][nX][18] //Z07_PREFAT
			nVlrTotal += aDetApura[nVend][nX][10] //Z07_PREMCT
					
		next nX
	endif
	
	//se vazio, coloca linha em branco
	if empty(oGridApura:aCols)
		aadd(oGridApura:aCols, aClone(aLinApura))
	endif
	
	nX := aObjCalc[nVend]:CalcDiasWarmUp(dDataIni, dDataFim)
	if nX > 0
		cObserv := "* Vendedor em periodo de WarmUp"
		if aObjCalc[nVend]:nFatWarmUp < 1 //se não é periodo todo
			cObserv += " (parcial de " + cValToChar(nX) + " dias)"
		endif
	else
		cObserv := ""
	endif
		
	oGridApura:Refresh()
	oVlrTotal:Refresh()
	oObserv:Refresh()
	
Return


//----------------------------------------------------------------
// faz apuração dos vendedores 
//----------------------------------------------------------------
Static Function FazApuracao()
	
	Local aApuraTmp := {}
	Local nX

	For nX := 1 to len(aColsVend)
		aApuraTmp := aObjCalc[nX]:ApuraCLT(dDataIni, dDataFim)
		aadd(aDetApura, aClone(aApuraTmp) )
	Next nX
	
	//carrega detalhes do 1º vendedor 
	CarrDetVend()
	
Return


//----------------------------------------------------------------
// faz gravação da apuração dos vendedores 
//----------------------------------------------------------------
Static Function GravaApura()

	Local lOk := .T.
	Local aApuraTmp := {}
	Local nX
	
	BeginTran()
	
	For nX := 1 to len(aColsVend)
		if aObjCalc[nX]:nTotPremio > 0 //se chegou em um valor de apuração
			if aObjCalc[nX]:GravaApuracao()
				aadd(aApuraTmp, aObjCalc[nX]:GetIdApura() )
			else
				MsgAlert("Falha na gravação da apuração!" + aObjCalc[nX]:GetError() )
				lOk := .F.
			endif
		endif
	Next nX
	
	if lOk 
		EndTran()
		if MsgYesNo("Apuração gravada com sucesso! Deseja imprimir relatório da apuração?")
			U_RFINR001(aApuraTmp)
		endif
	else
		DisarmTransaction()
	endif
	
Return

//---------------------------------------------------------
// verifica se ja existe apuração para o vendedor no periodo
//---------------------------------------------------------
Static Function TemApuracao(cVendedor)

	Local lRet := .F.
	Local cQry  := ""
	
	cQry := " SELECT COUNT(*) QUANT "
	cQry += " FROM " + RetSqlName("Z07")
	cQry += " WHERE D_E_L_E_T_ <> '*' " 
	cQry += "   AND Z07_FILIAL = '"+xFilial("Z07")+"' " 
	cQry += "   AND Z07_VEND = '"+cVendedor+"' " 
	cQry += "   AND (('"+DTOS(dDataIni)+"' BETWEEN Z07_DTINI AND Z07_DTFIM )" 
	cQry += "    OR ('"+DTOS(dDataFim)+"' BETWEEN Z07_DTINI AND Z07_DTFIM ))" 
	
	If Select("QAUX") > 0
		QAUX->(dbCloseArea())
	EndIf
	
	cQry := ChangeQuery(cQry)
	dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUX", .F., .T.)
	
	If !Empty(QAUX->QUANT)
		lRet := .T.
	endif
	
	QAUX->(dbCloseArea())
	
Return lRet


//----------------------------------------------------------------
// Cria perguntas, caso ainda nao tenha
//----------------------------------------------------------------
Static Function AjustaSX1()

	U_xPutSx1(cPerg,"01","Data De ?"	  ,"","","mv_ch1","D",8,0,0,"G","",""   ,"","","mv_par01","","","","","","","","","","","","","","","","",{"",""},{"",""},{"",""})
	U_xPutSx1(cPerg,"02","Data Ate ?"	  ,"","","mv_ch2","D",8,0,0,"G","",""   ,"","","mv_par02","","","","","","","","","","","","","","","","",{"",""},{"",""},{"",""})
	U_xPutSx1(cPerg,"03","Vendedor Ate ?","","","mv_ch3","C",6,0,0,"G","","SA3","","","mv_par03","","","","      ","","","","","","","","","","","","",{"",""},{"",""},{"",""})
	U_xPutSx1(cPerg,"04","Vendedor Ate ?","","","mv_ch4","C",6,0,0,"G","","SA3","","","mv_par04","","","","ZZZZZZ","","","","","","","","","","","","",{"",""},{"",""},{"",""})

Return