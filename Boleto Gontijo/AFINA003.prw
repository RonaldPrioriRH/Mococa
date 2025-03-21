#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "COLORS.CH"
#INCLUDE "RPTDEF.CH"
#INCLUDE "FWPrintSetup.ch" 
#INCLUDE "topconn.ch"



user function AFINA003(aNotas)
	Local nx
	Local cDataIni      := cDataFim := ctod(space(8))
	Private cMV_PAR01   := cMV_PAR02 := cMV_PAR03 := ''
	
	Private lVerPerg2 	:= .f.
	Private lAtivo  	:= .f.
	Default lRoboCarga 	:= .f.
	Default aNotas      := {}
	If lRoboCarga
		lPergunte := .t.

		For nX := 1 to len(aNotas)
			SF2->(DbSetOrder(1))
			SF2->(DbSeek(xFilial("SF2")+aNotas[nX][1]+aNotas[nX][2] ))

			if SF2->F2_FIMP == "S" //se nao autorizada

				cMV_PAR01 := iif(empty(cMV_PAR01),SF2->F2_DOC,iif(SF2->F2_DOC < cMV_PAR01, SF2->F2_DOC, cMV_PAR01))
				cMV_PAR02 := iif(empty(cMV_PAR02),SF2->F2_DOC,iif(SF2->F2_DOC > cMV_PAR02, SF2->F2_DOC, cMV_PAR02))
				cDataIni := iif(empty(cDataIni),sf2->f2_emissao,iif(sf2->f2_emissao < cDataIni,sf2->f2_emissao,cDataIni))
				cDataFim := iif(empty(cDataFim),sf2->f2_emissao,iif(sf2->f2_emissao < cDataFim,sf2->f2_emissao,cDataFim))
				cMV_PAR03  := SF2->F2_SERIE

			endif
		next nX
		//Pergunte("NFSIGWBOL",.f.)

		//cMV_PAR01 := MV_PAR01 	//	Nota de 
		//cMV_PAR02 := MV_PAR02 	//	Nota Ate
		//cMV_PAR03 := MV_PAR03 	//	Serie
		cMV_PAR04 := 2			//	Nf.Saida
		cMV_PAR05 := 2			//  Imprime no verso? (setado N�O)
		cMV_PAR06 := 2			//  Danfe Simplificado? (Setado n�o)
		cMV_PAR07 := cDataIni	//  Data de
		cMV_PAR08 := cDataFim	//  Data at�
		cMV_PAR09 := 1			//  Enviar e-mail novamente (setado n�o)
		cMV_PAR10 := 2 			//  Imprime boleto na impressora (setado sim)
	Else
		lPergunte := Pergunte("NFSIGWBOL",.T.)
		cMV_PAR01 := MV_PAR01 //Nota de 
		cMV_PAR02 := MV_PAR02 //Nota Ate
		cMV_PAR03 := MV_PAR03 //Serie
		cMV_PAR04 := MV_PAR04
		cMV_PAR05 := MV_PAR05
		cMV_PAR06 := MV_PAR06
		cMV_PAR07 := MV_PAR07
		cMV_PAR08 := MV_PAR08
		cMV_PAR09 := MV_PAR09
		cMV_PAR10 := MV_PAR10 //Imprime boleto na impressora
	Endif
	if lPergunte
		
		cEOL2 := Chr(13)+Chr(10)
		_cQry := "SELECT * FROM  "+RetSqlName("SF2") + cEOL2
		_cQry += " WHERE D_E_L_E_T_ <> '*' " + cEOL2
		_cQry += " AND F2_DOC BETWEEN '"+cMV_PAR01+"' AND '"+cMV_PAR02+"' " + cEOL2
		_cQry += " AND F2_FILIAL = '"+xFilial("SF2")+"' " + cEOL2
		_cQry += " AND F2_SERIE = '"+cMV_PAR03+"'  " + cEOL2
		If Select("TMP_aux") > 0
			TMP_aux->(dbCloseArea())
		endif

		TcQuery _cQry New Alias "TMP_aux"
				
		while  !TMP_aux->(eof())
			if !funImp()
				exit 
			endif 
			oDanfeAux := nil 
			FreeObj(oDanfeAux)
			TMP_aux->(dbskip())
		enddo	
	endif
	If lRoboCarga 
		Return .t.
	Endif
