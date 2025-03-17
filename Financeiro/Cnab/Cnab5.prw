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

USER FUNCTION CNAB5()
	Local cModel    := SEA->EA_MODELO	
    Local cTipopag  := SEA->EA_TIPOPAG
    Local cRet :=" "
  
    
    IF AllTrim(cModel) $ ('41/43/01') .And. !empty(AllTrim(cTipopag)) 
     cRet:= cnab() + space(2)
    else
     cRet:= space(5) + Cnab2()
    endif
return(cRet)


STATIC Function Cnab()

	Local cModel    := SEA->EA_MODELO
	Local cTipopag  := SEA->EA_TIPOPAG
	Local cRetT :=" "
	
	//Modelo TED
	If AllTrim(cModel) $ ('41/43/01') .And. !empty(AllTrim(cTipopag)) 
		If AllTrim(cTipopag) ='10' //PAGA.MENTO DIVIDENDOS 
		 	cRetT := "00003"
		ElseIf AllTrim(cTipopag) ='20' //PAGAMENTO FORNECEDORES                                 
			cRetT := "00005"
		ElseIf AllTrim(cTipopag) ='30' //PAGAMENTO HONOR�RIOS                               
			cRetT := "00006"
		ElseIf AllTrim(cTipopag) ='01' .OR. AllTrim(cTipopag) ='41'  //Credito' em conta corretne                            
			cRetT := "00010"
		ElseIf AllTrim(cTipopag) ='98' //PAGAMENTO DIVERSOS                                  
			cRetT := "99999"	
		EndIf
			//Falta
		    /*cReT := 00001 //Pagamento de Impostos Tributos a Taxas
         	cReT := 00002 //Pagamento a Concession�rias Servi�o P�blico
         	cReT := 00007 //Pagamento de alugu�is e taxas condom�nios
         	cReT := 00008 //Pagamento de duplicatas e t�tulos
         	cReT := 00009 //Pagamento de mensalidade escolar
         	cReT := 00010 //Cr�dito em conta
         	cReT := 00101 //Pens�o aliment�cia
         	*/	
  Endif 
 return(cRetT)
 
STATIC Function Cnab2()

	Local cModel    := SEA->EA_MODELO
	Local cTipopag  := SEA->EA_TIPOPAG
	Local cRetD:=" "
	 
	//Modelo DOC	
	If AllTrim(cModel) $ ('03') .And. !empty(AllTrim(cTipopag))
		If AllTrim(cTipopag) ='10' //PAGAMENTO DIVIDENDOS                                   
			cRetD := "04"
	    ElseIf AllTrim(cTipopag) ='20' .OR. AllTrim(cTipopag) ='30'  //PAGAMENTO FORNECEDORES 20  OU HONOR�RIOS 30                             
			cRetD := "07"
		ElseIf AllTrim(cTipopag) ='40' //PAGAMENTO FUNDOS DE INVESTIMENTOS                      
			cRetD := "08"
		ElseIf AllTrim(cTipopag) ='98' //PAGAMENTO DIVERSOS                                     
			cRetD := "99"
        //Falta
        	/*cRetD := 01 //Cr�dito em Conta Corrente
			cRetD := 02 //Pagamento de Aluguel / Condom�nio
			cRetD := 03 //Pagamento de Duplicatas e T�tulos
			cRetD := 05 //Pagamento de Mensalidades Escolares
			cRetD := 09 // Repasse de Arreca�ao / Pagamento de Tributos
			cRetD := 11 // DOC para Poupan�a
			cRetD := 12 // DOC para Dep�sito Judicial
			cRetD := 13 // Pens�o Aliment�cia
			*/
		EndIf
	EndIf
Return(cRetD)