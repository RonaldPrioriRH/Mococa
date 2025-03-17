#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH" 
#include "topconn.ch"


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � RTMKE008 � Autor � Raphael Martins     � Data� 21/07/2017  ���
�������������������������������������������������������������������������͹��
���Desc.     � Rotina para realizar a formacao do protocolo do atendimento ���
�������������������������������������������������������������������������͹��
���Uso       � Mococa / TeleMarketing                                     ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
User Function RTMKE008()

Local aArea			:= GetArea()
Local cProtocolo	:= ""
Local cHoraAt		:= SubStr(Time(),1,5)

/////////////////////////////////////////////////////////////////
///////////// PROTOCOLO DE ATENDIMENTO TMK 	////////////////////
/////// ANO + M�S + DATA + HORA + CODIGO DO ATENDIMENTO ////////
///////////////////////////////////////////////////////////////

cProtocolo	:= DTOS(dDataBase) 
cProtocolo	+= SubStr( cHoraAt , 1 ,  2 ) + SubStr( cHoraAt , 4 ,  2 )
cProtocolo	+= M->UC_CODIGO

RestArea(aArea)

Return( cProtocolo )
