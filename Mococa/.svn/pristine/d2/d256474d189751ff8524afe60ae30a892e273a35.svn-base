#include 'protheus.ch'
#include 'parmtype.ch'

/*
user function mt241se()
	local amt241se := paramixb
	local nPosCod := GdFieldPos("D3_COD")
	local nX
	local cCodProd
    local lF5Aprop := ( Posicione("SF5",1,FwXFilial("SF5")+cTM,"F5_APROPR") == "N" )
    local lB1Aprop 
    local lMod
    local anewRet := {}
    
	if IsInCallStack("M241SeleEs") 
		For nX :=1 to Len(amt241se)
			cCodProd := amt241se[nX,nPosCod]
			lMod     := ( Posicione("SB1",1,FwXFilial("SB1")+cCodProd,"B1_TIPO") == "MO" )
			lB1Aprop := ( Posicione("SB1",1,FwXFilial("SB1")+cCodProd,"B1_APROPRI") == "I" ) 		
			//amt241se[nX,Len(amt241se[nX])] := (lMod .or. (lB1Aprop .and. lF5Aprop) )
			if !lMod .and. (lB1Aprop .and. lF5AProp)
				aadd(aNewRet,amt241se[nx])
			endif
		Next nX
	else
		aNewRet := aClone (amt241se)
	endif
	
return (aNewRet)

*/



