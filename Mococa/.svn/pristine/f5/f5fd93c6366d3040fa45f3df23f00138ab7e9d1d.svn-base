#include "rwmake.ch"
#include "TbiConn.ch"
#include "TbiCode.ch"
#include "protheus.ch"
#INCLUDE "topconn.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³MATA010  ºAutor  ³Tarcisio Silva MirandaºData³  07/01/2018 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Manda WorkFlow, após alteração do cadastro do produto.	  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ P.e, Mvc, rastrerar momento em que é alterado o rastreio.  º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function MATA010()

	Local lRet 		:= .T.
	Local aArea 	:= GetArea()
	Local aAreaSB1 	:= SB1->(GetArea())
	Local cCod		:= SB1->B1_COD
	Local cArquivo 	:= ""
	Local cTitulo	:= ""
	Local cSubject	:= ""
	Local cBody		:= ""
	Local lShedule	:= .F.
	Local cTo		:= ""
	Local cCC		:= ""
	Local xHTM		:= ""
	Local lJob 		:= IsBlind()

	if ALTERA

		cAviso:="NOTIFICAÇÃO - Alteração no cadastro de produto."
		cDestino:= GetMv("MV_XWFALPD",,"")

		xHTM := '<HTML><BODY>'
		xHTM += '<hr>'
		xHTM += '<p  style="word-spacing: 0; line-height: 100%; margin-top: 0; margin-bottom: 0">'
		xHTM += '<b><font face="Verdana" SIZE=3>Alteração do Cadastro de Produto &nbsp; '+AllTrim(SB1->B1_COD)+"-"+AllTrim(SB1->B1_DESC)+'&nbsp;&nbsp;&nbsp;'+time()+'</b></p>'
		xHTM += '<hr>'
		xHTM += '<br>'
		xHTM += '<br>'
		xHTM += 'O produto , '+AllTrim(SB1->B1_COD)+"-"+AllTrim(SB1->B1_DESC)+',  <BR> <br>'
		xHTM += 'foi alterado por '+cUserName+', Data : '+dToc(date())+', Hora '+time()+', <BR> <br>'
		xHTM += 'o campo, controla endereçamento está preenchido como :'+SB1->B1_LOCALIZ+' <BR> <br>'
		xHTM += '</BODY></HTML>'

		cTitulo := "Alteração de Cadastro de Produto"+AllTrim(SB1->B1_DESC)

		funEnvWf('','Aviso - '+cAviso+'','Aviso - '+cAviso+'',xHTM,lJob,cDestino)		

	endif

	RestArea(aArea)

Return(lRet)

