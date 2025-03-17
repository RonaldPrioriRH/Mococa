#Include 'Protheus.ch'
#INCLUDE "topconn.ch"

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ M460MARK     ¦ Autor ¦ TOTVS		      ¦ Data ¦ 02/10/2013 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Ponto de entrada validação antes de preparar doc. de saída ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ Mococa		                                          	  ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
User Function RFATE030()

	Local aParam := PARAMIXB
	Local cMarca := aParam[1]
	Local lInverte := aParam[2]
	Local aArea := GetArea()
	Local aAreaSC5 := SC5->(GetArea())
	Local aAreaSC6 := SC6->(GetArea())
	Local aAreaSC9 := SC9->(GetArea())
	Local aAreaDAK := DAK->(GetArea())
	Local aFiltro := Eval(bFiltraBrw,1)
	Local cFilSC9 := aFiltro[2]
	Local cFilDAK := aFiltro[4]
	Local lRet := .T.
	Local cQry := ""
	Local aChvProc := {}
	
	//Faturamento por Pedido
	if FUNNAME() == "MATA460A"
	
		cQry := " SELECT SC9.R_E_C_N_O_ RECSC9 "
		cQry += " FROM " + RetSqlName("SC9") + " SC9 "
		cQry += " WHERE SC9.D_E_L_E_T_ <> '*' "
		if !empty(cFilSC9) 
			cQry += " AND " + cFilSC9
		endif
		If lInverte
			cQry += " AND C9_OK <> '"+cMarca+"' "
		Else
			cQry += " AND C9_OK = '"+cMarca+"' "
		EndIf
		cQry += " AND C9_NFISCAL = ' ' "
		cQry += " AND C9_BLEST = ' ' AND C9_BLCRED = ' ' "
	
		If Select("QAUX") > 0
			QAUX->(dbCloseArea())
		EndIf
		
		cQry := ChangeQuery(cQry)
		dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUX", .F., .T.)
		
		While QAUX->(!Eof())
			
			SC9->(DbGoTo(QAUX->RECSC9))
			if aScan(aChvProc, SC9->C9_PEDIDO) == 0
				
				DbSelectarea("SC5")
				DbSetorder(1) //FILIAL + NUM + ITEM + PRODUTO
				DbSeek(SC9->C9_FILIAL + SC9->C9_PEDIDO )
				
				//CHAMA PONTO DE ENTRADA DO PEDIDO
				lRet := U_M410PVNF()
				
				IF !lRet
					Exit
				Endif
				
				aadd(aChvProc, SC9->C9_PEDIDO) 
			endif
			
			QAUX->(DbSkip())
		Enddo
		
		QAUX->(dbCloseArea())
	
	//Faturamento por Carga
	elseif FUNNAME() == "MATA460B"
	
		cQry := " SELECT DAK.R_E_C_N_O_ RECDAK "
		cQry += " FROM " + RetSqlName("SC9") + " SC9, " + RetSqlName("DAK") + " DAK "
		cQry += " WHERE SC9.D_E_L_E_T_ <> '*' AND SC9.C9_FILIAL = '"+xFilial("SC9")+"'
		if !empty(cFilDAK) 
			cQry += " AND " + cFilDAK
		endif
		If lInverte
			cQry += " AND DAK_OK <> '"+cMarca+"' "
		Else
			cQry += " AND DAK_OK = '"+cMarca+"' "
		EndIf
		cQry += " AND DAK_FEZNF <> '1' "
	
		If Select("QAUX") > 0
			QAUX->(dbCloseArea())
		EndIf
		
		cQry := ChangeQuery(cQry)
		dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUX", .F., .T.)
		
		While QAUX->(!Eof())
		
			DAK->(DbGoTo( QAUX->RECDAK ))
			if aScan(aChvProc, DAK->DAK_COD) == 0
				if !empty(DAK->DAK_XIDTRI)
					
					SF1->(dbOrderNickName("IDTRIANG"))
					if SF1->(DbSeek(DAK->DAK_XIDTRI))
						if SF1->F1_TIPO <> "N"
							xmaghelpfis("Atenção","Carga "+DAK->DAK_COD+" está em processo de Fat.Triangular! Nota de Entrada dos itens não classificada! Id. Triang.: "+DAK->DAK_XIDTRI,"Classifique a nota para dar entrada no saldo dos itens.")
							lRet := .F.
							EXIT
						endif
					else
						xmaghelpfis("Atenção","Carga "+DAK->DAK_COD+" está em processo de Fat.Triangular! Nota de Entrada dos itens não localizada! Id. Triang.: "+DAK->DAK_XIDTRI,"Faça o faturamento do pedido de transferência primeiro atraves da rotina: Atualizações - Específicos - Faturamento Triangular - NF Transferência")
						lRet := .F.
						EXIT
					endif
					 
				endif
				
				aadd(aChvProc, DAK->DAK_COD)
			endif
			
			QAUX->(DbSkip())
		Enddo
		
		QAUX->(dbCloseArea())
	
	Endif
	
	RestArea(aAreaDAK)
	RestArea(aAreaSC9)
	RestArea(aAreaSC5)
	RestArea(aAreaSC6)
	RestArea(aArea)
	
Return lRet

