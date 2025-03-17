#Include 'Protheus.ch'
#INCLUDE "TBICONN.CH"

Static lInterface				:= !isBlind()
Static __cDiretorio 			:= AllTrim(SuperGetMv("PX_DIRITAU",.F.,"\INTEGRACAO\"))
Static __cDiretorioCertificados := __cDiretorio+"certs\"
Static __cDiretorioEmails		:= __cDiretorio+"emails\"
Static __cDiretorioServerPDF	:= __cDiretorio+"pdf\"

User Function mudaFilial( xFilAnt )
	Default xFilAnt		:= ""

	if !Empty(xFilAnt)
		cFilAnt := xFilAnt
		FWSM0Util():setSM0PositionBycFilAnt()
	EndIF
return

User Function ChecErro(oErroArq,cChaveSemaforo)
	Local cMsgError := ""
	Default cChaveSemaforo	:= ""

	If oErroArq:GenCode > 0

		cMsgError := oErroArq:errorstack+oErroArq:ERRORENV

		Conout(cMsgError)

		IF lInterface
			AVISO("ErrorLog",cMsgError, { "Fechar" }, 3,,,,.t.)
		Endif

		U_gravaDetahamentoIntegracao(,,cMsgError)

		if !Empty(cChaveSemaforo)
			U_cntLockI(cChaveSemaforo, .T.)
		EndIf

		DisarmTransaction()
		Break
	EndIf


Return

//Precisa chamar esta rotina posicionada na SE1
User Function gravaDetahamentoIntegracao(cMsgEnviada,cMsgRetorno,cErro,lFinish)
	Local lIncluir as logical
	Default cMsgEnviada	:= ""
	Default cMsgRetorno	:= ""
	Default cErro		:= ""
	Default lFinish		:= .f.

	ChkFile("ZZ6")
	ZZ6->(DbSetOrder(2)) //ZZ6_FILIAL+ZZ6_PREFIX+ZZ6_NUM+ZZ6_PARCEL+ZZ6_TIPO+ZZ6_STATUS

	lIncluir := !ZZ6->(DbSeek(SE1->(E1_FILIAL + E1_PREFIXO + E1_NUM + E1_PARCELA + E1_TIPO + E1_XSTAINT)))
	RecLock("ZZ6", lIncluir)
	if lIncluir
		ZZ6->ZZ6_FILIAL := SE1->E1_FILIAL
		ZZ6->ZZ6_PREFIX := SE1->E1_PREFIXO
		ZZ6->ZZ6_NUM 	:= SE1->E1_NUM
		ZZ6->ZZ6_PARCEL := SE1->E1_PARCELA
		ZZ6->ZZ6_TIPO 	:= SE1->E1_TIPO
		ZZ6->ZZ6_STATUS := SE1->E1_XSTAINT
		ZZ6->ZZ6_DTGERA := Date()
		ZZ6->ZZ6_HRGERA := Time()
	EndIf
	if !Empty(cMsgEnviada)
		ZZ6->ZZ6_MSGENV := cMsgEnviada
	EndIf

	if !Empty(cMsgRetorno) .Or. lFinish
		ZZ6->ZZ6_DTFINA := Date()
		ZZ6->ZZ6_HRFINA := Time()
		ZZ6->ZZ6_MSGRET := cMsgRetorno
	EndIF

	if !Empty(cErro) .And. ZZ6->(FieldPos("ZZ6_ERRO")) > 0
		ZZ6->ZZ6_ERRO := cErro
	EndIF

	MsUnlock()

Return

	Static jHndLock			:= JsonObject():New()
User Function cntLockI(cNomeSemaforo, lLibera)
	Local lRet 		:= .F.
	Local nHndLock
	Default lLibera := .F.

	if lLibera
		FClose(jHndLock[cNomeSemaforo])
	Else
		nHndLock := fCreate('\semaforo\'+cNomeSemaforo+'.lck')
		IF nHndLock>= 0
			jHndLock[cNomeSemaforo] := nHndLock
			lRet := .T.
		EndIF
	EndIF
Return lRet


User Function getDescricaoStatusIntegracao(cStatus)
	Local nX
	Local cCombo 		:= GetSX3Cache("XX_XSTAINT", "X3_CBOX")
	Local aCombo 		:= RetSX3Box(cCombo,,,1)
	Local cDescStatus	:= ""
	Default cStatus := XXX->XX_XSTAINT

	For nX := 1 To Len(aCombo)
		if aCombo[nX][02] ==cStatus
			cDescStatus := AllTrim(aCombo[nX][03])
			Exit
		Endif
	Next nX

Return cDescStatus



