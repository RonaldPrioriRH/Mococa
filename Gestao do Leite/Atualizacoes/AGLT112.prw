#include "PROTHEUS.CH"
#INCLUDE 'FWMVCDEF.CH'
#INCLUDE 'TOPCONN.CH'      
#INCLUDE 'TOTVS.CH'

#DEFINE _ENTER CHR(13)+CHR(10)  
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ AGLT112  บ Autor ณ Guilherme Fran็a      บ Data da Criacao  ณ 05/04/2017  									บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Rotina para controle de empr้stimos, adiantamentos e renegocia็๕es do produtor.                              บฑฑ
ฑฑบ          ณ                                                                                            					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ 												                                                        		บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestใo do Leite                                                                       						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor    	บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	    	บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
*/  

User Function AGLT112()

Local oBrowse       

Private _aNumPed	:= {}

oBrowse := FWmBrowse():New()
oBrowse:SetAlias( 'ZLM' )
oBrowse:SetDescription( 'Adiantamentos' )       

//Legenda
oBrowse:AddLegend( "ZLM_STATUS == '1'", "WHITE", "Em Aberto")
oBrowse:AddLegend( "ZLM_STATUS == '2'", "GREEN", "Aprovado")
oBrowse:AddLegend( "ZLM_STATUS == '4'" ,"BLUE", "Efetivado")
oBrowse:AddLegend( "ZLM_STATUS == '3'" , "RED", "Reprovado")



oBrowse:Activate()                                  

Return NIL


//-------------------------------------------------------------------
Static Function MenuDef()
Local aRotina := {}

ADD OPTION aRotina Title 'Pesquisar'  	Action 'PesqBrw'         	OPERATION 1 ACCESS 0
ADD OPTION aRotina Title 'Visualizar'	Action 'U_AGLT12IN("V")' 	OPERATION 2 ACCESS 0
ADD OPTION aRotina Title 'Incluir'   	Action 'U_AGLT12IN("I")'	OPERATION 3 ACCESS 0
ADD OPTION aRotina TITLE 'Alterar'    	ACTION 'U_AGLT12IN("A")' 	OPERATION 4 ACCESS 0
//ADD OPTION aRotina Title 'Alterar'    	Action 'U_AGLT7IN("A")'		OPERATION 4 ACCESS 0
ADD OPTION aRotina TITLE 'Excluir'    	ACTION 'U_AGLT12IN("D")' 	OPERATION 5 ACCESS 0
ADD OPTION aRotina Title "Aprova็ใo"    Action 'U_AGLT112X("1")'	OPERATION 4 ACCESS 0
ADD OPTION aRotina Title "Reprovacao"   Action 'U_AGLT112X("3")'	OPERATION 4 ACCESS 0
ADD OPTION aRotina Title "Efetivacao"   Action 'U_AGLT112X("2")'	OPERATION 4 ACCESS 0
ADD OPTION aRotina Title "Estorno"   	Action 'U_AGLT112EST()'			OPERATION 4 ACCESS 0
ADD OPTION aRotina Title "Nota Promis." Action 'U_GLT_012NP()'		OPERATION 4 ACCESS 0
ADD OPTION aRotina Title 'Adt.Automatico' 	Action 'U_AGLT12AUT()'	OPERATION 3 ACCESS 0

//ADD OPTION aRotina Title 'Excluir'    	Action 'U_AGLT7IN("D")'		OPERATION 5 ACCESS 0
ADD OPTION aRotina TITLE 'Legenda' 		ACTION 'U_AGLT112L()'		OPERATION 2 ACCESS 0
Return aRotina

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ModelDef บ Autor ณ Guilherme Fran็a   บ Data ณ 05/04/2017  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Constru็ใo da View Def                                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/ 
Static Function ModelDef()
// Cria a estrutura a ser usada no Modelo de Dados
Local oStruZLM	:= FWFormStruct( 1, 'ZLM', /*bAvalCampo*/, /*lViewUsado*/ )
Local oStruZLO	:= FWFormStruct( 1, 'ZLO', /*bAvalCampo*/, /*lViewUsado*/ )
Local aTrigger := {}
Local oModel           
Local _i       := 0

// Cria o objeto do Modelo de Dados
oModel := 	MPFormModel():New( 'AGLT112M', /*bPreValidacao*/, { |oModel| TudoOk(oModel)}/*bPosValidacao*/,/*{ |oMdl| GeraPedid( oMdl ) }bCommit*/, /*bCancel*/ )

// criacao de trigger para preencher quantidade de litros do periodo
/*
[01] identificador (ID) do campo de origem
[02] identificador (ID) do campo de destino
[03] Bloco de c๓digo de valida็ใo da execu็ใo do gatilho
[04] Bloco de c๓digo de execu็ใo do gatilho


aQTDTrigger := {}
aQTDTrigger := FwStruTrigger('ZLM_CODPRO'   ,'ZLM_TOTMIX'   ,'U_AGLT112SLD(M->ZLM_MIX)',.F.)//,'',0,'',NIL,'01')
oStruZLM:AddTrigger(aQTDTrigger[1] ,aQTDTrigger[2] ,aQTDTrigger[3] ,aQTDTrigger[4] )
aAdd(aTrigger, FwStruTrigger('ZLM_PARC'   ,'ZLM_PAGTO'   ,'U_GLT_112JR()',.F.,'ZL3',1,'xFilial("ZLE")+M->ZLM_MIX')) modelo com posicione
*/           
aAdd(aTrigger, FwStruTrigger('ZLM_SA2COD'   ,'ZLM_SA2COD'  ,'IIF(LEN(ZLM_SA2COD)<6,"P"+STRZERO(VAL(ZLM_SA2COD),5),ZLM_SA2COD)',.F.))
aAdd(aTrigger, FwStruTrigger('ZLM_SA2COD'   ,'ZLM_SA2LJ'  ,'"01"',.F.,'SA2',0,'','Empty(M->ZLM_SA2LJ)'))
aAdd(aTrigger, FwStruTrigger('ZLM_SA2COD'   ,'ZLM_SA2NOM'  ,'SA2->A2_NOME',.T.,'SA2',1,'xFilial("SA2")+M->ZLM_SA2COD+"01"'))
aAdd(aTrigger, FwStruTrigger('ZLM_TOTAL'   ,'ZLM_PAGTO'   ,'U_GLT_112JR()',.F.,,,,'M->ZLM_TOTAL > 0'))
aAdd(aTrigger, FwStruTrigger('ZLM_VENCTO'   ,'ZLM_PAGTO'   ,'U_GLT_112JR()',.F.,,,,'M->ZLM_TOTAL > 0'))
aAdd(aTrigger, FwStruTrigger('ZLM_PARC'   ,'ZLM_PAGTO'   ,'U_GLT_112JR()',.F.,,,,'M->ZLM_TOTAL > 0'))
aAdd(aTrigger, FwStruTrigger('ZLM_JUROS'   ,'ZLM_PAGTO'   ,'U_GLT_112JR()',.F.,,,,'M->ZLM_TOTAL > 0'))
For _i := 1 to Len(aTrigger)
	oStruZLM:AddTrigger(aTrigger[_i][1] ,aTrigger[_i][2] ,aTrigger[_i][3] ,aTrigger[_i][4] )
Next _i

// Adiciona ao modelo uma estrutura de formulแrio de edi็ใo por campo
oModel:AddFields( 'ZLMMASTER', /*cOwner*/, oStruZLM )

// Adiciona ao modelo uma estrutura de formulแrio de edi็ใo por grid
oModel:AddGrid( 'ZLODETAIL', 'ZLMMASTER', oStruZLO, /*bLinePre*/, /*bLinePost*/, /*bPreVal*/,/*bPosVal*/, /*BLoad*/ )

// Adiciona a descricao do Componente do Modelo de Dados
oModel:SetDescription('Adiantamentos')
oModel:GetModel( 'ZLMMASTER' ):SetDescription( 'Dados Negocia็ใo' )
oModel:GetModel( 'ZLODETAIL' ):SetDescription( 'Parcelas' )

// Faz relaciomaneto entre os compomentes do model
oModel:SetRelation( 'ZLODETAIL', { { 'ZLO_FILIAL', 'xFilial( "ZLO" )' }, { 'ZLO_COD', 'ZLM_COD' } }, ZLO->( IndexKey( 1 ) ) )


// Liga o controle de nao repeticao de linha
oModel:GetModel( 'ZLODETAIL' ):SetUniqueLine( { 'ZLO_COD','ZLO_ITEM' } )


// Indica que ้ opcional ter dados informados na Grid
oModel:GetModel( 'ZLODETAIL' ):SetOptional(.F.)
//oModel:GetModel( 'ZLODETAIL' ):SetOnlyView(.T.)    

//oModel:GetModel( 'ZLO2DETAIL' ):SetNoInsertLine( .T. )
//oModel:GetModel( 'ZLO2DETAIL' ):SetNoUpdateLine( .T. )


