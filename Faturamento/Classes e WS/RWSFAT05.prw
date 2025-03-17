#Include 'Protheus.ch'

/*/{Protheus.doc} RWSFAT05

Web Service para integração Protheus x SGAC
Processamento do metodo CONSULTA_COMISSAO

@author TOTVS
@since 17/02/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

User Function RWSFAT05(oEnv, oRet)

	Local lOk := .T.
	Local cMsgErr 	:= ""
	Local cMsgSuss 	:= "Percentual de comissão obtido com sucesso!"
	//Local cTes, nPrcTab, nPrcLst
	
	if empty(oEnv:cProduto)
		cMsgErr := "Informe um codigo de produto!"
		lOk := .F.
	elseif lOK .AND. empty(Posicione("SB1",1,xFilial("SB1")+oEnv:cProduto,"B1_COD"))
		cMsgErr := "Produto informado não encontrado na base."
		lOk := .F.
	endif
	
	if lOK .AND. empty(oEnv:cVendedor)
		cMsgErr := "Informe um Vendedor!"
		lOk := .F.
	elseif lOK .AND. empty(Posicione("SA3",1,xFilial("SA3")+oEnv:cVendedor,"A3_COD"))
		cMsgErr := "Vendedor informado não encontrado na base."
		lOk := .F.
	endif
	
	if lOK
		
		//chamo metodo
		M->C6_PRODUTO := SB1->B1_COD
		M->C5_CLIENTE := oEnv:cClient
		M->A1_EST     := oEnv:cEst
		
		Conout(">>  RWSFAT05 CALCCOMISSAO - CLIENTE: " + M->C5_CLIENTE)
		Conout(">>  RWSFAT05 CALCCOMISSAO - ESTADO: " + M->A1_EST )
		oRet:nPercComissao := U_RFINE001(SA3->A3_COD, SC5->C5_CLIENTE, M->A1_EST)
		//oRet:nPercComissao := U_RFINE001(SA3->A3_COD)

	endif
	
	oRet:lRet := lOk
	if lOk
		oRet:cMensagem := cMsgSuss
	else
		oRet:cMensagem := cMsgErr
	endif
	
Return
