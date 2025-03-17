#include "protheus.ch" 
#include "topconn.ch" 

/*/{Protheus.doc} RFATR001
Relatório de Apuração de Contratos
@author TOTVS
@since 08/05/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

/***********************/
User Function RFATR001()
/***********************/

Local oReport

oReport:= ReportDef()
oReport:PrintDialog()

Return

/**************************/
Static Function ReportDef()
/**************************/

Local oReport
Local oSection1, oSection2, oSection3, oSection4, oSection5, oSection6, oSection7, oSection8
Local cPerg 	:= "RFATR001"

Local cTitle    := "Apuração de Contratos"

oReport:= TReport():New("RFATR001",cTitle,"RFATR001",{|oReport| PrintReport(oReport,oSection1,oSection2,oSection3,oSection4,oSection5,oSection6,;
						oSection7,oSection8)},"Este relatório apresenta dados de Apuração de Contratos.")
oReport:SetLandscape()   
oReport:HideParamPage()
oReport:SetUseGC(.F.) //Desabilita o botão <Gestao Corporativa> do relatório
oReport:DisableOrientation()

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Ajusta grupo de perguntas (RESTR001)                           ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

U_xPutSx1(cPerg,"01","Dt Movimentacao De	?","","","mv_ch1","D",08,0,0,"G","","","","","mv_par01","","","","","","","","","","","","","","","","",{"",""},{"",""},{"",""})
U_xPutSx1(cPerg,"02","Dt Movimentacao Ate	?","","","mv_ch2","D",08,0,0,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",{"",""},{"",""},{"",""})
U_xPutSx1(cPerg,"03","Cliente/Fornecedor	?","","","mv_ch3","C",14,0,0,"G","","","","","mv_par03","","","","","","","","","","","","","","","","",{"",""},{"",""},{"",""})
U_xPutSx1(cPerg,"04","Contrato De			?","","","mv_ch4","C",06,0,0,"G","","Z09","","","mv_par04","","","","","","","","","","","","","","","","",{"",""},{"",""},{"",""})
U_xPutSx1(cPerg,"05","Contrato Ate			?","","","mv_ch5","C",06,0,0,"G","","Z09","","","mv_par05","","","","","","","","","","","","","","","","",{"",""},{"",""},{"",""})
U_xPutSx1(cPerg,"06","Tipo Movimento       	?","","","mv_ch6","C",01,0,1,"C","","","","","mv_par06","Credito","","","","Debito","","","Ambos","","","","","","","","",{"",""},{"",""},{"",""})
U_xPutSx1(cPerg,"07","Tipo Aplicacao       	?","","","mv_ch7","C",01,0,1,"C","","","","","mv_par07","Eventual","","","","Apuracao","","","Faturamento","","","Ambos","","","","","",{"",""},{"",""},{"",""})
U_xPutSx1(cPerg,"08","Considera apuracao   	?","","","mv_ch8","C",01,0,1,"C","","","","","mv_par08","Sim","","","","Nao","","","Ambas","","","","","","","","",{"",""},{"",""},{"",""})

Pergunte(oReport:GetParam(),.F.)

//Seção 1 - Cliente
oSection1 := TRSection():New(oReport,"Cliente",{"QRYCLI"})
oSection1:SetHeaderPage(.F.)
oSection1:SetHeaderSection(.T.)
oSection1:SetPageBreak(.T.)

TRCell():New(oSection1,"Z13_CLIFOR"	,"QRYCLI", "CODIGO",			PesqPict("Z13","Z13_CLIFOR"),	TamSX3("Z13_CLIFOR")[1]+1)
TRCell():New(oSection1,"Z13_LOJA"	,"QRYCLI", "LOJA", 				PesqPict("Z13","Z13_LOJA"),		TamSX3("Z13_LOJA")[1]+1)
TRCell():New(oSection1,"Z13_NOME"	,"QRYCLI", "NOME", 				PesqPict("Z13","Z13_NOME"),		TamSX3("Z13_NOME")[1]+1)
TRCell():New(oSection1,"Z13_CGC"	,"QRYCLI", "CGC",				PesqPict("Z13","Z13_CGC"),		TamSX3("Z13_CGC")[1]+5)

//Seção 2 - Contratos
oSection2 := TRSection():New(oReport,"Contratos",{"QRYCTR"})
oSection2:SetHeaderPage(.F.)
oSection2:SetHeaderSection(.T.)

TRCell():New(oSection2,"Z13_CONTRA"	,"QRYCTR", "CONTRATO", 			PesqPict("Z13","Z13_CONTRA"),	TamSX3("Z13_CONTRA")[1]+1)

//Seção 3 - Movimentos
oSection3 := TRSection():New(oReport,"Movimentos",{"QRYMOV"})
oSection3:SetHeaderPage(.F.)
oSection3:SetHeaderSection(.T.)

TRCell():New(oSection3,"Z13_DATA"	,"QRYMOV", "DATA",				PesqPict("Z13","Z13_DATA"),		TamSX3("Z13_DATA")[1]+2)
TRCell():New(oSection3,"Z13_TPMOVI"	,"QRYMOV", "TP MOVIMENTO", 		PesqPict("Z13","Z13_TPMOVI"),	TamSX3("Z13_TPMOVI")[1]+1,,,,,,,,,,,.T.)
TRCell():New(oSection3,"Z13_PEDIDO"	,"QRYMOV", "PEDIDO VENDA", 		PesqPict("Z13","Z13_PEDIDO"),	TamSX3("Z13_PEDIDO")[1]+1)
TRCell():New(oSection3,"Z13_ITEMPV"	,"QRYMOV", "ITEM PED VENDA",	PesqPict("Z13","Z13_ITEMPV"),	TamSX3("Z13_ITEMPV")[1]+1)
TRCell():New(oSection3,"Z13_VLRTAB"	,"QRYMOV", "VLR TABELA",		PesqPict("Z13","Z13_VLRTAB"),	TamSX3("Z13_VLRTAB")[1]+1)
TRCell():New(oSection3,"Z13_ICMSST"	,"QRYMOV", "VLR ICMS ST",		PesqPict("Z13","Z13_ICMSST"),	TamSX3("Z13_ICMSST")[1]+1)
TRCell():New(oSection3,"Z13_PIS"	,"QRYMOV", "VLR PIS",			PesqPict("Z13","Z13_PIS"),		TamSX3("Z13_PIS")[1]+1)
TRCell():New(oSection3,"Z13_COFINS"	,"QRYMOV", "VLR COFINS",		PesqPict("Z13","Z13_COFINS"),	TamSX3("Z13_COFINS")[1]+1)
TRCell():New(oSection3,"Z13_ICMS"	,"QRYMOV", "VLR ICMS",			PesqPict("Z13","Z13_ICMS"),		TamSX3("Z13_ICMS")[1]+1)
TRCell():New(oSection3,"Z13_VLRNET"	,"QRYMOV", "VLR NET",			PesqPict("Z13","Z13_VLRNET"),	TamSX3("Z13_VLRNET")[1]+1)
TRCell():New(oSection3,"Z13_BSCALC"	,"QRYMOV", "BASE CALCULO",		PesqPict("Z13","Z13_BSCALC"),	TamSX3("Z13_BSCALC")[1]+1)
TRCell():New(oSection3,"Z13_TITFIN"	,"QRYMOV", "TP TITULO",			PesqPict("Z13","Z13_TITFIN"),	TamSX3("Z13_TITFIN")[1]+1)
TRCell():New(oSection3,"Z13_NATTIT"	,"QRYMOV", "NATUREZA TITULO",	PesqPict("Z13","Z13_NATTIT"),	TamSX3("Z13_NATTIT")[1]+1)

//Seção 4 - Itens Movimento
oSection4 := TRSection():New(oReport,"Itens Movimento",{"QRYITMOV"})
oSection4:SetHeaderPage(.F.)
oSection4:SetHeaderSection(.T.)

TRCell():New(oSection4,"Z14_ITCLAU"	,"QRYITMOV", "IT CLAU CTR",		PesqPict("Z14","Z14_ITCLAU"),	TamSX3("Z14_ITCLAU")[1]+3)
TRCell():New(oSection4,"Z14_DESCCL"	,"QRYITMOV", "CLAUSULA", 		PesqPict("Z14","Z14_DESCCL"),	TamSX3("Z14_DESCCL")[1]+1)
TRCell():New(oSection4,"Z14_DESCPE"	,"QRYITMOV", "PERIODO", 		PesqPict("Z14","Z14_DESCPE"),	TamSX3("Z14_DESCPE")[1]+1)
TRCell():New(oSection4,"Z14_APLICA"	,"QRYITMOV", "TP APLICACAO",	PesqPict("Z14","Z14_APLICA"),	TamSX3("Z14_APLICA")[1]+1)
TRCell():New(oSection4,"Z14_DESCGR"	,"QRYITMOV", "GRP PRODUTO", 	PesqPict("Z14","Z14_DESCGR"),	TamSX3("Z14_DESCGR")[1]+1)
TRCell():New(oSection4,"Z14_DESCPR"	,"QRYITMOV", "PRODUTO", 		PesqPict("Z14","Z14_DESCPR"),	TamSX3("Z14_DESCPR")[1]+1)
TRCell():New(oSection4,"Z14_FXINIC"	,"QRYITMOV", "FX INICIAL", 		PesqPict("Z14","Z14_FXINIC"),	TamSX3("Z14_FXINIC")[1]+1)
TRCell():New(oSection4,"Z14_FXFINA"	,"QRYITMOV", "FX FINAL", 		PesqPict("Z14","Z14_FXFINA"),	TamSX3("Z14_FXFINA")[1]+1)
TRCell():New(oSection4,"Z14_TPFAIX"	,"QRYITMOV", "TP FAIXA", 		PesqPict("Z14","Z14_TPFAIX"),	TamSX3("Z14_TPFAIX")[1]+1)
TRCell():New(oSection4,"Z14_VLRAPL"	,"QRYITMOV", "VLR APLICACAO",	PesqPict("Z14","Z14_VLRAPL"),	TamSX3("Z14_VLRAPL")[1]+1)
TRCell():New(oSection4,"Z14_TPVLRA"	,"QRYITMOV", "TP VLR APLICACAO",PesqPict("Z14","Z14_TPVLRA"),	TamSX3("Z14_TPVLRA")[1]+1)
TRCell():New(oSection4,"Z14_VLRPAR"	,"QRYITMOV", "VLR PARTICIPACAO",PesqPict("Z14","Z14_VLRPAR"),	TamSX3("Z14_VLRPAR")[1]+1)
TRCell():New(oSection4,"Z14_APURAD"	,"QRYITMOV", "APURADO",			PesqPict("Z14","Z14_APURAD"),	TamSX3("Z14_APURAD")[1]+1)

//Seção 5 - Títulos
oSection5 := TRSection():New(oReport,"Titulos",{"QRYTIT"})
oSection5:SetHeaderPage(.F.)
oSection5:SetHeaderSection(.T.)

TRCell():New(oSection5,"TIPTIT"		,"QRYTIT", 	"TP TITULO",		"@!",							8)
TRCell():New(oSection5,"TIPO"		,"QRYTIT", 	"TIPO",				PesqPict("SE1","E1_TIPO"),		TamSX3("E1_TIPO")[1]+1)
TRCell():New(oSection5,"PREFIXO"	,"QRYTIT", 	"PREFIXO", 			PesqPict("SE1","E1_PREFIXO"),	TamSX3("E1_PREFIXO")[1]+1)
TRCell():New(oSection5,"NUMTIT"		,"QRYTIT", 	"NUMERO", 			PesqPict("SE1","E1_NUM"),		TamSX3("E1_NUM")[1]+1)
TRCell():New(oSection5,"PARCELA"	,"QRYTIT", 	"PARCELA", 			PesqPict("SE1","E1_PARCELA"),	TamSX3("E1_PARCELA")[1]+1)
TRCell():New(oSection5,"CLIFOR"		,"QRYTIT", 	"CLI/FOR", 			PesqPict("SE1","E1_CLIENTE"),	TamSX3("E1_CLIENTE")[1]+1)
TRCell():New(oSection5,"LOJA"		,"QRYTIT", 	"LOJA", 			PesqPict("SE1","E1_LOJA"),		TamSX3("E1_LOJA")[1]+1)
TRCell():New(oSection5,"NOMCLIFOR"	,"QRYTIT", 	"NOME", 			PesqPict("SE1","E1_NOMCLI"),	TamSX3("E1_NOMCLI")[1]+1)
TRCell():New(oSection5,"EMISSAO"	,"QRYTIT", 	"EMISSAO", 			PesqPict("SE1","E1_EMISSAO"),	TamSX3("E1_EMISSAO")[1]+2)
TRCell():New(oSection5,"VENCTO"		,"QRYTIT", 	"VENCTO", 			PesqPict("SE1","E1_VENCTO"),	TamSX3("E1_VENCTO")[1]+2)
TRCell():New(oSection5,"VALOR"		,"QRYTIT", 	"VALOR", 			PesqPict("SE1","E1_VALOR"),		TamSX3("E1_VALOR")[1]+1)
TRCell():New(oSection5,"SALDO"		,"QRYTIT", 	"SALDO", 			PesqPict("SE1","E1_SALDO"),		TamSX3("E1_SALDO")[1]+1)

//Seção 6 - Apuração
oSection6 := TRSection():New(oReport,"Apuração",{"QRYAPUR"})
oSection6:SetHeaderPage(.F.)
oSection6:SetHeaderSection(.T.)

TRCell():New(oSection6,"Z21_DATA"	,"QRYAPUR", 	"DATA", 		PesqPict("Z21","Z21_DATA"),		TamSX3("Z21_DATA")[1]+2)
TRCell():New(oSection6,"Z21_TITFIN"	,"QRYAPUR", 	"TP TITULO", 	PesqPict("Z21","Z21_TITFIN"),	TamSX3("Z21_TITFIN")[1]+1)
TRCell():New(oSection6,"Z21_NATTIT"	,"QRYAPUR", 	"NATUREZA", 	PesqPict("Z21","Z21_NATTIT"),	TamSX3("Z21_NATTIT")[1]+1)
TRCell():New(oSection6,"Z21_VLRTIT"	,"QRYAPUR", 	"VLR TITULO", 	PesqPict("Z21","Z21_VLRTIT"),	TamSX3("Z21_VLRTIT")[1]+1)

//Seção 7 - Detalhes Apuração
oSection7 := TRSection():New(oReport,"Detalhes Apuração",{"QRYDETAPUR"})
oSection7:SetHeaderPage(.F.)
oSection7:SetHeaderSection(.T.)

TRCell():New(oSection7,"Z22_CODMOV"	,"QRYDETAPUR", 	"MOVIMENTACAO",		PesqPict("Z22","Z22_CODMOV"),	TamSX3("Z22_CODMOV")[1]+1)
TRCell():New(oSection7,"Z22_ITMOV"	,"QRYDETAPUR", 	"IT MOVIMENTACAO",	PesqPict("Z22","Z22_ITMOV"),	TamSX3("Z22_ITMOV")[1]+1)
TRCell():New(oSection7,"Z22_DESCCL"	,"QRYDETAPUR", 	"CLAUSULA", 		PesqPict("Z22","Z22_DESCCL"),	TamSX3("Z22_DESCCL")[1]+1)
TRCell():New(oSection7,"Z22_VLRPAR"	,"QRYDETAPUR", 	"VLR PARTICIPACAO",	PesqPict("Z22","Z22_VLRPAR"),	TamSX3("Z22_VLRPAR")[1]+1)

//Seção 8 - Títulos
oSection8 := TRSection():New(oReport,"Titulos",{"QRYTITAPUR"})
oSection8:SetHeaderPage(.F.)
oSection8:SetHeaderSection(.T.)

TRCell():New(oSection8,"TIPTIT"		,"QRYTITAPUR", 	"TP TITULO",	"@!",							8)
TRCell():New(oSection8,"TIPO"		,"QRYTITAPUR", 	"TIPO",			PesqPict("SE1","E1_TIPO"),		TamSX3("E1_TIPO")[1]+1)
TRCell():New(oSection8,"PREFIXO"	,"QRYTITAPUR", 	"PREFIXO", 		PesqPict("SE1","E1_PREFIXO"),	TamSX3("E1_PREFIXO")[1]+1)
TRCell():New(oSection8,"NUMTIT"		,"QRYTITAPUR", 	"NUMERO", 		PesqPict("SE1","E1_NUM"),		TamSX3("E1_NUM")[1]+1)
TRCell():New(oSection8,"PARCELA"	,"QRYTITAPUR", 	"PARCELA", 		PesqPict("SE1","E1_PARCELA"),	TamSX3("E1_PARCELA")[1]+1)
TRCell():New(oSection8,"CLIFOR"		,"QRYTITAPUR", 	"CLI/FOR", 		PesqPict("SE1","E1_CLIENTE"),	TamSX3("E1_CLIENTE")[1]+1)
TRCell():New(oSection8,"LOJA"		,"QRYTITAPUR", 	"LOJA", 		PesqPict("SE1","E1_LOJA"),		TamSX3("E1_LOJA")[1]+1)
TRCell():New(oSection8,"NOMCLIFOR"	,"QRYTITAPUR", 	"NOME", 		PesqPict("SE1","E1_NOMCLI"),	TamSX3("E1_NOMCLI")[1]+1)
TRCell():New(oSection8,"EMISSAO"	,"QRYTITAPUR", 	"EMISSAO", 		PesqPict("SE1","E1_EMISSAO"),	TamSX3("E1_EMISSAO")[1]+2)
TRCell():New(oSection8,"VENCTO"		,"QRYTITAPUR", 	"VENCTO", 		PesqPict("SE1","E1_VENCTO"),	TamSX3("E1_VENCTO")[1]+2)
TRCell():New(oSection8,"VALOR"		,"QRYTITAPUR", 	"VALOR", 		PesqPict("SE1","E1_VALOR"),		TamSX3("E1_VALOR")[1]+1)
TRCell():New(oSection8,"SALDO"		,"QRYTITAPUR", 	"SALDO", 		PesqPict("SE1","E1_SALDO"),		TamSX3("E1_SALDO")[1]+1)

Return(oReport)   

/*******************************************************************************************************************/
Static Function PrintReport(oReport,oSection1,oSection2,oSection3,oSection4,oSection5,oSection6,oSection7,oSection8)
/*******************************************************************************************************************/

Local cQry 	:= ""
Local cQry2	:= ""
Local cQry3	:= ""
Local cQry4	:= ""
Local cQry5	:= ""
Local cQry6	:= ""
Local cQry7	:= ""
Local cQry8	:= ""

Local nCont	:= 0
Local nAux	:= 0

If Select("QRYCLI") > 0
	QRYCLI->(DbCloseArea())
EndIf     

cQry := " SELECT DISTINCT Z13.Z13_CLIFOR, Z13.Z13_LOJA, Z13.Z13_NOME, Z13.Z13_CGC"
cQry += " FROM "+RetSqlName("Z13")+" Z13, "+RetSqlName("Z14")+" Z14"
cQry += " WHERE Z13.D_E_L_E_T_	<> '*'"
cQry += " AND Z14.D_E_L_E_T_	<> '*'"
cQry += " AND Z13.Z13_FILIAL	= '"+xFilial("Z13")+"'"
cQry += " AND Z14.Z14_FILIAL	= '"+xFilial("Z14")+"'"
cQry += " AND Z13.Z13_CODIGO	= Z14.Z14_CODIGO"
cQry += " AND Z13.Z13_DATA		BETWEEN '"+DToS(MV_PAR01)+"' AND '"+DToS(MV_PAR02)+"'"

If !Empty(MV_PAR03)
	cQry += " AND Z13.Z13_CGC		= '"+MV_PAR03+"'"
Endif

cQry += " AND Z13.Z13_CONTRA	BETWEEN '"+MV_PAR04+"' AND '"+MV_PAR05+"'"

If MV_PAR06 == 1 //Crédito
	cQry += " AND Z13.Z13_TPMOVI	= 'C'"
ElseIf MV_PAR06 == 2 //Débito
	cQry += " AND Z13.Z13_TPMOVI	= 'D'"
Endif

If MV_PAR07 == 1 //Eventual
	cQry += " AND Z14.Z14_APLICA	= 'E'"
ElseIf MV_PAR07 == 2 //Apuração
	cQry += " AND Z14.Z14_APLICA	= 'A'"
ElseIf MV_PAR07 == 3 //Faturamento
	cQry += " AND Z14.Z14_APLICA	= 'F'"
Endif

If MV_PAR08 == 1 //Sim
	cQry += " AND Z14.Z14_APURAD	= 'S'"
ElseIf MV_PAR08 == 2 //Não
	cQry += " AND Z14.Z14_APURAD	<> 'S'"
Endif

cQry += " ORDER BY 1"

cQry := ChangeQuery(cQry)
//MemoWrite("c:\temp\RFATR001_QRYCLI.txt",cQry)
TcQuery cQry New Alias "QRYCLI" 

QRYCLI->(dbEval({|| nCont++}))
QRYCLI->(dbGoTop())

oReport:SetMeter(nCont)	

While !oReport:Cancel() .And. QRYCLI->(!EOF())
	
	oReport:IncMeter()
	
	If oReport:Cancel()
		Exit
	EndIf    
	
	nAux++
	
	oSection1:Init()

	oReport:PrintText("CLIENTE",,10) 
	If nAux > 1
		oReport:SkipLine()
	Endif

	oSection1:Cell("Z13_CLIFOR"):SetValue(QRYCLI->Z13_CLIFOR)
	oSection1:Cell("Z13_LOJA"):SetValue(QRYCLI->Z13_LOJA)
	oSection1:Cell("Z13_NOME"):SetValue(QRYCLI->Z13_NOME)
	oSection1:Cell("Z13_CGC"):SetValue(QRYCLI->Z13_CGC)

	oSection1:PrintLine()

	oSection2:Init()

	If Select("QRYCTR") > 0
		QRYCTR->(DbCloseArea())
	EndIf     

	cQry2 := " SELECT DISTINCT Z13.Z13_CONTRA"
	cQry2 += " FROM "+RetSqlName("Z13")+" Z13, "+RetSqlName("Z14")+" Z14"
	cQry2 += " WHERE Z13.D_E_L_E_T_	<> '*'"
	cQry2 += " AND Z14.D_E_L_E_T_	<> '*'"
	cQry2 += " AND Z13.Z13_FILIAL	= '"+xFilial("Z13")+"'"
	cQry2 += " AND Z14.Z14_FILIAL	= '"+xFilial("Z14")+"'"
	cQry2 += " AND Z13.Z13_CODIGO	= Z14.Z14_CODIGO"
	cQry2 += " AND Z13.Z13_DATA		BETWEEN '"+DToS(MV_PAR01)+"' AND '"+DToS(MV_PAR02)+"'"
	cQry2 += " AND Z13.Z13_CGC		= '"+QRYCLI->Z13_CGC+"'"
	
	cQry2 += " AND Z13.Z13_CONTRA	BETWEEN '"+MV_PAR04+"' AND '"+MV_PAR05+"'"
	
	If MV_PAR06 == 1 //Crédito
		cQry2 += " AND Z13.Z13_TPMOVI	= 'C'"
	ElseIf MV_PAR06 == 2 //Débito
		cQry2 += " AND Z13.Z13_TPMOVI	= 'D'"
	Endif
	
	If MV_PAR07 == 1 //Eventual
		cQry2 += " AND Z14.Z14_APLICA	= 'E'"
	ElseIf MV_PAR07 == 2 //Apuração
		cQry2 += " AND Z14.Z14_APLICA	= 'A'"
	ElseIf MV_PAR07 == 3 //Faturamento
		cQry2 += " AND Z14.Z14_APLICA	= 'F'"
	Endif
	
	If MV_PAR08 == 1 //Sim
		cQry2 += " AND Z14.Z14_APURAD	= 'S'"
	ElseIf MV_PAR08 == 2 //Não
		cQry2 += " AND Z14.Z14_APURAD	<> 'S'"
	Endif
	
	cQry2 += " ORDER BY 1"

	cQry2 := ChangeQuery(cQry2)
	//MemoWrite("c:\temp\RFATR001_QRYCTR.txt",cQry2)
	TcQuery cQry2 New Alias "QRYCTR" 

	While !oReport:Cancel() .And. QRYCTR->(!EOF())
		
		If oReport:Cancel()
			Exit
		EndIf    

		oSection2:Cell("Z13_CONTRA"):SetValue(QRYCTR->Z13_CONTRA)
	
		oSection2:PrintLine()

		If Select("QRYMOV") > 0
			QRYMOV->(DbCloseArea())
		EndIf     

		cQry3 := " SELECT DISTINCT Z13.Z13_CODIGO, Z13.Z13_DATA, Z13.Z13_TPMOVI, Z13.Z13_PEDIDO, Z13.Z13_ITEMPV, Z13.Z13_VLRTAB, Z13.Z13_ICMSST, Z13.Z13_PIS,"
		cQry3 += "  Z13.Z13_COFINS, Z13.Z13_ICMS, Z13.Z13_VLRNET, Z13.Z13_BSCALC, Z13.Z13_TITFIN, Z13.Z13_NATTIT"
		cQry3 += " FROM "+RetSqlName("Z13")+" Z13, "+RetSqlName("Z14")+" Z14"
		cQry3 += " WHERE Z13.D_E_L_E_T_	<> '*'"
		cQry3 += " AND Z14.D_E_L_E_T_	<> '*'"
		cQry3 += " AND Z13.Z13_FILIAL	= '"+xFilial("Z13")+"'"
		cQry3 += " AND Z14.Z14_FILIAL	= '"+xFilial("Z14")+"'"
		cQry3 += " AND Z13.Z13_CODIGO	= Z14.Z14_CODIGO"
		cQry3 += " AND Z13.Z13_DATA		BETWEEN '"+DToS(MV_PAR01)+"' AND '"+DToS(MV_PAR02)+"'"
		cQry3 += " AND Z13.Z13_CGC		= '"+QRYCLI->Z13_CGC+"'"
		cQry3 += " AND Z13.Z13_CONTRA	= '"+QRYCTR->Z13_CONTRA+"'"
		
		If MV_PAR06 == 1 //Crédito
			cQry3 += " AND Z13.Z13_TPMOVI	= 'C'"
		ElseIf MV_PAR06 == 2 //Débito
			cQry3 += " AND Z13.Z13_TPMOVI	= 'D'"
		Endif
		
		If MV_PAR07 == 1 //Eventual
			cQry3 += " AND Z14.Z14_APLICA	= 'E'"
		ElseIf MV_PAR07 == 2 //Apuração
			cQry3 += " AND Z14.Z14_APLICA	= 'A'"
		ElseIf MV_PAR07 == 3 //Faturamento
			cQry3 += " AND Z14.Z14_APLICA	= 'F'"
		Endif
		
		If MV_PAR08 == 1 //Sim
			cQry3 += " AND Z14.Z14_APURAD	= 'S'"
		ElseIf MV_PAR08 == 2 //Não
			cQry3 += " AND Z14.Z14_APURAD	<> 'S'"
		Endif
		
		cQry3 += " ORDER BY 1"
	
		cQry3 := ChangeQuery(cQry3)
		//MemoWrite("c:\temp\RFATR001_QRYMOV.txt",cQry3)
		TcQuery cQry3 New Alias "QRYMOV"
		
		If QRYMOV->(!EOF())
			oReport:SkipLine()
			oReport:PrintText("MOVIMENTACAO")
		Endif		 

		While !oReport:Cancel() .And. QRYMOV->(!EOF())
			
			If oReport:Cancel()
				Exit
			EndIf    

			oSection3:Init()

			oSection3:Cell("Z13_DATA"):SetValue(DToC(SToD(QRYMOV->Z13_DATA)))
			
			oSection3:Cell("Z13_TPMOVI"):SetValue(IIF(QRYMOV->Z13_TPMOVI == "C","CREDITO","DEBITO"))
			If QRYMOV->Z13_TPMOVI == "C"
				oSection3:Cell("Z13_TPMOVI"):SetClrFore(CLR_GREEN) //Cor da fonte
			Else
				oSection3:Cell("Z13_TPMOVI"):SetClrFore(CLR_RED) //Cor da fonte
			Endif
			
			oSection3:Cell("Z13_PEDIDO"):SetValue(QRYMOV->Z13_PEDIDO)
			oSection3:Cell("Z13_ITEMPV"):SetValue(QRYMOV->Z13_ITEMPV)
			oSection3:Cell("Z13_VLRTAB"):SetValue(QRYMOV->Z13_VLRTAB)
			oSection3:Cell("Z13_ICMSST"):SetValue(QRYMOV->Z13_ICMSST)
			oSection3:Cell("Z13_PIS"):SetValue(QRYMOV->Z13_PIS)
			oSection3:Cell("Z13_COFINS"):SetValue(QRYMOV->Z13_COFINS)
			oSection3:Cell("Z13_ICMS"):SetValue(QRYMOV->Z13_ICMS)
			oSection3:Cell("Z13_VLRNET"):SetValue(QRYMOV->Z13_VLRNET)
			oSection3:Cell("Z13_BSCALC"):SetValue(IIF(QRYMOV->Z13_BSCALC == "L","LIQUIDA",IIF(QRYMOV->Z13_BSCALC == "B","BRUTA","BRUTA S/ ST")))
			oSection3:Cell("Z13_TITFIN"):SetValue(IIF(QRYMOV->Z13_TITFIN == "A","A PAGAR","NCC"))
			oSection3:Cell("Z13_NATTIT"):SetValue(Posicione("SED",1,xFilial("SED")+QRYMOV->Z13_NATTIT,"ED_DESCRIC"))
		
			oSection3:PrintLine()

			oSection4:Init()

			If Select("QRYITMOV") > 0
				QRYITMOV->(DbCloseArea())
			EndIf     

			cQry4 := " SELECT Z14.Z14_ITCLAU, Z14.Z14_DESCCL, Z14.Z14_DESCPE, Z14.Z14_APLICA, Z14.Z14_DESCGR, Z14.Z14_DESCPR, Z14.Z14_FXINIC,"
			cQry4 += " Z14.Z14_FXFINA, Z14.Z14_TPFAIX, Z14.Z14_VLRAPL, Z14.Z14_TPVLRA, Z14.Z14_VLRPAR, Z14.Z14_APURAD"
			cQry4 += " FROM "+RetSqlName("Z14")+" Z14"
			cQry4 += " WHERE Z14.D_E_L_E_T_	<> '*'"
			cQry4 += " AND Z14.Z14_FILIAL	= '"+xFilial("Z14")+"'"
			cQry4 += " AND Z14.Z14_CODIGO	= '"+QRYMOV->Z13_CODIGO+"'"
			
			cQry4 := ChangeQuery(cQry4)
			//MemoWrite("c:\temp\RFATE026_QRYITMOV.txt",cQry4)
			TcQuery cQry4 New Alias "QRYITMOV"

			While !oReport:Cancel() .And. QRYITMOV->(!EOF())
				
				If oReport:Cancel()
					Exit
				EndIf    
	
				oSection4:Cell("Z14_ITCLAU"):SetValue(QRYITMOV->Z14_ITCLAU)
				oSection4:Cell("Z14_DESCCL"):SetValue(QRYITMOV->Z14_DESCCL)
				oSection4:Cell("Z14_DESCPE"):SetValue(QRYITMOV->Z14_DESCPE)
				oSection4:Cell("Z14_APLICA"):SetValue(IIF(QRYITMOV->Z14_APLICA == "A","APURACAO",IIF(QRYITMOV->Z14_APLICA == "F","FATURAMENTO","EVENTUAL")))
				oSection4:Cell("Z14_DESCGR"):SetValue(QRYITMOV->Z14_DESCGR)
				oSection4:Cell("Z14_DESCPR"):SetValue(QRYITMOV->Z14_DESCPR)
				oSection4:Cell("Z14_FXINIC"):SetValue(QRYITMOV->Z14_FXINIC)
				oSection4:Cell("Z14_FXFINA"):SetValue(QRYITMOV->Z14_FXFINA)
				oSection4:Cell("Z14_TPFAIX"):SetValue(IIF(QRYITMOV->Z14_TPFAIX == "R","R$","%"))
				oSection4:Cell("Z14_VLRAPL"):SetValue(QRYITMOV->Z14_VLRAPL)
				oSection4:Cell("Z14_TPVLRA"):SetValue(IIF(QRYITMOV->Z14_TPVLRA == "R","R$","%"))
				oSection4:Cell("Z14_VLRPAR"):SetValue(QRYITMOV->Z14_VLRPAR)
				oSection4:Cell("Z14_APURAD"):SetValue(IIF(QRYITMOV->Z14_APURAD == "S","SIM","NAO"))

				oSection4:PrintLine()
				
				QRYITMOV->(DbSkip())
			EndDo
			oSection4:Finish()

			oSection5:Init()

			If Select("QRYTIT") > 0
				QRYTIT->(DbCloseArea())
			EndIf     

			cQry5 := " SELECT 'NCC' AS TIPTIT, SE1.E1_TIPO AS TIPO, SE1.E1_PREFIXO AS PREFIXO, SE1.E1_NUM AS NUMTIT, SE1.E1_PARCELA PARCELA,"
			cQry5 += " SE1.E1_CLIENTE AS CLIFOR, SE1.E1_LOJA AS LOJA, SE1.E1_NOMCLI NOMCLIFOR, SE1.E1_EMISSAO AS EMISSAO, SE1.E1_VENCTO AS VENCTO,"
			cQry5 += " SE1.E1_VALOR AS VALOR, SE1.E1_SALDO AS SALDO"
			cQry5 += " FROM "+RetSqlName("SE1")+" SE1"
			cQry5 += " WHERE SE1.D_E_L_E_T_	<> '*'"
			cQry5 += " AND SE1.E1_FILIAL	= '"+xFilial("SE1")+"'"
			cQry5 += " AND SE1.E1_XCONTRA	= '"+QRYCTR->Z13_CONTRA+"'"
			cQry5 += " AND SE1.E1_XIDMOVI	= '"+QRYMOV->Z13_CODIGO+"'"
			
			cQry5 += " UNION ALL"

			cQry5 += " SELECT 'A PAGAR' AS TIPTIT, SE2.E2_TIPO AS TIPO, SE2.E2_PREFIXO AS PREFIXO, SE2.E2_NUM AS NUMTIT, SE2.E2_PARCELA AS PARCELA,"
			cQry5 += " SE2.E2_FORNECE AS CLIFOR, SE2.E2_LOJA AS LOJA, SE2.E2_NOMFOR AS NOMCLIFOR, SE2.E2_EMISSAO AS EMISSAO, SE2.E2_VENCTO AS VENCTO,"
			cQry5 += " SE2.E2_VALOR AS VALOR, SE2.E2_SALDO AS SALDO"
			cQry5 += " FROM "+RetSqlName("SE2")+" SE2"
			cQry5 += " WHERE SE2.D_E_L_E_T_	<> '*'"
			cQry5 += " AND SE2.E2_FILIAL	= '"+xFilial("SE2")+"'"
			cQry5 += " AND SE2.E2_XCONTRA	= '"+QRYCTR->Z13_CONTRA+"'"
			cQry5 += " AND SE2.E2_XIDMOVI	= '"+QRYMOV->Z13_CODIGO+"'"
			
			cQry5 := ChangeQuery(cQry5)
			//MemoWrite("c:\temp\RFATE026_QRYTIT.txt",cQry5)
			TcQuery cQry5 New Alias "QRYTIT"

			If QRYTIT->(!EOF())
				oReport:SkipLine()
				oReport:PrintText("MOVIMENTACAO >> FINANCEIRO") 
			Endif

			While !oReport:Cancel() .And. QRYTIT->(!EOF())
				
				If oReport:Cancel()
					Exit
				EndIf   

				oSection5:Cell("TIPTIT"):SetValue(QRYTIT->TIPTIT)
				oSection5:Cell("TIPO"):SetValue(QRYTIT->TIPO)
				oSection5:Cell("PREFIXO"):SetValue(QRYTIT->PREFIXO)
				oSection5:Cell("NUMTIT"):SetValue(QRYTIT->NUMTIT)
				oSection5:Cell("PARCELA"):SetValue(QRYTIT->PARCELA)
				oSection5:Cell("CLIFOR"):SetValue(QRYTIT->CLIFOR)
				oSection5:Cell("NOMCLIFOR"):SetValue(QRYTIT->NOMCLIFOR)
				oSection5:Cell("EMISSAO"):SetValue(DToC(SToD(QRYTIT->EMISSAO)))
				oSection5:Cell("VENCTO"):SetValue(DToC(SToD(QRYTIT->VENCTO)))
				oSection5:Cell("VALOR"):SetValue(QRYTIT->VALOR)
				oSection5:Cell("SALDO"):SetValue(QRYTIT->SALDO)

				oSection5:PrintLine()

				QRYTIT->(DbSkip())
			EndDo

			oSection5:Finish()
			oSection3:Finish()
			
			oReport:SkipLine(2)
			
			QRYMOV->(DbSkip())
		EndDo

		oSection6:Init()

		If Select("QRYAPUR") > 0
			QRYAPUR->(DbCloseArea())
		EndIf     

		cQry6 := " SELECT Z21.Z21_CODIGO, Z21.Z21_DATA, Z21.Z21_TITFIN, Z21.Z21_NATTIT, Z21.Z21_VLRTIT"
		cQry6 += " FROM "+RetSqlName("Z21")+" Z21"
		cQry6 += " WHERE Z21.D_E_L_E_T_	<> '*'"
		cQry6 += " AND Z21.Z21_FILIAL	= '"+xFilial("Z21")+"'"
		cQry6 += " AND Z21.Z21_DATA		BETWEEN '"+DToS(MV_PAR01)+"' AND '"+DToS(MV_PAR02)+"'"
		cQry6 += " AND Z21.Z21_CONTRA	= '"+QRYCTR->Z13_CONTRA+"'"

		cQry6 := ChangeQuery(cQry6)
		//MemoWrite("c:\temp\RFATE026_QRYAPUR.txt",cQry6)
		TcQuery cQry6 New Alias "QRYAPUR"

		If QRYAPUR->(!EOF())
			oReport:SkipLine()
			oReport:PrintText("APURACAO") 
		Endif

		While !oReport:Cancel() .And. QRYAPUR->(!EOF())
			
			If oReport:Cancel()
				Exit
			EndIf   

			oSection6:Cell("Z21_DATA"):SetValue(DToC(SToD(QRYAPUR->Z21_DATA)))
			oSection6:Cell("Z21_TITFIN"):SetValue(IIF(QRYAPUR->Z21_TITFIN == "A","A PAGAR","NCC"))
			oSection6:Cell("Z21_NATTIT"):SetValue(QRYAPUR->Z21_NATTIT)
			oSection6:Cell("Z21_VLRTIT"):SetValue(QRYAPUR->Z21_VLRTIT)

			oSection6:PrintLine()

			oSection7:Init()

			If Select("QRYDETAPUR") > 0
				QRYDETAPUR->(DbCloseArea())
			EndIf     

			cQry7 := " SELECT Z22.Z22_CODMOV, Z22.Z22_ITMOV, Z22.Z22_DESCCL, Z22.Z22_VLRPAR"
			cQry7 += " FROM "+RetSqlName("Z22")+" Z22"
			cQry7 += " WHERE Z22.D_E_L_E_T_	<> '*'"
			cQry7 += " AND Z22.Z22_FILIAL	= '"+xFilial("Z22")+"'"
			cQry7 += " AND Z22.Z22_CODIGO	= '"+QRYAPUR->Z21_CODIGO+"'"
	
			cQry7 := ChangeQuery(cQry7)
			//MemoWrite("c:\temp\RFATE026_QRYDETAPUR.txt",cQry7)
			TcQuery cQry7 New Alias "QRYDETAPUR"
	
			While !oReport:Cancel() .And. QRYDETAPUR->(!EOF())
				
				If oReport:Cancel()
					Exit
				EndIf   
	
				oSection7:Cell("Z22_CODMOV"):SetValue(QRYDETAPUR->Z22_CODMOV)
				oSection7:Cell("Z22_ITMOV"):SetValue(QRYDETAPUR->Z22_ITMOV)
				oSection7:Cell("Z22_DESCCL"):SetValue(QRYDETAPUR->Z22_DESCCL)
				oSection7:Cell("Z22_VLRPAR"):SetValue(QRYDETAPUR->Z22_VLRPAR)

				oSection7:PrintLine()

				QRYDETAPUR->(DbSkip())
			EndDo
			
			oSection7:Finish()

			oSection8:Init()

			If Select("QRYTITAPUR") > 0
				QRYTITAPUR->(DbCloseArea())
			EndIf     

			cQry8 := " SELECT 'NCC' AS TIPTIT, SE1.E1_TIPO AS TIPO, SE1.E1_PREFIXO AS PREFIXO, SE1.E1_NUM AS NUMTIT, SE1.E1_PARCELA PARCELA,"
			cQry8 += " SE1.E1_CLIENTE AS CLIFOR, SE1.E1_LOJA AS LOJA, SE1.E1_NOMCLI NOMCLIFOR, SE1.E1_EMISSAO AS EMISSAO, SE1.E1_VENCTO AS VENCTO,"
			cQry8 += " SE1.E1_VALOR AS VALOR, SE1.E1_SALDO AS SALDO"
			cQry8 += " FROM "+RetSqlName("SE1")+" SE1"
			cQry8 += " WHERE SE1.D_E_L_E_T_	<> '*'"
			cQry8 += " AND SE1.E1_FILIAL	= '"+xFilial("SE1")+"'"
			cQry8 += " AND SE1.E1_XCONTRA	= '"+QRYCTR->Z13_CONTRA+"'"
			cQry8 += " AND SE1.E1_XIDMOVI	= '"+QRYMOV->Z13_CODIGO+"'"
			
			cQry8 += " UNION ALL"

			cQry8 += " SELECT 'A PAGAR' AS TIPTIT, SE2.E2_TIPO AS TIPO, SE2.E2_PREFIXO AS PREFIXO, SE2.E2_NUM AS NUMTIT, SE2.E2_PARCELA AS PARCELA,"
			cQry8 += " SE2.E2_FORNECE AS CLIFOR, SE2.E2_LOJA AS LOJA, SE2.E2_NOMFOR AS NOMCLIFOR, SE2.E2_EMISSAO AS EMISSAO, SE2.E2_VENCTO AS VENCTO,"
			cQry8 += " SE2.E2_VALOR AS VALOR, SE2.E2_SALDO AS SALDO"
			cQry8 += " FROM "+RetSqlName("SE2")+" SE2"
			cQry8 += " WHERE SE2.D_E_L_E_T_	<> '*'"
			cQry8 += " AND SE2.E2_FILIAL	= '"+xFilial("SE2")+"'"
			cQry8 += " AND SE2.E2_XCONTRA	= '"+QRYCTR->Z13_CONTRA+"'"
			cQry8 += " AND SE2.E2_XIDMOVI	= '"+QRYMOV->Z13_CODIGO+"'"
			
			cQry8 := ChangeQuery(cQry8)
			//MemoWrite("c:\temp\RFATE026_QRYTITAPUR.txt",cQry8)
			TcQuery cQry8 New Alias "QRYTITAPUR"

			If QRYTITAPUR->(!EOF())
				oReport:SkipLine()
				oReport:PrintText("APURACAO >> FINANCEIRO") 
			Endif

			While !oReport:Cancel() .And. QRYTITAPUR->(!EOF())
				
				If oReport:Cancel()
					Exit
				EndIf   

				oSection8:Cell("TIPTIT"):SetValue(QRYTITAPUR->TIPTIT)
				oSection8:Cell("TIPO"):SetValue(QRYTITAPUR->TIPO)
				oSection8:Cell("PREFIXO"):SetValue(QRYTITAPUR->PREFIXO)
				oSection8:Cell("NUMTIT"):SetValue(QRYTITAPUR->NUMTIT)
				oSection8:Cell("PARCELA"):SetValue(QRYTITAPUR->PARCELA)
				oSection8:Cell("CLIFOR"):SetValue(QRYTITAPUR->CLIFOR)
				oSection8:Cell("NOMCLIFOR"):SetValue(QRYTITAPUR->NOMCLIFOR)
				oSection8:Cell("EMISSAO"):SetValue(DToC(SToD(QRYTITAPUR->EMISSAO)))
				oSection8:Cell("VENCTO"):SetValue(DToC(SToD(QRYTITAPUR->VENCTO)))
				oSection8:Cell("VALOR"):SetValue(QRYTITAPUR->VALOR)
				oSection8:Cell("SALDO"):SetValue(QRYTITAPUR->SALDO)

				oSection8:PrintLine()

				QRYTITAPUR->(DbSkip())
			EndDo

			oSection8:Finish()
			oSection6:Finish()
			
			oReport:SkipLine(2)

			QRYAPUR->(DbSkip())
		EndDo

		QRYCTR->(DbSkip())
	EndDo
	
	oSection2:Finish()
	oSection1:Finish()
	
	QRYCLI->(DbSkip())
EndDo

If Select("QRYTITAPUR") > 0
	QRYTITAPUR->(DbCloseArea())
EndIf     

If Select("QRYDETAPUR") > 0
	QRYDETAPUR->(DbCloseArea())
EndIf     

If Select("QRYAPUR") > 0
	QRYAPUR->(DbCloseArea())
EndIf     

If Select("QRYTIT") > 0
	QRYTIT->(DbCloseArea())
EndIf     

If Select("QRYITMOV") > 0
	QRYITMOV->(DbCloseArea())
EndIf     

If Select("QRYMOV") > 0
	QRYMOV->(DbCloseArea())
EndIf     

If Select("QRYCTR") > 0
	QRYCTR->(DbCloseArea())
EndIf     

If Select("QRYCLI") > 0
	QRYCLI->(DbCloseArea())
EndIf     

Return