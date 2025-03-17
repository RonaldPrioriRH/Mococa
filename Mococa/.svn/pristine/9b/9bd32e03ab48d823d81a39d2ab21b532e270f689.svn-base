//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RGLT304
Relatório - Recepção do Leite II          
@author TReport
@since 19/02/2020
@version 1.0
	@example
	u_RGLT304()
	@obs Função gerada pelo TReport()
/*/
	
User Function RGLT304()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""

	//Definições da pergunta
	cPerg := "RGLT304"
	
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
	oReport := TReport():New(	"RGLT304",;		//Nome do Relatório
								"Recepção do Leite II",;		//Título
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
	TRCell():New(oSectDad, "ZLD_FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A2_EST", "QRY_AUX", "Estado", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A2_COD_MUN", "QRY_AUX", "Cod. Municip", /*Picture*/, 5, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "A2_MUN", "QRY_AUX", "Munícipio", /*Picture*/, 60, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QTD", "QRY_AUX", "Qtd", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VOLUME", "QRY_AUX", "Volume", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTCOLETA", "QRY_AUX", "Dtcoleta", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)

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
	cQryAux += "SELECT ZLD.ZLD_FILIAL, "		+ STR_PULA"
	cQryAux += "       A2_EST, "		+ STR_PULA"
	cQryAux += "       A2_COD_MUN, "		+ STR_PULA
	cQryAux += "       A2_MUN, "		+ STR_PULA
	//cQryAux += "       A2_COD, "		+ STR_PULA
	//cQryAux += "       A2_LOJA, "		+ STR_PULA
	cQryAux += "       COUNT(DISTINCT(A2_COD||A2_LOJA)) AS QTD, "		+ STR_PULA
	//cQryAux += "       COUNT(*)                                  AS QTD, "		+ STR_PULA
	cQryAux += "       SUM(ZLD_QTDBOM)                           AS VOLUME, "		+ STR_PULA
	cQryAux += "       TO_DATE(TRIM(ZLD.ZLD_DTCOLE), 'YYYYMMDD') DTCOLETA "		+ STR_PULA
	cQryAux += "FROM   ZLD010 ZLD, "		+ STR_PULA
	cQryAux += "       SA2010 SA2 "		+ STR_PULA
	cQryAux += "WHERE  ZLD.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "       AND SA2.D_E_L_E_T_ = ' ' "		+ STR_PULA
	//cQryAux += "       AND ZLD.ZLD_SETOR = '000001' "		+ STR_PULA
	cQryAux += "       AND ZLD.ZLD_SETOR = '"+MV_PAR01+"' "		+ STR_PULA
	//cQryAux += "       AND ZLD.ZLD_FILIAL = '0102' "		+ STR_PULA
	cQryAux += "       AND ZLD.ZLD_FILIAL = '"+MV_PAR02+ "' "		+ STR_PULA
	//cQryAux += "       AND ZLD.ZLD_DTCOLE BETWEEN '20200201' AND '20200212' "		+ STR_PULA
	cQryAux += "AND ZLD.ZLD_DTCOLE BETWEEN '" + DTOS(MV_PAR03) +"' AND '"+ DTOS(MV_PAR04) +"' 	" + STR_PULA  
	cQryAux += "       AND SA2.A2_COD = ZLD.ZLD_RETIRO "		+ STR_PULA
	cQryAux += "       AND SA2.A2_LOJA = ZLD.ZLD_RETILJ "		+ STR_PULA
	cQryAux += "GROUP  BY A2_EST, "		+ STR_PULA
	//cQryAux += "          SA2.A2_COD, "		+ STR_PULA
	//cQryAux += "          SA2.A2_LOJA, "		+ STR_PULA
	cQryAux += "          SA2.A2_COD_MUN, "		+ STR_PULA
	cQryAux += "          A2_MUN, "		+ STR_PULA
	cQryAux += "          ZLD.ZLD_DTCOLE, "		+ STR_PULA
	cQryAux += "          ZLD.ZLD_FILIAL "		+ STR_PULA
	cQryAux += "HAVING ( SUM(ZLD_QTDBOM) > 0 )"		+ STR_PULA

	MemoWrite("C:\teste\RGLT304_v3sql",cQryAux) //30/06/2022

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

Static Function ValPer01()
	_sAlias	:=	Alias()
	dbSelectArea("SX1")
	dbSetOrder(1)
	cPerg 	:=	PADR(cPerg,10)
	
	U_xPutSx1(cPerg,"01","Setor ?","","","mv_CH1","C",06,0,0,"G","U_ValSetPar()","ZL2_01","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Filial ?","","","mv_CH2","C",04,0,0,"G","","SM0","","","MV_PAR02","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"03","Data de ?","","","mv_CH3","D",08,0,0,"G","","","","","MV_PAR03","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"04","Data Até ?","","","mv_CH4","D",08,0,0,"G","","","","","MV_PAR04","","","","","","","","","","","","","","","","")
	
	dbSelectArea(_sAlias)

Return()	
