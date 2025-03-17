#include "protheus.ch"

/*/{Protheus.doc} RFATE008
Log de Movimentação de Contratos - Pedidos de Venda - PE MA410DEL - Contratos
@author TOTVS
@since 29/03/2017
@version P12
@param nulo          
@return nulo
/*/

/***********************/
User Function RFATE008()
/***********************/

Local aAreaZ13	:= GetArea("Z13")

Local BKPINC	:= INCLUI
Local BKPALT	:= ALTERA

DbSelectArea("Z13")
Z13->(DbSetOrder(3)) //Z13_FILIAL+Z13_PEDIDO

If Z13->(DbSeek(xFilial("Z13")+SC5->C5_NUM))

	Begin Transaction

	//Exclui os logs relacionados ao PV		
	While Z13->(!EOF()) .And. Z13->Z13_FILIAL == xFilial("Z13") .And. Z13->Z13_PEDIDO == SC5->C5_NUM
		
		If U_RFATE006(Z13->Z13_CODIGO)
			INCLUI := BKPINC
			ALTERA := BKPALT
		Else
			INCLUI := BKPINC
			ALTERA := BKPALT
			Exit
		Endif
		
		Z13->(DbSkip())
	EndDo
	
	End Transaction
Endif

RestArea(aAreaZ13)

Return