#include 'protheus.ch'
#include 'parmtype.ch'

User function GatXPALET()

Local lRet := .T.
Local oModel    := FWModelActive()
//Local cDesc     := oModel:GetValue('SN1MASTER','N1_DESCRIC')

oModel:SetValue('CYVMASTER','CYV_XPALET',StrZero(Val(M->CYV_XPALET),4))	

Return lRet