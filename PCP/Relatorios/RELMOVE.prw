//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)

	
/*/{Protheus.doc} RELMOVE
Relatório - Movimentações de Entrada      
@author TReport e
@since 19/03/2019
@version 1.0
	@example
	u_RELMOVE()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELMOVE()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELMOVE"
	
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
	Local oBreak := Nil
	
	//Criação do componente de impressão
	oReport := TReport():New(	"RELMOVE",;		//Nome do Relatório
								"Movimentações de Entrada",;		//Título
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
	TRCell():New(oSectDad, "F1_FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F1_DTDIGIT", "QRY_AUX", "Dt.Digitacao", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F1_DTEMISSAO", "QRY_AUX", "F1_dtemissao", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F1_ESPECIE", "QRY_AUX", "Espec.Docum.", /*Picture*/, 5, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F1_DOC", "QRY_AUX", "Numero", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F1_SERIE", "QRY_AUX", "Serie", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F1_FORNECE", "QRY_AUX", "Fornecedor", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F1_LOJA", "QRY_AUX", "Loja", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A2_NOME", "QRY_AUX", "Razão Social", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A2_CGC", "QRY_AUX", "CNPJ/CPF", /*Picture*/, 14, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A2_EST", "QRY_AUX", "Estado", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A2_MUN", "QRY_AUX", "Munícipio", /*Picture*/, 60, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BM_GRUPO", "QRY_AUX", "Cod Grupo", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "B1_COD", "QRY_AUX", "Codigo", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "B1_DESC", "QRY_AUX", "Descricao", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "B1_UM", "QRY_AUX", "Unidade", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BM_DESC", "QRY_AUX", "Desc Grupo", /*Picture*/, 30, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CFOP", "QRY_AUX", "Cfop", /*Picture*/, 5, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_QUANT", "QRY_AUX", "Quantidade", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_VUNIT", "QRY_AUX", "Vlr.Unitario", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_VALDESC", "QRY_AUX", "Desconto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_TOTBRUT", "QRY_AUX", "D1_totbrut", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "D1_TOTLIQ", "QRY_AUX", "D1_totliq", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CST", "QRY_AUX", "Cod.Ident.", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BASEICM", "QRY_AUX", "Baseicm", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PICM", "QRY_AUX", "Picm", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VLICMUNIT", "QRY_AUX", "Vlicmunit", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FT_CSTPIS", "QRY_AUX", "CST Pis", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FT_BASEPIS", "QRY_AUX", "Base PIS", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FT_ALIQPIS", "QRY_AUX", "Aliq. PIS", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FT_VALPIS", "QRY_AUX", "Valor PIS", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FT_CSTCOF", "QRY_AUX", "CST COF", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FT_BASECOF", "QRY_AUX", "Base COFINS", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FT_ALIQCOF", "QRY_AUX", "Aliq. COFINS", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FT_VALCOF", "QRY_AUX", "Valor COFINS", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALORTOTAL", "QRY_AUX", "Valortotal", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F1_DESCONT", "QRY_AUX", "Descontos", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F1_VALMERC", "QRY_AUX", "Vlr.Mercad", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CODCONTA", "QRY_AUX", "Codconta", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DCCONTA", "QRY_AUX", "Dcconta", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F1_CHVNFE", "QRY_AUX", "Chave NFe", /*Picture*/, 44, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
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
	
	U_xPutSx1(cPerg,"01","Data de Digitação De ?"," "," ","mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Data de Digitação Até ?"," "," ","mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")


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
	cQryAux += "SELECT SF1.F1_FILIAL, "		+ STR_PULA
	cQryAux += "       TO_DATE(SF1.F1_DTDIGIT, 'YYYYMMDD') AS F1_DTDIGIT, "		+ STR_PULA
	cQryAux += "       TO_DATE(SF1.F1_EMISSAO, 'YYYYMMDD') AS F1_DTEMISSAO, "		+ STR_PULA
	cQryAux += "       SF1.F1_ESPECIE, "		+ STR_PULA
	cQryAux += "       SF1.F1_DOC, "		+ STR_PULA
	cQryAux += "       SF1.F1_SERIE, "		+ STR_PULA
	cQryAux += "       SF1.F1_FORNECE, "		+ STR_PULA
	cQryAux += "       SF1.F1_LOJA, "		+ STR_PULA
	cQryAux += "       SA2.A2_NOME, "		+ STR_PULA
	cQryAux += "       SA2.A2_CGC, "		+ STR_PULA
	cQryAux += "       SA2.A2_EST, "		+ STR_PULA
	cQryAux += "       SA2.A2_MUN, "		+ STR_PULA
	cQryAux += "       SBM.BM_GRUPO, "		+ STR_PULA
	cQryAux += "       SB1.B1_COD, "		+ STR_PULA
	cQryAux += "       SB1.B1_DESC, "		+ STR_PULA
	cQryAux += "       SB1.B1_UM, "		+ STR_PULA
	cQryAux += "       SBM.BM_DESC, "		+ STR_PULA
	cQryAux += "       SF4.F4_CF                           AS CFOP, "		+ STR_PULA
	cQryAux += "       SD1.D1_QUANT, "		+ STR_PULA
	cQryAux += "       SD1.D1_VUNIT, "		+ STR_PULA
	cQryAux += "       SD1.D1_VALDESC, "		+ STR_PULA
	cQryAux += "       SD1.D1_TOTAL                        AS D1_TOTBRUT, "		+ STR_PULA
	cQryAux += "       ( SD1.D1_TOTAL - SD1.D1_VALDESC )   AS D1_TOTLIQ, "		+ STR_PULA
	cQryAux += "       SF4.F4_SITTRIB                      CST, "		+ STR_PULA
	cQryAux += "       SD1.D1_BASEICM                      AS BASEICM, "		+ STR_PULA
	cQryAux += "       SD1.D1_PICM                         AS PICM, "		+ STR_PULA
	cQryAux += "       SD1.D1_VALICM                       AS VLICMUNIT, "		+ STR_PULA
	cQryAux += "       SFT.FT_CSTPIS, "		+ STR_PULA
	cQryAux += "       SFT.FT_BASEPIS, "		+ STR_PULA
	cQryAux += "       SFT.FT_ALIQPIS, "		+ STR_PULA
	cQryAux += "       SFT.FT_VALPIS, "		+ STR_PULA
	cQryAux += "       SFT.FT_CSTCOF, "		+ STR_PULA
	cQryAux += "       SFT.FT_BASECOF, "		+ STR_PULA
	cQryAux += "       SFT.FT_ALIQCOF, "		+ STR_PULA
	cQryAux += "       SFT.FT_VALCOF, "		+ STR_PULA
	cQryAux += "       SF1.F1_VALBRUT                      AS VALORTOTAL, "		+ STR_PULA
	cQryAux += "       SF1.F1_DESCONT, "		+ STR_PULA
	cQryAux += "       SF1.F1_VALMERC, "		+ STR_PULA
	cQryAux += "       SD1.D1_CONTA                        AS CODCONTA, "		+ STR_PULA
	cQryAux += "       CT1.CT1_DESC01                      DCCONTA, "		+ STR_PULA
	cQryAux += "       SF1.F1_CHVNFE "		+ STR_PULA
	cQryAux += "FROM   SD1010 SD1 "		+ STR_PULA
	cQryAux += "       LEFT JOIN SF1010 SF1 "		+ STR_PULA
	cQryAux += "              ON SF1.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                 AND SF1.F1_FILIAL = SD1.D1_FILIAL "		+ STR_PULA
	cQryAux += "                 AND SF1.F1_DOC = SD1.D1_DOC "		+ STR_PULA
	cQryAux += "                 AND SF1.F1_DTDIGIT = SD1.D1_DTDIGIT "		+ STR_PULA
	cQryAux += "       LEFT JOIN SA2010 SA2 "		+ STR_PULA
	cQryAux += "              ON SA2.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                 AND F1_FORNECE "		+ STR_PULA
	cQryAux += "                     ||F1_LOJA = A2_COD "		+ STR_PULA
	cQryAux += "                                 ||A2_LOJA "		+ STR_PULA
	cQryAux += "       LEFT JOIN SB1010 SB1 "		+ STR_PULA
	cQryAux += "              ON SB1.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                 AND SB1.B1_COD = SD1.D1_COD "		+ STR_PULA
	cQryAux += "       LEFT JOIN SBM010 SBM "		+ STR_PULA
	cQryAux += "              ON SBM.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                 AND SBM.BM_GRUPO = SB1.B1_GRUPO "		+ STR_PULA
	cQryAux += "       LEFT JOIN SF4010 SF4 "		+ STR_PULA
	cQryAux += "              ON SF4.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                 AND SF4.F4_CODIGO = SD1.D1_TES "		+ STR_PULA
	cQryAux += "                 AND SF4.F4_FILIAL = SD1.D1_FILIAL "		+ STR_PULA
	cQryAux += "       LEFT JOIN SFT010 SFT "		+ STR_PULA
	cQryAux += "              ON SFT.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                 AND SFT.FT_PRODUTO = SD1.D1_COD "		+ STR_PULA
	cQryAux += "                 AND SFT.FT_NFISCAL = SD1.D1_DOC "		+ STR_PULA
	cQryAux += "                 AND SFT.FT_FILIAL = SD1.D1_FILIAL "		+ STR_PULA
	cQryAux += "                 AND SFT.FT_CLIEFOR "		+ STR_PULA
	cQryAux += "                     ||SFT.FT_LOJA = F1_FORNECE "		+ STR_PULA
	cQryAux += "                                     ||F1_LOJA "		+ STR_PULA
	cQryAux += "                 AND SFT.FT_ITEM = SD1.D1_ITEM "		+ STR_PULA
	cQryAux += "                 AND SFT.FT_CHVNFE = SF1.F1_CHVNFE "		+ STR_PULA
	cQryAux += "       LEFT JOIN CT1010 CT1 "		+ STR_PULA
	cQryAux += "              ON CT1.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                 AND SD1.D1_CONTA = CT1.CT1_CONTA "		+ STR_PULA
	cQryAux += "WHERE  SA2.A2_L_TPFOR IN( 'P', 'F' ) "		+ STR_PULA
	cQryAux += "       AND SFT.FT_OBSERV NOT LIKE '%NF CANCELADA%' "		+ STR_PULA
	cQryAux += "       AND SD1.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "       AND TO_DATE(TRIM(SF1.F1_DTDIGIT), 'YYYYMMDD') BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	cQryAux += "ORDER  BY SF1.F1_DOC"		+ STR_PULA
	
	MemoWrite("C:\teste\RELMOVE_V1.sql",cQryAux) //19/03/2019
		
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
