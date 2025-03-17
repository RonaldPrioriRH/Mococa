#include "totvs.ch"
#include "protheus.ch"
#include "topconn.ch" 
#INCLUDE "FWPrintSetup.ch"
#INCLUDE "RPTDEF.CH"

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT072	บ Autor ณ Ari / Pedro    		บ Data da Criacao  ณ 24/07/2014              						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Mapa de faturamento do Leite                                                                                 บฑฑ
ฑฑบ          ณ                                                                                                              บฑฑ
ฑฑบ          ณ                                                                                                              บฑฑ
ฑฑบ          ณ                                                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ COOPRATA - LEITE                                                  						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Mes, data inicial, data final		                                                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Relatorio Construido											                             					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite                                                                      						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function RGLT072()

	Local cPerg := "RGLT072"
	
	Private oReport
	Private _cSerieNF  := PADR(AllTrim(GETMV("LT_SERIE")),TamSx3("F1_PREFIXO")[1]) // Serie da NF
	SetPrvt("oDlg","oSay")
	
	CriaSX1(cPerg)
	
	Pergunte(cPerg,.T.,'Mapa de faturamento do Leite')   
	
	sfPrint()
		
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณsfPrint   ณ Autor ณ Ariclenes M. Costa    ณ Data ณ 27/01/14 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ                                                            ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function sfPrint()

	Local cPerg
	
	oReport := ReportDef(cPerg)
	oReport:PrintDialog()
		
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณReportDef ณ Autor ณ Pedro Tobaruela Ortiz ณ Data ณ 24/07/14 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ                                                            ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function ReportDef(cPerg)

	Private oReport,oSecZ0
	Private aTam := {}
	
	oReport := TReport():New("RGLT072","Mapa de faturamento do Leite ",cPerg,{|oReport|PrintReport(oReport)},"Este relatorio ira imprimir o Mapa de faturamento do Leite!")
		
	oReport:lParamPage	:= .F.
	oReport:lHeaderVisible := .F.
	oReport:lFooterVisible := .F.
	oReport:SetPortrait(.T.)
	oReport:nLineHeight	:= 45
	oReport:SetLandscape()

	
Return oReport

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณPrintReport ณ Autor ณ Pedro Tobaruela Ortiz ณ Data ณ 24/07/14 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ Responsavel por montar o relatorio                           ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ                                                              ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function PrintReport()
	
	//Declaracao das Fontes
	Local oFont8 		:= TFont():New("COURIER NEW",08,08,,.F.,,,,.T.,.F.)
	Local oFont8N		:= TFont():New("COURIER NEW",08,08,,.T.,,,,.T.,.F.)
	Local oFont10 		:= TFont():New("COURIER NEW",10,10,,.F.,,,,.T.,.F.)
	Local oFont10N		:= TFont():New("COURIER NEW",10,10,,.T.,,,,.T.,.F.)
	Local oFont10NS		:= TFont():New("COURIER NEW",10,10,,.T.,,,,.T.,.T.)
	Local oFont12 		:= TFont():New("COURIER NEW",12,12,,.F.,,,,.T.,.F.)
	Local oFont12N		:= TFont():New("COURIER NEW",12,12,,.T.,,,,.T.,.F.)
	Local oFont12NS		:= TFont():New("COURIER NEW",12,12,,.T.,,,,.T.,.T.)
	Local oFont14 		:= TFont():New("COURIER NEW",14,14,,.F.,,,,.T.,.F.)
	Local oFont14N		:= TFont():New("COURIER NEW",14,14,,.T.,,,,.T.,.F.)
	Local oFont16 		:= TFont():New("COURIER NEW",16,16,,.F.,,,,.T.,.F.)
	Local oFont16N		:= TFont():New("COURIER NEW",16,16,,.T.,,,,.T.,.F.)
	Local oFont16NS		:= TFont():New("COURIER NEW",16,16,,.T.,,,,.T.,.T.)
	
	
	Local nTamMax		:= oReport:PageWidth()- 50 //Tamanho mแximo da pแgina
	Local nTamMid		:= (oReport:PageWidth()/2) //Metade da pแgina
	Local nWrtMid		:= nTamMid + 10 //Impressใo de dados a partir do meio da pแgina
	
	Private	_nCota	:=	0
	Private	_nAcido	:=	0
	Private	_nUnit	:=	0
	Private	_nTotal	:=	0
	Private	_nCota2	:=	0
	Private	_nAcido2:=	0
	Private	_nQuali	:=	0
	Private	_nLeite	:=	0
	Private	_nFun	:=	0
	Private	_nFin	:=	0
	Private _nLiqu	:=	0
	Private _nCont	:= 	0
	Private _nPUnMe	:=	0
	Private _cMV01	:=	Substr(mv_par01,1,6)
	
	oReport:SkipLine(6)
	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)	

	oReport:SkipLine(1)

