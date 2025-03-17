#include "protheus.ch"
#include "fwmvcdef.ch"

/*/{Protheus.doc} RFATE004
Log de movimentação (Inclusão) - Contratos
@author TOTVS
@since 10/03/2017
@version P12
@param cTp,cContrato,aItClausu,cCliFor,cLoja,cIdMovCtr,cPv,cItPv,nVlrNet,nVlrTab,nIcmsSt,nPis,nCofins,nIcms,nVlrApl
@return nulo
/*/

/***************************************************************************************************************************/
User Function RFATE004(cTp,cContrato,aItClausu,cCliFor,cLoja,cIdMovCtr,cPv,cItPv,nVlrNet,nVlrTab,nIcmsSt,nPis,nCofins,nIcms,nSufra)
/***************************************************************************************************************************/

Local lRet 			:=  .T.

Local aArea			:= GetArea()
Local aAreaZ09		:= GetArea("Z09")
Local aAreaZ10		:= GetArea("Z10")

Local aCabec		:= {}
Local aAux			:= {}
Local aItens		:= {}

Local nI
Local nVlrBas		:= 0

Default cPv			:= Space(TamSX3("Z13_PEDIDO")[1])
Default nVlrNet		:= 0
Default nVlrTab		:= 0

DbSelectArea("Z09")
Z09->(DbSetOrder(1)) //Z09_FILIAL+Z09_CODIGO
Z09->(DbSeek(xFilial("Z09")+cContrato))

DbSelectArea("Z10")
Z10->(DbSetOrder(1)) //Z10_FILIAL+Z10_CODIGO+Z10_ITEM

