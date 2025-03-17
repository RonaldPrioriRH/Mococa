#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "SHELL.CH"

#DEFINE LINHAS 999
#DEFINE _ENTER CHR(13)+CHR(10)

//Constantes
#Define STR_PULA		Chr(13)+Chr(10)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ AGLT003  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 15/09/2008                						บฑฑ                
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Rotina desenvolvida para possibilitar o cadastramento da Recpecao de Leite.                                  บฑฑ
ฑฑบ          ณ                     												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Cadastro de Recpecao de Leite   						                                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
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

User Function AGLT003()

Local aQuery     := {}
Local aSetor	 := {}
Local cCondicao  := ""
Local cExprFilTop := ""
Local bFiltraBrw := {|| Nil }

Private nSalvRec 	:= 0
Private bVisual 	:= {|| Glt003Upd('ZLD',Recno(),2)  }
Private bInclui 	:= {|| Glt003Upd('ZLD',Recno(),3)  }
Private bAltera 	:= {|| Glt003Upd('ZLD',Recno(),4)  }
Private bExclui 	:= {|| Glt003Upd('ZLD',Recno(),5)  }
Private bDesvRota := {|| DesvRota()}
Private bLegenda	:= {|| legenda()  }
Private bRelCupom := {|| U_RGLT008()}
Private bConsdesc := {|| ConsDesc()}
Private cLINROT     := ""
Private aValida		:= {"VldSet(cSetor)","VldVeicul(cVeicul)","VldLinRot(cLinRot,nOpc)"}
Private cCadastro 	:= "Recep็ใo de Leite"
Private aRotina     := MenuDef()
Private cAlias      := "ZLD"
Private aCores      := GetCores()
Private nVlrMix     := 0
Private _aXSetor	:={}
Private cArqImp     := ""
Private _lGeraSD3 	:= SuperGetMv("LT_GERASD3",,.F.) //Parametro indica se serแ gerado movimento SD3 no ticket.
Private _lPopula	:= SuperGetMv("LT_USAROTA",,.T.) // Parametro indica se ao preencher a rota, o grid serแ preenchido com os produtores da mesma.
Private _lDigLote	:= SuperGetMv("LT_DIGLOTE",,.T.) // Informe se o lote serแ digitado ou usara o codigo do ticket
Private _lUsabalanca := SuperGetMV("LT_USABALA",,.T.) //Indica se a unidade utiliza balan็a para preencher o total do veiculo - MOCOCA
Private lHabilita := SuperGetMv("MV_XATIVCO", .F. ,.F.) //

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Obtem Setores que podem ser acessados                ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
cCondicao := U_FilSetor("ZLD_SETOR")


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Cria filtro de data na tela de recep็ใo do leite.    ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
/* 
AjustaSX1("AGLT003FIL")
If Pergunte("AGLT003FIL",.T.)
	//Filtro de na mbrowse utilizando SQL
	cExprFilTop := " ZLD_DTCOLE BETWEEN '"+DTOS(MV_PAR01)+"' AND  '"+DTOS(MV_PAR02)+"' "
EndIf
*/

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Seta filtro dos Setores                              ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
bFiltraBrw := {|| FilBrowse(cAlias,@aQuery,@cCondicao) }
Eval(bFiltraBrw)

dbSelectArea("ZLD")
nSalvRec := ZLD->(Recno())
mBrowse( 6, 1,22,75,cAlias,,,,,,aCores,,,,,,,,cExprFilTop)
//mBrowse(6, 1,22,75,cAlias,,,,,, <aColors>, <cTopFun>, <cBotFun>, <nPar14>, <bInitBloc>, <lNoMnuFilter>, <lSeeAll>, <lChgAll>, <cExprFilTop>, <nInterval>, <uPar22>, <uPar23> )

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Finaliza filtro                                      ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
EndFilBrw(cAlias,aQuery)

dbSelectArea("ZLD")
dbGoTo(nSalvRec)

Return()

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณGlt003Upd บ Autor ณ Jeovane               บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para dar manutencao - Inclusao/Alteracao/Exclusao da tabela ZLD - Recepcao de Leite             บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
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
ฑฑบAbrahao   ณ08/10/08  ณ Adicinar novos campos e ajustar campos dos itens ณ Monis                            ณLeite        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function Glt003Upd(cAlias,nReg,nOpc)

Local cTitulo   := "RECEPวรO DE LEITE"
Local aObjects 	:={},aPosObj  :={}
Local aSize    	:=MsAdvSize()
Local aInfo    	:={aSize[1],aSize[2],aSize[3],aSize[4],3,3}
Local aNoFields	:= {"ZLD_TICKET","ZLD_DTLANC","ZLD_FRETIS","ZLD_LJFRET","ZLD_VEICUL","ZLD_MOTOR","ZLD_KM","ZLD_KMTERR","ZLD_SETOR","ZLD_CODREC","ZLD_PRODUT","ZLD_LOCAL","ZLD_TOTREC","ZLD_STATUS","ZLD_USER","ZLD_TOTBOM","ZLD_TOTACI","ZLD_TOTAL","ZLD_DTCOLE","ZLD_VFRELT","ZLD_VFREPR","ZLD_TQ_LT","ZLD_FILENT","ZLD_ALI_WT","ZLD_REC_WT","ZLD_TEMPCA","ZLD_DTREC","ZLD_HRREC","ZLD_ROTCAB","ZLD_DESCAB","ZLD_TRIBUT","ZLD_IMPORT"}
Local _nSayLn, _nGetLn

//Local aYesFields:= {"ZLD_ITEM","ZLD_RETIRO","ZLD_RETILJ","ZLD_PRODUT","ZLD_GRPRC","ZLD_LINROT","ZLD_VERSAO","ZLD_DESLIN","ZLD_LOCAL","ZLD_QTDH2O","ZLD_QTDBOM","ZLD_DCRRET","ZLD_IMPORT","ZLD_HORA","ZLD_TEMP","ZLD_REGUA","ZLD_COLANA","ZLD_DTREC","ZLD_HORDES","ZLD_TRIBUT","ZLD_DESH2O"}
Local aYesFields:= {"ZLD_ITEM","ZLD_RETIRO","ZLD_RETILJ","ZLD_PRODUT","ZLD_GRPRC","ZLD_LINROT","ZLD_VERSAO","ZLD_DESLIN","ZLD_LOCAL","ZLD_QTDH2O","ZLD_QTDBOM","ZLD_DCRRET","ZLD_IMPORT","ZLD_HORA","ZLD_TEMP","ZLD_REGUA","ZLD_DESH2O"}
Local nOffSet   := 0

Local _lTransac := .T.

Local _lReproc  := .F.

Local _cAliasVld:= ""

Local nSaveSX8  := GetSX8Len()

Private oDlg
Private oLteBom
Private oLteAci
Private oSetor
Private oLinRota
Private oDif
Private oTotCodRec
Private oTicket
Private oKm
Private oKmTerr
Private oDes
Private cUser	    := CriaVar("ZLD_USER")
Private cCodRec 	:= If(nOpc==3,Space(TamSX3("ZLD_CODREC")[1]),ZLD->ZLD_CODREC) //Codigo Recebimento
Private _cBkCodRec  := cCodRec
Private cTicket		:= If(nOpc==3,Space(6),ZLD->ZLD_TICKET) //Codigo Entrada
Private dData		:= If(nOpc==3,Date(),ZLD->ZLD_DTLANC) //Data Entrada
Private cSetor		:= If(nOpc==3,criaVar("ZLD_SETOR"),ZLD->ZLD_SETOR)  //Space(TamSX3("ZLD_SETOR")[1])
Private cDescSet	:= If(nOpc==3,Space(20),Substr(POSICIONE("ZL2",1,xFILIAL("ZL2")+cSetor,"ZL2_DESCRI"),1,20))
Private cFretist	:= If(nOpc==3,Space(TamSX3("ZLD_FRETIS")[1]),ZLD->ZLD_FRETIS)
Private cLjFret		:= If(nOpc==3,Space(TamSX3("ZLD_LJFRET")[1]),ZLD->ZLD_LJFRET)
Private cDescFret	:= If(nOpc==3,Space(TamSX3("A2_NOME")[1]-4),Substr(POSICIONE("SA2",1,xFILIAL("SA2")+cFretist+cLjFret,"A2_NOME"),1,TamSX3("A2_NOME")[1]-4))
Private cVeicul		:= If(nOpc==3,Space(TamSX3("ZLD_VEICUL")[1]),ZLD->ZLD_VEICUL)
Private cMotor		:= If(nOpc==3,Space(TamSX3("ZLD_MOTOR")[1]),ZLD->ZLD_MOTOR)
Private cDescMot	:= If(nOpc==3,Space(TamSX3("ZL0_NOME")[1]-20),LEFT(POSICIONE("ZL0",1,xFILIAL("ZL0")+cMotor,"ZL0_NOME"),20))
Private cPlacaVeic	:= If(nOpc==3,Space(TamSX3("ZL4_PLACA")[1]),POSICIONE("ZL4",1,xFILIAL("ZL4")+ZLD->ZLD_VEICUL,"ZL4_PLACA"))
Private cRotCab		:= If(nOpc==3,Space(TamSX3("ZLD_ROTCAB")[1]),ZLD->ZLD_ROTCAB)
Private cDescRot 	:= If(nOpc==3,Space(TamSX3("ZLD_DESCAB")[1]),ZLD->ZLD_DESCAB)
Private _cLoteD3	:= If(nOpc==3,Space(TamSX3("ZLD_LOTE")[1]),ZLD->ZLD_LOTE) //Lote utilizado no estoque SD3
//Private cDtRec 		:= If(nOpc==3,Date(),ZLD->ZLD_DTREC)
Private cHrRec 		:= If(nOpc==3,Space(TamSX3("ZLD_HORDES")[1]),ZLD->ZLD_HORDES)
//Private cHrRec 		:= If(nOpc==3,SUBSTR(TIME(),1,5),ZLD->ZLD_HRREC)
Private _aMedVaz    := {}

Private nTempCamin  := If(nOpc==3,0,ZLD->ZLD_TEMPCA)

Private nTotKM		:= If(nOpc==3,0,ZLD->ZLD_KM)
Private nTotKMT		:= If(nOpc==3,0,ZLD->ZLD_KMTERR)

Private nLeiteBom 	:= 0
Private nLeiteAci 	:= 0
Private dDtColeta	:= If(nOpc==3,dDatabase,ZLD->ZLD_DTCOLE) //Data DA COLETA
Private nTotBom		:= If(nOpc==3,0,ZLD->ZLD_TOTBOM)
Private nTotAci		:= If(nOpc==3,0,ZLD->ZLD_TOTACI)
Private cTktPeso := If(nOpc==3,Space(TamSX3("ZLD_TKPESO")[1]),ZLD->ZLD_TKPESO) //TICKET DE PESAGEM	

Private nLtDIf      := 0
Private bVldLin		:= {|| LinOK(nOpc)}
Private bVldTela	:= {|| tudoOK()}
Private bVldField	:= {|| FieldOK()}
Private lConfirmou 	:= .F.
Private nPosItem    := 0

Private nPosSetor   := 0
Private nPosDesSet  := 0
Private nPosRetiro  := 0
Private nPosLinha   := 0
Private nPosDesLin  := 0
Private nPosVersao  := 0
Private nPosLoja    := 0
Private nPosGrupo   := 0
Private nPosProdu   := 0
Private nPosLocal   := 0
Private nPosQtdBom  := 0

Private nPosBrtBom  := 0
//Private nPosBrtAcid := 0
Private nPosPctH2o  := 0
Private nPosPctDes  := 0

Private nPosQtdAcid := 0
Private nPosNomRet  := 0
Private nPosTqLt    := 0
Private nPosImp     := 0
Private nPosTribut  := 0
Private nPosColAna  := 0
Private nPosDtColP  := 0

Private cSeek	    := xFILIAL("ZLD")+ZLD->ZLD_CODREC
Private bSeekFor	:= {|| ZLD->ZLD_CODREC == cCodRec  }
Private bSeekWhile  := {|| ZLD->ZLD_FILIAL + ZLD->ZLD_CODREC } //Condicao While para montar o aCols
Private aColsAux    := {} //Armazena aCols para Controle de Alteracao/Exclusao
Private lFlat       := .F.

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณA linha abaixo foi comentada,                                                     ณ
//ณpois a EMPRESA somente utiliza o ticket como uma informacao                      ณ
//ณmeramente informativa, sendo utilizada somente para ordenar as recepcoes efetuadasณ
//ณem uma mesma data dos produtores, nao sendo necessario pegar o volume de uma      ณ
//ณrecepcao que tenha o mesmo numero de ticket.                                      ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
//Private nVolAnt     := If(nOpc==3,0,GetVolAnt(cCodRec,cTicket,cSetor)) // Volume do ticket lancado (anteriores)
Private nVolAnt     := 0
Private lAbleTicket :=.T.
Private nTotCodRec  := 0
Private nKmAnt      := 0 // Km do ticket anterior
Private lPlataforma := .F.

Private _aCalcFret  := {'S=SIM','N=NAO'}
Private _cStatus := If(nOpc==3,Space(TamSX3("ZLD_STATUS")[1]),ZLD->ZLD_STATUS) 
Private _cCodDesc := "" //Matricula do produtor que sera penalizado com o descarte
Private _cLjDesc := ""  //Loja do cooperado que sera penalizado com descarte
Private nQtdDesc := 0 // Volume a descartar

/*
If nOpc==4
If POSICIONE("ZL3",1,xFILIAL("ZL3")+cLinRot,"ZL3_PLATAF") == "S"
lPlataforma := .T.
EndIf
EndIf
*/

aButtons  := If(Type("aButtons") == "U", {}, aButtons)


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณNa inclusao de uma recepcao de leite disponibiliza um botao ณ
//ณpara realizar a integracao com o coletor de dados.          ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู


If nOpc == 3
	Aadd( aButtons, {"PESQUISA" ,{||coletor()},"Coletor..." ,"Coletor" })
//	Aadd( aButtons, {"PESQUISA" ,{||Medidor()},"Medidor..." ,"Medidor" })
	Aadd( aButtons, {"PESQUISA" ,{||Descarte()},"Descarte..." ,"Descarte" })
EndIf

SetKey (VK_F7,{|a,b| U_CONSCRIO(aCols[n,nPosRetiro],aCols[n,nPosLoja])})

/*
Aadd( aButtons, {"VISUALIZA" ,{||U_AGLT300(aCols[n,nPosRetiro],aCols[n,nPosLoja], aCols[n,nPosNomRet])},"Crioscopia..." ,"Crioscopia" })
SetKey (VK_F7,{|a,b| U_AGLT300(aCols[n,nPosRetiro],aCols[n,nPosLoja],aCols[n,nPosNomRet])})
*/
/*
If (nOpc == 3) .or. (nOpc == 4)
Aadd( aButtons, {"PESQUISA" ,{||U_AGLT025()},"Desvio Rota..." ,"Desvio Rota" })
EndIf
*/


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Validacao - Para que nao seja possivel realizar a alteracao ou exclusao de uma recepcao que tenha sido fechada.  |
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If nOpc == 4 .Or. nOpc == 5
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณQuery para verificar se existe algum item da recep็ใo que foiณ
	//ณefetuado o fechamento.                                       ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	_cAliasVld:= GetNextAlias()
	querys(4,_cAliasVld,"","","","",cCodRec)
	
	dbSelectArea(_cAliasVld)
	(_cAliasVld)->(dbGoTop())
	
	If (_cAliasVld)->NUMREG > 0
		
		
		xMagHelpFis("INFORMAวรO",;
		"A recep็ใo estแ totalmente ou parcialmente com o status fechada.",;
		"Desta forma nใo serแ possํvel alterar ou excluir a recep็ใo de leite, sem antes efetuar o cancelamento do fechamento referente.")
		Return
		
	EndIf
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณFinaliza a area criada anteriormente.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	dbSelectArea(_cAliasVld)
	(_cAliasVld)->(dbCloseArea())
	
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Monta a entrada de dados do arquivo                  ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
cSeek	  := xFILIAL("ZLD") + cCodRec

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Monta aHeader e aCols utilizando a funcao FillGetDados       ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Private aHeader[0],aCols[0]

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Variaveis privadas para montagem da tela             ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
SetPrvt("AROTINA,CCADASTRO,CALIAS")
SetPrvt("NOPCE,NOPCG,NUSADO")
SetPrvt("CTITULO,CALIASENCHOICE,CLinOK,CTUDOK,CFIELDOK")
SetPrvt("NREG,NOPC")

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Sintaxe da FillGetDados( nOpcx, cAlias, nOrder, cSeekKey, bSeekWhile, uSeekFor, aNoFields, aYesFields, lOnlyYes, cQuery, bMontCols, lEmpty, aHeaderAux, aColsAux, bAfterCols, bBeforeCols, bAfterHeader, cAliasQry )   |
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
//Inclusao
If nOpc == 3
	FillGetDados(nOpc,cAlias,1,,,,aNoFields,aYesFields,,,,.T.,,,,,,)
	aCols[1,1] := "001"
Else //Alteracao,Visualizacao,Exclusao
	FillGetDados(nOpc,cAlias,1,cSeek,bSeekWhile,bSeekFor,aNoFields,,,,,,,,,)
EndIf
                 
cAliasGetd   :="ZLD"

AADD(aObjects,{100,055,.T.,.F.,.T.})
AADD(aObjects,{100,100,.T.,.T.})
AADD(aObjects,{100,002,.T.,.F.})

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Obte posicao dos campos no cabecalho os itens        ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
nPosItem    := ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_ITEM"  })
nPosRetiro	:= ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_RETIRO"})
nPosLoja	:= ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_RETILJ"})
nPosGrupo	:= ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_GRPRC"})
nPosQtdBom 	:= ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_QTDBOM"})
//nPosBrtBom 	:= ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_BRTBOM"})
//nPosBrtAcid	:= ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_BRTACI"})
nPosPctH2o	:= ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_QTDH2O"})
nPosPctDes	:= ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_DESH2O"})
//nPosQtdAcid	:= ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_QTDACI"})
nPosNomRet	:= ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_DCRRET"})
nPosLinha	:= ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_LINROT"})
nPosDesLin  := ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_DESLIN"})
nPosImp		:= ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_IMPORT"})
nPosHora	:= ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_HORA"  })
//nPosDtColP  := ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_DTCOLP"})
nPosTemp	:= ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_TEMP"  })
nPosRegua   := ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_REGUA" })
nPosTribut  := ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_TRIBUT"})
nPosVersao  := ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_VERSAO"})
//nPosColAna :=  ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_COLANA"})
nPosTqLt 	:= 0



aPosObj     := MsObjSize(aInfo,aObjects)

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณTratamento para tema "Flat"ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If "P10" $ oApp:cVersion
	If (ALLTRIM(GetTheme()) == "FLAT") .Or. SetMdiChild()
		lFlat := .T.
		nOffSet := 7
	EndIf
EndIf

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณPara que haja na visualizacao da tela a possibilidade ver qual operacao esta sendo realizada.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
Do Case
	
	Case nOpc == 2
		
		cTitulo += ' - VISUALIZAวรO'
		
	Case nOpc == 3
		
		cTitulo += ' - INCLUSรO'
		
	Case nOpc == 4
		
		cTitulo += ' - ALTERAวรO'
		
	Case nOpc == 5
		
		cTitulo += ' - EXCLUSรO'
		
EndCase

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Tela do modelo 2 - Rececpcao de Leite                ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
DEFINE MSDIALOG oDlg TITLE cTitulo OF oMainWnd PIXEL FROM aSize[7],0 TO aSize[6],aSize[5]

//@ 1.3,0.3 TO 2.3,43.0
//@ 5.9,0.3 TO 7.0,43.0
//@ 3.3,0.3 TO 2.3,43.0
//@ 7.9,0.3 TO 9.0,43.0
                      

_nSayLn := 3.3
_nGetLn := 3.2

@ _nSayLn,00.7	SAY "Dt. Recepcao"
@ _nGetLn,05.8 	MSGET dDtColeta  Valid CheckSX3("ZLD_DTCOLE") .And.  VldUser('ZLD_DTCOLE') SIZE 40,07 //WHEN (nOpc==3) SIZE 38,07 // Data da recepcao no laticinio
@ _nSayLn,11.5 	SAY "Hora Recep"
@ _nGetLn,15.5	MSGET cHrRec Picture "@E 99:99"  Valid iIf(Empty(cHrRec),.T.,CheckSX3("ZLD_HORDES") .And.  VldUser('ZLD_HORDES')) WHEN .T.

@ _nSayLn,21.0  	SAY "Data Lanc."
@ _nGetLn,25.0 		MSGET dData Valid CheckSX3("ZLD_DTLANC") .And.  VldUser('ZLD_DTLANC') SIZE 40,07 WHEN .T.

//If _lDigLote         
	@ _nSayLn,33.0  	SAY "Lote Estoque"
	@ _nGetLn,37.4 		MSGET _cLoteD3 Valid CheckSX3("ZLD_LOTE") .And.  VldLote() SIZE 45,07 WHEN .F.
//EndIf

_nSayLn++
_nGetLn++

@ _nSayLn,00.7 	SAY "Transport."
//@ _nGetLn,04.7  MSGET cFretist Valid iIf(Empty(cFretist),.T.,CheckSX3("ZLD_FRETIS") .And.  VldUser('ZLD_FRETIS') .And. VldFretist(cFretist,cLjFret) .And. GetdFret(cFretist,cLjFret)) WHEN (nOpc==3.Or.nOpc==4) F3 "SA2_L3"
//@ _nGetLn,09.5  MSGET cLjFret  Valid iIf(Empty(cLjFret) ,.T.,CheckSX3("ZLD_LJFRET") .And.  VldUser('ZLD_LJFRET') .And. VldFretist(cFretist,cLjFret) .And. GetdFret(cFretist,cLjFret)) WHEN (nOpc==3.Or.nOpc==4)
@ _nGetLn,04.7  MSGET cFretist Valid iIf(Empty(cFretist),.T.,CheckSX3("ZLD_FRETIS") .And.  VldUser('ZLD_FRETIS') .And. VldFretist(cFretist,cLjFret) .And. GetdFret(cFretist,cLjFret))  WHEN (nOpc==3.Or.nOpc==4) F3 "SA2_L1"
@ _nGetLn,09.5  MSGET cLjFret  Valid iIf(Empty(cLjFret) ,.T.,CheckSX3("ZLD_LJFRET") .And.  VldUser('ZLD_LJFRET') .And. VldFretist(cFretist,cLjFret) .And. GetdFret(cFretist,cLjFret))  WHEN (nOpc==3.Or.nOpc==4)
@ _nGetLn,12.8  MSGET cDescFret  WHEN .F. SIZE 242,7

_nSayLn++
_nGetLn++

@ _nSayLn,00.7 	SAY "Motorista"
@ _nGetLn,04.7  MSGET cMotor Valid iIf(Empty(cMotor),.T.,CheckSX3("ZLD_MOTOR") .And.  VldUser('ZLD_MOTOR') .And. VldMotor(cMotor, nOpc) ) WHEN (nOpc==3.Or.nOpc==4) F3 "ZL0_02"
@ _nGetLn,09.5  MSGET cDescMot  WHEN .F.

If lFlat
	@ _nSayLn,23.1  	SAY "Veiculo"
	@ _nGetLn,26.1  	MSGET cVeicul Picture PesqPict("ZLD","ZLD_VEICUL") Valid iIf(Empty(cVeicul),.T., CheckSX3("ZLD_VEICUL") .And.  VldUser('ZLD_VEICUL') .And. VldVeicul(cVeicul)) WHEN (nOpc==3.Or.nOpc==4)  F3 "ZL4_01"
	@ _nGetLn,30.1 		MSGET cPlacaVeic  WHEN .F.
Else
	@ _nSayLn,26.3  	SAY "Veiculo"
	@ _nGetLn,29.2  	MSGET cVeicul Picture PesqPict("ZLD","ZLD_VEICUL") Valid iIf(Empty(cVeicul),.T.,CheckSX3("ZLD_VEICUL") .And.  VldUser('ZLD_VEICUL') .And. VldVeicul(cVeicul)) WHEN (nOpc==3.Or.nOpc==4)  F3 "ZL4_01"
	@ _nGetLn,34.2 		MSGET cPlacaVeic  WHEN .F.
EndIf
             
_nSayLn++
_nGetLn++

@ _nSayLn,00.7 	SAY "Setor"
@ _nGetLn,04.7  MSGET oSetor var cSetor Valid IIF(Empty(cSetor),.T.,CheckSX3("ZLD_SETOR") .And.  VldUser('ZLD_SETOR') .And.  VldSet(cSetor)) .And. GetNwTicket(.T.) WHEN (nOpc==3) F3 "ZL2_01"
@ _nGetLn,09.5  MSGET cDescSet  WHEN .F.

@ _nSayLn,26.3  SAY "KM Asfalto"
@ _nGetLn,30.0  MSGET oKm var nTotKm Picture "@E 999,999.99" /*Valid iIf(Empty(ntotkm),.T.,CheckSX3("ZLD_KM") .And.  VldUser('ZLD_KM'))*/ WHEN (nOpc==3.Or.nOpc==4) SIZE 40,7

@ _nSayLn,35.3  SAY "KM Terra"
@ _nGetLn,38.2  MSGET oKmTerr var nTotKmT Picture "@E 999,999.99" /*Valid iIf(Empty(ntotkm),.T.,CheckSX3("ZLD_KM") .And.  VldUser('ZLD_KM'))*/ WHEN (nOpc==3.Or.nOpc==4) SIZE 40,7

         
_nSayLn++
_nGetLn++

@ _nSayLn,00.7 	SAY "Tmp.Veiculo"
@ _nGetLn,04.7  MSGET nTempCamin Picture "@E 99.9" Valid iIf(Empty(nTempCamin),.T.,CheckSX3("ZLD_TEMPCA") .And.  VldUser('ZLD_TEMPCA') ) WHEN (nOpc==3.Or.nOpc==4) SIZE 37,07


@ _nSayLn,09.7 	SAY "Rota"
@ _nGetLn,13.7   MSGET cRotCab Valid iIf(Empty(cRotCab),.T., /*VldUser('ZLD_ROTCAB') .and.*/ GatilhoZLW(cRotCab,1) )  WHEN (nOpc==3.Or.nOpc==4) F3 "ZLD_RO"

@ _nGetLn,18.7   MSGET cDescRot  WHEN .F.  SIZE 100,07



nLeiteBom  := nVolAnt+U_GetTotCol()
nTotCodRec := U_GetTotCol()
nLtDIf     := nTotBom-nLeiteBom




DEFINE FONT oFont1 NAME "Tahoma" BOLD

