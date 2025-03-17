//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELHORAS
Relatório - Relatório Horas Extras        
@author TReport
@since 29/10/2019
@version 1.0
	@example
	u_RELHORAS()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELHORAS()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Cria as definições do relatório
	oReport := fReportDef()

	cPerg := "RELHORAS"

	////////////////////////////////////////////////////////////////////////
	///Cria as perguntas no SX1
	////////////////////////////////////////////////////////////////////////
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
	Local oSection1 := Nil
	Local oSection2 := Nil
	Local oSection3 := Nil
	Local oBreak    := Nil
	
	//Criação do componente de impressão
	oReport := TReport():New(	"RELHORAS",;		//Nome do Relatório
								"Relatório Horas Extras",;		//Título
								cPerg,;		//Pergunte ... Se eu defino a pergunta aqui, será impresso uma página com os parâmetros, conforme privilégio 101
								{|oReport| fRepPrint(oReport)},;		//Bloco de código que será executado na confirmação da impressão
								)		//Descrição
	oReport:SetTotalInLine(.F.)
	oReport:lParamPage := .F.
	oReport:oPage:SetPaperSize(9) //Folha A4
	oReport:SetPortrait()
	oReport:SetLineHeight(60)
	oReport:nFontBody := 12
	
	//Criando a seção de dados 1
	oSection1 := TRSection():New(	oReport,;		//Objeto TReport que a seção pertence
									"Centro de Custo",;		//Descrição da seção
									{"QRY_AUX1"})		//Tabelas utilizadas, a primeira será considerada como principal da seção
	oSection1:SetTotalInLine(.F.)  //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
		//Criando a seção de dados 2
	oSection2 := TRSection():New(	oReport,;		//Objeto TReport que a seção pertence
									"Colaboradores",;		//Descrição da seção
									{"QRY_AUX2"})		//Tabelas utilizadas, a primeira será considerada como principal da seção
	oSection2:SetTotalInLine(.F.)  //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha

		//Criando a seção de dados
	oSection3 := TRSection():New(	oReport,;		//Objeto TReport que a seção pertence
									"Ranking",;		//Descrição da seção
									{"QRY_AUX3"})		//Tabelas utilizadas, a primeira será considerada como principal da seção
	oSection3:SetTotalInLine(.F.)  //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
	If cValToChar(MV_PAR01) = "1" //SRC – Movimento do Período - Aberto
	//Colunas do relatório Aba Centro de Custo
	TRCell():New(oSection1, "RC_FILIAL", "QRY_AUX1", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "RC_MAT", "QRY_AUX1", "Matricula", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "RA_NOME", "QRY_AUX1", "Nome", /*Picture*/, 30, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "PERIODO", "QRY_AUX1", "Periodo", /*Picture*/, 7, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "RC_PD", "QRY_AUX1", "Codigo Verba", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "RV_DESC", "QRY_AUX1", "Descricao", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "RC_CC", "QRY_AUX1", "Centro Custo", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "DESCRICAO", "QRY_AUX1", "Descricao", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "RC_HORAS", "QRY_AUX1", "Horas Lanc.", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "VALOR", "QRY_AUX1", "Valor", "@E 999,999,999.99", 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	
	//Colunas do relatório
	TRCell():New(oSection2, "RC_FILIAL", "QRY_AUX2", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "RC_MAT", "QRY_AUX2", "Matricula", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "RA_NOME", "QRY_AUX2", "Nome", /*Picture*/, 30, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "PERIODO", "QRY_AUX2", "Periodo", /*Picture*/, 7, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "RC_PD", "QRY_AUX2", "Codigo Verba", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "RV_DESC", "QRY_AUX2", "Descricao", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "RC_CC", "QRY_AUX2", "Centro Custo", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "VALOR", "QRY_AUX2", "Valor", "@E 999,999,999.99", 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	
	//Colunas do relatório 
	TRCell():New(oSection3, "RC_FILIAL", "QRY_AUX3", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection3, "PERIODO", "QRY_AUX3", "Periodo", /*Picture*/, 7, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection3, "RC_PD", "QRY_AUX3", "Codigo Verba", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection3, "RV_DESC", "QRY_AUX3", "Descricao", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection3, "RC_CC", "QRY_AUX3", "Centro Custo", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection3, "DESCRICAO", "QRY_AUX3", "Descricao", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection3, "RC_HORAS", "QRY_AUX3", "Horas Lanc.", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection3, "VALOR", "QRY_AUX3", "Valor", "@E 999,999,999.99", 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection3, "RANK", "QRY_AUX3", "Rank", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	
	ElseIf cValToChar(MV_PAR01) = "2" //SRD – Histórico de Movimentos - Fechado
	
	//Colunas do relatório Aba Centro de Custo
	TRCell():New(oSection1, "RD_FILIAL", "QRY_AUX1", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "RD_MAT", "QRY_AUX1", "Matricula", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "RA_NOME", "QRY_AUX1", "Nome", /*Picture*/, 30, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "PERIODO", "QRY_AUX1", "Periodo", /*Picture*/, 7, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "RD_PD", "QRY_AUX1", "Codigo Verba", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "RV_DESC", "QRY_AUX1", "Descricao", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "RD_CC", "QRY_AUX1", "Centro Custo", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "RD_HORAS", "QRY_AUX1", "Horas/Dias", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection1, "VALOR", "QRY_AUX1", "Valor", "@E 999,999,999.99", 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	
	//Colunas do relatório Aba Colaboradores
	TRCell():New(oSection2, "RD_FILIAL", "QRY_AUX2", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "RD_MAT", "QRY_AUX2", "Matricula", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "RA_NOME", "QRY_AUX2", "Nome", /*Picture*/, 30, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "PERIDO", "QRY_AUX2", "Perido", /*Picture*/, 7, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "RD_PD", "QRY_AUX2", "Codigo Verba", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "RV_DESC", "QRY_AUX2", "Descricao", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "RD_CC", "QRY_AUX2", "Centro Custo", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection2, "VALOR", "QRY_AUX2", "Valor", "@E 999,999,999.99", 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	
	//Colunas do relatório Aba Ranking 
	TRCell():New(oSection3, "RD_FILIAL", "QRY_AUX3", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection3, "PERIODO", "QRY_AUX3", "Periodo", /*Picture*/, 7, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection3, "RD_PD", "QRY_AUX3", "Codigo Verba", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection3, "RV_DESC", "QRY_AUX3", "Descricao", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection3, "RD_CC", "QRY_AUX3", "Centro Custo", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection3, "DESCRICAO", "QRY_AUX3", "Descricao", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection3, "RD_HORAS", "QRY_AUX3", "Horas/Dias", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection3, "VALOR", "QRY_AUX3", "Valor", "@E 999,999,999.99", 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSection3, "RANK", "QRY_AUX3", "Rank", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	
	EndIf
	
	//Aqui, farei uma quebra  por seção
	oSection1:SetPageBreak(.T.)
	oSection1:SetTotalText(" ")		
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
	
	U_xPutSx1(cPerg,"01","Movimentação Folha?","","","mv_CH1","N",01,0,0,"C","","","","","MV_PAR01","1-Aberto","1-Aberto","1-Aberto","2-Fechado","2-Fechado","2-Fechado","","","","","","",,,)
	U_xPutSx1(cPerg,"02","Periodo De ?","","","mv_CH2","C",06,0,0,"G","","RCH","","","MV_PAR02","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"03","Perido Até ?","","","mv_CH3","C",06,0,0,"G","","RCH","","","MV_PAR03","","","","","","","","","","","","","","","","")
	
	dbSelectArea(_sAlias)

Return	
	
/*-------------------------------------------------------------------------------*
 | Func:  fRepPrint                                                              |
 | Desc:  Função que imprime o relatório                                         |
 *-------------------------------------------------------------------------------*/
	
Static Function fRepPrint(oReport)
	Local aArea    := GetArea()
	Local cQryAux11  := ""
	Local cQryAux12  := ""
	Local cQryAux13  := ""
	Local oSection1 := Nil
	Local oSection2 := Nil
	Local oSection3 := Nil
	Local nAtual   := 0
	Local nTotal   := 0
	
	//Pegando as seções do relatório
	oSection1 := oReport:Section(1)
	oSection2 := oReport:Section(2)
	oSection3 := oReport:Section(3)
	
	If cValToChar(MV_PAR01) = "1" 
	//Montando consulta de dados
	cQryAux1 := ""
	cQryAux1 += "SELECT RC_FILIAL, RC_MAT, RA_NOME, SUBSTR(RC_PERIODO,1,4)||'/' ||SUBSTR(RC_PERIODO,5,2) PERIODO,RC_PD,RV_DESC ,RC_CC,CTT_DESC01 DESCRICAO, RC_HORAS,SUM(RC_VALOR) VALOR"		+ STR_PULA
	cQryAux1 += "FROM   SRC010 "		+ STR_PULA
	cQryAux1 += "       INNER JOIN SRA010 "		+ STR_PULA
	cQryAux1 += "               ON SRA010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux1 += "                  AND RA_FILIAL = RC_FILIAL "		+ STR_PULA
	cQryAux1 += "                  AND RA_MAT = RC_MAT "		+ STR_PULA
	cQryAux1 += "       INNER JOIN SRV010 ON SRV010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux1 += "                  AND RV_COD = RC_PD          "		+ STR_PULA
	cQryAux1 += "        INNER JOIN CTT010 ON CTT010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux1 += "                         AND CTT_CUSTO = RA_CC"		+ STR_PULA
	cQryAux1 += "WHERE  SRC010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	//cQryAux1 += "AND RC_PERIODO BETWEEN '201910'  AND '201910'"		+ STR_PULA
	cQryAux1 += "AND RC_PERIODO BETWEEN '" + MV_PAR02 +"' AND '"+ MV_PAR03 +"' 	"		+ STR_PULA
	cQryAux1 += "AND RC_PD IN ('034', '113','114','208','112','375','206')"		+ STR_PULA
	cQryAux1 += "GROUP BY RC_PERIODO,RC_FILIAL,RC_MAT,RA_NOME, RC_CC,RC_PD,RV_DESC, RC_HORAS, CTT_DESC01"		+ STR_PULA
	
	MemoWrite("C:\teste\CC_RC_V2.sql",cQryAux1) //29/10/2019
	
	ElseIf cValToChar(MV_PAR01) = "2" //SRD – Histórico de Movimentos - Fechado
	
	//Montando consulta de dados
	cQryAux1 := ""
	cQryAux1 += "SELECT RD_FILIAL, RD_MAT, RA_NOME, SUBSTR(RD_PERIODO,1,4)||'/' ||SUBSTR(RD_PERIODO,5,2) PERIODO,RD_PD,RV_DESC ,RD_CC,RD_HORAS,SUM(RD_VALOR) VALOR"		+ STR_PULA
	cQryAux1 += "FROM   SRD010 "		+ STR_PULA
	cQryAux1 += "       INNER JOIN SRA010 "		+ STR_PULA
	cQryAux1 += "               ON SRA010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux1 += "                  AND RA_FILIAL = RD_FILIAL "		+ STR_PULA
	cQryAux1 += "                  AND RA_MAT = RD_MAT "		+ STR_PULA
	cQryAux1 += "       INNER JOIN SRV010 ON SRV010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux1 += "                  AND RV_COD = RD_PD"		+ STR_PULA
	cQryAux1 += "WHERE  SRD010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	//cQryAux1 += "AND RD_PERIODO BETWEEN '201909'  AND '201909'"		+ STR_PULA	
	cQryAux1 += "AND RD_PERIODO BETWEEN '" + MV_PAR02 +"' AND '"+ MV_PAR03 +"' 	"		+ STR_PULA
	cQryAux1 += "AND RD_PD IN ('034', '113','114','208','112','375','206')"		+ STR_PULA
	cQryAux1 += "GROUP BY RD_PERIODO,RD_FILIAL,RD_MAT,RA_NOME, RD_CC,RD_PD,RV_DESC, RD_HORAS"		+ STR_PULA
	cQryAux1 += "ORDER BY RD_CC, RD_MAT, RV_DESC"		+ STR_PULA
	
	MemoWrite("C:\teste\CC_RD_V2.sql",cQryAux1) //29/10/2019
	
	EndIf
	
	//MemoWrite("C:\teste\CC_V1.sql",cQryAux1) //29/10/2019
	
	cQryAux1 := ChangeQuery(cQryAux1)
	
	If ( SELECT("QRY_AUX1") ) > 0
		dbSelectArea("QRY_AUX1")
		QRY_SEC1->(dbCloseArea())
	EndIf
	
	//Executando consulta e setando o total da régua
	TCQuery cQryAux1 New Alias "QRY_AUX1"
	Count to nTotal
	oReport:SetMeter(nTotal)
	
	//Enquanto houver dados
	oSection1:Init()
	QRY_AUX1->(DbGoTop())
	While ! QRY_AUX1->(Eof())
		//Incrementando a régua
		nAtual++
		oReport:SetMsgPrint("Imprimindo registro Seção 1: "+cValToChar(nAtual)+" de "+cValToChar(nTotal)+"...")
		oReport:IncMeter()
		
		//Imprimindo a linha atual
		oSection1:PrintLine()
		
		QRY_AUX1->(DbSkip())
	EndDo
	
	nAtual   := 0
	nTotal   := 0
	
	If cValToChar(MV_PAR01) = "1" //SRC – Movimento do Período - Aberto
	
	//Montando consulta de dados 2
	cQryAux2 := ""
	cQryAux2 += "SELECT RC_FILIAL, RC_MAT, RA_NOME, SUBSTR(RC_PERIODO,1,4)||'/' ||SUBSTR(RC_PERIODO,5,2) PERIODO,RC_PD,RV_DESC ,RC_CC,SUM(RC_VALOR) VALOR"		+ STR_PULA
	cQryAux2 += "FROM   SRC010 "		+ STR_PULA
	cQryAux2 += "       INNER JOIN SRA010 "		+ STR_PULA
	cQryAux2 += "               ON SRA010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux2 += "                  AND RA_FILIAL = RC_FILIAL "		+ STR_PULA
	cQryAux2 += "                  AND RA_MAT = RC_MAT "		+ STR_PULA
	cQryAux2 += "       INNER JOIN SRV010 ON SRV010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux2 += "                  AND RV_COD = RC_PD"		+ STR_PULA
	cQryAux2 += "WHERE  SRC010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	//cQryAux2 += "AND RC_PERIODO BETWEEN '201910'  AND '201910'"		+ STR_PULA
	cQryAux2 += "AND RC_PERIODO BETWEEN '" + MV_PAR02 +"' AND '"+ MV_PAR03 +"' 	"		+ STR_PULA
	cQryAux2 += "AND RC_PD BETWEEN ' ' AND 'ZZZ'"		+ STR_PULA //VER FOMRA DE FAZER 
	cQryAux2 += "GROUP BY RC_PERIODO,RC_FILIAL,RC_MAT,RA_NOME, RC_CC,RC_PD,RV_DESC "		+ STR_PULA
	cQryAux2 += "ORDER BY RC_PERIODO"		+ STR_PULA
	
	MemoWrite("C:\teste\Colaboradoes_RC_V1.sql",cQryAux2) //29/10/2019
	
	ElseIf cValToChar(MV_PAR01) = "2" //SRD – Histórico de Movimentos - Fechado
	
	cQryAux2 := ""
	cQryAux2 += "SELECT RD_FILIAL, RD_MAT, RA_NOME, SUBSTR(RD_PERIODO,1,4)||'/' ||SUBSTR(RD_PERIODO,5,2) PERIDO,RD_PD,RV_DESC ,RD_CC,SUM(RD_VALOR) VALOR"		+ STR_PULA
	cQryAux2 += "FROM   SRD010 "		+ STR_PULA
	cQryAux2 += "       INNER JOIN SRA010 "		+ STR_PULA
	cQryAux2 += "               ON SRA010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux2 += "                  AND RA_FILIAL = RD_FILIAL "		+ STR_PULA
	cQryAux2 += "                  AND RA_MAT = RD_MAT "		+ STR_PULA
	cQryAux2 += "       INNER JOIN SRV010 ON SRV010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux2 += "                  AND RV_COD = RD_PD"		+ STR_PULA
	cQryAux2 += "WHERE  SRD010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	//cQryAux2 += "AND RD_PERIODO BETWEEN '201909' AND '201909'"		+ STR_PULA
	cQryAux2 += "AND RD_PERIODO BETWEEN '" + MV_PAR02 +"' AND '"+ MV_PAR03 +"' 	"		+ STR_PULA
	cQryAux2 += "AND RD_PD BETWEEN ' ' AND 'ZZZ'"		+ STR_PULA //VER FORMA DE FAZER 
	cQryAux2 += "GROUP BY RD_PERIODO,RD_FILIAL,RD_MAT,RA_NOME, RD_CC,RD_PD,RV_DESC "		+ STR_PULA
	cQryAux2 += "ORDER BY RD_PERIODO"		+ STR_PULA
	
	MemoWrite("C:\teste\Colaboradoes_RD_V1.sql",cQryAux2) //29/10/2019
	
	EndIf
	
	//MemoWrite("C:\teste\Colaboradoes_V1.sql",cQryAux2) //29/10/2019

	cQryAux2 := ChangeQuery(cQryAux2)
	
	If ( SELECT("QRY_AUX2") ) > 0
		dbSelectArea("QRY_AUX2")
		QRY_AUX2-> (dbCloseArea())
	EndIf

	//Executando consulta e setando o total da régua
	TCQuery cQryAux2 New Alias "QRY_AUX2"
	Count to nTotal
	oReport:SetMeter(nTotal)
	
	//Enquanto houver dados
	oSection2:Init()
	QRY_AUX2->(DbGoTop())
	While ! QRY_AUX2->(Eof())
		//Incrementando a régua
		nAtual++
		oReport:SetMsgPrint("Imprimindo registro Seção 2: "+cValToChar(nAtual)+" de "+cValToChar(nTotal)+"...")
		oReport:IncMeter()
		
		//Imprimindo a linha atual
		oSection2:PrintLine()
		QRY_AUX2->(DbSkip())
		
	EndDo
	
	nAtual   := 0
	nTotal   := 0
	
	If cValToChar(MV_PAR01) = "1" //SRC – Movimento do Período - Aberto
	//Montando consulta de dados 3 
	cQryAux3 := ""
	cQryAux3 += "SELECT RC_FILIAL,SUBSTR(RC_PERIODO,1,4)||'/' ||SUBSTR(RC_PERIODO,5,2) AS PERIODO,RC_PD,RV_DESC ,RC_CC, CTT_DESC01 DESCRICAO,RC_HORAS,SUM(RC_VALOR) VALOR,RANK() OVER(ORDER BY SUM(RC_VALOR) DESC) AS RANK"		+ STR_PULA
	cQryAux3 += "FROM   SRC010 "		+ STR_PULA
	cQryAux3 += "       INNER JOIN SRA010 "		+ STR_PULA
	cQryAux3 += "               ON SRA010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux3 += "                  AND RA_FILIAL = RC_FILIAL "		+ STR_PULA
	cQryAux3 += "                  AND RA_MAT = RC_MAT "		+ STR_PULA
	cQryAux3 += "                  "		+ STR_PULA
	cQryAux3 += "       INNER JOIN SRV010 ON SRV010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux3 += "                  AND RV_COD = RC_PD"		+ STR_PULA
	cQryAux3 += "                  "		+ STR_PULA
	cQryAux3 += "        INNER JOIN CTT010 ON CTT010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux3 += "                         AND CTT_CUSTO = RA_CC"		+ STR_PULA
	cQryAux3 += "WHERE  SRC010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	//cQryAux3 += "AND RC_PERIODO BETWEEN '201910'  AND '201910'"		+ STR_PULA
	cQryAux3 += "AND RC_PERIODO BETWEEN '" + MV_PAR02 +"' AND '"+ MV_PAR03 +"' 	"		+ STR_PULA
	cQryAux3 += "AND RC_PD IN ('034','111','112', '113','114','118','205','206','208','112','375')"		+ STR_PULA
	cQryAux3 += "GROUP BY RC_PERIODO,RC_FILIAL,RC_CC,RC_PD,RV_DESC, RC_HORAS, CTT_DESC01"		+ STR_PULA
	
	MemoWrite("C:\teste\Ranking_RC_V1.sql",cQryAux3)
	
	ElseIf cValToChar(MV_PAR01) = "2" //SRD – Histórico de Movimentos - Fechado
	//Montando consulta de dados 3 
	cQryAux3 := ""
	cQryAux3 += "SELECT RD_FILIAL,SUBSTR(RD_PERIODO,1,4)||'/' ||SUBSTR(RD_PERIODO,5,2) PERIODO,RD_PD,RV_DESC ,RD_CC, CTT_DESC01 DESCRICAO,RD_HORAS,SUM(RD_VALOR) VALOR,RANK() OVER(ORDER BY SUM(RD_VALOR) DESC) AS RANK"		+ STR_PULA
	cQryAux3 += "FROM   SRD010 "		+ STR_PULA
	cQryAux3 += "       INNER JOIN SRA010 "		+ STR_PULA
	cQryAux3 += "               ON SRA010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux3 += "                  AND RA_FILIAL = RD_FILIAL "		+ STR_PULA
	cQryAux3 += "                  AND RA_MAT = RD_MAT "		+ STR_PULA
	cQryAux3 += "                  "		+ STR_PULA
	cQryAux3 += "       INNER JOIN SRV010 ON SRV010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux3 += "                  AND RV_COD = RD_PD"		+ STR_PULA
	cQryAux3 += "                  "		+ STR_PULA
	cQryAux3 += "        INNER JOIN CTT010 ON CTT010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux3 += "                         AND CTT_CUSTO = RA_CC"		+ STR_PULA
	cQryAux3 += "WHERE  SRD010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	//cQryAux3 += "AND RD_PERIODO BETWEEN '201909'  AND '201909'"		+ STR_PULA
	cQryAux3 += "AND RD_PERIODO BETWEEN '" + MV_PAR02 +"' AND '"+ MV_PAR03 +"' 	"		+ STR_PULA
	cQryAux3 += "AND RD_PD IN ('034','111','112', '113','114','118','205','206','208','112','375')"		+ STR_PULA
	cQryAux3 += "GROUP BY RD_PERIODO,RD_FILIAL,RD_CC,RD_PD,RV_DESC, RD_HORAS, CTT_DESC01"		+ STR_PULA
	
	MemoWrite("C:\teste\Ranking_RD_V1.sql",cQryAux3)
	
	EndIf
	
	//MemoWrite("C:\teste\Ranking_V1.sql",cQryAux3) //29/10/2019
	
	cQryAux3 := ChangeQuery(cQryAux3)
	
	If ( SELECT("QRY_AUX3") ) > 0
		dbSelectArea("QRY_AUX3")
		QRY_AUX2-> (dbCloseArea())
	EndIf
	
		//Executando consulta e setando o total da régua
	TCQuery cQryAux3 New Alias "QRY_AUX3"
	Count to nTotal
	oReport:SetMeter(nTotal)
	
	//Enquanto houver dados
	oSection3:Init()
	QRY_AUX3->(DbGoTop())
	While ! QRY_AUX3->(Eof())
		//Incrementando a régua
		nAtual++
		oReport:SetMsgPrint("Imprimindo registro Seção 3: "+cValToChar(nAtual)+" de "+cValToChar(nTotal)+"...")
		oReport:IncMeter()
		
		//Imprimindo a linha atual
		oSection3:PrintLine()
		
		QRY_AUX3->(DbSkip())
	EndDo
	
	//finalizo a segunda seção para que seja reiniciada para o proximo registro
 	oSection3:Finish()
 	//imprimo uma linha para separar 
 	oReport:ThinLine()	
	//finalizo a segunda seção para que seja reiniciada para o proximo registro
 	oSection2:Finish()
 	//imprimo uma linha para separar 
 	oReport:ThinLine()
 	//finalizo a primeira seção
	oSection1:Finish()
	
	QRY_AUX1->(DbCloseArea())
	QRY_AUX2->(DbCloseArea())
	QRY_AUX3->(DbCloseArea())
	
	RestArea(aArea)
Return
