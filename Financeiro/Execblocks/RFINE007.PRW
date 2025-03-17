#Include "Protheus.ch"

User Function XSOMABAT()

	Local aArea := GetArea()
	Local nRet	:= 0
	
	nRet := SomaAbat(SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,"R",SE1->E1_MOEDA,dDataBase,SE1->E1_CLIENTE,SE1->E1_LOJA)
	
	RestArea(aArea)


Return(nRet)