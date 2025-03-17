#include "report.ch"
#INCLUDE "rwmake.ch"
#INCLUDE "TopConn.ch"
#INCLUDE "Protheus.ch"                                                                             
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT172   บ Autor ณ Pedro Tobaruela Ortiz บ Data da Criacao  ณ 28/07/2014                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Mapa de faturamento do Leite                                                                                 บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                      																						บฑฑ
ฑฑบ			 ณ					                                                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                         						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ                                                      	                                                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ                                                                                          					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ                                                                                         						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User function RGLT172()

Private _cFunc:=""
Private oReport
Private cPerg := "RGLT172"
Private _cSerieNF  := PADR(AllTrim(GETMV("LT_SERIE")),TamSx3("F1_PREFIXO")[1]) // Serie da NF
Private oBreak                       

CriaSX1(cPerg)

//Chama a tela de parametros
If !Pergunte(cPerg,.T.,'Mapa de faturamento do Leite')   
	Return(Nil)
EndIf


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณINICIO DO OBJETO TREPORT PARA O RELATORIOณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

DEFINE REPORT oReport NAME "RGLT172" TITLE "MAPA DE FATURAMENTO DO LEITE "+cvaltochar(mv_par01)+"." PARAMETER cPerg ACTION {|oReport| PrintReport(oReport)}

oReport:nFontBody	:= 08
oReport:cFontBody	:= "Courier New"  
oReport:nLineHeight	:= 50 // Define a altura da linha.
oReport:DisableOrientation()//Desabilita a escolha do tipo de orientacao da pagina retrato ou paisagem    
oReport:SetMsgPrint('Processando dados do Relat๓rio') 
oReport:HideHeader() // Nao imprime cabecalho padrao do Protheus
oReport:HideFooter() // Nao imprime rodape padrao do Protheus
oReport:SetLandscape()
oReport:SetTotalInLine(.F.)

// MATRICULA QTD_COTA QTD_ACIDO FRT_UNIT FRT_TOTAL VLR_COTA VLR_ACIDO VLR_QUALIDADE VLR_LEITEMG FUN_TOTAL VLR_DEBANT VLR_DEB VLR_CRD VLR_LIQUIDO
//MAT QTD  FRT VLR FUN  FIN
DEFINE SECTION oSec1 OF oReport TITLE "" TABLES "TRB00"  
DEFINE CELL NAME "pMat"   	OF oSec1 ALIAS "TRB00" SIZE 8 BLOCK{|| " - "} TITLE "MATRICULA"
DEFINE CELL NAME "pQtd"   	OF oSec1 ALIAS "TRB00" SIZE 16 BLOCK{|| " - "} TITLE "QTD DE LEITE"
DEFINE CELL NAME "pFrt"   	OF oSec1 ALIAS "TRB00" SIZE 16 BLOCK{|| " - "} TITLE "DESC FRETE"
DEFINE CELL NAME "pVlr"   	OF oSec1 ALIAS "TRB00" SIZE 38 BLOCK{|| " - "} TITLE "VALOR DO LEITE"
DEFINE CELL NAME "pFun"   	OF oSec1 ALIAS "TRB00" SIZE 13 BLOCK{|| " - "} TITLE "FUNRURAL"
DEFINE CELL NAME "pFin"   	OF oSec1 ALIAS "TRB00" SIZE 32 BLOCK{|| " - "} TITLE "FINANCEIRO"

oSec1:SetCellBorder("ALL",0.5,,.T.)
oSec1:Cell("pMat"):SetBorder("ALL",0.5,,.F.)
oSec1:Cell("pQtd"):SetBorder("ALL",0.5,,.F.)
oSec1:Cell("pFrt"):SetBorder("ALL",0.5,,.F.)
oSec1:Cell("pVlr"):SetBorder("ALL",0.5,,.F.)
oSec1:Cell("pFun"):SetBorder("ALL",0.5,,.F.)
oSec1:Cell("pFin"):SetBorder("ALL",0.5,,.F.)

oSec1:SetColSpace( 1 )
oSec1:SetTotalInLine(.F.) 
oSec1:SetHeaderBreak(.T.)                                                   
oSec1:SetAutoSize(.T.)          
oSec1:SetHeaderPage(.T.) //Se imprime o tํtulo das colunas no inicio  


