#include "protheus.ch" 
#include "fwmvcdef.ch"
#include "topconn.ch"

/*/{Protheus.doc} RFATA002
Contratos
@author TOTVS
@since 17/02/2017
@version P12
@param Nao recebe parametros            
@return nulo
/*/

/***********************/
User Function RFATA002()
/***********************/ 
             
Local oBrowse

Private aRotina := {}

oBrowse := FWmBrowse():New()
oBrowse:SetAlias("Z09")
oBrowse:SetDescription("Contratos")   
oBrowse:AddLegend("Z09_STATUS == 'A' .And. (Z09_DTFINA >= dDataBase .Or. Z09_RENAUT == .T.)", "GREEN",	"Ativo")
oBrowse:AddLegend("Z09_STATUS == 'R'"														, "BLUE",	"Reincidido")
oBrowse:AddLegend("Z09_STATUS == 'S'"														, "YELLOW",	"Suspenso")
oBrowse:AddLegend("Z09_STATUS == 'A' .And. Z09_DTFINA < dDataBase .And. Z09_RENAUT == .F."	, "RED",	"Finalizado")
oBrowse:Activate()

Return Nil

/************************/
Static Function MenuDef()
/************************/

Local aRotina 	:= {}

ADD OPTION aRotina Title "Visualizar" 						Action "VIEWDEF.RFATA002"	OPERATION 2 ACCESS 0
ADD OPTION aRotina Title "Incluir"    						Action "VIEWDEF.RFATA002"	OPERATION 3 ACCESS 0
ADD OPTION aRotina Title "Alterar"    						Action "VIEWDEF.RFATA002"	OPERATION 4 ACCESS 0
ADD OPTION aRotina Title "Excluir"    						Action "VIEWDEF.RFATA002"	OPERATION 5 ACCESS 0
ADD OPTION aRotina Title "Rescindir"    					Action "U_FATA002R()"		OPERATION 4 ACCESS 0
ADD OPTION aRotina Title "Suspender"   						Action "U_FATA002S()"		OPERATION 4 ACCESS 0
ADD OPTION aRotina Title "Retomar"   						Action "U_FATA002E()"		OPERATION 4 ACCESS 0
ADD OPTION aRotina Title "Banco de Conhecimento"			Action "MSDOCUMENT"			OPERATION 4 ACCESS 0
ADD OPTION aRotina Title "Legenda"     						Action "U_FATA002L()" 		OPERATION 7 ACCESS 0  

Return aRotina

/*************************/
Static Function ModelDef()
/*************************/

// Cria a estrutura a ser usada no Modelo de Dados
Local oStruZ09 := FWFormStruct(1,"Z09",/*bAvalCampo*/,/*lViewUsado*/ )
Local oStruZ10 := FWFormStruct(1,"Z10",/*bAvalCampo*/,/*lViewUsado*/ )
Local oStruZ11 := FWFormStruct(1,"Z11",/*bAvalCampo*/,/*lViewUsado*/ )      
Local oStruSE1 := U_DefStrModel("SE1")   
Local oStruSE2 := U_DefStrModel("SE2")   

Local oModel

// Cria o objeto do Modelo de Dados
oModel := MPFormModel():New("RFATP002",/*bPreValidacao*/,/*bPosValidacao*/,/*bCommit*/,/*bCancel*/ )

// Adiciona ao modelo uma estrutura de formulário de edição por campo
oModel:AddFields("Z09MASTER",/*cOwner*/,oStruZ09)

// Adiciona a chave primaria da tabela principal
oModel:SetPrimaryKey({"Z09_FILIAL","Z09_CODIGO"})

// Adiciona ao modelo uma estrutura de formulário de edição por grid
oModel:AddGrid("Z10DETAIL","Z09MASTER",oStruZ10,/*bLinePre*/,/*bLinePost*/{|oModelGrid| Z10LinPost(oModelGrid)},/*bPreVal*/,/*bPosVal*/,/*BLoad*/)
oModel:AddGrid("Z11DETAIL","Z10DETAIL",oStruZ11,/*bLinePre*/,/*bLinePost*/,/*bPreVal*/,/*bPosVal*/,/*BLoad*/)
oModel:AddGrid("SE1DETAIL","Z09MASTER",oStruSE1,/*bLinePre*/,/*bLinePost*/,/*bPreVal*/,/*bPosVal*/,/*BLoad*/) 
oModel:AddGrid("SE2DETAIL","Z09MASTER",oStruSE2,/*bLinePre*/,/*bLinePost*/,/*bPreVal*/,/*bPosVal*/,/*BLoad*/) 

