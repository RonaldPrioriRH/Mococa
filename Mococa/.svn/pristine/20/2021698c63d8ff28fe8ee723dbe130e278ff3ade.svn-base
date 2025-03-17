#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "COLORS.CH"
#INCLUDE "RPTDEF.CH"
#INCLUDE "FWPrintSetup.ch"

#DEFINE _ENTER Chr(13)+Chr(10)     
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT020   บ Autor ณ Guilherme Fran็a    	บ Data da Criacao  ณ 22/12/2014                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Relatorio Titulos a Receber Personalizado                                                           			บฑฑ
ฑฑบ          ณ Demonstra todos os titulos a receber em aberto, calculando juros e multas para atrasos de acordo com as      บฑฑ
ฑฑบ			 ณ regras da cooperativa.                                                                                       บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Setor Financeiro                      																บฑฑ
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

User function RGLT020()

Private cPerg	:= "RGLT020"
Private _cAno	:= ""
Private _cMes	:= ""
Private _dEmiIni	:= ""
Private _dEmiFim	:= ""
Private _dVencIni	:= ""
Private _dVencFim	:= ""


AjustaSX1(cPerg)

If !Pergunte(cPerg,.T.)
	Return
EndIf

oReport := ReportDef()
	
oReport:PrintDialog()

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณReportDef บAutor  ณMicrosiga           บ Data ณ  11/24/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ReportDef()

Private oReport
Private oSec1  
Private oSec2
Private oSec3
Private aTam := {}
Private cParam := ""
Private aOrd := {"Nome","Codigo","Grupo Preco"}


oReport := TReport():NEW("RGLT020" ,"Rela็ใo Titulos a descontar GLT - Vencto:"+DTOC(MV_PAR07)+" a "+DTOC(MV_PAR08)+"" ,;
			cPerg,{|oReport|PrintReport(oReport)} ,"Este relat๓rio imprime os titulos a receber personalizado.")

oReport:nFontBody	:= 9// Define o tamanho da fonte.
oReport:nLineHeight	:= 50 // Define a altura da linha.
oReport:CFONTBODY:="Courier New" //Nome da Fonte
oReport:GetOrientation(2)
oReport:SetLandscape(.T.)    
oReport:SetTotalInLine(.F.)    




oSec1 := TRSection():new(oReport,"Cliente",{""},aOrd)
TRCELL():NEW(oSec1,"A1_COD")//			,,"Matricula"								,	,15	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec1,"A1_LOJA")//			,,"Matricula"								,	,15	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec1,"A1_NOME")//		,,"Nome"  							,	,50	,,,"LEFT",	,"LEFT",,,,,,.F.)
//TRCELL():NEW(oSec1,"FONE"		,,"Telefone"  							,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec1,"GRUPO"	,,"Grupo Pre็o"  							,	,50	,,,"LEFT",	,"LEFT",,,,,,.F.)

oSec2 := TRSection():new(oReport,"Titulos",{""})
TRCELL():NEW(oSec2,"E1_PREFIXO")//		,,"Documento."								,	,30	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec2,"E1_NUM"		,,"Documento/Prc"						,	,25	,,,"LEFT",	,"LEFT",,,,,,.F.)
//TRCELL():NEW(oSec2,"E1_PARCELA"	,,"Prc"								,	,15	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec2,"E1_TIPO"		,,"Tipo"								,	,15	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec2,"E1_EMISSAO"	,,"Emissao"		,	,25	,,,"LEFT",	,"LEFT" ,,,,,,.F.) 
TRCELL():NEW(oSec2,"E1_VENCTO"	,,"Vencimento"		,	,25	,,,"LEFT",	,"LEFT" ,,,,,,.F.) 
TRCELL():NEW(oSec2,"E1_VALOR")//  		,,"Valor"						,	,20	,,,"RIGHT",	,"RIGHT",,,,,,.F.)
TRCELL():NEW(oSec2,"E1_SALDO")//  		,,"Valor"						,	,20	,,,"RIGHT",	,"RIGHT",,,,,,.F.)
//TRCELL():NEW(oSec2,"ATRASO" 		,,"Dias Atraso"						,	,10	,,,"CENTER",	,"CENTER",,,,,,.F.)
//TRCELL():NEW(oSec2,"E1_JUROS")// 		,,"Juros"						,	,20	,,,"RIGHT",	,"RIGHT",,,,,,.F.)
//TRCELL():NEW(oSec2,"E1_MULTA")//	,,"Desconto"					,	,20	,,,"RIGHT",	,"RIGHT",,,,,,.F.)
TRCELL():NEW(oSec2,"VLRATU"  		,,"Vlr.Atual"						,"@E 999,999,999.99",25	,,,"RIGHT",	,"RIGHT",,,,,,.F.)
TRCELL():NEW(oSec2,"E1_NATUREZ"		,,"Natureza"						,	,20	,,,"RIGHT",	,"RIGHT",,,,,,.F.)
TRCELL():NEW(oSec2,"E1_HIST" 		,,"Historico"						,	,30	,,,"RIGHT",	,"RIGHT",,,,,,.F.)
TRCELL():NEW(oSec2,"EVENTO"		,,"Evento Leite"						,	,30	,,,"RIGHT",	,"RIGHT",,,,,,.F.)

