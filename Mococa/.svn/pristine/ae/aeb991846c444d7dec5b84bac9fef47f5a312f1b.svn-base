#include 'protheus.ch'
#include 'parmtype.ch'

User Function GatNota(cChave)
    Local cChave :=  AllTrim(M->Z19_CHVNFE)
    Local cNota :=  " "

    If Len(AllTrim(cChave)) = 44
        cNota := SubStr(cChave,26,9)
    EndIf

Return(cNota)
