#Include 'Protheus.ch'

/*/{Protheus.doc} FA060Qry

Ponto de Entrada Filtrar Titulos Fidic
PE para Filtrar os titulos na geracao de bordero onde banco seja um Fidic 

@author Leandro Rodrigues
@since 23/03/2017
@version P12
@param Nao recebe parametros
@return xRet
/*/

User Function FA060Qry()

Local aArea := GetArea()
Local cRet  := ""

//Chama funcao para filtar os titulos se for banco Fidic
cRet := U_RFINA009()

RestArea(aArea)

Return cRet