// #########################################################################################
// Projeto: Gestใo do Leite
// Modulo : Gestใo do Leite
// Fonte  : RGLT078
// ---------+-------------------+-----------------------------------------------------------
// Data     | Autor             | Descricao
// ---------+-------------------+-----------------------------------------------------------
// 16/04/14 | Guilherme Fran็a  | Lista de Cr้dito do Produtor
// ---------+-------------------+-----------------------------------------------------------
#include "protheus.ch"
#include "report.ch"       

user function RGLT078()

Private oReport
Private oCab
Private oBreak
Private cPerg := "RGLT078"  
Private _cAlias    := GetNextAlias() 
Private _cFiltro01 := ""
Private _cFiltro02 := ""
//Private _cPresta	:=	_cPrest

criaSX1()


If !Pergunte("RGLT078",.T.)
	Return
EndIf


DEFINE REPORT oReport NAME "RGLT078" TITLE "Lista de cr้ditos do produtor" /*PARAMETER "RFIN009"*/ ACTION {|oReport| PrintReport(oReport)}

oReport:nFontBody := 7 //Define o tamanho da fonte
oReport:lHeaderVisible	:= .T. 
oReport:SetLandscape()
oReport:GetOrientation(2)



DEFINE SECTION oCab OF oReport TITLE "Lista de cr้ditos do produtor" TABLES "_cAlias"
  
  DEFINE CELL NAME "A2_COD"        	OF oCab ALIAS "_cAlias" SIZE 10
  DEFINE CELL NAME "A2_NOME" 		OF oCab ALIAS "_cAlias"
  DEFINE CELL NAME "A2_L_NOMFA"		OF oCab ALIAS "_cAlias" TITLE "Titular"
  DEFINE CELL NAME "A2_CGC" 		OF oCab ALIAS "_cAlias" TITLE "CPF" PICTURE "@r 999.999.999-99"
  DEFINE CELL NAME "A2_BANCO" 		OF oCab ALIAS "_cAlias"
  DEFINE CELL NAME "AGENCIA" 		OF oCab ALIAS "_cAlias" //SIZE 15 BLOCK {|| (_cAlias)->NUMAGE+"-"+(_cAlias)->DIGAGE }
  DEFINE CELL NAME "CONTA" 			OF oCab ALIAS "_cAlias" //SIZE 15 BLOCK {|| (_cAlias)->NUMCC+"-"+(_cAlias)->DIGCC }
  DEFINE CELL NAME "SALDO" 		OF oCab ALIAS "_cAlias"  TITLE "Liquido Pagar"   PICTURE "@E 999,999,999.99" SIZE 16


//  DEFINE CELL NAME "ZZQ_VENCTO" 	OF oCab ALIAS "cAlias"
//  DEFINE CELL NAME "TOTALGUIA" 		OF oCab ALIAS "cAlias"
oReport:GetOrientation(2)

oBreak:= TRBreak():New(oCab,oCab:CELL("A2_BANCO"),"Total Banco: " ,.F.)          
oBreak:setTotalText({|| "Total Banco: " })

TRFunction():New(oCab:Cell("SALDO"),NIL,"SUM",oBreak)  
  
//  DEFINE FUNCTION FROM oCab:Cell("TOTALGUIA") FUNCTION SUM BREAK oBreak
  
oCab:lAutoSize := .f.

oReport:PrintDialog()

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณPrintReportบAutor  ณMicrosiga           บ Data ณ  12/02/14   บฑฑ
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


Private _cFiltro := "%E2.E2_L_MIX = '"+mv_par01+"'  %"
//Private _cFiltro2 := "%A2.A2_L_TPPAG = '"+mv_par02+"'  %"	
 
 BEGIN REPORT QUERY oCab
 
 BeginSql alias _cAlias              
 	   
		SELECT A2_COD, A2_LOJA, A2_NOME, 
		CASE WHEN A2_L_CGCFA <> '' THEN A2_L_CGCFA ELSE A2_CGC END AS A2_CGC,
		A2.A2_L_NOMFA,A2.A2_BANCO, 
		(RTRIM(A2.A2_AGENCIA)||A2.A2_DVAGE) AS AGENCIA, 
		(RTRIM(A2.A2_NUMCON)||'-'||A2.A2_DVCTA) AS CONTA,
		SUM(E2.E2_SALDO) SALDO
		FROM %Table:SE2% E2
			JOIN %table:SA2% A2 ON A2_COD = E2.E2_FORNECE AND A2_LOJA = E2_LOJA AND A2.%NotDel%
		WHERE E2.E2_FILIAL = %xFilial:SE2% AND E2_ORIGEM = 'MATA100' 
		AND E2.%NotDel%
		AND %exp:_cFiltro%
		//AND %exp:_cFiltro2%
	
        
		GROUP BY A2_COD, A2_LOJA, A2_NOME, A2_CGC, A2.A2_BANCO,A2.A2_AGENCIA,A2.A2_DVAGE, A2.A2_NUMCON,A2.A2_DVCTA,A2_L_CGCFA, A2_L_NOMFA
		ORDER BY A2_BANCO, A2_NOME					
 EndSql
 End REPORT QUERY oCab




 oCab:Print(.T.)
// oCab1:Print(.T.)
// oCab2:Print(.T.)                

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณcriaSX1   บAutor  ณMicrosiga           บ Data ณ  12/02/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

static function criaSX1()

	Local aHelpPor := {}
	Local aHelpSpa := {}
	Local aHelpEng := {}
	
Aadd( aHelpEng, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpEng, 'zado para filtrar os creditos.         ')
U_xPutSx1(cPerg,"01","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch1","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_02","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	
/*Aadd( aHelpEng, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpEng, 'zado para filtrar os creditos.         ')
PutSx1(cPerg,"02","Codigo do MIX ?","Tipo de Relatorio","","mv_ch2","C",6,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
*/		
	
	
	
	
	
	
/*	aHelpPor := {}
	Aadd( aHelpPor, 'Informe o tipo de filtro.             ')
	Aadd( aHelpPor, 'Por Cooperado ou Transportador')
	PutSx1(cPerg,"02","Tipo Relatorio"," "," ","mv_ch2","N" ,1,0,0,"C","NaoVazio()","","","","MV_PAR02","","","","","","","", "","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
*/	
/*	
	aHelpPor := {aHelpPor,"Informe o Periodo"}
	aTam	:= TamSX3("ZZE_DTINI")
	aAdd( aHelpPor, "Informe o Periodo")
	PutSx1(cPerg, "01","Periodo De ? ","","","mv_ch01",aTam[3],aTam[1],aTam[2],0,"G","","","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,{},{})
	PutSx1(cPerg, "02","Periodo Ate ? ","","","mv_ch02",aTam[3],aTam[1],aTam[2],0,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,{},{})
	
	aHelpPor := {} 
	aTam	:= TamSX3("A1_COD") 
	aAdd( aHelpPor, "Do Cliente: ")
	PutSx1(cPerg, "03","Do Cliente ","","","mv_ch03",aTam[3],aTam[1],aTam[2],0,"G","","SA1","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,{},{})
	
	aHelpPor := {} 
	aTam	:= TamSX3("A1_COD") 
	aAdd( aHelpPor, "Ao Cliente: ")
	PutSx1(cPerg, "04","Ao Cliente ","","","mv_ch04",aTam[3],aTam[1],aTam[2],0,"G","","SA1","","","mv_par04","","","","","","","","","","","","","","","","",aHelpPor,{},{})
*/	
Return
  