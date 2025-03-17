#include "protheus.ch" 

/*/{Protheus.doc} ROMSE002

Filtro dos Pedidos na Montagem da Carga.
Ponto de entrada depois das condições principais de filtro dos pedidos na montagem de carga utilizando Top Connect.
Faturamento Triangular: altera para permitir trazer SC9 mesmo com bloqueio de estoque 

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function ROMSE002(cQuery)
	
	Local cStrOrig := "SC9.C9_BLEST = '"+Space(Len(SC9->C9_BLEST))+"'"
	Local cStrNew := "("+cStrOrig+" OR (SELECT C5_XFILEST FROM "+RetSqlName("SC5")+" SC5 WHERE SC5.D_E_L_E_T_ <> '*' AND C5_FILIAL = C9_FILIAL AND C5_NUM = C9_PEDIDO) <> '' )"
	
	cQuery := ChangeQuery(cQuery) //chamo para tirar espaços duplos e tabulações da string
	
	if At(cStrOrig, cQuery) > 0
		cQuery := strtran(cQuery, cStrOrig, cStrNew)	
	endif
	
Return cQuery
