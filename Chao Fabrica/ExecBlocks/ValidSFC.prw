#include 'protheus.ch'
		
User Function ValidSFC()

	Local aArea    := GetArea() 
	Local lRet 	   := .F.
	Local nHoraFim := VAL(DTOS(FWFldGet('CYV_DTRP'))+StrTran(cValToChar(FWFldGet('CYV_HRRPED')),":",""))
	Local nHoraDia := VAL((DTOS(Date())+StrTran(cValToChar(TIME()),":","")))
	
	If nHoraFim <= nHoraDia   	   
		lRet := .T.
	Else 
		//MsgInfo( "Não é possivel realizar apontamento Futuro!", "Apontamento" )	
		lRet := .F.
					
	EndIf

RestArea(aArea)
 
return (lRet)