#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#include "rwmake.ch"

#DEFINE _ENTER CHR(13)+CHR(10)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ MGLT034  º Autor ³ TOTVS                 º Data da Criacao  ³ 17/07/2014                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Rotina de acerto financeiro das associações (Grupos)                                                         º±±
±±º          ³                        									                               				        º±±
±±º          ³                        									                               				        º±±
±±º          ³                        									                               				        º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Fechamento do Leite.            						                                                        º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Nenhum						   							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum						  							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ Microsiga                                                                                					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite.                                                                        						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                                                  ³                                  ³   	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function MGLT034()

Local _bProcess		:= {|oSelf| FechFin(oSelf)}
Local cTexto
Private _cPerg		:= "MGLT034"
Private cGLTalias 		:= GetNextAlias() //"GLT"
Private cHoraInicial 	:= TIME()

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Chama funcao para criar os parametros caso nao existam.             ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
AjustaSX1()

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Chama a tela para preenchimento dos parametros.                     ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If !Pergunte(_cPerg,.T.)
	Return()
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se o usuario tem permissao para executar a rotina de Eventos.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If Posicione("ZLU",1,xFilial("ZLU")+Padr(cUserName,25),"ZLU_ACERTO") != "S"
	xMagHelpFis("Permissao","Voce nao tem permissao para acessar essa rotina!","Comunique ao Suporte!")
	Return
EndIf


//	If LastDay(dDatabase) != dDataBase
//		xMagHelpFis("NAO CONFORMIDADE 02 - DATABASE INVALIDA",;
//		"A Data do sistema("+DTOC(dDataBase)+") nao esta no ultimo dia do mes!",;
//		"A Data deve ser alterada para "+DTOC(LastDay(dDatabase))+" , para poder continuar a rotina." )
//		Return
//	EndIf

cTexto := "Esta rotina tem o objetivo de efetuar o Fechamento Financeiro das Associações"+_ENTER
cTexto += "Por favor preencha os parÂmetros da rotina antes de executar."+_ENTER
cTexto += " "+_ENTER

_oTProces := tNewProcess():New("MGLT034","Fechamento Financeiro das Associaçoes",_bProcess,cTexto,_cPerg)

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ FechFin  ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para realizar o Acerto dos Eventos Avulsos.         ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ 									                  		  ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT029()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function FechFin(oObj)

Local cFunc 	 := "1"
Local cArqTmp  := cGLTalias+cFunc
Local _aArea   := {}
Local _aAlias  := {}
Local nTotReg  := 0
Local nCont    := 1
Local nVlrEvto := 0
Local nJurTit  := 0
Local nVlrBx   := 0
Local cParc    := StrZero(1,TamSx3("E2_PARCELA")[1]) //Parcela do titulo do evento

//Vari‡veis Tabela Genrica
Local cxForn
Local cxLoja
Local aStruct := {}
Local _nTamFil    := TamSx3("A2_FILIAL")[1]
Local _nTamFor    := TamSx3("A2_COD")[1]
Local _nTamLoj    := TamSx3("A2_LOJA")[1]

//Vari‡veis
Local _cTipo
Local _lRetFun

//Variaveis Query/Par‰metros Rotina
Local _cDia		:= AllTrim(GETMV("LT_VENCTO")) //Dia de pagamento do produtor
Local _lAglutina := SuperGetMV("LT_AGLUTINA",,.T.) //Parametro que indica se o sistema devera gerar titulos aglutinados de creditos e debitos

//Variaveis Contador Querys
Local nProd
Local nCont := 1

Private _cEveCred := AllTrim(GETMV("LT_EVECRED")) //Evento utilizado no titulo aglutinado de credito
Private _cEveDeb := AllTrim(GETMV("LT_EVEDEB")) //Evento utilizado no titulo aglutinado de debito
Private lContinue 	:= .T.
Private lDeuErro	:= .F.

Private _cMes := ""
Private _cAno := ""
Private _cSerie	  := PADR(AllTrim(GETMV("LT_SERIE")),TamSx3("F1_PREFIXO")[1]) // Serie da NF
Private _nReg
Private _cVencto  	:= "" //Dia de vencimento dos titulos
Private cCodMIX := MV_PAR01

Private _cGrupoDe  	:= mv_par02
Private _cGrupoAte 	:= mv_par03

//	Private _cFornLei	:= MV_PAR04

Private _cMaxEmis	:= ""//DTOS(LASTDAY(ADDMES(DDATABASE,-1)))

//Vari‡veis Creditos/Dbito
Private _aCred := {}
Private _lGrvCred := .T.
Private _lGrvDeb := .T.

dbSelectArea("ZLE")
ZLE->(dbSetOrder(1))
If ZLE->(dbSeek(xFilial("ZLE")+cCodMIX))
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Verifica se a database do sistema esta com o ultimo dia do mes. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If LastDay(ZLE->ZLE_DTFIM) != dDataBase
		xMagHelpFis("NAO CONFORMIDADE 02 - DATABASE INVALIDA",;
		"A data do sistema("+DTOC(dDataBase)+") nao esta no ultimo dia do mes!",;
		"Altere a data do sistema para "+DTOC(LastDay(ZLE->ZLE_DTFIM)) )
		Return()
	EndIf
	
	_cMes := Month2Str(ZLE->ZLE_DTFIM) //Retorna o mes no formato MM
	_cAno := Year2Str(ZLE->ZLE_DTFIM) //Retorna o ano no formado AAAA
	_cMaxEmis	:=	DTOS(ZLE->ZLE_DTFIM	)
	_cVencto := SubStr(DTOS(MonthSum(ZLE->ZLE_DTFIM,1)),1,6) + _cDia
	
