#Include 'Protheus.ch'

/*/{Protheus.doc} MT110GET
Ponto entrada Altera as coordenadas de Array e redimensiona a dialog
Solicitaçao de Compras

@author Danilo Brito
@since 23/06/2017
@version P12
@param nulo            
@return nulo
/*/
User Function MT110GET()

	Local aRet:= PARAMIXB[1]
	
	U_RCOME08A(@aRet)

Return(aRet) 


