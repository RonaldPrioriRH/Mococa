#INCLUDE "PROTHEUS.CH"

User Function GT1CTCAB()
Local cTipoCTe := PARAMIXB[1]
Local aCab := PARAMIXB[2]
//Local aNotas := PARAMIXB[3]
Local nPosTpFret := aScan(aCab,{|x| AllTrim(x[1]) == "F1_TPFRETE" })

    Do Case
        Case cTipoCTe == "1" // Compra
            If nPosTpFret > 0
                aCab[nPosTpFret][2] := "F" // FOB
            EndIf

        Case cTipoCTe == "2" // Venda
            If nPosTpFret > 0
                aCab[nPosTpFret][2] := "C" // CIF
            EndIf

    EndCase

Return aCab
