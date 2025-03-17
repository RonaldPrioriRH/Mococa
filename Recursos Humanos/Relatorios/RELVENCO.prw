//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELVENCO
Relatório - Venda Colaborador             
@author TReport
@since 19/03/2019
@version 1.0
	@example
	u_RELVENCO()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELVENCO()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""
	
	//Definições da pergunta
	cPerg := "RELVENCO"
	
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
	oReport := TReport():New(	"RELVENCO",;		//Nome do Relatório
								"Venda Colaborador",;		//Título
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
	TRCell():New(oSectDad, "FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PREFIXO", "QRY_AUX", "Prefixo", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NUMERONF", "QRY_AUX", "Numeronf", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TIPO", "QRY_AUX", "Tipo", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NATUREZA", "QRY_AUX", "Natureza", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CLIENTE", "QRY_AUX", "Cliente", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LOJA", "QRY_AUX", "Loja", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOME", "QRY_AUX", "Nome", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "EMISSAO", "QRY_AUX", "Emissao", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VENCIMENTO", "QRY_AUX", "Vencimento", /*Picture*/, 10, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DTBAIXA", "QRY_AUX", "Dtbaixa", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VALOR", "QRY_AUX", "Valor", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MATRICULA", "QRY_AUX", "Matricula", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
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
	U_xPutSx1(cPerg,"03","Da Filial ?","","","mv_CH3","C",04,0,0,"G","","SM0","","","MV_PAR03","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"04","Até a Filial ?","","","mv_CH4","C",04,0,0,"G","","SM0","","","MV_PAR04","","","","","","","","","","","","","","","","")	
	


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
	cQryAux += "SELECT SE1.E1_FILIAL                   AS FILIAL, "		+ STR_PULA
	cQryAux += "       SE1.E1_PREFIXO                  AS PREFIXO, "		+ STR_PULA
	cQryAux += "       SE1.E1_NUM                      AS NUMERONF, "		+ STR_PULA
	cQryAux += "       SE1.E1_TIPO                     AS TIPO, "		+ STR_PULA
	cQryAux += "       SE1.E1_NATUREZ                  AS NATUREZA, "		+ STR_PULA
	cQryAux += "       SE1.E1_CLIENTE                  AS CLIENTE, "		+ STR_PULA
	cQryAux += "       SE1.E1_LOJA                     AS LOJA, "		+ STR_PULA
	cQryAux += "       SE1.E1_NOMCLI                   AS NOME, "		+ STR_PULA
	cQryAux += "       SUBSTR(SE1.E1_EMISSAO, 7, 2) "		+ STR_PULA
	cQryAux += "       || '/' "		+ STR_PULA
	cQryAux += "       || SUBSTR(SE1.E1_EMISSAO, 5, 2) "		+ STR_PULA
	cQryAux += "       || '/' "		+ STR_PULA
	cQryAux += "       || SUBSTR(SE1.E1_EMISSAO, 1, 4) AS EMISSAO, "		+ STR_PULA
	cQryAux += "       SUBSTR(SE1.E1_VENCTO, 7, 2) "		+ STR_PULA
	cQryAux += "       || '/' "		+ STR_PULA
	cQryAux += "       || SUBSTR(SE1.E1_VENCTO, 5, 2) "		+ STR_PULA
	cQryAux += "       || '/' "		+ STR_PULA
	cQryAux += "       || SUBSTR(SE1.E1_VENCTO, 1, 4)  AS VENCIMENTO, "		+ STR_PULA
	cQryAux += "       SE1.E1_BAIXA                    AS DTBAIXA, "		+ STR_PULA
	cQryAux += "       SE1.E1_VALOR                    AS VALOR, "		+ STR_PULA
	cQryAux += "       SRA.RA_MAT                      AS MATRICULA "		+ STR_PULA
	cQryAux += "FROM   SE1010 SE1, "		+ STR_PULA
	cQryAux += "       SA1010 SA1, "		+ STR_PULA
	cQryAux += "       SRA010 SRA "		+ STR_PULA
	cQryAux += "WHERE  SA1.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQryAux += "       AND SRA.RA_CIC = SA1.A1_CGC "		+ STR_PULA
	cQryAux += "	   AND SE1.E1_EMISSAO  BETWEEN '" + DTOS(MV_PAR01) +"' AND '"+ DTOS(MV_PAR02) +"' 	" + STR_PULA
	cQryAux += "       AND SE1.D_E_L_E_T_ = '  ' "		+ STR_PULA
	cQryAux += "       AND SRA.D_E_L_E_T_ = '  ' "		+ STR_PULA //ADICINIEI PARA REMOVER OS DELETADOS DUPLICIDADE
	cQryAux += "       AND SE1.E1_CLIENTE = SA1.A1_COD "		+ STR_PULA
	cQryAux += "       AND SE1.E1_LOJA = SA1.A1_LOJA "		+ STR_PULA
	cQryAux += "       AND TRIM(SA1.A1_XCODCOB) = 'FPGT' "		+ STR_PULA
	cQryAux += " 	   AND SRA.RA_FILIAL BETWEEN '" + MV_PAR03 +"' AND '"+ MV_PAR04 +"' 	" + STR_PULA
	//cQryAux += "       AND SE1.E1_FILIAL = SRA.RA_FILIAL "		+ STR_PULA
	cQryAux += "       AND SRA.RA_DEMISSA = '  ' "		+ STR_PULA
	cQryAux += "       AND SE1.E1_SALDO <> 0 "		+ STR_PULA
	cQryAux += "       AND TRIM(SE1.E1_BAIXA) IS NULL"		+ STR_PULA
	cQryAux += "       AND SE1.E1_NATUREZ <> '0102002' "		+ STR_PULA //VENDA DE SUCATA / PALLETS
	
	MemoWrite("C:\teste\RELVENCO_V2.sql",cQryAux) //23/10/2019
	
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
