#include "protheus.ch" 
#include "topconn.ch" 

/*/{Protheus.doc} RFATE038
Exclusão da Devolução de Saída- PE MS520VLD - Contratos
@author TOTVS
@since 02/06/2017
@version P12
@param nulo           
@return nulo
/*/

/***********************/
User Function RFATE038()
/***********************/

Local lRet 	:= .T.
Local cQry	:= ""

SD2->(DbSetOrder(3)) //D2_FILIAL+D2_DOC+D2_SERIE+D2_CLIENTE+D2_LOJA+D2_COD+D2_ITEM

If SD2->(DbSeek(xFilial("SD2")+SF2->F2_DOC+SF2->F2_SERIE+SF2->F2_CLIENTE+SF2->F2_LOJA))
	
	While SD2->(!EOF()) .And.;
	 SD2->D2_FILIAL+SD2->D2_DOC+SD2->D2_SERIE+SD2->D2_CLIENTE+SD2->D2_LOJA == xFilial("SF2")+SF2->F2_DOC+SF2->F2_SERIE+SF2->F2_CLIENTE+SF2->F2_LOJA

		If Select("QRYAPUR") > 0
			QRYAPUR->(DbCloseArea())
		Endif
		
		cQry := " SELECT Z14.Z14_CODIGO"
		cQry += " FROM "+RetSqlName("Z13")+" Z13, "+RetSqlName("Z14")+" Z14"
		cQry += " WHERE Z13.D_E_L_E_T_	<> '*'"
		cQry += " AND Z14.D_E_L_E_T_	<> '*'"
		cQry += " AND Z13.Z13_FILIAL	= '"+xFilial("Z13")+"'"
		cQry += " AND Z14.Z14_FILIAL	= '"+xFilial("Z14")+"'"
		cQry += " AND Z13.Z13_CODIGO	= Z14.Z14_CODIGO"
		cQry += " AND Z13.Z13_PEDIDO	= '"+SD2->D2_PEDIDO+"'"
		cQry += " AND Z13.Z13_ITEMPV	= '"+SD2->D2_ITEMPV+"'"
		cQry += " AND Z14.Z14_APLICA	= 'A'" //Tipo aplicação igual a apuração
		cQry += " AND Z14.Z14_APURAD	= 'S'" //Apurado

		cQry := ChangeQuery(cQry)
		TcQuery cQry NEW Alias "QRYAPUR"	
				
		If QRYAPUR->(!EOF())
			MsgInfo("Não é possível realizar a exclusão, pois há Apuração de Contrato <"+QRYAPUR->Z14_CODIGO+"> relacionada. Caso seja necessário a exclusão do documento, favor estornar tal Apuração.","Atenção")
			lRet := .F.
			Exit
		Endif
	
		SD2->(DbSkip())
	EndDo
Endif

If Select("QRYAPUR") > 0
	QRYAPUR->(DbCloseArea())
Endif

Return lRet