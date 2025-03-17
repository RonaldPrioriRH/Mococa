#include "protheus.ch" 
#include "fwmvcdef.ch"
#include "topconn.ch"

/*/{Protheus.doc} RFATA008
Log Apuração de Contratos
@author TOTVS
@since 27/04/2017
@version P12
@param Nao recebe parametros            
@return nulo
/*/

/***********************/
User Function RFATA008()
/***********************/

Local oBrowse

Private aRotina := {}

oBrowse := FWmBrowse():New()
oBrowse:SetAlias("Z21")
oBrowse:SetDescription("Log Apuração de Contratos")   
oBrowse:Activate()

Return Nil

/************************/
Static Function MenuDef()
/************************/

Local aRotina 	:= {}

ADD OPTION aRotina Title "Visualizar" 	Action "VIEWDEF.RFATA008"	OPERATION 2 ACCESS 0
ADD OPTION aRotina Title "Estornar"   	Action "U_FATA008E()"		OPERATION 4 ACCESS 0

Return aRotina

/*************************/
Static Function ModelDef()
/*************************/

// Cria a estrutura a ser usada no Modelo de Dados
Local oStruZ21 := FWFormStruct(1,"Z21",/*bAvalCampo*/,/*lViewUsado*/ )
Local oStruZ22 := FWFormStruct(1,"Z22",/*bAvalCampo*/,/*lViewUsado*/ )
Local oStruSE1 := U_DefStrModel("SE1")   
Local oStruSE2 := U_DefStrModel("SE2") 

Local oModel

// Cria o objeto do Modelo de Dados
oModel := MPFormModel():New("RFATP008",/*bPreValidacao*/,/*bPosValidacao*/,/*bCommit*/,/*bCancel*/ )

// Adiciona ao modelo uma estrutura de formulário de edição por campo
oModel:AddFields("Z21MASTER",/*cOwner*/,oStruZ21)

// Adiciona a chave primaria da tabela principal
oModel:SetPrimaryKey({"Z21_FILIAL","Z21_CODIGO"})

// Adiciona ao modelo uma estrutura de formulário de edição por grid
oModel:AddGrid("Z22DETAIL","Z21MASTER",oStruZ22,/*bLinePre*/,/*bLinePost*/,/*bPreVal*/,/*bPosVal*/,/*BLoad*/)
oModel:AddGrid("SE1DETAIL","Z21MASTER",oStruSE1,/*bLinePre*/,/*bLinePost*/,/*bPreVal*/,/*bPosVal*/,/*BLoad*/) 
oModel:AddGrid("SE2DETAIL","Z21MASTER",oStruSE2,/*bLinePre*/,/*bLinePost*/,/*bPreVal*/,/*bPosVal*/,/*BLoad*/) 

oModel:GetModel('SE1DETAIL'):SetOnlyQuery()
oModel:GetModel('SE1DETAIL'):SetOnlyView()

oModel:GetModel('SE2DETAIL'):SetOnlyQuery()
oModel:GetModel('SE2DETAIL'):SetOnlyView()

// Faz relaciomaneto entre os compomentes do model
oModel:SetRelation("Z22DETAIL", {{"Z22_FILIAL", 'xFilial("Z22")'},{"Z22_CODIGO","Z21_CODIGO"}},Z22->(IndexKey(1)))
oModel:SetRelation("SE1DETAIL", {{"E1_FILIAL" , 'xFilial("SE1")'},{"E1_XIDAPUR","Z21_CODIGO"}},SE1->(IndexKey(34))) //E1_FILIAL+E1_XIDAPUR
oModel:SetRelation("SE2DETAIL", {{"E2_FILIAL" , 'xFilial("SE2")'},{"E2_XIDAPUR","Z21_CODIGO"}},SE2->(IndexKey(21))) //E2_FILIAL+E2_XIDAPUR

// Desobriga a digitacao de ao menos um item
oModel:GetModel("SE1DETAIL"):SetOptional(.T.)
oModel:GetModel("SE2DETAIL"):SetOptional(.T.)

// Totalizadores
oModel:AddCalc("CALC1","Z21MASTER","SE1DETAIL","E1_NUM"  ,"QTD","COUNT",,,"Qtd. Títulos")
oModel:AddCalc("CALC1","Z21MASTER","SE1DETAIL","E1_VALOR","VLR","SUM",,,"Valor")
oModel:AddCalc("CALC1","Z21MASTER","SE1DETAIL","E1_SALDO","SLD","SUM",,,"Saldo")

oModel:AddCalc("CALC2","Z21MASTER","SE2DETAIL","E2_NUM"  ,"QTD","COUNT",,,"Qtd. Títulos")
oModel:AddCalc("CALC2","Z21MASTER","SE2DETAIL","E2_VALOR","VLR","SUM",,,"Valor")
oModel:AddCalc("CALC2","Z21MASTER","SE2DETAIL","E2_SALDO","SLD","SUM",,,"Saldo")

// Adiciona a descricao do Componente do Modelo de Dados
oModel:GetModel("Z21MASTER"):SetDescription("Apuração")
oModel:GetModel("Z22DETAIL"):SetDescription("Detalhe")
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
Local oStruZ21 := FWFormStruct(2,"Z21")
Local oStruZ22 := FWFormStruct(2,"Z22")
Local oStruSE1 := U_DefStrView("SE1")
Local oStruSE2 := U_DefStrView("SE2")

// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
Local oModel   := FWLoadModel("RFATA008")
Local oView
Local oCalc1
Local oCalc2

