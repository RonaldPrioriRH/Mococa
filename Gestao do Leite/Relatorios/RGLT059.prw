#INCLUDE "PROTHEUS.CH"
#INCLUDE "REPORT.CH"
#INCLUDE "TOPCONN.CH"

#DEFINE CRLF Chr(13)+Chr(10)     
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ RGLT059     บ Autor ณ TOTVS TM              บ Data da Criacao  ณ 08/08/2013             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Extrato Conta Corrente    																	                บฑฑ
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

User Function RGLT059(_aToken)

Private cPerg := "RGLT059"

Private _aResult := {}

Private oReport
Private lInverte 	:= .F.
Private _lTOTEM 		:= .F.
//	Private cMarca	:= GetMark()
Private _cSerieNF  := PADR(AllTrim(GETMV("LT_SERIE")),TamSx3("F1_PREFIXO")[1]) // Serie da NF
Private _cFreteLit := Rtrim(GetMv("LT_EVEDES"))
Private _cFunrural := Rtrim(GetMv("LT_EVEINSS"))
Private cDtHr 	:= DtoS(Date())+"-"+Substr(time(),1,2)+"-"+Substr(time(),4,2)+"-"+Substr(time(),7,2)
Private _aTit       := 		{{"PRODUTOR","EMISSAO","DOCPARCELA","FILIAL","VENCIMENTO","HISTORICO","DEBCRE","VALOR","CUSTOADM","TOTAL"}}

SetPrvt("oDlg","oSay")

//Impressao Relatorio por Token
If Empty(_aToken)
	CriaSX1()
	Pergunte(cPerg,.T.,'Relat๓rio Extrato Conta Corrente')
Else
	IF _aToken[3] == "S"
		_lTOTEM  := .T.
	ELSE
		_lTOTEM  := .F.
	ENDIF
	mv_par02 := _aToken[1]
	mv_par03 := _aToken[1]
	mv_par04 := _aToken[2]
	mv_par01 := IIf(SubStr(_aToken[1],1,1)=="C",1,2)
	mv_par05 := 2
EndIf

sfPrint()


//u_mGravaDados(_aResult,"RGLT059_SINTETICO"+mv_par04+"_"+cDtHr)
//u_mGravaDados(_aTit,"RGLT059_DETALHADO_"+mv_par04+"_"+cDtHr)


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณsfPrint   ณ Autor ณ Ramon Teles           ณ Data ณ 08/08/13 ณฑฑ
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
IF !_lTOTEM
	oReport:PrintDialog()
ENDIF


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณReportDef ณ Autor ณ Ramon Teles           ณ Data ณ 08/08/13 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ                                                            ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function ReportDef(cPerg)


oReport := TReport():New("RGLT059","Relat๓rio Extrato Conta Corrente",cPerg,{|oReport|PrintReport(oReport)},"Este relatorio irแ apresentar o extrato da conta corrente.")

oReport:lParamPage		:= .F.
oReport:lHeaderVisible 	:= .F.
oReport:lFooterVisible 	:= .F.

If _lTOTEM
	oReport:cPrinterName	:= ALLTRIM(GETMV("MV_C_PRINT"))//"PDFCreator"//"HP LaserJet M1530 MFP Series PCL 6 - COOPRATA"
	oReport:SetPreview(.F.)
	oReport:SetDevice(2)
	oReport:SetEnvironment(2)
	oReport:SetMsgPrint("Imprimindo... ")
	oReport:SetPortrait(.T.)
	oReport:nLineHeight	:= 45
	oReport:Print(.F.,,.T.)
ELSE
	oReport:SetPortrait(.T.)
	oReport:nLineHeight	:= 45
ENDIF

Return oReport
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณPrintReport ณ Autor ณ TOTVS TM              ณ Data ณ 00/00/14 บฑฑ
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
Local oFont12NI		:= TFont():New("COURIER NEW",12,12,,.T.,,,,.T.,.F.,.T.)
Local oFont14 		:= TFont():New("COURIER NEW",14,14,,.F.,,,,.T.,.F.)
Local oFont14N		:= TFont():New("COURIER NEW",14,14,,.T.,,,,.T.,.F.)
Local oFont16 		:= TFont():New("COURIER NEW",16,16,,.F.,,,,.T.,.F.)
Local oFont16N		:= TFont():New("COURIER NEW",16,16,,.T.,,,,.T.,.F.)
Local oFont16NS		:= TFont():New("COURIER NEW",16,16,,.T.,,,,.T.,.T.)

Local nTamMax		:= oReport:PageWidth()- 50 //Tamanho mแximo da pแgina
Local nTamMid		:= (oReport:PageWidth()/2) //Metade da pแgina
Local nWrtMid		:= nTamMid + 10 //Impressใo de dados a partir do meio da pแgina
Local _cMesAno   	:= Substr(mv_par04,1,2)
Local _cAno			:= Substr(mv_par04,3,4)
//Array com o valor total do Debito Meses Anteriores
Local _aDebMes := {}

//Array com os valores dos creditos do Cooperado
Local _aCred := {}
Local _aCreNCC := {}


//Totalizadores
Local _nTotTitFut := 0
Local cQuery := ""
Local _cQueryIn := ""
Local _nTotAcre := 0
Local _aJurBaixas := {}
Local _nEXTVALOR := 0

Private _cCoop := ""
Private _dIniVcto
Private _dFimVcto
Private _dDtEmiIni	:= CTOD("01/"+_cMesAno+"/"+_cAno)
Private _dDtEmiFim	:= LastDay(Ctod("01/"+_cMesAno+"/"+_cAno))
Private _nDiaVctoC  := Val(Alltrim(GetMV("LT_VENCTO"))) //Parametro que indica o dia de vencimento da NDF a ser debitada do cooperado
Private _nDiaVctoE  := Alltrim(strzero(GetMV("LT_VENFUNC"),2)) //Parametro que indica o dia de vencimento da NDF a ser debitada do funcionแrio
Private _nDiaVctoG  := Alltrim(strzero(GetMV("LT_VENTRAN"),2)) //Parametro que indica o dia de vencimento da NDF a ser debitada do transportador
Private _cDia := ""

Private _nVlDescont := 0
Private _nTVlrOrig  := 0
Private _nTotTitAtu := 0
Private _nValorTt   := 0
Private _nTotCoop   := 0

Private _dPriDMes	:= SubString(mv_par04,3,4)+SubString(mv_par04,1,2)+"01"
Private _dUltDMes	:= DTOS(LASTDAY(STOD(_dPriDMes)))

_dDtEmiIni := Dtos(_dDtEmiIni)
_dDtEmiFim := Dtos(_dDtEmiFim)

If mv_par01 == 1 //Cooperados
	_cDia := _nDiaVctoC
Else
	_cDia := _nDiaVctoG
EndIf
	
_dIniVcto := _cAno+_cMesAno+Soma1(_cDia) //"21"
_dFimVcto := MonthSum(STOD(_cAno+_cMesAno+_cDia),1)
_dFimVcto := DTOS(_dFimVcto)


/*
_cQueryIn := " SELECT A2_COD,SA2.A2_NOME AS NOME,SA2.A2_END AS ENDERECO,SA2.A2_BANCO AS BANCO, SA2.A2_AGENCIA AS AGENCIA, SA2.A2_NUMCON AS CONTA "
_cQueryIn += " FROM "+RetSqlName("SA2")+" SA2  "
_cQueryIn += " WHERE  A2_FILIAL = '      ' AND  SA2.D_E_L_E_T_ = ' '   AND SA2.A2_COD BETWEEN '"+mv_par02+"' AND '"+mv_par03+"' "
_cQueryIn += " AND ("
_cQueryIn += " (A2_LOJA = ( SELECT MIN(A2_LOJA) FROM "+RetSqlName("SA2")+" SA21 WHERE SA21.A2_COD = SA2.A2_COD AND SA21.A2_MSBLQL <> '1' )  "
_cQueryIn += " AND ( SELECT COUNT(*) FROM "+RetSqlName("SA2")+" SA21 WHERE SA21.A2_COD = SA2.A2_COD AND SA21.A2_MSBLQL <> '1' ) >= 1) OR "
_cQueryIn += " (A2_LOJA = ( SELECT MIN(A2_LOJA) FROM "+RetSqlName("SA2")+" SA21 WHERE SA21.A2_COD = SA2.A2_COD )  "
_cQueryIn += " AND ( SELECT COUNT(*) FROM "+RetSqlName("SA2")+" SA21 WHERE SA21.A2_COD = SA2.A2_COD AND SA21.A2_MSBLQL <> '1' ) = 0) "
_cQueryIn += " 	) "
_cQueryIn += " AND A2_COD IN ( "
_cQueryIn += " 	SELECT DISTINCT ZLF_RETIRO ZLF_A2COD FROM "+RetSqlName("ZLF")+" (NOLOCK) "
_cQueryIn += " 	WHERE D_E_L_E_T_ = ' ' "
_cQueryIn += " 	UNION "
_cQueryIn += " 	SELECT DISTINCT E2_FORNECE FROM "+RetSqlName("SE2")+" (NOLOCK) SE2    "
_cQueryIn += " 	WHERE SE2.D_E_L_E_T_ = ' ' "
_cQueryIn += " 	AND E2_VENCTO BETWEEN '"+_cAno+_cMesAno+"21'  AND CONVERT(CHAR,DATEADD(m, 1, CONVERT(DATE,'"+_cAno+_cMesAno+"20')),112)  "
_cQueryIn += "  AND E2_EMISSAO <= '"+_cAno+_cMesAno+"31' AND E2_PREFIXO <> '3' AND E2_PREFIXO <> 'CCH' AND E2_L_EVENT <> '100010' AND E2_L_EVENT <> ''  "
_cQueryIn += "  UNION "
_cQueryIn += "  SELECT DISTINCT ZLV_RETIRO FROM "+RetSqlName("ZLV")+" (NOLOCK) ZLV "
_cQueryIn += "  WHERE ZLV.D_E_L_E_T_ = ' ')),112)  "
_cQueryIn += "  AND ZLV_RETIRO BETWEEN '"+mv_par02+"' AND '"+mv_par03+"' "
_cQueryIn += "  ) ORDER BY 1"

If mv_par01 == 2 // Para transportadores filtra todos os registros independente da movimenta็ใo.
	_cQueryIn := " SELECT A2_COD,SA2.A2_NOME AS NOME,SA2.A2_END AS ENDERECO,SA2.A2_BANCO AS BANCO, SA2.A2_AGENCIA AS AGENCIA, SA2.A2_NUMCON AS CONTA "
	_cQueryIn += " FROM "+RetSqlName("SA2")+" SA2  "
	_cQueryIn += " WHERE  A2_FILIAL = '      ' AND  SA2.D_E_L_E_T_ = ' '   AND SA2.A2_COD BETWEEN '"+mv_par02+"' AND '"+mv_par03+"' "
	_cQueryIn += " AND ("
	_cQueryIn += " (A2_LOJA = ( SELECT MIN(A2_LOJA) FROM "+RetSqlName("SA2")+" SA21 WHERE SA21.A2_COD = SA2.A2_COD AND SA21.A2_MSBLQL <> '1' )  "
	_cQueryIn += " AND ( SELECT COUNT(*) FROM "+RetSqlName("SA2")+" SA21 WHERE SA21.A2_COD = SA2.A2_COD AND SA21.A2_MSBLQL <> '1' ) >= 1) OR "
	_cQueryIn += " (A2_LOJA = ( SELECT MIN(A2_LOJA) FROM "+RetSqlName("SA2")+" SA21 WHERE SA21.A2_COD = SA2.A2_COD )  "
	_cQueryIn += " AND ( SELECT COUNT(*) FROM "+RetSqlName("SA2")+" SA21 WHERE SA21.A2_COD = SA2.A2_COD AND SA21.A2_MSBLQL <> '1' ) = 0) "
	_cQueryIn += " 	) AND LEFT(A2_COD,1) = 'G' "
EndIf
*/


_cQueryIn :=" SELECT A2_COD,SA2.A2_NOME AS NOME, SA2.A2_END AS ENDERECO, SA2.A2_BANCO AS BANCO, SA2.A2_AGENCIA AS AGENCIA, SA2.A2_NUMCON AS CONTA "
_cQueryIn += " FROM "+RetSqlName("SA2")+" SA2"
If mv_par05 == 1 .and. SubStr(DtoS(DDataBase),1,6) <> _cAno+_cMesAno//Com Movimento - busca cooperados que tiveram movimenta็ใo, ou seja tem saldo na ZLV
	_cQueryIn += " 	JOIN "+RetSqlName("ZLV")+" ZLV ON ZLV_FILIAL = ''"
	_cQueryIn += " 	AND SUBSTRING(ZLV.ZLV_PERIOD,1,6) =  '"+_cAno+_cMesAno+"' "	
	_cQueryIn += " 	AND ZLV_RETIRO = SA2.A2_COD "
	_cQueryIn += " 	AND ZLV.D_E_L_E_T_ = ' '"
EndIf
_cQueryIn += " WHERE SA2.A2_FILIAL = ''"
If mv_par01 == 1 //Cooperados
	_cQueryIn += " AND LEFT(SA2.A2_COD,1) = 'P' "
Else //mv_par01 == 2 Transportadores
	_cQueryIn += " AND LEFT(SA2.A2_COD,1) = 'T' "
EndIf
_cQueryIn += " AND SA2.A2_COD BETWEEN '"+mv_par02+"' AND '"+mv_par03+"' "
_cQueryIn += " AND A2_LOJA = ( SELECT MIN(A2_LOJA) FROM SA2010 SA21 WHERE SA21.A2_FILIAL = '' AND SA21.D_E_L_E_T_ = ' ' AND SA21.A2_COD = SA2.A2_COD  ) "
_cQueryIn += " AND SA2.D_E_L_E_T_ = ' ' 
_cQueryIn += " ORDER  BY 1 "


If Select ("BSA") <> 0
	BSA->(dbCloseArea())
EndIf

_cQueryIn := changeQuery(_cQueryIn)

dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQueryIn),"BSA",.F.,.T.)

BSA->(dbGoTop())



