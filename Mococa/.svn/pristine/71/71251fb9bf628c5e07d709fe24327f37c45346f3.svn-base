#Include 'Protheus.ch'

#Define CRLF chr(13)+chr(10)

/*/{Protheus.doc} ROMSE015

Função genérica de validação de exclusão de documento entrada/saída/pedido
para não permitir excluir (estornar processo) fora de sequência

@author TOTVS
@since 29/03/2017
@version P12
@param nulo            
@return nulo
/*/
User Function ROMSE015(cTab, cIdTriang)

	Local aArea := GetArea()
	Local aAreaSF2 := SF2->(GetArea())
	Local aAreaSF1 := SF1->(GetArea())
	Local aAreaSC5 := SC5->(GetArea())
	Local lRet := .T.
	Local cTipo := ""
	Local cFilVen := cFilEst := cFilInt := ""
	Local cDocs := ""
	
	//se ta vazio, não faz nada
	if empty(cIdTriang)
		Return .T.
	endif
		
	//identificando as filiais venda, estoque e intermediaria
	DAK->(dbOrderNickName("IDTRIANG"))
	if DAK->(DbSeek(cIdTriang))
		cTipo := "1" //1=Por Carga, 2=Por Pedido
	endif
		
	SC5->(dbOrderNickName("IDTRIANG"))
	if SC5->(DbSeek(cIdTriang))
		if empty(cTipo)
			cTipo := "2" //1=Por Carga, 2=Por Pedido
		endif
		
		//encontrando pedido da FV
		While SC5->(!Eof()) .AND. SC5->C5_XIDTRI == cIdTriang
			
			if !empty(SC5->C5_XFILEST)
				cFilVen := SC5->C5_FILIAL
				cFilEst := SC5->C5_XFILEST
				cFilInt := SC5->C5_XFILINT
				EXIT
			endif
			
			SC5->(DbSkip())
		enddo
	endif
	
	if empty(cTipo) .OR. empty(cFilEst)
		MsgInfo("Id Triangulação não encontrado ou pedido/carga não configurados corretamente para essa transação!")
		Return .F.			
	endif
	
	if cFilAnt == cFilInt //se documento é na filial intermediaria
		
		if cTab == "SF2"
			//verificar se tem Documento Entrada FV
			DbSelectArea("SF1")
			SF1->(dbOrderNickName("IDTRIANG"))
			if SF1->(DbSeek(cIdTriang))
				While SF1->(!Eof()) .AND. SF1->F1_XIDTRI == cIdTriang
					
					//vejo se tem doc na filial de venda
					if SF1->F1_FILIAL == xFilial("SF1", cFilVen)
						cDocs += "Doc.Entrada -> Filial: " +SF1->F1_FILIAL+ "; Doc.: "+SF1->F1_DOC+"; Serie: "+SF1->F1_SERIE+"." + CRLF
					endif
										
					SF1->(DbSkip())
				enddo
			endif
		endif
		
		if cTab == "SC5"
			//verificar se tem Documento Saída FI
			DbSelectArea("SF2")
			SF2->(dbOrderNickName("IDTRIANG"))
			if SF2->(DbSeek(cIdTriang))
				While SF2->(!Eof()) .AND. SF2->F2_XIDTRI == cIdTriang
					
					//vejo se tem doc na filial intermediaria
					if SF2->F2_FILIAL == xFilial("SF2", cFilInt)
						cDocs += "Doc.Saída -> Filial: " +SF2->F2_FILIAL+ "; Doc.: "+SF2->F2_DOC+"; Serie: "+SF2->F2_SERIE+"." + CRLF
					endif
										
					SF2->(DbSkip())
				enddo
			endif
		endif
		
		if cTab == "SF1"
			//verificar se tem Pedido de Venda FI
			DbSelectArea("SC5")
			SC5->(dbOrderNickName("IDTRIANG"))
			if SC5->(DbSeek(cIdTriang))
				While SC5->(!Eof()) .AND. SC5->C5_XIDTRI == cIdTriang
					
					//vejo se tem doc na filial intermediaria
					if SC5->C5_FILIAL == xFilial("SC5", cFilInt)
						cDocs += "Pedido -> Filial: " +SF1->F1_FILIAL+ "; Numero: "+SC5->C5_NUM+"." + CRLF
					endif
										
					SC5->(DbSkip())
				enddo
			endif
		endif
	
	elseif cFilAnt == cFilEst //se documento é na filial estoque
		
		if cTab == "SF2"
			//verificar se tem Documento Entrada FI ou FV
			DbSelectArea("SF1")
			SF1->(dbOrderNickName("IDTRIANG"))
			if SF1->(DbSeek(cIdTriang))
				While SF1->(!Eof()) .AND. SF1->F1_XIDTRI == cIdTriang
					
					if empty(cFilInt) 
						//se nao tem filial intermediaria, vejo se tem doc na filial de venda
						if SF1->F1_FILIAL == xFilial("SF1", cFilVen)
							cDocs += "Doc.Entrada -> Filial: " +SF1->F1_FILIAL+ "; Doc.: "+SF1->F1_DOC+"; Serie: "+SF1->F1_SERIE+"." + CRLF
						endif
					else
						//se tem filial intermediaria, vejo se tem doc na filial intermediaria
						if SF1->F1_FILIAL == xFilial("SF1", cFilInt)
							cDocs += "Doc.Entrada -> Filial: " +SF1->F1_FILIAL+ "; Doc.: "+SF1->F1_DOC+"; Serie: "+SF1->F1_SERIE+"." + CRLF
						endif				
					endif
										
					SF1->(DbSkip())
				enddo
			endif
		endif
		
		if cTab == "SC5"
			//verificar se tem Documento Saída FE
			DbSelectArea("SF2")
			SF2->(dbOrderNickName("IDTRIANG"))
			if SF2->(DbSeek(cIdTriang))
				While SF2->(!Eof()) .AND. SF2->F2_XIDTRI == cIdTriang
					
					//vejo se tem doc na filial estoque
					if SF2->F2_FILIAL == xFilial("SF2", cFilEst)
						cDocs += "Doc.Saída -> Filial: " +SF2->F2_FILIAL+ "; Doc.: "+SF2->F2_DOC+"; Serie: "+SF2->F2_SERIE+"." + CRLF
					endif
										
					SF2->(DbSkip())
				enddo
			endif
		endif
	
	elseif cFilAnt == cFilVen //se documento é na filial estoque
		
		if cTab == "SF1"
			//verificar se tem Documento Saída FV
			DbSelectArea("SF2")
			SF2->(dbOrderNickName("IDTRIANG"))
			if SF2->(DbSeek(cIdTriang))
				While SF2->(!Eof()) .AND. SF2->F2_XIDTRI == cIdTriang
					
					//vejo se tem doc na filial de venda
					if SF2->F2_FILIAL == xFilial("SF2", cFilVen)
						cDocs += "Doc.Saída -> Filial: " +SF2->F2_FILIAL+ "; Doc.: "+SF2->F2_DOC+"; Serie: "+SF2->F2_SERIE+"." + CRLF
					endif
										
					SF2->(DbSkip())
				enddo
			endif
		endif
		
	endif
	
	if !empty(cDocs)
		xmaghelpfis("Atenção",;
					"Ação não permitida! Este documento é gerador de outro documento no processo de faturamento triangular! Id. Triang.: "+cIdTriang,;
					"Estorne primeiro os documentos: " + CRLF + cDocs)
		lRet := .F.
	endif
	
	RestArea(aAreaSC5)
	RestArea(aAreaSF1)
	RestArea(aAreaSF2)
	RestArea(aArea)
	
Return lRet