oSec2:Cell("VLRATU"):SetType("N")
//oSec2:Cell("ATRASO"):SetType("N")

//Cria quebra por nome
oBreak := TRBreak():New(oSec1,oSec1:Cell("A1_NOME"),"Sub-Total --->")

//GetFontSize(cFont,nFontSize,lBold,lItalic,lUnderline)
//oBreak:GetFontSize("Courier New",10,.t.,.f.,.f.)
oBreak:nFontBody	:= 11// Define o tamanho da fonte.
oBreak:lBold:= .t.


//Cria totalizadores relacionando com o objeto da quebra
oSumValor := TRFunction():New(oSec2:Cell("E1_VALOR"),NIL,"SUM",oBreak)
oSumSaldo := TRFunction():New(oSec2:Cell("E1_SALDO"),NIL,"SUM",oBreak)
//oSumJuros := TRFunction():New(oSec2:Cell("E1_JUROS"),NIL,"SUM",oBreak)
//oSumMulta := TRFunction():New(oSec2:Cell("E1_MULTA"),NIL,"SUM",oBreak)
oSumVlratu := TRFunction():New(oSec2:Cell("VLRATU"),NIL,"SUM",oBreak)

//Inibe a apresenta็ใo dos totalizadores no final da secao
oSumValor:SetEndSection(.F.)
oSumSaldo:SetEndSection(.F.)
//oSumJuros:SetEndSection(.F.)
//oSumMulta:SetEndSection(.F.)
oSumVlratu:SetEndSection(.F.)


Return oReport

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT020   บAutor  ณMicrosiga           บ Data ณ  11/24/14   บฑฑ
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

Local _cCodCli := ""
Local _cNome	:= ""
Local _nSaldo	:= 0
Local _nValor	:= 0
Local _nVlrFim	:= 0
Local _nJuros	:= 0
Local _nMulta	:= 0
Local _nAtraso	:= 0 
//Allan
local _CFilial  := 0
//SubTotais
Local _nSSaldo	:= 0
Local _nSValor	:= 0
Local _nSVlrFim	:= 0
Local _nSJuros	:= 0
Local _nSMulta	:= 0

//Totalizadores
Local _nTSaldo	:= 0
Local _nTValor	:= 0
Local _nTVlrFim	:= 0
Local _nTJuros	:= 0
Local _nTMulta	:= 0
Local _lSaltaPag := MV_PAR11==1

Private oSec1			:= oReport:Section(1) 
Private oSec2			:= oReport:Section(2)
//Private oSec3			:= oReport:Section(3)
Private cQuery			:= ""
Private nTotBrut		:= 0
Private nOrdem := oSec1:GetOrder()

oSec1:SetLeftMargin(2)
//oSec2:SetLeftMargin(5)
//oSec3:SetLeftMargin(25)


MontaTRB() // Query para montagem do relat๓rio


TRB->(dbGoTop())


