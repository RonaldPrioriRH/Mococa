#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "SHELL.CH"

#DEFINE _ENTER CHR(13)+CHR(10)
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � MGLT043  � Autor �Ramon Teles M.         � Data da Criacao  � 03/02/2014					                  	���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Estorno do Adiantamento da CAPAL.																			���
���          �                                                                                    					        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � 												                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum						   							                                                    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum						  							                                                    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                                    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Faturamento                                                                            				      	���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   				        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor 		���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �00/00/0000�                               				   �00-000000 -                       � TI			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  �             ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
*/
User Function MGLT043()

	Local oDlg
	Local bProcess  := {|oSelf| U_MGLT043A(oSelf)}
	Local oTProces
	
	Private _cPerg	:= "MGLT043"
				
	CriaSX1()
	//MV_PAR01 Cliente
	
	Pergunte(_cPerg,.F.)
	
	_cTexto := "Este programa ira executar o estorno dos adiantamentos  "+_ENTER
	_cTexto += "realizados para os COOPERADOS.	      			       "+_ENTER
	_cTexto += "												   "
	
	//����������������������������������������������������������������������������������������������Ŀ
	//� Sintaxe da tNewProcess():New( cFunction, cTitle, bProcess, cDescription, cPerg, aInfoCustom) �
	//������������������������������������������������������������������������������������������������
	// CRIA TELA DE PROCESSAMENTO PADRAO DO SISTEMA.
	oTProces := tNewProcess():New("MGLT043","Estorno Adiantamento",bProcess,_cTexto,_cPerg)

Return

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun??o    � OKLETXT  � Autor � Ramon Teles        � Data �  05/02/14   ���
�������������������������������������������������������������������������͹��
���Descri??o � Funcao chamada pelo botao OK na tela inicial de processamen���
���          � to. Executa a leitura do arquivo texto.                    ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

User Function MGLT043Z()
	
	Processa({|| U_MGLT043A() },"Estorno dos Adiantamentos...")
	
Return

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    � MGLT043A � Autor � Ramon Teles        � Data �  03/02/14   ���
�������������������������������������������������������������������������͹��
���Descri��o � Funcao chamada pelo botao OK na tela inicial de processamen���
���          � to. Executa o adiantamento.				                  ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

