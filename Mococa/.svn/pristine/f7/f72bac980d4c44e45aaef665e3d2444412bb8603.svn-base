//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELPLBC
Relatório - Pedidos Lib.e com Bloq. de Cre
@author TREPORT
@since 21/06/2018
@version 1.0
	@example
	u_RELPLBC()
	@obs Função gerada pelo TREPORT()
/*/
	
User Function RELPLBC()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
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
	oReport := TReport():New(	"RELPLBC",;		//Nome do Relatório
								"Pedidos Lib c/ Bloq Cred",;		//Título
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
	TRCell():New(oSectDad, "FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NUMERO", "QRY_AUX", "Numero", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PEDIDO_SGAC", "QRY_AUX", "Pedido_SGAC", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CODIGO", "QRY_AUX", "Codigo", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LOJA", "QRY_AUX", "Loja", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOME", "QRY_AUX", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ESTADO", "QRY_AUX", "Estado", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR", "QRY_AUX", "Valor", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FIL_ESTOQUE", "QRY_AUX", "Fil_Estoque", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CARGA", "QRY_AUX", "Carga", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "EMISSAO", "QRY_AUX", "Emissao", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTENTREGA", "QRY_AUX", "Dtentrega", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CREDITO", "QRY_AUX", "Credito", /*Picture*/, 31, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ESTOQUE", "QRY_AUX", "Estoque", /*Picture*/, 26, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CNPJ_CPF", "QRY_AUX", "Cnpj/Cpf", "@R 99.999.999/9999-99", 14, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)

