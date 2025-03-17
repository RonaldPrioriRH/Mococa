/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³BELCISP  ºAutor  ³MARCO AURÉLIO        º Data ³  18/12/08   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Rotinas Exportacao de Dados - CISP                         º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/ 
#Include "Rwmake.ch"
#Include "TbiConn.ch"
#Include "TopConn.ch"
#Include "FWEVENTVIEWCONSTS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "RPTDEF.CH"  



//#Include "BEL.CH"

#Define lxTeste .F.
#DEFINE MAXPASSO 6

#Define lxTrace .T.
#Define nxTrace 1

User Function BeCispJob()
	Local cxEmp := "01"
	Local cxFil := "07"

	RPCSetType(3)  // Função de: 1-Microsiga, 3-Usuário
	PREPARE ENVIRONMENT EMPRESA cxEmp FILIAL cxFil MODULO "FIN"

	//StartJob( < cName > , < cEnv >      , < lWait >, [ parm1,parm2,...parm25 ] )
	StartJob( "U_NEGCISPJob", GetEnvServer(), .F. )

	U_BelCisp(.T.)

	RPCClearEnv()

Return

User Function BelCisp(lJob)
	Private nMedPVen  := 0 // Média Ponderada de Títulos a Vencer
	Private nMedDVen  := 0 // Prazo Médio de Vendas
	Private aMedAtr   := {}
	Private oDlgCisp  := {}
	DEFAULT lJob      := .F.

	If lJob
	   CalcCISP(.T.,Nil)
	Else
		/*
		@ 020,000 TO 300,280 DIALOG oDlgCisp TITLE 'Geração Arquivo CISP'
		@ 010,015 Say "Este Programa tem como objetivo gerar"
		@ 020,015 Say "um aquivo TXT tabulado com informações"
		@ 030,015 Say "dos clientes da Bel S.A. para ser"
		@ 040,015 Say " enviado para a CISP"
		@ 075,015 Button OemToAnsi('&Gerar') 	    	SIZE 46,13 Action Gerar()
		@ 075,080 Button OemToAnsi('&Sair') 			SIZE 46,13 Action Sair()

		ACTIVATE DIALOG oDlgCisp CENTERED
		*/
		@ 200,1 TO 400,400 DIALOG oDlgCisp TITLE OemToAnsi('Geração Arquivo CISP')
		//@ 10,010 Say "Este Programa tem como objetivo gerar um aquivo TXT tabulado  com " 
		//@ 20,010 Say "informações dos clientes da Bel S.A. para ser enviado para a CISP"
		TSay():New(010,010,{|| "Este Programa tem como objetivo gerar um aquivo TXT tabulado  com " },oDlgCisp,,,,,,.T.,CLR_RED,CLR_WHITE,300,40)
		TSay():New(020,010,{|| "informações dos clientes da Bel S.A. para ser enviado para a CISP"},oDlgCisp,,,,,,.T.,CLR_RED,CLR_WHITE,300,40)
		@ 70,100 BMPBUTTON TYPE 01 ACTION Processa({|| Gerar() },"Gerando arquivo...")
		@ 70,130 BMPBUTTON TYPE 02 ACTION Close(oDlgCisp)
		Activate Dialog oDlgCisp Centered


	EndIf
Return

Static Function Sair()
	Close(oDlgCisp)	
Return(.T.)

Static Function Gerar()
	Local oObj
	Local lBat := .F.

	If Aviso( "Dados para CISP", "Confirma a Geração?", { "  Sim  ", "  Não  " } ) = 1
		oObj := MsNewProcess():New({|lEnd| CalcCISP(lBat,oObj)},"Geração de Dados CISP","",.F.)
		oObj:Activate()
	EndIf
Return

