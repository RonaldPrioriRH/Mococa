//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELFATPR
Whintor - 8226 - Faturamento por produto                     
@author TReport
@since 10/08/2020
@version 1.0
	@example
	u_RELFATPR()
	@obs Fun��o gerada pelo TReport()
/*/
	
User Function RELFATPR()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Defini��es da pergunta
	cPerg := "RELFATPR"
	
	//////////////////////////////////////////////////////////////////////////
	///Cria as perguntas no SX1
	////////////////////////////////////////////////////////////////////////
	ValPer01()
	
	if !Pergunte(cPerg,.t.)
		return
	endif
	
	//Cria as defini��es do relat�rio
	oReport := fReportDef()
	
	//Ser� enviado por e-Mail?
	If lEmail
		oReport:nRemoteType := NO_REMOTE
		oReport:cEmail := cPara
		oReport:nDevice := 3 //1-Arquivo,2-Impressora,3-email,4-Planilha e 5-Html
		oReport:SetPreview(.F.)
		oReport:Print(.F., "", .T.)
	//Sen�o, mostra a tela
	Else
		oReport:PrintDialog()
	EndIf
	
	RestArea(aArea)
Return
	
/*-------------------------------------------------------------------------------*
 | Func:  fReportDef                                                             |
 | Desc:  Fun��o que monta a defini��o do relat�rio                              |
 *-------------------------------------------------------------------------------*/
	
