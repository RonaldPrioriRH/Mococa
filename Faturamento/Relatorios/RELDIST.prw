
#Include "Protheus.ch"
#Include "TopConn.ch"

//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
User Function RELDIST()
	Local aArea   := GetArea()
	Local oReport
	Private cPerg := ""
	
	cPerg := "RELDIST"
	
	////////////////////////////////////////////////////////////////////////
	///Cria as perguntas no SX1
	////////////////////////////////////////////////////////////////////////
	ValPer01()
	
	if !Pergunte(cPerg,.t.)
		return
	endif
	
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
	//Local oBreak := Nil
	
	//Criação do componente de impressão
	oReport := TReport():New(	"RELDIST",;			//Nome do Relatório
								"Controle de Comissões",;			//Título do Relatório
								cPerg,;								//Tela de parametros
								{|oReport| ReportPrint(oReport)},;	//Chama a função para imprimir o relatório
								"Este programa tem o objetivo de imprimir Relatorio")			//Descrição
	oReport:SetTotalInLine(.T.)
	oReport:PageTotalInLine(.T.)
	oReport:HideFooter(.F.)
	oReport:HideParamPage(.F.)
	oReport:oPage:SetPaperSize(9) //Folha A4
	oReport:nFontBody := 12
	oReport:SetPortrait()
	
	//Criando a seção de dados
	oSection1 := TRSection():New(	oReport,;		//Objeto TReport que a seção pertence
									"Base",;		//Descrição da seção
									{"QRY_SEC1"})		//Tabelas utilizadas, a primeira será considerada como principal da seção
	oSection1:SetTotalInLine(.F.)  //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
	//Colunas do relatório
    TRCell():New(oSection1, "STATUS", "QRY_SEC1", "Status", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "REGIONAL", "QRY_SEC1", "Regional", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "NOMEREGIONAL", "QRY_SEC1", "Nomeregional", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "TIPO", "QRY_SEC1", "Tipo", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "VENDEDOR", "QRY_SEC1", "Vendedor", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "CODWINTHOR", "QRY_SEC1", "Codwinthor", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "NOMEVENDEDOR", "QRY_SEC1", "Nomevendedor", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "E1_CLIENTE", "QRY_SEC1", "Cliente", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "E1_LOJA", "QRY_SEC1", "Loja", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "NOME", "QRY_SEC1", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "E1_FILIAL", "QRY_SEC1", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "E1_NUM", "QRY_SEC1", "No. Titulo", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "NFORIGEM", "QRY_SEC1", "Nforigem", /*Picture*/, 24, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "E1_PARCELA", "QRY_SEC1", "Parcela", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "VALOR", "QRY_SEC1", "Valor", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "EMISSAO", "QRY_SEC1", "Emissao", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "VENCIMENTO", "QRY_SEC1", "Vencimento", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "DT_BAIXA", "QRY_SEC1", "Dt_baixa", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "E1_COMIS1", "QRY_SEC1", "% Comissao 1", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "COMISSAO", "QRY_SEC1", "Comissao", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "RS_1DE12AVOS", "QRY_SEC1", "RS 1/12 Avos", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "IR_1DE12", "QRY_SEC1", "IR/-1/12", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "COMPETENCIA", "QRY_SEC1", "Competencia", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "RSABERTO", "QRY_SEC1", "RSaberto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)

	//Criando a seção de dados
	oSection2 := TRSection():New(	oReport,;		//Objeto TReport que a seção pertence
									"Comissões Pagas",;		//Descrição da seção
									{"QRY_SEC2"})		//Tabelas utilizadas, a primeira será considerada como principal da seção
	oSection2:SetTotalInLine(.F.)  //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
	//Colunas do relatório
    TRCell():New(oSection2, "E2_FILIAL", "QRY_SEC2", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "PREF", "QRY_SEC2", "Pref", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "E2_NUM", "QRY_SEC2", "No. Titulo", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "PAR", "QRY_SEC2", "Par", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "E2_TIPO", "QRY_SEC2", "Tipo", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "E2_NATUREZ", "QRY_SEC2", "Natureza", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "E2_FORNECE", "QRY_SEC2", "Fornecedor", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "E2_LOJA", "QRY_SEC2", "Loja", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "NOME", "QRY_SEC2", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "EMISSAO", "QRY_SEC2", "Emissao", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "VENCIMENTO", "QRY_SEC2", "Vencimento", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "VENCLREAL", "QRY_SEC2", "Venclreal", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "E2_VALOR", "QRY_SEC2", "Vlr.Titulo", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "RS_1DE12AVOS", "QRY_SEC2", "RS 1/12 Avos", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "IR_1DE12", "QRY_SEC2", "IR/-1/12", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "INDENIZADO_S_OU_N", "QRY_SEC2", "Indenizado S/N", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "IR_1DE3", "QRY_SEC2", "IR/-1/3", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "E2_SALDO", "QRY_SEC2", "Saldo", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "E2_HIST", "QRY_SEC2", "Historico", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "DTBAIXA", "QRY_SEC2", "Dtbaixa", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)

  
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
	
/*??????????????????????????????????????????????????????????????????????????????????
????????????????????????????????????????????????????????????????????????????????????
???????????????????????????????????????????????????????????????????????????????????
???Programa   ? ValPerg()  ? Autor ? Diego Bueno               ? Data ?20/03/2014???
????????????????????????????????????????????????????????????????????????????????J??
???Descricao  ? Cria perguntas no SX1	                                         ???
????????????????????????????????????????????????????????????????????????????????J??
???Observacao ?                                                                  ???
???           ?                                                                  ???
???????????????????????????????????????????????????????????????????????????????????
????????????????????????????????????????????????????????????????????????????????????
??????????????????????????????????????????????????????????????????????????????????*/

Static Function ValPer01()
	_sAlias	:=	Alias()
	//Retirado Sangelles 22/03/2022 ->dbSelectArea("SX1")
	//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
	cPerg 	:=	PADR(cPerg,10)
	
	U_xPutSx1(cPerg,"01","Indenizado ?",".",".","mv_CH1","N",01,0,0,"C","","","","","MV_PAR01","Sim","Sim","Sim","Não","Não","Não","","","","","","",,,)
	U_xPutSx1(cPerg,"02","Vendedor ?","","","mv_CH2","C",06,0,0,"G","","SA3","","","MV_PAR02","","","","","","","","","","","","","","","","")	
	U_xPutSx1(cPerg,"03","Até o Vendedor ?","","","mv_CH3","C",06,0,0,"G","","SA3","","","MV_PAR03","","","","","","","","","","","","","","","","")		
	U_xPutSx1(cPerg,"04","Emissão de ?","","","mv_CH4","D",08,0,0,"G","","","","","MV_PAR04","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"05","Emissão Até ?","","","mv_CH5","D",08,0,0,"G","","","","","MV_PAR05","","","","","","","","","","","","","","","","")
    U_xPutSx1(cPerg,"06","Percentual de IR ?","","","mv_CH6","N",06,2,0,"G","","","","","MV_PAR06","","","","","","","","","","","","","","","","")	

	
	//Retirado Sangelles 22/03/2022 ->dbSelectArea(_sAlias)

Return	
	
Static Function ReportPrint(oReport)
	Local aArea    := GetArea()
	Local cQuery  := ""
	Local cQuery2  := ""
	Local nAtual   := 0
	Local nTotal   := 0
	Local oSection1:= oReport:Section(1)
	Local oSection2:= oReport:Section(2)

	//Montando consulta de dados
	cQuery := ""
	cQuery += "SELECT * FROM (SELECT 'PAGAS'                          STATUS, "		+ STR_PULA
	cQuery += "       A3_SUPER                                  REGIONAL, "		+ STR_PULA
	cQuery += "       TRIM((SELECT A3_NOME "		+ STR_PULA
	cQuery += "             FROM   SA3010 "		+ STR_PULA
	cQuery += "             WHERE  SA3010.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQuery += "                    AND A.A3_SUPER = A3_COD))    NOMEREGIONAL, "		+ STR_PULA
	cQuery += "       SE1.E1_TIPO                               TIPO, "		+ STR_PULA
	cQuery += "       A3_COD                                    VENDEDOR, "		+ STR_PULA
	cQuery += "       TRIM(A3_XWINTHO)                          CODWINTHOR, "		+ STR_PULA
	cQuery += "       TRIM(A3_NOME)                             NOMEVENDEDOR, "		+ STR_PULA
	cQuery += "       SE1.E1_CLIENTE, "		+ STR_PULA
	cQuery += "       SE1.E1_LOJA, "		+ STR_PULA
	cQuery += "       TRIM(A1_NOME)                             NOME, "		+ STR_PULA
	cQuery += "       SE1.E1_FILIAL, "		+ STR_PULA
	cQuery += "       SE1.E1_NUM, "		+ STR_PULA
	cQuery += "       NULL                                      NFORIGEM, "		+ STR_PULA
	cQuery += "       SE1.E1_PARCELA, "		+ STR_PULA
	cQuery += "       SE1.E1_VALOR                              VALOR, "		+ STR_PULA
	cQuery += "       TO_DATE(TRIM(SE1.E1_EMISSAO), 'YYYYMMDD') EMISSAO, "		+ STR_PULA
	cQuery += "       TO_DATE(TRIM(SE1.E1_VENCTO), 'YYYYMMDD')  VENCIMENTO, "		+ STR_PULA
	cQuery += "       TO_DATE(TRIM(SE1.E1_BAIXA), 'YYYYMMDD')   DT_BAIXA, "		+ STR_PULA
	cQuery += "       SE1.E1_COMIS1, "		+ STR_PULA
	cQuery += "       ROUND(((E1_VALOR * (E1_COMIS1 /100))),2)   COMISSAO,"		+ STR_PULA
	cQuery += "       ROUND(((E1_VALOR * (E1_COMIS1 /100))*(1/12)),2)   RS_1DE12AVOS, "		+ STR_PULA
	cQuery += "       (ROUND(((E1_VALOR * (E1_COMIS1 /100))*(1/12)),2) * (" +str(MV_PAR06) +" /100)) IR_1DE12, "		+ STR_PULA //COLOCAR PERGUNTE IR
	cQuery += "       SUBSTR(TRIM(SE1.E1_BAIXA), 5, 2)          COMPETENCIA, "		+ STR_PULA
	cQuery += "       SE1.E1_SALDO                              RSABERTO "		+ STR_PULA
	cQuery += "       "		+ STR_PULA
	cQuery += "FROM   SE1010 SE1 "		+ STR_PULA
	cQuery += "       INNER JOIN SF2010 "		+ STR_PULA
	cQuery += "               ON SF2010.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQuery += "                  AND SE1.E1_FILIAL = F2_FILIAL "		+ STR_PULA
	cQuery += "                  AND SE1.E1_PREFIXO = F2_SERIE "		+ STR_PULA
	cQuery += "                  AND SE1.E1_NUM = F2_DOC "		+ STR_PULA
	cQuery += "                  AND SE1.E1_TIPO = 'NF' "		+ STR_PULA
	cQuery += "                  AND SE1.E1_CLIENTE = F2_CLIENTE "		+ STR_PULA
	cQuery += "                  AND SE1.E1_LOJA = F2_LOJA "		+ STR_PULA
	cQuery += "                  "		+ STR_PULA
	cQuery += "       INNER JOIN SE3010 ON SE3010.D_E_L_E_T_=' '"		+ STR_PULA
	//cQuery += "                       AND E1_FILIAL||E1_PREFIXO||E1_NUM||E1_PARCELA||E1_TIPO =  E3_FILIAL||E3_PREFIXO||E3_NUM||E3_PARCELA||E3_TIPO    "		+ STR_PULA -- Consulta lenta 
	cQuery += "                  AND E1_FILIAL = E3_FILIAL "		+ STR_PULA
	cQuery += "                  AND E1_PREFIXO = E3_PREFIXO "		+ STR_PULA
	cQuery += "                  AND E1_NUM = E3_NUM "		+ STR_PULA
	cQuery += "                  AND E1_PARCELA = E3_PARCELA "		+ STR_PULA
	cQuery += "                  AND E1_TIPO  = E3_TIPO "		+ STR_PULA
	cQuery += "       INNER JOIN SA1010 "		+ STR_PULA
	cQuery += "               ON SA1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQuery += "                  AND A1_COD = F2_CLIENTE "		+ STR_PULA
	cQuery += "                  AND A1_LOJA = F2_LOJA "		+ STR_PULA
	cQuery += "       "		+ STR_PULA
	cQuery += "       INNER JOIN SA3010 A "		+ STR_PULA
	cQuery += "               ON A.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQuery += "                  AND A.A3_COD = F2_VEND1 "		+ STR_PULA
	cQuery += "                  "		+ STR_PULA
	cQuery += "WHERE  SE1.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQuery += "       AND E1_TIPO = 'NF' "		+ STR_PULA
	cQuery += "       AND E1_SALDO = 0 "		+ STR_PULA
	cQuery += "       AND E1_VEND1 BETWEEN '" + MV_PAR02 +"' AND '"+ MV_PAR03 +"' 	"		+ STR_PULA
	cQuery += "       AND E1_EMISSAO BETWEEN '" + DTOS(MV_PAR04) +"' AND '"+ DTOS(MV_PAR05) +"' 	"		+ STR_PULA
	//cQuery += "       AND E1_VEND1 BETWEEN '000130' AND '000130'"		+ STR_PULA
	//cQuery += "       AND TO_DATE(TRIM(E1_EMISSAO), 'YYYYMMDD') BETWEEN '20190101' AND '20190819'"		+ STR_PULA
	cQuery += "       AND E3_XNFCOMI <> '   '"		+ STR_PULA
	cQuery += "UNION ALL"		+ STR_PULA
	cQuery += "SELECT 'GERADA NÃO PAGA'                          STATUS, "		+ STR_PULA
	cQuery += "       A3_SUPER                                  REGIONAL, "		+ STR_PULA
	cQuery += "       TRIM((SELECT A3_NOME "		+ STR_PULA
	cQuery += "             FROM   SA3010 "		+ STR_PULA
	cQuery += "             WHERE  SA3010.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQuery += "                    AND A.A3_SUPER = A3_COD))    NOMEREGIONAL, "		+ STR_PULA
	cQuery += "       SE1.E1_TIPO                               TIPO, "		+ STR_PULA
	cQuery += "       A3_COD                                    VENDEDOR, "		+ STR_PULA
	cQuery += "       TRIM(A3_XWINTHO)                          CODWINTHOR, "		+ STR_PULA
	cQuery += "       TRIM(A3_NOME)                             NOMEVENDEDOR, "		+ STR_PULA
	cQuery += "       SE1.E1_CLIENTE, "		+ STR_PULA
	cQuery += "       SE1.E1_LOJA, "		+ STR_PULA
	cQuery += "       TRIM(A1_NOME)                             NOME, "		+ STR_PULA
	cQuery += "       SE1.E1_FILIAL, "		+ STR_PULA
	cQuery += "       SE1.E1_NUM, "		+ STR_PULA
	cQuery += "       NULL                                      NFORIGEM, "		+ STR_PULA
	cQuery += "       SE1.E1_PARCELA, "		+ STR_PULA
	cQuery += "       SE1.E1_VALOR                              VALOR, "		+ STR_PULA
	cQuery += "       TO_DATE(TRIM(SE1.E1_EMISSAO), 'YYYYMMDD') EMISSAO, "		+ STR_PULA
	cQuery += "       TO_DATE(TRIM(SE1.E1_VENCTO), 'YYYYMMDD')  VENCIMENTO, "		+ STR_PULA
	cQuery += "       TO_DATE(TRIM(SE1.E1_BAIXA), 'YYYYMMDD')   DT_BAIXA, "		+ STR_PULA
	cQuery += "       SE1.E1_COMIS1, "		+ STR_PULA
	cQuery += "       ROUND(((E1_VALOR * (E1_COMIS1 /100))),2)   COMISSAO,"		+ STR_PULA
	cQuery += "       ROUND(((E1_VALOR * (E1_COMIS1 /100))*(1/12)),2)   RS_1DE12AVOS, "		+ STR_PULA
	cQuery += "       (ROUND(((E1_VALOR * (E1_COMIS1 /100))*(1/12)),2) * (" +str(MV_PAR06) +" /100)) IR_1DE12, "		+ STR_PULA //COLOCAR PERGUNTE IR
	cQuery += "       SUBSTR(TRIM(SE1.E1_BAIXA), 5, 2)          COMPETENCIA, "		+ STR_PULA
	cQuery += "       SE1.E1_SALDO                              RSABERTO "		+ STR_PULA
	cQuery += "       "		+ STR_PULA
	cQuery += "FROM   SE1010 SE1 "		+ STR_PULA
	cQuery += "       INNER JOIN SF2010 "		+ STR_PULA
	cQuery += "               ON SF2010.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQuery += "                  AND SE1.E1_FILIAL = F2_FILIAL "		+ STR_PULA
	cQuery += "                  AND SE1.E1_PREFIXO = F2_SERIE "		+ STR_PULA
	cQuery += "                  AND SE1.E1_NUM = F2_DOC "		+ STR_PULA
	cQuery += "                  AND SE1.E1_TIPO = 'NF' "		+ STR_PULA
	cQuery += "                  AND SE1.E1_CLIENTE = F2_CLIENTE "		+ STR_PULA
	cQuery += "                  AND SE1.E1_LOJA = F2_LOJA "		+ STR_PULA
	cQuery += "                  "		+ STR_PULA
	cQuery += "      INNER JOIN SE3010 ON SE3010.D_E_L_E_T_=' '"		+ STR_PULA
	//cQuery += "                       AND E1_FILIAL||E1_PREFIXO||E1_NUM||E1_PARCELA||E1_TIPO =  E3_FILIAL||E3_PREFIXO||E3_NUM||E3_PARCELA||E3_TIPO  "		+ STR_PULA  -- Consulta lenta
	cQuery += "                  AND E1_FILIAL = E3_FILIAL "		+ STR_PULA
	cQuery += "                  AND E1_PREFIXO = E3_PREFIXO "		+ STR_PULA
	cQuery += "                  AND E1_NUM = E3_NUM "		+ STR_PULA
	cQuery += "                  AND E1_PARCELA = E3_PARCELA "		+ STR_PULA
	cQuery += "                  AND E1_TIPO  = E3_TIPO "		+ STR_PULA
	cQuery += "                       "		+ STR_PULA
	cQuery += "      INNER JOIN SA1010 "		+ STR_PULA
	cQuery += "               ON SA1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQuery += "                  AND A1_COD = F2_CLIENTE "		+ STR_PULA
	cQuery += "                  AND A1_LOJA = F2_LOJA "		+ STR_PULA
	cQuery += "       "		+ STR_PULA
	cQuery += "      INNER JOIN SA3010 A "		+ STR_PULA
	cQuery += "               ON A.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQuery += "                  AND A.A3_COD = F2_VEND1 "		+ STR_PULA
	cQuery += "                  "		+ STR_PULA
	cQuery += "WHERE  SE1.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQuery += "       AND E1_TIPO = 'NF' "		+ STR_PULA
	cQuery += "       AND E1_SALDO = 0 "		+ STR_PULA
	cQuery += "       AND E1_VEND1 BETWEEN '" + MV_PAR02 +"' AND '"+ MV_PAR03 +"' 	"		+ STR_PULA
	cQuery += "       AND E1_EMISSAO BETWEEN '" + DTOS(MV_PAR04) +"' AND '"+ DTOS(MV_PAR05) +"' 	"		+ STR_PULA
	//cQuery += "       AND E1_VEND1 BETWEEN '000130' AND '000130'"		+ STR_PULA
	//cQuery += "       AND TO_DATE(TRIM(E1_EMISSAO), 'YYYYMMDD') BETWEEN '20190101' AND '20190819'"		+ STR_PULA
	cQuery += "       AND E3_XNFCOMI ='    '"		+ STR_PULA
	cQuery += "UNION "		+ STR_PULA
	cQuery += "SELECT 'FUTURA'       STATUS, "		+ STR_PULA
	cQuery += "       A3_SUPER                                  REGIONAL, "		+ STR_PULA
	cQuery += "       TRIM((SELECT A3_NOME "		+ STR_PULA
	cQuery += "             FROM   SA3010 "		+ STR_PULA
	cQuery += "             WHERE  SA3010.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQuery += "                    AND A.A3_SUPER = A3_COD))    NOMEREGIONAL, "		+ STR_PULA
	cQuery += "       SE1.E1_TIPO                               TIPO, "		+ STR_PULA
	cQuery += "       A3_COD                                    VENDEDOR, "		+ STR_PULA
	cQuery += "       TRIM(A3_XWINTHO)                          CODWINTHOR, "		+ STR_PULA
	cQuery += "       TRIM(A3_NOME)                             NOMEVENDEDOR, "		+ STR_PULA
	cQuery += "       SE1.E1_CLIENTE, "		+ STR_PULA
	cQuery += "       SE1.E1_LOJA, "		+ STR_PULA
	cQuery += "       TRIM(A1_NOME)                             NOME, "		+ STR_PULA
	cQuery += "       SE1.E1_FILIAL, "		+ STR_PULA
	cQuery += "       SE1.E1_NUM, "		+ STR_PULA
	cQuery += "       NULL                                      NFORIGEM, "		+ STR_PULA
	cQuery += "       SE1.E1_PARCELA, "		+ STR_PULA
	cQuery += "       SE1.E1_VALOR                              VALOR, "		+ STR_PULA
	cQuery += "       TO_DATE(TRIM(SE1.E1_EMISSAO), 'YYYYMMDD') EMISSAO, "		+ STR_PULA
	cQuery += "       TO_DATE(TRIM(SE1.E1_VENCTO), 'YYYYMMDD')  VENCIMENTO, "		+ STR_PULA
	cQuery += "       TO_DATE(TRIM(SE1.E1_BAIXA), 'YYYYMMDD')   DT_BAIXA, "		+ STR_PULA
	cQuery += "       SE1.E1_COMIS1, "		+ STR_PULA
	cQuery += "       ROUND(((E1_VALOR * (E1_COMIS1 /100))),2)   COMISSAO,"		+ STR_PULA
	cQuery += "       ROUND(((E1_VALOR * (E1_COMIS1 /100))*(1/12)),2)   RS_1DE12AVOS, "		+ STR_PULA
	cQuery += "       (ROUND(((E1_VALOR * (E1_COMIS1 /100))*(1/12)),2) * (" +str(MV_PAR06) +" /100)) IR_1DE12, "		+ STR_PULA // Colocar parametro IR
	cQuery += "       SUBSTR(TRIM(SE1.E1_BAIXA), 5, 2)          COMPETENCIA, "		+ STR_PULA
	cQuery += "       SE1.E1_SALDO                              RSABERTO "		+ STR_PULA
	cQuery += "       "		+ STR_PULA
	cQuery += "FROM   SE1010 SE1 "		+ STR_PULA
	cQuery += "       INNER JOIN SF2010 "		+ STR_PULA
	cQuery += "               ON SF2010.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQuery += "                  AND SE1.E1_FILIAL = F2_FILIAL "		+ STR_PULA
	cQuery += "                  AND SE1.E1_PREFIXO = F2_SERIE "		+ STR_PULA
	cQuery += "                  AND SE1.E1_NUM = F2_DOC "		+ STR_PULA
	cQuery += "                  AND SE1.E1_TIPO = 'NF' "		+ STR_PULA
	cQuery += "                  AND SE1.E1_CLIENTE = F2_CLIENTE "		+ STR_PULA
	cQuery += "                  AND SE1.E1_LOJA = F2_LOJA "		+ STR_PULA
	cQuery += "                  "		+ STR_PULA
	cQuery += "       LEFT JOIN SE3010 ON SE3010.D_E_L_E_T_=' '"		+ STR_PULA
	//cQuery += "                       AND E1_FILIAL||E1_PREFIXO||E1_NUM||E1_PARCELA||E1_TIPO =  E3_FILIAL||E3_PREFIXO||E3_NUM||E3_PARCELA||E3_TIPO  "		+ STR_PULA -- Consulta lenta
	cQuery += "                  AND E1_FILIAL = E3_FILIAL "		+ STR_PULA
	cQuery += "                  AND E1_PREFIXO = E3_PREFIXO "		+ STR_PULA
	cQuery += "                  AND E1_NUM = E3_NUM "		+ STR_PULA
	cQuery += "                  AND E1_PARCELA = E3_PARCELA "		+ STR_PULA
	cQuery += "                  AND E1_TIPO  = E3_TIPO "		+ STR_PULA
	cQuery += "                       "		+ STR_PULA
	cQuery += "      INNER JOIN SA1010 "		+ STR_PULA
	cQuery += "               ON SA1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQuery += "                  AND A1_COD = F2_CLIENTE "		+ STR_PULA
	cQuery += "                  AND A1_LOJA = F2_LOJA "		+ STR_PULA
	cQuery += "       "		+ STR_PULA
	cQuery += "      INNER JOIN SA3010 A "		+ STR_PULA
	cQuery += "               ON A.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQuery += "                  AND A.A3_COD = F2_VEND1 "		+ STR_PULA
	cQuery += "                  "		+ STR_PULA
	cQuery += "      INNER JOIN SA2010 ON SA2010.D_E_L_E_T_ =' '"		+ STR_PULA
	cQuery += "                       AND A2_CGC = A3_CGC"		+ STR_PULA
	cQuery += "                  "		+ STR_PULA
	cQuery += "WHERE  SE1.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQuery += "       AND E1_TIPO = 'NF' "		+ STR_PULA
	cQuery += "       AND E1_SALDO <> 0 "		+ STR_PULA
	cQuery += "       AND E1_VEND1 BETWEEN '" + MV_PAR02 +"' AND '"+ MV_PAR03 +"' 	"		+ STR_PULA
	cQuery += "       AND E1_EMISSAO BETWEEN '" + DTOS(MV_PAR04) +"' AND '"+ DTOS(MV_PAR05) +"' 	"		+ STR_PULA
	//cQuery += "       AND E1_VEND1 BETWEEN '000130' AND '000130'"		+ STR_PULA
	//cQuery += "       AND TO_DATE(TRIM(E1_EMISSAO), 'YYYYMMDD') BETWEEN '20190101' AND '20190819'"		+ STR_PULA
	cQuery += "       "		+ STR_PULA
	cQuery += "UNION ALL "		+ STR_PULA
	cQuery += "SELECT 'DEV'                                  STATUS, "		+ STR_PULA
	cQuery += "       A3_SUPER                               REGIONAL, "		+ STR_PULA
	cQuery += "       TRIM((SELECT A3_NOME "		+ STR_PULA
	cQuery += "             FROM   SA3010 "		+ STR_PULA
	cQuery += "             WHERE  SA3010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQuery += "                    AND A.A3_SUPER = A3_COD)) NOMEREGIONAL, "		+ STR_PULA
	cQuery += "       E1_TIPO                                TIPO, "		+ STR_PULA
	cQuery += "       A3_COD                                 VENDEDOR, "		+ STR_PULA
	cQuery += "       TRIM(A3_XWINTHO)                       CODWINTHOR, "		+ STR_PULA
	cQuery += "       TRIM(A3_NOME)                          NOMEVENDEDOR, "		+ STR_PULA
	cQuery += "       E1_CLIENTE, "		+ STR_PULA
	cQuery += "       E1_LOJA, "		+ STR_PULA
	cQuery += "       TRIM(A1_NOME), "		+ STR_PULA
	cQuery += "       E1_FILIAL, "		+ STR_PULA
	cQuery += "       E1_NUM, "		+ STR_PULA
	cQuery += "       SUBSTR(P2.ID, 1, 4) "		+ STR_PULA
	cQuery += "       ||SUBSTR(P2.ID, 25, 12) "		+ STR_PULA
	cQuery += "       ||SUBSTR(P2.ID, 17, 8)                 NFORIGEM, "		+ STR_PULA
	cQuery += "       E1_PARCELA, "		+ STR_PULA
	cQuery += "       ( E1_VALOR * -1 )                      VALOR, "		+ STR_PULA
	cQuery += "       TO_DATE(TRIM(E1_EMISSAO), 'YYYYMMDD')  EMISSAO, "		+ STR_PULA
	cQuery += "       TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD')   VENCIMENTO, "		+ STR_PULA
	cQuery += "       TO_DATE(TRIM(E1_BAIXA), 'YYYYMMDD')    DT_BAIXA, "		+ STR_PULA
	cQuery += "       E1_COMIS1, "		+ STR_PULA
	cQuery += "       ROUND(((E1_VALOR * (E1_COMIS1/100)) * -1),2) COMISSAO,"		+ STR_PULA
	cQuery += "       ROUND((((E1_VALOR * (E1_COMIS1 /100))*(1/12)) * -1),2)   RS_1DE12AVOS, "		+ STR_PULA
	cQuery += "      (ROUND((((E1_VALOR * (E1_COMIS1 /100))*(1/12)) * -1),2) * (" +str(MV_PAR06) +" /100)) IR_1DE12, "		+ STR_PULA //COLOCAR PARAMETRO IR
	cQuery += "       SUBSTR(TRIM(E1_BAIXA), 5, 2)           COMPETENCIA,"		+ STR_PULA
	cQuery += "       (E1_SALDO * -1 )                      RSABERTO "		+ STR_PULA
	cQuery += "FROM   SE1010, "		+ STR_PULA
	cQuery += "       (SELECT ID "		+ STR_PULA
	cQuery += "        FROM   (SELECT COUNT(D1_NFORI), "		+ STR_PULA
	cQuery += "                       D1_FILIAL "		+ STR_PULA
	cQuery += "                       ||D1_DOC "		+ STR_PULA
	cQuery += "                       ||D1_SERIE "		+ STR_PULA
	cQuery += "                       ||D1_FORNECE "		+ STR_PULA
	cQuery += "                       ||D1_LOJA "		+ STR_PULA
	cQuery += "                       ||D1_NFORI "		+ STR_PULA
	cQuery += "                       ||D1_SERIORI ID "		+ STR_PULA
	cQuery += "                FROM   SD1010 "		+ STR_PULA
	cQuery += "                WHERE  SD1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQuery += "                       AND D1_TIPO = 'D' "		+ STR_PULA
	cQuery += "                GROUP  BY D1_FILIAL, "		+ STR_PULA
	cQuery += "                          D1_SERIE, "		+ STR_PULA
	cQuery += "                          D1_DOC, "		+ STR_PULA
	cQuery += "                          D1_FORNECE, "		+ STR_PULA
	cQuery += "                          D1_LOJA, "		+ STR_PULA
	cQuery += "                          D1_NFORI, "		+ STR_PULA
	cQuery += "                          D1_SERIORI)P) P2, "		+ STR_PULA
	cQuery += "       SA1010, "		+ STR_PULA
	cQuery += "       SA3010 A, "		+ STR_PULA
	cQuery += "       SF2010 "		+ STR_PULA
	cQuery += "WHERE  SE1010.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQuery += "       AND SUBSTR(P2.ID, 1, 4) "		+ STR_PULA
	cQuery += "           ||SUBSTR(P2.ID, 25, 12) "		+ STR_PULA
	cQuery += "           ||SUBSTR(P2.ID, 17, 8) = F2_FILIAL "		+ STR_PULA
	cQuery += "                                    ||F2_DOC "		+ STR_PULA
	cQuery += "                                    ||F2_SERIE "		+ STR_PULA
	cQuery += "                                    ||F2_CLIENTE "		+ STR_PULA
	cQuery += "                                    ||F2_LOJA "		+ STR_PULA
	cQuery += "       AND SUBSTR(P2.ID, 1, 24) = E1_FILIAL "		+ STR_PULA
	cQuery += "                                  ||E1_NUM "		+ STR_PULA
	cQuery += "                                  ||E1_PREFIXO "		+ STR_PULA
	cQuery += "                                  ||E1_CLIENTE "		+ STR_PULA
	cQuery += "                                  ||E1_LOJA "		+ STR_PULA
	cQuery += "       AND E1_CLIENTE "		+ STR_PULA
	cQuery += "           ||E1_LOJA = A1_COD "		+ STR_PULA
	cQuery += "                       ||A1_LOJA "		+ STR_PULA
	cQuery += "       AND F2_VEND1 = A.A3_COD "		+ STR_PULA
	cQuery += "       AND E1_VEND1 BETWEEN '" + MV_PAR02 +"' AND '"+ MV_PAR03 +"' 	"		+ STR_PULA
	cQuery += "       AND E1_EMISSAO BETWEEN '" + DTOS(MV_PAR04) +"' AND '"+ DTOS(MV_PAR05) +"' 	)"		+ STR_PULA 
	//cQuery += "       AND E1_VEND1 BETWEEN '000130' AND '000130'"		+ STR_PULA
	//cQuery += "       AND TO_DATE(TRIM(E1_EMISSAO), 'YYYYMMDD') BETWEEN '20190101' AND '20190819' )"		+ STR_PULA
	//cQuery += "WHERE E1_NUM ='000139023'"		+ STR_PULA
	
	MemoWrite("C:\teste\AB1_V2.sql",cQuery) //30/08/2019
	
	cQuery := ChangeQuery(cQuery)
	
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
		oReport:SetMsgPrint("Imprimindo registro Primeira Seção1 "+cValToChar(nAtual)+" de "+cValToChar(nTotal)+"...")
		oReport:IncMeter()
		
		//Imprimindo a linha atual
		oSection1:PrintLine()
		QRY_SEC1->(DbSkip())
	EndDo
	
	nAtual   := 0
	nTotal   := 0
	
	//Montando consulta de dados 2
	cQuery2 := ""
	cQuery2 += "SELECT    E2_FILIAL, "		+ STR_PULA
	cQuery2 += "          E2_PREFIXO PREF, "		+ STR_PULA
	cQuery2 += "          E2_NUM, "		+ STR_PULA
	cQuery2 += "          E2_PARCELA PAR, "		+ STR_PULA
	cQuery2 += "          E2_TIPO, "		+ STR_PULA
	cQuery2 += "          E2_NATUREZ, "		+ STR_PULA
	cQuery2 += "          E2_FORNECE, "		+ STR_PULA
	cQuery2 += "          E2_LOJA, "		+ STR_PULA
	cQuery2 += "          TRIM(A2_NOME) NOME, "		+ STR_PULA
	cQuery2 += "          TO_DATE(TRIM(E2_EMISSAO),'YYYYMMDD') EMISSAO, "		+ STR_PULA
	cQuery2 += "          TO_DATE(TRIM(E2_VENCTO),'YYYYMMDD')  VENCIMENTO, "		+ STR_PULA
	cQuery2 += "          TO_DATE(TRIM(E2_VENCREA),'YYYYMMDD') VENCLREAL, "		+ STR_PULA
	cQuery2 += "          E2_VALOR, "		+ STR_PULA
	cQuery2 += "          ROUND((E2_VALOR * (1/12)),2) RS_1DE12AVOS,"		+ STR_PULA
	//cQuery2 += "          ROUND((ROUND((E2_VALOR * (1/12)),2) * (100 /100)),2) IR_1DE12,"		+ STR_PULA
	cQuery2 += "          ROUND((ROUND((E2_VALOR * (1/12)),2) * (" +str(MV_PAR06) +" /100)),2) IR_1DE12,"		+ STR_PULA
	cQuery2 += "          (CASE '" +cValToChar(MV_PAR01) +"' "		+ STR_PULA
	cQuery2 += "                    WHEN '2' THEN 0 "		+ STR_PULA
	cQuery2 += "                    WHEN '1' THEN ( "		+ STR_PULA
	//cQuery2 += "          (CASE 'S'"		+ STR_PULA
	//cQuery2 += "                    WHEN 'N' THEN 0 "		+ STR_PULA
	//cQuery2 += "                    WHEN 'S' THEN ( "		+ STR_PULA
	cQuery2 += "                              CASE "		+ STR_PULA
	cQuery2 += "                                        WHEN P2.ID IS NULL THEN 0 "		+ STR_PULA
	cQuery2 += "                                        ELSE (ROUND((E2_VALOR * 1/3),2)) "		+ STR_PULA
	cQuery2 += "                              END) "		+ STR_PULA
	cQuery2 += "          END) INDENIZADO_S_OU_N, "		+ STR_PULA
	cQuery2 += "                    (CASE '" +cValToChar(MV_PAR01) +"' "		+ STR_PULA
	cQuery2 += "                    WHEN '2' THEN 0 "		+ STR_PULA
	cQuery2 += "                    WHEN '1' THEN ( "		+ STR_PULA	
	//cQuery2 += "                    (CASE 'S'"		+ STR_PULA
	//cQuery2 += "                    WHEN 'N' THEN 0 "		+ STR_PULA
	//cQuery2 += "                    WHEN 'S' THEN ( "		+ STR_PULA
	cQuery2 += "                              CASE "		+ STR_PULA
	cQuery2 += "                                        WHEN P2.ID IS NULL THEN 0 "		+ STR_PULA
	//cQuery2 += "                                        ELSE (ROUND((ROUND((E2_VALOR * 1/3),2) * (cValToChar(MV_PAR06) /100)),2))"		+ STR_PULA
	cQuery2 += "                                        ELSE (ROUND((ROUND((E2_VALOR * 1/3),2) * (" +str(MV_PAR06) +" /100)),2))"		+ STR_PULA
	cQuery2 += "                              END) "		+ STR_PULA
	cQuery2 += "          END) IR_1DE3, "		+ STR_PULA
	cQuery2 += "          E2_SALDO, "		+ STR_PULA
	cQuery2 += "          E2_HIST, "		+ STR_PULA
	cQuery2 += "          TO_DATE(TRIM(E2_BAIXA),'YYYYMMDD') DTBAIXA"		+ STR_PULA
	cQuery2 += "FROM      SE2010 "		+ STR_PULA
	cQuery2 += "        INNER JOIN SA2010 "		+ STR_PULA
	cQuery2 += "                 ON        SA2010.D_E_L_E_T_=' ' "		+ STR_PULA
	cQuery2 += "                AND       E2_FORNECE = A2_COD "		+ STR_PULA
	cQuery2 += "                AND       E2_LOJA = A2_LOJA "		+ STR_PULA
	cQuery2 += "        LEFT JOIN SA3010 "		+ STR_PULA
	cQuery2 += "                 ON        SA3010.D_E_L_E_T_='  ' "		+ STR_PULA
	cQuery2 += "                AND       A3_CGC = A2_CGC "		+ STR_PULA
	//cQuery2 += "                AND       A3_MSBLQL <> '1' "		+ STR_PULA
	cQuery2 += "        LEFT JOIN ((SELECT P.E2_FILIAL "		+ STR_PULA
	cQuery2 += "                               ||TRIM(P.E2_NUM) "		+ STR_PULA
	cQuery2 += "                               ||TRIM(P.E2_PARCELA) "		+ STR_PULA
	cQuery2 += "                               ||TRIM(P.E2_FORNECE) "		+ STR_PULA
	cQuery2 += "                               ||TRIM(P.E2_LOJA) AS ID "		+ STR_PULA
	cQuery2 += "                   FROM   (SELECT * FROM  SE2010 E WHERE    E.E2_FORNECE||E.E2_LOJA "		+ STR_PULA
	cQuery2 += "                                                      IN (SELECT A2_COD|| A2_LOJA FROM      SA2010 "		+ STR_PULA
	cQuery2 += "                                                    LEFT JOIN SA3010 "		+ STR_PULA
	cQuery2 += "                                                    ON        SA3010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQuery2 += "                                                    AND       A3_CGC = A2_CGC "		+ STR_PULA
	cQuery2 += "                                                    WHERE     SA2010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQuery2 += "                                                    AND       A2_L_TPFOR ='F' "		+ STR_PULA
	//cQuery2 += "                                                    AND       A3_COD BETWEEN '000130' AND '000130' ) "		+ STR_PULA
	cQuery2 += "													AND       A3_COD BETWEEN '" + MV_PAR02 +"' AND '"+ MV_PAR03 +"') " + STR_PULA
	cQuery2 += "                                 AND      E.D_E_L_E_T_=' ' "		+ STR_PULA
	cQuery2 += "                                 AND      E.E2_NATUREZ ='0202001' "		+ STR_PULA
	cQuery2 += "                                 ORDER BY E.E2_EMISSAO DESC) P "		+ STR_PULA
	cQuery2 += "                 WHERE  ROWNUM <= 3) P2) "		+ STR_PULA
	cQuery2 += "                ON        E2_FILIAL "		+ STR_PULA
	cQuery2 += "                    ||TRIM(E2_NUM) "		+ STR_PULA
	cQuery2 += "                    ||TRIM(E2_PARCELA) "		+ STR_PULA
	cQuery2 += "                    ||TRIM(E2_FORNECE) "		+ STR_PULA
	cQuery2 += "                    ||TRIM(E2_LOJA) = P2.ID "		+ STR_PULA
	cQuery2 += "WHERE SE2010.D_E_L_E_T_=' ' "		+ STR_PULA
	cQuery2 += "AND       E2_TIPO IN ('NF','BOL') "		+ STR_PULA
	//cQuery2 += "AND  A3_COD BETWEEN '000130' AND '000130'"		+ STR_PULA
	cQuery2 += "AND       A3_COD BETWEEN '" + MV_PAR02 +"' AND '"+ MV_PAR03 +"' 	"		+ STR_PULA
	
	MemoWrite("C:\teste\AB2_V2.sql",cQuery2) //18/10/2019 Ajuste E2_TIPO e A3_MSBLQL
	cQuery2 := ChangeQuery(cQuery2)
	
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
		oReport:SetMsgPrint("Imprimindo registro Seção2 "+cValToChar(nAtual)+" de "+cValToChar(nTotal)+"...")
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
