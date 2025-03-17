#Include 'Protheus.ch'

/*/{Protheus.doc} DL200BRW

Características dos Campos da Carga. 
Após a criação do array com as características dos campos que aparecerão no browse 
de pedidos na montagem de carga. Os campos incluídos no array devem estar também 
incluídos conforme o ponto de entrada DL200TRB.

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function DL200BRW()
	
	Local aCpoBrw := ParamIXB
	Local aCpoBrw2:= {}
	Local a_Aux1 := {}
	Local a_Aux2 := {}
	Local n_i := 0
	
	For n_i := 1 to Len(aCpoBrw)
		If StrZero(n_i,2) $ '01,04,09,12,16,17,19'
			aadd(a_Aux1,aCpoBrw[n_i])
			if n_i = 19
				aAdd(a_Aux1,{"PED_OBSNF",,"Obs Nf-e"})
			EndIf
		Else
			aadd(a_Aux2,aCpoBrw[n_i])
		Endif 
	Next
	
	 aCpoBrw := {}
	
	For n_i := 1 to Len(a_Aux1)
		aadd(aCpoBrw,a_Aux1[n_i])
	Next
	
	For n_i := 1 to Len(a_Aux2)
		aadd(aCpoBrw,a_Aux2[n_i])
	Next
	
//	aAdd(aCpoBrw,{"PED_OBSNF",,"Obs Nf-e"})
	//tratamentos para faturamento triangular
	U_ROMSE007(@aCpoBrw)


//Corrigir odenação Release 12.1.27 Caique
    // troca a ordem do acols
	For n_i := 1 to Len(aCpoBrw)
		If n_i <= 4
			aadd(aCpoBrw2,aCpoBrw[n_i]) // Pedido-Nome-Peso-Municipio
		Endif 
	Next

	For n_i := 1 to Len(aCpoBrw)
		If n_i = 20						
			aadd(aCpoBrw2,aCpoBrw[n_i]) // Município
		Endif 
	Next	

	For n_i := 1 to Len(aCpoBrw)
		If n_i = 6					
			aadd(aCpoBrw2,aCpoBrw[n_i]) // Estado
		Endif 
	Next		

	For n_i := 1 to Len(aCpoBrw)
		If n_i = 26					
			aadd(aCpoBrw2,aCpoBrw[n_i]) // Prev.Fat
		Endif 
	Next	

	For n_i := 1 to Len(aCpoBrw)
		If n_i = 8					
			aadd(aCpoBrw2,aCpoBrw[n_i]) // Obs Nf-e
		Endif 
	Next
	
	For n_i := 1 to Len(aCpoBrw)
		If n_i = 7					
			aadd(aCpoBrw2,aCpoBrw[n_i]) // Bairro
		Endif 
	Next

	For n_i := 1 to Len(aCpoBrw)
		If n_i = 22				
			aadd(aCpoBrw2,aCpoBrw[n_i]) // Endereço
		Endif 
	Next		

	For n_i := 1 to Len(aCpoBrw)
		If n_i >= 9 .and. n_i <= 13
			aadd(aCpoBrw2,aCpoBrw[n_i]) //Rota-Entrega-Item-SeqLibera-Cliente
		Endif 
	Next

	For n_i := 1 to Len(aCpoBrw)
		If n_i >= 16 .and. n_i <= 17
			aadd(aCpoBrw2,aCpoBrw[n_i]) //Volume-Carga
		Endif 
	Next

	For n_i := 1 to Len(aCpoBrw)
		If n_i >= 14 .and. n_i <= 15
			aadd(aCpoBrw2,aCpoBrw[n_i]) //Loja-Valor
		Endif 
	Next

	For n_i := 1 to Len(aCpoBrw)
		If n_i = 18				
			aadd(aCpoBrw2,aCpoBrw[n_i]) //Quantidade
		Endif 
	Next

	For n_i := 1 to Len(aCpoBrw)
		If n_i = 21				
			aadd(aCpoBrw2,aCpoBrw[n_i]) //CEP
		Endif 
	Next

	For n_i := 1 to Len(aCpoBrw)
		If n_i >= 23 .and. n_i <= 25
			aadd(aCpoBrw2,aCpoBrw[n_i]) //Fil.Estoq-Fil.Interm-Ped.SGAC
		Endif 
	Next
			
/*
	//Release 12.1.25
	For n_i := 1 to Len(aCpoBrw)
		If n_i <= 5
			aadd(aCpoBrw2,aCpoBrw[n_i])
		Endif 
	Next

	For n_i := 1 to Len(aCpoBrw)
		If n_i = 19
			aadd(aCpoBrw2,aCpoBrw[n_i])
		Endif 
	Next

	For n_i := 1 to Len(aCpoBrw)
		if n_i = 24
			aadd(aCpoBrw2,aCpoBrw[n_i])
		Endif 
	Next

	For n_i := 1 to Len(aCpoBrw)
		If n_i = 8
			aadd(aCpoBrw2,aCpoBrw[n_i])
		Endif 
	Next

	For n_i := 1 to Len(aCpoBrw)
		If n_i >= 6 .and. n_i <= 7
			aadd(aCpoBrw2,aCpoBrw[n_i])
		Endif 
	Next

	For n_i := 1 to Len(aCpoBrw)
		If n_i >= 9 .and. n_i <= 13
			aadd(aCpoBrw2,aCpoBrw[n_i])
		Endif 
	Next

	For n_i := 1 to Len(aCpoBrw)
		If n_i = 16
			aadd(aCpoBrw2,aCpoBrw[n_i])
		Endif 
	Next

	For n_i := 1 to Len(aCpoBrw)
		If n_i = 17
			aadd(aCpoBrw2,aCpoBrw[n_i])
		Endif 
	Next

	For n_i := 1 to Len(aCpoBrw)
		If n_i >= 14 .and. n_i <= 15
			aadd(aCpoBrw2,aCpoBrw[n_i])
		Endif 
	Next                                      

	For n_i := 1 to Len(aCpoBrw)
		If n_i = 18
			aadd(aCpoBrw2,aCpoBrw[n_i])
		Endif 
	Next

	For n_i := 1 to Len(aCpoBrw)
		If n_i >= 20 .and. n_i <= 23
			aadd(aCpoBrw2,aCpoBrw[n_i])
		Endif 
	Next 
*/

Return aCpoBrw2