_cQry :="EXEC dbo.RGLT072 '"+_cMV01+"' "

	
	Private _cMes	:=	""
	
	If Substr(mv_par01,5,2) == "01"
		_cMes	:=	"Janeiro"
	ElseIf Substr(mv_par01,5,2) == "02"
		_cMes	:=	"Fevereiro"
	ElseIf Substr(mv_par01,5,2) == "03"
		_cMes	:=	"Marco"
	ElseIf Substr(mv_par01,5,2) == "04"
		_cMes	:=	"Abril"
	ElseIf Substr(mv_par01,5,2) == "05"
		_cMes	:=	"Maio"
	ElseIf Substr(mv_par01,5,2) == "06"
		_cMes	:=	"Junho"
	ElseIf Substr(mv_par01,5,2) == "07"
		_cMes	:=	"Julho"
	ElseIf Substr(mv_par01,5,2) == "08"
		_cMes	:=	"Agosto"                                	
	ElseIf Substr(mv_par01,5,2) == "09"
		_cMes	:=	"Setembro"
	ElseIf Substr(mv_par01,5,2) == "10"
		_cMes	:=	"Outubro"
	ElseIf Substr(mv_par01,5,2) == "11"
		_cMes	:=	"Novembro"
	ElseIf Substr(mv_par01,5,2) == "12"
    	_cMes	:=	"Dezembro"
    EndIf
	//Titulo do relatorio
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.28	, "Mapa de faturamento do Leite referente ao m๊s de " + _cMes +"/"+Substr(_cMV01,1,4) 		,oFont16NS)
	oReport:SkipLine(2)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.80	, DTOC(Date()) + " - " + Time()				 		,oFont10)
		
	oReport:SkipLine(4)
	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.015,"MATRICULA"				,oFont10N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.08,"QTD. DE LEITE"			,oFont10N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.20,"DESC. FRETE"			   		,oFont10N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.39,"VALOR DO LEITE"			,oFont10N)                               
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.59,"DESC. FUNRURAL"	   		,oFont10N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.76,"CONTA CORRENTE"			,oFont10N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.935,"LIQUIDO"					,oFont10N)
	oReport:SkipLine(1)
	//oReport:ThinLine()
	
	//Primeiro menu
	oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*4.5) //Matricula
	oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*10.5) //Quantidade Leite
	oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*19) //Fretes
	oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*36.5) //Valor do Leite
	oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*43.5) //Desconto FUNRURAL 
	oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*58.55) //Conta Corrente
	oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,nTamMax) //Liquido
	//oReport:ThinLine()

	
	//Segundo menu
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.09,"Cota"					,oFont10)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.125,"Acido"					,oFont10)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.19,"Unit"					,oFont10)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25,"Total"					,oFont10)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.32,"Cota"					,oFont10)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.38,"Acido"					,oFont10)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.43,"Qualidade"				,oFont10)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.51,"Leite+MG"				,oFont10)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.59,"Unit"					,oFont10)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.64,"Total"					,oFont10)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.71,"Deb Ant"					,oFont10)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.78,"Deb Mes"					,oFont10)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.86,"Cred Mes"				,oFont10)
	oReport:SkipLine(1)
	//oReport:ThinLine()