While BSA->(!Eof())
	
	/*	If ASCAN(_aCod,{|x| ALLTRIM(x) == ALLTRIM(BSA->A2_COD)}) == 0
	BSA->(dbSkip())
	Loop
	EndIf
	*/
	_aDebMes   := {}
	//Busca Titulos dos meses anteriores
	_aDebMes := FGLT059(BSA->A2_COD)
	_lDebMesAnt := Len(_aDebMes) > 0
	
	
	oReport:StartPage()
	_cCoop := BSA->A2_COD

	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)
	'
	
	_nVlDescont	:= 0
	// CONSULTA DOS JUROS COBRADOS NA BAIXA DE TITULOS EM ATRASO
	_aJurBaixas := {}
	_aJurBaixas := JurBaixas()
	
	
	//Consulta para buscar informacoes
	//-- RETORNA OS TITULOS DENTRO DA REGRA GERAL (NDF A COBRAR NO MES)
	// REGRA GERAL SEM FATURAS
	cQuery := " SELECT E2_FILORIG FILIAL, E2_FORNECE FORNECE, E2_EMISSAO EMISSAO"
	cQuery += " , E2_NUM NUM"
	cQuery += " , E2_PARCELA PARCELA"
	cQuery += " , E2_VENCTO VENCTO"
	cQuery += " , UPPER(E2_HIST) HISTORICO, E2_PREFIXO PREFIXO"
	cQuery += " , E2_VALOR AS VALOR"
	cQuery += " , (E2_ACRESC - E2_DECRESC) AS ACRES"
	cQuery += " , (E2_SALDO+E2_SDACRES) AS SALDO"
	cQuery += " , CASE WHEN E2_BAIXA <> '' THEN E2_BAIXA ELSE '' END AS BAIXA"
	cQuery += " , E2_TIPO TIPO"
	cQuery += " , CASE WHEN E2_TIPO = 'NDF' THEN 'D' ELSE 'C' END AS DEBCRED"
	cQuery += " , E2_EMISSAO PRIORIDADE2, '2' PRIORIDADE1, 'REGRAGERAL' _QUERY"
	cQuery += " FROM "+RetSqlName("SE2")+" "
	cQuery += " WHERE E2_FILIAL = '"+xFilial("SE2")+"' "
	cQuery += " AND E2_PREFIXO NOT IN ('"+_cSerieNF+"','CCH')"
	cQuery += " AND E2_NUM >= '         '"
	cQuery += " AND E2_PARCELA >= ' '"
	cQuery += " AND E2_TIPO    >= ' '"
	cQuery += " AND E2_FORNECE = '"+_cCoop+"' "
	cQuery += " AND E2_LOJA >= ' '"
	cQuery += " AND E2_VENCTO BETWEEN '"+_dIniVcto+"' AND '"+_dFimVcto+"' "
	cQuery += " AND E2_EMISSAO <= '"+_dDtEmiFim+"' "
	cQuery += " AND (E2_PREFIXO+E2_TIPO <> 'GLENF')"
	cQuery += " AND E2_L_EVENT NOT IN ('100010','300001','300002')"
	cQuery += " AND E2_L_EVENT <> ''"
	cQuery += " AND ((E2_ORIGEM = 'FINA290' AND E2_EMISSAO <> E2_VENCTO) OR (E2_ORIGEM <> 'FINA290')) "
	cQuery += " AND D_E_L_E_T_ = ' ' "
	
	cQuery += RGExcept("1") // Trata excessao da regra geral. Retira faturas
	cQuery += RGExcept("2") // Trata excessao da regra geral. Retira titulos baixados por fatura.
	cQuery += RGExcept("3") // Trata excessao da regra geral. Retira titulos pagos com CH ou BOL em periodos anteriores
	cQuery += RGExcept("4") // Trata excessao da regra geral. Retira faturas geradas para serem tranferidas para o SE1
	
	cQuery += " UNION ALL"
	
	
	//-- RETORNA TRANSFERENCIAS DE DEBITOS (PARA QUEM TRANSFERIU E PARA QUEM HERDOU O DEBITO)
	cQuery += " SELECT  E2_FILORIG FILIAL, E2_FORNECE FORNECE, E2_EMISSAO EMISSAO"
	cQuery += " , E2_NUM NUM"
	cQuery += " , E2_PARCELA PARCELA"
	cQuery += " , E2_VENCTO VENCTO"
	cQuery += " , UPPER(E2_HIST) HISTORICO, E2_PREFIXO PREFIXO"
	cQuery += " , E2_VALOR AS VALOR"
	cQuery += " , E2_ACRESC AS ACRES"
	cQuery += " , (E2_SALDO+E2_SDACRES) AS SALDO"
	cQuery += " , CASE WHEN E2_BAIXA <> '' THEN E2_BAIXA ELSE '' END AS BAIXA"
	cQuery += " , E2_TIPO TIPO"
	cQuery += " , CASE WHEN E2_TIPO = 'NDF' THEN 'D' ELSE 'C' END AS DEBCRED"
	cQuery += " , E2_EMISSAO PRIORIDADE2, '2' PRIORIDADE1, 'TRANSDEB' _QUERY"
	cQuery += " FROM "+RetSqlName("SE2")+" WHERE E2_FILIAL = '"+xFilial("SE2")+"' AND E2_FORNECE = '"+_cCoop+"'"
	cQuery += " AND E2_EMISSAO BETWEEN '"+_dDtEmiIni+"' AND '"+_dDtEmiFim+"' "
	cQuery += " AND E2_L_EVENT = '100010' AND D_E_L_E_T_ = ' ' "
	
	cQuery += " UNION ALL"
	
	//-- RETORNA TRANSFERENCIAS DE DEBITOS (PARA QUEM TRANSFERIU E PARA QUEM HERDOU O DEBITO)
	//-- REALIZADAS APOS O FECHAMENTO DO LEITE, DENTRO DO MODULO FINANCEIRO
	cQuery += " SELECT  E5_FILORIG FILIAL, E5_CLIFOR FORNECE, E5_DATA EMISSAO"
	cQuery += " , E5_NUMERO NUM"
	cQuery += " , E5_PARCELA PARCELA"
	cQuery += " , E5_DATA VENCTO"
	cQuery += " , SUBSTRING(E5_DOCUMEN,18,6)+' '+UPPER(SUBSTRING(E5_HISTOR,1,20)) HISTORICO, '' PREFIXO "
	cQuery += " , SUM(CASE WHEN E5_TIPODOC <> 'ES' THEN E5_VALOR ELSE -E5_VALOR END) VALOR"
	cQuery += " , 0 AS ACRES"
	cQuery += " , 0 SALDO"
	cQuery += " , E5_DATA BAIXA"
	cQuery += " , E5_TIPO TIPO"
	cQuery += " , CASE WHEN E5_TIPO = 'NF' THEN 'D' ELSE 'C' END AS DEBCRED"
	cQuery += " , E5_DATA PRIORIDADE2, '2' PRIORIDADE1, 'COMPENSACOES-FIN' _QUERY"
	cQuery += " FROM "+RetSqlName("SE5")+" E5 "
	cQuery += " INNER JOIN "+RetSqlName("SE2")+" E2  "
	cQuery += " 	ON ( E2.E2_FILIAL = '"+xFilial("SE2")+"' "
	cQuery += " 	AND E5.E5_PREFIXO = E2.E2_PREFIXO "
	cQuery += " 	AND E5.E5_NUMERO = E2.E2_NUM "
	cQuery += " 	AND E5.E5_PARCELA = E2.E2_PARCELA  "
	cQuery += " 	AND E5.E5_CLIFOR = E2.E2_FORNECE "
	cQuery += " 	AND E5.E5_LOJA = E2.E2_LOJA "
	cQuery += " 	AND E5.E5_TIPO = E2.E2_TIPO "
	cQuery += " 	AND E2_L_EVENT <> '100010' AND E2_L_EVENT <> '' "
	cQuery += "     AND E2.E2_VENCTO <= '"+_dFimVcto+"' AND E2.D_E_L_E_T_ = ' ' ) "
	cQuery += " WHERE E5.E5_FILIAL = '"+xFilial("SE5")+"' "
	cQuery += " AND E5_DATA BETWEEN '"+_dDtEmiIni+"' AND '"+_dDtEmiFim+"' "
	cQuery += " AND E5.E5_MOTBX = 'CMP' AND E5_SITUACA <> 'C' AND E5_TIPODOC IN ('BA','VL','ES')"
	cQuery += " AND E5.E5_CLIFOR = '"+_cCoop+"'"
	cQuery += " AND SUBSTRING(E5.E5_DOCUMEN,1,3) <> 'GLT' "
	cQuery += " AND E5.D_E_L_E_T_ = ' '  "

	//Tratamento necessario para retirar a compensacao da nota de credito do Transportador Granel.
	//Este tratamento precisa ser revisto para o extrato novo
	//Vinicius Fernandes - 26/04/14
	IF SubStr(mv_par02,1,1) == "G"
		//	cQuery += "	AND SUBSTRING(E5_CLIFOR,1,1) <> 'G' "
		cQuery += "	AND SUBSTRING(E5_DOCUMEN,1,1) = 'G' "
	ENDIF
	cQuery += " GROUP BY E5_FILORIG, E5_CLIFOR, E5_DATA, E5_NUMERO, E5_PARCELA, E5_HISTOR, SUBSTRING(E5_DOCUMEN,18,6), E5_TIPO"
	
	cQuery += " UNION ALL"
	
	// -- CREDITOS DE RENEGOCIACOES COM CHEQUE - DENTRO DA ROTINA DE ACERTO DE DEBITOS -- ANTIGO CCH, DEIXOU DE EXISTIR A PARTIR DE MAIO/2014
	cQuery += " SELECT  E2.E2_FILORIG FILIAL, E2.E2_FORNECE FORNECE, E2.E2_EMISSAO EMISSAO "
	cQuery += " , E2.E2_NUM NUM "
	cQuery += " , (E2.E2_PARCELA) PARCELA "
	cQuery += " , (E2.E2_VENCTO) VENCTO "
	cQuery += " , 'PGTO COM CHEQUE ' HISTORICO, E2.E2_PREFIXO PREFIXO "
	cQuery += " , (E2.E2_VALOR) AS VALOR "
	cQuery += " , (CASE WHEN E2.E2_ACRESC >0 THEN E2.E2_ACRESC ELSE (CASE WHEN E2.E2_DECRESC >0 THEN -E2.E2_DECRESC ELSE 0 END) END) AS ACRES "
	cQuery += " , SUM(E2.E2_SALDO+E2.E2_SDACRES - E2.E2_SDDECRE) SALDO"
	cQuery += " , (E2.E2_BAIXA)  BAIXA"
	cQuery += " , E2.E2_TIPO TIPO"
	cQuery += " , 'C' AS DEBCRED"
	cQuery += " , E2.E2_EMISSAO PRIORIDADE2, '2' PRIORIDADE1, 'CRED-RENEG-C/CHQ' _QUERY"
	cQuery += " FROM "+RetSqlName("SE2")+" E2 "
	cQuery += " INNER JOIN "+RetSqlName("SE2")+" E2ORI "
	cQuery += "  ON (E2ORI.D_E_L_E_T_ = ' ' AND E2ORI.E2_FATPREF = E2.E2_PREFIXO "
	cQuery += " 						  AND E2ORI.E2_FATURA = E2.E2_NUM "
	cQuery += " 						  AND E2ORI.E2_PREFIXO <> 'CCH' "
	cQuery += " 						  AND E2ORI.E2_VENCTO <= '"+_dFimVcto+"' "
	//	cQuery += " 						  AND E2ORI.E2_DTFATUR <> E2.E2_EMISSAO  " //Alteracao 24/04/14 14:35 - resolucao do extrato 032014 C26255
	cQuery += " 						  )  "
	cQuery += " WHERE E2.D_E_L_E_T_ = ' '  "
	cQuery += " AND E2.E2_FORNECE =  '"+_cCoop+"'"
	cQuery += " AND E2.E2_TIPO = 'NDF' "
	cQuery += " AND E2.E2_EMISSAO BETWEEN '"+_dDtEmiIni+"' AND '"+_dDtEmiFim+"' "
	cQuery += " AND E2.E2_PREFIXO = 'CCH'  "
	cQuery += " GROUP BY E2.E2_FILORIG, E2.E2_FORNECE , E2.E2_EMISSAO , E2.E2_NUM, E2.E2_PREFIXO ,E2.E2_TIPO,		  E2.E2_PARCELA, "
	cQuery += " 		  E2.E2_VENCTO,"
	cQuery += " 		  E2.E2_PREFIXO, "
	cQuery += "           E2.E2_TIPO,
	cQuery += "       	  E2.E2_BAIXA,"
	cQuery += "        	  E2.E2_VALOR,  "
	cQuery += "        	  E2.E2_ACRESC,"
	cQuery += "        	  E2.E2_DECRESC "
	
	cQuery += " UNION ALL"
	
	// -- CREDITOS DE PAGAMENTO REALIZADOS NO MสS (EM DINHEIRO OU DEPOSITO OU PROMISSORIA) FORA DA ROTINA DE ACERTO DE DEBITOS
	cQuery += " SELECT  E5_FILORIG FILIAL, E5_CLIFOR FORNECE, E5_DATA EMISSAO "
	cQuery += " , E5_NUMERO NUM"
	cQuery += " , E5_PARCELA PARCELA"
	cQuery += " , E5_DATA VENCTO"
	cQuery += " , 'PAGAMENTO DEBITOS' HISTORICO, '' PREFIXO "
	cQuery += " , SUM(CASE WHEN E5_TIPODOC <> 'ES' THEN  E5_VALOR ELSE -E5_VALOR END ) VALOR "
	//	cQuery += " , SUM(CASE WHEN E5_TIPODOC <> 'ES' THEN (E5_VLJUROS - E5_VLDESCO) ELSE -(E5_VLJUROS - E5_VLDESCO) END) AS ACRES " alterado Guilherme 02/04/14 pois estava anulando a cobran็a de juros
	cQuery += " , 0 AS ACRES "
	cQuery += " , 0 SALDO"
	cQuery += " , E5_DATA BAIXA"
	cQuery += " , E5_TIPO TIPO"
	cQuery += " , 'C' AS DEBCRED"
	cQuery += " , E5_DATA PRIORIDADE2, '1' PRIORIDADE1, 'CRED-PGTOMES' _QUERY "
	cQuery += " FROM "+RetSqlName("SE5")+" SE5 "
	cQuery += " JOIN "+RetSqlName("SE2")+" SE2 "
	cQuery += " 	ON  SE2.E2_FILIAL      = SE5.E5_FILIAL"
	cQuery += " 	AND SE2.E2_PREFIXO     = SE5.E5_PREFIXO"
	cQuery += " 	AND SE2.E2_NUM         = SE5.E5_NUMERO"
	cQuery += " 	AND SE2.E2_PARCELA     = SE5.E5_PARCELA"
	cQuery += " 	AND SE2.E2_TIPO        = SE5.E5_TIPO"
	cQuery += " 	AND SE2.E2_FORNECE     = SE5.E5_CLIFOR"
	cQuery += " 	AND SE2.E2_LOJA        = SE5.E5_LOJA"
	cQuery += " 	AND SE2.E2_VENCTO      <= '"+_dFimVcto+"' "
//	cQuery += " 	AND SE2.E2_VENCTO      <> SE2.E2_EMISSAO "
	//	cQuery += " 	AND (SE2.E2_ORIGEM <> 'FINA290' OR SE2.E2_VENCTO <> SE2.E2_BAIXA) "
	cQuery += "  	AND SE2.E2_L_EVENT <> '' "
	cQuery += " 	AND SE2.D_E_L_E_T_ = ' '"
	cQuery += " WHERE SE5.E5_FILIAL = '"+xFilial("SE5")+"' "
	cQuery += " AND SE5.E5_DATA BETWEEN '"+_dDtEmiIni+"' AND '"+_dDtEmiFim+"' "
	cQuery += " AND SE5.E5_TIPODOC IN ('BA','VL','ES')"
	cQuery += " AND SE5.E5_SITUACA <> 'C' "
	cQuery += " AND SE5.E5_CLIFOR = '"+_cCoop+"'"
	cQuery += " AND SE5.E5_TIPO = 'NDF'"
	cQuery += " AND SE5.E5_MOTBX NOT IN ('CEC','CMP','GLT','FAT','GL1','GL2','CHQ','BOL') "
	//cQuery += " AND SE5.E5_MOTBX NOT EXISTS ('CEC','CMP','GLT','FAT','GL1','GL2','CHQ','BOL') "
	cQuery += " AND SE5.E5_PREFIXO <> 'CCH' "
	cQuery += " AND SE5.D_E_L_E_T_ = ' ' "
	cQuery += " GROUP BY E5_FILORIG, E5_NUMERO, E5_PARCELA, E5_CLIFOR, E5_DATA, E5_TIPO "
	
	cQuery += " UNION ALL"
	
	
	// -- CREDITOS DE TITULOS DO MES QUE FORAM PAGOS ANTECIPADOS EM OUTROS MESES. PAGAMENTO FORA DA ROTINA DE ACERTO DE DEBITOS
	cQuery += " SELECT  E5_FILORIG FILIAL, E5_CLIFOR FORNECE, E5_DATA EMISSAO "
	cQuery += " , E5_NUMERO NUM"
	cQuery += " , E5_PARCELA PARCELA"
	cQuery += " , E5_DATA VENCTO"
	cQuery += " , CASE WHEN SE5.E5_MOTBX IN ('CMP','CEC') THEN 'COMPENSAวรO ANTECIPADA' "
	cQuery += "  		ELSE 'PAGAMENTO ANTECIPADO' END AS HISTORICO  "
	cQuery += " , '' PREFIXO "
	cQuery += " , SUM(CASE WHEN E5_TIPODOC <> 'ES' THEN  E5_VALOR ELSE -E5_VALOR END ) VALOR "
	cQuery += " , SUM(CASE WHEN (E5_TIPODOC <> 'ES' AND E5_VLACRES>0) THEN  E5_VLACRES ELSE -E5_VLACRES END ) AS ACRES "
	cQuery += " , 0 SALDO"
	cQuery += " , E5_DATA BAIXA"
	cQuery += " , E5_TIPO TIPO"
	cQuery += " , 'C' AS DEBCRED"
	cQuery += " , E5_DATA PRIORIDADE2, '2' PRIORIDADE1, 'CRED-PG-ANTECIP' _QUERY "
	cQuery += " FROM "+RetSqlName("SE5")+" SE5 "
	cQuery += " JOIN "+RetSqlName("SE2")+" SE2 "
	cQuery += " 	ON  SE2.E2_FILIAL      = SE5.E5_FILIAL"
	cQuery += " 	AND SE2.E2_PREFIXO     = SE5.E5_PREFIXO"
	cQuery += " 	AND SE2.E2_NUM         = SE5.E5_NUMERO"
	cQuery += " 	AND SE2.E2_PARCELA     = SE5.E5_PARCELA"
	cQuery += " 	AND SE2.E2_TIPO        = SE5.E5_TIPO"
	cQuery += " 	AND SE2.E2_FORNECE     = SE5.E5_CLIFOR"
	cQuery += " 	AND SE2.E2_LOJA        = SE5.E5_LOJA"
	cQuery += " 	AND SE2.E2_VENCTO      = '"+_dFimVcto+"' "
	cQuery += "		AND SE2.E2_L_EVENT <> '' "
	cQuery += " 	AND SE2.E2_L_EVENT <> '100010' "	
	cQuery += "		AND SE2.D_E_L_E_T_ = ' '"
	cQuery += " WHERE SE5.E5_FILIAL = '"+xFilial("SE5")+"' "
	cQuery += " AND SE5.E5_DATA  < '"+_dDtEmiIni+"' "
	cQuery += " AND SE5.E5_TIPODOC IN ('BA','VL','ES')"
	cQuery += " AND SE5.E5_SITUACA <> 'C' "
	cQuery += " AND SE5.E5_CLIFOR = '"+_cCoop+"'"
	cQuery += " AND SE5.E5_TIPO = 'NDF'"
	cQuery += " AND SE5.E5_MOTBX NOT IN ('GLT','FAT','GL1','GL2','CHQ','BOL') "
	//cQuery += " AND SE5.E5_MOTBX NOT EXISTS ('GLT','FAT','GL1','GL2','CHQ','BOL') "
//	cQuery += " AND SE5.E5_MOTBX NOT IN ('CEC','CMP','GLT','FAT','GL1','GL2','CHQ','BOL') "
	cQuery += " AND SE5.E5_PREFIXO <> 'CCH' "
	cQuery += " AND SE5.D_E_L_E_T_ = ' ' "
	cQuery += " GROUP BY E5_FILORIG, E5_NUMERO, E5_PARCELA, E5_CLIFOR, E5_DATA, E5_TIPO, SE5.E5_MOTBX "
	
	cQuery += " UNION ALL"
	
	// -- JUROS E DESCONTOS GERADOS A PARTIR DOS PAGAMENTOS REALIZADOS DURANTE O MES
	cQuery += " SELECT  E5_FILORIG FILIAL, E5_CLIFOR FORNECE, E5_DATA EMISSAO "
	cQuery += " , E5_NUMERO NUM"
	cQuery += " , E5_PARCELA PARCELA"
	cQuery += " , E5_DATA VENCTO"
	cQuery += " , CASE WHEN ((E5_VLJUROS - E5_VLACRES) - E5_VLDESCO )>=0 THEN 'CUSTO ADM S/PGTO' ELSE  'DESCONTO S/PGTO' END AS HISTORICO "
	//	cQuery += " , CASE WHEN (E5_VLJUROS - E5_VLDESCO )>0 THEN 'CUSTO ADM S/PGTO' ELSE  'DESCONTO S/PGTO' END AS HISTORICO "
	cQuery += " , '' PREFIXO "
	cQuery += " ,SUM(CASE WHEN E5_TIPODOC <> 'ES' THEN "
	cQuery += " 			CASE WHEN E5_VLJUROS > E5_VLACRES THEN "
	cQuery += " 				CASE WHEN (E5_VLJUROS - E5_VLACRES ) >= E5_VLDESCO "
	cQuery += " 					THEN E5_VLJUROS - E5_VLACRES - E5_VLDESCO "
	cQuery += " 				ELSE E5_VLDESCO - (E5_VLJUROS - E5_VLACRES) "
	cQuery += " 				END "
	cQuery += " 			ELSE "
	cQuery += " 				CASE WHEN (E5_VLJUROS = E5_VLACRES) AND (E5_VLDESCO = 0) AND E5_PREFIXO <> 'GL2' THEN"
	cQuery += " 				 	CASE WHEN SE2.E2_EMISSAO = SE5.E5_DATA THEN E5_VLJUROS " //Faturas geradas para baixa a vista, mostra juros total
	cQuery += " 				 	ELSE  0 "//E5_VLJUROS " retorna zero pois o  acrescimo jแ tera sido mostrado na coluna Custo ADM
	cQuery += " 				 	END  "
	cQuery += " 				ELSE (E5_VLJUROS- E5_VLACRES) - E5_VLDESCO "
	cQuery += " 				END "
	cQuery += " 			END "
	cQuery += " 	   ELSE -((E5_VLJUROS - E5_VLACRES ) - (E5_VLDESCO ) ) "
	cQuery += " 	END) AS VALOR "
	cQuery += " , 0 AS ACRES "
	cQuery += " , 0 SALDO"
	cQuery += " , E5_DATA BAIXA"
	cQuery += " , E5_TIPO TIPO"
	cQuery += " , CASE WHEN ((E5_VLJUROS - E5_VLACRES)- E5_VLDESCO )>=0 THEN 'D' ELSE 'C' END AS DEBCRED"
	//	cQuery += " , CASE WHEN (E5_VLJUROS - E5_VLDESCO )>0 THEN 'D' ELSE 'C' END AS DEBCRED"
	cQuery += " , E5_DATA PRIORIDADE2, '1' PRIORIDADE1, 'JR/DC PGTOMES' _QUERY "
	cQuery += " FROM "+RetSqlName("SE5")+" SE5 "
	cQuery += " JOIN "+RetSqlName("SE2")+" SE2 "
	cQuery += " 	ON  SE2.E2_FILIAL      = SE5.E5_FILIAL"
	cQuery += " 	AND SE2.E2_PREFIXO     = SE5.E5_PREFIXO"
	cQuery += " 	AND SE2.E2_NUM         = SE5.E5_NUMERO"
	cQuery += " 	AND SE2.E2_PARCELA     = SE5.E5_PARCELA"
	cQuery += " 	AND SE2.E2_TIPO        = SE5.E5_TIPO"
	cQuery += " 	AND SE2.E2_FORNECE     = SE5.E5_CLIFOR"
	cQuery += " 	AND SE2.E2_LOJA        = SE5.E5_LOJA"
	cQuery += " 	AND SE2.E2_VENCTO      <= '"+_dFimVcto+"' "
	//	cQuery += " 	AND (SE2.E2_ORIGEM <> 'FINA290' OR SE2.E2_VENCTO <> SE2.E2_BAIXA) "
	cQuery += "		AND SE2.E2_L_EVENT <> '' "
	cQuery += "		AND SE2.D_E_L_E_T_ = ' '"
	cQuery += " WHERE SE5.E5_FILIAL = '"+xFilial("SE5")+"' "
	If Left(_cCoop,1)=='G' .and. mv_par04 == '082014'
		cQuery += " AND SE5.E5_DATA BETWEEN '"+_dDtEmiIni+"' AND '"+_dFimVcto+"' "	
	Else	
		cQuery += " AND SE5.E5_DATA BETWEEN '"+_dDtEmiIni+"' AND '"+_dDtEmiFim+"' "
	EndIf	
	cQuery += " AND SE5.E5_SITUACA <> 'C' "
	cQuery += " AND SE5.E5_CLIFOR = '"+_cCoop+"'"
	cQuery += " AND SE5.E5_TIPO = 'NDF'"
	If Left(_cCoop,1)=='G' .and. mv_par04 == '082014'
		cQuery += " AND SE5.E5_MOTBX NOT IN ('CMP','GLT','FAT','GL1','CHQ','BOL') "
		//cQuery += " AND SE5.E5_MOTBX NOT EXISTS ('CMP','GLT','FAT','GL1','CHQ','BOL') "
	Else
		cQuery += " AND SE5.E5_MOTBX NOT IN ('CMP','GLT','FAT','GL1','GL2','CHQ','BOL') "
		//cQuery += " AND SE5.E5_MOTBX NOT EXISTS ('CMP','GLT','FAT','GL1','GL2','CHQ','BOL') "
	EndIf
	cQuery += " AND SE5.E5_TIPODOC IN ('BA','VL','ES')"
	cQuery += " AND SE5.E5_PREFIXO <> 'CCH' "
	cQuery += " AND SE5.D_E_L_E_T_ = ' ' "
	cQuery += " GROUP BY E5_FILORIG, E5_NUMERO, E5_PARCELA, E5_CLIFOR, E5_DATA, E5_TIPO, E5_VLJUROS, E5_VLDESCO,E5_VLACRES,E5_VLDECRE "
