#INCLUDE "rwmake.ch"
#include "PROTHEUS.CH"
/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � MT110LOK � Autor � Claudio Ferreira   � Data �  20/04/17   ���
�������������������������������������������������������������������������͹��
���Descricao � Ponto de Entrada para validar a linha                      ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � MOCOCA                                                     ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
User Function MT110LOK()
//-- Valida a gravacao dos lancamentos do SIGAPCO pelo ponto personalizado
lRet:=U_RPCOE009()
Return lRet       

