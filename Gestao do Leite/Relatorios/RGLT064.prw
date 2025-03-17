#INCLUDE "PROTHEUS.CH"
#INCLUDE "REPORT.CH"
#INCLUDE "TOPCONN.CH"
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ RGLT064     บ Autor ณ Ramon Teles           บ Data da Criacao  ณ 20/08/2013             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Relatorio Analise da Qualidade         														                บฑฑ
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
User Function RGLT064(_aToken)

	Private cPerg := "RGLT064"
	
	Private oReport
	Private lInverte	:= .F.   
	Private _lTotem
//	Private cMarca	:= GetMark()

	SetPrvt("oDlg","oSay")
	
		//Impressao Relatorio por Token
	If Empty(_aToken)
		CriaSX1()
		Pergunte(cPerg,.T.,'Relat๓rio Analise Qualidade')    
	Else            
		_lTotem		:= .T.
		mv_par01 	:= _aToken[1]
		mv_par02 	:= _aToken[2]
		mv_par03 	:= _aToken[3]	
		mv_par04 	:= _aToken[4]	
	EndIf
	
	sfPrint()
		
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณsfPrint   ณ Autor ณ Ramon Teles           ณ Data ณ 20/08/13 ณฑฑ
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
	//oReport:PrintDialog()

		
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณReportDef ณ Autor ณ Ramon Teles           ณ Data ณ 20/08/13 ณฑฑ
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
	
	oReport := TReport():New("RGLT064","Relat๓rio Analise Qualidade",cPerg,{|oReport|PrintReport(oReport)},"Este relatorio ira imprimir as informa็๕es da anแlise da qualidade.")
	
	oReport:lParamPage	:= .F.
	oReport:lHeaderVisible := .F.
	oReport:lFooterVisible := .F.
	If _lTOTEM   
		oReport:cPrinterName	:= ALLTRIM(GETMV("MV_C_PRINT"))//"PDFCreator"//"HP LaserJet M1530 MFP Series PCL 6 - COOPRATA" 
   		oReport:SetPreview(.F.)
		oReport:SetDevice(2)
   		oReport:SetEnvironment(2)  
		oReport:SetMsgPrint("Imprimindo...") 
	EndIf
	oReport:SetPortrait(.T.)
	oReport:nLineHeight	:= 45      
	oReport:Print(.F.)
	
