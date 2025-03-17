#Include 'Protheus.ch'

/*/{Protheus.doc} RFATE036
PE para limpar conteudo de campos customizados na copia de pedido (MT410CPY)
@author TOTVS
@since 29/05/2017
@version P12
@param nulo            
@return nulo
/*/
User Function RFATE036()

	Local aArea := GetArea()                         
	Local nX := 0
	Local nPosFil := aScan(aHeader,{|x| AllTrim(x[2]) == "C6_XTFIORI"}) 
	Local nPosNum := aScan(aHeader,{|x| AllTrim(x[2]) == "C6_XTPVORI"}) 
	Local nPosIte := aScan(aHeader,{|x| AllTrim(x[2]) == "C6_XTITORI"}) 
	
	//limpo campos de processamento da triangulaçao
	M->C5_XIDTRI	:= Space(Len(M->C5_XIDTRI))
	M->C5_XPVSGAC	:= Space(Len(M->C5_XPVSGAC))
	M->C5_XPVREMS	:= Space(Len(M->C5_XPVREMS))
	
	For nX := 1 To len(aCols)
		aCols[nX][nPosFil] := Space(Len(aCols[nX][nPosFil]))
		aCols[nX][nPosNum] := Space(Len(aCols[nX][nPosFil]))
		aCols[nX][nPosIte] := Space(Len(aCols[nX][nPosFil]))
	Next nX
	
	RestArea(aArea)

Return

