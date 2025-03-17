#INCLUDE "protheus.ch"
#INCLUDE "rwmake.ch"
#INCLUDE "topconn.ch"
#DEFINE CRLF CHR(13)+CHR(10)

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ RAPRA001    ¦ Autor ¦ Totvs            ¦ Data ¦ 02/04/2014 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Cadastro de Despesas - Controle de Apropriacao         	  ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function RAPRA001
Private cCadastro 	:= "Despesas a Apropriar"
Private aRotina 	:= {{"Pesquisar"	,"AxPesqui"  ,0,1} ,;
						{"Visualizar"	,"U_APRA001A",0,2} ,;
{"Incluir"		,"U_APRA001A",0,3} ,;
{"Alterar"		,"U_APRA001A",0,4} ,;
{"Excluir"		,"U_APRA001A",0,5} ,;
{"Inativar / Reativar"	  ,"U_APRA001A",0,6} ,;
{"Legenda"		,"U_APR01LEG",0,2,,.F.}}
Private cDelFunc := ".T." // Validacao para a exclusao. Pode-se utilizar ExecBlock
Private cString  := "ZC5"
Private cPerg    := "RAPRA001"

Private nP12T		:= 0
Private nP12B		:= 0
Private nP12R		:= 0

If '12' $ cVersao //para a versao do Protheus 12 não tem tema
	nP12T := 30 // Top
	nP12B := 30 // Bottom
// 		nP12R // Right
EndIf

aCores := {{"ZC5_STATUS == 'S' .AND. ZC5_LA != 'S'", "BR_VERDE" },;
{"ZC5_STATUS == 'S' .AND. ZC5_LA == 'S'", "BR_VERMELHO" },;
{"ZC5_STATUS == 'N'", "BR_CINZA" }}

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Carrega funcao Pergunte									     ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
AjustaSX1()
SetKey (VK_F12,{|a,b| AcessaPerg(cPerg,.T.)})
pergunte(cPerg,.F.)

dbSelectArea(cString)
dbSetOrder(1)
mBrowse( 6,1,22,75,cString,,,,,6,aCores) //mBrowse( 6,1,22,75,cString,,,,,,U_APR01LEG())

Return

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ APR01LEG    ¦ Autor ¦ Totvs            ¦ Data ¦ 01/04/2014 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Cria legenda para torina de Despesas a Apropriar   			  ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
User Function APR01LEG(nReg)
Local aLegenda  := {{"BR_VERDE", 	  "Não Apropriado"},;
{"BR_VERMELHO", "Apropriado"},;
{"BR_CINZA", 	  "Inativo"}}

If nReg == Nil	// Chamada direta da funcao onde nao passa, via menu Recno eh passado
	uRetorno := {}
	Aadd(uRetorno, {"ZC5_STATUS != 'N' .AND. ZC5_LA != 'S'", aLegenda[1][1]})
	Aadd(uRetorno, {"ZC5_STATUS != 'N' .AND. ZC5_LA == 'S'", aLegenda[2][1]})
	Aadd(uRetorno, {"ZC5_STATUS == 'N'",                     aLegenda[3][1]})
	Return uRetorno
Else
	BrwLegenda(cCadastro,"Legenda",aLegenda)
Endif

Return

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ APRA001A    ¦ Autor ¦ Totvs            ¦ Data ¦ 04/11/2013 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Tela de Despesas a Apropriar - Controle de Apropricação    ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
User Function APRA001A(cAlias,nReg,nOpcx)
Local aSaveArea := GetArea()
Local cTit 		  := "Despesas a Apropriar"
Local _aTitOpc	:= {""," - VISUALIZAR"," - INCLUIR"," - ALTERAR"," - EXCLUIR"," - INATIVAR / REATIVAR"}
Local aButtons  := {}
Local _nPosGrid := 90

//Variáveis para tratamento de visão
Private _oDlg
Private _cCodigo		:= CriaVar("ZC5_CODIGO") //Space(TamSx3("ZC5_CODIGO")[1])
Private oCodigo
Private _cDescri	  := CriaVar("ZC5_DESCRI") //Space(TamSx3("ZC5_DESCRI")[1])
Private oDescri
Private _dDtRef	  := CriaVar("ZC5_DTREF") //ctod("")
Private oDtRef
Private _cDebito   := CriaVar("ZC5_DEBITO") //Space(TamSx3("ZC5_DEBITO")[1])
Private oDebito
Private cDDebito  := CriaVar("CT1_DESC01") //Space(TamSx3("CT1_DESC01")[1])
Private oDDebito
Private _cCredito  := CriaVar("ZC5_CREDIT") //Space(TamSx3("ZC5_CREDIT")[1])
Private oCredito
Private cDCredito := CriaVar("CT1_DESC01") //Space(TamSx3("CT1_DESC01")[1])
Private oDCredito
Private _cCusto   := CriaVar("ZC5_CCUSTO") 
Private ocCusto
Private _cItem    := CriaVar("ZC5_ITEMCT") 
Private ocItem
Private _cClOrc    := CriaVar("ZC5_CLORC") 
Private ocClOrc
Private _nValor		:= CriaVar("ZC5_VALOR") //0
Private oValor
Private _cCondPag	:= CriaVar("E4_CODIGO") //Space(TamSx3("E4_CODIGO")[1])
Private oCondPag
Private cDescCdPg	:= CriaVar("E4_DESCRI") //Space(TamSx3("E4_DESCRI")[1])
Private oDescCdPg 
Private _nMeses	  := CriaVar("ZC5_NMESES")
Private oMeses

Private oBtnCalc
Private oGetDados1
Private aPosObjet := {}
Private aObjects 	:= {}
Private aSizeAut	:= MsAdvSize(,.F.,400)
Private aInfo
Private oFont14		 :=	TFont():New ("Arial",, 14,, .F.)
Private lHabCampos := .T.
Private Inclui		 := .F.
Private Altera		 := .F.

//Definindo tamanhos dos componentes
AAdd( aObjects, { 0  , _nPosGrid, .T., .F. } )
AAdd( aObjects, { 100, 100		  , .T., .T. } )
AAdd( aObjects, { 0  , 0		    , .T., .F. } )
aInfo := { aSizeAut[ 1 ], aSizeAut[ 2 ], aSizeAut[ 3 ], aSizeAut[ 4 ], 3, 3 }
aPosObjet := MsObjSize( aInfo, aObjects )

//se alterar ou excluir ou provisionar e já provisionado
/*
if (nOpcx == 4 .Or. nOpcx == 5 .Or. nOpcx == 6) .AND. ZE7->ZE7_STATUS == '2' //se provisionou SE2
MSGInfo("Parcelas já provisionadas! Não é permitida esta ação!","Atenção")
Return .F.
endif

if nOpcx == 7 .AND. ZE7->ZE7_STATUS == '1'
MSGInfo("Parcelas não provisionadas! Não é permitida esta ação!","Atenção")
Return .F.
endif
*/

