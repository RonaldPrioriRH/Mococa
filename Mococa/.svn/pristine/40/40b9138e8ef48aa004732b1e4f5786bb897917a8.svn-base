#include 'protheus.ch'
#include 'parmtype.ch'
#include 'topconn.ch'

user function SF314Ex681()
LOCAL aArea   := GetArea()
LOCAL aAreaD3 := SD3->(GetArea())
LOCAL lRet := .t.
LOCAL cQuery
LOCAL cTpMov := GetMV("MV_SFRQMB") 

cQuery := " Select SD3.R_E_C_N_O_ as RECNOD3 "
cQuery += " from "
cQuery += RetSqlName("SD3")+" SD3 "
cQuery += " where "
cQuery += " D3_FILIAL = '"+SH6->H6_FILIAL +"' and "
cQuery += " D3_OP = '"+SH6->H6_OP+"' and "
cQuery += " D3_EMISSAO = '"+dtos(SH6->H6_DATAINI)+"' and "
cQuery += " D3_TIPO ='MO' and "
cQuery += " D3_TM ='"+cTpMov+"' and "
cQuery += " D3_IDENT = ' ' and "
cQuery += " SD3.D_E_L_E_T_ = ' ' "

if Select("QSFC314") > 0
	QSFC314->(DbCloseArea())
endif	
TcQuery cQuery new alias "QSFC314"

While !QSFC314->(Eof())
	DbSelectArea("SD3")
	DbGoTo(QSFC314->RecnoD3)
	RecLock("SD3",.f.)
	SD3->D3_IDENT = SH6->H6_IDENT
	SD3->(MsUnLock())
	DbSelectArea("QSFC314")
	DbSkip()
Enddo

restarea(aAreaD3)
restarea(aArea)	
return (lRet)