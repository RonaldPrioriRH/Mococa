// #########################################################################################
// Projeto: Cooprata
// Modulo : Gestão do Leite
// Fonte  : RGLT077
// ---------+-------------------+-----------------------------------------------------------
// Data     | Autor Pedro Tobaruela Ortiz| CADASTRO DE TANQUES
// ---------+-------------------+-----------------------------------------------------------
// 27/03/14 | TOTVS Developer Studio | Gerado pelo Assistente de Código
// ---------+-------------------+-----------------------------------------------------------

#include "rwmake.ch"

//------------------------------------------------------------------------------------------
/*/{Protheus.doc} novo
Montagem da tela de processamento

Impressão da RELACAO DE TANQUES
/*/
//------------------------------------------------------------------------------------------
USER FUNCTION RGLT077

Private cPerg	:= "RGLT077"

AjustaSX1(cPerg)

Pergunte(cPerg,.T.)

oReport := ReportDef()
	
oReport:PrintDialog()

Return

Static Function ReportDef()

Private oReport
Private oSec1
Private aTam := {}
Private cParam := ""

oReport := TReport():NEW("RGLT077" ,"RELAÇÃO DE TANQUES.",cPerg,{|oReport|PrintReport(oReport)} ,"Este relatório imprime a RELAÇÃO DE COOPERADOS E SEUS TANQUES")

oReport:nFontBody	:= 8// Define o tamanho da fonte.
oReport:nLineHeight	:= 40 // Define a altura da linha.
oReport:CFONTBODY:="Courier New" 
//oReport:SetBorder("ALL")

oSec1 := TRSection():new(oReport,"Relação",{""})  


TRCELL():NEW(oSec1,"MATRICULA"		,,"Matricula"	,	,10	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec1,"NOME"	,,"Nome do Cooperado"	,	,40	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec1,"TANQUE"	,,"Tanque"				,	,10	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec1,"NOMTANQUE"	,,""				,	,40	,,,"LEFT",	,"LEFT",,,,,,.F.)


oReport:lParamPage := .F.
oReport:GetOrientation(1)
//oReport:SetTotalInLine(.T.)    

Return oReport

Static Function PrintReport(oReport)

Private oSec1	:= oReport:Section(1)

Private oBreak 

Private cQry1

oSec1:SetLeftMargin(10) 

   
	cQry1 := " SELECT MATRICULA, NOME, TANQUE, NOMTANQUE, CLASTQ, TITULAR FROM ( "
		cQry1 += " SELECT SA2.A2_COD+'/'+SA2.A2_LOJA MATRICULA, SA2.A2_NREDUZ NOME, SA2.A2_L_TANQ TANQUE, ZLS_DESCRI NOMTANQUE, ZLS_CLASTQ CLASTQ "
		cQry1 += " , CASE WHEN ZLT_TITULA = 'S' THEN 'T' WHEN ZLT_TITULA = 'N' THEN 'P' END AS TITULAR  "
		cQry1 += " FROM  "+RetSqlName("SA2")+" (NOLOCK) SA2  "
		cQry1 += "  LEFT JOIN "+RetSqlName("ZLS")+" (NOLOCK) ZLS ON (ZLS.D_E_L_E_T_ = ' ' AND A2_L_TANQ = ZLS_COD) "
		cQry1 += "  LEFT JOIN "+RetSqlName("ZLT")+" (NOLOCK) ZLT ON (ZLT.D_E_L_E_T_ = ' ' AND A2_L_TANQ = ZLT_COD AND ZLT_SA2COD = A2_COD AND ZLT_SA2LJ = A2_LOJA) "
		cQry1 += " WHERE SA2.D_E_L_E_T_ = ' ' " 
	cQry1 += " ) RELACAO "           

	If MV_PAR02 == 2
		cQry1 += " WHERE CLASTQ = 'I' "           
	ElseIf MV_PAR02 == 3
		cQry1 += " WHERE CLASTQ = 'C' "           
	ElseIf MV_PAR02 == 4
		cQry1 += " WHERE CLASTQ IS NULL "           
	EndIf


	cQry1 += " ORDER BY "+CVALTOCHAR(MV_PAR01)+" "



	//==========> CONSULTA 1 <==========
	// Verifica area aberta
	If Select("QRY") <> 0
		QRY->(DBCLOSEAREA())
	EndIF
	
	cQry1 := ChangeQuery(cQry1)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,cQry1),"QRY",.F.,.T.)
	
	QRY->(dbGoTop())
	
	oSec1:Init()  
	
	oReport:SkipLine()
	oReport:SkipLine() 
	oReport:PrintText(SPACE(5)+ "RELAÇÃO") 
	oReport:SkipLine() 
		
	While QRY->(!Eof())
	
		oSec1:Cell("MATRICULA"):SetValue(QRY->MATRICULA)
		oSec1:Cell("NOME"):SetValue(QRY->NOME)  
		If QRY->TANQUE <> " "
			oSec1:Cell("TANQUE"):SetValue(QRY->TANQUE+"/"+QRY->CLASTQ+"/"+QRY->TITULAR) 
		Else
			oSec1:Cell("TANQUE"):SetValue(QRY->TANQUE) 
		EndIf
		oSec1:Cell("NOMTANQUE"):SetValue(QRY->NOMTANQUE)
			
		oSec1:PrintLine()
	
		QRY->(dbSkip())
		
	Enddo
	
	oSec1:Finish()    
	// oReport:SkipLine() 
	// oReport:ThinLine()
	
			
	QRY->(dbCloseArea()) 
	

	
Return oReport


Static Function AjustaSX1(cPerg)  

	aHelpPor := {}
	Aadd( aHelpPor, 'Informe a ordenaçãa a ser utilizada.')
	U_xPutSx1(cPerg,"01","Ordenação"," "," ","mv_ch1","N" ,1,0,0,"C","NaoVazio()","","","","MV_PAR01","Matricula","Matricula","Matricula","","Nome Cooperado","Nome Cooperado","Nome Cooperado", "Tanque","Tanque","Tanque","Descrição","Descrição","Descrição","","","",aHelpPor,{},{})

	aHelpPor := {}
	Aadd( aHelpPor, 'Informe a classificação do tanque:')
	Aadd( aHelpPor, 'Todos / Individual / Coletivo / Sem Tanque')
	U_xPutSx1(cPerg,"02","Classificação"," "," ","mv_ch2","N" ,1,0,0,"C","NaoVazio()","","","","MV_PAR02","Todos","Todos","Todos","","Individual","Individual","Individual", "Coletivo","Coletivo","Coletivo","Sem Tanque","Sem Tanque","Sem Tanque","","","",aHelpPor,{},{})

	
Return  


STATIC FUNCTION CABECPROD()
	
	oReport:FatLine() 
	oReport:SkipLine()
	// oReport:PrintText(SPACE(10)+"COD/LOJA   : " + cProdutor + " - " + cLojaProd + " ") 
	// oReport:PrintText(SPACE(10)+"NOME       : " + ALLTRIM(cNomeProd) + " ")
	oReport:SkipLine()
	oReport:FatLine() 

RETURN