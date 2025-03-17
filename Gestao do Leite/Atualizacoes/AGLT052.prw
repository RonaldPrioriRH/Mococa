#include "TOPCONN.CH"
#include "PROTHEUS.CH"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ AGLT052  บ Autor ณ Vinicius Fernandes    บ Data da Criacao  ณ 24/12/2013              						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Customiza็ใo quiosque / totem.                                                                            	บฑฑ
ฑฑบ          ณ                                                                                       					    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ COOPRATA                                                         						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                          			                                    	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ                                                                                            					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Faturamento/Financeiro                                                                  						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                                			       ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

USER FUNCTION AGLT052()

Local 	cSelEmpresa := cSelFilial:="01"
Local    bPrepAmb := {||  RpcSetType( 3 ), RpcSetEnv( cSelEmpresa, cSelFilial,,,"FAT") }
If Alltrim(FunName())==""
	LJMsgRun("Preparando o ambiente ...","Aguarde...",bPrepAmb)
	__cInterNet := NIL
Endif

Private	_lCancela	:= .T.
Private _lRet		:= .T.
Private oPrinc
Private oQuiosque
Private oTimer1
Private oTimer5
Private _cCCNPJ 	:= SPACE(14)
Private _cCMatr 	:= SPACE(6)
Private _cLoja
Private _cCSenha	:= SPACE(10)
Private _cNome		:= SPACE(40)
Private _cCDep     	:= SPACE(3)
Private _cNomDep	:= SPACE(40)
Private _nTent 		:= 0
Private _nTimer 	:= GETMv("MV_C_TIMER")




WHILE _lCancela
	
	_lRet	:= .F.
	
	//Fun็ใo tela inicial
	_lRet := U_AGLT52A()
	
	IF _lRet
		_lRet	:= .F.
		//Fun็ใo quiosque cooprata
		_lRet	:= U_AGLT52B()
		IF _lRet
			ALERT("FIM DA CONSULTA")
		END
		
	ENDIF
	
	_cCCNPJ 	:= SPACE(14)
	_cCMatr 	:= SPACE(6)
	_cCSenha	:= SPACE(10)
	_cNome		:= SPACE(40)
	_cCDep     	:= SPACE(3)
	_cNomDep	:= SPACE(40)
	
ENDDO

RETURN

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT52A   บAutor  ณVinicius Fernandes  บ Data ณ  27/12/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Tela Inicial do quiosque cooprata                          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function AGLT52A()

Local oButton1
Local oButton2
Local oCCNPJ
Local oCMatr
Local oCSenha
Local oGet1
Local oSay1
Local oSay2
Local oSay3
Local oSay4
Local _lRet52A	:= .F.
Local oFont52A 	:= TFont():New("Calibri",,022,,.F.,,,,,.F.,.F.)
Local oFont52A1	:= TFont():New("Calibri",,020,,.F.,,,,,.F.,.F.)
Local oFont52A2	:= TFont():New("Calibri",,014,,.F.,,,,,.F.,.F.)


DEFINE MSDIALOG oPrinc TITLE "Dados Cooperado" FROM 000, 000  TO 310, 600 COLORS 0, 16777215 PIXEL



@ 012, 010 SAY oSay2 PROMPT "Matricula:" 	SIZE 050, 012 OF oPrinc FONT oFont52A COLORS 0, 16777215 PIXEL
@ 010, 060 MSGET oCMatr VAR _cCMatr 		VALID AGLT52F() SIZE 50, 012 OF oPrinc FONT oFont52A1 COLORS 0, 16777215 PIXEL
@ 010, 110 SAY oSay5 PROMPT "*" 	SIZE 050, 012 OF oPrinc FONT oFont52A COLORS 255, 16777215 PIXEL
@ 010, 120 MSGET oGet1 VAR _cNome 			SIZE 140, 012 OF oPrinc FONT oFont52A1 COLORS 0, 16777215 PIXEL WHEN .F.

