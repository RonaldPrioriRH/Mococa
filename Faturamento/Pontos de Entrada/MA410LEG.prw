#include "protheus.ch" 

/*/{Protheus.doc} MA410LEG
Ponto de entrada Usado, em conjunto com o ponto MA410COR, para alterar os textos da legenda, que representam 
o “status” do pedido.
@author TOTVS
@since 29/03/2017
@version P12
@param nulo            
@return nulo
/*/

/***********************/
User Function MA410LEG()
/***********************/

Local aArea 	:= GetArea()
Local aLegenda	:= {}

aLegenda := U_RFATE016()

RestArea(aArea)

Return aLegenda