return 

static function funImp

	Local nX := 0
	Private cIdEnt 		:= ""
	Private aIndArq   	:= {}
	Private oDanfeAux
	Private oSetup
	Private aDevice  		:= {}
	Private cSession  	:= GetPrinterSession()
	Private nRet 			:= 0
	Private lUsaColab		:= UsaColaboracao("1")
	Private cBarra		:= ""
	//Private nX 			:= 0
	Private cDir			:= ""
	Private lJob			:= isBlind()
	Private lDanfeII		:= findfunction("u_PrtNfeSef")
	Private lDanfeIII		:= findfunction("u_DANFE_P1")
	Private lMsgVld		:= .F.

	Default nTipo		:= 0
	default nPar		:= 0
	default cFilePrint	:= ""
	

	If findfunction("U_DANFE_V") .and. if(lJob, nPar == 1, .T.)
		nRet := U_Danfe_v()
	Elseif findfunction("U_DANFE_VI") .and. if(lJob, nPar == 2, .T.)// Incluido esta valida��o pois o cliente informou que n�o utiliza o DANFEII
		nRet := U_Danfe_vi()
	EndIf

	AADD(aDevice,"DISCO") // 1
	AADD(aDevice,"SPOOL") // 2
	AADD(aDevice,"EMAIL") // 3
	AADD(aDevice,"EXCEL") // 4
	AADD(aDevice,"HTML" ) // 5
	AADD(aDevice,"PDF"  ) // 6

	cIdEnt := GetIdEnt(lUsaColab)
	cFilePrint := "DANFE_"+cIdEnt+Dtos(MSDate())+StrTran(Time(),":","")
	nPrivate       	:= If(fwGetProfString(cSession,"LOCAL","SERVER",.T.)=="SERVER",1,2 )
	nOrientation 	:= If(fwGetProfString(cSession,"ORIENTATION","PORTRAIT",.T.)=="PORTRAIT",1,2)
	cDevice     	:= If(Empty(fwGetProfString(cSession,"PRINTTYPE","SPOOL",.T.)),"PDF",fwGetProfString(cSession,"PRINTTYPE","SPOOL",.T.))
	nPrintType      := aScan(aDevice,{|x| x == cDevice })

	//�������������������������������������������Ŀ
	//�Ajuste no pergunte NFSIGW                  �
	//���������������������������������������������
	//AjustaSX1()

	cBarra := "\"
	if IsSrvUnix()
		cBarra := "/"
	endif
	If IsReady(,,,lUsaColab) 
		dbSelectArea("SF2")
		RetIndex("SF2")
		dbClearFilter()
		//������������������������������������������������������������������������Ŀ
		//�Obtem o codigo da entidade                                              �
		//��������������������������������������������������������������������������
		If nRet >= 20100824 

			cDir := SuperGetMV('MV_RELT',,"\SPOOL\")
			if !empty(cDir) .and. !ExistDir(cDir)
				aDir := StrTokArr(cDir, cBarra)
				cDir := ""
				for nX := 1 to len(aDir)
					cDir += aDir[nX] + cBarra
					if !ExistDir(cDir)
						MakeDir(cDir)
					endif
				next
			endif

			If nTipo <> 1
				lAdjustToLegacy := .F. // Inibe legado de resolu��o com a TMSPrinter
				oDanfeAux := FWMSPrinter():New(cFilePrint, IMP_PDF, lAdjustToLegacy, cDir /*cPathInServer*/, .T. )

				if lJob
					oDanfeAux:SetViewPDF(.F.)
					oDanfeAux:lInJob := .T.
				endif

				// ----------------------------------------------
				// Cria e exibe tela de Setup Customizavel
				// OBS: Utilizar include "FWPrintSetup.ch"
				// ----------------------------------------------
				//nFlags := PD_ISTOTVSPRINTER+ PD_DISABLEORIENTATION + PD_DISABLEPAPERSIZE + PD_DISABLEPREVIEW + PD_DISABLEMARGIN
				nFlags := PD_ISTOTVSPRINTER + PD_DISABLEPAPERSIZE + PD_DISABLEPREVIEW + PD_DISABLEMARGIN
				If ( !oDanfeAux:lInJob )
					oSetup := FWPrintSetup():New(nFlags, "DANFE")
					// ----------------------------------------------
					// Define saida
					// ----------------------------------------------
					nLocal       	:= 2 //If(fwGetProfString(cSession,"LOCAL","SERVER",.T.)=="SERVER",1,2 ) // Padr�o Local 
					nOrientation 	:= If(fwGetProfString(cSession,"ORIENTATION","PORTRAIT",.T.)=="PORTRAIT",1,2)
					cDevice     	:= If(Empty(fwGetProfString(cSession,"PRINTTYPE","SPOOL",.T.)),"PDF",fwGetProfString(cSession,"PRINTTYPE","SPOOL",.T.))
					nPrintType      := aScan(aDevice,{|x| x == cDevice })

					oSetup:SetPropert(PD_PRINTTYPE   , nPrintType)
					oSetup:SetPropert(PD_ORIENTATION , nOrientation)
					oSetup:SetPropert(PD_DESTINATION , nLocal)
					oSetup:SetPropert(PD_MARGIN      , {60,60,60,60})
					oSetup:SetPropert(PD_PAPERSIZE   , 2)

					If ExistBlock( "SPNFESETUP" )
						Execblock( "SPNFESETUP" , .F. , .F. , {oDanfeAux, oSetup} )
					Endif
				EndIf

				// ----------------------------------------------
				// Pressionado bot�o OK na tela de Setup
				// ----------------------------------------------
				if !lAtivo 
					oSetup:Activate() 
					if oSetup:nModalResult == 1
						lAtivo := .T.
					else	
					  return .F.  
					endif 
				endif 

				if oSetup:aoptions[1] != 2
					Aviso("Aten��o","Selecione a impressora Local para impress�o!",{"OK"})
					return .F.  
				endif 

				If lAtivo  // PD_OK =1
					//�������������������������������������������Ŀ
					//�Salva os Parametros no Profile             �
					//���������������������������������������������

					fwWriteProfString( cSession, "LOCAL"      , if( lJob, "SERVER"		, If(oSetup:GetProperty(PD_DESTINATION)==1 ,"SERVER"    ,"CLIENT"    )), .T. )
					fwWriteProfString( cSession, "PRINTTYPE"  , if( lJob, "PDF"		, If(oSetup:GetProperty(PD_PRINTTYPE)==2   ,"SPOOL"     ,"PDF"       )), .T. )
					fwWriteProfString( cSession, "ORIENTATION", if( lJob, "LANDSCAPE"	, If(oSetup:GetProperty(PD_ORIENTATION)==1 ,"PORTRAIT"  ,"LANDSCAPE" )), .T. )

					// Configura o objeto de impress�o com o que foi configurado na interface.
					oDanfeAux:setCopies( val( if( lJob, "1", oSetup:cQtdCopia )) )

					If ( lJob .and. nPar == 1 ) .or. ( !lJob .and. oSetup:GetProperty(PD_ORIENTATION) == 1 )
						
							
							MV_PAR01 := TMP_aux->F2_DOC
							MV_PAR02 := TMP_aux->F2_DOC
							MV_PAR03 := cMV_PAR03
							MV_PAR04 := cMV_PAR04
							MV_PAR05 := cMV_PAR05
							MV_PAR06 := cMV_PAR06
							MV_PAR07 := cMV_PAR07
							MV_PAR08 := cMV_PAR08
							MV_PAR09 := cMV_PAR09
							MV_PAR10 := cMV_PAR10 // Caique manda para impressora
							
							Private lVerPerg2 := .F.
							_aBoleto := {}
							aadd( _aBoleto, space(3) )
							aadd( _aBoleto, "ZZZ" )
							aadd( _aBoleto, TMP_aux->F2_DOC )
							aadd( _aBoleto, TMP_aux->F2_DOC )
							aadd( _aBoleto, Space( Len(SE1->E1_PARCELA) )  )
							aadd( _aBoleto, Replicate("Z",Len(SE1->E1_PARCELA) ) )
							aadd( _aBoleto, Space( Len(SE1->E1_PORTADO) )  )
							aadd( _aBoleto, Replicate("Z",Len(SE1->E1_PORTADO) ) )
							aadd( _aBoleto, TMP_aux->F2_CLIENTE )
							aadd( _aBoleto, TMP_aux->F2_CLIENTE )
							aadd( _aBoleto, TMP_aux->F2_LOJA )
							aadd( _aBoleto, TMP_aux->F2_LOJA )
							aadd( _aBoleto, stod(TMP_aux->F2_EMISSAO) )
							aadd( _aBoleto, stod(TMP_aux->F2_EMISSAO) )
							aadd( _aBoleto, stod('20100101') )
							aadd( _aBoleto, stod('20900101') )
							aadd( _aBoleto, Space( Len(SE1->E1_NUMBOR) )  )
							aadd( _aBoleto, Replicate("Z",Len(SE1->E1_NUMBOR) ) )
							aadd( _aBoleto, Space( Len(SF2->F2_CARGA) )  )
							aadd( _aBoleto, Replicate("Z",Len(SF2->F2_CARGA) ) )
							aadd( _aBoleto, "" )
							aadd( _aBoleto, "" )
							aadd( _aBoleto, 0 )

							if lDanfeII
						  		u_PrtNfeSef(cIdEnt ,/*cVal1*/ ,/*cVal2*/ ,oDanfeAux ,oSetup ,cFilePrint ,/*lIsLoja*/, /*nTipo*/)
								u_AFINA002(_aBoleto,,,,oDanfeAux,"Impressora",) //Direto Impressora
								u_AFINA002(_aBoleto,,,,oDanfeAux,"Email") //por e-mail
							endif 
					EndIf
				Endif
			endif 
		endif 
	EndIf

	oDanfeAux := Nil
	oSetup := Nil

	//Limpa arquivos temporarios .rel da pasta MV_RELT
	//SpedCleRelt()

Return .T. 



Static Function IsReady(cURL,nTipo,lHelp,lUsaColab)

	Private nX       := 0
	Private cHelp    := ""
	Private cError	:= ""
	Private oWS
	Private lRetorno := .F.
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
				SX6->X6_DESCRIC := "URL de comunica��o com TSS"
				MsUnLock()
				PutMV("MV_NFCEURL",cURL)
			EndIf
			SuperGetMv() //Limpa o cache de parametros - nao retirar
			DEFAULT cURL      := PadR(GetNewPar("MV_NFCEURL","http://"),250)
		EndIf
		//Verifica se o servidor da Totvs esta no ar
		if(isConnTSS(@cError))
			lRetorno := .T.
		Else
			If lHelp
				Aviso("SPED",IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3)),{"Execute o compatibilizador para o registro de saida"},3)
			EndIf
			lRetorno := .F.
		EndIf


		//Verifica se H� Certificado configurado
		If nTipo <> 1 .And. lRetorno

			if( isCfgReady(, @cError) )
				lRetorno := .T.
			else
				If nTipo == 3
					cHelp := cError

					If lHelp .And. !"003" $ cHelp
						Aviso("SPED",cHelp,{"ERRO"},3)
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
			MsgInfo("UPDATE do TOTVS Colabora��o 2.0 n�o aplicado. Desativado o uso do TOTVS Colabora��o 2.0")
		endif
	endif

Return(lRetorno)

Static Function GetIdEnt(lUsaColab)

Private cIdEnt := ""
Private cError := ""

Default lUsaColab := .F.

If !lUsaColab

	cIdEnt := getCfgEntidade(@cError)

	if(empty(cIdEnt))
		Aviso("SPED", cError, {"erro"}, 3)

	endif

else
	if !( ColCheckUpd() )
		Aviso("SPED","UPDATE do TOTVS Colabora��o 2.0 n�o aplicado. Desativado o uso do TOTVS Colabora��o 2.0",{"Erro"},3)
	else
		cIdEnt := "000000"
	endif
endIf

Return(cIdEnt)