DEFINE SECTION oSecMAP OF oSec1 TITLE "Mapa do Faturamento" TABLES "TRB01"                                                        
DEFINE CELL NAME "cMat"     	OF oSecMAP ALIAS "TRB01" SIZE 9 BLOCK{|| TRB01->MATRICULA} 										TITLE " "
DEFINE CELL NAME "nQtdCota"    	OF oSecMAP ALIAS "TRB01" SIZE 8 BLOCK{|| cvaltochar(Transform(TRB01->QTD_COTA,"@E 999,999"))}		TITLE " Cota "
DEFINE CELL NAME "nQtdAcid"    	OF oSecMAP ALIAS "TRB01" SIZE 8 BLOCK{|| cvaltochar(Transform(TRB01->QTD_ACIDO,"@E 999,999"))}	TITLE " Acid "
DEFINE CELL NAME "nFrtUnit"    	OF oSecMAP ALIAS "TRB01" SIZE 8 BLOCK{|| cvaltochar(Transform(TRB01->FRT_UNIT,"@E 9.999"))} 		TITLE " Frt Unit "
DEFINE CELL NAME "nFrtTotal"   	OF oSecMAP ALIAS "TRB01" SIZE 8 BLOCK{|| cvaltochar(Transform(TRB01->FRT_TOTAL,"@E 999,999.99"))}	TITLE " Frt Total "
DEFINE CELL NAME "nVlrCota"   	OF oSecMAP ALIAS "TRB01" SIZE 10 BLOCK{|| cvaltochar(Transform(TRB01->VLR_COTA,"@E 999,999.99"))}  TITLE " Vlr Cota "
DEFINE CELL NAME "nVlrAcid"   	OF oSecMAP ALIAS "TRB01" SIZE 10 BLOCK{|| cvaltochar(Transform(TRB01->VLR_ACIDO,"@E 999,999.99"))} TITLE " Vlr Acid "
DEFINE CELL NAME "nVlrQual"   	OF oSecMAP ALIAS "TRB01" SIZE 10 BLOCK{|| cvaltochar(Transform(TRB01->VLR_QUALIDADE,"@E 999,999.99"))}	 	TITLE " Vlr Qual "
DEFINE CELL NAME "nVlrTotal"   	OF oSecMAP ALIAS "TRB01" SIZE 8 BLOCK{|| cvaltochar(Transform(TRB01->VLR_LEITEMG,"@E 999,999.99"))}	 	TITLE " Total Leite "
DEFINE CELL NAME "nFunUnit"   	OF oSecMAP ALIAS "TRB01" SIZE 5 BLOCK{|| cvaltochar(Transform(TRB01->FUN_TOTAL/TRB01->VLR_LEITEMG*100,"@E 9.9"))}	 	TITLE " Unit "
DEFINE CELL NAME "nFunTotal"   	OF oSecMAP ALIAS "TRB01" SIZE 8 BLOCK{|| cvaltochar(Transform(TRB01->FUN_TOTAL,"@E 999,999.99"))}	   		TITLE " Total "
DEFINE CELL NAME "nDebAnt"   	OF oSecMAP ALIAS "TRB01" SIZE 8 BLOCK{|| cvaltochar(Transform(TRB01->VLR_DEBANT,"@E 999,999.99"))}	  	TITLE " Deb Ant "
DEFINE CELL NAME "nDeb"   		OF oSecMAP ALIAS "TRB01" SIZE 8 BLOCK{|| cvaltochar(Transform(TRB01->VLR_DEB,"@E 999,999.99"))}	  		TITLE " Deb "
DEFINE CELL NAME "nCrd"   		OF oSecMAP ALIAS "TRB01" SIZE 8 BLOCK{|| cvaltochar(Transform(TRB01->VLR_CRD,"@E 999,999.99"))}	  		TITLE " Crd "
DEFINE CELL NAME "nLiq"   		OF oSecMAP ALIAS "TRB01" SIZE 18 BLOCK{|| cvaltochar(Transform(TRB01->VLR_LIQUIDO,"@E 9,999,999.99"))}	  	TITLE " Liq "



oSecMAP:SetTotalInLine(.F.) 
oSecMAP:SetHeaderBreak(.T.)                                                   
oSecMAP:SetAutoSize(.F.)  
oSecMAP:SetHeaderPage(.T.) 
oSecMAP:SetCellBorder(5,1,,.T.)

//Habilita impressao
oReport:PrintDialog()

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณNRFIN01   บAutor  ณMicrosiga           บ Data ณ  07/19/12   บฑฑ
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

Local par01	:=	Substr(mv_par01,1,6)


BEGIN REPORT QUERY oSec1
	BeginSql alias "TRB00"           

	%noparser%	SELECT TOP 0 ZL2_COD FROM ZL2010
//	%noparser%	SELECT '--------' MAT, '-----------' QTD, '-------' FRT, '------------------------' VLR, '-----------' FUN, '---------------------' FIN       

EndSql
END REPORT QUERY oSec1

oSec1:Print(.T.)


BEGIN REPORT QUERY oSecMAP
	BeginSql alias "TRB01"           

	%noparser%	EXEC dbo.RGLT072 %exp:par01%

EndSql
END REPORT QUERY oSecMAP

oSecMAP:Print(.T.)



Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณCriaSX1     ณ Autor ณ Ariclenes M. Costa    ณ Data ณ 27/01/14 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณCria a pergunta que recebe o parametro					    ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ                                                              ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function CriaSX1(cPerg)

Local aHelpPor := {}
	Local aHelpSpa := {}
	Local aHelpEng := {}
	
	aHelpPor := {}
	Aadd( aHelpPor, 'Informe o Ano e o M๊s no seguinte formato:')
	Aadd( aHelpPor, ' ')
	Aadd( aHelpPor, 'Ano/M๊s     ex: 201401')
	U_xPutSx1(cPerg,"01","Mes"," "," ","mv_ch1","C" ,6,0,0,"G","NaoVazio()","","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return