// Remove campos da estrutura
oStruZ22:RemoveField('Z22_CODIGO')

// Cria o objeto de View
oView := FWFormView():New()

// Define qual o Modelo de dados será utilizado
oView:SetModel(oModel)

// Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
oView:AddField("VIEW_Z21",oStruZ21,"Z21MASTER")

// Adiciona no nosso View um controle do tipo FormGrid(antiga newgetdados)
oView:AddGrid("VIEW_Z22",oStruZ22,"Z22DETAIL")
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
oView:AddSheet("PASTAS","ABA01","Apuração")
oView:AddSheet("PASTAS","ABA02","Títulos")

// Criar "box" horizontal para receber algum elemento da view
oView:CreateHorizontalBox("PAINEL_LOG",50,,,"PASTAS","ABA01")
oView:CreateHorizontalBox("PAINEL ITENS",50,,,"PASTAS","ABA01")

oView:CreateHorizontalBox("PAINEL FINP 1",35,,,"PASTAS","ABA02")    
oView:CreateHorizontalBox("PAINEL FINP 2",15,,,"PASTAS","ABA02")    
oView:CreateHorizontalBox("PAINEL FINR 1",35,,,"PASTAS","ABA02")    
oView:CreateHorizontalBox("PAINEL FINR 2",15,,,"PASTAS","ABA02")      

// Relaciona o ID da View com o "box" para exibicao
oView:SetOwnerView("VIEW_Z21","PAINEL_LOG")
oView:SetOwnerView("VIEW_Z22","PAINEL ITENS")
oView:SetOwnerView("VIEW_SE1","PAINEL FINP 1")
oView:SetOwnerView("VIEW_CALC1","PAINEL FINP 2")
oView:SetOwnerView("VIEW_SE2","PAINEL FINR 1")
oView:SetOwnerView("VIEW_CALC2","PAINEL FINR 2")

// Liga a identificacao do componente
oView:EnableTitleView("VIEW_Z21","Apuração")
oView:EnableTitleView("VIEW_Z22","Detalhe")
oView:EnableTitleView("VIEW_SE1","Crédito")
oView:EnableTitleView("VIEW_SE2","Título a Pagar")

// Define campos que terao Auto Incremento
oView:AddIncrementField("VIEW_Z22","Z22_ITEM")

// Define fechamento da tela ao confirmar a operação
oView:SetCloseOnOk( {||.T.} )

// Habilito a barra de progresso na abertura da tela
//oView:SetProgressBar(.T.)

Return oView 

/***********************/
User Function FATA008E()
/***********************/

If !VerifCont()

	If MsgYesNo("O Log será estornado, deseja continuar?")
	
		If Z21->Z21_TITFIN == "A" //A Pagar
		
			DbSelectArea("SE2")
			SE2->(DBOrderNickName("IDAPURACAO")) //E2_FILIAL+E2_XIDAPUR
			
			If SE2->(DbSeek(xFilial("SE2")+Z21->Z21_CODIGO))
	
				Begin Transaction
				
				lRet := U_ExcTitA(SE2->(Recno()))
				
				If lRet
	
					FlagApuZ13(Z21->Z21_CODIGO)
					
					If U_RFATE032(Z21->Z21_CODIGO)
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
			SE1->(DBOrderNickName("IDAPURACAO")) //E1_FILIAL+E1_XIDAPUR
			
			If SE1->(DbSeek(xFilial("SE1")+Z21->Z21_CODIGO))
				
				Begin Transaction
				
				lRet := U_ExcTitN(SE1->(Recno()))
				
				If lRet
				
					FlagApuZ13(Z21->Z21_CODIGO)
					
					If U_RFATE032(Z21->Z21_CODIGO)
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

Return

/**********************************/
Static Function FlagApuZ13(cIdApur)
/**********************************/

DbSelectArea("Z22")
Z22->(DbSetOrder(1)) //Z22_FILIAL+Z22_CODIGO+Z22_ITEM

DbSelectArea("Z14")
Z14->(DbSetOrder(1)) //Z14_FILIAL+Z14_CODIGO+Z14_ITEM

If Z22->(DbSeek(xFilial("Z22")+cIdApur))

	While Z22->(!EOF()) .And. Z22->Z22_FILIAL == xFilial("Z22") .And. Z22->Z22_CODIGO == cIdApur

		If Z14->(DbSeek(xFilial("Z14")+Z22->Z22_CODMOV+Z22->Z22_ITMOV))
			
			RecLock("Z14",.F.)
			Z14->Z14_APURAD := Space(1)
			Z14->(MsUnlock())
		Endif	
		
		Z22->(DbSkip())
	EndDo
Endif

Return

/**************************/
Static Function VerifCont()
/**************************/

Local lRet 		:= .F.
Local aAreaZ22	:= GetArea("Z22")

DbSelectArea("Z22")
Z22->(DbSetOrder(1)) //Z22_FILIAL+Z22_CODIGO+Z22_FILIAL

If Z22->(DbSeek(xFilial("Z22")+Z21->Z21_CODIGO))

	While Z22->(!EOF()) .And. Z22->Z22_FILIAL == xFilial("Z22") .And. Z22->Z22_CODIGO == Z21->Z21_CODIGO
		
		If Z22->Z22_LA == "S" //Contabilizado
			lRet := .T.
			Exit
		Endif
	
		Z22->(DbSkip())
	EndDo
Endif

RestArea(aAreaZ22)

Return lRet