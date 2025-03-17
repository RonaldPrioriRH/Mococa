#include "Protheus.ch"
#include 'Topconn.CH'

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³RCOME011  ºAutor  ³Tarcísio Silva Mirandaº Data ³15/11/2017 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Grava o aprovador na SC7, chamado no pe WFW120P.		      º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Chamado pelo ponto de entrada : WFW120P      			  º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function RCOME011()

	Local aArea 	:= GetArea()
	Local aAreaSC7	:= SC7->(GetArea())
	Local cEOL 		:= Chr(13)+Chr(10)
	Local cQry		:= ""
	Local cNumPed	:= SC7->C7_NUM
	Local cFilPed	:= SC7->C7_FILIAL
	Local aDadosScr := {}
	Local nX := 0 

	cQry := " SELECT CR_XCC,CR_APROV			" +cEOL
	cQry += " FROM " + RetSqlName("SCR") 		  +cEOL
	cQry += " WHERE D_E_L_E_T_ <> '*'			" +cEOL
	cQry += " AND CR_NUM 		= '"+cNumPed+"' " +cEOL
	cQry += " AND CR_FILIAL 	= '"+cFilPed+"' " +cEOL  

	cQry := ChangeQuery(cQry)

	If Select("TMP")>0
		TMP->(DbCloseArea())
	Endif

	TcQuery cQry New Alias "TMP" 

	TMP->(DbSelectArea("TMP"))
	TMP->(DbGotop())

	While !TMP->(Eof())

		Aadd(aDadosScr,{AllTrim(TMP->CR_XCC),AllTrim(TMP->CR_APROV)})
		TMP->(DbSkip())

	EndDo
	
	SC7->(DbSelectArea("SC7"))
	SC7->(DbSetOrder(1))
	SC7->(DbGotop())
	if SC7->(DbSeek(cFilPed+cNumPed))

		While !SC7->(Eof()) .AND. SC7->C7_NUM == cNumPed .AND. cFilPed == SC7->C7_FILIAL
	
			if !SC7->C7_CONAPRO$"L"
			
				for nX := 1 to len(aDadosScr)
		
					if aDadosScr[nX][1]$AllTrim(SC7->C7_CC) 
		
						SC7->(RecLock("SC7",.F.))
						SC7->C7_XAPRSCR	:= aDadosScr[nX][2]
						SC7->(MsUnlock())
		
					endif
		
				next nX
			
			endif
	
			SC7->(DbSkip())
	
		EndDo
	
	endif

	TMP->(DbCloseArea())
	RestArea(aAreaSC7)
	RestArea(aArea)

Return()
