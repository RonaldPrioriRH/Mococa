#Include 'Protheus.ch'
#Include 'TopConn.ch'

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  TMKGRAVA     �Autor  �Raphael Martins   � Data �  29/03/17   ���
�������������������������������������������������������������������������͹��
���Desc.     � Ponto de Entrada na gravacao do Atendimento TMK 			   ��
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
User Function TMKGRAVA(dRetorno,cAtendimento,aCampos,nOpc)


Local aArea		:= GetArea()
Local aAreaQI2	:= QI2->( GetArea() )
Local aAreaSUD	:= SUD->( GetArea() )

SU7->( DbSetOrder(4) ) //U7_FILIAL + U7_CODUSU

//altero a FNC em caso de inclusao ou alteracao
If ( nOpc == 3 .Or. nOpc == 4 ) 
	
	//gravo informacoes complementares na FNC gerada
	If FindFunction("U_RTMKE005")
		U_RTMKE005(cAtendimento)
	EndIf
	
EndIf

RestArea(aArea)
RestArea(aAreaQI2)
RestArea(aAreaSUD)

Return()


