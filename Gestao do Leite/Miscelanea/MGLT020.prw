#INCLUDE "PROTHEUS.ch"
#INCLUDE "RWMAKE.ch"

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � MGLT020  � Autor � TOTVS TM              � Data da Criacao  � 00/00/0000                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Baixa titulo no SE1 e cria titulo do tipo NDF no contas a pagar.                                             ���
���          �                        									                               				        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Usado nos pontos de entrada SF246I ou M460FIM, e LJFIMGRV.                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� nRecSE1: Numero do Recno do SE1                                                      						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � _lRet - .T. - Nao encontrou nenhum problema na execucao da transferencia do convenio.   						���
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

User Function MGLT020(nRecSE1)

Local aArea   		:= getArea()

Local _nModAnt 		:= nModulo
Local _cModAnt 		:= cModulo
Local _cFilBkp 		:= cFilAnt  


Local _aArea    	:= {}
Local _aAlias   	:= {}     

Local _lRet 		:= .T.
            
/*
//������������������������������������������������������������������������������������������Ŀ
//�Armazena os dados do titulo gerado na SE1 para posterior uso na baixa e na geracao da SE2.�
//��������������������������������������������������������������������������������������������
*/
Private _cPrefixo	:= SE1->E1_PREFIXO 
Private _cNumTit 	:= SE1->E1_NUM  
Private _cParcela	:= SE1->E1_PARCELA  
Private _cTipo   	:= SE1->E1_TIPO
Private _cCliente	:= SE1->E1_CLIENTE
Private _cLoja   	:= SE1->E1_LOJA     
Private _dEmissao   := SE1->E1_EMISSAO
Private _dVencto    := SE1->E1_VENCTO
Private _dVencRe    := SE1->E1_VENCREA
Private _nValor		:= SE1->E1_VALOR   
//Private _cCondPgto  := SE1->E1_C_COLIM
Private _nFilOrig	:= SE1->E1_FILORIG
Private _cHistorico := "CONV.INT."+SM0->M0_FILIAL
Private _cEveFil    := ALLTRIM(SuperGetMv("LT_CONVINT",.T.,""))


/*
//����������������������������������������������������������������������������������������Ŀ
//�Armaze a filial, prefixo,natureza, setor e linha que serao utilizados para gerar a SE2. �
//������������������������������������������������������������������������������������������
*/
Private _cFilAssoc  := ""
Private _cPrefSE2   := ""
Private _cNatureza  := ""        
Private _cLinha    := ""
Private _cSetor	:= ""
                       
/*
//����������������������������������������������������������������������������Ŀ
//�Armazena o numero da sequencia da baixa gerada que originara a SE2 corrente.�
//������������������������������������������������������������������������������
*/
Private _nNunSeq    := 0   

//����������������Ŀ
//�  Salva a area. �
//������������������
CtrlArea(1,@_aArea,@_aAlias,{"SE1","SE2"})

//���������������������������������������������������������������Ŀ
//� Altera o modulo para Financeiro, senao o SigaAuto nao executa.�
//�����������������������������������������������������������������
nModulo := 6
cModulo := "FIN"

/*
//������������������������������������������������������������������������Ŀ
//�Adicionado por Fabiano Dias da Silva para que fosse possivel            �
//�pegar a Filial que vai ser gerado o contas a pagar, ou seja, a filial   �
//�de fechamento do leite e o prefixo e a natureza que sera gerado         �
//�o contas a pagar, este prefixo sera de acordo com a filial do associado.�
//��������������������������������������������������������������������������
*/    
If !dadosSE2(_cCliente,_cLoja)
     
	Return .F.

EndIf
                       