user function mt241se()
	local amt241se := paramixb
	local nPosCod := GdFieldPos("D3_COD")
	local nX
	local cCodProd
    local lF5Aprop := ( Posicione("SF5",1,FwXFilial("SF5")+cTM,"F5_APROPR") == "N" )
    local lB1Aprop 
    local lMod
    local anewRet := {}
    local aEstrutura := {}
    Local cLocaliz     := Criavar("D3_LOCALIZ",.F.)
    Local cNumSeri     := Criavar("D3_NUMSERI",.F.)
    Local lItemNeg     := .F.
	Local i

    //local nQtdOrigEs := 1
    
    
    
	if IsInCallStack("M241SeleEs")
	
	    nPercOp:=	nQtdOrigEs/SC2->C2_QUANT 
		
		dbSelectArea("SD4")
		dbSetOrder(2)
		dbSeek(xFilial("SD4")+cOpEst)
		While !Eof() .And. D4_FILIAL+D4_OP==xFilial("SD4")+cOpEst
			if SD4->D4_QUANT == 0
				DbSkip()
				Loop
			endif
			
			if cTm <="500"
				DbSkip()
				Loop
			endif
			
			AADD(aEstrutura,{NIL,NIL,SD4->D4_COD,Min(SD4->D4_QUANT,(SD4->D4_QTDEORI*nPercOp)),SD4->D4_TRT,SD4->D4_LOTECTL,SD4->D4_NUMLOTE,cLocaliz,cNumSeri,SD4->D4_LOCAL,SD4->D4_DTVALID})
			
			DbSkip()
		Enddo
	else
		aNewRet := aClone (amt241se)
		return(aNewRet)
	endif
	
	
	For i:=1 to Len(aEstrutura)
		// Se a primeira linha esta em branco remove a mesma do acols
		If Empty(aCols[1,nPosCod])
			ADEL(aCols,1)
			ASIZE(aCols,Len(aCols)-1)
		EndIf
		// Adiciona item no acols
		AADD(aCols,Array(Len(aHeader)+1))
		// Preenche conteudo do acols
		For nx:=1 to Len(aHeader)
			cCampo:=Alltrim(aHeader[nx,2])
			If IsHeadRec(cCampo)
				aCols[Len(aCols)][nx] := 0
			ElseIf IsHeadAlias(cCampo)
				aCols[Len(aCols)][nx] := "SD3"
			Else
				aCols[Len(aCols)][nx] := CriaVar(cCampo,.F.)
			EndIf
		Next nx

		If QtdComp(aEstrutura[i,4]) <= QtdComp(0)
			lItemNeg := .T. // variavel para exibicao de aviso ao usuario
			If cTm > "500"
				// Requisicoes
				If QtdComp(aEstrutura[i,4]) < QtdComp(0)
					// Quantidade negativa: deve ser deletado, pois nao se pode requisitar quantidade negativa
					aCOLS[Len(aCols)][Len(aHeader)+1] := .T.
				Else
					// Quantidade zerada: nao deve fazer nada. Valor padrao .F. deve ser definido
					aCOLS[Len(aCols)][Len(aHeader)+1] := .F.
				EndIf
			Else
				// Devolucoes
				If QtdComp(aEstrutura[i,4]) < QtdComp(0)
					// Quantidade negativa: deve ser positivada, pois trata-se de devolucao
					aCOLS[Len(aCols)][Len(aHeader)+1] := .F.
					aEstrutura[i,4] := (aEstrutura[i,4] * -1)
				Else
					// Quantidade zerada: deve ser deletado, pois nao se pode devolver quantidade zerada
					aCOLS[Len(aCols)][Len(aHeader)+1] := .T.
				EndIF
			EndIf
		Else
			// Item com quantidade positiva > 0
			aCOLS[Len(aCols)][Len(aHeader)+1] := .F.
		EndIf

	// Preenche campos especificos
		SB1->(dbSetOrder(1))
		SB1->(MsSeek(xFilial("SB1")+aEstrutura[i,3]))
		GDFieldPut("D3_COD",aEstrutura[i,3],Len(aCols))
		GDFieldPut("D3_DESCRI",SB1->B1_DESC,Len(aCols))
		GDFieldPut("D3_UM",SB1->B1_UM,Len(aCols))
		GDFieldPut("D3_SEGUM",SB1->B1_SEGUM,Len(aCols))
		GDFieldPut("D3_QUANT",aEstrutura[i,4],Len(aCols))
		GDFieldPut("D3_LOCAL",RetFldProd(SB1->B1_COD,"B1_LOCPAD"),Len(aCols))
		GDFieldPut("D3_CONTA",SB1->B1_CONTA,Len(aCols))
		GDFieldPut("D3_ITEMCTA",SB1->B1_ITEMCC,Len(aCols))
		// Preenche o numero da OP
		If !Empty(cOpEst)
			If aEstrutura[i,10]# NIL .AND. !Empty(aEstrutura[i,10])
				GDFieldPut("D3_LOCAL",aEstrutura[i,10],Len(aCols))
			EndIf
			//GDFieldPut("D3_OP",cOpEst,Len(aCols))
			GDFieldPut("D3_TRT",aEstrutura[i,5],Len(aCols))
			GDFieldPut("D3_LOTECTL",aEstrutura[i,6],Len(aCols))
			GDFieldPut("D3_NUMLOTE",aEstrutura[i,7],Len(aCols))
			GDFieldPut("D3_DTVALID",aEstrutura[i,11],Len(aCols))
			If ! Empty(cTM) .and. SF5->F5_TIPO=="D"
				GDFieldPut("D3_LOCALIZ",Space(15),Len(aCols))
				GDFieldPut("D3_NUMSERI",Space(20),Len(aCols))
			Else
				GDFieldPut("D3_LOCALIZ",aEstrutura[i,8],Len(aCols))
				GDFieldPut("D3_NUMSERI",aEstrutura[i,9],Len(aCols))
			EndIf
		EndIf
		// Executa gatilhos e validacoes
		If ExistTrigger("D3_COD")
			RunTrigger(2,Len(aCols),,"D3_COD")
		EndIf
		If ExistTrigger("D3_QUANT")
			RunTrigger(2,Len(aCols),,"D3_QUANT")
		EndIf
		If ExistTrigger("D3_LOCAL")
			RunTrigger(2,Len(aCols),,"D3_LOCAL")
		EndIf
		If ExistTrigger("D3_OP")
			RunTrigger(2,Len(aCols),,"D3_OP")
		EndIf
	
	Next i
	
	amt241se := aClone(aCols)
	
	For nX :=1 to Len(amt241se)
		cCodProd := amt241se[nX,nPosCod]
		lMod     := ( Posicione("SB1",1,FwXFilial("SB1")+cCodProd,"B1_TIPO") == "MO" )
		lB1Aprop := ( Posicione("SB1",1,FwXFilial("SB1")+cCodProd,"B1_APROPRI") == "I" ) 		
		//amt241se[nX,Len(amt241se[nX])] := (lMod .or. (lB1Aprop .and. lF5Aprop) )
		if !lMod .and. (lB1Aprop .and. lF5AProp)
			aadd(aNewRet,amt241se[nx])
		endif
	Next nX
	
	if Len(aCols) == 0
		AADD(aCols,Array(Len(aHeader)+1))
		// Preenche conteudo do acols
		For nx:=1 to Len(aHeader)
			cCampo:=Alltrim(aHeader[nx,2])
			If IsHeadRec(cCampo)
				aCols[Len(aCols)][nx] := 0
			ElseIf IsHeadAlias(cCampo)
				aCols[Len(aCols)][nx] := "SD3"
			Else
				aCols[Len(aCols)][nx] := CriaVar(cCampo,.F.)
			EndIf
		Next nx
	endif
	
	
return (aNewRet)
