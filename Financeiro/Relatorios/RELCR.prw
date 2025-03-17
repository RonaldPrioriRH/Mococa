//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELCR
Relatório - Relatório CR                  
@author TREPORT
@since 30/07/2018
@version 1.0
	@example
	u_RELCR()
	@obs Função gerada pelo TREPORT()
/*/
	
User Function RELCR()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELCR"
	
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
		oReport:nDevice := 4 //1-Arquivo,2-Impressora,3-email,4-Planilha e 5-Html
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
	oReport := TReport():New(	"RELCR",;		//Nome do Relatório
								"Relatório CR",;		//Título
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
	TRCell():New(oSectDad, "SITUACAO", "QRY_AUX", "Situacao", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FILORI", "QRY_AUX", "Filori", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BCORECEBER", "QRY_AUX", "Bcoreceber", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PREFIXO", "QRY_AUX", "Prefixo", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NUMERO", "QRY_AUX", "Numero", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PARCELA", "QRY_AUX", "Parcela", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPO", "QRY_AUX", "Tipo", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CODNATUREZA", "QRY_AUX", "Cod Natureza", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NATUREZA", "QRY_AUX", "Natureza", /*Picture*/, 30, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PRORROGADO", "QRY_AUX", "Prorrogado", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DIAS_PRORROGADO", "QRY_AUX", "Dias Prorrogado", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CODCLI", "QRY_AUX", "Codcli", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LOJA", "QRY_AUX", "Loja", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOME", "QRY_AUX", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FANTASIA", "QRY_AUX", "Fantasia", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENCORIGEM", "QRY_AUX", "Vencorigem", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "EMISSAO", "QRY_AUX", "Emissao", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENCIMENTO", "QRY_AUX", "Vencimento", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENCREA", "QRY_AUX", "Vencrea", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR", "QRY_AUX", "Valor", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "RS", "QRY_AUX", "R$", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "SALDO", "QRY_AUX", "Saldo", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VB", "QRY_AUX", "VB-", "@E 9,999,999,999,999.99"                      , 16, /*lPixel*/,/*{|| code-block de impressao }/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign /,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "AB", "QRY_AUX", "AB-", "@E 9,999,999,999,999.99"                      , 16, /*lPixel*/,/*{|| code-block de impressao }/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign /,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)	
	TRCell():New(oSectDad, "RS_LIQUIDO", "QRY_AUX", "R$ Liquido", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BAIXA", "QRY_AUX", "Baixa", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BORDERO", "QRY_AUX", "Bordero", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTBORDERO", "QRY_AUX", "Dtbordero", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOMEBANCO", "QRY_AUX", "Nomebanco", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENDEDOR", "QRY_AUX", "Vendedor", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CARTEIRA", "QRY_AUX", "Carteira", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DESCCARTEIRA", "QRY_AUX", "Desc Carteira", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "EA_NUMCON", "QRY_AUX", "Numero Conta", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ATRASO", "QRY_AUX", "Atraso", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
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
	
	U_xPutSx1(cPerg,"01","Cliente De ?","","","mv_CH1","C",06,0,0,"G","","SA1","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Cliente Até ?","","","mv_CH2","C",06,0,0,"G","","SA1","","","MV_PAR02","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"03","Loja De ?","","","mv_CH3","C",02,0,0,"G","","","","","MV_PAR03","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"04","Loja Até ?","","","mv_CH4","C",02,0,0,"G","","","","","MV_PAR04","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"05","Emissão de ?","","","mv_CH5","D",08,0,0,"G","","","","","MV_PAR05","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"06","Emissão Até ?","","","mv_CH6","D",08,0,0,"G","","","","","MV_PAR06","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"07","Vencimento de ?","","","mv_CH7","D",08,0,0,"G","","","","","MV_PAR07","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"08","Vencimento Até ?","","","mv_CH8","D",08,0,0,"G","","","","","MV_PAR08","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"09","Imprimir Tipos ?","","","mv_CH9","C",40,0,0,"G","","","","","MV_PAR09","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"10","Não Imprimir Tipos ?","","","mv_CHA","C",40,0,0,"G","","","","","MV_PAR10","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"11","Do Banco ?","","","mv_CHB","C",03,0,0,"G","","BCO","","","MV_PAR11","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"12","Até o Banco ?","","","mv_CHC","C",03,0,0,"G","","BCO","","","MV_PAR12","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"13","Carteira De ?","","","mv_CHD","C",02,0,0,"G","","","","","MV_PAR13","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"14","Carteira Até ?","","","mv_CHE","C",02,0,0,"G","","","","","MV_PAR14","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"15","Do Vendedor ?","","","mv_CHF","C",06,0,0,"G","","SA3","","","MV_PAR15","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"16","Até o Vendedor ?","","","mv_CHG","C",06,0,0,"G","","SA3","","","MV_PAR16","","","","","","","","","","","","","","","","")	
	
	
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
	cQryAux += "SELECT 'EM ABERTO' AS SITUACAO,"		+ STR_PULA
	cQryAux += "  R.FILORI, "		+ STR_PULA
	cQryAux += "                R.BCORECEBER, "		+ STR_PULA
	cQryAux += "                R.FILIAL, "		+ STR_PULA
	cQryAux += "                R.PREFIXO, "		+ STR_PULA
	cQryAux += "                R.NUMERO, "		+ STR_PULA
	cQryAux += "                R.PARCELA, "		+ STR_PULA
	cQryAux += "                R.TIPO, "		+ STR_PULA
	cQryAux += "                R.CODNATUREZA, "		+ STR_PULA
	cQryAux += "                R.NATUREZA, "		+ STR_PULA
	cQryAux += "                R.PRORROGADO,"		+ STR_PULA
	cQryAux += "                R.DIAS_PRORROGADO,"		+ STR_PULA
	cQryAux += "                R.CODCLI, "		+ STR_PULA
	cQryAux += "                R.LOJA, "		+ STR_PULA
	cQryAux += "                R.NOME, "		+ STR_PULA
	cQryAux += "                R.FANTASIA, "		+ STR_PULA
	cQryAux += "                R.VENCORIGEM, "		+ STR_PULA
	cQryAux += "                R.EMISSAO, "		+ STR_PULA
	cQryAux += "                R.VENCIMENTO, "		+ STR_PULA
	cQryAux += "                R.VENCREA, "		+ STR_PULA
	cQryAux += "                R.VALOR, "		+ STR_PULA
	cQryAux += "                R.RS,"		+ STR_PULA
	cQryAux += "                R.SALDO, "		+ STR_PULA
	cQryAux += "                    (SELECT E1_SALDO "		+ STR_PULA
	cQryAux += "                   FROM SE1010 "		+ STR_PULA
	cQryAux += "                  WHERE R.FILIAL = E1_FILIAL "		+ STR_PULA
	cQryAux += "                   AND R.PREFIXO = E1_PREFIXO "		+ STR_PULA
	cQryAux += "                   AND R.NUMERO     = E1_NUM "		+ STR_PULA
	cQryAux += "                   AND R.PARCELA = E1_PARCELA "		+ STR_PULA
	cQryAux += "                   AND SE1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                   AND E1_TIPO IN ('VB-', 'VBC')) AS VB,"		+ STR_PULA
	cQryAux += "                (SELECT E1_SALDO "		+ STR_PULA
	cQryAux += "                   FROM SE1010 "		+ STR_PULA
	cQryAux += "                  WHERE R.FILIAL = E1_FILIAL "		+ STR_PULA
	cQryAux += "                   AND R.PREFIXO = E1_PREFIXO "		+ STR_PULA
	cQryAux += "                   AND R.NUMERO  = E1_NUM "			+ STR_PULA
	cQryAux += "                   AND R.PARCELA = E1_PARCELA "		+ STR_PULA
	cQryAux += "                   AND SE1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                   AND E1_TIPO ='AB-') AS AB,"		+ STR_PULA
	cQryAux += "                 (R.SALDO - (NVL((SELECT E1_SALDO "		+ STR_PULA
	cQryAux += "                   FROM SE1010 "		+ STR_PULA
	cQryAux += "                  WHERE R.FILIAL = E1_FILIAL "		+ STR_PULA
	cQryAux += "                   AND R.PREFIXO = E1_PREFIXO "		+ STR_PULA
	cQryAux += "                   AND R.NUMERO  = E1_NUM "			+ STR_PULA
	cQryAux += "                   AND R.PARCELA = E1_PARCELA "		+ STR_PULA
	cQryAux += "                   AND SE1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                   AND E1_TIPO IN ('VB-','VBC')),0) + "		+ STR_PULA
	cQryAux += "                NVL((SELECT E1_SALDO "		+ STR_PULA
	cQryAux += "                   FROM SE1010 "		+ STR_PULA
	cQryAux += "                  WHERE R.FILIAL = E1_FILIAL "		+ STR_PULA
	cQryAux += "                   AND R.PREFIXO = E1_PREFIXO "		+ STR_PULA
	cQryAux += "                   AND R.NUMERO  = E1_NUM "			+ STR_PULA
	cQryAux += "                   AND R.PARCELA = E1_PARCELA "		+ STR_PULA
	cQryAux += "                   AND SE1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                   AND E1_TIPO ='AB-'),0))) RS_LIQUIDO,"		+ STR_PULA
	cQryAux += "                R.BAIXA, "		+ STR_PULA
	cQryAux += "                R.BORDERO, "		+ STR_PULA
	cQryAux += "                R.DTBORDERO, "		+ STR_PULA
	cQryAux += "                A6.A6_NOME NOMEBANCO, "		+ STR_PULA
	cQryAux += "                R.VENDEDOR, "		+ STR_PULA
	cQryAux += "                R.CARTEIRA,"		+ STR_PULA
	cQryAux += "                FRV_DESCRI DESCCARTEIRA,"		+ STR_PULA
	cQryAux += "                A.EA_NUMCON,"		+ STR_PULA
	cQryAux += "                R.ATRASO"		+ STR_PULA
	cQryAux += "                   "		+ STR_PULA
	cQryAux += "FROM   (SELECT E1_FILIAL, "		+ STR_PULA
	cQryAux += "               E1_FILIAL                             FILIAL, "		+ STR_PULA
	cQryAux += "               E1_PREFIXO                            PREFIXO, "		+ STR_PULA
	cQryAux += "               E1_NUM                                NUMERO, "		+ STR_PULA
	cQryAux += "               E1_PARCELA                            PARCELA, "		+ STR_PULA
	cQryAux += "               E1_TIPO                               TIPO, "		+ STR_PULA
	cQryAux += "               E1_NATUREZ                            CODNATUREZA, "		+ STR_PULA
	cQryAux += "               ED_DESCRIC                            NATUREZA, "		+ STR_PULA
	cQryAux += "               E1_NUMBCO                             BANCO, "		+ STR_PULA
	cQryAux += "               E1_CLIENTE                            CODCLI, "		+ STR_PULA
	cQryAux += "               E1_LOJA                               LOJA, "		+ STR_PULA
	cQryAux += "               A1_NOME                               NOME, "		+ STR_PULA
	cQryAux += "               A1_NREDUZ                             FANTASIA, "		+ STR_PULA
	cQryAux += "               (CASE "		+ STR_PULA
	cQryAux += "               WHEN TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD') <> TO_DATE(TRIM(E1_VENCORI), 'YYYYMMDD')  THEN 'PRORROGADO'"		+ STR_PULA
	cQryAux += "               WHEN TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD') = TO_DATE(TRIM(E1_VENCORI), 'YYYYMMDD')  THEN  'NORMAL'"		+ STR_PULA
	cQryAux += "               END) PRORROGADO,"		+ STR_PULA
	cQryAux += "               (TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD') - TO_DATE(TRIM(E1_VENCORI), 'YYYYMMDD'))DIAS_PRORROGADO,"		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_VENCORI), 'YYYYMMDD') VENCORIGEM, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_EMISSAO), 'YYYYMMDD') EMISSAO, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD')  VENCIMENTO, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_VENCREA), 'YYYYMMDD')  VENCREA, "		+ STR_PULA
	cQryAux += "               E1_VALOR                              VALOR, "		+ STR_PULA
	cQryAux += "               E1_VLCRUZ                             RS,"		+ STR_PULA
	cQryAux += "               E1_SALDO                              SALDO,"		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_BAIXA), 'YYYYMMDD')   BAIXA, "		+ STR_PULA
	cQryAux += "               E1_NUMBOR                             BORDERO, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_DATABOR), 'YYYYMMDD') DTBORDERO, "		+ STR_PULA
	cQryAux += "               E1_HIST                               HISTORICO, "		+ STR_PULA
	cQryAux += "               E1_VEND1                              CODVEND, "		+ STR_PULA
	cQryAux += "               A3_NOME                               VENDEDOR, "		+ STR_PULA
	cQryAux += "               E1_FILORIG                            FILORI, "		+ STR_PULA
	cQryAux += "               E1_PORTADO                            BCORECEBER, "		+ STR_PULA
	cQryAux += "               E1_SITUACA                            CARTEIRA ,"		+ STR_PULA
	cQryAux += "               (TRUNC(SYSDATE )- TO_DATE(TRIM(E1_VENCORI), 'YYYYMMDD')) ATRASO"		+ STR_PULA
	cQryAux += "        FROM   SE1010 "		+ STR_PULA
	cQryAux += "               LEFT JOIN SED010 "		+ STR_PULA
	cQryAux += "                      ON E1_NATUREZ = ED_CODIGO "		+ STR_PULA
	cQryAux += "                      "		+ STR_PULA
	cQryAux += "               LEFT JOIN SA1010 "		+ STR_PULA
	cQryAux += "                      ON E1_CLIENTE = A1_COD "		+ STR_PULA
	cQryAux += "                         AND SA1010.D_E_L_E_T_ =' '"		+ STR_PULA
	cQryAux += "                         AND E1_LOJA = A1_LOJA "		+ STR_PULA
	cQryAux += "                         "		+ STR_PULA
	cQryAux += "               LEFT JOIN SA3010 "		+ STR_PULA
	cQryAux += "                      ON E1_VEND1 = A3_COD "		+ STR_PULA
	cQryAux += "                      AND SA3010.D_E_L_E_T_ =' '"		+ STR_PULA
	cQryAux += "                      "		+ STR_PULA
	cQryAux += "        WHERE  SE1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "               AND E1_TIPO NOT IN ('VB-','VBC','AB-')"		+ STR_PULA
	cQryAux += "               AND E1_SALDO <> 0"		+ STR_PULA
	cQryAux += "               ) R "		+ STR_PULA
	cQryAux += "               "		+ STR_PULA
	cQryAux += "       LEFT JOIN SEA010 A "		+ STR_PULA
	cQryAux += "              ON A.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                 AND R.PARCELA = A.EA_PARCELA "		+ STR_PULA
	cQryAux += "                 AND A.EA_FILORIG = R.FILORI "		+ STR_PULA
	cQryAux += "                 AND R.PREFIXO = A.EA_PREFIXO "		+ STR_PULA
	cQryAux += "                 AND R.NUMERO = A.EA_NUM"		+ STR_PULA
	cQryAux += "                 AND R.PARCELA = A.EA_PARCELA"		+ STR_PULA
	cQryAux += "                 AND R.TIPO = A.EA_TIPO"		+ STR_PULA
	cQryAux += "               "		+ STR_PULA
	cQryAux += "       LEFT JOIN SA6010 A6 "		+ STR_PULA
	cQryAux += "                 ON A6.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                 AND SUBSTR(A6.A6_FILIAL,1,2) =  SUBSTR(A.EA_FILIAL,1,2)"		+ STR_PULA
	cQryAux += "                 AND R.NUMERO = A.EA_NUM "		+ STR_PULA
	cQryAux += "                 AND A6.A6_COD = A.EA_PORTADO "		+ STR_PULA
	cQryAux += "                 AND A6.A6_NUMCON = A.EA_NUMCON"		+ STR_PULA
	cQryAux += "                 AND A6.A6_AGENCIA = A.EA_AGEDEP"		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "       LEFT JOIN FRV010 ON FRV010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux += "                       AND FRV_CODIGO = R.CARTEIRA"		+ STR_PULA
	cQryAux += "                       "		+ STR_PULA
	cQryAux += " 		WHERE R.CODCLI BETWEEN '" + MV_PAR01 +"' AND '"+ MV_PAR02 +"' 	" 		+ STR_PULA
	cQryAux += " 				 AND R.LOJA   BETWEEN '" + MV_PAR03 +"' AND '"+ MV_PAR04 +"' 	" + STR_PULA
	cQryAux += " 				 AND R.EMISSAO   BETWEEN '" + DTOS(MV_PAR05) +"' AND '"+ DTOS(MV_PAR06) +"' 	" + STR_PULA
	cQryAux += " 				 AND R.VENCIMENTO   BETWEEN '" + DTOS(MV_PAR07) +"' AND '"+ DTOS(MV_PAR08) +"' 	" + STR_PULA 
	If !Empty(MV_PAR09) // Deseja imprimir apenas os tipos do parametro 09
				cQryAux  += " 		AND R.TIPO IN "+FormatIn(MV_PAR09,";") + STR_PULA 
			ElseIf !Empty(MV_PAR10) // Deseja excluir os tipos do parametro 10
				cQryAux  += " 		AND R.TIPO NOT IN "+FormatIn(MV_PAR10,";") + STR_PULA 
	EndIf
	
	If Empty(MV_PAR09) .AND. Empty(MV_PAR10) //Se os dois parametros estiverem em Branco imprimir todos os tipos 
				cQryAux  += " 		AND R.TIPO <> ' ' "		+ STR_PULA
	EndIf	
	cQryAux += " 				 AND R.BANCO BETWEEN '" + MV_PAR11 +"' AND '"+ MV_PAR12 +"' 	" 		+ STR_PULA 	
	cQryAux += " 				 AND R.CARTEIRA BETWEEN '" + MV_PAR13 +"' AND '"+ MV_PAR14 +"' 	" 		+ STR_PULA  	
	cQryAux += " 				 AND R.CODVEND BETWEEN '" + MV_PAR15 +"' AND '"+ MV_PAR16 +"' 	" 		+ STR_PULA  
	
	MemoWrite("C:\teste\RELCR_V9.sql",cQryAux) //V6 01/12/2020 Carteiras  FRV

	//Teste Commit Caique SVN 
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
Retu
