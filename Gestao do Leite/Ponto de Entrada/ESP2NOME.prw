#INCLUDE "PROTHEUS.ch"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � ESP2NOME � Autor � TOTVS                 � Data da Criacao  � 22/12/2009                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Ponto de Entrada, para acesso ao ambiente personalizado Gest�o do Leite, da mesma forma que ocorre           ���
���          � para os modulos do protheus.                                                                                 ���
���          �                                                                                                              ���
���          � Criar um arquivo de menu dentro do system chamado SIGAGLT.XNU e outro SIGAESP2.XNU.                          ���
���          � SIGAESP2.XNU fica para acesso do Administrador.                                                              ���
���          � SIGAGLT.XNU fica para acesso dos usuarios do ambiente Gestao do Leite.                                       ���
���          �                                                                                                              ���
���          � Pode-se usar ESPNome() tambem, porem no Protheus10, esta tendo modulo com este nome no padrao.               ���
���          �                                                                                                              ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Criar um novo modulo no Protheus e adicionar o mesmo na lista de modulos ja existentes.                      ���
���			 �                                	                                   						                    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum.                                                                                                      ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nome do Modulo.                                                     						                    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   �                                                                                          					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite                                                                    				   			���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �          |                                                  �                                  �   	        ���
���			 �			|                              					   �                                  �   	        ���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
*/
User Function ESP2NOME()
Return("Gest�o do Leite")