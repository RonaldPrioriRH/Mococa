#include "rwmake.ch"
#include "TbiConn.ch"
#include "TbiCode.ch"
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �WFW120P   �Autor  �Sangelles           � Data �  27/01/2013 ���
�������������������������������������������������������������������������͹��
���Desc.     �Ponto de entrada para envio de Workflow na apos confirmacao ���
���          �da Pedido de Compra			                              ���
�������������������������������������������������������������������������͹��
���Uso       � Acelerador Totvs Goias                                     ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���	Dados Adicionais de Alteracao/Ajustes do Fonte                        ���
�������������������������������������������������������������������������ͻ��
���Data      � Descricao:                                                 ���
�������������������������������������������������������������������������͹��
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �WFW120P   �Autor  �Sangelles Moraes    � Data �  27/03/2013 ���
�������������������������������������������������������������������������͹��
���Desc.     �Ponto de entrada para envio de Workflow na apos confirmacao ���
���          � do pedido de Compra                                    ���
�������������������������������������������������������������������������͹��
���Uso       � celerador Totvs Goias                                     ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

user function WFW120P( nOpcao, oProcess )

	Local aArea  	  := GetArea()
	Local aAreaSCR    := SCR->(GetArea())
	Local aAreaSC7	  := SC7->(GetArea())
	Local aAreaDBM	  := DBM->(GetArea())

	If IsBlind()  //Caso seja Workflow ou ExecAuto.
		ConOut("************Retorno Workflow******************")
		U_ACOMP003(nOpcao, oProcess) //chamada do Acelerador Totvs (Fonte exclusivo TOTVS Goi�s)
	Else

		U_RCOME011() //Vincula aprovador na sc7.
		U_RCOME010()//Libera itens da c7 e da cr 
		U_ACOMP003(nOpcao, oProcess) //chamada do Acelerador Totvs (Fonte exclusivo TOTVS Goi�s)

	EndIf
	RestArea(aArea)
	RestArea(aAreaSCR)
	RestArea(aAreaSC7)
	RestArea(aAreaDBM)
	
Return(.T.) 