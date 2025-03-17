//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELPALET
Relatório - Relatório de Paletização      
@author TReport
@since 09/09/2019
@version 1.0
	@example
	u_RELPALET()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELPALET()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELPALET"
	
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
	//Local oFunTot1
	
	
	//Criação do componente de impressão
	oReport := TReport():New(	"RELPALET",;		//Nome do Relatório
								"Relatório de Paletização",;		//Título
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
									"Paletizacao",;		//Descrição da seção
									{"QRY_AUX"})		//Tabelas utilizadas, a primeira será considerada como principal da seção
	oSectDad:SetTotalInLine(.F.)  //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
	//Colunas do relatório
	TRCell():New(oSectDad, "PRODUTO", "QRY_AUX", "Produto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DESPROD", "QRY_AUX", "Desprod", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UM", "QRY_AUX", "Unidade", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "EMB", "QRY_AUX", "Emb", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "B1_PESO", "QRY_AUX", "Peso Liquido", "@E 999,999.9999", 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTINICIO", "QRY_AUX", "Dtinicio", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)	
	TRCell():New(oSectDad, "DTREPORTE", "QRY_AUX", "Dtreporte", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTVALIDADE", "QRY_AUX", "Dtvalidade", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ETIQUETA", "QRY_AUX", "Etiqueta", /*Picture*/, 30, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FICHA", "QRY_AUX", "Ficha", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PALETE", "QRY_AUX", "Palete", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ORDEM", "QRY_AUX", "OP", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CYV_XPRDO", "QRY_AUX", "Nr. Produção", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CYV_CDMQ", "QRY_AUX", "Máquina", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CYB_DSMQ", "QRY_AUX", "Desc Máquina", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	//TRCell():New(oSectDad, "CYB_X_LTMQ", "QRY_AUX", "Letra Maq.", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LOTE", "QRY_AUX", "Lote", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TANQUE", "QRY_AUX", "Tanque", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ARMAZEM", "QRY_AUX", "Armazem", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CYV_QTATRP", "QRY_AUX", "Qtd Report", "@E 999,999,999.999999", 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CYV_HRRPBG", "QRY_AUX", "Hora Início", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CYV_HRRPED", "QRY_AUX", "Hora Fim", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "RESPONSAVEL", "QRY_AUX", "Responsável", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "RA_NOMECMP", "QRY_AUX", "Nome Completo", /*Picture*/, 70, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "OBS", "QRY_AUX", "Obs", /*Picture*/, 200, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)

	//Totalizadores
	//oFunTot1 := TRFunction():New(oSectDad:Cell("CYV_QTATRP"),,"SUM",,,"@E 999,999,999.99999")
	//oFunTot1:SetEndReport(.T.)
	
	//Inibe a apresentação dos totalizadores no final da secao
	//oFunTot1:SetEndSection(.T.)
	
	

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
	
	U_xPutSx1(cPerg,"01","Data de Reporte De ?",".",".","mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Data de Reporte Até ?",".","."       ,"mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"03","Ordem Producao De ?","","","mv_CH3","C",11,0,0,"G","","SC2","","","MV_PAR03","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"04","Ordem Producao Até?","","","mv_CH4","C",11,0,0,"G","","SC2","","","MV_PAR04","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"05","Produto De?","."     ,"."       ,"mv_ch5","C",08,0,0,"G","","SB1","","","MV_PAR05","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"06","Produto Até?","."     ,"."       ,"mv_ch6","C",08,0,0,"G","","SB1","","","MV_PAR06","","","","","","","","","","","","","","","","")
    U_xPutSx1(cPerg,"07","Maquina de?			","."     ,"."       ,"mv_ch7","C",20,0,0,"G","","","","","MV_PAR07","","","","","","","","","","","","","","","","")
    U_xPutSx1(cPerg,"08","Maquina Até?			","."     ,"."       ,"mv_ch8","C",20,0,0,"G","","CYB002","","","MV_PAR08","","","","","","","","","","","","","","","","")
    U_xPutSx1(cPerg,"09","Producao De?			","."     ,"."       ,"mv_ch9","C",03,0,0,"G","","CYB002","","","MV_PAR09","","","","","","","","","","","","","","","","")
    U_xPutSx1(cPerg,"10","Producao Até?			","."     ,"."       ,"mv_chA","C",03,0,0,"G","","","","","MV_PAR10","","","","","","","","","","","","","","","","")
	
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
	//Local oFunTot1
	
	//Pegando as seções do relatório
	oSectDad := oReport:Section(1)
	
	//Montando consulta de dados
	cQryAux := ""
	cQryAux += "SELECT   TRIM(CYV_CDACRP) PRODUTO ,"		+ STR_PULA
	cQryAux += "         TRIM(B1_DESC) DESPROD,"		+ STR_PULA
	cQryAux += "         TRIM(B1_UM) UM, "		+ STR_PULA
	cQryAux += "         (CASE WHEN B1_UM ='UN' THEN 1 ELSE B1_CONV END) Emb,"		+ STR_PULA
	cQryAux += "         (B1_PESO) , "		+ STR_PULA
	cQryAux += "        TO_DATE(TRIM(CYV_DTRPBG),'YYYYMMDD') DTINICIO,"		+ STR_PULA
	cQryAux += "        TO_DATE(TRIM(CYV_DTRP),'YYYYMMDD') DTREPORTE,"		+ STR_PULA
	cQryAux += "        TO_DATE(TRIM(CYV_XDTVAL),'YYYYMMDD') DTVALIDADE,"		+ STR_PULA
	cQryAux += "         TRIM(CYV_CDACRP)||SUBSTR(CYV_DTRP,4,2)||TRIM(CYV_XPRDO)||TRIM(CYV_XLOTE)||TRIM(CYV_XTANQ)||TRIM((SELECT CYB_X_LTMQ FROM CYB010 WHERE CYB010.D_E_L_E_T_=' ' AND CYV_CDMQ = CYB_CDMQ))||CYV_XPALET ETIQUETA,"		+ STR_PULA
	cQryAux += "         CYV_XFICHA FICHA,"		+ STR_PULA
	cQryAux += "         CYV_XPALET PALETE,"		+ STR_PULA
	cQryAux += "         CYV_NRORPO ORDEM,"		+ STR_PULA
	cQryAux += "         CYV_XPRDO,"		+ STR_PULA
	cQryAux += "         CYV_CDMQ,"		+ STR_PULA
	cQryAux += "         CYB_DSMQ,"		+ STR_PULA
	//cQryAux += "         CYB_X_LTMQ,"		+ STR_PULA
	cQryAux += "         CYV_XLOTE LOTE,"		+ STR_PULA
	cQryAux += "         CYV_XTANQ TANQUE, "		+ STR_PULA
	cQryAux += "         CYV_CDDP ARMAZEM, "		+ STR_PULA
	cQryAux += "         CYV_QTATRP,"		+ STR_PULA
	cQryAux += "         CYV_HRRPBG,"		+ STR_PULA
	cQryAux += "         CYV_HRRPED,"		+ STR_PULA
	cQryAux += "         CYV_XRESP RESPONSAVEL,"		+ STR_PULA
	cQryAux += "         RA_NOMECMP,"		+ STR_PULA
	cQryAux += "         CYV_XOBS OBS"		+ STR_PULA
	cQryAux += "  FROM   CYV010"		+ STR_PULA
	cQryAux += "  "		+ STR_PULA
	cQryAux += " LEFT JOIN SB1010 ON SB1010.D_E_L_E_T_ =' '"		+ STR_PULA
	cQryAux += "                AND B1_COD = CYV_CDACRP"		+ STR_PULA
	cQryAux += "                "		+ STR_PULA
	cQryAux += "                "		+ STR_PULA
	cQryAux += " LEFT JOIN SB5010 ON SB5010.D_E_L_E_T_ =' '"		+ STR_PULA
	cQryAux += "                AND B5_COD = CYV_CDACRP"		+ STR_PULA
	cQryAux += "                "		+ STR_PULA
	cQryAux += " LEFT JOIN CYB010 ON CYB010.D_E_L_E_T_ =' '"		+ STR_PULA
	cQryAux += "                AND CYV_CDMQ = CYB_CDMQ"		+ STR_PULA
	cQryAux += "                      "		+ STR_PULA
	cQryAux += " LEFT JOIN SRA010 ON SRA010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux += "                 AND CYV_FILIAL = RA_FILIAL"		+ STR_PULA
	cQryAux += "                 AND TRIM(LPAD(CYV_XRESP,6,'0')) = RA_MAT"		+ STR_PULA
	cQryAux += "                      "		+ STR_PULA
	cQryAux += " WHERE   CYV010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	//cQryAux += " AND B1_UM IN ('BJ','CX','BG','UN')"		+ STR_PULA
	cQryAux += " AND B1_UM NOT IN ('UN')"		+ STR_PULA
	cQryAux += " AND B1_TIPO  IN ('PA','ME')"		+ STR_PULA
	//cQryAux += " AND CYV_XFICHA <> '  '"		+ STR_PULA
	cQryAux += " AND CYV_DTEO = ' '"		+ STR_PULA //Apenas OPs que não tem estorno 
	cQryAux += " AND CYV_DTRP BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	//cQryAux += " AND CYV_DTRP BETWEEN '20190101' AND '20491201'"		+ STR_PULA
	cQryAux += " AND CYV_NRORPO BETWEEN '" + MV_PAR03 +"' AND '"+ MV_PAR04 +"' 	" + STR_PULA
	cQryAux += " AND TRIM(CYV_CDMQ) BETWEEN '" + AllTrim(MV_PAR07) +"' AND '"+ AllTrim(MV_PAR08) +"' 	" + STR_PULA
	cQryAux += " AND CYV_CDACRP BETWEEN '" + MV_PAR05 +"' AND '"+ MV_PAR06 +"' 	" + STR_PULA
	cQryAux += " AND CYV_XPRDO  BETWEEN '" + MV_PAR09 +"' AND '"+ MV_PAR10 +"' 	" + STR_PULA
	
	
	MemoWrite("C:\teste\RELPALET_V8.sql",cQryAux) //09/11/2022
	
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
