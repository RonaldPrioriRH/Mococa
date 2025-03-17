User Function M750VIMP
LOCAL aArea := GetArea()
LOCAL lRet := .t.
LOCAL nPosic   := ParamIxb[2] 
LOCAL aImport  := ParamIxb[1,nPosic]
Local cStr     := Alltrim(aImport[6])
Local cGrupoOpc:= Substr(cStr,1,3)
Local cOpc     := Substr(cStr,4,4)
LOCAL cGlbValue := GetGlbValue("LUsaMetodo") 

PutGlbValue("LPergMetodo","")
if Empty(cGlbValue)
	if ApMsgYesNo("Utiliza importa��o de m�todos? (Imp)","M�todos")
		PutGlbValue("LUsaMetodo","S")
	else
		PutGlbValue("LUsaMetodo","N")
	endif
endif 
cGlbValue := GetGlbValue("LUsaMetodo")

if cGlbValue <> "S"
	return (lRet)
endif 



//Deve buscar o Grupo de Opcional, caso n�o exista, dar um alert e rejeitar a inclus�o do registro
DbSelectArea("SGA")
DbSetOrder(1)

if !DbSeek(FwxFilial("SGA")+cGrupoOpc+cOpc)
	lRet := .f.
	ApMsgStop("Erro na linha: "+Alltrim(Str(nPosic))+". Grupo/Opcional inexistente: "+cStr+Chr(10)+chr(13)+". Registro n�o importado!","Erro")
endif
RestArea(aArea)
Return(lRet)