#Include 'Protheus.ch'

#DEFINE CRLF CHR(13)+CHR(10)

/*/{Protheus.doc} ROMSE009

Ponto de entrada antes da geração da carga, permitindo o usuário interfirir na geração ou não da carga. OM200OK

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function ROMSE009(aArrayMan, aArrayCarga, nPosCarga)
	
	Local aArea := GetArea()
	Local aAreaSC5 := SC5->(GetArea())
	Local lRet := .T.
	Local cCarga := aArrayCarga[nPosCarga,2]
	Local cFilEst 
	Local cFilInt 
	Local nX
	
	SC5->(DbSetOrder(1))
	For nX := 1 to len(aArrayMan)
		SC5->(DbSeek(aArrayMan[nX][12] + aArrayMan[nX][5] )) //FILIAL + PEDIDO
		
		if cFilEst <> Nil .AND. (cFilEst <> SC5->C5_XFILEST .OR. cFilInt <> SC5->C5_XFILINT)
			MsgInfo("Não é permitido selecionar pedidos com retirada de estoque em filiais distintas."+CRLF+;
					"Verifique o campo Filial Estoque e Filial Intemediaria dos pedidos marcados!"+CRLF+CRLF+;
					"Carga: " + cCarga, "Atenção")
			lRet := .F. 
			EXIT
		endif
		
		cFilEst := SC5->C5_XFILEST
		cFilInt := SC5->C5_XFILINT
	next nX
	
	RestArea(aAreaSC5)
	RestArea(aArea)
	
Return lRet

