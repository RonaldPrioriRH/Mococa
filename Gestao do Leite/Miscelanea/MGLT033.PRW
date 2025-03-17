#INCLUDE "PROTHEUS.ch"
#INCLUDE "RWMAKE.ch"
#INCLUDE "TOPCONN.ch"
#INCLUDE "MSGRAPHI.ch"
#DEFINE _ENTER CHR(13)+CHR(10)


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ MGLT033  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 17/07/2014                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Rotina de cancelamento financeiro dos cooperados. 														    บฑฑ
ฑฑบ          ณ                        									                               				        บฑฑ
ฑฑบ          ณ                        									                               				        บฑฑ
ฑฑบ          ณ                        									                               				        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Cancelamento do Leite           						                                                        บฑฑ
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
ฑฑบ          ณ          ณ                                                  ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function MGLT033(xCodMIX,xProd,xObj)

Local _bProcess		:= {|oSelf| MGLT5Exec(oSelf)}
Local cTexto
Private _cPerg		:= "MGLT033"
Private cGLTalias 		:= GetNextAlias()//"GLT"
Private cHoraInicial 	:= TIME()
Private _lAuto := .f.
Private _cMotBaixa := AllTrim(GETMV("LT_MOTBX"))

DEFAULT xCodMIX := ""
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Chama funcao para criar os parametros caso nao existam.             ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
AjustaSX1()


If !Empty(xCodMIX)

	Pergunte(_cPerg,.F.)
	MV_PAR01 := xCodMIX
	mv_par02 := xProd
	mv_par03 := xProd
	mv_par04 := "      "
	mv_par05 := "ZZZZZZ"
	mv_par06 := "      "
	mv_par07 := "ZZZZZZ"

	_lAuto := .t.
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Chama a tela para preenchimento dos parametros.                     ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If !_lAuto
	If !Pergunte(_cPerg,.T.) 
		Return()
	EndIf
EndIf	
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Verifica se o usuario tem permissao para executar a rotina de Eventos.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If Posicione("ZLU",1,xFilial("ZLU")+Padr(cUserName,25),"ZLU_ACERTO") != "S" .and. !_lAuto
	xMagHelpFis("Permissao","Voce nao tem permissao para acessar essa rotina!","Comunique ao Suporte!")
	Return
EndIf


// UTILIZADO EM DEBUG
/*
	Pergunte(_cPerg,.F.)
	MV_PAR01 := '000002'
	mv_par02 := 'P00472'
	mv_par03 := 'P00472'
	mv_par04 := "      "
	mv_par05 := "ZZZZZZ"
	mv_par06 := "      "
	mv_par07 := "ZZZZZZ"
*/

//	If LastDay(dDatabase) != dDataBase
//		xMagHelpFis("NAO CONFORMIDADE 02 - DATABASE INVALIDA",;
//		"A Data do sistema("+DTOC(dDataBase)+") nao esta no ultimo dia do mes!",;
//		"A Data deve ser alterada para "+DTOC(LastDay(dDatabase))+" , para poder continuar a rotina." )
//		Return
//	EndIf

cTexto := "Esta rotina tem o objetivo de efetuar o Cancelamento do fechamento financeiro."+_ENTER
cTexto += "Por favor preencha os parmetros da rotina antes de executar."+_ENTER
cTexto += " "+_ENTER

If !_lAuto
	_oTProces := tNewProcess():New("MGLT033","Cancelamento Financeiro dos Produtores",_bProcess,cTexto,_cPerg)
Else
	Processa({|| MGLT5Exec(xObj) })
EndIf

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณ MGLT5Execณ Autor ณMicrosiga              ณ Data ณ 00.00.00 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ 													          ณฑฑ
ฑฑณ          ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณParametrosณ 									                  		  ณฑฑ
ฑฑณ          ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ 			                                                  ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function MGLT5Exec(oObj)

Local cFunc    := "1"
Local cArqTmp  := cGLTalias+cFunc
Local _aArea   := {}
Local _aAlias  := {}
Local nTotReg  := 0
Local nCont    := 1
Local nVlrEvto := 0
Local nJurTit  := 0
Local nVlrBx   := 0
Local cParc    := StrZero(1,TamSx3("E2_PARCELA")[1]) //Parcela do titulo do evento

//Variaveis Query/Parmetros Rotina
Local _cMes      	:= "" //SubStr(DtoS(dDataBase),5,2)
Local _cAno      	:= "" //SubStr(DtoS(dDataBase),1,4)

Local lContinue 	:= .T.

//Variveis Contador Querys
Local nProd
Local nCont := 1

Local cArqTRZ  		:= ""
Local cInd1TRZ 		:= ""

Private _nReg
Private cCodMIX := MV_PAR01
Private _cProdDe  	:= mv_par02
Private _cProdAte 	:= mv_par03
Private _cLojaDe  	:= mv_par04
Private _cLojaAte 	:= mv_par05

Private _cGrupoDe  	:= mv_par06
Private _cGrupoAte 	:= mv_par07

Private _cDtEmi := ""
Private _cSeek	    := 	"" //_cAno+_cMes // Pesquisa no Financeiro a Pagar e a Receber
Private aStruct := {}

Private _nTamFil    := TamSx3("ZLF_FILIAL")[1]
Private _nTamLoj    := TamSx3("ZLF_RETILJ")[1]
Private _nTamFor    := TamSx3("ZLF_RETIRO")[1]

//Variveis Tabela Genrica
Private cxForn
Private cxLoja := ""
Private lDeuErro	:= .F.


Private _cEveCred := AllTrim(SuperGETMV("LT_EVECRED",,"")) //Evento utilizado no titulo aglutinado de credito
Private _cEveDeb := AllTrim(SuperGETMV("LT_EVEDEB",,"")) //Evento utilizado no titulo aglutinado de debito


dbSelectArea("ZLE")
ZLE->(dbSetOrder(1))
If ZLE->(dbSeek(xFilial("ZLE")+cCodMIX))
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Verifica se a database do sistema esta com o ultimo dia do mes. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	//If LastDay(ZLE->ZLE_DTFIM) != dDataBase
	If ZLE->ZLE_DTFIM != dDataBase
		xMagHelpFis("NAO CONFORMIDADE 02 - DATABASE INVALIDA",;
		"A data do sistema("+DTOC(dDataBase)+") nao esta no ultimo dia do mes!",;
		"Altere a data do sistema para "+DTOC(LastDay(ZLE->ZLE_DTFIM)) )
		Return()
	EndIf
	
	_cMes := Month2Str(ZLE->ZLE_DTFIM) //Retorna o mes no formato MM
	_cAno := Year2Str(ZLE->ZLE_DTFIM) //Retorna o ano no formado AAAA
	_cSeek	  := 	cCodMIX
	_cDtEmi := DTOS(ZLE->ZLE_DTFIM)
Else
	xMagHelpFis("NAO CONFORMIDADE 09 - MIX nao encontrado.",;
	"O MIX informado nos parใmetros nใo foi encontrado!",;
	"Escolha um c๓digo de MIX que exista.")
	Return()
EndIf


//Variveis Creditos/Dbito

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Cria Tabela temporaria para relacao
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If Select("TRZ") <> 0
	TRZ->(dbCloseArea())
EndIf

AAdd(aStruct,{"TRZ_FILIA"  ,"C",_nTamFil})
AAdd(aStruct,{"TRZ_FORN"   ,"C",_nTamFor})
AAdd(aStruct,{"TRZ_LOJA"   ,"C",_nTamLoj})
AAdd(aStruct,{"TRZ_VALOR"  ,"N",14,2})

cArqTRZ := CriaTrab(aStruct,.T.)
dbUseArea(.T.,,cArqTRZ,"TRZ",.F.,.F.)

cInd1TRZ := CriaTrab(Nil,.F.)
IndRegua("TRZ",cInd1TRZ,"TRZ_FILIA+TRZ_FORN+TRZ_LOJA",,,)
dbClearIndex()
dbSetIndex(cInd1TRZ+OrdBagExt())

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Obtendo dados da SA2 (Tipo P)              ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
//MsgRun("Aguarde.... Verificando Produtores...",,{||CursorWait(), MGLTQRY(cFunc), CursorArrow()})
MGLTQRY(cFunc)
nProd	:=	_nReg

