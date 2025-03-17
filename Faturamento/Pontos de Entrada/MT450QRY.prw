#include 'protheus.ch'
#include 'parmtype.ch'


/*/{Protheus.doc} MT450QRY
//Ponto de entrada para mudar query de liberaçao automatica credito/estoque
//Feito tratamento para não liberar pedido que tenha SC9 com carga, pois o padrão refaz e exclui a carga
//A liberação será pela rotina de faturamento triangular

@author danilo
@since 16/01/2018
@version 1.0
@return Nil

@type function
/*/
User function MT450QRY()

	Local cQry := ParamIXB[1]
	Default lRoboCarga := .f.

	cQry += " AND C9_CARGA = ' ' "

Return cQry
