#include "protheus.ch"
#include "fwmvcdef.ch" 

/*/{Protheus.doc} RFATE006
Log de movimentação (Exclusão) - Contratos
@author TOTVS
@since 24/03/2017
@version P12
@param cIdMovCtr          
@return nulo
/*/

/********************************/
User Function RFATE006(cIdMovCtr)
/********************************/

Local aArea			:= GetArea()
Local lRet			:= .T.
Local oModelExec 	:= FWLoadModel("RFATA004")

DbSelectArea("Z13")
Z13->(DbSetOrder(1)) //Z13_FILIAL+Z13_CODIGO

If Z13->(DbSeek(xFilial("Z13")+cIdMovCtr))

	lActivate 	:= .F.
	lCommit		:= .F.

	//Seto a operação de exclusão 
	oModelExec:SetOperation(5) 
	
	//Ativo o modelo
	lActivate := oModelExec:Activate()
	
	//Se o modelo foi ativado com sucesso
	If lActivate
	
		// comito a operação
		lCommit := oModelExec:CommitData()
		
		// desativo o modelo
		oModelExec:DeActivate()
	Else	
		// aborto a transação
		DisarmTransaction()		
		lRet := .F.
	Endif
Endif

RestArea(aArea)

Return lRet