@ 047, 010 SAY oSay4 PROMPT "Senha:" 		SIZE 050, 012 OF oPrinc FONT oFont52A COLORS 0, 16777215 PIXEL                                                                             //117,010
@ 045, 060 MSGET oCSenha VAR _cCSenha 		SIZE 050, 012 OF oPrinc FONT oFont52A1 COLORS 0, 16777215 PASSWORD PIXEL					//115, 060
@ 045, 110 SAY oSay7 PROMPT "*" 	SIZE 050, 012 OF oPrinc FONT oFont52A COLORS 255, 16777215 PIXEL				//115,110


//@ 047, 010 SAY oSay3 PROMPT "Dependente:" 	SIZE 050, 012 OF oPrinc FONT oFont52A COLORS 0, 16777215 PIXEL
//@ 045, 060 MSGET oCDep VAR _cCDep	 		VALID AGLT52H() SIZE 50, 012 OF oPrinc FONT oFont52A1 COLORS 0, 16777215 PIXEL
//@ 045, 110 SAY oSay6 PROMPT "*" 	SIZE 050, 012 OF oPrinc FONT oFont52A COLORS 255, 16777215 PIXEL
//@ 045, 120 MSGET oCNomDep VAR _cNomDep		SIZE 140, 012 OF oPrinc FONT oFont52A1 COLORS 0, 16777215 PIXEL WHEN .F.
//    @ 045, 150 SAY oSay3 PROMPT "Nome:" 		SIZE 050, 015 OF oPrinc FONT oFont52A COLORS 0, 16777215 PIXEL

//    @ 082, 010 SAY oSay1 PROMPT "CPF/CNPJ:" 	SIZE 050, 012 OF oPrinc FONT oFont52A COLORS 0, 16777215 PIXEL
//    @ 080, 060 MSGET oCCNPJ VAR _cCCNPJ 		VALID AGLT52G() SIZE 120, 012 OF oPrinc FONT oFont52A1 COLORS 0, 16777215 PIXEL
@ 082, 010 SAY oSay3 PROMPT "Dependente:" 	SIZE 050, 012 OF oPrinc FONT oFont52A COLORS 0, 16777215 PIXEL
@ 080, 060 MSGET oCDep VAR _cCDep	 		VALID AGLT52H() SIZE 50, 012 OF oPrinc FONT oFont52A1 COLORS 0, 16777215 PIXEL
@ 080, 110 SAY oSay6 PROMPT "*" 	SIZE 050, 012 OF oPrinc FONT oFont52A COLORS 255, 16777215 PIXEL
@ 080, 120 MSGET oCNomDep VAR _cNomDep		SIZE 140, 012 OF oPrinc FONT oFont52A1 COLORS 0, 16777215 PIXEL WHEN .F.

//@ 082, 010 SAY oSay4 PROMPT "Senha:" 		SIZE 050, 012 OF oPrinc FONT oFont52A COLORS 0, 16777215 PIXEL                                                                             //117,010
//@ 080, 060 MSGET oCSenha VAR _cCSenha 		SIZE 050, 012 OF oPrinc FONT oFont52A1 COLORS 0, 16777215 PASSWORD PIXEL					//115, 060
//@ 080, 110 SAY oSay7 PROMPT "*" 	SIZE 050, 012 OF oPrinc FONT oFont52A COLORS 255, 16777215 PIXEL				//115,110

@ 115, 060 BUTTON oButton2 PROMPT "&1 - OK" 		SIZE 060, 015 OF oPrinc FONT oFont52A1 PIXEL ACTION (_lRet52A	:= U_AGLT52C())    	// 160, 060
@ 115, 180 BUTTON oButton1 PROMPT "&2 - Cancelar" 	SIZE 060, 015 OF oPrinc FONT oFont52A1 PIXEL ACTION (_lRet52A 	:= .F.,_lCancela	:= .F.,oPrinc:End())   // 160, 180

@ 145, 010 SAY oSay5 PROMPT "* Campos obrigat๓rios" 	SIZE 100, 012 OF oPrinc FONT oFont52A2 COLORS 255, 16777215 PIXEL  //190,010

ACTIVATE MSDIALOG oPrinc CENTERED

Return _lRet52A

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT52B   บAutor  ณVinicius Fernandes  บ Data ณ  27/12/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Tela Quiosque Cooprata.                                    บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/


User Function AGLT52B()