User Function MGLT043A(oObjProc)
	
	Local _cAlias   := GetNextAlias()
	Local _aProd	:= {}
	Local _lRet		:= .T.
	
	Local _cData 	:= mv_par01+"%"
	                                
	Private _mv_par01 := mv_par01
	
	Private _cPrefSE2		:= Alltrim(GETMV("LT_PRXADI"))
	Private _nPorc	:= GETMV("LT_ADIANT")
	Private _nPrcLt	:= GETMV("LT_PRCBAS")
	Private _nValor	:= 0
	Private _aLog      := {}
	Private _cEvAd := "300001"//ALLTRIM(GetMv("LT_EVTADT")) 
	Private _nReg
	

	IncProc("Localizando Produtores...")
	
	BeginSql Alias _cAlias
	
		SELECT SA2.A2_COD,SA2.A2_LOJA
		FROM %Table:SA2% SA2
		INNER JOIN %Table:ZLD% ZLD ON ZLD.ZLD_RETIRO = SA2.A2_COD AND ZLD.ZLD_RETILJ = SA2.A2_LOJA
		WHERE SA2.A2_FILIAL   = %xFilial:SA2%
		AND   ZLD.ZLD_FILIAL  = %xFilial:ZLD%
		AND   SA2.A2_C_RECAD  = %Exp:"T"% 
		//AND   SA2.A2_COD 	  = %Exp:"P00006"% 
		AND   ZLD.ZLD_DTCOLE  LIKE %Exp:_cData%
		AND   SA2.%NotDel%
		AND   ZLD.%NotDel%
		/*AND   0 < (SELECT COUNT(*) FROM %Table:SE2% SE2 WHERE SE2.E2_FORNECE = SA2.A2_COD AND SE2.E2_L_EVENT = %Exp:_cEvAd%
		AND SE2.E2_LOJA = SA2.A2_LOJA AND  SE2.E2_PREFIXO = %Exp:_cPrefSE2% AND SE2.E2_EMISSAO LIKE %Exp:_cData% 
		AND SE2.E2_L_SEEK = %Exp:_MV_PAR01+_cEvAd% AND SE2.%NotDel%)    */
		GROUP BY SA2.A2_COD,SA2.A2_LOJA
			
	EndSql
		
	dbSelectArea(_cAlias) 
	Count To _nReg
	(_cAlias)->(dbGoTop()) 
	
	_nProd	:= _nReg
	
	oObjProc:SetRegua1(_nReg)	
	
	While !(_cAlias)->(Eof())
		
		IncProc("Gravando Produtores...")
		AADD(_aProd,{ (_cAlias)->A2_COD,(_cAlias)->A2_LOJA})

		(_cAlias)->(dbSkip())
	EndDo

	_nCont	:= 1
	
	BEGIN TRANSACTION
	
		IncProc("Cancelamento das Baixas...")
		For i := 1 to len(_aProd)            
	
			If oObjProc <> Nil
				oObjProc:IncRegua1("Produtor "+AllTrim(Str(_nCont))+" de "+AllTrim(Str(_nProd))+" ("+AllTrim(str( round((_nCont/_nProd)*100,0) ))+"%) - " + _aProd[i][1]+"/"+_aProd[i][2])
			EndIf 	
		
			//Cancela as baixas que foram realizadas
			_lRet := MGLT043B(_aProd[i][1],_aProd[i][2])
			
			If !_lRet
				DisarmTransaction()
				MsgAlert("Processo de Cancelamento das Baixas com falha. Favor executar novamente!")
				Return
			EndIf 
			
			_nCont++
			
		Next
			
		IncProc("Estorno dos adiantamentos...")
		//Exclui os adiantamentos realizados no contas a Pagar 
		_lRet := MGLT043C()
		
		If !_lRet
			DisarmTransaction()
			MsgAlert("Processo de Exclusao dos Adiantamentos no Contas a Pagar com falha. Favor executar novamente!")
			Return
		EndIf
	
		_lRet := MGLT043D()
		
		IncProc("Estorno dos adiantamentos...")
		
		If !_lRet
			DisarmTransaction()
			MsgAlert("Processo de Exclusao dos Adiantamentos no Contas a Receber com falha. Favor executar novamente!")
			Return
		EndIf 

	
	END TRANSACTION
	

