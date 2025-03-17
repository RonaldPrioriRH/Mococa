#include "protheus.ch" 

/*/{Protheus.doc} RFATE029

Ponto de entrada executado antes de deletar registro no SC5. MA410DEL
Faturamento Triangular: Exclui vinculos de ID Triangulaçao dos pedidos e carga 

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function RFATE029()

	Local aArea := GetArea()
	Local aAreaSC5 := SC5->(GetArea())
	Local cIdTriang := ""
	Local aRecIgnora := {SC5->(Recno())}
	Local cC5FilEx := SC5->C5_FILIAL
	Local cFilInt := ""
	Local cFilEst := ""
	Local cFilVen := ""
	
	if !empty(SC5->C5_XIDTRI)
		cIdTriang := SC5->C5_XIDTRI
		
		//verifico o pedido na filial de venda, para preencher variaveis de filial
		SC5->(dbOrderNickName("IDTRIANG"))
		if SC5->(DbSeek(cIdTriang))
			While SC5->(!Eof()) .AND. SC5->C5_XIDTRI == cIdTriang
				if !empty(SC5->C5_XFILEST)
					cFilVen := SC5->C5_FILIAL
					cFilEst := SC5->C5_XFILEST
					cFilInt := SC5->C5_XFILINT
					EXIT
				endif
				SC5->(DbSkip())
			Enddo
		endif
		
		//se nao for filial intermediaria
		if empty(cFilInt) .OR. cC5FilEx != xFilial("SC5",cFilInt)
			
			//verifico se é referente a uma carga
			DAK->(dbOrderNickName("IDTRIANG"))
			if DAK->(DbSeek(cIdTriang))
				RecLock("DAK", .F.)
					DAK->DAK_XIDTRI := ""
				DAK->(MsUnlock())
			endif
			
			//excluindo vinculo com outros pedidos da outra filial
			SC5->(dbOrderNickName("IDTRIANG"))
			if SC5->(DbSeek(cIdTriang))
				While SC5->(!Eof()) .AND. SC5->C5_XIDTRI == cIdTriang
					if aScan(aRecIgnora, SC5->(Recno())) == 0 //se nao ignora
						if SC5->C5_FILIAL == cFilVen //somente pedidos da filial de venda
							Reclock("SC5",.F.)
								SC5->C5_XIDTRI := ""
							SC5->(MsUnlock())
							
							SC5->(DbSeek(cIdTriang))
						elseif SC5->C5_FILIAL == cFilEst
							if !IsBlind()
								MsgInfo("Atenção! Exclua também o pedido "+SC5->C5_NUM+" que também foi gerado na mesma solicitação de triangulação que este pedido.","LEMBRETE!")
							endif
							SC5->(DbSkip())
						endif
						aAdd(aRecIgnora, SC5->(Recno()))
					else
						SC5->(DbSkip())
					endif
				Enddo
			endif
						
		endif		
		
	endif
	
	RestArea(aAreaSC5)
	RestArea(aArea)
	
Return

