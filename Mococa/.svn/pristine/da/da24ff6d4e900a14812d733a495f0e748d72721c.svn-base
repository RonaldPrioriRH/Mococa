#Include "FINR620.CH"
#Include "PROTHEUS.CH"

/* GESTAO - inicio */
Static lFWCodFil := .T.
/* GESTAO - fim */

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡…o	 ³ FINR620	³ Autor ³ Wagner Xavier 	  	  ³ Data ³ 05.10.92 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Relacao da Movimentacao Bancaria 		  						  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Sintaxe e ³ FINR620(void)															  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso		 ³ Generico 												    			  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
user Function FinR620m()

Local oReport
Local aAreaR4	:= GetArea()

Private nOrdena
Private lPccBxCr	:= FPccBxCr()

/* GESTAO - inicio */
Private aSelFil	:= {}
/* GESTAO - fim */

If TRepInUse()
	oReport := ReportDef()
	oReport:PrintDialog()
Else
	Return FinR620R() // Executa versão anterior do fonte
Endif

RestArea(aAreaR4)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ ReportDef º Autor ³ Marcio Menon		   º Data ³  07/08/06  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Definicao do objeto do relatorio personalizavel e das      º±±
±±º          ³ secoes que serao utilizadas.                               º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ EXPC1 - Grupo de perguntas do relatorio                    º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³                                                            º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function ReportDef()

Local oReport
Local oSection1
Local oSection2
Local oSection3
Local cReport 	:= "FINR620" 		// Nome do relatorio
Local cDescri 	:= STR0001 +;		//"Este programa ir  emitir a rela‡„o da movimenta‡„o banc ria"
						STR0002 +;	//"de acordo com os parametros definidos pelo usuario. Poder  ser"
						STR0003		//"impresso em ordem de data disponivel,banco,natureza ou dt.digita‡„o."
