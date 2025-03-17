#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#include "rwmake.ch"  
#INCLUDE "MSGRAPHI.ch"

#DEFINE _ENTER CHR(13)+CHR(10)

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � MGLT032  � Autor � TOTVS                 � Data da Criacao  � 17/07/2014                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Rotina de acerto financeiro dos Produtores. Realiza baixa dos debitos compensando com o credito do leite.    ���
���          �                        									                               				        ���
���          �                        									                               				        ���
���          �                        									                               				        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Fechamento do Leite.            						                                                        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum						   							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum						  							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite.                                                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �          �                                                  �                                  �   	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/
User Function MGLT032(xCodMIX,xProd,xLoja,xObj)

Local _bProcess		:= {|oSelf| FechFin(oSelf)}
Local cTexto
Private _cPerg		:= "MGLT032"
Private cGLTalias 		:= GetNextAlias() //"GLT"
Private cHoraInicial 	:= TIME()
Private _lAuto := .f.
Private _nTotDebito := 0
Private _cLojaaut := ""
DEFAULT xCodMIX := ""

//���������������������������������������������������������������������Ŀ
//� Chama funcao para criar os parametros caso nao existam.             �
//�����������������������������������������������������������������������
AjustaSX1()

If !Empty(xCodMIX)

	Pergunte(_cPerg,.F.)
	MV_PAR01 := xCodMIX
	mv_par02 := xProd
	mv_par03 := xProd
	mv_par04 := "      "
	mv_par05 := "ZZZZZZ"
	_cLojaaut := xLoja
	_lAuto := .t.
EndIf
//���������������������������������������������������������������������Ŀ
//� Chama a tela para preenchimento dos parametros.                     �
//�����������������������������������������������������������������������
If !_lAuto
	If !Pergunte(_cPerg,.T.)
		Return()
	EndIf
EndIf
//����������������������������������������������������������������������Ŀ
//� Verifica se o usuario tem permissao para executar a rotina de Eventos.�
//������������������������������������������������������������������������
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

cTexto := "Esta rotina tem o objetivo de efetuar o Fechamento Financeiro dos Produtores."+_ENTER
cTexto += "Por favor preencha os par�metros da rotina antes de executar."+_ENTER
cTexto += " "+_ENTER

If !_lAuto
	_oTProces := tNewProcess():New("MGLT032","Fechamento Financeiro dos Produtores",_bProcess,cTexto,_cPerg)
Else
	FechFin(xObj)
EndIf

Return _nTotDebito


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    � FechFin  � Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Funcao para realizar o Acerto dos Eventos Avulsos.         ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
���Parametros� 									                  		  ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � MGLT029()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
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

//Vari�veis Tabela Gen�rica
Local cxForn
Local cxLoja
Local aStruct := {}
Local _nTamFil    := TamSx3("A2_FILIAL")[1]
Local _nTamFor    := TamSx3("A2_COD")[1]
Local _nTamLoj    := TamSx3("A2_LOJA")[1]

//Vari�veis
Local _cTipo
Local _lRetFun

//Variaveis Query/Par�metros Rotina
Local _cDia		:= AllTrim(GETMV("LT_VENCTO")) //Dia de pagamento do produtor
Local _lAglutina := SuperGetMV("LT_AGLUTINA",,.F.) //Parametro que indica se o sistema devera gerar titulos aglutinados de creditos e debitos

//Variaveis Contador Querys
Local nProd                                                           
Local nCont := 1

Private _cEveCred := AllTrim(SuperGETMV("LT_EVECRED",,"300001")) //Evento utilizado no titulo aglutinado de credito
Private _cEveDeb := AllTrim(SuperGETMV("LT_EVEDEB",,"300002")) //Evento utilizado no titulo aglutinado de debito
Private lContinue 	:= .T.
Private lDeuErro	:= .F.
Private _cEveFunr := AllTrim(GetMv("LT_EVEINSS")) //Codigo do evento de INSS (Funrural)
Private _cMes := ""
Private _cAno := ""
Private _cSerie	  := PADR(AllTrim(GETMV("LT_SERIE")),TamSx3("F1_PREFIXO")[1]) // Serie da NF
Private _nReg
Private _cVencto  	:= "" //Dia de vencimento dos titulos
Private cCodMIX := MV_PAR01
Private _cProdDe  	:= mv_par02
Private _cProdAte 	:= mv_par03
Private _cGrpDe  	:= mv_par04
Private _cGrpAte 	:= mv_par05


//	Private _cFornLei	:= MV_PAR04

Private _cMaxEmis	:= ""//DTOS(LASTDAY(ADDMES(DDATABASE,-1)))

//Vari�veis Creditos/D�bito
Private _aCred := {}
Private _lGrvCred := .T.
Private _lGrvDeb := .T.
Private _cNumTit := ""
Private _dBkpDtBa := dDataBase

dbSelectArea("ZLE")
ZLE->(dbSetOrder(1))
If ZLE->(dbSeek(xFilial("ZLE")+cCodMIX))
	
	//�����������������������������������������������������������������Ŀ
	//� Verifica se a database do sistema esta com o ultimo dia do mes. �
	//�������������������������������������������������������������������
	//If LastDay(ZLE->ZLE_DTFIM) != dDataBase
	If ZLE->ZLE_DTFIM != dDataBase
		xMagHelpFis("NAO CONFORMIDADE 02 - DATABASE INVALIDA",;
		"A data do sistema("+DTOC(dDataBase)+") nao esta no ultimo dia do mes!",;
		"Altere a data do sistema para "+DTOC(LastDay(ZLE->ZLE_DTFIM)) )
		Return()
	EndIf
	
	_cMes := Month2Str(ZLE->ZLE_DTFIM) //Retorna o mes no formato MM
	_cAno := Year2Str(ZLE->ZLE_DTFIM) //Retorna o ano no formado AAAA
	_cMaxEmis	:=	DTOS(ZLE->ZLE_DTFIM	)
	_cVencto := SubStr(DTOS(MonthSum(ZLE->ZLE_DTFIM,1)),1,6) + _cDia //02072019
	//_cVencto := SUBSTR(DTOS(ddatabase) 
Else
	xMagHelpFis("NAO CONFORMIDADE 09 - MIX nao encontrado.",;
	"O MIX informado nos par�metros n�o foi encontrado!",;
	"Escolha um c�digo de MIX que exista.")
	Return()
EndIf


	
//�������������������������������������������������������������������Ŀ
//� Verifica se existem cadastros bloqueados no SA2 com leite entregue.
//���������������������������������������������������������������������
//If !ValidaBloqueio(ZLE->ZLE_DTINI,ZLE->ZLE_DTFIM)
//	Return()
//EndIf



//��������������������������������������������Ŀ
//� Cria Tabela temporaria para relacao        �
//����������������������������������������������
If Select("TRF") <> 0
	TRF->(dbCloseArea())
EndIf

AAdd(aStruct,{"TRF_FILIA"  ,"C",_nTamFil})
AAdd(aStruct,{"TRF_FORN"   ,"C",_nTamFor})
AAdd(aStruct,{"TRF_LOJA"   ,"C",_nTamLoj})
AAdd(aStruct,{"TRF_VALOR"  ,"N",14,2})

cArqTRF := CriaTrab(aStruct,.T.)
dbUseArea(.T.,,cArqTRF,"TRF",.F.,.F.)

cInd1TRF := CriaTrab(Nil,.F.)
IndRegua("TRF",cInd1TRF,"TRF_FILIA+TRF_FORN+TRF_LOJA",,,)
dbClearIndex()
dbSetIndex(cInd1TRF+OrdBagExt())

//��������������������������������������������Ŀ
//� Obtendo dados da SA2 (Tipo P)              �
//����������������������������������������������
//MsgRun("Aguarde.... Verificando Produtores...",,{||CursorWait(), MGLTQRY(cFunc), CursorArrow()})
MGLTQRY(cFunc)
nProd	:=	_nReg

//*********************************
// Grava dados da SA2 na TRF
//*********************************
dbSelectArea(cArqTmp)
dbGoTop()
While (cArqTmp)->(!Eof())
	dbSelectArea("TRF")
	RecLock("TRF",.T.)
	
	TRF->TRF_FILIA := xFilial("ZLF")
	TRF->TRF_FORN  := (cArqTmp)->A2_COD
	TRF->TRF_LOJA  := (cArqTmp)->A2_LOJA
	TRF->TRF_VALOR := 0
	
	MsUnlock()
	
	(cArqTmp)->(dbSkip())
