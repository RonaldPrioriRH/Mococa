#Include 'Protheus.ch'
#INCLUDE "topconn.ch"

#Define CRLF chr(13)+chr(10)

/*/{Protheus.doc} ROMSA003

Fun��o para rotina NF Transfer�ncia - Faturamento Triangular  

@author Danilo Brito
@since 02/03/2017
@version P12
@param nenhum
@return nulo
/*/
User Function ROMSA003(cIdTriang)
	Local oObj := FatTriang():New()
	Private cRetRobo := '3'
	
	oObj:NfTransferencia(cIdTriang)

	oObj:Destroy()

Return cRetRobo

