#include "protheus.ch" 

/*/{Protheus.doc} RFATE027

Ponto de entrada criado para verificar o acesso dos usuários nas rotinas: Excluir, Visualizar, Resíduo, Copiar 
e Alterar. MT410ACE
Faturamento Triangular: Inibe alteração/exclusao de pedidos com id triangulaçao. 

@author DANILO
@since 18/04/2017
@version P12
@param nOpcx //1 - Excluir / 2 - Visualizar / Residuo / 3 - Copiar / 4 - Alterar            
@return nulo
/*/
User Function RFATE027(nOpcx)

	Local lRet := .T.
	Local lEstLib := .F.

	if IsBlind()
		Return lRet
	endif

	if nOpcx == 4 //se é alteração
		if !empty(SC5->C5_XIDTRI)
			DbSelectArea("SC6")
			SC6->(DbSetOrder(1))
			SC6->(DbSeek(xFilial("SC6")+SC5->C5_NUM))
			if empty(SC6->C6_XTPVORI)
				MsgInfo("Pedido em processo de Faturamento Triangular. Alteração não permitida!")
				lRet := .F.
			endif
		endif

		if lRet .AND. !empty(SC5->C5_XCARGA)
			MsgInfo("Pedido em processo de A. Faturamento. Alteração não permitida!")
			lRet := .F.
		EndIf
		
		if lRet .AND. !empty(SC5->C5_XPEDIDO)
			MsgInfo("Pedido em processo de A. Faturamento. Alteração não permitida!")
			lRet := .F.
		EndIf
		

	endif

	if nOpcx == 1 //se é exclusão
		if !empty(SC5->C5_XIDTRI)
			DbSelectArea("SC6")
			SC6->(DbSetOrder(1))
			SC6->(DbSeek(xFilial("SC6")+SC5->C5_NUM))
			if empty(SC6->C6_XTPVORI) //e o pedido na filial de venda
				MsgInfo("Pedido em processo de Faturamento Triangular. Exclusão permitida apenas no pedido destino!")
				lRet := .F.
			endif

			//valida documentos gerados a partir deste pedido
			if lRet
				lRet := U_ROMSE015("SC5", SC5->C5_XIDTRI)
			endif

			if lRet .AND. !empty(SC5->C5_XCARGA)
				MsgInfo("Pedido em processo de A. Faturamento. Exclusão não permitida!")
				lRet := .F.
			EndIf
			
			if lRet .AND. !empty(SC5->C5_XPEDIDO)
				MsgInfo("Pedido em processo de A. Faturamento. Exclusão não permitida!")
				lRet := .F.
			EndIf
			

			//verifico se há saldo empenhado/liberado e faço estorno
			if lRet
				While SC6->(!Eof()) .AND. SC6->C6_FILIAL+SC6->C6_NUM == xFilial("SC6")+SC5->C5_NUM
					if empty(SC6->C6_NOTA) .AND. SC6->C6_QTDEMP > 0
						lEstLib := .T.
						EXIT
					endif
					SC6->(DbSkip())
				enddo
				//estorna liberação estoque
				if lEstLib .AND. MsgYesNo("Pedido possui liberaçao de estoque. Deseja estornar liberaçao para prosseguir com a exclusão?","Atenção")

					lRet := ExcEmpenho()
					if !lRet
						MsgStop("Falha ao estornar liberação de estoque.")
					endif

				endif
			endif

		endif
	endif

Return lRet


//----------------------------------------------------------------
// faz exclusão/estorno do empenho do pedido 
//----------------------------------------------------------------
Static Function ExcEmpenho()

	Local lRet := .T.
	Local aAreaSC6 := SC6->(GetArea())

	DbSelectArea("SC6")
	SC6->(dbSetOrder(1))
	If SC6->(MsSeek(xFilial("SC6")+SC5->C5_NUM))
		While SC6->(!Eof()) .And. SC6->C6_FILIAL+SC6->C6_NUM == xFilial("SC6")+SC5->C5_NUM

			if SC6->C6_QTDEMP > 0 //se tem saldo empenhado
				dbSelectArea("SC9")
				dbSetOrder(1)
				If MsSeek(xFilial("SC9")+SC6->C6_NUM+SC6->C6_ITEM)
					SC9->(a460Estorna())
				Endif
			endif

			if SC6->C6_QTDEMP > 0 //se continua empenhado, deu algum erro
				lRet := .F.
				EXIT
			endif

			SC6->(dbSkip())
		EndDo
	Endif

	RestArea(aAreaSC6)

Return lRet

