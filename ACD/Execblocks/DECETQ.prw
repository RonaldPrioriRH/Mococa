#include 'protheus.ch'
#include 'parmtype.ch'

User Function DecEtq (c_Etq, c_Prd, c_Lt, c_LtMq, c_Plt, l_Prd)
	Local n_Tam := 23
	Local a_Ar := GetArea()
	Local a_ArSB8 := SB8->(GetArea())

	DEFAULT l_Prd := .F.

	c_Prd	:= Space(TamSX3("B1_COD")[1])
	c_Lt	:= Space(TamSX3("D3_LOTECTL")[1])
	c_LtMq	:= Space(1)
	c_Plt	:= Space(4)

	If c_Etq <> NIL
		If Len(AllTrim(c_Etq)) = n_Tam
			c_Prd	:= PadR(SubStr(c_Etq,1,8),TamSX3("B1_COD")[1])
			c_Lt	:= PadR(SubStr(c_Etq,9,11),TamSX3("D3_LOTECTL")[1])
			c_LtMq	:= SubStr(c_Etq,19,1)
			c_Plt	:= SubStr(c_Etq,20,4)

			If ! l_Prd
				DbSelectArea("SB8")
				DbSetOrder(5)
				If ! DbSeek(xFilial("SB8")+ c_Prd + c_Lt)
					c_Prd	:= Space(TamSX3("B1_COD")[1])
					c_Lt	:= Space(TamSX3("D3_LOTECTL")[1])
					c_LtMq	:= Space(1)
					c_Plt	:= Space(4)
				Endif
			Endif
		Endif
	Endif
	RestArea(a_ArSB8)
	RestArea(a_Ar)

Return n_Tam