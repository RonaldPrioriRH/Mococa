#include "protheus.ch" 

/*/{Protheus.doc} RFATE028

Ponto de entrada de validação da tela toda no Pedido de Venda. MTA410
Faturamento Triangular: Inibe alteração de quantidade no pedidos com id triangulaçao. 

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function RFATE028()
	
	Local aArea	:= GetArea()
	Local aAreaSC6 := SC6->(GetArea())
	Local lRet := .T.
	Local nX
	Local nPosItem := aScan(aHeader,{ |x| Upper(AllTrim(x[2])) == "C6_ITEM" })
	Local nPosQtd := aScan(aHeader,{ |x| Upper(AllTrim(x[2])) == "C6_QTDVEN" })
	
	if ALTERA
		if !empty(SC5->C5_XIDTRI) .and. AllTrim(FunName()) <> '#RACDA005'
			DbSelectArea("SC6")
			SC6->(DbSetOrder(1))
			for nX := 1 to len(aCols)
				if aCols[nX][len(aCols[nX])]
					MsgInfo("Pedido em processo de Faturamento Triangular. Não é permitido excluir itens!")
					lRet := .F.
					EXIT
				endif
				if SC6->(DbSeek(xFilial("SC6")+SC5->C5_NUM+aCols[nX][nPosItem]))
					if SC6->C6_QTDVEN <> aCols[nX][nPosQtd]
						MsgInfo("Pedido em processo de Faturamento Triangular. Não é permitido alterar quantidade dos produtos!")
						lRet := .F.
						EXIT
					endif
				else
					MsgInfo("Pedido em processo de Faturamento Triangular. Não é permitido incluir novos itens!")
					lRet := .F.
					EXIT
				endif
			next nX
			
			RestArea(aAreaSC6)
			RestArea(aArea)
		endif
	endif

Return lRet

