#INCLUDE "PROTHEUS.CH"
#INCLUDE "FWMVCDEF.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "RWMAKE.CH"

/*/ FONTE GERADO PARA MUDAR O CADASTRO DE FAIXAS PARA MVC. ESTม COM PROBLEMAS NA GRAVAวรO, POR ISSO NรO FOI USADO.
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ AGLT014  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 02/10/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Rotina desenvolvida para possibilitar o cadastramento das Faixas de Indicacao (Escala de valores).           บฑฑ
ฑฑบ          ณ Toda Faixa de Indicacao possui um codigo de Tipo de Faixa, as faixas sao utilizadas para bonificar ou        บฑฑ
ฑฑบ          ณ penalizar os produtores de acordo com o evento a ela relacionado.                 				            บฑฑ
ฑฑบ          ณ                                                                                   				            บฑฑ
ฑฑบ          ณ A faixa de indicacao eh expressa, independentemente da unidade de medida e eh normalmente estabelecida em    บฑฑ
ฑฑบ          ณ termos dos seus limites inferior e superior, por exemplo: 100 บC a 200 บC ou R$ 10,00 a R$ 20,00             บฑฑ
ฑฑบ          ณ ou 5 a 10 litros, etc..                                                              				        บฑฑ
ฑฑบ          ณ                                                                                   				            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ MIX do Leite.                   						                                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function AGLT114()

Local oBrowse 



oBrowse := FWmBrowse():New()
oBrowse:SetAlias( 'ZLA' )

//Descricao da Parte Superior Esquerda do Browse
oBrowse:SetDescripton("Faixas de Indica็ใo")

//Habilita os Botรตes Ambiente e WalkThru
oBrowse:SetAmbiente(.F.)
oBrowse:SetWalkThru(.F.)

//Adiciona legendas
//oBrowse:AddLegend( "ZLA_STATUS == 'A'", "GREEN"	, "Aberto"	)
//oBrowse:AddLegend( "ZLA_STATUS == 'F'", "RED"	, "Fechado"	)

//Desabilita os Detalhes da parte inferior do Browse
//oBrowse:DisableDetails()

//Ativa o Browse
oBrowse:Activate()

return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณMenuDef   บAutor  ณMicrosiga           บ Data ณ  07/31/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function MenuDef()

Local aRotina := {}

aAdd( aRotina, { 'Pesquisar'	, 'PesqBrw'        , 0, 1, 0, NIL } )
aAdd( aRotina, { 'Visualizar'	, 'VIEWDEF.AGLT114', 0, 2, 0, NIL } )
aAdd( aRotina, { 'Incluir' 		, 'VIEWDEF.AGLT114', 0, 3, 0, NIL } )
aAdd( aRotina, { 'Alterar' 		, 'VIEWDEF.AGLT114', 0, 4, 0, NIL } )
aAdd( aRotina, { 'Excluir' 		, 'VIEWDEF.AGLT114', 0, 5, 0, NIL } )

Return aRotina

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณModelDef  บAutor  ณMicrosiga           บ Data ณ  07/31/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ModelDef()

Local oStruZLA  :=  FWFormStruct(1,'ZLA') //Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
Local oStruZLAG :=  FWFormStruct(1,'ZLA')
Local oModel
Local _aGatilho := {}

//Instancia do Objeto de Modelo de Dados
oModel	:=	MpFormModel():New('MAGLT114', /*Pre-Validacao*/,{ |oModel| TudoOk(oModel)}/*Pos-Validacao*/,/*Commit*/,/*Commit*/,/*Cancel*/)

//Adiciona um modelo de Formulario de Cadastro Similar ร  Enchoice ou Msmget
oModel:AddFields('ZLAMASTER', /*cOwner*/, oStruZLA, /*bPreValidacao*/, /*bPosValidacao*/, /*bCarga*/ )

// Adiciona ao modelo uma estrutura de formulแrio de edi็ใo por grid
oModel:AddGrid('ZLADETAIL', 'ZLAMASTER', oStruZLAG, { |oModel, nLine,cAction, cField| ValidaLin(oModel, nLine, cAction, cField)} /*bLinePre*/, /*bLinePost*/, /*bPreVal*/,/*bPosVal*/, /*BLoad*/ )

/*
//Gatilhos nos campos da tabela ZLA
aAdd(_aGatilho	,FwStruTrigger('ZLA_LOCAL'   , 'ZLA_DESCLO'   , "ZH1->ZH1_DESCRI" , .T., 'ZH1', 1, 'xFilial("ZH1") + M->ZLA_LOCAL' ))
aAdd(_aGatilho	,FwStruTrigger('ZLA_CODQUA'  , 'ZLA_DESCQU'   , "ZL9->ZL9_DESCRI" , .T., 'ZL9', 1, 'xFilial("ZL9") + M->ZLA_CODQUA' ))
For ix := 1 to Len(_aGatilho)
	oStruZLA:AddTrigger( _aGatilho[ix][1], _aGatilho[ix][2], _aGatilho[ix][3], _aGatilho[ix][4] )
Next ix
*/

//Adiciona valida็ใo nos campos
//oStruZLA:SetProperty("ZLA_CODIGO"  , MODEL_FIELD_VALID , { || !ExistCPO("ZLA","ZLA_FILIAL+ZLA_CODIGO",1) } )

oModel:SetDescripton("Faixa de Indica็ใo")
oModel:GetModel( 'ZLAMASTER' ):SetDescription( 'Faixa Indica็ใo' )
oModel:GetModel( 'ZLADETAIL' ):SetDescription( 'Parametros da faixa' )