//Montando Tela de Cadastro
DEFINE MSDIALOG _oDlg TITLE OemToAnsi(cTit+_aTitOpc[nOpcx]) FROM aSizeAut[7],0 TO aSizeAut[6],aSizeAut[5] PIXEL

@ C(005)+nP12T,C(005) Say "Cod. Despesa" Size C(040),C(007) COLOR CLR_HBLUE PIXEL OF _oDlg FONT oFont14
@ C(012)+nP12T,C(005) MsGet oCodigo Var _cCodigo When Inclui /*VisualSX3("ZC5_CODIGO")*/ Size C(030),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14 Picture PesqPict("ZC5","ZC5_CODIGO") F3 CpoRetF3("ZC5_CODIGO") Valid CheckSX3("ZC5_CODIGO",_cCodigo)

@ C(005)+nP12T,C(050) Say "Descricao" Size C(040),C(007) COLOR CLR_HBLUE PIXEL OF _oDlg FONT oFont14
@ C(012)+nP12T,C(050) MsGet oDescri Var _cDescri When Inclui .or. Altera Size C(140),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14 Picture "@!"
//oDescri := TGet():New(C(012),C(|| cDescri},_oDlg,C(140),C(007),"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cDescri,,,, )
//oDescri := TGet():Create(_oDlg,{||cDescri},C(012),C(050),C(140),C(007),"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cDescri,,,, )

@ C(005)+nP12T,C(200) Say "C.Custo" Size C(040),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14
@ C(012)+nP12T,C(200) MsGet ocCusto Var _cCusto When Inclui .or. Altera Size C(035),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14 Picture "@!" F3 "CTT" Valid ValCTT(_cCusto)

@ C(022)+nP12T,C(005) Say "Debito" Size C(040),C(007) COLOR CLR_HBLUE PIXEL OF _oDlg FONT oFont14
@ C(029)+nP12T,C(005) MsGet oDebito Var _cDebito When Inclui .or. Altera Size C(035),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14 Picture "@!" F3 "CT1" Valid ValCT1(_cDebito,@cDDebito)

@ C(022)+nP12T,C(050) Say "Desc. Debito" Size C(040),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14
@ C(029)+nP12T,C(050) MsGet oDDebito Var cDDebito When .F. Size C(140),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14 Picture "@!"

@ C(022)+nP12T,C(200) Say "Item Ctb" Size C(040),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14
@ C(029)+nP12T,C(200) MsGet ocItem Var _cItem When Inclui .or. Altera Size C(035),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14 Picture "@!" F3 "CTD" Valid ValCTD(_cItem)


@ C(039)+nP12T,C(005) Say "Credito" Size C(040),C(007) COLOR CLR_HBLUE PIXEL OF _oDlg FONT oFont14
@ C(046)+nP12T,C(005) MsGet oCredito Var _cCredito When Inclui .or. Altera Size C(035),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14 Picture "@!" F3 "CT1" Valid ValCT1(_cCredito,@cDCredito)

@ C(039)+nP12T,C(050) Say "Desc. Credito" Size C(040),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14
@ C(046)+nP12T,C(050) MsGet oDCredito Var cDCredito When .F. Size C(140),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14 Picture "@!"

@ C(039)+nP12T,C(200) Say "Cl Orc" Size C(040),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14
@ C(046)+nP12T,C(200) MsGet ocClOrc Var _cClOrc When Inclui .or. Altera Size C(035),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14 Picture "@!" F3 "AK6" Valid ValAK6(_cClOrc)


@ C(056)+nP12T,C(005) Say "Valor Referencia" Size C(040),C(007) COLOR CLR_HBLUE PIXEL OF _oDlg FONT oFont14
@ C(063)+nP12T,C(005) MsGet oValor Var _nValor When Inclui .or. Altera Size C(040),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14 Picture "@E 99,999,999,999.99"

@ C(056)+nP12T,C(050) Say "Dt Referencia" Size C(040),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14
@ C(063)+nP12T,C(050) MsGet oDtRef Var _dDtRef When Inclui .or. Altera Size C(030),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14 Picture "@!"

@ C(056)+nP12T,C(085) Say "Cond. Pag." Size C(040),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14
@ C(063)+nP12T,C(085) MsGet oCondPag Var _cCondPag When Inclui .or. Altera Size C(030),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14 F3 "SE4" Valid (ValCondPg(_cCondPag,@cDescCdPg) .and. CarrParc(_nValor,_cCondPag,_dDtRef,nOpcx))

@ C(056)+nP12T,C(120) Say "Desc Cond Pag" Size C(040),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14
@ C(063)+nP12T,C(120) MsGet oDescCdPg Var cDescCdPg When .F. Size C(100),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14 Picture "@!"

@ C(056)+nP12T,C(225) Say "Meses" Size C(040),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14
@ C(063)+nP12T,C(225) MsGet oMeses Var _nMeses When Inclui .or. Altera Size C(035),C(007) COLOR CLR_BLACK PIXEL OF _oDlg FONT oFont14 Picture "999" Valid ValMESES(_nValor,_nMeses,_dDtRef,nOpcx)

oGetDados1 := GetDados1(cAlias,nReg,nOpcx)

//Se Visualizacao ou Alteração ou Exclusao ou Inativar / Reativar
if nOpcx == 2 .Or. nOpcx == 4 .Or. nOpcx == 5 .Or. nOpcx == 6
	
	CarregaReg()
	
	if nOpcx == 4 //se for alterar
		Altera := .T.
	else
		oGetDados1:Disable()
	endif
	
	//Se Inclusão
elseif nOpcx == 3
	_cCodigo	:= UPROXIMO("ZC5", "ZC5_CODIGO", xFilial("ZC5")) //CriaVar("ZC5_CODIGO")
	_cDescri	:= CriaVar("ZC5_DESCRI")
	_cDebito  := CriaVar("ZC5_DEBITO")
	cDDebito  := CriaVar("CT1_DESC01")
	_cCredito := CriaVar("ZC5_CREDIT")
	cDCredito := CriaVar("CT1_DESC01")
	_nValor	  := CriaVar("ZC5_VALOR")
	_dDtRef		:= CriaVar("ZC5_DTREFC")
	_cCondPag := CriaVar("E4_CODIGO")
	cDescCdPg := CriaVar("E4_DESCRI")
	_cCusto   := CriaVar("ZC5_CCUSTO")
    _cItem    := CriaVar("ZC5_ITEMCT")
    _cClOrc   := CriaVar("ZC5_CLORC")  
	_nMeses   := CriaVar("ZC5_NMESES")
	Inclui    := .T.
