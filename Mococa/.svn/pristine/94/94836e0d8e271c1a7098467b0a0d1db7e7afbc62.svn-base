#INCLUDE "PROTHEUS.CH"
#INCLUDE "REPORT.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "SHELL.CH"
#INCLUDE "FWPrintSetup.ch"        

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ RGLT076     บ Autor ณ Pedro Tobaruela Ortiz บ Data da Criacao  ณ 05/03/2014             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Relatorio Resumo Detalhado do Transportador por IE											                บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                        						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum					                                                                                  	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                       						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function RGLT076()

	Private cPerg := "RGLT076"
	
	Private oReport
	Private lInverte	:= .F.

	
	Private cMarca	:= GetMark()

	SetPrvt("oDlg","oSay")
	
	CriaSX1()
	
	Pergunte(cPerg,.T.,'Detalhado do Transportador por IE')
	
	sfPrint()
		
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณsfPrint   ณ Autor ณ Pedro Tobaruela Ortiz ณ Data ณ 05/03/14 ณฑฑ
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
ฑฑณFuncao    ณReportDef ณ Autor ณ Pedro Tobaruela Ortiz ณ Data ณ 05/03/14 ณฑฑ
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
	
	oReport := TReport():New("RGLT076","Detalhado do Transportador por IE",cPerg,{|oReport|PrintReport(oReport)},"Este relatorio ira imprimir as informa็๕es detalhadas do transportador por Inscri็ใo Estadual.")
	
	oReport:lParamPage	:= .F.
	oReport:lHeaderVisible := .F.
	oReport:lFooterVisible := .F.
	oReport:SetPortrait(.T.)
	oReport:nLineHeight	:= 45
	
