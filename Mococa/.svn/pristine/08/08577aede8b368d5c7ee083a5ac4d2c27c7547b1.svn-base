//--------------------------------------------------------------------------
/*/{Protheus.doc} GT1RATCT
//TODO Ponto de entrada responsável por realizar o rateio do valor entre os produtos do CTe
@author ConexãoNF-e
@since 27/11/2018
@version 6
@return return, return_description
@example
(examples)
@see (links_or_references)
/*/
//--------------------------------------------------------------------------
User Function GT1RATCT()
//Local nTipCTe := PARAMIXB[1] // "1"- CTe de Compra, "2" - CTe de Venda
Local aCabecCTe := PARAMIXB[2] // Cabeçalho CTE
Local aItens := PARAMIXB[3] // Itens do CTe
//Local aICMS := PARAMIXB[4] // ICMS do XML
Local nPosItem := aScan(aItens[1],{|x| AllTrim(x[1])=="D1_COD" })
Local nPosVlUn := aScan(aItens[1],{|x| AllTrim(x[1])=="D1_VUNIT" })
Local nPosValt := aScan(aItens[1],{|x| AllTrim(x[1])=="D1_TOTAL" })
Local nPosQtdOri := aScan(aItens[1],{|x| AllTrim(x[1])=="QTDORI" })
Local nPosVlConh := aScan(aCabecCTe, {|x| x[1] == "MV_PAR21"}) // VALOR DO CONHECIMENTO
Local nTotalPes:= 0
Local nVlConhe := 0
Local nI := 0

	//so continua para Cte de Venda
	//If nTipCTe == "1" //Compra
		//Return aItens	
	//EndIf

	If nPosVlUn <= 0
		Aviso("GT1RATCT", "Não foi encontrado o campo 'Valor Unitário'", {"Fechar"}, 2)
		Return Nil
	EndIf

	If nPosValt <= 0
		Aviso("GT1RATCT", "Não foi encontrado o campo 'Valor Total'", {"Fechar"}, 2)
		Return Nil
	EndIf

	// Percorre os itens para puxar o total de paletes
	For nI := 1 To Len(aItens)
		nPesoBruto := aItens[nI][nPosQtdOri][2] * Posicione("SB1",1,xFilial("SB1")+aItens[nI][nPosItem][2],"B1_PESBRU")
		nTotalPes += nPesoBruto //aItens[nI][nPosPalt][2]
	Next nI

	// Total do Frete
	If nPosVlConh > 0
		nVlConhe := aCabecCTe[nPosVlConh][2]
	EndIf

	//Contingência caso não seja possível consultar o total do conhecimento de frete, força pegar da 9 posição
	If nPosVlConh <= 0
		nVlConhe := aCabecCTe[9][2] // Posição [9,2] é que tem o total do Frete 
	EndIf

	//If nVlConhe <= 0
		// Contingência caso não seja possível consultar o total do conhecimento de frete, pega o valor do ICMS
		//nVlConhe := aICMS[4]
		If nVlConhe <= 0
			Aviso("GT1RATCT", "Não foi possível fazer a leitura do valor do conhecimento.", {"Fechar"}, 2)
			Return Nil
		EndIf
	//EndIf

	// Rateio pelo peso
	For nI := 1 To Len(aItens)
		//          VALOR DO FRETE * PESO BRUTO ITEM              / TOTAL PESO DOS ITENS
		If nTotalPes > 0
			nPesoBruto := aItens[nI][nPosQtdOri][2] * Posicione("SB1",1,xFilial("SB1")+aItens[nI][nPosItem][2],"B1_PESBRU")
			nVlPonde := Round((nVlConhe * nPesoBruto) / nTotalPes, 2) // (VALOR * CRITÉRIO / TOTAL DO CRITÉRIO = VALOR PONDERADO)
	
			If nVlPonde <= 0
				nVlPonde := (1 / (10 ** (TamSx3("D1_VUNIT")[2]))) // Quando não existe quantidade de palete, joga 0,00001 com base no decimal
			EndIf
	
			aItens[nI][nPosVlUn][2] := nVlPonde // VALOR UNITÁRIO
			aItens[nI][nPosValt][2] := nVlPonde // VALOR TOTAL
		EndIf	
	Next nI

Return aItens

/*/{Protheus.doc} GTITEMCT
//TODO Ponto de entrada responsável por carregar campos customizados na importação do CT-e
@author ConexãoNF-e
@since 27/11/2018
@version 6
@return return, return_description
@example
(examples)
@see (links_or_references)
/*/
//--------------------------------------------------------------------------
User Function GTITEMCT()
Local aAreaAnt := GetArea()
Local aAreaSD1 := SD1->(GetArea())
Local cTipo := PARAMIXB[1] // "1" Entrada // "2" Saída
//Local aCabecCTe := PARAMIXB[2]
//Local aItensCTe := PARAMIXB[3]
Local aAddCampo := {}
//Local cProduto := ""
//Local nQuant := 0
Local nQtdOrig := 0

	If cTipo == "2" //Venda
		nQtdOrig := SD2->D2_QUANT
		aAdd(aAddCampo,{"QTDORI",  nQtdOrig  , Nil})
	EndIf

	If cTipo == "1" //Compra
		nQtdOrig := SD1->D1_QUANT
		aAdd(aAddCampo,{"QTDORI",  nQtdOrig  , Nil})
	EndIf	
	
	

RestArea(aAreaSD1)
RestArea(aAreaAnt)
Return aAddCampo
