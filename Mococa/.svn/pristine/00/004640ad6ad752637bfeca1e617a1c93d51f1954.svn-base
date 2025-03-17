#Include 'Protheus.ch'
#INCLUDE "topconn.ch"

/*/{Protheus.doc} RFINR002

Relatório de Antecipação de recebiveis 

@author Leandro Rodrigues
@since 04/05/2017
@version Desenvolvido para P12
@param Nao recebe parametros
@return nulo
/*/
User Function RFINR002()

Local oReport
Private cPerg := "RFINR002"

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Cria as perguntas na SX1                                             ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
AjustaSx1()

//Pergunte(oReport:uParam, .F.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Interface de impressao                                                  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oReport := ReportDef()
oReport:PrintDialog()

Return 

//---------------------------------------------------------
// Definiçao da estrutura do relatorio
//---------------------------------------------------------
Static Function ReportDef()

	Local oReport
	Local oTitulos
	Local oResumo
	Local cTitle    	:= "ANTECIPACAO DE RECEBIVEIS"

	oReport:= TReport():New("RFINR002",cTitle,cPerg,{|oReport| PrintReport(oReport,oTitulos,oResumo)},"Este relatório apresenta o uma previsao para o bordero de titulos Fidic.")
	//oReport:SetPortrait() 		// Orientação retrato
	oReport:SetLandscape()			// Orientação paisagem 
	//oReport:HideHeader()  		// Nao imprime cabeçalho padrão do Protheus
	//oReport:HideFooter()			// Nao imprime rodapé padrão do Protheus
	oReport:HideParamPage()			// Inibe impressão da pagina de parametros
	oReport:SetUseGC(.F.) 			// Habilita o botão <Gestao Corporativa> do relatório
	//oReport:DisableOrientation()  // Desabilita a seleção da orientação (retrato/paisagem)
	//oReport:cFontBody := "Arial"
	//oReport:nFontBody := 8
	
	Pergunte(oReport:GetParam(),.F.)
		
	oTitulos := TRSection():New(oReport,"Titulos",{"SE1"},{"Titulos/Clientes"})
	
	TRCell():New(oTitulos,"E1_NUM"		, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oTitulos,"E1_PREFIXO"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oTitulos,"E1_PARCELA"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oTitulos,"E1_CLIENTE"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oTitulos,"E1_LOJA"		, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oTitulos,"A1_NOME"		, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oTitulos,"A1_CGC"		, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oTitulos,"E1_EMISSAO"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oTitulos,"E1_VENCREA"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oTitulos,"E1_VALOR"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)	
	TRCell():New(oTitulos,"E1_DESCONT"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oTitulos,"TMP_VLIQ"	, ""   , "Vlr Liquido", "@E 99,999,999.99", 10, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oTitulos,"TMP_DIAS"	, ""   , "Dias"	   	  , "@E 999"	 	  ,/*Tamanho*/ , /*lPixel*/,/*bConteudo*/)
	TRCell():New(oTitulos,"TMP_DESAG"	, ""   , "Desagio" 	  , "@E 99,999,999.99", 10, /*lPixel*/,/*bConteudo*/)	


	oTitulos:Cell("E1_VALOR"):SetHeaderAlign("RIGHT")
	oTitulos:Cell("E1_DESCONT"):SetHeaderAlign("RIGHT")
	oTitulos:Cell("TMP_VLIQ"):SetHeaderAlign("RIGHT")
	oTitulos:Cell("TMP_VLIQ"):SetHeaderAlign("RIGHT")
	oTitulos:Cell("TMP_DESAG"):SetHeaderAlign("RIGHT")
	
	oResumo := TRSection():New(oReport,"Total Geral",{"Resumo"}) 
	oResumo:SetHeaderPage(.F.)
	oResumo:SetHeaderSection(.T.) // Habilita Impressao Cabecalho no Topo da Pagina
	
	TRCell():New(oResumo,"TMP_QTDTIT"	, ""   , "Qtde Titulos"	   	  , /*Picture*/,10, /*lPixel*/,/*bConteudo*/)	
	TRCell():New(oResumo,"TMP_TARCOB"	, ""   , "Tarifa Cobranca" 	  , /*Picture*/,20, /*lPixel*/,/*bConteudo*/)	
	TRCell():New(oResumo,"TMP_TAC"		, ""   , "TAC"			 	  , /*Picture*/,10, /*lPixel*/,/*bConteudo*/)	
	TRCell():New(oResumo,"TMP_TED"		, ""   , "TED"			 	  , /*Picture*/,10, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oResumo,"TMP_VLRDESP"	, ""   , "Vlr Depesas"	 	  , /*Picture*/,20, /*lPixel*/ ,/*bConteudo*/)	
	TRCell():New(oResumo,"TMP_VLRECEB"	, ""   , "Vlr Receber"	 	  , /*Picture*/,20, /*lPixel*/,/*bConteudo*/)
	
	
	oResumo:Cell("TMP_QTDTIT"):SetHeaderAlign("RIGHT")
	oResumo:Cell("TMP_TARCOB"):SetHeaderAlign("RIGHT")
	oResumo:Cell("TMP_TAC"):SetHeaderAlign("RIGHT")
	oResumo:Cell("TMP_TED"):SetHeaderAlign("RIGHT")
	oResumo:Cell("TMP_VLRDESP"):SetHeaderAlign("RIGHT")
	oResumo:Cell("TMP_VLRECEB"):SetHeaderAlign("RIGHT")

	
	
