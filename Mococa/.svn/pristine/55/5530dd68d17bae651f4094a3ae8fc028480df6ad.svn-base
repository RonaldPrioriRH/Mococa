#include "protheus.ch"
#include "topconn.ch"

/*/{Protheus.doc} RFATP002
Pontos de Entrada - Contratos
@author TOTVS
@since 09/03/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

/***********************/
User Function RFATP002()
/***********************/

Local aParam 		:= PARAMIXB
Local oObj			:= aParam[1]
Local cIdPonto		:= aParam[2]
Local oModelZ09		:= oObj:GetModel("Z09MASTER")
Local oModelZ10		:= oObj:GetModel("Z10DETAIL")
Local oModelZ11		:= oObj:GetModel("Z11DETAIL")

Local cQry 			:= ""
Local nI

Local lContinua		:= .T.
Local xRet 			:= .T.

Private	aCposZ09	:= {}
Private	aCposZ10	:= {}
Private	aCposZ11	:= {}

If cIdPonto == 'MODELPOS' .And. (oObj:GetOperation() == 3 .Or. oObj:GetOperation() == 4) //Confirmação da inclusão ou alteração

	If oModelZ09:GetValue('Z09_ABRANG') == "C" //Cliente

		If Empty(oModelZ09:GetValue('Z09_CLIENT')) .Or. Empty(oModelZ09:GetValue('Z09_LOJA'))
			xRet := .F.
			Help( ,, 'Help - MODELPOS',, 'Para abrangência do tipo Cliente, o preenchimento dos campos Cliente e Loja são obrigatórios.', 1, 0 )
		Endif

	Else //Grupo de cliente

		If Empty(oModelZ09:GetValue('Z09_GRPCLI'))
			xRet := .F.
			Help( ,, 'Help - MODELPOS',, 'Para abrangência do tipo Grupo de Cliente, o preenchimento do campo Grp cliente é obrigatório.', 1, 0 )
		Endif
	Endif

	If xRet

		For nI := 1 To oModelZ11:Length()

			oModelZ11:Goline(nI)

			If !oModelZ11:IsDeleted()

				If Select("QRYZ11") > 0
					QRYZ11->(DbCloseArea())
				Endif

				cQry := "SELECT Z11.Z11_CGC, Z11.Z11_CODIGO"
				cQry += " FROM "+RetSqlName("Z09")+" Z09, "+RetSqlName("Z11")+" Z11"
				cQry += " WHERE Z09.D_E_L_E_T_ 	<> '*'"
				cQry += " AND Z11.D_E_L_E_T_ 	<> '*'"
				cQry += " AND Z09.Z09_FILIAL 	= '"+xFilial("Z09")+"'"
				cQry += " AND Z11.Z11_FILIAL 	= '"+xFilial("Z11")+"'"
				cQry += " AND Z09.Z09_CODIGO 	= Z11.Z11_CODIGO"
				cQry += " AND Z11.Z11_CGC 		= '"+oModelZ11:GetValue('Z11_CGC')+"'"
				cQry += " AND (Z09.Z09_STATUS = 'A' OR Z09.Z09_STATUS = 'S') AND (Z09.Z09_DTFINA >= "+DToS(dDataBase)+" OR Z09.Z09_RENAUT = 'T')" //(Ativo Ou Suspenso) E (Vigente Ou Renovação ativa)
				cQry += " AND Z11.Z11_CODIGO	<> '"+oModelZ09:GetValue('Z09_CODIGO')+"'"

				cQry := ChangeQuery(cQry)
				//MemoWrite("c:\temp\RFATP002.txt",cQry)
				TcQuery cQry NEW Alias "QRYZ11"

				If QRYZ11->(!EOF())
					xRet := .F.
					Help( ,, 'Help - MODELPOS',, 'O CNPJ '+AllTrim(QRYZ11->Z11_CGC)+' se encontra relacionado ao contrato '+AllTrim(QRYZ11->Z11_CODIGO)+'. Cliente não pode constar em mais de um contrato vigente.', 1, 0 )
					Exit
				Endif
			Endif
		Next

		If Select("QRYZ11") > 0
			QRYZ11->(DbCloseArea())
		Endif
	Endif

	If xRet

		If oObj:GetOperation() == 4 //Alteração

			AnalisaZ09(@aCposZ09)

			For nI := 1 To Len(aCposZ09)

				If !GeraLog(oModelZ09:GetValue('Z09_CODIGO'),"","","A",aCposZ09[nI][1],aCposZ09[nI][2],aCposZ09[nI][3],cUserName,dDataBase)
					lContinua := .F.
					Exit
				Endif
			Next

			If lContinua

				AnalisaZ10(@aCposZ10,oModelZ09:GetValue('Z09_CODIGO'),oModelZ10)

				For nI := 1 To Len(aCposZ10)

					If aCposZ10[nI][1] == "A" //Item alterado

						If !GeraLog(oModelZ09:GetValue('Z09_CODIGO'),aCposZ10[nI][2],"","A",aCposZ10[nI][3],aCposZ10[nI][4],aCposZ10[nI][5],cUserName,dDataBase)
							lContinua := .F.
							Exit
						Endif
					Else //Item excluído
						If !GeraLog(oModelZ09:GetValue('Z09_CODIGO'),aCposZ10[nI][2],"","E","","","",cUserName,dDataBase)
							lContinua := .F.
							Exit
						Endif
					Endif
				Next
			Endif

			If lContinua

				AnalisaZ11(@aCposZ11,oModelZ09:GetValue('Z09_CODIGO'),oModelZ10,oModelZ11)

				For nI := 1 To Len(aCposZ11)

					If aCposZ11[nI][1] == "A" //Item alterado

						If !GeraLog(oModelZ09:GetValue('Z09_CODIGO'),aCposZ11[nI][2],aCposZ11[nI][3],"A",aCposZ11[nI][4],aCposZ11[nI][5],aCposZ11[nI][6],cUserName,dDataBase)
							lContinua := .F.
							Exit
						Endif
					Else //Item excluído
						If !GeraLog(oModelZ09:GetValue('Z09_CODIGO'),aCposZ11[nI][2],aCposZ11[nI][3],"E","","","",cUserName,dDataBase)
							lContinua := .F.
							Exit
						Endif
					Endif
				Next
			Endif
		Endif
	Endif

