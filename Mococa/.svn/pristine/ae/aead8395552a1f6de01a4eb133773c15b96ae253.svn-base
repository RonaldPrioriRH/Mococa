#Include 'Protheus.ch'

/*/{Protheus.doc} RCOME007
Limpa campo numero de pedido na exclusao do pedido de compra para 
Pedidos gerados no acerto do leite Spot- PE MT120EXC
@author TOTVS
@since 16/06/2017
@version P12
@param nenhum           
@return nulo
/*/

User Function RCOME007()

Local aArea := GetAreA()

DbSelectArea("ZEJ")
ZEJ->(DbSetOrder(4))

DbSelectArea("ZEN")
ZEN->(DbSetOrder(2))

If ZEJ->(DbSeek(xFilial("ZEJ")+SC7->C7_FORNECE+SC7->C7_LOJA+SC7->C7_NUM))

	While ZEJ->(!EOF()) ;
		.AND. ZEJ->ZEJ_FILIAL+ZEJ->ZEJ_FORNEC+ZEJ->ZEJ_LOJA+ZEJ->ZEJ_PEDIDO == xFilial("SC7")+SC7->C7_FORNECE+SC7->C7_LOJA+SC7->C7_NUM

		If Reclock("ZEJ",.F.)
			ZEJ->ZEJ_PEDIDO := ""
			ZEJ->(MsUnLock())
		Endif
		
		//Atualiza Status do registro na apuracao do leite
		If ZEN->(DbSeek(xFilial("ZEN")+ZEJ->ZEJ_CODIGO+ZEJ->ZEJ_FORNEC+ZEJ->ZEJ_LOJA))
			If Reclock("ZEN",.F.)
				ZEN->ZEN_STATUS := "A"
				ZEN->(MsUnLock())
			Endif
		Endif
		
		ZEJ->(DbSkip())
	EndDo
Endif

RestArea(aArea)
Return

