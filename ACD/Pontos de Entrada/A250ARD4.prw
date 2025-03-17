#include 'protheus.ch'
#include 'parmtype.ch'

//Ponto de entrada para atualizar o valor gerado de creme Cru no apontamento de produção
user function A250ARD4()
	local aItensSD4  := paramixb
	//Local nVal := 0
	Local cProd
	Local i,j
	Local nQtdD4
	Local cLoteSub 
	Local cProdSub
	Local a_Area := GetArea()
	Local a_ArSD4 := SD4->(GetArea())
	

	//Fazer if para ver se o produto é creme cru
	if len(aItensSD4)>0
		for i:=1 to len(aItensSD4)
			if len(aItensSD4[i])>0
				for j:=1 to len(aItensSD4[i])
					if len(aItensSD4[i][j])>0
						cProd  := alltrim(aItensSD4[i][j][3])
						SD4->(DbGoTo(aItensSD4[i][j][1]))
						nQtdD4 :=  SD4->D4_QTDEORI// Item ndegativo na Estrtura
						if M->CYV_X_QTCR > 0 .and. nQtdD4 < 0
							aItensSD4[i][j][2]:= M->CYV_X_QTCR * -1

							if IsInCallStack("SFCA310") .and. !IsInCallStack("U_JobApon")
								cProdSub := GetGlbValue("cCodSubProd")
								cLoteSub := GetGlbValue("cLoteSBP")
								if ValType(cLoteSub) <>'N' .and. ValType(cProdSub) <>'N'
								
									aItensSD4[i][j][9]:= cLoteSub
									
									DbSelectArea("SD4")
									DbGoTo(aItensSD4[i][j][1])
									RecLock("SD4",.F.)
									
									SD4->D4_LOTECTL := cLoteSub
									
									MsUnLock()
									 
									
								endif
							endif

						endif
					endif
				next
			endif
		next
	endif

	//	Alert( Acols[n,nPosD3COD] )
	//	
	//	if IsInCallStack("SFCA310") .and. !IsInCallStack("U_JobApon")
	//		cProdSub := GetGlbValue("cCodSubProd")
	//		cLoteSub := GetGlbValue("cLoteSBP")
	//		if ValType(cLoteSub) <>'N' .and. ValType(cProdSub) <>'N'
	//			if Alltrim(Acols[n,nPosD3COD]) == Alltrim(cProdSub)
	//				Alert(Acols[n,nPosD3COD])
	//				aCols[n,nPosLCtrl] := cLoteSub 
	//				
	//			endif
	//		endif	
	//	endif
	RestArea(a_ArSD4)
	RestArea(a_Area)
return aItensSD4
