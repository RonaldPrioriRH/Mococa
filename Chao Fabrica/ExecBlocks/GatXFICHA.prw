#include 'protheus.ch'
#include 'parmtype.ch'

User function GatXFICHA()

Local lRet := .T.
Local oModel    := FWModelActive()
//Local cDesc     := oModel:GetValue('SN1MASTER','N1_DESCRIC')

oModel:SetValue('CYVMASTER','CYV_XFICHA',StrZero(Val(M->CYV_XFICHA),6)) 

Return lRet
	

	