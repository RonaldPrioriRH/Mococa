#include 'protheus.ch'
#include 'parmtype.ch'
#include 'FWMVCDEF.CH'

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT046 บAutor  ณCleiton Campos        บ Data ณ  04/03/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Manuten็ใo de pagamento de frete.                          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

user function AGLT046()

	Local oBrowse := FwMBrowse():New()

	GrvFld() // Cria pastas para apresenta็ใo dos campos no cabe็alho da guia de transfer๊ncia.
	GrvSX6() // Cria็ใo de parโmetros.


	oBrowse:SetAlias('ZM0')

	//Descri็ใo da Parte Superior Esquerda do Browse
	oBrowse:SetDescripton("Manuten็ใo Pagto. Frete")

	//Habilita os Bot๕es Ambiente e WalkThru
	oBrowse:SetAmbiente(.F.)
	oBrowse:SetWalkThru(.F.)

	//Adiciona legendas
	oBrowse:AddLegend( "ZM0_STATUS == 'A'", "GREEN"	, "Aberto"	)
	oBrowse:AddLegend( "ZM0_STATUS == 'G'", "BLUE"	, "Confirmado"	)
	oBrowse:AddLegend( "ZM0_STATUS == 'F'", "RED"	, "Fechado"	)

	//Desabilita os Detalhes da parte inferior do Browse
	oBrowse:DisableDetails()

	//Ativa o Browse
	oBrowse:Activate()

return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณMenuDef   บAutor  ณFernando W S Furtadoบ Data ณ  05/27/12   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao para Menu do Browse                                  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function MenuDef()

	Local aRotina := {}

	aAdd( aRotina, { 'Pesquisar'	, 'PesqBrw'        , 0, 1, 0, NIL } )
	aAdd( aRotina, { 'Visualizar'	, 'VIEWDEF.AGLT046', 0, 2, 0, NIL } )
	aAdd( aRotina, { 'Calcula Pgto'	, 'U_AGLT047("A")'    , 0, 3, 0, NIL } )
	aAdd( aRotina, { 'Efetiva'	 	, 'U_AGLT46IN("F")', 0, 4, 0, NIL } )
//	aAdd( aRotina, { 'Incluir' 		, 'VIEWDEF.AGLT046', 0, 3, 0, NIL } )
//	aAdd( aRotina, { 'Alterar' 		, 'VIEWDEF.AGLT046', 0, 4, 0, NIL } )
	aAdd( aRotina, { 'Alterar'	 	, 'U_AGLT46IN("A")', 0, 4, 0, NIL } )
//	aAdd( aRotina, { 'Excluir' 		, 'VIEWDEF.AGLT046', 0, 5, 0, NIL } )
	aAdd( aRotina, { 'Excluir'	 	, 'U_AGLT46IN("E")', 0, 5, 0, NIL } )


