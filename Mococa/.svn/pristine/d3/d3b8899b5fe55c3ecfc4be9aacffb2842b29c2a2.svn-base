#include "protheus.ch" 
#include "fwmvcdef.ch"
#include "topconn.ch"

/*/{Protheus.doc} RFATA004
Log Movimentações de Contratos
@author TOTVS
@since 10/03/2017
@version P12
@param Nao recebe parametros            
@return nulo
/*/

/***********************/
User Function RFATA004()
/***********************/

Local oBrowse

Private aRotina := {}

oBrowse := FWmBrowse():New()
oBrowse:SetAlias("Z13")
oBrowse:SetDescription("Log de Movimentações de Contratos")   
oBrowse:AddLegend("Z13_TPMOVI == 'C'"	, "WHITE",	"Movimento de crédito")
oBrowse:AddLegend("Z13_TPMOVI == 'D'"	, "YELLOW",	"Movimento de débito")
oBrowse:Activate()

Return Nil

/************************/
Static Function MenuDef()
/************************/

Local aRotina 	:= {}

ADD OPTION aRotina Title "Visualizar" 	Action "VIEWDEF.RFATA004"	OPERATION 2 ACCESS 0
ADD OPTION aRotina Title "Estornar"   	Action "U_FATA004E()"		OPERATION 4 ACCESS 0
ADD OPTION aRotina Title "Legenda"     	Action "U_FATA004L()" 		OPERATION 7 ACCESS 0  

Return aRotina

/*************************/
Static Function ModelDef()
/*************************/

// Cria a estrutura a ser usada no Modelo de Dados
Local oStruZ13 := FWFormStruct(1,"Z13",/*bAvalCampo*/,/*lViewUsado*/ )
Local oStruZ14 := FWFormStruct(1,"Z14",/*bAvalCampo*/,/*lViewUsado*/ )
Local oStruSE1 := U_DefStrModel("SE1")   
Local oStruSE2 := U_DefStrModel("SE2") 

Local oModel

// Cria o objeto do Modelo de Dados
oModel := MPFormModel():New("RFATP004",/*bPreValidacao*/,/*bPosValidacao*/,/*bCommit*/,/*bCancel*/ )

// Adiciona ao modelo uma estrutura de formulário de edição por campo
oModel:AddFields("Z13MASTER",/*cOwner*/,oStruZ13)

// Adiciona a chave primaria da tabela principal
oModel:SetPrimaryKey({"Z13_FILIAL","Z13_CODIGO"})

// Adiciona ao modelo uma estrutura de formulário de edição por grid
oModel:AddGrid("Z14DETAIL","Z13MASTER",oStruZ14,/*bLinePre*/,/*bLinePost*/,/*bPreVal*/,/*bPosVal*/,/*BLoad*/)
oModel:AddGrid("SE1DETAIL","Z13MASTER",oStruSE1,/*bLinePre*/,/*bLinePost*/,/*bPreVal*/,/*bPosVal*/,/*BLoad*/) 
oModel:AddGrid("SE2DETAIL","Z13MASTER",oStruSE2,/*bLinePre*/,/*bLinePost*/,/*bPreVal*/,/*bPosVal*/,/*BLoad*/) 

oModel:GetModel('SE1DETAIL'):SetOnlyQuery()
oModel:GetModel('SE1DETAIL'):SetOnlyView()

oModel:GetModel('SE2DETAIL'):SetOnlyQuery()
oModel:GetModel('SE2DETAIL'):SetOnlyView()

// Faz relaciomaneto entre os compomentes do model
oModel:SetRelation("Z14DETAIL", {{"Z14_FILIAL", 'xFilial("Z14")'},{"Z14_CODIGO","Z13_CODIGO"}},Z14->(IndexKey(1)))
oModel:SetRelation("SE1DETAIL", {{"E1_FILIAL" , 'xFilial("SE1")'},{"E1_XIDMOVI","Z13_CODIGO"}},SE1->(IndexKey(29))) //E1_FILIAL+E1_XIDMOVI
oModel:SetRelation("SE2DETAIL", {{"E2_FILIAL" , 'xFilial("SE2")'},{"E2_XIDMOVI","Z13_CODIGO"}},SE2->(IndexKey(18))) //E2_FILIAL+E2_XIDMOVI

