#Include 'Protheus.ch'

#Define CRLF chr(13)+chr(10)

/*/{Protheus.doc} RWSFAT03

Web Service para integração Protheus x SGAC
Processamento do metodo CRUD_PEDIDO

@author TOTVS
@since 17/02/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

User Function RWSFAT03(oEnv, oRet)

	Local lOk := .T.
	Local cMsgErr 	:= ""
	Local cMsgSuss 	:= ""
	Local nOpcX := 0
	Local nX
	Local nY := 1
	Local cPvSGAC := ""
	Local aCabAuto := {}
	//Local aCabRemAuto := {}
	Local aIteAuto := {}
	Local cMvBenef := AllTrim(SuperGetMV("MV_XCCBENF")) // Centro de Custo Pedido SGAC Bonificação
	Local cRemTriang := ""
	Local cPVRem := ""
	Local lTriang := .F.

	Local  nCont := 0
	Static cCliRem := ""
	Static cLojRem := ""


	if empty(oEnv:cAcao)
		cMsgErr := "Informe a acao a ser executada!"
		lOk := .F.

	elseif !(oEnv:cAcao $ "IAE")
		cMsgErr := "Acao informada inválida. Deve ser: I=Incluir;A=Alterar;E=Excluir"
		lOk := .F.

	else
		nOpcX := iif(oEnv:cAcao=="I",3,iif(oEnv:cAcao=="A",4,5))

		if nOpcX == 3
			cMsgSuss := "Pedido Incluido com Sucesso"
		elseif nOpcX == 4
			cMsgSuss := "Pedido Alterado com Sucesso"
		elseif nOpcX == 5
			cMsgSuss := "Pedido Excluido com Sucesso"
		endif
	endif

	if lOK .AND. empty(oEnv:nPedidoSGAC)
		cMsgErr := "Informe o numero do pedido SGAC!"
		lOk := .F.
	endif

	if lOK .AND. nOpcX <> 5 //se nao exlusao
		if lOK .AND. empty(CTOD(oEnv:dEmissao))
			cMsgErr := "Informe uma data de emissao valida!"
			lOk := .F.
		else
			dDataBase := CTOD(oEnv:dEmissao) //altero database do processamento
		endif

		if lOK .AND. empty(oEnv:cCliente + oEnv:cLoja)
			cMsgErr := "Informe um codigo e loja de Cliente!"
			lOk := .F.

		elseif lOK .AND. empty(Posicione("SA1",1,xFilial("SA1")+oEnv:cCliente+oEnv:cLoja,"A1_COD"))
			cMsgErr := "Cliente informado não encontrado na base."
			lOk := .F.
		endif

		if lOK .AND. empty(oEnv:cCondPag)
			cMsgErr := "Informe uma Condicao Pagamento!"
			lOk := .F.

		elseif lOK .AND. empty(Posicione("SE4",1,xFilial("SE4")+oEnv:cCondPag,"E4_CODIGO"))
			cMsgErr := "Condicao Pagamento informada não encontrada na base."
			lOk := .F.
		endif

		if lOK .AND. !empty(oEnv:cTabPrc) .AND. empty(Posicione("DA0",1,xFilial("DA0")+oEnv:cTabPrc,"DA0_CODTAB"))
			cMsgErr := "Tabela de Preco informada não encontrada na base."
			lOk := .F.
		endif

		if lOK .AND. empty(oEnv:cVendedor)
			cMsgErr := "Informe um Vendedor!"
			lOk := .F.

		elseif lOK .AND. empty(Posicione("SA3",1,xFilial("SA3")+oEnv:cVendedor,"A3_COD"))
			cMsgErr := "Vendedor informado não encontrado na base."
			lOk := .F.
		endif

		if lOK .AND. !empty(oEnv:cTipoFrete) .AND. !(oEnv:cTipoFrete $ "CFTS")
			cMsgErr := "Tipo frete com sintaxe incorreta. Deve ser: C=CIF;F=FOB;T=Por conta Terceiros;S=Sem Frete"
			lOk := .F.
		endif

		if lOK .AND. oEnv:nDescVBC < 0
			cMsgErr := "Desconto VBC nao pode ser negativo!"
			lOk := .F.
		endif

		if lOK .AND. empty(oEnv:aItensPedido)
			cMsgErr := "Informe pelo menos um produto no pedido!"
			lOk := .F.

		elseif lOK //valida os itens
			For nX := 1 to len(oEnv:aItensPedido)
				lOk := VldItemPv(oEnv:aItensPedido[nX], @cMsgErr)
			next nX
		endif

	endif

	cRemTriang := Posicione("SA1",1,xFilial("SA1")+oEnv:cCliente+oEnv:cLoja,"A1_XTRIANG")

	If (oEnv:cTriang $ "S")
		If AllTrim(cRemTriang) = "S"
			cCliRem := Posicione("SA1",1,xFilial("SA1")+oEnv:cCliente+oEnv:cLoja,"A1_XCLIREM")
			cLojRem := Posicione("SA1",1,xFilial("SA1")+oEnv:cCliente+oEnv:cLoja,"A1_XLOJREM")
			lTriang := .T.
			nY++
		Else
			cMsgErr := "Cadastro do cliente não está configurado para operação de Triangulação!"
			lOk := .F.
		Endif
	EndIf

	Conout(" ( Triangulacao) : "+(cRemTriang) +" ( Cliente Loja Remessa) :" +(cCliRem)+(cLojRem)  )
 
	//For nY := 1 to 2 // Rede 10
	While nCont < nY

		aCabAuto := {}
		aIteAuto := {}

		if lOK

			cPvSGAC := StrZero(val(oEnv:nPedidoSGAC), TamSx3("C5_XPVSGAC")[1])

			//posiciono no pedido
			SC5->(dbOrderNickName("PVSGAC"))//C5_FILIAL+C5_XPVSGAC

			If nCont == 1 .And. nOpcX <> 3
				SC5->(dbOrderNickName("PVREMSGAC"))//C5_FILIAL+C5_XPVREMS      	
			EndIf

			if SC5->(DbSeek(xFilial("SC5")+cPvSGAC))

				if nOpcX == 3  .And. nCont < 1 //valida: se achou e é inclusao, aborta e desconsidera o segundo a numeração PV Remessa
					//if nOpcX == 3 //valida: se achou e é inclusao, aborta
					cMsgErr := "Pedido SGAC "+oEnv:nPedidoSGAC+" já incluido, com numero "+SC5->C5_NUM+" no Proheus !"
					lOK := .F.
				else
					If nCont < 1
						oRet:cPedidoProtheus := SC5->C5_NUM
					EndIf

					aAdd(aCabAuto, {"C5_FILIAL" , SC5->C5_FILIAL	, nil})

					If nCont < 1
						aAdd(aCabAuto, {"C5_NUM"   	, SC5->C5_NUM		, nil})
					Else
						cPVRem := BuscarPVRem(cPvSGAC)

						If !Empty(cPVRem)
							aAdd(aCabAuto, {"C5_NUM"   	, cPVRem		, nil})
						EndIf
					EndIf

					//Verifico se ja faturou D2_FILIAL+D2_PEDIDO+D2_ITEMPV
					if lOK .AND. !empty(Posicione("SD2",8,xFilial("SD2")+SC5->C5_NUM,"D2_DOC"))
						cMsgErr := "Pedido "+SC5->C5_NUM+" no Protheus ja faturado! Ação nao permitida."
						lOK := .F.
					endif

					//verifico se está em carga: DAI_FILIAL+DAI_PEDIDO+DAI_COD+DAI_SEQCAR
					if lOK .AND. !empty(Posicione("DAI",4,xFilial("DAI")+SC5->C5_NUM,"DAI_COD"))
						cMsgErr := "Pedido "+SC5->C5_NUM+" vinculado a Carga "+DAI->DAI_COD+" ! Ação nao permitida."
						lOK := .F.
					endif
				endif
			elseif nOpcX <> 3
				cMsgErr := "Pedido "+oEnv:nPedidoSGAC + " não encontrado no Protheus!"
				lOK := .F.
			endif

			if lOK .AND. nOpcX == 3 .OR. nOpcX == 4

				aAdd(aCabAuto, {"C5_TIPO"   , "N"           , nil}) // TIPO DO PEDIDO

				If nCont = 1 // NF Remessa
					aAdd(aCabAuto, {"C5_CLIENTE", cCliRem   , nil}) // CÓDIGO DO CLIENTE
					aAdd(aCabAuto, {"C5_LOJACLI", cLojRem   , nil}) // LOJA DO CLIENTE
				Else
					aAdd(aCabAuto, {"C5_CLIENTE", SA1->A1_COD   , nil}) // CÓDIGO DO CLIENTE
					aAdd(aCabAuto, {"C5_LOJACLI", SA1->A1_LOJA  , nil}) // LOJA DO CLIENTE
				EndIf
				if nOpcX == 3
					aAdd(aCabAuto, {"C5_EMISSAO", dDataBase     , nil}) // DATA DE EMISSÃO
				endif
				aAdd(aCabAuto, {"C5_CONDPAG", SE4->E4_CODIGO , nil}) // CONDIÇÃO
				if !empty(oEnv:cTabPrc)
					aAdd(aCabAuto, {"C5_XPVSGAC", DA0->DA0_CODTAB	 , nil}) // TABELA PREÇO
				endif
				aAdd(aCabAuto, {"C5_VEND1", SA3->A3_COD			 , nil}) // VENDEDOR

				if !empty(oEnv:cTipoFrete)
					aAdd(aCabAuto, {"C5_TPFRETE", oEnv:cTipoFrete	 , nil}) // TIPO FRETE
				endif

				if !empty(oEnv:cBonifica) .AND. (oEnv:cBonifica $ "S")
					aAdd(aCabAuto, {"C5_XCC", cMvBenef	 , nil}) // CENTRO DE CUSTO BONIFICAÇÃO
				endif

				aAdd(aCabAuto, {"C5_FRETE", oEnv:nVlrFrete		 , nil}) // VALOR FRETE

				If !(lTriang = .T. .And. nCont < 1)
					aAdd(aCabAuto, {"C5_XFILEST", oEnv:cFilEst		 , nil}) // FILIAL ESTOQUE
				EndIf
				aAdd(aCabAuto, {"C5_XFILINT", oEnv:cFilInt		 , nil}) // FILIAL INTERMEDIARIA
				aAdd(aCabAuto, {"C5_XOBSNF", oEnv:cObsNF		 , nil}) // OBS NOTA
				aAdd(aCabAuto, {"C5_XOBSPV", oEnv:cObsPedido	 , nil}) // OBS PEDIDO
				aAdd(aCabAuto, {"C5_XVBCDES", oEnv:nDescVBC		 , nil}) // DESCONTO VBC TOTAL
				If nCont = 1 // NF Remessa
					//aAdd(aCabAuto, {"C5_XPVSGAC", 'REMESSA'		 	 , nil}) // REMESSA Removi Eduardo
					aAdd(aCabAuto, {"C5_XPVREMS", cPvSGAC		 	 , nil}) // GRAVO PVSGAC ORIGEM NO PV REMESSA
				Else
					aAdd(aCabAuto, {"C5_XPVSGAC", cPvSGAC		 	 , nil}) // PEDIDO SGAC
				EndIf
				For nX := 1 to len(oEnv:aItensPedido)

					Posicione("SB1",1,xFilial("SB1")+oEnv:aItensPedido[nX]:cProduto,"B1_COD")

					if nOpcX == 4
						DbSelectArea("SC6")
						SC6->(DbSetOrder(2)) //C6_FILIAL+C6_PRODUTO+C6_NUM+C6_ITEM
						if SC6->(DbSeek(xFilial("SC6")+SB1->B1_COD+SC5->C5_NUM))
							cItem := SC6->C6_ITEM
						else
							cItem := StrZero(0, TamSx3("C6_ITEM")[1])
							//pego o ultimo + 1
							SC6->(DbSetOrder(1)) //C6_FILIAL+C6_NUM+C6_ITEM+C6_PRODUTO
							SC6->(DbSeek(xFilial("SC6")+SC5->C5_NUM))
							While SC6->(!Eof()) .AND. SC6->C6_FILIAL+SC6->C6_NUM == xFilial("SC6")+SC5->C5_NUM
								if SC6->C6_ITEM > cItem
									cItem := SC6->C6_ITEM
								endif
								SC6->(DbSkip())
							enddo
							cItem := Soma1(cItem)
						endif
					else
						cItem := StrZero(nX, TamSx3("C6_ITEM")[1])
					endif

					AddItemPv(cItem, @aIteAuto, oEnv:aItensPedido[nX], oEnv:lLibera, cPvSGAC, oEnv:cVendedor, oEnv:cFil, nCont)

				next nX

				if empty(aIteAuto)
					cMsgErr := "Falha ao montar array de itens para execauto!"
					lOK := .F.
				elseif nOpcX == 4  //se tem itens, verifico se há algum ja gravado que deve ser excluido

					SC6->(DbSetOrder(1)) //C6_FILIAL+C6_NUM+C6_ITEM+C6_PRODUTO
					SC6->(DbSeek(xFilial("SC6")+SC5->C5_NUM))
					While SC6->(!Eof()) .AND. SC6->C6_FILIAL+SC6->C6_NUM == xFilial("SC6")+SC5->C5_NUM
						if aScan(aIteAuto, {|x| x[2,2] == SC6->C6_PRODUTO }) == 0 //se nao encontrou
							//deletar
							DelItemPv(aIteAuto)
						endif
						SC6->(DbSkip())
					enddo

					//ordeno vetor
					ASORT(aIteAuto, , , { |x,y| x[1,2] < y[1,2] } )

				endif

			endif

			if lOk

				if nOpcX == 5 //exclusao
					if TemEmpenho()
						//Estorna empenho do pedido na Filial Origem
						if !ExcEmpenho()
							lOk := .F.
							cMsgErr := "Não foi possível estornar empenho do pedido!"
						endif
					endif
				endif

				if lOk

					Private lMsErroAuto := .F.

					MSExecAuto({|x,y,z| Mata410(x,y,z)}, aCabAuto, aIteAuto, nOpcX)

					If lMsErroAuto
						lOk := .F.
						cMsgErr := "Falha execauto do pedido de vendas! "
						cMsgErr += U_NoChrEsp(SubStr(MostraErro("\temp"),1,200))+" ..."
						MemoWrite("C:\temp\ErroExecAuto.txt",cMsgErr)
					else
						if nOpcX == 3
							If nCont < 1 // NF Remessa
								oRet:cPedidoProtheus := SC5->C5_NUM
							EndIf
						endif
					endif

				endif

			endif

			If nCont < 1 // NF Remessa
				//retorno mesmo codigo do SGAC
				oRet:nPedidoSGAC := oEnv:nPedidoSGAC
			EndIf

		endif

		If nCont < 1 // NF Remessa
			oRet:lRet := lOk
			if lOk
				oRet:cMensagem := cMsgSuss
			else
				oRet:cMensagem := cMsgErr
			endif
		EndIf
		nCont++
	enddo
	//Next nY	//Fim Rede 10

Return

//--------------------------------------------------------------------
// Valida item do pedido
//--------------------------------------------------------------------
Static Function VldItemPv(oItem, cMsgErr)

	Local lOk := .T.
	Local cProd := ""

	if empty(oItem:cProduto)
		cMsgErr := "Informe um codigo de produto!"
		lOk := .F.
	elseif lOK .AND. empty(Posicione("SB1",1,xFilial("SB1")+oItem:cProduto,"B1_COD"))
		cMsgErr := "Produto "+oItem:cProduto+" informado não encontrado na base."
		lOk := .F.
	else
		cProd := "Produto "+oItem:cProduto
	endif

	if lOK .AND. empty(oItem:nQuant)
		cMsgErr := "Informe a quantidade! "+ cProd
		lOk := .F.
	elseif lOK .AND. oItem:nQuant < 0
		cMsgErr := "Quantidade não pode ser negativa. "+ cProd
		lOk := .F.
	endif

	if lOK .AND. empty(oItem:nPreco)
		cMsgErr := "Informe o Preco Venda Unitario! "+ cProd
		lOk := .F.
	elseif lOK .AND. oItem:nPreco < 0
		cMsgErr := "Preco Venda Unitario não pode ser negativo. "+ cProd
		lOk := .F.
	endif

	if lOK .AND. empty(oItem:nPrcTabela)
		cMsgErr := "Informe o Preco Tabela Unitario! "+ cProd
		lOk := .F.
	elseif lOK .AND. oItem:nPrcTabela < 0
		cMsgErr := "Preco Tabela Unitario não pode ser negativo. "+ cProd
		lOk := .F.
	endif

	if lOK .AND. empty(oItem:cTipoOper)
		cMsgErr := "Informe um Tipo de Operacao! "+ cProd
		lOk := .F.
	elseif lOK .AND. empty(Posicione("SFM",1,xFilial("SFM")+oItem:cTipoOper,"FM_TIPO"))
		cMsgErr := "Tipo de Operação não configurado como TES Inteligente. "+ cProd
		lOk := .F.
	endif

Return lOk

//Adiciona item ao array do execauto
Static Function AddItemPv(cItem, aIteAuto, oItem, lLibera, cPvSGAC, cVendedor, cFilColab, nCont)

	Local aAux := {}
	Local cVendColab := AllTrim(GetMV("MV_XVENDA3"))
	Local cArmColab	 := AllTrim(GetMV("MV_XARMSA3"))
	Local cC6Oper    := SuperGetMv("FT_OPEREM",,"") //Operação NF Remessa 18

	oItem:nQuant := Round(oItem:nQuant, 2) //arredondado a pedido da mococa.
	oItem:nPreco := Round(oItem:nPreco, 2) //arredondado a pedido da mococa.

	aAdd(aAux, {"C6_ITEM"   , cItem                       			, nil}) //  ITEM DO PEDIDO
	aAdd(aAux, {"C6_PRODUTO", SB1->B1_COD             				, nil}) //  CÓDIGO DO PRODUTO
	aAdd(aAux, {"C6_QTDVEN" , oItem:nQuant              			, nil}) //  QUANTIDADE VENDIDA
	aAdd(aAux, {"C6_PRCVEN" , oItem:nPreco   						, nil}) //  PREÇO DE VENDA
	aAdd(aAux, {"C6_PRUNIT" , oItem:nPreco   						, nil}) //  PREÇO DE VENDA
	aAdd(aAux, {"C6_XPRCORI", oItem:nPrcTabela   					, nil}) //  PREÇO DE TABELA
	//aAdd(aAux, {"C6_VALOR"  , NoRound(oItem:nQuant*oItem:nPreco,2)  , nil}) //  VALOR TOTAL

	If nCont == 1 // NF Remessa fixado para TESTE PV SGAC
		aAdd(aAux, {"C6_OPER"   , cC6Oper                   	, nil}) //  TIPO OPERAÇÃO
	Else
		aAdd(aAux, {"C6_OPER"   , oItem:cTipoOper                    	, nil}) //  TIPO OPERAÇÃO
	EndIf
	if lLibera
		aadd(aAux, {"C6_QTDLIB" , oItem:nQuant						, nil}) //  LIBERAÇAO ESTOQUE AUTOMATICA
	endif

	//Caique Mercadante Armazém Venda Colaborador do 09 para 77
	Conout(" ( Pedido Colaborador) : "+(cPvSGAC)+ "Vendedor: "+cVendedor+ "Filial" +cFilColab)
	If !empty(cPvSGAC) .And. AllTrim(cVendedor) = cVendColab .And. cFilColab = '0102'
		aAdd(aAux, {"C6_LOCAL" , cArmColab  						, nil}) //  Armazém Venda Colaborador
	Endif

	if !empty(CTOD(oItem:dDataEntrega))
		aAdd(aAux, {"C6_ENTREG" , CTOD(oItem:dDataEntrega)         	, nil}) //  DATA ENTREGA
	endif
	aAdd(aAux, {"C6_COMIS1" , oItem:npercomiss                   	, nil}) //  % De comissão (Marcos Godinho 11_04_2019)
	aAdd(aAux, {"C6_XVBCPDS" , oItem:nPerDescVBC                   	, nil}) //  % Desconto VBC
	aAdd(aAux, {"C6_XVBCDES" , oItem:nVlrDescVBC                   	, nil}) //  Valor Descontoo VBC
	aAdd(aAux, {"C6_XVBCMOT" , oItem:cMotivoDesc                   	, nil}) //  Motivo Desconto
	aAdd(aAux, {"C6_XVBCVER" , oItem:nVerbaVBC                   	, nil}) //  Verba.VBC

	//aAdd(aAux, {"C6_ITEMPC"  , cItem   // Item para importar o xml
	//aAdd(aAux, {"C6_ITEMPC"  , oItem:cItem             				, nil}) //  Item para importar o xml
	aAdd(aAux, {"C6_ITEMPC"  , IIF(!EMPTY(oItem:cItem), oItem:cItem ,cItem), nil}) //  Item para importar o xml
	aAdd(aAux, {"C6_NUMPCOM" , oItem:cOP  							, nil}) //  Numero da ordem de compra

	aAdd(aIteAuto, aClone(aAux) )

Return

//Adiciona item ao array do execauto, para exlcuir item
Static Function DelItemPv(aIteAuto)

	Local aAux := {}

	aAdd(aAux, {"C6_ITEM"   , SC6->C6_ITEM                 			, nil}) //  ITEM DO PEDIDO
	aadd(aAux, {"AUTDELETA" ,"S"									, Nil}) //  DELETA LINHA
	aAdd(aAux, {"C6_PRODUTO", SC6->C6_PRODUTO             			, nil}) //  CÓDIGO DO PRODUTO
	aAdd(aAux, {"C6_QTDVEN" , SC6->C6_QTDVEN             			, nil}) //  QUANTIDADE VENDIDA
	aAdd(aAux, {"C6_PRCVEN" , SC6->C6_PRCVEN						, nil}) //  PREÇO DE VENDA
	aAdd(aAux, {"C6_VALOR"  , SC6->C6_VALOR  						, nil}) //  VALOR TOTAL

	aAdd(aIteAuto, aClone(aAux) )

Return

//----------------------------------------------------------------
// Verifica se no pedido tem itens empenhados ou não
//----------------------------------------------------------------
Static Function TemEmpenho()

	Local lRet := .F.
	Local aAreaSC6 := SC6->(GetArea())

	DbSelectArea("SC6")
	SC6->(dbSetOrder(1))
	If SC6->(MsSeek(xFilial("SC6")+SC5->C5_NUM))
		While SC6->(!Eof()) .And. SC6->C6_FILIAL+SC6->C6_NUM == xFilial("SC6")+SC5->C5_NUM

			if SC6->C6_QTDEMP > 0 //se tem saldo empenhado
				lRet := .T.
				EXIT
			endif

			SC6->(dbSkip())
		EndDo
	Endif

	RestArea(aAreaSC6)

Return lRet

//----------------------------------------------------------------
// faz exclusão/estorno do empenho do pedido
//----------------------------------------------------------------
Static Function ExcEmpenho()

	Local lRet := .T.
	Local aAreaSC6 := SC6->(GetArea())

	BeginTran()

	DbSelectArea("SC6")
	SC6->(dbSetOrder(1))
	If SC6->(MsSeek(xFilial("SC6")+SC5->C5_NUM))
		While SC6->(!Eof()) .And. SC6->C6_FILIAL+SC6->C6_NUM == xFilial("SC6")+SC5->C5_NUM

			if SC6->C6_QTDEMP > 0 //se tem saldo empenhado
				dbSelectArea("SC9")
				dbSetOrder(1)
				If MsSeek(xFilial("SC9")+SC6->C6_NUM+SC6->C6_ITEM)
					SC9->(a460Estorna())
				Endif
			endif

			if SC6->C6_QTDEMP > 0 //se continua empenhado, deu algum erro
				lRet := .F.
				EXIT
			endif

			SC6->(dbSkip())
		EndDo
	Endif

	if lRet
		EndTran()
	else
		DisarmTransaction()
	endif

	RestArea(aAreaSC6)

Return lRet

Static Function BuscarPVRem(cPvSGAC)

	Local cQuery 	as character
	Local cNumPed	as character

	cQuery := "SELECT c5_num"
	cQuery += " FROM " + RetSqlName("SC5") + " sc5"
	cQuery += " WHERE c5_filial = '" + FWxFilial("SC5") + "'"
	cQuery += " AND c5_xpvrems = '" + cPvSGAC + "'"
	cQuery += " AND d_e_l_e_t_ = ' '"

	cNumPed := MpSysExecScalar(cQuery, "c5_num")

Return cNumPed
