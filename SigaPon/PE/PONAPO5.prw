#include 'protheus.ch'
#include 'parmtype.ch'

user function PONAPO5()
Local aArea     := GetArea()
Local aAreaSP8  := SP8->(GetArea())
Local aMarcPto  := aClone(ParamIxb[1])
Local cDiaIni   := SubStr(GETMV("MV_PAPONTA"),1,2)
Local cDiaFim   := SubStr(GETMV("MV_PAPONTA"),4,2)
Local cAnoMes   := ""
Local cAnoMesI  := ""
Local cAnoMesF  := ""

For _nX := 1 to len(aMarcPto)
	cAnoMes := AnoMes(aMarcPto[_nX, 25])
	
	If aMarcPto[_nX, 25] >= stod(cAnoMes + cDiaIni) 
	   cAnoMesF := AnoMes(stod(cAnoMes + cDiaIni)+ 30) // AnoMes(aMarcPto[_nX, 25] + 30)
	   cPerAtu  := cAnoMes + cDiaIni +  cAnoMesF + cDiaFim
	Else
	   cAnoMesI := AnoMes(stod(cAnoMes + cDiaIni)- 30)  // AnoMes(aMarcPto[_nX, 25] - 30)
	   cPerAtu  := cAnoMesI + cDiaIni +  cAnoMes + cDiaFim
	EndIf 
    aMarcPto[_nX, 15] :=  cPerAtu
Next

RestArea(aArea)	
RestArea(aAreaSP8)
return (aMarcPto)