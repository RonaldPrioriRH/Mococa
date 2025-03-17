#include 'protheus.ch'
#include 'parmtype.ch'

/*/{Protheus.doc} F470ALLF

http://tdn.totvs.com.br/pages/releaseview.action?pageId=6071573

Este ponto de entrada permite a sinalização de que deve ser feito o  tratamento do extrato
utilizando o filtro da filial corrente.A rotina de Extrato Bancario dispõe de tratamentos para
que a filial do SE5 não seja filtrada caso quando 'SA6 exclusivo' e 'SE5 compartilhado'.
Esse controle é feito garantir a integridade do Extrato Bancário.
No entanto,  o cliente pode utilizar suas tabelas nessa configuração e ainda assim ter somente 1 filial
ou todos os movimentos bancários na mesma filial. Para tal, foi disponibilizado um Ponto de
Entrada para que possa ser sinalizado que quer o tratamento do extrato utilizando o filtro da filial corrente.

@author danilo
@since 08/01/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
user function F470ALLF()

	Local lAllFil := .T.

return lAllFil