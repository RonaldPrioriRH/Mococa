#INCLUDE "protheus.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ MSD2520  ºAutor  ³Tarcisio Silva MirandaºData³  10/01/2018 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Esse ponto de entrada está localizado na função A520Dele().º±±
±±		     ³ É chamado antes da exclusão do registro no SD2.			  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Excluir entrada quando excluir saída.                      º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function MSD2520()

	Local aArea    := GetArea()
	Local aAreaSF1 := SF1->(GetArea())
	Local aAreaSF2 := SF2->(GetArea())
	Local aAreaSD1 := SD1->(GetArea())
	Local aAreaSD2 := SD2->(GetArea())

	Local cFilSF1	:= ""
	Local cNumNFee 	:= ""
	Local cSerNfee 	:= ""
	Local cCodNfee	:= ""
	Local cLjNfee	:= ""
	Local nRecSD1 	:= 0
	Local cBkpFilAnt:= cFilAnt

	Local aCabec 	:= {}
	Local aAux 		:= {}
	Local aNovoIt 	:= {}
	Local cNumNFs 	:= SF2->F2_DOC
	Local cSerNfs 	:= SF2->F2_SERIE

	Local cCgcCli	:= Posicione("SA1",1,xFilial("SA1")+SF2->F2_CLIENTE+SF2->F2_LOJA,"A1_CGC")
	Local cCodFor  	:= Posicione("SA2",3,xFilial("SA2")+cCgcCli,"A2_COD")
	Local cLjFor 	:= Posicione("SA2",3,xFilial("SA2")+cCgcCli,"A2_LOJA")
	Local cFilials 	:= Posicione("SA2",3,xFilial("SA2")+cCgcCli,"A2_FILTRF")

	Private lMsErroAuto := .F.

	if u_funExec()

		SF1->(DbSelectArea("SF1"))
		SF1->(DbSetOrder(1))//F1_FILIAL+F1_DOC+F1_SERIE+F1_FORNECE+F1_LOJA+F1_TIPO
		SF1->(DbGotop())
		if !SF1->(DbSeek(cFilials+cNumNFs+cSerNfs+cCodFor+cLjFor))

			RestArea(aAreaSF1) 
			RestArea(aAreaSF2) 
			RestArea(aAreaSD1) 
			RestArea(aAreaSD2) 
			RestArea(aArea)
			Return()

		elseif SF1->(DbSeek(cFilials+cNumNFs+cSerNfs+cCodFor+cLjFor))

			cFilSF1		:= SF1->F1_FILIAL
			cNumNFee 	:= SF1->F1_DOC
			cSerNfee 	:= SF1->F1_SERIE
			cCodNfee	:= SF1->F1_FORNECE
			cLjNfee		:= SF1->F1_LOJA

			cFilAnt := cFilials

			aAdd(aCabec,{"F1_TIPO"   	,SF1->F1_TIPO				, Nil})
			aadd(aCabec,{"F1_FORMUL" 	,SF1->F1_FORMUL				, Nil})
			aAdd(aCabec,{"F1_DOC"    	,SF1->F1_DOC				, Nil})
			aAdd(aCabec,{"F1_SERIE"  	,SF1->F1_SERIE				, Nil})
			aAdd(aCabec,{"F1_EMISSAO"	,SF1->F1_EMISSAO			, Nil})
			aAdd(aCabec,{"F1_FORNECE"	,SF1->F1_FORNECE			, Nil})
			aAdd(aCabec,{"F1_LOJA"   	,SF1->F1_LOJA				, Nil})
			aAdd(aCabec,{"F1_ESPECIE"	,SF1->F1_ESPECIE			, Nil})
			aAdd(aCabec,{"F1_COND"		,SF1->F1_COND				, Nil})

			SD1->(DbselectArea("SD1"))
			SD1->(DbGotop())
			SD1->(DbSetOrder(1)) //D1_FILIAL+D1_DOC+D1_SERIE+D1_FORNECE+D1_LOJA+D1_DOC+D1_ITEM
			if SD1->(DbSeek(cFilials+cNumNFee+cSerNfee+cCodNfee+cLjNfee))

				While SD1->(!EOF()) .AND. cFilials$SD1->D1_FILIAL .AND. cNumNFee$SD1->D1_DOC .AND. cSerNfee$SD1->D1_SERIE .AND. cCodNfee$SD1->D1_FORNECE .AND. cLjNfee$SD1->D1_LOJA

					nRecSD1 := SD1->(Recno())

					SD1->(DbGoTo(nRecSD1))

					aAdd(aAux, {"D1_ITEM"   , SD1->D1_ITEM   , nil})
					aAdd(aAux, {"D1_COD"    , SD1->D1_COD    , nil})
					aAdd(aAux, {"D1_UM"    	, SD1->D1_UM     , nil})
					aAdd(aAux, {"D1_QUANT"  , SD1->D1_QUANT  , nil})
					aAdd(aAux, {"D1_TES"    , SD1->D1_TES 	 , nil}) 
					aAdd(aAux, {"D1_VUNIT"  , SD1->D1_VUNIT  , nil})
					aAdd(aAux, {"D1_TOTAL"  , SD1->D1_TOTAL  , nil})
					aAdd(aAux, {"D1_LOCAL"  , SD1->D1_LOCAL	 , nil})
					aAdd(aAux, {"D1_LOTECTL", SD1->D1_LOTECTL, nil})
					aAdd(aAux ,{"D1_DTVALID", SD1->D1_DTVALID, nil})
					aAdd(aAux ,{"D1_XTFIORI", SD1->D1_XTFIORI, nil})
					aAdd(aAux ,{"D1_XTPVORI", SD1->D1_XTPVORI, nil})
					aAdd(aAux ,{"D1_XTITORI", SD1->D1_XTITORI, nil})

					aAdd(aNovoIt, aClone(aAux))

					SD1->(DbSkip())

				EndDo

			endif

			MSExecAuto({|x, y, z| MATA103(x, y, z)}, aCabec, aNovoIt, 5) //Exclusão de documento. 

			if lMsErroAuto 

				MostraErro()
				MsgAlert("Erro ao Excluir Nota fiscal de entrada!","Atenção!")
				
			else
			
				Aviso("Informação!","Nota Fical de Saída e de entrada estornada com sucesso!",{"Ok"})
			
			endif

			cFilAnt := cBkpFilAnt

		endif

	endif

	RestArea(aAreaSF1) 
	RestArea(aAreaSF2) 
	RestArea(aAreaSD1) 
	RestArea(aAreaSD2) 
	RestArea(aArea)

Return()