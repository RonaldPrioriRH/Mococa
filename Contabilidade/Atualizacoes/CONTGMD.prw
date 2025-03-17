#INCLUDE "PROTHEUS.CH"
#INCLUDE "FWMVCDEF.CH"
#INCLUDE "TOTVS.CH"
#INCLUDE "topconn.ch"
#INCLUDE "Colors.ch" 
#INCLUDE "RWMAKE.CH"
#INCLUDE "tbiconn.ch"
#INCLUDE "tbicode.ch"

//Constantes
#Define STR_PULA		Chr(13)+Chr(10)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÝÝÝÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝËÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝËÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ»±±
±±ºPrograma  ³ CONTGMD  º Autor ³ TOTVS                 º Data da Criacao  ³ 12/11/2008                						º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÊÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÊÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºDescricao ³ Rotina desenvolvida para possibilitar o cadastramento de Veiculos utilizados na coleta de leite nos retiros. º±±
±±º          ³   												                               				                º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºUso       ³ CADASTRO DE VEICULOS.           						                                                        º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºParametros³ Nenhum						   							                               						º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºRetorno   ³ Nenhum						  							                               						º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºUsuario   ³ Microsiga                                                                                					º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºSetor     ³ Gestao do Leite.                                                                        						º±±
±±ÌÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÝÝÝÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³00/00/0000³                               				   ³00-000000 -                       ³ TI	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function CONTGMD()

Private oBrowse 	:= FwMBrowse():New()
Private bExclui     := {|| DelZ30() } // falta validação para não deixar excluir quando tiver Z29 CADSTRADA
Private bAtualiza   := {|| Grvz30() }
Private bLegenda	:= {|| Legenda()  }

	oBrowse:SetAmbiente(.T.)
	oBrowse:SetWalkThru(.T.)

	oBrowse := FWmBrowse():New()
	oBrowse:SetAlias('Z30')
	oBrowse:SetDescripton("Gerenciamento Matricial de Despesas") 

	oBrowse:AddLegend("Z30_STATUS == 'A' ", 	"GREEN",		"Analisado") 
	oBrowse:AddLegend("Z30_STATUS == 'E' ", 	"RED",	    	"Encerrado") 
	oBrowse:AddLegend("Z30_STATUS == 'P' ", 	"YELLOW",		"Pendente") 
	oBrowse:AddLegend("Z30_STATUS == 'S' ", 	"BLUE",	    	"Provis�o") 

//oBrowse:DisableDetails()
oBrowse:Activate()

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÝÝÝÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝËÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝËÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝ»±±
±±ºPrograma  ³AFAT006   ºAutor  ³TOTVS TM    º Data ³  21/02/13   º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÊÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÊÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºDesc.     ³Funcao para Menu do Browse                                  º±±
±±º          ³                                                            º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºUso       ³ Valoriza                                                   º±±
±±ÈÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function MenuDef()

Local aRotina := {}
Local aSubMnu := {}
	
	ADD OPTION aRotina TITLE 'Pesquisar'  			ACTION 'PesqBrw'       		OPERATION 1 ACCESS 0
	ADD OPTION aRotina TITLE 'Visualizar'			ACTION 'VIEWDEF.CONTGMD'	OPERATION 2 ACCESS 0
	ADD OPTION aRotina TITLE 'Incluir Provis�o '    ACTION 'VIEWDEF.CONTGMD'    OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar'    			ACTION 'VIEWDEF.CONTGMD'	OPERATION 4 ACCESS 0
	ADD OPTION aRotina Title 'Excluir'    			ACTION 'VIEWDEF.CONTGMD'    OPERATION 5 ACCESS 0
	ADD OPTION aRotina TITLE 'Legenda'     			ACTION 'Eval(bLegenda)'  	OPERATION 10 ACCESS 0 

	//Adiciona o arrya do submenu a op��o do menu
	ADD OPTION aRotina TITLE 'Processamentos GMD'    ACTION aSubMnu        	    OPERATION 9 ACCESS 0

	//Adiciona op��es no submenu
	ADD OPTION aSubMnu TITLE 'Parametro DT. Inicial' ACTION 'U_MVXDTGMD()'     	OPERATION 3 ACCESS 0 
	ADD OPTION aSubMnu TITLE 'Importa��o de Dados'   ACTION 'U_GMDIMP()'	  	OPERATION 3 ACCESS 0 
	ADD OPTION aSubMnu TITLE 'Encerramento'     	 ACTION 'U_GMDATU()' 		OPERATION 4 ACCESS 0 
	ADD OPTION aSubMnu TITLE 'Exclus�o por Lote'     ACTION 'U_GMDDEL()' 		OPERATION 5 ACCESS 0 


Return(aRotina)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÝÝÝÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝËÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝËÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝ»±±
±±ºPrograma  ³AFAT006   ºAutor  ³TOTVS TM    º Data ³  21/02/13   º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÊÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÊÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºDesc.     ³Funcao de Modelo de Dados.                                  º±±
±±º          ³Onde é definido a estrutura de dados                        º±±
±±º          ³Regra de Negocio.                                           º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºUso       ³ Valoriza                                                   º±±
±±ÈÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

Static Function ModelDef()

Local oStruct1	:=	FWFormStruct(1,'Z30', /*bAvalCampo*/, /*lViewUsado*/ )
Local oModel
Local aTrigger := {}        
Local _i       := 0
Local cCodAux  := PswRet(1)[1][1]
Local cUsrId   := AllTrim(GetMv("MV_XUSRGMD"))

