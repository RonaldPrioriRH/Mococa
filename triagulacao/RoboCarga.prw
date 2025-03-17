#include 'totvs.ch'
#include 'protheus.ch'
#include "JSON.ch"

/*/{Protheus.doc} ROBOCWIZ
description
@type function
@version 1.0
@author marcio.katsumata
@since 02/09/2024
@return variant, return_description
/*/

user function ROBOCWIZ()

	Local oNewPag  as object
	Local oStepWiz as object
	local aCoors   as array

	private cFornece   as date
	private dDtVencIni as date
	private dDtVencFim as date
	private oCargaTbl  as object
	private cAliasTbl  as character
	private oTGet1     as object
	private oTGet2     as object
	private nOpcParam  as numeric
	private cMsg       as character
	private oModelPar  as object
	private oBrowse1   as object
	private oBrowse2   as object
	private aDadosCar  as array
	private aDadosSta  as array
	Private oRobo      as object
	Private lRoboCarga 	:= .t.
	//rever
	Public cLogPro     as character
	Public cCarga      as character
	Public aPedCar     as array
	Public cQuebra  := chr(13)+chr(10)
	Public cJsonRet := ""

	// Validando boletas

	//If testabol()
	//	Return
	//Endif

	aCoors := FWGetDialogSize( oMainWnd )
	cMsgErro := ""
	dBselectArea('ZA5')

	oStepWiz:= FWWizardControl():New()//Instancia a classe FWWizard
	oStepWiz:ActiveUISteps()
	oStepWiz:SetSize({aCoors[3], aCoors[4]})
	//----------------------
	// Pagina 1
	//----------------------
	oNewPag := oStepWiz:AddStep("1")
	oNewPag:SetStepDescription("Parâmetros iniciais")
	oNewPag:SetConstruction({|oPanel|cria_pg1(oPanel)})
	oNewPag:SetNextAction({||Val_Par(MV_PAR03,MV_PAR04)})
	oNewPag:SetCancelAction({||.T.})

	//----------------------
	// Pagina 2
	//----------------------
	oNewPag := oStepWiz:AddStep("2", {|oPanel|cria_pg2(oPanel)})
	oNewPag:SetStepDescription("Processamento da carga")
	oNewPag:SetNextAction({|| .t. })
	oNewPag:SetPrevAction({|| Alert("Inativo"),  .f. })
	oNewPag:SetCancelAction({|| .T.})

	oStepWiz:Activate()
	oStepWiz:Destroy()

	aSize(aCoors,0)


return

/*/{Protheus.doc} Val_Par
valida parametros para avançar
@type function
@version  1.0
@author jackson capelato
@since 05/09/2024
@param mv_par03 / mv_par04
/*/

Static function Val_par(dDatap,cDirp)

	Local lPar := .f.

	if !empty(dDatap) .and. !empty(cDirp)
		lPar:=.t.
	else
		Alert("Parametros em Branco")
	endif

	if !ExistDir(cDirp) .and. lPar
		lPar:= .f.
		Alert("Diretorio invalido")
	endif

	if cFilAnt == '0102'
		lPar:= .f.
		Alert("Filial sem processo de carga")
	endif

Return lPar

