#INCLUDE "PROTHEUS.CH"
#INCLUDE "APWEBSRV.CH"

/* ===============================================================================
WSDL Location    http://www.sistema.sacservice.com.br/webservice.homolog/aws_sacservice.aspx?wsdl
Gerado em        04/07/17 15:32:14
Observações      Código-Fonte gerado por ADVPL WSDL Client 1.120703
                 Alterações neste arquivo podem causar funcionamento incorreto
                 e serão perdidas caso o código-fonte seja gerado novamente.
=============================================================================== */

User Function _OKZKUEO ; Return  // "dummy" function - Internal Use 

/* -------------------------------------------------------------------------------
WSDL Service WSws_sacservice
------------------------------------------------------------------------------- */

WSCLIENT WSws_sacservice

	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD RESET
	WSMETHOD CLONE
	WSMETHOD CADASTRAR_ATENDIMENTO_LONG
	WSMETHOD CADASTRAR_ATENDIMENTO
	WSMETHOD CONSULTAR_ATENDIMENTO
	WSMETHOD ALTERAR_ATENDIMENTO

	WSDATA   _URL                      AS String
	WSDATA   _HEADOUT                  AS Array of String
	WSDATA   _COOKIES                  AS Array of String
	WSDATA   cXml                      AS string
	WSDATA   oWSSdtretorno             AS ws_sacservice_SdtRetorno
	WSDATA   oWSSdtatendimento         AS ws_sacservice_SdtAtendimento
	WSDATA   cCpfcnpj                  AS string
	WSDATA   cSenha                    AS string
	WSDATA   nAtendcodigo              AS int
	WSDATA   cAtendnumerocaso          AS string
	WSDATA   oWSSdtdadosatendimento    AS ws_sacservice_SdtDadosAtendimento
	WSDATA   oWSUpdatendimento         AS ws_sacservice_UpdAtendimento

ENDWSCLIENT

WSMETHOD NEW WSCLIENT WSws_sacservice
::Init()
If !FindFunction("XMLCHILDEX")
	UserException("O Código-Fonte Client atual requer os executáveis do Protheus Build [7.00.111010P-20111220] ou superior. Atualize o Protheus ou gere o Código-Fonte novamente utilizando o Build atual.")
EndIf
Return Self

WSMETHOD INIT WSCLIENT WSws_sacservice
	::oWSSdtretorno      := ws_sacservice_SDTRETORNO():New()
	::oWSSdtatendimento  := ws_sacservice_SDTATENDIMENTO():New()
	::oWSSdtdadosatendimento := ws_sacservice_SDTDADOSATENDIMENTO():New()
	::oWSUpdatendimento  := ws_sacservice_UPDATENDIMENTO():New()
Return

WSMETHOD RESET WSCLIENT WSws_sacservice
	::cXml               := NIL 
	::oWSSdtretorno      := NIL 
	::oWSSdtatendimento  := NIL 
	::cCpfcnpj           := NIL 
	::cSenha             := NIL 
	::nAtendcodigo       := NIL 
	::cAtendnumerocaso   := NIL 
	::oWSSdtdadosatendimento := NIL 
	::oWSUpdatendimento  := NIL 
	::Init()
Return

WSMETHOD CLONE WSCLIENT WSws_sacservice
Local oClone := WSws_sacservice():New()
	oClone:_URL          := ::_URL 
	oClone:cXml          := ::cXml
	oClone:oWSSdtretorno :=  IIF(::oWSSdtretorno = NIL , NIL ,::oWSSdtretorno:Clone() )
	oClone:oWSSdtatendimento :=  IIF(::oWSSdtatendimento = NIL , NIL ,::oWSSdtatendimento:Clone() )
	oClone:cCpfcnpj      := ::cCpfcnpj
	oClone:cSenha        := ::cSenha
	oClone:nAtendcodigo  := ::nAtendcodigo
	oClone:cAtendnumerocaso := ::cAtendnumerocaso
	oClone:oWSSdtdadosatendimento :=  IIF(::oWSSdtdadosatendimento = NIL , NIL ,::oWSSdtdadosatendimento:Clone() )
	oClone:oWSUpdatendimento :=  IIF(::oWSUpdatendimento = NIL , NIL ,::oWSUpdatendimento:Clone() )
Return oClone

// WSDL Method CADASTRAR_ATENDIMENTO_LONG of Service WSws_sacservice

WSMETHOD CADASTRAR_ATENDIMENTO_LONG WSSEND cXml WSRECEIVE oWSSdtretorno WSCLIENT WSws_sacservice
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<ws_sacservice.CADASTRAR_ATENDIMENTO_LONG xmlns="dps_webservice">'
cSoap += WSSoapValue("Xml", ::cXml, cXml , "string", .T. , .F., 0 , NIL, .F.) 
cSoap += "</ws_sacservice.CADASTRAR_ATENDIMENTO_LONG>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"dps_webserviceaction/AWS_SACSERVICE.CADASTRAR_ATENDIMENTO_LONG",; 
	"DOCUMENT","dps_webservice",,,; 
	AllTrim( SuperGetMV("MV_XLINKWS", ,"http://www.sistema.sacservice.com.br/webservice.homolog/aws_sacservice.aspx") ) )

