#include "protheus.ch" 

/*/{Protheus.doc} ROMSE001

Filtro dos Pedidos na Montagem da Carga.
Ponto de entrada depois das condições principais de filtro dos pedidos na montagem de carga utilizando Top Connect.
Faturamento Triangular: altera para permitir trazer SC9 mesmo com bloqueio de estoque 

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function ROMSE001(cQuery)
                                                                                                                                                                                                                                                                                                                    
	//Validação 12.1.23
	Local cStrOrig := "SC9.C9_BLEST = '"+Space(Len(SC9->C9_BLEST)) +"'"
	Local cStrNew := "("+cStrOrig+" OR C5_XFILEST <>  ' ')"
	Local cBenef := " AND SC5.C5_TIPO IN ('B', 'D')"
	Local cSBenf := ""

	cQuery := ChangeQuery(cQuery) //chamo para tirar espaços duplos e tabulações da string
	
	if At(cStrOrig, cQuery) > 0
		cQuery := strtran(cQuery, cStrOrig, cStrNew)	
		cQuery := strtran(cQuery, cBenef  , cSBenf)	 
	endif
	
Return cQuery

