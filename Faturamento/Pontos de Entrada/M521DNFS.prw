#Include 'Protheus.ch'

/*/{Protheus.doc} RFATP002
Pontos de Entrada - Exclusao Doc Saida
@author TOTVS
@since 02/06/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

User Function M521DNFS()

Local aAreaSF2:= SF2->(GetArea())

U_RFATE037() // Limpar numero da nota Acerto Leite Spot

RestArea(aAreaSF2)
Return

