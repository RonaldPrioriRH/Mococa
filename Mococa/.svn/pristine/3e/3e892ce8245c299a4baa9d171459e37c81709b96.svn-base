#Include 'Protheus.ch'
#Include 'TopConn.ch'

/*/{Protheus.doc} RFINA011

Rotina chamada do ponto de entrada RFINA011
para verificar se banco Fidic e houve existe recompra de titulo

@author Leandro Rodrigues
@since 25/05/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

User Function RFINA011(aValores)
	
	
	// Estrutura de aValores
	
	// Numero do Tiulo		- 01
	// data da Baixa		- 02
	// Tipo do Tiulo		- 03
	// Nosso Numero			- 04
	// Valor da Despesa		- 05
	// Valor do Desconto	- 06
	// Valor do Abatiment	- 07
	// Valor Recebido    	- 08
	// Juros				- 09
	// Multa				- 10
	// Outras Despesas		- 11
	// Valor do Credito		- 12
	// Data Credito			- 13
	// Ocorrencia			- 14
	// Motivo da Baixa 		- 15
	// Linha Inteira		- 16
	// Data de Vencto	   	- 17
	
	
	DbSelectArea("ZEG")
	ZEG->(DbSetOrder(1))
	
	//Valido se banco é Fidic
	If SA6->A6_XFACTOR == 'S' .AND. (aValores[9]+aValores[10] ) > 0
		
		//Busca por IdCnab
		SE1->(dbSetOrder(16)) // Filial+IdCnab
		If SE1->(MsSeek(xFilial("SE1")+	aValores[1]))
			RFIN011REC(aValores)
		Endif
	Endif
	
Return

//-----------------------------------------------------
// Verifica se Titulo possui Recompa
//-----------------------------------------------------
Static Function RFIN011REC(aValores)
	
	Local cQry 		:= ""
	Local aCp  		:= {}
	Local cNumTit	:= ""
	Local nCont		:= 0
	Local cParcela	:= Space(TamSx3("E2_PARCELA")[1])
	Local nValor	:= aValores[9]+aValores[10] //Juros+Multa
	Local lOk		:= .T.
	Local nDiasTit	:= SuperGetMv( "MV_XDIASTIT" , .F. , 1 ,  )
	
	Private lMsErroAuto  := .F.
	Private lF100Auto    := .T.
	
	DbSelecTArea("ZEH")
	ZEH->(DbSetOrder(1))
	
	cQry:= " SELECT "
	cQry+= "	ZEG_CODIGO,"
	cQry+= "	ZEG_TAXA"
	cQry+= " FROM " + RETSQLNAME("ZEG") + " ZEG"
	cQry+= " INNER JOIN " + RETSQLNAME("ZEI") + " ZEI"
	cQry+= " ON ZEI_FILIAL 		= ZEG_FILIAL"
	cQry+= " 	AND ZEI_CODIGO 	= ZEG_CODIGO"
	cQry+= " 	AND ZEG_FILIAL 	= '" + xFilial("ZEG") + "'"
	cQry+= " 	AND ZEG_NUMBOR 	= '" + SE1->E1_NUMBOR + "'"
	cQry+= " 	AND ZEG_ITEM 	= ZEI_ITEM"
	cQry+= " 	AND ZEI.D_E_L_E_T_<> '*'"
	cQry+= " WHERE ZEG.D_E_L_E_T_<> '*'"
	cQry+= " 	AND ZEG_TAXA 	= '" + SuperGetMv( "MV_XTAXA" , .F. , "" ,  ) + "'"
	
	cQry := ChangeQuery(cQry)
	
	If Select("QZEG")>0
		QZEG->(DbCloseArea())
	Endif
	
	TcQuery cQry New Alias "QZEG"
		
	if QZEG->(EOF()) //se nao tem recompra
		
		If ZEH->(DbSeek(xFilial("ZEH")+QZEG->ZEG_TAXA))
			
			//Verifica se numero ja foi usado
			While lOk
				cNumTit:= STRZERO(Val(SE1->E1_NUMBOR+cValToChar(nCont)) ,TamSx3("E2_NUM")[1],0)
				
				if SE2->(DbSeek(xFilial("SE2")+ZEH->ZEH_PREFIX+cNumTit+cParcela+ZEH->ZEH_TIPO+SA6->A6_FORNECe+SA6->A6_LOJA))
					nCont++
				Else
					lOk := .F.
				Endif
			Enddo
			
			aCp := {{ "E2_PREFIXO"  , ZEH->ZEH_PREFIX            									, NIL },;   		// Prefixo
					{ "E2_NUM"      , cNumTit														, NIL },;  	 		// Numero do Titulo
					{ "E2_TIPO"     , ZEH->ZEH_TIPO					              					, NIL },;   		// Tipo
					{ "E2_NATUREZ"  , ZEH->ZEH_NATURE				    							, NIL },;   	  	// Natureza
					{ "E2_FORNECE"  , SA6->A6_FORNEC												, NIL },; 		  	// Cod. Cliente
					{ "E2_LOJA   "  , SA6->A6_LOJA													, NIL },; 	  		// Loja. Cliente
					{ "E2_EMISSAO"  , dDataBase														, NIL },; 			// Data de emissao
					{ "E2_VENCTO"   , DaySum( dDataBase , nDiasTit )								, NIL },; 			// Data Vencimento
					{ "E2_VALOR"    , nValor														, NIL },;	  		// Valor do Titulo
					{ "E2_CCD "	 	, ZEH->ZEH_CCD													, NIL }}	  	  	// Centro de Custo Debito
			
			MsExecAuto({|x,y,z|FINA050(x,y,z)},aCp,, 3)
			
			If lMsErroAuto
				MostraErro()
				lMsErroAuto := .F.
			Endif
			
		Endif
	Endif
	
Return