Return

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    � MGLT043B	� Autor � Ramon Teles        � Data �  03/02/14   ���
�������������������������������������������������������������������������͹��
���Descri��o � Rotina de Adiantamento.							  		  ���
���          � 											        		  ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function MGLT043B(cFornece,cLoja)

	Local _lRetorno		:= .T.
	Local _cQry
	Local _cArqTmp 		:= GetNextAlias()
	Local nModAnt 		:= nModulo
	Local cModAnt 		:= cModulo
	Local _dDtBkpBas  		:= dDataBase
	Local _aArea			:= GetArea()
	
	Local lSqlOk
	Local _cUpdate
	
	Local lMsErroAuto := .F.
	Local lMsHelpAuto := .T.
	/*
	cQry := "SELECT SE2.E2_FILIAL,SE2.E2_PREFIXO,SE2.E2_NUM,SE2.E2_PARCELA,SE2.E2_TIPO,SE2.E2_FORNECE,SE2.E2_LOJA,SE5.E5_VALOR,SE5.E5_SEQ,E5_MOTBX,SE5.E5_DATA FROM "
	cQry += RetSqlName("SE2") + " SE2, "+RetSqlName("SE5") + " SE5"
	cQry += " WHERE SE2.D_E_L_E_T_ = ' ' AND SE5.D_E_L_E_T_ = ' '"
	cQry += " AND SE2.E2_FORNECE = '" + cFornece + "'"
	cQry += " AND SE5.E5_CLIFOR  = '" + cFornece + "'"
	cQry += " AND SE2.E2_SALDO   <> SE2.E2_VALOR"	
	cQry += " AND SE2.E2_TIPO IN ('NDF','NF ')"   
	cQry += " AND SE2.E2_FILIAL  = SE5.E5_FILIAL"		
	cQry += " AND SE2.E2_PREFIXO = SE5.E5_PREFIXO"
	cQry += " AND SE2.E2_NUM     = SE5.E5_NUMERO"
	cQry += " AND SE2.E2_PARCELA = SE5.E5_PARCELA"		
	cQry += " AND SE2.E2_TIPO    = SE5.E5_TIPO"  
	cQry += " AND SE2.E2_FORNECE = SE5.E5_CLIFOR"		
	cQry += " AND SE2.E2_LOJA    = SE5.E5_LOJA"
	cQry += " AND SE5.E5_SITUACA <> 'C'"
	cQry += " AND SE5.E5_TIPODOC = 'BA'"  
	cQry += " AND SE5.E5_L_SEEK  = '" + _mv_par01 + _cEvAd + "'"
	cQry += " ORDER BY E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO"
	*/      
	
	cQry := "SELECT SE1.E1_FILIAL,SE1.E1_PREFIXO,SE1.E1_NUM,SE1.E1_PARCELA,SE1.E1_TIPO,SE1.E1_CLIENTE,SE1.E1_LOJA,SE5.E5_VALOR,SE5.E5_SEQ,E5_MOTBX,SE5.E5_DATA FROM "
	cQry += RetSqlName("SE1") + " SE1, "+RetSqlName("SE5") + " SE5"
	cQry += " WHERE SE1.D_E_L_E_T_ = ' ' AND SE5.D_E_L_E_T_ = ' '"
	cQry += " AND SE1.E1_CLIENTE = '" + cFornece + "'"
	cQry += " AND SE5.E5_CLIFOR  = '" + cFornece + "'"
	cQry += " AND SE1.E1_SALDO   <> SE1.E1_VALOR"	
	cQry += " AND SE1.E1_TIPO = 'NF' "   
	cQry += " AND SE1.E1_FILIAL  = SE5.E5_FILIAL"		
	cQry += " AND SE1.E1_PREFIXO = SE5.E5_PREFIXO"
	cQry += " AND SE1.E1_NUM     = SE5.E5_NUMERO"
	cQry += " AND SE1.E1_PARCELA = SE5.E5_PARCELA"		
	cQry += " AND SE1.E1_TIPO    = SE5.E5_TIPO"  
	cQry += " AND SE1.E1_CLIENTE = SE5.E5_CLIFOR"		
	cQry += " AND SE1.E1_LOJA    = SE5.E5_LOJA"
	cQry += " AND SE5.E5_SITUACA <> 'C'"
	cQry += " AND SE5.E5_TIPODOC = 'BA'"  
	cQry += " AND SE5.E5_L_SEEK  = '" + _mv_par01 + _cEvAd + "'"
	cQry += " ORDER BY E1_FILIAL,E1_PREFIXO,E1_NUM,E1_PARCELA,E1_TIPO"
		
	TCQUERY cQry NEW ALIAS (_cArqTmp)
	dbSelectArea(_cArqTmp)  
	(_cArqTmp)->(DbGoTop())
	
	While (_cArqTmp)->(!Eof())
	
		dDataBase:= StoD((_cArqTmp)->E5_DATA)
		
		DbSelectArea("SE1")
		SE1->(DbSetOrder(1))
		//E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA                                                                                               
		If SE1->(dbSeek(xFilial("SE1") + (_cArqTmp)->E1_PREFIXO + (_cArqTmp)->E1_NUM + (_cArqTmp)->E1_PARCELA + (_cArqTmp)->E1_TIPO + cFornece + (_cArqTmp)->E1_LOJA))
			/*
			_aTitulo := {{"E1_PREFIXO",(_cArqTmp)->E2_PREFIXO					,Nil},;
			{"E2_NUM"	    	,(_cArqTmp)->E2_NUM	     				   		,Nil},;
			{"E2_PARCELA"   	,(_cArqTmp)->E2_PARCELA  						,Nil},;
			{"E2_TIPO"	    	,(_cArqTmp)->E2_TIPO     						,Nil},;
			{"E2_FORNECE"   	,cFornece           							,Nil},;
			{"E2_LOJA"	    	,(_cArqTmp)->E2_LOJA     						,Nil},;
			{"AUTJUROS"			,0				        						,Nil},;
			{"AUTDESCONT"		,0		 		        						,Nil},;
			{"AUTMOTBX"			,(_cArqTmp)->E5_MOTBX    						,Nil},;
			{"AUTDTBAIXA"		,(_cArqTmp)->E5_DATA	    					,Nil},;
			{"AUTDTCREDITO"		,(_cArqTmp)->E5_DATA    						,Nil},;
			{"AUTHIST"	   		,"Cancto Bx - " + cFornece + (_cArqTmp)->E2_LOJA	,Nil},;
			{"AUTVLRPG"			,(_cArqTmp)->E5_VALOR							,Nil},;
			{"AUTVALREC"		,(_cArqTmp)->E5_VALOR							,Nil}}
	
			nModulo := 6
			cModulo := "FIN"
			
			//� Busca o numero da Baixa.                                      
			_nBaixa := NroSeq((_cArqTmp)->E2_PREFIXO,(_cArqTmp)->E2_NUM,(_cArqTmp)->E2_PARCELA,(_cArqTmp)->E2_TIPO,cFornece,(_cArqTmp)->E2_LOJA,(_cArqTmp)->E5_SEQ)
			
		 	Pergunte("FIN080",.F.)//Chama os parametros da rotina para nao gerar erro	
			
			
			MSExecAuto( {|x,y,z,k| Fina080(x,y,z,k)},_aTitulo,5,.F.,_nBaixa)
	        */
	        
	        aBaixa := {{"E1_PREFIXO"  ,(_cArqTmp)->E1_PREFIXO ,Nil    },;
           {"E1_NUM"      ,(_cArqTmp)->E1_NUM    ,Nil    },;
           {"E1_TIPO"     ,(_cArqTmp)->E1_TIPO   ,Nil    },;
           {"AUTMOTBX"    ,(_cArqTmp)->E5_MOTBX  ,Nil    },;
           {"AUTBANCO"    ,"	"                 ,Nil    },;
           {"AUTAGENCIA"  ,"	"                 ,Nil    },;
           {"AUTCONTA"    ,"	"	              ,Nil    },;
           {"AUTDTBAIXA"  ,(_cArqTmp)->E5_DATA   ,Nil    },;
           {"AUTDTCREDITO",(_cArqTmp)->E5_DATA   ,Nil    },;
           {"AUTHIST"     ,"Cancto Bx - " + cFornece + (_cArqTmp)->E1_LOJA,Nil    },;
           {"AUTJUROS"    ,0                      ,Nil	  },;
           {"AUTVALREC"   ,(_cArqTmp)->E5_VALOR   ,Nil   }}
            
            nModulo := 6
			cModulo := "FIN"
			
			//� Busca o numero da Baixa.                                      
			//_nBaixa := NroSeq((_cArqTmp)->E1_PREFIXO,(_cArqTmp)->E1_NUM,(_cArqTmp)->E1_PARCELA,(_cArqTmp)->E1_TIPO,cFornece,(_cArqTmp)->E1_LOJA,(_cArqTmp)->E5_SEQ)
			
 		    Pergunte("FIN070",.F.)//Chama os parametros da rotina para nao gerar erro	
 			
			MSExecAuto({|x,y| Fina070(x,y)},aBaixa,6)  
 
			Pergunte(_cPerg,.F.)//Chama os parametros da rotina para nao gerar erro	

			nModulo := nModAnt
			cModulo := cModAnt
			
			//��������������������������������������������������������������Ŀ
			//� Verifica se houve erro no SigaAuto, caso haja mostra o erro. �
			//����������������������������������������������������������������
			If lMsErroAuto
				xMagHelpFis("NAO CONFORMIDADE 06 - SIGAAUTO BAIXA TITULO",;
							"Existe uma n�o conformidade no SigaAuto de Baixa de Contas a Receber!",;
							xFilial("SE2")+(_cArqTmp)->E1_PREFIXO+(_cArqTmp)->E1_NUM+;
							(_cArqTmp)->E1_PARCELA+(_cArqTmp)->E1_TIPO+cFornece+(_cArqTmp)->E1_LOJA+;
							"     <-  Copie essas informa��es para voce pesquisar no Contas a Receber o titulo que esta com n�o conformidade. "+;
							"Ap�s confirmar esta tela, sera apresentada a tela de N�o Conformidade do SigaAuto.")
				MostraErro()
				Return .F.
				_lRetorno  := .F.
			Else			                              
			    /*
				_cUpdate := " UPDATE " + RetSqlName("SE2") 
				_cUpdate += " SET E2_DATALIB = ' '"
				_cUpdate += " WHERE D_E_L_E_T_ = ' '"
				_cUpdate += " AND E2_FILIAL    = '" + xFilial("SE2") + "'"
				_cUpdate += " AND E2_PREFIXO   = '" + (_cArqTmp)->E2_PREFIXO + "'"
				_cUpdate += " AND E2_NUM       = '" + (_cArqTmp)->E2_NUM     + "'"
				_cUpdate += " AND E2_PARCELA   = '" + (_cArqTmp)->E2_PARCELA + "'"
				_cUpdate += " AND E2_TIPO      = '" + (_cArqTmp)->E2_TIPO    + "'"
				_cUpdate += " AND E2_FORNECE   = '" + cFornece         	     + "'"
				_cUpdate += " AND E2_LOJA      = '" + (_cArqTmp)->E2_LOJA    + "'"
				
				lSqlOk := !(TCSqlExec(_cUpdate) < 0)
				
				If !lSqlOk
					xMagHelpFis("NAO CONFORMIDADE 07 - UPDATE SE2 - E2_DATALIB",;
					TcSqlError(),;
					"N�o Conformidade ao executar o Update de gravacao do cod. MIX no E2_DATALIB! "+;
					"N�o confirme esta mensagem e informe ao Suporte T�cnico.")
					Return .F.
				EndIf       
				*/
			EndIf  
			
		Else
			
			xMagHelpFis("ERRO 05 - NAO FOI ENCONTRADO TITULO",;
						"N�o foi o encontrado o t�tulo mencionado abaixo para realizar o cancelamento de sua baixa, favor comunicar ao departamento de inform�tica.",;
						"Filial: " + xFilial("SE1") + " - Prefixo: " + (_cArqTmp)->E1_PREFIXO + " - Tipo: " +  (_cArqTmp)->E1_TIPO + " - Numero: " + (_cArqTmp)->E1_NUM +;
						" - Parcela: " + (_cArqTmp)->E1_PARCELA + " - Fornecedor: " + cFornece + "/" + (_cArqTmp)->E1_LOJA)
			Return .F.
		
		EndIf
		
		(_cArqTmp)->(DbSkip())
		
	EndDo
	
	dDataBase:= _dDtBkpBas  
	
	RestArea(_aArea)
	