If Select ("TMP") <> 0
	TMP->(dbCloseArea())
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQry),"TMP",.F.,.T.)

TMP->(dbGoTop())
             
	While TMP->(!Eof())
			// _nValor := BuscaDebitos(SubsTr(TMP->MATRICULA,1,6))	
			// _nLiquido := TMP->VLR_LEITEMG - _nValor - TMP->FRT_TOTAL - TMP->VLR_FUNRURAL
			oReport:SkipLine(1)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.015,TMP->MATRICULA						,oFont10)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.075,cvaltochar(Transform(TMP->QTD_COTA,"@E 999,999"))			,oFont10)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.145,cvaltochar(TMP->QTD_ACIDO	)	   		,oFont10)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.19,cvaltochar(TMP->FRT_UNIT)		   	,oFont10)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.23,cvaltochar(Transform(TMP->FRT_TOTAL,"@E 999,999.99"))		   	,oFont10)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.30,cvaltochar(Transform(TMP->VLR_COTA,"@E 999,999.99"))		   	,oFont10)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.35,cvaltochar(Transform(TMP->VLR_ACIDO,"@E 999,999.99"))	   		,oFont10)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.42,cvaltochar(Transform(TMP->VLR_QUALIDADE,"@E 999,999.99"))		,oFont10)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.50,cvaltochar(Transform(TMP->VLR_LEITEMG,"@E 999,999.99"))		   	,oFont10)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.56,cvaltochar(Transform(TMP->FUN_TOTAL/TMP->VLR_LEITEMG*100,"@E 999,999.9"))		,oFont10)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.61,cvaltochar(Transform(TMP->FUN_TOTAL,"@E 9,999,999.99"))		,oFont10)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.69,cvaltochar(Transform(TMP->VLR_DEBANT,"@E 999,999.99"))			,oFont10)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.77,cvaltochar(Transform(TMP->VLR_DEB,"@E 999,999.99"))			,oFont10)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.85,cvaltochar(Transform(TMP->VLR_CRD,"@E 999,999.99"))			,oFont10)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.92,cvaltochar(Transform(TMP->VLR_LIQUIDO,"@E 9,999,999.99"))		,oFont10)
			
			//Totalizadores
			
			_nCota	:=	_nCota + TMP->QTD_COTA
			_nAcido	:=	_nAcido + TMP->QTD_ACIDO
			_nUnit	:=	_nUnit + TMP->FRT_UNIT
			_nTotal	:=	_nTotal + TMP->FRT_TOTAL
			_nCota2	:=	_nCota2 + TMP->VLR_COTA
			_nAcido2:= 	_nAcido2 + TMP->VLR_ACIDO	
			_nQuali	:=	_nQuali + TMP->VLR_QUALIDADE
			_nLeite	:=	_nLeite + TMP->VLR_LEITEMG
			_nFun	:=	_nFun + TMP->FUN_TOTAL
			_nFin	:=	_nFin + 0 //TMP->VLR_FINANCEIRO
			_nLiqu	:=	_nLiqu + TMP->VLR_LIQUIDO
		 	
			TMP->(dbSkip())
			
		
			If oReport:Row() >= oReport:PageHeight() - 200
		
				oReport:EndPage()
				oReport:StartPage()
				oReport:SkipLine(2)

				//Titulo do relatorio
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.28	, "Mapa de faturamento do Leite referente ao m๊s de " + _cMes +"/"+Substr(_cMV01,3,4)  		,oFont16NS)
				oReport:SkipLine(2)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.80	, DTOC(Date()) + " - " + Time()				 		,oFont10)
					
				oReport:SkipLine(5)
				

				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.015,"MATRICULA"				,oFont10N)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.08,"QTD. DE LEITE"			,oFont10N)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.20,"DESC. FRETE"			   	,oFont10N)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.39,"VALOR DO LEITE"			,oFont10N)                               
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.59,"DESC. FUNRURAL"	   		,oFont10N)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.76,"CONTA CORRENTE"			,oFont10N)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.935,"LIQUIDO"					,oFont10N)
				oReport:SkipLine(1)
				//oReport:ThinLine()

	
				//Primeiro menu
				oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*4.5) //Matricula
				oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*10.5) //Quantidade Leite
				oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*19) //Fretes
				oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*36.5) //Valor do Leite
				oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*43.5) //Desconto FUNRURAL 
				oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*58.55) //Conta Corrente
				oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,nTamMax) //Liquido
				//oReport:ThinLine()
			

                /*
				
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02,"Matricula"				,oFont10N)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10,"Quantidade de Leite"		,oFont10N)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.24,"Fretes"			   		,oFont10N)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.42,"Valor do leite"			,oFont10N)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.68,"Descontos"				,oFont10N)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.83,"Outros"					,oFont10N)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.90,"Liquido"					,oFont10N)
				oReport:SkipLine(1)
				//oReport:ThinLine()
				//Primeiro menu
				oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*6) //Matricula
				oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*14) //Quantidade Leite
				oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*22) //Fretes
				oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*43) //Valor do Leite
				oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*54) //Descontos 
				oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,50*59) //Outros
				oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01	,oReport:Row() + (6+35)*50,nTamMax) //Liquido
				//oReport:ThinLine()

				*/

		
				//Segundo menu
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.09,"Cota"					,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.125,"Acido"					,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.19,"Unit"					,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25,"Total"					,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.32,"Cota"					,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.38,"Acido"					,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.43,"Qualidade"				,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.51,"Leite+MG"				,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.59,"Unit"					,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.64,"Total"					,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.71,"Deb Ant"					,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.78,"Deb Mes"					,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.86,"Cred Mes"				,oFont10)
				oReport:SkipLine(1)
				//oReport:ThinLine()

				/*
				//Segundo menu
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10,"Cota"					,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.17,"Acido"					,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.22,"Unit"					,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.27,"Total"					,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.34,"Cota"					,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.41,"Acido"					,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.47,"Qualidade"				,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.55,"Leite+MG"				,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.65,"Funrural"				,oFont10)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.73,"Financeiro"				,oFont10)
				oReport:SkipLine(1)
				//oReport:ThinLine()

				*/

			EndIf
		
	EndDo
	
	_nPUnMe	:=	_nLeite	/ _nCota 
	
	//Imprimi Totalizadores
	oReport:SkipLine(5)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.34,"Preco unitแrio m้dio: R$" + cvaltochar(Transform(round(_nPUnMe,2),"@E 999,999,999.99"))							,oFont10N)
	oReport:SkipLine(3)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02,"Total->"							,oFont10N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.07,cvaltochar(Transform(round(_nCota,2),"@E 999,999,999,999"))				,oFont10)
