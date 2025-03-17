#Include 'Protheus.ch'
/*/{Protheus.doc} ROMSE005

Este ponto de entrada é executado durante a validação da rotina de aglutinação 
de cargas do módulo OMS. Seu objetivo é complementar a validação do sistema, 
sendo fornecido o número da carga de origem e destino. OM200VCG

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function ROMSE005(cCargDes, cSeqDes, cCargOri, cSeqOri)
	
	Local aAreaDAK := DAK->(GetArea())
	Local lRet := .T.
	
	if !empty(Posicione("DAK",1,xFilial("DAK")+cCargDes+cSeqDes,"DAK_XIDTRI"))
		MsgInfo("Carga Destino vinculada a uma Solicitação de Transferência (Fat. Triangular). Ação não permitida! Exclua primeiro o pedido gerado na Filial de Estoque!","Atenção")
		lRet := .F.
	elseif !empty(Posicione("DAK",1,xFilial("DAK")+cCargOri+cSeqOri,"DAK_XIDTRI"))
		MsgInfo("Carga Origem vinculada a uma Solicitação de Transferência (Fat. Triangular). Ação não permitida! Exclua primeiro o pedido gerado na Filial de Estoque!","Atenção")
		lRet := .F.
	endif
	
	RestArea(aAreaDAK)
	
Return lRet

