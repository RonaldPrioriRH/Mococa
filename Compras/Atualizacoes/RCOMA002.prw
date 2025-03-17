#Include 'Protheus.ch'
#Include 'Topconn.ch'

#Define CRLF chr(13)+chr(10)

/*/{Protheus.doc} RCOMA001
Rotina para entrada das devolucoes realizadas na filial devolvida
@author Leandro Rodrigues
@since 18/05/2017
@version P12
@param nulo
@return nulo
/*/

User Function RCOMA002(oSay, cLog)

	Local cQuery 	:= ""
	Local cFilEnt	:= ""
	Local cFornece  := ""
	Local aArea	 	:= GetArea()
	Local cFilOri	:= cFilAnt

	DbSelectArea("SA2")
	SA2->(DbSetOrder(1))

	DbSelectArea("ZEJ")
	ZEJ->(DbSetOrder(3))

	//Rotina executa no processo de apuracao leite
	If FunName() == "RCOMA001"

		cQuery := " SELECT"
		cQuery += "		DISTINCT   "
		cQuery += "		ZEM_FORNEC,"
		cQuery += "		ZEM_LOJA,  "
		cQuery += "		ZEJ_NUMDEV,"
		cQuery += "		ZEJ_SERDEV "
		cQuery += "	FROM " + RETSQLNAME("ZEM") + " ZEM"
		cQuery += "	INNER JOIN " + RETSQLNAME("ZEJ") + " ZEJ"
		cQuery += "		ON ZEJ_FILIAL = ZEM_FILIAL"
		cQuery += "		AND ZEJ_CODIGO = ZEM_OCORR"
		cQuery += "		AND ZEJ.D_E_L_E_T_<> '*'"
		cQuery += "	WHERE ZEM.D_E_L_E_T_<> '*'"
		cQuery += "		AND ZEJ_ENTFIL <> 'S'"
		cQuery += "		AND ZEJ_NUMDEV <> ' '"
		cQuery += "		AND ZEJ_OPERAC = '1' "
		cQuery += "		AND ZEM_CODIGO = '" + ZEL->ZEL_CODIGO + "'"

		cQuery += "	ORDER BY ZEM_FORNEC,ZEM_LOJA"

		cQuery := ChangeQuery(cQuery)

		If Select("QZEJ") > 0
			QZEJ->(DbCloseArea())
		Endif

		TcQuery cQuery New Alias "QZEJ"


		While QZEJ->(!EOF())

			If cFornece != QZEJ->ZEM_FORNEC+QZEJ->ZEM_LOJA

				//Busca qual filial sera a devolucao
				If SA2->(DbSeek(xFilial("SA2")+QZEJ->ZEM_FORNEC+QZEJ->ZEM_LOJA))
					ValFilial(SA2->A2_CGC,@cFilEnt)
					cFornece := QZEJ->ZEM_FORNEC+QZEJ->ZEM_LOJA
				Endif
			Endif

			If !Empty(cFilEnt)
				//Faz entrada da nota fiscal na filial
				If EntraNota(cFilEnt,QZEJ->ZEJ_NUMDEV,QZEJ->ZEJ_SERDEV,cCgcFil, @cLog)

					//Atualiza situacao da devolucao para Entrada Filial igual a S= Sim
					If ZEJ->(DbSeek(cFilOri+QZEJ->ZEJ_NUMDEV+QZEJ->ZEJ_SERDEV))

						While ZEJ->(!EOF()) ;
						.AND. ZEJ->ZEJ_FILIAL+ZEJ->ZEJ_NUMDEV+ZEJ->ZEJ_SERDEV == cFilOri+QZEJ->ZEJ_NUMDEV+QZEJ->ZEJ_SERDEV

							If Reclock("ZEJ",.F.)
								ZEJ->ZEJ_ENTFIL := 'S'
								ZEJ->(MsUnLock())
							Endif
							ZEJ->(DbSkip())
						EndDo
					Endif

					cLog += "Apuração finalizada!"
				Endif
				cFilAnt := cFilOri
			Endif

			QZEJ->(DbSkip())
		EndDo
	Endif

	cFilAnt := cFilOri
	RestArea(aArea)