EndDo
(cArqTmp)->(dbCloseArea())

dbSelectArea("TRF")
TRF->(dbGoTop())

oObj:SetRegua1(nProd)

While TRF->(!Eof())
	
	cxForn  := TRF->TRF_FORN
	cxLoja	:= TRF->TRF_LOJA	

	_cNumTit :=	GeraNumTit(cxForn,cxLoja)//IIF(Alltrim((cArqTmp1)->ORIGEM) == "MATA100",(cArqTmp1)->NUM,_cNumTit)	
	//If !_lAuto
		Begin Transaction
	//EndIf
	
	dbSelectArea("SA2")
	SA2->(dbSetOrder(1))
	If SA2->(dbSeek(xFilial("SA2")+cxForn+cxLoja))
		
		If oObj <> Nil  .and. !_lAuto
			oObj:IncRegua1("Produtor "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nProd))+" ("+AllTrim(str( round((nCont/nProd)*100,0) ))+"%) - " + SA2->A2_COD +"/"+SA2->A2_LOJA +" - "+SA2->A2_NOME)
		Else
			oObj:IncRegua1("Fechamento Financeiro: " + SA2->A2_COD +"/"+SA2->A2_LOJA +" - "+SA2->A2_NOME)		
		EndIf
		
		_lGrvCred := .T.
		_lGrvDeb := .T.

		If !lDeuErro
//			CalcJuros(oObj)	//Calcula juros dos t�tulos em atraso e insere um t�tulo para a cobran�a do mesmo. Espec�fico AGROVERDE
		EndIf


		If !lDeuErro
			ActFin(oObj)
		EndIf
		
		If _lAglutina //Se for aglutinar debitos e creditos executa as funcoes
			If !lDeuErro
				AglutinaCred(oObj) //Aglutina creditos (Baixa os titulos NF do SE2, NCC do SE1 e gera um t�tulo unico de credito)
			EndIf
	
			If !lDeuErro 
				AglutinaDeb(oObj) //Aglutina debitos (baixa os titulos NF do SE1 e gera um titulo unico, com juros calculados)					
			EndIf
		EndIf

		If !lDeuErro
			FlagZLF(oObj)  // Grava o campo ZLF_FINOK como "S" indicando que o fechamento financeiro foi executado.
		EndIf

		If !lDeuErro .and. !_lAuto
			AtualizaSld(oObj) //Grava dados do fechamento na tabela ZLV
		EndIf					


	Else //Seek na SA2
		xMagHelpFis("NAO CONFORMIDADE 01 - Nao existe Produtor",;
		"Produtor "+AllTrim(cxForn+cxLoja)+" n�o existe no cadastro!",;
		"Nao sera gerado Acerto para esse produtor. Verifique o c�digo do produtor no o cadastro!","Alerta")
		
	EndIf //Seek na SA2
	
	//���������������������������������������������������Ŀ
	//� Se houve alguma falha, desfaz todas as transacoes.�
	//�����������������������������������������������������
	If lDeuErro
		lContinue := .F.
		DisarmTransaction()
		lDeuErro := .F.
	EndIf
	
	End Transaction
	
	
	
	If !lContinue
		If MsgYesNo("Ocorreram n�o conformidades no processo. Deseja continuar a rotina?")
			lContinue:=.T.
		Else
			exit
		EndIf
	EndIf
	
	TRF->(dbSkip())
	nCont++
	
EndDo

// Deleta Tabela TRF temporaria
Ferase(cArqTRF + GetDbExtension())
Ferase(cArqTRF + OrdBagExt())


If !_lAuto
	oObj:SaveLog("FIM - Fechamento Financeiro")
	MsgInfo("Tempo gasto no processamento:"+ELAPTIME(cHoraInicial,TIME()))
Else
	Return lContinue
EndIf

Return 

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �ActFin    � Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Funcao para realizar Acerto Financeiro.				      ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
���Parametros� ExpO01 - Objeto da Regua de processamento.                 ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � MGLT032()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
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
Local _dBkpDtBa := dDataBase

Local lRetorno := .T.

Local _cMotBaixa := AllTrim(GETMV("LT_MOTBX"))  //Motivo de baixa utilizado para a rotina do Leite
//����������������Ŀ
//�  Salva a area. �
//������������������
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","SX1"})

