#INCLUDE "RWMAKE.ch"
#INCLUDE "TOPCONN.ch"
#INCLUDE "COLORS.ch"
#INCLUDE "FONT.ch"
#INCLUDE "TBICONN.ch"
#INCLUDE "TCBROWSE.ch"
#INCLUDE "FIVEWIN.ch"
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ AGLT012  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Cadastro de solicitacao de emprestimo ao fornecedor                                                          บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gerar emprestimo financeiro para fornecedores		                                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบMarco     ณ15/07/2010ณ Tratamento do Financiamento   				   ณTUB027                            ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function AGLT012

Private iTab1     := "ZLM"
Private cAlias    := iTab1
Private nVlrTotal := 0

Private aRotina := {{ OemToAnsi("Pesquisar") ,"axPesqui"    , 0 , 1},;   && Pesquisar
{ OemToAnsi("Visualizar")         ,'U_GLT_012(2)'   , 0 , 2},;   && Visualizar
{ OemToAnsi("Incluir")            ,'U_GLT_012(3)'   , 0 , 3},;   && Incluir
{ OemToAnsi("Alterar")            ,'U_GLT_012(4)'   , 0 , 4},;   && Alterar
{ OemToAnsi("Excluir")            ,'U_GLT_012(5)'   , 0 , 5},;   && Excluir
{ OemToAnsi("Aprova็ใo")         ,'U_GLT_012X("1")', 0 , 5},;   && Aprovacao
{ OemToAnsi("Reprovacao")         ,'U_GLT_012X("3")', 0 , 5},;   && Reprovacao
{ OemToAnsi("Efetivacao")         ,'U_GLT_012X("2")', 0 , 5},;   && Efetivacao
{ OemToAnsi("Estorno")            ,'U_ESTEMP()'     , 0 , 6},;   && Excluir / Estorna
{ OemToAnsi("Nota Promis.")       ,'U_GLT_012NP()', 0 , 5},;   && Reimpressao nota promissoria
{ OemToAnsi("LegEnda")            ,"U_GLT_012G"     , 0 , 3,0} } // LegEnda




//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Define o cabecalho da tela de atualizacoes                   ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Private aCores := {{"ZLM_STATUS == '1'",'BR_BRANCO' },;// EM ABERTO
{ "ZLM_STATUS == '2'",'ENABLE'},;   // APROVADO
{ "ZLM_STATUS == '3'",'DISABLE'},;  // REPROVADO
{ "ZLM_STATUS == '4'",'BR_AZUL'}}   // EFETIVADO
                                                                       
Private cDelFunc := ".T." // Validacao para a exclusao. Pode-se utilizar ExecBlock
Private cPerg := "AGLT012   "

Public _FilSA2_L6	:= " .T. " //Variavel publica chamada na consulta padrao SA2_L6, usada para filtrar o tipo dos fornecedores a aparecer na consulta de retiro.

ValidPerg()

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Endereca a funcao de BROWSE                                  ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
mBrowse(6, 1,22,75,cAlias,,,,,,aCores)

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GLT_012  บ Autor ณ Abrahao               บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Tela de inclusao/alteracao/exclusao do cadastro de solicitacao                                               บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Visualizar telas de dados da solcitacao    				                                                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ nOpc (tipo 3-inclusao,2-visualizar,etc..) e oqf (verdadeiro se For uma avaliacao)     						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function GLT_012(nOpc,oqf)

Local bCampo   := { |nCPO| Field(nCPO) }
Local vCampos  := {} // campos de visuzaliacao
Local aButtons := {}

Private nReg  := 0
//Private aGets := {}
//Private aTela := {}
//Private aTELA[0][0],aGETS[0]
//Private aPosObj  :={}
//Private aSize    := MsAdvSize()
//Private aInfo    :={aSize[1],aSize[2],aSize[3],aSize[4],3,3}
Private aObjects := {}
Private aSize    := {}
Private aInfo    := {}
Private aPosObj  := {}
Private aTela[0][0]
Private aGets[0]
Private _dVencto := dDataBase
Private wVar
Private AHEADER  := {}, ACOLS := {}
Private avaliar  := .F.
Private iTab2    :="ZLO"
Private iUser    := __CUSERID //U_UCFG001(1)
Private oVlrTotal
Private cCadastro:= OemToAnsi("Emprestimos")
Private nOpce
Private nOpcg
Private nUsado
Private cTitulo
Private cAliasenchoice
Private cLinok
Private cTudok
Private cFieldok
Private nReg
Private nOpc

nVlrTotal := 0
iTab1     := "ZLM"
cAlias    := iTab1

aRotina := {{ OemToAnsi("Pesquisar") ,"axPesqui"    , 0 , 1},;   && Pesquisar
{ OemToAnsi("Visualizar")         ,'U_GLT_012(2)'   , 0 , 2},;   && Visualizar
{ OemToAnsi("Incluir")            ,'U_GLT_012(3)'   , 0 , 3},;   && Incluir
{ OemToAnsi("Alterar")            ,'U_GLT_012(4)'   , 0 , 4},;   && Alterar
{ OemToAnsi("Excluir")            ,'U_GLT_012(5)'   , 0 , 5},;   && Excluir
{ OemToAnsi("Avaliacao")          ,'U_GLT_012X("1")', 0 , 5},;   && Aprovacao
{ OemToAnsi("Reprovacao")         ,'U_GLT_012X("3")', 0 , 5},;   && Reprovacao
{ OemToAnsi("Efetivacao")         ,'U_GLT_012X("2")', 0 , 5},;   && Efetivacao
{ OemToAnsi("Estorno")            ,'U_ESTEMP()'     , 0 , 6},;   && Excluir / Estorna
{ OemToAnsi("Nota Promis.")       ,'U_GLT_012NP()', 0 , 5},;   && Reimpressao nota promissoria
{ OemToAnsi("LegEnda")            ,"U_GLT_012G"     , 0 , 3,0} } // LegEnda



//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Define o cabecalho da tela de atualizacoes                   ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
aCores := {{"ZLM_STATUS == '1'",'BR_BRANCO' },;// EM ABERTO
{ "ZLM_STATUS == '2'",'ENABLE'},;   // APROVADO
{ "ZLM_STATUS == '3'",'DISABLE'},;  // REPROVADO
{ "ZLM_STATUS == '4'",'BR_AZUL'}}   // EFETIVADO

/*
// pega tamanhos das telas
AADD(aObjects,{100,050,.T.,.F.,.F.})
AADD(aObjects,{100,100,.T.,.T.,.F.})
aPosObj:=MsObjSize(aInfo,aObjects)
*/
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Define o tamanho da tela e faz tratamento para dimensionamento qdo usado resolucoes diferentes.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
aSize := MsAdvSize()
aObjects := {}
AAdd( aObjects, { 100, 100, .T., .T. } )
AAdd( aObjects, { 100, 100, .T., .T. } )
AAdd( aObjects, { 100, 015, .T., .F. } )

aInfo   := {aSize[1],aSize[2],aSize[3],aSize[4],3,3}
aPosObj := MsObjSize(aInfo,aObjects)

// parametro de avaliacao
avaliar := Iif(Empty(oqf),.F.,.T.)

If nOpc == 3 // Incluir
	nOpcE := 3
	nOpcG := 3
ElseIf nOpc == 4 // Alterar
	nOpcE := 4
	nOpcG := 4
ElseIf nOpc == 2 // Visualizar
	nOpcE := 2
	nOpcG := 2
Else             // Excluir
	nOpcE := 5
	nOpcG := 5
EndIf


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Cria variaveis M->????? da Enchoice                          ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
aCpoEnchoice  :={}
dbSelectArea("SX3")
dbSetorder(1)
dbSeek("ZLM")
While !Eof().And.(x3_arquivo=="ZLM")
	If X3USO(x3_usado).And.x3_nivel>0
		AADD(aCpoEnchoice,x3_campo)
	EndIf
	wVar := "M->"+x3_campo
	&wVar:= CriaVar(x3_campo)
	If ALLTRIM(x3_context)=="V"
		aadd(vCampos,{x3_campo,x3_relacao})
	EndIf
	dbSkip()
EndDo


If nOpc#3 // se nao For inclusao preenche os campos do cabecalho
	dbSelectArea(iTab1)
	For nCntFor := 1 To FCount()
		M->&(EVAL(bCampo,nCntFor)) := FieldGet(nCntFor)
	Next
	For v:=1 To Len(vCampos) // CAMPOS DE VISUALIZACAO
		wVar  := "M->"+vCampos[v,1]
		&wVar := &(vCampos[v,2])
	Next v
EndIf

PswSeek(iUser) //Posiciona no usuario logado

If nOpc==3
	M->ZLM_USER := iUser
	M->ZLM_NUSER:= AllTrim(PswRet()[1][4])//U_GetNUser(iUser)
	M->ZLM_DATA := dDataBase


Else
	If !avaliar
		If !(M->ZLM_STATUS $ "1/2") .And. nOpc!=2
			xMagHelpFis("Restricao 1","Essa solicitacao nao pode ser alterada!","Verique o Status da solicitacao! Uma vez aprovada ou efetivada, nao pode ser modificada!")
			Return
		EndIf
	Else
		lContinue := .F.
		If ( ALLTRIM(iUser) == ALLTRIM(M->ZLM_USERAP) .And. nOpc == 4 .And. Avaliar)
			If M->ZLM_STATUS == "1" .Or. M->ZLM_STATUS == "2" .Or. M->ZLM_STATUS == "3"
				lContinue := .T.
			EndIf
		EndIf
		
		If !lContinue
			xMagHelpFis("Restricao 2","Essa solicitacao nao pode ser alterada!","Verique o Status da solicitacao! Uma vez aprovada ou efetivada, nao pode ser modificada!")
			Return
		EndIf
	EndIf
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Cria aHeader e aCols da GetDados                             ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
nUsado:=0
dbSelectArea("SX3")
dbSeek("ZLO")
While !Eof().And.(x3_arquivo=="ZLO")
	If ALLTRIM(x3_campo) $ "ZLO_ITEM#ZLO_VECTO#ZLO_VALOR"
		nUsado:=nUsado+1
		Aadd(aHeader,{ TRIM(X3Titulo()), x3_campo, x3_picture,;
		x3_tamanho, x3_decimal,x3_valid,;
		x3_usado, x3_tipo, x3_arquivo, x3_context, x3_Relacao, x3_reserv } )
		wVar  := "M->"+x3_campo
		&wVar := CriaVar(x3_campo)
	EndIf
	dbSkip()