Static Function fReportDef()
	Local oReport
	Local oSectDad := Nil
	Local oBreak := Nil
	
	//Cria��o do componente de impress�o
	oReport := TReport():New(	"RELFATPR",;		//Nome do Relat�rio
								"8226 - Faturamento por produto",;		//T�tulo
								cPerg,;		//Pergunte ... Se eu defino a pergunta aqui, ser� impresso uma p�gina com os par�metros, conforme privil�gio 101
								{|oReport| fRepPrint(oReport)},;		//Bloco de c�digo que ser� executado na confirma��o da impress�o
								)		//Descri��o
	oReport:SetTotalInLine(.F.)
	oReport:lParamPage := .F.
	oReport:oPage:SetPaperSize(9) //Folha A4
	oReport:SetPortrait()
	oReport:SetLineHeight(60)
	oReport:nFontBody := 9
	
	
	//Criando a se��o de dados
	oSectDad := TRSection():New(	oReport,;		//Objeto TReport que a se��o pertence
									"Dados",;		//Descri��o da se��o
									{"QRY_AUX"})		//Tabelas utilizadas, a primeira ser� considerada como principal da se��o
	oSectDad:SetTotalInLine(.F.)  //Define se os totalizadores ser�o impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
	//Colunas do relat�rio
	TRCell():New(oSectDad, "FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FILORI", "QRY_AUX", "Filori", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FILINT", "QRY_AUX", "Filint", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTINPED", "QRY_AUX", "Dtinped", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NUMPED", "QRY_AUX", "Numped", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PEDSGAC", "QRY_AUX", "Pedsgac", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NFDESAIDA", "QRY_AUX", "Nfdesaida", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CODCLIENTE", "QRY_AUX", "Codcliente", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LOJA", "QRY_AUX", "Loja", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOME", "QRY_AUX", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ESTADO", "QRY_AUX", "Estado", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CPFCNPJ", "QRY_AUX", "Cpfcnpj", /*Picture*/, 14, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "IDTRIANGULACAO", "QRY_AUX", "Idtriangulacao", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CARGA", "QRY_AUX", "Carga", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALBRUT", "QRY_AUX", "Valbrut", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "C5_XCARGA", "QRY_AUX", "* Carga", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DAK_XTIPO", "QRY_AUX", "* Tipo A. F.", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DATAFAT", "QRY_AUX", "Datafat", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "C5_TRANSP", "QRY_AUX", "Transp.", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A4_NOME", "QRY_AUX", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D2_COD", "QRY_AUX", "Produto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "B1_DESC", "QRY_AUX", "Descricao", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D2_QUANT", "QRY_AUX", "Quantidade", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
Return oReport

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
	
	U_xPutSx1(cPerg,"01","Data Inicial  ?","."     ,"."       ,"mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Data Final  ?","."     ,"."       ,"mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")	
	dbSelectArea(_sAlias)

Return()		
	

/*-------------------------------------------------------------------------------*
 | Func:  fRepPrint                                                              |
 | Desc:  Fun��o que imprime o relat�rio                                         |
 *-------------------------------------------------------------------------------*/
	
Static Function fRepPrint(oReport)
	Local aArea    := GetArea()
	Local cQryAux  := ""
	Local oSectDad := Nil
	Local nAtual   := 0
	Local nTotal   := 0
	
	//Pegando as se��es do relat�rio
	oSectDad := oReport:Section(1)
	
	//Montando consulta de dados
	cQryAux := ""
	cQryAux += "SELECT DISTINCT F2_FILIAL     AS FILIAL,"		+ STR_PULA
	cQryAux += "       C5_XFILEST    AS FILORI, "		+ STR_PULA
	cQryAux += "       C5_XFILINT    AS FILINT,"		+ STR_PULA
	cQryAux += "       TO_DATE(TRIM(C5_EMISSAO),'YYYYMMDD') AS DTINPED, "		+ STR_PULA
	cQryAux += "       C5_NUM        AS NUMPED,"		+ STR_PULA
	cQryAux += "       C5_XPVSGAC    AS PEDSGAC,"		+ STR_PULA
	cQryAux += "       F2_DOC        AS NFDESAIDA, "		+ STR_PULA
	cQryAux += "       A1_COD        AS CODCLIENTE, "		+ STR_PULA
	cQryAux += "       A1_LOJA       AS LOJA, "		+ STR_PULA
	cQryAux += "       A1_NOME       AS NOME, "		+ STR_PULA
	cQryAux += "       A1_EST        AS ESTADO, "		+ STR_PULA
	cQryAux += "       A1_CGC        AS CPFCNPJ, "		+ STR_PULA
	cQryAux += "       F2_XIDTRI     AS IDTRIANGULACAO, "		+ STR_PULA
	cQryAux += "       F2_CARGA      AS CARGA, "		+ STR_PULA
	cQryAux += "       D2_VALBRUT    AS VALBRUT,"		+ STR_PULA
	cQryAux += "       C5_XCARGA,"		+ STR_PULA
	cQryAux += "       DAK_XTIPO,"		+ STR_PULA
	cQryAux += "       TO_DATE(TRIM(F2_EMISSAO), 'YYYYMMDD') AS DATAFAT ,"		+ STR_PULA
	cQryAux += "       C5_TRANSP,"		+ STR_PULA
	cQryAux += "       A4_NOME,"		+ STR_PULA
	cQryAux += "       D2_COD,"		+ STR_PULA
	cQryAux += "       B1_DESC,"		+ STR_PULA
	cQryAux += "       D2_QUANT"		+ STR_PULA
	cQryAux += "      "		+ STR_PULA
	cQryAux += "FROM   SF2010 "		+ STR_PULA
	cQryAux += "       LEFT JOIN SC5010 "		+ STR_PULA
	cQryAux += "              ON SC5010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                 AND C5_NOTA = F2_DOC"		+ STR_PULA
	cQryAux += "                 AND C5_FILIAL = F2_FILIAL"		+ STR_PULA
	cQryAux += "                 AND C5_CLIENTE = F2_CLIENTE"		+ STR_PULA
	cQryAux += "                 AND C5_LOJACLI = F2_LOJA"		+ STR_PULA
	cQryAux += "       LEFT JOIN SD2010 "		+ STR_PULA
	cQryAux += "              ON SD2010.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                 AND F2_DOC = D2_DOC "		+ STR_PULA
	cQryAux += "                 AND F2_FILIAL = D2_FILIAL "		+ STR_PULA
	cQryAux += "                 AND F2_CLIENTE = D2_CLIENTE"		+ STR_PULA
	cQryAux += "                 AND F2_LOJA = D2_LOJA"		+ STR_PULA
	cQryAux += "       LEFT JOIN SB1010 "		+ STR_PULA
	cQryAux += "              ON SB1010.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "              AND B1_COD = D2_COD "		+ STR_PULA
	cQryAux += "       LEFT JOIN SA1010 "		+ STR_PULA
	cQryAux += "              ON A1_COD = F2_CLIENTE "		+ STR_PULA
	cQryAux += "                 AND A1_LOJA = F2_LOJA"		+ STR_PULA
	cQryAux += "              AND SA1010.D_E_L_E_T_ <> '*'  "		+ STR_PULA
	cQryAux += "       LEFT JOIN SF4010"		+ STR_PULA
	cQryAux += "              ON  F4_CODIGO = D2_TES "		+ STR_PULA
	cQryAux += "              AND F4_FILIAL = D2_FILIAL"		+ STR_PULA
	cQryAux += "              AND SF4010.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "         LEFT JOIN DAK010 "		+ STR_PULA
	cQryAux += "              ON C5_FILIAL = DAK_FILIAL "		+ STR_PULA
	cQryAux += "                 AND C5_XCARGA = DAK_COD "		+ STR_PULA
	cQryAux += "       LEFT JOIN SA4010 A4"		+ STR_PULA
	cQryAux += "       ON A4.A4_COD = C5_TRANSP"		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "WHERE  SF2010.D_E_L_E_T_ <> '*'"		+ STR_PULA
	cQryAux += "  AND 0 = (SELECT COUNT(*) "		+ STR_PULA
	cQryAux += "             FROM SIGAOFC.SF3010 F3"		+ STR_PULA
	cQryAux += "            WHERE F3.F3_OBSERV LIKE '%CANC%'"		+ STR_PULA
	cQryAux += "              AND F3.F3_FILIAL  = F2_FILIAL "		+ STR_PULA
	cQryAux += "              AND F3.F3_NFISCAL = F2_DOC"		+ STR_PULA
	cQryAux += "              AND F3.F3_SERIE   = F2_SERIE"		+ STR_PULA
	cQryAux += "              AND F3.F3_CLIEFOR = F2_CLIENTE"		+ STR_PULA
	cQryAux += "              AND F3.F3_LOJA    = F2_LOJA"		+ STR_PULA
	cQryAux += "              AND F3.D_E_L_E_T_ <> '*')"		+ STR_PULA
	cQryAux += "              "		+ STR_PULA
	cQryAux += "       AND F2_XIDTRI BETWEEN '  ' AND 'ZZZZZZZ' "		+ STR_PULA
	cQryAux += "       AND A1_CGC NOT IN ( '52502507006269', '52502507006269', '52502507000309', "		+ STR_PULA
	cQryAux += "                           '52502507006854', "		+ STR_PULA
	cQryAux += "                           '52502507001208', '52502507006692', '52502507000813', "		+ STR_PULA
	cQryAux += "                               '26687598000122', "		+ STR_PULA
	cQryAux += "                           '52502507001895', '52502507001623', '52502507002271', "		+ STR_PULA
	cQryAux += "                               '52502507001976', "		+ STR_PULA
	cQryAux += "                           '52502507000147', '52502507001380', '26687598000203', "		+ STR_PULA
	cQryAux += "                               '26687598000475', "		+ STR_PULA
	cQryAux += "                           '26687598000394', '52502507000651' ) "		+ STR_PULA
	cQryAux += "       AND F4_DUPLIC = 'S' "		+ STR_PULA
	cQryAux += "       AND F2_TIPO = 'N'"		+ STR_PULA
	cQryAux += "       AND F2_FILIAL BETWEEN '  '   AND 'ZZZZ' "		+ STR_PULA
	//cQryAux += "       AND TO_DATE(F2_EMISSAO, 'YYYYMMDD') BETWEEN '20200803' AND '20200803'"		+ STR_PULA
	cQryAux += "       AND TO_DATE(TRIM(F2_EMISSAO), 'YYYYMMDD') BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA

	MemoWrite("C:\teste\RELFATPR_8226.sql",cQryAux) //10/08/2020

	cQryAux := ChangeQuery(cQryAux)
	
	//Executando consulta e setando o total da r�gua
	TCQuery cQryAux New Alias "QRY_AUX"
	Count to nTotal
	oReport:SetMeter(nTotal)
	
	//Enquanto houver dados
	oSectDad:Init()
	QRY_AUX->(DbGoTop())
	While ! QRY_AUX->(Eof())
		//Incrementando a r�gua
		nAtual++
		oReport:SetMsgPrint("Imprimindo registro "+cValToChar(nAtual)+" de "+cValToChar(nTotal)+"...")
		oReport:IncMeter()
		
		//Imprimindo a linha atual
		oSectDad:PrintLine()
		
		QRY_AUX->(DbSkip())
	EndDo
	oSectDad:Finish()
	QRY_AUX->(DbCloseArea())
	
	RestArea(aArea)
Return
