#Include 'Protheus.ch'
#Include 'TopConn.ch'

/*/{Protheus.doc} RCOMR002

Relatório de apuracao do Leite Spot

@author Leandro Rodrigues
@since 04/05/2017
@version Desenvolvido para P12
@param Nao recebe parametros
@return nulo
/*/

User Function RCOMR002()

Local oReport
Private cPerg := "RCOMR002"

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Cria as perguntas na SX1                                             ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
AjustaSx1()


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Interface de impressao                                                  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oReport := ReportDef()
oReport:PrintDialog()

Return

//---------------------------------------------------------
// Definiçao da estrutura do relatorio
//---------------------------------------------------------
Static Function ReportDef()

	Local oReport
	Local oEntrada
	Local oDevolucao
	Local oComplementar
	Local cTitle    	:= "MOVIMENTAÇÃO LEITE SPOT"

	oReport:= TReport():New("RCOMR002",cTitle,cPerg,{|oReport| PrintReport(oReport,oEntrada,oDevolucao,oComplementar)},"Este relatório apresenta o um resumo de todas as movimentações de entrada do Leite Spot.")
	//oReport:SetPortrait() 		// Orientação retrato
	oReport:SetLandscape()			// Orientação paisagem
	//oReport:HideHeader()  		// Nao imprime cabeçalho padrão do Protheus
	//oReport:HideFooter()			// Nao imprime rodapé padrão do Protheus
	oReport:HideParamPage()			// Inibe impressão da pagina de parametros
	oReport:SetUseGC(.F.) 			// Habilita o botão <Gestao Corporativa> do relatório
	//oReport:DisableOrientation()  // Desabilita a seleção da orientação (retrato/paisagem)
	//oReport:cFontBody := "Arial"
	//oReport:nFontBody := 8

	Pergunte(oReport:GetParam(),.F.)

	oEntrada 		:= TRSection():New(oReport,"Titulos"  ,{"SF1"},{"Titulos"	})
	oDevolucao 		:= TRSection():New(oReport,"Devolucao",{"SF1"},{"Devolucoes"})
	oComplementar 	:= TRSection():New(oReport,"Pedidos"  ,{"SC7"},{"Pedidos"	})

	//------------------------------------------------------------------------------------------------------
	//Estrutura das linhas de Entradas
	//------------------------------------------------------------------------------------------------------

	TRCell():New(oEntrada,"D1_FILIAL"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oEntrada,"D1_DOC"		, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oEntrada,"D1_SERIE"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oEntrada,"D1_FORNECE"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oEntrada,"D1_LOJA"		, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oEntrada,"A2_NOME"		, "", /*Titulo*/, /*Picture*/, 25/*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oEntrada,"D1_DTDIGIT"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oEntrada,"D1_QUANT"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oEntrada,"D1_VUNIT"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oEntrada,"Z19_DENS"	, ""  /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oEntrada,"D1_TOTAL"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oEntrada,"ZEJ_PESO"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oEntrada,"ZEJ_DIFERE"	, ""  /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oEntrada,"ZEJ_NUMDEV"	, ""  /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	//TRCell():New(oEntrada,"ZEJ_SERDEV"	, ""  /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)


	oEntrada:Cell("D1_QUANT"  ):SetHeaderAlign("RIGHT")
	oEntrada:Cell("D1_VUNIT"  ):SetHeaderAlign("RIGHT")
	oEntrada:Cell("D1_TOTAL"  ):SetHeaderAlign("RIGHT")
	oEntrada:Cell("ZEJ_PESO"  ):SetHeaderAlign("RIGHT")
	oEntrada:Cell("ZEJ_DIFERE"):SetHeaderAlign("RIGHT")

	//------------------------------------------------------------------------------------------------------
	//Estrutura das linhas de Devolucoes
	//------------------------------------------------------------------------------------------------------

	TRCell():New(oDevolucao,"D2_FILIAL"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDevolucao,"D2_DOC"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDevolucao,"D2_SERIE"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDevolucao,"D2_ITEM"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDevolucao,"ZEJ_FORNEC", "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDevolucao,"ZEJ_LOJA"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDevolucao,"A2_NOME"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDevolucao,"D2_EMISSAO", "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDevolucao,"D2_QUANT"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDevolucao,"D2_PRCVEN"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oDevolucao,"D2_TOTAL"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)

	oDevolucao:Cell("D2_QUANT"  ):SetHeaderAlign("RIGHT")
	oDevolucao:Cell("D2_PRCVEN" ):SetHeaderAlign("RIGHT")
	oDevolucao:Cell("D2_TOTAL"  ):SetHeaderAlign("RIGHT")

	//------------------------------------------------------------------------------------------------------
	//Estrutura das linhas de Complementar
	//------------------------------------------------------------------------------------------------------
	TRCell():New(oComplementar,"D1_FILIAL"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oComplementar,"D1_DOC"		, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oComplementar,"D1_SERIE"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oComplementar,"D1_FORNECE"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oComplementar,"D1_LOJA"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oComplementar,"A2_NOME"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oComplementar,"D1_DTDIGIT"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oComplementar,"D1_QUANT"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oComplementar,"D1_VUNIT"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oComplementar,"D1_TOTAL"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oComplementar,"ZEJ_PESO"	, "", /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oComplementar,"ZEJ_DIFERE"	, ""  /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)
	TRCell():New(oComplementar,"ZEJ_PEDIDO"	, ""  /*Titulo*/, /*Picture*/, /*Tamanho*/, /*lPixel*/,/*bConteudo*/)

	oComplementar:Cell("D1_QUANT"  ):SetHeaderAlign("RIGHT")
	oComplementar:Cell("D1_VUNIT"  ):SetHeaderAlign("RIGHT")
	oComplementar:Cell("D1_TOTAL"  ):SetHeaderAlign("RIGHT")
	oComplementar:Cell("ZEJ_PESO"  ):SetHeaderAlign("RIGHT")
	oComplementar:Cell("ZEJ_DIFERE"):SetHeaderAlign("RIGHT")