EndDo
dbSelectArea(iTab1)


// PREENCHENDO ACOLS

If nOpc == 3 // Incluir
	aCols:={Array(nUsado+1)}
	aCols[1,nUsado+1]:=.F.
	For _ni:=1 To nUsado
		aCols[1,_ni]:=CriaVar(aHeader[_ni,2])
	Next
	aCols[1,1] := "001"
Else
	aCols:={}
	dbSelectArea("ZLO")
	dbSetorder(1)
	If (dbSeek(ZLM->ZLM_FILIAL+ZLM->ZLM_COD))
		While ZLO->ZLO_FILIAL+ZLO->ZLO_COD == xFILIAL("ZLO")+M->ZLM_COD .And. !Eof()
			AADD(aCols,Array(nUsado+1))
			For _ni:=1 To nUsado
				aCols[Len(aCols),_ni]:=If(aHeader[_ni,10] # "V",FieldGet(FieldPos(aHeader[_ni,2])),CriaVar(aHeader[_ni,2]))
			Next
			aCols[Len(aCols),nUsado+1]:=.F.
			dbSkip()
		EndDo
	Else
		aCols:={Array(nUsado+1)}
		aCols[1,nUsado+1]:=.F.
		For _ni:=1 To nUsado
			aCols[1,_ni]:=CriaVar(aHeader[_ni,2])
		Next
		aCols[1,1] := "001"
	EndIf
	
EndIf

If Len(aHeader) > 0
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Executa a Modelo 3                                           ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	cTitulo       := OemToAnsi("Emprestimos")
	cAliasEnchoice:= iTab1
	cAliasGetd    := "ZLO"
	cAlias        := "ZLO"
	cLinOk        := "U_GLT_012L"
	cTudOk        := "AllwaysTrue()"
	cFieldOk      := ""
	
	nOpca := 0
	/*
	DEFINE MSDIALOG oDlg TITLE cTitulo From 9,0 To aPosObj[2,3],aPosObj[2,4] of oMainWnd
	EnChoice(cAliasEnchoice,nReg,nOpcE,,,,aCpoEnchoice,{15,3,160,aPosObj[2,4]},,3,,,,,,.F.)
	oGetDados := MsGetDados():New(165,aPosObj[2,2],320,aPosObj[2,4],nOpcG,cLinOk,cTudOk,"+ZLO_ITEM",.T.,,,,)
	ACTIVATE MSDIALOG oDlg ON INIT EnchoiceBar(oDlg,{|| If(obrigatorio(aGets,aTela).And.U_GLT_012T(nOpc,Avaliar),Grava().And.oDlg:End(),.F.),nOpca := 1},{||oDlg:End()},,aButtons)
	*/
	DEFINE MSDIALOG oDlg TITLE cTitulo FROM aSize[7],0 TO aSize[6],aSize[5] OF oMainWnd PIXEL
	EnChoice(cAliasEnchoice,nReg,nOpcE,,,,aCpoEnchoice  ,aPosObj[1],,3)
	oGetDados := MsGetDados():New(aPosObj[2,1],aPosObj[2,2],aPosObj[2,3],aPosObj[2,4],nOpcG,cLinOk,cTudOk,"+ZLO_ITEM",.T.,,,,)
	ACTIVATE MSDIALOG oDlg ON INIT EnchoiceBar(oDlg,{|| If(obrigatorio(aGets,aTela).And.U_GLT_012T(nOpc,Avaliar),Grava().And.oDlg:End(),.F.),nOpca := 1},{||oDlg:End()},,aButtons)
	
EndIf

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GLT_012T บ Autor ณ Abrahao               บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Validacao dos dados preenchidos                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Verifica se alteracao ou exclusao e valida os usuarios que tem permissao                                     บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ iOpc (tipo 3-inclusao,2-visualizar,etc..)                                             						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function GLT_012T(iOpc,iAvaliar)

Local lRet     := .T.
Local cAux     := " "
Local MV_PREF1 := " "

// -----------------------------------------------------------------
// Validacao para tipo diferente de emprestimo, so pode uma parcela
// -----------------------------------------------------------------
If !(M->ZLM_TIPO $ "E/R") .And. iOpc <> 5//Excluir
	If M->ZLM_PARC > 1
		xMagHelpFis("Parcelas","Quando o tipo for diferente de empr้stimo/renegocia็ใo, nใo poderแ ser utilizado mais de uma parcela.",;
		"Informe uma parcela ou entใo altere o tipo para adiant.parcelado.")
		Return(.F.)
	EndIf
EndIf

// -----------------------------------------
// ObtEndo Parametos dos EMPRESTIMOS
// -----------------------------------------
If ZLM->ZLM_TIPO == "E"
	MV_EVENT := ALLTRIM(GetMv("LT_EVTEMP"))
	DbSelectArea("ZL8")
	DbSetOrder(1)
	If DbSeek(xFilial("ZL8")+MV_EVENT)
		MV_PREF1 := MV_PREF2 := ZL8->ZL8_PREFIX
    EndIf
EndIf

// -----------------------------------
// ObtEndo Parametos dos ADIANTAMENTOS
// -----------------------------------
If ZLM->ZLM_TIPO == "A"
	MV_EVENT := ALLTRIM(GetMv("LT_EVTADT"))
	DbSelectArea("ZL8")
	DbSetOrder(1)
	If DbSeek(xFilial("ZL8")+MV_EVENT)
		MV_PREF1 := MV_PREF2 := ZL8->ZL8_PREFIX
    EndIf
EndIf

// -----------------------------------------
// ObtEndo Parametos dos EMPRESTIMOS
// -----------------------------------------
If ZLM->ZLM_TIPO == "R"
	MV_EVENT := ALLTRIM(GetMv("LT_EVTREN"))
	DbSelectArea("ZL8")
	DbSetOrder(1)
	If DbSeek(xFilial("ZL8")+MV_EVENT)
		MV_PREF1 := MV_PREF2 := ZL8->ZL8_PREFIX
    EndIf
EndIf



If ZLM->ZLM_TIPO == "C"
	MV_PREF1 := ALLTRIM(GetMv("LT_COTPX1"))
EndIf
/*
If M->ZLM_DTLIB > M->ZLM_VENCTO
	xMagHelpFis("Vencimento","O vencimento nao pode ser menor que a data de referencia.",;
	"O vencimento normalmente ้ no dia 12 do mes seguinte. Ex: Referencia 30/11/10 Vencimento 12/12/10.")
	lRet := .F.
EndIf

If M->ZLM_DTLIB != LASTDAY(M->ZLM_DTLIB)
	xMagHelpFis("Referencia","Data de referencia esta incorreta!",;
	"Data de referencia deve ser o ultimo dia do mes.")
	lRet := .F.
EndIf
*/
If M->ZLM_DATA > M->ZLM_VENCTO
	xMagHelpFis("Data","A data de solicitacao nao pode ser maior que o vencimento.",;
	"A data de solicitacao deve ser igual a database do sistema.")
	lRet := .F.
EndIf

/* Comentado pois na COOPRATA o adiantamento pode ser cobrado juros
If M->ZLM_TIPO == "A"
	If M->ZLM_JUROS > 0 .and. M->ZLM_TIPO == "A"
		xMagHelpFis("Juros","Adiantamento nao pode ter juros!","Retire os juros.")
		lRet:=.F.
	EndIf
EndIf
*/

/*
cAux:=GetSetor(M->ZLM_SA2COD,M->ZLM_SA2LJ)
If  cAux != M->ZLM_SETOR .And. LEFT(M->ZLM_SA2COD,1) $ "C/G/T"
	xMagHelpFis("Setor","Setor incorreto! O Produtor indicado pertence ao Setor "+cAux,"Indique o Setor "+cAux+" ou altere a linha do Produtor.")
	lRet:=.F.
EndIf
*/
If iOpc == 4 .And. lRet // alterar
	lRet:=.F.
	If ALLTRIM(M->ZLM_USER) == iUser .And. (M->ZLM_STATUS == "1" .Or. M->ZLM_STATUS == "2")
		lRet:=.T.
	Else
		If ALLTRIM(M->ZLM_USERAP) == iUser .Or. Empty(ALLTRIM(M->ZLM_USERAP))
			If iAvaliar .And. U_GLT_012Z(iUser,"Aprovar")// botao avaliacao do browse
				lRet := .T.
				Return(lRet)
			Else
				xMagHelpFis("Restricao","A solicitacao nao pode ser alterada!","Verifique se seu usuario tem permissao para alterar ou se o usuario que esta tentando alterar ้ diferente do usuแrio que incluiu o empr้stimo!")
			EndIf
		Else
			xMagHelpFis("Restricao","A solicitacao nao pode ser alterada!","Verifique se seu usuario tem permissao para alterar ou se o usuario que esta tentando alterar ้ diferente do usuแrio que incluiu o empr้stimo!")
		EndIf
	EndIf
EndIf

If iOpc == 5  // excluir
	lRet:=.F.
	
	If ALLTRIM(M->ZLM_USERAP) == ALLTRIM(iUser)
		If MsgYesNo("Tem certeza que deseja excluir?")
			If !ExistTit("SE2",MV_PREF1,M->ZLM_COD)
				lRet := .T.
				Return(lRet)
			Else
				xMagHelpFis("Restricao","Nao foi possivel excluir por existirem titulos no financeiro!","Exclua os titulos no financeiro referentes a essa solicitacao!")
			EndIf
		EndIf
	EndIf
	
	If ALLTRIM(M->ZLM_USER) == ALLTRIM(iUser) .And. (M->ZLM_STATUS $ "1/2")
		If MsgYesNo("Tem certeza que deseja excluir?")
			lRet:=.T.
		EndIf
	Else
		xMagHelpFis("Restricao","A solicitacao nao pode ser alterada!","Verifique se seu usuario tem permissao para alterar ou o Status da solicitacao  ou se o usuario que esta tentando alterar ้ diferente do usuแrio que incluiu o empr้stimo!")
	EndIf
EndIf
/*
//--------------------------------------------
// Especํfico Cooprata                      
// Analista: Clแudio Gon็alves
// Data: 04/08/2013
// Assunto: Valida็ใo do Limite de Credito do 
// cooperado
//--------------------------------------------
IF iOpc <> 5
	IF !(U_CFAT004(M->ZLM_SA2COD,"CO","L",M->ZLM_PAGTO,,{{"CO"}}))
		lRet	:= .F.
	ENDIF
ENDIF
*/
Return(lRet)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GLT_012L บ Autor ณ Abrahao               บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Validacao da linha do acols                                                                                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Nenhum                                     				                                                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function GLT_012L()
Return .T.
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GRAVA    บ Autor ณ Abrahao               บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Grava dados do cabecalho e itens                                                                             บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gravar os dados do cabecalho e dos itens nas tabelas do banco		                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function Grava()

Local cArea
Local _cFaturas := ""
Local ax        := ""

Private lMsHelpAuTo := .T.

If nOpcG # 2 // nao For consulta
	
	dbSelectArea("ZLM")
	dbSetorder(1)
	wProcura := dbSeek(xFILIAL("ZLM")+M->ZLM_COD)
	If Inclui .Or. Altera
		
		RecLock("ZLM",If(wProcura,.F.,.T.))
		ZLM->ZLM_FILIAL := xFILIAL("ZLM")
		ZLM->ZLM_FILENT := U_GetFilEnt(M->ZLM_SA2COD,M->ZLM_SA2LJ,M->ZLM_DATA)//Filial de entrega da linha do produtor
		For x:=1 To Len(aCpoEnchoice)
			wVar := "M->"+aCpoEnchoice[x]
			ax:="ZLM->"+aCpoEnchoice[x]
			If (POSICIONE("SX3",2,aCpoEnchoice[x],"X3_CONTEXT")!="V")
				&ax := &wVar
			EndIf
		Next x
		ZLM->ZLM_STATUS := "1"
		MsUnlock()
		
		If Inclui .Or. Altera
			ConfirmSx8()
		EndIf
	Else  // exclusao
		RecLock("ZLM",.F.)
		dbDelete()
		MsUnlock()
		WriteSx2("ZLM")
	EndIf
	
	// Deleta todos os itens
	dbSelectArea("ZLO")
	dbSetorder(1)
	dbGoTop()
	wProcura := dbSeek(xFILIAL("ZLO")+M->ZLM_COD)
	While (!Eof().And.(xFILIAL("ZLO")+ZLO->ZLO_COD==xFILIAL("ZLO")+M->ZLM_COD))
		RecLock("ZLO",.F.,.T.)
		dbDelete()
		MsUnlock()
		WriteSx2("ZLO")
		dbSkip()
	EndDo
	
	// grava os itens
	For i:=1 To Len(aCols)
		dbSelectArea("ZLO")
		dbSetorder(1)
		dbGoTop()
		wProcura := dbSeek(xFILIAL("ZLO")+M->ZLM_COD+aCols[i,1])
		
		If Inclui .Or. Altera
			If aCols[i,len(aCols[i])] .And. wProcura // exclusao
				RecLock("ZLO",.F.,.T.)
				dbDelete()
				MsUnlock()
				WriteSx2("ZLO")
			Else
				If !aCols[i,len(aCols[i])]
					RecLock("ZLO",If(wProcura,.F.,.T.))
					ZLO->ZLO_FILIAL   := xFILIAL("ZLO")
					ZLO->ZLO_COD      := M->ZLM_COD
					ZLO->ZLO_ITEM     := aCols[i,1]
					ZLO->ZLO_VECTO    := aCols[i,2]
					ZLO->ZLO_VALOR    := aCols[i,3]
					ZLO->ZLO_FILENT   := U_GetFilEnt(M->ZLM_SA2COD,M->ZLM_SA2LJ,M->ZLM_DATA)//Filial de entrega da linha do produtor
					MsUnlock()
					If Inclui
						ConfirmSx8()
					EndIf
				EndIf
			EndIf
		Else
			If wProcura  // opcao exclusao do menu
				
				// deletando ZLO
				RecLock("ZLO",.F.)
				dbDelete()
				MsUnlock()
				WriteSx2("ZLO")
				
			EndIf
		EndIf
	Next
	
EndIf

Return(.T.)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GLT_012G บ Autor ณ Abrahao               บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Mostra LegEnda                                                                                               บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mostra LegEnda                                             	                                        		บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function GLT_012G()
BrwLegEnda("Emprestimos","Emprestimos",{ ;
{"BR_BRANCO","Em Aberto"},;// 1 - Branco   - Em aberto
{"ENABLE"   ,"Aprovado" },;// 2 - Verde    - Aprovado
{"DISABLE"  ,"Reprovado"},;// 3 - Vermelho - Reprovado
{"BR_AZUL"  ,"Efetivado"}})// 4 - Azul     - Efetivado(Gera SE2)
Return(.T.)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GLT_012JRบ Autor ณ Abrahao               บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Gatilho que calcula juros e cria os itens com vencimentos e valores das prestacoes                           บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function GLT_012JR()

Local _aArea := GetArea()
Local vlrax:={}
Local vlrpg:=0
Local qtdparc:=0
Local c:=0
Local aVenctos:={}
Local nTotJuros:=0
Local nVlrDevido:=0
Local nVlrAcum:=0

Local _nTxJuro := 0
Local _nCarencia := 0 //IIF(M->ZLM_CARENC=="S",1,0)
Local _nTotal := 0
Local _nDia20 := M->ZLM_DTLIB
Local _cTipoJur := Alltrim(SuperGetMv("LT_TIPOJUR",,"2")) // conte๚do "1" indica calculo Price, "2" indica SAC

If (M->ZLM_TOTAL!=0).And.(M->ZLM_PARC!=0) //.And.(M->ZLM_JUROS!=0)
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณGrava o percentual de juros mensais, buscando a informa็ใo inserida na telaณ
	//ณ"Cadastro de Taxas Financeiras" programa AFIN001.Fun็ใo BuscaTaxa()        ณ
	//ณGuilherme Fran็a 20/09/13                                                  ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู	
	//If !(U_GLT_012Z(__CUSERID,"JUROS") ) // Se o usuario tiver permissao de alterar os juros, o preenchimento sera manual
	 //	M->ZLM_JUROS := Iif(M->ZLM_TIPO=="E",U_BUSCATAXA("EMP","EMP"),U_BUSCATAXA("EMP","ADI"))                             
	//EndIf
	
	nVlrAcum:=M->ZLM_TOTAL
	For i:=1 To int(M->ZLM_PARC)
		nVlrAcum 	*= ((M->ZLM_JUROS/100)+1)
	Next i

	aVenctos:=somaMes(M->ZLM_VENCTO,int(M->ZLM_PARC)) // Obtem os vencimentos
	
	//Se nao for cobrado juros, divide o valor bruto pelas parcelas.
	If M->ZLM_JUROS = 0
		nVlrDevido 		:= round(M->ZLM_TOTAL,2)
		M->ZLM_PAGTO 	:= round(nVlrDevido,2)
		M->ZLM_VLRPAR 	:= round(nVlrDevido/int(M->ZLM_PARC),2)
	Else
		_nTxJuro := round((M->ZLM_JUROS/100),3)

		//Se existe juros e serแ apenas uma parcela, faz o calculo direto da data atual ate o vencimento.
		If Len(aVenctos) == 1
			M->ZLM_VLRPAR := U_CalcJuros("J",M->ZLM_JUROS,M->ZLM_TOTAL,M->ZLM_PARC,0,M->ZLM_DTLIB,aVenctos[1],_cTipoJur)
			nVlrDevido 	    := round(M->ZLM_VLRPAR,2)
			M->ZLM_PAGTO    := round(M->ZLM_VLRPAR,2)
		Else
			_nTotal := M->ZLM_TOTAL
/*Comentado pois os emprestimos parcelados usam somente calculo price, independe da data de lan็amento.
			If Day(M->ZLM_DTLIB) < 20 //Se a data de referencia for menor que o dia vinte, atualiza o valor do calculo.
				_nDia20 := STOD(SubStr(DTOS(M->ZLM_DTLIB),1,6)+"20")
		        //Atualiza o valor para o dia vinte do mes corrente
				_nTotal := U_CalcJuros("J",M->ZLM_JUROS,M->ZLM_TOTAL,0,0,M->ZLM_DTLIB,_nDia20)
			EndIf
*/			//Calcula parcelamento no metodo Price ou SAC dependendo do parametro LT_TIPOJUR
	        M->ZLM_VLRPAR := U_CalcJuros("P",M->ZLM_JUROS,_nTotal,M->ZLM_PARC,_nCarencia,"","",_cTipoJur)				
			nVlrDevido 	    := round(M->ZLM_VLRPAR*int(M->ZLM_PARC),2)
			M->ZLM_PAGTO    := round(M->ZLM_VLRPAR*int(M->ZLM_PARC),2)
		EndIf

	EndIf
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณFIM DA MODIFICACAOณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	
	//--------------------------------------------
	// Preenche os itens
	//--------------------------------------------
	aCols:={}
	//aVenctos:=somaMes(M->ZLM_VENCTO,int(M->ZLM_PARC))
	nRest:=nVlrDevido
	For i:=1 To Len(aVenctos)
		If i!=len(aVenctos)
			AADD(ACOLS,{strzero(i,3),aVenctos[i],round(M->ZLM_VLRPAR,2),.F.})
			nRest:=nRest-round(M->ZLM_VLRPAR,2)
		Else
			AADD(ACOLS,{strzero(i,3),aVenctos[i],nRest,.F.})
		EndIf
	Next i
	oGetDados:ForceRefresh()
	oGetDados:Refresh()
	
EndIf

RestArea(_aArea) 

Return M->ZLM_PAGTO

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GLT_012F บ Autor ณ Abrahao               บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Cria titulos no contas a receber referentes ao emprstimo                                                     บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function IncSE2(aCab,aItens)

Local MV_PREF1,MV_TIPO1,MV_NATU1 // Variaveis usadas nos titulos de debito
Local MV_PREF2,MV_TIPO2,MV_NATU2 // Variaveis usadas no titulo de credito
Local MV_EVENT	:= ""
Local _lTitOk   := .T.
Local lOk2     := .T.
Local nRest    := 0
Local nTam     := TamSX3("E2_PARCELA")[1]
Local cHist    := ""
Local nVlTxPer := 0
Local cEntrg   := ""
Local dVencto  := dDataBase
Local dEmissa  := dDataBase
Local nRest    := 0
Local nValor   := 0
Local nJuros   := 0
Local _nTaxa	:= 0
Local _lBaixou := .f.
Local _cTpFor	:= Posicione("SA2",1,xFilial("SA2")+ZLM->ZLM_SA2COD+ZLM->ZLM_SA2LJ,"A2_L_TPFOR")

Private _aAutoSE2 := {}
Private lMsErroAuTo := .F.

ProcRegua(2)
IncProc()

// -----------------------------------------
// ObtEndo Parametos dos EMPRESTIMOS
// -----------------------------------------
If aCab[6] == "E"
	
	MV_EVENT := ALLTRIM(GetMv("LT_EVTEMP"))
	DbSelectArea("ZL8")
	DbSetOrder(1)
	If DbSeek(xFilial("ZL8")+MV_EVENT)
		MV_PREF1 := MV_PREF2 := ZL8->ZL8_PREFIX
		MV_TIPO1 := ALLTRIM(GetMv("LT_EMPTP1"))
		MV_TIPO2 := ALLTRIM(GetMv("LT_EMPTP2"))
		If _cTpFor == "P"
			MV_NATU1 := ZL8->ZL8_NATPRD
			MV_NATU2 := ZL8->ZL8_NATPRD
		Else
			MV_NATU1 := ZL8->ZL8_NATFRT
			MV_NATU2 := ZL8->ZL8_NATFRT
		EndIf
	Else
		xMagHelpFis("Erro no Titulo","Nใo foi encontrado o evento de empr้stimo: "+MV_EVENT+" Os titulos nใo serแ incluidos no financeiro.",;
		"Verifique o conteudo do parโmetro LT_EVTEMP no configurador.")		
		DisarmTransaction()
		Return
	EndIf
EndIf

// -----------------------------------
// ObtEndo Parametos dos ADIANTAMENTOS
// -----------------------------------
If aCab[6] == "A"
	MV_EVENT := ALLTRIM(GetMv("LT_EVTADT"))
	DbSelectArea("ZL8")
	DbSetOrder(1)
	If DbSeek(xFilial("ZL8")+MV_EVENT)
		MV_PREF1 := MV_PREF2 := ZL8->ZL8_PREFIX
		MV_TIPO1 := ALLTRIM(GetMv("LT_EMPTP1"))
		MV_TIPO2 := ALLTRIM(GetMv("LT_EMPTP2"))
		If _cTpFor == "P"
			MV_NATU1 := ZL8->ZL8_NATPRD
			MV_NATU2 := ZL8->ZL8_NATPRD
		Else
			MV_NATU1 := ZL8->ZL8_NATFRT
			MV_NATU2 := ZL8->ZL8_NATFRT
		EndIf
	Else
		xMagHelpFis("Erro no Titulo","Nใo foi encontrado o evento de adiantamento: "+MV_EVENT+" Os titulos nใo serแ incluidos no financeiro.",;
		"Verifique o conteudo do parโmetro LT_EVTADT no configurador.")		
		DisarmTransaction()
		Return
	EndIf
EndIf

// -----------------------------------
// ObtEndo Parametos de renegocia็๕es
// -----------------------------------
If aCab[6] == "R"
	MV_EVENT := ALLTRIM(GetMv("LT_EVTREN"))
	DbSelectArea("ZL8")
	DbSetOrder(1)
	If DbSeek(xFilial("ZL8")+MV_EVENT)
		MV_PREF1 := MV_PREF2 := ZL8->ZL8_PREFIX
		MV_TIPO1 := "NF "
		MV_TIPO2 := "NF "
		If LEFT(ZLM->ZLM_SA2COD,1) $ "P"
			MV_NATU1 := ZL8->ZL8_NATPRD
			MV_NATU2 := ZL8->ZL8_NATPRD
		Else
			MV_NATU1 := ZL8->ZL8_NATFRT
			MV_NATU2 := ZL8->ZL8_NATFRT
		EndIf
	Else
		xMagHelpFis("Erro no Titulo","Nใo foi encontrado o evento de adiantamento: "+MV_EVENT+" O(s) titulo(s) nใo serแ(ใo) incluido(s) no financeiro.",;
		"Verifique o conteudo do parโmetro LT_EVTREN no configurador.")		
		DisarmTransaction()
		Return
	EndIf
EndIf




// -----------------------------------------
// ObtEndo Parametos das FINANCIAMENTOS
// -----------------------------------------
If aCab[6] == "N"
	MV_PREF1 := ALLTRIM(GetMv("LT_ANTPX1"))
	MV_PREF2 := ALLTRIM(GetMv("LT_ANTPX2"))
	MV_TIPO1 := ALLTRIM(GetMv("LT_ANTTP1"))
	MV_TIPO2 := ALLTRIM(GetMv("LT_ANTTP2"))
	If LEFT(aCab[2],1) $ "P"
		MV_NATU1 := ALLTRIM(GetMv("LT_ANTNT1"))
		MV_NATU2 := ALLTRIM(GetMv("LT_ANTNT2"))
	Else
		MV_NATU1 := ALLTRIM(GetMv("LT_ANTNT3"))
		MV_NATU2 := ALLTRIM(GetMv("LT_ANTNT4"))
	EndIf
EndIf

// -----------------------------------------
// Obtendo Parametos das COTAS DE CAPITAL
// -----------------------------------------

If aCab[6] == "C" .AND. LEFT(aCab[2],1) $ "C"
	MV_PREF1 := ALLTRIM(GetMv("LT_COTPX1"))
	MV_TIPO1 := ALLTRIM(GetMv("LT_COTTP1"))
	MV_NATU1 := ALLTRIM(GetMv("LT_COTNT1"))
EndIf
//Se eh debito do produtor, grava valor da Taxa de Permanencia para cobrar juros.
_nTaxa := GETMV("LT_TXPER")/30 //U_BUSCATAXA("BOL","BO") / 30
_nTaxa := Round(_nTaxa,4)

nVlTxPer := _nTaxa //If(MV_TIPO1=="NDF",_nTaxa,0)

If (!ExistTit("SE2",MV_PREF1,aCab[2])) .and. !empty(MV_PREF1)
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Laco de processamento das parcelas, le cada parcela e gera o titulo NDF. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	For ix:=1 To Len(aItens)
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Tratamento para separar os juros do valor da parcela do emprestimo.                 ณ
		//ณ O titulo sera gerado com o valor normal e no campo acrescimo sera gravado os juros. ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		If iX!=len(aItens)
			nValor:=round(aCab[4]/len(aItens),2)
			nRest+=nValor
		Else
			nValor:=aCab[4]-nRest
		EndIf
		nJuros:=round(aItens[iX,2]-nValor,2)
		
		
		dbSelectArea("SA1")
		dbSetOrder(1)
		dbSeek(xFILIAL("SA1")+aCab[2]+aCab[3])
		cEntrg := "" //U_GetFilEnt(SA1->A2_COD,SA2->A2_LOJA,aCab[5])//Filial de entrega da linha do produtor
		
		dVencto := Iif(aCab[6]=="A",aCab[8],aItens[ix,1])
		dEmissa := aCab[5]

        cHist := IIF(Empty(Alltrim(aCab[9])),"EMPRESTIMO",Alltrim(aCab[9]))
        cHist := cHist + " "+ ALLTRIM(STR(ix))+"/"+ALLTRIM(str(len(aItens)))
		_lTitOk := U_IncluSE1(MV_PREF1,aCab[1],STRZERO(iX,nTam),MV_TIPO1,aCab[2],aCab[3],MV_NATU1,dEmissa,dVencto,nValor,nJuros,0,"",cHist,nVlTxPer,MV_EVENT,"AGLT012","")
	Next ix

	If !lMsErroAuto
//			U_RFIN002(aCab[2],aCab[1],MV_PREF2) //Impressao da duplicata
	EndIf
	
	If aCab[6] <> "C"
		cHist := "EMPRESTIMO"
		do case
			case aCab[6] == "A"
				cHist := "ADIANTAMENTO"
			case aCab[6] == "R"
				cHist := "RENEGOCIAวรO"
		endcase
		
		dbSelectArea("SA2")
		dbSetOrder(1)
		dbSeek(xFILIAL("SA2")+aCab[2]+aCab[3])
		cEntrg := ""//U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,aCab[7])//Filial de entrega da linha do produtor
		
		//Tratamento para que a emissao e vencimento sejam iguais a database do sistema.
		//Essa regra vale somente na geracao do titulo NF.
		dVencto := dDataBase
		dEmissa := dDataBase
		
        cHist := Alltrim(cHist) + " " +Iif(substr(aCab[2],1,1)$ "P","PRODUTOR","FRETISTA")
		If _lTitOk
			_lTitOk := U_IncluSE2(MV_PREF2,aCab[1],STRZERO(1,nTam),MV_TIPO2,aCab[2],aCab[3],MV_NATU2,dEmissa,dVencto,aCab[4],0,0,"",cHist,nVlTxPer,MV_EVENT,"AGLT012","")
	
		If aCab[6] == "R"
			If MsgYesNo("Titulos da renegocia็ใo incluidos com sucesso!" +CHR(13)+CHR(10);
					+"Deseja abrir a tela de compensa็๕es entre carteiras?")
					FINA450()		
			EndIf
		EndIf

	//			_lBaixou := BaixaSE2(aCab[4],0,0,MV_PREF2,aCab[1],STRZERO(1,nTam),"NF ",aCab[2],aCab[3],dEmissa)		
		EndIf
		nModulo := 2
		cModulo := "COM"
	Endif
Else
	lOk2:=.T.
EndIf


If _lTitOk
	// seta solicitacao como efetivada
	dbSelectArea("ZLM")
	dbSetorder(1)
	wProcura := dbSeek(xFILIAL("ZLM")+aCab[1])
	RecLock("ZLM",.F.)
	ZLM->ZLM_STATUS := "4"
	MsUnlock()
Else
	Return .F.
EndIf


Return .T.

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ ExistTit บ Autor ณ Abrahao               บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Verifica se existe um determinado titulo no SE1 ou SE2                                                       บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Para validar a inclusao do titulo ou exclusao            			                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ ex_tabela(Nome da Tabela SE1 ou SE2) ex_prefixo(Prefixo do Titulo) ex_num(Numero do titulo					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function ExistTit(EX_TABELA,EX_PREFIXO,EX_NUM)

Local lRet  := .F.
Local cArea := GetArea()

If (EX_TABELA == "SE1")
	
	_cQuery := " SELECT"
	_cQuery += " E1_PREFIXO,E1_NUM "
	_cQuery += " FROM "+RetSqlName("SE1")+" SE1 "
	_cQuery += " WHERE D_E_L_E_T_ = ' '"
	_cQuery += " AND E1_PREFIXO = '"+EX_PREFIXO+"'"
	_cQuery += " AND E1_NUM = '"+EX_NUM+"'"
	
	If Select("TRB") <> 0
		TRB->(dbCloseArea("TRB"))
	EndIf
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(_cQuery))),'TRB',.F.,.T.)
	
	While TRB->(!Eof())
		lRet := .T.
		TRB->(dbSkip())
	EndDo
	
	TRB->(dbclosearea())