Return _lRetorno

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    � MGLT043C � Autor � Ramon Teles        � Data �  03/02/14   ���
�������������������������������������������������������������������������͹��
���Descri��o � Rotina de Exclusao dos Adiantamento.					      ���
���          � 											         		  ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function MGLT043C()

	Local _lRetorno		:= .T.
	Local _cQry
	Local _cArqTmp 		:= GetNextAlias()
	Local nModAnt 		:= nModulo
	Local cModAnt 		:= cModulo
	Local _dDtBkpBas  		:= dDataBase
	Local _aArea			:= GetArea()
	
	Local lSqlOk
	Local _cUpdate    
	
	Local _cData 	:= _mv_par01+"%"
	
	Local lMsErroAuto := .F.
	Local lMsHelpAuto := .T.
	
	BeginSql Alias _cArqTmp
	
		SELECT SE2.E2_FILIAL,SE2.E2_PREFIXO,SE2.E2_NUM,SE2.E2_PARCELA,SE2.E2_TIPO,SE2.E2_FORNECE,SE2.E2_LOJA
		FROM %Table:SE2% SE2 
		WHERE SE2.E2_L_EVENT = %Exp:_cEvAd%
		AND SE2.E2_PREFIXO = %Exp:_cPrefSE2% 
		AND SE2.E2_EMISSAO LIKE %Exp:_cData% 
		AND SE2.%NotDel%
			
	EndSql
	
	dbSelectArea(_cArqTmp)
	(_cArqTmp)->(dbGoTop())
	
	While !(_cArqTmp)->(Eof())
	
	
		dbSelectArea("SE2")
		SE2->(dbSetOrder(1))
		If SE2->(dbSeek(xFilial("SE2")+(_cArqTmp)->E2_PREFIXO+(_cArqTmp)->E2_NUM+(_cArqTmp)->E2_PARCELA+(_cArqTmp)->E2_TIPO+(_cArqTmp)->E2_FORNECE+(_cArqTmp)->E2_LOJA))
			
			aAutoSE2:={{"E2_PREFIXO"	,SE2->E2_PREFIXO		,Nil},;
			{"E2_NUM"    				,SE2->E2_NUM    		,Nil},;
			{"E2_TIPO"   				,SE2->E2_TIPO   		,Nil},;
			{"E2_PARCELA"				,SE2->E2_PARCELA		,Nil},;
			{"E2_NATUREZ"				,SE2->E2_NATUREZ		,Nil},;
			{"E2_FORNECE"				,SE2->E2_FORNECE   		,Nil},;	
			{"E2_LOJA"   				,SE2->E2_LOJA   		,Nil}}
			
			//� Altera o modulo para Financeiro, senao o SigaAuto nao executa.�
			nModulo := 6
			cModulo := "FIN"
			
		    Pergunte("FIN050",.F.)//Chama os parametros da rotina para nao gerar erro	
		    
			MSExecAuto({|x,y,z| Fina050(x,y,z)},aAutoSE2,.T.,5)
			
		    Pergunte(_cPerg,.F.)//Chama os parametros da rotina para nao gerar erro
		    			
			//� Restaura o modulo em uso. �
			nModulo := nModAnt
			cModulo := cModAnt
	
			If lMsErroAuto
	 			
				oObj:SaveLog("ERRO 07 - SIGAAUTO EXCLUSAO TITULO")
				xMagHelpFis("NAO CONFORMIDADE 09 - TITULO NAO EXCLUIDO",;
				"O titulo "+xFilial("SE2")+SE2->E2_PREFIXO+SE2->E2_NUM+SE2->E2_PARCELA+SE2->E2_TIPO+;
				" n�o foi excluido! Produtor: "+SE2->E2_FORNECE+"/"+SE2->E2_LOJA,;
				"Verifique no financeiro se este titulo ja foi baixado ou o motivo pelo qual n�o pode ser exclu�do."+;
				" Ao confimar esta tela, sera apresentada a tela do SigaAuto, que possui informa��es mais detalhadas.")
				Mostraerro()
				Return .F.
				
			EndIf			
			
		Else
		
			xMagHelpFis("NAO CONFORMIDADE 08 - TITULO NAO EXCLUIDO",;
			"O titulo "+xFilial("SE2")+(_cArqTmp)->E2_PREFIXO+(_cArqTmp)->E2_NUM+(_cArqTmp)->E2_PARCELA+(_cArqTmp)->E2_TIPO+;
			" n�o foi encontrado! Produtor: "+SE2->E2_FORNECE+"/"+SE2->E2_LOJA ,;
			"Verifique no financeiro se este titulo existe, pois o mesmo n�o foi encontrado.")
			Return .F.
			
		EndIf
		
		(_cArqTmp)->(dbSkip())
	EndDo

	dDataBase:= _dDtBkpBas  
	
	RestArea(_aArea)


