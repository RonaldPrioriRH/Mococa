#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'FWMVCDEF.CH'
#INCLUDE "rwmake.ch"
#INCLUDE "topconn.ch"

/*/{Protheus.doc} RFINA003

Cadastro de Metas de Vendas Comissão

@author Danilo Brito
@since 16/02/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

User Function RFINA003()

	Local oBrowse

	Private aRotina
	Private cCadastro := 'Cadastro de Metas de Vendas Comissão'

	DbSelectArea("Z04")
	DbSelectArea("Z05")

	oBrowse := FWmBrowse():New()
	oBrowse:SetAlias( 'Z04' )
	oBrowse:SetDescription( cCadastro )
	
	oBrowse:Activate()

Return

//-------------------------------------------------------------------
// Definicao do Menu
//-------------------------------------------------------------------
Static Function MenuDef()

	aRotina := {}

	ADD OPTION aRotina TITLE 'Visualizar'      ACTION 'VIEWDEF.RFINA003' OPERATION 2 ACCESS 0
	ADD OPTION aRotina TITLE 'Incluir'         ACTION 'VIEWDEF.RFINA003' OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar'         ACTION 'VIEWDEF.RFINA003' OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE 'Excluir'         ACTION 'VIEWDEF.RFINA003' OPERATION 5 ACCESS 0
	ADD OPTION aRotina TITLE 'Copiar'          ACTION 'VIEWDEF.RFINA003' OPERATION 9 ACCESS 0
	ADD OPTION aRotina TITLE 'Importar'        ACTION 'U_FIN03IMP()' 	 OPERATION 3 ACCESS 0
	
Return aRotina

//-------------------------------------------------------------------
// Define Modelo de Dados
//-------------------------------------------------------------------
Static Function ModelDef()

	// Cria a estrutura a ser usada no Modelo de Dados
	Local oStruZ04  := FWFormStruct( 1, 'Z04', /*bAvalCampo*/,/*lViewUsado*/ )
	Local oStruZ05  := FWFormStruct( 1, 'Z05', /*bAvalCampo*/,/*lViewUsado*/ )
	Local oModel, aCpNoCopy
	
	// Cria o objeto do Modelo de Dados
	oModel := MPFormModel():New('RFINP003', /*bPreValidacao*/, /*bPosValidacao*/, /*bCommit*/, /*bCancel*/ )
	
	// Adiciona ao modelo uma estrutura de formulario de edicao por campo
	oModel:AddFields( 'Z04MASTER', /*cOwner*/, oStruZ04, /*bPreValidacao*/, /*bPosValidacao*/, /*bCarga*/ )
	
	// Adiciona a chave primaria da tabela principal
	oModel:SetPrimaryKey({ "Z04_FILIAL", "Z04_VEND", "Z04_ANO" })
	
	//define campos que NAO serao copiados
	aCpNoCopy := { 'Z04_NOME'}
	oModel:GetModel( 'Z04MASTER' ):SetFldNoCopy(aCpNoCopy)
	
	// Adiciona a descricao do Modelo de Dados
	oModel:SetDescription( 'Metas de Vendas Comissão' )
	
	
	//-------------- JANEIRO ---------------------------------\\
	// Adiciona ao modelo uma componente de grid 
	oModel:AddGrid( 'Z05DET01', 'Z04MASTER', oStruZ05 , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	
	// Faz relacionamento entre os componentes do model
	oModel:SetRelation( 'Z05DET01', { {'Z05_FILIAL', 'xFilial( "Z05" )'}, {'Z05_VEND', 'Z04_VEND'}, {'Z05_ANO', 'Z04_ANO'}, {'Z05_MES', '"01"'} }, Z05->( IndexKey( 1 ) ) )
	
	// Liga o controle de nao repeticao de linha
	oModel:GetModel( 'Z05DET01' ):SetUniqueLine( { 'Z05_PROD', 'Z05_GRUPO' } )
	
	// Adiciona a descrição dos Componentes do Modelo de Dados
	oModel:GetModel( 'Z05DET01' ):SetDescription( 'Metas de Janeiro' )
	
	// Tira obrigatoriedade de campos	
	oModel:GetModel( 'Z05DET01' ):SetOptional(.T.)
	
	//-------------- FEVEREIRO ---------------------------------\\
	// Adiciona ao modelo uma componente de grid  
	oModel:AddGrid( 'Z05DET02', 'Z04MASTER', oStruZ05 , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	
	// Faz relacionamento entre os componentes do model
	oModel:SetRelation( 'Z05DET02', { {'Z05_FILIAL', 'xFilial( "Z05" )'}, {'Z05_VEND', 'Z04_VEND'}, {'Z05_ANO', 'Z04_ANO'}, {'Z05_MES', '"02"'} }, Z05->( IndexKey( 1 ) ) )
	
	// Liga o controle de nao repeticao de linha
	oModel:GetModel( 'Z05DET02' ):SetUniqueLine( { 'Z05_PROD', 'Z05_GRUPO' } )
	
	// Adiciona a descrição dos Componentes do Modelo de Dados
	oModel:GetModel( 'Z05DET02' ):SetDescription( 'Metas de Fevereiro' )
	
	// Tira obrigatoriedade de campos	
	oModel:GetModel( 'Z05DET02' ):SetOptional(.T.)
	
	//-------------- MARÇO ---------------------------------\\	
	// Adiciona ao modelo uma componente de grid  
	oModel:AddGrid( 'Z05DET03', 'Z04MASTER', oStruZ05 , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	
	// Faz relacionamento entre os componentes do model
	oModel:SetRelation( 'Z05DET03', { {'Z05_FILIAL', 'xFilial( "Z05" )'}, {'Z05_VEND', 'Z04_VEND'}, {'Z05_ANO', 'Z04_ANO'}, {'Z05_MES', '"03"'} }, Z05->( IndexKey( 1 ) ) )
	
	// Liga o controle de nao repeticao de linha
	oModel:GetModel( 'Z05DET03' ):SetUniqueLine( { 'Z05_PROD', 'Z05_GRUPO' } )
	
	// Adiciona a descrição dos Componentes do Modelo de Dados
	oModel:GetModel( 'Z05DET03' ):SetDescription( 'Metas de Março' )
	
	// Tira obrigatoriedade de campos	
	oModel:GetModel( 'Z05DET03' ):SetOptional(.T.)
	
	//-------------- ABRIL ---------------------------------\\
	// Adiciona ao modelo uma componente de grid  
	oModel:AddGrid( 'Z05DET04', 'Z04MASTER', oStruZ05 , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	
	// Faz relacionamento entre os componentes do model
	oModel:SetRelation( 'Z05DET04', { {'Z05_FILIAL', 'xFilial( "Z05" )'}, {'Z05_VEND', 'Z04_VEND'}, {'Z05_ANO', 'Z04_ANO'}, {'Z05_MES', '"04"'} }, Z05->( IndexKey( 1 ) ) )
	
	// Liga o controle de nao repeticao de linha
	oModel:GetModel( 'Z05DET04' ):SetUniqueLine( { 'Z05_PROD', 'Z05_GRUPO' } )
	
	// Adiciona a descrição dos Componentes do Modelo de Dados
	oModel:GetModel( 'Z05DET04' ):SetDescription( 'Metas de Abril' )
	
	// Tira obrigatoriedade de campos	
	oModel:GetModel( 'Z05DET04' ):SetOptional(.T.)
	
	//-------------- MAIO ---------------------------------\\
	// Adiciona ao modelo uma componente de grid  
	oModel:AddGrid( 'Z05DET05', 'Z04MASTER', oStruZ05 , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	
	// Faz relacionamento entre os componentes do model
	oModel:SetRelation( 'Z05DET05', { {'Z05_FILIAL', 'xFilial( "Z05" )'}, {'Z05_VEND', 'Z04_VEND'}, {'Z05_ANO', 'Z04_ANO'}, {'Z05_MES', '"05"'} }, Z05->( IndexKey( 1 ) ) )
	
	// Liga o controle de nao repeticao de linha
	oModel:GetModel( 'Z05DET05' ):SetUniqueLine( { 'Z05_PROD', 'Z05_GRUPO' } )
	
	// Adiciona a descrição dos Componentes do Modelo de Dados
	oModel:GetModel( 'Z05DET05' ):SetDescription( 'Metas de Maio' )
	
	// Tira obrigatoriedade de campos	
	oModel:GetModel( 'Z05DET05' ):SetOptional(.T.)
	
	//-------------- JUNHO ---------------------------------\\
	// Adiciona ao modelo uma componente de grid  
	oModel:AddGrid( 'Z05DET06', 'Z04MASTER', oStruZ05 , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	
	// Faz relacionamento entre os componentes do model
	oModel:SetRelation( 'Z05DET06', { {'Z05_FILIAL', 'xFilial( "Z05" )'}, {'Z05_VEND', 'Z04_VEND'}, {'Z05_ANO', 'Z04_ANO'}, {'Z05_MES', '"06"'} }, Z05->( IndexKey( 1 ) ) )
	
	// Liga o controle de nao repeticao de linha
	oModel:GetModel( 'Z05DET06' ):SetUniqueLine( { 'Z05_PROD', 'Z05_GRUPO' } )
	
	// Adiciona a descrição dos Componentes do Modelo de Dados
	oModel:GetModel( 'Z05DET06' ):SetDescription( 'Metas de Junho' )
	
	// Tira obrigatoriedade de campos	
	oModel:GetModel( 'Z05DET06' ):SetOptional(.T.)
	
	//-------------- JULHO ---------------------------------\\
	// Adiciona ao modelo uma componente de grid  
	oModel:AddGrid( 'Z05DET07', 'Z04MASTER', oStruZ05 , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	
	// Faz relacionamento entre os componentes do model
	oModel:SetRelation( 'Z05DET07', { {'Z05_FILIAL', 'xFilial( "Z05" )'}, {'Z05_VEND', 'Z04_VEND'}, {'Z05_ANO', 'Z04_ANO'}, {'Z05_MES', '"07"'} }, Z05->( IndexKey( 1 ) ) )
	
	// Liga o controle de nao repeticao de linha
	oModel:GetModel( 'Z05DET07' ):SetUniqueLine( { 'Z05_PROD', 'Z05_GRUPO' } )
	
	// Adiciona a descrição dos Componentes do Modelo de Dados
	oModel:GetModel( 'Z05DET07' ):SetDescription( 'Metas de Julho' )
	
	// Tira obrigatoriedade de campos	
	oModel:GetModel( 'Z05DET07' ):SetOptional(.T.)
	
	//-------------- AGOSTO ---------------------------------\\
	// Adiciona ao modelo uma componente de grid  
	oModel:AddGrid( 'Z05DET08', 'Z04MASTER', oStruZ05 , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	
	// Faz relacionamento entre os componentes do model
	oModel:SetRelation( 'Z05DET08', { {'Z05_FILIAL', 'xFilial( "Z05" )'}, {'Z05_VEND', 'Z04_VEND'}, {'Z05_ANO', 'Z04_ANO'}, {'Z05_MES', '"08"'} }, Z05->( IndexKey( 1 ) ) )
	
	// Liga o controle de nao repeticao de linha
	oModel:GetModel( 'Z05DET08' ):SetUniqueLine( { 'Z05_PROD', 'Z05_GRUPO' } )
	
	// Adiciona a descrição dos Componentes do Modelo de Dados
	oModel:GetModel( 'Z05DET08' ):SetDescription( 'Metas de Agosto' )
	
	// Tira obrigatoriedade de campos	
	oModel:GetModel( 'Z05DET08' ):SetOptional(.T.)
	
	//-------------- SETEMBRO ---------------------------------\\
	// Adiciona ao modelo uma componente de grid  
	oModel:AddGrid( 'Z05DET09', 'Z04MASTER', oStruZ05 , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	
	// Faz relacionamento entre os componentes do model
	oModel:SetRelation( 'Z05DET09', { {'Z05_FILIAL', 'xFilial( "Z05" )'}, {'Z05_VEND', 'Z04_VEND'}, {'Z05_ANO', 'Z04_ANO'}, {'Z05_MES', '"09"'} }, Z05->( IndexKey( 1 ) ) )
	
	// Liga o controle de nao repeticao de linha
	oModel:GetModel( 'Z05DET09' ):SetUniqueLine( { 'Z05_PROD', 'Z05_GRUPO' } )
	
	// Adiciona a descrição dos Componentes do Modelo de Dados
	oModel:GetModel( 'Z05DET09' ):SetDescription( 'Metas de Setembro' )
	
	// Tira obrigatoriedade de campos	
	oModel:GetModel( 'Z05DET09' ):SetOptional(.T.)
	
	//-------------- OUTUBRO ---------------------------------\\
	// Adiciona ao modelo uma componente de grid  
	oModel:AddGrid( 'Z05DET10', 'Z04MASTER', oStruZ05 , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	
	// Faz relacionamento entre os componentes do model
	oModel:SetRelation( 'Z05DET10', { {'Z05_FILIAL', 'xFilial( "Z05" )'}, {'Z05_VEND', 'Z04_VEND'}, {'Z05_ANO', 'Z04_ANO'}, {'Z05_MES', '"10"'} }, Z05->( IndexKey( 1 ) ) )
	
	// Liga o controle de nao repeticao de linha
	oModel:GetModel( 'Z05DET10' ):SetUniqueLine( { 'Z05_PROD', 'Z05_GRUPO' } )
	
	// Adiciona a descrição dos Componentes do Modelo de Dados
	oModel:GetModel( 'Z05DET10' ):SetDescription( 'Metas de Outubro' )
	
	// Tira obrigatoriedade de campos	
	oModel:GetModel( 'Z05DET10' ):SetOptional(.T.)
	
	//-------------- NOVEMBRO ---------------------------------\\
	// Adiciona ao modelo uma componente de grid  
	oModel:AddGrid( 'Z05DET11', 'Z04MASTER', oStruZ05 , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	
	// Faz relacionamento entre os componentes do model
	oModel:SetRelation( 'Z05DET11', { {'Z05_FILIAL', 'xFilial( "Z05" )'}, {'Z05_VEND', 'Z04_VEND'}, {'Z05_ANO', 'Z04_ANO'}, {'Z05_MES', '"11"'} }, Z05->( IndexKey( 1 ) ) )
	
	// Liga o controle de nao repeticao de linha
	oModel:GetModel( 'Z05DET11' ):SetUniqueLine( { 'Z05_PROD', 'Z05_GRUPO' } )
	
	// Adiciona a descrição dos Componentes do Modelo de Dados
	oModel:GetModel( 'Z05DET11' ):SetDescription( 'Metas de Novembro' )
	
	// Tira obrigatoriedade de campos	
	oModel:GetModel( 'Z05DET11' ):SetOptional(.T.)
	
	//-------------- DEZEMBRO ---------------------------------\\
	// Adiciona ao modelo uma componente de grid  
	oModel:AddGrid( 'Z05DET12', 'Z04MASTER', oStruZ05 , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	
	// Faz relacionamento entre os componentes do model
	oModel:SetRelation( 'Z05DET12', { {'Z05_FILIAL', 'xFilial( "Z05" )'}, {'Z05_VEND', 'Z04_VEND'}, {'Z05_ANO', 'Z04_ANO'}, {'Z05_MES', '"12"'} }, Z05->( IndexKey( 1 ) ) )
	
	// Liga o controle de nao repeticao de linha
	oModel:GetModel( 'Z05DET12' ):SetUniqueLine( { 'Z05_PROD', 'Z05_GRUPO' } )
	                   
	// Adiciona a descrição dos Componentes do Modelo de Dados
	oModel:GetModel( 'Z05DET12' ):SetDescription( 'Metas de Dezembro' )
	                    
	// Tira obrigatoriedade de campos	
	oModel:GetModel( 'Z05DET12' ):SetOptional(.T.)
	
Return oModel
 

//-------------------------------------------------------------------
// Define camada de Visão
//-------------------------------------------------------------------
Static Function ViewDef()

	// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
	Local oModel   := FWLoadModel( 'RFINA003' )
	Local oView
	
	// Cria a estrutura a ser usada na View
	Local oStruZ04 := FWFormStruct( 2, 'Z04' )
	Local oStruZ05 := FWFormStruct( 2, 'Z05' )
	
	// Remove campos da estrutura
	oStruZ05:RemoveField( 'Z05_VEND' )
	oStruZ05:RemoveField( 'Z05_ANO' )
	oStruZ05:RemoveField( 'Z05_MES' )
	
	// Cria o objeto de View
	oView := FWFormView():New()
	
	// Define qual o Modelo de dados ser· utilizado
	oView:SetModel( oModel )
	
	//Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
	oView:AddField( 'VIEW_Z04', oStruZ04, 'Z04MASTER' )
	
	//Adiciona no nosso View um controle do tipo Grid (antiga Getdados)
	oView:AddGrid( 'VIEW_Z0501', oStruZ05, 'Z05DET01' )
	oView:AddGrid( 'VIEW_Z0502', oStruZ05, 'Z05DET02' )
	oView:AddGrid( 'VIEW_Z0503', oStruZ05, 'Z05DET03' )
	oView:AddGrid( 'VIEW_Z0504', oStruZ05, 'Z05DET04' )
	oView:AddGrid( 'VIEW_Z0505', oStruZ05, 'Z05DET05' )
	oView:AddGrid( 'VIEW_Z0506', oStruZ05, 'Z05DET06' )
	oView:AddGrid( 'VIEW_Z0507', oStruZ05, 'Z05DET07' )
	oView:AddGrid( 'VIEW_Z0508', oStruZ05, 'Z05DET08' )
	oView:AddGrid( 'VIEW_Z0509', oStruZ05, 'Z05DET09' )
	oView:AddGrid( 'VIEW_Z0510', oStruZ05, 'Z05DET10' )
	oView:AddGrid( 'VIEW_Z0511', oStruZ05, 'Z05DET11' )
	oView:AddGrid( 'VIEW_Z0512', oStruZ05, 'Z05DET12' )
	
	// Define campos que terao Auto Incremento
	oView:AddIncrementField( 'VIEW_Z0501', 'Z05_ITEM' )
	oView:AddIncrementField( 'VIEW_Z0502', 'Z05_ITEM' )
	oView:AddIncrementField( 'VIEW_Z0503', 'Z05_ITEM' )
	oView:AddIncrementField( 'VIEW_Z0504', 'Z05_ITEM' )
	oView:AddIncrementField( 'VIEW_Z0505', 'Z05_ITEM' )
	oView:AddIncrementField( 'VIEW_Z0506', 'Z05_ITEM' )
	oView:AddIncrementField( 'VIEW_Z0507', 'Z05_ITEM' )
	oView:AddIncrementField( 'VIEW_Z0508', 'Z05_ITEM' )
	oView:AddIncrementField( 'VIEW_Z0509', 'Z05_ITEM' )
	oView:AddIncrementField( 'VIEW_Z0510', 'Z05_ITEM' )
	oView:AddIncrementField( 'VIEW_Z0511', 'Z05_ITEM' )
	oView:AddIncrementField( 'VIEW_Z0512', 'Z05_ITEM' )
	
	// Cria um "box" horizontal para receber cada elemento da view
	oView:CreateHorizontalBox( 'SUPERIOR'	, 20 )
	oView:CreateHorizontalBox( 'INFERIOR'	, 80 )

	// Cria Folder na view
	oView:CreateFolder( 'PASTAS', 'INFERIOR')
	
	// Cria pastas na parte inferior da tela - Itens
	oView:AddSheet('PASTAS', 'ABA01', 'Janeiro')
	oView:AddSheet('PASTAS', 'ABA02', 'Fevereiro')
	oView:AddSheet('PASTAS', 'ABA03', 'Março')
	oView:AddSheet('PASTAS', 'ABA04', 'Abril')
	oView:AddSheet('PASTAS', 'ABA05', 'Maio')
	oView:AddSheet('PASTAS', 'ABA06', 'Junho')
	oView:AddSheet('PASTAS', 'ABA07', 'Julho')
	oView:AddSheet('PASTAS', 'ABA08', 'Agosto')
	oView:AddSheet('PASTAS', 'ABA09', 'Setembro')
	oView:AddSheet('PASTAS', 'ABA10', 'Outubro')
	oView:AddSheet('PASTAS', 'ABA11', 'Novembro')
	oView:AddSheet('PASTAS', 'ABA12', 'Dezembro')
	
	oView:CreateHorizontalBox( 'JAN', 100,,,'PASTAS', 'ABA01')
	oView:CreateHorizontalBox( 'FEV', 100,,,'PASTAS', 'ABA02')
	oView:CreateHorizontalBox( 'MAR', 100,,,'PASTAS', 'ABA03')
	oView:CreateHorizontalBox( 'ABR', 100,,,'PASTAS', 'ABA04')
	oView:CreateHorizontalBox( 'MAI', 100,,,'PASTAS', 'ABA05')
	oView:CreateHorizontalBox( 'JUN', 100,,,'PASTAS', 'ABA06')
	oView:CreateHorizontalBox( 'JUL', 100,,,'PASTAS', 'ABA07')
	oView:CreateHorizontalBox( 'AGO', 100,,,'PASTAS', 'ABA08')
	oView:CreateHorizontalBox( 'SET', 100,,,'PASTAS', 'ABA09')
	oView:CreateHorizontalBox( 'OUT', 100,,,'PASTAS', 'ABA10')
	oView:CreateHorizontalBox( 'NOV', 100,,,'PASTAS', 'ABA11')
	oView:CreateHorizontalBox( 'DEZ', 100,,,'PASTAS', 'ABA12')
	
	// Relaciona o identificador (ID) da View com o "box" para exibição
	oView:SetOwnerView( 'VIEW_Z04', 'SUPERIOR' )
	oView:SetOwnerView( 'VIEW_Z0501', 'JAN' )
	oView:SetOwnerView( 'VIEW_Z0502', 'FEV' )
	oView:SetOwnerView( 'VIEW_Z0503', 'MAR' )
	oView:SetOwnerView( 'VIEW_Z0504', 'ABR' )
	oView:SetOwnerView( 'VIEW_Z0505', 'MAI' )
	oView:SetOwnerView( 'VIEW_Z0506', 'JUN' )
	oView:SetOwnerView( 'VIEW_Z0507', 'JUL' )
	oView:SetOwnerView( 'VIEW_Z0508', 'AGO' )
	oView:SetOwnerView( 'VIEW_Z0509', 'SET' )
	oView:SetOwnerView( 'VIEW_Z0510', 'OUT' )
	oView:SetOwnerView( 'VIEW_Z0511', 'NOV' )
	oView:SetOwnerView( 'VIEW_Z0512', 'DEZ' )
	
	// titulo dos componentes
	oView:EnableTitleView('VIEW_Z0501' , /*'item'*/)
	oView:EnableTitleView('VIEW_Z0502' , /*'item'*/)
	oView:EnableTitleView('VIEW_Z0503' , /*'item'*/)
	oView:EnableTitleView('VIEW_Z0504' , /*'item'*/)
	oView:EnableTitleView('VIEW_Z0505' , /*'item'*/)
	oView:EnableTitleView('VIEW_Z0506' , /*'item'*/)
	oView:EnableTitleView('VIEW_Z0507' , /*'item'*/)
	oView:EnableTitleView('VIEW_Z0508' , /*'item'*/)
	oView:EnableTitleView('VIEW_Z0509' , /*'item'*/)
	oView:EnableTitleView('VIEW_Z0510' , /*'item'*/)
	oView:EnableTitleView('VIEW_Z0511' , /*'item'*/)
	oView:EnableTitleView('VIEW_Z0512' , /*'item'*/)

Return oView


//-------------------------------------------------------------------
// Faz importação dos dados de metas por arquivo CSV
//-------------------------------------------------------------------
User Function FIN03IMP()

	Local aMensagem := {}
	Local aBotoes   := {}
	Local bSair     := .T.
    Local bOk 		:= {|| iif(ValidImp(),(oDlgFil:End(),Processa({|| ProcImp() })),) }  
	Local bCancel 	:= {|| oDlgFil:End() }    
	
    Static oDlgFil                    
	Private cTitulo := "Importação de Metas de Vendas"
	Private oArq
	Private cArq	:= ""
	Private oTipo	
	Private nTipo	:= 0
	Private aTipos	:= {}
		
	Aadd( aMensagem, OemToAnsi("Este programa tem como objetivo importar metas de vendas através de arquivo textos *.CSV ."))
	Aadd( aMensagem, OemToAnsi("    "))
	Aadd( aMensagem, OemToAnsi("Este arquivo deverá ser separado por ponto-e-virgula e o primeiro registro conterá os nomes dos campos a serem importados."))
	Aadd( aMensagem, OemToAnsi("    "))
	AAdd( aMensagem, OemToAnsi("A seguir escolha o arquivo e o tipo de importação a ser realizada."))
	
	AAdd( aBotoes, { 19, .T., { || FechaBatch(), bSair     := .F. } } )
	AAdd( aBotoes, { 02, .T., { || FechaBatch(), bSair     := .T. } } )
	
	FormBatch( cTitulo, aMensagem, aBotoes, , 260,700  )
	
	if !bSair
		
		oDlgFil := TDialog():New(0,0,260,700,cTitulo,,,,,,,,,.T.)
			
			TGroup():New(10,10,100,340,'',oDlgFil,,,.T.)
			
			TSay():New( 20,20,{|| "Selecione o Arquivo:" }, oDlgFil,,,,,,.T.,CLR_BLACK,,100,9 )
			oArq := TGet():New( 30, 20, {|u| iif( PCount()==0,cArq,cArq:= u) },oDlgFil,180,9,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .F.},.F.,.F.,/*bChange*/,.F.,.F.,,"cArq",,,,.T.,.F.)
			SButton():New( 30, 202, 14, {|| DoSelFile() } ,oDlgFil,.T.,,) //avançar
			
			TSay():New( 60,20,{|| "Selecione o Tipo de Importação:" }, oDlgFil,,,,,,.T.,CLR_BLACK,,100,9 )
			aadd(aTipos, "Adicionar registros do arquivo mesclando com dados de metas ja existentes.")
			aadd(aTipos, "Apagar dados de metas ja existentes, e incluir registros do arquivo.")
			oTipo := TRadMenu():New(70,20,aTipos,{|u| iif( PCount()==0,nTipo,nTipo:= u) },oDlgFil,,,,,,,,300,12,,,,.T.)
			
			SButton():New( 110,275,19,bOk,oDlgFil,.T.,,) //avançar
			SButton():New( 110,305,02,bCancel,oDlgFil,.T.,,) //cancelar
			
			oDlgFil:lCentered := .T.
		oDlgFil:Activate()
		
	endif

Return

//-------------------------------------------------------------------
// Busca arquivo para importação e valida-o
//-------------------------------------------------------------------
Static Function DoSelFile()

	
	Local cMaskFile := "Arquivos csv (*.csv) |*.CSV | "
	
	cArq := cGetFile(cMaskFile, OemToAnsi("Selecione o arquivo...")) ///cGetFile(cMaskFile, OemToAnsi("Selecione o arquivo..."), 0, iif(empty(cArq),'C:\',cArq), .F., GETF_LOCALFLOPPY + GETF_LOCALHARD + GETF_NETWORKDRIVE ,.T., .T.)
				

	if empty(cArq)
		cArq := space(300)
	elseif Right(upper(alltrim(cArq)),3) != "CSV"
		MsgStop("Selecione um arquivo do tipo CSV!","ATENCAO")
		cArq := space(300)
	endif
	
	oArq:Refresh()
	
Return

//-------------------------------------------------------------------
// Processa a importação dos dados
//-------------------------------------------------------------------
Static Function ValidImp()

	Local lRet := .T.
	
	if empty(cArq)
		MsgStop("Informe um arquivo para ser importado!","ATENCAO")
		lRet := .F.	
	elseif !File(cArq)
		MsgStop("O arquivo " +cArq + " não foi encontrado. Selecione um arquivo válido!","ATENCAO")
		lRet := .F.
	elseif empty(nTipo)
		MsgStop("Selecione o tipo de importação!","ATENCAO")
		lRet := .F.
	EndIf	
	
Return lRet

//-------------------------------------------------------------------
// Processa a importação dos dados
//-------------------------------------------------------------------
Static Function ProcImp()

	Local cLinha    := ''
	Local lPrim     := .T.
	Local aCampos   := {"Z05_VEND","Z05_ANO","Z05_MES","Z05_PROD","Z05_GRUPO","Z05_METVOL","Z05_METCAI","Z05_METFAT","Z05_PMETMC","Z05_VMETMC"}
	Local aTipos	:= {}
	Local aCpArq	:= {}
	Local aDados    := {}
	Local aExcluir	:= {}
	Local aLog		:= {}
	Local nCampos   := 0
	Local cSQL      := ''
	Local nI 		:= 0
	Local cTipo     := ''
	Local cItem		:= ''
	Local lProc		:= .T.	
	Local aChaves	:= {}
	
	If !File(cArq)
		MsgStop("O arquivo " + cArq + " não foi encontrado. A importação será abortada!","ATENCAO")
		Return
	EndIf
	
	FT_FUSE(cArq)
	FT_FGOTOP()
	cLinha    := FT_FREADLN()
	aCpArq	  := Separa(cLinha,";",.T.)
	cTipo     := SUBSTR(aCpArq[1],1,3)

	IF !(cTIPO == 'Z05')
		MsgAlert('Arquivo com sintaxe incorreta! Primeira linha deve conter o nome dos campos da tabela Z05!')
		Return
	ENDIF
	
	if len(aCpArq) < len(aCampos)
		MsgAlert('Sintaxe do arquivo Incorreta! Deve ter as colunas: Z05_VEND; Z05_ANO; Z05_MES; Z05_PROD; Z05_GRUPO; Z05_METVOL; Z05_METCAI; Z05_METFAT; Z05_PMETMC; Z05_VMETMC !"')
		Return
	endif
	
	dbSelectArea("SX3")
	DbSetOrder(2)
	For nI := 1 To Len(aCpArq)
		IF cTipo <> SUBSTR(aCpArq[nI],1,3)
			MsgAlert('Todos os campos devem pertencer a tabela Z05!')
			Return
		ENDIF
		if nI <= len(aCampos) .AND. Upper(Alltrim(aCpArq[nI])) <> aCampos[nI]
			MsgAlert('Sintaxe do arquivo Incorreta! Deve ter as colunas nesta sequencia: Z05_VEND; Z05_ANO; Z05_MES; Z05_PROD; Z05_GRUPO; Z05_METVOL; Z05_METCAI; Z05_METFAT; Z05_PMETMC; Z05_VMETMC !"')
			Return
		endif
		IF !SX3->(dbSeek(Alltrim(aCpArq[nI])))
			MsgAlert('Campo não encontrado na tabela: '+aCpArq[nI]+' !')
			Return
		ELSEIF (SX3->X3_VISUAL $ ('V') ) .OR. (SX3->X3_CONTEXT == "V"  )
			MsgAlert('Campo marcado na tabela como visual: '+aCpArq[nI]+' ! Não necessita estar no arquivo de importação!')
			Return
		ELSE
			aadd(aTipos, SX3->X3_TIPO) //gravo o tipo do campo 
		ENDIF
	Next nI
	
	//lendo dados do arquivo, e preenchendo no vetor aDados
	ProcRegua(FT_FLASTREC())
	FT_FGOTOP()
	nI := 1
	While !FT_FEOF()
		IncProc("Lendo arquivo texto... linha: " + cValToChar(nI) )
		cLinha := FT_FREADLN()
		if !empty(cLinha)
			If lPrim
				aCampos := Separa(Upper(cLinha),";",.T.)
				lPrim := .F.
			Else
				AADD(aDados,Separa(cLinha,";",.T.))
			EndIf
		endif
		nI++
		FT_FSKIP()
	EndDo
	
	FT_FUSE() //fecha arquivo
	
	ProcRegua(Len(aDados))
	For nI:=1 to  Len(aDados)
		
		cLinha := 'Linha ' + cValToChar(nI+1) + ' >> '
		
		IncProc("Validando dados... linha: " + cValToChar(nI+1))
		
		if len(aCampos) <> len(aDados[nI])		
			lProc := .F.
			cLog := 'Linha não está estruturada corretamente.'
			aadd(aLog, {"VALIDAR",cLinha+cLog})
		endif
		
		If lProc
			For nCampos := 1 To Len(aCampos)
				
				aDados[nI][nCampos] := AjustaVal(aDados[nI][nCampos], aTipos[nCampos], aCampos[nCampos] )
				//Z05_VEND; Z05_ANO; Z05_MES; Z05_PROD; Z05_GRUPO; Z05_METVOL; Z05_METCAI; Z05_METFAT; Z05_PMETMC; Z05_VMETMC
				if nCampos == aScan(aCampos,"Z05_VEND")
					if empty(Posicione("SA3",1,xFilial("SA3")+aDados[nI][nCampos],"A3_COD"))
						cLog := 'Inconsistência: Código Vendedor não cadastrado ['+aDados[nI][nCampos]+'] !'
						aadd(aLog, {"VALIDAR",cLinha+cLog})
						lProc := .F.
					endif
				elseif nCampos == aScan(aCampos,"Z05_ANO")
					//compatibilizando ano
					aDados[nI][nCampos] := StrZero(val(aDados[nI][nCampos]),4)
					if aDados[nI][nCampos] == "0000"
						cLog := 'Inconsistência: Ano informado inválido!'
						aadd(aLog, {"VALIDAR",cLinha+cLog})
						lProc := .F.
					endif
				elseif nCampos == aScan(aCampos,"Z05_MES")
					//compatibilizando ano
					aDados[nI][nCampos] := StrZero(val(aDados[nI][nCampos]),2)
					if aDados[nI][nCampos] == "00" .OR. aDados[nI][nCampos] > "12"
						cLog := 'Inconsistência: Mes informado inválido!'
						aadd(aLog, {"VALIDAR",cLinha+cLog})
						lProc := .F.
					endif
				elseif nCampos == aScan(aCampos,"Z05_PROD")
					if !empty(aDados[nI][nCampos])
						if empty(Posicione("SB1",1,xFilial("SB1")+aDados[nI][nCampos],"B1_COD"))
							cLog := 'Inconsistência: Código Produto não cadastrado ['+aDados[nI][nCampos]+'] !'
							aadd(aLog, {"VALIDAR",cLinha+cLog})
							lProc := .F.
						endif
					endif
				elseif nCampos == aScan(aCampos,"Z05_GRUPO") 
					if !empty(aDados[nI][nCampos])
						if empty(Posicione("SBM",1,xFilial("SBM")+aDados[nI][nCampos],"BM_GRUPO"))
							cLog := 'Inconsistência: Código Grupo não cadastrado ['+aDados[nI][nCampos]+'] !'
							aadd(aLog, {"VALIDAR",cLinha+cLog})
							lProc := .F.
						endif
					endif
				elseif nCampos == aScan(aCampos,"Z05_METVOL") 
					if empty(aDados[nI][nCampos])
						cLog := 'Inconsistência: Informe a Meta de Volume [Z05_METVOL] !'
						aadd(aLog, {"VALIDAR",cLinha+cLog})
						lProc := .F.
					endif
				elseif nCampos == aScan(aCampos,"Z05_METFAT") 
					if empty(aDados[nI][nCampos])
						cLog := 'Inconsistência: Informe a Meta de Faturamento [Z05_METFAT] !'
						aadd(aLog, {"VALIDAR",cLinha+cLog})
						lProc := .F.
					endif
				elseif nCampos == aScan(aCampos,"Z05_PMETMC")
					if empty(aDados[nI][nCampos])
						cLog := 'Inconsistência: Informe a Meta % MCT [Z05_PMETMC] !'
						aadd(aLog, {"VALIDAR",cLinha+cLog})
						lProc := .F.
					endif
				endif
							
			Next nCampos
			
			//valida preenchimento dos dois campos (produto e grupo)
			nCampos := 0
			nCampos += if(!empty(aDados[nI][aScan(aCampos,"Z05_PROD")]), 1, 0) //produto
			nCampos += if(!empty(aDados[nI][aScan(aCampos,"Z05_GRUPO")]), 1, 0) //grupo
			if nCampos > 1
				cLog := 'Inconsistência: Informe apenas um dos campos: Produto ou Grupo !'
				aadd(aLog, {"VALIDAR",cLinha+cLog})
				lProc := .F.
			endif
			
//valida chave unica

                  if aScan(aChaves, aDados[nI][aScan(aCampos,"Z05_VEND")]+aDados[nI][aScan(aCampos,"Z05_ANO")]+aDados[nI][aScan(aCampos,"Z05_MES")]+aDados[nI][aScan(aCampos,"Z05_PROD")]+aDados[nI][aScan(aCampos,"Z05_GRUPO")] ) == 0

                        //OK, adiciona chave no array

                        aadd(aChaves, aDados[nI][aScan(aCampos,"Z05_VEND")]+aDados[nI][aScan(aCampos,"Z05_ANO")]+aDados[nI][aScan(aCampos,"Z05_MES")]+aDados[nI][aScan(aCampos,"Z05_PROD")]+aDados[nI][aScan(aCampos,"Z05_GRUPO")] )

                  else

                        cLog := 'Inconsistência: Chave [Ano+Mes+Produto+Grupo] já existênte no arquivo !'

                        aadd(aLog, {"VALIDAR",cLinha+cLog})

                        lProc := .F.

                  endif
			
		endif				
	Next nI
	
	//inicia gravação dos dados
	if lProc
		
		DbSelectArea("Z04")
		DbSelectArea("Z05")
		
		cLog := 'Iniciando Gravações dos Dados...'
		aadd(aLog, {"INICIO",cLog})
		
		BeginTran()
		
		//processa exclusões
		if nTipo == 2 //se exclui pra depois importar
			
			cMsgExcl := ""
			For nI:=1 to  Len(aDados)
				if aScan(aExcluir, aDados[nI][aScan(aCampos,"Z05_VEND")]+aDados[nI][aScan(aCampos,"Z05_ANO")]+aDados[nI][aScan(aCampos,"Z05_MES")]) == 0 //vend+ano+mes
					aadd(aExcluir, aDados[nI][aScan(aCampos,"Z05_VEND")]+aDados[nI][aScan(aCampos,"Z05_ANO")]+aDados[nI][aScan(aCampos,"Z05_MES")])
					cMsgExcl += "Vend.: ["+aDados[nI][aScan(aCampos,"Z05_VEND")]+"], ANO.: ["+aDados[nI][aScan(aCampos,"Z05_ANO")]+"], MES.: ["+aDados[nI][aScan(aCampos,"Z05_MES")]+"]" + chr(13) + chr(10)
				endif
			next nI
			
			if !empty(cMsgExcl)
				if MsgYesNo("Confirma exclusão dos registros com as chaves: " + chr(13) + chr(10) + cMsgExcl)
					
					cLog := 'Buscando Registros para exclusão...'
					aadd(aLog, {"BUSCA",cLog})
										
					cSQL := "SELECT R_E_C_N_O_ FROM " + RetSqlName("Z05")+ " WHERE D_E_L_E_T_ <> '*' AND Z05_VEND||Z05_ANO||Z05_MES IN ("
					For nI:=1 to  Len(aExcluir)
						if nI > 1
							cSQL += ","
						endif
						cSQL += "'" + aExcluir[nI] + "'"
					next nI
					cSQL += ")"
					
					If Select("QRYEXCL") > 0
						QRYEXCL->(DbCloseArea())
					EndIf
					
					cSQL := ChangeQuery(cSQL)
					TcQuery cSQL New Alias "QRYEXCL" // Cria uma nova area com o resultado do query
					
					while !QRYEXCL->( Eof() )
						
						Z05->(DbGoTo(QRYEXCL->R_E_C_N_O_))
						if Reclock("Z05", .F.)
							Z05->(DbDelete())						
							Z05->(MsUnlock())
							
							cLog := 'Recno: ' + cValtoChar(QRYEXCL->R_E_C_N_O_) + " Indice 2: [" + Z05->(&(IndexKey(2))) + "]"
							aadd(aLog, {"EXCLUIDO",cLog})
						else
							cLog := 'Falha ao tentar excluir registros! Processo abortado!'
							aadd(aLog, {"FALHA",cLog})
							lProc := .F.
							EXIT
						endif
						QRYEXCL->(DbSkip())
				  	enddo
				else
					cLog := 'Exclusão! Abortado pelo Usuário!'
					aadd(aLog, {"ABORTOU",cLog})
					lProc := .F.				
				endif
			endif
		endif
		
		//processa gravações
		if lProc
					
			ProcRegua(Len(aDados))
			For nI:=1 to  Len(aDados)
				
				cItem := ""
				IncProc("Processando Gravações...")
				
				//inclui cabeçalho caso não exista
				Z04->(DbSetOrder(1)) //Z04_FILIAL+Z04_VEND+Z04_ANO
				if !Z04->(DbSeek(xFilial("Z04")+aDados[nI][aScan(aCampos,"Z05_VEND")]+aDados[nI][aScan(aCampos,"Z05_ANO")]))
					Reclock("Z04", .T.) //inclui
						Z04->Z04_FILIAL := xFilial("Z04")
						Z04->Z04_VEND	:= aDados[nI][aScan(aCampos,"Z05_VEND")]
						Z04->Z04_NOME	:= Posicione("SA3",1,xFilial("SA3")+Z04->Z04_VEND,"A3_NOME")
						Z04->Z04_ANO	:= aDados[nI][aScan(aCampos,"Z05_ANO")]
					Z04->(MsUnlock())					
				endif
				
				//verifica se ja existe registro
				Z05->(DbSetOrder(2)) //Z05_FILIAL+Z05_VEND+Z05_PROD+Z05_GRUPO+Z05_ANO+Z05_MES
				if Z05->(DbSeek(xFilial("Z05")+aDados[nI][aScan(aCampos,"Z05_VEND")]+aDados[nI][aScan(aCampos,"Z05_PROD")]+aDados[nI][aScan(aCampos,"Z05_GRUPO")]+aDados[nI][aScan(aCampos,"Z05_ANO")]+aDados[nI][aScan(aCampos,"Z05_MES")] ))  
					lInclui := .F.
					cLog := "Indice 2: [" + Z05->(&(IndexKey(2))) + "], Meta Vol.: De[" + cValToChar(Z05->Z05_METVOL) + "] Para[" + cValToChar(aDados[nI][aScan(aCampos,"Z05_METVOL")]) + "], Meta Fat.: De[" + cValToChar(Z05->Z05_METFAT) + "] Para[" + cValToChar(aDados[nI][aScan(aCampos,"Z05_METFAT")]) + "], Meta %MCT: De[" + cValToChar(Z05->Z05_PMETMC) + "] Para[" + cValToChar(aDados[nI][aScan(aCampos,"Z05_PMETMC")]) + "] "
					cItem := Z05->Z05_ITEM
				else
					lInclui := .T.
					cItem := U_UPROXIMO("Z05","Z05_ITEM",xFilial("Z05"),,"Z05_VEND = '"+aDados[nI][aScan(aCampos,"Z05_VEND")]+"' AND Z05_ANO = '"+aDados[nI][aScan(aCampos,"Z05_ANO")]+"' AND Z05_MES = '"+aDados[nI][aScan(aCampos,"Z05_MES")]+"' ")
				endif	
				
				Reclock("Z05", lInclui)
				Z05->Z05_FILIAL := xFilial("Z05")
				Z05->Z05_ITEM := cItem
								
				//campos obrigatórios do arquivo
				For nCampos := 1 To Len(aCampos)
					Z05->&(aCampos[nCampos]) := aDados[nI][nCampos]
				Next nCampos
				
				//faz gatilho manual da descrição
				if !empty(Z05->Z05_PROD)
					Z05->Z05_DESCRI := Posicione("SB1",1,xFilial("SB1")+Z05->Z05_PROD,"B1_DESC")
				elseif !empty(Z05->Z05_GRUPO)
					Z05->Z05_DESCRI := Posicione("SBM",1,xFilial("SBM")+Z05->Z05_GRUPO,"BM_DESC")
				else
					Z05->Z05_DESCRI := "META TOTAL REGIAO"
				endif
				
				if lInclui
					cLog := "Indice 2: [" + Z05->(&(IndexKey(2))) + "], Meta Vol.: [" + cValToChar(Z05->Z05_METVOL) + "], Meta Fat.: [" + cValToChar(Z05->Z05_METFAT) + "], Meta %MCT: [" + cValToChar(Z05->Z05_PMETMC) + "] "
					aadd(aLog, {"INCLUIDO",cLog})
				else
					aadd(aLog, {"ALTERADO",cLog}) //com mensagem feita acima, no DbSeek
				endif
				
				Z05->(MsUnlock())
				
			Next nI
			
			cLog := 'Processo finalizado com sucesso!'
			aadd(aLog, {"FIM",cLog})
			EndTran() 
		else
			cLog := 'Desfazendo gravações realizadas... OK'
			aadd(aLog, {"FALHA",cLog})
			DisarmTransaction()
		endif
		
	endif
	
	if lProc
		if MsgYesNo('Arquivo importado com sucesso! Deseja ver arquivo de LOG?')
			ShowLog(aLog)
		endif
	else
		if MsgYesNo('Arquivo não processado por erros! Deseja ver arquivo de LOG?')
			ShowLog(aLog)
		endif
	endif

Return 

//-------------------------------------------------------------------
// Faz ajustedo valor de acordo com tipo
//-------------------------------------------------------------------
Static Function AjustaVal(xValor, cTipo, cCampo)

	if cTipo == "C"
		xValor := PadR(xValor, TamSx3(cCampo)[1])
	elseif cTipo == "N"
		xValor := Val(StrTran(StrTran(xValor,".",""),",","."))
	endif
	
Return xValor

//-------------------------------------------------------------------
// Relatório de impressão de log
//-------------------------------------------------------------------
Static Function ShowLog(aLog)

	Local oReport := TReport():New("RFINL003","Log de Importação de Arquivo de Metas",/*SX1*/,{|oReport| PrintReport(oReport, aLog)},"Este relatorio ira imprimir a relacao de logs de importação de arquivo de metas.") 
	Local oSection := TRSection():New(oReport,OemToAnsi("Log de Importação Arquivos"),{"TMP"})	
	
	TRCell():New(oSection,"ACAO"	,"TMP", "Ação", ,8)
	TRCell():New(oSection,"ITEMLOG"	,"TMP", "Descricao do Log", ,250)
	
	//oReport:PrintDialog()
	oReport:Print()	

Return	

//-------------------------------------------------------------------
// Relatório de impressão de log
//-------------------------------------------------------------------	
Static Function PrintReport(oReport, aLog)

	Local oSection 	:= oReport:Section(1)
	Local nX 		:= 1
	
	oReport:SetMeter(len(aLog))
	
	oSection:Init()
	
	For nX := 1 to len(aLog)
		
		If oReport:Cancel()
			Exit
		EndIf
		
		oSection:Cell("ACAO"):SetValue(aLog[nX][1])
		oSection:Cell("ITEMLOG"):SetValue(aLog[nX][2])
		oSection:PrintLine()
		
		oReport:IncMeter()
	Next nX
	
	oSection:Finish()

Return