Static Function CalcCISP(lBat,oObj)
	Local lRet     := .T.
	Local lErro    := .F.
	Local cQuery   := ""
	Local cLinha   := ""
	Local nFileIO  := -1
	Local cArqLog  := ""
	Local cDirCisp := Alltrim(SuperGetMV("MV_X_DCISP",.F.,"\disp")) // AllTrim(GetMV("MV_X_DCISP"))
	Local aCompras := {}
	Local aMedAtra := {}
	Local aVincend := {}
	Local aDeb05   := {}
	Local aDeb15   := {}
	Local aDeb30   := {}
	Local aRet1    := {}
	Local dCISP    := SuperGetMV("MV_X_CISPD",.F.,sTod("20080811"))
	Local dLimite  := ""
	Local cBsCnpj  := ""
	Local cDtCad   := ""
	Local lGrava   := .T.
	Local nxCnt    := 0
	Local nxExp    := 0
	Local aAcumulo := {Date(),0}
	Local cMotExc  := ""
	Local cCodCisp   := SuperGetMV("MV_X_CISPC",.F.,"0234") 
	Local cEventI    := "913" //Evento cadastrado na tabela E3
	Local cEventF    := "914" //Evento cadastrado na tabela E3
	Local cMsgI      := "Inicio"
	Local cMsgF      := "Final"
	Local cTitulo    := "CISP"
	Private cEof 		 := chr(13)+chr(10)
	Private fArqLog := 0

	//EventInsert( cChannel, cCateg, cEventID, nLevel, cCargo, cTitle, cMessage, lPublic )
	EventInsert( FW_EV_CHANEL_ENVIRONMENT, FW_EV_CATEGORY_MODULES, cEventI, FW_EV_LEVEL_INFO, "", cTitulo, cMsgI, .T. )

