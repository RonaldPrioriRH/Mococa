#include "protheus.ch"
#include "topconn.ch"
#include "rwmake.ch"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � UCFG001  � Autor � TOTVS                 � Data da Criacao  � 01/07/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao �   Retorno de Informacoes do Cadastro de Usuario.                                     						���
���          � 															                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �   Rotina generica que retorna informacoes do Cadastro de Usuario baseado nos parametros recebidos.           ���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� 1=Retorna FILIAL + MATRICULA do usuario                                               						���
���          � 2=Retorna o nome do usuario.                                                          						���
���			 � 																												���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Baseado no parametro recebido ele retorna certo tipo de informacao do Cadastro de Usuario.                   ���
���			 �														                                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   �															                             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Compras  	                                                                          						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������Ĺ��
���          �          �                    							   �                                  � 			���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/ 
User Function UCFG001(_nOpc)

Local _cInfo	:=	""
Local aUserTmp	:= 	PswRet(1)

If _nOpc == 1 
	//_cInfo	:=	SubStr(aUserTmp[1,22],3,8) //Matricula do usuario no RH
	_cInfo	:= __cUserId //aUserTmp[1,1] //Codigo do usuario no configurador
ElseIf _nOpc == 2 
    _cInfo	:= cUserName //aUserTmp[1,2]
Endif

Return(_cInfo)	