#INCLUDE 'PROTHEUS.CH'
#INCLUDE "rwmake.ch"
#INCLUDE "topconn.ch"

#DEFINE CRLF CHR(13)+CHR(10)

/*/{Protheus.doc} ROMSR001

Impressão do PickList - Faturamento Triangular, com codigo de barras

@author Danilo Brito
@since 16/03/2017
@version Desenvolvido para P12
@param Nao recebe parametros
@return nulo
/*/
User Function ROMSR001(cPedido, cCarga, nTipo, nAgrupa)

	Local oReport := nil
	Default cPedido := ""
	Default cCarga := ""
	Default nTipo := 1 //TMSPrinter
	Default nAgrupa := 1 //1=sim;2=nao
	Private lAgrupa := .T.
	Private cPerg := ""

	if empty(cPedido+cCarga)
		cPerg := "ROMSR001"
		U_xPutSx1(cPerg,"01","Carga ?"	  ,"","","mv_ch1","C",6,0,0,"G","U_TBCFTRI1('DAK')","DAK","","","mv_par01","","","","","","","","","","","","","","","","",{"Informe o numero da carga que tenha ","pedidos configurado para tirar estoque ","de outra filial."},{"",""},{"",""})
		U_xPutSx1(cPerg,"02","Pedido ?"	  ,"","","mv_ch2","C",6,0,0,"G","U_TBCFTRI1('SC5')","SC5","","","mv_par02","","","","","","","","","","","","","","","","",{"Informe o numero do pedito que está ","configurado para tirar estoque de outra ","filial."},{"",""},{"",""})
		U_xPutSx1(cPerg,"03","Tipo Rel. ?","","","mv_ch3","N",1,0,0,"C","","","","","mv_par03","TMSPrinter","TMSPrinter","TMSPrinter","1","TReport","TReport","TReport","","","","","","","","","",{"Tipo de Relatório: TMSPrinter (grafico","com codigo de barras) ou TReport (exportavel para","Excel)"},{"",""},{"",""})
		U_xPutSx1(cPerg,"04","Agrupar Prod.?","","","mv_ch4","N",1,0,0,"C","","","","","mv_par04","Sim","Sim","Sim","1","Não","Não","Não","","","","","","","","","",{"Agrupa por produto? Tem efeito apenas","quando o tipo relatório for TMSPrinter."},{"",""},{"",""})

		if Pergunte(cPerg , .T.)
			cPedido := MV_PAR02
			cCarga  := MV_PAR01
			nTipo	:= MV_PAR03
			nAgrupa := MV_PAR04
		else
			Return
		endif
	endif

	lAgrupa := nAgrupa == 1 //1=sim;2=nao

	if !empty(cCarga)
		DbSelectArea("DAK")
		DAK->(DbSetOrder(1))
		if !DAK->(DbSeek(xFilial("DAK")+cCarga))
			MsgInfo("Carga não encontrada!")
			Return
		endif
	elseif !empty(cPedido)
		DbSelectArea("SC5")
		SC5->(DbSetOrder(1))
		if !SC5->(DbSeek(xFilial("SC5")+cPedido))
			MsgInfo("Pedido não encontrado!")
			Return
		endif
	else
		MsgInfo("Informe um Pedido ou Carga!")
		Return
	endif

	if nTipo == 1 //TMSPrinter
		RelTMSPrint(cPedido, cCarga)
	else
		oReport := ReportDef(cPedido, cCarga)
		oReport:PrintDialog()
	endif

Return