Local cTitulo 	:= STR0021 			//"Relacao da Movimentacao Bancaria"
Local cPerg		:= "FIN620"			// Nome do grupo de perguntas
Local aOrdem	:= {OemToAnsi(STR0004),OemToAnsi(STR0005),OemToAnsi(STR0006),OemToAnsi(STR0007),OemToAnsi(STR0034)}  //"Por Dt.Dispo"###"Por Banco"###"Por Natureza"###"Dt.Digitacao"###"Por Dt. Movimentacao"


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica as perguntas selecionadas 								 ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
pergunte("FIN620",.F.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Criacao do componente de impressao                                      ³
//³                                                                        ³
//³TReport():New                                                           ³
//³ExpC1 : Nome do relatorio                                               ³
//³ExpC2 : Titulo                                                          ³
//³ExpC3 : Pergunte                                                        ³
//³ExpB4 : Bloco de codigo que sera executado na confirmacao da impressao  ³
//³ExpC5 : Descricao                                                       ³
//³                                                                        ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oReport := TReport():New(cReport, cTitulo, {|| AdmSelecFil(cPerg,17,.T.,@aSelFil,"SE5",.F.)}, {|oReport| ReportPrint(oReport, cTitulo)}, cDescri)

If mv_par11 == 1			//Analitico
	oReport:SetLandscape()	//Imprime o relatorio no formato paisagem
Else                 		//Sintetico
	oReport:SetPortrait()	//Imprime o relatorio no formato retrato
EndIf

/* GESTAO - inicio */
oReport:SetUseGC(.F.)
/* GESTAO - fim */

oReport:HideParamPage(.F.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³                                                                        ³
//³                      Definicao das Secoes                              ³
//³                                                                        ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Secao 01                                                               ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oSection1 := TRSection():New(oReport, STR0035, /*"SE5"*/, aOrdem) //"Saldo anterior dos bancos"
DbSelectArea('SX3')
DbSetOrder(2)
DbSeek('E5_BANCO')
cDescBanco	:=	 X3Titulo("E5_BANCO")
DbSeek('E5_AGENCIA')
cDescAge		:=	 X3Titulo("E5_AGENCIA")
DbSeek('E5_CONTA')
cDescConta	:=	 X3Titulo("E5_CONTA")
DbSeek('E5_NATUREZ')
cDescNat  	:=	 X3Titulo("E5_NATUREZ")
DbSeek('E5_DOCUMEN')
cDescDoc		:=	 X3Titulo("E5_DOCUMEN")
DbSeek('E5_HISTOR')
cDescHist 	:=	 X3Titulo("E5_HISTOR")


TRCell():New(oSection1, "TXTSALDO"     , "" , STR0031 , , 17 ,/*lPixel*/,{ || STR0031 } )	//"Saldo anterior a "
TRCell():New(oSection1, "DATA"   		, "" , STR0042 , PesqPict("SE5","E5_DATA") , TamSX3("E5_DATA")[1]+2 ,/*lPixel*/,/*CodeBlock*/)	//"DATA"
TRCell():New(oSection1, "TODOSBCO"     , "" , STR0032 	, , 22 ,/*lPixel*/,{ || STR0032 })		//" (Todos os bancos): "
TRCell():New(oSection1, "BANCO"   		, "" , cDescBanco , PesqPict("SE5","E5_BANCO")   , TamSX3("E5_BANCO")[1]   	,/*lPixel*/,/*CodeBlock*/)	//"BCO"
TRCell():New(oSection1, "AGENCIA"		, "" , cDescAGE	, PesqPict("SE5","E5_AGENCIA")	, TamSX3("E5_AGENCIA")[1] ,/*lPixel*/,/*CodeBlock*/)	//"AGENCIA"
TRCell():New(oSection1, "CONTA"    		, "" , cDescCONTA , PesqPict("SE5","E5_CONTA")  	, TamSX3("E5_CONTA")[1]	   ,/*lPixel*/,/*CodeBlock*/)	//"CONTA"
TRCell():New(oSection1, "SALDOANTERIOR", "" , STR0041 , PesqPict("SE8","E8_SALANT")	, TamSX3("E8_SALANT")[1]	 ,/*lPixel*/,/*CodeBlock*/)

oSection1:Cell("TODOSBCO"):Disable()
oSection1:Cell("SALDOANTERIOR"):SetHeaderAlign("RIGHT")
oSection1:SetHeaderSection(.F.)	//Nao imprime o cabeçalho da secao

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Secao 02                                                               ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oSection2 := TRSection():New(oReport, STR0036, {"SE5","SA6","SED"}, aOrdem) //"Movimentacao Bancaria"
/* GESTAO - inicio */
TRCell():New(oSection2, "FILORIG"		, "SE5" , SX3->(RetTitle("E5_FILORIG"))	, PesqPict("SE5","E5_FILORIG")	, TamSX3("E5_FILORIG")[1]+2	,/*lPixel*/,{|| If(Empty(SE5->E5_FILORIG),SE5->E5_FILIAL,SE5->E5_FILORIG)}/*CodeBlock*/)
/* GESTAO - fim */
TRCell():New(oSection2, "DATA"			, "SE5" , STR0042 	, PesqPict("SE5","E5_DTDISPO")	, TamSX3("E5_DTDISPO")[1]+4	,/*lPixel*/,/*CodeBlock*/)	//"DATA"
TRCell():New(oSection2, "BANCO"   		, "SE5" , cDescBANCO	, PesqPict("SE5","E5_BANCO")    , TamSX3("E5_BANCO")[1]  	,/*lPixel*/,{|| SE5->E5_BANCO}/*CodeBlock*/)	//"BCO"
TRCell():New(oSection2, "AGENCIA"		, "SE5" , cDescAGE	, PesqPict("SE5","E5_AGENCIA")	, TamSX3("E5_AGENCIA")[1]	,/*lPixel*/,{|| SE5->E5_AGENCIA}/*CodeBlock*/)	//"AGENCIA"
TRCell():New(oSection2, "CONTA"    		, "SE5" , cDescCONTA	, PesqPict("SE5","E5_CONTA")  	, TamSX3("E5_CONTA")[1]		,/*lPixel*/,{|| SE5->E5_CONTA}/*CodeBlock*/)	//"CONTA"
TRCell():New(oSection2, "NATUREZA"		, "SE5" , cDescNAT 	, PesqPict("SE5","E5_NATUREZ")	, TamSX3("E5_NATUREZ")[1],/*lPixel*/,{|| MascNat(SE5->E5_NATUREZ)}/*CodeBlock*/)	//"NATUREZA"
TRCell():New(oSection2, "DOCUMENTO" 	, "SE5" , cDescDOC 	, PesqPict("SE5","E5_NUMCHEQ")  , TamSX3("E5_NUMCHEQ")[1]+1	,/*lPixel*/,{|| SE5->E5_NUMCHEQ}/*CodeBlock*/)	//"DOCUMENTO"
TRCell():New(oSection2, "ENTRADA"		, "" 	  , STR0038 	, PesqPict("SE5","E5_VALOR")    , TamSX3("E5_VALOR")[1]+1   ,/*lPixel*/,/*CodeBlock*/)	//"ENTRADA"
TRCell():New(oSection2, "SAIDA"    		, ""    , STR0039 	, PesqPict("SE5","E5_VALOR")    , TamSX3("E5_VALOR")[1]+1  	,/*lPixel*/,/*CodeBlock*/)	//"SAIDA"
TRCell():New(oSection2, "SALDOATUAL"	, "" 	  , STR0040 	, PesqPict("SE8","E8_SALANT")  	, TamSX3("E8_SALANT")[1]+1 	,/*lPixel*/,/*CodeBlock*/)	//"SALDO ATUAL"
TRCell():New(oSection2, "SEPARADOR"		, ""	  , ""		 	, ,2,/*lPixel*/,/*CodeBlock*/)
TRCell():New(oSection2, "HISTORICO"		, ""	  , cDescHIST 	, PesqPict("SE5","E5_HISTOR")   , TamSX3("E5_HISTOR")[1]	,/*lPixel*/,{|| SE5->E5_HISTOR}/*CodeBlock*/)	//"HISTORICO"

TrPosition():New(oSection2,'SA6',1,{|| xFilial('SA6')+ SE5->E5_BANCO+SE5->E5_AGENCIA+SE5->E5_CONTA })
TrPosition():New(oSection2,'SED',1,{|| xFilial('SED')+ SE5->E5_NATUREZ })

//Faz o alinhamento do texto da celula
oSection2:Cell("ENTRADA"   ):SetHeaderAlign("RIGHT")
oSection2:Cell("SAIDA"     ):SetHeaderAlign("RIGHT")
oSection2:Cell("SALDOATUAL"):SetHeaderAlign("RIGHT")

oSection2:SetHeaderPage()	//Define o cabecalho da secao como padrao

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Secao 03                                                               ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ


oSection3 := TRSection():New(oReport, STR0037, /*a/cAlias*/, aOrdem) //"Totais"

TRCell():New(oSection3, "TXTTOTAL"     , "" , STR0033 	, , 08 ,/*lPixel*/,{ || STR0033 } )	//"Total : "
TRCell():New(oSection3, "FILORIG"	   , "" , SX3->(RetTitle("E5_FILORIG"))	, PesqPict("SE5","E5_FILORIG")	, TamSX3("E5_FILORIG")[1]	,/*lPixel*/,/*CodeBlock*/)
TRCell():New(oSection3, "DATA"   	   , "" , STR0042		, PesqPict("SE5","E5_DATA")  		, TamSX3("E5_DATA")[1]+4 		,/*lPixel*/,/*CodeBlock*/)	//"DATA"
TRCell():New(oSection3, "BANCO"   		, "" , cDescBanco , PesqPict("SE5","E5_BANCO")    	, TamSX3("E5_BANCO")[1]   	,/*lPixel*/,/*CodeBlock*/)	//"BCO"
TRCell():New(oSection3, "AGENCIA"		, "" , cDescAGE   , PesqPict("SE5","E5_AGENCIA")	, TamSX3("E5_AGENCIA")[1]	,/*lPixel*/,/*CodeBlock*/)	//"AGENCIA"
TRCell():New(oSection3, "CONTA"    		, "" , cDescConta , PesqPict("SE5","E5_CONTA")  	, TamSX3("E5_CONTA")[1]		,/*lPixel*/,/*CodeBlock*/)	//"CONTA"
TRCell():New(oSection3, "NATUREZA"		, "" , cDescNat	, PesqPict("SE5","E5_NATUREZ")	, 18	,/*lPixel*/,/*CodeBlock*/)	//"NATUREZA", 40 ,/*lPixel*/,/*CodeBlock*/)	//"NATUREZA"
TRCell():New(oSection3, "ENTRADA"		, "" , STR0038 , PesqPict("SE5","E5_VALOR")    	, TamSX3("E5_VALOR")[1]+1  ,/*lPixel*/,/*CodeBlock*/)	//"ENTRADA"
TRCell():New(oSection3, "SAIDA"    		, "" , STR0039 , PesqPict("SE5","E5_VALOR")    	, TamSX3("E5_VALOR")[1]+1 	,/*lPixel*/,/*CodeBlock*/)	//"SAIDA"
TRCell():New(oSection3, "SALDOATUAL"	, "" , STR0040 , PesqPict("SE8","E8_SALANT")  	, TamSX3("E8_SALANT")[1]+1 	,/*lPixel*/,/*CodeBlock*/)	//"SALDO ATUAL"
TRCell():New(oSection3, "SEPARADOR"		, ""	  , ""		 	, ,2,/*lPixel*/,/*CodeBlock*/)
TRCell():New(oSection3, "HISTORICO"		, ""	  , cDescHIST 	, PesqPict("SE5","E5_HISTOR")   , TamSX3("E5_HISTOR")[1]	,/*lPixel*/,{|| REPLICATE("-",TamSX3("E5_HISTOR")[1])}/*CodeBlock*/)	//"HISTORICO"

//Oculta as colunas

/* GESTAO - inicio */
oSection3:Cell("FILORIG"):Hide()
/* GESTAO - fim */
oSection3:Cell("DATA"    ):Hide()
oSection3:Cell("AGENCIA" ):Hide()
oSection3:Cell("CONTA"   ):Hide()
oSection3:Cell("NATUREZA"):Hide()
oSection3:Cell("SALDOATUAL"):Hide()
oSection3:Cell("BANCO"   ):Hide()



oSection3:SetHeaderSection(.F.)	//Nao imprime o cabeçalho da secao

Return oReport

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ReportPrint ºAutor³ Marcio Menon       º Data ³  07/08/06   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Imprime o objeto oReport definido na funcao ReportDef.     º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ EXPO1 - Objeto TReport do relatorio                        º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³                                                            º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function ReportPrint(oReport, cTitulo)

Local oSection1 	:= oReport:Section(1)
Local oSection2 	:= oReport:Section(2)
Local oSection3 	:= oReport:Section(3)
Local nOrdem		:= oReport:Section(1):GetOrder()

Local CbCont, CbTxt
Local nTotEnt := 0,nTotSai := 0,nGerEnt := 0,nGerSai := 0,nColuna := 0,lContinua := .T.
Local nValor,cDoc
Local lVazio  := .T.
Local nMoeda

#IFDEF TOP
	Local ni
	Local aStru 	:= SE5->(dbStruct())
	Local cIndice	:= SE5->(IndexKey())
#ELSE
	Local nOrdSE5 	:=SE5->(IndexOrd())
	Local cChave
#ENDIF

Local cIndex
Local cHistor
Local cChaveSe5
Local nTxMoeda		:=0
Local nMoedaBco	:=	1
Local nCasas		:= GetMv("MV_CENT"+(IIF(mv_par09 > 1 , STR(mv_par09,1),"")))
Local bWhile   	:= { || IF( mv_par12 == 1, .T., SE5->E5_FILIAL == xFilial("SE5") ) }
Local nTotSaldo 	:= 0
Local aSaldo
Local nGerSaldo 	:= 0
Local nSaldoAtual := 0
Local lFirst 		:= .T.
Local nTxMoedBc	:= 0
Local cPict 		:= ""
Local nA				:= 0
Local cFilterUser := ""
Local lF620Qry 	:= ExistBlock("F620QRY")
Local cQueryAdd 	:= ""
Local nSaldoAnt 	:= 0
Local lImpSaldo 	:= .F.
Local nAscan 		:= 0
Local cAnterior 	:= ""
Local nBancos 		:= 0
Local cCond2 		:= ""
Local cCond3 		:= ""
Local cMoeda		:= ""
Local cFilterSA6	:=	oSection2:GetAdvplExp('SA6')
Local cFilterSE5	:=	oSection2:GetAdvplExp('SE5')
Local cFilterSED	:=	oSection2:GetAdvplExp('SED')
Local lPrimeiro 	:= 	.T.
Local lCxLoja 		:= GetNewPar("MV_CXLJFIN",.F.)
/*
GESTAO - inicio */
Local cTmpSe2Fil	:= ""
Local cTmpSE5Fil	:= ""
Local aTmpFil		:= {}
Local nTamValor := 19//TamSX3("E5_VALOR")[1]

If MV_PAR17 == 1
	If Empty(aSelFil)
		AdmSelecFil("FIN620",17,.F.,@aSelFil,"SE5",.F.)
	Endif
Else
	Aadd(aSelFil,cFilAnt)
Endif
/* GESTAO - fim
 */
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Caso so'exista uma empresa/filial ou o SE5 seja compartilhado³
//³ nao ha' necessidade de ser processado por filiais            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
mv_par12 := Iif(SM0->(Reccount()) == 1 .or. Empty(xFilial("SE5")),2,mv_par12)

nOrdena := nOrdem

/* GESTAO - inicio */
#IFDEF TOP
	bWhile := {|| .T.}
	aSaldo := GetSaldos(.F., nMoeda,"","",mv_par01,mv_par03,mv_par04)
#ELSE
	aSaldo := GetSaldos( MV_PAR12 == 1, nMoeda, If(mv_par12==1,mv_par13,xFilial("SA6")), If(mv_par12==1,mv_par14,xFilial("SA6")), mv_par01, mv_par03, mv_par04)
#ENDIF
/* GESTAO - fim */

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Caso a ordem for por banco, deve-se retirar da array os bancos que mesmo com saldo, não tenham ³
//³ sofrido movimentacoes para o periodo especificado na parametrizacao                            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

If nOrdem == 2
	#IFDEF TOP
		IF TcSrvType() != "AS/400"
			aSaldoAux := {}
			For nA := 1 to len(aSaldo)
				cQrySld := " SELECT COUNT(*) AS QTD FROM "+RetSQLName("SE5")+" SE5 "
				cQrySld += " WHERE SE5.E5_BANCO = '"+aSaldo[nA,2]+"' "
				cQrySld += " AND SE5.E5_AGENCIA = '"+aSaldo[nA,3]+"' "
				cQrySld += " AND SE5.E5_CONTA = '"  +aSaldo[nA,4]+"' "
				cQrySld += " AND SE5.E5_DATA BETWEEN '"+DTOS(mv_par01)+"' AND '"+DTOS(mv_par02)+"' "
				/*
				GESTAO - inicio */
				If Empty(aSelFil)
				If mv_par12 == 1 //Filtra Filiais
					cQrySld += " AND SE5.E5_FILIAL BETWEEN '"+mv_par13+"' AND '"+mv_par14+"' "
				Else
					cQrySld += " AND SE5.E5_FILIAL = '"+xFilial("SE5")+"' "
				EndIf
				Else
				 	cQrySld += " AND SE5.E5_FILIAL " + GetRngFil( aSelFil, "SE5", .T., @cTmpSE5Fil)
				 	Aadd(aTmpFil,cTmpSE5FIL)
				 Endif
				 /* GESTAO - fim
				 */
				cQrySld += " AND SE5.D_E_L_E_T_ = ' ' "
				cQrySld := ChangeQuery(cQrySld)

				If Select("SE5SLD") > 0
					SE5SLD->(dbCloseArea())
				EndIf
				dbUseArea(.T., "TOPCONN", TCGenQry(,,cQrySld), 'SE5SLD', .T., .T.)
				If SE5SLD->QTD > 0
					aAdd(aSaldoAux,aSaldo[nA])
				EndIf
			Next
			If mv_par16 == 2 //Não inclui bancos sem movimentos
				aSaldo := aSaldoAux
			EndIf
			nA := 0
			If Select("SE5SLD") > 0
				SE5SLD->(dbCloseArea())
			EndIf
		Else
	#ENDIF
		aSaldoAux := {}
		For nA := 1 to len(aSaldo)
			se5->(dbSetOrder(1))
			se5->(dbSeek(xFilial("SE5")+DTOS(mv_par01)+aSaldo[nA][2]+aSaldo[nA][3]+aSaldo[nA][4],.T.))
			lPrimeiro := .T.

			While SE5->( !Eof() .And. lPrimeiro )
					If SE5->(Eof()) .Or. (aSaldo[nA][2]+aSaldo[nA][3]+aSaldo[nA][4]) <> SE5->(E5_BANCO+E5_AGENCIA+E5_CONTA) .Or. (SE5->E5_DATA < mv_par01 .Or. SE5->E5_DATA > mv_par02)

					Else
						aAdd(aSaldoAux,aSaldo[nA])
						lPrimeiro := .F.
					Endif
			SE5 -> ( dbSkip() )
			EndDo
		   	If 	mv_par16 == 1 .And. lPrimeiro
				aAdd(aSaldoAux,aSaldo[nA])
			EndIf
		Next
		aSaldo := aSaldoAux
		nA := 0
	#IFDEF TOP
		Endif
	#ENDIF
Endif

If mv_par09 == 0
	mv_par09 := 1
Endif
cMoeda := Str(mv_par09,1,0)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Defini‡„o dos cabe‡alhos												  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If mv_par11 == 1
	cTitulo := STR0008 //"Relacao da Movimentacao Bancaria em "
	If nOrdem == 3 .And. mv_par15 == 1 // Ordem de natureza nao sera impresso os saldos
		oSection2:Cell("SALDOATUAL"):Disable()
	Else
		oSection2:Cell("SALDOATUAL"):Enable()
	Endif
Else
	cTitulo := STR0026 //"Movimentação Bancária em "
	oSection2:Cell("DATA"):Hide()
	If nOrdem == 1
		oSection2:Cell("DATA"):Setsize(10)
	Else
		oSection2:Cell("DATA"):Setsize(30)
	Endif
	oSection2:Cell("BANCO"):Hide()
	oSection2:Cell("BANCO"):SetTitle("")
	oSection2:Cell("AGENCIA"):Hide()
	oSection2:Cell("AGENCIA"):SetTitle("")
	oSection2:Cell("CONTA"):Hide()
	oSection2:Cell("CONTA"):SetTitle("")
	oSection2:Cell("NATUREZA"):Hide()
	oSection2:Cell("NATUREZA"):SetTitle("")
	oSection2:Cell("DOCUMENTO"):Hide()
	oSection2:Cell("DOCUMENTO"):SetTitle("")
	oSection2:Cell("HISTORICO"):Hide()
	oSection2:Cell("HISTORICO"):SetTitle("")
	If mv_par15 == 1
		oSection2:Cell("SALDOATUAL"):Enable()
	Else
		oSection2:Cell("SALDOATUAL"):Disable()
	EndIf
Endif

nMoeda	:= mv_par09
cTitulo  += GetMv("MV_MOEDA"+Str(nMoeda,1)) + STR0028 + If(mv_par11==1, STR0029, STR0030) + STR0028 //" - "###"Analitico"###"Sintetico"###" - "

dbSelectArea("SE5")

#IFDEF TOP
		cQuery := "SELECT * "
		cQuery += " FROM " + RetSqlName("SE5")

		/* GESTAO - inicio */
		If !Empty(aSelFil)
		   If MV_PAR17 == 1
				cQuery += " WHERE " + "E5_FILIAL " + GetRngFil( aSelFil, "SE5", .T., @cTmpSE5Fil)
			Else
               If MV_PAR12 == 1
					cQuery += " WHERE E5_FILIAL BETWEEN '" + mv_par13 + "' AND '" + mv_par14 + "'"	
				 Else
				 	cQuery += " WHERE " + "E5_FILIAL " + GetRngFil( aSelFil, "SE5", .T., @cTmpSE5Fil)
				 Endif	
			Endif
			Aadd(aTmpFil,cTmpSE5Fil)
		Else
		   cQuery += " WHERE E5_FILIAL = '" + xFilial("SE5") + "'"
		ENDIF
		/* GESTAO - fim */

		cQuery += " AND D_E_L_E_T_ = ' '"
#ENDIF

If nOrdem == 1
	cTitulo += OemToAnsi(STR0011)  //" por data"
	#IFDEF TOP
		cCondicao 	:= ".T."
		cCond2 		:= "E5_DTDISPO"

		/* GESTAO - inicio */
		cOrder		:= "E5_DTDISPO+E5_BANCO+E5_AGENCIA+E5_CONTA+E5_FILIAL"
		/* GESTAO - fim */

	#ELSE
		cCondicao 	:= "DTOS(E5_DTDISPO) >= DTOS(mv_par01) .and. DTOS(E5_DTDISPO) <= DTOS(mv_par02)"
		cCond2 		:= "E5_DTDISPO"
		dbSelectArea("SE5")
		dbSetOrder(nOrdSE5)
		cIndex	:= CriaTrab(nil,.f.)
      IF mv_par12 == 1
		   cChave	:= "DTOS(E5_DTDISPO)+E5_BANCO+E5_AGENCIA+E5_CONTA+E5_FILIAL"
			IndRegua("SE5"  ,;
			         cIndex ,;
						cChave,,;
						"E5_FILIAL >= '"+mv_par13+"' .AND. E5_FILIAL <= '"+mv_par14+"'",;
						OemToAnsi(STR0012))  //"Selecionando Registros..."
		ELSE
			cChave	:= "E5_FILIAL+DTOS(E5_DTDISPO)+E5_BANCO+E5_AGENCIA+E5_CONTA"
			IndRegua("SE5"  ,;
			         cIndex ,;
						cChave,,,;
						OemToAnsi(STR0012))  //"Selecionando Registros..."
		ENDIF
		nIndex	 := RetIndex("SE5")
		dbSelectArea("SE5")
		dbSetIndex(cIndex+OrdBagExt())
		dbSetOrder(nIndex+1)
		IF mv_par12 == 1
			dbSeek(DtoS(mv_par01),.T.)
		ELSE
			dbSeek(xFilial()+DtoS(mv_par01),.T.)
		ENDIF
	#ENDIF
Elseif nOrdem == 2
	cTitulo += OemToAnsi(STR0013)  //" por Banco"
	SE5->(dbSetOrder(3))
	#IFDEF TOP
		cCondicao 	:= ".T."
		cCond2 := "E5_BANCO+E5_AGENCIA+E5_CONTA"
		cIndice := SE5->(IndexKey())

		/* GESTAO - inicio */
	   cIndice := ALLTRIM(SUBSTR(cIndice,AT("+",cIndice)+1)) + "+E5_FILIAL"
	   /* GESTAO - fim */

		cOrder := cIndice
	#ELSE
		cCondicao := "E5_BANCO >= '"+mv_par03 +"'.and. E5_BANCO <= '"+mv_par04+"'"
		cCond2 := "E5_BANCO+E5_AGENCIA+E5_CONTA"
		IF mv_par12 == 1
		   cIndex	:= CriaTrab(nil,.f.)
		   cChave	:= SE5->(INDEXKEY())
			cChave   := ALLTRIM(SUBSTR(cChave, AT("+",cChave)+1)) + "+E5_FILIAL"
			IndRegua("SE5" ,;
			         cIndex,;
						cChave,,;
						"E5_FILIAL >= '"+mv_par13+"' .AND. E5_FILIAL <= '"+mv_par14+"'",;
						OemToAnsi(STR0012))  //"Selecionando Registros..."
			nIndex	 := RetIndex("SE5")
			SE5->(dbSetIndex(cIndex+OrdBagExt()))
		   SE5->(dbSetOrder(nIndex+1))
			SE5->(DBSEEK(mv_par03,.T. ))
		ELSE
			SE5->(dbSetOrder(3))
		   SE5->(dbSeek(xFilial("SE5")+mv_par03,.T.))
		ENDIF
	#ENDIF
Elseif nOrdem == 3
	cTitulo += OemToAnsi(STR0014)  //" por Natureza"
	SE5->(dbSetOrder(4))
	#IFDEF TOP
		cCondicao 	:= ".T."
		cCond2		:= "E5_NATUREZ"
		cIndice := SE5->(IndexKey())

		/* GESTAO - inicio */
	   cIndice := ALLTRIM(SUBSTR(cIndice,AT("+",cIndice)+1))+"+E5_FILIAL"
	   /* GESTAO - fim */

		cOrder := cIndice
	#ELSE
		cCondicao := "E5_NATUREZ >='"+ mv_par05 +"'.and. E5_NATUREZ <= '"+mv_par06+"'"
		cCond2	 := "E5_NATUREZ"
		IF mv_par12 == 1
		   cIndex := CriaTrab(NIL,.F.)
			cChave := SE5->(INDEXKEY())
			cChave := ALLTRIM(SUBSTR(cChave,AT("+",cChave)+1))+"+E5_FILIAL"
			IndRegua("SE5"  ,;
			         cIndex ,;
						cChave,,;
						"E5_FILIAL >= '"+mv_par13+"' .AND. E5_FILIAL <= '"+mv_par14+"'",;
						OemToAnsi(STR0012))
			nIndex	 := RetIndex("SE5")
			SE5->(dbSetIndex(cIndex+OrdBagExt()))
		   SE5->(dbSetOrder(nIndex+1))
			SE5->(DBSEEK(mv_par05,.T.))
		ELSE
		   SE5->(dbSeek(xFilial("SE5")+mv_par05,.T.))
		ENDIF
	#ENDIF
Elseif nOrdem == 4 // Digitacao
	cCond2	  := "E5_DTDIGIT"
	#IFDEF TOP
		/* GESTAO - inicio */
		cCondicao 	:= ".T."
		cOrder	 := "DTOS(E5_DTDIGIT)+E5_PREFIXO+E5_NUMERO+E5_PARCELA+E5_FILIAL"
		/* GESTAO - fim */
	#ELSE
   		IF mv_par12 == 1
			cOrder	 := "DTOS(E5_DTDIGIT)+E5_PREFIXO+E5_NUMERO+E5_PARCELA+E5_FILIAL"
		ELSE
	   		cOrder	 := "E5_FILIAL+DTOS(E5_DTDIGIT)+E5_PREFIXO+E5_NUMERO+E5_PARCELA"
		ENDIF
		cCondicao := "E5_DTDIGIT >= mv_par07 .and. E5_DTDIGIT <= mv_par08"
		cTitulo += OemToAnsi(STR0015)  //"  Por Data de Digitacao"
		cIndex:=CriaTrab("",.F.)
		dbSelectArea("SE5")
		IF mv_par12 == 1
	 	   IndRegua("SE5",;
			          cIndex ,;
						 cOrder,,;
						 "E5_FILIAL >= '" + mv_par13 + "' .AND. E5_FILIAL <= '" + mv_par14 + "'",OemToAnsi(STR0012))  //"Selecionando Registros..."
			nIndex	 := RetIndex("SE5")
			SE5->(dbSetIndex(cIndex+OrdBagExt()))
		   SE5->(dbSetOrder(nIndex+1))
			SE5->(dbSeek(DTOS(mv_par07),.T.))
		ELSE
		   IndRegua("SE5",cIndex,cOrder,,,OemToAnsi(STR0012))  //"Selecionando Registros..."
		   nIndex	 := RetIndex("SE5")
			SE5->(dbSetIndex(cIndex+OrdBagExt()))
		   SE5->(dbSetOrder(nIndex+1))
		   SE5->(dbSeek(xFilial("SE5")+DTOS(mv_par07),.T.))
		ENDIF
	#ENDIF
ElseIf nOrdem >= 5 // Data da Movimentacao
	cCond2 := "E5_DATA"
	#IFDEF TOP
		/* GESTAO - inicio */
		cCondicao 	:= ".T."
		cOrder := "DTOS(E5_DATA)+E5_PREFIXO+E5_NUMERO+E5_PARCELA+E5_FILIAL"
		/* GESTAO - fim */
	#ELSE
		If mv_par12 == 1
			cOrder := "DTOS(E5_DATA)+E5_PREFIXO+E5_NUMERO+E5_PARCELA+E5_FILIAL"
		Else
			cOrder := "E5_FILIAL+DTOS(E5_DATA)+E5_PREFIXO+E5_NUMERO+E5_PARCELA"
		Endif
		cCondicao := "E5_DATA >= mv_par01 .and. E5_DATA <= mv_par02"
		cTitulo    += OemToAnsi(STR0034) // "Por Dt. Movimentacao"
		cIndex    := CriaTrab("",.F.)
		dbSelectArea("SE5")
		If mv_par12 == 1
	 		IndRegua("SE5", cIndex, cOrder,,;
					 "E5_FILIAL >= '" + mv_par13 + "' .AND. E5_FILIAL <= '" + mv_par14 + "'",;
					 OemToAnsi(STR0012))  //"Selecionando Registros..."
			nIndex := RetIndex("SE5")
			SE5->(dbSetIndex(cIndex+OrdBagExt()))
			SE5->(dbSetOrder(nIndex+1))
			SE5->(dbSeek(DTOS(mv_par01),.T.))
		Else
			IndRegua("SE5",cIndex,cOrder,,,OemToAnsi(STR0012))  //"Selecionando Registros..."
			nIndex := RetIndex("SE5")
			SE5->(dbSetIndex(cIndex+OrdBagExt()))
			SE5->(dbSetOrder(nIndex+1))
			SE5->(dbSeek(xFilial("SE5")+DTOS(mv_par01),.T.))
		Endif
	#ENDIF
EndIF

#IFDEF TOP
		cQuery += " AND E5_SITUACA <> 'C'"
		cQuery += " AND E5_NUMCHEQ <> '%*'"
		cQuery += " AND (E5_VENCTO <= E5_DATA Or E5_ORIGEM ='FINA087A' Or E5_ORIGEM ='FINA070' Or E5_ORIGEM ='FINA740')" 
		cQuery += " AND E5_DTDISPO BETWEEN '" + DTOS(mv_par01)  + "' AND '" + DTOS(mv_par02)       + "'"
		cQuery += " AND E5_BANCO BETWEEN   '" + mv_par03        + "' AND '" + mv_par04       + "'"
		If !Empty(oSection2:GetSqlExp('SE5'))
			cQuery += " AND (" +oSection2:GetSqlExp('SE5')+")"
		Endif
		cQuery += " AND E5_BANCO <> '   '"
		cQuery += " AND E5_NATUREZ BETWEEN '" + mv_par05        + "' AND '" + mv_par06       + "'"
		cQuery += " AND E5_DTDIGIT BETWEEN '" + DTOS(mv_par07)        + "' AND '" + DTOS(mv_par08)       + "'"
		cQuery += " AND E5_TIPODOC NOT IN ('DC','JR','MT','BA','MT','CM','D2','J2','M2','C2','V2','CX','CP','TL')"
		If lF620Qry
			cQueryAdd := ExecBlock("F620QRY", .F., .F.)
			If ValType(cQueryAdd) == "C"
				cQuery += " AND ( " + cQueryAdd + ")"
			EndIf
		EndIf
		cQuery += " ORDER BY " + SqlOrder(cOrder)
         MemoWrite("C:\RFIN620.sql",cQuery)
		cQuery := ChangeQuery(cQuery)
			MemoWrite("C:\teste\RELPREJ_V1_1.sql",cQryAux)
		dbSelectAre("SE5")
		dbCloseArea()
		dbUseArea(.T., "TOPCONN", TCGenQry(,,cQuery), 'SE5', .T., .T.)

		For ni := 1 to Len(aStru)
			If aStru[ni,2] != 'C'
				TCSetField('SE5', aStru[ni,1], aStru[ni,2],aStru[ni,3],aStru[ni,4])
			Endif
		Next

#ENDIF

oReport:SetMeter(Len(aSaldo))
oReport:SetTitle(cTitulo)	//Altera o Titulo do relatorio

For nBancos := 1 To IIf(nOrdem == 2, Len(aSaldo), 1)

	nTotEnt:=0
	nTotSai:=0
	nTotSaldo := 0
	lImpSaldo := (lFirst .And. nOrdem != 3) // Indica se o saldo anterior deve ser impresso

	If nOrdem == 2
		nSaldoAtual := 0
	Endif
	nSaldoAnt := 0

	// Pesquisa o saldo bancario
	If (Empty(cFilterUser) .And. nOrdem == 2) .Or. nOrdem <> 2
		If mv_par15 == 1 .And. lImpSaldo
			nSaldoAnt := 0
			If nOrdem == 2 // Ordem de banco
				If cPaisLoc	# "BRA" .OR. FXMultSld()
			 		SA6->(DbSetOrder(1))
					SA6->(DbSeek(xFilial()+aSaldo[nBancos][2]+aSaldo[nBancos][3]+aSaldo[nBancos][4]))
			 		nMoedaBco	:=	Max(SA6->A6_MOEDA,1)
			 	EndIf
				If (!Empty(aSaldo[nBancos][2]) .And. !Empty(aSaldo[nBancos][3]) .And. !Empty(aSaldo[nBancos][4]))
					cCond3:=aSaldo[nBancos][2]+aSaldo[nBancos][3]+aSaldo[nBancos][4]
				Else
					cCond3 := "EOF"
				EndIf
				nAscan := Ascan(aSaldo, {|e| e[2]+e[3]+e[4] == cCond3 } )
				If nAscan > 0
					nSaldoAnt := Round(xMoeda(aSaldo[nAscan][6],nMoedaBco,mv_par09,IIf(SE5->(EOF()),dDataBase,E5_DTDISPO),nCasas+1,nTxMoedBc),nCasas)
				Else
					nSaldoAnd := 0
				Endif
				lFirst := .T.
			Else
				// Na primeira vez, soma todos os saldos de todos os bancos
				If lFirst
					// Soma os saldos de todos os bancos
					For nA := 1 To Len(aSaldo)
						nSaldoAnt += Round(xMoeda(aSaldo[nA][6],MoedaBco(aSaldo[nA][2],aSaldo[nA][3],aSaldo[nA][4]),mv_par09,IIf(SE5->(EOF()),dDataBase,E5_DTDISPO),nCasas+1,nTxMoedBc),nCasas)
					Next
					lFirst := .F.
				Else
					// Apos a impressao da primeira linha, o saldo Anterior sera igual ao
					// saldo atual, impresso na ultima linha, antes da quebra de data
					If ( cPaisLoc == "BRA" )
						nSaldoAnt := nSaldoAtual
					Else
						nSaldoAnt := Round(xMoeda(nSaldoAtual,nMoedaBco,mv_par09,E5_DTDISPO,nCasas+1,nTxMoedBc),nCasas)
					Endif
				Endif
			Endif

			cPict := tm(nSaldoAnt,18,nCasas)

			oSection1:Cell("DATA"   ):SetBlock( { || DTOC(mv_par01) } )
			oSection1:Cell("BANCO"  ):Disable()
			oSection1:Cell("AGENCIA"):Disable()
			oSection1:Cell("CONTA"  ):SetSize(11)

			If nOrdem == 2
				oSection1:Cell("TODOSBCO"):Disable()
				oSection1:Cell("BANCO"   ):Enable()
				oSection1:Cell("BANCO"   ):SetBlock( { || aSaldo[nBancos][2] } )
				oSection1:Cell("AGENCIA" ):Enable()
				oSection1:Cell("AGENCIA" ):SetBlock( { || aSaldo[nBancos][3] } )
				oSection1:Cell("CONTA"   ):Enable()
				oSection1:Cell("CONTA"   ):SetSize(20)
				oSection1:Cell("CONTA"   ):SetBlock( { || aSaldo[nBancos][4] } )
	      Else
				oSection1:Cell("TODOSBCO"):Enable()
	      EndIf
				oSection1:Cell("SALDOANTERIOR"):SetBlock( { || nSaldoAnt } )
				oSection1:Cell("SALDOANTERIOR"):Picture( cPict )
				nSaldoAtual := nSaldoAnt
				
				oSection1:Init()
				oSection1:PrintLine()
				oSection1:Finish()
		Else
			oSection1:Disable()	 //Desabilita a secao dos saldos
		Endif

   EndIf

	While SE5->(!Eof()) .And. EVAL(bWhile) .And. &cCondicao .and. lContinua

		#IFNDEF TOP
			If !Fr620Skip1()
				SE5->(dbSkip())
				Loop
			EndIf
		#ENDIF

		oReport:IncMeter()

		IF E5_MOEDA $ "C1/C2/C3/C4/C5/CH" .and. Empty(E5_NUMCHEQ) .and. !(E5_TIPODOC $ "TR#TE")
			SE5->(dbSkip())
			Loop
		EndIf

		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Na transferencia somente considera nestes numerarios 		  ³
		//³ No Fina100 ‚ tratado desta forma.                    		  ³
		//³ As transferencias TR de titulos p/ Desconto/Cau‡Æo (FINA060) ³
		//³ nÆo sofrem mesmo tratamento dos TR bancarias do FINA100      ³
	   //³ Aclaracao : Foi incluido o tipo $ para os movimentos en di-- ³
	   //³ nheiro em QUALQUER moeda, pois o R$ nao e representativo     ³
	   //³ fora do BRASIL. Bruno 07/12/2000 Paraguai                    ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		If E5_TIPODOC $ "TR/TE" .and. Empty(E5_NUMERO)
	      If !(E5_MOEDA $ "R$/DO/TB/TC/CH"+IIf(cPaisLoc=="BRA","","/$ "))
				SE5->(dbSkip())
				Loop
			Endif
		Endif

		If E5_TIPODOC $ "TR/TE" .and. (Substr(E5_NUMCHEQ,1,1)=="*" ;
			.or. Substr(E5_DOCUMEN,1,1) == "*" )
			SE5->(dbSkip())
			Loop
		Endif

		If E5_MOEDA == "CH" .and. (IsCaixaLoja(E5_BANCO) .And. !lCxLoja .And. E5_TIPODOC $ "TR/TE")		// Sangria
			SE5->(dbSkip())
			Loop
		Endif

		cAnterior := &cCond2
		nTotEnt	 := 0
		nTotSai	 := 0
		nTotSaldo := 0

		If nOrdem == 2
			lImpSaldo 	:= (lFirst .And. nOrdem != 3) // Indica se o saldo anterior deve ser impresso
			//nSaldoAtual 	:= 0
			//nSaldoAnt 	:= 0
		EndIf

		If nOrdem == 2
			cCond3  := "E5_BANCO=='"+aSaldo[nBancos][2]+"' .And. E5_AGENCIA=='"+aSaldo[nBancos][3]+"' .And. E5_CONTA=='"+aSaldo[nBancos][4]+"'"
			// Nao processa a movimentacao caso o banco nao esteja no array aSaldo
			If aScan(aSaldo, {|e| e[2]+e[3]+e[4] == SE5->(E5_BANCO+E5_AGENCIA+E5_CONTA) } ) == 0
				SE5->(dbSkip())
				Loop
			EndIf
		Else
			cCond3:=".T."
		Endif

		While SE5->(!EOF()) .and. &cCond2 = cAnterior .and. EVAL(bWhile) .and. lContinua .And. &cCond3

			oSection2:Init()

			IF Empty(E5_BANCO)
				SE5->(dbSkip())
				Loop
			Endif

			oReport:IncMeter()

			IF E5_SITUACA == "C"
				SE5->(dbSkip())
				Loop
			EndIF

			IF E5_MOEDA $ "C1/C2/C3/C4/C5/CH" .and. Empty(E5_NUMCHEQ) .and. !(E5_TIPODOC $ "TR#TE")
				SE5->(dbSkip())
				Loop
			EndIF

			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Na transferencia somente considera nestes numerarios 		  ³
			//³ No Fina100 ‚ tratado desta forma.                    		  ³
			//³ As transferencias TR de titulos p/ Desconto/Cau‡Æo (FINA060) ³
			//³ nÆo sofrem mesmo tratamento dos TR bancarias do FINA100      ³
	      //³ Aclaracao : Foi incluido o tipo $ para os movimentos en di-- ³
	      //³ nheiro em QUALQUER moeda, pois o R$ nao e representativo     ³
	      //³ fora do BRASIL. Bruno 07/12/2000 Paraguai                    ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			If E5_TIPODOC $ "TR/TE" .and. Empty(E5_NUMERO)
	         If !(E5_MOEDA $ "R$/DO/TB/TC/CH"+IIf(cPaisLoc=="BRA","","/$ "))
					SE5->(dbSkip())
					Loop
				Endif
			Endif

			If E5_TIPODOC $ "TR/TE" .and. (Substr(E5_NUMCHEQ,1,1)=="*" ;
				.or. Substr(E5_DOCUMEN,1,1) == "*" )
				SE5->(dbSkip())
				Loop
			Endif

			If E5_MOEDA == "CH" .and. (IsCaixaLoja(E5_BANCO) .And. !lCxLoja .And. E5_TIPODOC $ "TR/TE")		// Sangria
				SE5->(dbSkip())
				Loop
			Endif

			IF E5_VENCTO > E5_DATA .AND.;
				! alltrim(Upper(E5_ORIGEM)) == "FINA087A" .AND.;
				! alltrim(Upper(E5_ORIGEM)) == "FINA070" .AND.;
				! alltrim(Upper(E5_ORIGEM)) == "FINA740"
				SE5->(dbSkip())
				Loop
			EndIF

			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Verifica se esta' FORA dos parametros                  ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			IF (E5_DTDISPO < mv_par01) .or. (E5_DTDISPO > mv_par02)
				SE5->(dbSkip())
				Loop
			Endif

			IF (E5_BANCO	< mv_par03) .or. (E5_BANCO  > mv_par04)
				SE5->(dbSkip())
				Loop
			EndIf

			IF (E5_NATUREZ < mv_par05) .or. (E5_NATUREZ > mv_par06)
				SE5->(dbSkip())
				Loop
			EndIF

			IF (E5_DTDIGIT < mv_par07) .or. (E5_DTDIGIT > mv_par08)
				SE5->(dbSkip())
				Loop
			EndIF

			IF E5_TIPODOC $ "DCüJRüMTüBAüMTüCMüD2/J2/M2/C2/V2/CX/CP/TL"
				SE5->(dbSkip())
				Loop
			Endif

			//  Para o Sigaloja, quando for sangria e nao for R$, nÆo listar nos
			// movimentos bancarios

	      If (E5_TIPODOC == "SG") .And. (!E5_MOEDA $ "R$"+IIf(cPaisLoc=="BRA","","/$ ")) //Sangria com moeda <> R$
				SE5->(dbSkip())
				Loop
			EndIf

			If SubStr(E5_NUMCHEQ,1,1)=="*"      //cheque para juntar (PA)
				SE5->(dbSkip())
				Loop
			Endif

			If !Empty( E5_MOTBX )
				If !MovBcoBx(E5_MOTBX)
					SE5->(dbSkip())
					Loop
				Endif
			Endif

			If !Empty(cFilterSE5) .And. !SE5->(&(cFilterSE5))
				SE5->(dbSkip())
				Loop
			Endif
			If !Empty(cFilterSA6)
				SA6->(DbSetOrder(1))
				IF !SA6->(MsSeek(xFilial()+SE5->E5_BANCO+SE5->E5_AGENCIA+SE5->E5_CONTA))
					SE5->(dbSkip())
					Loop
				Endif
			Endif
			If !Empty(cFilterSED)
				SED->(DbSetOrder(1))
				SED->(MsSeek(xFilial()+SE5->E5_NATUREZ))
				If !SED->(&(cFilterSED))
					SE5->(dbSkip())
					Loop
				Endif
			Endif
					
			If cPaisLoc	# "BRA" .OR. FXMultSld()
				SA6->(DbSetOrder(1))
				SA6->(MsSeek(xFilial()+SE5->E5_BANCO+SE5->E5_AGENCIA+SE5->E5_CONTA))
				nMoedaBco := Max(SA6->A6_MOEDA,1)

				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³VerIfica se foi utilizada taxa contratada para moeda > 1          ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				nTxMoedBc := SE5->E5_TXMOEDA
				If mv_par09 > 1 .and. !Empty(E5_VLMOED2)
					nTxMoeda := RecMoeda(E5_DTDISPO,mv_par09)
					nTxMoeda := if(nTxMoeda=0,1,nTxMoeda)
					nValor 	:= Round(xMoeda(E5_VALOR,nMoedaBco,mv_par09,,nCasas+1,nTxMoedBc,nTxMoeda),nCasas)
				Else
					nValor 	:= Round(xMoeda(E5_VALOR,nMoedaBco,mv_par09,E5_DTDISPO,nCasas+1,nTxMoedBc),nCasas)
				Endif
			Else
				nValor := xMoeda(E5_VALOR,1,mv_par09,E5_DATA)
			Endif
			lVazio := .F.
			// Calcula saldo atual
			// Se for troco(E5_MOEDA=="TC") nao altera o valor do Saldo Atual
			nSaldoAtual := If(E5_RECPAG = "R",nSaldoAtual+nValor,/*Iif(E5_MOEDA<>"TC",*/nSaldoAtual-nValor/*,nSaldoAtual)*/)

			If mv_par11 == 1	//Analitico

				oSection2:Cell("DATA"):SetBlock( { || If(nOrdem != 5, SE5->E5_DTDISPO, SE5->E5_DATA) } )

				If Len(Alltrim(E5_DOCUMEN)) + Len(Alltrim(E5_NUMCHEQ)) <= 14
					cDoc := Alltrim(E5_DOCUMEN) + if(!empty(E5_DOCUMEN).and. !empty(E5_NUMCHEQ),"-","") + Alltrim(E5_NUMCHEQ )
				ELSEIF Len(Alltrim(E5_DOCUMEN)) + Len(Alltrim(E5_NUMCHEQ)) <> Nil
					cDoc := SUBSTR(Alltrim(E5_DOCUMEN) + if(!empty(E5_DOCUMEN).and. !empty(E5_NUMCHEQ),"-","") + Alltrim(E5_NUMCHEQ ),1,14)
				Endif

				If Empty(cDoc)
					cDoc := Alltrim(E5_PREFIXO)+if(!empty(E5_PREFIXO),"-","")+;
							  Alltrim(E5_NUMERO )+if(!empty(E5_PARCELA),"-"+E5_PARCELA,"")
				Endif

				If Substr( cDoc,1,1 ) == "*"
					SE5->(dbSkip())
					Loop
				Endif

				oSection2:Cell("DOCUMENTO"):SetBlock( { || cDoc } )

				If E5_RECPAG = "R"
					oSection2:Cell("ENTRADA"):SetBlock  ( { || nValor } )
					oSection2:Cell("ENTRADA"):SetPicture( Tm(nValor,nTamValor,MsDecimais(mv_par09)) )
					oSection2:Cell("SAIDA"  ):SetBlock  ( { ||  } )
            Else
					oSection2:Cell("SAIDA"  ):SetBlock  ( { || nValor } )
					oSection2:Cell("SAIDA"  ):SetPicture( Tm(nValor,nTamValor,MsDecimais(mv_par09)) )
					oSection2:Cell("ENTRADA"):SetBlock  ( { ||  } )
            EndIF

				If nOrdem != 3 .And. mv_par15 == 1
					oSection2:Cell("SALDOATUAL"):SetBlock( { || nSaldoAtual } )
					oSection2:Cell("SALDOATUAL"):SetPicture( Tm(nSaldoAtual,nTamValor,MsDecimais(mv_par09)) )
				Else
					oSection2:Cell("SALDOATUAL"):Disable()
				EndIf
			Else
				oSection2:Disable()
			EndIf

			If E5_RECPAG = "R"
				nTotEnt += nValor
			Else
				// Se for troco(E5_MOEDA=="TC") ignora a soma no Total de Saida
//				nTotSai += Iif(SE5->E5_MOEDA<>"TC",nValor,0)
				nTotSai += nValor
			EndIf

			nTotSaldo += nSaldoAtual

			If mv_par11 == 1
				If mv_par10 == 1	// Imprime normalmente
					oSection2:Cell("HISTORICO"):SetBlock( { || SE5->E5_HISTOR } )
				Else					// Busca historico do titulo
					If E5_RECPAG == "R"
						cHistor		:= E5_HISTOR
						cChaveSe5	:=xFilial("SE1") + E5_PREFIXO + ;
											E5_NUMERO + E5_PARCELA + ;
											E5_TIPO
						dbSelectArea("SE1")
						DbSetOrder(1)
						dbSeek( cChaveSe5 )
						oSection2:Cell("HISTORICO"):SetBlock( { || If(Empty(SE1->E1_HIST), cHistor, SE1->E1_HIST) } )
					Else
						cHistor		:= E5_HISTOR
						cChaveSe5	:= xFilial("SE2") + E5_PREFIXO + ;
											E5_NUMERO + E5_PARCELA + ;
											E5_TIPO	 + E5_CLIFOR
						dbSelectArea("SE2")
						SE2->(DbSetOrder(1))
						If SE5->E5_TIPODOC == "CH"
							dbSelectArea("SEF")
							SEF->(dbSetOrder(1))
							SEF->(dbSeek(xFilial("SEF")+SE5->E5_BANCO+SE5->E5_AGENCIA+SE5->E5_CONTA+SE5->E5_NUMCHEQ))
							While !SEF->(Eof()) .And. SEF->(EF_FILIAL+EF_BANCO+EF_AGENCIA+EF_CONTA+EF_NUM) ==;
									xFilial("SEF")+SE5->E5_BANCO+SE5->E5_AGENCIA+SE5->E5_CONTA+SE5->E5_NUMCHEQ
								If Empty(SEF->EF_IMPRESS)
									SEF->(dbSkip())
								Else
									Exit
								EndIf
							EndDo
							SE2->(dbSeek(xFilial("SE2")+SEF->(EF_PREFIXO+EF_TITULO+EF_PARCELA+EF_TIPO+EF_FORNECE)))
						Else
							SE2->(dbSeek(cChaveSe5))
						EndIf
						oSection2:Cell("HISTORICO"):SetBlock( { || If(Empty(SE2->E2_HIST), cHistor, SE2->E2_HIST) } )
					Endif
				Endif
			Endif
			oSection2:PrintLine()
			dbSelectArea("SE5")
			dbSkip()
		Enddo

		oSection2:Finish()

		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Impressao dos totais das secoes.                             ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		If ( nTotEnt + nTotSai ) != 0

			IF nOrdem == 1 .Or. nOrdem == 4 .Or. nOrdem == 5		//Data Dispo. # Digitacao # Data Movimentacao
				oSection2:Enable()
				If nOrdem == 1 .AND. oreport:oPage:LPORTRAIT //retrato
					oSection3:Cell("DATA"):SetSize(12)
				Endif				
				
				If nOrdem == 4 .Or. nOrdem == 5 
					If mv_par11 == 1 .AND. oreport:oPage:LPORTRAIT//analitico e retrato
						oSection3:Cell("DATA"):SetSize(13)
					ElseIf mv_par11 == 1 .AND. !oreport:oPage:LPORTRAIT//analitico e paisagem
						oSection3:Cell("DATA"):SetSize(12)
					Endif
								
					If mv_par11 != 1 .AND. oreport:oPage:LPORTRAIT//sintetico e retrato
						oSection3:Cell("DATA"):SetSize(29)
					ElseIf mv_par11 != 1 .AND. !oreport:oPage:LPORTRAIT//sintetico e paisagem
						oSection3:Cell("DATA"):SetSize(31)
					Endif				
				Endif
				oSection3:Cell("DATA"):Show()
				oSection3:Cell("DATA"):SetBlock( { || DTOC(cAnterior) } )
				
				If mv_par11 != 1
				oSection3:Cell("BANCO"  ):Disable()
				Endif
				
			Elseif nOrdem == 2 	//Banco
				oSection3:Cell("DATA"   ):Hide()
				oSection3:Cell("BANCO"  ):Show()
				oSection3:Cell("AGENCIA"):Show()
				oSection3:Cell("CONTA"  ):Show()
				oSection3:Cell("BANCO"  ):SetBlock( { || Substr(cAnterior,1,3)  } )
				oSection3:Cell("AGENCIA"):SetBlock( { || Substr(cAnterior,4,5)  } )
				oSection3:Cell("CONTA"  ):SetBlock( { || Substr(cAnterior,9,10) } )
				oSection3:Cell("NATUREZA"):Hide()
				
				If mv_par11 != 1 //Sintetico
					If 	!oreport:oPage:LPORTRAIT// Paisagem
						oSection3:Cell("NATUREZA"):SetSize(31)
					Else
						oSection3:Cell("NATUREZA"):SetSize(26)//Retrato
					Endif
						oSection3:Cell("NATUREZA"):Hide()
				Endif
									
			ElseIf nOrdem == 3	//Natureza
				oSection2:Enable()
				oSection2:Cell("SALDOATUAL"):SetTitle("")
				oSection3:Cell("DATA"   ):Disable()
				oSection3:Cell("BANCO"  ):Disable()
				oSection3:Cell("AGENCIA"):Disable()
				oSection3:Cell("CONTA"  ):Disable()
				dbSelectArea("SED")
				dbSeek(xFilial("SED")+cAnterior)
				
					
				If mv_par11 == 1 .AND. oreport:oPage:LPORTRAIT//Analitico e Retrato
					oSection3:Cell("NATUREZA"):SetSize(57)
				ElseIf mv_par11 == 1 .AND. !oreport:oPage:LPORTRAIT//Analitico e Paisagem
					oSection3:Cell("NATUREZA"):SetSize(57)
				Endif
								
				If mv_par11 != 1 .AND. oreport:oPage:LPORTRAIT//Sintetico e Retrato
					oSection3:Cell("NATUREZA"):SetSize(56)
				ElseIf mv_par11 != 1 .AND. !oreport:oPage:LPORTRAIT//Sintetico e Paisagem
					oSection3:Cell("NATUREZA"):SetSize(71)
				Endif
								
				oSection3:Cell("NATUREZA"):Show()
				oSection3:Cell("NATUREZA"):SetBlock( { || AllTrim(MascNat(cAnterior)) + " - " + Substr(SED->ED_DESCRIC,1,30) } )
			EndIf

				oSection3:Cell("ENTRADA"):SetBlock  ( { || nTotEnt } )
				oSection3:Cell("ENTRADA"):SetPicture( Tm(nTotEnt,nTamValor,MsDecimais(mv_par09)) )
				oSection3:Cell("SAIDA"  ):SetBlock  ( { || nTotSai } )
				oSection3:Cell("SAIDA"  ):SetPicture( Tm(nTotSai,nTamValor,MsDecimais(mv_par09)) )
				
			If nOrdem != 3 .And. mv_par15 == 1
				oSection3:Cell("SALDOATUAL"):Show()
				oSection3:Cell("SALDOATUAL"):SetBlock( { || nSaldoAtual } )
				oSection3:Cell("SALDOATUAL"):SetPicture( Tm(nSaldoAtual,nTamValor,MsDecimais(mv_par09)) )
			Else
				oSection3:Cell("SALDOATUAL"):Disable()
			Endif


			oSection3:Init()
			oSection3:PrintLine()
			oSection3:Finish()

			nGerEnt 	 += nTotEnt
			nGerSai 	 += nTotSai
			nGerSaldo += (nSaldoAnt + nTotEnt - nTotSai)
			nSaldoAnt := 0
			nTotSaldo := 0
			nTotEnt   := 0
			nTotSai   := 0

		Endif
		dbSelectArea("SE5")
		If nOrdem == 2
			Exit
		EndIf
	EndDo
Next

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Impressao do total geral.		                                ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If (nGerEnt+nGerSai) != 0
	oSection3:Cell("TXTTOTAL"):SetSize(21)
		If nOrdem == 1
			If mv_par11 == 1 .AND. oreport:oPage:LPORTRAIT//Analitico e Retrato
				oSection3:Cell("TXTTOTAL"):SetSize(21)
			ElseIf mv_par11 == 1 .AND. !oreport:oPage:LPORTRAIT//Analitico e Paisagem
				oSection3:Cell("TXTTOTAL"):SetSize(22)
			Endif
								
			If mv_par11 != 1 .AND. oreport:oPage:LPORTRAIT//Sintetico e Retrato
				oSection3:Cell("TXTTOTAL"):SetSize(26)
			ElseIf mv_par11 != 1 .AND. !oreport:oPage:LPORTRAIT//Sintetico e Paisagem
				oSection3:Cell("TXTTOTAL"):SetSize(22)
			Endif	
		Endif
				
		If nOrdem == 4 .Or. nOrdem == 5
			If mv_par11 == 1 .AND. oreport:oPage:LPORTRAIT//Analitico e Retrato
				oSection3:Cell("TXTTOTAL"):SetSize(21)
			ElseIf mv_par11 == 1 .AND. !oreport:oPage:LPORTRAIT//Analitico e Paisagem
				oSection3:Cell("TXTTOTAL"):SetSize(22)
			Endif
										
			If mv_par11 != 1 .AND. oreport:oPage:LPORTRAIT//Sintetico e Retrato
				oSection3:Cell("TXTTOTAL"):SetSize(24)
			ElseIf mv_par11 != 1 .AND. !oreport:oPage:LPORTRAIT//Sintetico e Paisagem
				oSection3:Cell("TXTTOTAL"):SetSize(22)
			Endif	
		Endif
		
	oSection3:Cell("TXTTOTAL"):SetBlock ( { || STR0017 } )	//"Total Geral : "
	oSection3:Cell("DATA"    ):Hide()
	oSection3:Cell("BANCO"   ):Hide()
	oSection3:Cell("AGENCIA" ):Hide()
	oSection3:Cell("CONTA"   ):Disable()
	
	If nOrdem == 2//Banco
		If mv_par11 == 1 .AND. oreport:oPage:LPORTRAIT//Analitico e Retrato
			oSection3:Cell("NATUREZA"):SetSize(16)
		ElseIf mv_par11 == 1 .AND. !oreport:oPage:LPORTRAIT//Analitico e Paisagem
			oSection3:Cell("NATUREZA"):SetSize(17)
		Endif
				
		If mv_par11 != 1 .AND. oreport:oPage:LPORTRAIT//Sintetico e Retrato
			oSection3:Cell("NATUREZA"):SetSize(29)
		ElseIf mv_par11 != 1 .AND. !oreport:oPage:LPORTRAIT//Sintetico e Paisagem
			oSection3:Cell("NATUREZA"):SetSize(30)
		Endif	
		
	ElseIf nOrdem == 3 //natureza
		If mv_par11 == 1 .AND. oreport:oPage:LPORTRAIT//Analitico e Retrato
			oSection3:Cell("NATUREZA"):SetSize(44)
		ElseIf mv_par11 == 1 .AND. !oreport:oPage:LPORTRAIT//Analitico e Paisagem
			oSection3:Cell("NATUREZA"):SetSize(44)
		Endif
				
		If mv_par11 != 1 .AND. oreport:oPage:LPORTRAIT//Sintetico e Retrato
			oSection3:Cell("NATUREZA"):SetSize(43)
		ElseIf mv_par11 != 1 .AND. !oreport:oPage:LPORTRAIT//Sintetico e Paisagem
			oSection3:Cell("NATUREZA"):SetSize(58)
		Endif
	Else
		oSection3:Cell("NATUREZA"):SetSize(16)
	EndIf
	
	oSection3:Cell("NATUREZA"):Hide()
	oSection3:Cell("ENTRADA" ):SetBlock  ( { || nGerEnt } )
	oSection3:Cell("ENTRADA" ):SetPicture( Tm(nGerEnt,nTamValor,MsDecimais(mv_par09)) )
	oSection3:Cell("SAIDA"   ):SetBlock  ( { || nGerSai } )
	oSection3:Cell("SAIDA"   ):SetPicture( Tm(nGerEnt,nTamValor,MsDecimais(mv_par09)) )
	oSection3:Cell("SALDOATUAL"):SetBlock( { || nGerSaldo } )
	oSection3:Cell("SALDOATUAL"):SetPicture( Tm(nGerEnt,nTamValor,MsDecimais(mv_par09)) )
EndIf

oSection3:Init()
oSection3:PrintLine()
oSection3:Finish()

If lVazio
	oReport:SkipLine()
	oReport:PrintText("***** " + STR0018 + " *****")	//"Nao existem lancamentos neste periodo"
EndIf

#IFDEF TOP
		/* GESTAO - inicio */
		If !Empty(aTmpFil)
			For nA := 1 To Len(aTmpFil)
				CtbTmpErase(aTmpFil[nA])
			Next
		Endif
		/* GESTAO - fim */
		dbSelectArea("SE5")
		dbCloseArea()
		ChKFile("SE5")
		dbSelectArea("SE5")
		dbSetOrder(1)
#ELSE
	dbSelectArea("SE5")
	dbClearFil()
	RetIndex( "SE5" )
	If !Empty(cIndex)
		FErase (cIndex+OrdBagExt())
	Endif
	dbSetOrder(1)
#ENDIF

Return

/*
---------------------------------------------- Release 3 ---------------------------------------------------------
*/
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡…o	 ³ FINR620	³ Autor ³ Wagner Xavier 		³ Data ³ 05.10.92 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Relacao da Movimentacao Bancaria 						  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Sintaxe e ³ FINR620(void)											  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso		 ³ Generico 												  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
user Function FinR620R()
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Define Variaveis 										     ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
LOCAL wnrel
LOCAL cDesc1 := STR0001  //"Este programa ir  emitir a rela‡„o da movimenta‡„o banc ria"
LOCAL cDesc2 := STR0002  //"de acordo com os parametros definidos pelo usuario. Poder  ser"
LOCAL cDesc3 := STR0003  //"impresso em ordem de data disponivel,banco,natureza ou dt.digita‡„o."
LOCAL cString := "SE5"
LOCAL aOrd := {OemToAnsi(STR0004),OemToAnsi(STR0005),OemToAnsi(STR0006),OemToAnsi(STR0007),OemToAnsi(STR0034)}  //"Por Dt.Dispo"###"Por Banco"###"Por Natureza"###"Dt.Digitacao"###"Por Dt. Movimentacao"
Local cTamanho

PRIVATE titulo
PRIVATE cabec1	:= ""
PRIVATE cabec2 := ""
PRIVATE aReturn := { OemToAnsi(STR0019), 1,OemToAnsi(STR0020), 2, 2, 1, "",1 }  //"Zebrado"###"Administracao"
PRIVATE nomeprog:="FINR620"
PRIVATE nLastKey := 0
PRIVATE cPerg	 :="FIN620"

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica as perguntas selecionadas 						    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
pergunte("FIN620",.T.)

mv_par11 := Iif(Empty(mv_par11),1,mv_par11)
titulo := STR0021 + If(mv_par11==1, STR0022, STR0023) //" Analitico"###" Sintetico"
// Seta o tamanho do relatorio, G - Analitico e ordem <> 3 e M - Caso contrario.
cTamanho :=	If(mv_par11==1 .And. aReturn[8] != 3,"G","M")

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Variaveis utilizadas para parametros						 ³
//³ mv_par01				// da data							 ³
//³ mv_par02				// ate a data						 ³
//³ mv_par03				// do banco 						 ³
//³ mv_par04				// ate o banco 						 ³
//³ mv_par05				// da natureza 						 ³
//³ mv_par06				// ate a natureza 					 ³
//³ mv_par07				// da data de digitacao 			 ³
//³ mv_par08				// ate a data de digitacao 			 ³
//³ mv_par09				// qual moeda						 ³
//³ mv_par10				// tipo de historico 				 ³
//³ mv_par11				// Analitico / Sintetico			 ³
//³ mv_par12				// Considera filiais      			 ³
//³ mv_par13				// Filial De					 	 ³
//³ mv_par14				// Filial Ate			   			 ³
//³ mv_par15				// Imprime saldos		   			 ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Envia controle para a funcao SETPRINT 						 ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
wnrel := "FINR620"            //Nome Default do relatorio em Disco
wnrel := SetPrint(cString,wnrel,cPerg,@titulo,cDesc1,cDesc2,cDesc3,.F.,aOrd,,cTamanho)

If nLastKey == 27
	Return
Endif

SetDefault(aReturn,cString)

If nLastKey == 27
	Return
Endif

// Muda titulo do relatorio conforme impressao (analitico ou sintetico).
Titulo := STR0021 + If(mv_par11==1, STR0022, STR0023) //" Analitico"###" Sintetico"
// Seta o tamanho do relatorio, G - Analitico e ordem <> 3 e M - Caso contrario.
cTamanho :=	If(mv_par11==1 .And. aReturn[8] != 3,"G","M")

RptStatus({|lEnd| Fa620Imp(@lEnd,wnRel,cString,cTamanho)},Titulo)
Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡…o	 ³ FA620Imp ³ Autor ³ Wagner Xavier 		³ Data ³ 05.10.92 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Relacao da Movimentacao Bancaria 						  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Sintaxe e ³ FA620Imp(lEnd,wnRel,Cstring)								  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ lEnd	  - A‡Æo do Codeblock								  ³±±
±±³			 ³ wnRel   - T¡tulo do relat¢rio 							  ³±±
±±³			 ³ cString - Mensagem										  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso		 ³ Generico 												  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function FA620Imp(lEnd,wnRel,cString,cTamanho)
LOCAL CbCont,CbTxt
LOCAL nTotEnt := 0,nTotSai := 0,nGerEnt := 0,nGerSai := 0,nColuna := 0,lContinua := .T.
LOCAL nValor,cDoc
LOCAL lVazio  := .T.
LOCAL nMoeda, cTexto
#IFDEF TOP
	Local ni
	Local aStru 	:= SE5->(dbStruct())
	Local cIndice	:= SE5->(IndexKey())
#ELSE
	LOCAL nOrdSE5 :=SE5->(IndexOrd())
	LOCAL cChave
#ENDIF

LOCAL cIndex
LOCAL cHistor
LOCAL cChaveSe5
Local nTxMoeda:=0
Local cFilterUser := aReturn[7]
Local nMoedaBco	:=	1
Local nCasas		:= GetMv("MV_CENT"+(IIF(mv_par09 > 1 , STR(mv_par09,1),"")))
LOCAL bWhile   := { || IF( mv_par12 == 1, .T., SE5->E5_FILIAL == xFilial("SE5") ) }
Local nTotSaldo := 0
Local aSaldo
Local nGerSaldo := 0
Local nSaldoAtual := 0
Local lFirst := .T.
Local nTxMoedBc	:= 0
Local cPict := ""
Local nA	:= 0
Local lF620Qry := ExistBlock("F620QRY")
Local cQueryAdd := ""
Local nSaldoAnt := 0
Local lImpSaldo := .F.
Local nAscan := 0
Local cAnterior := ""
Local nBancos := 0
Local cCond2 := ""
Local cCond3 := ""
Local lPrimeiro := .T.
Local lCxLoja := GetNewPar("MV_CXLJFIN",.F.)
LOCAL aOrd := {OemToAnsi(STR0004),OemToAnsi(STR0005),OemToAnsi(STR0006),OemToAnsi(STR0007),OemToAnsi(STR0034)}  //"Por Dt.Dispo"###"Por Banco"###"Por Natureza"###"Dt.Digitacao"###"Por Dt. Movimentacao"

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Caso so'exista uma empresa/filial ou o SE5 seja compartilhado³
//³ nao ha' necessidade de ser processado por filiais            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
nOrdena := aReturn[8]

mv_par12 := Iif(SM0->(Reccount()) == 1 .or. Empty(xFilial("SE5")),2,mv_par12)
aSaldo := GetSaldos( MV_PAR12 == 1, nMoeda, If(mv_par12==1,mv_par13,xFilial("SA6")), If(mv_par12==1,mv_par14,xFilial("SA6")), mv_par01, mv_par03, mv_par04)

If mv_par09 == 0
	mv_par09 := 1
Endif

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Caso a ordem for por banco, deve-se retirar da array os bancos que mesmo com saldo, não tenham ³
//³ sofrido movimentacoes para o periodo especificado na parametrizacao                            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If aReturn[8] == 2
	#IFDEF TOP
		IF TcSrvType() != "AS/400"
			aSaldoAux := {}
			For nA := 1 to len(aSaldo)
				cQrySld := " SELECT COUNT(*) AS QTD FROM "+RetSQLName("SE5")+" SE5 "
				cQrySld += " WHERE SE5.E5_BANCO = '"+aSaldo[nA,2]+"' "
				cQrySld += " AND SE5.E5_AGENCIA = '"+aSaldo[nA,3]+"' "
				cQrySld += " AND SE5.E5_CONTA = '"  +aSaldo[nA,4]+"' "
				cQrySld += " AND SE5.E5_DATA BETWEEN '"+DTOS(mv_par01)+"' AND '"+DTOS(mv_par02)+"' "
				If mv_par12 == 1 //Filtra Filiais
					cQrySld += " AND SE5.E5_FILIAL BETWEEN '"+mv_par13+"' AND '"+mv_par14+"' "
				Else
					cQrySld += " AND SE5.E5_FILIAL = '"+xFilial("SE5")+"' "
				EndIf
				cQrySld += " AND SE5.D_E_L_E_T_ = ' ' "
				cQrySld := ChangeQuery(cQrySld)

				If Select("SE5SLD") > 0
					SE5SLD->(dbCloseArea())
				EndIf
				dbUseArea(.T., "TOPCONN", TCGenQry(,,cQrySld), 'SE5SLD', .T., .T.)
				If SE5SLD->QTD > 0
					aAdd(aSaldoAux,aSaldo[nA])
				EndIf
			Next
			If mv_par16 == 2 //Não inclui bancos sem movimentos
				aSaldo := aSaldoAux
			EndIf
			nA := 0
			If Select("SE5SLD") > 0
				SE5SLD->(dbCloseArea())
			EndIf
		Else
	#ENDIF
		aSaldoAux := {}
		For nA := 1 to len(aSaldo)
			se5->(dbSetOrder(1))
			se5->(dbSeek(xFilial("SE5")+DTOS(mv_par01)+aSaldo[nA][2]+aSaldo[nA][3]+aSaldo[nA][4],.T.))
			lPrimeiro := .T.

			While SE5->( !Eof() .And. lPrimeiro )
					If SE5->(Eof()) .Or. (aSaldo[nA][2]+aSaldo[nA][3]+aSaldo[nA][4]) <> SE5->(E5_BANCO+E5_AGENCIA+E5_CONTA) .Or. (SE5->E5_DATA < mv_par01 .Or. SE5->E5_DATA > mv_par02)

					Else
						aAdd(aSaldoAux,aSaldo[nA])
						lPrimeiro := .F.
					Endif
			SE5 -> ( dbSkip() )
			EndDo
		   	If 	mv_par16 == 1 .And. lPrimeiro
				aAdd(aSaldoAux,aSaldo[nA])
			EndIf
		Next
		aSaldo := aSaldoAux
		nA := 0
	#IFDEF TOP
		Endif
	#ENDIF
Endif

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Variaveis utilizadas para Impressao do Cabecalho e Rodape	  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cbtxt 	:= SPACE(10)
cbcont	:= 0
li 		:= 80
m_pag 	:= 1

cMoeda := Str(mv_par09,1,0)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Defini‡„o dos cabe‡alhos							    	  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If mv_par11 == 1
	titulo := STR0008 //"Relacao da Movimentacao Bancaria em "
	If aReturn[8] != 3 .And. mv_par15 == 1 // Ordem de natureza nao sera impresso os saldos
		cabec1 := STR0024 //"DATA       BCO AGENCIA  CONTA      NATUREZA    DOCUMENTO                              VALOR                               HISTORICO"
		cabec2 := STR0025 //"                                                                           ENTRADA             SAIDA        SALDO ATUAL"
	Else
		cabec1 := OemToAnsi(STR0009)  //"  DATA   BCO AGENCIA  CONTA    NATUREZA      DOCUMENTO                            VALOR             HISTORICO"
		cabec2 := OemToAnsi(STR0010)  //"                                                                        ENTRADA             SAIDA            "
	Endif
Else
	titulo := STR0026 //"Movimentação Bancária em "
	cabec1 := If(	mv_par15 == 1, STR0027,;
						StrTran(StrTran(StrTran(STR0027,"SALDO ATUAL",""),"SALDO ACTUAL",""),"CURR. BALN.","")) //"                                    ENTRADA             SAIDA        SALDO ATUAL"
Endif


nMoeda	:= mv_par09
cTexto	:= GetMv("MV_MOEDA"+Str(nMoeda,1))
Titulo	+= cTexto
titulo   += STR0028 + If(mv_par11==1, STR0029, STR0030) + STR0028 //" - "###"Analitico"###"Sintetico"###" - "
dbSelectArea("SE5")

#IFDEF TOP
	cQuery := "SELECT * "
	cQuery += " FROM " + RetSqlName("SE5")
	IF mv_par12 == 1
	   cQuery += " WHERE E5_FILIAL BETWEEN '" + mv_par13 + "' AND '" + mv_par14 + "'"
      ELSE
	   cQuery += " WHERE E5_FILIAL = '" + xFilial("SE5") + "'"
	ENDIF
	cQuery += " AND D_E_L_E_T_ <> '*' "
#ENDIF

If aReturn[8] == 1
	titulo += OemToAnsi(STR0011)  //" por data"
	#IFDEF TOP
		cCondicao 	:= ".T."
		cCond2 		:= "E5_DTDISPO"
		IF mv_par12 == 1
			cOrder		:= "E5_DTDISPO+E5_BANCO+E5_AGENCIA+E5_CONTA+E5_FILIAL"
		ELSE
			cOrder		:= "E5_FILIAL+E5_DTDISPO+E5_BANCO+E5_AGENCIA+E5_CONTA"
		ENDIF
	#ELSE
		cCondicao := "E5_DTDISPO >= mv_par01 .and. E5_DTDISPO <= mv_par02"
		cCond2 := "E5_DTDISPO"
		dbSelectArea("SE5")
		dbSetOrder(nOrdSE5)
		cIndex	:= CriaTrab(nil,.f.)
      IF mv_par12 == 1
		   cChave	:= "DTOS(E5_DTDISPO)+E5_BANCO+E5_AGENCIA+E5_CONTA+E5_FILIAL"
			IndRegua("SE5"  ,;
			         cIndex ,;
						cChave,,;
						"E5_FILIAL >= '"+mv_par13+"' .AND. E5_FILIAL <= '"+mv_par14+"'",;
						OemToAnsi(STR0012))  //"Selecionando Registros..."
		ELSE
			cChave	:= "E5_FILIAL+DTOS(E5_DTDISPO)+E5_BANCO+E5_AGENCIA+E5_CONTA"
			IndRegua("SE5"  ,;
			         cIndex ,;
						cChave,,,;
						OemToAnsi(STR0012))  //"Selecionando Registros..."
		ENDIF
		nIndex	 := RetIndex("SE5")
		dbSelectArea("SE5")
		dbSetIndex(cIndex+OrdBagExt())
		dbSetOrder(nIndex+1)
		IF mv_par12 == 1
			dbSeek(DtoS(mv_par01),.T.)
		ELSE
			dbSeek(xFilial()+DtoS(mv_par01),.T.)
		ENDIF
	#ENDIF
Elseif aReturn[8] == 2
	titulo += OemToAnsi(STR0013)  //" por Banco"
	SE5->(dbSetOrder(3))
	#IFDEF TOP
		cCondicao 	:= ".T."
		cCond2 := "E5_BANCO+E5_AGENCIA+E5_CONTA"
		cIndice := SE5->(IndexKey())
		IF mv_par12 == 1
		   cIndice := ALLTRIM(SUBSTR(cIndice,AT("+",cIndice)+1)) + "+E5_FILIAL"
		ENDIF
		cOrder := cIndice
	#ELSE
		cCondicao := "E5_BANCO >= mv_par03 .and. E5_BANCO <= mv_par04"
		cCond2 := "E5_BANCO+E5_AGENCIA+E5_CONTA"
		IF mv_par12 == 1
		   cIndex	:= CriaTrab(nil,.f.)
		   cChave	:= SE5->(INDEXKEY())
			cChave   := ALLTRIM(SUBSTR(cChave, AT("+",cChave)+1)) + "+E5_FILIAL"
			IndRegua("SE5" ,;
			         cIndex,;
						cChave,,;
						"E5_FILIAL >= '"+mv_par13+"' .AND. E5_FILIAL <= '"+mv_par14+"'",;
						OemToAnsi(STR0012))  //"Selecionando Registros..."
			nIndex	 := RetIndex("SE5")
			SE5->(dbSetIndex(cIndex+OrdBagExt()))
		   SE5->(dbSetOrder(nIndex+1))
			SE5->(DBSEEK(mv_par03,.T. ))
		ELSE
			SE5->(dbSetOrder(3))
		   SE5->(dbSeek(xFilial("SE5")+mv_par03,.T.))
		ENDIF
	#ENDIF
Elseif aReturn[8] == 3
	titulo += OemToAnsi(STR0014)  //" por Natureza"
	SE5->(dbSetOrder(4))
	#IFDEF TOP
		cCondicao 	:= ".T."
		cCond2		:= "E5_NATUREZ"
		cIndice := SE5->(IndexKey())
		IF mv_par12 == 1
		   cIndice := ALLTRIM(SUBSTR(cIndice,AT("+",cIndice)+1))+"+E5_FILIAL"
		ENDIF
		cOrder := cIndice
	#ELSE
		cCondicao := "E5_NATUREZ >= mv_par05 .and. E5_NATUREZ <= mv_par06"
		cCond2	  := "E5_NATUREZ"
		IF mv_par12 == 1
		   cIndex := CriaTrab(NIL,.F.)
			cChave := SE5->(INDEXKEY())
			cChave := ALLTRIM(SUBSTR(cChave,AT("+",cChave)+1))+"+E5_FILIAL"
			IndRegua("SE5"  ,;
			         cIndex ,;
						cChave,,;
						"E5_FILIAL >= '"+mv_par13+"' .AND. E5_FILIAL <= '"+mv_par14+"'",;
						OemToAnsi(STR0012))
			nIndex	 := RetIndex("SE5")
			SE5->(dbSetIndex(cIndex+OrdBagExt()))
		   SE5->(dbSetOrder(nIndex+1))
			SE5->(DBSEEK(mv_par05,.T.))
		ELSE
		   SE5->(dbSeek(xFilial("SE5")+mv_par05,.T.))
		ENDIF
	#ENDIF
Elseif aReturn[8] == 4 // Digitacao
   IF mv_par12 == 1
		cOrder	 := "DTOS(E5_DTDIGIT)+E5_PREFIXO+E5_NUMERO+E5_PARCELA+E5_FILIAL"
	ELSE
	   cOrder	 := "E5_FILIAL+DTOS(E5_DTDIGIT)+E5_PREFIXO+E5_NUMERO+E5_PARCELA"
	ENDIF
	cCond2	  := "E5_DTDIGIT"

	#IFDEF TOP
		cCondicao 	:= ".T."
	#ELSE
		cCondicao := "E5_DTDIGIT >= mv_par07 .and. E5_DTDIGIT <= mv_par08"
		titulo += OemToAnsi(STR0015)  //"  Por Data de Digitacao"
		cIndex:=CriaTrab("",.F.)
		dbSelectArea("SE5")
		IF mv_par12 == 1
	 	   IndRegua("SE5",;
			          cIndex ,;
						 cOrder,,;
						 "E5_FILIAL >= '" + mv_par13 + "' .AND. E5_FILIAL <= '" + mv_par14 + "'",OemToAnsi(STR0012))  //"Selecionando Registros..."
			nIndex	 := RetIndex("SE5")
			SE5->(dbSetIndex(cIndex+OrdBagExt()))
		   SE5->(dbSetOrder(nIndex+1))
			SE5->(dbSeek(DTOS(mv_par07),.T.))
		ELSE
		   IndRegua("SE5",cIndex,cOrder,,,OemToAnsi(STR0012))  //"Selecionando Registros..."
		   nIndex	 := RetIndex("SE5")
			SE5->(dbSetIndex(cIndex+OrdBagExt()))
		   SE5->(dbSetOrder(nIndex+1))
		   SE5->(dbSeek(xFilial("SE5")+DTOS(mv_par07),.T.))
		ENDIF
	#ENDIF
ElseIf aReturn[8] >= 5 // Data da Movimentacao
	If mv_par12 == 1
		cOrder := "DTOS(E5_DATA)+E5_PREFIXO+E5_NUMERO+E5_PARCELA+E5_FILIAL"
	Else
		cOrder := "E5_FILIAL+DTOS(E5_DATA)+E5_PREFIXO+E5_NUMERO+E5_PARCELA"
	Endif
	cCond2 := "E5_DATA"

	#IFDEF TOP
		cCondicao 	:= ".T."
	#ELSE
		cCondicao := "E5_DATA >= mv_par01 .and. E5_DATA <= mv_par02"
		titulo    += OemToAnsi(STR0034) // "Por Dt. Movimentacao"
		cIndex    := CriaTrab("",.F.)
		dbSelectArea("SE5")
		If mv_par12 == 1
	 		IndRegua("SE5", cIndex, cOrder,,;
					 "E5_FILIAL >= '" + mv_par13 + "' .AND. E5_FILIAL <= '" + mv_par14 + "'",;
					 OemToAnsi(STR0012))  //"Selecionando Registros..."
			nIndex := RetIndex("SE5")
			SE5->(dbSetIndex(cIndex+OrdBagExt()))
			SE5->(dbSetOrder(nIndex+1))
			SE5->(dbSeek(DTOS(mv_par01),.T.))
		Else
			IndRegua("SE5",cIndex,cOrder,,,OemToAnsi(STR0012))  //"Selecionando Registros..."
			nIndex := RetIndex("SE5")
			SE5->(dbSetIndex(cIndex+OrdBagExt()))
			SE5->(dbSetOrder(nIndex+1))
			SE5->(dbSeek(xFilial("SE5")+DTOS(mv_par01),.T.))
		Endif
	#ENDIF
EndIF
cFilterUser:=aReturn[7]

#IFDEF TOP
	cQuery += " AND E5_SITUACA <> 'C' "
	cQuery += " AND E5_NUMCHEQ <> '%*'"
	cQuery += " AND (E5_VENCTO <= E5_DATA Or E5_ORIGEM ='FINA087A' Or E5_ORIGEM ='FINA070' Or E5_ORIGEM ='FINA740')" 
	cQuery += " AND E5_DTDISPO BETWEEN '" + DTOS(mv_par01)  + "' AND '" + DTOS(mv_par02)       + "'"
	cQuery += " AND E5_BANCO BETWEEN   '" + mv_par03        + "' AND '" + mv_par04       + "'"
	cQuery += " AND E5_BANCO <> '   ' "
	cQuery += " AND E5_NATUREZ BETWEEN '" + mv_par05        + "' AND '" + mv_par06       + "'"
	cQuery += " AND E5_DTDIGIT BETWEEN '" + DTOS(mv_par07)        + "' AND '" + DTOS(mv_par08)       + "'"
	cQuery += " AND E5_TIPODOC NOT IN ('DC','JR','MT','BA','MT','CM','D2','J2','M2','C2','V2','CX','CP','TL') "
	If lF620Qry
		cQueryAdd := ExecBlock("F620QRY", .F., .F., {aReturn[7]})
		If ValType(cQueryAdd) == "C"
			cQuery += " AND ( " + cQueryAdd + ")"
		EndIf
	EndIf
	cQuery += " ORDER BY " + SqlOrder(cOrder)

	cQuery := ChangeQuery(cQuery)

	dbSelectAre("SE5")
	dbCloseArea()

	dbUseArea(.T., "TOPCONN", TCGenQry(,,cQuery), 'SE5', .T., .T.)

	For ni := 1 to Len(aStru)
		If aStru[ni,2] != 'C'
			TCSetField('SE5', aStru[ni,1], aStru[ni,2],aStru[ni,3],aStru[ni,4])
		Endif
	Next
#ENDIF

Set Softseek Off
SetRegua(RecCount())

For nBancos := 1 To IIf(aReturn[8]==2,Len(aSaldo),1)

	nTotEnt:=0
	nTotSai:=0
	nTotSaldo := 0
	lImpSaldo := (lFirst .And. aReturn[8] != 3) // Indica se o saldo anterior deve ser impresso
	If aReturn[8] == 2
		nSaldoAtual := 0
	Endif
	nSaldoAnt := 0

	// Pesquisa o saldo bancario
	If (Empty(cFilterUser) .And. aReturn[8] == 2) .Or. aReturn[8] <> 2
		If mv_par15 == 1 .And. lImpSaldo
			nSaldoAnt := 0
			If aReturn[8] == 2 // Ordem de banco
			  	If cPaisLoc	# "BRA" .OR. FXMultSld()
			 		SA6->(DbSetOrder(1))
			 		SA6->(DbSeek(xFilial()+aSaldo[nBancos][2]+aSaldo[nBancos][3]+aSaldo[nBancos][4]))
			 		nMoedaBco	:=	Max(SA6->A6_MOEDA,1)
			 	EndIf
				If (!Empty(aSaldo[nBancos][2]) .And. !Empty(aSaldo[nBancos][3]) .And. !Empty(aSaldo[nBancos][4]))
					cCond3:=aSaldo[nBancos][2]+aSaldo[nBancos][3]+aSaldo[nBancos][4]
				Else
					cCond3 := "EOF"
				EndIf
				nAscan := Ascan(aSaldo, {|e| e[2]+e[3]+e[4] == cCond3 } )
				If nAscan > 0
					nSaldoAnt := Round(xMoeda(aSaldo[nAscan][6],nMoedaBco,mv_par09,IIf(SE5->(EOF()),dDataBase,E5_DTDISPO),nCasas+1,nTxMoedBc),nCasas)
				Else
					nSaldoAnd := 0
				Endif
				lFirst := .T.
			Else
				// Na primeira vez, soma todos os saldos de todos os bancos
				If lFirst
					// Soma os saldos de todos os bancos
					For nA := 1 To Len(aSaldo)
						nSaldoAnt += Round(xMoeda(aSaldo[nA][6],MoedaBco(aSaldo[nA][2],aSaldo[nA][3],aSaldo[nA][4]),mv_par09,IIf(SE5->(EOF()),dDataBase,E5_DTDISPO),nCasas+1,nTxMoedBc),nCasas)
					Next
					lFirst := .F.
				Else
					// Apos a impressao da primeira linha, o saldo Anterior sera igual ao
					// saldo atual, impresso na ultima linha, antes da quebra de data
					If ( cPaisLoc == "BRA" )
						nSaldoAnt := nSaldoAtual
					Else
						nSaldoAnt := Round(xMoeda(nSaldoAtual,nMoedaBco,mv_par09,E5_DTDISPO,nCasas+1,nTxMoedBc),nCasas)
					Endif
				Endif
			Endif

			cPict := tm(nSaldoAnt,18,nCasas)

			IF li > 58
				cabec(@titulo,cabec1,cabec2,nomeprog,cTamanho,IIF(aReturn[4]==1,15,18))
			Endif

			// Imprime o saldo anterior
			@li,000 PSAY STR0031 + DTOC(mv_par01)+ ; //"Saldo anterior a "
							 If( aReturn[8] == 2, " : " + aSaldo[nBancos][2]+" "+aSaldo[nBancos][3]+" "+aSaldo[nBancos][4],STR0032)+; //" (Todos os bancos): "
							 Transform(nSaldoAnt,cPict)
			li++
			li++
			nSaldoAtual := nSaldoAnt
		Endif
    EndIf

	While !Eof() .And. EVAL(bWhile) .And. &cCondicao .and. lContinua

		IF lEnd
			@PROW()+1,001 PSAY OemToAnsi(STR0016)  //"CANCELADO PELO OPERADOR"
			lContinua:=.F.
			Exit
		End

		#IFNDEF TOP
			If !Fr620Skip1()
				dbSkip()
				Loop
			EndIf
		#ENDIF

		IncRegua()

		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Considera filtro do usuario                                  ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		If !Empty(cFilterUser).and.!(&cFilterUser)
			dbSkip()
			Loop
		Endif

		IF E5_MOEDA $ "C1/C2/C3/C4/C5/CH" .and. Empty(E5_NUMCHEQ) .and. !(E5_TIPODOC $ "TR#TE")
			dbSkip()
			Loop
		EndIf

		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Na transferencia somente considera nestes numerarios 		 ³
		//³ No Fina100 ‚ tratado desta forma.                    		 ³
		//³ As transferencias TR de titulos p/ Desconto/Cau‡Æo (FINA060) ³
		//³ nÆo sofrem mesmo tratamento dos TR bancarias do FINA100      ³
	    //³ Aclaracao : Foi incluido o tipo $ para os movimentos en di-- ³
	    //³ nheiro em QUALQUER moeda, pois o R$ nao e representativo     ³
	    //³ fora do BRASIL. Bruno 07/12/2000 Paraguai                    ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		If E5_TIPODOC $ "TR/TE" .and. Empty(E5_NUMERO)
			If !(E5_MOEDA $ "R$/DO/TB/TC/CH"+IIf(cPaisLoc=="BRA","","/$ "))
				dbSkip()
				Loop
			Endif
		Endif

		If E5_TIPODOC $ "TR/TE" .and. (Substr(E5_NUMCHEQ,1,1)=="*" ;
			.or. Substr(E5_DOCUMEN,1,1) == "*" )
			dbSkip()
			Loop
		Endif

		If E5_MOEDA == "CH" .and. (IsCaixaLoja(E5_BANCO) .And. !lCxLoja .And. E5_TIPODOC $ "TR/TE")		// Sangria
			dbSkip()
			Loop
		Endif

		cAnterior:=&cCond2
		nTotEnt:=0
		nTotSai:=0
		nTotSaldo := 0
		If !Empty(cFilterUser)  .and. aReturn[8] == 2
			lImpSaldo := (lFirst .And. aReturn[8] != 3) // Indica se o saldo anterior deve ser impresso
			nSaldoAtual := 0
			nSaldoAnt := 0
		EndIf

		If aReturn[8] == 2
			cCond3:="E5_BANCO=='"+aSaldo[nBancos][2]+"' .And. E5_AGENCIA=='"+aSaldo[nBancos][3]+"' .And. E5_CONTA=='"+aSaldo[nBancos][4]+"'"
			// Nao processa a movimentacao caso o banco nao esteja no array aSaldo
			If aScan(aSaldo, {|e| e[2]+e[3]+e[4] == SE5->(E5_BANCO+E5_AGENCIA+E5_CONTA) } ) == 0
				SE5->(dbSkip())
				Loop
			EndIf
		Else
			cCond3:=".T."
		Endif

		While !EOF() .and. &cCond2 = cAnterior .and. EVAL(bWhile) .and. lContinua .And. &cCond3

			IF lEnd
				@PROW()+1,001 PSAY OemToAnsi(STR0016)  //"CANCELADO PELO OPERADOR"
				lContinua:=.F.
				Exit
			EndIF

			IF Empty(E5_BANCO)
				dbSkip()
				Loop
			Endif

			IncRegua()

			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Considera filtro do usuario                                  ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			If !Empty(cFilterUser).and.!(&cFilterUser)
				dbSkip()
				Loop
			Endif

			IF E5_SITUACA == "C"
				dbSkip()
				Loop
			EndIF

			IF E5_MOEDA $ "C1/C2/C3/C4/C5/CH" .and. Empty(E5_NUMCHEQ) .and. !(E5_TIPODOC $ "TR#TE")
				dbSkip()
				Loop
			EndIF

			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Na transferencia somente considera nestes numerarios 		  ³
			//³ No Fina100 ‚ tratado desta forma.                    		  ³
			//³ As transferencias TR de titulos p/ Desconto/Cau‡Æo (FINA060) ³
			//³ nÆo sofrem mesmo tratamento dos TR bancarias do FINA100      ³
	      //³ Aclaracao : Foi incluido o tipo $ para os movimentos en di-- ³
	      //³ nheiro em QUALQUER moeda, pois o R$ nao e representativo     ³
	      //³ fora do BRASIL. Bruno 07/12/2000 Paraguai                    ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			If E5_TIPODOC $ "TR/TE" .and. Empty(E5_NUMERO)
	         If !(E5_MOEDA $ "R$/DO/TB/TC/CH"+IIf(cPaisLoc=="BRA","","/$ "))
					dbSkip()
					Loop
				Endif
			Endif

			If E5_TIPODOC $ "TR/TE" .and. (Substr(E5_NUMCHEQ,1,1)=="*" ;
				.or. Substr(E5_DOCUMEN,1,1) == "*" )
				dbSkip()
				Loop
			Endif

			If E5_MOEDA == "CH" .and. (IsCaixaLoja(E5_BANCO) .And. !lCxLoja .And. E5_TIPODOC $ "TR/TE")		// Sangria
				dbSkip()
				Loop
			Endif

			IF E5_VENCTO > E5_DATA .AND.;
				! alltrim(Upper(E5_ORIGEM)) == "FINA087A" .AND.;
				! alltrim(Upper(E5_ORIGEM)) == "FINA070" .AND.;
				! alltrim(Upper(E5_ORIGEM)) == "FINA740"
				SE5->(dbSkip())
				dbSkip()
				Loop
			EndIF

			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Verifica se esta' FORA dos parametros                  ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			IF (E5_DTDISPO < mv_par01) .or. (E5_DTDISPO > mv_par02)
				dbSkip()
				Loop
			Endif

			IF (E5_BANCO	< mv_par03) .or. (E5_BANCO  > mv_par04)
				dbSkip()
				Loop
			EndIf

			IF (E5_NATUREZ < mv_par05) .or. (E5_NATUREZ > mv_par06)
				dbSkip()
				Loop
			EndIF

			IF (E5_DTDIGIT < mv_par07) .or. (E5_DTDIGIT > mv_par08)
				dbSkip()
				Loop
			EndIF

			IF E5_TIPODOC $ "DCüJRüMTüBAüMTüCMüD2/J2/M2/C2/V2/CX/CP/TL"
				dbSkip()
				Loop
			Endif

			//  Para o Sigaloja, quando for sangria e nao for R$, nÆo listar nos
			// movimentos bancarios

	      If (E5_TIPODOC == "SG") .And. (!E5_MOEDA $ "R$"+IIf(cPaisLoc=="BRA","","/$ ")) //Sangria com moeda <> R$
				dbSkip()
				Loop
			EndIf

			dbSelectArea("SE5")

			If SubStr(E5_NUMCHEQ,1,1)=="*"      //cheque para juntar (PA)
				dbSkip()
				Loop
			Endif

			If !Empty( E5_MOTBX )
				If !MovBcoBx(E5_MOTBX)
					dbSkip()
					Loop
				Endif
			Endif

			IF li > 58
				cabec(@titulo,cabec1,cabec2,nomeprog,cTamanho,IIF(aReturn[4]==1,15,18))
			Endif
	
			If cPaisLoc	# "BRA" .OR. FXMultSld()
				SA6->(DbSetOrder(1))
				SA6->(DbSeek(xFilial()+SE5->E5_BANCO+SE5->E5_AGENCIA+SE5->E5_CONTA))
				nMoedaBco	:=	Max(SA6->A6_MOEDA,1)

				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³VerIfica se foi utilizada taxa contratada para moeda > 1          ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				nTxMoedBc := SE5->E5_TXMOEDA
				If mv_par09 > 1 .and. !Empty(E5_VLMOED2)
					nTxMoeda := RecMoeda(E5_DTDISPO,mv_par09)
					nTxMoeda :=if(nTxMoeda=0,1,nTxMoeda)
					nValor := Round(xMoeda(E5_VALOR,nMoedaBco,mv_par09,,nCasas+1,nTxMoedBc,nTxMoeda),nCasas)
				Else
					nValor := Round(xMoeda(E5_VALOR,nMoedaBco,mv_par09,E5_DTDISPO,nCasas+1,nTxMoedBc),nCasas)
				Endif
			Else
				nValor := xMoeda(E5_VALOR,1,mv_par09,E5_DATA)
			Endif

			lVazio := .F.

		// Pesquisa o saldo bancario
		If  !Empty(cFilterUser)  .And. lImpSaldo .And. mv_par15 == 1  .and. aReturn[8] == 2
			nSaldoAnt := 0
			If aReturn[8] == 2 // Ordem de banco
				nAscan := Ascan(aSaldo, {|e| e[2]+e[3]+e[4] == E5_BANCO+E5_AGENCIA+E5_CONTA } )
				If nAscan > 0
					If ( cPaisLoc == "BRA" )
						nSaldoAnt := aSaldo[nAscan][6]
					Else
						nSaldoAnt := Round(xMoeda(aSaldo[nAscan][6],nMoedaBco,mv_par09,E5_DTDISPO,nCasas+1,nTxMoedBc),nCasas)
					Endif
				Endif
			Else
				// Na primeira vez, soma todos os saldos de todos os bancos
				If lFirst
					// Soma os saldos de todos os bancos
					For nA := 1 To Len(aSaldo)
						If ( cPaisLoc <> "BRA" )
							nSaldoAnt += Round(xMoeda(aSaldo[nA][6],MoedaBco(aSaldo[nA][2],aSaldo[nA][3],aSaldo[nA][4]),mv_par09,E5_DTDISPO,nCasas+1,nTxMoedBc),nCasas)
						Else
							nSaldoAnt += aSaldo[nA][6]
						Endif
					Next
					lFirst := .F.
				Else
					// Apos a impressao da primeira linha, o saldo Anterior sera igual ao
					// saldo atual, impresso na ultima linha, antes da quebra de data
					If ( cPaisLoc == "BRA" )
						nSaldoAnt := nSaldoAtual
					Else
						nSaldoAnt := Round(xMoeda(nSaldoAtual,nMoedaBco,mv_par09,E5_DTDISPO,nCasas+1,nTxMoedBc),nCasas)
					Endif
				Endif
			Endif
			If ( cPaisLoc == "BRA" )
				cPict := "@E 999,999,999.99"
			Else
				cPict := PesqPict( "SE5", "E5_VALOR", 18, mv_par09 )
			Endif
			// Imprime o saldo anterior
			@li,000 PSAY STR0031 + DTOC(mv_par01)+ ; //"Saldo anterior a "
							 If( aReturn[8] == 2, " : " + Substr(cAnterior,1,3)+" "+Substr(cAnterior,4,5)+" "+Substr(cAnterior,9,10),STR0032)+; //" (Todos os bancos): "
							 Transform(nSaldoAnt,cPict)
			li++
			li++
			lImpSaldo := .F.
			nSaldoAtual := nSaldoAnt
		Endif
			// Calcula saldo atual
			nSaldoAtual := If(E5_RECPAG = "R",nSaldoAtual+nValor,nSaldoAtual-nValor)

			If mv_par11 == 1
				@li,000 PSAY If( aReturn[8]!=5, E5_DTDISPO, E5_DATA )
				@li,011 PSAY E5_BANCO
				@li,015 PSAY E5_AGENCIA
				@li,024 PSAY E5_CONTA
				@li,035 PSAY E5_NATUREZ
				cDoc := E5_NUMCHEQ
				If Empty( cDoc )
					cDoc := E5_DOCUMEN
				Endif

				IF Len(Alltrim(E5_DOCUMEN)) + Len(Alltrim(E5_NUMCHEQ)) <= 14
					cDoc := Alltrim(E5_DOCUMEN) + if(!empty(E5_DOCUMEN).and. !empty(E5_NUMCHEQ),"-","") + Alltrim(E5_NUMCHEQ )
				Endif

				If Empty(cDoc)
					cDoc := Alltrim(E5_PREFIXO)+if(!empty(E5_PREFIXO),"-","")+;
							  Alltrim(E5_NUMERO )+if(!empty(E5_PARCELA),"-"+E5_PARCELA,"")
				Endif

				If Substr( cDoc,1,1 ) == "*"
					dbSkip()
					Loop
				Endif
				// ajusta otamanho do documento para nao desposicionar o relatorio
				cDoc := If(Len(cDoc)==0,Space(1),cDoc)
				@li,47 PSAY SUBSTR (cDoc,1,26)
				nColuna := IIF(E5_RECPAG = "R" ,85, 110)

				@li,nColuna	PSAY nValor PicTure tm(nValor,18,MsDecimais(mv_par09))
				If aReturn[8] != 3 .And. mv_par15 == 1
					@li,If(mv_par11==1,130,95)	PSAY nSaldoAtual PicTure tm(nSaldoAtual,22,MsDecimais(mv_par09))
				Endif
			Endif

			IF E5_RECPAG = "R"
				nTotEnt += nValor
			Else
				nTotSai += nValor
			Endif
			nTotSaldo += nSaldoAtual
			If mv_par11 == 1
				nColuna := If(aReturn[8] != 3 .And. mv_par15 == 1 , 132, 95) //132,95
				If aOrd[3] = OemToAnsi(STR0006)
				  	nColuna := If(aReturn[8] != 3 .And. mv_par15 == 1 , 155, 131)
				Endif
				If mv_par10 == 1	// Imprime normalmente
					@li,nColuna PSAY SUBSTR(E5_HISTOR,1,40)
				Else					// Busca historico do titulo
					If E5_RECPAG == "R"
						cHistor		:= E5_HISTOR
						cChaveSe5	:= xFilial("SE1") + E5_PREFIXO + ;
											E5_NUMERO + E5_PARCELA + ;
											E5_TIPO
						dbSelectArea("SE1")
						DbSetOrder(1)
						dbSeek( cChaveSe5 )
						@li,nColuna PSAY  Left( iif( Empty(SE1->E1_HIST), cHistor, SE1->E1_HIST),20)
					Else
						cHistor		:= E5_HISTOR
						cChaveSe5	:= xFilial("SE2") + E5_PREFIXO + ;
											E5_NUMERO + E5_PARCELA + ;
											E5_TIPO	 + E5_CLIFOR
						dbSelectArea("SE2")
						SE2->(DbSetOrder(1))
						If SE5->E5_TIPODOC == "CH"
							dbSelectArea("SEF")
							SEF->(dbSetOrder(1))
							SEF->(dbSeek(xFilial("SEF")+SE5->E5_BANCO+SE5->E5_AGENCIA+SE5->E5_CONTA+SE5->E5_NUMCHEQ))
							While !SEF->(Eof()) .And. SEF->(EF_FILIAL+EF_BANCO+EF_AGENCIA+EF_CONTA+EF_NUM) ==;
									xFilial("SEF")+SE5->E5_BANCO+SE5->E5_AGENCIA+SE5->E5_CONTA+SE5->E5_NUMCHEQ
								If Empty(SEF->EF_IMPRESS)
									SEF->(dbSkip())
								Else
									Exit
								EndIf
							EndDo
							SE2->(dbSeek(xFilial("SE2")+SEF->(EF_PREFIXO+EF_TITULO+EF_PARCELA+EF_TIPO+EF_FORNECE)))
						Else
							SE2->(dbSeek(cChaveSe5))
						EndIf
						@li,nColuna PSAY Left( iif( Empty(SE2->E2_HIST), cHistor, SE2->E2_HIST) ,20)
					Endif
				Endif
				li++
			Endif
			dbSelectArea("SE5")
			dbSkip()
		Enddo

		If ( nTotEnt + nTotSai ) != 0
			li++
			IF aReturn[8] == 1 .or. aReturn[8] == 4 .or. aReturn[8] == 5
				@li, 0 PSAY STR0033 + DTOC(cAnterior) //"Total : "
			Elseif aReturn[8] == 2
				// Banco+Agencia+Conta
				@li, 0 PSAY STR0033 + Substr(cAnterior,1,3)+" "+Substr(cAnterior,4,5)+" "+Substr(cAnterior,9,10) //"Total : "
			Elseif aReturn[8] == 3
				dbSelectArea("SED")
				dbSeek(cFilial+cAnterior)
				@li, 0 PSAY STR0033 + cAnterior + " "+Substr(ED_DESCRIC,1,30) //"Total : "
			EndIF
			If mv_par11 != 1 // Sintetico
				@li, 50 PSAY nTotEnt	  PicTure tm(nTotEnt,18,MsDecimais(mv_par09))
				@li, 70 PSAY nTotSai	  PicTure tm(nTotSai,18,MsDecimais(mv_par09))
			Else
				@li, 85 PSAY nTotEnt	  PicTure tm(nTotEnt,18,MsDecimais(mv_par09))
				@li, 110 PSAY nTotSai	  PicTure tm(nTotSai,18,MsDecimais(mv_par09))
			Endif

			If aReturn[8] != 3 .And. mv_par15 == 1
				@li,If(mv_par11==1,130,85) PSAY nSaldoAtual PicTure tm(nTotSaldo,22,MsDecimais(mv_par09))
			Endif
			nGerEnt += nTotEnt
			nGerSai += nTotSai
			nGerSaldo += (nSaldoAnt + nTotEnt - nTotSai)
			nSaldoAnt := 0
			nTotSaldo := 0
			nTotEnt := 0
			nTotSai := 0
			li+=2
		Endif
		dbSelectArea("SE5")
		If aReturn[8]==2
			Exit
		EndIf
	EndDo
Next

IF (nGerEnt+nGerSai) != 0
	IF li+2 > 58
		cabec(@titulo,cabec1,cabec2,nomeprog,cTamanho,IIF(aReturn[4]==1,15,18))
	Endif
	li++
	@li,	0 PSAY OemToAnsi(STR0017)  //"Total Geral : "
	If mv_par11 != 1 // Sintetico
		@li, 50 PSAY nGerEnt 	PicTure tm(nGerEnt,18,MsDecimais(mv_par09))
		@li, 70 PSAY nGerSai 	PicTure tm(nGerSai,18,MsDecimais(mv_par09))
	Else
		@li, 85 PSAY nGerEnt 	PicTure tm(nGerEnt,18,MsDecimais(mv_par09))
		@li, 110 PSAY nGerSai 	PicTure tm(nGerSai,18,MsDecimais(mv_par09))
	Endif
	If aReturn[8] != 3 .And. mv_par15 == 1
		@li,If(mv_par11==1,130,85) PSAY nGerSaldo PicTure tm(nTotSaldo,22,MsDecimais(mv_par09))
	Endif
	li++
	roda(cbcont,cbtxt,cTamanho)
End

If lVazio
	IF li > 58
		cabec(@titulo,cabec1,cabec2,nomeprog,cTamanho,IIF(aReturn[4]==1,15,18))
	End
	@li, 0 PSAY OemToAnsi(STR0018)  //"Nao existem lancamentos neste periodo"
	li++
	roda(cbcont,cbtxt,cTamanho)
End


Set Device To Screen

#IFDEF TOP
	dbSelectArea("SE5")
	dbCloseArea()
	ChKFile("SE5")
	dbSelectArea("SE5")
	dbSetOrder(1)
#ELSE
	dbSelectArea("SE5")
	dbClearFil()
	RetIndex( "SE5" )
	If !Empty(cIndex)
		FErase (cIndex+OrdBagExt())
	Endif
	dbSetOrder(1)
#ENDIF


If aReturn[5] = 1
	Set Printer to
	dbCommit()
	OurSpool(wnrel)
End
MS_FLUSH()

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡„o	 ³Fr620Skip1³ Autor ³ Pilar S. Albaladejo   ³ Data ³ 13.10.99 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡„o ³Pula registros de acordo com as condicoes (AS 400/CDX/ADS)  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso		 ³ FINR620.PRX																  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
#IFNDEF TOP

Static Function Fr620Skip1()

Local lRet := .T.

If Empty(E5_BANCO)
	lRet := .F.
ElseIf E5_SITUACA == "C"
	lRet := .F.
ElseIf E5_MOEDA $ "C1/C2/C3/C4/C5/CH" .and. Empty(E5_NUMCHEQ) .and. !(E5_TIPODOC $ "TR#TE")
	lRet := .F.
ElseIF E5_VENCTO > E5_DATA .AND. ! Upper(E5_ORIGEM) == "FINA087A"	
	lRet := .F.
Endif

Return lRet

#ENDIF


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºFuncao    ³GetSaldos ºAutor  ³Claudio D. de Souza º Data ³  30/08/01   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Obter os saldos dos bancos do SA6                          º±±
±±º          ³ Parametros:                                                º±±
±±º          ³ lConsFil    -> Considera filiais                           º±±
±±º          ³ nMoeda      -> Codigo da moeda                             º±±
±±º          ³ Retorno:                                                   º±±
±±º          ³ aRet[n] = .F.,Banco,Agencia,Conta,Nome,Saldo               º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ FINR140                                                    º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GetSaldos( lConsFil, nMoeda, cFilDe, cFilAte, dDataSaldo, cBancoDe, cBancoAte )
Local aRet     := {},;
		aArea    := GetArea(),;
		aAreaSa6 := Sa6->(GetArea()),;
		aAreaSe8 := Se8->(GetArea()),;
		cTrbBanco                   ,;
		cTrbAgencia                 ,;
		cTrbConta                   ,;
		cTrbNome                    ,;
		nTrbSaldo                   ,;
		cIndSE8  := ""				,;
		cSavFil  := IIf( lFWCodFil, FWGETCODFILIAL, SM0->M0_CODFIL )	,;
		aAreaSm0 :=	SM0->(GetArea()),;
		nAscan

/* GESTAO - inicio */
Local lContinua		:= .F.
Local nFil			:= 0
Local lSelFil		:= .F.
Local lSA6ExcEmp	:= .F.		/* indica se o acesso a tabela SA6 e exclusivo a nivel de empresa */
Local lSA6ExcUnN	:= .F.		/* indica se o acesso a tabela SA6 e esclusivo a nivel de unidade de negocio */
Local lSA6ExcFil	:= .F.		/* indica se o acesso a tabela SA6 e esclusivo a nivel de filial */
Local nLenSel		:= 0
Local nLencFil		:= 0
Local lGestao		:= Iif( lFWCodFil, FWSizeFilial() > 2, .F. )	// Indica se usa Gestao Corporativa
/* GESTAO - fim */

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atribui valores as variaveis ref a filiais                ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

/* GESTAO - inicio */
dbSelectArea("SM0")
If Empty(aSelFil)
	If !lConsFil
		cFilDe  := IIf( lFWCodFil, FWGETCODFILIAL, SM0->M0_CODFIL )
		cFilAte := IIf( lFWCodFil, FWGETCODFILIAL, SM0->M0_CODFIL )
	Endif
	dbSeek(cEmpAnt+cFilDe,.T.)
	lSelFil := .F.
	lContinua := !Eof() .and. M0_CODIGO == cEmpAnt .and. IIf( lFWCodFil, FWGETCODFILIAL, SM0->M0_CODFIL ) <= cFilAte
Else
	nFil := 1
	nLenSel := Len(aSelFil)
	lContinua := (nFil <= nLenSel)
	lSelFil := .T.
Endif
If lGestao
	lSA6ExcEmp := (FWModeAccess("SA6",1) == "E")
	lSA6ExcUnN := (FWModeAccess("SA6",2) == "E")
	lSA6ExcFil := (FWModeAccess("SA6",3) == "E")
Endif

While lContinua
	If lSelFil
		cFilAnt := aSelFil[nFil]
	Else
		cFilAnt := IIf( lFWCodFil, FWGETCODFILIAL, SM0->M0_CODFIL )
	Endif
/* GESTAO - fim */

	DbSelectArea("SA6")
	MsSeek( xFilial("SA6") )

	While SA6->(!Eof()) .And. A6_FILIAL == xFilial("SA6")
		If !(SA6->A6_COD >= cBancoDe .And. SA6->A6_COD <= cBancoAte)
			SA6->(DBSkip())
			Loop
		EndIf
		If SA6->A6_FLUXCAI $ "S " .Or.  nOrdena == 2
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³Verifica banco a banco a disponibilidade imediata    		  ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			dbSelectArea("SE8")
			cTrbBanco  := SA6->A6_COD
			cTrbAgencia:= SA6->A6_AGENCIA
			cTrbConta  := SA6->A6_NUMCON
			cTrbNome   := SA6->A6_NREDUZ
			Aadd(aRet,{.F.,cTrbBanco,cTrbAgencia,cTrbConta,cTrbNome,0,nMoeda, xMoeda(SA6->A6_LIMCRED,If(cPaisLoc=="BRA",1,Max(SA6->A6_MOEDA,1)),mv_par09)})
			// Pesquiso o saldo na data anterior a data solicitada
			If MsSeek(xFilial("SE8")+SA6->(A6_COD+A6_AGENCIA+A6_NUMCON), .T.)
				While !EOF() 										.And.;
						SA6->(A6_COD+A6_AGENCIA+A6_NUMCON) ==	;
						SE8->(E8_BANCO+E8_AGENCIA+E8_CONTA)	.And.;
						xFilial("SE8") == SE8->E8_FILIAL
						dbSkip()
				End
				DbSkip(-1)
				While !Bof() 										.And.;
						SA6->(A6_COD+A6_AGENCIA+A6_NUMCON) ==	;
						SE8->(E8_BANCO+E8_AGENCIA+E8_CONTA)	.And.;
						xFilial("SE8") == SE8->E8_FILIAL		.And.;
						SE8->E8_DTSALAT >= dDataSaldo
					dbSkip( -1 )
				End
			EndIf
			While !Eof()										.And.;
					SA6->(A6_COD+A6_AGENCIA+A6_NUMCON) == ;
					SE8->(E8_BANCO+E8_AGENCIA+E8_CONTA)	.And.;
	            xFilial("SE8") == SE8->E8_FILIAL		.And.;
	            SE8->E8_DTSALAT < dDataSaldo
				nTrbSaldo := xMoeda(SE8->E8_SALATUA,1,nMoeda)
				// Pesquisa banco+agencia+conta, para nao exibir saldos duplicados.
				nAscan := Ascan(aRet, {|e| e[2]+e[3]+e[4] == cTrbBanco+cTrbAgencia+cTrbConta})
				If nAscan > 0
					aRet[nAscan][6] := aRet[nAscan][6] + nTrbSaldo
				Else
					Aadd(aRet,{.F.,cTrbBanco,cTrbAgencia,cTrbConta,cTrbNome,nTrbSaldo,nMoeda, xMoeda(SA6->A6_LIMCRED,If(cPaisLoc=="BRA",1,Max(SA6->A6_MOEDA,1)),mv_par09)})
				Endif
				DbSkip()
			EndDo
		Endif
		dbSelectArea("SA6")
		dbSkip()
	End
	/* GESTAO - inicio */
	If lGestao .AND. lSelFil
		cFil := ""
		If lSA6ExcEmp
			cFil := FWCompany("SA6")
			If lSA6ExcUnN
				cFil += FWUnitBusiness("SA6")
				If lSA6ExcFil
					cFil += FwFilial("SA6")
				Endif
			Endif
		Endif
		If Empty(cFil)
			lContinua := .F.
		Else
			nLencFil := Len(cFil)
			While (nLenSel > 0) .And. (nFil <= nLenSel) .And. (cFil == Substr(aSelFil[nFil],1,nLencFil))
				nFil++
			Enddo
			lContinua := (nFil <= nLenSel)
		Endif
	Else
		If Empty(xFilial("SA6")) .And.;
			Empty(xFilial("SE8"))
			Exit
		Endif
		dbSelectArea("SM0")
		dbSkip()
		lContinua := !Eof() .and. M0_CODIGO == cEmpAnt .and. IIf( lFWCodFil, FWGETCODFILIAL, SM0->M0_CODFIL ) <= cFilAte
	Endif
	/* GESTAO - fim */
EndDo

SM0->(RestArea(aAreaSM0))
cFilAnt := cSavFil

If ( !Empty(cIndSE8) )
	dbSelectArea("SE8")
	RetIndex("SE8")
	dbClearFilter()
	Ferase(cIndSE8+OrdBagExt())
EndIf

Sa6->(RestArea(aAreaSa6))
Se8->(RestArea(aAreaSe8))
RestArea(aArea)

Return aRet