//*********************************
// Grava dados da SA2 na TRZ
//*********************************
dbSelectArea(cArqTmp)
dbGoTop()
While (cArqTmp)->(!Eof())
	dbSelectArea("TRZ")
	RecLock("TRZ",.T.)
	
	TRZ->TRZ_FILIA := xFilial("ZLF")
	TRZ->TRZ_FORN  := (cArqTmp)->A2_COD
	TRZ->TRZ_LOJA  := (cArqTmp)->A2_LOJA
	TRZ->TRZ_VALOR := 0
	
	MsUnlock()
	
	(cArqTmp)->(dbSkip())
EndDo
(cArqTmp)->(dbCloseArea())

dbSelectArea("TRZ")
TRZ->(dbGoTop())

oObj:SetRegua1(nProd)

While TRZ->(!Eof())
	
	cxForn  := TRZ->TRZ_FORN
	cxLoja  := TRZ->TRZ_LOJA
	
	Begin Transaction
	
	dbSelectArea("SA2")
	SA2->(dbSetOrder(1))
	If SA2->(dbSeek(xFilial("SA2")+cxForn+cxLoja))
		
		If oObj <> Nil 
			oObj:IncRegua1("Produtor "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nProd))+" ("+AllTrim(str( round((nCont/nProd)*100,0) ))+"%) - " + SA2->A2_COD +"/"+SA2->A2_LOJA +" - "+SA2->A2_NOME)
		EndIf
		
		If !lDeuErro
			CancFina(oObj) //Cancela as baixas dos d้bitos no contas a receber, e a baixa do cr้dito no contas a pagar.
		EndIf

/*
		If !lDeuErro
			_cNrotit := SubStr(SA2->A2_COD,2,5)+SubStr(ZLE->ZLE_COD,3,4)
			DbSelectArea("SE1")
			SE1->(dbSetOrder(1)) //Caso existe titulo de juros, realiza a exclusao.
			If SE1->(dbSeek(xFilial("SE1")+"GLJ"+_cNrotit+"01"+"NF "+SA2->A2_COD+SA2->A2_LOJA))
				If SE1->E1_VALOR == SE1->E1_SALDO
					RecLock("SE1",.F.)
					SE1->(DbDelete())
					MSunlock()
					//U_ExcluSE1("GLJ",_cNrotit,"01","NF ",SA2->A2_COD,SA2->A2_LOJA)  Alterado para reclock devia a msg de IRRF quando ia excluir o titulo.
				Else
					xMagHelpFis("Erro de Exclusใo","Titulo de juros : GLJ"+_cNrotit+"01"+"NF "+SA2->A2_COD+SA2->A2_LOJA+" nใo pode ser excluido!",;
								"Verifique movimenta็๕es no titulo!   Produtor: "+Alltrim(SA2->A2_NOME))
				EndIf
			EndIf
		EndIf
*/		
		If !lDeuErro
			DeletaZLF(oObj) //Limpa da tabela registros marcados com D_E_L_E_T_ = '*'
		EndIf

		If !lDeuErro
			FlagZLF(oObj) //Limpa o campo ZLF_FINOK indicando que o fechamento financeiro NรO foi realizado.
		EndIf

		If !lDeuErro .and. !_lAuto
			AtualizaSld(oObj) //Grava dados do fechamento na tabela ZLV
		EndIf					


	Else //Seek na SA2
		xMagHelpFis("NAO CONFORMIDADE 01 - Nao existe Produtor",;
		"Produtor "+AllTrim(cxForn+cxLoja)+" nใo existe no cadastro!",;
		"Nao sera gerado Acerto para esse produtor. Verifique o c๓digo do produtor no o cadastro!","Alerta")
		lDeuErro := .T.
	EndIf //Seek na SA2
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Se houve alguma falha, desfaz todas as transacoes.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If lDeuErro
		lContinue := .F.
		DisarmTransaction()
		lDeuErro := .F.
	EndIf
	
	End Transaction
	
	
	If !lContinue
		If MsgYesNo("Ocorreram nใo conformidades no processo. Deseja continuar a rotina?")
			lContinue:=.T.
		Else
			exit
		EndIf
	EndIf
	
	TRZ->(dbSkip())
	nCont++
	
EndDo

// Deleta Tabela TRZ temporaria
Ferase(cArqTRZ + GetDbExtension())
Ferase(cArqTRZ + OrdBagExt())

//oObjProc:SaveLog("FIM - Fechamento Financeiro")
If !_lAuto
	MsgInfo("Tempo gasto no processamento:"+ELAPTIME(cHoraInicial,TIME()))
Else
	Return lContinue
EndIf


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณCancFina  ณ Autor ณMicrosiga              ณ Data ณ 00.00.00 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ Funcao para realizar o Cancelamento Financeiro.		      ณฑฑ
ฑฑณ          ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณParametrosณ ExpO01 - Objeto da Regua de processamento.                 ณฑฑ
ฑฑณ          ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ MGLT032()                                                  ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function CancFina(oObj)

Local cFunc := "2"
Local cFunc2 := "3"
Local cArqTmp1 := cGLTalias+cFunc
Local cArqTmp2 := cGLTalias+cFunc2
Local cArqTmp3 := cGLTalias+"4"
Local cArqTmp4 := cGLTalias+"5"

Local _aArea   := {}
Local _aAlias  := {}
Local nTotReg  := 0
Local nCont    := 1

//Variaveis Valores
Local nJurTit
Local nSldTit
Local _nSldCred
Local nVlrBx
Local nTotBai

Local lRetorno := .T.