Return(oReport) 

//---------------------------------------------------------
// Faz impressão do relatório
//---------------------------------------------------------
Static Function PrintReport(oReport,oTitulos,oResumo)

Local cQry := ""
Local nValLiq 	:= 0
Local nDias		:= 0
Local nDesagio 	:= 0
Local nQtdTit	:= 0
Local nTotDesp	:= 0
Local nVlrDesp	:= 0
Local nVlrTit	:= 0
Local nTotDesag := 0		

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³    Monta Query com os dados que serao impressos no relatorio        ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

cQry := " SELECT        "
cQry += " 	E1_NUM,		"
cQry += " 	E1_PREFIXO,	"
cQry += " 	E1_PARCELA,	"
cQry += " 	E1_CLIENTE, "
cQry += " 	E1_LOJA,	"
cQry += " 	A1_NOME,	"
cQry += " 	A1_CGC,		"
cQry += " 	E1_EMISSAO,	"
cQry += " 	E1_VENCREA,	"
cQry += " 	E1_VALOR,	"
cQry += "   E1_DESCONT,	"
cQry += "   E1_DATABOR	"
cQry += "   FROM " + RETSQLNAME("SE1") 			+ " E1"
cQry += "   INNER JOIN " + RETSQLNAME("SA1") 	+ " A1"
cQry += " 	ON A1_FILIAL 	= '"+ xFilial("SA1")+ "'"
cQry += " 	AND A1_COD 		= E1_CLIENTE"
cQry += " 	AND A1_LOJA 	= E1_LOJA	"
cQry += " 	AND A1.D_E_L_E_T_<> '*'		"
cQry += " 	WHERE E1.D_E_L_E_T_<> '*'	"
cQry += " 	AND E1_FILIAL 	= '" + xFilial("SE1") + "'"
cQry += " 	AND E1_NUMBOR 	= '" + MV_PAR01 	  + "'"


cQry := ChangeQuery(cQry)

If Select("QSE1")>0
	QSE1->(DbCloseArea())
Endif


TcQuery cQry New Alias "QSE1" // Cria uma nova area com o resultado do query



