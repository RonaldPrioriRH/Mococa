#Include 'Protheus.ch'


/*/{Protheus.doc} RESTE004

Função utilizada para gerar as MO´s complementares. uso MOCOCA.


@author Cláudio Ferreira
@since 26/07/2017
@version 1.0
@return ${return}, ${return_description}
@example
(examples)
@see (links_or_references)
/*/

User Function RESTE004()
	Local nRegD3 := SD3->(Recno())
	Local nRegD3H6 := 0
	Local aGrpCtb:={}
	Local aCC:={}
	Local I
	Local nHora:=0,nMinutos:=0,nTime:=0
	Local nPos:=AT(":",SH6->H6_TEMPO)
	LOCAL aArea    := GetArea()
	LOCAL aAreaD3  := SD3->(GetArea())
	LOCAL aAreaC2  := SC2->(GetArea())
	LOCAL aAreaH1  := SH1->(GetArea())
	LOCAL aAreaH6  := SH6->(GetArea())
	LOCAL aAreaG2  := SG2->(GetArea())
	LOCAL aAreaB1  := SB1->(GetArea())
	LOCAL aAreaCTR := CTR->(GetArea())
	Local CC := ""
	

	PRIVATE cCusMed := GetMv("MV_CUSMED")  //Compatibilidade para o reprocessamento// Não tirar
	PRIVATE L240:=.F.
	PRIVATE ARATVEI:={}   

	//Calcula hora apontada na SH6
	If nPos == 0
		nPos:=AT(":",PesqPict("SH6","H6_TEMPO"))
	EndIf
	nHora := Val(Substr(SH6->H6_TEMPO,1,nPos-1)+"."+Substr(SH6->H6_TEMPO,nPos+1,2))
	nMinutos := (((nHora-Int(nHORA))*100)/60)
	If nMinutos < 0  // Case seja negativo, o prg. subtrai 1 hora do tempo e soma nos minutos
		nTime --
		nMinutos := 1 + nMinutos
	EndIf
	nTime := (nTime+Int(nHORA))+nMinutos

	//Localiza OP
	dbSelectArea("SC2")
	dbSetOrder(1)
	MsSeek(xFilial("SC2")+SH6->H6_OP)
	//Localiza SH1
	dbSelectArea("SH1")
	dbSetOrder(1)
	//Roteiro
	dbSelectArea("SG2")
	dbSetOrder(1)
	cChave:=xFilial("SG2")+SH6->H6_PRODUTO+SC2->C2_OPERAC
	MsSeek(xFilial("SG2")+SH6->H6_PRODUTO+SC2->C2_OPERAC+"01")
	While !EOF() .and. xFilial("SG2")+SG2->G2_PRODUTO+SG2->G2_CODIGO = cChave
		if SH6->H6_RECURSO<>SG2->G2_RECURSO .AND. SH1->(MsSeek(xFilial("SH1")+SG2->G2_RECURSO))
			if !Empty(SH1->H1_CCUSTO) 
				aAdd(aCC,SH1->H1_CCUSTO)
			endif
		endif
		dbSelectArea("SG2")
		dbSkip()
	Enddo

	For CC:=1 to Len(aCC)	
		//Carrega Grupos Contabeis (CTR)
		dbSelectArea("CTR")
		dbSetOrder(1)
		DbGotop()
		While !EOF()
			cCusto:=aCC[CC]
			cGrupo:=CTR->CTR_GRUPO
			SB1->(dbSetOrder(8))
			// Checa codigo de produto
			If SB1->(MsSeek(xFilial("SB1")+cCusto+cGrupo))
				cPROD:=SB1->B1_COD  
			Else
				MsgStop("Produto: Recurso["+Alltrim(SH1->H1_CODIGO)+"] C.Custo["+Alltrim(cCusto)+"] Grupo["+Alltrim(cGrupo)+"] não encontrado. Informe a controladoria.","Atenção")		
				exit
			EndIf

			//Posiciona  SD3
			dbSelectArea("SD3")
			dbSetOrder(14)    	 
			if  !dbSeek(xFILIAL("SD3")+cPROD+SH6->H6_IDENT)
				aAdd(aGrpCtb,{CTR->CTR_GRUPO,0,cCusto})
			else
				nRegD3H6 :=SD3->(Recno())  
				aAdd(aGrpCtb,{CTR->CTR_GRUPO,nRegD3H6,cCusto})
			endif
			dbSelectArea("CTR")
			dbSkip()
		EndDo
	Next CC
	dbSelectArea("SD3")
	if nRegD3H6>0
		SD3->(DbGoto(nRegD3H6))//Restaura D3 da SH6 com as horas calculadas
	else
		SD3->(DbGoto(nRegD3))//Restaura D3 original
	endif
	For I:=1 to Len(aGrpCtb)
		//Altera a MO
		cCusto:=aGrpCtb[I,3]
		cGrupo:=aGrpCtb[I,1]
		SB1->(dbSetOrder(8))
		// Checa codigo de produto
		If SB1->(MsSeek(xFilial("SB1")+cCusto+cGrupo))
			cPROD:=SB1->B1_COD
		EndIf
		dbSelectArea("SD3")
		if aGrpCtb[I,2]>0
			SD3->(DbGoto(aGrpCtb[I,2]))//Restaura D3 da SH6 com as horas calculadas
		else
			SD3->(DbGoto(nRegD3))//Restaura D3 original
		endif        
		RegToMemory("SD3",.f.,.f.)
		RecLock("SD3",if(aGrpCtb[I,2]=0,.T.,.F.))
		M->D3_COD  := cPROD
		M->D3_TIPO := "MO"
		M->D3_UM := "HR"
		M->D3_CHAVE := "E0"
		M->D3_TM   := "999"   
		M->D3_QUANT:=nTime 
		M->D3_QTDSEGUM:=0    
		M->D3_CLVL := if(aGrpCtb[I,2]=0,"AUTOI6","AUTOA6")
		MemToReg("SD3")
		MsUnLock()
		A240Atu()
		//MsgStop("Produto: Produto:["+Alltrim(cPROD)+"] Tempo["+Alltrim(Str(nTime,7,2))+"] "+aGrpCtb[I,1]+" Recno ["+Alltrim(Str(aGrpCtb[I,2]))+"] ","Atenção")		

		//*************************************
		//* Corrige identificacao errada da RE. *
		//***************************************
		dbSelectArea("SD3")
		RecLock("SD3",.F.)
		Replace D3_CF With "RE1"
		MsUnLock()
		SB1->(dbSetOrder(1))
		If !SB1->(dbSeek(xFILIAL('SB1')+cPROD))
			MsgStop("Produto: "+Alltrim(cPROD)+" nao encontrado. Informe a controladoria.","Atencao")
		EndIf
	Next I
	//SD3->(DbGoto(nRegD3))//Restaura D3 original
	//ALERT('VAI APAGAR')
	//U_MT680GREST() //apaga

	RestArea(aAreaD3)
	RestArea(aAreaC2)
	RestArea(aAreaH1)
	RestArea(aAreaH6)
	RestArea(aAreaG2)
	RestArea(aAreaB1)
	RestArea(aAreaCTR)
	RestArea(aArea)