Return oReport

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณPrintReport ณ Autor ณ Ramon Teles           ณ Data ณ 20/08/13 บฑฑ
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
	Local nWrtMid		:= nTamMid + 10 //Impressao de dados a partir do meio da pแgina

	Local _cQuery := ""
	Local _cLogo
	
	//Filtro Transportador
	Local _cPar01 := Alltrim(mv_par01)
	Local _cPar02 := Alltrim(mv_par02)
	
	//Filtro Data
	Local _dDtIni := dtos(mv_par03)
	Local _dDtFim := dtos(mv_par04)
		
	//Declaracoes Colunas
	Local _nTab01 := oReport:PageWidth() * 0.02
	Local _nTab02 := oReport:PageWidth() * 0.14
	Local _nTab03 := oReport:PageWidth() * 0.24
	Local _nTab04 := oReport:PageWidth() * 0.34
	Local _nTab05 := oReport:PageWidth() * 0.44
	Local _nTab06 := oReport:PageWidth() * 0.54
	Local _nTab07 := oReport:PageWidth() * 0.64
	Local _nTab08 := oReport:PageWidth() * 0.74
	Local _nTab09 := oReport:PageWidth() * 0.84
	
	//Declaracoes Variaveis
	Local _nEST	:= 0
	Local _nGOR := 0
	Local _nESD := 0
	Local _nCCS := 0
	Local _nPRT := 0
	Local _nLAC := 0
	Local _nALC := 0
	Local _nCBT	:= 0
	
	//Totalizadores
	Local _nTEST := 0
	Local _nTGOR := 0
	Local _nTESD := 0
	Local _nTCCS := 0
	Local _nTPRT := 0
	Local _nTLAC := 0
	Local _nTNU  := 0
	Local _nTCBT := 0
	
	Local _nCount := 0
	
	oReport:SkipLine(6)
	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)	

	oReport:SkipLine(1)
	
	DbSelectArea("SA2")
	DbSetOrder(1)
	DbSeek(xFilial("SA2")+mv_par01)

	//Criando Secao Cabecalho
	
	_cLogo := GetSrvProfString("StartPath","")+"lgrl01.bmp"

	oReport:SayBitmap(005,010,_cLogo,162,164)
	oReport:SkipLine(1)
	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.32	, "Relat๓rio Anแlise da Qualidade" 			,oFont16NS)
	oReport:SkipLine(2)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.05	, "Produtor: " + SA2->A2_NOME      		,oFont14N)
	oReport:SkipLine(1)
	IF SA2->A2_TIPO = "F"
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.05 , "CNPJ/CPF: " + Transform(AllTrim(SA2->A2_CGC),"@R 999.999.999-99")	 ,oFont12N)
	ELSE
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.05 , "CNPJ/CPF: " + Transform(AllTrim(SA2->A2_CGC),"@R 99.999.999/9999-99") ,oFont12N)
	ENDIF
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.05	, "Perํodo de "  + DTOC(mv_par03) + " at้ "+ DTOC(mv_par04) 		,oFont14N)
		
	DBCLOSEAREA("SA2")
		
	oReport:SkipLine(2)
	
	oReport:ThinLine()
	
	oReport:SkipLine(2)
	
	oReport:Say(oReport:Row(),_nTab01	, "Dt Anแlise" 			,oFont11)   
	oReport:Say(oReport:Row(),_nTab02	, "CBT(mil/ml)"     	,oFont11)
	oReport:Say(oReport:Row(),_nTab03	, "CCS(mil/ml)"     	,oFont11)
	oReport:Say(oReport:Row(),_nTab04	, "ESD(%)"		   		,oFont11)
	oReport:Say(oReport:Row(),_nTab05	, "EST(%)"		   		,oFont11)
	oReport:Say(oReport:Row(),_nTab06	, "GOR(%)"     			,oFont11)
	oReport:Say(oReport:Row(),_nTab07	, "LAC(%)"     			,oFont11)
	oReport:Say(oReport:Row(),_nTab08	, "PRT(%)"     			,oFont11) 
	oReport:Say(oReport:Row(),_nTab09	, "UREIA"     			,oFont11)
	
	
	_cQuery := " SELECT * "
	_cQuery += " FROM "+RetSqlName("ZLB")+" ZLB  "
	_cQuery += " WHERE " + RetSqlCond("ZLB") + " "
	_cQuery += " AND ZLB.ZLB_RETIRO = '"+_cPar01+"' "
	_cQuery += " AND ZLB.ZLB_RETILJ = '"+_cPar02+"' "
	_cQuery += " AND ZLB.ZLB_DATA BETWEEN '"+_dDtIni+"' AND '"+_dDtFim+"'"  
	_cQuery += " ORDER BY ZLB_DATA"  
	
		
	If Select ("TRB") <> 0
		TRB->(dbCloseArea())
	EndIf
	
	_cQuery := changeQuery(_cQuery)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery),"TRB",.F.,.T.)
	
	TRB->(dbGoTop())
	
	While TRB->(!Eof())	
	
		_dData := TRB->ZLB_DATA
		_nEST := 0
		_nGOR := 0
		_nESD := 0
		_nCCS := 0
		_nPRT := 0
		_nLAC := 0
		_nNU  := 0
		_nCBT := 0
		
		While TRB->(!Eof()) .And. _dData = TRB->ZLB_DATA
			
			If TRB->ZLB_TIPOFX =  Alltrim(GETMV("LT_ANACBT"))
				_nCBT += TRB->ZLB_VLRANA
			ElseIf TRB->ZLB_TIPOFX = Alltrim(GETMV("LT_ANACCS"))
				_nCCS += TRB->ZLB_VLRANA
			ElseIf TRB->ZLB_TIPOFX = Alltrim(GETMV("LT_ANAESD"))
				_nESD += TRB->ZLB_VLRANA
			ElseIf TRB->ZLB_TIPOFX = Alltrim(GETMV("LT_ANAEST"))
				_nEST += TRB->ZLB_VLRANA
			ElseIf TRB->ZLB_TIPOFX = Alltrim(GETMV("LT_ANAGORD"))
				_nGOR += TRB->ZLB_VLRANA
			ElseIf TRB->ZLB_TIPOFX = Alltrim(GETMV("LT_ANALAC"))
				_nLAC += TRB->ZLB_VLRANA  
			ElseIf TRB->ZLB_TIPOFX = Alltrim(GETMV("LT_ANAPROT"))
				_nPRT += TRB->ZLB_VLRANA 
			ElseIf TRB->ZLB_TIPOFX = Alltrim(GETMV("LT_ANAURE"))
				_nNU += TRB->ZLB_VLRANA
			EndIf
			
			TRB->(dbSkip())
			
		EndDo
		
		oReport:SkipLine(1)
		oReport:Say(oReport:Row(),_nTab01	, DTOC(STOD(_dData))	   						,oFont10)                                        
		oReport:Say(oReport:Row(),_nTab02	, cValtoChar(Transform(_nCBT,"@E 9999.99"))    	,oFont10)
		oReport:Say(oReport:Row(),_nTab03	, cValtoChar(Transform(_nCCS,"@E 9999.99"))     ,oFont10)
		oReport:Say(oReport:Row(),_nTab04	, cValtoChar(Transform(_nESD,"@E 9999.99"))  	,oFont10)					
		oReport:Say(oReport:Row(),_nTab05	, cValtoChar(Transform(_nEst,"@E 9999.99"))		,oFont10)
		oReport:Say(oReport:Row(),_nTab06	, cValtoChar(Transform(_nGOR,"@E 9999.99"))     	,oFont10)
		oReport:Say(oReport:Row(),_nTab07	, cValtoChar(Transform(_nLAC,"@E 9999.99"))		,oFont10)
		oReport:Say(oReport:Row(),_nTab08	, cValtoChar(Transform(_nPRT,"@E 9999.99"))		,oFont10)
		oReport:Say(oReport:Row(),_nTab09	, cValtoChar(Transform(_nNU,"@E 9999.99"))    	,oFont10)
		
		
		_nTEST += IIF(_nEst>0,_nEst,_nTEST)
		_nTGOR += IIF(_nGOR>0,_nGOR,_nTGOR)
		_nTESD += IIF(_nESD>0,_nESD,_nTESD)
		_nTCCS += IIF(_nCCS>0,_nCCS,_nTCCS)
		_nTPRT += IIF(_nPRT>0,_nPRT,_nTPRT)
		_nTLAC += IIF(_nLAC>0,_nLAC,_nTLAC)
		_nTNU  += IIF(_nNU>0,_nNU,_nTNU)
		_nTCBT += IIF(_nCBT>0,_nCBT,_nTCBT)
		
		_nCount += 1
	EndDo		
	
	//Totalizadores
	oReport:SkipLine(2)
	oReport:Say(oReport:Row(),_nTab01	, "M้dia"			,oFont11N) 
	oReport:Say(oReport:Row(),_nTab02	, cValtoChar(Transform(_nTCBT/_nCount,"@E 9999.99"))    ,oFont10N)
	oReport:Say(oReport:Row(),_nTab03	, cValtoChar(Transform(_nTCCS/_nCount,"@E 9999.99"))    	,oFont10N) 
	oReport:Say(oReport:Row(),_nTab04	, cValtoChar(Transform(_nTESD/_nCount,"@E 9999.99"))  	,oFont10N)
	oReport:Say(oReport:Row(),_nTab05	, cValtoChar(Transform(_nTEst/_nCount,"@E 9999.99"))		,oFont10N)
	oReport:Say(oReport:Row(),_nTab06	, cValtoChar(Transform(_nTGOR/_nCount,"@E 9999.99"))    	,oFont10N)
	oReport:Say(oReport:Row(),_nTab07	, cValtoChar(Transform(_nTLAC/_nCount,"@E 9999.99"))		,oFont10N)
	oReport:Say(oReport:Row(),_nTab08	, cValtoChar(Transform(_nTPRT/_nCount,"@E 9999.99"))		,oFont10N)
	oReport:Say(oReport:Row(),_nTab09	, cValtoChar(Transform(_nTNU/_nCount,"@E 9999.99"))    	,oFont10N)

	TRB->(DBCLOSEAREA())
	
Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ CriaSX1  บ Autor ณ Ramon Teles        บ Data ณ  20/08/13   บฑฑ
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
	Aadd( aHelpPor, 'Informe o codigo do Produtor.   	  ')
	U_xPutSx1(cPerg,"01","Produtor"," "," ","mv_ch1","C",6,0,0,"G","","SA2_L4","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	
	
	aHelpPor := {}
	Aadd( aHelpPor, 'Informe a loja do Produtor.  ')
	U_xPutSx1(cPerg,"02","Loja"," "," ","mv_ch2","C",2,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	
	//Data Inicial
	aHelpPor := {}
	Aadd( aHelpPor, 'Informe a data inicial para busca das')
	Aadd( aHelpPor, 'informa็๕es referentes a anแlise     ')
	Aadd( aHelpPor, 'da qualidade.   					  ')
	U_xPutSx1(cPerg,"03","Da Data: "," "," ","mv_ch3","D",8,0,0,"G",'NaoVazio()',"","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	
	//Data Final
	aHelpPor := {}
	Aadd( aHelpPor, 'Informe a data final para busca das  ')
	Aadd( aHelpPor, 'informa็๕es referentes a anแlise     ')
	Aadd( aHelpPor, 'da qualidade.   					  ')
	U_xPutSx1(cPerg,"04","Ate Data: "," "," ","mv_ch4","D",8,0,0,"G",'NaoVazio()',"","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
		
Return
