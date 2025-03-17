#Include 'Protheus.ch'
#Include 'FwMvcdef.ch'
#Include 'TopConn.ch'
#include "TbiConn.ch"

#Define CRLF chr(13)+chr(10)

/*/{Protheus.doc} RCOMA001
Rotina para apuracao de Entrada Leite Spot
@author Leandro Rodrigues
@since 18/05/2017
@version P12
@param nulo
@return nulo
/*/

User Function RCOMA001()


	Local oBrowse

	oBrowse := FWmBrowse():New()
	oBrowse:SetAlias( 'ZEL' )
	oBrowse:SetDescription( 'Apuracao Leite Spot' )

	oBrowse:Activate()

Return NIL

//-------------------------------------------------------------------
Static Function MenuDef()
	Local aRotina := {}

	ADD OPTION aRotina Title 'Visualizar' 			Action 'VIEWDEF.RCOMA001' OPERATION 2 ACCESS 0
	ADD OPTION aRotina Title 'Incluir'    			Action 'VIEWDEF.RCOMA001' OPERATION 3 ACCESS 0
	ADD OPTION aRotina Title 'Alterar'    			Action 'VIEWDEF.RCOMA001' OPERATION 4 ACCESS 0
	ADD OPTION aRotina Title 'Excluir'    			Action 'VIEWDEF.RCOMA001' OPERATION 5 ACCESS 0
	ADD OPTION aRotina Title 'Finaliza Apuracao'    Action 'U_RCOM01FM()' 	  OPERATION 6 ACCESS 0

Return aRotina

