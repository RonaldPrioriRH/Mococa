#include "protheus.ch"

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออออหอออออออัอออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณPE01NFESEFAZบ Autor ณ Guilherme Fran็a              บ Data da Criacao  ณ 07/07/2016                				 	    บฑฑ
ฑฑฬออออออออออุออออออออออออสอออออออฯอออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Ponto de entrada na gera็ใo do arquivo XML para transmissใo da NF-e para SEFAZ  					    	    บฑฑ
ฑฑบ			 ณ														                                   					    บฑฑ
ฑฑบ          ณ 															                               					    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ NFESEFAZ.PRW                                                            			                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum.   					   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum   															                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ                                                                                          					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Faturamento / Compras                                                                   					    บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU?AO INICIAL                   					    บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				             ณUsuario(Filial+Matricula+Nome)    ณSetor          บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ             บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function PGLT001(xaRet) 

Local aProd		:= xaRet[1]
Local cMensCli	:= xaRet[2]
Local cMensFis	:= xaRet[3]
Local aDest		:= xaRet[4]
Local aNota   	:= xaRet[5]
Local aInfoItem	:= xaRet[6]
Local aDupl		:= xaRet[7]
Local aTransp	:= xaRet[8]
Local aEntrega	:= xaRet[9]
Local aRetirada	:= xaRet[10]
Local aVeiculo	:= xaRet[11]
Local aReboque	:= xaRet[12]
Local aNfVincRur := {}
Local aEspVol	:= {}
Local aRetorno	:= {}
Local _cTexto
Local _cAliasTr := ""
Local aNfVinc	:= xaRet[15] //Ticket 3482240 (Error log NF4.0 - Array out of bounds - Homologa็ใo)

if len(xaRet)>=13
	aNfVincRur := xaRet[13]
endif
if len(xaRet)>=14
	aEspVol := xaRet[14]
endif
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณMensagem da NF do leite, gerada no fechamento do GLTณ
//ณGuilherme Fran็a - 07/07/16                         ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If Len(aNota)>3
	If aNota[4] == "0" 
		If !Empty(SF1->F1_L_MIX)
			_cTexto :=  SF1->F1_L_MENSG
			If !AllTrim(_cTexto) $ cMensCli
				cMensCli += " | "+AllTrim(_cTexto)+" | "
			EndIf
			_cTexto := 'ICMS diferido conf. art. 367 do RICMS/91'
			If !AllTrim(_cTexto) $ cMensFis
				cMensFis += " | "+AllTrim(_cTexto)+" | "
			EndIf
				
			If Year2Str(DDATABASE) == '2017'
				cMensCli += " Texto provisorio: "+ALLTRIM(Posicione("SA2",1,xFilial("SA2")+SF1->F1_FORNECE+SF1->F1_LOJA,"A2_NOME")) 			
			EndIf

		EndIf
		
		//Altera o valor da fatura para o saldo lํquido a pagar ao produtor
		DbSelectArea("SE2")
		DbSetOrder(1)
		If SE2->(DbSeek(xFilial("SE2")+SF1->F1_SERIE+SF1->F1_DUPL+Space(TamSX3("E2_PARCELA")[1])+'NF '+SF1->F1_FORNECE+SF1->F1_LOJA))
			If Len(aDupl) == 1 //S๓ faz a altera็ใo se existir apenas uma parcela
				IF SE2->E2_SALDO > 0
					aDupl[1][3] := SE2->E2_SALDO
				Else
				 	aDupl := {}
				EndIf
			EndIf		
		EndIf
		
	
		_cAliasTr := BuscaTransp(SF1->F1_FORNECE,SF1->F1_LOJA) //Localiza transportador registrado na rota do produtor
	
		DbSelectArea(_cAliasTr)
		(_cAliasTr)->(DbGoTop())
	
		If !(_cAliasTr)->(Eof())
			aadd(aTransp,AllTrim((_cAliasTr)->A2_CGC))
			aadd(aTransp,(_cAliasTr)->A2_NOME)
			aadd(aTransp,IIF(Empty((_cAliasTr)->A2_INSCR),"ISENTO",Alltrim((_cAliasTr)->A2_INSCR)))
			aadd(aTransp,(_cAliasTr)->A2_END)
			aadd(aTransp,(_cAliasTr)->A2_MUN)
			aadd(aTransp,Upper((_cAliasTr)->A2_EST)	)
			aadd(aTransp,(_cAliasTr)->A2_EMAIL)
			If !Empty((_cAliasTr)->ZL4_PLACA)
					aadd(aVeiculo,(_cAliasTr)->ZL4_PLACA)
					aadd(aVeiculo,(_cAliasTr)->A2_EST)
					aadd(aVeiculo,"")//RNTC
			EndIf		
		EndIf
	
		DbSelectArea(_cAliasTr)
		(_cAliasTr)->(DbCloseArea())	
	
	EndIf
	//Fim mensagem GLT
