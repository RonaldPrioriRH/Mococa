#Include 'Protheus.ch'

/*/{Protheus.doc} RFINA009

Rotina filtrar titulos na montagem do borderô
quando banco for Fidic

@author Leandro Rodrigues
@since 04/05/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/
User Function RFINA009()

	Local cFiltra := ""
	Local cConsulta := ""
	//Local cQry	:=''
	Local cFilExta  :=''

	//Exibe a tela do filtro e retorna o filtro informado pelo usuario
	cFilExta := BuildExpr("SA1",,cFilExta,.T.) //ultimo parametro faz ja retornar no formato SQL

	//Verifica se banco é um Fidic
	If SA6->A6_XFACTOR == 'S'

		//Inclui filtro na Query de consulta de titulos
		//para listar somente clientes que podem operar com Fidic
		cFiltra := " E1_CLIENTE IN ("
		cFiltra += "		 SELECT A1_COD"
		cFiltra += " 		 FROM " + RETSQLNAME("SA1")+ " A1"
		cFiltra += " 		 WHERE A1.D_E_L_E_T_ <> '*' "
		if !empty(cFilExta)
			cFiltra += " AND " + cFilExta
		endif
		cFiltra += " 		 AND A1_XFACTOR = 'S'
		cFiltra += " 		 AND A1_XFACTOR = 'S')"
		cFiltra += " 		 AND E1_XCHAVE <> ' '

	else
		//cFiltra := " 1 = 1 " //adicionado pois obrigatoriamente deve retornar uma condição

		//ADICIONADO A PEDIDO DO NADRE
		cConsulta := " SELECT A1_COD "
		cConsulta += " FROM " + RetSqlName("SA1") + " SA1"
		cConsulta += " WHERE SA1.A1_FILIAL = '" + xFilial("SA1")+"' "
		cConsulta += " AND SA1.A1_XBORDER <> 'N' "
		if !empty(cFilExta)
			cConsulta += " AND " + cFilExta
		endif
		cConsulta += " AND SA1.D_E_L_E_T_ <> '*' "

		cFiltra := " E1_CLIENTE IN ("+ cConsulta + ")"
		cFiltra += " 		 AND E1_XCHAVE <> ' '

	Endif

Return cFiltra
