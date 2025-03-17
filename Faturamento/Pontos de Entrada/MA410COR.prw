#include "protheus.ch" 

/*/{Protheus.doc} MA410COR
Ponto de entrada usado em conjunto com o ponto MA410LEG,para alterar cores do “browse” do cadastro, que 
representam o “status” do pedido.
@author TOTVS
@since 29/03/2017
@version P12
@param nulo            
@return nulo
/*/

/***********************/
User Function MA410COR()
/***********************/

Local aArea 	:= GetArea()
Local aLegenda	:= {}

aLegenda := U_RFATE015()

RestArea(aArea)

Return aLegenda