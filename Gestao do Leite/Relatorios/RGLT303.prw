#INCLUDE "REPORT.CH"
#INCLUDE "TOTVS.CH"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT303   บAutor  ณMicrosiga           บ Data ณ  04/22/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Informe de rendimentos dos produtores.                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function RGLT303()
                                     
Private cPerg := "PRGLT303"
Private oReport   

//Cria e chama as perguntas
ValidPerg(cPerg)
Pergunte(cPerg,.T.)        
                          

oReport := ReportDef(cPerg)
oReport:PrintDialog()

Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณReportDef ณ Autor ณ TOTVS TM              ณ Data ณ 30/07/13 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ                                                            ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function ReportDef(cPerg)

Local oProdutor, oDetalhe, oBreak
Local _cTitulo 

_cTitulo := "Informe de rendimentos."  

oReport := TReport():New("RGLT303",_cTitulo,cPerg,{|oReport|PrintReport(oReport)},"Este relatorio o informe de rendimentos dos produtores.")
oReport:SetTotalInLine(.F.)
oReport:lParamPage	:= .F.
oReport:SetLandScape(.T.)
oReport:nLineHeight	:= 45

DEFINE SECTION oProdutor OF oReport  TITLE "Produtor" 
oProdutor:SetTotalInLine(.F.)

DEFINE CELL NAME "A2_COD" 	OF oProdutor ALIAS "SA2"		// 01
DEFINE CELL NAME "A2_LOJA" 	OF oProdutor ALIAS "SA2"	   	// 02
DEFINE CELL NAME "A2_NOME" 	OF oProdutor ALIAS "SA2"	   	// 03

DEFINE SECTION oDetlhe OF oProdutor  TITLE "Rendimentos" 
oDetlhe:SetTotalInLine(.F.)

DEFINE CELL NAME "F1_DOC" 		OF oDetlhe ALIAS "SF1"		// 01
DEFINE CELL NAME "F1_SERIE" 	OF oDetlhe ALIAS "SF1"		// 02
DEFINE CELL NAME "F1_DTDIGIT" 	OF oDetlhe ALIAS "SF1"		// 03
DEFINE CELL NAME "D1_CF" 		OF oDetlhe ALIAS "SD1"		// 04
DEFINE CELL NAME "F1_DESPESA"	OF oDetlhe ALIAS "SF1"		// 05
DEFINE CELL NAME "D1_BASEICM"	OF oDetlhe ALIAS "SD1"		// 06
DEFINE CELL NAME "D1_VALICM"	OF oDetlhe ALIAS "SD1"		// 07
DEFINE CELL NAME "D1_TOTAL1"	OF oDetlhe ALIAS ""	    TITLE "Tot. Produt." PICTURE PesqPict("SD1","D1_TOTAL")		// 08
DEFINE CELL NAME "F1_FRETE"     OF oDetlhe ALIAS "SF1"      // 09 
DEFINE CELL NAME "FUNRURAL"    OF oDetlhe ALIAS "SD1"  TITLE "Vlr. Funrural"  PICTURE PesqPict("SD1","D1_VALFUN")   // 10 
DEFINE CELL NAME "D1_QUANT"		OF oDetlhe ALIAS "SD1"			// 11
DEFINE CELL NAME "D1_TOTAL2"	OF oDetlhe ALIAS ""		TITLE "Tot. N.F."    PICTURE PesqPict("SD1","D1_TOTAL")	// 12

for i := 5 to 12
	DEFINE FUNCTION FROM oDetlhe:Cell(i)   FUNCTION SUM
next i

oProdutor:SetPageBreak(.T.) //Seta para cada quebra de secao saltar pagina

Return(oReport)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณPrintReport   บAutor  ณMicrosiga       บ Data ณ  11/24/15   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function PrintReport(oReport)

Local _cAlias := GetNextAlias()

BEGIN REPORT QUERY oReport:Section(1)