ElseIf cIdPonto == 'MODELPOS' .And. oObj:GetOperation() == 5 //Confirmação da exclusão

	If Select("QRYZ13") > 0
		QRYZ13->(DbCloseArea())
	Endif

	cQry := "SELECT Z13_CODIGO"
	cQry += " FROM "+RetSqlName("Z13")+""
	cQry += " WHERE D_E_L_E_T_	<> '*'"
	cQry += " AND Z13_FILIAL	= '"+xFilial("Z09")+"'"
	cQry += " AND Z13_CONTRA	= '"+oModelZ09:GetValue('Z09_CODIGO')+"'"

	cQry := ChangeQuery(cQry)
	//MemoWrite("c:\temp\RFATP002.txt",cQry)
	TcQuery cQry NEW Alias "QRYZ13"

	If QRYZ13->(!EOF())
		xRet := .F.
		Help( ,, 'Help - MODELPOS',, 'O contrato possui movimentação, operação não permitida.', 1, 0 )
	Endif

	If xRet
		GeraLog(oModelZ09:GetValue('Z09_CODIGO'),"","","E","","","",cUserName,dDataBase)
	Endif
Endif

Return xRet

/***********************************/
Static Function AnalisaZ09(aCposZ09)
/***********************************/

Local cCampoZ09	:= ""