Return

//----------------------------------------------------------------------
//Valida se devolução/Complementar é para alguma das filiais da Mococa
//----------------------------------------------------------------------
Static Function ValFilial(cCgcFor,cFilEnt)

	Local nX 	:= 1
	Local lRet	:= .F.
	Local aEmp	:= {}

	aEmp 	:= FWLoadSM0()

	//Varre filiais da SM0 para verificar se fornecedor é uma filial
	For nX := 1 to Len(aEmp)
		if aEmp[nX,18] == cCgcFor
			lRet 		:= .T.
			cFilEnt 	:= aEmp[nX,2]
			Exit  //Abandona o loop
		Endif
	Next nX

Return lRet

//----------------------------------------------------------------------
//Execauto de entrada da nota
//----------------------------------------------------------------------
Static Function EntraNota(cFilEnt,cNumDev,cSerDev,cCgcFil, cLog)

	Local aDadosSD2 := {} //tes, lote
	Local aCabec := {}
	Local aItens := {}
	Local aLinha := {}
	Local cCodCli:= ""
	Local cLojCli:= ""
	Local cTesEnt:= ""
	Local nRecSD2:= 0
	Private lMsHelpAuto := .T.
	Private lMsErroAuto := .F.

	DbSelectArea("SF2")
	SF2->(DbSetOrder(1))

	DbSelectArea("SD2")
	SD2->(DbSetOrder(3))

	If SF2->(DbSeek(xFilial("SF2")+cNumDev+cSerDev))

		//Busco codigo de cliente da filial Industria
		RetCodCli(cFilEnt,@cCodCli,@cLojCli,cCgcFil)

		//Preparo cabecalho do documento de entrada
		aItens:= {}
		aCabec:= {}

		aAdd(aCabec,{"F1_TIPO"   	,"D"			, Nil})
		aadd(aCabec,{"F1_FORMUL" 	,"N" 			, Nil})
		aAdd(aCabec,{"F1_DOC"    	,SF2->F2_DOC	, Nil})
		aAdd(aCabec,{"F1_SERIE"  	,SF2->F2_SERIE	, Nil})
		aAdd(aCabec,{"F1_EMISSAO"	,dDataBase		, Nil})
		aAdd(aCabec,{"F1_FORNECE"	,cCodCli		, Nil})
		aAdd(aCabec,{"F1_LOJA"   	,cLojCli		, Nil})
		aAdd(aCabec,{"F1_ESPECIE"	,"SPED"			, Nil})
		aAdd(aCabec,{"F1_COND"		,SF2->F2_COND	, Nil})

		If SD2->(DbSeek(xFilial("SD2")+cNumDev+cSerDev))

			While SD2->(!EOF()) ;
			.AND. SD2->D2_FILIAL+SD2->D2_DOC+SD2->D2_SERIE == xFilial("SD2")+cNumDev+cSerDev

				//Guardo Posicao atual
				nRecSD2 := SD2->(Recno())

				//Busco tes de que sera utilizada
				aDadosSD2 := RetSD2Ori(cFilEnt, SD2->D2_NFORI, SD2->D2_SERIORI, SD2->D2_ITEMORI, SD2->D2_COD)
				cTesEnt := aDadosSD2[1]
				cLoteCtl := aDadosSD2[2]

				SD2->(DbGoTo(nRecSD2))

				aLinha := {}
				aadd(aLinha,{"D1_COD" 		,SD2->D2_COD	,Nil})
				aadd(aLinha,{"D1_QUANT"		,SD2->D2_QUANT	,Nil})
				aadd(aLinha,{"D1_VUNIT"		,SD2->D2_PRCVEN	,Nil})
				aadd(aLinha,{"D1_TOTAL"		,SD2->D2_TOTAL	,Nil})
				aadd(aLinha,{"D1_TES"		,cTesEnt		,Nil})
				aadd(aLinha,{"D1_LOTECTL"	,cLoteCtl		,Nil})
				aadd(aLinha,{"D1_NFORI"		,SD2->D2_NFORI	,Nil})
				aadd(aLinha,{"D1_SERIORI"	,SD2->D2_SERIORI,Nil})
				aadd(aLinha,{"D1_ITEMORI"	,StrZero(Val(SD2->D2_ITEMORI),TamSx3("D2_ITEM")[1]),Nil})

				aadd(aItens,aLinha)

				SD2->(DbSkip())
			EndDo
		Endif
	Endif

	cFilAnt := cFilEnt

	MSExecAuto({|x,y| MATA103(x,y)},aCabec,aItens)

	If lMsErroAuto
		MostraErro()
	else
		cLog += "Nota fiscal devolução gerada: " + SF1->F1_DOC + "/" + SF1->F1_SERIE + " Filial: " + cFilAnt + CRLF
	EndIf

