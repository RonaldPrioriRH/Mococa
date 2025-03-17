#include "protheus.ch"
#INCLUDE "topconn.ch"
#include "rwmake.ch"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³RCOME010  ºAutor  ³Tarcísio Silva Mirandaº Data ³10/11/2017 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Define quais itens do pedido em questão serão liberados.	  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Chamado pelo ponto de entrada : WFW120P   				  º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function RCOME010()
	

	Local aArea 	:= GetArea()
	Local aAreaSC7	:= SC7->(GetArea())
	Local aAreaSCR	:= SCR->(GetArea())
	Local aAreaDBM	:= DBM->(GetArea())
	Local cNumSc7 	:= SC7->C7_NUM
	Local cFilials	:= xFilial("SC7")
	Local cEOL 		:= Chr(13)+Chr(10)
	Local cQry		:= ""
	Local nValorScr	:= 0
	Local aRegCC	:= {}
	Local lDelete	:= .F.
	Local lDelete2	:= .T.
	Local nX := 0 

	SC7->(DbSelectArea("SC7"))
	SC7->(DbSetOrder(1))
	SC7->(DbGotop())

	if SC7->(DbSeek(cFilials+cNumSc7))

		While !SC7->(Eof()) .AND. SC7->C7_FILIAL == cFilials .AND. SC7->C7_NUM == cNumSc7
			//se vem da rotina de spot (RCOMA001) não deve passar por aprovaçao.
			if FunName() == "RCOMA001" .OR. (AllTrim(Posicione("SB1",1,xFilial("SB1")+SC7->C7_PRODUTO,"B1_XALCADA"))$"S" .AND. SC7->C7_ESTOQUE$"1")

				lDelete := .T.

				SC7->(RecLock("SC7",.F.))

				SC7->C7_CONAPRO := "L"
				SC7->C7_XAPRSCR := ""

				SC7->(MsUnlock())

				aAdd(aRegCC,{SC7->C7_CC,SC7->C7_TOTAL,SC7->C7_CONAPRO})

				cQry := " SELECT R_E_C_N_O_, CR_TOTAL,CR_XCC 					" +cEOL
				cQry += " FROM " + RetSqlName("SCR") 		   		  			  +cEOL
				cQry += " WHERE D_E_L_E_T_ <> '*'			 					" +cEOL
				cQry += " AND CR_NUM 		= '"+SC7->C7_NUM+"' 				" +cEOL
				cQry += " AND CR_FILIAL 	= '"+SC7->C7_FILIAL+"' 				" +cEOL
				cQry += " AND CR_XCC 		= '"+SC7->C7_CC+"' 					" +cEOL

				cQry := ChangeQuery(cQry)

				If Select("TMP")>0
					TMP->(DbCloseArea())
				Endif

				TcQuery cQry New Alias "TMP"

				SCR->(DbGoto(TMP->R_E_C_N_O_))

				if !empty(SCR->CR_NUM)


					nValorScr := 0

					for nX := 1 to len(aRegCC)

						if aRegCC[nX][1]$SCR->CR_XCC

							nValorScr += aRegCC[nX][2]

						endif

					next nX

					if nValorScr==SCR->CR_TOTAL
						/*Error Daniele
						THREAD ERROR ([65230], daniele.ferreira, SUP-02)   01/07/2020 18:00:50
						DBDelete - Lock required on U_RCOME010(RCOME010.PRW) 02/09/2019 19:13:42 line : 89*/		
						RecLock("SCR", .F.)
						SCR->(dbDelete())
						SCR->(MsUnlock())
						
					endif	


				endif

			endif

			SC7->(DbSkip())

		enddo

	endif

	if lDelete

		for nX := 1 to len(aRegCC)

			if !aRegCC[nX][3]$"L"

				lDelete2 := .F.

			endif

		next nX

		if lDelete2

			SCR->(DbSelectArea("SCR"))
			SCR->(DbSetOrder(1))  //estava como DBSETOder erro de sintaxe Caique 24/08/18
			SCR->(DbGotop())
			
			if SCR->(DbSeek(cFilials+"PC"+cNumSc7)) .OR. SCR->(DbSeek(cFilials+"IP"+cNumSc7))
				
				While !SCR->(Eof()) .AND. AllTrim(SCR->CR_NUM)$cNumSc7 .AND. SCR->CR_FILIAL$cFilials
					RecLock("SCR", .F.)
					SCR->(dbDelete())
					SCR->(DbSkip())
				
				Enddo				

			endif
			
				DBM->(DbSelectArea("DBM"))
				DBM->(DbSetOrder(1))  
				DBM->(DbGotop())
				
					if DBM->(DbSeek(cFilials+"PC"+cNumSc7)) .OR. DBM->(DbSeek(cFilials+"IP"+cNumSc7))
						
						While !DBM->(Eof()) .AND. AllTrim(DBM->DBM_NUM)$cNumSc7 .AND. DBM->DBM_FILIAL$cFilials
							RecLock("DBM", .F.)
							DBM->(dbDelete())
							DBM->(DbSkip())
				
						Enddo
					
					endif
			
			

		endif

	endif
	
	RestArea(aAreaDBM)
	RestArea(aAreaSCR)
	RestArea(aAreaSC7)
	RestArea(aArea)

Return()
