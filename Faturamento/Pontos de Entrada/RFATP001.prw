#include "protheus.ch"

/*/{Protheus.doc} RFATP001
Pontos de Entrada - Cláusulas
@author TOTVS
@since 08/03/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

/***********************/
User Function RFATP001()
/***********************/

Local aParam 		:= PARAMIXB
Local oObj			:= aParam[1]
Local cIdPonto		:= aParam[2]
//Local oModelZ08		:= oObj:GetModel("Z08MASTER")

Local xRet 			:= .T.

If cIdPonto == 'MODELPOS' .And. oObj:GetOperation() == 5 //Confirmação da exclusão

	If ExistZ08()

		xRet := .F.
		Help( ,, 'Help - MODELPOS',, 'Não é permitido a exclusão desta cláusula, pois a mesma se encontra associada a contrato(s). Para concluir a exclusão, favor excluir os contratos relacionados.', 1, 0 )
	Endif
Endif

Return xRet

/*************************/
Static Function ExistZ08()
/*************************/

Local lRet := .F.

DbSelectArea("Z10")
Z10->(DbSetOrder(1)) //Z10_FILIAL+Z10_CODIGO+Z10_ITEM
Z10->(DbGoTop())

While Z10->(!EOF())
	
	If Z10->Z10_CLAUSU == Z08->Z08_CODIGO
		lRet := .T.
		Exit
	Endif

	Z10->(DbSkip())
EndDo

Return lRet
