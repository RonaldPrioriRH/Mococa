#include "protheus.ch" 

/*/{Protheus.doc} MS520VLD
Ponto de entrada é chamado para validar ou não a exclusão da nota na rotina MATA521
@author TOTVS
@since 29/03/2017
@version P12
@param nulo            
@return nulo
/*/

/**********************/
User Function MS520VLD()
/**********************/

Local aArea 	:= GetArea()
Local aAreaSD2	:= GetArea("SD2")
Local lRet 

//lRet := U_RFATE018() 
lRet := U_RFATE042() 

//Contratos
if lRet
	lRet := U_RFATE038()
endif

//Faturamento Triangular
if lRet
	lRet := U_ROMSE015("SF2", SF2->F2_XIDTRI)
endif

RestArea(aAreaSD2)
RestArea(aArea)

Return lRet