#include "protheus.ch" 

/*/{Protheus.doc} MT103IPC
Ponto de Entrada na confirmação da seleçao do PC usado para atualizar os campos customizados no Documento de 
Entrada e na Pré Nota de Entrada após a importação dos itens do PC. 
@author TOTVS
@since 29/03/2017
@version P12
@param nulo            
@return nulo
/*/

/**********************/
User Function MT103IPC()
/**********************/

Local aArea := GetArea()

U_RFATE019()

RestArea(aArea)

Return