//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELSAC
Relatório - Relatorio SAC                 
@author TReport
@since 20/09/2022
@version 1.0
	@example
	u_RELSAC()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELSAC()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELSAC"
	
	ValPer01()
	
	if !Pergunte(cPerg,.t.)
		return
	endif
	
	//Cria as definições do relatório
	oReport := fReportDef()
	oReport:PrintDialog()

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
	oReport := TReport():New(	"RELSAC",;		//Nome do Relatório
								"Relatorio SAC - 8214",;		//Título
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
	TRCell():New(oSectDad, "UC_XPROTOC", "QRY_AUX", "Protocolo", /*Picture*/, 18, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UC_FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UC_CODIGO", "QRY_AUX", "Atendimento", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DATA", "QRY_AUX", "Data", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UC_TIPO", "QRY_AUX", "Comunicacao", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DESCS", "QRY_AUX", "Descs", /*Picture*/, 12, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "IDENTTP", "QRY_AUX", "Identtp", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MAQ", "QRY_AUX", "Máquina", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
    TRCell():New(oSectDad, "UC_CODCONT", "QRY_AUX", "Contato", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "U5_CONTAT", "QRY_AUX", "Nome", /*Picture*/, 30, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UC_OPERADO", "QRY_AUX", "Operador", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "U7_NOME", "QRY_AUX", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UD_ASSUNTO", "QRY_AUX", "Assunto", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "X5_DESCRI", "QRY_AUX", "Descricao", /*Picture*/, 55, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UD_PRODUTO", "QRY_AUX", "Produto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "B1_DESC", "QRY_AUX", "Descricao", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UD_OCORREN", "QRY_AUX", "Ocorrencia", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "U9_DESC", "QRY_AUX", "Desc. Ocorre.", /*Picture*/, 30, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UD_XDMPRBL", "QRY_AUX", "Desc. M Prob", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DATAFAB", "QRY_AUX", "Datafab", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DATAVALID", "QRY_AUX", "Datavalid", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UD_XPRODUC", "QRY_AUX", "Produção", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UD_XLOTE", "QRY_AUX", "Lote", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UD_XHORAF", "QRY_AUX", "Horario", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QTDAVARIADA", "QRY_AUX", "Qtdavariada", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QTDRESSARCIDA", "QRY_AUX", "Qtdressarcida", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QTDCOLETADA", "QRY_AUX", "Qtdcoletada", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "OBSITEM", "QRY_AUX", "Obsitem", /*Picture*/, 128, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UD_SOLUCAO", "QRY_AUX", "Açao", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UQ_DESC", "QRY_AUX", "Descricao", /*Picture*/, 55, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UD_CODFNC", "QRY_AUX", "Código FNC", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FNC", "QRY_AUX", "FNC", /*Picture*/, 11, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)

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
	cPerg 	:=	PADR(cPerg,10)
		
	U_xPutSx1(cPerg,"01","Data de ?","","","mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Data Até ?","","","mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")

    dbSelectArea(_sAlias)
Return	
	

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
	cQryAux += "SELECT UC_XPROTOC, "		+ STR_PULA
	cQryAux += "       UC_FILIAL,"		+ STR_PULA
	cQryAux += "       UC_CODIGO,"		+ STR_PULA
	cQryAux += "       TO_DATE(TRIM(UC_DATA),'YYYYMMDD') AS DATA,"		+ STR_PULA
	cQryAux += "       UC_TIPO,"		+ STR_PULA
	cQryAux += "            (CASE WHEN UC_TIPO = '000001' THEN 'TELEFONE'"		+ STR_PULA
	cQryAux += "                  WHEN UC_TIPO = '000002' THEN 'WHATSAPP'"		+ STR_PULA
	cQryAux += "                  WHEN UC_TIPO = '000003' THEN 'FACEBOOK'"		+ STR_PULA
	cQryAux += "                  WHEN UC_TIPO = '000004' THEN 'RECLAME AQUI'"		+ STR_PULA
	cQryAux += "                  WHEN UC_TIPO = '000005' THEN 'E-MAIL'"		+ STR_PULA
	cQryAux += "                  WHEN UC_TIPO = '000006' THEN 'CARTA'"		+ STR_PULA
	cQryAux += "            END) DESCS,       "		+ STR_PULA
	cQryAux += "            (CASE WHEN UC_XIDENTP = 'V' THEN 'VISUAL'"		+ STR_PULA
	cQryAux += "                 WHEN UC_XIDENTP = 'S' THEN 'SENSORIAL'"		+ STR_PULA
	cQryAux += "            END) IDENTTP, "		+ STR_PULA
	cQryAux += "            (CASE WHEN UC_XTPEMB = 'T' THEN  'TETRA PAK'"		+ STR_PULA
	cQryAux += "                  WHEN UC_XTPEMB = 'S' THEN  'SIG'"		+ STR_PULA
	cQryAux += "            END) MAQ, "		+ STR_PULA
	cQryAux += "        UC_CODCONT,"		+ STR_PULA
	cQryAux += "        U5_CONTAT,"		+ STR_PULA
	cQryAux += "        UC_OPERADO,"		+ STR_PULA
	cQryAux += "        U7_NOME,"		+ STR_PULA
	cQryAux += "        UD_ASSUNTO,"		+ STR_PULA
	cQryAux += "        X5_DESCRI,"		+ STR_PULA
	//cQryAux += "       -- COLOCAR NOME DO ASSUNTO"		+ STR_PULA
	cQryAux += "        UD_PRODUTO,"		+ STR_PULA
	cQryAux += "        B1_DESC,"		+ STR_PULA
	cQryAux += "        UD_OCORREN,"		+ STR_PULA
	cQryAux += "        U9_DESC,"		+ STR_PULA
	cQryAux += "        UD_XDMPRBL,"		+ STR_PULA
	cQryAux += "        TO_DATE(TRIM(UD_XDTFAB),'YYYYMMDD') AS DATAFAB,"		+ STR_PULA
	cQryAux += "        TO_DATE(TRIM(UD_XVALIDA),'YYYYMMDD') AS DATAVALID,"		+ STR_PULA
	cQryAux += "        UD_XPRODUC,"		+ STR_PULA
	cQryAux += "        UD_XLOTE,"		+ STR_PULA
	cQryAux += "        UD_XHORAF,"		+ STR_PULA
	//cQryAux += "      -- UD_XQTDAQ AS QTDADIQ,"		+ STR_PULA
	cQryAux += "        UD_XQTDAVA AS QTDAVARIADA,"		+ STR_PULA
	cQryAux += "        UD_XQTRESS AS QTDRESSARCIDA,"		+ STR_PULA
	cQryAux += "        UD_XQTDCOL AS QTDCOLETADA,"		+ STR_PULA
	//cQryAux += "       --UC_OBS AS OBSCAB,"		+ STR_PULA
	cQryAux += "        UD_OBS AS OBSITEM,"		+ STR_PULA
	cQryAux += "        UD_SOLUCAO,"		+ STR_PULA
	cQryAux += "        UQ_DESC,"		+ STR_PULA
	cQryAux += "        UD_CODFNC,"		+ STR_PULA
	cQryAux += "        DECODE(UD_SOLUCAO,'000001','FNC MOCOCA','000002','FNC CQC','NAO ENVIADO') AS FNC"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "FROM SUD010@SIGAOFC SUD"		+ STR_PULA
	cQryAux += "       LEFT JOIN SUC010@SIGAOFC SUC ON SUC.D_E_L_E_T_<>'*'"		+ STR_PULA
	cQryAux += "       AND SUC.UC_CODIGO = SUD.UD_CODIGO"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "       LEFT JOIN SU7010@SIGAOFC SU7 ON SU7.D_E_L_E_T_<>'*'"		+ STR_PULA
	cQryAux += "       AND SU7.U7_COD = SUC.UC_OPERADO"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "       LEFT JOIN SB1010@SIGAOFC SB1 ON SB1.D_E_L_E_T_<>'*'"		+ STR_PULA
	cQryAux += "       AND SB1.B1_COD = SUD.UD_PRODUTO"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "       LEFT JOIN SU9010@SIGAOFC SU9 ON SU9.D_E_L_E_T_ <> '*'"		+ STR_PULA
	cQryAux += "       AND SU9.U9_CODIGO = SUD.UD_OCORREN"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "       LEFT JOIN SX5010@SIGAOFC SX5 ON SX5.D_E_L_E_T_<>'*'"		+ STR_PULA
	cQryAux += "       AND SX5.X5_TABELA ='T1'"		+ STR_PULA
	cQryAux += "       AND SX5.X5_CHAVE = SUD.UD_ASSUNTO"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "       LEFT JOIN SU5010@SIGAOFC SU5"		+ STR_PULA
	cQryAux += "       ON SU5.U5_CODCONT = SUC.UC_CODCONT"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "       LEFT JOIN SUQ010@SIGAOFC SUQ"		+ STR_PULA
	cQryAux += "       ON SUQ.UQ_SOLUCAO = SUD.UD_SOLUCAO"		+ STR_PULA
	cQryAux += "       AND SUQ.D_E_L_E_T_<>'*'"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "WHERE SUD.D_E_L_E_T_<>'*'"		+ STR_PULA
	cQryAux += "       AND TO_DATE(TRIM(UC_DATA),'YYYYMMDD') BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	//cQryAux += "--AND SUD.UD_ASSUNTO IN (:CODASSUNTO)"		+ STR_PULA
	//cQryAux += "--AND SUD.UD_SOLUCAO IN (:CODSOLUCAO)"		+ STR_PULA
	//cQryAux += "--AND SUD.UD_CODFNC  IN (:CODIGOFNC)"		+ STR_PULA
	cQryAux += "ORDER BY UC_CODIGO ASC,"		+ STR_PULA
	cQryAux += "         UD_OCORREN"		    + STR_PULA
	
	MemoWrite("C:\temp\RELSAC_V1.sql",cQryAux) //V1 20/09/2022
	
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
