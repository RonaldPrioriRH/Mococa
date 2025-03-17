//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELCREME
Relatório - Conferencia de Creme          
@author TReport
@since 12/03/2019
@version 1.0
	@example
	u_RELCREME()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELCREME()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELCREME  "
	
	ValPer01()
	
	//Se a pergunta não existir, zera a variável
	//Retirado Sangelles 22/03/2022 ->DbSelectArea("SX1")
	//Retirado Sangelles 22/03/2022 ->SX1->(DbSetOrder(1)) //X1_GRUPO + X1_ORDEM
	//Retirado Sangelles 22/03/2022 ->If ! SX1->(DbSeek(cPerg))
	cPulaLinha	:= chr(13)+chr(10)
	cQry			:= ""
	// verifico se nao existe este alias criado
	If Select("TMP") > 0
		TMP->(DbCloseArea())
	EndIf
	cQry := " SELECT * FROM " 				  + cPulaLinha
	cQry += " " + RetSqlName("SX1") + " SX1 " + cPulaLinha
	cQry += " WHERE " 						  + cPulaLinha
	cQry += " SX1.D_E_L_E_T_	<> '*' " 	  + cPulaLinha
	cQry += " AND X1_FILIAL = '" + xFilial("SX1") 	+ "' " + cPulaLinha
	cQry += " AND X1_GRUPO = '" +cPerg+ "' "	+ cPulaLinha
	TcQuery cQry New Alias "TMP" // Cria uma nova area com o resultado do query   

	if empty(TMP->X1_GRUPO)
		cPerg := Nil
	 endif 
	//Retirado Sangelles 22/03/2022 ->EndIf
	
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
	oReport := TReport():New(	"RELCREME",;		//Nome do Relatório
								"Conferência de Creme",;		//Título
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
	TRCell():New(oSectDad, "RECNODEL", "QRY_AUX", "Recnodel", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "RECNOUP", "QRY_AUX", "Recnoup", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NUMSEQA", "QRY_AUX", "Numseqa", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NUMSEQB", "QRY_AUX", "Numseqb", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QUANTB", "QRY_AUX", "Quantb", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QUANTA", "QRY_AUX", "Quanta", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QTUP", "QRY_AUX", "Qtup", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DOP_A", "QRY_AUX", "Dop_a", /*Picture*/, 14, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
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
	U_xPutSx1(cPerg,"03","Da Filial ?","","","mv_CH3","C",04,0,0,"G","","SM0","","","MV_PAR03","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"04","Até a Filial ?","","","mv_CH4","C",04,0,0,"G","","SM0","","","MV_PAR04","","","","","","","","","","","","","","","","")	

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
	cQryAux += "SELECT D.R_E_C_N_O_A AS RECNODEL, "		+ STR_PULA
	cQryAux += "D.RECNO_MAX AS RECNOUP, "		+ STR_PULA
	cQryAux += "D.NUMSEQ_A AS NUMSEQA, "		+ STR_PULA
	cQryAux += "D.NUMSEQ_B AS NUMSEQB, "		+ STR_PULA
	cQryAux += "D.DQUANT_B AS QUANTB, "		+ STR_PULA
	cQryAux += "D.DQUANT_A AS QUANTA, "		+ STR_PULA
	cQryAux += "D.DQUANT_B - D.DQUANT_A AS QTUP,"		+ STR_PULA
	cQryAux += "D.DOP_A "		+ STR_PULA
	cQryAux += "FROM (SELECT A.D3_COD "		+ STR_PULA
	cQryAux += "DCODA_A, "		+ STR_PULA
	cQryAux += "A.D3_NUMSEQ "		+ STR_PULA
	cQryAux += "NUMSEQ_A, "		+ STR_PULA
	cQryAux += "B.D3_NUMSEQ "		+ STR_PULA
	cQryAux += "NUMSEQ_B, "		+ STR_PULA
	cQryAux += "B.D3_COD "		+ STR_PULA
	cQryAux += "DCODA_B, "		+ STR_PULA
	cQryAux += "A.D3_QUANT "		+ STR_PULA
	cQryAux += "DQUANT_A, "		+ STR_PULA
	cQryAux += "B.D3_QUANT "		+ STR_PULA
	cQryAux += "DQUANT_B, "		+ STR_PULA
	cQryAux += "A.D3_OP "		+ STR_PULA
	cQryAux += "DOP_A, "		+ STR_PULA
	cQryAux += "B.D3_OP "		+ STR_PULA
	cQryAux += "DOP_B, "		+ STR_PULA
	cQryAux += "A.D3_EMISSAO "		+ STR_PULA
	cQryAux += "DEMIS_A, "		+ STR_PULA
	cQryAux += "B.D3_EMISSAO "		+ STR_PULA
	cQryAux += "DEMIS_B, "		+ STR_PULA
	cQryAux += "A.D3_CF "		+ STR_PULA
	cQryAux += "DCF_A, "		+ STR_PULA
	cQryAux += "B.D3_CF "		+ STR_PULA
	cQryAux += "DCF_B, "		+ STR_PULA
	cQryAux += "A.R_E_C_N_O_ "		+ STR_PULA
	cQryAux += "R_E_C_N_O_A, "		+ STR_PULA
	cQryAux += "B.R_E_C_N_O_ "		+ STR_PULA
	cQryAux += "R_E_C_N_O_B, "		+ STR_PULA
	cQryAux += "(SELECT MAX(B1.R_E_C_N_O_) "		+ STR_PULA
	cQryAux += "FROM SD3010 B1 "		+ STR_PULA
	cQryAux += "WHERE B1.D3_FILIAL = A.D3_FILIAL "		+ STR_PULA
	cQryAux += "AND B1.D3_COD = A.D3_COD "		+ STR_PULA
	cQryAux += "AND B1.D3_OP = A.D3_OP "		+ STR_PULA
	cQryAux += "AND B1.D3_EMISSAO = A.D3_EMISSAO "		+ STR_PULA
	cQryAux += "AND B1.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "AND B1.D3_ESTORNO <> 'S' "		+ STR_PULA
	cQryAux += "AND B1.D3_TM IN ( '499' ) "		+ STR_PULA
	cQryAux += "AND B1.D3_QUANT = (SELECT MAX(B1.D3_QUANT) "		+ STR_PULA
	cQryAux += "FROM SD3010 B1 "		+ STR_PULA
	cQryAux += "WHERE B1.D3_FILIAL = A.D3_FILIAL "		+ STR_PULA
	cQryAux += "AND B1.D3_COD = A.D3_COD "		+ STR_PULA
	cQryAux += "AND B1.D3_OP = A.D3_OP "		+ STR_PULA
	cQryAux += "AND B1.D3_EMISSAO = "		+ STR_PULA
	cQryAux += "A.D3_EMISSAO "		+ STR_PULA
	cQryAux += "AND B1.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "AND B1.D3_ESTORNO <> 'S' "		+ STR_PULA
	cQryAux += "AND B1.D3_TM IN ( '499' ))) AS "		+ STR_PULA
	cQryAux += "RECNO_MAX, "		+ STR_PULA
	cQryAux += "(SELECT MAX(B1.D3_QUANT) "		+ STR_PULA
	cQryAux += "FROM SD3010 B1 "		+ STR_PULA
	cQryAux += "WHERE B1.D3_FILIAL = A.D3_FILIAL "		+ STR_PULA
	cQryAux += "AND B1.D3_COD = A.D3_COD "		+ STR_PULA
	cQryAux += "AND B1.D3_OP = A.D3_OP "		+ STR_PULA
	cQryAux += "AND B1.D3_EMISSAO = A.D3_EMISSAO "		+ STR_PULA
	cQryAux += "AND B1.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "AND B1.D3_ESTORNO <> 'S' "		+ STR_PULA
	cQryAux += "AND B1.D3_TM IN ( '499' )) AS "		+ STR_PULA
	cQryAux += "DQUANT_MAX, "		+ STR_PULA
	cQryAux += "(SELECT COUNT(*) "		+ STR_PULA
	cQryAux += "FROM SD3010 B1 "		+ STR_PULA
	cQryAux += "WHERE B1.D3_FILIAL = A.D3_FILIAL "		+ STR_PULA
	cQryAux += "AND B1.D3_COD = A.D3_COD "		+ STR_PULA
	cQryAux += "AND B1.D3_OP = A.D3_OP "		+ STR_PULA
	cQryAux += "AND B1.D3_EMISSAO = A.D3_EMISSAO "		+ STR_PULA
	cQryAux += "AND B1.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "AND B1.D3_ESTORNO <> 'S' "		+ STR_PULA
	cQryAux += "AND B1.D3_TM IN ( '499' )) AS "		+ STR_PULA
	cQryAux += "QTREG "		+ STR_PULA
	cQryAux += "FROM SD3010 A "		+ STR_PULA
	cQryAux += "INNER JOIN SD3010 B "		+ STR_PULA
	cQryAux += "ON B.D3_FILIAL = A.D3_FILIAL "		+ STR_PULA
	cQryAux += "AND B.D3_COD = A.D3_COD "		+ STR_PULA
	cQryAux += "AND B.D3_OP = A.D3_OP "		+ STR_PULA
	cQryAux += "AND B.D3_EMISSAO = A.D3_EMISSAO "		+ STR_PULA
	cQryAux += "AND B.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "AND B.D3_ESTORNO <> 'S' "		+ STR_PULA
	cQryAux += "AND B.D3_TM IN ( '499' ) "		+ STR_PULA
	cQryAux += "WHERE A.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "AND A.D3_ESTORNO <> 'S' "		+ STR_PULA
	//cQryAux += "AND A.D3_EMISSAO BETWEEN '20190101'AND '20191201' "		+ STR_PULA
	cQryAux += "AND TO_DATE(TRIM(A.D3_EMISSAO), 'YYYYMMDD') BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	cQryAux += "AND A.D3_COD BETWEEN '14020002 ' AND '14020002 ' "		+ STR_PULA
	cQryAux += "AND A.D3_TM IN ( '504' ) "		+ STR_PULA
	cQryAux += "AND A.D3_FILIAL BETWEEN '" + MV_PAR03 +"' AND '"+ MV_PAR04 +"' 	" 
	cQryAux += "AND A.D3_OBSERVA = ' ' "		+ STR_PULA
	cQryAux += "AND B.D3_OBSERVA = ' ' "		+ STR_PULA
	cQryAux += "ORDER BY A.D3_FILIAL, "		+ STR_PULA
	cQryAux += "A.D3_COD, "		+ STR_PULA
	cQryAux += "A.D3_OP, "		+ STR_PULA
	cQryAux += "A.D3_NUMSEQ, "		+ STR_PULA
	cQryAux += "B.D3_NUMSEQ, "		+ STR_PULA
	cQryAux += "A.D3_EMISSAO) D "		+ STR_PULA
	cQryAux += "WHERE D.RECNO_MAX = D.R_E_C_N_O_B"		+ STR_PULA
	
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

