#Include 'Protheus.ch'

/*/{Protheus.doc} OM200VCG

Este ponto de entrada é executado durante a validação da rotina de aglutinação 
de cargas do módulo OMS. Seu objetivo é complementar a validação do sistema, 
sendo fornecido o número da carga de origem e destino.

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function OM200VCG()
	
	Local cCargDes := PARAMIXB[1]
	Local cSeqDes := PARAMIXB[2]
	Local cCargOri := PARAMIXB[3] 
	Local cSeqOri := PARAMIXB[4]
	Local lRet := .T.
	
	//tratamentos para faturamento triangular
	lRet := U_ROMSE005(cCargDes, cSeqDes, cCargOri, cSeqOri)
	
Return lRet

