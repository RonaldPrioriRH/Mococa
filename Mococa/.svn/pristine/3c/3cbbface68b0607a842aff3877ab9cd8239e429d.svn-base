//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELPEDID
Relatório - Pedidos Venda Colaborador     
@author TReport
@since 25/09/2018
@version 1.0
	@example
	u_RELPEDID()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELPEDID()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
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
	oReport := TReport():New(	"RELPEDID",;		//Nome do Relatório
								"Pedidos de Venda Colaborador",;		//Título
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
	TRCell():New(oSectDad, "FIL", "QRY_AUX", "Agencia", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CFIELD2", "QRY_AUX", "Cfield2", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "EMISSAO", "QRY_AUX", "Emissao", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PEDSGAC", "QRY_AUX", "Pedsgac", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CLIENTE", "QRY_AUX", "Cliente", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LOJA", "QRY_AUX", "Loja", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOME", "QRY_AUX", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BAIRRO", "QRY_AUX", "Bairro", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MUNICIPIO", "QRY_AUX", "Municipio", /*Picture*/, 60, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PESOLIQUIDO", "QRY_AUX", "Pesoliquido", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PESOBRUTO", "QRY_AUX", "Pesobruto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VOLUME", "QRY_AUX", "Volume", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR", "QRY_AUX", "Valor", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
Return oReport
	
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
	cQryAux += "SELECT L.FIL,L.C5_NUM NÚMERO, TO_DATE(TRIM(L.EMISSAO),'YYYYMMDD') EMISSAO, L.C5_XPVSGAC PEDSGAC, L.A1_COD CLIENTE,L.A1_LOJA LOJA,L.A1_NOME NOME,L.BAIRRO,L.MUNICIPIO MUNICIPIO, L.PLIQ PESOLIQUIDO, L.PBRUTO PESOBRUTO, SUM(S.C6_QTDVEN) VOLUME, SUM(S.C6_VALOR) VALOR FROM SC6010 S, (SELECT DISTINCT "		+ STR_PULA
	cQryAux += "C5_EMISSAO EMISSAO,"		+ STR_PULA
	cQryAux += "C5_FILIAL FIL,"		+ STR_PULA
	cQryAux += "C5_NUM,"		+ STR_PULA
	cQryAux += "C5_XPVSGAC,"		+ STR_PULA
	cQryAux += "A1_COD, "		+ STR_PULA
	cQryAux += "A1_LOJA,"		+ STR_PULA
	cQryAux += "A1_NOME,"		+ STR_PULA
	cQryAux += "DECODE(A1_TIPO,'F',REGEXP_REPLACE(LPAD(A1_CGC, 11, '0'), '([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})','\1.\2.\3-\4'), "		+ STR_PULA
	cQryAux += "REGEXP_REPLACE(LPAD(A1_CGC, 14, '0'),'([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})','\1.\2.\3/\4-\5')) CGC_CNPJ,"		+ STR_PULA
	cQryAux += "A1_MUN MUNICIPIO,"		+ STR_PULA
	cQryAux += "A1_BAIRRO BAIRRO,"		+ STR_PULA
	cQryAux += "A1_EST ESTADO,"		+ STR_PULA
	cQryAux += "C5_PESOL PLIQ,"		+ STR_PULA
	cQryAux += "C5_PBRUTO PBRUTO,"		+ STR_PULA
	cQryAux += "C5_VOLUME1 VOLUME,"		+ STR_PULA
	cQryAux += "C5_FILIAL||C5_NUM||C5_CLIENTE"		+ STR_PULA
	cQryAux += "FROM SC6010 "		+ STR_PULA
	cQryAux += "LEFT JOIN SC9010"		+ STR_PULA
	cQryAux += "ON SC9010.D_E_L_E_T_ <> '*'"		+ STR_PULA
	cQryAux += "AND C9_PEDIDO = C6_NUM"		+ STR_PULA
	cQryAux += "AND C6_FILIAL = C9_FILIAL"		+ STR_PULA
	cQryAux += "AND C6_PRODUTO = C9_PRODUTO"		+ STR_PULA
	cQryAux += "AND C6_ITEM = C9_ITEM"		+ STR_PULA
	cQryAux += "AND C6_LOCAL = C9_LOCAL"		+ STR_PULA
	cQryAux += "AND C6_NOTA = C9_NFISCAL"		+ STR_PULA
	cQryAux += "LEFT JOIN SC5010"		+ STR_PULA
	cQryAux += "ON SC5010.D_E_L_E_T_ <> '*'"		+ STR_PULA
	cQryAux += "AND C5_NUM = C6_NUM"		+ STR_PULA
	cQryAux += "AND C5_FILIAL = C6_FILIAL"		+ STR_PULA
	cQryAux += "LEFT JOIN SB1010"		+ STR_PULA
	cQryAux += "ON SB1010.D_E_L_E_T_ <> '*'"		+ STR_PULA
	cQryAux += "AND B1_COD = C6_PRODUTO"		+ STR_PULA
	cQryAux += "LEFT JOIN SA1010 "		+ STR_PULA
	cQryAux += "ON SA1010.D_E_L_E_T_ <> '*'"		+ STR_PULA
	cQryAux += "AND A1_COD = C6_CLI"		+ STR_PULA
	cQryAux += "AND A1_LOJA = C6_LOJA"		+ STR_PULA
	cQryAux += "LEFT JOIN SF4010"		+ STR_PULA
	cQryAux += "ON SF4010.D_E_L_E_T_ <> '*'"		+ STR_PULA
	cQryAux += "AND F4_CODIGO = C6_TES "		+ STR_PULA
	cQryAux += "AND F4_FILIAL = C6_FILIAL"		+ STR_PULA
	cQryAux += "WHERE SC6010.D_E_L_E_T_ <> '*'"		+ STR_PULA
	cQryAux += "AND A1_XCODCOB ='FPGT'"		+ STR_PULA
	cQryAux += "AND C9_NFISCAL = ' '"		+ STR_PULA
	cQryAux += "AND F4_DUPLIC = 'S'"		+ STR_PULA
	cQryAux += "AND B1_TIPO IN ('PA','ME')"		+ STR_PULA
	cQryAux += "AND A1_CGC NOT IN ( '52502507006269', '52502507006269', '52502507000309', "		+ STR_PULA
	cQryAux += "'52502507006854', "		+ STR_PULA
	cQryAux += "'52502507001208', '52502507006692', '52502507000813', "		+ STR_PULA
	cQryAux += "'26687598000122', "		+ STR_PULA
	cQryAux += "'52502507001895', '52502507001623', '52502507002271', "		+ STR_PULA
	cQryAux += "'52502507001976', "		+ STR_PULA
	cQryAux += "'52502507000147', '52502507001380', '26687598000203', "		+ STR_PULA
	cQryAux += "'26687598000475', "		+ STR_PULA
	cQryAux += "'26687598000394', '52502507000651' ) )L"		+ STR_PULA
	cQryAux += "WHERE S.D_E_L_E_T_ =' '"		+ STR_PULA
	cQryAux += "AND S.C6_FILIAL||S.C6_NUM = L.FIL||L.C5_NUM "		+ STR_PULA
	cQryAux += "GROUP BY L.FIL,L.C5_NUM, L.EMISSAO, L.C5_XPVSGAC, L.A1_COD,L.A1_LOJA,L.A1_NOME,L.MUNICIPIO,L.BAIRRO, L.CGC_CNPJ,L.ESTADO, L.PLIQ, L.PBRUTO"		+ STR_PULA
	
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
