//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELABC
Relatório - Curva ABC Clientes            
@author TREPORT
@since 30/07/2018
@version 1.0
	@example
	u_RELABC()
	@obs Função gerada pelo TREPORT()
/*/
	
User Function RELABC()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELABC"
	
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
	oReport := TReport():New(	"RELABC",;		//Nome do Relatório
								"Curva ABC Clientes",;		//Título
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
	TRCell():New(oSectDad, "CODCLIENTE", "QRY_AUX", "Codcliente", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOME", "QRY_AUX", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ESTADO", "QRY_AUX", "Estado", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MUNICIPIO", "QRY_AUX", "Municipio", /*Picture*/, 60, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR", "QRY_AUX", "Valor", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MESFAT", "QRY_AUX", "Mesfat", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ANOFAT", "QRY_AUX", "Anofat", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
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
	//Retirado Sangelles 22/03/2022 ->
	//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
	cPerg 	:=	PADR(cPerg,10)
	
	U_xPutSx1(cPerg,"01","Emissão de ?","","","mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Emissão Até ?","","","mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")	
	U_xPutSx1(cPerg,"03","Da Filial ?","","","mv_CH3","C",04,0,0,"G","","SM0","","","MV_PAR03","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"04","Até a Filial ?","","","mv_CH4","C",04,0,0,"G","","SM0","","","MV_PAR04","","","","","","","","","","","","","","","","")	
	
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
	cQryAux += "SELECT A1_COD                                           AS CODCLIENTE, "		+ STR_PULA
	cQryAux += "       A1_NOME                                          AS NOME, "		+ STR_PULA
	cQryAux += "       A1_EST                                           AS ESTADO, "		+ STR_PULA
	cQryAux += "       A1_MUN                                           AS MUNICIPIO,"		+ STR_PULA
	cQryAux += "       SUM(F2_VALBRUT) AS VALOR, "		+ STR_PULA
	cQryAux += "       TO_CHAR(TO_DATE(F2_EMISSAO, 'YYYYMMDD'), 'MM')   AS MESFAT, "		+ STR_PULA
	cQryAux += "       TO_CHAR(TO_DATE(F2_EMISSAO, 'YYYYMMDD'), 'YYYY') AS ANOFAT "		+ STR_PULA
	cQryAux += "FROM   SF2010 "		+ STR_PULA
	cQryAux += "       LEFT JOIN SA1010 "		+ STR_PULA
	cQryAux += "              ON SA1010.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "                 AND A1_COD = F2_CLIENTE "		+ STR_PULA
	cQryAux += "                 AND A1_LOJA = F2_LOJA "		+ STR_PULA
	cQryAux += "WHERE  SF2010.D_E_L_E_T_ <> '*' "		+ STR_PULA
	cQryAux += "       AND A1_CGC NOT IN ( '52502507006269', '52502507006269', '52502507000309', "		+ STR_PULA
	cQryAux += "                           '52502507006854', "		+ STR_PULA
	cQryAux += "                           '52502507001208', '52502507006692', '52502507000813', "		+ STR_PULA
	cQryAux += "                               '26687598000122', "		+ STR_PULA
	cQryAux += "                           '52502507001895', '52502507001623', '52502507002271', "		+ STR_PULA
	cQryAux += "                               '52502507001976', "		+ STR_PULA
	cQryAux += "                           '52502507000147', '52502507001380', '26687598000203', "		+ STR_PULA
	cQryAux += "                               '26687598000475', "		+ STR_PULA
	cQryAux += "                           '26687598000394', '52502507000651' ) "		+ STR_PULA
	cQryAux += "       AND F2_TIPO = 'N' "		+ STR_PULA
	//cQryAux += "       AND F2_FILIAL BETWEEN '  ' AND 'ZZZZ' "		+ STR_PULA
	cQryAux += "       AND TO_DATE(F2_EMISSAO, 'YYYYMMDD') BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	cQryAux += " 	   AND F2_FILIAL BETWEEN '" + MV_PAR03 +"' AND '"+ MV_PAR04 +"' 	" 
	//cQryAux += "       AND TO_DATE(F2_EMISSAO, 'YYYYMMDD') BETWEEN '20150701' AND '20180701'"		+ STR_PULA
	cQryAux += "GROUP  BY A1_COD, "		+ STR_PULA
	cQryAux += "          A1_EST,"		+ STR_PULA
	cQryAux += "          A1_NOME,"		+ STR_PULA
	cQryAux += "          A1_MUN, "		+ STR_PULA
	cQryAux += "          TO_CHAR(TO_DATE(F2_EMISSAO, 'YYYYMMDD'), 'MM'), "		+ STR_PULA
	cQryAux += "          TO_CHAR(TO_DATE(F2_EMISSAO, 'YYYYMMDD'), 'YYYY') "		+ STR_PULA
	cQryAux += "ORDER  BY MESFAT"		+ STR_PULA
	
	MemoWrite("C:\teste\RELABC.sql",cQryAux) //V1 30/07/2018 
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
