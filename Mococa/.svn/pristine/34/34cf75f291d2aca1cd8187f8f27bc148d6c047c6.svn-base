
#Include "Protheus.ch"
#Include "TopConn.ch"
	
User Function RELATX()
	Local aArea   := GetArea()
	Local oReport
	Private cPerg := ""
	
	//Cria as definições do relatório
	oReport := RptDef()
	oReport:PrintDialog()
	
	RestArea(aArea)
Return
	
/*
+----------+----------------------------------------------------------------------+
| Função   | RptDef()                                                             |
| Descrição| Função que monta a definição do relatório                            |
+----------+----------------------------------------------------------------------+
*/
	
Static Function RptDef()
	Local oReport
	Local oSection1 := Nil
	Local oSection2 := Nil
	Local oBreak := Nil
	
	//Criação do componente de impressão
	oReport := TReport():New(	"SA1 X SB1",;			//Nome do Relatório
								"Relatorio",;			//Título do Relatório
								cPerg,;								//Tela de parametros
								{|oReport| ReportPrint(oReport)},;	//Chama a função para imprimir o relatório
								"Este programa tem o objetivo de imprimir Relatorio")			//Descrição
	oReport:SetTotalInLine(.T.)
	oReport:PageTotalInLine(.T.)
	oReport:HideFooter(.F.)
	oReport:HideParamPage(.F.)
	oReport:oPage:SetPaperSize(9) //Folha A4
	oReport:SetPortrait()
	
	//Criando a seção de dados
	oSection1 := TRSection():New(	oReport,;
									"Seção 1",;
									{"QRY_SEC1"})
	oSection1:SetTotalInLine(.T.) //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
	//Colunas do relatório
	TRCell():New(oSection1, "A1_COD", "QRY_SEC1", "Codigo", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "A1_NOME", "QRY_SEC1", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)

	//Criando a seção de dados 2
	oSection2 := TRSection():New(	oReport,;
									"Seção 2",;
									{"QRY_SEC2"})
	oSection2:SetTotalInLine(.T.) //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
	//Colunas do relatório 2
	TRCell():New(oSection2, "B1_COD", "QRY_SEC2", "Codigo", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "B1_DESC", "QRY_SEC2", "Descricao", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)

  //Modelo
        //Aqui, farei uma quebra  por seção
	oSection1:SetPageBreak(.T.)
	oSection1:SetTotalText(" ")		
Return oReport
	
/*
+----------+----------------------------------------------------------------------+
| Função   | ReportPrint()                                                        |
| Descrição| Função que imprime o relatório                                       |
+----------+----------------------------------------------------------------------+
*/
	
Static Function ReportPrint(oReport)
	Local aArea    := GetArea()
	Local cQuery  := ""
	Local cQuery2  := ""
	Local nAtual   := 0
	Local nTotal   := 0
	Local oSection1:= oReport:Section(1)
	Local oSection2:= oReport:Section(2)
	
	//Montando consulta de dados Seção 1
	cQuery := ""
	cQuery += " SELECT A1_COD , A1_NOME FROM SA1010 "		+ CRLF
	cQuery += "     WHERE SA1010.D_E_L_E_T_ = ' ' "		+ CRLF
	cQuery += "     AND  ROWNUM <= 10 "		+ CRLF
	
	cQuery:= ChangeQuery(cQuery)
	
	If ( SELECT("QRY_SEC1") ) > 0
		dbSelectArea("QRY_SEC1")
		QRY_SEC1->(dbCloseArea())
	EndIf
	//Executando consulta e setando o total da régua
	TCQuery cQuery New Alias "QRY_SEC1"
	Count to nTotal
	oReport:SetMeter(nTotal)
	
	//Enquanto houver dados
	oSection1:Init()

	QRY_SEC1->(DbGoTop())
	While QRY_SEC1->(!Eof())
		//Incrementando a régua
		nAtual++
		oReport:SetMsgPrint("Imprimindo registro Primeira Seção"+cValToChar(nAtual)+" de "+cValToChar(nTotal)+"...")
		oReport:IncMeter()
		
		//Imprimindo a linha atual
		oSection1:PrintLine()
		QRY_SEC1->(DbSkip())
	EndDo
	
	//Montando consulta de dados Seção 2
	cQuery2 := ""
	cQuery2 += " SELECT B1_COD, B1_DESC FROM SB1010 "		+ CRLF
	cQuery2 += "     WHERE SB1010.D_E_L_E_T_ = '  ' "		+ CRLF
	cQuery2 += "     AND ROWNUM <=10 "		+ CRLF
	
	cQuery2:= ChangeQuery(cQuery2)
	
	If ( SELECT("QRY_SEC2") ) > 0
		dbSelectArea("QRY_SEC2")
		QRY_SEC2-> (dbCloseArea())
	EndIf
	//Executando consulta e setando o total da régua
	TcQuery cQuery2 New Alias "QRY_SEC2"
	Count to nTotal
	oReport:SetMeter(nTotal)
	
	//Enquanto houver dados
	oSection2:Init()
	QRY_SEC2->(DbGoTop())
	While QRY_SEC2->(!Eof())
		//Incrementando a régua
		nAtual++
		oReport:SetMsgPrint("Imprimindo registro "+cValToChar(nAtual)+" de "+cValToChar(nTotal)+"...")
		oReport:IncMeter()
		
		//Imprimindo a linha atual
		oSection2:PrintLine()
		QRY_SEC2->(DbSkip())
		
	EndDo
	

	
	//finalizo a segunda seção para que seja reiniciada para o proximo registro
 	oSection2:Finish()
 	//imprimo uma linha para separar uma NCM de outra
 	oReport:ThinLine()
 	//finalizo a primeira seção
	oSection1:Finish()
	QRY_SEC1->(DbCloseArea())
	QRY_SEC2->(DbCloseArea())
	
	RestArea(aArea)
	
Return