While TRB->(!Eof())

	If (oReport:Row() >= oReport:PageHeight() - 100) .or. ((_cCodCli != TRB->CLI) .and. _lSaltaPag)
		oReport:EndPage()
		oReport:StartPage() 
	EndIf
	_cCodCli := TRB->CLI
	oSec1:Init()

	oSec1:Cell("A1_COD"):SetValue(TRB->CLI)
	oSec1:Cell("A1_LOJA"):SetValue(Alltrim(TRB->LOJA))
	oSec1:Cell("A1_NOME"):SetValue(Alltrim(TRB->NOME))
	//oSec1:Cell("FONE"):SetValue(Alltrim(TRB->FONE))
	oSec1:Cell("GRUPO"):SetValue(Alltrim(Posicione("ZL3",1,xFilial("ZL3")+TRB->GRUPO,"ZL3_DESCRI")))	
	oSec1:PrintLine()
//	oReport:SkipLine()
//	oReport:FatLine()

	While TRB->(!Eof()) .and. (_cCodCli == TRB->CLI)
		
		oReport:IncMeter() //Incrementa r้gua
		If oReport:Row() >= oReport:PageHeight() - 100
			oReport:EndPage()
			oReport:StartPage() 
		EndIf

		_nAtraso := DDATABASE - STOD(TRB->VENCTO)
       	_nValor := TRB->VLR
       	_nSaldo := TRB->SALDO
		If  _nAtraso > 0
			_nJuros		:=	0//U_CalcJur(DDATABASE - STOD(TRB->VENCTO), _nSaldo)
			_nMulta		:=  0//U_CalcMul(DDATABASE - STOD(TRB->VENCTO), _nSaldo)
		
		EndIf
		_nVlrFim	:= _nSaldo + _nJuros + _nMulta

        If TRB->TIPO $ 'NCC/RA'
	       	_nValor := _nValor * -1
	       	_nSaldo := _nSaldo * -1
			_nJuros		:= 0
			_nMulta		:= 0
			_nVlrFim	:= _nSaldo
		EndIf
		
		oSec2:Init()
		oSec2:Cell("E1_PREFIXO"):SetValue(TRB->PREF)
		oSec2:Cell("E1_NUM"):SetValue(TRB->NUM+"/"+TRB->PRC)
//		oSec2:Cell("E1_PARCELA"):SetValue(TRB->PRC)
		oSec2:Cell("E1_TIPO"):SetValue(TRB->TIPO)
		oSec2:Cell("E1_EMISSAO"):SetValue(DTOC(STOD(TRB->EMISSAO)))
		oSec2:Cell("E1_VENCTO"):SetValue(DTOC(STOD(TRB->VENCTO)))		
		oSec2:Cell("E1_VALOR"):SetValue(_nValor)
		oSec2:Cell("E1_SALDO"):SetValue(_nSaldo)
//		oSec2:Cell("ATRASO"):SetValue(_nAtraso)		

//		oSec2:Cell("E1_JUROS"):SetValue(_nJuros)
//		oSec2:Cell("E1_MULTA"):SetValue(_nMulta)
//		oSec2:Cell("VLRATU"):SetValue(Transform(_nVlrFim, "@E 999,999,999.99"))						
		oSec2:Cell("VLRATU"):SetValue(_nVlrFim)						
		oSec2:Cell("E1_NATUREZ"):SetValue(TRB->NATUREZA)
		oSec2:Cell("E1_HIST"):SetValue(TRB->HIST)
		oSec2:Cell("EVENTO"):SetValue(Posicione("ZL8",1,xFilial("ZL8")+TRB->EVENTO,"ZL8_NREDUZ"))		
		oSec2:PrintLine()		

        //Soma os sub-totais
       	_nSValor += _nValor
       	_nSSaldo += _nSaldo
		_nSJuros += _nJuros
		_nSMulta += _nMulta
		_nSVlrFim += _nVlrFim
      

		TRB->(DbSkip())
	EndDo
/*	
	oSec2:SkipLine()

	oSec2:Cell("E1_NUM"):SetValue("SUB-TOTAL -->")
	oSec2:Cell("E1_VALOR"):SetValue(_nSValor)
	oSec2:Cell("E1_SALDO"):SetValue(_nSSaldo)
	oSec2:Cell("E1_JUROS"):SetValue(_nSJuros)
	oSec2:Cell("E1_MULTA"):SetValue(_nSMulta)
	oSec2:Cell("VLRATU"):SetValue(Transform(_nSVlrFim, "@E 999,999,999.99"))						
*/
	oSec1:Finish() 
	oSec2:Finish() 
    //Soma totalizador geral
   	_nTValor += _nSValor
   	_nTSaldo += _nSSaldo
	_nTJuros += _nSJuros
	_nTMulta += _nSMulta
	_nTVlrFim += _nSVlrFim


	//Zera Sub-totais
   	_nSValor := 0
   	_nSSaldo := 0
	_nSJuros := 0
	_nSMulta := 0
	_nSVlrFim := 0

