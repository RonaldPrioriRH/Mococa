#include "protheus.ch" 
#include "fwmvcdef.ch"

/*/{Protheus.doc} RFATA001
Cadastro Cláusulas
@author TOTVS
@since 17/02/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

/***********************/
User Function RFATA001()
/***********************/ 

Local oBrowse

Private aRotina := {}

oBrowse := FWmBrowse():New()
oBrowse:SetAlias("Z08")
oBrowse:SetDescription("Clausulas")  
oBrowse:AddLegend("Z08_STATUS == 'A'", "GREEN",		"Ativa")
oBrowse:AddLegend("Z08_STATUS == 'I'", "RED",		"Inativa") 
oBrowse:Activate()

Return Nil

/************************/
Static Function MenuDef()
/************************/

aRotina 	:= {}

ADD OPTION aRotina Title 'Visualizar' 	Action "VIEWDEF.RFATA001"	OPERATION 2 ACCESS 0
ADD OPTION aRotina Title "Incluir"    	Action "VIEWDEF.RFATA001"	OPERATION 3 ACCESS 0
ADD OPTION aRotina Title "Alterar"    	Action "VIEWDEF.RFATA001"	OPERATION 4 ACCESS 0
ADD OPTION aRotina Title "Excluir"    	Action "VIEWDEF.RFATA001"	OPERATION 5 ACCESS 0
ADD OPTION aRotina Title "Legenda"     	Action "U_FATA001L()" 		OPERATION 7 ACCESS 0  

Return aRotina

/*************************/
Static Function ModelDef()
/*************************/

// Cria a estrutura a ser usada no Modelo de Dados
Local oStruZ08 := FWFormStruct(1,"Z08",/*bAvalCampo*/,/*lViewUsado*/ )

Local oModel

// Cria o objeto do Modelo de Dados
oModel := MPFormModel():New("RFATP001",/*bPreValidacao*/,/*bPosValidacao*/,/*bCommit*/,/*bCancel*/ )

// Adiciona ao modelo uma estrutura de formulário de edição por campo
oModel:AddFields("Z08MASTER",/*cOwner*/,oStruZ08)

// Adiciona a chave primaria da tabela principal
oModel:SetPrimaryKey({"Z08_FILIAL","Z08_CODIGO"})

// Adiciona a descricao do Componente do Modelo de Dados
oModel:GetModel("Z08MASTER"):SetDescription("Clausulas")

Return oModel

/************************/
Static Function ViewDef()
/************************/

// Cria a estrutura a ser usada na View
Local oStruZ08 := FWFormStruct(2,"Z08")

// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
Local oModel   := FWLoadModel("RFATA001")
Local oView

// Cria o objeto de View
oView := FWFormView():New()

// Define qual o Modelo de dados será utilizado
oView:SetModel( oModel )

//Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
oView:AddField("VIEW_Z08",oStruZ08,"Z08MASTER")

// Criar "box" horizontal para receber algum elemento da view
oView:CreateHorizontalBox("PAINEL_CABEC", 100)

// Relaciona o ID da View com o "box" para exibicao
oView:SetOwnerView("VIEW_Z08","PAINEL_CABEC")

// Liga a identificacao do componente
oView:EnableTitleView("VIEW_Z08","Clausulas")

// Define fechamento da tela ao confirmar a operação
oView:SetCloseOnOk( {||.T.} )

Return oView

/***********************/
User Function FATA001L()
/***********************/

BrwLegenda("Status da Clausula","Legenda",{{"BR_VERDE","Ativa"},{"BR_VERMELHO","Inativa"}})

Return