//---------------------------------------------------------
// Definiçao da estrutura do relatorio
//---------------------------------------------------------
Static Function ReportDef(cPedido, cCarga)

	Local oReport
	Local cTitle    	:= "Picklist de Separação"
	Local oSection:= Nil
	Local oSecItem:= Nil

	/*Sintaxe: TReport():New(cNome,cTitulo,cPerguntas,bBlocoCodigo,cDescricao)*/
	oReport := TReport():New("ROMSR001",cTitle,"",{|oReport| PrintReport(oReport, cPedido, cCarga, 2)},cTitle)
	oReport:SetPortrait() 		// Orientação retrato
	//oReport:SetLandscape()		// Orientação paisagem
	//oReport:HideHeader()  		// Nao imprime cabeçalho padrão do Protheus
	//oReport:HideFooter()			// Nao imprime rodapé padrão do Protheus
	oReport:HideParamPage()			// Inibe impressão da pagina de parametros
	oReport:SetUseGC(.T.) 			// Habilita o botão <Gestao Corporativa> do relatório
	//oReport:DisableOrientation()  // Desabilita a seleção da orientação (retrato/paisagem)
	//oReport:SetTotalInLine(.F.)   // totalizador em linha

	if empty(cCarga)
		oSection:= TRSection():New(oReport, "Pedido", {"SC5"}, , .F., .T.)
		TRCell():New(oSection,"C5_NUM"		,"SC5", "Pedido")
		TRCell():New(oSection,"C5_XIDTRI" 	,"SC5", "Id.Triang.")
	else
		oSection:= TRSection():New(oReport, "Pedido", {"DAK"}, , .F., .T.)
		TRCell():New(oSection,"DAK_COD"  	,"DAK", "Carga")
		TRCell():New(oSection,"DAK_XIDTRI" 	,"DAK", "Id.Triang.")
		//TRCell():New(oSection,"DAK_PTOENT" 	,"DAK", "Ptos. Entrega")
	endif

	oSecItem:= TRSection():New(oSection, "Itens", {"SC9","SC6","SB1"}, , .F., .T.)

	TRCell():New(oSecItem,"C9_ITEM"		,"SC9")
	TRCell():New(oSecItem,"C9_PRODUTO"	,"SC9")
	TRCell():New(oSecItem,"B1_DESC"		,"SB1")
	TRCell():New(oSecItem,"B1_UM"		,"SB1")
	TRCell():New(oSecItem,"C9_QTDLIB"	,"SC9")
	TRCell():New(oSecItem,"C9_LOCAL"	,"SC9")
	TRCell():New(oSecItem,"C9_LOTECTL"	,"SC9")
	TRCell():New(oSecItem,"C6_LOCALIZ"	,"SC6")


Return(oReport)