//oModel:GetModel( 'ZLO2DETAIL' ):SetDescription( 'Destino' )

oModel:SetPrimaryKey({'ZLM_COD'}) 


Return oModel

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ViewDef  บ Autor ณ Guilherme Fran็a   บ Data ณ 05/04/2017  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Constru็ใo da View Def                                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/                                                                         

Static Function ViewDef()
// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
Local oStruZLM 	:= FWFormStruct( 2, 'ZLM' )
Local oStruZLO	:= FWFormStruct( 2, 'ZLO' )

// Cria a estrutura a ser usada na View
Local oModel   	:= FWLoadModel( 'AGLT112' ) 
Local oView

oStruZLO:RemoveField( 'ZLO_COD' )
oStruZLO:RemoveField( 'ZLO_FILENT' )
//oStruZLO:RemoveField( 'ZLO_LOTE' )

// Cria o objeto de View
oView := FWFormView():New()

// Define qual o Modelo de dados serแ utilizado
oView:SetModel( oModel )

//Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
oView:AddField( 'VIEW_ZLM', oStruZLM, 'ZLMMASTER' )

//Adiciona no nosso View um controle do tipo FormGrid(antiga newgetdados)
oView:AddGrid(  'VIEW_ZLO', oStruZLO, 'ZLODETAIL' )  


// Criar um "box" horizontal para receber algum elemento da view
oView:CreateHorizontalBox( 'SUPERIOR'	, 60 )
oView:CreateHorizontalBox( 'INFERIOR' 	, 40 )

// Relaciona o ID da View com o "box" para exibicao
oView:SetOwnerView( 'VIEW_ZLM'	, 'SUPERIOR' )
oView:SetOwnerView( 'VIEW_ZLO'	, 'INFERIOR' )

/*
// Criar um "box" horizontal para receber algum elemento da view
oView:CreateHorizontalBox( 'SUPERIOR'	, 30 )
oView:CreateHorizontalBox( 'MEIO'		, 35 ) 
oView:CreateHorizontalBox( 'INFERIOR' 	, 35 )

// Relaciona o ID da View com o "box" para exibicao
oView:SetOwnerView( 'VIEW_ZLM'	, 'SUPERIOR' )
oView:SetOwnerView( 'VIEW_ZLO1'	, 'MEIO' ) 
oView:SetOwnerView( 'VIEW_ZLO2'	, 'INFERIOR' )
*/
// Define campos que terao Auto Incremento
oView:AddIncrementField( 'VIEW_ZLO', 'ZLO_ITEM' ) 


// Criar novo botao na barra de botoes
//oView:AddUserButton( 'Inclui Autor', 'CLIPS', { |oView| COMP021BUT() } )

// Liga a identificacao do componente
//oView:EnableTitleView('VIEW_ZA2')
//oView:EnableTitleView('VIEW_ZLO1','LOTES')

// Liga a Edi็ใo de Campos na FormGrid
//oView:SetViewProperty( 'VIEW_ZD4', "ENABLEDGRIDDETAIL", { 50 } )

Return oView    

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ AGLT112L บAutor  ณ Guilherme Fran็a   บ Data ณ  05/04/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Legenda                                                    บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function AGLT112L()
BrwLegEnda("Adiantamentos","Adiantamentos",{ ;
{"BR_BRANCO","Em Aberto"},;// 1 - Branco   - Em aberto
{"ENABLE"   ,"Aprovado" },;// 2 - Verde    - Aprovado
{"DISABLE"  ,"Reprovado"},;// 3 - Vermelho - Reprovado
{"BR_AZUL"  ,"Efetivado"}})// 4 - Azul     - Efetivado(Gera SE2)
Return(.T.)


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ AGLT7IN  บAutor  ณ Guilherme Fran็a   บ Data ณ  05/04/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
USER Function AGLT12IN(_cTipo)

Local _cMsg := ""

IF _cTipo	= "I"                                                                            
	lOk := ( FWExecView('Valida็ใo de Inclusao','AGLT112', MODEL_OPERATION_INSERT,, ,  ) == 0 )
ELSEIF _cTipo	= "A" 
	IF !(ZLM->ZLM_STATUS $ "2/4")
		lOk := ( FWExecView('Valida็ใo de Altera็ใo','AGLT112', MODEL_OPERATION_UPDATE,, ,  ) == 0 )   
	ELSE
		xMagHelpFis("Valida็ใo","Nใo ้ permitido altera็ใo pois o registro jแ foi efetivado.",;
		"Execute a op็ใo Estorno antes de alterar.")
//			Help( ,, 'Valida็ใo',, _cMsg, 1, 0 )
	ENDIF
ELSEIF _cTipo = 'D'
	IF !(ZLM->ZLM_STATUS $ "4")
		lOk := ( FWExecView('Valida็ใo de Exclusใo','AGLT112', MODEL_OPERATION_DELETE,, ,  ) == 0 )
	ELSE
		ALERT(	"NรO ้ permitido EXCLUIR este movimento pois o registro jแ foi efetivado! Estorne o movimento antes de prosseguir!")
	ENDIF		
ELSEIF _cTipo = 'V'
		lOk := ( FWExecView('','AGLT112', MODEL_OPERATION_VIEW,, ,  ) == 0 )

ENDIF        


RETURN 


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GLT_012JRบ Autor ณ Abrahao               บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Gatilho que calcula juros e cria os itens com vencimentos e valores das prestacoes                           บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
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
User Function GLT_112JR()

Local oModel 	:= FWModelActive() 
Local oStruZLO	:= oModel:GetModel('ZLODETAIL')
Local oStruZLM	:= oModel:GetModel('ZLMMASTER')
Local oView 	:= FWViewActive()               
Local _nZLMTOTAL	:= oStruZLM:GetValue("ZLM_TOTAL")
Local _nZLMPARC		:= oStruZLM:GetValue("ZLM_PARC")
Local _nZLMJUROS	:= oStruZLM:GetValue("ZLM_JUROS")
Local _dZLMDTLIB	:= oStruZLM:GetValue("ZLM_DTLIB")
Local _dZLMVENCTO	:= oStruZLM:GetValue("ZLM_VENCTO")
Local _nZLMPAGTO	:= oStruZLM:GetValue("ZLM_PAGTO")

//Local _aArea := GetArea()
Local _nVlrPar :=0

Local aVenctos:={}
Local nTotJuros:=0
Local nVlrDevido:=0
Local nVlrAcum:=0

Local _nTxJuro := 0
Local _nCarencia := 0 //IIF(M->ZLM_CARENC=="S",1,0)
Local _nTotal := 0
Local _nDia20 := _dZLMDTLIB
Local _cTipoJur := Alltrim(SuperGetMv("LT_TIPOJUR",,"1")) // conte๚do "1" indica calculo Price, "2" indica SAC


If (_nZLMTOTAL!=0).And.(_nZLMPARC!=0) //.And.(M->ZLM_JUROS!=0)
	
	nVlrAcum:=_nZLMTOTAL
	For i:=1 To int(_nZLMPARC)
		nVlrAcum 	*= ((_nZLMJUROS/100)+1)
	Next i

	aVenctos:=somaMes(_dZLMVENCTO,int(_nZLMPARC)) // Obtem os vencimentos
	
	//Se nao for cobrado juros, divide o valor bruto pelas parcelas.
	If _nZLMJUROS = 0
		nVlrDevido 		:= round(_nZLMTOTAL,2)
		_nZLMPAGTO 	:= round(nVlrDevido,2)
		_nVlrPar := round(nVlrDevido/int(_nZLMPARC),2)
	Else
		_nTxJuro := round((_nZLMJUROS/100),3)

		//Se existe juros e serแ apenas uma parcela, faz o calculo direto da data atual ate o vencimento.
		If Len(aVenctos) == 1
			_nVlrPar := U_CalcJuros("J",_nZLMJUROS,_nZLMTOTAL,_nZLMPARC,0,_dZLMDTLIB,aVenctos[1],_cTipoJur)
			nVlrDevido 	    := round(_nVlrPar,2)
			_nZLMPAGTO    := round(_nVlrPar,2)
		Else
			_nTotal := _nZLMTOTAL
