#Include 'Protheus.ch'

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MTALCALT   �Autor  �Tarc�sio Silva Miranda�Data� 15/11/2017 ���
�������������������������������������������������������������������������͹��
���Desc.     �Ponto de Entrada utilizado para altera��o da tabela SCR,    ���
���          � (Documentos com al�ada) ap�s opera��o de inclus�o. 		  ���
�������������������������������������������������������������������������͹��
���Uso       � 	Amarra na Scr o CEntro de custo, 						  ���
Utilizado para gravar o Centro de custo na Scr. C7_XCC    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function MTALCALT() 

	Local aArea 	:= GetArea()
	Local aAreaDBL	:= DBL->(GetArea())
	Local aAreaSCR  := SCR->(GetArea())

	DBL->(DbSelectArea("DBL"))
	DBL->(DbSetOrder(1))
	DBL->(DbGotop())

	if DBL->(DbSeek(SCR->CR_FILIAL+SCR->CR_GRUPO+SCR->CR_ITGRP))//Posso fazer as condi��es se n�o bater eu seto cr_dtlib

		SCR->(RecLock("SCR", .F.))

		SCR->CR_XCC := DBL->DBL_CC

		SCR->(MsUnlock()) 

	endif

	RestArea(aAreaSCR)
	RestArea(aAreaDBL)
	RestArea(aArea)

Return()