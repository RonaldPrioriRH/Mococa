#Include 'Protheus.ch'

/*/{Protheus.doc} FA050DEL

Ponto de Entrada na exclusao do titulo a pagar para verificar
se foi gerado pela rotina de Fidic

@author Leandro Rodrigues
@since 04/05/2017
@version P12
@param Nao recebe parametros
@return xRet
/*/

User Function FA050DEL()

Local aAreaSE2 := SE2->(GetArea())

//Verifica se titulo foi originado de Tarifa Fidic
U_RFINA010()

RestArea(aAreaSE2)

Return .T.

