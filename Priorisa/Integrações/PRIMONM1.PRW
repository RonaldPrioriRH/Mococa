#INCLUDE "totvs.ch"
#INCLUDE "protheus.ch"
#INCLUDE "parmtype.ch"
#include 'fwmvcdef.ch'
#Include 'FWEditPanel.CH'

Static jObjetos := JsonObject():New()
Static jStatus	:= JsonObject():New()

User Function UNIPIXM1
	Local aButtons 		:= {{.F.,Nil},{.F.,Nil},{.F.,Nil},{.F.,Nil},{.F.,Nil},{.F.,Nil},{.T.,"Sair"},{.F.,"Cancelar"},{.F.,Nil},{.F.,Nil},{.F.,Nil},{.F.,Nil},{.F.,Nil},{.F.,Nil}}
	Local nPercReducao	:= 0
	Local nX
	Local cCombo := GetSX3Cache("E1_XSTAINT", "X3_CBOX")
	Local aCombo
	Private cCadastro := "Título a Receber" //Variavel usada no fonte FA280Visua

	if !Empty(cCombo)
		aCombo := RetSX3Box(cCombo,,,1)
		For nX := 1 To Len(aCombo)
			if !Empty(aCombo[nX][02])
				jStatus[aCombo[nX][02]] := AllTrim(aCombo[nX][03])
			EndIF
		Next nX
	Endif

	FWExecView("Uniodonto", "UNIPIXM1", MODEL_OPERATION_INSERT,/*oDlg*/, /*bCloseOnOK*/, {|| .T.}/*bOk*/,nPercReducao,aButtons )
return

Static function ModelDef()
	Local oModel 	 	as object
	Local oStrCab  	    := FWFormModelStruct():New()

	// Estrutura Fake de Field
	oStrCab:addTable("", {"CABFAKE"}, "Monitor Pix", {|| ""})
	oStrCab:addField(;
		''	,; //[01] ExpC: Titulo
	'',; //[02] ExpC: Tooltip
	"XXX_X",; //[03] ExpC: IdField
	'C',; //[04] ExpC: Tipo
	4,; //[05] ExpN: Tamanho
	0,; //[06] ExpN: Decimal
	Nil,; //[07] ExpB: Valid
	Nil,; //[08] ExpB: When
	Nil,; //[09] ExpA: Lista de valores ( Combo )
	.F.,; //[10] ExpL: Obrigatório
	,; //[11] ExpB: Inicializador padrão
	Nil,; //[12] ExpL: Campo chave
	Nil,; //[13] ExpL: Campo atualizável
	.F.; //[14] ExpL: Campo virtual
	)

	oModel    := MPFormModel():New( 'MDLMONITORINT' , /*bPre*/ , /*{|oModel| TudoOk(oModel) }*/ ,/*{|oModel| CommitMdl(oModel) }*/,/*{|oModel| CancelMdl(oModel) } */)

	oModel:AddFields( 'MASTER' , /*Owner*/ 	, oStrCab , /*bPre*/ , /*bPos*/ , /*bLoad*/  )
	oModel:SetPrimaryKey({}) //Criar a chave única da tabela

	oModel:SetOnlyQuery('MASTER',.T.)

	// É necessário que haja alguma alteração na estrutura Field
	oModel:setActivate({ |oModel| FwFldPut("XXX_X", "FAKE" , /*nLinha*/, oModel) })

return oModel

