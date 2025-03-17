#include 'protheus.ch'
#include 'parmtype.ch'

User function GatXRESP()

Local oModel    := FWModelActive()
Private lRet := .F.
//Local cDesc     := oModel:GetValue('SN1MASTER','N1_DESCRIC')

oModel:SetValue('CYVMASTER','CYV_XRESP',StrZero(Val(M->CYV_XRESP),6))	

//Validação da SRA Matricula e SB1 Unidade
	FieldVld01()
		
Return lRet

Static Function FieldVld01() 

Local aArea := GetArea() 
//Local oModel:= FWModelActive() 
Local cMatri:= FWFldGet('CYV_XRESP')//oModel:GetValue('CYVMASTER', 'CYV_XRESP') Deixou passar quando era 0 desta forma

DbSelectArea('SRA') 
SRA->(DbSetOrder(1))
//RA_FILIAL+RA_MAT  

	If SRA->(DbSeek(xFilial('SRA')+AllTrim(cMatri))) .And. AllTrim(cMatri) <> ' '
		lRet := .T. 
	Else 
		Help(,, 'Matrícula' ,, 'Matrícula não encontrada !', 1,0) 
		lRet := .F. 
	EndIf
	
SRA->(DbCloseArea())

RestArea(aArea) 
Return (lRet)