//Inicia Transacao
//BEGIN TRANSACTION	
	/*
	//��������������������������������������������������������������������Ŀ
	//�Efetua baixa do contas a receber para depois gerar o contas a pagar.�
	//����������������������������������������������������������������������
	*/
	//If BaixaSE1(nRecSE1)           			              	    
	
	_lRet:= BaixaSE1(nRecSE1)
	
	If _lRet
	
		/*
		//���������������������������������������������������������������Ŀ
		//�Posiciona na filial em que deve ser gerado o contas a pagar do �
		//�Associado ou transportador.                                    �
		//�����������������������������������������������������������������
		*/
	    //cFilAnt:= _cFilAssoc  	    	 
	    	    		
		/*
		//����������������������������������Ŀ
		//�Inclui o titulo no contas a pagar.�
		//������������������������������������
		*/
				
		_lRet:= IncluiSE2()
		
		/* 
		If !IncluiSE2()
		
			DisarmTransaction()
		EndIf
		*/
	Else
		
		MsgAlert("Nao foi possivel baixar o ctas receber do Cooperado"+chr(13)+;
		" e gerar o ctas a Pagar(NDF) para acerto do leite! "+chr(13)+;
		"Favor comunicar ao departamento de inform�tica do problema encontrado!","Atencao")
		
		//DisarmTransaction()
		
	EndIf	
	
//Finaliza Transacao
//END TRANSACTION

//���������������������������Ŀ
//� Restaura o modulo em uso. �
//�����������������������������
nModulo := _nModAnt
cModulo := _cModAnt
	
cFilAnt := _cFilBkp

RestArea(aArea) 

//������������������Ŀ
//� Restaura a area. �
//��������������������
CtrlArea(2,_aArea,_aAlias)

Return _lRet

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �IncluiSE2 � Autor �Microsiga           � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Desc.     � Inclusao de Contas a Pagar, via SIGAAUTO.                  ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function IncluiSE2()

Local _aAutoSE2   := {}
Local lMsErroAuto := .F.
Local lRet        := .T.  

Local _cParcSE2   := ""     
//Local _cNumBxSE1  := StrZero(_nNunSeq,TamSX3("E2_L_NUMBX")[1])  

Local nVlTxPer 	  := 0 //GetMv("LT_TXPER ")//Se eh debito do produtor, grava valor da Taxa de Permanencia para cobrar juros.
Local cEntrg   	  := "" //Filial de entrega da linha do produtor
        
dbSelectArea("SE2")
dbSetOrder(1)   

_cParcela:= StrZero(Val(_cParcela),TamSX3("E2_PARCELA")[1])






/*
//��������������������������������������������������������������Ŀ
//�Realiza a busca do proximo codigo de parcela a ser considerado�
//�no proximo titulo a ser gerado, uma vez que um mesmo titulo na�
//�SE1 pode sofrer mais de uma baixa.                            �
//����������������������������������������������������������������
*/
_cParcSE2:= proxParc(_cCliente,_cLoja,_cNumTit,_cPrefSE2)

_aAutoSE2:={;
{"E2_PREFIXO",_cPrefSE2		   			,Nil},;
{"E2_NUM"    ,_cNumTit      			,Nil},;
{"E2_TIPO"   ,"NDF"          			,Nil},;
{"E2_PARCELA",_cParcSE2      			,Nil},;
{"E2_NATUREZ",_cNatureza	   			,Nil},;
{"E2_FORNECE",_cCliente      			,Nil},;
{"E2_LOJA"   ,_cLoja	      			,Nil},;
{"E2_EMISSAO",_dEmissao     			,Nil},;
{"E2_VENCTO" ,_dVencto       			,Nil},;
{"E2_VENCREA",_dVencto       		  	,Nil},; 
{"E2_HIST"   ,_cHistorico				,Nil},;
{"E2_VALOR"  ,_nValor            		,Nil},;
{"E2_PORCJUR",nVlTxPer          		,Nil},;
{"E2_DATALIB",date()            		,Nil},;
{"E2_USUALIB",ALLTRIM(cUserName)		,Nil},; 
{"E2_ORIGEM" ,"MGLT020"		   			,Nil},;   
{"E2_FILORIG" ,_nFilOrig	   			,Nil},;   
{"E2_L_LINRO",_cLinha		   			,Nil},;
{"E2_L_SETOR",_cSetor		   			,Nil},;
{"E2_L_EVENT",_cEveFil		   			,Nil},;
{"E2_L_PCSE1",_cParcela  	   			,Nil}}  //Numero da parcela do titulo da SE1 que originou este titulo na SE2



lMsErroAuto := .F.
lMsHelpAuto := .T.

MSExecAuto({|x,y| Fina050(x,y)},_aAutoSE2,3)

If lMsErroAuto
	lRet := .F.
	Mostraerro()
	DisarmTransaction()
EndIf

