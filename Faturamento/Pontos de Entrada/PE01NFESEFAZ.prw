#include "protheus.ch" 

/*/{Protheus.doc} PE01NFESEFAZ
Ponto de entrada onde �  � poss�vel realizar manipula��es nos dados do produto, mensagens adicionais, destinat�rio, 
dados da nota, pedido de venda ou compra, antes da montagem do XML, no momento da transmiss�o da NFe.
@author TOTVS
@since 29/03/2017
@version P12
@param nulo            
@return nulo
/*/

/***************************/
User Function PE01NFESEFAZ()
	/***************************/

	Local aArea 	:= GetArea()
	Local aRetorno	:= {}

	aRetorno := U_RFATE025()

	aRetorno := U_PGLT001(aRetorno)

	RestArea(aArea)

Return aRetorno