::Init()
::oWSSdtretorno:SoapRecv( WSAdvValue( oXmlRet,"_WS_SACSERVICE.CADASTRAR_ATENDIMENTO_LONGRESPONSE:_SDTRETORNO","SdtRetorno",NIL,NIL,NIL,NIL,NIL,NIL) )

END WSMETHOD

oXmlRet := NIL
Return .T.

// WSDL Method CADASTRAR_ATENDIMENTO of Service WSws_sacservice

WSMETHOD CADASTRAR_ATENDIMENTO WSSEND oWSSdtatendimento WSRECEIVE oWSSdtretorno WSCLIENT WSws_sacservice
Local cSoap := ""

BEGIN WSMETHOD

cSoap += '<ws_sacservice.CADASTRAR_ATENDIMENTO xmlns="dps_webservice">'
cSoap += WSSoapValue("Sdtatendimento", ::oWSSdtatendimento, oWSSdtatendimento , "SdtAtendimento", .T. , .F., 0 , NIL, .F.) 
cSoap += "</ws_sacservice.CADASTRAR_ATENDIMENTO>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"dps_webserviceaction/AWS_SACSERVICE.CADASTRAR_ATENDIMENTO",; 
	"DOCUMENT","dps_webservice",,,; 
	AllTrim( SuperGetMV("MV_XLINKWS", ,"http://www.sistema.sacservice.com.br/webservice.homolog/aws_sacservice.aspx") ) )

::Init()
::oWSSdtretorno:SoapRecv( WSAdvValue( oXmlRet,"_WS_SACSERVICE.CADASTRAR_ATENDIMENTORESPONSE:_SDTRETORNO","SdtRetorno",NIL,NIL,NIL,NIL,NIL,NIL) )

END WSMETHOD

//oXmlRet := NIL

Return .T.

// WSDL Method CONSULTAR_ATENDIMENTO of Service WSws_sacservice

