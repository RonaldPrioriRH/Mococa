#Include 'Protheus.ch'
#Include 'FWMVCDEF.ch'
#Include 'RestFul.CH'
#Include 'TbiConn.CH'
#Include 'TopConn.CH'

/*/{Protheus.doc} F440ABAS
	Ponto de Entrada para alteração de base de comissão descontando titulos VB- 
	@type  Function
	@author Natalia Perioto
	@since 27/03/2024
	@example
	(examples)
	@see (links_or_references)
	/*/

USER FUNCTION F440ABAS()
    Local aComiss := aClone(Paramixb)

    If len(aComiss) > 0
        aComiss[1,6] := aComiss[1,6] + u_PAbat()
    else
        xDebug := 0
    Endif

Return aComiss


User Function PAbat()
    Local aArea    := GetArea()
    Local aAreaSE1 := SE1->(GetArea())
    Local nValAbat  := 0 
    Local cAlias2  := GetNextAlias()     
    
    BeginSql Alias cAlias2

        SELECT SE1.E1_VALOR
        FROM %table:SE1% SE1
        WHERE SE1.E1_FILIAL = %xFilial:SE1%   
        AND SE1.E1_NUM = %Exp:SE1->E1_NUM%
        AND SE1.E1_PREFIXO = %Exp:SE1->E1_PREFIXO%
        AND SE1.E1_TIPO = 'VB-'
        AND SE1.%NotDel%

    EndSql 

    If (cAlias2)->(!eof())
        nValAbat := (cAlias2)->E1_VALOR  
    EndIf  
  
    /*If nValAbat > 0

        If nMaxP > 1
            nValAbat := nValAbat/nMaxP
        EndIf    
        
    EndIf  */        
   

    (cAlias2)->(DbCloseArea())
//    (cAlias1)->(DbCloseArea())

          
     RestArea(aAreaSE1)
     RestArea(aArea)
     
Return nValAbat       
