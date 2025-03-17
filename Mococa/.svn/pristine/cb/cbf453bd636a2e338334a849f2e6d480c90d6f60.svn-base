#Include 'Protheus.ch'

/*/{Protheus.doc} RCOME004
Gera ocorrencia de pesagem quando produto for Leite Spot
@author TOTVS
@since 12/05/2017
@version P12
@param nOpcao,nConfirma
@return nulo
/*/

User Function RCOME004(nOpcao,nConfirma)

	Local aAreaSF1 		:= SF1->(GetArea())
	Local aAreaSD1 		:= SD1->(GetArea())
	Local aLotes		:= {}
	Local lContinue		:= .F.
	Local cProduto		:= ""
	Local cTicket		:= ""
	Local cArmazem		:= ""
	Local cFornecedor	:= ""
	Local cLoja			:= ""
	Local cNotaFiscal	:= ""
	Local cSerie		:= ""
	Local nCusto		:= 0			
	Local nQuantidade	:= 0
	Local cSpot 		:= "" 	
	
	
	DbSelectArea("SD1")
	SD1->(DbSetOrder(1))

	DbSelectArea("SB1")
	SB1->(DbSetOrder(1))

	//Valida se rotina será executada
	if FunName() == "MATA103" .OR. FunName() == "U_GATI001" //Chamada da inclusao do documento de entrada
		If nOpcao == 3 .AND. nConfirma == 1		// Inclusao
			lContinue := .T.
		Elseif nOpcao == 4 .AND. nConfirma == 1 // Classificação
			lContinue := .T.
		Elseif nOpcao == 5 .AND. nConfirma == 1 // Exclusao
			EstOcorre() // Estorna Ocorrencia
			lContinue := .F.
		Endif
	Endif

	If lContinue
		if SD1->(DbSeek(xFilial("SD1")+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA))
			//
			cProduto	:= SD1->D1_COD
			cTicket		:= SD1->D1_XTICKET
			cArmazem	:= SD1->D1_LOCAL
			cFornecedor	:= SD1->D1_FORNECE
			cLoja		:= SD1->D1_LOJA
			cNotaFiscal	:= SD1->D1_DOC
			cSerie		:= SD1->D1_SERIE
			nCusto		:= SD1->D1_CUSTO
				
			While SD1->(!EOF()) .AND. SD1->D1_FILIAL+SD1->D1_DOC+SD1->D1_SERIE+SD1->D1_FORNECE+SD1->D1_LOJA == xFilial("SF1")+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA

				//Valido se foi vinculado ticket pesagem ao documento entrada
				If !Empty(SD1->D1_XTICKET)
					If SB1->(DbSeek(xFilial("SB1")+SD1->D1_COD)) .AND. SB1->B1_XSPOT == "S" // Valida se produto é Leite Spot
						
						if nOpcao == 3 .OR. nOpcao == 4
						
							nQuantidade	+= SD1->D1_QUANT //somo a quantidade para realizar a validacao da diferenca
							
							//salvo os lotes, pois no movimento interno de devolucao nao sera possivel o lancamento da quantidade superior a entrada
							//daquele lote na nota
							if ( nPosLote := aScan(aLotes,{|x| Alltrim(x[1]) == alltrim(SD1->D1_LOTECTL ) } ) )
								
								aLotes[nPosLote,2]	+= SD1->D1_QUANT 
								 
							else
								Aadd(aLotes,{SD1->D1_LOTECTL,SD1->D1_QUANT})
							endif
							
							
						elseif nOpcao == 5
						
							EstOcorre() 	// Estorna Ocorrencia
						
						endif
						
					Endif
				Endif

				SD1->(DbSkip())
				
				if nOpcao == 3 .OR. nOpcao == 4
					
					//se trocou o produto ou ticket , faco a validacao da pesagem
					if nQuantidade > 0 .And. (	SD1->D1_FILIAL <> xFilial("SF1") .Or. SD1->D1_DOC <> SF1->F1_DOC .Or. SD1->D1_SERIE <> SF1->F1_SERIE .Or.;
												SD1->D1_FORNECE <> SF1->F1_FORNECE .Or. SD1->D1_LOJA <> SF1->F1_LOJA .Or. cProduto <> SD1->D1_COD .Or.;
												cTicket <> SD1->D1_XTICKET ) 
				   		 
						//Realizar alteração para realizar ajuste de ticker de pesagem apenas para produtos B1_XSPOT == 'S'
						cSpot :=  AllTrim(Posicione("SB1",1,xFilial("SB1")+cProduto,"B1_XSPOT"))

						If cSpot == "S" //.And.  !Empty(cTicket)
							ValidaPeso(cProduto,cTicket,nQuantidade,aLotes,cArmazem,cFornecedor,cLoja,cNotaFiscal,cSerie,nCusto) 	// Gera Ocorrencia
						EndIf

						nQuantidade		:= 0 
						cProduto		:= SD1->D1_COD
						cTicket			:= SD1->D1_XTICKET
						cArmazem		:= SD1->D1_LOCAL
						cFornecedor		:= SD1->D1_FORNECE
						cLoja			:= SD1->D1_LOJA
						cNotaFiscal		:= SD1->D1_DOC
						cSerie			:= SD1->D1_SERIE
						nCusto			:= SD1->D1_CUSTO
					
					endif
					
				
				endif
				
			EndDo
		Endif
	Endif


	RestArea(aAreaSF1)
	RestArea(aAreaSD1)

