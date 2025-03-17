#Include 'Protheus.ch'

/*/{Protheus.doc} M110STTS
Ponto entrada Inclusão de interface após gravar a solicitação de Compras

@author Danilo Brito
@since 23/06/2017
@version P12
@param nulo            
@return nulo
/*/
User Function M110STTS()

	Local cNumSol	:= Paramixb[1]
	Local nOpt		:= Paramixb[2]
	
	U_RCOME08C(cNumSol, nOpt)
	
Return 