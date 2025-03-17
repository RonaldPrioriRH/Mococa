#include 'protheus.ch'
#include 'parmtype.ch'
#include 'parmtype.ch'
#Include 'Fwmvcdef.CH'
#INCLUDE 'TOPCONN.CH'

User function StrXCYV(cCampo)

Local oModel    := FWModelActive()
Local lRet      := .T.

if AllTrim(cCampo) == 'CYV_XFICHA' 
		oModel:SetValue('CYVMASTER',AllTrim(cCampo),StrZero(Val(FWFldGet(AllTrim(cCampo))),6))  //acertar para 06 na producao 

elseif AllTrim(cCampo) == 'CYV_XLOTE'
		oModel:SetValue('CYVMASTER',AllTrim(cCampo),StrZero(Val(FWFldGet(AllTrim(cCampo))),3))
		
elseif AllTrim(cCampo) == 'CYV_XPALET'
		oModel:SetValue('CYVMASTER',AllTrim(cCampo),StrZero(Val(FWFldGet(AllTrim(cCampo))),4))

elseif AllTrim(cCampo) == 'CYV_XPRDO'
		oModel:SetValue('CYVMASTER',AllTrim(cCampo),StrZero(Val(FWFldGet(AllTrim(cCampo))),3))	
		
elseif AllTrim(cCampo) == 'CYV_XRESP'
		oModel:SetValue('CYVMASTER',AllTrim(cCampo),StrZero(Val(FWFldGet(AllTrim(cCampo))),6))
		
elseif AllTrim(cCampo) == 'CYV_XTANQ'
		oModel:SetValue('CYVMASTER',AllTrim(cCampo),StrZero(Val(FWFldGet(AllTrim(cCampo))),2))	
		
endif
		
Return lRet