Static function ViewDef()
	local oModel
	local oView 		:= FwFormView():New()
	Local oStrCab 	   	:= FWFormViewStruct():New()
	Local nRefreTela	:= SuperGetMV("XX_NTIME",.F.,360)// Tempo em Segundos para Refresh da tela de Execucao de Servicos (Default = 360 segundos)

	oStrCab:AddField("XXX_X"	,;	// [01]  C   Nome do Campo
	'01',;	// [02]  C   Ordem
	'C'	,;	// [03]  C   Titulo do campo
	''	,;	// [04]  C   Descricao do campo
	NIL	,;	// [05]  A   Array com Help
	'C'	,;	// [06]  C   Tipo do campo
	''	,;	// [07]  C   Picture
	NIL	,;	// [08]  B   Bloco de Picture Var
	NIL	,;	// [09]  C   Consulta F3
	.F.	,;	// [10]  L   Indica se o campo ? alteravel
	NIL	,;	// [11]  C   folhaPrincipal do campo
	NIL	,;	// [12]  C   Agrupamento do campo
	NIL	,;	// [13]  A   Lista de valores permitido do campo (Combo)
	NIL	,;	// [14]  N   Tamanho maximo da maior opção do combo
	NIL	,;	// [15]  C   Inicializador de Browse
	.T.	,;	// [16]  L   Indica se o campo ? virtual
	NIL	,;	// [17]  C   Picture Variavel
	NIL	)	// [18]  L   Indica pulo de linha ap?s o campo

	oModel 		:= ModelDef()

	oView:SetModel(oModel)

	//Criacao da folhaPrincipal inicial para separar venda de negociacao.
	oView:CreateHorizontalBox( 'boxCab'			,000)
	oView:CreateHorizontalBox( 'SUPERIOR'	 	,15 )
	oView:CreateHorizontalBox( 'MEIO'	 		,75 )
	oView:CreateHorizontalBox( 'INFERIRO'		,10 )

	oView:CreateVerticalBox( 'ESQUERDA',70,'MEIO'	 )
	oView:CreateVerticalBox( 'DIREITA',30,'MEIO'	 )

	oView:AddField( 'formCAB' 		  	, oStrCab 	, 'MASTER' )
	oView:SetOwnerView( 'formCAB' 		, 'boxCab' 			)

	oView:AddOtherObject("TOPO"		, { |oPanel| topo(oPanel)})
	oView:AddOtherObject("BROWSER"	, { |oPanel| browser(oPanel)})
	oView:AddOtherObject("GRAFICO"	, { |oPanel| GrafPizza(oPanel)})
	oView:AddOtherObject("RODAPE"	, { |oPanel| rodape(oPanel)})

	oView:SetOwnerView("TOPO",'SUPERIOR')
	oView:SetOwnerView("BROWSER",'ESQUERDA')
	oView:SetOwnerView("GRAFICO",'DIREITA')
	oView:SetOwnerView("RODAPE",'INFERIRO')

	oView:ShowUpdateMsg(.F.)
	oView:showInsertMsg(.F.)

	oView:SetTimer(Iif(nRefreTela <= 0, 3600, nRefreTela) * 1000, {|| FwMsgRun(NIL, { | | refreshTela(oView, oModel) }, "Atualizando Tela", "Aguarde....")  })

	//Ativa ou desativa o uso da MsgRun na carga do formulario, utilizar em rotina onde a carga pode demorar muito.
	oView:SetProgressBar(.T.)

return oView

Static Function GrafPizza(oDlg)
	Local oGrafico
	Local oPanel	:= TPanel():New( , ,,oDlg,,,,,, 0,  0)
	Local nX
	Local aNamesStatus := jStatus:GetNames()

	oPanel:Align := CONTROL_ALIGN_ALLCLIENT

	oGrafico := FWChartFactory():New()
	oGrafico:SetOwner(oPanel)

	//Para graficos de serie unica utilizar conforme abaixo
	For nX := 1 To Len(aNamesStatus)
		oGrafico:addSerie(jStatus[aNamesStatus[nX]],   getTotalStatus(aNamesStatus[nX]) )
	Next nX

	//----------------------------------------------
	//Picture
	//----------------------------------------------
	oGrafico:setPicture("@E 999,999,999")

	//----------------------------------------------
	//Mascara
	//----------------------------------------------
	oGrafico:setMask("*@*")

	//----------------------------------------------
	//Adiciona Legenda
	//opções de alinhamento da legenda:
	//CONTROL_ALIGN_RIGHT | CONTROL_ALIGN_LEFT |
	//CONTROL_ALIGN_TOP | CONTROL_ALIGN_BOTTOM
	//----------------------------------------------
	oGrafico:SetLegend(CONTROL_ALIGN_BOTTOM)

	//----------------------------------------------
	//Titulo
	//opções de alinhamento do titulo:
	//CONTROL_ALIGN_RIGHT | CONTROL_ALIGN_LEFT | CONTROL_ALIGN_CENTER
	//----------------------------------------------
	oGrafico:setTitle("", CONTROL_ALIGN_CENTER)

	//----------------------------------------------
	//Opções de alinhamento dos labels(disponível somente no gráfico de funil):
	//CONTROL_ALIGN_RIGHT | CONTROL_ALIGN_LEFT | CONTROL_ALIGN_CENTER
	//----------------------------------------------
	oGrafico:SetAlignSerieLabel(CONTROL_ALIGN_RIGHT)

	//Ativa menu que permite troca do tipo de gráfico pelo usuário
	oGrafico:EnableMenu(.T.)

	//Define o tipo do gráfico
	oGrafico:SetChartDefault(NEWPIECHART)
	//-----------------------------------------
	// Opções disponiveis
	// RADARCHART - barra
	// FUNNELCHART - Cone
	// COLUMNCHART - barra
	// NEWPIECHART - pizza
	//-----------------------------------------
	oGrafico:Activate()

	//Salvo os objetos para uso no refresh
	jObjetos['grafico'] := JsonObject():New()
	jObjetos['grafico']['oPanel'] := oPanel
	jObjetos['grafico']['oGrafico'] := oGrafico
