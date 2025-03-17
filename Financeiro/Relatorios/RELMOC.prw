//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELMOC
Relatório - Relatorio Contas a Pagar Mococ
@author TREPORT
@since 15/06/2018
@version 1.0
	@example
	u_RELMOC()
	@obs Função gerada pelo TREPORT()
/*/
	
User Function RELMOC()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	
	//Definições da pergunta
	cPerg := "RELMOC"
	
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
	oReport := TReport():New(	"RELMOC",;		//Nome do Relatório
								"Rel Contas a Pagar Mococa",;		//Título
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
	TRCell():New(oSectDad, "COD_NOME", "QRY_AUX", "Codigo - Nome", /*Picture*/, 50, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PRF_NUM_PAR", "QRY_AUX", "Prf-Numero-Parcela", /*Picture*/, , /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPO", "QRY_AUX", "Tipo", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NATUREZA", "QRY_AUX", "Natureza", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DESCNATUREZA", "QRY_AUX", "Descnatureza", /*Picture*/, 30, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PORTADO", "QRY_AUX", "Portador", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "EMISSAO", "QRY_AUX", "Data de Emissão", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENCIMENTO", "QRY_AUX", "Data de Vencto", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENCI_REAL", "QRY_AUX", "Vencto Real", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DATA_DIA", "QRY_AUX", "Data do Dia", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MOEDA", "QRY_AUX", "Moeda", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR_ORIG", "QRY_AUX", "Valor Original", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "SALDO_ABERTO", "QRY_AUX", "Saldo em Aberto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR_RS", "QRY_AUX", "Valor em R$", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DIAS_ATRASO", "QRY_AUX", "Dias Atraso", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "HISTORICO", "QRY_AUX", "Historico(Vencidos+vencer)", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
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
	//Retirado Sangelles 22/03/2022 ->
	//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
	cPerg 	:=	PADR(cPerg,10)
	
	U_xPutSx1(cPerg,"01","Emissão de ?","."     ,"."       ,"mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Emissão Até ?","."     ,"."       ,"mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"03","Vencimento de ?","","","mv_CH3","D",08,0,0,"G","","","","","MV_PAR03","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"04","Vencimento Até ?","","","mv_CH4","D",08,0,0,"G","","","","","MV_PAR04","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"05","Fornecedor De ?","","","mv_CH5","C",06,0,0,"G","","SA2","","","MV_PAR05","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"06","Fornecedor Até ?","","","mv_CH6","C",06,0,0,"G","","SA2","","","MV_PAR06","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"07","Loja De ?","","","mv_CH7","C",02,0,0,"G","","","","","MV_PAR07","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"08","Loja Até ?","","","mv_CH8","C",02,0,0,"G","","","","","MV_PAR08","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"09","CNPJ De ?","","","mv_CH9","C",14,0,0,"G","","","","","MV_PAR09","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"10","CNPJ Até ?","","","mv_CHA","C",14,0,0,"G","","","","","MV_PAR10","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"11","Imprimir Portadores ?","","","mv_CHB","C",40,0,0,"G","","","","","MV_PAR11","","","","","","","","","","","","","","","","")	
	U_xPutSx1(cPerg,"12","Não Imprimir Portadores ?","","","mv_CHC","C",40,0,0,"G","","","","","MV_PAR12","","","","","","","","","","","","","","","","")	
		

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
	cQryAux += "SELECT E2_FILIAL FILIAL, "		+ STR_PULA
	cQryAux += "TRIM(E2_FORNECE)||'-'||E2_LOJA||'-'||TRIM(A2_NOME) COD_NOME,"		+ STR_PULA
	cQryAux += "E2_PREFIXO||'-'||E2_NUM||'-'||DECODE(E2_PARCELA,' ', '001') PRF_NUM_PAR,"		+ STR_PULA
	cQryAux += "E2_TIPO TIPO,"		+ STR_PULA
	cQryAux += "E2_NATUREZ NATUREZA,"		+ STR_PULA
	cQryAux += "ED_DESCRIC DESCNATUREZA,"		+ STR_PULA
	cQryAux += "E2_PORTADO PORTADO, "		+ STR_PULA
	cQryAux += "TO_DATE(TRIM(E2_EMISSAO),'YYYYMMDD') EMISSAO,"		+ STR_PULA
	cQryAux += "TO_DATE(TRIM(E2_VENCTO),'YYYYMMDD') VENCIMENTO,"		+ STR_PULA
	cQryAux += "TO_DATE(TRIM(E2_VENCREA),'YYYYMMDD') VENCI_REAL,"		+ STR_PULA
	cQryAux += "TRUNC(SYSDATE) DATA_DIA,"		+ STR_PULA
	cQryAux += "CASE"		+ STR_PULA
	cQryAux += "WHEN E2_MOEDA = '1' THEN 'BRL'"		+ STR_PULA
	cQryAux += "WHEN E2_MOEDA = '2' THEN 'USD'"		+ STR_PULA
	cQryAux += "END MOEDA,"		+ STR_PULA
	cQryAux += "E2_VALOR VALOR_ORIG,"		+ STR_PULA
	cQryAux += "E2_SALDO SALDO_ABERTO,"		+ STR_PULA
	cQryAux += "E2_VLCRUZ VALOR_RS,"		+ STR_PULA
	cQryAux += "(TRUNC(SYSDATE) - TO_DATE(TRIM(E2_VENCREA),'YYYYMMDD')) DIAS_ATRASO,"		+ STR_PULA
	cQryAux += "E2_HIST HISTORICO"		+ STR_PULA
	cQryAux += "FROM SE2010"		+ STR_PULA
	cQryAux += "LEFT JOIN SA2010"		+ STR_PULA
	cQryAux += "ON E2_FORNECE = A2_COD "		+ STR_PULA
	cQryAux += "AND E2_LOJA = A2_LOJA"		+ STR_PULA
	cQryAux += "AND SA2010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux += "LEFT JOIN SED010"		+ STR_PULA
	cQryAux += "ON ED_CODIGO = E2_NATUREZ"		+ STR_PULA
	cQryAux += "AND SED010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux += "WHERE SE2010.D_E_L_E_T_ =' '"		+ STR_PULA
	cQryAux += "AND E2_EMISSAO BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	cQryAux += "AND E2_VENCTO BETWEEN '" + DTOS(MV_PAR03) +"' AND '"+ DTOS(MV_PAR04) +"' 	" + STR_PULA 
	cQryAux += "AND E2_FORNECE BETWEEN '" + MV_PAR05 +"' AND '"+ MV_PAR06 +"' 	" 		+ STR_PULA
	cQryAux += "AND E2_LOJA   BETWEEN '" + MV_PAR07 +"' AND '"+ MV_PAR08 +"' 	" + STR_PULA
	cQryAux += "AND E2_SALDO <> 0"		+ STR_PULA
	cQryAux += "AND A2_CGC   BETWEEN '" + MV_PAR09 +"' AND '"+ MV_PAR10 +"' 	" + STR_PULA
	If !Empty(MV_PAR11) // Deseja imprimir apenas os Portadores parametro 11
				cQryAux  += " 		AND E2_PORTADO IN "+FormatIn(MV_PAR11,";") + STR_PULA 
		ElseIf !Empty(MV_PAR12) // Deseja excluir os Portadoresa parametro 12
				cQryAux  += " 		AND E2_PORTADO NOT IN "+FormatIn(MV_PAR12,";") + STR_PULA 
	EndIf
	
	
	MemoWrite("C:\teste\RELMOC_V3.sql",cQryAux) //22/09/2022
	 
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