Return oReport

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณPrintReport ณ Autor ณ Pedro Tobaruela Ortiz ณ Data ณ 05/03/14 บฑฑ
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
	Local oFont7 		:= TFont():New("COURIER NEW",07,07,,.F.,,,,.T.,.F.)
	Local oFont8 		:= TFont():New("COURIER NEW",08,08,,.F.,,,,.T.,.F.)
	Local oFont8N		:= TFont():New("COURIER NEW",08,08,,.T.,,,,.T.,.F.)
	Local oFont10 		:= TFont():New("COURIER NEW",10,10,,.F.,,,,.T.,.F.)
	Local oFont11 		:= TFont():New("COURIER NEW",11,11,,.F.,,,,.T.,.F.)
	Local oFont11N 		:= TFont():New("COURIER NEW",11,11,,.T.,,,,.T.,.F.)
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

	Local _cQuery := ""
	
	//Filtro Transportador
	Local _cPar01 := Alltrim(mv_par01)
	Local _cDescTr	:= POSICIONE("SA2",1,xFILIAL("SA2")+_cPar01,"A2_NOME")
	
	//Filtro Data
	Local _dDtIni := dtos(mv_par02)
	Local _dDtFim := dtos(mv_par03)

	//Variaveis Relatorio
	Local _cCodRec
	Local _cTransp         
	Local _lAjusta := .F.
	
	
	oReport:SkipLine(6)
	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)	

	oReport:SkipLine(1)

	//Criando Cabecalho
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	, "Detalhado do Transportador por IE" 		,oFont16N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.60	, "Perํodo de "  + DTOC(mv_par02) + " at้ "+ DTOC(mv_par03) 		,oFont14N)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	, _cPar01+" - "+_cDescTr 		,oFont12)
	oReport:SkipLine(2)

 
	_nAlignCod		:= 0.02  
	_nAlignNom		:= 0.09
	_nAlignPro		:= 0.41
	_nAlignIE		:= 0.61
	_nAlignVol		:= 0.73
	_nAlignCri		:= 0.83
	_nAlignSal		:= 0.93

	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignCod	, "Cod"     		,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignNom	, "Nome"			,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignPro	, "Propriedade"     ,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignIE	, "I.E."     		,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignVol	, "Coleta (L)"   	,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignCri	, "Criosc. (L)"  ,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignSal	, "Saldo (L)"     	,oFont11N)
	oReport:SkipLine(1)

    If _lAjusta
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	, "10"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.15	, "15"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.20	, "20"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25	, "25"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.30	, "30"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.35	, "35"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40	, "40"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.45	, "45"     		,oFont7)    
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.50	, "50"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.55	, "55"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.60	, "60"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.65	, "65"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.70	, "70"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.75	, "75"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.80	, "80"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.85	, "85"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.90	, "90"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.95	, "95"     		,oFont7)
		oReport:SkipLine(1)
		
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01	, "1"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	, "2"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.03	, "3"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.04	, "4"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.05	, "5"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.06	, "6"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.07	, "7"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.08	, "8"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.09	, "9"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	, "0"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.11	, "1"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.12	, "2"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.13	, "3"     		,oFont7) 
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.14	, "4"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.15	, "5"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.16	, "6"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.17	, "7"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.18	, "8"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.19	, "9"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.20	, "0"     		,oFont7) 
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.21	, "1"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.22	, "2"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.23	, "3"     		,oFont7) 
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.24	, "4"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25	, "5"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.26	, "6"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.27	, "7"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.28	, "8"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.29	, "9"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.30	, "0"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.31	, "1"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.32	, "2"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.33	, "3"     		,oFont7) 
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.34	, "4"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.35	, "5"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.36	, "6"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.37	, "7"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.38	, "8"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.39	, "9"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40	, "0"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.41	, "1"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.42	, "2"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.43	, "3"     		,oFont7) 
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.44	, "4"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.45	, "5"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.46	, "6"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.47	, "7"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.48	, "8"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.49	, "9"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.50	, "0"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.51	, "1"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.52	, "2"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.53	, "3"     		,oFont7) 
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.54	, "4"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.55	, "5"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.56	, "6"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.57	, "7"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.58	, "8"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.59	, "9"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.60	, "0"     		,oFont7)  
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.61	, "1"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62	, "2"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.63	, "3"     		,oFont7) 
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.64	, "4"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.65	, "5"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.66	, "6"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.67	, "7"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.68	, "8"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.69	, "9"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.70	, "0"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.71	, "1"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.72	, "2"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.73	, "3"     		,oFont7) 
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.74	, "4"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.75	, "5"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.76	, "6"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.77	, "7"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.78	, "8"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.79	, "9"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.80	, "0"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.81	, "1"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.82	, "2"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.83	, "3"     		,oFont7) 
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.84	, "4"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.85	, "5"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.86	, "6"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.87	, "7"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.88	, "8"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.89	, "9"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.90	, "0"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.91	, "1"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.92	, "2"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.93	, "3"     		,oFont7) 
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.94	, "4"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.95	, "5"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.96	, "6"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.97	, "7"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.98	, "8"     		,oFont7)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.99	, "9"     		,oFont7)
		oReport:SkipLine(1)                      
		
	EndIf



	_cQuery := " SELECT ZLD_RETIRO, ZLD_RETILJ, SUBSTRING(A2_NOME,1,36) A2_NOME, SUBSTRING(A2_L_FAZEN,1,24) A2_L_FAZEN "
	_cQuery += " , SUBSTRING(A2_INSCR,1,9)+'.'+SUBSTRING(A2_INSCR,10,2)+'-'+SUBSTRING(A2_INSCR,12,2) A2_INSCR "
	_cQuery += " , SUM(ZLD_QTDBOM+ZLD_QTDACI) QTD, 0 AGUA "
	_cQuery += " FROM "+RetSqlName("ZLD")+" (NOLOCK) ZLD "
	_cQuery += "  INNER JOIN "+RetSqlName("SA2")+" (NOLOCK) SA2 "
	_cQuery += "  ON (SA2.D_E_L_E_T_ = ' ' AND ZLD_FILIAL = A2_FILIAL AND ZLD_RETIRO = A2_COD AND ZLD_RETILJ = A2_LOJA) "

	_cQuery += " WHERE ZLD.D_E_L_E_T_ = ' ' "

	_cQuery += " GROUP BY ZLD_RETIRO, ZLD_RETILJ, A2_NOME, A2_L_FAZEN, A2_INSCR ORDER BY ZLD_RETIRO, ZLD_RETILJ	"  

		
	If Select ("RFT") <> 0
		RFT->(dbCloseArea())
	EndIf
	
	_cQuery := changeQuery(_cQuery)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery),"RFT",.F.,.T.)
	
	RFT->(dbGoTop())

	_nTotalVol		:= 0
	_nTotalSal 		:= 0

	
	While RFT->(!Eof())


		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignCod	, RFT->ZLD_RETIRO+"/"+RFT->ZLD_RETILJ					,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignNom	, RFT->A2_NOME											,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignPro	, RFT->A2_L_FAZEN										,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignIE	, RFT->A2_INSCR											,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignVol	, cValtochar(Transform(RFT->QTD,"@E 999,999,999"))		,oFont10)  
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignCri	, cValtochar(Transform(RFT->AGUA,"@E 999,999,999"))	,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignSal	, cValtochar(Transform(RFT->QTD,"@E 999,999,999"))		,oFont10)
		oReport:SkipLine(1)
		
		_nTotalVol		+= RFT->QTD
		_nTotalSal 		+= RFT->QTD

	
	RFT->(dbSkip())
			
	EndDo	
    
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignIE	, "TOTAL (L)"												,oFont10N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignVol	, cValtochar(Transform(_nTotalVol,"@E 999,999,999"))		,oFont10N)  
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignSal	, cValtochar(Transform(_nTotalSal,"@E 999,999,999"))		,oFont10N)
	oReport:SkipLine(1)   
	
	
	RFT->(DBCLOSEAREA())    



	_cQuery := " SELECT SUM(ZLW_KM) KM, CONVERT(DECIMAL(10,2),SUM(_TOTAL)) TOTAL FROM ( "
	_cQuery += " SELECT ZLD_TICKET, ZLW_KM "
	_cQuery += " ,  (COUNT(DISTINCT ZLD_CODTAN)*ZLI_VLPT) "
	_cQuery += " +(ZLW_KM*ZLI_VLKM) "
	_cQuery += " +(AVG(ZLD_TOTBOM)*ZLI_VLVOL) "
	_cQuery += " +(COUNT(DISTINCT ZLD_CODTAN)*ZLI_VLRELP/10*AVG(ZLD_NOTA)) _TOTAL "
	_cQuery += " FROM "+RetSqlName("ZLD")+" (NOLOCK) ZLD "
	_cQuery += " LEFT JOIN "+RetSqlName("ZLT")+" ZLT " 
	_cQuery += " ON (ZLT.D_E_L_E_T_ = ' ' AND ZLD_FILIAL = ZLT_FILIAL AND ZLD_RETIRO+ZLD_RETILJ = ZLT_SA2COD+ZLT_SA2LJ) "
	_cQuery += " LEFT JOIN "+RetSqlName("ZLW")+" ZLW "
	_cQuery += " ON (ZLW.D_E_L_E_T_ = ' ' AND ZLD_FILIAL = ZLW_FILIAL AND ZLD_LINROT = ZLW_COD "
	_cQuery += " 	 AND (ZLD_DTCOLE >= ZLW_DATINI AND (ZLD_DTCOLE <= ZLW_DATFIM OR ZLW_DATFIM = ''))) "
	_cQuery += " INNER JOIN "+RetSqlName("ZLI")+" ZLI "
	_cQuery += " ON (ZLI.D_E_L_E_T_ = ' ' AND ZLD_FILIAL = ZLI_FILIAL AND SUBSTRING(ZLD_DTCOLE,1,6) = ZLI_PERIOD) "
	_cQuery += " INNER JOIN "+RetSqlName("ZL4")+" ZL4 "
	_cQuery += " ON (ZL4.D_E_L_E_T_ = ' ' AND ZLD_FILIAL = ZL4_FILIAL AND ZLD_VEICUL = ZL4_COD) "
	_cQuery += " WHERE ZLD.D_E_L_E_T_ = ' ' "
	_cQuery += " AND ZLD_FRETIS = '"+_cPar01+"'  "
	_cQuery += " GROUP BY ZLD_TICKET, ZLW_KM, ZLI_VLKM, ZLI_VLVOL, ZLI_VLPT, ZLI_VLRELP "
	_cQuery += " ) TOTAIS "
	

		
	If Select ("RFU") <> 0
		RFU->(dbCloseArea())
	EndIf
	
	_cQuery := changeQuery(_cQuery)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery),"RFU",.F.,.T.)
	
	RFU->(dbGoTop())

	While RFU->(!Eof())
    
		oReport:SkipLine(1)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignIE	, "TOTAL (Km)"												,oFont10N)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignVol	, cValtochar(Transform(RFU->KM,"@E 999,999,999"))	   		,oFont10N)
		oReport:SkipLine(1)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignIE	, "TOTAL (R$)"												,oFont10N)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignVol	, cValtochar(Transform(RFU->TOTAL,"@E 999,999,999.99"))	   	,oFont10N)
		oReport:SkipLine(1)		  

	RFU->(dbSkip())
	EndDo
	RFU->(DBCLOSEAREA())    


	_cQuery := " SELECT A2_MUN, SUM(ZLD_QTDBOM+ZLD_QTDACI) QTD, 0 AGUA "
	_cQuery += " FROM "+RetSqlName("ZLD")+" (NOLOCK) ZLD "
	_cQuery += "  INNER JOIN "+RetSqlName("SA2")+" (NOLOCK) SA2 ON (SA2.D_E_L_E_T_ = ' ' AND ZLD_RETIRO = A2_COD AND ZLD_RETILJ = A2_LOJA) " 
	_cQuery += " WHERE ZLD.D_E_L_E_T_ = ' ' "
	_cQuery += " GROUP BY A2_MUN "
	_cQuery += " ORDER BY A2_MUN "

		
	If Select ("RFV") <> 0
		RFV->(dbCloseArea())
	EndIf
	
	_cQuery := changeQuery(_cQuery)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery),"RFV",.F.,.T.)
	
	RFV->(dbGoTop())

	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignCri	, "Municipio"	,oFont10N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignSal	, "Volume (L)"  	,oFont10N) 
	oReport:SkipLine(1)

	While RFV->(!Eof())
    
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignCri	, RFV->A2_MUN												,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignSal	, cValtochar(Transform(RFV->QTD,"@E 999,999,999"))	   		,oFont10)
		oReport:SkipLine(1)		  

	RFV->(dbSkip())
	EndDo
	RFV->(DBCLOSEAREA())    




	
	oReport:EndPage()
		