//---------------------------------------------------------
// Faz impressão do relatório
//---------------------------------------------------------
Static Function PrintReport(oReport, cPedido, cCarga, nTipo)

	Local oSection
	Local oSecItem
	Local nIndice
	Local cChave1
	Local cChave2
	Local aDados := {}
	Local nPAux := 0
	Local nX := 0
	Default nTipo := 2 //TReport

	if nTipo == 2
		oSection := oReport:Section(1)
		oSecItem := oReport:Section(1):Section(1)
		oSection:Init() //inicializo a primeira seção
		oSection:Printline()
	endif

	if empty(cCarga) //se vazio é por pedido
		nIndice := 1 //C9_FILIAL+C9_PEDIDO+C9_ITEM+C9_SEQUEN+C9_PRODUTO
		cChave1 := "SC9->(C9_FILIAL+C9_PEDIDO)"
		cChave2 := xFilial("SC9")+SC5->C5_NUM
	else //por carga
		nIndice := 5 //C9_FILIAL+C9_CARGA+C9_SEQCAR+C9_SEQENT
		cChave1 := "SC9->(C9_FILIAL+C9_CARGA+C9_SEQCAR)"
		cChave2 := xFilial("SC9")+DAK->DAK_COD+DAK->DAK_SEQCAR
	endif

	SC9->(DbSetOrder(nIndice))
	if SC9->(DbSeek(cChave2))

		if nTipo == 2
			oSecItem:Init() //inicializo a seção itens
		endif

		//Irei percorrer todos os meus registros
		While SC9->(!Eof()) .AND. &(cChave1) == cChave2

			if nTipo == 2
				If oReport:Cancel()
					Exit
				EndIf

				oReport:IncMeter()
				IncProc("Imprimindo dados...")
			endif

			//posicionando tabelas
			SB1->(DbSetOrder(1))
			SB1->( dbSeek(xFilial("SB1")+SC9->C9_PRODUTO) )
			SC6->(DbSetOrder(1)) //C6_FILIAL+C6_NUM+C6_ITEM+C6_PRODUTO
			SC6->(dbSeek( SC9->C9_FILIAL+SC9->C9_PEDIDO+SC9->C9_ITEM ) )

			if nTipo == 2
				oSecItem:Printline()
			else

				if lAgrupa
					//Agrupando por produto a pedido do Alexandre
					if (nPAux := aScan(aDados, {|x| x[1] == SC9->C9_PRODUTO })) > 0
						aDados[nPAux][4] += SC9->C9_QTDLIB
					else
						aadd(aDados, {SC9->C9_PRODUTO, SB1->B1_DESC, SB1->B1_UM, SC9->C9_QTDLIB, SC9->C9_LOCAL, SC9->C9_LOTECTL, SC6->C6_LOCALIZ } )
					endif
				else
					//Mudando de página
					if nLin >= nMargemB
						Rod()
						Cabecalho()
						CabItens()
					endif

					nCol := 1
					oPrint:Say(nLin, aColPos[nCol], SC9->C9_ITEM, oFont10,,,,aColAlign[nCol++])
					oPrint:Say(nLin, aColPos[nCol], SC9->C9_PRODUTO, oFont10,,,,aColAlign[nCol++])
					oPrint:Say(nLin, aColPos[nCol], SB1->B1_DESC, oFont10,,,,aColAlign[nCol++])
					oPrint:Say(nLin, aColPos[nCol], SB1->B1_UM, oFont10,,,,aColAlign[nCol++])
					oPrint:Say(nLin, aColPos[nCol], Transform(SC9->C9_QTDLIB, PesqPict("SC9","C9_QTDLIB")), oFont10,,,,aColAlign[nCol++])
					oPrint:Say(nLin, aColPos[nCol], SC9->C9_LOCAL, oFont10,,,,aColAlign[nCol++])
					oPrint:Say(nLin, aColPos[nCol], SC9->C9_LOTECTL, oFont10,,,,aColAlign[nCol++])
					oPrint:Say(nLin, aColPos[nCol], SC6->C6_LOCALIZ, oFont10,,,,aColAlign[nCol++])

					nLin += 50
				endif

			endif

			SC9->(DbSkip())
		Enddo

		//finalizo as seções
		if nTipo == 2
			oSecItem:Finish()
		elseif lAgrupa
			//impirmindo agrupado
			for nX := 1 to len(aDados)
				if nLin >= nMargemB
					Rod()
					Cabecalho()
					CabItens()
				endif

				nCol := 1
				oPrint:Say(nLin, aColPos[nCol], StrZero(nX,2), oFont10,,,,aColAlign[nCol++])
				oPrint:Say(nLin, aColPos[nCol], aDados[nX][1], oFont10,,,,aColAlign[nCol++])
				oPrint:Say(nLin, aColPos[nCol], aDados[nX][2], oFont10,,,,aColAlign[nCol++])
				oPrint:Say(nLin, aColPos[nCol], aDados[nX][3], oFont10,,,,aColAlign[nCol++])
				oPrint:Say(nLin, aColPos[nCol], Transform(aDados[nX][4], PesqPict("SC9","C9_QTDLIB")), oFont10,,,,aColAlign[nCol++])
				oPrint:Say(nLin, aColPos[nCol], aDados[nX][5], oFont10,,,,aColAlign[nCol++])
				oPrint:Say(nLin, aColPos[nCol], aDados[nX][6], oFont10,,,,aColAlign[nCol++])
				oPrint:Say(nLin, aColPos[nCol], aDados[nX][7], oFont10,,,,aColAlign[nCol++])

				nLin += 50
			next nX
		endif

	endif

	if nTipo == 2
		oSection:Finish()
	endif

Return

