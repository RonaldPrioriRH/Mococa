#Include 'Protheus.ch'
#INCLUDE "topconn.ch"

/* UTILIZA?O
//Consulta Especifica (F3)
Em Express?: Colocar .T.
Em Retorno: U_ROMSE013(M->MeuCampo)
*/  
User Function ROMSE013(_cContent)

	Local _cTitulo, oGet1, oGet2, oGet3, oSay1, oSay2, oButton1, oButton2, oButton3
	Local nX
	Local aHeaderEx := {}
	Local aCampos := {"C5_XIDTRI", "C5_FILIAL", "DAK_COD", "C5_NUM"}
	Local aAlterFields := {}
	Local aDados := {}
	Local cQry  := ""
	
	Default _cContent := &(ReadVar()) //Space(len(TamSX3("C5_XIDTRI")[1]))
	
	Private oNewGetX5
	Private nOpcx := 0
	Private cGet1 := space(TamSX3("C5_XIDTRI")[1])
	Private cGet2 := space(TamSX3("DAK_COD")[1]+TamSX3("DAK_SEQCAR")[1])
	Private cGet3 := space(TamSX3("C5_NUM")[1])
	Private oDlgX5
	
	_cTitulo := "Consultar - Id Triangulação "
	
	//fazer select
	cQry += " SELECT DAK_FILIAL FIL, DAK_XIDTRI IDTRI, '' PED, DAK_COD || DAK_SEQCAR CARGA "
	cQry += " FROM DAK010 "
	cQry += " WHERE D_E_L_E_T_ <> '*' "
	cQry += " AND DAK_XIDTRI <> '' "
	
	cQry += " UNION "
	
	cQry += " SELECT C5_FILIAL FIL, C5_XIDTRI IDTRI, C5_NUM PED, '' CARGA "
	cQry += " FROM SC5010 "
	cQry += " WHERE D_E_L_E_T_ <> '*' "
	cQry += " AND C5_XIDTRI <> '' "
	cQry += " AND C5_XFILEST <> '' "
	cQry += " AND C5_XIDTRI NOT IN( "
	cQry += " 	SELECT DISTINCT DAK_XIDTRI "
	cQry += " 	FROM DAK010 "
	cQry += " 	WHERE D_E_L_E_T_ <> '*' "
	cQry += " 	AND DAK_XIDTRI <> '' "
	cQry += " ) "
	
	cQry += " ORDER BY IDTRI "
	
	If Select("QAUX") > 0
		QAUX->(dbCloseArea())
	EndIf
	
	cQry := ChangeQuery(cQry)
	dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUX", .F., .T.)
	
	while QAUX->(!Eof())
				
			aAdd(aDados,{QAUX->IDTRI, QAUX->FIL, QAUX->CARGA, QAUX->PED ,  .F.})		
	
		QAUX->(DbSkip())
	enddo
	
	DEFINE MSDIALOG oDlgX5 TITLE _cTitulo FROM 000, 000  TO 400, 500 COLORS 0, 16777215 PIXEL
    
	@ 007, 006 SAY oSay1 PROMPT "Id Triang" SIZE 025, 007 OF oDlgX5 COLORS 0, 16777215 PIXEL
	@ 007, 086 SAY oSay2 PROMPT "Carga" SIZE 025, 007 OF oDlgX5 COLORS 0, 16777215 PIXEL
	@ 007, 146 SAY oSay2 PROMPT "Pedido" SIZE 025, 007 OF oDlgX5 COLORS 0, 16777215 PIXEL
	@ 016, 006 MSGET oGet1 VAR cGet1 SIZE 075, 010 OF oDlgX5 COLORS 0, 16777215 PIXEL VALID (.T., cGet1:=PADL(cGet1,9,"0"))
	@ 016, 086 MSGET oGet2 VAR cGet2 SIZE 55, 010 OF oDlgX5 COLORS 0, 16777215 PIXEL
	@ 016, 146 MSGET oGet3 VAR cGet3 SIZE 55, 010 OF oDlgX5 COLORS 0, 16777215 PIXEL
	@ 016, 206 BUTTON oButton1 PROMPT "Buscar" SIZE 037, 012 OF oDlgX5 ACTION (X5Filtrar()) PIXEL
    
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	For nX := 1 to Len(aCampos)
		If SX3->(DbSeek(aCampos[nX]))
			if aCampos[nX] == "C5_NUM"
				cTitulo := "Pedido"
			else
				cTitulo := AllTrim(X3Titulo())
			endif
			Aadd(aHeaderEx, {cTitulo,SX3->X3_CAMPO,SX3->X3_PICTURE,SX3->X3_TAMANHO,SX3->X3_DECIMAL,SX3->X3_VALID,;
				SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,""/*SX3->X3_RELACAO*/})
		Endif
	Next nX
    
	oNewGetX5 := MsNewGetDados():New(033, 006, 174, 246,, "AllwaysTrue", "AllwaysTrue", "+Field1+Field2", aAlterFields,, 999, "AllwaysTrue", "", "AllwaysTrue", oDlgX5, aHeaderEx, aDados)
	oNewGetX5:oBrowse:bLDblClick := {|| (nOpcx := 1,oDlgX5:End()) }
    
	@ 180, 006 BUTTON oButton2 PROMPT "Confirmar" SIZE 037, 012 OF oDlgX5 ACTION (nOpcx := 1,oDlgX5:End()) PIXEL
	@ 180, 049 BUTTON oButton3 PROMPT "Cancelar" SIZE 037, 012 OF oDlgX5 ACTION (nOpcx := 0,oDlgX5:End()) PIXEL

	ACTIVATE MSDIALOG oDlgX5 CENTERED

	if nOpcx == 1
		cX5RETCP := oNewGetX5:aCols[oNewGetX5:nAt][1]
	else
		cX5RETCP := _cContent
	endif

Return cX5RETCP

Static Function X5Filtrar()
	
	Local nX := 1
	
	for nX := 1 to len(oNewGetX5:aCols)
		if (!empty(oNewGetX5:aCols[nX][1]) .AND. UPPER(alltrim(cGet1)) $ UPPER(oNewGetX5:aCols[nX][1])) .OR. ;
				(!empty(oNewGetX5:aCols[nX][3]) .AND. UPPER(alltrim(cGet2)) $ UPPER(oNewGetX5:aCols[nX][3]) ) .OR. ;
				(!empty(oNewGetX5:aCols[nX][4]) .AND. UPPER(alltrim(cGet3)) $ UPPER(oNewGetX5:aCols[nX][4]) )
			EXIT
		endif
	next nX
	
	if nX > len(oNewGetX5:aCols)
		oNewGetX5:GoTop()
	else
		oNewGetX5:GoTo(nX)
	endif
	
Return
