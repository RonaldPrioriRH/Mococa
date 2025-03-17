#Include 'Protheus.ch'
/*/{Protheus.doc} ROMSE005

Este ponto de entrada � executado durante a valida��o da rotina de aglutina��o 
de cargas do m�dulo OMS. Seu objetivo � complementar a valida��o do sistema, 
sendo fornecido o n�mero da carga de origem e destino. OM200VCG

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
		MsgInfo("Carga Destino vinculada a uma Solicita��o de Transfer�ncia (Fat. Triangular). A��o n�o permitida! Exclua primeiro o pedido gerado na Filial de Estoque!","Aten��o")
		lRet := .F.
	elseif !empty(Posicione("DAK",1,xFilial("DAK")+cCargOri+cSeqOri,"DAK_XIDTRI"))
		MsgInfo("Carga Origem vinculada a uma Solicita��o de Transfer�ncia (Fat. Triangular). A��o n�o permitida! Exclua primeiro o pedido gerado na Filial de Estoque!","Aten��o")
		lRet := .F.
	endif
	
	RestArea(aAreaDAK)
	
Return lRet