/*Comentado pois os emprestimos parcelados usam somente calculo price, independe da data de lan็amento.
			If Day(_dLZMDTLIB) < 20 //Se a data de referencia for menor que o dia vinte, atualiza o valor do calculo.
				_nDia20 := STOD(SubStr(DTOS(_dLZMDTLIB),1,6)+"20")
		        //Atualiza o valor para o dia vinte do mes corrente
				_nTotal := U_CalcJuros("J",M->ZLM_JUROS,M->ZLM_TOTAL,0,0,_dLZMDTLIB,_nDia20)
			EndIf
*/			//Calcula parcelamento no metodo Price ou SAC dependendo do parametro LT_TIPOJUR
	        _nVlrPar := U_CalcJuros("P",_nZLMJUROS,_nTotal,_nZLMPARC,_nCarencia,"","",_cTipoJur)				
			nVlrDevido 	    := round(_nVlrPar*int(_nZLMPARC),2)
			_nZLMPAGTO    := round(_nVlrPar*int(_nZLMPARC),2)
		EndIf

	EndIf
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณFIM DA MODIFICACAOณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	
	//--------------------------------------------
	// Preenche os itens
	//--------------------------------------------
	//aVenctos:=somaMes(_dZLMVENCTO,int(M->ZLM_PARC))
	nRest:=nVlrDevido
	For i:=1 To Len(aVenctos)
        
		If i > oStruZLO:Length()
			oStruZLO:AddLine()
		EndIf
	    
		oStruZLO:GoLine(i)
		If i!=len(aVenctos)
			oStruZLO:LoadValue("ZLO_ITEM",StrZero(i,3))
			oStruZLO:LoadValue("ZLO_VECTO",aVenctos[i])
			oStruZLO:LoadValue("ZLO_VALOR",round(_nVlrPar,2))

			nRest:=nRest-round(_nVlrPar,2)
		Else
			oStruZLO:LoadValue("ZLO_ITEM",StrZero(i,3))
			oStruZLO:LoadValue("ZLO_VECTO",aVenctos[i])
			oStruZLO:LoadValue("ZLO_VALOR",nRest)
		EndIf
	Next i
	oStruZLO:GoLine(1)	
	
//	oView:Refresh()

EndIf

//PswSeek(__CUSERID) //Posiciona no usuario logado
oStruZLM:SetValue("ZLM_USER",__CUSERID)
oStruZLM:SetValue("ZLM_NUSER",CUSERNAME)
//M->ZLM_NUSER := AllTrim(PswRet()[1][4])
//oStruZLM:SetValue("ZLM_DATA",dDataBase)



oStruZLM:SetValue("ZLM_VLRPAR",_nVlrPar)
oStruZLM:SetValue("ZLM_PAGTO",_nZLMPAGTO)


//RestArea(_aArea) 

Return _nZLMPAGTO


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ SOMAMES  บ Autor ณ Abrahao               บ Data da Criacao  ณ 03/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna array com os venctos mensais das parcelas                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Lancar os venctos de cada parcela                        			                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Data Inicial e Qtd de Parcelas									                      						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Array com venctos										                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
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
Static Function somaMes(dData,dParc)
Local sdata
Local firstDay := substr(dtos(dData),7,2)
Local ret:={}
Local ax:=0

For z:=1 To dParc
	aadd(ret,dData)
	sData := dtos(dData)
	ano := substr(SData,1,4)
	mes := substr(SData,5,2)
	dia := firstDay
	
	mes   := strzero(val(mes)+1,2)
	If (mes=="13")
		mes := "01"
		ax:= val(ano)
		ax++
		ano := ALLTRIM(str(ax))
	EndIf
	
	dData := stod(ano+mes+dia)
	If Empty(dData)
		dData := lastday(stod(ano+mes+"01"))
	EndIf
Next z

Return ret


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
                     
Local _aArea    := GetArea()
Local oStruZLM	:= oModel:GetModel('ZLMMASTER')
Local oStruZLO  := oModel:GetModel("ZLODETAIL")

Local _i

Local _cUsuario		:= oStruZLM:GetValue("ZLM_USER")
Local _cUserAP		:= oStruZLM:GetValue("ZLM_USERAP")
Local _cStatus		:= oStruZLM:GetValue("ZLM_STATUS")
Local _dZLMDTLIB	:= oStruZLM:GetValue("ZLM_DTLIB")
Local _dZLMVENCTO	:= oStruZLM:GetValue("ZLM_VENCTO")
Local _dZLMDATA		:= oStruZLM:GetValue("ZLM_DATA")
Local _nZLMPAGTO	:= oStruZLM:GetValue("ZLM_PAGTO")
Local _cZLMCOD		:= oStruZLM:GetValue("ZLM_COD")
Local _cZLMTIPO		:= oStruZLM:GetValue("ZLM_TIPO")
Local _cZLMPARC		:= oStruZLM:GetValue("ZLM_PARC")
Local _cZLMLJ		:= oStruZLM:GetValue("ZLM_SA2LJ")

Local _nOpc      := oModel:GetOperation()
Local _lDelete   := _nOpc == 5
Local _lInclui   := _nOpc == 3
Local _lAltera   := _nOpc == 4


Local lRet     := .T.
Local cAux     := " "
Local MV_PREF1 := " "

// -----------------------------------------------------------------
// Validacao para tipo diferente de emprestimo, so pode uma parcela
// -----------------------------------------------------------------
If !(_cZLMTIPO $ "E/R") .And. !_lDelete//Excluir
	If _cZLMPARC > 1
		xMagHelpFis("Parcelas","Quando o tipo for diferente de Adiant.Parc./renegocia็ใo, nใo poderแ ser utilizado mais de uma parcela.",;
		"Informe uma parcela ou entใo altere o tipo para Adiant.Parc./renegociacao.")
		Return(.F.)
	EndIf
EndIf


If Empty(_cZLMLJ)
	Help( ,,1,"Valida็ใo","Campo Loja nใo foi preenchido!", 1, 0 )
	Return .f.
EndIf 
/*
If M->_dZLMDTLIB > M->_dZLMVENCTO
	xMagHelpFis("Vencimento","O vencimento nao pode ser menor que a data de referencia.",;
	"O vencimento normalmente ้ no dia 12 do mes seguinte. Ex: Referencia 30/11/10 Vencimento 12/12/10.")
	lRet := .F.
EndIf

If M->_dZLMDTLIB != LASTDAY(M->_dZLMDTLIB)
	xMagHelpFis("Referencia","Data de referencia esta incorreta!",;
	"Data de referencia deve ser o ultimo dia do mes.")
	lRet := .F.
EndIf
*/
If _dZLMDATA > _dZLMVENCTO
	xMagHelpFis("Data","A data de pagamento nao pode ser maior que o 1บ vencimento.",;
	"A data de pagamento deve ser igual a database ou menor que o vencimento.")
	lRet := .F.
EndIf

If _lAltera .And. lRet // alterar
	lRet:=.F.
	If ALLTRIM(_cUsuario) == __CUSERID .And. (_cStatus == "1" .Or. _cStatus == "2")
		lRet:=.T.
	Else
		If ALLTRIM(_cUserAP) == __CUSERID .Or. Empty(ALLTRIM(_cUserAP))
			If iAvaliar .And. Permissao(__CUSERID,"Aprovar")// botao avaliacao do browse
				lRet := .T.
				Return(lRet)
			Else
				xMagHelpFis("Restricao","A solicitacao nao pode ser alterada!","Verifique se seu usuario tem permissao para alterar ou se o usuario que esta tentando alterar ้ diferente do usuแrio que incluiu o empr้stimo!")
			EndIf
		Else
			xMagHelpFis("Restricao","A solicitacao nao pode ser alterada!","Verifique se seu usuario tem permissao para alterar ou se o usuario que esta tentando alterar ้ diferente do usuแrio que incluiu o empr้stimo!")
		EndIf
	EndIf
EndIf

If _lDelete  // excluir
	lRet:=.F.
	
	// -----------------------------------------
	// ObtEndo Parametos dos EMPRESTIMOS
	// -----------------------------------------
	MV_EVENT := IIF(_cZLMTIPO=="E",ALLTRIM(GetMv("LT_EVTEMP")),IIF(_cZLMTIPO=="A",ALLTRIM(GetMv("LT_EVTADT")),ALLTRIM(GetMv("LT_EVTREN"))))
	DbSelectArea("ZL8")
	DbSetOrder(1)
	If DbSeek(xFilial("ZL8")+MV_EVENT)
		MV_PREF1 :=  ZL8->ZL8_PREFIX
    EndIf
	

	If ALLTRIM(_cUserAP) == ALLTRIM(__CUSERID)
		If MsgYesNo("Tem certeza que deseja excluir?")
			If !ExistTit(MV_PREF1,_cZLMCOD)
				lRet := .T.
				Return(lRet)
			Else
				xMagHelpFis("Restricao","Nao foi possivel excluir por existirem titulos no financeiro!","Exclua os titulos no financeiro referentes a essa solicitacao!")
			EndIf
		EndIf
	EndIf
	
	If ALLTRIM(_cUsuario) == ALLTRIM(__CUSERID) .And. (_cStatus $ "1/2")
		If MsgYesNo("Tem certeza que deseja excluir?")
			lRet:=.T.
		EndIf
	Else
		xMagHelpFis("Restricao","A solicitacao nao pode ser alterada!","Verifique se seu usuario tem permissao para alterar ou o Status da solicitacao  ou se o usuario que esta tentando alterar ้ diferente do usuแrio que incluiu o empr้stimo!")
	EndIf
EndIf

