#INCLUDE 'PROTHEUS.CH'

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  TK271ROTM     �Autor  �Raphael Martins  � Data �  30/03/17   ���
�������������������������������������������������������������������������͹��
���Desc.     � Funcao para Acrescentar Acoes no aRotina da rotina         ���
���          � CallCenter                                                 ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function TK271ROTM()

Local cFolUsr	:= Posicione("SU7",4,XFILIAL("SU7")+ __cUserId,"U7_TIPOATE")  // Acesso usuario 2= Televendas, 3 = Telecobranca

If cFolUsr == '1'
	aadd(aRotina,{ "OS Sac Service","U_RTMKE002(SUC->UC_CODIGO)", 0 , 4})
EndIf


Return(aRotina)