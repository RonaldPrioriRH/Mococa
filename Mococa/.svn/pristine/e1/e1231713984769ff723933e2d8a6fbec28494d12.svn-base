//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELANALI
Relatório - Análise comportamento e Atraso
@author TREPORT
@since 31/07/2018
@version 1.0
	@example
	u_RELANALI()
	@obs Função gerada pelo TREPORT()
/*/
	
User Function RELANALI()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELANALI"
	
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
	oReport := TReport():New(	"RELANALI",;		//Nome do Relatório
								"Análise Comportamento e Atraso",;		//Título
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
	TRCell():New(oSectDad, "SITUACAO", "QRY_AUX", "Situacao", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PREFIXO", "QRY_AUX", "Prefixo", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NUMERO", "QRY_AUX", "Numero", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PARCELA", "QRY_AUX", "Parcela", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPO", "QRY_AUX", "Tipo", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CODNATUREZA", "QRY_AUX", "Codnatureza", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DESCNATU", "QRY_AUX", "Descnatu", /*Picture*/, 30, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PRORROGADO", "QRY_AUX", "Prorrogado", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DIASPRORROGADO", "QRY_AUX", "Diasprorrogado", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CODCLI", "QRY_AUX", "Codcli", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LOJA", "QRY_AUX", "Loja", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOME", "QRY_AUX", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FANTASIA", "QRY_AUX", "Fantasia", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ESTADO", "QRY_AUX", "Estado", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "EMISSAO", "QRY_AUX", "Emissao", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENCIMENTO", "QRY_AUX", "Vencimento", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENCREA", "QRY_AUX", "Vencrea", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR", "QRY_AUX", "Valor", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "SALDO", "QRY_AUX", "Saldo", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BAIXA", "QRY_AUX", "Baixa", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BORDERO", "QRY_AUX", "Bordero", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTBORDERO", "QRY_AUX", "Dtbordero", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOMEBANCO", "QRY_AUX", "Nomebanco", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENDEDOR", "QRY_AUX", "Vendedor", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CARTEIRA", "QRY_AUX", "Carteira", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DESCARTEIRA", "QRY_AUX", "Descarteira", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ATRASO", "QRY_AUX", "Atraso", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DATABX", "QRY_AUX", "Databx", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MOTBAIXA", "QRY_AUX", "Motbaixa", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DOCBX", "QRY_AUX", "Docbx", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALORBX", "QRY_AUX", "Valorbx", "@E 999,999,999,999.99", 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOMEBANCOBX", "QRY_AUX", "Nomebancobx", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
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
	U_xPutSx1(cPerg,"09","Do Banco ?","","","mv_CH9","C",03,0,0,"G","","BCO","","","MV_PAR09","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"10","Até o Banco ?","","","mv_CHA","C",03,0,0,"G","","BCO","","","MV_PAR10","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"11","Carteira De ?","","","mv_CHB","C",02,0,0,"G","","","","","MV_PAR11","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"12","Carteira Até ?","","","mv_CHC","C",02,0,0,"G","","","","","MV_PAR12","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"13","Do Vendedor ?","","","mv_CHD","C",06,0,0,"G","","SA3","","","MV_PAR13","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"14","Até o Vendedor ?","","","mv_CHE","C",06,0,0,"G","","SA3","","","MV_PAR14","","","","","","","","","","","","","","","","")	
	//U_xPutSx1(cPerg,"15","Baixa de ?","","","mv_CHF","D",08,0,0,"G","","","","","MV_PAR15","","","","","","","","","","","","","","","","")
	//U_xPutSx1(cPerg,"16","Baixa Até ?","","","mv_CHG","D",08,0,0,"G","","","","","MV_PAR16","","","","","","","","","","","","","","","","")
	
	
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
	cQryAux += "SELECT 'EM ABERTO'                             AS SITUACAO, "		+ STR_PULA
	cQryAux += "       R.FILIAL, "		+ STR_PULA
	cQryAux += "       R.PREFIXO, "		+ STR_PULA
	cQryAux += "       R.NUMERO, "		+ STR_PULA
	cQryAux += "       R.PARCELA, "		+ STR_PULA
	cQryAux += "       R.TIPO, "		+ STR_PULA
	cQryAux += "       R.CODNATUREZA, "		+ STR_PULA
	cQryAux += "       TRIM(R.NATUREZA)                        DESCNATU, "		+ STR_PULA
	cQryAux += "       R.PRORROGADO, "		+ STR_PULA
	cQryAux += "       R.DIASPRORROGADO, "		+ STR_PULA
	cQryAux += "       R.CODCLI, "		+ STR_PULA
	cQryAux += "       R.LOJA, "		+ STR_PULA
	cQryAux += "       R.NOME, "		+ STR_PULA
	cQryAux += "       R.FANTASIA, "		+ STR_PULA
	cQryAux += "       R.ESTADO, "		+ STR_PULA
	cQryAux += "       R.EMISSAO, "		+ STR_PULA
	cQryAux += "       R.VENCIMENTO, "		+ STR_PULA
	cQryAux += "       R.VENCREA, "		+ STR_PULA
	cQryAux += "       R.VALOR, "		+ STR_PULA
	cQryAux += "       R.SALDO, "		+ STR_PULA
	cQryAux += "       R.BAIXA, "		+ STR_PULA
	cQryAux += "       R.BORDERO, "		+ STR_PULA
	cQryAux += "       R.DTBORDERO, "		+ STR_PULA
	cQryAux += "       A6.A6_NOME                              NOMEBANCO, "		+ STR_PULA
	cQryAux += "       R.VENDEDOR, "		+ STR_PULA
	cQryAux += "       R.CARTEIRA, "		+ STR_PULA
	cQryAux += "       (SELECT DISTINCT FRV_DESCRI "		+ STR_PULA
	cQryAux += "        FROM   FRV010 "		+ STR_PULA
	cQryAux += "        WHERE  FRV010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "               AND FRV_CODIGO = CARTEIRA)      DESCARTEIRA, "		+ STR_PULA
	cQryAux += "       R.ATRASO, "		+ STR_PULA
	cQryAux += "       TO_DATE(TRIM(E5_DATA), 'YYYYMMDD')      DATABX, "		+ STR_PULA
	cQryAux += "       E5_MOTBX                                MOTBAIXA, "		+ STR_PULA
	cQryAux += "       SUBSTR(E5_DOCUMEN, 16, 3)               DOCBX, "		+ STR_PULA
	cQryAux += "       E5_VALOR                                VALORBX, "		+ STR_PULA
	cQryAux += "       (SELECT DISTINCT A6_NOME "		+ STR_PULA
	cQryAux += "        FROM   SA6010 "		+ STR_PULA
	cQryAux += "        WHERE  SA6010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "               AND SUBSTR(A6_FILIAL, 1, 2) = SUBSTR(E5_FILIAL, 1, 2) "		+ STR_PULA
	cQryAux += "               AND E5_BANCO "		+ STR_PULA
	cQryAux += "                   || E5_AGENCIA "		+ STR_PULA
	cQryAux += "                   || E5_CONTA = A6_COD "		+ STR_PULA
	cQryAux += "                                 || A6_AGENCIA "		+ STR_PULA
	cQryAux += "                                 || A6_NUMCON) NOMEBANCOBX "		+ STR_PULA
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
	cQryAux += "               A1_EST                                ESTADO, "		+ STR_PULA
	cQryAux += "               A1_MUN                                MUNICIPIO, "		+ STR_PULA
	cQryAux += "               ( CASE "		+ STR_PULA
	cQryAux += "                   WHEN TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD') <> "		+ STR_PULA
	cQryAux += "                        TO_DATE(TRIM(E1_VENCORI), 'YYYYMMDD') THEN 'PRORROGADO' "		+ STR_PULA
	cQryAux += "                   WHEN TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD') = "		+ STR_PULA
	cQryAux += "                        TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD') THEN 'NORMAL' "		+ STR_PULA
	cQryAux += "                 END )                               PRORROGADO, "		+ STR_PULA
	cQryAux += "               ( TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD') - "		+ STR_PULA
	cQryAux += "                 TO_DATE(TRIM(E1_VENCORI), 'YYYYMMDD') ) "		+ STR_PULA
	cQryAux += "                                                     DIASPRORROGADO, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_VENCORI), 'YYYYMMDD') VENCORIGEM, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_EMISSAO), 'YYYYMMDD') EMISSAO, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD')  VENCIMENTO, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_VENCREA), 'YYYYMMDD') VENCREA, "		+ STR_PULA
	cQryAux += "               E1_VALOR                              VALOR, "		+ STR_PULA
	cQryAux += "               E1_SALDO                              SALDO, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_BAIXA), 'YYYYMMDD')   BAIXA, "		+ STR_PULA
	cQryAux += "               E1_NUMBOR                             BORDERO, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_DATABOR), 'YYYYMMDD') DTBORDERO, "		+ STR_PULA
	cQryAux += "               E1_HIST                               HISTORICO, "		+ STR_PULA
	cQryAux += "               E1_VEND1                              CODVEND, "		+ STR_PULA
	cQryAux += "               A3_NOME                               VENDEDOR, "		+ STR_PULA
	cQryAux += "               E1_FILORIG                            FILORI, "		+ STR_PULA
	cQryAux += "               E1_PORTADO                            BCORECEBER, "		+ STR_PULA
	cQryAux += "               E1_SITUACA                            CARTEIRA, "		+ STR_PULA
	cQryAux += "               ( CASE "		+ STR_PULA
	cQryAux += "                   WHEN E1_BAIXA = '  ' THEN ( TRUNC(SYSDATE) - TO_DATE( "		+ STR_PULA
	cQryAux += "                                               TRIM(E1_VENCREA), "		+ STR_PULA
	cQryAux += "                                                                'YYYYMMDD') ) "		+ STR_PULA
	cQryAux += "                   WHEN E1_BAIXA <> '  ' THEN ( "		+ STR_PULA
	cQryAux += "                   TO_DATE(TRIM(E1_BAIXA), 'YYYYMMDD') "		+ STR_PULA
	cQryAux += "                   - TO_DATE( "		+ STR_PULA
	cQryAux += "                   TRIM(E1_VENCREA), 'YYYYMMDD') ) "		+ STR_PULA
	cQryAux += "                 END )                               ATRASO, "		+ STR_PULA
	cQryAux += "               TRUNC(SYSDATE)                        AS DTBASE "		+ STR_PULA
	cQryAux += "        FROM   SE1010 "		+ STR_PULA
	cQryAux += "               LEFT JOIN SED010 "		+ STR_PULA
	cQryAux += "                      ON E1_NATUREZ = ED_CODIGO "		+ STR_PULA
	cQryAux += "               LEFT JOIN SA1010 "		+ STR_PULA
	cQryAux += "                      ON E1_CLIENTE = A1_COD "		+ STR_PULA
	cQryAux += "                         AND SA1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                         AND E1_LOJA = A1_LOJA "		+ STR_PULA
	cQryAux += "                         AND A1_COD NOT IN ( 'C02642', 'C02641' ) "		+ STR_PULA
	cQryAux += "               LEFT JOIN SA3010 "		+ STR_PULA
	cQryAux += "                      ON E1_VEND1 = A3_COD "		+ STR_PULA
	cQryAux += "                         AND SE1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                         AND SA3010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "        WHERE  SE1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "               AND A1_COD NOT IN ( 'C02642', 'C02641' ) "		+ STR_PULA
	cQryAux += "               AND E1_SALDO <> 0 "		+ STR_PULA
	//cQryAux += "               AND E1_NUM BETWEEN '000133655' AND '000133655' "		+ STR_PULA
	cQryAux += "               AND E1_NATUREZ IN ( '0101001', '0101004' ) "		+ STR_PULA
	cQryAux += "               AND E1_PREFIXO NOT IN ( 'E01', 'E02', 'GLF', 'GLA', "		+ STR_PULA
	cQryAux += "                                       'GLC', 'GLI', 'SIM' ) "		+ STR_PULA
	cQryAux += "               AND E1_TIPO NOT IN ( 'NCC', 'AB-', 'VBC', 'RA', 'DP' )) R "		+ STR_PULA
	cQryAux += "       LEFT JOIN SEA010 A "		+ STR_PULA
	cQryAux += "              ON A.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                 AND R.PARCELA = A.EA_PARCELA "		+ STR_PULA
	cQryAux += "                 AND A.EA_FILORIG = R.FILORI "		+ STR_PULA
	cQryAux += "                 AND R.PREFIXO = A.EA_PREFIXO "		+ STR_PULA
	cQryAux += "                 AND R.NUMERO = A.EA_NUM "		+ STR_PULA
	cQryAux += "                 AND R.PARCELA = A.EA_PARCELA "		+ STR_PULA
	cQryAux += "                 AND R.TIPO = A.EA_TIPO "		+ STR_PULA
	cQryAux += "                 AND A.EA_TRANSF <> 'S' "		+ STR_PULA
	cQryAux += "       LEFT JOIN SA6010 A6 "		+ STR_PULA
	cQryAux += "              ON A6.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                 AND SUBSTR(A6.A6_FILIAL, 1, 2) = SUBSTR(A.EA_FILIAL, 1, 2) "		+ STR_PULA
	cQryAux += "                 AND R.NUMERO = A.EA_NUM "		+ STR_PULA
	cQryAux += "                 AND A6.A6_COD = A.EA_PORTADO "		+ STR_PULA
	cQryAux += "                 AND A6.A6_NUMCON = A.EA_NUMCON "		+ STR_PULA
	cQryAux += "                 AND A6.A6_AGENCIA = A.EA_AGEDEP "		+ STR_PULA
	cQryAux += "       LEFT JOIN SE5010 "		+ STR_PULA
	cQryAux += "              ON SE5010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                 AND E5_FILORIG = FILIAL "		+ STR_PULA
	cQryAux += "                 AND E5_PREFIXO = PREFIXO "		+ STR_PULA
	cQryAux += "                 AND E5_NUMERO = NUMERO "		+ STR_PULA
	cQryAux += "                 AND E5_PARCELA = PARCELA "		+ STR_PULA
	cQryAux += "                 AND E5_TIPO = TIPO "		+ STR_PULA
	cQryAux += "                 AND E5_CLIFOR = CODCLI "		+ STR_PULA
	cQryAux += "                 AND E5_LOJA = LOJA "		+ STR_PULA
	cQryAux += "                 AND E5_TIPODOC NOT IN ( 'TR', 'RA', 'J2', 'ES', "		+ STR_PULA
	cQryAux += "                                         'CB', 'TE', 'M2', 'I2', "		+ STR_PULA
	cQryAux += "                                         'BL', 'CM', 'D2', 'BD', "		+ STR_PULA
	cQryAux += "                                         'E2', 'EI', 'PA', 'DB', "		+ STR_PULA
	cQryAux += "                                         'VM', 'TRF', 'MAN', 'JR', 'DC' ) "		+ STR_PULA
	cQryAux += "                 AND E5_MOTBX NOT IN ( ' ', 'TR', 'RA', 'J2', "		+ STR_PULA
	cQryAux += "                                       'ES', 'CB', 'TE', 'M2', "		+ STR_PULA
	cQryAux += "                                       'I2', 'BL', 'CM', 'D2', "		+ STR_PULA
	cQryAux += "                                       'BD', 'E2', 'EI', 'PA', "		+ STR_PULA
	cQryAux += "                                       'DB', 'VM', 'TRF', 'MAN', 'JR' ) "		+ STR_PULA
	cQryAux += " 		WHERE R.CODCLI BETWEEN '" + MV_PAR01 +"' AND '"+ MV_PAR02 +"' 	" 		+ STR_PULA
	cQryAux += " 				 AND R.LOJA   BETWEEN '" + MV_PAR03 +"' AND '"+ MV_PAR04 +"' 	" + STR_PULA
	cQryAux += " 				 AND R.EMISSAO   BETWEEN '" + DTOS(MV_PAR05) +"' AND '"+ DTOS(MV_PAR06) +"' 	" + STR_PULA
	cQryAux += " 				 AND R.VENCIMENTO   BETWEEN '" + DTOS(MV_PAR07) +"' AND '"+ DTOS(MV_PAR08) +"' 	" + STR_PULA 
	cQryAux += " 				 AND R.BANCO BETWEEN '" + MV_PAR09 +"' AND '"+ MV_PAR10 +"' 	" 		+ STR_PULA 	
	cQryAux += " 				 AND R.CARTEIRA BETWEEN '" + MV_PAR11 +"' AND '"+ MV_PAR12 +"' 	" 		+ STR_PULA  	
	cQryAux += " 				 AND R.CODVEND BETWEEN '" + MV_PAR13 +"' AND '"+ MV_PAR14 +"' 	" 		+ STR_PULA
	//cQryAux += " 				 AND R.BAIXA   BETWEEN '" + DTOS(MV_PAR15) +"' AND '"+ DTOS(MV_PAR16) +"' 	" + STR_PULA  
	cQryAux += "UNION ALL "		+ STR_PULA
	cQryAux += "SELECT 'BAIXADO'                               AS SITUACAO, "		+ STR_PULA
	cQryAux += "       R.FILIAL, "		+ STR_PULA
	cQryAux += "       R.PREFIXO, "		+ STR_PULA
	cQryAux += "       R.NUMERO, "		+ STR_PULA
	cQryAux += "       R.PARCELA, "		+ STR_PULA
	cQryAux += "       R.TIPO, "		+ STR_PULA
	cQryAux += "       R.CODNATUREZA, "		+ STR_PULA
	cQryAux += "       TRIM(R.NATUREZA)                        DESCNATU, "		+ STR_PULA
	cQryAux += "       R.PRORROGADO, "		+ STR_PULA
	cQryAux += "       R.DIASPRORROGADO, "		+ STR_PULA
	cQryAux += "       R.CODCLI, "		+ STR_PULA
	cQryAux += "       R.LOJA, "		+ STR_PULA
	cQryAux += "       R.NOME, "		+ STR_PULA
	cQryAux += "       R.FANTASIA, "		+ STR_PULA
	cQryAux += "       R.ESTADO, "		+ STR_PULA
	cQryAux += "       R.EMISSAO, "		+ STR_PULA
	cQryAux += "       R.VENCIMENTO, "		+ STR_PULA
	cQryAux += "       R.VENCREA, "		+ STR_PULA
	cQryAux += "       R.VALOR, "		+ STR_PULA
	cQryAux += "       R.SALDO, "		+ STR_PULA
	cQryAux += "       R.BAIXA, "		+ STR_PULA
	cQryAux += "       R.BORDERO, "		+ STR_PULA
	cQryAux += "       R.DTBORDERO, "		+ STR_PULA
	cQryAux += "       A6.A6_NOME                              NOMEBANCO, "		+ STR_PULA
	cQryAux += "       R.VENDEDOR, "		+ STR_PULA
	cQryAux += "       R.CARTEIRA, "		+ STR_PULA
	cQryAux += "       (SELECT DISTINCT FRV_DESCRI "		+ STR_PULA
	cQryAux += "        FROM   FRV010 "		+ STR_PULA
	cQryAux += "        WHERE  FRV010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "               AND FRV_CODIGO = CARTEIRA)      DESCARTEIRA, "		+ STR_PULA
	cQryAux += "       R.ATRASO, "		+ STR_PULA
	cQryAux += "       TO_DATE(TRIM(E5_DATA), 'YYYYMMDD')      DATABX, "		+ STR_PULA
	cQryAux += "       E5_MOTBX                                MOTBAIXA, "		+ STR_PULA
	cQryAux += "       SUBSTR(E5_DOCUMEN, 16, 3)               DOCBX, "		+ STR_PULA
	cQryAux += "       E5_VALOR                                VALORBX, "		+ STR_PULA
	cQryAux += "       (SELECT DISTINCT A6_NOME "		+ STR_PULA
	cQryAux += "        FROM   SA6010 "		+ STR_PULA
	cQryAux += "        WHERE  SA6010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "               AND SUBSTR(A6_FILIAL, 1, 2) = SUBSTR(E5_FILIAL, 1, 2) "		+ STR_PULA
	cQryAux += "               AND E5_BANCO "		+ STR_PULA
	cQryAux += "                   || E5_AGENCIA "		+ STR_PULA
	cQryAux += "                   || E5_CONTA = A6_COD "		+ STR_PULA
	cQryAux += "                                 || A6_AGENCIA "		+ STR_PULA
	cQryAux += "                                 || A6_NUMCON) NOMEBANCOBX "		+ STR_PULA
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
	cQryAux += "               A1_EST                                ESTADO, "		+ STR_PULA
	cQryAux += "               A1_MUN                                MUNICIPIO, "		+ STR_PULA
	cQryAux += "               ( CASE "		+ STR_PULA
	cQryAux += "                   WHEN TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD') <> "		+ STR_PULA
	cQryAux += "                        TO_DATE(TRIM(E1_VENCORI), 'YYYYMMDD') THEN 'PRORROGADO' "		+ STR_PULA
	cQryAux += "                   WHEN TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD') = "		+ STR_PULA
	cQryAux += "                        TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD') THEN 'NORMAL' "		+ STR_PULA
	cQryAux += "                 END )                               PRORROGADO, "		+ STR_PULA
	cQryAux += "               ( TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD') - "		+ STR_PULA
	cQryAux += "                 TO_DATE(TRIM(E1_VENCORI), 'YYYYMMDD') ) "		+ STR_PULA
	cQryAux += "                                                     DIASPRORROGADO, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_VENCORI), 'YYYYMMDD') VENCORIGEM, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_EMISSAO), 'YYYYMMDD') EMISSAO, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD')  VENCIMENTO, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_VENCREA), 'YYYYMMDD') VENCREA, "		+ STR_PULA
	cQryAux += "               E1_VALOR                              VALOR, "		+ STR_PULA
	cQryAux += "               E1_SALDO                              SALDO, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_BAIXA), 'YYYYMMDD')   BAIXA, "		+ STR_PULA
	cQryAux += "               E1_NUMBOR                             BORDERO, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_DATABOR), 'YYYYMMDD') DTBORDERO, "		+ STR_PULA
	cQryAux += "               E1_HIST                               HISTORICO, "		+ STR_PULA
	cQryAux += "               E1_VEND1                              CODVEND, "		+ STR_PULA
	cQryAux += "               A3_NOME                               VENDEDOR, "		+ STR_PULA
	cQryAux += "               E1_FILORIG                            FILORI, "		+ STR_PULA
	cQryAux += "               E1_PORTADO                            BCORECEBER, "		+ STR_PULA
	cQryAux += "               E1_SITUACA                            CARTEIRA, "		+ STR_PULA
	cQryAux += "               ( CASE "		+ STR_PULA
	cQryAux += "                   WHEN E1_BAIXA = '  ' THEN ( TRUNC(SYSDATE) - TO_DATE( "		+ STR_PULA
	cQryAux += "                                               TRIM(E1_VENCREA), "		+ STR_PULA
	cQryAux += "                                                                'YYYYMMDD') ) "		+ STR_PULA
	cQryAux += "                   WHEN E1_BAIXA <> '  ' THEN ( "		+ STR_PULA
	cQryAux += "                   TO_DATE(TRIM(E1_BAIXA), 'YYYYMMDD') "		+ STR_PULA
	cQryAux += "                   - TO_DATE( "		+ STR_PULA
	cQryAux += "                   TRIM(E1_VENCREA), 'YYYYMMDD') ) "		+ STR_PULA
	cQryAux += "                 END )                               ATRASO "		+ STR_PULA
	cQryAux += "        FROM   SE1010 "		+ STR_PULA
	cQryAux += "               LEFT JOIN SED010 "		+ STR_PULA
	cQryAux += "                      ON E1_NATUREZ = ED_CODIGO "		+ STR_PULA
	cQryAux += "               LEFT JOIN SA1010 "		+ STR_PULA
	cQryAux += "                      ON E1_CLIENTE = A1_COD "		+ STR_PULA
	cQryAux += "                         AND SA1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                         AND E1_LOJA = A1_LOJA "		+ STR_PULA
	cQryAux += "                         AND A1_COD NOT IN ( 'C02642', 'C02641' ) "		+ STR_PULA
	cQryAux += "               LEFT JOIN SA3010 "		+ STR_PULA
	cQryAux += "                      ON E1_VEND1 = A3_COD "		+ STR_PULA
	cQryAux += "                         AND SE1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                         AND SA3010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "        WHERE  SE1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "               AND A1_COD NOT IN ( 'C02642', 'C02641' ) "		+ STR_PULA
	cQryAux += "               AND E1_NATUREZ IN ( '0101001', '0101004' ) "		+ STR_PULA
	cQryAux += "               AND E1_SALDO = 0 "		+ STR_PULA
	//cQryAux += "               AND E1_NUM BETWEEN '000133655' AND '000133655' "		+ STR_PULA
	cQryAux += "               AND E1_PREFIXO NOT IN ( 'E01', 'E02', 'GLF', 'GLA', "		+ STR_PULA
	cQryAux += "                                       'GLC', 'GLI', 'SIM' ) "		+ STR_PULA
	cQryAux += "               AND E1_TIPO NOT IN ( 'NCC', 'AB-', 'VBC', 'RA', 'DP' )) R "		+ STR_PULA
	cQryAux += "       LEFT JOIN SEA010 A "		+ STR_PULA
	cQryAux += "              ON A.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                 AND R.PARCELA = A.EA_PARCELA "		+ STR_PULA
	cQryAux += "                 AND A.EA_FILORIG = R.FILORI "		+ STR_PULA
	cQryAux += "                 AND R.PREFIXO = A.EA_PREFIXO "		+ STR_PULA
	cQryAux += "                 AND R.NUMERO = A.EA_NUM "		+ STR_PULA
	cQryAux += "                 AND R.PARCELA = A.EA_PARCELA "		+ STR_PULA
	cQryAux += "                 AND R.TIPO = A.EA_TIPO "		+ STR_PULA
	cQryAux += "                 AND A.EA_TRANSF <> 'S' "		+ STR_PULA
	cQryAux += "       LEFT JOIN SA6010 A6 "		+ STR_PULA
	cQryAux += "              ON A6.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                 AND SUBSTR(A6.A6_FILIAL, 1, 2) = SUBSTR(A.EA_FILIAL, 1, 2) "		+ STR_PULA
	cQryAux += "                 AND R.NUMERO = A.EA_NUM "		+ STR_PULA
	cQryAux += "                 AND A6.A6_COD = A.EA_PORTADO "		+ STR_PULA
	cQryAux += "                 AND A6.A6_NUMCON = A.EA_NUMCON "		+ STR_PULA
	cQryAux += "                 AND A6.A6_AGENCIA = A.EA_AGEDEP "		+ STR_PULA
	cQryAux += "       LEFT JOIN SE5010 "		+ STR_PULA
	cQryAux += "              ON SE5010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "                 AND E5_FILORIG = FILIAL "		+ STR_PULA
	cQryAux += "                 AND E5_PREFIXO = PREFIXO "		+ STR_PULA
	cQryAux += "                 AND E5_NUMERO = NUMERO "		+ STR_PULA
	cQryAux += "                 AND E5_PARCELA = PARCELA "		+ STR_PULA
	cQryAux += "                 AND E5_TIPO = TIPO "		+ STR_PULA
	cQryAux += "                 AND E5_CLIFOR = CODCLI "		+ STR_PULA
	cQryAux += "                 AND E5_LOJA = LOJA "		+ STR_PULA
	cQryAux += "                 AND E5_TIPODOC NOT IN ( 'TR', 'RA', 'J2', 'ES', "		+ STR_PULA
	cQryAux += "                                         'CB', 'TE', 'M2', 'I2', "		+ STR_PULA
	cQryAux += "                                         'BL', 'CM', 'D2', 'BD', "		+ STR_PULA
	cQryAux += "                                         'E2', 'EI', 'PA', 'DB', "		+ STR_PULA
	cQryAux += "                                         'VM', 'TRF', 'MAN', 'JR', 'DC' ) "		+ STR_PULA
	cQryAux += "                 AND E5_MOTBX NOT IN ( ' ', 'TR', 'RA', 'J2', "		+ STR_PULA
	cQryAux += "                                       'ES', 'CB', 'TE', 'M2', "		+ STR_PULA
	cQryAux += "                                       'I2', 'BL', 'CM', 'D2', "		+ STR_PULA
	cQryAux += "                                       'BD', 'E2', 'EI', 'PA', "		+ STR_PULA
	cQryAux += "                                       'DB', 'VM', 'TRF', 'MAN', "		+ STR_PULA
	cQryAux += "                                       'JR', 'DC' ) "		+ STR_PULA
	cQryAux += " 		WHERE R.CODCLI BETWEEN '" + MV_PAR01 +"' AND '"+ MV_PAR02 +"' 	" 		+ STR_PULA
	cQryAux += " 				 AND R.LOJA   BETWEEN '" + MV_PAR03 +"' AND '"+ MV_PAR04 +"' 	" + STR_PULA
	cQryAux += " 				 AND R.EMISSAO   BETWEEN '" + DTOS(MV_PAR05) +"' AND '"+ DTOS(MV_PAR06) +"' 	" + STR_PULA
	cQryAux += " 				 AND R.VENCIMENTO   BETWEEN '" + DTOS(MV_PAR07) +"' AND '"+ DTOS(MV_PAR08) +"' 	" + STR_PULA 
	cQryAux += " 				 AND R.BANCO BETWEEN '" + MV_PAR09 +"' AND '"+ MV_PAR10 +"' 	" 		+ STR_PULA 	
	cQryAux += " 				 AND R.CARTEIRA BETWEEN '" + MV_PAR11 +"' AND '"+ MV_PAR12 +"' 	" 		+ STR_PULA  	
	cQryAux += " 				 AND R.CODVEND BETWEEN '" + MV_PAR13 +"' AND '"+ MV_PAR14 +"' 	" 		+ STR_PULA  
	//cQryAux += " 				 AND R.BAIXA   BETWEEN '" + DTOS(MV_PAR15) +"' AND '"+ DTOS(MV_PAR16) +"' 	" + STR_PULA

	MemoWrite("C:\teste\RELANALI_V4.sql",cQryAux) //V4 05/01/21 sem data da baixa 
	
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
