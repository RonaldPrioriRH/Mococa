#include "protheus.ch" 
#include "fwmvcdef.ch"

/*/{Protheus.doc} RFATE033
Log de Apuração (Inclusão) - Contratos
@author TOTVS
@since 27/04/2017
@version P12
@param cContrato,cCliFor,cLoja,cTitFin,cNatTit,nVlrTit,aItClausu,cIdApur            
@return nulo
/*/

/****************************************************************************************/
User Function RFATE033(cContrato,cCliFor,cLoja,cTitFin,cNatTit,nVlrTit,aItClausu,cIdApur)
/****************************************************************************************/

Local lRet 			:=  .T.

Local aArea			:= GetArea()

Local aCabec		:= {}
Local aAux			:= {}
Local aItens		:= {}

Local nI

//Cabeçalho
AAdd(aCabec,{"Z21_CONTRA",	cContrato})
AAdd(aCabec,{"Z21_CLIFOR",	cCliFor})
AAdd(aCabec,{"Z21_LOJA",	cLoja})

If cTitFin == "A" //A Pagar
	AAdd(aCabec,{"Z21_NOME",Posicione("SA2",1,xFilial("SA2")+cCliFor+cLoja,"A2_NOME")})
	AAdd(aCabec,{"Z21_CGC",Posicione("SA2",1,xFilial("SA2")+cCliFor+cLoja,"A2_CGC")})
Else
	AAdd(aCabec,{"Z21_NOME",Posicione("SA1",1,xFilial("SA1")+cCliFor+cLoja,"A1_NOME")})
	AAdd(aCabec,{"Z21_CGC",Posicione("SA1",1,xFilial("SA1")+cCliFor+cLoja,"A1_CGC")})
Endif

AAdd(aCabec,{"Z21_TITFIN",	cTitFin})
AAdd(aCabec,{"Z21_NATTIT",	cNatTit})
AAdd(aCabec,{"Z21_VLRTIT",	nVlrTit})
AAdd(aCabec,{"Z21_DATA",	dDataBase})
AAdd(aCabec,{"Z21_USER",	cUserName})

//Itens
For nI := 1 To Len(aItClausu)

	AAdd(aAux,{"Z22_ITEM",		StrZero(nI,2)})
	AAdd(aAux,{"Z22_CODMOV",	aItClausu[nI][1]})
	AAdd(aAux,{"Z22_ITMOV",		aItClausu[nI][2]})
	AAdd(aAux,{"Z22_ITCLAU",	aItClausu[nI][3]})
	AAdd(aAux,{"Z22_CLAUSU",	aItClausu[nI][4]})
	AAdd(aAux,{"Z22_DESCCL",	aItClausu[nI][5]})
	AAdd(aAux,{"Z22_VLRPAR",	aItClausu[nI][6]})
	AAdd(aAux,{"Z22_LA",		Space(TamSX3("Z22_LA")[1])})

	AAdd(aItens,aAux)
Next	

If !IncLog(aCabec,aItens)
	lRet := .F.
Endif

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

DbSelectArea("Z21")
Z21->(DbSetOrder(1)) //Z21_FILIAL+Z21_CODIGO

DbSelectArea("Z22")
Z22->(DbSetOrder(1)) //Z22_FILIAL+Z22_CODIGO+Z22_ITEM

oModelExec := FWLoadModel("RFATA008")
oModelExec:SetOperation(3) //Inclusão
oModelExec:Activate()

oAux 	:= oModelExec:GetModel("Z21MASTER")
oStruct := oAux:GetStruct()
aAux 	:= oStruct:GetFields()

If lRet

	For nI := 1 To Len(aCabec)
	
		If (nPos := aScan(aAux,{|x| AllTrim(x[3]) == AllTrim(aCabec[nI][1])})) > 0
			
			If !(lAux := oModelExec:SetValue("Z21MASTER",aCabec[nI][1],aCabec[nI][2] ) )
				lRet := .F.
				Exit
			EndIf
		EndIf
	Next nI
EndIf

If lRet

	oAux 	:= oModelExec:GetModel("Z22DETAIL")
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
			
				If !(lAux := oModelExec:SetValue("Z22DETAIL",aItens[nI][nJ][1],aItens[nI][nJ][2]))
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
	cIdApur := Z21->Z21_CODIGO
EndIf

oModelExec:DeActivate()

Return lRet