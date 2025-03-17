#include "protheus.ch"
#include "topconn.ch"

/*/{Protheus.doc} RFATE005
Calculo preço NET - Pedidos de Venda - PE A410TAB - Contratos
@author TOTVS
@since 23/03/2017
@version P12
@param cTabPrc,cCliente,cLoja,cProd,nQtdVen,cTes
@return nulo
/*/

/****************************************************************/
User Function RFATE005(cTabPrc,cCliente,cLoja,cProd,nQtdVen,cTes,nPrcTab,nDescont,nPercent)
/****************************************************************/

Local aAreaSB1		:= GetArea("SB1")
Local aAreaSF4		:= GetArea("SF4")

Local cQry			:= ""

Local cGrpProd		:= ""

Local nPrcLst		:= 0
Local nPrcLst2		:= 0
Local nVlrPar		:= 0
Local nVlrPar2		:= 0
Local nPrcOrig		:= 0

Local lContinua		:= .T.

Local cBsCalc		:= ""

Local nVlrBas		:= 0
Local nIcmsSt		:= 0
Local nPis			:= 0
Local nCofins		:= 0
Local nIcms			:= 0
//Local nSufra		:= 0

Default cTes		:= aCols[n,GdFieldPos("C6_TES")]
Default nDescont	:= aCols[n,GdFieldPos("C6_VALDESC")]
Default nPrcTab		:= 0
Default nPercent 	:= 0

if nPrcTab > 0 //se passou preço, seta como original
	if type("aCols")=="A"
		aCols[n,GdFieldPos("C6_XPRCORI")] := nPrcTab
		M->C6_XPRCORI := nPrcTab
	endif
	nPrcOrig := nPrcTab
elseif type("aCols")=="A"
	nPrcOrig := aCols[n,GdFieldPos("C6_XPRCORI")]
endif

If !Empty(cTes)

	DbSelectArea("SF4")
	SF4->(DbSetOrder(1)) //F4_FILIAL+F4_CODIGO

	If SF4->(DbSeek(xFilial("SF4")+cTes))

		If SF4->F4_DUPLIC == "N" //Não gera financeiro (ex.: bonificação, doação, etc.)
			nPrcLst 	:= A410Tabela(cProd,cTabPrc,n,nQtdVen,cCliente,cLoja,"","",,.F.)
			lContinua	:= .F.
			aCols[n,GdFieldPos("C6_XPRCORI")] := 0
			M->C6_XPRCORI := 0
			nPrcOrig := 0
		Endif
	Endif
Endif

