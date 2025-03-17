#include 'protheus.ch'
#include 'parmtype.ch'
#include "ap5mail.ch"

User Function EnviarEmail(cPara,cAssunto,cBody,cAtach,lLog,c_De)


	cAtach := iif(cAtach==nil,"",cAtach)
	lLog   := iif(lLog==nil,.f.,lLog)
	c_De   := Iif(c_De == Nil,GetMv("MV_RELACNT"),c_De)

	//Aviso("Email","Email utilizado "+ c_De, {"OK"})

	CONNECT SMTP SERVER GetMV("MV_RELSERV") ACCOUNT GetMV("MV_RELACNT") PASSWORD GetMV("MV_RELPSW") RESULT lOk

	If !lOK
		cErro := MailGetErr()
		If ! lLog
			//ConOut("Erro ao Conectar o Servidor - "+cErro) // Conout
		EndIf
		Return .F.
	EndIf

	//Servidor com autenticacao
	lRelauth := GetNewPar("MV_RELAUTH", .F.)
	If lRelAuth
		lOk := MailAuth(GetMV("MV_RELACNT"),GetMV("MV_RELPSW"))
		If !lOK
			cErro := MailGetErr()
			Alert("Erro ao conectar com autenticacao - " + cErro)
			lOk := MailSmtpOff( )
			Return .F.
		EndIf
	EndIf

	//xQuem := U_UserEmail()
	//

	SEND MAIL FROM c_De TO cPara SUBJECT cAssunto BODY cBody ATTACHMENT cAtach RESULT lOK

	If !lOK
		cErro := MailGetErr()
		If !lLog
			Alert("Erro ao Enviar Mensagem - " + cErro)
		EndIf
		lOk := MailSmtpOff( )
		Return .F.
	EndIf

	lOk := MailSmtpOff()

	If !lOK
		If ! lLog
			Alert("Erro ao Desconectar do Servidor")
		EndIf
		Return .F.
	EndIf

Return .T.



//-----------------------------------------------------------------------------------------------------------------------------
// Funcoes p/ montagem de email
//-----------------------------------------------------------------------------------------------------------------------------

user function HTMICOR2(cHtm)
	cHtm:='<html><body>'
return

user function HtmFimCorpo(cHtm)
	cHtm+='</body></html>'
return

user function HTMTEXT(cHtm,cTexto)
	cHtm+=cTexto
return

user function HTMLINE(cHtm,nQuant)
	cHtm+=Repl('<br>',nQuant)
return

user function HTMFTAB2(cHtm)
	cHtm+='</table>'
return


user function HTMITAB2(cHtm, nEspCel, nMarCel, nBorda)
	cHtm+='<table Width=100% cellspacing="'+alltrim(str(nEspCel))+'" cellpadding="'+alltrim(str(nMarCel))+'" border="'+alltrim(str(nBorda))+'">'
return

user function HTMLTAB2(cHtm, aCol, cCorFundo, cCorFonte, nTamFonte)
	Local nCol
	Local lFonte
	cHtm+='<TR'+iif(cCorFundo==NIL,'',' BGCOLOR="#'+cCorFundo+'"')+'>'
	for nCol:=1 to len(aCol)
		lFonte:=!(nTamFonte==NIL .and. cCorFonte==NIL)
		cHtm+='<TD>'
		if lFonte
			cHtm+='<FONT face = tahoma '
			if !(nTamFonte==NIL)
				cHtm+=' SIZE="'+alltrim(str(nTamFonte))+'"'
			endif
			if !(cCorFonte==NIL)
				cHtm+=' COLOR="#'+cCorFonte+'"'
			endif
			cHtm+='>'
		endif
		cHtm+=aCol[nCol]+'</TD>'
	next
	cHtm+='</TR>'
return

user function HtmLinTTit(cHtm, aCol, cCorFundo, cCorFonte, nTamFonte)
	Local nCol
	Local lFonte

	cHtm+='<TR'+iif(cCorFundo==NIL,'',' BGCOLOR="#'+cCorFundo+'"')+'>'
	for nCol:=1 to len(aCol)
		lFonte:=!(nTamFonte==NIL .and. cCorFonte==NIL)
		If nCol == 1
			cHtm+='<TD>'
		Else
			cHtm+='<TD align="right">'
		Endif

		if lFonte
			cHtm+='<FONT face = tahoma '
			if !(nTamFonte==NIL)
				cHtm+=' SIZE="'+alltrim(str(nTamFonte))+'"'
			endif
			if !(cCorFonte==NIL)
				cHtm+=' COLOR="#'+cCorFonte+'"'
			endif
			cHtm+='>'
		endif
		cHtm+=aCol[nCol]+'</TD>'
	next
	cHtm+='</TR>'
return

user function HTMBOLD(cHtm,cTexto)
	cHtm+='<FONT size=2 face = arial>'+cTexto+'</FONT>'
return

user function HTMBLDSUB(cHtm,cTexto)
	cHtm+='<U><FONT size=2 face = arial>'+cTexto+'</FONT></U>'
return

user function HTMSUB1(cHtm,cTexto)
	cHtm+='<U><FONT size=2 face = arial>'+cTexto+'</FONT></U>'
return


user function HTMLINH2(cHtm)
	cHtm+='<HR>'
return
