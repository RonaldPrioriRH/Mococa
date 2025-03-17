#Include 'Protheus.ch'

/*/{Protheus.doc} OM200GRV

Gravação do Arquivo Temorário da Carga.
Ponto de Entrada após a gravação dos campos principais do arquivo de pedidos 
na montagem de carga, que permite ao usuário gravar seus campos específicos. 
Os campos específicos devem ser incluídos no array no ponto de entrada DL200TRB.

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function OM200GRV()
	
	//tratamentos para faturamento triangular
	
	//if TRBPED->PED_PEDIDO == TRBSC9->C9_PEDIDO .AND. TRBPED->PED_ITEM == TRBSC9->C9_ITEM
	//if TRBPED->PED_PEDIDO == SC9->C9_PEDIDO .OR. TRBPED->PED_ITEM == SC9->C9_ITEM
	DbSelectArea("SC5")
	SC5->(DbSetOrder(1))
	SC5->(DBGOTOP())
	if SC5->(dbseek(xFilial("SC5")+TRBPED->PED_PEDIDO)) 
		if !empty(SC5->C5_XOBSNF)
			Reclock("TRBPED", .F.) //altera
			TRBPED->PED_OBSNF := SC5->C5_XOBSNF
			TRBPED->(MsUnlock())
		endif 
	endif
	
	U_ROMSE008()
	
Return

