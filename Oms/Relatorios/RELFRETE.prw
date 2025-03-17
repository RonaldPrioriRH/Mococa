//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELFRETE
Relatï¿½rio - Relatorio                     
@author TReport
@since 15/03/2021
@version 1.0
	@example
	u_RELFRETE()
	@obs Funï¿½ï¿½o gerada pelo TReport()
/*/
	
User Function RELFRETE()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""


	//Definições da pergunta
	cPerg := "RELFRETE"
	
	////////////////////////////////////////////////////////////////////////
	///Cria as perguntas no SX1
	////////////////////////////////////////////////////////////////////////
	ValPer01()
	
	if !Pergunte(cPerg,.t.)
		return
	endif
	
	
	//Cria as definiï¿½ï¿½es do relatï¿½rio
	oReport := fReportDef()
	
	//Serï¿½ enviado por e-Mail?
	If lEmail
		oReport:nRemoteType := NO_REMOTE
		oReport:cEmail := cPara
		oReport:nDevice := 3 //1-Arquivo,2-Impressora,3-email,4-Planilha e 5-Html
		oReport:SetPreview(.F.)
		oReport:Print(.F., "", .T.)
	//Senï¿½o, mostra a tela
	Else
		oReport:PrintDialog()
	EndIf
	
	RestArea(aArea)
Return
	
/*-------------------------------------------------------------------------------*
 | Func:  fReportDef                                                             |
 | Desc:  Funï¿½ï¿½o que monta a definiï¿½ï¿½o do relatï¿½rio                              |
 *-------------------------------------------------------------------------------*/
	