Return _lRetorno

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    � MGLT043D � Autor � Ramon Teles        � Data �  03/02/14   ���
�������������������������������������������������������������������������͹��
���Descri��o � Rotina de Exclusao dos Adiantamento.					      ���
���          � 											         		  ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function MGLT043D()

	Local _lRetorno		:= .T.
	Local _cQry
	Local _cArqTmp 		:= GetNextAlias()
	Local nModAnt 		:= nModulo
	Local cModAnt 		:= cModulo
	Local _dDtBkpBas  		:= dDataBase
	Local _aArea			:= GetArea()
	
	Local lSqlOk
	Local _cUpdate    
	
	Local _cData 	:= _mv_par01+"%"
	
	Local lMsErroAuto := .F.
	Local lMsHelpAuto := .T.
	
	BeginSql Alias _cArqTmp
	
		SELECT SE1.E1_FILIAL,SE1.E1_PREFIXO,SE1.E1_NUM,SE1.E1_PARCELA,SE1.E1_TIPO,SE1.E1_CLIENTE,SE1.E1_LOJA
		FROM %Table:SE1% SE1 
		WHERE SE1.E1_L_EVENT = %Exp:_cEvAd%
		AND SE1.E1_PREFIXO = %Exp:_cPrefSE2% 
		AND SE1.E1_EMISSAO LIKE %Exp:_cData% 
		AND SE1.%NotDel%
			
	EndSql
	
	dbSelectArea(_cArqTmp)
	(_cArqTmp)->(dbGoTop())
	
	While !(_cArqTmp)->(Eof())  
		//ExcluSE1(cPREFIXO,cNUM,cPARCELA,cTIPO,cA2COD,cA2LOJA)
		_lRetorno:=	U_ExcluSE1((_cArqTmp)->E1_PREFIXO,(_cArqTmp)->E1_NUM,(_cArqTmp)->E1_PARCELA,(_cArqTmp)->E1_TIPO,(_cArqTmp)->E1_CLIENTE,(_cArqTmp)->E1_LOJA)  
		(_cArqTmp)->(dbSkip())
	EndDo

	dDataBase:= _dDtBkpBas  
	
	RestArea(_aArea)


