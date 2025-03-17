#INCLUDE "RWMAKE.CH" 
#include "protheus.ch" 

/*Este ponto de entrada pertence à rotina rotina liberação de pedidos de venda, 
MATA440(). Está localizado na rotina de liberação manual, 
A440LIBERA(). A rotina permite que alguns campos do cabeçalho sejam alterados. 
Este ponto é usado para informar outros campos que também poderão ser alterados.
*/


User Function MTA440C5 
                                  
Local aCampos := {}
Local cAltera := AllTrim(getMv("MV_XALTPED"))
 

	If RetCodUsr() $ cAltera

		aCampos := {"C5_XOBSNF"} 
		//MsgInfo("Habilitados os Campos= "+aCampos[1])
		
	EndIf


Return aCampos 