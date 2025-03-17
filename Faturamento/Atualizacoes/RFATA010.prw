#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'FWMVCDEF.CH'
#INCLUDE "rwmake.ch"
#INCLUDE "topconn.ch"

/*/{Protheus.doc} RFATA010

Log de Integração WS com SGAC

@author Danilo Brito
@since 16/02/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

User Function RFATA010()

	Local oBrowse

	Private aRotina
	Private cCadastro := 'Log de Integração WS com SGAC'

	DbSelectArea("Z24")

	oBrowse := FWmBrowse():New()
	oBrowse:SetAlias( 'Z24' )
	oBrowse:SetDescription( cCadastro )
	
	oBrowse:Activate()

Return

//-------------------------------------------------------------------
// Definicao do Menu
//-------------------------------------------------------------------
Static Function MenuDef()

	aRotina := {}

	ADD OPTION aRotina TITLE 'Visualizar'      ACTION 'VIEWDEF.RFATA010' OPERATION 2 ACCESS 0
	//ADD OPTION aRotina TITLE 'Incluir'         ACTION 'VIEWDEF.RFATA010' OPERATION 3 ACCESS 0
	//ADD OPTION aRotina TITLE 'Alterar'         ACTION 'VIEWDEF.RFATA010' OPERATION 4 ACCESS 0
	//ADD OPTION aRotina TITLE 'Excluir'         ACTION 'VIEWDEF.RFATA010' OPERATION 5 ACCESS 0
	//ADD OPTION aRotina TITLE 'Copiar'          ACTION 'VIEWDEF.RFATA010' OPERATION 9 ACCESS 0
	
Return aRotina

//-------------------------------------------------------------------
// Define Modelo de Dados
//-------------------------------------------------------------------
Static Function ModelDef()

	// Cria a estrutura a ser usada no Modelo de Dados
	Local oStruZ24  := FWFormStruct( 1, 'Z24', /*bAvalCampo*/,/*lViewUsado*/ )
	Local oModel
	
	// Cria o objeto do Modelo de Dados
	oModel := MPFormModel():New('RFATP010', /*bPreValidacao*/, /*bPosValidacao*/, /*bCommit*/, /*bCancel*/ )
	
	// Adiciona ao modelo uma estrutura de formulario de edicao por campo
	oModel:AddFields( 'Z24MASTER', /*cOwner*/, oStruZ24, /*bPreValidacao*/, /*bPosValidacao*/, /*bCarga*/ )
	
	// Adiciona a chave primaria da tabela principal
	oModel:SetPrimaryKey({ "Z24_FILIAL", "Z24_IDLOG" })
	
	// Adiciona a descricao do Modelo de Dados
	oModel:SetDescription( 'Log Integraçao SGAC' )
	                                       
Return oModel
 

//-------------------------------------------------------------------
// Define camada de Visão
//-------------------------------------------------------------------
Static Function ViewDef()

	// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
	Local oModel   := FWLoadModel( 'RFATA010' )
	Local oView
	
	// Cria a estrutura a ser usada na View
	Local oStruZ24 := FWFormStruct( 2, 'Z24' )
	
	// Cria o objeto de View
	oView := FWFormView():New()
	
	// Define qual o Modelo de dados ser· utilizado
	oView:SetModel( oModel )
	
	//Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
	oView:AddField( 'VIEW_Z24', oStruZ24, 'Z24MASTER' )
	
	// Cria um "box" horizontal para receber cada elemento da view
	oView:CreateHorizontalBox( 'TOTAL'	, 100 )
	  
	// Relaciona o identificador (ID) da View com o "box" para exibição
	oView:SetOwnerView( 'VIEW_Z24', 'TOTAL' )

Return oView