Return


//Exclusão da MO GGF
User Function MT680GREST
	Local nRegD3 := SD3->(Recno())
	Local nRegAtu := SD3->(Recno())
	Local aArea	:= GetArea()
	Local cOP
	Local cIdent
	cOP   := SD3->D3_OP
	cIdent:= SD3->D3_IDENT
	dbSelectArea("SD3")
	dbSetOrder(1)
	if  dbSeek(xFILIAL("SD3")+cOP)                          
		While !SD3->(EOF()) .And. SD3->D3_FILIAL+SD3->D3_OP == xFilial("SD3")+cOP
			nRegAtu := SD3->(Recno())
			If 'AUTO'$SD3->D3_CLVL .and. cIdent = SD3->D3_IDENT .and. SD3->D3_ESTORNO<>'S'
				a240DesAtu()
			Endif
			dbSelectArea("SD3")
			SD3->(DbGoto(nRegAtu)) //Restaura D3 anterior
			SD3->(dbSkip())
		EndDo
	endif	  
	RestArea(aArea)								
	SD3->(DbGoto(nRegD3))//Restaura D3 original	
Return 

/*
*****************************************************************************
*****************************************************************************
***************************************************************************
***Programa  *MemToReg  *Autor  *Cl*udio Ferreira    * Data *  12/12/08   ***
***************************************************************************
***Desc.     * Fun**o para gravar as variaveis de memory para o registro  ***
***          *                                                            ***
***************************************************************************
***Uso       *u_MemToReg(cAlias) 										  ***
***************************************************************************
*****************************************************************************
*****************************************************************************
*/
Static Function MemToReg(cAlias)
	Local aArea    := GetArea()
	Local nX    := 0
	Local bCampo := { |nField| FieldName(nField) }

	dbSelectArea(cAlias)
	For nX := 1 To FCount()
		If "FILIAL" $ FieldName(nX)
			FieldPut(nX,xFilial(cAlias))
		Else
			FieldPut(nX,M->&(Eval(bCampo,nX)))
		Endif
	Next
	RestArea(aArea)
Return(Nil)


