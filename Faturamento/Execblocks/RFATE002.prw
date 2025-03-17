#include "protheus.ch" 

/*/{Protheus.doc} RFATE002
Realiza validação dos campos datas (vigência) - Contratos
@author TOTVS
@since 09/03/2017
@version P12
@param Nao recebe parametros            
@return nulo
/*/

/**************************************/
User Function RFATE002(dDtInic,dDtFina)
/**************************************/

Local lRet := .T.

If !Empty(dDtInic) .And. !Empty(dDtFina)

	If dDtFina < dDtInic
		lRet := .F.
		Help( ,, 'Help - MODELPOS',, 'Não é permitido a data final ser inferior a data de início da vigência.', 1, 0 )
	Endif
	
	If lRet
		
		If dDtFina < dDataBase
		
			If !MsgYesNo("A data final de vigência é inferior a data atual, deseja continuar?")
				lRet := .F.
			Endif
		Endif
	Endif
Endif

Return lRet