#Include 'Protheus.ch'


/*/{Protheus.doc} RFINA010

Exclui tarifa de Fidic que deu origem ao titulo excluido

@author Leandro Rodrigues
@since 04/05/2017
@version P12
@param Nao recebe parametros
@return xRet
/*/

User Function RFINA010()
	
	if !IsInCallStack("U_RFIN07ES") //se nao for vindo da rotina de estorno, deleta 
		If ZEF->(DbSeek(xFilial("ZEF")+SE2->E2_PREFIXO+SE2->E2_NUM+SE2->E2_TIPO+SE2->E2_FORNECE))
			if Reclock("ZEF",.F.)
				ZEF->(DbDelete())
				ZEF->(MsUnLock())
			Endif
		Endif
	endif
	
Return