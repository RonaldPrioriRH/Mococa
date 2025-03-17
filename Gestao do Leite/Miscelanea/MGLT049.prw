#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE  "RWMAKE.CH"
#INCLUDE "XMLXFUN.CH" 
#INCLUDE "APWIZARD.CH"
#INCLUDE "FILEIO.CH"
#INCLUDE "TOTVS.CH"   
#DEFINE _ENTER CHR(13)+CHR(10)

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �MGLT049   � Autor � Ramon Teles           � Data da Criacao  � 10/02/2014                				 	    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Importa chave das notas fiscais referentes aos valores a serem pagos aos produtores de Leite.	    	    ���
���			 �														                                   					    ���
���          � 															                               					    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Gestao do Leite                                                         			                            ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum.   					   							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum   															                                        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   �                                                                                          					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Logistica                                                                               					    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU?AO INICIAL                   					    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				             �Usuario(Filial+Matricula+Nome)    �Setor          ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �          �                    							   �                                  �             ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/

User Function MGLT049()

	Local oDlg
	Local bProcess  := {|oSelf| U_MGLT49A(oSelf)}
	Local oTProces
	
	Private cPerg	:= "MGLT049"
				
	U_xPutSx1Perg()   
	//MV_PAR01 Cliente
	
	Pergunte(cPerg,.F.)
	
	_cTexto := "  Este programa ira ler o conte�do de um arquivo texto, conforme"+_ENTER
	_cTexto += " os parametros definidos pelo usuario, e assim realizar a 	    "+_ENTER
	_cTexto += " importa��o das chaves das notas fiscais eletr�nicas referentes "+_ENTER
	_cTexto += " aos produtores de Leite da Capal.                              "										   
	
	//����������������������������������������������������������������������������������������������Ŀ
	//� Sintaxe da tNewProcess():New( cFunction, cTitle, bProcess, cDescription, cPerg, aInfoCustom) �
	//������������������������������������������������������������������������������������������������
	// CRIA TELA DE PROCESSAMENTO PADRAO DO SISTEMA.
	oTProces := tNewProcess():New("MGLT049","Importa��o Chave NFE",bProcess,_cTexto,cPerg)

Return

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun??o    � Import   � Autor � Ramon Teles        � Data �  10/02/14   ���
�������������������������������������������������������������������������͹��
���Descri??o � Funcao chamada pelo botao OK na tela inicial de processamen���
���          � to. Executa a leitura do arquivo texto.                    ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

User Function MGLT49A()
	//���������������������������������������������������������������������Ŀ
	//� Abertura do arquivo texto                                           �
	//�����������������������������������������������������������������������
	
	Private cArqTxt := Alltrim(MV_PAR01)
	
	Private nHdl    := FT_FUSE(cArqTxt)
	
	If nHdl == -1
	    MsgAlert("O arquivo de nome "+cArqTxt+" nao pode ser aberto! Verifique os parametros.","Atencao!")
	    Return
	Endif
	
	//���������������������������������������������������������������������Ŀ
	//� Inicializa a regua de processamento                                 �
	//�����������������������������������������������������������������������
	
	Processa({|| RunCont() },"Lendo Arquivo de Texto...")
	
