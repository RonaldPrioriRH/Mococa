//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELPISE
Relatório - Relatorio Pis Cofins Entrada  
@author TReport
@since 26/09/2018
@version 1.0
	@example
	u_RELPISE()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELPISE()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := "RELPISE"
	
	ValPer01()
	
	if !Pergunte(cPerg, .T.)
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
	oReport := TReport():New(	"RELPISE",;		//Nome do Relatório
								"Relatorio Pis Cofins Entrada",;		//Título
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
	TRCell():New(oSectDad, "D1_FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_DOC", "QRY_AUX", "Documento", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_SERIE", "QRY_AUX", "Serie", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_EMISSAO", "QRY_AUX", "DT Emissao", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_DTDIGIT", "QRY_AUX", "DT Digitacao", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CNPJ", "QRY_AUX", "Cnpj", /*Picture*/, 14, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_FORNECE", "QRY_AUX", "Forn/Cliente", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_LOJA", "QRY_AUX", "Loja", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "EMITENTE", "QRY_AUX", "Emitente", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_TES", "QRY_AUX", "Tipo Entrada", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_CF", "QRY_AUX", "Cod. Fiscal", /*Picture*/, 5, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "B1_POSIPI", "QRY_AUX", "Pos.IPI/NCM", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_COD", "QRY_AUX", "Produto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "B1_DESC", "QRY_AUX", "Descricao", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_QUANT", "QRY_AUX", "Quantidade", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TOTPROD", "QRY_AUX", "Totprod", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_VALDESC", "QRY_AUX", "Desconto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_VALFRE", "QRY_AUX", "Vlr. Frete", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TOTNF", "QRY_AUX", "Totnf", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ICMS", "QRY_AUX", "Icms", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_VALICM", "QRY_AUX", "R$ICMS", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_VALIPI", "QRY_AUX", "Vlr.IPI", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BASCOFINS", "QRY_AUX", "Bascofins", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ALQCOFINS", "QRY_AUX", "Alqcofins", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALCOFINS", "QRY_AUX", "Valcofins", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BASPIS", "QRY_AUX", "Baspis", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ALPIS", "QRY_AUX", "Alpis", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALPIS", "QRY_AUX", "Valpis", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F4_CSTPIS", "QRY_AUX", "Sit.Trib.PIS", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F4_CSTCOF", "QRY_AUX", "Sit.Trib.COF", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F4_CODBCC", "QRY_AUX", "Cod.BC Cred.", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_CC", "QRY_AUX", "C Custo", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_CONTA", "QRY_AUX", "C Contabil", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F1_CHVNFE", "QRY_AUX", "Chave NFe", /*Picture*/, 44, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FT_OBSERV", "QRY_AUX", "Obs Liv. Fis", /*Picture*/, 31, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
Return oReport
	
	
	static function ValPer01()
		_sAlias := Alias()
		//Retirado Sangelles 22/03/2022 ->dbSelectArea("SX1")
		//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
		cPerg := PADR(cPerg, 10)
		
		U_xPutSx1(cPerg,"01","Digitação De ?","","","mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
		U_xPutSx1(cPerg,"02","Digitação Até ?","","","mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")
		
	return()
	
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
	cQryAux += "SELECT D1_FILIAL, "		+ STR_PULA
	cQryAux += "       D1_DOC, "		+ STR_PULA
	cQryAux += "       D1_SERIE,"		+ STR_PULA
	cQryAux += "       D1_EMISSAO, "		+ STR_PULA
	cQryAux += "       D1_DTDIGIT, "		+ STR_PULA
	cQryAux += "       (CASE SUBSTR(D1_FORNECE,1,1) WHEN 'C' THEN A1_CGC"		+ STR_PULA
	cQryAux += "                                    WHEN 'P' THEN A2_CGC"		+ STR_PULA
	cQryAux += "                                    WHEN 'T' THEN A2_CGC"		+ STR_PULA
	cQryAux += "                                    WHEN 'F' THEN A2_CGC  END)   CNPJ, "		+ STR_PULA
	cQryAux += "                                    "		+ STR_PULA
	cQryAux += "       D1_FORNECE, "		+ STR_PULA
	cQryAux += "       D1_LOJA,"		+ STR_PULA
	cQryAux += "       (CASE SUBSTR(D1_FORNECE,1,1) WHEN 'C' THEN A1_NOME"		+ STR_PULA
	cQryAux += "                                    WHEN 'P' THEN A2_NOME "		+ STR_PULA
	cQryAux += "                                    WHEN 'T' THEN A2_NOME "		+ STR_PULA
	cQryAux += "                                    WHEN 'F' THEN A2_NOME END)  EMITENTE, "		+ STR_PULA
	cQryAux += "       D1_TES,"		+ STR_PULA
	cQryAux += "       D1_CF, "		+ STR_PULA
	cQryAux += "       B1_POSIPI, "		+ STR_PULA
	cQryAux += "       D1_COD, "		+ STR_PULA
	cQryAux += "       B1_DESC, "		+ STR_PULA
	cQryAux += "       D1_QUANT,"		+ STR_PULA
	cQryAux += "       D1_TOTAL TOTPROD,"		+ STR_PULA
	cQryAux += "       D1_VALDESC,"		+ STR_PULA
	cQryAux += "       D1_VALFRE,"		+ STR_PULA
	cQryAux += "       ( D1_TOTAL + D1_ICMSRET + D1_VALIPI - D1_VALDESC + D1_VALFRE)                   AS TOTNF, "		+ STR_PULA
	cQryAux += "       D1_PICM ICMS,"		+ STR_PULA
	cQryAux += "       D1_VALICM R$ICMS,"		+ STR_PULA
	cQryAux += "       D1_VALIPI, "		+ STR_PULA
	cQryAux += "       D1_BASIMP5 AS BASCOFINS,"		+ STR_PULA
	cQryAux += "       D1_ALQIMP5 ALQCOFINS,"		+ STR_PULA
	cQryAux += "       D1_VALIMP5 VALCOFINS,"		+ STR_PULA
	cQryAux += "       D1_BASIMP6 AS BASPIS,"		+ STR_PULA
	cQryAux += "       D1_ALQIMP6 ALPIS,"		+ STR_PULA
	cQryAux += "       D1_VALIMP6 VALPIS,  "		+ STR_PULA
	cQryAux += "       F4_CSTPIS, "		+ STR_PULA
	cQryAux += "       F4_CSTCOF,  "		+ STR_PULA
	cQryAux += "       F4_CODBCC, "		+ STR_PULA
	cQryAux += "       D1_CC, "		+ STR_PULA
	cQryAux += "       D1_CONTA, "		+ STR_PULA
	cQryAux += "       F1_CHVNFE, "		+ STR_PULA
	cQryAux += "       FT_OBSERV"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "FROM   SD1010 "		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "       LEFT JOIN SA2010 "		+ STR_PULA
	cQryAux += "              ON D1_FORNECE = A2_COD "		+ STR_PULA
	cQryAux += "                 AND D1_LOJA = A2_LOJA  "		+ STR_PULA
	cQryAux += "                 AND SA2010.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "       LEFT JOIN SA1010 "		+ STR_PULA
	cQryAux += "              ON D1_FORNECE = A1_COD "		+ STR_PULA
	cQryAux += "                 AND D1_LOJA = A1_LOJA  "		+ STR_PULA
	cQryAux += "                 AND SA1010.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "       LEFT JOIN SB1010 "		+ STR_PULA
	cQryAux += "              ON D1_COD = B1_COD "		+ STR_PULA
	cQryAux += "                 AND SB1010.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "       LEFT JOIN SF4010 "		+ STR_PULA
	cQryAux += "              ON D1_TES = F4_CODIGO "		+ STR_PULA
	cQryAux += "                 AND D1_FILIAL = F4_FILIAL "		+ STR_PULA
	cQryAux += "                 AND SF4010.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQryAux += "                 "		+ STR_PULA
	cQryAux += "       INNER JOIN SF1010 "		+ STR_PULA
	cQryAux += "              ON F1_FILIAL = D1_FILIAL "		+ STR_PULA
	cQryAux += "                 AND F1_DOC = D1_DOC "		+ STR_PULA
	cQryAux += "                 AND F1_SERIE = D1_SERIE "		+ STR_PULA
	cQryAux += "                 AND F1_FORNECE = D1_FORNECE"		+ STR_PULA
	cQryAux += "                 AND F1_LOJA    = D1_LOJA"		+ STR_PULA
	cQryAux += "                 AND SF1010.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQryAux += "   "		+ STR_PULA
	cQryAux += "        LEFT JOIN SFT010 "		+ STR_PULA
	cQryAux += "         ON  SFT010.D_E_L_E_T_  = '  ' "		+ STR_PULA
	cQryAux += "                 AND D1_FILIAL  = FT_FILIAL "		+ STR_PULA
	cQryAux += "                 AND D1_DOC     = FT_NFISCAL"		+ STR_PULA
	cQryAux += "                 AND D1_SERIE   = FT_SERIE "		+ STR_PULA
	cQryAux += "                 AND D1_COD     = FT_PRODUTO"		+ STR_PULA
	cQryAux += "                 AND D1_ITEM    = FT_ITEM"		+ STR_PULA
	cQryAux += "                 AND D1_FORNECE = FT_CLIEFOR"		+ STR_PULA
	cQryAux += "                 AND D1_LOJA    = FT_LOJA"		+ STR_PULA
	cQryAux += "       "		+ STR_PULA
	cQryAux += "WHERE  SD1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "       AND D1_FILIAL <> ' ' "		+ STR_PULA
	cQryAux += "       AND D1_DTDIGIT BETWEEN '"+ DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' "	+ STR_PULA
	
	MemoWrite("C:\teste\RELPISE_V2.sql", cQryAux) //06/05/19 
	
	cQryAux := ChangeQuery(cQryAux)
	
	//Executando consulta e setando o total da régua
	TCQuery cQryAux New Alias "QRY_AUX"
	Count to nTotal
	oReport:SetMeter(nTotal)
	TCSetField("QRY_AUX", "D1_EMISSAO", "D")
	TCSetField("QRY_AUX", "D1_DTDIGIT", "D")
	
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