EndIf

If (EX_TABELA == "SE2")
	
	_cQuery := " SELECT"
	_cQuery += "  E2_PREFIXO,E2_NUM "
	_cQuery += " FROM "+RetSqlName("SE2")+" SE2 "
	_cQuery += " WHERE "
	_cQuery += " D_E_L_E_T_ = ' '"
	_cQuery += " AND E2_PREFIXO = '"+EX_PREFIXO+"'"
	_cQuery += " AND E2_NUM = '"+EX_NUM+"'"
	
	If Select("TRB") <> 0
		TRB->(dbCloseArea("TRB"))
	EndIf
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(_cQuery))),'TRB',.F.,.T.)
	
	While TRB->(!Eof())
		lRet := .T.
		TRB->(dbSkip())
	EndDo
	
	TRB->(dbclosearea())
EndIf

RestArea(cArea)
Return(lRet)



/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GLT_012V บ Autor ณ Abrahao               บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Valida se existe o retiro referente ao produtor                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Validar retiro                                           			                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function GLT_012V()
Local aret:=.F.
Local loj := POSICIONE("SA2",1,xFILIAL("SA2")+M->ZLM_SA2COD+M->ZLM_SA2LJ,"A2_LOJA")

If !Empty(loj) .And. !Empty(ALLTRIM(M->ZLM_SA2LJ))
	aret:=.T.
