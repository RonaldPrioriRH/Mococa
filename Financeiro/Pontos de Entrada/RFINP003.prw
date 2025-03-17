#Include 'Protheus.ch'

/*/{Protheus.doc} RFINP003

Pontos de Entrada do Cadastro de Metas de Comissão

@author Danilo Brito
@since 15/02/2017
@version P12
@param Nao recebe parametros
@return xRet
/*/

User Function RFINP003()

	Local aParam     := PARAMIXB
	Local oObj       := aParam[1]
	Local cIdPonto   := aParam[2]
	Local cIdModel   := IIf( oObj<> NIL, oObj:GetId(), aParam[3] ) //cIdModel   := aParam[3]
	Local cClasse    := IIf( oObj<> NIL, oObj:ClassName(), '' )
	Local nOperation := IIf( oObj<> NIL, oObj:GetOperation(), 0)
	//Local oModelZ04	 := oObj:GetModel( 'Z04MASTER' )
	Local oModelDet  := Nil
	Local xRet       := .T.
	Local lIsGrid    := .F.
	Local nLinha     := 0
	Local nQtdLinhas := 0
	//Local cMsg       := ' '
	//Local cOperad := " "

	If aParam <> NIL
	
		oObj       := aParam[1]
		cIdPonto   := aParam[2]
		cIdModel   := IIf( oObj<> NIL, oObj:GetId(), aParam[3] ) //cIdModel   := aParam[3]
		cClasse    := IIf( oObj<> NIL, oObj:ClassName(), '' )
		nOperation := IIf( oObj<> NIL, oObj:GetOperation(), 0)
	
		lIsGrid    := ( Len( aParam ) > 3 ) .and. cClasse == 'FWFORMGRID'

		If lIsGrid
			nQtdLinhas := oObj:GetQtdLine()
			nLinha     := oObj:nLine
		EndIf
	
		If cIdPonto == 'MODELVLDACTIVE' //Para validar se deve ou nao ativar o Model
	
		ElseIf cIdPonto == 'BUTTONBAR' //Para acrescentar botoes a ControlBar
	
		ElseIf cIdPonto == 'FORMLINEPRE' //Antes da alteração da linha do formulário GRID. (requer retorno lógico)
		
		ElseIf cIdPonto == 'FORMPRE' //Antes da alteração de qualquer campo do formulário. (requer retorno lógico)
	
		ElseIf cIdPonto == 'FORMPOS' //Na validação total do formulário (requer retorno lógico)

		ElseIf cIdPonto == 'FORMLINEPOS' //Na validação total da linha do formulário GRID. (requer retorno lógico)
			
			if lIsGrid
				
				oModelDet  := oObj:GetModel( cIdModel )
				
				//se produto e grupo for vazio, coloca na descrição o texto TOTAL
				if empty(oModelDet:GetValue(cIdModel,'Z05_PROD')) .AND. empty(oModelDet:GetValue(cIdModel,'Z05_GRUPO'))
					oModelDet:SetValue(cIdModel,'Z05_DESCRI', "META TOTAL REGIAO")
				endif
				
			endif
			
		ElseIf cIdPonto == 'MODELPRE' //Antes da alteração de qualquer campo do modelo. (requer retorno lógico)
	
		ElseIf cIdPonto == 'MODELPOS' //Na validação total do modelo (requer retorno lógico)
		
		ElseIf cIdPonto == 'FORMCOMMITTTSPRE' //Antes da gravação da tabela do formulário
		
		ElseIf cIdPonto == 'FORMCOMMITTTSPOS' //Apos a gravação da tabela do formulário
 	
		ElseIf cIdPonto == 'MODELCOMMITTTS' //Apos a gravação total do modelo e dentro da transação
 	
		ElseIf cIdPonto == 'MODELCOMMITNTTS' //Apos a gravação total do modelo e fora da transação

		ElseIf cIdPonto == 'MODELCANCEL' //No cancelamento do botão.

		EndIf
 	 
	EndIf

Return xRet