endif

// aAdd(aButtons,{"PROMOCAO", {||U_FILPROMO()}, "Filtro","Filtro"}) //adicionar botões ações relacionadas na tela

_oDlg:lMaximized := .T.
ACTIVATE MSDIALOG _oDlg ON INIT EnchoiceBar(_oDlg, {|| Processa({|| IIF(TudoOk(cAlias,nReg,nOpcx), _oDlg:End(), ) }) }, {|| _oDlg:End()}, , aButtons) CENTERED

RestArea(aSaveArea)
Return .T.

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ GetDados    ¦ Autor ¦ Totvs            ¦ Data ¦ 02/04/2014 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Faz montagem da Grid do Cadastro							              ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
Static Function GetDados1(cAlias,nReg,nOpcx)
Local aArea  := GetArea()
Local cChave := ""
Local nI
Local aHeader := {}
Local aCols   := {}
Local aAlterFields := {}

//Static oMSNewGetDados1

dbSelectArea("SX3")
dbSetOrder(1)
dbSeek("ZC5")
While SX3->(!EOF()) .and. X3_ARQUIVO == "ZC5"
	If X3Uso(X3_USADO) .and. cNivel >= X3_NIVEL .and. (alltrim(SX3->X3_CAMPO))$"ZC5_PARCEL/ZC5_DTREF/ZC5_VALOR"
		Aadd(aHeader, {AllTrim(X3Titulo()),SX3->X3_CAMPO,SX3->X3_PICTURE,SX3->X3_TAMANHO,SX3->X3_DECIMAL,SX3->X3_VALID,;
		SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})
		if SX3->X3_VISUAL == 'A'
			Aadd(aAlterFields,SX3->X3_CAMPO)
		endif
	Endif
	SX3->(dbSkip())
Enddo

If nOpcx <> 3 //Alteração, Visualização ou Exclusão
	cChave := ZC5->(ZC5_FILIAL+ZC5_CODIGO)
	
	dbSelectArea("ZC5")
	ZC5->( dbSetOrder(1) )
	ZC5->( dbGoTop() )
	ZC5->( dbSeek( cChave ) )
	
	While ZC5->(!EOF()) .and. ZC5->(ZC5_FILIAL+ZC5_CODIGO) == cChave
		aadd(aCols, Array(Len(aHeader)+1))
		For nI := 1 To Len(aHeader)
			If aHeader[nI][10] == "R" // Campo é real.
				aCols[Len(aCols),nI] := FieldGet(FieldPos(aHeader[nI,2]))
			Else
				aCols[Len(aCols),nI] := CriaVar(aHeader[nI,2], .T.)
			EndIf
		Next nI
		aCols[Len(aCols),Len(aHeader)+1] := .F.
		ZC5->(dbSkip())
	Enddo
Else //Se for inclusão
	aadd(aCols, Array(Len(aHeader) + 1))
	For nI := 1 To Len(aHeader)
		aCols[1, nI] := CriaVar(aHeader[nI, 2], .T.)
	Next nI
	aCols[1,Len(aHeader)+1] := .F.
Endif

RestArea(aArea)

Return MsNewGetDados():New(aPosObjet[2,1]+nP12T, aPosObjet[2,2], aPosObjet[2,3], aPosObjet[2,4],;
GD_INSERT+GD_DELETE+GD_UPDATE, {|| AP01LIOK(nOpcx)}, "AllwaysTrue", "+ZC5_PARCEL", aAlterFields, /*nFreeze*/, 999, "AllwaysTrue",;
/*cSuperDel*/, {|| AP01LIDE(nOpcx)}, _oDlg, aHeader, aCols)

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ CarregaReg    ¦ Autor ¦ Totvs          ¦ Data ¦ 04/11/2013 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Carrega valores do registro no cabeçalho					          ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
Static Function CarregaReg()

_cCodigo  := ZC5->ZC5_CODIGO
_cDescri	:= ZC5->ZC5_DESCRI
_cDebito  := ZC5->ZC5_DEBITO
cDDebito  := POSICIONE("CT1",1,xFilial("CT1")+ZC5->ZC5_DEBITO,"CT1_DESC01")
_cCredito := ZC5->ZC5_CREDIT
cDCredito := POSICIONE("CT1",1,xFilial("CT1")+ZC5->ZC5_CREDIT,"CT1_DESC01")
_nValor		:= SOMATOT() //TOTAL
_dDtRef   := ZC5->ZC5_DTREFC
_cCondPag	:= ZC5->ZC5_CONDPG
cDescCdPg	:= POSICIONE("SE4",1,xFilial("SE4")+ZC5->ZC5_CONDPG,"E4_DESCRI")
_cCusto   := ZC5->ZC5_CCUSTO
_cItem    := ZC5->ZC5_ITEMCT
_cClOrc   := ZC5->ZC5_CLORC
_nMeses   := ZC5->ZC5_NMESES

Return

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ ValCondPg     ¦ Autor ¦ Totvs          ¦ Data ¦ 07/11/2013 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Carrega gatilhos dos campo cond. pagamento				  ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                          ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
Static Function ValCondPg(cCPag,cDesc)

Local lRet := .T.

if !empty(cCPag)
	cDesc := Posicione("SE4",1,xFilial("SE4")+cCPag,"E4_DESCRI")
	if empty(cDesc)
		MSGInfo("Condição não cadastrada! Selecione uma condição válida.","Atenção!")
		lRet := .F.
	endif
endif

Return lRet

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ ValCTT     ¦ Autor ¦ Totvs            ¦ Data ¦ 07/04/2014 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Valida C.Custo                                             ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
Static Function ValCTT(_cCodigo)

Local lRet := .T.

if !empty(_cCodigo)
	cDesc := Posicione("CTT",1,xFilial("CTT")+_cCodigo,"CTT_DESC01")
	if empty(cDesc)
		MSGInfo("C.Custo não cadastrado! Selecione um código válido.","Atenção!")
		lRet := .F.
	endif
	if CTT->CTT_CLASSE<>'2'
		MSGInfo("C.Custo inválido! Selecione um código analítico.","Atenção!")
		lRet := .F.
	endif
endif

Return lRet

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ ValCTD     ¦ Autor ¦ Totvs            ¦ Data ¦ 07/04/2014 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Valida Item                                                ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
Static Function ValCTD(_cCodigo)

Local lRet := .T.

