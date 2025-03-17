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
ฑฑบPrograma  ณ RGLT075     บ Autor ณ Pedro Tobaruela Ortiz บ Data da Criacao  ณ 14/08/2013             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Relatorio Detalhado do Transportador												                			บฑฑ
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
User Function RGLT075()

	Private cPerg := "RGLT075"
	
	Private oReport
	Private lInverte	:= .F.

	
	If Select("SX6") == 0
		lWeb := .T.
		RpcSetType(3)
		//Informar a empresa e filial correta para configurar o ambiente
		PREPARE ENVIRONMENT EMPRESA '01' FILIAL '010101'
	EndIf

	Private cMarca	:= GetMark()

	SetPrvt("oDlg","oSay")
	
	CriaSX1()
	
	Pergunte(cPerg,.T.,'Detalhado Transportador')
	
	sfPrint()
		
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณsfPrint   ณ Autor ณ Pedro Tobaruela Ortiz ณ Data ณ 14/08/13 ณฑฑ
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
ฑฑณFuncao    ณReportDef ณ Autor ณ Pedro Tobaruela Ortiz ณ Data ณ 14/08/13 ณฑฑ
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
	
	oReport := TReport():New("RGLT075","Relat๓rio Detalhado do Transportador",cPerg,{|oReport|PrintReport(oReport)},"Este relatorio ira imprimir as informa็๕es do fechamento do transportador.")
	
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
ฑฑณFuncao    ณPrintReport ณ Autor ณ Pedro Tobaruela Ortiz ณ Data ณ 14/08/13 บฑฑ
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
	Local oFont10N		:= TFont():New("COURIER NEW",10,10,,.T.,,,,.T.,.F.)
	Local oFont10NS		:= TFont():New("COURIER NEW",10,10,,.T.,,,,.T.,.T.)
	Local oFont11 		:= TFont():New("COURIER NEW",11,11,,.F.,,,,.T.,.F.)
	Local oFont11N 		:= TFont():New("COURIER NEW",11,11,,.T.,,,,.T.,.F.)
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
	
	//Declaracoes Colunas
	Local _nTab01 := oReport:PageWidth() * 0.02
	Local _nTab02 := oReport:PageWidth() * 0.08
	Local _nTab03 := oReport:PageWidth() * 0.25
	Local _nTab04 := oReport:PageWidth() * 0.30
	Local _nTab05 := oReport:PageWidth() * 0.40
	Local _nTab06 := oReport:PageWidth() * 0.50
	Local _nTab07 := oReport:PageWidth() * 0.60
	Local _nTab08 := oReport:PageWidth() * 0.70
	Local _nTab09 := oReport:PageWidth() * 0.80
	Local _nTab10 := oReport:PageWidth() * 0.90
	
	//Variaveis Relatorio
	Local _cCodRec
	Local _cTransp         
	Local _lAjusta := .T.
	
	
	oReport:SkipLine(6)
	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)	

	oReport:SkipLine(1)

	//Criando Cabecalho
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	, "Relat๓rio Detalhado do Transportador" 		,oFont16N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.60	, "Perํodo de "  + DTOC(mv_par02) + " at้ "+ DTOC(mv_par03) 		,oFont14N)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	, _cPar01+" - "+_cDescTr 		,oFont12)
	oReport:SkipLine(2)


 

               
	_nAlignDtc		:= 0.01
	_nAlignEqu		:= 0.06  
	_nAlignCap		:= 0.09 
	_nAlignOcp		:= 0.14
	_nAlignPco		:= 0.19
	// _nAlignTPco		:= 0.19
	_nAlignLin		:= 0.23
	_nAlignKm		:= 0.28
	_nAlignOck		:= 0.32
	// _nAlignTKm		:= 0.35
	_nAlignOcr		:= 0.36
	_nAlignVco		:= 0.42
	_nAlignVre		:= 0.48
	_nAlignDif		:= 0.54
	// _nAlignXXX		:= 0.58
	// _nAlignNot		:= 0.64
	// _nAlignVrp		:= 0.68
	// _nAlignTVrp		:= 0.72   
	_nAlignTot		:= 0.62
	_nAlignLKm		:= 0.69
	_nAlignRL		:= 0.75
	_nAlignRKm		:= 0.81
	_nAlignNot		:= 0.87

	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignDtc	, " Data"     				,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignEqu	, "ID"     					,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignCap	, "Cap."					,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignOcp	, "Ocup."					,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignPco	, "Ptos"     				,oFont11N)
	// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignTPco, "T.Ptos"     				,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignLin	, "Rota"   					,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignKm	, "Km"       				,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignOck	, "Ocor."      				,oFont11N)
	// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignTKm	, "T. Km"       			,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignOcr	, "Ocor."      				,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignVco	, " Vol."     				,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignVre	, " Vol."     				,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignDif	, "Dif" 					,oFont11N)
	// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignXXX	, "Tot. Vol." 				,oFont11N)
	// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignNot	, " " 						,oFont11N)
	// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignVrp	, " Rel." 					,oFont11N)
	// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignTVrp, "T. Rel." 				,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignTot	, "Total" 					,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignLKm	, " " 						,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignRL	, " " 						,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignRKm	, " " 						,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignNot	, " " 						,oFont11N)
	
	oReport:SkipLine(1)   
	
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignDtc	, ""     				,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignEqu	, "Eq."  			   		,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignCap	, "(L)"						,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignOcp	, "(%)"						,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignPco	, "Col."     				,oFont11N)
	// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignTPco, " (R$)"     				,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignLin	, ""   				   		,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignKm	, ""       					,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignOck	, "(Km)"      				,oFont11N)
	// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignTKm	, " (R$)"       				,oFont11N) 
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignOcr	, " (R$)"      				,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignVco	, "Coleta"     				,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignVre	, "Recep."     				,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignDif	, "(L)" 					,oFont11N)
	// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignXXX, "  (R$)" 						,oFont11N)
	// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignNot	, "Nota" 					,oFont11N)
	// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignVrp	, "Obtido" 					,oFont11N)
	// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignTVrp, " (R$)" 		  				,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignTot	, " (R$)" 						,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignLKm	, "L/Km" 					,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignRL	, "R$/L" 					,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignRKm	, "R$/Km" 					,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignNot	, "Nota" 					,oFont11N)
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

	_cQuery := " SELECT ZLD_FRETIS, ZLD_LJFRET, ZLD_TICKET, ZLD_VEICUL, CONVERT(INT,ZL4_NSERIE) ID_EQUIP, ZL4_CAPACI "
	_cQuery += " , COUNT(DISTINCT ZLD_CODTAN) PT_COLETA " 
	_cQuery += " , COUNT(DISTINCT ZLD_CODTAN)*ZLI_VLPT _TOTAL_PT " 
	_cQuery += " , CONVERT(INT,ZLD_LINROT) ZLD_LINROT, ZLW_KM, ZLW_KM*ZLI_VLKM _TOTAL_KM " 
	_cQuery += " , SUBSTRING(CONVERT(CHAR,CONVERT(DATE,ZLD_DTCOLE),103),1,6)+SUBSTRING(CONVERT(CHAR,CONVERT(DATE,ZLD_DTCOLE),103),9,2)  ZLD_DTCOLE "
	_cQuery += " , SUM(ZLD_QTDBOM) VOL_COLETA, AVG(ZLD_TOTBOM) VOL_RECEPCAO, AVG(ZLD_TOTBOM)*ZLI_VLVOL _TOTAL_VOL, AVG(ZLD_TOTBOM)-SUM(ZLD_QTDBOM) DIF "
	_cQuery += " , AVG(ZLD_NOTA) ZLD_NOTA, ZLI_VLRELP/10*AVG(ZLD_NOTA) _VLRELP_OBTIDO "
	_cQuery += " , COUNT(DISTINCT ZLD_CODTAN)*ZLI_VLRELP/10*AVG(ZLD_NOTA) _TOTAL_RELP_OBTIDO "
	_cQuery += " ,  (COUNT(DISTINCT ZLD_CODTAN)*ZLI_VLPT) "
	_cQuery += "   +(ZLW_KM*ZLI_VLKM)+ ISNULL(PAGAR,0) "
	_cQuery += "   +(AVG(ZLD_TOTBOM)*ZLI_VLVOL) "
	_cQuery += "   +(COUNT(DISTINCT ZLD_CODTAN)*ZLI_VLRELP/10*AVG(ZLD_NOTA)) _TOTAL "
	_cQuery += " , ROUND(AVG(ZLD_TOTBOM)/ZLW_KM,2) [_L_Km] "
	_cQuery += " ,  ROUND(((COUNT(DISTINCT ZLD_CODTAN)*ZLI_VLPT) "
	_cQuery += "   +(ZLW_KM*ZLI_VLKM)+ ISNULL(PAGAR,0) "
	_cQuery += "   +(AVG(ZLD_TOTBOM)*ZLI_VLVOL) "
	_cQuery += "   +(COUNT(DISTINCT ZLD_CODTAN)*ZLI_VLRELP/10*AVG(ZLD_NOTA)))/AVG(ZLD_TOTBOM),4) [_RS_L] "
	_cQuery += " ,  ROUND(((COUNT(DISTINCT ZLD_CODTAN)*ZLI_VLPT) "
	_cQuery += "   +(ZLW_KM*ZLI_VLKM)+ ISNULL(PAGAR,0) "
	_cQuery += "   +(AVG(ZLD_TOTBOM)*ZLI_VLVOL) "
	_cQuery += "   +(COUNT(DISTINCT ZLD_CODTAN)*ZLI_VLRELP/10*AVG(ZLD_NOTA)))/ZLW_KM,4) [_RS_Km] "
	_cQuery += " , ZLD_USER, ISNULL(KMRODADO,0) KMRODADO, ISNULL(PAGAR,0) PAGAR "
	_cQuery += " FROM "+RetSqlName("ZLD")+" ZLD "