Return aRotina
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณModelDef  บAutor  ณCleiton Campos      บ Data ณ  22/02/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao de Modelo de Dados.                                  บฑฑ
ฑฑบ          ณOnde ้ definido a estrutura de dados                        บฑฑ
ฑฑบ          ณRegra de Negocio.                                           บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ModelDef()

	Local oStruZM0  :=  FWFormStruct(1,'ZM0') //Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
	Local oStruZM1  :=  FWFormStruct(1,'ZM1') //Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
	Local oStruZM2  :=  FWFormStruct(1,'ZM2') //Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
	Local aRelaZM1  := {}
	Local aRelaZM2  := {}
	Local oModel

	Private _nVlrOcor := 0
	Private _nVlrCred := 0
	Private _nVlrDeb := 0
	Private _nVlrLiq := 0
	Private _nVlrCte := 0
	//Ajusta propriedades dos campos
	SetPropM(oStruZM0, oStruZM1, oStruZM2)
	//Cria็ใo de gatilhos
	CriaGat(oStruZM0, oStruZM1, oStruZM2)

	//Instancia do Objeto de Modelo de Dados
	oModel	:=	MpFormModel():New('MAGLT046', /*Pre-Validacao*/,/*Pos-Validacao*/,/*Commit*/,/*Commit*/,/*Cancel*/)

	//Adiciona um modelo de Formulario de Cadastro Similar เ Enchoice ou Msmget
	oModel:AddFields('ID_M_FLD_ZM0', /*cOwner*/, oStruZM0, /*bPreValidacao*/, /*bPosValidacao*/, /*bCarga*/ )
    
	oModel:SetDescripton("Manuten็ใo Pagto. Frete")

	//Adiciona grid ao formulแrio.
	oModel:AddGrid('ID_M_GRD_ZM1', 'ID_M_FLD_ZM0', oStruZM1, /*bPreValidacao*/,/*bPosValidacao*/, /*bCarga*/ )
	oModel:AddGrid('ID_M_GRD_ZM2', 'ID_M_FLD_ZM0', oStruZM2, /*bPreValidacao*/,/*bPosValidacao*/, /*bCarga*/ )

	//Configura o preenchimento opcional da grid de dados de cobran็a.
	oModel:GetModel('ID_M_GRD_ZM2'):SetOptional(.T.)

	//Relaciona o grid da tabela ZM1 com o folder da tabela ZM0
	aAdd(aRelaZM1,{"ZM1_FILIAL", "xFilial('ZM1')"})
	aAdd(aRelaZM1,{"ZM1_MIX"   , "ZM0_MIX"})
	aAdd(aRelaZM1,{"ZM1_CODSA2", "ZM0_CODSA2"})
	aAdd(aRelaZM1,{"ZM1_LOJSA2", "ZM0_LOJSA2"})
	oModel:SetRelation( 'ID_M_GRD_ZM1', aRelaZM1 , ZM1->( IndexKey( 1 ) ) )

	//Relaciona o grid da tabela ZM2 com o folder da tabela ZM0
	aAdd(aRelaZM2,{"ZM2_FILIAL", "xFilial('ZM2')"})
	aAdd(aRelaZM2,{"ZM2_MIX"   , "ZM0_MIX"})
	aAdd(aRelaZM2,{"ZM2_CODSA2", "ZM0_CODSA2"})
	aAdd(aRelaZM2,{"ZM2_LOJSA2", "ZM0_LOJSA2"})
	oModel:SetRelation( 'ID_M_GRD_ZM2', aRelaZM2 , ZM2->( IndexKey( 1 ) ) )

	//Define chave primแria do modelo de dados.
	oModel:SetPrimaryKey({"ZM0_FILIAL", "ZM0_MIX", "ZM0_CODSA2", "ZM0_LOJSA2"})

	//Adiciona campos de cแlculo para somar totais digitados na guia de transfer๊ncia.
	oModel:AddCalc( 'TOTAL1', 'ID_M_FLD_ZM0', 'ID_M_GRD_ZM1', 'ZM1_VLRTOT'	, '_nVlrCred', 'FORMULA' , ,,'Cr้ditos'	,{ |oModel| AGL046B( oModel,"C")} )
	oModel:AddCalc( 'TOTAL1', 'ID_M_FLD_ZM0', 'ID_M_GRD_ZM1', 'ZM1_VLRTOT'	, '_nVlrDeb' , 'FORMULA' , ,,'D้bitos'	,{ |oModel| AGL046B( oModel,"D")} )
	oModel:AddCalc( 'TOTAL1', 'ID_M_FLD_ZM0', 'ID_M_GRD_ZM1', 'ZM1_VLRTOT'	, '_nVlrCte' , 'FORMULA' , ,,'Vlr. CTE'	,{ |oModel| AGL046B( oModel,"E")} )

	oModel:AddCalc( 'TOTAL2', 'ID_M_FLD_ZM0', 'ID_M_GRD_ZM2', 'ZM2_VALOR'	, '_nVlrOcor', 'SUM' , ,,'Total D้bitos',/*{ |oModel| AGL300H( oModel)} */  )

	oModel:AddCalc( 'TOTAL2', 'ID_M_FLD_ZM0', 'ID_M_GRD_ZM2', 'ZM2_VALOR'	, '_nVlrLiq' , 'FORMULA' ,{ |oModel| .t.} ,{ |oModel| AGL046B( oModel,"E")},'Vlr.Liquido'	,{ |oModel| AGL046B( oModel,"L")} )

