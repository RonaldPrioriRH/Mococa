#Include 'Protheus.ch'

/*/{Protheus.doc} RWSFAT02

Web Service para integração Protheus x SGAC
Processamento do metodo CALCULA_IMPOSTOS

@author TOTVS
@since 17/02/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

User Function RWSFAT02(oEnv, oRet)

	Local lOk := .T.
	Local cMsgErr 	:= ""
	Local cMsgSuss 	:= "Impostos calculados com sucesso!"
	//Local cTes //, nPrcTab //, nPrcLst

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

		oRet:nICMS := 0
		oRet:nST := 0
		oRet:nPIS := 0
		oRet:nCOFINS := 0
		oRet:nIPI := 0

		cTes := U_MaTesInt(2,oEnv:cTipoOper,SA1->A1_COD,SA1->A1_LOJA,"C",SB1->B1_COD,"C6_TES")
		conout("RWSFAT02 -> TES: "+cTes)

		DbSelectArea("SF4")
		SF4->(DbSetOrder(1)) //F4_FILIAL+F4_CODIGO
		If !empty(cTes) .AND. SF4->(DbSeek(xFilial("SF4")+cTes))

			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³Inicializa a funcao fiscal                   ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			MaFisSave()
			MaFisEnd()
			MaFisIni(SA1->A1_COD,;							// 1-Codigo Cliente/Fornecedor
				SA1->A1_LOJA,;									// 2-Loja do Cliente/Fornecedor
				"C",;									// 3-C:Cliente , F:Fornecedor
				"N",;									// 4-Tipo da NF
				SA1->A1_TIPO,;							// 5-Tipo do Cliente/Fornecedor
				Nil,;
				Nil,;
				Nil,;
				Nil,;
				"MATA461")

			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³Agrega os itens para a funcao fiscal         ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			MaFisAdd(SB1->B1_COD,;			   									// 1-Codigo do Produto ( Obrigatorio )
				cTes,;				   											// 2-Codigo do TES ( Opcional )
				1,;																// 3-Quantidade ( Obrigatorio )
				oEnv:nPreco,;													// 4-Preco Unitario ( Obrigatorio )
				0,;																// 5-Valor do Desconto ( Opcional )
				"",;	   														// 6-Numero da NF Original ( Devolucao/Benef )
				"",;															// 7-Serie da NF Original ( Devolucao/Benef )
				,;																// 8-RecNo da NF Original no arq SD1/SD2
				0,;																// 9-Valor do Frete do Item ( Opcional )
				0,;																// 10-Valor da Despesa do item ( Opcional )
				0,;																// 11-Valor do Seguro do item ( Opcional )
				0,;																// 12-Valor do Frete Autonomo ( Opcional )
				oEnv:nPreco,;													// 13-Valor da Mercadoria ( Obrigatorio )
				0)																// 14-Valor da Embalagem ( Opiconal )

			oRet:nICMS := MaFisRet(1,"IT_VALICM")
			oRet:nST := MaFisRet(1,"LF_ICMSRET") //MaFisRet(1,"IT_VALSOL")
			oRet:nPIS := MaFisRet(1,"IT_VALPS2")
			oRet:nCOFINS := MaFisRet(1,"IT_VALCF2")
			oRet:nIPI := MaFisRet(1,"IT_VALIPI")
			oRet:nSUFRAMA := MaFisRet(1,"IT_DESCZF") //desoneraçao total suframa
			oRet:nZFICMS := MaFisRet(1,"IT_DESCZF") - MaFisRet(1,"IT_DESCZFPIS") - MaFisRet(1,"IT_DESCZFCOF")
			oRet:nZFPIS := MaFisRet(1,"IT_DESCZFPIS")
			oRet:nZFCOFINS := MaFisRet(1,"IT_DESCZFCOF")

			MaFisEnd()
			MaFisRestore()

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