Else
	xMagHelpFis("NAO CONFORMIDADE 09 - MIX nao encontrado.",;
	"O MIX informado nos parãmetros não foi encontrado!",;
	"Escolha um código de MIX que exista.")
	Return()
EndIf


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cria Tabela temporaria para relacao        ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
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

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Obtendo dados da SA2 (Tipo P)              ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
MsgRun("Aguarde.... Verificando Produtores...",,{||CursorWait(), MGLTQRY(cFunc), CursorArrow()})
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
	//TRZ->TRZ_LOJA  := (cArqTmp)->A2_LOJA
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
	
	
	
	Begin Transaction
	
	dbSelectArea("SA2")
	SA2->(dbSetOrder(1))
	If SA2->(dbSeek(xFilial("SA2")+cxForn))
		
		If oObj <> Nil
			oObj:IncRegua1("Produtor "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nProd))+" ("+AllTrim(str( round((nCont/nProd)*100,0) ))+"%) - " + SA2->A2_COD +"/"+SA2->A2_LOJA +" - "+SA2->A2_NOME)
		EndIf
		
		_lGrvCred := .T.
		_lGrvDeb := .T.

		If !lDeuErro
			ActFin(oObj)
		EndIf
		
		If _lAglutina //Se for aglutinar debitos e creditos executa as funcoes
			If !lDeuErro
				AglutinaCred(oObj) //Aglutina creditos (Baixa os titulos NF do SE2, NCC do SE1 e gera um título unico de credito)
			EndIf
	
			If !lDeuErro
				AglutinaDeb(oObj) //Aglutina debitos (baixa os titulos NF do SE1 e gera um titulo unico, com juros calculados)					
			EndIf
		EndIf


	Else //Seek na SA2
		xMagHelpFis("NAO CONFORMIDADE 01 - Nao existe Produtor",;
		"Produtor "+AllTrim(cxForn+cxLoja)+" não existe no cadastro!",;
		"Nao sera gerado Acerto para esse produtor. Verifique o código do produtor no o cadastro!","Alerta")
		
	EndIf //Seek na SA2
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Se houve alguma falha, desfaz todas as transacoes.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If lDeuErro
		lContinue := .F.
		DisarmTransaction()
		lDeuErro := .F.
	EndIf
	
	End Transaction
	
	
	If !lContinue
		If MsgYesNo("Ocorreram não conformidades no processo. Deseja continuar a rotina?")
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

oObj:SaveLog("FIM - Fechamento Financeiro")

MsgInfo("Tempo gasto no processamento:"+ELAPTIME(cHoraInicial,TIME()))


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ActFin    ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para realizar Acerto Financeiro.				      ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpO01 - Objeto da Regua de processamento.                 ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT034()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function ActFin(oObj)

Local cFunc := "2"
Local cFunc2 := "3"
Local cArqTmp1 := cGLTalias+cFunc
Local cArqTmp2 := cGLTalias+cFunc2
Local _aArea   := {}
Local _aAlias  := {}
Local nTotReg  := 0
Local nCont    := 1
Local _cHistBaixa := ""
//Variaveis Valores
Local nJurTit := 0
Local nSldTit := 0
Local _nSldCred := 0
Local nVlrBx := 0
Local nTotBai := 0

Local lRetorno := .T.

Local _cMotBaixa := AllTrim(GETMV("LT_MOTBX"))  //Motivo de baixa utilizado para a rotina do Leite
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³  Salva a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","SX1"})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("INICIO - Busca Crditos - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

MsgRun("Aguarde.... Filtrando creditos...",,{||CursorWait(), MGLTQRY(cFunc), CursorArrow()}) // Gera cArqTmp1

MsgRun("Aguarde.... Filtrando débitos...",,{||CursorWait(), MGLTQRY(cFunc2) , CursorArrow()}) // Gera cArqTmp2

dbSelectArea(cArqTmp1)
(cArqTmp1)->(dbGoTop())


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza a regua de processamento.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If oObj <> Nil
	nTotReg := _nReg
	nCont   := 1
	oObj:SetRegua2(nTotReg)
EndIf
	
dbSelectArea(cArqTmp2)
dbGoTop()