/*	
	cQuery += " UNION ALL"
	
	// -- JUROS GERADOS NA COMPENSACAO DE DEBITOS (GL2) NO FECHAMENTO QUANDO O VALOR A COMPENSAO NรO CHEGA A COBRIR TODO O ACRESCIMO

// COMENTADO 04/11/14 - GUILHERME REVER!
	cQuery += " SELECT E5_FILORIG FILIAL, E5_CLIFOR FORNECE, E5_DATA EMISSAO, E5_NUMERO NUM, E5_PARCELA PARCELA, E5_DATA VENCTO, "
	cQuery += " 'CUSTO S/PGTO DEBITO'  AS HISTORICO, "
	cQuery += " E5_PREFIXO   PREFIXO, "
	cQuery += "        SUM(CASE "
	cQuery += "              WHEN E5_TIPODOC <> 'ES' THEN "
	cQuery += "                CASE "
	cQuery += "                  WHEN E5_VLJUROS < E2_ACRESC THEN "
	cQuery += "                      E5_VLJUROS "
	cQuery += "                  ELSE  0 END "
	cQuery += "              END )		AS VALOR, "
	cQuery += " 0      AS ACRES, "
	cQuery += " 0     SALDO, "
	cQuery += " E5_DATA         BAIXA, "
	cQuery += " E5_TIPO         TIPO, "
	cQuery += " 'D'     AS DEBCRED, "
	cQuery += " E5_DATA  PRIORIDADE2, "
	cQuery += " '0'    PRIORIDADE1, "
	cQuery += " 'JR-DE-GL2'  _QUERY "
	cQuery += " FROM   SE5010 SE5 "
	cQuery += "        JOIN SE2010 SE2 "
	cQuery += "          ON SE2.E2_FILIAL = SE5.E5_FILIAL "
	cQuery += "             AND SE2.E2_PREFIXO = SE5.E5_PREFIXO "
	cQuery += "             AND SE2.E2_NUM = SE5.E5_NUMERO "
	cQuery += "             AND SE2.E2_PARCELA = SE5.E5_PARCELA "
	cQuery += "             AND SE2.E2_TIPO = SE5.E5_TIPO "
	cQuery += "             AND SE2.E2_FORNECE = SE5.E5_CLIFOR "
	cQuery += "             AND SE2.E2_LOJA = SE5.E5_LOJA "
	cQuery += "             AND SE2.E2_VENCTO <= '"+_dFimVcto+"' "
	cQuery += "             AND SE2.E2_L_EVENT <> ''  "
	cQuery += "             AND SE2.D_E_L_E_T_ = ' ' "
	cQuery += " WHERE  SE5.E5_FILIAL = '      '   "
	cQuery += " AND SE5.E5_DATA BETWEEN '"+_dDtEmiIni+"' AND '"+_dDtEmiFim+"' "
	cQuery += " AND SE5.E5_SITUACA <> 'C' " 
	cQuery += " AND SE5.E5_CLIFOR =  '"+_cCoop+"'"
	cQuery += " AND SE5.E5_TIPO = 'NDF' "
	cQuery += " AND SE5.E5_MOTBX =  'GLT'  "
	cQuery += " AND SE5.E5_TIPODOC IN ('BA','VL','ES') "
	cQuery += " AND SE5.E5_PREFIXO = 'GL2' "
	cQuery += " AND SE5.D_E_L_E_T_ = ' ' "
	cQuery += " GROUP BY E5_FILORIG, E5_NUMERO,E5_PREFIXO, E5_PARCELA, E5_CLIFOR, E5_DATA, E5_TIPO, E5_VLJUROS, E5_VLDESCO,E5_VLACRES,E5_VLDECRE "
*/
	cQuery += ActDebitos() //Reparcelamento de debitos pela rotina de Acerto de D้bitos
	
	cQuery += Act_CH_BOL() //Pagamento de d้bitos com motivo de baixa CHQ e BOL
	
	cQuery += ActJurDesc() //Juros e descontos com motivo de baixa CHQ e BOL
	
	cQuery += CustoAdmDeb() //Custo adm do debito m๊s anterior (E2_ACRESC do tํtulo GL2)
	
	cQuery += RetNCC(_cCoop, "1") // Retorna NCC BAIXADAS
	
	cQuery += RetCEC(_cCoop) // Retorna compensa็ใo entre carteiras NDF com RA
	
	cQuery += TabZCC(_cCoop,mv_par04)
	
	cQuery += " ORDER BY PRIORIDADE1, PRIORIDADE2, NUM, PARCELA, HISTORICO "
	
	
	If Select("EXT") <> 0
		EXT->(dbCloseArea())
	EndIf
	
	//		cQuery := changeQuery(cQuery)
	
	
	_cAliasTMP := CriaTmp()
	
	TCSQLExec("INSERT INTO "+_cAliasTMP+" "+cQuery)
	cQryTMP := " SELECT * FROM " +_cAliasTMP
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,cQryTMP),"EXT",.F.,.T.)
	
	DropTMP(_cAliasTMP)
	
	dbSelectArea("EXT")
	EXT->(dbGoTop())
	
	Private _lImp := .F.
	
	_lImp := .T.
	
	_nTVlrOrig  := 0
	_nTotTitAtu := 0
	_nTotTitFut := 0
	_nTotCoop  := 0
	_nValorTt  := 0
	_aCred     := {}
	//	_nVlDescont	:= 0
	
	// _aDebMes   := {}
	// Busca Titulos dos meses anteriores
	// _aDebMes := FGLT059(_cCoop)
	
	//Busca Titulos
	_nTotTitFut := FGLT0591(_cCoop,_dFimVcto)
	
	//Titulo
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40	, "Extrato de Conta Corrente" 		,oFont16N)
	
	oReport:SkipLine(2)
	
	//Criando Secao do Faturamento
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01	, "Cooperado: " + _cCoop +" "+ BSA->NOME 		,oFont12N)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01	, "Endere็o:  " + BSA->ENDERECO  		,oFont12N)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01	, "Refer๊ncia: " + Substr(mv_par04,1,2)+"/"+Substr(mv_par04,3,4)  ,oFont12N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.30	, "Banco: " + BSA->BANCO	,oFont12N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.60	, "Ag๊ncia: " + BSA->AGENCIA 		,oFont12N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.80	, "Conta: " + BSA->CONTA 			,oFont12N)
	
	oReport:SkipLine(2)
	oReport:ThinLine()
	oReport:SkipLine(1)
	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)
	
	_nTotTitAtu += _aDebMes[1] + _aDebMes[2]
	_nVlDescont += _aDebMes[1] + _aDebMes[2]
	
	oReport:SkipLine(1)
	_nTotAcre := 0
	If EXT->(!Eof())  .or. _lDebMesAnt
		
		//Criando Colunas
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,"Emissใo"			,oFont12N)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.11,"Doc/Parcela"		,oFont12N)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.21,"Filial"			,oFont12N)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.28,"Vencimento"		,oFont12N)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.39,"Hist๓rico"		,oFont12N)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.67,"D/C"				,oFont12N)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.73,"Valor"			,oFont12N)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.80,"Custo ADM"  		,oFont12N)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.90,"Total"			,oFont12N)
		
		oReport:SkipLine(2)
		
		//Impressao do Debito mes anterior na primeira linha
		If Len(_aDebMes)>1
			If _aDebMes[1] > 0
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.28,DTOC(CTOD(_cDia+"/"+_cMesAno+"/"+_cAno)),oFont12)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.39,"DEBITOS MES ANTERIOR"			,oFont12)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.68, "D"			,oFont12)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.71,cValtoChar(Transform((_aDebMes[1]),"@E 999,999.99"))			,oFont12)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.78,cValtoChar(Transform((_aDebMes[2]),"@E 999,999.99"))			,oFont12)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.89,cValtoChar(Transform((_aDebMes[1]+_aDebMes[2]),"@E 999,999.99"))			,oFont12)
				
				oReport:SkipLine(1)
				aAdd(_aTit,{_cCoop,DTOC(CTOD(_cDia+"/"+_cMesAno+"/"+_cAno)),"" ,"" ,"" ,"DEBITOS MES ANTERIOR","D",Transform(_aDebMes[1],"@E 999,999.99"),Transform(_aDebMes[2],"@E 999,999.99"),Transform(_aDebMes[1]+_aDebMes[2],"@E 999,999.99")})

			EndIf
			_lDebMesAnt := .F.
		EndIf
		
		While EXT->(!Eof()) .AND. EXT->FORNECE == _cCoop
			
			If EXT->VALOR == 0
				EXT->(DbSkip())
				Loop
			EndIf
			
			If EXT->VALOR < 0
				_nEXTVALOR := EXT->VALOR * -1
			Else
				_nEXTVALOR := EXT->VALOR
			EndIf
			
			
			If oReport:Row() >= oReport:PageHeight() - 200
				
				oReport:EndPage()
				oReport:StartPage()
				
				PrintC()
				
			Else
				oReport:SkipLine(1)
			EndIf
			
			aAdd(_aTit,{_cCoop,DTOC(STOD(EXT->EMISSAO)),EXT->PREFIXO+EXT->NUM +"-" +EXT->PARCELA,FGLT0593(EXT->FILIAL),DTOC(STOD(EXT->VENCTO)),SUBSTRING(EXT->HISTORICO,1,32),EXT->DEBCRED , Transform(_nEXTVALOR,"@E 999,999.99"), Transform(EXT->ACRES,"@E 999,999.99"), Transform(_nEXTVALOR+EXT->ACRES,"@E 999,999.99")})
			

			
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,DTOC(STOD(EXT->EMISSAO))				,oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.11,EXT->NUM +"-" +EXT->PARCELA		,oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.22, FGLT0593(EXT->FILIAL)				,oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.28,DTOC(STOD(EXT->VENCTO))				,oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.39,SUBSTRING(EXT->HISTORICO,1,34)			,oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.68, EXT->DEBCRED			,oFont12)
			
			_lRGeral 	:= Alltrim(EXT->_QUERY) =='REGRAGERAL'
			_nVlrPago 	:= If(_lRGeral,RetVlrPg(EXT->PREFIXO, EXT->NUM, EXT->PARCELA, EXT->TIPO, EXT->FORNECE), _nEXTVALOR+EXT->ACRES)
			
			If ALLTRIM(EXT->DEBCRED	) == "D"
				//_nTotTitAtu := _nTotTitAtu + (_nEXTVALOR+EXT->ACRES)
				_nTVlrOrig  += _nEXTVALOR+EXT->ACRES
				_nTotTitAtu := _nTotTitAtu + _nVlrPago// - Iif(EXT->ACRES <0,EXT->ACRES,0)
				_nVlDescont += _nEXTVALOR+EXT->ACRES
			else //If ALLTRIM(EXT->DEBCRED) == "C"
				//_nTotTitAtu := _nTotTitAtu - (_nEXTVALOR+EXT->ACRES)
				_nTVlrOrig  -= _nEXTVALOR+EXT->ACRES
				_nTotTitAtu := _nTotTitAtu - _nVlrPago + Iif(EXT->ACRES <0,EXT->ACRES,0)
				_nVlDescont -= _nEXTVALOR+EXT->ACRES
			EndIf
			
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.71,cValtoChar(Transform((_nEXTVALOR),"@E 999,999.99"))			,oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.78,cValtoChar(Transform((EXT->ACRES),"@E 999,999.99"))			,oFont12)
			
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.89,cValtoChar(Transform((_nEXTVALOR+EXT->ACRES),"@E 999,999.99"))			,oFont12)
			//oReport:Say(oReport:Row(),oReport:PageWidth() * 0.89,cValtoChar(Transform(_nVlrPago,"@E 999,999.99"))			,oFont12)
			
			IF EXT->ACRES > 0
				_nPosAresc	:= ASCAN(_aJurBaixas,{|x| ALLTRIM(x[2]) == ALLTRIM(EXT->PREFIXO+EXT->NUM+EXT->PARCELA)})
				IF _nPosAresc > 0
					If _aJurBaixas[_nPosAresc][7] == 1 //Se foi incluido pela consulta de juros nos debitos anteriores
						_aJurBaixas[_nPosAresc][6]	:= ""
						_nVlDescont -= _aJurBaixas[_nPosAresc][5]
					EndIf
				ELSEIF ALLTRIM(EXT->DEBCRED) == "C"
					//AADD(_aJurBaixas,{_dFimVcto,EXT->PREFIXO+EXT->NUM+EXT->PARCELA,_dFimVcto,"CUSTO ADM DEB. MES",EXT->ACRES,"D",2})
				ENDIF
			ELSEIF EXT->ACRES < 0
				_nTotAcre += EXT->ACRES
			ENDIF
			//*********** faturados
			If Alltrim(EXT->_QUERY) $ "CRED-PGTOMES/COMPENSACOES-FIN/CRED-RENEG-C/CHQ/ACT_CH_BOL/ActDebitos_REN"
				//            If Alltrim(EXT->_QUERY) $ "CRED-PGTOMES/COMPENSACOES-FIN/CRED-RENEG-C/CHQ/ACT_CH_BOL"
				RetDebRng(EXT->NUM)
			EndIf
			
			EXT->(dbSkip())
			
		EndDo
	EndIf
	
	_nVlrAcres	:= _nTotAcre
	If Len(_aJurBaixas)>0
		FOR I:= 1 TO LEN(_aJurBaixas)
			IF !EMPTY(_aJurBaixas[I][6])
				_nVlrAcres	+= _aJurBaixas[I][5]
			ENDIF
		NEXT
	EndIf
	//Impressao de juros cobrados no m๊s de titulos baixados em atraso
	If _nVlrAcres > 0
		oReport:SkipLine(1)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,DTOC(STOD(_dFimVcto))				,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.11,""									,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.22, "LAT"								,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.28,DTOC(STOD(_dFimVcto))				,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.39,"CUSTO ADM DEB. MES"					,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.64, "D"									,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.68,cValtoChar(Transform(_nVlrAcres	,"@E 999,999.99"))			,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.78,cValtoChar(Transform(0			,"@E 999,999.99"))			,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.89,cValtoChar(Transform(_nVlrAcres	,"@E 999,999.99"))			,oFont12)
		oReport:SkipLine(1)
		_nTVlrOrig  += _nVlrAcres//_aJurBaixas[5]-_nTotAcre
		_nTotTitAtu := _nTotTitAtu + _nVlrAcres//_aJurBaixas[5]-_nTotAcre
		aAdd(_aTit,{_cCoop,DTOC(STOD(_dFimVcto)), "","LAT",DTOC(STOD(_dFimVcto)),"CUSTO ADM DEB. MES","D",Transform(_nVlrAcres	,"@E 999,999.99"),Transform(0			,"@E 999,999.99"),Transform(_nVlrAcres	,"@E 999,999.99")})

	EndIf
	
	oReport:SkipLine(1)
	oReport:ThinLine()
	
	//Seccao Resumo Cooperado
	If oReport:Row() >= oReport:PageHeight() - 220 //200
		oReport:EndPage()
		oReport:StartPage()
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)
	EndIf
	
	oReport:SkipLine(2)
	oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01,oReport:Row() + 190/*170*/,nTamMax)
	If SubStr(mv_par02,1,1) == "C"
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.42,"Resumo Cooperado"			,oFont14N)
	ElseIf SubStr(mv_par02,1,1) == "E"
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.42,"Resumo Funcionแrio"			,oFont14N)
	Else
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.42,"Resumo Transportador"			,oFont14N)
	EndIf
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02,"Em caso de d๚vida verifique no"			,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62,"Valor a Descontar no m๊s:"				,oFont12)
	_nTVlrOrig := _nTVlrOrig + _aDebMes[1]
	//	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.88,cValtoChar(Transform(_nTVlrOrig,"@E 999,999.99"))			,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.88,cValtoChar(Transform(_nVlDescont,"@E 999,999.99"))			,oFont12)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02,"local onde foi efetuada a compra."		,oFont12)
	//	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62,"Valor Descontado no m๊s:"				,oFont12)
	//	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.88,cValtoChar(Transform(_nTotTitAtu,"@E 999,999.99"))			,oFont12)
	//	oReport:SkipLine(1)
	aAdd(_aTit,{_cCoop,DTOC(STOD(_dFimVcto)), "","LAT",DTOC(STOD(_dFimVcto)),"Valor a Descontar no m๊s:","D",Transform(_nVlDescont	,"@E 999,999.99"),Transform(0			,"@E 999,999.99"),Transform(_nVlDescont	,"@E 999,999.99")})

	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62,"Valor de D้bitos Futuros:"        		,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.88,cValtoChar(Transform(_nTotTitFut,"@E 999,999.99"))			,oFont12)
	oReport:SkipLine(1)

	aAdd(_aTit,{_cCoop,DTOC(STOD(_dFimVcto)), "","LAT",DTOC(STOD(_dFimVcto)),"Valor de D้bitos Futuros:","D",Transform(_nTotTitFut	,"@E 999,999.99"),Transform(0			,"@E 999,999.99"),Transform(_nTotTitFut	,"@E 999,999.99")})	
	//Sessao Resumo do Faturamento somente para cooperado
	If SubStr(mv_par02,1,1) == "C" .OR. SubStr(mv_par02,1,1) == "G"
		
		_aCred := FGLT0592(_cCoop,_dIniVcto,_dFimVcto)
		
		If oReport:Row() >= oReport:PageHeight() - ((Len(_aCred)+1)*65)
			oReport:EndPage()
			oReport:StartPage()
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)
			oReport:SkipLine(2)
		EndIf
		oReport:SkipLine(2)
		
		oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01,oReport:Row() + ((Len(_aCred)+Len(_aCreNCC))*47) + 110,nTamMax)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.39,"Resumo do Faturamento"			,oFont14N)
		oReport:SkipLine(1)
		
		For _nX := 1 To Len(_aCred)
			
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02,"Faturamento da Propriedade: "+ _aCred[_nX,1]		,oFont12)
			
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.42,cValtoChar(Transform(_aCred[_nX,4],"@E 9,999,999"))+" litros",oFont12)
			
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62,"Credito da NF -> "+ _aCred[_nX,2]	,oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.86,cValtoChar(Transform(_aCred[_nX,3],"@E 9,999,999.99"))			,oFont12)
			_nTotCoop += _aCred[_nX,3]
			oReport:SkipLine(1)
			_cAuxHist := "Faturamento da Propriedade: "+ _aCred[_nX,1] + " Credito da NF -> "+ _aCred[_nX,2]
			aAdd(_aTit,{_cCoop,DTOC(CTOD(_cDia+"/"+_cMesAno+"/"+_cAno)),"" ,"" ,"" ,_cAuxHist,"C",Transform(_aCred[_nX,3],"@E 999,999.99"),Transform(0,"@E 999,999.99"),Transform(_aCred[_nX,3],"@E 999,999.99")})

		Next _nX
		If SubStr(mv_par02,1,1) == "C"
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62,"Total Cr้dito Cooperado: "	,oFont12)
		ELSE
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62,"Total Cr้dito Transportador: "	,oFont12)
		ENDIF
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.88,cValtoChar(Transform(_nTotCoop,"@E 999,999.99"))			,oFont12)
		oReport:SkipLine(2)
		
	EndIf
	
	oReport:SkipLine(1)
	
	//Seccao Resumo Final
	If oReport:Row() >= oReport:PageHeight() - 80
		oReport:EndPage()
		oReport:StartPage()
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)
		oReport:SkipLine(2)
	EndIf
	
	//	_nValorTt := if(_nTotTitAtu < _nTotCoop, _nTotCoop - _nTotTitAtu, _nTotCoop - _nTVlrOrig) //- _nTVlrOrig //_nTotTitAtu
	_nValorTt :=  _nTotCoop - _nVlDescont
	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)
	oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01,oReport:Row() + 120,nTamMax)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.43,"Resumo Final"			,oFont14N)
	oReport:SkipLine(1)
	If _nValorTt < 0
		aAdd(_aResult,{_cCoop,"D","Valor Devedor no M๊s: ", cValtoChar(Transform(_nValorTt*(-1),"@E 999,999.99")),time()})
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62,"Valor Devedor no M๊s: "			,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.88,cValtoChar(Transform(_nValorTt*(-1),"@E 999,999.99"))			,oFont12)
	Else
		aAdd(_aResult,{_cCoop,"C","Valor Credor no M๊s: ",cValtoChar(Transform(_nValorTt,"@E 999,999.99")),time()})
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62,"Valor Credor no M๊s: "			,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.88,cValtoChar(Transform(_nValorTt,"@E 999,999.99"))			,oFont12)
	EndIf
	aAdd(_aTit,{_cCoop,"","" ,"" ,"" ,_aResult[Len(_aResult)][3],_aResult[Len(_aResult)][2],_aResult[Len(_aResult)][4],Transform(0,"@E 999,999.99"),_aResult[Len(_aResult)][4]})
	
	
	If mv_par02 == mv_par03 .And. SUBSTR(DTOS(dDataBase),1,6) == _cAno+_cMesAno .and. Left(mv_par02,1) == 'C'
		
		_cQryLj := " SELECT COUNT(DISTINCT ZLD_RETILJ) QTDLJ  "
		_cQryLj += " FROM "+RetSqlName("ZLD")+" (NOLOCK)  "
		_cQryLj += " WHERE D_E_L_E_T_ = ' '   "
		_cQryLj += " AND ZLD_DTCOLE BETWEEN  '"+_cAno+_cMesAno+"01' AND '"+_cAno+_cMesAno+"31'  "
		_cQryLj += " AND ZLD_RETIRO = '"+mv_par02+"'  "
		
		If Select ("LJS") > 0
			LJS->(dbCloseArea())
		EndIf
		dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQryLj),"LJS",.F.,.T.)
		
		DbSelectArea("LJS")
		DbGoTop()
		While !LJS->(Eof())
			nQtdLj := LJS->QTDLJ
			LJS->(DbSkip())
		EndDo
		
		_cQryLj := " SELECT DISTINCT ZLD_RETILJ  "
		_cQryLj += " FROM "+RetSqlName("ZLD")+" (NOLOCK)  "
		_cQryLj += " WHERE D_E_L_E_T_ = ' '   "
		_cQryLj += " AND ZLD_DTCOLE BETWEEN  '"+_cAno+_cMesAno+"01' AND '"+_cAno+_cMesAno+"31'  "
		_cQryLj += " AND ZLD_RETIRO = '"+mv_par02+"'  ORDER BY 1"
		
		If Select ("LJS") > 0
			LJS->(dbCloseArea())
		EndIf
		dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQryLj),"LJS",.F.,.T.)
		
		oReport:SkipLine(3)
		// oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01,oReport:Row() + 120,nTamMax)
		oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01,oReport:Row() + (nQtdLj*47) + 210,nTamMax)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.37,"Proje็ใo do Valor do Leite",oFont12N)
		oReport:SkipLine(2)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10,"Propriedade",oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25,"Entrega (L)",oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40,"Proje็ใo (L)",oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.55,"Unitแrio R$/L",oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.70,"Valor Total",oFont12)
		
		DbSelectArea("LJS")
		DbGoTop()
		While !LJS->(Eof())
			
			// armazena codigo do setor do cooperado
			codSetor := Posicione("ZL3",1,xFILIAL("ZL3")+SA2->A2_L_LI_RO,"ZL3_SETOR")
			// posiciona na tabela de mix
			Posicione("ZLE",2,xFilial("ZLE")+_cAno+_cMesAno+'01',"ZLE_COD")
			// posiciona na tabela de setor
			Posicione("ZL2",1,xFILIAL("ZL2")+codSetor,"ZL2_DESCRI")
			
			volReal := U_VLeitePrj(mv_par02,LJS->ZLD_RETILJ,_cAno+_cMesAno,'R')
			volProj := U_VLeitePrj(mv_par02,LJS->ZLD_RETILJ,_cAno+_cMesAno,'P')
			vlrProj := U_VlrPrj(mv_par02,LJS->ZLD_RETILJ,_cAno+_cMesAno,'P')
			
			oReport:SkipLine(1)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10,LJS->ZLD_RETILJ,oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25,cvaltochar(Transform(volReal,"@E 999,999,999")),oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40,cvaltochar(Transform(volProj,"@E 999,999,999")),oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.55,cvaltochar(Transform(vlrProj,"@E 99.9999")),oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.70,(Transform(volProj*vlrProj,"@E 999,999,999.99")),oFont12)
			
			LJS->(DbSkip())
		EndDo
	EndIf
	
	
	
	