Return(lRet)


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ ExistTit บ Autor ณ Abrahao               บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Verifica se existe um determinado titulo no SE1 ou SE2                                                       บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Para validar a inclusao do titulo ou exclusao            			                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ ex_tabela(Nome da Tabela SE1 ou SE2) ex_prefixo(Prefixo do Titulo) ex_num(Numero do titulo					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
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
Static Function ExistTit(EX_PREFIXO,EX_NUM)

Local lRet  := .F.
Local cArea := GetArea()


_cQuery := " SELECT"
_cQuery += " E1_PREFIXO AS PREF,E1_NUM AS NUM "
_cQuery += " FROM "+RetSqlName("SE1")+" SE1 "
_cQuery += " WHERE D_E_L_E_T_ = ' '"
_cQuery += " AND E1_PREFIXO = '"+EX_PREFIXO+"'"
_cQuery += " AND E1_NUM = '"+EX_NUM+"'"
_cQuery += " AND E1_L_EVENT <> '' "
_cQuery := " UNION ALL "	
_cQuery := " SELECT"
_cQuery += "  E2_PREFIXO AS PREF,E2_NUM AS NUM "
_cQuery += " FROM "+RetSqlName("SE2")+" SE2 "
_cQuery += " WHERE "
_cQuery += " D_E_L_E_T_ = ' '"
_cQuery += " AND E2_PREFIXO = '"+EX_PREFIXO+"'"
_cQuery += " AND E2_NUM = '"+EX_NUM+"'"
_cQuery += " AND E2_L_EVENT <> '' "	

If Select("TRB") <> 0
	TRB->(dbCloseArea("TRB"))
EndIf
dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(_cQuery))),'TRB',.F.,.T.)
	
While TRB->(!Eof())
	lRet := .T.
	TRB->(dbSkip())
EndDo
	
TRB->(dbclosearea())


RestArea(cArea)
Return(lRet)


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ AGLT112X บ Autor ณ Abrahao               บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Avaliacao/Efetivacao multipla das solicitacoes                                                               บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Tipo (1=avaliacao,2=efetivacao)									                      						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
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
User Function AGLT112X(cTpAplic)

Local cCadastro := ""
Local cLabel    := ""
Local cVarQ   	:= "  "
Local nOpcA     := 0
Local x         := 0
Local lMarca    := .F.
Local oOk	  	:= LoadBitmap( GetResources(), "LBOK" )
Local oNo	  	:= LoadBitmap( GetResources(), "LBNO" )
Local oF3
Local oDlg
Local oGet01
Local aArea := GetArea()
Private cPerg := "AGLT112   "
Private aDados    := {}
Private nVlrTotal := 0 
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Quando o usuario tiver acesso a aprovacao, automaticamente tambem ณ
//ณ tem acesso a Reprovacao.                                          ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If !Permissao(__CUSERID,Iif(cTpAplic=="2","Efetivar","Aprovar"))
	xMagHelpFis("Atencao","Seu usuario nao possui permissao para efetuar essa rotina!","Solicite essa permissao ao administrador do sistema!")
	Return
EndIf

ValidPerg()

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Preenche os parametros da rotina, para evitar que o usuario tenha que fazer isso.    ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
dbSelectArea("SX1")
dbSetOrder(1)
dbSeek(cPerg)

While SX1->(!Eof()) .And. ALLTRIM(SX1->X1_GRUPO) == ALLTRIM(cPerg)
	
	If SX1->X1_ORDEM == "01"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := ZLM->ZLM_SETOR //Setor
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "02"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := DTOC(ZLM->ZLM_DATA) //Da Data
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "03"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := DTOC(ZLM->ZLM_DATA) //Ate Data
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "04"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := ZLM->ZLM_COD //Do Nro
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "05"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := ZLM->ZLM_COD //Ao Nro
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "06"
		RecLock("SX1",.F.)
		//SX1->X1_PRESEL := If(ZLM->ZLM_TIPO=="E",1,2) //Tipo: Emprestimo/Adiantamento
		SX1->X1_PRESEL := If(ZLM->ZLM_TIPO=="E",1,If(ZLM->ZLM_TIPO=="A",2,3)) //Tipo: Emprestimo/Adiantamento/Cota Capital
		MsUnLock()
	EndIf
	dbSkip()
EndDo

RestArea(aArea) 

If !Pergunte(cPerg)
	Return
EndIf

dbSelectArea("ZLM")
dbSetorder(1)
dbGoTop()

Processa({|| GetaDados(cTpAplic) })

If len(aDados)==0
	xMagHelpFis("Mensagem","Nao foram encontrados solicita็๒es aprovadas!","ษ preciso que existam solicita็๕es "+Iif(cTpAplic=="1","em aberto","aprovadas")+" para essa rotina!")
	Return
EndIf

aSort(aDados,,,{|x,y| x[4] > y[4] })

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Montando o list box          ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
DEFINE MSDIALOG oDlg TITLE "Adiantamentos. - "+Iif(cTpAplic=="1","Aprovar",If(cTpAplic=="2","Efetivar","Reprovar")) From 0,0 To 25,95 OF oMainWnd
@ 005,005 To 150,365 LABEL cLabel Pixel OF oDlg

@ 010,010 LISTBOX oF3	VAR cVarQ Fields HEADER "",OemToAnsi("Solicitacao"),OemToAnsi("Setor"),OemToAnsi("Nome"),OemToAnsi("Valor Total"),OemToAnsi("Parcelas"),OemToAnsi("Juros"),OemToAnsi("Vlr. Parcela"),OemToAnsi("Volume(M้dio)"),OemToAnsi("REnda Liq.(M้dia)") ;
COLSIZES 12,25,15,25,25,25,25,25,25,25 ;
SIZE 350,135 ON DBLCLICK (aDados:=F3Troca(oF3:nAt,aDados,oGet01,1,1),oF3:Refresh(),rCalc(aDados,5),oVlrTotal:Refresh()) Pixel Of oDlg

oF3:SetArray(aDados)
oF3:bLine := { || {If(aDados[oF3:nAt,1],oOk,oNo),aDados[oF3:nAt,2],aDados[oF3:nAt,3],aDados[oF3:nAt,4],aDados[oF3:nAt,5],aDados[oF3:nAt,6],aDados[oF3:nAt,7],aDados[oF3:nAt,8],aDados[oF3:nAt,9],aDados[oF3:nAt,10]}}

DEFINE SBUTTON FROM 160,010 TYPE 01 ACTION Processa( {|| nOpca := 1,Grv_Apr(aDados,cTpAplic),oDlg:End() } ) ENABLE OF oDlg
DEFINE SBUTTON FROM 160,050 TYPE 02 ACTION (nOpca := 0,oDlg:End()) ENABLE OF oDlg
@160,090 Button OemToAnsi("Visualizar") Size 50,11 Action {|| openSol(oF3:nAt,aDados) } OF oDlg PIXEL
@160,150 Button OemToAnsi("Imprimir")   Size 50,11 Action {|| U_RGLT030(aDados) } OF oDlg PIXEL
@162,280 SAY "Valor Total:" Pixel OF oDlg
@160,310 MSGET oVlrTotal var nVlrTotal Picture "@E 99,999,999.99" when .F. Size 50,10 OF oDlg PIXEL

// Calcula total dos ja marcados
rCalc(aDados,5)
oVlrTotal:Refresh()

ACTIVATE MSDIALOG oDlg CENTERED

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ rCalc    บ Autor ณ TOTVS              บ Data ณ  17/12/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Abre solicitacao para visualizacao.                        บฑฑ
ฑฑบ          ณ Rotina chamada pela avaliacao e efetivacao.                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function OpenSol(nItem,aLista)

Local nSolic

nSolic := aLista[nItem,2]

dbSelectArea("ZLM")
dbSetorder(1)
If dbSeek(xFILIAL("ZLM")+nSolic)
	// Tela de visualizacao do Emprestimo
	U_AGLT12IN("V")
EndIf

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ rCalc    บ Autor ณ TOTVS              บ Data ณ  17/12/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function rCalc(aLista,nPosTotal)

nVlrTotal:=0
For x:=1 To Len(aLista)
	If aLista[x,1] == .T.
		nVlrTotal += aLista[x,nPosTotal]
	EndIf
Next x

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ GetaDadosบ Autor ณ TOTVS              บ Data ณ  17/12/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GetaDados(cTpAplic)

Local nQtdReg
Local cXtipo := ""

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Quando se trata de Reprovacao, muda-se o conteudo da variavel ณ
//ณ para que sejam listados todos os emprestimos aprovados e em   ณ
//ณ aberto.                                                       ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If cTpAplic == "3"
	cTpAplic := "1/2"
EndIf

If MV_PAR06 == 1 // Emprestimo
	cXtipo := "E"
	//ElseIf MV_PAR06 == 2 // Financiamento
	//	cXtipo := "N"
