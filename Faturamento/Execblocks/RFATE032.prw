#include "protheus.ch"
#include "fwmvcdef.ch" 

/*/{Protheus.doc} RFATE032
Log de Apura��o (Exclus�o) - Contratos
@author TOTVS
@since 27/04/2017
@version P12
@param cIdApura          
@return nulo
/*/

/*******************************/
User Function RFATE032(cIdApura)
/*******************************/

Local aArea			:= GetArea()
Local lRet			:= .T.
Local oModelExec 	:= FWLoadModel("RFATA008")

DbSelectArea("Z21")
Z21->(DbSetOrder(1)) //Z21_FILIAL+Z21_CODIGO

If Z21->(DbSeek(xFilial("Z21")+cIdApura))

	lActivate 	:= .F.
	lCommit		:= .F.

	//Seto a opera��o de exclus�o 
	oModelExec:SetOperation(5) 
	
	//Ativo o modelo
	lActivate := oModelExec:Activate()
	
	//Se o modelo foi ativado com sucesso
	If lActivate
	
		// comito a opera��o
		lCommit := oModelExec:CommitData()
		
		// desativo o modelo
		oModelExec:DeActivate()
	Else	
		// aborto a transa��o
		DisarmTransaction()		
		lRet := .F.
	Endif
Endif

RestArea(aArea)

Return lRet