oModel:GetModel('SE1DETAIL'):SetOnlyQuery()
oModel:GetModel('SE1DETAIL'):SetOnlyView()

oModel:GetModel('SE2DETAIL'):SetOnlyQuery()
oModel:GetModel('SE2DETAIL'):SetOnlyView()

// Faz relaciomaneto entre os compomentes do model
oModel:SetRelation("Z10DETAIL", {{"Z10_FILIAL", 'xFilial("Z10")'},{"Z10_CODIGO","Z09_CODIGO"}},Z10->(IndexKey(1)))
oModel:SetRelation("Z11DETAIL", {{"Z11_FILIAL", 'xFilial("Z10")'},{"Z11_CODIGO","Z09_CODIGO"},{"Z11_ITEMFI","Z10_ITEM"}},Z11->(IndexKey(1)))
oModel:SetRelation("SE1DETAIL", {{"E1_FILIAL" , 'xFilial("SE1")'},{"E1_XCONTRA","Z09_CODIGO"}},SE1->(IndexKey(30))) //E1_FILIAL+E1_XCONTRA
oModel:SetRelation("SE2DETAIL", {{"E2_FILIAL" , 'xFilial("SE2")'},{"E2_XCONTRA","Z09_CODIGO"}},SE2->(IndexKey(19))) //E2_FILIAL+E2_XCONTRA

// Desobriga a digitacao de ao menos um item
oModel:GetModel("SE1DETAIL"):SetOptional(.T.)
oModel:GetModel("SE2DETAIL"):SetOptional(.T.)

// Totalizadores
oModel:AddCalc("CALC1","Z09MASTER","SE1DETAIL","E1_NUM"  ,"QTD","COUNT",,,"Qtd. Títulos")
oModel:AddCalc("CALC1","Z09MASTER","SE1DETAIL","E1_VALOR","VLR","SUM",,,"Valor")
oModel:AddCalc("CALC1","Z09MASTER","SE1DETAIL","E1_SALDO","SLD","SUM",,,"Saldo")

oModel:AddCalc("CALC2","Z09MASTER","SE2DETAIL","E2_NUM"  ,"QTD","COUNT",,,"Qtd. Títulos")
oModel:AddCalc("CALC2","Z09MASTER","SE2DETAIL","E2_VALOR","VLR","SUM",,,"Valor")
oModel:AddCalc("CALC2","Z09MASTER","SE2DETAIL","E2_SALDO","SLD","SUM",,,"Saldo")

// Liga o controle de nao repeticao de linha
oModel:GetModel("Z11DETAIL"):SetUniqueLine({"Z11_CLIENT","Z11_LOJA"})

// Adiciona a descricao do Componente do Modelo de Dados
oModel:GetModel("Z09MASTER"):SetDescription("Contratos")
oModel:GetModel("Z10DETAIL"):SetDescription("Clausulas")
oModel:GetModel("Z11DETAIL"):SetDescription("Clientes X Clausula")
oModel:GetModel("SE1DETAIL"):SetDescription("Créditos")
oModel:GetModel("SE2DETAIL"):SetDescription("Títulos a Pagar")

//oModel:GetModel('SE1DETAIL'):SetNoInsertLine(.T.)
//oModel:GetModel('SE1DETAIL'):SetNoUpdateLine(.T.)

//oModel:GetModel('SE2DETAIL'):SetNoInsertLine(.T.)
//oModel:GetModel('SE2DETAIL'):SetNoUpdateLine(.T.)

Return oModel

/************************/
Static Function ViewDef()
/************************/

