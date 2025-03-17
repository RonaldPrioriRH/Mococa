#include "protheus.ch"

User Function M750LCSV()
LOCAL aArea   :=   GetArea()
LOCAL cLinha  :=   ParamIxb[1]
LOCAL nPosMet :=   5
LOCAL cRet    :=   ""
LOCAL cTrecho
LOCAL cGlbValue  := GetGlbValue("LUsaMetodo") 
LOCAL cGlbValue2 := GetGlbValue("LPergMetodo")
nX := 0

if Empty(cGlbValue2)
	PutGlbValue("LPergMetodo","S")
	if ApMsgYesNo("Utiliza importação de métodos? (lcsv)","Métodos")
		PutGlbValue("LUsaMetodo","S")
	else
		PutGlbValue("LUsaMetodo","N")
	endif
endif 
cGlbValue := GetGlbValue("LUsaMetodo")

if cGlbValue <> "S"
	return (cRet)
endif 

While !Empty(cLinha)
	nX++	
	cTrecho := If(At(";",cLinha)>0,Substr(cLinha,1,At(";",cLinha)-1),cLinha)
	cLinha := If(At(";",cLinha)>0,Substr(cLinha,At(";",cLinha)+1),"")	
	Do Case
		Case nX == nPosMet
			cRet := cTrecho	
	EndCase
Enddo

restArea(aArea)
return(cRet)


 