// Propriedades de campos do cabe�alho
	//oStruct1:SetProperty("ZM0_PERCQB", MODEL_FIELD_INIT , {|| GetMv("LT_PERCQB")})
	//oStruct1:SetProperty("Z30_ORIGEM"		, MODEL_FIELD_WHEN,{|| ALTERA})

	//oModel	:=	MpFormModel():New('ID_MODEL',/*Pre-Validacao*/,/*Pos-Validacao*/,/*Commit*/,/*Commit*/,/*Cancel*/)
    oModel	:=	MpFormModel():New('ID_MODEL',/*Pre-Validacao*/,{|oModel| TUDOOK(oModel)}/*Pos-Validacao*/,/*Commit*/,/*Commit*/,/*Cancel*/)

	// criacao de trigger para preencher quantidade de litros do periodo
	/*
	[01] identificador (ID) do campo de origem
	[02] identificador (ID) do campo de destino
	[03] Bloco de c�digo de valida��o da execu��o do gatilho
	[04] Bloco de c�digo de execu��o do gatilho
	*/

	//GLPI#10047 Ferramenta GMD - Permitir altera��o do campo Z30_REALIZ para alguns usu�rios
	If !(AllTrim(cCodAux) $ (cUsrId)) //Usu�rios Deivide e Marcelo '000028/000133'
		oStruct1:SetProperty("Z30_REALIZ"		, MODEL_FIELD_WHEN,{|| .F.})	
	EndIf

	aAdd(aTrigger, FwStruTrigger('Z30_CLASSE'   ,'Z30_PACOTE'   ,'AK6->AK6_XPACOT',.T.,'AK6',1,'xFilial("AK6")+M->Z30_CLASSE'))
	aAdd(aTrigger, FwStruTrigger('Z30_CLASSE'   ,'Z30_DESCLA'   ,'AK6->AK6_DESCRI',.T.,'AK6',1,'xFilial("AK6")+M->Z30_CLASSE'))
	aAdd(aTrigger, FwStruTrigger('Z30_CLASSE'   ,'Z30_DESPAC'   ,'ZCD->ZCD_DESCR',.T.,'ZCD',1,'xFilial("ZCD")+M->Z30_PACOTE'))
	aAdd(aTrigger, FwStruTrigger('Z30_CDC'   	,'Z30_DESPES'   ,'CTT->CTT_XCD',.T.,'CTT',1,'xFilial("CTT")+M->Z30_CDC'))
	aAdd(aTrigger, FwStruTrigger('Z30_CDC'   	,'Z30_DESCDC'   ,'CTT->CTT_DESC01',.T.,'CTT',1,'xFilial("CTT")+M->Z30_CDC'))
	aAdd(aTrigger, FwStruTrigger('Z30_CDC'   	,'Z30_RESPON'   ,'CTT->CTT_XRESP',.T.,'CTT',1,'xFilial("CTT")+M->Z30_CDC'))
	aAdd(aTrigger, FwStruTrigger('Z30_CONTA '   ,'Z30_DESCON'   ,'CT1->CT1_DESC01',.T.,'CT1',1,'xFilial("CT1")+M->Z30_CONTA'))


	For _i := 1 to Len(aTrigger)
		oStruct1:AddTrigger(aTrigger[_i][1] ,aTrigger[_i][2] ,aTrigger[_i][3] ,aTrigger[_i][4] )
	Next _i

	oModel:AddFields('ID_MODEL_FLD_Z30', /*cOwner*/, oStruct1, /*bPreValidacao*/, /*{|oModel| ATUASB2(oModel)}*/, /*bCarga*/ )
		
	oModel:SetPrimaryKey({'Z30_FILIAL','Z30_FILORI','Z30_DOC','Z30_SEQ','Z30_CDC','Z30_IDPRODUTO'})
	
	oModel:SetDescription('Gerenciamento Matricial de Despesas')

	oModel:GetModel( 'ID_MODEL_FLD_Z30' ):SetDescription( 'Gerenciamento Matricial de Despesas' )
	
Return(oModel)


// Valida��o altera��o Manual
Static Function TUDOOK(oModel)

Local nOperation	:=	oModel:GetOperation()
Local oStruct	    :=	oModel:GetModel('ID_MODEL_FLD_Z30')
Local _cStatus      :=  oStruct:GetValue("Z30_STATUS")	
Local lRet  		:= .T.  
   

	//Altera��o Manual
	If nOperation	==	4 

		If AllTrim(_cStatus) $ 'E/S'
			Help( ,,1,"Aten��o","N�o � permitido alterar registro Encerrados ou de Provis�o!", 1, 0 )
			//xMagHelpFis("Aten��o Status GMD"," N�o � permitido alterar registro Encerrados ou de Provis�o!"," Excluir e importar novamente.")
			lRet := .F.	
		EndIF

	EndIf

Return lRet


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÝÝÝÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝËÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝËÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝ»±±
±±ºPrograma  ³AFAT006   ºAutor  ³TOTVS TM    º Data ³  21/02/13   º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÊÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÊÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºDesc.     ³Funcao de Visualizacao.                                     º±±
±±º          ³Onde é definido a visualizacao da Regra de Negocio.         º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºUso       ³ Valoriza                                                   º±±
±±ÈÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

Static Function ViewDef()