/*	Nใo ้ mais necessแrio pois agora ้ realizado fechamento do transportador.
	IF SUBSTR(_cCoop,1,1) == "G" //grava a ZLV do transportador
		GravZLV(_cCoop,_nValorTt,Substr(mv_par04,3,4)+Substr(mv_par04,1,2))
	ENDIF
*/	
	If _nValorTt < 0
		oReport:SkipLine(3)
		oReport:Box(oReport:Row(),oReport:PageWidth() * 0.01,oReport:Row() + 120,nTamMax)
		oReport:SkipLine(1)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02,"Obs.: D้bitos nใo quitados at้ o vencimento serใo acrescidos de juros no pr๓ximo fechamento de m๊s.",oFont12NI)
	EndIf
	
	MensagemExtra(_cCoop,nTamMax)
	
	
	
	oReport:EndPage()
	
	
	EXT->(DBCLOSEAREA())
	BSA->(dbSkip())
	If BSA->(Eof())
		_lDebMesAnt := .F.
	EndIf
	
EndDo

//BSA->(dbSkip())
oReport:EndPage()

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ RetEntid บ Autor ณ Ramon Teles        บ Data ณ  08/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para retornar o tipo da entidade. 				  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function RetEntid()

Local __cEnt

if mv_par01 == 1
	__cEnt := "Cooperado"
elseif mv_par01 == 2
	__cEnt := "Transp. Granel"
else
	__cEnt := "Todos"
endif

Return (__cEnt)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ActDebitos บAutor  ณGuilherme Fran็a    บ Data ณ  04/04/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao que retorna titulos pagos pela rotina de renegociacao.ฑ
ฑฑบ          ณ debito e credito.                                          บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ActDebitos()

Local _cQry := ""
Local _nVlrCred := 0
Local _dData := ""
Local _aFat := {}

_cQry += " SELECT E5.E5_DATA,E5.E5_VALOR,E5.E5_HISTOR, E5.E5_VLACRES, E5.E5_VLDECRE, E5.R_E_C_N_O_ E5_REC "
_cQry += " ,E2.E2_FATPREF FPREF"
//_cQry += " ,E2.E2_FATURA FNUM  " Quando o titulo ้ baixado com mais de uma fatura, fica gravado no E2_FATURA somente a ultima, portando o numero estแ sendo buscado do E5_HISTOR
_cQry += " ,SUBSTRING(E5.E5_HISTOR,16,9) FNUM"
_cQry += " FROM "+RetSqlName("SE5")+" E5 "
_cQry += " 	JOIN "+RetSqlName("SE2")+" E2 "
_cQry += " 	ON  E2.D_E_L_E_T_ = ' ' "
_cQry += " 	AND E5.E5_PREFIXO = E2.E2_PREFIXO "
_cQry += " 	AND E5.E5_NUMERO = E2.E2_NUM "
_cQry += " 	AND E5.E5_PARCELA = E2.E2_PARCELA "
_cQry += " 	AND E5.E5_CLIFOR = E2.E2_FORNECE "
_cQry += " 	   AND E2_FORNECE = '"+_cCoop+"' "
//_cQry += "        AND E2_VENCTO <= '"+_dFimVcto+"' "
_cQry += "        AND E2_EMISSAO <=  '"+_dDtEmiFim+"' "
_cQry += "        AND E2_PREFIXO <> 'CCH' "
_cQry += "        AND E2_TIPO = 'NDF' "
_cQry += "        AND E2_L_EVENT <> ' ' "
_cQry += "        AND E2_FATPREF = 'GLD' "
_cQry += "        AND E2_DTFATUR BETWEEN '"+_dDtEmiIni+"' AND  '"+_dDtEmiFim+"'"
_cQry += "    		LEFT JOIN "+RetSqlName("SE5")+" E5F "
_cQry += " 	   		ON E5F.D_E_L_E_T_ = ' ' "
_cQry += " 	   		AND E5F.E5_PREFIXO = E2.E2_FATPREF "
_cQry += " 			AND E5F.E5_NUMERO = E2.E2_FATURA "
_cQry += " 			AND E5F.E5_CLIFOR = E2.E2_FATFOR "
_cQry += " 			AND E5F.E5_LOJA = E2.E2_FATLOJ "
_cQry += " 			AND E5F.E5_SITUACA = '' "
_cQry += " 			AND E5F.E5_DATA <> E2.E2_DTFATUR "
_cQry += " WHERE E5.D_E_L_E_T_ = ' ' "
_cQry += " AND E5.E5_MOTBX = 'FAT' "
_cQry += " AND E5.E5_SITUACA = '' "
_cQry += " AND E5.E5_TIPODOC = 'BA' "
_cQry += " AND E5.E5_SITUACA = '' "
_cQry += " GROUP BY E5.E5_DATA,E5.E5_VALOR,E5.E5_HISTOR, E5.E5_VLACRES, E5.E5_VLDECRE,E5.R_E_C_N_O_,E2.E2_FATPREF, E2.E2_FATURA  "


If Select ("ACTD") <> 0
	ACTD->(dbCloseArea())
EndIf
_cQry := changeQuery(_cQry)
dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQry),"ACTD",.F.,.T.)
_nVlrCred := 0

DbSelectArea("ACTD")
DbGoTop()
_dData := ACTD->E5_DATA
While !ACTD->(Eof())
	_nVlrCred += ACTD->E5_VALOR
	_nPos := ASCAN(_aFat,{|x| ALLTRIM(x[1]) == ALLTRIM(ACTD->FNUM)})
	If _nPos > 0
		_aFat[_nPos][3] += ACTD->E5_VALOR
	Else
		AADD(_aFat,{ACTD->FNUM,ACTD->FPREF,ACTD->E5_VALOR})
	EndIf
	ACTD->(DbSkip())
EndDo

If Len(_aFat) > 0  // Verifica se a fatura jแ foi baixada, e a exclui desta sele็ใo pois as baixas jแ sao tratadas em outra query.
	For i:= 1 to Len(_aFat)
		_cQryf := "SELECT SUM(CASE WHEN E5_TIPODOC <> 'ES' THEN (E5_VALOR-E5_VLJUROS + E5_VLDESCO) ELSE -(E5_VALOR-E5_VLJUROS + E5_VLDESCO)  END ) VALOR  "
		_cQryf += " FROM "+RetSqlName("SE5")+" "
		_cQryf += " WHERE D_E_L_E_T_ = ' ' "
		_cQryf += " AND  E5_MOTBX NOT IN ('GLT') AND E5_TIPO = 'NDF' AND E5_DATA <= '"+_dDtEmiFim+"' AND E5_TIPODOC IN ('BA','VL','ES')  AND E5_SITUACA = '' "
		
		If Select ("ACTDF") <> 0
			ACTDF->(dbCloseArea())
		EndIf
		_cQryf := changeQuery(_cQryf)
		dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQryf),"ACTDF",.F.,.T.)
		
		DbSelectArea("ACTDF")
		DbGoTop()
		
		While !ACTDF->(Eof())
			If ACTDF->VALOR > 0
				//		    	_nVlrCred -= _aFat[i][3]
				_aFat[i][3] -= ACTDF->VALOR
			EndIf
			ACTDF->(DbSkip())
		EndDo
		ACTDF->(dbCloseArea())
	Next i
EndIf

ACTD->(dbCloseArea())

_cQry := ""
If Len(_aFat)>0
	For i:=1 to Len(_aFat)
		If _aFat[i][3] == 0
			Loop
		EndIf
		
		_cQry += " UNION ALL "
		_cQry += " SELECT '010101' FILIAL, '"+_cCoop+"' FORNECE, '"+_dData+"' EMISSAO"
		_cQry += " , '"+ _aFat[i][1]+"' NUM"
		_cQry += " , '00' PARCELA"
		_cQry += " , '"+_dData+"' VENCTO"
		_cQry += " , 'NEGOCIACAO DEBITOS' AS HISTORICO, 'GLT' PREFIXO"
		_cQry += " , "+cValToChar(_aFat[i][3])+" AS VALOR"
		_cQry += " , 0 AS ACRES"
		_cQry += " , 0 AS SALDO"
		_cQry += " , '"+_dFimVcto+"' AS BAIXA"
		_cQry += " , 'NF' TIPO"
		_cQry += " , 'C' AS DEBCRED"
		_cQry += " , '"+_dDtEmiIni+"' PRIORIDADE2, '1' PRIORIDADE1, 'ActDebitos_REN' _QUERY"
	Next i
EndIf


Return _cQry


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  Act_CH_BOL บAutor  ณGuilherme Fran็a    บ Data ณ  03/06/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao que retorna titulos pagos por boleto ou cheque      .ฑ
ฑฑบ          ณ 					                                          บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function Act_CH_BOL()

Local _cQry := ""
Local _aCreditos := {}
Local _nPos := 0
Local _aDebFut := {}

_cQry += " SELECT   "
_cQry += "  E5_NUMERO NUM"
_cQry += " , E5_PARCELA PARCELA"
_cQry += " , E5_DATA "
_cQry += " , SUM(CASE WHEN E5_TIPODOC <> 'ES' THEN  E5_VALOR ELSE -E5_VALOR END ) VALOR "
_cQry += " , E5_MOTBX MOTBX, SE2.E2_ORIGEM ORIGEM "
_cQry += " , E2_VENCTO VENCTO "
_cQry += " , E2_EMISSAO EMISSAO "
_cQry += " , E5_VLDESCO DESCONTO "
_cQry += " FROM "+RetSqlName("SE5")+" SE5 "
_cQry += " JOIN "+RetSqlName("SE2")+" SE2 "
_cQry += " 	ON  SE2.E2_FILIAL      = SE5.E5_FILIAL"
_cQry += " 	AND SE2.E2_PREFIXO     = SE5.E5_PREFIXO"
_cQry += " 	AND SE2.E2_NUM         = SE5.E5_NUMERO"
_cQry += " 	AND SE2.E2_PARCELA     = SE5.E5_PARCELA"
_cQry += " 	AND SE2.E2_TIPO        = SE5.E5_TIPO"
_cQry += " 	AND SE2.E2_FORNECE     = SE5.E5_CLIFOR"
_cQry += " 	AND SE2.E2_LOJA        = SE5.E5_LOJA"
_cQry += "  AND SE2.E2_L_EVENT <> '' "
_cQry += " AND SE2.D_E_L_E_T_ = ' '"
_cQry += " WHERE SE5.E5_FILIAL = '"+xFilial("SE5")+"' "
_cQry += " AND SE5.E5_DATA BETWEEN '"+_dDtEmiIni+"' AND '"+_dDtEmiFim+"' "
_cQry += " AND SE5.E5_TIPODOC IN ('BA','VL','ES')"
_cQry += " AND SE5.E5_SITUACA <> 'C' "
_cQry += " AND SE5.E5_CLIFOR = '"+_cCoop+"'"
_cQry += " AND SE5.E5_TIPO = 'NDF'"
_cQry += " AND SE5.E5_MOTBX IN ('CHQ','BOL') "
_cQry += " AND SE5.D_E_L_E_T_ = ' ' "
_cQry += " GROUP BY E5_NUMERO, E5_PARCELA, E5_DATA, E5_MOTBX, E2_ORIGEM,E2_VENCTO,E2_EMISSAO,E5_VLDESCO "


If Select ("CHBO") <> 0
	CHBO->(dbCloseArea())
EndIf
_cQry := changeQuery(_cQry)
dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQry),"CHBO",.F.,.T.)

DbSelectArea("CHBO")
DbGoTop()

While !CHBO->(Eof())
	If Alltrim(CHBO->ORIGEM) == 'FINA290'
		AADD(_aCreditos,{CHBO->MOTBX+CHBO->E5_DATA,CHBO->MOTBX,CHBO->VENCTO,CHBO->VALOR,CHBO->NUM,CHBO->PARCELA})
	Else
		_nPos := ASCAN(_aCreditos,{|x| ALLTRIM(x[1]) == ALLTRIM(CHBO->MOTBX+CHBO->E5_DATA)})
		If _nPos > 0
			_aCreditos[_nPos][4] += CHBO->VALOR
		Else
			AADD(_aCreditos,{CHBO->MOTBX+CHBO->E5_DATA,CHBO->MOTBX,CHBO->VENCTO,CHBO->VALOR,'000000000','00'})
		EndIf
	EndIf
    If (CHBO->VENCTO > _dFimVcto) .AND. (CHBO->EMISSAO <> CHBO->E5_DATA)
		AADD(_aDebFut,{CHBO->MOTBX+CHBO->E5_DATA,CHBO->MOTBX,CHBO->VENCTO,CHBO->VALOR+CHBO->DESCONTO,CHBO->NUM,CHBO->PARCELA,CHBO->EMISSAO})
	EndIf


	CHBO->(DbSkip())
EndDo

CHBO->(dbCloseArea())
_cQry := ""

