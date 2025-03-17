#Include 'Protheus.ch'

/*/{Protheus.doc} F200VAR

Ponto de entrada na leitura do arquivo de retorno
para verificar se banco Fidic e existe recompra de titulo

@author Leandro Rodrigues
@since 05/05/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

User Function F200VAR()

Local aValores 	:= PARAMIXB[01]
Local aAreaSE1 	:= SE1->(GetArea())



U_RFINA011(aValores)


RestArea(aAreaSE1)

Return