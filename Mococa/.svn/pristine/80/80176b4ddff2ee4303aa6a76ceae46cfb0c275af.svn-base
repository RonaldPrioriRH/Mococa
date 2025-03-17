#include "protheus.ch"

/*/{Protheus.doc} MTA410
Ponto de entrada de validação da tela toda no Pedido de Venda.
@author TOTVS
@since 29/03/2017
@version P12
@param nulo            
@return nulo
/*/

/*********************/
User Function MTA410()
	/*********************/

	Local aArea := GetArea()
	Local lRet


	lRet := U_RFATE023()

	if lRet
		lRet := U_RFATE043() //obriga digitação da transportadora PV para algumas situações (Transferência/Galvani)
	endif

	if lRet
		lRet := U_RFATE028() //valida alteração de pedido da FE e FI (faturamento triangular)
	endif


	RestArea(aArea)

Return lRet