SX3->(DbSetOrder(1))
If SX3->(DbSeek("Z09"))

	While SX3->(!EOF()) .AND. SX3->X3_ARQUIVO == "Z09"

		If SX3->X3_CONTEXT <> "V" .And. X3Uso(SX3->X3_USADO) .And. cNivel >= SX3->X3_NIVEL

			cCampoZ09 := SX3->X3_CAMPO

			If SX3->X3_TIPO == "C" .Or. SX3->X3_TIPO == "M" // se o campo for tipo texto ou memo, devo comparar o tamanho dos caracteres

				If Z09->&cCampoZ09 <> M->&cCampoZ09 .Or. Len(Z09->&cCampoZ09) <> Len(M->&cCampoZ09)
					AAdd(aCposZ09,{cCampoZ09,Z09->&cCampoZ09,M->&cCampoZ09})
				Endif
			Else

				If Z09->&cCampoZ09 <> M->&cCampoZ09

					If SX3->X3_TIPO == "N"
						AAdd(aCposZ09,{cCampoZ09,cValToChar(Z09->&cCampoZ09),cValToChar(M->&cCampoZ09)})

					ElseIf SX3->X3_TIPO == "D"
						AAdd(aCposZ09,{cCampoZ09,DToC(Z09->&cCampoZ09),DToC(M->&cCampoZ09)})

					ElseIf SX3->X3_TIPO == "L"
						AAdd(aCposZ09,{cCampoZ09,IIF(Z09->&cCampoZ09,".T.",".F."),IIF(M->&cCampoZ09,".T.",".F.")})

					Else
						AAdd(aCposZ09,{cCampoZ09,Z09->&cCampoZ09,M->&cCampoZ09})
					Endif
				Endif
			Endif
		Endif

		SX3->(DbSkip())
	EndDo
Endif

Return

/*******************************************************/
Static Function AnalisaZ10(aCposZ10,cContrato,oModelZ10)
/*******************************************************/

Local cCampoZ10	:= ""
Local nI

DbSelectArea("Z10")
Z10->(DbSetOrder(1)) //Z10_FILIAL+Z10_CODIGO+Z10_ITEM

SX3->(DbSetOrder(1))

For nI := 1 To oModelZ10:Length()

	oModelZ10:Goline(nI)

	If !oModelZ10:IsDeleted()

		If Z10->(DbSeek(xFilial("Z10")+cContrato+oModelZ10:GetValue('Z10_ITEM')))

			If SX3->(DbSeek("Z10"))

				While SX3->(!EOF()) .AND. SX3->X3_ARQUIVO == "Z10"

					If SX3->X3_CONTEXT <> "V" .And. X3Uso(SX3->X3_USADO) .And. cNivel >= SX3->X3_NIVEL .And. SX3->X3_CAMPO <> "Z10_CODIGO"

						cCampoZ10 := SX3->X3_CAMPO

						If SX3->X3_TIPO == "C" .Or. SX3->X3_TIPO == "M" // se o campo for tipo texto ou memo, devo comparar o tamanho dos caracteres

							If Z10->&cCampoZ10 <> oModelZ10:GetValue(cCampoZ10) .Or. Len(Z10->&cCampoZ10) <> Len(oModelZ10:GetValue(cCampoZ10))
								AAdd(aCposZ10,{"A",oModelZ10:GetValue('Z10_ITEM'),cCampoZ10,Z10->&cCampoZ10,oModelZ10:GetValue(cCampoZ10)})
							Endif
						Else

							If Z10->&cCampoZ10 <> oModelZ10:GetValue(cCampoZ10)

								If SX3->X3_TIPO == "N"
									AAdd(aCposZ10,{"A",oModelZ10:GetValue('Z10_ITEM'),cCampoZ10,cValToChar(Z10->&cCampoZ10),cValToChar(oModelZ10:GetValue(cCampoZ10))})

								ElseIf SX3->X3_TIPO == "D"
									AAdd(aCposZ10,{"A",oModelZ10:GetValue('Z10_ITEM'),cCampoZ10,DToC(Z10->&cCampoZ10),DToC(oModelZ10:GetValue(cCampoZ10))})

								ElseIf SX3->X3_TIPO == "L"
									AAdd(aCposZ10,{"A",oModelZ10:GetValue('Z10_ITEM'),cCampoZ10,IIF(Z10->&cCampoZ10,".T.",".F."),IIF(oModelZ10:GetValue(cCampoZ10),".T.",".F.")})

								Else
									AAdd(aCposZ10,{"A",oModelZ10:GetValue('Z10_ITEM'),cCampoZ10,Z10->&cCampoZ10,oModelZ10:GetValue(cCampoZ10)})
								Endif
							Endif
						Endif
					Endif

					SX3->(DbSkip())
				EndDo
			Endif
		Endif
	Else
		AAdd(aCposZ10,{"E",oModelZ10:GetValue('Z10_ITEM')})
	Endif
