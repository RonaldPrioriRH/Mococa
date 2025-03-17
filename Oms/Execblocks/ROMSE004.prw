#Include 'Protheus.ch'

/*/{Protheus.doc} ROMSE004

Ponto de entrada valida��o da manuten��o da carga. OS200TOK

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function ROMSE004()
	
	Local lRet := .T.

	if !empty(dak->dak_xidtri)
		MsgInfo("Carga vinculada a uma Solicita��o de Transfer�ncia (Fat. Triangular). A��o n�o permitida! Exclua primeiro o pedido gerado na Filial de Estoque!","Aten��o")
		lRet := .F.
	endif
	
	if lRet .and. !empty(dak->dak_xtipo)
		MsgInfo("Carga A. Fat. A��o n�o permitida! ","Aten��o")
		lRet := .F.
	endif
	
Return lRet