Return lRet

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � BaixaSE1 � Autor �Microsiga           � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Desc.     � Baixa de contas a Receber, via SIGAAUTO.                   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function BaixaSE1(_nRecSE1)

Local  _aBaixa     	:={}

Local _cBanco     	:= "   "
Local _cAgencia   	:= "     "
Local _cConta     	:= "           "

Local _lRet       	:= .T.
Local _cMotBaixa   	:= ALLTRIM(GETMV("LT_MOTBX"))  //Motivo de baixa utilizado somente nas rotinas de transferencia entre carteiras do Leite

Local _cSequenc   	:= ""           

Private lMsErroAuto := .F.
Private lMsHelpAuto := .T.  

dbSelectArea("SE1")
SE1->(dbGoto(_nRecSE1))

_aBaixa := {;
{"E1_FILIAL"   ,xFilial("SE1")				,Nil},;
{"E1_PREFIXO"  ,_cPrefixo 					,Nil},;
{"E1_NUM"	   ,_cNumTit    				,Nil},;
{"E1_PARCELA"  ,_cParcela					,Nil},;
{"E1_TIPO"	   ,_cTipo     					,Nil},;
{"AUTBANCO"    ,_cBanco         			,Nil},;
{"AUTAGENCIA"  ,_cAgencia   				,Nil},;
{"AUTCONTA"    ,_cConta         			,Nil},;
{"AUTMOTBX"	   ,_cMotBaixa       			,Nil},;//ACERTO LOJA - NAO GERA SE5
{"AUTDTBAIXA"  ,_dEmissao 					,Nil},;
{"AUTDTCREDITO",_dEmissao 					,Nil},;
{"AUTDESCONT"  ,0     	      				,Nil},;
{"AUTMULTA"    ,0          					,Nil},;
{"AUTJUROS"    ,0         					,Nil},;
{"AUTHIST"	   ,'BX. P/ ACERTO DO LEITE'	,Nil},;
{"AUTVALREC"   ,_nValor			   			,Nil}}    

MSExecAuto({|x,y| Fina070(x,y)},_aBaixa,3)

If lMsErroAuto
	_lRet := .F.
	Mostraerro()
EndIf                

/*
//���������������������������������������������������Ŀ
//�Busca o numero da ultima sequencia de baixa gerada.�
//�����������������������������������������������������
*/
_nNunSeq:= maxSeq(_cPrefixo,_cNumTit,_cParcela,_cTipo,_cCliente,_cLoja)   

If _nNunSeq <= 0
      
      xMagHelpFis("INFORMA��O",;
      			  "N�o foi poss�vel detectar a sequencia da baixa da SE1 que sera utilizada para gerar a parcela do t�tulo abaixo: " + _ENTER +;
      			  'Titulo/Parcela: ' + _cNumTit  + '/' + _cParcela + _ENTER +;
      			  'Cliente/Loja: '   + _cCliente + '/' + _cLoja + _ENTER +;
      			  'Prefixo/Tipo: '   + _cPrefixo + '/' + _cTipo + _ENTER +;
      			  "Desta forma o t�tulo informado anteriormente n�o ser� transferido para o contas a pagar.",;
      			  "Favor copiar esta mensagem e comunicar ao departamento de inform�tica do problema encontrado.")          
		
      Return .F.

EndIf     

_cSequenc:= StrZero(_nNunSeq,TamSX3("E5_SEQ")[1]) 

