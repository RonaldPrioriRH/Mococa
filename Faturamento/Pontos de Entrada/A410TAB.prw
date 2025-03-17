#include "protheus.ch" 

/*/{Protheus.doc} A410TAB
Ponto de entrada pertence � rotina de pedidos de venda, MATA410A(). Est� localizado A410TABELA, 
que retorna o preco de lista considerando grade de produtos. Usado quando existe uma Tabela Especial 
ou quando o Cliente usa a tabela de precos do SIGALOJA. A execu��o deste ponto depende do d�cimo 
par�metro passado para a A410TABELA: se .T. executa, .F. n�o executa. � assumido, por padr�o o valor .T..
@author TOTVS
@since 23/03/2017
@version P12
@param cTabPrc,cCliente,cLoja,cProd,nQtdVen            
@return nulo
/*/

/**********************/
User Function A410TAB()
/**********************/

Local aArea		:= GetArea()
Local nRetPrc	:= 0
Local aValores  := {}

Local cProd		:= ParamIXB[1]
Local cTabPrec	:= ParamIXB[2]
//Local nLin		:= ParamIXB[3]
Local nQtdVen	:= ParamIXB[4]
Local cCliente	:= ParamIXB[5]
Local cLoja		:= ParamIXB[6]
//Local cLoteCtl	:= ParamIXB[7]
//Local cNumLote	:= ParamIXB[8]
//Local lLote		:= ParamIXB[9]

//Contratos
//Validado TESTE 
//nRetPrc := U_RFATE005(cTabPrec,cCliente,cLoja,cProd,nQtdVen)
aValores := U_RFATE005(cTabPrec,cCliente,cLoja,cProd,nQtdVen)
nRetPrc  := aValores[1]

RestArea(aArea)

Return nRetPrc
