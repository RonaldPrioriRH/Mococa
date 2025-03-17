//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
	
/*/{Protheus.doc} RELCOLETA
Relatório - Relatorio                     
@author TReport
@since 10/02/2021
@version 1.0
	@example
	u_RELCOLETA()
	@obs Função gerada pelo TReport()
/*/
	
User Function RELCOLETA()
	Local aArea   := GetArea()
	Local oReport
	Local lEmail  := .F.
	Local cPara   := ""
	Private cPerg := ""

		//Definições da pergunta
	cPerg := "RELCOLETA"
	
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
	oReport := TReport():New(	"RELCOLETA",;		//Nome do Relatório
								"Relatorio Coleta de Leite ",;		//Título
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
	TRCell():New(oSectDad, "FILIAL", "QRY_AUX", "Filial", /*Picture*/, 4, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "STATUS", "QRY_AUX", "Status", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VIAGEM", "QRY_AUX", "Viagem", /*Picture*/, 14, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TICKET_TALAO", "QRY_AUX", "Ticket_talao", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TICKET_PORTARIA", "QRY_AUX", "Ticket_portaria", /*Picture*/, 9, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "USUARIO", "QRY_AUX", "Usuario", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DIA_IMPORTADO_PROTHEUS", "QRY_AUX", "Dia_importado_protheus", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MEDIDOR_VAZAO", "QRY_AUX", "Medidor_vazao", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DIA_COLETA", "QRY_AUX", "Dia_coleta", /*Picture*/, 8, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "HORACOLETA", "QRY_AUX", "Horacoleta", /*Picture*/, 5, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "SETOR", "QRY_AUX", "Setor", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "ITEM", "QRY_AUX", "Item", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LINHA", "QRY_AUX", "Linha", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PRODUTOR", "QRY_AUX", "Produtor", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LOJA_PRODUTOR", "QRY_AUX", "Loja_produtor", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOME", "QRY_AUX", "Nome", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "VERSAO", "QRY_AUX", "Versao", /*Picture*/, 3, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "DESC_LINHA", "QRY_AUX", "Desc_linha", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TEMPERATURA", "QRY_AUX", "Temperatura", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "REGUA", "QRY_AUX", "Regua", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COMPARTIMENTO", "QRY_AUX", "Compartimento", /*Picture*/, 20, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TRANSP", "QRY_AUX", "Transp", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LOJA_TRANSP", "QRY_AUX", "Loja_transp", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOME_TRANSP", "QRY_AUX", "Nome_transp", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "MOTORISTA", "QRY_AUX", "Motorista", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "NOME_MOTORISTA", "QRY_AUX", "Nome_motorista", /*Picture*/, 40, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QTDBOM", "QRY_AUX", "Qtdbom", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "CODIGO", "QRY_AUX", "Codigo", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COD_FORNEC", "QRY_AUX", "Cod_fornec", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LOJA_FORNEC", "QRY_AUX", "Loja_fornec", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "RAZAO", "QRY_AUX", "Razao", /*Picture*/, 60, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "TICKET", "QRY_AUX", "Ticket", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LANCA_TICKET", "QRY_AUX", "Lanca_ticket", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "FRETE", "QRY_AUX", "Frete", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "QUALIDADE", "QRY_AUX", "Qualidade", /*Picture*/, 1, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "PRECO_ATUAL", "QRY_AUX", "Preco_atual", /*Picture*/, 15, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "COD_PROD", "QRY_AUX", "Cod_prod", /*Picture*/, 6, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	TRCell():New(oSectDad, "LOJA_PROD", "QRY_AUX", "Loja_prod", /*Picture*/, 2, /*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,/*cHeaderAlign */,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
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
	cQryAux += "SELECT           ZX1_FILIAL FILIAL,"		+ STR_PULA
	cQryAux += "  CASE "		+ STR_PULA
	cQryAux += "    WHEN  ZX1_STATUS = 'I' THEN 'IMPORTADO'"		+ STR_PULA
	cQryAux += "    WHEN  ZX1_STATUS = ' ' THEN 'VIAGEM NÃO IMPORTADA' "		+ STR_PULA
	cQryAux += "  END AS STATUS,    "		+ STR_PULA
	cQryAux += "                 ZX1_VIAGEM VIAGEM,  "		+ STR_PULA
	cQryAux += "                 ZLD_TICKET TICKET_TALAO,"		+ STR_PULA
	cQryAux += "                 ZLD_TKPESO TICKET_PORTARIA,              "		+ STR_PULA
	cQryAux += "                 ZLD_USER USUARIO,"		+ STR_PULA
	cQryAux += "                 TO_DATE(ZLD_DTLANC,'YYYYMMDD') DIA_IMPORTADO_PROTHEUS,  "		+ STR_PULA
	cQryAux += "                 Z26_COD MEDIDOR_VAZAO,"		+ STR_PULA
	cQryAux += "                 TO_DATE(ZX1_DTCOLE,'YYYYMMDD') DIA_COLETA,                "		+ STR_PULA
	cQryAux += "                 SUBSTR(ZX1_HORA, 1, 5) HORACOLETA,"		+ STR_PULA
	cQryAux += "                 ZX1_SETOR SETOR,"		+ STR_PULA
	cQryAux += "                 ZX1_ITEM  ITEM,"		+ STR_PULA
	cQryAux += "                 ZX1_LINROT LINHA,"		+ STR_PULA
	cQryAux += "                 ZX1_RETIRO PRODUTOR,"		+ STR_PULA
	cQryAux += "                 ZX1_RETILJ LOJA_PRODUTOR,"		+ STR_PULA
	cQryAux += "                 A2_NOME NOME,"		+ STR_PULA
	cQryAux += "                 ZX1_VERSAO VERSAO,"		+ STR_PULA
	cQryAux += "                 ZX1_DESLIN DESC_LINHA,"		+ STR_PULA
	cQryAux += "                 ZX1_TEMP TEMPERATURA,"		+ STR_PULA
	cQryAux += "                 ZX1_REGUA REGUA,"		+ STR_PULA
	cQryAux += "                 ZX1_COMPAR COMPARTIMENTO,"		+ STR_PULA
	cQryAux += "                 ZX1_FRETIS TRANSP ,"		+ STR_PULA
	cQryAux += "                 ZX1_LJFRET LOJA_TRANSP,"		+ STR_PULA
	cQryAux += "                 (SELECT A2_NOME FROM SA2010 "		+ STR_PULA
	cQryAux += "                 WHERE SA2010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "                    AND A2_COD  = ZX1_FRETIS"		+ STR_PULA
	cQryAux += "                    AND A2_LOJA = ZX1_LJFRET"		+ STR_PULA
	cQryAux += "                 ) NOME_TRANSP,"		+ STR_PULA
	cQryAux += "                 ZX1_MOTOR MOTORISTA,"		+ STR_PULA
	cQryAux += "                 ZX1_DCRRET NOME_MOTORISTA,"		+ STR_PULA
	cQryAux += "                 ZX1_QTDBOM QTDBOM,"		+ STR_PULA
	cQryAux += "                 ZM3_CODIGO CODIGO,"		+ STR_PULA
	cQryAux += "                 ZM3_NOME NOME,"		+ STR_PULA
	cQryAux += "                 ZM3_CODSA2 COD_FORNEC,"		+ STR_PULA
	cQryAux += "                 ZM3_LOJA LOJA_FORNEC,"		+ STR_PULA
	cQryAux += "                 ZM3_RAZAO RAZAO,"		+ STR_PULA
	cQryAux += "                 ZM3_TICKET TICKET,"		+ STR_PULA
	cQryAux += "                 ZM3_ENTMIX LANCA_TICKET,"		+ STR_PULA
	cQryAux += "                 ZM3_FRETE FRETE,"		+ STR_PULA
	cQryAux += "                 ZM3_QUALID QUALIDADE,"		+ STR_PULA
	cQryAux += "                 ZM3_PRECO PRECO_ATUAL,"		+ STR_PULA
	cQryAux += "                 ZM4_CODSA2 COD_PROD,"		+ STR_PULA
	cQryAux += "                 ZM4_LOJA LOJA_PROD,"		+ STR_PULA
	cQryAux += "                 ZM4_NOME NOME"		+ STR_PULA
	cQryAux += "  FROM      ZX1010"		+ STR_PULA
	cQryAux += "         LEFT JOIN ZLD010"		+ STR_PULA
	cQryAux += "         ON ZLD010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "               AND   ZX1_FILIAL"		+ STR_PULA
	cQryAux += "                   || ZX1_ITEM"		+ STR_PULA
	cQryAux += "                   || ZX1_DTCOLE"		+ STR_PULA
	cQryAux += "                   || ZX1_SETOR"		+ STR_PULA
	cQryAux += "                   || ZX1_RETIRO"		+ STR_PULA
	cQryAux += "                   || ZX1_RETILJ"		+ STR_PULA
	cQryAux += "                   || ZX1_QTDBOM"		+ STR_PULA
	cQryAux += "                   || ZX1_LINROT"		+ STR_PULA
	cQryAux += "                   || ZX1_VERSAO"		+ STR_PULA
	cQryAux += "                   || ZX1_VEICUL"		+ STR_PULA
	cQryAux += "                   || ZX1_MOTOR = ZLD_FILIAL"		+ STR_PULA
	cQryAux += "                                  || ZLD_ITEM"		+ STR_PULA
	cQryAux += "                                  || ZLD_DTCOLE"		+ STR_PULA
	cQryAux += "                                  || ZLD_SETOR"		+ STR_PULA
	cQryAux += "                                  || ZLD_RETIRO"		+ STR_PULA
	cQryAux += "                                  || ZLD_RETILJ"		+ STR_PULA
	cQryAux += "                                  || ZLD_QTDBOM"		+ STR_PULA
	cQryAux += "                                  || ZLD_LINROT"		+ STR_PULA
	cQryAux += "                                  || ZLD_VERSAO"		+ STR_PULA
	cQryAux += "                                  || ZLD_VEICUL"		+ STR_PULA
	cQryAux += "                                  || ZLD_MOTOR"		+ STR_PULA
	cQryAux += "          LEFT JOIN Z26010 ON Z26010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "               		AND ZX1_FILIAL  = Z26_FILIAL"		+ STR_PULA
	cQryAux += "                	AND ZX1_VIAGEM  = Z26_VIAGEM"		+ STR_PULA
	cQryAux += "          LEFT JOIN SA2010  ON SA2010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "                	AND ZX1_RETIRO = A2_COD                                "		+ STR_PULA
	cQryAux += "                	AND ZX1_RETILJ = A2_LOJA                                "		+ STR_PULA
	cQryAux += "          LEFT JOIN ZM4010 ON ZM4010.D_E_L_E_T_ =' '"		+ STR_PULA
	cQryAux += "                    AND ZM4_CODSA2 = ZLD_RETIRO"		+ STR_PULA
	cQryAux += "                    AND ZM4_LOJA = ZLD_RETILJ"		+ STR_PULA
	cQryAux += "                    "		+ STR_PULA
	cQryAux += "          LEFT JOIN ZM3010 ON ZM3010.D_E_L_E_T_=' '"		+ STR_PULA
	cQryAux += "                    AND ZM3_CODIGO = ZM4_CODIGO      "		+ STR_PULA
	cQryAux += " WHERE       ZX1010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQryAux += "                AND ZX1_FILIAL BETWEEN '" + MV_PAR01 +"' AND '"+ MV_PAR02 +"' 	" + STR_PULA
	cQryAux += "      		    AND ZX1_DTCOLE  BETWEEN '" + DTOS(MV_PAR03) +"' AND '"+ DTOS(MV_PAR04) +"' 	" + STR_PULA
	cQryAux += "         ORDER BY 1,2,3,12 "		+ STR_PULA
	
	MemoWrite("C:\temp\RELCOLETA2.sql",cQryAux)
	
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
	
	U_xPutSx1(cPerg,"01","Filial  De ?","","","mv_CH1","C",04,0,0,"G","","SM0","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Filial  Até ?","","","mv_CH2","C",04,0,0,"G","","SM0","","","MV_PAR02","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"03","Data Coleta De ?","","","mv_CH3","D",08,0,0,"G","","","","","MV_PAR03","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"04","Data Coleta Até ?","","","mv_CH4","D",08,0,0,"G","","","","","MV_PAR04","","","","","","","","","","","","","","","","")

	
	dbSelectArea(_sAlias)

Return()
