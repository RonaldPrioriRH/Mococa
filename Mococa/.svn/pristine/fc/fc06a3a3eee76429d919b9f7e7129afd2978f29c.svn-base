#include 'protheus.ch'
#include 'parmtype.ch'

User function PadLSA2(cCampo)

Local oModel    := FWModelActive()
Local lRet      := .T.

if AllTrim(cCampo) == 'A2_NUMCON' 
		oModel:SetValue('SA2MASTER',AllTrim(cCampo),StrZero(Val(FWFldGet(AllTrim(cCampo))),10))  

elseif AllTrim(cCampo) == 'A2_AGENCIA'
		oModel:SetValue('SA2MASTER',AllTrim(cCampo),StrZero(Val(FWFldGet(AllTrim(cCampo))),5))
		
endif
		
Return lRet

//teste comit
//teste comit2 
//teste2 
//teste3
