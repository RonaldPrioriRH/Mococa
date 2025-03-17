#Include 'Protheus.ch'
*----------------------*
User Function OS460NOT()
*----------------------*
/*
Reponsavel por alimentar as tabelas que controlam as notas de saidas palet
*/
Local aArea 	:= GetArea()
Local aCargas := PARAMIXB[1]
Local cCarga := ""
Local nX := 0

For nX := 1 to Len(aCargas)   // Processa os dados da carga
	cCarga := aCargas[nX]
	U_Proczaa(2,cCarga)
Next nX

restarea(aArea)
Return