Local oStruct1	:=	FWFormStruct(2,'Z30')
Local oModel	:=	FwLoadModel('CONTGMD') 
Local oView		:=	FwFormView():New()
	
	oView:SetModel(oModel)	
	oView:AddField( 'ID_VIEW_FLD_Z30', oStruct1, 'ID_MODEL_FLD_Z30')
		
	oView:CreateHorizontalBox( 'ID_HBOX_100', 100 ) 
	oView:SetOwnerView( 'ID_VIEW_FLD_Z30', 'ID_HBOX_100' )

Return(oView)


User Function GMDIMP()

Local aMensagem := {}
Local aBotoes   := {}
Local bSair     := .T.
Local bOk 		:= {|| Processa({|| GrvZ30() }) }  
Local bCancel 	:= {|| oDlgFil:End() }    
	
Static oDlgFil 

Private cTitulo := "Importa��o de GMD"
Private oArq
Private cArq	:= ""
Private oTipo	
Private nTipo	:= 1
Private aTipos	:= {}
		
	aAdd( aMensagem, OemToAnsi("Este programa tem como objetivo importar dados do GMD"))
	aAdd( aMensagem, OemToAnsi("    "))
	
	aAdd( aBotoes, { 19, .T., { || FechaBatch(), bSair     := .F. } } )
	aAdd( aBotoes, { 02, .T., { || FechaBatch(), bSair     := .T. } } )
	
	FormBatch( cTitulo, aMensagem, aBotoes, , 260,700  )
	
	if !bSair
		
		Processa({|| GrvZ30() })
		
	endif

Return


User Function GMDATU()

Local aMensagem := {}
Local aBotoes   := {}
Local bSair     := .T.
Local bOk 		:= {|| Processa({|| AtuZ30() }) }  
Local bCancel 	:= {|| oDlgFil:End() }    
	
Static oDlgFil 

Private cTitulo2 := "Encerramento do GMD"
Private oArq
Private cArq	:= ""
Private oTipo	
Private nTipo	:= 1
Private aTipos	:= {}
		
	aAdd( aMensagem, OemToAnsi("Este programa tem como objetivo realizar Encerramento do GMD"))
	aAdd( aMensagem, OemToAnsi("    "))
	
	aAdd( aBotoes, { 19, .T., { || FechaBatch(), bSair     := .F. } } )
	aAdd( aBotoes, { 02, .T., { || FechaBatch(), bSair     := .T. } } )
	
	FormBatch( cTitulo2, aMensagem, aBotoes, , 260,700  )
	
	if !bSair
		
		Processa({|| AtuZ30() })
		
	endif

Return

User Function GMDDEL()

Local aMensagem := {}
Local aBotoes   := {}
Local bSair     := .T.
Local bOk 		:= {|| Processa({|| DelZ30() }) }  
Local bCancel 	:= {|| oDlgFil:End() }    
	
Static oDlgFil  

Private cTitulo2 := "Exclus�o por LOTE GMD"
Private oArq
Private cArq	:= ""
Private oTipo	
Private nTipo	:= 1
Private aTipos	:= {}
		
	aAdd( aMensagem, OemToAnsi("Este programa tem como objetivo realizar Exclus�o por Lote do GMD"))
	aAdd( aMensagem, OemToAnsi("    "))
	
	aAdd( aBotoes, { 19, .T., { || FechaBatch(), bSair     := .F. } } )
	aAdd( aBotoes, { 02, .T., { || FechaBatch(), bSair     := .T. } } )
	
	FormBatch( cTitulo2, aMensagem, aBotoes, , 260,700  )
	
	if !bSair
		
		Processa({|| DelZ30() })
		
	endif

Return

//Grava��o dos Dados Z30 - GMD
Static Function GrvZ30()