EndDo

TRB->(dbCloseArea()) 

oSec1:Finish() 
//oSec2:Finish() 
//oSec3:Finish() 
//oReport:FatLine()

oReport:EndPage()
//oReport:StartPage()

Return oReport


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณMontaTRB  บAutor  ณGuilherme Fran็a    บ Data ณ  25/11/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Consulta SQL para gera็ao do exrato conta-corrente.        บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function MontaTRB()

//mv_par01	Do Cliente
//mv_par02 	Ao Cliente
//mv_par03	Do Loja Cliente
//mv_par04	Ao Loja Cliente
//mv_par05	Da Emissao
//mv_par06	Ate Emissao
//mv_par07	Do Vencimento
//mv_par08	Ate Vencimento
//mv_par09	Do Evento
//mv_par10	Ate Evento

//Variaveis dos filtros da Query
Local _cCodCli := "% '"+MV_PAR01+"' AND '"+MV_PAR02+"' %"
Local _cLojCli := "% '"+MV_PAR03+"' AND '"+MV_PAR04+"' %"
Local _cFEmissao := "% '"+DTOS(MV_PAR05)+"' AND '"+DTOS(MV_PAR06)+"' %"
Local _cFVencto := "% '"+DTOS(MV_PAR07)+"' AND '"+DTOS(MV_PAR08)+"' %"
Local _cFEvento	:= "% '"+MV_PAR09+"' AND '"+MV_PAR10+"' %"
Local _cAssocia	:= "% '"+MV_PAR12+"' AND '"+MV_PAR13+"' %"
Local _cOrdem := ""

If nOrdem == 1
	_cOrdem := "% NOME, GRUPO, CLI, LOJA, VENCTO, EMISSAO % "
ElseIf nOrdem == 2
	_cOrdem := "% CLI, LOJA, NOME, GRUPO,  VENCTO, EMISSAO % "
Else
	_cOrdem := "% GRUPO, NOME, CLI, LOJA, VENCTO, EMISSAO % "
EndIf

If Select("TRB") > 0
	DbSelectArea("TRB")
	DbCloseArea("TRB")
EndIf

BeginSql alias "TRB"
	SELECT   A1.A1_COD	      CLI, 
	         A1.A1_LOJA       LOJA, 
	         A1.A1_NOME       NOME,
	         A2.A2_L_LI_RO	  GRUPO, 	         
/*	         (RTRIM(LTRIM(A1.A1_DDD))+'-'+RTRIM(LTRIM(A1.A1_TEL))) AS FONE, */
	         E1.E1_FILIAL     FIL, 
	         E1.E1_PREFIXO    PREF, 
	         E1.E1_NUM        NUM, 
	         E1.E1_PARCELA    PRC, 
	         E1.E1_TIPO       TIPO, 
	         E1.E1_EMISSAO    EMISSAO, 
	         E1.E1_HIST       HIST, 
	         E1.E1_VALOR+E1_ACRESC      VLR, 
	         E1.E1_SALDO+E1_ACRESC      SALDO, 
	         E1.E1_VENCTO     VENCTO, 
	         E1.E1_NATUREZ    NATUREZA,
	         E1.E1_L_EVENT    EVENTO	         
	FROM     %TABLE:SE1% E1 
		JOIN %TABLE:SA1% A1 ON A1.A1_FILIAL = %XFILIAL:SA1%  AND A1.A1_COD = E1.E1_CLIENTE AND A1.A1_LOJA = E1.E1_LOJA AND A1.%NOTDEL%
		JOIN %TABLE:SA2% A2 ON A2.A2_FILIAL = %XFILIAL:SA2%  AND A2.A2_COD = E1.E1_CLIENTE AND A2.A2_LOJA = E1.E1_LOJA AND A2.%NOTDEL%
								AND A2.A2_L_CODAS BETWEEN %Exp:_cAssocia%  
   //	WHERE E1.E1_FILIAL BETWEEN '' AND 'ZZZZ'
   	WHERE E1.E1_FILIAL = %xFilial:SE1%
	AND	E1.E1_CLIENTE BETWEEN %Exp:_cCodCli%
	AND E1.E1_EMISSAO BETWEEN %Exp:_cFEmissao%
	AND E1.E1_VENCTO BETWEEN %Exp:_cFVencto%
	AND E1.E1_L_EVENT BETWEEN %Exp:_cFEvento%	
	AND E1.E1_SALDO > 0
	AND E1.E1_L_EVENT <> ' '
	AND E1.%NOTDEL%
	ORDER BY %Exp:_cOrdem%