Local oBut52A1
Local oBut52A2
Local oBut52A3
Local oBut52A4
Local oBut52A5
Local oBut52A6
Local oBut52A7
Local oBut52A8
Local oBut52A9
Local oBut52A10
Local oBut52A11
Local oBut52A12
Local oFont52B
Local oSay52A1
Local oSay52A2

oFont52B 	:= TFont():New("Calibri",,024,,.F.,,,,,.F.,.F.)
oFont52B1 	:= TFont():New("Calibri",,018,,.F.,,,,,.F.,.F.)                                        //530

DEFINE MSDIALOG oQuiosque TITLE "Quiosque COOPRATA" FROM 000, 000  TO 630, 500 COLORS 0, 16777215 PIXEL


/*
@ 010, 015 SAY oSay52A1 	PROMPT "Bom dia Cooperado " + _cNome		 			SIZE 166, 010 OF oQuiosque FONT oFont52B COLORS 0, 16777215 PIXEL
@ 030, 015 SAY oSay52A2 	PROMPT "Bem Vindo ao Quiosque de Consulta da COOPRATA" 	SIZE 206, 010 OF oQuiosque FONT oFont52B COLORS 0, 16777215 PIXEL
@ 055, 015 BUTTON oBut52A1 	PROMPT "&1- Consulta de Dados Cadastrais" 				SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("1")	PIXEL
@ 085, 015 BUTTON oBut52A2 	PROMPT "&2 - Extrato do m๊s corrente " 					SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("2")	PIXEL
@ 115, 015 BUTTON oBut52A3 	PROMPT "&3 - Extrato do m๊s(es) anterior(es) " 			SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("3")	PIXEL
@ 145, 015 BUTTON oBut52A4 	PROMPT "&4 - Presta็๕es / Outros d้bitos" 				SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("4")	PIXEL
@ 175, 015 BUTTON oBut52A5 	PROMPT "&5 - Extrato da qualidade" 						SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("5")	PIXEL
@ 205, 015 BUTTON oBut52A5 	PROMPT "&5 - Extrato da qualidade m๊s anterior " 	SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("5")	PIXEL
@ 205, 015 BUTTON oBut52A8 	PROMPT "&6 - Limite de cr้dito" 						SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("6")	PIXEL
@ 235, 015 BUTTON oBut52A10	PROMPT "&7 - Altera็ใo Senha" 							SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("7")	PIXEL
@ 055, 170 BUTTON oBut52A12	PROMPT "&0 - SAIR" 										SIZE 050, 035 OF oQuiosque FONT oFont52B1 ACTION (oQuiosque:end()) PIXEL

*/


@ 010, 015 SAY oSay52A1 	PROMPT "Bom dia Cooperado " + _cNome		 			SIZE 166, 010 OF oQuiosque FONT oFont52B COLORS 0, 16777215 PIXEL
@ 030, 015 SAY oSay52A2 	PROMPT "Bem Vindo ao Quiosque de Consulta da COOPRATA" 	SIZE 206, 010 OF oQuiosque FONT oFont52B COLORS 0, 16777215 PIXEL
@ 055, 015 BUTTON oBut52A1 	PROMPT "&1 - Consulta de Dados Cadastrais" 				SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("1")	PIXEL
@ 085, 015 BUTTON oBut52A2 	PROMPT "&2 - Extrato do m๊s corrente " 					SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("2")	PIXEL
@ 115, 015 BUTTON oBut52A3 	PROMPT "&3 - Extrato do m๊s(es) anterior(es) " 			SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("3")	PIXEL
@ 145, 015 BUTTON oBut52A4 	PROMPT "&4 - Presta็๕es / Outros d้bitos" 				SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("4")	PIXEL
@ 175, 015 BUTTON oBut52A5 	PROMPT "&5 - Extrato da qualidade" 						SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("5")	PIXEL
//    @ 205, 015 BUTTON oBut52A5 	PROMPT "6 - Extrato da qualidade m๊s anterior " 	SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("51")	PIXEL
@ 205, 015 BUTTON oBut52A6 	PROMPT "&6 - Limite de cr้dito" 							SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("6")	PIXEL
@ 235, 015 BUTTON oBut52A8 	PROMPT "&7 -  Informativo da Qualidade" 					SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("8")	PIXEL
@ 265, 015 BUTTON oBut52A10	PROMPT "&0 - Altera็ใo Senha" 							SIZE 125, 020 OF oQuiosque FONT oFont52B1 ACTION U_AGLT52E("7")	PIXEL
@ 055, 170 BUTTON oBut52A12	PROMPT "&S - SAIR" 										SIZE 050, 035 OF oQuiosque FONT oFont52B1 ACTION (oQuiosque:end()) PIXEL