dbSelectArea("SE5")
//E5_FILIAL+E5_PREFIXO+E5_NUMERO+E5_PARCELA+E5_TIPO+E5_CLIFOR+E5_LOJA+E5_SEQ                                                                                      
SE5->(dbSetOrder(7))
If SE5->(dbSeek(xFilial("SE5") + _cPrefixo + _cNumTit + _cParcela + _cTipo + _cCliente + _cLoja + _cSequenc ))

     While !(SE5->(Eof())) .And. ;
     		SE5->E5_FILIAL == xFilial("SE5") .And. ;
     		SE5->E5_PREFIXO == _cPrefixo .And. ;
     		SE5->E5_NUMERO ==  _cNumTit .And. ;
     		SE5->E5_PARCELA == _cParcela .And. ;
     		SE5->E5_TIPO == _cTipo .And. ;  
     		SE5->E5_CLIFOR == _cCliente .And. ;
     		SE5->E5_LOJA == _cLoja .And. ;
     		SE5->E5_SEQ == _cSequenc 
     		
     		RecLock("SE5",.F.)
     		
     			SE5->E5_L_SEEK:= _cFilAssoc + _cPrefSE2 + _cNatureza
     		
			SE5->(MsUnLock())        
	
	SE5->(dbSkip())     		
    EndDo     
    
    Else
    		
    		xMagHelpFis("INFORMA��O",;
						"N�o foi poss�vel efetuar a atualiza��o dos dados da baixa da tabela SE5 do seguinte t�tulo abaixo: " + _ENTER +;
						'Titulo/Parcela: ' + _cNumTit  + '/' + _cParcela + _ENTER +;
      			  		'Cliente/Loja: '   + _cCliente + '/' + _cLoja + _ENTER +;
      			  		'Prefixo/Tipo: '   + _cPrefixo + '/' + _cTipo + _ENTER +;
      					"Desta forma o t�tulo informado anteriormente n�o ser� transferido para o contas a pagar.",;
      					"Favor copiar esta mensagem e comunicar ao departamento de inform�tica do problema encontrado.")   
    		Return .F.

EndIf

Return(_lRet)

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � dadosSE2 � Autor � FABIANO DIAS DA SILVA � Data da Criacao  � 19/12/2011                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao �Funcao para buscar os dados de:FILIAL do associado e PREFIXO e NATUREZA do evento relacionado a filial que se ���
���          � esta faturando para gerar o contas a pagar.				                               				        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � MGLT020																				                        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� _cCodAssoc - Codigo do Associado, _cLojAssoc - Codigo da loja do associado.             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � .T. - Dados encontrados  	  							                               						���
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

Static Function dadosSE2(_cCodAssoc,_cLojAssoc)

Local _aArea    := GetArea()

Local _lRet     := .T.  

Local _cAliasSA2:= GetNextAlias()   
Local _cAliasZL8:= "" 

Local _cBkfilial:= cFilAnt
                        
/*
//�������������������������������������������������������������������������Ŀ
//�Query para selecionar a linha a que se pertence o Associado,             �
//�os dois primeiros digitos indicam a filial a que se pertence o associado.�
//���������������������������������������������������������������������������
*/
querys(1,_cAliasSA2,_cCodAssoc,_cLojAssoc)

dbSelectARea(_cAliasSA2)
(_cAliasSA2)->(dbGoTop()) 

If !(_cAliasSA2)->(Eof())                                    	
	/*
	//��������������������������������������������������������������������������Ŀ
	//�Insere o setor e a linha a que se pertence o associados para incluir estes�
	//�dados no titulo que sera gerado no contas a pagar, para que o mesmo possa �
	//�ser abatido pelo rotina de fechamento.                                    �
	//����������������������������������������������������������������������������
	*/
	_cLinha:= (_cAliasSA2)->A2_L_LI_RO
	_cSetor:= (_cAliasSA2)->ZL2_COD
                                                           	
	/*
	//�����������������������������������������������������������������������Ŀ
	//�Os dois primeiros digitos da linha indicaram a filial a que se pertence�
	//�o associado, o cadastro de linha eh exclusivo e sempre os dois         �
	//�primeiros digitos indicaram a filal a que se pertence o associado.     �
	//�������������������������������������������������������������������������
	*/
//	_cFilAssoc:= "0101" + SubStr((_cAliasSA2)->A2_L_LI_RO,1,2) 
	                  
	/*
	//������������������������������������������������������������������������������Ŀ
	//�Muda-se para a filial do Associado para checar o cadastro de eventos			 �
	//�que hoje eh compartilhado mas se algum dia passar a ser exclusivo   			 �
	//�ja estara posicionado na filial correta do associado para comparacao na query.�
	//��������������������������������������������������������������������������������
	*/
