	
//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
User Function RELPRODU()
	Local aArea   := GetArea()
	Local oReport
	Private cPerg := ""
	
	//Cria as defini��es do relat�rio
	oReport := RptDef()
	oReport:PrintDialog()
	
	RestArea(aArea)
Return
	
/*
+----------+----------------------------------------------------------------------+
| Fun��o   | RptDef()                                                             |
| Descri��o| Fun��o que monta a defini��o do relat�rio                            |
+----------+----------------------------------------------------------------------+
*/
	
Static Function RptDef()
	Local oReport
	Local oSection1 := Nil
	Local oBreak := Nil
	
	//Cria��o do componente de impress�o
	oReport := TReport():New(	"RELPRODU",;			//Nome do Relat�rio
								"Relat�rio de Produtos",;			//T�tulo do Relat�rio
								cPerg,;								//Tela de parametros
								{|oReport| ReportPrint(oReport)},;	//Chama a fun��o para imprimir o relat�rio
								"Este programa tem o objetivo de imprimir RELATORIO PRODUTOS")			//Descri��o
	oReport:SetTotalInLine(.T.)
	oReport:PageTotalInLine(.T.)
	oReport:HideFooter(.F.)
	oReport:HideParamPage(.F.)
	oReport:oPage:SetPaperSize(9) //Folha A4
	oReport:SetPortrait()
	oReport:SetLineHeight(60)
	oReport:nFontBody := 11
	
	//Criando a se��o de dados
	oSection1 := TRSection():New(	oReport,;
									"Produtos",;
									{"QRY_SEC1"})
	oSection1:SetTotalInLine(.T.) //Define se os totalizadores ser�o impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
	//Colunas do relat�rio
	TRCell():New(oSection1, "GRUPO", "QRY_SEC1", "Grupo", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "CODIGO", "QRY_SEC1", "Codigo", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "DESCRICAO", "QRY_SEC1", "Descricao", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "TIPO", "QRY_SEC1", "Tipo", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "UNIDADE", "QRY_SEC1", "Unidade", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "ARMAZEM", "QRY_SEC1", "Armazem", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "PESOLIQ", "QRY_SEC1", "Pesoliq", "@E 999,999.9999", 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "PESOBRU", "QRY_SEC1", "Pesobru", "@E 999,999.9999", 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "CODWINTHOR", "QRY_SEC1", "Codwinthor", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
Return oReport
	
/*
+----------+----------------------------------------------------------------------+
| Fun��o   | ReportPrint()                                                        |
| Descri��o| Fun��o que imprime o relat�rio                                       |
+----------+----------------------------------------------------------------------+
*/
	
Static Function ReportPrint(oReport)
	Local aArea    := GetArea()
	Local cQuery  := ""
	Local nAtual   := 0
	Local nTotal   := 0
	Local oSection1:= oReport:Section(1)
	
	//Montando consulta de dados Se��o 1
	cQuery := ""
	cQuery += " SELECT  "		+ CRLF
	cQuery += "        TRIM(B1_GRUPO) GRUPO, "		+ CRLF
	cQuery += "        TRIM(B1_COD) CODIGO,     "		+ CRLF
	cQuery += "        TRIM(B1_DESC) DESCRICAO,     "		+ CRLF
	cQuery += "        TRIM(B1_TIPO) TIPO,     "		+ CRLF
	cQuery += "        TRIM(B1_UM) UNIDADE,     "		+ CRLF
	cQuery += "        TRIM(B1_LOCPAD) ARMAZEM ,     "		+ CRLF
	cQuery += "        B1_PESO PESOLIQ,     "		+ CRLF
	cQuery += "        B1_PESBRU PESOBRU,     "		+ CRLF
	cQuery += "        TRIM(B1_XWINTHO) CODWINTHOR FROM SB1010  "		+ CRLF
	cQuery += "     WHERE SB1010.D_E_L_E_T_ = '  ' "		+ CRLF
	cQuery += "     ORDER BY GRUPO, CODIGO "		+ CRLF
	
	MemoWrite("C:\teste\RELABC.sql",cQuery) //V1 30/07/2018 
	
	cQuery:= ChangeQuery(cQuery)
	
	If ( SELECT("QRY_SEC1") ) > 0
		dbSelectArea("QRY_SEC1")
		QRY_SEC1->(dbCloseArea())
	EndIf
	//Executando consulta e setando o total da r�gua
	TCQuery cQuery New Alias "QRY_SEC1"
	Count to nTotal
	oReport:SetMeter(nTotal)
	
	//Enquanto houver dados
	oSection1:Init()
	QRY_SEC1->(DbGoTop())
	While QRY_SEC1->(!Eof())
		//Incrementando a r�gua
		nAtual++
		oReport:SetMsgPrint("Imprimindo registro "+cValToChar(nAtual)+" de "+cValToChar(nTotal)+"...")
		oReport:IncMeter()
		
		//Imprimindo a linha atual
		oSection1:PrintLine()
		
		QRY_SEC1->(DbSkip())
	EndDo
	oSection1:Finish()
	QRY_SEC1->(DbCloseArea())
	
	RestArea(aArea)
	
Return
