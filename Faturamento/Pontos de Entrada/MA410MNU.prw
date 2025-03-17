#include "protheus.ch" 

/*/{Protheus.doc} MA410MNU
Ponto de entrada disparado antes da abertura do Browse, caso Browse inicial da rotina esteja habilitado, 
ou antes da apresentação do Menu de opções, caso Browse inicial esteja desabilitado.
Para habilitar ou desabilitar o Browse, entre na rotina, clique em Configurações/Browse Inicial e selecione
a opção desejada:
Sim - Habilitar Browse Inicial
Não - Desabilitar Browse Inicial 
Este ponto de entrada pode ser utilizado para inserir novas opções no array aRotina.
@author TOTVS
@since 29/03/2017
@version P12
@param nulo            
@return nulo
/*/

/**********************/
User Function MA410MNU()
/**********************/

Local aArea := GetArea()

U_RFATE017()

RestArea(aArea)

Return