Elseif MV_PAR06 == 2
	cXtipo := "A" //Adiantamento
Else
	cXtipo := "R" //Renegocia็ใo
EndIf

Count To nQtdReg

ProcRegua(nQtdReg)

ZLM->(dbGoTop())

While ZLM->(!Eof())
	IncProc()
	If ZLM->ZLM_STATUS $ cTpAplic // 1-Em aberto 2-Aprovada
		If ZLM->ZLM_SETOR == MV_PAR01 .And. ZLM->ZLM_DATA >= MV_PAR02 .And. ZLM->ZLM_DATA <= MV_PAR03 ;
			.And. ZLM->ZLM_COD >= MV_PAR04 .And. ZLM->ZLM_COD <= MV_PAR05 ;
			.And. ZLM->ZLM_TIPO == cXtipo .AND. ZLM->ZLM_FILIAL == xFilial("ZLM")
			nProducao := U_GETMEDVOL(ZLM_SA2COD,ZLM_SA2LJ)
			nFatura   := U_GETMEDFAT(ZLM_SA2COD,ZLM_SA2LJ)
			aAdd(aDados,{ Iif( (nFatura*0.5)>ZLM_VLRPAR , .T. , .F. ) ,;  // 1
			ZLM_COD,;                                               // 2
			ALLTRIM(POSICIONE("ZL2",1,xFILIAL("ZL2")+ZLM_SETOR,"ZL2_DESCRI")),; // 3
			POSICIONE("SA2",1,xFILIAL("SA2")+ZLM_SA2COD+ZLM_SA2LJ,"A2_NOME"),; // 4
			ZLM_TOTAL,ZLM_PARC,ZLM_JUROS,ZLM_VLRPAR,nProducao,nFatura})
		EndIf
	EndIf
	ZLM->(dbSkip())
EndDo

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ Grv_Apr  บ Autor ณ Abrahao               บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Grava avaliacao/efetivacao multpla                                                                           บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
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
Static Function Grv_Apr(aGrv,ctp)

Local aTCab:={}
Local aTitens:={}
Local lok := .T.

ProcRegua(len(aGrv))

For y:=1 To Len(aGrv)
	
	IncProc("Gerando Titulo "+aGrv[y,2])
	
	Begin Transaction
	
	If aGrv[y,1] == .T.
		dbSelectArea("ZLM")
		dbSetorder(1)
		dbGoTop()
		wProcura := dbSeek(xFILIAL("ZLM")+aGrv[y,2])
		If wProcura
			RecLock("ZLM",.F.)
			ZLM->ZLM_DTAPRO := dDataBase
			If ctp == "1" // aprovar
				ZLM->ZLM_STATUS := "2"
				ZLM->ZLM_USERAP := __CUSERID //U_UCFG001(1)
				ZLM->ZLM_NUSEAP := AllTrim(CUSERNAME)
//			MsUnlock()
			EndIf
			If ctp == "2" // efetivar
				aTcab := {ZLM->ZLM_COD,ZLM->ZLM_SA2COD,ZLM->ZLM_SA2LJ,ZLM->ZLM_TOTAL,ZLM->ZLM_DTLIB,ZLM->ZLM_TIPO,ZLM->ZLM_DATA,ZLM->ZLM_VENCTO,ZLM->ZLM_OBS}
				aTitens:={}
				dbSelectArea("ZLO")
				dbSetorder(1)
				dbSeek(xFILIAL("ZLM")+ZLM->ZLM_COD)
				While xFILIAL("ZLM")+ZLM->ZLM_COD==xFILIAL("ZLO")+ZLO->ZLO_COD .And. !Eof()
					aAdd(aTitens,{ZLO->ZLO_VECTO,ZLO->ZLO_VALOR})
					dbSkip()
				EndDo
				dbclosearea("ZLO")
				
				lOk := .T.
				lOk := IncluiTit(aTCab,aTItens)
				
			EndIf
			If ctp == "3" // Reprovar
				ZLM->ZLM_STATUS := "3"
				ZLM->ZLM_USERAP := __CUSERID //U_UCFG001(1)
				ZLM->ZLM_NUSEAP := AllTrim(PswRet()[1][4]) //U_GetNUser(U_UCFG001(1))
			EndIf
			MsUnlock()
			dbclosearea("ZLM")
		EndIf
	EndIf
	
	If !lOk
		DisarmTransaction()
	EndIf
	
	End Transaction
	
Next y

Return(ZLM->ZLM_STATUS)


/*/
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณ F3Troca  ณ Autor ณ Microsiga             ณ Data ณ 00/00/00 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ Tela para selecao da TES.                                  ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณParametrosณ ExpN1 - Posicao do Array.                                  ณฑฑ
ฑฑณ          ณ ExpA1 - Array com todas as TES.                            ณฑฑ
ฑฑณ          ณ ExpO1 - ObjeTo para Refresh.                               ณฑฑ
ฑฑณ          ณ ExpN2 - Opcao:                                             ณฑฑ
ฑฑณ          ณ               1=Marca/Desmarca.                            ณฑฑ
ฑฑณ          ณ               2=Marca Todos/Desmarca Todos.                ณฑฑ
ฑฑณ          ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณUso       ณ MostraF3                                                   ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
/*/
Static Function F3Troca(nIt,aArray,oGet,nOpc,nPos)

Local i      := 0
Local lMarca := If(!aArray[nIt,nPos],.T.,.F.)

If nOpc == 1 //Marca/Desmarca
	aArray[nIt,nPos] := !aArray[nIt,nPos]
Else //Marca Todos/Desmarca Todos
	For i:=1 To Len(aArray)
		aArray[i,nPos] := lMarca
	Next i
EndIf

If oGet != Nil
	oGet:Refresh()
EndIf

Return aArray

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ AGLT112ESTบ Autor ณ TOTVS              บ Data ณ  17/12/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function AGLT112EST()

Local MV_PREF1,MV_TIPO1,MV_NATU1
Local MV_PREF2,MV_TIPO2,MV_NATU2
Local MV_EVENT := ""
Local nParcelas:=0
Local lok := .T.
Local _cZLMTIPO := ZLM->ZLM_TIPO

If ZLM->ZLM_STATUS == "1"
	xMagHelpFis("Estorno","Essa solicitacao nao pode ser Estornada por nao ter sido Aprovada/Efetivada!","Selecione uma solicitacao efetivada.")
	Return
EndIf

If ZLM->ZLM_STATUS == "2" .OR. ZLM->ZLM_STATUS == "3"
	RecLock("ZLM",.F.)
	ZLM->ZLM_STATUS = "1"
	ZLM->ZLM_USERAP := ""
	ZLM->ZLM_NUSEAP := ""
	MsUnlock()
	Return
EndIf

// -----------------------------------------
// ObtEndo Parametos dos EMPRESTIMOS
// -----------------------------------------
MV_EVENT := IIF(_cZLMTIPO=="E",ALLTRIM(GetMv("LT_EVTEMP")),IIF(_cZLMTIPO=="A",ALLTRIM(GetMv("LT_EVTADT")),ALLTRIM(GetMv("LT_EVTREN"))))
DbSelectArea("ZL8")
DbSetOrder(1)
If DbSeek(xFilial("ZL8")+MV_EVENT)
	MV_PREF1 := MV_PREF2 := ZL8->ZL8_PREFIX
	MV_TIPO1 := ALLTRIM(GetMv("LT_EMPTP1"))
	MV_TIPO2 := ALLTRIM(GetMv("LT_EMPTP2"))
	MV_NATU1 := ZL8->ZL8_NATPRD	//Nat. Tit Rec
	MV_NATU2 := ZL8->ZL8_NATFRT	//Nat. Tit Pag
	
	MV_TIPO1 := IIF(Len(MV_TIPO1)==2,MV_TIPO1+" ",MV_TIPO1)
EndIf

If !MsgYesNo("Essa rotina irแ cancelar a efetivacao (titulos financeiros) dessa solicitacao. Deseja continuar?")
	Return
EndIf

Begin Transaction

// Deleta o NF
If !U_ExcluSE2(MV_PREF1,ZLM->ZLM_COD,STRZERO(1,TamSx3("E2_PARCELA")[1]),MV_TIPO1,ZLM->ZLM_SA2COD,ZLM->ZLM_SA2LJ)
	lok := .F.
EndIf

RecLock("ZLM",.F.)
ZLM->ZLM_STATUS = "1"
MsUnlock()

If lok
	// Deleta as Parcelas
	For nParcelas:=1 To int(ZLM->ZLM_PARC)
		If !U_ExcluSE1(xFilial("SE1"),MV_PREF1,ZLM->ZLM_COD,STRZERO(nParcelas,TamSx3("E2_PARCELA")[1]),MV_TIPO1,ZLM->ZLM_SA2COD,ZLM->ZLM_SA2LJ)
			lok:=.F.
		EndIf
	Next nParcelas
EndIf
	
