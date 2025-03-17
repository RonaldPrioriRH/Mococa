#Include 'Protheus.ch'

/*/{Protheus.doc} ROMSE011
Utilizado no PE M460FIM - após gerar NF saida
Faturamento Triangular

@author Danilo 
@since 25/04/2017
@version P12
@param nulo          
@return nulo
/*/
User Function RFATE035()
	
	Local aArea := GetArea()
	Local aAreaSC6 := SC6->(GetArea())
	Local aAreaSD2 := SD2->(GetArea())
	
	//gravo flag id triangulaçao
	Reclock("SF2",.F.)
		SF2->F2_XIDTRI := SC5->C5_XIDTRI
	SF2->(MsUnlock())
	
	DbSelectArea("SD6")
	SC6->(DbSetOrder(1))
	
	DbSelectArea("SD2")
	SD2->(DbSetOrder(3)) //D2_FILIAL+D2_DOC+D2_SERIE+D2_CLIENTE+D2_LOJA+D2_COD+D2_ITEM
	SD2->(DbSeek(SF2->F2_FILIAL+SF2->F2_DOC+SF2->F2_SERIE))
	While SD2->(!Eof()) .AND. SD2->D2_FILIAL+SD2->D2_DOC+SD2->D2_SERIE == SF2->F2_FILIAL+SF2->F2_DOC+SF2->F2_SERIE
		if SC6->(DbSeek(SD2->D2_FILIAL + SD2->D2_PEDIDO + SD2->D2_ITEMPV))
			Reclock("SD2", .F.)
				SD2->D2_XTFIORI := SC6->C6_XTFIORI
				SD2->D2_XTPVORI := SC6->C6_XTPVORI
				SD2->D2_XTITORI := SC6->C6_XTITORI
			SD2->(MsUnlock())
		endif
		
		SD2->(DbSkip())
	enddo
	
	RestArea(aAreaSC6)
	RestArea(aAreaSD2)
	RestArea(aArea)
	
Return

