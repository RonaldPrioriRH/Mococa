#Include 'Protheus.ch'

/*/{Protheus.doc} MT103FIM
Ponto de entrada para validar a exclusao do Documento de entrada
@author TOTVS
@since 18/05/2017
@version P12
@param nulo            
@return nulo
/*/

User Function A100DEL ()

Local aAreaSF1 := SF1->(GetArea())
Local aAreaSD1 := SD1->(GetArea())
Local lRet	   := .T.

//Valida exclusao documento de entrada se acerto Leite Spot	
lRet := U_RCOME005()

//Contratos	
if lRet 
	lRet := U_RCOME006()
endif

//Faturamento Triangular
if lRet
	lRet := U_ROMSE015("SF1", SF1->F1_XIDTRI)
endif

RestArea(aAreaSF1)
RestArea(aAreaSD1)

Return lRet