#INCLUDE "PROTHEUS.CH"
#INCLUDE "APWEBSRV.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "apwebex.ch"
#include "TOTVS.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "XMLXFUN.CH"

/*/{Protheus.doc} WS_INTSGAC

Web Service para integração Protheus x SGAC
Definição dos Metodos e Objetos

@author TOTVS
@since 17/02/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

WSSERVICE WS_INTSGAC DESCRIPTION " Funções para integração Protheus  x SGAC Mococa"

	WSDATA Env_PrecoCtr				as WSEnvPrecoCtr
	WSDATA Ret_PrecoCtr				as WSRetPrecoCtr
	//WSDATA Ret_PrecoCtr1			as WSRetPrecoCtr1

	WSDATA Env_CalcImp				as WSEnvCalcImp
	WSDATA Ret_CalcImp				as WSRetCalcImp

	WSDATA Env_Pedido				as WSEnvPedido
	WSDATA Ret_Pedido				as WSRetPedido

	WSDATA Env_Contrato				as WSEnvContrato
	WSDATA Ret_Contrato				as WSRetContrato

	WSDATA Env_Comissao				as WSEnvComissao
	WSDATA Ret_Comissao				as WSRetComissao

	WSMETHOD PRECO_CONTRATO  		DESCRIPTION "Metodo para calcular preço de contrato sobre pedido."
	WSMETHOD CALCULA_IMPOSTOS  		DESCRIPTION "Metodo para calcular impostos sobre o preço unitario."
	WSMETHOD CRUD_PEDIDO  			DESCRIPTION "Metodo para incluir, alterar ou excluir pedidos de venda."
	WSMETHOD CONSULTA_CONTRATO		DESCRIPTION "Metodo para consultar contratos cadastrados."
	WSMETHOD CONSULTA_COMISSAO		DESCRIPTION "Metodo para consultar percentual de comissão."

ENDWSSERVICE


//----------------------------------------------------------------------------
// PRECO_CONTRATO
//----------------------------------------------------------------------------
WSMETHOD PRECO_CONTRATO WSRECEIVE Env_PrecoCtr  WSSEND Ret_PrecoCtr  WSSERVICE WS_INTSGAC

	Local nRecZ24 := 0
	Local cMetodo := "PRECO_CONTRATO"

	if VldEmpFil(@::Env_PrecoCtr, @::Ret_PrecoCtr)

		GravaLog(1, @nRecZ24, ::Env_PrecoCtr,cMetodo)

		U_RWSFAT01(@::Env_PrecoCtr, @::Ret_PrecoCtr)

		GravaLog(2, nRecZ24, ::Ret_PrecoCtr,cMetodo)

	endif

Return(.T.)

WSSTRUCT WSEnvPrecoCtr
	WSDATA 	cEmp			as String Optional
	WSDATA 	cFil			as String
	WSDATA 	cProduto		as String
	WSDATA 	cCliente		as String
	WSDATA 	cLoja			as String
	WSDATA 	nPreco			as Float
	WSDATA 	cTipoOper		as String
ENDWSSTRUCT
//Segundo Valor nVlrCtr1
//Validado TESTE
WSSTRUCT WSRetPrecoCtr
	WSDATA 	lRet			as Boolean
	WSDATA 	cMensagem		as String
	WSDATA 	nVlrCtr			as Float
	WSDATA 	nVlrCtr1		as Float
	WSDATA 	nPercent		as Float
ENDWSSTRUCT

/*WSSTRUCT WSRetPrecoCtr1
	WSDATA 	lRet			as Boolean
	WSDATA 	cMensagem		as String
	WSDATA 	nVlrCtr1		as Float
	WSDATA 	nPercent		as Float
ENDWSSTRUCT */


