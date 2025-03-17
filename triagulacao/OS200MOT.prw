#Include 'Protheus.ch'

User Function OS200MOT()
	LOCAL aArea 	:= GetArea()
	LOCAL aAreaDA3	:= DA3->(GetArea())
	LOCAL aAreaSA4  := SA4->(GetArea())
	LOCAL aAreaSC5  := SC5->(GetArea())
	LOCAL aAreaDAI  := DAI->(GetArea())
	LOCAL aAreaGU3  := GU3->(GetArea())
	LOCAL aAReaGWN  := GWN->(GetArea())
	LOCAL cCodCarga := DAK->DAK_COD
	LOCAL cSeqCarga := DAK->DAK_SEQCAR
	LOCAL cVeiculo  := DAK->DAK_CAMINH
	LOCAL cPedido
	LOCAL cTransp	
	LOCAL cNFiscal
	LOCAL cSerie
	Local l_ok := .T.

	DbSelectArea("DA3")
	DbSetOrder(1)
	If DbSeek(FwxFilial("DA3")+cVeiculo)

		//Pergunte("_OS200MOT",.T.,,,,.F.)

		While l_ok

			Pergunte("_OS200MOT",.T.,,,,.F.)

			If MV_PAR01 <> ' '
				DbSelectArea("SA4")
				DbSetOrder(1)
				if ! DbSeek(fwxFilial("SA4") + MV_PAR01)
					Aviso("Atenção!","Informe uma Transportadora válida",{"Ok"})
				Else
					l_ok := .F.
				Endif
			Else
				Aviso("Atenção!","Informe uma Transportadora",{"Ok"})
			Endif

			If MV_PAR02 <> ' '
				DbSelectArea("GUB")
				DbSetOrder(1)
				if ! DbSeek(fwxFilial("GUB") + MV_PAR02)
					Aviso("Atenção!","Informe uma Class. Frete válida",{"Ok"})
				Else
					l_ok := .F.
				Endif
			Else
				Aviso("Atenção!","Informe uma Class. Frete",{"Ok"})
			Endif

		EndDo

		cTransp := MV_PAR01
//		DbSelectArea("SA4")
//		DbSetOrder(1)
//		if DbSeek(fwxFilial("SA4")+DA3->DA3_X_TRAN)

		if !isincallstack("U_ROBOCWIZ")
			//Ajustar Pedidos de Venda com a Nova Transportadora
			RecLock("DAK",.f.)
			Replace DAK->DAK_TRANSP  with cTransp
			DAK->(MsUnLock())
		EndIF


		DbSelectArea("DAI")
		DbSetOrder(1)
		DbSeek(FwXFilial("DAI") + cCodCarga + cSeqCarga)
		While !DAI->(Eof()) .and. DAI->DAI_FILIAL == FWxFilial() .and.  DAI->(DAI_COD+DAI_SEQCAR) == DAK->(DAK_COD+DAK_SEQCAR)
			cPedido  := DAI->DAI_PEDIDO
			cNFiscal := DAI->DAI_NFISCA
			cSerie   := DAI->DAI_SERIE

			DbSelectArea("SC5")
			SC5->(DbSetOrder(1))

			if DbSeek(FWxFilial("SC5")+cPedido)
				RecLock("SC5",.f.)
				if !isincallstack("U_ROBOCWIZ")
					Replace SC5->C5_TRANSP  with cTransp
				endif
				Replace SC5->C5_VEICULO with cVeiculo
				SC5->(MsUnLock())
			Endif


			DbSelectArea("DAI")
			DbSkip()
		Enddo

		//Ajustar a transportadora na tabela de Romaneios no GFE.
		//GWN - Romaneios
		//GU3 - Emitentes de transportes

		//Verificar com Rafael se não é necessário atualizar também código do Motorista

		DbSelectArea("GU3")
		DbSetOrder(13) // GU3_FILIAL+GU3_CDTERP
		IF DbSeek(FWxFilial("GU3") + cTransp)
			DbSelectArea("GWN")
			DbSetOrder(1)
			If DbSeek(FWxFilial("GWN") + cCodCarga + cSeqCarga)
				RecLock("GWN",.F.)
				Replace GWN_CDTRP	With GU3->GU3_CDEMIT
				Replace GWN_CDCLFR	With MV_PAR02
				GWN->(MsUnLock())
			Endif
		Endif
//		Endif
	Endif


	restarea(aAreaGU3)
	restarea(aAreaGWN)
	restarea(aAreaDAI)
	restarea(aAreaSC5)
	restarea(aAreaSA4)
	restarea(aAreaDA3)
	restarea(aArea)
Return
