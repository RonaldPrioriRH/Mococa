#include 'protheus.ch'
#include 'parmtype.ch'

User function GatXPRDO()

Local lRet := .T.
Local oModel    := FWModelActive()
//Local cDesc     := oModel:GetValue('SN1MASTER','N1_DESCRIC')

oModel:SetValue('CYVMASTER','CYV_XPRDO',StrZero(Val(M->CYV_XPRDO),3)) //	

Return lRet