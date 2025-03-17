//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELCONFE
Relatório - Relatório de Conferência      
@author TReport
@since 16/06/2020
@version 1.0
	@example
	@obs Função gerada pelo TReport()
	u_RELCONFE()
/*/
	
User Function RELCONFE()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELCONFE"
	
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
	oReport := TReport():New(	"RELCONFE",;		//Nome do Relatório
								"Relatório de Conferência",;		//Título
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
	TRCell():New(oSectDad, "ORIGEM", "QRY_AUX", "Origem", /*Picture*/, 7, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPO", "QRY_AUX", "Tipo", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "IDFILIAL", "QRY_AUX", "Idfilial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTDIGITA", "QRY_AUX", "Dtdigita", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTEMISSAO", "QRY_AUX", "Dtemissao", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ESPECIE", "QRY_AUX", "Especie", /*Picture*/, 5, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DOCUMENTO", "QRY_AUX", "Documento", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "SERIE", "QRY_AUX", "Serie", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FORM_PROPRIO", "QRY_AUX", "Form_proprio", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "IDPARCEIRO", "QRY_AUX", "Idparceiro", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "RAZAO_SOCIAL", "QRY_AUX", "Razao_social", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CNPJ", "QRY_AUX", "Cnpj", /*Picture*/, 14, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ESTADO", "QRY_AUX", "Estado", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "IDIBGE", "QRY_AUX", "Idibge", /*Picture*/, 12, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MUNICIPIO", "QRY_AUX", "Municipio", /*Picture*/, 60, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "IDGRPARCEIROS", "QRY_AUX", "Idgrparceiros", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "IDPRODUTO", "QRY_AUX", "Idproduto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NCM", "QRY_AUX", "Ncm", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PRODUTO", "QRY_AUX", "Produto", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UM", "QRY_AUX", "UM", "@!", 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPOPROD", "QRY_AUX", "Tipoprod", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "IDGRPRODUTOS", "QRY_AUX", "Idgrprodutos", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TES", "QRY_AUX", "TES", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CFOP", "QRY_AUX", "Cfop", /*Picture*/, 5, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LIVROFISCAL", "QRY_AUX", "Livrofiscal", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ESTOQUE", "QRY_AUX", "Estoque", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ANCEIRO", "QRY_AUX", "Financeiro", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TRANSFERENCIA", "QRY_AUX", "Transferencia", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PODER3", "QRY_AUX", "Poder3", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QUANT", "QRY_AUX", "Quant", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VUNIT", "QRY_AUX", "Vunit", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALDESC", "QRY_AUX", "Valdesc", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TOTAL", "QRY_AUX", "Total", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TOTALIQ", "QRY_AUX", "Totaliq", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VLRCONTABIL", "QRY_AUX", "Vlrcontabil", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "SITTRIB", "QRY_AUX", "Sittrib", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ALIQICMS", "QRY_AUX", "Aliqicms", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BASEICM", "QRY_AUX", "Baseicm", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALICM", "QRY_AUX", "Valicm", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ISENTAS", "QRY_AUX", "Isentas", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "OUTRAS", "QRY_AUX", "Outras", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CREDOUT", "QRY_AUX", "Credout", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DIFALIQ", "QRY_AUX", "Difaliq", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "OUTRASIPI", "QRY_AUX", "Outrasipi", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BCICMSST", "QRY_AUX", "Bcicmsst", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ICMSRET", "QRY_AUX", "Icmsret", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ICMSZFC", "QRY_AUX", "Icmszfc", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COSZFC", "QRY_AUX", "Cofinszfc", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PISZFC", "QRY_AUX", "Piszfc", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COD_BC", "QRY_AUX", "Cod_bc", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TBNATREC", "QRY_AUX", "Tbnatrec", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NATREC", "QRY_AUX", "Natrec", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CSTPIS", "QRY_AUX", "Cstpis", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BASEPIS", "QRY_AUX", "Basepis", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ALIQPIS", "QRY_AUX", "Aliqpis", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALPIS", "QRY_AUX", "Valpis", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CSTCOF", "QRY_AUX", "Cstcof", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BASECOF", "QRY_AUX", "Basecof", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ALIQCOF", "QRY_AUX", "Aliqcof", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALCOF", "QRY_AUX", "Valcof", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CSTIPI", "QRY_AUX", "Cstipi", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BASEIPI", "QRY_AUX", "Vlr Outr IPI", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "IPI", "QRY_AUX", "Ipi", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALIPI", "QRY_AUX", "Valipi", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CUSTO", "QRY_AUX", "Custo", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CHVNFE", "QRY_AUX", "Chvnfe", /*Picture*/, 44, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "HISTORICO", "QRY_AUX", "Historico", /*Picture*/, 250, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)