Return(oModel)	

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณViewDef   บAutor  ณ                           ณ             บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao de Visualizacao.                                     บฑฑ
ฑฑบ          ณOnde ้ definido a visualizacao da Regra de Negocio.         บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ViewDef()

	Local oStruZM0  :=  FWFormStruct(2,'ZM0') //Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
	Local oStruZM1  :=  FWFormStruct(2,'ZM1') //Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
	Local oStruZM2  :=  FWFormStruct(2,'ZM2') //Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
	Local oModel    :=  FwLoadModel("AGLT046")
	Local oView		:=  FwFormView():New()      //Instancia do Objeto de Visualiza็ใo
	Local oStruTOT1	:=  FWCalcStruct( oModel:GetModel('TOTAL1') )
	Local oStruTOT2	:=  FWCalcStruct( oModel:GetModel('TOTAL2') )

	//Remove campos desnecessแrios da view
	RemoveFld(oStruZM0, oStruZM1, oStruZM2 )

	//Ajusta propriedades dos campos 
	SetPropV(oStruZM0, oStruZM1, oStruZM2)

	// Cria Folder na view
	oView:CreateFolder( 'PASTAS' )

	// Cria pastas nas folders
	oView:AddSheet( 'PASTAS', 'ABA01', 'Cadastrais' )
	oView:AddSheet( 'PASTAS', 'ABA02', 'Ocorr๊ncias' )
	oView:AddSheet( 'PASTAS', 'ABA03', 'D้bitos' )

	//Define o Modelo sobre qual a Visualizacao sera utilizada
	oView:SetModel(oModel)

	oView:SetDescripton("Manuten็ใo Pagto. Frete")

	//Vincula o Objeto visual de Cadastro com o modelo
	oView:AddField( 'ID_V_FLD_ZM0', oStruZM0, 'ID_M_FLD_ZM0')

	//Vincula o Objeto visual de grid com o modelo
	oView:AddGrid( 'ID_V_GRD_ZM1', oStruZM1, 'ID_M_GRD_ZM1')
	oView:AddGrid( 'ID_V_GRD_ZM2', oStruZM2, 'ID_M_GRD_ZM2')

	// Adiciona objeto totais.
	oView:AddField( 'ID_V_TOT1', oStruTOT1, 'TOTAL1'  )
	oView:AddField( 'ID_V_TOT2', oStruTOT2, 'TOTAL2'  )

	// Define campos que terao Auto Incremento
	oView:AddIncrementField( 'ID_V_GRD_ZM1'	, 'ZM1_ITEM' )
	oView:AddIncrementField( 'ID_V_GRD_ZM2'	, 'ZM2_ITEM' )

	oView:CreateHorizontalBox( 'SUPERIOR' 	, 035)
	oView:CreateHorizontalBox( 'MEIO'	, 045 )
	oView:CreateHorizontalBox( 'INFERIOR'	, 020 )
	oView:CreateVerticalBox('ESQUERDA', 50 , 'MEIO')
	oView:CreateVerticalBox("DIREITA",  50 , 'MEIO')
	oView:CreateVerticalBox("TOT_ESQUERDA", 50, 'INFERIOR')
	oView:CreateVerticalBox("TOT_DIREITA" , 50, 'INFERIOR')

	// Relaciona o ID da View com o "box" para exibicao
	oView:SetOwnerView( 'ID_V_FLD_ZM0'   , 'SUPERIOR' )
	oView:SetOwnerView( 'ID_V_GRD_ZM1'   , 'ESQUERDA' )
	oView:SetOwnerView( 'ID_V_GRD_ZM2'   , 'DIREITA' )
	oView:SetOwnerView( 'ID_V_TOT1'      , 'TOT_ESQUERDA')
	oView:SetOwnerView( 'ID_V_TOT2'      , 'TOT_DIREITA')
	
	//_nVlrLiq := AGL046B( oModel,"L")

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
Static Function RemoveFld(oStruZM0, oStruZM1, oStruZM2)

	Local _aRemZM1 := {"ZM1_MIX", "ZM1_CODSA2", "ZM1_LOJSA2","ZM1_TOTPRD"}
	Local _aRemZM2 := {"ZM2_MIX", "ZM2_CODSA2", "ZM2_LOJSA2"}
	Local _iRem    := 0

	For _iRem := 1 to Len(_aRemZM1)
		oStruZM1:RemoveField( _aRemZM1[_iRem] )
	Next _iRem

	For _iRem := 1 to Len(_aRemZM2)
		oStruZM2:RemoveField( _aRemZM2[_iRem] )
	Next _iRem

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณCriaGat   บAutor  ณ                           ณ  05/27/12   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณCria็ใo de gatilhos.                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Aula de MVC                                                บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function CriaGat(oStruZM0, oStruZM1, oStruZM2)

	Local _aGatilho := {}
	Local _iGat

	//Gatilhos na tabela ZM0
	aAdd(_aGatilho, FwStruTrigger('ZM0_MIX'   , 'ZM0_DATINI', "ZLE->ZLE_DTINI", .T., 'ZLE', 1, 'xFilial("ZLE") + M->ZM0_MIX + "1"' ))
	aAdd(_aGatilho, FwStruTrigger('ZM0_MIX'   , 'ZM0_DATFIM', "ZLE->ZLE_DTFIM", .T., 'ZLE', 1, 'xFilial("ZLE") + M->ZM0_MIX + "1"' ))
	aAdd(_aGatilho, FwStruTrigger('ZM0_CODSA2', 'ZM0_NOME'  , 'SA2->A2_NOME', .T., 'SA2', 1, 'xFilial("SA2") + M->ZM0_CODSA2 + M->ZM0_LOJSA2' ))
	aAdd(_aGatilho, FwStruTrigger('ZM0_LOJSA2', 'ZM0_NOME'  , "SA2->A2_NOME", .T., 'SA2', 1, 'xFilial("SA2") + M->ZM0_CODSA2 + M->ZM0_LOJSA2' ))
	aAdd(_aGatilho, FwStruTrigger('ZM0_TOTTRP', 'ZM0_QUEBRA', "M->ZM0_TOTPRD - M->ZM0_TOTTRP", .F.,"ZM0",,"","","001" ))
	aAdd(_aGatilho, FwStruTrigger('ZM0_TOTPRD', 'ZM0_QUEBRA', "M->ZM0_TOTPRD - M->ZM0_TOTTRP", .F.,"ZM0",,"","","001" ))
	aAdd(_aGatilho, FwStruTrigger('ZM0_TOTPRD', 'ZM0_QTDTOL', "Int(M->ZM0_TOTTRP * (M->ZM0_PERCQB / 100  ))", .F.,"ZM0",,"","","002" ))
	aAdd(_aGatilho, FwStruTrigger('ZM0_TOTPRD', 'ZM0_QTDDES', "If(M->ZM0_QUEBRA > 0,M->ZM0_QUEBRA - M->ZM0_QTDTOL, 0)", .F.,"ZM0",,"","","003" ))
	aAdd(_aGatilho, FwStruTrigger('ZM0_TOTPRD', 'ZM0_DSCQBR', "IIF(M->ZM0_QTDDES > M->ZM0_QTDTOL , 'S', 'N')", .F.,"ZM0",,"","","004" ))

	For _iGat := 1 to Len(_aGatilho)

		oStruZM0:AddTrigger( _aGatilho[_iGat][1], _aGatilho[_iGat][2], _aGatilho[_iGat][3], _aGatilho[_iGat][4] )

	Next _iGat

	// Gatilhos nos campos da tabela ZM1
	aAdd(_aGatilho	,FwStruTrigger('ZM1_OCORRE'   , 'ZM1_DSCOCO'   , "ZLQ->ZLQ_DSCRED" , .T., 'ZLQ', 1, 'xFilial("ZLQ") + M->ZM1_OCORRE'))
	aAdd(_aGatilho	,FwStruTrigger('ZM1_OCORRE'   , 'ZM1_DEBCRE'   , "ZLQ->ZLQ_TIPO"   , .T., 'ZLQ', 1, 'xFilial("ZLQ") + M->ZM1_OCORRE'))
	aAdd(_aGatilho	,FwStruTrigger('ZM1_OCORRE'   , 'ZM1_ALTCTE'   , "ZLQ->ZLQ_DEDCTE" , .T., 'ZLQ', 1, 'xFilial("ZLQ") + M->ZM1_OCORRE' ))
	aAdd(_aGatilho	,FwStruTrigger('ZM1_QTDADE'   , 'ZM1_VLRTOT'   , "M->ZM1_VALOR * M->ZM1_QTDADE" , .F.))
	//aAdd(_aGatilho	,FwStruTrigger('ZM1_QTDADE'   , 'ZM1_QTDADE'   , "U_AGL046A()" , .F., /*cAlias*/, /*nOrdem*/, /*cChave*/, "M->ZM1_OCORRE == '0003'"  ))
	aAdd(_aGatilho	,FwStruTrigger('ZM1_VALOR'    , 'ZM1_VLRTOT'   , "M->ZM1_VALOR * M->ZM1_QTDADE" , .F. ))
	//aAdd(_aGatilho	,FwStruTrigger('ZM1_VALOR'    , 'ZM1_QTDADE'   , "-(M->ZM1_QTDADE)" , .F., /*cAlias*/, /*nOrdem*/, /*cChave*/, "M->ZM1_DEBCRE == 'D'"  ))

	For _iGat := 1 to Len(_aGatilho)

		oStruZM1:AddTrigger( _aGatilho[_iGat][1], _aGatilho[_iGat][2], _aGatilho[_iGat][3], _aGatilho[_iGat][4] )

	Next _iGat

	//Gatilhos nos campos da tabela ZM2
	aAdd(_aGatilho	,FwStruTrigger('ZM2_EVENTO'   , 'ZM2_DESCRI'   , "ZL8->ZL8_DESCRI" , .T., 'ZL8', 1, 'xFilial("ZL8") + M->ZM2_EVENTO' ))

	For _iGat := 1 to Len(_aGatilho)

		oStruZM2:AddTrigger( _aGatilho[_iGat][1], _aGatilho[_iGat][2], _aGatilho[_iGat][3], _aGatilho[_iGat][4] )

	Next _iGat


Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณSetPropM   บAutor  ณ                           ณ  05/27/12   บฑฑ
ฑฑฬออออออออออุออ
ออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณDefine propriedades no MODEL                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Aula de MVC                                                บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function SetPropM(oStruZM0, oStruZM1, oStruZM2)

	// Propriedades de campos do cabe็alho
	oStruZM0:SetProperty("ZM0_PERCQB", MODEL_FIELD_INIT , {|| GetMv("LT_PERCQB")})
	oStruZM0:SetProperty("ZM0_MIX"		, MODEL_FIELD_WHEN,{|| INCLUI})
	oStruZM0:SetProperty("ZM0_CODSA2"	, MODEL_FIELD_WHEN,{|| INCLUI})	
	oStruZM0:SetProperty("ZM0_LOJSA2"	, MODEL_FIELD_WHEN,{|| INCLUI})	

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณSetPropV   บAutor  ณ                           ณ  05/27/12   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณDefine propriedades na VIEW                                 บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Aula de MVC                                                บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function SetPropV(oStruZM0, oStruZM1, oStruZM2)

	Local _cCampos := ""
	Local _aAux    := {}

	// Inclui consulta padrใo nos campos da tabela ZM0.
	oStruZM0:SetProperty( 'ZM0_MIX'      , MVC_VIEW_LOOKUP    , 'ZLE_02')
	oStruZM0:SetProperty( 'ZM0_CODSA2'   , MVC_VIEW_LOOKUP    , 'SA2_L1')
	oStruZM0:SetProperty( 'ZM0_CTE'		 , MVC_VIEW_LOOKUP    , 'SF1ZM0')	
	oStruZM0:SetProperty( 'ZM0_QUEBRA'   , MVC_VIEW_CANCHANGE , .f.)
	
	

	//Inclui consulta padrใo na tabela ZM1
	oStruZM1:SetProperty( 'ZM1_LINHA'   , MVC_VIEW_LOOKUP    , 'ZLW_01')

	// Inclui consulta padrใo nos campos da tabela ZM2.
	oStruZM2:SetProperty( 'ZM2_EVENTO'   , MVC_VIEW_LOOKUP    , 'ZL8_01')

	// Campos para a aba Cadastrais da tabela ZM0
	_cCampos := 'ZM0_MIX,ZM0_DATINI,ZM0_DATFIM,ZM0_CODSA2,ZM0_LOJSA2,ZM0_NOME,ZM0_STATUS,ZM0_CTE'
	_aAux := STRTOKARR(_cCampos, ",")
	For _iCad := 1 to Len(_aAux)
		oStruZM0:SetProperty( _aAux[_iCad]  , MVC_VIEW_FOLDER_NUMBER    , '1')
	Next _iCad


	//Campos para a aba Observa็๕es da tabela ZM0.
	_cCampos := 'ZM0_TOTTRP,ZM0_TOTPRD,ZM0_QUEBRA,ZM0_PERCQB,ZM0_QTDTOL,ZM0_QTDDES,ZM0_DSCQBR'
	_aAux := STRTOKARR(_cCampos, ",")
	For _iCad := 1 to Len(_aAux)
		oStruZM0:SetProperty( _aAux[_iCad]  , MVC_VIEW_FOLDER_NUMBER    , '2')
	Next _iCad

	//Campos para a aba Observa็๕es da tabela ZM0.
	_cCampos := 'ZM0_OBSERV'
	_aAux := STRTOKARR(_cCampos, ",")
	For _iCad := 1 to Len(_aAux)
		oStruZM0:SetProperty( _aAux[_iCad]  , MVC_VIEW_FOLDER_NUMBER    , '3')
	Next _iCad

Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGrvFld    บAutor  ณ                           ณ  05/27/12   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณGrava Folder para visualisa็ใo.                             บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GrvFld()

	Local _aArea := GetArea()
	Local _aFolder := {}
	Local _iFolder := 0

	aAdd(_aFolder,{"ZM0","1","Cadastrais",})
	aAdd(_aFolder,{"ZM0","2","Litragem ",})
	aAdd(_aFolder,{"ZM0","3","Observa็๕es",})

	dbSelectArea("SXA")
	SXA->(dbSetOrder(1))

	For _iFolder := 1 to Len(_aFolder)

		If !SXA->(dbSeek(_aFolder[_iFolder][1] + _aFolder[_iFolder][2]  ))
			RecLock("SXA", .T.)
			SXA->XA_ALIAS  := _aFolder[_iFolder][1]
			SXA->XA_ORDEM  := _aFolder[_iFolder][2]
			SXA->XA_PROPRI := "U"
		Else
			RecLock("SXA", .F.)
		EndIf

		SXA->XA_DESCRIC := _aFolder[_iFolder][3]
		SXA->XA_DESCSPA := _aFolder[_iFolder][3]
		SXA->XA_DESCENG := _aFolder[_iFolder][3]

		SXA->(MsUnLock())

	Next _iFolder

	RestArea(_aArea)

Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGL046A   บAutor  ณ                           ณ  05/27/12   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณGatilho no campo quantidade.                                บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function AGL046A()

	Local oModel    := FwModelActive()
	Local oGrdZM1   := oModel:GetModel("ID_M_GRD_ZM1")
	Local oFldZM0   := oModel:GetModel("ID_M_FLD_ZM0")
	Local _nLine    := oGrdZM1:GetLine()
	Local _iAux     := 0
	Local _nTamGrd  := oGrdZM1:Length()
	Local _Qtdade   := 0
	Local _nTotPrd  := 0

	For _iAux := 1 to _nTamGrd

		oGrdZM1:GoLine(_iAux)
		If oGrdZM1:GetValue("ZM1_OCORRE") == "0003"
			_Qtdade  +=  oGrdZM1:GetValue("ZM1_QTDADE")
			_nTotPrd +=  oGrdZM1:GetValue("ZM1_TOTPRD")
		EndIf

	Next _iAux

	oFldZM0:SetValue("ZM0_TOTTRP", _Qtdade)
	oFldZM0:SetValue("ZM0_TOTPRD", _nTotPrd)

	oGrdZM1:GoLine(_nLine)