if !empty(_cCodigo)
	cDesc := Posicione("CTD",1,xFilial("CTD")+_cCodigo,"CTD_DESC01")
	if empty(cDesc)
		MSGInfo("Item não cadastrado! Selecione um código válido.","Atenção!")
		lRet := .F.
	endif
	if CTD->CTD_CLASSE<>'2'
		MSGInfo("Item inválido! Selecione um código analítico.","Atenção!")
		lRet := .F.
	endif
endif

Return lRet

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ ValAK6      ¦ Autor ¦ Totvs            ¦ Data ¦ 30/11/2017 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Valida Classe                                              ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                          ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
Static Function ValAK6(_cCodigo)

Local lRet := .T.

if !empty(_cCodigo)
	cDesc := Posicione("AK6",1,xFilial("AK6")+_cCodigo,"AK6_DESCRI")
	if empty(cDesc)
		MSGInfo("Classe Orc. não cadastrada! Selecione um código válido.","Atenção!")
		lRet := .F.
	endif
endif

Return lRet


/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ ValCT1     ¦ Autor ¦ Totvs            ¦ Data ¦ 02/014/2014 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Carrega gatilhos dos campo debito/credito (Plano de Contas)¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
Static Function ValCT1(_cCodigo,cDesc)

Local lRet := .T.

if !empty(_cCodigo)
	cDesc := Posicione("CT1",1,xFilial("CT1")+_cCodigo,"CT1_DESC01")
	if empty(cDesc)
		MSGInfo("Conta não cadastrada! Selecione uma conta válida.","Atenção!")
		lRet := .F.
	endif
	if CT1->CT1_CLASSE<>'2'
		MSGInfo("Conta inválida! Selecione um conta analítica.","Atenção!")
		lRet := .F.
	endif
endif

Return lRet


/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ AP01LIOK    ¦ Autor ¦ Totvs            ¦ Data ¦ 23/10/2013 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Faz validação da linha do aCols							  ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                          ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
Static Function AP01LIOK(nOpcx)
Local aArea      := GetArea()
Local lRet       := .T.
Local nPosParcel := aScan(oGetDados1:aHeader,{ |x| Upper(AllTrim(x[2])) == "ZC5_PARCEL" })
Local nPosDtRef  := aScan(oGetDados1:aHeader,{ |x| Upper(AllTrim(x[2])) == "ZC5_DTREF" })
Local nPosValor  := aScan(oGetDados1:aHeader,{ |x| Upper(AllTrim(x[2])) == "ZC5_VALOR" })
//Local nTotal     := 0
Local nX 

if nOpcx == 4 //alteracao
	
	dbselectarea("ZC5")
	ZC5->( dbsetorder(1) )
	if ZC5->( dbseek( xFilial("ZC5") + _cCodigo + oGetDados1:aCols[oGetDados1:nAt,nPosParcel] ))
		if ZC5->ZC5_LA == "S" .and. ;
			( oGetDados1:aCols[oGetDados1:nAt,nPosDtRef] <> ZC5->ZC5_DTREF .or.;
			oGetDados1:aCols[oGetDados1:nAt,nPosValor] <> ZC5->ZC5_VALOR )
			
			MsgInfo("Atenção! Não é possível alterar/excluir um registro já apropriado. Favor realizar o estorno do Lançamento Contábil.";
			+CRLF+"Parcela: "+ZC5->ZC5_PARCEL;
			+CRLF+"Dt Referencia: "+DtoC(ZC5->ZC5_DTREF);
			+CRLF+"Valor Parcela: "+AllTrim(Transform(ZC5->ZC5_VALOR, "@e 999,999,999,999.99")), "Atenção")
			
			oGetDados1:aCols[oGetDados1:nAt,nPosDtRef] := ZC5->ZC5_DTREF
			oGetDados1:aCols[oGetDados1:nAt,nPosValor] := ZC5->ZC5_VALOR
			oGetDados1:Refresh()
			lRet := .F.
			
		elseif ZC5->ZC5_STATUS == "N" .and. ;
			( oGetDados1:aCols[oGetDados1:nAt,nPosDtRef] <> ZC5->ZC5_DTREF .or.;
			oGetDados1:aCols[oGetDados1:nAt,nPosValor] <> ZC5->ZC5_VALOR )
			
			lRet := MsgYesNo("Atenção! Registro inativo.";
			+CRLF+"Parcela: "+ZC5->ZC5_PARCEL;
			+CRLF+"Dt Referencia: "+DtoC(ZC5->ZC5_DTREF);
			+CRLF+"Valor Parcela: "+AllTrim(Transform(ZC5->ZC5_VALOR, "@e 999,999,999,999.99"));
			+CRLF+"Deseja Continuar?")
			
			if !lRet
				oGetDados1:aCols[oGetDados1:nAt,nPosDtRef] := ZC5->ZC5_DTREF
				oGetDados1:aCols[oGetDados1:nAt,nPosValor] := ZC5->ZC5_VALOR
				oGetDados1:Refresh()
			endif
			
		endif
	endif
endif

For nX := 1 To Len(oGetDados1:aCols)
	if oGetDados1:aCols[nX,Len(oGetDados1:aHeader)+1] == .F.
		if nX != oGetDados1:nAt .AND. oGetDados1:aCols[nX,nPosDtRef] == oGetDados1:aCols[oGetDados1:nAt,nPosDtRef]
			MSGInfo("Já foi inserida esta data vencimento!","Atenção")
			lRet := .F.
			EXIT
		endif
	endif
Next

if lRet .and. oGetDados1:nAt > 1 .AND. oGetDados1:aCols[oGetDados1:nAt,nPosDtRef] < oGetDados1:aCols[oGetDados1:nAt-1,nPosDtRef]
	MSGInfo("Data deve ser superior a data da linha anterior.","Atenção")
	lRet := .F.
endif

RestArea(aArea)
Return lRet

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ AP01LIDE    ¦ Autor ¦ Totvs            ¦ Data ¦ 23/10/2013 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Faz validação da exclusao da linha do aCols				  ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                          ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
Static Function AP01LIDE(nOpcx)
Local aArea := GetArea()
Local lRet := .T.
Local nPosParcel := aScan(oGetDados1:aHeader,{ |x| Upper(AllTrim(x[2])) == "ZC5_PARCEL" })