EndSql

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT020   บAutor  ณMicrosiga           บ Data ณ  11/24/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function AjustaSX1(cPerg)

Local aHelpPor := {}
Local aHelpEng := {}
Local aHelpSpa := {}


//Do Cliente
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial do cliente   ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"01","Do Cliente"," "," ","mv_ch1","C",6,0,0,"G","","SA1","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ao Cliente
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final do Cliente   ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"02","Ao Cliente"," "," ","mv_ch2","C",6,0,0,"G","","SA1","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Loja Cliente
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial da loja   ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"03","Da Loja"," "," ","mv_ch3","C",2,0,0,"G","","","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ao Loja Cliente
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final da loja   ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"04","At้ a Loja"," "," ","mv_ch4","C",2,0,0,"G","","","","","mv_par04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


//Da Emissao
aHelpPor := {}
Aadd( aHelpPor, 'Informe a data de emissao incial dos ')
Aadd( aHelpPor, 'titulos a ser considerada.           ')
U_xPutSx1(cPerg,"05","Da Emissao"		," "," ","mv_ch5","D",8,0,0,"G","","","","","mv_par05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate Emissao
aHelpPor := {}
Aadd( aHelpPor, 'Informe a data de emissao final dos ')
Aadd( aHelpPor, 'titulos a ser considerada.           ')
U_xPutSx1(cPerg,"06","Ate Emissao"		," "," ","mv_ch6","D",8,0,0,"G","","","","","mv_par06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Vencimento
aHelpPor := {}
Aadd( aHelpPor, 'Informe a data de vencimento incial ')
Aadd( aHelpPor, 'dos titulos a ser considerada.      ')
U_xPutSx1(cPerg,"07","Do vencimento"		," "," ","mv_ch7","D",8,0,0,"G","","","","","mv_par07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate Vencimento
aHelpPor := {}
Aadd( aHelpPor, 'Informe a data de vencimento final ')
Aadd( aHelpPor, 'dos titulos a ser considerada.      ')
U_xPutSx1(cPerg,"08","Ate Vencimento "," "," ","mv_ch8","D",8,0,0,"G","","","","","mv_par08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


//Do evento
aHelpPor := {}
Aadd( aHelpPor, 'Informe o evento inicial   ')
Aadd( aHelpPor, 'que deseja filtrar.          ')
U_xPutSx1(cPerg,"09","Do Evento"," "," ","mv_ch9","C",10,0,0,"G","","ZL8_01","","","mv_par09","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate evento
aHelpPor := {}
Aadd( aHelpPor, 'Informe o evento Final   ')
Aadd( aHelpPor, 'que deseja filtrar.          ')
U_xPutSx1(cPerg,"10","Ate Evento"," "," ","mv_chA","C",10,0,0,"G","","ZL8_02","","","mv_par10","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe SIM para imprimir um ')
Aadd( aHelpPor, 'produtor por pagina. 		   ')
U_xPutSx1(cPerg,"11","Salta pagina?","","","mv_chb","C",1,0,0,"C",'',"","","","MV_PAR11","Sim","","","","Nao","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


aHelpPor := {}
Aadd( aHelpPor, 'Informe a associa็ใo inicial   ')
Aadd( aHelpPor, 'que deseja filtrar.          ')
U_xPutSx1(cPerg,"12","Da Associa็ใo"," "," ","mv_chc","C",10,0,0,"G","","ZM3_01","","","mv_par12","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate evento
aHelpPor := {}
Aadd( aHelpPor, 'Informe a associa็ใo Final   ')
Aadd( aHelpPor, 'que deseja filtrar.          ')
U_xPutSx1(cPerg,"13","Ate Associa็ใo"," "," ","mv_chd","C",10,0,0,"G","","ZM3_01","","","mv_par13","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)



Return  
