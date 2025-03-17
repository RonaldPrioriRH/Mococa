#include "protheus.ch" 

/*/{Protheus.doc} MT410ALT
Ponto de entrada executado após a gravação das alterações.
@author TOTVS
@since 29/03/2017
@version P12
@param nulo            
@return nulo
/*/

/**********************/
User Function MT410ALT()
/**********************/

Local aArea := GetArea()

U_RFATE021()

U_RFATE022()
	
RestArea(aArea)

Return