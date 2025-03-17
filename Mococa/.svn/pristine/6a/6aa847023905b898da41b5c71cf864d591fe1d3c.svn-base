User Function M750GRIM()
LOCAL aElementos := ParamIxb[1]
LOCAL cGlbValue := GetGlbValue("LUsaMetodo") 
LOCAL cRetOpc := ""
LOCAL nX

PutGlbValue("LPergMetodo","")
if Empty(cGlbValue)
	if ApMsgYesNo("Utiliza importação de métodos? (Grim)","Métodos")
		PutGlbValue("LUsaMetodo","S")
	else
		PutGlbValue("LUsaMetodo","N")
	endif
endif 
cGlbValue := GetGlbValue("LUsaMetodo")


M->HC_PRODUTO := SHC->HC_PRODUTO
M->HC_QUANT   := SHC->HC_QUANT
M->HC_DATA    := SHC->HC_DATA

//SeleOpc(4,"MATA750GRIM",M->HC_PRODUTO,,@cRetOpc,aElementos[7],"M->HC_OPC",.F.,M->HC_QUANT,M->HC_DATA)

For nX :=1 to 12
	cRetOpc += aElementos[7]
next nX

//Alert(cRetOpc)
RecLock("SHC",.f.)
if cGlbValue == "S"
	SHC->HC_OPC  := cRetOpc //aElementos[7]
	SHC->HC_MOPC := cRetOpc //aElementos[7] 	
endif 
SHC->HC_DESCRI := Posicione("SB1",1,FwXFilial("SB1")+SHC->HC_PRODUTO,"B1_DESC")
SHC->(MsUnlock())
Return