// Cria a estrutura a ser usada na View
Local oStruZ09 := FWFormStruct(2,"Z09")
Local oStruZ10 := FWFormStruct(2,"Z10")
Local oStruZ11 := FWFormStruct(2,"Z11")
Local oStruSE1 := U_DefStrView("SE1")
Local oStruSE2 := U_DefStrView("SE2")

// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
Local oModel   := FWLoadModel("RFATA002")
Local oView
Local oCalc1
Local oCalc2

// Remove campos da estrutura
oStruZ10:RemoveField('Z10_CODIGO')
oStruZ11:RemoveField('Z11_CODIGO')
oStruZ11:RemoveField('Z11_ITEMFI')

// Cria o objeto de View
oView := FWFormView():New()

// Define qual o Modelo de dados será utilizado
oView:SetModel(oModel)

// Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
oView:AddField("VIEW_Z09",oStruZ09,"Z09MASTER")

// Adiciona no nosso View um controle do tipo FormGrid(antiga newgetdados)
oView:AddGrid("VIEW_Z10",oStruZ10,"Z10DETAIL")
oView:AddGrid("VIEW_Z11",oStruZ11,"Z11DETAIL")
oView:AddGrid("VIEW_SE1",oStruSE1,"SE1DETAIL")
oView:AddGrid("VIEW_SE2",oStruSE2,"SE2DETAIL")

// Totalizadores
oCalc1 := FWCalcStruct(oModel:GetModel("CALC1"))
oView:AddField("VIEW_CALC1",oCalc1,"CALC1")

oCalc2 := FWCalcStruct(oModel:GetModel("CALC2"))
oView:AddField("VIEW_CALC2",oCalc2,"CALC2")

// Criar "box" horizontal para receber algum elemento da view
oView:CreateHorizontalBox("PAINEL GER", 100)

// Cria Folder na view
oView:CreateFolder("PASTAS","PAINEL GER")

// Cria pastas nas folders
oView:AddSheet("PASTAS","ABA01","Contrato")
oView:AddSheet("PASTAS","ABA02","Títulos")

oView:CreateHorizontalBox("PAINEL CONT",30,,,"PASTAS","ABA01")    
oView:CreateHorizontalBox("PAINEL CLAU",40,,,"PASTAS","ABA01")    
oView:CreateHorizontalBox("PAINEL CLIE",30,,,"PASTAS","ABA01")    

oView:CreateHorizontalBox("PAINEL FINP 1",35,,,"PASTAS","ABA02")    
oView:CreateHorizontalBox("PAINEL FINP 2",15,,,"PASTAS","ABA02")    
oView:CreateHorizontalBox("PAINEL FINR 1",35,,,"PASTAS","ABA02")    
oView:CreateHorizontalBox("PAINEL FINR 2",15,,,"PASTAS","ABA02")    

// Relaciona o ID da View com o "box" para exibicao
oView:SetOwnerView("VIEW_Z09","PAINEL CONT")
oView:SetOwnerView("VIEW_Z10","PAINEL CLAU")
oView:SetOwnerView("VIEW_Z11","PAINEL CLIE")
oView:SetOwnerView("VIEW_SE1","PAINEL FINP 1")
oView:SetOwnerView("VIEW_CALC1","PAINEL FINP 2")
oView:SetOwnerView("VIEW_SE2","PAINEL FINR 1")
oView:SetOwnerView("VIEW_CALC2","PAINEL FINR 2")

//oView:SetViewProperty('VIEW_SE1',"GRIDSEEK",{.T.})
//oView:SetViewProperty('VIEW_SE2',"GRIDSEEK",{.T.})

// Liga a identificacao do componente
oView:EnableTitleView("VIEW_Z09","Contrato")
oView:EnableTitleView("VIEW_Z10","Clausulas")
oView:EnableTitleView("VIEW_Z11","Clientes X Clausula")
oView:EnableTitleView("VIEW_SE1","Créditos")
oView:EnableTitleView("VIEW_SE2","Títulos a Pagar")

// Define campos que terao Auto Incremento
oView:AddIncrementField("VIEW_Z10","Z10_ITEM")
oView:AddIncrementField("VIEW_Z11","Z11_ITEM")

