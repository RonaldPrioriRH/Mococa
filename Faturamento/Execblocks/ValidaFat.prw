#include "protheus.ch" 

/*/{Protheus.doc} MT410ACE
Ponto de entrada criado para verificar o acesso dos usuários nas rotinas: Excluir, Visualizar, Resíduo, Copiar 
e Alterar.
@author TOTVS
@since 29/03/2017
@version P12
@param nulo            
@return nulo
/*/

/**********************/
User Function MT410ACE()
/**********************/

Local aArea := GetArea()
Local nOpcx := PARAMIXB[1] //1 - Excluir / 2 - Visualizar / Residuo / 3 - Copiar / 4 - Alterar
Local lRet 

if nOpcx == 4
	if !EMPTY(SC5->C5_XPVSGAC)
		Aviso("Atenção","Pedido de Venda deve ser alterado pelo sistema SGAC. Acionar apoio a Vendas!",{"OK"})  
		return .F.
	endif
endif
	

lRet := U_RFATE020() //Evitar Alteração de PV na carga 

if lRet
	lRet := U_RFATE027(nOpcx) //Evitar Alteração/Exclusao de PV em Fat.Triangular 
endif

RestArea(aArea)

Return lRet