Return

Static function refreshGrafico(oGrafico)
	Local nX
	Local aNamesStatus := jStatus:GetNames()

	oGrafico:DeActivate()

	//Para graficos de serie unica utilizar conforme abaixo
	For nX := 1 To Len(aNamesStatus)
		oGrafico:addSerie(jStatus[aNamesStatus[nX]],   getTotalStatus(aNamesStatus[nX]) )
	Next nX

	oGrafico:Activate()

Return

Static Function topo(oPanel)
	Local nPosBnt
	Local nAltBnt
	Local nLargBnt
	Local nPosDistBnt
	Local cCssBnt1 		:=	 "QPushButton{ font-size: 22px; font: bold large; padding: 4px; color: #FFFFFF; background-color: #810E56; " + ;
		"outline :none; border: 1px solid #D4D4D4; border-bottom-color: #A4A4A6; border-radius: 10px; }"
	Local nLine 		:= 010
	Local oBntPxnGera
	Local oBntAgPg
	Local oBntErroInt

	//Pego o tamanho da dialog - Largura da dialog principal
	nWidthDlg := (oPanel:nRight / 2) - 005

	// Definição do panel onde ficará os botões
	nLargBnt    := (oPanel:nClientWidth/2)/3 * 0.7
	nPosDistBnt := (oPanel:nClientWidth/2)/3 * 0.2
	nPosBnt     := nPosDistBnt

	nAltBnt     := oPanel:nClientHeight /3

	oBntPxnGera := TButton():New( nLine, nPosBnt, "Integração Não Gerado"+CRLF+CValToChar(getTotalStatus("0"))  ,;
		oPanel,{||FwMsgRun(NIL, { | | filtroBotao(1)}, "Efetuando filtro", "Aguarde....")  }, nLargBnt,nAltBnt,,,.F.,.T.,.F.,,.F.,,,.F. )

	oBntPxnGera:SetCSS( cCssBnt1)
	nPosBnt += nLargBnt+nPosDistBnt

	oBntAgPg := TButton():New(nLine, nPosBnt, "Aguardando Recebimento"+CRLF+CValToChar(getTotalStatus("3")) ,;
		oPanel,{||FwMsgRun(NIL, { | | filtroBotao(2)}, "Efetuando filtro", "Aguarde....") }, nLargBnt,nAltBnt,,,.F.,.T.,.F.,,.F.,,,.F. )
	oBntAgPg:SetCSS( cCssBnt1)
	nPosBnt += nLargBnt+nPosDistBnt

	oBntErroInt := TButton():New(nLine, nPosBnt, "Erro integração DataSys"+CRLF+CValToChar(getTotalStatus("E")) ,;
		oPanel,{||FwMsgRun(NIL, { | | filtroBotao(3 )}, "Efetuando filtro", "Aguarde....") }, nLargBnt,nAltBnt,,,.F.,.T.,.F.,,.F.,,,.F. )
	oBntErroInt:SetCSS( cCssBnt1)

	//Salvo os objetos para uso no refresh
	jObjetos['topo'] := JsonObject():New()
	jObjetos['topo']['oPanel'] := oPanel
	jObjetos['topo']['oBntPxnGera'] := oBntPxnGera
	jObjetos['topo']['oBntAgPg'] 	:= oBntAgPg
	jObjetos['topo']['oBntErroInt'] := oBntErroInt
	jObjetos['topo']['lBntErroInt'] := .F.// Sem filtro
	jObjetos['topo']['lBntPxnGera'] := .F.// Sem filtro
	jObjetos['topo']['lBntAgPg'] 	:= .F.// Sem filtro

Return

Static Function refreshTopo(jTopo)

	jTopo['oBntPxnGera']:cCaption	:= "Integração Não Gerado"+CRLF+CValToChar(getTotalStatus("0"))
	jTopo['oBntPxnGera']:refresh()

	jTopo['oBntAgPg']:cCaption 		:= "Aguardando Recebimento"+CRLF+CValToChar(getTotalStatus("3"))
	jTopo['oBntAgPg']:refresh()

	jTopo['oBntErroInt']:cCaption	:= "Erro integração DataSys"+CRLF+CValToChar(getTotalStatus("E"))
	jTopo['oBntErroInt']:refresh()