//	cFilAnt   := _cFilAssoc    
	
	_cAliasZL8:= GetNextAlias()	
	querys(2,_cAliasZL8,"","",_cBkfilial)  
	
	dbSelectArea(_cAliasZL8)
	(_cAliasZL8)->(dbGoTop())
	
	If !(_cAliasZL8)->(Eof())
	    
	 	_cPrefSE2 := (_cAliasZL8)->ZL8_PREFIX
	 	
	 	If SubStr(_cCodAssoc,1,1) == 'C' //#TRATAR LETRA		 	                                 	 		
			/*
			//���������������������������������������������������������
			//�Natureza no cadastro de eventos referente ao ASSOCIADO.�
			//���������������������������������������������������������
			*/
	 		_cNatureza:=(_cAliasZL8)->ZL8_NATPRD   
	 		
	 		Else       
	 			/*
				//�������������������������������������������������������������
				//�Natureza no cadastro de eventos referente ao TRANSPORTADOR.�
				//�������������������������������������������������������������
				*/	 		
	 			_cNatureza:=(_cAliasZL8)->ZL8_NATFRT 
	 		
	 	EndIf	
		
		Else
		
			xMagHelpFis("INFORMA��O",;
						"N�o foi encontrado um evento de conv�nio de leite referente a filial que esta se realizando o faturamento, favor verificar se o evento ou prefixo n�o se encontram bloqueados em seu cadastro.",;
						"N�o foi gerado o contas a pagar para ser descontado na folha de pagamento do leite, favor comunicar ao departamento de inform�tica.")             
		
	    	_lRet := .F.
	
	EndIf    
	
	dbSelectArea(_cAliasZL8)
	(_cAliasZL8)->(dbCloseArea())

	Else                
	
		xMagHelpFis("INFORMA��O",;
					"Favor checar se os cadastros de linha e de setor ligados a linha que esta amarrada ao cadastro do associado: " + _cCodAssoc + '\'+ _cLojAssoc + ", para constatar se est�o corretos.",;
					"N�o foi gerado o contas a pagar para ser descontado na folha de pagamento do leite, favor comunicar ao departamento de inform�tica.")    
	
		_lRet := .F.

EndIf

dbSelectARea(_cAliasSA2)
(_cAliasSA2)->(dbCloseArea())

cFilAnt:= _cBkfilial    

restArea(_aArea)

Return _lRet
                     
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � querys   � Autor � TOTVS                 � Data da Criacao  � 19/12/2011                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Funcao para armazenar as querys utilizadas nesta rotina.														���
���          � 															                               				        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � MGLT020																				                        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� _nOpcao - Numero da query a ser executada																	���
���			 � _cAlias - Alias da query																						���
���			 � _cCodAssoc - Codigo do Associado																				���
���			 � _cLojAssoc - Loja do Associado																				���
���			 � _cFilFatur - Filial a que se esta realizando o faturamento da nota			           						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � 							 	  							                               						���
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

Static Function querys(_nOpcao,_cAlias,_cCodAssoc,_cLojAssoc,_cFilFatur,_cNumTit,_cPrefixo)

	Do Case
	       
		Case _nOpcao == 1		                         			
			/*
			//�������������������������������������������������������������������������Ŀ
			//�Query para selecionar a linha a que se pertence o Associado,             �
			//�os dois primeiros digitos indicam a filial a que se pertence o associado.�
			//���������������������������������������������������������������������������
			*/
			BeginSql alias _cAlias
				SELECT
				      SA2.A2_L_LI_RO,ZL2.ZL2_COD
				FROM
				      %Table:SA2% SA2
				      JOIN %Table:ZL3% ZL3 ON ZL3.ZL3_COD = SA2.A2_L_LI_RO
				      JOIN %Table:ZL2% ZL2 ON ZL2.ZL2_COD = ZL3.ZL3_SETOR
				WHERE
				      SA2.D_E_L_E_T_ = ' '
				      AND ZL3.D_E_L_E_T_ = ' '
				      AND ZL2.D_E_L_E_T_ = ' '
				      AND SA2.A2_MSBLQL = '2'
				      AND ZL3.ZL3_MSBLQL = '2'
				      AND ZL2.ZL2_MSBLQL = '2'
				      AND SA2.A2_COD = %Exp:_cCodAssoc%
				      AND SA2.A2_LOJA = %Exp:_cLojAssoc%  							 
	        EndSql 
	     
	    /*
		//��������������������������������������������������������������������������
		//�Query para selecionar o prefixo e a natureza do associado ou do fretista�
		//�isto para geracao do contas a pagar.                                    �
		//��������������������������������������������������������������������������
		*/
	     Case _nOpcao == 2
	              	       	        
	        BeginSql alias _cAlias
		        SELECT
				      ZL8.ZL8_PREFIX,ZL8.ZL8_NATPRD,ZL8.ZL8_NATFRT
				FROM
				      %Table:ZL8% ZL8      
				      JOIN %Table:ZL6% ZL6 ON ZL6.ZL6_COD = ZL8.ZL8_PREFIX
				WHERE
				      ZL8.D_E_L_E_T_ = ' '                 
				      AND ZL6.D_E_L_E_T_ = ' '  
				      AND ZL6.ZL6_MSBLQL = '2'
				      AND ZL8.ZL8_MSBLQL = '2'
				      AND ZL8.ZL8_FILIAL = %Exp:xFilial("ZL8")%
				      AND ZL6.ZL6_FILIAL = %Exp:xFilial("ZL6")%
				      AND ZL8.ZL8_COD = %Exp:_cEveFil%	        	        
