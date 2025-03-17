#include "protheus.ch"
#include "report.ch"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT038   บAutor  ณ                    บ Data ณ  07/12/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function RGLT037()
Local oReport
Local oCab
Local oDet   
Local bObserv := {|| IIf("CONVENIO IMPORTADO" $ ZLL_OBSERV,Posicione("SA2",1,xFilial("SA2")+(cAlias)->ZLL_CONVEN+(cAlias)->ZLL_LJCONV,"A2_NOME"),(cAlias)->ZLL_OBSERV) }
Private cPerg := "RGLT037",cAlias

ValidPerg(cPerg)   //MARCO - TUB027
Pergunte(cPerg,.F.)

DEFINE REPORT oReport NAME "RGLT037" TITLE "Pagamento Conv๊nio" PARAMETER cPerg ACTION {|oReport| PrintReport(oReport)}
oReport:SetTotalInLine(.F.)

DEFINE SECTION oCab OF oReport TITLE "Produtor" TABLES "SA2"

DEFINE CELL NAME "A2_COD" OF oCab 
DEFINE CELL NAME "A2_NOME" OF oCab 

oCab:SetTotalInLine(.F.)

DEFINE SECTION oDet OF oCab TITLE "Conv๊nios" TABLE "ZLL"
DEFINE CELL NAME "ZLL_OBSERV" OF oDet size 100 BLOCK bOBSERV
DEFINE CELL NAME "ZLL_VALOR" OF oDet 
DEFINE CELL NAME "ZLL_DATA" OF oDet 

DEFINE FUNCTION FROM oDet:Cell("ZLL_VALOR") OF oCab FUNCTION SUM TITLE "Valor Total"

oReport:PrintDialog()

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT037   บAutor  ณMicrosiga           บ Data ณ  07/12/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function PrintReport(oReport) 
Local cPrdDe  := MV_PAR01+MV_PAR02
Local cPrdAte := MV_PAR03+MV_PAR04
Local cCnvDe  := MV_PAR05+MV_PAR06
Local cCnvAte := MV_PAR07+MV_PAR08
Local cAnoRef := MV_PAR09

#IFDEF TOP
	cAlias := GetNextAlias()

   //	MakeSqlExp(cPerg)
	
	BEGIN REPORT QUERY oReport:Section(1)
	
	BeginSql alias cAlias   
	
	SELECT 
	 SA2.A2_COD
	 ,SA2.A2_NOME 
	 ,ZLL_CONVEN
	 ,ZLL_LJCONV
	 ,Substring(ZLL.ZLL_OBSERV,1,60) as ZLL_OBSERV	 
	 ,ZLL.ZLL_VALOR
	 ,ZLL.ZLL_DATA
	FROM
	 %table:SA2% SA2
	 ,%table:ZLL1% ZLL
	WHERE              
	 SA2.A2_COD = ZLL.ZLL_RETIRO and SA2.A2_LOJA = ZLL.ZLL_RETILJ
	 and SA2.A2_FILIAL = %xfilial:SA2% and SA2.%notDel% 
	 and ZLL.ZLL_FILIAL = %xfilial:ZLL% and ZLL.%notDel% 
	 and ZLL.ZLL_STATUS = 'A'
	 and ZLL.ZLL_RETIRO||ZLL.ZLL_RETILJ between %exp:cPrdDe% and %exp:cPrdAte%
	 and ZLL.ZLL_CONVEN||ZLL.ZLL_LJCONV between %exp:cCnvDe% and %exp:cCnvAte% 
	 and SubString(ZLL.ZLL_VENCTO,1,4) = %exp:cAnoRef% 	 
	order by 
	 SA2.A2_NOME,ZLL.ZLL_OBSERV,ZLL.ZLL_VENCTO			
	
	EndSql
	
	END REPORT QUERY oReport:Section(1)
	
	//MakeAdvplExpr(cPerg)
	
	oReport:Section(1):Section(1):SetParentQuery()
	oReport:Section(1):Section(1):SetParentFilter({|cParam| (cAlias)->A2_COD == cParam},{|| (cAlias)->A2_COD})

	oReport:Section(1):Print()
#ENDIF
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT033   บAutor  ณMicrosiga           บ Data ณ  01/05/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ValidPerg(cPerg)

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

//Do Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial do Produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"01","Do Produtor"," "," ","mv_ch4","C",6,0,0,"G","","SA2_L9","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial da Loja  ')
Aadd( aHelpPor, 'do produtor que deseja filtrar.   ')
U_xPutSx1(cPerg,"02","Da Loja   "," "," ","mv_ch5","C",2,0,0,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ao Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final do Produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"03","Ao Produtor"," "," ","mv_ch6","C",6,0,0,"G","","SA2_L9","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate a Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final da Loja  ')
Aadd( aHelpPor, 'do produtor que deseja filtrar.   ')
U_xPutSx1(cPerg,"04","Ate a Loja  "," "," ","mv_ch7","C",2,0,0,"G","","","","","mv_par04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Convenio
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial do Convenio')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"05","Do Convenio"," "," ","mv_ch4","C",6,0,0,"G","","SA2_L5","","","mv_par05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial da Loja  ')
Aadd( aHelpPor, 'do convenio que deseja filtrar.   ')
U_xPutSx1(cPerg,"06","Da Loja   "," "," ","mv_ch5","C",2,0,0,"G","","","","","mv_par06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ao Convenio
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final do Convenio')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"07","Ao Convenio"," "," ","mv_ch6","C",6,0,0,"G","","SA2_L5","","","mv_par07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate a Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final da Loja  ')
Aadd( aHelpPor, 'do convenio que deseja filtrar.   ')
U_xPutSx1(cPerg,"08","Ate a Loja  "," "," ","mv_ch7","C",2,0,0,"G","","","","","mv_par08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ano Refer๊ncia
aHelpPor := {}
Aadd( aHelpPor, 'Informe o ano de refer๊ncia')
U_xPutSx1(cPerg,"09","Ano Referencia"," "," ","mv_ch9","C",4,0,0,"G","","","","","mv_par09","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

return