EndIf

Return aret


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ SOMAMES  บ Autor ณ Abrahao               บ Data da Criacao  ณ 03/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna array com os venctos mensais das parcelas                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Lancar os venctos de cada parcela                        			                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Data Inicial e Qtd de Parcelas									                      						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Array com venctos										                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function somaMes(dData,dParc)
Local sdata
Local firstDay := substr(dtos(dData),7,2)
Local ret:={}
Local ax:=0

For z:=1 To dParc
	aadd(ret,dData)
	sData := dtos(dData)
	ano := substr(SData,1,4)
	mes := substr(SData,5,2)
	dia := firstDay
	
	mes   := strzero(val(mes)+1,2)
	If (mes=="13")
		mes := "01"
		ax:= val(ano)
		ax++
		ano := ALLTRIM(str(ax))
	EndIf
	
	dData := stod(ano+mes+dia)
	If Empty(dData)
		dData := lastday(stod(ano+mes+"01"))
	EndIf
Next z

Return ret


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GLT_012E บ Autor ณ Abrahao               บ Data da Criacao  ณ 06/10/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Tela de efetivacao do titulo                                                                                 บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gera os titulos financeiros                              			                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Tipo de edicao (3 incluir...)    								                      						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum           										                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ                                                                                          					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function GLT_012E(nOpc)

