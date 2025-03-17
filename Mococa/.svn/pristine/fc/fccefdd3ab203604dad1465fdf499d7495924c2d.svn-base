#include 'protheus.ch'
#include 'parmtype.ch'

User Function OM200ORD()
	Local aRet := PARAMIXB
	//-- Especifico conforme necessidade, por exemplo:
	//-- posicao 1 = Colunas/Campos:
	// 3. Rota (PED_ROTA)
	// 5. Pedido (PED_PEDIDO)
	//-- posicao 2 = indices disponiveis na tabela temporaria de Pedidos de Vendas liberados.
	// 3. PED_ROTA+PED_SEQROT+PED_FILORI+PED_PEDIDO
	// 1. PED_FILORI+PED_PEDIDO+PED_ITEM+PED_SEQLIB+PED_CODCLI+PED_LOJA
	//aRet := {{3,1},{2,7}}
	
	
	//aRet := {{3,9},{2,7}}
	aRet := {{3,n_X_Ind},{2,7}} // correto
	//aRet := {{5,n_X_Ind},{4,7}}
	//aRet := {{3,3},{5,1},{8,7},{16,8},{17,8}}
	
	/*
	If mv_par06 == 2
		aHeadOrd := {{3,3},{5,1},{8,5}}
	Else
		aHeadOrd := {{3,3},{5,1}}
	EndIf
	*/
	
Return aRet