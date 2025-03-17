#include "protheus.ch"
#include "topconn.ch"

/*/{Protheus.doc} RFATE010
Realiza desconto financeiro - Contratos
@author TOTVS
@since 05/04/2017
@version P12
@param nulo
@return nulo
/*/
User Function RFATE010(nOpcx)
	// Gera abatimento caso o campo C5_X
	Local aArea		:= GetArea()
	Local aAreaSD2	:= GetArea("SD2")
	Local aAreaSC5	:= GetArea("SC5")
	Local aAreaSC6	:= GetArea("SC6")
	Local aAreaZ13	:= GetArea("Z13")
	Local aAreaSE1	:= GetArea("SE1")
	Local cNatContr := SuperGetMv("MV_XNATDCO",,"") //natureza de desconto de contrato
	Local cNatVBC 	:= SuperGetMv("MV_XNATDVB",,"") //natureza de desconto de contrato
	Local nDescont, nTotAbImp := 0

	Local nVlrTit	:= 0
	Default nOpcx := 0

	if nOpcx == 1 //vindo do PE menu pedido vendas (RFATE017)
		SF2->(DbSetOrder(1)) //F2_FILIAL+F2_DOC+F2_SERIE+F2_CLIENTE+F2_LOJA+F2_FORMUL+F2_TIPO
		if empty(SC5->C5_NOTA) .OR. !SF2->(DbSeek(xFilial("SF2")+SC5->C5_NOTA+SC5->C5_SERIE))
			Alert("Não encontrada a NF.")
			Return
		else
			SE1->(DbSetOrder(1)) //E1_FILIAL+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO
			if SE1->(DbSeek(xFilial("SE1")+SF2->F2_SERIE+SF2->F2_DUPL))
				nDescont := SumAbatRec(SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_MOEDA,"S",dDataBase,@nTotAbImp)
				if nDescont > 0
					Alert("Ja foi gerado titulos de abatimento.")
					Return
				endif
			endif
		endif
	endif

	Conout("RFATE010 >> Inicio ("+SF2->F2_DOC+")")

	//verificar se gerou titulo
	if !empty(SF2->F2_DUPL) .AND. SF2->F2_TIPO == "N" //se gerou titulo e é nota normal

		Conout("RFATE010 >> Tem titulo ("+SF2->F2_DOC+")")

		SE1->(DbSetOrder(1)) //E1_FILIAL+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO
		if SE1->(DbSeek(xFilial("SE1")+SF2->F2_SERIE+SF2->F2_DUPL))

			Conout("RFATE010 >> Posicionou no Titulo ("+SF2->F2_DOC+")")

			//procurando pedido na SD2
			SD2->(DbSetOrder(3))//D2_FILIAL+D2_DOC+D2_SERIE+D2_CLIENTE+D2_LOJA+D2_COD+D2_ITEM
			SD2->(DbSeek(xFilial("SE1")+SF2->F2_DOC+SF2->F2_SERIE))
			if !empty(SD2->D2_PEDIDO)

				DbSelectArea("Z13")
				Z13->(DbSetOrder(1)) //Z13_FILIAL+Z13_CODIGO

				DbSelectArea("Z14")
				Z14->(DbSetOrder(1)) //Z14_FILIAL+Z14_CODIGO+Z14_ITEM

				SC5->(DbSetOrder(1)) //C5_FILIAL+C5_NUM
				SC5->(DbSeek(xFilial("SC5")+SD2->D2_PEDIDO))

				SC6->(DbSetOrder(1)) //C6_FILIAL+C6_NUM+C6_ITEM+C6_PRODUTO
				SC6->(DbSeek(xFilial("SC6")+SD2->D2_PEDIDO ))
				While SC6->(!EOF()) .And. SC6->C6_FILIAL == xFilial("SC6") .And. SC6->C6_NUM == SD2->D2_PEDIDO

					//Se houve majoração
					If !Empty(SC6->C6_XIDMOVI)

						If Z13->(DbSeek(xFilial("Z13")+SC6->C6_XIDMOVI))

							If Z14->(DbSeek(xFilial("Z14")+Z13->Z13_CODIGO))

								While Z14->(!EOF()) .And. Z14->Z14_FILIAL == xFilial("Z14") .And. Z13->Z13_CODIGO == Z14->Z14_CODIGO

									If Z14->Z14_APLICA == "F" //Aplicação igual Faturamento
										nVlrTit += Z14->Z14_VLRPAR * SC6->C6_QTDVEN
									Endif

									Z14->(DbSkip())
								EndDo
							Endif
						Endif
					Endif

					SC6->(DbSkip())
				EndDo

				//Se houve majoração, inclui abatimento/desconto financeiro contrato
				If nVlrTit > 0
					Conout("RFATE010 >> Vai gerar AB- do contrato ("+SF2->F2_DOC+")")
					IncTitAb("AB-", nVlrTit, cNatContr)
				Endif

				//Danilo: desconto VBC, e gerou titulo
				if SC5->C5_XVBCDES > 0
					Conout("RFATE010 >> Vai gerar titulo abatimento VB- ("+SF2->F2_DOC+")")
					//DbSelectArea("SES")
					//SES->(DbSetOrder(1)) //ES_FILIAL+ES_TIPO+ES_CARTEIR
					//if SES->(DbSeek(xFilial("SES")+"VBC")) //verifico se foi cadastrado o tipo de abatiento
						IncTitAb("VB-", SC5->C5_XVBCDES, cNatVBC)
					//endif

					//IncTitAb("AB-", SC5->C5_XVBCDES, cNatVBC)

				endif

			endif
		endif

		RestArea(aAreaZ13)
		RestArea(aAreaSE1)
		RestArea(aAreaSC6)
		RestArea(aAreaSC5)
		RestArea(aAreaSD2)
		RestArea(aArea)

	endif