Local bCampo   := { |nCPO| Field(nCPO) }
Private AHEADER := {}, ACOLS := {}

// cria variaveis do cabecalho e obtem valores
dbSelectArea("SX3")
dbSetorder(1)
dbSeek("ZLM")
While !Eof().And.(x3_arquivo=="ZLM")
	wVar := "M->"+x3_campo
	&wVar:= CriaVar(x3_campo)
	dbSkip()
EndDo
dbSelectArea(iTab1)

For nCntFor := 1 To FCount()
	M->&(EVAL(bCampo,nCntFor)) := FieldGet(nCntFor)
Next

If !U_GLT_012Z(iUser,"Efetivar")
	xMagHelpFis("Restricao","Voce nao permissao para efetivar o emprestimo!","Verifique as permissoes do seu usuario!")
	Return
EndIf

If M->ZLM_STATUS != "2"
	xMagHelpFis("Restricao","Emprestimo nao Aprovado ou ja Efetivado! Nao pode ser Efetivado!","Nenhuma. Uma vez aprovado ou efetivado nao ha como cancelar a operacao.")
	Return
EndIf

//OBTEM DADOS DO ACOLS
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Cria aHeader e aCols da GetDados                             ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
nUsado:=0
dbSelectArea("SX3")
dbSeek("ZLO")
While !Eof().And.(x3_arquivo=="ZLO")
	If ALLTRIM(x3_campo) $ "ZLO_ITEM#ZLO_VECTO#ZLO_VALOR"
		nUsado:=nUsado+1
		Aadd(aHeader,{ TRIM(X3Titulo()), x3_campo, x3_picture,;
		x3_tamanho, x3_decimal,x3_valid,;
		x3_usado, x3_tipo, x3_arquivo, x3_context, x3_Relacao, x3_reserv } )
		wVar  := "M->"+x3_campo
		&wVar := CriaVar(x3_campo)
	EndIf
	dbSkip()
EndDo
dbSelectArea(iTab1)


// PREENCHENDO ACOLS

If nOpc == 3 // Incluir
	aCols:={Array(nUsado+1)}
	aCols[1,nUsado+1]:=.F.
	For _ni:=1 To nUsado
		aCols[1,_ni]:=CriaVar(aHeader[_ni,2])
	Next
	aCols[1,1] := "001"
Else
	aCols:={}
	dbSelectArea("ZLO")
	dbSetorder(1)
	If (dbSeek(ZLM->ZLM_FILIAL+ZLM->ZLM_COD))
		While ZLO->ZLO_FILIAL+ZLO->ZLO_COD == xFILIAL("ZLO")+M->ZLM_COD .And. !Eof()
			AADD(aCols,Array(nUsado+1))
			For _ni:=1 To nUsado
				aCols[Len(aCols),_ni]:=If(aHeader[_ni,10] # "V",FieldGet(FieldPos(aHeader[_ni,2])),CriaVar(aHeader[_ni,2]))
			Next
			aCols[Len(aCols),nUsado+1]:=.F.
			dbSkip()
		EndDo
	Else
		aCols:={Array(nUsado+1)}
		aCols[1,nUsado+1]:=.F.
		For _ni:=1 To nUsado
			aCols[1,_ni]:=CriaVar(aHeader[_ni,2])
		Next
		aCols[1,1] := "001"
	EndIf
	
EndIf


// Mostra tela de efetivacao
@ 00,00 To 300,400 DIALOG oDlgEft TITLE OemToAnsi("Aprovacao de Emprestimos")
@ 001,001 Say " EFETIVACAO DE EMPRESTIMO - "+M->ZLM_COD
@ 002,001 Say ALLTRIM(POSICIONE("SA2",1,xFILIAL("SA2")+M->ZLM_SA2COD+M->ZLM_SA2LJ,"A2_NOME"))+" "+M->ZLM_SA2COD+"-"+M->ZLM_SA2LJ
@ 003,001 Say "Valor do Emprestimo"
@ 003,015 Say transform(M->ZLM_TOTAL,"@E 999,999,999.99")
@ 004,001 Say "Quantidade de Parcelas"
@ 004,015 Say transform(M->ZLM_PARC,"@E 999,999,999.99")
@ 005,001 Say "Taxa de Juros"
@ 005,015 Say transform(M->ZLM_JUROS,"@E 999,999,999.99")
@ 006,001 Say "Valor da Mensalidade"
@ 006,015 Say transform(M->ZLM_VLRPAR,"@E 999,999,999.99")
@ 007,001 Say "Media de RecebTo de Leite Mensal"
@ 007,015 Say transform(M->ZLM_VLRPAR,"@E 999,999,999.99")
@ 011,003 BUTTON "Efetivar" ACTION Processa({|| MsgInfo("Sem Permissao!") },"Gerando titulos...") // gera SE2
@ 011,030 BUTTON "Fechar" ACTION Close(oDlgEft)
Activate Dialog oDlgEft Centered


Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GLT_012Z บ Autor ณ Abrahao               บ Data da Criacao  ณ 06/10/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Valida se o usuario tem permissao para aprovar solicitacao                                                   บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Matricula do usuario             								                      						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum           										                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ                                                                                    					        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
//Static Function GLT_012Z(mtr,tipo)
User Function GLT_012Z(mtr,tipo)

Local cArea := GetArea()
Local bret:= .F.

_cQuery := " SELECT * "
_cQuery += " FROM "+RetSqlName("ZLU")+" ZLU "
_cQuery += " WHERE D_E_L_E_T_ = ' '"
//_cQuery += " AND ZLU_MATRIC = '"+mtr+"'" //Matricula do funcionario no RH
_cQuery += " AND ZLU_CODUSU = '"+mtr+"'" //Codigo do Usuario no configurador

If Select("TRB") <> 0
	TRB->(dbCloseArea("TRB"))
EndIf
dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(_cQuery))),'TRB',.F.,.T.)