//----------------------------------------------------------------------------
// CALCULA_IMPOSTOS
//----------------------------------------------------------------------------
WSMETHOD CALCULA_IMPOSTOS WSRECEIVE Env_CalcImp  WSSEND Ret_CalcImp WSSERVICE WS_INTSGAC

	Local nRecZ24 := 0
	Local cMetodo := "CALCULA_IMPOSTOS"

	if VldEmpFil(@::Env_CalcImp, @::Ret_CalcImp)

		GravaLog(1, @nRecZ24, ::Env_CalcImp, cMetodo)

		U_RWSFAT02(@::Env_CalcImp, @::Ret_CalcImp)

		GravaLog(2, nRecZ24, ::Ret_CalcImp, cMetodo)

	endif

Return(.T.)

WSSTRUCT WSEnvCalcImp
	WSDATA 	cEmp			as String Optional
	WSDATA 	cFil			as String
	WSDATA 	cProduto		as String
	WSDATA 	cCliente		as String
	WSDATA 	cLoja			as String
	WSDATA 	nPreco			as Float
	WSDATA 	cTipoOper		as String
ENDWSSTRUCT

WSSTRUCT WSRetCalcImp
	WSDATA 	lRet			as Boolean
	WSDATA 	cMensagem		as String
	WSDATA 	nICMS			as Float
	WSDATA 	nST				as Float
	WSDATA 	nPIS			as Float
	WSDATA 	nCOFINS			as Float
	WSDATA 	nIPI			as Float
	WSDATA 	nSUFRAMA		as Float
	WSDATA 	nZFICMS			as Float
	WSDATA 	nZFPIS			as Float
	WSDATA 	nZFCOFINS		as Float
ENDWSSTRUCT


//----------------------------------------------------------------------------
// CRUD_PEDIDO
//----------------------------------------------------------------------------
WSMETHOD CRUD_PEDIDO WSRECEIVE Env_Pedido  WSSEND Ret_Pedido WSSERVICE WS_INTSGAC

	Local nRecZ24 := 0
	Local cMetodo := "CRUD_PEDIDO"

	if VldEmpFil(@::Env_Pedido, @::Ret_Pedido)

		GravaLog(1, @nRecZ24, ::Env_Pedido, cMetodo)

		U_RWSFAT03(@::Env_Pedido, @::Ret_Pedido)

		GravaLog(2, nRecZ24, ::Ret_Pedido, cMetodo)

	endif

Return(.T.)

WSSTRUCT WSEnvPedido
	WSDATA 	cEmp			as String Optional
	WSDATA 	cFil			as String
	WSDATA 	cAcao			as String
	WSDATA 	nPedidoSGAC		as String
	WSDATA 	dEmissao		as String Optional
	WSDATA 	cCliente		as String Optional
	WSDATA 	cLoja			as String Optional
	WSDATA	cCondPag		as String Optional
	WSDATA	cTabPrc			as String Optional
	WSDATA	cVendedor		as String Optional
	WSDATA	cTipoFrete		as String Optional
	WSDATA	cBonifica		as String Optional
	WSDATA	cTriang		    as String Optional 
	WSDATA	nVlrFrete		as Float Optional
	WSDATA	cFilEst			as String Optional
	WSDATA	cFilInt			as String Optional
	WSDATA	cObsNF			as String Optional
	WSDATA	cObsPedido		as String Optional
	WSDATA	nDescVBC		as Float Optional
	WSDATA	lLibera			as Boolean Optional
	WSDATA	aItensPedido	as Array of ItemPedido Optional
ENDWSSTRUCT

WSSTRUCT ItemPedido
	WSDATA 	cProduto		as String
	WSDATA 	nQuant			as Float
	WSDATA 	nPreco			as Float
	
	WSDATA 	cOP				as String
	WSDATA 	cItem			as String 
	//WSDATA 	cxItem			as String	
	
	WSDATA 	cTipoOper		as String
	WSDATA 	nPrcTabela		as Float
	WSDATA 	dDataEntrega	as String Optional
	WSDATA  npercomiss      AS Float optional
	WSDATA 	nPerDescVBC		as Float Optional
	WSDATA 	nVlrDescVBC		as Float Optional
	WSDATA 	cMotivoDesc		as String Optional
	WSDATA 	nVerbaVBC		as Float Optional
	
	
	