Return

/********************************/
Static Function IncTitAb(cTipo,nVlrTit,cNaturez)
	/********************************/

	Local aAreaSE1 		:= SE1->(GetArea())
	Local lRet			:= .T.
	Local aFin040 		:= {}

	Private lMsErroAuto := .F.
	Private lMsHelpAuto := .T.

	AAdd(aFin040, {"E1_FILIAL"	, SE1->E1_FILIAL				,Nil } )
	AAdd(aFin040, {"E1_PREFIXO"	, SE1->E1_PREFIXO				,Nil } )
	AAdd(aFin040, {"E1_NUM"		, SE1->E1_NUM					,Nil } )
	AAdd(aFin040, {"E1_PARCELA"	, SE1->E1_PARCELA				,Nil } )
	AAdd(aFin040, {"E1_TIPO"	, cTipo							,Nil } )
	AAdd(aFin040, {"E1_CLIENTE"	, SE1->E1_CLIENTE				,Nil } )
	AAdd(aFin040, {"E1_LOJA"	, SE1->E1_LOJA					,Nil } )
	AAdd(aFin040, {"E1_VALOR"	, nVlrTit						,Nil } )
	AAdd(aFin040, {"E1_EMISSAO"	, dDataBase						,Nil } )
	AAdd(aFin040, {"E1_VENCTO"	, SE1->E1_VENCTO				,Nil } )
	if !empty(cNaturez)
		AAdd(aFin040, {"E1_NATUREZA", cNaturez					,Nil } )
	endif

	MSExecAuto({|x,y| FINA040(x,y)},aFin040,3)

	If lMsErroAuto
		MostraErro()
		lRet := .F.
	else
		Conout("RFATE010 >> Titulo gerado com sucesso! ("+SF2->F2_DOC+")")
	EndIf

	RestArea(aAreaSE1)

Return lRet

//Funçao para calcula valor total do desconto do contrato
User Function RFAT010A()

	Local nVlrTit := 0

	DbSelectArea("Z13")
	Z13->(DbSetOrder(1)) //Z13_FILIAL+Z13_CODIGO

	DbSelectArea("Z14")
	Z14->(DbSetOrder(1)) //Z14_FILIAL+Z14_CODIGO+Z14_ITEM

	SC6->(DbSetOrder(1)) //C6_FILIAL+C6_NUM+C6_ITEM+C6_PRODUTO
	SC6->(DbSeek(xFilial("SC6")+SC5->C5_NUM ))
	While SC6->(!EOF()) .And. SC6->C6_FILIAL == xFilial("SC6") .And. SC6->C6_NUM == SC5->C5_NUM

		//Se houve majoração
		If !Empty(SC6->C6_XIDMOVI)

			If Z13->(DbSeek(xFilial("Z13")+SC6->C6_XIDMOVI))

				If Z14->(DbSeek(xFilial("Z14")+Z13->Z13_CODIGO))

					While Z14->(!EOF()) .And. Z14->Z14_FILIAL == xFilial("Z14") .And. Z13->Z13_CODIGO == Z14->Z14_CODIGO

						If Z14->Z14_APLICA == "F" //Aplicação igual Faturamento
							nVlrTit += Z14->Z14_VLRPAR * SC6->C6_QTDVEN
						Endif

						Z14->(DbSkip())
					EndDo
				Endif
			Endif
		Endif

		SC6->(DbSkip())
	EndDo

Return nVlrTit
