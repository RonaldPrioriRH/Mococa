#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "SHELL.CH"

#DEFINE _ENTER CHR(13)+CHR(10)
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ MGLT047  บ Autor ณRamon Teles M.         บ Data da Criacao  ณ 03/02/2014					                  	บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Rotina de Adiantamento da CAPAL.																				บฑฑ
ฑฑบ          ณ                                                                                    					        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ 												                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                                                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                                                    บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออcอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Faturamento                                                                            				      	บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   				        บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor 		บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ             บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
*/
User Function MGLT047()

	Local oDlg
	Local bProcess  := {|oSelf| U_MGLT047A(oSelf)}
	Local oTProces
	
	Private _cPerg	:= "MGLT047"  
	
	Private _dDtVencto
				
	CriaSX1()
	//MV_PAR01 Cliente
	
	Pergunte(_cPerg,.F.)
	
	_cTexto := "Este programa ira executar a rotina de adiantamento"+_ENTER
	_cTexto += "para os COOPERADOS.							       "+_ENTER
	_cTexto += "												   "
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Sintaxe da tNewProcess():New( cFunction, cTitle, bProcess, cDescription, cPerg, aInfoCustom) ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	// CRIA TELA DE PROCESSAMENTO PADRAO DO SISTEMA.
	oTProces := tNewProcess():New("MGLT047","Adiantamento",bProcess,_cTexto,_cPerg)

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ MGLT047A บ Autor ณ Ramon Teles        บ Data ณ  03/02/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Funcao chamada pelo botao OK na tela inicial de processamenบฑฑ
ฑฑบ          ณ to. Executa o adiantamento.				                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/   

//User Function MGLT047Z()
	
//	Processa({|| U_MGLT047A() },"Adiantamentos...")
	
//Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ MGLT047A บ Autor ณ Ramon Teles        บ Data ณ  03/02/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Funcao chamada pelo botao OK na tela inicial de processamenบฑฑ
ฑฑบ          ณ to. Executa o adiantamento.				                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function MGLT047A(oObjProc)
	
	Local _cAlias   := GetNextAlias()
	Local _aProd	:= {}
	Local _lRet		:= .T.
	Local _cData 	:= mv_par01+"15"      
	
	Private _mv_par01 := mv_par01
	
	Private _cPrefAdi	:= Alltrim(GETMV("LT_PRXADI"))
	Private _nPorc	:= GETMV("LT_ADIANT")
	Private _nPrcLt	:= GETMV("LT_PRCBAS")
	Private _nValor	:= 0
	Private _aLog      := {}
	Private _aBaixas   := {}
	Private _aGeral 	:= {}
	Private _cEvAd := "300001"//ALLTRIM(GetMv("LT_EVTADT"))        
	Private _nReg     
	
	_dDtVencto	:= MV_PAR02
	
	IF DDATABASE > _dDtVencto
		ALERT("Data de Vencimento menor que a Data Base.")
		return
	ENDIF
	