ENDWSSTRUCT

WSSTRUCT WSRetPedido
	WSDATA 	lRet			as Boolean
	WSDATA 	cMensagem		as String
	WSDATA 	nPedidoSGAC		as String
	WSDATA 	cPedidoProtheus	as String
ENDWSSTRUCT



//----------------------------------------------------------------------------
// CONSULTA_CONTRATO
//----------------------------------------------------------------------------
WSMETHOD CONSULTA_CONTRATO WSRECEIVE Env_Contrato  WSSEND Ret_Contrato WSSERVICE WS_INTSGAC

	Local nRecZ24 := 0
	Local cMetodo := "CONSULTA_CONTRATO"

	if VldEmpFil(@::Env_Contrato, @::Ret_Contrato)

		GravaLog(1, @nRecZ24, ::Env_Contrato, cMetodo)

		U_RWSFAT04(@::Env_Contrato, @::Ret_Contrato)

		GravaLog(2, nRecZ24, ::Ret_Contrato, cMetodo)

	endif

Return(.T.)

WSSTRUCT WSEnvContrato
	WSDATA 	cEmp			as String Optional
	WSDATA 	cFil			as String
	WSDATA 	cCliente		as String Optional
	WSDATA 	cLoja			as String Optional
	WSDATA 	cGrupoCli		as String Optional
	WSDATA 	cNumero			as String Optional
ENDWSSTRUCT

WSSTRUCT WSRetContrato
	WSDATA 	aContratos		as Array of Contrato Optional
	WSDATA 	lRet			as Boolean
	WSDATA 	cMensagem		as String
	WSDATA 	nQtdReg			as Integer
ENDWSSTRUCT

WSSTRUCT Contrato
	WSDATA 	cNumero			as String
	WSDATA 	cAbrangencia	as String
	WSDATA 	dDataInicial	as String
	WSDATA 	dDataFinal		as String
	WSDATA 	lRenovaAuto		as Boolean
	WSDATA 	cCliente		as String
	WSDATA 	cLoja			as String
	WSDATA 	cNomeCli		as String
	WSDATA 	cGrupoCli		as String
	WSDATA 	cDescGrupo		as String
	WSDATA 	cCondPag		as String
	WSDATA 	cFormaPag		as String
	WSDATA 	cMesAniv		as String
	WSDATA 	cBaseCalculo	as String
	WSDATA 	cTituloFin		as String
	WSDATA 	cNaturezaTit	as String
	WSDATA 	cObservacoes	as String
	WSDATA 	dDataCadastro	as String
	WSDATA 	cUserCadastro	as String
	WSDATA 	cStatus			as String
	WSDATA	aClausulas		as Array of Clausula Optional
ENDWSSTRUCT

WSSTRUCT Clausula
	WSDATA 	cCodigo			as String
	WSDATA 	cDescricao		as String
	WSDATA 	cAplicacao		as String
	WSDATA 	cPeriodicidade	as String
	WSDATA 	cDescPeriod		as String
	WSDATA 	cGrupoProd		as String
	WSDATA 	cDescGrupo		as String
	WSDATA 	cProduto		as String
	WSDATA 	cDescProduto	as String
	WSDATA 	nFaixaInicial	as Float
	WSDATA 	nFaixaFinal		as Float
	WSDATA 	cTipoFaixa		as String
	WSDATA 	nValorAplicar	as Float
	WSDATA 	cTipoValor		as String
	WSDATA 	cObservacao		as String
	WSDATA 	cStatus			as String
	WSDATA	aClientes		as Array of Cliente Optional
ENDWSSTRUCT

WSSTRUCT Cliente
	WSDATA 	cCodigo			as String
	WSDATA 	cLoja			as String
	WSDATA 	cNome			as String
	WSDATA 	cCGC			as String
	WSDATA 	cTitApuracao	as String
