#include "protheus.ch" 

/*/{Protheus.doc} MT410INC
Ponto de entrada executado ap�s a grava��o das informa��es.
@author TOTVS
@since 29/03/2017
@version P12
@param nulo            
@return nulo
/*/

User Function MT410INC(lAlt)

    Local aArea := GetArea()

    U_RFATE022(lAlt)

    RestArea(aArea)

Return
