#include "protheus.ch" 

/*/{Protheus.doc} OM200CAR

Filtro dos Pedidos na Montagem da Carga.
Ponto de entrada depois das condições principais de filtro dos pedidos na montagem de carga utilizando Top Connect. 

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function OM200CAR()
	
	Local cQuery     	:= PARAMIXB[1]
	Default lrobocarga 	:= .f.
	//tratamentos para faturamento triangular

	cQuery := U_ROMSE002(cQuery)

	MemoWrite("C:\temp\OM200CAR.sql",cQuery) // 09/10/19 CIF/FOB como Combo Box
Return cQuery