Static Function RelTMSPrint(cPedido, cCarga)

	Local nTab := 0
	Local cNumPVBarra := ""

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Variaveis de Tipos de fontes que podem ser utilizadas no relatório   ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Private oFont6		:= TFONT():New("ARIAL",7,6,.T.,.F.,5,.T.,5,.T.,.F.) ///Fonte 6 Normal
	Private oFont6N 	:= TFONT():New("ARIAL",7,6,,.T.,,,,.T.,.F.) ///Fonte 6 Negrito
	Private oFont8		:= TFONT():New("ARIAL",9,8,.T.,.F.,5,.T.,5,.T.,.F.) ///Fonte 8 Normal
	Private oFont8N 	:= TFONT():New("ARIAL",8,8,,.T.,,,,.T.,.F.) ///Fonte 8 Negrito
	Private oFont10 	:= TFONT():New("ARIAL",9,10,.T.,.F.,5,.T.,5,.T.,.F.) ///Fonte 10 Normal
	Private oFont10S	:= TFONT():New("ARIAL",9,10,.T.,.F.,5,.T.,5,.T.,.T.) ///Fonte 10 Sublinhando
	Private oFont10N 	:= TFONT():New("ARIAL",9,10,,.T.,,,,.T.,.F.) ///Fonte 10 Negrito
	Private oFont12		:= TFONT():New("ARIAL",12,12,,.F.,,,,.T.,.F.) ///Fonte 12 Normal
	Private oFont12NS	:= TFONT():New("ARIAL",12,12,,.T.,,,,.T.,.T.) ///Fonte 12 Negrito e Sublinhado
	Private oFont12N	:= TFONT():New("ARIAL",12,12,,.T.,,,,.T.,.F.) ///Fonte 12 Negrito
	Private oFont14		:= TFONT():New("ARIAL",14,14,,.F.,,,,.T.,.F.) ///Fonte 14 Normal
	Private oFont14NS	:= TFONT():New("ARIAL",14,14,,.T.,,,,.T.,.T.) ///Fonte 14 Negrito e Sublinhado
	Private oFont14N	:= TFONT():New("ARIAL",14,14,,.T.,,,,.T.,.F.) ///Fonte 14 Negrito
	Private oFont16 	:= TFONT():New("ARIAL",16,16,,.F.,,,,.T.,.F.) ///Fonte 16 Normal
	Private oFont16N	:= TFONT():New("ARIAL",16,16,,.T.,,,,.T.,.F.) ///Fonte 16 Negrito
	Private oFont16NS	:= TFONT():New("ARIAL",16,16,,.T.,,,,.T.,.T.) ///Fonte 16 Negrito e Sublinhado
	Private oFont20N	:= TFONT():New("ARIAL",20,20,,.T.,,,,.T.,.F.) ///Fonte 20 Negrito
	Private oFont22N	:= TFONT():New("ARIAL",22,22,,.T.,,,,.T.,.F.) ///Fonte 22 Negrito

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Variveis para impressão                                              ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Private cStartPath
	Private nLin 		:= 0
	Private nMargemL    := 50
	Private nMargemR    := 2400
	Private nMargemT	:= 50
	Private nMargemB	:= 3350
	Private nCenterPg	:= 1200
	Private oPrint		:= TMSPRINTER():New("")
	Private nPag		:= 0
	//Private cPerg 		:= "RTECR002"

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Define Tamanho do Papel                                              ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	#define DMPAPER_A4 9 //Papel A4
	oPrint:setPaperSize( DMPAPER_A4 )
	//TMSPrinter(): SetPaperSize ()

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Cria as perguntas na SX1                                             ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	//AjustaSx1()
	//pergunte(cPerg,.T.) //Chama a tela de parametros

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Orientacao do papel (Retrato ou Paisagem)                            ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	oPrint:SetPortrait()///Define a orientacao da impressao como retrato
	//oPrint:SetLandscape() ///Define a orientacao da impressao como paisagem

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Variveis Colunas                                              ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Private aTitItens 	:= {"Item"	, "Produto"	, "Descrição"	, "Un."		,"Qtde."		, "Amz."	, "Lote"	, "Endereço"}
	Private aColPos 	:= {nMargemL, 220		, 450			, 1200		, 1600			, 1620		, 1720		, 2020		}
	Private aColAlign 	:= {0		, 0			, 0				, 0			, 1				, 0			, 0 		, 0			}

	Cabecalho()

	nTab := 250
	oPrint:Say(nLin, nMargemL, iif(empty(cCarga),"Nº Pedido : ","Nº Carga :"), oFont12)
	oPrint:Say(nLin, nMargemL + nTab, iif(empty(cCarga), SC5->C5_NUM , DAK->DAK_COD), oFont12N)

	oPrint:Say(nLin, nCenterPg, "Id.Triang.:", oFont12)
	oPrint:Say(nLin, nCenterPg + nTab, iif(empty(cCarga), SC5->C5_XIDTRI , DAK->DAK_XIDTRI), oFont12N)
	
	//Pedido do Cleber da Logistica GLPI #3870
	oPrint:Say(nLin, nCenterPg + 520, iif(empty(cCarga)," ","Ptos. Entrega:"), oFont12)
	oPrint:Say(nLin, nCenterPg + 700 + nTab, iif(empty(cCarga), " " , cValToChar(DAK->DAK_PTOENT)), oFont12N)
	
	if !empty(cPedido) .AND. !empty(SC5->C5_XIDTRI)
		DAK->(dbOrderNickName("IDTRIANG"))
		if DAK->(DbSeek(SC5->C5_XIDTRI))
			oPrint:Say(nLin, nMargemR, "Nº Carga : " + DAK->DAK_COD, oFont12,,,,1)
		endif
	endif

	//BUSCA DO CODIGO DE BARRAS
	//Pedidos avulsos (sem triangulação)
	if !empty(cPedido) .AND. (empty(SC5->C5_XIDTRI) .OR. empty(SC5->C5_XFILEST)) //não é o pedido na FV
		cNumPVBarra := SC5->C5_NUM
		nLin += 60

	//pedidos com id Triangulaçao e que é o pedido pai
	elseif !empty(cPedido) .AND. !empty(SC5->C5_XIDTRI) .AND. !empty(SC5->C5_XFILEST)

		cIdTriang := SC5->C5_XIDTRI
		cFilEst := SC5->C5_XFILEST
		aAreaSC5 := SC5->(GetArea())

		SC5->(dbOrderNickName("IDTRIANG"))
		if SC5->(DbSeek(cIdTriang))
			//encontrando pedido da FE
			While SC5->(!Eof()) .AND. SC5->C5_XIDTRI == cIdTriang
				if SC5->C5_FILIAL == cFilEst
					nLin += 60
					cNumPVBarra := SC5->C5_NUM
					oPrint:Say(nLin, nMargemL, "Pedido FE ("+cFilEst+"): " + cNumPVBarra , oFont10)
					EXIT
				endif
				SC5->(DbSkip())
			enddo
		endif

		RestArea(aAreaSC5)

	//carga co id triangução
	elseif !empty(cCarga) .AND. !empty(DAK->DAK_XIDTRI)

		cIdTriang := DAK->DAK_XIDTRI
		aAreaSC5 := SC5->(GetArea())

		//encontrando filial estoque
		SC5->(dbOrderNickName("IDTRIANG"))
		if SC5->(DbSeek(cIdTriang))
			While SC5->(!Eof()) .AND. SC5->C5_XIDTRI == cIdTriang
				if !empty(SC5->C5_XFILEST)
					cFilEst := SC5->C5_XFILEST
					EXIT
				endif
				SC5->(DbSkip())
			enddo
		endif

		if !empty(cFilEst)
			if SC5->(DbSeek(cIdTriang))
				//encontrando pedido da FE
				While SC5->(!Eof()) .AND. SC5->C5_XIDTRI == cIdTriang
					if SC5->C5_FILIAL == cFilEst
						cNumPVBarra := SC5->C5_NUM
						nLin += 60
						oPrint:Say(nLin, nMargemL, "Pedido FE ("+cFilEst+"): " + cNumPVBarra , oFont10)
						EXIT
					endif
					SC5->(DbSkip())
				enddo
			endif
		endif

		RestArea(aAreaSC5)
	endif

	if !empty(cNumPVBarra)
		MSBAR('CODE128',2.25,5,cNumPVBarra,oPrint,.F.,,.T.,0.025,0.8,.T.,,,.F.)
	endif

	nLin += 100
	CabItens()

	PrintReport(, cPedido, cCarga, 1)

	Rod()

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Pre-visualiza a impressão 				                            ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	oPrint:Preview()

