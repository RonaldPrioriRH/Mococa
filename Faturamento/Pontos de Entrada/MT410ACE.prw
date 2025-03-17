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

If nOpcx == 3
	If RetCodUsr() $ SuperGetMv("MV_XCPPV",.F.,"")
		return .T.
	else
		Aviso("Atenção","Pedido de Vendas não pode ser copiado. Realizar digitação manual!",{"OK"})
		return .F.
	endif
EndIf

if nOpcx == 4 .AND. !IsInCallStack("U_RWSFAT03") //alterar e não é vindo do WS
	if !EMPTY(SC5->C5_XPVSGAC)
			Aviso("Atenção","Pedido de Venda deve ser alterado pelo sistema SGAC. Acionar apoio a Vendas!",{"OK"})
		return .F.
	endif
	if !EMPTY(SC5->C5_XPVREMS)
			Aviso("Atenção","Pedido de Remessa deve ser alterado pelo sistema SGAC. Acionar apoio a Vendas!",{"OK"})
		return .F.
	endif
endif



lRet := U_RFATE020() //Evitar Alteração de PV na carga

if lRet
	lRet := U_RFATE027(nOpcx) //Evitar Alteração/Exclusao de PV em Fat.Triangular
endif



RestArea(aArea)

Return lRet
