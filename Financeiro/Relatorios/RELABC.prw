//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELABC
Relat�rio - Curva ABC Clientes            
@author TREPORT
@since 30/07/2018
@version 1.0
	@example
	u_RELABC()
	@obs Fun��o gerada pelo TREPORT()
/*/
	
User Function RELABC()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Defini��es da pergunta
	cPerg := "RELABC"
	
	////////////////////////////////////////////////////////////////////////
	///Cria as perguntas no SX1
	////////////////////////////////////////////////////////////////////////
	ValPer01()
	
	if !Pergunte(cPerg,.t.)
		return
	endif
	
	//Cria as defini��es do relat�rio
	oReport := fReportDef()
	
	//Ser� enviado por e-Mail?
	If lEmail
		oReport:nRemoteType := NO_REMOTE
		oReport:cEmail := cPara
		oReport:nDevice := 3 //1-Arquivo,2-Impressora,3-email,4-Planilha e 5-Html
		oReport:SetPreview(.F.)
		oReport:Print(.F., "", .T.)
	//Sen�o, mostra a tela
	Else
		oReport:PrintDialog()
	EndIf
	
	RestArea(aArea)
Return
	
/*-------------------------------------------------------------------------------*
 | Func:  fReportDef                                                             |
 | Desc:  Fun��o que monta a defini��o do relat�rio                              |
 *-------------------------------------------------------------------------------*/
	
Static Function fReportDef()
	Local oReport
	Local oSectDad := Nil
	//Local oBreak := Nil
	
	//Cria��o do componente de impress�o
	oReport := TReport():New(	"RELABC",;		//Nome do Relat�rio
								"Curva ABC Clientes",;		//T�tulo
								cPerg,;		//Pergunte ... Se eu defino a pergunta aqui, ser� impresso uma p�gina com os par�metros, conforme privil�gio 101
								{|oReport| fRepPrint(oReport)},;		//Bloco de c�digo que ser� executado na confirma��o da impress�o
								)		//Descri��o
	oReport:SetTotalInLine(.F.)
	oReport:lParamPage := .F.
	oReport:oPage:SetPaperSize(9) //Folha A4
	oReport:SetPortrait()
	
	//Criando a se��o de dados
	oSectDad := TRSection():New(	oReport,;		//Objeto TReport que a se��o pertence
									"Dados",;		//Descri��o da se��o
									{"QRY_AUX"})		//Tabelas utilizadas, a primeira ser� considerada como principal da se��o
	oSectDad:SetTotalInLine(.F.)  //Define se os totalizadores ser�o impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
	//Colunas do relat�rio
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
	
	U_xPutSx1(cPerg,"01","Emiss�o de ?","","","mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Emiss�o At� ?","","","mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")	
	U_xPutSx1(cPerg,"03","Da Filial ?","","","mv_CH3","C",04,0,0,"G","","SM0","","","MV_PAR03","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"04","At� a Filial ?","","","mv_CH4","C",04,0,0,"G","","SM0","","","MV_PAR04","","","","","","","","","","","","","","","","")	
	
	//Retirado Sangelles 22/03/2022 ->dbSelectArea(_sAlias)

Return()	
	
/*-------------------------------------------------------------------------------*
 | Func:  fRepPrint                                                              |
 | Desc:  Fun��o que imprime o relat�rio                                         |
 *-------------------------------------------------------------------------------*/
	
Static Function fRepPrint(oReport)
	Local aArea    := GetArea()
	Local cQryAux  := ""
	Local oSectDad := Nil
	Local nAtual   := 0
	Local nTotal   := 0
	
	//Pegando as se��es do relat�rio
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
	
	//Executando consulta e setando o total da r�gua
	TCQuery cQryAux New Alias "QRY_AUX"
	Count to nTotal
	oReport:SetMeter(nTotal)
	
	//Enquanto houver dados
	oSectDad:Init()
	QRY_AUX->(DbGoTop())
	While ! QRY_AUX->(Eof())
		//Incrementando a r�gua
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
