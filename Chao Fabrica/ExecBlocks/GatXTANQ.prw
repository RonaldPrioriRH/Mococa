#include 'protheus.ch'
#include 'parmtype.ch'

User function GatXTANQ()

Local lRet := .T.
Local oModel    := FWModelActive()
//Local cDesc     := oModel:GetValue('SN1MASTER','N1_DESCRIC')

oModel:SetValue('CYVMASTER','CYV_XTANQ',StrZero(Val(M->CYV_XTANQ),2))	

Return lRet