//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELPISS
Relatório - Pis Confins Saida             
@author TReport
@since 10/09/2018
@version 1.0
	@example
	u_RELPISS()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELPISS()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELPISS"
	
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
	oReport := TReport():New(	"RELPISS",;		//Nome do Relatório
								"Pis Confins Saida",;		//Título
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
	TRCell():New(oSectDad, "D2_FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D2_DOC", "QRY_AUX", "Num. Docto.", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D2_EMISSAO", "QRY_AUX", "Emissao", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D2_DTDIGIT", "QRY_AUX", "Data Digit.", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CNPJCLIENTE", "QRY_AUX", "Cnpjcliente", /*Picture*/, 14, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D2_CLIENTE", "QRY_AUX", "Cliente", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A1_NOME", "QRY_AUX", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D2_TES", "QRY_AUX", "Tipo Saida", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D2_CF", "QRY_AUX", "Cod. Fiscal", /*Picture*/, 5, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "B1_POSIPI", "QRY_AUX", "Pos.IPI/NCM", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D2_COD", "QRY_AUX", "Produto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "B1_DESC", "QRY_AUX", "Descricao", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D2_QUANT", "QRY_AUX", "Quantidade", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TOTPROD", "QRY_AUX", "Totprod", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TOTNF", "QRY_AUX", "Totnf", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DESCONTO", "QRY_AUX", "Desconto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DESCSUFRAMA", "QRY_AUX", "Descsuframa", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TOTITEM", "QRY_AUX", "Totitem", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D2_VALICM", "QRY_AUX", "Vlr.ICMS", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D2_VALIPI", "QRY_AUX", "Vlr.IPI", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BASPIS", "QRY_AUX", "Baspis", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ALIQPIS", "QRY_AUX", "Aliqpis", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D2_VALIMP5", "QRY_AUX", "Valor Imp. 5", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BASCOF", "QRY_AUX", "Bascof", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D2_VALIMP6", "QRY_AUX", "Valor Imp. 6", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ALIQCOF", "QRY_AUX", "Aliqcof", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F4_CSTPIS", "QRY_AUX", "Sit.Trib.PIS", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F4_CSTCOF", "QRY_AUX", "Sit.Trib.COF", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F4_CODBCC", "QRY_AUX", "Cod.BC Cred.", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D2_CONTA", "QRY_AUX", "C Contabil", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F2_CHVNFE", "QRY_AUX", "Chave NFe", /*Picture*/, 44, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FT_OBSERV", "QRY_AUX", "Obs Liv. Fis", /*Picture*/, 31, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
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
	
	U_xPutSx1(cPerg,"01","Emissão de ?","","","mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Emissão Até ?","","","mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")	

	//Retirado Sangelles 22/03/2022 ->dbSelectArea(_sAlias)

Return()	
	
/*-------------------------------------------------------------------------------*
 | Func:  fRepPrint                                                              |
 | Desc:  Função que imprime o relatório                                         |
 *-------------------------------------------------------------------------------*/
	
	//Montando consulta de dados
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
	cQryAux += "SELECT D2_FILIAL, "		+ STR_PULA
	cQryAux += "       D2_DOC, "		+ STR_PULA
	cQryAux += "       D2_EMISSAO, "		+ STR_PULA
	cQryAux += "       D2_DTDIGIT, "		+ STR_PULA
	cQryAux += "       A1_CGC CNPJCLIENTE, "		+ STR_PULA
	cQryAux += "       D2_CLIENTE, "		+ STR_PULA
	cQryAux += "       A1_NOME,"		+ STR_PULA
	cQryAux += "       D2_TES, "		+ STR_PULA
	cQryAux += "       D2_CF, "		+ STR_PULA
	cQryAux += "       B1_POSIPI, "		+ STR_PULA
	cQryAux += "       D2_COD, "		+ STR_PULA
	cQryAux += "       B1_DESC,"		+ STR_PULA
	cQryAux += "       D2_QUANT, "		+ STR_PULA
	cQryAux += "       D2_TOTAL TOTPROD,"		+ STR_PULA
	cQryAux += "       ( D2_TOTAL + D2_ICMSRET + D2_VALIPI+D2_VALFRE+D2_SEGURO) "		+ STR_PULA
	cQryAux += "        AS TOTNF,"		+ STR_PULA
	cQryAux += "        D2_DESC DESCONTO,"		+ STR_PULA
	cQryAux += "       D2_DESCZFR DESCSUFRAMA,"		+ STR_PULA
	cQryAux += "       (D2_TOTAL + D2_DESCZFR) TOTITEM,"		+ STR_PULA
	cQryAux += "       D2_VALICM,"		+ STR_PULA
	cQryAux += "       D2_VALIPI, "		+ STR_PULA
	cQryAux += "       D2_BASIMP5 AS BASPIS, "		+ STR_PULA
	cQryAux += "       D2_ALQIMP5 ALIQPIS,"		+ STR_PULA
	cQryAux += "       D2_VALIMP5, "		+ STR_PULA
	cQryAux += "       D2_BASIMP6 AS BASCOF,"		+ STR_PULA
	cQryAux += "       D2_VALIMP6, "		+ STR_PULA
	cQryAux += "       D2_ALQIMP6 ALIQCOF,"		+ STR_PULA
	cQryAux += "       F4_CSTPIS, "		+ STR_PULA
	cQryAux += "       F4_CSTCOF, "		+ STR_PULA
	cQryAux += "       D2_VALIMP5, "		+ STR_PULA
	cQryAux += "       D2_VALIMP6, "		+ STR_PULA
	cQryAux += "       F4_CODBCC, "		+ STR_PULA
	cQryAux += "       D2_CONTA, "		+ STR_PULA
	cQryAux += "       F2_CHVNFE, "		+ STR_PULA
	cQryAux += "       FT_OBSERV"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "FROM   SD2010 "		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "       LEFT JOIN SA1010 "		+ STR_PULA
	cQryAux += "              ON D2_CLIENTE = A1_COD "		+ STR_PULA
	cQryAux += "                 AND D2_LOJA = A1_LOJA "		+ STR_PULA
	cQryAux += "                 AND SA1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "       LEFT JOIN SB1010 "		+ STR_PULA
	cQryAux += "              ON D2_COD = B1_COD "		+ STR_PULA
	cQryAux += "                 AND SB1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "       LEFT JOIN SF4010 "		+ STR_PULA
	cQryAux += "              ON D2_TES = F4_CODIGO "		+ STR_PULA
	cQryAux += "                 AND D2_FILIAL = F4_FILIAL "		+ STR_PULA
	cQryAux += "                 AND SF4010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "       INNER JOIN SF2010 "		+ STR_PULA
	cQryAux += "              ON  F2_FILIAL = D2_FILIAL "		+ STR_PULA
	cQryAux += "                 AND F2_DOC = D2_DOC "		+ STR_PULA
	cQryAux += "                 AND F2_SERIE = D2_SERIE "		+ STR_PULA
	cQryAux += "                 AND F2_CLIENTE = D2_CLIENTE"		+ STR_PULA
	cQryAux += "                 AND F2_LOJA  = D2_LOJA"		+ STR_PULA
	cQryAux += "                 AND SF2010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "   "		+ STR_PULA
	cQryAux += "        LEFT JOIN SFT010 "		+ STR_PULA
	cQryAux += "                  ON  SFT010.D_E_L_E_T_  = ' ' "		+ STR_PULA
	cQryAux += "                 AND D2_FILIAL  = FT_FILIAL "		+ STR_PULA
	cQryAux += "                 AND D2_DOC     = FT_NFISCAL"		+ STR_PULA
	cQryAux += "                 AND D2_SERIE   = FT_SERIE "		+ STR_PULA
	cQryAux += "                 AND D2_COD    = FT_PRODUTO"		+ STR_PULA
	cQryAux += "                 AND D2_CLIENTE = FT_CLIEFOR"		+ STR_PULA
	cQryAux += "                 AND D2_ITEM    = FT_ITEM"		+ STR_PULA
	cQryAux += "                 AND D2_LOJA    = FT_LOJA"		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "WHERE  SD2010.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQryAux += "       AND D2_FILIAL <> '  ' "		+ STR_PULA
	cQryAux += "       AND TO_DATE(TRIM(F2_EMISSAO), 'YYYYMMDD') BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	cQryAux += "ORDER BY D2_EMISSAO, D2_DOC, D2_COD"		+ STR_PULA
	
	MemoWrite("C:\teste\RELPISS_V5.sql",cQryAux) //V5 06/05/19
	
	cQryAux := ChangeQuery(cQryAux)
	
	//Executando consulta e setando o total da régua
	TCQuery cQryAux New Alias "QRY_AUX"
	Count to nTotal
	oReport:SetMeter(nTotal)
	TCSetField("QRY_AUX", "D2_EMISSAO", "D")
	TCSetField("QRY_AUX", "D2_DTDIGIT", "D")
	
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