if nOpcx == 4 //altera
	dbselectarea("ZC5")
	ZC5->( dbsetorder(1) )
	if ZC5->( dbseek(xFilial("ZC5") + _cCodigo + oGetDados1:aCols[oGetDados1:nAt,nPosParcel] ))
		
		if ZC5->ZC5_LA == "S"
			MsgInfo("Atenção! Não é possível excluir um registro já apropriado.";
			+CRLF+"Parcela: "+ZC5->ZC5_PARCEL;
			+CRLF+"Dt Referencia: "+DtoC(ZC5->ZC5_DTREF);
			+CRLF+"Valor Parcela: "+AllTrim(Transform(ZC5->ZC5_VALOR, "@e 999,999,999,999.99")), "Atenção")
			lRet := .F.
			/*elseif ZC5->ZC5_STATUS == "N"
			MsgInfo("Atenção! Não é possível excluir um registro inativo.";
			+CRLF+"Parcela: "+ZC5->ZC5_PARCEL;
			+CRLF+"Dt Referencia: "+DtoC(ZC5->ZC5_DTREF);
			+CRLF+"Valor Parcela: "+AllTrim(Transform(ZC5->ZC5_VALOR, "@e 999,999,999,999.99")), "Atenção")
			lRet := .F.*/
		endif
	endif
endif

RestArea(aArea)
Return lRet

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ ValCabec    	¦ Autor ¦ Totvs    	¦ Data ¦ 03/04/2014 	    ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Valida campos do Cabeçalho								                  ¦¦¦
¦¦¦          ¦ 															                              ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
Static Function ValCabec()

if empty(_cCodigo)
	MSGInfo("Campo Cod. Despesa deve ser prenchido!","Atenção")
	Return .F.
endif

if empty(_cDescri)
	MSGInfo("Campo Descricao deve ser prenchido!","Atenção")
	Return .F.
endif


if empty(_cDebito)
	MSGInfo("Campo Debito deve ser prenchido!","Atenção")
	Return .F.
endif

if empty(_cCredito)
	MSGInfo("Campo Credito deve ser prenchido!","Atenção")
	Return .F.
endif

if empty(_nValor)
	MSGInfo("Campo Valor Referencia deve ser prenchido!","Atenção")
	Return .F.
endif

return .T.

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ TudoOk    	¦ Autor ¦ Totvs    	¦ Data ¦ 02/04/2014 	      ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Valida e realiza a gravacao dos dados					            ¦¦¦
¦¦¦          ¦ 															                              ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

Static Function TudoOk(cAlias,nReg,nOpcx)
Local aRecno     := {}
Local lRet       := .T.
Local nPosParcel := aScan(oGetDados1:aHeader,{ |x| Upper(AllTrim(x[2])) == "ZC5_PARCEL" })
//Local nPosDtRef  := aScan(oGetDados1:aHeader,{ |x| Upper(AllTrim(x[2])) == "ZC5_DTREF" })
Local nPosValor  := aScan(oGetDados1:aHeader,{ |x| Upper(AllTrim(x[2])) == "ZC5_VALOR" })
Local nX, nY

If nOpcx == 2 //Visualizacao
	lRet := .T.
	Return lRet
Endif

if nOpcx == 6 //Inativar / Reativar
	
	lInativa := .T. //(ZC5->ZC5_STATUS <> "N")
	cChave   := ZC5->(ZC5_FILIAL+ZC5_CODIGO)
		
	dbSelectArea("ZC5")
	ZC5->( dbSetOrder(1) )
	ZC5->( dbGoTop() )
	if ZC5->( dbSeek( cChave ) )
		while ZC5->(!EOF()) .and. ZC5->(ZC5_FILIAL+ZC5_CODIGO) == cChave
			if ZC5->ZC5_STATUS == "N" //.and. ZC5->ZC5_STATUS <> "N"
				lInativa := .F.
			endif
			ZC5->(dbSkip())
		enddo
	endif
	
	if lInativa .and. MsgYesNo("Atenção! Serão desativadas todas as parcelas não apropriadas. Deseja Continuar?")
		lRet := .T.
	elseif !lInativa .and. MsgYesNo("Atenção! Serão reativados todas as parcelas não apropriadas. Deseja Continuar?")
		lRet := .T.
	endif
	
	if lRet	
		//cChave := ZC5->(ZC5_FILIAL+ZC5_CODIGO)
		
		dbSelectArea("ZC5")
		ZC5->( dbSetOrder(1) )
		ZC5->( dbGoTop() )
		if ZC5->( dbSeek( cChave ) )
			while ZC5->(!EOF()) .and. ZC5->(ZC5_FILIAL+ZC5_CODIGO) == cChave
				if ZC5->ZC5_LA <> "S" //.and. ZC5->ZC5_STATUS <> "N"
					reclock("ZC5",.F.)
					if lInativa
						ZC5->ZC5_STATUS := "N"
					else
						ZC5->ZC5_STATUS := "S"
					endif
					ZC5->(msunlock())
				endif
				ZC5->(dbSkip())
			enddo
		endif
		
	endif
	
	return lRet
endif

If nOpcx == 5 //Exclusao
	
	dbSelectArea("ZC5")
	ZC5->(dbSetOrder(1))
	ZC5->(dbGoTop())
	ZC5->(dbSeek(xFilial("ZC5")+_cCodigo))
	While ZC5->(!EOF()) .AND. ZC5->ZC5_FILIAL+ZC5->ZC5_CODIGO == xFilial("ZC5")+_cCodigo
		if ZC5->ZC5_LA == "S"
			lRet := MsgYesNo("Atenção! Existem parcelas já apropriadas. Será realizado o estorno das apropriações."+CRLF+"Deseja Continuar?")
			If !lRet
				return lRet
			endif
			exit
		endif
		ZC5->(dbSkip())
	EndDo
	
	ZC5->(dbGoTop())
	ZC5->(dbSeek(xFilial("ZC5")+_cCodigo))
	While ZC5->(!EOF()) .AND. ZC5->ZC5_FILIAL+ZC5->ZC5_CODIGO == xFilial("ZC5")+_cCodigo
		if ZC5->ZC5_LA == "S"
			U_APRA001B( ZC5->(recno()) )
		endif
		RecLock("ZC5",.F.)
		ZC5->(dbDelete())
		ZC5->(MsUnlock())
		ZC5->(dbSkip())
	EndDo
	
	lRet := .T.
	
	Return lRet
Endif

if !ValCabec()
	return .F.
endif


if !oGetDados1:LinhaOk()
	return .F.
endif

if nOpcx == 3 .or. nOpcx == 4
	
	nTotal := 0
	
	for nX:=1 to len(oGetDados1:aCols)
		if oGetDados1:aCols[nX, Len(oGetDados1:aHeader)+1] == .F. //Se nao foi deletado
			nTotal += oGetDados1:aCols[nX,nPosValor]
		endif
	next nX
	
	if nTotal <> _nValor
		MSGInfo("Atenção! O valor de referencia esta diferente do somatório das parcelas."+CRLF+"Favor ajustar os valores.";
		+CRLF+"Valor de Referencia: "+AllTrim(Transform(_nValor, "@e 999,999,999,999.99"));
		+CRLF+"Total das Parcelas: "+AllTrim(Transform(nTotal, "@e 999,999,999,999.99")),"Atenção")
		lRet := .F.
		oValor:setfocus()
		return lRet
	endif
	
