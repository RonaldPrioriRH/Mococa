#Include 'Protheus.ch'

/*/{Protheus.doc} ROMSE003

Ponto de entrada antes da pergunta se deseja ou não realizar o estorno da Montagem da Carga. OMSA200P 

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function ROMSE003()
	
	Local lRet := .T.
	Local lHabFatAnt := GetMv("MV_XFATANT",,.F.)//Habilita Faturamento antecipado. 
	
	
	if !empty(DAK->DAK_XIDTRI)
		MsgInfo("Carga vinculada a uma Solicitação de Transferência (Fat. Triangular). Ação não permitida! Exclua primeiro o pedido gerado na Filial de Estoque!","Atenção")
		lRet := .F.
	endif
	
	if lHabFatAnt
	
		if lRet .AND. !empty(DAK->DAK_XTIPO) .and. !IsInCallStack("U_ROMSE016")
			MsgInfo("Carga A. Fat. Ação não permitida! ","Atenção")
			lRet := .F.
		endif
		
	else
		
		if lRet .AND. !empty(DAK->DAK_XTIPO) 
			MsgInfo("Carga A. Fat. Ação não permitida! ","Atenção")
			lRet := .F.
		endif
	
	endif
	
Return lRet