Next

Return

/*****************************************************************/
Static Function AnalisaZ11(aCposZ11,cContrato,oModelZ10,oModelZ11)
/*****************************************************************/

Local cCampoZ11	:= ""
Local nI, nJ

DbSelectArea("Z11")
Z11->(DbSetOrder(1)) //Z11_FILIAL+Z11_CODIGO+Z11_ITEMFI+Z11_ITEM

SX3->(DbSetOrder(1))

For nI := 1 To oModelZ10:Length()

	oModelZ10:Goline(nI)

	If !oModelZ10:IsDeleted()

		For nJ := 1 To oModelZ11:Length()

			oModelZ11:Goline(nJ)

			If !oModelZ11:IsDeleted()

				If Z11->(DbSeek(xFilial("Z11")+cContrato+oModelZ10:GetValue('Z10_ITEM')+oModelZ11:GetValue('Z11_ITEM')))

					If SX3->(DbSeek("Z11"))

						While SX3->(!EOF()) .AND. SX3->X3_ARQUIVO == "Z11"

							If SX3->X3_CONTEXT <> "V" .And. X3Uso(SX3->X3_USADO) .And. cNivel >= SX3->X3_NIVEL .And. SX3->X3_CAMPO <> "Z11_CODIGO" .And.;
								SX3->X3_CAMPO <> "Z11_ITEMFI"

								cCampoZ11 := SX3->X3_CAMPO

								If SX3->X3_TIPO == "C" .Or. SX3->X3_TIPO == "M" // se o campo for tipo texto ou memo, devo comparar o tamanho dos caracteres

									If Z11->&cCampoZ11 <> oModelZ11:GetValue(cCampoZ11) .Or. Len(Z11->&cCampoZ11) <> Len(oModelZ11:GetValue(cCampoZ11))
										AAdd(aCposZ11,{"A",;
											oModelZ10:GetValue('Z10_ITEM'),;
											oModelZ11:GetValue('Z11_ITEM'),;
											cCampoZ11,;
											Z11->&cCampoZ11,;
											oModelZ11:GetValue(cCampoZ11)})
									Endif
								Else

									If Z11->&cCampoZ11 <> oModelZ11:GetValue(cCampoZ11)

										If SX3->X3_TIPO == "N"
											AAdd(aCposZ11,{"A",;
												oModelZ10:GetValue('Z10_ITEM'),;
												oModelZ11:GetValue('Z11_ITEM'),;
												cCampoZ11,;
												cValToChar(Z11->&cCampoZ11),;
												cValToChar(oModelZ11:GetValue(cCampoZ11))})

										ElseIf SX3->X3_TIPO == "D"
											AAdd(aCposZ11,{"A",;
												oModelZ10:GetValue('Z10_ITEM'),;
												oModelZ11:GetValue('Z11_ITEM'),;
												cCampoZ11,;
												DToC(Z11->&cCampoZ11),;
												DToC(oModelZ11:GetValue(cCampoZ11))})

										ElseIf SX3->X3_TIPO == "L"
											AAdd(aCposZ11,{"A",;
												oModelZ10:GetValue('Z10_ITEM'),;
												oModelZ11:GetValue('Z11_ITEM'),;
												cCampoZ11,;
												IIF(Z11->&cCampoZ11,".T.",".F."),;
												IIF(oModelZ11:GetValue(cCampoZ11),".T.",".F.")})

										Else
											AAdd(aCposZ11,{"A",;
												oModelZ10:GetValue('Z10_ITEM'),;
												oModelZ11:GetValue('Z11_ITEM'),;
												cCampoZ11,;
												Z11->&cCampoZ11,;
												oModelZ11:GetValue(cCampoZ11)})
										Endif
									Endif
								Endif
							Endif

							SX3->(DbSkip())
						EndDo
					Endif
				Endif
			Else
				AAdd(aCposZ11,{"E",oModelZ10:GetValue('Z10_ITEM'),oModelZ11:GetValue('Z11_ITEM')})
			Endif
		Next nJ
	Endif
