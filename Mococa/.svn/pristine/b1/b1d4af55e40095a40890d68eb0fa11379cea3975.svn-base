#include "protheus.ch" 
#include "fwmvcdef.ch"

/*/{Protheus.doc} RFATA003
Cadastro Periodicidade
@author TOTVS
@since 24/02/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

/***********************/
User Function RFATA003()
/***********************/ 

Local oBrowse

Private aRotina := {}

oBrowse := FWmBrowse():New()
oBrowse:SetAlias("Z12")
oBrowse:SetDescription("Periodicidade")  
oBrowse:Activate()

Return Nil

/************************/
Static Function MenuDef()
/************************/

aRotina 	:= {}

ADD OPTION aRotina Title 'Visualizar' 	Action "VIEWDEF.RFATA003"	OPERATION 2 ACCESS 0
ADD OPTION aRotina Title "Incluir"    	Action "VIEWDEF.RFATA003"	OPERATION 3 ACCESS 0
ADD OPTION aRotina Title "Alterar"    	Action "VIEWDEF.RFATA003"	OPERATION 4 ACCESS 0
ADD OPTION aRotina Title "Excluir"    	Action "VIEWDEF.RFATA003"	OPERATION 5 ACCESS 0

Return aRotina

/*************************/
Static Function ModelDef()
/*************************/

// Cria a estrutura a ser usada no Modelo de Dados
Local oStruZ12 := FWFormStruct(1,"Z12",/*bAvalCampo*/,/*lViewUsado*/ )

Local oModel

// Cria o objeto do Modelo de Dados
oModel := MPFormModel():New("RFATP003",/*bPreValidacao*/,/*bPosValidacao*/,/*bCommit*/,/*bCancel*/ )

// Adiciona ao modelo uma estrutura de formulário de edição por campo
oModel:AddFields("Z12MASTER",/*cOwner*/,oStruZ12)

// Adiciona a chave primaria da tabela principal
oModel:SetPrimaryKey({"Z12_FILIAL","Z12_CODIGO"})

// Adiciona a descricao do Componente do Modelo de Dados
oModel:GetModel("Z12MASTER"):SetDescription("Periodicidade")

Return oModel

/************************/
Static Function ViewDef()
/************************/

// Cria a estrutura a ser usada na View
Local oStruZ12 := FWFormStruct(2,"Z12")

// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
Local oModel   := FWLoadModel("RFATA003")
Local oView

// Cria o objeto de View
oView := FWFormView():New()

// Define qual o Modelo de dados será utilizado
oView:SetModel( oModel )

//Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
oView:AddField("VIEW_Z12",oStruZ12,"Z12MASTER")

// Criar "box" horizontal para receber algum elemento da view
oView:CreateHorizontalBox("PAINEL_CABEC", 100)

// Relaciona o ID da View com o "box" para exibicao
oView:SetOwnerView("VIEW_Z12","PAINEL_CABEC")

// Liga a identificacao do componente
oView:EnableTitleView("VIEW_Z12","Periodicidade")

// Define fechamento da tela ao confirmar a operação
oView:SetCloseOnOk( {||.T.} )

Return oView