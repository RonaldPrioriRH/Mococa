#INCLUDE "XMLXFUN.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "FILEIO.CH"
#INCLUDE "APWIZARD.CH"
#INCLUDE "spednfe.ch"  

User Function AutoNfeEnv(cEmpresa,cFilProc,cWait,cOpc,cSerie,cNotaIni,cNotaFim)
	Local aAreaSm0	  := sm0->(GetArea())
	Local aArea       := GetArea()
	Local aPerg       := {}
	Local lEnd        := .F.
	Local aParam      := {Space(Len(SF2->F2_SERIE)),Space(Len(SF2->F2_DOC)),Space(Len(SF2->F2_DOC))}
	Local aXML        := {}
	Local cRetorno    := ""
	Local cIdEnt      := ""
	Local cModalidade := ""
	Local cAmbiente   := ""
	Local cVersao     := ""
	Local cVersaoCTe  := ""
	Local cVersaoDpec := ""
	Local cMonitorSEF := ""
	Local cSugestao   := ""
	Local cURL        := PadR(GetNewPar("MV_SPEDURL","http://"),250)
	Local nX          := 0
	Local lOk         := .T.
	Local oWs
	Local cParNfeRem  := SM0->M0_CODIGO+SM0->M0_CODFIL+"AUTONFEREM"
	Local lrobocarga  := .t.
	Default lmvczaa := .f.    // Verdadeiro quando acionada pela rotina  MVC_ZAA
	Default lCarcSaf2 := .f.
	
	If alltrim(cFilProc) <> alltrim(sm0->M0_CodFil)
		teste0:=0
		//msgstop('bug na filial')
		sm0->(dBseek(cEmpAnt+cFilProc))
		teste0:=0
	Endif


	If cSerie == Nil
		MV_PAR01 := aParam[01] := PadR(ParamLoad(cParNfeRem,aPerg,1,aParam[01]),Len(SF2->F2_SERIE))
		MV_PAR02 := aParam[02] := PadR(ParamLoad(cParNfeRem,aPerg,2,aParam[02]),Len(SF2->F2_DOC))
		MV_PAR03 := aParam[03] := PadR(ParamLoad(cParNfeRem,aPerg,3,aParam[03]),Len(SF2->F2_DOC))
	Else
		MV_PAR01 := aParam[01] := cSerie
		MV_PAR02 := aParam[02] := cNotaIni
		MV_PAR03 := aParam[03] := cNotaFim
	EndIf

	If .T.//IsReady()
//旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
//쿚btem o codigo da entidade                                              �
//읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
		cIdEnt := GetIdEnt()

		If !Empty(cIdEnt)

//旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
//쿚btem o ambiente de execucao do Totvs Services SPED                     �
//읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
			oWS := WsSpedCfgNFe():New()
			oWS:cUSERTOKEN := "TOTVS"
			oWS:cID_ENT    := cIdEnt
			oWS:nAmbiente  := 0
			oWS:_URL       := AllTrim(cURL)+"/SPEDCFGNFe.apw"
			lOk			   := execWSRet( oWS, "CFGAMBIENTE")
			If lOk
				cAmbiente := oWS:cCfgAmbienteResult
			Else
				Conout(IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3)))
			EndIf
//旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
//쿚btem a modalidade de execucao do Totvs Services SPED                   �
//읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
			If lOk
				oWS:cUSERTOKEN := "TOTVS"
				oWS:cID_ENT    := cIdEnt
				oWS:nModalidade:= 0
				oWS:_URL       := AllTrim(cURL)+"/SPEDCFGNFe.apw"
				oWs:cModelo	   := "55"
				lOk 		   := execWSRet( oWS, "CFGModalidade" )
				If lOk
					cModalidade:= oWS:cCfgModalidadeResult
				Else
					Conout(IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3)))
				EndIf
			EndIf
//旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
//쿚btem a versao de trabalho da NFe do Totvs Services SPED                �
//읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
			If lOk
				oWS:cUSERTOKEN := "TOTVS"
				oWS:cID_ENT    := cIdEnt
				oWS:cVersao    := "0.00"
				oWS:_URL       := AllTrim(cURL)+"/SPEDCFGNFe.apw"
				lOk			   := execWSRet( oWs, "CFGVersao" )
				If lOk
					cVersao    := oWS:cCfgVersaoResult
				Else
					Conout(IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3)))
				EndIf
			EndIf
			If lOk
				oWS:cUSERTOKEN := "TOTVS"
				oWS:cID_ENT    := cIdEnt
				oWS:cVersao    := "0.00"
				oWS:_URL       := AllTrim(cURL)+"/SPEDCFGNFe.apw"
				lOk 		   := execWSRet( oWs, "CFGVersaoCTe" )
				If lOk
					cVersaoCTe := oWS:cCfgVersaoCTeResult
				Else
					Conout(IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3)))
				EndIf
			EndIf
			If lOk
				oWS:cUSERTOKEN := "TOTVS"
				oWS:cID_ENT    := cIdEnt
				oWS:cVersao    := "0.00"
				oWS:_URL       := AllTrim(cURL)+"/SPEDCFGNFe.apw"
				lOk			   := execWSRet( oWs, "CFGVersaoDpec" )
				If lOk
					cVersaoDpec:= oWS:cCfgVersaoDpecResult
				Else
					Conout(IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3)))
				EndIf
			EndIf
			//旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
			//쿣erifica o status na SEFAZ                                              �
			//읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
			If lOk
				oWS:= WSNFeSBRA():New()
				oWS:cUSERTOKEN := "TOTVS"
				oWS:cID_ENT    := cIdEnt
				oWS:_URL       := AllTrim(cURL)+"/NFeSBRA.apw"
				lOk := oWS:MONITORSEFAZMODELO()
				If lOk
					aXML := oWS:oWsMonitorSefazModeloResult:OWSMONITORSTATUSSEFAZMODELO
					For nX := 1 To Len(aXML)
						Do Case
						Case aXML[nX]:cModelo == "55"
							cMonitorSEF += "- NFe"+CRLF
							cMonitorSEF += STR0017+cVersao+CRLF	//"Versao do layout: "
							If !Empty(aXML[nX]:cSugestao)
								cSugestao += STR0125+"(NFe)"+": "+aXML[nX]:cSugestao+CRLF //"Sugest�o"
							EndIf

						Case aXML[nX]:cModelo == "57"
							cMonitorSEF += "- CTe"+CRLF
							cMonitorSEF += STR0017+cVersaoCTe+CRLF	//"Versao do layout: "
							If !Empty(aXML[nX]:cSugestao)
								cSugestao += STR0125+"(CTe)"+": "+aXML[nX]:cSugestao+CRLF //"Sugest�o"
							EndIf
						EndCase
						cMonitorSEF += Space(6)+STR0129+": "+aXML[nX]:cVersaoMensagem+CRLF //"Vers�o da mensagem"
						cMonitorSEF += Space(6)+STR0120+": "+aXML[nX]:cStatusCodigo+"-"+aXML[nX]:cStatusMensagem+CRLF //"C�digo do Status"
						cMonitorSEF += Space(6)+STR0121+": "+aXML[nX]:cUFOrigem //"UF Origem"
						If !Empty(aXML[nX]:cUFResposta)
							cMonitorSEF += "("+aXML[nX]:cUFResposta+")"+CRLF //"UF Resposta"
						Else
							cMonitorSEF += CRLF
						EndIf
						If aXML[nX]:nTempoMedioSEF <> Nil
							cMonitorSEF += Space(6)+STR0071+": "+Str(aXML[nX]:nTempoMedioSEF,6)+CRLF //"Tempo de espera"
						EndIf
						If !Empty(aXML[nX]:cMotivo)
							cMonitorSEF += Space(6)+STR0123+": "+aXML[nX]:cMotivo+CRLF //"Motivo"
						EndIf
						If !Empty(aXML[nX]:cObservacao)
							cMonitorSEF += Space(6)+STR0124+": "+aXML[nX]:cObservacao+CRLF //"Observa豫o"
						EndIf
					Next nX
				EndIf
			EndIf

			Conout("[JOB  ]["+cIdEnt+"] - Iniciando transmissao NF-e de saida!")
			cRetorno := SpedNFeTrf("SF2",aParam[1],aParam[2],aParam[3],cIdEnt,cAmbiente,cModalidade,cVersao,@lEnd,.F.,.T.)
			Conout("[JOB  ]["+cIdEnt+"] - "+cRetorno)
			If lCarcSaf2 .or. lmvczaa .or. lrobocarga
				If "concluiu com sucesso a transmiss" $ cRetorno 
					If !lmvczaa
						If !lRoboCarga
							// Trata sobre a rotina MVC_ZAA
							If u_atualza0(cza0->za0_chave,'3','F',sf2->f2_filial,cFilEnt,cza0->za0_pedido,sf2->f2_serie,sf2->f2_doc,cRetorno,sf2->f2_cliente,sf2->f2_loja)
								cEtapa := '4'
								cStatus:= 'I'
								cLogZa0:= 'Processo Iniciado'
								u_atualza0(cza0->za0_chave,cEtapa,cStatus,sf2->f2_filial,cFilEnt,cza0->za0_pedido,sf2->f2_serie,sf2->f2_doc,cLogZa0,sf2->f2_cliente,sf2->f2_loja)
							Endif
						Endif
					Else
						If recLock('ZAB',.F.)
							zab->zab_status := 'T'
							zab->(msunlock())
						Endif
					Endif
				Else
					If !lRoboCarga
						If !lmvczaa
							cStatus:= 'E'  // Erro
							u_atualza0(cza0->za0_chave,'3','E',sf2->f2_filial,cFilEnt,cza0->za0_pedido,sf2->f2_serie,sf2->f2_doc,cRetorno,sf2->f2_cliente,sf2->f2_loja)				
						Else
							If recLock('ZAB',.F.)
								zab->zab_status := 'E'
								zab->(msunlock())
							Endif
						Endif
					Endif
				Endif
			Endif
