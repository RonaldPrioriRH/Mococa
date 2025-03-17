//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELDISPO
Relatório - Disponibilidade               
@author TREPORT
@since 06/06/2018
@version 1.0
	@example
	u_RELDISPO()
	@obs Função gerada pelo TREPORT()
/*/
	
User Function RELDISPO()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELDISPO"
	
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
	oReport := TReport():New(	"RELDISPO",;		//Nome do Relatório
								"Relatorio de Disponibilidade",;		//Título
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
	TRCell():New(oSectDad, "FILORI", "QRY_AUX", "Filori", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BCORECEBER", "QRY_AUX", "Bcoreceber", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PREFIXO", "QRY_AUX", "Prefixo", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NUMERO", "QRY_AUX", "Numero", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PARCELA", "QRY_AUX", "Parcela", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPO", "QRY_AUX", "Tipo", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CODNATUREZA", "QRY_AUX", "Codnatureza", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NATUREZA", "QRY_AUX", "Natureza", /*Picture*/, 30, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CODCLI", "QRY_AUX", "Codcli", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LOJA", "QRY_AUX", "Loja", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOME", "QRY_AUX", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FANTASIA", "QRY_AUX", "Fantasia", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENCORIGEM", "QRY_AUX", "Vencorigem", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "EMISSAO", "QRY_AUX", "Emissao", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENCIMENTO", "QRY_AUX", "Vencimento", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENCREA", "QRY_AUX", "Vencrea", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MOEDA", "QRY_AUX", "Moeda", /*Picture*/, 5, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "SALDO", "QRY_AUX", "Saldo", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALORRS", "QRY_AUX", "Valor R$", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR", "QRY_AUX", "Valor", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VBC", "QRY_AUX", "Vbc", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ABMENOS", "QRY_AUX", "AB-", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "RS_LIQUIDO", "QRY_AUX", "R$ Liquido", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BAIXA", "QRY_AUX", "Baixa", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BORDERO", "QRY_AUX", "Bordero", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTBORDERO", "QRY_AUX", "Dtbordero", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOMEBANCO", "QRY_AUX", "Nomebanco", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENDEDOR", "QRY_AUX", "Vendedor", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CARTEIRA", "QRY_AUX", "Carteira", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "EA_NUMCON", "QRY_AUX", "Numero Conta", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CODCOBRANCA", "QRY_AUX", "Codcobranca", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
    TRCell():New(oSectDad, "DIASVENCTO", "QRY_AUX", "DiasVencto", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
    TRCell():New(oSectDad, "ESTADO", "QRY_AUX", "Estado", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
    
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
	
	U_xPutSx1(cPerg,"01","Emissão de ?","."     ,"."       ,"mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Emissão Até ?","."     ,"."       ,"mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"03","Vencimento de ?","."     ,"."       ,"mv_CH3","D",08,0,0,"G","","","","","MV_PAR03","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"04","Vencimento Até ?","."     ,"."       ,"mv_CH4","D",08,0,0,"G","","","","","MV_PAR04","","","","","","","","","","","","","","","","")
	//U_xPutSx1(cPerg,"05","Cliente De ? ?","."     ,"."       ,"mv_CH5","C",06,0,0,"G","","SA1","","","MV_PAR05","","","","","","","","","","","","","","","","")
	//U_xPutSx1(cPerg,"06","Cliente Até ? ?","."     ,"."       ,"mv_CH6","C",06,0,0,"G","","SA1","","","MV_PAR06","","","","","","","","","","","","","","","","")
	
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
	cQryAux += "SELECT DISTINCT R.FILORI, "		+ STR_PULA
	cQryAux += "                R.BCORECEBER, "		+ STR_PULA
	cQryAux += "                R.FILIAL, "		+ STR_PULA
	cQryAux += "                R.PREFIXO, "		+ STR_PULA
	cQryAux += "                R.NUMERO, "		+ STR_PULA
	cQryAux += "                R.PARCELA, "		+ STR_PULA
	cQryAux += "                R.TIPO, "		+ STR_PULA
	cQryAux += "                R.CODNATUREZA, "		+ STR_PULA
	cQryAux += "                R.NATUREZA, "		+ STR_PULA
	cQryAux += "                R.CODCLI, "		+ STR_PULA
	cQryAux += "                R.LOJA, "		+ STR_PULA
	cQryAux += "                R.NOME, "		+ STR_PULA
	cQryAux += "                R.FANTASIA, "		+ STR_PULA
	cQryAux += "                R.VENCORIGEM, "		+ STR_PULA
	cQryAux += "                R.EMISSAO, "		+ STR_PULA
	cQryAux += "                R.VENCIMENTO, "		+ STR_PULA
	cQryAux += "                R.VENCREA,"		+ STR_PULA
	cQryAux += "                (R.EMISSAO - R.VENCIMENTO) DIASVENCTO,"		+ STR_PULA
	cQryAux += "                (CASE R.MOEDA WHEN 1 THEN 'REAL'"		+ STR_PULA
	cQryAux += "                                 WHEN 2 THEN 'DOLAR'"		+ STR_PULA
	cQryAux += "                            END ) AS MOEDA, "		+ STR_PULA
	cQryAux += "                R.SALDO, "		+ STR_PULA
	cQryAux += "                R.VALORRS, "		+ STR_PULA
	cQryAux += "                R.VALOR, "		+ STR_PULA
	cQryAux += "                (SELECT E1_VALOR "		+ STR_PULA
	cQryAux += "                   FROM SE1010 "		+ STR_PULA
	cQryAux += "                  WHERE R.FILIAL = E1_FILIAL "		+ STR_PULA
	cQryAux += "                   AND R.PREFIXO = E1_PREFIXO "		+ STR_PULA
	cQryAux += "                   AND R.NUMERO     = E1_NUM "		+ STR_PULA
	cQryAux += "                   AND R.parcela     = E1_parcela "		+ STR_PULA
	cQryAux += "                   AND E1_TIPO ='VB-' AND SE1010.d_E_L_E_T_ =' ') AS VBC,"		+ STR_PULA
	cQryAux += "                (SELECT E1_VALOR "		+ STR_PULA
	cQryAux += "                   FROM SE1010 "		+ STR_PULA
	cQryAux += "                  WHERE R.FILIAL = E1_FILIAL "		+ STR_PULA
	cQryAux += "                   AND R.PREFIXO = E1_PREFIXO "		+ STR_PULA
	cQryAux += "                   AND R.NUMERO     = E1_NUM "		+ STR_PULA
	cQryAux += "                   AND E1_TIPO ='AB-' AND SE1010.d_E_L_E_T_ =' ') AS ABMENOS,"		+ STR_PULA
	cQryAux += "                 (R.VALOR - (NVL((SELECT E1_VALOR "		+ STR_PULA
	cQryAux += "                   FROM SE1010 "		+ STR_PULA
	cQryAux += "                  WHERE R.FILIAL = E1_FILIAL "		+ STR_PULA
	cQryAux += "                   AND R.PREFIXO = E1_PREFIXO "		+ STR_PULA
	cQryAux += "                   AND R.NUMERO     = E1_NUM "		+ STR_PULA
	cQryAux += "                   AND R.PARCELA     = E1_PARCELA "		+ STR_PULA
	cQryAux += "                   AND E1_TIPO ='VB-' AND SE1010.d_E_L_E_T_ =' '),0) + "		+ STR_PULA
	cQryAux += "                NVL((SELECT E1_VALOR "		+ STR_PULA
	cQryAux += "                   FROM SE1010 "		+ STR_PULA
	cQryAux += "                  WHERE R.FILIAL = E1_FILIAL "		+ STR_PULA
	cQryAux += "                   AND R.PREFIXO = E1_PREFIXO "		+ STR_PULA
	cQryAux += "                   AND R.NUMERO     = E1_NUM "		+ STR_PULA
	cQryAux += "                   AND R.parcela     = E1_parcela "		+ STR_PULA
	cQryAux += "                   AND E1_TIPO ='AB-' AND SE1010.d_E_L_E_T_ =' '),0))) RS_LIQUIDO,"		+ STR_PULA
	cQryAux += "                R.BAIXA, "		+ STR_PULA
	cQryAux += "                R.BORDERO, "		+ STR_PULA
	cQryAux += "                R.DTBORDERO, "		+ STR_PULA
	cQryAux += "                A6.A6_NOME NOMEBANCO, "		+ STR_PULA
	cQryAux += "                R.VENDEDOR, "		+ STR_PULA
	cQryAux += "                R.CARTEIRA,"		+ STR_PULA
	cQryAux += "               ( CASE R.CARTEIRA"		+ STR_PULA
	cQryAux += "                  WHEN  '0' THEN 'COBRANÇA MOCOCA'"		+ STR_PULA
	cQryAux += "                  WHEN  '1' THEN 'COBRANÇA SIMPLES'"		+ STR_PULA
	cQryAux += "                  WHEN  '2'  THEN 'COBRANÇA DESCONTADA'"		+ STR_PULA
	cQryAux += "                  WHEN  '8'  THEN 'COBRANÇA DESCONTADA'"		+ STR_PULA
	cQryAux += "                  WHEN  '3' THEN 'COBRANÇA CAUCIONADA'"		+ STR_PULA
	cQryAux += "                   END) CARTEIRA,"		+ STR_PULA
	cQryAux += "               A.EA_NUMCON,"		+ STR_PULA
	cQryAux += "               R.CODCOBRANCA,"		+ STR_PULA
	cQryAux += "               R.ESTADO"		+ STR_PULA
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
	cQryAux += "               TO_DATE(TRIM(E1_VENCORI), 'YYYYMMDD') VENCORIGEM, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_EMISSAO), 'YYYYMMDD') EMISSAO, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD')  VENCIMENTO, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_VENCREA), 'YYYYMMDD') VENCREA, "		+ STR_PULA
	cQryAux += "               E1_VLCRUZ                             VALOR, "		+ STR_PULA
	cQryAux += "               E1_VALOR                              VALORRS, "		+ STR_PULA
	cQryAux += "               E1_SALDO                              SALDO,        "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_BAIXA), 'YYYYMMDD')   BAIXA, "		+ STR_PULA
	cQryAux += "               E1_NUMBOR                             BORDERO, "		+ STR_PULA
	cQryAux += "               TO_DATE(TRIM(E1_DATABOR), 'YYYYMMDD') DTBORDERO, "		+ STR_PULA
	cQryAux += "               E1_HIST                               HISTORICO, "		+ STR_PULA
	cQryAux += "               E1_VEND1                              CODVEND, "		+ STR_PULA
	cQryAux += "               A3_NOME                               VENDEDOR, "		+ STR_PULA
	cQryAux += "               E1_FILORIG                            FILORI, "		+ STR_PULA
	cQryAux += "               E1_PORTADO                            BCORECEBER, "		+ STR_PULA
	cQryAux += "               E1_SITUACA                            CARTEIRA,"		+ STR_PULA
	cQryAux += "               A1_XCODCOB                            CODCOBRANCA,"		+ STR_PULA
	cQryAux += "               E1_MOEDA                              MOEDA,"		+ STR_PULA
    cQryAux += "               A1_EST                                ESTADO"		+ STR_PULA
	cQryAux += "               "		+ STR_PULA
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
	cQryAux += "               AND E1_SALDO <> 0) R "		+ STR_PULA
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
	cQryAux += "WHERE R.TIPO IN ('NF')"		+ STR_PULA
	cQryAux += "AND R.CARTEIRA = '0'"		+ STR_PULA
	cQryAux += "AND R.BANCO =' '"		+ STR_PULA
	cQryAux += "AND R.EMISSAO <> R.VENCREA"		+ STR_PULA
	cQryAux += "AND R.CODCLI NOT IN ('C02641','C02642','C02203')"		+ STR_PULA
	cQryAux += "AND R.CODCOBRANCA <> 'FPGT'"		+ STR_PULA
	cQryAux += "AND R.PREFIXO IN ('001','EEC')"		+ STR_PULA
	cQryAux += "AND R.SALDO <= R.VALOR"		+ STR_PULA	
	cQryAux += "AND R.EMISSAO  BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	cQryAux += "AND R.BAIXA IS NULL"		+ STR_PULA
	cQryAux += "AND R.VENCIMENTO BETWEEN '" + DTOS(MV_PAR03) +"' AND '"+ DTOS(MV_PAR04) +"' 	" + STR_PULA
	
	//MemoWrite("C:\teste\RELDISPO_V4.sql",cQryAux) //06/04/2020 segunda-feira
	cQryAux := ChangeQuery(cQryAux)
	
	//u_RELDISPO()
	
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