Return

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Monta o cabeçalho principal 				                            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Static Function Cabecalho()

	oPrint:StartPage() // Inicia uma nova pagina

	nLin := nMargemT
	oPrint:Say(nLin, nMargemL, "Picklist de Separação", oFont16N,,,,0)
	nLin += 100
	oPrint:Say(nLin, nMargemL, "Pagina: " + strzero(++nPag,3), oFont10)
	nLin += 40
	oPrint:Say(nLin, nMargemL, DTOC(dDatabase) + " " + TIME(), oFont10)
	nLin += 60
	oPrint:Line(nLin, nMargemL, nLin, nMargemR)
	nLin += 30

Return

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Monta o rodapé principal 				                            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Static Function Rod()

	nLin := nMargemB
	oPrint:Line(nLin, nMargemL, nLin, nMargemR)
	oPrint:Say(nLin, nMargemL, FWFilialName() , oFont10)
	oPrint:Say(nLin, nMargemR, DTOC(dDatabase) + " " + TIME(), oFont10,,,,1)

	oPrint:EndPage() //finaliza pagina

Return

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Monta o cabeçalho dos itens do pedido	                            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Static Function CabItens()
	Local nI := 0

	for nI := 1 to len(aTitItens)
		oPrint:Say(nLin, aColPos[nI], aTitItens[nI], oFont10N,,,,aColAlign[nI])
	next nI

	nLin += 50
	oPrint:Line(nLin, nMargemL, nLin, nMargemR)
	nLin += 30

Return
