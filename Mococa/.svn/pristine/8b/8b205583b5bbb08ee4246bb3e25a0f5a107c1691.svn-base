#Include "Protheus.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³Cnab3      ºAutor  ³Tarcísio Silva MirandaºData³ 23/01/2018 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Conversão de parcela para alfanumerico, sifra.			  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Converte parcela para alfa.								  º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
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
		ElseIf AllTrim(cTipopag) ='30' //PAGAMENTO HONORÁRIOS                               
			cRetT := "00006"
		ElseIf AllTrim(cTipopag) ='01' .OR. AllTrim(cTipopag) ='41'  //Credito' em conta corretne                            
			cRetT := "00010"
		ElseIf AllTrim(cTipopag) ='98' //PAGAMENTO DIVERSOS                                  
			cRetT := "99999"	
		EndIf
			//Falta
		    /*cReT := 00001 //Pagamento de Impostos Tributos a Taxas
         	cReT := 00002 //Pagamento a Concessionárias Serviço Público
         	cReT := 00007 //Pagamento de aluguéis e taxas condomínios
         	cReT := 00008 //Pagamento de duplicatas e títulos
         	cReT := 00009 //Pagamento de mensalidade escolar
         	cReT := 00010 //Crédito em conta
         	cReT := 00101 //Pensão alimentícia
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
	    ElseIf AllTrim(cTipopag) ='20' .OR. AllTrim(cTipopag) ='30'  //PAGAMENTO FORNECEDORES 20  OU HONORÁRIOS 30                             
			cRetD := "07"
		ElseIf AllTrim(cTipopag) ='40' //PAGAMENTO FUNDOS DE INVESTIMENTOS                      
			cRetD := "08"
		ElseIf AllTrim(cTipopag) ='98' //PAGAMENTO DIVERSOS                                     
			cRetD := "99"
        //Falta
        	/*cRetD := 01 //Crédito em Conta Corrente
			cRetD := 02 //Pagamento de Aluguel / Condomínio
			cRetD := 03 //Pagamento de Duplicatas e Títulos
			cRetD := 05 //Pagamento de Mensalidades Escolares
			cRetD := 09 // Repasse de Arrecaçao / Pagamento de Tributos
			cRetD := 11 // DOC para Poupança
			cRetD := 12 // DOC para Depósito Judicial
			cRetD := 13 // Pensão Alimentícia
			*/
		EndIf
	EndIf
Return(cRetD)