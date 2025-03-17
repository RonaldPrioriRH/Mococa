//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
// Consulth 
/*/{Protheus.doc} RELCOB
Relatório - Cobrança de Titulos        
@author TReport
@since 21/02/2019
@version 1.0
	@example
	u_RELCOB()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELCOB()   
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := "RELCOB"
	
	////////////////////////////////////////////////////////////////////////
	///Cria as perguntas no SX1
	////////////////////////////////////////////////////////////////////////
	ValPer01()
	
	//Verifica se existe grupo de perguntas criado na SX1 
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
	oReport := TReport():New(	"RELCOB",;		//Nome do Relatório
								"Cobrança de Titulos",;		//Título
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
	TRCell():New(oSectDad, "CNPJ", "QRY_AUX", "CNPJ", /*Picture*/, 18, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "EMPRESA", "QRY_AUX", "Empresa", /*Picture*/, 32, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CNPJ_DEVEDOR", "QRY_AUX", "Cnpj Devedor", /*Picture*/, 14, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "RAZAO_DEVEDOR", "QRY_AUX", "Razao Devedor", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ENDERECO", "QRY_AUX", "Endereço", /*Picture*/, 80, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BAIRRO", "QRY_AUX", "Bairro", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CIDADE", "QRY_AUX", "Cidade", /*Picture*/, 60, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "UF", "QRY_AUX", "Estado", "@!", 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CEP", "QRY_AUX", "Cep", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DDD", "QRY_AUX", "DDD", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TELEFONE", "QRY_AUX", "Telefone", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ESPECIE", "QRY_AUX", "Especie", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NTITULO", "QRY_AUX", "Nº titulo", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NPARCELA", "QRY_AUX", "Nº parcela", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "EMISSAO", "QRY_AUX", "Emissão", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENCIMENTO", "QRY_AUX", "Vencimento", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALORTITULO", "QRY_AUX", "R$ titulo", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALORRESIDUAL", "QRY_AUX", "R$ Residual", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALORCUSTAS", "QRY_AUX", "R$ custas", /*Picture*/, 0, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "BCORECEBER", "QRY_AUX", "Bcoreceber", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "OBSERVACOES", "QRY_AUX", "Observações", /*Picture*/, 25, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COD_INDENTIFICADOR_DEVEDOR", "QRY_AUX", "Cod Indentificador Devedor", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOMEDOREPRESENTANTE", "QRY_AUX", "Nomedo Representante", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DDDEFONEREPRESENTANTE", "QRY_AUX", "Ddd e Fone representante", /*Picture*/, 16, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "EMAIDEVEDOR", "QRY_AUX", "EmaiL Devedor", /*Picture*/, 150, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
		

Return oReport