Local aArea := GetArea()
Local cQry  := ""
Local cEol  := chr(13)+chr(10)
Local nTotReg,_nReg := 0
Local nCont  := 1
Local nAtual := 0
Local nTotal := 0
Local aPergs := {}
Local aRet := {}
Local aButtons := {}
Local aOrigens := {"Entradas","Dev Compras","Brindes/Amostras","Vendas Sucatas","Requisi��es","Folpag","Dep/Amor","Verbas/Contratos","Comissoes","Apropriar","Receber","Pagar","MovBco","Contratos","Bx Perda"}
Local aStatus := {"Analisado","Pendente"}
Local d_DTini := SuperGetMV("MV_XDTGMD", ,"01/01/1999")
Local d_DTfin := CtoD('//')
Local cCombo := " "
Local cStatus := " "
Local nX := 0
Local nY := 0
Local cTexto := " " 


	aAdd( aPergs ,{1,"Data Inicial"  ,d_DTini,"",".T.","",".F.",60,.T.}) // Tipo data
	aAdd( aPergs ,{1,"Data Final"    ,d_DTfin,"","","","",60,.F.}) // Tipo data
	aAdd( aPergs ,{2,"Status","Analisado",aStatus,60,"",.F.}) 

	//Tipo 5 - Cria Op��es de CheckBox.	
	// Define field values
	aAdd( aPergs ,{9,"Defina os Tipos de Origens: ",200, 40,.T.})
	For nX := 1 To Len(aOrigens)
			aAdd( aPergs ,{5,aOrigens[nX]                ,.F.,90,"",.F.})	
	Next nX

	//Se a pergunta foi confirmada
	If ParamBox(aPergs, "Informe os par�metros", @aRet, {|| fValidOk()}, /*aButtons*/, /*lCentered*/, /*nPosX*/, /*nPosY*/, /*oDlgWizard*/, /*cLoad*/, .F., .F.)
		d_DTfin := mv_par02
		cStatus := mv_par03
		//cCombo  := aRet[3]

		For nY := 5 To Len(aRet)
			If aRet[nY] = .T.
					cTexto += "'"+aPergs[nY][2]+"'"+","		
			EndIF
		Next nY

		cTexto += "'X"+"'"

	   		cQry:=  "SELECT  FILIAL,     " +cEOL
					cQry+=  "DTMOV,      " +cEOL
					cQry+=  "DTEMISSAO,  " +cEOL
					cQry+=  "NFISCAL,    " +cEOL
					cQry+=  "SEQ,        " +cEOL
					cQry+=  "ESP,        " +cEOL
					cQry+=  "TES,        " +cEOL					
					cQry+=  "NFORIGEM,     " +cEOL    // Para n�o mudar estrutura do GMD Deivide		
					cQry+=  "TPMOV,      " +cEOL
					cQry+=  "PARCEIRO,   " +cEOL
					cQry+=  "NOMEPARCEIRO,   " +cEOL
					cQry+=  "LOJA,       " +cEOL
					cQry+=  "TRIM(PRODUTO) PRODUTO,    " +cEOL
					cQry+=  "TRIM(DESCPROD) DESCPROD,    " +cEOL
					cQry+=  "TIPOGASTO TIPOGASTO,  " +cEOL
					cQry+=  "CLASSORC,   " +cEOL
					cQry+=  "TRIM(DESCRICLASS) DESCRICLASS,   " +cEOL
					cQry+=  "(SELECT AK6_XPACOT FROM AK6010   " +cEOL
					cQry+=  " 	WHERE AK6010.D_E_L_E_T_ = ' '   " +cEOL
					cQry+=  "AND AK6_CODIGO = TRIM(CLASSORC)) AS CODPACOTE,   " +cEOL
					cQry+=  "PACOTE,     " +cEOL
					cQry+=  "CONTABILIZA,    " +cEOL 
					cQry+=  "CTACONTABIL," +cEOL
					cQry+=  "TRIM(DESCCTA) DESCCTA," +cEOL
					cQry+=  "CCUSTO,     " +cEOL
					cQry+=  "TRIM(DESCCCUSTO) DESCCCUSTO,     " +cEOL
					cQry+=  "TRIM(TIPOCC) TIPOCC,     " +cEOL
					cQry+=  "MES," +cEOL
					cQry+=  "RESPONSAVEL," +cEOL
					cQry+=  "QTDE,       " +cEOL
					cQry+=  "VLRUNIT,    " +cEOL
					cQry+=  "TOTALITENS, " +cEOL
					cQry+=  "TOTNF,      " +cEOL
					cQry+=  "VALORORIGINAL,    " +cEOL 
					cQry+=  "DESCONT,    " +cEOL
					cQry+=  "FILIALNOME,    " +cEOL  
					cQry+=  "HISTORICO,   " +cEOL
					cQry+=  "TPSALDO,   " +cEOL
					//Removendo . da Key PK
					//cQry+=  "TRIM(FILIAL||SEQ||CTACONTABIL||CCUSTO||REPLACE(TRIM(TO_CHAR(VLRUNIT)),'.')) AS IDREG   " +cEOL Antiga Caique tamanho 46
					//cQry+=  "TRIM(FILIAL||TO_CHAR(DTEMISSAO,'DDMMYYYY')||NFISCAL||SEQ||ESP||PARCEIRO||LOJA||PRODUTO||ITEMRAT) AS IDREG    " +cEOL
					//3 PK para bater os registros !
					//Tem que ser DTMOV e n�o DTEMISSAO conforme Maria pediu para alterar 
					cQry+=  "TRIM(FILIAL||TO_CHAR(DTMOV,'DDMMYYYY')||NFISCAL||SEQ||ESP||PARCEIRO||LOJA||PRODUTO||ITEMRAT||TRIM(RECFKS)||TRIM(LINHA)) AS IDREG    " +cEOL
					cQry+=  "FROM   	FGMD " +cEOL
			cQry+=  "WHERE " +cEOL 
					//cQry+=  "  NFISCAL = '000000145' " +cEOL
					//cQry+=  "AND DTEMISSAO  = '"+ dtos(d_DTfin)+"' " +cEOL
					cQry+=  "DTMOV BETWEEN '"+ DtoS( d_DTini )+"' AND '" + DtoS(d_DTfin) + "' " +cEOL
					cQry+=  "AND TPMOV IN ("+ UPPER(cTexto) +") " +cEOL  
					cQry+=  "AND TOTNF <> 0 " +cEOL
										
					//cQry+=  "AND NFISCAL = '000000111' " +cEOL
					//cQry+=  "AND SEQ = '000113' " +cEOL


		MemoWrite("C:\temp\Z30Grav_v2.sql",cQry)

		cQry := ChangeQuery(cQry)

		If Select("TRB") > 0'
			TRB->(DbCloseArea())
		EndIf

		TcQuery cQry New Alias "TRB"
		
		//Se houver dados
		If ! TRB->(EoF())
		Count To nTotal
   		ProcRegua(nTotal)

		dbSelectArea("TRB")
		TRB->(dbGoTop()) 

		Z30->(DbSelectArea("Z30"))
		Z30->(DbSetOrder(4))
		Z30->(DbGotop())

		While !TRB->(Eof()) 
			
			//Se n�o existe na tabela inclui 	
			If  !Z30->(DbSeek(AllTrim(TRB->FILIAL)+AllTrim(TRB->IDREG)))	 
			//If  !Z30->(DbSeek(ALLTRIM(TRB->FILIAL)+ALLTRIM(TRB->NFISCAL)+ALLTRIM(TRB->SEQ)))
			
				//Incrementa a mensagem na r�gua   
				nAtual++
        		IncProc("Importando Dados " + cValToChar(nAtual) + " de " + cValToChar(nTotal) )
				
				RecLock("Z30",.T.)	

				Z30_FILIAL  :=  TRB->FILIAL
				Z30_STATUS 	:=  IIF(AllTrim(cStatus) == "Analisado","A","P")
				Z30_FILORI  :=  TRB->FILIAL
				Z30_DTLANC  :=  TRB->DTMOV	
				Z30_EMISSA  :=  TRB->DTEMISSAO
				Z30_DOC     :=  AllTrim(TRB->NFISCAL)
				Z30_ORIGEM  :=  Upper(TRB->TPMOV)
				Z30_SEQ     :=  TRB->SEQ
				Z30_ESPECI  :=  TRB->ESP
				Z30_TES     :=  TRB->TES
				Z30_NFORIG  :=  AllTrim(TRB->NFORIGEM) 
				Z30_PARCEI  :=  TRB->PARCEIRO
				Z30_NOME	:=  AllTrim(TRB->NOMEPARCEIRO)
				Z30_LOJA    :=  TRB->LOJA  
				Z30_IDPROD  :=  TRB->PRODUTO
				Z30_DESC	:= 	TRB->DESCPROD

				//Usar $ ou == 

				If 'Despesas Variaveis' $ TRB->TIPOGASTO 
					Z30_GASTO   := '1'
				ElseIf  'Fixo' $ TRB->TIPOGASTO 
					Z30_GASTO 	:= '2'
				ElseIf  'N�o Operacional' $ TRB->TIPOGASTO 
					Z30_GASTO	:= '3'
				ElseIf  'Variavel' $ TRB->TIPOGASTO 
					Z30_GASTO 	:= '4'
				ElseIf  'Despesas Financeiras' $ TRB->TIPOGASTO 
					Z30_GASTO	:= '5'
				ElseIf  'Receitas Financeiras' $ TRB->TIPOGASTO 
					Z30_GASTO	:= '6'
				EndIf

				Z30_CONTAB	:=  TRB->CONTABILIZA
				Z30_CLASSE  :=  TRB->CLASSORC
				Z30_DESCLA  :=  TRB->DESCRICLASS
				Z30_PACOTE  :=  TRB->CODPACOTE
				Z30_DESPAC  :=  TRB->PACOTE
				Z30_CONTA   :=  TRB->CTACONTABIL
				Z30_DESCON	:= 	TRB->DESCCTA
				Z30_CDC     :=  TRB->CCUSTO
				Z30_DESCDC	:=	TRB->DESCCCUSTO
				Z30_DESPES  :=  IIF(AllTrim(TRB->TIPOCC) == "Custo","C",'D')  
				Z30_MES  	:=  TRB->MES
				Z30_RESPON  :=  TRB->RESPONSAVEL
				Z30_QTD     :=  TRB->QTDE
				Z30_UNITAR  :=  TRB->VLRUNIT
				Z30_TOTAL   :=  TRB->TOTALITENS
				Z30_REALIZ  :=  TRB->TOTNF
				Z30_HISTOR  :=  TRB->HISTORICO
				Z30_VALORI  :=  TRB->VALORORIGINAL
				Z30_DESCF 	:=  TRB->DESCONT	
				Z30_FILNOM  :=  TRB->FILIALNOME
				Z30_TPSALD  :=  TRB->TPSALDO
				//Z30_TPSALD  :=  "1"
				Z30_IDREG 	:=  AllTrim(TRB->IDREG)
				Z30_USER	:=  UsrRetName(RetCodUsr())

				Z30->(MsUnlock())

			TRB->(DbSkip())
			
			Else
				TRB->(DbSkip())				
			Endif
		EndDo

		If nAtual > 0
			Aviso("Aviso","Processado com sucesso!",{"Ok"})
		Else
			Aviso("Aviso","N�o existem registros novos dentro do periodo informado para importa��o!",{"Ok"})	
		EndIF

		//Se n�o houver, mostra mensagem
		Else
        	MsgStop("N�o foi encontrado informa��es com os filtros informados!", "Aten��o")
    	EndIf

		TRB->(DbCloseArea())
		RestArea(aArea)
  	Else
	 	Return 
  	EndIF

