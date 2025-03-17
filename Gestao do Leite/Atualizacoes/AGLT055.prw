#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "SHELL.CH"
#INCLUDE "FWPrintSetup.ch"

#DEFINE _ENTER CHR(13)+CHR(10)
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ AGLT055  บ Autor ณ Guilherme Fran็a      บ Data da Criacao  ณ 30/12/2013  									บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescrio ณ Rotina de adiantamento para os cooperados.                                                                   บฑฑ
ฑฑบ          ณ                                                 																บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite  							                                                        		บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor    	บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	    	บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
*/

User Function AGLT055

Local oDlg
Local bProcess  := {|oSelf| U_AGLT055A(oSelf)}
Local oTProces

Private cPerg	:= "AGLT055"
Private _nDebAberto := 0

If Select("SX6") == 0
	lWeb := .T.
	RpcSetType(3)
	//Informar a empresa e filial correta para configurar o ambiente
	PREPARE ENVIRONMENT EMPRESA '01' FILIAL '010101'
EndIf

ValidPerg()
//MV_PAR01 Cliente

If Pergunte(cPerg,.T.)
	U_AGLT055A()
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Sintaxe da tNewProcess():New( cFunction, cTitle, bProcess, cDescription, cPerg, aInfoCustom) ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
// CRIA TELA DE PROCESSAMENTO PADRAO DO SISTEMA.
//oTProces := tNewProcess():New("AGLT055","Renegociacao de divida",bProcess,_cTexto,cPerg)

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ AFAT011A บ Autor ณ Totvs TM           บ Data ณ 22/01/2013  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Filtra os NDF do fornecedor selecionado                    บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบArquivos  ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function AGLT055A()

Local _dEmissao := FirstDay(Ddatabase) - 1
Private _cSerie := Alltrim(GetMv("LT_SERIE"))
Private __cCliente := MV_PAR01



IncProc("Localizando Notas do Leite...")

If Select("TNOTAS") > 0
	dbCloseArea("TNOTAS")
EndIF
If Select("TTRB") > 0
	DBCLOSEAREA("TTRB")
EndIF


_cFiltro	:= "% AND SE2.E2_FILIAL	= '"+XFILIAL("SE2")+"' "
_cFiltro 	+= " AND SE2.E2_FORNECE = '"+MV_PAR01+"' "
_cFiltro	+= " AND SE2.E2_TIPO = 'NF'"
_cFiltro	+= " AND SE2.E2_SALDO > 0 "
_cFiltro	+= " AND SE2.E2_PREFIXO = 'GL1' "
_cFiltro	+= " AND SE2.E2_EMISSAO = '"+DTOS(_dEmissao)+"' %"

//TNOTAS		:= GetNextAlias()

BeginSql alias "TNOTAS"
	SELECT
	SE2.E2_FILIAL, SE2.E2_PREFIXO, SE2.E2_NUM, SE2.E2_PARCELA, SE2.E2_EMISSAO, SE2.E2_VENCTO, SE2.E2_VENCREA, SE2.E2_TIPO, SE2.E2_VALOR, SE2.E2_SALDO,
	SE2.E2_LOJA, SE2.E2_FORNECE, SE2.R_E_C_N_O_ AS E2_NUM_REG, SA2.A2_NOME, SE2.E2_HIST, SE2.E2_SDACRES, SE2.E2_SDDECRE, SE2.E2_ACRESC, SE2.E2_DECRESC,
	SE2.E2_PORCJUR, SA2.A2_L_DEBIT
	FROM
	%table:SE2% SE2, %table:SA2% SA2
	WHERE
	SE2.%notDel%
	AND SA2.%notDel%
	AND SA2.A2_COD      = SE2.E2_FORNECE
	AND SA2.A2_LOJA      = SE2.E2_LOJA
	%exp:_cFiltro%
	ORDER BY
	SE2.E2_FILIAL, SE2.E2_NUM, SE2.E2_PREFIXO, SE2.E2_PARCELA
EndSql

dbselectarea("TNOTAS")
TNOTAS->(Dbgotop())

_nDebAberto := 0//Debitos(__cCliente,TNOTAS->E2_VENCTO)

U_AGLT055S()

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ validPergบ Autor ณ Totvs TM           บ Data ณ 27/03/2012  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบArquivos  ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
static function validPerg()

Local aHelpPor := {}

aHelpPor := {}
Aadd( aHelpPor, 'Informe a matrํcula do cooperado       ')
Aadd( aHelpPor, 'para que sejam apresentados os seus    ')
Aadd( aHelpPor, 'cr้ditos de notas do leite.            ')
Aadd( aHelpPor, '                                       ')