//PARAMETROS DO RELATÓRIO
Static Function ValPer01()
	_sAlias	:=	Alias()
	//Retirado Sangelles 22/03/2022 ->dbSelectArea("SX1")
	//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
	cPerg 	:=	PADR(cPerg,10)
	
	U_xPutSx1(cPerg,"01","Emissão de ?","","","mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Emissão Até ?","","","mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"03","Vencimento de ?","","","mv_CH3","D",08,0,0,"G","","","","","MV_PAR03","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"04","Vencimento Até ?","","","mv_CH4","D",08,0,0,"G","","","","","MV_PAR04","","","","","","","","","","","","","","","","")


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
	cQryAux += "SELECT (CASE E1_FILIAL "		+ STR_PULA
	cQryAux += "WHEN '0101' THEN '52.502.507/0001-47'"		+ STR_PULA
	cQryAux += "WHEN '0102' THEN '52.502.507/0003-09'"		+ STR_PULA
	cQryAux += "WHEN '0103' THEN '52.502.507/0008-13'"		+ STR_PULA
	cQryAux += "WHEN '0104' THEN '52.502.507/0066-92'"		+ STR_PULA
	cQryAux += "WHEN '0105' THEN '52.502.507/0006-51'"		+ STR_PULA
	cQryAux += "WHEN '0106' THEN '52.502.507/0062-69'"		+ STR_PULA
	cQryAux += "WHEN '0107' THEN '52.502.507/0068-54'"		+ STR_PULA
	cQryAux += "WHEN '0108' THEN '52.502.507/0012-08'"		+ STR_PULA
	cQryAux += "WHEN '0109' THEN '52.502.507/0016-23'"		+ STR_PULA
	cQryAux += "WHEN '0110' THEN '52.502.507/0018-95'"		+ STR_PULA
	cQryAux += "WHEN '0111' THEN '52.502.507/0022-71'"		+ STR_PULA
	cQryAux += "WHEN '0112' THEN '52.502.507/0019-76'"		+ STR_PULA
	cQryAux += "WHEN '0113' THEN '52.502.507/0026-03'"		+ STR_PULA
	cQryAux += "END ) CNPJ, "		+ STR_PULA
	cQryAux += "'MOCOCA S/A PRODUTOS ALIMENTICIOS' AS EMPRESA, "		+ STR_PULA
	cQryAux += "A1_CGC AS CNPJ_DEVEDOR, "		+ STR_PULA
	cQryAux += "TRIM(A1_NOME) AS RAZAO_DEVEDOR, "		+ STR_PULA
	cQryAux += "TRIM(A1_END) AS ENDERECO, "		+ STR_PULA
	cQryAux += "TRIM(A1_BAIRRO) AS BAIRRO, "		+ STR_PULA
	cQryAux += "TRIM(A1_MUN) AS CIDADE, "		+ STR_PULA
	cQryAux += "A1_EST AS UF, "		+ STR_PULA
	cQryAux += "A1_CEP AS CEP, "		+ STR_PULA
	cQryAux += "A1_DDD AS DDD, "		+ STR_PULA
	cQryAux += "A1_TEL AS TELEFONE, "		+ STR_PULA
	cQryAux += "E1_TIPO AS ESPECIE, "		+ STR_PULA
	cQryAux += "E1_NUM AS NTITULO, "		+ STR_PULA
	cQryAux += "E1_PARCELA AS NPARCELA, "		+ STR_PULA
	cQryAux += "TO_DATE(TRIM(E1_EMISSAO), 'YYYYMMDD') EMISSAO, "		+ STR_PULA
	cQryAux += "TO_DATE(TRIM(E1_VENCTO), 'YYYYMMDD') VENCIMENTO, "		+ STR_PULA
	cQryAux += "E1_VALOR AS VALORTITULO,"		+ STR_PULA
	cQryAux += "E1_SALDO AS VALORRESIDUAL,"		+ STR_PULA
	cQryAux += "NULL AS VALORCUSTAS, "		+ STR_PULA
    cQryAux += "E1_PORTADO  BCORECEBER, "		+ STR_PULA
	cQryAux += "E1_HIST AS OBSERVACOES, "		+ STR_PULA
	cQryAux += "TRIM(E1_CLIENTE "		+ STR_PULA
	cQryAux += "|| E1_LOJA) AS COD_INDENTIFICADOR_DEVEDOR, "		+ STR_PULA
	cQryAux += "TRIM(A3_NOME) AS NOMEDOREPRESENTANTE, "		+ STR_PULA
	cQryAux += "(A3_DDD||A3_TEL) AS DDDEFONEREPRESENTANTE, "		+ STR_PULA
	cQryAux += "TRIM(A1_EMAIL) AS EMAIDEVEDOR "		+ STR_PULA
	cQryAux += "FROM SE1010 "		+ STR_PULA
	cQryAux += "LEFT JOIN SA1010 "		+ STR_PULA
	cQryAux += "ON SA1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "AND A1_COD = E1_CLIENTE "		+ STR_PULA
	cQryAux += "AND A1_LOJA = E1_LOJA "		+ STR_PULA
	cQryAux += "LEFT JOIN SA3010 "		+ STR_PULA
	cQryAux += "ON SA3010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "AND A3_COD = E1_VEND1 "		+ STR_PULA
	cQryAux += "WHERE SE1010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQryAux += "AND E1_SALDO <> 0 "		+ STR_PULA
	cQryAux += "AND E1_CLIENTE NOT LIKE '%P%' "		+ STR_PULA
	cQryAux += "AND E1_EMISSAO BETWEEN '" + DTOS(MV_PAR01) + "'AND'" + DTOS(MV_PAR02) + "'  "	+ STR_PULA
	cQryAux += "AND E1_VENCTO BETWEEN '" + DTOS(MV_PAR03) + "'AND'" + DTOS(MV_PAR04) + "'  "	+ STR_PULA
    
    MemoWrite("C:\teste\RELCOB_V2.sql",cQryAux) //07/08/2019 incluido Campo E1_PORTADO
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