If Len(_aCreditos) > 0
	For i:= 1 to Len(_aCreditos)
		_cQry += " UNION ALL "
		_cQry += " SELECT '010101' FILIAL, '"+_cCoop+"' FORNECE, '"+_aCreditos[i][3]+"' EMISSAO"
		_cQry += " , '"+_aCreditos[i][5]+"' NUM"
		_cQry += " , '"+_aCreditos[i][6]+"' PARCELA"
		_cQry += " , '"+_aCreditos[i][3]+"' VENCTO"
		If _aCreditos[i][2] == 'CHQ'
			_cQry += " , 'PGTO.C/CHEQUE  ' AS HISTORICO, 'GLT' PREFIXO"
		Else
			_cQry += " , 'PGTO.C/BOLETO' AS HISTORICO, 'GLT' PREFIXO"
		EndIf
		_cQry += " , "+cValToChar(_aCreditos[i][4])+" AS VALOR"
		_cQry += " , 0 AS ACRES"
		_cQry += " , 0 AS SALDO"
		_cQry += " , '"+_aCreditos[i][3]+"' AS BAIXA"
		_cQry += " , 'NF' TIPO"
		_cQry += " , 'C' AS DEBCRED"
		_cQry += " , '"+_dDtEmiIni+"' PRIORIDADE2, '0' PRIORIDADE1, 'ACT_CH_BOL' _QUERY"
	Next i
EndIf

//Apresenta parcelas futuras que foram pagas antecipadas com cheque ou boleto.
If Len(_aDebFut) > 0
	For i:= 1 to Len(_aDebFut)
		_cQry += " UNION ALL "
		_cQry += " SELECT '010101' FILIAL, '"+_cCoop+"' FORNECE, '"+_aDebFut[i][7]+"' EMISSAO"
		_cQry += " , '"+_aDebFut[i][5]+"' NUM"
		_cQry += " , '"+_aDebFut[i][6]+"' PARCELA"
		_cQry += " , '"+_aDebFut[i][3]+"' VENCTO"
		_cQry += " , 'PARCELA ANTECIPADA' AS HISTORICO, 'GLT' PREFIXO"
		_cQry += " , "+cValToChar(_aDebFut[i][4])+" AS VALOR"
		_cQry += " , 0 AS ACRES"
		_cQry += " , 0 AS SALDO"
		_cQry += " , '"+_aDebFut[i][3]+"' AS BAIXA"
		_cQry += " , 'NF' TIPO"
		_cQry += " , 'D' AS DEBCRED"
		_cQry += " , '"+_dDtEmiIni+"' PRIORIDADE2, '0' PRIORIDADE1, 'ACT_CH_BOL' _QUERY"
	Next i
EndIf


Return _cQry

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ActJurDesc บAutor  ณGuilherme Fran็a    บ Data ณ  03/06/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao que retorna juros e descontos dos titulos pagos     บฑฑ
ฑฑบ          ณ por boleto ou cheque.                                      บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ActJurDesc()

Local _cQry := ""
Local _nVlr := 0
Local _dData := ""
Local _aJurDesc := {}
Local _cDebCred := ""

_cQry += " SELECT   "
_cQry += "  E5_NUMERO NUM"
_cQry += " , E5_PARCELA PARCELA"
_cQry += " , E5_DATA "
_cQry += " ,SUM(CASE WHEN E5_TIPODOC <> 'ES' THEN "
_cQry += " 			CASE WHEN E5_VLJUROS > E5_VLACRES THEN "
_cQry += " 				CASE WHEN (E5_VLJUROS - E5_VLACRES ) >= E5_VLDESCO "
_cQry += " 					THEN E5_VLJUROS - E5_VLACRES - E5_VLDESCO "
_cQry += " 				ELSE E5_VLDESCO - (E5_VLJUROS - E5_VLACRES) "
_cQry += " 				END "
_cQry += " 			ELSE "
_cQry += " 				CASE WHEN (E5_VLJUROS = E5_VLACRES) AND (E5_VLDESCO = 0) AND E5_PREFIXO <> 'GL2'"
_cQry += " 					THEN E5_VLJUROS "
_cQry += " 				ELSE (E5_VLJUROS- E5_VLACRES) - E5_VLDESCO "
_cQry += " 				END "
_cQry += " 			END "
_cQry += " 	   ELSE -((E5_VLJUROS - E5_VLACRES ) - (E5_VLDESCO ) ) "
_cQry += " 	END) AS VALOR "
//_cQry += " , CASE WHEN ((E5_VLJUROS) - (E5_VLDESCO ))>0 THEN 'D' ELSE (CASE WHEN ((E5_VLJUROS) - (E5_VLDESCO ))< 0 THEN 'C' END) END AS DEBCRED"
//_cQry += " , CASE WHEN ((E5_VLJUROS - E5_VLACRES)- E5_VLDESCO )>0 THEN 'D' ELSE 'C' END AS DEBCRED"
//_cQry += " , CASE WHEN (E5_VLJUROS - E5_VLDESCO )>0 THEN 'D' ELSE 'C' END AS DEBCRED"
_cQry += " , E5_TIPO "
_cQry += " FROM "+RetSqlName("SE5")+" SE5 "
_cQry += " JOIN "+RetSqlName("SE2")+" SE2 "
_cQry += " 	ON  SE2.E2_FILIAL      = SE5.E5_FILIAL"
_cQry += " 	AND SE2.E2_PREFIXO     = SE5.E5_PREFIXO"
_cQry += " 	AND SE2.E2_NUM         = SE5.E5_NUMERO"
_cQry += " 	AND SE2.E2_PARCELA     = SE5.E5_PARCELA"
_cQry += " 	AND SE2.E2_TIPO        = SE5.E5_TIPO"
_cQry += " 	AND SE2.E2_FORNECE     = SE5.E5_CLIFOR"
_cQry += " 	AND SE2.E2_LOJA        = SE5.E5_LOJA"
_cQry += "  AND SE2.E2_L_EVENT <> '' "
_cQry += " AND SE2.D_E_L_E_T_ = ' '"
_cQry += " WHERE SE5.E5_FILIAL = '"+xFilial("SE5")+"' "
_cQry += " AND SE5.E5_DATA BETWEEN '"+_dDtEmiIni+"' AND '"+_dDtEmiFim+"' "
_cQry += " AND SE5.E5_TIPODOC IN ('BA','VL','ES')"
_cQry += " AND SE5.E5_SITUACA <> 'C' "
_cQry += " AND SE5.E5_CLIFOR = '"+_cCoop+"'"
_cQry += " AND SE5.E5_TIPO = 'NDF'"
_cQry += " AND SE5.E5_MOTBX IN ('CHQ','BOL') "
_cQry += " AND SE5.D_E_L_E_T_ = ' ' "
_cQry += " GROUP BY E5_NUMERO, E5_PARCELA, E5_DATA, E5_TIPO,E5_VLJUROS,E5_VLDESCO,E5_VLACRES "


If Select ("CHBO") <> 0
	CHBO->(dbCloseArea())
EndIf
_cQry := changeQuery(_cQry)
dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQry),"CHBO",.F.,.T.)
_nVlr := 0
_dData := ""

DbSelectArea("CHBO")
DbGoTop()

While !CHBO->(Eof())
	_cDebCred := IIF(CHBO->VALOR > 0,"D","C")
	_nPos := ASCAN(_aJurDesc,{|x| ALLTRIM(x[1]) == ALLTRIM(_cDebCred+CHBO->E5_DATA)})
	_nValor := If(CHBO->VALOR<0,CHBO->VALOR*-1,CHBO->VALOR)
	If _nPos > 0
		_aJurDesc[_nPos][4] += _nValor
	Else
		AADD(_aJurDesc,{_cDebCred+CHBO->E5_DATA,_cDebCred,CHBO->E5_DATA,_nValor,CHBO->E5_TIPO})
	EndIf
	CHBO->(DbSkip())
EndDo

CHBO->(dbCloseArea())
_cQry := ""

If Len(_aJurDesc)>0
	For i:= 1 to Len(_aJurDesc)
		_cQry += " UNION ALL "
		_cQry += " SELECT '010101' FILIAL, '"+_cCoop+"' FORNECE, '"+_aJurDesc[i][3]+"' EMISSAO"
		_cQry += " , '000000000' NUM"
		_cQry += " , '00' PARCELA"
		_cQry += " , '"+_aJurDesc[i][3]+"' VENCTO"
		If _aJurDesc[i][2] == "D"
			_cQry += " , 'CUSTO ADM S/PGTO' AS HISTORICO, 'GLT' PREFIXO"
		Else
			_cQry += " , 'DESCONTO S/PGTO' AS HISTORICO, 'GLT' PREFIXO"
		EndIf
		_cQry += " , "+cValToChar(_aJurDesc[i][4])+" AS VALOR"
		_cQry += " , 0 AS ACRES"
		_cQry += " , 0 AS SALDO"
		_cQry += " , '"+_dData+"' AS BAIXA"
		_cQry += " , '"+_aJurDesc[i][5]+"' TIPO"
		_cQry += " , '"+_aJurDesc[i][2]+"' AS DEBCRED"
		_cQry += " , '"+_dDtEmiIni+"' PRIORIDADE2, '1' PRIORIDADE1, 'ActJurDesc' _QUERY"
	Next i
EndIf


Return _cQry

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  CustoAdmDebบAutor  ณGuilherme Fran็a    บ Data ณ  03/06/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao que retorna E2_ACRESC do titulo de debito aglutinado.ฑ
ฑฑบ          ณ Prefixo GL2.		                                          บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function CustoAdmDeb()

Local _cQry := ""
Local _nVlr := 0
Local _dData := ""


_cQry += " SELECT E2_ACRESC VALOR FROM "+RetSqlName("SE2")
_cQry += " WHERE E2_FILIAL = '"+xFilial("SE2")+"' "
_cQry += " AND E2_PREFIXO = 'GL2' "
_cQry += " AND E2_FORNECE = '"+_cCoop+"' "
_cQry += " AND E2_EMISSAO =  '"+_dDtEmiFim+"' "
_cQry += " AND E2_VENCTO = '"+_dFimVcto+"' "
_cQry += " AND D_E_L_E_T_ = ' ' "
If Select ("CUST") <> 0
	CUST->(dbCloseArea())
EndIf
_cQry := changeQuery(_cQry)
dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQry),"CUST",.F.,.T.)
_nVlr := 0

DbSelectArea("CUST")
DbGoTop()
_cQry := ""
If !CUST->(Eof())
	_nVlr += CUST->VALOR
	_cQry := " UNION ALL "
	_cQry += " SELECT '010101' FILIAL, '"+_cCoop+"' FORNECE, '"+_dFimVcto+"' EMISSAO"
	_cQry += " , '000000000' NUM"
	_cQry += " , '00' PARCELA"
	_cQry += " , '"+_dFimVcto+"' VENCTO"
	_cQry += " , 'CUSTO ADM DEB. ANTERIOR' AS HISTORICO, 'GLT' PREFIXO"
	_cQry += " , "+cValToChar(_nVlr)+" AS VALOR"
	_cQry += " , 0 AS ACRES"
	_cQry += " , 0 AS SALDO"
	_cQry += " , '"+_dFimVcto+"' AS BAIXA"
	_cQry += " , 'NF' TIPO"
	_cQry += " , 'D' AS DEBCRED"
	_cQry += " , '"+_dDtEmiIni+"' PRIORIDADE2, '0' PRIORIDADE1, 'CustoAdmDeb' _QUERY"
	
EndIf

DbCloseArea("CUST")

Return _cQry



/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ FGLT059  บ Autor ณ Ramon Teles        บ Data ณ  08/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para retornar o valor total dos debitos			  บฑฑ
ฑฑบ          ณ do meses anteriores.                                       บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function FGLT059(_cFor)


Local _cQuery2 := ""
Local _nValor 	:= 0
Local _aRet 		:= {}
Local _cPeriodo := SubStr(DTOS(MonthSub(STOD(_dDtEmiIni),1)),1,6)

_cQuery2 := " SELECT ZLV_SALDO VALOR FROM "+RetSqlName("ZLV")+"    				"
_cQuery2 += " WHERE ZLV_FILIAL = ''    "
//_cQuery2 += " AND ZLV_PERIOD = SUBSTRING(CONVERT(CHAR,DATEADD(m,-1,CONVERT(DATE,'"+_dDtEmiIni+"')),112),1,6)   "
_cQuery2 += " AND ZLV_PERIOD = '"+_cPeriodo+"'   "
_cQuery2 += " AND ZLV_RETIRO = '"+_cFor+"' AND D_E_L_E_T_ = ' ' "


If Select ("DBA") <> 0
	DBA->(dbCloseArea())
EndIf
_cQuery2 := changeQuery(_cQuery2)

dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery2),"DBA",.F.,.T.)

DBA->(dbGoTop())
While !DBA->(Eof())
	If DBA->VALOR < 0
		_nValor += DBA->VALOR*-1
	EndIf
	DBA->(dbSkip())
EndDo
DBA->(DbCloseArea())

_aRet := {_nValor,0}

Return _aRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ FGLT0591 บ Autor ณ Ramon Teles        บ Data ณ  09/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para retornar o valor total dos debitos			  บฑฑ
ฑฑบ          ณ do meses futuros.                                          บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function FGLT0591(_cFor,_dFimVcto)

Local _aArea    := GetArea()
Local _cQuery3 := ""
Local _nRet := 0
Local _dEmissao := CtoD("01/"+Left(mv_par04,2)+"/"+SubStr(mv_par04,3,4))
Local _dBkpDtBase := DDATABASE

_dEmissao := DtoS(LastDay(_dEmissao))

dDataBase := stod(_dEmissao) // Volta a data base para compatibilizar com a fun็ใo SaldoTit.

_cQuery3 := " SELECT * "
_cQuery3 += " FROM "+RetSqlName("SE2")+" SE2  "


_cQuery3 += " WHERE SE2.E2_FILIAL = '"+xFilial("SE2")+"' "
_cQuery3 += " AND E2_TIPO = 'NDF' "
_cQuery3 += " AND SE2.E2_L_EVENT <> ' ' "
_cQuery3 += " AND SE2.E2_FORNECE = '"+_cFor+"' "
_cQuery3 += " AND SE2.E2_VENCTO > '"+_dFimVcto+"' "
_cQuery3 += " AND SE2.E2_EMISSAO <= '"+_dEmissao+"' "
_cQuery3 += " AND SE2.D_E_L_E_T_ =  '' "

// Exclui baixas por faturas do mes anterior
_cQuery3 += " EXCEPT "
_cQuery3 += " SELECT SE2.* "
_cQuery3 += " FROM "+RetSqlName("SE2")+" SE2  "

_cQuery3 += " JOIN " + RetSqlName("SE5")+" SE5 "
_cQuery3 += " ON E5_FILIAL = '"+xFilial("SE5")+"' "
_cQuery3 += " AND  E5_PREFIXO = E2_PREFIXO"
_cQuery3 += " AND  E5_NUMERO  = E2_NUM"
_cQuery3 += " AND  E5_PARCELA = E2_PARCELA"
_cQuery3 += " AND  E5_CLIFOR  = E2_FORNECE"
_cQuery3 += " AND  E5_LOJA    = E2_LOJA"
_cQuery3 += " AND  E5_TIPO    = E2_TIPO"
_cQuery3 += " AND  E5_SITUACA <> 'C'"
_cQuery3 += " AND  E5_DATA < '"+_dEmissao+"' "
_cQuery3 += " AND  E5_MOTBX = 'FAT'"
_cQuery3 += " AND  SE5.D_E_L_E_T_ = ' '"

_cQuery3 += " WHERE SE2.E2_FILIAL = '"+xFilial("SE2")+"' "
_cQuery3 += " AND E2_TIPO = 'NDF' "
_cQuery3 += " AND SE2.E2_L_EVENT <> ' ' "
_cQuery3 += " AND SE2.E2_FORNECE = '"+_cFor+"' "
_cQuery3 += " AND SE2.E2_VENCTO > '"+_dFimVcto+"' "
_cQuery3 += " AND SE2.E2_EMISSAO <= '"+_dEmissao+"' "
_cQuery3 += " AND SE2.D_E_L_E_T_ = ' '"
//_cQuery3 += " ORDER BY SE2.E2_EMISSAO"

If Select ("DBP") <> 0
	DBP->(dbCloseArea())
EndIf

_cQuery3 := changeQuery(_cQuery3)

dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery3),"DBP",.F.,.T.)

DBP->(dbGoTop())
While !DBP->(Eof())
	DbSelectArea("SE2")
	DbSetOrder(1)
	DbSeek(xFilial("SE2")+DBP->E2_PREFIXO+DBP->E2_NUM+DBP->E2_PARCELA+DBP->E2_TIPO+DBP->E2_FORNECE+DBP->E2_LOJA)
	//Fun็ใo que retorna o valor do tํtulo na data parametrizada
	_nRet += SaldoTit(DBP->E2_PREFIXO,DBP->E2_NUM,DBP->E2_PARCELA,DBP->E2_TIPO,DBP->E2_NATUREZ,"P",DBP->E2_FORNECE,1,STOD(_dEmissao),,DBP->E2_LOJA,,DBP->E2_TXMOEDA,1)
	//_nRet := DBP->VALOR
	DBP->(DbSkip())
Enddo

DBP->(DBCLOSEAREA())


dDataBase := _dBkpDtBase // Restaura data base

RestArea(_aArea)

Return _nRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ FGLT0592 บ Autor ณ Ramon Teles        บ Data ณ  09/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para retornar o valor das NFs dos Cooperados.		  บฑฑ
ฑฑบ          ณ 					                                          บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function FGLT0592(_cFor,_dIniVcto,_dFimVcto)

Local _aArea    := GetArea()
Local _cQuery4 := ""
Local _aRet := {}
Local _dEmissao := CtoD("01/"+Left(mv_par04,2)+"/"+SubStr(mv_par04,3,4))
Local _cTipo := Posicione("SA2",1,xFilial("SA2")+_cFor,"A2_TIPO")
_dEmissao := DtoS(LastDay(_dEmissao))

If _cTipo == "F"
	_cQuery4 := " SELECT SE2.E2_LOJA AS LOJA,SE2.E2_NUM AS NUM,SE2.E2_VALOR AS VALOR, (CASE WHEN SE2.E2_L_VERSA = '1' THEN ZLF.ZLF_QTDBOM ELSE 0 END) AS QTD "
	_cQuery4 += " FROM "+RetSqlName("SE2")+" SE2  "
	_cQuery4 += " 	JOIN "+RetSqlName("SF1")+" SF1 ON "
	_cQuery4 += " 	SF1.F1_FILIAL = SE2.E2_FILORIG "
	_cQuery4 += " 	AND SF1.F1_DOC = SE2.E2_NUM "
	_cQuery4 += " 	AND SF1.F1_FORNECE = SE2.E2_FORNECE"
	_cQuery4 += " 	AND SF1.F1_LOJA = SE2.E2_LOJA "
	_cQuery4 += " 	AND SF1.F1_PREFIXO = SE2.E2_PREFIXO "
	_cQuery4 += "	AND SF1.D_E_L_E_T_ = ' '  "

	_cQuery4 += "	JOIN  "+RetSqlName("ZLF")+" ZLF ON "
	_cQuery4 += " 	ZLF.ZLF_FILIAL = '"+xFilial("ZLF")+"' "
	_cQuery4 += " 	AND ZLF.ZLF_RETIRO = SF1.F1_FORNECE "
	_cQuery4 += " 	AND ZLF.ZLF_RETILJ = SF1.F1_LOJA "
	_cQuery4 += " 	AND ZLF.ZLF_DTFIM = SF1.F1_EMISSAO "
	_cQuery4 += "	AND ZLF.ZLF_EVENTO IN ('010001','990010') "
	_cQuery4 += "   AND ZLF.D_E_L_E_T_ = ' ' "

	_cQuery4 += " WHERE "
	_cQuery4 += " SE2.E2_FILIAL = '"+xFilial("SE2")+"' "
	_cQuery4 += " AND SE2.E2_PREFIXO = '"+_cSerieNF+"' "
	_cQuery4 += " AND SE2.E2_TIPO = 'NF' "
	_cQuery4 += " AND SE2.E2_FORNECE = '"+_cFor+"' "
	_cQuery4 += " AND ((SE2.E2_L_VERSA = '1' AND SE2.E2_EMISSAO = '"+_dEmissao+"')  "
	_cQuery4 += " OR (SE2.E2_L_VERSA = '2' AND SUBSTRING(SE2.E2_EMISSAO,1,6) = '"+SUBSTR(_dEmissao,1,6)+"')) "
	_cQuery4 += " AND SE2.D_E_L_E_T_ = ' ' "
	_cQuery4 += " ORDER BY SE2.E2_EMISSAO "
