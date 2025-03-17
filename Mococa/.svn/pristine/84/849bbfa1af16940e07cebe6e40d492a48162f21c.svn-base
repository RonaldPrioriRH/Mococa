#include "protheus.ch"

/*/{Protheus.doc} MA410DEL
Ponto de entrada executado antes de deletar registro no SC5.
@author TOTVS
@since 29/03/2017
@version P12
@param nulo            
@return nulo
/*/

/**********************/
User Function MA410DEL()
/**********************/

	Local aArea := GetArea()

	//Contratos
	U_RFATE008()

	//Faturamento Triangular: Exclui vinculo entre os pedidos/carga
	U_RFATE029()

	RestArea(aArea)

Return