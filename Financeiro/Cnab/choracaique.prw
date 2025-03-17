#Include "Protheus.ch"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �Cnab3      �Autor  �Tarc�sio Silva Miranda�Data� 23/01/2018 ���
�������������������������������������������������������������������������͹��
���Desc.     �Convers�o de parcela para alfanumerico, sifra.			  ���
�������������������������������������������������������������������������͹��
���Uso       � Converte parcela para alfa.								  ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

USER FUNCTION CNABc()

	Local cModel    := SEA->EA_MODELO
	Local cTipopag  := SEA->EA_TIPOPAG
	Local cRet :=" "
	
	//Modelo DOC 
	If AllTrim(cModel) $ ('41/43') .And. !empty(AllTrim(cTipopag)) 
	
		If AllTrim(cTipopag) ='10' //PAGA.MENTO DIVIDENDOS 
		 	cRet := "00003"
		ElseIf AllTrim(cTipopag) ='20' //PAGAMENTO FORNECEDORES                                 
			cRet := "00005"
		ElseIf AllTrim(cTipopag) ='30' //PAGAMENTO HONOR�RIOS                               
			cRet := "00006"
		ElseIf AllTrim(cTipopag) ='98' //PAGAMENTO DIVERSOS                                  
			cRet := "99999"	
	     endif
	Elseif AllTrim(cModel) $ ('03') .And. !empty(AllTrim(cTipopag))
	    
		If AllTrim(cTipopag) ='10' //PAGAMENTO DIVIDENDOS                                   
			cRet := "04"
		ElseIf AllTrim(cTipopag) ='20' .OR. AllTrim(cTipopag) ='30'  //PAGAMENTO FORNECEDORES 20  OU HONOR�RIOS 30                             
			cRet := "07"
		ElseIf AllTrim(cTipopag) ='40' //PAGAMENTO FUNDOS DE INVESTIMENTOS                      
			cRet := "08"
		ElseIf AllTrim(cTipopag) ='98' //PAGAMENTO DIVERSOS                                     
			cRet := "99"

		EndIf
	EndIf
Return(cRet)