#Include 'Protheus.ch'

/*/{Protheus.doc} OS200TOK

Ponto de entrada valida��o da manuten��o da carga.

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function OS200TOK()
	
	Local lRet := .T.
	
	//tratamentos para faturamento triangular
	lRet := U_ROMSE004()
	
Return lRet