If lContinua

	if nPrcTab == 0  .AND. nPrcOrig > 0 //se ja tenho o preço original, utilizo ele
		nPrcTab := nPrcOrig
	endif

	if !empty(cTabPrc) .AND. nPrcTab == 0 //se ainda não tenho preço tabela
		nPrcTab := A410Tabela(cProd,cTabPrc,n,nQtdVen,cCliente,cLoja,"","",,.F.)
		aCols[n,GdFieldPos("C6_XPRCORI")] := nPrcTab
		M->C6_XPRCORI := nPrcTab
		nPrcOrig := nPrcTab
	endif

	If nPrcTab > 0

		DbSelectArea("SB1")
		SB1->(DbSetOrder(1)) //B1_FILIAL+B1_COD

		If SB1->(DbSeek(xFilial("SB1")+cProd))

			cGrpProd := SB1->B1_GRUPO

			If Select("QRYNET") > 0
				QRYNET->(DbCloseArea())
			EndIf

			cQry := " SELECT Z09.Z09_BSCALC AS BSCALC, sum(Z10.Z10_VLAPLI) AS PERCAPLI"
			cQry += " FROM "+RetSqlName("Z11")+" Z11, "+RetSqlName("Z10")+" Z10, "+RetSqlName("Z09")+" Z09"
			cQry += " WHERE Z11.D_E_L_E_T_	<> '*'"
			cQry += " AND Z10.D_E_L_E_T_	<> '*'"
			cQry += " AND Z09.D_E_L_E_T_	<> '*'"
			cQry += " AND Z11.Z11_FILIAL	= '"+xFilial("Z11")+"'"
			cQry += " AND Z10.Z10_FILIAL	= '"+xFilial("Z10")+"'"
			cQry += " AND Z09.Z09_FILIAL	= '"+xFilial("Z09")+"'"
			cQry += " AND Z11.Z11_CODIGO	= Z09.Z09_CODIGO"
			cQry += " AND Z11.Z11_ITEMFI	= Z10.Z10_ITEM"
			cQry += " AND Z10.Z10_CODIGO	= Z09.Z09_CODIGO"
			cQry += " AND Z11.Z11_CLIENT 	= '"+cCliente+"'"
			cQry += " AND Z11.Z11_LOJA 		= '"+cLoja+"'"
			cQry += " AND Z10.Z10_STATUS	= 'A'" //Cláusula ativa
			cQry += " AND (Z10.Z10_APLICA 	= 'A' OR Z10.Z10_APLICA = 'F')" //Aplicação: apuração ou faturamento
			cQry += " AND (Z10.Z10_GRUPO 	= '"+cGrpProd+"' OR Z10.Z10_PRODUT = '"+cProd+"')" //Produto: grupo ou produto
			cQry += " AND Z09.Z09_STATUS 	= 'A' AND (Z09.Z09_DTFINA >= '"+DToS(dDataBase)+"' OR Z09.Z09_RENAUT = 'T')" //Contrato vigente
			cQry += " GROUP BY 	Z09.Z09_BSCALC"
			cQry := ChangeQuery(cQry)
			TcQuery cQry New Alias "QRYNET"

			If QRYNET->(!EOF())

				cBsCalc := QRYNET->BSCALC

				While QRYNET->(!EOF())

					nPercent += QRYNET->PERCAPLI

					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³Inicializa a funcao fiscal                   ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
					MaFisSave()
					MaFisEnd()
					MaFisIni(cCliente,;							// 1-Codigo Cliente/Fornecedor
						cLoja,;									// 2-Loja do Cliente/Fornecedor
						IIf(M->C5_TIPO$'DB',"F","C"),;			// 3-C:Cliente , F:Fornecedor
						M->C5_TIPO,;							// 4-Tipo da NF
						M->C5_TIPOCLI,;							// 5-Tipo do Cliente/Fornecedor
						Nil,;
						Nil,;
						Nil,;
						Nil,;
						"MATA461")

					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³Agrega os itens para a funcao fiscal         ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
					MaFisAdd(cProd,;			   										// 1-Codigo do Produto ( Obrigatorio )
						cTes,;				   											// 2-Codigo do TES ( Opcional )
						IIF(nQtdVen == 0,1,nQtdVen),;									// 3-Quantidade ( Obrigatorio )
						nPrcTab,;														// 4-Preco Unitario ( Obrigatorio )
						nDescont,;														// 5-Valor do Desconto ( Opcional )
						"",;	   														// 6-Numero da NF Original ( Devolucao/Benef )
						"",;															// 7-Serie da NF Original ( Devolucao/Benef )
						,;																// 8-RecNo da NF Original no arq SD1/SD2
						0,;																// 9-Valor do Frete do Item ( Opcional )
						0,;																// 10-Valor da Despesa do item ( Opcional )
						0,;																// 11-Valor do Seguro do item ( Opcional )
						0,;																// 12-Valor do Frete Autonomo ( Opcional )
						(nPrcTab * IIF(nQtdVen == 0,1,nQtdVen)) + nDescont,;			// 13-Valor da Mercadoria ( Obrigatorio )
						0)																// 14-Valor da Embalagem ( Opiconal )

					nIcmsSt	:= MaFisRet(1,"LF_ICMSRET") //MaFisRet(1,"IT_VALSOL")
					nPis	:= MaFisRet(1,"IT_VALPIS")
					nCofins	:= MaFisRet(1,"IT_VALCOF")
					nIcms	:= MaFisRet(1,"IT_VALICM")
					//nSufra	:= MaFisRet(1,"IT_DESCZF")// + MaFisRet(1,"IT_DESCZFPIS") + MaFisRet(1,"IT_DESCZFCOF")
					
					MaFisEnd()
					MaFisRestore()

					If cBsCalc == "L" //Líquida
						nVlrBas := (nPrcTab - nPis - nCofins - nIcms)
						//nVlrPar	+= Round(((nPrcTab - nPis - nCofins - nIcms) / (1 - (QRYNET->PERCAPLI / 100))) - (nPrcTab - nPis - nCofins - nIcms),2)
					ElseIf cBsCalc == "B" //Bruta
						nVlrBas := (nPrcTab + nIcmsSt)
						//nVlrPar	+= Round(((nPrcTab + nIcmsSt) / (1 - (QRYNET->PERCAPLI / 100))) - (nPrcTab + nIcmsSt),2)
					Else //Bruta s/ ST
						nVlrBas := nPrcTab
						//nVlrPar	+= Round((nPrcTab / (1 - (QRYNET->PERCAPLI / 100))) - nPrcTab,2)
					Endif
					//nVlrBas -= nSufra //retirosuframa
					
					//Validado TESTE
					//nVlrPar += Round((nVlrBas / (1 - (QRYNET->PERCAPLI / 100))) - nVlrBas,4)
					nVlrPar +=  NoRound((nVlrBas / (1 - (QRYNET->PERCAPLI / 100))) - nVlrBas,4) //Voltamos para4
					nVlrPar2 += Round((nVlrBas * (QRYNET->PERCAPLI / 100)),4)
					
				
					//conout("nVlrBas:          " + cValToChar(nVlrBas))
					//conout("nVlrPar:          " + cValToChar(nVlrPar))
					//conout("nVlrPar   2:      " + cValToChar(nVlrPar2))
		

					QRYNET->(DbSkip())
				EndDo

				nPrcLst := (nPrcTab + nVlrPar)  
				nPrcLst2:= (nVlrPar2) 
				
				conout("nPrcList   :         " + cValToChar(nPrcLst))
				conout("nPrcList   2:        " + cValToChar(nPrcLst2))
				
			Else
				//if !empty(cTabPrc)
					//nPrcLst := A410Tabela(cProd,cTabPrc,n,nQtdVen,cCliente,cLoja,"","",,.F.)
					nPrcLst := nPrcTab //senao será o próprio preço tabela
				//endif
			Endif

			If Select("QRYNET") > 0
				QRYNET->(DbCloseArea())
			EndIf
		Endif
	Endif
Endif

RestArea(aAreaSF4)
RestArea(aAreaSB1)


Return ({nPrcLst,nPrcLst2})
