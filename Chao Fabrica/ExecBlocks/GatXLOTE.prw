#include 'protheus.ch'
#include 'parmtype.ch'

User function GatXLOTE()

Local lRet := .T.
Local oModel    := FWModelActive()
//Local cDesc     := oModel:GetValue('SN1MASTER','N1_DESCRIC')

oModel:SetValue('CYVMASTER','CYV_XLOTE',StrZero(Val(M->CYV_XLOTE),3))	

Return lRet