//				      AND ZL8.ZL8_FILCON = %Exp:_cFilFatur%	        	        
	       EndSql   
	       
	   /*
		//��������������������������������������������������������������Ŀ
		//�Query para selecionar o maior codigo de parcela gerada para o �
		//�titulo a ser gerado na SE2.                                   �
		//����������������������������������������������������������������
		*/
	     Case _nOpcao == 3
	              	       	        
	        BeginSql alias _cAlias                 	                     			       
		        SELECT
				      NVL(MAX(E2_PARCELA),'0') MAXPARC
				FROM
				      %Table:SE2%
				WHERE
				      D_E_L_E_T_ = ' '
				      AND E2_FILIAL = %Exp:xFilial("SE2")% 
				      AND E2_TIPO = 'NDF'
				      AND E2_NUM = %Exp:_cNumTit%
				      AND E2_PREFIXO = %Exp:_cPrefixo%				      
				      AND E2_FORNECE = %Exp:_cCodAssoc%
				      AND E2_LOJA = %Exp:_cLojAssoc%	        	        
	        EndSql   
	        
    EndCase

Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � CtrlArea � Autor � Microsiga          � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Static Function auxiliar no GetArea e ResArea retornando   ���
���          � o ponteiro nos Aliases descritos na chamada da Funcao.     ���
���          � Exemplo:                                                   ���
���          � Local _aArea  := {} // Array que contera o GetArea         ���
���          � Local _aAlias := {} // Array que contera o                 ���
���          �                     // Alias(), IndexOrd(), Recno()        ���
���          �                                                            ���
���          � // Chama a Funcao como GetArea                             ���
���          � P_CtrlArea(1,@_aArea,@_aAlias,{"SL1","SL2","SL4"})         ���
���          �                                                            ���
���          � // Chama a Funcao como RestArea                            ���
���          � P_CtrlArea(2,_aArea,_aAlias)                               ���
�������������������������������������������������������������������������͹��
���Parametros� nTipo   = 1=GetArea / 2=RestArea                           ���
���          � _aArea  = Array passado por referencia que contera GetArea ���
���          � _aAlias = Array passado por referencia que contera         ���
���          �           {Alias(), IndexOrd(), Recno()}                   ���
���          � _aArqs  = Array com Aliases que se deseja Salvar o GetArea ���
�������������������������������������������������������������������������͹��
���Uso       � GENERICO                                                   ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function CtrlArea(_nTipo,_aArea,_aAlias,_aArqs)

Local _nN := 0

// Tipo 1 = GetArea()
If _nTipo == 1
	_aArea := GetArea()
	For _nN := 1 To Len(_aArqs)
		DbSelectArea(_aArqs[_nN])
		AAdd(_aAlias,{ _aArqs[_nN], IndexOrd(), Recno() })
	Next
	// Tipo 2 = RestArea()
Else
	For _nN := 1 To Len(_aAlias)
		DbSelectArea(_aAlias[_nN,1])
		DbSetOrder(_aAlias[_nN,2])
		DbGoto(_aAlias[_nN,3])
	Next
	RestArea(_aArea)
Endif