Return

//Rotina de Encerramento - GMD
Static Function AtuZ30()

Local aArea := GetArea()
Local cQry := ""
Local cEol := chr(13)+chr(10)
Local nTotReg,_nReg := 0
Local nCont := 1
Local nAtual := 0
Local nTotal := 0
Local aPergs := {}
Local aRet := {}
Local aButtons := {}
Local aOrigens   := {"Entradas","Dev Compras","Brindes/Amostras","Vendas Sucatas","Requisi��es","Folpag","Dep/Amor","Verbas/Contratos","Comissoes","Apropriar","Receber","Pagar","MovBco","Contratos","Bx Perda"}
Local d_DTini := SuperGetMV("MV_XDTGMD", ,"01/01/1999")
Local d_DTfin := CtoD('//')
Local cOrigem := " "

	aAdd( aPergs ,{1,"Data Inicial"  ,d_DTini,"",".T.","",".F.",60,.T.}) // Tipo data
	aAdd( aPergs ,{1,"Data Final"  ,d_DTfin,"","","","",60,.F.}) // Tipo data
	aAdd( aPergs ,{2,"Origens ","Entradas",aOrigens,60,"",.T.})

	//Se a pergunta foi confirmada
	If ParamBox(aPergs, "Informe os par�metros Atualiza��o", @aRet, {|| fValidOk()}, /*aButtons*/, /*lCentered*/, /*nPosX*/, /*nPosY*/, /*oDlgWizard*/, /*cLoad*/, .F., .F.)
		d_DTfin := mv_par02	//aRet[2]
		cOrigem := mv_par03	//aRet[3]

				cQry:=  "SELECT  * FROM  Z30010    " +cEOL
				cQry+=  "WHERE " +cEOL 
				cQry+=  "Z30010.D_E_L_E_T_ = ' ' " +cEOL
				//cQry+=  "AND Z30_DOC = '000002407' " +cEOL
				cQry+=  "AND Z30_DTLANC BETWEEN '"+ DtoS( d_DTini )+"' AND '" + DtoS(d_DTfin) + "' " +cEOL
				cQry+=  "AND Z30_ORIGEM = '"+ UPPER(cOrigem) +"' " +cEOL 	
				//cQry+=  "AND Z30_FILIAL = '0102' " +cEOL
				cQry+=  "AND Z30_STATUS IN ('A','S')  " +cEOL  //Atualizar apenas os status de Analisado e Pendente

		MemoWrite("C:\temp\Z30UPd.sql",cQry)

		cQry := ChangeQuery(cQry)

		If Select("TRB") > 0
			TRB->(DbCloseArea())
		EndIf

		TcQuery cQry New Alias "TRB"
		
		//Se houver dados
		If ! TRB->(EoF())
		Count To nTotal
   		ProcRegua(nTotal)

		dbSelectArea("TRB")
		TRB->(dbGoTop())

		Z30->(DbSelectArea("Z30"))
		Z30->(DbSetOrder(4))
		Z30->(DbGotop())

		While !TRB->(Eof())  

			//Se existe na tabela Atualiza		 
			//IF  Z30->(DbSeek(ALLTRIM(TRB->Z30_FILIAL)+ALLTRIM(TRB->Z30_DOC)+ALLTRIM(TRB->Z30_SEQ)))
			If  Z30->(DbSeek(AllTrim(TRB->Z30_FILIAL)+AllTrim(TRB->Z30_IDREG)))
				//Incrementa a mensagem na r�gua   
				nAtual++
        		IncProc("Encerramento do GMD  " + cValToChar(nAtual) + " de " + cValToChar(nTotal) + "...")
				
				RecLock("Z30",.F.)	

				Z30_STATUS  := 'E'
				Z30_USER	:= UsrRetName(RetCodUsr())
				Z30_DTENC	:= dDatabase
		
				Z30->(MsUnlock())

			TRB->(DbSkip())
			
			Else
				
				TRB->(DbSkip())				
			EndIf
		EndDo

		Aviso("Aviso","Atualizado com sucesso!",{"Ok"})

		//Se n�o houver, mostra mensagem
		Else
        	MsgStop("N�o foi encontrado informa��es com os filtros informados!", "Aten��o")
    	EndIf

		TRB->(DbCloseArea())
		RestArea(aArea)
    Else
		Return 
 	EndIF