Return
/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun??o    � RUNCONT  � Autor � Ramon Teles        � Data �  10/02/14   ���
�������������������������������������������������������������������������͹��
���Descri??o � Funcao auxiliar chamada pela Import.  A funcao Import      ���
���          � monta a janela com a regua de processamento.               ���
�������������������������������������������������������������������������͹��
���Uso       � Import			                                          ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function RunCont()

	Local _nRecno	:= 1
	Local _aReg		:= {}
	Local _aDados	:= {}
	
	//�������������������������Ŀ
	//� Array Log Inclusao      �
	//���������������������������
	Private _aLogNF		:= {}
	Private _cSerie	  	
		
	/* Estrutura do Arquivo
	1.COOPERATIVA DA NFE	1	3
	2.LINHA (PROPRIEDADE) 	4	5
	3.MATRICULA			6	9
	4.CNPJ/CPF			10	23
	5.INSCRICAO DE P.R.	24	36
	6.NRO NFE				37	42
	7.SERIE NFE			43	45
	8.DATA DE EMISSAO NFE	46	53
	9.NRO DA CHAVE ACESSO 	54	97                  	
	10.NRO PROTOCOLO		98	112
	*/
	
	FT_FGOTOP() 
	
	ProcRegua(FT_FLASTREC())
	
	While !FT_FEOF() 
		IncProc(_nRecno)
		cBuffer := FT_FREADLN()
			AADD(_aDados,{SubStr(cBuffer,1,3),SubStr(cBuffer,4,2),"P0"+SubStr(cBuffer,6,4),SubStr(cBuffer,10,14),SubStr(cBuffer,24,13),;
				SubStr(cBuffer,37,6),SubStr(cBuffer,43,3),SubStr(cBuffer,46,8),SubStr(cBuffer,54,44),SubStr(cBuffer,98,15)})
		FT_FSKIP()
		_nRecno++	
	Enddo
	
	BEGIN TRANSACTION
		
	ProcRegua(Len(_aDados))
	IF Len(_aDados) > 1
		
		IncProc("Importando Chave das NFEs...")
		
		//Percorre o Array que contem os dados do arquivo
		For nX:=1 to Len(_aDados)
			IncProc(nX)
			//Array Auxiliar com os dados da NFE 
			_aReg := _aDados[nX]
			
			If !ChaveNFE(_aReg)
			   	DisarmTransaction()
				xMagHelpFis("Importar Chave NFE","Erro no processamento da inclus�o chave da Nota Fiscal.","A atualiza��o da chave da Nota Fiscal n�o ser� executada.")
	    			Return			   
			EndIf
		Next
		
	Else
		MsgAlert("Nao h� dados a processar no arquivo informado")
	EndIF 
	
	END TRANSACTION
	
	MsgAlert("Chaves Importadas")//_aLogNF
	
Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � ChaveNFE � Autor � Ramon Teles           � Data da Criacao  � 10/02/2014               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Funcao usada para importar as chaves das NFEs dos produtores de Leite.                                       ���
���          �                  												                               				���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Implantacao das rotinas referente a Gestao do Leite.                						                    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� 														                                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                                                                                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite.                                                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU?AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �          �                               				   �                                  �   	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/

Static Function ChaveNFE(_aItens)
	
	Local aArea	  		:= GetArea()
	Local _lRetorno		:= .T.
	LOCAL _cLoja
	
	Private lMsErroAuto	:= .F.
	Private lMsHelpAuto	:= .T.	
	
	_cLoja		:= GetLjLin(_aItens[3],_aItens[2]) 
	
	_cNroNota 	:= _aItens[6]
	_cNroNota 	:= IIF(Len(_cNroNota)<9,"000" + _cNroNota,_cNroNota)
	
	_dData		:= STOD(SubString(_aItens[8],5,4)+SubString(_aItens[8],3,2)+SubString(_aItens[8],1,2))
	
	_cSerie		:= _aItens[7]
	
	_cChvNFE 	:= _aItens[9]
	
	DbSelectArea("SF1")
	SF1->(DbSetOrder(1))    

	ConOut(xFilial("SF1")+_cNroNota+_cSerie+_aItens[3]+_cLoja)
	
	If SF1->(DbSeek(xFilial("SF1")+_cNroNota+_cSerie+_aItens[3]+_cLoja))

		RecLock("SF1",.F.)

		SF1->F1_SERIE 	:= _cSerie
		SF1->F1_CHVNFE	:= _cChvNFE
		SF1->F1_EMINFE	:= _dData

		SF1->(MsUnLock())
		
		//SF3
		DbSelectArea("SF3")
		SF3->(DbSetOrder(4)) //F3_FILIAL+F3_CLIEFOR+F3_LOJA+F3_NFISCAL+F3_SERIE                                                                                                                 
		If SF3->(DbSeek(xFilial("SF3")+_aItens[3]+_cLoja+_cNroNota+_cSerie))
	
			RecLock("SF3",.F.)
	
			SF3->F3_CHVNFE	:= _cChvNFE
	
			SF3->(MsUnLock())
			
			//SFT
			DbSelectArea("SFT")
			SFT->(DbSetOrder(1)) //FT_FILIAL+FT_TIPOMOV+FT_SERIE+FT_NFISCAL+FT_CLIEFOR+FT_LOJA+FT_ITEM+FT_PRODUTO                                                                                                                                                                                               
			SFT->(DbSeek(xFilial("SFT")+"E"+_cSerie+_cNroNota+_aItens[3]+_cLoja))

			While 	xFilial("SFT") == SFT->FT_FILIAL .AND. SFT->FT_TIPOMOV == "E" .AND. SFT->FT_SERIE == _cSerie .AND. SFT->FT_NFISCAL == _cNroNota;
					.and.   SFT->FT_CLIEFOR == _aItens[3] .and. SFT->FT_LOJA == _cLoja
				
				RecLock("SFT",.F.)
		
				SFT->FT_CHVNFE	:= _cChvNFE
		
				SFT->(MsUnLock())
				
				SFT->(DBSKIP())
			
			EndDo
		
		Else
			xMagHelpFis("RecLock - SF3","N�o foi possivel encontrar a NFE "+_cNroNota+"-"+_cSerie+" no sistema.",;
				"Produtor :"+_aItens[3]+" - "+_cLoja)
			aadd(_aLogNF,{_cNroNota,_cSerie,_cChvNFE,_aItens[3],_aItens[2],"NOK"})	
