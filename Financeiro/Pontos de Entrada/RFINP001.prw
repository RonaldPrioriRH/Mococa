#Include 'Protheus.ch'

/*/{Protheus.doc} RFINP001

Pontos de Entrada do Cadastro de Regras de Comissão

@author Danilo Brito
@since 15/02/2017
@version P12
@param Nao recebe parametros
@return xRet
/*/

User Function RFINP001()

	Local aParam     := PARAMIXB
	Local oObj       := aParam[1]
	Local cIdPonto   := aParam[2]
	Local cIdModel   := IIf( oObj<> NIL, oObj:GetId(), aParam[3] ) //cIdModel   := aParam[3]
	Local cClasse    := IIf( oObj<> NIL, oObj:ClassName(), '' )
	Local nOperation := IIf( oObj<> NIL, oObj:GetOperation(), 0)
	Local oModelZ01	 := oObj:GetModel( 'Z01MASTER' )
	Local oModelZ02	 := oObj:GetModel( 'Z02DETAIL' )
	Local xRet       := .T.
	Local lIsGrid    := .F.
	Local nLinha     := 0
	Local nQtdLinhas := 0
	//Local cMsg       := ''
	//Local cOperad := ""

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
				if oModelZ01:GetValue('Z01MASTER','Z01_TIPO')=="1" //se vendedor interno
					if empty(oModelZ02:GetValue('Z02DETAIL','Z02_PVOL'))
						Help( ,, 'Help',, 'Informe o valor no campo % Peso Vol.', 1, 0 )
						xRet := .F. 
					endif
					if empty(oModelZ02:GetValue('Z02DETAIL','Z02_PMARG'))
						Help( ,, 'Help',, 'Informe o valor no campo % Peso Marg.', 1, 0 )
						xRet := .F. 
					endif
					if empty(oModelZ02:GetValue('Z02DETAIL','Z02_PFATUR'))
						Help( ,, 'Help',, 'Informe o valor no campo % Peso Fatu.', 1, 0 )
						xRet := .F. 
					endif
				elseif oModelZ01:GetValue('Z01MASTER','Z01_TIPO')=="2" //se vendedor externo
					if empty(oModelZ02:GetValue('Z02DETAIL','Z02_PCOM'))
						Help( ,, 'Help',, 'Informe o valor no campo % Comissão.', 1, 0 )
						xRet := .F. 
					endif
				endif
				//se produto e grupo for vazio, coloca na descrição o texto TOTAL
				if empty(oModelZ02:GetValue('Z02DETAIL','Z02_PROD')) .AND. empty(oModelZ02:GetValue('Z02DETAIL','Z02_GRUPO'))
					oModelZ02:SetValue('Z02DETAIL','Z02_DESCRI', "REGRA TOTAL REGIAO")
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