Else
	_cQuery4 := " SELECT SE2.E2_LOJA AS LOJA,SE2.E2_NUM AS NUM,SE2.E2_VALOR AS VALOR, 0 AS QTD "
	_cQuery4 += " FROM "+RetSqlName("SE2")+" SE2   "
	_cQuery4 += " WHERE SE2.E2_FILIAL = '"+xFilial("SE2")+"' "
	_cQuery4 += " AND SUBSTRING(SE2.E2_PREFIXO,1,1) <> 'G' "
	_cQuery4 += " AND SE2.E2_TIPO = 'NF' "
	_cQuery4 += " AND SE2.E2_FORNECE = '"+_cFor+"' "
	IF SUBSTR(_cFor,1,1) == "G"
		_cQuery4 += " AND SE2.E2_EMISSAO BETWEEN '"+_dEmissao+"' AND '"+DTOS(STOD(_dEmissao)+12)+"' "
	ELSE
		_cQuery4 += " AND SE2.E2_EMISSAO = '"+_dEmissao+"' "
	ENDIF
	_cQuery4 += " AND SE2.D_E_L_E_T_ = ' '"
	_cQuery4 += " ORDER BY SE2.E2_EMISSAO "
	
EndIf

If Select ("CNF") <> 0
	CNF->(dbCloseArea())
EndIf

_cQuery4 := changeQuery(_cQuery4)

dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery4),"CNF",.F.,.T.)

CNF->(dbGoTop())

While CNF->(!Eof())
	
	AADD(_aRet,{CNF->LOJA , CNF->NUM ,CNF->VALOR,CNF->QTD})
	
	CNF->(DbSkip())
	
EndDo

CNF->(DBCLOSEAREA())

RestArea(_aArea)

Return _aRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ FGLT0593 บ Autor ณ Ramon Teles        บ Data ณ  09/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para retornar o valor das NFs dos Cooperados.		  บฑฑ
ฑฑบ          ณ 					                                          บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function FGLT0593(_cCodFil)

Local _aArea    := GetArea()

Local _cRet := " "


//DbSelectArea("SM0")
//DbSetOrder(1)
SM0->(DbGoTop())

While SM0->(!Eof())
	
	If SM0->M0_CODFIL = _cCodFil
		_cRet := SubString(SM0->M0_FILIAL,1,3)
		Exit
	EndIf
	SM0->(DbSkip())
	
EndDo

//DbCloseArea("SM0")

RestArea(_aArea)

Return _cRet


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ PrintC   บ Autor ณ Ramon Teles        บ Data ณ  12/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para retornar o valor das NFs dos Cooperados.		  บฑฑ
ฑฑบ          ณ 					                                          บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function PrintC

Local _aArea    := GetArea()
Local oFont12N		:= TFont():New("COURIER NEW",12,12,,.T.,,,,.T.,.F.)

//Criando Colunas
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)
oReport:SkipLine(1)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,"Emissใo"			,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.11,"Doc/Parcela"		,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.21,"Filial"			,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.28,"Vencimento"		,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.39,"Hist๓rico"		,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.63,"D/C"				,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.70,"Valor"			,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.80,"Custo ADM"  		,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.90,"Total"			,oFont12N)


oReport:SkipLine(2)

RestArea(_aArea)

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ CriaSX1  บ Autor ณ Ramon Teles        บ Data ณ  08/08/13   บฑฑ
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

aHelpPor := {}
Aadd( aHelpPor, 'Informe o tipo de filtro.             ')
Aadd( aHelpPor, 'Por Cooperado ou Transportador')
U_xPutSx1(cPerg,"01","Tipo de Filtro"," "," ","mv_ch1","N" ,1,0,0,"C","NaoVazio()","","","","MV_PAR01","Por Cooperado","Por Cooperado","Por Cooperado","","Tranps. Granel","Tranps. Granel","Tranps. Granel", "","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial do Produtor   ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"02","Do Produtor"," "," ","mv_ch2","C",6,0,0,"G","","SA2_LC","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ao Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final do Produtor     ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"03","Ao Produtor"," "," ","mv_ch3","C",6,0,0,"G","","SA2_LC","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Data Saldo
aHelpPor := {}
Aadd( aHelpPor, 'Informe a data do saldo.                ')
Aadd( aHelpPor, 'Formato (mmaaaa)                        ')
U_xPutSx1(cPerg,"04","Data Saldo (mmaaaa)"," "," ","mv_ch4","C",6,0,0,"G","NaoVazio()","","","","mv_par04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Movimenta็ใo
aHelpPor := {}
Aadd( aHelpPor, 'Configura็ใo quanto a movimenta็ใo do associado')
Aadd( aHelpPor, 'Informe: Com Movimento, Sem Movimento, Todos')
U_xPutSx1(cPerg,"05","Movimenta็ใo"," "," ","mv_ch5","N" ,1,0,0,"C","NaoVazio()","","","","MV_PAR05","Com Movimento","Com Movimento","Com Movimento","","Todos","Todos","Todos","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ RetNCC   บ Autor ณ                    บ Data ณ  08/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna dados de NCC do produtor.                          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ "1" - Retorna compensa็oes NCC                             บฑฑ
ฑฑบ          ณ "2" - Retorna NCC em aberto                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function RetNCC(_pcCoop, _pcTpRet)

Local _cRetorno := " UNION ALL "
Local _lBaixado := Alltrim(_pcTpRet) == "1"

If _lBaixado
	_cRetorno += " SELECT DISTINCT "
	_cRetorno += " 		  SE5NDF.E5_FILORIG                           FILIAL, "
	_cRetorno += "        SE5NDF.E5_CLIFOR                            FORNECE, "
	_cRetorno += "        SE5NDF.E5_DATA                              EMISSAO, "
	_cRetorno += "        SE5NDF.E5_NUMERO                       NUM, "
	_cRetorno += "        SE5NDF.E5_PARCELA                      PARCELA, "
	_cRetorno += "        SE5NDF.E5_DATA                              VENCTO, "
//	_cRetorno += "        'CRED. DEV. '+SE5NCC.E5_NUMERO            HISTORICO, "
	_cRetorno += "        'CREDITO DEVOLUวOES '            HISTORICO, "
	_cRetorno += "        ''                                   PREFIXO, "
	_cRetorno += "        SUM(CASE "
	_cRetorno += "              WHEN SE5NDF.E5_TIPODOC <> 'ES' THEN SE5NDF.E5_VALOR "
	_cRetorno += "              ELSE -SE5NDF.E5_VALOR "
	_cRetorno += "            END)                             VALOR, "
//	_cRetorno += "        SUM(CASE "
//	_cRetorno += "              WHEN SE5NCC.E5_TIPODOC <> 'ES' THEN SE5NCC.E5_VALOR "
//	_cRetorno += "              ELSE -SE5NCC.E5_VALOR "
//	_cRetorno += "            END)                             VALOR, "
	_cRetorno += "        0                                    AS ACRES, "
	_cRetorno += "        0                                    SALDO, "
	_cRetorno += "        SE5NDF.E5_DATA                              BAIXA, "
	_cRetorno += "        SE5NDF.E5_TIPO                              TIPO, "
	_cRetorno += "        CASE "
	_cRetorno += "          WHEN SE5NDF.E5_TIPO = 'NF' THEN 'D' "
	_cRetorno += "          ELSE 'C' "
	_cRetorno += "        END                                  AS DEBCRED, "
	_cRetorno += "        SE5NDF.E5_DATA                       PRIORIDADE2, "
	_cRetorno += "        '2'                                  PRIORIDADE1, "
	_cRetorno += "        'DEVOLUCOES/COMP'                   _QUERY "
	
	_cRetorno += " FROM "+RetSqlName("SE2")+" SE2"
	
	_cRetorno += " JOIN "+RetSqlName("SE5")+" SE5NDF"
	_cRetorno += "          ON E2_FILIAL      = SE5NDF.E5_FILIAL "
	_cRetorno += " 			   AND SE5NDF.E5_DATA BETWEEN '"+_dDtEmiIni+"' AND '"+_dDtEmiFim+"' "
	_cRetorno += "             AND E2_PREFIXO = SE5NDF.E5_PREFIXO "
	_cRetorno += "             AND E2_NUM     = SE5NDF.E5_NUMERO "
	_cRetorno += "             AND E2_PARCELA = SE5NDF.E5_PARCELA "
	_cRetorno += "             AND E2_TIPO    = SE5NDF.E5_TIPO "
	_cRetorno += "             AND E2_FORNECE = SE5NDF.E5_CLIFOR "
	_cRetorno += "             AND E2_LOJA    = SE5NDF.E5_LOJA "
	_cRetorno += "             AND E2_FILORIG = SE5NDF.E5_FILORIG "
	_cRetorno += "             AND SE5NDF.E5_MOTBX = 'CEC'	"
	_cRetorno += "             AND SE5NDF.E5_SITUACA = ''	"
	//	_cRetorno += "             AND E2_IDENTEE = SE5NDF.E5_IDENTEE" comentado pois com mais de uma devolu็ใo s๓ trazia a ultima
	_cRetorno += "             AND SE5NDF.D_E_L_E_T_ = ' ' "

	//	_cRetorno += " 			   AND SE5NDF.E5_DATA <= '"+_dDtEmiFim+"' "
	_cRetorno += " JOIN SE5010 SE5NCC"
	_cRetorno += "         ON  SE5NCC.E5_FILIAL = SE5NDF.E5_FILIAL"
	_cRetorno += "             AND SE5NCC.E5_IDENTEE = SE5NDF.E5_IDENTEE"
	//	_cRetorno += "             AND SE5NCC.E5_FILORIG = SE5NDF.E5_FILORIG"
	_cRetorno += "             AND SE5NCC.E5_CLIFOR  = SE5NDF.E5_CLIFOR"
	_cRetorno += "             AND SE5NCC.E5_LOJA    = SE5NDF.E5_LOJA"
	_cRetorno += "             AND SE5NCC.E5_TIPO    = 'NCC'"
	_cRetorno += "             AND SE5NCC.D_E_L_E_T_ = ' '"
	
	_cRetorno += " WHERE E2_FILIAL = '"+xFilial("SE2")+"' "
	_cRetorno += " AND   E2_FORNECE = '"+_pcCoop+"' "
	//	_cRetorno += " AND   E2_VENCTO BETWEEN '"+_dIniVcto+"' AND '"+_dFimVcto+"' "
	_cRetorno += " AND   E2_VENCTO <= '"+_dFimVcto+"' "
	_cRetorno += " AND   E2_IDENTEE <> ' '"
	_cRetorno += " AND   SE2.D_E_L_E_T_ = ' '"
	
	_cRetorno += " GROUP  BY SE5NDF.E5_FILORIG, "
	_cRetorno += "           SE5NDF.E5_CLIFOR, "
	_cRetorno += "           SE5NDF.E5_DATA, "
	_cRetorno += "           SE5NCC.E5_NUMERO,"
	_cRetorno += "           SE5NDF.E5_NUMERO, "
	_cRetorno += "           SE5NDF.E5_PARCELA, "
	_cRetorno += "           SE5NDF.E5_VALOR, "
	_cRetorno += "           SE5NDF.E5_HISTOR, "
	_cRetorno += "           SUBSTRING(SE5NDF.E5_DOCUMEN, 18, 6), "
	_cRetorno += "           SE5NDF.E5_TIPO "
	
End

Return(_cRetorno)
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณRetVlrPg  บ Autor ณ                    บ Data ณ  08/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna valor pago/baixado na NDF.                         บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ "1" - Retorna compensa็oes NCC                             บฑฑ
ฑฑบ          ณ "2" - Retorna NCC em aberto                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function RetVlrPg(_pcPREFIXO, _pcNUMERO, _pcPARCELA, _pcTIPO, _pcFORNECE)

Local _cAlias := GetNextAlias()
Local _nRetorno := 0
//Local _cFiltro := "% AND E5_HISTOR LIKE 'Fechamento GLT "+Substr(mv_par04,1,2)+"/"+Substr(mv_par04,3,4)+"%' %"

BeginSql Alias _cAlias
	
	SELECT SUM(CASE WHEN E5.E5_TIPODOC <> 'ES' THEN (E5_VALOR) ELSE -(E5_VALOR+E5_VLJUROS-E5_VLDESCO) END) AS E5_VALOR
	
	FROM %Table:SE5% E5
	
	WHERE E5_FILIAL  = %xFilial:SE5%
	AND   E5_PREFIXO = %Exp:_pcPREFIXO%
	AND   E5_NUMERO  = %Exp:_pcNUMERO%
	AND   E5_PARCELA = %Exp:_pcPARCELA%
	AND   E5_TIPO    = %Exp:_pcTIPO%
	AND   E5_CLIFOR  = %Exp:_pcFORNECE%
	//AND   E5_DATA    BETWEEN %Exp:_dIniVcto% AND %Exp:_dFimVcto%
	AND   E5_DATA    <= %Exp:_dFimVcto%
	//AND   E5_MOTBX   = 'GLT'
	AND   E5_SITUACA <> 'C'
	AND E5_TIPODOC IN ('BA','VL','ES')
	AND   E5.D_E_L_E_T_ = ' '
	//	%Exp:_cFiltro%
	
EndSql

dbSelectArea(_cAlias)
(_cAlias)->(dbGoTop())

_nRetorno := (_cAlias)->E5_VALOR

dbCloseArea(_cAlias)

Return(_nRetorno)


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณJurBaixas บ Autor ณ                    บ Data ณ  08/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna o valor de juros da baixa.                         บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ "1" - Retorna compensa็oes NCC                             บฑฑ
ฑฑบ          ณ "2" - Retorna NCC em aberto                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function JurBaixas()

Local _cQuery 	:= ""
Local _aRet := {}

_cQuery := ""
_cQuery += "  SELECT E2_PREFIXO+E2_NUM+E2_PARCELA TITULO,  ( SUM(E5_VLJUROS) - SUM(E5_VLACRES) )    VALOR "
_cQuery += "  FROM "+RetSqlName("SE5")+" SE5, "+RetSqlName("SE2")+" SE2 "
_cQuery += "  WHERE SE5.D_E_L_E_T_ = ' '  "
_cQuery += "  AND SE5.E5_PREFIXO = SE2.E2_PREFIXO "
_cQuery += "  AND SE5.E5_NUMERO = SE2.E2_NUM "
_cQuery += "  AND SE5.E5_PARCELA = SE2.E2_PARCELA "
_cQuery += "  AND SE5.E5_CLIFOR = SE2.E2_FORNECE "
_cQuery += "  AND SE2.E2_VENCTO < '"+_dFimVcto+"' "
_cQuery += "  AND SE5.E5_DATA = '"+_dFimVcto+"' "
_cQuery += "  AND SE5.E5_SITUACA <> 'C' "
_cQuery += "  AND SE5.E5_CLIFOR = '"+_cCoop+"' "
_cQuery += "  AND SE5.E5_TIPO = 'NDF' "
_cQuery += "  AND SE5.E5_RECPAG = 'R' "
_cQuery += "  AND SE5.E5_TIPODOC = 'BA' "
_cQuery += "  AND SE5.E5_MOTBX <> 'GL2' " //Nใo pega baixas geradas pelo titulo aglutinador
_cQuery += "  AND SE5.E5_PREFIXO <> 'GL2' " // Nใo pega baixas do titulo aglutinador
_cQuery += "  AND SE2.E2_TIPO = SE5.E5_TIPO	"
_cQuery += "  GROUP BY E2_PREFIXO,E2_NUM,E2_PARCELA "


If Select("JUR") <> 0
	JUR->(dbCloseArea())
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery),"JUR",.F.,.T.)

_aRet := {}

_nVlDescont := 0
JUR->(dbGoTop())
WHILE !JUR->(Eof())
	AADD(_aRet,{_dFimVcto,JUR->TITULO,_dFimVcto,"CUSTO ADM DEB. MES",JUR->VALOR,"D",1})
	_nVlDescont += JUR->VALOR
	JUR->(DBSKIP())
ENDDO
DbCloseArea("JUR")


Return(_aRet)


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ RetCEC   บ Autor ณ                    บ Data ณ  04/08/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna compensa็oes entre carteira                        บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function RetCEC(_pcCoop)

Local _cRetorno := " UNION ALL "


_cRetorno += " SELECT DISTINCT "
//_cRetorno += " 		   SE5NDF.E5_FILORIG                           FILIAL, "
_cRetorno += " 		   '010101'                           FILIAL, "
_cRetorno += "        SE5NDF.E5_CLIFOR                            FORNECE, "
_cRetorno += "        SE5NDF.E5_DATA                              EMISSAO, "
//_cRetorno += "        SE5NDF.E5_NUMERO                       NUM, "
_cRetorno += "        '000000000'                       NUM, "
//_cRetorno += "        SE5NDF.E5_PARCELA                      PARCELA, "
_cRetorno += "        '00'                      PARCELA, "
_cRetorno += "        SE5NDF.E5_DATA                              VENCTO, "
_cRetorno += "        'COMPENSAวรO CREDITO '+SE5NDF.E5_SEQ            HISTORICO, "
_cRetorno += "        ''                                   PREFIXO, "
//	_cRetorno += "        SUM(CASE "
//	_cRetorno += "              WHEN SE5NDF.E5_TIPODOC <> 'ES' THEN SE5NDF.E5_VALOR "
//	_cRetorno += "              ELSE -SE5NDF.E5_VALOR "
//	_cRetorno += "            END)                             VALOR, "
_cRetorno += "        SUM(CASE "
_cRetorno += "              WHEN SE5NCC.E5_TIPODOC <> 'ES' THEN SE5NCC.E5_VALOR "
_cRetorno += "              ELSE -SE5NCC.E5_VALOR "
_cRetorno += "            END)                             VALOR, "
_cRetorno += "        0                                    AS ACRES, "
_cRetorno += "        0                                    SALDO, "
_cRetorno += "        SE5NDF.E5_DATA                              BAIXA, "
_cRetorno += "        SE5NDF.E5_TIPO                              TIPO, "
_cRetorno += "        CASE "
_cRetorno += "          WHEN SE5NDF.E5_TIPO = 'NF' THEN 'D' "
_cRetorno += "          ELSE 'C' "
_cRetorno += "        END                                  AS DEBCRED, "
_cRetorno += "        SE5NDF.E5_DATA                       PRIORIDADE2, "
_cRetorno += "        '2'                                  PRIORIDADE1, "
_cRetorno += "        'DEVOLUCOES/COMP'                   _QUERY "

_cRetorno += " FROM "+RetSqlName("SE2")+" SE2"

_cRetorno += " JOIN "+RetSqlName("SE5")+" SE5NDF"
_cRetorno += "          ON E2_FILIAL      = SE5NDF.E5_FILIAL "
_cRetorno += " 			   AND SE5NDF.E5_DATA BETWEEN '"+_dDtEmiIni+"' AND '"+_dDtEmiFim+"' "
_cRetorno += "             AND E2_PREFIXO = SE5NDF.E5_PREFIXO "
_cRetorno += "             AND E2_NUM     = SE5NDF.E5_NUMERO "
_cRetorno += "             AND E2_PARCELA = SE5NDF.E5_PARCELA "
_cRetorno += "             AND E2_TIPO    = SE5NDF.E5_TIPO "
_cRetorno += "             AND E2_FORNECE = SE5NDF.E5_CLIFOR "
_cRetorno += "             AND E2_LOJA    = SE5NDF.E5_LOJA "
_cRetorno += "             AND E2_FILORIG = SE5NDF.E5_FILORIG "
_cRetorno += " 			   AND SE5NDF.E5_MOTBX = 'CEC' "
_cRetorno += " 			   AND SE5NDF.E5_TIPO = 'NDF' "  
_cRetorno += " 			   AND SE5NDF.E5_SITUACA <> 'C' "
_cRetorno += "             AND SE5NDF.D_E_L_E_T_ = ' ' "
_cRetorno += " JOIN SE5010 SE5NCC"
_cRetorno += "         ON  SE5NCC.E5_FILIAL = SE5NDF.E5_FILIAL"
_cRetorno += "             AND SE5NCC.E5_IDENTEE = SE5NDF.E5_IDENTEE"
_cRetorno += "             AND SE5NCC.E5_CLIFOR  = SE5NDF.E5_CLIFOR"
_cRetorno += "             AND SE5NCC.E5_LOJA    = SE5NDF.E5_LOJA"
_cRetorno += "             AND SE5NCC.E5_TIPO   = 'RA'"
_cRetorno += "             AND SE5NCC.D_E_L_E_T_ = ' '"
_cRetorno += " 			   AND SE5NCC.E5_SITUACA <> 'C' "
_cRetorno += " WHERE E2_FILIAL = '"+xFilial("SE2")+"' "
_cRetorno += " AND   E2_FORNECE = '"+_pcCoop+"' "
_cRetorno += " AND   E2_IDENTEE <> ' '"
_cRetorno += " AND   SE2.D_E_L_E_T_ = ' '"

_cRetorno += " GROUP  BY SE5NDF.E5_FILORIG, "
_cRetorno += "           SE5NDF.E5_CLIFOR, "
_cRetorno += "           SE5NDF.E5_DATA, "
_cRetorno += "           SE5NCC.E5_NUMERO,"
_cRetorno += "           SE5NDF.E5_NUMERO, "
_cRetorno += "           SE5NDF.E5_PARCELA, "
_cRetorno += "           SE5NDF.E5_HISTOR, "
_cRetorno += "           SUBSTRING(SE5NDF.E5_DOCUMEN, 18, 6), "
_cRetorno += "           SE5NDF.E5_TIPO, SE5NDF.E5_SEQ "

Return(_cRetorno)


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT059   บAutor  ณMicrosiga           บ Data ณ  04/14/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function MensagemExtra(_cMat,nTamMax)

Local oFont14N		:= TFont():New("COURIER NEW",14,14,,.T.,,,,.T.,.F.)
Local oFont11NI		:= TFont():New("COURIER NEW",11,11,,.T.,,,,.T.,.F.,.T.)
Local _cTexto := ""
Local _cAux := ""
//Cooperados tratados na mensagem:
// 'C26514',

If _cMat == 'C26514'
	If MV_PAR04 == '022014'
		_cTexto := "Obs.: No dia 19/03/2014 foi pago ao cooperado R$470,93 indevidos, que acarretarแ em d้bito no pr๓ximo m๊s."
	ElseIf MV_PAR04 == '032014'
		_cTexto := "Obs.: O d้bito correto do cooperado ้ de R$763,90, devido ao pagamento antecipado de R$470,93 no dia 19/03/2014."
	EndIf
ElseIf _cMat == 'C21415'
	If MV_PAR04 == '012014'
		_cTexto := "Obs.: No dia 20/02/2014 foi pago ao cooperado o valor integral da nota do leite sem os descontos, portanto os d้bitos foram transferidos para o pr๓ximo mes."
	ElseIf MV_PAR04 == '022014'
		_cTexto := "Obs.: O credito correto do m๊s, depositado no dia 19/03/14, foi de R$5.398,61 devido aos d้bitos nใo compensados do m๊s anterior."
	EndIf
	
ElseIf _cMat == 'C21393'
	If MV_PAR04 == '012014'
		_cTexto := "Obs.: No dia 20/02/2014 foi pago ao cooperado o valor integral da nota do leite sem os descontos, portanto os d้bitos foram transferidos para o pr๓ximo mes."
	ElseIf MV_PAR04 == '022014'
		_cTexto := "Obs.: O cooperado ficou com d้bito no valor de R$3.215,17, devido ao recebimento total da nota no fechamento anterior. Este d้bito foi quitado no dia 25/03/14."
	EndIf
ElseIf _cMat == 'C21350'
	If MV_PAR04 == '012014'
		_cTexto := "Obs.: No dia 20/02/2014 foi pago ao cooperado o valor integral da nota do leite sem os descontos, portanto os d้bitos foram transferidos para o pr๓ximo mes."
	ElseIf MV_PAR04 == '022014'
		_cTexto := "Obs.: O credito correto do m๊s, depositado no dia 19/03/14, foi de R$344,89 devido aos d้bitos nใo compensados do m๊s anterior."
	EndIf
ElseIf _cMat == 'C29882'
	If MV_PAR04 == '022014'
		_cTexto := "Obs.: No dia 19/02/2014 foi pago ao cooperado o valor de R$86,25 e a diferen็a de R$6,02 serแ paga ao cooperado junto com o pagamento de 20/05/2014 ."
	EndIf
ElseIf _cMat == 'C23973'
	If MV_PAR04 == '012014'
		_cTexto := "Obs.: No dia 03/02/2014 o cooperado fez uma antecipa็ใo de R$10.000,00 ficando com d้bito de R$2.566,51 a ser cobrado no pr๓ximo fechamento."
	EndIf
ElseIf _cMat == 'C24520'
	If MV_PAR04 == '022014'
		_cTexto := "Obs.: No dia 19/03/2014 foi pago ao cooperado o valor de R$38.374,37. A diferen็a de R$7.203,65 serแ transferida como d้bito para o pr๓ximo fechamento."
	EndIf
ElseIf _cMat == 'C31062'
	If MV_PAR04 == '032014'
		_cTexto := "Obs.: No dia 16/04/2014 foi pago ao cooperado o valor de R$2.820,63. A diferen็a de R$603,61 serแ transferida como d้bito para o pr๓ximo fechamento e cobrada sem juros."
	EndIf
	
	
	
EndIf

If Len(_cTexto) > 1
	oReport:SkipLine(3)
	For i:= 1 to Len(_cTexto)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02,SubStr(_cTexto,i,98),oFont14N)
		oReport:SkipLine(1)
		i+=97
	Next i