Return(oReport)

//---------------------------------------------------------
// Faz impressão do relatório
//---------------------------------------------------------
Static Function PrintReport(oReport,oEntrada,oDevolucao,oComplementar)


oReport:SetMeter(RecCount())

//Imprime Entradas do periodo
ImpEnt(oReport,oEntrada)

//Imprime Devolucoes do periodo
ImpDev(oReport,oDevolucao)

//Imprime Devolucoes do periodo
ImpComp(oReport,oComplementar)


Return

/*
Cria Perguntas do relatorio
*/

Static Function AjustaSX1()


Local aHelpPor	:= {}
Local aHelpEng	:= {}
Local aHelpSpa	:= {}


U_xPutSx1( cPerg, "01","Data De","Data De","Data De","mv_ch1","D",8,0,0,"G","","","","",;
	"mv_par01"," ","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

U_xPutSx1( cPerg, "02","Data Ate","Data Ate","Data Ate","mv_ch2","D",8,0,0,"G","","","","",;
	"mv_par02"," ","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

U_xPutSx1( cPerg,"03","Fornec. de?","Fornec de?","Fornec de?","mv_ch3","C",6,0,0,"G",,"SA2A","","",;
	"MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

U_xPutSx1( cPerg,"04","Loja de?","Loja de?","Loja de?","mv_ch4","C",2,0,0,"G",,"","","",;
	"MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

U_xPutSx1( cPerg,"05","Fornec. ate?","Fornec ate?","Fornec ate?","mv_ch5","C",6,0,0,"G",,"SA2A","","",;
	"MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

U_xPutSx1( cPerg,"06","Loja ate?","Loja ate?","Loja ate?","mv_ch6","C",2,0,0,"G",,"","","",;
	"MV_PAR06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

U_xPutSx1( cPerg,"07","Filial De?","Filial De?","Filial De?","mv_ch7","C",4,0,0,"G",,"XM0","","",;
	"MV_PAR07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

U_xPutSx1( cPerg,"08","Filial Ate?","Filial Ate?","Filial Ate?","mv_ch8","C",4,0,0,"G",,"XM0","","",;
	"MV_PAR08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return

//---------------------------------------------------------
// Faz impressão de Entradas do periodo
//---------------------------------------------------------
Static Function ImpEnt(oReport,oEntrada)

Local cQuery := ""
Local oQuant
Local oTotal
Local oPeso
Local oDifer
Local oItens


cQuery := " SELECT  		"
cQuery += " 	D1_FILIAL,     "
cQuery += " 	D1_DOC,     "
cQuery += " 	D1_SERIE,   "
cQuery += " 	D1_FORNECE, "
cQuery += " 	D1_LOJA,    "
cQuery += " 	D1_DTDIGIT, "
cQuery += " 	D1_QUANT,   "
cQuery += " 	D1_VUNIT,   "
cQuery += " 	D1_TOTAL,   "
cQuery += " 	ZEJ_PESO,   "
cQuery += " 	ZEJ_DIFERE, "
cQuery += " 	ZEJ_NUMDEV, "
cQuery += " 	ZEJ_SERDEV, "
cQuery += " 	Z19_DENS  "
cQuery += " FROM " + RETSQLNAME("SD1") + " D1"
cQuery += " INNER JOIN " + RETSQLNAME("SB1") + " B1"
cQuery += " 	ON B1_FILIAL = '" + xFilial("SB1") + "'"
cQuery += " 	AND B1_COD   = D1_COD"
cQuery += " 	AND B1_XSPOT = 'S'"
cQuery += " 	AND B1.D_E_L_E_T_<> '*'"
cQuery += " LEFT JOIN " + RETSQLNAME("ZEJ") + " ZEJ"
cQuery += " 	ON ZEJ_FILIAL = D1_FILIAL"
cQuery += " 	AND ZEJ_NUM   = D1_DOC"
cQuery += " 	AND ZEJ_SERIE = D1_SERIE"
cQuery += " 	AND ZEJ_PRODUT = D1_COD"
cQuery += " 	AND ZEJ_FORNEC = D1_FORNECE"
cQuery += " 	AND ZEJ_LOJA   = D1_LOJA"
cQuery += " 	AND ZEJ.D_E_L_E_T_<> '*'"
cQuery += " LEFT JOIN " + RetSqlName("Z19") + " Z19"
cQuery += " 	ON  Z19.D_E_L_E_T_ <> '*'
cQuery += " 	AND Z19_FILIAL = D1_FILIAL
cQuery += "		AND Z19_TICKET = D1_XTICKET
cQuery += " WHERE D1.D_E_L_E_T_<> '*'"
cQuery += " 	AND D1_TIPO <> 'D'"
cQuery += " 	AND D1_FILIAL BETWEEN '" + xFilial("SD1",MV_PAR07) + "' AND '" + xFilial("SD1",MV_PAR08) + "' "
cQuery += " 	AND D1_DTDIGIT BETWEEN '" + dTos(mv_par01) + "' AND '" + dTos(mv_par02) + "'"
cQuery += " 	AND D1_FORNECE||D1_LOJA BETWEEN '" + mv_par03+mv_par04 + "' AND '" + mv_par05+mv_par06 + "'"

cQuery += " ORDER BY D1_FILIAL,D1_DOC,D1_SERIE"

cQuery := ChangeQuery(cQuery)

If Select("QSD1")>0
	QSD1->(DbCloseArea())
Endif

TcQuery cQuery New Alias "QSD1"


oReport:SkipLine()
oReport:SkipLine()

oReport:ThinLine()

oReport:PrintText("NOTAS FISCAIS DE ENTRADA ")

oReport:ThinLine()

oReport:SkipLine()
oReport:SkipLine()

While QSD1->(!EOF())

	//Se cancelar abandona o laco
	If oReport:Cancel()
		Exit
	EndIf

	oReport:IncMeter()

	oEntrada:Cell("D1_FILIAL"	):SetValue(QSD1->D1_FILIAL	)
	oEntrada:Cell("D1_DOC"		):SetValue(QSD1->D1_DOC		)
	oEntrada:Cell("D1_SERIE"	):SetValue(QSD1->D1_SERIE	)
	oEntrada:Cell("D1_FORNECE"	):SetValue(QSD1->D1_FORNECE	)
	oEntrada:Cell("D1_LOJA"		):SetValue(QSD1->D1_LOJA	)
	oEntrada:Cell("A2_NOME"		):SetValue(Posicione("SA2",1,xFilial("SA2")+QSD1->D1_FORNECE+QSD1->D1_LOJA,"A2_NOME"))
	oEntrada:Cell("D1_DTDIGIT"	):SetValue(dToc(stod(QSD1->D1_DTDIGIT))	)
	oEntrada:Cell("D1_QUANT"	):SetValue(QSD1->D1_QUANT	)
	oEntrada:Cell("D1_VUNIT"	):SetValue(QSD1->D1_VUNIT	)
	oEntrada:Cell("Z19_DENS"	):SetValue(QSD1->Z19_DENS  	)
	oEntrada:Cell("D1_TOTAL"	):SetValue(QSD1->D1_TOTAL	)
	oEntrada:Cell("ZEJ_PESO"	):SetValue(QSD1->ZEJ_PESO	)
	oEntrada:Cell("ZEJ_DIFERE"	):SetValue(QSD1->ZEJ_PESO - QSD1->D1_QUANT	)
	oEntrada:Cell("ZEJ_NUMDEV"	):SetValue(QSD1->ZEJ_NUMDEV	+"-"+QSD1->ZEJ_SERDEV )
	//oEntrada:Cell("ZEJ_SERDEV"	):SetValue(QSD1->ZEJ_SERDEV	)



	oEntrada:SetTotalInLine(.F.)

	oItens  := TRFunction():New(oEntrada:Cell("D1_DOC")		,,"COUNT",/*oBreak*/,,,,.F.,.F.,.F.)
	oQuant  := TRFunction():New(oEntrada:Cell("D1_QUANT")	,,"SUM"	 ,/*oBreak*/,,,,.F.,.F.,.F.)
	oTotal  := TRFunction():New(oEntrada:Cell("D1_TOTAL")   ,,"SUM"	 ,/*oBreak*/,,,,.F.,.F.,.F.)
	oPeso	:= TRFunction():New(oEntrada:Cell("ZEJ_PESO")	,,"SUM"	 ,/*oBreak*/,,,,.F.,.F.,.F.)
	oDifer	:= TRFunction():New(oEntrada:Cell("ZEJ_DIFERE")	,,"SUM"	 ,/*oBreak*/,,,,.F.,.F.,.F.)

	oItens:SetEndSection(.T.)
	oQuant:SetEndSection(.T.)
	oTotal:SetEndSection(.T.)
	oPeso:SetEndSection(.T.)
	oDifer:SetEndSection(.T.)

	oEntrada:Init()
	oEntrada:PrintLine()

	QSD1->(DbSkip())
EndDo

//Altero descricao do totalizador
oEntrada:SetTotalText("Totalizadores")
oEntrada:Finish()

Return


//---------------------------------------------------------
// Faz impressão de Entradas do periodo
//---------------------------------------------------------
Static Function ImpDev(oReport,oDevolucao)

Local cQuery := ""
Local oQuant
Local oTotal
Local oItens

cQuery := " SELECT			"
cQuery += " 	DISTINCT	"
cQuery += " 	D2_FILIAL,	"
cQuery += " 	D2_DOC,		"
cQuery += " 	D2_SERIE,   "
cQuery += " 	D2_ITEM,	"
cQuery += " 	ZEJ_FORNEC, "
cQuery += " 	ZEJ_LOJA,   "
cQuery += " 	D2_EMISSAO, "
cQuery += " 	D2_QUANT,   "
cQuery += " 	D2_PRCVEN,  "
cQuery += " 	D2_TOTAL,   "
cQuery += " 	Z19_DENS  	"
cQuery += " FROM " + RETSQLNAME("ZEJ") + " ZEJ"
cQuery += " INNER JOIN  " +RETSQLNAME("SD2") + " D2"
cQuery += " 	ON  D2_FILIAL   = ZEJ_FILIAL"
cQuery += " 	AND D2_DOC 		= ZEJ_NUMDEV"
cQuery += " 	AND D2_SERIE	= ZEJ_SERDEV"
cQuery += " 	AND D2_COD 		= ZEJ_PRODUT"
cQuery += " 	AND D2_CLIENTE  = ZEJ_FORNEC"
cQuery += " 	AND D2_LOJA 	= ZEJ_LOJA"
cQuery += " 	AND D2.D_E_L_E_T_<> '*'"
cQuery += " LEFT JOIN " + RetSqlName("Z19") + " Z19"
cQuery += " 	ON  Z19.D_E_L_E_T_ <> '*'
cQuery += " 	AND Z19_FILIAL = D2_FILIAL
cQuery += " 	AND Z19_TICKET = ZEJ_TICKET
cQuery += " WHERE ZEJ.D_E_L_E_T_<> '*'"
cQuery += " 	AND ZEJ_NUMDEV <> ' '"
cQuery += " 	AND ZEJ_FILIAL BETWEEN '" + xFilial("ZEJ",MV_PAR07) + "' AND '" + xFilial("ZEJ",MV_PAR08) + "' "
cQuery += " 	AND ZEJ_DATA BETWEEN '" + dTos(mv_par01) + "' AND '" + dTos(mv_par02) + "'"
cQuery += " 	AND (ZEJ_FORNEC||ZEJ_LOJA) BETWEEN '" + mv_par03+mv_par04 + "' AND '" + mv_par05+mv_par06 + "'"

cQuery += " ORDER BY D2_FILIAL,D2_DOC,D2_SERIE,D2_ITEM"

cQuery := ChangeQuery(cQuery)

If Select("QSD2")>0
	QSD2->(DbCloseArea())
Endif

TcQuery cQuery New Alias "QSD2"

oReport:SkipLine()
oReport:SkipLine()

oReport:ThinLine()

oReport:PrintText("DEVOLUÇÕES REALIZADAS")

oReport:ThinLine()

oReport:SkipLine()
oReport:SkipLine()

While QSD2->(!EOF())

	//Se cancelar abandona o laco
	If oReport:Cancel()
		Exit
	EndIf

	oReport:IncMeter()

	oDevolucao:Cell("D2_FILIAL"		):SetValue(QSD2->D2_FILIAL	)
	oDevolucao:Cell("D2_DOC"		):SetValue(QSD2->D2_DOC		)
	oDevolucao:Cell("D2_SERIE"		):SetValue(QSD2->D2_SERIE	)
	oDevolucao:Cell("D2_ITEM"		):SetValue(QSD2->D2_ITEM	)
	oDevolucao:Cell("ZEJ_FORNEC"	):SetValue(QSD2->ZEJ_FORNEC	)
	oDevolucao:Cell("ZEJ_LOJA"		):SetValue(QSD2->ZEJ_LOJA	)
	oDevolucao:Cell("A2_NOME"		):SetValue(Posicione("SA2",1,xFilial("SA2")+QSD2->ZEJ_FORNEC+QSD2->ZEJ_LOJA,"A2_NOME"))
	oDevolucao:Cell("D2_EMISSAO"	):SetValue(dtoc(stod(QSD2->D2_EMISSAO))	)
	oDevolucao:Cell("D2_QUANT"		):SetValue(QSD2->D2_QUANT	)
	oDevolucao:Cell("D2_PRCVEN"		):SetValue(QSD2->D2_PRCVEN	)
	oDevolucao:Cell("D2_TOTAL"		):SetValue(QSD2->D2_TOTAL	)


	oDevolucao:SetTotalInLine(.F.)

	oItens  := TRFunction():New(oDevolucao:Cell("D2_DOC")		,,"COUNT",/*oBreak*/,,,,.F.,.F.,.F.)
	oQuant  := TRFunction():New(oDevolucao:Cell("D2_QUANT")		,,"SUM"	 ,/*oBreak*/,,,,.F.,.F.,.F.)
	oTotal  := TRFunction():New(oDevolucao:Cell("D2_TOTAL")   	,,"SUM"	 ,/*oBreak*/,,,,.F.,.F.,.F.)


	oItens:SetEndSection(.T.)
	oQuant:SetEndSection(.T.)
	oTotal:SetEndSection(.T.)

	oDevolucao:Init()
	oDevolucao:PrintLine()

	QSD2->(DbSkip())
EndDo


//Altero descricao do totalizador
oDevolucao:SetTotalText("Totalizadores")
oDevolucao:Finish()

Return


//---------------------------------------------------------
// Faz impressão de Entradas do periodo
//---------------------------------------------------------
Static Function ImpComp(oReport,oComplementar)

Local cQuery := ""
Local oQuant
Local oTotal
Local oPeso
Local oDifer
Local oItens

cQuery := " SELECT  		"
cQuery += " 	D1_FILIAL,  "
cQuery += " 	D1_DOC,     "
cQuery += " 	D1_SERIE,   "
cQuery += " 	D1_FORNECE, "
cQuery += " 	D1_LOJA,    "
cQuery += " 	D1_DTDIGIT, "
cQuery += " 	D1_QUANT,   "
cQuery += " 	D1_VUNIT,   "
cQuery += " 	D1_TOTAL,   "
cQuery += " 	ZEJ_PESO,   "
cQuery += " 	ZEJ_DIFERE, "
cQuery += " 	ZEJ_PEDIDO, "
cQuery += " 	Z19_DENS  	"
cQuery += " FROM " + RETSQLNAME("SD1") + " D1"
cQuery += " INNER JOIN " + RETSQLNAME("SB1") + " B1"
cQuery += " 	ON B1_FILIAL = '" + xFilial("SB1") + "'"
cQuery += " 	AND B1_COD   = D1_COD"
cQuery += " 	AND B1_XSPOT = 'S'"
cQuery += " 	AND B1.D_E_L_E_T_<> '*'"
cQuery += " INNER JOIN " + RETSQLNAME("ZEJ") + " ZEJ"
cQuery += " 	ON ZEJ_FILIAL = D1_FILIAL"
cQuery += " 	AND ZEJ_NUM   = D1_DOC"
cQuery += " 	AND ZEJ_SERIE = D1_SERIE"
cQuery += " 	AND ZEJ_PRODUT = D1_COD"
cQuery += " 	AND ZEJ_FORNEC = D1_FORNECE"
cQuery += " 	AND ZEJ_LOJA   = D1_LOJA"
cQuery += " 	AND ZEJ_PEDIDO <> ' '"
//cQuery += " 	AND ZEJ.D_E_L_E_T_ <> '*'
cQuery += " LEFT JOIN " + RetSqlName("Z19") + " Z19"
cQuery += " 	ON  Z19.D_E_L_E_T_ <> '*'
cQuery += " 	AND Z19_FILIAL = D1_FILIAL
cQuery += " 	AND Z19_TICKET = d1_xTICKET
cQuery += " WHERE D1.D_E_L_E_T_<> '*'"
cQuery += " 	AND D1_TIPO <> 'D'"
cQuery += " 	AND D1_FILIAL BETWEEN '" + xFilial("SD1",MV_PAR07) + "' AND '" + xFilial("SD1",MV_PAR08) + "' "
cQuery += " 	AND D1_DTDIGIT BETWEEN '" + dTos(mv_par01) + "' AND '" + dTos(mv_par02) + "'"
cQuery += " 	AND D1_FORNECE||D1_LOJA BETWEEN '" + mv_par03+mv_par04 + "' AND '" + mv_par05+mv_par06 + "'"

cQuery += " ORDER BY D1_FILIAL,D1_DOC,D1_SERIE"

cQuery := ChangeQuery(cQuery)

If Select("QSD1")>0
	QSD1->(DbCloseArea())
Endif

TcQuery cQuery New Alias "QSD1"


oReport:SkipLine()
oReport:SkipLine()

oReport:ThinLine()

oReport:PrintText("COMPLEMENTAR REALIZADA")

oReport:ThinLine()

oReport:SkipLine()
oReport:SkipLine()

While QSD1->(!EOF())

	//Se cancelar abandona o laco
	If oReport:Cancel()
		Exit
	EndIf

	oReport:IncMeter()

	oComplementar:Cell("D1_FILIAL"	):SetValue(QSD1->D1_FILIAL	)
	oComplementar:Cell("D1_DOC"		):SetValue(QSD1->D1_DOC		)
	oComplementar:Cell("D1_SERIE"	):SetValue(QSD1->D1_SERIE	)
	oComplementar:Cell("D1_FORNECE"	):SetValue(QSD1->D1_FORNECE	)
	oComplementar:Cell("D1_LOJA"	):SetValue(QSD1->D1_LOJA	)
	oComplementar:Cell("A2_NOME"	):SetValue(Posicione("SA2",1,xFilial("SA2")+QSD1->D1_FORNECE+QSD1->D1_LOJA,"A2_NOME"))
	oComplementar:Cell("D1_DTDIGIT"	):SetValue(dtoc(stod(QSD1->D1_DTDIGIT))	)
	oComplementar:Cell("D1_QUANT"	):SetValue(QSD1->D1_QUANT	)
	oComplementar:Cell("D1_VUNIT"	):SetValue(QSD1->D1_VUNIT	)
	oComplementar:Cell("D1_TOTAL"	):SetValue(QSD1->D1_TOTAL	)
	oComplementar:Cell("ZEJ_PESO"	):SetValue(QSD1->ZEJ_PESO	)
	oComplementar:Cell("ZEJ_DIFERE"	):SetValue(QSD1->ZEJ_DIFERE*(-1) )
	oComplementar:Cell("ZEJ_PEDIDO"	):SetValue(QSD1->ZEJ_PEDIDO )


	oComplementar:SetTotalInLine(.F.)

	oItens  := TRFunction():New(oComplementar:Cell("D1_DOC")		,,"COUNT",/*oBreak*/,,,,.F.,.F.,.F.)
	oQuant  := TRFunction():New(oComplementar:Cell("D1_QUANT")		,,"SUM"	 ,/*oBreak*/,,,,.F.,.F.,.F.)
	oTotal  := TRFunction():New(oComplementar:Cell("D1_TOTAL")  	,,"SUM"	 ,/*oBreak*/,,,,.F.,.F.,.F.)
	oPeso	:= TRFunction():New(oComplementar:Cell("ZEJ_PESO")		,,"SUM"	 ,/*oBreak*/,,,,.F.,.F.,.F.)
	oDifer	:= TRFunction():New(oComplementar:Cell("ZEJ_DIFERE")	,,"SUM"	 ,/*oBreak*/,,,,.F.,.F.,.F.)

	oItens:SetEndSection(.T.)
	oQuant:SetEndSection(.T.)
	oTotal:SetEndSection(.T.)
	oPeso:SetEndSection(.T.)
	oDifer:SetEndSection(.T.)

	oComplementar:Init()
	oComplementar:PrintLine()

	QSD1->(DbSkip())
EndDo

//Altero descricao do totalizador
oComplementar:SetTotalText("Totalizadores")
oComplementar:Finish()

Return()