Return  

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �maxSeq    � Autor � Fabiano Dias          � Data da Criacao  � 12/01/2012                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao �Funcao usada para identificar a maior sequencia de baixa realiza isto para pegar a ultima sequencia de baixa  ���
���          �realizada que sera usada para gerar o numero da parcela do titulo no contas a pagar e depois para realizar 	���
���			 �o cancelamento especifico da baixa na SE1 poder idenficar o titulo na SE2 como somente referente a baixa que	���
���			 �esta sendo realizada no caso de um titulo que tenha mais de uma transferencia.						        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � MGLT031                         						                                                        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�_cPrefixo - Codigo do Prefixo na SE1																			���
���			 �_cNumTit	- Numero do titulo na SE1																			���
���			 �_cParcela - Numero do titulo na SE1																			���
���			 �_cTipo    - Tipo do titulo na SE1																				���
���			 �_cCliente - Codigo do cliente na SE1																			���
���			 �_cLoja    - Loja do cliente na SE1																		 	���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                                                                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite                                                                         						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �00/00/0000�                               				   �00-000000 -                       � TI	        ���
���--------- �----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/

Static Function maxSeq(_cPrefixo,_cNumTit,_cParcela,_cTipo,_cCliente,_cLoja)  
               
Local _nMaxSeq   := 0  

Local _K	     := 1  

Private aBaixaSE5:= {}		

/*
//���������������������������������������������������������Ŀ
//�Seleciona todas as baixas realizadas no titulo informado.�
//�����������������������������������������������������������
*/
Sel070Baixa( "VL /V2 /BA /RA /CP /LJ /"+MV_CRNEG,_cPrefixo,_cNumTit,_cParcela,_cTipo,,,_cCliente,_cLoja,,,,) 
/*
//���������������������������������������������Ŀ
//�Percorre todas as baixas realizadas do titulo�
//�����������������������������������������������
*/
For _K:=1 To Len(aBaixaSE5)   
		/*
		//������������������������������Ŀ
		//�Armazena a sequencia da baixa.�
		//��������������������������������
		*/
     	_nSequenc := Val(aBaixaSE5[_K,09])
     	
     	If _nMaxSeq < _nSequenc
     	 
     		_nMaxSeq:= _nSequenc
     	
     	EndIf
 
Next _K 
                      
Return _nMaxSeq           

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �proxParc  � Autor � Fabiano Dias          � Data da Criacao  � 13/01/2012                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao �Funcao usada para buscar o proximo codigo de parcela disponivel, uma vez que um mesmo numero de titulo +      ���
���          �parcela + prefixo + tipo + cliente + loja na SE1 podera sofrer mais de uma baixa, com isso para que nao haja 	���
���			 �problema na geracao da SE2 a loja dos titulo da SE2 sera considerada de forma incremental.					���
���			 �																										        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � MGLT031                         						                                                        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�_cPrefixo  - Codigo do Prefixo na SE1																			���
���			 �_cNumTit	 - Numero do titulo na SE1																			���
���			 �_cCodAssoc - Codigo do cliente na SE1																			���
���			 �_cLojAssoc - Loja do cliente na SE1																		 	���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                                                                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite                                                                         						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �00/00/0000�                               				   �00-000000 -                       � TI	        ���
���--------- �----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/                

Static Function proxParc(_cCodAssoc,_cLojAssoc,_cNumTit,_cPrefixo)      

Local _cAlias  := GetNextAlias()   

Local _cRetorno:= "" 

/*
//��������������������������������������������������������������Ŀ
//�Query para selecionar a maior parcela gerada					 �
//�na SE2 para o titulo.                                         �
//����������������������������������������������������������������
*/
querys(3,_cAlias,_cCodAssoc,_cLojAssoc,"",_cNumTit,_cPrefixo)

dbSelectArea(_cAlias)   
(_cAlias)->(dbGoTop())

_cRetorno:= Soma1((_cAlias)->MAXPARC)

dbSelectArea(_cAlias)   
(_cAlias)->(dbCloseArea())

While !MayIUseCode("Tr" + _cNumTit + xFilial("SE2") + _cRetorno)  //verifica se esta na memoria, sendo usado
		_cRetorno := Soma1(_cRetorno)						           // busca o proximo numero disponivel 
EndDo  

_cRetorno:= StrZero(Val(_cRetorno),TamSX3("E2_PARCELA")[1])

Return _cRetorno