Return !lMsErroAuto

//----------------------------------------------------------------------
//Retorna codigo e loja de cliente
//---------------------------------------------------------------------
Static Function RetCodCli(cFilEnt,cCodCli,cLojCli,cCgcFil)

	Local aArea 	:= GetArea()
	Local cFilAtu	:= cFilAnt

	DbSelectArea("SA1")
	SA1->(DbSetOrder(3))

	cFilAnt := cFilEnt

	If SA1->(DbSeek(xFilial("SA2")+cCgcFil))
		cCodCli := SA1->A1_COD
		cLojCli := SA1->A1_LOJA
	Endif

	cFilAnt	:= cFilAtu

	RestArea(aArea)
Return

//----------------------------------------------------------------------
//Retorna tes de devolucao
//---------------------------------------------------------------------
Static Function RetSD2Ori(cFilEnt, cNfOri, cSerOri, cItemOri, cProdOri)

	Local aRet := {"",""}
	Local aArea 	:= GetArea()
	Local aAreaSF2	:= SF2->(GetArea())
	Local aAreaSD2	:= SD2->(GetArea())
	Local cFilAtu	:= cFilAnt
	Local cTesSaida := ""
	Local cTesEnt	:= ""
	Local cItem		:= ""
	Local cLoteCtl	:= ""

	cFilAnt	:= cFilEnt

	//localizo a nota de transferencia
	SF2->(DbSetOrder(1)) //F2_FILIAL+F2_DOC+F2_SERIE+F2_CLIENTE+F2_LOJA+F2_FORMUL+F2_TIPO
	if SF2->(DbSeek(xFilial("SF2")+cNfOri+cSerOri ))

		cItem := StrZero(Val(cItemOri),TamSx3("D2_ITEM")[1])

		SD2->(DbSetOrder(3)) //D2_FILIAL+D2_DOC+D2_SERIE+D2_CLIENTE+D2_LOJA+D2_COD+D2_ITEM
		if SD2->(DbSeek(xFilial("SD2")+cNfOri+cSerOri+SF2->F2_CLIENTE+SF2->F2_LOJA+cProdOri+cItem ))
			cTesSaida := SD2->D2_TES
			cTesEnt := Posicione("SF4",1,xFilial("SF4")+cTesSaida,"F4_XTDSPOT")

			cLoteCtl := SD2->D2_LOTECTL

			cFilAnt	:= cFilAtu
		endif
	endif

	RestArea(aAreaSD2)
	RestArea(aAreaSF2)
	RestArea(aArea)

	if empty(cTesEnt)
		Alert("Tes de devolução "+iif(!empty(cTesSaida),"para Tes "+ QZEJ->D1_TES ,"") + "não foi encontrada!")
	endif

	aRet[1] := cTesEnt
	aRet[2] := cLoteCtl

Return aRet