//�����������������������������������Ŀ
//� Atualiza o log de processamento   �
//�������������������������������������
oObj:SaveLog("INICIO - Busca Creditos - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

//MsgRun("Aguarde.... Filtrando creditos...",,{||CursorWait(), MGLTQRY(cFunc), CursorArrow()}) // Gera cArqTmp1
MGLTQRY(cFunc)

//MsgRun("Aguarde.... Filtrando d�bitos...",,{||CursorWait(), MGLTQRY(cFunc2) , CursorArrow()}) // Gera cArqTmp2
MGLTQRY(cFunc2)

dbSelectArea(cArqTmp1)
(cArqTmp1)->(dbGoTop())


//�����������������������������������Ŀ
//� Atualiza a regua de processamento.�
//�������������������������������������
If oObj <> Nil
	nTotReg := _nReg
	nCont   := 1
	oObj:SetRegua2(nTotReg)
EndIf
	
dbSelectArea(cArqTmp2)
dbGoTop()


While (cArqTmp1)->(!Eof())
	
	//Busca saldo do cr�dito a baixar.
	_nSldCred := (cArqTmp1)->SALDO + (cArqTmp1)->SDACRES - (cArqTmp1)->SDDECRE
	
	_cHistBaixa := "GLT "+_cMes+"/"+_cAno+" "+(cArqTmp1)->PREFIXO + (cArqTmp1)->NUM + (cArqTmp1)->PARCELA

	
	While (cArqTmp2)->(!Eof()) .and. _nSldCred > 0
		
		//�����������������������������������Ŀ
		//� Atualiza a regua de processamento.�
		//�������������������������������������
		If oObj <> Nil
			oObj:IncRegua2("Financeiro - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
			nCont++
		EndIf
		
		dbSelectArea("SE1")
		SE1->(dbSetOrder(1))//E1_FILIAL+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO
		If SE1->(dbSeek((cArqTmp2)->FILIAL + (cArqTmp2)->PREFIXO + (cArqTmp2)->NUM +(cArqTmp2)->PARCELA + (cArqTmp2)->TIPO ))
			
			nJurTit := fa070Juros()
			nJurTit := Round(nJurTit,2)
			
			nSldTit := (SE1->E1_SALDO + nJurTit + SE1->E1_SDACRES) - SE1->E1_SDDECRE
			
			nVlrBx  := nSldTit

			_nTotDebito += nVlrBx

			If _nSldCred > 0
				
				If ( _nSldCred - nSldTit ) >= 0
					
					_nSldCred -= nSldTit
		
					_dBkpDtBa := dDataBase
					//Baixa o D�bito do Cooperado
					_lBaixou:= U_BaixaSE1(nVlrBx,SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_TIPO,SE1->E1_CLIENTE,SE1->E1_LOJA,_cMotBaixa,_cHistBaixa,SE1->E1_L_EVENT,"","","",.T.,SE1->E1_FILIAL,STOD(_cVencto),cCodMix)
					
					dDataBase := _dBkpDtBa
					If _lBaixou  //Atualiza o valor pago no titulo na tabela ZLF
						_cSeek :=SE1->E1_FILIAL+SE1->E1_PREFIXO+SE1->E1_NUM+SE1->E1_PARCELA+SE1->E1_TIPO+SE1->E1_CLIENTE+SE1->E1_LOJA
						U_GrvZLF(cCodMIX,SE1->E1_L_EVENT,nVlrBx,_cSeek,"","ActFin","","D",0,0,"","",nJurTit + SE1->E1_SDACRES,0,SA2->A2_COD,SA2->A2_LOJA,SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_TIPO,SE1->E1_LOJA)

						DbSelectArea("SE5")
						DbSetOrder(7)
						If SE5->(DbSeek(xFilial("SE5")+_cSeek))
							RecLock("SE5",.F.)
							SE5->E5_L_SEEK := _cMix
							MsUnLock()
						EndIf

                        
						AtuZLL(SE1->E1_CLIENTE,SE1->E1_LOJA,SE1->E1_NUM,SE1->E1_EMISSAO,SE1->E1_VENCTO)//Atualiza convenios como Pago

					EndIf
					
					//Armazena Valor da Baixa do T�tulo Pai
					nTotBai += nVlrBx
				Else
					nVlrBx := _nSldCred

					_dBkpDtBa := dDataBase
					_lBaixou:= U_BaixaSE1(nVlrBx,SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_TIPO,SE1->E1_CLIENTE,SE1->E1_LOJA,_cMotBaixa,_cHistBaixa,SE1->E1_L_EVENT,"","","",.T.,SE1->E1_FILIAL,STOD(_cVencto),cCodMix)
					dDataBase := _dBkpDtBa
					If _lBaixou  //Atualiza o valor pago no titulo na tabela ZLF
						_cSeek :=SE1->E1_FILIAL+SE1->E1_PREFIXO+SE1->E1_NUM+SE1->E1_PARCELA+SE1->E1_TIPO+SE1->E1_CLIENTE+SE1->E1_LOJA
						U_GrvZLF(cCodMIX,SE1->E1_L_EVENT,nVlrBx,_cSeek,"","ActFin","","D",0,0,"","",nJurTit + SE1->E1_SDACRES,0,SA2->A2_COD,SA2->A2_LOJA,SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_TIPO,SE1->E1_LOJA)
					EndIf

					
					nTotBai += nVlrBx
					
					_nSldCred -= _nSldCred

					Exit // Sai do la�o dos debitos	sem pular o registro, para que seja baixado com outro credito.	
				EndIf
				
			EndIf
			
		EndIf //Seek T�tulo SE1
		
		(cArqTmp2)->(DbSkip())
		
	EndDo
	
	
	If nTotBai > 0
		If (cArqTmp1)->TIPOTIT == "SE1"
			_dBkpDtBa := dDataBase
			_lBaixou:= U_BaixaSE1(nTotBai,(cArqTmp1)->PREFIXO,(cArqTmp1)->NUM,(cArqTmp1)->PARCELA,(cArqTmp1)->TIPO,(cArqTmp1)->A2COD,(cArqTmp1)->A2LOJA,_cMotBaixa,_cHistBaixa,(cArqTmp1)->EVENTO,"","","",.T.,(cArqTmp1)->FILIAL,STOD(_cVencto),cCodMix)
			dDataBase := _dBkpDtBa
			
			If _lBaixou .AND. (!Empty((cArqTmp1)->EVENTO) .or. (cArqTmp1)->TIPO = "NCC") //Atualiza o valor pago no titulo na tabela ZLF
				_cSeek :=(cArqTmp1)->FILIAL+(cArqTmp1)->PREFIXO+(cArqTmp1)->NUM+(cArqTmp1)->PARCELA+(cArqTmp1)->TIPO+(cArqTmp1)->A2COD+(cArqTmp1)->A2LOJA
				U_GrvZLF(cCodMIX,(cArqTmp1)->EVENTO,nTotBai,_cSeek,"","ActFin","","C",0,0,"","",0,0,SA2->A2_COD,SA2->A2_LOJA,SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_TIPO,SE1->E1_LOJA)
			EndIf

		Else
			_dBkpDtBa := dDataBase		
			_lBaixou:= U_BaixaSE2(nTotBai,(cArqTmp1)->PREFIXO,(cArqTmp1)->NUM,(cArqTmp1)->PARCELA,(cArqTmp1)->TIPO,(cArqTmp1)->A2COD,(cArqTmp1)->A2LOJA,_cMotBaixa,_cHistBaixa,"",(cArqTmp1)->FILIAL,STOD(_cVencto),cCodMix)
			dDataBase := _dBkpDtBa
			If _lBaixou .AND. !Empty((cArqTmp1)->EVENTO) //Atualiza o valor pago no titulo na tabela ZLF
				_cSeek :=(cArqTmp1)->FILIAL+(cArqTmp1)->PREFIXO+(cArqTmp1)->NUM+(cArqTmp1)->PARCELA+(cArqTmp1)->TIPO+(cArqTmp1)->A2COD+(cArqTmp1)->A2LOJA

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
(cArqTmp1)->(dbCloseArea())

dbSelectArea(cArqTmp2)
(cArqTmp2)->(dbCloseArea())


//������������������Ŀ
//� Restaura a area. �
//��������������������
CtrlArea(2,_aArea,_aAlias)

Return lRetorno



/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �AtuZLL   �Autor  �Microsiga           � Data �  02/03/16   ���
�������������������������������������������������������������������������͹��
���Desc.     � Atualiza o campo ZLL_STATUS dos convenios como PAGO.    ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function AtuZLL(xcProd,xcLoj,xcNum,xdEmis,xdVenc)

Local _cUpdate := ""

_cUpdate := " UPDATE ZLL010 SET ZLL_STATUS = 'P' "
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
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �AglutinaCred� Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Aglutina os titulos de credito em um s�.                   ���
���          � Executa baixa dos titulos originais e inclui um novo.     ���
�������������������������������������������������������������������������Ĵ��
���Parametros� ExpO01 - Objeto da Regua de processamento.                 ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � MGLT033()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
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
Local _lBaixou := .f.
Private lMsErroAuto := .F.
//����������������Ŀ
//�  Salva a area. �
//������������������
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SE1","SE2","ZL8","SX1"})

//�����������������������������������Ŀ
//� Atualiza o log de processamento   �
//�������������������������������������
oObj:SaveLog("INICIO - Aglutinando Cr�ditos - "+SA2->A2_COD +"/"+SA2->A2_LOJA)


//MsgRun("Aguarde.... Filtrando creditos...",,{||CursorWait(), MGLTQRY(cFunc), CursorArrow()}) // Gera cArqTmp1
MGLTQRY(cFunc)

//�����������������������������������Ŀ
//� Atualiza a regua de processamento.�
//�������������������������������������
If oObj <> Nil
	nTotReg := _nReg
	nCont   := 1
	oObj:SetRegua2(nTotReg)
EndIf

//����������������������������Ŀ
//�Gera��o da fatura de cr�dito�
//������������������������������
dbSelectArea("ZL8")
ZL8->(dbSetOrder(1))
ZL8->(dbSeek(xFilial("ZL8")+_cEveCred)) //Posiciona no evento da fatura de credito do cooperado


_cHistBaixa := "GLT "+_cMes+"/"+_cAno+" "+ZL8->ZL8_PREFIX+_cNumTit


dbSelectArea(cArqTmp1)
dbGoTop()
_nSldCred := 0
//Baixa os titulos de credito localizados para o produtor
While (cArqTmp1)->(!Eof())

	//�����������������������������������Ŀ
	//� Atualiza a regua de processamento.�
	//�������������������������������������
	If oObj <> Nil
		oObj:IncRegua2("Aglutinando Creditos - Titulo "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
	EndIf
	nCont++
	_dBkpDtBa := dDataBase	
	If (cArqTmp1)->TIPOTIT == "SE1"
		_lBaixou:= U_BaixaSE1((cArqTmp1)->SALDO,(cArqTmp1)->PREFIXO,(cArqTmp1)->NUM,(cArqTmp1)->PARCELA,(cArqTmp1)->TIPO,(cArqTmp1)->A2COD,(cArqTmp1)->A2LOJA,ZL8->ZL8_PREFIX,_cHistBaixa,(cArqTmp1)->EVENTO,"","","",.T.,(cArqTmp1)->FILIAL,STOD(_cVencto),cCodMix)
	Else
		_lBaixou:= U_BaixaSE2((cArqTmp1)->SALDO,(cArqTmp1)->PREFIXO,(cArqTmp1)->NUM,(cArqTmp1)->PARCELA,(cArqTmp1)->TIPO,(cArqTmp1)->A2COD,(cArqTmp1)->A2LOJA,ZL8->ZL8_PREFIX,_cHistBaixa,(cArqTmp1)->EVENTO,(cArqTmp1)->FILIAL,STOD(_cVencto),cCodMix)
	EndIf
	dDataBase := _dBkpDtBa
	If _lBaixou
		_nSldCred += (cArqTmp1)->SALDO
	EndIf

	(cArqTmp1)->(DbSkip())
EndDo

                        
//Inclui o Titulo de Cr�dito
If _nSldCred > 0

	If !U_IncluSE2(ZL8->ZL8_PREFIX,_cNumTit,"01","NF ",SA2->A2_COD,SA2->A2_LOJA,ZL8->ZL8_NATPRD,STOD(_cMaxEmis),STOD(_cVencto),_nSldCred,0,0,"",_cHist,0,ZL8->ZL8_COD,"MGLT032",_cAno+_cMes,"",cCodMix,xFilial("SF2"))

		xMagHelpFis("NAO CONFORMIDADE AGLUTINA CREDITO",;
		"N�o foi poss�vel incluir o titulo aglutinado com os creditos do produtor "+SA2->A2_COD,;
		"Nao sera gerado Acerto para esse produtor. Informe este erro ao Depto. de TI.")

    	lDeuErro := .T.
   	EndIf
EndIf


dDatabase := _dBkpData

//�����������������������������������Ŀ
//� Atualiza o log de processamento   �
//�������������������������������������
oObj:SaveLog("FIM - Aglutina Creditos - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

//�����������������������������������Ŀ
//� Apaga arquivo temporario.         �
//�������������������������������������

dbSelectArea(cArqTmp1)
(cArqTmp1)->(dbCloseArea())

//������������������Ŀ
//� Restaura a area. �
//��������������������
CtrlArea(2,_aArea,_aAlias)

Return


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �AglutinaDeb� Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Aglutina os titulos de debito em um s�.                   ���
���          � Executa baixa dos titulos originais e inclui um novo.     ���
�������������������������������������������������������������������������Ĵ��
���Parametros� ExpO01 - Objeto da Regua de processamento.                 ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � MGLT032()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
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
Local _lBaixou := .f.
Private lMsErroAuto := .F.
//����������������Ŀ
//�  Salva a area. �
//������������������
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SE1","SE2","ZL8","SX1"})

//�����������������������������������Ŀ
//� Atualiza o log de processamento   �
//�������������������������������������
oObj:SaveLog("INICIO - Aglutinando D�bitos - "+SA2->A2_COD +"/"+SA2->A2_LOJA)



//MsgRun("Aguarde.... Filtrando Debitos...",,{||CursorWait(), MGLTQRY(cFunc), CursorArrow()}) // Gera cArqTmp1
MGLTQRY(cFunc)

//�����������������������������������Ŀ
//� Atualiza a regua de processamento.�
//�������������������������������������
If oObj <> Nil
	nTotReg := _nReg
	nCont   := 1
	oObj:SetRegua2(nTotReg)
EndIf


//����������������������������Ŀ
//�Gera��o da fatura de Debito �
//������������������������������
dbSelectArea("ZL8")
ZL8->(dbSetOrder(1))
ZL8->(dbSeek(xFilial("ZL8")+_cEveDeb)) //Posiciona no evento da fatura de debitos

_cHistBaixa := "GLT "+_cMes+"/"+_cAno+" "+ZL8->ZL8_PREFIX+_cNumTit


dbSelectArea(cArqTmp1)
dbGoTop()
_nSldDeb := 0
//Baixa os titulos de debito localizados para o produtor
While (cArqTmp1)->(!Eof())

	//�����������������������������������Ŀ
	//� Atualiza a regua de processamento.�
	//�������������������������������������
	If oObj <> Nil
		oObj:IncRegua2("Aglutinando Debitos - Titulo "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
	EndIf
	nCont++

	//Posiciona na SE1 para calcular os juros utilizando fun��o padr�o fa070Juros
	DbSelectArea("SE1")
	DbGoTo((cArqTmp1)->R_E_C_N_O_)
	
	nJurTit := fa070Juros()
	nJurTit := Round(nJurTit,2)
		
	nSldTit := (SE1->E1_SALDO + nJurTit + SE1->E1_SDACRES) - SE1->E1_SDDECRE

	_nAcres := nJurTit + SE1->E1_SDACRES //Acumula acrescimo para entrar no titulo aglutinado.			
	_dBkpDtBa := dDataBase	
	_lBaixou:= U_BaixaSE1(nSldTit,(cArqTmp1)->PREFIXO,(cArqTmp1)->NUM,(cArqTmp1)->PARCELA,(cArqTmp1)->TIPO,(cArqTmp1)->A2COD,(cArqTmp1)->A2LOJA,ZL8->ZL8_PREFIX/*_cMotBaixa*/,_cHistBaixa,(cArqTmp1)->EVENTO,"","","",.T.,(cArqTmp1)->FILIAL,STOD(_cVencto),cCodMix)
	dDataBase := _dBkpDtBa
	If _lBaixou
		_nSldDeb += (cArqTmp1)->SALDO
		_nTAcres += _nAcres
	EndIf

	(cArqTmp1)->(DbSkip())
EndDo

                        
//Inclui o Titulo de Debito
If _nSldDeb > 0
	If !U_IncluSE1(ZL8->ZL8_PREFIX,_cNumTit,"01","NF ",SA2->A2_COD,SA2->A2_LOJA,ZL8->ZL8_NATPRD,STOD(_cMaxEmis),STOD(_cVencto),_nSldDeb,_nTAcres,0,"",_cHist,0,ZL8->ZL8_COD,"MGLT032",_cAno+_cMes,xFilial("SF2"),cCodMix)
		xMagHelpFis("NAO CONFORMIDADE AGLUTINA DEBITO",;
		"N�o foi poss�vel incluir o titulo aglutinado com os debitos do produtor "+SA2->A2_COD,;
		"Nao sera gerado Acerto para esse produtor. Informe este erro ao Depto. de TI.")

    	lDeuErro := .T.
   	EndIf
EndIf


dDatabase := _dBkpData

//�����������������������������������Ŀ
//� Atualiza o log de processamento   �
//�������������������������������������
	oObj:SaveLog("FIM - Aglutina Debitos - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

//�����������������������������������Ŀ
//� Apaga arquivo temporario.         �
//�������������������������������������

dbSelectArea(cArqTmp1)
(cArqTmp1)->(dbCloseArea())

//������������������Ŀ
//� Restaura a area. �
//��������������������
CtrlArea(2,_aArea,_aAlias)

Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �MGLTQRY   � Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Funcao para executar querys e gerar arquivo temporario com ���
���          � o resultado da query.                                      ���
�������������������������������������������������������������������������Ĵ��
���Parametros� ExpC01 - Caracter que identifica a query a ser chamada de  ���
���          �          acordo com a rotina de Acerto em execucao.        ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � MGLT009()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function MGLTQRY(cOpc,cPrefSE2)

//���������������������������������Ŀ
//� Declaracao de variavies locais. �
//�����������������������������������
Local cQry   := ""
Local lSqlOk := .T.

Local _cPLEITE := ""

DEFAULT cPrefSE2 := ""

Do Case
	
	//�����������������������������������Ŀ
	//� Filtra os produtores 	          �
	//�������������������������������������
	Case cOpc == "1"
		cQry := "SELECT A2_COD,A2_LOJA,A2_L_LI_RO,A2_NREDUZ "
		cQry += " FROM " + RetSqlName("SA2")+ " A2 "
		cQry += " 	JOIN " + RetSqlName("ZLF")+ " LF ON LF.ZLF_FILIAL = '" + xFilial("ZLF") + "' AND LF.ZLF_CODZLE = '"+cCodMIX+"' AND LF.ZLF_RETIRO = A2.A2_COD AND LF.ZLF_RETILJ = A2.A2_LOJA "
		cQry += " 	 AND LF.ZLF_FINOK = ' ' AND LF.ZLF_SEQ = '001' AND LF.D_E_L_E_T_ = ' ' "
		cQry += " WHERE A2.D_E_L_E_T_ = ' ' "
		cQry += " AND A2_FILIAL = '" + xFilial("SA2") + "'"
		cQry += " AND A2_L_TPFOR = 'P'" //Produtor Cooperado
		cQry += " AND A2_COD     BETWEEN '" + _cProdDe +"' AND '"+ _cProdAte +"'"
		If !Empty(_cLojaaut)
			cQry += " AND A2_LOJA = '" + _cLojaaut +"' "
		EndIf		  
		cQry += " AND A2_L_LI_RO BETWEEN '" + _cGrpDe + "' AND '" + _cGrpAte + "' "
		
		cQry += " ORDER BY A2_COD "
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
		//�����������������������������������Ŀ
		//� Busca Cr�ditos do Cooperado       �
		//�������������������������������������
	Case cOpc == "2"
		//Seleciona nota do leite
		cQry := "SELECT 'SE2' AS TIPOTIT,E2_FILIAL as FILIAL,E2_PREFIXO as PREFIXO,E2_NUM AS NUM,E2_PARCELA AS PARCELA,E2_TIPO AS TIPO,E2_FORNECE AS A2COD,E2_LOJA AS A2LOJA "
		cQry += ",E2_VENCTO AS VENCTO ,E2_SALDO AS SALDO , E2_ACRESC AS ACRESC, E2_DECRESC AS DECRESC, E2_SDACRES AS SDACRES , E2_SDDECRE AS SDDECRE, E2_L_EVENT AS EVENTO, E2_HIST AS HIST, E2_ORIGEM AS ORIGEM "
		cQry += " FROM " + RetSqlName("SE2") + " SE2 "
		cQry += " 			JOIN " + RetSqlName("SA2") + " A2 ON A2.A2_COD = SE2.E2_FORNECE AND A2.A2_LOJA = SE2.E2_LOJA AND A2.D_E_L_E_T_ = ' ' "
		cQry += " 		AND A2.A2_COD = '" + SA2->A2_COD +"' AND A2.A2_LOJA = '" + SA2->A2_LOJA +"' "
		cQry += " WHERE  "
		cQry += " E2_FILIAL  = '" + xFilial("SE2") + "'"
//		cQry += " AND E2_PREFIXO  = '" + _cSerie +"' "
		cQry += " AND E2_ORIGEM  = 'MATA100' "
//		cQry += " AND E2_FORNECE  = '" + SA2->A2_COD +"' "

		cQry += " AND E2_EMISSAO  = '" + _cMaxEmis + "' "
		cQry += " AND E2_VENCTO   = '" + _cVencto + "' "
		
		cQry += " AND E2_VENCTO > '20171101' " //Incluido para executar o fechamento de 11/2017 - RETIRAR
		
		cQry += " AND E2_TIPO = 'NF ' "
		cQry += " AND E2_L_EVENT = ' ' "
		cQry += " AND E2_SALDO > 0 "
		cQry += " AND SE2.D_E_L_E_T_ = ' ' "
		cQry += " UNION "
		//Seleciona outros creditos lan�ados no contas a pagar
		cQry += "SELECT 'SE2' AS TIPOTIT,E2_FILIAL as FILIAL,E2_PREFIXO as PREFIXO,E2_NUM AS NUM,E2_PARCELA AS PARCELA,E2_TIPO AS TIPO,E2_FORNECE AS A2COD,E2_LOJA AS A2LOJA "
		cQry += ",E2_VENCTO AS VENCTO ,E2_SALDO AS SALDO , E2_ACRESC AS ACRESC, E2_DECRESC AS DECRESC, E2_SDACRES AS SDACRES , E2_SDDECRE AS SDDECRE, E2_L_EVENT AS EVENTO, E2_HIST AS HIST, E2_ORIGEM AS ORIGEM "
		cQry += " FROM " + RetSqlName("SE2") + " SE2 "
		cQry += " 			JOIN " + RetSqlName("SA2") + " A2 ON A2.A2_COD = SE2.E2_FORNECE AND A2.A2_LOJA = SE2.E2_LOJA AND A2.D_E_L_E_T_ = ' ' "
		cQry += " 		AND A2.A2_COD = '" + SA2->A2_COD +"' AND A2.A2_LOJA = '" + SA2->A2_LOJA +"' "
		cQry += " WHERE  "
		cQry += " E2_FILIAL  = '" + xFilial("SE2") + "'"
//		cQry += " AND E2_FORNECE  = '" + SA2->A2_COD +"' "
//		cQry += " AND E2_EMISSAO	<= '" + _cMaxEmis + "' "
		cQry += " AND E2_EMISSAO BETWEEN '" + SubStr(_cMaxEmis,1,6) + "01'	AND  '" + _cVencto + "' " //Busca creditos lan�ados entre 01/05/2016 ate 20/06/2016
		cQry += " AND E2_VENCTO 	<= '" + _cVencto + "' "
		cQry += " AND E2_TIPO NOT IN ('PA','NDF') "
		cQry += " AND E2_L_EVENT <> ' ' "
		cQry += " AND E2_L_EVENT NOT IN ('110023','110024','110025') "
		cQry += " AND E2_SALDO > 0 "
		If (TcGetDB() == 'ORACLE')
			cQry += " AND (E2_PREFIXO||E2_NUM <> 'GL1"+_cNumTit+"') "
		Else
			cQry += " AND (E2_PREFIXO+E2_NUM <> 'GL1"+_cNumTit+"') "		
		EndIf
		cQry += " AND SE2.D_E_L_E_T_ = ' ' "

/* COMENTADO POIS N�O AGLUTINA O NCC NO FECHAMENTO
		cQry += " UNION "
		//Seleciona creditos de notas de devolucao
		cQry += "SELECT 'SE1' AS TIPOTIT,E1_FILIAL as FILIAL,E1_PREFIXO as PREFIXO,E1_NUM AS NUM,E1_PARCELA AS PARCELA,E1_TIPO AS TIPO,E1_CLIENTE AS A2COD,E1_LOJA AS A2LOJA "
		cQry += ",E1_VENCTO AS VENCTO ,E1_SALDO AS SALDO , E1_ACRESC AS ACRESC, E1_DECRESC AS DECRESC, E1_SDACRES AS SDACRES , E1_SDDECRE AS SDDECRE,E1_L_EVENT AS EVENTO, E1_HIST AS HIST "
		cQry += " FROM " + RetSqlName("SE1") + " SE1 "
		cQry += " 			JOIN " + RetSqlName("SA2") + " A2 ON A2.A2_COD = SE1.E1_CLIENTE AND A2.A2_LOJA = SE1.E1_LOJA AND A2.D_E_L_E_T_ = ' ' "
		cQry += " 		AND A2.A2_COD = '" + SA2->A2_COD +"' AND A2.A2_LOJA = '" + SA2->A2_LOJA +"' "
		cQry += " WHERE "
//		cQry += " E1_FILIAL  = '" + xFilial("SE1") + "'"
//		cQry += " E1_CLIENTE  =  '" + SA2->A2_COD +"' "
		cQry += " E1_EMISSAO	<= '" + _cMaxEmis + "' "
		cQry += " AND E1_VENCTO 	<= '" + _cVencto + "' "
		cQry += " AND E1_TIPO = 'NCC' "
		cQry += " AND E1_SALDO > 0 "
		cQry += " AND SE1.D_E_L_E_T_ = ' ' "
*/
		cQry += " ORDER BY SALDO DESC"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		

		//Grava��o dos creditos na ZLF
		If _lGrvCred
			GravaZLF(cGLTalias+cOpc,"C")
			_lGrvCred := .F.
		EndIf

		//�����������������������������������Ŀ
		//� Busca D�bitos do Cooperado       �
		//�������������������������������������
	Case cOpc == "3"
		cQry := "SELECT 'SE1' AS TIPOTIT,E1_FILIAL as FILIAL,E1_PREFIXO as PREFIXO,E1_NUM AS NUM,E1_PARCELA AS PARCELA,E1_TIPO AS TIPO,E1_CLIENTE AS A2COD,E1_LOJA AS A2LOJA "
		cQry += ",E1_VENCTO AS VENCTO, E1_SALDO AS SALDO , E1_ACRESC AS ACRESC, E1_DECRESC AS DECRESC, E1_SDACRES AS SDACRES , E1_SDDECRE AS SDDECRE,E1_L_EVENT AS EVENTO, E1_HIST AS HIST  "
		cQry += ", SE1.R_E_C_N_O_, ZL8.ZL8_PRIORI AS PRIORIDADE " //Inclusao de prioridade seguindo ordem definida no cadastro de eventos.
		cQry += " FROM " + RetSqlName("SE1") + " SE1 "
		cQry += "			JOIN " + RetSqlName("ZL8") + " ZL8 ON ZL8.ZL8_COD = SE1.E1_L_EVENT AND ZL8.D_E_L_E_T_ = ' ' "
		cQry += " 			JOIN " + RetSqlName("SA2") + " A2 ON A2.A2_COD = SE1.E1_CLIENTE AND A2.A2_LOJA = SE1.E1_LOJA AND A2.D_E_L_E_T_ = ' ' "
		cQry += " WHERE "
		//cQry += " E1_FILIAL  	= '" + xFilial("SE1") + "'"
		cQry += " E1_FILIAL  	BETWEEN '    ' AND 'ZZZZ'"
		cQry += " AND E1_CLIENTE  	=  '" + SA2->A2_COD +"' "
		cQry += " AND E1_LOJA  	=  '" + SA2->A2_LOJA +"' "		
		cQry += " AND E1_VENCTO 	<= '"  + _cVencto  + "'"
		cQry += " AND E1_TIPO <> 'NCC' "
		cQry += " AND E1_SALDO 		> 0 "

		cQry += " AND E1_VENCTO > '20171101' " //Incluido para executar o fechamento de 11/2017 - RETIRAR

		cQry += " AND E1_EMISSAO	<= '" + _cMaxEmis + "' "
		cQry += " AND E1_L_EVENT <> ' ' "
		If (TcGetDB() == 'ORACLE')
			cQry += " AND ( E1_PREFIXO||E1_NUM <> 'GL2"+_cNumTit+"') "
		Else
			cQry += " AND ( E1_PREFIXO+E1_NUM <> 'GL2"+_cNumTit+"') "
		EndIf
		cQry += " AND SE1.D_E_L_E_T_ = ' ' "
		cQry += " ORDER BY PRIORIDADE, E1_VENCTO,E1_SALDO "
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg

		//Grava��o dos debitos na ZLF
		If _lGrvDeb
			GravaZLF(cGLTalias+cOpc,"D")
			_lGrvDeb := .F.
		EndIf

EndCase

Return()

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MGLT032   �Autor  �Microsiga           � Data �  05/19/15   ���
�������������������������������������������������������������������������͹��
���Desc.     �                                                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function GravaZLF(xcAlias,xcDebCre)

Local cSeek := ""

DbSelectARea(xcAlias)
(xcAlias)->(DbGoTop())

While !(xcAlias)->(Eof())
	DbSelectArea("ZL8")
	DbSetOrder(1)
	DbSeek(xFilial("ZL8")+(xcAlias)->EVENTO)
    //Posiciona no evento, e n�o grava eventos autom�ticos pois estes j� estarao gravados pelo fechamento do leite.
//	If (!Empty((xcAlias)->EVENTO) .and. ZL8->ZL8_TPEVEN <> "A" ) .OR. (xcAlias)->TIPO == "NCC"
	If !Empty((xcAlias)->EVENTO)  .OR. (xcAlias)->TIPO == "NCC"
		   //	cSeek := cCodMIX+(xcAlias)->FILIAL+(xcAlias)->PREFIXO+(xcAlias)->NUM+(xcAlias)->PARCELA+(xcAlias)->TIPO+(xcAlias)->A2COD+(xcAlias)->A2LOJA
   			cSeek := (xcAlias)->FILIAL+(xcAlias)->PREFIXO+(xcAlias)->NUM+(xcAlias)->PARCELA+(xcAlias)->TIPO+(xcAlias)->A2COD+(xcAlias)->A2LOJA
	
			U_GrvZLF(cCodMIX,(xcAlias)->EVENTO,(xcAlias)->SALDO,cSeek,"","","",xcDebCre,(xcAlias)->SALDO,(xcAlias)->SALDO,(xcAlias)->VENCTO,;
			(xcAlias)->HIST,0,(xcAlias)->ACRESC,SA2->A2_COD,SA2->A2_LOJA,(xcAlias)->PREFIXO,(xcAlias)->NUM,(xcAlias)->PARCELA,(xcAlias)->TIPO,(xcAlias)->A2LOJA,.T.)
	EndIf
	(xcAlias)->(DbSkip())
EndDo	

Return
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
������������՗�����������������՗��������������������������՗������������ժ��
��?Programa  = CtrlArea ? Autor = Microsiga          ? Data =  00/00/00   ?��
�����������������������ՠ������՜�������������������ՠ�����՜�������������p��
��?Descricao = Static Function auxiliar no GetArea e ResArea retornando   ?��
��?          = o ponteiro nos Aliases descritos na chamada da Funcao.     ?��
��?          = Exemplo:                                                   ?��
��?          = Local _aArea  := {} // Array que contera o GetArea         ?��
��?          = Local _aAlias := {} // Array que contera o                 ?��
��?          =                     // Alias(), IndexOrd(), Recno()        ?��
��?          =                                                            ?��
��?          = // Chama a Funcao como GetArea                             ?��
��?          = P_CtrlArea(1,@_aArea,@_aAlias,{"SL1","SL2","SL4"})         ?��
��?          =                                                            ?��
��?          = // Chama a Funcao como RestArea                            ?��
��?          = P_CtrlArea(2,_aArea,_aAlias)                               ?��
��������������������������������������������������������������������������p��
��?Parametros= nTipo   = 1=GetArea / 2=RestArea                           ?��
��?          = _aArea  = Array passado por referencia que contera GetArea ?��
��?          = _aAlias = Array passado por referencia que contera         ?��
��?          =           {Alias(), IndexOrd(), Recno()}                   ?��
��?          = _aArqs  = Array com Aliases que se deseja Salvar o GetArea ?��
��������������������������������������������������������������������������p��
��?Uso       = GENERICO                                                   ?��
������������՜�����������������������������������������������������������պ��
�����������������������������������������������������������������������������
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
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � AjustaSX1� Autor � Microsiga          � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao para criacao das perguntas caso elas nao existam.   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
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
U_xPutSx1(_cPerg,"02","Produtor de?","Produtor de?","Produtor de?","mv_ch2","C",6,0,0,"G",,"SA2_L4","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no Acerto.                 ')
Aadd( aHelpSpa, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpSpa, 'considerado no Acerto.                 ')
Aadd( aHelpEng, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpEng, 'considerado no Acerto.                 ')
U_xPutSx1(_cPerg,"03","Produtor Ate?","Produtor Ate?","Produtor Ate?","mv_ch3","C",6,0,0,"G",,"SA2_L4","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


//dia de pagamento
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial do  ')
Aadd( aHelpPor, 'grupo de Pre�o/Linha ')
Aadd( aHelpPor, 'para busca dos produtores. ')
U_xPutSx1(_cPerg,"04", "Do Grupo Prec/Linha"," "," ","mv_ch4","C",6,0,0,"G","","ZL3_01","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Detalha o saldo devedor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final do  ')
Aadd( aHelpPor, 'grupo de Pre�o/Linha ')
Aadd( aHelpPor, 'para busca dos produtores. ')
U_xPutSx1(_cPerg,"05", "Ate Grupo Prec/Linha"," "," ","mv_ch5","C",6,0,0,"G","","ZL3_01","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


/*
//Do Setor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo do Setor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(_cPerg,"04","Do Setor  "," "," ","mv_ch4","C",6,0,0,"G",'U_ValSetPar()',"ZL2_01","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//At� o setor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo do Setor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(_cPerg,"05","At� Setor  "," "," ","mv_ch5","C",6,0,0,"G",'U_ValSetPar()',"ZL2_01","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Para o processamento considerar:       ')
Aadd( aHelpPor, '1 - Apenas Fornecedores de Leite;      ')
Aadd( aHelpPor, '2 - Apenas N�O Fornecedores de Leite;  ')
Aadd( aHelpPor, '3 - Ambos .                            ')
Aadd( aHelpSpa, 'Para o processamento considerar:       ')
Aadd( aHelpSpa, '1 - Apenas Fornecedores de Leite;      ')
Aadd( aHelpSpa, '2 - Apenas N�O Fornecedores de Leite;  ')
Aadd( aHelpSpa, '3 - Ambos .                            ')
Aadd( aHelpEng, 'Para o processamento considerar:       ')
Aadd( aHelpEng, '1 - Apenas Fornecedores de Leite;      ')
Aadd( aHelpEng, '2 - Apenas N�O Fornecedores de Leite;  ')
Aadd( aHelpEng, '3 - Ambos .                            ')
U_xPutSx1(_cPerg,"04","Fornecedor de Leite","Fornecedor de Leite","Fornecedor de Leite","mv_ch4","C",1,0,0,"C","","","","","MV_PAR04","1-Fornec Leite","","","","2-N�O Fornec Leite","","","3-Ambos","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
*/

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � GrvZLF	   � Autor � TOTVS                 � Data da Criacao  � 00/00/2000             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Grava ou altera registro na tabela ZLF.                                                						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � MGLT032 - FECHAMENTO FINANCEIRO  - BEN ALIMENTOS                 											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�                                                                                      						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum					                                                                                  	���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   �															                             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite	                                                                       						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������Ĺ��
���          �          �                    							   �                                  � 			���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
*/
User Function GrvZLF(cCodMIX,cEvento,nValor,cSeek,_cSeq,cFunName,cLinha,;
			cDebCred,nSE1VLR,nSE1SLD,dSE1VEN,cSE1HIS,nSE1JUR,nSE1ACRES,;
			_cCodForn,_cLojForn,cPref,cNum,cParc,cTipo,_cLjSE2,_lInc)


DEFAULT _lInc := .F. // Indica se a fun��o esta sendo chamada pela inclusao inicial dos titulos.

DbSelectArea("ZLF")
DbSetOrder(4)
If DbSeek(xFilial("ZLF")+cCodMIX+cSeek)
	RecLock("ZLF",.F.)
	If Alltrim(cFunName) == "MGLT033"
//		ZLF->ZLF_ACERTO := "N"
//		ZLF->ZLF_STATUS := "P"
		ZLF->(DbDelete())
//	ElseIf ZLF->ZLF_SE1SLD >= (nValor) .AND. !_lInc //-(nValor)
	ElseIf !_lInc //-(nValor)
//		ZLF->ZLF_SE1SLD -= nValor
		ZLF->ZLF_SE1JUR += nSE1JUR
		ZLF->ZLF_VLRPAG += nValor 
    EndIf
	ZLF->(MsUnlock())
	
ElseIf Alltrim(cFunName) != "MGLT033"
	_cSeq:= U_GetSeqZLF(cCodMIX,cEvento,_cCodForn,_cLojForn)
	
	RecLock("ZLF", .T.)
	
	ZLF->ZLF_FILIAL := xFilial("ZLF")
	ZLF->ZLF_CODZLE := cCodMIX
	ZLF->ZLF_VERSAO := "1" //_cVersao
	ZLF->ZLF_SETOR  := "000001" //ZL2->ZL2_COD
	ZLF->ZLF_LINROT := Posicione("SA2",1,xFILIAL("SA2")+_cCodForn+_cLojForn,"A2_L_LI_RO")
	ZLF->ZLF_RETIRO := _cCodForn
	ZLF->ZLF_RETILJ := _cLojForn
	ZLF->ZLF_A2COD  := _cCodForn
	ZLF->ZLF_A2LOJA := _cLojForn
	ZLF->ZLF_A2NOME := Posicione("SA2",1,xFILIAL("SA2")+_cCodForn+_cLojForn,"A2_NOME")
	ZLF->ZLF_EVENTO := cEvento
	ZLF->ZLF_DCREVE := Posicione("ZL8",1,xFILIAL("ZL8")+cEvento,"ZL8_DESCRI")
	ZLF->ZLF_ENTMIX := Posicione("ZL8",1,xFILIAL("ZL8")+cEvento,"ZL8_MIX")
	ZLF->ZLF_DEBCRED:= cDebCred
	ZLF->ZLF_DTINI  := Posicione("ZLE",1,xFILIAL("ZLE")+cCodMIX,"ZLE_DTINI")
	ZLF->ZLF_DTFIM  := Posicione("ZLE",1,xFILIAL("ZLE")+cCodMIX,"ZLE_DTFIM")
	ZLF->ZLF_ORIGEM := "F"
	ZLF->ZLF_QTDBOM := 0
	ZLF->ZLF_TOTAL  := nValor
	ZLF->ZLF_SE1VLR := nSE1VLR
	ZLF->ZLF_SE1SLD := nSE1SLD //If(!_lSaldoOk, nSE2VLR,  0)
	ZLF->ZLF_SE1JUR := nSE1JUR
	ZLF->ZLF_VLRPAG := nSE1VLR-nSE1SLD//If(_lSaldoOk, nSE2VLR,  nSE2VLR-nSE2SLD)
	ZLF->ZLF_VLRLTR := 0
	ZLF->ZLF_SE1ACR := nSE1ACRES
	ZLF->ZLF_ACERTO := "S"
	ZLF->ZLF_TP_MIX := "L"
	ZLF->ZLF_TIPO   := "L"
	ZLF->ZLF_STATUS := "F"
	ZLF->ZLF_SEQ	:= _cSeq
	ZLF->ZLF_DCRSET := POSICIONE("ZL2",1,xFilial("ZL2")+ZLF->ZLF_SETOR,"ZL2_DESCRI")//"BEN ALIMENTOS - RIALMA"
	ZLF->ZLF_DCREVE := Posicione("ZL8",1,xFILIAL("ZL8")+cEvento,"ZL8_NREDUZ")
	ZLF->ZLF_TRIBUT := Posicione("SA2",1,xFILIAL("SA2")+_cCodForn+_cLojForn,"A2_L_TRIBU") //_cTpTrib 		
	ZLF->ZLF_L_SEEK := cCodMIX + cSeek//xFilial("ZLF") + cCodMIX + _cVersao + _cCodForn + _cLojForn + cEvento + "NDF" +
	ZLF->ZLF_SE1PRE := cPref
	ZLF->ZLF_SE1NUM  := cNum
	ZLF->ZLF_SE1PAR := cParc
	ZLF->ZLF_SE1HIS := cSE1HIS
	ZLF->ZLF_SE1VEN := STOD(dSE1VEN)
	
	ZLF->(MsUnLock())
	
EndIf

Return

/*
User Function GrvZLF(cCodMIX,cEvento,nValor,cSeek,_cSeq,cFunName,cLinha,;
			cDebCred,nSE1VLR,nSE1SLD,dSE1VEN,cSE1HIS,nSE1JUR,nSE1ACRES,;
			_cCodForn,_cLojForn,cPref,cNum,cParc,cTipo,_cLjSE2,_lInc)


DEFAULT _lInc := .F. // Indica se a fun��o esta sendo chamada pela inclusao inicial dos titulos.

DbSelectArea("ZLF")
DbSetOrder(4)
If DbSeek(xFilial("ZLF")+cCodMIX+cSeek)
	RecLock("ZLF",.F.)
	If Alltrim(cFunName) == "MGLT033"
//		ZLF->ZLF_ACERTO := "N"
//		ZLF->ZLF_STATUS := "P"
		ZLF->(DbDelete())
//	ElseIf ZLF->ZLF_SE1SLD >= (nValor) .AND. !_lInc //-(nValor)
	ElseIf !_lInc //-(nValor)
//		ZLF->ZLF_SE1SLD -= nValor
		ZLF->ZLF_SE1JUR += nSE1JUR
		ZLF->ZLF_VLRPAG += nValor 
    EndIf
	ZLF->(MsUnlock())
	
ElseIf Alltrim(cFunName) != "MGLT033"
	_cSeq:= U_GetSeqZLF(cCodMIX,cEvento,_cCodForn,_cLojForn)
	
	RecLock("ZLF", .T.)
	
	ZLF->ZLF_FILIAL := xFilial("ZLF")
	ZLF->ZLF_CODZLE := cCodMIX
	ZLF->ZLF_VERSAO := "1" //_cVersao
	ZLF->ZLF_SETOR  := "000001" //ZL2->ZL2_COD
	ZLF->ZLF_LINROT := Posicione("SA2",1,xFILIAL("SA2")+_cCodForn+_cLojForn,"A2_L_LI_RO")
	ZLF->ZLF_RETIRO := _cCodForn
	ZLF->ZLF_RETILJ := _cLojForn
	ZLF->ZLF_A2COD  := _cCodForn
	ZLF->ZLF_A2LOJA := _cLojForn
	ZLF->ZLF_A2NOME := Posicione("SA2",1,xFILIAL("SA2")+_cCodForn+_cLojForn,"A2_NOME")
	ZLF->ZLF_EVENTO := cEvento
	ZLF->ZLF_DCREVE := Posicione("ZL8",1,xFILIAL("ZL8")+cEvento,"ZL8_DESCRI")
	ZLF->ZLF_ENTMIX := Posicione("ZL8",1,xFILIAL("ZL8")+cEvento,"ZL8_MIX")
	ZLF->ZLF_DEBCRED:= cDebCred
	ZLF->ZLF_DTINI  := Posicione("ZLE",1,xFILIAL("ZLE")+cCodMIX,"ZLE_DTINI")
	ZLF->ZLF_DTFIM  := Posicione("ZLE",1,xFILIAL("ZLE")+cCodMIX,"ZLE_DTFIM")
	ZLF->ZLF_ORIGEM := "F"
	ZLF->ZLF_QTDBOM := 0
	ZLF->ZLF_TOTAL  := nValor
	ZLF->ZLF_SE1VLR := nSE1VLR
	ZLF->ZLF_SE1SLD := nSE1SLD //If(!_lSaldoOk, nSE2VLR,  0)
	ZLF->ZLF_SE1JUR := nSE1JUR
	ZLF->ZLF_VLRPAG := nSE1VLR-nSE1SLD//If(_lSaldoOk, nSE2VLR,  nSE2VLR-nSE2SLD)
	ZLF->ZLF_VLRLTR := 0
	ZLF->ZLF_SE1ACR := nSE1ACRES
	ZLF->ZLF_ACERTO := "S"
	ZLF->ZLF_TP_MIX := "L"
	ZLF->ZLF_TIPO   := "L"
	ZLF->ZLF_STATUS := "F"
	ZLF->ZLF_SEQ	:= _cSeq
	ZLF->ZLF_DCRSET := POSICIONE("ZL2",1,xFilial("ZL2")+ZLF->ZLF_SETOR,"ZL2_DESCRI")//"BEN ALIMENTOS - RIALMA"
	ZLF->ZLF_DCREVE := Posicione("ZL8",1,xFILIAL("ZL8")+cEvento,"ZL8_NREDUZ")
	ZLF->ZLF_TRIBUT := "I" //_cTpTrib 		
	ZLF->ZLF_L_SEEK := cCodMIX + cSeek//xFilial("ZLF") + cCodMIX + _cVersao + _cCodForn + _cLojForn + cEvento + "NDF" +
	ZLF->ZLF_SE1PRE := cPref
	ZLF->ZLF_SE1NUM  := cNum
	ZLF->ZLF_SE1PAR := cParc
	ZLF->ZLF_SE1HIS := cSE1HIS
	ZLF->ZLF_SE1VEN := STOD(dSE1VEN)
	
	ZLF->(MsUnLock())
	
EndIf

Return
*/
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �CalcJuros �Autor  �Guilherme Franca    � Data �  10/04/14   ���
�������������������������������������������������������������������������͹��
���Desc.     � Realiza o calculo de juros dos titulos em atraso, e inclui ���
���          � um NDF com o valor apurado de acordo com regras da AGROVERDE��
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function CalcJuros(oObj)

Local _cQry := ""
Local _nTaxa := GetMV("LT_JUROS") //Busca taxa parametrizada.
Local _cEveJur := "100039"
Local _cNrotit := SubStr(SA2->A2_COD,2,5)+SubStr(ZLE->ZLE_COD,3,4)
Local _cHistJr := "JUROS S/SLD DEV. "+SubStr(dtoc(ZLE->ZLE_DTFIM),4,7)

_cQry := "SELECT SUM( E1_SALDO + E1_SDACRES -E1_SDDECRE ) AS SALDO"
_cQry += " FROM "+RetSqlName("SE1")+" E1 "
_cQry += " WHERE E1.D_E_L_E_T_ = ' '"
_cQry += " AND E1.E1_SALDO   > 0"  //Somente titulos em aberto ou baixados parcialmente
_cQry += " AND E1.E1_EMISSAO <= '" + DtoS(ZLE->ZLE_DTFIM) 	+ "'"
_cQry += " AND E1.E1_VENCTO < '"  + DtoS(ZLE->ZLE_DTFIM)	+ "'" //Somente titulos em atraso
_cQry += " AND E1.E1_CLIENTE = '"  + SA2->A2_COD 			+ "'"
_cQry += " AND E1.E1_LOJA    = '"  + SA2->A2_LOJA			+ "'"
_cQry += " AND E1.E1_L_EVENT <> ' ' "
_cQry += " AND E1_L_JUROS = 'S' "

//TCQUERY _cQry NEW ALIAS ("TJUR")             

  If Select("TJUR") <> 0
        TJUR->(dbCloseArea())
  EndIf

 dbUseArea( .T., "TOPCONN", TcGenQry(,,_cQry), "TJUR", .T., .F. )    
 
//dbSelectArea("TJUR")
TJUR->(DbGoTop())  

If !TJUR->(Eof())
	_nVlrJuros := TJUR->SALDO * _nTaxa
EndIf 

If _nVlrJuros > 0 
	DbSelectArea("ZL8")
	DbSetOrder(1)
	If DbSeek(xFilial("ZL8")+_cEveJur)
		//IncluiSE2(oObj,Round(_nVlrJuros,2),ZL8->ZL8_PREFIX,_cNrotit,SA2->A2_LOJA,"NDF",_cHistJr,"","CalcJuros",ZL8->ZL8_NATPRD,ZL8->ZL8_COD)
		U_IncluSE1(ZL8->ZL8_PREFIX,_cNrotit,"01","NF ",SA2->A2_COD,SA2->A2_LOJA,ZL8->ZL8_NATPRD,STOD(_cMaxEmis),STOD(_cVencto),Round(_nVlrJuros,2),0,0,"",_cHistJr,0,ZL8->ZL8_COD,"MGLT032",_cAno+_cMes,xFilial("SF2"),cCodMix)
	EndIf
EndIf
	
Return


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �GeraNumTit�Autor  �Guilherme Fran�a    � Data �  16/06/16   ���
�������������������������������������������������������������������������͹��
���Desc.     � Gera numera��o automatica para ser utilizada nos titulos   ���
���          � aglutinadores GL1 e GL2.                                   ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function GeraNumTit(xcCod,xcLoja)

Local _cNum := Right(cCodMix,3)
Local _cRet := ""

If Select("NTIT")<>0
	NTIT->(DbCloseArea())
EndIf

BeginSql alias "NTIT"
	SELECT F1_DOC as NUM FROM %Table:SF1% F1 
	WHERE F1_FILIAL = %Exp:cFilAnt% 
	AND F1_L_MIX = %Exp:cCodMix%      
	AND F1_FORNECE = %Exp:xcCod%      	
	AND F1_LOJA = %Exp:xcLoja%      	
	AND F1.%NotDel%
EndSql

	
If !NTIT->(Eof())
	If !Empty(NTIT->NUM)
		_cRet := NTIT->NUM
	EndIf
EndIf

If Empty(_cRet)
	_cRet := _cNum+SubStr(xcCod,2,5)+SubStr(xcLoja,2,1)
EndIf

Return _cRet

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �FlagZLF �Autor  �GUILHERME FRANCA    � Data �  21/04/16   ���
�������������������������������������������������������������������������͹��
���Desc.     � Grava o campo ZLF_FINOK indicando que o fechamento foi realizado.
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function FlagZLF(oObj)

Local cQry := ""


cQry := "UPDATE "+RETSQLNAME("ZLF")
cQry += " SET ZLF_FINOK = 'S' "
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
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MGLT009   �Autor  �Microsiga           � Data �  11/27/14   ���
�������������������������������������������������������������������������͹��
���Desc.     �                                                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function ValidaBloqueio(_dDtIni,_dDtFim)

Local _cMatriculas := ""
Local _cFiltro := "% BETWEEN '"+DTOS(_dDtIni)+"' AND '"+DTOS(_dDtFim)+"' %"

BeginSql alias "BLQ"
SELECT (LF.ZLF_RETIRO+"-"+LF.ZLF_RETILJ) MAT 
FROM %Table:ZLF% LF
	JOIN %Table:SA2% A2 ON A2.A2_COD = LF.ZLF_RETIRO AND A2.A2_LOJA = LF.ZLF_RETILJ AND A2.A2_MSBLQL = '1' AND A2.%NotDel%
WHERE LF.ZLF_CODZLE = %Exp:cCodMIX%
AND LF.ZLF_SEQ = '001'
AND LF.%NotDel% = ' '
EndSql

BLQ->(DbGoTop())
While !BLQ->(Eof())
	_cMatriculas := _cMatriculas + BLQ->MAT+"/ "
	BLQ->(DbSkip())
EndDo

BLQ->(DbCloseArea())

If !Empty(_cMatriculas)
	xMagHelpFis("Bloqueio","Existem Produtores deste MIX com cadastro bloqueado!",;
	"Desbloqueie os cadastros abaixo antes de prosseguir com o fechamento:"+_ENTER;
	+_cMatriculas)
	Return .f.
EndIf

Return .t.

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � AtualizaSld� Autor �Guilherme Fran�a  � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Desc.     � Atualiza os saldos na tabela ZLV.                          ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function AtualizaSld(Obj)

Local _cAno := Alltrim(Str(year(ZLE->ZLE_DTFIM)))
Local _cMes := StrZero(Month(ZLE->ZLE_DTFIM),2)

DbSelectArea("ZLV")
DbSetOrder(1)
If ZLV->(DbSeek(xFilial("ZLV")+_cAno+_cMes+SA2->A2_COD+SA2->A2_LOJA))
	RecLock("ZLV",.F.)
	ZLV->ZLV_DEBITO := _nTotDebito
	ZLV->ZLV_VLRLIQ := ZLV->ZLV_VLRNF - ZLV->ZLV_FUNRUR - ZLV->ZLV_SENAR - _nTotDebito
	
	ZLV->(MsUnlock())

EndIf


Return


