#include "protheus.ch"
#include "topconn.ch"

/*/{Protheus.doc} RFATE007
Log de Movimentação de Contratos - Pedidos de Venda - PE M410STTS - Contratos
@author TOTVS
@since 29/03/2017
@version P12
@param nulo
@return nulo
/*/

User Function RFATE007()

	Local aAreaSC6		:= GetArea("SC6")
	Local aAreaZ13		:= GetArea("Z13")

	Local cContrato		:= ""
	Local aItClausu		:= {}

	Local nIcmsSt		:= 0
	Local nPis			:= 0
	Local nCofins		:= 0
	Local nIcms			:= 0
	Local nSufra		:= 0
	Local nPrcUnit

	//Private cContrato	:= ""
	//Private aItClausu	:= {}
	Private cIdMovCtr	:= ""

	Begin Transaction

		//se alteração, excluo primeiro os logs do pedido
		If ALTERA //Alteração do PV
			DbSelectArea("Z13")
			Z13->(DbSetOrder(3)) //Z13_FILIAL+Z13_PEDIDO
			If Z13->(DbSeek(xFilial("Z13")+SC5->C5_NUM))
				//Exclui os logs relacionados ao PV
				While Z13->(!EOF()) .And. Z13->Z13_FILIAL == xFilial("Z13") .And. Z13->Z13_PEDIDO == SC5->C5_NUM

					If !U_RFATE006(Z13->Z13_CODIGO)
						Exit
					Endif

					Z13->(DbSkip())
				EndDo
			endif
		endif

		SC6->(DbSetOrder(1)) //C6_FILIAL+C6_NUM+C6_ITEM+C6_PRODUTO
		If SC6->(DbSeek(xFilial("SC6")+SC5->C5_NUM))

			While SC6->(!EOF()) .And. SC6->C6_FILIAL == xFilial("SC6") .And. SC6->C6_NUM == SC5->C5_NUM

				nPrcUnit := SC6->C6_PRCVEN

				//Carrega dados do contrato e cláusula(s)
				VerifContr(SC5->C5_CLIENTE,SC5->C5_LOJACLI,SC6->C6_ITEM,SC6->C6_PRODUTO,@cContrato,@aItClausu)

				//Confirma localização do contrato
				If !Empty(cContrato)

					//Inicializa a funcao fiscal
					MaFisSave()
					MaFisEnd()
					MaFisIni(Iif(Empty(SC5->C5_CLIENT),SC5->C5_CLIENTE,SC5->C5_CLIENT),;	// 1-Codigo Cliente/Fornecedor
					SC5->C5_LOJAENT,;													// 2-Loja do Cliente/Fornecedor
					IIf(SC5->C5_TIPO$'DB',"F","C"),;									// 3-C:Cliente , F:Fornecedor
					SC5->C5_TIPO,;														// 4-Tipo da NF
					SC5->C5_TIPOCLI,;													// 5-Tipo do Cliente/Fornecedor
					Nil,;
					Nil,;
					Nil,;
					Nil,;
					"MATA461")

					//Agrega os itens para a funcao fiscal
					MaFisAdd(SC6->C6_PRODUTO,;	   											// 1-Codigo do Produto ( Obrigatorio )
					SC6->C6_TES,;		   												// 2-Codigo do TES ( Opcional )
					1,;																	// 3-Quantidade ( Obrigatorio )
					nPrcUnit,;															// 4-Preco Unitario ( Obrigatorio )
					0,;																	// 5-Valor do Desconto ( Opcional )
					"",;	   															// 6-Numero da NF Original ( Devolucao/Benef )
					"",;																// 7-Serie da NF Original ( Devolucao/Benef )
					,;																	// 8-RecNo da NF Original no arq SD1/SD2
					0,;																	// 9-Valor do Frete do Item ( Opcional )
					0,;																	// 10-Valor da Despesa do item ( Opcional )
					0,;																	// 11-Valor do Seguro do item ( Opcional )
					0,;																	// 12-Valor do Frete Autonomo ( Opcional )
					nPrcUnit,;															// 13-Valor da Mercadoria ( Obrigatorio )
					0)																	// 14-Valor da Embalagem ( Opiconal )

					nIcmsSt	:= MaFisRet(1,"LF_ICMSRET") //MaFisRet(1,"IT_VALSOL")
					nPis	:= MaFisRet(1,"IT_VALPS2")
					nCofins	:= MaFisRet(1,"IT_VALCF2")
					nIcms	:= MaFisRet(1,"IT_VALICM")
					nSufra	:= MaFisRet(1,"IT_DESCZF")// + MaFisRet(1,"IT_DESCZFPIS") + MaFisRet(1,"IT_DESCZFCOF")
					//MaFisRet(1,"IT_BASEDUP")

					MaFisEnd()
					MaFisRestore()

					//Inclui log
					//Se for processo de Bonificação não gera Movimentação de Contrato
					IF !Empty(SC5->C5_XPVSGAC) .And. SC6->C6_OPER = '20' 
						Exit	
					ElseIf U_RFATE004("AF",cContrato,aItClausu,SC5->C5_CLIENTE,SC5->C5_LOJACLI,@cIdMovCtr,SC5->C5_NUM,SC6->C6_ITEM, nPrcUnit/*NET*/, SC6->C6_XPRCORI/*tabela*/,nIcmsSt,nPis,nCofins,nIcms,nSufra)
						RecLock("SC6",.F.)
						SC6->C6_XIDMOVI := cIdMovCtr
						SC6->(MsUnlock())
					Else
						Exit
					Endif

				Endif

				SC6->(DbSkip())
			EndDo

		Endif

	End Transaction

	RestArea(aAreaSC6)
	RestArea(aAreaZ13)