// Desobriga a digitacao de ao menos um item
oModel:GetModel("SE1DETAIL"):SetOptional(.T.)
oModel:GetModel("SE2DETAIL"):SetOptional(.T.)

// Totalizadores
oModel:AddCalc("CALC1","Z13MASTER","SE1DETAIL","E1_NUM"  ,"QTD","COUNT",,,"Qtd. Títulos")
oModel:AddCalc("CALC1","Z13MASTER","SE1DETAIL","E1_VALOR","VLR","SUM",,,"Valor")
oModel:AddCalc("CALC1","Z13MASTER","SE1DETAIL","E1_SALDO","SLD","SUM",,,"Saldo")

oModel:AddCalc("CALC2","Z13MASTER","SE2DETAIL","E2_NUM"  ,"QTD","COUNT",,,"Qtd. Títulos")
oModel:AddCalc("CALC2","Z13MASTER","SE2DETAIL","E2_VALOR","VLR","SUM",,,"Valor")
oModel:AddCalc("CALC2","Z13MASTER","SE2DETAIL","E2_SALDO","SLD","SUM",,,"Saldo")

// Adiciona a descricao do Componente do Modelo de Dados
oModel:GetModel("Z13MASTER"):SetDescription("Movimento")
oModel:GetModel("Z14DETAIL"):SetDescription("Detalhe")
oModel:GetModel("SE1DETAIL"):SetDescription("Crédito")
oModel:GetModel("SE2DETAIL"):SetDescription("Título a Pagar")

oModel:GetModel('SE1DETAIL'):SetNoInsertLine(.T.)
oModel:GetModel('SE1DETAIL'):SetNoUpdateLine(.T.)

oModel:GetModel('SE2DETAIL'):SetNoInsertLine(.T.)
oModel:GetModel('SE2DETAIL'):SetNoUpdateLine(.T.)

Return oModel

/************************/
Static Function ViewDef()
/************************/

// Cria a estrutura a ser usada na View
Local oStruZ13 := FWFormStruct(2,"Z13")
Local oStruZ14 := FWFormStruct(2,"Z14")
Local oStruSE1 := U_DefStrView("SE1")
Local oStruSE2 := U_DefStrView("SE2")

// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
Local oModel   := FWLoadModel("RFATA004")
Local oView
Local oCalc1
Local oCalc2

// Remove campos da estrutura
oStruZ14:RemoveField('Z14_CODIGO')

// Cria o objeto de View
oView := FWFormView():New()

// Define qual o Modelo de dados será utilizado
oView:SetModel(oModel)

// Crio um agrupador de campos
oStruZ13:AddGroup( 'GRUPO01', 'Dados Movimento',		'', 2 )    
oStruZ13:AddGroup( 'GRUPO02', 'Dados Contrato',			'', 2 )    
oStruZ13:AddGroup( 'GRUPO03', 'Dados Pedido de Venda',	'', 2 )

// Colocando todos os campos para o agrupamento 1
oStruZ13:SetProperty( '*' , MVC_VIEW_GROUP_NUMBER, 'GRUPO01' )