Return

//Rotina de Dele��o - GMD
Static Function DelZ30()

Local aArea := GetArea()
Local cQry := ""
Local cEol  := chr(13)+chr(10)
Local nTotReg,_nReg := 0
Local nCont := 1
Local nAtual := 0
Local nTotal := 0
Local aPergs := {}
Local aRet := {}
Local aButtons := {}
Local aStatus := {"Analisado","Encerrado","Pendente","Provis�o"}
Local d_DTini := SuperGetMV("MV_XDTGMD", ,"01/01/1999")
Local d_DTfin := CtoD('//')
Local cCombo  := " "
Local cNotaDe := Upper(Space(09))
Local cNotaAte := "ZZZZZZZZZ"
Local cFilDe := Upper(Space(04))
Local cFilAte := "ZZZZ"
Local cForDe := Upper(Space(06))
Local cForAte := "ZZZZZZ"
Local cLojDe := Upper(Space(02))
Local cLojAte := "ZZ"
Local nX := 0
Local nY := 0
Local cDel := " " 
Local cQry := ""
Local cOrigem := " "
Local aOrigens   := {"Entradas","Dev Compras","Brindes/Amostras","Vendas Sucatas","Requisi��es","Folpag","Dep/Amor","Verbas/Contratos","Comissoes","Apropriar","Receber","Pagar","MovBco","Contratos","Bx Perda"}
Local lSqlOk := .t.

		aAdd( aPergs ,{1,"Data Inicial"  ,d_DTini,"",".T.","",".F.",60,.T.}) // Tipo data
 		aAdd( aPergs ,{1,"Data Final"    ,d_DTfin,"","","","",60,.F.}) // Tipo data
 		aAdd( aPergs, {1,"Nota De",  cNotaDe,  "" , ".T.", "", ".T.", 60,  .F.}) 
 		aAdd( aPergs, {1,"Nota At�", cNotaAte,  "" , ".T.", "", ".T.", 60,  .F.})
		aAdd( aPergs ,{2,"Origens","Entradas",aOrigens,60,"",.T.})
		//Novos Parametros GLPI #9791 
        aAdd( aPergs, {1,"Filial De",  cFilDe,  "" , ".T.", "SM0", ".T.", 15,  .F.}) 
 		aAdd( aPergs, {1,"Filial At�", cFilAte,  "" , ".T.", "SM0", ".T.", 15,  .F.})
		aAdd( aPergs, {1,"Fornecedor De",  cForDe,  "" , ".T.", "SA2", ".T.", 15,  .F.}) 
 		aAdd( aPergs, {1,"Fornecedor At�", cForAte,  "" , ".T.", "SA2", ".T.", 15,  .F.})
		aAdd( aPergs, {1,"Loja De",  cLojDe,  "" , ".T.", "", ".T.", 04,  .F.}) 
 		aAdd( aPergs, {1,"Loja At�", cLojAte,  "" , ".T.", "", ".T.", 04,  .F.})	
    		
		// Define field values			
		aAdd( aPergs ,{9,"Defina os Status para dele��o: ",200, 40,.T.})  

			For nX := 1 To Len(aStatus)
					aAdd( aPergs ,{5,aStatus[nX]                ,.F.,90,"",.F.}) 	
			Next nX	

		If ParamBox(aPergs, "Informe os par�metros para Dele��o", @aRet, {|| fValidOk()}, /*aButtons*/, /*lCentered*/, /*nPosX*/, /*nPosY*/, /*oDlgWizard*/, /*cLoad*/, .F., .F.)
			//Segunda forma de pegar conte�do pelos mv_par	
			d_DTfin := mv_par02 //aRet[2]
			cNotaDe := mv_par03 //aRet[3]
			cNotaAte := mv_par04 //aRet[4]
			cOrigem := mv_par05	//aRet[5]
			cFilDe := mv_par06 //aRet[6]
			cFilAte := mv_par07 //aRet[7]
			cForDe := mv_par08 //aRet[8]
			cForAte := mv_par09 //aRet[9]
			cLojDe := mv_par10 //aRet[10]
			cLojAte := mv_par11 //aRet[11]

			//cCombo  := aRet[3]

			For nY := 13 To Len(aRet)
				If aRet[nY] = .T.
						cDel += "'"+aPergs[nY][2]+"'"+","		
				EndIF
			Next nY

			cDel := Strtran(cDel,'Analisado',"A")
			cDel := Strtran(cDel,'Encerrado',"E")			
			cDel := Strtran(cDel,'Pendente',"P")
			cDel := Strtran(cDel,'Provis�o',"S")
			
			cDel += "'X"+"'"

			cQry:=  "SELECT  Z30_FILIAL, Z30_DOC,Z30_SEQ, Z30_ORIGEM, Z30_STATUS, Z30_PARCEI,Z30_LOJA, R_E_C_N_O_ AS REC FROM  Z30010    " +cEOL
			cQry+=  "WHERE " +cEOL 
			cQry+=  "Z30010.D_E_L_E_T_ = ' ' " +cEOL
            //cQry+=  "AND Z30_DOC = '000002407' " +cEOL
			cQry+=  "AND Z30_DTLANC BETWEEN '"+ DtoS( d_DTini )+"' AND '" + DtoS(d_DTfin) + "' " +cEOL
			cQry+=  "AND Z30_DOC BETWEEN '"+  AllTrim(cNotaDe)+"' AND '" +  AllTrim(cNotaAte) + "' " +cEOL
			cQry+=  "AND Z30_STATUS IN ("+ cDel +") " +cEOL 
			cQry+=  "AND Z30_ORIGEM = '"+ UPPER(cOrigem) +"' " +cEOL  
			cQry+=  "AND Z30_FILIAL BETWEEN '"+  AllTrim(cFilDe)+"' AND '" +  AllTrim(cFilAte) + "' " +cEOL
			cQry+=  "AND Z30_PARCEI BETWEEN '"+  AllTrim(cForDe)+"' AND '" +  AllTrim(cForAte) + "' " +cEOL
			cQry+=  "AND Z30_LOJA BETWEEN '"+  AllTrim(cLojDe)+"' AND '" +  AllTrim(cLojAte) + "' " +cEOL

			MemoWrite("C:\temp\Z30DEL_v2.sql",cQry)

			cQry := ChangeQuery(cQry)

			if Select("TRBDEL") > 0
				TRB->(DbCloseArea())
			endif

			TcQuery cQry New Alias "TRBDEL"

			TRBDEL->(DbGoTop())

			If !TRBDEL->(EoF())

				DO While !TRBDEL->(Eof())

					//Aten��o quando for utilizar este exemplo, se passar a tabela Errada vai delar outros movimentos
					IncProc("Processando Dele��o Z30... ")
					cQryUpd := ""			
					cQryUpd += " UPDATE "+ RetSqlName("Z30") 				
					cQryUpd += " SET D_E_L_E_T_ = '*',"  
					cQryUpd += " R_E_C_D_E_L_ =  " + alltrim(str(REC)) + " 
					cQryUpd += " WHERE R_E_C_N_O_ = " + alltrim(str(REC)) "

					MemoWrite("C:\temp\DELZ30_exluir.sql",cQryUpd)

					lSqlOk := !(TCSQLExec(cQryUpd) < 0)
					
					If lSqlOk .and. (TcGetDB() == 'ORACLE')
						lSqlOk := !(TCSQLExec("COMMIT") <0)
					EndIf

					If !lSqlOk
						MsgStop("Erro ao excluir: "+Chr(13)+Chr(10)+TCSqlError(), "Aten��o")
						Return .F.	
					EndIf

					TRBDEL->( dbSkip())

				EndDo
				Aviso("Aviso","Processado de exclus�o com sucesso!",{"Ok"})
			Else 	
				MsgStop("N�o foi encontrado informa��es com os filtros informados!", "Aten��o")  	   
			Endif
				TRBDEL->(DbCloseArea())
				RestArea(aArea)
		Else
			Return
		Endif

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÝÝÝÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝËÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝËÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝ»±±
±±ºPrograma  ³ RFAT006L º Autor ³ Raphael Martins		 Data³ 22/03/2017 º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÊÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÊÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºDesc.     ³ Legenda do browser										  º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºUso       ³ Aviso Urgente	                                          º±±
±±ÈÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/