DEFINE TIMER oTimer1 INTERVAL _nTimer ACTION(oQuiosque:end()) OF oQuiosque
oTimer1:Deactivate()
oTimer1:activate()

ACTIVATE MSDIALOG oQuiosque CENTERED

RETURN .T.




/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT52C   บAutor  ณVinicius Fernandes  บ Data ณ  27/12/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Valida็ใo no botใo OK.                                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

USER FUNCTION AGLT52C()

Local _lRetorn 	:= .T.
Local _lAchou	:= .F.
Local _nParTen	:= GETMV("MV_C_TOTEN")

IF EMPTY(_cCMatr)
	_lRetorn	:= .F.
	xMagHelpFis("INFORMACAO",;
	"O campo Matricula do Cooperado ้ obrigat๓rio.",;
	"Informe a Matrํcula correta!")
	RETURN _lRetorn
ELSEIF !(ZZB->ZZB_ATIVO == "S")
	
	_lRetorn	:= .F.
	xMagHelpFis("INFORMACAO",;
	"Matrํcula Bloqueada.",;
	"Favor solicitar o desbloqueio da matrํcula")
	RETURN _lRetorn
	
ELSE
	DBSELECTAREA("SA1")
	DBSETORDER(1)
	IF DBSEEK(XFILIAL("SA1")+_cCMatr)
		//VERIFICA SE O CLIENTE ESTม BLOQUEADO
		WHILE SA1->A1_COD == _cCMatr
			IF SA1->A1_MSBLQL == "2"
				_lAchou	:= .T.
				_cLoja	:= SA1->A1_LOJA
				EXIT
			ENDIF
			SA1->(DBSKIP())
		ENDDO
		IF !(_lAchou)
			_lRetorn	:= .F.
			xMagHelpFis("INFORMACAO",;
			"Matrํcula Bloqueada.",;
			"Informe a Matrํcula correta!")
			DBCLOSEAREA("SA1")
			return _lRetorn
		ENDIF
		DBCLOSEAREA("SA1")
	ELSE
		_lRetorn	:= .F.
		xMagHelpFis("INFORMACAO",;
		"Matrํcula nใo existente.",;
		"Informe a Matrํcula correta!")
		DBCLOSEAREA("SA1")
		RETURN _lRetorn
	ENDIF
ENDIF

IF EMPTY(_cCDep)
	_lRetorn	:= .F.
	xMagHelpFis("INFORMACAO",;
	"O campo Dependente ้ obrigat๓rio.",;
	"Informe o Dependente correta!")
	RETURN _lRetorn
ENDIF

IF EMPTY(_cCSenha)
	_lRetorn	:= .F.
	xMagHelpFis("INFORMACAO",;
	"O campo Senha do Cooperado ้ obrigat๓rio.",;
	"Informe a Senha correta!")
	RETURN _lRetorn
ELSE
	IF !(AGLT52D())
		_nTent += 1
		
		If _nTent == _nParTen
			RECLOCK("ZZB", .F.)
			ZZB->ZZB_ATIVO := "N"
			MSUNLOCK()
			
			xMagHelpFis("INFORMACAO",;
			"Ap๓s "+Str(_nParTen)+" tentativas sua matrํcula foi bloqueada.",;
			"Favor solicitar o desbloqueio.")
		EndIf
		
		_lRetorn	:= .F.
		RETURN _lRetorn
	ENDIF
ENDIF

IF _lRetorn
	oPrinc:end()
ENDIF

RETURN _lRetorn

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT52D   บAutor  ณVinicius Fernandes  บ Data ณ  27/12/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Valida a senha digitada pelo cliente.                      บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function AGLT52D()

llPassW := .F.

