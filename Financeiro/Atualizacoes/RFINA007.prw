#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'FWMVCDEF.CH'
#INCLUDE 'RWMAKE.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE "TBICONN.CH"
#INCLUDE 'FWEDITPANEL.CH'

/*/{Protheus.doc} RFINA007

Rotina para lancamentos de despesas sobre
Borderos com operacoes de Fidic

@author Leandro Rodrigues
@since 24/03/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

User Function RFINA007()

	Local oBrw
	Private oTotalBor
	Private __NVEZ := 0

	oBrw:= fwmBrowse():New()

	oBrw:SetAlias("ZEE")
	oBrw:SetDescription("Lancamento Taxas Fidic")

	oBrw:AddLegend("ZEE_STATUS == '1'","GREEN"	,"Acerto Pendente")
	oBrw:AddLegend("ZEE_STATUS == '2'","RED"	,"Acerto Realizado")

	oBrw:Activate()

Return

//-----------------------------------------------------------------------
// Montagem do Menu
//-----------------------------------------------------------------------
Static Function MenuDef()

	Local aRotina := {}

	ADD OPTION aRotina TITLE 'Visualizar'      		ACTION 'VIEWDEF.RFINA007' OPERATION 2 ACCESS 0
	ADD OPTION aRotina TITLE 'Incluir'         		ACTION 'VIEWDEF.RFINA007' OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar'         		ACTION 'VIEWDEF.RFINA007' OPERATION 4 ACCESS 0
	//ADD OPTION aRotina Title "Excluir"    			Action "VIEWDEF.RFINA007" OPERATION 5 ACCESS 0
	ADD OPTION aRotina TITLE 'Excluir'         		ACTION 'U_RFIN07EX()'	  OPERATION 5 ACCESS 0
	ADD OPTION aRotina TITLE 'Acerto Financeiro'    ACTION 'U_RFIN07OK()'	  OPERATION 6 ACCESS 0
	ADD OPTION aRotina TITLE 'Estorno Acerto'	    ACTION 'U_RFIN07ES()'	  OPERATION 6 ACCESS 0
	ADD OPTION aRotina TITLE 'Exporta XML'		    ACTION 'U_RFINA008()'	  OPERATION 7 ACCESS 0

Return aRotina

//-----------------------------------------------------------------------
// Montagem do Model
//-----------------------------------------------------------------------
Static Function ModelDef()

	// Cria a estrutura a ser usada no Modelo de Dados
	Local oStruZEE  := FWFormStruct( 1, 'ZEE', /*bAvalCampo*/,/*lViewUsado*/ ) // Dados Bordero
	Local oStruZEF  := FWFormStruct( 1, 'ZEF', /*bAvalCampo*/,/*lViewUsado*/ ) // Despesas por Bordero
	Local oStruZEG  := FWFormStruct( 1, 'ZEG', /*bAvalCampo*/,/*lViewUsado*/ ) // Despesas por Titulo
	Local oStruZEI  := FWFormStruct( 1, 'ZEI', /*bAvalCampo*/,/*lViewUsado*/ ) // Titulo
	Local oModel

	// Cria o objeto do Modelo de Dados
	oModel := MPFormModel():New('RFINP007', /*bPreValidacao*/, /*bPosValidacao*/, /*bCommit*/, /*bCancel*/ )

	//Adiciona ao modelo uma estrutura de formul·rio de ediÁ?o por campo
	oModel:AddFields( 'ZEEMASTER', /*cOwner*/, oStruZEE, /*bPreValidacao*/, /*bPosValidacao*/, /*bCarga*/ )

	// Adiciona ao modelo uma componente de grid
	oModel:AddGrid( 'ZEFDETAIL', 'ZEEMASTER', oStruZEF , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	oModel:AddGrid( 'ZEIDETAIL', 'ZEEMASTER', oStruZEI , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
	oModel:AddGrid( 'ZEGDETAIL', 'ZEIDETAIL', oStruZEG , /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )

	// Faz relacionamento entre os componentes do model
	oModel:SetRelation( 'ZEFDETAIL', { {'ZEF_FILIAL' , 'xFilial( "ZEF" )'}, {'ZEF_CODIGO','ZEE_CODIGO'},{'ZEF_NUMBOR' ,'ZEE_NUMBOR'}}, ZEF->( IndexKey(1)))
	oModel:SetRelation( 'ZEIDETAIL', { {'ZEI_FILIAL' , 'xFilial( "ZEI" )'}, {'ZEI_CODIGO','ZEE_CODIGO'}}, ZEI->( IndexKey(1)))
	oModel:SetRelation( 'ZEGDETAIL', { {'ZEG_FILIAL' , 'xFilial( "ZEI" )'}, {'ZEG_CODIGO','ZEE_CODIGO'},{'ZEG_ITEM' ,'ZEI_ITEM'},{'ZEG_NUMBOR' ,'ZEE_NUMBOR'}}, ZEG->( IndexKey(1)))

	// Adiciona a chave primaria da tabela principal
	oModel:SetPrimaryKey({ "ZEE_FILIAL" , "ZEE_NUMBOR" })

	// Liga o controle de nao repeticao de linha
	oModel:GetModel( 'ZEFDETAIL' ):SetUniqueLine( {'ZEF_TAXA'} )

	// Adiciona a descrição dos Componentes do Modelo de Dados
	oModel:GetModel( 'ZEFDETAIL' ):SetDescription( 'Tarifas por Borderô' )
	oModel:GetModel( 'ZEGDETAIL' ):SetDescription( 'Tarifas por Titulos' )
	oModel:GetModel( 'ZEGDETAIL' ):SetUniqueLine( {'ZEG_TAXA'} )

	oModel:GetModel( 'ZEIDETAIL' ):SetNoUpdateLine( .T. )
	oModel:GetModel( 'ZEIDETAIL' ):SetNoInsertLine( .T. )

	//Permite gravar grid vazia
	oModel:GetModel( 'ZEFDETAIL' ):SetOptional( .T. )
	oModel:GetModel( 'ZEGDETAIL' ):SetOptional( .T. )
	//oModel:GetModel( 'ZEIDETAIL' ):SetOptional( .T. )

Return oModel

//-----------------------------------------------------------------------
// Montagem da View
//-----------------------------------------------------------------------
Static Function ViewDef()

	// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
	Local oModel   := FWLoadModel( 'RFINA007' )
	Local oView

	// Cria a estrutura a ser usada na View
	Local oStruZEE  := FWFormStruct( 2, 'ZEE' )
	Local oStruZEF  := FWFormStruct( 2, 'ZEF' )
	Local oStruZEG  := FWFormStruct( 2, 'ZEG' )
	Local oStruZEI  := FWFormStruct( 2, 'ZEI' )

	// Cria o objeto de View
	oView := FWFormView():New()

	// Define qual o Modelo de dados ser· utilizado
	oView:SetModel( oModel )

	//Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
	oView:AddField( 'VIEW_ZEE', oStruZEE, 'ZEEMASTER' )

	//Retira campos da estrutura
	oStruZEE:RemoveField('ZEE_USER')
	oStruZEE:RemoveField('ZEE_STATUS')

	//Adiciona no nosso View um controle do tipo Grid (antiga Getdados)
	oView:AddGrid( 'VIEW_ZEF', oStruZEF,  'ZEFDETAIL' )
	oView:AddGrid( 'VIEW_ZEG', oStruZEG,  'ZEGDETAIL' )
	oView:AddGrid( 'VIEW_ZEI', oStruZEI,  'ZEIDETAIL' )

	// Crio os OTHER OBJECT's
	oView:AddOtherObject('TOTAL'	, {|oPanel| CriaTotal(oPanel) } ) // Totalizadores

	// Cria um "box" horizontal para receber cada elemento da view
	oView:CreateHorizontalBox( 'SUPERIOR'	, 30 )
	oView:CreateHorizontalBox( 'CENTRO'		, 30 )
	oView:CreateHorizontalBox( 'BAIXO'		, 30 )
	oView:CreateHorizontalBox( 'RODAPE'		, 10 )

	//Cria um "box" vertical para receber cada elemento da view
	oView:CreateVerticalBox( 'BAIXOESQ', 50, 'BAIXO' )
	oView:CreateVerticalBox( 'BAIXODIR', 50, 'BAIXO' )

	// Relaciona o identificador (ID) da View com o "box" para exibição
	oView:SetOwnerView( 'VIEW_ZEE'  , 'SUPERIOR' )
	oView:SetOwnerView( 'VIEW_ZEF'  , 'CENTRO' 	 )
	oView:SetOwnerView( 'VIEW_ZEI'  , 'BAIXOESQ' )
	oView:SetOwnerView( 'VIEW_ZEG'  , 'BAIXODIR' )
	oView:SetOwnerView( 'TOTAL' 	, 'RODAPE'	 )

	// titulo dos componentes
	oView:EnableTitleView('VIEW_ZEE' ,"Borderô"				)
	oView:EnableTitleView('VIEW_ZEF' ,"Tarifas por Borderô"	)
	oView:EnableTitleView('VIEW_ZEG' ,"Tarifas por Título"	)
	oView:EnableTitleView('VIEW_ZEI' ,"Título no Borderô"	)
	oView:EnableTitleView('TOTAL'	 , "Total Tarifas"		)

	oView:SetCloseOnOk( { || .T. })  //Fecha a Tela ao confirmar

	//adiciona auto incremento no campo de sequencia
	oView:AddIncrementField( 'VIEW_ZEF', 'ZEF_SEQ'  )
	oView:AddIncrementField( 'VIEW_ZEG', 'ZEG_SEQ'  )
	oView:AddIncrementField( 'VIEW_ZEI', 'ZEI_ITEM' )

	//Forca quebra a cada 4 campos
	oView:SetViewProperty( "ZEEMASTER", "SETLAYOUT", { FF_LAYOUT_VERT_DESCR_TOP , 4 } )

	//Chamo funcao na validacao do campo
	oView:SetFieldAction( 'ZEE_NUMBOR', { |oView, cIDView, cField, xValue| U_BuscaBor(oView, cIDView, cField, xValue ) } )
	oView:SetFieldAction( 'ZEF_TARIFA', { |oView, cIDView, cField, xValue| U_RefreshAll(oView) } )
	oView:SetFieldAction( 'ZEF_VALOR',  { |oView, cIDView, cField, xValue| U_RefreshAll(oView ) } )

	oView:SetFieldAction( 'ZEG_VALOR',  { |oView, cIDView, cField, xValue| U_RefreshAll(oView ) } )

	oView:SetViewAction( 'DELETELINE', { |oView,cIdView,nNumLine| U_RefreshAll( oView ) } )

	oView:AddUserButton('Replicar Tarifas', "", {|oView| FWMsgRun(,{|oSay| U_RepTarifa( ) },'Aguarde...','Carregando as informações...') } )
	oView:AddUserButton('Legenda', "", {|oView| u_RFINA071L( )} )

	oView:SetAfterViewActivate({|oView| U_RefreshAll(oView) } )

	// Habilito a barra de progresso na abertura da tela
	oView:SetProgressBar(.T.)

Return oView

//--------------------------------------------------
//Cria Função para Atualizar totalizadores
//--------------------------------------------------
Static Function CriaTotal(oPanel)

	oTotalBor := DespesasFidic():New(oPanel)

Return()

//--------------------------------------------------
//Classe totalizadores da tela
//--------------------------------------------------
Class DespesasFidic

	Data oGetBord
	Data oGetTit
	Data oGetGeral
	Data nVlBorder
	Data nVlTitulo
	Data nVlTotal

	Method New() Constructor
	Method RefreshAll()

EndClass

//--------------------------------------------------
//Classe totalizadores da tela
//--------------------------------------------------
Method New(oPanel) Class DespesasFidic

	Local oSay1		:= NIL
	Local oSay2		:= NIL
	Local oSay3		:= NIL

	Local oFntSay  	:= TFont():New("Verdana",,13,,.T.,,,,,.F.,.F.)
	Local nColorSay	:= 8213760

	::nVlBorder	:= 0
	::nVlTitulo	:= 0
	::nVlTotal	:= 0

	@ 017, 005 SAY oSay1 PROMPT "Total Borderô:" SIZE 150, 010 OF oPanel FONT oFntSay COLORS nColorSay, 16777215 PIXEL
	@ 015, 055 MSGET ::oGetBord VAR ::nVlBorder SIZE 050, 010 OF oPanel Picture "@E 99,999.99" COLORS 0, 16777215 PIXEL WHEN .F.

	@ 017, 125 SAY oSay2 PROMPT "Total Títulos:" SIZE 150, 010 OF oPanel FONT oFntSay COLORS nColorSay, 16777215 PIXEL
	@ 015, 175 MSGET ::oGetTit VAR ::nVlTitulo SIZE 050, 010 OF oPanel Picture "@E 99,999.99" COLORS 0, 16777215 PIXEL WHEN .F.

	@ 017, 250 SAY oSay3 PROMPT "Total Geral:" SIZE 150, 010 OF oPanel FONT oFntSay COLORS nColorSay, 16777215 PIXEL
	@ 015, 300 MSGET ::oGetGeral VAR ::nVlTotal SIZE 050, 010 OF oPanel Picture "@E 99,999.99" COLORS 0, 16777215 PIXEL WHEN .F.

Return()

//--------------------------------------------------
//Classe totalizadores da tela
//--------------------------------------------------
User Function RefreshAll(oView)

	Local oModel  	:= FWModelActive()
	Local oModelZEI	:= oModel:GetModel('ZEIDETAIL')
	Local oModelZEF	:= oModel:GetModel('ZEFDETAIL')
	Local oModelZEG	:= oModel:GetModel('ZEGDETAIL')
	//Local nLinhaZEI	:= oModelZEI:GetLine()
	//Local nLinhaZEG	:= oModelZEG:GetLine()
	Local aSaveLines:= FWSaveRows()
	Local nX		:= 1
	Local nI		:= 1
	Local nTotBord	:= 0
	Local nOperation := oModel:GetOperation()

	oTotalBor:nVlBorder	:= 0
	oTotalBor:nVlTotal	:= 0
	oTotalBor:nVlTitulo := 0

	oModel:GetModel( 'ZEIDETAIL' ):SetNoUpdateLine( .F. )
	oModel:GetModel( 'ZEIDETAIL' ):SetNoInsertLine( .F. )

	//Atualizo total bordero
	For nX := 1 To oModelZEF:Length()
		if !oModelZEF:IsDeleted(nX)
			oTotalBor:nVlBorder	+= oModelZEF:GetValue("ZEF_VALOR",nX)
		Endif
	Next nX

	//Percorre todos os itens de titulos
	For nI:= 1 To oModelZEI:Length()

		oModelZEI:SetLine(nI)// Posiciona na linha
		nTotBord += oModelZEI:GetValue("ZEI_VALOR",nI)

		//Atualizo total titulos
		For nX := 1 To oModelZEG:Length()
			if !oModelZEG:IsDeleted(nX)
				oTotalBor:nVlTitulo	+= oModelZEG:GetValue("ZEG_VALOR",nX)
			Endif
		Next nX
	Next nI

	
	/*Gerou outro error log após corrigir validação de exclusão
	THREAD ERROR ([7911], caique.mercadante, TI-05)   01/12/2020 11:08:17
	erro no parâmetroFWFormFieldsModel: A operação (SetOperation) configurada não pode ser utilizada com este método on 
	FWFORMFIELDSMODEL:LOADVALUE(FWFORMFIELDSMODEL.PRX) 24/07/2020 17:50:50 line : 1381 

	Como paliativo contornei o problema, este campo é virtual ZEE_TOTBOR em MVC não deve atualizar valor em Operação 5 Exlusão e como ele não é armazenado em lugar algum não interfere para o Financeiro.
	Fonte só carrega a atualização do acmulador do ZEE_TOTBOR em tela depois de incluido registro.*/
	
	If nOperation <> 5
		//atualiza total titulos
		oModel:GetModel('ZEEMASTER'):LoadValue("ZEE_TOTBOR"	, nTotBord)
	EndIf
	//Atualizado total geral
	oTotalBor:nVlTotal := oTotalBor:nVlBorder + oTotalBor:nVlTitulo

	// atualizo os objetos dos get's
	oTotalBor:oGetBord:Refresh()
	oTotalBor:oGetTit:Refresh()
	oTotalBor:oGetGeral:Refresh()

	oModel:GetModel( 'ZEIDETAIL' ):SetNoUpdateLine( .T. )
	oModel:GetModel( 'ZEIDETAIL' ):SetNoInsertLine( .T. )

	FWRestRows( aSaveLines )

	if oView <> Nil
		oView:Refresh()
	endif

Return .T.


//--------------------------------------------------
//Carrega Titulos pertencentes ao bordero
//--------------------------------------------------
User Function BuscaBor(_oView, cIDView, cField, xValue,lSoValida)//U_BuscaBor(,,,M->ZEE_NUMBOR,.T.)

	Local oView		:= FWViewActive()
	Local oModel  	:= FWModelActive()
	Local oModelZEI	:= oModel:GetModel('ZEIDETAIL')
	Local cQrySE1	:= ""
	Local nLinha	:= 0
	Local lNewlinha := .F.
	Local nOperation := oModel:GetOperation()
	Local nValLiq	:= 0
	Local nDescont	:= 0
	Local nTotAbImp := 0
	Default lSoValida := .F.

	if empty(xValue)
		Return .F.
	endif

	DbSelectArea("ZEE")
	ZEE->(DbSetOrder(2))
	if ZEE->(DbSeek(xFilial("ZEE")+xValue)) .AND. nOperation == 3
		Help( ,, 'Atenção',, "Já existe Despesas lançadas para o Borderô informado !", 1, 0 )
		Return .F.
	Endif

	if oModelZEI:Length() > 1 .OR. !Empty(oModelZEI:GetValue("ZEI_NUM", 1))
		Help( ,, 'Atenção',, "Ja foi carregado um borderô! Ação não permitida.", 1, 0 )
		Return .F.
	endif

	if lSoValida
		Return .T.
	endif

	cQrySE1 := " SELECT 		"
	cQrySE1 += " 	E1_NUMBOR, 	"
	cQrySE1 += " 	E1_PREFIXO,	"
	cQrySE1 += " 	E1_NUM,		"
	cQrySE1 += " 	E1_PARCELA,	"
	cQrySE1 += " 	E1_CLIENTE,	"
	cQrySE1 += " 	E1_LOJA,	"
	cQrySE1 += " 	E1_NOMCLI,	"
	cQrySE1 += " 	E1_VALOR,	"
	cQrySE1 += " 	E1_DATABOR,	"
	cQrySE1 += " 	E1_FILORIG,	" //Filial Origem
	cQrySE1 += " 	R_E_C_N_O_ RECNO	"
	cQrySE1 += " FROM " + RETSQLNAME("SE1") + " E1"
	cQrySE1 += " WHERE E1.D_E_L_E_T_<> '*'"
	cQrySE1 += " 	AND SUBSTR(E1_FILIAL,1,2) = '" + SUBSTR(xFilial("SE1"),1,2) + "'"
	cQrySE1 += " 	AND E1_NUMBOR = '" + xValue + "'"

	cQrySE1 := ChangeQuery(cQrySE1)

	If Select("QSE1")>0
		QSE1->(DbCloseArea())
	Endif

	TcQuery cQrySE1 New Alias "QSE1"

	oModel:GetModel( 'ZEIDETAIL' ):SetNoUpdateLine( .F. )
	oModel:GetModel( 'ZEIDETAIL' ):SetNoInsertLine( .F. )

	//carrego a data do borderô
	if QSE1->(!EOF())
		oModel:GetModel('ZEEMASTER'):LoadValue("ZEE_DATA" , STOD(QSE1->E1_DATABOR) )
	endif

	While QSE1->(!EOF())

		SE1->(DbGoTo( QSE1->RECNO ))
		//nDescont := SomaAbat(SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,"R",SE1->E1_MOEDA,dDataBase,SE1->E1_CLIENTE,SE1->E1_LOJA)
		nDescont := SumAbatRec(SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_MOEDA,"S",dDataBase,@nTotAbImp)
		nDescont -= nTotAbImp

		nDescont += SE1->E1_DESCONT
		nValLiq := QSE1->E1_VALOR - nDescont

		nLinha	:= oModelZEI:Length()

		if nLinha == 1 .AND. Empty(oModelZEI:GetValue("ZEI_NUM", nLinha))
			lNewlinha := .F.
		Else
			lNewlinha := .T.
		Endif

		if lNewlinha
			oModelZEI:AddLine()
		Endif

		oModelZEI:LoadValue("ZEI_PREFIX"	,QSE1->E1_PREFIXO	)
		oModelZEI:LoadValue("ZEI_NUM"		,QSE1->E1_NUM	 	)
		oModelZEI:LoadValue("ZEI_PARCEL"	,QSE1->E1_PARCELA	)
		oModelZEI:LoadValue("ZEI_CLIENT"	,QSE1->E1_CLIENTE	)
		oModelZEI:LoadValue("ZEI_LOJA"		,QSE1->E1_LOJA		)
		oModelZEI:LoadValue("ZEI_NOMCLI"	,QSE1->E1_NOMCLI	)
		oModelZEI:LoadValue("ZEI_VALOR"		,nValLiq			)
		oModelZEI:LoadValue("ZEI_NUMBOR"	,xValue				)
		oModelZEI:LoadValue("ZEI_XFILOR"	,QSE1->E1_FILORIG	) //Caique
		

		oView:Refresh()

		QSE1->(DbSkip())
	Enddo

	oModelZEI:GoLine(1)

	oView:Refresh()

	oModel:GetModel( 'ZEIDETAIL' ):SetNoInsertLine( .T. )
	oModel:GetModel( 'ZEIDETAIL' ):SetNoUpdateLine( .T. )
Return .T.

//--------------------------------------------------
//Replica Tarifas para os titulos selecionados
//--------------------------------------------------
User Function RepTarifa()

	//Local oView		:= FWViewActive()
	Local oModel  	:= FWModelActive()
	Local oModelZEG	:= oModel:GetModel('ZEGDETAIL')
	Local oModelZEI	:= oModel:GetModel('ZEIDETAIL')
	Local cTaxa		:= oModelZEG:GetValue("ZEG_TAXA")
	Local cDescTaxa	:= Posicione("ZEH",1,xFilial("ZEH")+cTaxa,"ZEH_DESC")
	Local nValor	:= oModelZEG:GetValue("ZEG_VALOR")
	Local aItens  	:= {}
	Local nX		:= 1

	//Valida se tipo de taxa e valor foi informado
	If Empty(cTaxa) .OR. nValor <= 0
		Alert("Campo Taxa ou Valor Taxa não foi informado !")
		Return
	Endif

	While nX <= oModelZEI:Length()

		AADD(aItens,{	"LBNO",;
			oModelZEI:GetValue("ZEI_ITEM"	,nX),;
			oModelZEI:GetValue("ZEI_PREFIX"	,nX),;
			oModelZEI:GetValue("ZEI_NUM"	,nX),;
			oModelZEI:GetValue("ZEI_PARCEL"	,nX),;
			oModelZEI:GetValue("ZEI_NOMCLI"	,nX),;
			oModelZEI:GetValue("ZEI_XFILOR"	,nX),; //Caique
			nX,;
			.F.})

		nX++
	EndDo

	ReplicaTarifas(cTaxa,cDescTaxa,aItens,nValor)

Return

//-----------------------------------------------------------------------
// Funçao de replicar tarifas
//-----------------------------------------------------------------------
Static Function ReplicaTarifas(cTaxa,cDescTaxa,aTitulos,nValor)

	Local oButton1
	Local oButton2
	Local oTaxa, oValor
	Local oGroup1
	Local oGroup2
	Local oSay1
	Local oSay2
	Local lNewlinha	:= .F.
	Local lOk   	:= .F.
	Local nX		:= 1
	Local cCodTaxa 	:= cTaxa +" - "+cDescTaxa
	Local oView		:= FWViewActive()
	Local oModel  	:= FWModelActive()
	Local oModelZEG	:= oModel:GetModel('ZEGDETAIL')
	Local oModelZEI	:= oModel:GetModel('ZEIDETAIL')
	Local nLinhaZEI	:= oModelZEI:GetLine()
	Local nLinhaZEG	:= oModelZEG:GetLine()

	Static oDlg

	DEFINE MSDIALOG oDlg TITLE "Replicação de Tarifas" FROM 000, 000  TO 400, 600 PIXEL

	@ 010, 002 SAY oSay1 PROMPT "Taxa" 	SIZE 025, 007 OF oDlg PIXEL
	@ 009, 022 MSGET oTaxa VAR cCodTaxa When .F.	SIZE 175, 010 OF oDlg  PIXEL

	@ 010, 210 SAY oSay1 PROMPT "Valor" 		SIZE 025, 007 OF oDlg PIXEL
	@ 009, 232 MSGET oValor VAR nValor Picture "@E 99,999.99" When .F.	SIZE 050, 010 OF oDlg  PIXEL

	@ 034, 002 GROUP oGroup1 TO 176, 300 OF oDlg COLOR 0, 16777215 PIXEL

	oBrwTarifa := FwTarifa(aTitulos)

	@ 026, 002 SAY oSay2 PROMPT "Selecione os titulos" SIZE 093, 007 OF oDlg PIXEL

	@ 178, 002 GROUP oGroup2 TO 179, 300 OF oDlg  PIXEL

	@ 185, 216 BUTTON oButton1 PROMPT "Confirmar" SIZE 037, 012 Action (lOk:= .T.,oDlg:End()) OF oDlg PIXEL
	@ 185, 258 BUTTON oButton2 PROMPT "Cancelar"  SIZE 037, 012 Action oDlg:End() OF oDlg PIXEL

	ACTIVATE MSDIALOG oDlg CENTERED

	if lOk
		//Replica tarifas
		For nX:= 1 To Len(oBrwTarifa:aCols)
			if oBrwTarifa:aCols[nX,1] == "LBOK"

				oModelZEI:SetLine(oBrwTarifa:aCols[nX,7])// Posiciona na linha

				//Valida se e a mes linha pra nao duplicar lancamento
				if !oModelZEG:SeekLine({{"ZEG_TAXA",cTaxa}})

					If Empty(oModelZEG:GetValue("ZEG_TAXA"))
						lNewlinha := .F.
					Else
						lNewlinha := .T.
					Endif

					If lNewlinha
						oModelZEG:AddLine()
					Endif

					oModelZEG:LoadValue("ZEG_ITEM"		,oBrwTarifa:aCols[nX,2]	)
					oModelZEG:LoadValue("ZEG_TAXA"		,cTaxa					)
					oModelZEG:LoadValue("ZEG_DESC"		,cDescTaxa				)
					oModelZEG:LoadValue("ZEG_VALOR"		,nValor					)

					oView:Refresh()

				Endif
			Endif
		Next nX
		oModelZEI:Goline(nLinhaZEI)
		oModelZEG:Goline(nLinhaZEG)

		U_RefreshAll(oView) // Atualiza totalizadores
	Endif

Return

//-----------------------------------------------------------------------
// monta grid tarifas
//-----------------------------------------------------------------------
Static Function FwTarifa(aTitulos)

	Local nX
	Local aHeaderEx 	:= {}
	Local aColsEx 		:= iif(len(aTitulos)>0,aTitulos,{})
	Local aFieldFill 	:= {}
	Local aAlterFields 	:= {}
	Local aFields 		:= {"MARK","ZEI_ITEM","ZEI_PREFIX","ZEI_NUM","ZEI_PARCEL","ZEI_NOMCLI","RECLIN"}
	Local oBrwTar

	// Define field properties
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	For nX := 1 to Len(aFields)
		If aFields[nX] == 'MARK'
			Aadd(aHeaderEx,{Space(10),'MARK','@BMP',2,0,'','€€€€€€€€€€€€€€','C','','','',''})
		ElseIf SX3->(DbSeek(aFields[nX]))

			Aadd(aHeaderEx, {AllTrim(X3Titulo()),SX3->X3_CAMPO,SX3->X3_PICTURE,SX3->X3_TAMANHO,SX3->X3_DECIMAL,SX3->X3_VALID,;
				SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})
		Endif
	Next nX

	If Len(aTitulos) == 0

		// Define field values
		For nX := 1 to Len(aFields)
			If aFields[nX] == 'MARK'
				Aadd(aFieldFill, 'LBNO')
			Elseif aFields[nX] == 'RECLIN'
				Aadd(aFieldFill, 0)
			ElseIf DbSeek(aFields[nX])
				Aadd(aFieldFill, CriaVar(SX3->X3_CAMPO))
			Endif
		Next nX
		Aadd(aFieldFill, .F.)
		Aadd(aColsEx, aFieldFill)
	Else
		aColsEx := aTitulos
	Endif

	oBrwTar:= MsNewGetDados():New( 036, 004, 173, 298,GD_UPDATE, "AllwaysTrue", "AllwaysTrue", "+Field1+Field2", aAlterFields,, 999, "AllwaysTrue", "", "AllwaysTrue", oDlg, aHeaderEx, aColsEx)
	oBrwTar:oBrowse:bLDblClick   := {|| iif(oBrwTar:oBrowse:nColPos==aScan(oBrwTar:aHeader,{|x| AllTrim(x[2])!="MARK"}),oBrwTar:SELF:EDITCELL(),DbClique(oBrwTar))}
	oBrwTar:oBrowse:bHeaderClick := {|| MarcaTodos(oBrwTar)}

Return oBrwTar

//-----------------------------------------------------------------------
//Função chamada pelo duplo clique no grid
//-----------------------------------------------------------------------
Static Function DbClique(oObj,_nPos)

	If oObj:aCols[oObj:nAt][1] == "LBOK"
		oObj:aCols[oObj:nAt][1] := "LBNO"
	Else
		oObj:aCols[oObj:nAt][1] := "LBOK"
	Endif

	oObj:oBrowse:Refresh()

Return()

//-----------------------------------------------------------------------
// Funcao para inverter selecao da GRID
//-----------------------------------------------------------------------
Static Function MarcaTodos(_obj)

	Local nZ := 0

	If __NVEZ == 0
		For nZ := 1 TO Len(_obj:aCols)
			_obj:aCols[nZ][1] := iif(_obj:aCols[nZ][1] == "LBOK","LBNO","LBOK")
		Next nX
		__NVEZ++
	Else
		__NVEZ := 0
	EndIf
	_obj:oBrowse:Refresh()

Return()

//-----------------------------------------------------------------------
//Funcao para fazer operacoes financeiras das tarifas informadas
//-----------------------------------------------------------------------
User Function RFIN07OK()

	Local lOk := .T.

	if MsgYesNo("Confirma realizar o Acerto Financeiro?")

		BeginTran()

		FWMsgRun(,{|oSay| lOk := U_TarBordero(3) },'Aguarde...','Processando tarifas Bordero...')

		if lOk
			FWMsgRun(,{|oSay| lOk := U_TarTitulos(3) },'Aguarde...','Processando tarifas Titulos...')
		endif

		if lOk
			If Reclock("ZEE",.F.)
				ZEE->ZEE_STATUS:= '2'
				ZEE->(MsUnLock())
			Endif

			EndTran()
			MsgInfo("Processo Finalizado com Sucesso!")
		else
			DisarmTransaction()
			MsgAlert("Processo Não Finalizado! Houve erros durante o processamento!")
		endif

		DBUnlockAll()

	endif

Return

//-----------------------------------------------------------------------
// Incluir movimentacoes financeira de tarifas sobre bordero
// nOpc: 3=Incluir Movimentações; 5=Excluir Movimentações
//-----------------------------------------------------------------------
User Function TarBordero(nOpc)

	Local aMovBor	 	 := {}
	Local cQry			 := ""
	Local aCP			 := {}
	Local nCont			 := 0
	Local cNumTit		 := ""
	Local lOk			 := .T.
	Local lFin			 := .F.
	Private lMsErroAuto  := .F.
	PRIVATE lF100Auto    := .T.

	DbSelectArea("ZEF")
	ZEF->(DbSetOrder(2))

	DbSelectArea("ZEH")
	ZEH->(DbSetOrder(1))

	DbSelectArea("SE2")
	SE2->(DbSetOrder(1))

	DbSelectArea("SE5")
	SE5->(DbSetOrder(21)) //E5_FILIAL+E5_IDORIG+E5_TIPODOC

	//Tarifas por Bordero
	If ZEF->(DbSeek(xFilial("ZEF")+ZEE->ZEE_NUMBOR))

		//Busco dados do Beneficiario
		cQry:= " SELECT			"
		cQry +=" 	DISTINCT	"
		cQry +=" 	A6_COD,		"
		cQry +=" 	A6_NUMCON,	"
		cQry +=" 	A6_AGENCIA,	"
		cQry +=" 	A6_NOME  	"
		cQry +=" FROM " + RETSQLNAME("SE1") + " E1"
		cQry +=" INNER JOIN " + RETSQLNAME("SA6") +  " A6"
		cQry +=" 	ON A6_FILIAL 	= '" + xFilial("SA6")  + "' "
		cQry +=" 	AND A6_COD 		= E1_PORTADO"
		cQry +=" 	AND A6_AGENCIA 	= E1_AGEDEP"
		cQry +=" 	AND A6_NUMCON	= E1_CONTA"
		cQry +=" 	AND A6.D_E_L_E_T_<> '*'"
		cQry +=" WHERE E1.D_E_L_E_T_<> '*'"
		//cQry +=" 	AND E1_FILIAL = '" + xFilial("SE1")  + "'" // comentado pra que seja possivel efetuar o processo em qualquer filial. Só funcionará se a tabela SEA estiver compartilhada.
		cQry +=" 	AND E1_NUMBOR = '" + ZEE->ZEE_NUMBOR + "'"

		cQry := ChangeQuery(cQry)
		 MemoWrite("C:\FINA007.sql",cQry)
		 
		if Select("QSA6")>0
			QSA6->(DbCloseArea())
		Endif

		TcQuery cQry New Alias "QSA6"

		While ZEF->(!EOF()) .AND. xFilial("ZEF")+ZEF->ZEF_NUMBOR == ZEE->ZEE_FILIAL+ZEE->ZEE_NUMBOR

			if (nOpc == 5 .AND. ZEF->ZEF_STATUS <> '0') .OR. (nOpc == 3 .AND. Empty(ZEF->ZEF_NUM) .AND. Empty(ZEF->ZEF_IDMOV)) //Verifica se ja foi gerado acerto

				//Verifica tipo de Tarifa
				If ZEH->(DbSeek(xFilial("ZEH")+ZEF->ZEF_TAXA))

					If 	ZEH->ZEH_OPERAR == '2'  .AND. QSA6->(!EOF()) //Movimento Bancario

						lMsErroAuto:= .F.

						if nOpc == 3

							aMovBor := {{"E5_FILIAL"	,xFilial("SE5")				  ,Nil},;
										{"E5_DATA"      ,ZEE->ZEE_DTMOV			      ,Nil},;
										{"E5_MOEDA"     ,"M1"                         ,Nil},;
										{"E5_VALOR"     ,ZEF->ZEF_VALOR               ,Nil},;
										{"E5_NATUREZ"   ,ZEH->ZEH_NATURE       	      ,Nil},;
										{"E5_BANCO"     ,QSA6->A6_COD                 ,Nil},;
										{"E5_AGENCIA"   ,QSA6->A6_AGENCIA             ,Nil},;
										{"E5_CONTA"     ,QSA6->A6_NUMCON              ,Nil},;
										{"E5_BENEF"     ,QSA6->A6_NOME			   	  ,Nil},;
										{"E5_CCD"	    ,ZEH->ZEH_CCD			   	  ,Nil},;
										{"E5_HISTOR"    ,ZEH->ZEH_DESC + ZEE->ZEE_NUMBOR         ,Nil}}
										//{"E5_HISTOR"    ,"DESAGIO FIDC BORDERO"+ ZEE->ZEE_NUMBOR         ,Nil}}

						else //exclusao
							SE5->(DbSetOrder(21)) //E5_FILIAL+E5_IDORIG+E5_TIPODOC
							if SE5->(DbSeek(xFilial("SE5")+ZEF->ZEF_IDMOV))
								if SE5->E5_BANCO == QSA6->A6_COD .AND. SE5->E5_AGENCIA == QSA6->A6_AGENCIA .AND. SE5->E5_CONTA == QSA6->A6_NUMCON .AND. SE5->E5_MOEDA == "M1"
									if empty(SE5->E5_RECONC)
										aMovBor := {{"E5_FILIAL"	,SE5->E5_FILIAL		,Nil},;
													{"E5_DATA"      ,SE5->E5_DATA		,Nil},;
													{"E5_MOEDA"     ,SE5->E5_MOEDA      ,Nil},;
													{"E5_VALOR"     ,SE5->E5_VALOR      ,Nil},;
													{"E5_NATUREZ"   ,SE5->E5_NATUREZ    ,Nil},;
													{"E5_BANCO"     ,SE5->E5_BANCO      ,Nil},;
													{"E5_AGENCIA"   ,SE5->E5_AGENCIA    ,Nil},;
													{"E5_CONTA"     ,SE5->E5_CONTA      ,Nil},;
													{"E5_BENEF"     ,SE5->E5_BENEF		,Nil},;
													{"E5_CCD"	    ,SE5->E5_CCD		,Nil},;
													{"E5_HISTOR"    ,SE5->E5_HISTOR     ,Nil},;
													{"E5_TIPOLAN" 	,SE5->E5_TIPOLAN 	,Nil} }
										nOpc := 6
									else
										MsgInfo("Movimento de taxa ja conciliado. Operação não permitida! Chave Movimento (Filial+Id.Mov): " + xFilial("SE5")+ZEF->ZEF_IDMOV )
										lOk := .F.
										EXIT
									endif
								else
									MsgInfo("Não foi possível localizar movimento da taxa para estornar." )
									lOk := .F.
									EXIT
								endif
							else
								MsgInfo("Não foi possível localizar movimento da taxa para estornar. Chave Movimento (Filial+Id.Mov): " + xFilial("SE5")+ZEF->ZEF_IDMOV )
								lOk := .F.
								EXIT
							endif
						endif

						MSExecAuto({|x,y,z| FinA100(x,y,z)},0,aMovBor, nOpc)

						If lMsErroAuto
							MostraErro()
							lOk := .F.
							EXIT
						Else
							lFin := .T.
							if nOpc == 6
								nOpc := 5
							endif

							If Reclock("ZEF",.F.)
								if nOpc == 3
									ZEF->ZEF_IDMOV := SE5->E5_IDORIG
									ZEF->ZEF_STATUS:= '2'
								else //exclusao
									ZEF->ZEF_IDMOV := ""
									ZEF->ZEF_STATUS:= '0'
								endif
								ZEF->(MsUnLock())
							Endif
						EndIf

					Elseif ZEH->ZEH_OPERAR == '1' // Contas a Pagar

						lMsErroAuto	:= .F.
						cParcela	:= Space(TamSx3("E2_PARCELA")[1])

						if nOpc == 3
							nCont++

							//Verifica se numero ja foi usado
							While .T.
								cNumTit:= STRZERO(Val(ZEE->ZEE_NUMBOR+cValToChar(nCont)) ,TamSx3("E2_NUM")[1],0)
								if SE2->(DbSeek(xFilial("SE2")+ZEH->ZEH_PREFIX+cNumTit+cParcela+ZEH->ZEH_TIPO+ZEE->ZEE_FORNEC+ZEE->ZEE_LOJA))
									nCont++
								Else
									EXIT
								Endif
							Enddo

							aCP := {{ "E2_PREFIXO"  , ZEH->ZEH_PREFIX            									, NIL },;   		// Prefixo
									{ "E2_NUM"      , cNumTit														, NIL },;  	 		// Numero do Titulo
									{ "E2_TIPO"     , ZEH->ZEH_TIPO					              					, NIL },;   		// Tipo
									{ "E2_NATUREZ"  , ZEH->ZEH_NATURE				    							, NIL },;   	  	// Natureza
									{ "E2_FORNECE"  , ZEE->ZEE_FORNEC												, NIL },; 		  	// Cod. Cliente
									{ "E2_LOJA   "  , ZEE->ZEE_LOJA													, NIL },; 	  		// Loja. Cliente
									{ "E2_EMISSAO"  , dDataBase														, NIL },; 			// Data de emissao
									{ "E2_VENCTO"   , DaySum( dDataBase , ZEE->ZEE_DIAVEN )							, NIL },; 			// Data Vencimento
									{ "E2_VALOR"    , ZEF->ZEF_VALOR												, NIL },;	  		// Valor do Titulo
									{ "E2_CCD "	 	, ZEH->ZEH_CCD													, NIL }}	  	  	// Centro de Custo Debito

						else //exclusao

							//posicionar no titulo
							SE2->(DbSetOrder(1))
							if SE2->(DbSeek(xFilial("SE2")+ZEF->ZEF_PREFIX+ZEF->ZEF_NUM+cParcela+ZEF->ZEF_TIPO+ZEF->ZEF_FORNEC+ZEF->ZEF_LOJA))
								if empty(SE2->E2_BAIXA)
									aCP := {{ "E2_FILIAL"   , SE2->E2_FILIAL            									, NIL },;   		// Filial
											{ "E2_PREFIXO"  , SE2->E2_PREFIXO            									, NIL },;   		// Prefixo
											{ "E2_NUM"      , SE2->E2_NUM													, NIL },;  	 		// Numero do Titulo
											{ "E2_TIPO"     , SE2->E2_TIPO					              					, NIL },;   		// Tipo
											{ "E2_FORNECE"  , SE2->E2_FORNECE												, NIL },; 		  	// Cod. Cliente
											{ "E2_LOJA   "  , SE2->E2_LOJA													, NIL }} 	  		// Loja. Cliente
								else
									MsgInfo("Titulo de taxa ja baixado. Operação não permitida! Chave Titulo: " + xFilial("SE2")+ZEG->ZEG_PREFIX+ZEG->ZEG_NUM+cParcela+ZEG->ZEG_TIPO+ZEG->ZEG_FORNEC+ZEG->ZEG_LOJA )
									lOk := .F.
									EXIT
								endif
							Else
								MsgInfo("Não foi possível localizar titulo a pagar da taxa para estornar. Chave Titulo: " + xFilial("SE2")+ZEF->ZEF_PREFIX+ZEF->ZEF_NUM+cParcela+ZEF->ZEF_TIPO+ZEF->ZEF_FORNEC+ZEF->ZEF_LOJA )
								lOk := .F.
								EXIT
							Endif

						endif

						MsExecAuto({|x,y,z| FINA050(x,y,z)}, aCP,, nOpc)

						If lMsErroAuto
							MostraErro()
							lOk := .F.
							EXIT
						Else
							lFin := .T.

							//Atualiza informacoes com numero do titulo
							If Reclock("ZEF",.F.)

								if nOpc == 3
									ZEF->ZEF_NUM 	:= SE2->E2_NUM
									ZEF->ZEF_NATURE := SE2->E2_NATUREZ
									ZEF->ZEF_PREFIX	:= SE2->E2_PREFIXO
									ZEF->ZEF_TIPO	:= SE2->E2_TIPO
									ZEF->ZEF_FORNEC := SE2->E2_FORNECE
									ZEF->ZEF_LOJA   := SE2->E2_LOJA
									ZEF->ZEF_STATUS:= '1'
								else //exclusao
									ZEF->ZEF_NUM 	:= ""
									ZEF->ZEF_NATURE := ""
									ZEF->ZEF_PREFIX	:= ""
									ZEF->ZEF_TIPO	:= ""
									ZEF->ZEF_FORNEC := ""
									ZEF->ZEF_LOJA   := ""
									ZEF->ZEF_STATUS:= '0'
								endif

								ZEF->(MsUnLock())
							Endif
						Endif
					Endif
				Endif
			Endif
			ZEF->(DbSkip())
		EndDo

	Endif

Return lOk

//-----------------------------------------------------------------------
//Incluir movimentacoes financeira de tarifas sobre bordero
// nOpc: 3=Incluir Movimentações; 5=Excluir Movimentações
//-----------------------------------------------------------------------
User Function TarTitulos(nOpc)

	Local aMovTit	 	 := {}
	Local cQry			 := ""
	Local aCP			 := {}
	Local nCont			 := 0
	Local cNumTit		 := ""
	Local lOk			 := .T.
	Local aValTaxa		 := {} //{tipo,valor,lSE2,aRecnos}
	Local aSE5Estor		 := {}
	Local aSE2Estor		 := {}
	Local nPosAux		 := 0
	Local nX, nY
	Private lMsErroAuto  := .F.
	PRIVATE lF100Auto    := .T.

	DbSelectArea("ZEG")
	ZEG->(DbSetOrder(2))

	DbSelectArea("ZEH")
	ZEH->(DbSetOrder(1))

	DbSelectArea("SE2")
	SE2->(DbSetOrder(1))

	DbSelectArea("SE5")
	SE5->(DbSetOrder(21)) //E5_FILIAL+E5_IDORIG+E5_TIPODOC

	//Tarifas por Titulo
	If ZEG->(DbSeek(xFilial("ZEG")+ZEE->ZEE_NUMBOR))

		//Busco dados do Beneficiario
		cQry:= " SELECT			"
		cQry +=" 	DISTINCT	"
		cQry +=" 	A6_COD,		"
		cQry +=" 	A6_NUMCON,	"
		cQry +=" 	A6_AGENCIA,	"
		cQry +=" 	A6_NOME  	"
		cQry +=" FROM " + RETSQLNAME("SE1") + " E1"
		cQry +=" INNER JOIN " + RETSQLNAME("SA6") +  " A6"
		cQry +=" 	ON A6_FILIAL 	= '"+xFilial("SA6")+"' "
		cQry +=" 	AND A6_COD 		= E1_PORTADO"
		cQry +=" 	AND A6_AGENCIA 	= E1_AGEDEP"
		cQry +=" 	AND A6_NUMCON	= E1_CONTA"
		cQry +=" 	AND A6.D_E_L_E_T_<> '*'"
		cQry +=" WHERE E1.D_E_L_E_T_<> '*'"
		cQry +=" 	AND E1_FILIAL = '" + xFilial("SE1")  + "'"
		cQry +=" 	AND E1_NUMBOR = '" + ZEE->ZEE_NUMBOR + "'"

		cQry := ChangeQuery(cQry)

		if Select("QSA6")>0
			QSA6->(DbCloseArea())
		Endif

		TcQuery cQry New Alias "QSA6"

		While ZEG->(!EOF()) .AND. xFilial("ZEG")+ZEG->ZEG_NUMBOR == ZEE->ZEE_FILIAL+ZEE->ZEE_NUMBOR

			If (nOpc == 5 .AND. ZEG->ZEG_STATUS <> '0') .OR. (nOpc == 3 .AND. Empty(ZEG->ZEG_NUM) .AND. Empty(ZEG->ZEG_IDMOV)) //Verifica se ja foi gerado acerto

				//Verifica tipo de Tarifa
				If ZEH->(DbSeek(xFilial("ZEH")+ZEG->ZEG_TAXA))

					If 	ZEH->ZEH_OPERAR == '2' .AND. QSA6->(!EOF()) //Movimento Bancario

						if nOpc == 3

							if (nPosAux := aScan(aValTaxa,{|x| x[1] == ZEG->ZEG_TAXA})) > 0
								aValTaxa[nPosAux][2][4][2] += ZEG->ZEG_VALOR
								aadd(aValTaxa[nPosAux][4], ZEG->(Recno()))
							else
								aMovTit := {{"E5_FILIAL"	,xFilial("SE5")				  ,Nil},;
											{"E5_DATA"      ,ZEE->ZEE_DTMOV		          ,Nil},;
											{"E5_MOEDA"     ,"M1"                         ,Nil},;
											{"E5_VALOR"     ,ZEG->ZEG_VALOR               ,Nil},;
											{"E5_NATUREZ"   ,ZEH->ZEH_NATURE       	      ,Nil},;
											{"E5_BANCO"     ,QSA6->A6_COD                 ,Nil},;
											{"E5_AGENCIA"   ,QSA6->A6_AGENCIA             ,Nil},;
											{"E5_CONTA"     ,QSA6->A6_NUMCON              ,Nil},;
											{"E5_BENEF"     ,QSA6->A6_NOME			   	  ,Nil},;
											{"E5_CCD"	    ,ZEH->ZEH_CCD			   	  ,Nil},;
											{"E5_HISTOR"    ,"DESAGIO FIDC BORDERO "+ ZEE->ZEE_NUMBOR         ,Nil}}

								aadd(aValTaxa, {ZEG->ZEG_TAXA, aClone(aMovTit), .F., {ZEG->(Recno())} })
							endif

						else
							if aScan(aSE5Estor, xFilial("SE5")+ZEG->ZEG_IDMOV ) == 0
								SE5->(DbSetOrder(21)) //E5_FILIAL+E5_IDORIG+E5_TIPODOC
								if SE5->(DbSeek(xFilial("SE5")+ZEG->ZEG_IDMOV))
									if SE5->E5_BANCO == QSA6->A6_COD .AND. SE5->E5_AGENCIA == QSA6->A6_AGENCIA .AND. SE5->E5_CONTA == QSA6->A6_NUMCON .AND. SE5->E5_MOEDA == "M1"
										if empty(SE5->E5_RECONC)

											lMsErroAuto	:= .F.

											aMovTit := {{"E5_FILIAL"	,SE5->E5_FILIAL		,Nil},;
														{"E5_DATA"      ,SE5->E5_DATA		,Nil},;
														{"E5_MOEDA"     ,SE5->E5_MOEDA      ,Nil},;
														{"E5_VALOR"     ,SE5->E5_VALOR      ,Nil},;
														{"E5_NATUREZ"   ,SE5->E5_NATUREZ    ,Nil},;
														{"E5_BANCO"     ,SE5->E5_BANCO      ,Nil},;
														{"E5_AGENCIA"   ,SE5->E5_AGENCIA    ,Nil},;
														{"E5_CONTA"     ,SE5->E5_CONTA      ,Nil},;
														{"E5_BENEF"     ,SE5->E5_BENEF		,Nil},;
														{"E5_CCD"	    ,SE5->E5_CCD		,Nil},;
														{"E5_HISTOR"    ,SE5->E5_HISTOR     ,Nil},;
														{"E5_TIPOLAN" 	,SE5->E5_TIPOLAN 	,Nil} }

											MSExecAuto({|x,y,z| FinA100(x,y,z)},0,aMovTit,6)

											If lMsErroAuto
												MostraErro()
												lOk := .F.
												EXIT
											Else
												aadd(aSE5Estor, xFilial("SE5")+ZEG->ZEG_IDMOV )

												If Reclock("ZEG",.F.)
													ZEG->ZEG_IDMOV := ""
													ZEG->ZEG_STATUS:= '0'
													ZEG->(MsUnLock())
												Endif
											EndIf

										else
											MsgInfo("Movimento de taxa ja conciliado. Operação não permitida! Chave Movimento (Filial+Id.Mov): " + xFilial("SE5")+ZEG->ZEG_IDMOV )
											lOk := .F.
											EXIT
										endif
									else
										MsgInfo("Não foi possível localizar movimento da taxa para estornar.")
										lOk := .F.
										EXIT
									endif
								else
									MsgInfo("Não foi possível localizar movimento da taxa para estornar. Chave Movimento (Filial+Id.Mov): " + xFilial("SE5")+ZEG->ZEG_IDMOV )
									lOk := .F.
									EXIT
								endif
							else
								If Reclock("ZEG",.F.)
									ZEG->ZEG_IDMOV := ""
									ZEG->ZEG_STATUS:= '0'
									ZEG->(MsUnLock())
								Endif
							endif
						endif

					Elseif ZEH->ZEH_OPERAR == '1' // Contas a Pagar

						cParcela	:= Space(TamSx3("E2_PARCELA")[1])

						if nOpc == 3

							if (nPosAux := aScan(aValTaxa,{|x| x[1] == ZEG->ZEG_TAXA})) > 0
								aValTaxa[nPosAux][2][9][2] += ZEG->ZEG_VALOR
								aadd(aValTaxa[nPosAux][4], ZEG->(Recno()))
							else
								nCont++

								//Verifica se numero ja foi usado
								While .T.
									cNumTit:= STRZERO(Val(ZEE->ZEE_NUMBOR+cValToChar(nCont)) ,TamSx3("E2_NUM")[1],0)
									if SE2->(DbSeek(xFilial("SE2")+ZEH->ZEH_PREFIX+cNumTit+cParcela+ZEH->ZEH_TIPO+ZEE->ZEE_FORNEC+ZEE->ZEE_LOJA))
										nCont++
									Else
										EXIT
									Endif
								Enddo

								aCP := {{ "E2_PREFIXO"  , ZEH->ZEH_PREFIX            				, NIL },; // Prefixo
										{ "E2_NUM"      , cNumTit									, NIL },; // Numero do Titulo
										{ "E2_TIPO"     , ZEH->ZEH_TIPO					            , NIL },; // Tipo
										{ "E2_NATUREZ"  , ZEH->ZEH_NATURE				    		, NIL },; // Natureza
										{ "E2_FORNECE"  , ZEE->ZEE_FORNEC							, NIL },; // Cod. Cliente
										{ "E2_LOJA   "  , ZEE->ZEE_LOJA								, NIL },; // Loja. Cliente
										{ "E2_EMISSAO"  , dDataBase									, NIL },; // Data de emissao
										{ "E2_VENCTO"   , DaySum( dDataBase , ZEE->ZEE_DIAVEN )		, NIL },; // Data Vencimento
										{ "E2_VALOR"    , ZEG->ZEG_VALOR							, NIL },; // Valor do Titulo
										{ "E2_CCD "	 	, ZEH->ZEH_CCD								, NIL }} // Centro de Custo Debito

								aadd(aValTaxa, {ZEG->ZEG_TAXA, aClone(aCP), .T., {ZEG->(Recno())} })
							endif

						else

							if aScan(aSE2Estor, xFilial("SE2")+ZEG->ZEG_PREFIX+ZEG->ZEG_NUM+cParcela+ZEG->ZEG_TIPO+ZEG->ZEG_FORNEC+ZEG->ZEG_LOJA ) == 0
								//posicionar no titulo
								SE2->(DbSetOrder(1))
								if SE2->(DbSeek(xFilial("SE2")+ZEG->ZEG_PREFIX+ZEG->ZEG_NUM+cParcela+ZEG->ZEG_TIPO+ZEG->ZEG_FORNEC+ZEG->ZEG_LOJA))
									if empty(SE2->E2_BAIXA)

										lMsErroAuto := .F.

										aCP := {{ "E2_FILIAL"   , SE2->E2_FILIAL            									, NIL },;   		// Filial
												{ "E2_PREFIXO"  , SE2->E2_PREFIXO            									, NIL },;   		// Prefixo
												{ "E2_NUM"      , SE2->E2_NUM													, NIL },;  	 		// Numero do Titulo
												{ "E2_TIPO"     , SE2->E2_TIPO					              					, NIL },;   		// Tipo
												{ "E2_FORNECE"  , SE2->E2_FORNECE												, NIL },; 		  	// Cod. Cliente
												{ "E2_LOJA   "  , SE2->E2_LOJA													, NIL }} 	  		// Loja. Cliente

										MsExecAuto({|x,y,z|FINA050(x,y,z)},aCP,, 5)

										If lMsErroAuto
											MostraErro()
											lOk := .F.
											EXIT
										Else
											aadd(aSE2Estor, xFilial("SE2")+ZEG->ZEG_PREFIX+ZEG->ZEG_NUM+cParcela+ZEG->ZEG_TIPO+ZEG->ZEG_FORNEC+ZEG->ZEG_LOJA )

											//Atualiza informacoes com numero do titulo
											If Reclock("ZEG",.F.)
												ZEG->ZEG_NUM 	:= ""
												ZEG->ZEG_NATURE := ""
												ZEG->ZEG_PREFIX	:= ""
												ZEG->ZEG_TIPO	:= ""
												ZEG->ZEG_FORNEC := ""
												ZEG->ZEG_LOJA   := ""
												ZEG->ZEG_STATUS := '0'
												ZEG->(MsUnLock())
											Endif
										Endif
									else
										MsgInfo("Titulo de taxa ja baixado. Operação não permitida! Chave Titulo: " + xFilial("SE2")+ZEG->ZEG_PREFIX+ZEG->ZEG_NUM+cParcela+ZEG->ZEG_TIPO+ZEG->ZEG_FORNEC+ZEG->ZEG_LOJA )
										lOk := .F.
										EXIT
									endif
								Else
									MsgInfo("Não foi possível localizar titulo a pagar da taxa para estornar. Chave Titulo: " + xFilial("SE2")+ZEG->ZEG_PREFIX+ZEG->ZEG_NUM+cParcela+ZEG->ZEG_TIPO+ZEG->ZEG_FORNEC+ZEG->ZEG_LOJA )
									lOk := .F.
									EXIT
								Endif
							else
								//Atualiza informacoes com numero do titulo
								If Reclock("ZEG",.F.)
									ZEG->ZEG_NUM 	:= ""
									ZEG->ZEG_NATURE := ""
									ZEG->ZEG_PREFIX	:= ""
									ZEG->ZEG_TIPO	:= ""
									ZEG->ZEG_FORNEC := ""
									ZEG->ZEG_LOJA   := ""
									ZEG->ZEG_STATUS := '0'
									ZEG->(MsUnLock())
								Endif
							endif
						endif

					Endif
				Endif
			Endif

			ZEG->(DbSkip())
		EndDo

		//Gravo aglutinado
		For nX := 1 to len(aValTaxa) //{ZEG->ZEG_TAXA, aDadosAuto, lSE2, aRecnos}

			if aValTaxa[nX][3] //se é SE2

				lMsErroAuto:= .F.
				MsExecAuto({|x,y,z|FINA050(x,y,z)}, aValTaxa[nX][2] ,, 3)

				If lMsErroAuto
					MostraErro()
					lOk := .F.
					EXIT
				Else
					For nY := 1 to len(aValTaxa[nX][4])
						ZEG->(DbGoTo(aValTaxa[nX][4][nY]))
						//Atualiza informacoes com numero do titulo
						If Reclock("ZEG",.F.)
							ZEG->ZEG_NUM 	:= SE2->E2_NUM
							ZEG->ZEG_NATURE := SE2->E2_NATUREZ
							ZEG->ZEG_PREFIX	:= SE2->E2_PREFIXO
							ZEG->ZEG_TIPO	:= SE2->E2_TIPO
							ZEG->ZEG_FORNEC := SE2->E2_FORNECE
							ZEG->ZEG_LOJA   := SE2->E2_LOJA
							ZEG->ZEG_STATUS := '1'
							ZEG->(MsUnLock())
						Endif
					next nY
				Endif

			else //é SE5

				lMsErroAuto:= .F.
				MSExecAuto({|x,y,z| FinA100(x,y,z)},0, aValTaxa[nX][2], 3)

				If lMsErroAuto
					MostraErro()
					lOk := .F.
					EXIT
				Else
					For nY := 1 to len(aValTaxa[nX][4])
						ZEG->(DbGoTo(aValTaxa[nX][4][nY]))
						If Reclock("ZEG",.F.)
							ZEG->ZEG_IDMOV := SE5->E5_IDORIG
							ZEG->ZEG_STATUS:= '2'
							ZEG->(MsUnLock())
						Endif
					next nY
				EndIf

			endif
		next nX

	Endif

Return lOk

//-----------------------------------------------------------------------
//Função legenda
//-----------------------------------------------------------------------
User Function RFINA071L()

	BrwLegenda("Legenda","Legenda",{{"BR_BRANCO","Não finalizado"},{"BR_AZUL","Contas a Pagar"},{"BR_AMARELO","Movimento Bancario"}})

Return

//-----------------------------------------------------------------------
// Cor Legenda
//-----------------------------------------------------------------------
User Function CorLengda(nOpc)

	Local cCor := 'BR_BRANCO'

	If nOpc == 1

		If INCLUI
			cCor := 'BR_BRANCO'
		Elseif ZEF->ZEF_STATUS == '0' // Nao gerou nada ainda
			cCor := 'BR_BRANCO'
		Elseif ZEF->ZEF_STATUS == '1' // Gerou contas a pagar
			cCor := 'BR_AZUL'
		Elseif ZEF->ZEF_STATUS == '2' // Movimento Bancario
			cCor := 'BR_AMARELO'
		Endif
	Else

		If INCLUI
			cCor := 'BR_BRANCO'
		Elseif ZEG->ZEG_STATUS == '0' // Nao gerou nada ainda
			cCor := 'BR_BRANCO'
		Elseif ZEG->ZEG_STATUS == '1' // Gerou contas a pagar
			cCor := 'BR_AZUL'
		Elseif ZEG->ZEG_STATUS == '2' // Movimento Bancario
			cCor := 'BR_AMARELO'
		Endif
	Endif

Return cCor

//--------------------------------------------------
//Valida se pode ser excluida
//--------------------------------------------------
User Function RFIN07EX()//+

	Local lRet := .T.
	//Local cNumBor	:= ZEE->ZEE_NUMBOR
	//Local cFilials  := ZEE->ZEE_FILIAL
	
	// Gerava error log DBDelete - Lock required on U_RFIN07EX(RFINA007.PRW) 07/05/2020 18:38:12 line : 1283 por não estar completo validação do botão exclusão
	//msginfo(cNumBor + cFilials + ZEE->ZEE_STATUS)
	//If ZEE->ZEE_STATUS == '2' // Acerto Reazalido
		//Help( ,, 'Atenção',, 'Lançamento com acerto ja realizado não pode ser excluido ', 1, 0 )
		//lRet := .F.
	//Else

	If !(ZEE->ZEE_STATUS $ "2")
		lOk := ( FWExecView('Validação de Exclusão','RFINA007', MODEL_OPERATION_DELETE,, ,  ) == 0 )
	Else
		ALERT(	"Lançamento com acerto ja realizado não pode ser excluido!")
		lRet := .F.
	EndIf	
	
Return

//-------------------------------------------------------
// Valida se pode ser estornado o acerto, e faz o acerto
//-------------------------------------------------------
User Function RFIN07ES()

	Local lOk := .T.

	if MsgYesNo("Confirma realizar o ESTORNO do Acerto Financeiro?")

		BeginTran()

		FWMsgRun(,{|oSay| lOk := U_TarBordero(5) },'Aguarde...','Processando tarifas Bordero...')

		if lOk
			FWMsgRun(,{|oSay| lOk := U_TarTitulos(5) },'Aguarde...','Processando tarifas Titulos...')
		endif

		if lOk
			If Reclock("ZEE",.F.)
				ZEE->ZEE_STATUS:= '1'
				ZEE->(MsUnLock())
			Endif

			EndTran()
			MsgInfo("Processo Finalizado com Sucesso!")
		else
			DisarmTransaction()
		endif

		DBUnlockAll()

	endif

Return

//gatilho antigo: Round((M->ZEF_TARIFA/100) * FwFldGet("ZEE_TOTBOR"),2)
//gatilho novo: U_RFIN07DE(M->ZEF_TARIFA)
//-------------------------------------------------------
// Calcula o Desagio para tarifas
//-------------------------------------------------------
User Function RFIN07DE(nTarifa)

	Local nRet		:= 0
	Local nValLiq	:= 0
	Local nDescont	:= 0
	Local nTotAbImp	:= 0
	Local nDiasVenc	:= 0
	Local nValXVenc := 0
	Local nMediaDias := 0
	Local cQrySE1	:= ""

	if nTarifa > 0
		cQrySE1 := " SELECT R_E_C_N_O_ RECNO "
		cQrySE1 += " FROM " + RETSQLNAME("SE1") + " E1"
		cQrySE1 += " WHERE E1.D_E_L_E_T_<> '*'"
		cQrySE1 += " 	AND E1_FILIAL = '" + xFilial("SE1") + "'"
		cQrySE1 += " 	AND E1_NUMBOR = '" + FwFldGet("ZEE_NUMBOR") + "'"

		cQrySE1 := ChangeQuery(cQrySE1)

		If Select("QSE1")>0
			QSE1->(DbCloseArea())
		Endif

		TcQuery cQrySE1 New Alias "QSE1"

		While QSE1->(!EOF())

			SE1->(DbGoTo( QSE1->RECNO ))

			//somando valor liquido
			//nDescont := SomaAbat(SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,"R",SE1->E1_MOEDA,dDataBase,SE1->E1_CLIENTE,SE1->E1_LOJA)
			nDescont := SumAbatRec(SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_MOEDA,"S",dDataBase,@nTotAbImp)
			nDescont -= nTotAbImp

			nDescont += SE1->E1_DESCONT
			nValLiq += SE1->E1_VALOR - nDescont

			//pegando dias vencimento
			nDiasVenc := (SE1->E1_VENCREA + FwFldGet("ZEE_DIAVEN")) - SE1->E1_DATABOR //FwFldGet("ZEE_DATA")
			if nDiasVenc <= 0
				nDiasVenc := 1
			endif

			//somando vencimentos * valor
			nValXVenc += (SE1->E1_VALOR - nDescont) * nDiasVenc

			QSE1->(DbSkip())
		Enddo

		//media dias
		nMediaDias := nValXVenc / nValLiq

		nRet := nValLiq * nMediaDias / 30 * (nTarifa/100)
		nRet := Round(nRet,2)

	endif

Return(nRet)