Return _lRetorno


/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    � NroSeq     � Autor � Ramon Teles        � Data �  03/02/14   ���
�������������������������������������������������������������������������͹��
���Descri��o � Busca nro da baixa.    								���
���          � 											         ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

Static Function NroSeq(_cPrefixo,cNum,cParcela,cTipo,cFor,cLoja,_cSeq)
	
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
	Private nSaldo    := 0
	
	//����������������������������������������������������������������������Ŀ
	//�Procura pelas baixas deste titulo                                     �
	//������������������������������������������������������������������������
	//aBaixaSE5 := 
	/*
	SEL070BAIXA("VL /V2 /BA /RA /CP /LJ /NCC/",SE2->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_TIPO,@nTotAdto,;
				@lBaixaAbat,SE2->E1_CLIENTE,SE1->E1_LOJA,@lBxCec,.T.,@lNotBax,@nTotImpost,@lAglImp;
				,,,@nTotaIRPF,SE2->E2_IDENTEE) 
	*/			
	//aBaixaSE5 := 	Sel070Baixa( "VL /V2 /BA /RA /CP /LJ /"+MV_CRNEG,SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_TIPO,,,SE1->E1_CLIENTE,SE1->E1_LOJA,@nSaldo,,,)

	If Len(aBaixaSE5) > 0                           
	
		For _nPos := 1 to len(aBaixaSE5) 
					
			If aBaixaSE5[_nPos,09] == _cSeq 
			
				nRet:= _nPos
				exit
			
			EndIf    
			
		Next _nPos            
	
	EndIf