If !lok
	xMagHelpFis("Erro no Titulo","Falha ao deletar os titulos no financeiro!","Comunique ao Suporte!")
	DisarmTransaction()
EndIf

End Transaction
Return


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GLT_012F บ Autor ณ Abrahao               บ Data da Criacao  ณ 29/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Cria titulos no contas a receber referentes ao emprstimo                                                     บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
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
Static Function IncluiTit(aCab,aItens)

Local MV_PREF1,MV_TIPO1,MV_NATU1 // Variaveis usadas nos titulos de debito
Local MV_PREF2,MV_TIPO2,MV_NATU2 // Variaveis usadas no titulo de credito
Local MV_EVENT	:= ""
Local _lTitOk   := .T.
Local lOk2     := .T.
Local nRest    := 0
Local nTam     := TamSX3("E2_PARCELA")[1]
Local cHist    := ""
Local nVlTxPer := 0
Local cEntrg   := ""
Local dVencto  := dDataBase
Local dEmissa  := dDataBase
Local nRest    := 0
Local nValor   := 0
Local nJuros   := 0
Local _nTaxa	:= 0
Local _lBaixou := .f.
Local _cTpFor	:= Posicione("SA2",1,xFilial("SA2")+ZLM->ZLM_SA2COD+ZLM->ZLM_SA2LJ,"A2_L_TPFOR")

Private _aAutoSE2 := {}
Private lMsErroAuTo := .F.

ProcRegua(2)
IncProc()

// -----------------------------------------
// ObtEndo Parametos dos EMPRESTIMOS
// -----------------------------------------
If aCab[6] == "E"
	
	MV_EVENT := ALLTRIM(GetMv("LT_EVTEMP"))	//Evento 110023		Pagar 0224008  Receber 0224009                                                                                                                                                                                                                                                       
	DbSelectArea("ZL8")
	DbSetOrder(1)
	If DbSeek(xFilial("ZL8")+MV_EVENT)
		MV_PREF1 := MV_PREF2 := ZL8->ZL8_PREFIX
		MV_TIPO1 := ALLTRIM(GetMv("LT_EMPTP1"))
		MV_TIPO2 := ALLTRIM(GetMv("LT_EMPTP2"))
		If _cTpFor == "P"
			//MV_NATU1 := ZL8->ZL8_NATPRD	//Nat. Tit Rec
			//MV_NATU2 := ZL8->ZL8_NATPRD	//Nat. Tit Rec Errado 
			MV_NATU1 := ZL8->ZL8_NATPRD	//Nat. Tit Rec
			MV_NATU2 := ZL8->ZL8_NATFRT	//Nat. Tit Pag 
		Else
			//MV_NATU1 := ZL8->ZL8_NATFRT	//Nat. Tit Pag Errado
			//MV_NATU2 := ZL8->ZL8_NATFRT //Nat. Tit Pag
			MV_NATU1 := ZL8->ZL8_NATPRD	//Nat. Tit Rec
			MV_NATU2 := ZL8->ZL8_NATFRT	//Nat. Tit Pag
		EndIf
	Else
		xMagHelpFis("Erro no Titulo","Nใo foi encontrado o evento de empr้stimo: "+MV_EVENT+" Os titulos nใo serแ incluidos no financeiro.",;
		"Verifique o conteudo do parโmetro LT_EVTEMP no configurador.")		
		DisarmTransaction()
		Return
	EndIf
EndIf

// -----------------------------------
// ObtEndo Parametos dos ADIANTAMENTOS
// -----------------------------------
If aCab[6] == "A"
	MV_EVENT := ALLTRIM(GetMv("LT_EVTADT"))  //Evento 110024		Pagar 0224010   Receber 0224011                                                                                                                                                                                                                                           
	DbSelectArea("ZL8")
	DbSetOrder(1)
	If DbSeek(xFilial("ZL8")+MV_EVENT)
		MV_PREF1 := MV_PREF2 := ZL8->ZL8_PREFIX
		MV_TIPO1 := ALLTRIM(GetMv("LT_EMPTP1"))
		MV_TIPO2 := ALLTRIM(GetMv("LT_EMPTP2"))
		If _cTpFor == "P"
			//MV_NATU1 := ZL8->ZL8_NATPRD	//Nat. Tit Rec
			//MV_NATU2 := ZL8->ZL8_NATPRD	//Nat. Tit Rec Errado
			MV_NATU1 := ZL8->ZL8_NATPRD	//Nat. Tit Rec
			MV_NATU2 := ZL8->ZL8_NATFRT	//Nat. Tit Pag
		Else
			//MV_NATU1 := ZL8->ZL8_NATFRT	//Nat. Tit Pag Errado
			//MV_NATU2 := ZL8->ZL8_NATFRT	//Nat. Tit Pag
			MV_NATU1 := ZL8->ZL8_NATPRD	//Nat. Tit Rec
			MV_NATU2 := ZL8->ZL8_NATFRT	//Nat. Tit Pag
		EndIf
	Else
		xMagHelpFis("Erro no Titulo","Nใo foi encontrado o evento de adiantamento: "+MV_EVENT+" Os titulos nใo serแ incluidos no financeiro.",;
		"Verifique o conteudo do parโmetro LT_EVTADT no configurador.")		
		DisarmTransaction()
		Return
	EndIf
EndIf

// -----------------------------------
// ObtEndo Parametos de renegocia็๕es
// -----------------------------------
If aCab[6] == "R"
	MV_EVENT := ALLTRIM(GetMv("LT_EVTREN"))   //Evento 110025		Pagar 0224012  Receber 0224013 
	DbSelectArea("ZL8")
	DbSetOrder(1)
	If DbSeek(xFilial("ZL8")+MV_EVENT)
		MV_PREF1 := MV_PREF2 := ZL8->ZL8_PREFIX
		MV_TIPO1 := "NF "
		MV_TIPO2 := "NF "
		If LEFT(ZLM->ZLM_SA2COD,1) $ "P"
			//MV_NATU1 := ZL8->ZL8_NATPRD //Nat. Tit Rec
			//MV_NATU2 := ZL8->ZL8_NATPRD //Nat. Tit Rec Errado
			MV_NATU1 := ZL8->ZL8_NATPRD	//Nat. Tit Rec
			MV_NATU2 := ZL8->ZL8_NATFRT	//Nat. Tit Pag
		Else
			//MV_NATU1 := ZL8->ZL8_NATFRT //Nat. Tit Pag Errado
			//MV_NATU2 := ZL8->ZL8_NATFRT //Nat. Tit Pag
			MV_NATU1 := ZL8->ZL8_NATPRD	//Nat. Tit Rec
			MV_NATU2 := ZL8->ZL8_NATFRT	//Nat. Tit Pag
		EndIf
	Else
		xMagHelpFis("Erro no Titulo","Nใo foi encontrado o evento de adiantamento: "+MV_EVENT+" O(s) titulo(s) nใo serแ(ใo) incluido(s) no financeiro.",;
		"Verifique o conteudo do parโmetro LT_EVTREN no configurador.")		
		DisarmTransaction()
		Return
	EndIf
EndIf




// -----------------------------------------
// ObtEndo Parametos das FINANCIAMENTOS
// -----------------------------------------
If aCab[6] == "N"
	MV_PREF1 := ALLTRIM(GetMv("LT_ANTPX1"))
	MV_PREF2 := ALLTRIM(GetMv("LT_ANTPX2"))
	MV_TIPO1 := ALLTRIM(GetMv("LT_ANTTP1"))
	MV_TIPO2 := ALLTRIM(GetMv("LT_ANTTP2"))
	If LEFT(aCab[2],1) $ "P"
		MV_NATU1 := ALLTRIM(GetMv("LT_ANTNT1"))
		MV_NATU2 := ALLTRIM(GetMv("LT_ANTNT2"))
	Else
		MV_NATU1 := ALLTRIM(GetMv("LT_ANTNT3"))
		MV_NATU2 := ALLTRIM(GetMv("LT_ANTNT4"))
	EndIf
EndIf

// -----------------------------------------
// Obtendo Parametos das COTAS DE CAPITAL
// -----------------------------------------

If aCab[6] == "C" .AND. LEFT(aCab[2],1) $ "C"
	MV_PREF1 := ALLTRIM(GetMv("LT_COTPX1"))
	MV_TIPO1 := ALLTRIM(GetMv("LT_COTTP1"))
	MV_NATU1 := ALLTRIM(GetMv("LT_COTNT1"))
EndIf
//Se eh debito do produtor, grava valor da Taxa de Permanencia para cobrar juros.
_nTaxa := GETMV("LT_TXPER")/30 //U_BUSCATAXA("BOL","BO") / 30
_nTaxa := Round(_nTaxa,4)

nVlTxPer := _nTaxa //If(MV_TIPO1=="NDF",_nTaxa,0)

