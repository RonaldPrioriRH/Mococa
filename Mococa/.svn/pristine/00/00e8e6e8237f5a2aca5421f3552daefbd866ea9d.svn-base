#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'FWMVCDEF.CH'
#INCLUDE 'RWMAKE.CH'
#INCLUDE 'TOPCONN.CH'

/*/{Protheus.doc} RFINA006

Cadastro de Tipo de Taxas Fidic

@author Leandro Rodrigues
@since 23/03/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

User Function RFINA006()

Local oBrowse

oBrowse := FWmBrowse():New()
oBrowse:SetAlias( 'ZEH' )
oBrowse:SetDescription( 'Cadastro Taxa Fidic' )
oBrowse:Activate()

Return NIL


//-------------------------------------------------------------------
Static Function MenuDef()
Local aRotina := {}

ADD OPTION aRotina Title 'Visualizar' Action 'VIEWDEF.RFINA006' OPERATION 2 ACCESS 0
ADD OPTION aRotina Title 'Incluir'    Action 'VIEWDEF.RFINA006' OPERATION 3 ACCESS 0
ADD OPTION aRotina Title 'Alterar'    Action 'VIEWDEF.RFINA006' OPERATION 4 ACCESS 0
ADD OPTION aRotina Title 'Excluir'    Action 'VIEWDEF.RFINA006' OPERATION 5 ACCESS 0

Return aRotina


//-------------------------------------------------------------------
Static Function ModelDef()  
Local oStruZEH	:= fwFormStruct(1, "ZEH", NIL, .F.)
Local oModel

// Cria a estrutura a ser usada no Modelo de Dados
oModel	:= mpFormModel():New("RFINP006", /*bPreValidacao*/, /*bPosValidacao*/, /*bCommit*/, /*bCancel*/)

// Adiciona ao modelo uma estrutura de formulário de edição por campo
oModel:AddFields("ZEHMASTER", /*cOwner*/, oStruZEH)

// Liga o controle de nao repeticao de linha
oModel:SetPrimaryKey({"ZEH_FILIAL", "ZEH_NUMBOR","ZEH_TAXA"})

// Adiciona a descricao do Modelo de Dados
oModel:SetDescription("Cadastro Taxa Fidic")

Return(oModel)


//-------------------------------------------------------------------
Static Function ViewDef()    
Local oStruZEH	:= fwFormStruct(2, "ZEH")
Local oModel
Local oView

// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
oModel	:= fwLoadModel("RFINA006")

// Cria o objeto de View
oView	:= fwFormView():New()

// Define qual o Modelo de dados será utilizado
oView:SetModel(oModel)

//Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
oView:AddField("VIEW_ZEH", oStruZEH, "ZEHMASTER")

// Criar "box" horizontal para receber algum elemento da view
oView:CreateHorizontalBox("TELA", 100)

// Relaciona o ID da View com o "box" para exibicao
oView:SetOwnerView("VIEW_ZEH", "TELA")

// Liga a identificacao do componente
oView:EnableTitleView("VIEW_ZEH", "Cadastro Taxa Fidic")

Return(oView)