Return nRet


/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    � MGLT043R � Autor � Ramon Teles        � Data �  03/02/14   ���
�������������������������������������������������������������������������͹��
���Descri��o � Relatorio informacoes adiantamento.						  ���
���          � 											                  ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

Static Function MGLT043R(_aDados)

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
		oPrinter      := FWMSPrinter():New('Relat�rio Adiantamento',,.F.,,.F.)
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
	
	oPrinter:Say(100,80,"Adiantamento realizado para os Cooperados" ,oFont12N)
	
	For _nY := 1 to Len(_aDados)
	
		
		If _nLinha > 800
			oPrinter:EndPage()
			oPrinter:StartPage()
			oPrinter:Box(040,010,800,550)
			
			cText1 := "COOPERATIVA AGROPECUARIA DE ARAXA - CAPAL"
			oPrinter:SayBitmap(050,020,"\system\LGMID.png",060,033)
			oPrinter:Say(070,120,cText1,oFont16NS)
			
			oPrinter:Say(100,30,"Adiantamento realizado para os COOPERADOS" ,oFont12N)
			_nX := _nY
			
		EndIf
		
		_nLinha := 100+(15*(_nY-_nX))
	
		_cProd := Posicione("SA2",1,xFilial("SA2")+_aDados[_nY][1]+_aDados[_nY][2],"A2_NOME")
	
		oPrinter:Say(_nLinha,30,"Cooperado: "+_aDados[_nY][1]+" "+_aDados[_nY][2]+" - "+ _cProd ,oFont10)
		oPrinter:Say(_nLinha,430,picVal(Alltrim(Str((( _aDados[_nY][3] * (_nPorc/100) )* _nPrcLt )))),oFont10)
		//oPrinter:Say(_nLinha,430,picVal(Alltrim(Str(_aDados[_nY][3]))),oFont10)
		
	Next
	
	oPrinter:EndPage()
	
	If lPreview
		oPrinter:Preview()
	EndIf
	
	FreeObj(oPrinter)
	oPrinter := Nil

Return



/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �picVal    �Autor  �Ramon Teles M. Filho� Data �  03/02/14   ���
�������������������������������������������������������������������������͹��
���Desc.     � Funcao para retornar a picture correta de valores em       ���
���          � moeda (tratado como texto)                                 ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
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
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �CriaSX1   �Autor  �Ramon Teles M. Filho� Data �  03/02/14   ���
�������������������������������������������������������������������������͹��
���Desc.     � Cria Pergunta da Rotina.								      ���
���          �    							                              ���
�������������������������������������������������������������������������͹��
���Uso       � Programa Principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function CriaSX1()

	aHelpPor := {}
	aHelpEng := {}
	aHelpSpa := {}
	Aadd( aHelpPor, 'Ano e M�s do Adiantamento ao Produtor.')
	Aadd( aHelpSpa, 'Ano e M�s do Adiantamento ao Produtor.')
	Aadd( aHelpEng, 'Ano e M�s do Adiantamento ao Produtor.')
	U_xPutSx1(_cPerg,"01","M�s Adiantamento"		,"M�s Adiantamento"		,"M�s Adiantamento"		,"mv_ch1","C",06,0,1,"G","","","","","mv_par01","","","","","","","","","","","","","","","","",{},{},{})

Return
