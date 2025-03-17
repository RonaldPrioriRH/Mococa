#INCLUDE "PROTHEUS.ch"
#INCLUDE "RWMAKE.ch"
#INCLUDE "TOPCONN.ch"
#INCLUDE "MSGRAPHI.ch"

#DEFINE _ENTER CHR(13)+CHR(10)
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณMGLT028   บ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Neste arquivo contem funcoes auxiliares,gatilhos, validacoes. OBS: Seguir padrao do projeto para nomear as   บฑฑ
ฑฑบ          ณ funcoes.          												                               				บฑฑ
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


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ IncluSE1 บ Autor ณTOTVS TM			    บ Data da Criacao  ณ 01/07/2014                				     	บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Inclui titulo na SE1                            		    	                           						บฑฑ
ฑฑบ			 ณ														                                   					    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ   Prefixo,  Num,  Parcela,  Tipo,  Forn,  Loja,  Natureza,  Emissao,  Vencto,  Valor, Acrescimo, Decrescimo. บฑฑ
ฑฑบ			 ณ	 Codigo+Loja da Operadora do Conv๊nio, Historico do Titulo SE1.                        						บฑฑ
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
Fun็ใo utilizada nos fontes: AGLT010 (Rotina Convenios), MGLT029 (Gera Eventos), MGLT047(Adiantamento)
*/
User Function IncluSE1(cpPrefixo,cpNum,cpParcela,cpTipo,cpForn,cpLoja,cpNatureza,cpEmissao,cpVencto,npValor,npAcres,npDesc,cTitPai,cHist,nVlTxPer,cpEvento,cFunOrigem,cSeek,xcFilial,cpMix)

Local _aAutoSE1 :={}
Local lOk       := .T.
Local aArea     := GetArea()
Local aAreaSA2  := SA2->(GetArea())
Local _bknModulo := nModulo
Local _bkcModulo := cModulo
Local _cBkpFil	:= cFilAnt
Local _lBloq := (Posicione("SA1",1,xFilial("SA1")+cpForn+cpLoja,"A1_MSBLQL") == "1")
Local _dBkpDtBase := dDataBase
Private lMsErroAuto := .F.

DEFAULT nVlTxPer  := GetMv("LT_TXPER ")//Se eh debito do produtor, grava valor da Taxa de Permanencia para cobrar juros.
DEFAULT cTitPai := ""
DEFAULT cHist   := "GLT-CONVENIO"
DEFAULT cSeek 	:= ""
DEFAULT xcFilial := cFilAnt

If _lBloq
	Bloqueado("D",cpForn,cpLoja,"C")
EndIf

//npValor := npValor + npAcres - npDesc // Acrescimo e decr้scimo foram agregados ao valor principal, pois no P12 estava gerando erro na inclusใo. 25/05/2017 - Guilherme Fran็a

If cpVencto < dDatabase //Tratamento para nใo permitir inclusใo de tํtulos vencidos.
	cpVencto := dDatabase
EndIf

cFilAnt := xcFilial
dDataBase := cpEmissao //Necessario setar dDataBase igual a emissใo, pois o campo E1_EMIS1 nใo respeita a variavel cpEmissao

AAdd( _aAutoSE1, { "E1_PREFIXO"	, cpPrefixo , Nil } )
AAdd( _aAutoSE1, { "E1_NUM"		, cpNum     , Nil } )
AAdd( _aAutoSE1, { "E1_PARCELA"	, cpParcela , Nil } )
AAdd( _aAutoSE1, { "E1_TIPO"	, cpTipo    , Nil } )
AAdd( _aAutoSE1, { "E1_NATUREZ"	, cpNatureza, Nil } )
AAdd( _aAutoSE1, { "E1_CLIENTE"	, cpForn    , Nil } )
AAdd( _aAutoSE1, { "E1_LOJA"	, cpLoja    , Nil } )
AAdd( _aAutoSE1, { "E1_EMISSAO"	, cpEmissao , Nil } )
AAdd( _aAutoSE1, { "E1_EMIS1"	, cpEmissao , Nil } )
AAdd( _aAutoSE1, { "E1_VENCTO"	, cpVencto  , Nil } )
AAdd( _aAutoSE1, { "E1_VENCREA"	, cpVencto  , Nil } )
AAdd( _aAutoSE1, { "E1_VALOR"	, npValor   , Nil } )
AAdd( _aAutoSE1, { "E1_PORCJUR" , nVlTxPer  , Nil } )
AAdd( _aAutoSE1, { "E1_ACRESC"	, npAcres   , Nil } )
AAdd( _aAutoSE1, { "E1_DECRESC"	, npDesc    , Nil } )
AAdd( _aAutoSE1, { "E1_HIST"	, cHist     , Nil } )
//	AAdd( _aAutoSE1, { "E1_DATALIB"	, dDatabase , Nil } )
//	AAdd( _aAutoSE1, { "E1_USUALIB"	, ALLTRIM(cUserName), Nil } )
AAdd( _aAutoSE1, { "E1_ORIGEM"	, cFunOrigem , Nil } )
//	AAdd( _aAutoSE1, { "E1_C_FORPG"	, "CO" 		, Nil } )
AAdd( _aAutoSE1, { "E1_L_SEEK"	, cSeek    	, Nil } )
AAdd( _aAutoSE1, { "E1_L_EVENT"	, cpEvento    , Nil } )

