#include 'protheus.ch'
#include 'parmtype.ch'


/*/{Protheus.doc} MT450QRY
//Ponto de entrada para mudar query de libera�ao automatica credito/estoque
//Feito tratamento para n�o liberar pedido que tenha SC9 com carga, pois o padr�o refaz e exclui a carga
//A libera��o ser� pela rotina de faturamento triangular

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