// Faz relaciomaneto entre os compomentes do model
oModel:SetRelation( 'ZLADETAIL', { { 'ZLA_FILIAL', 'xFilial( "ZLA" )' }, { 'ZLA_SETOR', 'ZLA_SETOR' },{ 'ZLA_COD', 'ZLA_COD' } }, ZLA->( IndexKey( 1 ) ) )


// Liga o controle de nao repeticao de linha
oModel:GetModel( 'ZLADETAIL' ):SetUniqueLine( { 'ZLA_FILIAL', 'ZLA_SETOR', 'ZLA_COD', 'ZLA_SEQ' } )



//Define chave primรกria do modelo de dados.
oModel:SetPrimaryKey({'ZLA_FILIAL', 'ZLA_SETOR', 'ZLA_COD', 'ZLA_SEQ'})

Return(oModel)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณViewDef   บAutor  ณMicrosiga           บ Data ณ  07/31/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ViewDef()

Local oStruZLA  :=  FWFormStruct(2,'ZLA') //Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
Local oStruZLAG :=  FWFormStruct(2,'ZLA')
Local oModel    :=  FwLoadModel("AGLT114")
Local oView		:=  FwFormView():New()      //Instancia do Objeto de Visualizaรงรฃo


//Remove campos desnecessแrios da view
RemoveFld(oStruZLA, oStruZLAG)

//Define o Modelo sobre qual a Visualizacao sera utilizada
oView:SetModel(oModel)

oView:SetDescripton("Faixa de Indica็ใo")


//Vincula o Objeto visual de Cadastro com o modelo
oView:AddField( 'VIEW_ZLA', oStruZLA, 'ZLAMASTER')

//Adiciona no nosso View um controle do tipo FormGrid(antiga newgetdados)
oView:AddGrid(  'VIEW_ZLAG', oStruZLAG, 'ZLADETAIL' )  


// Criar um "box" horizontal para receber algum elemento da view
oView:CreateHorizontalBox( 'SUPERIOR'	, 40 )
oView:CreateHorizontalBox( 'INFERIOR' 	, 60 )

// Relaciona o ID da View com o "box" para exibicao
oView:SetOwnerView( 'VIEW_ZLA'	, 'SUPERIOR' )
oView:SetOwnerView( 'VIEW_ZLAG'	, 'INFERIOR' )


// Define campos que terao Auto Incremento
oView:AddIncrementField( 'VIEW_ZLAG', 'ZLA_SEQ' ) 



Return(oView)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRemoveFld  บAutor  ณMicrosiga           บ Data ณ  07/20/15   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Remove campos da view.                                     บฑฑ
ฑฑบ          ณ                                                           บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function RemoveFld(oStruZLA, oStruZLAG)

	Local _aRemZLAG := {'ZLA_SETOR', 'ZLA_DCRSET','ZLA_COD','ZLA_DCRANA'} //,'ZLA_PEDIDO'
	Local _aRemZLA := {'ZLA_SEQ', 'ZLA_VALOR', 'ZLA_FXINI','ZLA_FXFIM','ZLA_SEQ'}
	Local _iRem    := 0

	For _iRem := 1 to Len(_aRemZLAG)
		oStruZLAG:RemoveField( _aRemZLAG[_iRem] )
	Next _iRem

	For _iRem := 1 to Len(_aRemZLA)
		oStruZLA:RemoveField( _aRemZLA[_iRem] )
	Next _iRem

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณTUDOOK   บAutor  ณMicrosiga           บ Data ณ  11/26/15   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function TudoOk(oModel)
                     
Local _lRetorno := .T.
Local oModelZLA := oModel:GetModel("ZLAMASTER")
Local _cSetor	:= oModelZLA:GetValue("ZLA_SETOR")
Local _cCod		:= oModelZLA:GetValue("ZLA_COD")
Local _nOpc      := oModel:GetOperation()
Local _lDelete   := _nOpc == 5
Local _lInclui   := _nOpc == 3
Local _lAltera   := _nOpc == 4


If _lAltera .or. _lInclui
	If Empty(_cSetor)
		Help( ,, 'Help',," Codigo do Setor nใo foi preenchido!", 1, 0 )
		_lRetorno := .f.
	EndIf
	If Empty(_cCod)
		Help( ,, 'Help',," Codigo da anแlise nใo foi preenchido!", 1, 0 )
		_lRetorno := .f.
	EndIf

EndIf


Return(_lRetorno)



/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ValidaLinบ Autor ณ Guilherme Fran็a   บ Data ณ 11/08/2015  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Fun็ใo de valida็ใo de exclusใo da linha na inclusใo e     บฑฑ
ฑฑบ          ณ altera็ใo.                                                 บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function ValidaLin( oModelGrid, nLinha, cAcao, cCampo )

Local _lRet := .T.
Local oModel := oModelGrid:GetModel()
Local oModelZLA := oModel:GetModel("ZLAMASTER")
Local oModZLAG := oModel:GetModel("ZLADETAIL")
Local _cSetor	:= oModelZLA:GetValue("ZLA_SETOR")
Local _cCod		:= oModelZLA:GetValue("ZLA_COD")
Local _nOpc      := oModel:GetOperation()
Local _lDelete   := _nOpc == 5
Local _lInclui   := _nOpc == 3
Local _lAltera   := _nOpc == 4
//Se a linha foi deletada, retorna o saldo do produtor origem
If _lInclui  .or. _lAltera
	oModZLAG:GoLine(nLinha) 
	oModZLAG:LoadValue("ZLA_SETOR",_cSetor)
	oModZLAG:LoadValue("ZLA_COD",_cCod)
	oModZLAG:LoadValue("ZLA_DCRSET",oModelZLA:GetValue("ZLA_DCRSET"))
	oModZLAG:LoadValue("ZLA_DCRANA",oModelZLA:GetValue("ZLA_DCRANA"))
EndIf

Return _lRet