_nSayLn++
@ _nSayLn, 00.7 SAY "Ticket" FONT oFont1

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณA funcao IsExist(cTicket,"ZLD","ZLD_TICKET")  foi removida        ณ
//ณdevido ao fato de nao existir duas uma data de coleta diferenciadaณ
//ณem um mesmo caminhao para efetuar a sua difrenca de peso.         ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
//@ _nSayLn,04.7 MSGET oTicket VAR cTicket Picture PesqPict("ZLD","ZLD_TICKET") Valid VldTikt() .And. CheckSX3("ZLD_TICKET") .And.  VldUser('ZLD_TICKET') .And. !IsExist(cTicket,"ZLD","ZLD_TICKET") WHEN (nOpc==3) FONT oFont1
@ _nSayLn, 04.7 MSGET oTicket VAR cTicket Picture PesqPict("ZLD","ZLD_TICKET") Valid VldTikt() .And. CheckSX3("ZLD_TICKET") .And.  VldUser('ZLD_TICKET') WHEN (nOpc==3) .And. .F.  FONT oFont1
@ _nSayLn, 10.0 SAY "Tkt.Pesagem"
@ _nSayLn, 14.3 MSGET cTktPeso Picture PesqPict("ZLD","ZLD_TKPESO") VALID U_VlTicket(xFilial("ZLD"),cTktPeso) .AND. BuscaVol(xFilial("ZLD"),cTktPeso)  WHEN ((nOpc==3.Or.nOpc==4) .And. lAbleTicket .and. _lUsabalanca) SIZE 50,7 F3 "Z19GLT"
@ _nSayLn, 21.0 SAY "Volume no Veiculo"
@ _nSayLn, 27.1 MSGET nTotBom Picture "@E 99,999,999"  WHEN ((nOpc==3.Or.nOpc==4) .And. lAbleTicket .and. ChkPermis("ZLD_QTDBOM") .and. !_lUsabalanca ) SIZE 50,7
@ _nSayLn, 33.3 SAY "Vol. Coletado"
@ _nSayLn, 38.0 MSGET oLteBom var nLeiteBom Picture "@E 99,999,999"  WHEN .F. SIZE 50,7
@ _nSayLn, 45.0 SAY "Diferenca"
@ _nSayLn, 48.3 MSGET oDIf var nLtDIf Picture "@E 99,999,999"  WHEN .F.  SIZE 50,7


//Caso o lote nใo seja digitado, utiliza filial+ticket como lote
/*If !_lDigLote         //alterado por Tarcํsio Silva, nใo estava carregando a variavel. 
	_cLoteD3 := Alltrim(xFilial("SF2"))+cTicket
EndIf*/

//TButton():New( 090, 400, "Ler Balan็a"	,oDlg,{||U_AGLT304()}, 157,30,,oFont1,.F.,.T.,.F.,,.F.,,,.F. )

//oGet := MSGetDados():New(aPosObj[2,1]+40,aPosObj[2,2],aPosObj[2,3]-20,aPosObj[2,4],nOpc,"Eval(bVldLin)","Eval(bVldTela)","",((nOpc == 3) .Or. (nOpc == 4)),Nil,Nil,Nil,LINHAS,"Eval(bVldField)")
oGet := MSGetDados():New(aPosObj[2,1]+40,aPosObj[2,2],aPosObj[2,3]-20,aPosObj[2,4],nOpc,"Eval(bVldLin)","AllwaysTrue()","+ZLD_ITEM",((nOpc == 3) .Or. (nOpc == 4)),Nil,Nil,Nil,LINHAS,"Eval(bVldField)")

// RODAPE DA TELA
@aPosObj[2,3] - 10,005 SAY "Total de Volume do Lancamento:"  Pixel of oDlg
@aPosObj[2,3] - 10,090 MSGET oTotCodRec var nTotCodRec Picture "@E 99,999,999"  WHEN .F. Pixel of oDlg



//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Armazena aCols para Controle de Alteracao e Exclusao ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
GetAcols()

ACTIVATE MSDIALOG oDlg ON INIT EnchoiceBar(oDlg,{|| lConfirmou := tudoOK(nOpc) ,If(lConfirmou,oDlg:End(),)},{||oDlg:End()},,aButtons)

cRotCab:= StrZero(Val(cRotCab),6)

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Grava dados da ZLD e movimentacao interna(SD3)       ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If lConfirmou
	
	dbSelectArea("ZLD")
	
	BEGIN TRANSACTION
	
	//ฺฤฤฤฤฤฤฤฟ
	//ณIncluirณ
	//ภฤฤฤฤฤฤฤู
	If nOpc == 3
		
		_lTransac:= InsZLD(aCols)
		
		If _lTransac
			
			//Processa( {|| _lTransac:= reproTri(_cBkCodRec,dData,aCols) }, "Aguarde...", "Efetuando o reprocessamento da tributacao...",.F.)
			//Processa( {|| _lTransac:= reproTri(cCodRec,dDtColeta,aCols,.F.) }, "Aguarde...", "Efetuando o reprocessamento da tributacao...",.F.)
			//_lTransac:= !_lTransac
			
			//Indica se para este setor serแ impresso cupom do ticket.
			If ZL2->(FieldPos("ZL2_IMPCUP")) > 0
				If ZL2->ZL2_IMPCUP == "S"
					U_RGLT008()
				EndIf	
		    EndIf

			
			
		EndIf
		

		/*
		//ฺฤฤฤฤฤฤฤฟ
		//ณAlterarณ
		//ภฤฤฤฤฤฤฤู
		*/
	ElseIf nOpc == 4
		
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณVerifica a necessidade de chamar a rotina de reprocessamento.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		Processa( {|| _lReproc:= chamaRep(cCodRec,aCols) }, "Aguarde...", "Verificando a necessidade de reprocessamento...",.F.)
		
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณExclui o movimento interno.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		If _cStatus != "D"
			_lTransac:= GeraSD3(cCodRec,5,cTicket,_cLoteD3)
			
		Else
			// Se for descarte, deleta ZLN
			DbSelectArea("ZLN")
			DbSetOrder(1)
			If ZLN->(DbSeek(xFilial("ZLN")+cTicket))
				RecLock("ZLN",.F.)
				ZLN->(dbDelete())
				ZLN->(MsUnLock())
			EndIf	
			_lTransac:= GeraSD3(cCodRec,5,cTicket,_cLoteD3)
		EndIf

		
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณSomente grava os novos dados da alteracao caso consiga deletar o movimento interno e registros de recepcao na ZLDณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		If _lTransac
			
			/*
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณGrava Novos Itensณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			*/
			_lTransac:= InsZLD(aCols)
			
			/*
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณFuncao para efetuar o reprocessamento da tributacao.ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			*/
			If .f. //_lReproc NรO USADO PARA PROMILAT
				
				If _lTransac
					
					//Processa( {|| _lTransac:= reproTri(_cBkCodRec,dData,aCols) }, "Aguarde...", "Efetuando o reprocessamento da tributacao...",.F.)
					Processa( {|| _lTransac:= reproTri(_cBkCodRec,dDtColeta,aCols,.T.) }, "Aguarde...", "Efetuando o reprocessamento da tributacao...",.F.)
					_lTransac:= !_lTransac
					
				EndIf
				
				/*
				//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
				//ณCaso nao seja necessario executar a rotina de reprocessamento exclu osณ
				//ณregistros da movimentacao de leite ZLD.                               ณ
				//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
				*/
			Else
				
				delZLD(aCols,_cBkCodRec)
				//Aqui Caique
			EndIf
			
		EndIf
		
		/*
		//ฺฤฤฤฤฤฤฤฟ
		//ณExcluirณ
		//ภฤฤฤฤฤฤฤู
		*/
	ElseIf nOpc == 5
		
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณExclui o movimento interno.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		
		If _cStatus != "D"
			_lTransac:= GeraSD3(cCodRec,5,cTicket,_cLoteD3)
			If lHabilita == .T. .And. _lTransac == .T.
				UpdZX1(xFilial("ZLD"),cTicket)
			EndIF
		Else
			// Se for descarte, deleta ZLN
			DbSelectArea("ZLN")
			DbSetOrder(1)
			If ZLN->(DbSeek(xFilial("ZLN")+cTicket))
				RecLock("ZLN",.F.)
				ZLN->(dbDelete())
				ZLN->(MsUnLock())
			EndIf
			_lTransac:= GeraSD3(cCodRec,5,cTicket,_cLoteD3)
			If lHabilita == .T. .And. _lTransac == .T.
				UpdZX1(xFilial("ZLD"),cTicket)
			EndIF
		EndIf
		
		If _lTransac
			/*
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณFuncao para efetuar o reprocessamento da tributacao.ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			*/
			//Processa( {|| _lTransac:= reproTri(_cBkCodRec,dData,aCols)}, "Aguarde...", "Efetuando o reprocessamento da tributacao...",.F.)
			
			//Processa( {|| _lTransac:= reproTri(_cBkCodRec,dDtColeta,aCols,.T.)}, "Aguarde...", "Efetuando o reprocessamento da tributacao...",.F.)
			//_lTransac:= !_lTransac
			delZLD(aCols,_cBkCodRec)
			//Aqui
		EndIf
		
	EndIf
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณCaso tenha ocorrido algum erro desfaz toda as operacoes ณ
	//ณcontidas na recepcao do leite.                          ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	If !_lTransac
		
		DisarmTransaction()
		
		xMagHelpFis('INFORMAวรO',;
		'Houve um problema na realiza็ใo da opera็ใo solicitada.',;
		'Desta forma nenhuma informa็ใo foi processada.')
		
	Else
		//ConfirmSx8()
		While ( GetSX8Len() > nSaveSX8 )
			ConFirmSX8()
		EndDo
	EndIf
	
	END TRANSACTION
Else
	RollBackSX8()
EndIf

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณFIELDOK   บ Autor ณ Irenio S. Oliveira    บ Data da Criacao  ณ 11/09/2008             						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para validar linha da getDados na tela de Recepcao de leite                                     บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
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
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*
Static Function FieldOK()

Local lRet    := .T.
Local cVar	  := ALLTRIM(ReadVar())
Local lRet    := .T.
Local nI      := 0
Local dvfDtCol:= dDtColeta - GetMv("LT_DIASMC")//Este parametro esta configurado com o valor 180, ou seja, 6 meses
Local nDesvM  := GetMv("LT_DESVMC")//Este parametro esta configurado com o valor 10
Local aArea	  := GetArea()

If cVar	==	"M->ZLD_QTDBOM" .And. lRet

nMedCol := U_MedCol(aCols[n][nPosLinha],aCols[n][nPosRetiro],aCols[n][nPosLoja],dvfDtCol,dDtColeta)
nQtdesvp := nMedCol + ((nMedCol * nDesvM) / 100)
nQtdesvn := nMedCol - ((nMedCol * nDesvM) / 100)
nQtdapon := &(cVar)
//	If nQtdapon >  nMedCol .And. nQtdapon > nQtdesvp
//xMagHelpFis("Atencao","A quantidade apontada: "+transform(nQtdapon,"@E 999,999.9")+" l, e maior que a m้dia ("+transform(nMedCol,"@E 999,999.9")+" + 10%)","Verique o motivo do desvio")
//ElseIf nQtdapon <  nMedCol .And. nQtdapon < nQtdesvn
//xMagHelpFis("Atencao","A quantidade apontada: "+transform(nQtdapon,"@E 999,999.9")+" l, e menor que a m้dia ("+transform(nMedCol,"@E 999,999.9")+" - 10%)","Verique o motivo do desvio")
//EndIf
EndIf

RestArea(aArea)

Return lRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ?ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณLinOK     บ Autor ณ Jeovane               บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para validar linha da getDados na tela de Recepcao de leite                                     บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
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
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function LinOK(nOpcao)

Local lRet     := .T.
Local aAux     := aCols[n] //Pega Linha Atual
Local aAux1    := {}
Local nIndex   := 0
Local cBloq    := ""
Local nPosLinha := ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_LINROT" })
Local nPosVersao := ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_VERSAO" })
Local _iLinha    := 0

//Atualiza Variaveis de Totais
nLeiteBom := nVolAnt+U_GetTotCol()
nTotCodRec:= U_GetTotCol()
nLtDIf    := nTotBom-nLeiteBom
//nTotKm	  += SomaKM()

oKm:Refresh()
oKmTerr:Refresh()
oLteBom:Refresh()
oDif:Refresh()
oTotCodRec:Refresh()
oDlg:Refresh()

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณNao existiram validacoes na visualizacao e na exclusao.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
If nOpcao == 5 .Or. nOpcao == 2
	Return .T.
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Verifica se a linha foi excluida ou se o registro importado  ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If aTail(aCols[n])
	Return .T.
EndIf

If Empty(aCols[n,nPosLinha]) 
	aCols[n,nPosLinha] := cRotCab
	aCols[n,nPosVersao] := GatilhoZLW(_cRota)[3]	
EndIf


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณVerifica se o c๓digo do produtor nใo estแ duplicado no ticket de recep็ใo do leite.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
For _iLinha := 1 to Len(aCols)
                              
	
Next _iLinha

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณVerifica se a linha esta bloqueada.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

dbSelectArea("ZLW")
ZLW->(dbSetOrder(4))
//If ZLW->(dbSeek(xFILIAL("ZLW") + aCols[n,nPosLinha]+aCols[n,nPosVersao]))
If ZLW->(dbSeek(xFILIAL("ZLW") + aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_LINROT" })]+aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_VERSAO" })] ))
	
	If ZLW->ZLW_MSBLQL == "1"
		
		xMagHelpFis("BLOQUEADO",;
		"A linha "+ aCols[n,nPosLinha] +" esta bloqueada para uso.",;
		"Favor informar outra rota ou uma versใo da rota que nใo esteja bloqueada.")
		Return .F.
		
	Else
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณApos constatar que a linha nao se encontra bloqueada sera      ณ
		//ณverificada se a mesma pertence ao setor informado no cabecalho.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		If ZLW->ZLW_SETOR <> cSetor
			
			xMagHelpFis("INFORMAวรO",;
			"A linha: " + aCols[n,nPosLinha] + " pertence ao setor: " + ZLW->ZLW_SETOR + " que ้ diferente do setor informado no cabe็alho: " + cSetor,;
			"Nใo serแ possํvel informar uma linha que tenha o setor diferente do informado no cabecalho do lan็amento, favor verificar se a linha informada esta correta.")
			Return .F.
		EndIf
	EndIf
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณNao foi encontrada a linha do produtor para a filial corrente.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
Else
	
	xMagHelpFis("INFORMAวรO",;
	"A linha: " + aCols[n,nPosLinha] + " nใo pertence a filial corrente ou nใo existe.",;
	"Favor verificar se o c๓digo do produtor esta correto, ou se a linha informada em seu cadastro esta correta.")
	Return .F.
EndIf

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณVerifica se o produtor esta bloqueado em seu cadastro.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
cBloq := POSICIONE("SA2",1,xFILIAL("SA2")+aAux[nPosRetiro]+aAux[nPosLoja],"A2_MSBLQL")
//2=Liberado; 1=Bloqueado
If SA2->A2_MSBLQL == "1"
	
	xMagHelpFis("Atencao",;
	"Produtor informado nใo estแ ativo.",;
	"Ative o Produtor no cadastro de Fornecedores ou selecione outro produtor!")
	Return .F.
	
EndIf
/*
If DateDiffDay(aAux[nPosDtColP],cDtRec) > 1 .Or. aAux[nPosDtColP] > cDtRec
	
	xMagHelpFis("Atencao",;
	"Data de Coleta na Propriedade estแ errada.",;
	"Valor deve ser igual ou um dia antes da data de recep็ใo no laticํnio")
	Return .F.
	
EndIf
*/
Return lRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ TudoOK   บ Autor ณ Jeovane               บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para validar toda a tela de recepcao de leite                                                   บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
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
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function TudoOk(nOpcao)

Local lRet      := .T.
Local nDias     := GetMv("LT_DIASRE") //Este parametro esta preenchido com o valor 360
Local aArea     := GetArea()

Local _aBloq    := {}
Local _aSetores := {}
Local _aLinhas  := {}
Local _aProdutor:= {}
Local _aProdBloq:= {}
Local _aProdTipo:= {}
Local _aProdInex:= {}
Local _aQtdLeite:= {}

Local _cBloqCab := ""
Local _cLinhas  := ""
Local _cItem    := ""
Local i

dbSelectArea("ZL2")
ZL2->(dbSetOrder(1))
ZL2->(dbSeek(xFILIAL("ZL2") + cSetor ))


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณNao existiram validacoes na visualizacao e na exclusao.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If nOpcao == 5 .Or. nOpcao == 2
	Return .T.
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณCaso se deseja realizar a inclusao ou alteracao de uma recepcaoณ
//ณde leite que seja inferior ao numero de dias estabelecido.     ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If nOpcao == 3 .Or. nOpcao == 4
	
/*
	If nLtDIf <> 0
		
		xMagHelpFis("Diferen็a",;
		"Existe uma diferen็a entre a quantidade de leite informada e a soma da quantidade de leite digitada para cada produtor",;
		"Corrigir as quantidades digitadas por produtor ou a quantidade informada.")
		Return .F.
		 
	EndIf
*/	
	If dDtColeta < (Date() - nDias)
		
		xMagHelpFis("Data da Coleta",;
		"Data da Coleta nao permitida!",;
		"A data da Coleta deve ser dos ultimos " + ALLTRIM(STR(nDias)) + " dias.")
		Return .F.
		
	EndIf
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณData Coleta maior que a data da Recepcao no laticinioณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
/*	
	If (dDtColeta < cDtRec)
		xMagHelpFis("Data da Recepcao",;
		"Data da Recepcao nao permitida!",;
		"A data da Recep็ใo deve ser maior ou igual a data da coleta")
		Return .F.
		
	EndIf
*/	
	
	If (Month(dDtColeta) > Month(dDataBase))
		xMagHelpFis("Data da Recepcao",;
		"Data da Recepcao nao permitida!",;
		"Favor verificar o m๊s da recep็ใo")
		Return .F.
	EndIf
	
	
	
	//EndIf
	
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณValidacao Do Ticket                                  ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	
	If INCLUI
		nTicket := StrZero(VAL(ZL2->ZL2_TICKET) - 1,6 )
		IF  cTicket < cValtoChar(nTicket)
			MsgAlert (" Ticket Invalido, sera gerado novo Ticket")
			GetNwTicket()
			Return .F.
		EndIf
	EndIf
	
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณVerifica se os campos obrigatorios foram preenchidos.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	
	
	
	If lPlataforma
		// lRet := ( (!Empty(dDtColeta)) .And. (!Empty(cSetor)) .And. (!Empty(nTotBom)))
		// lRet := ( (!Empty(dDtColeta)) .And. (!Empty(cSetor)) .And. (!Empty(nTotBom))  .AND. (!Empty(cTicket)))
		// Nใo valida se  foi preenchido a quantidade de leite para o produtor
		// As linhas que estiverem sem quantidade de leite nใo serใo gravadas.
		lRet := ( (!Empty(dDtColeta)) .And. (!Empty(cSetor))  .AND. (!Empty(cTicket))) 
	Else
		lRet := ( (!Empty(cFretist)) .And.  (!Empty(cLjFret)) .And. (!Empty(cMotor)) .And. ;
		 		(!Empty(dDtColeta)) .And. (!Empty(cSetor)) .And.  (!Empty(cRotCab)) .And. ;
		 		 (!Empty(cDescRot))  .And.  (!Empty(cHrRec)) .And. (nTotBom > 1) ) //.AND. (!Empty(cDtRec))
	EndIf
		
	If !lRet
		xMagHelpFis("ATENวรO",;
		"Existem campos obrigat๓rios que nใo foram preenchidos.",;
		"Favor preencher os campos obrigat๓rios. (Data / Hora / Transportador / Motorista / Rota / Volume no veํculo")
		Return .F.
	EndIf
		
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณVerifica se o setor informado esta bloqueado.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	
	If ZL2->ZL2_MSBLQL == "1"
		
		aAdd(_aBloq,{"Setor: " + cSetor})
		
	EndIf
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณVerifica se o fretista esta bloqueadoณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	dbSelectArea("SA2")
	SA2->(dbSetOrder(1))
	SA2->(dbSeek(xFILIAL("SA2") + cFretist + cLjFret))
	
	If SA2->A2_MSBLQL == "1"
		
		aAdd(_aBloq,{"Transportador: " + cFretist + '/' + cLjFret})
		
	EndIf
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณVerifica se o motorista esta bloqueado.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	dbSelectArea("ZL0")
	ZL0->(dbSetOrder(1))
	ZL0->(dbSeek(xFILIAL("ZL0") + cMotor))
	
	If ZL0->ZL0_MSBLQL == "1"
		
		aAdd(_aBloq,{"Motorista: " + cMotor})
		
	EndIf
	
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณVerifica se o veiculo esta bloqueado.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	dbSelectArea("ZL4")
	ZL4->(dbSetOrder(1))
	ZL4->(dbSeek(xFILIAL("ZL4") + cVeicul))
	
	If ZL4->ZL4_MSBLQL == "1"
		
		aAdd(_aBloq,{"Veํculo: " + cVeicul})
		
	EndIf
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณImpirme os itens do cabecalho que se encontram bloqueados.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	If Len(_aBloq) > 0
		
		aEval(_aBloq,{|Z| _cBloqCab += Z[1] + _ENTER})
		
		xMagHelpFis("ATENวรO",;
		"Abaixo segue uma rela็ใo de dados do cabe็alho que se encontram bloqueados, desta forma nใo serแ possํvel realizar a inclusใo da recep็ใo.",;
		_cBloqCab)
		
		Return .F.
		
	EndIf
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณVerifica se existem produtores, linha ou setores diferente, pois ณ
	//ณestes dados podem ter sido inseridos via coletor.                ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	For i := 1 To Len(aCols)
		
		//Se a linha nao estiver deletada
		If !aTail(aCols[i])
			
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณVerifica se a quantidade de leite informada principalmente no casoณ
			//ณda importacao via coletor possui um valor maior que zero digitado.ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			If aCols[i,nPosQtdBom] <= 0
				
				aAdd(_aQtdLeite,{aCols[i,nPosLinha]})
				
			EndIf
			
			/*
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณVerifica se a linha esta bloqueada, ou se a mesma pertence a uma outra filialณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			*/
			dbSelectArea("ZLW")
			ZLW->(dbSetOrder(4))
			//	If ZLW->(dbSeek(xFILIAL("ZLW") + aCols[i,nPosLinha]+ aCols[i,nPosVersao]))
			If ZLW->(dbSeek(xFILIAL("ZLW") + aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_LINROT" })]+aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_VERSAO" })] ))
				
				/*
				//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
				//ณLinhas bloqueadas.ณ
				//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
				*/
				If ZLW->ZLW_MSBLQL == "1"
					
					If aScan(_aLinhas,{|K| K[1] == aCols[i,nPosLinha]}) == 0
						
						aAdd(_aLinhas,{aCols[i,nPosLinha]})
						
					EndIf
					
				Else
					/*
					//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
					//ณCaso a linha nao esteja bloqueada verifica se ela pertence ณ
					//ณao setor informado no cabecalho.                           ณ
					//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
					*/
					If ZLW->ZLW_SETOR <> cSetor
						/*
						//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
						//ณPara que na mensagem somente sejam mostradas as linhas     ณ
						//ณdiferentes que se encontram com o setor divergente do setorณ
						//ณinformado no cabacelho da recepcao.                        ณ
						//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
						*/
						If aScan(_aSetores,{|W| W[1] == ZLW->ZLW_COD}) == 0
							
							aAdd(_aSetores,{ZLW->ZLW_COD})
							
						EndIf
						
					EndIf
					
				EndIf
				
				/*
				//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ ฟ
				//ณLinhas inexistentes. ณ
				//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ ู
				*/
			Else
				
				If aScan(_aLinhas,{|K| K[1] == aCols[i,nPosLinha]}) == 0
					
					aAdd(_aLinhas,{aCols[i,nPosLinha]})
					
				EndIf
				
			EndIf
			
			/*
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณVerifica se o produtor esta bloqueado em seu cadastro.ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			*/
			dbSelectArea("SA2")
			SA2->(dbSetOrder(1))
			If SA2->(dbSeek(xFILIAL("SA2") + aCols[i,nPosRetiro] + aCols[i,nPosLoja]))
				
				If SA2->A2_MSBLQL == "1" //2=Liberado; 1=Bloqueado
					
					aAdd(_aProdBloq,{aCols[i,nPosItem]})
					
				Else
					/*
					//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
					//ณPara o caso principalmente da importacao via coletor nao ser ณ
					//ณpermitida a insercao de um tipo de produtor diferente de C.  ณ
					//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
					*/
					If SA2->A2_L_TPFOR <> 'P'
						
						aAdd(_aProdTipo,{aCols[i,nPosItem]})
						
					EndIf
					
				EndIf
				
				/*
				//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
				//ณProdutor informado ou impotador via coletor inexistente.ณ
				//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
				*/
			Else
				
				aAdd(_aProdInex,{aCols[i,nPosItem]})
				
			EndIf
			
		EndIf
		
	Next i
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณImprime uma relacao de linhas bloqueadas ou inexistentes.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	If Len(_aLinhas) > 0
		
		aEval(_aLinhas,{|X| _cLinhas += ";" + X[1] })
		
		_cLinhas:= SubStr(_cLinhas,2,Len(_cLinhas))
		
		xMagHelpFis("INFORMAวรO",;
		"Foi(ram) encontrada(s) uma(algumas) linha(s) que se encontra(m) bloqueada(s) em seu cadastro ou que nใo pertencem a filial corrente, abaixo segue uma rela็ใo destas linhas:",;
		_cLinhas)
		
	EndIf
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณImprime as linhas que nao pertencem ao setor informado no cabecalho.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	If Len(_aSetores) > 0
		
		_cLinhas:= ""
		aEval(_aSetores,{|X| _cLinhas += ";" + X[1] })
		
		_cLinhas:= SubStr(_cLinhas,2,Len(_cLinhas))
		
		xMagHelpFis("INFORMAวรO",;
		"Foi(ram) encontrada(s) uma(algumas) linha(s) que se encontra(m) com um setor informado em seu cadastro diferente do informado no cabecalho, abaixo segue uma rela็ใo destas linhas:",;
		_cLinhas)
		
	EndIf
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณImprime uma relacao de produtores que se encontram bloqueados.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	If Len(_aProdBloq) > 0
		
		_cItem:= ""
		aEval(_aProdBloq,{|X| _cItem += ";" + X[1] })
		
		_cItem:= SubStr(_cItem,2,Len(_cItem))
		
		xMagHelpFis("INFORMAวรO",;
		"Foi(ram) encontrado(s) um(alguns) produtor(es) que se encontra(m) bloqueados em seu cadastro, abaixo segue uma rela็ใo do numero do item em que se encontra(m) este(s) produtor(es).",;
		_cItem)
		
	EndIf
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณImprime uma relacao de produtores que se encontram com o tipo diferente de P.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	If Len(_aProdTipo) > 0
		
		_cItem:= ""
		aEval(_aProdTipo,{|X| _cItem += ";" + X[1] })
		
		_cItem:= SubStr(_cItem,2,Len(_cItem))
		
		xMagHelpFis("INFORMAวรO",;
		"Foi(ram) encontrada(s) uma(algumas) linha(s) de dados que foram fornecidos o codigo do Produtor diferente de P, abaixo segue uma rela็ใo do numero do item em que se encontra(m) com este problema.",;
		_cItem)
		
	EndIf
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณImprime uma relacao de produtores que se encontram sem cadastro efetuado.	ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	If Len(_aProdInex) > 0
		
		_cItem:= ""
		aEval(_aProdInex,{|X| _cItem += ";" + X[1] })
		
		_cItem:= SubStr(_cItem,2,Len(_cItem))
		
		xMagHelpFis("INFORMAวรO",;
		"Foi(ram) encontrado(s) um(alguns) produtor(es) que nใo possuem cadastro no sistema, abaixo segue uma rela็ใo do numero do item em que se encontra(m) com este problema.",;
		_cItem)
		
	EndIf
	
	If Len(_aQtdLeite) > 0

		// Trecho retirado para atender a Coopersucesso para gravar somente as linhas que tiverem quantidade de leite informada.
		_cItem:= ""
		aEval(_aQtdLeite,{|X| _cItem += ";" + X[1] })
		
		_cItem:= SubStr(_cItem,2,Len(_cItem))
		
		xMagHelpFis("INFORMAวรO",;
		"Foi(ram) encontrado(s) um(alguns) registro(s) que possuem o valor da litragem incorreto, abaixo segue uma rela็ใo do numero do item em que se encontra(m) com este problema.",;
		_cItem)

	EndIf
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณVerifica se houve alguma insercao de dados incorreta.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	//If Len(_aProdInex) > 0 .Or. Len(_aProdTipo) > 0 .Or. Len(_aProdBloq) > 0 .Or. Len(_aLinhas) > 0 .Or. Len(_aSetores) > 0 .Or. Len(_aQtdLeite) > 0
	If Len(_aProdInex) > 0 .Or. Len(_aProdTipo) > 0 .Or. Len(_aProdBloq) > 0 .Or. Len(_aLinhas) > 0 .Or. Len(_aSetores) > 0 
		
		Return .F.
		
	EndIf