Return oReport


/*??????????????????????????????????????????????????????????????????????????????????
????????????????????????????????????????????????????????????????????????????????????
???????????????????????????????????????????????????????????????????????????????????
???Programa   ? ValPerg()  ? Autor ? Diego Bueno               ? Data ?20/03/2014???
????????????????????????????????????????????????????????????????????????????????J??
???Descricao  ? Cria perguntas no SX1	                                         ???
????????????????????????????????????????????????????????????????????????????????J??
???           ?                                                                  ???
???Observacao ?                                                                  ???
???????????????????????????????????????????????????????????????????????????????????
????????????????????????????????????????????????????????????????????????????????????
??????????????????????????????????????????????????????????????????????????????????*/

Static Function ValPer01()
	_sAlias	:=	Alias()
	//Retirado Sangelles 22/03/2022 ->dbSelectArea("SX1")
	//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
	cPerg 	:=	PADR(cPerg,10)
	
	U_xPutSx1(cPerg,"01","Data Movimento De ?","","","mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Data Movimento Até ?","","","mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"03","Tipo Movimento ?","","","mv_CH3","C",01,0,3,"C","","","","","MV_PAR03","Entrada","","","","Saida","","","Ambos","","","","","","","","",{"",""},{"",""},{"",""})
	U_xPutSx1(cPerg,"04","Filial de  ?","."     ,"." ,"mv_CH4","C",04,0,0,"G","","SM0","","","MV_PAR04","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"05","Filial ate ?","."     ,"." ,"mv_CH5","C",04,0,0,"G","","SM0","","","MV_PAR05","","","","","","","","","","","","","","","","")
	
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
	cQryAux += "SELECT * "		+ STR_PULA
	cQryAux += "FROM   (SELECT 'ENTRADA'                            ORIGEM, "		+ STR_PULA
	cQryAux += "               SD1.D1_TIPO                          TIPO, "		+ STR_PULA
	cQryAux += "               SD1.D1_FILIAL                        AS IDFILIAL, "		+ STR_PULA
	cQryAux += "               TO_DATE (SD1.D1_DTDIGIT, 'YYYYMMDD') AS DTDIGITA, "		+ STR_PULA
	cQryAux += "               TO_DATE (SD1.D1_EMISSAO, 'YYYYMMDD') AS DTEMISSAO, "		+ STR_PULA
	cQryAux += "               TRIM (SFT.FT_ESPECIE)                AS ESPECIE, "		+ STR_PULA
	cQryAux += "               SD1.D1_DOC                           AS DOCUMENTO, "		+ STR_PULA
	cQryAux += "               SD1.D1_SERIE                         AS SERIE,"		+ STR_PULA
	cQryAux += "               SD1.D1_FORMUL                        AS FORM_PROPRIO,"		+ STR_PULA
	cQryAux += "               SD1.D1_FORNECE||SD1.D1_LOJA          AS IDPARCEIRO,  "		+ STR_PULA
	cQryAux += "               ( CASE SUBSTR(D1_FORNECE, 1, 1) "		+ STR_PULA
	cQryAux += "                   WHEN 'C' THEN TRIM(SA1.A1_NOME) "		+ STR_PULA
	cQryAux += "                   ELSE TRIM(SA2.A2_NOME) "		+ STR_PULA
	cQryAux += "                 END )                              AS RAZAO_SOCIAL, "		+ STR_PULA
	cQryAux += "               ( CASE SUBSTR(D1_FORNECE, 1, 1) "		+ STR_PULA
	cQryAux += "                   WHEN 'C' THEN TRIM(SA1.A1_CGC) "		+ STR_PULA
	cQryAux += "                   ELSE TRIM(SA2.A2_CGC) "		+ STR_PULA
	cQryAux += "                 END )                              AS CNPJ, "		+ STR_PULA
	cQryAux += "               ( CASE SUBSTR(D1_FORNECE, 1, 1) "		+ STR_PULA
	cQryAux += "                   WHEN 'C' THEN TRIM(SA1.A1_EST) "		+ STR_PULA
	cQryAux += "                   ELSE TRIM(SA2.A2_EST) "		+ STR_PULA
	cQryAux += "                 END )                              AS ESTADO,"		+ STR_PULA
	cQryAux += "               ( CASE SUBSTR(D1_FORNECE, 1, 1) "		+ STR_PULA
	cQryAux += "                   WHEN 'C' THEN ( TRIM(SUBSTR(AC.X5_DESCRI,2,7)) "		+ STR_PULA
	cQryAux += "       ||SA1.A1_COD_MUN) "		+ STR_PULA
	cQryAux += "                   ELSE ( TRIM(SUBSTR(AF.X5_DESCRI,2,7)) "		+ STR_PULA
	cQryAux += "       ||SA2.A2_COD_MUN) "		+ STR_PULA
	cQryAux += "                 END )                              AS IDIBGE, "		+ STR_PULA
	cQryAux += "               ( CASE SUBSTR(D1_FORNECE, 1, 1) "		+ STR_PULA
	cQryAux += "                   WHEN 'C' THEN TRIM(SA1.A1_MUN) "		+ STR_PULA
	cQryAux += "                   ELSE TRIM(SA2.A2_MUN) "		+ STR_PULA
	cQryAux += "                 END )                              AS MUNICIPIO,"		+ STR_PULA
	cQryAux += "              ( CASE SUBSTR(D1_FORNECE, 1, 1) "		+ STR_PULA
	cQryAux += "                   WHEN 'C' THEN SA1.A1_GRPTRIB"		+ STR_PULA
	cQryAux += "                   ELSE SA2.A2_GRPTRIB "		+ STR_PULA
	cQryAux += "                 END )                              AS IDGRPARCEIROS,"		+ STR_PULA
	cQryAux += "               TRIM (SD1.D1_COD)                    AS IDPRODUTO,"		+ STR_PULA
	cQryAux += "               TRIM(SB1.B1_POSIPI)                  AS NCM,"		+ STR_PULA
	cQryAux += "               TRIM (SB1.B1_DESC)                   AS PRODUTO, "		+ STR_PULA
	cQryAux += "               TRIM (SB1.B1_UM)                     AS UM, "		+ STR_PULA
	cQryAux += "               TRIM (SB1.B1_TIPO)                   AS TIPOPROD,"		+ STR_PULA
	cQryAux += "               TRIM(SB1.B1_GRTRIB)                  AS IDGRPRODUTOS,"		+ STR_PULA
	cQryAux += "               TRIM (SFT.FT_TES)                    AS TES, "		+ STR_PULA
	cQryAux += "               TRIM (SFT.FT_CFOP)                   AS CFOP, "		+ STR_PULA
	cQryAux += "               SF4.F4_LFICM                         AS LIVROFISCAL,             "		+ STR_PULA
	cQryAux += "               SFT.FT_ESTOQUE                       AS ESTOQUE,"		+ STR_PULA
	cQryAux += "               SF4.F4_DUPLIC                        AS ANCEIRO,             "		+ STR_PULA
	cQryAux += "               CASE (SF4.F4_TRANFIL)"		+ STR_PULA
	cQryAux += "                    WHEN '1' THEN 'S'"		+ STR_PULA
	cQryAux += "                    ELSE 'N'"		+ STR_PULA
	cQryAux += "                END                                 AS TRANSFERENCIA,"		+ STR_PULA
	cQryAux += "               SF4.F4_PODER3                        AS PODER3,   "		+ STR_PULA
	cQryAux += "               SD1.D1_QUANT                         AS QUANT, "		+ STR_PULA
	cQryAux += "               SD1.D1_VUNIT                         AS VUNIT, "		+ STR_PULA
	cQryAux += "               SD1.D1_VALDESC                       AS VALDESC, "		+ STR_PULA
	cQryAux += "               (SD1.D1_TOTAL + SD1.D1_DESCZFR)      AS TOTAL, "		+ STR_PULA
	cQryAux += "               (SD1.D1_TOTAL - SD1.D1_VALDESC + SD1.D1_DESPESA)    AS TOTALIQ,"		+ STR_PULA
	cQryAux += "               SFT.FT_VALCONT                       AS VLRCONTABIL,"		+ STR_PULA
	cQryAux += "               SFT.FT_CLASFIS                       AS SITTRIB,"		+ STR_PULA
	cQryAux += "               SFT.FT_ALIQICM                       AS ALIQICMS,  "		+ STR_PULA
	cQryAux += "               SFT.FT_BASEICM                       AS BASEICM, "		+ STR_PULA
	cQryAux += "               SFT.FT_VALICM                        AS VALICM,"		+ STR_PULA
	cQryAux += "               SFT.FT_ISENICM                       AS ISENTAS, "		+ STR_PULA
	cQryAux += "               SFT.FT_OUTRICM                       AS OUTRAS,"		+ STR_PULA
	cQryAux += "               SFT.FT_CRDPRES                       AS CREDOUT,"		+ STR_PULA
	cQryAux += "               SFT.FT_ICMSCOM                       AS DIFALIQ,"		+ STR_PULA
	cQryAux += "               SFT.FT_OUTRIPI                       AS OUTRASIPI, "		+ STR_PULA
	cQryAux += "               SFT.FT_BASERET                       AS BCICMSST, "		+ STR_PULA
	cQryAux += "               SFT.FT_ICMSRET                       AS ICMSRET,"		+ STR_PULA
	cQryAux += "               (SD1.D1_DESCZFR - SD1.D1_DESCZFC - SD1.D1_DESCZFP)  AS ICMSZFC, "		+ STR_PULA
	cQryAux += "               SD1.D1_DESCZFC                       AS COSZFC, "		+ STR_PULA
	cQryAux += "               SD1.D1_DESCZFP                       AS PISZFC, "		+ STR_PULA
	cQryAux += "               SFT.FT_CODBCC                        AS COD_BC,"		+ STR_PULA
	cQryAux += "               ' '                                  AS TBNATREC,"		+ STR_PULA
	cQryAux += "               ' '                                  AS NATREC,               "		+ STR_PULA
	cQryAux += "               SFT.FT_CSTPIS                        AS CSTPIS, "		+ STR_PULA
	cQryAux += "               SFT.FT_BASEPIS                       AS BASEPIS, "		+ STR_PULA
	cQryAux += "               SFT.FT_ALIQPIS                       AS ALIQPIS, "		+ STR_PULA
	cQryAux += "               SFT.FT_VALPIS                        AS VALPIS, "		+ STR_PULA
	cQryAux += "               SFT.FT_CSTCOF                        AS CSTCOF, "		+ STR_PULA
	cQryAux += "               SFT.FT_BASECOF                       AS BASECOF, "		+ STR_PULA
	cQryAux += "               SFT.FT_ALIQCOF                       AS ALIQCOF, "		+ STR_PULA
	cQryAux += "               SFT.FT_VALCOF                        AS VALCOF, "		+ STR_PULA
	cQryAux += "               SFT.FT_CTIPI                         AS CSTIPI, "		+ STR_PULA
	cQryAux += "               SD1.D1_BASEIPI                       AS BASEIPI, "		+ STR_PULA
	cQryAux += "               SD1.D1_IPI                           AS IPI, "		+ STR_PULA
	cQryAux += "               SD1.D1_VALIPI                        AS VALIPI, "		+ STR_PULA
	cQryAux += "               D1_CUSTO                             AS CUSTO, "		+ STR_PULA
	cQryAux += "               TRIM (SFT.FT_CHVNFE)                 AS CHVNFE,"		+ STR_PULA
	cQryAux += "               TRIM(SF1.F1_MENNOTA)                 AS HISTORICO"		+ STR_PULA
	cQryAux += "        FROM   SD1010 SD1 "		+ STR_PULA
	cQryAux += "               LEFT JOIN SF1010 SF1 "		+ STR_PULA
	cQryAux += "                      ON SF1.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                         AND SF1.F1_FILIAL = SD1.D1_FILIAL "		+ STR_PULA
	cQryAux += "                         AND SF1.F1_DOC = SD1.D1_DOC "		+ STR_PULA
	cQryAux += "                         AND SF1.F1_SERIE = SD1.D1_SERIE "		+ STR_PULA
	cQryAux += "                         AND SF1.F1_FORNECE = SD1.D1_FORNECE "		+ STR_PULA
	cQryAux += "                         AND SF1.F1_LOJA = SD1.D1_LOJA "		+ STR_PULA
	cQryAux += "               LEFT JOIN SA2010 SA2 "		+ STR_PULA
	cQryAux += "                      ON SA2.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                         AND SA2.A2_COD = SD1.D1_FORNECE "		+ STR_PULA
	cQryAux += "                         AND SA2.A2_LOJA = SD1.D1_LOJA "		+ STR_PULA
	cQryAux += "               LEFT JOIN SA1010 SA1 "		+ STR_PULA
	cQryAux += "                      ON SA1.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                         AND SA1.A1_COD = SD1.D1_FORNECE "		+ STR_PULA
	cQryAux += "                         AND SA1.A1_LOJA = SD1.D1_LOJA "		+ STR_PULA
	cQryAux += "               LEFT JOIN SX5010 AC "		+ STR_PULA
	cQryAux += "                      ON AC.X5_TABELA = 'AA' "		+ STR_PULA
	cQryAux += "                         AND AC.X5_CHAVE = SA1.A1_EST "		+ STR_PULA
	cQryAux += "                         AND AC.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "               LEFT JOIN SX5010 AF "		+ STR_PULA
	cQryAux += "                      ON AF.X5_TABELA = 'AA' "		+ STR_PULA
	cQryAux += "                         AND AF.X5_CHAVE = SA2.A2_EST "		+ STR_PULA
	cQryAux += "                         AND AF.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "               LEFT JOIN SB1010 SB1 "		+ STR_PULA
	cQryAux += "                      ON SB1.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                         AND SB1.B1_COD = SD1.D1_COD "		+ STR_PULA
	cQryAux += "               LEFT JOIN SBM010 SBM "		+ STR_PULA
	cQryAux += "                      ON SBM.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                         AND SBM.BM_GRUPO = SB1.B1_GRUPO "		+ STR_PULA
	cQryAux += "               LEFT JOIN SF4010 SF4 "		+ STR_PULA
	cQryAux += "                      ON SF4.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                         AND SF4.F4_CODIGO = SD1.D1_TES "		+ STR_PULA
	cQryAux += "                         AND SF4.F4_FILIAL = SD1.D1_FILIAL "		+ STR_PULA
	cQryAux += "               LEFT JOIN SFT010 SFT "		+ STR_PULA
	cQryAux += "                      ON SFT.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                         AND SFT.FT_PRODUTO = SD1.D1_COD "		+ STR_PULA
	cQryAux += "                         AND SFT.FT_NFISCAL = SD1.D1_DOC "		+ STR_PULA
	cQryAux += "                         AND SFT.FT_FILIAL = SD1.D1_FILIAL "		+ STR_PULA
	cQryAux += "                         AND SFT.FT_SERIE = SD1.D1_SERIE "		+ STR_PULA
	cQryAux += "                         AND SFT.FT_CLIEFOR "		+ STR_PULA
	cQryAux += "                             || SFT.FT_LOJA = SD1.D1_FORNECE "		+ STR_PULA
	cQryAux += "                                              || SD1.D1_LOJA "		+ STR_PULA
	cQryAux += "                         AND SFT.FT_ITEM = SD1.D1_ITEM "		+ STR_PULA
	cQryAux += "        WHERE  SD1.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "AND       TO_DATE(TRIM(SD1.D1_DTDIGIT), 'YYYYMMDD') BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	//cQryAux += "AND       TO_DATE(TRIM(SD1.D1_DTDIGIT), 'YYYYMMDD') BETWEEN '20210601' AND '20210601' 	"		+ STR_PULA
	cQryAux += "        UNION ALL "		+ STR_PULA
	cQryAux += "        SELECT 'SAIDA'                              ORIGEM, "		+ STR_PULA
	cQryAux += "               SD2.D2_TIPO                          TIPO, "		+ STR_PULA
	cQryAux += "               SD2.D2_FILIAL                        AS IDFILIAL, "		+ STR_PULA
	cQryAux += "               TO_DATE (SD2.D2_EMISSAO, 'YYYYMMDD') AS DTDIGITA, "		+ STR_PULA
	cQryAux += "               TO_DATE (SD2.D2_EMISSAO, 'YYYYMMDD') AS EMISSAO, "		+ STR_PULA
	cQryAux += "               TRIM (SFT.FT_ESPECIE)                AS ESPECIE, "		+ STR_PULA
	cQryAux += "               SD2.D2_DOC                           AS DOCUMENTO, "		+ STR_PULA
	cQryAux += "               SD2.D2_SERIE                         AS SERIE, "		+ STR_PULA
	cQryAux += "               SD2.D2_FORMUL                        AS FORM_PROPRIO,"		+ STR_PULA
	cQryAux += "               SF2.F2_CLIENTE||SF2.F2_LOJA          AS IDPARCEIRO, "		+ STR_PULA
	cQryAux += "               ( CASE SUBSTR(D2_CLIENTE, 1, 1) "		+ STR_PULA
	cQryAux += "                   WHEN 'C' THEN TRIM(SA1.A1_NOME) "		+ STR_PULA
	cQryAux += "                   ELSE TRIM(SA2.A2_NOME) "		+ STR_PULA
	cQryAux += "                 END )                              AS RAZAO_SOCIAL, "		+ STR_PULA
	cQryAux += "               ( CASE SUBSTR(D2_CLIENTE, 1, 1) "		+ STR_PULA
	cQryAux += "                   WHEN 'C' THEN TRIM(SA1.A1_CGC) "		+ STR_PULA
	cQryAux += "                   ELSE TRIM(SA2.A2_CGC) "		+ STR_PULA
	cQryAux += "                 END )                              AS CNPJ, "		+ STR_PULA
	cQryAux += "               ( CASE SUBSTR(D2_CLIENTE, 1, 1) "		+ STR_PULA
	cQryAux += "                   WHEN 'C' THEN TRIM(SA1.A1_EST) "		+ STR_PULA
	cQryAux += "                   ELSE TRIM(SA2.A2_EST) "		+ STR_PULA
	cQryAux += "                 END )                              AS ESTADO,"		+ STR_PULA
	cQryAux += "               ( CASE SUBSTR(D2_CLIENTE, 1, 1) "		+ STR_PULA
	cQryAux += "                   WHEN 'C' THEN ( TRIM(SUBSTR(AC.X5_DESCRI,2,7)) "		+ STR_PULA
	cQryAux += "       ||SA1.A1_COD_MUN) "		+ STR_PULA
	cQryAux += "                   ELSE ( TRIM(SUBSTR(AF.X5_DESCRI,2,7)) "		+ STR_PULA
	cQryAux += "       ||SA2.A2_COD_MUN) "		+ STR_PULA
	cQryAux += "                 END )"		+ STR_PULA
	cQryAux += "                                                    AS IDIBGE,   "		+ STR_PULA
	cQryAux += "               ( CASE SUBSTR(D2_CLIENTE, 1, 1) "		+ STR_PULA
	cQryAux += "                   WHEN 'C' THEN TRIM(SA1.A1_MUN) "		+ STR_PULA
	cQryAux += "                   ELSE TRIM(SA2.A2_MUN) "		+ STR_PULA
	cQryAux += "                 END )                              AS MUNICIPIO,"		+ STR_PULA
	cQryAux += "               ( CASE SUBSTR(D2_CLIENTE, 1, 1) "		+ STR_PULA
	cQryAux += "                   WHEN 'C' THEN SA1.A1_GRPTRIB"		+ STR_PULA
	cQryAux += "                   ELSE SA2.A2_GRPTRIB "		+ STR_PULA
	cQryAux += "                 END )                              AS IDGRPARCEIROS,"		+ STR_PULA
	cQryAux += "               TRIM (SD2.D2_COD)                    AS IDPRODUTO,"		+ STR_PULA
	cQryAux += "               TRIM(SB1.B1_POSIPI)                  AS NCM,"		+ STR_PULA
	cQryAux += "               TRIM (SB1.B1_DESC)                   AS PRODUTO, "		+ STR_PULA
	cQryAux += "               TRIM (SB1.B1_UM)                     AS UM, "		+ STR_PULA
	cQryAux += "               TRIM (SB1.B1_TIPO)                   AS TIPOPROD,"		+ STR_PULA
	cQryAux += "               TRIM(SB1.B1_GRTRIB)                  AS IDGRPRODUTOS,"		+ STR_PULA
	cQryAux += "               TRIM (SFT.FT_TES)                    AS TES, "		+ STR_PULA
	cQryAux += "               TRIM (SFT.FT_CFOP)                   AS CFOP, "		+ STR_PULA
	cQryAux += "               SF4.F4_LFICM                         AS LIVROFISCAL,             "		+ STR_PULA
	cQryAux += "               SFT.FT_ESTOQUE                       AS ESTOQUE,"		+ STR_PULA
	cQryAux += "               SF4.F4_DUPLIC                        AS ANCEIRO,"		+ STR_PULA
	cQryAux += "                 CASE (SF4.F4_TRANFIL)"		+ STR_PULA
	cQryAux += "                    WHEN '1' THEN 'S'"		+ STR_PULA
	cQryAux += "                    ELSE 'N'"		+ STR_PULA
	cQryAux += "                END                                 AS TRANSFERENCIA,"		+ STR_PULA
	cQryAux += "               SF4.F4_PODER3                        AS PODER3,  "		+ STR_PULA
	cQryAux += "               ( SD2.D2_QUANT )                     AS QUANT, "		+ STR_PULA
	cQryAux += "               ( SD2.D2_PRCVEN )                    AS VUNIT, "		+ STR_PULA
	cQryAux += "               SD2.D2_DESCON                        AS VALDESC, "		+ STR_PULA
	cQryAux += "               (SD2.D2_TOTAL + SD2.D2_DESCZFR)      AS TOTAL, "		+ STR_PULA
	cQryAux += "               (SD2.D2_TOTAL - SD2.D2_DESCON + SD2.D2_DESPESA)     AS TOTALIQ,"		+ STR_PULA
	cQryAux += "               SFT.FT_VALCONT                       AS VLRCONTABIL,"		+ STR_PULA
	cQryAux += "               SFT.FT_CLASFIS                       AS SITTRIB,"		+ STR_PULA
	cQryAux += "               SFT.FT_ALIQICM                       AS ALIQICMS,  "		+ STR_PULA
	cQryAux += "               SFT.FT_BASEICM                       AS BASEICM, "		+ STR_PULA
	cQryAux += "               SFT.FT_VALICM                        AS VALICM,"		+ STR_PULA
	cQryAux += "               SFT.FT_ISENICM                       AS ISENTAS, "		+ STR_PULA
	cQryAux += "               SFT.FT_OUTRICM                       AS OUTRAS,"		+ STR_PULA
	cQryAux += "               SFT.FT_CROUTGO                       AS CREDOUT,"		+ STR_PULA
	cQryAux += "               SFT.FT_ICMSCOM                       AS DIFALIQ,"		+ STR_PULA
	cQryAux += "               SFT.FT_OUTRIPI                       AS OUTRASIPI, "		+ STR_PULA
	cQryAux += "               SFT.FT_BASERET                       AS BCICMSST, "		+ STR_PULA
	cQryAux += "               SFT.FT_ICMSRET                       AS ICMSRET,"		+ STR_PULA
	cQryAux += "               (SD2.D2_DESCZFR - SD2.D2_DESCZFC - SD2.D2_DESCZFP)  AS ICMSZFC, "		+ STR_PULA
	cQryAux += "               SD2.D2_DESCZFC                       AS COSZFC, "		+ STR_PULA
	cQryAux += "               SD2.D2_DESCZFP                       AS PISZFC, "		+ STR_PULA
	cQryAux += "               ' '                                  AS COD_BC,"		+ STR_PULA
	cQryAux += "               ( CASE WHEN F4_TNATREC = ' ' "		+ STR_PULA
	cQryAux += "                   THEN B1_TNATREC"		+ STR_PULA
	cQryAux += "                   ELSE F4_TNATREC"		+ STR_PULA
	cQryAux += "                END)                                AS TBNATREC,"		+ STR_PULA
	cQryAux += "               ( CASE WHEN F4_CNATREC = ' ' "		+ STR_PULA
	cQryAux += "                   THEN B1_CNATREC"		+ STR_PULA
	cQryAux += "                   ELSE F4_CNATREC"		+ STR_PULA
	cQryAux += "                END)                                AS NATREC,"		+ STR_PULA
	cQryAux += "               SFT.FT_CSTPIS                        AS CSTPIS, "		+ STR_PULA
	cQryAux += "               ( SFT.FT_BASEPIS )                   AS BASEPIS, "		+ STR_PULA
	cQryAux += "               SFT.FT_ALIQPIS                       AS ALIQPIS, "		+ STR_PULA
	cQryAux += "               ( SFT.FT_VALPIS )                    AS VALPIS, "		+ STR_PULA
	cQryAux += "               SFT.FT_CSTCOF                        AS CSTCOF, "		+ STR_PULA
	cQryAux += "               ( SFT.FT_BASECOF )                   AS BASECOF, "		+ STR_PULA
	cQryAux += "               SFT.FT_ALIQCOF                       AS ALIQCOF, "		+ STR_PULA
	cQryAux += "               ( SFT.FT_VALCOF )                    AS VALCOF, "		+ STR_PULA
	cQryAux += "               SFT.FT_CTIPI                         AS CSTIPI, "		+ STR_PULA
	cQryAux += "               ( SD2.D2_BASEIPI )                   AS BASEIPI, "		+ STR_PULA
	cQryAux += "               SD2.D2_IPI                           AS IPI, "		+ STR_PULA
	cQryAux += "               ( SD2.D2_VALIPI )                    AS VALIPI, "		+ STR_PULA
	cQryAux += "               ( D2_CUSTO1 )                        AS CUSTO, "		+ STR_PULA
	cQryAux += "               TRIM (SFT.FT_CHVNFE)                 AS CHVNFE,"		+ STR_PULA
	cQryAux += "               TRIM(SF2.F2_MENNOTA)                 AS HISTORICO"		+ STR_PULA
	cQryAux += "        FROM   SD2010 SD2 "		+ STR_PULA
	cQryAux += "               LEFT JOIN SF2010 SF2 "		+ STR_PULA
	cQryAux += "                      ON SF2.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                         AND SF2.F2_FILIAL = SD2.D2_FILIAL "		+ STR_PULA
	cQryAux += "                         AND SF2.F2_DOC = SD2.D2_DOC "		+ STR_PULA
	cQryAux += "                         AND SF2.F2_SERIE = SD2.D2_SERIE "		+ STR_PULA
	cQryAux += "                         AND SF2.F2_CLIENTE = SD2.D2_CLIENTE "		+ STR_PULA
	cQryAux += "                         AND SF2.F2_LOJA = SD2.D2_LOJA "		+ STR_PULA
	cQryAux += "               LEFT JOIN SA1010 SA1 "		+ STR_PULA
	cQryAux += "                      ON SA1.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                         AND SA1.A1_COD = F2_CLIENTE "		+ STR_PULA
	cQryAux += "                         AND SA1.A1_LOJA = F2_LOJA "		+ STR_PULA
	cQryAux += "               LEFT JOIN SA2010 SA2 "		+ STR_PULA
	cQryAux += "                      ON SA2.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                         AND SA2.A2_COD = F2_CLIENTE "		+ STR_PULA
	cQryAux += "                         AND SA2.A2_LOJA = F2_LOJA"		+ STR_PULA
	cQryAux += "               LEFT JOIN SX5010 AC "		+ STR_PULA
	cQryAux += "                      ON AC.X5_TABELA = 'AA' "		+ STR_PULA
	cQryAux += "                         AND AC.X5_CHAVE = SA1.A1_EST "		+ STR_PULA
	cQryAux += "                         AND AC.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "               LEFT JOIN SX5010 AF "		+ STR_PULA
	cQryAux += "                      ON AF.X5_TABELA = 'AA' "		+ STR_PULA
	cQryAux += "                         AND AF.X5_CHAVE = SA2.A2_EST "		+ STR_PULA
	cQryAux += "                         AND AF.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "               LEFT JOIN SB1010 SB1 "		+ STR_PULA
	cQryAux += "                      ON SB1.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                         AND SB1.B1_COD = SD2.D2_COD "		+ STR_PULA
	cQryAux += "               LEFT JOIN SBM010 SBM "		+ STR_PULA
	cQryAux += "                      ON SBM.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                         AND SBM.BM_GRUPO = SB1.B1_GRUPO "		+ STR_PULA
	cQryAux += "               LEFT JOIN SF4010 SF4 "		+ STR_PULA
	cQryAux += "                      ON SF4.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                         AND SF4.F4_CODIGO = SD2.D2_TES "		+ STR_PULA
	cQryAux += "                         AND SF4.F4_FILIAL = SD2.D2_FILIAL "		+ STR_PULA
	cQryAux += "               LEFT JOIN SFT010 SFT "		+ STR_PULA
	cQryAux += "                      ON SFT.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                         AND SFT.FT_PRODUTO = SD2.D2_COD "		+ STR_PULA
	cQryAux += "                         AND SFT.FT_NFISCAL = SD2.D2_DOC "		+ STR_PULA
	cQryAux += "                         AND SFT.FT_FILIAL = SD2.D2_FILIAL "		+ STR_PULA
	cQryAux += "                         AND SFT.FT_SERIE = SD2.D2_SERIE "		+ STR_PULA
	cQryAux += "                         AND SFT.FT_CLIEFOR = SD2.D2_CLIENTE "		+ STR_PULA
	cQryAux += "                         AND SFT.FT_LOJA = SD2.D2_LOJA "		+ STR_PULA
	cQryAux += "                         AND SFT.FT_ITEM = SD2.D2_ITEM "		+ STR_PULA
	cQryAux += "                         AND SFT.FT_CHVNFE = SF2.F2_CHVNFE "		+ STR_PULA
	cQryAux += "        WHERE  SD2.D_E_L_E_T_ <> '*' "		+ STR_PULA
	//cQryAux += "AND       TO_DATE(TRIM(SD2.D2_EMISSAO), 'YYYYMMDD') BETWEEN '20210601' AND '20210601')  "		+ STR_PULA
	//cQryAux += "WHERE B.ORIGEM = 'ENTRADA'"		+ STR_PULA
	//cQryAux += "AND       TO_DATE(TRIM(SD2.D2_EMISSAO), 'YYYYMMDD') BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	)" + STR_PULA
	cQryAux += "AND       TO_DATE(TRIM(SD2.D2_EMISSAO), 'YYYYMMDD') BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' ) C" + STR_PULA
	If (MV_PAR03 == 1)
		cQryAux += "        WHERE C.ORIGEM  = 'ENTRADA' "		+ STR_PULA
		cQryAux += " 	   	AND C.IDFILIAL BETWEEN '" + MV_PAR04 +"' AND '"+ MV_PAR05 +"' 	" 
	ElseIf  (MV_PAR03 == 2)
		cQryAux += "        WHERE C.ORIGEM  = 'SAIDA' "		+ STR_PULA
		cQryAux += " 	   	AND C.IDFILIAL BETWEEN '" + MV_PAR04 +"' AND '"+ MV_PAR05 +"' 	" 	
	Else
		cQryAux += " 	   		WHERE C.IDFILIAL BETWEEN '" + MV_PAR04 +"' AND '"+ MV_PAR05 +"' 	" 
	EndIf
	
	MemoWrite("C:\teste\RELCONFE_V4.sql",cQryAux) //12/07/2021

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
