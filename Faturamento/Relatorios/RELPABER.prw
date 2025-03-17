//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELPABER
Whintor - 8201 - Pedidos em Aberto                  
@author TReport
@since 07/08/2020
@version 1.0
	@example
	u_RELPABER()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELPABER()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
		//Definições da pergunta
	cPerg := "RELPABER"
	
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
	//Local oBreak := Nil
	
	//Criação do componente de impressão
	oReport := TReport():New(	"RELPABER",;		//Nome do Relatório
								"8201 - Pedidos em Aberto",;		//Título
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
									"Dados",;		//Descrição da seção
									{"QRY_AUX"})		//Tabelas utilizadas, a primeira será considerada como principal da seção
	oSectDad:SetTotalInLine(.F.)  //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
	//Colunas do relatório
	TRCell():New(oSectDad, "DATA", "QRY_AUX", "Data", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "C5_FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "C5_NUM", "QRY_AUX", "Numero", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "C5_XPVSGAC", "QRY_AUX", "Pedido SGAC", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "B1_COD", "QRY_AUX", "Codigo", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "B1_DESC", "QRY_AUX", "Descricao", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "C6_LOCAL", "QRY_AUX", "Armazem", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A1_COD", "QRY_AUX", "Codigo", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A1_LOJA", "QRY_AUX", "Loja", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A1_NOME", "QRY_AUX", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A1_EST", "QRY_AUX", "Estado", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "C6_QTDVEN", "QRY_AUX", "Quantidade", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "C6_VALOR", "QRY_AUX", "Vlr.Total", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "C5_XFILEST", "QRY_AUX", "Fil. Estoque", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "C5_XFILINT", "QRY_AUX", "Fil. Interm.", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTENTREGA", "QRY_AUX", "Dtentrega", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "C9_CARGA", "QRY_AUX", "N. da Carga", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "STATUS", "QRY_AUX", "Status", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CONDPAG", "QRY_AUX", "Condpag", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "E4_DESCRI", "QRY_AUX", "Descricao", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "C5_VEND1", "QRY_AUX", "Vendedor 1", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A3_NOME", "QRY_AUX", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PESOBRUTO", "QRY_AUX", "Pesobruto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPO_DE_FRETE", "QRY_AUX", "Tipo_de_frete", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "AOBS", "QRY_AUX", "Obs", /*Picture*/, 25, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BOBS", "QRY_AUX", "Obs1", /*Picture*/, 50, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COBS", "QRY_AUX", "Obs2", /*Picture*/, 50, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "AOBSENTREGA", "QRY_AUX", "Obsentrega1", /*Picture*/, 75, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BOBSENTREGA", "QRY_AUX", "Obsentrega2", /*Picture*/, 75, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COBSENTREGA", "QRY_AUX", "Obsentrega3", /*Picture*/, 75, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DOBSENTREGA", "QRY_AUX", "Obsentrega4", /*Picture*/, 75, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A1_MUN", "QRY_AUX", "Municipio", /*Picture*/, 60, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "C6_NUMPCOM", "QRY_AUX", "Num.Ped.Comp", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "REGIAO", "QRY_AUX", "Regiao", /*Picture*/, 12, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPOCARGA", "QRY_AUX", "Tipo Carga", /*Picture*/, 11, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "REGIONAL", "QRY_AUX", "Regional", /*Picture*/, 55, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)

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
	cQryAux += "SELECT DISTINCT TO_DATE(TRIM(C5_EMISSAO), 'YYYYMMDD') AS DATA, "		+ STR_PULA
	cQryAux += "                C5_FILIAL, "		+ STR_PULA
	cQryAux += "                C5_NUM, "		+ STR_PULA
	cQryAux += "                C5_XPVSGAC, "		+ STR_PULA
	cQryAux += "                B1_COD, "		+ STR_PULA
	cQryAux += "                B1_DESC, "		+ STR_PULA
	cQryAux += "                C6_LOCAL, "		+ STR_PULA
	cQryAux += "                A1_COD, "		+ STR_PULA
	cQryAux += "                A1_LOJA, "		+ STR_PULA
	cQryAux += "                A1_NOME, "		+ STR_PULA
	cQryAux += "                A1_EST, "		+ STR_PULA
	cQryAux += "                C6_QTDVEN, "		+ STR_PULA
	cQryAux += "                C6_VALOR, "		+ STR_PULA
	cQryAux += "                C5_XFILEST, "		+ STR_PULA
	cQryAux += "                C5_XFILINT, "		+ STR_PULA
	cQryAux += "                TO_DATE(TRIM(C6_ENTREG), 'YYYYMMDD')  AS DTENTREGA, "		+ STR_PULA
	cQryAux += "                C9_CARGA, "		+ STR_PULA
	cQryAux += "                CASE "		+ STR_PULA
	cQryAux += "                  WHEN C9_BLEST <> '10' "		+ STR_PULA
	cQryAux += "                       AND C9_BLCRED <> '09' "		+ STR_PULA
	cQryAux += "                       AND C9_BLCRED = ' ' "		+ STR_PULA
	cQryAux += "                       AND C9_BLEST <> ' ' THEN 'ESTOQUE' "		+ STR_PULA
	cQryAux += "                  WHEN C9_BLCRED = '09' THEN 'REJEITADO' "		+ STR_PULA
	cQryAux += "                  WHEN C9_BLCRED <> ' ' "		+ STR_PULA
	cQryAux += "                       AND C9_BLCRED <> '10' "		+ STR_PULA
	cQryAux += "                       AND C9_BLCRED <> '09' THEN 'CREDITO' "		+ STR_PULA
	cQryAux += "                  WHEN C9_BLCRED = ' ' "		+ STR_PULA
	cQryAux += "                       AND C9_BLEST = ' ' THEN 'LIBERADO' "		+ STR_PULA
	cQryAux += "                  ELSE 'ABERTO' "		+ STR_PULA
	cQryAux += "                END                                   AS STATUS, "		+ STR_PULA
	cQryAux += "                E4_CODIGO                             CONDPAG, "		+ STR_PULA
	cQryAux += "                E4_DESCRI, "		+ STR_PULA
	cQryAux += "                C5_VEND1, "		+ STR_PULA
	cQryAux += "                A3_NOME, "		+ STR_PULA
	cQryAux += "                ( B1_PESBRU * C6_QTDVEN )             AS PESOBRUTO,"		+ STR_PULA
	cQryAux += "                (CASE C5_TPFRETE "		+ STR_PULA
	cQryAux += "                           WHEN 'C' THEN 'CIF'"		+ STR_PULA
	cQryAux += "                           WHEN 'F' THEN 'FOB'"		+ STR_PULA
	cQryAux += "                           WHEN 'T' THEN 'FOB'"		+ STR_PULA
	cQryAux += "                           WHEN 'R' THEN 'CIF'"		+ STR_PULA
	cQryAux += "                           WHEN 'D' THEN 'FOB'"		+ STR_PULA
	cQryAux += "                           WHEN 'S' THEN 'FOB' END) AS TIPO_DE_FRETE "		+ STR_PULA
	cQryAux += "         ,C.OBS AS AOBS"		+ STR_PULA
	cQryAux += "         ,C.OBS1 AS BOBS"		+ STR_PULA
	cQryAux += "         ,C.OBS2 AS COBS"		+ STR_PULA
	cQryAux += "         ,C.OBSENTREGA1 AS AOBSENTREGA"		+ STR_PULA
	cQryAux += "         ,C.OBSENTREGA2 AS BOBSENTREGA"		+ STR_PULA
	cQryAux += "         ,C.OBSENTREGA3 AS COBSENTREGA"		+ STR_PULA
	cQryAux += "         ,C.OBSENTREGA4 AS DOBSENTREGA"		+ STR_PULA
	cQryAux += "         ,A1_MUN"		+ STR_PULA
	cQryAux += "         ,C6_NUMPCOM,"		+ STR_PULA
	cQryAux += "          ( CASE "		+ STR_PULA
	cQryAux += "           WHEN A1_EST IN ( 'GO', 'MT', 'MS', 'DF' ) THEN 'CENTRO OESTE' "		+ STR_PULA
	cQryAux += "           WHEN A1_EST IN ( 'AM', 'RR', 'AP', 'PA', "		+ STR_PULA
	cQryAux += "                            'TO', 'RO', 'AC' ) THEN 'NORTE' "		+ STR_PULA
	cQryAux += "           WHEN A1_EST IN ( 'MA', 'PI', 'CE', 'RN', "		+ STR_PULA
	cQryAux += "                            'PE', 'PB', 'SE', 'AL', 'BA' ) THEN 'NORDESTE' "		+ STR_PULA
	cQryAux += "           WHEN A1_EST IN ( 'SP', 'RJ', 'ES', 'MG' ) THEN 'SUDESTE' "		+ STR_PULA
	cQryAux += "           WHEN A1_EST IN ( 'PR', 'RS', 'SC' ) THEN 'SUL' "		+ STR_PULA
	cQryAux += "           WHEN A1_EST IN ( 'EX' ) THEN 'EXTERIOR' "		+ STR_PULA
	cQryAux += "         END )                              AS REGIAO,"		+ STR_PULA
	cQryAux += "         ( CASE B1_TIPCAR"		+ STR_PULA
	cQryAux += "          WHEN '000001' THEN 'CARGA SECA'"		+ STR_PULA
	cQryAux += "          ELSE 'REFRIGERADO'"		+ STR_PULA
	cQryAux += "          END )     AS TIPOCARGA,      "		+ STR_PULA
	cQryAux += "          TRIM(X5_DESCRI)  AS REGIONAL     "		+ STR_PULA
	cQryAux += "                           "		+ STR_PULA
	cQryAux += "FROM   SC6010"		+ STR_PULA
	cQryAux += "       LEFT JOIN SC5010 "		+ STR_PULA
	cQryAux += "              ON SC5010.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                 AND C5_NUM = C6_NUM "		+ STR_PULA
	cQryAux += "                 AND C5_FILIAL = C6_FILIAL "		+ STR_PULA
	cQryAux += "       LEFT JOIN PCFILIAL@WINTHOR2 F"		+ STR_PULA
	cQryAux += "              ON F.AK_CODIGO = C5_FILIAL"		+ STR_PULA
	cQryAux += "              "		+ STR_PULA
	cQryAux += "       LEFT JOIN PCPEDC@WINTHOR2 C  "		+ STR_PULA
	cQryAux += "              ON C.NUMPEDPROTHEUS = C5_NUM  "		+ STR_PULA
	cQryAux += "             AND C.CODFILIALNF    = F.CODIGO"		+ STR_PULA
	cQryAux += " "		+ STR_PULA
	cQryAux += "       LEFT JOIN SC9010 "		+ STR_PULA
	cQryAux += "              ON SC9010.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                 AND C9_PEDIDO = C6_NUM "		+ STR_PULA
	cQryAux += "                 AND C6_FILIAL = C9_FILIAL "		+ STR_PULA
	cQryAux += "                 AND C6_PRODUTO = C9_PRODUTO "		+ STR_PULA
	cQryAux += "                 AND C6_ITEM = C9_ITEM "		+ STR_PULA
	cQryAux += "                 AND C6_LOCAL = C9_LOCAL "		+ STR_PULA
	cQryAux += "                 AND C6_NOTA = C9_NFISCAL "		+ STR_PULA
	cQryAux += "       LEFT JOIN SB1010 "		+ STR_PULA
	cQryAux += "              ON SB1010.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                 AND B1_COD = C6_PRODUTO "		+ STR_PULA
	cQryAux += "       LEFT JOIN SA1010 "		+ STR_PULA
	cQryAux += "              ON SA1010.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                 AND A1_COD = C6_CLI "		+ STR_PULA
	cQryAux += "                 AND A1_LOJA = C6_LOJA "		+ STR_PULA
	cQryAux += "       LEFT JOIN SE4010 "		+ STR_PULA
	cQryAux += "              ON E4_CODIGO = C5_CONDPAG "		+ STR_PULA
	cQryAux += "                 AND SE4010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "       LEFT JOIN SA3010 "		+ STR_PULA
	cQryAux += "              ON A3_COD = C5_VEND1 "		+ STR_PULA
	cQryAux += "                 AND SA3010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "       LEFT JOIN SF4010 "		+ STR_PULA
	cQryAux += "              ON SF4010.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                 AND F4_CODIGO = C6_TES "		+ STR_PULA
	cQryAux += "                 AND F4_FILIAL = C6_FILIAL "		+ STR_PULA
	cQryAux += "       LEFT JOIN SX5010 "		+ STR_PULA
	cQryAux += "              ON A3_XREGVEN = X5_CHAVE "		+ STR_PULA
	cQryAux += "             AND 'Z4' = X5_TABELA "		+ STR_PULA
	cQryAux += "             AND SX5010.D_E_L_E_T_ = ' '            "		+ STR_PULA
	cQryAux += "WHERE  SC6010.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "       AND C9_NFISCAL = '  ' "		+ STR_PULA
	cQryAux += "       AND F4_DUPLIC = 'S' "		+ STR_PULA
	//cQryAux += "AND C5_EMISSAO BETWEEN '20200709' AND '20200709'     "		+ STR_PULA
	//cQryAux += "AND TO_DATE(C5_EMISSAO,'YYYYMMDD') BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	cQryAux += "	   AND C5_EMISSAO BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	cQryAux += "       AND A1_CGC NOT IN ( '52502507006269', '52502507006269', '52502507000309', "		+ STR_PULA
	cQryAux += "                           '52502507006854', "		+ STR_PULA
	cQryAux += "                           '52502507001208', '52502507006692', '52502507000813', "		+ STR_PULA
	cQryAux += "                               '26687598000122', "		+ STR_PULA
	cQryAux += "                           '52502507001895', '52502507001623', '52502507002271', "		+ STR_PULA
	cQryAux += "                               '52502507001976', "		+ STR_PULA
	cQryAux += "                           '52502507000147', '52502507001380', '26687598000203', "		+ STR_PULA
	cQryAux += "                               '26687598000475', "		+ STR_PULA
	cQryAux += "                           '26687598000394', '52502507000651' )"		+ STR_PULA
	
	MemoWrite("C:\teste\RELPABER_8201_v3.sql",cQryAux) //21/05/2021
	
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