/*/{Protheus.doc} cria_pg1
Criação da página de parâmetros iniciais.
@type function
@version  1.0
@author marcio.katsumata
@since 05/07/2021
@param oPanel, object, objeto da tela wizard
/*/
static function cria_pg1(oPanel)
	local aParamBox as array
	local aRetPar as array

	aRetPar   := {}
	aParamBox := {}

	aadd(aRetPar, MV_PAR01 := '')
	aadd(aRetPar, MV_PAR02 := '')
	aadd(aRetPar, MV_PAR03 := ddatabase)
	aadd(aRetPar, MV_PAR04 := "C:\spool\"+Space(100))

	//-------------------------------------------------------------------------
	//Definção dos parâmetros do parambox
	//------------------------------------------------------------------------
	aAdd(aParamBox,{9,"Processamento de carga automática" ,150,100,.T.})
	aAdd(aParamBox,{9,"Informe os parâmetros abaixo:" ,150,100,.T.})
	aAdd(aParamBox,{1,"Data ",Ctod(Space(8)),"","","","",50,.T.})
	aAdd(aParamBox,{6,"Diretorio para Danfe",Space(100),"","","",50,.T.,"",,GETF_LOCALHARD+GETF_RETDIRECTORY})

	ParamBox(aParamBox,"Parâmetros",@aRetPar,,,,,,oPanel,,.T.,.T.)

return

/*/{Protheus.doc} cria_pg2
Cria página de seleção de títulos
@type function
@version  1.0
@author marcio.katsumata
@since 05/07/2021
@param oPanel, object, objeto do wizard
/*/
static function cria_pg2(oPanel)
	local aFields as array
	local aVisibles as array
	local oFWLayer as object
	local aList as array
	local aList2 as array
	local nX as numeric
	local aColumn as array
	local aColumn2 as array
	local cTitulo as character


	cTitulo   := "Cargas"
	aList     := {}
	aList2    := {}
	aFields   := {}
	aVisibles := {}
	aDadosCar := {}
	aDadosSta := {}
	aColumn   := {}
	aColumn2  := {}

	//----------------------------------------------------------------
	//Carregas as cargas da view do sistema terceiro de acordo com os
	//parâmetros informados
	//-----------------------------------------------------------------
	FwMsgRun(oPanel,{||getCrgPend()},"Processamento.",  "Carregando as cargas que devem ser montadas...")

	oFWLayer := FWLayer():New()
	oFWLayer:Init( oPanel, .F., .T. )

	oFWLayer:AddLine( 'UP', 30, .F. )                     // Cria uma "linha" com 80% da tela
	oFWLayer:AddLine( 'DOWN', 60, .F. )                   // Cria uma "linha" com 20% da tela
	oFWLayer:AddLine( 'BUTTON', 10, .F. )                   // Cria uma "linha" com 20% da tela
	oFWLayer:AddCollumn( 'MAIN' ,  100, .T., 'UP' )
	oFWLayer:AddCollumn( 'MAIN' ,  100, .T., 'DOWN' )
	oFWLayer:AddCollumn( 'MAIN' ,  100, .T., 'BUTTON' )
	oPanelUp  := oFWLayer:GetColPanel( 'MAIN' , 'UP' )    //objeto do painel superior
	oPanelDown := oFWLayer:GetColPanel( 'MAIN', 'DOWN' )  //objeto do painel inferior
	oPanelButton := oFWLayer:GetColPanel( 'MAIN', 'BUTTON' )  //objeto do painel inferior

	// DEFINIÇÕES DO NAVEGADOR
	oBrowse1 := FWBrowse():New(oPanelUp)
	oBrowse1:SetDataArray(.T.)             							// Indica que vou carregar o browser atravez de uma query
	oBrowse1:SetArray( aClone(aDadosCar) )            					// Indica que vou carregar o browser atravez de uma query
	oBrowse1:SetDescription(cTitulo)									// Descrição do FwBrowse
	oBrowse1:OptionConfig (.F.)                                      // Habilita ou desabilita configurações
	//oBrowse1:setChange({||iif(len(aDadosCar) >=oBrowse1:nAt .and. valType(oBrowse2)== "O", (aDadosSta:= aClone(aDadosCar[oBrowse1:nAt][9]) , oBrowse2:oData:aArray:= aClone(aDadosSta),oBrowse2:refresh(), oBrowse2:goTop()), ""), .T.})
	oBrowse1:setChange({||iif(len(aDadosCar) >=oBrowse1:nAt .and. valType(oBrowse2)== "O", (aDadosSta:= aClone(aDadosCar[oBrowse1:nAt][10]) , oBrowse2:oData:aArray:= aClone(aDadosSta),oBrowse2:refresh(), oBrowse2:goTop()), ""), .T.})
	oBrowse1:DisableReport()                                      	// desabilita o relatorio


	aadd( aList, {"Filial"			    ,	"C",4  ,0,"@!"} )
	aadd( aList, {"Cod.Carga"			,	"C",6  ,0,"@!"} )
	aadd( aList, {"Pedidos de venda"	,	"C",126,0,"@!"} )
	aadd( aList, {"Data"  			    ,	"D",8  ,0,""  } )
	aadd( aList, {"Status"		        ,	"C",30 ,0,""  } )
	aadd( aList, {"Flag"		        ,	"C",1  ,0,""  } )

	For nX:= 1 to Len(aList)

		oColumn := FWBrwColumn():New()

		oColumn:SetData( &( '{ |x| x:oData:aArray[oBrowse1:at(), '+Alltrim(Str(nX))+'] }' ) )
		oColumn:SetTitle( aList[nX,1] )
		oColumn:SetType( aList[nX,2]  )
		oColumn:SetSize( aList[nX,3] )
		oColumn:SetDecimal( aList[nX,4] )
		oColumn:SetPicture( aList[nX,5] )
		oColumn:bHeaderClick := { || Nil }

		aAdd( aColumn, oColumn )

	Next nX

	oBrowse1:addLegend({||aDadosCar[oBrowse1:nAt,6] == "P" }, "BR_AZUL")
	oBrowse1:addLegend({||aDadosCar[oBrowse1:nAt,6] == "E" }, "BR_VERMELHO")
	oBrowse1:addLegend({||aDadosCar[oBrowse1:nAt,6] == "OK"}, "BR_VERDE")
	oBrowse1:addLegend({||aDadosCar[oBrowse1:nAt,6] == "A" }, "BR_AMARELO")
	oBrowse1:SetColumns( aColumn )
	oBrowse1:Activate()

	oBrowse2 := FWBrowse():New(oPanelDown)
	oBrowse2:SetDataArray(.T.)             							// Indica que vou carregar o browser atravez de uma query
	oBrowse2:SetArray( aClone(aDadosSta) )            				// Indica que vou carregar o browser atravez de uma query
	oBrowse2:SetDescription(cTitulo)								// Descrição do FwBrowse
	oBrowse2:OptionConfig (.F.)                                     // Habilita ou desabilita configurações
	oBrowse2:DisableReport()


	aadd( aList2, {"Processo"	        ,	"C",40 ,0,""} )
	aadd( aList2, {"Mensagem"  			,	"C",150,0,""} )

	For nX:= 1 to Len(aList2)

		oColumn := FWBrwColumn():New()

		oColumn:SetData( &( '{ |x| x:oData:aArray[oBrowse2:at(), '+Alltrim(Str(nX+1))+'] }' ) )
		oColumn:SetTitle( aList2[nX,1] )
		oColumn:SetType( aList2[nX,2]  )
		oColumn:SetSize( aList2[nX,3] )
		oColumn:SetDecimal( aList2[nX,4] )
		oColumn:SetPicture( aList2[nX,5] )
		oColumn:bHeaderClick := { || Nil }

		aAdd( aColumn2, oColumn )

	Next nX
	oBrowse2:addLegend({||aDadosSta[oBrowse2:nAt,1] == "BR_AZUL"}    , "BR_AZUL")
	oBrowse2:addLegend({||aDadosSta[oBrowse2:nAt,1] == "BR_VERMELHO"}, "BR_VERMELHO")
	oBrowse2:addLegend({||aDadosSta[oBrowse2:nAt,1] == "BR_VERDE"}   , "BR_VERDE")
	oBrowse2:addLegend({||aDadosSta[oBrowse2:nAt,1] == "BR_CINZA"}   , "BR_CINZA")
	oBrowse2:SetColumns( aColumn2 )
	oBrowse2:Activate()

	//@05,20 BUTTON "Executar Todos" SIZE 75, 22 PIXEL OF oPanelButton ACTION ( FwMsgRun(,{||ProcAll()},"Processamento.",  "Processando todas as cargas...") )
	//@05,20 BUTTON "Executar Todos" SIZE 75, 22 PIXEL OF oPanelButton ACTION ( FwMsgRun(,{||ProcTodos()},"Processamento.",  "Processando todas as cargas...") )
	@05,20 BUTTON "Executar Todos" SIZE 75, 22 PIXEL OF oPanelButton ACTION ( ProcTodos() )
	@05,130 BUTTON "Executar Selecionado" SIZE 75, 22 PIXEL OF oPanelButton ACTION (  FwMsgRun(,{||ProcSelec(oBrowse1:nAt)},"Processamento.",  "Processando carga selecionada...") )

return

/*/{Protheus.doc} getCrgPend
Função para realizar a seleção de cargas
de acordo com os parâmetros informados.
@type function
@version 1.0
@author marcio.katsumata
@since 02/09/2024
/*/
static function getCrgPend()

	Local cViXZA5     := getNextAlias()
	Local cFilVen     := cFilAnt
	Local cFilEst     := SuperGetMv("MC_FILESTO",,"0104")
	Local cAguardando := "Aguardando Execução..."
	Local cMsgTransf  := ""
	Local cLegInicial := "BR_AZUL"
	Local cLegTransf  := "BR_AZUL"
	Local cPedCarg	  := ''
	Local cCargOld	  := ''
	Local cXFilial	  := ''
	Local cXcarga 	  := ''
	Local cXpedCar	  := ''
	Local cXdatCar	  := ''
	Local nSqu		  := 0
	Local cEmbMococa  := GetEnvServer()
	Private cTranspDAK := ''
	/*
	aDadosCar[1] - Filial Carga
	aDadosCar[2] - Cod. Carga
	aDadosCar[3] - Cod pedidos venda
	aDadosCar[4] - Data
	aDadosCar[5] - Msg do status
	aDadosCar[6] - Codigo do Status (P-Pendente, E-Erro, OK, A)
	aDadosCar[7] - Transportador - cXTransVen
	aDadosCar[8] - Transportadora Cross - cXTcross
	aDadosCar[9] - Transportadora transferencia - cXTTransf
	aDadosCar[10]- Status do array aDadosSta
	*/
	If upper(substr(cEmbMococa,1,5)) == 'TESTE'
		BEGINSQL Alias cViXZA5
			SELECT C5_FILIAL FILCAR , NR_CARGA_LOG CARGA , C5_NUM PEDIDO , DT_PROG_FAT DATACAR, ID_TRANSP TRANSPVEND
			, ID_TRANSP_CROSS TCROSS, ID_TRANSP_TRANSF TTRANSF
			FROM MOCFATAUTO@SIGAOFC
			WHERE NR_CARGA_LOG NOT IN
				(SELECT ZA5_CHAVE FROM %table:ZA5% ZA5 WHERE ZA5.D_E_L_E_T_ <> '*' AND C5_FILIAL = ZA5_FILPED AND NR_CARGA_LOG = ZA5_CHAVE 
						AND C5_NUM = ZA5_PEDIDO AND ZA5_STATUS = 'P' GROUP BY ZA5_CHAVE) 
				AND C5_FILIAL = %EXP:cFilVen%			
			AND DT_PROG_FAT = %EXP:DTOS(MV_PAR03)%		
			ORDER BY 1,2,3 
		ENDSQL
	Else
		BEGINSQL Alias cViXZA5
			SELECT C5_FILIAL FILCAR , NR_CARGA_LOG CARGA , C5_NUM PEDIDO , DT_PROG_FAT DATACAR, ID_TRANSP TRANSPVEND 
			, ID_TRANSP_CROSS TCROSS, ID_TRANSP_TRANSF TTRANSF
			FROM MOCFATAUTO
			WHERE NR_CARGA_LOG NOT IN
				(SELECT ZA5_CHAVE FROM %table:ZA5% ZA5 WHERE ZA5.D_E_L_E_T_ <> '*' AND C5_FILIAL = ZA5_FILPED AND NR_CARGA_LOG = ZA5_CHAVE 
						AND C5_NUM = ZA5_PEDIDO AND ZA5_STATUS = 'P' GROUP BY ZA5_CHAVE) 
				AND C5_FILIAL = %EXP:cFilVen%			
			AND DT_PROG_FAT = %EXP:DTOS(MV_PAR03)%		
			ORDER BY 1,2,3 
		ENDSQL
	Endif
	/*
	0104 - CD
	0105 - ANAPOLIS

	ID_TRANSP -> TRANSPVEND -  		[7] -- Transportadora de venda (0104 como da 0105)
	ID_TRANSP_CROSS -> TCROSS - 	[8] -- tcross
	ID_TRANSP_TRANSF -> TTRANSF - 	[9] -- Transportandor transferencia 0104 para 0105
	*/

	MemoWrit("c:\temp\cViXZA5.sql", GetLastQuery()[2])
	cCargOld := (cViXZA5)->CARGA
	++nSqu
	cPedCarg := "|" + ALLTRIM((cViXZA5)->PEDIDO)
	do While !(cViXZA5)->(Eof())
		if !(cCargOld == (cViXZA5)->CARGA)
			cCargOld = (cViXZA5)->CARGA
			cPedCarg := "|" + ALLTRIM((cViXZA5)->PEDIDO)
			++nSqu
		endif
		cXFilial	:= (cVixZa5)->FILCAR
		cXcarga 	:= (cVixZa5)->CARGA
		cXTransVen 	:= (cVixZa5)->transpvend
		cXTcross	:= (cVixZa5)->tcross
		cXTTransf	:= (cVixZa5)->ttransf
		cXpedCar	:= cPedCarg
		cXdatCar	:=ddatabase
		(cVixZa5)->(dBSkip())
		if nSqu == 1 .and. !(cCargOld == (cVixZa5)->CARGA)
			cPedCarg += "|"
		elseif nSqu >= 1 .and. (cCargOld == (cVixZa5)->CARGA)
			cPedCarg += "|" + ALLTRIM((cVixZa5)->PEDIDO)
		elseif nSqu > 1 .and. !(cCargOld == (cVixZa5)->CARGA)
			cPedCarg += "|"
		endif

		if !(cVixZa5)->(EOF())
			if !(cCargOld == (cVixZa5)->CARGA)
				If !empty((cVixZa5)->FILCAR + cCargOld)   // Adicinei em 07/11/24
					aadd(aDadosCar , { (cVixZa5)->FILCAR, cCargOld , cPedCarg , ddatabase,"Pendente......" ,"P",cXTransVen,cXTcross,cXTTransf})
					nSqu:=0
				Endif
			endif
		endif
		++nSqu
	enddo

	if (cCargOld == cXcarga)
		(cVixZa5)->(dBSkip(-1))
		If !empty(cXFilial+cXcarga) // Adicinei em 07/11/24
			cXpedCar += "|"
			aadd(aDadosCar , { cXFilial, cXcarga, cXpedCar , ddatabase,"Pendente......" ,"P",cXTransVen,cXTcross,cXTTransf})
			cPedCarg := "|" + ALLTRIM((cVixZa5)->pedido)
		Endif
	endif

	(cViXZA5)->(dbCloseArea())

	//MontaProcLog preenche aDadosSta
	aadd(aDadosSta, {cLegInicial,"Gerar Carga ("+cFilVen+")", cAguardando, "DOCCRG", .F.})
	// somente se eu estiver na 0105 GERSOL
	// transfere da 0104 - 0105
	IF cFilEst <> cFilVen
		cLegTransf  := "BR_AZUL"
		cMsgTransf  := "Aguardando Execução..."
	Else
		cLegTransf := "BR_CINZA"
		cMsgTransf := "Inativo"
	ENDIF
	aadd(aDadosSta, {cLegTransf,"Gerar Sol.Transf.("+cFilVen+")"       		    , cMsgTransf, "GERSOL" , .F.})
	aadd(aDadosSta, {cLegTransf,"Liberar Estoque ("+cFilEst+")"         		, cMsgTransf, "LIBESTO", .F.})
	aadd(aDadosSta, {cLegTransf,"Gerar Documento Saída FE ("+cFilEst+")"		, cMsgTransf, "DOCSFE" , .F.}) //mococa
	aadd(aDadosSta, {cLegTransf,"Transmitir NF-e FE ("+cFilEst+")"     			, cMsgTransf, "NFE_FE" , .F.})
	aadd(aDadosSta, {cLegTransf,"Autorização NF-e FE ("+cFilEst+")"     		, cMsgTransf, "AUT_FE" , .F.})
	aadd(aDadosSta, {cLegTransf,"Imprimir DANFE FE ("+cFilEst+")"       	   	, cMsgTransf, "DAN_FE" , .F.})
	aadd(aDadosSta, {cLegTransf,"Gerar Documento Entrada FV ("+cFilVen+")"     	, cMsgTransf, "DOCEFV"  , .F.})
	aadd(aDadosSta, {cLegTransf,"Distribuir Lotes nos Pedidos FV ("+cFilVen+")"	, cMsgTransf, "DLOTFV"  , .F.})

	aadd(aDadosSta, {cLegInicial,"Liberar Estoque FV ("+cFilVen+")"             , cAguardando, "LIBESTO2", .F.})
	aadd(aDadosSta, {cLegInicial,"Gerar Documento Saída  FV ("+cFilVen+")"      , cAguardando, "DOCSFV"  , .F.})
	aadd(aDadosSta, {cLegInicial,"Transmitir NF-e FV ("+cFilVen+")"             , cAguardando, "NFE_FV"  , .F.})
	aadd(aDadosSta, {cLegInicial,"Autorização NF-e FV ("+cFilVen+")"            , cAguardando, "AUT_FV"  , .F.})
	aadd(aDadosSta, {cLegInicial,"Imprimir DANFE FV ("+cFilEst+")"              , cAguardando, "DAN_FV"  , .F.})

	aEval(aDadosCar, {|aDados|aadd(aDados, aClone(aDadosSta))})
return

Static Function ProcTodos()
	Local nx
	Local nQtdPro := 0
	for nx := 1 to len(aDadosCar)
		nQtdPro++
		If nQtdPro>4   // Deve ser retirado quando entrar em produção
			Exit
		Endif
		ProcSelec(nx)
	Next

Return


/*/{Protheus.doc} ProcSelec
Função para realizar o processamento da geração de carga
e o processo de triangulação do registro selecionados
@type function
@version 1.0
@author marcio.katsumata
@since 03/09/2024
/*/
static function ProcSelec(nLBr1)

	local lSeq      as logical
	Local nEtapa    as numeric
	Local aItOri    as array
	Local aNotas    as array
	Local aNotaFV   as array
	Local cFilVenr  as character
	Local cFilEstr  as character
	Local cFilIntr  as character
	local nInd      as numeric
	Local cCodCar   as character
	Local cPedidos  as character
	Local cFilCarga as character
	Local cStaRob   as character
	Local cAliest   as character

	Local cBErro := getNextAlias()

	Local cPar1 := ''
	Local cPar2 := ''
	Local cPar3 := ''
	Local cPar4 := ''
	Local cPar5 := ''
	Local cPar6 := ''

	Local oErro	:= Nil

	cJsonRet := ''

	if !empty(oRobo)
		FwFreeObj(oRobo)
	endif

	oRobo:= FatTriang():New(.t.) //.t. exibe mensagens - .f. nao exibe
	
	oBrowse1:goTo(nLBr1)
	cFilCarga := aDadosCar[nLBr1][1]
	cCodCar   := aDadosCar[nLBr1][2]
	cPedidos  := aDadosCar[nLBr1][3]
	cStaRob   := aDadosCar[nLBr1][6]

	if cStaRob = 'P'
		nInd := 1
		cLogPro := "Gerando carga : "+cCodCar+"Pedido(s) : "+cPedidos+ cQuebra
	elseif cStaRob = 'E'
		cLogPro := "Retomando Processo carga : "+cCodCar+"Pedido(s) : "+cPedidos+ cQuebra
		nInd := fBusErro(cCodCar)

		IF nInd > 1

			BEGINSQL ALIAS cBErro
				SELECT * FROM %TABLE:ZA5% ZA5
				WHERE ZA5.%notdel%
				AND ZA5_FILIAL = %EXP:cFilCarga%
				AND ZA5_CHAVE = %EXP:cCarga%
			ENDSQL
			if !(cBErro)->(Eof())
				FwJsonDeserialize(ALLTRIM((cBErro)->ZA5_LOG), @oErro)
				lSeq:=.t.
			else
				lSeq:=.f.
			endif
		ENDIF
		if nInd == 2
			cCarga := oErro:Par2
		elseif nInd == 4
			aPedCar:= StrTokArr(oErro:Par3,"|")
			aItOri := StrTokArr(oErro:Par4,"|")
			aNotas := StrTokArr(oErro:Par5,"|")
		elseif nInd == 5
			aNotas := StrTokArr(oErro:Par3,"|")
		elseif nInd == 6
			aNotas := StrTokArr(oErro:Par3,"|")
		elseif nInd == 7
			aNotas := StrTokArr(oErro:Par3,"|")
		elseif nInd == 8
			cFilCarga := oErro:Par2
			aNotas := StrTokArr(oErro:Par4,"|")
			aNotaFV := StrTokArr(oErro:Par5,"|")
		elseif nInd == 9
			aNotaFV := StrTokArr(oErro:Par2,"|")
		elseif nInd == 10
			cFilVenr := oErro:Par2
			aPedCar:= StrTokArr(oErro:Par3,"|")
			aItOri := StrTokArr(oErro:Par4,"|")
			aNotas := StrTokArr(oErro:Par5,"|")
		elseif nInd == 11
			cFilVenr := oErro:Par2
			aPedCar:= StrTokArr(oErro:Par3,"|")
			aItOri := StrTokArr(oErro:Par4,"|")
			aNotas := StrTokArr(oErro:Par5,"|")
		elseif nInd == 12
			cFilVenr := oErro:Par2
			aNotaFV := StrTokArr(oErro:Par3,"|")
		elseif nInd == 13
			cFilVenr := oErro:Par2
			aNotaFV := StrTokArr(oErro:Par3,"|")
		elseif nInd == 14
			cFilVenr := oErro:Par2
			aNotaFV := StrTokArr(oErro:Par3,"|")
		endif
	Else
		nInd := 0
	endif
	/*
	aDadosCar[7] - Transportador - cXTransVen
	aDadosCar[8] - Transportadora Cross - cXTcross
	aDadosCar[9] - Transportadora transferencia - cXTTransf
	*/
	sa4->(dBsetOrder(1))
	If !empty(aDadosCar[nLBr1][7])
		If sa4->(dBseek(xFilial('SA4') + aDadosCar[nLBr1][7] )) .and. sa4->a4_msblql == '1'
			Alert('ATENÇÃO, Transportadora de venda '+aDadosCar[nLBr1][7] +' consta bloqueada.')
			nInd := 0
		Endif
	Endif
	If !empty(aDadosCar[nLBr1][8])
		If sa4->(dBseek(xFilial('SA4') + aDadosCar[nLBr1][8] )) .and. sa4->a4_msblql == '1'
			Alert('ATENÇÃO, Transportadora de CrossDoc '+aDadosCar[nLBr1][8] +' consta bloqueada.')
			nInd := 0
		Endif
	Endif
	If !empty(aDadosCar[nLBr1][9])
		If sa4->(dBseek(xFilial('SA4') + aDadosCar[nLBr1][9] )) .and. sa4->a4_msblql == '1'
			Alert('ATENÇÃO, Transportadora de Transferencia '+aDadosCar[nLBr1][9] +' consta bloqueada.')
			nInd := 0
		Endif
	Endif
	if nInd == 1

		nEtapa  := 1
		cLogPro += "Rastreio : DOCCRG - Etapa : "+StrZero(nEtapa,2)+cQuebra

		//            Chave , Etapa           , Status,Filial Carga      ,[Filial],Pedido            ,[Serie],NF     ,Log     , [CodCli],[LojCli])
		Logza5(cCodCar ,'1','P'    ,cFilCarga,''      ,'',''     ,''     ,cLogPro ,"DOCCRG" , ''     )
		cLogPro := ""

		aDadosCar[nLBr1][5]             := "Processando :  '"+alltrim(cCodCar)+"'"
		oBrowse1:oData:aArray[nLBr1][5] := "Processando :  '"+alltrim(cCodCar)+"'"
		aDadosCar[nLBr1][6]             := "A"
		oBrowse1:oData:aArray[nLBr1][6] := "A"
		oBrowse1:refresh()
		oBrowse2:refresh()

		MsAguarde({ || lSeq := oRobo:GerarCarga(cFilCarga,alltrim(cCodCar),cPedidos,aDadosCar[nLBr1][4],cStaRob) },"Aguarde...","Gerando Carga ..."+cCodCar,.T.)

		if !lSeq
			cLogPro += "Etapa : 1 Processo : GerarCarga "+cQuebra
			cLogPro += "Parametros : ('"+cFilCarga+"','"+alltrim(cCodCar)+"','"+cPedidos+"',"+dtoc(aDadosCar[nLBr1][4])+", '"+cStaRob+"' ) "+cQuebra

			Logza5(cCodCar ,'1' ,'E'    ,cFilCarga,''      ,'',''     ,''     ,cLogPro ,"DOCCRG" , ''     )
			cLogPro := ""

			oBrowse2:goTo(nEtapa)

			aDadosSta[nEtapa][1]             := "BR_VERMELHO"
			aDadosSta[nEtapa][3]             := "Erro ao processar"
			oBrowse2:oData:aArray[nEtapa][3] := "Erro ao processar"

			aDadosCar[nLBr1][6]             := "E"
			oBrowse1:oData:aArray[nLBr1][6] := "E"
			aDadosCar[nLBr1][5]             := "Erro ao gerar carga '"+alltrim(cCodCar)+"'"
			oBrowse1:oData:aArray[nLBr1][5] := "Erro ao gerar carga '"+alltrim(cCodCar)+"'"
			nInd := 0
		else
			Logza5(cCodCar ,'1' ,'F'    ,cFilCarga,''      ,'',''     ,''     ,cLogPro ,"DOCCRG" , ''     )
			cLogPro := ""

			aDadosSta[nEtapa][1]             := "BR_VERDE"
			aDadosSta[nEtapa][3]             := "Processado com sucesso"
			oBrowse2:oData:aArray[nEtapa][3] := "Processado com sucesso"

			aDadosCar[nLBr1][6]             := "F"
			oBrowse1:oData:aArray[nLBr1][6] := "F"
			aDadosCar[nLBr1][5]             := "OK"
			oBrowse1:oData:aArray[nLBr1][5] := "OK"
			nInd := 2
			if aDadosSta[nInd][1] = "BR_CINZA"
				cFilVenr := cFilCarga
				//aPedCar
				nInd := 10
			endif

			cTranspDAK := Posicione("DAK",1,alltrim(cFilCarga)+cCarga,"DAK_TRANSP")

			if za5->(dBseek(cCodCar))
				RecLock('ZA5',.f.)
				ZA5->ZA5_CLIENT := cTranspDAK
				za5->(MsUnLock())
			endif
		endif
		oBrowse1:refresh()
		oBrowse2:refresh()
	endif
	if nInd == 2
		nEtapa  := 2
		cLogPro += "Rastreio : GERSOL - Etapa : "+StrZero(nEtapa,2)+cQuebra

		Logza5(cCodCar ,'2','P'    ,cFilCarga,''      ,'',''     ,''     ,cLogPro ,"GERSOL" , ''     )
		cLogPro := ""

		aDadosCar[nLBr1][5]             := "Processando :  '"+alltrim(cCodCar)+"'"
		oBrowse1:oData:aArray[nLBr1][5] := "Processando :  '"+alltrim(cCodCar)+"'"
		aDadosCar[nLBr1][6]             := "A"
		oBrowse1:oData:aArray[nLBr1][6] := "A"
		oBrowse1:refresh()
		oBrowse2:refresh()

		MsAguarde({ || lSeq := oRobo:AbreSolicitacao('',cCarga,cFilCarga) },"Aguarde...","Abrindo Solicitação de Carga ...",.T.)

		if !lSeq
			/*
			cPar1 := ''
			cPar2 := cCarga
			cPar3 := ''
			cPar4 := ''
			cPar5 := ''
			cPar6 := ''

			cJsonRet := '{"Processo":"GERSOL","Etapa":"2","Par1":"'+cPar1+'","Par2":"'+cPar2+'"}'

			Logza5(cCodCar ,'2' ,'E'    ,cFilCarga,''      ,'',''     ,''     ,cJsonRet ,"GERSOL" , ''     )
			cJsonRet := ""
			*/

			aCabx := {}
			aItex := {}

			cTransp := Posicione("DAK",1,Alltrim(cFilCarga)+cCarga,"DAK_TRANSP")

			MSExecAuto( { |x, y, z| OMSA200(x, y, z) }, aCabx, aItex, 6 )

			if za5->(dBseek(cCodCar))
				RecLock('ZA5',.f.)
				za5->(dbdelete())
				za5->(MsUnLock())
			endif

			oBrowse2:goTo(nEtapa)

			aDadosSta[nEtapa][1] := "BR_VERMELHO"
			aDadosSta[nEtapa][3] := "Erro ao processar"
			oBrowse2:oData:aArray[nEtapa][3] := "Erro ao processar"

			aDadosCar[nLBr1][6] 			:= "E"
			oBrowse1:oData:aArray[nLBr1][6] := "E"
			aDadosCar[nLBr1][5]             := "Erro ao gerar carga Filial de Estoque '"+alltrim(cCodCar)+"' - Verificar os produtos"
			oBrowse1:oData:aArray[nLBr1][5] := "Erro ao gerar carga Filial de Estoque '"+alltrim(cCodCar)+"' - Verificar os produtos"

			nInd := 0
		else
			Logza5(cCodCar ,'2' ,'F'    ,cFilCarga,''      ,'',''     ,''     ,"Etapa 2 - finalizada OK" ,"GERSOL" , ''     )
			cLogPro := ""

			aDadosSta[nEtapa][1]             := "BR_VERDE"
			aDadosSta[nEtapa][3] 			 := "Processado com sucesso"
			oBrowse2:oData:aArray[nEtapa][3] := "Processado com sucesso"

			aDadosCar[nLBr1][6]             := "F"
			oBrowse1:oData:aArray[nLBr1][6] := "F"
			aDadosCar[nLBr1][5]             := "OK"
			oBrowse1:oData:aArray[nLBr1][5] := "OK"
			nInd := 3
		endif
		oBrowse1:refresh()
		oBrowse2:refresh()
	endif
	if nInd == 3
		nEtapa  := 3
		cLogPro += "Rastreio : LIBESTO - Etapa : "+StrZero(nEtapa,2)+cQuebra

		cAliest := getNextAlias()

		BEGINSQL alias cAliest
			SELECT C5_NUM as PedEst FROM %table:SC5% SC5
			WHERE SC5.%notdel%
			AND C5_XIDTRI = %EXP:orobo:GetIdTriang()%
			AND C5_XFILEST = ' '			
		ENDSQL

		Logza5(cCodCar ,'3','P'    ,cFilCarga,''      ,'',''     ,''     ,cLogPro ,"LIBESTO" , ''     )
		cLogPro := ""
		aItOri  := {}
		aNotas  := {}

		aDadosCar[nLBr1][5]             := "Processando :  '"+alltrim(cCodCar)+"'"
		oBrowse1:oData:aArray[nLBr1][5] := "Processando :  '"+alltrim(cCodCar)+"'"
		aDadosCar[nLBr1][6]             := "A"
		oBrowse1:oData:aArray[nLBr1][6] := "A"
		oBrowse1:refresh()
		oBrowse2:refresh()

		MsAguarde({|| lSeq := oRobo:LiberaEstoque("LIBESTO", oRobo:cFilEst, {(cAliest)->PedEst} , aItOri, @aNotas) },"Aguarde...","Liberando estoque ...",.T.)

		(cAliest)->(dbCloseArea())

		if !lSeq
			/*
			cPar1 := 'LIBESTO'
			cPar2 := oRobo:cFilEst
			cPar3 := CenArr2Str(aPedCar,"|")
			cPar4 := CenArr2Str(aItOri,"|")
			cPar5 := CenArr2Str(aNotas,"|")
			cPar6 := ''

			cJsonRet := '{"Processo":"LIBESTO","Etapa":"3","Par1":"'+cPar1+'","Par2":"'+cPar2+'","Par3":"'+cPar3+'","Par4":"'+cPar4+'","Par5":"'+cPar5+'"}'

			Logza5(cCodCar ,'3' ,'E'    ,cFilCarga,''      ,'',''     ,''     ,cJsonRet ,"LIBESTO" , ''     )
			cJsonRet := ""
			*/
			aCabx := {}
			aItex := {}

			cFilAnt := cFilCarga

			cTranspDAK := Posicione("DAK",1,ALLTRIM(cFilCarga)+cCarga,"DAK_TRANSP")

			MSExecAuto( { |x, y, z| OMSA200(x, y, z) }, aCabx, aItex, 6 )

			if za5->(dBseek(cCodCar))
				RecLock('ZA5',.f.)
				za5->(dbdelete())
				za5->(MsUnLock())
			endif

			cFilAnt := oRobo:cFilEst

			SC9->(DbSetOrder(1))
			SC9->(MsSeek(FWxFilial('SC9') + SC5->C5_NUM ))

			Do while !SC9->(EOF()) .AND. SC9->(C9_FILIAL + C9_PEDIDO ) == FWxFilial('SC9') + SC5->(C5_NUM )
				SC9->(a460Estorna(.T.))
				SC9->(DbSkip())
			EndDo

			SC9->(MsSeek(FWxFilial('SC9') + SC5->C5_NUM ))

			aAdd(aCabx, {"C5_NUM"    , SC5->C5_NUM              , Nil})
			aAdd(aCabx, {"C5_TIPO"   , "N"           			, nil}) // TIPO DO PEDIDO
			aAdd(aCabx, {"C5_CLIENTE", SC5->C5_CLIENTE          , nil}) // CÓDIGO DO CLIENTE
			aAdd(aCabx, {"C5_LOJACLI", SC5->C5_LOJACLI          , nil}) // LOJA DO CLIENTE
			aAdd(aCabx, {"C5_EMISSAO", SC5->C5_EMISSAO		    , nil}) // DATA DE EMISSÃO
			aAdd(aCabx, {"C5_CONDPAG", SC5->C5_CONDPAG	    	, nil}) // CONDIÇÃO
			aAdd(aCabx, {"C5_TRANSP" , cTranspDAK		    	, nil}) // TRANSPORTADORA da DAK
			aAdd(aCabx, {"C5_TABELA" , SC5->C5_TABELA   	   	, nil}) // TABELA DE PREÇO

			lMsErroAuto := .f.

			MSExecAuto({|x,y,z| Mata410(x,y,z)}, aCabx, aItex, 5)

			cFilAnt := cFilCarga

			oBrowse2:goTo(nEtapa)

			aDadosSta[nEtapa][1]             := "BR_VERDE"
			aDadosSta[nEtapa][3] 			 := "Estornado com sucesso"
			oBrowse2:oData:aArray[nEtapa][3] := "Estornado com sucesso"

			aDadosCar[nLBr1][6]             := "E"
			oBrowse1:oData:aArray[nLBr1][6] := "E"
			aDadosCar[nLBr1][5]             := "Erro Liberar estoque carga '"+alltrim(cCodCar)+"' Processo Retornado (RolBack)"
			oBrowse1:oData:aArray[nLBr1][5] := "Erro Liberar estoque Carga '"+alltrim(cCodCar)+"' Processo Retornado (RolBack)"
			nInd := 0
		else
			Logza5(cCodCar ,'3' ,'F'    ,cFilCarga,''      ,'',''     ,''     ,"Etapa 3 - finalizada OK" ,"LIBESTO" , ''     )
			cLogPro := ""

			aDadosSta[nEtapa][1]             := "BR_VERDE"
			aDadosSta[nEtapa][3] 			 := "Processado com sucesso"
			oBrowse2:oData:aArray[nEtapa][3] := "Processado com sucesso"

			aDadosCar[nLBr1][6]             := "F"
			oBrowse1:oData:aArray[nLBr1][6] := "F"
			aDadosCar[nLBr1][5]             := "OK"
			oBrowse1:oData:aArray[nLBr1][5] := "OK"
			nInd := 4
		endif
		oBrowse1:refresh()
		oBrowse2:refresh()
	endif
	if nInd == 4
		nEtapa  := 4
		cLogPro += "Rastreio : DOCSFE - Etapa : "+StrZero(nEtapa,2)+cQuebra

		Logza5(cCodCar ,'4','P'    ,cFilCarga,''      ,'',''     ,''     ,cLogPro ,"DOCSFE" , ''     )
		cLogPro := ""

		aDadosCar[nLBr1][5]             := "Processando FE: '"+alltrim(cCodCar)+"'"
		oBrowse1:oData:aArray[nLBr1][5] := "Processando FE: '"+alltrim(cCodCar)+"'"
		aDadosCar[nLBr1][6]             := "A"
		oBrowse1:oData:aArray[nLBr1][6] := "A"
		oBrowse1:refresh()
		oBrowse2:refresh()
		/*
			Se venda realizada pela filial 0105 no momento de gerar a nota de transferencia da filial 0104 para 0105
			Usa se a transporta de transferencia que esta contida na posição 9 do adadoscar
			Se a venda realizada pela filial 0104 usa-se a transportadora de venda usada na posição 7 do adadoscar
			aDadosCar[7] - Transportador - cXTransVen
			aDadosCar[8] - Transportadora Cross - cXTcross
			aDadosCar[9] - Transportadora transferencia - cXTTransf
		*/
		If aDadosCar[nLBr1][1] = '0105'
			cTranspDAK  := aDadosCar[nLBr1][9]  // Transportadora da transferencia
		Else
			cTranspDAK  := aDadosCar[nLBr1][7]	// Transportadora de venda 
		Endif
		MsAguarde({|| lSeq := oRobo:GerarDocSaida('DOCSFE', oRobo:cFilEst, aPedCar , aItOri, @aNotas,cTranspDAK,alltrim(cCodCar)) },"Aguarde...","Gerando documento de saída na FE...",.T.)

		if !lSeq

			cPar1 := 'DOCSFE'
			cPar2 := oRobo:cFilEst
			cPar3 := CenArr2Str(aPedCar,"|")
			cPar4 := CenArr2Str(aItOri,"|")
			cPar5 := CenArr2Str(aNotas,"|")
			cPar6 := ''

			cJsonRet := '{"Processo":"DOCSFE","Etapa":"4","Par1":"'+cPar1+'","Par2":"'+cPar2+'","Par3":"'+cPar3+'","Par4":"'+cPar4+'","Par5":"'+cPar5+'"}'

			Logza5(cCodCar ,'4' ,'E'    ,cFilCarga,''      ,'',''     ,''     ,cJsonRet ,"DOCSFE" , ''     )
			cJsonRet := ""

			oBrowse2:goTo(nEtapa)

			aDadosSta[nEtapa][1] := "BR_VERMELHO"
			aDadosSta[nEtapa][3] := "Erro ao processar"
			oBrowse2:oData:aArray[nEtapa][3] := "Erro ao processar"

			aDadosCar[nLBr1][6]             := "E"
			oBrowse1:oData:aArray[nLBr1][6] := "E"
			aDadosCar[nLBr1][5]             := "Erro na geracao da NF "
			oBrowse1:oData:aArray[nLBr1][5] :=  "Erro na geracao da NF "
			nInd := 0
		else
			Logza5(cCodCar ,'4' ,'F'    ,cFilCarga,''      ,'',''     ,''     ,"Etapa 4 - finalizada OK" ,"DOCSFE" , ''     )
			cLogPro := ""

			aDadosSta[nEtapa][1]             := "BR_VERDE"
			aDadosSta[nEtapa][3] 			 := "Processado com sucesso"
			oBrowse2:oData:aArray[nEtapa][3] := "Processado com sucesso"

			aDadosCar[nLBr1][6]             := "F"
			oBrowse1:oData:aArray[nLBr1][6] := "F"
			aDadosCar[nLBr1][5]             := "OK"
			oBrowse1:oData:aArray[nLBr1][5] := "OK"
			nInd := 5
		endif
		oBrowse1:refresh()
		oBrowse2:refresh()
	endif
	if nInd == 5
		nEtapa  := 5
		cLogPro += "Rastreio : NFE_FE - Etapa : "+StrZero(nEtapa,2)+cQuebra

		Logza5(cCodCar ,'5','P'    ,cFilCarga,''      ,'',''     ,''     ,cLogPro ,"NFE_FE" , ''     )
		cLogPro := ""

		aDadosCar[nLBr1][5]             := "Processando :  '"+alltrim(cCodCar)+"'"
		oBrowse1:oData:aArray[nLBr1][5] := "Processando :  '"+alltrim(cCodCar)+"'"
		aDadosCar[nLBr1][6]             := "A"
		oBrowse1:oData:aArray[nLBr1][6] := "A"
		oBrowse1:refresh()
		oBrowse2:refresh()

		MsAguarde({|| lSeq := oRobo:TransmiteNFe('NFE_FE', oRobo:cFilEst, @aNotas,cCodCar) },"Aguarde...","Transmitindo notas para SEFAZ...",.T.)

		if !lSeq

			cPar1 := 'NFE_FE'
			cPar2 := oRobo:cFilEst
			cPar3 := CenArr2Str(aNotas,"|")
			cPar4 := ''
			cPar5 := ''
			cPar6 := ''

			cJsonRet := '{"Processo":"NFE_FE","Etapa":"5","Par1":"'+cPar1+'","Par2":"'+cPar2+'","Par3":"'+cPar3+'","Par4":"'+cPar4+'","Par5":"'+cPar5+'","Par6":"'+cPar6+'"}'

			Logza5(cCodCar ,'5' ,'E'    ,cFilCarga,''      ,'',''     ,''     ,cJsonRet ,"NFE_FE" , ''     )
			cJsonRet := ""

			oBrowse2:goTo(nEtapa)

			aDadosSta[nEtapa][1] := "BR_VERMELHO"
			aDadosSta[nEtapa][3] := "Erro ao processar"
			oBrowse2:oData:aArray[nEtapa][3] := "Erro ao processar"

			aDadosCar[nLBr1][6]             := "E"
			oBrowse1:oData:aArray[nLBr1][6] := "E"
			aDadosCar[nLBr1][5]             := "Erro transmissao "
			oBrowse1:oData:aArray[nLBr1][5] := "Erro transmissao "
			nInd := 0
		else
			Logza5(cCodCar ,'5' ,'F'    ,cFilCarga,''      ,'',''     ,''     ,"Etapa 5 - finalizada OK" ,"NFE_FE" , ''     )
			cLogPro := ""

			aDadosSta[nEtapa][1]             := "BR_VERDE"
			aDadosSta[nEtapa][3] 			 := "Processado com sucesso"
			oBrowse2:oData:aArray[nEtapa][3] := "Processado com sucesso"

			aDadosCar[nLBr1][6]             := "F"
			oBrowse1:oData:aArray[nLBr1][6] := "F"
			aDadosCar[nLBr1][5]             := "OK"
			oBrowse1:oData:aArray[nLBr1][5] := "OK"
			nInd := 6
		endif
		oBrowse1:refresh()
		oBrowse2:refresh()
	endif
	if nInd == 6
		nEtapa  := 6
		cLogPro += "Rastreio : AUT_FE - Etapa : "+StrZero(nEtapa,2)+cQuebra

		Logza5(cCodCar ,'6','P'    ,cFilCarga,''      ,'',''     ,''     ,cLogPro ,"AUT_FE" , ''     )
		cLogPro := ""

		aDadosCar[nLBr1][5]             := "Processando :  '"+alltrim(cCodCar)+"'"
		oBrowse1:oData:aArray[nLBr1][5] := "Processando :  '"+alltrim(cCodCar)+"'"
		aDadosCar[nLBr1][6]             := "A"
		oBrowse1:oData:aArray[nLBr1][6] := "A"
		oBrowse1:refresh()
		oBrowse2:refresh()

		MsAguarde({|| lSeq := oRobo:MonitorarNFe('AUT_FE', oRobo:cFilEst, @aNotas) },"Aguarde...","Monitorando retorno do SEFAZ...",.T.)

		if !lSeq
			cPar1 := 'AUT_FE'
			cPar2 := oRobo:cFilEst
			cPar3 := CenArr2Str(aNotas,"|")
			cPar4 := ''
			cPar5 := ''
			cPar6 := ''

			cJsonRet := '{"Processo":"AUT_FE","Etapa":"6","Par1":"'+cPar1+'","Par2":"'+cPar2+'","Par3":"'+cPar3+'","Par4":"'+cPar4+'","Par5":"'+cPar5+'","Par6":"'+cPar6+'"}'

			Logza5(cCodCar ,'6' ,'E'    ,cFilCarga,''      ,'',''     ,''     ,cJsonRet ,"AUT_FE" , ''     )
			cJsonRet := ""

			oBrowse2:goTo(nEtapa)

			aDadosSta[nEtapa][1] := "BR_VERMELHO"
			aDadosSta[nEtapa][3] := "Erro ao processar"
			oBrowse2:oData:aArray[nEtapa][3] := "Erro ao processar"
			
			aDadosCar[nLBr1][6]             := "E"
			oBrowse1:oData:aArray[nLBr1][6] := "E"
			aDadosCar[nLBr1][5]             := "Erro retorno SEFAZ "
			oBrowse1:oData:aArray[nLBr1][5] := "Erro retorno SEFAZ "
			nInd := 0
		else
			Logza5(cCodCar ,'6' ,'F'    ,cFilCarga,''      ,'',''     ,''     ,"Etapa 5 - finalizada OK" ,"AUT_FE" , ''     )
			cLogPro := ""

			aDadosSta[nEtapa][1]             := "BR_VERDE"
			aDadosSta[nEtapa][3] 			 := "Processado com sucesso"
			oBrowse2:oData:aArray[nEtapa][3] := "Processado com sucesso"

			aDadosCar[nLBr1][6]             := "F"
			oBrowse1:oData:aArray[nLBr1][6] := "F"
			aDadosCar[nLBr1][5]             := "OK"
			oBrowse1:oData:aArray[nLBr1][5] := "OK"
			nInd := 7
		endif
		oBrowse1:refresh()
		oBrowse2:refresh()
	endif
	if nInd == 7
		nEtapa  := 7
		cLogPro += "Rastreio : DAN_FE - Etapa : "+StrZero(nEtapa,2)+cQuebra

		Logza5(cCodCar ,'7','P'    ,cFilCarga,''      ,'',''     ,''     ,cLogPro ,"DAN_FE" , ''     )
		cLogPro := ""

		aDadosCar[nLBr1][5]             := "Processando :  '"+alltrim(cCodCar)+"'"
		oBrowse1:oData:aArray[nLBr1][5] := "Processando :  '"+alltrim(cCodCar)+"'"
		aDadosCar[nLBr1][6]             := "A"
		oBrowse1:oData:aArray[nLBr1][6] := "A"
		oBrowse1:refresh()
		oBrowse2:refresh()

		MsAguarde({|| lSeq := oRobo:ImpDANFE('DAN_FE',  oRobo:cFilEst, @aNotas,cCodCar) },"Aguarde...","Imprimindo DANFEs...",.T.)

		if !lSeq
			cPar1 := 'DAN_FE'
			cPar2 := oRobo:cFilEst
			cPar3 := CenArr2Str(aNotas,"|")
			cPar4 := ''
			cPar5 := ''
			cPar6 := ''

			cJsonRet := '{"Processo":"DAN_FE","Etapa":"7","Par1":"'+cPar1+'","Par2":"'+cPar2+'","Par3":"'+cPar3+'","Par4":"'+cPar4+'","Par5":"'+cPar5+'","Par6":"'+cPar6+'"}'

			Logza5(cCodCar ,'7' ,'E'    ,cFilCarga,''      ,'',''     ,''     ,cJsonRet ,"DAN_FE" , ''     )
			cJsonRet := ""

			oBrowse2:goTo(nEtapa)

			aDadosSta[nEtapa][1] := "BR_VERMELHO"
			aDadosSta[nEtapa][3] := "Erro ao processar"
			oBrowse2:oData:aArray[nEtapa][3] := "Erro ao processar"

			aDadosCar[nLBr1][6]             := "E"
			oBrowse1:oData:aArray[nLBr1][6] := "E"
			aDadosCar[nLBr1][5]             := "Erro imprimir DANFE "
			oBrowse1:oData:aArray[nLBr1][5] := "Erro imprimir DANFE "
			nInd := 0
		else
			Logza5(cCodCar ,'7' ,'F'    ,cFilCarga,''      ,'',''     ,''     ,"Etapa 5 - finalizada OK" ,"DAN_FE" , ''     )
			cLogPro := ""

			aDadosSta[nEtapa][1]             := "BR_VERDE"
			aDadosSta[nEtapa][3] 			 := "Processado com sucesso"
			oBrowse2:oData:aArray[nEtapa][3] := "Processado com sucesso"

			aDadosCar[nLBr1][6]             := "F"
			oBrowse1:oData:aArray[nLBr1][6] := "F"
			aDadosCar[nLBr1][5]             := "OK"
			oBrowse1:oData:aArray[nLBr1][5] := "OK"
			nInd := 8
		endif
		oBrowse1:refresh()
		oBrowse2:refresh()
	endif
	if nInd == 8
		nEtapa  := 8
		cLogPro += "Rastreio : DOCEFV - Etapa : "+StrZero(nEtapa,2)+cQuebra

		cFilVenr := cFilCarga
		cFilEstr := oRobo:cFilEst
		cFilIntr := ''

		Logza5(cCodCar ,'8','P'    ,cFilCarga,''      ,'',''     ,''     ,cLogPro ,"DOCEFV" , ''     )
		cLogPro := ""

		aDadosCar[nLBr1][5]             := "Processando :  '"+alltrim(cCodCar)+"'"
		oBrowse1:oData:aArray[nLBr1][5] := "Processando :  '"+alltrim(cCodCar)+"'"
		aDadosCar[nLBr1][6]             := "A"
		oBrowse1:oData:aArray[nLBr1][6] := "A"
		oBrowse1:refresh()
		oBrowse2:refresh()

		aNotaFV := {}

		MsAguarde({|| lSeq := oRobo:GerarDocEntrada( 'DOCEFV',;
		cFilCarga,; //destino
		oRobo:cFilEst,; //origem
		aNotas  ,;
		@aNotaFV) },"Aguarde...","Gerando documento entrada na FV...",.T.)

		if !lSeq
			cPar1 := 'DOCEFV'
			cPar2 := cFilCarga
			cPar3 := oRobo:cFilEst
			cPar4 := CenArr2Str(aNotas,"|")
			cPar5 := CenArr2Str(aNotaFV,"|")
			cPar6 := ''

			cJsonRet := '{"Processo":"DOCEFV","Etapa":"8","Par1":"'+cPar1+'","Par2":"'+cPar2+'","Par3":"'+cPar3+'","Par4":"'+cPar4+'","Par5":"'+cPar5+'","Par6":"'+cPar6+'"}'

			Logza5(cCodCar ,'8' ,'E'    ,cFilCarga,''      ,'',''     ,''     ,cJsonRet ,"DOCEFV" , ''     )
			cJsonRet := ""

			oBrowse2:goTo(nEtapa)

			aDadosSta[nEtapa][1] := "BR_VERMELHO"
			aDadosSta[nEtapa][3] := "Erro ao processar"
			oBrowse2:oData:aArray[nEtapa][3] := "Erro ao processar"

			aDadosCar[nLBr1][6]             := "E"
			oBrowse1:oData:aArray[nLBr1][6] := "E"
			aDadosCar[nLBr1][5]             := "Erro documento entrada na FV "
			oBrowse1:oData:aArray[nLBr1][5] := "Erro documento entrada na FV "
			nInd := 0
		else
			Logza5(cCodCar ,'8' ,'F'    ,cFilCarga,''      ,'',''     ,''     ,"Etapa 5 - finalizada OK" ,"DOCEFV" , ''     )
			cLogPro := ""

			aDadosSta[nEtapa][1]             := "BR_VERDE"
			aDadosSta[nEtapa][3] 			 := "Processado com sucesso"
			oBrowse2:oData:aArray[nEtapa][3] := "Processado com sucesso"

			aDadosCar[nLBr1][6]             := "F"
			oBrowse1:oData:aArray[nLBr1][6] := "F"
			aDadosCar[nLBr1][5]             := "OK"
			oBrowse1:oData:aArray[nLBr1][5] := "OK"
			nInd := 9
		endif
		oBrowse1:refresh()
		oBrowse2:refresh()
	endif
	if nInd == 9
		nEtapa  := 9
		cLogPro += "Rastreio : DLOTFV - Etapa : "+StrZero(nEtapa,2)+cQuebra

		Logza5(cCodCar ,'9','P'    ,cFilCarga,''      ,'',''     ,''     ,cLogPro ,"DLOTFV" , ''     )
		cLogPro := ""

		aDadosCar[nLBr1][5]             := "Processando :  '"+alltrim(cCodCar)+"'"
		oBrowse1:oData:aArray[nLBr1][5] := "Processando :  '"+alltrim(cCodCar)+"'"
		aDadosCar[nLBr1][6]             := "A"
		oBrowse1:oData:aArray[nLBr1][6] := "A"
		oBrowse1:refresh()
		oBrowse2:refresh()

		MsAguarde({|| lOk := oRobo:DistribuiLotes("DLOTFV", aNotaFV) },"Aguarde...","Distribuindo lotes no pedido da FV...",.T.)

		if !lSeq
			cPar1 := 'DLOTFV'
			cPar2 := CenArr2Str(aNotaFV,"|")
			cPar3 := ''
			cPar4 := ''
			cPar5 := ''
			cPar6 := ''

			cJsonRet := '{"Processo":"DLOTFV","Etapa":"9","Par1":"'+cPar1+'","Par2":"'+cPar2+'","Par3":"'+cPar3+'","Par4":"'+cPar4+'","Par5":"'+cPar5+'","Par6":"'+cPar6+'"}'

			Logza5(cCodCar ,'9' ,'E'    ,cFilCarga,''      ,'',''     ,''     ,cJsonRet ,"DLOTFV" , ''     )
			cJsonRet := ""

			oBrowse2:goTo(nEtapa)

			aDadosSta[nEtapa][1] := "BR_VERMELHO"
			aDadosSta[nEtapa][3] := "Erro ao processar"
			oBrowse2:oData:aArray[nEtapa][3] := "Erro ao processar"

			aDadosCar[nLBr1][6]             := "E"
			oBrowse1:oData:aArray[nLBr1][6] := "E"
			aDadosCar[nLBr1][5]             := "Distribuindo lotes no pedido da FV "
			oBrowse1:oData:aArray[nLBr1][5] := "Distribuindo lotes no pedido da FV "
			nInd := 0
		else
			Logza5(cCodCar ,'9' ,'F'    ,cFilCarga,''      ,'',''     ,''     ,"Etapa 5 - finalizada OK" ,"DLOTFV" , ''     )
			cLogPro := ""

			aDadosSta[nEtapa][1]             := "BR_VERDE"
			aDadosSta[nEtapa][3] 			 := "Processado com sucesso"
			oBrowse2:oData:aArray[nEtapa][3] := "Processado com sucesso"

			aDadosCar[nLBr1][6]             := "F"
			oBrowse1:oData:aArray[nLBr1][6] := "F"
			aDadosCar[nLBr1][5]             := "OK"
			oBrowse1:oData:aArray[nLBr1][5] := "OK"
			nInd := 10
		endif
		oBrowse1:refresh()
		oBrowse2:refresh()
	endif
	if nInd == 10
		nEtapa  := 10
		cLogPro += "Rastreio : LIBESTO2 - Etapa : "+StrZero(nEtapa,2)+cQuebra

		Logza5(cCodCar ,'A','P'    ,cFilCarga,''      ,'',''     ,''     ,cLogPro ,"LIBESTO2" , ''     )
		cLogPro := ""

		aDadosCar[nLBr1][5]             := "Processando :  '"+alltrim(cCodCar)+"'"
		oBrowse1:oData:aArray[nLBr1][5] := "Processando :  '"+alltrim(cCodCar)+"'"
		aDadosCar[nLBr1][6]             := "A"
		oBrowse1:oData:aArray[nLBr1][6] := "A"
		oBrowse1:refresh()
		oBrowse2:refresh()

		MsAguarde({|| lSeq := oRobo:LiberaEstoque("LIBESTO2",cFilVenr, aPedCar, aItOri, @aNotaFV) },"Aguarde...","Liberando estoque ...",.T.)

		if !lSeq
			cPar1 := 'LIBESTO2'
			cPar2 := cFilVenr
			cPar3 := CenArr2Str(aPedCar,"|")
			cPar4 := CenArr2Str(aItOri,"|")
			cPar5 := CenArr2Str(aNotaFV,"|")
			cPar6 := ''

			cJsonRet := '{"Processo":"LIBESTO2","Etapa":"10","Par1":"'+cPar1+'","Par2":"'+cPar2+'","Par3":"'+cPar3+'","Par4":"'+cPar4+'","Par5":"'+cPar5+'","Par6":"'+cPar6+'"}'

			Logza5(cCodCar ,'10' ,'E'    ,cFilCarga,''      ,'',''     ,''     ,cJsonRet ,"LIBESTO2" , ''     )
			cJsonRet := ""

			oBrowse2:goTo(nEtapa)

			aDadosSta[nEtapa][1] := "BR_VERMELHO"
			aDadosSta[nEtapa][3] := "Erro ao processar"
			oBrowse2:oData:aArray[nEtapa][3] := "Erro ao processar"

			aDadosCar[nLBr1][6]             := "E"
			oBrowse1:oData:aArray[nLBr1][6] := "E"
			aDadosCar[nLBr1][5]             := "Erro Liberar estoque FV "
			oBrowse1:oData:aArray[nLBr1][5] := "Erro Liberar estoque FV "
			nInd := 0
		else
			Logza5(cCodCar ,'A' ,'F'    ,cFilCarga,''      ,'',''     ,''     ,"Etapa 5 - finalizada OK" ,"LIBESTO2" , ''     )
			cLogPro := ""

			aDadosSta[nEtapa][1]             := "BR_VERDE"
			aDadosSta[nEtapa][3] 			 := "Processado com sucesso"
			oBrowse2:oData:aArray[nEtapa][3] := "Processado com sucesso"

			aDadosCar[nLBr1][6]             := "F"
			oBrowse1:oData:aArray[nLBr1][6] := "F"
			aDadosCar[nLBr1][5]             := "OK"
			oBrowse1:oData:aArray[nLBr1][5] := "OK"
			nInd := 11
		endif
		oBrowse1:refresh()
		oBrowse2:refresh()
	endif
	if nInd == 11
		nEtapa  := 11
		cLogPro += "Rastreio : DOCSFV - Etapa : "+StrZero(nEtapa,2)+cQuebra

		Logza5(cCodCar ,'B','P'    ,cFilCarga,''      ,'',''     ,''     ,cLogPro ,"DOCSFV" , ''     )
		cLogPro := ""

		aDadosCar[nLBr1][5]             := "Processando FV: '"+alltrim(cCodCar)+"'"
		oBrowse1:oData:aArray[nLBr1][5] := "Processando FV: '"+alltrim(cCodCar)+"'"
		aDadosCar[nLBr1][6]             := "A"
		oBrowse1:oData:aArray[nLBr1][6] := "A"
		oBrowse1:refresh()
		oBrowse2:refresh()

		aNotaFV := {}
		/*
			Se filial venda = 0104 usa a transportadora de venda localizada na posição 7 do adadoscar
			Se filial venda = 0105 apos a tranferencia já realizada usa-se a filial de venda desde que 
			a transportadora cross esteja vazia		
			aDadosCar[7] - Transportador - cXTransVen
			aDadosCar[8] - Transportadora Cross - cXTcross
			aDadosCar[9] - Transportadora transferencia - cXTTransf
		*/
		If aDadosCar[nLBr1][1] ='0105'   				// Se a venda é da filial 0105
			If empty(aDadosCar[nLBr1][8])				// se view Tcross vazia
				cTranspDAK  := aDadosCar[nLBr1][7]		// usa-se transportadora de venda
			Else
				cTranspDAK  := aDadosCar[nLBr1][8]		// Usa-se tranportador Tcross
			Endif
		Else
			cTranspDAK  := aDadosCar[nLBr1][7]   		// Transportadora de venda
		Endif
		MsAguarde({|| lSeq := oRobo:GerarDocSaida("DOCSFV", cFilVenr , aPedCar , aItOri, @aNotaFV,cTranspDAK,alltrim(cCodCar)) },"Aguarde...","Gerando documento de saída na FV...",.T.)

		if !lSeq
			cPar1 := 'DOCSFV'
			cPar2 := cFilVenr
			cPar3 := CenArr2Str(aPedCar,"|")
			//cPar4 := CenArr2Str(aItOri,"|")
			//cPar5 := CenArr2Str(aNotaFV,"|")
			cPar6 := ''

			cJsonRet := '{"Processo":"DOCSFV","Etapa":"11","Par1":"'+cPar1+'","Par2":"'+cPar2+'","Par3":"'+cPar3+'","Par4":"'+cPar4+'","Par5":"'+cPar5+'","Par6":"'+cPar6+'"}'

			Logza5(cCodCar ,'11' ,'E'    ,cFilCarga,''      ,'',''     ,''     ,cJsonRet ,"DOCSFV" , ''     )
			cJsonRet := ""

			oBrowse2:goTo(nEtapa)

			aDadosSta[nEtapa][1] := "BR_VERMELHO"
			aDadosSta[nEtapa][3] := "Erro ao processar"
			oBrowse2:oData:aArray[nEtapa][3] := "Erro ao processar"

			aDadosCar[nLBr1][6]             := "E"
			oBrowse1:oData:aArray[nLBr1][6] := "E"
			aDadosCar[nLBr1][5]             := "Erro gerar ao documento de saida "
			oBrowse1:oData:aArray[nLBr1][5] := "Erro gerar ao documento de saida "
			nInd := 0
		else
			Logza5(cCodCar ,'B' ,'F'    ,cFilCarga,''      ,'',''     ,''     ,"Etapa 5 - finalizada OK" ,"DOCSFV" , ''     )
			cLogPro := ""

			aDadosSta[nEtapa][1]             := "BR_VERDE"
			aDadosSta[nEtapa][3] 			 := "Processado com sucesso"
			oBrowse2:oData:aArray[nEtapa][3] := "Processado com sucesso"

			aDadosCar[nLBr1][6]             := "F"
			oBrowse1:oData:aArray[nLBr1][6] := "F"
			aDadosCar[nLBr1][5]             := "OK"
			oBrowse1:oData:aArray[nLBr1][5] := "OK"
			nInd := 12
		endif
		oBrowse1:refresh()
		oBrowse2:refresh()
	endif
	if nInd == 12
		nEtapa  := 12
		cLogPro += "Rastreio : NFE_FV - Etapa : "+StrZero(nEtapa,2)+cQuebra

		Logza5(cCodCar ,'C','P'    ,cFilCarga,''      ,'',''     ,''     ,cLogPro ,"NFE_FV" , ''     )
		cLogPro := ""

		aDadosCar[nLBr1][5]             := "Processando :  '"+alltrim(cCodCar)+"'"
		oBrowse1:oData:aArray[nLBr1][5] := "Processando :  '"+alltrim(cCodCar)+"'"
		aDadosCar[nLBr1][6]             := "A"
		oBrowse1:oData:aArray[nLBr1][6] := "A"
		oBrowse1:refresh()
		oBrowse2:refresh()

		MsAguarde({|| lOk := oRobo:TransmiteNFe("NFE_FV", cFilVenr, @aNotaFV,cCodCar) },"Aguarde...","Transmitindo notas para SEFAZ na FV...",.T.)

		if !lSeq
			cPar1 := 'NFE_FV'
			cPar2 := cFilVenr
			cPar3 := CenArr2Str(aNotaFV,"|")
			cPar4 := ''
			cPar5 := ''
			cPar6 := ''

			cJsonRet := '{"Processo":"NFE_FV","Etapa":"12","Par1":"'+cPar1+'","Par2":"'+cPar2+'","Par3":"'+cPar3+'","Par4":"'+cPar4+'","Par5":"'+cPar5+'","Par6":"'+cPar6+'"}'

			Logza5(cCodCar ,'12' ,'E'    ,cFilCarga,''      ,'',''     ,''     ,cJsonRet ,"NFE_FV" , ''     )
			cJsonRet := ""

			oBrowse2:goTo(nEtapa)

			aDadosSta[nEtapa][1] := "BR_VERMELHO"
			aDadosSta[nEtapa][3] := "Erro ao processar"
			oBrowse2:oData:aArray[nEtapa][3] := "Erro ao processar"

			aDadosCar[nLBr1][6]             := "E"
			oBrowse1:oData:aArray[nLBr1][6] := "E"
			aDadosCar[nLBr1][5]             := "Erro Transmitir notas para SEFAZ "
			oBrowse1:oData:aArray[nLBr1][5] := "Erro Transmitir notas para SEFAZ "
			nInd := 0
		else
			Logza5(cCodCar ,'C' ,'F'    ,cFilCarga,''      ,'',''     ,''     ,"Etapa 5 - finalizada OK" ,"NFE_FV" , ''     )
			cLogPro := ""

			aDadosSta[nEtapa][1]             := "BR_VERDE"
			aDadosSta[nEtapa][3] 			 := "Processado com sucesso"
			oBrowse2:oData:aArray[nEtapa][3] := "Processado com sucesso"

			aDadosCar[nLBr1][6]             := "F"
			oBrowse1:oData:aArray[nLBr1][5] := "F"
			aDadosCar[nLBr1][5]             := "OK"
			oBrowse1:oData:aArray[nLBr1][6] := "OK"
			nInd := 13
		endif
		oBrowse1:refresh()
		oBrowse2:refresh()
	endif
	if nInd == 13
		nEtapa  := 13
		cLogPro += "Rastreio : AUT_FV - Etapa : "+StrZero(nEtapa,2)+cQuebra

		Logza5(cCodCar ,'D','P'    ,cFilCarga,''      ,'',''     ,''     ,cLogPro ,"AUT_FV" , ''     )
		cLogPro := ""

		aDadosCar[nLBr1][5]             := "Processando :  '"+alltrim(cCodCar)+"'"
		oBrowse1:oData:aArray[nLBr1][5] := "Processando :  '"+alltrim(cCodCar)+"'"
		aDadosCar[nLBr1][6]             := "A"
		oBrowse1:oData:aArray[nLBr1][6] := "A"
		oBrowse1:refresh()
		oBrowse2:refresh()

		MsAguarde({|| lOk := oRobo:MonitorarNFe("AUT_FV", cFilVenr, @aNotaFV) },"Aguarde...","Monitorando retorno do SEFAZ na FV...",.T.)

		if !lSeq
			cPar1 := 'AUT_FV'
			cPar2 := cFilVenr
			cPar3 := CenArr2Str(aNotaFV,"|")
			cPar4 := ''
			cPar5 := ''
			cPar6 := ''

			cJsonRet := '{"Processo":"AUT_FV","Etapa":"13","Par1":"'+cPar1+'","Par2":"'+cPar2+'","Par3":"'+cPar3+'","Par4":"'+cPar4+'","Par5":"'+cPar5+'","Par6":"'+cPar6+'"}'

			Logza5(cCodCar ,'13' ,'E'    ,cFilCarga,''      ,'',''     ,''     ,cJsonRet ,"AUT_FV" , ''     )
			cJsonRet := ""

			oBrowse2:goTo(nEtapa)

			aDadosSta[nEtapa][1] := "BR_VERMELHO"
			aDadosSta[nEtapa][3] := "Erro ao processar"
			oBrowse2:oData:aArray[nEtapa][3] := "Erro ao processar"

			aDadosCar[nLBr1][6]             := "E"
			oBrowse1:oData:aArray[nLBr1][6] := "E"
			aDadosCar[nLBr1][5]             := "Erro retorno SEFAZ "
			oBrowse1:oData:aArray[nLBr1][5] := "Erro retorno SEFAZ "
			nInd := 0
		else
			Logza5(cCodCar ,'D' ,'F'    ,cFilCarga,''      ,'',''     ,''     ,"Etapa 5 - finalizada OK" ,"AUT_FV" , ''     )
			cLogPro := ""

			aDadosSta[nEtapa][1]             := "BR_VERDE"
			aDadosSta[nEtapa][3] 			 := "Processado com sucesso"
			oBrowse2:oData:aArray[nEtapa][3] := "Processado com sucesso"

			aDadosCar[nLBr1][6]             := "F"
			oBrowse1:oData:aArray[nLBr1][6] := "F"
			aDadosCar[nLBr1][5]             := "OK"
			oBrowse1:oData:aArray[nLBr1][5] := "OK"
			nInd := 14
		endif
		oBrowse1:refresh()
		oBrowse2:refresh()
	endif
	if nInd == 14
		nEtapa  := 14
		cLogPro += "Rastreio : DAN_FV - Etapa : "+StrZero(nEtapa,2)+cQuebra

		Logza5(cCodCar ,'E','P'    ,cFilCarga,''      ,'',''     ,''     ,cLogPro ,"DAN_FV" , ''     )
		cLogPro := ""

		aDadosCar[nLBr1][5]             := "Processando :  '"+alltrim(cCodCar)+"'"
		oBrowse1:oData:aArray[nLBr1][5] := "Processando :  '"+alltrim(cCodCar)+"'"
		aDadosCar[nLBr1][6]             := "A"
		oBrowse1:oData:aArray[nLBr1][6] := "A"
		oBrowse1:refresh()
		oBrowse2:refresh()

		//MsAguarde({|| lOk := oRobo:ImpDANFE("DAN_FV", cFilVenr, @aNotaFV,cCodCar) },"Aguarde...","Imprimindo DANFEs na FV...",.T.)
		MsAguarde({|| lOk := u_afina003(aNotaFV) },"Aguarde...","Imprimindo DANFEs\Boletos na FV...",.T.)
		//lOk := u_afina003(aNotaFV)
		if !lSeq
			cPar1 := 'DAN_FV'
			cPar2 := cFilVenr
			cPar3 := CenArr2Str(aNotaFV,"|")
			cPar4 := ''
			cPar5 := ''
			cPar6 := ''

			cJsonRet := '{"Processo":"AUT_FV","Etapa":"14","Par1":"'+cPar1+'","Par2":"'+cPar2+'","Par3":"'+cPar3+'","Par4":"'+cPar4+'","Par5":"'+cPar5+'","Par6":"'+cPar6+'"}'

			Logza5(cCodCar ,'14' ,'E'    ,cFilCarga,''      ,'',''     ,''     ,cJsonRet ,"DAN_FV" , ''     )
			cJsonRet := ""

			oBrowse2:goTo(nEtapa)

			aDadosSta[nEtapa][1] := "BR_VERMELHO"
			aDadosSta[nEtapa][3] := "Erro ao processar"
			oBrowse2:oData:aArray[nEtapa][3] := "Erro ao processar"

			aDadosCar[nLBr1][6]             := "E"
			oBrowse1:oData:aArray[nLBr1][6] := "E"
			aDadosCar[nLBr1][5]             := "Erro impressao SEFAZ "
			oBrowse1:oData:aArray[nLBr1][5] := "Erro impressao SEFAZ "
		else
			Logza5(cCodCar ,'E' ,'F'    ,cFilCarga,''      ,'',''     ,''     ,"Etapa 5 - finalizada OK" ,"DAN_FV" , ''     )
			cLogPro := ""

			aDadosSta[nEtapa][1]             := "BR_VERDE"
			aDadosSta[nEtapa][3] 			 := "Processado com sucesso"
			oBrowse2:oData:aArray[nEtapa][3] := "Processado com sucesso"

			aDadosCar[nLBr1][6]             := "F"
			oBrowse1:oData:aArray[nLBr1][6] := "F"
			aDadosCar[nLBr1][5]             := "OK"
			oBrowse1:oData:aArray[nLBr1][5] := "OK"

			//lOk := u_afina003(aNotaFV)

		endif
		oBrowse1:refresh()
		oBrowse2:refresh()
	endif

	//aDadosCar[nLBr1][9] := aClone(aDadosSta)
	aDadosCar[nLBr1][10] := aClone(aDadosSta)

	if nLBr1+1 <= len(aDadosCar)
		//aDadosSta := aClone(aDadosCar[nLBr1+1][9])
		aDadosSta := aClone(aDadosCar[nLBr1+1][10])
		oBrowse2:oData:aArray := aClone(aDadosSta)
		oBrowse2:GoTop()
		oBrowse2:refresh()
	endif

return
/*Grava o log de acompanhamento*/
Static Function Logza5(nChave,cStart,cStatus,cFilPed,cFilEnt,cPedVen,cSerSai,cNotSai,cLogZa5,cCodCli,cLojCli)

	Local lRet := .t.
	If valtype(nChave) == 'N'
		nChave := Strzero(nChave,10)
	Endif

	If !za5->(dBseek(nChave))
		IF Empty(CFILPED)
			CFILPED:=cFilAnt
		EndIf

		RecLock('ZA5',.t.)
		za5->za5_filial := XFILIAL("ZA5")
		za5->za5_chave  := nChave
		za5->za5_log    := cLogZa5
	Else
		//za5->(dBseek(nChave))
		RecLock('ZA5',.f.)
		za5->za5_log    := za5->za5_log + cQuebra + cLogZa5
	Endif
	za5->za5_etapa  := cStart
	za5->za5_ETRIAN := cCodCli
	za5->za5_lojcli := cLojCli
	za5->za5_status := cStatus
	za5->za5_filped := cFilPed
	za5->za5_filent := cFilEnt
	za5->za5_pedido := Alltrim(StrTran(cPedVen,'|'))
	za5->za5_sersai := cSerSai
	za5->za5_nota   := cNotSai
	za5->za5_data   := date()
	za5->za5_hora   := time()
	MsUnlock()

	za5->(dBseek(nChave+za5->za5_etapa))

Return lRet
/* posiciona na etapa para continuar o processo*/
static function fBusErro(cCarga)

	Local nX   := 0
	Local cArq := getNextAlias()

	BEGINSQL Alias cArq
		SELECT *
		FROM %table:ZA5% ZA5
		WHERE ZA5.D_E_L_E_T_ <> '*'
		AND ZA5_CHAVE = %EXP:cCarga%
	ENDSQL

	if (cArq)->ZA5_ETAPA = 'A'
		nX         := 10
	elseif (cArq)->ZA5_ETAPA = 'B'
		nX         := 11
	elseif (cArq)->ZA5_ETAPA = 'C'
		nX         := 12
	elseif (cArq)->ZA5_ETAPA = 'D'
		nX         := 13
	elseif (cArq)->ZA5_ETAPA = 'E'
		nX         := 14
	Else
		nX         := VAL((cArq)->ZA5_ETAPA)
	endif
	(cArq)->(dBcloseArea())

return Nx



Static Function testabol()
	Local lOk 		:= .f.
	Local aPergs	:= {}
	Local aNotaFV	:= {}
	Private cPerg       := FUNNAME()+'A'

	aAdd(aPergs,{"Carga : "          ,"C",6,0,"",})

	u_SX1ATU(cPerg,aPergs)
	If Pergunte(cPerg,.T.)
		dak->(dBsetOrder(1))
		If dak->(dBseek(xFilial('DAK')+mv_par01))
			If dai->(dBseek(xFilial('DAI')+dak->dak_cod))
				Do While dai->(dai_filial+dai_cod+dai_seqcar) == dak->(dak_filial+dak_cod+dak_seqcar)
					aAdd(aNotaFV, {dai->dai_nfiscal,dai->dai_serie, " ", "",{}} ) //adiciono a nota no vetor de notas fiscais
					dai->(dBskip())
				Enddo
			Endif
			If len(aNotaFv) > 0
				//MsAguarde({|| lOk := u_afina003(aNotaFV) },"Aguarde...","Imprimindo Boletos da FV...",.T.)
				//FwMsgRun(,{|oSay| lOk := u_afina003(aNotaFV) },"Aguarde...","Imprimindo Boletos da FV...")
				lOk := u_afina003(aNotaFV)
			Endif
		Endif
	Endif
Return lOk