//Imprime dados do relatorio
While QSE1->(!EOF())
			
	oTitulos:Init()
	
	//Se cancelar abandona o laco		
	If oReport:Cancel()
		Exit
	EndIf
	
	//Calculo os dias entre vencimento e data do bordero
	nDias 		:=  DateDiffDay(sTod(QSE1->E1_VENCREA) ,sTod(QSE1->E1_DATABOR) ) + mv_par03
	nValLiq		:=  QSE1->E1_VALOR - QSE1->E1_DESCONT
	nDesagio	:=	nValLiq * ( ((MV_PAR04 /100)+ 1)**(nDias / 30)) - nValLiq
	nQtdTit		+=  1
	nVlrDesp	+=  QSE1->E1_DESCONT
	nVlrTit		+=  nValLiq
	nTotDesag   += 	nDesagio
	
	oTitulos:Cell("E1_NUM"		):SetValue(QSE1->E1_NUM)
	oTitulos:Cell("E1_PREFIXO"	):SetValue(QSE1->E1_PREFIXO)
	oTitulos:Cell("E1_PARCELA"	):SetValue(QSE1->E1_PARCELA)
	oTitulos:Cell("E1_CLIENTE"	):SetValue(QSE1->E1_CLIENTE)
	oTitulos:Cell("E1_LOJA"		):SetValue(QSE1->E1_LOJA)
	oTitulos:Cell("A1_NOME"		):SetValue(QSE1->A1_NOME)
	oTitulos:Cell("A1_CGC"		):SetValue(QSE1->A1_CGC)
	oTitulos:Cell("E1_EMISSAO"	):SetValue(sTod(QSE1->E1_EMISSAO))
	oTitulos:Cell("E1_VENCREA"	):SetValue(sTod(QSE1->E1_VENCREA))
	oTitulos:Cell("E1_VALOR"	):SetValue(QSE1->E1_VALOR)
	oTitulos:Cell("E1_DESCONT"	):SetValue(QSE1->E1_DESCONT)
	oTitulos:Cell("TMP_VLIQ"	):SetValue(nValLiq)
	oTitulos:Cell("TMP_DIAS"	):SetValue(nDias)
	oTitulos:Cell("TMP_DESAG"	):SetValue(nDesagio)
		
	oTitulos:SetTotalInLine(.F.)
	
	oValor  := TRFunction():New(oTitulos:Cell("E1_VALOR")	,,"SUM",/*oBreak*/,,,,.F.,.F.,.F.)
	oDescon := TRFunction():New(oTitulos:Cell("E1_DESCONT") ,,"SUM",/*oBreak*/,,,,.F.,.F.,.F.)
	oVliqui := TRFunction():New(oTitulos:Cell("TMP_VLIQ")	,,"SUM",/*oBreak*/,,,,.F.,.F.,.F.)
	oDesagio:= TRFunction():New(oTitulos:Cell("TMP_DESAG")	,,"SUM",/*oBreak*/,,,,.F.,.F.,.F.)

	oTitulos:PrintLine()
	
	oValor:SetEndSection(.T.)
	oDescon:SetEndSection(.T.)
	oVliqui:SetEndSection(.T.)
	oDesagio:SetEndSection(.T.)
	
	
	QSE1->(DbSkip())
EndDo			

//Altero descricao do totalizador
oTitulos:SetTotalText("Totalizadores") 

oTitulos:Finish()

oResumo:Init()
oResumo:PrintLine()

nTotDesp := Round(nTotDesag+(nQtdTit * MV_PAR05)+MV_PAR06+MV_PAR07,2) 
	
oResumo:Cell("TMP_QTDTIT"	):SetValue(nQtdTit)
oResumo:Cell("TMP_TARCOB"	):SetValue(Round(nQtdTit * MV_PAR05,2) )
oResumo:Cell("TMP_TAC"		):SetValue(MV_PAR06 )
oResumo:Cell("TMP_TED"		):SetValue(MV_PAR07 )
oResumo:Cell("TMP_VLRDESP"	):SetValue(nTotDesp)
oResumo:Cell("TMP_VLRECEB"	):SetValue(Round(nVlrTit - nTotDesp,2) )

oResumo:PrintLine()
oResumo:Finish()

Return

/*
Cria Perguntas do relatorio
*/

Static Function AjustaSX1()


Local aHelpPor	:= {}
Local aHelpEng	:= {}
Local aHelpSpa	:= {}

                                                          
U_xPutSx1( cPerg, "01","Borderô ","Borderô","Borderô","mv_ch1","C",6,0,0,"G","","","","",;
	"mv_par01"," ","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	
U_xPutSx1( cPerg, "02","Data Bordero ","Data Bordero","Data Bordero","mv_ch2","D",8,0,0,"G","","","","",;
	"mv_par02"," ","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

U_xPutSx1( cPerg, "03","Soma Dia","Soma Dia","Soma Dia","mv_ch3","N",3,0,0,"G","","","","",;
	"mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)   

U_xPutSx1( cPerg, "04","Taxa Factor","Taxa Factor","Taxa Factor","mv_ch4","N",7,2,0,"G","","","","",;
	"mv_par04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa) 	


U_xPutSx1( cPerg, "05","Tarifa Boleto","Tarifa Boleto","Tarifa Boleto","mv_ch5	","N",7,2,0,"G","","","","",;
	"mv_par05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa) 

U_xPutSx1( cPerg, "06","TAC","TAC","TAC","mv_ch6","N",7,2,0,"G","","","","",;
	"mv_par06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa) 

U_xPutSx1( cPerg, "07","TED","TED","TED","mv_ch7","N",7,2,0,"G","","","","",;
	"mv_par07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa) 
				
Return 