EndIf

RestArea(aArea)
Return(lRet)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ VldSet   บ Autor ณ Jeovane               บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para validar o setor digitado na tela de Recepcao de leite.                                     บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
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
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function VldSet(cSetor)

Local lRet  := .T.
Local aArea := GetArea()

If !Empty(cSetor)
	
	dbSelectArea("ZL2")
	ZL2->(dbSetOrder(1))
	lRet :=  ZL2->(dbSeek(xFILIAL("ZL2") + cSetor))
	
	If lRet
		
		cDescSet := ZL2->ZL2_DESCRI
		
	Else
		
		xMagHelpFis("INFORMAวรO",;
		"O setor informado nใo existe ou nใo pertence a filial posicionada.",;
		"Favor verificar se o c๓digo do setor foi digitado corretamente, ou se a filial posicionada esta correta.")
		
	EndIf
	
EndIf

RestArea(aArea)

Return(lRet)


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณVldFretistบ Autor ณ Jeovane               บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para validar Fretista digitado na tela de Recepcao de leite                                     บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
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
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function VldFretist(cFretist,cLjFret)

Local lRet  := .T.
Local cLoja := If(!Empty(cLjFret),cLjFret,"01") //Seta var loja com loja padrao caso a mesma esteja vazia
Local aArea := GetArea()

If !Empty(cFretist)
	
	dbSelectArea("SA2")
	SA2->(dbSetOrder(1))
	lRet := SA2->(dbSeek(xFILIAL("SA2") + cFretist + cLoja))
	
	If lRet
		
		cDescFret := SA2->A2_NOME
		
		If SubStr(SA2->A2_COD,1,1) <> 'T'
			
			lRet  := .F.
			
			xMagHelpFis("INFORMAวรO",;
			"Somente ้ permitida a inser็ใo de fretistas na recep็ใo do leite do tipo G.",;
			"Favor fornecer um tipo de fretista vแlido.")
			
		EndIf
		
	Else
		
		xMagHelpFis("INFORMAวรO",;
		"Nใo existe um fretista cadastrado no sistema de acordo com o c๓digo fornecido.",;
		"Favor verificar se o c๓digo e loja do fretista foram fornecidos corretamente.")
		
	EndIf
EndIf

RestArea(aArea)

Return lRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณVldVeicul บ Autor ณ Jeovane               บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para validar veiculo digitado na tela de Recepcao de leite                                      บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
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
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function VldVeicul(cVeicul)

Local lRet  := .T.
Local aArea := GetArea()

If !Empty(cVeicul)
	
	dbSelectArea("ZL4")
	ZL4->(dbSetOrder(1))
	lRet := ZL4->(dbSeek(xFILIAL("ZL4") + cVeicul))
	
	If lRet
		
		cPlacaVeic := ZL4->ZL4_PLACA
		
	Else
		
		xMagHelpFis("INFORMAวรO",;
		"O veํculo informado nใo esta cadastrado no sistema.",;
		"Favor fornecer um c๓digo correto do veํculo.")
		
	EndIf
	
EndIf

RestArea(aArea)
Return lRet

/*
##  FUNวAO VALIDAวรO DO LOTE DIGITADO
*/
Static Function VldLote()

Local lRet  := .T.
Local _cProd := GetMv("LT_PRTRIBU")

If Select("VLLOTE") <> 0
	DbSelectArea("VLLOTE")
	VLLOTE->(DbCloseAre())
EndIf

BeginSql alias "VLLOTE"

	SELECT Count(*) as QTDREG FROM %Table:SD3% D3 
	WHERE D3_FILIAL = %xFilial:SD3%
	AND D3_COD = %EXP:_cProd% 
	AND D3_LOTECTL = %Exp:_cLoteD3%
	AND D3.%NotDel%
EndSql

VLLOTE->(DbGoTop())
If VLLOTE->QTDREG > 0
	lRet := .f.
EndIf

If !lRet
	xMagHelpFis("Validacao Lote",;
	"O lote digitado jแ foi utilizado para esta filial!",;
	"Digite um c๓digo vแlido.")

EndIf                  


Return(lRet)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ VldMotor บ Autor ณ Jeovane               บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para validar motorista digitado na tela de Recepcao de leite                                    บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
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
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function VldMotor(cMotor, nOpc )

Local lRet  := .T.
Local aArea := GetArea()

If lPlataforma
	cMotor := ""
	cDescMot := ""
	Return .T.
EndIf

If !Empty(cMotor)
	
	dbSelectArea("ZL0")
	ZL0->(dbSetOrder(1))
	lRet := ZL0->(dbSeek(xFILIAL("ZL0")+cMotor))
	
	cDescMot := ZL0->ZL0_NOME
	
	If lRet
		
		If ZL0->ZL0_FRETIS != cFretist
			
			xMagHelpFis("Atencao - Validacao",;
			"O Motorista selecionado nao pertence ao Transportador!",;
			"Selecione um motorista relacionado ao Transportador!")
			lRet:=.F.
			
		EndIf
		
	Else
		
		xMagHelpFis("INFORMAวรO",;
		"O motorista informado nใo esta cadastrado no sistema.",;
		"Favor fornecer um c๓digo correto do motorista.")
		
	EndIf
	
EndIf                  

If lRet .AND. nOpc == 3
//	GetLinPrd(aHeader, cFretist,cLjFret, cMotor)
EndIf


RestArea(aArea)

Return(lRet)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณmenuDef   บ Autor ณ Jeovane               บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para criar menu da tela MBrowse de Recepcao de leite                                            บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑณRetorno   ณ Array com opcoes da rotina                                                                                   ณฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑณParametrosณParametros do array a Rotina:                               													บฑฑ
ฑฑณ          ณ1. Nome a aparecer no cabecalho                             													บฑฑ
ฑฑณ          ณ2. Nome da Rotina associada                                 													บฑฑ
ฑฑณ          ณ3. Reservado                                                													บฑฑ
ฑฑณ          ณ4. Tipo de Transao a ser efetuada:                        													บฑฑ
ฑฑณ          ณ 	  1 - Pesquisa e Posiciona em um Banco de Dados           													บฑฑ
ฑฑณ          ณ    2 - Simplesmente Mostra os Campos                       													บฑฑ
ฑฑณ          ณ    3 - Inclui registros no Bancos de Dados                 													บฑฑ
ฑฑณ          ณ    4 - Altera o registro corrente                         													บฑฑ
ฑฑณ          ณ    5 - Remove o registro corrente do Banco de Dados        													บฑฑ
ฑฑณ          ณ5. Nivel de acesso                                          													บฑฑ
ฑฑณ          ณ6. Habilita Menu Funcional                                                                                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Array com opcoes da rotina	  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function MenuDef()

Private aRotina	:=  {;
{OemToAnsi("Pesquisar") ,"AxPesqui"      , 0 , 1 ,0 ,.F.},;//"Pesquisar"
{OemToAnsi("Visualizar"),"Eval(bVisual)" , 0 , 2 ,0 ,Nil},;//"Visualizar"
{OemToAnsi("Incluir")   ,"Eval(bInclui)" , 0 , 3 ,0 ,Nil},;//"Incluir"
{OemToAnsi("Alterar")   ,"Eval(bAltera)" , 0 , 4 ,0 ,Nil},;//"Alterar"
{OemToAnsi("Excluir")   ,"Eval(bExclui)" , 0 , 5 ,0 ,Nil},;//"Excluir"
{OemToAnsi("Imp.Ticket") ,"Eval(bRelCupom)"  , 0 , 4 ,0 ,Nil},;//Imprime Ticket em impressora matricial de cupom
{OemToAnsi("Cons.Descarte") ,"Eval(bConsdesc)"  , 0 , 4 ,0 ,Nil},;//Consulta descarte do leite 
{OemToAnsi("Legenda")   ,"Eval(bLegenda)", 0 , 2 ,0 ,.F.} }//"Legenda"


//{OemToAnsi("Desv.Rota") ,"Eval(bDesvRota)", 0 , 4 ,0 ,Nil},;//"Desv.deRota"

Return (aRotina)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณGetNumRec บ Autor ณ Jeovane               บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para pegar numero maximo de recebimento                                                         บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
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
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function GetNumRec()

Local cRet   := ""
Local cQuery := ""
Local aArea  := GetArea()

cQuery := "SELECT MAX(ZLD_CODREC) AS ULTIMO FROM "
cQuery += RetSqlName("ZLD") + " WHERE D_E_L_E_T_ = ' ' "
cQuery += "  AND ZLD_FILIAL = '" + xFILIAL("ZLD") + "'"

If Select("TRB") > 0
	dbSelectArea("TRB")
	TRB->(dbCloseArea())
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRB',.F.,.T.)

If TRB->(!Eof())
	cRet := soma1(TRB->ULTIMO)
EndIf

dbSelectArea("TRB")
TRB->(dbCloseArea())

While !MayIUseCode("ZLD_CODREC" + xFilial("ZLD") + cRet)  //verifica se esta na memoria, sendo usado
	cRet := Soma1(cRet)						           // busca o proximo numero disponivel
EndDo

RestArea(aArea)

Return cRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณlegenda   บ Autor ณ Jeovane               บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para criar legenda na tela de Recepcao de leite                                                 บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
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
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function Legenda(aCores)

Local aLegenda := {}

aAdd(aLegenda,{"BR_VERDE"   ,"Aberto"}) //Sem Status
aAdd(aLegenda,{"BR_PRETO"   ,"Descartado"}) //Sem Status
aAdd(aLegenda,{"BR_VERMELHO"   ,"Faturado"}) //Sem Status
BrwLegenda(cCadastro,"Legenda",aLegenda) //"Legenda"

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณGetCores  บ Autor ณ Jeovane               บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para criar array aCores, usado na legenda                                                       บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ array com cores da legenda                                                            						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function GetCores()
Local aCores:= {;
{ 'ZLD->ZLD_STATUS==" "', 'BR_VERDE'		},;
{ 'ZLD->ZLD_STATUS=="D"', 'BR_PRETO'		},;
{ 'ZLD->ZLD_STATUS=="F"', 'BR_VERMELHO'		}}
Return aCores


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณGetTotCol บ Autor ณ Jeovane               บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para calcular total de uma coluna da getDados                                                   บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ nCol - Especifica qual coluna deve sumarizar                                          						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Total da Coluna especificada pelo parametro nCol                                      						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User function GetTotCol()

Local nRet := 0
Local i
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Obtem posicao da coluna de quantidade de leite       ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
nCol:=ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_QTDBOM"})
//Alterado 03/12/14 - Guilherme Fran็a - Somar valor total, inclusive com agua. Serแ usado para movimenta็a๕ do estoque.
//nCol:=ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_BRTBOM"})

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Se exist aCols e Linha nao deletada soma qtd         ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If Type("aCols") != "U"
	For i := 1 To Len(aCols)
		If !aTail(aCols[i])
			If ValType(aCols[i,nCol]) == "N"
				nRet += aCols[i,nCol]
			EndIf
		EndIf
	Next i
EndIf

nRet:=nVolAnt+nRet

Return nRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณGetAcols  บ Autor ณ Jeovane               บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para atualizar variavel Private aColsAux, que eh usada para controle de alteracao/exclusao      บฑฑ
ฑฑบ          ณ do registro da ZLD   											                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ array com cores da legenda                                                            						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function GetAcols()

Local aArea := GetArea()
Local nI    := 0

If Type("aCols") != "U"
	aColsAux := aClone(aCols)
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Atualiza campo nomeRetiro na getdados                ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
For nI := 1 To Len(aCols)
	If ((!Empty(aCols[nI,nPosRetiro])) .And. (!Empty(aCols[nI,nPosLoja])) )
		aCols[nI,nPosNomRet] := POSICIONE("SA2",1,xFILIAL("SA2")+aCols[nI,nPosRetiro]+aCols[nI,nPosLoja],"A2_NOME")
	EndIf
Next nI

RestArea(aArea)
Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ InsZLD   บ Autor ณ Jeovane               บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para inserir registros na ZLD                                                                   บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ aRegs - Matriz com registros a serem inseridos na ZLD                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function InsZLD(aRegs)

Local cTpPagFret:= "" //POSICIONE("ZL3",1, xFILIAL("ZL3")+cLinRot+cTipLR,"ZL3_FRMPG")
Local nVrLitro 	:= 0 //SuperGetMv("LT_VRFRELT")  //Busca valor do frete por litro de leite
Local nValKM 	:= 0 //SuperGetMv("LT_VRFREKM")  //Busca valor do frete por Km
Local nValDia 	:= 0 //SuperGetMv("LT_VRFREDI")  //Busca Valor do frete por dia
Local nVrFrete 	:= 0
Local nValTot 	:= 0
Local nProp 	:= 0
Local bOk       := .T.
Local nX        := 0
Local nTicket := ""