oView:AddUserButton("Apurar clausula eventual","",{|oView| ApurClauE()},,,{/*MODEL_OPERATION_INSERT,MODEL_OPERATION_UPDATE,*/MODEL_OPERATION_VIEW})

// Define fechamento da tela ao confirmar a operação
oView:SetCloseOnOk( {||.T.} )

// Habilito a barra de progresso na abertura da tela
oView:SetProgressBar(.T.)

Return oView                                           

/***********************/
User Function FATA002L()
/***********************/

BrwLegenda("Status do Contrato","Legenda",{{"BR_VERDE","Ativo"},{"BR_AZUL","Rescindido"},{"BR_AMARELO","Suspenso"},{"BR_VERMELHO","Finalizado"}})

Return

/********************************/
User Function DefStrModel(cAlias)
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
If cAlias == "SE1"
	aCampos	:= {"E1_PREFIXO","E1_NUM","E1_PARCELA","E1_TIPO","E1_NATUREZ","E1_CLIENTE","E1_LOJA","E1_NOMCLI","E1_EMISSAO","E1_VENCTO","E1_VENCREA",;
				"E1_VALOR","E1_SALDO","E1_BAIXA"}
Else
	aCampos	:= {"E2_PREFIXO","E2_NUM","E2_PARCELA","E2_TIPO","E2_NATUREZ","E2_FORNECE","E2_LOJA","E2_NOMFOR","E2_EMISSAO","E2_VENCTO","E2_VENCREA",;
				"E2_VALOR","E2_SALDO","E2_BAIXA"}
Endif

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

//--------
// Legenda
//--------

If cAlias == "SE1"
	bRelac := {|A,B,C| FWINITCPO(A,B,C),XRET:=(IIF(SE1->E1_SALDO <> 0,IIF(SE1->E1_VALOR > SE1->E1_SALDO .And. SE1->E1_SALDO > 0 ,"BR_AZUL","BR_VERDE"),"BR_VERMELHO")),FWCLOSECPO(A,B,C,.T.),FWSETVARMEM(A,B,XRET),XRET }
Else
	bRelac := {|A,B,C| FWINITCPO(A,B,C),XRET:=(IIF(SE2->E2_SALDO <> 0,IIF(SE2->E2_VALOR > SE2->E2_SALDO .And. SE2->E2_SALDO > 0 ,"BR_AZUL","BR_VERDE"),"BR_VERMELHO")),FWCLOSECPO(A,B,C,.T.),FWSETVARMEM(A,B,XRET),XRET }
Endif
oStruct:AddField('','','STATUS','C',11,0,,,{},.F.,bRelac,,,.T.)

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
User Function DefStrView(cAlias)
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

If cAlias == "SE1"
	aCampos	:= {"E1_PREFIXO","E1_NUM","E1_PARCELA","E1_TIPO","E1_NATUREZ","E1_CLIENTE","E1_LOJA","E1_NOMCLI","E1_EMISSAO","E1_VENCTO","E1_VENCREA",;
				"E1_VALOR","E1_SALDO","E1_BAIXA"}
Else
	aCampos	:= {"E2_PREFIXO","E2_NUM","E2_PARCELA","E2_TIPO","E2_NATUREZ","E2_FORNECE","E2_LOJA","E2_NOMFOR","E2_EMISSAO","E2_VENCTO","E2_VENCREA",;
				"E2_VALOR","E2_SALDO","E2_BAIXA"}
Endif

oStruct:AddField('STATUS',"01",'','',NIL,'GET','@BMP',,'',.F.,'','',{},1,'BR_VERDE',.T.)   

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

/*************************************/
Static Function Z10LinPost(oModelGrid) 
/*************************************/

Local lRet := .T.

Local oModel		:= FWModelActive()
Local oModelZ11 	:= oModel:GetModel("Z11DETAIL")

Local nOperation 	:= oModel:GetOperation()