Return



/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ CriaSX1  บ Autor ณ Pedro T. Ortiz     บ Data ณ  05/03/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para criacao das perguntas caso elas nao existam.   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function CriaSX1()

	Local aHelpPor := {}
	Local aHelpSpa := {}
	Local aHelpEng := {}
	
	//Do Produtor
	aHelpPor := {}
	Aadd( aHelpPor, 'Informe o codigo do Transportador.   ')
	Aadd( aHelpPor, '.                      ')
	U_xPutSx1(cPerg,"01","Transportador"," "," ","mv_ch1","C",6,0,0,"G","","SA2_L1","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	
	//Data Inicial
	aHelpPor := {}
	Aadd( aHelpPor, 'Informe a data inicial para busca das')
	Aadd( aHelpPor, 'informa็๕es referentes ao fechamento ')
	Aadd( aHelpPor, 'do faturamento do transportador.     ')
	U_xPutSx1(cPerg,"02","Da Data: "," "," ","mv_ch2","D",8,0,0,"G",'NaoVazio()',"","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	
	//Data Final
	aHelpPor := {}
	Aadd( aHelpPor, 'Informe a data final para busca das  ')
	Aadd( aHelpPor, 'informa็๕es referentes ao fechamento ')
	Aadd( aHelpPor, 'do faturamento do transportador.     ')
	U_xPutSx1(cPerg,"03","Ate Data: "," "," ","mv_ch3","D",8,0,0,"G",'NaoVazio()',"","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
		
Return