While (cArqTmp1)->(!Eof())
	
	//Busca saldo do crédito a baixar.
	_nSldCred := (cArqTmp1)->SALDO + (cArqTmp1)->SDACRES - (cArqTmp1)->SDDECRE
	
	_cHistBaixa := "GLT "+_cMes+"/"+_cAno+" "+(cArqTmp1)->PREFIXO + (cArqTmp1)->NUM + (cArqTmp1)->PARCELA
	
	
	While (cArqTmp2)->(!Eof()) .and. _nSldCred > 0
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Atualiza a regua de processamento.³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		If oObj <> Nil
			oObj:IncRegua2("Financeiro - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
			nCont++
		EndIf
		
		dbSelectArea("SE1")
		SE1->(dbSetOrder(1))//E1_FILIAL+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO
		If SE1->(dbSeek(xFilial("SE1") + (cArqTmp2)->PREFIXO + (cArqTmp2)->NUM +(cArqTmp2)->PARCELA + (cArqTmp2)->TIPO ))
			
			nJurTit := fa070Juros()
			nJurTit := Round(nJurTit,2)
			
			nSldTit := (SE1->E1_SALDO + nJurTit + SE1->E1_SDACRES) - SE1->E1_SDDECRE
			
			nVlrBx  := nSldTit
			

			If _nSldCred > 0
				
				If ( _nSldCred - nSldTit ) >= 0
					
					_nSldCred -= nSldTit
					
					//Baixa o Dbito do Cooperado
					_lBaixou:= U_BaixaSE1(nVlrBx,SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_TIPO,SE1->E1_CLIENTE,SE1->E1_LOJA,_cMotBaixa,_cHistBaixa)
					
					If _lBaixou  //Atualiza o valor pago no titulo na tabela ZLF
						_cSeek :=cCodMIX+SE1->E1_FILIAL+SE1->E1_PREFIXO+SE1->E1_NUM+SE1->E1_PARCELA+SE1->E1_TIPO+SE1->E1_CLIENTE+SE1->E1_LOJA
						U_GrvZLF(cCodMIX,SE1->E1_L_EVENT,nVlrBx,_cSeek,"","ActFin","","D",0,0,"","",nJurTit,0,SA2->A2_COD,SA2->A2_LOJA,SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_TIPO,SE1->E1_LOJA)
					EndIf
					
					//Armazena Valor da Baixa do T’tulo Pai
					nTotBai += nVlrBx
				Else
					nVlrBx := _nSldCred
					
					_lBaixou:= U_BaixaSE1(nVlrBx,SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_TIPO,SE1->E1_CLIENTE,SE1->E1_LOJA,_cMotBaixa,_cHistBaixa)

					If _lBaixou  //Atualiza o valor pago no titulo na tabela ZLF
						_cSeek :=cCodMIX+SE1->E1_FILIAL+SE1->E1_PREFIXO+SE1->E1_NUM+SE1->E1_PARCELA+SE1->E1_TIPO+SE1->E1_CLIENTE+SE1->E1_LOJA
						U_GrvZLF(cCodMIX,SE1->E1_L_EVENT,nVlrBx,_cSeek,"","ActFin","","D",0,0,"","",nJurTit,0,SA2->A2_COD,SA2->A2_LOJA,SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_TIPO,SE1->E1_LOJA)
					EndIf

					
					nTotBai += nVlrBx
					
					_nSldCred -= _nSldCred

					Exit // Sai do laço dos debitos	sem pular o registro, para que seja baixado com outro credito.	
				EndIf
				
			EndIf
			
		EndIf //Seek T’tulo SE1
		
		(cArqTmp2)->(DbSkip())
		
	EndDo
	
	
	If nTotBai > 0
		If (cArqTmp1)->TIPOTIT == "SE1"
			_lBaixou:= U_BaixaSE1(nTotBai,(cArqTmp1)->PREFIXO,(cArqTmp1)->NUM,(cArqTmp1)->PARCELA,(cArqTmp1)->TIPO,(cArqTmp1)->A2COD,(cArqTmp1)->A2LOJA,_cMotBaixa,_cHistBaixa)

			If _lBaixou .AND. (!Empty((cArqTmp1)->EVENTO) .or. (cArqTmp1)->TIPO = "NCC") //Atualiza o valor pago no titulo na tabela ZLF
				_cSeek :=cCodMIX+(cArqTmp1)->FILIAL+(cArqTmp1)->PREFIXO+(cArqTmp1)->NUM+(cArqTmp1)->PARCELA+(cArqTmp1)->TIPO+(cArqTmp1)->A2COD+(cArqTmp1)->A2LOJA
				U_GrvZLF(cCodMIX,(cArqTmp1)->EVENTO,nTotBai,_cSeek,"","ActFin","","C",0,0,"","",0,0,SA2->A2_COD,SA2->A2_LOJA,SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_TIPO,SE1->E1_LOJA)
			EndIf

		Else
			_lBaixou:= U_BaixaSE2(nTotBai,(cArqTmp1)->PREFIXO,(cArqTmp1)->NUM,(cArqTmp1)->PARCELA,(cArqTmp1)->TIPO,(cArqTmp1)->A2COD,(cArqTmp1)->A2LOJA,_cMotBaixa,_cHistBaixa)

			If _lBaixou .AND. !Empty((cArqTmp1)->EVENTO) //Atualiza o valor pago no titulo na tabela ZLF
				_cSeek :=cCodMIX+(cArqTmp1)->FILIAL+(cArqTmp1)->PREFIXO+(cArqTmp1)->NUM+(cArqTmp1)->PARCELA+(cArqTmp1)->TIPO+(cArqTmp1)->A2COD+(cArqTmp1)->A2LOJA
				U_GrvZLF(cCodMIX,(cArqTmp1)->EVENTO,nTotBai,_cSeek,"","ActFin","","C",0,0,"","",0,0,SA2->A2_COD,SA2->A2_LOJA,SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_TIPO,SE1->E1_LOJA)
			EndIf


		EndIf
	EndIf
	
	nTotBai := 0
	nSldTit := 0
	nVlrBx  := 0
	nJurTit := 0
	
	(cArqTmp1)->(DbSkip())
	
EndDo

dbSelectArea(cArqTmp1)
dbCloseArea(cArqTmp1)

dbSelectArea(cArqTmp2)
dbCloseArea(cArqTmp2)


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(2,_aArea,_aAlias)

Return lRetorno

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³AglutinaCred³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Aglutina os titulos de credito em um só.                   ³±±
±±³          ³ Executa baixa dos titulos originais e inclui um novo.     ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpO01 - Objeto da Regua de processamento.                 ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT033()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function AglutinaCred(oObj)

Local cFunc := "2"
Local cArqTmp1 := cGLTalias+cFunc
Local _aArea   := {}
Local _aAlias  := {}
Local nTotReg  := 0
Local nCont    := 1
Local _nSldCred := 0
Local _aTit := {}
Local _nModAnt := nModulo
Local _cModAnt := cModulo
Local _dBkpData := dDatabase
Local _cHist := "CREDITO LEITE: "+_cMes+"/"+_cAno
Local _cNumTit := ""
Local _lBaixou := .f.
Private lMsErroAuto := .F.
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³  Salva a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SE1","SE2","ZL8","SX1"})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("INICIO - Aglutinando Créditos - "+SA2->A2_COD +"/"+SA2->A2_LOJA)


MsgRun("Aguarde.... Filtrando creditos...",,{||CursorWait(), MGLTQRY(cFunc), CursorArrow()}) // Gera cArqTmp1

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza a regua de processamento.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If oObj <> Nil
	nTotReg := _nReg
	nCont   := 1
	oObj:SetRegua2(nTotReg)
EndIf

_cNumTit := SubStr(SA2->A2_COD,2,5)+ SubStr(cCodMIX,3,4)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Geração da fatura de crédito³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("ZL8")
ZL8->(dbSetOrder(1))
ZL8->(dbSeek(xFilial("ZL8")+_cEveCred)) //Posiciona no evento da fatura de credito do cooperado

_cHistBaixa := "GLT "+_cMes+"/"+_cAno+" "+ZL8->ZL8_PREFIX+_cNumTit


dbSelectArea(cArqTmp1)
dbGoTop()
_nSldCred := 0
//Baixa os titulos de credito localizados para o produtor
While (cArqTmp1)->(!Eof())

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Atualiza a regua de processamento.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If oObj <> Nil
		oObj:IncRegua2("Aglutinando Creditos - Titulo "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
	EndIf
	nCont++

	If (cArqTmp1)->TIPOTIT == "SE1"
		_lBaixou:= U_BaixaSE1((cArqTmp1)->SALDO,(cArqTmp1)->PREFIXO,(cArqTmp1)->NUM,(cArqTmp1)->PARCELA,(cArqTmp1)->TIPO,(cArqTmp1)->A2COD,(cArqTmp1)->A2LOJA,ZL8->ZL8_PREFIX,_cHistBaixa,(cArqTmp1)->EVENTO)
	Else
		_lBaixou:= U_BaixaSE2((cArqTmp1)->SALDO,(cArqTmp1)->PREFIXO,(cArqTmp1)->NUM,(cArqTmp1)->PARCELA,(cArqTmp1)->TIPO,(cArqTmp1)->A2COD,(cArqTmp1)->A2LOJA,ZL8->ZL8_PREFIX,_cHistBaixa,(cArqTmp1)->EVENTO)
	EndIf

	If _lBaixou
		_nSldCred += (cArqTmp1)->SALDO
	EndIf

	(cArqTmp1)->(DbSkip())
EndDo

                        
//Inclui o Titulo de Crédito
If _nSldCred > 0
	If !U_IncluSE2(ZL8->ZL8_PREFIX,_cNumTit,"  ","NF ",SA2->A2_COD,SA2->A2_LOJA,ZL8->ZL8_NATPRD,STOD(_cMaxEmis),STOD(_cVencto),_nSldCred,0,0,"",_cHist,0,ZL8->ZL8_COD,"MGLT034",_cAno+_cMes)

		xMagHelpFis("NAO CONFORMIDADE AGLUTINA CREDITO",;
		"Não foi possível incluir o titulo aglutinado com os creditos do produtor "+SA2->A2_COD,;
		"Nao sera gerado Acerto para esse produtor. Informe este erro ao Depto. de TI.")

    	lDeuErro := .T.
   	EndIf
EndIf


dDatabase := _dBkpData

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("FIM - Aglutina Creditos - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Apaga arquivo temporario.         ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

dbSelectArea(cArqTmp1)
dbCloseArea(cArqTmp1)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(2,_aArea,_aAlias)

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³AglutinaDeb³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Aglutina os titulos de debito em um só.                   ³±±
±±³          ³ Executa baixa dos titulos originais e inclui um novo.     ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpO01 - Objeto da Regua de processamento.                 ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT034()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function AglutinaDeb(oObj)

Local cFunc := "3"
Local cArqTmp1 := cGLTalias+cFunc
Local _aArea   := {}
Local _aAlias  := {}
Local nTotReg  := 0
Local nCont    := 1
Local _nSldDeb := 0
Local _nAcres := 0
Local _nTAcres := 0
Local _nModAnt := nModulo
Local _cModAnt := cModulo
Local _dBkpData := dDatabase
Local _cHist := "DEBITO LEITE: "+_cMes+"/"+_cAno
Local _cNumTit := ""
Local _lBaixou := .f.
Private lMsErroAuto := .F.
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³  Salva a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SE1","SE2","ZL8","SX1"})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("INICIO - Aglutinando Débitos - "+SA2->A2_COD +"/"+SA2->A2_LOJA)



MsgRun("Aguarde.... Filtrando Debitos...",,{||CursorWait(), MGLTQRY(cFunc), CursorArrow()}) // Gera cArqTmp1

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza a regua de processamento.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If oObj <> Nil
	nTotReg := _nReg
	nCont   := 1
	oObj:SetRegua2(nTotReg)
EndIf

_cNumTit := SubStr(SA2->A2_COD,2,5)+ SubStr(cCodMIX,3,4)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Geração da fatura de Debito ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("ZL8")
ZL8->(dbSetOrder(1))
ZL8->(dbSeek(xFilial("ZL8")+_cEveDeb)) //Posiciona no evento da fatura de debitos

_cHistBaixa := "GLT "+_cMes+"/"+_cAno+" "+ZL8->ZL8_PREFIX+_cNumTit


dbSelectArea(cArqTmp1)
dbGoTop()
_nSldDeb := 0
//Baixa os titulos de debito localizados para o produtor
While (cArqTmp1)->(!Eof())

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Atualiza a regua de processamento.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If oObj <> Nil
		oObj:IncRegua2("Aglutinando Debitos - Titulo "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
	EndIf
	nCont++

	//Posiciona na SE1 para calcular os juros utilizando função padrão fa070Juros
	DbSelectArea("SE1")
	DbGoTo((cArqTmp1)->R_E_C_N_O_)

	nJurTit := fa070Juros()
	nJurTit := Round(nJurTit,2)
		
	nSldTit := (SE1->E1_SALDO + nJurTit + SE1->E1_SDACRES) - SE1->E1_SDDECRE

	_nAcres := nJurTit + SE1->E1_SDACRES //Acumula acrescimo para entrar no titulo aglutinado.			

	_lBaixou:= U_BaixaSE1(nSldTit,(cArqTmp1)->PREFIXO,(cArqTmp1)->NUM,(cArqTmp1)->PARCELA,(cArqTmp1)->TIPO,(cArqTmp1)->A2COD,(cArqTmp1)->A2LOJA,ZL8->ZL8_PREFIX/*_cMotBaixa*/,_cHistBaixa,(cArqTmp1)->EVENTO)

	If _lBaixou
		_nSldDeb += (cArqTmp1)->SALDO
		_nTAcres += _nAcres
	EndIf

	(cArqTmp1)->(DbSkip())
EndDo

                        
//Inclui o Titulo de Debito
If _nSldDeb > 0
	If !U_IncluSE1(ZL8->ZL8_PREFIX,_cNumTit,"  ","NF ",SA2->A2_COD,SA2->A2_LOJA,ZL8->ZL8_NATPRD,STOD(_cMaxEmis),STOD(_cVencto),_nSldDeb,_nTAcres,0,"",_cHist,0,ZL8->ZL8_COD,"MGLT034",_cAno+_cMes)
		xMagHelpFis("NAO CONFORMIDADE AGLUTINA DEBITO",;
		"Não foi possível incluir o titulo aglutinado com os debitos do produtor "+SA2->A2_COD,;
		"Nao sera gerado Acerto para esse produtor. Informe este erro ao Depto. de TI.")

    	lDeuErro := .T.
   	EndIf
EndIf


dDatabase := _dBkpData

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	oObj:SaveLog("FIM - Aglutina Debitos - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Apaga arquivo temporario.         ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

dbSelectArea(cArqTmp1)
dbCloseArea(cArqTmp1)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(2,_aArea,_aAlias)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³MGLTQRY   ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para executar querys e gerar arquivo temporario com ³±±
±±³          ³ o resultado da query.                                      ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpC01 - Caracter que identifica a query a ser chamada de  ³±±
±±³          ³          acordo com a rotina de Acerto em execucao.        ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT009()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function MGLTQRY(cOpc,cPrefSE2)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Declaracao de variavies locais. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Local cQry   := ""
Local lSqlOk := .T.

Local _cPLEITE := ""

DEFAULT cPrefSE2 := ""

Do Case
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Filtra os produtores 	          ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Case cOpc == "1"
		cQry := "SELECT A2_COD,A2_L_GRUPO,A2_L_ASSOC "
		cQry += " FROM " + RetSqlName("SA2")
		cQry += " WHERE D_E_L_E_T_ = ' ' "
		cQry += " AND A2_FILIAL = '" + xFilial("SA2") + "'"
		cQry += " AND A2_L_TPFOR = 'P'" //Produtor Cooperado
		cQry += " AND A2_L_GRUPO <> '' " 
		cQry += " AND A2_L_ASSOC = 'S' "
		cQry += " AND A2_L_GRUPO BETWEEN '" + _cGrupoDe +"' AND '"+ _cGrupoAte +"'"
		cQry += " ORDER BY A2_L_GRUPO, A2_L_ASSOC DESC, A2_COD "
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Busca Crditos do Cooperado       ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Case cOpc == "2"
		//Seleciona nota do leite
		cQry := "SELECT 'SE2' AS TIPOTIT,E2_FILIAL as FILIAL,E2_PREFIXO as PREFIXO,E2_NUM AS NUM,E2_PARCELA AS PARCELA,E2_TIPO AS TIPO,E2_FORNECE AS A2COD,E2_LOJA AS A2LOJA "
		cQry += ",E2_VENCTO AS VENCTO ,E2_SALDO AS SALDO , E2_ACRESC AS ACRESC, E2_DECRESC AS DECRESC, E2_SDACRES AS SDACRES , E2_SDDECRE AS SDDECRE, E2_L_EVENT AS EVENTO, E2_HIST AS HIST "
		cQry += " FROM " + RetSqlName("SE2") + " SE2 "
		//cQry += " JOIN " + RetSqlName("SED") + " SED ON SED.ED_CODIGO = SE2.E2_NATUREZ AND SED.D_E_L_E_T_ = ' ' AND SED.ED_L_CORRE = 'S' "
		cQry += " WHERE  "
		cQry += " E2_FILIAL  = '" + xFilial("SE2") + "'"
		cQry += " AND E2_FORNECE  = '" + SA2->A2_COD +"' "
//		cQry += " AND E2_EMISSAO  = '" + _cMaxEmis + "' "
		cQry += " AND E2_VENCTO   = '" + _cVencto + "' "
		cQry += " AND E2_TIPO = 'NF' "
		cQry += " AND E2_L_EVENT = '' "
		cQry += " AND E2_SALDO > 0 "
		cQry += " AND SE2.D_E_L_E_T_ = ' ' "
		cQry += " AND E2_VENCTO 	> '20150625' " //APAGAR ESTE FILTRO
		cQry += " UNION "
		//Seleciona outros creditos
		cQry := "SELECT 'SE2' AS TIPOTIT,E2_FILIAL as FILIAL,E2_PREFIXO as PREFIXO,E2_NUM AS NUM,E2_PARCELA AS PARCELA,E2_TIPO AS TIPO,E2_FORNECE AS A2COD,E2_LOJA AS A2LOJA "
		cQry += ",E2_VENCTO AS VENCTO ,E2_SALDO AS SALDO , E2_ACRESC AS ACRESC, E2_DECRESC AS DECRESC, E2_SDACRES AS SDACRES , E2_SDDECRE AS SDDECRE, E2_L_EVENT AS EVENTO, E2_HIST AS HIST "
		cQry += " FROM " + RetSqlName("SE2") + " SE2 "
		cQry += " JOIN " + RetSqlName("SA2") + " A2 ON A2.A2_COD = SE2.E2_FORNECE AND A2.A2_LOJA = SE2.E2_LOJA AND A2.A2_L_GRUPO = '"+SA2->A2_L_GRUPO+"'  AND A2.D_E_L_E_T_ = ' ' "
		cQry += " WHERE  "
		cQry += " E2_FILIAL  = '" + xFilial("SE2") + "'"
		cQry += " AND E2_EMISSAO  = '" + _cMaxEmis + "' "
		cQry += " AND E2_VENCTO   = '" + _cVencto + "' "
		cQry += " AND E2_TIPO NOT IN ('PA','NDF') "
		cQry += " AND E2_L_EVENT <> '' "
		cQry += " AND E2_SALDO > 0 "
		cQry += " AND SE2.D_E_L_E_T_ = ' ' "
		cQry += " AND E2_VENCTO 	> '20150625' " //APAGAR ESTE FILTRO		
		cQry += " UNION "
		//Seleciona creditos de notas de devolucao
		cQry += "SELECT 'SE1' AS TIPOTIT,E1_FILIAL as FILIAL,E1_PREFIXO as PREFIXO,E1_NUM AS NUM,E1_PARCELA AS PARCELA,E1_TIPO AS TIPO,E1_CLIENTE AS A2COD,E1_LOJA AS A2LOJA "
		cQry += ",E1_VENCTO AS VENCTO ,E1_SALDO AS SALDO , E1_ACRESC AS ACRESC, E1_DECRESC AS DECRESC, E1_SDACRES AS SDACRES , E1_SDDECRE AS SDDECRE,E1_L_EVENT AS EVENTO, E1_HIST AS HIST "
		cQry += " FROM " + RetSqlName("SE1") + " SE1 "
		cQry += " JOIN " + RetSqlName("SA2") + " A2 ON A2.A2_COD = SE1.E1_CLIENTE AND A2.A2_LOJA = SE1.E1_LOJA AND A2.A2_L_GRUPO = '"+SA2->A2_L_GRUPO+"' AND A2.D_E_L_E_T_ = ' ' "
		cQry += " WHERE "
		cQry += " E1_FILIAL  = '" + xFilial("SE1") + "'"
		cQry += " AND E1_EMISSAO	<= '" + _cMaxEmis + "' "
		cQry += " AND E1_VENCTO 	<= '" + _cVencto + "' "
		cQry += " AND E1_TIPO = 'NCC' "
		cQry += " AND E1_SALDO > 0 "
		cQry += " AND SE1.D_E_L_E_T_ = ' ' "
		cQry += " AND E1_VENCTO 	> '20150625' " //APAGAR ESTE FILTRO
		cQry += " ORDER BY SALDO DESC"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		

		//Gravação dos creditos na ZLF
		If _lGrvCred
			GravaZLF(cGLTalias+cOpc,"C")
			_lGrvCred := .F.
		EndIf

		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Busca Dbitos do Cooperado       ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Case cOpc == "3"
		cQry := "SELECT 'SE1' AS TIPOTIT,E1_FILIAL as FILIAL,E1_PREFIXO as PREFIXO,E1_NUM AS NUM,E1_PARCELA AS PARCELA,E1_TIPO AS TIPO,E1_CLIENTE AS A2COD,E1_LOJA AS A2LOJA "
		cQry += ",E1_VENCTO AS VENCTO, E1_SALDO AS SALDO , E1_ACRESC AS ACRESC, E1_DECRESC AS DECRESC, E1_SDACRES AS SDACRES , E1_SDDECRE AS SDDECRE,E1_L_EVENT AS EVENTO, E1_HIST AS HIST, E1_NOMCLI AS NOME  "
		cQry += ", SE1.R_E_C_N_O_ "
		cQry += " FROM " + RetSqlName("SE1") + " SE1 "
		cQry += " JOIN " + RetSqlName("SA2") + " A2 ON A2.A2_COD = SE1.E1_CLIENTE AND A2.A2_LOJA = SE1.E1_LOJA AND A2.A2_L_GRUPO = '"+SA2->A2_L_GRUPO+"'  AND A2.D_E_L_E_T_ = ' ' "
		cQry += " WHERE "
		cQry += " E1_FILIAL  	= '" + xFilial("SE1") + "'"
		cQry += " AND E1_VENCTO 	<= '"  + _cVencto  + "'"
		cQry += " AND E1_TIPO <> 'NCC' "
		cQry += " AND E1_SALDO 		> 0 "
		cQry += " AND E1_EMISSAO	<= '" + _cMaxEmis + "' "
		cQry += " AND E1_L_EVENT <> ' ' "
		cQry += " AND SE1.D_E_L_E_T_ = ' ' "
		cQry += " AND E1_VENCTO 	> '20150625' " //APAGAR ESTE FILTRO		
		cQry += " ORDER BY E1_VENCTO,E1_SALDO DESC"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg

		//Gravação dos debitos na ZLF
		If _lGrvDeb
			GravaZLF(cGLTalias+cOpc,"D")
			_lGrvDeb := .F.
		EndIf

EndCase

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³MGLT034   ºAutor  ³Microsiga           º Data ³  05/19/15   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³                                                            º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                        º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GravaZLF(xcAlias,xcDebCre)

Local cSeek := ""
Local _cHis := ""
DbSelectARea(xcAlias)
(xcAlias)->(DbGoTop())

While !(xcAlias)->(Eof())
	DbSelectArea("ZL8")
	DbSetOrder(1)
	DbSeek(xFilial("ZL8")+(xcAlias)->EVENTO)
    //Posiciona no evento, e não grava eventos automáticos pois estes já estarao gravados pelo fechamento do leite.
	If (!Empty((xcAlias)->EVENTO) .and. ZL8->ZL8_TPEVEN <> "A") .OR. (xcAlias)->TIPO == "NCC"
		If (SubStr((xcAlias)->A2COD,2,5)+SubStr(cCodMIX,3,4)) <> (xcAlias)->NUM
			cSeek := cCodMIX+(xcAlias)->FILIAL+(xcAlias)->PREFIXO+(xcAlias)->NUM+(xcAlias)->PARCELA+(xcAlias)->TIPO+(xcAlias)->A2COD+(xcAlias)->A2LOJA
			_cHis := IIF(xcDebCre=="D",	"DEBITO "+(xcAlias)->NOME,	(xcAlias)->HIST)
			U_GrvZLF(cCodMIX,(xcAlias)->EVENTO,(xcAlias)->SALDO,cSeek,"","","",xcDebCre,(xcAlias)->SALDO,(xcAlias)->SALDO,(xcAlias)->VENCTO,;
			_cHis,0,(xcAlias)->ACRESC,SA2->A2_COD,SA2->A2_LOJA,(xcAlias)->PREFIXO,(xcAlias)->NUM,(xcAlias)->PARCELA,(xcAlias)->TIPO,(xcAlias)->A2LOJA)
		EndIf
	EndIf
	(xcAlias)->(DbSkip())
EndDo	

Return
/*
‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±…ÕÕÕÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕ—ÕÕÕÕÕÕÕÕÕÕÕÕÕª±±
±±?Programa  = CtrlArea ? Autor = Microsiga          ? Data =  00/00/00   ?±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕp±±
±±?Descricao = Static Function auxiliar no GetArea e ResArea retornando   ?±±
±±?          = o ponteiro nos Aliases descritos na chamada da Funcao.     ?±±
±±?          = Exemplo:                                                   ?±±
±±?          = Local _aArea  := {} // Array que contera o GetArea         ?±±
±±?          = Local _aAlias := {} // Array que contera o                 ?±±
±±?          =                     // Alias(), IndexOrd(), Recno()        ?±±
±±?          =                                                            ?±±
±±?          = // Chama a Funcao como GetArea                             ?±±
±±?          = P_CtrlArea(1,@_aArea,@_aAlias,{"SL1","SL2","SL4"})         ?±±
±±?          =                                                            ?±±
±±?          = // Chama a Funcao como RestArea                            ?±±
±±?          = P_CtrlArea(2,_aArea,_aAlias)                               ?±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕp±±
±±?Parametros= nTipo   = 1=GetArea / 2=RestArea                           ?±±
±±?          = _aArea  = Array passado por referencia que contera GetArea ?±±
±±?          = _aAlias = Array passado por referencia que contera         ?±±
±±?          =           {Alias(), IndexOrd(), Recno()}                   ?±±
±±?          = _aArqs  = Array com Aliases que se deseja Salvar o GetArea ?±±
±±ÃÕÕÕÕÕÕÕÕÕÕÿÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕp±±
±±?Uso       = GENERICO                                                   ?±±
±±»ÕÕÕÕÕÕÕÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
?????????????????????????????????????????????????????????????????????????????
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
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºFuncao    ³ AjustaSX1º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Funcao para criacao das perguntas caso elas nao existam.   º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa principal                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function AjustaSX1()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}


aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpPor, 'zado para o Fechamento.                ')
Aadd( aHelpPor, 'ATENCAO: Escolha um MIX aberto e com   ')
Aadd( aHelpPor, 'periodo correto.                       ')
Aadd( aHelpSpa, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpSpa, 'zado para o Fechamento.                ')
Aadd( aHelpSpa, 'ATENCAO: Escolha um MIX aberto e com   ')
Aadd( aHelpSpa, 'periodo correto.                       ')
Aadd( aHelpEng, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpEng, 'zado para o Fechamento.                ')
Aadd( aHelpEng, 'ATENCAO: Escolha um MIX aberto e com   ')
Aadd( aHelpEng, 'periodo correto.                       ')
U_xPutSx1(_cPerg,"01","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch1","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_02","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)




aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no Acerto. Vc pode informar')
Aadd( aHelpPor, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpPor, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpPor, 'considerar apenas este produtor.       ')
Aadd( aHelpSpa, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpSpa, 'considerado no Acerto. Vc pode informar')
Aadd( aHelpSpa, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpSpa, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpSpa, 'considerar apenas este produtor.       ')
Aadd( aHelpEng, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpEng, 'considerado no Acerto. Vc pode informar')
Aadd( aHelpEng, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpEng, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpEng, 'considerar apenas este produtor.       ')
U_xPutSx1(_cPerg,"02","Grupo de?","Produtor de?","Produtor de?","mv_ch2","C",6,0,0,"G",,"ZL5","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no Acerto.                 ')
Aadd( aHelpSpa, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpSpa, 'considerado no Acerto.                 ')
Aadd( aHelpEng, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpEng, 'considerado no Acerto.                 ')
U_xPutSx1(_cPerg,"03","Grupo Ate?","Produtor Ate?","Produtor Ate?","mv_ch3","C",6,0,0,"G",,"ZL5","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


/*
aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Para o processamento considerar:       ')
Aadd( aHelpPor, '1 - Apenas Fornecedores de Leite;      ')
Aadd( aHelpPor, '2 - Apenas NÃO Fornecedores de Leite;  ')
Aadd( aHelpPor, '3 - Ambos .                            ')
Aadd( aHelpSpa, 'Para o processamento considerar:       ')
Aadd( aHelpSpa, '1 - Apenas Fornecedores de Leite;      ')
Aadd( aHelpSpa, '2 - Apenas NÃO Fornecedores de Leite;  ')
Aadd( aHelpSpa, '3 - Ambos .                            ')
Aadd( aHelpEng, 'Para o processamento considerar:       ')
Aadd( aHelpEng, '1 - Apenas Fornecedores de Leite;      ')
Aadd( aHelpEng, '2 - Apenas NÃO Fornecedores de Leite;  ')
Aadd( aHelpEng, '3 - Ambos .                            ')
U_xPutSx1(_cPerg,"04","Fornecedor de Leite","Fornecedor de Leite","Fornecedor de Leite","mv_ch4","C",1,0,0,"C","","","","","MV_PAR04","1-Fornec Leite","","","","2-NÃO Fornec Leite","","","3-Ambos","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
*/

Return
