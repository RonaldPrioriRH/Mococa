#Include 'Protheus.ch'
#include 'Topconn.CH'

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³MT097APR   ºAutor  ³Tarcísio Silva MirandaºData³ 04/12/2017 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³executado após a Liberação do Pedido de Compras, se o tipo  º±±
º±±			  do Documento (CR_TIPO) for igual a 'PC' ou 'AE',  após a    º±±
º±±			  liberação do Pedido de Compras, na gravação dos lançamentos º±±
º±±			  nas contas orcamentarias (SIGAPCO) e após atualizar o campo º±± 
º±±			  SC7->C7_CONAPRO (controle de aprovação) com o conteudo 'L'. º±±
±±º          ³ (Documentos com alçada) após operação de inclusão. 		  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Burla erro no sistema que libera toda a SC7 quando libera  º±±
º±±			   somente um item. 						  				  º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function MT097APR()

	Local aArea 	:= GetArea()
	Local aAreaDBL	:= DBL->(GetArea())
	Local aAreaSCR  := SCR->(GetArea())
	Local aAreaSC7  := SCR->(GetArea())
	Local cEOL 		:= Chr(13)+Chr(10)
	Local cQry		:= ""

	if Upper(FunName())$"MATA094"
	
		DBL->(DbSelectArea("DBL"))
		DBL->(DbSetOrder(1))
		DBL->(DbGotop())
	
		if DBL->(DbSeek(SCR->CR_FILIAL+SCR->CR_GRUPO+SCR->CR_ITGRP))
	
			if !AllTrim(DBL->DBL_CC) $ AllTrim(SC7->C7_CC)
	
				cQry := " SELECT COUNT(CR_NUM) NCOUNTREG   						" +cEOL
				cQry += " FROM " + RetSqlName("SCR") 		   		  			  +cEOL
				cQry += " WHERE D_E_L_E_T_ <> '*'			 					" +cEOL
				cQry += " AND CR_NUM 		= '"+SC7->C7_NUM+"' 				" +cEOL
				cQry += " AND CR_FILIAL 	= '"+SC7->C7_FILIAL+"' 				" +cEOL  
				cQry += " AND CR_XCC 		= '"+SC7->C7_CC+"' 					" +cEOL
				cQry += " AND CR_USERLIB 	= ' '  								" +cEOL	
	
				cQry := ChangeQuery(cQry)
	
				If Select("TMP")>0
					TMP->(DbCloseArea())
				Endif
	
				TcQuery cQry New Alias "TMP" 
	
				IF TMP->NCOUNTREG > 0 
	
					SC7->(RecLock("SC7",.F.))
					SC7->C7_CONAPRO := "B"
					SC7->(MsUnlock())
	
				endif
	
			endif
	
		endif
	
	endif

	RestArea(aAreaSC7)
	RestArea(aAreaSCR)
	RestArea(aAreaDBL)
	RestArea(aArea)

Return()