If (!ExistTit(MV_PREF1,aCab[2])) .and. !empty(MV_PREF1)
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Laco de processamento das parcelas, le cada parcela e gera o titulo NDF. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	For ix:=1 To Len(aItens)
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Tratamento para separar os juros do valor da parcela do emprestimo.                 ณ
		//ณ O titulo sera gerado com o valor normal e no campo acrescimo sera gravado os juros. ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		If iX!=len(aItens)
			nValor:=round(aCab[4]/len(aItens),2)
			nRest+=nValor
		Else
			nValor:=aCab[4]-nRest
		EndIf
		nJuros:=round(aItens[iX,2]-nValor,2)
		
		
		dbSelectArea("SA1")
		dbSetOrder(1)
		dbSeek(xFILIAL("SA1")+aCab[2]+aCab[3])
		cEntrg := "" //U_GetFilEnt(SA1->A2_COD,SA2->A2_LOJA,aCab[5])//Filial de entrega da linha do produtor
		
		dVencto := Iif(aCab[6]=="A",aCab[8],aItens[ix,1])
		dEmissa := aCab[5]

        cHist := IIF(Empty(Alltrim(aCab[9])),"ADIANTAMENTO",Alltrim(aCab[9]))
        cHist := cHist + " "+ ALLTRIM(STR(ix))+"/"+ALLTRIM(str(len(aItens)))
		//Inclui Titulos Receber
		_lTitOk := U_IncluSE1(MV_PREF1,aCab[1],STRZERO(iX,nTam),MV_TIPO1,aCab[2],aCab[3],MV_NATU1,dEmissa,dVencto,nValor,nJuros,0,"",cHist,nVlTxPer,MV_EVENT,"AGLT012","")
	Next ix

	If _lTitOk
		If aCab[6] <> "A"
			U_RGLT032(aCab[2],aCab[1],MV_PREF2) //Impressao da duplicata
		EndIf

	
		If aCab[6] <> "C"
			cHist := "ADIANT.PARCELADO"
			do case
				case aCab[6] == "A"
					cHist := "ADIANTAMENTO"
				case aCab[6] == "R"
					cHist := "RENEGOCIAวรO"
			endcase
			
			dbSelectArea("SA2")
			dbSetOrder(1)
			dbSeek(xFILIAL("SA2")+aCab[2]+aCab[3])
			cEntrg := ""//U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,aCab[7])//Filial de entrega da linha do produtor
			
			//Tratamento para que a emissao e vencimento sejam iguais a database do sistema.
			//Essa regra vale somente na geracao do titulo NF.
			dVencto := aCab[7] //dDataBase
			dEmissa := dDataBase
			
	        cHist := Alltrim(cHist) + " " +Iif(substr(aCab[2],1,1)$ "P","PRODUTOR","FRETISTA")
			//Inclui Titulos Pagar
			_lTitOk := U_IncluSE2(MV_PREF2,aCab[1],STRZERO(1,nTam),MV_TIPO2,aCab[2],aCab[3],MV_NATU2,dEmissa,dVencto,aCab[4],0,0,"",cHist,nVlTxPer,MV_EVENT,"AGLT012","")
		
			If _lTitOk
				If aCab[6] == "R"
					If MsgYesNo("Titulos da renegocia็ใo incluidos com sucesso!" +CHR(13)+CHR(10);
							+"Deseja abrir a tela de compensa็๕es entre carteiras?")
							FINA450()		
					EndIf
				EndIf
	
		//		_lBaixou := BaixaSE2(aCab[4],0,0,MV_PREF2,aCab[1],STRZERO(1,nTam),"NF ",aCab[2],aCab[3],dEmissa)		
			EndIf
			nModulo := 2
			cModulo := "COM"
		Endif
	EndIf
Else
	lOk2:=.T.
EndIf


If _lTitOk
	// seta solicitacao como efetivada
	dbSelectArea("ZLM")
	dbSetorder(1)
	wProcura := dbSeek(xFILIAL("ZLM")+aCab[1])
	RecLock("ZLM",.F.)
	ZLM->ZLM_STATUS := "4"
	MsUnlock()
EndIf


Return _lTitOk


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGLT_012NP บAutor  ณMicrosiga           บ Data ณ  03/01/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function GLT_012NP()

Local aArea := GetArea()
Local _cPref := ""
Local _cNum := ZLM->ZLM_COD

If ZLM->ZLM_TIPO == "E"
	_cPref := "GLE"
Elseif ZLM->ZLM_TIPO == "A"
	_cPref := "GLA"
Elseif ZLM->ZLM_TIPO == "R"
	_cPref := "GLR"
ENDiF

If ZLM->ZLM_TIPO <> "A"
	Processa({|| U_RGLT032(ZLM->ZLM_SA2COD,_cNum,_cPref) }, "Aguarde...", "Gerando duplicata...",.T.)
EndIf

RestArea(aArea)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT112   บAutor  ณMicrosiga           บ Data ณ  04/07/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณVerifica permissoes do usuario.                             บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function Permissao(mtr,tipo)

Local cArea := GetArea()
Local bret:= .F.

_cQuery := " SELECT * "
_cQuery += " FROM "+RetSqlName("ZLU")+" ZLU "
_cQuery += " WHERE D_E_L_E_T_ = ' '"
//_cQuery += " AND ZLU_MATRIC = '"+mtr+"'" //Matricula do funcionario no RH
_cQuery += " AND ZLU_CODUSU = '"+mtr+"'" //Codigo do Usuario no configurador

If Select("TRB") <> 0
	TRB->(dbCloseArea("TRB"))
EndIf
dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(_cQuery))),'TRB',.F.,.T.)

If TRB->(!Eof())
	
	If (tipo=="Aprovar")
		If TRB->ZLU_EMPAPR == "S"
			bret:=.T.
		EndIf
	EndIf
	If (tipo=="Efetivar")
		If TRB->ZLU_EMPEFE == "S"
			bret:=.T.
		EndIf
	EndIf

	If (tipo=="JUROS")
		If TRB->ZLU_EMPJUR == "S"
			bret:=.T.
		EndIf
	EndIf
EndIf

TRB->(dbclosearea())


RestArea(cArea)
Return bret

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ValidPergบ Autor ณ TOTVS              บ Data ณ  17/12/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ValidPerg()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

