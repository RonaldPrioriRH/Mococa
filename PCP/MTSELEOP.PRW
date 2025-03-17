User Function MTSELEOP
Local aArea := GetArea()
LOCAL lRet := .t.
if IsInCallStack("MATA410")
    lRet := .f.
endif    
restArea(aArea)
return (lRet)