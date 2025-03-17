#INCLUDE 'PROTHEUS.CH'
#INCLUDE "topconn.ch"

/*/{Protheus.doc} CALCCOMISSAO

Execblock para gatilhar percentual de comissão, quando vendedor PJ  

@author Danilo Brito
@since 02/03/2017
@version P12
@param cVendedor
@return nulo
/*/

User Function RFINE001(cVendedor,cClient,cEst)

	Local oObj := CALCCOMISSAO():New(cVendedor, .F.)
	Local nRet := 0	
	
	//nRet := oObj:GetPercPJ(M->C6_PRODUTO," ", M->C5_CLIENTE, Posicione("SA1",1,xFilial("SA1")+M->(C5_CLIENTE+C5_LOJACLI),"A1_EST") )
	
		Conout(">> RFINE001 CLASS CALCCOMISSAO - CLIENTE: " + M->C5_CLIENTE)	
		Conout(">> RFINE001 CLASS CALCCOMISSAO - ESTADO: " + cEst)
		
	nRet := oObj:GetPercPJ(M->C6_PRODUTO," ", M->C5_CLIENTE, cEst)

	oObj:Destroy()
	
Return nRet