Return()

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ AGL046B  บAutor  ณ Claudio Goncalves  บ Data ณ  30/10/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Soma a quantidade corrigida digitada nos itens             บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParโmetrosณ oModel - Modelo de dados                                   บฑฑ
ฑฑบ          ณ _pcTipo                                                    บฑฑ
ฑฑบ          ณ    C - Calcula cr้ditos                                    บฑฑ
ฑฑบ          ณ    D - Calcula D้bitos                                     บฑฑ
ฑฑบ          ณ    E - Calcula valores do CTE                              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
STATIC FUNCTION AGL046B(oModel, _pcTipo)

	Local _nRet   		:= 0
	Local oModel     	:= oModel:GetModel()
	Local oGridZM1		:= oModel:GetModel('ID_M_GRD_ZM1')
	Local oGridZM2		:= oModel:GetModel('ID_M_GRD_ZM2')
	Local nOperation 	:= oModel:GetOperation()
	Local _nLin			:= oGridZM1:GetLine()
	Local nI			:= 1
	Local oView 		:= FWViewActive()

	For nI := 1 To oGridZM1:Length()
		oGridZM1:GoLine( nI )
		If !oGridZM1:IsDeleted()

			If oGridZM1:GetValue("ZM1_DEBCRE") == Alltrim(_pcTipo)
				_nRet	+= oGridZM1:GetValue("ZM1_VLRTOT") // Soma d้bitos ou cr้ditos.
			ElseIf Alltrim(_pcTipo) == "E" .AND. oGridZM1:GetValue("ZM1_ALTCTE") == "S"
				//Soma todos os valores das ocorr๊ncias que comp๕e o valor to CTE.
				If oGridZM1:GetValue("ZM1_DEBCRE") == "C"
					_nRet	+= oGridZM1:GetValue("ZM1_VLRTOT")
				Else
					_nRet	-= oGridZM1:GetValue("ZM1_VLRTOT")
				EndIf 
			EndIf
		ENDIF
	Next nI

	oGridZM1:GoLine(_nLin)

	If Alltrim(_pcTipo) == "L"
		For nI := 1 To oGridZM1:Length()
			oGridZM1:GoLine( nI )
			If !oGridZM1:IsDeleted()
				//Soma todos os valores das ocorr๊ncias que comp๕e o valor to CTE.
				If oGridZM1:GetValue("ZM1_DEBCRE") == "C"
					_nRet	+= oGridZM1:GetValue("ZM1_VLRTOT")
				Else
					_nRet	-= oGridZM1:GetValue("ZM1_VLRTOT")
				EndIf 
			ENDIF
		Next nI

		For nI := 1 To oGridZM2:Length()
			oGridZM2:GoLine( nI )
			If !oGridZM2:IsDeleted()
				_nRet	-= oGridZM2:GetValue("ZM2_VALOR")
			ENDIF
		Next nI
	EndIf

