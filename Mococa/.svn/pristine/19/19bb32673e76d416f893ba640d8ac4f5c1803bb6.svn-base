#include "protheus.ch" 

/*/{Protheus.doc} PE01NFESEFAZ
Ponto de entrada onde é  é possível realizar manipulações nos dados do produto, mensagens adicionais, destinatário, 
dados da nota, pedido de venda ou compra, antes da montagem do XML, no momento da transmissão da NFe.
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