Return


//--------------------------------------------------------------
// Faz Verificação se peso informado na NF difere da balanca  --
//--------------------------------------------------------------
Static Function ValidaPeso(cProduto,cTicket,nQuantidade,aLotes,cArmazem,cFornecedor,cLoja,cNotaFiscal,cSerie,nCusto)

	//Local cAliasP 	:= ""
	Local cOperacao := ""
	Local nSaldo	:= 0
	Local nPesoLiq  := 0
	Local nX		:= 0 
	

	DbSelectArea("Z19")
	Z19->(DbSetOrder(1))

	DbSelectArea("ZEJ")
	ZEJ->(DbSetOrder(2))

	//Verifico se ja foi gravado ocorrencia e abandono se sim
	If ZEJ->(DbSeek(xFilial("ZEJ")+cFornecedor+cLoja+cProduto+cTicket))
		Return
	Endif

	//Posicione no ticket para pegar a pesagem
	If Z19->(DbSeek(xFilial("Z19") + cTicket ))

		//Acho peso liquido
		nPesoLiq := Z19->Z19_P1 - Z19->Z19_P2
		if Z19->Z19_DENS > 0 //fator densidade
			nPesoLiq := nPesoLiq / Z19->Z19_DENS
			nPesoLiq := Round(nPesoLiq, TamSx3("D1_QUANT")[2])
		endif

		//Peso Menor na NF Gera Nota de Acrescimo
		If nQuantidade < nPesoLiq

			nSaldo 		:= nPesoLiq - nQuantidade
			cOperacao	:= '2' // Acrescimo

		//Peso Maior Nf gera Devoluçao
		Elseif nQuantidade > nPesoLiq

			nSaldo 		:= nQuantidade - nPesoLiq
			cOperacao	:= '1' // Devolução

		Endif
		
		// Se houve diferenca no peso aferido executa rotina de gravao da Ocorrencia
		if nSaldo != 0

			//Grava Ocorrencia da divergencia
			If Reclock("ZEJ",.T.)
				ZEJ->ZEJ_FILIAL := xFilial("ZEJ")
				ZEJ->ZEJ_CODIGO := GetSxeNum("ZEJ","ZEJ_CODIGO")
				ZEJ->ZEJ_NUM 	:= cNotaFiscal
				ZEJ->ZEJ_SERIE  := cSerie
				ZEJ->ZEJ_FORNEC := cFornecedor
				ZEJ->ZEJ_LOJA   := cLoja
				ZEJ->ZEJ_PRODUT := cProduto
				ZEJ->ZEJ_PESONF := nQuantidade
				ZEJ->ZEJ_PESO   := nPesoLiq
				ZEJ->ZEJ_DIFERE := nSaldo
				ZEJ->ZEJ_OPERAC := cOperacao
				ZEJ->ZEJ_STATUS := 'A'
				ZEJ->ZEJ_TICKET := cTicket
				ZEJ->ZEJ_DATA   := dDataBase
				ZEJ->ZEJ_ENTFIL := 'N'

				ZEJ->(MsUnlock())

				ZEJ->(ConfirmSx8())
			Endif

			//Em caso de devolucao, valido a quantidade a ser lancada em cada lote 
			if cOperacao == '1'
			
				For nX := 1 To Len(aLotes)
					
					If aLotes[nX,2] >= nSaldo  
						
						//Ajusta estoque via movimentacao interna da diferenca
						RCOMEST01(nSaldo,3,cOperacao,aLotes[nX,1],cProduto,cArmazem,cFornecedor,cLoja,cNotaFiscal,cSerie,nCusto,nQuantidade)
						
						Exit
						
					else
						
						//lanco a diferenca 
						RCOMEST01(aLotes[nX,2],3,cOperacao,aLotes[nX,1],cProduto,cArmazem,cFornecedor,cLoja,cNotaFiscal,cSerie,nCusto,nQuantidade)
						
						nSaldo := nSaldo - aLotes[nX,2]
						
					endif
					
				
				Next nX
			
			else
			
				//Ajusta estoque via movimentacao interna da diferenca
				RCOMEST01(nSaldo,3,cOperacao,aLotes[1,1],cProduto,cArmazem,cFornecedor,cLoja,cNotaFiscal,cSerie,nCusto,nQuantidade)
			
			endif 
				
		Endif

	Endif

