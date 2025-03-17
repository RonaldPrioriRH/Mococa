#Include 'Protheus.ch'

/*/{Protheus.doc} MT110GET
Pontos de Entrada para tratamento de Prioridade nos processos de Compras

@author Danilo Brito
@since 23/06/2017
@version P12
@param nulo            
@return nulo
/*/


//PE MT110GET
//Ponto entrada Altera as coordenadas de Array e redimensiona a dialog
//Solicitaçao de Compras
User Function RCOME08A(aRet)

	aRet[2,1] := 90 //Abaixando o começo da linha da getdados
	aRet[1,3] := 85 // Abaixando a linha de contorno dos campos do cabeçalho

Return 

//MT110TEL
//Ponto entrada Manipulação do Cabeçalho da Solicitação de Compras
//Para add campos
User Function RCOME08B(oNewDialog,aPosGet,nOpcx,nReg)

	Local cTitSol, cTitRea
	
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	if DbSeek('C1_XPRISOL') 
		cTitSol := OemToAnsi(SX3->X3_TITULO)
		
		If nOpcx == 3 //inclusão
			_cC1PriSol := CriaVar('C1_XPRISOL')
		Else
			_cC1PriSol := SC1->C1_XPRISOL
		Endif
	
		@ 64,aPosGet[1,1] SAY cTitSol PIXEL SIZE 100,11 Of oNewDialog
		@ 63,aPosGet[1,2] MSCOMBOBOX _cC1PriSol ITEMS StrToKArr(" ;"+Alltrim(X3Cbox()),";") SIZE 075, 014 Of oNewDialog Pixel When Inclui  
		
	endif
	
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	if DbSeek('C1_XPRIREA') 
		
		cTitRea := OemToAnsi(SX3->X3_TITULO)
		
		If nOpcx == 3 //inclusão
			_cC1PriRea := CriaVar('C1_XPRIREA')
		Else
			_cC1PriRea := SC1->C1_XPRIREA
		Endif
		
		@ 64,aPosGet[1,3] SAY cTitRea PIXEL SIZE 100,11 Of oNewDialog
		@ 63,aPosGet[1,4] MSCOMBOBOX _cC1PriRea ITEMS StrToKArr(" ;"+Alltrim(X3Cbox()),";") SIZE 075, 014 Of oNewDialog Pixel When Inclui.or.Altera 
		
	endif

Return

//M110STTS
//Ponto entrada Inclusão de interface após gravar a solicitação de Compras
User Function RCOME08C(cNumSol, nOpt)

	Local aAreaSC1	:= SC1->(GetArea())

	if nOpt == 1 .OR. nOpt == 2 //inclui ou altera
	
		if type("_cC1PriSol")=="C" .AND. type("_cC1PriRea")=="C"
	
			SC1->(dbSetorder(1)) //C1_FILIAL+C1_NUM+C1_ITEM+C1_ITEMGRD
			SC1->(DbSeek(xFilial("SC1")+cNumSol))
			While SC1->(!Eof()) .AND. SC1->(C1_FILIAL+C1_NUM) == xFilial("SC1")+cNumSol 
				Reclock("SC1", .F.)
					
					SC1->C1_XPRISOL := _cC1PriSol
					SC1->C1_XPRIREA := _cC1PriRea
						
				SC1->(MsUnlock())
							
				SC1->(Dbskip())
			enddo
			
		endif
	endif
	
	RestArea(aAreaSC1)
	
Return

//Inic Padrão dos campos C8_XPRISOL e C8_XPRIREA
//Execblock no Inic Padrão dos campos da SC8, para rotina gera cotações
User Function RCOME08D(cCampo)
	
	Local cRet := " "
	Local aAreaSC1 := SC1->(GetArea())
	
	//Função que faz a gravaçao da cotação a partir da solicitação
	If IsInCallStack("A131PROCES")
		
		if cCampo == "C8_XPRISOL" 
			cRet := SC1->C1_XPRISOL
		endif
		
		if cCampo == "C8_XPRIREA" 
			cRet := SC1->C1_XPRIREA
		endif
	EndIf
	
	RestArea(aAreaSC1)
	
Return cRet


//Inic Padrão dos campos C7_XPRISOL e C7_XPRIREA
//Execblock no Inic Padrão dos campos da SC7, verificando a função A120PID ou A120F4
User Function RCOME08E(cCampo)
	
	Local cRet := " "
	
	if IsInCallStack("A120PID") .OR. IsInCallStack("A120F4")
		if Alias() == "SC1" //se vem da solicitação
		
			if cCampo == "C7_XPRISOL" 
				cRet := SC1->C1_XPRISOL
			endif
			
			if cCampo == "C7_XPRIREA"
				cRet := SC1->C1_XPRIREA
			endif
			
		endif
	endif 
	
Return cRet


//Inic Padrão dos campos D1_XPRISOL e D1_XPRIREA
//Execblock no Inic Padrão dos campos da SD1, verificando a função NfePC2Acol
User Function RCOME08F(cCampo)
	
	Local cRet := " "
	
	if IsInCallStack("NfePC2Acol")
		if Alias() == "SC7" //se vem da solicitação
		
			if cCampo == "D1_XPRISOL" 
				cRet := SC7->C7_XPRISOL
			endif
			
			if cCampo == "D1_XPRIREA" 
				cRet := SC7->C7_XPRIREA
			endif
			
		endif
	endif
	
Return cRet