ENDWSSTRUCT

//----------------------------------------------------------------------------
// CONSULTA_COMISSAO
//----------------------------------------------------------------------------
WSMETHOD CONSULTA_COMISSAO WSRECEIVE Env_Comissao  WSSEND Ret_Comissao WSSERVICE WS_INTSGAC

	Local nRecZ24 := 0
	Local cMetodo := "CONSULTA_COMISSAO"

	if VldEmpFil(@::Env_Comissao, @::Ret_Comissao)

		GravaLog(1, @nRecZ24, ::Env_Comissao,cMetodo)

		U_RWSFAT05(@::Env_Comissao, @::Ret_Comissao)

		GravaLog(2, nRecZ24, ::Ret_Comissao,cMetodo)

	endif

Return(.T.)

WSSTRUCT WSEnvComissao
	WSDATA 	cEmp			as String Optional
	WSDATA 	cFil			as String
	WSDATA 	cProduto		as String
	WSDATA 	cVendedor		as String 
	WSDATA  cClient         as String 
	WSDATA  cEst			as String 	
ENDWSSTRUCT

WSSTRUCT WSRetComissao
	WSDATA 	lRet			as Boolean
	WSDATA 	cMensagem		as String
	WSDATA 	nPercComissao	as Float
ENDWSSTRUCT


//-------------------------------------------------------------------
// Valida preenchimento da filial e conecta nela
//-------------------------------------------------------------------
Static Function VldEmpFil(oEnv, oRet)

	Local lConect
	Local lOk := .T.

	if empty(oEnv:cEmp)
		oEnv:cEmp := "01" //default
	endif

	if empty(oEnv:cFil)
		lOk := .F.
		cMsgErr := "Informe uma filial para processamento."
	endif

	if lOk .AND. oEnv:cFil <> cFilAnt
		//conecto na empresa/filial que foi passada pelo XML
		Reset Environment
		RpcSetType(3)
		lConect := RpcSetEnv(oEnv:cEmp, oEnv:cFil)
		if !lConect
			cMsgErr := "Não foi possível conectar na Empresa/Filial informadas!"
			lOk := .F.
		endif
	endif

	if !lOk
		oRet:lRet := .F.
		oRet:cMensagem := cMsgErr
	endif

Return lOk

//-------------------------------------------------------------------
// Grava Log do envio e recebimento
//-------------------------------------------------------------------
Static Function GravaLog(nOpc, nRecZ24, oObjXml, cMetodo)

	Local cXml := ""
	Default nRecZ24 := 0

	DbSelectArea("Z24")

	cXml := GetClassName( oObjXml ) + VarInfo( "", oObjXml, , .F. )
	//cXml := FWJsonSerialize(oObjXml,.F.,.F.)

	if nOpc == 1 //inclui
		Reclock("Z24", .T.)
			Z24->Z24_FILIAL := xFilial("Z24")
			Z24->Z24_IDLOG := U_UPROXIMO("Z24","Z24_IDLOG","")
			Z24->Z24_METODO := cMetodo
			Z24->Z24_DATA := Date()
			Z24->Z24_HORA := Time()
			Z24->Z24_XMLREC := cXml
			if cMetodo == "CRUD_PEDIDO"
				Z24->Z24_PVSGAC := StrZero(val(oObjXml:nPedidoSGAC), TamSX3("Z24_PVSGAC")[1])
			endif
		Z24->(MsUnlock())

		nRecZ24 := Z24->(Recno())
	else
		Z24->(DbGoTo(nRecZ24))
		Reclock("Z24", .F.)
			Z24->Z24_XMLRET := cXml
			if cMetodo == "CRUD_PEDIDO"
				Z24->Z24_PVPROT := oObjXml:cPedidoProtheus
			endif
		Z24->(MsUnlock())
	endif

Return nRecZ24