Return

//------------------------------------------------------------------------------
// Estorna ocorrencia de pesagem com divergencia
//------------------------------------------------------------------------------
Static Function EstOcorre()

	Local cOperacao := ""
	Local nSaldo	:= 0

	DbSelectArea("ZEJ")
	ZEJ->(DbSetOrder(2))

	//Posiciono no item da ocorrencia
	If ZEJ->(DbSeek(xFilial("ZEJ")+SD1->D1_FORNECE+SD1->D1_LOJA+SD1->D1_COD+SD1->D1_XTICKET))

		cOperacao := ZEJ->ZEJ_OPERAC
		nSaldo	  := ZEJ->ZEJ_DIFERE

		//Estorna movimento interno
		//Corrigido para os dois Tipos ZEJ
		if cOperacao == '2' .OR. cOperacao == '1'
																																																																																									
			RCOMEST01(nSaldo,5,cOperacao)

		endif

		//Exclui ocorrencia
		If ZEJ->(Reclock("ZEJ",.F.))
			ZEJ->(DbDelete())
			ZEJ->(MsUnlock())
		Endif

	Endif


Return

//------------------------------------------------------------------------------
// Execauto para ajuste da quantidade entrada do produto que pesou maior que NF
// nOpc : 3=Incluir; 5=Estornar
// cOperacao : 1=Devolução; 2=Acrescimo
//------------------------------------------------------------------------------
Static Function RCOMEST01(nSaldo,nOpc,cOperacao,cLoteMov,cProduto,cArmazem,cFornecedor,cLoja,cNotaFiscal,cSerie,nCusto,nQuantidade)

	Local ExpA1 		:= {}
	Local cTm	    	:= SuperGetMv("MV_XTMINC",.F.,'')
	Local cTmEst    	:= SuperGetMv("MV_XTMEST",.F.,'')
	Local cMVCQ			:= GetMV("MV_CQ")
	Local lRet			:= .T.
	Local lTrocaMvCq	:= .F.

	Private lMsErroAuto := .F.

	DbSelectArea("SD3")
	SD3->(DbSetOrder(2))

	ExpA1 := {}

	if nOpc == 3

		AADD(ExpA1,{"D3_FILIAL"		,xFilial("SD3")						,NIL})     		//Filial
		AADD(ExpA1,{"D3_TM"			,iif(cOperacao=='2',cTm,cTmEst)		,NIL})  	    //Tipo Movimento
		AADD(ExpA1,{"D3_COD"		,cProduto							,NIL})     		//Codigo Produto
		AADD(ExpA1,{"D3_LOCAL"		,cArmazem							,NIL})     		//Armazem
		AADD(ExpA1,{"D3_DOC"		,cNotaFiscal						,NIL})			//Doc
		AADD(ExpA1,{"D3_EMISSAO"	,dDataBase							,NIL})          //Data
		AADD(ExpA1,{"D3_QUANT"		,nSaldo								,Nil})			//Quantidade
		AADD(ExpA1,{"D3_LOTECTL"	,cLoteMov							,Nil})			//Lote
		
		//AADD(ExpA1,{"D3_CUSTO1"		,Round(SD1->D1_VUNIT*nSaldo, TamSX3("D3_CUSTO1")[2]),Nil})	//custo
		//Alterado por Claudio 06.12.17 pegar o Custo Unitário da entrada
		//AADD(ExpA1,{"D3_CUSTO1"		,Round((nCusto/nQuantidade)*nSaldo, TamSX3("D3_CUSTO1")[2]),Nil})	//custo
       IF nCusto == 0
                    
        AADD(ExpA1,{"D3_CUSTO1",0.000001,Nil})	//custo
   
       else
       
       		AADD(ExpA1,{"D3_CUSTO1",Round((nCusto/nQuantidade)*nSaldo, TamSX3("D3_CUSTO1")[2]),Nil})	

      endif 
	Else

		If SD3->(DbSeek(xFilial("SD3")+SD1->D1_DOC+SD1->D1_COD))
			While SD3->(!Eof()) .AND. SD3->D3_FILIAL+SD3->D3_DOC+SD3->D3_COD == xFilial("SD3")+SD1->D1_DOC+SD1->D1_COD
				if SD3->D3_ESTORNO <> "S" //nao estornado

					//flag para alterar MV_CQ, para nao dar erro de execauto
					if cMVCQ == SD3->D3_LOCAL
						lTrocaMvCq	:= .T.
					endif

					AADD(ExpA1,{"D3_FILIAL"		,xFilial("SD3")			,NIL})     		//Filial
					AADD(ExpA1,{"D3_NUMSEQ"		,SD3->D3_NUMSEQ			,Nil})			//Sequencia
					AADD(ExpA1,{"D3_CHAVE"		,SD3->D3_CHAVE			,Nil})			//Sequencia
					AADD(ExpA1,{"D3_COD"		,SD3->D3_COD			,NIL})     		//Codigo Produto
					AADD(ExpA1,{"D3_TM"			,iif(cOperacao=='2',cTmEst,cTm),NIL})  	//Tipo Movimento
					AADD(ExpA1,{"INDEX",4,}) //D3_FILIAL+D3_NUMSEQ+D3_CHAVE+D3_COD

					EXIT
				endif
				SD3->(DbSkip())
			enddo
		Endif

	Endif

	if Len(ExpA1) > 0
		Pergunte("MTA240",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto
		if nOpc == 5 .AND. lTrocaMvCq //troco MV_CQ para não validar no execauto
			PutMv( "MV_CQ", "XX" )
		endif
		MSExecAuto({|x,y| mata240(x,y)},ExpA1,nOpc)
		if nOpc == 5 .AND. lTrocaMvCq //volto MV_CQ
			PutMv( "MV_CQ", cMVCQ )
		endif
		if lMsErroAuto
			MostraErro()
			lRet := .F.
		Endif

	Endif

Return lRet
