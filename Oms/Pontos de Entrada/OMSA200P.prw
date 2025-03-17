#Include 'Protheus.ch'

/*/{Protheus.doc} OMSA200P

Ponto de entrada antes da pergunta se deseja ou não realizar o estorno da Montagem da Carga. 

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function OMSA200P()

	Local lRet := .T.
	
	//tratamentos para faturamento triangular
	lRet := U_ROMSE003()
	
Return lRet

