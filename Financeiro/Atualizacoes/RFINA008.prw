#Include 'Protheus.ch'

/*/{Protheus.doc} RFINA007

Rotina para exportar Xml de notas Bordero

@author Leandro Rodrigues
@since 24/03/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/
User Function RFINA008()

Local cFile      := cGetFile( '*.xml' , "Informe o diretorio de destino") //cGetFile( '*.xml' , "Informe o diretorio de destino", 16, , .F.,GETF_RETDIRECTORY+GETF_LOCALHARD,.F., .T. ) 
Private aXmlGer  := {}		

DbSelectArea("ZEI")
If ZEI->(DbSeek(ZEI_FILIAL+ZEE->ZEE_CODIGO)) .AND. !Empty(cFile)
	
	While ZEI->(!EOF()) ;
		.AND. ZEI_FILIAL+ZEI->ZEI_CODIGO == ZEE->ZEE_FILIAL+ZEE->ZEE_CODIGO	

		FWMsgRun(,{|oSay| U_ExpXml(ZEI->ZEI_XFILOR,ZEI->ZEI_PREFIX,ZEI->ZEI_NUM,cFile) },'Aguarde...','Gerando Xml Notas do Borderô...')
	
		ZEI->(DbSkip())
	EndDo
	
	if Len(aXmlGer) > 0		
		Aviso("XML","Processo Finalizado !!",{"OK"})
	Endif
Endif

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³SpedExport³ Autor ³Eduardo Riera          ³ Data ³02.03.2008³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³Rotina de exportacao das notas fiscaiss eletronicas         ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³Nenhum                                                      ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³Nenhum                                                      ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³   DATA   ³ Programador   ³Manutencao efetuada                         ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³          ³               ³                                            ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function ExpXml(cFilOrig,cPrefixo,cNumDoc,cFile)

Local cIdEnt   	 := ""
//Local aPerg   	 := {}
//Local aParam  	 := {Space(Len(SF2->F2_SERIE)),Space(Len(SF2->F2_DOC)),Space(Len(SF2->F2_DOC)),Space(60),CToD(""),CToD(""),Space(14),Space(14)}
//Local cParNfeExp := SM0->M0_CODIGO+SM0->M0_CODFIL+"SPEDNFEEXP"
Local lUsaColab  := .F.
Local nTipo := 1 //DEFAULT nTipo  := 1//Alterado por Tarcísio 15/01/2018, não tem como definir default a variável não existe.
Default lmvczaa := .f.    // Verdadeiro quando acionada pela rotina  MVC_ZAA

If IsReady(,,,.F.)
	
	If SF2->(DbSeek(cFilOrig+cNumDoc+cPrefixo))
	
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Obtem o codigo da entidade                                              ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ	
		cIdEnt := GetIdEnt(lUsaColab,cFilOrig)
		If !Empty(cIdEnt)
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³Instancia a classe                                                      ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			If !Empty(cIdEnt)
				If !lmvczaa
					Processa({|lEnd| SpedPExp(cIdEnt,SF2->F2_SERIE,SF2->F2_DOC,SF2->F2_DOC,cFile,lEnd,SF2->F2_EMISSAO,SF2->F2_EMISSAO,'00000000000000','99999999999999',nTipo,.F.)},"Processando","Aguarde, exportando arquivos",.F.)
				Else
					cXml := SpedPExp(cIdEnt,SF2->F2_SERIE,SF2->F2_DOC,SF2->F2_DOC,cFile,lEnd,SF2->F2_EMISSAO,SF2->F2_EMISSAO,'00000000000000','99999999999999',nTipo,.F.)
				Endif
			EndIf
		Else
			Aviso("SPED","Execute o módulo de configuração do serviço, antes de utilizar esta opção!!!",{"OK"},3)	//"Execute o módulo de configuração do serviço, antes de utilizar esta opção!!!"
		EndIf
	Endif
Else
	Aviso("SPED","Execute o módulo de configuração do serviço, antes de utilizar esta opção!!!",{"OK"},3) //"Execute o módulo de configuração do serviço, antes de utilizar esta opção!!!"
EndIf
If lmvczaa
	Return cXml
Endif
Return

Static Function SpedPExp(cIdEnt,cSerie,cNotaIni,cNotaFim,cDirDest,lEnd, dDataDe,dDataAte,cCnpjDIni,cCnpjDFim,nTipo,lCTe)

Local aDeleta  := {}   

Local cAlias	:= GetNextAlias()
Local cAnoInut  := ""
Local cAnoInut1 := "" 
Local cCanc		:= ""  
//Local cChvIni  	:= ""
//Local cChvFin	:= ""
Local cChvNFe  	:= ""
Local cCNPJDEST := Space(14) 
//Local cCondicao	:= ""               
Local cDestino 	:= ""
Local cDrive   	:= ""
Local cIdflush  := cSerie+cNotaIni
Local cModelo  	:= ""
Local cNFes     := ""
Local cPrefixo 	:= ""
//Local cFilOrig	:= ""
Local cURL     	:= PadR(GetNewPar("MV_SPEDURL","http://"),250)
Local cXmlInut  := ""
Local cXml		:= ""
//Local cWhere	:= ""
Local cXmlProt	:= ""
//local cAviso    := ""
//local cErro     := ""
//local cTab		  := ""
//local cCmpNum	  := ""
////local cCmpSer	  := ""
//local cCmpTipo  := ""
//local cCmpLoja  := ""
//local cCmpCliFor:= ""
//local cCnpj	  	:= ""
//Local cEventoCTe:= ""
//Local cRetEvento:= ""
//Local cRodapCTe  :=""
//local cCabCTe    :=""
//Local cIdEven	 := ""
Local lOk      	:= .F.
Local lFlush  	:= .T.
Local lFinal   	:= .F. 
//Local lClearFilter := .F. 
//Local lExporta 	:= .F. 
Local lUsaColab	:= .F. 

Local nHandle  	:= 0
Local nX        := 0 
//Local nY		:= 0

//Local aInfXml	:= {}

Local oRetorno
Local oWS
Local oXML

Default nTipo	:= 1
Default cNotaIni:=""
Default cNotaFim:=""
Default dDataDe :=CtoD("  /  /  ")
Default dDataAte:=CtoD("  /  /  ")
Default lCTe	:= .T.

lUsaColab := UsaColaboracao( IIF(lCte,"2","1") )

If nTipo == 3
	If !Empty( GetNewPar("MV_NFCEURL","") )
		cURL := PadR(GetNewPar("MV_NFCEURL","http://"),250)
	Endif
Endif

If IntTMS() .And. lCTe //Altera o conteúdo da variavel quando for carta de correção para o CTE
	cTipoNfe := "SAIDA"
EndIf
ProcRegua(Val(cNotaFim)-Val(cNotaIni))

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Corrigi diretorio de destino                                           ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
SplitPath(cDirDest,@cDrive,@cDestino,"","")
cDestino := cDrive+cDestino
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Inicia processamento                                                   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Do While lFlush

	If ( nTipo == 1 .And. !lUsaColab ).Or. nTipo == 3
		oWS:= WSNFeSBRA():New()
		oWS:cUSERTOKEN        := "TOTVS"
		oWS:cID_ENT           := cIdEnt 
		oWS:_URL              := AllTrim(cURL)+"/NFeSBRA.apw"
		oWS:cIdInicial        := cIdflush // cNotaIni
		oWS:cIdFinal          := cSerie+cNotaFim
		oWS:dDataDe           := dDataDe
		oWS:dDataAte          := dDataAte
		oWS:cCNPJDESTInicial  := cCnpjDIni
		oWS:cCNPJDESTFinal    := cCnpjDFim
		oWS:nDiasparaExclusao := 0
		lOk:= oWS:RETORNAFX()
		oRetorno := oWS:oWsRetornaFxResult
	
		If lOk
			ProcRegua(Len(oRetorno:OWSNOTAS:OWSNFES3))
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Exporta as notas                                                       ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	
		    For nX := 1 To Len(oRetorno:OWSNOTAS:OWSNFES3)
		    
                //Ponto de Entrada para permitir filtrar as NF
                If ExistBlock("SPDNFE01")
                   If !ExecBlock("SPDNFE01",.f.,.f.,{oRetorno:OWSNOTAS:OWSNFES3[nX]})
                      loop
                   Endif
                Endif
		    
		 		oXml    := oRetorno:OWSNOTAS:OWSNFES3[nX]
				oXmlExp := XmlParser(oRetorno:OWSNOTAS:OWSNFES3[nX]:OWSNFE:CXML,"","","")
				cXML	:= "" 
				If Type("oXmlExp:_NFE:_INFNFE:_DEST:_CNPJ")<>"U" 
					cCNPJDEST := AllTrim(oXmlExp:_NFE:_INFNFE:_DEST:_CNPJ:TEXT)
				ElseIF Type("oXmlExp:_NFE:_INFNFE:_DEST:_CPF")<>"U"
					cCNPJDEST := AllTrim(oXmlExp:_NFE:_INFNFE:_DEST:_CPF:TEXT)				
				Else
	    			cCNPJDEST := ""
    			EndIf	
    				cVerNfe := IIf(Type("oXmlExp:_NFE:_INFNFE:_VERSAO:TEXT") <> "U", oXmlExp:_NFE:_INFNFE:_VERSAO:TEXT, '')                                 
	  				cVerCte := Iif(Type("oXmlExp:_CTE:_INFCTE:_VERSAO:TEXT") <> "U", oXmlExp:_CTE:_INFCTE:_VERSAO:TEXT, '')
		 		If !Empty(oXml:oWSNFe:cProtocolo)
			    	cNotaIni := oXml:cID	 		
					cIdflush := cNotaIni
			 		cNFes := cNFes+cNotaIni+CRLF
			 		cChvNFe  := NfeIdSPED(oXml:oWSNFe:cXML,"Id")	 			
					cModelo := cChvNFe
					cModelo := StrTran(cModelo,"NFe","")
					cModelo := StrTran(cModelo,"CTe","")
					cModelo := SubStr(cModelo,21,02)
					
					Do Case
						Case cModelo == "57"
							cPrefixo := "CTe"
						Case cModelo == "65"
							cPrefixo := "NFCe"
						OtherWise
							if '<cStat>301</cStat>' $ oXml:oWSNFe:cxmlPROT .or. '<cStat>302</cStat>' $ oXml:oWSNFe:cxmlPROT								
								cPrefixo := "den"								
							else
								cPrefixo := "NFe"
							endif	
					EndCase	 				
					
		 			nHandle := FCreate(cDestino+SubStr(cChvNFe,4,44)+"-"+cPrefixo+".xml")
		 			If nHandle > 0
		 				cCab1 := '<?xml version="1.0" encoding="UTF-8"?>'
		 				If cModelo == "57"
							//cCab1  += '<cteProc xmlns="http://www.portalfiscal.inf.br/cte" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.portalfiscal.inf.br/cte procCTe_v'+cVerCte+'.xsd" versao="'+cVerCte+'">'
							cCab1  += '<cteProc xmlns="http://www.portalfiscal.inf.br/cte" versao="'+cVerCte+'">'
							cRodap := '</cteProc>'
						Else
							Do Case
								Case cVerNfe <= "1.07"
									cCab1 += '<nfeProc xmlns="http://www.portalfiscal.inf.br/nfe" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.portalfiscal.inf.br/nfe procNFe_v1.00.xsd" versao="1.00">'
								Case cVerNfe >= "2.00" .And. "cancNFe" $ oXml:oWSNFe:cXML
									cCab1 += '<procCancNFe xmlns="http://www.portalfiscal.inf.br/nfe" versao="' + cVerNfe + '">'
								OtherWise
									cCab1 += '<nfeProc xmlns="http://www.portalfiscal.inf.br/nfe" versao="' + cVerNfe + '">'
							EndCase
							cRodap := '</nfeProc>'
						EndIf
						FWrite(nHandle,AllTrim(cCab1))							
			 			FWrite(nHandle,AllTrim(oXml:oWSNFe:cXML))
			 			FWrite(nHandle,AllTrim(oXml:oWSNFe:cXMLPROT))
						FWrite(nHandle,AllTrim(cRodap))	 
			 			FClose(nHandle)
			 			aadd(aDeleta,oXml:cID)
			 			
			 			cXML := AllTrim(cCab1)
						cXML += AllTrim(oXml:oWSNFe:cXML)
						cXML += AllTrim(oXml:oWSNFe:cXMLPROT)
						cXML += AllTrim(cRodap)
			 			
			 		EndIf					
			 	EndIf
			 	
			 	If ( oXml:OWSNFECANCELADA <> Nil .And. !Empty(oXml:oWSNFeCancelada:cProtocolo) )
					
					cChave 	  := oXml:OWSNFECANCELADA:CXML
					If cModelo == "57" .and. cVerCte >='2.00'
						cChaveCc1 := At("<chCTe>",cChave)+7
					else
			 	   		cChaveCc1 := At("<chNFe>",cChave)+7
			 	   endif
			 	    cChaveCan := SubStr(cChave,cChaveCc1,44)
			 
				
					oWS:= WSNFeSBRA():New()
					oWS:cUSERTOKEN	:= "TOTVS"
					oWS:cID_ENT		:= cIdEnt 
					oWS:_URL		:= AllTrim(cURL)+"/NFeSBRA.apw" 
					oWS:cID_EVENTO	:= "110111"       
					oWS:cChvInicial	:= cChaveCan
					oWS:cChvFinal	:= cChaveCan
					lOk				:= oWS:NFEEXPORTAEVENTO()
					oRetEvCanc 	:= oWS:oWSNFEEXPORTAEVENTORESULT
					  
							
					if lOk
									
						ProcRegua(Len(oRetEvCanc:CSTRING))
						//---------------------------------------------------------------------------
						//| Exporta Cancelamento do Evento da Nf-e                                  |
						//---------------------------------------------------------------------------
				//Estava dando erro quando tentava pegar nota fiscal cancelada. 
				//Comentado por Tarcísio 
					 /*   For nY := 1 To Len(oRetEvCanc:CSTRING)		    		    
					 		//cXml    := SpecCharc(oRetEvCanc:CSTRING[nY])
					 		//oXmlExp := XmlParser(cXml,"_",@cErro,@cAviso)
					 		If cModelo == "57" .and. cVerCte >='2.00'				 		
					 			if Type("oXmlExp:_PROCEVENTONFE:_RETEVENTO:_CTERECEPCAOEVENTORESULT:_RETEVENTOCTE:_INFEVENTO:_CHCTE")<>"U"				
							       	cIdEven	:= 'ID'+oXmlExp:_PROCEVENTONFE:_RETEVENTO:_CTERECEPCAOEVENTORESULT:_RETEVENTOCTE:_INFEVENTO:_CHCTE:TEXT
							  	elseIf Type("oXmlExp:_PROCEVENTONFE:_RETEVENTO:_RETEVENTOCTE:_INFEVENTO:_CHCTE")<>"U"
							  		cIdEven	:= 'ID'+oXmlExp:_PROCEVENTONFE:_RETEVENTO:_RETEVENTOCTE:_INFEVENTO:_CHCTE:TEXT
								endif
								
								If (Type("oXmlExp:_PROCEVENTONFE:_EVENTO:_EVENTOCTE")<>"U") .and. (Type("oXmlExp:_PROCEVENTONFE:_RETEVENTO:_CTERECEPCAOEVENTORESULT:_RETEVENTOCTE")<>"U") 
					 				cCabCTe   := '<procEventoCTe xmlns="http://www.portalfiscal.inf.br/cte" versao="'+cVerCte+'">'
					 				cEventoCTe:= XmlSaveStr(oXmlExp:_PROCEVENTONFE:_EVENTO:_EVENTOCTE,.F.)
					 				cRetEvento:= XmlSaveStr(oXmlExp:_PROCEVENTONFE:_RETEVENTO:_CTERECEPCAOEVENTORESULT:_RETEVENTOCTE,.F.)
					 				cRodapCTe := '</procEventoCTe>'				
					 				CxML:= cCabCTe+cEventoCTe+cRetEvento+cRodapCTe				 				
								ElseIf (Type("oXmlExp:_PROCEVENTONFE:_EVENTO:_EVENTOCTE")<>"U") .and. (Type("oXmlExp:_PROCEVENTONFE:_RETEVENTO:_RETEVENTOCTE:_INFEVENTO")<>"U")
					 				cCabCTe   := '<procEventoCTe xmlns="http://www.portalfiscal.inf.br/cte" versao="'+cVerCte+'">'
					 				cEventoCTe:= XmlSaveStr(oXmlExp:_PROCEVENTONFE:_EVENTO:_EVENTOCTE,.F.)
					 				cRetEvento:= XmlSaveStr(oXmlExp:_PROCEVENTONFE:_RETEVENTO:_RETEVENTOCTE,.F.)
					 				cRodapCTe := '</procEventoCTe>'				
					 				CxML:= cCabCTe+cEventoCTe+cRetEvento+cRodapCTe
					 			EndIf	 							 								 			
				 		
					 		else
								if Type("oXmlExp:_PROCEVENTONFE:_EVENTO:_ENVEVENTO:_EVENTO:_INFEVENTO:_ID")<>"U"					
									cIdEven	:= oXmlExp:_PROCEVENTONFE:_EVENTO:_ENVEVENTO:_EVENTO:_INFEVENTO:_ID:TEXT
								else
//									cIdEven  := oXmlExp:_PROCEVENTONFE:_EVENTO:_INFEVENTO:_ID:TEXT 
								endif
							endif
							 
								
				 			//nHandle := FCreate(cDestino+SubStr(cIdEven,3)+"-Canc.xml")
				 			if nHandle > 0
								FWrite(nHandle,AllTrim(cXml))							
					 			FClose(nHandle)
					 		endIf								 				 						    
					   Next nY	*/ 							
					Else 
						cChvNFe  := NfeIdSPED(oXml:oWSNFeCancelada:cXML,"Id")
					 	cNotaIni := oXml:cID	 		
						cIdflush := cNotaIni
				 		cNFes := cNFes+cNotaIni+CRLF
					 	If !"INUT"$oXml:oWSNFeCancelada:cXML
				 			nHandle := FCreate(cDestino+SubStr(cChvNFe,3,44)+"-ped-can.xml")
				 			If nHandle > 0
				 				cCanc := oXml:oWSNFeCancelada:cXML
				 				If cModelo == "57"
				 					oXml:oWSNFeCancelada:cXML := '<procCancCTe xmlns="http://www.portalfiscal.inf.br/cte" versao="' + cVerCte + '">' + oXml:oWSNFeCancelada:cXML + "</procCancCTe>"			 					
				 				Else
				 					oXml:oWSNFeCancelada:cXML := '<procCancNFe xmlns="http://www.portalfiscal.inf.br/nfe" versao="' + cVerNfe + '">' + oXml:oWSNFeCancelada:cXML + "</procCancNFe>"
				 				EndIf	
					 			FWrite(nHandle,oXml:oWSNFeCancelada:cXML)
					 			FClose(nHandle)
					 			aadd(aDeleta,oXml:cID)
					 		EndIf
				 			nHandle := FCreate(cDestino+"\"+SubStr(cChvNFe,3,44)+"-can.xml")
				 			If nHandle > 0
					 			If cModelo == "57"
					 				FWrite(nHandle,'<procCancCTe xmlns="http://www.portalfiscal.inf.br/cte" versao="' + cVerCte + '">' + cCanc + oXml:oWSNFeCancelada:cXMLPROT + "</procCancCTe>")
					 			Else
									FWrite(nHandle,'<procCancNFe xmlns="http://www.portalfiscal.inf.br/nfe" versao="' + cVerNfe + '">' + cCanc + oXml:oWSNFeCancelada:cXMLPROT + "</procCancNFe>")				 			
					 			EndIF	
					 			FClose(nHandle)
					 		EndIf
						Else 
								
	//						If Type("oXml:OWSNFECANCELADA:CXML")<>"U"
						 	    cXmlInut  := oXml:OWSNFECANCELADA:CXML
						 	    cAnoInut1 := At("<ano>",cXmlInut)+5
						 	    cAnoInut  := SubStr(cXmlInut,cAnoInut1,2)
						 	    cXmlProt  := EncodeUtf8(oXml:oWSNFeCancelada:cXMLPROT)
	//					 	EndIf
				 			nHandle := FCreate(cDestino+SubStr(cChvNFe,3,2)+cAnoInut+SubStr(cChvNFe,5,39)+"-ped-inu.xml")
				 			If nHandle > 0
					 			FWrite(nHandle,oXml:OWSNFECANCELADA:CXML)
					 			FClose(nHandle)
					 			aadd(aDeleta,oXml:cID)
					 		EndIf
				 			nHandle := FCreate(cDestino+"\"+cAnoInut+SubStr(cChvNFe,5,39)+"-inu.xml")
				 			If nHandle > 0
					 			FWrite(nHandle,cXmlProt)
					 			FClose(nHandle)
					 		EndIf		 	
					 	EndIf
					EndIf	
				EndIf
				IncProc()
			Next nX
*/
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Exclui as notas                                                        ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			If !Empty(aDeleta) .And. GetNewPar("MV_SPEDEXP",0)<>0
				oWS:= WSNFeSBRA():New()
				oWS:cUSERTOKEN        := "TOTVS"
				oWS:cID_ENT           := cIdEnt
				oWS:nDIASPARAEXCLUSAO := GetNewPar("MV_SPEDEXP",0)
				oWS:_URL              := AllTrim(cURL)+"/NFeSBRA.apw"		
				oWS:oWSNFEID          := NFESBRA_NFES2():New()
				oWS:oWSNFEID:oWSNotas := NFESBRA_ARRAYOFNFESID2():New()
			    For nX := 1 To Len(aDeleta)	    
					aadd(oWS:oWSNFEID:oWSNotas:oWSNFESID2,NFESBRA_NFESID2():New())
					Atail(oWS:oWSNFEID:oWSNotas:oWSNFESID2):cID := aDeleta[nX]
			    Next nX
				If !oWS:RETORNANOTAS()
					//Aviso("SPED",IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3)),{STR0046},3)
					lFlush := .F.	
				EndIf
			EndIf
			aDeleta  := {}
		    If ( Len(oRetorno:OWSNOTAS:OWSNFES3) == 0 .And. Empty(cNfes) )
			   	Aviso("SPED","Não há dados",{"Ok"})	// "Não há dados"
				lFlush := .F.	
			Else
				If !Empty(cChvNFe)
					AADD(aXmlGer,{cDestino+SubStr(cChvNFe,4,44)+"-"+cPrefixo+".xml"})
		    	Endif
		    EndIf
		Else
			//Aviso("SPED",IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3))+CRLF+STR0046,{"OK"},3)
			lFinal := .T.
		EndIf

		cIdflush := AllTrim(Substr(cIdflush,1,3) + StrZero((Val( Substr(cIdflush,4,Len(AllTrim(mv_par02))))) + 1 ,Len(AllTrim(mv_par02))))
		

		#IFDEF TOP	
			If select (cAlias)>0
			 	(cAlias)->(dbCloseArea())
			EndIf	
		#ENDIF
		lFlush := .F.
	EndIF
EndDo
If lmvczaa
	return cXml
Endif
Return(.T.)

Static Function IsReady(cURL,nTipo,lHelp,lUsaColab)

Local cHelp    := ""
local cError	:= ""
Local lRetorno := .F.
DEFAULT nTipo := 1
DEFAULT lHelp := .F.
DEFAULT lUsaColab := .F.

if !lUsaColab
   If FunName() <> "LOJA701"
   		If !Empty(cURL) .And. !PutMV("MV_SPEDURL",cURL)
			RecLock("SX6",.T.)
			SX6->X6_FIL     := xFilial( "SX6" )
			SX6->X6_VAR     := "MV_SPEDURL"
			SX6->X6_TIPO    := "C"
			SX6->X6_DESCRIC := "URL SPED NFe"
			MsUnLock()
			PutMV("MV_SPEDURL",cURL)
		EndIf
		SuperGetMv() //Limpa o cache de parametros - nao retirar
		DEFAULT cURL      := PadR(GetNewPar("MV_SPEDURL","http://"),250)
	Else
		If !Empty(cURL) .And. !PutMV("MV_NFCEURL",cURL)
			RecLock("SX6",.T.)
			SX6->X6_FIL     := xFilial( "SX6" )
			SX6->X6_VAR     := "MV_NFCEURL"
			SX6->X6_TIPO    := "C"
			SX6->X6_DESCRIC := "URL de comunicação com TSS"
			MsUnLock()
			PutMV("MV_NFCEURL",cURL)
		EndIf
		SuperGetMv() //Limpa o cache de parametros - nao retirar
		DEFAULT cURL      := PadR(GetNewPar("MV_NFCEURL","http://"),250)	
	EndIf	
		
	
	//Verifica se o servidor da Totvs esta no ar	
	if(isConnTSS(@cError))	
		lRetorno := .T.
	
	else
		if lHelp
			Aviso("SPED", cError, {"Ok"}, 3)
		endIf
		
		lRetorno := .F.
		
	endIf
	
	
	//Verifica se Há Certificado configurado	
	If nTipo <> 1 .And. lRetorno		
		
		if( isCfgReady(, @cError) )
			lRetorno := .T.
		else	
			If nTipo == 3
				cHelp := cError
			
				If lHelp .And. !"003" $ cHelp
					Aviso("SPED",cHelp,{"OK"},3)
					lRetorno := .F.
			
				EndIf		
			
			Else
				lRetorno := .F.
			
			EndIf
		endif

	EndIf
	
	//Verifica Validade do Certificado	
	If nTipo == 2 .And. lRetorno
		isValidCert(, @cError)
	EndIf
	
else
	lRetorno := ColCheckUpd()
	if lHelp .And. !lRetorno .And. !lAuto
		MsgInfo("UPDATE do TOTVS Colaboração 2.0 não aplicado. Desativado o uso do TOTVS Colaboração 2.0")		
	endif	
endif

Return(lRetorno)

Static Function GetIdEnt(lUsaColab,cFilOrig)

local cIdEnt := ""
local cError := ""

Default lUsaColab := .F.

If !lUsaColab

	cIdEnt := getCfgEntidade(@cError)
	
	//Validação Entidade TSS, diferente para cada Filial
	If AllTrim(cFilOrig) = '0101'
	cIdEnt := "000009"
	ElseIf AllTrim(cFilOrig) = '0102' 
	cIdEnt := "000007"
	ElseIf AllTrim(cFilOrig) = '0103' 
	cIdEnt := "000006"
	ElseIf AllTrim(cFilOrig) = '0104' 
	cIdEnt := "000004"
	ElseIf AllTrim(cFilOrig) = '0105' 
	cIdEnt := "000003"
	ElseIf AllTrim(cFilOrig) = '0106' 
	cIdEnt := "000010"
	ElseIf AllTrim(cFilOrig) = '0107' 
	cIdEnt := "000014"
	ElseIf AllTrim(cFilOrig) = '0108' 
	cIdEnt := "000001"
	ElseIf AllTrim(cFilOrig) = '0109' 
	cIdEnt := "000022"
	ElseIf AllTrim(cFilOrig) = '0110' 
	cIdEnt := "000015"
	ElseIf AllTrim(cFilOrig) = '0111' 
	cIdEnt := "000016"
	ElseIf AllTrim(cFilOrig) = '0112' //Não habilitado
	cIdEnt := ""
	ElseIf AllTrim(cFilOrig) = '0113' 
	cIdEnt := "000024"
	EndIf
	
	if(empty(cIdEnt))
		Aviso("SPED", cError, {"OK"}, 3)

	endif	

else
	if !( ColCheckUpd() )
		Aviso("SPED","UPDATE do TOTVS Colaboração 3.0 não aplicado. Desativado o uso do TOTVS Colaboração 3.0",{"OK"},3)	
	else
		cIdEnt := "000000"
	endif	 
endIf	

Return(cIdEnt)