Do Case

	Case cTp == "AE" //Aplicação eventual

		//Cabeçalho
		AAdd(aCabec,{"Z13_DATA",	dDataBase})
		AAdd(aCabec,{"Z13_CONTRA",	cContrato})
		AAdd(aCabec,{"Z13_PEDIDO",	Space(TamSX3("Z13_PEDIDO")[1])})
		AAdd(aCabec,{"Z13_ITEMPV",	Space(TamSX3("C6_ITEM")[1])})
		AAdd(aCabec,{"Z13_VLRTAB",	0})
		AAdd(aCabec,{"Z13_ICMSST",	0})
		AAdd(aCabec,{"Z13_PIS",		0})
		AAdd(aCabec,{"Z13_COFINS",	0})
		AAdd(aCabec,{"Z13_ICMS",	0})
		AAdd(aCabec,{"Z13_VLRNET",	0})
		AAdd(aCabec,{"Z13_CLIFOR",	cCliFor})
		AAdd(aCabec,{"Z13_LOJA",	cLoja})

		If Z09->Z09_TITFIN == "A" //A Pagar
			AAdd(aCabec,{"Z13_TPMOVI",	"D"})
			AAdd(aCabec,{"Z13_NOME",Posicione("SA2",1,xFilial("SA2")+cCliFor+cLoja,"A2_NOME")})
			AAdd(aCabec,{"Z13_CGC",Posicione("SA2",1,xFilial("SA2")+cCliFor+cLoja,"A2_CGC")})
		Else
			AAdd(aCabec,{"Z13_TPMOVI",	"C"})
			AAdd(aCabec,{"Z13_NOME",Posicione("SA1",1,xFilial("SA1")+cCliFor+cLoja,"A1_NOME")})
			AAdd(aCabec,{"Z13_CGC",Posicione("SA1",1,xFilial("SA1")+cCliFor+cLoja,"A1_CGC")})
		Endif

		AAdd(aCabec,{"Z13_BSCALC",	Z09->Z09_BSCALC})
		AAdd(aCabec,{"Z13_TITFIN",	Z09->Z09_TITFIN})
		AAdd(aCabec,{"Z13_NATTIT",	Z09->Z09_NATTIT})
		AAdd(aCabec,{"Z13_USER",	cUserName})

		//Itens
		For nI := 1 To Len(aItClausu)

			Z10->(DbSeek(xFilial("Z10")+cContrato+aItClausu[nI]))

			aAux := {}

			AAdd(aAux,{"Z14_ITEM",		StrZero(nI,2)})
			AAdd(aAux,{"Z14_ITCLAU",	aItClausu[nI]})
			AAdd(aAux,{"Z14_CLAUSU",	Z10->Z10_CLAUSU})
			AAdd(aAux,{"Z14_DESCCL",	Z10->Z10_DESCCL})
			AAdd(aAux,{"Z14_PERIOD",	Z10->Z10_PERIOD})
			AAdd(aAux,{"Z14_DESCPE",	Z10->Z10_DESCPE})
			AAdd(aAux,{"Z14_APLICA",	Z10->Z10_APLICA})
			AAdd(aAux,{"Z14_GRUPO",		Z10->Z10_GRUPO})
			AAdd(aAux,{"Z14_DESCGR",	Z10->Z10_DESCGR})
			AAdd(aAux,{"Z14_PRODUT",	Z10->Z10_PRODUT})
			AAdd(aAux,{"Z14_DESCPR",	Z10->Z10_DESCPR})
			AAdd(aAux,{"Z14_FXINIC",	Z10->Z10_FXINIC})
			AAdd(aAux,{"Z14_FXFINA",	Z10->Z10_FXFINA})
			AAdd(aAux,{"Z14_TPFAIX",	Z10->Z10_TPFAIX})
			AAdd(aAux,{"Z14_VLRAPL",	Z10->Z10_VLAPLI})
			AAdd(aAux,{"Z14_TPVLRA",	Z10->Z10_TPVALO})
			AAdd(aAux,{"Z14_VLRPAR",	0})
			AAdd(aAux,{"Z14_LA",		Space(TamSX3("Z14_LA")[1])})
			AAdd(aAux,{"Z14_APURAD",	Space(TamSX3("Z14_APURAD")[1])})

			AAdd(aItens,aAux)
		Next

	Case cTp == "AF" //Aplicação faturamento

		//Cabeçalho
		AAdd(aCabec,{"Z13_DATA",	dDataBase})
		AAdd(aCabec,{"Z13_CONTRA",	cContrato})
		AAdd(aCabec,{"Z13_TPMOVI",	"C"})
		AAdd(aCabec,{"Z13_PEDIDO",	cPv})
		AAdd(aCabec,{"Z13_ITEMPV",	cItPv})
		AAdd(aCabec,{"Z13_VLRTAB",	nVlrTab})
		AAdd(aCabec,{"Z13_ICMSST",	nIcmsSt})
		AAdd(aCabec,{"Z13_PIS",		nPis})
		AAdd(aCabec,{"Z13_COFINS",	nCofins})
		AAdd(aCabec,{"Z13_ICMS",	nIcms})

		If Z09->Z09_BSCALC == "L" //Líquida
			nVlrBas	:= Round(nVlrNet - nPis - nCofins - nIcms,2)

		ElseIf Z09->Z09_BSCALC == "B" //Bruta
			nVlrBas	:= Round(nVlrNet + nIcmsSt,2)

		Else //Bruta s/ ST
			nVlrBas	:= Round(nVlrNet,2)
		Endif
		nVlrBas -= nSufra //retiro o suframa quando tem
		AAdd(aCabec,{"Z13_VLRBAS",	nVlrBas})

		AAdd(aCabec,{"Z13_VLRNET",	nVlrNet})
		AAdd(aCabec,{"Z13_CLIFOR",	cCliFor})
		AAdd(aCabec,{"Z13_LOJA",	cLoja})
		AAdd(aCabec,{"Z13_NOME",	Posicione("SA1",1,xFilial("SA1")+cCliFor+cLoja,"A1_NOME")})
		AAdd(aCabec,{"Z13_CGC",		Posicione("SA1",1,xFilial("SA1")+cCliFor+cLoja,"A1_CGC")})
		AAdd(aCabec,{"Z13_BSCALC",	Z09->Z09_BSCALC})
		AAdd(aCabec,{"Z13_TITFIN",	Z09->Z09_TITFIN})
		AAdd(aCabec,{"Z13_NATTIT",	Z09->Z09_NATTIT})
		AAdd(aCabec,{"Z13_USER",	cUserName})

		//Itens
		For nI := 1 To Len(aItClausu)

			Z10->(DbSeek(xFilial("Z10")+cContrato+aItClausu[nI]))

			aAux := {}

			AAdd(aAux,{"Z14_ITEM",		StrZero(nI,2)})
			AAdd(aAux,{"Z14_ITCLAU",	aItClausu[nI]})
			AAdd(aAux,{"Z14_CLAUSU",	Z10->Z10_CLAUSU})
			AAdd(aAux,{"Z14_DESCCL",	Z10->Z10_DESCCL})
			AAdd(aAux,{"Z14_PERIOD",	Z10->Z10_PERIOD})
			AAdd(aAux,{"Z14_DESCPE",	Z10->Z10_DESCPE})
			AAdd(aAux,{"Z14_APLICA",	Z10->Z10_APLICA})
			AAdd(aAux,{"Z14_GRUPO",		Z10->Z10_GRUPO})
			AAdd(aAux,{"Z14_DESCGR",	Z10->Z10_DESCGR})
			AAdd(aAux,{"Z14_PRODUT",	Z10->Z10_PRODUT})
			AAdd(aAux,{"Z14_DESCPR",	Z10->Z10_DESCPR})
			AAdd(aAux,{"Z14_FXINIC",	Z10->Z10_FXINIC})
			AAdd(aAux,{"Z14_FXFINA",	Z10->Z10_FXFINA})
			AAdd(aAux,{"Z14_TPFAIX",	Z10->Z10_TPFAIX})
			AAdd(aAux,{"Z14_VLRAPL",	Z10->Z10_VLAPLI})
			AAdd(aAux,{"Z14_TPVLRA",	Z10->Z10_TPVALO})

			/*If Z09->Z09_BSCALC == "L" //Líquida
				nVlrPar	:= Round(((nVlrTab - nPis - nCofins - nIcms) / (1 - (Z10->Z10_VLAPLI / 100))) - (nVlrTab - nPis - nCofins - nIcms),2)

			ElseIf Z09->Z09_BSCALC == "B" //Bruta
				nVlrPar	:= Round(((nVlrTab + nIcmsSt) / (1 - (Z10->Z10_VLAPLI / 100))) - (nVlrTab + nIcmsSt),2)

			Else //Bruta s/ ST
				nVlrPar	:= Round((nVlrTab / (1 - (Z10->Z10_VLAPLI / 100))) - nVlrTab,2)
			Endif*/
			nVlrPar	:= NoRound((nVlrBas * (Z10->Z10_VLAPLI / 100) ) ,6)
			AAdd(aAux,{"Z14_VLRPAR",	nVlrPar})

			AAdd(aAux,{"Z14_LA",		Space(TamSX3("Z14_LA")[1])})
			AAdd(aAux,{"Z14_APURAD",	Space(TamSX3("Z14_APURAD")[1])})

			AAdd(aItens,aAux)
		Next

	Case cTp == "DV" //Devolução de venda

		//Cabeçalho
		AAdd(aCabec,{"Z13_DATA",	dDataBase})
		AAdd(aCabec,{"Z13_CONTRA",	cContrato})
		AAdd(aCabec,{"Z13_TPMOVI",	"D"})
		AAdd(aCabec,{"Z13_PEDIDO",	cPv})
		AAdd(aCabec,{"Z13_ITEMPV",	cItPv})
		AAdd(aCabec,{"Z13_VLRTAB",	nVlrTab})
		AAdd(aCabec,{"Z13_ICMSST",	0})
		AAdd(aCabec,{"Z13_PIS",		0})
		AAdd(aCabec,{"Z13_COFINS",	0})
		AAdd(aCabec,{"Z13_ICMS",	0})
		AAdd(aCabec,{"Z13_VLRNET",	nVlrNet})
		AAdd(aCabec,{"Z13_CLIFOR",	cCliFor})
		AAdd(aCabec,{"Z13_LOJA",	cLoja})
		AAdd(aCabec,{"Z13_NOME",	Posicione("SA1",1,xFilial("SA1")+cCliFor+cLoja,"A1_NOME")})
		AAdd(aCabec,{"Z13_CGC",		Posicione("SA1",1,xFilial("SA1")+cCliFor+cLoja,"A1_CGC")})
		AAdd(aCabec,{"Z13_BSCALC",	Z09->Z09_BSCALC})
		AAdd(aCabec,{"Z13_TITFIN",	Z09->Z09_TITFIN})
		AAdd(aCabec,{"Z13_NATTIT",	Z09->Z09_NATTIT})
		AAdd(aCabec,{"Z13_USER",	cUserName})

		//Itens
		For nI := 1 To Len(aItClausu)

			aAux := {}

			AAdd(aAux,{"Z14_ITEM",		StrZero(nI,2)})
			AAdd(aAux,{"Z14_ITCLAU",	aItClausu[nI][1]})
			AAdd(aAux,{"Z14_CLAUSU",	aItClausu[nI][2]})
			AAdd(aAux,{"Z14_DESCCL",	aItClausu[nI][3]})
			AAdd(aAux,{"Z14_PERIOD",	aItClausu[nI][4]})
			AAdd(aAux,{"Z14_DESCPE",	aItClausu[nI][5]})
			AAdd(aAux,{"Z14_APLICA",	aItClausu[nI][6]})
			AAdd(aAux,{"Z14_GRUPO",		aItClausu[nI][7]})
			AAdd(aAux,{"Z14_DESCGR",	aItClausu[nI][8]})
			AAdd(aAux,{"Z14_PRODUT",	aItClausu[nI][9]})
			AAdd(aAux,{"Z14_DESCPR",	aItClausu[nI][10]})
			AAdd(aAux,{"Z14_FXINIC",	aItClausu[nI][11]})
			AAdd(aAux,{"Z14_FXFINA",	aItClausu[nI][12]})
			AAdd(aAux,{"Z14_TPFAIX",	aItClausu[nI][13]})
			AAdd(aAux,{"Z14_VLRAPL",	aItClausu[nI][14]})
			AAdd(aAux,{"Z14_TPVLRA",	aItClausu[nI][15]})

			nVlrPar	:= NoRound((nVlrNet / (1 - (aItClausu[nI][14] / 100))) - nVlrNet,6)
			AAdd(aAux,{"Z14_VLRPAR",	nVlrPar})

			AAdd(aAux,{"Z14_LA",		Space(TamSX3("Z14_LA")[1])})
			AAdd(aAux,{"Z14_APURAD",	aItClausu[nI][16]})

			AAdd(aItens,aAux)
		Next
