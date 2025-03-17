#Include 'Protheus.ch'

/*/{Protheus.doc} M530FIL

Ponto de Entrada Atualizar Pagamento Comissão
PE para Filtrar os vendedores conforme parametros específicos (MATA530)

@author Danilo Brito
@since 21/03/2017
@version P12
@param Nao recebe parametros
@return xRet
/*/

User Function M530FIL()

	Local _cFiltro := " "  
	Local _cFilSQL := " " //filtro em SLQ
	
	//tratamentos para comissão
	//tela para digitar valor do reembolso do frete
	_cFiltro := U_RFINE003(_cFilSQL) //RETIRADO PARA PARAR DE LOCAR OS CADASTROS ELANÇAMENTO DE NOTAS FISCAIS.

Return _cFiltro