//Do Setor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo do Setor')
Aadd( aHelpPor, 'que deseja filtrar.      ')
U_xPutSx1(cPerg,"01","Setor   "," "," ","mv_ch1","C",6,0,0,"G",'U_ValSetPar()',"ZL2_01","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Data
aHelpPor := {}
Aadd( aHelpPor, 'Informe a data inicial')
Aadd( aHelpPor, 'da solcitacao que deseja filtrar.')
U_xPutSx1(cPerg,"02","Da Data "," "," ","mv_ch2","D",8,0,0,"G",'',"","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate Data
aHelpPor := {}
Aadd( aHelpPor, 'Informe a data final')
Aadd( aHelpPor, 'da solicitacao que deseja filtrar.')
U_xPutSx1(cPerg,"03","Ate Data "," "," ","mv_ch3","D",8,0,0,"G",'',"","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Codigo
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo Inicial ')
Aadd( aHelpPor, 'da Solicitacao')
U_xPutSx1(cPerg,"04","Do Numero  "," "," ","mv_ch4","C",9,0,0,"G",'',"","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ao Codigo
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo Inicial ')
Aadd( aHelpPor, 'da Solicitacao')
U_xPutSx1(cPerg,"05","Ao Numero  "," "," ","mv_ch5","C",9,0,0,"G",'',"","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Tipo
aHelpPor := {}
Aadd( aHelpPor, 'Informe o Tipo de Solicitacao:')
Aadd( aHelpPor, '1-Adiant.Parc.')
Aadd( aHelpPor, '2-Adiantamento')
Aadd( aHelpPor, '3-Renegociacao')
U_xPutSx1(cPerg,"06","Tipo  "," "," ","mv_ch06","N",1,0,0,"C","","","","","MV_PAR06","Adiant.Parc.","Emprestimo","Emprestimo","","Adiantamento","Adiantamento","Adiantamento","Renegociacao","Renegociacao","Renegociacao","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ZLMCOD	   บ Autor ณ Guilherme Fran็a    บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao gerar numero sequencial para os emprestimos.           บฑฑ
ฑฑบ          ณ Inicializador padrao do campo ZLM_COD                         บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                     							 บฑฑ
ฑฑบ			 ณ                          							 		 บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function ZLMCOD()

Local _cRet	:= ""
Local _cFiltro := ""


	BeginSql alias "TRAB"
		SELECT
		MAX(ZLM_COD) AS ULTIMO
		FROM
		%table:ZLM% ZLM
		WHERE ZLM_FILIAL = %xFILIAL:ZLM% AND 
		%notDel%
	EndSql

	_cRet := IIf(TRAB->ULTIMO<> "NULL",Soma1(TRAB->ULTIMO),"000000001")
	While !MayIUseCode("ZLM_COD" + xFilial("ZLM") + _cRet)  //verifica se esta na memoria, sendo usado
		_cRet := Soma1(_cRet)					           // busca o proximo numero disponivel
	EndDo
	

DbCloseArea("TRAB")

Return _cRet


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT12AUTบAutor  ณGuilherme Fran็a     บ Data ณ 13/03/2018  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Cria lan็amento automแtico de adiantamento para produtores บฑฑ
ฑฑบ          ณ que tem o campo A2_L_ADIANT preenchido                     บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function AGLT12AUT()


Local _aCab  := {}
Local _aAux := {}
Local _cAlias := GetNextAlias()
Local _cCodigo := ""
Local _lRet := .t.
Local _nCont := 0
Local _cDataIni := DTOS(FirstDay(dDataBase))

PergAdt("AGLT112AUT")
If !Pergunte("AGLT112AUT")
	Return
EndIf


If Select(_cAlias)<>0
	(_cAlias)->(DbCloseArea())
EndIf

If MV_PAR04 == 1 //PRODUTOR
	BeginSql alias _cAlias
		SELECT F1_FILIAL, F1_FORNECE AS COD, F1_LOJA AS LOJA, F1_VALBRUT,A2_L_ADIAN, (F1_VALBRUT * (A2_L_ADIAN/100)) AS VALOR
		, COUNT(ZLD_QTDBOM) AS COLETA
		FROM %Table:SF1% F1
			JOIN %Table:SA2% A2 ON A2_COD = F1_FORNECE AND A2_LOJA = F1_LOJA AND A2_L_ADIAN > 0 
			AND A2_MSBLQL <> '1' AND A2.%NotDel%
			JOIN %Table:ZLD% LD ON ZLD_FILIAL = %xFilial:ZLD% AND ZLD_RETIRO = F1_FORNECE AND ZLD_RETILJ = F1_LOJA 
			AND ZLD_DTCOLE > %Exp:_cDataIni% 
		WHERE F1_FILIAL = %xFilial:SF1% AND F1_L_MIX = %Exp:MV_PAR01% AND F1.%NotDel%
		GROUP BY F1_FILIAL, F1_FORNECE, F1_LOJA, F1_VALBRUT,A2_L_ADIAN, F1_VALBRUT,A2_L_ADIAN
		HAVING COUNT(ZLD_QTDBOM) >= %Exp:MV_PAR05%
	EndSql
	//AND F1_FORNECE in ('P00125','P00187','P00168')
Else // TRANSPORTADOR
	BeginSql alias _cAlias
		SELECT ZM1_FILIAL,ZM1_CODSA2 AS COD,ZM1_LOJSA2 AS LOJA, 
		SUM(CASE WHEN ZM1_DEBCRE = 'C' THEN ZM1_VLRTOT ELSE -ZM1_VLRTOT END)  * A2_L_ADIAN/100 	AS VALOR 
		FROM ZM1010 M1
			JOIN SA2010 A2 ON A2_COD = ZM1_CODSA2 AND A2_LOJA = ZM1_LOJSA2 AND A2_L_ADIAN > 0 AND A2.%NotDel% 
		WHERE ZM1_FILIAL = %xFilial:SF1% AND ZM1_MIX = %Exp:MV_PAR01% AND M1.%NotDel%
		GROUP BY ZM1_FILIAL,ZM1_CODSA2,ZM1_LOJSA2,A2_L_ADIAN
	EndSql
EndIf

While !(_cAlias)->(Eof()) .and. _lRet

	//_cCodigo := ZLMCOD()
	aAdd(_aCab, {'ZLM_TIPO'		, "A" })
	aAdd(_aCab, {'ZLM_SA2COD'	, (_cAlias)->COD })
	aAdd(_aCab, {'ZLM_SA2LJ'	, (_cAlias)->LOJA })
	aAdd(_aCab, {'ZLM_TOTAL'	, Round((_cAlias)->VALOR,0) })
	aAdd(_aCab, {'ZLM_DATA'		, MV_PAR02 })
	aAdd(_aCab, {'ZLM_OBS'		, "ADIANTAMENTO FIXO"})
	aAdd(_aCab, {'ZLM_VENCTO'	, MV_PAR03 })
	aAdd(_aCab, {'ZLM_PARC'		, 1 })
	aAdd(_aCab, {'ZLM_JUROS'	, 0 })

	Begin Transaction
	If Len(_aCab) > 0
		Processa({|| _lRet := xExecAuto(_aCab) })
	EndIf
	
	If !_lRet
		If !MsgYesNo("Ocorreram nใo conformidades no processo. Deseja continuar a rotina?")
			(_cAlias)->(DbCloseArea())
			DisarmTransaction()
			//Exit
		EndIf
	Else
		_nCont++
	EndIf
	
	End Transaction
	_aCab := {}
	
	(_cAlias)->(DbSkip())
EndDo

If _nCont>0
	MsgInfo("Processamento finalizado!  "+cvaltochar(_nCont)+"  registro(s) incluido(s).")
EndIf

Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณxExecAutoบAutor  ณGuilherme Fran็a     บ Data ณ             บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Cria lan็amento automแtico de adiantamento			      บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function xExecAuto(xcCabec)

Local oModel  := FwLoadModel("AGLT112")
Local _iCab   := 0
Local _lExecAuto := .t.

	oModel:SetOperation(3) // inclusใo.

	oModel:Activate() // Ativa o modelo.

	//Preenche cabe็alho do modelo.
	For _iCab := 1 to Len(xcCabec)
		oModel:GetModel('ZLMMASTER'):SetValue(xcCabec[_iCab][1]	, xcCabec[_iCab][2] )
	Next _iCab


	If Len(xcCabec) > 0 
		If oModel:VldData()

			oModel:CommitData()

		Else

			_lExecAuto := .F.

			aErro := oModel:GetErrorMessage()

			AutoGrLog( "Id do formulแrio de origem:"	+ ' [' + AllToChar( aErro[1] ) + ']' )
			AutoGrLog( "Id do campo de origem: " 		+ ' [' + AllToChar( aErro[2] ) + ']' )
			AutoGrLog( "Id do formulแrio de erro: " 	+ ' [' + AllToChar( aErro[3] ) + ']' )
			AutoGrLog( "Id do campo de erro:  " 		+ ' [' + AllToChar( aErro[4] ) + ']' )
			AutoGrLog( "Id do erro: " 					+ ' [' + AllToChar( aErro[5] ) + ']' )
			AutoGrLog( "Mensagem do erro: " 			+ ' [' + AllToChar( aErro[6] ) + ']' )
			AutoGrLog( "Mensagem da solu็ใo: " 			+ ' [' + AllToChar( aErro[7] ) + ']' )
			AutoGrLog( "Valor atribuํdo: " 				+ ' [' + AllToChar( aErro[8] ) + ']' )
			AutoGrLog( "Valor anterior: " 				+ ' [' + AllToChar( aErro[9] ) + ']' )

			MostraErro()

		EndIf

	EndIf

	oModel:DeActivate()

Return _lExecAuto

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ PergAdtบ Autor ณ TOTVS              บ Data ณ  17/12/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Perguntas da rotina de adiantamento.                       บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function PergAdt(xcPerg)

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpPor, 'zado como refer๊ncia de faturamento.   ')
Aadd( aHelpPor, 'ATENCAO: Escolha um MIX fechado e com  ')
Aadd( aHelpPor, 'notas emitidas.                       ')
U_xPutSx1(xcPerg,"01","MIX Referencia ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch1","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_02","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Data
aHelpPor := {}
Aadd( aHelpPor, 'Informe a data que serแ realizado o')
Aadd( aHelpPor, 'pagamento ao produtor/transportador.')
U_xPutSx1(xcPerg,"02","Data Deposito? "," "," ","mv_ch2","D",8,0,0,"G",'',"","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate Data
aHelpPor := {}
Aadd( aHelpPor, 'Informe a data do vencimento da ')
Aadd( aHelpPor, 'parcela do emprestimo realizzado.')
U_xPutSx1(xcPerg,"03","Data Vencimento "," "," ","mv_ch3","D",8,0,0,"G",'',"","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Tipo
aHelpPor := {}
Aadd( aHelpPor, 'Informe o Tipo de fornecedor:')
Aadd( aHelpPor, '1-Produtor')
Aadd( aHelpPor, '2-Transportador')
U_xPutSx1(xcPerg,"04","Tipo Fornecedor "," "," ","mv_ch04","N",1,0,0,"C","","","","","MV_PAR04","Produtor","Produtor","Produtor","","Transportador","Transportador","Transportador","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o minimo de coletas ')
Aadd( aHelpPor, 'que o produtor deve ter tido ')
Aadd( aHelpPor, 'no m๊s atual para realizar adiantamento')
U_xPutSx1(xcPerg,"05","Quantidade coletas "," "," ","mv_ch05","N",2,0,0,"G","","","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)



Return