EndCase

If !IncLog(aCabec,aItens)
	lRet := .F.
Endif

RestArea(aAreaZ10)
RestArea(aAreaZ09)
RestArea(aArea)

Return lRet

/************************************/
Static Function IncLog(aCabec,aItens)
/************************************/

Local lRet 		:= .T.

Local oModelExec
Local oAux
Local oStruct

Local nI,nJ,nPos

Local aAux		:= {}
Local lAux		:= .T.
Local nItErro	:= 0

DbSelectArea("Z13")
Z13->(DbSetOrder(1)) //Z13_FILIAL+Z13_CODIGO

DbSelectArea("Z14")
Z14->(DbSetOrder(1)) //Z14_FILIAL+Z14_CODIGO+Z14_ITEM

oModelExec := FWLoadModel("RFATA004")
oModelExec:SetOperation(3) //Inclusão
oModelExec:Activate()

oAux 	:= oModelExec:GetModel("Z13MASTER")
oStruct := oAux:GetStruct()
aAux 	:= oStruct:GetFields()

If lRet

	For nI := 1 To Len(aCabec)

		If (nPos := aScan(aAux,{|x| AllTrim(x[3]) == AllTrim(aCabec[nI][1])})) > 0

			If !(lAux := oModelExec:SetValue("Z13MASTER",aCabec[nI][1],aCabec[nI][2] ) )
				lRet := .F.
				Exit
			EndIf
		EndIf
	Next nI
EndIf

If lRet

	oAux 	:= oModelExec:GetModel("Z14DETAIL")
	oStruct := oAux:GetStruct()
	aAux 	:= oStruct:GetFields()
	nItErro := 0

	For nI := 1 To Len(aItens)

		If nI > 1

			If (nItErro := oAux:AddLine()) <> nI
				lRet := .F.
				Exit
			EndIf
		EndIf

		For nJ := 1 To Len(aItens[nI])

			If (nPos := aScan(aAux,{|x| AllTrim(x[3]) == AllTrim(aItens[nI][nJ][1])})) > 0

				If !(lAux := oModelExec:SetValue("Z14DETAIL",aItens[nI][nJ][1],aItens[nI][nJ][2]))
					lRet := .F.
					nItErro := nI
					Exit
				EndIf
			EndIf
		Next nJ

	If !lRet
		Exit
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

	If nItErro > 0
		AutoGrLog("Erro no Item: 				" + ' [' + AllTrim(AllToChar(nItErro)) + ']')
	EndIf

	MostraErro()
Else
	cIdMovCtr := Z13->Z13_CODIGO
EndIf

oModelExec:DeActivate()

Return lRet