//			_lRetorno 	:= .F.
		
		EndIf

		
		aadd(_aLogNF,{_cNroNota,_cSerie,_cChvNFE,_aItens[3],_aItens[2],"OK"})	
		
	Else
		xMagHelpFis("RecLock - SF1","N�o foi possivel encontrar a NFE "+_cNroNota+"-"+_cSerie+" no sistema.",;
					"Produtor :"+_aItens[3]+" - "+_cLoja)
		aadd(_aLogNF,{_cNroNota,_cSerie,_cChvNFE,_aItens[3],_aItens[2],"NOK"})	
//		_lRetorno 	:= .F.
	EndIf
	
	RestArea(aArea)

Return _lRetorno

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    � GetLjLin � Autor � Ramon Teles        � Data � 3/05/14     ���
�������������������������������������������������������������������������͹��
���Descri��o � Retorna loja a qual a linha participa.					  ���
���          � 											                  ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function GetLjLin(_cCODSA2,_cLinha)

	Local _aArea	:= GetArea()
	Local _cLoja 
	Local _cQuery

	_cQuery := " SELECT A2_COD,A2_LOJA,A2_L_LI_RO,A2_NOME " 
	_cQuery += " FROM "+RetSqlName("SA2")+" SA2  	"
	_cQuery += " WHERE " + RetSqlCond("SA2") + " 	"
	_cQuery += " AND SA2.A2_COD = '"+_cCODSA2+"' 	"
	_cQuery += " AND SA2.A2_C_LINHA LIKE '%"+_cLinha+"%' 	"
		
	If Select ("TRL") <> 0
		TRL->(dbCloseArea())
	EndIf
	
	_cQuery := changeQuery(_cQuery)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery),"TRA",.F.,.T.)
	
	TRA->(dbGoTop())
	
	If TRA->(!Eof())			

		_cLoja	:= TRA->A2_LOJA   

	ELSE

		_cLoja	:= ""
		 
	EndIf
	
	TRA->(dbCloseArea())
	
	RestArea(_aArea)

Return _cLoja

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �U_xPutSx1Perg� Autor � Ramon Teles           � Data da Criacao  � 31/01/2014                				 	    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Funcao auxiliar para criacao das perguntas.																    ���
���			 �														                                   					    ���
���          � 															                               					    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Criacao das Perguntas utilizando a funcao padrao U_xPutSx1.             			                            ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum.   					   							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum   															                                        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   �                                                                                          					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � 			                                                                               					    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU?AO INICIAL                   					    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �          �                    							   �                                  �             ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/
Static Function U_xPutSx1Perg()

	aHelpPor := {}
	aHelpEng := {}
	aHelpSpa := {}
	Aadd( aHelpPor, 'Arquivo de importa��o das Notas       ')
	Aadd( aHelpSpa, 'Arquivo de importa��o das Notas       ')
	Aadd( aHelpEng, 'Arquivo de importa��o das Notas       ')
	U_xPutSx1(cPerg,"01","Arquivo","Arquivo","Arquivo","mv_ch1","C",99,0,0,"G","","DIR","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	

Return     
	