//	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.17,cvaltochar(_nAcido)	   			,oFont10)
//	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.22,cvaltochar(Transform(round(_nUnit,2),"@E 999,999,999.99"))		   		,oFont10)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.21,cvaltochar(Transform(round(_nTotal,2),"@E 999,999,999.99"))		,oFont10)
//	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.33,cvaltochar(Transform(round(_nCota2,2),"@E 999,999,999.99"))		,oFont10)
//	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.37,cvaltochar(Transform(round(_nAcido2,2),"@E 999,999,999.99"))		,oFont10)
//	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.45,cvaltochar(Transform(round(_nQuali,2),"@E 999,999,999.99"))	   	,oFont10)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.48,cvaltochar(Transform(round(_nLeite,2),"@E 999,999,999.99"))		,oFont10)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.60,cvaltochar(Transform(round(_nFun,2),"@E 999,999,999.99"))		,oFont10)
//	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.71,cvaltochar(Transform(round(_nFin,2),"@E 999,999,999.99"))		,oFont10)
//	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.80,cvaltochar(Transform(0,"@E 999,999.99"))					,oFont10)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.91,cvaltochar(Transform(round(_nLiqu,2),"@E 999,999,999.99"))		,oFont10)	
	
	TMP->(DBCLOSEAREA())
	oReport:EndPage()

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