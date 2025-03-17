#Include "TOTVS.CH"
#Include "PRTOPDEF.CH"
#Include "TopConn.ch"


/*/{Protheus.doc} SchedDef
Definicao dos parametros do Protheus Schedule
@type function
@version MP12.10.01
@author Luiz Fael
@since 24/05/2024
@history 24/05/2024,LUIZ FAEL,Desenvolvimento
@return variant, description
/*/
Static Function SchedDef()

	Local aParams := {}

	aAdd(aParams,"P"        )
	aAdd(aParams, "PARAMDEF")
	aAdd(aParams, "CARC5C"  )
	aAdd(aParams, Nil       )
	aAdd(aParams, Nil       )

Return aParams


/*/{Protheus.doc} carc5class
Classificão automatica da nota de entrada
@type function
@version  12.23
@author EVERYSYS
@since 8/13/2024
@return variant, boleana
/*/
User Function carc5class(cFilEntr)
	Local lRet 		:= .f.
	//Local cAlias    := GetNextAlias()
	Local cAliasSF1 := GetNextAlias()
	Local aCab		:= {}
	Local aItem 	:= {}
	Local aItem2 	:= {}
	Local cOperEnt	:= SUPERGETMV("MOC_OPER",.T.,"60")
	//Local cFILENT	:= ""
	Local cNOTA		:= ""
	Local cSERIE	:= ""
	Local cFORNECE	:= ""
	Local cLOJA		:= ""
	Local cTxt 		:= ""
	Local nI 		:= 0
	Local cBkpFant  := cFilAnt
	Private cEof        := chr(13)+chr(10)
	Private lMsHelpAuto := .T.
	Private lMsErroAuto := .F.
	Default lCarcSaf2   := .f.

	cFilAnt := cFilEntr

	SA2->(DbSetOrder(1))

	//SetModulo( "SIGACOM" , "FIN" )
	If LockByName("CARC5CLASS", .T., .T.)

		cQry    := "SELECT ZA0_FILIAL, ZA0_ETAPA, ZA0_STATUS, ZA0_CHAVE, ZA0_NOTA, ZA0_SERSAI, ZA0_FILENT, ZA0_CLIENT "+cEof
		cQry    += ",ZA0_LOJCLI, R_E_C_N_O_ ,TRIM(TO_CHAR(MOC.DTRECEBIMENTO)) AS DATA "+cEof
		cQry    += "FROM ZA0010 ZA0 "+cEof
		cQry    += "INNER JOIN MOCMM0004@sigofc MOC ON( MOC.CHV = ZA0.ZA0_CHAVE "+cEof
		cQry    += "AND TRIM(TO_CHAR(MOC.DTRECEBIMENTO)) <> ' ' ) "+cEof
		cQry    += "WHERE TRIM(ZA0.ZA0_FILENT) = '"+cFilEnt+"' "+cEof
		cQry    += "AND TRIM(ZA0.ZA0_ETAPA) = '7' "+cEof
		cQry    += "AND TRIM(ZA0.ZA0_NOTA) <> ' ' "+cEof
		cQry    += "AND ZA0_CHAVE = "+str(za0->za0_chave,10)+" "+cEof
		cQry    += "AND ZA0.D_E_L_E_T_ = ' '  "+cEof
		cQry    += "GROUP BY ZA0_FILIAL,ZA0_ETAPA,ZA0_STATUS,ZA0_CHAVE,ZA0_NOTA,ZA0_SERSAI,ZA0_FILENT,ZA0_CLIENT "+cEof
		cQry    += ",ZA0_LOJCLI,R_E_C_N_O_,TRIM(TO_CHAR(MOC.DTRECEBIMENTO)) "+cEof
		MemoWrite("c:\temp\carclass.sql",cQry)
		cQry := ChangeQuery(cQry)

		If Select("CLASF")
			clasf->(dBcloseArea())
		Endif
		TcQuery cQry New Alias "CLASF"

		/*
		beginSql alias cAlias
				SELECT
				ZA0.ZA0_FILIAL  AS FILIAL
				,ZA0.ZA0_ETAPA  AS ETAPA
				,ZA0.ZA0_STATUS AS STATUS
				,ZA0.ZA0_CHAVE  AS CHAVE
				,ZA0.ZA0_NOTA   AS NOTA
				,ZA0.ZA0_SERSAI AS SERIE
				,ZA0.ZA0_FILENT AS FILENT
				,ZA0.ZA0_CLIENT AS CLIENTE
				,ZA0.ZA0_LOJCLI AS LOJA
				,ZA0.R_E_C_N_O_ AS ZA0REG
				,TRIM(TO_CHAR(MOC.DTRECEBIMENTOCDM)) AS DATA
				FROM %table:ZA0% ZA0
				INNER JOIN mocmm0004@sigofc MOC 
				ON( MOC.CHV = ZA0.ZA0_CHAVE 
				AND TRIM(TO_CHAR(MOC.DTRECEBIMENTOCDM)) <> ' ' )
				WHERE
				TRIM(ZA0.ZA0_FILENT) = %Exp:cFilEnt%
				AND TRIM(ZA0.ZA0_ETAPA) = '7'
				AND TRIM(ZA0.ZA0_NOTA) <> ' '
				AND ZA0.%notDel%
				GROUP BY 
				ZA0.ZA0_FILIAL,ZA0.ZA0_ETAPA,ZA0.ZA0_STATUS,ZA0.ZA0_CHAVE,ZA0.ZA0_NOTA,ZA0.ZA0_SERSAI
				,ZA0.ZA0_FILENT,ZA0.ZA0_CLIENT,ZA0.ZA0_LOJCLI,ZA0.R_E_C_N_O_
				,TRIM(TO_CHAR(MOC.DTRECEBIMENTOCDM))

		endSql*/

		clasf->(dbgoTop())
		If  !clasf->(Eof())

			Do While !clasf->(Eof())
		
				//cFILENT		:= PADR((cAlias)->FILENT	,TAMSX3("F1_FILIAL")[1])
				cNOTA		:= clasf->za0_nota  		// PADR((cAlias)->NOTA		,TAMSX3("F1_DOC")[1])
				cSERIE		:= clasf->za0_sersai  	// PADR((cAlias)->SERIE		,TAMSX3("F1_SERIE")[1])
				cFORNECE	:= clasf->za0_client  	//PADR((cAlias)->CLIENTE	,TAMSX3("F1_FORNECE")[1])
				cLOJA		:= clasf->za0_lojcli		// PADR((cAlias)->LOJA		,TAMSX3("F1_LOJA")[1])
				beginSql alias cAliasSF1
					SELECT
					SF1.F1_FILIAL
					,SF1.F1_TIPO 
					,SF1.F1_DOC
					,SF1.F1_SERIE
					,SF1.F1_FORNECE
					,SF1.F1_LOJA
					,SF1.F1_EMISSAO
					,SF1.R_E_C_N_O_ AS REGSF1
					,SD1.D1_COD
					,SD1.D1_QUANT
					,SD1.D1_VUNIT
					,SD1.D1_TOTAL
					,SD1.R_E_C_N_O_ AS REGSD1
					FROM %table:SF1% SF1 (nolock)
					INNER JOIN %table:SD1% SD1 (nolock)
					ON( SD1.D1_FILIAL 		= SF1.F1_FILIAL
						AND SD1.D1_DOC  	= SF1.F1_DOC
						AND SD1.D1_SERIE	= SF1.F1_SERIE
						AND SD1.D1_FORNECE	= SF1.F1_FORNECE
						AND SD1.D1_LOJA		= SF1.F1_LOJA
						AND SD1.%notDel%)
					WHERE
					SF1.F1_FILIAL 		= %Exp:cFilEnt%
					AND SF1.F1_DOC  	= %Exp:cNOTA%
					AND SF1.F1_SERIE	= %Exp:cSERIE%
					AND SF1.F1_FORNECE	= %Exp:cFORNECE%
					AND SF1.F1_LOJA		= %Exp:cLOJA%
					AND SF1.%notDel%
				endSql

				(cAliasSF1)->(dbGotop())

				If !(cAliasSF1)->(Eof())

					aCab	:= {}
					aItem 	:= {}
					aItem2	:= {}

					If SA2->(dbSeek(xFilial("SA2")+(cAliasSF1)->F1_FORNECE+(cAliasSF1)->F1_LOJA))
						aAdd(aCab,{"F1_FILIAL"  ,(cAliasSF1)->F1_FILIAL   	, Nil})
						aAdd(aCab,{"F1_TIPO"   	,(cAliasSF1)->F1_TIPO   	, Nil})
						aAdd(aCab,{"F1_DOC"    	,(cAliasSF1)->F1_DOC    	, Nil})
						aAdd(aCab,{"F1_SERIE"  	,(cAliasSF1)->F1_SERIE  	, Nil})
						aAdd(aCab,{"F1_EMISSAO"	,(cAliasSF1)->F1_EMISSAO	, Nil})
						aAdd(aCab,{"F1_FORNECE"	,(cAliasSF1)->F1_FORNECE	, Nil})
						aAdd(aCab,{"F1_LOJA"   	,(cAliasSF1)->F1_LOJA   	, Nil})

						While !(cAliasSF1)->(Eof())
							aItem := {}
							aadd(aItem,{"D1_COD" 		,(cAliasSF1)->D1_COD	,Nil})
							aadd(aItem,{"D1_QUANT"		,(cAliasSF1)->D1_QUANT	,Nil})
							aadd(aItem,{"D1_VUNIT"		,(cAliasSF1)->D1_VUNIT	,Nil})
							aadd(aItem,{"D1_TOTAL"		,(cAliasSF1)->D1_TOTAL	,Nil})
							aadd(aItem,{"D1_OPER"		,cOperEnt				,Nil})
							AADD(aItem2,aItem)
							(cAliasSF1)->(dbSkip())
						End
					Else
						ConOut("carc5class - Fornecedor não localizado")
					EndIf

					If Len(aItem2) <> 0
						//PUTMV("MV_CHVNFE", .F.)
						Begin Transaction 

							MSExecAuto({|x,y,z| MATA103(x,y,z)},aCab,aItem2,4)
							If sf1->((F1_STATCON $ "1|4") .OR. EMPTY(F1_STATCON)) .AND. F1_TIPO=="N" .AND. (F1_STATUS<>"B" .AND. F1_STATUS<>"C") ;
								.and. sf1->(f1_doc == aCab[3,2]) .and. lMsErroAuto

								// Esta condição indica que a nota já esta classificada, então torna o lMsErroAuto falso para que atualize 
								// o flag da ZA0 como finalizado
								lMsErroAuto := .f.
								lRet 		:= .t.
							Endif
							If lMsErroAuto
								If !lCarcSaf2
									MostraErro()
								Endif

								aErroAuto := GetAutoGRLog()
								cTxt := ""
								For nI := 1 To Len(aErroAuto)
									cTxt += aErroAuto[nI] + Chr(13) + Chr(10)
								Next
								cMsgErr := "Falha execauto de classificação!" + CRLF
								ConOut("carc5class - "+ cMsgErr + cTxt)
								DisarmTransaction()

								cEtapa := '7'
								cStatus := 'E'
								U_AtualZA0(ZA0->ZA0_CHAVE,cEtapa,cStatus,ZA0->ZA0_FILPED,ZA0->ZA0_FILENT,ZA0->ZA0_PEDIDO,ZA0->ZA0_SERSAI,ZA0->ZA0_NOTA,"",ZA0->ZA0_CLIENT,ZA0->ZA0_LOJCLI)
							Else
								lRet 		:= .t.
							EndIf

						End Transaction
						//PUTMV("MV_CHVNFE", .T.)
					EndIf
				EndIf

				(cAliasSF1)->(dbCloseArea())
				clasf->(dbSkip())
			EndDo
			clasf->(dbCloseArea())
			FwFreeArray(aCab)
			FwFreeArray(aItem)
			FwFreeArray(aItem2)
			UnlockByName("CARC5CLASS", .t., .t.)
		EndIf
	EndIf
	cFilAnt  := cBkpFant

Return(lRet)

/*/{Protheus.doc} carc5Mok
MOC carc5
@type function
@version 12.2310 
@author EVERYSYS
@since 8/13/2024
@return variant, description
/*/
User Function carc5Mok()
	Local lRet 		:= .F.
	Local aFilial 	:= {}
	Local nI 		:= 0
	aadd(aFilial,{'01','0104'})
	For nI := 1 to Len(aFilial)
		//Local nDia := 0
		If RpcSetEnv(aFilial[nI][01],aFilial[nI][02],,,,GetEnvServer(),{ })
			lRet := .T.
			U_carc5class()
		EndIf
		If lRet
			RpcClearEnv()
		EndIf
	Next nI
Return lRet
