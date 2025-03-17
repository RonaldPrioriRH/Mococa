#INCLUDE "PROTHEUS.CH"
#INCLUDE "topconn.ch"

User function M530OK()

	Local aArea:= GetArea()
	Local aAreaSE3 := SE3->(GetArea())
	Local lRet := .F.
	Local cQry := " "
	
	Private cEol    := chr(13)+chr(10)

	dbSelectArea("SE3")
	dbSetOrder(3)
	
	//cQry := " SELECT COUNT(E3_XNFCOMI) AS NOTA, E3_FILIAL, E3_VEND, E3_NUM FROM " + RetSqlName("SE3") + "			" +cEOL
	cQry := " SELECT COUNT(E3_XNFCOMI) AS NOTA FROM " + RetSqlName("SE3") + "			" +cEOL
	cQry += " LEFT JOIN SA3010 ON SA3010.D_E_L_E_T_= ' ' 	" +cEOL
	cQry += " AND A3_COD = E3_VEND 	" +cEOL
	cQry += " WHERE  SE3010.D_E_L_E_T_  = ' '  					" +cEOL
	cQry += " AND E3_EMISSAO BETWEEN '" + DTOS(MV_PAR02) +"' AND '"+ DTOS(MV_PAR03) +"' 	" +cEOL
	cQry += " AND E3_VEND BETWEEN '" + MV_PAR04 +"' AND '"+ MV_PAR05 +"' 	" +cEOL
	cQry += " AND E3_VENCTO BETWEEN '" + DTOS(MV_PAR10) +"' AND '"+ DTOS(MV_PAR11) +"' 	" +cEOL
	cQry += " AND E3_FILIAL BETWEEN '" + MV_PAR14 +"' AND '"+ MV_PAR15 +"' 	" +cEOL    
	cQry += " AND E3_XNFCOMI = ' ' 	" +cEOL
	cQry += " AND A3_MSBLQL <> '1' 	" +cEOL   //Apenas Vendedores Ativos, desconsiderar os demais       
	cQry += " AND E3_DATA = ' ' 	" +cEOL  // Compilar essa alteração
	cQry += " AND E3_TIPO <> 'NCC' 	" +cEOL
	
	//cQry += " GROUP BY E3_XNFCOMI, E3_FILIAL, E3_VEND, E3_NUM 	" +cEOL  
	
	
	MemoWrite("C:\temp\SE3_M530OK_v2.sql",cQry)

	If Select("TMPSE3") > 0
		TMPSE3->(dbCloseArea())
	EndIf
	cQry := ChangeQuery(cQry)
	TcQuery cQry New Alias "TMPSE3"

			IF TMPSE3->NOTA == 0 
				lRet := .T.
			Else
				MsgAlert("Existem Titulos que não possuem Nota amarrada ")
				//MsgAlert("Existem Titulos que não possuem Nota amarrada, Filial: " + TMPSE3->E3_FILIAL + " Vendedor: " + TMPSE3->E3_VEND + " Número :"  + TMPSE3->E3_NUM + ")
			EndIf	
		
		TMPSE3->(dbCloseArea())
	restarea(aAreaSE3)
	restarea(aArea)
	
return lRet