//	dLimite := Date() - 365 //GetMV("MV_X_DLCIS")
	dLimite := sTod( StrZero( Year(Date()) - 1, 4 ) + Right( dTos( Date() ), 4 ) )
	If !lBat
		oObj:SetRegua1(MAXPASSO)
		oObj:IncRegua1("Preparando Ambiente de Cálculo") 
	EndIf

	If ExistDir( cDirCisp ) == .F.
        ConOut( "[CalcCISP] Diretorio de geração inválido!" )
        ConOut( "[CalcCISP] Criando " + cDirCisp )
		MakeDir( cDirCisp )
    EndIf

	// Criando o arquivo de log
	cArqLog := cDirCisp + "\LOG"+dTos(Date())+".TXT"
	If !File(cArqLog)
		fArqLog := fCreate(cArqLog)
	Else
		fArqLog := fOpen(cArqLog,2)
		fSeek(fArqLog,0,2)
	EndIf
	cDirCisp += "\PFJ_" + Alltrim(cCodCisp) + ".TXT"

	CliLog( 1, "Inicio da Geracao dos Dados Para CISP. DtLimite " + dToc( dLimite ) + " DtCISP " + dToc( dCISP ) )
	If lBat		
		U_EnviarEmail( xEMailLog,"Log Cisp "+DTOC(dDatabase),"Inicio da Geracao dos Dados Para CISP. DtLimite " + dToc( dLimite )+ " as "+Time(),,.t.,)
	EndIf
	// Inicia criação do arquivo
	If File(cDirCisp)
		FErase(cDirCisp)
	EndIf
	nFileIO := FCreate(cDirCisp)
	If nFileIO = -1
		// Problemas com a criação de arquivo
		CliLog( 0, "Erro na Criação do Arquivo " + cDirCisp + " DOS Error " + Str(fError(), 3) )
		lRet := .F.
	Else
		// Arquivo Criado
		// Exportar Dados
		//Obr Ord T  Tam Posicao Descricao
		// S   1 9    1 001-001 Tipo
		// S   2 9    4 002-005 Codigo Associado
		// S   3 9   20 006-025 CNPJ/CPF/RG/...
		// S   4 9    8 026-033 Data da Informacao AAAAMMDD
		// S   5 9    8 034-041 Data Cadastramento do Cliente
		// S   6 9    8 042-049 Data Última Compra
		// S   7 9 13,2 050-064 Valor da Última Compra
		// S   8 9    8 065-072 Data do Maior Acumulo
		// S   9 9 13,2 073-087 Valor Maior Acumulo
		//    10 9 13,2 088-102 Valor Débito Atual Total
		//    11 9 13,2 103-117 Valor Limite de Crédito
		//    12 9  4,2 118-123 Média Ponderada Atrazo Pagamentos
		//    13 9  4,2 124-129 Média Aritmética Dias de Atrazo Pagamento
		//    14 9 13,2 130-144 Valor Débito Atual a Vencer
		//    15 9  4,2 145-150 Média Ponderada de Títulos a Vencer
		//    16 9  4,2 151-156 Prazo Médio de Vendas
		//    17 9 13,2 157-171 Valor Débito Atual Vencido + 5 Dias
		//    18 9    4 172-175 Média Ponderada de Atras Titulos Vencidos e nao Pagos + 5 Dias
		//    19 9 13,2 176-190 Valor Débito Atual Vencido + 15 Dias
		//    20 9    4 191-194 Média Ponderada de Atras Titulos Vencidos e nao Pagos + 15 Dias
		//    21 9 13,2 195-209 Valor Débito Atual Vencido + 30 Dias
		//    22 9    4 210-213 Média Ponderada de Atras Titulos Vencidos e nao Pagos + 30 Dias
		//    23 9    8 214-221 Data da Penúltima Compra
		//    24 9 13,2 222-236 Valor da Penúltima Compra
		// S  25 9    1 237-237 Situação do Cálculo Limite de Crédito
		//    26 9    1 238-238 Tipo de Garantia
		//    27 9    2 239-240 Grau da Garantia - Hipoteca
		//    28 9    8 241-248 Data Validade da Garantia
		//    29 9 13,2 249-263 Valor da Garantia
		//    30 9 13,2 264-278 Valor da Venda Pagamento Antecipado
		//    31 C    2 279-280 Venda sem Crédito (Antecipado)
      
		// Execute Store Procedure
		If !lBat
			oObj:IncRegua1("Executando SP BELSA_CISP_INICIO")
		EndIf
		CliLog( 1, "Executando SP BELSA_CISP_INICIO" )
		aRet1 := TCSPExec("BELSA_CISP_INICIO", '', 'ZZZZZZZZ', dTos( dLimite ), dTos( dCISP ) )
		If aRet1[1] <> '1'
			lErro := .T.
		EndIf
		If !lErro
			If !lBat
				oObj:IncRegua1("Executando SP BELSA_CISP_CALCP1") 
			EndIf
			CliLog( 1, "Executando SP BELSA_CISP_CALCP1" )
			aRet1 := TCSPExec("BELSA_CISP_CALCP1", '', 'ZZZZZZZZ', dTos( dLimite ), dTos( dCISP ) )
			If aRet1[1] <> '1'
				lErro := .T.
			EndIf
		EndIf
		If !lErro
			If !lBat
				oObj:IncRegua1("Executando SP BELSA_CISP_MACUM") 
			EndIf
			CliLog( 1, "Executando SP BELSA_CISP_MACUM" )
			aRet1 := TCSPExec("BELSA_CISP_MACUM", '', 'ZZZZZZZZ', dTos( dLimite ), dTos( dCISP ) )
			If aRet1[1] <> '1'
				lErro := .T.
			EndIf
			/*
			CliLog( "Executando SP BELSA_RECALC_MACUM" )
			aRet1 := TCSPExec("BELSA_RECALC_MACUM", '', 'ZZZZZZZZ', dTos(dDatabase) , '20060101' )
			If aRet1[1] <> '1'
				lErro := .T.	
			EndIf
			*/
		EndIf
		CliLog( 1, "Concluido Execucao das SPs" )
		If !lBat
			oObj:IncRegua1("Gerando Arquivo CISP") 
		EndIf

		If !lErro
			cQuery := "SELECT COUNT(*) AS QTDREC "
			cQuery += "FROM " + RetSQLName("ZF9") + " ZF9 "
			cQuery += "WHERE ZF9.D_E_L_E_T_ = ' ' "
			TcQuery cQuery Alias "QSAQTD" New
			If !lBat
				oObj:SetRegua2(QSAQtd->QtdRec)
			EndIf	
			QSAQtd->(dbCloseArea())

			cQuery := "SELECT ZF9.ZF9_CNPJ, ZF9.ZF9_LC, ZF9.ZF9_DTCAD, "
			cQuery +=    "ZF9.ZF9_MACUM, ZF9.ZF9_DTMACU, ZF9.ZF9_MEDDIA, ZF9.ZF9_MEDATR, "
			cQuery +=    "ZF9_TITVIN, ZF9_TITMED, ZF9_TITPZO, ZF9_TITTOT, "
			cQuery +=    "ZF9_ULTCDT, ZF9_ULTCVL, ZF9_PENCDT, ZF9_PENCVL, "
			cQuery +=    "ZF9_SAL05, ZF9_PON05, ZF9_SAL15, ZF9_PON15, ZF9_SAL30, ZF9_PON30 "
			cQuery += "FROM " + RetSQLName("ZF9") + " ZF9 "
			cQuery += "WHERE ZF9.D_E_L_E_T_ = ' ' "
			cQuery += "ORDER BY ZF9.ZF9_CNPJ "
			
			//u_LogSQL("CISP_clientes.txt", cQuery) 
			TcQuery cQuery Alias "QSA1" New
                                                 
			//u_AttCpos( "QSA1", { "ZF9" } )

			nLimite  := 0
			nxCnt    := 0
			While !QSA1->( Eof() )
				If !lBat
					oObj:IncRegua2("Exportando CNPJs")
				EndIf	
				cMotExc := ""
	        	lGrava  := .T.
				cBsCnpj = QSA1->ZF9_CNPJ
				nxCnt++
				//CliLog( StrZero( nxCnt, 5 ) + " Cliente Base CNPJ " + QSA1->ZF9_CNPJ )
	        	nLimite := QSA1->ZF9_LC
				cDtCad  := DtoS(QSA1->ZF9_DTCAD)

				aAcumulo := { QSA1->ZF9_DTMACU, QSA1->ZF9_MACUM  }
				aMedAtra := { QSA1->ZF9_MEDATR, QSA1->ZF9_MEDDIA }
				aVincend := { QSA1->ZF9_TITVIN, QSA1->ZF9_TITMED, QSA1->ZF9_TITPZO, QSA1->ZF9_TITTOT }
				aCompras := { QSA1->ZF9_ULTCDT, QSA1->ZF9_ULTCVL, QSA1->ZF9_PENCDT, QSA1->ZF9_PENCVL }
				aDeb05   := { QSA1->ZF9_SAL05 , QSA1->ZF9_PON05  }
				aDeb15   := { QSA1->ZF9_SAL15 , QSA1->ZF9_PON15  }
				aDeb30   := { QSA1->ZF9_SAL30 , QSA1->ZF9_PON30  }

				// Sem Saldo Devedor e Ultima Compra Anterior ao Limite
				If QSA1->ZF9_TITTOT = 0 .And. QSA1->ZF9_ULTCDT < dLimite
					lGrava := .F.
					cMotExc += " Saldo=0 e UltCom>12M"
				EndIf
				If QSA1->ZF9_MACUM = 0 .And. Empty( QSA1->ZF9_ULTCDT )
					lGrava := .F.
					If !Empty( cMotExc )
						cMotExc += ","
					EndIf
					cMotExc += " MAcum=0 e UltCom=''"
				EndIf

				If lGrava			
					// Acerto Data Ultimas Compras
					If Empty( aCompras[ 1 ] )
						aCompras[1] := cTod("01/01/1900")
					EndIf      
					If Empty( aCompras[ 3 ] )
						aCompras[3] := cTod("01/01/1900")
					EndIf

					cLinha := ""
					cLinha += "1"  // CNPJ
					cLinha += Alltrim( cCodCisp ) // Codigo Bel na CISP
					cLinha += Padl( cBsCnpj, 20, '0' )       //  3 Codigo Cliente
					cLinha += dTos( dDataBase )              //  4 Data da Informação
					cLinha += Padl( cDtCad,  8 )             //  5 Data Cadastro
					If dTos(aCompras[1]) <> "19000101"
						cLinha += dTos( aCompras[1] )         //  6 Data Ultima Compra
					Else
						cLinha += "00000000"
					EndIf
					cLinha += NumCISP( aCompras[2], 13, 2 )  //  7 Vlr Ultima Compra
					cLinha += dTos( aAcumulo[1] )            //  8 Data Maior Acumulo
					cLinha += NumCISP( aAcumulo[2], 13, 2 )  //  9 Vlr Maior Acumulo
					cLinha += NumCISP( aVincend[4], 13, 2 )  // 10 Vlr Débito Atual
					cLinha += NumCISP( nLimite    , 13, 2 )  // 11 Vlr Limite de Credito
					cLinha += NumCISP( aMedAtra[1],  4, 2 )  // 12 Média Ponderada Atrazo Pagamentos
					cLinha += NumCISP( aMedAtra[2],  4, 2 )  // 13 Média Aritmética Dias de Atrazo Pagamento
					cLinha += NumCISP( aVincend[1], 13, 2 )  // 14 Valor Débito Atual a Vencer
					cLinha += NumCISP( aVincend[2],  4, 2 )  // 15 Média Ponderada de Títulos a Vencer
					cLinha += NumCISP( aVincend[3],  4, 2 )  // 16 Prazo Médio de Vendas
					cLinha += NumCISP( aDeb05[1]  , 13, 2 )  // 17 Valor Débito Atual Vencido + 5 Dias
					cLinha += NumCISP( aDeb05[2]  ,  4, 0 )  // 18 Média Ponderada de Atras Titulos Vencidos e nao Pagos + 5 Dias
					cLinha += NumCISP( aDeb15[1]  , 13, 2 )  // 19 Valor Débito Atual Vencido + 15 Dias
					cLinha += NumCISP( aDeb15[2]  ,  4, 0 )  // 20 Média Ponderada de Atras Titulos Vencidos e nao Pagos + 15 Dias
					cLinha += NumCISP( aDeb30[1]  , 13, 2 )  // 21 Valor Débito Atual Vencido + 30 Dias
					cLinha += NumCISP( aDeb30[2]  ,  4, 0 )  // 22 Média Ponderada de Atras Titulos Vencidos e nao Pagos + 30 Dias
					If dTos(aCompras[3]) <> "19000101"
						cLinha += dTos( aCompras[3] )         // 23 Data Penultima Compra
					Else
						cLinha += "00000000"
					EndIf				
					cLinha += NumCISP( aCompras[4], 13, 2 )  // 24 Vlr Penultima Compra
					cLinha += "1"                            // 25 Situação do Cálculo Limite de Crédito
					cLinha += "9"                            // 26 Tipo de Garantia
					cLinha += "00"                           // 27 Grau da Garantia - Hipoteca
					cLinha += NumCISP( 0          ,  8, 0 )  // 28 Data Validade da Garantia
					cLinha += NumCISP( 0          , 13, 2 )  // 29 Valor da Garantia
					cLinha += NumCISP( 0          , 13, 2 )  // 30 Valor da Venda Pagamento Antecipado
					cLinha += "  "                           // 31 Venda sem Crédito (Antecipado)
										
					//Escreve a linha no arquivo
					FWrite(nFileIO, cLinha + cEof )
					nxExp++
					CliLog( 5, StrZero( nxCnt, 5 ) + " Cliente Base CNPJ " + QSA1->ZF9_CNPJ )
				Else
					CliLog( 5, StrZero( nxCnt, 5 ) + " Cliente Base CNPJ " + QSA1->ZF9_CNPJ + " IGNORADO:" + cMotExc )
				EndIf
				If Empty( cDtCad )
					CliLog( 5, StrZero( nxCnt, 5 ) + " Cliente Base CNPJ " + QSA1->ZF9_CNPJ + " DtCad Invalida" )
				EndIf
				QSA1->( dbSkip() )
  			End
			QSA1->( dbCloseArea() )
			FClose(nFileIO)
		EndIf	
	EndIf
	CliLog( 1, "Exportado para CISP " + StrZero(nxExp,5,0) + " CNPJs" )
	CliLog( 1, "Final da Geracao dos Dados Para CISP" )
	fClose(fArqLog)
	If lBat
		If !lxTeste .And. !lErro
			U_EnviarEmail( SuperGetMV("MV_X_CISPM",.F.,""), "Arquivo de Informações da ZD ALIMENTOS S.A (0143)", "Segue em Anexo arquivo com as informações", cDirCisp, .T., )
		Else
			U_EnviarEmail( xEMailLog, "Log Cisp " + DTOC(dDatabase), "Final da Geracao dos Dados Para CISP as " + Time(),, .T., )
		EndIf
	Else
		If lErro
			Alert( "Exportação Concluída com Erros" )
		Else
			Alert( "Exportação Concluída" )
		EndIf
	EndIf
	If lErro
		lRet := .F.
	EndIf

	//EventInsert( cChannel, cCateg, cEventID, nLevel, cCargo, cTitle, cMessage, lPublic )
	If lRet
		EventInsert( FW_EV_CHANEL_ENVIRONMENT, FW_EV_CATEGORY_MODULES, cEventF, FW_EV_LEVEL_INFO , "", cTitulo, cMsgF, .T. )
	Else
		EventInsert( FW_EV_CHANEL_ENVIRONMENT, FW_EV_CATEGORY_MODULES, cEventF, FW_EV_LEVEL_ERROR, "", cTitulo, "Finalizado com Erros", .T. )
	EndIf
Return lRet

Static Function CliLog( nNivel, cMsg, lDtHr )
	Default lDtHr := .T.
	
	If nxTrace >= nNivel
	   If lDtHr
	      cMsg := dToc( dDataBase ) + " " + Time() + " " + cMsg
	   EndIf
	   fWrite(fArqLog, cMsg + cEof)
	   ConOut(cMsg)
	EndIf
Return 

Static Function NumCISP( nNumero, nTam, nDecimais )
	Local cNumero := ""
	If nDecimais > 0
		nNumero := nNumero * ( 10 ^ nDecimais )
	EndIf
	cNumero := StrZero( nNumero, nTam + nDecimais )
Return cNumero

Static Function SchedDef()
	Local aParam := {}
	Local aOrd   := {}
	
	aParam := { ;
		"R"			,; // Tipo: R para relatorio P para processo
		cProg		,; // Pergunte do relatorio, caso nao use passar "PARAMDEF"
		"ZF9"		,; // Alias
		aOrd		,; // Array de ordens
		"Exportação de Dados CISP" ; // Título para relatórios ou rotinas
	}

Return aParam