If Alltrim(cFunOrigem) $ "MGLT009#MGLT032#MGLT034" //Se titulo gerado no fechamento, grava E1_L_SITUA para ser deletado no cancelamento.
	AAdd( _aAutoSE1, { "E1_L_SITUA"	, "I" , Nil } )
	AAdd( _aAutoSE1, { "E1_L_MIX"	, cpMix , Nil } )	
EndIf

nModulo := 6
cModulo := "FIN"

Pergunte("FIN040",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto

MSExecAuto({|x,y| Fina040(x,y)},_aAutoSE1,3) //Inclusao dos lancamentos do convenio no financeiro.

If Alltrim(cFunOrigem) $ "MGLT009#MGLT032#MGLT034"
	Pergunte(_cPerg,.F.)//Chama os parametros da rotina para nao gerar erro
EndIf
If lMsErroAuto
	lOk := .F.
	xMagHelpFis("Erro IncluiSE1-MGLT028","Erro ao incluir Titulo: "+cpPrefixo+cpNum+cpParcela+"-"+cpForn+" Loja - "+cpLoja,"Comunique ao Suporte!!!")
	mostraerro()
EndIf

If _lBloq
	Bloqueado("B",cpForn,cpLoja,"C")
EndIf


cFilAnt := _cBkpFil
dDataBase := _dBkpDtBase
nModulo := _bknModulo
cModulo := _bkcModulo

RestArea(aArea)
RestArea(aAreaSA2)

Return lOk

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ IncluSE2 บ Autor ณTOTVS TM			    บ Data da Criacao  ณ 01/07/2014                				     	บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Inclui titulo na SE1                            		    	                           						บฑฑ
ฑฑบ			 ณ														                                   					    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ   Prefixo,  Num,  Parcela,  Tipo,  Forn,  Loja,  Natureza,  Emissao,  Vencto,  Valor, Acrescimo, Decrescimo. บฑฑ
ฑฑบ			 ณ	 Codigo+Loja da Operadora do Conv๊nio, Historico do Titulo SE1.                        						บฑฑ
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
Fun็ใo utilizada nos fontes: MGLT009 / MGLT032
*/

User Function IncluSE2(cpPrefixo,cpNum,cpParcela,cpTipo,cpForn,cpLoja,cpNatureza,cpEmissao,cpVencto,npValor,npAcres,npDesc,cTitPai,cHist,nVlTxPer,cpEvento,cFunOrigem,cSeek,_cPerg,xcMix,xcFilial)

Local _aAutoSE2 :={}
Local lOk       := .T.
Local aArea     := GetArea()
Local aAreaSA2  := SA2->(GetArea())
Local _bknModulo := nModulo
Local _bkcModulo := cModulo
Local _cBkpFil	:= cFilAnt
Local _dBkpDtBase := dDataBase

Local _lBloq := (Posicione("SA2",1,xFilial("SA2")+cpForn+cpLoja,"A2_MSBLQL") == "1")

Private lMsErroAuto := .F.

DEFAULT nVlTxPer  := If(cpTipo=="NDF",GetMv("LT_TXPER "),0)//Se eh debito do produtor, grava valor da Taxa de Permanencia para cobrar juros.
DEFAULT cTitPai := ""
DEFAULT cHist   := "GLT-CONVENIO"
DEFAULT cSeek 	:= ""
DEFAULT _cPerg := ""
DEFAULT xcMix := ""
DEFAULT xcFilial := cFilAnt

cFilAnt := xcFilial
dDataBase := cpEmissao //Necessario setar dDataBase igual a emissใo, pois o campo E2_EMIS1 nใo respeita a variavel cpEmissao

If _lBloq
	Bloqueado("D",cpForn,cpLoja,"F")
EndIf

DbSelectArea("SE2")
DbSetOrder(1)
If DbSeek(xFILIAL("SE2")+cpPrefixo+cpNum+cpParcela+cpTipo+cpForn+cpLoja)
	cpNum := Soma1(cpNum)
EndIf


AAdd( _aAutoSE2, { "E2_PREFIXO"	, cpPrefixo , Nil } )
AAdd( _aAutoSE2, { "E2_NUM"		, cpNum     , Nil } )
AAdd( _aAutoSE2, { "E2_PARCELA"	, cpParcela , Nil } )
AAdd( _aAutoSE2, { "E2_TIPO"	, cpTipo    , Nil } )
AAdd( _aAutoSE2, { "E2_NATUREZ"	, cpNatureza, Nil } )
AAdd( _aAutoSE2, { "E2_FORNECE"	, cpForn    , Nil } )
AAdd( _aAutoSE2, { "E2_LOJA"	, cpLoja    , Nil } )
AAdd( _aAutoSE2, { "E2_EMISSAO"	, cpEmissao , Nil } )
AAdd( _aAutoSE2, { "E2_VENCTO"	, cpVencto  , Nil } )
AAdd( _aAutoSE2, { "E2_VENCREA"	, cpVencto  , Nil } )
AAdd( _aAutoSE2, { "E2_VALOR"	, npValor   , Nil } )
AAdd( _aAutoSE2, { "E2_PORCJUR" , nVlTxPer  , Nil } )
AAdd( _aAutoSE2, { "E2_ACRESC"	, npAcres   , Nil } )
AAdd( _aAutoSE2, { "E2_DECRESC"	, npDesc    , Nil } )
AAdd( _aAutoSE2, { "E2_HIST"	, cHist     , Nil } )
AAdd( _aAutoSE2, { "E2_L_EVENT"	, cpEvento  , Nil } )
AAdd( _aAutoSE2, { "E2_L_SEEK"	, cSeek	   	, Nil } )
AAdd( _aAutoSE2, { "E2_L_MIX"	, xcMix		, Nil } )
AAdd( _aAutoSE2, { "E2_ORIGEM"	, cFunOrigem , Nil } )

If Alltrim(cFunOrigem) $ "MGLT009#MGLT032#MGLT034" //Se titulo gerado no fechamento, grava E2_L_SITUACA para ser deletado no cancelamento.
	AAdd( _aAutoSE2, { "E2_L_SITUA"	, "I" , Nil } )
EndIf


nModulo := 6
cModulo := "FIN"

Pergunte("FIN050",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto

MSExecAuto({|x,y| Fina050(x,y)},_aAutoSE2,3)
If !Empty(_cPerg)
	Pergunte(_cPerg,.F.)//Chama os parametros da rotina para nao gerar erro
EndIf

If lMsErroAuto
	lOk := .F.
	xMagHelpFis("Erro IncluiSE2-MGLT028","Erro ao incluir Titulo: "+cpPrefixo+cpNum+"-"+cpForn,"Comunique ao Suporte!!!")
	mostraerro()
EndIf

If _lBloq
	Bloqueado("B",cpForn,cpLoja,"F")
EndIf

cFilAnt := _cBkpFil	
dDataBase := _dBkpDtBase
nModulo := _bknModulo
cModulo := _bkcModulo

RestArea(aArea)
RestArea(aAreaSA2)

Return lOk

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ NextSE1 บ Autor ณ Ramon Teles        บ Data ณ  03/02/14    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Busca proximo numero da fatura disponivel SE1.				  บฑฑ
ฑฑบ          ณ 											                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ IncluiSE1			                                      บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function NextSE1()

Local cCod:=""
Local _cFiltro := "% SUBSTRING(E1_NUM,1,4) = '"+SUBSTR(DTOS(DDATABASE),3,4)+"' %"

BeginSql alias "FAT"
 	SELECT MAX(E1_NUM) AS COD 
 	FROM %Table:SE1% SE1
 	WHERE %Exp:_cFiltro%  
 	AND SE1.%NotDel%
EndSql

If Alltrim(FAT->COD) = ""
	cCod := '00001'
Else
	cCod := Strzero(Val(SUBSTR(FAT->COD,5,5))+1,5)
EndIF

FAT->(dbCloseArea())

Return cCod

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ NextSE2 บ Autor ณ Ramon Teles        บ Data ณ  03/02/14    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Busca proximo numero da fatura disponivel SE2.			  บฑฑ
ฑฑบ          ณ 											                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ IncluiSE2			                                      บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function NextSE2()

Local cCod		:=""
//	Local _cBase 	:= SubStr(DTOS(dDatabase),3,4)

cQuery	:=	" SELECT MAX(E2_NUM) AS COD FROM "+RetSqlName("SE2") //+" WHERE E2_PREFIXO = '"+_cPrefSE2+"' "
cQuery	+=	" WHERE SUBSTRING(E2_NUM,1,4) = '"+SUBSTR(DTOS(DDATABASE),3,4)+"' AND D_E_L_E_T_ = ' ' "
TcQuery ChangeQuery(cQuery) New Alias "FAT2"

If Alltrim(FAT2->COD) = ""
	cCod := '00001'
Else
	cCod := Strzero(Val(SUBSTR(FAT2->COD,5,5))+1,5)
EndIF

FAT2->(dbCloseArea())

Return cCod

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณ BaixaSE1 ณ Autor ณMicrosiga              ณ Data ณ 00.00.00 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ Baixa titulo no contas a receber via SigaAuto.             ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณParametrosณ ExpN01 - Valor a ser baixado no titulo.                    ณฑฑ
ฑฑณ          ณ ExpC02 - Prefixo do titulo a ser baixado.                  ณฑฑ
ฑฑณ          ณ ExpC03 - Numero do titulo a ser baixado.                   ณฑฑ
ฑฑณ          ณ ExpC04 - Parcela do titulo a ser baixado.                  ณฑฑ
ฑฑณ          ณ ExpC05 - Tipo do titulo a ser baixado.                     ณฑฑ
ฑฑณ          ณ ExpC06 - Numero do Cheque.                                 ณฑฑ
ฑฑณ          ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ GENERICO                                                   ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
Fun็ใo utilizada nos fontes:  MGLT047(Adiantamento)
*/
User Function BaixaSE1(nVlrBx,cPrefixo,cNroTit,cParcela,cTipo,cFornece,cLoja,_cMotBaixa,cHistSE1,_cEvent,_cBanco,_cAgenc,_cConta,lSEK,xFil,xDataBaixa,cCodMix)

Local nModAnt := nModulo
Local cModAnt := cModulo
Local cBkpFil := cFilAnt
Local lRetorno 	:= .T.
Local dBkpData := dDataBase

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

Default _cEvent := ""
Default _cBanco := ""
Default _cAgenc := ""
Default _cConta := ""
Default lSEK	:=.T.
Default xDataBaixa := dDataBase
//Default _cPerg  := ""

dDataBase := xDataBaixa

cFilAnt := xFil
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Tratamento para liberar o titulo para baixa no financeiro. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
DbSelectArea("SE1")
DbSetOrder(1)
If SE1->(dbSeek(xFILIAL("SE1")+cPrefixo+cNroTit+cParcela+cTipo))
	
	nVlrBx := IIF((SE1->E1_SALDO + SE1->E1_SDACRES - SE1->E1_SDDECRE) < nVlrBx,(SE1->E1_SALDO + SE1->E1_SDACRES - SE1->E1_SDDECRE),nVlrBx)
	_cEvent := SE1->E1_L_EVENT
	aTitulo := {;
	{"E1_PREFIXO"  	,cPrefixo			,Nil},;
	{"E1_NUM"	   	,cNroTit	      	,Nil},;
	{"E1_PARCELA"  	,cParcela      	,Nil},;
	{"E1_TIPO"	   	,cTipo         	,Nil},;
	{"AUTBANCO"    	,_cBanco       		,Nil},;
	{"AUTAGENCIA"  	,_cAgenc   			,Nil},;
	{"AUTCONTA"    	,_cConta        		,Nil},;
	{"AUTMOTBX"	   	,_cMotBaixa       	,Nil},;
	{"AUTDTBAIXA"  	,dDataBase	  	,Nil},;
	{"AUTDTCREDITO"	,dDataBase 	  	,Nil},;
	{"AUTHIST"	   	,cHistSE1      	,Nil},;
	{"AUTJUROS"    ,0              ,Nil},;
	{"AUTVALREC"   	,nVlrBx        	,Nil}}
	//		{"AUTBENEF"    	,POSICIONE("SA2",1,xFilial("SA2")+cFornece+cLoja,"A2_NOME"),Nil},;
	//		{"AUTMULTA"    ,0               ,Nil},;
	//		{"AUTTXMOEDA"   ,'1'               ,Nil},;
	//		{"AUTDESCONT"    ,0               ,Nil},;
	
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Altera o modulo para Financeiro, senao o SigaAuto nao executa.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	nModulo := 6
	cModulo := "FIN"
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ SigaAuto de Baixa de Contas a Receberณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Pergunte("FIN070",.F.) //Chama perguntas da rotina FINA070 para evitar erros na execu็ใo do sigaauto.
	MSExecAuto({|x,y| Fina070(x,y)},aTitulo,3)     
	
    IF ALLTRIM(FUNNAME()) <>  "MGLT011"
	   Pergunte(_cPerg,.F.)//Chama os parametros da rotina para nao gerar erro
	EndIf
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Restaura o modulo em uso. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	nModulo := nModAnt
	cModulo := cModAnt
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Verifica se houve erro no SigaAuto, caso haja mostra o erro. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Else
	lMsErroAuto := .T.
EndIf
If lMsErroAuto
	lRetorno := .F.
	xMagHelpFis("SIGAAUTO BAIXA TITULO",;
	"Existe uma nใo conformidade no SigaAuto de Baixa de Contas a Receber!",;
	xFilial("SE1")+cPrefixo+cNroTit+;
	cParcela+cTipo+cFornece+cLoja+;
	"     <-  Copie essas informa็๕es para voce pesquisar no Contas a Receber o titulo que esta com nใo conformidade. "+;
	"Ap๓s confirmar esta tela, sera apresentada a tela de Nใo Conformidade do SigaAuto.")
	MostraErro()
Else
	
	IF lSEK
		lRetorno := UpdSE5(cPrefixo,cTipo,cNroTit,cParcela,cFornece,cLoja,_cMotBaixa,nVlrBx,_cEvent,cCodMix)
		
		If !lRetorno
			
			xMagHelpFis("NAO CONFORMIDADE - UPDATE DO CAMPO E5_L_SEEK",;
			"Nใo Conformidade ao executar o Update de gravacao do campo E5_L_SEEK! ",;
			xFilial("SE1")+cPrefixo+cNroTit+cParcela+cTipo+cFornece+cLoja+;
			"<-  Copie essas informa็๕es para voce pesquisar no Contas a Pagar o titulo que esta com nใo conformidade.")
			
		EndIf
	EndIF
	
EndIf

dDataBase := dBkpData
cFilAnt := cBkpFil

Return lRetorno

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณ BaixaSE2 ณ Autor ณMicrosiga              ณ Data ณ 00.00.00 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ Baixa titulo no contas a pagar via SigaAuto.               ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณParametrosณ ExpN01 - Valor a ser baixado no titulo.                    ณฑฑ
ฑฑณ          ณ ExpC02 - Prefixo do titulo a ser baixado.                  ณฑฑ
ฑฑณ          ณ ExpC03 - Numero do titulo a ser baixado.                   ณฑฑ
ฑฑณ          ณ ExpC04 - Parcela do titulo a ser baixado.                  ณฑฑ
ฑฑณ          ณ ExpC05 - Tipo do titulo a ser baixado.                     ณฑฑ
ฑฑณ          ณ ExpC06 - Numero do Cheque.                                 ณฑฑ
ฑฑณ          ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ GENERICO                                                   ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function BaixaSE2(nVlrBx,cPrefixo,cNroTit,cParcela,cTipo,cFornece,cLoja,_cMotBaixa,cHistSE2,_cEvent,xFil,xDataBaixa,cCodMix)

Local nModAnt := nModulo
Local cModAnt := cModulo
Local lRetorno 	:= .T.
Local cBkpFil := cFilAnt
Local dBkpData := dDataBase

DEFAULT _cMotBaixa := AllTrim(GETMV("LT_MOTBX"))  //Motivo de baixa utilizado para a rotina do Leite
DEFAULT cHistSE2   := " "
DEFAULT xFil :=  xFilial("SE2")
DEFAULT xDataBaixa := dDataBase
DEFAULT cCodMix := ""

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

IF ALLTRIM(FUNNAME()) <>  "MGLT032" .and. ALLTRIM(FUNNAME()) <>  "MGLT009"
	cHistSE2   := "Baixa Adiat - "+_mv_par01//ALLTRIM(GetMv("LT_EVTADT"))
EndIf

dDataBase := xDataBaixa
cFilAnt := xFil
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Tratamento para liberar o titulo para baixa no financeiro. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
DbSelectArea("SE2")
DbSetOrder(1) ///// LIBERACAO DO TITULO GERADO PELO FUNRURAL
If DbSeek(xFILIAL("SE2")+cPrefixo+cNroTit+'001'+'TX')
	If Empty(SE2->E2_DATALIB)//Se nao foi liberado ainda
		RecLock("SE2",.F.)
		SE2->E2_DATALIB := dDataBase
		SE2->E2_USUALIB := Alltrim(cUserName)
		MsUnLock()
	EndIf
EndIf

DbSelectArea("SE2")
DbSetOrder(1)
If DbSeek(xFILIAL("SE2")+cPrefixo+cNroTit+cParcela+cTipo+cFornece+cLoja)
	If Empty(SE2->E2_DATALIB)//Se nao foi liberado ainda
		RecLock("SE2",.F.)
		SE2->E2_DATALIB := dDataBase
		SE2->E2_USUALIB := Alltrim(cUserName)
		MsUnLock()
	EndIf
EndIf

aTitulo := {;
{"E2_PREFIXO"  	,cPrefixo			,Nil},;
{"E2_NUM"	   		,cNroTit	      	,Nil},;
{"E2_PARCELA"  	,cParcela      	,Nil},;
{"E2_TIPO"	   	,cTipo         	,Nil},;
{"E2_FORNECE"  	,cFornece   		,Nil},;
{"E2_LOJA"	   	,cLoja  			,Nil},;
{"AUTBANCO"    	,""        		,Nil},;
{"AUTAGENCIA"  	,""      			,Nil},;
{"AUTCONTA"    	,""        		,Nil},;
{"AUTMOTBX"	   	,_cMotBaixa       	,Nil},;
{"AUTDTBAIXA"  	,dDataBase	  	,Nil},;
{"AUTDTCREDITO"	,dDataBase 	  	,Nil},;
{"AUTBENEF"    	,POSICIONE("SA2",1,xFilial("SA2")+cFornece+cLoja,"A2_NOME"),Nil},;
{"AUTHIST"	   	,cHistSE2      	,Nil},;
{"AUTVLRPG"    	,nVlrBx        	,Nil }}

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Altera o modulo para Financeiro, senao o SigaAuto nao executa.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
nModulo := 6
cModulo := "FIN"

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ SigaAuto de Baixa de Contas a Pagar. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Pergunte("FIN080",.F.) //Chama perguntas da rotina FINA080 para evitar erros na execu็ใo do sigaauto.
MSExecAuto({|x,y| Fina080(x,y)},aTitulo,3)
Pergunte(_cPerg,.F.)//Chama os parametros da rotina para nao gerar erro
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Restaura o modulo em uso. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
nModulo := nModAnt
cModulo := cModAnt

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Verifica se houve erro no SigaAuto, caso haja mostra o erro. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If lMsErroAuto
	lRetorno := .F.
	xMagHelpFis("SIGAAUTO BAIXA TITULO",;
	"Existe uma nใo conformidade no SigaAuto de Baixa de Contas a Pagar!",;
	xFilial("SE2")+cPrefixo+cNroTit+;
	cParcela+cTipo+cFornece+cLoja+;
	"     <-  Copie essas informa็๕es para voce pesquisar no Contas a Pagar o titulo que esta com nใo conformidade. "+;
	"Ap๓s confirmar esta tela, sera apresentada a tela de Nใo Conformidade do SigaAuto.")
	MostraErro()
Else
	
	lRetorno := UpdSE5(cPrefixo,cTipo,cNroTit,cParcela,cFornece,cLoja,_cMotBaixa,nVlrBx,_cEvent,cCodMix)
	
	If !lRetorno
		
		xMagHelpFis("NAO CONFORMIDADE - UPDATE DO CAMPO E5_L_SEEK",;
		"Nใo Conformidade ao executar o Update de gravacao do campo E5_L_SEEK! ",;
		xFilial("SE2")+cPrefixo+cNroTit+cParcela+cTipo+cFornece+cLoja+;
		"<-  Copie essas informa็๕es para voce pesquisar no Contas a Pagar o titulo que esta com nใo conformidade.")
		
	EndIf
	
EndIf
dDataBase := dBkpData
cFilAnt := cBkpFil
Return lRetorno

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณ ExcluSE1ณ Autor ณMicrosiga              ณ Data ณ 00.00.00 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ Exclui titulo no contas a receber via SigaAuto.            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณParametrosณ  								                          ณฑฑ
ฑฑณ          ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ GENERICO                                                   ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
Fun็ใo utilizada nos fontes:  MGLT031(Estorno Eventos)
*/
User Function ExcluSE1(cFILIAL,cPREFIXO,cNUM,cPARCELA,cTIPO,cA2COD,cA2LOJA)

Local nModAnt := nModulo
Local cModAnt := cModulo

Local aAutoSE1 := {}

Local lRetorno 	:= .T.

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

dbSelectArea("SA1")
SA1->(dbSetOrder(1))
dbSeek(xFilial("SA1")+cA2COD+cA2LOJA)


dbSelectArea("SE1")
SE1->(dbSetOrder(1))
If SE1->(dbSeek(cFILIAL+cPREFIXO+cNUM+cPARCELA+cTIPO))
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Array com os dados a serem passados para o SigaAuto. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	aAutoSE1:={{"E1_PREFIXO",SE1->E1_PREFIXO,Nil},;
	{"E1_NUM"    ,SE1->E1_NUM    ,Nil},;
	{"E1_TIPO"   ,SE1->E1_TIPO   ,Nil},;
	{"E1_PARCELA",SE1->E1_PARCELA,Nil},;
	{"E1_NATUREZ",SE1->E1_NATUREZ,Nil},;
	{"E1_FORNECE",cA2COD    	 ,Nil},;
	{"E1_LOJA"   ,cA2LOJA  		 ,Nil}}
	
	nModulo := 6
	cModulo := "FIN"
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณRoda SigaAuto de Exclusao de Titulos a Pagar. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
//	Pergunte("FIN040",.F.)//Chama os parametros da rotina para nao gerar erro
//	MSExecAuto({|x,y| Fina040(x,y)},aAutoSE1,5)
//	Pergunte(_cPerg,.F.)//Chama os parametros da rotina para nao gerar erro
	If SE1->E1_VALOR == SE1->E1_SALDO .and. SE1->E1_STATUS == "A" .AND. Empty(SE1->E1_NUMBCO)
		RecLock("SE1",.F.)
		SE1->(DbDelete())
		MSunlock()
	Else
		xMagHelpFis("Erro de Exclusใo","Titulo: "+cPREFIXO+cNUM+cPARCELA+cTIPO+cA2COD+cA2LOJA+" nใo pode ser excluido!";
		+_ENTER+"Produtor: "+Alltrim(SE1->E1_NOMCLI),;
					"Verifique movimenta็๕es no titulo! (Baixas, Border๔s, Liquida็๕es)")
	EndIf

	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Restaura o modulo em uso. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	nModulo := nModAnt
	cModulo := cModAnt
	
	If lMsErroAuto
		
		lRetorno := .F.
		xMagHelpFis("NAO CONFORMIDADE 01 - TITULO NAO EXCLUIDO",;
		"O titulo "+xFilial("SE1")+SE1->E1_PREFIXO+SE1->E1_NUM+SE1->E1_PARCELA+SE1->E1_TIPO+;
		" nใo foi excluido! Produtor: "+cA2COD+"/"+cA2LOJA,;
		"Verifique no financeiro se este titulo ja foi baixado ou o motivo pelo qual nใo pode ser excluํdo."+;
		" Ao confimar esta tela, sera apresentada a tela do SigaAuto, que possui informa็๕es mais detalhadas.")
		Mostraerro()
		
	EndIf
	
Else
	
	lRetorno := .F.
	xMagHelpFis("NAO CONFORMIDADE 02 - TITULO NAO EXCLUIDO",;
	"O titulo "+xFilial("SE1")+cPREFIXO+cNUM+cPARCELA+cTIPO+;
	" nใo foi encontrado! Produtor: "+cA2COD+"/"+cA2LOJA,;
	"Verifique no financeiro se este titulo existe, pois o mesmo nใo foi encontrado.")
	
EndIf


Return lRetorno


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณ ExcluSE2 ณ Autor ณMicrosiga              ณ Data ณ 00.00.00 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ Exclui titulo no contas a pagar via SigaAuto.              ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณParametrosณ  								                      ณฑฑ
ฑฑณ          ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ GENERICO                                                   ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
Funcaoo utilizada nos fontes:  MGLT031(Estorno Eventos)
*/
User Function ExcluSE2(cPREFIXO,cNUM,cPARCELA,cTIPO,cA2COD,cA2LOJA)

Local nModAnt := nModulo
Local cModAnt := cModulo

Local lRetorno 	:= .T.

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.


dbSelectArea("SA2")
SA2->(dbSetOrder(1))
dbSeek(xFilial("SA2")+cA2COD+cA2LOJA)

dbSelectArea("SE2")
SE2->(dbSetOrder(1))
If SE2->(dbSeek(xFilial("SE2")+cPREFIXO+cNUM+cPARCELA+cTIPO+SA2->A2_COD+SA2->A2_LOJA))
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Array com os dados a serem passados para o SigaAuto. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	aAutoSE2:={{"E2_PREFIXO",SE2->E2_PREFIXO,Nil},;
	{"E2_NUM"    ,SE2->E2_NUM    ,Nil},;
	{"E2_TIPO"   ,SE2->E2_TIPO   ,Nil},;
	{"E2_PARCELA",SE2->E2_PARCELA,Nil},;
	{"E2_NATUREZ",SE2->E2_NATUREZ,Nil},;
	{"E2_FORNECE",cA2COD    	 ,Nil},;
	{"E2_LOJA"   ,cA2LOJA  		 ,Nil}}
	
	nModulo := 6
	cModulo := "FIN"
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณRoda SigaAuto de Exclusao de Titulos a Pagar. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Pergunte("FIN050",.F.)//Chama os parametros da rotina para nao gerar erro
	MSExecAuto({|x,y,z| Fina050(x,y,z)},aAutoSE2,.T.,5)

	If !(Alltrim(FUNNAME()) $ "AGLT012#AGLT112") 
		Pergunte(_cPerg,.F.)//Chama os parametros da rotina para nao gerar erro
	EndIf

	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Restaura o modulo em uso. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	nModulo := nModAnt
	cModulo := cModAnt
	
	If lMsErroAuto
		
		lRetorno := .F.
		//oObj:SaveLog("ERRO 07 - SIGAAUTO EXCLUSAO TITULO")
		xMagHelpFis("NAO CONFORMIDADE 09 - TITULO NAO EXCLUIDO",;
		"O titulo "+xFilial("SE2")+SE2->E2_PREFIXO+SE2->E2_NUM+SE2->E2_PARCELA+SE2->E2_TIPO+;
		" nใo foi excluido! Produtor: "+cA2COD+"/"+cA2LOJA,;
		"Verifique no financeiro se este titulo ja foi baixado ou o motivo pelo qual nใo pode ser excluํdo."+;
		" Ao confimar esta tela, sera apresentada a tela do SigaAuto, que possui informa็๕es mais detalhadas.")
		Mostraerro()
		
	EndIf
	
Else
	
	lRetorno := .F.
	//oObj:SaveLog("ERRO 06 - SIGAAUTO EXCLUSAO TITULO")
	xMagHelpFis("NAO CONFORMIDADE 08 - TITULO NAO EXCLUIDO",;
	"O titulo "+xFilial("SE2")+cPREFIXO+cNUM+cPARCELA+cTIPO+;
	" nใo foi encontrado! Produtor: "+cA2COD+"/"+cA2LOJA,;
	"Verifique no financeiro se este titulo existe, pois o mesmo nใo foi encontrado. Contas a Pagar.")
	
EndIf

Return lRetorno


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ UpdSE5   บ Autor ณ Ramon Teles        บ Data ณ  03/02/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Atualiza SE5 com chave do adiantamento.         		      บฑฑ
ฑฑบ          ณ 											         		  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Atualiza Mov. Financeira                                   บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function UpdSE5(_cPrefixo,_cTipo,_cNumero,_cParcela,_cFornec,_cLoja,_cMotBaixa,_nValor,_cEvent,_cMix)

Local _lRet  := .F.
Local _cQuery:= ""


Default _cEvent := ""

_cQuery := "UPDATE "
_cQuery += RetSqlName("SE5")
_cQuery += " SET E5_L_SEEK = '" + _cMix  + "' "
_cQuery += "WHERE"
_cQuery += " D_E_L_E_T_ = ' '"
_cQuery += " AND E5_FILIAL = '"  + xFilial("SE5")  + "'"
_cQuery += " AND E5_SITUACA <> 'C'"
_cQuery += " AND E5_TIPODOC = 'BA'"
_cQuery += " AND E5_MOTBX = '"   + _cMotBaixa      + "'"
_cQuery += " AND E5_PREFIXO = '" + _cPrefixo       + "'"
_cQuery += " AND E5_TIPO = '"    + _cTipo          + "'"
_cQuery += " AND E5_NUMERO = '"  + _cNumero        + "'"
_cQuery += " AND E5_PARCELA = '" + _cParcela       + "'"
_cQuery += " AND E5_CLIFOR = '"  + _cFornec        + "'"
_cQuery += " AND E5_LOJA = '"    + _cLoja          + "'"
_cQuery += " AND E5_DATA = '"    + DtoS(dDataBase) + "'"
_cQuery += " AND E5_L_SEEK = ' '"

_lRet := !(TCSqlExec(_cQuery) < 0)

If _lRet .and.  (TcGetDB() == 'ORACLE')
		_lRet := !(TCSqlExec(" COMMIT ") < 0)
EndIf


DbSelectArea("SE5")
DbSetOrder(7)
If SE5->(DbSeek(xFilial("SE5")+_cPrefixo+_cNumero+_cParcela+_cTipo+_cFornec+_cLoja))
	RecLock("SE5",.F.)
	SE5->E5_L_SEEK := _cMix
	MsUnLock()
EndIf

Return _lRet


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณBloqueado บAutor  ณMicrosiga           บ Data ณ  17/06/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Desbloqueia cadastro antes de incluir titulo.           บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function Bloqueado(xOpc,xcpForn,xcpLoja,xcTipo)

Local _cOpc := IIF(xOpc=="D","2","1")


If xcTipo == "F"

	DbSelectArea("SA2")
	DbSetOrder(1)
	If DbSeek(xFilial("SA2")+xcpForn+xcpLoja)
		RecLock("SA2",.F.)
		SA2->A2_MSBLQL := _cOpc
		SA2->(MsUnlock())
	EndIf
Else
	DbSelectArea("SA1")
	DbSetOrder(1)
	If DbSeek(xFilial("SA1")+xcpForn+xcpLoja)
		RecLock("SA1",.F.)
		SA1->A1_MSBLQL := _cOpc
		SA1->(MsUnlock())
	EndIf
EndIf
	
/*
_cQuery := "UPDATE "
_cQuery += RetSqlName("SA2")
_cQuery += " SET A2_MSBLQL = '" + _cOpc  + "' "
_cQuery += "WHERE"
_cQuery += " D_E_L_E_T_ = ' '"
_cQuery += " AND A2_COD = '"  + xcpForn  + "'"
_cQuery += " AND A2_LOJA = '"  + xcpLoja  + "'"

_lRet := !(TCSqlExec(_cQuery) < 0)
*/

Return