EndIf

//Mensagem padrใo para os extratos dos meses de janeiro, fevereiro e mar็o.
//Mensagem definida pelo diretor Rogerio.
If MV_PAR04 == '012014' .OR. MV_PAR04 == '022014' .OR. MV_PAR04 == '032014'
	oReport:SkipLine(3)
	_cTexto := "Impressใo de avalia็ใo, extrato provis๓rio. Por estar em fase de testes, este extrato ainda pode sofrer altera็๕es."
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02,_cTexto,oFont11NI)
	oReport:SkipLine(1)
EndIf

Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณTabZCC()  บAutor  ณMicrosiga           บ Data ณ  04/24/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function TabZCC(_cCodCoo,_cPeriod)
Local _cRetorno	:= ""

_cRetorno	+= " UNION ALL "
_cRetorno	+= " SELECT ZCC.ZCC_FILIAL, ZCC.ZCC_CODIGO, ZCC.ZCC_EMISSA, ZCC.ZCC_NUMERO, ZCC.ZCC_PARCEL, ZCC.ZCC_VENCTO, ZCC.ZCC_HIST, "
_cRetorno	+= "		ZCC.ZCC_PREFIX, ZCC.ZCC_VALOR, ZCC.ZCC_ACRDEC, ZCC.ZCC_VALOR + ZCC.ZCC_ACRDEC, ZCC.ZCC_BAIXA, ZCC.ZCC_TIPO, "
_cRetorno	+= " 		ZCC.ZCC_DEBCRE, ZCC.ZCC_ORDEM2,ZCC.ZCC_ORDEM1, 'TABELA ZCC A' _QUERY "
_cRetorno	+= " FROM "+RetSqlName("ZCC")+" ZCC "
_cRetorno	+= " WHERE 	ZCC.ZCC_PERIOD = '"+_cPeriod+"' "
_cRetorno	+= " 	AND ZCC.ZCC_CODIGO = '"+_cCodCoo+"' "
_cRetorno	+= " 	AND ZCC.ZCC_FUNCAO = 'A' "
_cRetorno	+= " 	AND ZCC.D_E_L_E_T_ = ' ' "
_cRetorno	+= " EXCEPT"
_cRetorno	+= " SELECT ZCC.ZCC_FILIAL, ZCC.ZCC_CODIGO, ZCC.ZCC_EMISSA, ZCC.ZCC_NUMERO, ZCC.ZCC_PARCEL, ZCC.ZCC_VENCTO, ZCC.ZCC_HIST,"
_cRetorno	+= "  		ZCC.ZCC_PREFIX, ZCC.ZCC_VALOR, ZCC.ZCC_ACRDEC, 0, ZCC.ZCC_BAIXA, ZCC.ZCC_TIPO,"
_cRetorno	+= "  		ZCC.ZCC_DEBCRE, ZCC.ZCC_ORDEM2,ZCC.ZCC_ORDEM1, ZCC_FUNCAO _QUERY"
_cRetorno	+= " FROM "+RetSqlName("ZCC")+" ZCC "
_cRetorno	+= " WHERE 	ZCC.ZCC_PERIOD = '"+_cPeriod+"' "
_cRetorno	+= " 	AND ZCC.ZCC_CODIGO = '"+_cCodCoo+"' "
_cRetorno	+= " 	AND ZCC.ZCC_FUNCAO <> 'A' "
_cRetorno	+= " 	AND ZCC.D_E_L_E_T_ = ' ' "

return _cRetorno

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGExcept  บAutor  ณMicrosiga           บ Data ณ  04/24/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณRetorna excessoes da regra geral.                           บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ _pcTipo = 1 - Retorna fatura que baixou d้bitos.           บฑฑ
ฑฑบ          ณ         = 2 - Retorna titulos baixados por fatura          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function RGExcept(_pcTipo)

Local _cRetorno :=  " EXCEPT"

Default _pcTipo := "1"

If Alltrim(_pcTipo) == "1"
	_cRetorno += " SELECT SE2FAT.E2_FILORIG                 FILIAL,"
	_cRetorno += "        SE2FAT.E2_FORNECE                 FORNECE,"
	_cRetorno += "        SE2FAT.E2_EMISSAO                 EMISSAO,"
	_cRetorno += "        SE2FAT.E2_NUM                     NUM,"
	_cRetorno += "        SE2FAT.E2_PARCELA                 PARCELA,"
	_cRetorno += "        SE2FAT.E2_VENCTO                  VENCTO,"
	_cRetorno += "        UPPER(SE2FAT.E2_HIST)             HISTORICO,"
	_cRetorno += "        SE2FAT.E2_PREFIXO                 PREFIXO,"
	_cRetorno += "        SE2FAT.E2_VALOR                   AS VALOR,"
	_cRetorno += "        ( SE2FAT.E2_ACRESC - SE2FAT.E2_DECRESC ) AS ACRES,"
	_cRetorno += "        ( SE2FAT.E2_SALDO + SE2FAT.E2_SDACRES )  AS SALDO,"
	_cRetorno += "        CASE"
	_cRetorno += "          WHEN SE2FAT.E2_BAIXA <> '' THEN SE2FAT.E2_BAIXA"
	_cRetorno += "          ELSE ''"
	_cRetorno += "        END                        AS BAIXA,"
	_cRetorno += "        SE2FAT.E2_TIPO                    TIPO,"
	_cRetorno += "        CASE"
	_cRetorno += "          WHEN SE2FAT.E2_TIPO = 'NDF' THEN 'D'"
	_cRetorno += "          ELSE 'C'"
	_cRetorno += "        END                        AS DEBCRED,"
	_cRetorno += "        SE2FAT.E2_EMISSAO                 PRIORIDADE2,"
	_cRetorno += "        '2'                        PRIORIDADE1,"
	_cRetorno += "        'REGRAGERAL'               _QUERY"
	_cRetorno += " FROM  "+RetSqlName("SE2")+" SE2"
	
	_cRetorno += " JOIN "+ RetSqlName("SE2") +" SE2FAT"
	_cRetorno += " ON  SE2FAT.E2_FILIAL  = SE2.E2_FILIAL"
	_cRetorno += " AND SE2FAT.E2_FATPREF = SE2.E2_PREFIXO"
	_cRetorno += " AND SE2FAT.E2_FATURA  = SE2.E2_NUM"
	_cRetorno += " AND SE2FAT.E2_FATFOR  = SE2.E2_FORNECE"
	_cRetorno += " AND SE2FAT.E2_FATLOJ  = SE2.E2_LOJA"
	_cRetorno += " AND SE2FAT.E2_PREFIXO NOT IN ('GLE','GLA') "
	//_cRetorno += " AND SE2FAT.E2_PREFIXO NOT EXISTS ('GLE','GLA') "
	_cRetorno += " AND SE2FAT.E2_VENCTO < = '"+_dIniVcto+"'"  //Guilherme - 11/06/14 ** Analisar se este except faz sentido
	_cRetorno += " AND SE2FAT.D_E_L_E_T_ = ' '"
	
	_cRetorno += " WHERE  SE2.E2_FILIAL = '      '"
	_cRetorno += "        AND SE2.E2_PREFIXO NOT IN ( '3  ', 'CCH' )"
	//_cRetorno += "        AND SE2.E2_PREFIXO NOT EXISTS ( '3  ', 'CCH' )"
	_cRetorno += "        AND SE2.E2_FORNECE = '"+_cCoop+"' "
	_cRetorno += "        AND SE2.E2_VENCTO BETWEEN '"+DtoS(FirstDay(StoD(_dIniVcto)))+"' AND '"+DtoS(LastDay(StoD(_dIniVcto)))+"' "
	_cRetorno += "        AND SE2.E2_EMISSAO <= '"+_dDtEmiFim+"' "
	//	_cRetorno += "        AND ( SE2.E2_PREFIXO + SE2.E2_TIPO NOT IN ('GLENF','GLENDF') )"
	_cRetorno += "        AND ( SE2.E2_PREFIXO + SE2.E2_TIPO NOT IN ('GLENF') )"
	//_cRetorno += "        AND ( SE2.E2_PREFIXO + SE2.E2_TIPO NOT EXISTS ('GLENF') )"
	_cRetorno += "        AND SE2.E2_L_EVENT <> '100010'"
	_cRetorno += "        AND SE2.E2_L_EVENT <> ''"
	_cRetorno += "        AND SE2.E2_ORIGEM = 'FINA290'"
	_cRetorno += "        AND SE2.D_E_L_E_T_ = ' '"
	
ElseIf Alltrim(_pcTipo) == "2"
	
	_cRetorno += " SELECT DISTINCT "
	_cRetorno += " SE2.E2_FILORIG                 FILIAL,"
	_cRetorno += "        SE2.E2_FORNECE                 FORNECE,"
	_cRetorno += "        SE2.E2_EMISSAO                 EMISSAO,"
	_cRetorno += "        SE2.E2_NUM                     NUM,"
	_cRetorno += "        SE2.E2_PARCELA                 PARCELA,"
	_cRetorno += "        SE2.E2_VENCTO                  VENCTO,"
	_cRetorno += "        UPPER(SE2.E2_HIST)             HISTORICO,"
	_cRetorno += "        SE2.E2_PREFIXO                 PREFIXO,"
	_cRetorno += "        SE2.E2_VALOR                   AS VALOR,"
	_cRetorno += "        ( SE2.E2_ACRESC - SE2.E2_DECRESC ) AS ACRES,"
	_cRetorno += "        ( SE2.E2_SALDO + SE2.E2_SDACRES )  AS SALDO,"
	_cRetorno += "        CASE"
	_cRetorno += "          WHEN SE2.E2_BAIXA <> '' THEN SE2.E2_BAIXA"
	_cRetorno += "          ELSE ''"
	_cRetorno += "        END                        AS BAIXA,"
	_cRetorno += "        SE2.E2_TIPO                    TIPO,"
	_cRetorno += "        CASE"
	_cRetorno += "          WHEN SE2.E2_TIPO = 'NDF' THEN 'D'"
	_cRetorno += "          ELSE 'C'"
	_cRetorno += "        END                        AS DEBCRED,"
	_cRetorno += "        SE2.E2_EMISSAO                 PRIORIDADE2,"
	_cRetorno += "        '2'                        PRIORIDADE1,"
	_cRetorno += "        'REGRAGERAL'               _QUERY"
	
	_cRetorno += " FROM   "+RetSqlName("SE2")+" SE2"
	/*
	_cRetorno += " JOIN "+RetSqlName("SE2")+" SE2FAT "
	_cRetorno += " ON  SE2FAT.E2_FILIAL  = SE2.E2_FILIAL"
	_cRetorno += " AND SE2FAT.E2_FATPREF = SE2.E2_PREFIXO"
	_cRetorno += " AND SE2FAT.E2_FATURA  = SE2.E2_NUM"
	_cRetorno += " AND SE2FAT.E2_FATFOR  = SE2.E2_FORNECE"
	_cRetorno += " AND SE2FAT.E2_FATLOJ  = SE2.E2_LOJA"
	_cRetorno += " AND SE2FAT.E2_EMISSAO <= '"+_dDtEmiFim+"' "
	_cRetorno += " AND SE2FAT.D_E_L_E_T_ = ' '"
	*/
	_cRetorno += " JOIN "+RetSqlName("SE5") +" SE5"
	_cRetorno += " ON  SE5.E5_FILIAL  = SE2.E2_FILIAL"
	_cRetorno += " AND SE5.E5_PREFIXO = SE2.E2_PREFIXO"
	_cRetorno += " AND SE5.E5_NUMERO  = SE2.E2_NUM"
	_cRetorno += " AND SE5.E5_PARCELA = SE2.E2_PARCELA"
	_cRetorno += " AND SE5.E5_TIPO    = SE2.E2_TIPO"
	_cRetorno += " AND SE5.E5_CLIFOR  = SE2.E2_FORNECE"
	_cRetorno += " AND SE5.E5_LOJA    = SE2.E2_LOJA"
	_cRetorno += " AND SE5.E5_DATA    < '"+_dDtEmiIni+"' "
	_cRetorno += " AND SE5.D_E_L_E_T_ = ' '"
	
	_cRetorno += " AND SE5.E5_MOTBX    = 'FAT' "
	
	_cRetorno += " WHERE  SE2.D_E_L_E_T_ = ' '"
	_cRetorno += "        AND SE2.E2_FORNECE = '"+_cCoop+"' "
	_cRetorno += "        AND SE2.E2_VENCTO BETWEEN '"+_dIniVcto+"' AND '"+_dFimVcto+"' "
	_cRetorno += "        AND SE2.E2_EMISSAO <= '"+_dDtEmiFim+"' "
	//_cRetorno += "        AND SE2.E2_PREFIXO NOT IN  ('"+_cSerieNF+"','CCH','G04')"
	_cRetorno += "        AND SE2.E2_PREFIXO NOT IN  ('"+_cSerieNF+"','CCH')"
	//_cRetorno += "        AND SE2.E2_PREFIXO NOT EXISTS  ('"+_cSerieNF+"','CCH')"
	//	_cRetorno += "        AND ( SE2.E2_PREFIXO + SE2.E2_TIPO NOT IN ('GLENF','GLENDF') )"
	_cRetorno += "        AND ( SE2.E2_PREFIXO + SE2.E2_TIPO NOT IN ('GLENF') )"
	//_cRetorno += "        AND ( SE2.E2_PREFIXO + SE2.E2_TIPO NOT EXISTS ('GLENF') )"
	_cRetorno += "        AND SE2.E2_L_EVENT <> '100010'"
	_cRetorno += "        AND SE2.E2_L_EVENT <> ''"
	_cRetorno += "        AND SE2.E2_BAIXA < '"+_dDtEmiIni+"' "
	_cRetorno += "        AND ( ( SE2.E2_ORIGEM = 'FINA290'"
	_cRetorno += "                AND SE2.E2_EMISSAO <> SE2.E2_VENCTO )"
	_cRetorno += "               OR ( SE2.E2_ORIGEM <> 'FINA290' ) )"
	
