#Include "Protheus.ch"
//PE para Permitir a altera��o do Ensaio mesmo existindo medi��es
//Tarc�sio Silva Miranda
//28/12/2017
User Function QP020AENS()

	Local aArea := GetArea()
	Local lRet	:= GetMv("MV_XALTENS",,.T.)

	RestArea(aArea)

REturn(lRet)