EndIf
//O retorno deve ser exatamente nesta ordem e passando o conte๚do completo dos arrays
//pois no rdmake nfesefaz ้ atribuido o retorno completo para as respectivas variแveis
//Ordem:
//		aRetorno[1] -> aProd
//		aRetorno[2] -> cMensCli
//		aRetorno[3] -> cMensFis
//		aRetorno[4] -> aDest
//		aRetorno[5] -> aNota
//		aRetorno[6] -> aInfoItem
//		aRetorno[7] -> aDupl
//		aRetorno[8] -> aTransp
//		aRetorno[9] -> aEntrega
//		aRetorno[10] -> aRetirada
//		aRetorno[11] -> aVeiculo
//		aRetorno[11] -> aReboque


ASort(  aProd  ,,,{|aX,aY| aX[1] < aY[1]})

aadd(aRetorno,aProd)
aadd(aRetorno,cMensCli)
aadd(aRetorno,cMensFis)
aadd(aRetorno,aDest)
aadd(aRetorno,aNota)
aadd(aRetorno,aInfoItem)
aadd(aRetorno,aDupl)
aadd(aRetorno,aTransp)
aadd(aRetorno,aEntrega)
aadd(aRetorno,aRetirada)
aadd(aRetorno,aVeiculo)
aadd(aRetorno,aReboque)
if len(xaRet)>=13
	aadd(aRetorno,aNfVincRur) //13
endif
if len(xaRet)>=14
	aadd(aRetorno,aEspVol) //14
endif
aadd(aRetorno,aNfVinc) //15
RETURN aRetorno



/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออหออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณBuscaTranspบAutor ณGuilherme Fran็a    บ Data ณ  06/09/16   บฑฑ
ฑฑฬออออออออออุอออออออออออสออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Busca Dados da transportadora para emitir na NF do produtorบฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function BuscaTransp(xCod,xLoja)

Local _cAlias := GetNextAlias()


BeginSql alias _cAlias
	SELECT A2.A2_CGC, A2.A2_NOME, A2.A2_INSCR, A2.A2_MUN, A2.A2_END, A2.A2_EST, A2.A2_EMAIL, L4.ZL4_NOME, L4.ZL4_PLACA 
	FROM %Table:SA2% A2
		JOIN %Table:ZLW% LW ON LW.ZLW_FRETIS = A2.A2_COD AND LW.ZLW_FRETLJ = A2.A2_LOJA AND LW.%NotDel%
		JOIN %Table:ZLZ% LZ ON LZ.ZLZ_CODPRO = %Exp:xCod% AND LZ.ZLZ_LJPROD = %Exp:xLoja% AND LZ.ZLZ_ROTA = LW.ZLW_COD 
		AND LZ.ZLZ_VERSAO = LW.ZLW_VERSAO AND LZ.D_E_L_E_T_ = ''
		JOIN %Table:ZL4% L4 ON L4.ZL4_COD = LW.ZLW_VEICUL AND L4.%NotDel%
	WHERE A2.%NotDel%
EndSql
	

Return _cAlias
