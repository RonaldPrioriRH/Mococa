#Include 'Protheus.ch'

/*/{Protheus.doc} RCOME013
Realiza Baixa do Ticket Z19 após lançamento da NF de Entrada
@author Caique Mercadante
@since 22/08/2022
@version P12
@param nOpcao,nConfirma
@return nulo
/*/

User Function RCOME013(nOpcao,nConfirma)

	Local aAreaSF1 		:= SF1->(GetArea())
	Local aAreaSD1 		:= SD1->(GetArea())
	Local lContinue		:= .F.
	Local cProduto		:= ""
	Local cTicket		:= ""
	Local cFornecedor	:= ""
	Local cLoja			:= ""
	Local cNotaFiscal	:= ""
	Local cSerie		:= ""


	DbSelectArea("SD1")
	SD1->(DbSetOrder(1))

	DbSelectArea("SB1")
	SB1->(DbSetOrder(1))

	//Valida se rotina será executada
	if FunName() == "MATA103" .OR. FunName() == "U_GATI001" .OR. allTrim(FunName()) == "RESTA002"//Chamada da inclusao do documento de entrada
		If nOpcao == 3 .AND. nConfirma == 1		// Inclusao
			lContinue := .T.
		Elseif nOpcao == 4 .AND. nConfirma == 1 // Classificação
			lContinue := .T.
		Endif
	Endif

	If lContinue
		if SD1->(DbSeek(xFilial("SD1")+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA))
			//
			cProduto	:= SD1->D1_COD
			cTicket		:= SD1->D1_XTICKET
			cFornecedor	:= SD1->D1_FORNECE
			cLoja		:= SD1->D1_LOJA
			cNotaFiscal	:= SD1->D1_DOC
			cSerie		:= SD1->D1_SERIE

			While SD1->(!EOF()) .AND. SD1->D1_FILIAL+SD1->D1_DOC+SD1->D1_SERIE+SD1->D1_FORNECE+SD1->D1_LOJA == xFilial("SF1")+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA

				//Valido se foi vinculado ticket pesagem ao documento entrada
				If !Empty(SD1->D1_XTICKET)
					If SB1->(DbSeek(xFilial("SB1")+SD1->D1_COD)) //Removido para baixar os tickets utilizados .AND. SB1->B1_XSPOT == "S" // Valida se produto é Leite Spot

						if nOpcao == 3 .OR. nOpcao == 4
							U_BxTicket(xFilial("Z19"), cTicket , "B")
						endif

					Endif
				Endif

				SD1->(DbSkip())

			EndDo
		Endif
	Endif


	RestArea(aAreaSF1)
	RestArea(aAreaSD1)

Return
