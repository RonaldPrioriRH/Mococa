//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELRESOP
Relatório - Relatorio Ordens de Produção  
@author TReport
@since 06/05/2019
@version 1.0
	@example
	u_RELRESOP()
	@obs Função gerada pelo TReport()
/*/
//	
User Function RELRESOP()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELRESOP"
	
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
	oReport := TReport():New(	"RELRESOP",;		//Nome do Relatório
								"Relatorio Resumo OP",;		//Título
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
	TRCell():New(oSectDad, "ORD_PRODUCAO", "QRY_AUX", "Ord_producao", /*Picture*/, 14, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PRODUTO", "QRY_AUX", "Produto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DESC_PRODUTO", "QRY_AUX", "Desc_produto", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPO_PRODUTO", "QRY_AUX", "Tipo_produto", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UM_PRODUTO", "QRY_AUX", "Um_produto", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TM", "QRY_AUX", "TM", "@!", 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPO_RE_DE", "QRY_AUX", "Tipo_re_de", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COMPONENTE", "QRY_AUX", "Componente", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COD_WINTHOR", "QRY_AUX", "Cod_winthor", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DESC_COMPONENTE", "QRY_AUX", "Desc_componente", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPO_COMPONENTE", "QRY_AUX", "Tipo_componente", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPO_INSUMO", "QRY_AUX", "Tipo_insumo", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "SEQ", "QRY_AUX", "Seq", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PESO_LIQ", "QRY_AUX", "Peso_liq", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QUANT_KG", "QRY_AUX", "Quant_kg", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QUANTIDADE", "QRY_AUX", "Quantidade", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ARMAZEM", "QRY_AUX", "Armazem", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UM_COMPONENTE", "QRY_AUX", "Um_componente", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CUSTO", "QRY_AUX", "Custo", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CUSTO_STAND", "QRY_AUX", "Custo_stand", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DATA_OP", "QRY_AUX", "Data_op", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DATA_APONT", "QRY_AUX", "Data_apont", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MES", "QRY_AUX", "Data", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
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
	
	U_xPutSx1(cPerg,"01","Emissão de ?","."     ,"."       ,"mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Emissão Até ?","."     ,"."       ,"mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")

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
	cQryAux += "SELECT TRIM(SD.D3_FILIAL) FILIAL, "		+ STR_PULA
	cQryAux += "TRIM(SD.D3_OP) ORD_PRODUCAO, "		+ STR_PULA
	cQryAux += "TRIM(SC.C2_PRODUTO) PRODUTO, "		+ STR_PULA
	cQryAux += "(SELECT TRIM(B1_DESC) "		+ STR_PULA
	cQryAux += "FROM SB1010 "		+ STR_PULA
	cQryAux += "WHERE D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "AND SC.C2_PRODUTO = B1_COD) DESC_PRODUTO, "		+ STR_PULA
	cQryAux += "(SELECT TRIM(B1_TIPO) "		+ STR_PULA
	cQryAux += "FROM SB1010 "		+ STR_PULA
	cQryAux += "WHERE D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "AND SC.C2_PRODUTO = B1_COD) TIPO_PRODUTO, "		+ STR_PULA
	cQryAux += "SC.C2_UM UM_PRODUTO, "		+ STR_PULA
	cQryAux += "TRIM(SD.D3_TM) TM, "		+ STR_PULA
	cQryAux += "TRIM(SD.D3_CF) TIPO_RE_DE, "		+ STR_PULA
	cQryAux += "TRIM(SD.D3_COD) COMPONENTE, "		+ STR_PULA
	cQryAux += "TRIM(SB.B1_XWINTHO) COD_WINTHOR, "		+ STR_PULA
	cQryAux += "TRIM(SB.B1_DESC) DESC_COMPONENTE, "		+ STR_PULA
	cQryAux += "TRIM(SB.B1_TIPO) TIPO_COMPONENTE, "		+ STR_PULA
	cQryAux += "TRIM(SB.B1_XCLA) TIPO_INSUMO, "		+ STR_PULA
	cQryAux += "( CASE SB.B1_XCLA "		+ STR_PULA
	cQryAux += "WHEN 'MP' THEN '1' "		+ STR_PULA
	cQryAux += "WHEN 'EM' THEN '2' "		+ STR_PULA
	cQryAux += "WHEN 'EG' THEN '3' "		+ STR_PULA
	cQryAux += "WHEN 'VP' THEN '4' "		+ STR_PULA
	cQryAux += "WHEN 'MT' THEN '5' "		+ STR_PULA
	cQryAux += "WHEN 'QM' THEN '6' "		+ STR_PULA
	cQryAux += "WHEN 'DC' THEN '7' "		+ STR_PULA
	cQryAux += "WHEN 'GF' THEN '8' "		+ STR_PULA
	cQryAux += "WHEN 'MO' THEN '9'"		+ STR_PULA
	cQryAux += "ELSE '0' "		+ STR_PULA
	cQryAux += "END ) SEQ, "		+ STR_PULA
	cQryAux += "SB.B1_PESO PESO_LIQ, "		+ STR_PULA
	cQryAux += "( CASE SD.D3_CF "		+ STR_PULA
	cQryAux += "WHEN 'DE0' THEN ( ( SUM(SD.D3_QUANT) * -1 ) * SB.B1_PESO ) "		+ STR_PULA
	cQryAux += "WHEN 'DE1' THEN ( ( SUM(SD.D3_QUANT) * -1 ) * SB.B1_PESO ) "		+ STR_PULA
	cQryAux += "ELSE ( SUM(SD.D3_QUANT) * SB.B1_PESO ) "		+ STR_PULA
	cQryAux += "END ) QUANT_KG, "		+ STR_PULA
	cQryAux += "( CASE SD.D3_CF "		+ STR_PULA
	cQryAux += "WHEN 'DE0' THEN ( SUM(SD.D3_QUANT) * -1 ) "		+ STR_PULA
	cQryAux += "WHEN 'DE1' THEN ( SUM(SD.D3_QUANT) * -1 ) "		+ STR_PULA
	cQryAux += "ELSE SUM(SD.D3_QUANT) "		+ STR_PULA
	cQryAux += "END ) QUANTIDADE, "		+ STR_PULA
	cQryAux += "TRIM(SD.D3_LOCAL) ARMAZEM, "		+ STR_PULA
	cQryAux += "TRIM(SB.B1_UM) UM_COMPONENTE, "		+ STR_PULA
	cQryAux += "( CASE SD.D3_CF "		+ STR_PULA
	cQryAux += "WHEN 'DE0' THEN ( SUM(SD.D3_CUSTO1) * -1 ) "		+ STR_PULA
	cQryAux += "WHEN 'DE1' THEN ( SUM(SD.D3_CUSTO1) * -1 ) "		+ STR_PULA
	cQryAux += "ELSE SUM(SD.D3_CUSTO1) "		+ STR_PULA
	cQryAux += "END ) CUSTO, "		+ STR_PULA
	cQryAux += "SUM(SB.B1_CUSTD) CUSTO_STAND, "		+ STR_PULA
	cQryAux += "TO_DATE(TRIM(SC.C2_EMISSAO), 'YYYYMMDD') DATA_OP, "		+ STR_PULA
	cQryAux += "TO_DATE(TRIM(SD.D3_EMISSAO), 'YYYYMMDD') DATA_APONT, "		+ STR_PULA
	cQryAux += "TO_DATE(SUBSTR(TRIM(SD.D3_EMISSAO), 1, 4) "		+ STR_PULA
	cQryAux += "|| SUBSTR(SD.D3_EMISSAO, 5, 2) "		+ STR_PULA
	cQryAux += "|| '01', 'YYYYMMDD') MES "		+ STR_PULA
	cQryAux += "FROM SD3010 SD "		+ STR_PULA
	cQryAux += "INNER JOIN SB1010 SB "		+ STR_PULA
	cQryAux += "ON SD.D3_COD = SB.B1_COD "		+ STR_PULA
	cQryAux += "AND SB.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "INNER JOIN SC2010 SC "		+ STR_PULA
	cQryAux += "ON SD.D3_FILIAL = SC.C2_FILIAL "		+ STR_PULA
	cQryAux += "AND SD.D3_OP = SC.C2_NUM "		+ STR_PULA
	cQryAux += "|| SC.C2_ITEM "		+ STR_PULA
	cQryAux += "|| SC.C2_SEQUEN "		+ STR_PULA
	cQryAux += "AND SC.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "WHERE SD.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "AND SD.D3_FILIAL = '0102' "		+ STR_PULA
	cQryAux += "AND SD.D3_OP NOT LIKE '%OS%' "		+ STR_PULA
	cQryAux += "AND TO_DATE(TRIM(SD.D3_EMISSAO), 'YYYYMMDD') BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	cQryAux += "AND SD.D3_ESTORNO <> 'S' "		+ STR_PULA
	cQryAux += "GROUP BY SD.D3_FILIAL, "		+ STR_PULA
	cQryAux += "SD.D3_OP, "		+ STR_PULA
	cQryAux += "SC.C2_PRODUTO, "		+ STR_PULA
	cQryAux += "SC.C2_UM, "		+ STR_PULA
	cQryAux += "SD.D3_TM, "		+ STR_PULA
	cQryAux += "SD.D3_CF, "		+ STR_PULA
	cQryAux += "SD.D3_COD, "		+ STR_PULA
	cQryAux += "SB.B1_XWINTHO, "		+ STR_PULA
	cQryAux += "SB.B1_DESC, "		+ STR_PULA
	cQryAux += "SB.B1_TIPO, "		+ STR_PULA
	cQryAux += "SB.B1_XCLA, "		+ STR_PULA
	cQryAux += "SB.B1_PESO, "		+ STR_PULA
	cQryAux += "SD.D3_LOCAL, "		+ STR_PULA
	cQryAux += "SB.B1_UM, "		+ STR_PULA
	cQryAux += "SC.C2_EMISSAO, "		+ STR_PULA
	cQryAux += "SD.D3_EMISSAO "		+ STR_PULA
	cQryAux += "ORDER BY SD.D3_OP,"		+ STR_PULA
	cQryAux += "SC.C2_PRODUTO,"		+ STR_PULA
	cQryAux += "SEQ"		+ STR_PULA
	
	MemoWrite("C:\teste\RELRESOP_V2.sql",cQryAux) //03/06/2020
	
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