//-------------------------------------------------------------------
Static Function ModelDef()

	// Cria a estrutura a ser usada no Modelo de Dados
	Local oStruZEL  := FWFormStruct( 1, 'ZEL', /*bAvalCampo*/,/*lViewUsado*/ ) // Cabecalho Acerto
	Local oStruZEM  := FWFormStruct( 1, 'ZEM', /*bAvalCampo*/,/*lViewUsado*/ ) // Devolucoes Leite
	Local oStruZEN  := FWFormStruct( 1, 'ZEN', /*bAvalCampo*/,/*lViewUsado*/ ) // Complementar Leite
	Local oStruRdev := DefStrModel("ZEJ")
	Local oStruRCom := DefStrModel("ZEJ")

	Local oModel

	// Cria o objeto do Modelo de Dados
	oModel := MPFormModel():New('RCOMP001', /*bPreValidacao*/, /*bPosValidacao*/, /*bCommit*/, /*bCancel*/ )

	// Adiciona ao modelo uma estrutura de formul·rio de ediÁ?o por campo
	oModel:AddFields( 'ZELMASTER', /*cOwner*/, oStruZEL, /*bPreValidacao*/, /*bPosValidacao*/, /*bCarga*/ )

	// Adiciona ao modelo uma componente de grid
	oModel:AddGrid( 'ZEMDETAIL', 'ZELMASTER', oStruZEM  , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	oModel:AddGrid( 'ZENDETAIL', 'ZELMASTER', oStruZEN  , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	oModel:AddGrid( 'DEVDETAIL', 'ZELMASTER', oStruRdev , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	oModel:AddGrid( 'COMDETAIL', 'ZELMASTER', oStruRCom , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )


	// Faz relacionamento entre os componentes do model
	oModel:SetRelation( 'ZEMDETAIL', { {'ZEM_FILIAL' , 'xFilial( "ZEM" )'}, {'ZEM_CODIGO','ZEL_CODIGO'  }}, ZEM->( IndexKey(1)))
	oModel:SetRelation( 'ZENDETAIL', { {'ZEN_FILIAL' , 'xFilial( "ZEN" )'}, {'ZEN_CODIGO','ZEL_CODIGO'  }}, ZEN->( IndexKey(1)))


	// Adiciona a chave primaria da tabela principal
	oModel:SetPrimaryKey({ "ZEL_FILIAL" , "ZEL_CODIGO" })

	// Liga o controle de nao repeticao de linha
	//oModel:GetModel( 'ZEMDETAIL' ):SetUniqueLine( { 'ZEM_FILIAL','ZEM_CODIGO','ZEM_OCORR'} )
	//oModel:GetModel( 'ZENDETAIL' ):SetUniqueLine( { 'ZEN_FILIAL','ZEN_CODIGO','ZEN_OCORR'} )

	// Adiciona a descrição dos Componentes do Modelo de Dados
	oModel:GetModel( 'ZEMDETAIL' ):SetDescription( 'Devolução Leite' )
	oModel:GetModel( 'ZENDETAIL' ):SetDescription( 'Complementar Leite' )

	//oModel:GetModel( 'ZEMDETAIL' ):SetNoUpdateLine( .F. )
	oModel:GetModel( 'ZEMDETAIL' ):SetNoInsertLine( .T. )
	oModel:GetModel( 'ZENDETAIL' ):SetNoInsertLine( .T. )
	oModel:GetModel( 'DEVDETAIL' ):SetNoInsertLine( .T. )
	oModel:GetModel( 'DEVDETAIL' ):SetNoUpdateLine( .T. )
	oModel:GetModel( 'DEVDETAIL' ):SetNoDeleteLine( .T. )
	oModel:GetModel( 'COMDETAIL' ):SetNoInsertLine( .T. )
	oModel:GetModel( 'COMDETAIL' ):SetNoUpdateLine( .T. )
	oModel:GetModel( 'COMDETAIL' ):SetNoDeleteLine( .T. )


	//Permite gravar grid vazia
	oModel:GetModel('DEVDETAIL'):SetOptional(.T.)
	oModel:GetModel('COMDETAIL'):SetOptional(.T.)
	oModel:GetModel('ZEMDETAIL'):SetOptional(.T.)
	oModel:GetModel('ZENDETAIL'):SetOptional(.T.)

	oModel:GetModel('DEVDETAIL'):SetOnlyQuery()
	oModel:GetModel('COMDETAIL'):SetOnlyQuery()


Return oModel

//-------------------------------------------------------------------
Static Function ViewDef()

	// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
	Local oModel   := FWLoadModel( 'RCOMA001' )
	Local oView

	// Cria a estrutura a ser usada na View
	Local oStruZEL  := FWFormStruct( 2, 'ZEL' )
	Local oStruZEM  := FWFormStruct( 2, 'ZEM' )
	Local oStruZEN  := FWFormStruct( 2, 'ZEN' )
	Local oStruRdev := DefStrView("ZEJ")
	Local oStruRCom := DefStrView("ZEJ")

	// Cria o objeto de View
	oView := FWFormView():New()

	// Define qual o Modelo de dados ser· utilizado
	oView:SetModel( oModel )

	//Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
	oView:AddField( 'VIEW_ZEL', oStruZEL, 'ZELMASTER' )

	//Adiciona no nosso View um controle do tipo Grid (antiga Getdados)
	oView:AddGrid( 'VIEW_ZEM', oStruZEM,  'ZEMDETAIL' )
	oView:AddGrid( 'VIEW_ZEN', oStruZEN,  'ZENDETAIL' )
	oView:AddGrid( 'VIEW_DEV', oStruRdev, 'DEVDETAIL' )
	oView:AddGrid( 'VIEW_COM', oStruRCom, 'COMDETAIL' )

	// Cria um "box" horizontal para receber cada elemento da view
	oView:CreateHorizontalBox( 'SUPERIOR'	, 20 )
	oView:CreateHorizontalBox( 'INFERIOR'	, 80 )

	// Cria Folder na view
	oView:CreateFolder( 'PASTAS', 'INFERIOR')

	// Cria pastas na parte inferior da tela - Itens
	oView:AddSheet('PASTAS', 'ABA01', 'Devolucao')
	oView:AddSheet('PASTAS', 'ABA02', 'Complementar')

	oView:CreateHorizontalBox( 'CENTRALESQ', 060,,, 'PASTAS', 'ABA01')
	oView:CreateHorizontalBox( 'CENTRALDIR', 060,,, 'PASTAS', 'ABA02')
	oView:CreateHorizontalBox( 'BAIXOESQ'  , 040 ,,,'PASTAS', 'ABA01')
	oView:CreateHorizontalBox( 'BAIXODIR'  , 040 ,,,'PASTAS', 'ABA02')

	// Relaciona o identificador (ID) da View com o "box" para exibição
	oView:SetOwnerView( 'VIEW_ZEL'  , 'SUPERIOR'	 )
	oView:SetOwnerView( 'VIEW_ZEM'  , 'CENTRALESQ' 	 )
	oView:SetOwnerView( 'VIEW_ZEN'  , 'CENTRALDIR' 	 )
	oView:SetOwnerView( 'VIEW_DEV'  , 'BAIXOESQ' 	 )
	oView:SetOwnerView( 'VIEW_COM'  , 'BAIXODIR' 	 )

	// titulo dos componentes
	//oView:EnableTitleView('VIEW_ZEL' ,"Borderô"			)
	oView:EnableTitleView('VIEW_ZEM' ,"Itens Devolução")
	oView:EnableTitleView('VIEW_ZEN' ,"Itens Complemento"	)
	oView:EnableTitleView('VIEW_DEV' ,"Resumo Devoluções"	)
	oView:EnableTitleView('VIEW_COM' ,"Resumo Complementar"	)


	oView:AddOtherObject("OTHER_PANEL", {|oPanel| RFINABUT(oPanel,oView)})

	oView:SetCloseOnOk( { || .T. })  //Fecha a Tela ao confirmar

	// Habilito a barra de progresso na abertura da tela
	oView:SetProgressBar(.T.)

	oView:SetAfterViewActivate({|oView| ( U_Resumo() ) } )
	oView:AddUserButton('Legenda', "", {|oView| u_RCOMA01L( )} )
	oView:SetViewAction('DELETELINE' ,{|oView ,cIdView,nNumLine| AtuResumo(cIdView,.T.)} )


Return oView

/********************************/
Static Function DefStrModel(cAlias)
	/********************************/

	Local aArea    		:= GetArea()
	Local aAreaSX3 		:= SX2->(GetArea())
	Local aAreaSIX 		:= SX3->(GetArea())
	Local aAreaSX7 		:= SX7->(GetArea())
	Local aAreaSX2 		:= SIX->(GetArea())
	Local bValid   		:= { || }
	Local bWhen    		:= { || }
	Local bRelac   		:= { || }
	Local aAux     		:= {}
	Local aCampos		:= {}
	Local oStruct 		:= FWFormModelStruct():New()
	Local nX			:= 1

	//--------
	// Campos
	//--------
	aCampos	:= {"ZEJ_FORNEC","ZEJ_LOJA","ZEJ_NOME","ZEJ_PESONF","ZEJ_PESO","ZEJ_DIFERE"}
	//--------
	// Tabela
	//--------
	SX2->(DbSetOrder(1))
	SX2->(DbSeek(cAlias))

	oStruct:AddTable(SX2->X2_CHAVE,StrTokArr(SX2->X2_UNICO, '+') ,SX2->X2_NOME)

	//---------
	// Indices
	//---------
	SIX->(DbSetOrder(1))
	SIX->(DbSeek(cAlias))

	nOrdem := 0

	While SIX->(!EOF()) .AND. SIX->INDICE == cAlias
		oStruct:AddIndex(nOrdem++,SIX->ORDEM,SIX->CHAVE,SIXDescricao(),SIX->F3,SIX->NICKNAME ,(SIX->SHOWPESQ <> 'N'))
		SIX->(DbSkip())
	EndDo

	SX3->(DbSetOrder(2))
	For nX := 1 To Len(aCampos)

		If SX3->(DbSeek(aCampos[nX]))

			bValid 	:= FwBuildFeature(1,SX3->X3_VALID)
			bWhen  	:= FwBuildFeature(2,SX3->X3_WHEN)
			bRelac 	:= FwBuildFeature(3,SX3->X3_RELACAO)
			aBox	:= StrTokArr(AllTrim(X3CBox()),';')

			oStruct:AddField( 			;
			AllTrim(X3Titulo()), 		;	// [01] Titulo do campo
			AllTrim(X3Descric()), 		;	// [02] ToolTip do campo
			AllTrim(SX3->X3_CAMPO), 	;	// [03] Id do Field
			SX3->X3_TIPO, 				;	// [04] Tipo do campo
			SX3->X3_TAMANHO, 			;	// [05] Tamanho do campo
			SX3->X3_DECIMAL, 			;	// [06] Decimal do campo
			bValid, 					;	// [07] Code-block de valida?o do campo
			bWhen, 						;	// [08] Code-block de valida?o When do campo
			aBox, 						;	// [09] Lista de valores permitido do campo
			.F., 						;	// [10] Indica se o campo tem preenchimento obrigat?io
			bRelac, 					;	// [11] Code-block de inicializacao do campo
			NIL, 						;	// [12] Indica se trata-se de um campo chave
			NIL, 						;	// [13] Indica se o campo pode receber valor em uma opera?o de update.
			(SX3->X3_CONTEXT == 'V')) 		// [14] Indica se o campo ?virtual
		Endif
	Next nX

	//----------
	// Gatilhos
	//----------

	SX7->(DbSetOrder(1))
	For nX := 1 To Len(aCampos)

		If SX7->(DbSeek(aCampos[nX]))
			aAux :=	FwStruTrigger(SX7->X7_CAMPO,SX7->X7_CDOMIN,SX7->X7_REGRA,SX7->X7_SEEK == 'S',SX7->X7_ALIAS,SX7->X7_ORDEM,SX7->X7_CHAVE,SX7->X7_CONDIC,SX7->X7_SEQUENC)
			oStruct:AddTrigger(aAux[1],aAux[2],aAux[3],aAux[4])
		Endif
	Next nX

	RestArea(aAreaSX2)
	RestArea(aAreaSX3)
	RestArea(aAreaSX7)
	RestArea(aAreaSIX)
	RestArea(aArea)

Return oStruct


/*******************************/
Static Function DefStrView(cAlias)
	/*******************************/

	Local aArea     	:= GetArea()
	Local aAreaSX3  	:= SX3->( GetArea() )
	Local aAreaSXA  	:= SXA->( GetArea() )
	Local aCampos		:= {}
	Local oStruct   	:= FWFormViewStruct():New()
	Local aCombo    	:= {}
	Local nInitCBox 	:= 0
	Local nMaxLenCb 	:= 0
	Local aAux      	:= {}
	Local nI        	:= 1
	Local nX			:= 1
	Local cGSC      	:= ''

	//--------
	// Campos
	//--------
	aCampos	:= {"ZEJ_FORNEC","ZEJ_LOJA","ZEJ_NOME","ZEJ_PESONF","ZEJ_PESO","ZEJ_DIFERE"}

	SX3->(DbSetOrder(2))
	For nX := 1 To Len(aCampos)

		If SX3->(DbSeek(aCampos[nX]))

			aCombo := {}

			If !Empty(X3Cbox())

				nInitCBox := 0
				nMaxLenCb := 0

				aAux := RetSX3Box(X3Cbox(),@nInitCBox,@nMaxLenCb,SX3->X3_TAMANHO)

				For nI := 1 To Len(aAux)
					aAdd( aCombo, aAux[nI][1] )
				Next nI
			EndIf

			bPictVar := FwBuildFeature(4,SX3->X3_PICTVAR)
			cGSC     := IIf(Empty(X3Cbox()),IIf(SX3->X3_TIPO == 'L','CHECK','GET'),'COMBO')

			oStruct:AddField( 			;
			AllTrim(SX3->X3_CAMPO), 	;	// [01] Campo
			SX3->X3_ORDEM, 				;	// [02] Ordem
			AllTrim(X3Titulo()), 		;	// [03] Titulo
			AllTrim(X3Descric()), 		;	// [04] Descricao
			NIL, 						;	// [05] Help
			cGSC, 						;	// [06] Tipo do campo   COMBO, Get ou CHECK
			SX3->X3_PICTURE, 			;	// [07] Picture
			bPictVar, 					;	// [08] PictVar
			SX3->X3_F3, 				;	// [09] F3
			SX3->X3_VISUAL <> 'V', 		;	// [10] Editavel
			SX3->X3_FOLDER, 			;	// [11] Folder
			SX3->X3_FOLDER, 			;	// [12] Group
			aCombo,						;	// [13] Lista Combo
			nMaxLenCb, 					;	// [14] Tam Max Combo
			SX3->X3_INIBRW, 			;	// [15] Inic. Browse
			(SX3->X3_CONTEXT == 'V'))   	// [16] Virtual
		EndIf

		SX3->(DbSkip())
	Next nX

	//---------
	// Folders
	//---------
	SXA->(dbSetOrder(1))
	SXA->(dbSeek(cAlias))

	While !SXA->(EOF()) .AND. SXA->XA_ALIAS == cAlias
		oStruct:AddFolder(SXA->XA_ORDEM,SXA->XA_DESCRIC)
		SXA->(DbSkip())
	EndDo

	RestArea(aAreaSX3)
	RestArea(aAreaSXA)
	RestArea(aArea)

Return oStruct

//-------------------------------------------------------------------
Static Function RFINABUT( oPanel,oView )
	Local nRight := (oPanel:nWidth / 2) - 60
	@ 10, nRight Button 'Pesquisar'  Size 50, 15 Message 'Pesquisa Ocorrencias' WHEN INCLUI Pixel Action RCOM01GET(oView) of oPanel
Return NIL

//-------------------------------------------------------------------
// Busca ocorrencias do periodo informado
//-------------------------------------------------------------------
Static Function RCOM01GET(oView)

	Local cQuery 	:= ""
	//Local oView		:= FWViewActive()
	Local oModel  	:= FWModelActive()
	Local oModelZEM	:= oModel:GetModel('ZEMDETAIL')
	Local oModelZEN	:= oModel:GetModel('ZENDETAIL')
	Local oModelDEV	:= oModel:GetModel('DEVDETAIL')
	Local oModelCOM	:= oModel:GetModel('COMDETAIL')
	Local oModelZEL	:= oModel:GetModel('ZELMASTER')
	Local nLinha	:= 0
	Local cNum		:= ""



	cQuery := " SELECT 	"
	cQuery += "		ZEJ_CODIGO, "
	cQuery += "		ZEJ_NUM,	"
	cQuery += "		ZEJ_SERIE,	"
	cQuery += "		ZEJ_FORNEC,	"
	cQuery += "		ZEJ_LOJA,	"
	cQuery += "		ZEJ_PRODUT,	"
	cQuery += "		ZEJ_PESONF,	"
	cQuery += "		ZEJ_PESO,	"
	cQuery += "		ZEJ_DIFERE,	"
	cQuery += "		ZEJ_OPERAC,	"
	cQuery += "		A2_NOME		"
	cQuery += "	FROM " + RETSQLNAME("ZEJ") + " ZEJ"
	cQuery += "	INNER JOIN " + RETSQLNAME("SA2") + " A2"
	cQuery += " ON A2_FILIAL = '" + xFilial("SA2") + "'"
	cQuery += " 	AND A2_COD = ZEJ_FORNEC	"
	cQuery += " 	AND A2_LOJA= ZEJ_LOJA	"
	cQuery += " 	AND A2.D_E_L_E_T_<> '*'	"
	cQuery += "	WHERE ZEJ.D_E_L_E_T_<> '*'"
	cQuery += "		AND ZEJ_STATUS = 'A'"
	cQuery += "		AND ZEJ_FILIAL = '" + xFilial("ZEJ") + "'"
	cQuery += "		AND ZEJ_CODIGO NOT IN(SELECT ZEM_OCORR FROM " + RETSQLNAME("ZEM")+ " ZEM WHERE ZEM.D_E_L_E_T_<> '*' AND ZEM_FILIAL='" + xFilial("ZEM") + "')"
	cQuery += "		AND ZEJ_CODIGO NOT IN(SELECT ZEN_OCORR FROM " + RETSQLNAME("ZEN")+ " ZEN WHERE ZEN.D_E_L_E_T_<> '*' AND ZEN_FILIAL='" + xFilial("ZEN") + "')"
	cQuery += "		AND ZEJ_DATA BETWEEN '" + dTos(oModelZEL:GetValue("ZEL_DTINIC")) + "' AND '" + dTos(oModelZEL:GetValue("ZEL_DTFIM")) + "'"
	cQuery += "		AND (ZEJ_FORNEC||ZEJ_LOJA) BETWEEN '" + oModelZEL:GetValue("ZEL_FORNDE")+oModelZEL:GetValue("ZEL_LOJADE") + "' AND '" + oModelZEL:GetValue("ZEL_FORNAT")+oModelZEL:GetValue("ZEL_LOJAAT") + "'"

	cQuery += "	ORDER BY ZEJ_DATA, ZEJ_NUM,ZEJ_OPERAC"

	cQuery := ChangeQuery(cQuery)

	If Select("QZEJ") > 0
		QZEJ->(DbCloseArea())
	Endif


	TcQuery cQuery New Alias "QZEJ"


	//Desabilito inclusao de linhas temporariamente
	oModel:GetModel( 'ZEMDETAIL' ):SetNoInsertLine( .F. )
	oModel:GetModel( 'ZENDETAIL' ):SetNoInsertLine( .F. )

	//Valida se usuario clicou em pesquisar e grids ja estao preenchidas
	If !Empty( oModelZEM:GetValue("ZEM_NUM"))
		LimpaGrid(oModelZEM,.F.)
		LimpaGrid(oModelDEV,.T.)
	Endif

	If !Empty( oModelZEN:GetValue("ZEN_NUM"))
		LimpaGrid(oModelZEN,.F.)
		LimpaGrid(oModelCOM,.T.)
	Endif

	While QZEJ->(!EOF())

		//Verifico qual a operacao
		if QZEJ->ZEJ_OPERAC == '1' // Devolucoes
			nLinha		:= oModelZEM:Length()
			cNum		:= oModelZEM:GetValue("ZEM_NUM",nLinha)
		Else
			nLinha		:= oModelZEN:Length()
			cNum		:= oModelZEN:GetValue("ZEN_NUM",nLinha)
		Endif

		if nLinha == 1 .AND. Empty(cNum)
			lNewlinha := .F.
		Else
			lNewlinha := .T.
		Endif


		if QZEJ->ZEJ_OPERAC == '1'

			if lNewlinha
				oModelZEM:AddLine()
			Endif

			oModelZEM:LoadValue("ZEM_LEG"		,"BR_VERDE"			)
			oModelZEM:LoadValue("ZEM_OCORR"		,QZEJ->ZEJ_CODIGO 	)
			oModelZEM:LoadValue("ZEM_NUM"		,QZEJ->ZEJ_NUM		)
			oModelZEM:LoadValue("ZEM_SERIE"		,QZEJ->ZEJ_SERIE	)
			oModelZEM:LoadValue("ZEM_FORNEC"	,QZEJ->ZEJ_FORNEC	)
			oModelZEM:LoadValue("ZEM_LOJA"		,QZEJ->ZEJ_LOJA		)
			oModelZEM:LoadValue("ZEM_NOME"		,QZEJ->A2_NOME		)
			oModelZEM:LoadValue("ZEM_PESONF"	,QZEJ->ZEJ_PESONF	)
			oModelZEM:LoadValue("ZEM_PESORE"	,QZEJ->ZEJ_PESO		)
			oModelZEM:LoadValue("ZEM_DIFERE"	,QZEJ->ZEJ_DIFERE	)

			oModelZEM:GoLine(1)
		Else

			if lNewlinha
				oModelZEN:AddLine()
			Endif

			oModelZEN:LoadValue("ZEN_LEG"		,"BR_VERDE"			)
			oModelZEN:LoadValue("ZEN_OCORR"		,QZEJ->ZEJ_CODIGO 	)
			oModelZEN:LoadValue("ZEN_NUM"		,QZEJ->ZEJ_NUM		)
			oModelZEN:LoadValue("ZEN_SERIE"		,QZEJ->ZEJ_SERIE	)
			oModelZEN:LoadValue("ZEN_FORNEC"	,QZEJ->ZEJ_FORNEC	)
			oModelZEN:LoadValue("ZEN_LOJA"		,QZEJ->ZEJ_LOJA		)
			oModelZEN:LoadValue("ZEN_NOME"		,QZEJ->A2_NOME		)
			oModelZEN:LoadValue("ZEN_PESONF"	,QZEJ->ZEJ_PESONF	)
			oModelZEN:LoadValue("ZEN_PESORE"	,QZEJ->ZEJ_PESO		)
			oModelZEN:LoadValue("ZEN_DIFERE"	,QZEJ->ZEJ_DIFERE	)

			oModelZEN:GoLine(1)

		Endif

		//oView:Refresh()

		QZEJ->(DbSkip())
	Enddo

	oView:Refresh()

	AtuResumo('ZEMDETAIL',.F.) // Funcao de atualizacao do resumo
	AtuResumo('ZENDETAIL',.F.) // Funcao de atualizacao do resumo

	oModel:GetModel( 'ZEMDETAIL' ):SetNoInsertLine( .T. )
	oModel:GetModel( 'ZENDETAIL' ):SetNoInsertLine( .T. )

	oModelZEM:GoLine(1)
	oModelZEN:GoLine(1)

	oView:Refresh()

Return

//-------------------------------------------------------------------
// Atualiza Resumo
//-------------------------------------------------------------------
Static Function AtuResumo(cView,lLimpa)

	Local oView		:= FWViewActive()
	Local oModel  	:= FWModelActive()
	Local oModelDev	:= oModel:GetModel('DEVDETAIL')
	Local oModelCom	:= oModel:GetModel('COMDETAIL')
	Local oModelGrid:= oModel:GetModel(cView)
	//Local nLenGrid  := oModelGrid:Length()
	Local nLinha	:= 0
	Local cAuxFor	:= ""
	Local nPsNfAtu	:= 0
	Local nPsReAtu  := 0
	Local nDifAtu	:= 0
	Local nX		:= 1
	Local cFornece	:= ""



	//Resumo devoluções
	if cView == "ZEMDETAIL"

		oModel:GetModel( 'DEVDETAIL' ):SetNoInsertLine( .F. )
		oModel:GetModel( 'DEVDETAIL' ):SetNoUpdateLine( .F. )

		if lLimpa
			LimpaGrid(oModelDev,.T.)
		Endif

		While nX <= oModelGrid:Length()

			If !oModelGrid:IsDeleted(nX)

				//Verifico se ja existe fornecedor na linha
				if !oModelDev:SeekLine({{"ZEJ_FORNEC",oModelGrid:GetValue("ZEM_FORNEC",nX) },{"ZEJ_LOJA",oModelGrid:GetValue("ZEM_LOJA",nX)} })

					nLinha	:= oModelDev:Length()
					cAuxFor := oModelDev:GetValue("ZEJ_FORNEC",nLinha)

					if nLinha == 1 .AND. Empty(cAuxFor)
						lNewlinha := .F.
					Else
						lNewlinha := .T.
					Endif

					if lNewlinha
						oModelDev:AddLine()
					Endif

					cFornece := oModelGrid:GetValue("ZEM_FORNEC",nX)
					cLoja	 := oModelGrid:GetValue("ZEM_LOJA" ,nX )

					oModelDev:LoadValue("ZEJ_FORNEC" , oModelGrid:GetValue("ZEM_FORNEC",nX)		)
					oModelDev:LoadValue("ZEJ_LOJA"   , oModelGrid:GetValue("ZEM_LOJA"  ,nX )	)
					oModelDev:LoadValue("ZEJ_NOME"   , Posicione("SA2",1,xFilial("SA2")+cFornece+cLoja,"A2_NOME")  	)
					oModelDev:LoadValue("ZEJ_PESONF" , oModelGrid:GetValue("ZEM_PESONF",nX) 	)
					oModelDev:LoadValue("ZEJ_PESO"   , oModelGrid:GetValue("ZEM_PESORE",nX) 	)
					oModelDev:LoadValue("ZEJ_DIFERE" , oModelGrid:GetValue("ZEM_DIFERE",nX) 	)

					oModelDev:GoLine(1)
					oView:Refresh()

				Else

					nPsNfAtu := oModelDev:GetValue("ZEJ_PESONF"   	) + oModelGrid:GetValue("ZEM_PESONF",nX)
					nPsReAtu := oModelDev:GetValue("ZEJ_PESO"   	) + oModelGrid:GetValue("ZEM_PESORE",nX)
					nDifAtu  := oModelDev:GetValue("ZEJ_DIFERE" 	) + oModelGrid:GetValue("ZEM_DIFERE",nX)

					oModelDev:LoadValue("ZEJ_PESONF"   	,nPsNfAtu	)
					oModelDev:LoadValue("ZEJ_PESO"  	, nPsReAtu	)
					oModelDev:LoadValue("ZEJ_DIFERE"   	, nDifAtu 	)

					oModelDev:GoLine(1)
					oView:Refresh()
				Endif

			Endif

			nX++
		Enddo

		oModel:GetModel( 'DEVDETAIL' ):SetNoInsertLine( .T. )
		oModel:GetModel( 'DEVDETAIL' ):SetNoUpdateLine( .T. )
		//Resumo Complemento
	Else

		oModel:GetModel( 'COMDETAIL' ):SetNoInsertLine( .F. )
		oModel:GetModel( 'COMDETAIL' ):SetNoUpdateLine( .F. )

		if lLimpa
			LimpaGrid(oModelCom,.T.)
		Endif

		While nX <= oModelGrid:Length()

			If !oModelGrid:IsDeleted(nX)

				//Verifico se ja existe fornecedor na linha
				if !oModelCom:SeekLine({{"ZEJ_FORNEC",oModelGrid:GetValue("ZEN_FORNEC",nX) },{"ZEJ_LOJA",oModelGrid:GetValue("ZEN_LOJA",nX)} })

					nLinha	:= oModelCom:Length()
					cAuxFor := oModelCom:GetValue("ZEJ_FORNEC",nLinha)

					if nLinha == 1 .AND. Empty(cAuxFor)
						lNewlinha := .F.
					Else
						lNewlinha := .T.
					Endif

					if lNewlinha
						oModelCom:AddLine()
					Endif

					cFornece := oModelGrid:GetValue("ZEN_FORNEC",nX)
					cLoja	 := oModelGrid:GetValue("ZEN_LOJA"  ,nX)

					oModelCom:LoadValue("ZEJ_FORNEC" , oModelGrid:GetValue("ZEN_FORNEC",nX)	)
					oModelCom:LoadValue("ZEJ_LOJA"   , oModelGrid:GetValue("ZEN_LOJA"  ,nX )	)
					oModelCom:LoadValue("ZEJ_NOME"   , Posicione("SA2",1,xFilial("SA2")+cFornece+cLoja,"A2_NOME") )
					oModelCom:LoadValue("ZEJ_PESONF" , oModelGrid:GetValue("ZEN_PESONF", nX) )
					oModelCom:LoadValue("ZEJ_PESO"   , oModelGrid:GetValue("ZEN_PESORE", nX) )
					oModelCom:LoadValue("ZEJ_DIFERE" , oModelGrid:GetValue("ZEN_DIFERE", nX) )

					oModelCom:GoLine(1)
					oView:Refresh()

				Else

					nPsNfAtu := oModelCom:GetValue("ZEJ_PESONF"  	) + oModelGrid:GetValue("ZEN_PESONF",nX)
					nPsReAtu := oModelCom:GetValue("ZEJ_PESO"   	) + oModelGrid:GetValue("ZEN_PESORE",nX)
					nDifAtu  := oModelCom:GetValue("ZEJ_DIFERE" 	) + oModelGrid:GetValue("ZEN_DIFERE",nX)

					oModelCom:LoadValue("ZEJ_PESONF"   	, nPsNfAtu	)
					oModelCom:LoadValue("ZEJ_PESO"  	, nPsReAtu	)
					oModelCom:LoadValue("ZEJ_DIFERE"   	, nDifAtu 	)

					oModelCom:GoLine(1)
					oView:Refresh()
				Endif

			Endif

			nX++
		Enddo


		oModel:GetModel( 'COMDETAIL' ):SetNoInsertLine( .T. )
		oModel:GetModel( 'COMDETAIL' ):SetNoUpdateLine( .T. )
	Endif

	//FWRestRows( aSaveLines )
Return

//----------------------------------------------------------------------
//Carrega Grid de resumo da tela em operacoes que nao for Inclusao
//----------------------------------------------------------------------
User Function Resumo()

	Local oView		:= FWViewActive()
	Local oModel  	:= FWModelActive()
	//Local oModelZEM	:= oModel:GetModel('ZEMDETAIL')
	//Local oModelZEN	:= oModel:GetModel('ZENDETAIL')
	//Local oModelDEV	:= oModel:GetModel('DEVDETAIL')
	//Local oModelCOM	:= oModel:GetModel('COMDETAIL')
	Local nOperacao := oModel:GetOperation()


	If nOperacao != 3

		if nOperacao != 4
			oModel:DeActivate()
			oModel:SetOperation(4)
			oModel:Activate()
		Endif

		AtuResumo('ZEMDETAIL',.F.) // Funcao de atualizacao do resumo
		AtuResumo('ZENDETAIL',.F.) // Funcao de atualizacao do resumo

		oView:Refresh()

		if nOperacao != 4
			oModel:DeActivate()
			oModel:SetOperation(nOperacao)
			oModel:Activate()
		Endif
	Endif

Return

//----------------------------------------------------------------------
//Processa Apuração de Entradas do Leite
//----------------------------------------------------------------------
User Function RCOM01FM()

	Local cLog := ""
	Private cCgcFil := SM0->M0_CGC

	//Faz devolucoes
	FWMsgRun(,{|oSay| DevLeite(oSay,1, @cLog) },'Aguarde...','Gerando Notas de Devolucao...' )

	//Faz Pedidos compra complementar Para Filial
	FWMsgRun(,{|oSay| GeraComp(oSay, @cLog) },'Aguarde...','Gerando Pedidos de Compra Complementar...' )

	//Faz entrada das notas fiscais de devolucao nas filial Entreposto
	FWMsgRun(,{|oSay| U_RCOMA002(oSay, @cLog) },'Aguarde...','Fazendo Entrada das notas fiscais de devolucao nos Entrepostos...' )

	if !empty(cLog)
		MsgInfo(cLog, "Finalizado")
	endif

Return

//----------------------------------------------------------------------
//Rotina para fazer devoluções
//----------------------------------------------------------------------
Static Function DevLeite(oSay,nOpc, cLog)

	Local cQuery 		:= ""
	Local cFornec		:= ""
	Local cLoja			:= ""
	Local aCabec		:= {}
	Local aItensPed		:= {}
	Local aAuxItem  	:= {}
	Local aDevFilial	:= {}
	Local cDocDev		:= ""
	Local cSerieDev 	:= ""
	Local cCodFilOri	:= ""
	//Local cOcorrencia	:= ""
	Local cCgcFor		:= ""
	//Local cFilAtu		:= ""
	Local cProduto 		:= ""
	Local cNota			:= ""
	Local aOcorrencia	:= {}
	Local nQtdDev		:= 0
	Local nPosFil		:= 0
	Local aTickets 		:= {}

	Private lMsErroAuto := .F.

	DbSelectArea("SA2")

	//Busco notas para devolução
	cQuery := " SELECT "
	cQuery += " 	ZEJ_FORNEC, "
	cQuery += "		ZEJ_LOJA,   "
	cQuery += " 	ZEJ_DIFERE, "
	cQuery += " 	ZEJ_NUM,    "
	cQuery += " 	ZEJ_SERIE,  "
	cQuery += " 	ZEJ_CODIGO, "
	cQuery += " 	ZEJ_PRODUT, "
	cQuery += " 	F1_COND,	"
	cQuery += "     D1_VUNIT,   "
	cQuery += "     D1_TES,     "
	cQuery += "		D1_ITEM,    "
	cQuery += "		D1_XTICKET, "
	cQuery += "		F4_XTDSPOT    "
	cQuery += " FROM " + RETSQLNAME("ZEJ") + " ZEJ"
	cQuery += " LEFT JOIN " + RETSQLNAME("ZEM") + " ZEM"
	cQuery += " 	ON ZEJ_FILIAL  = ZEM_FILIAL "
	cQuery += " 	AND ZEJ_CODIGO = ZEM_OCORR  "
	cQuery += " 	AND ZEJ_FORNEC = ZEM_FORNEC "
	cQuery += " 	AND ZEJ_LOJA   = ZEM_LOJA   "
	cQuery += " 	AND ZEM.D_E_L_E_T_<> '*'    "
	cQuery += " INNER JOIN " + RETSQLNAME("SF1") + " F1"
	cQuery += " 	ON F1_FILIAL 	= ZEJ_FILIAL"
	cQuery += " 	AND F1_DOC 		= ZEJ_NUM   "
	cQuery += " 	AND F1_SERIE	= ZEJ_SERIE "
	cQuery += " 	AND F1_FORNECE 	= ZEJ_FORNEC"
	cQuery += " 	AND F1_LOJA 	= ZEJ_LOJA  "
	cQuery += " 	AND F1.D_E_L_E_T_<> '*'     "
	cQuery += " INNER JOIN  " + RETSQLNAME("SD1") + " D1"
	cQuery += " 	ON D1_FILIAL 	= ZEJ_FILIAL"
	cQuery += " 	AND D1_DOC 		= ZEJ_NUM   "
	cQuery += " 	AND D1_SERIE	= ZEJ_SERIE "
	cQuery += " 	AND D1_FORNECE 	= ZEJ_FORNEC"
	cQuery += " 	AND D1_LOJA 	= ZEJ_LOJA  "
	cQuery += "     AND D1_COD		= ZEJ_PRODUT"
	cQuery += " 	AND D1.D_E_L_E_T_<> '*'
	cQuery += " INNER JOIN " + RETSQLNAME("SF4") + " F4"
	cQuery += " ON F4_FILIAL 	= D1_FILIAL"
	cQuery += " AND F4_CODIGO 	= D1_TES"
	cQuery += " AND F4.D_E_L_E_T_<> '*'"
	cQuery += " WHERE ZEJ.D_E_L_E_T_<> '*'"
	cQuery += " 	AND ZEJ_FILIAL = '" + xFilial("ZEJ")  + "'"
	cQuery += " 	AND ZEJ_NUMDEV = '" + Space(TamSx3("ZEJ_NUMDEV")[1]) + "'"
	cQuery += " 	AND ZEM_CODIGO = '" + ZEL->ZEL_CODIGO + "'"

	cQuery += " ORDER BY ZEJ_FORNEC,ZEJ_LOJA"

	cQuery := ChangeQuery(cQuery)

	If Select("QZEJ")>0
		QZEJ->(DbCloseArea())
	Endif

	TcQuery cQuery New Alias "QZEJ"

	//Valida se todas as tes de devolucao foram cadastradas
	While QZEJ->(!EOF())
		If Empty(QZEJ->F4_XTDSPOT)
			Alert("Tes de devolução para Tes "+ QZEJ->D1_TES + " não foi cadastrada!")
			Return .F.
		Endif

		QZEJ->(DbSkip())
	Enddo

	QZEJ->(DbGoTop())

	While QZEJ->(!EOF())

		//Verifico se trocou fornecedor
		If cFornec+cLoja != QZEJ->ZEJ_FORNEC+QZEJ->ZEJ_LOJA

			SA2->(DbSetOrder(1))
			If SA2->(DbSeek(xFilial("SA2")+QZEJ->ZEJ_FORNEC+QZEJ->ZEJ_LOJA))

				oSay:cCaption := ("Aguarde ...Gerando Pedido Devolucao referente Nota : " +QZEJ->ZEJ_NUM	 )
				ProcessMessages()

				aAdd(aCabec, {"C5_TIPO"   , "D"           		    , nil}) 	// TIPO DEVOLUCAO
				aAdd(aCabec, {"C5_CLIENTE", QZEJ->ZEJ_FORNEC        , nil}) 	// CÓDIGO DO FORNECEDOR
				aAdd(aCabec, {"C5_LOJACLI", QZEJ->ZEJ_LOJA    	    , nil}) 	// LOJA DO FORNECEDOR
				aAdd(aCabec, {"C5_EMISSAO", dDataBase		  	 	, nil}) 	// DATA DE EMISSÃO
				aAdd(aCabec, {"C5_CONDPAG", QZEJ->F1_COND    		, nil}) 	// CONDIÇÃO
				aAdd(aCabec, {"C5_NATUREZ", SuperGetMv("MV_XNSPOT")	, nil}) 	// NATUREZA

				cFornec  	:= QZEJ->ZEJ_FORNEC
				cLoja		:= QZEJ->ZEJ_LOJA
				cItem    	:= replicate("0", tamSX3("C6_ITEM")[1])
				cCodFilOri  := ""
				aAuxItem 	:= {}
				aItensPed	:= {}
				aOcorrencia	:= {}
				aTickets	:= {}
			Endif
		Endif

		cCgcFor		:= SA2->A2_CGC
		cDocDev		:= QZEJ->ZEJ_NUM
		cSerieDev 	:= QZEJ->ZEJ_SERIE
		cItem 		:= soma1(cItem)
		nQtdDev		:= QZEJ->ZEJ_DIFERE
		cProduto	:= QZEJ->ZEJ_PRODUT

		aAdd(aAuxItem, {"C6_ITEM"   , cItem                       			, nil}) //  ITEM DO PEDIDO
		aAdd(aAuxItem, {"C6_PRODUTO", QZEJ->ZEJ_PRODUT         				, nil}) //  CÓDIGO DO PRODUTO
		aAdd(aAuxItem, {"C6_QTDVEN" , QZEJ->ZEJ_DIFERE             			, nil}) //  QUANTIDADE VENDIDA
		aAdd(aAuxItem, {"C6_PRCVEN" , A410Arred(QZEJ->D1_VUNIT,"C6_PRCVEN")	, nil}) //  PREÇO DE VENDA
		aAdd(aAuxItem, {"C6_VALOR"  , A410Arred(QZEJ->ZEJ_DIFERE * QZEJ->D1_VUNIT,"C6_VALOR"), nil}) //  VALOR TOTAL
		aAdd(aAuxItem, {"C6_TES"    , QZEJ->F4_XTDSPOT             			, nil}) //  TIPO OPERAÇÂO TRANSFERENCIA
		aadd(aAuxItem, {"C6_QTDLIB" , QZEJ->ZEJ_DIFERE						, nil}) //  Qtde liberada
		aadd(aAuxItem, {"C6_NFORI"  , QZEJ->ZEJ_NUM							, nil}) //  Nf Original
		aadd(aAuxItem, {"C6_SERIORI", QZEJ->ZEJ_SERIE						, nil}) //  Serie Original
		aadd(aAuxItem, {"C6_ITEMORI", QZEJ->D1_ITEM							, nil}) //  Item nf Original

		aadd(aOcorrencia,{ QZEJ->ZEJ_CODIGO})
		aadd(aTickets, QZEJ->D1_XTICKET )

		aAdd(aItensPed, aAuxItem )

		//Valida se devolução é para alguma Filial da Mococa
		If Empty(cCodFilOri)
			ValFilial(cCgcFor,@cCodFilOri)
		Endif

		if !Empty(cCodFilOri)
			//Guardo dados da nota que esta sendo devolvido agrupando por filial de origem
			If (nPosFil:= aScan(aDevFilial,{|X| Alltrim(X[1]) == Alltrim(cCodFilOri)})) == 0
				AADD(aDevFilial,{cCodFilOri,{{cDocDev,cSerieDev,cProduto,nQtdDev,cFornec,cLoja }}})
			Else
				AADD(aDevFilial[nPosFil,2],{cDocDev,cSerieDev,cProduto,nQtdDev,cFornec,cLoja})
			Endif
		Endif

		aAuxItem:= {}

		QZEJ->(DbSkip())

		If cFornec+cLoja != QZEJ->ZEJ_FORNEC+QZEJ->ZEJ_LOJA

			BeginTran()

			lMsErroAuto  := .F.

			MSExecAuto({|x,y,z| Mata410(x,y,z)}, aCabec, aItensPed, 3)

			If lMsErroAuto
				MostraErro()
				DisarmTransaction()
			Else

				cLog += "Pedido Devolução Gerado: " + SC5->C5_NUM + " Filial:" + cFilAnt + CRLF

				//Fatura pedido de venda
				if GeraNfDev(aOcorrencia,oSay,@cNota,aTickets,@cLog)
					EndTran()
				else
					DisarmTransaction()
				endif

			Endif
		Endif
	EndDo

	//Verico se existe devolucao na filial de origem a fazer
	If Len(aDevFilial) > 0
		DevFilFor(aDevFilial,oSay,@cLog)  //Funcao para devolucao na Filial - Fornecedor
	Endif

Return

//----------------------------------------------------------------------
//Gera Nota fiscal de Devolucao de compra
//----------------------------------------------------------------------
Static Function GeraNfDev(aOcorrencia,oSay,cNota, aTickets, cLog)

	Local aPvlNfs 	:= {}
	Local aBloqueio := {}
	Local aArea		:= GetArea()
	Local cSerie    := PadR(SuperGetMv("MV_XSERIE"),TamSx3("F2_SERIE")[1])
	Local nX		:= 1

	DbSelectArea("ZEJ")
	DbSelectArea("ZEM")

	//Valida se parametro foi informado
	If Empty(cSerie)
		Alert("Parametro MV_XSERIE que define a serie da nota fiscal de devolução não foi informado !","Atenção")
		Return .F.
	Endif

	Ma410LbNfs(1,@aPvlNfs,@aBloqueio)

	//Valida se pedido esta bloqueado
	if !Empty(aBloqueio) .OR. !Empty(SC5->C5_BLQ)
		aPvlNfs 	:= {}
		aBloqueio 	:= {}

		oSay:cCaption := ("Aguarde ...Liberando Pedido gerado N. : " +SC5->C5_NUM )
		ProcessMessages()

		Ma410LbNfs(2,@aPvlNfs,@aBloqueio) //tenta liberar
		Ma410LbNfs(1,@aPvlNfs,@aBloqueio) //verifica se há bloqueios

		if !Empty(aBloqueio) .OR. !Empty(SC5->C5_BLQ)
			Alert("Pedido "+SC5->C5_NUM+" com algum bloqueio de crédito ou estoque. Operação Abortada!","Atenção")
			Return .F.
		Endif
	Endif

	If !Empty(aPvlNfs)

		lMostraCtb   := .F.
		lAglutCtb    := .F.
		lCtbOnLine   := .F.
		lCtbCusto    := .F.
		lReajuste    := .F.
		nCalAcrs     :=  0
		nArredPrcLis :=  0
		lAtuSA7      := .T.
		lECF         := .F.

		oSay:cCaption := ("Aguarde ...Faturando Pedido : " +SC5->C5_NUM	 )
		ProcessMessages()

		cNota   := MaPvlNfs(aPvlNfs, cSerie, lMostraCtb, lAglutCtb, lCtbOnLine, lCtbCusto, lReajuste, nCalAcrs, nArredPrcLis, lAtuSA7, lECF)
		aPvlNfs := {}
		If Empty(cNota)
			Alert("Falha ao gerar Documento Saída sobre o Pedido "+SC5->C5_NUM+". Operação Abortada! (MaPvlNfs)","Atenção")
			Return .F.
		Else
			//Atualiza tabela com ocorrencia com numero da nota
			For nX:= 1 to Len(aOcorrencia)

				ZEJ->(DbSetOrder(1))
				If ZEJ->(DbSeek(xFilial("ZEJ")+aOcorrencia[nX,1]))
					If Reclock("ZEJ",.F.)
						ZEJ->ZEJ_NUMDEV := SF2->F2_DOC
						ZEJ->ZEJ_SERDEV := SF2->F2_SERIE
						ZEJ->ZEJ_STATUS := "F" //Finalizado
						ZEJ->(MsUnLock())
					Endif

					//Atualiza status da titulo na apuracao
					ZEM->(DbSetOrder(1))
					If ZEM->(DbSeek(xFilial("ZEJ")+ZEL->ZEL_CODIGO+aOcorrencia[nX,1]))
						If Reclock("ZEM",.F.)
							ZEM->ZEM_STATUS := "F" // Finalizado
							ZEJ->(MsUnLock())
						Endif
					Endif
				Endif

			Next nX

			//faz baixa do ticket
			For nX:= 1 to Len(aTickets)
				if !empty(aTickets[nX])
					U_BxTicket(xFilial("Z19"), aTickets[nX] , "B")
				endif
			Next nX

			cLog += "NF Devolução Gerada: " + cNota + "/" + cSerie + "  Filial:" + cFilAnt + CRLF

			// Faz Transmissao da nota fiscal de saida
			TransNota()
		Endif
	else
		Alert("Falha ao gerar Documento Saída sobre o Pedido "+SC5->C5_NUM+". Operação Abortada! (MaPvlNfs)","Atenção")
		Return .F.
	Endif

	RestArea(aArea)

Return .T.

//----------------------------------------------------------------------
//Faz transmissao Nota fiscal de Devolucao de compra
//----------------------------------------------------------------------
Static Function TransNota()

	//Verifico se nao foi transmitida
	If Empty(SF2->F2_FIMP)

		/*Parametros AutoNfeEnv :
		cEmpresa,
		cFilial,
		cEspera,
		cAmbiente (1=producao,2=Homologação)
		cSerie
		cDoc.Inicial
		cDoc.Final
		*/
		//Mococa 
		//Fonte da função de transmissão da NF descontinuada na realease 12.1.27
		u_AutoNfeEnv(cEmpAnt, cFilAnt, "", "", SF2->F2_SERIE, SF2->F2_DOC, SF2->F2_DOC) //Produçao
		//AutoNfeEnv(cEmpAnt, cFilAnt, "", "2", SF2->F2_SERIE, SF2->F2_DOC, SF2->F2_DOC) //Homologaçao
		Sleep(8000) //espera 8 segundos
		
	Endif

Return

//----------------------------------------------------------------------
//Valida se devolução/Complementar é para alguma das filiais da Mococa
//----------------------------------------------------------------------
Static Function ValFilial(cCgcFor,cCodFilOri)

	Local nX 	:= 1
	Local lRet	:= .F.
	Local aEmp	:= {}

	aEmp 	:= FWLoadSM0()

	//Varre filiais da SM0 para verificar se fornecedor é uma filial
	For nX := 1 to Len(aEmp)
		if aEmp[nX,18] == cCgcFor
			lRet 		:= .T.
			cCodFilOri 	:= aEmp[nX,2]
			Exit  //Abandona o loop
		Endif
	Next nX

Return lRet

//----------------------------------------------------------------------
//Faz Devolucao da filial para fornecedor do produto
//----------------------------------------------------------------------
Static Function DevFilFor(aDevFilial,oSay,cLog)

	Local nX 		:= 1
	Local nI 		:= 1
	Local nY		:= 1
	Local nPosFor	:= 0
	//Local cFornec   := ""
	//Local cLoja		:= ""
	Local nRecno	:= ""
	Local cCond		:= ""
	Local cTesDev	:= ""
	Local cNota     := ""
	Local aNotasFor	:= {}
	Local aCabFor	:= {}
	Local aItensDev := {}
	Local aAuxDev	:= {}
	Local aTickets	:= {}
	Local cFilAtu	:= cFilAnt
	Local aArea		:= GetArea()
	Local aOcorrencia := {}
	Private lMsErroAuto	:= .F.

	DbSelectArea("SD2")
	SD2->(DbSetOrder(1))
	SD2->(DbGoTop())

	DbSelectArea("ZEJ")

	For nX:= 1 to Len(aDevFilial)

		//Preparo ambiente da outra filial
		cFilAnt 	:=  aDevFilial[nX,1]
		aNotasFor	:= {}

		//Separo notas por fornecedor para devolucao
		For nI:= 1 to Len(aDevFilial[nX,2])

			//Valido se devolucao foi gerado na filial do processamento antes de gerar na filial entreposto
			ZEJ->(DbSetOrder(5))
			If ZEJ->(DbSeek(cFilAtu+aDevFilial[nX,2,nI,1]+aDevFilial[nX,2,nI,2]+aDevFilial[nX,2,nI,5]+aDevFilial[nX,2,nI,6])) .AND. !Empty(ZEJ->ZEJ_NUMDEV)

				nRecno:= U_GetNfOri(aDevFilial[nX,2,nI,1],aDevFilial[nX,2,nI,2]) //Busca numero da nota fiscal de entrada do fornecedor

				oSay:cCaption := ("Aguarde ...Realizando Devolucao Filial "+ xFilial("SD1")+ " Fornecedor : " +SD1->D1_FORNECE	)
				ProcessMessages()

				if !empty(nRecno)
					//Verifico se fornecedor ja esta no array
					if (nPosFor := aScan(aNotasFor,{|x| x[1]+x[2] == SD1->D1_FORNECE+SD1->D1_LOJA })) == 0

						AADD(aNotasFor,{ SD1->D1_FORNECE,SD1->D1_LOJA,{{nRecno,aDevFilial[nX,2,nI,4] }}})	 //RECNO ITEM, QTDE DEVOLVIDA

					Else

						//Adiciono a nota na posicao do fornecedor
						AADD(aNotasFor[nPosFor,3],{ nRecno,aDevFilial[nX,2,nI,4] })				 //RECNO ITEM

					Endif
				else
					MsgAlert("Falha ao localizar NF entrada do fornecedor. Verifique se informou corretamente os dados da NF do fornecedor no pedido de transferência para industria.")
				endif
			Endif
		Next nI

		//Reabre a tabela e ordena
		DbSelectArea("SD1")
		SD1->(DbSetOrder(1))
		SD1->(DbGoTop())

		//Preparo Array dados para devolucao
		if len(aNotasFor) > 0

			For nI := 1 to Len(aNotasFor)

				aAuxDev 	:= {}
				aItensDev	:= {}
				aCabFor		:= {}
				cItemSeq   	:= replicate("0", tamSX3("C6_ITEM")[1])

				For nY := 1 to Len(aNotasFor[nI,3])

					//Posiciono no item
					SD1->(DbGoTo(aNotasFor[nI,3,nY,1]))

					If Len(aCabFor) == 0

						cCond	 := Posicione("SF1",1,xFilial("SF1")+SD1->D1_DOC+SD1->D1_SERIE+SD1->D1_FORNECE+SD1->D1_LOJA+SD1->D1_TIPO,"F1_COND")
						aAuxDev  := {}
						aItensDev:= {}

						aAdd(aCabFor, {"C5_TIPO"   , "D"           			, nil}) 	// TIPO DEVOLUCAO
						aAdd(aCabFor, {"C5_CLIENTE", SD1->D1_FORNECE  		, nil}) 	// CÓDIGO DO FORNECEDOR
						aAdd(aCabFor, {"C5_LOJACLI", SD1->D1_LOJA		    , nil}) 	// LOJA DO FORNECEDOR
						aAdd(aCabFor, {"C5_EMISSAO", dDataBase			    , nil}) 	// DATA DE EMISSÃO
						aAdd(aCabFor, {"C5_CONDPAG", cCond				 	, nil}) 	// CONDIÇÃO
						aAdd(aCabFor, {"C5_NATUREZ", SuperGetMv("MV_XNSPOT"), nil}) 	// NATUREZA

					Endif

					cTesDev	 := Posicione("SF4",1,xFilial("SF4")+SD1->D1_TES,"F4_XTDSPOT")
					cItemSeq := soma1(cItemSeq)

					aAdd(aAuxDev, {"C6_ITEM"   , cItemSeq                       		, nil}) //  ITEM DO PEDIDO
					aAdd(aAuxDev, {"C6_PRODUTO", SD1->D1_COD		         			, nil}) //  CÓDIGO DO PRODUTO
					aAdd(aAuxDev, {"C6_QTDVEN" , aNotasFor[nI,3,nY,2]             		, nil}) //  QUANTIDADE VENDIDA
					aAdd(aAuxDev, {"C6_PRCVEN" , A410Arred(SD1->D1_VUNIT,"C6_PRCVEN")	, nil}) //  PREÇO DE VENDA
					aAdd(aAuxDev, {"C6_VALOR"  , A410Arred(aNotasFor[nI,3,nY,2] * SD1->D1_VUNIT,"C6_VALOR"), nil}) //  VALOR TOTAL
					aAdd(aAuxDev, {"C6_TES"    , cTesDev		              			, nil}) //  TIPO OPERAÇÂO TRANSFERENCIA
					aadd(aAuxDev, {"C6_QTDLIB" , aNotasFor[nI,3,nY,2]					, nil}) //  Qtde liberada
					aadd(aAuxDev, {"C6_NFORI"  , SD1->D1_DOC							, nil}) //  Nf Original
					aadd(aAuxDev, {"C6_SERIORI", SD1->D1_SERIE							, nil}) //  Serie Original
					aadd(aAuxDev, {"C6_ITEMORI", SD1->D1_ITEM							, nil}) //  Item nf Original

					aadd(aTickets, SD1->D1_XTICKET)

					aAdd(aItensDev, aAuxDev )

					aAuxDev:= {}
				Next nY

				lMsErroAuto  := .F.

				BeginTran()

				MSExecAuto({|x,y,z| Mata410(x,y,z)}, aCabFor, aItensDev, 3)

				If lMsErroAuto
					MostraErro()
					DisarmTransaction()
				Else

					cLog += "Pedido Devoluçao Gerado: " + SC5->C5_NUM + " Filial:" + cFilAnt + CRLF

					//Fatura pedido de venda
					if GeraNfDev(aOcorrencia,oSay,@cNota,aTickets, @cLog)
						EndTran()
					else
						DisarmTransaction()
					endif

				Endif

			Next nI

		Endif
	Next nX

	//Retorno Filial locado
	cFilAnt := cFilAtu
	RestArea(aArea)

Return

//----------------------------------------------------------------------
//Retorna  recno da nota fiscal devolucao
//----------------------------------------------------------------------
User Function GetNfOri(cNumDoc,cSerie)

	//Local cQry	  := ""
	Local nRecno  := 0

	DbSelectArea("SD2")
	SD2->(DbSetOrder(3))
	SD2->(DbGoTop())

	DbSelectArea("SC6")
	SC6->(DbSetOrder(1))
	SC6->(DbGoTop())

	DbSelectArea("SD1")
	SD1->(DbSetOrder(1)) //D1_FILIAL+D1_DOC+D1_SERIE+D1_FORNECE+D1_LOJA+D1_COD+D1_ITEM
	SD1->(DbGoTop())

	SD2->(DbSetOrder(3))
	If SD2->(DbSeek(xFilial("SD2")+cNumDoc+cSerie))

		While SD2->(!EOF());
		.AND. SD2->D2_FILIAL+SD2->D2_DOC+SD2->D2_SERIE == xFilial("SD2")+cNumDoc+cSerie

			SC6->(DbSetOrder(1))
			If SC6->(DbSeek(xFilial("SC6")+SD2->D2_PEDIDO+SD2->D2_ITEMPV+SD2->D2_COD))

				//Posiciona no item para pegar o recno
				SD1->(DbSetOrder(1))
				If SD1->(DbSeek(xFilial("SD1")+SC6->C6_XNFENTF+SC6->C6_XSERIEN+SC6->C6_XCODFOR+SC6->C6_XLOJFOR+SC6->C6_PRODUTO)) //+Alltrim(SC6->C6_XITEMEN)
					nRecno := SD1->(Recno())
					Exit
				Endif
			Endif


			SD2->(DbSkip())
		EndDo
	Endif

Return nRecno


//----------------------------------------------------------------------
//Legenda de registros
//----------------------------------------------------------------------
User Function RCOMA01L()

	BrwLegenda("Legenda","Legenda",{{"BR_VERDE","Acerto Pendente"},{"BR_VERMELHO","Acerto Finalizado"}})

Return


//----------------------------------------------------------------------
//Processa Apuração de complementar do leite
//----------------------------------------------------------------------
Static Function GeraComp(oSay, cLog)

	Local aComp	  	:= {}
	Local nPosFor 	:= 0
	//Local aNotaOri	:= {}
	Local aCabec 	:= {}
	Local aItens 	:= {}
	Local cItem		:= 0
	Local lOk		:= .F.
	Local nX, nY

	Private lMsErroAuto := .F.

	DbSelectArea("ZEJ")
	DbSelectArea("ZEN")

	//Agrupo por fornecedor e Valor unit para gerar complementar
	ZEN->(DbSetOrder(1))
	If ZEN->(DbSeek(xFilial("ZEN")+ZEL->ZEL_CODIGO))

		While ZEN->(!EOF());
		.AND. ZEN->ZEN_FILIAL+ZEN->ZEN_CODIGO == xFilial("ZEN")+ZEL->ZEL_CODIGO

			oSay:cCaption := ("Aguarde ...Preparando Complementar Fornecedor :" +ZEN->ZEN_FORNEC + " Loja :" + ZEN->ZEN_LOJA	 )
			ProcessMessages()

			ZEJ->(DbSetOrder(1))
			If ZEJ->(DbSeek(xFilial("ZEJ")+ZEN->ZEN_OCORR)) .AND. Empty(ZEJ->ZEJ_PEDIDO)

				SD1->(DbSetOrder(1)) //D1_FILIAL+D1_DOC+D1_SERIE+D1_FORNECE+D1_LOJA+D1_COD+D1_ITEM
				If SD1->(DbSeek(xFilial("SD1")+ZEN->ZEN_NUM+ZEN->ZEN_SERIE+ZEN->ZEN_FORNEC+ZEN->ZEN_LOJA+ZEJ->ZEJ_PRODUTO))

					If (nPosFor := aScan(aComp,{|x| x[1]+x[2] == ZEN->ZEN_FORNEC+ZEN->ZEN_LOJA })) == 0

						//Pega condicao de pagamento que sera utilizada no pedido de compra
						cCondPag:= Posicione("SF1",1,xFilial("SF1")+ZEN->ZEN_NUM+ZEN->ZEN_SERIE,"F1_COND")

						aAdd(aComp,{ZEN->ZEN_FORNEC,ZEN->ZEN_LOJA,cCondPag,{{ZEN->ZEN_OCORR,ZEN->ZEN_CODIGO}},{{ZEJ->ZEJ_PRODUTO,ZEN->ZEN_DIFERE,SD1->D1_VUNIT}}})
					Else

						//Valido se ja existe produto com o mesmo valor unitario no array
						For nX := 1 to Len(aComp[nPosFor,5])
							If aComp[nPosFor,5,nX,3] == SD1->D1_VUNIT
								aComp[nPosFor,5,nX,2] += ZEN->ZEN_DIFERE

								//Salvo codigo da ocorrencia
								AADD(aComp[nPosFor,4],{ZEN->ZEN_OCORR,ZEN->ZEN_CODIGO})
								lOk := .T.
							Endif
						Next nX

						if !lOk
							AADD(aComp[nPosFor,4],{ZEN->ZEN_OCORR,ZEN->ZEN_CODIGO})
							aAdd(aComp[nPosFor,5],{ZEJ->ZEJ_PRODUTO,ZEN->ZEN_DIFERE,SD1->D1_VUNIT})
						Endif

						lOk := .F.
					Endif

				Endif

			Endif

			ZEN->(DbSkip())
		Enddo
	Endif

	//Verifico se array esta preenchido
	If Len(aComp) > 0

		For nX := 1 to Len(aComp)

			aCabec 		:= {}
			aItens 		:= {}
			lMsErroAuto := .F.

			oSay:cCaption := ("Aguarde ...Gerando Pedido Compra Fornecedor :" +aComp[nX,1] + " Loja :" + aComp[nX,2]	 )
			ProcessMessages()

			//Preparo array de cabeçalho do pedido de compra
			aAdd(aCabec,{"C7_EMISSAO" ,dDataBase			,Nil})
			aAdd(aCabec,{"C7_FORNECE" ,aComp[nX,1]			,Nil})
			aAdd(aCabec,{"C7_LOJA"    ,aComp[nX,2]			,Nil})
			if !empty(aComp[nX,3])
				aAdd(aCabec,{"C7_COND"    ,aComp[nX,3]			,Nil})
			endif
			aAdd(aCabec,{"C7_CONTATO" ,""					,Nil})
			aAdd(aCabec,{"C7_FILENT"  ,cFilAnt				,Nil})


			aLinha := {}
			cItem  := replicate("0", tamSX3("C7_ITEM")[1])

			//Preparo array de itens do pedido de compra
			For nY := 1 to Len(aComp[nX,5])

				cItem 		:= soma1(cItem)
				aLinha 		:= {}

				aAdd(aLinha,{"C7_ITEM"    ,cItem                  		 ,Nil})
				aAdd(aLinha,{"C7_PRODUTO" ,aComp[nX,5,nY,1]				 ,Nil})
				aAdd(aLinha,{"C7_QUANT"   ,aComp[nX,5,nY,2]				 ,Nil})
				aAdd(aLinha,{"C7_PRECO"   ,aComp[nX,5,nY,3]				 ,Nil})
				aAdd(aLinha,{"C7_TOTAL"   ,aComp[nX,5,nY,2] * aComp[nX,5,nY,3] ,Nil})

				aAdd(aItens,aLinha)

			Next nY

			if Len(aItens) > 0

				MATA120(1,aCabec,aItens,3)

				If lMsErroAuto
					MostraErro()
				Else
					ConfirmSX8()

					//Gravo numero do pedido nas ocorrencias
					For nY :=1 to len(aComp[nX,4])

						ZEJ->(DbSetOrder(1))
						If ZEJ->(DbSeek(xFilial("ZEJ")+aComp[nX,4,nY,1]))
							If Reclock("ZEJ",.F.)
								ZEJ->ZEJ_PEDIDO := SC7->C7_NUM
								ZEJ->(MsUnLock())
							Endif

							//Atualizado status dos processo no registro
							ZEN->(DbSetOrder(1))
							If ZEN->(DbSeek(xFilial("ZEN")+aComp[nX,4,nY,2]+aComp[nX,4,nY,1]))
								If Reclock("ZEN",.F.)
									ZEN->ZEN_STATUS := 'F' //Grava status de finalizado
									ZEN->(MsUnLock())
								Endif
							Endif
						Endif
					Next nY

					cLog += "Pedido de compra complementar gerado: " + SC7->C7_NUM + " Filial: " + cFilAnt + CRLF
				Endif
			Endif
		Next nX

		//Faz pedido de compra para fornecedor a partir da filial de transferencia
		FWMsgRun(,{|oSay| PedFilOri(oSay, @cLog) },'Aguarde...','Gerando Pedidos de Compra Complementar na filial origem...' )
	Endif

Return

//----------------------------------------------------------------------
//Limpa grids da tela
//----------------------------------------------------------------------

Static Function LimpaGrid(oModelGrid,lResumo)

	Local oView		:= FWViewActive()
	Local oModel  	:= FWModelActive()

	//Se limpeza for da grid resumo
	If lResumo

		oModel:GetModel( 'DEVDETAIL' ):SetNoDeleteLine( .F. )
		oModel:GetModel( 'COMDETAIL' ):SetNoDeleteLine( .F. )

		U_LimpaAcolsMVC(oModelGrid,oView)

		oModel:GetModel( 'DEVDETAIL' ):SetNoDeleteLine( .T. )
		oModel:GetModel( 'COMDETAIL' ):SetNoDeleteLine( .T. )
	Else
		U_LimpaAcolsMVC(oModelGrid,oView)
	Endif

Return

//----------------------------------------------------------------------
//Processa Apuração de complementar do leite na filial de origem
//----------------------------------------------------------------------
Static Function PedFilOri(oSay, cLog)

	Local cQry 		:= ""
	Local cCodFilOri:= ""
	Local aComp		:= {}
	Local aPedidos	:= {}
	Local aArea		:= GetArea()
	Local cFilOri	:= cFilAnt
	//Local cPosFor	:= 0
	Local nPosFil	:= 0
	Local nRecno	:= 0
	Local nX		:= 1
	Local nY		:= 1

	DbSelectArea("SA2")

	cQry := " SELECT"
	cQry += " 	ZEJ_CODIGO,"
	cQry += " 	ZEJ_FORNEC,"
	cQry += " 	ZEJ_LOJA,  "
	cQry += " 	ZEJ_NUM,   "
	cQry += " 	ZEJ_SERIE, "
	cQry += " 	ZEJ_PRODUT,"
	cQry += " 	ZEJ_DIFERE "
	cQry += " FROM " + RETSQLNAME("ZEN") + " ZEN"
	cQry += " INNER JOIN " + RETSQLNAME("ZEJ") + " ZEJ"
	cQry += " ON ZEJ_FILIAL = ZEN_FILIAL"
	cQry += " 	AND ZEJ_CODIGO = ZEN_OCORR"
	cQry += " 	AND ZEJ.D_E_L_E_T_<> '*'"
	cQry += " WHERE ZEN.D_E_L_E_T_<> '*'"
	cQry += " 	AND ZEN_FILIAL = '" + xFilial("ZEN")  + "'"
	cQry += " 	AND ZEN_CODIGO = '" + ZEL->ZEL_CODIGO + "'"
	cQry += " 	AND ZEJ_PEDIDO <> '  '"

	cQry += " ORDER BY ZEJ_FORNEC,ZEJ_LOJA"

	cQry := ChangeQuery(cQry)

	If Select("QZEJ")>0
		QZEJ->(DbCloseArea())
	Endif

	TcQuery cQry New Alias "QZEJ"

	//Preparo array com complementares que serao feitas agrupando por filial
	While QZEJ->(!EOF())

		//Posiciona no fornecedor
		SA2->(DbSetOrder(1))
		If SA2->(DbSeek(xFilial("SA2")+QZEJ->ZEJ_FORNEC+QZEJ->ZEJ_LOJA))

			//Valida se complementar é para alguma Filial da Mococa
			ValFilial(SA2->A2_CGC,@cCodFilOri)

			If !Empty(cCodFilOri)

				If (nPosFil := aScan(aComp,{|x| Alltrim(x[1])== Alltrim(cCodFilOri)})) == 0
					AADD(aComp,{cCodFilOri,{{QZEJ->ZEJ_FORNEC,QZEJ->ZEJ_LOJA,ZEJ_NUM,ZEJ_SERIE,ZEJ_PRODUT,ZEJ_DIFERE,ZEJ_CODIGO }}})
				Else
					AADD(aComp[nPosFil,2],{QZEJ->ZEJ_FORNEC,QZEJ->ZEJ_LOJA,ZEJ_NUM,ZEJ_SERIE,ZEJ_PRODUT,ZEJ_DIFERE,ZEJ_CODIGO})
				Endif
			Endif
		Endif
		QZEJ->(DbSkip())
	EndDo

	If Len(aComp)>0

		For nX := 1 to Len(aComp)

			//Troco filial para filial onde sera gerado o pedido de compra
			cFilAnt := aComp[nX,1]


			For nY := 1 to Len(aComp[nX,2])

				nRecno:= U_GetNfOri(aComp[nX,2,nY,3],aComp[nX,2,nY,4]) //Busca numero da nota fiscal de entrada do fornecedor

				//Agrupa por fornecedor
				If (nPosFor := aScan(aPedidos,{|x| x[1]+x[2] == aComp[nX,2,nY,1]+aComp[nX,2,nY,2] })) == 0
					AADD(aPedidos,{aComp[nX,2,nY,1],aComp[nX,2,nY,2],{{ nRecno,aComp[nX,2,nY,6] }}})
				Else
					AADD(aPedidos[nPosFor,3],{ nRecno,aComp[nX,2,nY,6]})				 //RECNO ITEM
				Endif
			Next nY

			//Chamo funcao para gerar os pedidos de compra
			GeraPedido(aPedidos,oSay,@cLog)
			aPedidos := {}


		Next nX
	Endif

	//Volto filial original
	cFilAnt := cFilOri

	RestArea(aArea)
Return


//----------------------------------------------------------------------
//Gera Pedido de venda filial de origem para fornecedor
//----------------------------------------------------------------------
Static Function GeraPedido(aPedidos,oSay,cLog)

	Local nX 		:= 1
	Local nY 		:= 1
	Local nI		:= 1
	Local lOk		:= .F.
	Local cCond		:= ""
	Local aCabec 	:= {}
	Local aLinha	:= {}
	Local aItens	:= {}

	Private lMsErroAuto	:= .F.

	DbSelectArea("SD1")

	For nX := 1 to Len(aPedidos)

		cItem  := replicate("0", tamSX3("C7_ITEM")[1])

		For nY := 1 to Len(aPedidos[nX,3])

			//Posiciono no item que sera complementado
			SD1->(DbGoTo(aPedidos[nX,3,nY,1]))

			oSay:cCaption := ("Aguarde ...Gerando Pedido Compra Filial : " + cFilAnt +" Fornecedor :" + SD1->D1_FORNECE + " Loja :" + SD1->D1_LOJA	 )
			ProcessMessages()

			cCond := Posicione("SF1",1,xFilial("SF1")+SD1->D1_DOC+SD1->D1_SERIE+SD1->D1_FORNECE+SD1->D1_LOJA+SD1->D1_TIPO,"F1_COND")

			If Len(aCabec) == 0

				aCabec := {}
				aItens := {}

				//Preparo array de cabeçalho do pedido de compra
				aAdd(aCabec,{"C7_EMISSAO" ,dDataBase			,Nil})
				aAdd(aCabec,{"C7_FORNECE" ,SD1->D1_FORNECE		,Nil})
				aAdd(aCabec,{"C7_LOJA"    ,SD1->D1_LOJA			,Nil})
				aAdd(aCabec,{"C7_COND"    ,cCond				,Nil})
				aAdd(aCabec,{"C7_CONTATO" ,""					,Nil})
				aAdd(aCabec,{"C7_FILENT"  ,cFilAnt				,Nil})
			Endif

			aLinha := {}

			//Valido se ja existe item no array do pedido que com o mesmo valor unitario e agrupo se tiver
			For nI := 1 to Len(aItens)
				If aItens[nI,4,2] == SD1->D1_VUNIT
					aItens[nI,3,2] += aPedidos[nX,3,nY,2]
					aItens[nI,5,2] := aItens[nI,3,2] * aItens[nI,4,2]
					lOk := .T.
				Endif
			Next nI

			//Se nao existe no array add uma nova linha
			If !lOk

				cItem 		:= soma1(cItem)

				aAdd(aLinha,{"C7_ITEM"    ,cItem                  		 ,Nil})
				aAdd(aLinha,{"C7_PRODUTO" ,SD1->D1_COD					 ,Nil})
				aAdd(aLinha,{"C7_QUANT"   ,aPedidos[nX,3,nY,2]			 ,Nil})
				aAdd(aLinha,{"C7_PRECO"   ,SD1->D1_VUNIT				 ,Nil})
				aAdd(aLinha,{"C7_TOTAL"   ,SD1->D1_VUNIT * aPedidos[nX,3,nY,2] ,Nil})

				aAdd(aItens,aLinha)
			Endif

			lMsErroAuto	:= .F.

			lOk := .F.
		Next nY

		if Len(aItens) > 0
			MATA120(1,aCabec,aItens,3)

			If lMsErroAuto
				MostraErro()
			Else
				ConfirmSX8()

				cLog += "Pedido de compra complementar gerado: " + SC7->C7_NUM + " Filial: " + cFilAnt + CRLF
			Endif
		Endif

	Next nX

Return

//----------------------------------------------------------------------
//Valida exclusao de registro
//----------------------------------------------------------------------
User Function RCOM001EX()

	Local lRet 		 := .T.

	DbSelectArea("ZEN")
	DbSelectArea("ZEM")

	//Valida se ja gerou pedido
	ZEN->(DbSetOrder(1))
	If ZEN->(DbSeek(xFilial("ZEN")+ZEL->ZEL_CODIGO)) .AND. ZEN->ZEN_STATUS == "F"

		While ZEN->(!EOF()) ;
		.AND. ZEN->ZEN_FILIAL+ZEN->ZEN_CODIGO == xFilial("ZEL")+ZEL->ZEL_CODIGO

			If ZEN->ZEN_STATUS == "F"
				lRet := .F.
			Endif

			ZEN->(DbSkip())
		EndDo
	Endif

	//Valida se ja gerou pedido
	ZEM->(DbSetOrder(1))
	If ZEM->(DbSeek(xFilial("ZEM")+ZEL->ZEL_CODIGO)) .AND. ZEM->ZEM_STATUS == "F"

		While ZEM->(!EOF()) ;
		.AND. ZEM->ZEM_FILIAL+ZEM->ZEM_CODIGO == xFilial("ZEL")+ZEL->ZEL_CODIGO

			If ZEM->ZEM_STATUS == "F"
				lRet := .F.
			Endif

			ZEM->(DbSkip())
		EndDo
	Endif

	If !lRet
		Help( ,, 'Atenção',,'Apuracão com pedido de compra ou Devolução geradas não pode ser excluido! ', 1, 0 )
	Endif

Return lRet

