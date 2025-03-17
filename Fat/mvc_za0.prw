#Include 'Protheus.ch'
#Include 'topconn.ch'
#Include 'FWMVCDef.ch'

*-----------------------*
User Function mvc_za0()
*-----------------------*
Static cTitulo := 'Status Processos Transferencias'
Local aArea     := GetArea()
Local oBrowse
Local cFunBkp   := FunName()
Private aRotina := {}

SetFunName("mvc_za0")

// Instanciando FWMBrose - somente com dicionario de dados.
oBrowse:= FWMBrowse():New()

// Setando a tabela de cadastro de Auditoria
oBrowse:SetAlias('ZA0')

// Setando a descrição da rotina
oBrowse:SetDescription (cTitulo)

// Legendas
oBrowse:AddLegend( "ZA0->ZA0_STATUS = 'I' ","BR_VERDE","Iniciado")
oBrowse:AddLegend( "ZA0->ZA0_STATUS = 'E' ","BR_AMARELO","Com erro")
oBrowse:AddLegend( "ZA0->ZA0_STATUS = 'F' ","BR_VERMELHO","Encerrado")

// Filtrando
// oBrowse:SetFilterDefault("ZMA->ZMA_MSBLQL = 'A' .AND. ZMA->ZMA_MSBLQL > '1' ")

// Ativa a Browse
Obrowse:Activate()

SetFunName(cFunBkp)
RestArea(aArea) 


Return Nil

*------------------------*  
Static Function MenuDef()
*------------------------*
Private aRotina := {}

add option aRotina Title 'Visualizar'       Action 'VIEWDEF.mvc_za0'   OPERATION 2 ACCESS 0 // MODEL_OPERATION_VIEW   ACESS 0
add option aRotina TITLE 'Legenda'          Action 'u_zza0lLeg()'      OPERATION 6 ACCESS 0
add option aRotina TITLE 'Incluir'          Action 'VIEWDEF.mvc_za0'   OPERATION MODEL_OPERATION_INSERT ACCESS 0
add option aRotina TITLE 'Alterar'          Action 'VIEWDEF.mvc_za0'   OPERATION MODEL_OPERATION_UPDATE ACCESS 0
add option aRotina TITLE 'Excluir'          Action 'VIEWDEF.mvc_za0'   OPERATION MODEL_OPERATION_DELETE ACCESS 0

Return aRotina

*------------------------*
Static Function ModelDef()
*------------------------*
Local oModel  := Nil                         // Criação do objeto Modelo de dados
Local oStZMA  := FwFormSTRUCT(1, "ZA0")     // Criação da estrutura de dados utilziadas de intervace
// Editando caracteristicaas do Dicionario na intervace

// Instanciando o modelo, não é recomendado colocar nome da user function (por causa do u_), respeitando 10 caractereiz
oModel := MPFormModel():New("mvc_za0M",/*bPre*/,/*bPos*/,/*bCommit*/,/*bCancel*/)

// Atribuindo formulario para o modelo
oModel:AddFields("FORMZA0",/*CoWNER*/,oStZMA)

//Setando a chave primaria da rotina
oModel:SetPrimaryKey({'ZA0_FILIAL','ZA0_CHAVE','ZA0_ETAPA'})

// Adicionando descrição ao modelo
oModel:SetDescription("Modelo de dados do cadastro "+cTitulo)

// Setando a descrição do formulario
oModel:GetModel("FORMZA0"):SetDescription("Formulario do Cadastro "+cTitulo)

Return oModel

*-----------------------*
Static function ViewDef()
*-----------------------*
//Local aStruZMA  := ZMA->(dBstruct())
// Criação do objeito do modelo de dados da interface do cadastro de AUTOR/INTERPRETE
Local oModel:= FWLoadModel("mvc_za0")

// Criação do objeto do modelo de dados da Interface do cadastro de Autor/Interprete 
Local oStZA0    := FwFormSTRUCT(2,"ZA0")  // Pode se usar um terceiro parametro para filtrar os campos exibidos ( |cCampo | cCampo $ 'ZZA)

// Criado View como nulo
Local oView     := Nil

// Criando a view que sera o retorno da funçao e setando o modelo da rotina
oView := FWFormView():New()
oView:SetModel(oModel)

// Atribuindo Formularios para interface
 oView:AddField("VIEW_ZA0",oSTZA0, "FORMZA0")
 
// cRIANDO UM CONTAINER COM NOME ELA COM 100%
oView:CreateHorizontalBox("TELA",100)

// Colocando titulo do formulario
oView:EnableTitleView('VIEW_ZA0','Dados - '+cTitulo )

// Força o fechamento da janela na confirmação
oView:SetCloseOnOk({||.T.})

oView:SetOwnerView("VIEW_ZA0","TELA")

Return oView

*-----------------------*
User Function zza0lLeg()
*-----------------------*
Local aLegenda := {}

aadd(aLegenda,{"BR_VERDE"       ,"I=Iniciado"})
aadd(aLegenda,{"BR_AMARELO"     ,"E=Com erro"})
aadd(aLegenda,{"BR_VERMELHO"    ,"F=Encerrado"})

BrwLegenda(cTitulo,"Status",aLegenda)

Return 


