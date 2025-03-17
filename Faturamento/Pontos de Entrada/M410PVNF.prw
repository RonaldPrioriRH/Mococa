#Include "PROTHEUS.CH"
#INCLUDE "rwmake.ch"

/*
_____________________________________________________________________________
�����������������������������������������������������������������������������
��+-----------------------------------------------------------------------+��
���Programa  � M410PVNF     � Autor � TOTVS		      � Data � 02/10/2013 ���
��+----------+------------------------------------------------------------���
���Descri��o � Ponto de entrada valida��o antes de preparar doc. de sa�da ���
���          �                                                            ���
���          �                                                            ���
��+----------+------------------------------------------------------------���
���Uso       � Mococa		                                          	  ���
��+-----------------------------------------------------------------------+��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function M410PVNF()

	Local aArea	:= GetArea()
	Local lRet	:= .T.

	//Faturamento de pedido vinculado a carga, dever� ocorrer somente pela de rotina de doc saida - carga
	lRet := U_RFATE012()
	
	//Caso esteja vinculado a uma solicita��o de faturamento triangular, n�o permite faturar por aqui
	if lRet
		lRet := U_ROMSE011()
	Endif
	
	RestArea(aArea)

Return lRet