//	_cQuery += "  LEFT JOIN "+RetSqlName("ZLT")+" ZLT "
//	_cQuery += "  ON (ZLT.D_E_L_E_T_ = ' ' AND ZLD_FILIAL = ZLT_FILIAL AND ZLD_RETIRO+ZLD_RETILJ = ZLT_SA2COD+ZLT_SA2LJ) "
	_cQuery += "  LEFT JOIN "+RetSqlName("ZLW")+" ZLW "
	_cQuery += "  ON (ZLW.D_E_L_E_T_ = ' '))) "
	_cQuery += "  INNER JOIN "+RetSqlName("ZLI")+" ZLI "
	_cQuery += "  ON (ZLI.D_E_L_E_T_ = ' ' AND ZLD_FILIAL = ZLI_FILIAL AND SUBSTRING(ZLD_DTCOLE,1,6) = ZLI_PERIOD) "
	_cQuery += "  INNER JOIN "+RetSqlName("ZL4")+" ZL4 "
	_cQuery += "  ON (ZL4.D_E_L_E_T_ = ' ' AND ZLD_FILIAL = ZL4_FILIAL AND ZLD_VEICUL = ZL4_COD) "   
	_cQuery += "	 LEFT JOIN (                                                                                                  				"
	_cQuery += " 		SELECT ZLC_TICKET, SUM(KMRODADO) KMRODADO, SUM(PAGAR) PAGAR FROM (                                                      "
	_cQuery += "		SELECT ZLC_TICKET, ZLC_FORPAG, ZLC_QTD, ZLC_VALOR, ZLH_FATOR                                                            "
	_cQuery += "		, CASE                                                                                                                  "
	_cQuery += "			WHEN ZLC_FORPAG = 'K' AND ZLH_FATOR = 'A' THEN ZLC_QTD                                                              "
	_cQuery += "			WHEN ZLC_FORPAG = 'K' AND ZLH_FATOR = 'D' THEN ZLC_QTD*-1                                                           "
	_cQuery += "			ELSE 0                                                                                                              "
	_cQuery += "			END AS KMRODADO                                                                                                     "
	_cQuery += "		, PAGAR = CASE ZLH_FATOR WHEN 'A' THEN ZLC_QTD*ZLC_VALOR ELSE ZLC_QTD*ZLC_VALOR*-1 END                                  "
	_cQuery += "		FROM "+RetSqlName("ZLC")+" ZLC                                                                                                         "
	_cQuery += "			INNER JOIN "+RetSqlName("ZLH")+" ZLH ON (ZLC_FILIAL = ZLH_FILIAL AND ZLH_COD = ZLC_CODZLH)                                         "
	_cQuery += "		WHERE ZLC.D_E_L_E_T_ = ' '                                                   "
	_cQuery += "		AND ZLC_DTCOLE BETWEEN '"+_dDtIni+"' AND '"+_dDtFim+"' AND ZLC_FRETIS = '"+_cPar01+"' AND ZLC_STATUS = 'A' AND ZLH_FINANC = 'S'    "
	_cQuery += "		) VALORES GROUP BY ZLC_TICKET) OCORRENCIAS                                                                              "
	_cQuery += " 	ON ZLD_TICKET = ZLC_TICKET                                                                                                  "
	_cQuery += " WHERE ZLD.D_E_L_E_T_ = ' '"
	_cQuery += " AND ZLD_FRETIS = '"+_cPar01+"' "
	_cQuery += " GROUP BY ZLD_FRETIS, ZLD_LJFRET, ZLD_TICKET, ZLD_VEICUL, ZL4_NSERIE, ZL4_CAPACI, ZLD_LINROT, ZLW_KM, ZLD_DTCOLE, ZLD_USER, ZLI_VLKM, ZLI_VLVOL, ZLI_VLPT, ZLI_VLRELP, KMRODADO, PAGAR  "
	_cQuery += " ORDER BY ZLD_FRETIS, ZLD_LJFRET, ZLD_DTCOLE, ZLD_TICKET, ZLD_LINROT "


	If Select ("RFT") <> 0
		RFT->(dbCloseArea())
	EndIf
	
	_cQuery := changeQuery(_cQuery)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery),"RFT",.F.,.T.)
	
	
	_nPT_COLETA		:= 0
	_nZLW_KM   		:= 0
	_nKMRODADO  	:= 0
	_nPAGAR    		:= 0
	_nVOL_COLETA   	:= 0  
	_nVOL_RECEPCAO  := 0 
	_nDIF  			:= 0
	_n_TOTAL		:= 0
	
	RFT->(dbGoTop())
	
		While RFT->(!Eof())

		_nPT_COLETA		+=	 RFT->PT_COLETA    
		_nZLW_KM   		+=	 RFT->ZLW_KM
		_nKMRODADO  	+=	 RFT->KMRODADO
		_nPAGAR    		+=	 RFT->PAGAR
		_nVOL_COLETA   	+=	 RFT->VOL_COLETA
		_nVOL_RECEPCAO  +=	 RFT->VOL_RECEPCAO
		_nDIF  			+=	 RFT->DIF
		_n_TOTAL		+=	 RFT->_TOTAL
	
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignDtc	, RFT->ZLD_DTCOLE  	,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignEqu	, cValtochar(Transform(RFT->ID_EQUIP,"@E 999"))     		,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignCap	, cValtochar(Transform(RFT->ZL4_CAPACI,"@E 99,999"))			,oFont10)  
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignOcp	, cValtochar(Transform(RFT->VOL_RECEPCAO/RFT->ZL4_CAPACI*100,"@E 999.9"))+"%" ,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignPco	, cValtochar(Transform(RFT->PT_COLETA,"@E 999"))     		,oFont10)
		// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignTPco, cValtochar(Transform(RFT->_TOTAL_PT,"@E 999.99"))     		,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignLin	,  cValtochar(Transform(RFT->ZLD_LINROT,"@E 9999"))   		,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignKm	, cValtochar(Transform(RFT->ZLW_KM,"@E 999"))       		,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignOck	, cValtochar(Transform(RFT->KMRODADO,"@E 999"))       		,oFont10)
		// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignTKm	, cValtochar(Transform(RFT->_TOTAL_KM,"@E 9,999.99"))       	,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignOcr	, cValtochar(Transform(RFT->PAGAR,"@E 9,999.99"))       	,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignVco	, cValtochar(Transform(RFT->VOL_COLETA,"@E 999,999"))     		,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignVre	, cValtochar(Transform(RFT->VOL_RECEPCAO,"@E 999,999"))     	,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignDif	, cValtochar(Transform(RFT->DIF,"@E 9,999")) 				,oFont10)
		// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignXXX, cValtochar(Transform(RFT->_TOTAL_VOL,"@E 9,999.99")) 			,oFont10)
		// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignVrp	, cValtochar(Transform(RFT->_VLRELP_OBTIDO,"@E 9.9999")) 		,oFont10)
		// oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignTVrp, cValtochar(Transform(RFT->_TOTAL_RELP_OBTIDO,"@E 9,999.99"))  ,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignTot	, cValtochar(Transform(RFT->_TOTAL,"@E 99,999.99")) 				,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignLKm	, cValtochar(Transform(RFT->_L_Km,"@E 999.99")) 				,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignRL	, cValtochar(Transform(RFT->_RS_L,"@E 9.9999"))				,oFont10)
		oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignRKm	, cValtochar(Transform(RFT->_RS_Km,"@E 9.99")) 				,oFont10)
	 	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignNot	, cValtochar(Transform(RFT->ZLD_NOTA,"@E 99.9")) 			,oFont10)
		
		
		oReport:SkipLine(1)
		

	
	RFT->(dbSkip())
			
	EndDo	

	
	RFT->(DBCLOSEAREA())     
	
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignPco	, cValtochar(Transform(_nPT_COLETA,"@E 999"))     		,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignKm	, cValtochar(Transform(_nZLW_KM,"@E 99,999"))       		,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignOck	, cValtochar(Transform(_nKMRODADO,"@E 99,999"))       		,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignOcr	, cValtochar(Transform(_nPAGAR,"@E 9,999.99"))       	,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignVco	, cValtochar(Transform(_nVOL_COLETA,"@E 999,999"))     		,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignVre	, cValtochar(Transform(_nVOL_RECEPCAO,"@E 999,999"))     	,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignDif	, cValtochar(Transform(_nDIF,"@E 9,999")) 				,oFont11N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignTot	, cValtochar(Transform(_n_TOTAL,"@E 99,999.99")) 				,oFont11N)
//	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignLKm	, cValtochar(Transform(RFT->_L_Km,"@E 999.99")) 				,oFont10)
//	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignRL	, cValtochar(Transform(RFT->_RS_L,"@E 9.9999"))				,oFont10)
//	oReport:Say(oReport:Row(),oReport:PageWidth() * _nAlignRKm	, cValtochar(Transform(RFT->_RS_Km,"@E 9.99")) 				,oFont10)
	
	
	
	oReport:SkipLine(1)
	
	
	
	
	
	
	
	
	
	
	
	oReport:EndPage()
		
Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ CriaSX1  บ Autor ณ Ramon Teles        บ Data ณ  14/08/13   บฑฑ
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