Local cAplicacao	:= oModelGrid:GetValue("Z10_APLICA")
Local cPeriod		:= oModelGrid:GetValue("Z10_PERIOD")
Local cTpValor		:= oModelGrid:GetValue("Z10_TPVALO")
Local cGrpProd		:= oModelGrid:GetValue("Z10_GRUPO")
Local cProd			:= oModelGrid:GetValue("Z10_PRODUT")
Local nFxFina		:= oModelGrid:GetValue("Z10_FXFINA")
Local cTpFaix		:= oModelGrid:GetValue("Z10_TPFAIX")

Local nContFlag		:= 0

//Se a operação for inclusão ou alteração
If nOperation == MODEL_OPERATION_INSERT .OR. nOperation == MODEL_OPERATION_UPDATE

	If cAplicacao == "A" //Apuração
	
		If Empty(cPeriod)
			lRet := .F.
			Help(,,'Help',,"Cláusula com aplicação do tipo Apuração, é obrigatório informar a periodicidade.",1,0)
		Endif

		If lRet
		
			If Empty(cGrpProd) .And. Empty(cProd)
				lRet := .F.
				Help(,,'Help',,"É obrigatório selecionar o Grupo de Produto Ou Produto, somente um destes, para o tipo de aplicação Apuração.",1,0)
			Endif
		Endif
		
		If lRet
		
			If cTpValor == "R" //R$
				lRet := .F.
				Help(,,'Help',,"Cláusula com aplicação do tipo Apuração, o tipo valor dever ser igual a % (percentual).",1,0)
			Endif
		Endif
		
		If lRet
			
			For nI := 1 To oModelZ11:Length()
			
				oModelZ11:Goline(nI)  
			
				If !oModelZ11:IsDeleted()		
					
					If oModelZ11:GetValue('Z11_TITAPU') == "S"
						nContFlag++
					Endif
				Endif
			Next  
			
			oModelZ11:Goline(1)  
			
			If nContFlag == 0
				lRet := .F.
				Help(,,'Help',,"É obrigatório um dos clientes relacionados a cláusula, ser configurado para geração de Título no processo de apuração.",1,0)
			ElseIf nContFlag > 1
				lRet := .F.
				Help(,,'Help',,"Somente um dos clientes relacionados a cláusula, deve estar configurado para geração de Título no processo de apuração.",1,0)
			Endif            
		Endif
	Endif
	
	If lRet
	
		If cAplicacao == "F" //Faturamento
		
			If cTpValor == "R" //R$
				lRet := .F.
				Help(,,'Help',,"Cláusula com aplicação do tipo Faturamento, o tipo valor dever ser igual a % (percentual).",1,0)
			Endif

			If lRet
			
				If Empty(cGrpProd) .And. Empty(cProd)
					lRet := .F.
					Help(,,'Help',,"É obrigatório selecionar o Grupo de Produto Ou Produto, somente um destes, para o tipo de aplicação Faturamento.",1,0)
				Endif
			Endif
		Endif
	Endif
	
	If lRet
	
		If !Empty(cGrpProd) .And. !Empty(cProd)
			lRet := .F.
			Help(,,'Help',,"Pode-se selecionar o Grupo de Produto Ou Produto, somente um destes.",1,0)
		Endif
	Endif
	
	If lRet
	
		If nFxFina > 0 .And. cAplicacao <> "A" //Apuração
			lRet := .F.
			Help(,,'Help',,"Cláusula com faixa de valores informada, deve ter a aplicação como Apuração.",1,0)
		Endif
	Endif
Endif

Return lRet

/************************/
User Function Z10IncCli() 
/************************/

Local lRet 			:= .T.

Local oModel		:= FWModelActive()
Local nOperation 	:= oModel:GetOperation()

//Se a operação for inclusão ou alteração
If nOperation == MODEL_OPERATION_INSERT .OR. nOperation == MODEL_OPERATION_UPDATE

	If !Empty(M->Z09_ABRANG)
		U_RFATE001()
	Endif
Endif

Return lRet

/***********************/
User Function FATA002R()
/***********************/

Local lContinua := .T.