Return

Static Function filtroBotao(nOpc)

	Do Case
	Case nOpc == 1
		if jObjetos['topo']['lBntErroInt']
			jObjetos['browse']['oBrowse']:SetFilterDefault( jObjetos['browse']['FilterDefault']   )
		Else
			jObjetos['browse']['oBrowse']:SetFilterDefault( " SE1->E1_XSTAINT =='0'  " )
		EndIf
		jObjetos['topo']['lBntErroInt'] := !jObjetos['topo']['lBntErroInt']
	Case nOpc == 2
		if jObjetos['topo']['lBntPxnGera']
			jObjetos['browse']['oBrowse']:SetFilterDefault(jObjetos['browse']['FilterDefault']   )
		Else
			jObjetos['browse']['oBrowse']:SetFilterDefault( " SE1->E1_XSTAINT == '3' " )
		EndIf
		jObjetos['topo']['lBntPxnGera'] := !jObjetos['topo']['lBntPxnGera']
	Case nOpc == 3
		if jObjetos['topo']['lBntAgPg']
			jObjetos['browse']['oBrowse']:SetFilterDefault(jObjetos['browse']['FilterDefault']  )
		Else
			jObjetos['browse']['oBrowse']:SetFilterDefault( "SE1->E1_XERROIN == 'S' .AND. SE1->E1_XSTAINT == '5' " )
		EndIf
		jObjetos['topo']['lBntAgPg'] := !jObjetos['topo']['lBntAgPg']
	EndCase

	jObjetos['browse']['oBrowse']:Refresh(.T.)

return

Static Function browser(oPanel)
	Local oBrowse 			:= FWMBrowse():New()

	//Salvo os objetos para uso no refresh
	jObjetos['browse'] := JsonObject():New()
	jObjetos['browse']['oPanel'] := oPanel
	jObjetos['browse']['FilterDefault'] := " SC2->C2_TPOP == 'F' .And. Empty(SC2->C2_DATRF) .And. (Max(dDataBase - SC2->C2_DATPRI,0) < If(SC2->C2_DIASOCI==0,1,SC2->C2_DIASOCI)) "

	oBrowse:SetAlias( "SC2" )
	oBrowse:SetOwner(oPanel)
	oBrowse:SetAmbiente(.F.)
	oBrowse:SetWalkThru(.F.)
	oBrowse:SetDescription( "" )
	oBrowse:SetFilterDefault( jObjetos['browse']['FilterDefault']  )
	// oBrowse:DisableReport()
	oBrowse:SetMenuDef("UNIIntegracaoM1")
	oBrowse:AddLegend("SC2->C2_TPOP == 'F' .And. Empty(SC2->C2_DATRF) .And. (Max(dDataBase - SC2->C2_DATPRI,0) < If(SC2->C2_DIASOCI==0,1,SC2->C2_DIASOCI)) ","BR_VERMELHO"	,"Integração Não Gerado"		)
	//oBrowse:AddLegend("SE1->E1_XSTAINT == '6'","BR_VIOLETA"	,"Baixa Int.Datasys"	)
	oBrowse:aColumns[01]:CTITLE := "Legenda"
	oBrowse:AddStatusColumns({||If(Empty(SC2->C2_DATRF),'BR_VERMELHO','BR_VERDE')},{ |oBrowse| U_detMonINT() })
	oBrowse:aColumns[02]:CTITLE := "Status"

	oBrowse:SetDoubleClick({||U_detMonINT() })

	oBrowse:Activate()

	jObjetos['browse']['oBrowse'] := oBrowse

Return

Static Function MenuDef()
	Local aRotina := {}

	ADD OPTION aRotina TITLE "Detalhamento"			ACTION "U_detMonINT()"  	OPERATION 2 ACCESS 0
	ADD OPTION aRotina TITLE "Legenda" 				ACTION "U_legMonINT()" 		OPERATION 2 ACCESS 0
	ADD OPTION aRotina TITLE "Liberar Guia CPP" 	ACTION "U_libGCpp()" 		OPERATION 2 ACCESS 0
	ADD OPTION aRotina TITLE "Visualizar Título"	ACTION "FA280Visua('SC2',SC2->(Recno()),2)" 		OPERATION 2 ACCESS 0

Return aRotina

