#include "protheus.ch" 
#include "topconn.ch" 

/*/{Protheus.doc} RCOME003
Log de Movimentação de Contratos - Devolução de Venda - PE MT103FIM - Contratos
@author TOTVS
@since 06/04/2017
@version P12
@param nOpcao,nConfirma            
@return nulo
/*/

/***************************************/
User Function RCOME003(nOpcao,nConfirma)
/***************************************/

Local aItClausu		:= {}

Private cIdMovCtr	:= ""

DbSelectArea("SD1")
SD1->(DbSetOrder(1)) //D1_FILIAL+D1_DOC+D1_SERIE+D1_FORNECE+D1_LOJA+D1_COD+D1_ITEM

DbSelectArea("SD2")
SD2->(DbSetOrder(3)) //D2_FILIAL+D2_DOC+D2_SERIE+D2_CLIENTE+D2_LOJA+D2_COD+D2_ITEM

DbSelectArea("SC6")
SC6->(DbSetOrder(1)) //C6_FILIAL+C6_NUM+C6_ITEM+C6_PRODUTO

DbSelectArea("Z13")
Z13->(DbSetOrder(1)) //Z13_FILIAL+Z13_CODIGO

If SF1->F1_TIPO == "D" .And. nConfirma == 1 //Devolução de venda e confirmou

	If nOpcao == 3 //Inclusão

		If SD1->(DbSeek(xFilial("SD1")+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA))
		
			While SD1->(!EOF()) .And. SD1->D1_FILIAL == xFilial("SD1") .And. SD1->D1_DOC == SF1->F1_DOC .And. SD1->D1_SERIE == SF1->F1_SERIE .And.;
				SD1->D1_FORNECE == SF1->F1_FORNECE .And. SD1->D1_LOJA == SF1->F1_LOJA
	
				If SD2->(DbSeek(xFilial("SD2")+SD1->D1_NFORI+SD1->D1_SERIORI+SD1->D1_FORNECE+SD1->D1_LOJA+SD1->D1_COD+SD1->D1_ITEMORI))
	
					If SC6->(DbSeek(xFilial("SC6")+SD2->D2_PEDIDO+SD2->D2_ITEMPV))
					
						//Se houve majoração
						If !Empty(SC6->C6_XIDMOVI)
						
							If Z13->(DbSeek(xFilial("Z13")+SC6->C6_XIDMOVI))
							
								If Z14->(DbSeek(xFilial("Z14")+Z13->Z13_CODIGO))
								
									While Z14->(!EOF()) .And. Z14->Z14_FILIAL == xFilial("Z14") .And. Z14->Z14_CODIGO == Z13->Z13_CODIGO
										
										AAdd(aItClausu,{Z14->Z14_ITCLAU,;
														Z14->Z14_CLAUSU,;
														Z14->Z14_DESCCL,;
														Z14->Z14_PERIOD,;
														Z14->Z14_DESCPE,;
														Z14->Z14_APLICA,;
														Z14->Z14_GRUPO,;
														Z14->Z14_DESCGR,;
														Z14->Z14_PRODUT,;
														Z14->Z14_DESCPR,;
														Z14->Z14_FXINIC,;
														Z14->Z14_FXFINA,;
														Z14->Z14_TPFAIX,;
														Z14->Z14_VLRAPL,;
														Z14->Z14_TPVLRA,;
														Z14->Z14_APURAD})
									
										Z14->(DbSkip())
									EndDo
								Endif

								//Gera Log da movimentação
								If U_RFATE004("DV",Z13->Z13_CONTRA,aItClausu,SF1->F1_FORNECE,SF1->F1_LOJA,@cIdMovCtr,Z13->Z13_PEDIDO,Z13->Z13_ITEMPV,;
												Z13->Z13_VLRNET,Z13->Z13_VLRTAB)		
									//Grava 
									RecLock("SD1",.F.)
									SD1->D1_XIDMOVI := cIdMovCtr
									SD1->(MsUnlock())
								Endif
							Endif
						Endif
					Endif
				Endif
			
				SD1->(DbSkip())
			EndDo
		Endif

	ElseIf nOpcao == 5 //Exclusão
		
		If Select("QRYSD1") > 0
			QRYSD1->(DbCloseArea())
		Endif
		
		cQry := "SELECT D1_XIDMOVI"
		cQry += " FROM "+RetSqlName("SD1")+""
		cQry += " WHERE D_E_L_E_T_ <> ' '" //Registros deletados
		cQry += " AND D1_FILIAL 	= '"+xFilial("SD1")+"'"
		cQry += " AND D1_DOC 		= '"+SF1->F1_DOC+"'"
		cQry += " AND D1_SERIE 		= '"+SF1->F1_SERIE+"'"
		cQry += " AND D1_FORNECE 	= '"+SF1->F1_FORNECE+"'"
		cQry += " AND D1_LOJA 		= '"+SF1->F1_LOJA+"'"
		
		cQry := ChangeQuery(cQry)
		TcQuery cQry NEW Alias "QRYSD1"	
				
		While QRYSD1->(!EOF())

			If Z13->(DbSeek(xFilial("Z13")+QRYSD1->D1_XIDMOVI))
				U_RFATE006(Z13->Z13_CODIGO)
			Endif
			
			QRYSD1->(DbSkip())
		EndDo

		If Select("QRYSD1") > 0
			QRYSD1->(DbCloseArea())
		Endif
	Endif
Endif

Return