endif

dbSelectArea("ZC5")
ZC5->(dbSetOrder(1))

For nX:=1 To Len(oGetDados1:aCols)
	If oGetDados1:aCols[nX, Len(oGetDados1:aHeader)+1] == .F. //Se nao foi deletado
		If lInclui := ZC5->(dbSeek( xFilial("ZC5")+_cCodigo+oGetDados1:aCols[nX,nPosParcel] ))
			RecLock("ZC5", !lInclui) //altera
		Else
			RecLock("ZC5", !lInclui) //inclui
		Endif
		
		//campos cabeçalho
		ZC5->ZC5_FILIAL	:= xFilial("ZC5")
		ZC5->ZC5_CODIGO	:= _cCodigo
		ZC5->ZC5_DESCRI	:= _cDescri
		ZC5->ZC5_DTREFC := _dDtRef
		ZC5->ZC5_CONDPG := _cCondPag
		ZC5->ZC5_DEBITO := _cDebito
		ZC5->ZC5_CREDIT := _cCredito
		ZC5->ZC5_CCUSTO := _cCusto
		ZC5->ZC5_ITEMCT := _cItem
		ZC5->ZC5_CLORC  := _cClOrc
		ZC5->ZC5_NMESES := _nMeses
		
		if !lInclui
			ZC5->ZC5_STATUS := "S"
			ZC5->ZC5_LA     := "N"
		endif
		
		//campos aCols
		For nY:=1 To Len(oGetDados1:aHeader)
			ZC5->&(oGetDados1:aHeader[nY,2]) := oGetDados1:aCols[nX, nY]
		Next nY
		
		ZC5->(MsUnlock())
		
		aadd(aRecno, ZC5->(Recno()) )
		
	Else
		If ZC5->(dbSeek( xFilial("ZC5")+_cCodigo+oGetDados1:aCols[nX, nPosParcel] ))
			if AScan(aRecno, ZC5->(Recno()) ) == 0  //se não foi um registro inserido ou alterado nessa transação
				RecLock("ZC5",.F.)
				ZC5->(dbDelete())
				ZC5->(MsUnlock())
			endif
		Endif
	Endif
Next nX

Return lRet

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ APRA001B    ¦ Autor ¦ Totvs            ¦ Data ¦ 02/04/2014 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Função Estornar Apropriações                               ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
User Function APRA001B(nRecno)
Local aArea     := GetArea()

//setando valores dos parametros
Local cLote     := MV_PAR01
Local lLancCtb  := iif(MV_PAR02==1,.T.,.F.) //1=Sim
Local lAglutina := iif(MV_PAR03==1,.T.,.F.) //1=Sim
Local nSepPor   := MV_PAR04

Local _cSQL     := ""
Local lRet      := .T.
//Local nI
Local aFlagCTB  := {}
Local lLctPad21 := VerPadrao("121")
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica o numero do Lote 									                 ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Local cLoteCtb  := cLote //"000121"
Local lUsaFlag  := GetNewPar("MV_CTBFLAG",.F.)
Local cPadrao   := "121"
Local c121
Local aCT5      := {}
Local cArquivo  := ""
Local dDataZC5  := ctod("")
Local nTotalCtb := 0
Local nHdlPrv   := 0
Local lHeader   := .F.
Local oldDatabase := dDataBase //Salva a DataBase
Private lDetProva := .T.

_cSQL := " SELECT *"
_cSQL += " FROM " + RetSqlName("ZC5") + " ZC5"
_cSQL += " WHERE ZC5_FILIAL = '" + xFilial("ZC5") + "'"
_cSQL += " AND ZC5.D_E_L_E_T_ <> '*'" //nao deletados
_cSQL += " AND ZC5.R_E_C_N_O_ = " + cValToChar(nRecno) //recno
//_cSQL += " AND ZC5_LA != 'S'" //nao contabilizado
//_cSQL += " AND ZC5_STATUS != 'N' " //somente despesas ativas
//_cSQL += " AND ZC5_DTREF BETWEEN '"+Dtos(dDtInici)+"' and '"+Dtos(dDtFinal)+"'"
//_cSQL += " ORDER BY ZC5_CODIGO, ZC5_PARCEL, ZC5_DTREF"

_cSQL := ChangeQuery(_cSQL) //comando para evitar erros de incompatibilidade de bancos

if select("QRYZC5") > 0
	QRYZC5->(dbCloseArea())
endif

TcQuery _cSQL New Alias "QRYZC5" // Cria uma nova area com o resultado do query

TCSetField("QRYZC5","ZC5_DTREF","D")

QRYZC5->(DbGoTop())

if QRYZC5->(EOF())
	MSGInfo("Não foram encontrados contratos para o processamento.","Apropriação")
	lRet := .F.
endif

if lRet
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Define as chaves de relacionamento SIGACTB
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If lLctPad21
		c121 := CtRelation(cPadrao,.F.,{{"QRYZC5","ZC5"},{"QRYZC5","QRYZC5"},{"QRYZC5","RAPRA001"}})
	Endif
	
	//dDataZC5 := QRYZC5->ZC5_DTREF
	if nSepPor == 2 //se por dia
		dDataZC5 := QRYZC5->ZC5_DTREF
	endif
	
	While QRYZC5->(!EOF())
		
		//posiciones
		DbSelectArea("ZC5")
		ZC5->(DbSetOrder(1), DbGoTop(), DbSeek(xFilial("ZC5")+QRYZC5->ZC5_CODIGO+QRYZC5->ZC5_PARCEL))
		
		if nSepPor == 2 .AND. dDataZC5 != ZC5->ZC5_DTREF //se por dia
			//dDatabase := dDataZC5
			
			//RodaProva
			RodaProva(nHdlPrv,nTotalCtb)
			
			If nTotalCtb > 0
				nTotalCtb := 0
				cA100Incl(cArquivo,nHdlPrv,1,cLoteCtb,lLancCtb,lAglutina,,,,@aFlagCTB)
			EndIf
			
			nTotalCtb := 0
			lHeader   := .F.
		endif
		
		If lUsaFlag
			aAdd(aFlagCTB,{"ZC5_LA","S","ZC5",ZC5->(Recno()),0,0,0})
		EndIf
		
		//HeadProva
		If !lHeader
			nHdlPrv:=HeadProva(cLoteCtb,"RAPRA001",Substr(cUsuario,7,6),@cArquivo)
			
			If nHdlPrv <= 0
				HELP(" ",1,"SEM_LANC")
				lHeader := .F.
			Else
				lHeader := .T.
			EndIf
			
		EndIf
		
		If lHeader
			
			//DetProva
			lDetProva := .T.
			nParcCtb := DetProva(nHdlPrv,cPadrao,"RAPRA001",cLoteCtb,,,,,@c121,@aCT5,,@aFlagCTB)
			
			If lDetProva .AND. !lUsaFlag //se nao usa flag,
				Reclock("ZC5", .F.) //reclock "ZC5" para LA = S
				ZC5->ZC5_LA := 'S'
				ZC5->(MsUnlock())
			EndIf
			
			nTotalCtb += nParcCtb
			
		Endif
		
		//dDataZC5 := ZC5->ZC5_DTREF
		if nSepPor == 2 //se por dia
			dDataZC5 := ZC5->ZC5_DTREF
		endif
		
		QRYZC5->(dbskip()) //proximo
	endDo
	
	if lHeader //RodaProva
		//dDatabase := dDataZC5
		RodaProva(nHdlPrv,nTotalCtb)
		If nTotalCtb > 0
			nTotalCtb := 0
			cA100Incl(cArquivo,nHdlPrv,1,cLoteCtb,lLancCtb,lAglutina,,,,@aFlagCTB)
		EndIf
	endif
	
