#Include 'Protheus.ch'
#INCLUDE "TOPCONN.CH" 

/*/{Protheus.doc} RWSFAT04

Web Service para integração Protheus x SGAC
Processamento do metodo CONSULTA_CONTRATO

@author TOTVS
@since 17/02/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/
User Function RWSFAT04(oEnv, oRet)

	Local lOk := .T.
	Local cMsgErr 	:= ""
	Local cMsgSuss 	:= ""
	Local nCount := 0
	Local cQry1, cQry2, cQry3
	Local oNewCtr, oNewClausula, oNewCli
	
	/*if empty(oEnv:cCliente + oEnv:cGrupoCli + oEnv:cNumero)
		cMsgErr := "Informe pelo menos um dos parametros: Cliente, Grupo ou Numero."
		lOk := .F.
	endif*/
	
	if lOk
		
		cQry1 := " SELECT * FROM " + RetSqlName("Z09") + " "
		cQry1 += " WHERE ROWNUM <= 50 " //limita quantidade registros
		cQry1 += " AND Z09_FILIAL = '" + xFilial("Z09") + "' "
		cQry1 += " AND D_E_L_E_T_ <> '*' "
		if !empty(oEnv:cCliente+oEnv:cLoja)
			cQry1 += " AND ((Z09_CLIENT = '"+oEnv:cCliente+"' "
			cQry1 += " AND Z09_LOJA = '"+oEnv:cLoja+"') "
			SA1->(DbSetOrder(1))
			if SA1->(DbSeek(xFilial("SA1")+oEnv:cCliente+oEnv:cLoja))
				if !empty(SA1->A1_GRPVEN)
					cQry1 += " OR Z09_GRPCLI = '"+SA1->A1_GRPVEN+"' "
				endif
			endif
			cQry1 += " ) "
		endif
		if !empty(oEnv:cGrupoCli)
			cQry1 += " AND Z09_GRPCLI = '"+oEnv:cGrupoCli+"' "
		endif
		if !empty(oEnv:cNumero)
			cQry1 += " AND Z09_CODIGO = '"+oEnv:cNumero+"' "
		endif
		cQry1 += " ORDER BY Z09_CODIGO " 
		
		cQry1 := ChangeQuery(cQry1)
		
		If Select("QRYWS01") > 0
			QRYWS01->(DbCloseArea())
		EndIf
		
		TcQuery cQry1 New Alias "QRYWS01" // Cria uma nova area com o resultado do query
		
		QRYWS01->(dbGoTop())
		DbSelectArea("Z09")
		While QRYWS01->(!Eof())
		
		MemoWrite("C:\teste.sql",QRYWS01)    
		
			// Cria e alimenta uma nova instancia do contrato
			oNewCtr :=  WSClassNew( "Contrato" )
			
			Z09->(DbGoTo(QRYWS01->R_E_C_N_O_))
			
			oNewCtr:cNumero			:= QRYWS01->Z09_CODIGO
			oNewCtr:cAbrangencia	:= QRYWS01->Z09_ABRANG
			oNewCtr:dDataInicial	:= DTOC(STOD(QRYWS01->Z09_DTINIC))
			oNewCtr:dDataFinal		:= DTOC(STOD(QRYWS01->Z09_DTFINA))
			oNewCtr:lRenovaAuto		:= iif(QRYWS01->Z09_RENAUT=="T",.T.,.F.) 	 	
			oNewCtr:cCliente		:= QRYWS01->Z09_CLIENT 	
			oNewCtr:cLoja			:= QRYWS01->Z09_LOJA 	
			oNewCtr:cNomeCli		:= QRYWS01->Z09_NOME 	
			oNewCtr:cGrupoCli		:= QRYWS01->Z09_GRPCLI
			oNewCtr:cDescGrupo		:= QRYWS01->Z09_DESCRI
			oNewCtr:cCondPag		:= QRYWS01->Z09_CONDPG 	 	
			oNewCtr:cFormaPag		:= QRYWS01->Z09_FORMAP 	 	
			oNewCtr:cMesAniv		:= QRYWS01->Z09_MESANI
			oNewCtr:cBaseCalculo	:= QRYWS01->Z09_BSCALC
			oNewCtr:cTituloFin		:= QRYWS01->Z09_TITFIN	 	 	
			oNewCtr:cNaturezaTit	:= QRYWS01->Z09_NATTIT	 	
			oNewCtr:cObservacoes	:= Z09->Z09_OBSERV
			oNewCtr:dDataCadastro	:= DTOC(STOD(QRYWS01->Z09_DTCAD))	
			oNewCtr:cUserCadastro	:= QRYWS01->Z09_USRCAD
			oNewCtr:cStatus			:= QRYWS01->Z09_STATUS
			oNewCtr:aClausulas		:= {}
			
			cQry2 := " SELECT * FROM " + RetSqlName("Z10") + " "
			cQry2 += " WHERE Z10_FILIAL = '" + xFilial("Z10") + "' "
			cQry2 += " AND D_E_L_E_T_ <> '*' "
			cQry2 += " AND Z10_CODIGO = '"+QRYWS01->Z09_CODIGO+"' "
			cQry2 += " ORDER BY Z10_ITEM " 
			
			cQry2 := ChangeQuery(cQry2)
			MemoWrite("C:\teste2.sql",QRYWS01) 
			If Select("QRYWS02") > 0
				QRYWS02->(DbCloseArea())
			EndIf
			
			TcQuery cQry2 New Alias "QRYWS02" // Cria uma nova area com o resultado do query
			
			QRYWS02->(dbGoTop())
			
			While QRYWS02->(!Eof())
				
				// Cria e alimenta uma nova instancia da Clausula
				oNewClausula :=  WSClassNew( "Clausula" )
				
				oNewClausula:cCodigo			:= QRYWS02->Z10_CLAUSU
				oNewClausula:cDescricao			:= QRYWS02->Z10_DESCCL
				oNewClausula:cAplicacao			:= QRYWS02->Z10_APLICA
				oNewClausula:cPeriodicidade		:= QRYWS02->Z10_PERIOD 	
				oNewClausula:cDescPeriod		:= QRYWS02->Z10_DESCPE 	
				oNewClausula:cGrupoProd			:= QRYWS02->Z10_GRUPO 	
				oNewClausula:cDescGrupo			:= QRYWS02->Z10_DESCGR
				oNewClausula:cProduto			:= QRYWS02->Z10_PRODUT
				oNewClausula:cDescProduto		:= QRYWS02->Z10_DESCPR 	 	
				oNewClausula:nFaixaInicial		:= QRYWS02->Z10_FXINIC 	 	
				oNewClausula:nFaixaFinal		:= QRYWS02->Z10_FXFINA 	 	
				oNewClausula:cTipoFaixa			:= QRYWS02->Z10_TPFAIX
				oNewClausula:nValorAplicar		:= QRYWS02->Z10_VLAPLI 	 	
				oNewClausula:cTipoValor			:= QRYWS02->Z10_TPVALO
				oNewClausula:cObservacao		:= QRYWS02->Z10_OBSERV
				oNewClausula:cStatus			:= QRYWS02->Z10_STATUS
				oNewClausula:aClientes			:= {}
				
				cQry3 := " SELECT * FROM " + RetSqlName("Z11") + " "
				cQry3 += " WHERE Z11_FILIAL = '" + xFilial("Z11") + "' "
				cQry3 += " AND D_E_L_E_T_ <> '*' "
				cQry3 += " AND Z11_CODIGO = '"+QRYWS01->Z09_CODIGO+"' "
				cQry3 += " AND Z11_ITEMFI = '"+QRYWS02->Z10_ITEM+"' "
				cQry3 += " ORDER BY Z11_ITEM " 
				
				cQry3 := ChangeQuery(cQry3)
				
				If Select("QRYWS03") > 0
					QRYWS03->(DbCloseArea())
				EndIf
				
				TcQuery cQry3 New Alias "QRYWS03" // Cria uma nova area com o resultado do query
				
				QRYWS03->(dbGoTop())
				
				While QRYWS03->(!Eof())
				
					// Cria e alimenta uma nova instancia da Cliente
					oNewCli :=  WSClassNew( "Cliente" )
					
					oNewCli:cCodigo			:= QRYWS03->Z11_CLIENT
					oNewCli:cLoja			:= QRYWS03->Z11_LOJA
					oNewCli:cNome			:= QRYWS03->Z11_NOME
					oNewCli:cCGC			:= QRYWS03->Z11_CGC 	
					oNewCli:cTitApuracao	:= QRYWS03->Z11_TITAPU 	
					
					AAdd( oNewClausula:aClientes, oNewCli )
					
					QRYWS03->(DbSkip())
				enddo
				
				AAdd( oNewCtr:aClausulas, oNewClausula )
			
				QRYWS02->(DbSkip())
			enddo
			
			AAdd( oRet:aContratos, oNewCtr )
		
			nCount++
			QRYWS01->(DbSkip())
		enddo
			
		QRYWS01->(DbCloseArea())
		
		oRet:nQtdReg := nCount
		cMsgSuss 	:= "Encontrado(s) "+cValToChar(nCount)+" registros!"
		
	endif
	
	oRet:lRet := lOk
	if lOk
		oRet:cMensagem := cMsgSuss
	else
		oRet:cMensagem := cMsgErr
	endif

Return