If TRB->(!Eof())
	
	If (tipo=="Aprovar")
		If TRB->ZLU_EMPAPR == "S"
			bret:=.T.
		EndIf
	EndIf
	If (tipo=="Efetivar")
		If TRB->ZLU_EMPEFE == "S"
			bret:=.T.
		EndIf
	EndIf

	If (tipo=="JUROS")
		If TRB->ZLU_EMPJUR == "S"
			bret:=.T.
		EndIf
	EndIf
EndIf

TRB->(dbclosearea())


RestArea(cArea)
Return bret
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GLT_012x บ Autor ณ Abrahao               บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Avaliacao/Efetivacao multipla das solicitacoes                                                               บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Tipo (1=avaliacao,2=efetivacao)									                      						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function GLT_012X(cTpAplic)

Local cCadastro := ""
Local cLabel    := ""
Local cVarQ   	:= "  "
Local nOpcA     := 0
Local x         := 0
Local lMarca    := .F.
Local oOk	  	:= LoadBitmap( GetResources(), "LBOK" )
Local oNo	  	:= LoadBitmap( GetResources(), "LBNO" )
Local oF3
Local oDlg
Local oGet01
Local aArea := GetArea()
Private cPerg := "AGLT012   "
Private aDados    := {}

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Quando o usuario tiver acesso a aprovacao, automaticamente tambem ณ
//ณ tem acesso a Reprovacao.                                          ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If !U_GLT_012Z(__CUSERID,Iif(cTpAplic=="2","Efetivar","Aprovar"))
	xMagHelpFis("Atencao","Seu usuario nao possui permissao para efetuar essa rotina!","Solicite essa permissao ao administrador do sistema!")
	Return
EndIf

ValidPerg()

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Preenche os parametros da rotina, para evitar que o usuario tenha que fazer isso.    ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
dbSelectArea("SX1")
dbSetOrder(1)
dbSeek(cPerg)

While SX1->(!Eof()) .And. ALLTRIM(SX1->X1_GRUPO) == ALLTRIM(cPerg)
	
	If SX1->X1_ORDEM == "01"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := ZLM->ZLM_SETOR //Setor
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "02"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := DTOC(ZLM->ZLM_DATA) //Da Data
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "03"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := DTOC(ZLM->ZLM_DATA) //Ate Data
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "04"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := ZLM->ZLM_COD //Do Nro
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "05"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := ZLM->ZLM_COD //Ao Nro
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "06"
		RecLock("SX1",.F.)
		//SX1->X1_PRESEL := If(ZLM->ZLM_TIPO=="E",1,2) //Tipo: Emprestimo/Adiantamento
		SX1->X1_PRESEL := If(ZLM->ZLM_TIPO=="E",1,If(ZLM->ZLM_TIPO=="A",2,3)) //Tipo: Emprestimo/Adiantamento/Cota Capital
		MsUnLock()
	EndIf
	dbSkip()
EndDo

RestArea(aArea) 

If !Pergunte(cPerg)
	Return
EndIf

dbSelectArea("ZLM")
dbSetorder(1)
dbGoTop()

Processa({|| GetaDados(cTpAplic) })

If len(aDados)==0
	xMagHelpFis("Mensagem","Nao foram encontrados solicita็๒es aprovadas!","ษ preciso que existam solicita็๕es "+Iif(cTpAplic=="1","em aberto","aprovadas")+" para essa rotina!")
	Return
EndIf

aSort(aDados,,,{|x,y| x[3] < y[3] })

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Montando o list box          ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
DEFINE MSDIALOG oDlg TITLE "Emprestimos - "+Iif(cTpAplic=="1","Aprovar",If(cTpAplic=="2","Efetivar","Reprovar")) From 0,0 To 25,95 OF oMainWnd
@ 005,005 To 150,365 LABEL cLabel Pixel OF oDlg

@ 010,010 LISTBOX oF3	VAR cVarQ Fields HEADER "",OemToAnsi("Solicitacao"),OemToAnsi("Setor"),OemToAnsi("Nome"),OemToAnsi("Valor Total"),OemToAnsi("Parcelas"),OemToAnsi("Juros"),OemToAnsi("Vlr. Parcela"),OemToAnsi("Volume(M้dio)"),OemToAnsi("REnda Liq.(M้dia)") ;
COLSIZES 12,25,15,25,25,25,25,25,25,25 ;
SIZE 350,135 ON DBLCLICK (aDados:=F3Troca(oF3:nAt,aDados,oGet01,1,1),oF3:Refresh(),rCalc(aDados,5),oVlrTotal:Refresh()) Pixel Of oDlg

oF3:SetArray(aDados)
oF3:bLine := { || {If(aDados[oF3:nAt,1],oOk,oNo),aDados[oF3:nAt,2],aDados[oF3:nAt,3],aDados[oF3:nAt,4],aDados[oF3:nAt,5],aDados[oF3:nAt,6],aDados[oF3:nAt,7],aDados[oF3:nAt,8],aDados[oF3:nAt,9],aDados[oF3:nAt,10]}}

DEFINE SBUTTON FROM 160,010 TYPE 01 ACTION Processa( {|| nOpca := 1,U_Grv_Apr(aDados,cTpAplic),oDlg:End() } ) ENABLE OF oDlg
DEFINE SBUTTON FROM 160,050 TYPE 02 ACTION (nOpca := 0,oDlg:End()) ENABLE OF oDlg
@160,090 Button OemToAnsi("Visualizar") Size 50,11 Action {|| openSol(oF3:nAt,aDados) } OF oDlg PIXEL
@160,150 Button OemToAnsi("Imprimir")   Size 50,11 Action {|| U_RGLT030(aDados) } OF oDlg PIXEL
@162,280 SAY "Valor Total:" Pixel OF oDlg
@160,310 MSGET oVlrTotal var nVlrTotal Picture "@E 99,999,999.99" when .F. Size 50,10 OF oDlg PIXEL

// Calcula total dos ja marcados
rCalc(aDados,5)
oVlrTotal:Refresh()

ACTIVATE MSDIALOG oDlg CENTERED

Return
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ Grv_Apr  บ Autor ณ Abrahao               บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Grava avaliacao/efetivacao multpla                                                                           บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function Grv_Apr(aGrv,ctp)

Local aTCab:={}
Local aTitens:={}
Local lok := .T.

ProcRegua(len(aGrv))

For y:=1 To Len(aGrv)
	
	IncProc("Gerando Titulo "+aGrv[y,2])
	
	Begin Transaction
	
	If aGrv[y,1] == .T.
		dbSelectArea("ZLM")
		dbSetorder(1)
		dbGoTop()
		wProcura := dbSeek(xFILIAL("ZLM")+aGrv[y,2])
		If wProcura
			RecLock("ZLM",.F.)
			ZLM->ZLM_DTAPRO := dDataBase
			If ctp == "1" // aprovar
				ZLM->ZLM_STATUS := "2"
				ZLM->ZLM_USERAP := __CUSERID //U_UCFG001(1)
				ZLM->ZLM_NUSEAP := AllTrim(PswRet()[1][4])//U_GetNUser(U_UCFG001(1))
//			MsUnlock()
			EndIf
			If ctp == "2" // efetivar
				aTcab := {ZLM->ZLM_COD,ZLM->ZLM_SA2COD,ZLM->ZLM_SA2LJ,ZLM->ZLM_TOTAL,ZLM->ZLM_DTLIB,ZLM->ZLM_TIPO,ZLM->ZLM_DATA,ZLM->ZLM_VENCTO,ZLM->ZLM_OBS}
				aTitens:={}
				dbSelectArea("ZLO")
				dbSetorder(1)
				dbSeek(xFILIAL("ZLM")+ZLM->ZLM_COD)
				While xFILIAL("ZLM")+ZLM->ZLM_COD==xFILIAL("ZLO")+ZLO->ZLO_COD .And. !Eof()
					aAdd(aTitens,{ZLO->ZLO_VECTO,ZLO->ZLO_VALOR})
					dbSkip()
				EndDo
				dbclosearea("ZLO")
				
				lOk := .T.
				lOk := IncSE2(aTCab,aTItens)
				
			EndIf
			If ctp == "3" // Reprovar
				ZLM->ZLM_STATUS := "3"
				ZLM->ZLM_USERAP := __CUSERID //U_UCFG001(1)
				ZLM->ZLM_NUSEAP := AllTrim(PswRet()[1][4]) //U_GetNUser(U_UCFG001(1))
			EndIf
			MsUnlock()
			dbclosearea("ZLM")
		EndIf
	EndIf
	
	If !lOk
		DisarmTransaction()
	EndIf
	
	End Transaction
	
Next y

Return(ZLM->ZLM_STATUS)