Do Case

	Case Z09->Z09_STATUS == "R" //Reincidido
		Help( ,, 'Reincidir',, 'O contrato já se encontra reincidido, operação não permitida.', 1, 0 )
		lContinua := .F.
		
	Case Z09_STATUS == 'A' .And. Z09_DTFINA < dDataBase .And. Z09_RENAUT == .F. //Finalizado
		Help( ,, 'Reincidir',, 'O contrato se encontra finalizado, operação não permitida.', 1, 0 )
		lContinua := .F.
EndCase

If lContinua

	If MsgYesNo("O contrato será reincidido, tendo suas ações comerciais canceladas, deseja continuar?")
		RecLock("Z09",.F.)
		Z09->Z09_STATUS := "R" //Reincidido
		Z09->(MsUnlock())
	Endif
Endif

Return

/***********************/
User Function FATA002S()
/***********************/

Local lContinua := .T.

Do Case

	Case Z09->Z09_STATUS == "S" //Suspenso
		Help( ,, 'Suspender',, 'O contrato já se encontra suspenso, operação não permitida.', 1, 0 )
		lContinua := .F.

	Case Z09->Z09_STATUS == "R" //Reincidido
		Help( ,, 'Suspender',, 'O contrato se encontra reincidido, operação não permitida.', 1, 0 )
		lContinua := .F.
		
	Case Z09_STATUS == 'A' .And. Z09_DTFINA < dDataBase .And. Z09_RENAUT == .F. //Finalizado
		Help( ,, 'Suspender',, 'O contrato se encontra finalizado, operação não permitida.', 1, 0 )
		lContinua := .F.
EndCase

If lContinua

	If MsgYesNo("O contrato será suspenso, tendo suas ações comerciais temporariamente canceladas, deseja continuar?")
		RecLock("Z09",.F.)
		Z09->Z09_STATUS := "S" //Suspenso
		Z09->(MsUnlock())
	Endif
Endif

Return

/***********************/
User Function FATA002E()
/***********************/

Local lContinua := .T.

Do Case

	Case Z09_STATUS == 'A' .And. (Z09_DTFINA >= dDataBase .Or. Z09_RENAUT == .T.) //Ativo
		Help( ,, 'Retomar',, 'O contrato já se encontra ativo, operação não permitida.', 1, 0 )
		lContinua := .F.

	Case Z09->Z09_STATUS == "R" //Reincidido
		Help( ,, 'Retomar',, 'O contrato se encontra reincidido, operação não permitida.', 1, 0 )
		lContinua := .F.
		
	Case Z09_STATUS == 'A' .And. Z09_DTFINA < dDataBase .And. Z09_RENAUT == .F. //Finalizado
		Help( ,, 'Retomar',, 'O contrato se encontra finalizado, operação não permitida.', 1, 0 )
		lContinua := .F.
EndCase

If lContinua

	If MsgYesNo("O contrato será retomado, deseja continuar?")
		RecLock("Z09",.F.)
		Z09->Z09_STATUS := "A" //Ativo
		Z09->(MsUnlock())
	Endif
Endif

Return

/**************************/
Static Function ApurClauE()
/**************************/

Local lContinua 	:= .T.
Local lRet			:= .T.

Local oModel		:= FWModelActive()    
Local oModelZ10 	:= oModel:GetModel("Z10DETAIL")
Local oModelZ11 	:= oModel:GetModel("Z11DETAIL")

Local cItClausu		:= oModelZ10:GetValue("Z10_ITEM")
Local cAplicacao	:= oModelZ10:GetValue("Z10_APLICA")
Local cStatus		:= oModelZ10:GetValue("Z10_STATUS")

Local aColunas 		:= StrTokArr("Z11_ITEM,Z11_CLIENT,Z11_LOJA,Z11_NOME,Z11_CGC",",")
Local aDados		:= {}        

Local aCampos		:= {{"OK","C",02,0},{"COL1","C",02,0},{"COL2","C",06,0},{"COL3","C",02,0},{"COL4","C",40,0},{"COL5","C",14,0}} 
Local aCampos2		:= {{"OK","","",""},{"COL1","","Item",""},{"COL2","","Cliente",""},{"COL3","","Loja",""},{"COL4","","Nome",""},;
						{"COL5","","CGC",""}} 

Local nI

Private cRet		:= ""
Private cArqTrab	:= CriaTrab(aCampos) // Criando arquivo temporario