//	_dDtVencto	:= STOD(SUBSTR(DTOS(LASTDAY(DDATABASE)+1),1,6) + STRZERO(VAL(MV_PAR02),2,0))

	IncProc("Localizando Produtores...")
	
	BeginSql Alias _cAlias
	
		SELECT SA2.A2_COD,SA2.A2_LOJA,SUM(ZLD.ZLD_QTDBOM) AS TOTAL
		FROM %Table:SA2% SA2
		INNER JOIN %Table:ZLD% ZLD ON ZLD.ZLD_RETIRO = SA2.A2_COD AND ZLD.ZLD_RETILJ = SA2.A2_LOJA
		WHERE SA2.A2_FILIAL   = %xFilial:SA2%
		AND   ZLD.ZLD_FILIAL  = %xFilial:ZLD%
		AND   SA2.A2_C_RECAD  = %Exp:"T"%
		AND   ZLD.ZLD_DTCOLE  <= %Exp:_cData%
		AND   SA2.%NotDel%
		AND   ZLD.%NotDel% 
		//AND   SA2.A2_COD = 'P00006' //SOMENTE PARA TESTE 
		AND   0 = (SELECT COUNT(*) FROM %Table:SE2% SE2 WHERE SE2.E2_FORNECE = SA2.A2_COD AND SE2.E2_L_EVENT = %Exp:_cEvAd%
		AND SE2.E2_LOJA = SA2.A2_LOJA AND  SE2.E2_PREFIXO = %Exp:_cPrefAdi% AND SE2.E2_EMISSAO LIKE %Exp:_cData% 
		AND SE2.E2_L_SEEK = %Exp:_MV_PAR01+_cEvAd% AND SE2.%NotDel%)
		GROUP BY SA2.A2_COD,SA2.A2_LOJA
			
	EndSql
	
	dbSelectArea(_cAlias)
	Count To _nReg
	(_cAlias)->(dbGoTop())  
	
	While !(_cAlias)->(Eof())

		IncProc("Gravando Produtores...")	
		AADD(_aProd,{((_cAlias)->A2_COD),((_cAlias)->A2_LOJA),((_cAlias)->TOTAL)})

		(_cAlias)->(dbSkip())
	EndDo
	
	BEGIN TRANSACTION
	
		//Adiantamento
		_lRet	:= MGLT047B(_aProd,oObjProc)
	
		If !_lRet
			DisarmTransaction()
			MsgAlert("Processo de Adiantamento com Falha. Favor executar novamente!")
			Return
		EndIf

	END TRANSACTION
	
	If _lRet
		//Imprimi Relatorio
		MGLT047R()
	EndIf

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ MGLT047B บ Autor ณ Ramon Teles        บ Data ณ  03/02/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Rotina de Adiantamento.									  บฑฑ
ฑฑบ          ณ 											                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function MGLT047B(_aDados,oObjProc)

	Local _lRetorno	:= .T.
	Local _aRetorno	:= {}
	Local _nVlrRet	:= 0

	_nProd	:= _nReg
	
	oObjProc:SetRegua1(_nReg)

	_nCont	:= 1	
	
	IncProc("Processando Adiantamentos...")
	
	For _nX := 1 to Len(_aDados)    

		If oObjProc <> Nil
			oObjProc:IncRegua1("Produtor "+AllTrim(Str(_nCont))+" de "+AllTrim(Str(_nProd))+" ("+AllTrim(str( round((_nCont/_nProd)*100,0) ))+"%) - " + _aDados[_nX][1]+"/"+_aDados[_nX][2])
		EndIf 	
		
		_nCont++
		
		_nValor := (( _aDados[_nX][3] * (_nPorc/100) )* _nPrcLt )
		
		If _nValor > 0	 
			
			//Gera os registros na SE2
			//_aRetorno := IncluiSE2("NDF",_aDados[_nX][1],_aDados[_nX][2],_nValor)
			_aRetorno := IncluiTit("NF",_aDados[_nX][1],_aDados[_nX][2],_nValor)
				
			If !_aRetorno[1]
				Return _aRetorno[1]
			EndIf
			
			_nVlrRet := ValidAdi(_aDados[_nX][1],_aDados[_nX][2],_nValor)
			
			//Log com todos os adiantamentos a serem realizados
			AADD(_aGeral,{_aDados[_nX][1],_aDados[_nX][2],_nValor,_nVlrRet})  
				
			If _nVlrRet > 0 
				
				_aRetorno := IncluiSE2("NF ",_aDados[_nX][1],_aDados[_nX][2],_nVlrRet)
				
				If !_aRetorno[1]
					Return _aRetorno[1]
				EndIf
				
				//Log dos adiantamentos realizados
				AADD(_aLog,{_aDados[_nX][1],_aDados[_nX][2],_nVlrRet})
				
			ElseIf _nVlrRet < 0
				Return .F.
			EndIf
			
		Endif
		
	Next
	