Static Function funEnvWf(cArquivo,cTitulo,cSubject,cBody,lShedule,cTo,cCC)
	*-----------------------------------------------------------------------------------------*
	LOCAL cServer, cAccount, cPassword, lAutentica, cUserAut, cPassAut
	LOCAL ckUser,lMens:=.T.,nOp:=0,oDlg
	Local _nSMTPPort := 587
	Local oMail, oMessage
	Local nErro
	Local bXMSAPRO 	:= SuperGetMV("MV_XMSAPRO")
	DEFAULT cArquivo := ""
	DEFAULT cTitulo  := ""
	DEFAULT cSubject := ""
	DEFAULT cBody    := ""
	DEFAULT lShedule := .F.
	DEFAULT cTo      := ""
	DEFAULT cCc      := ""

	IF EMPTY((cServer:=AllTrim(SuperGetmv("MV_RELSERV"))))
		IF !lShedule .OR. bXMSAPRO
			MSGINFO("Nome do Servidor de Envio de E-mail nao definido no 'MV_RELSERV'")
		ELSE
			ConOut("Nome do Servidor de Envio de E-mail nao definido no 'MV_RELSERV'")
		ENDIF
		RETURN .F.
	ENDIF

	IF EMPTY((cAccount:=AllTrim(AllTrim(SuperGetmv("MV_RELACNT")))))
		IF !lShedule .OR. bXMSAPRO
			MSGINFO("Conta para acesso ao Servidor de E-mail nao definida no 'MV_RELACNT'")
		ELSE
			ConOut("Conta para acesso ao Servidor de E-mail nao definida no 'MV_RELACNT'")
		ENDIF
		RETURN .F.
	ENDIF

	IF lShedule .AND. EMPTY(cTo)
		IF !lShedule .OR. bXMSAPRO
			ConOut("E-mail para envio, nao informado.")
		ENDIF
		RETURN .F.
	ENDIF

	IF ! lShedule
		cFrom:= SuperGetmv("MV_RELACNT") //UsrRetMail(RetCodUsr()) --- Nao aceita conta diferente da conta de envio como remetente.
		cUser:= UsrRetName(RetCodUsr())
	else
		cFrom:= SuperGetmv("MV_RELACNT")  //AllTrim(SuperGetmv("MV_EMCONTA"))
		cUser:= AllTrim(SuperGetmv("MV_WFMLBOX"))   //"WorkFlow Flach"
	endif
	cCC  := cCC + SPACE(200)
	cTo  := cTo + SPACE(200)
	cSubject:=cSubject+SPACE(100)

	IF EMPTY(cFrom)
		IF !lShedule  .OR. bXMSAPRO
			MsgInfo("E-mail do remetente nao definido no cad. do usuario: "+cUser)
		ELSE
			ConOut("E-mail do remetente nao definido no cad. do usuario: "+cUser)
		ENDIF
		RETURN .F.
	ENDIF

	cAttachment:=cArquivo
	cPassword  := AllTrim(SuperGetmv("MV_RELPSW"))
	lAutentica := SuperGetmv("MV_RELAUTH")          	//Determina se o Servidor de Email necessita de Autenticação
	cUserAut   := Alltrim(SuperGetmv("MV_RELAUSR"))		//Usuário para Autenticação no Servidor de Email
	cPassAut   := AllTrim(SuperGetmv("MV_RELPSW"))		//Senha para Autenticação no Servidor de Email

	oMail := TMailManager():New()

	if GetMv("MV_RELSSL",,.F.)
		// Usa SSL na conexao
		oMail:setUseSSL(.T.)
	Endif

	if GetMv("MV_RELTLS",,.F.)
		// Usa SSL na conexao
		oMail:setUseTLS(.T.)
	Endif

	if At(':',cServer)>0
		_nSMTPPort:=Val(Substr(cServer,At(':',cServer)+1))
		cServer:=Substr(cServer,1,At(':',cServer)-1)
	endif

	oMail:Init( '', cServer , cAccount, cPassword, 0, _nSMTPPort )
	oMail:SetSmtpTimeOut( 120 )
	conout( 'Conectando do SMTP' )
	nErro := oMail:SmtpConnect()
	If nErro <> 0
		IF !lShedule .AND. bXMSAPRO
			MsgInfo("ERROR:" + oMail:GetErrorString( nErro ))
		Else
			conout( "ERROR:" + oMail:GetErrorString( nErro ) )
		EndIf
		oMail:SMTPDisconnect()
		return .F.
	Endif
	If lAutentica
		nErro := oMail:SmtpAuth( cUserAut ,cPassAut )
		If nErro <> 0
			IF !lShedule .AND. bXMSAPRO
				MsgInfo("ERROR:" + oMail:GetErrorString( nErro ))
			Else
				conout( "ERROR:" + oMail:GetErrorString( nErro ) )
			EndIf
			oMail:SMTPDisconnect()
			return .F.
		Endif
	EndIf

	oMessage := TMailMessage():New()
	oMessage:Clear()
	oMessage:cFrom                  := cFrom
	oMessage:cTo                    := cTo
	oMessage:cCc                    := cCC
	oMessage:cSubject               := cSubject
	oMessage:cBody                  := cBody
	nErro := oMessage:Send( oMail )
	if nErro <> 0
		IF !lShedule .AND. bXMSAPRO
			MsgInfo("ERROR:" + oMail:GetErrorString( nErro ))
		Else
			conout( "ERROR:" + oMail:GetErrorString( nErro ) )
		EndIf
		return .F.
	Else
		IF !lShedule .AND. bXMSAPRO
			//MsgInfo("E-mail de Aprovação enviado com sucesso para: "+ALLTRIM(cTo))
		ELSE
			ConOut("E-mail de Aprovação enviado com sucesso para: "+ALLTRIM(cTo))
		ENDIF
	Endif
	conout( 'Desconectando do SMTP' )
	oMail:SMTPDisconnect()
	
RETURN(.T.)