Static Function Legenda()

	BrwLegenda("Status do GMD","Legenda",{{"BR_VERDE","Analisado"},;
										  {"BR_VERMELHO","Encerrado"},;
										  {"BR_AMARELO","Pendente"},;
										  {"BR_AZUL","Provis�o"}})


//Valida��o das Perguntas
Static Function fValidOK()

Local lRet := .T.
Local dDataIni := MV_PAR01
Local dDataFin := MV_PAR02
 
    If  dDataFin < dDataIni
        MsgStop("N�o � permitido utilizar a data Final menor que a data Inicial!")
        lRet := .F.
    EndIf

Return lRet

//Rotina Altera��o do Parametro Data Inicial

User Function MVXDTGMD                         
// Variaveis Locais da Funcao
Local cEdit1 := GetMv("MV_XDTGMD")
Local cEdit2 := GetMv("MV_XDTGMD")
Local oEdit1
Local oEdit2

Private _oDlg // Dialog Principal
Private _lReturn     := .F.

	IF !fDigSenha()
		Return
	Endif

	DEFINE MSDIALOG _oDlg TITLE "Parametro de Data Inicial MV_XDTGMD " FROM C(350),C(575) TO C(487),C(721) PIXEL
	@ C(007),C(007) Say "Data Atual" Size C(027),C(008) COLOR CLR_BLACK PIXEL OF _oDlg
	@ C(015),C(007) MsGet oEdit1 Var cEdit1 Size C(060),C(009) COLOR CLR_BLACK WHEN .F. PIXEL OF _oDlg
	@ C(030),C(007) Say "Nova Data" Size C(028),C(008) COLOR CLR_BLACK PIXEL OF _oDlg
	@ C(037),C(007) MsGet oEdit2 Var cEdit2 Size C(060),C(009) COLOR CLR_BLACK PIXEL OF _oDlg HASBUTTON
	DEFINE SBUTTON FROM C(055),C(007) TYPE 1 ENABLE OF _oDlg ACTION _bOk(cEdit2)
	DEFINE SBUTTON FROM C(055),C(040) TYPE 2 ENABLE OF _oDlg ACTION _oDlg:End()
	ACTIVATE MSDIALOG _oDlg CENTERED