Return _lRetorno

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณValidAdi  บ Autor ณMicrosiga           บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Inclusao de Contas a Pagar, via SIGAAUTO.                  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function ValidAdi(_cProd,_cProdLj,_nVlr)

	Local aArea	  	:= GetArea()
	Local _cAlias   	:= GetNextAlias()
	Local _nVlrTit	:= 0
	Local _nVlrBx 	:= 0
	Local _nVlrRet	:= 0
	Local _cData 		:= DTOS(dDatabase)
	Local _cMotBaixa := "GLA"//AllTrim(GETMV("LT_MOTBX"))  //Motivo de baixa utilizado para a rotina do Leite
	Local cHistSE1   := "Baixa Adiat - "+_mv_par01//ALLTRIM(GetMv("LT_EVTADT"))
	/*
	BeginSql Alias _cAlias
	
		SELECT SE2.*
		FROM %Table:SE2% SE2
		WHERE  SE2.E2_TIPO    = %Exp:"NDF"%
		AND   SE2.E2_FORNECE  = %Exp:_cProd%
		AND 	 SE2.E2_VENCTO <  %Exp:_cData%
		AND   SE2.E2_SALDO > 0
		AND   SE2.%NotDel%
		ORDER BY SE2.E2_VENCTO
			
	EndSql
	*/
	BeginSql Alias _cAlias
	
		SELECT SE1.*
		FROM %Table:SE1% SE1
		WHERE	SE1.E1_TIPO    	= %Exp:"NF"%
			AND SE1.E1_CLIENTE  = %Exp:_cProd%
			AND SE1.E1_VENCTO 	< %Exp:_cData%
			AND SE1.E1_SALDO 	> 0
			AND SE1.%NotDel%    
			AND	SE1.E1_C_FORPG	= %Exp:"CO"%
		ORDER BY SE1.E1_VENCTO
			
	EndSql
	
	
	
	dbSelectArea(_cAlias)
	(_cAlias)->(dbGoTop())
	
	While !(_cAlias)->(Eof())

		//_nVlrTit :=  ( (_cAlias)->E2_SALDO + (_cAlias)->E2_SDACRES ) - (_cAlias)->E2_SDDECRE
		_nVlrTit :=  ( (_cAlias)->E1_SALDO + (_cAlias)->E1_SDACRES ) - (_cAlias)->E1_SDDECRE
		
		If _nVlr == 0 
			Return _nVlr
		ElseIf _nVlr > _nVlrTit
			_nVlrBx := _nVlrTit
			_nVlr := _nVlr - _nVlrTit	
		Else 
			_nVlrBx := _nVlr
			_nVlr := 0	
		EndIf
		
		//Baixa Titulo do Financeiro
		//If !BaixaSE2(_nVlrBx,(_cAlias)->E2_PREFIXO,(_cAlias)->E2_NUM,(_cAlias)->E2_PARCELA,(_cAlias)->E2_TIPO,(_cAlias)->E2_FORNECE,(_cAlias)->E2_LOJA)
		If !U_BaixaSE1(_nVlrBx,(_cAlias)->E1_PREFIXO,(_cAlias)->E1_NUM,(_cAlias)->E1_PARCELA,(_cAlias)->E1_TIPO,(_cAlias)->E1_CLIENTE,(_cAlias)->E1_LOJA,_cMotBaixa,cHistSE1)	
			_nVlr := -1
			Return _nVlr
		EndIf	
		
		//Log das baixas realizadas
		//AADD(_aBaixas,{_cProd,_cProdLj,(_cAlias)->E2_PREFIXO,(_cAlias)->E2_NUM,(_cAlias)->E2_PARCELA,(_cAlias)->E2_TIPO,(_cAlias)->E2_FORNECE,(_cAlias)->E2_LOJA,_nVlrTit,_nVlrBx})
		AADD(_aBaixas,{_cProd,_cProdLj,(_cAlias)->E1_PREFIXO,(_cAlias)->E1_NUM,(_cAlias)->E1_PARCELA,(_cAlias)->E1_TIPO,(_cAlias)->E1_CLIENTE,(_cAlias)->E1_LOJA,_nVlrTit,_nVlrBx})
		
		
		(_cAlias)->(dbSkip())
				
	EndDo
	
	RestArea(aArea)
	
Return _nVlr

