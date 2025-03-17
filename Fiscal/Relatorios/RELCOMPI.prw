//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELCOMPI
Relatório - Relatório Compilance          
@author TReport
@since 10/04/2019
@version 1.0
	@example
	u_RELCOMPI()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELCOMPI()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELCOMPI"
	
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
	oReport := TReport():New(	"RELCOMPI",;		//Nome do Relatório
								"Relatório Compilance",;		//Título
								cPerg,;		//Pergunte ... Se eu defino a pergunta aqui, será impresso uma página com os parâmetros, conforme privilégio 101
								{|oReport| fRepPrint(oReport)},;		//Bloco de código que será executado na confirmação da impressão
								)		//Descrição
	oReport:SetTotalInLine(.F.)
	oReport:lParamPage := .F.
	oReport:oPage:SetPaperSize(9) //Folha A4
	oReport:SetPortrait()
	
	//Criando a seção de dados
	oSectDad := TRSection():New(	oReport,;		//Objeto TReport que a seção pertence
									"Dados",;		//Descrição da seção
									{"QRY_AUX"})		//Tabelas utilizadas, a primeira será considerada como principal da seção
	oSectDad:SetTotalInLine(.F.)  //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
	//Colunas do relatório
	TRCell():New(oSectDad, "SIT", "QRY_AUX", "Sit", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CHAVE", "QRY_AUX", "Chave", /*Picture*/, 44, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "SERIE", "QRY_AUX", "Serie", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NUMERO", "QRY_AUX", "Numero", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR", "QRY_AUX", "Valor", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "STATUS", "QRY_AUX", "Status", /*Picture*/, 70, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CNPJ", "QRY_AUX", "Cnpj", /*Picture*/, 14, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "EMITENTE", "QRY_AUX", "Emitente", /*Picture*/, 60, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ANO", "QRY_AUX", "Ano", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DATA", "QRY_AUX", "Data", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MES", "QRY_AUX", "Mes", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
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
	
	U_xPutSx1(cPerg,"01","Data  De ?","."     ,"."       ,"mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Data  Até ?","."     ,"."       ,"mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")

	//Retirado Sangelles 22/03/2022 ->dbSelectArea(_sAlias)

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
	cQryAux += "SELECT M.SIT, "		+ STR_PULA
	cQryAux += "       M.FILIAL, "		+ STR_PULA
	cQryAux += "       M.CHAVE, "		+ STR_PULA
	cQryAux += "       M.SERIE, "		+ STR_PULA
	cQryAux += "       M.NUMERO, "		+ STR_PULA
	cQryAux += "       M.VALOR, "		+ STR_PULA
	cQryAux += "       M.STATUS, "		+ STR_PULA
	cQryAux += "       M.CNPJ                            CNPJ, "		+ STR_PULA
	cQryAux += "       M.EMITENTE, "		+ STR_PULA
	cQryAux += "       M.ANO, "		+ STR_PULA
	cQryAux += "       TO_DATE(TRIM(M.DATA), 'YYYYMMDD') DATA, "		+ STR_PULA
	cQryAux += "       M.MES "		+ STR_PULA
	cQryAux += "FROM   (SELECT 'OK'       SIT, "		+ STR_PULA
	cQryAux += "               C00_FILIAL FILIAL, "		+ STR_PULA
	cQryAux += "               C00_CHVNFE CHAVE, "		+ STR_PULA
	cQryAux += "               C00_SERNFE SERIE, "		+ STR_PULA
	cQryAux += "               C00_NUMNFE NUMERO, "		+ STR_PULA
	cQryAux += "               C00_VLDOC  VALOR, "		+ STR_PULA
	cQryAux += "               ( CASE C00_SITDOC "		+ STR_PULA
	cQryAux += "                   WHEN '1' THEN 'NFE-AUTORIZADA' "		+ STR_PULA
	cQryAux += "                   WHEN '3' THEN 'NFE-CANCELADA' "		+ STR_PULA
	cQryAux += "                 END )    STATUS, "		+ STR_PULA
	cQryAux += "               C00_CNPJEM CNPJ, "		+ STR_PULA
	cQryAux += "               C00_NOEMIT EMITENTE, "		+ STR_PULA
	cQryAux += "               C00_ANONFE ANO, "		+ STR_PULA
	cQryAux += "               C00_DTEMI  DATA, "		+ STR_PULA
	cQryAux += "               C00_MESNFE MES "		+ STR_PULA
	cQryAux += "        FROM   SF3010 "		+ STR_PULA
	cQryAux += "               INNER JOIN C00010 "		+ STR_PULA
	cQryAux += "                       ON F3_CHVNFE = C00_CHVNFE "		+ STR_PULA
	cQryAux += "                          AND F3_FILIAL = C00_FILIAL "		+ STR_PULA
	cQryAux += "        UNION ALL "		+ STR_PULA
	cQryAux += "        SELECT 'PROTHEUS'                     SIT, "		+ STR_PULA
	cQryAux += "               F3_FILIAL                      FILIAL, "		+ STR_PULA
	cQryAux += "               F3_CHVNFE                      CHAVE, "		+ STR_PULA
	cQryAux += "               F3_SERIE                       SERIE, "		+ STR_PULA
	cQryAux += "               F3_NFISCAL                     NUMERO, "		+ STR_PULA
	cQryAux += "               F3_VALCONT                     VALOR, "		+ STR_PULA
	cQryAux += "               (SELECT C00_FILIAL "		+ STR_PULA
	cQryAux += "                       ||' ' "		+ STR_PULA
	cQryAux += "                       ||'/' "		+ STR_PULA
	cQryAux += "                       ||' ' "		+ STR_PULA
	cQryAux += "                       || ( CASE C00_SITDOC "		+ STR_PULA
	cQryAux += "                              WHEN '1' THEN 'NFE-AUTORIZADA' "		+ STR_PULA
	cQryAux += "                              WHEN '3' THEN 'NFE-CANCELADA NA ORIGEM' "		+ STR_PULA
	cQryAux += "                            END ) "		+ STR_PULA
	cQryAux += "                FROM   C00010 "		+ STR_PULA
	cQryAux += "                WHERE  C00010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                       AND F3_CHVNFE = C00_CHVNFE) "		+ STR_PULA
	cQryAux += "               ||F3_OBSERV                    STATUS, "		+ STR_PULA
	cQryAux += "               ( CASE SUBSTR(F3_CLIEFOR, 1, 1) "		+ STR_PULA
	cQryAux += "                   WHEN 'C' THEN A1_CGC "		+ STR_PULA
	cQryAux += "                   WHEN 'P' THEN A2_CGC "		+ STR_PULA
	cQryAux += "                   WHEN 'T' THEN A2_CGC "		+ STR_PULA
	cQryAux += "                   WHEN 'F' THEN A2_CGC "		+ STR_PULA
	cQryAux += "                 END )                        CNPJ, "		+ STR_PULA
	cQryAux += "               ( CASE SUBSTR(F3_CLIEFOR, 1, 1) "		+ STR_PULA
	cQryAux += "                   WHEN 'C' THEN A1_NOME "		+ STR_PULA
	cQryAux += "                   WHEN 'P' THEN A2_NOME "		+ STR_PULA
	cQryAux += "                   WHEN 'T' THEN A2_NOME "		+ STR_PULA
	cQryAux += "                   WHEN 'F' THEN A2_NOME "		+ STR_PULA
	cQryAux += "                 END )                        EMITENTE, "		+ STR_PULA
	cQryAux += "               SUBSTR(TRIM(F3_EMISSAO), 1, 4) ANO, "		+ STR_PULA
	cQryAux += "               F3_EMISSAO                     DATA, "		+ STR_PULA
	cQryAux += "               SUBSTR(TRIM(F3_EMISSAO), 5, 2) MES "		+ STR_PULA
	cQryAux += "        FROM   SF3010 "		+ STR_PULA
	cQryAux += "               LEFT JOIN SA2010 "		+ STR_PULA
	cQryAux += "                      ON A2_COD = F3_CLIEFOR "		+ STR_PULA
	cQryAux += "                         AND A2_LOJA = F3_LOJA "		+ STR_PULA
	cQryAux += "                         AND SA2010.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQryAux += "               LEFT JOIN SA1010 "		+ STR_PULA
	cQryAux += "                      ON A1_COD = F3_CLIEFOR "		+ STR_PULA
	cQryAux += "                         AND A1_LOJA = F3_LOJA "		+ STR_PULA
	cQryAux += "                         AND SA1010.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQryAux += "        WHERE  F3_ESPECIE = 'SPED' "		+ STR_PULA
	cQryAux += "               AND F3_CFO <= '4999' "		+ STR_PULA
	cQryAux += "               AND F3_FORMUL <> 'S' "		+ STR_PULA
	cQryAux += "               AND SF3010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "               AND F3_EMISSAO >= '20180601' "		+ STR_PULA
	cQryAux += "               AND F3_NFISCAL = '000151186' "		+ STR_PULA
	cQryAux += "               AND F3_FILIAL "		+ STR_PULA
	cQryAux += "                   ||F3_CHVNFE NOT IN (SELECT C00_FILIAL "		+ STR_PULA
	cQryAux += "                                              ||C00_CHVNFE "		+ STR_PULA
	cQryAux += "                                       FROM   C00010) "		+ STR_PULA
	cQryAux += "        UNION ALL "		+ STR_PULA
	cQryAux += "        SELECT 'NFESEFAZ' SIT, "		+ STR_PULA
	cQryAux += "               C00_FILIAL FILIAL, "		+ STR_PULA
	cQryAux += "               C00_CHVNFE CHAVE, "		+ STR_PULA
	cQryAux += "               C00_SERNFE SERIE, "		+ STR_PULA
	cQryAux += "               C00_NUMNFE NUMERO, "		+ STR_PULA
	cQryAux += "               C00_VLDOC  VALOR, "		+ STR_PULA
	cQryAux += "               ( CASE C00_SITDOC "		+ STR_PULA
	cQryAux += "                   WHEN '1' THEN 'NFE-AUTORIZADA' "		+ STR_PULA
	cQryAux += "                   WHEN '3' THEN 'NFE-CANCELADA' "		+ STR_PULA
	cQryAux += "                 END )    STATUS, "		+ STR_PULA
	cQryAux += "               C00_CNPJEM CNPJ, "		+ STR_PULA
	cQryAux += "               C00_NOEMIT EMITENTE, "		+ STR_PULA
	cQryAux += "               C00_ANONFE ANO, "		+ STR_PULA
	cQryAux += "               C00_DTEMI  DATA, "		+ STR_PULA
	cQryAux += "               C00_MESNFE MES "		+ STR_PULA
	cQryAux += "        FROM   C00010 "		+ STR_PULA
	cQryAux += "        WHERE  C00_FILIAL "		+ STR_PULA
	cQryAux += "               ||C00_CHVNFE NOT IN (SELECT F3_FILIAL "		+ STR_PULA
	cQryAux += "                                           ||F3_CHVNFE "		+ STR_PULA
	cQryAux += "                                    FROM   SF3010))M "		+ STR_PULA
	cQryAux += "	    WHERE M.DATA BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	
	MemoWrite("C:\teste\RELCOMPI_V1.sql",cQryAux) //10/04/19
	
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
