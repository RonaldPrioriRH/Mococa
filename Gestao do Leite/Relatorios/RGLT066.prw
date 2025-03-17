#include "totvs.ch"
#include "protheus.ch"
#include "topconn.ch"


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ RGLT066     บ Autor ณ Ariclenes M. Costa           บ Data da Criacao  ณ 23/09/2013             				บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Relatorio Extratifica็ใo por quantidade															                บฑฑ
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

User Function RGLT066()

	Local cPerg := "RGLT066" // var pergunta
	
	Private oReport
	Private lInverte	:= .F.
	Private cMarca	:= GetMark()
	Private nCity       
	Private cTpCli


	SetPrvt("oDlg","oSay")
	
	CriaSX1(cPerg)
	
	Pergunte(cPerg,.T.,'Extratifica็ใo por quantidade')
	
	sfPrint()
		
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณsfPrint ณ   Autor ณ Ariclenes M. Costa    ณ Data ณ 23/09/13 ณฑฑ
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
ฑฑณFuncao    ณReportDef ณ Autor ณ Ariclenes M. Costa    ณ Data ณ 23/09/13 ณฑฑ
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
	
	oReport := TReport():New("RGLT066","Relat๓rio Extratifi็ใo por Quantidade ",cPerg,{|oReport|PrintReport(oReport)},"Extratifi็ใo por Quantidade")
	
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
ฑฑณFuncao    ณPrintReport ณ Autor ณ Ariclenes M. Costa    ณ Data ณ 23/09/13 บฑฑ
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

	Local cQuery := ""
	
	Local _nTotProd := 0
	Local _nTotVol := 0
	Local _nTotBru := 0
	Local _nTotLiq := 0

	oReport:SkipLine(6)
	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)	

	oReport:SkipLine(1)

	//Consulta para buscar informacoes
	cQuery :=	"SELECT '1' AS SEQ,"
	cQuery +=  "'Ate 50 litros' AS FAIXA,"
	cQuery +=	" (SELECT COUNT(DISTINCT ZLF_RETIRO) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF_QTDBOM <= 50) AS PRODUTORES,"
	cQuery +=	" SUM(ZLF.ZLF_QTDBOM) AS ZLF_QTDBOM,"
	cQuery +=	" (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM <= 50 ) AS BRUTO,"
	cQuery +=	" (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM <= 50) - (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'D' AND ZLF.ZLF_QTDBOM <= 50) AS LIQUIDO"
	cQuery +=	" FROM "+RetSqlName("ZLF")+" ZLF "
	cQuery +=	" WHERE ZLF.ZLF_QTDBOM <= 50 AND ZLF.ZLF_DTFIM BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' AND ZLF.D_E_L_E_T_ = ' '"
	
	cQuery += 	" UNION "
	
	cQuery +=	"SELECT '2' AS SEQ,"
	cQuery +=	"'de 51 a 100' AS FAIXA,"
	cQuery +=	"(SELECT COUNT(DISTINCT ZLF_RETIRO) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_QTDBOM > 50 AND ZLF.ZLF_QTDBOM <= 100) AS PRODUTORES,"
	cQuery +=	"SUM(ZLF.ZLF_QTDBOM) AS ZLF_QTDBOM,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 50 AND ZLF.ZLF_QTDBOM <= 100 ) AS BRUTO,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 50 AND ZLF.ZLF_QTDBOM <= 100) - (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'D' AND ZLF.ZLF_QTDBOM > 50 AND ZLF.ZLF_QTDBOM <= 100) AS LIQUIDO"
	cQuery +=	" FROM "+RetSqlName("ZLF")+" ZLF "
	cQuery +=	" WHERE ZLF.ZLF_QTDBOM > 50 AND"
	cQuery += 	" ZLF.ZLF_QTDBOM <= 100 AND ZLF.ZLF_DTFIM BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' AND ZLF.D_E_L_E_T_ = ' '" 
	
	cQuery += 	" UNION "
	
	cQuery +=	"SELECT '3' AS SEQ,"
	cQuery +=	"'de 101 a 200' AS FAIXA,"
	cQuery +=	"(SELECT COUNT(DISTINCT ZLF_RETIRO) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_QTDBOM > 100 AND ZLF.ZLF_QTDBOM <= 200) AS PRODUTORES,"
	cQuery +=	"SUM(ZLF.ZLF_QTDBOM) AS ZLF_QTDBOM,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 100 AND ZLF.ZLF_QTDBOM <= 200 ) AS BRUTO,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 100 AND ZLF.ZLF_QTDBOM <= 200) - (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'D' AND ZLF.ZLF_QTDBOM > 100 AND ZLF.ZLF_QTDBOM <= 200) AS LIQUIDO"
	cQuery +=	" FROM "+RetSqlName("ZLF")+" ZLF "
	cQuery +=	" WHERE ZLF.ZLF_QTDBOM > 100 AND"
	cQuery += 	" ZLF.ZLF_QTDBOM <= 200 AND ZLF.ZLF_DTFIM BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' AND ZLF.D_E_L_E_T_ = ' '"
	
	cQuery += 	" UNION "
	
	cQuery +=	"SELECT '4' AS SEQ,"
	cQuery +=	"'de 201 a 300' AS FAIXA,"
	cQuery +=	"(SELECT COUNT(DISTINCT ZLF_RETIRO) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_QTDBOM > 200 AND ZLF.ZLF_QTDBOM <= 300) AS PRODUTORES,"
	cQuery +=	"SUM(ZLF.ZLF_QTDBOM) AS ZLF_QTDBOM,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 200 AND ZLF.ZLF_QTDBOM <= 300 ) AS BRUTO,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 200 AND ZLF.ZLF_QTDBOM <= 300) - (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'D' AND ZLF.ZLF_QTDBOM > 200 AND ZLF.ZLF_QTDBOM <= 300) AS LIQUIDO"
	cQuery +=	" FROM "+RetSqlName("ZLF")+" ZLF "
	cQuery +=	" WHERE ZLF.ZLF_QTDBOM > 200 AND"
	cQuery += 	" ZLF.ZLF_QTDBOM <= 300 AND ZLF.ZLF_DTFIM BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' AND ZLF.D_E_L_E_T_ = ' '"
	
	cQuery += 	" UNION "
	
	cQuery +=	"SELECT '5' AS SEQ,"
	cQuery +=	"'de 301 a 400' AS FAIXA,"
	cQuery +=	"(SELECT COUNT(DISTINCT ZLF_RETIRO) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_QTDBOM > 300 AND ZLF.ZLF_QTDBOM <= 400) AS PRODUTORES,"
	cQuery +=	"SUM(ZLF.ZLF_QTDBOM) AS ZLF_QTDBOM,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 300 AND ZLF.ZLF_QTDBOM <= 400 ) AS BRUTO,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 300 AND ZLF.ZLF_QTDBOM <= 400) - (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'D' AND ZLF.ZLF_QTDBOM > 300 AND ZLF.ZLF_QTDBOM <= 400) AS LIQUIDO"
	cQuery +=	" FROM "+RetSqlName("ZLF")+" ZLF "
	cQuery +=	" WHERE ZLF.ZLF_QTDBOM > 300 AND"
	cQuery += 	" ZLF.ZLF_QTDBOM <= 400 AND ZLF.ZLF_DTFIM BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' AND ZLF.D_E_L_E_T_ = ' '"
	
	cQuery += 	" UNION "
	
	cQuery +=	"SELECT '6' AS SEQ,"
	cQuery +=	"'de 401 a 500' AS FAIXA,"
	cQuery +=	"(SELECT COUNT(DISTINCT ZLF_RETIRO) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_QTDBOM > 400 AND ZLF.ZLF_QTDBOM <= 500) AS PRODUTORES,"
	cQuery +=	"SUM(ZLF.ZLF_QTDBOM) AS ZLF_QTDBOM,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 400 AND ZLF.ZLF_QTDBOM <= 500 ) AS BRUTO,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 400 AND ZLF.ZLF_QTDBOM <= 500) - (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'D' AND ZLF.ZLF_QTDBOM > 400 AND ZLF.ZLF_QTDBOM <= 500) AS LIQUIDO"
	cQuery +=	" FROM "+RetSqlName("ZLF")+" ZLF "
	cQuery +=	" WHERE ZLF.ZLF_QTDBOM > 400 AND"
	cQuery += 	" ZLF.ZLF_QTDBOM <= 500 AND ZLF.ZLF_DTFIM BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' AND ZLF.D_E_L_E_T_ = ' '" 

	cQuery += 	" UNION "
	
	cQuery +=	"SELECT '7' AS SEQ,"
	cQuery +=	"'de 501 a 1.000' AS FAIXA,"
	cQuery +=	"(SELECT COUNT(DISTINCT ZLF_RETIRO) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_QTDBOM > 500 AND ZLF.ZLF_QTDBOM <= 1000) AS PRODUTORES,"
	cQuery +=	"SUM(ZLF.ZLF_QTDBOM) AS ZLF_QTDBOM,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 500 AND ZLF.ZLF_QTDBOM <= 1000 ) AS BRUTO,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 500 AND ZLF.ZLF_QTDBOM <= 1000) - (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'D' AND ZLF.ZLF_QTDBOM > 500 AND ZLF.ZLF_QTDBOM <= 1000) AS LIQUIDO"
	cQuery +=	" FROM "+RetSqlName("ZLF")+" ZLF "
	cQuery +=	" WHERE ZLF.ZLF_QTDBOM > 500 AND"
	cQuery += 	" ZLF.ZLF_QTDBOM <= 1000 AND ZLF.ZLF_DTFIM BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' AND ZLF.D_E_L_E_T_ = ' '" 
	
	cQuery += 	" UNION "
	
	cQuery +=	"SELECT '8' AS SEQ,"
	cQuery +=	"'Acima de 1.000' AS FAIXA,"
	cQuery +=	"(SELECT COUNT(DISTINCT ZLF_RETIRO) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_QTDBOM > 1000) AS PRODUTORES,"
	cQuery +=	"SUM(ZLF.ZLF_QTDBOM) AS ZLF_QTDBOM,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 1000 ) AS BRUTO,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 1000) - (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'D' AND ZLF.ZLF_QTDBOM > 1000) AS LIQUIDO"
	cQuery +=	" FROM "+RetSqlName("ZLF")+" ZLF "
	cQuery +=	" WHERE ZLF.ZLF_QTDBOM > 1000 AND ZLF.ZLF_DTFIM BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' AND ZLF.D_E_L_E_T_ = ' '"
	
	cQuery +=  "ORDER BY SEQ"
	
	If Select ("Qry") <> 0
		Qry->(dbCloseArea())
	EndIf
	
	cQuery := changeQuery(cQuery)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,cQuery),"Qry",.F.,.T.)
	
	Qry->(dbGoTop())

	//Criando Secao do Faturamento
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.35	, "Extratifica็ใo por quantidade" 		,oFont16NS)
		
	oReport:SkipLine(5)
	
	//Criando Menu dos Produtos
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.05,"Faixa"				,oFont12NS)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25,"N๚mero de produtores"					,oFont12NS)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.43,"Volume granelizado(L)"				,oFont12NS)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62,"Pgto. Bruto(R$)"				,oFont12NS)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.75,"Pgto. Lํquido(R$)"				,oFont12NS)
	
	oReport:SkipLine(1)
	
	While Qry->(!Eof())
				
			oReport:SkipLine(1)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.05, qry->FAIXA				,oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25,CVALTOCHAR(qry->PRODUTORES)				,oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.43,CVALTOCHAR(qry->ZLF_QTDBOM)			,oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62,CVALTOCHAR(qry->BRUTO)			,oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.75,CVALTOCHAR(qry->LIQUIDO)			,oFont12)
			
			//Totalizador
			_nTotProd := _nTotProd + qry->PRODUTORES
			_nTotVol := _nTotVol + qry->ZLF_QTDBOM
			_nTotBru := _nTotBru + qry->BRUTO
			_nTotLiq := _nTotLiq + qry->LIQUIDO
				
			Qry->(dbSkip())
		
			If oReport:Row() >= oReport:PageHeight() - 200
		
				oReport:EndPage()
				oReport:StartPage()
				oReport:SkipLine(2)

				//Criando Menu dos Produtos
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.05,"Faixa"			,oFont12NS)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25,"N๚mero de produtores"					,oFont12NS)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.43,"Volume granelizado(L)"			,oFont12NS)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62,"Pgto. Bruto(R$)"			,oFont12NS)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.75,"Pgto. Lํquido(R$)"			,oFont12NS)
			EndIf
					
	EndDo
	

		
	oReport:SkipLine(2)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.05, "Total geral:"				,oFont12N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25, CVALTOCHAR(_nTotProd)				,oFont12N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.43, CVALTOCHAR(_nTotVol)				,oFont12N)	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62, CVALTOCHAR(_nTotBru)				,oFont12N)	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.75, CVALTOCHAR(_nTotLiq)				,oFont12N)		
	
	
	Qry->(DBCLOSEAREA())
	oReport:EndPage()
		
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ CriaSX1  บ Autor ณ Ariclenes M. Costa บ Data ณ  23/09/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para criacao das perguntas caso elas nao existam.   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
static function criaSX1(cPerg)

U_xPutSx1(cPerg, '01', 'Data de?'            , '', '', 'mv_ch1', 'D', 8                     , 0, 0, 'G', '', ''   , '', '', 'mv_par01')
U_xPutSx1(cPerg, '02', 'Data at้?'           , '', '', 'mv_ch2', 'D', 8                     , 0, 0, 'G', '', ''   , '', '', 'mv_par02')

return  