Private oDlg
Private oMark     
Private cMarca	 	:= "mk"
Private lImpFechar	:= .F.

Private oSay1,oSay2,oSay3
Private nCont		:= 0   

Private cInf 		:= ""

Private oDlg

If cAplicacao == "A" .Or. cAplicacao == "F" //Apuração Ou Faturamento
	Help( ,, 'Apurar clausula',, 'O tipo de aplicação referente a cláusula selecionada, não é do tipo EVENTUAL, operação não permitida.', 1, 0 )
	lContinua := .F.
Endif

If lContinua

	If cStatus <> "A" //Diferente de Clásula ativa
		Help( ,, 'Apurar clausula',, 'A cláusula se encontra inativa, operação cancelada.', 1, 0 )
		lContinua := .F.
	Endif
Endif

If lContinua
	
	If Empty(Z09->Z09_TITFIN)
		Help( ,, 'Apurar clausula',, 'O tipo de título a ser gerado não foi informado, operação cancelada.', 1, 0 )
		lContinua := .F.
	Endif
Endif

If lContinua

	Do Case
	
		Case Z09->Z09_STATUS == "S" //Suspenso
			Help( ,, 'Apurar clausula',, 'O contrato se encontra suspenso, operação não permitida.', 1, 0 )
			lContinua := .F.
	
		Case Z09->Z09_STATUS == "R" //Reincidido
			Help( ,, 'Apurar clausula',, 'O contrato se encontra reincidido, operação não permitida.', 1, 0 )
			lContinua := .F.
			
		Case Z09->Z09_STATUS == 'A' .And. Z09->Z09_DTFINA < dDataBase .And. Z09->Z09_RENAUT == .F. //Finalizado
			Help( ,, 'Apurar clausula',, 'O contrato se encontra finalizado, operação não permitida.', 1, 0 )
			lContinua := .F.
	EndCase
Endif

If lContinua

	If MsgYesNo("Será realizada apuração da cláusula ("+cItClausu+") selecionada, deseja continuar?")

		For nI := 1 To oModelZ11:Length()
		
			oModelZ11:Goline(nI)  
		
			If !oModelZ11:IsDeleted()		
				AAdd(aDados,{oModelZ11:GetValue('Z11_ITEM'),oModelZ11:GetValue('Z11_CLIENT'),oModelZ11:GetValue('Z11_LOJA'),;
					oModelZ11:GetValue('Z11_NOME'),oModelZ11:GetValue('Z11_CGC')})
			Endif
		Next  
		
		oModelZ11:Goline(1)              
		
		DBUseArea(.T.,,cArqTrab,"TRBAUX",If(.F. .OR. .F., !.F., NIL), .F.)  // Criando Alias para o arquivo temporario
		
		DbSelectArea("TRBAUX")
		
		If Len(aDados) > 0
			For nI := 1 to Len(aDados)
				TRBAUX->(RecLock("TRBAUX",.T.))
				TRBAUX->OK := "  "
				TRBAUX->COL1 := aDados[nI][1]
				TRBAUX->COL2 := aDados[nI][2]
				TRBAUX->COL3 := aDados[nI][3]
				TRBAUX->COL4 := aDados[nI][4]
				TRBAUX->COL5 := aDados[nI][5]
				TRBAUX->(MsUnlock())
			Next                     
		Else
			TRBAUX->(RecLock("TRBAUX",.T.))
			TRBAUX->OK		:= "  "
			TRBAUX->COL1	:= Space(2)
			TRBAUX->COL2 	:= Space(6)
			TRBAUX->COL3 	:= Space(2)
			TRBAUX->COL4 	:= Space(40)
			TRBAUX->COL5 	:= Space(14)
			TRBAUX->(MsUnlock())
		Endif
		
		TRBAUX->(DbGoTop())
			
		DEFINE MSDIALOG oDlg TITLE "Seleção Clientes" From 000,000 TO 450,700 COLORS 0, 16777215 PIXEL
		
		//Browse
		oMark := MsSelect():New("TRBAUX","OK","",aCampos2,,@cMarca,{010,005,190,348})
		oMark:bMark 				:= {||MarcaIt()}
		oMark:oBrowse:LCANALLMARK 	:= .T.
		oMark:oBrowse:LHASMARK    	:= .T.
		oMark:oBrowse:bAllMark 		:= {||MarcaT()}
		
		@ 193, 005 SAY oSay1 PROMPT "Total de registros selecionados:" SIZE 200, 007 OF oDlg COLORS 0, 16777215 PIXEL
		@ 193, 090 SAY oSay2 PROMPT cValToChar(nCont) SIZE 040, 007 OF oDlg COLORS 0, 16777215 PIXEL
		
		//Linha horizontal
		@ 203, 005 SAY oSay3 PROMPT Repl("_",342) SIZE 342, 007 OF oDlg COLORS CLR_GRAY, 16777215 PIXEL
		
		@ 213, 272 BUTTON oButton2 PROMPT "Confirmar" SIZE 040, 010 OF oDlg ACTION ConfSelCli() PIXEL  
		@ 213, 317 BUTTON oButton3 PROMPT "Fechar" SIZE 030, 010 OF oDlg ACTION FechSelCli() PIXEL    
		
		ACTIVATE MSDIALOG oDlg CENTERED VALID lImpFechar //impede o usuario fechar a janela atraves do [X]
		
		Return
	Endif
