//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELCTE
Relatório - Relatório Importação CTE      
@author TReport
@since 20/12/2018
@version 1.0
	@example
	u_RELCTE()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELCTE()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELCTE"
	
	////////////////////////////////////////////////////////////////////////
	///Cria as perguntas no SX1
	////////////////////////////////////////////////////////////////////////
	//ValPer01()
	
	
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
	//Local oFunTot1 := Nil
	
	//Criação do componente de impressão
	oReport := TReport():New(	"RELCTE",;		//Nome do Relatório
								"Relatório Importação CTE NOVO",;		//Título
								cPerg,;		//Pergunte ... Se eu defino a pergunta aqui, será impresso uma página com os parâmetros, conforme privilégio 101
								{|oReport| fRepPrint(oReport)},;		//Bloco de código que será executado na confirmação da impressão
								)		//Descrição
	oReport:SetTotalInLine(.F.)
	oReport:lParamPage := .F.
	oReport:oPage:SetPaperSize(9) //Folha A4
	oReport:nFontBody := 12
	oReport:SetPortrait()
	
	
	//Criando a seção de dados
	oSectDad := TRSection():New(	oReport,;		//Objeto TReport que a seção pertence
									"Dados",;		//Descrição da seção
									{"QRY_AUX"})		//Tabelas utilizadas, a primeira será considerada como principal da seção
	oSectDad:SetTotalInLine(.F.)  //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	
		//Colunas do relatório
	TRCell():New(oSectDad, "FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F2_FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DATALANCAMENTO", "QRY_AUX", "Datalancamento", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F2_DOC", "QRY_AUX", "Numero", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "EMISSAONFSAIDA", "QRY_AUX", "Emissaonfsaida", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F2_CLIENTE", "QRY_AUX", "Cliente", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F2_LOJA", "QRY_AUX", "Loja", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A1_NOME", "QRY_AUX", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A1_EST", "QRY_AUX", "Estado", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TRANSPORTADORA", "QRY_AUX", "Transportadora", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NUMCTE", "QRY_AUX", "Numcte", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TRANSP", "QRY_AUX", "Transp", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOME", "QRY_AUX", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALCTE", "QRY_AUX", "Valcte", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F2_VALBRUT", "QRY_AUX", "Vlr.Bruto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F2_PBRUTO", "QRY_AUX", "Peso Bruto", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "F2_PLIQUI", "QRY_AUX", "Peso Liquido", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PESOTOTAL", "QRY_AUX", "Pesototal", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QTNFCTE", "QRY_AUX", "Qtnfcte", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CUSFRETE", "QRY_AUX", "Cusfrete", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PERC", "QRY_AUX", "Perc", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VLPROP", "QRY_AUX", "Vlprop", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VLPROPCUST", "QRY_AUX", "Vlpropcust", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	
/*	Verificar o porque do erro com QUEBRA E TOTALIZAR
	THREAD ERROR ([93149], caique.mercadante, TI-03)   
	21/12/2018 10:04:00argumento #0, parâmetrooCellerro, previstoO->U on TRFUNCTION:NEW(REPORT06.PRW) 

	//Definindo a quebra
	oBreak := TRBreak():New(oSectDad,{|| QRY_AUX->(F2_FILIAL) },{|| "SEPARACAO DO RELATORIO" })
	oSectDad:SetHeaderBreak(.T.)
	
	//Totalizadores
	oFunTot1 := TRFunction():New(oSectDad:Cell("F1_DOC"),,"COUNT",oBreak,,cPicture)
	oFunTot1:SetEndReport(.F.)*/
	
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
	cQryAux += "SELECT CTE.*,"		+ STR_PULA
	cQryAux += "      ROUND ((( CTE.F2_PBRUTO/CTE.PESOTOTAL)*100),2) AS PERC,"		+ STR_PULA
	cQryAux += "      ROUND (((CTE.VALCTE *((CTE.F2_PBRUTO/CTE.PESOTOTAL)*100))/100),2) AS VLPROP,"		+ STR_PULA
	cQryAux += "      ROUND (((CTE.CUSFRETE *((CTE.F2_PBRUTO/CTE.PESOTOTAL)*100))/100),2) AS VLPROPCUST"		+ STR_PULA
	cQryAux += "  FROM (SELECT O.FILIAL, "		+ STR_PULA
	cQryAux += "       F2_FILIAL, "		+ STR_PULA
	cQryAux += "       TO_DATE (TRIM(F1_DTDIGIT),'YYYYMMDD') DATALANCAMENTO, "		+ STR_PULA
	cQryAux += "       O.NFORI  F2_DOC, "		+ STR_PULA
	cQryAux += "       TO_DATE(TRIM(F2_EMISSAO),'YYYYMMDD') EMISSAONFSAIDA, "		+ STR_PULA
	cQryAux += "       F2_CLIENTE, "		+ STR_PULA
	cQryAux += "       F2_LOJA, "		+ STR_PULA
	cQryAux += "       A1_NOME, "		+ STR_PULA
	cQryAux += "       A1_EST,"		+ STR_PULA
	cQryAux += "       F2_TRANSP TRANSPORTADORA, "		+ STR_PULA
	cQryAux += "       F1_DOC NUMCTE,"		+ STR_PULA
	cQryAux += "       F1_FORNECE TRANSP, "		+ STR_PULA
	cQryAux += "       A2_NOME NOME,"		+ STR_PULA
	cQryAux += "       F1_VALBRUT VALCTE,"		+ STR_PULA
	cQryAux += "       F2_VALBRUT, "		+ STR_PULA
	cQryAux += "       F2_PBRUTO, "		+ STR_PULA
	cQryAux += "       F2_PLIQUI, "		+ STR_PULA
	cQryAux += "       (SELECT SUM(F2_PBRUTO) FROM SF2010"		+ STR_PULA
	cQryAux += "                    "		+ STR_PULA
	cQryAux += "  INNER JOIN (SELECT COUNT(DISTINCT D1_NFORI), D1_FILIAL, D1_DOC, D1_SERIE, D1_NFORI, D1_SERIORI "		+ STR_PULA
	cQryAux += "                    FROM SD1010"		+ STR_PULA
	cQryAux += "                    WHERE SD1010.D_E_L_E_T_=' ' "		+ STR_PULA
	cQryAux += "                    AND D1_NFORI <>' '  "		+ STR_PULA
	cQryAux += "                    AND D1_SERIORI <>' ' "		+ STR_PULA
	cQryAux += "                    GROUP BY D1_FILIAL, D1_DOC, D1_SERIE, D1_NFORI, D1_SERIORI) D ON F2_FILIAL = D.D1_FILIAL AND F2_DOC = D.D1_NFORI AND D.D1_SERIORI =F2_SERIE "		+ STR_PULA
	cQryAux += " "		+ STR_PULA
	cQryAux += "  "		+ STR_PULA
	cQryAux += "  INNER JOIN SF1010 SF1 ON SF1.D_E_L_E_T_=' ' "		+ STR_PULA
	cQryAux += "                  AND D1_FILIAL = SF1.F1_FILIAL "		+ STR_PULA
	cQryAux += "                  AND D1_DOC = SF1.F1_DOC"		+ STR_PULA
	cQryAux += "                  AND D1_SERIE = SF1.F1_SERIE "		+ STR_PULA
	cQryAux += "                  "		+ STR_PULA
	cQryAux += "WHERE SF2010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux += "AND SF1.F1_FILIAL      = SF1010.F1_FILIAL"		+ STR_PULA
	cQryAux += "AND SF1.F1_DOC         = SF1010.F1_DOC "		+ STR_PULA
	cQryAux += "AND SF1.F1_SERIE       = SF1010.F1_SERIE"		+ STR_PULA
	cQryAux += "AND SF1.F1_FORNECE     = SF1010.F1_FORNECE"		+ STR_PULA
	cQryAux += "AND SF1.F1_LOJA        = SF1010.F1_LOJA"		+ STR_PULA
	cQryAux += "AND F1_ESPECIE ='CTE'"		+ STR_PULA
	cQryAux += "AND F2_CARGA <>' ') AS PESOTOTAL, "		+ STR_PULA
	cQryAux += "(SELECT COUNT(NF) FROM (SELECT COUNT(DISTINCT D1_NFORI) NF , D1_FILIAL FILIAL, D1_DOC DOC , D1_SERIE SERIE"		+ STR_PULA
	cQryAux += "                    FROM SD1010"		+ STR_PULA
	cQryAux += "                    WHERE SD1010.D_E_L_E_T_=' ' "		+ STR_PULA
	cQryAux += "                    AND D1_NFORI <>' '  "		+ STR_PULA
	cQryAux += "                    AND D1_SERIORI <>' ' "		+ STR_PULA
	cQryAux += "                    GROUP BY D1_FILIAL, D1_DOC, D1_SERIE, D1_NFORI, D1_SERIORI) D "		+ STR_PULA
	cQryAux += "WHERE D.FILIAL = F1_FILIAL"		+ STR_PULA
	cQryAux += "AND D.DOC = F1_DOC"		+ STR_PULA
	cQryAux += "AND D.SERIE = F1_SERIE)AS QTNFCTE,                    "		+ STR_PULA
	cQryAux += "                   "		+ STR_PULA
	cQryAux += "(SELECT SUM(D1_CUSTO) FROM SD1010"		+ STR_PULA
	cQryAux += "WHERE  SD1010.D_E_L_E_T_=' ' "		+ STR_PULA
	cQryAux += " AND  D1_FILIAL = F1_FILIAL"		+ STR_PULA
	cQryAux += "  AND D1_DOC = F1_DOC "		+ STR_PULA
	cQryAux += "  AND D1_SERIE = F1_SERIE ) CUSFRETE"		+ STR_PULA
	cQryAux += "FROM SF1010, (SELECT COUNT(DISTINCT D1_DOC), D1_FILIAL FILIAL , D1_DOC DOC, D1_SERIE SERIE, D1_FORNECE FORNECE, D1_LOJA LOJA, D1_NFORI NFORI, D1_SERIORI SERIORI,D1_DTDIGIT DTDIGIT FROM SD1010"		+ STR_PULA
	cQryAux += "WHERE SD1010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux += "AND D1_NFORI <>' '"		+ STR_PULA
	cQryAux += "AND D1_SERIORI <>' '"		+ STR_PULA
	cQryAux += "GROUP BY  D1_FILIAL, D1_DOC, D1_SERIE, D1_FORNECE, D1_LOJA, D1_NFORI, D1_SERIORI,D1_DTDIGIT) O, SF2010, SA2010, SA1010"		+ STR_PULA
	cQryAux += "WHERE SF1010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux += "AND F1_DTDIGIT BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA  //digitação
	//cQryAux += "AND F1_DTDIGIT >='20200827'"		+ STR_PULA
	cQryAux += "AND F1_ESPECIE ='CTE'"		+ STR_PULA
	cQryAux += "AND F2_CARGA <>' '"		+ STR_PULA
	cQryAux += "AND F1_FILIAL           = O.FILIAL"		+ STR_PULA
	cQryAux += "AND F1_DOC              = O.DOC"		+ STR_PULA
	cQryAux += "AND F1_SERIE            = O.SERIE "		+ STR_PULA
	cQryAux += "AND F1_FORNECE          = O.FORNECE"		+ STR_PULA
	cQryAux += "AND F1_LOJA             = O.LOJA "		+ STR_PULA
	cQryAux += "AND SF2010.D_E_L_E_T_   =' '"		+ STR_PULA
	cQryAux += "AND F2_FILIAL           = O.FILIAL "		+ STR_PULA
	cQryAux += "AND F2_DOC              = O.NFORI"		+ STR_PULA
	cQryAux += "AND F2_SERIE            = O.SERIORI"		+ STR_PULA
	cQryAux += "AND SA2010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux += "AND A2_COD = F1_FORNECE"		+ STR_PULA
	cQryAux += "AND A2_LOJA = F1_LOJA"		+ STR_PULA
	cQryAux += "AND SA1010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux += "AND A1_COD = F2_CLIENTE"		+ STR_PULA
	cQryAux += "AND A1_LOJA = F2_LOJA)CTE"		+ STR_PULA

	MemoWrite("C:\teste\RELCTE_DTDIGIT_V3.sql",cQryAux) //09/09/2020

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
