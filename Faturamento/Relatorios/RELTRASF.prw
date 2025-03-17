//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELTRASF
Relatório - Transferências Entre Filiais  
@author TReport
@since 13/02/2019
@version 1.0 //
	@example
	u_RELTRASF()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELTRASF()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELTRASF2"
	
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
	//Local oBreak := Nil
	
	//Criação do componente de impressão
	oReport := TReport():New(	"RELTRASF",;		//Nome do Relatório
								"Transferências Entre Filiais",;		//Título
								cPerg,;		//Pergunte ... Se eu defino a pergunta aqui, será impresso uma página com os parâmetros, conforme privilégio 101
								{|oReport| fRepPrint(oReport)},;		//Bloco de código que será executado na confirmação da impressão
								)		//Descrição
	oReport:SetTotalInLine(.F.)
	oReport:lParamPage := .F.
	oReport:oPage:SetPaperSize(9) //Folha A4
	oReport:SetPortrait()
	oReport:SetLineHeight(60)
	oReport:nFontBody := 12
	
	//Criando a seção de dados
	oSectDad := TRSection():New(	oReport,;		//Objeto TReport que a seção pertence
									"Dados",;		//Descrição da seção
									{"QRY_AUX"})		//Tabelas utilizadas, a primeira será considerada como principal da seção
	oSectDad:SetTotalInLine(.F.)  //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
	//Colunas do relatório
	TRCell():New(oSectDad, "SITORIG", "QRY_AUX", "Sitorig", /*Picture*/, 18, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "STIDEST", "QRY_AUX", "Stidest", /*Picture*/, 19, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FILORI", "QRY_AUX", "Filori", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FILDEST", "QRY_AUX", "Fildest", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DOCORI", "QRY_AUX", "Docori", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DOCDEST", "QRY_AUX", "Docdest", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "SERIORI", "QRY_AUX", "Seriori", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "SERIDEST", "QRY_AUX", "Seridest", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTENTRADA", "QRY_AUX", "Dtentrada", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTEMISSAO", "QRY_AUX", "Dtemissao", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTSAIDA", "QRY_AUX", "Dtsaida", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FORNLOJ_DEST", "QRY_AUX", "Fornloj_dest", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CLILOJ_ORIG", "QRY_AUX", "Cliloj_orig", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PRODORIG", "QRY_AUX", "Prodorig", /*Picture*/, 56, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FILDES", "QRY_AUX", "Fildes", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FILOR", "QRY_AUX", "Filor", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PRODDEST", "QRY_AUX", "Proddest", /*Picture*/, 56, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TESENTRADA", "QRY_AUX", "Tesentrada", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TESSAIDA", "QRY_AUX", "Tessaida", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QTDENTRADA", "QRY_AUX", "Qtdentrada", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QTDSAIDA", "QRY_AUX", "Qtdsaida", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TOTALENTRADA", "QRY_AUX", "Totalentrada", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TOTALSAIDA", "QRY_AUX", "Totalsaida", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	
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
	
	U_xPutSx1(cPerg,"01","Data Saida De ?","","","mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Data Saida Até ?","","","mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"03","Data Entrada De ?","","","mv_CH3","D",08,0,0,"G","","","","","MV_PAR03","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"04","Data Entrada Até ?","","","mv_CH4","D",08,0,0,"G","","","","","MV_PAR04","","","","","","","","","","","","","","","","")
  	U_xPutSx1(cPerg,"05","Filial Origem De ?","","","mv_CH5","C",04,0,0,"G","","SM0","","","MV_PAR05","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"06","Filial Origem Até ?","","","mv_CH6","C",04,0,0,"G","","SM0","","","MV_PAR06","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"07","Filial Destino De ?","","","mv_CH7","C",04,0,0,"G","","SM0","","","MV_PAR07","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"08","Filial Destino Até ?","","","mv_CH8","C",04,0,0,"G","","SM0","","","MV_PAR08","","","","","","","","","","","","","","","","")
		
	
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
	cQryAux := ""
	cQryAux += "SELECT SITORIG, "		+ STR_PULA
	cQryAux += "       (CASE "		+ STR_PULA
	cQryAux += "                    WHEN SITDEST IS NULL THEN 'NOTA NÃO LANÇADA'"		+ STR_PULA
	cQryAux += "                    ELSE SITDEST END) AS STIDEST ,"		+ STR_PULA
	cQryAux += "       FILORI, "		+ STR_PULA
	cQryAux += "       FILDEST, "		+ STR_PULA
	cQryAux += "       DOCORI, "		+ STR_PULA
	cQryAux += "       DOCDEST, "		+ STR_PULA
	cQryAux += "       SERIORI, "		+ STR_PULA
	cQryAux += "       SERIDEST, "		+ STR_PULA
	cQryAux += "       DTENTRADA, "		+ STR_PULA
	cQryAux += "       DTEMISSAO, "		+ STR_PULA
	cQryAux += "       DTSAIDA, "		+ STR_PULA
	cQryAux += "       FORNDEST "		+ STR_PULA
	cQryAux += "       || LOJDEST           AS FORNLOJ_DEST, "		+ STR_PULA
	cQryAux += "       CLIORIG "		+ STR_PULA
	cQryAux += "       || LOJORIG           AS CLILOJ_ORIG, "		+ STR_PULA
	cQryAux += "       TRIM (TRIM (PRODORIG) "		+ STR_PULA
	cQryAux += "             || '-' "		+ STR_PULA
	cQryAux += "             || E.DESCPROD) AS PRODORIG, "		+ STR_PULA
	cQryAux += "       FILDES, "		+ STR_PULA
	cQryAux += "       FILOR, "		+ STR_PULA
	cQryAux += "       TRIM (TRIM (PRODDEST) "		+ STR_PULA
	cQryAux += "             || '-' "		+ STR_PULA
	cQryAux += "             || S.DESCPROD) AS PRODDEST, "		+ STR_PULA
	cQryAux += "       E.TESENTRADA, "		+ STR_PULA
	cQryAux += "       S.TESSAIDA, "		+ STR_PULA
	cQryAux += "       E.QTD                QTDENTRADA, "		+ STR_PULA
	cQryAux += "       S.QTD                QTDSAIDA, "		+ STR_PULA
	cQryAux += "       E.TOTAL              TOTALENTRADA, "		+ STR_PULA
	cQryAux += "       S.TOTAL              TOTALSAIDA "		+ STR_PULA
	cQryAux += "FROM   (SELECT ( CASE SD2010.D_E_L_E_T_ "		+ STR_PULA
	cQryAux += "                   WHEN '*' THEN 'DELETADA_NA_ORIGEM' "		+ STR_PULA
	cQryAux += "                   ELSE 'NORMAL' "		+ STR_PULA
	cQryAux += "                 END )                                 SITORIG, "		+ STR_PULA
	cQryAux += "               D2_FILIAL                               FILORI, "		+ STR_PULA
	cQryAux += "               D2_DOC                                  DOCORI, "		+ STR_PULA
	cQryAux += "               D2_SERIE                                SERIORI, "		+ STR_PULA
	cQryAux += "               TO_DATE (TRIM (D2_EMISSAO), 'YYYYMMDD') DTSAIDA, "		+ STR_PULA
	cQryAux += "               D2_CLIENTE                              CLIORIG, "		+ STR_PULA
	cQryAux += "               D2_LOJA                                 LOJORIG, "		+ STR_PULA
	cQryAux += "               D2_COD                                  PRODORIG, "		+ STR_PULA
	cQryAux += "               D2_LOCAL                                ARMORIG, "		+ STR_PULA
	cQryAux += "               D2_TES                                  TESSAIDA, "		+ STR_PULA
	cQryAux += "               B1_DESC                                 DESCPROD, "		+ STR_PULA
	cQryAux += "               D2_QUANT                                QTD, "		+ STR_PULA
	cQryAux += "               D2_TOTAL                                TOTAL, "		+ STR_PULA
	cQryAux += "               D2_CUSTO1                               CUSTOSAIDA, "		+ STR_PULA
	cQryAux += "               D2_ITEM                                 ITEMSAIDA, "		+ STR_PULA
	cQryAux += "               A1_FILTRF                               FILDES "		+ STR_PULA
	cQryAux += "        FROM   SD2010 "		+ STR_PULA
	cQryAux += "               LEFT JOIN SB1010 "		+ STR_PULA
	cQryAux += "                      ON D2_COD = B1_COD "		+ STR_PULA
	cQryAux += "               LEFT JOIN SF4010 "		+ STR_PULA
	cQryAux += "                      ON F4_FILIAL = D2_FILIAL "		+ STR_PULA
	cQryAux += "                         AND F4_CODIGO = D2_TES "		+ STR_PULA
	cQryAux += "               LEFT JOIN SA1010 "		+ STR_PULA
	cQryAux += "                      ON A1_COD "		+ STR_PULA
	cQryAux += "                         || A1_LOJA = D2_CLIENTE "		+ STR_PULA
	cQryAux += "                                      || D2_LOJA "		+ STR_PULA
	cQryAux += "        WHERE  A1_FILTRF <> '  ' "		+ STR_PULA
	cQryAux += "               AND F4_TRANFIL = '1') S "		+ STR_PULA
	cQryAux += "       LEFT JOIN (SELECT ( CASE "		+ STR_PULA
	cQryAux += "                             WHEN SD1010.D_E_L_E_T_ = '*' THEN "		+ STR_PULA
	cQryAux += "                             'DELETADA_NO_DESTINO' "		+ STR_PULA
	cQryAux += "                             WHEN SD1010.D_E_L_E_T_ = ' ' THEN 'NORMAL' "		+ STR_PULA
	cQryAux += "                             WHEN D1_TES = '  ' THEN 'NÃO CLASSIFICADA' "		+ STR_PULA
	cQryAux += "                             ELSE 'ENTRE EM CONTATO TI' "		+ STR_PULA
	cQryAux += "                           END )                                 SITDEST, "		+ STR_PULA
	cQryAux += "                         D1_FILIAL                               FILDEST, "		+ STR_PULA
	cQryAux += "                         D1_DOC                                  DOCDEST, "		+ STR_PULA
	cQryAux += "                         D1_SERIE                                SERIDEST, "		+ STR_PULA
	cQryAux += "                         TO_DATE (TRIM (D1_DTDIGIT), 'YYYYMMDD') DTENTRADA, "		+ STR_PULA
	cQryAux += "                         TO_DATE (TRIM (D1_EMISSAO), 'YYYYMMDD') DTEMISSAO, "		+ STR_PULA
	cQryAux += "                         D1_FORNECE                              FORNDEST, "		+ STR_PULA
	cQryAux += "                         D1_LOJA                                 LOJDEST, "		+ STR_PULA
	cQryAux += "                         D1_COD                                  PRODDEST, "		+ STR_PULA
	cQryAux += "                         D1_LOCAL                                ARMDEST, "		+ STR_PULA
	cQryAux += "                         D1_TES                                  TESENTRADA, "		+ STR_PULA
	cQryAux += "                         B1_DESC                                 DESCPROD, "		+ STR_PULA
	cQryAux += "                         D1_QUANT                                QTD, "		+ STR_PULA
	cQryAux += "                         D1_TOTAL                                TOTAL, "		+ STR_PULA
	cQryAux += "                         D1_CUSTO                                CUSTOENTRADA, "		+ STR_PULA
	cQryAux += "                         D1_ITEM                                 ITEMENTRADA, "		+ STR_PULA
	cQryAux += "                         A2_FILTRF                               FILOR "		+ STR_PULA
	cQryAux += "                  FROM   SD1010 "		+ STR_PULA
	cQryAux += "                         LEFT JOIN SB1010 "		+ STR_PULA
	cQryAux += "                                ON D1_COD = B1_COD "		+ STR_PULA
	cQryAux += "                         LEFT JOIN SF4010 "		+ STR_PULA
	cQryAux += "                                ON F4_FILIAL = D1_FILIAL "		+ STR_PULA
	cQryAux += "                                   AND F4_CODIGO = D1_TES "		+ STR_PULA
	cQryAux += "                         LEFT JOIN SA2010 "		+ STR_PULA
	cQryAux += "                                ON A2_COD "		+ STR_PULA
	cQryAux += "                                   || A2_LOJA = D1_FORNECE "		+ STR_PULA
	cQryAux += "                                                || D1_LOJA "		+ STR_PULA
	cQryAux += "                  WHERE  A2_FILTRF <> ' ') E "		+ STR_PULA
	cQryAux += "              ON DOCORI = DOCDEST "		+ STR_PULA
	cQryAux += "                 AND SERIORI = SERIDEST "		+ STR_PULA
	cQryAux += "                 AND PRODDEST = PRODORIG "		+ STR_PULA
	cQryAux += "WHERE  FILDES = FILDEST "		+ STR_PULA
	cQryAux += "       AND FILOR = FILORI "		+ STR_PULA
	cQryAux += "       AND S.ITEMSAIDA = SUBSTR(E.ITEMENTRADA, 3,2) "		+ STR_PULA
	cQryAux += "       AND (DTSAIDA BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	cQryAux += "       OR   DTEMISSAO BETWEEN '" + DTOS(MV_PAR03) +"' AND '"+ DTOS(MV_PAR04) +"') 	" + STR_PULA
	cQryAux += "              AND FILORI BETWEEN '" + MV_PAR05 +"' AND '"+ MV_PAR06 +"' 	" + STR_PULA
	cQryAux += "              AND FILDEST BETWEEN '" + MV_PAR07 +"' AND '"+ MV_PAR08 +"' 	" + STR_PULA
	cQryAux += "ORDER BY DOCORI "		+ STR_PULA
	//cQryAux += "       AND (DTSAIDA BETWEEN '20200408' AND '20200408' "		+ STR_PULA
	//cQryAux += "       OR DTEMISSAO BETWEEN '20200408' AND '20200408')"		+ STR_PULA
	//cQryAux += "       AND FILORI BETWEEN '0102' AND '0102' "		+ STR_PULA
	//cQryAux += "       AND FILDEST BETWEEN '0104' AND '0104' "		+ STR_PULA

	MemoWrite("C:\teste\RELTRASF_V6_0.sql",cQryAux) //V4.0 26/03/2021
	
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