DBSELECTAREA("ZZB")
DBSETORDER(1)
IF !DBSEEK(XFILIAL("ZZB")+ALLTRIM(_cCMatr))//+ALLTRIM(_cDepend))
	llPassW := .F.
	xMagHelpFis("INFORMACAO",;
	"Matricula nใo encontrada nใo cadastrado.",;
	"Informar uma Matricula valida!")
	RETURN llPassW
	
ELSE
	
	IF ALLTRIM(ZZB->ZZB_SENHA) == ALLTRIM(_cCSenha)
		llPassW := .T.
	ENDIF
	
ENDIF

IF !(llPassW)
	xMagHelpFis("INFORMACAO",;
	"Senha Invแlida.",;
	"Informe a Senha correta!")
ENDIF

Return llPassW

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT52E   บAutor  ณVinicius Fernandes  บ Data ณ  27/12/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Chama as fun็๕es dos botoes.                               บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

USER FUNCTION AGLT52E(_cAcao)
Local _cMesAno	:= ""
Local _aDados 	:= {}
oTimer1:Deactivate()
oTimer1:activate()

IF _cAcao == "1"
	
	DBSELECTAREA("SA2")
	DBSETORDER(1)
	
	IF DBSEEK(XFILIAL("SA2")+_cCMatr+_cLoja)
		
		//		AADD(_aDados,{ "A2_COD"	 , _cCMatr	, Nil })
		//		AADD(_aDados,{ "A2_LOJA" , _cLoja	, Nil })
		//		MSExecAuto({|x,y| MATA020(x,y)},_aDados,2)
		U_AFAT038()
		
	ENDIF
	
ELSEIF _cAcao == "2"
	_cMesAno	:= STRZERO((MONTH(DDATABASE)),2,0)+ALLTRIM(STR(YEAR(DDATABASE)))
	U_RGLT068(_cCMatr,_cMesAno,"S")
	
ELSEIF _cAcao == "3"
	IF MONTH(DDATABASE) - 1 == 0
		_cMesAno	:= "12"+ALLTRIM(STR(YEAR(DDATABASE)-1))
	ELSE
		_cMesAno	:= STRZERO((MONTH(DDATABASE)-1),2,0)+ALLTRIM(STR(YEAR(DDATABASE)))
	ENDIF
	U_RGLT068(_cCMatr,_cMesAno,"S")
	
ELSEIF _cAcao == "4"
	IF MONTH(DDATABASE) + 1 == 13
		_cMesAno	:= "01"+ALLTRIM(STR(YEAR(DDATABASE)+1))
	ELSE
		_cMesAno	:=  STRZERO((MONTH(DDATABASE)+1),2,0)+ALLTRIM(STR(YEAR(DDATABASE)))
	ENDIF
	U_RGLT070(_cCMatr,_cLoja,_cMesAno)
	
ELSEIF _cAcao == "5"
	_cMesAno := STRZERO((MONTH(DDATABASE)),2,0)+ALLTRIM(STR(YEAR(DDATABASE)))
	U_RGLT069(_cCMatr,_cLoja,_cMesAno)
	
ELSEIF _cAcao == "51"
	IF MONTH(DDATABASE) - 1 == 0
		_cMesAno	:= "12"+ALLTRIM(STR(YEAR(DDATABASE)-1))
	ELSE
		_cMesAno	:= STRZERO((MONTH(DDATABASE)-1),2,0)+ALLTRIM(STR(YEAR(DDATABASE)))
	ENDIF
	U_RGLT069A(_cCMatr,_cLoja,_cMesAno)
	
	
ELSEIF _cAcao == "6"
	U_CFAT015("Q",_cCMatr)
	
ELSEIF _cAcao == "7"
	DBSELECTAREA("ZZB")
	DBSETORDER(1)
	IF DBSEEK(XFILIAL("ZZB")+ALLTRIM(_cCMatr)+ALLTRIM(_cCDep))
		U_AGLT52I()
	ENDIF
	DBCLOSEAREA("ZZB")
	
ELSEIF _cAcao == "8"
	U_RGLT073(_cCMatr)
ENDIF

RETURN

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT52F   บAutor  ณVinicius Fernandes  บ Data ณ  27/12/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Valida a matricula do cooperado                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

STATIC FUNCTION AGLT52F()
Local _lRet52F	:= .T.