Return oReport
	
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
	cQryAux += "SELECT DISTINCT "		+ STR_PULA
	cQryAux += "       C5_FILIAL FILIAL,"		+ STR_PULA
	cQryAux += "       C5_NUM NUMERO,"		+ STR_PULA
	cQryAux += "       C5_XPVSGAC PEDIDO_SGAC ,"		+ STR_PULA
	cQryAux += "       A1_COD CODIGO,                    "		+ STR_PULA
	cQryAux += "       A1_LOJA LOJA,"		+ STR_PULA
	cQryAux += "       A1_NOME NOME,"		+ STR_PULA
	cQryAux += "       A1_EST ESTADO,"		+ STR_PULA
	cQryAux += "       SUM(C6_VALOR) VALOR,"		+ STR_PULA
	cQryAux += "       C5_XFILEST FIL_ESTOQUE,"		+ STR_PULA
	cQryAux += "       C9_CARGA CARGA,"		+ STR_PULA
	cQryAux += "       TO_DATE(C5_EMISSAO,'YYYYMMDD') AS EMISSAO,"		+ STR_PULA
	cQryAux += "       TO_DATE(TRIM(C6_ENTREG),'YYYYMMDD') DTENTREGA,"		+ STR_PULA
	cQryAux += "       CASE   C9_BLCRED          WHEN '10'  THEN 'FATURADO'"		+ STR_PULA
	cQryAux += "                                 WHEN '05'  THEN 'BLOQUEIO MANUAL/ESTORNO'"		+ STR_PULA
	cQryAux += "                                 WHEN '04'  THEN 'DATA DE CRÉDITO VENCIDA'"		+ STR_PULA
	cQryAux += "                                 WHEN '01'  THEN 'BLOQUEIO DE CRÉDITO POR VALOR'"		+ STR_PULA
	cQryAux += "                                 WHEN '  '  THEN 'LIBERADO'"		+ STR_PULA
	cQryAux += "                                 WHEN '02'  THEN 'POR ESTOQUE – MV_BLQCRED = T'"		+ STR_PULA
	cQryAux += "                                 WHEN '05'  THEN 'BLOQUEIO DE CREDITO POR ESTORNO'"		+ STR_PULA
	cQryAux += "                                 WHEN '06'  THEN 'BLOQUEIO DE CREDITO POR RISCO'"		+ STR_PULA
	cQryAux += "                                 WHEN '09'  THEN 'REJEICAO DE CREDITO'"		+ STR_PULA
	cQryAux += "                    END AS  CREDITO,"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "           CASE C9_BLEST WHEN '   ' THEN 'LIBERADO'"		+ STR_PULA
	cQryAux += "              WHEN '02'  THEN 'BLOQUEIO DE ESTOQUE'"		+ STR_PULA
	cQryAux += "              WHEN '03'  THEN 'BLOQUEIO MANUAL DE ESTOQUE'"		+ STR_PULA
	cQryAux += "              WHEN '10'  THEN 'FATURADO'"		+ STR_PULA
	cQryAux += "              "		+ STR_PULA
	cQryAux += "              END AS ESTOQUE,"		+ STR_PULA
	cQryAux += "              A1_CGC CNPJ_CPF"		+ STR_PULA
	cQryAux += "              "		+ STR_PULA
	cQryAux += "FROM SC6010"		+ STR_PULA
	cQryAux += "LEFT JOIN SC9010"		+ STR_PULA
	cQryAux += "ON SC9010.D_E_L_E_T_ <> '*'"		+ STR_PULA
	cQryAux += "AND C9_PEDIDO  = C6_NUM"		+ STR_PULA
	cQryAux += "AND C6_FILIAL  = C9_FILIAL"		+ STR_PULA
	cQryAux += "AND C6_PRODUTO = C9_PRODUTO"		+ STR_PULA
	cQryAux += "AND C6_ITEM    = C9_ITEM"		+ STR_PULA
	cQryAux += "AND C6_LOCAL   = C9_LOCAL"		+ STR_PULA
	cQryAux += "AND C6_NOTA    = C9_NFISCAL"		+ STR_PULA
	cQryAux += "LEFT JOIN SC5010 "		+ STR_PULA
	cQryAux += "ON SC5010.D_E_L_E_T_ <> '*'"		+ STR_PULA
	cQryAux += "AND C5_NUM    = C6_NUM"		+ STR_PULA
	cQryAux += "AND C5_FILIAL = C6_FILIAL"		+ STR_PULA
	cQryAux += "LEFT JOIN SB1010"		+ STR_PULA
	cQryAux += "ON  SB1010.D_E_L_E_T_ <> '*'"		+ STR_PULA
	cQryAux += "AND B1_COD = C6_PRODUTO"		+ STR_PULA
	cQryAux += "LEFT JOIN SA1010 "		+ STR_PULA
	cQryAux += "ON  SA1010.D_E_L_E_T_ <> '*'"		+ STR_PULA
	cQryAux += "AND A1_COD = C6_CLI"		+ STR_PULA
	cQryAux += "AND A1_LOJA = C6_LOJA"		+ STR_PULA
	cQryAux += "LEFT JOIN SF4010 "		+ STR_PULA
	cQryAux += "ON SF4010.D_E_L_E_T_ <> '*'"		+ STR_PULA
	cQryAux += "AND F4_CODIGO = C6_TES  "		+ STR_PULA
	cQryAux += "AND F4_FILIAL = C6_FILIAL"		+ STR_PULA
	cQryAux += "WHERE SC6010.D_E_L_E_T_ <> '*'"		+ STR_PULA
	cQryAux += "AND C9_NFISCAL = ' '"		+ STR_PULA
	cQryAux += "AND F4_DUPLIC = 'S'"		+ STR_PULA
	cQryAux += "AND A1_CGC NOT IN ( '52502507006269', '52502507006269', '52502507000309', "		+ STR_PULA
	cQryAux += "                           '52502507006854', "		+ STR_PULA
	cQryAux += "                           '52502507001208', '52502507006692', '52502507000813', "		+ STR_PULA
	cQryAux += "                               '26687598000122', "		+ STR_PULA
	cQryAux += "                           '52502507001895', '52502507001623', '52502507002271', "		+ STR_PULA
	cQryAux += "                               '52502507001976', "		+ STR_PULA
	cQryAux += "                           '52502507000147', '52502507001380', '26687598000203', "		+ STR_PULA
	cQryAux += "                               '26687598000475', "		+ STR_PULA
	cQryAux += "                           '26687598000394', '52502507000651' ) "		+ STR_PULA
	cQryAux += "AND C9_BLCRED <>'10'"		+ STR_PULA
	cQryAux += "GROUP BY "		+ STR_PULA
	cQryAux += "   C5_EMISSAO,"		+ STR_PULA
	cQryAux += "       C5_FILIAL,"		+ STR_PULA
	cQryAux += "       C5_NUM,"		+ STR_PULA
	cQryAux += "       C5_XPVSGAC,"		+ STR_PULA
	cQryAux += "       A1_COD,                    "		+ STR_PULA
	cQryAux += "       A1_LOJA,"		+ STR_PULA
	cQryAux += "       A1_NOME,"		+ STR_PULA
	cQryAux += "       A1_EST,"		+ STR_PULA
	cQryAux += "       C5_XFILEST,"		+ STR_PULA
	cQryAux += "       C9_CARGA,"		+ STR_PULA
	cQryAux += "       C6_ENTREG,"		+ STR_PULA
	cQryAux += "       C9_BLCRED, "		+ STR_PULA
	cQryAux += "       C9_BLEST,"		+ STR_PULA
	cQryAux += "       A1_CGC"		+ STR_PULA
	
	MemoWrite("C:\teste\RELPBC_V1_2.sql",cQryAux) //10/04/19
	
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
