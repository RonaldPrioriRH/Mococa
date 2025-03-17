#INCLUDE 'PROTHEUS.CH'
#INCLUDE "topconn.ch"

#Define CRLF chr(13)+chr(10)

/*/{Protheus.doc} ROMSA002

Função para Solicitação de Triangulação  

@author Danilo Brito
@since 02/03/2017
@version P12
@param nenhum
@return nulo
/*/

User Function ROMSA002(cPedido, cCarga, lAuto)

	Local oObj := FatTriang():New()
	Local cIdTriang := ""
	Local aPvImp := {}
	Local cBkpFil := cFilAnt
	Local nX
	Local cRet    := '3'
	Default lRoboCarga := .f.
	
	if oObj:AbreSolicitacao(cPedido, cCarga, lAuto)
		cIdTriang := oObj:GetIdTriang()
		If lRoboCarga
			lRet := u_libestoq(SC5->C5_FILIAL,SC5->C5_NUM) 
//			u_grvlogza5(nNrLog,cCarga,cLog,'2',cza5->za5_filial)
			If !lRet
				Return cRet
			Endif
			cRet := 'A'
		Else
			if MsgYesNo("Solcitação de transferência realizada com sucesso!"+CRLF+CRLF+;
						"Id Triangulação: "+cIdTriang+CRLF+CRLF+;
						"Deseja imprimir o Picklist agora?")
				
				aPvImp := oObj:GetRecnoPvFE()
				
				For nX := 1 to len(aPvImp)
					SC5->(DbGoTo(aPvImp[nX]))
					cFilAnt := oObj:cFilEst
										
					U_ROMSR001(SC5->C5_NUM) //do pedido gerado na FE
				next nX
				
			endif
		endif
		
	endif
	
	oObj:Destroy()
	cFilAnt := cBkpFil
	 
Return cRet




