#Include 'Protheus.ch'

/*/{Protheus.doc} OM200OK

Ponto de entrada antes da gera��o da carga, permitindo o usu�rio interfirir na gera��o ou n�o da carga.

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function OM200OK()
	
	Local lRet := .T.
	Local aArrayMan := PARAMIXB[1]
	Local aArrayCarga := PARAMIXB[2] 
	Local nPosCarga := PARAMIXB[3]
	Local n_Reg := 0
	
	lRet := U_ROMSE009(aArrayMan, aArrayCarga, nPosCarga)
	
	If lRet .and. c_x_Carga <> ' '
		c_Qry := "SELECT C5_NUM, A.R_E_C_N_O_ AS REC, C9_CARGA " 
		c_Qry += "FROM SC5010 A, " 
		c_Qry += "SC6010 B INNER JOIN SC9010 ON SC9010.D_E_L_E_T_ = ' ' " 
		c_Qry += "AND C9_FILIAL = '"+ xFilial("SC9") +"' 
		c_Qry += "AND C9_PEDIDO = C6_NUM  " 
		c_Qry += "AND C9_ITEM = C6_ITEM  " 
		c_Qry += "AND C9_PRODUTO = C6_PRODUTO  " 
		c_Qry += "WHERE A.D_E_L_E_T_ = ' ' AND B.D_E_L_E_T_ = ' ' "
		c_Qry += "AND C5_FILIAL = '"+ xFilial('SC5') +"' "
		c_Qry += "AND C6_FILIAL = '"+ xFilial('SC6') +"' "
		c_Qry += "AND C5_NUM = C6_NUM "
		c_Qry += "AND C5_XCARGA = '"+ c_x_Carga +"' "
		c_Qry += "GROUP BY C5_NUM, A.R_E_C_N_O_, C9_CARGA "
		c_Qry += "ORDER BY C5_NUM  "
		MemoWrite("c:\temp\OM200OK.sql",c_Qry)
		PlSQuery(c_Qry, "_C5PD")
		
		Count to n_Reg
		
		If n_Reg <> Len(aArrayMan)
			MsgInfo("Por favor, selecione os " + StrZero(n_Reg,3) + " pedidos", "Aten��o")
			lRet := .F.
		Endif
		_C5PD->(DbCloseArea())
	EndIf
		
Return lRet

