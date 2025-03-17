#Include 'Protheus.ch'

/*/{Protheus.doc} ROMSE008

Gravação do Arquivo Temorário da Carga. OM200GRV
Ponto de Entrada após a gravação dos campos principais do arquivo de pedidos 
na montagem de carga, que permite ao usuário gravar seus campos específicos. 
Os campos específicos devem ser incluídos no array no ponto de entrada DL200TRB.

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function ROMSE008()
	
	//se é o mesmo pedido e item que está sendo processado
	//dbSelectArea("TRBPED")
	//TRBPED->(dbGoTop())
	//TRBPED->(DBSETORDER(6))
	//aAreaTRBPED := TRBPED->(GetArea())

	//if TRBPED->PED_PEDIDO == TRBSC9->C9_PEDIDO .AND. TRBPED->PED_ITEM == TRBSC9->C9_ITEM
	//if TRBPED->PED_PEDIDO == SC9->C9_PEDIDO .OR. TRBPED->PED_ITEM == SC9->C9_ITEM
	DbSelectArea("SC5")
	SC5->(DbSetOrder(1))
	SC5->(DBGOTOP())
	if SC5->(dbseek(xFilial("SC5")+TRBPED->PED_PEDIDO)) 
			DbSelectArea("SC9")
			SC9->(DbSetOrder(1))
			SC9->(DBGOTOP())
			if SC9->(dbseek(xFilial("SC9")+TRBPED->PED_PEDIDO)) 
				Reclock("TRBPED", .F.) //altera
				TRBPED->PED_FILEST  := SC5->C5_XFILEST
				TRBPED->PED_FILINT  := SC5->C5_XFILINT
				TRBPED->PED_SGAC    := SC5->C5_XPVSGAC
				TRBPED->PRV_FAT     := SC9->C9_DATENT
				TRBPED->(MsUnlock())
			endif 
	endif
	
	//RestArea(aAreaTRBPED) 
Return