endif

if select("QRYZC5") > 0
	QRYZC5->(dbCloseArea())
endif

/*
if lRet
MSGInfo("Contabilização efetuada com sucesso!", "Sucesso!")
endif
*/

dDataBase := oldDatabase //Restaura a DataBase

RestArea(aArea)
Return lRet

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ CarrParc   ¦ Autor ¦ Totvs             ¦ Data ¦ 02/04/2014 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descrição ¦ Função para carregar aCols com as parcelas da cond pag.    ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

Static Function CarrParc(nValOp,_cCondPag,dDtIniPri,nOpcx)
Local aArea := GetArea()
Local lRet  := .T.
Local aParc := condicao(nValOp,_cCondPag,0.00,dDtIniPri,0.00,{},,0)
Local nPosParcel := aScan(oGetDados1:aHeader,{ |x| Upper(AllTrim(x[2])) == "ZC5_PARCEL" })
Local nPosDtRef  := aScan(oGetDados1:aHeader,{ |x| Upper(AllTrim(x[2])) == "ZC5_DTREF" })
Local nPosValor  := aScan(oGetDados1:aHeader,{ |x| Upper(AllTrim(x[2])) == "ZC5_VALOR" })
Local cParc := PADL("",TamSx3("ZC5_PARCEL")[1], "0")
Local nJ, nI

if empty(nValOp) .or. empty(_cCondPag) .or. empty(dDtIniPri)
	return lRet
endif

if nOpcx == 4 //alteracao
	
	if _cCondPag == ZC5->ZC5_CONDPG
		return lRet
	endif
	
	dbselectarea("ZC5")
	ZC5->( dbsetorder(1) )
	if ZC5->( dbseek( xFilial("ZC5") + _cCodigo ))
		While ZC5->(!Eof()) .and. (xFilial("ZC5") + _cCodigo) == (ZC5->(ZC5_FILIAL+ZC5_CODIGO))
			if ZC5->ZC5_LA == "S"
				MsgInfo("Atenção! Não foi possível gerar parcelas conforme condição de pagamento selecionada. Não é possível alterar/excluir um registro já apropriado.";
				+CRLF+"Parcela: "+ZC5->ZC5_PARCEL;
				+CRLF+"Dt Referencia: "+DtoC(ZC5->ZC5_DTREF);
				+CRLF+"Valor Parcela: "+AllTrim(Transform(ZC5->ZC5_VALOR, "@e 999,999,999,999.99")), "Atenção")
				lRet := .F.
				return lRet //exit
				/*elseif ZC5->ZC5_STATUS == "N"
				MsgInfo("Atenção! Não foi possível gerar parcelas conforme condição de pagamento selecionada. Não é possível alterar/excluir um registro inativo.";
				+CRLF+"Parcela: "+ZC5->ZC5_PARCEL;
				+CRLF+"Dt Referencia: "+DtoC(ZC5->ZC5_DTREF);
				+CRLF+"Valor Parcela: "+AllTrim(Transform(ZC5->ZC5_VALOR, "@e 999,999,999,999.99")), "Atenção")
				lRet := .F.
				exit*/
			endif
			ZC5->( dbskip() )
		EndDo
	endif
endif

if lRet := MsgYesNo("Deseja recalcular as parcelas de acordo com o Valor Referencia, Dt Referencia e a Condição de Pagamento digitados?")
	oGetDados1:aCols := {}
	_nMeses := 0
	for nI:=1 to len(aParc)
		aadd(oGetDados1:aCols, Array(Len(oGetDados1:aHeader)+1))
		
		for nJ:=1 to len(oGetDados1:aHeader)
			oGetDados1:aCols[nI, nJ] := CriaVar(oGetDados1:aHeader[nJ, 2], .T.)
		next nJ
		
		cParc := soma1(cParc)
		oGetDados1:aCols[nI,nPosParcel] := cParc
		oGetDados1:aCols[nI,nPosDtRef]  := aParc[nI][1]
		oGetDados1:aCols[nI,nPosValor]  := aParc[nI][2]
		oGetDados1:aCols[nI,Len(oGetDados1:aHeader)+1] := .F.
	next nI
	oGetDados1:Refresh()
endif

RestArea(aArea)
Return lRet

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ ValMESES   ¦ Autor ¦ Totvs             ¦ Data ¦ 02/04/2014 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descrição ¦ Função para carregar aCols com as parcelas Meses           ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

Static Function ValMESES(_nValor,_nMeses,_dDtRef,nOpcx)
Local aArea := GetArea()
Local lRet  := .T.
Local nPosParcel := aScan(oGetDados1:aHeader,{ |x| Upper(AllTrim(x[2])) == "ZC5_PARCEL" })
Local nPosDtRef  := aScan(oGetDados1:aHeader,{ |x| Upper(AllTrim(x[2])) == "ZC5_DTREF" })
Local nPosValor  := aScan(oGetDados1:aHeader,{ |x| Upper(AllTrim(x[2])) == "ZC5_VALOR" })
Local cParc := PADL("",TamSx3("ZC5_PARCEL")[1], "0")
Local nJ, nI 

if empty(_nValor) .or. empty(_nMeses) .or. empty(_dDtRef)
	return lRet
endif

