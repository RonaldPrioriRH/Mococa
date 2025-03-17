#INCLUDE 'Protheus.ch'
#include "topconn.ch"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³RFATA013  ºAutor  ³Tarcisio Silva MirandaºData³  11/01/2018 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Preenche a caraga na SE1.   								  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Após gravação da Sf2, colocado no fonte NfeSefaz.          º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function RFATA013()

	Local aArea 	:= GetArea()
	Local aAreaSF2 	:= SF2->(GetArea())
	Local aAreaSE1 	:= SE1->(GetArea())
	Local aAreaSC5	:= SC5->(GetArea())
	Local aAreaSD2	:= SD2->(GetArea())
	Local cFilials 	:= SF2->F2_FILIAL
	Local cNota		:= SF2->F2_DOC
	Local cEol      := chr(13)+chr(10)
	Local cSql		:= ""	
	Local cIdTriang	:= AllTrim(SF2->F2_XIDTRI)
	Local cCarga 	:= ""
	Local lGravaId	:= GetMv("MV_XGRVID",,.T.)


	if lGravaId
	
		cSql := " SELECT C5_XCARGA 				" + cEol
		cSql += " FROM "+RetSqlName("SC5") + " 	" + cEol
		cSql += " WHERE D_E_L_E_T_ <> '*' 		" + cEol
		cSql += " AND C5_NOTA = '"+cNota+"' 	" + cEol
		cSql += " AND C5_FILIAL = '"+cFilials+"'" + cEol
	
		cSql := ChangeQuery(cSql)
	
		If Select("TMP") > 0
			TMP->(DbCloseArea())
		EndIf  
	
		MemoWrite("c:\temp\RFATA013.sql",cSql)
	
		TcQuery cSql New Alias "TMP"
		
		cCarga := AllTrim(TMP->C5_XCARGA)
	
		if !empty(cCarga)
		
			SE1->(DbSelectArea("SE1"))
			SE1->(DbSetOrder(32))
			SE1->(DbGotop())
			if SE1->(DbSeek(cFilials+cNota))
		
				While !SE1->(Eof()) .AND. SE1->E1_NUM$cNota .AND. SE1->E1_FILIAL$cFilials
		
					SE1->(RecLock("SE1",.F.))
					SE1->E1_XCARGA := cCarga
					SE1->(MsUnlock())
					SE1->(DbSkip()) 
		
				Enddo
		
			endif
		
		endif
	
	
		if !empty(cIdTriang)
		
			SD2->(DbSelectArea("SD2"))
			SD2->(DbSetOrder(3))
			SD2->(DbGotop())
			if SD2->(DbSeek(cFilials+cNota))
		
				While !SD2->(Eof()) .AND. SD2->D2_DOC$cNota .AND. SD2->D2_FILIAL$cFilials
		
					SD2->(RecLock("SD2",.F.))
					SD2->D2_XIDTRI := cIdTriang
					SD2->(MsUnlock())
					SD2->(DbSkip()) 
		
				Enddo		
		
			endif	
			
		endif
		
	endif

	RestArea(aAreaSC5)
	RestArea(aAreaSF2)
	RestArea(aAreaSE1)
	RestArea(aAreaSD2)
	RestArea(aArea)

Return()