BeginSql Alias _cAlias
	
	SELECT A2_COD, A2_LOJA, A2_NOME,
	F1_DOC, F1_SERIE, F1_DTDIGIT , D1_CF,
	F1_DESPESA,
	SUM(D1_BASEICM) D1_BASEICM,
	SUM(D1_VALICM) D1_VALICM,
	SUM(D1_TOTAL)  D1_TOTAL1,
	SUM(D1_QUANT) D1_QUANT,
	SUM(D1_TOTAL) D1_TOTAL2,
	(SUM(D1_VALFUN) + SUM(D1_VLSENAR)) FUNRURAL,
   	CASE
		WHEN SUM(D1_BASEICM) <> SUM(D1_TOTAL) THEN SUM(D1_TOTAL) - SUM(D1_BASEICM)
	END AS ISENTAS
	
	FROM %Table:SF1% SF1
	
	JOIN %Table:SD1% SD1 //D1_FILIAL, D1_DOC, D1_SERIE, D1_FORNECE, D1_LOJA, D1_ITEM, D1_FORMUL, D1_ITEMGRD, R_E_C_D_E_L_
	
	ON D1_FILIAL   = F1_FILIAL
	AND D1_DOC     = F1_DOC
	AND D1_SERIE   = F1_SERIE
	AND D1_FORNECE = F1_FORNECE
	AND D1_LOJA    = F1_LOJA
	AND D1_ITEM    >=  ' '
	AND D1_FORMUL  = F1_FORMUL
	
	JOIN %Table:SA2% SA2
	ON A2_FILIAL = %xFilial:SA2%
	AND A2_COD = F1_FORNECE
	AND A2_LOJA = F1_LOJA
	AND A2_L_TPFOR = 'P'
	AND SA2.D_E_L_E_T_ = ' '
	
	WHERE F1_FILIAL >= ' '         
	AND   F1_FORNECE BETWEEN %Exp:MV_PAR01% AND %Exp:MV_PAR02%
	AND   F1_LOJA    BETWEEN %Exp:MV_PAR03% AND %Exp:MV_PAR04%
	AND   F1_DTDIGIT BETWEEN %Exp:DtoS(MV_PAR05)% AND %Exp:DtoS(MV_PAR06)%
	AND   F1_FORMUL  = 'S'
	AND   F1_L_MIX  <> ''	
	AND   SF1.D_E_L_E_T_ = ' '
	
	GROUP BY A2_COD, A2_LOJA, A2_NOME,
	F1_DOC, F1_SERIE, F1_DTDIGIT, D1_CF, F1_DESPESA
	
	ORDER BY A2_COD, A2_LOJA, A2_NOME
		
EndSql

END REPORT QUERY oReport:Section(1)

oReport:Section(1):Section(1):SetParentQuery()
oReport:Section(1):Section(1):SetParentFilter({|cParam| (_cAlias)->A2_COD + (_cAlias)->A2_LOJA == cParam },{|| (_cAlias)->A2_COD + (_cAlias)->A2_LOJA })   

oReport:Section(1):Print(.T.)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ CriaSX1  บ Autor ณ TOTVS TM           บ Data ณ  14/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para criacao das perguntas caso elas nao existam.   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ValidPerg()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

//Do Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"01","Do Produtor"," "," ","mv_ch1","C",6,0,0,"G","","SA2_L4","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"02","Ate Produtor"," "," ","mv_ch2","C",6,0,0,"G","","SA2_L4","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe a loja inicial do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"03","Da Loja"," "," ","mv_ch3","C",2,0,0,"G","","","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate a Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe a loja final do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"04","Ate Loja"," "," ","mv_ch4","C",2,0,0,"G","","","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Data
aHelpPor := {}
Aadd( aHelpPor, 'Informe a data inicial do perํodo')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"05","Da Data"," "," ","mv_ch5","D",8,0,0,"G","","","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//At้ Data
aHelpPor := {}
Aadd( aHelpPor, 'Informe a data final do perํodo')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"06","At้ a Data"," "," ","mv_ch6","D",8,0,0,"G","","","","","MV_PAR06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return                                                                                                                   
