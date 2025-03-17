#Include 'Protheus.ch'

/*/{Protheus.doc} MA103BUT

Ponto de entrada Inclusão de opções na EnchoiceBar, Documento Entrada

@author Danilo Brito
@since 20/03/2017
@version P12
@param Nao recebe parametros
@return xRet
/*/
User Function MA103BUT()
	
	Local aButtons := {}

	 // Ponto de chamada ConexãoNF-e
	 aButtons := U_GTPE014()
	
	 If !INCLUI .AND. !ALTERA
		//aadd(aButtons, {"Vincula Comissao",{|| U_RFINE004(3) },"Vincula Comissao"})
		aadd(aButtons, {"Vincula Comissao",{|| U_RFINE006(3) },"Vincula Comissao"})
	 EndIf
	 	
Return aButtons