Return

/*********************************/
User Function RetPrTab(cTab,cProd)
	/*********************************/

	Local nRet := 0
	Local cGrupo := Posicione("SB1",1,xFilial("SB1")+cProd, "B1_GRUPO")

	DbSelectArea("DA0")
	DA0->(DbSetOrder(1)) //DA0_FILIAL+DA0_CODTAB

	DbSelectArea("DA1")
	DA1->(DbSetOrder(1)) //DA1_FILIAL+DA1_CODTAB+DA1_CODPRO+DA1_INDLOT+DA1_ITEM

	If DA0->(DbSeek(xFilial("DA0")+cTab))

		If DA1->(DbSeek(xFilial("DA1")+DA0->DA0_CODTAB+cProd))

			While DA1->(!EOF()) .And. DA1->DA1_FILIAL == xFilial("DA1") .And. DA1->DA1_CODTAB == DA0->DA0_CODTAB .And. DA1->DA1_CODPRO == cProd

				nRet := DA1->DA1_PRCVEN

				DA1->(DbSkip())
			EndDo
		Endif

		if empty(nRet) .AND. !empty(cGrupo) //se nao encontrou por produto, vejo por grupo
			DbSelectArea("DA1")
			DA1->(DbSetOrder(4)) //DA1_FILIAL+DA1_CODTAB+DA1_GRUPO+DA1_INDLOT+DA1_ITEM
			If DA1->(DbSeek(xFilial("DA1")+DA0->DA0_CODTAB+cGrupo))
				While DA1->(!EOF()) .And. DA1->DA1_FILIAL == xFilial("DA1") .And. DA1->DA1_CODTAB == DA0->DA0_CODTAB .And. DA1->DA1_GRUPO == cGrupo

					nRet := DA1->DA1_PRCVEN

					DA1->(DbSkip())
				EndDo
			endif
		endif
	Endif

Return nRet

/*************************************************************************/
Static Function VerifContr(cCliente,cLoja,cItPv,cProd,cContrato,aItClausu)
	/*************************************************************************/

	Local cGrpProd := ""

	cContrato 	:= ""
	aItClausu	:= {}

	DbSelectArea("SB1")
	SB1->(DbSetOrder(1)) //B1_FILIAL+B1_COD

	If SB1->(DbSeek(xFilial("SB1")+cProd))

		cGrpProd := SB1->B1_GRUPO

		If Select("QRYNET") > 0
			QRYNET->(DbCloseArea())
		EndIf

		cQry := " SELECT Z09.Z09_CODIGO AS CONTRATO, Z10.Z10_ITEM AS ITCLA, Z11.Z11_ITEM AS ITCLI, Z10.Z10_VLAPLI AS PERCAPLI"
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

		cQry := ChangeQuery(cQry)
		TcQuery cQry New Alias "QRYNET"

		If QRYNET->(!EOF())

			cContrato := QRYNET->CONTRATO

			While QRYNET->(!EOF())

				AAdd(aItClausu,QRYNET->ITCLA)

				QRYNET->(DbSkip())
			EndDo
		Endif

		If Select("QRYNET") > 0
			QRYNET->(DbCloseArea())
		EndIf
	Endif

Return