User Function legMonINT()
	Local aCores := {}

	aADD(aCores,{"BR_VERDE"			,OemToAnsi("Integração Não Gerado"			)})
	aADD(aCores,{"BR_AMARELO"		,OemToAnsi("Integração Gerado"				)})

	BrwLegenda("Legenda","Status",aCores)

Return

Static Function rodape(oPanel)
	Local nLine 	 	:= 010 //oPanel:nClientHeight /2
	Local cCssText	 	:=  "QLabel{ font: 20px  bold large;  color: #cea8ff; background-color: transparent; border: none; margin: 0px; }"
	Local nLargText  	:= 200
	Local nPosDistText  := (oPanel:nClientWidth/2)
	Local oQntTit
	Local oVlrTit

	oQntTit := TSay():New(nLine,015,{||'Quantidade de OP '+CValToChar(getTotalStatus("",0))},oPanel,,/*oFont*/,,,,.T.,CLR_RED,CLR_WHITE,nLargText,20)
	oQntTit:SetCss(cCssText)

	nPosText := nPosDistText- nLargText
	oVlrTit := TSay():New(nLine,nPosText,{||'Valor Total  R$ '+AllTrim(Transform(getTotalStatus("",1), PesqPict("SC2","C2_QUANT")) )},oPanel,,/*oFont*/,,,,.T.,CLR_RED,CLR_WHITE,nLargText,20)
	oVlrTit:SetCss(cCssText)

	//Salvo os objetos para uso no refresh
	jObjetos['rodape'] := JsonObject():New()
	jObjetos['rodape']['oPanel'] := oPanel
	jObjetos['rodape']['oQntTit'] := oQntTit
	jObjetos['rodape']['oVlrTit'] := oVlrTit

Return

Static Function refreshRodape(jRodape)

	jRodape['oQntTit']:SetText('Quantidade de OP '+CValToChar(getTotalStatus("",0)))
	jRodape['oQntTit']:refresh()

	//jRodape['oVlrTit']:SetText('Valor Total  R$ '+AllTrim(Transform(getTotalStatus("",1), PesqPict("SE1","E1_VALOR")) ))
	//jRodape['oVlrTit']:refresh()

Return

Static Function getTotalStatus(cStatus,nOpc)
	Local cQry := ""
	Local nRet := 0
	Default nOpc := 0 // 0- count- 1= sum
/*
	cQry += " SELECT "
	if nOpc == 0
		cQry += " COUNT(E1_XSTAINT) TOTAL "
	Else
		cQry += " SUM(E1_VALOR) TOTAL "
	EndIf
	cQry += " FROM " +RetSqlName("SE1")
	cQry += " WHERE D_E_L_E_T_ =' ' "
	if Empty(cStatus)
		cQry += " AND E1_XSTAINT != ' '"
	Else
		IF cStatus == "E"
			cQry += " AND E1_XERROIN ='S' AND E1_XSTAINT ='5' "
		Else
			cQry += " AND E1_XSTAINT = "+ValToSql(cStatus)
		EndIf
	EndIf

	nRet := MpSysExecScalar(cQry, "TOTAL")
*/
Return nRet

User function detMonINT()
	Local aButtons 		:= {{.F.,Nil},{.F.,Nil},{.F.,Nil},{.F.,Nil},{.F.,Nil},{.F.,Nil},{.t.,"Sair"},{.F.,"Sair"},{.F.,Nil},{.F.,Nil},{.F.,Nil},{.F.,Nil},{.F.,Nil},{.F.,Nil}}
	Local nPercReducao	:= 30

	FWExecView("Detalhamento Monitor Integração", "VIEWDEF.UNIPIXM2", MODEL_OPERATION_UPDATE,/*oDlg*/, /*bCloseOnOK*/, {|| .T.}/*bOk*/,nPercReducao,aButtons )
Return

Static Function refreshTela(oView, oModel)
	Default oView  := FwViewActive()
	Default oModel := FwModelActive()
	//Atualiza o topo.
	refreshTopo(jObjetos['topo'])

	//Atualiza o browse.
	jObjetos['browse']['oBrowse']:Refresh(.T.)

	//Atualiza o grafico.
	refreshGrafico(jObjetos['grafico']['oGrafico'] )

	//Atualiza o rodape.
	refreshRodape(jObjetos['rodape'])

	if oView != Nil .And. oView:isActive()
		oView:refresh()
	EndIf

Return .T.


User Function PRI_ApontaProd()

	FwMsgRun(NIL, { || U_PRIMON02(2)}, "Apontando Produção", "Aguarde....")

return


