#Include "Protheus.ch"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �Cnab4      �Autor  �Tarc�sio Silva Miranda�Data� 23/01/2018 ���
�������������������������������������������������������������������������͹��
���Desc.     �Convers�o de parcela para alfanumerico, sifra.			  ���
�������������������������������������������������������������������������͹��
���Uso       � Converte parcela para alfa.								  ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function Cnab4()

	Local cPrefixo 	:= SE1->E1_PREFIXO
	Local cNumero 	:= SE1->E1_NUM
	Local cParcela	:= SE1->E1_PARCELA
	Local cRet 		:= ""

	if empty(cParcela)

		cRet := cPrefixo+cNumero+"001"
		
	else
	
		cRet := cPrefixo+cNumero+cParcela
	
	endif
	
	
Return(AllTrim(cRet))