/*/
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณ F3Troca  ณ Autor ณ Microsiga             ณ Data ณ 00/00/00 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ Tela para selecao da TES.                                  ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณParametrosณ ExpN1 - Posicao do Array.                                  ณฑฑ
ฑฑณ          ณ ExpA1 - Array com todas as TES.                            ณฑฑ
ฑฑณ          ณ ExpO1 - ObjeTo para Refresh.                               ณฑฑ
ฑฑณ          ณ ExpN2 - Opcao:                                             ณฑฑ
ฑฑณ          ณ               1=Marca/Desmarca.                            ณฑฑ
ฑฑณ          ณ               2=Marca Todos/Desmarca Todos.                ณฑฑ
ฑฑณ          ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณUso       ณ MostraF3                                                   ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
/*/
Static Function F3Troca(nIt,aArray,oGet,nOpc,nPos)

Local i      := 0
Local lMarca := If(!aArray[nIt,nPos],.T.,.F.)

If nOpc == 1 //Marca/Desmarca
	aArray[nIt,nPos] := !aArray[nIt,nPos]
Else //Marca Todos/Desmarca Todos
	For i:=1 To Len(aArray)
		aArray[i,nPos] := lMarca
	Next i
EndIf

If oGet != Nil
	oGet:Refresh()
EndIf

Return aArray

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ rCalc    บ Autor ณ TOTVS              บ Data ณ  17/12/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Abre solicitacao para visualizacao.                        บฑฑ
ฑฑบ          ณ Rotina chamada pela avaliacao e efetivacao.                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function OpenSol(nItem,aLista)

Local nSolic

nSolic := aLista[nItem,2]

dbSelectArea("ZLM")
dbSetorder(1)
If dbSeek(xFILIAL("ZLM")+nSolic)
	// Tela de visualizacao do Emprestimo
	U_GLT_012(2)
EndIf

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ rCalc    บ Autor ณ TOTVS              บ Data ณ  17/12/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function rCalc(aLista,nPosTotal)

nVlrTotal:=0
For x:=1 To Len(aLista)
	If aLista[x,1] == .T.
		nVlrTotal += aLista[x,nPosTotal]
	EndIf
Next x

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ESTEMP   บ Autor ณ TOTVS              บ Data ณ  17/12/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function ESTEMP()

Local MV_PREF1,MV_TIPO1,MV_NATU1
Local MV_PREF2,MV_TIPO2,MV_NATU2
Local MV_EVENT := ""
Local nParcelas:=0
Local lok := .T.

If ZLM->ZLM_STATUS != "4"
	xMagHelpFis("Estorno","Essa solicitacao nao pode ser Estornada por nao ter sido Efetivada!","Selecione uma solicitacao efetivada.")
	Return
EndIf

// -----------------------------------------
// ObtEndo Parametos dos EMPRESTIMOS
// -----------------------------------------
If ZLM->ZLM_TIPO == "E"
	MV_EVENT := ALLTRIM(GetMv("LT_EVTEMP"))
	DbSelectArea("ZL8")
	DbSetOrder(1)
	If DbSeek(xFilial("ZL8")+MV_EVENT)
		MV_PREF1 := MV_PREF2 := ZL8->ZL8_PREFIX
		MV_TIPO1 := ALLTRIM(GetMv("LT_EMPTP1"))
		MV_TIPO2 := ALLTRIM(GetMv("LT_EMPTP2"))
		If LEFT(ZLM->ZLM_SA2COD,1) $ "P"
			MV_NATU1 := ZL8->ZL8_NATPRD
			MV_NATU2 := ZL8->ZL8_NATPRD
		Else
			MV_NATU1 := ZL8->ZL8_NATFRT
			MV_NATU2 := ZL8->ZL8_NATFRT
		EndIf
	Else
		xMagHelpFis("Erro no Titulo","Nใo foi encontrado o evento de empr้stimo: "+MV_EVENT+" Os titulos nใo serแ incluidos no financeiro.",;
		"Verifique o conteudo do parโmetro LT_EVTEMP no configurador.")		
		DisarmTransaction()
		Return
	EndIf
EndIf

// -----------------------------------
// ObtEndo Parametos dos ADIANTAMENTOS
// -----------------------------------
If ZLM->ZLM_TIPO == "A"
	MV_EVENT := ALLTRIM(GetMv("LT_EVTADT"))
	DbSelectArea("ZL8")
	DbSetOrder(1)
	If DbSeek(xFilial("ZL8")+MV_EVENT)
		MV_PREF1 := MV_PREF2 := ZL8->ZL8_PREFIX
		MV_TIPO1 := "NF "
		MV_TIPO2 := "NF "
		If LEFT(ZLM->ZLM_SA2COD,1) $ "P"
			MV_NATU1 := ZL8->ZL8_NATPRD
			MV_NATU2 := ZL8->ZL8_NATPRD
		Else
			MV_NATU1 := ZL8->ZL8_NATFRT
			MV_NATU2 := ZL8->ZL8_NATFRT
		EndIf
	Else
		xMagHelpFis("Erro no Titulo","Nใo foi encontrado o evento de empr้stimo: "+MV_EVENT+" Os titulos nใo serแ incluidos no financeiro.",;
		"Verifique o conteudo do parโmetro LT_EVTEMP no configurador.")		
		DisarmTransaction()
		Return
	EndIf
EndIf

// -----------------------------------
// ObtEndo Parametos dos RENEGOCIAวAO
// -----------------------------------
If ZLM->ZLM_TIPO == "R"
	MV_EVENT := ALLTRIM(GetMv("LT_EVTREN"))
	DbSelectArea("ZL8")
	DbSetOrder(1)
	If DbSeek(xFilial("ZL8")+MV_EVENT)
		MV_PREF1 := MV_PREF2 := ZL8->ZL8_PREFIX
		MV_TIPO1 := "NF "
		MV_TIPO2 := "NF "
		If LEFT(ZLM->ZLM_SA2COD,1) $ "P"
			MV_NATU1 := ZL8->ZL8_NATPRD
			MV_NATU2 := ZL8->ZL8_NATPRD
		Else
			MV_NATU1 := ZL8->ZL8_NATFRT
			MV_NATU2 := ZL8->ZL8_NATFRT
		EndIf
	Else
		xMagHelpFis("Erro no Titulo","Nใo foi encontrado o evento de empr้stimo: "+MV_EVENT+" Os titulos nใo serแ incluidos no financeiro.",;
		"Verifique o conteudo do parโmetro LT_EVTREN no configurador.")		
		DisarmTransaction()
		Return
	EndIf
EndIf



// -----------------------------------------
// Obtendo Parametos das FINANCIAMENTOS
// -----------------------------------------
/*
If ZLM->ZLM_TIPO == "N"
MV_PREF1 := ALLTRIM(GetMv("LT_ANTPX1"))
MV_PREF2 := ALLTRIM(GetMv("LT_ANTPX2"))
MV_TIPO1 := ALLTRIM(GetMv("LT_ANTTP1"))
MV_TIPO2 := ALLTRIM(GetMv("LT_ANTTP2"))
If LEFT(ZLM->ZLM_SA2COD,1) $ "C/T"
MV_NATU1 := ALLTRIM(GetMv("LT_ANTNT1"))
MV_NATU2 := ALLTRIM(GetMv("LT_ANTNT2"))
Else
MV_NATU1 := ALLTRIM(GetMv("LT_ANTNT3"))
MV_NATU2 := ALLTRIM(GetMv("LT_ANTNT4"))
EndIf
EndIf
*/

// -----------------------------------------
// Obtendo Parametos das COTAS DE CAPITAL
// -----------------------------------------

If ZLM->ZLM_TIPO == "C" .AND. LEFT(ZLM->ZLM_SA2COD,1) $ "C"
	MV_PREF1 := ALLTRIM(GetMv("LT_COTPX1"))
	MV_TIPO1 := ALLTRIM(GetMv("LT_COTTP1"))
	MV_NATU1 := ALLTRIM(GetMv("LT_COTNT1"))
EndIf
If !MsgYesNo("Essa rotina irแ cancelar a efetivacao dessa solicitacao. Deseja continuar?")
	Return
EndIf

Begin Transaction

// Deleta o NF
If ZLM->ZLM_TIPO <> 'C'
	If !dElse2(MV_PREF2,ZLM->ZLM_COD,STRZERO(1,TamSx3("E2_PARCELA")[1]),"NF ",ZLM->ZLM_SA2COD,ZLM->ZLM_SA2LJ,MV_NATU2)
		lok := .F.
	EndIf
Else
	lok := .T.
Endif

RecLock("ZLM",.F.)
ZLM->ZLM_STATUS = "1"
MsUnlock()

If lok
	// Deleta as Parcelas
	For nParcelas:=1 To int(ZLM->ZLM_PARC)
	//	If !dElse2(MV_PREF1,ZLM->ZLM_COD,STRZERO(nParcelas,TamSx3("E2_PARCELA")[1]),"NDF",ZLM->ZLM_SA2COD,ZLM->ZLM_SA2LJ,MV_NATU1)
		If !U_ExcluSE1(xFilial("SE1"),MV_PREF1,ZLM->ZLM_COD,STRZERO(nParcelas,TamSx3("E2_PARCELA")[1]),"NF ",ZLM->ZLM_SA2COD,ZLM->ZLM_SA2LJ)
			lok:=.F.
		EndIf
	Next nParcelas
EndIf
	
If !lok
	xMagHelpFis("Erro no Titulo","Falha ao gravar os titulos no financeiro!","Comunique ao Suporte!")
	DisarmTransaction()
EndIf

End Transaction
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ dElse2   บ Autor ณ TOTVS              บ Data ณ  17/12/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function dElse2(cpPrefixo,cpNum,cpParcela,cpTipo,cpForn,cpLoja,cpNatureza)

Local _aAutoSE2:={}
Local lOk:=.T.
Private lMsErroAuTo := .F.

