//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELFATUR
Whintor - 8202 - Faturamento em aberto                   
@author TReport
@since 10/08/2020
@version 1.0
	@example
	u_RELFATUR()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELFATUR()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELFATUR"
	
	////////////////////////////////////////////////////////////////////////
	///Cria as perguntas no SX1
	////////////////////////////////////////////////////////////////////////
	ValPer01()
	
	if !Pergunte(cPerg,.t.)
		return
	endif
	
	//Cria as definições do relatório
	oReport := fReportDef()
	
	//Será enviado por e-Mail?
	If lEmail
		oReport:nRemoteType := NO_REMOTE
		oReport:cEmail := cPara
		oReport:nDevice := 3 //1-Arquivo,2-Impressora,3-email,4-Planilha e 5-Html
		oReport:SetPreview(.F.)
		oReport:Print(.F., "", .T.)
	//Senão, mostra a tela
	Else
		oReport:PrintDialog()
	EndIf
	
	RestArea(aArea)
Return
	
/*-------------------------------------------------------------------------------*
 | Func:  fReportDef                                                             |
 | Desc:  Função que monta a definição do relatório                              |
 *-------------------------------------------------------------------------------*/
	
Static Function fReportDef()
	Local oReport
	Local oSectDad := Nil 
	Local oBreak := Nil
	//Criação do componente de impressão
	oReport := TReport():New(	"RELFATUR",;		//Nome do Relatório
								"8202 - Faturamento em aberto",;		//Título
								cPerg,;		//Pergunte ... Se eu defino a pergunta aqui, será impresso uma página com os parâmetros, conforme privilégio 101
								{|oReport| fRepPrint(oReport)},;		//Bloco de código que será executado na confirmação da impressão
								)		//Descrição
	oReport:SetTotalInLine(.F.)
	oReport:lParamPage := .F.
	oReport:oPage:SetPaperSize(9) //Folha A4
	oReport:SetPortrait()
	oReport:SetLineHeight(60)
	oReport:nFontBody := 9
	
	//Criando a seção de dados
	oSectDad := TRSection():New(	oReport,;		//Objeto TReport que a seção pertence
									"Dados",;		//Descrição da seção
									{"QRY_AUX"})		//Tabelas utilizadas, a primeira será considerada como principal da seção
	oSectDad:SetTotalInLine(.F.)  //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
	//Colunas do relatório
	TRCell():New(oSectDad, "FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "OPERACAO", "QRY_AUX", "Operacao", /*Picture*/, 7, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FILORI", "QRY_AUX", "Filori", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTINPED", "QRY_AUX", "Dtinped", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NUMPED", "QRY_AUX", "Numped", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PEDSGAC", "QRY_AUX", "Pedsgac", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NFDESAIDA", "QRY_AUX", "Nfdesaida", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PESOLIQ", "QRY_AUX", "Pesoliq", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PESOBRUTO", "QRY_AUX", "Pesobruto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
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
	TRCell():New(oSectDad, "MESFAT", "QRY_AUX", "Mesfat", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ANOFAT", "QRY_AUX", "Anofat", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F2_CHVNFE", "QRY_AUX", "Chave NFe", /*Picture*/, 44, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "C5_VEND1", "QRY_AUX", "Vendedor 1", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A3_NOME", "QRY_AUX", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A1_MUN", "QRY_AUX", "Municipio", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DESCREGIAO", "QRY_AUX", "Descregiao", /*Picture*/, 12, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DAK_PESO", "QRY_AUX", "Peso", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DAK_PTOENT", "QRY_AUX", "Ptos de Entr", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QTD", "QRY_AUX", "Qtd", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)

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
	
	U_xPutSx1(cPerg,"01","Data Inicial ?","."     ,"."       ,"mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Data Final ?","."     ,"."       ,"mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")

	dbSelectArea(_sAlias)

Return()	
	
/*-------------------------------------------------------------------------------*
 | Func:  fRepPrint                                                              |
 | Desc:  Função que imprime o relatório                                         |
 *-------------------------------------------------------------------------------*/
	
Static Function fRepPrint(oReport)
	Local aArea    := GetArea()
	Local cQryAux  := ""
	Local oSectDad := Nil
	Local nAtual   := 0
	Local nTotal   := 0
	
	//Pegando as seções do relatório
	oSectDad := oReport:Section(1)
	
	//Montando consulta de dados
	//Montando consulta de dados
	cQryAux := ""
	cQryAux += "SELECT F2_FILIAL AS FILIAL,"		+ STR_PULA
	cQryAux += "       (CASE "		+ STR_PULA
	cQryAux += "           WHEN  F4_TRANFIL ='1' THEN 'TRANSF' "		+ STR_PULA
	cQryAux += "           WHEN  F4_DUPLIC ='S' THEN 'VENDAS'"		+ STR_PULA
	cQryAux += "           WHEN  F4_PODER3 ='R' THEN'REMESSA'"		+ STR_PULA
	cQryAux += "           ELSE 'OUTROS' END) OPERACAO,"		+ STR_PULA
	cQryAux += "         C5_XFILEST AS FILORI,"		+ STR_PULA
	cQryAux += "         TO_DATE (TRIM (C5_EMISSAO), 'YYYYMMDD') AS DTINPED,"		+ STR_PULA
	cQryAux += "         C5_NUM AS NUMPED,"		+ STR_PULA
	cQryAux += "         C5_XPVSGAC AS PEDSGAC,"		+ STR_PULA
	cQryAux += "         F2_DOC AS NFDESAIDA,"		+ STR_PULA
	cQryAux += "         C5_PESOL PESOLIQ,"		+ STR_PULA
	cQryAux += "         C5_PBRUTO PESOBRUTO,"		+ STR_PULA
	cQryAux += "         F2_CLIENTE AS CODCLIENTE,"		+ STR_PULA
	cQryAux += "         F2_LOJA AS LOJA,"		+ STR_PULA
	cQryAux += "         A1_NOME AS NOME,"		+ STR_PULA
	cQryAux += "         A1_EST AS ESTADO,"		+ STR_PULA
	cQryAux += "         A1_CGC AS CPFCNPJ,"		+ STR_PULA
	cQryAux += "         F2_XIDTRI AS IDTRIANGULACAO,"		+ STR_PULA
	cQryAux += "         F2_CARGA AS CARGA,"		+ STR_PULA
	cQryAux += "         F2_VALBRUT AS VALBRUT,"		+ STR_PULA
	cQryAux += "         C5_XCARGA,"		+ STR_PULA
	cQryAux += "         DAK_XTIPO,"		+ STR_PULA
	cQryAux += "         TO_DATE (F2_EMISSAO, 'YYYYMMDD') AS DATAFAT,"		+ STR_PULA
	cQryAux += "         C5_TRANSP,"		+ STR_PULA
	cQryAux += "         A4_NOME,"		+ STR_PULA
	cQryAux += "         TO_CHAR (TO_DATE (TRIM (F2_EMISSAO), 'YYYYMMDD'), 'MM') AS MESFAT,"		+ STR_PULA
	cQryAux += "         TO_CHAR (TO_DATE (TRIM (F2_EMISSAO), 'YYYYMMDD'), 'YYYY') AS ANOFAT,"		+ STR_PULA
	cQryAux += "         F2_CHVNFE,"		+ STR_PULA
	cQryAux += "          C5_VEND1,"		+ STR_PULA
	cQryAux += "       A3_NOME,"		+ STR_PULA
	cQryAux += "       A1_MUN,"		+ STR_PULA
	cQryAux += "        (CASE "		+ STR_PULA
	cQryAux += "         WHEN A1_EST IN ( 'GO', 'MT', 'MS' , 'DF') THEN 'CENTRO OESTE' "		+ STR_PULA
	cQryAux += "         WHEN A1_EST IN ( 'AM', 'RR', 'AP', 'PA', "		+ STR_PULA
	cQryAux += "                          'TO', 'RO', 'AC' ) THEN 'NORTE' "		+ STR_PULA
	cQryAux += "         WHEN A1_EST IN ( 'MA', 'PI', 'CE', 'RN', "		+ STR_PULA
	cQryAux += "                          'PE', 'PB', 'SE', 'AL', 'BA' ) THEN 'NORDESTE' "		+ STR_PULA
	cQryAux += "         WHEN A1_EST IN ( 'SP', 'RJ', 'ES', 'MG' ) THEN 'SUDESTE' "		+ STR_PULA
	cQryAux += "         WHEN A1_EST IN ( 'PR', 'RS', 'SC' ) THEN 'SUL' "		+ STR_PULA
	cQryAux += "         WHEN A1_EST IN ( 'EX' ) THEN 'EXTERIOR' "		+ STR_PULA
	cQryAux += "       END )"		+ STR_PULA
	cQryAux += "       AS DESCREGIAO,"		+ STR_PULA
	cQryAux += "       DAK_PESO, "		+ STR_PULA
	cQryAux += "       DAK_PTOENT,"		+ STR_PULA
	cQryAux += "       COUNT(F2_DOC) QTD"		+ STR_PULA
	cQryAux += "FROM                        SD2010"		+ STR_PULA
	cQryAux += "                           LEFT JOIN"		+ STR_PULA
	cQryAux += "                              SF2010"		+ STR_PULA
	cQryAux += "                           ON     SF2010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "                              AND F2_FILIAL = D2_FILIAL"		+ STR_PULA
	cQryAux += "                              AND F2_DOC = D2_DOC"		+ STR_PULA
	cQryAux += "                              AND F2_CLIENTE = D2_CLIENTE"		+ STR_PULA
	cQryAux += "                              AND F2_LOJA = D2_LOJA"		+ STR_PULA
	cQryAux += "                              "		+ STR_PULA
	cQryAux += "                        LEFT JOIN"		+ STR_PULA
	cQryAux += "                           SC5010"		+ STR_PULA
	cQryAux += "                        ON     SC5010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "                           AND C5_FILIAL = F2_FILIAL"		+ STR_PULA
	cQryAux += "                           AND C5_NOTA = F2_DOC"		+ STR_PULA
	cQryAux += "                           AND C5_CLIENTE = F2_CLIENTE"		+ STR_PULA
	cQryAux += "                           AND C5_LOJACLI = F2_LOJA"		+ STR_PULA
	cQryAux += "                     "		+ STR_PULA
	cQryAux += "              "		+ STR_PULA
	cQryAux += "       LEFT JOIN SA1010 "		+ STR_PULA
	cQryAux += "              ON SA1010.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "              AND A1_COD = F2_CLIENTE "		+ STR_PULA
	cQryAux += "              AND A1_LOJA = F2_LOJA "		+ STR_PULA
	cQryAux += "               LEFT JOIN"		+ STR_PULA
	cQryAux += "                  SF4010 "		+ STR_PULA
	cQryAux += "               ON SF4010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux += "               AND F4_FILIAL = D2_FILIAL "		+ STR_PULA
	cQryAux += "               AND F4_CODIGO = D2_TES"		+ STR_PULA
	cQryAux += "               "		+ STR_PULA
	cQryAux += "                               "		+ STR_PULA
	cQryAux += "            LEFT JOIN SA3010 A3"		+ STR_PULA
	cQryAux += "       ON  A3.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux += "       AND A3.A3_COD = C5_VEND1"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "               "		+ STR_PULA
	cQryAux += "            LEFT JOIN"		+ STR_PULA
	cQryAux += "               DAK010"		+ STR_PULA
	cQryAux += "            ON     F2_FILIAL = DAK_FILIAL"		+ STR_PULA
	cQryAux += "               AND DAK010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "               AND F2_CARGA = DAK_COD"		+ STR_PULA
	//cQryAux += "            ON     C5_FILIAL = DAK_FILIAL"		+ STR_PULA
 	//cQryAux += "               AND DAK010.D_E_L_E_T_ = ' '"		+ STR_PULA
	//cQryAux += "               AND C5_XCARGA = DAK_COD"		+ STR_PULA
	cQryAux += "               "		+ STR_PULA
	cQryAux += "         LEFT JOIN"		+ STR_PULA
	cQryAux += "            SA4010 A4"		+ STR_PULA
	cQryAux += "         ON A4.D_E_L_E_T_ = ' ' AND A4.A4_COD = C5_TRANSP"		+ STR_PULA
	cQryAux += "         "		+ STR_PULA
	cQryAux += " WHERE   SD2010.D_E_L_E_T_ = ' '"		+ STR_PULA
	//cQryAux += "         AND D2_EMISSAO BETWEEN '20210114' AND  '20210114'"		+ STR_PULA
	cQryAux += "       AND TO_DATE(trim(D2_EMISSAO), 'YYYYMMDD') BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	cQryAux += " "		+ STR_PULA
	cQryAux += " GROUP  BY F2_FILIAL, "		+ STR_PULA
	cQryAux += "          C5_XFILEST,"		+ STR_PULA
	cQryAux += "          C5_NUM, "		+ STR_PULA
	cQryAux += "          C5_XPVSGAC,"		+ STR_PULA
	cQryAux += "          F2_DOC, "		+ STR_PULA
	cQryAux += "          F2_CLIENTE, "		+ STR_PULA
	cQryAux += "          F2_LOJA, "		+ STR_PULA
	cQryAux += "          A1_EST, "		+ STR_PULA
	cQryAux += "          A1_CGC, "		+ STR_PULA
	cQryAux += "          F2_XIDTRI, "		+ STR_PULA
	cQryAux += "          F2_CARGA, "		+ STR_PULA
	cQryAux += "          C5_PESOL,"		+ STR_PULA
	cQryAux += "          C5_PBRUTO,"		+ STR_PULA
	cQryAux += "          A1_NOME, "		+ STR_PULA
	cQryAux += "          F2_VALBRUT,"		+ STR_PULA
	cQryAux += "          C5_XCARGA,"		+ STR_PULA
	cQryAux += "          F2_EMISSAO,"		+ STR_PULA
	cQryAux += "          DAK_XTIPO,"		+ STR_PULA
	cQryAux += "          C5_TRANSP,"		+ STR_PULA
	cQryAux += "          A4_NOME ,"		+ STR_PULA
	cQryAux += "          C5_EMISSAO,"		+ STR_PULA
	cQryAux += "          F2_CHVNFE,"		+ STR_PULA
	cQryAux += "          C5_VEND1,"		+ STR_PULA
	cQryAux += "          A3_NOME,"		+ STR_PULA
	cQryAux += "          A1_MUN,"		+ STR_PULA
	cQryAux += "          DAK_PESO, "		+ STR_PULA
	cQryAux += "          DAK_PTOENT,"		+ STR_PULA
	cQryAux += "          F4_TRANFIL ,"		+ STR_PULA
	cQryAux += "          F4_DUPLIC,"		+ STR_PULA
	cQryAux += "          F4_PODER3"		+ STR_PULA

	MemoWrite("C:\teste\RELFATUR_8202_v5.sql",cQryAux) //15/01/2021 

	cQryAux := ChangeQuery(cQryAux)
	
	//Executando consulta e setando o total da régua
	TCQuery cQryAux New Alias "QRY_AUX"
	Count to nTotal
	oReport:SetMeter(nTotal)
	
	//Enquanto houver dados
	oSectDad:Init()
	QRY_AUX->(DbGoTop())
	While ! QRY_AUX->(Eof())
		//Incrementando a régua
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