Local _nPosTrib := 0

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณArmazena o tipo de tributacao de cada item inserido na recepcao de leite.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
Private _aTribut:= {}


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Grava  Mov.Interno caso seja inclusao ou alteracao.  ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If INCLUI .Or. ALTERA
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Gera numeracao do codigo da recepcao (ZLD_CODREC).   ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	dbSelectArea("ZL2")
	dbSetOrder(1)
	dbSeek(xFILIAL("ZL2")+cSetor)
	
	
	//	If INCLUI
	//	nTicket := StrZero(VAL(ZL2->ZL2_TICKET) - 1,6 )
	//		IF  cTicket < cValtoChar(nTicket)
	//		MsgAlert (" Ticket Invแlido, favor lan็ar novamente a recep็ใo, e conferir todos os dados do lan็amento ")
	//	Return ()
	//EndIf
	// EndIf
	
	cCodRec := GetNumRec()

	//So gera SD3 se o STATUS estiver em branco, pois no descarte nใo gera estoque.
	If _cStatus == "D"

		If MsgYesNo("Confirma inclusใo deste movimento como descarte de leite?"+_ENTER;
					+"Produtor:"+_cCodDesc+" "+Posicione("SA2",1,xFilial("SA2")+_cCodDesc+_cLjDesc,"A2_NOME")+_ENTER;
					+"Quantidade:"+cValToChar(nQtdDesc)+" litros.","DESCARTE DE LEITE")
			ConfirmZLN(2,_cCodDesc,_cLJDesc,nQtdDesc,dDtColeta) //Grava ZLN com o descarte

			bOk := GeraSD3(cCodRec,3,cTicket,_cLoteD3,"D1",nQtdDesc) //Gera movimento do volume de descarte em armazem especifico
			bOk := GeraSD3(cCodRec,3,cTicket,_cLoteD3,"D2",nQtdDesc) // Gera movimento do volume bom no armazem padrใo.			
		Else
			// Se nใo confirmar, gera movimenta็ใo normal no estoque
			_cStatus := ""
			bOk := GeraSD3(cCodRec,3,cTicket,_cLoteD3)
		EndIf
	Else
		bOk := GeraSD3(cCodRec,3,cTicket,_cLoteD3)
	EndIf
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Se gravou SD3 entao grava recepcao                   ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ`ฤฤฤฤฤฤฤฤฤู
If bOk
	// -----------------------------------------------------
	// Se nao houver nenhum item grava um registro em branco
	// Apenas para gerar estoque
	// -----------------------------------------------------
	If Len(aRegs) == 1 .And. Empty(aRegs[1,nPosRetiro]) .And. Empty(aRegs[1,nPosQtdBom])
		If nTotBom <> 0
			RecLock("ZLD",.T.)
			
			ZLD->ZLD_FILIAL		:= 	xFILIAL("ZLD")
			ZLD->ZLD_CODREC		:= 	cCodRec
			ZLD->ZLD_TICKET		:=  cTicket
			ZLD->ZLD_DTLANC		:=  dData
			ZLD->ZLD_DTCOLE		:= 	dDtColeta
			ZLD->ZLD_SETOR 		:= 	cSetor
			ZLD->ZLD_FRETIS		:=	cFretist
			ZLD->ZLD_LJFRET		:= 	cLjFret
			ZLD->ZLD_VEICUL		:= 	cVeicul
			ZLD->ZLD_MOTOR		:= 	cMotor
			ZLD->ZLD_KM	  		:= 	nTotKm
			ZLD->ZLD_KMTERR	  	:= 	nTotKmT			
			ZLD->ZLD_TEMPCA     := nTempCamin
			ZLD->ZLD_STATUS		:= 	_cStatus
			ZLD->ZLD_USER 		:= cUser
			ZLD->ZLD_TOTBOM		:= nTotBom
			ZLD->ZLD_ROTCAB		:= cRotCab
			ZLD->ZLD_DESCAB 	:= cDescRot
			//		ZLD->ZLD_DTREC 		:= cDtRec
			ZLD->ZLD_HORDES		:= cHrRec
			//ZLD->ZLD_DTCOLP 	:= cDtColPro
			ZLD->ZLD_LOTE	:= _cLoteD3
			ZLD->ZLD_TKPESO	:= 	cTktPeso
			
			ZLD->(MsUnLock())
			ZLD->(dbCommit())
			            
			//GrvMedVaz(_aMedVaz, cTicket)
			
			// Baixa o ticket de pesagem que foi utilizado na recep็ใo.
			If _lUsaBalanca
				U_BxTicket(xFilial("ZLD"),cTktPeso,"B")
			EndIf
			
		EndIf
		
	EndIf
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณPercorre todos os itens dispostos na tela de recepcao.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	For nX := 1 To Len(aRegs)
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณVerifica se o item nao esta deletado.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		If !aTail(aRegs[nX])
			
			If (aRegs[nX,nPosQtdBom]!=0 .And. !Empty(aRegs[nX,nPosRetiro]) .And. !Empty(aRegs[nX,nPosLoja]))
				
				//nProp  := (aRegs[nX,nPosQtdBom]) / (nTotBom) //Acha proporcao pelo volume do produtor e volume total
				
				/*
				//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
				//ณVerifica o tipo de tributacao que foi gerada para o produtor corrente.ณ
				//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
				*/
				_nPosTrib:= aScan(_aTribut,{|P| P[1] == aRegs[nX,nPosItem]})
				
				If aRegs[nX,nPosQtdBom] <> 0
					RecLock("ZLD",.T.)
					
					ZLD->ZLD_FILIAL		:= 	xFILIAL("ZLD")
					ZLD->ZLD_CODREC		:= 	cCodRec
					ZLD->ZLD_TICKET		:=  cTicket
					ZLD->ZLD_DTLANC		:=  dData
					ZLD->ZLD_DTCOLE		:= 	dDtColeta
					ZLD->ZLD_SETOR 		:= 	cSetor
					ZLD->ZLD_ITEM       :=  aRegs[nX,nPosItem]
					ZLD->ZLD_RETIRO		:= 	aRegs[nX,nPosRetiro] // aRegs[nX,nPosRetiro]+aRegs[nX,nPosLoja]
					ZLD->ZLD_RETILJ		:= 	aRegs[nX,nPosLoja]
					ZLD->ZLD_GRPRC		:= 	aRegs[nX,nPosGrupo]
					ZLD->ZLD_DCRRET		:=  aRegs[nX,nPosNomRet]
					//ZLD->ZLD_LINROT		:= 	aRegs[nX,nPosLinha]
					ZLD->ZLD_LINROT		:= 	aRegs[nX,ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_LINROT"})]
					ZLD->ZLD_VERSAO		:=  aRegs[nX,nPosVersao]
					//ZLD->ZLD_DESLIN		:=  aRegs[nX,nPosDesLin]
					ZLD->ZLD_DESLIN		:=  aRegs[nX,ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_DESLIN"})]
					ZLD->ZLD_FRETIS		:=	cFretist
					ZLD->ZLD_LJFRET		:= 	cLjFret
					ZLD->ZLD_VEICUL		:= 	cVeicul
					ZLD->ZLD_MOTOR		:= 	cMotor
					ZLD->ZLD_QTDBOM		:= 	aRegs[nX,nPosQtdBom]
					//				ZLD->ZLD_BRTBOM		:= 	aRegs[nX,nPosBrtBom]
					//				ZLD->ZLD_QTDACI		:= 	aRegs[nX,nPosBrtAci]//aRegs[nX,nPosQtdAcid]
					//				ZLD->ZLD_BRTACI		:= 	aRegs[nX,nPosBrtAci]
					ZLD->ZLD_QTDH2O		:= 	aRegs[nX,nPosPctH2O]
					ZLD->ZLD_DESH2O		:= 	aRegs[nX,nPosPctDes]
					ZLD->ZLD_KM			:= 	nTotKm
					ZLD->ZLD_KMTERR	  	:= 	nTotKmT								
					ZLD->ZLD_TEMPCA     := nTempCamin
					ZLD->ZLD_STATUS		:= 	_cStatus
					ZLD->ZLD_USER 		:= cUser
					ZLD->ZLD_TOTBOM		:= nTotBom
					ZLD->ZLD_ROTCAB 	:= cRotCab
					ZLD->ZLD_DESCAB 	:= cDescRot
					ZLD->ZLD_HORA  		:= 	aRegs[nX,nPosHora]
					ZLD->ZLD_TEMP  		:= 	aRegs[nX,nPosTemp]
					ZLD->ZLD_REGUA 		:= 	aRegs[nX,nPosRegua]
					ZLD->ZLD_TRIBUT     := 'I' // _aTribut[_nPosTrib,2]
					//				ZLD->ZLD_COLANA     := aRegs[nX,nPosColAna]
					ZLD->ZLD_IMPORT 	:= 'D' //aRegs[nX,nPosImp]
					//				ZLD->ZLD_DTREC 		:= cDtRec
					ZLD->ZLD_HORDES		:= cHrRec
					ZLD->ZLD_LOTE	:= _cLoteD3
					ZLD->ZLD_TKPESO	:= 	cTktPeso					
					
					/*				ZLD->ZLD_DTCOLP 	:= aRegs[nX,nPosDtColP]
					//				ZLD->ZLD_CODTAN		:= Posicione("ZLT",2,xFILIAL("ZLT")+aRegs[nX,nPosRetiro]+aRegs[nX,nPosLoja],"ZLT_COD")
					//				ZLD->ZLD_TITULA		:= Posicione("ZLT",2,xFILIAL("ZLT")+aRegs[nX,nPosRetiro]+aRegs[nX,nPosLoja],"ZLT_TITULA")
					
					If ZLD->ZLD_TITULA != "S" .And. ZLD->ZLD_TITULA != "N"
					ZLD->ZLD_TITULA := "S"
					ZLD->ZLD_CODTAN := aRegs[nX,nPosRetiro]+aRegs[nX,nPosLoja]
					EndIf
					
					*/
					
					// C32247
					// codSetor := Posicione("ZL3",1,xFILIAL("ZL3")+SA2->A2_L_LI_RO,"ZL3_SETOR")
					
					//ZLD->ZLD_FILENT		:= U_GetFilEnt(aRegs[nX,nPosRetiro],aRegs[nX,nPosLoja],dDtColeta)
					
					//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
					//ณ Comentado, pois de acordo com a regra de negocio da EMPRESA nao existe a                 ณ
					//ณ necessidade na recepcao de leite de efetuar os calculos de pagamento do transportador.   ณ
					//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
					ZLD->ZLD_VFRELT := 0
					ZLD->ZLD_VFREPR := 0
					//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
					//ณ Calcula vlr do frete                                 ณ
					//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
					/*
					If cTpPagFret == "L"
					nVrFrete := nVrLitro *  aRegs[nX,nPosQtdBom]
					ZLD->ZLD_VFRELT := nVrLitro
					ZLD->ZLD_VFREPR := nVrFrete
					ElseIf cTpPagFret == "K"
					nValTot := nTotkm * nValKM
					ZLD->ZLD_VFRELT := (nValTot * nProp) / aRegs[nX,nPosQtdBom]
					ZLD->ZLD_VFREPR := (nValTot * nProp)
					ElseIf cTpPagFret == "F"
					ZLD->ZLD_VFRELT := (nValDia * nProp) / aRegs[nX,nPosQtdBom]
					ZLD->ZLD_VFREPR := (nValDia * nProp)
					EndIf
					*/
					
					ZLD->(MsUnLock())
					ZLD->(dbCommit())
					
					// Grava dados da leitura do medidor de vazใo.					
					//GrvMedVaz(_aMedVaz, cTicket)

				EndIf
			EndIf
			
		EndIf
		
	Next nX
	
EndIf

Return bOk

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณGeraSD3   บ Autor ณ TOTVS                 บ Data da Criacao  ณ 07/10/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para gravar o movimento interno no estoque                                                      บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum                                                                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function GeraSD3(cCod,nOption,xcTicket,xcLote,xcTpDesc,xnQtdDesc)

Local aAutoSD3  	:= {}
Local cTm       	:= ALLTRIM(GetMv("LT_ENTTM")) //Cod. do Tipo do Mov.Interno do Recto de Leite
Local cTmAss       	:= ALLTRIM(GetMv("LT_TMASS")) //Cod. do Tipo do Mov.Interno para associa็ใo que emite NF
Local cLocal    	:= ""
Local bRet      	:= .T.
Local nI        	:= 0
Local nModBkp   	:= nModulo
Local cModBkp   	:= cModulo
Local cFilBkp   	:= cFilAnt
Local aQtdFil   	:= {}
Local _nQtdMov	:= nTotBom
Local _aDadosSD3	:= {}

Local _cDadosSD3	:= ""

Local _lRastro      := GetMv("MV_RASTRO") == "S"  //Verifica se o sistema efetuara o controle de rastreabilidade
Local _cLote        := ""
Local F
Local _aArea        := GetArea()
Local _cCustoD3	:= 0
Local _lCusto	:= .f. //TM gera custo na SD3
Local _nDias := 4

If !_lGeraSD3
	Return .t. // Se nใo gera SD3 a fun็ใo retorna positivo sem movimentar.
EndIf

DEFAULT xcLote := ""
DEFAULT xcTpDesc := "" //Movimento de descarte D1 ou D2
DEFAULT xnQtdDesc := 0 //Quantidade descartada
_cLote	:= xcLote

Private lMsErroAuto := .F.
Private lMsHelpAuto := .T.


If xcTpDesc ==  "D1"
	_nQtdMov := xnQtdDesc
	cLocal := Alltrim(GetMv("LT_LOCDESC")) // Armazem utilizado para lan็amento de produto a ser descartado.
	If !Empty(cLocal)
		//Alert("O armazem de descarte nใo foi informado no parโmetro LT_LOCDESC! O descarte serแ lan็ado no armazem padrใo!")
		//cLocal := "" //Comentado por Tarcisio Silva, estava carregando a zl2 no final, ele tem que carregar ้ a do parametro mesmo. 
	EndIf
	_cLote := "DES"+xcTicket
ElseIf xcTpDesc ==  "D2"
	_nQtdMov := _nQtdMov - xnQtdDesc
EndIf

//Se opcao eh Incluir
If nOption == 3
	If !(_nQtdMov > 0)
		Return .t.
	EndIf
	//Posiciona no de Tipos de Movimentos
	dbSelectArea("SF5")
	dbSetOrder(1)
	If !dbSeek(xFILIAL("SF5") + cTm)
		xMagHelpFis("Parametro - SX6","O codigo de Movimento Interno (SF5) " + cTm + " nใo foi encontrado.","Preencha corretamente o parโmetro LT_ENTTM.")
		Return(.F.)
	EndIf
	_lCusto := (SF5->F5_AGREGCU == '1')
	//Posiciona no cadastro de Setor
	dbSelectArea("ZL2")
	dbSetOrder(1)//ZL2_FILIAL+ZL2_COD
	dbSeek(xFILIAL("ZL2") + cSetor)
	
	cLocal  := IIF(Empty(cLocal),ZL2->ZL2_LOCAL,cLocal)
	nVlrMix := ZL2->ZL2_ULTMIX
	
	If nVlrMix <= 0
		xMagHelpFis("Vlr. MIX","O valor do custo do produto nใo foi preenchido no cadastro de Setor!","Preencha o valor do custo de entrada no estoque no cadastro de Setor.")
		Return(.F.)
	EndIf
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณInserido para que fosse realizada                                 ณ
	//ณa distincao na recepcao de leite dos produtors em:                ณ
	//ณ                                                                  ณ
	//ณTRIBUTADO - ISENTO - DIFERIDO                                     ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	_aDadosSD3:= GetTribut(aCols)
	
	For F:=1 to Len(_aDadosSD3)
		
		aAutoSD3    := {}
		lMsHelpAuto := .T.
		lMsErroAuto := .F.
		nModulo     := 4
		cModulo     := "EST"
		
		//Posiciona no cadastro de Produtos
		dbSelectArea("SB1")
		dbSetOrder(1)
		dbSeek(xFILIAL("SB1") + _aDadosSD3[F,3])
		
		//Posiciona na tabela de Saldos em Estoque
		//Se nao encontrar o produto na tabela de saldos,
		//inclui saldo inicial para o produto.
		//dbSelectArea("SB2")
		//SB2->(dbSetOrder(1))
		// #PEDRO
		//		If !SB2->(dbSeek(xFILIAL("SB2") + SB1->B1_COD + cLocal))
		//			CriaSB2(SB1->B1_COD,cLocal)
		//		EndIf
		_cQuery := " SELECT Count(*) as COUNT "
		_cQuery += " FROM "+RetSqlName("SB2")+" SB2  "
		_cQuery += " WHERE " + RetSqlCond("SB2") + " "
		_cQuery += " AND B2_COD = '"+SB1->B1_COD+"' "
		_cQuery += " AND B2_LOCAL = '"+cLocal+"' "
		_cQuery += " AND SB2.D_E_L_E_T_ = ' '"
		If Select ("EST") <> 0
			EST->(dbCloseArea())
		EndIf
		
	   //	_cQuery := changeQuery(_cQuery)
		
		dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery),"EST",.F.,.T.)
		
		EST->(dbGoTop())
		
		If EST->(Eof())
			CriaSB2(SB1->B1_COD,cLocal)
		EndIf
		
		EST->(DBCLOSEAREA())
		_cCustoD3	:= 0
		
		AAdd( aAutoSD3,{"D3_FILIAL"     , xFilial("SD3")			, Nil } )// Codigo da Filial
		AAdd( aAutoSD3,{"D3_TM"		    , cTm 				        , Nil } )// Tipo do Movimento Interno
		AAdd( aAutoSD3,{"D3_COD"		, SB1->B1_COD  	            , Nil } )// Codigo do Produto
		AAdd( aAutoSD3,{"D3_UM"		    , SB1->B1_UM		        , Nil } )// Unidade de Medida
		AAdd( aAutoSD3,{"D3_QUANT"	    , _nQtdMov		    	, Nil } )// Quantidade de Leite -- nTotCodRec = soma das coletas dos produtores
			_cCustoD3	:= nVlrMix*_nQtdMov

		AAdd( aAutoSD3,{"D3_LOCAL"	    , cLocal		 , Nil } )// Almoxarifado
		//AAdd( aAutoSD3,{"D3_EMISSAO"	, dData 			        , Nil } )// Data de Emissao
		AAdd( aAutoSD3,{"D3_EMISSAO"	, dDtColeta			        , Nil } )// Data de Emissao
		AAdd( aAutoSD3,{"D3_DOC"	    , "GLT"+xcTicket	 , Nil } )// Documento  //GetSxeNum("SD3","D3_DOC")
		If _lCusto
			AAdd( aAutoSD3,{"D3_CUSTO1"	    , _cCustoD3 		, Nil } )// Custo (na Moeda 1)
		EndIf
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณVerifica se o parametro MV_RASTRO esta configurado para gerar rastreabilidadeณ
		//ณe se o produto foi configurado  para rastrear por sub-lote ou lote.          ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		If _lRastro .And. SB1->B1_RASTRO $ ('S','L')
			
			_cLote:= IIF(Empty(_cLote),Alltrim(xFilial("SF2"))+xcTicket,_cLote)//U_SiglaFil(xFilial("SF2"))+xcTicket//pesqLote(dDtColeta,cTm)
			_nDias := IIF(SB1->B1_PRVALID>0,SB1->B1_PRVALID,4)
			AAdd( aAutoSD3,{"D3_LOTECTL"	, _cLote			    , Nil } )	// Lote
			AAdd( aAutoSD3,{"D3_DTVALID"	, dDtColeta + _nDias   	, Nil } )	// Data de validade do lote
			
		endif
		
		AAdd( aAutoSD3,{"D3_L_ORIG"	    , cCod   				    , Nil } )// Origem do documento - Ticket
		AAdd( aAutoSD3,{"D3_L_SETOR"	, cSetor  			        , Nil } )// Setor do documento
		
		Pergunte("MTA240",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto
		MSExecAuto({|x,y| MATA240(x,y)},aAutoSD3,3)
		
		
		Pergunte("AGLT003",.F.) // Volta as perguntas do programa principal
		
		If lMsErroAuto
			xMagHelpFis("SigaAuto - MATA240","Nใo foi possivel executar o SigaAuto de Inclusใo de Movimento Interno.","Ap๓s confirmar esta mensagem, verifique os detalhes no Log do SigaAuto.")
			MostraErro()
			bRet := .F.
			exit
		EndIf
		
	Next F
	
	//Senao se opcao eh Excluir ou Alterar
Else
	
	_cDadosSD3:=GetNextAlias()
	BeginSql alias _cDadosSD3
		SELECT
		D3_NUMSEQ,
		D3_CHAVE,
		D3_COD,
		D3_DOC,
		D3_CF
		FROM
		%Table:SD3%
		WHERE
		D_E_L_E_T_ = ' '
		AND D3_ESTORNO <> 'S'
		AND D3_L_ORIG  = %Exp:cCod%
		AND D3_L_SETOR = %Exp:cSetor%
		AND D3_FILIAL  = %Exp:xFilial("SD3")%
	EndSql
	
	_aQuery := GETLastQuery()
	
	dbSelectArea(_cDadosSD3)
	(_cDadosSD3)->(dbGoTop())
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณCaso nao encontre nenhuma movimentacao interna a ser excluida.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	If !(_cDadosSD3)->(Eof())
		
		While !(_cDadosSD3)->(Eof())
			
			aAutoSD3    := {}
			lMsHelpAuto := .T.
			lMsErroAuto := .F.
			nModulo     := 4
			cModulo     := "EST"
			
			//	dbSelectArea("SD3")
			//	SD3->(dbSetOrder(2))
			//	If SD3->(dbSeek(xFilial("SD3") + (_cDadosSD3)->D3_DOC + (_cDadosSD3)->D3_COD))
			
			AAdd( aAutoSD3,{"D3_FILIAL" , xFilial("SD3")  			, Nil } )// Filial
			AAdd( aAutoSD3,{"D3_NUMSEQ" , (_cDadosSD3)->D3_NUMSEQ  , Nil } )// Nro sequencial do movimento
			AAdd( aAutoSD3,{"D3_CHAVE"	, (_cDadosSD3)->D3_CHAVE	, Nil } )// Chave de busca do registro
			AAdd( aAutoSD3,{"D3_COD"	, (_cDadosSD3)->D3_COD   	, Nil } )// Codigo do Produto
			//AAdd( aAutoSD3,{"D3_DOC"	, (_cDadosSD3)->D3_DOC	    , Nil } )// Nro do documento
			//AAdd( aAutoSD3,{"D3_CF"	    , (_cDadosSD3)->D3_CF      , Nil } )// Codigo do Tipo do Movimento
			AAdd( aAutoSD3,{"INDEX"	    , 4                         , Nil } )// Indice
			//SD3->(dbSetOrder(4))
			
			Pergunte("MTA240",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto
			MSExecAuto({|x,y| MATA240(x,y)},aAutoSD3,5)
			
			Pergunte("AGLT003",.F.) // Volta as perguntas do programa principal
			
			If lMsErroAuto
				xMagHelpFis("SigaAuto - MATA240","Nใo foi possivel executar o SigaAuto de Exclusใo de Movimento Interno.","Ap๓s confirmar esta mensagem, verifique os detalhes no Log do SigaAuto.")
				MostraErro()
				bRet := .F.
				exit
			EndIf
			
			//	EndIf
			
			(_cDadosSD3)->(dbSkip())
			
		EndDo
		
	Else
		xMagHelpFis("Mov. Int - SD3","Nใo foi encontrado o movimento interno para essa Recep็ใo de Leite.","A exclusใo do Movimento Interno nใo serแ executada.")
		bRet := .F.
	EndIf
	
	dbSelectArea(_cDadosSD3)
	(_cDadosSD3)->(dbCloseArea())
EndIf

//Restaura os valores das variaveis padroes
nModulo := nModBkp
cModulo := cModBkp
cFilAnt := cFilBkp

restArea(_aArea)

Return(bRet)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ ExistMi  บ Autor ณ Abrahao               บ Data da Criacao  ณ 09/10/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada verificar se existe um movimento interno relativo a entrada                                     บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum                                                                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function ExistMi(cCod,cpSetor)

Local lRet := .F.

_cQuery := " SELECT Count(*) AS QTDE FROM "+RetSqlName("SD3")+" SD3 ""
_cQuery += " WHERE D_E_L_E_T_ = ' '"
_cQuery += " AND D3_ESTORNO <> 'S'"
_cQuery += " AND D3_L_ORIG  = '"+cCod+"'"
_cQuery += " AND D3_L_SETOR = '"+cpSetor+"'"

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(_cQuery))),'TRB',.F.,.T.)

If TRB->(!Eof()) .And. TRB->QTDE > 0
	lRet := .T.
EndIf

TRB->(dbCloseArea())
TRB->(dbCloseArea())
Return(lRet)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณDelZLD    บ Autor ณ Jeovane               บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para apagar registros na ZLD                                                                    บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ aRegs - Matriz com registros a serem apagados na ZLD                                  						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function DelZLD(aRegs,_cCdRecepc)

Local aArea    := GetArea()
Local nI       := 0
Local _cTicket := ""

dbSelectArea("ZLD")

//ZLD_FILIAL+ZLD_CODREC+ZLD_RETIRO+ZLD_RETILJ+ZLD_ITEM
ZLD->(dbSetOrder(1))
For nI := 1 To Len(aRegs)
	
	If ZLD->(dbSeek(xFILIAL("ZLD") + _cCdRecepc + aRegs[nI,nPosItem]))
		
		If Empty(_cTicket) 
			_cTicket := ZLD->ZLD_TKPESO
		EndIf
		
		RecLock("ZLD",.F.)
		
		ZLD->(dbDelete())
		
		ZLD->(MsUnLock())
		
//		dbSelectArea("ZLK")
		
		
	EndIf
	
Next nI

// Libera o ticket de pesagem para uso
If _lUsaBalanca
	U_BxTicket(xFilial("ZLD"),_cTicket,"E")
EndIf


/*
// Exclui informa็๕es do medidor de vazใo para disponibilizar para nova leitura se necessแrio.
If .f. //!Empty(_cTicket) .AND. Select("ZLK") > 0  ### coloquei false pra anular o IF 08/06/17

	dbSelectArea("ZLK")
	dbSetOrder(2)
	If ZLK->(dbSeek(xFilial("ZLK") + _cTicket ))
		RecLock("ZLK", .F.)
		ZLK->(dbDelete())
		ZLD->(MsUnLock())
	EndIf
	
EndIf
*/
RestArea(aArea)

Return

//Caique lugar correto 
Static Function UpdZX1(cFilZLD,cTicket)
Local cQuery := " "
Local lSqlOk := .T.

	cQueryUpd := ""
	cQueryUpd += "UPDATE ZX1010 SET ZX1_STATUS = ' '"		+ STR_PULA
	cQueryUpd += " WHERE   ZX1010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQueryUpd += "         AND   ZX1_FILIAL"		+ STR_PULA
	cQueryUpd += "            || ZX1_ITEM"		+ STR_PULA
	cQueryUpd += "            || ZX1_DTCOLE"		+ STR_PULA
	cQueryUpd += "            || ZX1_SETOR"		+ STR_PULA
	cQueryUpd += "            || ZX1_RETIRO"		+ STR_PULA
	cQueryUpd += "            || ZX1_RETILJ"		+ STR_PULA
	cQueryUpd += "            || ZX1_QTDBOM"		+ STR_PULA
	cQueryUpd += "            || ZX1_LINROT"		+ STR_PULA
	cQueryUpd += "            || ZX1_VERSAO"		+ STR_PULA
	cQueryUpd += "            || ZX1_VEICUL"		+ STR_PULA
	cQueryUpd += "            || ZX1_MOTOR IN"		+ STR_PULA
	cQueryUpd += "                  (SELECT      ZLD_FILIAL"		+ STR_PULA
	cQueryUpd += "                            || ZLD_ITEM"		+ STR_PULA
	cQueryUpd += "                            || ZLD_DTCOLE"		+ STR_PULA
	cQueryUpd += "                            || ZLD_SETOR"		+ STR_PULA
	cQueryUpd += "                            || ZLD_RETIRO"		+ STR_PULA
	cQueryUpd += "                            || ZLD_RETILJ"		+ STR_PULA
	cQueryUpd += "                            || ZLD_QTDBOM"		+ STR_PULA
	cQueryUpd += "                            || ZLD_LINROT"		+ STR_PULA
	cQueryUpd += "                            || ZLD_VERSAO"		+ STR_PULA
	cQueryUpd += "                            || ZLD_VEICUL"		+ STR_PULA
	cQueryUpd += "                            || ZLD_MOTOR"		+ STR_PULA
	cQueryUpd += "                     FROM   ZLD010"		+ STR_PULA
	cQueryUpd += "                    WHERE       ZLD010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQueryUpd += "                            AND ZLD_TICKET = '" +cTicket+"'"		+ STR_PULA
	cQueryUpd += "                            AND ZLD_FILIAL = '" +cFilZLD+"')"		+ STR_PULA
	

	MemoWrite("C:\temp\ZX1LIMPAFLAG_update.sql",cQueryUpd)

	lSqlOk := !(TCSQLExec(cQueryUpd) < 0)
	if lSqlOk .and. (TcGetDB() == 'ORACLE')
		lSqlOk := !(TCSQLExec("COMMIT") <0)
		MSGInfo("Processo concluido com sucesso UPDATE LIMPA FLAG 2 ZX1 Importado." + cTicket  + cFilZLD )
	endif
	
	If !lSqlOk
		msginfo("ERRO QUERY UPDATE limpeza ZX1")
		msginfo(TCSQLError())
		msginfo("Verifiquei a Sintaxe da Query.")
	endif


return 


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ Alterou  บ Autor ณ Jeovane               บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para verificar se houve alteracao na getDados                                                   บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ aRegs - Matriz com registros a serem inseridos na ZLD                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function Alterou(aVet1,aVet2)

Local lRet := .T.
LOcal i, j
//Se o tamanho For diferente retorna .T.
If Len(aVet1) != Len(aVet2)
	Return lRet
EndIf

//Varre os vetores para saber se houve alteracao
For i := 1 To Len(aVet2)
	For j := 1 To Len(aVet2[i])
		lRet := aVet2[i,j] == aVet1[i,j]
		If !lRet
			Return !lRet
		EndIf
	Next j
Next i

Return !lRet


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GetdFret บ Autor ณ Abrahao               บ Data da Criacao  ณ 17/10/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao que busca setor,linha,veiculo padroes do Fretista e lanca nas variaveis                               บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ aRegs - Matriz com registros a serem inseridos na ZLD                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function GetdFret(a_cod,a_lj)

Local cArea  := GetArea()
Local bret   := .F.
Local _cAlias:= GetNextAlias()

If Empty(a_lj)
	If Select("TLJ")>0
		DbSelectArea("TLJ")
		TLJ->(DbCloseArea())
	EndIf
	BeginSql alias "TLJ"
		SELECT MIN(A2_LOJA) AS LJ FROM %Table:SA2% A2 WHERE A2_COD = %Exp:a_cod% AND A2_MSBLQL <> "1" AND A2.D_E_L_E_T_ = ' '
	EndSql
	
	DbSelectArea("TLJ")
	cLjFret := a_lj :=	TLJ->LJ
EndIf


If INCLUI
	If Empty(a_lj) .Or. nOpc==4
		Return
	EndIf
	
	cQuery := "SELECT * FROM "
	cQuery += RetSqlName("ZLW") + " WHERE D_E_L_E_T_ = ' ' "
	cQuery += "  AND ZLW_FILIAL = '" + xFILIAL("ZL3") + "'"
	cQuery += "  AND ZLW_FRETIS = '" + a_cod + "'"
	cQuery += "  AND ZLW_FRETLJ = '" + a_lj + "'"
	cQuery += "  AND ZLW_MSBLQL <> '1'"
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),_cAlias,.F.,.T.)
	
	dbSelectArea(_cAlias)
	(_cAlias)->(dbGoTop())
	
	If !(_cAlias)->(Eof())
		
		//As linhas abaixo foram comentadas
		//Pois a linha passou a incorporar os itens e nao mais o cabecalho da recepcao
		//cLinRot := (_cAlias)->ZL3_COD
		//cDescLin:= POSICIONE("ZL3",1,xFILIAL("ZL3")+cLinRot,"ZL3_DESCRI")
		cSetor	:= (_cAlias)->ZLW_SETOR
		cDescSet:= POSICIONE("ZL2",1,xFILIAL("ZL2")+cSetor,"ZL2_DESCRI")
		
		
		cVeicul := (_cAlias)->ZLW_VEICUL
		
		//Linha comentada em detrimento do codigo logo abaixo
		//cMotor  := POSICIONE("ZL4",1,xFILIAL("ZL4")+cVeicul,"ZL4_MOTORI")
		dbSelectArea("ZL4")
		ZL4->(dbSetOrder(1))
		If ZL4->(dbSeek(xFILIAL("ZL4")+cVeicul))
			
			cMotor    := ZL4->ZL4_MOTORI
			cPlacaVeic:= ZL4->ZL4_PLACA
			
		EndIf
		
		cDescMot:= POSICIONE("ZL0",1,xFILIAL("ZL0")+cMotor,"ZL0_NOME")
		
		GetNwTicket(.T.)
		bret := .T.
		
	EndIf
	
	dbSelectArea(_cAlias)
	(_cAlias)->(dbCloseArea())
	
	If !bRet
		If MsgYesNo("Atencao, esse Transportador nใo estแ vinculado a nenhuma rota! Continuar assim mesmo?","Valida็ใo Cadastro")
			bRet:=.T.
		EndIf
	EndIf
Else
	bRet:=.T.
EndIf

RestArea(cArea)
Return bRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ IsExist  บ Autor ณ Abrahao               บ Data da Criacao  ณ 24/12/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao que verifica se existe um determinado valor em um determinado campo de uma tabela                     บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implntacaao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Valor, Tabela, Campo                                                                 						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function IsExist(cpVlr,cTab,cpCmpName)

Local cRet    := .F.
Local cQuery  := ""
Local aArea   := GetArea()
Local nT1     := 0
Local nT2     := 0
Local cFrtAnt := ""
Local cLjAnt  := ""
Local dLanc   := CTOD("")

If Empty(ALLTRIM(cpVlr))
	GetNwTicket(.T.)
	cpVlr := cTicket
EndIf

cQuery := "SELECT * FROM "
cQuery += RetSqlName(cTab) + " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND "+cTab+"_FILIAL = '" + xFILIAL(cTab) + "'"
cQuery += " AND "+cpCmpName+" = '" + cpVlr + "'"
cQuery += " AND "+cTab+"_SETOR = '" + cSetor + "'"

If Select("TRB") > 0
	dbSelectArea("TRB")
	TRB->(dbCloseArea())
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRB',.F.,.T.)

While TRB->(!Eof())
	nT1     += TRB->ZLD_QTDBOM
	nT2     := TRB->ZLD_TOTBOM
	cFrtAnt := TRB->ZLD_FRETIS
	cLjAnt  := TRB->ZLD_LJFRET
	dLanc   := STOD(TRB->ZLD_DTCOLE)
	cRet    := .T.
	TRB->(dbSkip())
EndDo

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Zera variaveis - Caso mude o num. do ticket          ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
nVolAnt   := 0
nLeiteBom := 0
nTotBom   := 0

If cRet
	If MsgYesNo("O Ticket digitado jแ existe! Deseja complementar os lancamentos desse Ticket?")
		nVolAnt 	:= nT1
		nLeiteBom 	:= nT1
		nTotBom 	:= nT2
		nLtDIf 		:= nTotBom-nLeiteBom
		cRet	    :=.F.
		lAbleTicket := .F.
	Else
		lAbleTicket := .T.
	EndIf
EndIf

dbSelectArea("TRB")
TRB->(dbCloseArea())

RestArea(aArea)
Return cRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ GetNwTicket บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para pegar numero maximo do Ticket               บฑฑ
ฑฑบ          ณ                                                               บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                               บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GetNwTicket(lValid)

Local cRet    := ""
Local lRet    := .F.
Local cQuery  := ""
Local aArea   := GetArea()

If lValid
	If !Empty(ALLTRIM(cTicket))
		Return .T.
	EndIf
EndIf

dbSelectArea("ZL2")
dbSetOrder(1)
dbSeek(xFILIAL("ZL2")+cSetor)
If Found() .And. xFILIAL("ZL2")+cSetor == ZL2->ZL2_FILIAL+ZL2->ZL2_COD

	cRet:= U_MaxCodigo("ZLD_TICKET")
	
	cRet := StrZero(Val(cRet)+1,6)
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ
	//ณ Tratamento para evitar que dois usuarios cadastrem o mesmo codigo ao mesmo tempo. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ
	While !MayIUseCode("ZLD" +xFilial("ZLD")+cRet)  //verifica se esta na memoria, sendo usado
		cRet := StrZero(Val(cRet)+1,6)				   // busca o proximo numero disponivel
	EndDo


	If Empty(ALLTRIM(cRet))
		cRet:=StrZero(1,6)
	EndIf
	RecLock("ZL2",.F.)
	ZL2->ZL2_TICKET:=soma1(cRet)
	MsUnLock()
	cTicket := cRet
	lRet:=.T.
Else
	xMagHelpFis("Setor","Setor nao encontrado!","Selecione um Setor vแlido!")
	If Empty(ALLTRIM(cSetor))
		lRet:=.T.
	EndIf
EndIf

_cLoteD3 := Alltrim(xFilial("SF2"))+cTicket //Alterado por Tarcํsio Silva

ZL2->(dbCloseArea())
RestArea(aArea)
Return lRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ CheckCod บ Autor ณ Microsiga          บ Data ณ  12/17/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function CheckCod(cpCod)

Local nQtd := 0

While !Empty(POSICIONE("ZLD",1,xFILIAL("ZLD")+cpCod,"ZLD_CODREC"))
	cpCod := GetSxeNum("ZLD","ZLD_CODREC")
	nQtd++
	If nQtd > 10
		xMagHelpFis("Erro","Erro na tentativa de obter um codigo de registro para recepcao de leite!","Comunique o Suporte!!!")
		Exit
	EndIf
EndDo

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  NoMoreTicket บAutor|Abrahao             บ Data ณ  09/01/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Verifica se o ticket nao existe no setor apontado          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function NoMoreTicket(cCod,cpSetor)

Local lRet := .F.
Local nCt  := 0

_cQuery := " SELECT ZLD_TICKET,ZLD_CODREC "
_cQuery += " FROM "+RetSqlName("ZLD")+" ZLD "
_cQuery += " WHERE "
_cQuery += " D_E_L_E_T_ = ' '"
_cQuery += " AND ZLD_TICKET = '"+cCod+"'"
_cQuery += " AND ZLD_SETOR  = '"+cpSetor+"'"
_cQuery += " GROUP BY ZLD_TICKET,ZLD_CODREC"

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(_cQuery))),'TRB',.F.,.T.)

While TRB->(!Eof())
	nCt++
	TRB->(dbSkip())
EndDo
TRB->(dbCloseArea())
TRB->(dbCloseArea())

If nCt==1
	lRet := .T.
EndIf

Return(lRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ BuscaVol บ Autor ณ Guilherme Franca   บ Data ณ  28/12/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Obtem volume da pesagem da balan็a atravez de fun็ใo      บฑฑ
ฑฑบ          ณ especifica da Mococa.                                      บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParam     ณ Codigo da rececao, Ticket, Setor                           บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function BuscaVol(xcFil,xcTktPeso)

nTotBom := Round(U_BuscaPeso(xcFil,xcTktPeso),0)

Return .t.
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ GetVolAntบ Autor ณ TOTVS              บ Data ณ  09/01/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Obtem volume fisico dos ticket lancados anteriormente.     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParam     ณ Codigo da rececao, Ticket, Setor                           บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GetVolAnt(cpCodRec,cpTicket,cpSetor)

Local aArea := GetArea()
Local nRet:=0

cQuery := "SELECT SUM(ZLD_QTDBOM) AS QTDVOL "
cQuery += " FROM "+RetSqlName("ZLD") + " ZLD "
cQuery += " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND ZLD_FILIAL = '"  + xFILIAL("ZLD") + "'"
cQuery += " AND ZLD_CODREC != '" + cpCodRec       + "'"
cQuery += " AND ZLD_TICKET = '"  + cpTicket       + "'"
cQuery += " AND ZLD_SETOR = '"   + cpSetor        + "'"

If Select("TRB") > 0
	dbSelectArea("TRB")
	TRB->(dbCloseArea())
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRB',.F.,.T.)

If TRB->(!Eof())
	nRet:=TRB->QTDVOL
EndIf
TRB->(dbCloseArea())

RestArea(aArea)
Return nRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGetMotFrt บ Autor ณ TOTVS              บ Data ณ  09/01/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Obtem motorista padrao do Fretista.                        บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GetMotFrt()

Local cRet
Local aArea := GetArea()

cQuery := "SELECT ZL0_COD FROM "
cQuery += RetSqlName("ZL0") + " ZL0 WHERE D_E_L_E_T_ = ' ' "
cQuery += "  AND ZL0_FRETIS = '" + cFretist + "'"
cQuery += "  AND ZL0_FRETLJ = '" + cljFret + "'"

If Select("TRB") > 0
	dbSelectArea("TRB")
	TRB->(dbCloseArea())
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRB',.F.,.T.)

If TRB->(!Eof())
	cRet := TRB->ZL0_COD
EndIf

TRB->(dbCloseArea())
RestArea(aArea)
Return cRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGetVerRotบ Autor ณDaniel Montagna              บ Data ณ  10/10/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Obtem a Versao Da Rota                         บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ GATILHO ZLD_LINROT 001                                     บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function GetVerRot(_xcRota)

Local _cRota := _xcRota
Local cRet
Local _aArea := GetArea()

cRet := GatilhoZLW(_cRota)[3]

RestArea(_aArea)
Return cRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGetDesRotบ Autor ณ            บ Data ณ  10/10/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Obtem a Descri็ใo Da Rota                         บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function GetDesRot(aLinha)

Local aLinha
Local aArea := GetArea()
Local cRet
Local _dDtColeta 	:= dDtColeta
dbSelectArea("ZLW")
dbSetOrder(1)

_dDtColeta := DTOS(_dDtColeta)


/*
cQuery := "SELECT ZLW_DESCRI "
cQuery += " FROM "+RetSqlName("ZLW")
cQuery += " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND ZLW_FILIAL = '"  + xFILIAL("ZLW") + "'"
cQuery += "  AND ZLW_COD = '" + aLinha + "'"
cQuery += " AND ZLW_MSBLQL <> '1' "
*/

cQuery := " SELECT ZLW_DESCRI"
cQuery += " FROM "+RetSqlName("ZLW")+" ZLW "
//	cQuery += " WHERE ZLW.ZLW_MSBLQL = 2 "
cQuery += " WHERE ZLW.ZLW_SETOR = '" + cSetor + "' "
cQuery += " AND ZLW.D_E_L_E_T_ = ' ' "
cQuery += " AND ( ( '" + _dDtColeta + "' BETWEEN ZLW.ZLW_DATINI and ZLW.ZLW_DATFIM ) OR ZLW.ZLW_DATFIM = '' ) "
cQuery += "  AND ZLW.ZLW_COD = '" + aLinha + "'"
cQuery += " ORDER BY ZLW.ZLW_COD "

If Select("TRB") > 0
	dbSelectArea("TRB")
	TRB->(dbCloseArea())
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRB',.F.,.T.)



If TRB->(!Eof())
	cRet := TRB->ZLW_DESCRI
else
	nPosLinha := ExistCpo("ZLW",M->ZLD_LINROT,1)
	nPosDesLin := " "
endif



TRB->(dbCloseArea())
RestArea(aArea)
Return cRet


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGetLteFil บ Autor ณ Microsiga          บ Data ณ  28/09/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao utilizada para buscar Total de Leite por filial.     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GetLteFil(aRegs)

Local aRet   := {} //Filial,Quantidade
Local nI     := 0
Local nCusto := 0
Local aArea  := GetArea()

For nI := 1 To Len(aRegs)
	If !aTail(aRegs[nI])	 //Verifica se item esta deletado
		If (aRegs[nI,nPosQtdBom]!=0 .And. !Empty(aRegs[nI,nPosRetiro]) .And. !Empty(aRegs[nI,nPosLoja]))
			
			//Tratamento para Unidade de negocio.
			If Len(ALLTRIM(cFilAnt)) > 2
				cFilTmp := cEmpAnt + "01" + U_GetFilEnt(aRegs[nI,nPosRetiro],aRegs[nI,nPosLoja],dDtColeta)
			Else
				cFilTmp := U_GetFilEnt(aRegs[nI,nPosRetiro],aRegs[nI,nPosLoja],dDtColeta)
			EndIf
			
			/*
			//Tratamento do custo do produto por produtor
			dbSelectArea("SA2")
			dbSetOrder(1)
			dbSeek(xFILIAL("SA2")+aRegs[nI,nPosRetiro]+aRegs[nI,nPosLoja])
			nCusto := SA2->A2_L_VRMIX
			*/
			
			//Tratamento do custo do produto por Setor
			nCusto := nVlrMix
			
			//Tratamento para movimentar no SD3 o volume do veiculo
			/*
			If !Empty(cFilTmp)
			AADD(aRet,{cFilTmp,nTotBom})
			Exit
			EndIf
			*/
			
			//Tratamento para movimentar no SD3 o volume do produtor
			nPosFil := ascan(aRet,{|x| x[1] == cFilTmp})
			If nPosFil == 0
				AADD(aRet,{cFilTmp,aRegs[nI,nPosQtdBom],aRegs[nI,nPosQtdBom]*nCusto})
			Else
				aRet[nPosFil,2] += aRegs[nI,nPosQtdBom]
				aRet[nPosFil,3] += aRegs[nI,nPosQtdBom]*nCusto
			EndIf
		EndIf
	EndIf
Next nI

RestArea(aArea)
Return(aRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ VldTikt  บ Autor ณ Microsiga          บ Data ณ  28/09/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Completa o codigo do ticket com 06 digitos.                บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function VldTikt()

If Len(ALLTRIM(cTicket)) < 6
	cTicket := StrZero(Val(cTicket),6)
EndIf

oTicket:Refresh()
Return(.T.)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ coletor     บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para que o usuario informe onde esta a           บฑฑ
ฑฑบ          ณ localizacao do arquivo do coletor a ser importado e chamar a  บฑฑ
ฑฑบ          ณ funcao de importacao do arquivo do coletor.                   บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function coletor()

Private _cPerg:= "AGLT003"

ValidPerg()

If pergunte(_cPerg,.T.)
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณVerifica se foi fornecido um arquivo do coletor a ser importado.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	If Len(AllTrim(MV_PAR01)) > 0
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Inicializa o processamento de leitura do arquivo do coletor.		ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		
		Processa({|| lerColetor() },"Processando...")
		
	EndIf
	
EndIf

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ medidor     บ Autor ณ TOTVS    บ Data ณ  10/10/2013 บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Leitura do medidor de vazใo.                                  บฑฑ
ฑฑบ          ณ                                                               บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function Medidor()
	U_AGLT304()
Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ lerColetor  บ Autor ณ Daniel Montagna    บ Data ณ  10/10/2013
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para realizar a importacao do arquivo gerado peloบฑฑ
ฑฑบ          ณ coletor.                                                      บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function lerColetor()

Local _aArea    := GetArea()
Local _aDados   := {}
Local _aArq	:= {}
Local _cAlias   := ""
Local _cDesAssoc:= ""
Local _cLinha   := ""
Local _cDesLinha:= ""
Local _nNumLinh := 1
Local _cItem    := 1
Local _aLinProbl:= {}
Local _cLinhas  := ""
Local _gPreco	:= ""
Local _cVerLinha:= ""
Local _cCodCoope:= ""
Local _cLjCoope := ""
Local _cColAna := ""
Local _nCont:=1
Local _nLeiteCab := ""
Local _nLinCab := ""
Local _nLast := ""
Local _nCodTrans:=""
Local _lArqInvalido := .t.
Local _nSerie:=""
Local _dDtColeta 	:= dDtColeta
Local _cTribu :=""
Local _cDtCol :=""
Local _nTemp := 0
Local _nKmA	:= 0
Local _nKmT	:= 0


If FT_FUSE(MV_PAR01) == -1         //fOpen(_cNomeArq,68)
	
	xmaghelpfis("Arquivo invแlido",;
	"Nใo foi possํvel abrir o arquivo informado.",;
	"Favor verificar se o arquivo informado esta correto, ou se jแ foi importado .imp")
	
	Return
	
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Armazena o nome do arquivo para renomea-lo depois de importado.       ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู


_cArqImp := AllTrim(MV_PAR01)

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Valida se o arquivo tem extensao IMP, ou seja, ja foi importado.      ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If UPPER(Substr(MV_PAR01,Len(AllTrim(MV_PAR01))-2,3)) == "IMP"
	xmaghelpfis("Arquivo invอกlido",;
	"O arquivo informado jอก foi importado anteriormente.",;
	"Favor selecionar um arquivo com a extensaoo ATH. ")
	
	Return
EndIf


If FT_FLASTREC() == 0 .And. _lRet   //O arquivo informado nao possui nenhuma linha de dados
	
	xmaghelpfis("Arquivo invแlido",;
	"O arquivo informado para relizar a importa็ใo nใo possui dados.",;
	"Favor verificar se o arquivo informado esta correto.")
	
	Return
	
EndIf

ProcRegua(FT_FLASTREC())

FT_FGOTOP()                          //PONTO NO TOPO


aCols:={}

IF( _nNumLinh == 1 ) // primeira linha do arquivo , referente ao cabe็alho
	_aArq := StrTokArr(FT_FREADLN(),";")
	If Len(_aArq)>6
		_cDtCol := _aArq[1]//Substr(FT_FREADLN(),45,8)
		_nCodTrans := _aArq[3]//Substr(FT_FREADLN(),11,5) // Transportadora
		_nLeiteCab := _aArq[8] //Substr(FT_FREADLN(),35,10) //1 QTD TOT LEITE VEIC	CABEวALHO
		_nLinCab := _aArq[5] //Substr(FT_FREADLN(),3,6) // 2 LINHA CABECALHO
		_nKMA := VAL(_aArq[6]) //Substr(FT_FREADLN(),20,3)
		_nKMT := VAL(_aArq[7])//Substr(FT_FREADLN(),20,3)

		nTempCamin := VAL(_aArq[4])
		FT_FSKIP()
	Else
		xmaghelpfis("Arquivo invแlido",;
		"O arquivo informado para relizar a importa็ใo nใo possui dados.",;
		"Favor verificar se o arquivo informado esta correto.")
		
		Return
			
	EndIf
ENDIF

cFretist :=  _nCodTrans
nTotBom := val(_nLeiteCab)
cDescSet:= POSICIONE("ZL2",1,xFILIAL("ZL2")+ZLD->ZLD_SETOR,"ZL2_DESCRI")
cDescMot := POSICIONE("ZL0",1,xFILIAL("ZL0")+ZLD->ZLD_MOTOR,"ZL0_NOME")
cPlacaVeic:= POSICIONE("ZL4",1,xFILIAL("ZL4")+ZLD->ZLD_VEICUL,"ZL4_PLACA")
cSetor:= POSICIONE("ZL2",1,xFILIAL("ZL2")+ZLD->ZLD_SETOR,"ZL2_COD")
cRotCab:= _nLinCab
cDescRot   := POSICIONE("ZLW",1,xFILIAL("ZLW")+cRotCab,"ZLW_DESCRI")
nTotKM := _nKMA
nTotKMT := _nKMT
GetdFret(cFretist,'01')
//cDtRec := Stod(_cDtCol)  // data de inicio da coleta


While !FT_FEOF()  //FACA ENQUANTO NAO FOR FIM DE ARQUIVO
	
	_aArq := StrTokArr(FT_FREADLN(),";")	
	_cDesAssoc:= ""
	_cLinha   := ""
	_cDesLinha:= ""
	_cVerLinha:= ""
	_cCodCoope:= ""
	_cLjCoope:=""
	_nCodTrans:=""
	_cTribu :=""
	
	IncProc("Processando validacoes, favor aguarde!")
	
	
/*	
	aAdd(_aDados,{_nLeiteCab, ;
	_nLinCab, ;
	Substr(FT_FREADLN(),10,5), ; //3  PRODUTOR CODIGO cortado o 0
	Substr(FT_FREADLN(),15,2), ; // 4  LOJA
	Substr(FT_FREADLN(),67,10), ; //5 QTD LEITE PRODUTOR
	Substr(FT_FREADLN(),88,3), ; //6 TEMPERATURA PRODUTOR INT
	Substr(FT_FREADLN(),91,2), ;  //7  TEMERATURA PRODUTOR DEC
	Substr(FT_FREADLN(),77,10), ; //8 REGUA
	Substr(FT_FREADLN(),206,6), ;   //9 COLETA PRODUTOR	HORA
	Substr(FT_FREADLN(),95,1),; //10  COLETA ANมLISE SIM OU NรO
	Substr(FT_FREADLN(),198,8)})
*/	
	aAdd(_aDados,{_nLeiteCab, ;
	_nLinCab, ;
	_aArq[1], ; //3  PRODUTOR CODIGO cortado o 0
	_aArq[2], ; // 4  LOJA
	_aArq[3], ; //5 QTD LEITE PRODUTOR
	_aArq[5], ; //6 TEMPERATURA PRODUTOR INT
	_aArq[6], ;  //7  ROTA PRODUTOR
	_aArq[7], ; //8 grupo preco
	_aArq[4], ;   //9 COLETA PRODUTOR	HORA
	"",; //10  COLETA ANมLISE SIM OU NรO
	""})


	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณQuery para efetuar a consulta da descricao do produtor e sua ณ
	//ณrespectiva linha.                                            ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	_cAlias:=GetNextAlias()
	_cCodCoope:=  Alltrim(_aDados[_nCont][3])
	_cLjCoope := _aDados[_nCont][4]
	//querys(_nOpcao,_cAlias,_cCodAssoc,_cLojAssoc,_dEmisLote,_cTM,_cCodRecep)
//	querys(1,_cAlias,_cCodCoope, _cLjCoope)
	
	
	dbSelectArea("SA2")
	DbSetOrder(1)
	If DbSeek(xFilial("SA2")+_cCodCoope+ _cLjCoope)
	_cDesAssoc:= SA2->A2_NOME
	_cTribu:= SA2->A2_L_TRIBU
	_gPreco:= SA2->A2_L_LI_RO
		
		IF(_cTribu==" " )
			MsgAlert("Favor preencher o tipo de tributa็ใo do Produtor,  " + _cCodCoope + " ,campo A2_L_TRIBU,       NรO confirme a recep็ใo.")
		ENDIF
	
	EndIf
	
	
	BeginSql  alias _cAlias
		
		/*SELECT
		ZLY_DESROT, ZLY_VERSAO, ZLY_MSBLQL
		FROM
		%Table:ZLY% ZLY
		WHERE
		ZLY.D_E_L_E_T_ = ' '
		AND ZLY.ZLY_MSBLQL <> 1
		AND ZLY.ZLY_ROTA = %Exp:_nLinCab%
		
		EndSql
		*/
		
		SELECT ZLW_COD , ZLW_DESCRI, MAX(ZLW_VERSAO) ZLW_VERSAO
		FROM %TABLE:ZLW% ZLW
		WHERE ZLW.%NotDel%
		AND ZLW.ZLW_SETOR  = %EXP:cSetor%
		AND ( (   %Exp:_dDtColeta% BETWEEN ZLW.ZLW_DATINI and ZLW.ZLW_DATFIM ) OR ZLW.ZLW_DATFIM = ' ' )
		AND ZLW.ZLW_COD = %Exp:_nLinCab%
		GROUP BY ZLW_COD , ZLW_DESCRI
		
	EndSql
	
	
	
	_cDesLinha:= (_cAlias)->ZLW_DESCRI
	_cVerLinha:= (_cAlias)->ZLW_VERSAO
	//				_cBloqueio:=(_cAlias)->ZLY_MSBLQL
	
	IF VAZIO(_cDesLinha)
		MSGALERT( " Linha nใo encontrada, favor selecionar outro arquivo para importa็ใo e verificar o Cadastro de Rota " )
		Return  coletor()
	ENDIF
	
	
	
	//	 	IF(VAL(_cBloqueio)==1)    // Verifica se a rota estแ bloqueada
	//		MsgAlert("Rota Bloqueada , Favor verificar o Cadastro de rotas ou o arquivo de importa็ใo")
	//  	Return()
	//	ELSE
	
	
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณAdiciona os dados do coletor no acols.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	aAdd(aCols,Array(Len(aHeader)+1))
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Informa que a linha do Acols nao esta deletada. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	aCols[Len(aCols)][Len(aHeader)+1] := .F.
	
	aCols[Len(aCols)][nPosItem]  := StrZero(_cItem,3)							      //Item
	aCols[Len(aCols)][nPosLinha] := _aDados[_nCont][7] //_nLinCab  							  //Linha que se pertence o Produtor encontrada em seu cadastro
	aCols[Len(aCols)][nPosVersao] := _cVerLinha                             //Versao Da Linha
	aCols[Len(aCols)][nPosDesLinha] := _cDesLinha                             // Descri็ใo da Linha
	//aCols[Len(aCols)][nPosRetiro]:= _aDados[_nCont][3]							  //Codigo do Produtor
	aCols[Len(aCols)][nPosRetiro]:=_cCodCoope                                  //Codigo do Produtor
	aCols[Len(aCols)][nPosLoja]  := _aDados[_nCont][4]							  //Loja do Produtor
	aCols[Len(aCols)][nPosNomRet]:= _cDesAssoc							  //Descricao do Produtor
	aCols[Len(aCols)][nPosGrupo] := _aDados[_nCont][8]							  //Grupo Preco do Produtor
//	aCols[Len(aCols)][nPosBrtBom]:= Val(_aDados[_nCont][5])					  //Quantidade Bruta de Leite Bom
	aCols[Len(aCols)][nPosQtdBom]:= Val(_aDados[_nCont][5])					  //Quantidade Liquida de Leite Bom
//	aCols[Len(aCols)][nPosBrtAci]:= 0					  						//Quantidade Bruta de Leite Acido
//	aCols[Len(aCols)][nPosQtdAcid]:= 0					  						//Quantidade Liquida de Leite Acido
//	aCols[Len(aCols)][nPosPctH2o]:= 0
//	aCols[Len(aCols)][nPosPctDes]:= 0
	aCols[Len(aCols)][nPosTemp]  := Val(Transform(_aDados[_nCont][6],"@R 999.99"))//Temperatura
	aCols[Len(aCols)][nPosHora]  := SUBSTR(_aDados[_nCont][9],1,5)                        // Hora Coleta
	//aCols[Len(aCols)][nPosHora]  := _aDados[6] + ':' + _aDados[7]       //Hora no formato Hora:minutos
//	aCols[Len(aCols)][nPosRegua] := Val(_aDados[_nCont][8])/10                 //Regua
//	aCols[Len(aCols)][nPosTribut]:= "T"                                         //Tipo de Tributacao da recepcao de leite
//	aCols[Len(aCols)][nPosColAna]:=   _aDados[_nCont][10]
//	aCols[Len(aCols)][nPosImp]:= "I"
//	aCols[Len(aCols)][nPosDtColP]:= Stod(_cDtCol) //Stod(_aDados[_nCont][11])
	
	
	
	_cItem++
	_nCont++
	_nNumLinh++
	
	FT_FSKIP()   //pr๓ximo registro no arquivo txt
	
	// atualizar os valores de somat๓ria na rota
	nLeiteBom := nVolAnt+U_GetTotCol()
	nTotCodRec:= U_GetTotCol()
	nLtDIf    := nTotBom-nLeiteBom
	
	
	
	
	// ENDIF
EndDo

dbSelectArea(_cAlias)
(_cAlias)->(dbCloseArea())




BeginSql  alias _cAlias
	
	SELECT SA2.A2_COD, SA2.A2_LOJA, SA2.A2_NOME, ZL0.ZL0_COD, ZL0.ZL0_NOME, ZL4.ZL4_NSERIE, ZL4.ZL4_COD
	FROM  %TABLE:SA2% SA2
	LEFT JOIN  %TABLE:ZL0% ZL0 ON (ZL0.D_E_L_E_T_ = ' ' AND ZL0.ZL0_FRETIS = SA2.A2_COD AND ZL0.ZL0_FRETLJ = SA2.A2_LOJA)
	LEFT JOIN  %TABLE:ZL4% ZL4 ON (ZL4.D_E_L_E_T_ =' ' AND ZL4.ZL4_MOTORI = ZL0.ZL0_COD )
	WHERE SA2.D_E_L_E_T_ = ' '
	AND SA2.A2_COD = %Exp:cFretist% AND SA2.A2_LOJA = '01'
	
	
EndSql

cLjFret :=  (_cAlias)->A2_LOJA
cDescFret:= (_cAlias) ->A2_NOME
cMotor:= (_cAlias)->ZL0_COD
cVeicul:=(_cAlias)->Zl4_COD

dbSelectArea(_cAlias)
(_cAlias)->(dbCloseArea())

BEGINSQL    alias _cAlias
	SELECT ZLW.ZLW_KM FROM %TABLE:ZLW% ZLW
	WHERE ZLW.ZLW_COD = %EXP:_nLinCab%
    AND ZLW.ZLW_MSBLQL <> '1'
	AND ZLW.ZLW_SETOR  = %EXP:cSetor%
	AND ( (   %Exp:_dDtColeta% BETWEEN ZLW.ZLW_DATINI and ZLW.ZLW_DATFIM ) OR ZLW.ZLW_DATFIM = ' ' )
ENDSQL

nTotKM:=(_cAlias)->ZLW_KM


GetNwTicket(.T.)

If !(Len(_aDados) > 0)
	xmaghelpfis("Falha de Processamento",;
	"Nใo foi possivel processar os dados do arquivo informado!",;
	"Verifique se a estrutura do mesmo encontra-se no padrใo, ou contacte o suporte.")
	Return Nil
EndIf

FT_FUSE(MV_PAR01) //Fecha o Arquivo

If _lArqInvalido
	If FRENAME(_cArqImp,Substr(_cArqImp,1,Len(_cArqImp)-3)+"IMP") == -1
		MsgAlert("Nใo foi possํvel renomear o arquivo: "+chr(13)+_cArqImp)
	EndIf
EndIf



Return





/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ querys      บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada p/ realizar as consultas SQL da recepcao de leiteบฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ _nOpcao - Numero da query a ser executada					 บฑฑ
ฑฑบ          ณ _cAlias - Alias da query										 บฑฑ
ฑฑบ          ณ _cCodAssoc - Codigo do Associado 							 บฑฑ
ฑฑบ          ณ _cLojAssoc - Loja do Associado								 บฑฑ
ฑฑบ			 ณ _dEmisLote - Data de emissao do movimento interno.            บฑฑ
ฑฑบ			 ณ _cCodRecep - Codigo da recepcao de leite.					 บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function querys(_nOpcao,_cAlias,_cCodAssoc,_cLojAssoc,_dEmisLote,_cTM,_cCodRecep)

Do Case
	
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณQuery utilizada na integracao com o coletor de dados para realuzar a busca ณ
	//ณde descricao de algumas informacoes referente ao produtor.                 ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	Case _nOpcao == 1
		
		BeginSql alias _cAlias
			SELECT
			SA2.A2_L_TRIBU,SA2.A2_L_LI_RO,SA2.A2_NOME,SA2.A2_L_LI_RO,ZL3.ZL3_DESCRI,ZL3.ZL3_SETOR,ZL2.ZL2_DESCRI
			FROM
			%Table:SA2% SA2
			JOIN %Table:ZL3% ZL3 ON ZL3.ZL3_COD = SA2.A2_L_LI_RO
			JOIN %Table:ZL2% ZL2 ON ZL2.ZL2_FILIAL = ZL3.ZL3_FILIAL AND ZL2.ZL2_COD = ZL3.ZL3_SETOR
			WHERE
			SA2.D_E_L_E_T_ = ' '
			AND ZL3.D_E_L_E_T_ = ' '
			AND ZL2.D_E_L_E_T_ = ' '
			AND SA2.A2_COD = %Exp:_cCodAssoc%
			AND SA2.A2_LOJA = %Exp:_cLojAssoc%
		EndSql
		
		
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณQuery para buscar o estado e a tributacao do produtor.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
	Case _nOpcao == 2
		
		BeginSql alias _cAlias
			SELECT
			A2_EST,A2_L_TRIBU
			FROM
			%Table:SA2% SA2
			WHERE
			D_E_L_E_T_ = ' '
			AND A2_COD = %Exp:_cCodAssoc%
			AND A2_LOJA = %Exp:_cLojAssoc%
		EndSql
		
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณQuery para bucar a numeracao do lote do dia, visto que a EMPRESAณ
		//ณvai adotar a mesma numeracao de lote dentro do mesmo dia.        ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
	Case _nOpcao == 3
		
		BeginSql alias _cAlias
			SELECT
			NVL(MAX(D3_LOTECTL),' ') NUMLOTE
			FROM
			%Table:SD3%
			WHERE
			D_E_L_E_T_ = ' '
			AND D3_FILIAL = %Exp:xFilial("SD3")%
			AND D3_TM = %Exp:_cTM%
			AND D3_EMISSAO = %Exp:DtoS(_dEmisLote)%
		EndSql
		
		
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณQuery para verificar se existe algum item da recep็ใo que foiณ
		//ณefetuado o fechamento.                                       ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
	Case _nOpcao == 4
		
		BeginSql alias _cAlias
			SELECT
			COUNT(*) NUMREG
			FROM
			%Table:ZLD%
			WHERE
			D_E_L_E_T_ = ' '
			AND ZLD_FILIAL = %Exp:xFilial("ZLD")%
			AND ZLD_CODREC = %Exp:_cCodRecep%
			AND ZLD_STATUS = 'F'
		EndSql
		
EndCase

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ GetTribut   บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para verificar de acordo com a litragem anual    บฑฑ
ฑฑบ          ณ fornecida de leite e o saldo da litragem a faixa de tributacaoบฑฑ
ฑฑบ          ณ em que se enquadra o produtor d acordo com a litragem correnteบฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GetTribut(aRegs)

Local Z			:= 1
Local K			:= 1
Local T			:= 1
Local _nPos		:= 0
Local _cAliasSA2:= ""
Local _aDadosTri:= {}
Local _aVolTpTri:= {}
Local _cCodPrTri:= GetMv("LT_PRTRIBU")//Armazena o codigo do produto usado na recep็ใo de leite do tipo TRIBUTADO.
Local _cCodPrIse:= GetMv("LT_PRISENT")//Armazena o codigo do produto usado na recep็ใo de leite do tipo ISENTO.
Local _cCodPrDif:= GetMv("LT_PRDIFER")//Armazena o codigo do produto usado na recep็ใo de leite do tipo DIFERIDO.

//Local _dDtFinal := dData - 1
//Local _dDtFinal := dDtColeta - 1

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณAlteracao efetuada  para que                                                     ณ
//ณa recepcao efetuada no dia 01 do mes 01 de qualquer ano nao seja                 ณ
//ณconsiderada para avaliacao de saldo da litragem anual pois para o calculo        ณ
//ณde tributacao nao se considera o dia de lancamento e como este eh o primeiro dia ณ
//ณdo ano nao deve haver calculo de tributacao.                                     ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณInidica que estamos no mes de janeiro no seu primeiro dia de qualquer ano.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If SubStr(DtoS(dDtColeta),5,4) == '0101'
	
	_dDtFinal:= dDtColeta
	
Else
	
	_dDtFinal := dDtColeta - 1
	
EndIf

_aTribut:= {}

For Z := 1 To Len(aRegs)
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณVerifica se a linha nao esta deletada.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	If !aTail(aRegs[Z])
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณSeleciona o estado atual do produtor.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		_cAliasSA2:= GetNextAlias()
		querys(2,_cAliasSA2,aRegs[Z,nPosRetiro],aRegs[Z,nPosLoja])
		
		dbSelectArea(_cAliasSA2)
		(_cAliasSA2)->(dbGoTop())
		
		If !(_cAliasSA2)->(Eof())
			/*
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณFuncao responsavel por pesquisar de acordo com a litragem de cada      ณ
			//ณassociado a faixa que o mesmo se enquadra, para definir uma recepcao deณ
			//ณleite do tipo: TRIBUTADA, ISENTA OU DIFERIDA.                          ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			*/
			_aVolTpTri:= U_AIncent(aRegs[Z,nPosRetiro],(_cAliasSA2)->A2_EST,aRegs[Z,nPosQtdBom],_dDtFinal,(_cAliasSA2)->A2_L_TRIBU,aRegs[Z,nPosLoja])
			
			_aVolTpTri[1][1] := 'T' //Fixa a tributa็ใo para T, para na๕ gerar movimenta็ใo de estoque diferente - Guilherme Fran็a 01/10/14
			/*
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณArmazena o tipo de tributacao da linha corrente, para posterior ณ
			//ณinsercao na tabela de insercao das entradas de leite(ZLD).      ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			*/
			aAdd(_aTribut,{aRegs[Z,nPosItem],_aVolTpTri[1,1]})
			
			/*
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณEfetua a aglutinacao do volume para posterior entrada na SD3 pelo tipo de tributacao.ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			*/
			_nPos:= aScan(_aDadosTri,{|W| W[1] == _aVolTpTri[1,1]})
			
			If _nPos == 0
				
				aAdd(_aDadosTri,{_aVolTpTri[1,1],_aVolTpTri[1,2],""})
				
			Else
				
				_aDadosTri[_nPos,2] += _aVolTpTri[1,2]
				
			EndIf
			
		EndIf
		
		dbSelectArea(_cAliasSA2)
		(_cAliasSA2)->(dbCloseArea())
		
	EndIf
	
Next Z

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณDefine os produtos de acordo com o tipo de tributacao.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
For T:=1 to Len(_aDadosTri)
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณProduto do tipo TRIBUTADO.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	If _aDadosTri[T,1] == "T"
		
		_aDadosTri[T,3]:= _cCodPrTri
		
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณProduto do tipo ISENTO.	 ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
	ElseIf _aDadosTri[T,1] == "I"
		
		_aDadosTri[T,3]:= _cCodPrIse
		
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณProduto do tipo DIFERIDO. ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
	Else
		
		_aDadosTri[T,3]:= _cCodPrDif
		
	EndIf
	
Next T

Return _aDadosTri

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ pesqLote    บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para verificar o numero do lote a ser utilizado  บฑฑ
ฑฑบ          ณ na geracao do movimento interno lembrando que sera adotado um บฑฑ
ฑฑบ          ณ mesmo numero de lote por dia.                                 บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ_dEmisLote - Data da realizacao da coleta para verificar a 	 บฑฑ
ฑฑบ			 ณ             numeracao do lote.                                บฑฑ
ฑฑบ			 ณ_cTM       - Codigo do tipo de movimentacao referente a entradaบฑฑ
ฑฑบ			 ณ             de leite.                                         บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ_cLote     - Caso ja tenha sido gerado um numero de lote para  บฑฑ
ฑฑบ			 ณ             o dia passado no parametro _dEmisLote sera 		 บฑฑ
ฑฑบ			 ณ             retornado o mesmo numero de lote, caso contrario  บฑฑ
ฑฑบ			 ณ             sera retornado vazio e o sistema automaticamente  บฑฑ
ฑฑบ			 ณ             gerara um numero de lote.                         บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function pesqLote(_dEmisLote,_cTM)

Local _cLote := ""
Local _aArea := GetArea()

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณO numeracao do lote nao pode ser pega via sql uma vez                         ณ
//ณque exite uma transacao para controlar todas as operacoes                     ณ
//ณe quando se executa a insercao de um movimento de entrada                     ณ
//ณque tenha mais de um produto e nao considera a numeracao ja gerada            ณ
//ณpara o dia, gerando uma nova numeracao para cada produto inserido na recepcao.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณQuery para bucar a numeracao do lote do dia, visto que a EMPRESA ณ
//ณvai adotar a mesma numeracao de lote dentro do mesmo dia.        ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
dbSelectArea("SD3")
SD3->(dbOrderNickName("LOTEGLT"))
If SD3->(dbSeek(xFilial("SD3") + DtoS(_dEmisLote) + _cTM))
	
	_cLote := SD3->D3_LOTECTL
	
EndIf

restArea(_aArea)

Return _cLote

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ reproTri    บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para realizar o reprocessamento da tributacao do บฑฑ
ฑฑบ          ณ leite mediante uma alteracao ou exclusao de uma determinada   บฑฑ
ฑฑบ          ณ recepcao de leite.                                            บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ _cCdRecepc - Codigo da recepcao de leite, este codigo eh      บฑฑ
ฑฑบ          ณ              unico por filial.                                บฑฑ
ฑฑบ          ณ _sDtLancam - Data de lancamento da recepcao de leite.		 บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function reproTri(_cOldCdRec,_dDtLanc,aRegs,_lDeleta)

Local _nNumReg  := 0
Local _aArea    := GetArea()
Local _cFilBkp  := cFilAnt
Local _cProAlias:= GetNextAlias()
Local _cAliasSD3:= ""
Local _dDtFinal := StoD(SubStr(DtoS(_dDtLanc),1,4) + '1231')
Local _cCdRecepc:= ""
Local _cCdSetor := ""
Local _sDtLancam:= ""
Local _cNumLote := ""
Local _lDeuErro := .F.

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณQuery para selecionar todas as recepcoes de leite independente de sua    ณ
//ณfilial que possuam produtores que fazem parte da recepcao que esta sendo ณ
//ณalterada ou excluida(recepcoes posteriores).                             ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
MsgRun("Aguarde... Selecionando recep็๕es para reprocessamento...",,{||CursorWait(), qrysRepr(1,_cProAlias,_cOldCdRec,_dDtLanc,_dDtFinal) , CursorArrow()})

dbSelectArea(_cProAlias)
(_cProAlias)->(dbGoTop())

COUNT TO _nNumReg

dbSelectArea(_cProAlias)
(_cProAlias)->(dbGoTop())

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณNa alteracao e exclusao existe a necessidade de se realizar   ณ
//ณa exclusao dos dados do registro que esta sofrendo a operacao,ณ
//ณmas no caso da inclusao nao existe tal necessidade.           ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If _lDeleta
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณExclui da tabela de movimentacao do leie a recepcao que esta sendoณ
	//ณalterada ou excluida, na alteracao ja foi incluida a outra recepcaณ
	//ณcom os dados atualizados se exclui neste momento, pois na query   ณ
	//ณacima se necessita desta recepcao.				                 ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	DelZLD(aRegs,_cOldCdRec)
	//Aqui
	
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณPercorre todas as recepcoes encontradas posteriormente a recepcao queณ
//ณfoi solicitada a sua alteracao ou exclusao.                          ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

ProcRegua(_nNumReg)

While !(_cProAlias)->(Eof()) .And. !_lDeuErro
	
	IncProc()
	
	_cCdRecepc:= (_cProAlias)->ZLD_CODREC
	_cCdSetor := (_cProAlias)->ZLD_SETOR
	_sDtLancam:= (_cProAlias)->ZLD_DTCOLE
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณEfetua o posicionamento na filial em que foi gerada a recepcao a ser reprocessada.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	cFilAnt:= (_cProAlias)->ZLD_FILIAL
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณSeleciona os dados do movimento interno que foi gerado pela recepcao a ser reprocessada.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	_cAliasSD3:= GetNextAlias()
	qrysRepr(2,_cAliasSD3,_cCdRecepc,"","",_cCdSetor)
	
	dbSelectArea(_cAliasSD3)
	(_cAliasSD3)->(dbGoTop())
	
	If !(_cAliasSD3)->(Eof())
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณArmazena a numeracao de lote que sera utilizada na nova inclusao de ณ
		//ณreprocessamento, referente a recepcao de leite corrente, a numeracaoณ
		//ณde lote eh a mesma para o mesmo dia.					               ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		_cNumLote:= (_cAliasSD3)->D3_LOTECTL
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณRealiza a exclusao de todos os movimentos internos encontrados referenteณ
		//ณa recepcao que esta sendo reprocessada.                                 ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		While !(_cAliasSD3)->(Eof())
			
			
			_lDeuErro:= delSD3((_cAliasSD3)->D3_DOC,(_cAliasSD3)->D3_COD,(_cAliasSD3)->D3_NUMSEQ,;
			(_cAliasSD3)->D3_CHAVE,(_cAliasSD3)->D3_CF)
			
			/*
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณCaso tenha dado erro sera interrompida toda a rotina de reprocessamento.ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			*/
			If _lDeuErro
				
				Exit
				
			EndIf
			
			
			dbSelectArea(_cAliasSD3)
			(_cAliasSD3)->(dbSkip())
		EndDo
		
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณEfetua o calculo da nova tributacao e insere os movimento internosณ
		//ณreprocessados referente a recepcao de leite corrente.             ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		If !_lDeuErro
			
			_lDeuErro:= repTriLt(_cCdRecepc,_sDtLancam,_cCdSetor,_cNumLote)
			
		EndIf
		
		
	EndIf
	
	dbSelectArea(_cAliasSD3)
	(_cAliasSD3)->(dbCloseArea())
	
	
	dbSelectArea(_cProAlias)
	(_cProAlias)->(dbSkip())
EndDo

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณRestaura a filial antes de iniciar a rotina de reprocessamento.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
cFilAnt := _cFilBkp
/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณFinaliza o alias que possui as recepcoes que foram processadas.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
dbSelectArea(_cProAlias)
(_cProAlias)->(dbCloseArea())

restArea(_aArea)

Return _lDeuErro

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ repTriLt    บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para realizar a inclusao dos movimentos internos บฑฑ
ฑฑบ          ณ referente ao reprocessamento das recepcoes de leite e efetuar บฑฑ
ฑฑบ          ณ a atualizacao na tabela de recepcao de leite ZLD com a nova   บฑฑ
ฑฑบ          ณ tributacao.                                                   บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ _cCdRecepc - Codigo da recepcao de leite, este codigo eh unicoบฑฑ
ฑฑบ          ณ              por filial.                                      บฑฑ
ฑฑบ          ณ _sDtLancam - Data de lancamento da recepcao de leite, para    บฑฑ
ฑฑบ          ณ              calculo da tributacao.							 บฑฑ
ฑฑบ          ณ _cSetor    - Setor que foi informado na recepcao de leite.	 บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function repTriLt(_cCdRecepc,_sDtLancam,_cSetor,_cLote)

Local _aTribSD3     := {}
Local cTm       	:= ALLTRIM(GetMv("LT_ENTTM")) //Cod. do Tipo do Mov.Interno do Recto de Leite
Local nVlrMix       := 0
Local cLocal        := ""
Local K

Private _lErro      := .F.

Private _aTribZLD   := {}

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณFuncao para realizar os calculos dos volumes de leite:ณ
//ณTRIBUADO, ISENTO E DIFERIDO.                          ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
_aTribSD3:= tribRepr(_cCdRecepc,_sDtLancam,_cSetor)
/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณCaso nao tenha encontrado nenhum produtor que tenha o statusณ
//ณfechado na recepcao de leite.                               ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
If !_lErro
	
	//Posiciona no de Tipos de Movimentos
	dbSelectArea("SF5")
	SF5->(dbSetOrder(1))
	If !SF5->(dbSeek(xFilial("SF5") + cTm))
		
		xMagHelpFis("Parametro - SX6",;
		"O codigo de Movimento Interno (SF5) " + cTm + " nใo foi encontrado.",;
		"Preencha corretamente o parโmetro LT_ENTTM.")
		Return .T.
		
	EndIf
	
	//Posiciona no cadastro de Setor
	dbSelectArea("ZL2")
	ZL2->(dbSetOrder(1))
	If !ZL2->(dbSeek(xFilial("ZL2") + _cSetor))
		
		xMagHelpFis("INFORMAวรO",;
		"O setor informado: " + _cSetor + " nใo existe no cadastro de setores",;
		"Favor comunicar ao departamento de informแtica do problema encontrada, pois desta forma nใo serแ possํvel concluir a opera็ใo.")
		Return .T.
		
	Else
		
		cLocal  := ZL2->ZL2_LOCAL
		nVlrMix := ZL2->ZL2_ULTMIX
	EndIf
	
	If nVlrMix <= 0
		
		xMagHelpFis("Vlr. MIX",;
		"O valor do custo do produto nใo foi preenchido no cadastro de Setor!",;
		"Preencha o valor do custo de entrada no estoque no cadastro de Setor.")
		Return .T.
		
	EndIf
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณInsere  os movimentos internos de acordo com os tipos de tributacao selecionados.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	For K:=1 to Len(_aTribSD3)
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณVerifica se houve algum problema na insercao do movimento interno.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		If !addSD3(_cSetor,_aTribSD3[K,3],_aTribSD3[K,2],StoD(_sDtLancam),_cCdRecepc,_cLote,cLocal,nVlrMix,cTm,cTicket)
			
			_lErro:= .T.
			Exit
			
		EndIf
		
	Next K
	
	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณCaso nao tenha encontrado problema o tipo de tributacao das recepcoesณ
	//ณprocessadas eh atualizado.                                           ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	If !_lErro
		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณPercorre todos os itens encontrados na recepcao de leite.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		For K:=1 to Len(_aTribZLD)
			
			dbSelectArea("ZLD")
			//ZLD_FILIAL+ZLD_CODREC+ZLD_ITEM
			ZLD->(dbSetOrder(1))
			If ZLD->(dbSeek(xFilial("ZLD") + _cCdRecepc + _aTribZLD[K,1]))
				
				RecLock("ZLD",.F.)
				
				ZLD->ZLD_TRIBUT:= _aTribZLD[K,2]
				
				MsUnLock()
				
			Else
				
				xMagHelpFis("INFORMAวรO",;
				"Nใo foi encontrado na recep็ใo de leite: " + _cCdRecepc + " item: " + _aTribZLD[K,1] + " na filial: " + xFilial("ZLD"),;
				"Favor comunicar o departamento de informแtica do problema encontrado, pois nใo serแ possํvel concluir a opera็ใo de reprocessamento")
				_lErro:= .T.
				Exit
			EndIf
			
		Next K
		
	EndIf
	
EndIf

Return _lErro

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ addSD3      บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para realizar a inclusao de um determinado       บฑฑ
ฑฑบ          ณ movimento interno que foi gerado a partir de uma recepcao do  บฑฑ
ฑฑบ          ณ leite.                                                        บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ cSetor     - Codigo do setor que foi informado na recepcao de บฑฑ
ฑฑบ          ณ              leite. 										     บฑฑ
ฑฑบ          ณ _cCodProd  - Codigo do Produto p/ geracao do movimento internoบฑฑ
ฑฑบ          ณ _nVolLeite - Volume de leite para insercao da quantidade do   บฑฑ
ฑฑบ          ณ              movimento interno.								 บฑฑ
ฑฑบ          ณ _dDtLanc   - Data de Lancamento da recepcao de leite, usada   บฑฑ
ฑฑบ          ณ              para ser a emissao do movimento interno.		 บฑฑ
ฑฑบ          ณ _cCodRecp  - Codigo da recepcao de leite p/ efetuar amarracao บฑฑ
ฑฑบ          ณ              do movimento interno com a recepcao de leite.    บฑฑ
ฑฑบ          ณ _cLote     - Numero do lote que sera gerado o movimento       บฑฑ
ฑฑบ          ณ              interno, desde de que se controle por lote.		 บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function addSD3(_cSetor,_cCodProd,_nVolLeite,_dDtLanc,_cCodRecp,_cLote,cLocal,nVlrMix,cTm,xcTicket)

Local _lRastro      := GetMv("MV_RASTRO") == "S"  //Verifica se o sistema efetuara o controle de rastreabilidade
Local aAutoSD3      := {}
Local _lRet			:= .T.
Local _nModBkp      := nModulo
Local _cModBkp		:= cModulo
Local _nDias	:= 4
Private	lMsHelpAuto := .T.
Private	lMsErroAuto := .F.

//Posiciona no cadastro de Produtos
dbSelectArea("SB1")
SB1->(dbSetOrder(1))
If !SB1->(dbSeek(xFilial("SB1") + _cCodProd ))
	
	xMagHelpFis("INFORMAวรO",;
	"O produto: " + _cCodProd + " nใo consta na tabela de produtos.",;
	"Favor comunicar ao departamento de informแtica do problema encontrada, pois desta forma nใo serแ possํvel concluir a opera็ใo")
	Return .F.
	
EndIf

//Posiciona na tabela de Saldos em Estoque
//Se nao encontrar o produto na tabela de saldos,
//inclui saldo inicial para o produto.
dbSelectArea("SB2")
SB2->(dbSetOrder(1))
If !SB2->(dbSeek(xFILIAL("SB2") + SB1->B1_COD + cLocal))
	CriaSB2(SB1->B1_COD,cLocal)
EndIf

AAdd( aAutoSD3,{"D3_FILIAL"     , xFilial("SD3")			, Nil } )// Codigo da Filial
AAdd( aAutoSD3,{"D3_TM"		    , cTm 				        , Nil } )// Tipo do Movimento Interno
AAdd( aAutoSD3,{"D3_COD"		, SB1->B1_COD  	            , Nil } )// Codigo do Produto
AAdd( aAutoSD3,{"D3_UM"		    , SB1->B1_UM		        , Nil } )// Unidade de Medida
AAdd( aAutoSD3,{"D3_QUANT"	    , _nVolLeite    		    , Nil } )// Quantidade de Leite
AAdd( aAutoSD3,{"D3_LOCAL"	    , cLocal                    , Nil } )// Almoxarifado
AAdd( aAutoSD3,{"D3_EMISSAO"	, _dDtLanc			        , Nil } )// Data de Emissao
AAdd( aAutoSD3,{"D3_DOC"	    , "GLT"+xcTicket	 , Nil } )// Documento	//GetSxeNum("SD3","D3_DOC")
AAdd( aAutoSD3,{"D3_CUSTO1"	    , (nVlrMix * _nVolLeite)    , Nil } )// Custo (na Moeda 1)

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณVerifica se o parametro MV_RASTRO esta configurado para gerar rastreabilidadeณ
//ณe se o produto foi configurado  para rastrear por sub-lote ou lote.          ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
If _lRastro .And. SB1->B1_RASTRO $ ('S','L')
	_nDias := IIF(SB1->B1_PRVALID>0,SB1->B1_PRVALID,4)
	AAdd( aAutoSD3,{"D3_LOTECTL"	, _cLote			    , Nil } )	// Lote
	AAdd( aAutoSD3,{"D3_DTVALID"	, dDtcoleta + _nDias		, Nil } )	// Data de validade do lote
endif

AAdd( aAutoSD3,{"D3_L_ORIG"	    , _cCodRecp				    , Nil } )// Codigo da Recepcao
AAdd( aAutoSD3,{"D3_L_SETOR"	, _cSetor  			        , Nil } )// Setor do documento

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณPosiciona no modulo de estoque para executar o siga-auto.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
nModulo     := 4
cModulo     := "EST"

Pergunte("MTA240",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto
MSExecAuto({|x,y| MATA240(x,y)},aAutoSD3,3)

Pergunte("AGLT003",.F.) // Volta as perguntas do programa principal

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณRestaura o modulo anteriormente a execucao do siga-auto.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
nModulo:= _nModBkp
cModulo:= _cModBkp

If lMsErroAuto
	
	xMagHelpFis("SigaAuto - MATA240",;
	"Nใo foi possivel executar o SigaAuto de Inclusใo de Movimento Interno.",;
	"Ap๓s confirmar esta mensagem, verifique os detalhes no Log do SigaAuto.")
	
	MostraErro()
	
	Return .F.
	
EndIf

Return _lRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ excSD3      บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para realizar a exclusao de um determinado       บฑฑ
ฑฑบ          ณ movimento interno que foi gerado a partir de uma recepcao do  บฑฑ
ฑฑบ          ณ leite.                                                        บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ _cDocument - Nro do documento        	     				 บฑฑ
ฑฑบ          ณ _cProduto  - Codigo do Produto								 บฑฑ
ฑฑบ          ณ _cNumSeq   - Nro sequencial do movimento  					 บฑฑ
ฑฑบ          ณ _cChave    - Chave de busca do registro						 บฑฑ
ฑฑบ          ณ _cCodCF    - Codigo do Tipo do Movimento						 บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function delSD3(_cDocument,_cProduto,_cNumSeq,_cChave,_cCodCF)

Local aAutoSD3      := {}
Local _lErro	    := .F.

Local _nModBkp      := nModulo
Local _cModBkp		:= cModulo

Private	lMsHelpAuto := .T.
Private	lMsErroAuto := .F.

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณPosiciona no modulo de estoque para executar o siga-auto.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
nModulo     := 4
cModulo     := "EST"

dbSelectArea("SD3")
SD3->(dbSetOrder(2))
If SD3->(dbSeek(xFilial("SD3") + _cDocument + _cProduto))
	
	AAdd( aAutoSD3,{"D3_NUMSEQ" , _cNumSeq     , Nil } ) // Nro sequencial do movimento
	AAdd( aAutoSD3,{"D3_CHAVE"	, _cChave	   , Nil } ) // Chave de busca do registro
	AAdd( aAutoSD3,{"D3_COD"	, _cProduto    , Nil } ) // Codigo do Produto
	AAdd( aAutoSD3,{"D3_DOC"	, _cDocument   , Nil } ) // Nro do documento
	AAdd( aAutoSD3,{"D3_CF"	    , _cCodCF      , Nil } ) // Codigo do Tipo do Movimento
	AAdd( aAutoSD3,{"INDEX"	    , 4            , Nil } ) // Indice
	dbSetOrder(4)
	
	Pergunte("MTA240",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto
	MSExecAuto({|x,y| MATA240(x,y)},aAutoSD3,5)
	
	Pergunte("AGLT003",.F.) // Volta as perguntas do programa principal
	
	If lMsErroAuto
		
		xMagHelpFis("SigaAuto - MATA240",;
		"Nใo foi possivel executar o SigaAuto de Exclusใo do Movimento Interno do documento: " +;
		_cDocument + " produto: " + _cProduto + " sequencia: " + _cNumSeq,;
		"Ap๓s confirmar esta mensagem, verifique os detalhes no Log do SigaAuto.")
		MostraErro()
		_lErro := .T.
		
	EndIf
	
Else
	
	xMagHelpFis("INFORMAวรO",;
	"Nใo foi encontrado o seguinte documento: " + _cDocument + " produto: " + _cProduto +;
	" para realizar a excluํsใo do movimento interno.",;
	"Dessa forma nใo serแ possํvel executar a rotina solicitada.")
	
	_lErro := .T.
EndIf

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณRestaura o modulo antes que estava logado antes de executar o siga-auto.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
nModulo:= _nModBkp
cModulo:= _cModBkp

Return _lErro
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ chamaRep    บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para verificar de acordo com a litragem anual    บฑฑ
ฑฑบ          ณ fornecida de leite e o saldo da litragem a faixa de tributacaoบฑฑ
ฑฑบ          ณ em que se enquadra o produtor de acordo com a litragem        บฑฑ
ฑฑบ          ณ corrente, esta funcao eh usada somente pela rotina de         บฑฑ
ฑฑบ          ณ reprocessamento de tributacao.                                บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ _cCdRecepc - Codigo da recepcao de leite a ser reprocessada.  บฑฑ
ฑฑบ          ณ _sDtLancam - Data de lancamento da recepcao de leite que esta บฑฑ
ฑฑบ          ณ              sendo reprocessada.                              บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function tribRepr(_cCdRecepc,_sDtLancam,_cSetor)

Local T			:= 1
Local _nPos		:= 0
Local _cAliasRec:= GetNextAlias()
Local _aDadosTri:= {}
Local _aVolTpTri:= {}
Local _cCodPrTri:= GetMv("LT_PRTRIBU")  //Armazena o codigo do produto usado na recep็ใo de leite do tipo TRIBUTADO.
Local _cCodPrIse:= GetMv("LT_PRISENT")  //Armazena o codigo do produto usado na recep็ใo de leite do tipo ISENTO.
Local _cCodPrDif:= GetMv("LT_PRDIFER")  //Armazena o codigo do produto usado na recep็ใo de leite do tipo DIFERIDO.

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณAlteracao efetuada  para que                                                     ณ
//ณa recepcao efetuada no dia 01 do mes 01 de qualquer ano nao seja                 ณ
//ณconsiderada para avaliacao de saldo da litragem anual pois para o calculo        ณ
//ณde tributacao nao se considera o dia de lancamento e como este eh o primeiro dia ณ
//ณdo ano nao deve haver calculo de tributacao.                                     ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณInidica que estamos no mes de janeiro no seu primeiro dia de qualquer ano.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If SubStr(_sDtLancam,5,4) == '0101'
	
	_dDtFinal:= StoD(_sDtLancam)
	
Else
	
	_dDtFinal := StoD(_sDtLancam) - 1
	
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณQuery para selecionar os dados da recepcao de leite para reprocessamento.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
qrysRepr(3,_cAliasRec,_cCdRecepc,"","",_cSetor)

dbSelectArea(_cAliasRec)
(_cAliasRec)->(dbGoTop())

While !(_cAliasRec)->(Eof())
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณVerifica se a recepcao de leite a ser reprocessada ja nao foi		ณ
	//ณutilizada em uma rotina de fechamento.                               ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If (_cAliasRec)->ZLD_STATUS <> 'F'
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณFuncao responsavel por pesquisar de acordo com a litragem de cada      ณ
		//ณassociado a faixa que o mesmo se enquadra, para definir uma recepcao deณ
		//ณleite do tipo: TRIBUTADA, ISENTA OU DIFERIDA.                          ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		_aVolTpTri:= U_AIncent((_cAliasRec)->ZLD_RETIRO,(_cAliasRec)->A2_EST,(_cAliasRec)->ZLD_QTDBOM,_dDtFinal,(_cAliasRec)->A2_L_TRIBU,(_cAliasRec)->ZLD_RETILJ,(_cAliasRec)->ZLD_DTCOLE)
		
		_aVolTpTri[1][1] := 'T' //Fixa a tributa็ใo para T, para na๕ gerar movimenta็ใo de estoque diferente - Guilherme Fran็a 01/10/14
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณArmazena o tipo de tributacao da linha corrente, para posterior ณ
		//ณinsercao na tabela de insercao das entradas de leite(ZLD).      ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		aAdd(_aTribZLD,{(_cAliasRec)->ZLD_ITEM,_aVolTpTri[1,1]})
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณEfetua a aglutinacao do volume para posterior entrada na SD3 pelo tipo de tributacao.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		_nPos:= aScan(_aDadosTri,{|W| W[1] == _aVolTpTri[1,1]})
		
		If _nPos == 0
			
			aAdd(_aDadosTri,{_aVolTpTri[1,1],_aVolTpTri[1,2],""})
			
		Else
			
			_aDadosTri[_nPos,2] += _aVolTpTri[1,2]
			
		EndIf
		
	Else
		
		xMagHelpFis("INFORMAวรO",;
		"Foi constatado que existe(m) recep็๕es posteriores a que se deseja alterar que ja foram fechadas pela rotina de fechamento",;
		"Desta forma nใo serแ possํvel realizar o reprocessamento enquanto esta se encontrarem fechadas.")
		_lErro:= .T.
		Exit
	EndIf
	
	(_cAliasRec)->(dbSkip())
EndDo

dbSelectArea(_cAliasRec)
(_cAliasRec)->(dbCloseArea())

If !_lErro
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณDefine os produtos de acordo com o tipo de tributacao.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	For T:=1 to Len(_aDadosTri)
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณProduto do tipo TRIBUTADO.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		If _aDadosTri[T,1] == "T"
			
			_aDadosTri[T,3]:= _cCodPrTri
			
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณProduto do tipo ISENTO.	 ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		ElseIf _aDadosTri[T,1] == "I"
			
			_aDadosTri[T,3]:= _cCodPrIse
			
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณProduto do tipo DIFERIDO. ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		Else
			_aDadosTri[T,3]:= _cCodPrDif
		EndIf
		
	Next T
	
EndIf

Return _aDadosTri

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ chamaRep    บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para verificar a necessidade de se realizar o    บฑฑ
ฑฑบ          ณ reprocessamento das tributacoes, somente sera chamada a rotinaบฑฑ
ฑฑบ          ณ de reprocessamento, caso seja incluida ou excluida uma nova   บฑฑ
ฑฑบ          ณ linha ou caso o codigo do associado ou o volume sejam         บฑฑ
ฑฑบ          ณ alterados, isto quando o usuario solicitar efetuar uma        บฑฑ
ฑฑบ          ณ alteracao na exclusao sempre devera ser chamada a rotina de   บฑฑ
ฑฑบ          ณ reprocessamento.                                              บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ _cCodRecep - Codigo da recepcao de leite que esta sendo       บฑฑ
ฑฑบ          ณ              alterada, este codigo eh unico por filial.       บฑฑ
ฑฑบ          ณ _aRegs     - Acols da insercao de dados da recepcao.          บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function chamaRep(_cCodRecep,_aRegs)

Local I			:= 1
Local _lProcessa:= .F.

ProcRegua(Len(_aRegs))

While I <= Len(_aRegs) .And. !_lProcessa
	
	IncProc()
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณVerifica se a linha de dados corrente existe no banco de dados.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	dbSelectArea("ZLD")
	ZLD->(dbSetOrder(1))
	If !ZLD->(dbSeek(xFilial("ZLD") + _cCodRecep + _aRegs[I,nPosItem]))
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณCaso a linha nao exista no banco verifica se a mesma nao esta deletada, pois um usuario pode ter inserido e deletado a linhaณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		If !Atail(_aRegs[I])
			
			_lProcessa:= .T.
			exit
			
		EndIf
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณCaso exista os dados em banco de dados.						       ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Else
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณSe a linha estiver deletada, sera necessario chamar a rotina de reprocessamento.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		If Atail(_aRegs[I])
			
			_lProcessa:= .T.
			exit
			
		EndIf
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณVerifica se o codigo do cooperado ou o volume de leite foi alterado.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		If ZLD->ZLD_RETIRO <> _aRegs[I,nPosRetiro] .Or. ZLD->ZLD_QTDBOM <> _aRegs[I,nPosQtdBom]
			
			_lProcessa:= .T.
			exit
			
		EndIf
		
	EndIf
	
	I++
EndDo

Return _lProcessa

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ qrysRepr    บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para realizar as consultas SQL da rotina de 	 บฑฑ
ฑฑบ          ณ reprocessamento da tributacao do leite, mediante              บฑฑ
ฑฑบ          ณ uma alteracao ou exclusao de determinada recepcao.            บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบParametrosณ _nOpcao - Numero da query a ser executada 	                 บฑฑ
ฑฑบ          ณ _cAlias - Alias da query                                      บฑฑ
ฑฑบ          ณ _cCodRecep - Codigo da recepcao de leite que esta sendo       บฑฑ
ฑฑบ          ณ              alterada ou excluida, este codigo eh unico por   บฑฑ
ฑฑบ          ณ              filial.                                          บฑฑ
ฑฑบ          ณ _cAlias   - Alias da query                                    บฑฑ
ฑฑบ          ณ _dDtLanc  - Data de lancamento da recepcao que esta sendo     บฑฑ
ฑฑบ          ณ             alterada ou excluida.                             บฑฑ
ฑฑบ          ณ _dDtFinal - Ultimo dia do ano, pois a cada ano que se inicia  บฑฑ
ฑฑบ          ณ             a tributacao reinicia o seu calculo.              บฑฑ
ฑฑบ          ณ _cSetor   - Setor a que se pertence a recepcao a ser          บฑฑ
ฑฑบ          ณ             reprocessada                                      บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function qrysRepr(_nOpcao,_cAlias,_cCodRecep,_dDtLanc,_dDtFinal,_cSetor)

Local _cFiltro:= "%"
Local _cQuery := ""

Do Case
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณQuery para selecionar todas as recepcoes de leite independente de sua    ณ
	//ณfilial que possuam produtores que fazem parte da recepcao que esta sendo ณ
	//ณalterada ou excluida.                                                    ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Case _nOpcao == 1
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณDefine o intervalo das recepcoes que devem ser reprocessadas.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		_cFiltro += " AND (ZLD_DTCOLE > '" + DtoS(_dDtLanc) + "' AND ZLD_DTCOLE <= '" + DtoS(_dDtFinal) + "')"
		_cFiltro += "%"
		
		BeginSql alias _cAlias
			SELECT
			ZLD_FILIAL,
			ZLD_CODREC,
			ZLD_DTCOLE,
			ZLD_SETOR
			FROM
			%Table:ZLD%
			WHERE
			D_E_L_E_T_ = ' '
			%Exp:_cFiltro%
			AND ZLD_RETIRO IN (
			SELECT
			ZLD_RETIRO
			FROM
			%Table:ZLD%
			WHERE
			D_E_L_E_T_ = ' '
			AND ZLD_FILIAL = %Exp:xFilial("ZLD")%
			AND ZLD_CODREC = %Exp:_cCodRecep%
			)
			GROUP BY
			ZLD_FILIAL,ZLD_CODREC,ZLD_DTCOLE,ZLD_SETOR
			ORDER BY
			ZLD_DTCOLE,ZLD_FILIAL,ZLD_CODREC
		EndSql
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณQuery para selecionar dados da movimentacao interna que foiณ
		//ณgerada pela recepcao de leite a ser reprocessada.          ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Case _nOpcao == 2
		
		BeginSql alias _cAlias
			SELECT
			D3_NUMSEQ,
			D3_CHAVE,
			D3_COD,
			D3_DOC,
			D3_CF,
			D3_LOTECTL
			FROM
			%Table:SD3%
			WHERE
			D_E_L_E_T_ = ' '
			AND D3_FILIAL = %Exp:xFilial("SD3")%
			AND D3_ESTORNO <> 'S'
			AND D3_L_ORIG = %Exp:_cCodRecep%
			AND D3_L_SETOR = %Exp:_cSetor%
		EndSql
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณQuery para selecionar os dados da recepcao de leite para reprocessamento.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Case _nOpcao == 3
		
		BeginSql alias _cAlias
			SELECT
			ZLD.ZLD_ITEM,ZLD.ZLD_RETIRO,ZLD.ZLD_RETILJ,ZLD.ZLD_DTCOLE,ZLD.ZLD_QTDBOM,SA2.A2_EST,ZLD.ZLD_STATUS,SA2.A2_L_TRIBU
			FROM
			%Table:ZLD% ZLD
			JOIN %Table:SA2% SA2 ON SA2.A2_COD = ZLD.ZLD_RETIRO AND SA2.A2_LOJA = ZLD.ZLD_RETILJ
			WHERE
			ZLD.D_E_L_E_T_ = ' '
			AND SA2.D_E_L_E_T_ = ' '
			AND ZLD.ZLD_FILIAL = %Exp:xFilial("ZLD")%
			AND ZLD.ZLD_CODREC = %Exp:_cCodRecep%
			AND ZLD.ZLD_SETOR = %Exp:_cSetor%
		EndSql
		
EndCase

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ validperg   บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para validar se pergunta AGLT003 existe no       บฑฑ
ฑฑบ          ณ dicionario de dados, caso nao existe cria a pergunta.         บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ValidPerg()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

Aadd( aHelpPor, 'Informe o nome do arquivo a ser')
Aadd( aHelpPor, 'importado.                     ')
u_xPutSx1(_cPerg,"01","Arquivo "," "," ","mv_ch1","C",99,0,0,"G","","DIR","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return

/*
# AJUSTA SX1 - Perguntas do filtro de browse
*/
Static Function AjustaSX1(_cPerg)

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

//Da Data
aHelpPor := {}
Aadd( aHelpPor, 'Informe data inicial de coleta  ')
Aadd( aHelpPor, 'para filtrar o browse da recep็ใo')
Aadd( aHelpPor, 'do leite. 						')
U_xPutSx1(_cPerg,"01","Data Inicial"," "," ","mv_ch1","D",8,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate a Data
aHelpPor := {}
Aadd( aHelpPor, 'Informe data final de coleta  ')
Aadd( aHelpPor, 'para filtrar o browse da recep็ใo')
Aadd( aHelpPor, 'do leite. 						')
U_xPutSx1(_cPerg,"02","Data Final  "," "," ","mv_ch2","D",8,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ DesvRota    บ Autor ณ Guilherme Fran็a   บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Fun็ใo usada para permitir a inclusใo de um desvio de rotas   บฑฑ
ฑฑบ          ณ em um determinado recebimento de leite.                       บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function DesvRota()

Local _cAlias := "ZLC"
Local getQtd
Local getVlr
Local getZLH
Local oCombo
Local oFont1 := TFont():New("MS Sans Serif",,016,,.T.,,,,,.F.,.F.)
Local oGet1
Local oGet2
Local oSay1
Local oSay2
Local oSay3
Local oSay4
Local oSay5
Local oSay6
Local oSButton1
Private netQtd := 0
Private netVlr := 0
Private cetZLH := Space(3)
Private nCombo := "L"
Private cGet1 := Space(30)
Private cGet2 := Space(100)

Static oDlg1

DbSelectArea(_cAlias)

DEFINE MSDIALOG oDlg1 TITLE "Inclusใo Desvio de Rota" FROM 000, 000  TO 230, 600 COLORS 0, 16777215 PIXEL

@ 022, 013 SAY oSay1 PROMPT "Quantidade:" SIZE 042, 009 OF oDlg1 FONT oFont1 COLORS 0, 16777215 PIXEL
//@ 022, 013 SAY oSay1 PROMPT "Quantidade:" SIZE 042, 009 OF oDlg1 FONT oFont1 COLORS 0, 16777215 PIXEL
@ 035, 014 SAY oSay2 PROMPT "Valor:" SIZE 041, 009 OF oDlg1 FONT oFont1 COLORS 0, 16777215 PIXEL
@ 050, 014 SAY oSay3 PROMPT "Forma Pgto:" SIZE 041, 009 OF oDlg1 FONT oFont1 COLORS 0, 16777215 PIXEL
@ 063, 013 SAY oSay4 PROMPT "Cod.Ocorr๊ncia:" SIZE 050, 009 OF oDlg1 FONT oFont1 COLORS 0, 16777215 PIXEL
@ 021, 066 MSGET getQtd VAR netQtd SIZE 050, 010 OF oDlg1 PICTURE "@E 999,999.99" COLORS 0, 16777215 PIXEL
@ 033, 066 MSGET getVlr VAR netVlr SIZE 050, 010 OF oDlg1 PICTURE "@E 999.99" COLORS 0, 16777215 PIXEL
@ 047, 066 MSCOMBOBOX oCombo VAR nCombo ITEMS {"L=Litro","K=Km","F=Fixo"} SIZE 049, 010 OF oDlg1 COLORS 0, 16777215 PIXEL
@ 061, 067 MSGET getZLH VAR cetZLH SIZE 028, 010 OF oDlg1 PICTURE "@!" COLORS 0, 16777215 F3 "ZLH_01" PIXEL
@ 060, 102 MSGET oGet2 VAR cGet2 SIZE 176, 012 OF oDlg1 VALID space(30) COLORS 0, 16777215 PIXEL
@ 076, 014 SAY oSay5 PROMPT "Observa็ใo:" SIZE 050, 009 OF oDlg1 FONT oFont1 COLORS 0, 16777215 PIXEL
@ 076, 066 MSGET oGet1 VAR cGet1 SIZE 214, 012 OF oDlg1  VALID space(100) COLORS 0, 16777215 PIXEL
DEFINE SBUTTON oSButton1 FROM 95, 253 TYPE 01 OF oDlg1 ENABLE ACTION {|| ConfirmZLC(), oDlg1:End()}
DEFINE SBUTTON oSButton2 FROM 95, 217 TYPE 02 OF oDlg1 ENABLE ACTION {|| oDlg1:End()}

ACTIVATE MSDIALOG oDlg1 CENTERED

Return


Static Function ConfirmZLC()


If !Empty(cetZLH)
	BEGIN TRANSACTION
	
	RecLock("ZLC",.T.)
	
	ZLC->ZLC_FILIAL := ZLD->ZLD_FILIAL
	ZLC->ZLC_TICKET := ZLD->ZLD_TICKET
	ZLC->ZLC_DTCOLE := ZLD->ZLD_DTCOLE
	ZLC->ZLC_SETOR := ZLD->ZLD_SETOR
	ZLC->ZLC_LINROT := ZLD->ZLD_LINROT
	ZLC->ZLC_FRETIS := ZLD->ZLD_FRETIS
	ZLC->ZLC_LJFRET := ZLD->ZLD_LJFRET
	ZLC->ZLC_DCRFRT := Posicione("SA2",1,xFilial("SA2")+ZLD->ZLD_FRETIS+ZLD->ZLD_LJFRET,"A2_NOME")
	ZLC->ZLC_QTD := netQtd
	ZLC->ZLC_VALOR	:= netVlr
	ZLC->ZLC_FORPAG := nCombo
	ZLC->ZLC_CODZLH := cetZLH
	ZLC->ZLC_DESZLH := cGet2
	ZLC->ZLC_OBS := cGet1
	ZLC->ZLC_FILENT := ZLD->ZLD_FILIAL
	ZLC->ZLC_STATUS := "N"
	MsUnlock()
	END TRANSACTION
EndIf
Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ SomaKM      บ Autor ณ Fabricio Antunes   บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Fun็ใo usada para alterar o somatat๓rio do KM da rota         บฑฑ
ฑฑบ          ณ                                                               บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function SomaKM()
Local nVal:=0
Local lRet:=.T.
Local nX

For nX:=1 to Len(_aXSetor)
	IF _aXSetor[nx] = aCols[n,nPosLinha]
		lRet:=.F.
	EndIF
Next

IF lRet
	AADD(_aXSetor,aCols[n,nPosLinha])
	nVal:=Posicione("ZLW",4,xFilial("ZLW")+aCols[n,nPosLinha]+aCols[n,nPosVersao],"ZLW_KM")
EndIF

Return nVal

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ConsLin     บ Autor ณ Ramon Teles		บ Data ณ  06/06/13   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para buscar as linhas/rotas no periodo           บฑฑ
ฑฑบ          ณ da recepcao do leite cadastrada                               บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function ConsLin()

//Local _cAlias     := GetNextAlias()

Local _cCampo    	:= &(Alltrim(ReadVar()))  //LINHA
//Local _cProduto	  := alltrim(aCols[n,GdFieldPos("ZZ2_CODPRO",aHeader)])
Local _dDtColeta 	:= dDtColeta
Local _cTemp
Local _aArray		:= {}

_dDtColeta := DTOS(_dDtColeta)

Private nTam      := 6
Private nMaxSelect:= 1
Private aCat      := {}
Private MvRet     := Alltrim(ReadVar())
Private MvPar     := ""
Private cTitulo   := ""
Private MvParDef  := ""


#IFDEF WINDOWS
	oWnd := GetWndDefault()
#ENDIF

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณSeleciona os todos os setores cadastrados no sistema.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
/*
_cQuery := " SELECT ZLW_COD , ZLW_DESCRI , ZLW_SETOR, ZLW_VERSAO"
_cQuery += " FROM "+RetSqlName("ZLW")+" ZLW "
//	_cQuery += " WHERE ZLW.ZLW_MSBLQL = 2 "
_cQuery += " WHERE ZLW.ZLW_SETOR = '" + cSetor + "' "
_cQuery += " AND ZLW.D_E_L_E_T_ = ' ' "
_cQuery += " AND ( ( '" + _dDtColeta + "' BETWEEN ZLW_DATINI and ZLW_DATFIM ) OR ZLW_DATINI >= '" + _dDtColeta + "' ) "
_cQuery += " ORDER BY ZLW.ZLW_COD "
*/

_cQuery := " SELECT ZLW_COD , ZLW_DESCRI , MAX(ZLW_VERSAO) ZLW_VERSAO, ZLW_KM,ZLW_SETOR"
_cQuery += " FROM "+RetSqlName("ZLW")+" ZLW "
_cQuery += " WHERE ZLW_SETOR = '" + cSetor + "' "
_cQuery += " AND ZLW.ZLW_MSBLQL <> '1' "
_cQuery += " AND ZLW.D_E_L_E_T_ = ' ' "
//_cQuery += " AND ( ( '" + _dDtColeta + "' BETWEEN ZLW_DATINI and ZLW_DATFIM ) OR ZLW_DATINI >= '" + _dDtColeta + "' ) "
_cQuery += " AND ( ( '" + _dDtColeta + "' BETWEEN ZLW.ZLW_DATINI and ZLW.ZLW_DATFIM ) OR ZLW.ZLW_DATFIM = '' ) "
_cQuery += " GROUP BY ZLW_COD , ZLW_DESCRI , ZLW_KM,ZLW_SETOR" 
_cQuery += " ORDER BY ZLW.ZLW_COD "

//_cQuery    := ChangeQuery( _cQuery )
dbUseArea( .T., "TOPCONN", TcGenQry(,,_cQuery), "TEMPCEL" , .F., .T. )

dbSelectArea("TEMPCEL")
dbGotop()

//cTitulo := "NUMERO      |NUM FORMUL     | COD PROD  | DT EMISSAO | SALDO    | VALOR UNITARIO"
cTitulo := "CODIGO     |DESCRICAO                                | VERSAO     | SETOR  	"

//aAdd(aCat,"Cod Prod   Saldo")

While !("TEMPCEL")->(Eof())
	
	aAdd(aCat,("TEMPCEL")->ZLW_COD + "       | " + PADR(("TEMPCEL")->ZLW_DESCRI,40) + "    |  " + ("TEMPCEL")->ZLW_VERSAO + "             |  " + ("TEMPCEL")->ZLW_SETOR )
	
	("TEMPCEL")->(dbSkip())
EndDo

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณFinaliza a area criada anteriormente.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
dbSelectArea("TEMPCEL")
TEMPCEL->(dbCloseArea())

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณTrativa abaixo para no caso de uma alteracao do campo trazer todosณ
//ณos dados que foram selecionados anteriormente.                    ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
If Len(AllTrim(&MvRet)) == 0
	
	MvPar:= PadR(AllTrim(StrTran(&MvRet,";","")),Len(aCat))
	&MvRet:= PadR(AllTrim(StrTran(&MvRet,";","")),Len(aCat))
	
Else
	
	MvPar:= AllTrim(StrTran(&MvRet,";","/"))
	
EndIf

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณSomente altera o conteudo caso o usuario clique no botao okณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/

//Executa funcao que monta tela de opcoes
If f_Opcoes(@MvPar,cTitulo,aCat,MvParDef,12,49,.F.,nTam,nMaxSelect)
	
	&MvRet := ""
	_cTemp := ""
	
	//Tratamento para separar retorno com barra ";"
	For i:=1 to Len(MvPar)
		If !(SubStr(MvPar,i,1) $ " |*")
			_cTemp  += SubStr(MvPar,i,1)
		elseif (SubStr(MvPar,i,1) $ "|")
			AADD(_aArray,_cTemp)
			_cTemp := ""
		EndIf
	Next
	
	&MvRet:= _aArray[1]
	aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_DESLIN" })] := _aArray[2]
	aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_VERSAO" })] := _aArray[3]
	
	
Else
	
	&MvRet:= _cCampo
	
EndIf


Return(.T.)


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ getDescH2O  บ Autor ณ Pedro Tobaruela Ortiz บ Data da Criacao  ณ 01/09/2014            						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna Valor a ser descontado do leite baseado no historico 												บฑฑ
ฑฑบ			 ณ	de incidencia de agua no leite para uma matricula em um determinado periodo            						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Rotina 										                    											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ _cDtIni: data inicial da consulta,_cDtFim: data final da consulta, _cCod: codigo do cooperado				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ									                                                      	                    บฑฑ
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
User Function getDescH2O(_dDtFim,_cCod,_cLoja,_nQtdAgua)

Local _nPeriodo := getMV("LT_H2OPER")
Local _nRet 	:= 1
Local _cDtFim	:= DTOS(_dDtFim)
Local _cDtIni	:= DTOS(FirstDay(_dDtFim)-1)

If _nQtdAgua > 0
	cQuery := " SELECT COUNT(*) INCID FROM ZLD010 "
	cQuery += " WHERE ZLD_FILIAL = '"+xFilial("ZLD")+"' "
	cQuery += " AND ZLD_RETIRO = '"+_cCod+"' "
	cQuery += " AND ZLD_RETILJ = '"+_cLoja+"' "
	cQuery += " AND ZLD_QTDH2O > 0 "
	cQuery += " AND ZLD_DTCOLP BETWEEN CONVERT(CHAR(8),DATEADD(m, -"+ALLTRIM(STR(_nPeriodo))+" ,CONVERT(DATE,'"+_cDtFim+"')),112) AND '"+_cDtIni+"' "
	cQuery += " AND D_E_L_E_T_ = ' ' "
	/*
	cQuery += " EXCEPT "
	
	cQuery += " SELECT COUNT(*) INCID FROM ZLD010 "
	cQuery += " WHERE ZLD_FILIAL = '"+xFilial("ZLD")+"' "
	cQuery += " AND ZLD_RETIRO = '"+_cCod+"' "
	cQuery += " AND ZLD_RETILJ = '"+_cLoja+"' "
	cQuery += " AND ZLD_QTDH2O > 0 "
	cQuery += " AND ZLD_TICKET = '"+cTicket+"' "
	cQuery += " AND ZLD_DTCOLP BETWEEN CONVERT(CHAR(8),DATEADD(m, -"+ALLTRIM(STR(_nPeriodo))+" ,CONVERT(DATE,'"+_cDtFim+"')),112) AND '"+_cDtFim+"' "
	cQuery += " AND D_E_L_E_T_ = ' ' "
	*/
	If Select("H2O") <> 0
		H2O->(dbCloseArea())
	EndIf
	dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "H2O", .T., .F. )
	
	While !H2O->(Eof())
		If H2O->INCID > 0
			_nRet:=getMV("LT_H2OFAT")
		EndIf
		H2O->(dbSkip())
	EndDo
	//dbcloseArea("H2O")
EndIf

Return(_nRet)
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ConsRotCab  บ Autor ณ Daniel Montagna	บ Data ณ  14/11/13   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para buscar as linhas/rotas no periodo           บฑฑ
ฑฑบ          ณ da recepcao do leite cadastrada usada no Cabecalho,           บฑฑ
ฑฑบ          ณ Consulta Padrใo                                               บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function ConsRotCab()

//Local _cAlias     := GetNextAlias()

Local _cCampo    	:= &(Alltrim(ReadVar()))  //LINHA
//Local _cProduto	  := alltrim(aCols[n,GdFieldPos("ZZ2_CODPRO",aHeader)])
Local _dDtColeta 	:= dDtColeta
Local _cTemp
Local _aArray		:= {}


_dDtColeta := DTOS(_dDtColeta)

Private nTam      := 6
Private nMaxSelect:= 1
Private aCat      := {}
Private MvRet     := Alltrim(ReadVar())
Private MvPar     := ""
Private cTitulo   := ""
Private MvParDef  := ""
Private cDesc :=""
//	Private cTotKm := ""


#IFDEF WINDOWS
	oWnd := GetWndDefault()
#ENDIF

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณSeleciona os todos os setores cadastrados no sistema.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
_cQuery := " SELECT ZLW_COD , ZLW_DESCRI , MAX(ZLW_VERSAO) ZLW_VERSAO, ZLW_KM"
_cQuery += " FROM "+RetSqlName("ZLW")+" ZLW "
_cQuery += " WHERE ZLW.ZLW_SETOR = '" + cSetor + "' "
_cQuery += " AND ZLW.ZLW_MSBLQL <> '1' "
_cQuery += " AND ZLW.D_E_L_E_T_ = ' ' "
//_cQuery += " AND ( ( '" + _dDtColeta + "' BETWEEN ZLW_DATINI and ZLW_DATFIM ) OR ZLW_DATINI >= '" + _dDtColeta + "' ) "
_cQuery += " AND ( ( '" + _dDtColeta + "' BETWEEN ZLW.ZLW_DATINI and ZLW.ZLW_DATFIM ) OR ZLW.ZLW_DATFIM = '' ) "
_cQuery += " GROUP BY ZLW_COD , ZLW_DESCRI , ZLW_KM"
_cQuery += " ORDER BY ZLW.ZLW_COD "

//_cQuery    := ChangeQuery( _cQuery )
dbUseArea( .T., "TOPCONN", TcGenQry(,,_cQuery), "TEMPCEL" , .F., .T. )

dbSelectArea("TEMPCEL")
dbGotop()

//cTitulo := "NUMERO      |NUM FORMUL     | COD PROD  | DT EMISSAO | SALDO    | VALOR UNITARIO"
cTitulo := "CODIGO     |DESCRICAO                                       | VERSAO     | KM  	"

//aAdd(aCat,"Cod Prod   Saldo")


//	cTotKm :=  ("TEMPCEL")->ZLW_KM

While !("TEMPCEL")->(Eof())
	
	aAdd(aCat,("TEMPCEL")->ZLW_COD + "       | " + SubStr(("TEMPCEL")->ZLW_DESCRI,1,35) + "    | " + ("TEMPCEL")->ZLW_VERSAO + "             | " + CVALTOCHAR(("TEMPCEL")->ZLW_KM ) )
	
	("TEMPCEL")->(dbSkip())
EndDo

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณFinaliza a area criada anteriormente.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
dbSelectArea("TEMPCEL")
TEMPCEL->(dbCloseArea())

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณTrativa abaixo para no caso de uma alteracao do campo trazer todosณ
//ณos dados que foram selecionados anteriormente.                    ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/
If Len(AllTrim(&MvRet)) == 0
	
	MvPar:= PadR(AllTrim(StrTran(&MvRet,";","")),Len(aCat))
	&MvRet:= PadR(AllTrim(StrTran(&MvRet,";","")),Len(aCat))
	
Else
	
	MvPar:= AllTrim(StrTran(&MvRet,";","/"))
	
EndIf

/*
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณSomente altera o conteudo caso o usuario clique no botao okณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
*/

//Executa funcao que monta tela de opcoes
If f_Opcoes(@MvPar,cTitulo,aCat,MvParDef,12,49,.F.,nTam,nMaxSelect)
	
	&MvRet := ""
	_cTemp := ""
	
	//Tratamento para separar retorno com barra ";"
	For i:=1 to Len(MvPar)
		If !(SubStr(MvPar,i,1) $ " |*")
			_cTemp  += SubStr(MvPar,i,1)
		elseif (SubStr(MvPar,i,1) $ "|")
			AADD(_aArray,_cTemp)
			_cTemp := ""
		EndIf
	Next
	
	&MvRet:= _aArray[1]

	GatilhoZLW(_aArray[1],1)

Else
	
	&MvRet:= _cCampo
	
EndIf


Return(.T.)



/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGatilhoZLWบAutor  ณMicrosiga           บ Data ณ  02/20/15   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Preenche descricao da rota e km                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GatilhoZLW(_xcCod,xOpc)

Local _cAlias	:= GetNextAlias()
Local _cCod := _xcCod
Local _aRet := {}


BeginSql alias _cAlias
	SELECT ZLW_COD , ZLW_DESCRI, MAX(ZLW_VERSAO) ZLW_VERSAO, ZLW_KM, ZLW_KMTERR
	FROM %TABLE:ZLW% ZLW
	WHERE ZLW.%NotDel%
	AND ZLW.ZLW_COD  = %EXP:_cCod%
    AND ZLW.ZLW_MSBLQL <> '1'
	GROUP BY ZLW_COD , ZLW_DESCRI, ZLW_KM, ZLW_KMTERR
EndSql

If xOpc == 1
	cDescRot := (_cAlias)->ZLW_DESCRI
	nTotKM := (_cAlias)->ZLW_KM
	nTotKMT := (_cAlias)->ZLW_KMTERR
EndIf

AADD(_aRet,(_cAlias)->ZLW_DESCRI)
AADD(_aRet,(_cAlias)->ZLW_KM)
AADD(_aRet,(_cAlias)->ZLW_VERSAO)
AADD(_aRet,(_cAlias)->ZLW_KMTERR)

DbCloseArea(_cAlias)

If xOpc == 1 .and. _lPopula
	If MsgYesNo("Deseja preencher os dados abaixo com os produtores da rota selecionada?","Preenchimento Automatico")
	//Preenche acols com os produtores da rota
		GetLinPrd(aHeader, cFretist,cLjFret, cMotor)
	EndIf
EndIf


Return _aRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGatilhoZLZบAutor  ณMicrosiga           บ Data ณ  02/20/15   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Preenche rota, versao e descricao                          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function GatilhoZLZ(_xcCod)

Local _cAlias	:= GetNextAlias()
Local _cCod := _xcCod
Local _cRet := ""

If Select(_cAlias)>0
	DbCloseArea(_cAlias)
EndIf

BeginSql alias _cAlias
	
	SELECT LZ.ZLZ_ROTA ROTA, MAX(LZ.ZLZ_VERSAO) VERSAO, LW.ZLW_DESCRI DESCRI , MAX(LW.ZLW_VERSAO) VERSAOLW
	FROM %TABLE:ZLZ% LZ
	JOIN %TABLE:ZLW% LW ON LW.ZLW_COD = ZLZ_ROTA //AND LW.ZLW_VERSAO = ZLZ_VERSAO 
			AND LW.ZLW_MSBLQL <> '1' AND LW.%NotDel%
	WHERE LZ.ZLZ_CODPRO = %EXP:_cCod% AND LZ.%NotDel% 
	GROUP BY ZLZ_ROTA, ZLW_DESCRI
EndSql

If !(_cAlias)->(Eof())
	aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_LINROT" })] := (_cAlias)->ROTA
	aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_DESLIN" })] := (_cAlias)->DESCRI
	aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_VERSAO" })] := (_cAlias)->VERSAOLW
	_cRet := (_cAlias)->ROTA
EndIf	



Return _cRet



/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ VldBRTBOM   บ Autor ณ Cleiton Campos        บ Data da Criacao  ณ 09/09/2014            						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Vaida็ใo nas altera็๕es do campo ZLD_BRTBOM.                  												บฑฑ
ฑฑบ			 ณ	                                                                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Rotina 										                    											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ _cDtIni: data inicial da consulta,_cDtFim: data final da consulta, _cCod: codigo do cooperado				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ									                                                      	                    บฑฑ
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
User Function VldBRTBOM()

Local _nRetorno := aCols[n,nPosBrtBom]

//If aCols[n,nPosPctDes] <> 0
	
//	aCols[n,nPosQtdBom] :=  aCols[n,nPosBrtBom] * (1-aCols[n,nPosPctDes]/100)
	
//Else
	
	aCols[n,nPosQtdBom] :=  aCols[n,nPosBrtBom]
	
//EndIf

oDlg:Refresh()

Return(_nRetorno)


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณCONSCRIO  บAutor  ณMicrosiga           บ Data ณ  04/28/15   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณConsulta historico de crioscopia.                           บฑฑ
ฑฑบ          ณA tela ้ chamada na valida็ใo do campo ZLD_QTDH2O e tecla F7บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function CONSCRIO(_xcProd,_xcLoja)                                             

Local oFont1 := TFont():New("MS Sans Serif",,016,,.T.,,,,,.F.,.F.)
Local _nNome := ""
Local _nDias := SuperGetMv("LT_DIASH20",,365) //Periodo em dias para verificar se houve mistura de agua no leite
Local _dDiaIni := DaySub(dDataBase,_nDias) 
Local _cPeriodo := dtoc(_dDiaIni)+" a "+dtoc(dDataBase)
DEFAULT _xcProd := SA2->A2_COD
DEFAULT _xcLoja := SA2->A2_LOJA

Private _cCodPro := _xcProd
Private _cCodLoj := _xcLoja
Private oDlg   

_nNome := Posicione("SA2",1,xFilial("SA2")+_xcProd+_xcLoja,"A2_NOME")
DEFINE MSDIALOG oDlg TITLE "Historico Crioscopia" FROM 000, 000  TO 260, 500 COLORS 0, 16777215 PIXEL
	@ 005, 005 SAY _xcProd+" - "+_nNome SIZE 200, 009 OF oDlg1 FONT oFont1 COLORS 0, 16777215 PIXEL
	@ 015, 005 SAY "Periodo: "+_cPeriodo SIZE 150, 009 OF oDlg1 FONT oFont1 COLORS 0, 16777215 PIXEL	
   	fWBrowse()
   	oWBrowse:Align := CONTROL_ALIGN_BOTTOM

//	@ 130, 105 BUTTON "FECHAR" SIZE 40,12 ACTION oDlg:End() PIXEL OF oDlg
	
ACTIVATE MSDIALOG oDlg CENTERED
    

Return .t.

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณfWBrowse  บ Autor ณ                    บ Data ณ  27/04/15   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณMonta tela com dados da crioscopia.                         บฑฑ
ฑฑบ          ณA tela ้ chamada na valida็ใo do campo ZLD_QTDH2O e tecla F7บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       |                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function fWBrowse()

Local aWBrowse := {}
Local _aAux := U_Crioscopia(2,_cCodPro,_cCodLoj)
Static oWBrowse



if !(Len(_aAux)>0)
   	Aadd(aWBrowse,{"","","","",""})
Else
    For i:= 1 to Len(_aAux)
		AADD(aWBrowse,{DTOC(STOD(_aAux[i][1])),_aAux[i][2],_aAux[i][3],_aAux[i][4],_aAux[i][5] })
	Next i
endif             
    


	@ 030, 005 LISTBOX oWBrowse Fields HEADER "Data","Qtd.Leite","Qtd.Agua","%Penalidade","Qtd.Penalidade" OF oDlg PIXEL ColSizes 35,110
    oWBrowse:SetArray(aWBrowse)
    oWBrowse:bLine := {|| {;
    aWBrowse[oWBrowse:nAt,1],;
    aWBrowse[oWBrowse:nAt,2],;
    aWBrowse[oWBrowse:nAt,3],;    
    aWBrowse[oWBrowse:nAt,4],;    
    aWBrowse[oWBrowse:nAt,5]}}

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ Descarte    บ Autor ณ Guilherme Fran็a   บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Fun็ใo usada para descartar a entrega do leite, indicando o   บฑฑ
ฑฑบ          ณ responsavel pela perda da carga.                              บฑฑ
ฑฑบ          ณ Quando ocorre o descarte o leite ้ pago normalmente aos produ บฑฑ
ฑฑบ          ณ tores da recep็ใo, mas ้ gerado debito para o produtor indica-บฑฑ
ฑฑบ          ณ do na tela abaixo, e nใo ้ gerado SD3.                        บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function Descarte()

Local _cAlias := "ZLN"
Local getCod
Local _cCod := Space(6)
Local getLj
Local _cLoja := Space(2)
Local getNom
Local _cNome := Space(40)
Local getQtd
Local _nQtd := nTotBom
Local oFont1 := TFont():New("MS Sans Serif",,016,,.T.,,,,,.F.,.F.)
Local oGet1
Local oGet2
Local oSay1
Local oSay2
Local oSay3
Local oSay4
Local oSay5
Local oSay6
Local oSButton1

nQtdDesc := nTotBom

Static oDlg2

DbSelectArea(_cAlias)

DEFINE MSDIALOG oDlg2 TITLE "Descarte da Recep็ใo de Leite" FROM 000, 000  TO 230, 600 COLORS 0, 16777215 PIXEL
@ 009, 013 SAY oSay1 PROMPT "Indique o produtor que serแ cobrado pelo descarte deste ticket." SIZE 200, 009 OF oDlg2 FONT oFont1 COLORS 0, 16777215 PIXEL
@ 020, 013 SAY oSay1 PROMPT "Ticket:" SIZE 042, 009 OF oDlg2 FONT oFont1 COLORS 0, 16777215 PIXEL
@ 021, 066 MSGET getCod VAR cTicket WHEN .F. SIZE 035, 010 OF oDlg2 COLORS 0, 16777215 PIXEL
@ 037, 013 SAY oSay1 PROMPT "Responsavel:" SIZE 042, 009 OF oDlg2 FONT oFont1 COLORS 0, 16777215 PIXEL
@ 036, 066 MSGET getCod VAR _cCod  SIZE 035, 010  OF oDlg2 PICTURE "@!" COLORS 0, 16777215 F3 "SA2_L8" PIXEL
@ 036, 105 MSGET getLj VAR _cLoja SIZE 015, 010 OF oDlg2 WHEN .F. COLORS 0, 16777215 PIXEL
@ 048, 066 MSGET getNom VAR _cNome SIZE 150, 010 OF oDlg2 WHEN .F. COLORS 0, 16777215 PIXEL
@ 065, 014 SAY oSay3 PROMPT "Qtd.Litros:" SIZE 041, 009 OF oDlg2 FONT oFont1 COLORS 0, 16777215 PIXEL
@ 062, 066 MSGET getQtd VAR nQtdDesc SIZE 050, 010 OF oDlg2 PICTURE "@E 999,999.99" COLORS 0, 16777215 PIXEL


DEFINE SBUTTON oSButton1 FROM 95, 253 TYPE 01 OF oDlg2 ENABLE ACTION {|| ConfirmZLN(1,_cCod,_cLoja,nQtdDesc), oDlg2:End()}
DEFINE SBUTTON oSButton2 FROM 95, 217 TYPE 02 OF oDlg2 ENABLE ACTION {|| oDlg2:End()}

ACTIVATE MSDIALOG oDlg2 CENTERED

Return _nQtd


Static Function ConfirmZLN(_xnOpc,_xcCod,_xcLoja,_xnQtd,_xdDtCole)


If _xnOpc == 1

	_cStatus := "D"
	_cCodDesc := _xcCod
	_cLjDesc  := _xcLoja
	

Else 

	DbSelectArea("ZLN")
	DbSetOrder(1)
	If !ZLN->(DbSeek(xFilial("ZLN")+cTicket))
		
		RecLock("ZLN",.T.)
		
		ZLN->ZLN_FILIAL := ZLD->ZLD_FILIAL
		ZLN->ZLN_TICKET := cTicket
		ZLN->ZLN_CODIGO := _xcCod
		ZLN->ZLN_LOJA	:= _xcLoja
		ZLN->ZLN_QTD	:= _xnQtd
		ZLN->ZLN_DATA	:= _xdDtCole
		ZLN->ZLN_FRETIS := cFretist
		ZLN->ZLN_LJFRET := cLjFret
	
		MsUnlock()
	
	EndIf
EndIf

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGetLinPrd บAutor  ณMicrosiga           บ Data ณ  09/21/15   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Preenche acols com todos os produtores associados as linhasบฑฑ
ฑฑบ          ณ do fretista.                                               บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GetLinPrd(_paHeader, _pcFretista, _pcLojaFretista, _pcMotorista)

Local _aArea     := GetArea()
Local _aRetorno  := {}
Local _cAlias    := GetNextAlias()
Local _nFieldPos := 0
Local aColsIni   :=	{"001","","","",0,cHrRec,0,0,0,0,"","","","","ZLD",,.F.}
Local _aAcolsAux := aClone(aColsIni)
Local _nItem     := 1  
Local _cRotFret	:= Posicione("ZLW",3,xFilial("ZLW")+_pcFretista+_pcLojaFretista,"ZLW_COD")
aCols := {}
aAdd(aCols,aColsIni)

If Alltrim(_cRotFret) <> Alltrim(cRotCab)
	If !MsgYesNo("Rota digitada difere da vinculada ao transportador ("+_cRotFret+"),"+_ENTER;
			+"Confirma rota digitada? ","Diverg๊ncia de cadastro")
			cRotCab := _cRotFret
	EndIf		
EndIf

BeginSql Alias _cAlias
	
	SELECT	ZLZ_CODPRO as ZLD_RETIRO,
	ZLZ_LJPROD as ZLD_RETILJ,
	A2_L_LI_RO as ZLD_GRPRC,
	A2_NOME    as ZLD_DCRRET,
	ZLZ_ROTA   as ZLD_LINROT,
	ZLW_VERSAO AS ZLD_VERSAO,
	ZLW_DESCRI as ZLD_DESLIN,
	ZLZ_FILIAL, ZLZ_ROTA, ZLZ_VERSAO
	
	FROM %Table:ZLZ% ZLZ
	
	JOIN %Table:SA2% SA2
	ON A2_FILIAL = %xFilial:SA2%
	AND A2_COD = ZLZ_CODPRO
	AND A2_LOJA = ZLZ_LJPROD
	AND SA2.%NotDel%
	
	JOIN %Table:ZLW% ZLW
	ON ZLW_FILIAL = %xFilial:ZLW%
	AND ZLW_COD = ZLZ_ROTA
/*
	AND ZLW_FRETIS = %Exp:_pcFretista%
	AND ZLW_FRETLJ = %Exp:_pcLojaFretista%
*/
	AND ZLW.%NotDel%

	JOIN %Table:ZL4% ZL4
	ON ZL4_FILIAL = %xFilial:ZL4%
	AND ZL4_COD = ZLW_VEICUL
/*	AND ZL4_MOTORI = %Exp:_pcMotorista%
*/
	AND ZL4.%NotDel%
	
	WHERE ZLZ_FILIAL = %xFilial:ZLZ%
	AND ZLZ.ZLZ_ROTA = %Exp:cRotCab%
	AND   ZLZ.%NotDel%             
	
	ORDER BY ZLZ_FILIAL, ZLZ_ROTA, ZLZ_VERSAO, A2_NOME
	
EndSql

dbSelectArea(_cAlias)
dbGoTop()         

//cRotCab :=  (_cAlias)->ZLD_LINROT

While !(_cAlias)->(Eof())
	

	If _nItem>1
		If Len(_aAcolsAux)>1 //.and. !Empty(_aAcolsAux[2])
			aAdd(aCols, aClone(_aAcolsAux))
			GDFieldPut("ZLD_ITEM", StrZero(_nItem,3), _nItem)
		EndIf
	EndIf

	For i := 1 to (Len(_paHeader) - 1)

		_nFieldPos := (_cAlias)->(FieldPos(_paHeader[i][2]))
		If _nFieldPos > 0
			//_nColPos := ascan(aHeader,{|x| ALLTRIM(x[2]) == Field(_nFieldPos)  })
			GDFieldPut((_cAlias)->(Field(_nFieldPos)), (_cAlias)->(FieldGet(_nFieldPos)), _nItem)
	
		EndIf      
	
	Next i    

	_nItem += 1

	
	(_cAlias)->(dbSkip())

EndDo

RestArea(_aArea)

oGet:Refresh()

Return(_aRetorno)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRetLinRot บAutor  ณMicrosiga           บ Data ณ  10/02/15   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna dados de linha e rota para preencher acols        บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ chkretir                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function RetLinRot(_pcProdutor, _pcLoja)

Local _aArea := GetArea()
Local _aRetorno := {}
Local _cAlias := GetNextAlias()

BeginSql Alias _cAlias
	
	SELECT ZLW_COD, ZLW_VERSAO, ZLW_DESCRI
	
	FROM %Table:ZLZ% ZLZ
	
	JOIN %Table:ZLW% ZLW
	ON ZLW_FILIAL = %xFilial:ZLW%
	AND ZLW_COD = ZLZ_ROTA
	AND ZLW_VERSAO = ZLZ_VERSAO
	AND ZLW.D_E_L_E_T_ = ' '
	
	WHERE ZLZ_FILIAL = %xFilial:ZLZ%
	AND ZLZ_CODPRO = %Exp:_pcProdutor%
	AND ZLZ_LJPROD = %Exp:_pcLoja%
	AND ZLZ.D_E_L_E_T_ = ' '
	
EndSql

dbSelectArea(_cAlias)
dbGoTop()

// Retorna somente o primeiro que encontrar.

_aRetorno := {(_cAlias)->ZLW_COD, (_cAlias)->ZLW_VERSAO, (_cAlias)->ZLW_DESCRI }

(_cAlias)->(dbCloseArea())

RestArea(_aArea)

Return(_aRetorno)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT003   บAutor  ณMicrosiga           บ Data ณ  07/28/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ChkPermis(_cCampo)

Local _lRetorno := .T.

If Alltrim(_cCampo) == "ZLD_QTDBOM"
	_lRetorno := POSICIONE("ZLU",1,XFILIAL("ZLU")+PADR(cUserName,25),"ZLU_TOTTKT") == "S"
EndIf                 

Return(_lRetorno)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGrvMedVaz บAutor  ณMicrosiga           บ Data ณ  07/29/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Grava leitura do medidor de vazใo.                         บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GrvMedVaz(_paMedVaz, _pcTicket)

Local _aArea := GetArea()
Local _cTicket, _sData, _cHora, _nValor
If Len(_paMedVaz) > 0 .AND. Select("ZLK") > 0
    
	_cTicket := StrZero(Val(_paMedVaz[1][1]), 6)
	_sData   := DtoS(_paMedVaz[1][2])
	_cHora   := _paMedVaz[1][3] 
	_nValor  := _paMedVaz[1][4] 
	
	dbSelectArea("ZLK")
	ZLK->(dbSetOrder(1))
	If !ZLK->(dbSeek(xFilial("ZLK") + _cTicket + _sData + _cHora  ))
		RecLock("ZLK", .T.)
		ZLK->ZLK_FILIAL := xFilial("ZLK")
		ZLK->ZLK_TICKET := _cTicket
		ZLK->ZLK_DATA   := StoD(_sData)
		ZLK->ZLK_HORA   := _cHora
		ZLK->ZLK_QTDE   := _nValor            
		ZLK->ZLK_TKTZLD := _pcTicket
		ZLK->(MsUnLock())
	EndIf
	
EndIf
      
RestArea(_aArea)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ConsDesc    บ Autor ณ Guilherme Fran็a   บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Consulta descarte lan็ado para o ticket.                      บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function ConsDesc()

Local aArea := GetArea()
Local getCod
Local _cCod := Space(6)
Local getLj
Local _cLoja := Space(2)
Local getNom
Local _cNome := Space(40)
Local getQtd
Local _nQtd := 0
Local oFont1 := TFont():New("MS Sans Serif",,016,,.T.,,,,,.F.,.F.)
Local oGet1
Local oGet2
Local oSay1
Local oSay2
Local oSay3
Local oSay4
Local oSay5
Local oSay6
Local oSButton1

Static oDlg2

DbSelectArea("ZLN")
DbSetOrder(1)
If ZLN->(DbSeek(xFilial("ZLN")+ZLD->ZLD_TICKET))
	cTicket := ZLN->ZLN_TICKET
	_cCod := ZLN->ZLN_CODIGO
	_cLoja := ZLN->ZLN_LOJA
	_nQtd := ZLN->ZLN_QTD
Else
	MsgInfo("Nใo houve descarte neste Ticket")
	Return
EndIf	

_cNome := Posicione("SA2",1,xFilial("SA2")+_cCod+_cLoja,"A2_NOME")
DEFINE MSDIALOG oDlg2 TITLE "Descarte da Recep็ใo de Leite" FROM 000, 000  TO 230, 600 COLORS 0, 16777215 PIXEL
@ 009, 013 SAY oSay1 PROMPT "Dados do descarte de leite" SIZE 200, 009 OF oDlg2 FONT oFont1 COLORS 0, 16777215 PIXEL
@ 020, 013 SAY oSay1 PROMPT "Ticket:" SIZE 042, 009 OF oDlg2 FONT oFont1 COLORS 0, 16777215 PIXEL
@ 021, 066 MSGET getCod VAR cTicket WHEN .F. SIZE 035, 010 OF oDlg2 COLORS 0, 16777215 PIXEL
@ 037, 013 SAY oSay1 PROMPT "Responsavel:" SIZE 042, 009 OF oDlg2 FONT oFont1 COLORS 0, 16777215 PIXEL
@ 036, 066 MSGET getCod VAR _cCod  WHEN .F. SIZE 035, 010  OF oDlg2 PICTURE "@!" COLORS 0, 16777215  PIXEL
@ 036, 105 MSGET getLj VAR _cLoja SIZE 015, 010 OF oDlg2 WHEN .F. COLORS 0, 16777215 PIXEL
@ 048, 066 MSGET getNom VAR _cNome SIZE 150, 010 OF oDlg2 WHEN .F. COLORS 0, 16777215 PIXEL
@ 065, 014 SAY oSay3 PROMPT "Qtd.Litros:" SIZE 041, 009 OF oDlg2 FONT oFont1 COLORS 0, 16777215 PIXEL
@ 062, 066 MSGET getQtd VAR _nQtd SIZE 050, 010 OF oDlg2 WHEN .F. PICTURE "@E 999,999.99" COLORS 0, 16777215 PIXEL

DEFINE SBUTTON oSButton2 FROM 95, 217 TYPE 02 OF oDlg2 ENABLE ACTION {|| oDlg2:End()}

ACTIVATE MSDIALOG oDlg2 CENTERED

Return
