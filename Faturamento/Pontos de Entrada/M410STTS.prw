#include "protheus.ch" 

/*/{Protheus.doc} M410STTS
Ponto de entrada executado após todas as alterações no arquivo de pedidos terem sido feitas.
@author TOTVS
@since 29/03/2017
@version P12
@param nulo            
@return nulo
/*/

/**********************/
User Function M410STTS()
/**********************/

Local aArea := GetArea()

//Contratos
U_RFATE007()

RestArea(aArea)

Return