// Trocando os campos do movimento para o agrupamento 2
oStruZ13:SetProperty( 'Z13_CONTRA' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO02' )
oStruZ13:SetProperty( 'Z13_CLIFOR' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO02' )
oStruZ13:SetProperty( 'Z13_LOJA' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO02' )
oStruZ13:SetProperty( 'Z13_NOME' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO02' )
oStruZ13:SetProperty( 'Z13_CGC' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO02' )
oStruZ13:SetProperty( 'Z13_BSCALC' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO02' )
oStruZ13:SetProperty( 'Z13_TITFIN' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO02' )
oStruZ13:SetProperty( 'Z13_NATTIT' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO02' )

// Trocando os campos do movimento para o agrupamento 3
oStruZ13:SetProperty( 'Z13_PEDIDO' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO03' )
oStruZ13:SetProperty( 'Z13_ITEMPV' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO03' ) 
oStruZ13:SetProperty( 'Z13_VLRTAB' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO03' ) 
oStruZ13:SetProperty( 'Z13_ICMSST' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO03' ) 
oStruZ13:SetProperty( 'Z13_PIS' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO03' ) 
oStruZ13:SetProperty( 'Z13_COFINS' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO03' ) 
oStruZ13:SetProperty( 'Z13_ICMS' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO03' ) 
oStruZ13:SetProperty( 'Z13_VLRBAS' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO03' ) 
oStruZ13:SetProperty( 'Z13_VLRNET' 	, MVC_VIEW_GROUP_NUMBER, 'GRUPO03' ) 

// Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
oView:AddField("VIEW_Z13",oStruZ13,"Z13MASTER")

// Adiciona no nosso View um controle do tipo FormGrid(antiga newgetdados)
oView:AddGrid("VIEW_Z14",oStruZ14,"Z14DETAIL")
oView:AddGrid("VIEW_SE1",oStruSE1,"SE1DETAIL")
oView:AddGrid("VIEW_SE2",oStruSE2,"SE2DETAIL")

// Totalizadores
oCalc1 := FWCalcStruct(oModel:GetModel("CALC1"))
oView:AddField("VIEW_CALC1",oCalc1,"CALC1")

oCalc2 := FWCalcStruct(oModel:GetModel("CALC2"))
oView:AddField("VIEW_CALC2",oCalc2,"CALC2")

// Criar "box" horizontal para receber algum elemento da view
oView:CreateHorizontalBox("PAINEL GER", 100)

// Cria Folder na view
oView:CreateFolder("PASTAS","PAINEL GER")

// Cria pastas nas folders
oView:AddSheet("PASTAS","ABA01","Movimento")
oView:AddSheet("PASTAS","ABA02","Títulos")

// Criar "box" horizontal para receber algum elemento da view
oView:CreateHorizontalBox("PAINEL_LOG",60,,,"PASTAS","ABA01")
oView:CreateHorizontalBox("PAINEL ITENS",40,,,"PASTAS","ABA01")

oView:CreateHorizontalBox("PAINEL FINP 1",35,,,"PASTAS","ABA02")    
oView:CreateHorizontalBox("PAINEL FINP 2",15,,,"PASTAS","ABA02")    
oView:CreateHorizontalBox("PAINEL FINR 1",35,,,"PASTAS","ABA02")    
oView:CreateHorizontalBox("PAINEL FINR 2",15,,,"PASTAS","ABA02")      

// Relaciona o ID da View com o "box" para exibicao
oView:SetOwnerView("VIEW_Z13","PAINEL_LOG")
oView:SetOwnerView("VIEW_Z14","PAINEL ITENS")
oView:SetOwnerView("VIEW_SE1","PAINEL FINP 1")
oView:SetOwnerView("VIEW_CALC1","PAINEL FINP 2")
oView:SetOwnerView("VIEW_SE2","PAINEL FINR 1")
oView:SetOwnerView("VIEW_CALC2","PAINEL FINR 2")

// Liga a identificacao do componente
oView:EnableTitleView("VIEW_Z13","Movimento")
oView:EnableTitleView("VIEW_Z14","Detalhe")
oView:EnableTitleView("VIEW_SE1","Crédito")
oView:EnableTitleView("VIEW_SE2","Título a Pagar")

// Define campos que terao Auto Incremento
oView:AddIncrementField("VIEW_Z14","Z14_ITEM")

// Define fechamento da tela ao confirmar a operação
oView:SetCloseOnOk( {||.T.} )

// Habilito a barra de progresso na abertura da tela
//oView:SetProgressBar(.T.)

Return oView 

/***********************/
User Function FATA004L()
/***********************/

BrwLegenda("Status do Movimento","Legenda",{{"BR_BRANCO","Movimento de crédito"},{"BR_AMARELO","Movimento de débito"}})

Return

/***********************/
User Function FATA004E()
/***********************/

Local nAplicE 	:= 0
Local nAplicF 	:= 0
Local nAplicA 	:= 0

DbSelectArea("Z14")
Z14->(DbSetOrder(1)) //Z14_FILIAL+Z14_CODIGO+Z14_ITEM

If Z14->(DbSeek(xFilial("Z14")+Z13->Z13_CODIGO))

	While Z14->(!EOF()) .And. Z14->Z14_FILIAL == xFilial("Z14") .And. Z14->Z14_CODIGO == Z13->Z13_CODIGO
		
		Do Case
		
		 Case Z14->Z14_APLICA == "E" //Eventual
		 	nAplicE++
	
		 Case Z14->Z14_APLICA == "F" //Faturamento
		 	nAplicF++
	
		 Case Z14->Z14_APLICA == "A" //Apuração
		 	nAplicA++
		 
		 EndCase
	
		Z14->(DbSkip())
	EndDo		

	If Z13->Z13_TPMOVI == 'C'
	
		If nAplicE > 0 .And. nAplicF == 0 .And. nAplicA == 0
		
			If !VerifCont()
		
				If MsgYesNo("O Movimento será estornado, deseja continuar?")
		
					If Z13->Z13_TITFIN == "A" //A Pagar
					
						DbSelectArea("SE2")
						SE2->(DBOrderNickName("IDMOVCONTR")) //E2_FILIAL+E2_XIDMOVI
						
						If SE2->(DbSeek(xFilial("SE2")+Z13->Z13_CODIGO))
				
							Begin Transaction
							
							lRet := U_ExcTitA(SE2->(Recno()))
							
							If lRet
								
								If U_RFATE006(Z13->Z13_CODIGO)
									MsgInfo("Processamento concluído.","Aviso")
								Else
									MsgInfo("Erro na exclusão do Log.","Aviso")
								Endif
							Endif
							
							End Transaction
						Else
							MsgInfo("Título financeiro não encontrado, operação cancelada.")
						Endif
					
					Else //NCC
					
						DbSelectArea("SE1")
						SE1->(DBOrderNickName("IDMOVCONTR")) //E1_FILIAL+E1_XIDMOVI
						
						If SE1->(DbSeek(xFilial("SE1")+Z13->Z13_CODIGO))
							
							Begin Transaction
							
							lRet := U_ExcTitN(SE1->(Recno()))
							
							If lRet
								
								If U_RFATE006(Z13->Z13_CODIGO)
									MsgInfo("Processamento concluído.","Aviso")
								Else
									MsgInfo("Erro na exclusão do Log.","Aviso")
								Endif
							Endif
							
							End Transaction
						Else
							MsgInfo("Título financeiro não encontrado, operação cancelada.")
						Endif
					Endif				
				Endif
			Else
				MsgInfo("Movimento contabilizado, estorno cancelado. Caso seja necessário o estorno, favor entrar em contato com o departamento Contábil.","Atenção")
			Endif
		
		ElseIf nAplicE == 0 .And. nAplicF > 0 .And. nAplicA == 0
			MsgInfo("Movimentação possui aplicação do tipo Faturamento relacionada. O estorno deve ser realizado via rotina Exclusão Documento Saída, operação cancelada.","Aviso")

		ElseIf nAplicE == 0 .And. nAplicF > 0 .And. nAplicA > 0
			MsgInfo("Movimentação possui aplicações do tipo Faturamento e Apuração relacionadas. O estorno deve ser realizado via rotina Exclusão Documento Saída e via rotina Log Apuração, operação cancelada.","Aviso")

		ElseIf nAplicE == 0 .And. nAplicF == 0 .And. nAplicA > 0
			MsgInfo("Movimentação possui aplicação do tipo Apuração relacionada. O estorno deve ser realizado via rotina Log Apuração, operação cancelada.","Aviso")
		Endif
	Else
		MsgInfo("Movimentação do tipo Débito. O estorno deve ser realizado via rotina Exclusão Documento de Entrada, operação cancelada.","Aviso")
	Endif
Else
	MsgInfo("Itens do Log de Movimentação de Contrato não encontrados, operação cancelada.","Aviso")
Endif

Return

/*******************************/
User Function ExcTitA(nRecnoSE2)
/*******************************/

Local lRet	   		:= .T.

Local aFin050 		:= {} 

Private lMsErroAuto := .F.
Private lMsHelpAuto := .F. 

DbSelectArea("SE2")
SE2->(DbGoTo(nRecnoSE2))  

AAdd(aFin050, {"E2_FILIAL"	, SE2->E2_FILIAL	,Nil } )
AAdd(aFin050, {"E2_PREFIXO"	, SE2->E2_PREFIXO	,Nil } )	
AAdd(aFin050, {"E2_NUM"		, SE2->E2_NUM		,Nil } )
AAdd(aFin050, {"E2_PARCELA"	, SE2->E2_PARCELA	,Nil } )
AAdd(aFin050, {"E2_TIPO"	, SE2->E2_TIPO		,Nil } )
AAdd(aFin050, {"E2_FORNECE"	, SE2->E2_FORNECE	,Nil } )
AAdd(aFin050, {"E2_LOJA"	, SE2->E2_LOJA		,Nil } )

MSExecAuto({|x,y,z| FINA050(x,y,z)},aFin050,,5)

If lMsErroAuto
	MostraErro()                    
	DisarmTransaction()
	lRet := .F.           
EndIf

Return lRet 

/*******************************/
User Function ExcTitN(nRecnoSE1)
/*******************************/

Local lRet	   		:= .T.

Local aFin040 		:= {} 

Private lMsErroAuto := .F.
Private lMsHelpAuto := .F. 

DbSelectArea("SE1")
SE1->(DbGoTo(nRecnoSE1)) 

Aadd( aFin040, {"E1_FILIAL"  , SE1->E1_FILIAL	, Nil})
Aadd( aFin040, {"E1_PREFIXO" , SE1->E1_PREFIXO	, Nil})
Aadd( aFin040, {"E1_NUM"     , SE1->E1_NUM		, Nil})
Aadd( aFin040, {"E1_PARCELA" , SE1->E1_PARCELA	, Nil})
Aadd( aFin040, {"E1_TIPO"    , SE1->E1_TIPO		, Nil})

MsExecAuto({|x,y| FINA040(x,y)},aFin040,5)

If lMsErroAuto
    MostraErro()
	DisarmTransaction()
	lRet := .F.           
EndIf

Return lRet

/**************************/
Static Function VerifCont()
/**************************/

Local lRet 		:= .F.
Local aAreaZ14	:= GetArea("Z14")

DbSelectArea("Z14")
Z14->(DbSetOrder(1)) //Z14_FILIAL+Z14_CODIGO+Z14_FILIAL

If Z14->(DbSeek(xFilial("Z14")+Z13->Z13_CODIGO))

	While Z14->(!EOF()) .And. Z14->Z14_FILIAL == xFilial("Z14") .And. Z14->Z14_CODIGO == Z13->Z13_CODIGO
		
		If Z14->Z14_LA == "S" //Contabilizado
			lRet := .T.
			Exit
		Endif
	
		Z14->(DbSkip())
	EndDo
Endif

RestArea(aAreaZ14)

Return lRet