Static Function fReportDef()
	Local oReport
	Local oSectDad := Nil
	Local oBreak := Nil
	
	//Criaï¿½ï¿½o do componente de impressï¿½o
	oReport := TReport():New(	"RELFRETE",;		//Nome do Relatï¿½rio
								"Conferência de Frete",;		//Tï¿½tulo
								cPerg,;		//Pergunte ... Se eu defino a pergunta aqui, serï¿½ impresso uma pï¿½gina com os parï¿½metros, conforme privilï¿½gio 101
								{|oReport| fRepPrint(oReport)},;		//Bloco de cï¿½digo que serï¿½ executado na confirmaï¿½ï¿½o da impressï¿½o
								)		//Descriï¿½ï¿½o

	

	oReport:SetTotalInLine(.F.)
	oReport:lParamPage := .F.
	oReport:oPage:SetPaperSize(9) //Folha A4
	oReport:SetPortrait()
	oReport:SetLineHeight(60)
	oReport:nFontBody := 9
	//Criando a seï¿½ï¿½o de dados
	oSectDad := TRSection():New(	oReport,;		//Objeto TReport que a seï¿½ï¿½o pertence
									"Dados",;		//Descriï¿½ï¿½o da seï¿½ï¿½o
									{"QRY_AUX"})		//Tabelas utilizadas, a primeira serï¿½ considerada como principal da seï¿½ï¿½o
	oSectDad:SetTotalInLine(.F.)  //Define se os totalizadores serï¿½o impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
	//Colunas do relatório
	TRCell():New(oSectDad, "IDFRETEIDFRETE", "QRY_AUX", "Idfreteidfrete", /*Picture*/, 22, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTEMIS_NF", "QRY_AUX", "Dtemis_nf", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "IDCLIENTE", "QRY_AUX", "Idcliente", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOMECLIENTE", "QRY_AUX", "Nomecliente", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CNPJCLIENTE", "QRY_AUX", "Cnpjcliente", /*Picture*/, 14, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TRANSPORTADORA", "QRY_AUX", "Transportadora", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "IDFORNECEDOR", "QRY_AUX", "Idfornecedor", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOMETRANSPORTADORA", "QRY_AUX", "Nometransportadora", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CNPJFORNECEDOR", "QRY_AUX", "Cnpjfornecedor", /*Picture*/, 14, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "OPTANTEDOSIMPLES", "QRY_AUX", "Optantedosimples", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOTAFISCAL", "QRY_AUX", "Notafiscal", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALORNF", "QRY_AUX", "Valornf", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PESOBRUTO", "QRY_AUX", "Pesobruto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "IDTRIANGULACAO", "QRY_AUX", "Idtriangulacao", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NUMEROCTE", "QRY_AUX", "Numerocte", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALORCTE", "QRY_AUX", "Valorcte", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NUMCARGA", "QRY_AUX", "Numcarga", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QTDENTREGAS", "QRY_AUX", "Qtdentregas", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PESOBRUTOCARGA", "QRY_AUX", "Pesobrutocarga", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPOOPERACAO", "QRY_AUX", "Tipooperacao", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VEICULO", "QRY_AUX", "Veiculo", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CONDICAO", "QRY_AUX", "Condicao", /*Picture*/, 24, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPOCARGA", "QRY_AUX", "Tipocarga", /*Picture*/, 13, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ESTADO", "QRY_AUX", "Estado", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "REGIOES", "QRY_AUX", "Regioes", /*Picture*/, 12, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MUNICIPIO", "QRY_AUX", "Municipio", /*Picture*/, 60, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CODIBGEDESTINO", "QRY_AUX", "Codibgedestino", /*Picture*/, 12, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ALQICMS", "QRY_AUX", "Alqicms", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALORICMS", "QRY_AUX", "Valoricms", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALICMSOUTRAS", "QRY_AUX", "Valicmsoutras", /*Picture*/, 0, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ALQPIS", "QRY_AUX", "Alqpis", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALPIS", "QRY_AUX", "Valpis", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ALQCOF", "QRY_AUX", "Alqcof", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALCOFINS", "QRY_AUX", "Valcofins", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CHAVENFE", "QRY_AUX", "Chavenfe", /*Picture*/, 44, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CHAVECTE", "QRY_AUX", "Chavecte", /*Picture*/, 44, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DATALANCAMENTOCTE", "QRY_AUX", "Datalancamentocte", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "GNRE", "QRY_AUX", "Gnre", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ID", "QRY_AUX", "Desc Item", /*Picture*/, 60, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FATORGRIS", "QRY_AUX", "Fatorgris", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "GRISS_VALOR", "QRY_AUX", "Griss_valor", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FRETE_PESO_S_GRISS_E_ICMS", "QRY_AUX", "Frete_peso_s_griss_e_icms", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FRETE_LIQUIDO", "QRY_AUX", "Frete_liquido", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR_FRETE_TABELA", "QRY_AUX", "Valor_frete_tabela", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DIVERGENCIA", "QRY_AUX", "Divergencia", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "STATUS", "QRY_AUX", "Status", /*Picture*/, 0, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "OBSERVACAO", "QRY_AUX", "Observacao", /*Picture*/, 0, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPOFRETE", "QRY_AUX", "Tipofrete", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_TES", "QRY_AUX", "Tipo Entrada", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
Return oReport
	
/*-------------------------------------------------------------------------------*
 | Func:  fRepPrint                                                              |
 | Desc:  Funï¿½ï¿½o que imprime o relatï¿½rio                                         |
 *-------------------------------------------------------------------------------*/
	
Static Function fRepPrint(oReport)
	Local aArea    := GetArea()
	Local cQryAux  := ""
	Local oSectDad := Nil
	Local nAtual   := 0
	Local nTotal   := 0
	
	//Pegando as seï¿½ï¿½es do relatï¿½rio
	oSectDad := oReport:Section(1)
	
	//Montando consulta de dados
	cQryAux := ""
	cQryAux += "SELECT   (F.FILIAL || F.NOTAFISCAL || NUMEROCTE) IDFRETEIDFRETE,"		+ STR_PULA
	cQryAux += "         DTEMIS_NF,"		+ STR_PULA
	cQryAux += "         FILIAL,"		+ STR_PULA
	cQryAux += "         IDCLIENTE,"		+ STR_PULA
	cQryAux += "         NOMECLIENTE,"		+ STR_PULA
	cQryAux += "         CNPJCLIENTE,"		+ STR_PULA
	cQryAux += "         TRANSPORTADORA,"		+ STR_PULA
	cQryAux += "         IDFORNECEDOR,"		+ STR_PULA
	cQryAux += "         NOMETRANSPORTADORA,"		+ STR_PULA
	cQryAux += "         CNPJFORNECEDOR,"		+ STR_PULA
	cQryAux += "         OPTANTEDOSIMPLES,"		+ STR_PULA
	cQryAux += "         NOTAFISCAL,"		+ STR_PULA
	cQryAux += "         VALORNF,"		+ STR_PULA
	cQryAux += "         PESOBRUTO,"		+ STR_PULA
	cQryAux += "         IDTRIANGULACAO,"		+ STR_PULA
	cQryAux += "         NUMEROCTE,"		+ STR_PULA
	cQryAux += "         VALORCTE,"		+ STR_PULA
	cQryAux += "         NUMCARGA,"		+ STR_PULA
	cQryAux += "         QTDENTREGAS,"		+ STR_PULA
	cQryAux += "         PESOBRUTOCARGA,"		+ STR_PULA
	cQryAux += "         TIPOOPERACAO,"		+ STR_PULA
	cQryAux += "         VEICULO,"		+ STR_PULA
	cQryAux += "         CONDICAO,"		+ STR_PULA
	cQryAux += "         TIPOCARGA,"		+ STR_PULA
	cQryAux += "         ESTADO,"		+ STR_PULA
	cQryAux += "         REGIOES,"		+ STR_PULA
	cQryAux += "         MUNICIPIO,"		+ STR_PULA
	cQryAux += "         CODIBGEDESTINO,"		+ STR_PULA
	cQryAux += "         ALQICMS,"		+ STR_PULA
	cQryAux += "         VALORICMS,"		+ STR_PULA
	cQryAux += "         NULL VALICMSOUTRAS,"		+ STR_PULA
	cQryAux += "         ALQPIS,"		+ STR_PULA
	cQryAux += "         VALPIS,"		+ STR_PULA
	cQryAux += "         ALQCOF,"		+ STR_PULA
	cQryAux += "         VALCOFINS,"		+ STR_PULA
	cQryAux += "         CHAVENFE,"		+ STR_PULA
	cQryAux += "         CHAVECTE,"		+ STR_PULA
	cQryAux += "         DATALANCAMENTOCTE,"		+ STR_PULA
	cQryAux += "         (CASE D1_TES WHEN '152' THEN 'SIM'"		+ STR_PULA
	cQryAux += "                     ELSE 'NAO' END) GNRE,"		+ STR_PULA
	cQryAux += "         (CASE F.ESTADO  WHEN 'SP'  THEN TRIM(ESTADO||VEICULO||TIPOCARGA||CONDICAO)"		+ STR_PULA
	cQryAux += "                                                ELSE (ESTADO||CODIBGEDESTINO||VEICULO||TIPOCARGA||CONDICAO) END) ID,"		+ STR_PULA
	cQryAux += "         FATORGRIS,"		+ STR_PULA
	cQryAux += "          NVL(ROUND((VALORNF * FATORGRIS),2),0) GRISS_VALOR,"		+ STR_PULA
	cQryAux += "         "		+ STR_PULA
	cQryAux += "         ROUND(NVL(VALORCTE,0) - (NVL(VALORICMS,0) + NVL(ROUND((VALORNF * FATORGRIS),2),0)),2) AS FRETE_PESO_S_GRISS_E_ICMS,"		+ STR_PULA
	cQryAux += "         "		+ STR_PULA
	cQryAux += "         ROUND((((VALORCTE - (ROUND((VALORNF * FATORGRIS),2)+VALORICMS))/PESOBRUTO)*1000),2) AS FRETE_LIQUIDO,"		+ STR_PULA
	cQryAux += "         "		+ STR_PULA
	cQryAux += "         NVL((CASE  WHEN TRIM(TIPOOPERACAO)= 'VENDAS' THEN ZX2_VLVEND"		+ STR_PULA
	cQryAux += "                WHEN (TRIM(TIPOOPERACAO) = 'TRANSF'AND ESTADO IN ('MS','MT')) THEN 60.00"		+ STR_PULA
	cQryAux += "                                ELSE 120.00 END),0) VALOR_FRETE_TABELA,"		+ STR_PULA
	cQryAux += "                         "		+ STR_PULA
	cQryAux += "                         "		+ STR_PULA
	cQryAux += "         NVL(ROUND ((((VALORCTE - (ROUND((VALORNF * FATORGRIS),2)+VALORICMS))/PESOBRUTO)*1000)-(CASE  WHEN TRIM(TIPOOPERACAO)= 'VENDAS' THEN ZX2_VLVEND"		+ STR_PULA
	cQryAux += "                WHEN (TRIM(TIPOOPERACAO) = 'TRANSF'AND ESTADO IN ('MS','MT')) THEN 60.00"		+ STR_PULA
	cQryAux += "                                ELSE 120.00 END)),0) DIVERGENCIA,"		+ STR_PULA
	cQryAux += "         NULL STATUS,"		+ STR_PULA
	cQryAux += "         NULL OBSERVACAO,"		+ STR_PULA
	cQryAux += "         TIPOFRETE,"		+ STR_PULA
	cQryAux += "         D1_TES"		+ STR_PULA
	cQryAux += "         "		+ STR_PULA
	cQryAux += "             "		+ STR_PULA
	cQryAux += "  FROM      (  SELECT   D2_DOC NOTAFISCAL,"		+ STR_PULA
	cQryAux += "                        D2_FILIAL FILIAL,"		+ STR_PULA
	cQryAux += "                        TO_DATE (TRIM (D2_EMISSAO), 'YYYYMMDD') DTEMIS_NF,"		+ STR_PULA
	cQryAux += "                        F2_CLIENTE || F2_LOJA AS IDCLIENTE,"		+ STR_PULA
	cQryAux += "                        TRIM (A1_NOME) NOMECLIENTE,"		+ STR_PULA
	cQryAux += "                        (SUM (D2_TOTAL) + SUM (D2_ICMSRET)) VALORNF, "		+ STR_PULA
	cQryAux += "                        F2_PBRUTO PESOBRUTO,"		+ STR_PULA
	cQryAux += "                        F2_TRANSP TRANSPORTADORA,"		+ STR_PULA
	cQryAux += "                        F1_FORNECE || F1_LOJA IDFORNECEDOR,"		+ STR_PULA
	cQryAux += "                        TRIM (A2_NOME) NOMETRANSPORTADORA,"		+ STR_PULA
	cQryAux += "                        D1_DOC NUMEROCTE,"		+ STR_PULA
	cQryAux += "                        F1_VALBRUT VALORCTE,"		+ STR_PULA
	cQryAux += "                        NVL (F2_CARGA, 0) NUMCARGA,"		+ STR_PULA
	cQryAux += "                        NVL (DAK_PTOENT, 0) QTDENTREGAS,"		+ STR_PULA
	cQryAux += "                        NVL (DAK_PESO, 0) PESOBRUTOCARGA,"		+ STR_PULA
	cQryAux += "                         (CASE"		+ STR_PULA
	cQryAux += "                            WHEN A1_CGC = '52502507000651'"		+ STR_PULA
	cQryAux += "                            THEN"		+ STR_PULA
	cQryAux += "                               'TRANSF'"		+ STR_PULA
	cQryAux += "                            WHEN A1_CGC <> '52502507000651'"		+ STR_PULA
	cQryAux += "                                 AND F2_CLIENTE = 'C02641'"		+ STR_PULA
	cQryAux += "                            THEN"		+ STR_PULA
	cQryAux += "                               'CONFERIR'"		+ STR_PULA
	cQryAux += "                            ELSE"		+ STR_PULA
	cQryAux += "                               'VENDAS'"		+ STR_PULA
	cQryAux += "                         END)"		+ STR_PULA
	cQryAux += "                           TIPOOPERACAO,"		+ STR_PULA
	cQryAux += "                        (CASE"		+ STR_PULA
	cQryAux += "                            WHEN F2_EST IN ('RR', 'AM')"		+ STR_PULA
	cQryAux += "                            THEN 'CONTAINER'"		+ STR_PULA
	cQryAux += "                            WHEN DAK_PESO < 19000"		+ STR_PULA
	cQryAux += "                            THEN 'TRUCK'"		+ STR_PULA
	cQryAux += "                            WHEN DAK_PESO > 19000"		+ STR_PULA
	cQryAux += "                            THEN 'CARRETA'"		+ STR_PULA
	cQryAux += "                            WHEN (DAK_PESO = 0 OR F2_PBRUTO < 1900)"		+ STR_PULA
	cQryAux += "                            THEN 'TRUCK'"		+ STR_PULA
	cQryAux += "                            WHEN (DAK_PESO = 0 OR F2_PBRUTO > 1900)"		+ STR_PULA
	cQryAux += "                            THEN 'CARRETA'"		+ STR_PULA
	cQryAux += "                            ELSE 'CONFERIR'"		+ STR_PULA
	cQryAux += "                         END)"		+ STR_PULA
	cQryAux += "                           VEICULO,"		+ STR_PULA
	cQryAux += "                        (CASE"		+ STR_PULA
	cQryAux += "                            WHEN A1_CGC = '52502507000651'"		+ STR_PULA
	cQryAux += "                            THEN 'TRANSF'"		+ STR_PULA
	cQryAux += "                            WHEN (    A1_COD <> 'C02641'"		+ STR_PULA
	cQryAux += "                                  AND F2_EST = 'SP'"		+ STR_PULA
	cQryAux += "                                  AND DAK_PTOENT <= 1)"		+ STR_PULA
	cQryAux += "                            THEN '(SP) 1 ENTREGA'"		+ STR_PULA
	cQryAux += "                            WHEN (    A1_COD <> 'C02641'"		+ STR_PULA
	cQryAux += "                                  AND F2_EST = 'SP'"		+ STR_PULA
	cQryAux += "                                  AND (DAK_PTOENT >= 2 AND DAK_PTOENT < 5))"		+ STR_PULA
	cQryAux += "                            THEN '(SP) DE 2 A 5 ENTREGAS'"		+ STR_PULA
	cQryAux += "                            WHEN (    A1_COD <> 'C02641'"		+ STR_PULA
	cQryAux += "                                  AND F2_EST = 'SP'"		+ STR_PULA
	cQryAux += "                                  AND (DAK_PTOENT >= 6 AND DAK_PTOENT <= 10))"		+ STR_PULA
	cQryAux += "                            THEN '(SP) DE 6 A 10 ENTREGAS'"		+ STR_PULA
	cQryAux += "                            WHEN (    A1_COD <> 'C02641'"		+ STR_PULA
	cQryAux += "                                  AND F2_EST = 'SP'"		+ STR_PULA
	cQryAux += "                                  AND (DAK_PTOENT >= 11 AND DAK_PTOENT <= 20))"		+ STR_PULA
	cQryAux += "                            THEN '(SP) DE 11 A 20 ENTREGAS'"		+ STR_PULA
	cQryAux += "                            WHEN (    A1_COD <> 'C02641'"		+ STR_PULA
	cQryAux += "                                  AND F2_EST = 'SP'"		+ STR_PULA
	cQryAux += "                                  AND (DAK_PTOENT >= 21 AND DAK_PTOENT <= 35))"		+ STR_PULA
	cQryAux += "                            THEN '(SP) DE 21 A 35 ENTREGAS'"		+ STR_PULA
	cQryAux += "                            WHEN (    A1_COD <> 'C02641'"		+ STR_PULA
	cQryAux += "                                  AND F2_EST <> 'SP'"		+ STR_PULA
	cQryAux += "                                  AND (DAK_PTOENT <= 2))"		+ STR_PULA
	cQryAux += "                            THEN '2 ENTREGAS ATE 50 KM'"		+ STR_PULA
	cQryAux += "                            WHEN (    A1_COD <> 'C02641'"		+ STR_PULA
	cQryAux += "                                  AND F2_EST <> 'SP'"		+ STR_PULA
	cQryAux += "                                  AND (DAK_PTOENT >= 3 AND DAK_PTOENT <= 5))"		+ STR_PULA
	cQryAux += "                            THEN '3 A 5 ENTREGAS'"		+ STR_PULA
	cQryAux += "                            WHEN (    A1_COD <> 'C02641'"		+ STR_PULA
	cQryAux += "                                  AND F2_EST <> 'SP'"		+ STR_PULA
	cQryAux += "                                  AND (DAK_PTOENT >= 6))"		+ STR_PULA
	cQryAux += "                            THEN 'ACIMA DE 6 ENTREGAS'"		+ STR_PULA
	cQryAux += "                            WHEN (    A1_COD <> 'C02641'"		+ STR_PULA
	cQryAux += "                                  AND F2_EST IN ('RR', 'AM')"		+ STR_PULA
	cQryAux += "                                  AND DAK_PTOENT = 1)"		+ STR_PULA
	cQryAux += "                            THEN '1 ENTREGAS' || F2_EST"		+ STR_PULA
	cQryAux += "                            WHEN (    A1_COD <> 'C02641'"		+ STR_PULA
	cQryAux += "                                  AND F2_EST IN ('RR', 'AM')"		+ STR_PULA
	cQryAux += "                                  AND DAK_PTOENT >= 2)"		+ STR_PULA
	cQryAux += "                            THEN 'CONFIRA'"		+ STR_PULA
	cQryAux += "                         END)"		+ STR_PULA
	cQryAux += "                           AS CONDICAO,"		+ STR_PULA
	cQryAux += "                        (CASE"		+ STR_PULA
	cQryAux += "                            WHEN A1_CGC = '52502507000651'"		+ STR_PULA
	cQryAux += "                            THEN 'TRANSFERENCIA'"		+ STR_PULA
	cQryAux += "                            WHEN (A1_COD <> 'C02641' AND DAK_PTOENT > 2)"		+ STR_PULA
	cQryAux += "                            THEN 'FRACIONADA'"		+ STR_PULA
	cQryAux += "                            WHEN (    A1_COD <> 'C02641'"		+ STR_PULA
	cQryAux += "                                  AND DAK_PTOENT = 1"		+ STR_PULA
	cQryAux += "                                  AND F2_EST = 'SP')"		+ STR_PULA
	cQryAux += "                            THEN 'LOTACAO'"		+ STR_PULA
	cQryAux += "                            WHEN (    A1_COD <> 'C02641'"		+ STR_PULA
	cQryAux += "                                  AND DAK_PTOENT >= 2"		+ STR_PULA
	cQryAux += "                                  AND F2_EST = 'SP')"		+ STR_PULA
	cQryAux += "                            THEN 'FRACIONADA'"		+ STR_PULA
	cQryAux += "                            WHEN (    A1_COD <> 'C02641'"		+ STR_PULA
	cQryAux += "                                  AND DAK_PTOENT <= 2"		+ STR_PULA
	cQryAux += "                                  AND F2_EST <> 'SP')"		+ STR_PULA
	cQryAux += "                            THEN 'LOTACAO'"		+ STR_PULA
	cQryAux += "                            ELSE 'CONFERIR'"		+ STR_PULA
	cQryAux += "                         END)"		+ STR_PULA
	cQryAux += "                        TIPOCARGA,"		+ STR_PULA
	cQryAux += "                        F2_EST ESTADO,"		+ STR_PULA
	cQryAux += "                        CASE"		+ STR_PULA
	cQryAux += "                           WHEN F2_EST     IN ('GO', 'MT', 'MS', 'DF')                        THEN 'CENTRO OESTE'"		+ STR_PULA
	cQryAux += "                           WHEN F2_EST     IN ('AM', 'RR', 'AP', 'PA', 'TO', 'RO', 'AC')      THEN 'NORTE'"		+ STR_PULA
	cQryAux += "                           WHEN F2_EST     IN ('MA','PI','CE','RN','PE','PB','SE','AL','BA')  THEN 'NORDESTE' "		+ STR_PULA
	cQryAux += "                           WHEN F2_EST     IN ('SP', 'RJ', 'ES', 'MG')                        THEN 'SUDESTE'  "		+ STR_PULA
	cQryAux += "                           WHEN F2_EST     IN ('PR', 'RS', 'SC')                                  THEN 'SUL'     "		+ STR_PULA
	cQryAux += "                           WHEN F2_EST     IN ('EX') THEN 'EXTERIOR'"		+ STR_PULA
	cQryAux += "                        END"		+ STR_PULA
	cQryAux += "                           AS REGIOES,"		+ STR_PULA
	cQryAux += "                        TRIM (A1_MUN) MUNICIPIO,"		+ STR_PULA
	cQryAux += "                        (CASE F2_EST WHEN 'SP' THEN ' '"		+ STR_PULA
	cQryAux += "                                            ELSE (TRIM (SUBSTR (AA.X5_DESCRI, 2, 7)) || A1_COD_MUN) END)  AS CODIBGEDESTINO,"		+ STR_PULA
	cQryAux += "                        SUM (D1_VALICM) VALORICMS,"		+ STR_PULA
	cQryAux += "                        D1_PICM ALQICMS,"		+ STR_PULA
	cQryAux += "                        D1_ALQIMP5 ALQPIS,"		+ STR_PULA
	cQryAux += "                        SUM (D1_VALIMP5) VALPIS,"		+ STR_PULA
	cQryAux += "                        D1_ALQIMP6 ALQCOF,"		+ STR_PULA
	cQryAux += "                        SUM (D1_VALIMP6) VALCOFINS,"		+ STR_PULA
	cQryAux += "                        (CASE A2_SIMPNAC"		+ STR_PULA
	cQryAux += "                            WHEN '1' THEN 'S'"		+ STR_PULA
	cQryAux += "                            WHEN '2' THEN 'N'"		+ STR_PULA
	cQryAux += "                         END)"		+ STR_PULA
	cQryAux += "                           OPTANTEDOSIMPLES,"		+ STR_PULA
	cQryAux += "                        NVL (F2_XIDTRI, 0) IDTRIANGULACAO,"		+ STR_PULA
	cQryAux += "                        F2_CHVNFE CHAVENFE,"		+ STR_PULA
	cQryAux += "                        F1_CHVNFE CHAVECTE,"		+ STR_PULA
	cQryAux += "                        A1_CGC CNPJCLIENTE,"		+ STR_PULA
	cQryAux += "                        A2_CGC CNPJFORNECEDOR,"		+ STR_PULA
	cQryAux += "                        TO_DATE (TRIM (D1_DTDIGIT), 'YYYYMMDD')"		+ STR_PULA
	cQryAux += "                           DATALANCAMENTOCTE,"		+ STR_PULA
	cQryAux += "                        (CASE F1_FORNECE || F1_LOJA"		+ STR_PULA
	cQryAux += "                            WHEN 'F0307401' THEN 0.001150"		+ STR_PULA
	cQryAux += "                            WHEN 'F0003101' THEN 0.000550"		+ STR_PULA
	cQryAux += "                            WHEN 'F0005002' THEN 0.002200"		+ STR_PULA
	cQryAux += "                            WHEN 'F0254201' THEN 0.001500"		+ STR_PULA
	cQryAux += "                            WHEN 'F0387501' THEN 0.001200"		+ STR_PULA
	cQryAux += "                            WHEN 'F0247501' THEN 0.001000"		+ STR_PULA
	cQryAux += "                            WHEN 'F0005501' THEN 0.002200"		+ STR_PULA
	cQryAux += "                            WHEN 'F0380501' THEN 0.002300"		+ STR_PULA
	cQryAux += "                            WHEN 'F0003803' THEN 0.002000"		+ STR_PULA
	cQryAux += "                            WHEN 'F0430301' THEN 0.001500"		+ STR_PULA
	cQryAux += "                            WHEN 'F0431101' THEN 0.001500"		+ STR_PULA
	cQryAux += "                            WHEN 'F0435701' THEN 0.003500"		+ STR_PULA
	cQryAux += "                            WHEN 'F0452401' THEN 0.001200"		+ STR_PULA
	cQryAux += "                            WHEN 'F0452901' THEN 0.001200"		+ STR_PULA
	cQryAux += "                            WHEN 'F0003801' THEN 0.002000"		+ STR_PULA
	cQryAux += "                            WHEN 'F0005001' THEN 0.002200"		+ STR_PULA
	cQryAux += "                            WHEN 'F0470801' THEN 0.000400"		+ STR_PULA
	cQryAux += "                            WHEN 'F0003801' THEN 0.001900"		+ STR_PULA
	cQryAux += "                            WHEN 'F0003802' THEN 0.001900"		+ STR_PULA
	cQryAux += "                            WHEN 'F0003803' THEN 0.001900"		+ STR_PULA
	cQryAux += "                            WHEN 'F0485901' THEN 0.003400"		+ STR_PULA
	cQryAux += "                            WHEN 'F0485901' THEN 0.003400"		+ STR_PULA
	cQryAux += "                            WHEN 'F0485902' THEN 0.003400"		+ STR_PULA
	cQryAux += "                            WHEN 'F0485903' THEN 0.003400"		+ STR_PULA
	cQryAux += "                            WHEN 'F0485904' THEN 0.003400"		+ STR_PULA
	cQryAux += "                            WHEN 'F0467801' THEN 0.001200"		+ STR_PULA
	cQryAux += "                            WHEN 'F0254202' THEN 0.001500 "		+ STR_PULA
	cQryAux += "                            ELSE 0"		+ STR_PULA
	cQryAux += "                            "		+ STR_PULA
	cQryAux += "                            END) "		+ STR_PULA
	cQryAux += "                           FATORGRIS,"		+ STR_PULA
	cQryAux += "                           F2_TPFRETE AS TIPOFRETE,"		+ STR_PULA
	cQryAux += "                           D1_TES"		+ STR_PULA
	cQryAux += "                           "		+ STR_PULA
	cQryAux += "             FROM  SD2010"		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "                       LEFT JOIN SF2010  ON     SF2010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "                                                AND D2_FILIAL         = F2_FILIAL"		+ STR_PULA
	cQryAux += "                                                AND D2_DOC            = F2_DOC"		+ STR_PULA
	cQryAux += "                                                AND D2_SERIE          = F2_SERIE"		+ STR_PULA
	cQryAux += "                                                AND D2_CLIENTE        = F2_CLIENTE"		+ STR_PULA
	cQryAux += "                                                AND D2_LOJA           = F2_LOJA"		+ STR_PULA
	cQryAux += "                                                AND F2_TIPO           = 'N'"		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "                       LEFT JOIN  SA1010 ON     SA1010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "                                        AND D2_CLIENTE = A1_COD "		+ STR_PULA
	cQryAux += "                                        AND D2_LOJA = A1_LOJA"		+ STR_PULA
	cQryAux += "                "		+ STR_PULA
	cQryAux += "                       LEFT JOIN SD1010  ON SD1010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "                                        AND D2_FILIAL  = D1_FILIAL "		+ STR_PULA
	cQryAux += "                                        AND D2_DOC     = D1_NFORI "		+ STR_PULA
	cQryAux += "                                        AND D2_SERIE   = D1_SERIORI "		+ STR_PULA
	cQryAux += "                                        AND D1_ITEMORI = D2_ITEM"		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "                       LEFT JOIN SF1010  ON SF1010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "                                        AND D1_FILIAL  = F1_FILIAL "		+ STR_PULA
	cQryAux += "                                        AND D1_DOC     = F1_DOC"		+ STR_PULA
	cQryAux += "                                        AND D1_SERIE   = D1_SERIE "		+ STR_PULA
	cQryAux += "                                        AND D1_FORNECE = F1_FORNECE "		+ STR_PULA
	cQryAux += "                                        AND D1_LOJA    = F1_LOJA"		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "                       LEFT JOIN SA2010  ON SA2010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "                                        AND F1_FORNECE = A2_COD"		+ STR_PULA
	cQryAux += "                                        AND F1_LOJA = A2_LOJA"		+ STR_PULA
	cQryAux += "                "		+ STR_PULA
	cQryAux += "                       LEFT JOIN SX5010 AA"		+ STR_PULA
	cQryAux += "                                         ON X5_TABELA = 'AA'"		+ STR_PULA
	cQryAux += "                                        AND AA.X5_CHAVE = A1_EST"		+ STR_PULA
	cQryAux += "                                        AND AA.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "                         "		+ STR_PULA
	cQryAux += "                       LEFT JOIN  DAK010 ON  DAK010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "                                        AND DAK_FILIAL = F2_FILIAL"		+ STR_PULA
	cQryAux += "                                        AND DAK_COD = F2_CARGA"		+ STR_PULA
	cQryAux += "                          "		+ STR_PULA
	cQryAux += "                       RIGHT JOIN SB1010 P ON P.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "                                         AND D2_COD  = P.B1_COD"		+ STR_PULA
	cQryAux += "                                        "		+ STR_PULA
	cQryAux += "                       "		+ STR_PULA
	cQryAux += "                       FULL JOIN SB1010 B ON B.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux += "                                         AND D1_COD = B.B1_COD"		+ STR_PULA
	cQryAux += "                                         "		+ STR_PULA
	cQryAux += "    WHERE       SD2010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "                 AND D2_FILIAL IN ('0102', '0104', '0105')"		+ STR_PULA
	//cQryAux += "                 AND D2_EMISSAO BETWEEN  '20210501' AND '20210531'"		+ STR_PULA
	cQryAux += "                 AND D2_EMISSAO BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	cQryAux += "                 AND D2_FILIAL||D2_TES  NOT IN (SELECT F4_FILIAL||F4_CODIGO FROM SF4010 WHERE SF4010.D_E_L_E_T_=' ' AND F4_PODER3 <>'N')"		+ STR_PULA
	cQryAux += "                 AND F2_TRANSP NOT IN ('000000','000005','  ')"		+ STR_PULA
	cQryAux += "                 AND D2_FILIAL||D2_TES NOT IN ('0102800','0102801')"		+ STR_PULA
	cQryAux += "                 AND F1_TIPO <>'D'"		+ STR_PULA
	//cQryAux += "                 AND F2_CHVNFE = '52210552502507000651550010000450781921295644'"		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "             GROUP BY   D2_DOC,"		+ STR_PULA
	cQryAux += "                        F2_TPFRETE,"		+ STR_PULA
	cQryAux += "                        D2_FILIAL,"		+ STR_PULA
	cQryAux += "                        D2_EMISSAO,"		+ STR_PULA
	cQryAux += "                        F2_CLIENTE,"		+ STR_PULA
	cQryAux += "                        F2_LOJA,"		+ STR_PULA
	cQryAux += "                        A1_NOME,"		+ STR_PULA
	cQryAux += "                        F2_PBRUTO,"		+ STR_PULA
	cQryAux += "                        F2_TRANSP,"		+ STR_PULA
	cQryAux += "                        D1_DTDIGIT,"		+ STR_PULA
	cQryAux += "                        A2_NOME,"		+ STR_PULA
	cQryAux += "                        F1_FORNECE,"		+ STR_PULA
	cQryAux += "                        F1_LOJA,"		+ STR_PULA
	cQryAux += "                        D1_DOC,"		+ STR_PULA
	cQryAux += "                        F2_CARGA,"		+ STR_PULA
	cQryAux += "                        DAK_PTOENT,"		+ STR_PULA
	cQryAux += "                        DAK_PESO,"		+ STR_PULA
	cQryAux += "                        F2_EST,"		+ STR_PULA
	cQryAux += "                        A1_MUN,"		+ STR_PULA
	cQryAux += "                        F1_VALBRUT,"		+ STR_PULA
	cQryAux += "                        A1_COD_MUN,"		+ STR_PULA
	cQryAux += "                        A1_CGC,"		+ STR_PULA
	cQryAux += "                        A1_COD,"		+ STR_PULA
	cQryAux += "                        F2_XIDTRI,"		+ STR_PULA
	cQryAux += "                        A2_CGC,"		+ STR_PULA
	cQryAux += "                        F2_CHVNFE,"		+ STR_PULA
	cQryAux += "                        F1_CHVNFE,"		+ STR_PULA
	cQryAux += "                        A2_SIMPNAC,"		+ STR_PULA
	cQryAux += "                        D1_PICM,"		+ STR_PULA
	cQryAux += "                        D1_ALQIMP5,"		+ STR_PULA
	cQryAux += "                        D1_ALQIMP6,"		+ STR_PULA
	cQryAux += "                        X5_DESCRI,"		+ STR_PULA
	cQryAux += "                        D1_TES) F"		+ STR_PULA
	cQryAux += "         LEFT JOIN"		+ STR_PULA
	cQryAux += "            ZX2010"		+ STR_PULA
	cQryAux += "         ON ZX2010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "            AND UPPER(TRIM(ZX2_ID)) = TRIM(ESTADO)||TRIM(CODIBGEDESTINO)||TRIM(VEICULO)||TRIM(TIPOCARGA)||TRIM(CONDICAO)"		+ STR_PULA

	MemoWrite("C:\temp\RELFRET_v3.sql",cQryAux) //25/05/21
	
	cQryAux := ChangeQuery(cQryAux)
	
	//Executando consulta e setando o total da rï¿½gua
	TCQuery cQryAux New Alias "QRY_AUX"
	Count to nTotal
	oReport:SetMeter(nTotal)
	
	//Enquanto houver dados
	oSectDad:Init()
	QRY_AUX->(DbGoTop())
	While ! QRY_AUX->(Eof())
		//Incrementando a rï¿½gua
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
	
	U_xPutSx1(cPerg,"01","Data  De ?","","","mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Data  Até ?","","","mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")
	
	//Retirado Sangelles 22/03/2022 ->dbSelectArea(_sAlias)

Return()
