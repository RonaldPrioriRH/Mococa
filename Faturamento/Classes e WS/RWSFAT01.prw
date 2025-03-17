#Include 'Protheus.ch'

/*/{Protheus.doc} RWSFAT01

Web Service para integração Protheus x SGAC
Processamento do metodo PRECO_CONTRATO

@author TOTVS
@since 17/02/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

User Function RWSFAT01(oEnv, oRet)

	Local lOk := .T.
	Local cMsgErr 	:= ""
	Local cMsgSuss 	:= "Preco calculado com sucesso!"
	Local cTes, nPrcTab, nPrcLst,nPrcLst2
	Local aValores := {}
	Local nPercent := 0

	if empty(oEnv:cProduto)
		cMsgErr := "Informe um codigo de produto!"
		lOk := .F.
	elseif lOK .AND. empty(Posicione("SB1",1,xFilial("SB1")+oEnv:cProduto,"B1_COD"))
		cMsgErr := "Produto informado não encontrado na base."
		lOk := .F.
	endif

	if lOK .AND. empty(oEnv:cCliente + oEnv:cLoja)
		cMsgErr := "Informe um codigo e loja de Cliente!"
		lOk := .F.
	elseif lOK .AND. empty(Posicione("SA1",1,xFilial("SA1")+oEnv:cCliente+oEnv:cLoja,"A1_COD"))
		cMsgErr := "Cliente informado não encontrado na base."
		lOk := .F.
	endif

	if lOK .AND. empty(oEnv:nPreco)
		cMsgErr := "Informe o Preco unitario do produto!"
		lOk := .F.
	endif

	if lOK .AND. empty(oEnv:cTipoOper)
		cMsgErr := "Informe um Tipo de Operacao!"
		lOk := .F.
	elseif lOK .AND. empty(Posicione("SFM",1,xFilial("SFM")+oEnv:cTipoOper,"FM_TIPO"))
		cMsgErr := "Tipo de Operação não configurado como TES Inteligente."
		lOk := .F.
	endif

	if lOK

		cTes := U_MaTesInt(2,oEnv:cTipoOper,SA1->A1_COD,SA1->A1_LOJA,"C",SB1->B1_COD,"C6_TES")


		DbSelectArea("SF4")
		SF4->(DbSetOrder(1)) //F4_FILIAL+F4_CODIGO
		If !empty(cTes) .AND. SF4->(DbSeek(xFilial("SF4")+cTes))

			If SF4->F4_DUPLIC == "S" //Gera financeiro

				//Verifca se deve haver majoração do preço em função de Contrato
				nPrcTab := oEnv:nPreco

				//criado pois chama na função U_RFATE005
				M->C5_TIPO := "N"
				M->C5_TIPOCLI := SA1->A1_TIPO
				//Validado TESTE
				//nPrcLst := U_RFATE005(" ",SA1->A1_COD,SA1->A1_LOJA,SB1->B1_COD,1,cTes,nPrcTab, 0, @nPercent)					
				aValores := U_RFATE005(" ",SA1->A1_COD,SA1->A1_LOJA,SB1->B1_COD,1,cTes,nPrcTab, 0, @nPercent)
				nPrcLst  := aValores[1]
				nPrcLst2 := aValores[2]		
			
				conout("PRECO LISTA: " + cValToChar(nPrcLst))
				conout("PRECO LISTA      2: " + cValToChar(nPrcLst2)) 
				conout("PRECO TABELA : " + cValToChar(nPrcTab))
				
				
				If nPrcLst > nPrcTab .OR. nPrcLst2 > nPrcTab

					oRet:nVlrCtr := (nPrcLst - nPrcTab)
					oRet:nVlrCtr1 := nPrcLst2                                                                                                                                                                                                   
					
					oRet:nPercent := nPercent
					
					
					//conout("LISTA1: " + cValToChar(nVlrCtr))
		
					//conout("LISTA2: " + cValToChar(nVlrCtr))
		
				Endif

			Endif

		else
			cMsgErr := "Nao foi possivel encontrar a TES, a paritr do tipo de operação."
			lOk := .F.
		endif

	endif

	oRet:lRet := lOk
	
	if lOk
		oRet:cMensagem := cMsgSuss
	else
		oRet:cMensagem := cMsgErr
	endif

Return

