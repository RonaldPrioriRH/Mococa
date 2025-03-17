#include "protheus.ch" 
#include "fwmvcdef.ch"

/*/{Protheus.doc} RFATA009
Log Contratos
@author TOTVS
@since 04/05/2017
@version P12
@param Nao recebe parametros            
@return nulo
/*/

/***********************/
User Function RFATA009()
/***********************/

Local oBrowse

Private aRotina := {}

oBrowse := FWmBrowse():New()
oBrowse:SetAlias("Z23")
oBrowse:SetDescription("Log Contratos")   
oBrowse:Activate()

Return Nil

/************************/
Static Function MenuDef()
/************************/

Local aRotina 	:= {}

ADD OPTION aRotina Title "Visualizar" 	Action "VIEWDEF.RFATA009"	OPERATION 2 ACCESS 0

Return aRotina

/*************************/
Static Function ModelDef()
/*************************/

// Cria a estrutura a ser usada no Modelo de Dados
Local oStruZ23 := FWFormStruct(1,"Z23",/*bAvalCampo*/,/*lViewUsado*/ )

Local oModel

// Cria o objeto do Modelo de Dados
oModel := MPFormModel():New("RFATP009",/*bPreValidacao*/,/*bPosValidacao*/,/*bCommit*/,/*bCancel*/ )

// Adiciona ao modelo uma estrutura de formulário de edição por campo
oModel:AddFields("Z23MASTER",/*cOwner*/,oStruZ23)

// Adiciona a chave primaria da tabela principal
oModel:SetPrimaryKey({"Z23_FILIAL","Z23_CODIGO"})

// Adiciona a descricao do Componente do Modelo de Dados
oModel:GetModel("Z23MASTER"):SetDescription("Log")

Return oModel

/************************/
Static Function ViewDef()
/************************/

// Cria a estrutura a ser usada na View
Local oStruZ23 := FWFormStruct(2,"Z23")

// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
Local oModel   := FWLoadModel("RFATA009")
Local oView

// Remove campos da estrutura
oStruZ23:RemoveField('Z23_CODIGO')

// Cria o objeto de View
oView := FWFormView():New()

// Define qual o Modelo de dados será utilizado
oView:SetModel(oModel)

// Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
oView:AddField("VIEW_Z23",oStruZ23,"Z23MASTER")

// Criar "box" horizontal para receber algum elemento da view
oView:CreateHorizontalBox("PAINEL", 100)

// Relaciona o ID da View com o "box" para exibicao
oView:SetOwnerView("VIEW_Z23","PAINEL")

// Liga a identificacao do componente
oView:EnableTitleView("VIEW_Z23","Log")

// Define fechamento da tela ao confirmar a operação
oView:SetCloseOnOk( {||.T.} )

Return oView 