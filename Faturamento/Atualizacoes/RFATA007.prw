#include "protheus.ch" 
#include "fwmvcdef.ch"

 
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  RFATA007     ºAutor  ³Raphael Martins   º Data ³  22/03/17   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Rotina de Cadastro de Regras de Debitos e Creditos         º±±
±±º          ³ Conta Corrente e VBC                                       º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

/***********************/
User Function RFATA007()
/***********************/ 
             
Local oBrowse

Private aRotina := {}

oBrowse := FWmBrowse():New()
oBrowse:SetAlias("Z17")

oBrowse:SetDescription("Regras de Creditos e Debitos")   

// crio as legendas 
oBrowse:AddLegend("Z17_STATUS == 'A'", "GREEN"	,	"Ativo")
oBrowse:AddLegend("Z17_STATUS == 'I'", "RED"	,	"Inativo")  

oBrowse:Activate()

Return Nil

/************************/
Static Function MenuDef()
/************************/

aRotina 	:= {}

ADD OPTION aRotina Title 'Visualizar' 				Action "VIEWDEF.RFATA007"	OPERATION 2 ACCESS 0
ADD OPTION aRotina Title "Incluir"    				Action "VIEWDEF.RFATA007"	OPERATION 3 ACCESS 0
ADD OPTION aRotina Title "Alterar"    				Action "VIEWDEF.RFATA007"	OPERATION 4 ACCESS 0
ADD OPTION aRotina Title "Excluir"    				Action "VIEWDEF.RFATA007"	OPERATION 5 ACCESS 0
ADD OPTION aRotina Title "Copiar"    				Action "VIEWDEF.RFATA007"	OPERATION 9 ACCESS 0
ADD OPTION aRotina Title 'Legenda'     				Action 'U_RFAT007L()' 		OPERATION 6 ACCESS 0    

Return aRotina

/*************************/
Static Function ModelDef()
/*************************/

// Cria a estrutura a ser usada no Modelo de Dados
Local oStruZ17 := FWFormStruct(1,"Z17",/*bAvalCampo*/,/*lViewUsado*/ )
Local oStruZ18 := FWFormStruct(1,"Z18",/*bAvalCampo*/,/*lViewUsado*/ )

Local oModel

// Cria o objeto do Modelo de Dados
oModel := MPFormModel():New("PFAT007",/*bPreValidacao*/,/*bPosValidacao*/,/*bCommit*/,/*bCancel*/ )

// Adiciona ao modelo uma estrutura de formulário de edição por campo
oModel:AddFields("Z17MASTER",/*cOwner*/,oStruZ17)

// Adiciona a chave primaria da tabela principal
oModel:SetPrimaryKey({"Z17_FILIAL","Z17_CODIGO"})

// Adiciona ao modelo uma estrutura de formulário de edição por grid
oModel:AddGrid("Z18DETAIL","Z17MASTER",oStruZ18,/*bLinePre*/,/*bLinePost*/,/*bPreVal*/,/*bPosVal*/,/*BLoad*/)

// Faz relaciomaneto entre os compomentes do model
oModel:SetRelation("Z18DETAIL", {{"Z18_FILIAL", 'xFilial("Z18")'},{"Z18_CODIGO","Z17_CODIGO"}}, Z18->( IndexKey(1) ))

// Desobriga a digitacao de ao menos um item
//oModel:GetModel("Z18DETAIL"):SetOptional(.T.)

// Liga o controle de nao repeticao de linha
oModel:GetModel("Z18DETAIL"):SetUniqueLine({"Z18_GRUPO","Z18_PROD"})


// Adiciona a descricao do Componente do Modelo de Dados
oModel:GetModel("Z17MASTER"):SetDescription("Regras de Creditos e Debitos")
oModel:GetModel("Z18DETAIL"):SetDescription(" (-) Debitos ")

Return oModel

/************************/
Static Function ViewDef()
/************************/

// Cria a estrutura a ser usada na View
Local oStruZ17 := FWFormStruct(2,"Z17")
Local oStruZ18 := FWFormStruct(2,"Z18")

// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
Local oModel   := FWLoadModel("RFATA007")
Local oView

// Remove campos da estrutura
oStruZ18:RemoveField('Z18_CODIGO')

// Cria o objeto de View
oView := FWFormView():New()

// Define qual o Modelo de dados será utilizado
oView:SetModel( oModel )

oStruZ17:AddGroup( 'GRP01', '', '', 2 ) 
oStruZ17:AddGroup( 'GRP02', 'Rateio de Geracao de Creditos', '', 2 )  


// Colocando todos os campos para o agrupamento 1
oStruZ17:SetProperty( '*' , MVC_VIEW_GROUP_NUMBER, 'GRP01' )

// Trocando os campos para o agrupamento 3
oStruZ17:SetProperty( 'Z17_RATEIO' 	, MVC_VIEW_GROUP_NUMBER, 'GRP02' ) 
 
//Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
oView:AddField("VIEW_Z17",oStruZ17,"Z17MASTER")

//Adiciona no nosso View um controle do tipo FormGrid(antiga newgetdados)
oView:AddGrid("VIEW_Z18",oStruZ18,"Z18DETAIL")

// Criar "box" horizontal para receber algum elemento da view
oView:CreateHorizontalBox("PAINEL_CABEC", 30)
oView:CreateHorizontalBox("PAINEL_ITENS", 70)

oView:CreateVerticalBox("PAINEL_ITENS_1", 100, "PAINEL_ITENS")


// Relaciona o ID da View com o "box" para exibicao
oView:SetOwnerView("VIEW_Z17","PAINEL_CABEC")
oView:SetOwnerView("VIEW_Z18","PAINEL_ITENS_1")

// Liga a identificacao do componente
oView:EnableTitleView("VIEW_Z17","Regras de Creditos e Debitos")
oView:EnableTitleView("VIEW_Z18"," (-) Debitos ")

// Define campos que terao Auto Incremento
oView:AddIncrementField("VIEW_Z18","Z18_ITEM")

// Define fechamento da tela ao confirmar a operação
oView:SetCloseOnOk( {||.T.} )

Return oView                                           

/***********************/
User Function RFAT007L()
/***********************/

BrwLegenda("Status","Legenda",{{"BR_VERDE","Ativo"},{"BR_VERMELHO","Inativo"}})

Return 