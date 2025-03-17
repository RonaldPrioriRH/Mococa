#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'FWMVCDEF.CH'
#INCLUDE "rwmake.ch"
#INCLUDE "topconn.ch"

/*/{Protheus.doc} RFINA001

Cadastro de Regras de Comissão

@author Danilo Brito
@since 15/02/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

User Function RFINA001()

	Local oBrowse

	Private aRotina
	Private cCadastro := 'Cadastro de Regras de Comissão'

	DbSelectArea("Z01")
	DbSelectArea("Z02")

	oBrowse := FWmBrowse():New()
	oBrowse:SetAlias( 'Z01' )
	oBrowse:SetDescription( cCadastro )
	
	oBrowse:Activate()

Return

//-------------------------------------------------------------------
// Definicao do Menu
//-------------------------------------------------------------------
Static Function MenuDef()

	aRotina := {}

	ADD OPTION aRotina TITLE 'Visualizar'      ACTION 'VIEWDEF.RFINA001' OPERATION 2 ACCESS 0
	ADD OPTION aRotina TITLE 'Incluir'         ACTION 'VIEWDEF.RFINA001' OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar'         ACTION 'VIEWDEF.RFINA001' OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE 'Excluir'         ACTION 'VIEWDEF.RFINA001' OPERATION 5 ACCESS 0
	ADD OPTION aRotina TITLE 'Copiar'          ACTION 'VIEWDEF.RFINA001' OPERATION 9 ACCESS 0
	
Return aRotina

//-------------------------------------------------------------------
// Define Modelo de Dados
//-------------------------------------------------------------------
Static Function ModelDef()

	// Cria a estrutura a ser usada no Modelo de Dados
	Local oStruZ01  := FWFormStruct( 1, 'Z01', /*bAvalCampo*/,/*lViewUsado*/ )
	Local oStruZ02  := FWFormStruct( 1, 'Z02', /*bAvalCampo*/,/*lViewUsado*/ )
	Local oModel
	
	// Cria o objeto do Modelo de Dados
	oModel := MPFormModel():New('RFINP001', /*bPreValidacao*/, /*bPosValidacao*/, /*bCommit*/, /*bCancel*/ )
	
	// Adiciona ao modelo uma estrutura de formulario de edicao por campo
	oModel:AddFields( 'Z01MASTER', /*cOwner*/, oStruZ01, /*bPreValidacao*/, /*bPosValidacao*/, /*bCarga*/ )
	
	// Adiciona a chave primaria da tabela principal
	oModel:SetPrimaryKey({ "Z01_FILIAL", "Z01_CODIGO" })
	
	// Adiciona ao modelo uma componente de grid 
	oModel:AddGrid( 'Z02DETAIL', 'Z01MASTER', oStruZ02 , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	
	// Faz relacionamento entre os componentes do model
	oModel:SetRelation( 'Z02DETAIL', { {'Z02_FILIAL', 'xFilial( "Z02" )'}, {'Z02_CODIGO', 'Z01_CODIGO'} }, Z02->( IndexKey( 1 ) ) )
	
	// Liga o controle de nao repeticao de linha
	oModel:GetModel( 'Z02DETAIL' ):SetUniqueLine( { 'Z02_PROD', 'Z02_GRUPO','Z02_CLIENT','Z02_ESTADO'} )
	
	// Adiciona a descricao do Modelo de Dados
	oModel:SetDescription( 'Regras de Comissão' )
	
	// Adiciona a descrição dos Componentes do Modelo de Dados
	oModel:GetModel( 'Z02DETAIL' ):SetDescription( 'Detalhamento das Regras' )
	                                       
Return oModel
 

//-------------------------------------------------------------------
// Define camada de Visão
//-------------------------------------------------------------------
Static Function ViewDef()

	// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
	Local oModel   := FWLoadModel( 'RFINA001' )
	Local oView
	
	// Cria a estrutura a ser usada na View
	Local oStruZ01 := FWFormStruct( 2, 'Z01' )
	Local oStruZ02 := FWFormStruct( 2, 'Z02' )
	
	// Remove campos da estrutura
	oStruZ02:RemoveField( 'Z02_CODIGO' )
	
	// Cria o objeto de View
	oView := FWFormView():New()
	
	// Define qual o Modelo de dados ser· utilizado
	oView:SetModel( oModel )
	
	//Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
	oView:AddField( 'VIEW_Z01', oStruZ01, 'Z01MASTER' )
	
	//Adiciona no nosso View um controle do tipo Grid (antiga Getdados)
	oView:AddGrid( 'VIEW_Z02', oStruZ02, 'Z02DETAIL' )
	
	// Define campos que terao Auto Incremento
	oView:AddIncrementField( 'VIEW_Z02', 'Z02_ITEM' )
	
	// Cria um "box" horizontal para receber cada elemento da view
	oView:CreateHorizontalBox( 'SUPERIOR'	, 30 )
	oView:CreateHorizontalBox( 'INFERIOR'	, 70 )
	  
	// Relaciona o identificador (ID) da View com o "box" para exibição
	oView:SetOwnerView( 'VIEW_Z01', 'SUPERIOR' )
	oView:SetOwnerView( 'VIEW_Z02', 'INFERIOR' )
	
	// titulo dos componentes
	oView:EnableTitleView('VIEW_Z02' , /*'item'*/)

Return oView