WSMETHOD CONSULTAR_ATENDIMENTO WSSEND cCpfcnpj,cSenha,nAtendcodigo,cAtendnumerocaso WSRECEIVE oWSSdtdadosatendimento,oWSSdtretorno WSCLIENT WSws_sacservice
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<ws_sacservice.CONSULTAR_ATENDIMENTO xmlns="dps_webservice">'
cSoap += WSSoapValue("Cpfcnpj", ::cCpfcnpj, cCpfcnpj , "string", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("Senha", ::cSenha, cSenha , "string", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("Atendcodigo", ::nAtendcodigo, nAtendcodigo , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("Atendnumerocaso", ::cAtendnumerocaso, cAtendnumerocaso , "string", .T. , .F., 0 , NIL, .F.) 
cSoap += "</ws_sacservice.CONSULTAR_ATENDIMENTO>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"dps_webserviceaction/AWS_SACSERVICE.CONSULTAR_ATENDIMENTO",; 
	"DOCUMENT","dps_webservice",,,; 
	AllTrim( SuperGetMV("MV_XLINKWS", ,"http://www.sistema.sacservice.com.br/webservice.homolog/aws_sacservice.aspx") ) )

::Init()
::oWSSdtdadosatendimento:SoapRecv( WSAdvValue( oXmlRet,"_WS_SACSERVICE.CONSULTAR_ATENDIMENTORESPONSE:_SDTDADOSATENDIMENTO","SdtDadosAtendimento",NIL,NIL,NIL,NIL,NIL,NIL) )
::oWSSdtretorno:SoapRecv( WSAdvValue( oXmlRet,"_WS_SACSERVICE.CONSULTAR_ATENDIMENTORESPONSE:_SDTRETORNO","SdtRetorno",NIL,NIL,NIL,NIL,NIL,NIL) )

END WSMETHOD

oXmlRet := NIL
Return .T.

// WSDL Method ALTERAR_ATENDIMENTO of Service WSws_sacservice

WSMETHOD ALTERAR_ATENDIMENTO WSSEND cCpfcnpj,cSenha,oWSUpdatendimento WSRECEIVE oWSSdtretorno WSCLIENT WSws_sacservice
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<ws_sacservice.ALTERAR_ATENDIMENTO xmlns="dps_webservice">'
cSoap += WSSoapValue("Cpfcnpj", ::cCpfcnpj, cCpfcnpj , "string", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("Senha", ::cSenha, cSenha , "string", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("Updatendimento", ::oWSUpdatendimento, oWSUpdatendimento , "UpdAtendimento", .T. , .F., 0 , NIL, .F.) 
cSoap += "</ws_sacservice.ALTERAR_ATENDIMENTO>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"dps_webserviceaction/AWS_SACSERVICE.ALTERAR_ATENDIMENTO",; 
	"DOCUMENT","dps_webservice",,,; 
	AllTrim( SuperGetMV("MV_XLINKWS", ,"http://www.sistema.sacservice.com.br/webservice.homolog/aws_sacservice.aspx") ) )

::Init()
::oWSSdtretorno:SoapRecv( WSAdvValue( oXmlRet,"_WS_SACSERVICE.ALTERAR_ATENDIMENTORESPONSE:_SDTRETORNO","SdtRetorno",NIL,NIL,NIL,NIL,NIL,NIL) )

END WSMETHOD

oXmlRet := NIL
Return .T.


// WSDL Data Structure SdtRetorno

WSSTRUCT ws_sacservice_SdtRetorno
	WSDATA   cErrMsg                   AS string OPTIONAL
	WSDATA   nErrCode                  AS short OPTIONAL
	WSDATA   nCodigo                   AS long OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPRECV
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_SdtRetorno
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_SdtRetorno
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_SdtRetorno
	Local oClone := ws_sacservice_SdtRetorno():NEW()
	oClone:cErrMsg              := ::cErrMsg
	oClone:nErrCode             := ::nErrCode
	oClone:nCodigo              := ::nCodigo
Return oClone

WSMETHOD SOAPRECV WSSEND oResponse WSCLIENT ws_sacservice_SdtRetorno
	::Init()
	If oResponse = NIL ; Return ; Endif 
	::cErrMsg            :=  WSAdvValue( oResponse,"_ERRMSG","string",NIL,NIL,NIL,"S",NIL,NIL) 
	::nErrCode           :=  WSAdvValue( oResponse,"_ERRCODE","short",NIL,NIL,NIL,"N",NIL,NIL) 
	::nCodigo            :=  WSAdvValue( oResponse,"_CODIGO","long",NIL,NIL,NIL,"N",NIL,NIL) 
Return

// WSDL Data Structure SdtAtendimento

WSSTRUCT ws_sacservice_SdtAtendimento
	WSDATA   oWSCliente                AS ws_sacservice_SdtAtendimento_Cliente OPTIONAL
	WSDATA   oWSConsumidor             AS ws_sacservice_SdtAtendimento_Consumidor OPTIONAL
	WSDATA   oWSReclamacao             AS ws_sacservice_SdtAtendimento_Reclamacao OPTIONAL
	WSDATA   oWSHistorico              AS ws_sacservice_Historico OPTIONAL
	WSDATA   oWSProdutoRecolher        AS ws_sacservice_ProdutoRecolher OPTIONAL
	WSDATA   oWSProdutoRessarcir       AS ws_sacservice_ProdutoRessarcir OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPSEND
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_SdtAtendimento
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_SdtAtendimento
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_SdtAtendimento
	Local oClone := ws_sacservice_SdtAtendimento():NEW()
	oClone:oWSCliente           := IIF(::oWSCliente = NIL , NIL , ::oWSCliente:Clone() )
	oClone:oWSConsumidor        := IIF(::oWSConsumidor = NIL , NIL , ::oWSConsumidor:Clone() )
	oClone:oWSReclamacao        := IIF(::oWSReclamacao = NIL , NIL , ::oWSReclamacao:Clone() )
	oClone:oWSHistorico         := IIF(::oWSHistorico = NIL , NIL , ::oWSHistorico:Clone() )
	oClone:oWSProdutoRecolher   := IIF(::oWSProdutoRecolher = NIL , NIL , ::oWSProdutoRecolher:Clone() )
	oClone:oWSProdutoRessarcir  := IIF(::oWSProdutoRessarcir = NIL , NIL , ::oWSProdutoRessarcir:Clone() )
Return oClone

WSMETHOD SOAPSEND WSCLIENT ws_sacservice_SdtAtendimento
	Local cSoap := ""
	cSoap += WSSoapValue("Cliente", ::oWSCliente, ::oWSCliente , "SdtAtendimento.Cliente", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Consumidor", ::oWSConsumidor, ::oWSConsumidor , "SdtAtendimento.Consumidor", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Reclamacao", ::oWSReclamacao, ::oWSReclamacao , "SdtAtendimento.Reclamacao", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Historico", ::oWSHistorico, ::oWSHistorico , "Historico", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("ProdutoRecolher", ::oWSProdutoRecolher, ::oWSProdutoRecolher , "ProdutoRecolher", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("ProdutoRessarcir", ::oWSProdutoRessarcir, ::oWSProdutoRessarcir , "ProdutoRessarcir", .F. , .F., 0 , NIL, .F.) 
Return cSoap

// WSDL Data Structure SdtDadosAtendimento

WSSTRUCT ws_sacservice_SdtDadosAtendimento
	WSDATA   dDataAgendamento          AS date OPTIONAL
	WSDATA   dDataVisita               AS date OPTIONAL
	WSDATA   cStatus                   AS string OPTIONAL
	WSDATA   cObservacao1              AS string OPTIONAL
	WSDATA   cObservacao2              AS string OPTIONAL
	WSDATA   oWSOcorrencias            AS ws_sacservice_Ocorrencias OPTIONAL
	WSDATA   oWSHistorico              AS ws_sacservice_Historico OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPRECV
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_SdtDadosAtendimento
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_SdtDadosAtendimento
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_SdtDadosAtendimento
	Local oClone := ws_sacservice_SdtDadosAtendimento():NEW()
	oClone:dDataAgendamento     := ::dDataAgendamento
	oClone:dDataVisita          := ::dDataVisita
	oClone:cStatus              := ::cStatus
	oClone:cObservacao1         := ::cObservacao1
	oClone:cObservacao2         := ::cObservacao2
	oClone:oWSOcorrencias       := IIF(::oWSOcorrencias = NIL , NIL , ::oWSOcorrencias:Clone() )
	oClone:oWSHistorico         := IIF(::oWSHistorico = NIL , NIL , ::oWSHistorico:Clone() )
Return oClone

WSMETHOD SOAPRECV WSSEND oResponse WSCLIENT ws_sacservice_SdtDadosAtendimento
	Local oNode6
	Local oNode7
	::Init()
	If oResponse = NIL ; Return ; Endif 
	::dDataAgendamento   :=  WSAdvValue( oResponse,"_DATAAGENDAMENTO","date",NIL,NIL,NIL,"D",NIL,NIL) 
	::dDataVisita        :=  WSAdvValue( oResponse,"_DATAVISITA","date",NIL,NIL,NIL,"D",NIL,NIL) 
	::cStatus            :=  WSAdvValue( oResponse,"_STATUS","string",NIL,NIL,NIL,"S",NIL,NIL) 
	::cObservacao1       :=  WSAdvValue( oResponse,"_OBSERVACAO1","string",NIL,NIL,NIL,"S",NIL,NIL) 
	::cObservacao2       :=  WSAdvValue( oResponse,"_OBSERVACAO2","string",NIL,NIL,NIL,"S",NIL,NIL) 
	oNode6 :=  WSAdvValue( oResponse,"_OCORRENCIAS","Ocorrencias",NIL,NIL,NIL,"O",NIL,NIL) 
	If oNode6 != NIL
		::oWSOcorrencias := ws_sacservice_Ocorrencias():New()
		::oWSOcorrencias:SoapRecv(oNode6)
	EndIf
	oNode7 :=  WSAdvValue( oResponse,"_HISTORICO","Historico",NIL,NIL,NIL,"O",NIL,NIL) 
	If oNode7 != NIL
		::oWSHistorico := ws_sacservice_Historico():New()
		::oWSHistorico:SoapRecv(oNode7)
	EndIf
Return

// WSDL Data Structure UpdAtendimento

WSSTRUCT ws_sacservice_UpdAtendimento
	WSDATA   nNumero_OS                AS int OPTIONAL
	WSDATA   cDataVisita               AS string OPTIONAL
	WSDATA   cNomeRecebedor            AS string OPTIONAL
	WSDATA   cStatus                   AS string OPTIONAL
	WSDATA   cObservacao               AS string OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPSEND
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_UpdAtendimento
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_UpdAtendimento
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_UpdAtendimento
	Local oClone := ws_sacservice_UpdAtendimento():NEW()
	oClone:nNumero_OS           := ::nNumero_OS
	oClone:cDataVisita          := ::cDataVisita
	oClone:cNomeRecebedor       := ::cNomeRecebedor
	oClone:cStatus              := ::cStatus
	oClone:cObservacao          := ::cObservacao
Return oClone

WSMETHOD SOAPSEND WSCLIENT ws_sacservice_UpdAtendimento
	Local cSoap := ""
	cSoap += WSSoapValue("Numero_OS", ::nNumero_OS, ::nNumero_OS , "int", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("DataVisita", ::cDataVisita, ::cDataVisita , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("NomeRecebedor", ::cNomeRecebedor, ::cNomeRecebedor , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Status", ::cStatus, ::cStatus , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Observacao", ::cObservacao, ::cObservacao , "string", .F. , .F., 0 , NIL, .F.) 
Return cSoap

// WSDL Data Structure SdtAtendimento.Cliente

WSSTRUCT ws_sacservice_SdtAtendimento_Cliente
	WSDATA   cNome                     AS string OPTIONAL
	WSDATA   cRazaoSocial              AS string OPTIONAL
	WSDATA   cCNPJ                     AS string OPTIONAL
	WSDATA   cEMail                    AS string OPTIONAL
	WSDATA   cUF                       AS string OPTIONAL
	WSDATA   cCidade                   AS string OPTIONAL
	WSDATA   cBairro                   AS string OPTIONAL
	WSDATA   cEndereco                 AS string OPTIONAL
	WSDATA   cComplementoEndereco      AS string OPTIONAL
	WSDATA   cCEP                      AS string OPTIONAL
	WSDATA   cSenha                    AS string OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPSEND
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_SdtAtendimento_Cliente
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_SdtAtendimento_Cliente
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_SdtAtendimento_Cliente
	Local oClone := ws_sacservice_SdtAtendimento_Cliente():NEW()
	oClone:cNome                := ::cNome
	oClone:cRazaoSocial         := ::cRazaoSocial
	oClone:cCNPJ                := ::cCNPJ
	oClone:cEMail               := ::cEMail
	oClone:cUF                  := ::cUF
	oClone:cCidade              := ::cCidade
	oClone:cBairro              := ::cBairro
	oClone:cEndereco            := ::cEndereco
	oClone:cComplementoEndereco := ::cComplementoEndereco
	oClone:cCEP                 := ::cCEP
	oClone:cSenha               := ::cSenha
Return oClone

WSMETHOD SOAPSEND WSCLIENT ws_sacservice_SdtAtendimento_Cliente
	Local cSoap := ""
	cSoap += WSSoapValue("Nome", ::cNome, ::cNome , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("RazaoSocial", ::cRazaoSocial, ::cRazaoSocial , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("CNPJ", ::cCNPJ, ::cCNPJ , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("EMail", ::cEMail, ::cEMail , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("UF", ::cUF, ::cUF , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Cidade", ::cCidade, ::cCidade , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Bairro", ::cBairro, ::cBairro , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Endereco", ::cEndereco, ::cEndereco , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("ComplementoEndereco", ::cComplementoEndereco, ::cComplementoEndereco , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("CEP", ::cCEP, ::cCEP , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Senha", ::cSenha, ::cSenha , "string", .F. , .F., 0 , NIL, .F.) 
Return cSoap

// WSDL Data Structure SdtAtendimento.Consumidor

WSSTRUCT ws_sacservice_SdtAtendimento_Consumidor
	WSDATA   cCodigoConsumidor         AS string OPTIONAL
	WSDATA   cNome                     AS string OPTIONAL
	WSDATA   cUF                       AS string OPTIONAL
	WSDATA   cCidade                   AS string OPTIONAL
	WSDATA   cBairro                   AS string OPTIONAL
	WSDATA   cEndereco                 AS string OPTIONAL
	WSDATA   cNumeroEndereco           AS string OPTIONAL
	WSDATA   cComplementoEndereco      AS string OPTIONAL
	WSDATA   cCEP                      AS string OPTIONAL
	WSDATA   cPontoReferencia          AS string OPTIONAL
	WSDATA   oWSTelefone               AS ws_sacservice_Telefone OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPSEND
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_SdtAtendimento_Consumidor
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_SdtAtendimento_Consumidor
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_SdtAtendimento_Consumidor
	Local oClone := ws_sacservice_SdtAtendimento_Consumidor():NEW()
	oClone:cCodigoConsumidor    := ::cCodigoConsumidor
	oClone:cNome                := ::cNome
	oClone:cUF                  := ::cUF
	oClone:cCidade              := ::cCidade
	oClone:cBairro              := ::cBairro
	oClone:cEndereco            := ::cEndereco
	oClone:cNumeroEndereco      := ::cNumeroEndereco
	oClone:cComplementoEndereco := ::cComplementoEndereco
	oClone:cCEP                 := ::cCEP
	oClone:cPontoReferencia     := ::cPontoReferencia
	oClone:oWSTelefone          := IIF(::oWSTelefone = NIL , NIL , ::oWSTelefone:Clone() )
Return oClone

WSMETHOD SOAPSEND WSCLIENT ws_sacservice_SdtAtendimento_Consumidor
	Local cSoap := ""
	cSoap += WSSoapValue("CodigoConsumidor", ::cCodigoConsumidor, ::cCodigoConsumidor , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Nome", ::cNome, ::cNome , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("UF", ::cUF, ::cUF , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Cidade", ::cCidade, ::cCidade , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Bairro", ::cBairro, ::cBairro , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Endereco", ::cEndereco, ::cEndereco , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("NumeroEndereco", ::cNumeroEndereco, ::cNumeroEndereco , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("ComplementoEndereco", ::cComplementoEndereco, ::cComplementoEndereco , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("CEP", ::cCEP, ::cCEP , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("PontoReferencia", ::cPontoReferencia, ::cPontoReferencia , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Telefone", ::oWSTelefone, ::oWSTelefone , "Telefone", .F. , .F., 0 , NIL, .F.) 
Return cSoap

// WSDL Data Structure SdtAtendimento.Reclamacao

WSSTRUCT ws_sacservice_SdtAtendimento_Reclamacao
	WSDATA   cDataReclamacao           AS string OPTIONAL
	WSDATA   cNumeroCaso               AS string OPTIONAL
	WSDATA   cObservacao               AS string OPTIONAL
	WSDATA   nPrioridade               AS byte OPTIONAL
	WSDATA   cAnalise                  AS string OPTIONAL
	WSDATA   cDataAgendamento          AS string OPTIONAL
	WSDATA   cReclamacaoFlex1          AS string OPTIONAL
	WSDATA   cReclamacaoFlex2          AS string OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPSEND
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_SdtAtendimento_Reclamacao
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_SdtAtendimento_Reclamacao
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_SdtAtendimento_Reclamacao
	Local oClone := ws_sacservice_SdtAtendimento_Reclamacao():NEW()
	oClone:cDataReclamacao      := ::cDataReclamacao
	oClone:cNumeroCaso          := ::cNumeroCaso
	oClone:cObservacao          := ::cObservacao
	oClone:nPrioridade          := ::nPrioridade
	oClone:cAnalise             := ::cAnalise
	oClone:cDataAgendamento     := ::cDataAgendamento
	oClone:cReclamacaoFlex1     := ::cReclamacaoFlex1
	oClone:cReclamacaoFlex2     := ::cReclamacaoFlex2
Return oClone

WSMETHOD SOAPSEND WSCLIENT ws_sacservice_SdtAtendimento_Reclamacao
	Local cSoap := ""
	cSoap += WSSoapValue("DataReclamacao", ::cDataReclamacao, ::cDataReclamacao , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("NumeroCaso", ::cNumeroCaso, ::cNumeroCaso , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Observacao", ::cObservacao, ::cObservacao , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Prioridade", ::nPrioridade, ::nPrioridade , "byte", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Analise", ::cAnalise, ::cAnalise , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("DataAgendamento", ::cDataAgendamento, ::cDataAgendamento , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("ReclamacaoFlex1", ::cReclamacaoFlex1, ::cReclamacaoFlex1 , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("ReclamacaoFlex2", ::cReclamacaoFlex2, ::cReclamacaoFlex2 , "string", .F. , .F., 0 , NIL, .F.) 
Return cSoap

// WSDL Data Structure Historico

WSSTRUCT ws_sacservice_Historico
	WSDATA   oWSHistoricoItem          AS ws_sacservice_SdtAtendimento_HistoricoItem OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPSEND
	WSMETHOD SOAPRECV
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_Historico
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_Historico
	::oWSHistoricoItem     := {} // Array Of  ws_sacservice_SdtAtendimento_HistoricoItem():New()
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_Historico
	Local oClone := ws_sacservice_Historico():NEW()
	oClone:oWSHistoricoItem := NIL
	If ::oWSHistoricoItem <> NIL 
		oClone:oWSHistoricoItem := {}
		aEval( ::oWSHistoricoItem , { |x| aadd( oClone:oWSHistoricoItem , x:Clone() ) } )
	Endif 
Return oClone

WSMETHOD SOAPSEND WSCLIENT ws_sacservice_Historico
	Local cSoap := ""
	aEval( ::oWSHistoricoItem , {|x| cSoap := cSoap  +  WSSoapValue("HistoricoItem", x , x , "SdtAtendimento.HistoricoItem", .F. , .F., 0 , NIL, .F.)  } ) 
Return cSoap

WSMETHOD SOAPRECV WSSEND oResponse WSCLIENT ws_sacservice_Historico
	Local nRElem1, oNodes1, nTElem1
	::Init()
	If oResponse = NIL ; Return ; Endif 
	oNodes1 :=  WSAdvValue( oResponse,"_HISTORICOITEM","SdtAtendimento.HistoricoItem",{},NIL,.T.,"O",NIL,NIL) 
	nTElem1 := len(oNodes1)
	For nRElem1 := 1 to nTElem1 
		If !WSIsNilNode( oNodes1[nRElem1] )
			aadd(::oWSHistoricoItem , ws_sacservice_SdtAtendimento_HistoricoItem():New() )
			::oWSHistoricoItem[len(::oWSHistoricoItem)]:SoapRecv(oNodes1[nRElem1])
		Endif
	Next
Return

// WSDL Data Structure ProdutoRecolher

WSSTRUCT ws_sacservice_ProdutoRecolher
	WSDATA   oWSProdutoRecolherItem    AS ws_sacservice_SdtAtendimento_ProdutoRecolherItem OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPSEND
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_ProdutoRecolher
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_ProdutoRecolher
	::oWSProdutoRecolherItem := {} // Array Of  ws_sacservice_SdtAtendimento_ProdutoRecolherItem():New()
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_ProdutoRecolher
	Local oClone := ws_sacservice_ProdutoRecolher():NEW()
	oClone:oWSProdutoRecolherItem := NIL
	If ::oWSProdutoRecolherItem <> NIL 
		oClone:oWSProdutoRecolherItem := {}
		aEval( ::oWSProdutoRecolherItem , { |x| aadd( oClone:oWSProdutoRecolherItem , x:Clone() ) } )
	Endif 
Return oClone

WSMETHOD SOAPSEND WSCLIENT ws_sacservice_ProdutoRecolher
	Local cSoap := ""
	aEval( ::oWSProdutoRecolherItem , {|x| cSoap := cSoap  +  WSSoapValue("ProdutoRecolherItem", x , x , "SdtAtendimento.ProdutoRecolherItem", .F. , .F., 0 , NIL, .F.)  } ) 
Return cSoap

// WSDL Data Structure ProdutoRessarcir

WSSTRUCT ws_sacservice_ProdutoRessarcir
	WSDATA   oWSProdutoRessarcirItem   AS ws_sacservice_SdtAtendimento_ProdutoRessarcirItem OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPSEND
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_ProdutoRessarcir
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_ProdutoRessarcir
	::oWSProdutoRessarcirItem := {} // Array Of  ws_sacservice_SdtAtendimento_ProdutoRessarcirItem():New()
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_ProdutoRessarcir
	Local oClone := ws_sacservice_ProdutoRessarcir():NEW()
	oClone:oWSProdutoRessarcirItem := NIL
	If ::oWSProdutoRessarcirItem <> NIL 
		oClone:oWSProdutoRessarcirItem := {}
		aEval( ::oWSProdutoRessarcirItem , { |x| aadd( oClone:oWSProdutoRessarcirItem , x:Clone() ) } )
	Endif 
Return oClone

WSMETHOD SOAPSEND WSCLIENT ws_sacservice_ProdutoRessarcir
	Local cSoap := ""
	aEval( ::oWSProdutoRessarcirItem , {|x| cSoap := cSoap  +  WSSoapValue("ProdutoRessarcirItem", x , x , "SdtAtendimento.ProdutoRessarcirItem", .F. , .F., 0 , NIL, .F.)  } ) 
Return cSoap

// WSDL Data Structure Ocorrencias

WSSTRUCT ws_sacservice_Ocorrencias
	WSDATA   oWSOcorrenciasItem        AS ws_sacservice_SdtDadosAtendimento_OcorrenciasItem OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPRECV
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_Ocorrencias
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_Ocorrencias
	::oWSOcorrenciasItem   := {} // Array Of  ws_sacservice_SdtDadosAtendimento_OcorrenciasItem():New()
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_Ocorrencias
	Local oClone := ws_sacservice_Ocorrencias():NEW()
	oClone:oWSOcorrenciasItem := NIL
	If ::oWSOcorrenciasItem <> NIL 
		oClone:oWSOcorrenciasItem := {}
		aEval( ::oWSOcorrenciasItem , { |x| aadd( oClone:oWSOcorrenciasItem , x:Clone() ) } )
	Endif 
Return oClone

WSMETHOD SOAPRECV WSSEND oResponse WSCLIENT ws_sacservice_Ocorrencias
	Local nRElem1, oNodes1, nTElem1
	::Init()
	If oResponse = NIL ; Return ; Endif 
	oNodes1 :=  WSAdvValue( oResponse,"_OCORRENCIASITEM","SdtDadosAtendimento.OcorrenciasItem",{},NIL,.T.,"O",NIL,NIL) 
	nTElem1 := len(oNodes1)
	For nRElem1 := 1 to nTElem1 
		If !WSIsNilNode( oNodes1[nRElem1] )
			aadd(::oWSOcorrenciasItem , ws_sacservice_SdtDadosAtendimento_OcorrenciasItem():New() )
			::oWSOcorrenciasItem[len(::oWSOcorrenciasItem)]:SoapRecv(oNodes1[nRElem1])
		Endif
	Next
Return

// WSDL Data Structure Telefone

WSSTRUCT ws_sacservice_Telefone
	WSDATA   oWSTelefoneItem           AS ws_sacservice_SdtAtendimento_Consumidor_TelefoneItem OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPSEND
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_Telefone
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_Telefone
	::oWSTelefoneItem      := {} // Array Of  ws_sacservice_SdtAtendimento_Consumidor_TelefoneItem():New()
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_Telefone
	Local oClone := ws_sacservice_Telefone():NEW()
	oClone:oWSTelefoneItem := NIL
	If ::oWSTelefoneItem <> NIL 
		oClone:oWSTelefoneItem := {}
		aEval( ::oWSTelefoneItem , { |x| aadd( oClone:oWSTelefoneItem , x:Clone() ) } )
	Endif 
Return oClone

WSMETHOD SOAPSEND WSCLIENT ws_sacservice_Telefone
	Local cSoap := ""
	aEval( ::oWSTelefoneItem , {|x| cSoap := cSoap  +  WSSoapValue("TelefoneItem", x , x , "SdtAtendimento.Consumidor.TelefoneItem", .F. , .F., 0 , NIL, .F.)  } ) 
Return cSoap

// WSDL Data Structure SdtAtendimento.HistoricoItem

WSSTRUCT ws_sacservice_SdtAtendimento_HistoricoItem
	WSDATA   cDescricaoHistorico       AS string OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPSEND
	WSMETHOD SOAPRECV
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_SdtAtendimento_HistoricoItem
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_SdtAtendimento_HistoricoItem
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_SdtAtendimento_HistoricoItem
	Local oClone := ws_sacservice_SdtAtendimento_HistoricoItem():NEW()
	oClone:cDescricaoHistorico  := ::cDescricaoHistorico
Return oClone

WSMETHOD SOAPSEND WSCLIENT ws_sacservice_SdtAtendimento_HistoricoItem
	Local cSoap := ""
	cSoap += WSSoapValue("DescricaoHistorico", ::cDescricaoHistorico, ::cDescricaoHistorico , "string", .F. , .F., 0 , NIL, .F.) 
Return cSoap

WSMETHOD SOAPRECV WSSEND oResponse WSCLIENT ws_sacservice_SdtAtendimento_HistoricoItem
	::Init()
	If oResponse = NIL ; Return ; Endif 
	::cDescricaoHistorico :=  WSAdvValue( oResponse,"_DESCRICAOHISTORICO","string",NIL,NIL,NIL,"S",NIL,NIL) 
Return

// WSDL Data Structure SdtAtendimento.ProdutoRecolherItem

WSSTRUCT ws_sacservice_SdtAtendimento_ProdutoRecolherItem
	WSDATA   cCodigo                   AS string OPTIONAL
	WSDATA   cNomeProduto              AS string OPTIONAL
	WSDATA   nQtdeRecolher             AS double OPTIONAL
	WSDATA   cLoteFabricacao           AS string OPTIONAL
	WSDATA   cDataFabricacao           AS string OPTIONAL
	WSDATA   cDataValidade             AS string OPTIONAL
	WSDATA   cUnidade                  AS string OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPSEND
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_SdtAtendimento_ProdutoRecolherItem
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_SdtAtendimento_ProdutoRecolherItem
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_SdtAtendimento_ProdutoRecolherItem
	Local oClone := ws_sacservice_SdtAtendimento_ProdutoRecolherItem():NEW()
	oClone:cCodigo              := ::cCodigo
	oClone:cNomeProduto         := ::cNomeProduto
	oClone:nQtdeRecolher        := ::nQtdeRecolher
	oClone:cLoteFabricacao      := ::cLoteFabricacao
	oClone:cDataFabricacao      := ::cDataFabricacao
	oClone:cDataValidade        := ::cDataValidade
	oClone:cUnidade             := ::cUnidade
Return oClone

WSMETHOD SOAPSEND WSCLIENT ws_sacservice_SdtAtendimento_ProdutoRecolherItem
	Local cSoap := ""
	cSoap += WSSoapValue("Codigo", ::cCodigo, ::cCodigo , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("NomeProduto", ::cNomeProduto, ::cNomeProduto , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("QtdeRecolher", ::nQtdeRecolher, ::nQtdeRecolher , "double", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("LoteFabricacao", ::cLoteFabricacao, ::cLoteFabricacao , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("DataFabricacao", ::cDataFabricacao, ::cDataFabricacao , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("DataValidade", ::cDataValidade, ::cDataValidade , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Unidade", ::cUnidade, ::cUnidade , "string", .F. , .F., 0 , NIL, .F.) 
Return cSoap

// WSDL Data Structure SdtAtendimento.ProdutoRessarcirItem

WSSTRUCT ws_sacservice_SdtAtendimento_ProdutoRessarcirItem
	WSDATA   cCodigo                   AS string OPTIONAL
	WSDATA   cNomeProduto              AS string OPTIONAL
	WSDATA   nQtdeRessarcir            AS double OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPSEND
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_SdtAtendimento_ProdutoRessarcirItem
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_SdtAtendimento_ProdutoRessarcirItem
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_SdtAtendimento_ProdutoRessarcirItem
	Local oClone := ws_sacservice_SdtAtendimento_ProdutoRessarcirItem():NEW()
	oClone:cCodigo              := ::cCodigo
	oClone:cNomeProduto         := ::cNomeProduto
	oClone:nQtdeRessarcir       := ::nQtdeRessarcir
Return oClone

WSMETHOD SOAPSEND WSCLIENT ws_sacservice_SdtAtendimento_ProdutoRessarcirItem
	Local cSoap := ""
	cSoap += WSSoapValue("Codigo", ::cCodigo, ::cCodigo , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("NomeProduto", ::cNomeProduto, ::cNomeProduto , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("QtdeRessarcir", ::nQtdeRessarcir, ::nQtdeRessarcir , "double", .F. , .F., 0 , NIL, .F.) 
Return cSoap

// WSDL Data Structure SdtDadosAtendimento.OcorrenciasItem

WSSTRUCT ws_sacservice_SdtDadosAtendimento_OcorrenciasItem
	WSDATA   nSequencia                AS short OPTIONAL
	WSDATA   cDescricao                AS string OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPRECV
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_SdtDadosAtendimento_OcorrenciasItem
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_SdtDadosAtendimento_OcorrenciasItem
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_SdtDadosAtendimento_OcorrenciasItem
	Local oClone := ws_sacservice_SdtDadosAtendimento_OcorrenciasItem():NEW()
	oClone:nSequencia           := ::nSequencia
	oClone:cDescricao           := ::cDescricao
Return oClone

WSMETHOD SOAPRECV WSSEND oResponse WSCLIENT ws_sacservice_SdtDadosAtendimento_OcorrenciasItem
	::Init()
	If oResponse = NIL ; Return ; Endif 
	::nSequencia         :=  WSAdvValue( oResponse,"_SEQUENCIA","short",NIL,NIL,NIL,"N",NIL,NIL) 
	::cDescricao         :=  WSAdvValue( oResponse,"_DESCRICAO","string",NIL,NIL,NIL,"S",NIL,NIL) 
Return

// WSDL Data Structure SdtAtendimento.Consumidor.TelefoneItem

WSSTRUCT ws_sacservice_SdtAtendimento_Consumidor_TelefoneItem
	WSDATA   cTipo                     AS string OPTIONAL
	WSDATA   nDDD                      AS short OPTIONAL
	WSDATA   cNumero                   AS string OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPSEND
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT ws_sacservice_SdtAtendimento_Consumidor_TelefoneItem
	::Init()
Return Self

WSMETHOD INIT WSCLIENT ws_sacservice_SdtAtendimento_Consumidor_TelefoneItem
Return

WSMETHOD CLONE WSCLIENT ws_sacservice_SdtAtendimento_Consumidor_TelefoneItem
	Local oClone := ws_sacservice_SdtAtendimento_Consumidor_TelefoneItem():NEW()
	oClone:cTipo                := ::cTipo
	oClone:nDDD                 := ::nDDD
	oClone:cNumero              := ::cNumero
Return oClone

WSMETHOD SOAPSEND WSCLIENT ws_sacservice_SdtAtendimento_Consumidor_TelefoneItem
	Local cSoap := ""
	cSoap += WSSoapValue("Tipo", ::cTipo, ::cTipo , "string", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("DDD", ::nDDD, ::nDDD , "short", .F. , .F., 0 , NIL, .F.) 
	cSoap += WSSoapValue("Numero", ::cNumero, ::cNumero , "string", .F. , .F., 0 , NIL, .F.) 
Return cSoap