Next nI

Return

/***********************************************************************************************/
Static Function GeraLog(cContrato,cClausula,cCliCla,cAcao,cCampo,cInfAnt,cInfAtu,cUsuario,dData)
/***********************************************************************************************/

Local lRet 			:=  .T.

Local aArea			:= GetArea()

Local aCabec		:= {}

//Cabeçalho
AAdd(aCabec,{"Z23_CONTRA",	cContrato})
AAdd(aCabec,{"Z23_CLAUSU",	cClausula})
AAdd(aCabec,{"Z23_CLICLA",	cCliCla})
AAdd(aCabec,{"Z23_ACAO",	cAcao})
AAdd(aCabec,{"Z23_CAMPO",	cCampo})
AAdd(aCabec,{"Z23_INFANT",	cInfAnt})
AAdd(aCabec,{"Z23_INFATU",	cInfAtu})
AAdd(aCabec,{"Z23_USER",	cUsuario})
AAdd(aCabec,{"Z23_DATA",	dData})

If !IncLog(aCabec)
	lRet := .F.
Endif

RestArea(aArea)

Return lRet

/*****************************/
Static Function IncLog(aCabec)
/*****************************/

Local lRet 		:= .T.

Local oModelExec
Local oAux
Local oStruct

Local nI,nPos //nJ

Local aAux		:= {}
Local lAux		:= .T.
//Local nItErro	:= 0

DbSelectArea("Z23")
Z23->(DbSetOrder(1)) //Z23_FILIAL+Z23_CODIGO

oModelExec := FWLoadModel("RFATA009")
oModelExec:SetOperation(3) //Inclusão
oModelExec:Activate()

oAux 	:= oModelExec:GetModel("Z23MASTER")
oStruct := oAux:GetStruct()
aAux 	:= oStruct:GetFields()

If lRet

	For nI := 1 To Len(aCabec)

		If (nPos := aScan(aAux,{|x| AllTrim(x[3]) == AllTrim(aCabec[nI][1])})) > 0

			If !(lAux := oModelExec:SetValue("Z23MASTER",aCabec[nI][1],aCabec[nI][2] ) )
				lRet := .F.
				Exit
			EndIf
		EndIf
	Next nI
EndIf

If lRet

	If (lRet := oModelExec:VldData())
		oModelExec:CommitData()
	EndIf
EndIf

If !lRet

	aErro := oModelExec:GetErrorMessage()

	AutoGrLog("Id do formulário de origem:	" + ' [' + AllToChar(aErro[1]) + ']')
	AutoGrLog("Id do campo de origem: 		" + ' [' + AllToChar(aErro[2]) + ']')
	AutoGrLog("Id do formulário de erro: 	" + ' [' + AllToChar(aErro[3]) + ']')
	AutoGrLog("Id do campo de erro: 		" + ' [' + AllToChar(aErro[4]) + ']')
	AutoGrLog("Id do erro: 					" + ' [' + AllToChar(aErro[5]) + ']')
	AutoGrLog("Mensagem do erro: 			" + ' [' + AllToChar(aErro[6]) + ']')
	AutoGrLog("Mensagem da solução: 		" + ' [' + AllToChar(aErro[7]) + ']')
	AutoGrLog("Valor atribuído: 			" + ' [' + AllToChar(aErro[8]) + ']')
	AutoGrLog("Valor anterior: 				" + ' [' + AllToChar(aErro[9]) + ']')

	MostraErro()
EndIf

oModelExec:DeActivate()

Return lRet