Return(.T.)

//**************************
Static Function _bOk(cEdit2)
//**************************
	_oDlg:End()
	PutMv("MV_XDTGMD",cEdit2)
	Final("Aten��o", "A tela ser� fechada para carregar o novo parametro!")

Return

/*������������������������������������������������������������������������������
��������������������������������������������������������������������������������
����������������������������������������������������������������������������Ŀ��
���Programa   �   C()   � Autores � Norbert/Ernani/Mansano � Data �10/05/2005���
����������������������������������������������������������������������������Ĵ��
���Descricao  � Funcao responsavel por manter o Layout independente da       ���
���           � resolucao horizontal do Monitor do Usuario.                  ���
�����������������������������������������������������������������������������ٱ�
��������������������������������������������������������������������������������
������������������������������������������������������������������������������*/
Static Function C(nTam)

Local nHRes	:=	oMainWnd:nClientWidth	// Resolucao horizontal do monitor
	If nHRes == 640	// Resolucao 640x480 (soh o Ocean e o Classic aceitam 640)
		nTam *= 0.8
	ElseIf (nHRes == 798).Or.(nHRes == 800)	// Resolucao 800x600
		nTam *= 1
	Else	// Resolucao 1024x768 e acima
		nTam *= 1.28
	EndIf

//���������������������������Ŀ
//�Tratamento para tema "Flat"�
//�����������������������������
	If "MP8" $ oApp:cVersion
		If (Alltrim(GetTheme()) == "FLAT") .Or. SetMdiChild()
			nTam *= 0.90
		EndIf
	EndIf

Return Int(nTam)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Static Function fDigSenha()
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	Private cSenha   := Space(10)
	Private cSenhAce := GETMV("MV_XGMD")
	@ 067,020 To 169,312 Dialog Senhadlg Title OemToAnsi("Libera��o de Acesso")
	@ 015,005 Say OemToAnsi("Informe a senha para o acesso ?") Size 80,8
	@ 015,089 Get cSenha Size 50,10 Password
	@ 037,106 BmpButton Type 1 Action fOK()
	@ 037,055 BmpButton Type 2 Action Close(Senhadlg)
	Activate Dialog Senhadlg CENTERED

Return(_lReturn)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Static Function fOK()
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	If ALLTRIM(cSenha)<> ALLTRIM(cSenhAce)
		MsgStop("Senha n�o Confere !!!")
		cSenha  := Space(10)
		dlgRefresh(Senhadlg)
	Else
		_lReturn  := .T.
		Close(Senhadlg)
	Endif

Return
