#include 'protheus.ch'
#include 'parmtype.ch'

/*
user function SFCA100()
	Local aParam 		:= PARAMIXB
	Local oObj			:= aParam[1]
	Local cIdPonto		:= aParam[2]
	Local c_Qry := ""
	Local l_Ret := .T.

	If cIdPonto == 'MODELPOS' .And. IsInCallStack("SFCA100FIM")
		c_Qry := "SELECT COUNT(1) AS QTD "
		c_Qry += "FROM Z0E010 "
		c_Qry += "WHERE D_E_L_E_T_ = ' ' "
		c_Qry += "AND Z0E_FILIAL = '"+ xFilial("Z0E") +"' " 
		c_Qry += "AND Z0E_OPP = '"+ CYQ->CYQ_NRORPO +"' "
		c_Qry += "AND Z0E_STATUS <> 0 "
		c_Qry += "AND Z0E_ESTORN <> 'S'"
		
		PlSQuery(c_Qry,"_Q01")
		
		If _Q01->QTD > 0
			Aviso("Atenção!!!","Essa OP não pode ser encerrada, pois existem Etiquetas para serem apontadas via JOB",{"Ok"})
			l_Ret := .F.
		Endif
		
		_Q01->(DbCloseArea())
		
	Endif

return l_Ret
*/