_cNome	:= ""

IF !EMPTY(_cCMatr)   
	
	If Len(Alltrim(_cCMatr)) < 6
		If SubStr(_cCMatr,1,1) $ '1234567890'
			_cCMatr := 'C'+StrZero(Val(_cCMatr),5) //Completa o c๓digo com a letra C e os digitos corretos
		EndIf
	EndIf
	
	
	_cNome		:= POSICIONE("ZZB",1,XFILIAL("ZZB")+ALLTRIM(_cCMatr)+ALLTRIM("001"),"ZZB_NOMDEP")
	_cCDep		:= "001"
	_cNomDep	:= _cNome
	
	IF !EMPTY(_cNome)
		_lRet52F	:= .T.
	ELSE
		_lRet52F	:= .F.
		xMagHelpFis("INFORMACAO",;
		"Dependente nใo encontrado.",;
		"Informe o c๓digo do dependente correto!")
	ENDIF
ELSE
	_cNome		:= ""
	_lRet52F	:= .T.
ENDIF

RETURN _lRet52F

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT52G   บAutor  ณVinicius Fernandes  บ Data ณ  27/12/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Valida o CNPJ digitado                                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

STATIC FUNCTION AGLT52G()
Local _lRet52G	:= .T.

IF !EMPTY(_cCCNPJ)
	_cCMatr	:= POSICIONE("SA1",3,XFILIAL("SA1")+_cCCNPJ,"A1_COD")
	IF !EMPTY(_cCMatr)
		_cNome	:= POSICIONE("ZZB",1,XFILIAL("ZZB")+ALLTRIM(_cCMatr)+ALLTRIM("001"),"ZZB_NOMDEP")
		IF !EMPTY(_cNome)
			_cCDep		:= "001"
			_cNomDep	:= _cNome
			_lRet52G	:= .T.
		ELSE
			_lRet52G	:= .F.
			xMagHelpFis("INFORMACAO",;
			"Dependente nใo encontrado.",;
			"Informe o c๓digo do dependente correto!")
		ENDIF
	ELSE
		_lRet52G	:= .F.
		xMagHelpFis("INFORMACAO",;
		"CPF nใo localizado.",;
		"Informe o CPF correto!")
	ENDIF
ELSE
	_lRet52G	:= .T.
ENDIF

RETURN _lRet52G

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT52H   บAutor  ณVinicius Fernandes  บ Data ณ  27/12/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Valida็ใo do dependente informado.                         บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

STATIC FUNCTION AGLT52H()
Local _lRet52H	:= .T.

IF !EMPTY(_cCDep)
	_cNomDep	:= POSICIONE("ZZB",1,XFILIAL("ZZB")+ALLTRIM(_cCMatr)+ALLTRIM(_cCDep),"ZZB_NOMDEP")
	IF !EMPTY(_cNomDep)
		_lRet52G	:= .T.
	ELSE
		_lRet52G	:= .F.
		xMagHelpFis("INFORMACAO",;
		"Dependente nใo encontrado.",;
		"Informe o c๓digo do dependente correto!")
	ENDIF
ELSE
	_cNomDep	:= ""
	_lRet52G	:= .T.
ENDIF

RETURN _lRet52G

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT52I   บAutor  ณVinicius Fernandes  บ Data ณ  27/12/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Altera็ใo da senha                                         บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

USER FUNCTION AGLT52I()

Local 	oFont2 		:= TFont():New("Calibri",,018,,.F.,,,,,.F.,.F.)
Local	llPassW		:= .F.
Private _cSenOld	:= SPACE(8)
Private _cSenNov1	:= SPACE(8)
Private _cSenNov2	:= SPACE(8)


Static oAltSen

DEFINE MSDIALOG oAltSen TITLE "Alterar senha do Cooperado" FROM 000,000 TO 310,500 PIXEL

@ 010,010 SAY "Cliente: "		SIZE 55, 10 OF oAltSen FONT oFont2 PIXEL
@ 010,055 SAY ALLTRIM(ZZB->ZZB_CODSA1) + " - " + ZZB->ZZB_NOMSA1 	SIZE 200, 10 OF oAltSen FONT oFont2 PIXEL