// Tratar aqui a atualiza豫o da etapa de transmiss�o
			Conout("[JOB  ]["+cIdEnt+"] - Iniciando transmissao NF-e de entrada!")
			cRetorno := SpedNFeTrf("SF1",aParam[1],aParam[2],aParam[3],cIdEnt,cAmbiente,cModalidade,cVersao,@lEnd,.F.,.T.)
			Conout("[JOB  ]["+cIdEnt+"] - "+cRetorno) 
		EndIf
	Else
		Conout("SPED","Execute o m�dulo de configura豫o do servi�o, antes de utilizar esta op豫o!!!")
	EndIf

	RestArea(aArea)
	sm0->(RestArea(aAreaSm0))
	
Return

/*/
複複複複複複複複複複複複複複複複複複複複複複複複複複複複複複複複複複複複複�
굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇�
굇旼컴컴컴컴컫컴컴컴컴컴쩡컴컴컴쩡컴컴컴컴컴컴컴컴컴컴컴쩡컴컴컫컴컴컴컴컴엽�
굇쿛rograma  쿒etIdEnt  � Autor 쿐duardo Riera          � Data �18.06.2007낢�
굇쳐컴컴컴컴컵컴컴컴컴컴좔컴컴컴좔컴컴컴컴컴컴컴컴컴컴컴좔컴컴컨컴컴컴컴컴눙�
굇쿏escri뇚o 쿚btem o codigo da entidade apos enviar o post para o Totvs  낢�
굇�          쿞ervice                                                     낢�
굇쳐컴컴컴컴컵컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴눙�
굇쿝etorno   쿐xpC1: Codigo da entidade no Totvs Services                 낢�
굇쳐컴컴컴컴컵컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴눙�
굇쿛arametros쿙enhum                                                      낢�
굇쳐컴컴컴컴컵컴컴컴컴컴컴컴컫컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴눙�
굇�   DATA   � Programador   쿘anutencao efetuada                         낢�
굇쳐컴컴컴컴컵컴컴컴컴컴컴컴컵컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴눙�
굇�          �               �                                            낢�
굇읕컴컴컴컴컨컴컴컴컴컴컴컴컨컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴袂�
굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇�
賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽賽�
/*/

Static Function GetIdEnt()

	Local aArea  := GetArea()
	Local cIdEnt := ""
	Local cURL   := PadR(GetNewPar("MV_SPEDURL","http://"),250)
	Local oWs
//旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
//쿚btem o codigo da entidade                                              �
//읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
	oWS := WsSPEDAdm():New()
	oWS:cUSERTOKEN := "TOTVS"

	If alltrim(sf2->f2_filial) <> alltrim(sm0->M0_CodFil)
		teste := 0
		msgstop('bug na posi豫o da filial')
	Endif

	oWS:oWSEMPRESA:cCNPJ       := IIF(SM0->M0_TPINSC==2 .Or. Empty(SM0->M0_TPINSC),SM0->M0_CGC,"")
	oWS:oWSEMPRESA:cCPF        := IIF(SM0->M0_TPINSC==3,SM0->M0_CGC,"")
	oWS:oWSEMPRESA:cIE         := SM0->M0_INSC
	oWS:oWSEMPRESA:cIM         := SM0->M0_INSCM
	oWS:oWSEMPRESA:cNOME       := SM0->M0_NOMECOM
	oWS:oWSEMPRESA:cFANTASIA   := SM0->M0_NOME
	oWS:oWSEMPRESA:cENDERECO   := FisGetEnd(SM0->M0_ENDENT)[1]
	oWS:oWSEMPRESA:cNUM        := FisGetEnd(SM0->M0_ENDENT)[3]
	oWS:oWSEMPRESA:cCOMPL      := FisGetEnd(SM0->M0_ENDENT)[4]
	oWS:oWSEMPRESA:cUF         := SM0->M0_ESTENT
	oWS:oWSEMPRESA:cCEP        := SM0->M0_CEPENT
	oWS:oWSEMPRESA:cCOD_MUN    := SM0->M0_CODMUN
	oWS:oWSEMPRESA:cCOD_PAIS   := "1058"
	oWS:oWSEMPRESA:cBAIRRO     := SM0->M0_BAIRENT
	oWS:oWSEMPRESA:cMUN        := SM0->M0_CIDENT
	oWS:oWSEMPRESA:cCEP_CP     := Nil
	oWS:oWSEMPRESA:cCP         := Nil
	oWS:oWSEMPRESA:cDDD        := Str(FisGetTel(SM0->M0_TEL)[2],3)
	oWS:oWSEMPRESA:cFONE       := AllTrim(Str(FisGetTel(SM0->M0_TEL)[3],15))
	oWS:oWSEMPRESA:cFAX        := AllTrim(Str(FisGetTel(SM0->M0_FAX)[3],15))
	oWS:oWSEMPRESA:cEMAIL      := UsrRetMail(RetCodUsr())
	oWS:oWSEMPRESA:cNIRE       := SM0->M0_NIRE
	oWS:oWSEMPRESA:dDTRE       := SM0->M0_DTRE
	oWS:oWSEMPRESA:cNIT        := IIF(SM0->M0_TPINSC==1,SM0->M0_CGC,"")
	oWS:oWSEMPRESA:cINDSITESP  := ""
	oWS:oWSEMPRESA:cID_MATRIZ  := ""
	oWS:oWSOUTRASINSCRICOES:oWSInscricao := SPEDADM_ARRAYOFSPED_GENERICSTRUCT():New()
	oWS:_URL := AllTrim(cURL)+"/SPEDADM.apw"
	If oWs:ADMEMPRESAS()
		cIdEnt  := oWs:cADMEMPRESASRESULT
	Else
		If lCarcSaf2  .or. lmvczaa // PRIORISA
			cEtapa := '3'
			cStatus:= 'E'  // ERRO NA TRANSMISSAO
			cLogZa0 := IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3))
			If lmvczaa
				u_atualza0(cza0->za0_chave,cEtapa,cStatus,sf2->f2_filial,cFilEnt,sc5->c5_num,sf2->f2_serie,sf2->f2_doc,cLogZa0,sf2->f2_cliente,sf2->f2_loja)
			Else
				If zab->(Reclock('ZAB',.F.))
					zab->zab_status := cStatus
					zab->(MsUnlock())
				Endif
			Endif
		Else
			Aviso("SPED",IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3)),{STR0114},3)
		Endif
	EndIf

	RestArea(aArea)
Return(cIdEnt)