AAdd( _aAutoSE2, { "E2_PREFIXO"	, cpPrefixo, Nil } )
AAdd( _aAutoSE2, { "E2_NUM"		, cpNum, nil } )
AAdd( _aAutoSE2, { "E2_PARCELA"	, cpParcela, nil } )
AAdd( _aAutoSE2, { "E2_TIPO"	, cpTipo, nil } )
AAdd( _aAutoSE2, { "E2_NATUREZ"	, cpNatureza, nil } )
AAdd( _aAutoSE2, { "E2_FORNECE"	, cpForn, nil } )
AAdd( _aAutoSE2, { "E2_LOJA"	, cpLoja, nil } )

nModulo := 6
cModulo := "FIN"

dbSelectArea("SE2")
dbSetorder(1)
dbGoTop()
dbSeek(xFILIAL("SE2")+cpPrefixo+cpNum+cpParcela+cpTipo+cpForn+cpLoja)
If Found()
	_aAutoSE2:= FWVetByDic( _aAutoSE2, 'SE2' )	//Ordena o array de acordo com o dicionario de dados
	Pergunte("FIN050",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto		
	MSExecAuto({|x,y,z| Fina050(x,y,z)},_aAutoSE2,,5)
	Pergunte("AGLT012",.f.) //Recupera os parใmetros da rotina.

	If lMsErroAuto
		lOk := .F.
		xMagHelpFis("Erro","Erro ao excluir o Titulo: "+cpPrefixo+cpNum+"-"+cpForn+", portanTo os lan็amentos nใo podem ser excluํdos","Comunique ao Suporte!!!")
		MostraErro()
	EndIf
Else
	xMagHelpFis("Erro - Exclusao ","O Titulo nao foi encontrado!","Comunique ao Suporte! Indice:"+cpPrefixo+cpNum+cpParcela+cpTipo+cpForn+cpLoja)
	lOk := .F.
EndIf

nModulo := 2
cModulo := "COM"

Return lOk


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ GetaDadosบ Autor ณ TOTVS              บ Data ณ  17/12/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GetaDados(cTpAplic)

Local nQtdReg
Local cXtipo := ""

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Quando se trata de Reprovacao, muda-se o conteudo da variavel ณ
//ณ para que sejam listados todos os emprestimos aprovados e em   ณ
//ณ aberto.                                                       ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If cTpAplic == "3"
	cTpAplic := "1/2"
EndIf

If MV_PAR06 == 1 // Emprestimo
	cXtipo := "E"
	//ElseIf MV_PAR06 == 2 // Financiamento
	//	cXtipo := "N"
Elseif MV_PAR06 == 2
	cXtipo := "A" //Adiantamento
Else
	cXtipo := "R" //Renegocia็ใo
EndIf

Count To nQtdReg

ProcRegua(nQtdReg)

ZLM->(dbGoTop())

While ZLM->(!Eof())
	IncProc()
	If ZLM->ZLM_STATUS $ cTpAplic // 1-Em aberto 2-Aprovada
		If ZLM->ZLM_SETOR == MV_PAR01 .And. ZLM->ZLM_DATA >= MV_PAR02 .And. ZLM->ZLM_DATA <= MV_PAR03 ;
			.And. ZLM->ZLM_COD >= MV_PAR04 .And. ZLM->ZLM_COD <= MV_PAR05 ;
			.And. ZLM->ZLM_TIPO == cXtipo
			nProducao := U_GETMEDVOL(ZLM_SA2COD,ZLM_SA2LJ)
			nFatura   := U_GETMEDFAT(ZLM_SA2COD,ZLM_SA2LJ)
			aAdd(aDados,{ Iif( (nFatura*0.5)>ZLM_VLRPAR , .T. , .F. ) ,;  // 1
			ZLM_COD,;                                               // 2
			ALLTRIM(POSICIONE("ZL2",1,xFILIAL("ZL2")+ZLM_SETOR,"ZL2_DESCRI")),; // 3
			POSICIONE("SA2",1,xFILIAL("SA2")+ZLM_SA2COD+ZLM_SA2LJ,"A2_NOME"),; // 4
			ZLM_TOTAL,ZLM_PARC,ZLM_JUROS,ZLM_VLRPAR,nProducao,nFatura})
		EndIf
	EndIf
	ZLM->(dbSkip())
EndDo

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ GetSetor บ Autor ณ TOTVS              บ Data ณ  17/12/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Obtem Setor do Fornecedor.                                 บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GetSetor(cpFornece,cpLoja)

Local cRet:=""
Local aArea:=GetArea()

dbSelectArea("SA2")
dbSetorder(1)
If dbSeek(xFILIAL("SA2")+cpFornece+cpLoja)
	
	dbSelectArea("ZL3")
	dbSetorder(1)
	If dbSeek(xFILIAL("ZL3")+SA2->A2_L_LI_RO)
		cRet:=ZL3->ZL3_SETOR
	EndIf
EndIf

RestArea(aArea)
Return(cRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ValidPergบ Autor ณ TOTVS              บ Data ณ  17/12/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ValidPerg()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

//Do Setor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo do Setor')
Aadd( aHelpPor, 'que deseja filtrar.      ')
u_xPutSX1(cPerg,"01","Setor   "," "," ","mv_ch1","C",6,0,0,"G",'U_ValSetPar()',"ZL2_01","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Data
aHelpPor := {}
Aadd( aHelpPor, 'Informe a data inicial')
Aadd( aHelpPor, 'da solcitacao que deseja filtrar.')
u_xPutSX1(cPerg,"02","Da Data "," "," ","mv_ch2","D",8,0,0,"G",'',"","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate Data
aHelpPor := {}
Aadd( aHelpPor, 'Informe a data final')
Aadd( aHelpPor, 'da solicitacao que deseja filtrar.')
u_xPutSX1(cPerg,"03","Ate Data "," "," ","mv_ch3","D",8,0,0,"G",'',"","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Codigo
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo Inicial ')
Aadd( aHelpPor, 'da Solicitacao')
u_xPutSX1(cPerg,"04","Do Numero  "," "," ","mv_ch4","C",9,0,0,"G",'',"","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ao Codigo
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo Inicial ')
Aadd( aHelpPor, 'da Solicitacao')
u_xPutSX1(cPerg,"05","Ao Numero  "," "," ","mv_ch5","C",9,0,0,"G",'',"","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Tipo
aHelpPor := {}
Aadd( aHelpPor, 'Informe o Tipo de Solicitacao:')
Aadd( aHelpPor, '1-Emprestimo')
Aadd( aHelpPor, '2-Adiantamento')
Aadd( aHelpPor, '3-Cota Capital')
u_xPutSX1(cPerg,"06","Tipo  "," "," ","mv_ch06","N",1,0,0,"C","","","","","MV_PAR06","Emprestimo","Emprestimo","Emprestimo","","Adiantamento","Adiantamento","Adiantamento","Cota Capital","Cota Capital","Cota Capital","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return

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
Local _cHist	:= "EMPREST."
Local _aBanco	:= {"","","",""}
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

_aBanco := BuscaCC()
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
		AADD( _aTitulo, { "AUTHIST"   	, _cHist+AllTrim(SA2->A2_NREDUZ)	, Nil } )	// 13
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
Local cPerg := "AGLT012BC"	

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

Local cPerg := "AGLT012BC"	
Local aHelpPor := {}

Aadd( aHelpPor, 'Informe o dados bancarios para   ')
Aadd( aHelpPor, 'gera็ใo do cheque a pagar ao     ')
Aadd( aHelpPor, 'cooperado.                       ')


u_xPutSX1(cPerg,"01","Banco"			,"Banco"	   			,"Banco"		  		,"mv_ch1","C",03,0,1,"G","","SA6","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,{},{})
u_xPutSX1(cPerg,"02","Agencia"			,"Agencia"      		,"Agencia"     	  		,"mv_ch2","C",05,0,1,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,{},{})
u_xPutSX1(cPerg,"03","Conta"			,"Conta" 				,"Conta"   	   	   		,"mv_ch3","C",10,0,1,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,{},{})

RETURN

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




/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGLT_012NP บAutor  ณMicrosiga           บ Data ณ  03/01/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GLT_012NP()

Local aArea := GetArea()
Local _cPref := ""
Local _cNum := ZLM->ZLM_COD

If ZLM->ZLM_TIPO == "E"
	_cPref := "GLE"
Elseif ZLM->ZLM_TIPO == "A"
	_cPref := "GLA"
Elseif ZLM->ZLM_TIPO == "R"
	_cPref := "GLR"
ENDiF

Processa({|| U_RFIN002(ZLM->ZLM_SA2COD,_cNum,_cPref) }, "Aguarde...", "Gerando duplicata...",.T.)

RestArea(aArea)

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGLT12_VENCบAutor  ณGuilherme Fran็a    บ Data ณ  08/09/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณGatilho no campo ZLM_SA2COD que retorna o vencimento de acorบฑฑ
ฑฑบ          ณdo com o tipo de associado escolhido.                       บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function GLT12_VENC()

Local _nDiaVcto  := Alltrim(GetMV("LT_VENCTO")) //Parametro que indica o dia de vencimento dos titulos do produtor
Local _nDiaVctof  := Alltrim(str(GetMV("LT_VENFUNC")))
Local _nDiaVctot  := Alltrim(str(GetMV("LT_VENTRAN")))
Local _nDia := "20"

_dVencto := DDataBase

If Left(M->ZLM_SA2COD,1) == "C"
	_nDia := _nDiaVcto
ElseIf Left(M->ZLM_SA2COD,1) == "G"
		_nDia := _nDiaVctot
ElseIf Left(M->ZLM_SA2COD,1) == "E"
	_nDia := _nDiaVctof
EndIf
	
If	month(_dVencto)==12
	_dVencto := _nDia+"/01/"+Str(Year(_dVencto)+1)
Else
	_dVencto := _nDia+"/"+StrZero(month(_dVencto)+1,2)+"/"+Str(Year(_dVencto))
EndIf
M->ZLM_VENCTO := CtoD(_dVencto)

Return(CtoD(_dVencto))