PutSx1("AGLT055","01","Cooperado"				,"Cooperado"				,"Cooperado"				,"mv_ch1","C",06,0,1,"G","","SA2","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,{},{})


RETURN

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ AGLT055S บ Autor ณ Totvs TM           บ Data ณ 22/01/2013  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Gera a tela de selecao dos Cupons.                         บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบArquivos  ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function AGLT055S()

Local _stru			:={}
Local aCpoBro 		:= {}
Local oDlgLocal
Local lRet			:= .T.
Local oGet1
Local xAreaSX3		:= GetArea("SX3")

Private oFont1 := TFont():New("MS Sans Serif",,016,,.T.,,,,,.F.,.F.)
Private oFont2 := TFont():New("MS Sans Serif",,016,,.T.,,,,,.F.,.F.)

Private oGCod
Private oGDiaP
Private oGMesesA

Private oGNome
Private oGTotD
Private oGTotP

Private oGValD
Private oGValJur
Private oSCod
Private oSDidP
Private oSMesesA
Private oSNome
Private oSTotalP
Private oSTotD
Private oSValD
Private oSValJ
Private oGItensS
Private oGItensSelect
Private oGTotalD
Private oGTotalP
Private oGValorD
Private oGValorJ
Private oSTotalD
Private oSTotalP
Private oSValorD
Private oSValorJ


Private cGCod := TNOTAS->E2_FORNECE
Private cGDiaP := dDataBase
Private cGMesesA := TNOTAS->A2_L_DEBIT
Private cGNome := TNOTAS->A2_NOME
Private cGTotD := 0
Private cGTotP := 0
Private cGValD := 0
Private cGValJur := 0
Private cGItensSelect := 0
Private cGTotalD := 0
Private cGTotalP := 0
Private cGValorD := 0
Private cGValorJ := 0
//Private _nTaxa := U_BUSCATAXA("BAIXA","NDF")


Private cArq
Private cGet1 		:= 0
Private nItensSel	:= 0
Private oSay1		:= ""
Private oSay2		:= ""
Private lInverte	:= .F.
Private cMark   	:= GetMark()
Private oMark
Private aCampos:={'E2_FILIAL', 'E2_PREFIXO', 'E2_NUM', 'E2_PARCELA', 'E2_EMISSAO', 'E2_VENCREA', 'E2_TIPO', 'E2_VALOR', 'E2_SALDO', 'E2_LOJA',;
'E2_FORNECE','E2_JUROS', 'E2_DESCONT','E2_HIST','E2_PORCJUR','E2_SDACRES','E2_SDDECRE'}
//Cria um arquivo de Apoio
AADD(_stru,{"OK"			,"C"	,2		,0		})
dbSelectArea("SX3")
dbSetOrder(2)
For nX:=1 to Len(aCampos)
	IF SX3->(dbSeek(aCampos[nX]))
		AADD(_stru,{aCampos[nX] ,SX3->X3_TIPO,SX3->X3_TAMANHO,SX3->X3_DECIMAL})
	EndIF
Next
RestArea(xAreaSX3)

AADD(_stru,{"E2_NUM_REG"	,"N"	,8		,0		})


cArq:=Criatrab(_stru,.T.)
DBUSEAREA(.t.,,carq,"TTRB")

Private _nTaxa := 0 //U_BUSCATAXA("EMP","ADI")
ALERT("CRIAR REGRA PARA TAXA DE JUROS!!!")

While TNOTAS->(!Eof())
	
	cGTotD		+= TNOTAS->E2_SALDO + TNOTAS->E2_SDACRES - TNOTAS->E2_SDDECRE
	//cGTotP		+= TNOTAS->E2_VALOR + TNOTAS->E2_ACRESC - TNOTAS->E2_DECRESC
	cGMesesA 	:= TNOTAS->A2_L_DEBIT
	
	If sTod(TNOTAS->E2_VENCREA) < dDataBase
		_nJuros		:=	U_CalcJuros("J",_nTaxa,TNOTAS->E2_VALOR,0,0,sTod(TNOTAS->E2_VENCREA),dDataBase) - TNOTAS->E2_VALOR
		_nDesc		:= 0
	Else
		_nJuros		:= 0
		_nDesc		:= TNOTAS->E2_VALOR - U_CalcJuros("D",_nTaxa,TNOTAS->E2_VALOR,0,0,sTod(TNOTAS->E2_VENCREA),dDataBase)
	EndIf
	cGValJur	+=_nJuros
	//    cGValD		+=_nDesc
	
	DbSelectArea("TTRB")
	RecLock("TTRB",.T.)
	TTRB->E2_FILIAL 		:=  TNOTAS->E2_FILIAL
	TTRB->E2_PREFIXO 		:= 	TNOTAS->E2_PREFIXO
	TTRB->E2_NUM 			:=	TNOTAS->E2_NUM
	TTRB->E2_PARCELA 		:= 	TNOTAS->E2_PARCELA
	TTRB->E2_EMISSAO 		:= 	sTod(TNOTAS->E2_EMISSAO)
	TTRB->E2_VENCREA 		:= 	sTod(TNOTAS->E2_VENCREA)
	TTRB->E2_VALOR 			:= 	TNOTAS->E2_VALOR + TNOTAS->E2_ACRESC - TNOTAS->E2_DECRESC
	TTRB->E2_SALDO 			:= 	TNOTAS->E2_SALDO + TNOTAS->E2_SDACRES - TNOTAS->E2_SDDECRE
	TTRB->E2_LOJA 			:= 	TNOTAS->E2_LOJA
	TTRB->E2_FORNECE 		:= 	TNOTAS->E2_FORNECE
	TTRB->E2_NUM_REG 		:= 	TNOTAS->E2_NUM_REG
	TTRB->E2_JUROS			:= _nJuros
	TTRB->E2_DESCONT		:= _nDesc
	TTRB->E2_TIPO			:= TNOTAS->E2_TIPO
	TTRB->E2_HIST			:= TNOTAS->E2_HIST
	TTRB->E2_PORCJUR		:= TNOTAS->E2_PORCJUR
	TTRB->E2_SDACRES		:= TNOTAS->E2_SDACRES
	TTRB->E2_SDDECRE		:= TNOTAS->E2_SDDECRE
	//TTRB->OK := ""
	
	TTRB->(MsunLock())
	TNOTAS->(DbSkip())
Enddo



//Atualiza Total a Pagar
//cGTotP := cGTotD + cGValJur - cGValD
cGTotP := cGValD

DbSelectArea("TTRB")
DBGOTOP("TTRB")

aCpoBro	:= {	{ "OK"			,, "Mark"			,"@!"					},;
{ "E2_PREFIXO"	,, "Prefixo"		,"@!"					},;
{ "E2_NUM"		,, "Titulo"			,"@!"					},;
{ "E2_EMISSAO"	,, "Data Emissใo"	,""						},;
{ "E2_VENCREA "	,, "Vencimento"		,"@!"					},;
{ "E2_VALOR"	,, "Valor"			,"@E 999,999,999.99"	},;
{ "E2_SALDO"	,, "Saldo Aberto"	,"@E 999,999,999.99"	},;
{ "E2_HIST"		,, "Historico"		,"@!"  					},;
{ "E2_LOJA"		,, "Loja Cooperado"	,"@!"					}}

//				{ "E2_JUROS"	,, "Juros"			,"@E 999,999,999.99"	},;
//				{ "E2_DESCONT"	,, "Desconto"		,"@E 999,999,999.99"	},;
//				{ "E2_SDACRES"	,, "Sld Acres."		,"@E 999,999,999.99"	},;
//				{ "E2_SDDECRE"	,, "Sld Descres."	,"@E 999,999,999.99"	},;


//Posiciona na SA1 para o funcionamento da funcao CFAT015 (consulta posi็ใo/limites)
DbSelectArea("SA1")
DbSetOrder(1)
DbSeek(xFilial("SA1")+__cCliente)

//Cria uma Dialog
DEFINE MSDIALOG oDlg TITLE "Notas em aberto" From 9,0 To 550,1050 PIXEL


//Cria a MsSelect -- Grid com os titulos
oMark := MsSelect():New("TTRB","OK","",aCpoBro,@lInverte,@cMark,{60,5,230,450},,,,,)
oMark:bMark := {| | Disp()}

cGTotD := cGTotD - _nDebAberto
//Marca todos os titulos
Marcac("M")

cGValD := cGTotD
U_AGLT55DT(cGDiaP,cGValD) // atualiza valor dos juros
//Cabecalho
@ 010, 005 SAY oSCod PROMPT "Codigo Coop:" SIZE 034, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 019, 005 MSGET oGCod VAR cGCod SIZE 042, 010 OF oDlg PICTURE "@!" COLORS 0, 16777215 READONLY  /*F3 "SA1"*/ PIXEL

@ 009, 060 SAY oSNome PROMPT "Nome:" SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 019, 060 MSGET oGNome VAR cGNome SIZE 124, 010 OF oDlg COLORS 0, 16777215 READONLY PIXEL

@ 009, 197 SAY oSTotD PROMPT "Valor a Receber:" SIZE 047, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 019, 197 MSGET oGTotD VAR cGTotD SIZE 060, 010 OF oDlg PICTURE "@E 999,999,999.99" COLORS 0, 16777215 READONLY PIXEL

@ 009, 268 SAY oSDidP PROMPT "Dia do Pagamento:" SIZE 055, 007 OF oDlg FONT oFont1 COLORS 255, 16777215 PIXEL
@ 019, 268 MSGET oGDiaP VAR cGDiaP SIZE 060, 010 OF oDlg VALID ValidDat(cGDiaP) COLORS 0, 16777215 ON CHANGE U_AGLT55DT(cGDiaP,cGValD)PIXEL

//@ 009, 339 SAY oSValJ PROMPT "Juros s/antecipa็ใo" SIZE 044, 007 OF oDlg COLORS 0, 16777215 PIXEL
//@ 019, 339 MSGET oGValJur VAR cGValJur SIZE 060, 010 OF oDlg PICTURE "@E 999,999,999.99" COLORS 0, 16777215 READONLY PIXEL

//@ 037, 005 SAY oSValD PROMPT "Valor Desconto:" SIZE 043, 007 OF oDlg COLORS 0, 16777215 PIXEL
//@ 046, 005 MSGET oGValD VAR cGValD SIZE 060, 010 OF oDlg PICTURE "@E 999,999,999.99" COLORS 0, 16777215 READONLY PIXEL

@ 037, 005 SAY oSValD PROMPT "Valor do adiantamento:" SIZE 070, 007 OF oDlg FONT oFont1 COLORS 255, 16777215 PIXEL
@ 046, 005 MSGET oGValD VAR cGValD SIZE 060, 010 OF oDlg PICTURE "@E 999,999,999.99" COLORS 0, 16777215 ON CHANGE U_AGLT55DT(cGDiaP,cGValD)PIXEL

@ 037, 077 SAY oSValJ PROMPT "Juros s/antecipa็ใo" SIZE 060, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 046, 077 MSGET oGValJur VAR cGValJur SIZE 060, 010 OF oDlg PICTURE "@E 999,999,999.99" COLORS 0, 16777215 READONLY PIXEL

//@ 037, 077 SAY oSTotalP PROMPT "Total a Pagar:" SIZE 049, 007 OF oDlg COLORS 0, 16777215 PIXEL
//@ 046, 077 MSGET oGTotP VAR cGTotP SIZE 060, 010 OF oDlg PICTURE "@E 999,999,999.99" COLORS 0, 16777215 READONLY PIXEL

//@ 037, 150 SAY oSMesesA PROMPT "Meses de Atraso:" SIZE 052, 007 OF oDlg COLORS 0, 16777215 PIXEL
//@ 046, 150 MSGET oGMesesA VAR cGMesesA SIZE 060, 010 OF oDlg COLORS 0, 16777215 READONLY PIXEL
/*
//Rodape
@ 239, 005 SAY oGItensS PROMPT "Itens Selecionados:" SIZE 060, 007 OF oDlg FONT oFont2 COLORS 16711680, 16777215 PIXEL
@ 249, 005 MSGET oGItensSelect VAR cGItensSelect SIZE 060, 010 OF oDlg COLORS 0, 16777215 READONLY PIXEL

@ 239, 078 SAY oSTotalD PROMPT "Total a Receber" SIZE 054, 007 OF oDlg FONT oFont2 COLORS 16711680, 16777215 PIXEL
@ 249, 078 MSGET oGTotalD VAR cGTotalD SIZE 060, 010 OF oDlg PICTURE "@E 999,999,999.99" COLORS 0, 16777215 READONLY PIXEL

@ 239, 152 SAY oSValorJ PROMPT "Juros s/antecipa็ใo" SIZE 052, 007 OF oDlg FONT oFont2 COLORS 16711680, 16777215 PIXEL
@ 249, 152 MSGET oGValorJ VAR cGValorJ SIZE 060, 010 OF oDlg PICTURE "@E 999,999,999.99" COLORS 0, 16777215 READONLY PIXEL

//@ 239, 225 SAY oSValorD PROMPT "Valor do Desconto" SIZE 053, 007 OF oDlg FONT oFont2 COLORS 16711680, 16777215 PIXEL
//@ 249, 225 MSGET oGValorD VAR cGValorD SIZE 060, 010 OF oDlg PICTURE "@E 999,999,999.99" COLORS 0, 16777215 READONLY PIXEL

@ 239, 297 SAY oSTotalP PROMPT "Total a Pagar" SIZE 054, 007 OF oDlg FONT oFont2 COLORS 16711680, 16777215 PIXEL
@ 249, 297 MSGET oGTotalP VAR cGTotalP SIZE 060, 010 OF oDlg PICTURE "@E 999,999,999.99" COLORS 0, 16777215 READONLY PIXEL
*/
//Botes
@ 060, 460 BUTTON "Posi็ใo Cooperado" SIZE 50,12 ACTION Processa( {|| U_CFAT015() }, "Processando..." ) PIXEL OF oDlg
@ 075, 460 BUTTON "Gera Autoriza็ใo" SIZE 50,12 ACTION U_AGLT55aut(cGTotalD,cGValJur,cGValD,{cGCod,cGNome},cGDiaP) PIXEL OF oDlg
//@ 090, 460 BUTTON "Cancelar" SIZE 50,12 ACTION  oDlg:End() PIXEL OF oDlg
@ 105, 460 BUTTON "Selecionar Todos" SIZE 50,12 ACTION Marcac("M") PIXEL OF oDlg
@ 120, 460 BUTTON "Desmarcar Todos" SIZE 50,12 ACTION Marcac("D") PIXEL OF oDlg
@ 150, 460 BUTTON "Confirmar Baixa" SIZE 50,12 ACTION Processa( {|| U_AGLT55BA("B",cGValD,cGValJur,cGDiaP) }, "Processando..." ) PIXEL OF oDlg
@ 165, 460 BUTTON "Reimpressao Recibo" SIZE 50,12 ACTION U_AGLT55RRC() PIXEL OF oDlg
@ 180, 460 BUTTON "Fechar" SIZE 50,12 ACTION  oDlg:End() PIXEL OF oDlg

ACTIVATE MSDIALOG oDlg CENTERED

TNOTAS->(dbCloseArea())
TTRB->(dbCloseArea())
Ferase(cArq+".dbf")
Ferase(cArq+OrdBagExt())

Return lRet


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ Disp     บ Autor ณ Totvs TM           บ Data ณ 22/01/2013  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Funcao executada ao Marcar/Desmarcar um registro.          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบArquivos  ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function Disp()

RecLock("TTRB",.F.)

If Marked("OK")
	cGTotalD	+= TTRB->E2_SALDO
	cGValorJ	+= TTRB->E2_JUROS
	cGValorD	+= TTRB->E2_DESCONT
	cGTotalP	:= cGTotalD+cGValorJ-cGValorD
	TTRB->OK 	:= cMark
	cGItensSelect++
Else
	cGTotalD	-= TTRB->E2_SALDO
	cGValorJ	-= TTRB->E2_JUROS
	cGValorD	-= TTRB->E2_DESCONT
	cGTotalP	:= cGTotalD+cGValorJ-cGValorD
	TTRB->OK 	:= ""
	cGItensSelect--
Endif

TTRB->(MSUNLOCK())

oMark:oBrowse:Refresh()
oDlg:Refresh()

Return()

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ Marcac   บ Autor ณ Totvs TM           บ Data ณ 22/01/2013  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Funcao executada ao Marcar/Desmarcar um registro.          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบArquivos  ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function Marcac(cMarc)

TTRB->(DBGOTOP())
cGTotalD		:= 0
cGItensSelect	:= 0
cGValorJ   		:= 0
cGValorD		:= 0
cGTotalP		:= 0
WHILE TTRB->(!EOF())
	RecLock("TTRB",.F.)
	
	If cMarc	== "M"
		TTRB->OK 	:= cMark
		cGTotalD		+= TTRB->E2_SALDO
		cGValorJ	+= TTRB->E2_JUROS
		cGValorD	+= TTRB->E2_DESCONT
		cGTotalP	:= cGTotalD+cGValorJ-cGValorD
		cGItensSelect++
	Else
		TTRB->OK := ""
	Endif
	
	TTRB->(MSUNLOCK())
	TTRB->(DBSKIP())
ENDDO

TTRB->(DBGOTOP())
oMark:oBrowse:Refresh()
oDlg:Refresh()

Return()

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ AGLT55BA บ Autor ณ Totvs TM           บ Data ณ 22/01/2013  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Funcao para baixar o titulo a pagar do coopeerado e gerar  บฑฑ
ฑฑบ          ณ registro de juros na ZLL e SE2.                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบArquivos  ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function AGLT55BA(_cOpc,_nValor,_nVlrJur,_dDtDiaP)

Local aArray:={}
Local aTit  :={}
Local lLiqui	:=.T.
Local lExec		:=.F.
Local aImp		:={}
Local aFornec	:={cGCod,cGNome}
Local _cEvent   := ALLTRIM(GETMV("LT_EVEJUR"))
Local _cPref
Local _nVlrBx := _nValor
Local _dVencto := ctod("")
Local _cZLLNum := ""

Private lMsErroAuto := .F.
Private _aBanco	:= {"","","",""}
Private _aCondRe := {"",0,"",""}
Private _nValorTot := 0
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ  Banco/Agencia ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If _cOpc == "B"
	_aBanco := BuscaCC()
	If  Empty(_aBanco[1]) .or. Empty(_aBanco[2]) .or. Empty(_aBanco[3])
		MsgAlert("Favor informar o Banco, Ag๊ncia e Conta.")
		_aBanco := BuscaCC()
	EndIf
EndIf
_nValorTot := 0
TTRB->(dbGoTop())
WHILE TTRB->(!EOF())
	IF TTRB->OK = cMark
		AADD(aTit ,{ TTRB->E2_PREFIXO,TTRB->E2_NUM, TTRB->E2_PARCELA , TTRB->E2_TIPO,TTRB->E2_SALDO,TTRB->E2_FORNECE,TTRB->E2_LOJA,TTRB->E2_VENCREA, .F.})
		_nValorTot += TTRB->E2_VALOR
		lExec:=.T.
	EndIF
	TTRB->(DBSKIP())
EndDO

Begin Transaction
For i := 1 to Len(aTit)
	If _nVlrBx > 0
		If _nVlrBx <= aTit[i][5]
			_lBaixou := BaixaSE2(_nVlrBx,0,0,aTit[i][1],aTit[i][2],aTit[i][3],aTit[i][4],aTit[i][6],aTit[i][7],_dDtDiaP,xFilial("SE2"))
			_nVlrBx -= _nVlrBx
		Else
			_lBaixou := BaixaSE2(aTit[i][5],0,0,aTit[i][1],aTit[i][2],aTit[i][3],aTit[i][4],aTit[i][6],aTit[i][7],_dDtDiaP)
			_nVlrBx -= aTit[i][5]
		EndIf
	EndIf

	If !_lBaixou
		Alert("Ocorreram erros na baixa do(s) titulo(s). Comunique ao suporte!")
		DisarmTransaction()
		Return
	EndIf
Next i
End Transaction

//Inclusใo do d้bito de juros para o pr๓ximo mes. (gera um registro na ZLL e o NDF no contas a pagar)
If _lBaixou

	DbSelectArea("ZL8")
	ZL8->(DbSetOrder(1))
	If ZL8->(dbSeek(xFilial("ZL8")+Alltrim(_cEvent)))
		Begin Transaction
		_cZLLNum	:= QueryCod("ZLL")

		_dVencto:=aTit[1][8]
		If	month(_dVencto)==12
			_dVencto := "20/01/"+Str(Year(_dVencto)+1)
		Else
			_dVencto := "20/"+StrZero(month(_dVencto)+1,2)+"/"+Str(Year(_dVencto))
		EndIf
		_dVencto := CtoD(_dVencto)
	
	
		_lIncSE2ok := IncSE2(ZL8->ZL8_PREFIX,_cZLLNum+"001","01","NDF",aTit[1][6],aTit[1][7],ZL8->ZL8_NATPRD,_dDtDiaP,_dVencto,_nVlrJur,0,0,"",Substr(ZL8->ZL8_DESCRI,1,25),0.0834,ZL8->ZL8_COD)
		
		If _lIncSE2ok

			IncZLL(_cZLLNum,"001",aTit[1][6],aTit[1][7],"",_nVlrJur,"A",_dDtDiaP,_dVencto,"F01917","01","000001",ZL8->ZL8_NATPRD,ZL8->ZL8_COD,0,0,xFilial("ZLL"),Substr(ZL8->ZL8_DESCRI,1,25),1,_nVlrJur,_nVlrJur,0)

		Else
			xMagHelpFis("Erro gera็ใo de juros","Ocorreram erros na inclusใo do d้bito de juros ao cooperado",;
			"Inclua manualmente o d้bito pela rotina de Conv๊nios e Comunique ao suporte!"+_ENTER;
							+"Valor dos juros: "+Transform(_nVlrJur,"@E 999,999,999.9999"))
			DisarmTransaction()
		EndIf
		End Transaction
	EndIf
EndIf

//Impressใo do recibo de pagamento
If _lBaixou
	MsgInfo("Baixa realizada com sucesso!"+_ENTER; 
	+"Confirme a tela para a impressใo do recibo.")
	U_AGLT55rc(_nValorTot,_nValor,_nVlrJur,aFornec,_dDtDiaP)
    //Finalizando tela
	oDlg:End()
//	TNOTAS->(dbCloseArea())
//	TTRB->(dbCloseArea())
	Ferase(cArq+".dbf")
	Ferase(cArq+OrdBagExt())
	
Endif



oMark:oBrowse:Refresh()
oDlg:Refresh()

Return


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ AGLT55DT บ Autor ณ Totvs TM           บ Data ณ 22/01/2013  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Fun็ใo para atualizacao do grid com valores de desconto e  บฑฑ
ฑฑบ          ณ juros quando se altera a data de calculo                   บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบArquivos  ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function AGLT55DT(dData,nVlrp)


TTRB->(DBGOTOP())
cGTotalD		:= 0
cGItensSelect	:= 0
cGValorJ   		:= 0
cGValorD		:= 0
cGTotalP		:= 0
cGValJur		:= 0
//	cGValD			:= 0

WHILE TTRB->(!EOF())
	//		RecLock("TTRB",.F.)
	
	If TTRB->E2_VENCREA > dData
		
		_nJuros				:=	nVlrp -U_CalcJuros("D",_nTaxa,nVlrp,0,0,TTRB->E2_VENCREA,dData)
		_nDesc				:= 0
	Else
		_nDesc				:=	TTRB->E2_VALOR - U_CalcJuros("D",_nTaxa,TTRB->E2_VALOR,0,0,TTRB->E2_VENCREA,dData)
		_nJuros				:= 0
	EndIf
	cGValJur			+=_nJuros
	//		    cGValD				+=_nDesc
	//			TTRB->E2_JUROS		:=_nJuros
	//			TTRB->E2_DESCONT	:=_nDesc
	IF TTRB->OK = cMark
		cGTotalD			+= TTRB->E2_SALDO
		cGValorJ			+= TTRB->E2_JUROS
		cGValorD			+= TTRB->E2_DESCONT
		//cGTotalP			:= cGTotalD+cGValorJ-cGValorD
		cGItensSelect++
	EndIF
	
	//		TTRB->(MSUNLOCK())
	TTRB->(DBSKIP())
ENDDO

//Atualiza Total a Pagar
cGTotP = cGTotD + cGValJur - cGValD
cGTotalP = cGTotalD+cGValorJ-cGValorD

TTRB->(DBGOTOP())
oMark:oBrowse:Refresh()
oDlg:Refresh()

Return
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ BDESCONT บ Autor ณ Totvs TM           บ Data ณ 22/01/2013  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Fun็ใo para refresh na tela		                          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบArquivos  ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function AGLT55RF
oDlg:Refresh()
Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ValidDat บ Autor ณ Totvs TM           บ Data ณ 22/01/2013  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Nao permite inserir data inferior a data base para calculo บฑฑ
ฑฑบ          ณ das parcelas                                               บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบArquivos  ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function ValidDat(dDate)
lRet:=.T.

If dDate < dDataBase
	lRet:=.F.
	MsgAlert("Nao ้ possivel selecionar uma data inferior a data base")
EndIF

Return lRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ BuscFun  บ Autor ณ Totvs TM           บ Data ณ 22/01/2013  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Busca proximo codigo de fatura a ser gerada                บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบArquivos  ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function BuscNum(pref)

Local cCod:=""

//cQuery:="SELECT MAX(E2_NUM) AS COD FROM "+RetSqlName("SE2")+" WHERE E2_PREFIXO = 'GLD' AND LEN(E2_NUM) = 9"
cQuery:="SELECT MAX(E2_NUM) AS COD FROM "+RetSqlName("SE2")+" WHERE E2_PREFIXO = '"+pref+"' AND LEN(E2_NUM) = 9"
TcQuery ChangeQuery(cQuery) New Alias "NAT"


If Alltrim(NAT->COD) = ""
	cCod:='000000001'
	
Else
	cCod:=Strzero(Val(NAT->COD)+1,9)
EndIF

NAT->(dbCloseArea())


Return cCod

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณ BaixaSE2 ณ Autor ณTotvs TM               ณ Data ณ 00.00.00 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ Baixa titulo no contas a pagar via SigaAuto.               ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณParametrosณ                                                            ณฑฑ
ฑฑณ          ณ ExpN01 - Valor a ser baixado no titulo.                    ณฑฑ
ฑฑณ          ณ ExpC02 - Prefixo do titulo a ser baixado.                  ณฑฑ
ฑฑณ          ณ ExpC03 - Numero do titulo a ser baixado.                   ณฑฑ
ฑฑณ          ณ ExpC04 - Parcela do titulo a ser baixado.                  ณฑฑ
ฑฑณ          ณ ExpC05 - Tipo do titulo a ser baixado.                     ณฑฑ
ฑฑณ          ณ ExpL06 - Fornecedor                                        ณฑฑ
ฑฑณ          ณ ExpC07 - Loja                        					  ณฑฑ
ฑฑณ          ณ ExpC07 - Data da baixa                                     ณฑฑ
ฑฑณ          ณ                                                            ณฑฑ
ฑฑณ          ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ GENERICO                                                   ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function BaixaSE2(nVlrBx,nVlrDesc,nVlrMult,_cPrefixo,cNroTit,cParcela,cTipo,cFornece,cLoja,_xdData)

Local _nModAnt      := nModulo
Local _cModAnt      := cModulo
//Local cPrefCv    := POSICIONE("ZL8",1,xFilial("ZL8")+AllTrim(GetMv("LT_CONVEXT")),"ZL8_PREFIX") //Evento de convenio
Local _cMotBaixa := "NOR"
//Local aAreaSA2   := SA2->(GetArea())
Local _aArea       := {}
Local _aAlias      := {}
Local _aTitulo      := {}
Local _cHist	:= "ANTECIPAวรO NOTA DO LEITE"
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณEfetua o backup da filial corrente.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู


Local _cBkpFilEv   := ""
Local _nMaxSeq     := 0
Local _lDeuErro := .f.

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ  Salva a area. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SE2"})


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Posiciona no SA2 novamente, pois agora pode ser de outra loja.     ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
dbSelectArea("SA2")
SA2->(dbSetOrder(1))
If SA2->(dbSeek(xFilial("SA2") + cFornece + cLoja))
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Tratamento para liberar o titulo para baixa no financeiro. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	dbSelectArea("SE2")
	SE2->(dbSetOrder(1))
	If SE2->(dbSeek(xFilial("SE2") + _cPrefixo + cNroTit + cParcela + cTipo + SA2->A2_COD + SA2->A2_LOJA))
		/*		//cOrigem := SE2->E2_ORIGEM
		If Empty(SE2->E2_DATALIB)//Se nao foi liberado ainda
		RecLock("SE2",.F.)
		SE2->E2_DATALIB := dDataBase
		SE2->E2_USUALIB := AllTrim(cUserName)
		MsUnLock()
		EndIf
		*/
		AADD( _aTitulo, {"E2_PREFIXO"  	,_cPrefixo	  	, Nil } )
		AADD( _aTitulo, {"E2_NUM"	   	,cNroTit	    , Nil } )
		AADD( _aTitulo, {"E2_PARCELA"  	,cParcela      	, Nil } )
		AADD( _aTitulo, {"E2_TIPO"	   	,cTipo         	, Nil } )
		AADD( _aTitulo, {"E2_FORNECE"  	,SA2->A2_COD   	, Nil } )
		AADD( _aTitulo, {"E2_LOJA"	   	,SA2->A2_LOJA  	, Nil } )
		AADD( _aTitulo, { "AUTMOTBX"  	, _cMotBaixa		, Nil } )	// 08
		/*AADD( _aTitulo, { "AUTBANCO"  	, ""			, Nil } )	// 09
		AADD( _aTitulo, { "AUTAGENCIA"  	, ""			, Nil } )	// 10
		AADD( _aTitulo, { "AUTCONTA"  	, ""			, Nil } )	// 11
		AADD( _aTitulo, { "AUTCHEQUE"    ,""             ,Nil  } )	// 11*/
		AADD( _aTitulo, { "AUTBANCO"  	, _aBanco[1]			, Nil } )	// 09
		AADD( _aTitulo, { "AUTAGENCIA"  , _aBanco[2]			, Nil } )	// 10
		AADD( _aTitulo, { "AUTCONTA"  	, _aBanco[3]			, Nil } )	// 11
		AADD( _aTitulo, { "AUTCHEQUE"   ,""             ,Nil  } )	// 11*/
		AADD( _aTitulo, { "AUTDTBAIXA"	, _xdData		, Nil } )	// 12
		AADD( _aTitulo, { "AUTDTCREDITO" ,_xdData 	    , Nil } )	// 12
		AADD( _aTitulo, { "AUTBENEF"     ,SA2->A2_COD+" - "+AllTrim(SA2->A2_NOME),Nil} )	// 12
		AADD( _aTitulo, { "AUTHIST"   	, _cHist			, Nil } )	// 13
		AADD( _aTitulo, { "AUTDESCONT" 	, nVlrDesc			, Nil } )	// 14
		AADD( _aTitulo, { "AUTMULTA"	 , nVlrMult		, Nil } )	// 15
		AADD( _aTitulo, { "AUTOUTGAS" 	, 0				, Nil } )	// 17
		AADD( _aTitulo, { "AUTVLRPG"  	, nVlrBx		, Nil } )	// 18
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Altera o modulo para Financeiro, senao o SigaAuto nao executa.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		nModulo := 6
		cModulo := "FIN"
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ SigaAuto de Baixa de Contas a Pagar. ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		Pergunte("FIN080",.F.) //Chama perguntas da rotina FINA080 para evitar erros na execu็ใo do sigaauto.
		
		MSExecAuto({|x,y| Fina080(x,y)},_aTitulo,3,.T.)
		
		
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Restaura o modulo em uso. ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		nModulo := _nModAnt
		cModulo := _cModAnt
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Verifica se houve erro no SigaAuto, caso haja mostra o erro. ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		If lMsErroAuto
			_lDeuErro := .T.
			xMagHelpFis("NAO CONFORMIDADE 17 - SIGAAUTO BAIXA TITULO",;
			"Existe uma nใo conformidade no SigaAuto de Baixa de Contas a Pagar!",;
			xFilial("SE2")+_cPrefixo+cNroTit+;
			cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA+;
			"     <-  Copie essas informa็๕es para voce pesquisar no Contas a Pagar o titulo que esta com nใo conformidade. "+;
			"Ap๓s confirmar esta tela, sera apresentada a tela de Nใo Conformidade do SigaAuto.")
			MostraErro()
		EndIf
	Else
		
		_lDeuErro := .T.
		
		xMagHelpFis("NAO CONFORMIDADE 17 - TITULO NAO ENCONTRADO",;
		"Existe uma nใo conformidade no SigaAuto de Baixa de Contas a Pagar!",;
		xFilial("SE2")+_cPrefixo+cNroTit+;
		cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA+;
		"     <-  Copie essas informa็๕es para voce verificar no Contas a Pagar. O titulo nใo foi encontrado.")
	EndIf
Else
	
	_lDeuErro := .T.
	
	xMagHelpFis("NAO CONFORMIDADE 017 - FORNECEDOR NAO ENCONTRADO",;
	"O produtor + Loja "+cFornece+cLoja+" nao foram encontrados no cadastro de Fornecedores",;
	"Comunique o suporte sobre esta situa็ใo.")
	
EndIf


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Restaura a area. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
CtrlArea(2,_aArea,_aAlias)

Return !_lDeuErro


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  CtrlArea   บAutor  ณMicrosiga           บ Data ณ  11/21/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณSalva area                                                  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function CtrlArea(_nTipo,_aArea,_aAlias,_aArqs)

Local _nN := 0

// Tipo 1 = GetArea()
If _nTipo == 1
	_aArea := GetArea()
	For _nN := 1 To Len(_aArqs)
		dbSelectArea(_aArqs[_nN])
		AAdd(_aAlias,{ _aArqs[_nN], IndexOrd(), Recno() })
	Next
	// Tipo 2 = RestArea()
Else
	For _nN := 1 To Len(_aAlias)
		dbSelectArea(_aAlias[_nN,1])
		dbSetOrder(_aAlias[_nN,2])
		DbGoto(_aAlias[_nN,3])
	Next
	RestArea(_aArea)
EndIf

Return


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT55aut บ Autor ณ Totvs TM           บ Data ณ  30/12/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณAutoriza็ใo para pagamento antecipado.                      บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function AGLT55aut(nValTotal, nValJuros, nValAdi, aFornece,dData)

Private oPrinter
Private oFont8		:= TFont():New("MS Sans Serif",,008,,.F.,,,,,.F.,.F.)
Private oFont10		:= TFont():New("MS Sans Serif",,012,,.F.,,,,,.F.,.F.)
Private oFont10N	:= TFont():New("MS Sans Serif",,012,,.T.,,,,,.F.,.F.)
Private oFont12N 	:= TFont():New("MS Sans Serif",,016,,.T.,,,,,.F.,.F.)
Private oFont12NS	:= TFont():New("MS Sans Serif",,016,,.T.,,,,,.T.,.F.)


DbSelectArea("SA2")
DbSetOrder(1)
DbSeek(xFilial("SA2")+aFornece[1])

If Select("SX6") == 0
	
	RpcSetType(3)
	//Informar a empresa e filial correta para configurar o ambiente
	PREPARE ENVIRONMENT EMPRESA '01' FILIAL '010101'
EndIf

If oPrinter == Nil
	lPreview := .T.
	oPrinter      := FWMSPrinter():New('Autorizacao'+ DtoS(Date())+ "_"+StrTran(Time(),':','-'),,.F.,,.F.)
	oPrinter:SetPortrait()
	//oPrinter:Setup()
	oPrinter:SetPaperSize(9)
	oPrinter:SetMargin(60,60,60,60)
	//oPrinter:cPathPDF :="C:\TEMP\"
EndIf

//X e a distancia entre os mesmos componentes nas duas vias
x:=380

oPrinter:StartPage()
oPrinter:Box(040,010,410,550)
oPrinter:Box(040+x,010,410+x,550)


//cText1 := "COOPERATIVA DOS PRODUTORES RURAIS DO PRATA"
cText1 := "AUTORIZAวรO DE PAGAMENTO"
oPrinter:SayBitmap(050,020,"\system\LGMID.png",060,033)
oPrinter:Say(070,120,cText1,oFont12NS)

//oPrinter:SayBitmap(050+x,020,"\system\LGMID.png",060,033)
//oPrinter:Say(070+x,120,cText1,oFont12NS)


oPrinter:Say(100,120,"VALOR A ANTECIPAR:",oFont12N)
//oPrinter:Say(100+x,120,"VALOR A ANTECIPAR:",oFont12N)


oPrinter:Say(090,423,picVal(Alltrim(Str(nValAdi))),oFont12N)
//oPrinter:Say(090+x,423,picVal(Alltrim(Str(nValAdi))),oFont12N)

oPrinter:Say(120,70,'Autorizo o departamento financeiro a fazer o dep๓sito para o',oFont10)
oPrinter:Say(135,70,'associado: '+aFornece[2],oFont10)
oPrinter:Say(150,70,'Matrํcula nบ: '+aFornece[1]+" a quantia de:",oFont10)
/*
oPrinter:Say(120+x,70,'Autorizo o departamento financeiro a fazer o dep๓sito para o',oFont10)
oPrinter:Say(135+x,70,'associado: '+aFornece[2],oFont10)
oPrinter:Say(150+x,70,'Matrํcula nบ: '+aFornece[1]+" a quantia de:",oFont10)
*/
oPrinter:Say(165,70,Alltrim(Extenso(nValAdi)),oFont10)
//oPrinter:Say(165+x,70,Alltrim(Extenso(nValAdi)),oFont10)

cData:=dTos(dData)
dDataAnt:=sTod(SubStr(cData,1,4)+StrZero(Val(SubStr(cData,5,2))-1,2)+SubStr(cData,7,2))

oPrinter:Say(180,70,"sem a assinatura do mesmo, conforme solicita็ใo feita pelo mesmo",oFont10)
//oPrinter:Say(180+x,70,"sem a assinatura do mesmo, conforme solicita็ใo feita pelo mesmo",oFont10)

oPrinter:Say(195,70,"Banco:"+SA2->A2_BANCO+" Ag๊ncia: "+Alltrim(SA2->A2_AGENCIA)+"-"+Alltrim(SA2->A2_C_DGAGE)+" Conta: "+Alltrim(SA2->A2_NUMCON)+"-"+Alltrim(SA2->A2_C_DGCON),oFont10)
//oPrinter:Say(195+X,70,"Banco:"+SA2->A2_BANCO+" Ag๊ncia: "+Alltrim(SA2->A2_AGENCIA)+"-"+Alltrim(SA2->A2_C_DGAGE)+" Conta: "+Alltrim(SA2->A2_NUMCON)+"-"+Alltrim(SA2->A2_C_DGCON),oFont10)

/*
oPrinter:Say(210,170    ,"Cr้dito total do m๊s: "+"         "+picVal(Alltrim(Str(nValTotal))),oFont10)
oPrinter:Say(210+x,170  ,"Cr้dito total do m๊s: "+"         "+picVal(Alltrim(Str(nValTotal))),oFont10)

oPrinter:Say(225,170    ,"   Valor a antecipar: "+"         "+picVal(Alltrim(Str(nValAdi))),oFont10)
oPrinter:Say(225+x,170  ,"   Valor a antecipar: "+"         "+picVal(Alltrim(Str(nValAdi))),oFont10)


oPrinter:Say(240,170    ,"       Saldo a pagar: "+"         "+picVal(Alltrim(Str(nValTotal -nValAdi))),oFont10)
oPrinter:Say(240+X,170  ,"       Saldo a pagar: "+"         "+picVal(Alltrim(Str(nValTotal -nValAdi))),oFont10)

oPrinter:Say(270,70    ,"Custos Administrativos Gerados na antecipa็ใo "+picVal(Alltrim(Str(nValJuros))),oFont10)
oPrinter:Say(270+x,70    ,"Custos Administrativos Gerados na antecipa็ใo"+picVal(Alltrim(Str(nValJuros))),oFont10)
*/
oPrinter:Say(300,70    ,"Por ser verdade assino o presente.",oFont10N)
//oPrinter:Say(300+x,70    ,"Por ser verdade assino o presente.",oFont10N)

oPrinter:Say(315,70    ,"Prata(MG),"+ExData(dData),oFont10N)
//oPrinter:Say(315+x,70    ,"Prata(MG),"+ExData(dData),oFont10N)



oPrinter:Say(345,70    ,"______________________________________________________",oFont10N)
//oPrinter:Say(345+x,70  ,"______________________________________________________",oFont10N)


oPrinter:Say(360,70    ,"   Cooperativa dos Produtores Rurais do Prata Ltda",oFont10N)
//oPrinter:Say(360+x,70  ,"   Cooperativa dos Produtores Rurais do Prata Ltda",oFont10N)


oPrinter:EndPage()

If lPreview
	oPrinter:Preview()
EndIf

FreeObj(oPrinter)
oPrinter := Nil

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT55rc  บ Autor ณ Totvs TM           บ Data ณ  30/12/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณRecibo de pagamento antecipado.                             บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/   

User Function AGLT55rc(_nValTotal,nValAdi, nValJuros, aFornece,dData)

Private oPrinter
Private oFont8		:= TFont():New("MS Sans Serif",,008,,.F.,,,,,.F.,.F.)
Private oFont10		:= TFont():New("MS Sans Serif",,012,,.F.,,,,,.F.,.F.)
Private oFont10N	:= TFont():New("MS Sans Serif",,012,,.T.,,,,,.F.,.F.)
Private oFont12N 	:= TFont():New("MS Sans Serif",,016,,.T.,,,,,.F.,.F.)
Private oFont12NS	:= TFont():New("MS Sans Serif",,016,,.T.,,,,,.T.,.F.)

If Select("SX6") == 0
	
	RpcSetType(3)
	//Informar a empresa e filial correta para configurar o ambiente
	PREPARE ENVIRONMENT EMPRESA '01' FILIAL '010101'
EndIf

If oPrinter == Nil
	lPreview := .T.
	oPrinter      := FWMSPrinter():New('Recibo'+ DtoS(Date())+ "_"+StrTran(Time(),':','-'),,.F.,,.F.)
	oPrinter:SetPortrait()
	//oPrinter:Setup()
	oPrinter:SetPaperSize(9)
	oPrinter:SetMargin(60,60,60,60)
	//oPrinter:cPathPDF :="C:\TEMP\"
EndIf

//X e a distancia entre os mesmos componentes nas duas vias
x:=380

oPrinter:StartPage()
oPrinter:Box(040,010,410,550)
oPrinter:Box(040+x,010,410+x,550)


//cText1 := "COOPERATIVA DOS PRODUTORES RURAIS DO PRATA"
cText1 := "RECIBO"
oPrinter:SayBitmap(050,020,"\system\LGMID.png",060,033)
oPrinter:Say(090,120,cText1,oFont12NS)

oPrinter:SayBitmap(050+x,020,"\system\LGMID.png",060,033)
oPrinter:Say(090+x,120,cText1,oFont12NS)


//oPrinter:Say(100,120,"VALOR A ANTECIPAR:",oFont12N)
//oPrinter:Say(100+x,120,"VALOR A ANTECIPAR:",oFont12N)


oPrinter:Say(090,423,picVal(Alltrim(Str(nValAdi))),oFont12N)
oPrinter:Say(090+x,423,picVal(Alltrim(Str(nValAdi))),oFont12N)

oPrinter:Say(120,70,'Recebi(emos) da Cooperativa dos Produtores Rurais do Prata Ltda.' ,oFont10)
oPrinter:Say(135,70,'a quantia de:',oFont10)


oPrinter:Say(120+X,70,'Recebi(emos) da Cooperativa dos Produtores Rurais do Prata Ltda.' ,oFont10)
oPrinter:Say(135+X,70,'a quantia de:',oFont10)


oPrinter:Say(150,70,Alltrim(Extenso(nValAdi)),oFont10)
oPrinter:Say(150+x,70,Alltrim(Extenso(nValAdi)),oFont10)

cData:=dTos(dData)
dDataAnt:=sTod(SubStr(cData,1,4)+StrZero(Val(SubStr(cData,5,2))-1,2)+SubStr(cData,7,2))

oPrinter:Say(180,70,"referente a antecipa็ใo do cr้dito do leite do m๊s de "+MesExtenso(dData),oFont10)
oPrinter:Say(180+x,70,"referente a antecipa็ใo do cr้dito do leite do m๊s de "+MesExtenso(dData),oFont10)


oPrinter:Say(210,170    ,"Cr้dito total do m๊s: "+"         "+picVal(Alltrim(Str(_nValTotal))),oFont10)
oPrinter:Say(210+x,170  ,"Cr้dito total do m๊s: "+"         "+picVal(Alltrim(Str(_nValTotal))),oFont10)

oPrinter:Say(225,170    ,"    Valor antecipado: "+"         "+picVal(Alltrim(Str(nValAdi))),oFont10)
oPrinter:Say(225+x,170  ,"    Valor antecipado: "+"         "+picVal(Alltrim(Str(nValAdi))),oFont10)


//oPrinter:Say(240,170    ,"       Saldo a pagar: "+"         "+picVal(Alltrim(Str(nValTotal -nValAdi))),oFont10)
//oPrinter:Say(240+X,170  ,"       Saldo a pagar: "+"         "+picVal(Alltrim(Str(nValTotal -nValAdi))),oFont10)

//oPrinter:Say(270,70    ,"Custos Administrativos Gerados na antecipa็ใo "+picVal(Alltrim(Str(nValJuros))),oFont10)
//oPrinter:Say(270+x,70    ,"Custos Administrativos Gerados na antecipa็ใo"+picVal(Alltrim(Str(nValJuros))),oFont10)

oPrinter:Say(300,70    ,"Por ser verdade firmamos o presente",oFont10N)
oPrinter:Say(300+x,70    ,"Por ser verdade firmamos o presente",oFont10N)

oPrinter:Say(315,70    ,"Prata(MG),"+ExData(dData),oFont10N)
oPrinter:Say(315+x,70    ,"Prata(MG),"+ExData(dData),oFont10N)



oPrinter:Say(345,70    ,"______________________________________________________",oFont10N)
oPrinter:Say(345+x,70  ,"______________________________________________________",oFont10N)

oPrinter:Say(360,70    ,aFornece[1]+"-"+aFornece[2],oFont10N)
oPrinter:Say(360+x,70    ,aFornece[1]+"-"+aFornece[2],oFont10N)
//oPrinter:Say(360,70    ,"   Cooperativa dos Produtores Rurais do Prata Ltda",oFont10N)
//oPrinter:Say(360+x,70  ,"   Cooperativa dos Produtores Rurais do Prata Ltda",oFont10N)


oPrinter:EndPage()

If lPreview
	oPrinter:Preview()
EndIf

FreeObj(oPrinter)
oPrinter := Nil

Return


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT55rrc บ Autor ณ Totvs TM           บ Data ณ  30/12/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณReimpressao Recibo de pagamento antecipado.                 บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/   

User Function AGLT55rrc()

Local _nValAdi := 0
Local _nValJur	:= 0
Local _nValTot	:= 0
Local _cEvent   := ALLTRIM(GETMV("LT_EVEJUR"))
Local _cNome := ""

BeginSql alias "TRE5"
	SELECT
	E5_SEQ, E5_VALOR
	FROM
	%table:SE5%
	WHERE
	%notDel%
	AND E5_PREFIXO = %Exp:_cSerie%
	AND E5_CLIFOR = %Exp:__cCliente%
	AND E5_DATA = %Exp:cGDiaP%
	AND E5_TIPODOC = 'BA'
	AND E5_SITUACA = ''
EndSql
DbSelectArea("TRE5")
TRE5->(DbGoTop())
_nValAdi := TRE5->E5_VALOR
                    
DbCloseArea("TRE5")


BeginSql alias "TRE2"
	SELECT
	E2_VALOR, E2_NOMFOR
	FROM
	%table:SE2%
	WHERE
	%notDel%
	AND E2_PREFIXO = 'GLZ'
	AND E2_FORNECE = %Exp:__cCliente%
	AND E2_EMISSAO = %Exp:cGDiaP%
	AND E2_L_EVENT = %Exp:_cEvent%

EndSql
DbSelectArea("TRE2")
TRE2->(DbGoTop())
If !TRE2->(Eof())
	_nValJur := TRE2->E2_VALOR
	_cNome := TRE2->E2_NOMFOR                 
EndIf
DbCloseArea("TRE2")


BeginSql alias "TRE22"
	SELECT
	SUM(E2_VALOR) AS VALOR
	FROM
	%table:SE2%
	WHERE
	%notDel%
	AND E2_PREFIXO = %Exp:_cSerie%
	AND E2_FORNECE = %Exp:__cCliente%
	AND E2_BAIXA <> ''
	AND E2_TIPO = 'NF'
EndSql
DbSelectArea("TRE22")
TRE22->(DbGoTop())
If !TRE22->(Eof())
	_nValTot := TRE22->VALOR
EndIf                 
DbCloseArea("TRE22")

If _nValAdi > 0
	U_AGLT55rc(_nValTot,_nValAdi,_nValJur, {__cCliente,_cNome},cGDiaP)
EndIf

Return



/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณExData    บAutor  ณMicrosiga           บ Data ณ  11/21/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณRetorna a data por extenso                                  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function ExData(dData)
cRet:=Alltrim(Str(Day(dData)))+' de '+MesExtenso(dData)+" de "+Alltrim(Str(Year(dData)))
Return cRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณpicVal    บAutor  ณFabricio Antunes    บ Data ณ  03/12/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao para retornar a picture correta de valores em       บฑฑ
ฑฑบ          ณ moeda (tratado como texto)                                 บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function picVal (cValor)
Local nTamanho:=Len(cValor) //13
Local nPosP:=At(".",cValor) //12
Local aPart:={}
Local cRet:=''

If nTamanho - nPosP = 1
	cValor:=cValor+"0"
EndIF

IF nTamanho - nPosP = 0
	cValor:=cValor+"00"
EndIF

IF nPosP = 0
	cValor:=cValor+".00"
EndIF

cValor:=Strtran(cValor,'.',",")
cInt:=SubStr(cValor,1,Len(cValor)-3)
cDec:=SubStr(cValor,Len(cValor)-2,3)
nQuant:=Int(Len(cInt)/3)

For nx:=1 to nQuant
	AADD(aPart,SubStr(cInt,Len(cInt)-2,3))
	cInt:=SubStr(cInt,1,Len(cInt)-3)
Next

AADD(aPart,cInt)

For nx:=Len(aPart) to 1 step -1
	IF Alltrim(aPart[nx]) <> ''
		cRet+=aPart[nx]+'.'
	EndIF
Next
cRet:="R$"+SubStr(cRet,1,Len(cRet)-1)+cDec

Return (cRet)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ PergBanc บ Autor ณ Totvs TM           บ Data ณ 10/12/2012  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบArquivos  ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static function PergBanc()

Local cPerg := "AGLT055BC"	
Local aHelpPor := {}

Aadd( aHelpPor, 'Informe o dados bancarios para   ')
Aadd( aHelpPor, 'gera็ใo do cheque a pagar ao     ')
Aadd( aHelpPor, 'cooperado.                       ')


PutSx1(cPerg,"01","Banco"			,"Banco"	   			,"Banco"		  		,"mv_ch1","C",03,0,1,"G","","SA6","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,{},{})
PutSx1(cPerg,"02","Agencia"			,"Agencia"      		,"Agencia"     	  		,"mv_ch2","C",05,0,1,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,{},{})
PutSx1(cPerg,"03","Conta"			,"Conta" 				,"Conta"   	   	   		,"mv_ch3","C",10,0,1,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,{},{})

RETURN

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ BuscaCC  บ Autor ณ Totvs TM           บ Data ณ 10/12/2012  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบArquivos  ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/


Static Function BuscaCC()

Local _aTemp := {}
Local cPerg := "AGLT055BC"	

PergBanc()
//MV_PAR01 Forma Pgto
//MV_PAR02 Banco
//MV_PAR03 Agencia
//MV_PAR04 Conta Corrente

Pergunte(cPerg,.T.)

AADD(_aTemp,mv_par01)
AADD(_aTemp,mv_par02)
AADD(_aTemp,mv_par03)


Return _aTemp
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ QueryCod   บ Autor ณ Guilherme Fran็a    บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para validar se pergunta AGLT003 existe no       บฑฑ
ฑฑบ          ณ dicionario de dados, caso nao existe cria a pergunta.         บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ _cTab: Tabela da query (obritatorio)							 บฑฑ
ฑฑบ			 ณ _cPar: Parametro generico							 		 บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function QueryCod(_cTab,_cPar)

Local _cRet	:= ""
Local _cFiltro := ""
Local _cAlias := GetNextAlias()

If _cTab == "ZLL"
	
	BeginSql alias _cAlias
		SELECT
		MAX(ZLL_COD) AS ULTIMO
		FROM
		%table:ZLL%
		WHERE
		%notDel%
	EndSql
	_cRet := Soma1((_cAlias)->ULTIMO)
	
	dbSelectArea("ZLL")
	dbSetOrder(1)
	While ( dbSeek(xFILIAL("ZLL")+_cRet) .or. !MayIUseCode("ZLL" + xFilial("ZLL") + _cRet+"001") )
		//verifica se esta na memoria, sendo usado e busca o proximo numero disponivel
		_cRet := SOMA1(_cRet)			  
	EndDo
	DbCloseArea(_cAlias)	
EndIf

Return _cRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ Inc_SE2  บ Autor ณTOTVS TM			       บ Data da Criacao  ณ 10/02/2009                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Inclui titulo na SE2                            		    	                           						บฑฑ
ฑฑบ			   ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ   Prefixo,  Num,  Parcela,  Tipo,  Forn,  Loja,  Natureza,  Emissao,  Vencto,  Valor, Acrescimo, Decrescimo. บฑฑ
ฑฑบ			 ณ	 Codigo+Loja da Operadora do Conv๊nio, Historico do Titulo SE2.                        						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Verdadeiro = Se gravou corretamente							                         						บฑฑ
ฑฑบ			 ณ Falso = Se ocorreu erro								                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ TOTVS - Microsiga											                             					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite                                                                          					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                   							   ณ                                  ณ  	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function IncSE2(cpPrefixo,cpNum,cpParcela,cpTipo,cpForn,cpLoja,cpNatureza,cpEmissao,cpVencto,npValor,npAcres,npDesc,cTitPai,cHist,nVlTxPer,xcEvento)

Local _aAutoSE2 :={}
Local lOk       := .T.
Local aArea     := GetArea()
Local cEntrg    := ""

Private lMsErroAuto := .F.

DEFAULT nVlTxPer  := If(cpTipo=="NDF",GetMv("LT_TXPER "),0)//Se eh debito do produtor, grava valor da Taxa de Permanencia para cobrar juros.
DEFAULT cTitPai := ""
     
nVlTxPer := 0 //U_BUSCATAXA("BOL","BO") / 30

nVlTxPer := Round(nVlTxPer,4)

cEntrg := xFilial("SD1") // U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,cpEmissao)//Filial de entrega da linha do produtor


AAdd( _aAutoSE2, { "E2_PREFIXO"	, cpPrefixo , Nil } )
AAdd( _aAutoSE2, { "E2_NUM"		, cpNum     , Nil } )
AAdd( _aAutoSE2, { "E2_PARCELA"	, cpParcela , Nil } )
AAdd( _aAutoSE2, { "E2_TIPO"	, cpTipo    , Nil } )
AAdd( _aAutoSE2, { "E2_NATUREZ"	, cpNatureza, Nil } )
AAdd( _aAutoSE2, { "E2_FORNECE"	, cpForn    , Nil } )
AAdd( _aAutoSE2, { "E2_LOJA"	, cpLoja    , Nil } )
AAdd( _aAutoSE2, { "E2_EMISSAO"	, cpEmissao , Nil } )
AAdd( _aAutoSE2, { "E2_EMIS1"	, cpEmissao , Nil } )
AAdd( _aAutoSE2, { "E2_VENCTO"	, cpVencto  , Nil } )
AAdd( _aAutoSE2, { "E2_VENCREA"	, cpVencto  , Nil } )
AAdd( _aAutoSE2, { "E2_VALOR"	, npValor   , Nil } )
AAdd( _aAutoSE2, { "E2_PORCJUR" , nVlTxPer  , Nil } )
AAdd( _aAutoSE2, { "E2_ACRESC"	, npAcres   , Nil } )
AAdd( _aAutoSE2, { "E2_DECRESC"	, npDesc    , Nil } )
AAdd( _aAutoSE2, { "E2_HIST"	, cHist     , Nil } )
AAdd( _aAutoSE2, { "E2_DATALIB"	, cpEmissao , Nil } )
AAdd( _aAutoSE2, { "E2_USUALIB"	, ALLTRIM(cUserName), Nil } )
AAdd( _aAutoSE2, { "E2_L_SETOR"	, "000001"    , Nil } )
AAdd( _aAutoSE2, { "E2_L_PAICV"	, cTitPai   , Nil } )
AAdd( _aAutoSE2, { "E2_L_FILEN" , cEntrg    , Nil } )
AAdd( _aAutoSE2, { "E2_L_EVENT", xcEvento	 ,Nil  } )

//AAdd( _aAutoSE2, { "E2_ORIGEM"	, "AGLT010" , Nil } )


Pergunte("FIN050",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto
MSExecAuto({|x,y| Fina050(x,y)},_aAutoSE2,3) //Inclusao dos lancamentos do convenio no financeiro.
If lMsErroAuto
	lOk := .F.
	xMagHelpFis("Erro","Erro ao incluir Titulo: "+cpPrefixo+cpNum+"-"+cpForn,"Comunique ao Suporte!!!")
	mostraerro()
EndIf

RestArea(aArea)

Return lOk 
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ Inc_ZLL  บ Autor ณ Abrahao P. Santos     บ Data da Criacao  ณ 10/02/2009                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Grava registro na ZLL                           		    	                           						บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Codigo,Sequencia,Retiro,Loja,Nome,Valor,Status)																บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum               								    	                           						บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ TOTVS - Microsiga											                             					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite                                                                          					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                   							   ณ                                  ณ  	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function IncZLL(cCod,cSeq,cRetiro,cLoja,cNome,nValor,cStatus,_dData,_dVcto,_cConven,_cLjConv,_cSetor,_cNatur,_xcEvento,_nAcresc,_nTxAdm,_FilOri,cObs,nParcela,nIVlrparc,nIVlrtot,nTxPar)

dbSelectArea("ZLL")
dbSetOrder(1)

//Semaforo para pemitir a grava็ใo de mais de um usuแrio por vez
While !LockByName("AGLT10",.T.,.F. )
	//MsAguarde({|| Sleep(2000) }, "Semaforo de processamento...", "Aguarde, salvando registros")              
	Sleep(2000)
EndDo 


RecLock("ZLL",.T.)
ZLL->ZLL_FILIAL	:= xFILIAL("ZLL")
ZLL->ZLL_COD	:= cCod
ZLL->ZLL_SEQ	:= cSeq
ZLL->ZLL_DATA	:= _dData
ZLL->ZLL_VENCTO	:= _dVcto
ZLL->ZLL_VENCON := _dVcto
ZLL->ZLL_CONVEN	:= _cConven
ZLL->ZLL_LJCONV	:= _cLjConv
ZLL->ZLL_RETIRO	:= cRetiro
ZLL->ZLL_RETILJ	:= cLoja
ZLL->ZLL_DCRRET	:= Posicione("SA2",1,xFilial("SA2")+cRetiro+cLoja,"A2_NOME")
ZLL->ZLL_VALOR	:= nValor
ZLL->ZLL_STATUS	:= cStatus
ZLL->ZLL_SETOR	:= _cSetor
ZLL->ZLL_NATURE	:= _cNatur
ZLL->ZLL_EVENTO := _xcEvento
ZLL->ZLL_ACRESC := _nAcresc
ZLL->ZLL_TXADM  := _nTxAdm
ZLL->ZLL_OBSERV := cObs
ZLL->ZLL_PARCEL	:= nParcela
ZLL->ZLL_VLRPAR	:= nIVlrparc
ZLL->ZLL_VLRTOT	:= nIVlrtot
ZLL->ZLL_TXPARC	:= nTxPar
ZLL->ZLL_CARENC	:= "N"
ZLL->ZLL_FILENT := xFILIAL("SD1") //U_GetFilEnt(cRetiro+cLoja,_dData)//Filial de entrega da linha do produtor

MsUnlock()

UnLockByName("AGLT10",.T.,.F.)     

Return

