#include 'protheus.ch'
#include 'parmtype.ch'


User Function FieldVld02() 

Local lRet := .F.
Local aArea := GetArea() 
//Local oModel:= FWModelActive() 
Local cUni  := Posicione("SB1",1,xFilial("SB1")+FWFldGet('CYV_CDACRP'),"B1_UM")
	
	If AllTrim(cUni) $ ("BJ,CX,BG,UN,FD")
		//oStruGrid:SetProperty("CYV_XFICHA",MODEL_FIELD_OBRIGAT, .T.) //Teste Não deu certo 
		lRet := .T.
	Else
		lRet := .F.
	EndIf

//Correção tipoFD teste comit 
RestArea(aArea) 
Return (lRet)