if nOpcx == 4 //alteracao
	
	if _nMeses == ZC5->ZC5_NMESES .and. _dDtRef = ZC5->ZC5_DTREF
		return lRet
	endif
	
	dbselectarea("ZC5")
	ZC5->( dbsetorder(1) )
	if ZC5->( dbseek( xFilial("ZC5") + _cCodigo ))
		While ZC5->(!Eof()) .and. (xFilial("ZC5") + _cCodigo) == (ZC5->(ZC5_FILIAL+ZC5_CODIGO))
			if ZC5->ZC5_LA == "S"
				MsgInfo("Atenção! Não foi possível gerar parcelas conforme condição de pagamento selecionada. Não é possível alterar/excluir um registro já apropriado.";
				+CRLF+"Parcela: "+ZC5->ZC5_PARCEL;
				+CRLF+"Dt Referencia: "+DtoC(ZC5->ZC5_DTREF);
				+CRLF+"Valor Parcela: "+AllTrim(Transform(ZC5->ZC5_VALOR, "@e 999,999,999,999.99")), "Atenção")
				lRet := .F.
				return lRet //exit
			endif
			ZC5->( dbskip() )
		EndDo
	endif
	
endif

if lRet := MsgYesNo("Deseja recalcular as parcelas de acordo com o Valor Referencia, Dt Referencia e a Numero de Meses digitados?")
	_cCondPag := Space(TamSx3("E4_CODIGO")[1])
	cDescCdPg := ""
	
	_dTemp    := _dDtRef
	_nTotal   := 0
	oGetDados1:aCols := {}
	for nI:=1 to _nMeses
		aadd(oGetDados1:aCols, Array(Len(oGetDados1:aHeader)+1))
		
		for nJ:=1 to len(oGetDados1:aHeader)
			oGetDados1:aCols[nI, nJ] := CriaVar(oGetDados1:aHeader[nJ, 2], .T.)
		next nJ
		
		cParc := soma1(cParc)
		oGetDados1:aCols[nI,nPosParcel] := cParc
		_dTemp := MonthSum(_dTemp, 1 )
		oGetDados1:aCols[nI,nPosDtRef]  := _dTemp
		if nI == _nMeses
			oGetDados1:aCols[nI,nPosValor]  := _nValor - _nTotal
		else
			oGetDados1:aCols[nI,nPosValor]  := round(_nValor/_nMeses,2)
			_nTotal += round(_nValor/_nMeses,2)
		endif
		oGetDados1:aCols[nI,Len(oGetDados1:aHeader)+1] := .F.
	next nI
	oGetDados1:Refresh()
endif

RestArea(aArea)
Return lRet

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ SOMATOT     ¦ Autor ¦ Totvs            ¦ Data ¦ 02/04/2014 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Função para somar os total da despesa        						  ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
Static Function SOMATOT(nOpcx)
Local aArea  := GetArea()
Local cTmp   := GetNextAlias()
Local nTotal := 0

beginsql alias cTmp
	
	SELECT SUM(ZC5_VALOR) TOTAL
	FROM %table:ZC5% ZC5
	WHERE ZC5.%notdel%
	AND ZC5.ZC5_FILIAL = %xfilial:ZC5%
	AND ZC5.ZC5_CODIGO = %exp:_cCodigo%
	
endsql

if (cTmp)->( !EOF() )
	nTotal := (cTmp)->TOTAL
endif

(cTmp)->( dbclosearea())

RestArea(aArea)
Return nTotal

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ?
//FUNCAO PARA RETORNAR O PROXIMO CODIGO.        ?
//DEVE SER PASSADO O ALIAS E O CAMPO DO CODIGO. ?
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ?

Static Function UPROXIMO(_alias, _campo, _filial, _ntam, _where)
Local _cLocal	  := getarea()
Local _nProx	  := ""
Local _cCampo	  := _campo
Local _cAlias	  := _alias
Local _cFilial	:= _filial
Default _nTam	  := TamSx3(_campo)[1]
Default _where  := ""

If Empty(_cCampo) .or. Empty(_cAlias)
	Return nil
Endif

//cQry := "SELECT MAX(CAST("+_cCampo+" AS FLOAT)) PROX "
cQry := "SELECT MAX("+_cCampo+") PROX "
cQry += " FROM " + RetSqlName(_cAlias)
//cQry += " WHERE D_E_L_E_T_ <> '*' "

If !Empty(_cFilial)
	//preenche filial do alias
	If Left(_cAlias,1)<>"S"
		cQry += " WHERE "+_cAlias+"_FILIAL = '"+_cFilial+"' " //ZZZ_FILIAL := xfilial("ZZZ")
	Else
		cQry += " WHERE "+right(_cAlias,2)+"_FILIAL = '"+_cFilial+"' " //Z1_FILIAL := xfilial("SZ1")
	Endif
EndIf
If !Empty(_where)
	cQry += " AND " + _where
EndIf

If Select("QAUX") > 0
	QAUX->(dbCloseArea())
EndIf

cQry := ChangeQuery(cQry)
dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUX", .F., .T.)

If Empty(QAUX->PROX)
	_nProx := strzero( 1, _nTam )
Else
	_nProx := PADL(soma1(QAUX->PROX),_nTam,"0") //PADL(alltrim(&("M->"+cCampo)),nTamanho,"0") strzero( QAUX->PROX+1, _nTam )
	//_nAux  := val( _nProx )
	FreeUsedCode()
	While !MayIUseCode( _cAlias + xFilial(_cAlias) + _nProx /*strzero( _nAux,_nTam )*/ )
		_nProx := soma1(_nProx)//_nAux += 1
	EndDo
	//_nProx:=strzero( _nAux, _nTam )
EndIf

QAUX->( dbClosearea() )

restarea( _cLocal )

Return _nProx

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ AjustaSX1   ¦ Autor ¦ Totvs            ¦ Data ¦ 02/04/2014 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Cria perguntas da rotina									  								¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                          ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
Static Function AjustaSX1()

Local aHelpPor	:= {}
Local aHelpEng	:= {}
Local aHelpSpa	:= {}

u_xPutSx1( cPerg, "01","Lote","Lote","Lote","mv_ch1","C",6,0,0,"G","","","","",;
"mv_par01","","","","000121","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
u_xPutSx1( cPerg, "02","Mostra Lanç Contab ?","¿Muestra Asientos ?","Display Acc. Entry ?","mv_ch2","N",1,0,0,"C","","","","",;
"mv_par02","Sim","Si","Yes","Não","Não","No","No","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
u_xPutSx1( cPerg, "03","Aglut. Lancamentos ?","¿Agrupa Asientos ?","Group Entries ?","mv_ch3","N",1,0,0,"C","","","","",;
"mv_par03","Sim","Si","Yes","Não","Não","No","No","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
u_xPutSx1( cPerg, "04","Gera Lanc. Por ?","¿Genera Asiento Por ?","Generate Entry by ?","mv_ch4","N",1,0,0,"C","","","","",;
"mv_par04","Periodo","Periodo","Period","Periodo","Dia","Dia","Day","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return
