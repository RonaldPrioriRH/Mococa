#include "protheus.ch" 
#include "topconn.ch" 

/*/{Protheus.doc} RCOME006
Exclusão da Devolução de Venda - PE A100DEL - Contratos
@author TOTVS
@since 02/06/2017
@version P12
@param nulo           
@return nulo
/*/

/***********************/
User Function RCOME006()
/***********************/

Local lRet	:= .T.
Local cQry	:= ""

SD1->(DbSetOrder(1)) //D1_FILIAL+D1_DOC+D1_SERIE+D1_FORNECE+D1_LOJA+D1_COD+D1_ITEM

If SD1->(DbSeek(xFilial("SD1")+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA))
	
	While SD1->(!EOF()) .And.;
	 SD1->D1_FILIAL+SD1->D1_DOC+SD1->D1_SERIE+SD1->D1_FORNECE+SD1->D1_LOJA == xFilial("SF1")+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA

		If Select("QRYAPUR") > 0
			QRYAPUR->(DbCloseArea())
		Endif
		
		cQry := "SELECT Z22_CODIGO"
		cQry += " FROM "+RetSqlName("Z22")+""
		cQry += " WHERE D_E_L_E_T_	<> '*'"
		cQry += " AND Z22_FILIAL 	= '"+xFilial("Z22")+"'"
		cQry += " AND Z22_CODMOV	= '"+SD1->D1_XIDMOVI+"'"
		
		cQry := ChangeQuery(cQry)
		TcQuery cQry NEW Alias "QRYAPUR"	
				
		If QRYAPUR->(!EOF())
			MsgInfo("Não é possível realizar a exclusão, pois há Apuração de Contrato <"+QRYAPUR->Z22_CODIGO+"> relacionada. Caso seja necessário a exclusão do documento, favor estornar tal Apuração.","Atenção")
			lRet := .F.
			Exit
		Endif
	
		SD1->(DbSkip())
	EndDo
Endif

If Select("QRYAPUR") > 0
	QRYAPUR->(DbCloseArea())
Endif

Return lRet