ElseIf Alltrim(_pcTipo) == "3"  //Filtra E5_DATA menor que a emissใo inicial, para pegar titulos que foram quitados em periodos anteriores
	
	_cRetorno += " SELECT DISTINCT "
	_cRetorno += " SE2.E2_FILORIG                 FILIAL,"
	_cRetorno += "        SE2.E2_FORNECE                 FORNECE,"
	_cRetorno += "        SE2.E2_EMISSAO                 EMISSAO,"
	_cRetorno += "        SE2.E2_NUM                     NUM,"
	_cRetorno += "        SE2.E2_PARCELA                 PARCELA,"
	_cRetorno += "        SE2.E2_VENCTO                  VENCTO,"
	_cRetorno += "        UPPER(SE2.E2_HIST)             HISTORICO,"
	_cRetorno += "        SE2.E2_PREFIXO                 PREFIXO,"
	_cRetorno += "        SE2.E2_VALOR                   AS VALOR,"
	_cRetorno += "        ( SE2.E2_ACRESC - SE2.E2_DECRESC ) AS ACRES,"
	_cRetorno += "        ( SE2.E2_SALDO + SE2.E2_SDACRES )  AS SALDO,"
	_cRetorno += "        CASE"
	_cRetorno += "          WHEN SE2.E2_BAIXA <> '' THEN SE2.E2_BAIXA"
	_cRetorno += "          ELSE ''"
	_cRetorno += "        END                        AS BAIXA,"
	_cRetorno += "        SE2.E2_TIPO                    TIPO,"
	_cRetorno += "        CASE"
	_cRetorno += "          WHEN SE2.E2_TIPO = 'NDF' THEN 'D'"
	_cRetorno += "          ELSE 'C'"
	_cRetorno += "        END                        AS DEBCRED,"
	_cRetorno += "        SE2.E2_EMISSAO                 PRIORIDADE2,"
	_cRetorno += "        '2'                        PRIORIDADE1,"
	_cRetorno += "        'REGRAGERAL'               _QUERY"
	
	_cRetorno += " FROM   "+RetSqlName("SE2")+" SE2"
	
	_cRetorno += " JOIN "+RetSqlName("SE5") +" SE5"
	_cRetorno += " ON  SE5.E5_FILIAL  = SE2.E2_FILIAL"
	_cRetorno += " AND SE5.E5_PREFIXO = SE2.E2_PREFIXO"
	_cRetorno += " AND SE5.E5_NUMERO  = SE2.E2_NUM"
	_cRetorno += " AND SE5.E5_PARCELA = SE2.E2_PARCELA"
	_cRetorno += " AND SE5.E5_TIPO    = SE2.E2_TIPO"
	_cRetorno += " AND SE5.E5_CLIFOR  = SE2.E2_FORNECE"
	_cRetorno += " AND SE5.E5_LOJA    = SE2.E2_LOJA"
	_cRetorno += " AND SE5.E5_DATA    <= '"+_dDtEmiIni+"' "
	_cRetorno += " AND SE5.E5_MOTBX IN ('CHQ','BOL')"
	_cRetorno += " AND SE5.D_E_L_E_T_ = ' '"

	_cRetorno += " WHERE  SE2.D_E_L_E_T_ = ' '"
	_cRetorno += "        AND SE2.E2_FORNECE = '"+_cCoop+"' "
	_cRetorno += "        AND SE2.E2_VENCTO BETWEEN '"+_dIniVcto+"' AND '"+_dFimVcto+"' "
	_cRetorno += "        AND SE2.E2_PREFIXO NOT IN  ('"+_cSerieNF+"','CCH')"
	_cRetorno += "        AND ( SE2.E2_PREFIXO + SE2.E2_TIPO NOT IN ('GLENF') )"
	_cRetorno += "        AND SE2.E2_L_EVENT <> ''"

ElseIf Alltrim(_pcTipo) == "4" //Amarra E5_DATA = E2_EMISSAO para pegar titulos gerados para transfer๊ncia para o SE1
	
	_cRetorno += " SELECT DISTINCT "
	_cRetorno += " SE2.E2_FILORIG                 FILIAL,"
	_cRetorno += "        SE2.E2_FORNECE                 FORNECE,"
	_cRetorno += "        SE2.E2_EMISSAO                 EMISSAO,"
	_cRetorno += "        SE2.E2_NUM                     NUM,"
	_cRetorno += "        SE2.E2_PARCELA                 PARCELA,"
	_cRetorno += "        SE2.E2_VENCTO                  VENCTO,"
	_cRetorno += "        UPPER(SE2.E2_HIST)             HISTORICO,"
	_cRetorno += "        SE2.E2_PREFIXO                 PREFIXO,"
	_cRetorno += "        SE2.E2_VALOR                   AS VALOR,"
	_cRetorno += "        ( SE2.E2_ACRESC - SE2.E2_DECRESC ) AS ACRES,"
	_cRetorno += "        ( SE2.E2_SALDO + SE2.E2_SDACRES )  AS SALDO,"
	_cRetorno += "        CASE"
	_cRetorno += "          WHEN SE2.E2_BAIXA <> '' THEN SE2.E2_BAIXA"
	_cRetorno += "          ELSE ''"
	_cRetorno += "        END                        AS BAIXA,"
	_cRetorno += "        SE2.E2_TIPO                    TIPO,"
	_cRetorno += "        CASE"
	_cRetorno += "          WHEN SE2.E2_TIPO = 'NDF' THEN 'D'"
	_cRetorno += "          ELSE 'C'"
	_cRetorno += "        END                        AS DEBCRED,"
	_cRetorno += "        SE2.E2_EMISSAO                 PRIORIDADE2,"
	_cRetorno += "        '2'                        PRIORIDADE1,"
	_cRetorno += "        'REGRAGERAL'               _QUERY"
	
	_cRetorno += " FROM   "+RetSqlName("SE2")+" SE2"
	
	_cRetorno += " JOIN "+RetSqlName("SE5") +" SE5"
	_cRetorno += " ON  SE5.E5_FILIAL  = SE2.E2_FILIAL"
	_cRetorno += " AND SE5.E5_PREFIXO = SE2.E2_PREFIXO"
	_cRetorno += " AND SE5.E5_NUMERO  = SE2.E2_NUM"
	_cRetorno += " AND SE5.E5_PARCELA = SE2.E2_PARCELA"
	_cRetorno += " AND SE5.E5_TIPO    = SE2.E2_TIPO"
	_cRetorno += " AND SE5.E5_CLIFOR  = SE2.E2_FORNECE"
	_cRetorno += " AND SE5.E5_LOJA    = SE2.E2_LOJA"
//	_cRetorno += " AND SE5.E5_DATA    <= '"+_dDtEmiIni+"' "
	_cRetorno += " AND SE5.E5_MOTBX IN ('CHQ','BOL')"
	_cRetorno += " AND SE5.D_E_L_E_T_ = ' '"
	
	_cRetorno += " WHERE  SE2.D_E_L_E_T_ = ' '"
	_cRetorno += "        AND SE2.E2_FORNECE = '"+_cCoop+"' "
	_cRetorno += "        AND SE2.E2_VENCTO BETWEEN '"+_dIniVcto+"' AND '"+_dFimVcto+"' "
//	_cRetorno += "        AND SE2.E2_EMISSAO <= '"+_dDtEmiFim+"' "
	_cRetorno += "        AND SE2.E2_EMISSAO = SE5.E5_DATA "
	_cRetorno += "        AND SE2.E2_PREFIXO NOT IN  ('"+_cSerieNF+"','CCH')"
	_cRetorno += "        AND ( SE2.E2_PREFIXO + SE2.E2_TIPO NOT IN ('GLENF') )"
	_cRetorno += "        AND SE2.E2_L_EVENT <> '100010'"
	_cRetorno += "        AND SE2.E2_L_EVENT <> ''"

EndIf

Return(_cRetorno)
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRetDebRng บAutor  ณMicrosiga           บ Data ณ  04/24/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณRetorna debitos renegociados baixados por fatura.           บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function RetDebRng(_pcFatura)

Local _cAliasFAT 	:= GetNextAlias()
Local _cQry			:= ""
Local oFont12 		:= TFont():New("COURIER NEW",12,12,,.F.,,,,.T.,.F.)

_cQry:= " SELECT E5_FILORIG          FILIAL,"
_cQry+= "        E5_CLIFOR           FORNECE,"
_cQry+= "        E5_DATA             EMISSAO,"
_cQry+= "        E5_NUMERO           NUM,"
_cQry+= "        E5_PARCELA          PARCELA,"
_cQry+= "        E2_VENCTO           VENCTO,"
_cQry+= "        'DEBITOS RENEGOCIADOS' HISTORICO,"
_cQry+= "        ''                  PREFIXO,"
_cQry+= "        SUM(CASE"
_cQry+= "              WHEN E5_TIPODOC <> 'ES' THEN E5_VALOR"
_cQry+= "              ELSE -E5_VALOR"
_cQry+= "            END)            VALOR,"
_cQry+= "        0                   AS ACRES,"
_cQry+= "        0                   SALDO,"
_cQry+= "        E5_DATA             BAIXA,"
_cQry+= "        E5_TIPO             TIPO,"
_cQry+= "        'D'                 AS DEBCRED,"
_cQry+= "        E5_DATA             PRIORIDADE2,"
_cQry+= "        '1'                 PRIORIDADE1,"
_cQry+= "        'DEBITO-RENEGOCIADO'      _QUERY"
_cQry+= " FROM "+RetSqlName("SE2")+" SE2"
_cQry+= "        JOIN "+RetSqlName("SE5")+" SE5"
_cQry+= "          ON SE2.E2_FILIAL = SE5.E5_FILIAL"
_cQry+= "             AND SE5.E5_DATA BETWEEN '"+_dDtEmiIni+"' AND '"+_dDtEmiFim+"'
_cQry+= "             AND SE2.E2_PREFIXO = SE5.E5_PREFIXO"
_cQry+= "             AND SE2.E2_NUM = SE5.E5_NUMERO"
_cQry+= "             AND SE2.E2_PARCELA = SE5.E5_PARCELA"
_cQry+= "             AND SE2.E2_TIPO = SE5.E5_TIPO"
_cQry+= "             AND SE2.E2_FORNECE = SE5.E5_CLIFOR"
_cQry+= "             AND SE2.E2_LOJA = SE5.E5_LOJA"
_cQry+= "             AND SE5.E5_SITUACA <> 'C'"
_cQry+= "             AND SE2.E2_L_EVENT <> ''"
_cQry+= " 			  AND SE5.E5_MOTBX = 'FAT'"
_cQry+= "             AND SE5.E5_TIPODOC IN ( 'BA', 'VL', 'ES' )"
//_cQry+= "             AND SE5.E5_PREFIXO <> 'CCH'"  // COMENTADO EM 08/05/14
_cQry+= "             AND SE5.D_E_L_E_T_ = ' '"
_cQry+= " WHERE E2_FILIAL = '"+xFilial("SE2")+"' "
_cQry+= " AND   E2_FORNECE = '"+_cCoop+"' "
_cQry+= " AND   E2_TIPO = 'NDF'"
//_cQry+= " AND   (E2_VENCTO < '"+_dIniVcto+"' OR E2_VENCTO > '"+_dFimVcto+"')"
_cQry+= " AND   E2_VENCTO > '"+_dFimVcto+"'"
_cQry+= " AND   E2_FATURA = '"+_pcFatura+"'"
_cQry+= " AND   SE2.D_E_L_E_T_ = ' '"
_cQry+= " GROUP  BY E5_FILORIG,"
_cQry+= "           E5_NUMERO,"
_cQry+= "           E5_PARCELA,"
_cQry+= "           E5_CLIFOR,"
_cQry+= "           E5_DATA,"
_cQry+= "           E2_VENCTO,"
_cQry+= "           E5_TIPO  "

TcQuery _cQry New Alias &(_cAliasFAT)

dbSelectArea(_cAliasFAT)
(_cAliasFAT)->(dbGoTop())

While !(_cAliasFAT)->(Eof())
	
	If oReport:Row() >= oReport:PageHeight() - 100
		oReport:EndPage()
		oReport:StartPage()
		PrintC()
	Else
		oReport:SkipLine(1)
	EndIf
	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01, DTOC(STOD((_cAliasFAT)->EMISSAO))										,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.11, (_cAliasFAT)->NUM +"-" +(_cAliasFAT)->PARCELA							,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.22, FGLT0593((_cAliasFAT)->FILIAL)											,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.28, DTOC(STOD((_cAliasFAT)->VENCTO))										,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.39, SUBSTRING((_cAliasFAT)->HISTORICO,1,32)		   							,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.68, (_cAliasFAT)->DEBCRED													,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.71, cValtoChar(Transform(((_cAliasFAT)->VALOR),"@E 999,999.99"))			,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.78, cValtoChar(Transform(((_cAliasFAT)->ACRES),"@E 999,999.99"))			,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.89, cValtoChar(Transform(((_cAliasFAT)->VALOR+(_cAliasFAT)->ACRES),"@E 999,999.99")),oFont12)
	
	If ALLTRIM((_cAliasFAT)->DEBCRED	) == "D"
		_nTVlrOrig  += (_cAliasFAT)->VALOR+(_cAliasFAT)->ACRES
		_nTotTitAtu := _nTotTitAtu + _nVlrPago// - Iif(EXT->ACRES <0,EXT->ACRES,0)
		_nVlDescont += (_cAliasFAT)->VALOR+(_cAliasFAT)->ACRES
	else
		_nTVlrOrig  -= (_cAliasFAT)->VALOR+(_cAliasFAT)->ACRES
		_nTotTitAtu := _nTotTitAtu - Iif((_cAliasFAT)->ACRES <0,(_cAliasFAT)->ACRES,0)
		_nVlDescont -= (_cAliasFAT)->VALOR
	EndIf
	
	aAdd(_aTit,{_cCoop,DTOC(STOD((_cAliasFAT)->EMISSAO)),(_cAliasFAT)->PREFIXO+(_cAliasFAT)->NUM +"-" +(_cAliasFAT)->PARCELA,FGLT0593((_cAliasFAT)->FILIAL),DTOC(STOD((_cAliasFAT)->VENCTO)),SUBSTRING((_cAliasFAT)->HISTORICO,1,32),(_cAliasFAT)->DEBCRED , Transform((_cAliasFAT)->VALOR,"@E 999,999.99"), Transform((_cAliasFAT)->ACRES,"@E 999,999.99"), Transform((_cAliasFAT)->VALOR+(_cAliasFAT)->ACRES,"@E 999,999.99")})
	
	(_cAliasFAT)->(dbSkip())
	
EndDo

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGravZLV   บAutor  ณMicrosiga           บ Data ณ  05/05/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณGrava o saldo na tabela ZLV. Utilizado apenas para transportบฑฑ
ฑฑบ          ณador granel                                                 บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

STATIC FUNCTION GravZLV(_cCooZLV,_nVlrZLV,_cDtZLV)

DbSelectArea("ZLV")
DbSetOrder(1)
If !ZLV->(DbSeek(xFilial("ZLV")+_cDtZLV+_cCooZLV))
	RecLock("ZLV",.T.)
	ZLV->ZLV_PERIOD := _cDtZLV
	ZLV->ZLV_RETIRO := _cCooZLV
	ZLV->ZLV_SALDO	:= _nVlrZLV
	ZLV->ZLV_SLDCAL	:= _nVlrZLV
	ZLV->ZLV_MESDEB := 0
	ZLV->(MsUnlock())
ELSE
	RecLock("ZLV",.F.)
	ZLV->ZLV_SALDO	:= _nVlrZLV
	ZLV->ZLV_MESDEB := 0
	ZLV->(MsUnlock())
EndIf

RETURN
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณCriaTmp   บAutor  ณMicrosiga           บ Data ณ  05/05/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณCria tabela temporแria.                                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function CriaTmp()

Local _cCreateTable := ""
Local _cAliasRET    := CheckTMP()

_cCreateTable := " CREATE TABLE "+_cAliasRET+" ("
_cCreateTable += " 	FILIAL  VARCHAR(06),"
_cCreateTable += " 		FORNECE	VARCHAR(06),"
_cCreateTable += " 		EMISSAO	VARCHAR(08),"
_cCreateTable += " 		NUM	    VARCHAR(09),"
_cCreateTable += " 		PARCELA	VARCHAR(02),"
_cCreateTable += " 		VENCTO	VARCHAR(08),"
_cCreateTable += " 		HISTORICO VARCHAR(60),"
_cCreateTable += " 		PREFIXO	  VARCHAR(03),"
_cCreateTable += " 		VALOR	NUMERIC(13,2),"
_cCreateTable += " 		ACRES	NUMERIC(13,2),"
_cCreateTable += " 		SALDO	NUMERIC(13,2),"
_cCreateTable += " 		BAIXA	VARCHAR(08),"
_cCreateTable += " 		TIPO	VARCHAR(03),"
_cCreateTable += " 		DEBCRED	VARCHAR(01),"
_cCreateTable += " 		PRIORIDADE2	VARCHAR(08),"
_cCreateTable += " 		PRIORIDADE1	VARCHAR(01),"
_cCreateTable += " 		_QUERY VARCHAR(20)"
_cCreateTable += ")"

If (TCSQLExec(_cCreateTable) < 0)
	MsgStop("TCSQLError() " + TCSQLError())
EndIf

Return(_cAliasRET)
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณDropTmp   บAutor  ณMicrosiga           บ Data ณ  05/05/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณApaga tabela temporแria.                                    บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function DropTmp(_pcAliasTMP)

Local _cTabela := _pcAliasTMP

cStatement := "if exists(select name from sysobjects where name like '" + _cTabela + "%' and xtype = 'U')" + CRLF
cStatement += "begin" + CRLF
cStatement += "  drop table " + _cTabela + "" + CRLF
cStatement += "end" + CRLF

If (TCSQLExec(cStatement) < 0)
	MsgStop("TCSQLError() " + TCSQLError())
EndIf

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณCheckTmp  บAutor  ณMicrosiga           บ Data ณ  05/05/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณVerific se existe tabela temporaria no banco de dados.      บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function CheckTmp()

Local _cTabela   := "X"+DtoS(ddatabase)+StrTran(Time(),":","")+StrZero(RANDOMIZE(1,32000),5)
Local _lExistTMP := .T.

While _lExistTMP
	
	If TcCanOpen(_cTabela)
		_cTabela := Soma1(_cTabela)
	Else
		_lExistTMP := .F.
	EndIf
	
EndDo

Return(_cTabela)
