//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELCOMER
Whintor - 8120 - Análise Comercial            
@author TReport
@since 10/08/2020
@version 1.0
	@example
	u_RELCOMER()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELCOMER()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELCOMER"
	
	//////////////////////////////////////////////////////////////////////////
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
	Local oBreak := Nil
	
	//Criação do componente de impressão
	oReport := TReport():New(	"RELCOMER",;		//Nome do Relatório
								"8120 - Análise Comercial",;		//Título
								cPerg,;		//Pergunte ... Se eu defino a pergunta aqui, será impresso uma página com os parâmetros, conforme privilégio 101
								{|oReport| fRepPrint(oReport)},;		//Bloco de código que será executado na confirmação da impressão
								)		//Descrição
	oReport:SetTotalInLine(.F.)
	oReport:lParamPage := .F.
	oReport:oPage:SetPaperSize(9) //Folha A4
	oReport:SetPortrait()
	oReport:SetLineHeight(60)
	oReport:nFontBody := 9
	
	//Criando a seção de dados
	oSectDad := TRSection():New(	oReport,;		//Objeto TReport que a seção pertence
									"Análise Comercial",;		//Descrição da seção
									{"QRY_AUX"})		//Tabelas utilizadas, a primeira será considerada como principal da seção
	oSectDad:SetTotalInLine(.F.)  //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
	//Colunas do relatório
	TRCell():New(oSectDad, "NUMPEDPROTHEUS", "QRY_AUX", "Numpedprotheus", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NR_PEDIDO", "QRY_AUX", "Nr. pedido", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DATA_PEDIDO", "QRY_AUX", "Data pedido", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ANO_PEDIDO", "QRY_AUX", "Ano pedido", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MES_PEDIDO", "QRY_AUX", "Mes pedido", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "STATUS_PEDIDO", "QRY_AUX", "Status pedido", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COD_CLIENTE", "QRY_AUX", "Cod. cliente", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CLIENTE", "QRY_AUX", "Cliente", /*Picture*/, 60, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "GRUPO_ECONOMICO", "QRY_AUX", "Grupo Economico", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FANTASIA", "QRY_AUX", "Fantasia", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COD_SEG_MERCADO", "QRY_AUX", "Cod. Seg. Mercado", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "SEG_MERCADO", "QRY_AUX", "Seg. Mercado", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ENDERECO", "QRY_AUX", "Endereço", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BAIRRO", "QRY_AUX", "Bairro", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MUNICIPIO", "QRY_AUX", "Municipio", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UF", "QRY_AUX", "UF", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COD_VENDEDOR", "QRY_AUX", "Cod. Vendedor", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOME_VENDEDOR", "QRY_AUX", "Nome Vendedor", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPO_VENDEDOR", "QRY_AUX", "Tipo Vendedor", /*Picture*/, 13, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COD_AREA", "QRY_AUX", "Cod. Area", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "GE_AREA", "QRY_AUX", "Ger. Area", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COD_REGIAO", "QRY_AUX", "Cod. Regiao", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "GER_REGIONAL", "QRY_AUX", "Ger. Regional", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COD_PRODUTO", "QRY_AUX", "Cod. Produto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PRODUTO", "QRY_AUX", "Produto", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COD_LINHA", "QRY_AUX", "Cod. Linha", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LINHA_PRODUTO", "QRY_AUX", "Linha Produto", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QT_UN_CX", "QRY_AUX", "Qt.(UN/CX)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PESO_BRUTO_KG_CX", "QRY_AUX", "Peso Bruto(KG/CX)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NR_NF_E", "QRY_AUX", "Nr. NE-e", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DT_NF_E", "QRY_AUX", "Dt. NE-e", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MES_NF_E", "QRY_AUX", "Mes NF-e", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ANO_NF_E", "QRY_AUX", "Ano NF-e", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "POSICAO_NF_E", "QRY_AUX", "Posicao NF-e", /*Picture*/, 14, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DT_CANCEL_NF_E", "QRY_AUX", "Dt. Cancel NF-e", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COD_PLANO_PAGTO", "QRY_AUX", "Cod. Plano Pagto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PLANO_PAGTO", "QRY_AUX", "Plano Pagto", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NR_DIAS_EFETIVO", "QRY_AUX", "Nr. dias efetivo", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENDA_BRUTA_RS", "QRY_AUX", "Venda Bruta R$", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENDA_S_ST_RS", "QRY_AUX", "Venda S/ST(R$)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENDA_NET_RS", "QRY_AUX", "Venda Net(R$)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENDA_CX", "QRY_AUX", "VENDA(CX)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENDA_KG", "QRY_AUX", "VENDA(KG)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENDA_UN", "QRY_AUX", "VENDA(UN)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR_ST_CX", "QRY_AUX", "VALOR ST(CX)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR_ICMS_CX", "QRY_AUX", "VALOR ICMS(CX)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR_PIS_CX", "QRY_AUX", "VALOR PIS(CX)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR_COFINS_CX", "QRY_AUX", "VALOR COFINS(CX)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR_SUFRAMA_CX", "QRY_AUX", "VALOR SUFRAMA(CX)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR_DESC_FRETE_CX", "QRY_AUX", "VALOR DESC. FRETE(CX)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PERC_PLANO_FINANC", "QRY_AUX", "PERC. PLANO FINANC.", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR_PLANO_FINANC", "QRY_AUX", "VALOR PLANO FINANC.", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR_VBC_CX", "QRY_AUX", "VALOR VBC(CX)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR_CTR_CX", "QRY_AUX", "VALOR CTR(CX)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CODIGO_PRODUTO", "QRY_AUX", "Codigo Produto", /*Picture*/, 0, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CODIGO_RCA", "QRY_AUX", "Codigo Rca", /*Picture*/, 0, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DATA_META", "QRY_AUX", "Data Meta", /*Picture*/, 0, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR_META", "QRY_AUX", "Valor Meta", /*Picture*/, 0, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QUANTIDADE_META", "QRY_AUX", "Quantidade Meta", /*Picture*/, 0, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PESO_META", "QRY_AUX", "Peso Meta", /*Picture*/, 0, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VLVERBA", "QRY_AUX", "Vlverba", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VLVERBALIQ", "QRY_AUX", "Vlverbaliq", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DIFVERBALIQ", "QRY_AUX", "Difverbaliq", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VLTXVENDAVERBA", "QRY_AUX", "Vltxvendaverba", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TXVENDAVERBA", "QRY_AUX", "Txvendaverba", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VLPERCOM", "QRY_AUX", "Vlpercom", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PERCOM", "QRY_AUX", "Percom", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VLPERCICM", "QRY_AUX", "Vlpercicm", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PERCICM", "QRY_AUX", "Percicm", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VLPERPIS", "QRY_AUX", "Vlperpis", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PERPIS", "QRY_AUX", "Perpis", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VLPERCOFINS", "QRY_AUX", "Vlpercofins", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PERCOFINS", "QRY_AUX", "Percofins", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CGCENT", "QRY_AUX", "Cgcent", /*Picture*/, 18, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FAIXA", "QRY_AUX", "Faixa", /*Picture*/, 16, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTULTCOMP", "QRY_AUX", "Dtultcomp", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTMAXVENCTITULO", "QRY_AUX", "Dtmaxvenctitulo", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PRECO_DA_CONTROLADORIA", "QRY_AUX", "Preço da Controladoria", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PRECO_DE_VENDA_S_ST_RS", "QRY_AUX", "Preço de Venda S/ST(R$)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PREVFATURAMENTO", "QRY_AUX", "Prevfaturamento", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FILIAL_ESTOQUE", "QRY_AUX", "Filial Estoque", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FILIAL_FATURAMENTO", "QRY_AUX", "Filial Faturamento", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CODCLIPROTHEUS", "QRY_AUX", "Codcliprotheus", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LOJAPROTHEUS", "QRY_AUX", "Lojaprotheus", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "POS_PEDIDO", "QRY_AUX", "Pospedido", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "AOBS", "QRY_AUX", "Obs", /*Picture*/, 25, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BOBS", "QRY_AUX", "Obs1", /*Picture*/, 50, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COBS", "QRY_AUX", "Obs2", /*Picture*/, 50, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "AOBSENTREGA", "QRY_AUX", "Obsentrega1", /*Picture*/, 75, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BOBSENTREGA", "QRY_AUX", "Obsentrega2", /*Picture*/, 75, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COBSENTREGA", "QRY_AUX", "Obsentrega3", /*Picture*/, 75, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DOBSENTREGA", "QRY_AUX", "Obsentrega4", /*Picture*/, 75, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)	
	//TRCell():New(oSectDad, "AOBS", "QRY_AUX", "Obs", /*Picture*/, 25, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	//TRCell():New(oSectDad, "BOBS1", "QRY_AUX", "Obs1", /*Picture*/, 50, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	//TRCell():New(oSectDad, "COBS2", "QRY_AUX", "Obs2", /*Picture*/, 50, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	//TRCell():New(oSectDad, "AOBSENTREGA1", "QRY_AUX", "Obsentrega1", /*Picture*/, 75, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	//TRCell():New(oSectDad, "BOBSENTREGA2", "QRY_AUX", "Obsentrega2", /*Picture*/, 75, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	//TRCell():New(oSectDad, "COBSENTREGA3", "QRY_AUX", "Obsentrega3", /*Picture*/, 75, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	//TRCell():New(oSectDad, "DOBSENTREGA4", "QRY_AUX", "Obsentrega4", /*Picture*/, 75, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTINTPROTHEUS", "QRY_AUX", "Dtintprotheus", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QUANT_PEDIDO", "QRY_AUX", "Quant_pedido", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QTPENDFAT", "QRY_AUX", "Qtpendfat", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BNUMPEDPROTHEUSNOTA", "QRY_AUX", "Numpedprotheusnota", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QTPEDPROT", "QRY_AUX", "Qtpedprot", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FALHAPOSICAO", "QRY_AUX", "Falhaposicao", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTULTPEDIDO", "QRY_AUX", "Dtultpedido", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VL_VERBA", "QRY_AUX", "Vl_verba", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VL_VERBA_TOTAL", "QRY_AUX", "Vl. Verba Total", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPOUSOVERBA", "QRY_AUX", "Tipousoverba", /*Picture*/, 11, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PRECO_TABELA_S_ST", "QRY_AUX", "Preço Tabela S/ST", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VL_TABELA_S_ST_TOTAL", "QRY_AUX", "Vl. Tabela S/ST Total", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VL_VENDA_S_ST_TOTAL", "QRY_AUX", "Vl. Venda S/ST total", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PRECO_VENDA_LIQ", "QRY_AUX", "Preço Venda Liq.", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VL_VENDA_LIQ_TOTAL", "QRY_AUX", "Vl. Venda Liq. Total", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PERC_VENDA_LIQ", "QRY_AUX", "Perc. Venda Liq.", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VL_ST_TOTAL", "QRY_AUX", "Vl. ST Total", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VL_SUFRAMA_TOTAL", "QRY_AUX", "Vl. Suframa Total", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPO_FRETE", "QRY_AUX", "Tipo Frete", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VL_BASE_BRUTA_CX", "QRY_AUX", "Vl. Base Bruta(CX)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VL_BASE_SEM_ST_CX", "QRY_AUX", "VL. Base Sem ST(CX)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VL_BASE_LIQ_CX", "QRY_AUX", "VL. Base Liq(CX)", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPO_CARGA", "QRY_AUX", "Tipo Carga", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VL_FRETE", "QRY_AUX", "Vl. frete", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DATA_PROPOSTA", "QRY_AUX", "Data Proposta", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "POSICAO", "QRY_AUX", "Posicao", /*Picture*/, 18, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FALHA", "QRY_AUX", "Falha", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FALHADETALHE", "QRY_AUX", "Falhadetalhe", /*Picture*/, 27, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "POS_CREDITO", "QRY_AUX", "Pos. Credito", /*Picture*/, 31, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "POS_ESTOQUE", "QRY_AUX", "Pos. Estoque", /*Picture*/, 26, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
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
	
	U_xPutSx1(cPerg,"01","Data Inicial  ?","."     ,"."       ,"mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Data Final  ?","."     ,"."       ,"mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")
	//U_xPutSx1(cPerg,"03","Data Inicial Fat  ?","."     ,"."       ,"mv_CH1","D",08,0,0,"G","","","","","MV_PAR03","","","","","","","","","","","","","","","","")
	//U_xPutSx1(cPerg,"04","Data Final Fat ?","."     ,"."       ,"mv_CH2","D",08,0,0,"G","","","","","MV_PAR04","","","","","","","","","","","","","","","","")
	
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
	
	//msginfo("DECODE(PED."+'"'+"STATUS_PEDIDO"+'"'+",'F',DECODE(PED.QTPENDFAT,0,'FAT_TOTAL',"		+ STR_PULA) 
                                                                                                                                                                                                                  
	//Montando consulta de dados
	cQryAux := ""
	cQryAux += "SELECT PED.*,"		+ STR_PULA
	//cQryAux += "       DECODE(PED.STATUS_PEDIDO,'F',DECODE(PED.QTPENDFAT,0,'FAT_TOTAL',"		+ STR_PULA
	cQryAux +=			 "DECODE(PED."+'"'+"STATUS_PEDIDO"+'"'+",'F',DECODE(PED.QTPENDFAT,0,'FAT_TOTAL',"		+ STR_PULA 
	cQryAux += "                                             DECODE(GREATEST(0,PED.QTPENDFAT),0,"		+ STR_PULA
	cQryAux += "                                             DECODE(PED.NUMPEDPROTHEUS,PED.BNUMPEDPROTHEUSNOTA,'FAT_DUPL_OU_QT_DIF','FAT_DUPL_OU_QT_DIF'),'FAT_PARCIAL')),"		+ STR_PULA
	cQryAux += "                                             DECODE(PED.QTPEDPROT,0,'EM_CARTEIRA_SGAC','EM_CARTEIRA_PROT')) AS POSICAO,"		+ STR_PULA
	cQryAux += "       DECODE(NVL(PED.NUMPEDPROTHEUS,' '),' ',DECODE(PED.QTPEDPROT,0,'SEM_FALHA','COM_FALHA'),DECODE(PED.QTPEDPROT,0,'COM_FALHA','SEM_FALHA')) AS FALHA,"		+ STR_PULA
	cQryAux += "       DECODE( DECODE(NVL(PED.NUMPEDPROTHEUS,' '),' ',DECODE(PED.QTPEDPROT,0,'SEM_FALHA','COM_FALHA'),DECODE(PED.QTPEDPROT,0,'COM_FALHA','SEM_FALHA')),'COM_FALHA',"		+ STR_PULA
	cQryAux += "               DECODE(NVL(PED.NUMPEDPROTHEUS,' '),' ',DECODE(PED.QTPEDPROT,0,NULL,'SEM_PEDIDO_PROTHEUS_NO_SGAC'),DECODE(PED.QTPEDPROT,0,'SEM_PEDIDO_SGAC_NO_PROTHEUS',NULL))) AS FALHADETALHE,"		+ STR_PULA
	cQryAux += "       (SELECT CASE   C9_BLCRED          WHEN '10'  THEN 'FATURADO'"		+ STR_PULA
	cQryAux += "                                 WHEN '05'  THEN 'BLOQUEIO MANUAL/ESTORNO'"		+ STR_PULA
	cQryAux += "                                 WHEN '04'  THEN 'DATA DE CRÉDITO VENCIDA'"		+ STR_PULA
	cQryAux += "                                 WHEN '01'  THEN 'BLOQUEIO DE CRÉDITO POR VALOR'"		+ STR_PULA
	cQryAux += "                                 WHEN '  '  THEN 'LIBERADO'"		+ STR_PULA
	cQryAux += "                                 WHEN '02'  THEN 'POR ESTOQUE – MV_BLQCRED = T'"		+ STR_PULA
	cQryAux += "                                 WHEN '05'  THEN 'BLOQUEIO DE CREDITO POR ESTORNO'"		+ STR_PULA
	cQryAux += "                                 WHEN '06'  THEN 'BLOQUEIO DE CREDITO POR RISCO'"		+ STR_PULA
	cQryAux += "                                 WHEN '09'  THEN 'REJEICAO DE CREDITO'"		+ STR_PULA
	cQryAux += "                    END AS  CREDITO"		+ STR_PULA
	cQryAux += "          FROM SC9010,"		+ STR_PULA
	cQryAux += "               PCFILIAL@WINTHOR2 F,"		+ STR_PULA
	cQryAux += "               PCPRODUT@WINTHOR2 P"		+ STR_PULA
	//cQryAux +=			 "DECODE(PED."+'"'+"STATUS_PEDIDO"+'"'+",'F',DECODE(PED.QTPENDFAT,0,'FAT_TOTAL',"		+ STR_PULA 
	//cQryAux += "         WHERE F.CODIGO  = PED."FILIAL_FATURAMENTO""		+ STR_PULA
	cQryAux += "           WHERE F.CODIGO  = PED."+'"'+"FILIAL_FATURAMENTO"+'"'+" "		+ STR_PULA 
	//cQryAux += "           AND P.CODPROD = PED."COD_PRODUTO""		+ STR_PULA
	cQryAux += "           AND P.CODPROD = PED."+'"'+"COD_PRODUTO"+'"'+" "		+ STR_PULA
	cQryAux += "           AND C9_FILIAL = F.AK_CODIGO"		+ STR_PULA
	cQryAux += "           AND C9_PEDIDO = PED.NUMPEDPROTHEUS "		+ STR_PULA
	cQryAux += "           AND TRIM(C9_PRODUTO) = P.B1_COD"		+ STR_PULA
	cQryAux += "           AND D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "           AND ROWNUM = 1) AS POS_CREDITO,"		+ STR_PULA
	cQryAux += "       (SELECT CASE C9_BLEST WHEN '   ' THEN 'LIBERADO'"		+ STR_PULA
	cQryAux += "               WHEN '02'  THEN 'BLOQUEIO DE ESTOQUE'"		+ STR_PULA
	cQryAux += "               WHEN '03'  THEN 'BLOQUEIO MANUAL DE ESTOQUE'"		+ STR_PULA
	cQryAux += "               WHEN '10'  THEN 'FATURADO'"		+ STR_PULA
	cQryAux += "               END AS ESTOQUE                "		+ STR_PULA
	cQryAux += "          FROM SC9010,"		+ STR_PULA
	cQryAux += "               PCFILIAL@WINTHOR2 F,"		+ STR_PULA
	cQryAux += "               PCPRODUT@WINTHOR2 P"		+ STR_PULA
	//cQryAux += "         WHERE F.CODIGO  = PED."FILIAL_FATURAMENTO""		+ STR_PULA
	cQryAux += "         WHERE F.CODIGO  = PED."+'"'+"FILIAL_FATURAMENTO"+'"'+" "		+ STR_PULA
	cQryAux += "           AND P.CODPROD = PED."+'"'+"COD_PRODUTO"+'"'+" "		+ STR_PULA
	cQryAux += "           AND C9_FILIAL = F.AK_CODIGO "		+ STR_PULA
	cQryAux += "           AND C9_PEDIDO = PED.NUMPEDPROTHEUS "		+ STR_PULA
	cQryAux += "           AND TRIM(C9_PRODUTO) = P.B1_COD"		+ STR_PULA
	cQryAux += "           AND D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "           AND ROWNUM = 1) AS POS_ESTOQUE "		+ STR_PULA
	cQryAux += "                                                    "		+ STR_PULA
	cQryAux += "  FROM ("		+ STR_PULA
	cQryAux += "SELECT DISTINCT"		+ STR_PULA
	cQryAux += "       C.NUMPEDPROTHEUS,"		+ STR_PULA
	cQryAux += "       I.NUMPED                                                       AS NR_PEDIDO, "		+ STR_PULA
	cQryAux += "       I.DATA                                                         AS DATA_PEDIDO, "		+ STR_PULA
	cQryAux += "       TO_CHAR(I.DATA, 'YYYY')                                        AS ANO_PEDIDO, "		+ STR_PULA
	cQryAux += "       TO_CHAR(I.DATA, 'MM')                                          AS MES_PEDIDO, "		+ STR_PULA
	cQryAux += "       I.POSICAO                                                      AS STATUS_PEDIDO, "		+ STR_PULA
	cQryAux += "       I.CODCLI                                                       AS COD_CLIENTE, "		+ STR_PULA
	cQryAux += "       T.CLIENTE                                                      AS CLIENTE,                                                        "		+ STR_PULA
	cQryAux += "       (SELECT GC.DC_GRUPO "		+ STR_PULA
	cQryAux += "          FROM MCGRUPOCLIENTE@WINTHOR2 GC"		+ STR_PULA
	cQryAux += "         WHERE GC.CD_GRUPO = T.CD_GRUPO)                              AS GRUPO_ECONOMICO,"		+ STR_PULA
	cQryAux += "         "		+ STR_PULA
	cQryAux += "       T.FANTASIA                                                     AS FANTASIA, "		+ STR_PULA
	cQryAux += "       T.CODATV1                                                      AS COD_SEG_MERCADO, "		+ STR_PULA
	cQryAux += "       PCATIVI.RAMO                                                   AS SEG_MERCADO, "		+ STR_PULA
	cQryAux += "       T.ENDERENT                                                     AS ENDERECO, "		+ STR_PULA
	cQryAux += "       T.BAIRROENT                                                    AS BAIRRO, "		+ STR_PULA
	cQryAux += "       T.MUNICENT                                                     AS MUNICIPIO, "		+ STR_PULA
	cQryAux += "       T.ESTENT                                                       AS UF, "		+ STR_PULA
	cQryAux += "       TO_CHAR(C.CODUSUR)                                             AS COD_VENDEDOR, "		+ STR_PULA
	cQryAux += "       U.NOME                                                         AS NOME_VENDEDOR, "		+ STR_PULA
	cQryAux += "       DECODE(U.TIPOVEND, 'E', 'EXECUTIVO', "		+ STR_PULA
	cQryAux += "                          'REPRESENTANTE')                            AS TIPO_VENDEDOR, "		+ STR_PULA
	cQryAux += "       U.CODSUPERVISOR                                                AS COD_AREA, "		+ STR_PULA
	cQryAux += "       V.NOME                                                         AS GE_AREA, "		+ STR_PULA
	cQryAux += "       V.CODGERENTE                                                   AS COD_REGIAO, "		+ STR_PULA
	cQryAux += "       G.NOMEGERENTE                                                  AS GER_REGIONAL, "		+ STR_PULA
	cQryAux += "       I.CODPROD                                                      AS COD_PRODUTO, "		+ STR_PULA
	cQryAux += "       PCPRODUT.DESCRICAO                                             AS PRODUTO, "		+ STR_PULA
	cQryAux += "       PCPRODUT.CODLINHAPROD                                          AS COD_LINHA, "		+ STR_PULA
	cQryAux += "       PCLINHAPROD.DESCRICAO                                          AS LINHA_PRODUTO, "		+ STR_PULA
	cQryAux += "       PCPRODUT.QTUNITCX                                              AS QT_UN_CX, "		+ STR_PULA
	cQryAux += "       PCPRODUT.PESOBRUTO                                             AS PESO_BRUTO_KG_CX, "		+ STR_PULA
	cQryAux += " "		+ STR_PULA
	cQryAux += "       M.NUMNOTA                                               AS NR_NF_E,"		+ STR_PULA
	cQryAux += "       M.DTMOV                                               AS DT_NF_E,"		+ STR_PULA
	cQryAux += "       TO_CHAR(M.DTMOV, 'MM')                                AS MES_NF_E, "		+ STR_PULA
	cQryAux += "       TO_CHAR(M.DTMOV, 'YYYY')                              AS ANO_NF_E, "		+ STR_PULA
	cQryAux += "       DECODE(PCNFSAID.DTCANCEL, NULL,NULL,'NF_E_CANCELADA')          AS POSICAO_NF_E, "		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += " "		+ STR_PULA
	cQryAux += "       PCNFSAID.DTCANCEL                      AS DT_CANCEL_NF_E,   "		+ STR_PULA
	cQryAux += "        "		+ STR_PULA
	cQryAux += "       C.CODPLPAG                                                     AS COD_PLANO_PAGTO, "		+ STR_PULA
	cQryAux += "       PCPLPAG.DESCRICAO                                              AS PLANO_PAGTO, "		+ STR_PULA
	cQryAux += "       PCPLPAG.NUMDIAS                                                AS NR_DIAS_EFETIVO,"		+ STR_PULA
	cQryAux += "    "		+ STR_PULA
	cQryAux += "       TRUNC(( I.PVENDA * DECODE(I.POSICAO,'F', (SELECT SUM(M.QT)"		+ STR_PULA
	cQryAux += "                                                   FROM PCMOV@WINTHOR2 M"		+ STR_PULA
	cQryAux += "                                                  WHERE M.NUMPED        = I.NUMPED"		+ STR_PULA
	cQryAux += "                                                    AND M.CODPROD       = I.CODPROD"		+ STR_PULA
	cQryAux += "                                                    AND M.NUMTRANSVENDA = PCNFSAID.NUMTRANSVENDA"		+ STR_PULA
	cQryAux += "                                                    AND NVL(M.D_E_L_E_T_,' ') = ' '),I.QT)), 2)                                  AS VENDA_BRUTA_RS, "		+ STR_PULA
	cQryAux += "                                                   "		+ STR_PULA
	cQryAux += "       TRUNC(TRUNC(( I.PVENDA * DECODE(I.POSICAO,'F', (SELECT SUM(M.QT)"		+ STR_PULA
	cQryAux += "                                                   FROM PCMOV@WINTHOR2 M"		+ STR_PULA
	cQryAux += "                                                  WHERE M.NUMPED  = I.NUMPED"		+ STR_PULA
	cQryAux += "                                                    AND M.CODPROD = I.CODPROD"		+ STR_PULA
	cQryAux += "                                                    AND M.NUMTRANSVENDA = PCNFSAID.NUMTRANSVENDA"		+ STR_PULA
	cQryAux += "                                                    AND NVL(M.D_E_L_E_T_,' ') = ' '),I.QT) ), 2) - ( I.ST * DECODE(I.POSICAO,'F', (SELECT SUM(M.QT)"		+ STR_PULA
	cQryAux += "                                                   FROM PCMOV@WINTHOR2 M"		+ STR_PULA
	cQryAux += "                                                  WHERE M.NUMPED  = I.NUMPED"		+ STR_PULA
	cQryAux += "                                                    AND M.CODPROD = I.CODPROD"		+ STR_PULA
	cQryAux += "                                                    AND M.NUMTRANSVENDA = PCNFSAID.NUMTRANSVENDA"		+ STR_PULA
	cQryAux += "                                                    AND NVL(M.D_E_L_E_T_,' ') = ' '),I.QT) ), 2)      AS VENDA_S_ST_RS, "		+ STR_PULA
	cQryAux += "        ROUND( (    I.PVENDA+"		+ STR_PULA
	cQryAux += "               NVL(I.VLDESCSUFRAMA,0)-"		+ STR_PULA
	cQryAux += "               NVL(I.ST,0)-"		+ STR_PULA
	cQryAux += "               NVL(I.VLDESCFINMOCOCA,0) -"		+ STR_PULA
	cQryAux += "               NVL(I.VLVERBADEB,0) ),2) AS VENDA_NET_RS, "		+ STR_PULA
	cQryAux += "       DECODE(I.POSICAO,'F', (SELECT SUM(M.QT)"		+ STR_PULA
	cQryAux += "                                                   FROM PCMOV@WINTHOR2 M"		+ STR_PULA
	cQryAux += "                                                  WHERE M.NUMPED  = I.NUMPED"		+ STR_PULA
	cQryAux += "                                                    AND M.CODPROD = I.CODPROD"		+ STR_PULA
	cQryAux += "                                                    AND M.NUMTRANSVENDA = PCNFSAID.NUMTRANSVENDA"		+ STR_PULA
	cQryAux += "                                                    AND NVL(M.D_E_L_E_T_,' ') = ' '),I.QT)           AS VENDA_CX, "		+ STR_PULA
	cQryAux += "       TRUNC(( DECODE(I.POSICAO,'F', (SELECT SUM(M.QT)"		+ STR_PULA
	cQryAux += "                                                   FROM PCMOV@WINTHOR2 M"		+ STR_PULA
	cQryAux += "                                                  WHERE M.NUMPED  = I.NUMPED"		+ STR_PULA
	cQryAux += "                                                    AND M.CODPROD = I.CODPROD"		+ STR_PULA
	cQryAux += "                                                    AND M.NUMTRANSVENDA = PCNFSAID.NUMTRANSVENDA"		+ STR_PULA
	cQryAux += "                                                    AND NVL(M.D_E_L_E_T_,' ') = ' '),I.QT) * NVL(PCPRODUT.PESOBRUTO, 0.001) ), 2)            AS VENDA_KG, "		+ STR_PULA
	cQryAux += "       ( DECODE(I.POSICAO,'F', (SELECT SUM(M.QT)"		+ STR_PULA
	cQryAux += "                                                   FROM PCMOV@WINTHOR2 M"		+ STR_PULA
	cQryAux += "                                                  WHERE M.NUMPED  = I.NUMPED"		+ STR_PULA
	cQryAux += "                                                    AND M.CODPROD = I.CODPROD"		+ STR_PULA
	cQryAux += "                                                    AND M.NUMTRANSVENDA = PCNFSAID.NUMTRANSVENDA"		+ STR_PULA
	cQryAux += "                                                    AND NVL(M.D_E_L_E_T_,' ') = ' '),I.QT) * PCPRODUT.QTUNITCX )                                   AS VENDA_UN, "		+ STR_PULA
	cQryAux += "       TRUNC(I.ST, 2)                                                 AS VALOR_ST_CX, "		+ STR_PULA
	cQryAux += "       TRUNC(I.VL_BASECALC * ( I.PERCICM / 100 ), 2)                  AS VALOR_ICMS_CX, "		+ STR_PULA
	cQryAux += "       TRUNC(I.VLPIS2, 2)                                             AS VALOR_PIS_CX, "		+ STR_PULA
	cQryAux += "       TRUNC(I.VLCOFINS2, 2)                                          AS VALOR_COFINS_CX, "		+ STR_PULA
	cQryAux += "       I.VLDESCSUFRAMA                                                AS VALOR_SUFRAMA_CX, "		+ STR_PULA
	cQryAux += "       NVL(I.VLDESCFRETE, 0)                                          AS VALOR_DESC_FRETE_CX, "		+ STR_PULA
	cQryAux += "       PCPLPAG.PERCTXPLANO                                            AS PERC_PLANO_FINANC, "		+ STR_PULA
	cQryAux += "       ROUND(( ( ( I.PVENDA - NVL(I.ST, 0) + NVL(I.VLDESCSUFRAMA, 0) ) * NVL( "		+ STR_PULA
	cQryAux += "                         (SELECT (( P.PERCTXPLANO *- 1 )) "		+ STR_PULA
	cQryAux += "                         FROM "		+ STR_PULA
	cQryAux += "                         PCPLPAG@WINTHOR2 "		+ STR_PULA
	cQryAux += "                         P "		+ STR_PULA
	cQryAux += "                         WHERE "		+ STR_PULA
	cQryAux += "                           P.CODPLPAG = C.CODPLPAG), 0) ) / 100 ), 2) AS VALOR_PLANO_FINANC, "		+ STR_PULA
	cQryAux += "       ROUND((( NVL(C.VLDESCCOMERCIAL, 0) * ( ( ( I.PVENDA * DECODE(I.POSICAO,'F', (SELECT SUM(M.QT)"		+ STR_PULA
	cQryAux += "                                                   FROM PCMOV@WINTHOR2 M"		+ STR_PULA
	cQryAux += "                                                  WHERE M.NUMPED  = I.NUMPED"		+ STR_PULA
	cQryAux += "                                                    AND M.CODPROD = I.CODPROD"		+ STR_PULA
	cQryAux += "                                                    AND M.NUMTRANSVENDA = PCNFSAID.NUMTRANSVENDA"		+ STR_PULA
	cQryAux += "                                                    AND NVL(M.D_E_L_E_T_,' ') = ' '),I.QT) ) / "		+ STR_PULA
	cQryAux += "              DECODE(NVL(C.VLATEND, 0), 0, C.VLTOTAL, "		+ STR_PULA
	cQryAux += "                               C.VLATEND) ) * 100 ) / 100 )), 2)      AS VALOR_VBC_CX, "		+ STR_PULA
	cQryAux += "       I.VLDESCFINMOCOCA                                              AS VALOR_CTR_CX,"		+ STR_PULA
	cQryAux += "       NULL                                                           AS CODIGO_PRODUTO,"		+ STR_PULA
	cQryAux += "       NULL                                                           AS CODIGO_RCA,"		+ STR_PULA
	cQryAux += "       NULL                                                           AS DATA_META,"		+ STR_PULA
	cQryAux += "       NULL                                                           AS VALOR_META,"		+ STR_PULA
	cQryAux += "       NULL                                                           AS QUANTIDADE_META,"		+ STR_PULA
	cQryAux += "       NULL                                                           AS PESO_META,"		+ STR_PULA
	cQryAux += "       I.VLVERBA                                                      AS VLVERBA,"		+ STR_PULA
	cQryAux += "       I.VLVERBALIQ                                                   AS VLVERBALIQ,"		+ STR_PULA
	cQryAux += "       DECODE(GREATEST(I.VLVERBALIQ,0),0,(0-((0-I.VLVERBA)-(0-I.VLVERBALIQ))),(I.VLVERBA-I.VLVERBALIQ)) AS DIFVERBALIQ,"		+ STR_PULA
	cQryAux += "        "		+ STR_PULA
	cQryAux += "       (( DECODE(GREATEST(I.VLVERBA,0),0,0,I.VLVERBA)*I.TXVENDAVERBA)/100) AS VLTXVENDAVERBA,"		+ STR_PULA
	cQryAux += "       I.TXVENDAVERBA                                                 AS TXVENDAVERBA,"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "      "		+ STR_PULA
	cQryAux += "       ((DECODE(GREATEST(I.VLVERBA,0),0,0,I.VLVERBA)*I.PERCOM)/100)   AS VLPERCOM,"		+ STR_PULA
	cQryAux += "       I.PERCOM                                                       AS PERCOM,"		+ STR_PULA
	cQryAux += "       ((DECODE(GREATEST(I.VLVERBA,0),0,0,I.VLVERBA)*I.PERCICM)/100)  AS VLPERCICM,"		+ STR_PULA
	cQryAux += "       I.PERCICM                                                      AS PERCICM,"		+ STR_PULA
	cQryAux += "       ((DECODE(GREATEST(I.VLVERBA,0),0,0,I.VLVERBA)*I.PERPIS)/100)   AS VLPERPIS,"		+ STR_PULA
	cQryAux += "       I.PERPIS                                                       AS PERPIS,"		+ STR_PULA
	cQryAux += "       ((DECODE(GREATEST(I.VLVERBA,0),0,0,I.VLVERBA)*I.PERCOFINS)/100) AS VLPERCOFINS,"		+ STR_PULA
	cQryAux += "       I.PERCOFINS                                                     AS PERCOFINS,"		+ STR_PULA
	cQryAux += "       T.CGCENT                                                        AS CGCENT,"		+ STR_PULA
	cQryAux += "       CASE"		+ STR_PULA
	cQryAux += "       WHEN TRUNC(( I.PVENDA * I.QT ), 2) BETWEEN 1 AND 10000 THEN 'DE 1 A 10 MIL'"		+ STR_PULA
	cQryAux += "       WHEN TRUNC(( I.PVENDA * I.QT ), 2) BETWEEN 10001 AND 20000 THEN 'DE 10 A 20 MIL'"		+ STR_PULA
	cQryAux += "       WHEN TRUNC(( I.PVENDA * I.QT ), 2) BETWEEN 20001 AND 30000 THEN 'DE 20 A 30 MIL'"		+ STR_PULA
	cQryAux += "       WHEN TRUNC(( I.PVENDA * I.QT ), 2) BETWEEN 30001 AND 40000 THEN 'DE 30 A 40 MIL'"		+ STR_PULA
	cQryAux += "       WHEN TRUNC(( I.PVENDA * I.QT ), 2) BETWEEN 40001 AND 50000 THEN 'DE 40 A 50 MIL'"		+ STR_PULA
	cQryAux += "       WHEN TRUNC(( I.PVENDA * I.QT ), 2) BETWEEN 50001 AND 60000 THEN 'DE 50 A 60 MIL'"		+ STR_PULA
	cQryAux += "       WHEN TRUNC(( I.PVENDA * I.QT ), 2) BETWEEN 60001 AND 70000 THEN 'DE 60 A 70 MIL'"		+ STR_PULA
	cQryAux += "       WHEN TRUNC(( I.PVENDA * I.QT ), 2) BETWEEN 70001 AND 80000 THEN 'DE 70 A 80 MIL'"		+ STR_PULA
	cQryAux += "       WHEN TRUNC(( I.PVENDA * I.QT ), 2) BETWEEN 80001 AND 90000 THEN 'DE 80 A 90 MIL'"		+ STR_PULA
	cQryAux += "       WHEN TRUNC(( I.PVENDA * I.QT ), 2) BETWEEN 90000 AND 100000 THEN 'DE 90 A 100 MIL'"		+ STR_PULA
	cQryAux += "       WHEN TRUNC(( I.PVENDA * I.QT ), 2) BETWEEN 1000001 AND 110000 THEN 'DE 100 A 110 MIL'"		+ STR_PULA
	cQryAux += "       END                                                           AS FAIXA,"		+ STR_PULA
	cQryAux += "       (SELECT MAX(P.DTFAT) "		+ STR_PULA
	cQryAux += "          FROM PCPEDC@WINTHOR2 P "		+ STR_PULA
	cQryAux += "         WHERE P.CODCLI = T.CODCLI "		+ STR_PULA
	cQryAux += "           AND P.DTCANCEL IS NULL"		+ STR_PULA
	cQryAux += "           AND P.CONDVENDA = 1"		+ STR_PULA
	cQryAux += "           AND P.POSICAO NOT IN ('C','Q')) AS DTULTCOMP,"		+ STR_PULA
	cQryAux += "       (SELECT MAX(DTVENC) FROM PCPREST"		+ STR_PULA
	cQryAux += "       WHERE PCPREST.NUMTRANSVENDA = (SELECT MAX(PCNFSAID.NUMTRANSVENDA) FROM PCNFSAID@WINTHOR2 WHERE PCNFSAID.NUMPED = C.NUMPED))         AS DTMAXVENCTITULO,"		+ STR_PULA
	cQryAux += "       CASE WHEN I.DATA >= TO_DATE('18/09/2017','DD/MM/YYYY') THEN"		+ STR_PULA
	cQryAux += "          I.PVENDAPOLITICA"		+ STR_PULA
	cQryAux += "       ELSE "		+ STR_PULA
	cQryAux += "         0"		+ STR_PULA
	cQryAux += "       END                                                          AS PRECO_DA_CONTROLADORIA,"		+ STR_PULA
	cQryAux += "       ROUND( (    I.PVENDA+"		+ STR_PULA
	cQryAux += "               NVL(I.VLDESCSUFRAMA,0)-"		+ STR_PULA
	cQryAux += "               NVL(I.ST,0)-"		+ STR_PULA
	cQryAux += "               NVL(I.VLDESCFINMOCOCA,0)),2) AS PRECO_DE_VENDA_S_ST_RS"		+ STR_PULA
	cQryAux += "               ,C.DTENTREGA                                         AS PREVFATURAMENTO,"		+ STR_PULA
	cQryAux += "       C.CODFILIAL AS FILIAL_ESTOQUE,"		+ STR_PULA
	cQryAux += "       C.CODFILIALNF AS FILIAL_FATURAMENTO,"		+ STR_PULA
	cQryAux += "       T.A1_COD AS CODCLIPROTHEUS,"		+ STR_PULA
	cQryAux += "       T.A1_LOJA AS LOJAPROTHEUS,"		+ STR_PULA
	cQryAux += "       DECODE(C.NSU,NULL,NULL,'EDU','PED_DUPLIC',NULL) AS POS_PEDIDO"		+ STR_PULA
	cQryAux += "         ,C.OBS AS AOBS"		+ STR_PULA
	cQryAux += "         ,C.OBS1 AS BOBS"		+ STR_PULA
	cQryAux += "         ,C.OBS2 AS COBS"		+ STR_PULA
	cQryAux += "         ,C.OBSENTREGA1 AS AOBSENTREGA"		+ STR_PULA
	cQryAux += "         ,C.OBSENTREGA2 AS BOBSENTREGA"		+ STR_PULA
	cQryAux += "         ,C.OBSENTREGA3 AS COBSENTREGA"		+ STR_PULA
	cQryAux += "         ,C.OBSENTREGA4 AS DOBSENTREGA"		+ STR_PULA	
	//cQryAux += "       ,C.OBS  AS AOBS"		+ STR_PULA
	//cQryAux += "       ,C.OBS1 AS BOBS"		+ STR_PULA
	//cQryAux += "       ,C.OBS2 AS COBS"		+ STR_PULA
	//cQryAux += "       ,C.OBSENTREGA1 AS AOBSENTREGA "		+ STR_PULA
	//cQryAux += "       ,C.OBSENTREGA2 AS BOBSENTREGA"		+ STR_PULA
	//cQryAux += "       ,C.OBSENTREGA3 AS COBSENTREGA"		+ STR_PULA
	//cQryAux += "       ,C.OBSENTREGA4 AS DOBSENTREGA"		+ STR_PULA
	cQryAux += "       ,C.DTINTPROTHEUS"		+ STR_PULA
	cQryAux += "       ,I.QT AS QUANT_PEDIDO"		+ STR_PULA
	cQryAux += "       ,(I.QT - NVL((SELECT SUM(M.QT)"		+ STR_PULA
	cQryAux += "                      FROM PCMOV@WINTHOR2 M"		+ STR_PULA
	cQryAux += "                     WHERE M.NUMPED  = I.NUMPED"		+ STR_PULA
	cQryAux += "                       AND M.CODPROD = I.CODPROD"		+ STR_PULA
	cQryAux += "                       AND NVL(M.D_E_L_E_T_,' ') = ' '),0)) AS QTPENDFAT"		+ STR_PULA
	cQryAux += "       ,DECODE(M.NUMPEDPROTHEUS,NULL,DECODE(C.POSICAO,'F',C.NUMPEDPROTHEUS,NULL),M.NUMPEDPROTHEUS) AS BNUMPEDPROTHEUSNOTA"		+ STR_PULA
	cQryAux += "       ,(SELECT COUNT(DISTINCT(C5_NUM)) "		+ STR_PULA
	cQryAux += "           FROM SC5010 C5,"		+ STR_PULA
	cQryAux += "                SC6010 C6,          "		+ STR_PULA
	cQryAux += "                SF4010 F4 "		+ STR_PULA
	cQryAux += "          WHERE C5.C5_XPVSGAC = TO_CHAR(C.NUMPED)"		+ STR_PULA
	cQryAux += "            AND C5_NUM        = C6_NUM"		+ STR_PULA
	cQryAux += "            AND C5_FILIAL     = C6_FILIAL"		+ STR_PULA
	cQryAux += "            AND C6.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "            AND C5.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "            AND F4.F4_FILIAL  = C6.C6_FILIAL"		+ STR_PULA
	cQryAux += "            AND F4.F4_CODIGO  = C6.C6_TES "		+ STR_PULA
	cQryAux += "            AND F4.F4_DUPLIC  = 'S') AS QTPEDPROT"		+ STR_PULA
	cQryAux += "       ,DECODE(M.NUMNOTA,NULL,DECODE(C.POSICAO,'F','PED-F-SEM-NF',' '),"		+ STR_PULA
	cQryAux += "                              DECODE(C.POSICAO,'F',' ',DECODE(C.POSICAO,'C',' ','PED-NAOF-COM-NF'))) AS FALHAPOSICAO,"		+ STR_PULA
	cQryAux += "       (SELECT MAX(P.DATA) "		+ STR_PULA
	cQryAux += "          FROM PCPEDC@WINTHOR2 P "		+ STR_PULA
	cQryAux += "         WHERE P.CODCLI = T.CODCLI "		+ STR_PULA
	cQryAux += "           AND P.DTCANCEL IS NULL"		+ STR_PULA
	cQryAux += "           AND P.CONDVENDA = 1"		+ STR_PULA
	cQryAux += "           AND P.POSICAO NOT IN ('C','Q')) AS DTULTPEDIDO,"		+ STR_PULA
	cQryAux += " "		+ STR_PULA
	cQryAux += "       DECODE(GREATEST(NVL(I.VLVERBALIQ,0),0),0,((NVL(I.VLVERBALIQ,0)*-1)+NVL(I.VLVERBADEB,0)),NVL(I.VLVERBADEB,0) ) AS VL_VERBA, "		+ STR_PULA
	cQryAux += "            (I.QT*DECODE(GREATEST(NVL(I.VLVERBALIQ,0),0),0,((NVL(I.VLVERBALIQ,0)*-1)+NVL(I.VLVERBADEB,0)),NVL(I.VLVERBADEB,0) )) AS VL_VERBA_TOTAL,"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "       DECODE(GREATEST(I.VLVERBA,0),I.VLVERBA,' ',DECODE(NVL(I.CT_TIPOUSOVERBA,'0'),'0','FINANCEIRO',DECODE(I.VLVERBAPRECO,0,'','PRECO_VENDA'))) AS TIPOUSOVERBA,"		+ STR_PULA
	cQryAux += "       (I.PTABELA - NVL(I.ST,0)) AS PRECO_TABELA_S_ST, "		+ STR_PULA
	cQryAux += "       (I.QT * (I.PTABELA - NVL(I.ST,0))) AS VL_TABELA_S_ST_TOTAL,"		+ STR_PULA
	cQryAux += "       (I.QT * (I.PVENDA - NVL(I.ST,0))) AS VL_VENDA_S_ST_TOTAL,"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "       ROUND(ROUND((I.PVENDA-NVL(I.ST,0)),4) -"		+ STR_PULA
	cQryAux += "       DECODE(GREATEST(I.VLVERBA,0),I.VLVERBA,0,DECODE(NVL(I.CT_TIPOUSOVERBA,'0'),0,((I.VLVERBA*-1)+NVL(I.VLVERBADEB,0)),0)),4) AS PRECO_VENDA_LIQ, "		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "       (I.QT*(ROUND(ROUND((I.PVENDA-NVL(I.ST,0)),4) -"		+ STR_PULA
	cQryAux += "       DECODE(GREATEST(I.VLVERBA,0),I.VLVERBA,0,DECODE(NVL(I.CT_TIPOUSOVERBA,'0'),0,((I.VLVERBA*-1)+NVL(I.VLVERBADEB,0)),0)),4))) AS VL_VENDA_LIQ_TOTAL,"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "    "		+ STR_PULA
	cQryAux += "       ROUND(((ROUND(ROUND((I.PVENDA-NVL(I.ST,0)),4) -"		+ STR_PULA
	cQryAux += "         DECODE(GREATEST(I.VLVERBA,0),I.VLVERBA,0,DECODE(NVL(I.CT_TIPOUSOVERBA,'0'),0,((I.VLVERBA*-1)+NVL(I.VLVERBADEB,0)),0)),4) /"		+ STR_PULA
	cQryAux += "         ROUND((I.PTABELA-NVL(I.ST,0)),4) )*100),2) AS PERC_VENDA_LIQ, "		+ STR_PULA
	cQryAux += "         "		+ STR_PULA
	cQryAux += "       ROUND((I.QT*I.ST),2) AS VL_ST_TOTAL,"		+ STR_PULA
	cQryAux += "       ROUND((I.QT*I.VLDESCSUFRAMA),2) AS VL_SUFRAMA_TOTAL,"		+ STR_PULA
	cQryAux += "       DECODE(NVL(C.FRETEDESPACHO,'C'),'C','CIF','FOB') AS TIPO_FRETE,"		+ STR_PULA
	cQryAux += "       ROUND((I.PVENDA*I.QT),2) AS VL_BASE_BRUTA_CX,"		+ STR_PULA
	cQryAux += "       ROUND(( (I.PVENDA - NVL(I.ST,0))*I.QT),2) AS VL_BASE_SEM_ST_CX,"		+ STR_PULA
	cQryAux += "       ROUND(( ( (I.PVENDA - NVL(I.ST,0)) - ((I.PVENDA - NVL(I.ST,0))*I.PERCICM/100) - NVL(I.VLPIS,0) - NVL(I.VLCOFINS,0))*I.QT),2) AS VL_BASE_LIQ_CX,"		+ STR_PULA
	cQryAux += "       CT.DC_CAR_TIPO AS TIPO_CARGA,"		+ STR_PULA
	cQryAux += "       (I.QT*( PCPRODUT.PESOBRUTO * I.VLFRETESIM)) AS VL_FRETE,      "		+ STR_PULA
	cQryAux += "       C.DATAPROP AS DATA_PROPOSTA                                                              "		+ STR_PULA
	cQryAux += "                                   "		+ STR_PULA
	cQryAux += "FROM   PCPEDI@WINTHOR2 I, "		+ STR_PULA
	cQryAux += "       PCPEDC@WINTHOR2 C,"		+ STR_PULA
	cQryAux += "       A3LOFRETECARGATIPO@WINTHOR2 CT, "		+ STR_PULA
	cQryAux += "       PCCLIENT@WINTHOR2 T, "		+ STR_PULA
	cQryAux += "       PCATIVI@WINTHOR2, "		+ STR_PULA
	cQryAux += "       PCUSUARI@WINTHOR2 U, "		+ STR_PULA
	cQryAux += "       PCSUPERV@WINTHOR2 V, "		+ STR_PULA
	cQryAux += "       PCGERENTE@WINTHOR2 G, "		+ STR_PULA
	cQryAux += "       PCPRODUT@WINTHOR2, "		+ STR_PULA
	cQryAux += "       PCLINHAPROD@WINTHOR2, "		+ STR_PULA
	cQryAux += "       PCPLPAG@WINTHOR2, "		+ STR_PULA
	cQryAux += "       PCNFSAID@WINTHOR2,"		+ STR_PULA
	cQryAux += "       PCMOV@WINTHOR2 M "		+ STR_PULA
	cQryAux += "WHERE  I.NUMPED = C.NUMPED "		+ STR_PULA
	cQryAux += " "		+ STR_PULA
	cQryAux += "       AND T.CODCLI = I.CODCLI "		+ STR_PULA
	cQryAux += "       AND C.NR_REG_FRETE_CARTIPO = CT.NR_REG_FRETE_CARTIPO(+)"		+ STR_PULA
	cQryAux += "       AND T.CODATV1 = PCATIVI.CODATIV "		+ STR_PULA
	cQryAux += "       AND C.CODUSUR(+) = U.CODUSUR "		+ STR_PULA
	cQryAux += "       AND G.CODGERENTE(+) = V.CODGERENTE "		+ STR_PULA
	cQryAux += "       AND PCPRODUT.CODPROD = I.CODPROD "		+ STR_PULA
	cQryAux += "       AND PCLINHAPROD.CODLINHA(+) = PCPRODUT.CODLINHAPROD "		+ STR_PULA
	cQryAux += "       AND PCPLPAG.CODPLPAG = C.CODPLPAG "		+ STR_PULA
	cQryAux += "       AND PCNFSAID.NUMTRANSVENDA(+) = M.NUMTRANSVENDA"		+ STR_PULA
	cQryAux += "       AND M.CODPROD(+) = I.CODPROD"		+ STR_PULA
	cQryAux += "       AND M.NUMPED(+)  = I.NUMPED"		+ STR_PULA
	cQryAux += "       AND NVL(M.D_E_L_E_T_,' ') = ' ' "		+ STR_PULA
	cQryAux += "        "		+ STR_PULA
	cQryAux += "       AND V.CODSUPERVISOR(+) = U.CODSUPERVISOR "		+ STR_PULA
	cQryAux += "       AND G.CODGERENTE(+) = V.CODGERENTE "		+ STR_PULA
	//cQryAux += "       AND C.DATA BETWEEN '20200801' AND '20200807' "		+ STR_PULA
	//cQryAux += "       AND C.DTFAT BETWEEN '20200801' AND '20200807' "		+ STR_PULA
	cQryAux += "       AND C.DATA BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	//cQryAux += "       AND C.DTFAT BETWEEN '" + DTOS(MV_PAR03) +"' AND '"+ DTOS(MV_PAR04) +"' 	" + STR_PULA
	cQryAux += "       AND I.POSICAO <> 'C' "		+ STR_PULA
	cQryAux += "       AND C.VLATEND > 0"		+ STR_PULA
	cQryAux += "       ) PED"		+ STR_PULA
	cQryAux += "ORDER BY 2,1"		+ STR_PULA
	
	MemoWrite("C:\teste\RELCOMER_8120.sql",cQryAux) // 14/08/2020
	
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