@ 030,010 SAY "Dependente: "	SIZE 55, 10 OF oAltSen FONT oFont2 PIXEL
@ 030,055 SAY ALLTRIM(ZZB->ZZB_NOMDEP) 	SIZE 200, 10 OF oAltSen FONT oFont2 PIXEL

@ 050,010 SAY   "Senha Antiga: " 	SIZE 55, 10 OF oAltSen FONT oFont2 PIXEL
@ 050,065 MSGET _oSenOld 	VAR _cSenOld VALID AGLT52J("1",_cSenOld) SIZE 50, 12 OF oAltSen PASSWORD PIXEL

@ 080,010 SAY   "Nova Senha: " 	SIZE 55, 10 OF oAltSen FONT oFont2 PIXEL
@ 080,065 MSGET _oSenNov1 	VAR _cSenNov1 VALID AGLT52J("2",_cSenNov1) SIZE 50, 12 OF oAltSen PASSWORD PIXEL

@ 100,010 SAY   "Repetir Senha: " 	SIZE 55, 10 OF oAltSen FONT oFont2 PIXEL
@ 100,065 MSGET _oSenNov2 	VAR _cSenNov2 VALID AGLT52J("2",_cSenNov2) SIZE 50, 12 OF oAltSen PASSWORD PIXEL

DEFINE SBUTTON FROM 135, 080 TYPE 1 ACTION (llPassW:=.T.,AGLT52J("3",_cSenNov1,_cSenNov2))ENABLE OF oAltSen FONT oFont2
DEFINE SBUTTON FROM 135, 150 TYPE 2 ACTION (llPassW:=.T.,oAltSen:END())ENABLE OF oAltSen FONT oFont2

DEFINE TIMER oTimer5 INTERVAL _nTimer ACTION(llPassW:=.T.,oAltSen:END(),oQuiosque:end()) OF oAltSen

oTimer1:Deactivate()
oTimer1:activate()

oTimer5:Deactivate()
oTimer5:activate()

ACTIVATE MSDIALOG oAltSen CENTERED

RETURN llPassW

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAFAT09D   บAutor  ณVinํcius Fernandes  บ Data ณ  20/06/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Verifica se as duas senha digitas sao semelhantes          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ COOPRATA                                                   บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

STATIC FUNCTION AGLT52J(_cTipo,_cValSen,_cValSen2)

Local _lValida	:= .T.

DEFAULT _cValSen	:= ""

oTimer1:Deactivate()
oTimer1:activate()

oTimer5:Deactivate()
oTimer5:activate()

IF _cTipo == "1"
	IF ALLTRIM(ZZB->ZZB_SENHA) == ALLTRIM(_cValSen) .OR. EMPTY(_cValSen)
		_lValida	:= .T.
	ELSE
		xMagHelpFis("INFORMACAO",;
		"Senha Invแlida.",;
		"Informe a Senha correta!")
		_lValida	:= .F.
		RETURN _lValida
	ENDIF
	
ELSEIF _cTipo == "2"
	FOR I := 1 TO LEN(ALLTRIM(_cValSen))
		IF !(SUBSTR(_cValSen,I,1) $('0123456789'))
			_lValida	:= .F.
			xMagHelpFis("INFORMACAO",;
			"Senha pode conter apenas numeros.",;
			"Informe a Senha correta!")
			RETURN _lValida
		ENDIF
	NEXT I
	
ELSEIF _cTipo == "3"
	IF _cValSen <> _cValSen2
		xMagHelpFis("INFORMACAO",;
		"As senhas estใo divergentes.",;
		"Informe a Senha correta!")
		_lValida	:= .F.
		RETURN _lValida
	ELSEIF !(ALLTRIM(ZZB->ZZB_SENHA) == ALLTRIM(_cSenOld))
		xMagHelpFis("INFORMACAO",;
		"A Senha Antiga ้ Invแlida.",;
		"Informe a Senha correta!")
		_lValida	:= .F.
		RETURN _lValida
	ELSE
		_lValida	:= .T.
		//Atualizar Senha
		RECLOCK("ZZB", .F.)
		ZZB->ZZB_SENHA := _cValSen
		MSUNLOCK()
		oAltSen:END()
	ENDIF
ENDIF

RETURN _lValida