Endif

Return

/***************************/
Static Function ConfSelCli()
/***************************/

Local aClientes 	:= {}
Local lRet	

Local oModel		:= FWModelActive() 
Local oModelZ10 	:= oModel:GetModel("Z10DETAIL")
Local cItClausu		:= oModelZ10:GetValue("Z10_ITEM")
Local cAplicacao	:= oModelZ10:GetValue("Z10_APLICA")
Local nVlApli		:= oModelZ10:GetValue("Z10_VLAPLI")

TRBAUX->(DbGoTop())

While TRBAUX->(!EOF())
	
	If TRBAUX->OK == "mk" .And. !Empty(TRBAUX->COL2)
		AAdd(aClientes,{TRBAUX->COL2,TRBAUX->COL3,TRBAUX->COL5})	
	Endif
	
	TRBAUX->(DbSkip())
EndDo

If Len(aClientes) > 0

	MsgRun("Realizando apuração da cláusula...","Aguarde",{|| lRet := U_RFATE003(Z09->Z09_CODIGO,Z09->Z09_TITFIN,Z09->Z09_NATTIT,cItClausu,nVlApli,aClientes)})
	
	If lRet
		MsgInfo("Processamento concluído.","Aviso")
	Else
		MsgInfo("Erro no processamento.","Aviso")
	Endif
	
	FechSelCli()
Else
	MsgInfo("Nenhum registro selecionado.","Aviso")
Endif

Return

/***************************/
Static Function FechSelCli()
/***************************/

lImpFechar := .T.           

If Select("TRBAUX") > 0
	TRBAUX->(DbCloseArea()) 
Endif	

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Apagando arquivo temporario ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

FErase(cArqTrab + GetDBExtension())
FErase(cArqTrab + OrdBagExt())          

oDlg:End()

Return

/************************/
Static Function MarcaIt()
/************************/

If TRBAUX->OK == "mk"
	nCont++
Else
	--nCont
Endif

oSay2:Refresh()

Return

/************************/
Static Function MarcaT()
/************************/

Local lMarca 	:= .F.
Local lNMarca 	:= .F. 

nCont := 0

TRBAUX->(DbGoTop())      

While TRBAUX->(!EOF())

	If TRBAUX->OK == "mk" .And. !lMarca
		RecLock("TRBAUX",.F.)
		TRBAUX->OK := "  "
		TRBAUX->(MsUnlock())
		lNMarca := .T.
	Else  

		If !lNMarca	
			RecLock("TRBAUX",.F.)
			TRBAUX->OK := "mk"
			TRBAUX->(MsUnlock())
			nCont++                     
			lMarca := .T.
		Endif
	Endif
	
    TRBAUX->(dbSkip())
EndDo

TRBAUX->(dbGoTop())

oSay2:Refresh()

Return