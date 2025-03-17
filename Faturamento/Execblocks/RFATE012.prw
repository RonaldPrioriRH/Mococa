#include "protheus.ch"

/*/{Protheus.doc} RFATE012
Utilizado no PE M410PVNF - Valida��o para Faturamento
@author TOTVS
@since 05/04/2017
@version P12
@param nulo          
@return nulo
/*/

/***********************/
User Function RFATE012()
/***********************/

	Local lRet		:= .T.
	Local aAreaDAI	:= GetArea("DAI")

	DbSelectArea("DAI")
	DAI->(dbSetOrder(4)) //DAI_FILIAL+DAI_PEDIDO+DAI_COD+DAI_SEQCAR

	//If FUNNAME() == "MATA410"
	//if IsInCallStack("MATA410")
		If DAI->(DBSeek(xFilial("DAI")+SC5->C5_NUM))
			xmaghelpfis("Aten��o","Pedido est� vinculado a carga "+DAI->DAI_COD+"!","O Faturamento da mesma dever� ocorrer atraves da rotina OMS - Atualiza��es - Doc.saida - Carga")
			lRet := .F.
		EndIf
	//EndIf

	RestArea(aAreaDAI)

Return lRet