return _nRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณTUDOOK   บAutor  ณTOTVS TM    บ Data ณ  21/02/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao para valida็ใo dos dados digitados.                  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ 			                                                  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
//CHAMADA {|oModel| TUDOOK(oModel)}
Static Function TUDOOK(oModel)

Local nOperation	:=	oModel:GetOperation()
Local oStruct	:=	oModel:GetModel("ID_M_FLD_ZM0")
Local _lRet		:=	.T.

// FUNวรO NAี USADA
If nOperation	==	5 .and. oStruct:GetValue("ZM0_STATUS") <> "A"
   	Help( ,,1,"Valida็ใo Exclusใo","Registro jแ gerou financeiro e nใo poderแ ser excluํdo!", 1, 0 )
   	_lRet	:=	.f.
EndIf


Return _lRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ AGLT7IN  บAutor  ณ Guilherme Fran็a   บ Data ณ  18/08/15   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
USER Function AGLT46IN(_cTipo)

Local _aArea := GetArea()

IF _cTipo	= "I"                                                                            
	lOk := ( FWExecView('Valida็ใo de Inclusao','AGLT046', MODEL_OPERATION_INSERT,, ,  ) == 0 )
ELSEIF _cTipo	= "A" 
	IF Alltrim(ZM0->ZM0_STATUS) <> "A"
		Help( ,,1,"Valida็ใo Altera็ใo","Registro jแ gerou financeiro e nใo poderแ ser alterado!", 1, 0 )
	ELSE
		lOk := ( FWExecView('Valida็ใo de Altera็ใo','AGLT046', MODEL_OPERATION_UPDATE,, ,  ) == 0 )   
	ENDIF