Private lRetSe2 := .T.
Private lRetSe1 := .T.
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ  Salva a area. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL8","ZLF","SF1","SD1","SX1"})

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Atualiza o log de processamento   ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
oObj:SaveLog("INICIO - Busca Baixas Contas a Receber - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

//MsgRun("Aguarde.... Filtrando Contas a Receber...",,{||CursorWait(), MGLTQRY(cFunc), CursorArrow()})
 MGLTQRY(cFunc)

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Atualiza a regua de processamento.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If oObj <> Nil
	nTotReg := _nReg
	nCont   := 1
	oObj:SetRegua2(nTotReg)
EndIf

dbSelectArea(cArqTmp1)
(cArqTmp1)->(dbGoTop())

While (cArqTmp1)->(!Eof())
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Atualiza a regua de processamento.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If oObj <> Nil
		oObj:IncRegua2("Financeiro - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
		nCont++
	EndIf
	
	dbSelectArea("SE1")
	SE1->(dbSetOrder(1))//E1_FILIAL+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO
	//If SE1->(dbSeek(xFilial("SE1") + (cArqTmp1)->E1_PREFIXO + (cArqTmp1)->E1_NUM +(cArqTmp1)->E1_PARCELA + (cArqTmp1)->E1_TIPO ))
	If SE1->(dbSeek((cArqTmp1)->E1_FILIAL + (cArqTmp1)->E1_PREFIXO + (cArqTmp1)->E1_NUM +(cArqTmp1)->E1_PARCELA + (cArqTmp1)->E1_TIPO ))
		// Cancela as Baixas Dos Titulos a receber
		//CancBxSe1(cFornec,cLoja,cPrefix,cNumSe1,cParc,cTipo,cDtBx,cMotBx,cVlrBx)
		lRetSe1:=CancBxSe1((cArqTmp1)->E1_FILIAL,(cArqTmp1)->E1_CLIENTE,(cArqTmp1)->E1_LOJA,(cArqTmp1)->E1_PREFIXO,(cArqTmp1)->E1_NUM,(cArqTmp1)->E1_PARCELA,(cArqTmp1)->E1_TIPO,STOD((cArqTmp1)->E5_DATA),(cArqTmp1)->E5_MOTBX,(cArqTmp1)->E5_VALOR,(cArqTmp1)->E5RECNO)
		If lRetSe1
			//Atualiza o saldo do titulo na ZLF
			cSeek := (cArqTmp1)->E1_FILIAL+(cArqTmp1)->E1_PREFIXO + (cArqTmp1)->E1_NUM +(cArqTmp1)->E1_PARCELA + (cArqTmp1)->E1_TIPO+(cArqTmp1)->E1_CLIENTE+(cArqTmp1)->E1_LOJA
			DbSelectArea("ZLF")
			DbSetOrder(4)
			If DbSeek(xFilial("ZLF")+cCodMIX+cSeek)
				U_GrvZLF(cCodMIX,SE1->E1_L_EVENT,-(SE1->E1_SALDO),cSeek,"","MGLT033","","",0,0,"","",0,0)
			EndIf

			AtuZLL(SE1->E1_CLIENTE,SE1->E1_LOJA,SE1->E1_NUM,SE1->E1_EMISSAO,SE1->E1_VENCTO)//Atualiza convenios como ABERTO
			
		eLSE
			Alert("Falha, nใo cancelou a baixa do titulo: "+(cArqTmp1)->E1_PREFIXO + (cArqTmp1)->E1_NUM +(cArqTmp1)->E1_PARCELA + (cArqTmp1)->E1_TIPO+(cArqTmp1)->E1_CLIENTE+(cArqTmp1)->E1_LOJA )
			lDeuErro := .t.
		EndIf

	Else
		xMagHelpFis("ERRO Baixa SE1 - NAO FOI ENCONTRADO TITULO",;
		"Nใo foi o encontrado o tํtulo mencionado abaixo para realizar o cancelamento de sua baixa, favor comunicar ao departamento de informแtica.",;
		"Filial: " + xFilial("SE1") + " - Prefixo: " + (cArqTmp1)->E1_PREFIXO + " - Tipo: " +  (cArqTmp1)->E1_TIPO + " - Numero: " + (cArqTmp1)->E1_NUM +;
		" - Parcela: " + (cArqTmp1)->E1_PARCELA + " - Fornecedor: " + (cArqTmp1)->E1_CLIENTE+ "/" + (cArqTmp1)->E1_LOJA)
		lDeuErro  := .T.
	EndIf
	
	(cArqTmp1)->(DbSkip())
	
EndDo

dbSelectArea(cArqTmp1)
(cArqTmp1)->(dbCloseArea())

oObj:SaveLog("INICIO - Busca Baixas Contas a Pagar - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

//MsgRun("Aguarde.... Filtrando Contas a Pagar...",,{||CursorWait(), MGLTQRY(cFunc2), CursorArrow()})
MGLTQRY(cFunc2)

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Atualiza a regua de processamento.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If oObj <> Nil
	nTotReg := _nReg
	nCont   := 1
	oObj:SetRegua2(nTotReg)
EndIf

dbSelectArea(cArqTmp2)
(cArqTmp2)->(dbGoTop())

While (cArqTmp2)->(!Eof())
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Atualiza a regua de processamento.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If oObj <> Nil
		oObj:IncRegua2("Financeiro - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
		nCont++
	EndIf
	
	dbSelectArea("SE2")
	SE2->(dbSetOrder(1))////E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA
	If SE2->(dbSeek(xFilial("SE2") + (cArqTmp2)->E2_PREFIXO + (cArqTmp2)->E2_NUM +(cArqTmp2)->E2_PARCELA + (cArqTmp2)->E2_TIPO+(cArqTmp2)->E2_FORNECE+(cArqTmp2)->E2_LOJA))
		// Cancela as Baixas Dos Titulos a receber
		lRetSe2:=CancBxSE2((cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO,(cArqTmp2)->E2_FORNECE,(cArqTmp2)->E2_LOJA,(cArqTmp2)->E5_MOTBX,(cArqTmp2)->E5_DATA,(cArqTmp2)->E5_VALOR,(cArqTmp2)->E5_SEQ)
		If lRetSe2
			//Atualiza o saldo do titulo na ZLF
			cSeek := xFilial("SE2")+(cArqTmp2)->E2_PREFIXO + (cArqTmp2)->E2_NUM +(cArqTmp2)->E2_PARCELA + (cArqTmp2)->E2_TIPO+(cArqTmp2)->E2_FORNECE+(cArqTmp2)->E2_LOJA
			DbSelectArea("ZLF")
			DbSetOrder(4)
			If DbSeek(xFilial("ZLF")+cCodMIX+cSeek)
				U_GrvZLF(cCodMIX,SE2->E2_L_EVENT,-(SE2->E2_SALDO),cSeek,"","MGLT033","","",0,0,"","",0,0)
			EndIf
		EndIf


	Else
		xMagHelpFis("ERRO Baixa SE2 - NAO FOI ENCONTRADO TITULO",;
		"Nใo foi o encontrado o tํtulo mencionado abaixo para realizar o cancelamento de sua baixa, favor comunicar ao departamento de informแtica.",;
		"Filial: " + xFilial("SE2") + " - Prefixo: " + (cArqTmp2)->E2_PREFIXO + " - Tipo: " +  (cArqTmp2)->E2_TIPO + " - Numero: " + (cArqTmp2)->E2_NUM +;
		" - Parcela: " + (cArqTmp2)->E2_PARCELA + " - Fornecedor: " + (cArqTmp2)->E2_FORNECE+ "/" + (cArqTmp2)->E2_LOJA)
		lDeuErro  := .T.
	EndIf
	
	(cArqTmp2)->(DbSkip())
	
EndDo

dbSelectArea(cArqTmp2)
(cArqTmp2)->(dbCloseArea())


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Atualiza o log de processamento   ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
oObj:SaveLog("INICIO - Busca Titulos Contas a Receber a Excluir - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

//MsgRun("Aguarde.... Filtrando Titulos a Receber para Excluir...",,{||CursorWait(), MGLTQRY("4"), CursorArrow()})
MGLTQRY("4")

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Atualiza a regua de processamento.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If oObj <> Nil
	nTotReg := _nReg
	nCont   := 1
	oObj:SetRegua2(nTotReg)
EndIf

dbSelectArea(cArqTmp3)
(cArqTmp3)->(dbGoTop())

While (cArqTmp3)->(!Eof())
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Atualiza a regua de processamento.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If oObj <> Nil
		oObj:IncRegua2("Financeiro - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
		nCont++
	EndIf
	
	dbSelectArea("SE1")
	SE1->(dbSetOrder(1))//E1_FILIAL+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO
	If SE1->(dbSeek((cArqTmp3)->E1_FILIAL + (cArqTmp3)->E1_PREFIXO + (cArqTmp3)->E1_NUM +(cArqTmp3)->E1_PARCELA + (cArqTmp3)->E1_TIPO ))
		// Exclui Titulos a receber
		lRetSe1:= U_ExcluSE1((cArqTmp3)->E1_FILIAL,(cArqTmp3)->E1_PREFIXO,(cArqTmp3)->E1_NUM,(cArqTmp3)->E1_PARCELA,(cArqTmp3)->E1_TIPO,(cArqTmp3)->E1_CLIENTE,(cArqTmp3)->E1_LOJA)
	Else
		xMagHelpFis("ERRO Baixa SE1 - NAO FOI ENCONTRADO TITULO",;
		"Nใo foi o encontrado o tํtulo mencionado abaixo para realizar sua exclusao, favor comunicar ao departamento de informแtica.",;
		"Filial: " + xFilial("SE1") + " - Prefixo: " + (cArqTmp3)->E1_PREFIXO + " - Tipo: " +  (cArqTmp3)->E1_TIPO + " - Numero: " + (cArqTmp3)->E1_NUM +;
		" - Parcela: " + (cArqTmp3)->E1_PARCELA + " - Fornecedor: " + (cArqTmp3)->E1_CLIENTE+ "/" + (cArqTmp3)->E1_LOJA)
		lDeuErro  := .T.
	EndIf
	
	(cArqTmp3)->(DbSkip())
	
EndDo

dbSelectArea(cArqTmp3)
(cArqTmp3)->(dbCloseArea())


oObj:SaveLog("INICIO - Busca Titulos Contas a Pagar - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

//MsgRun("Aguarde.... Filtrando Titulos Contas a Pagar para exclusao...",,{||CursorWait(), MGLTQRY("5"), CursorArrow()})
MGLTQRY("5")

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Atualiza a regua de processamento.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If oObj <> Nil
	nTotReg := _nReg
	nCont   := 1
	oObj:SetRegua2(nTotReg)
EndIf

dbSelectArea(cArqTmp4)
(cArqTmp4)->(dbGoTop())

While (cArqTmp4)->(!Eof())
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Atualiza a regua de processamento.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If oObj <> Nil
		oObj:IncRegua2("Financeiro - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
		nCont++
	EndIf
	
	dbSelectArea("SE2")
	SE2->(dbSetOrder(1))////E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA
	If SE2->(dbSeek(xFilial("SE2") + (cArqTmp4)->E2_PREFIXO + (cArqTmp4)->E2_NUM +(cArqTmp4)->E2_PARCELA + (cArqTmp4)->E2_TIPO+(cArqTmp4)->E2_FORNECE+(cArqTmp4)->E2_LOJA))
		// Cancela as Baixas Dos Titulos a receber
		//CancBxSE2(cPrefix,cNumSe2,cParc,cTipo,cCod,cLoja,cMotBx,cDtBx,cVlrBx,cSeqBx)
		lRetSe2:= U_ExcluSE2((cArqTmp4)->E2_PREFIXO,(cArqTmp4)->E2_NUM,(cArqTmp4)->E2_PARCELA,(cArqTmp4)->E2_TIPO,(cArqTmp4)->E2_FORNECE,(cArqTmp4)->E2_LOJA)
	Else
		xMagHelpFis("ERRO Baixa SE2 - NAO FOI ENCONTRADO TITULO",;
		"Nใo foi o encontrado o tํtulo mencionado abaixo para realizar a exclusao, favor comunicar ao departamento de informแtica.",;
		"Filial: " + xFilial("SE2") + " - Prefixo: " + (cArqTmp4)->E2_PREFIXO + " - Tipo: " +  (cArqTmp4)->E2_TIPO + " - Numero: " + (cArqTmp4)->E2_NUM +;
		" - Parcela: " + (cArqTmp4)->E2_PARCELA + " - Fornecedor: " + (cArqTmp4)->E2_FORNECE+ "/" + (cArqTmp4)->E2_LOJA)
		lDeuErro  := .T.
	EndIf
	
	(cArqTmp4)->(DbSkip())
	
EndDo

dbSelectArea(cArqTmp4)
(cArqTmp4)->(dbCloseArea())


If lRetSe1 == .T. .OR. lRetSe2 == .T.
	lDeuErro := .F.
Else
	lDeuErro := .T.
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Restaura a area. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
CtrlArea(2,_aArea,_aAlias)

Return lRetorno


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAtuZLL   บAutor  ณMicrosiga           บ Data ณ  02/03/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Atualiza o campo ZLL_STATUS dos convenios como ABERTO.    บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function AtuZLL(xcProd,xcLoj,xcNum,xdEmis,xdVenc)

Local _cUpdate := ""

_cUpdate := " UPDATE ZLL010 SET ZLL_STATUS = 'A' "
_cUpdate += " WHERE ZLL_COD+ZLL_SEQ = '"+xcNum+"' "
_cUpdate += " AND ZLL_RETIRO = '"+xcProd+"' "
_cUpdate += " AND ZLL_RETILJ = '"+xcLoj+"' "
_cUpdate += " AND ZLL_DATA = '"+DTOS(xdEmis)+"' "
_cUpdate += " AND ZLL_VENCTO = '"+DTOS(xdVenc)+"' "

lSqlOk := !(TCSqlExec(_cUpdate) < 0)

If lSqlOk .and.  (TcGetDB() == 'ORACLE')
	lSqlOk := !(TCSqlExec(" COMMIT ") < 0)
EndIf


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณDeletaZLF บAutor  ณMicrosiga           บ Data ณ  08/26/15   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Limpa tabela ZLF para evitar aumetno do arquivo com registros บฑฑ
ฑฑบ          ณ sem necessidade.                                           บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function DeletaZLF(oObj)

Local cQry := ""


cQry := "DELETE FROM"
cQry += " "+RETSQLNAME("ZLF")
cQry += " WHERE D_E_L_E_T_ = '*'"
cQry += " AND ZLF_FILIAL = '" + xFilial("ZLF") + "' "
cQry += " AND ZLF_CODZLE = '"+cCodMIX+"' "
cQry += " AND ZLF_RETIRO  = '" + SA2->A2_COD + "' "
cQry += " AND ZLF_RETILJ = '" + SA2->A2_LOJA + "'"
lSqlOk := !(TCSqlExec(cQry) < 0)
If lSqlOk .and.  (TcGetDB() == 'ORACLE')
	lSqlOk := !(TCSqlExec(" COMMIT ") < 0)
EndIf
		
If !lSqlOk 
	xMagHelpFis("NAO CONFORMIDADE 12 - NO DELETE",;
	TcSqlError(),;
	"Verifique a Sintaxe da Query de DELETE.")
	lDeuErro := .T.
EndIf

// DELETA REGISTRO DE TITULOS QUE NAO TINHA SOFRIDO BAIXAS
cQry := "DELETE FROM"
cQry += " "+RETSQLNAME("ZLF")
cQry += " WHERE D_E_L_E_T_ = ' '"
cQry += " AND ZLF_FILIAL = '" + xFilial("ZLF") + "' "
cQry += " AND ZLF_CODZLE = '"+cCodMIX+"' "
cQry += " AND ZLF_RETIRO  = '" + SA2->A2_COD + "' "
cQry += " AND ZLF_RETILJ = '" + SA2->A2_LOJA + "'"
cQry += " AND ZLF_ORIGEM =  'F'" //So deleta originados pela rotina do Acerto
cQry += " AND ZLF_SE1SLD > 0 " //Deleta se nao realizou acerto definitivo

lSqlOk := !(TCSqlExec(cQry) < 0)

If lSqlOk .and.  (TcGetDB() == 'ORACLE')
	lSqlOk := !(TCSqlExec(" COMMIT ") < 0)
EndIf
		
If !lSqlOk 
	xMagHelpFis("NAO CONFORMIDADE 12 - NO DELETE",;
	TcSqlError(),;
	"Verifique a Sintaxe da Query de DELETE.")
	lDeuErro := .T.
EndIf


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณFlagZLF บAutor  ณGUILHERME FRANCA    บ Data ณ  21/04/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Limpa o campo ZLF_FINOK indicando que o fechamento foi Cancelado.
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function FlagZLF(oObj)

Local cQry := ""


cQry := "UPDATE "+RETSQLNAME("ZLF")
cQry += " SET ZLF_FINOK = ' ' "
cQry += " WHERE D_E_L_E_T_ = ' '"
cQry += " AND ZLF_FILIAL = '" + xFilial("ZLF") + "' "
cQry += " AND ZLF_CODZLE = '"+cCodMIX+"' "
cQry += " AND ZLF_RETIRO  = '" + SA2->A2_COD + "' "
cQry += " AND ZLF_RETILJ = '" + SA2->A2_LOJA + "'"
lSqlOk := !(TCSqlExec(cQry) < 0)

If lSqlOk .and.  (TcGetDB() == 'ORACLE')
	lSqlOk := !(TCSqlExec(" COMMIT ") < 0)
EndIf

		
If !lSqlOk 
	xMagHelpFis("NAO CONFORMIDADE 12 - NO UPDATE",;
	TcSqlError(),;
	"Verifique a Sintaxe da Query de UPDATE.")
	lDeuErro := .T.
EndIf

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณMGLTQRY  ณ Autor ณMicrosiga              ณ Data ณ 00.00.00 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ Funcao para executar querys e gerar arquivo temporario com ณฑฑ
ฑฑณ          ณ o resultado da query.                                      ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณParametrosณ ExpC01 - Caracter que identifica a query a ser chamada de  ณฑฑ
ฑฑณ          ณ          acordo com a rotina de Acerto em execucao.        ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ MGLT009()                                                  ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function MGLTQRY(cOpc)

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Declaracao de variavies locais. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Local cQry   := ""
Local lSqlOk := .T.
Local _cAuxAlias := cGLTalias+cOpc

Do Case
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Filtra os produtores 	          ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Case cOpc == "1"
		cQry := "SELECT A2_COD,A2_LOJA "
		cQry += " FROM " + RetSqlName("SA2")+ " A2 "
		cQry += " 	JOIN " + RetSqlName("ZLF")+ " LF ON ZLF_FILIAL = '" + xFilial("ZLF") + "' AND LF.ZLF_CODZLE = '"+cCodMIX+"' AND LF.ZLF_RETIRO = A2.A2_COD AND LF.ZLF_RETILJ = A2.A2_LOJA "
		cQry += " 	 AND LF.ZLF_SEQ = '001' AND LF.D_E_L_E_T_ = ' ' AND LF.ZLF_FINOK = 'S' "
		cQry += " WHERE  "
		cQry += " A2_FILIAL = '" + xFilial("SA2") + "'"
		cQry += " AND A2_L_TPFOR = 'P'" //Produtor Cooperado
		cQry += " AND A2_COD  BETWEEN '" + _cProdDe +"' AND '"+ _cProdAte +"'"
		cQry += " AND A2_LOJA  BETWEEN '" + _cLojaDe +"' AND '"+ _cLojaAte +"'"		
		cQry += " AND A2_L_GRUPO BETWEEN '" + _cGrupoDe +"' AND '"+ _cGrupoAte +"'"
		cQry += " AND A2.D_E_L_E_T_ = ' ' "
		cQry += " ORDER BY A2_COD, A2_LOJA "
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Busca Baixas Contas a Receber     ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Case cOpc == "2"

		If (TcGetDB() == 'ORACLE')
			// cQry := AND "%SUBSTR(SE5.E5_L_SEEK,1,6)  = '" + _cSeek +  "'  %"
			 //cQry :="% SUBSTR(SE5.E5_L_SEEK,1,6)  = '" + _cSeek +  "'  %"
			 cQry := "% SE5.E5_DATA > '"+_cDtEmi+"' AND SUBSTR(SE5.E5_MOTBX,1,2) = '"+SubStr(_cMotBaixa,1,2)+"' %"
		Else
			//cQry := AND "%LEFT(SE5.E5_L_SEEK,6)  = '" + _cSeek +  "'  %"
			cQry := "% LEFT(SE5.E5_L_SEEK,6)  = '" + _cSeek +  "'  %"
		EndIf


/*		cQry := "SELECT SE1.E1_FILIAL,SE1.E1_PREFIXO,SE1.E1_NUM,SE1.E1_PARCELA,SE1.E1_TIPO,SE1.E1_CLIENTE,SE1.E1_LOJA,SE5.E5_VALOR,SE5.E5_SEQ,E5_MOTBX, "
		cQry += " SE5.E5_DATA, SE5.R_E_C_N_O_ AS E5RECNO FROM "
		cQry += RetSqlName("SE1") + " SE1, "+RetSqlName("SE5") + " SE5, "+RetSqlName("SA2") + " A2 "
		cQry += " WHERE SE1.E1_FILIAL  = '"+xFilial("SE1")+"'  "
		cQry += " AND SE1.E1_CLIENTE = '" + cxForn   + "'"
		cQry += " AND SE5.E5_CLIFOR  = '" + cxForn   + "'"
		cQry += " AND SE1.E1_SALDO   <> SE1.E1_VALOR "
		cQry += " AND A2.A2_COD = SE1.E1_CLIENTE AND A2.A2_LOJA = SE1.E1_LOJA AND A2.D_E_L_E_T_ = ' ' "
		cQry += " AND A2.A2_COD = '" + cxForn +"' AND A2.A2_LOJA = '" + cxLoja +"' "
		cQry += " AND SE1.E1_FILIAL  = SE5.E5_FILIAL"
		cQry += " AND SE1.E1_PREFIXO = SE5.E5_PREFIXO"
		cQry += " AND SE1.E1_NUM     = SE5.E5_NUMERO"
		cQry += " AND SE1.E1_PARCELA = SE5.E5_PARCELA"
		cQry += " AND SE1.E1_TIPO    = SE5.E5_TIPO"
		cQry += " AND SE1.E1_CLIENTE = SE5.E5_CLIFOR"
		//cQry += " AND SE1.E1_LOJA    = SE5.E5_LOJA"
		cQry += " AND SE5.E5_SITUACA <> 'C'"
		cQry += " AND SE5.E5_TIPODOC = 'BA'"
		cQry += " AND SE1.D_E_L_E_T_ = ' ' AND SE5.D_E_L_E_T_ = ' '"
		If (TcGetDB() == 'ORACLE')
			cQry += " AND SUBSTR(SE5.E5_L_SEEK,1,6)  = '" + _cSeek +  "'"
		Else
			cQry += " AND LEFT(SE5.E5_L_SEEK,6)  = '" + _cSeek +  "'"
		EndIf
		cQry += " ORDER BY E1_FILIAL,E1_PREFIXO,E1_NUM,E1_PARCELA,E1_TIPO"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
*/
		BeginSql alias _cAuxAlias
			SELECT SE1.E1_FILIAL, 
			       SE1.E1_PREFIXO, 
			       SE1.E1_NUM, 
			       SE1.E1_PARCELA, 
			       SE1.E1_TIPO, 
			       SE1.E1_CLIENTE, 
			       SE1.E1_LOJA, 
			       SE5.E5_VALOR, 
			       SE5.E5_SEQ, 
			       E5_MOTBX, 
			       SE5.E5_DATA, 
			       SE5.R_E_C_N_O_ AS E5RECNO 
			FROM   %Table:SE1% SE1 
			       JOIN %Table:SE5% SE5 ON SE1.E1_FILIAL = SE5.E5_FILIAL
								  AND SE1.E1_PREFIXO = SE5.E5_PREFIXO 
								  AND SE1.E1_NUM = SE5.E5_NUMERO 
								  AND SE1.E1_PARCELA = SE5.E5_PARCELA 
								  AND SE1.E1_TIPO = SE5.E5_TIPO 
								  AND SE1.E1_CLIENTE = SE5.E5_CLIFOR 
								  AND SE5.E5_LOJA = SE1.E1_LOJA 
								  AND SE5.E5_SITUACA <> 'C' 
								  AND SE5.E5_TIPODOC = 'BA' 
								  AND %Exp:cQry%
								  AND SE5.%NotDel%
			WHERE	SE1.E1_FILIAL = %xFilial:SE1%  
					AND SE1.E1_CLIENTE = %Exp:cxForn% 
					AND SE1.E1_LOJA = %Exp:cxLoja%
					AND SE1.E1_SALDO <> SE1.E1_VALOR 
					AND SE1.%NotDel%
			ORDER  BY E1_FILIAL, 
			          E1_PREFIXO, 
			          E1_NUM, 
			          E1_PARCELA, 
			          E1_TIPO
		EndSql 
		  
		dbSelectArea(_cAuxAlias)
		Count To _nReg
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Busca Baixas Contas a Pagar       ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Case cOpc == "3"
		cQry := "SELECT SE2.E2_FILIAL,SE2.E2_PREFIXO,SE2.E2_NUM,SE2.E2_PARCELA,SE2.E2_TIPO,SE2.E2_FORNECE,SE2.E2_LOJA,SE5.E5_VALOR,SE5.E5_SEQ,E5_MOTBX,SE5.E5_DATA FROM "
		cQry += RetSqlName("SE2") + " SE2, "+RetSqlName("SE5") + " SE5, "+RetSqlName("SA2") + " A2 "
		cQry += " WHERE SE2.E2_FILIAL  = '"+xFilial("SE2")+"'  "
		cQry += " AND SE2.E2_FORNECE = '" + cxForn   + "'"
		cQry += " AND SE5.E5_CLIFOR  = '" + cxForn   + "'"
		cQry += " AND SE2.E2_SALDO   <> SE2.E2_VALOR"
		cQry += " AND SE2.E2_TIPO IN ('NDF','NF ')"

		cQry += " AND A2.A2_COD = SE2.E2_FORNECE AND A2.A2_LOJA = SE2.E2_LOJA AND A2.D_E_L_E_T_ = ' ' "
		cQry += " AND A2.A2_COD = '" + cxForn +"' AND A2.A2_LOJA = '" + cxLoja +"' "

		cQry += " AND SE2.E2_FILIAL  = SE5.E5_FILIAL"
		cQry += " AND SE2.E2_PREFIXO = SE5.E5_PREFIXO"
		cQry += " AND SE2.E2_NUM     = SE5.E5_NUMERO"
		cQry += " AND SE2.E2_PARCELA = SE5.E5_PARCELA"
		cQry += " AND SE2.E2_TIPO    = SE5.E5_TIPO"
		cQry += " AND SE2.E2_FORNECE = SE5.E5_CLIFOR"
		cQry += " AND SE2.E2_LOJA    = SE5.E5_LOJA"
		cQry += " AND SE5.E5_SITUACA <> 'C'"
		cQry += " AND SE5.E5_TIPODOC = 'BA'"
		cQry += " AND SE2.D_E_L_E_T_ = ' ' AND SE5.D_E_L_E_T_ = ' '"
		If (TcGetDB() == 'ORACLE')
			//cQry += " AND SUBSTR(SE5.E5_L_SEEK,1,6)  = '" + _cSeek +  "'"
			cQry += " AND SE5.E5_DATA > '"+_cDtEmi+"'  AND SUBSTR(SE5.E5_MOTBX,1,2) = '"+SubStr(_cMotBaixa,1,2)+"' " 
		Else
			cQry += " AND LEFT(SE5.E5_L_SEEK,6)  = '"+ _cSeek + "'"
		EndIf
		cQry += " ORDER BY E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg

		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Busca Titulos Contas a Receber para exclusao     ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Case cOpc == "4"
		cQry := "SELECT SE1.E1_FILIAL,SE1.E1_PREFIXO,SE1.E1_NUM,SE1.E1_PARCELA,SE1.E1_TIPO,SE1.E1_CLIENTE,SE1.E1_LOJA FROM "
		cQry += RetSqlName("SE1") + " SE1, "+RetSqlName("SA2") + " A2 "
		cQry += " WHERE SE1.E1_FILIAL  = '"+xFilial("SE1")+"'  "
		cQry += " AND A2.A2_COD = SE1.E1_CLIENTE AND A2.A2_LOJA = SE1.E1_LOJA AND A2.D_E_L_E_T_ = ' ' "
		cQry += " AND A2.A2_COD = '" + cxForn +"' AND A2.A2_LOJA = '" + cxLoja +"' "
		cQry += " AND SE1.E1_CLIENTE = '" + cxForn   + "'"
		cQry += " AND SE1.E1_EMISSAO  = '"+_cDtEmi+"' "
		cQry += " AND SE1.E1_SALDO  = SE1.E1_VALOR"
		cQry += " AND SE1.E1_L_SITUA  = 'I' "
		cQry += " AND SE1.E1_L_EVENT = '"+_cEveDeb+"' "
		cQry += " AND SE1.D_E_L_E_T_ = ' ' "
		cQry += " ORDER BY E1_FILIAL,E1_PREFIXO,E1_NUM,E1_PARCELA,E1_TIPO"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg

		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Busca Titulos Contas a Pagar para exclusao     ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Case cOpc == "5"
		cQry := "SELECT SE2.E2_FILIAL,SE2.E2_PREFIXO,SE2.E2_NUM,SE2.E2_PARCELA,SE2.E2_TIPO,SE2.E2_FORNECE,SE2.E2_LOJA FROM "
		cQry += RetSqlName("SE2") + " SE2, "+RetSqlName("SA2") + " A2 "
		cQry += " WHERE SE2.E2_FILIAL  = '"+xFilial("SE2")+"' "
		cQry += " AND A2.A2_COD = SE2.E2_FORNECE AND A2.A2_LOJA = SE2.E2_LOJA AND A2.D_E_L_E_T_ = ' ' "
		cQry += " AND A2.A2_COD = '" + cxForn +"' AND A2.A2_LOJA = '" + cxLoja +"' "
		cQry += " AND SE2.E2_FORNECE = '" + cxForn   + "'"
		cQry += " AND SE2.E2_EMISSAO  = '"+_cDtEmi+"' "
		cQry += " AND SE2.E2_SALDO  = SE2.E2_VALOR"
		cQry += " AND SE2.E2_L_SITUA  = 'I' "
		cQry += " AND SE2.E2_L_EVENT = '"+_cEveCred+"' "
		cQry += " AND SE2.D_E_L_E_T_ = ' ' "
		cQry += " ORDER BY E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg


EndCase

Return()


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณ CancBxSe1ณ Autor ณMicrosiga              ณ Data ณ 00.00.00 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ Exclui titulo no contas a pagar via SigaAuto.              ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณParametrosณ  								                 	      ณฑฑ
ฑฑณ          ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ GENERICO                                                   ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function CancBxSe1(xcFil,cFornec,cLoja,cPrefix,cNumSe1,cParc,cTipo,cDtBx,cMotBx,cVlrBx,cRecE5)

Local _lRetorno		:= .T.
Local _cQry
Local _cArqTmp 		:= GetNextAlias()
Local nModAnt 		:= nModulo
Local cModAnt 		:= cModulo
Local _aArea			:= GetArea()
Local _nRecSE1 := 0
Local _nAcresc := 0
Local _dDtBkpBas    := dDataBase
Private lMsErroAuto := .F.
Private lMsHelpAuto := .T.


DbSelectArea("SE1")
SE1->(DbSetOrder(1))
//E1_FILIAL+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO
If SE1->(dbSeek(xcFil + cPrefix + cNumSe1+ cParc + cTipo + cFornec + cLoja))

/*	
// O SIGAAUTO DE CANCELAMENTO DE BAIXAS A RECEBER, NรO PERMITE ESCOLHER A BAIXA QUE SERม CANCELADA EM CASO DE EXISTIREM BAIXAS PARCIAIS
// POR ESTE MOTIVO ELE FOI REMOVIDO E SUBSTITUIDO POR RECLOCK.
	_nRecSE1 := SE1->(Recno())
	
	DbSelectArea("SE5")
	DbGoTo(cRecE5)
	RecLock("SE5",.F.)
	SE5->E5_SITUACA := "C"
	SE5->E5_DTCANBX := DDATABASE
	_nAcresc := SE5->E5_VLACRES
	SE5->(MsUnlock())


	DbSelectArea("SE1")
	DbGoTo(_nRecSE1)
	RecLock("SE1",.F.)
	SE1->E1_SALDO := IIf((SE1->E1_SALDO + cVlrBx)>SE1->E1_VALOR,SE1->E1_VALOR,SE1->E1_SALDO + cVlrBx)
	SE1->E1_STATUS := "A"
	SE1->E1_VALLIQ :=  SE1->E1_VALOR - SE1->E1_SALDO
	SE1->E1_SDACRES := _nAcresc
	If SE1->E1_SALDO == SE1->E1_VALOR
		SE1->E1_BAIXA :=  STOD("")
	EndIf

	SE1->(MsUnlock())
*/

 dDataBase := cDtBx    

	aBaixa := {{"E1_PREFIXO"  ,cPrefix  ,Nil    },;
	{"E1_NUM"      ,cNumSe1   ,Nil    },;
	{"E1_PARCELA"  ,cParc	  ,Nil    },;
	{"E1_TIPO"     ,cTipo	  ,Nil    },;
	{"AUTMOTBX"    ,cMotBx 	  ,Nil    },;
	{"AUTBANCO"    ,"	"     ,Nil    },;
	{"AUTAGENCIA"  ,"	"     ,Nil    },;
	{"AUTCONTA"    ,"	"     ,Nil    },;
	{"AUTDTBAIXA"  ,cDtBx      ,Nil    },;
	{"AUTDTCREDITO",cDtBx      ,Nil    },;
	{"AUTHIST"     ,"Cancto Bx - " + cFornec + cLoja,Nil},;
	{"AUTJUROS"    ,0          ,Nil	  },;
	{"AUTVALREC"   ,cVlrBx     ,Nil   }}
	
	nModulo := 6
	cModulo := "FIN"
	
	//ณ Busca o numero da Baixa.
	_nBaixa := 0 //NroSeqSE1(cPrefix,cNumSe1,cParc,cTipo,cFornec,cLoja,cSeq)
	
	Pergunte("FIN070",.F.)//Chama os parametros da rotina para nao gerar erro
	
	lMsHelpAuto := .T.
	
//	MSExecAuto({|x,y| Fina070(x,y)},aBaixa,5,,_nBaixa)
	MSExecAuto({|x,y| Fina070(x,y)},aBaixa,5)
	
	Pergunte(_cPerg,.F.)//Chama os parametros da rotina para nao gerar erro
	
	nModulo := nModAnt
	cModulo := cModAnt
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Verifica se houve erro no SigaAuto, caso haja mostra o erro. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If lMsErroAuto
		xMagHelpFis("NAO CONFORMIDADE 01 - SIGAAUTO BAIXA TITULO",;
		"Existe uma nใo conformidade no SigaAuto de Baixa de Contas a Receber!",;
		xFilial("SE1")+cPrefix+cNumSe1+;
		cParc+cTipo+cFornec+ cLoja+;
		"     <-  Copie essas informa็๕es para voce pesquisar no Contas a Receber o titulo que esta com nใo conformidade. "+;
		"Ap๓s confirmar esta tela, sera apresentada a tela de Nใo Conformidade do SigaAuto.")
		MostraErro()
		lRetorno :=.F.
	EndIf
Else
	
	xMagHelpFis("ERRO 02 - NAO FOI ENCONTRADO TITULO",;
	"Nใo foi o encontrado o tํtulo mencionado abaixo para realizar o cancelamento de sua baixa, favor comunicar ao departamento de informแtica.",;
	"Filial: " + xcFil + " - Prefixo: " + cPrefix+ " - Tipo: " +  cTipo + " - Numero: " + cNumSe1 +;
	" - Parcela: " + cParc + " - Fornecedor: " + cFornec + "/" +  cLoja)
	Return .F.
EndIf

 dDataBase := _dDtBkpBas    

RestArea(_aArea)




Return _lRetorno
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณ CancBxSE2ณ Autor ณMicrosiga              ณ Data ณ 00.00.00 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ Cancela Baixa de titulo no contas a pagar via SigaAuto.    ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณParametrosณ Nenhum.                                                    ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ GENERICO                                                   ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function CancBxSE2(cPrefix,cNumSe2,cParc,cTipo,cCod,cLoja,cMotBx,cDtBx,cVlrBx,cSeqBx)

Local cFunc   		:= "2" //Codigo da Qry a ser executada
Local _cArqTmp 		:= cGLTalias+cFunc
Local nCont   		:= 1
Local nTotReg 		:= 0
Local nModAnt 		:= nModulo
Local cModAnt 		:= cModulo
Local _aArea  		:= {}
Local _aAlias 		:= {}
Local aAreaTmp		:= {}
Local lRetorno		:= .T.

Local _dDtBkpBas    := dDataBase
Local _cFilBkp 		:= cFilAnt
//Local cPrefCv := Posicione("ZL8",1,xFilial("ZL8")+AllTrim(GetMv("LT_CONVEXT")),"ZL8_PREFIX") //Evento de convenio

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณEfetua o backup da filial corrente.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Local _cBkpFil		:= cFilAnt
Private lMsErroAuto := .F.
Private lMsHelpAuto := .T.

dDataBase:= StoD(cDtBx)

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Tratamento para liberar o titulo para baixa no financeiro. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
DbSelectArea("SE2")
DbSetOrder(1) ///// LIBERACAO DO TITULO GERADO PELO FUNRURAL
If SE2->(dbSeek(xFilial("SE2") + cPrefix + cNumSe2 + '001' + 'TX'))
	If Empty(SE2->E2_DATALIB)//Se nao foi liberado ainda
		RecLock("SE2",.F.)
		SE2->E2_DATALIB := dDataBase
		SE2->E2_USUALIB := Alltrim(cUserName)
		MsUnLock()
	EndIf
EndIf

DbSelectArea("SE2")
DbSetOrder(1)
If SE2->(dbSeek(xFilial("SE2") + cPrefix + cNumSe2 + cParc + cTipo + cCod + cLoja))
	If Empty(SE2->E2_DATALIB)//Se nao foi liberado ainda
		RecLock("SE2",.F.)
		SE2->E2_DATALIB := dDataBase
		SE2->E2_USUALIB := Alltrim(cUserName)
		MsUnLock()
	EndIf
EndIf


DbSelectArea("SE2")
SE2->(DbSetOrder(1))
//E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA
If SE2->(dbSeek(xFilial("SE2") + cPrefix + cNumSe2 + cParc + cTipo + cCod + cLoja))
	
	_aTitulo := {{"E2_PREFIXO",cPrefix 				,Nil},;
	{"E2_NUM"	    ,cNumSe2	     				,Nil},;
	{"E2_PARCELA"   ,cParc  						,Nil},;
	{"E2_TIPO"	    ,cTipo     						,Nil},;
	{"E2_FORNECE"   ,cCod           				,Nil},;
	{"E2_LOJA"	    ,cLoja    						,Nil},;
	{"AUTJUROS"		,0				        		,Nil},;
	{"AUTDESCONT"	,0		 		        		,Nil},;
	{"AUTMOTBX"		,cMotBx    						,Nil},;
	{"AUTDTBAIXA"	,cDtBx	    					,Nil},;
	{"AUTDTCREDITO"	,cDtBx    						,Nil},;
	{"AUTHIST"		,"Cancto Bx - " + cCod + cLoja	,Nil},;
	{"AUTVLRPG"		,cVlrBx							,Nil},;
	{"AUTVALREC"	,cVlrBx							,Nil}}
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Altera o modulo para Financeiro, senao o SigaAuto nao executa.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	nModulo := 6
	cModulo := "FIN"
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Busca o numero da Baixa.                                      ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	_nBaixa := SeqSE2(cPrefix,cNumSe2,cParc ,cTipo,cCod ,cLoja,cSeqBx)
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ SigaAuto de Cancelamento de Baixa de Contas a Pagar. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Pergunte("FIN080",.F.)//Chama os parametros da rotina para nao gerar erro
	//MSExecAuto( {|x,y,z,k| Fina080(x,y,z,k)},_aTitulo,5,.F.)
	MSExecAuto( {|x,y,z,k| Fina080(x,y,z,k)},_aTitulo,5,.F.,_nBaixa)
	//		MSExecAuto( {|x,y,z| Fina080(x,y,z)},_aTitulo,5,.T.)
	
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
		//oObj:SaveLog("ERRO 04 - SIGAAUTO BAIXA")
		xMagHelpFis("NAO CONFORMIDADE 03 - SIGAAUTO BAIXA TITULO",;
		"Existe uma nใo conformidade no SigaAuto de Baixa de Contas a Pagar!",;
		xFilial("SE2")+cPrefix+cNumSe2+;
		cParc+cTipo+cCod+cLoja+;
		"     <-  Copie essas informa็๕es para voce pesquisar no Contas a Pagar o titulo que esta com nใo conformidade. "+;
		"Ap๓s confirmar esta tela, sera apresentada a tela de Nใo Conformidade do SigaAuto.")
		MostraErro()
		lRetorno :=.F.
	Else
		
		_cUpdate := " UPDATE " + RetSqlName("SE2")
		
		_cUpdate += " SET E2_DATALIB = ' '"
		_cUpdate += " WHERE D_E_L_E_T_ = ' '"
		_cUpdate += " AND E2_FILIAL    = '" + xFilial("SE2") + "'"
		_cUpdate += " AND E2_PREFIXO   = '" + cPrefix + "'"
		_cUpdate += " AND E2_NUM       = '" + cNumSe2     + "'"
		_cUpdate += " AND E2_PARCELA   = '" + cParc + "'"
		_cUpdate += " AND E2_TIPO      = '" + cTipo  + "'"
		_cUpdate += " AND E2_FORNECE   = '" + cCod           + "'"
		_cUpdate += " AND E2_LOJA      = '" + cLoja   + "'"
		lSqlOk := !(TCSqlExec(_cUpdate) < 0)
		
		If lSqlOk .and.  (TcGetDB() == 'ORACLE')
			lSqlOk := !(TCSqlExec(" COMMIT ") < 0)
		EndIf
		
		If !lSqlOk
			lRetorno := .F.
			oObj:SaveLog("ERRO 04 - UPDATE E2_L_MIX")
			xMagHelpFis("NAO CONFORMIDADE 07 - UPDATE DO COD. MIX",;
			TcSqlError(),;
			"Nใo Conformidade ao executar o Update na Se2 para limpar data de Libera็ใo! "+;
			"Nใo confirme esta mensagem e informe ao Suporte T้cnico.")
		EndIf
		
	EndIf
	
Else
	lRetorno := .F.
	xMagHelpFis("ERRO 04 - NAO FOI ENCONTRADO TITULO",;
	"Nใo foi o encontrado o tํtulo mencionado abaixo para realizar o cancelamento de sua baixa, favor comunicar ao departamento de informแtica.",;
	"Filial: " + xFilial("SE2") + " - Prefixo: " + cPrefix + " - Tipo: " +  cTipo + " - Numero: " + cNumSe2 +;
	" - Parcela: " + cParc + " - Fornecedor: " + cCod + "/" + cLoja)
EndIf


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณRestaura a database antes de efetuar o cancelamento das baixas.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
dDataBase:= _dDtBkpBas

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณRestaura a filial corrente antes do processo.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
cFilAnt:= _cBkpFil

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Restaura a area. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู


Return lRetorno
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ CtrlArea บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Static Function auxiliar no GetArea e ResArea retornando   บฑฑ
ฑฑบ          ณ o ponteiro nos Aliases descritos na chamada da Funcao.     บฑฑ
ฑฑบ          ณ Exemplo:                                                   บฑฑ
ฑฑบ          ณ Local aArea   := {} // Array que contera o GetArea         บฑฑ
ฑฑบ          ณ Local aAlias  := {} // Array que contera o                 บฑฑ
ฑฑบ          ณ                     // Alias(), IndexOrd(), Recno()        บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑบ          ณ // Chama a Funcao como GetArea                             บฑฑ
ฑฑบ          ณ P_CtrlArea(1,@aArea ,@aAlias ,{"SL1","SL2","SL4"})         บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑบ          ณ // Chama a Funcao como RestArea                            บฑฑ
ฑฑบ          ณ P_CtrlArea(2,aArea ,aAlias )                               บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ nTipo   = 1=GetArea / 2=RestArea                           บฑฑ
ฑฑบ          ณ aArea   = Array passado por referencia que contera GetArea บฑฑ
ฑฑบ          ณ aAlias  = Array passado por referencia que contera         บฑฑ
ฑฑบ          ณ           {Alias(), IndexOrd(), Recno()}                   บฑฑ
ฑฑบ          ณ _aArqs  = Array com Aliases que se deseja Salvar o GetArea บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ GENERICO                                                   บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function CtrlArea(nTipo,aArea,aAlias,aArqs)

Local nProc := 0

//Local nTipo := GetArea()
If nTipo == 1
	aArea  := GetArea()
	For nProc := 1 To Len(aArqs)
		dbSelectArea(aArqs[nProc])
		AAdd(aAlias,{ aArqs[nProc], IndexOrd(), Recno() })
	Next
	// Tipo 2 = RestArea()
Else
	For nProc := 1 To Len(aAlias )
		dbSelectArea(aAlias[nProc,1])
		dbSetOrder(aAlias[nProc,2])
		dbGoto(aAlias[nProc,3])
	Next
	RestArea(aArea)
EndIf

Return


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ NroSeq   บ Autor ณ Jeovane               บ Data da Criacao  ณ 19/11/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Busca numero de sequencia da baixa no array de baixas do titulo                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ cancBaixa                       						                                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ _cPrefixo   = Prefixo do titulo a ser cancelado a baixa                                                       บฑฑ
ฑฑบ          ณ cNum       = Numero do titulo a ser cancelado a baixa                                                        บฑฑ
ฑฑบ          ณ cParc      = Parcela do titulo a ser cancelado a baixa                                                       บฑฑ
ฑฑบ          ณ cTipo      = Tipo do titulo a ser cancelado a baixa                                                          บฑฑ
ฑฑบ          ณ cFor       = Fornecedor do titulo a ser cancelado a baixa                                                    บฑฑ
ฑฑบ          ณ cLoja      = Loja do Fornecedor do titulo a ser cancelado a baixa                                            บฑฑ
ฑฑบ          ณ _cSeq       = Sequencia da baixa                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Numero da baixa a ser cancelado, este numero pode ser diferente do E5_SEQ                                    บฑฑ
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
Static Function SeqSE2(_cPrefixo,cNum,cParcela,cTipo,cFor,cLoja,_cSeq)

Local nRet 		  := 0
Local _nPos 		  := 0

Private lBaixaAbat:= .F.
Private lNotBax   := .F.
Private lAglImp   := .F.
Private lBxCec    := .F.
Private nTotImpost:= 0
Private nTotAdto  := 0
Private nTotaIRPF := 0
Private aBaixaSE5 := {}

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณProcura pelas baixas deste titulo                                     ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
//aBaixaSE5 :=
Sel080Baixa("VL /V2 /BA /RA /CP /LJ /NCC/",_cPrefixo,cNum,cParcela,cTipo,@nTotAdto,;
@lBaixaAbat,cFor,cLoja,@lBxCec,.T.,@lNotBax,@nTotImpost,@lAglImp;
,,,@nTotaIRPF,SE2->E2_IDENTEE)

ASort(aBaixaSE5, , , {|x,y|x[9] < y[9]}) //Ordena o array, caso tenha sido realizado baixas com data menor a sequencia fica incorreta.

If Len(aBaixaSE5) > 0
	
	For _nPos := 1 to len(aBaixaSE5)
		
		If aBaixaSE5[_nPos,09] == _cSeq  .and.  aBaixaSE5[_nPos,07] == ddatabase
			
			nRet:= _nPos
			exit
			
		EndIf
		
	Next _nPos
	
EndIf

Return nRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณSeqSE1    บAutor  ณMicrosiga           บ Data ณ  07/05/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/


Static Function SeqSE1(_cPrefixo,cNum,cParcela,cTipo,cFor,cLoja,_cSeq)

Local nRet 		  := 0
Local _nPos 		  := 0

Private lBaixaAbat:= .F.
Private lNotBax   := .F.
Private lAglImp   := .F.
Private lBxCec    := .F.
Private nTotImpost:= 0
Private nTotAdto  := 0
Private nTotaIRPF := 0
Private aBaixaSE5 := {}

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณProcura pelas baixas deste titulo                                     ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
//aBaixaSE5 :=
Sel070Baixa( "VL /V2 /BA /RA /CP /LJ /"+MV_CRNEG,_cPrefixo,cNum,cParcela,cTipo,,,cFor,cLoja,,,,)

ASort(aBaixaSE5, , , {|x,y|x[9] < y[9]}) //Ordena o array, caso tenha sido realizado baixas com data menor a sequencia fica incorreta.

If Len(aBaixaSE5) > 0
	
	For _nPos := 1 to len(aBaixaSE5)
		
		If aBaixaSE5[_nPos,09] == _cSeq  .and.  aBaixaSE5[_nPos,07] == ddatabase
			
			nRet:= _nPos
			exit
			
		EndIf
		
	Next _nPos
	
EndIf

Return nRet


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ AjustaSX1บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para criacao das perguntas caso elas nao existam.   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ AjustaSX1บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para criacao das perguntas caso elas nao existam.   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function AjustaSX1()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpEng, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpEng, 'zado para Cancelamento do Fechamento.  ')
U_xPutSx1(_cPerg,"01","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch1","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_01","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no Cancto. Vc pode informar')
Aadd( aHelpPor, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpPor, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpPor, 'considerar apenas este produtor.       ')
U_xPutSx1(_cPerg,"02","Produtor de?","Produtor de?","Produtor de?","mv_ch2","C",6,0,0,"G",,"SA2_L9","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no Acerto.                 ')
U_xPutSx1(_cPerg,"03","Produtor Ate?","Produtor Ate?","Produtor Ate?","mv_ch3","C",6,0,0,"G",,"SA2_L9","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no Cancto. Vc pode informar')
Aadd( aHelpPor, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpPor, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpPor, 'considerar apenas este produtor.       ')
U_xPutSx1(_cPerg,"04","Loja de?","Produtor de?","Produtor de?","mv_ch4","C",2,0,0,"G",,"","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no Acerto.                 ')
U_xPutSx1(_cPerg,"05","Loja Ate?","Produtor Ate?","Produtor Ate?","mv_ch5","C",2,0,0,"G",,"","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


//dia de pagamento
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo da linha dos produtores ')
Aadd( aHelpPor, 'para busca dos d้bitos financeiros ')
U_xPutSx1(_cPerg,"06","Do Grupo Pre็o"," "," ","mv_c6","C",6,0,0,"G","","ZL3_01","","","MV_PAR06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Detalha o saldo devedor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo do grupo de produtores ')
Aadd( aHelpPor, 'para busca dos d้bitos financeiros ')
U_xPutSx1(_cPerg,"07","Ate Grupo Pre็o","","","mv_ch7","C",6,0,0,"G",'',"ZL3_01","","","MV_PAR07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออออหอออออออัออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ AtualizaSldบ Autor ณGuilherme Fran็a  บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออออสอออออออฯออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Atualiza os saldos na tabela ZLV.                          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function AtualizaSld(Obj)

Local _cAno := Alltrim(Str(year(ZLE->ZLE_DTFIM)))
Local _cMes := StrZero(Month(ZLE->ZLE_DTFIM),2)

DbSelectArea("ZLV")
DbSetOrder(1)
If ZLV->(DbSeek(xFilial("ZLV")+_cAno+_cMes+SA2->A2_COD+SA2->A2_LOJA))
	RecLock("ZLV",.F.)
	ZLV->ZLV_DEBITO := 0
	ZLV->ZLV_VLRLIQ := ZLV->ZLV_VLRNF - ZLV->ZLV_FUNRUR - ZLV->ZLV_SENAR
	ZLV->(MsUnlock())

EndIf


Return

