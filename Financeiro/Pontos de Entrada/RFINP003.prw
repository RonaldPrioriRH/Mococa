#Include 'Protheus.ch'

/*/{Protheus.doc} RFINP003

Pontos de Entrada do Cadastro de Metas de Comiss�o

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
	
		ElseIf cIdPonto == 'FORMLINEPRE' //Antes da altera��o da linha do formul�rio GRID. (requer retorno l�gico)
		
		ElseIf cIdPonto == 'FORMPRE' //Antes da altera��o de qualquer campo do formul�rio. (requer retorno l�gico)
	
		ElseIf cIdPonto == 'FORMPOS' //Na valida��o total do formul�rio (requer retorno l�gico)

		ElseIf cIdPonto == 'FORMLINEPOS' //Na valida��o total da linha do formul�rio GRID. (requer retorno l�gico)
			
			if lIsGrid
				
				oModelDet  := oObj:GetModel( cIdModel )
				
				//se produto e grupo for vazio, coloca na descri��o o texto TOTAL
				if empty(oModelDet:GetValue(cIdModel,'Z05_PROD')) .AND. empty(oModelDet:GetValue(cIdModel,'Z05_GRUPO'))
					oModelDet:SetValue(cIdModel,'Z05_DESCRI', "META TOTAL REGIAO")
				endif
				
			endif
			
		ElseIf cIdPonto == 'MODELPRE' //Antes da altera��o de qualquer campo do modelo. (requer retorno l�gico)
	
		ElseIf cIdPonto == 'MODELPOS' //Na valida��o total do modelo (requer retorno l�gico)
		
		ElseIf cIdPonto == 'FORMCOMMITTTSPRE' //Antes da grava��o da tabela do formul�rio
		
		ElseIf cIdPonto == 'FORMCOMMITTTSPOS' //Apos a grava��o da tabela do formul�rio
 	
		ElseIf cIdPonto == 'MODELCOMMITTTS' //Apos a grava��o total do modelo e dentro da transa��o
 	
		ElseIf cIdPonto == 'MODELCOMMITNTTS' //Apos a grava��o total do modelo e fora da transa��o

		ElseIf cIdPonto == 'MODELCANCEL' //No cancelamento do bot�o.

		EndIf
 	 
	EndIf

Return xRet