ELSEIF _cTipo = 'E'
	IF Alltrim(ZM0->ZM0_STATUS) <> "A"
		Help( ,,1,"Valida็ใo Exclusใo","Registro jแ gerou financeiro e nใo poderแ ser excluํdo!", 1, 0 )
	ELSE
		lOk := ( FWExecView('Valida็ใo de Exclusใo','AGLT046', MODEL_OPERATION_DELETE,, ,  ) == 0 )   
	ENDIF
ELSEIF _cTipo = 'F'
	IF Alltrim(ZM0->ZM0_STATUS) == "F"
		Help( ,,1,"Valida็ใo Efetiva็ใo","Registro jแ gerou financeiro e nใo poderแ ser reprocessado!", 1, 0 )
	ELSE
		U_AGLT047("F")   
	ENDIF

ENDIF        

RestArea(_aArea)

RETURN 


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFun…o    ณGrvSX6    ณ Autor ณ                       ณ Data ณ19/02/02  ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescri…o ณ Funcao de processamento da gravacao do SX6                 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ Empr้stimos bancแrios.                                     ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GrvSX6()
	//  X6_FIL   X6_VAR     X6_TIPO    X6_DESCRIC X6_DSCSPA  X6_DSCENG  X6_DESC1 X6_DSCSPA1 X6_DSCENG1
	//  X6_DESC2 X6_DSCSPA2 X6_DSCENG2 X6_CONTEUD X6_CONTSPA X6_CONTENG X6_PROPRI

	Local aSX6   := {}
	Local aEstrut:= {}
	Local i      := 0
	Local j      := 0
	Local lSX6	 := .F.
	Local cTexto := ''
	Local cAlias := ''
	Local cTamFil := Space(Len(cFilAnt))

	aEstrut := {"X6_FIL","X6_VAR","X6_TIPO","X6_DESCRIC","X6_DSCSPA","X6_DSCENG","X6_DESC1","X6_DSCSPA1","X6_DSCENG1","X6_DESC2","X6_DSCSPA2","X6_DSCENG2","X6_CONTEUD","X6_CONTSPA","X6_CONTENG","X6_PROPRI","X6_PYME"}

	aAdd(asx6,{"  ", "LT_PERCQB", "N", "Percentual de tolerโncia para quebra de leite", "", "", "", "", "", "", "","","0.3","0.3","0.3","S","S"})
	aAdd(asx6,{"  ", "LT_VNCCAR", "N", "Vencimento dos titulos a receber do carreteiro", "", "", "", "", "", "", "","","16","16","16","S","S"})
	aAdd(asx6,{"  ", "LT_EVEQUEB", "C", "Codigo evento de quebra do leite carreteiro", "", "", "", "", "", "", "","","070001","070001","070001","S","S"})	

	ProcRegua(Len(aSX6))

	dbSelectArea("SX6")
	dbSetOrder(1)
	For i:= 1 To Len(aSX6)
		If !Empty(aSX6[i][2])
			If !dbSeek(cTamFil+aSX6[i,2]) .And. !dbSeek(xFilial("SX6")+aSX6[i,2])
				lSX6	:= .T.
				If !(aSX6[i,2]$cAlias)
					cAlias += aSX6[i,2] //+ ":"+aSX6[i,4]+aSX6[i,7]+aSX6[i,10]+CHR(13)+CHR(10)
				EndIf
				RecLock("SX6",.T.)
				For j:=1 To Len(aSX6[i])
					If !Empty(FieldName(FieldPos(aEstrut[j])))
						FieldPut(FieldPos(aEstrut[j]),aSX6[i,j])
					EndIf
				Next j

				dbCommit()
				MsUnLock()
				cTexto += "Incluido o parametro " + aSX6[i,2] + Chr(13) + Chr(10)
			Else
				cTexto += "O parametro " + aSX6[i,2] + " ja existe e nao foi alterado." + Chr(13) + Chr(10)
			EndIf

		EndIf
	Next i

	cTexto := 'Incluidos novos parametros. Verifique as suas configuracoes e funcionalidades : '+ Chr(13) + Chr(10) + cTexto + Chr(13) + Chr(10)

Return cTexto

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFun…o    ณGeraFin    ณ Autor ณ Guilherme fran็a      ณ Data ณ19/10/17  ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescri…o ณ Efetiva o pagamento do frete, gerando no financeiro os     ณฑฑ
ฑฑณ          ณ descontos de quebra do leite do transportador.             ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ                                                            ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GeraFin()

Local _cPerg    := "PAGLT047"
Local _nRet   		:= 0
Local oModel     	:= oModel:GetModel()
Local oGridZM1		:= oModel:GetModel('ID_M_GRD_ZM1')
Local oGridZM2		:= oModel:GetModel('ID_M_GRD_ZM2')
Local nOperation 	:= oModel:GetOperation()
Local _nLin			:= oGridZM1:GetLine()
Local nI			:= 1
Local oView 		:= FWViewActive()