/*                                                                                                                      	
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณIncluiSE2 บ Autor ณMicrosiga           บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Inclusao de Contas a Pagar, via SIGAAUTO.                  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function IncluiSE2(_cTipo,_cProd,_cProdLj,_nVal)

	Local _aAutoSE2   := {}
	Local lMsErroAuto := .F.
	Local lRet        := .T.
	
	Local _cNumTit
	Local _dData 		:= dDatabase

	Local _cHistorico 	:= "ADIANTAMENTO: "+_cProd+_cProdLj
	Local _cNatureza	:= Alltrim(GETMV("LT_NATPAD"))//NATUREZA DO TITULO DE PAGAMENTO DO ADIANTAMENTO AO COOPERADO
	
	Local cParc    := StrZero(1,TamSx3("E1_PARCELA")[1]) //Parcela do titulo do evento
	
	_cNumTit	:= BuscFatSE2()
	        
	dbSelectArea("SE2")
	dbSetOrder(1)
		
	_aAutoSE2:={;
		{"E2_PREFIXO",_cPrefAdi		   			,Nil},;
		{"E2_NUM"    ,_cNumTit      			,Nil},;
		{"E2_TIPO"   ,_cTipo          			,Nil},;
		{"E2_NATUREZ",_cNatureza	   			,Nil},; //Pendente
		{"E2_FORNECE",_cProd      				,Nil},;
		{"E2_LOJA"   ,_cProdLj	      			,Nil},;
		{"E2_EMISSAO",_dData     				,Nil},;
		{"E2_VENCTO" ,_dDtVencto       			,Nil},; //Pendente
		{"E2_VENCREA",LASTDAY(_dDtVencto,3)   	,Nil},; //Pendente
		{"E2_HIST"   ,_cHistorico				,Nil},;
		{"E2_L_EVENT",_cEvAd					,Nil},;
		{"E2_L_SEEK",_MV_PAR01+_cEvAd			,Nil},;
		{"E2_VALOR"  ,_nVal	            		,Nil}}
	
	lMsErroAuto := .F.
	lMsHelpAuto := .T.
	
	//lRet := U_IncluSE1(_cPrefAdi,_cNumTit,cParc,_cTipo,cpForn,cpLoja,cpNatureza,cpEmissao,cpVencto,npValor,npAcres,npDesc,cTitPai,cHist,nVlTxPer,cpEvento,cFunOrigem)
	
	MSExecAuto({|x,y| Fina050(x,y)},_aAutoSE2,3)
	
	If lMsErroAuto
		lRet := .F.
		Mostraerro()
		DisarmTransaction()
	EndIf

Return {lRet,_cNumTit}

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณIncluiTit บ Autor ณMicrosiga           บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Inclusao de Contas a Receber, via SIGAAUTO.                บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function IncluiTit(_cTipo,_cProd,_cProdLj,_nVal)

	Local lRet        := .T.	
	Local _cNumTit
	Local _dData 		:= dDatabase    
	Local _cMes      	:= SubStr(DtoS( ADDMes(dDataBase,1) ),5,2)
	Local _cAno      	:= SubStr(DtoS( ADDMes(dDataBase,1) ),1,4)
	Local _dDtVenctSE1	:= STOD(_cAno + _cMes + "20")
	Local _cHistorico 	:= "ADIANTAMENTO: "+_cProd+" "+_cProdLj
	Local _cNatureza	:= Alltrim(GETMV("LT_NATRAD")) //NATUREZA DE DESCONTO ADIANTAMENTO COOPERADO - TITULO A RECEBER - 210007
	Local _E1LSEEK	    := _MV_PAR01+_cEvAd
	
	Local cParc    := StrZero(1,TamSx3("E1_PARCELA")[1]) //Parcela do titulo do evento
	
	_cNumTit	:= val(U_NextSE1(_cPrefAdi))

    _cNumTit := SubStr(DTOS(dDatabase),3,4)+StrZero(_cNumTit,5)
//    _nContSE1++	
	
	lRet := U_IncluSE1(_cPrefAdi,_cNumTit,cParc,_cTipo,_cProd,_cProdLj,_cNatureza,_dData,_dDtVenctSE1,_nVal,0,0,"",_cHistorico,0,_cEvAd,"MGLT047",_E1LSEEK)

Return {lRet,_cNumTit}


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
Static Function BaixaSE2(nVlrBx,cPrefixo,cNroTit,cParcela,cTipo,cFornece,cLoja)
	
	Local nModAnt := nModulo
	Local cModAnt := cModulo
	
	Local _cMotBaixa := "GLA"//AllTrim(GETMV("LT_MOTBX"))  //Motivo de baixa utilizado para a rotina do Leite
	Local cHistSE2   := "Baixa Adiat - "+_mv_par01//ALLTRIM(GetMv("LT_EVTADT"))
	
	Local lRetorno 	:= .T.
	
	Private lMsErroAuto:= .F.
	Private lMsHelpAuto:= .T.
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Tratamento para liberar o titulo para baixa no financeiro. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
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
	MSExecAuto({|x,y| Fina080(x,y)},aTitulo,3)
	
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
		
		lRetorno := UpdSE5(cPrefixo,cTipo,cNroTit,cParcela,cFornece,cLoja,_cMotBaixa,nVlrBx)
		
		If !lRetorno
				
			xMagHelpFis("NAO CONFORMIDADE - UPDATE DO CAMPO E5_L_SEEK",;
				"Nใo Conformidade ao executar o Update de gravacao do campo E5_L_SEEK! ",;
				xFilial("SE2")+cPrefixo+cNroTit+cParcela+cTipo+cFornece+cLoja+;
				"<-  Copie essas informa็๕es para voce pesquisar no Contas a Pagar o titulo que esta com nใo conformidade.")
					
		EndIf
		
	EndIf
	

Return lRetorno

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ UpdSE5     บ Autor ณ Ramon Teles        บ Data ณ  03/02/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Atualiza SE5 com chave do adiantamento.         			บฑฑ
ฑฑบ          ณ 											         บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Atualiza Mov. Financeira                                    บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function UpdSE5(_cPrefixo,_cTipo,_cNumero,_cParcela,_cFornec,_cLoja,_cMotBaixa,_nValor)

	Local _lRet  := .F.
	Local _cQuery:= ""
	
	_cQuery := "UPDATE "
	_cQuery += RetSqlName("SE5")
	_cQuery += " SET E5_L_SEEK = '" + _mv_par01 + _cEvAd + "' "
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

Return _lRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ BuscaFat บ Autor ณ Ramon Teles        บ Data ณ  03/02/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Busca proximo numero da fatura disponivel.				  บฑฑ
ฑฑบ          ณ 											                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ IncluiSE2			                                      บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function BuscFatSE2()
	
	Local cCod:=""
	
	cQuery:="SELECT MAX(E2_NUM) AS COD FROM "+RetSqlName("SE2")+" WHERE E2_PREFIXO = '"+_cPrefAdi+"' "
	TcQuery ChangeQuery(cQuery) New Alias "FAT"
	
	If Alltrim(FAT->COD) = ""
		cCod:='000000001'
	Else
		cCod:=Strzero(Val(FAT->COD)+1,9)
	EndIF
	
	FAT->(dbCloseArea())

Return cCod

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ MGLT047R บ Autor ณ Ramon Teles        บ Data ณ  03/02/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Relatorio informacoes adiantamento.						  บฑฑ
ฑฑบ          ณ 											                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function MGLT047R()

	Local oFont10	:= TFont():New("MS Sans Serif",,010,,.F.,,,,,.F.,.F.)
	Local oFont12	:= TFont():New("MS Sans Serif",,012,,.F.,,,,,.F.,.F.)
	Local oFont12N	:= TFont():New("MS Sans Serif",,012,,.T.,,,,,.F.,.F.)
	Local oFont12NS	:= TFont():New("MS Sans Serif",,012,,.T.,,,,,.T.,.F.)
	Local oFont14	:= TFont():New("MS Sans Serif",,014,,.F.,,,,,.F.,.F.)
	Local oFont14N	:= TFont():New("MS Sans Serif",,014,,.T.,,,,,.F.,.F.)
	Local oFont14NS	:= TFont():New("MS Sans Serif",,014,,.T.,,,,,.T.,.F.)
	Local oFont16	:= TFont():New("MS Sans Serif",,016,,.F.,,,,,.F.,.F.)
	Local oFont16N	:= TFont():New("MS Sans Serif",,016,,.T.,,,,,.F.,.F.)
	Local oFont16NS	:= TFont():New("MS Sans Serif",,016,,.T.,,,,,.T.,.F.)
	Local _nX 		:= 0
	Local _nLinha	:= 0
	                          
	Private oPrinter
	
	If oPrinter == Nil
		lPreview := .T.
		oPrinter      := FWMSPrinter():New('Relat๓rio Adiantamento',,.F.,,.F.)
		oPrinter:SetPortrait()
	     //oPrinter:Setup()
		oPrinter:SetPaperSize(9)
		oPrinter:SetMargin(60,60,60,60)
	     //oPrinter:cPathPDF :="C:\TEMP\"       
	EndIf
	
	//X e a distancia entre os mesmos componentes nas duas vias
	x:=380
	
	oPrinter:StartPage()
	oPrinter:Box(040,010,800,550)
	
	cText1 := "COOPERATIVA AGROPECUARIA DE ARAXA - CAPAL"
	//oPrinter:SayBitmap(050,020,"\system\LGMID.png",060,033)
	oPrinter:Say(070,120,cText1,oFont14NS)
	
	oPrinter:Say(100,30,"Cooperado" ,oFont12N)
	oPrinter:Say(100,320,"Debito" ,oFont12N)
	oPrinter:Say(100,420,"Credito" ,oFont12N)
	
	
	For _nY := 1 to Len(_aGeral)
	
		
		If _nLinha > 800
			oPrinter:EndPage()
			oPrinter:StartPage()
			oPrinter:Box(040,010,800,550)
			
			cText1 := "COOPERATIVA AGROPECUARIA DE ARAXA - CAPAL"
			oPrinter:SayBitmap(050,020,"\system\LGMID.png",060,033)
			oPrinter:Say(070,120,cText1,oFont16NS)
			
			oPrinter:Say(100,30,"Cooperado" ,oFont12N)
			oPrinter:Say(100,320,"Debito" ,oFont12N)
			oPrinter:Say(100,420,"Credito" ,oFont12N)
			
			_nX := _nY
			_nY++
			
		EndIf
		
		_nLinha := 100+(15*(_nY-_nX))
	
		_cProd := Posicione("SA2",1,xFilial("SA2")+_aGeral[_nY][1]+_aGeral[_nY][2],"A2_NOME")
	
		oPrinter:Say(_nLinha,30,_aGeral[_nY][1]+" "+_aGeral[_nY][2]+" - "+ _cProd ,oFont10)
		//oPrinter:Say(_nLinha,430,picVal(Alltrim(Str((( _aProd[_nY][3] * (_nPorc/100) )* _nPrcLt )))),oFont10)
		oPrinter:Say(_nLinha,320,picVal(Alltrim(Str(_aGeral[_nY][3]))),oFont10)
		oPrinter:Say(_nLinha,420,picVal(Alltrim(Str(_aGeral[_nY][4]))),oFont10)
		
	Next
	
	oPrinter:EndPage()
	
	If lPreview
		oPrinter:Preview()
	EndIf
	
	FreeObj(oPrinter)
	oPrinter := Nil

Return



/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณpicVal    บAutor  ณRamon Teles M. Filhoบ Data ณ  03/02/14   บฑฑ
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
	cRet:="R$ "+SubStr(cRet,1,Len(cRet)-1)+cDec
 
Return (cRet)


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณCriaSX1   บAutor  ณRamon Teles M. Filhoบ Data ณ  03/02/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Cria Pergunta da Rotina.								      บฑฑ
ฑฑบ          ณ    							                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function CriaSX1()

	aHelpPor := {}
	aHelpEng := {}
	aHelpSpa := {}
	Aadd( aHelpPor, 'Ano e M๊s do Adiantamento ao Produtor.')
	Aadd( aHelpSpa, 'Ano e M๊s do Adiantamento ao Produtor.')
	Aadd( aHelpEng, 'Ano e M๊s do Adiantamento ao Produtor.')
	U_xPutSx1(_cPerg,"01","M๊s Adiantamento"		,"M๊s Adiantamento"		,"M๊s Adiantamento"		,"mv_ch1","C",06,0,1,"G","","","","","mv_par01","","","","","","","","","","","","","","","","",{},{},{})
	aHelpPor := {}
	aHelpEng := {}
	aHelpSpa := {}
	Aadd( aHelpPor, 'Dia do Pagamento do Adiantamento ao Produtor.')
	Aadd( aHelpSpa, 'Dia do Pagamento do Adiantamento ao Produtor.')
	Aadd( aHelpEng, 'Dia do Pagamento do Adiantamento ao Produtor.')
	U_xPutSx1(_cPerg,"02","Data Vencimento"		,"Data Vencimento"		,"Data Vencimento"		,"mv_ch2","D",08,0,1,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",{},{},{})

Return
