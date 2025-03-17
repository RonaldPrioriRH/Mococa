#include 'protheus.ch'
#include 'parmtype.ch'
#Include 'FIVEWIN.CH'
#include 'PONCALEN.CH' 
#INCLUDE "report.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡„o    ³ IPONR002  ³ Autor ³ R.H. - J. Ricardo     ³ Data ³ 10.04.96 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Divergencias nas marcacoes                                 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Sintaxe   ³ IPONR002(void)                                              ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Generico                                                   ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³         ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL.             ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Programador ³ Data   ³ BOPS ³  Motivo da Alteracao                     ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/
User Function IPONR002()
Local	oReport   
Local	aArea 		:= GetArea()
Private cPerg		:= "IPONR02A"
Private cProcesso 	:= Nil
Private cPeriodo  	:= Nil
Private cRoteiro  	:= Nil
Private cNumPagto 	:= Nil
Private _aGrpSx1    := {}
Private c_Alias     := ""
Private lImpAcum    := .F.
Private dIniPonMes  := Ctod("//")	//-- Data Inicial do Periodo em Aberto 
Private dFimPonMes  := Ctod("//")	//-- Data Final do Periodo em Aberto 

	cPerg := Padr("IPONR02A",10)// IF(nColPro == 1,"IPONR02A","IPONR02B") // PN040RA e PN040RB 	
	aadd(_aGrpSx1,{cperg, "01", "Processo"                 , "mv_ch1","C", 05     , 0, 0, "G", "fListProc()", "MV_PAR01", space(15), space(30)  , space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "RCJ",""})
	aadd(_aGrpSx1,{cperg, "02", "Data De"                  , "mv_ch2","D", 08     , 0, 0, "G", ""           , "MV_PAR02", space(15), space(30)  , space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30),"",""})
	aadd(_aGrpSx1,{cperg, "03", "Data Ate"                 , "mv_ch3","D", 08     , 0, 0, "G", space(60)    , "MV_PAR03", space(15), space(30)  , space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "",""})
	aadd(_aGrpSx1,{cperg, "04", "Departamento"             , "mv_ch4","C", 99     , 0, 0, "R", space(60)    , "MV_PAR04", space(15),"RA_DEPTO"  , space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "SQB",""})
	aadd(_aGrpSx1,{cperg, "05", "Filial   "                , "mv_ch5","C", 99     , 0, 0, "R", space(60)    , "MV_PAR05", space(15),"RA_FILIAL" , space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "XM0",""})
	aadd(_aGrpSx1,{cperg, "06", "Centro de Custo"          , "mv_ch6","C", 99     , 0, 0, "R", space(60)    , "MV_PAR06", space(15),"RA_CC"     , space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "CTT",""})
	aadd(_aGrpSx1,{cperg, "07", "Turno"                    , "mv_ch7","C", 99     , 0, 0, "R", space(60)    , "MV_PAR07", space(15),"RA_TNOTRAB", space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "SR6",""})
	aadd(_aGrpSx1,{cperg, "08", "Matricula"                , "mv_ch8","C", 99     , 0, 0, "R", space(60)    , "MV_PAR08", space(15),"RA_MAT"    , space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "SRA",""})
	aadd(_aGrpSx1,{cperg, "09", "Nome"                     , "mv_ch9","C", 99     , 0, 0, "R", space(60)    , "MV_PAR09", space(15),"RA_NOME"   , space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "",""})
	aadd(_aGrpSx1,{cperg, "10", "Situação"                 , "mv_cha","C", 05     , 0, 0, "G", "fSituacao"  , "MV_PAR10", space(15), space(30)  , space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "",""})
	aadd(_aGrpSx1,{cperg, "11", "Categoria"                , "mv_chb","C", 15     , 0, 0, "G", "fCategoria" , "MV_PAR11", space(15), space(30)  , space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "",""})
	aadd(_aGrpSx1,{cperg, "12", "Impr. C.C em outra Pag."  , "mv_chc","N", 01     , 0, 0, "C", space(60)    , "MV_PAR12", "Sim"    , space(30)  , space(15), "Não"    , space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "",""})
	aadd(_aGrpSx1,{cperg, "13", "Impr. Msg Marcacao Impar" , "mv_chd","N", 01     , 0, 0, "C", space(60)    , "MV_PAR13", "Sim"    , space(30)  , space(15), "Não"    , space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "",""})
	aadd(_aGrpSx1,{cperg, "14", "Impr. Msg Hora Extra"     , "mv_che","N", 01     , 0, 0, "C", space(60)    , "MV_PAR14", "Sim"    , space(30)  , space(15), "Não"    , space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "",""})
	aadd(_aGrpSx1,{cperg, "15", "Impr. Msg Inter.Dif.Prog.", "mv_chf","N", 01     , 0, 0, "C", space(60)    , "MV_PAR15", "Sim"    , space(30)  , space(15), "Não"    , space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "",""})
	aadd(_aGrpSx1,{cperg, "16", "Impr. Msg Sit. Func."     , "mv_chg","N", 01     , 0, 0, "C", space(60)    , "MV_PAR16", "Sim"    , space(30)  , space(15), "Não"    , space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "",""})
	aadd(_aGrpSx1,{cperg, "17", "Impr. Msg Acima 10h Trab" , "mv_chh","N", 01     , 0, 0, "C", space(60)    , "MV_PAR17", "Sim"    , space(30)  , space(15), "Não"    , space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "",""})
	aadd(_aGrpSx1,{cperg, "18", "Impr. Msg 6h Sem Interv." , "mv_chi","N", 01     , 0, 0, "C", space(60)    , "MV_PAR18", "Sim"    , space(30)  , space(15), "Não"    , space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "",""})
	aadd(_aGrpSx1,{cperg, "19", "Impr. Msg Inter Menor 1h" , "mv_chj","N", 01     , 0, 0, "C", space(60)    , "MV_PAR19", "Sim"    , space(30)  , space(15), "Não"    , space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "",""})
	aadd(_aGrpSx1,{cperg, "20", "Impr. Msg Interjornada"   , "mv_chl","N", 01     , 0, 0, "C", space(60)    , "MV_PAR20", "Sim"    , space(30)  , space(15), "Não"    , space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "",""})
	aadd(_aGrpSx1,{cperg, "21", "Impr. Msg Trab SAB Comp." , "mv_chm","N", 01     , 0, 0, "C", space(60)    , "MV_PAR21", "Sim"    , space(30)  , space(15), "Não"    , space(30), space(15), space(15), space(30), space(15), space(15), space(30), space(15), space(15), space(30), "",""})
    u__CRIASX1(_aGrpSx1)
	pergunte(cPerg,.F.) 

    oReport := ReportDef()
    oReport:PrintDialog()
RestArea( aArea )

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡ao    ³ ReportDef  ³ Autor ³ Totvs IP RH           ³ Data ³12/04/2011³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡ao ³ Divergencias nas marcacoes                                   ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Sintaxe   ³ IPONR002                                                      ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³                                                              ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ IPONR002 - Generico                                           ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/
Static Function ReportDef()
Local oReport 
Local oSection1 
Local oSection2 

Private aOrd    := {"Matricula" , "Centro de Custo" , 'Nome', 'Turno' , 'C.Custo+Nome' , 'Departamento' } // 
// Private cTitulo	:= OemToAnsi('Divergencias nas Marcacoes do período ')			//'Divergencias nas Marcacoes'
Private cTitulo	 := OemToAnsi('Divergencias nas Marcacoes do período: ' + dtoc(mv_par02) + " a " + dtoc(mv_par03))			//'Divergencias nas Marcacoes'

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Criacao dos componentes de impressao                                    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
DEFINE REPORT oReport NAME "IPONR002" TITLE cTitulo PARAMETER cPerg ACTION {|oReport| PN040Imp(oReport)} DESCRIPTION OemtoAnsi("Este programa emite Relacao dos Funcionarios com Divergencias de Marcacoes") TOTAL IN COLUMN // "Este programa emite Relacao dos Funcionarios com Divergencias de Marcacoes"

	oSection1 := TRSection():New( oReport, OemToAnsi("Funcionarios"), {"SRA","CTT","SR6"}, aOrd,,,,,.F.,.F.,.F.) // "Funcionarios"
		TRCell():New(oSection1,"RA_FILIAL"	,"SRA")
		TRCell():New(oSection1,"RA_CHAPA"	,"SRA",,,5)
		TRCell():New(oSection1,"RA_MAT"		,"SRA",,,6)
		TRCell():New(oSection1,"RA_NOMECMP"	,"SRA",,,50,,,,.T.)
		TRCell():New(oSection1,"RA_CC"		,"SRA",OemToAnsi("C.Custo"),,9)	// "C.Custo"
		TRCell():New(oSection1,"CTT_DESC01"	,"CTT",,,20,,,,.T.)
		TRCell():New(oSection1,"RA_TNOTRAB"	,"SRA",OemToAnsi("Tno."),,3)	// "Tno"
		TRCell():New(oSection1,"R6_DESC"	,"SR6",,,15,,,,.T.)
		TRCell():New(oSection1,"RA_DEPTO"	,"SRA",OemToAnsi("Depto."),,9)	// Depto
		TRCell():New(oSection1,"QB_DESCRIC"	,"SQB",,,15,,,,.T.)

	oSection2 := TRSection():New( oSection1, OemToAnsi("Marcações"),,,,,,,.F.,.F.,.F. )	 //"Marcações"
		TRCell():New( oSection2, "DATA"			, "" ,OemToAnsi("Data"),,10)	// "Data"
		TRCell():New( oSection2, "MARCACOES"	, "" ,OemToAnsi("Marcações"),,70)	// "Marcações"
		TRCell():New( oSection2, "OCORRENCIAS"	, "" ,OemToAnsi("Ocorrencias"),,40)	// "Ocorrencias"
Return(oReport)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡ao    ³ PN040Imp   ³ Autor ³ Totvs IP RH           ³ Data ³12/04/2011³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡ao ³ Impressao do relatorio em TReport                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Sintaxe   ³ PN040Imp(oReport)                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ oReport                                                      ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ IPONR002 - Generico - Release 4                               ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/
Static Function PN040Imp(oReport)
Local oSection  := oReport:Section(1)
Local oSection1 := oReport:Section(1):Section(1)
Local cSitQuery	:= ""    
Local cCatQuery	:= ""  
Local nReg		:= 0
Local nOrdem	:= 1

/*
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³ Variaveis de Acesso do Usuario                               ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ*/
Local cAcessaSRA	:= &( " { || " + ChkRH( "IPONR002" , "SRA" , "2" ) + " } " )

//-- Variaveis Locais
//* Caracter
Local cKey       := ''
Local cDet       := ''
Local cOrdem     := ''
Local cTraba     := '' 

//* Data
Local dDataOk    := CtoD('  /  /  ')
Local dData      := CtoD('  /  /  ')

//* Array
Local aTabPadrao := {}
Local aTabCalend := {}
Local aNewMarc	 := {}
Local aMarcacoes := {}
Local aMotivo    := {}
Local aTurnos    := {}
Local aHENA      := {}
Local aIntervalo := {}
Local aSiglaMarc := {}

//* L¢gico
Local lIntMaior	 := .F.
Local lIntMenor  := .F.

//* N£m‚rico
Local nX         := 0
Local nY         := 0
Local nZ         := 0
Local nQuant     := 0   
Local nHrReal	 := 0
Local nIntProg   := 0
Local nIntReal   := 0
Local nPos1E     := 0
Local nW         := 0
Local nLenMarc	 := 0
Local nLenCalend := 0
Local nPosOrdem	 := 0  
Local nTolInt	 := 0

Local oBreakCc
Local oBreakFil
Local oBreakFun

Private cAliasQry 	:= GetNextAlias()

Private cFilAnte   := ''
Private cTnoAnt    := ''

Private cSit     := ""
Private cCat     := ""
Private lCC      := .F.
Private lNMarc   := .F.
Private lHExtr   := .F.
Private lInter   := .F. 
Private lSitfu   := .F.
Private l10Trab  := .F. // Mais de 10 horas trabalhadas
Private l6Inter  := .F. // Mais de 6 horas sem intervalo
Private l1IntMe  := .F. // Menos de uma hora de intervalo
Private lInterJ  := .F. // Interjornada, 11 horas de descanso entre um dia e outro
Private lSabComp := .F. // Jornada de 8:48, sábado compensado

Private dDataIni := CTOD("  /  /  ")
Private dDataFim := CTOD("  /  /  ")
Private dPerIni  := CTOD('  /  /  ')
Private dPerFim  := CTOD('  /  /  ')
Private oPeriodo := RHPERIODO():New()

TabMarc('SPJ',@aSiglaMarc)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Carregando variaveis mv_par?? para Variaveis do Sistema.     ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ IPONR02A - Perguntes por Data                                 ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Variaveis utilizadas para parametros                         ³
	//³ MV_PAR01        //  Processo                                 ³
	//³ MV_PAR02        //  Data Inicial                             ³
	//³ MV_PAR03        //  Data Final                               ³
	//³ MV_PAR04        //  Departamento                             ³
	//³ MV_PAR05        //  Filial                                   ³
	//³ MV_PAR06        //  Centro de Custo                          ³
	//³ MV_PAR07        //  Turno                                    ³
	//³ MV_PAR08        //  Matricula                                ³
	//³ MV_PAR09        //  Nome                                     ³
	//³ MV_PAR10        //  Situacao                                 ³
	//³ MV_PAR11        //  Categoria                                ³
	//³ MV_PAR12        //  Imprime C.C em outra Pagina              ³
	//³ MV_PAR13        //  Imprime Mensagem No. Marca‡”es           ³
	//³ MV_PAR14        //  Imprime Mensagem H. Extra                ³
	//³ MV_PAR15        //  Imprime Intervalo                        ³
	//³ MV_PAR16        //  Imprime Situa‡„o do Funcion rio          ³
	//³ MV_PAR17        //  Imprime Msg Acima 10h Trab               ³
	//³ MV_PAR18        //  Imprime Msg 6h Sem Interv.               ³
	//³ MV_PAR19        //  Imprime Msg Inter Menor 1h               ³
	//³ MV_PAR20        //  Imprime Msg Interjornada                 ³
	//³ MV_PAR21        //  Imprime Msg Trab SAB Comp.               ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

	cProcesso := mv_par01			
	dPerIni   := mv_par02
	dPerFim   := mv_par03
	cDeptoDe  := mv_par04			
	cFilDe    := mv_par05
	CcDe      := mv_par06
	TurDe     := mv_par07
	MatDe     := mv_par08
	NomDe     := mv_par09
	cSit      := mv_par10
	cCat      := mv_par11
	lCC       := If(mv_par12 == 1,.T.,.F.)
	lNMarc    := If(mv_par13 == 1,.T.,.F.)
	lHExtr    := If(mv_par14 == 1,.T.,.F.)
	lInter    := If(mv_par15 == 1,.T.,.F.)
	lSitfu    := If(mv_par16 == 1,.T.,.F.)
	l10Trab   := If(mv_par17 == 1,.T.,.F.)
	l6Inter   := If(mv_par18 == 1,.T.,.F.)
	l1IntMe   := If(mv_par19 == 1,.T.,.F.)
	lInterJ   := If(mv_par20 == 1,.T.,.F.)
	lSabComp  := If(mv_par21 == 1,.T.,.F.)

SP4->(dbSetOrder(1))
SRA->(dbSetOrder(1))

oPeriodo:dDataIni := dPerIni
oPeriodo:dDataFim := dPerFim	

//-- Modifica variaveis para a Query
For nReg:=1 to Len(cSit)
	cSitQuery += "'"+Subs(cSit,nReg,1)+"'"
	If ( nReg+1 ) <= Len(cSit)
		cSitQuery += "," 
	Endif
Next nReg        
cSitQuery := "%" + cSitQuery + "%"

cCatQuery := ""
For nReg:=1 to Len(cCat)
	cCatQuery += "'"+Subs(cCat,nReg,1)+"'"
	If ( nReg+1 ) <= Len(cCat)
		cCatQuery += "," 
	Endif
Next nReg        
cCatQuery := "%" + cCatQuery + "%"

//Transforma parametros do tipo Range em expressao ADVPL para ser utilizada no filtro
MakeSqlExpr(cPerg)
	
BEGIN REPORT QUERY oSection

cFilSRACTT	:= "%" + FWJoinFilial("SRA", "CTT") + "%"
cFilSRASR6	:= "%" + FWJoinFilial("SRA", "SR6") + "%"	
cFilSRASQB	:= "%" + FWJoinFilial("SRA", "SQB") + "%"	
nOrdem		:= oSection:GetOrder()

If nOrdem == 1
	cOrdem := "%SRA.RA_FILIAL,SRA.RA_MAT%"
ElseIf nOrdem == 2
	cOrdem := "%SRA.RA_FILIAL,SRA.RA_CC,SRA.RA_MAT%"
ElseIf nOrdem == 3
	cOrdem := "%SRA.RA_FILIAL,SRA.RA_NOME,SRA.RA_MAT%"
ElseIf nOrdem == 4
	cOrdem := "%SRA.RA_FILIAL,SRA.RA_TNOTRAB%"
ElseIf nOrdem == 5
	cOrdem := "%SRA.RA_FILIAL,SRA.RA_CC,SRA.RA_NOME%"
ElseIf nOrdem == 6
	cOrdem := "%SRA.RA_FILIAL,SRA.RA_DEPTO,SRA.RA_MAT%"
Endif

cQryProcesso := "%(SRA.RA_DEMISSA = '          ' OR (SRA.RA_DEMISSA >= '"+DTOS(dPerIni) + "' AND  SRA.RA_DEMISSA <> '          '))"
If !Empty(cProcesso)
	cQryProcesso += " AND SRA.RA_PROCES = '" + cProcesso + "' "	
Endif
cQryProcesso += "%"
 
BeginSql alias cAliasQry
	SELECT SRA.RA_FILIAL, SRA.RA_CC, SRA.RA_MAT, SRA.RA_NOME, SRA.RA_TNOTRAB, SRA.RA_DEMISSA,SRA.RA_ADMISSA,SRA.RA_SITFOLH,SRA.RA_CHAPA,
		SRA.RA_SEQTURN,SRA.RA_DEPTO, SRA.RA_PROCES,
		CTT.CTT_FILIAL, CTT.CTT_CUSTO, CTT.CTT_DESC01,
		SR6.R6_TURNO, SR6.R6_DESC,
		SQB.QB_DEPTO, SQB.QB_DESCRIC
	FROM %table:SRA% SRA
	INNER JOIN %table:CTT% CTT ON RA_CC = CTT_CUSTO AND CTT.%NotDel% AND %exp:cFilSRACTT%
	INNER JOIN %table:SR6% SR6 ON RA_TNOTRAB = R6_TURNO AND SR6.%NotDel% AND %exp:cFilSRASR6%
	INNER JOIN %table:SQB% SQB ON RA_DEPTO = QB_DEPTO AND SQB.%NotDel% AND %exp:cFilSRASQB%
	WHERE SRA.RA_SITFOLH	IN	(%exp:Upper(cSitQuery)%) 	AND
		  SRA.RA_CATFUNC	IN	(%exp:Upper(cCatQuery)%)	AND
	      %exp:cQryProcesso% AND 
 	      SRA.%notDel%   
	ORDER BY %exp:cOrdem%
EndSql

END REPORT QUERY oSection PARAM mv_par04,mv_par05,mv_par06,mv_par07,mv_par08,mv_par09

DEFINE BREAK oBreakFil OF oSection WHEN {|| (cAliasQry)->RA_FILIAL }  TITLE OemToansi("Relatorio de Divergencias") 
oBreakFil:SetPageBreak(.T.)
oBreakFil:SetHeaderBreak(.T.) 

DEFINE BREAK oBreakFun OF oSection WHEN {|| (cAliasQry)->RA_MAT }  TITLE OemToansi("Relatorio de Divergencias") 
oBreakFun:SetHeaderBreak(.T.) 

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Quebra de pagina C.Custo                                     ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If (nOrdem = 2 .or. nOrdem = 5) 
	DEFINE BREAK oBreakCc OF oSection WHEN {|| (cAliasQry)->RA_CC } TITLE OemToansi("Relatorio de Divergencias") 
	If lCC 
		oBreakCc:SetPageBreak(.T.) 
	Endif 
ElseIf (nOrdem = 4) 
	DEFINE BREAK oBreakCc OF oSection WHEN {|| (cAliasQry)->RA_TNOTRAB } TITLE OemToansi("Relatorio de Divergencias") 
	If lCC 
		oBreakCc:SetPageBreak(.T.) 
	Endif 
Endif 
oSection:SetHeaderSection(.T.)
oSection:SetHeaderBreak(.T.) 

oSection:lHeaderPage:=.F. 
oSection1:lHeaderPage:=.F. 

oReport:OnPageBreak( {|| oReport:lOnPageBreak:= .F.,;
							If(oSection1:lPrinting,;
							(oSection:PrintLine(),	oReport:SkipLine());
							,);
					 },.F. )

//-- Carrega C¢digos de Hora Extra N„o Autorizada
cKey  := ''
aHENA := {}
If SP4->(dbSeek(fFilFunc('SP4') + Space(Len((cAliasQry)->RA_TNOTRAB)), .F.)) .Or. ;
	SP4->(dbSeek(fFilFunc('SP4') + (cAliasQry)->RA_TNOTRAB, .F.)) .Or. ;
	SP4->(dbSeek(Space(Len((cAliasQry)->RA_FILIAL)) + (cAliasQry)->RA_TNOTRAB, .F.)) .Or. ;
	SP4->(dbSeek(Space(Len((cAliasQry)->RA_FILIAL)) + Space(Len((cAliasQry)->RA_TNOTRAB)), .F.))
	cKey := SP4->P4_FILIAL + SP4->P4_TURNO
	While !SP4->(Eof()) .And. SP4->P4_FILIAL + SP4->P4_TURNO == cKey
		If Len(aHena) == 0 .Or. aScan(aHENA, SP4->P4_CODNAUT) == 0
			aAdd(aHENA, SP4->P4_CODNAUT)
		EndIf	
		SP4->(dbSkip())
	EndDo								
EndIf

cFilAnte	:= (cAliasQry)->RA_FILIAL
cTnoAnt		:= (cAliasQry)->RA_TNOTRAB
nTolInt 	:= __Min2Hrs( ( SuperGetMv("MV_DIVTINT",NIL,0, (cAliasQry)->RA_FILIAL) ) )   //-- Minutos para Tolerancia de Intervalo

GetPonMesDat( @dIniPonMes , @dFimPonMes , cFilAnte)
lImpAcum := dPerIni < dIniPonMes 

//-- Define o total da regua da tela de processamento do relatorio
oReport:SetMeter( 100 )  
                                                 
//-- Incializa impressao   
oSection:Init(.F.)                              

While !(cAliasQry)->( EOF() ) 

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Movimenta Regua de Processamento                             ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	oReport:IncMeter( 1 )   

	//-- Verifica se o usuário cancelou a impressão do relatorio
	If oReport:Cancel()
		Exit
	EndIf               

	/*
	ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	³Posiciona o registro da query na tabela de Funcionarios                ³
	ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ*/
	If !SRA->(dbSeek( (cAliasQry)->RA_FILIAL + (cAliasQry)->RA_MAT ))
		(cAliasQry)->(DbSkip())
	   	Loop
	Endif

	//-- Processa quebra de Filial.
	If (cAliasQry)->RA_FILIAL != cFilAnte 
	    //--Somente "Zera" as variaveis se jah foi impresso algo para nao pula 
	    //--de pagina na primeira vez

		cFilAnte := (cAliasQry)->RA_FILIAL
   		cTnoAnt := (cAliasQry)->RA_TNOTRAB
		nTolInt := __Min2Hrs( ( SuperGetMv("MV_DIVTINT",NIL,0, (cAliasQry)->RA_FILIAL) ) )   //-- Minutos para Tolerancia de Intervalo
		GetPonMesDat( @dIniPonMes , @dFimPonMes , cFilAnte)
        lImpAcum := dPerIni < dIniPonMes
		
		//-- Carrega C¢digos de Hora Extra N„o Autorizada (Filial)
		cKey  := ''
		If SP4->(dbSeek(fFilFunc('SP4') + Space(Len((cAliasQry)->RA_TNOTRAB)), .F.)) .Or. ;
			SP4->(dbSeek(fFilFunc('SP4') + (cAliasQry)->RA_TNOTRAB, .F.)) .Or. ;
			SP4->(dbSeek(Space(Len((cAliasQry)->RA_FILIAL)) + (cAliasQry)->RA_TNOTRAB, .F.)) .Or. ;
			SP4->(dbSeek(Space(Len((cAliasQry)->RA_FILIAL)) + Space(Len((cAliasQry)->RA_TNOTRAB)), .F.))
			cKey := SP4->P4_FILIAL + SP4->P4_TURNO
			While !SP4->(Eof()) .And. SP4->P4_FILIAL + SP4->P4_TURNO == cKey
				If Len(aHena) == 0 .Or. aScan(aHENA, SP4->P4_CODNAUT) == 0
					aAdd(aHENA, SP4->P4_CODNAUT)
				EndIf	
				SP4->(dbSkip())
			EndDo								
		EndIf
	Endif

	If cFilAnte + cTnoAnt <> (cAliasQry)->RA_FILIAL +(cAliasQry)->RA_TNOTRAB
		cFilAnte	:= (cAliasQry)->RA_FILIAL
		cTnoAnt		:= (cAliasQry)->RA_TNOTRAB
        GetPonMesDat( @dIniPonMes , @dFimPonMes , cFilAnte)
        lImpAcum := dPerIni < dIniPonMes

		//-- Carrega C¢digos de Hora Extra N„o Autorizada (Turno)
		cKey  := ''
		If SP4->(dbSeek(fFilFunc('SP4') + Space(Len((cAliasQry)->RA_TNOTRAB)), .F.)) .Or. ;
			SP4->(dbSeek(fFilFunc('SP4') + (cAliasQry)->RA_TNOTRAB, .F.)) .Or. ;
			SP4->(dbSeek(Space(Len((cAliasQry)->RA_FILIAL)) + (cAliasQry)->RA_TNOTRAB, .F.)) .Or. ;
			SP4->(dbSeek(Space(Len((cAliasQry)->RA_FILIAL)) + Space(Len((cAliasQry)->RA_TNOTRAB)), .F.))
			cKey := SP4->P4_FILIAL + SP4->P4_TURNO
			While !SP4->(Eof()) .And. SP4->P4_FILIAL + SP4->P4_TURNO == cKey
				If Len(aHena) == 0 .Or. aScan(aHENA, SP4->P4_CODNAUT) == 0
					aAdd(aHENA, SP4->P4_CODNAUT)
				EndIf	
				SP4->(dbSkip())
			EndDo								
		EndIf
	Endif

	/*
	ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	³Consiste Filiais e Acessos                                             ³
	ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ*/
	IF !( (cAliasQry)->RA_FILIAL $ fValidFil() ) .or. !Eval( cAcessaSRA )
		(cAliasQry)->(DbSkip())
	   	Loop
	EndIF

	//-- Reinicializa Variaveis do Funcionario
	aTabCalend	:= {} 
	aTurnos		:= {}
	aMarcacoes	:= {}
    
    c_Alias := If(lImpAcum,"SPG","SP8")
	//-- Carrega as Marcacoes do Periodo
	IF !GetMarcacoes( @aMarcacoes		,;	//Marcacoes dos Funcionarios
					  @aTabCalend		,;	//Calendario de Marcacoes
					  @aTabPadrao		,;	//Tabela Padrao
					  @aTurnos			,;	//Turnos de Trabalho
					  dPerIni 			,;	//Periodo Inicial
					  dPerFim			,;	//Periodo Final
					  (cAliasQry)->RA_FILIAL	,;	//Filial
					  (cAliasQry)->RA_MAT		,;	//Matricula
					  (cAliasQry)->RA_TNOTRAB	,;	//Turno
					  (cAliasQry)->RA_SEQTURN	,;	//Sequencia de Turno
					  (cAliasQry)->RA_CC		,;	//Centro de Custo
					  c_Alias			,;	//Alias para Carga das Marcacoes
					  .F.    			,;	//Se carrega Recno em aMarcacoes
					  .T.      			,;	//Se considera Apenas Ordenadas
				      .T. 				,;	//Se Verifica as Folgas Automaticas
				  	  .F.    			,;	//Se Grava Evento de Folga Automatica Periodo Anterior
  				  	  NIL				,;
					  NIL				,;
					  NIL				,;
					  .F.				,;
					  NIL				,;
					  .T.				,;  //Se considera data de apontamento
					  .T.				;	//Se considera data inicial				  	  
					)
		(cAliasQry)->(dbSkip())
		Loop
    EndIF

	aNewMarc := {}
	nLenMarc := Len( aMarcacoes )
	For nX := 1 To nLenMarc
		If ( cOrdem := aMarcacoes[ nX , 03 ] ) == "ZZ"
			Loop
		EndIf	
		dDataApo := aMarcacoes[ nX , 25 ] // AMARC_DATAAPO
		aAdd( aNewMarc , {} )
		For nY := nX To nLenMarc
			If aMarcacoes[ nY , 25 ] == dDataApo .and. aMarcacoes[ nY , 03 ] != "ZZ" 
				aAdd( aNewMarc[Len(aNewMarc)] , aClone( aMarcacoes[ nY ] ) )
				aMarcacoes[ nY , 03 ] := "ZZ"
			Else
				Exit
			EndIf
		Next nY
	Next nX

	aMarcacoes := aClone( aNewMarc )
	
	//-- Monta o Array aImp com as ocorrˆncias do per¡odo
	aImp := {}
	nLenMarc   := Len(aMarcacoes)
	nLenCalend := Len(aTabCalend)
    dDtDiaAnt  := ctod("//") 
    nHrDiaAnt  := 0
	
	For nX := 1 to nLenMarc
		dData    := aMarcacoes[nX, 1, 1]
		dDataApo := aMarcacoes[nX, 1, 25] // AMARC_DATAAPO
	    
	    //-- Limita as Marcacoes ao Periodo Solicitado
	    dDataOk := If( ( nPos1E := aScan(aTabCalend, { |x| x[48] == dDataApo .And. x[4] == '1E' }) ) > 0, aTabCalend[nPos1E,1], dData)
	    If Abs(dData - dDataOk) > 2  .OR. ;
	       (Abs(dData - dDataOk) <= 2 .And. dDataOk < dPerIni) .Or. ;
		   (Abs(dData - dDataOk) <= 2 .And. dDataOk > dPerFim)
	       Loop
		EndIf	
		
	  	//--Se Existe Calendario para a Ordem Obtem Numero de Marcacoes Possiveis
	    If nPos1E > 0  
			//-- Calcula a Quantidade de Marcacoes possiveis de acordo com o 
			//--Calendario do Funcionario
	        nTabMarc := 0
	        For nPosOrdem := nPos1E to nLenCalend
	           If aTabCalend[nPosOrdem,48] <> dDataApo
	              Exit
	           Endif
	           nTabMarc++
	        Next nPosOrdem
	    Endif
	    
		//-- Procura por Excecoes na Data
		cTraba := ''
		nQuant := 0
		aIntervalo := {}
		lCompSab   := .F.

		If nPos1E > 0
			cTraba := aTabCalend[nPos1E, 6]
		  	//-- Corre Todas as Marcacoes realizadas de acordo com a DataApo
			For nW := nPos1E to nLenCalend
				If aTabCalend[nW,48] <> dDataApo
              		Exit
           		Endif
				nQuant ++                                                
				//-- Se segundo a Tabela Padrao Existir Intervalo
				//-- Armazena-o para posterior verificacao
				If aTabCalend[nW,9] > 0
				   aAdd(aIntervalo, { aTabCalend[nW,9],aTabCalend[nW,4] })
				Endif
				
				// Sabado Compensado
				If aTabCalend[nW, 6] == "C" 
				   lCompSab := .T.
				EndIf  
			Next nW
		EndIf

		//-- Reinicializa Variaveis
		dDtAfas  := CtoD('  /  /  ')
		dDtRet   := CtoD('  /  /  ')
		cTipAfas := ''
		aMotivo  := {}

		If nPos1E == 0
			aAdd(aMotivo, "** Nao existe Calendario" ) // '** Nao existe Calendario           '
		EndIf	

        If Len(aMarcacoes) > 0 
           //-- Localiza o numero da posicao da marcacao pela sigla.
	       _nX := 1 // Ascan(aSiglaMarc, { |x| x == aIntervalo[nW,2] }) 
           nHrTrab := 0
           While _nX <= len(aMarcacoes[nX])
              If _nX + 1 <= Len(aMarcacoes[nX])       
		         nHorReal  := 0
		         CalcHours(  aMarcacoes[nX, _nX + 1, 1],;	//01 -> Data 1
							 aMarcacoes[nX, _nX + 1, 2],;	//02 -> Hora 1
							 aMarcacoes[nX, _nX    , 1],;	//03 -> Data 2
							 aMarcacoes[nX, _nX    , 2],;	//04 -> Hora 2
							 @nHorReal			,;	//05 -> <@>Horas Normais Apontadas
							 NIL				,;	//06 -> <@>Horas Noturnas Apontadas
							 .F.				 )	//07 -> Apontar Horas Noturnas
				nHrTrab := SomaHoras(nHrTrab, nHorReal)
				// Mais de 6 horas sem intervalo
				If l6Inter .and. nHorReal > 6 // Mais de 6 horas sem intervalo
		           aAdd(aMotivo, "** Mais de 6 horas sem intervalo" ) // '** Mais de 10 horas trabalhadas'
				EndIf
              EndIf
              _nX += 2 
           EndDo     
	       
	       // Mais de 10 horas trabalhadas
	       If l10Trab .and. nHrTrab > 10 // Mais de 10 horas trabalhadas
	           cHrSabCom := STRTRAN(Transform(nHrTrab ,'99.99'),'.',':') // StrTran(Alltrim(Str(nHrTrab)),".",":")
			  aAdd(aMotivo, "** Mais de 10 horas trabalhadas. Total de Horas Trabalhadas: " + cHrSabCom ) // '** Mais de 10 horas trabalhadas'
	       EndIf

	        // Jornada de 8:48, sábado compensado
	        If lSabComp .and. nHrTrab > 0 .and. lCompSab // Jornada de 8:48, sábado compensado
	           cHrSabCom := STRTRAN(Transform(nHrTrab ,'99.99'),'.',':') // StrTran(Alltrim(Str(nHrTrab)),".",":")
			   aAdd(aMotivo, "** Jornada de " + cHrSabCom + " sábado compensado" ) // '** Mais de 10 horas trabalhadas'
	        EndIf
	        
           // Interjornada, 11 horas de descanso entre um dia e outro    
	       If lInterJ  // Interjornada, 11 horas de descanso entre um dia e outro
	          nHrInter  := 0
	          If !Empty(dDtDiaAnt) 
			        CalcHours(aMarcacoes[nX, Len(aMarcacoes[nX]), 1],;	//01 -> Data 1
							  aMarcacoes[nX, Len(aMarcacoes[nX]), 2],;	//02 -> Hora 1
							  dDtDiaAnt,;	//03 -> Data 2
							  nHrDiaAnt,;	//04 -> Hora 2
							  @nHrInter,;	//05 -> <@>Horas Normais Apontadas
							  NIL	   ,;	//06 -> <@>Horas Noturnas Apontadas
							  .F.		 )	//07 -> Apontar Horas Noturnas
	          EndIf
	           
	          If nHrInter > 0 .and. nHrInter <= 11 
			     aAdd(aMotivo, "** Interjornada, 11 horas de descanso entre um dia e outro" ) // '** Mais de 10 horas trabalhadas'
	          EndIf
	           
	          If Len(aMarcacoes[nX]) > 0
	             dDtDiaAnt := aMarcacoes[nX, Len(aMarcacoes[nX]), 1]  
	             nHrDiaAnt := aMarcacoes[nX, Len(aMarcacoes[nX]), 2]
	          EndIf
	       EndIf 
        EndIf

		//-- MSG n£mero de Marca‡”es
		If lNMarc						
			//-- Marca‡”es Impares
			If Len(aMarcacoes[nX])%2 > 0
				aAdd(aMotivo, "** Numero de Marcacoes Impar" ) // '** Numero de Marcacoes Impar       '
			EndIf

			//-- Menos ou Mais marca‡”es que o programado
			If Len(aMarcacoes[nX]) < nQuant
				aAdd(aMotivo, "** Menos Marcacoes que o Programado" ) // '** Menos Marcacoes que o Programado'
			ElseIf Len(aMarcacoes[nX]) > nQuant .And. nQuant > 0
				aAdd(aMotivo, "** Mais Marcacoes que o Programado" ) // '** Mais Marcacoes que o Programado '
			EndIf	
		EndIf

		//-- MSG Hora Extra n„o autorizada
		If lHExtr .And. Len(aHENA) > 0
			For nY := 1 to Len(aHENA)
				If SPC->(dbSeek(fFilFunc('SPC')+(cAliasQry)->RA_MAT + aHENA[nY] + DtoS(dData), .F.))
					aAdd(aMotivo, "** Hora Extra Nao Autorizada" ) // '** Hora Extra Nao Autorizada       '
					Exit
				EndIf
			Next nY
		EndIf

		//-- MSG Intervalo ou Intervalo menor que 01:00 
		If lInter .or. l1IntMe
			//-- Intervalo Menor ou Maior que o Programado
			nW := 0
			For nW := 1 To Len(aIntervalo)
				nIntReal := 0
				nIntProg := 0 
				nHrReal	 := 0
				//-- Obtem o numero de horas/minutos de intervalo

				//-- Localiza o numero da posicao da marcacao pela sigla.
				nPosInt := Ascan(aSiglaMarc, { |x| x == aIntervalo[nW,2] })
	
				lIntMaior := lIntMenor := lIntMe1h := .F.		 				
 				If nPosInt + 1 <= Len(aMarcacoes[nX])

					If  Empty(nTolInt)
						nIntReal  := fDHtoNS(aMarcacoes[nX, nPosInt + 1, 1], aMarcacoes[nX, nPosInt + 1, 2]) - fDHtoNS(aMarcacoes[nX, nPosInt, 1], aMarcacoes[nX, nPosInt, 2])
						nIntProg  := fDhToNs(,aIntervalo[nW,1])
						lIntMenor := (nIntReal) < (nIntProg)  
						lIntMaior := (nIntReal) > (nIntProg)
						lIntMe1h  := (nIntReal) < 1  
                    Else 
                    	CalcHours(  aMarcacoes[nX, nPosInt+1, 1],;	//01 -> Data 1
									aMarcacoes[nX, nPosInt+1, 2],;	//02 -> Hora 1
									aMarcacoes[nX, nPosInt, 1]	,;	//03 -> Data 2
									aMarcacoes[nX, nPosInt, 2]	,;	//04 -> Hora 2
									@nHrReal					,;	//05 -> <@>Horas Normais Apontadas
									NIL							,;	//06 -> <@>Horas Noturnas Apontadas
									.F.							;	//07 -> Apontar Horas Noturnas
								 )  
						If nHrReal > SomaHoras(aIntervalo[nW,1],nTolInt)
							lIntMaior:=.T.
						ElseIf aIntervalo[nW,1] > SomaHoras(nHrReal,nTolInt)
	 						lIntMenor:=.T.
						EndIf
						
						// Intervalo é menor que 01:00 Hr
						If aIntervalo[nW,1] < 1
						   lIntMe1h := .T.
						EndIf							 
					Endif
				Endif

				If lIntMenor .and. lInter
				   	aAdd(aMotivo, '** '+Trim(Str(nW,2))+'o.'+ "Intervalo Menor que o Programado") // ' Intervalo Menor que o Programado'
				ElseIf lIntMaior .and. lInter
					aAdd(aMotivo, '** '+Trim(Str(nW,2))+'o.'+ "Intervalo Maior que o Programado") // ' Intervalo Maior que o Programado'
				EndIf
				// Intervalo Menor que 01:00 hr
				If (nIntReal)
					aAdd(aMotivo, '** '+Trim(Str(nW,2))+'o.'+ "Menos de uma hora de intervalo") // 'Menos de uma hora de intervalo'
				EndIf
			Next nW
		EndIf

		//-- MSG Situa‡„o do Funcion rio
		If lSitFu
			//-- Marca‡”es Anteriores a Admiss„o ou Posteriores a Demiss„o
			If !Empty(fDtaAdmis()) .And. dData < fDtaAdmis()
				aAdd(aMotivo, "** Marcacoes antes da Admisssao" ) // '** Marcacoes antes da Admisssao    '
			ElseIf !Empty((cAliasQry)->RA_DEMISSA) .And. dData > (cAliasQry)->RA_DEMISSA
				aAdd(aMotivo, "** Marcacoes apos Demissao" ) // '** Marcacoes apos Demissao         '
			EndIf

			//-- Marca‡”es durante Ferias ou Afastamentos
			If fAfasta( (cAliasQry)->RA_FILIAL,(cAliasQry)->RA_Mat,dData,@dDtafas,@dDtRet,@cTipAfas) .And. aTabCalend[nPos1E,10] # 'E'
				If cTipAfas == 'F'
					aAdd(aMotivo, "** Marcacoes durante as Ferias" ) // '** Marcacoes durante as Ferias     '
				Else
					aAdd(aMotivo, "** Marcacoes durante Afastamento" ) // '** Marcacoes durante Afastamento   '
				EndIf
			EndIf		
		EndIf

		// cProc := aMarcacoes[nX , 01 , AMARC_PROCESSO ]
		// cPer  := aMarcacoes[nX , 01 , AMARC_PERIODO  ]
		// cRot  := aMarcacoes[nX , 01 , AMARC_ROTEIRO  ]
		// cNPag := aMarcacoes[nX , 01 , AMARC_NUM_PAGTO]

		If Len(aMotivo) > 0
			cDet := ""
			For nZ := 1 to Len(aMarcacoes[nX])
				cDet += StrZero(aMarcacoes[nX, nZ, 2], 5, 2) + Space(1)
			Next nZ
			cDet := Left(cDet,80)
			// aAdd(aImp, { Subs(Dtos(dData),7,2)+'/' + Subs(Dtos(dData),5,2), cDet, "",cProc, cPer, cRot, cNPag } )
			aAdd(aImp, { Subs(Dtos(dData),7,2)+'/' + Subs(Dtos(dData),5,2), cDet, ""} )
			For nZ := 1 to Len(aMotivo)
				If nZ == 1
					aImp[Len(aImp),3] += aMotivo[nZ]
				Else	
					// aAdd(aImp, { Space(1), Space(1), aMotivo[nZ], Space(1), Space(1), Space(1), Space(1) })
					aAdd(aImp, { Space(1), Space(1), aMotivo[nZ] })
				EndIf
			Next nZ

		EndIf
	Next nX

	// Verifica se não carregou as marcações e salta para o proximo funcionario
	If Len(aImp) == 0
		(cAliasQry)->(DbSkip())
		Loop
	Endif

	oSection:PrintLine()
	oReport:SkipLine()
	oSection1:Init(.F.) 
	oSection1:PrintHeader() 
	
	For nX := 1 to Len( aImp )

		//-- Altera valores da Section
		oSection1:Cell( "DATA"       ):SetValue(aImp[nX,1])
		oSection1:Cell( "MARCACOES"  ):SetValue(aImp[nX,2])
		oSection1:Cell( "OCORRENCIAS"):SetValue(aImp[nX,3])
		// oSection1:Cell( "PROCESSO"   ):SetValue(aImp[nX,4])
		// oSection1:Cell( "PERIODO"    ):SetValue(aImp[nX,5])
		// oSection1:Cell( "ROTEIRO"    ):SetValue(aImp[nX,6])
		// oSection1:Cell( "NUMPAGTO"   ):SetValue(aImp[nX,7])

		//-- Imprime os conteudos da Section
	   	oSection1:PrintLine()
	Next
	oSection1:Finish()
	oReport:ThinLine()
	oReport:SkipLine()		
	(cAliasQry)->(DbSkip())
EndDo

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Termino do Relatorio                                         ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Finaliza impressao inicializada pelo metodo Init             ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oSection:Finish()

If Select(cAliasQry) > 0
	(cAliasQry)->(dbCloseArea())
Endif

Return

/*/
ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿
³Fun‡…o	   ³Pnr040Proc	 	³Autor³  Leandro Drumond  ³ Data ³18/04/2008³
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´
³Descri‡…o ³Transferir o parametro MV_PAR01 para variavel private		³
|		   |cProcesso    											    |
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³Sintaxe   ³<Vide Parametros Formais>									³
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³Parametros³<Vide Parametros Formais>									³
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³Retorno   ³NIL                      									³
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³Uso	   ³Generica      										    	³
ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ/*/
User Function Pnr040Proc(cTip)
Local lRet := .T.

cProcesso := &( ReadVar() )

If ( cTip == 'A' )
	lRet := PonX1Valid(cProcesso)
Else
	If !Empty(cProcesso)
		lRet := PonX1Valid(cProcesso)
	EndIf
EndIf

Return( lRet )

/*/
ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿
³Fun‡…o	   ³Pnr040Per	 	³Autor³  Leandro Drumond  ³ Data ³18/04/2008³
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´
³Descri‡…o ³Transferir o parametro MV_PAR02 para variavel private		³
|		   |cPeriodo    											    |
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³Sintaxe   ³<Vide Parametros Formais>									³
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³Parametros³<Vide Parametros Formais>									³
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³Retorno   ³NIL                      									³
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³Uso	   ³Generica      										    	³
ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ/*/
User Function Pnr040Per()
Local cChave := cProcesso
Local lRet := .T.

If !Empty(cRoteiro)
	cChave += cRoteiro
Else
	cChave += "PON"
EndIf

cPeriodo := &( ReadVar() )

cChave += cPeriodo

lRet := PonX1Valid(cChave)

Return( lRet )

/*/
ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿
³Fun‡…o	   ³Pnr040Rot	 	³Autor³  Leandro Drumond  ³ Data ³18/04/2008³
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´
³Descri‡…o ³Transferir o parametro MV_PAR03 para variavel private		³
|		   |cRoteiro    											    |
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³Sintaxe   ³<Vide Parametros Formais>									³
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³Parametros³<Vide Parametros Formais>									³
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³Retorno   ³NIL                      									³
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³Uso	   ³Generica      										    	³
ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ/*/
User Function Pnr040Rot()
Local lRet := .T.

cRoteiro := &( ReadVar() )

lRet := PonX1Valid(cProcesso+cRoteiro)

Return( lRet )

/*/
ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿
³Fun‡…o	   ³Pnr040NPag	 	³Autor³  Leandro Drumond  ³ Data ³18/04/2008³
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´
³Descri‡…o ³Transferir o parametro MV_PAR04 para variavel private		³
|		   |cNumPag	    											    |
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³Sintaxe   ³<Vide Parametros Formais>									³
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³Parametros³<Vide Parametros Formais>									³
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³Retorno   ³NIL                      									³
ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³Uso	   ³Generica      										    	³
ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ/*/
User Function Pnr040NPag()
Local lRet := .T.

cNumPagto := &( ReadVar() )

lRet := PonX1Valid(cProcesso+cRoteiro+cPeriodo+cNumPagto)

Return( lRet )


// Criar asperguntas dos relatórios
User Function _CRIASX1(_aGrpSx1)
// O array _aGrpSx1 é enviado na chamada da função
Local _I := 0
	FOR _I := 1 TO LEN(_aGrpSx1)                                                                                
		IF !SX1->(DBSEEK(_aGrpSx1[_I,1]+_aGrpSx1[_I,2]))
			SX1->(RECLOCK("SX1",.T.))
			SX1->X1_GRUPO  :=_aGrpSx1[_I,01]
			SX1->X1_ORDEM  :=_aGrpSx1[_I,02]
			SX1->X1_PERGUNT:=_aGrpSx1[_I,03]
			SX1->X1_PERSPA :=_aGrpSx1[_I,03]
			SX1->X1_PERENG :=_aGrpSx1[_I,03]
			SX1->X1_VARIAVL:=_aGrpSx1[_I,04]
			SX1->X1_TIPO   :=_aGrpSx1[_I,05]
			SX1->X1_TAMANHO:=_aGrpSx1[_I,06]
			SX1->X1_DECIMAL:=_aGrpSx1[_I,07]
			SX1->X1_PRESEL :=_aGrpSx1[_I,08]
			SX1->X1_GSC    :=_aGrpSx1[_I,09]
			SX1->X1_VALID  :=_aGrpSx1[_I,10]
			SX1->X1_VAR01  :=_aGrpSx1[_I,11]
			SX1->X1_DEF01  :=_aGrpSx1[_I,12]
			SX1->X1_CNT01  :=_aGrpSx1[_I,13]
			SX1->X1_VAR02  :=_aGrpSx1[_I,14]
			SX1->X1_DEF02  :=_aGrpSx1[_I,15]
			SX1->X1_CNT02  :=_aGrpSx1[_I,16]
			SX1->X1_VAR03  :=_aGrpSx1[_I,17]
			SX1->X1_DEF03  :=_aGrpSx1[_I,18]
			SX1->X1_CNT03  :=_aGrpSx1[_I,19]
			SX1->X1_VAR04  :=_aGrpSx1[_I,20]
			SX1->X1_DEF04  :=_aGrpSx1[_I,21]
			SX1->X1_CNT04  :=_aGrpSx1[_I,22]
			SX1->X1_VAR05  :=_aGrpSx1[_I,23]
			SX1->X1_DEF05  :=_aGrpSx1[_I,24]
			SX1->X1_CNT05  :=_aGrpSx1[_I,25]
			SX1->X1_F3     :=_aGrpSx1[_I,26]
			SX1->X1_GRPSXG :=_aGrpSx1[_I,27]
		Endif
		SX1->(MSUNLOCK())
	Next
RETURN NIL

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡„o    ³fDtaAdmis   ³ Autor ³ Leandro Drumond     ³ Data ³ 10/06/08 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡„o ³ Instancia data de admissao ou readmissao do funcionario    ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Generico                                                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±*/
Static Function fDtaAdmis()

Local dDataAdmis := CtoD('')

If cPaisLoc == "MEX"
	If !Empty(SRA->RA_FECREI)
		dDataAdmis := SRA->RA_FECREI
	Else
		dDataAdmis := SRA->RA_ADMISSA
	EndIf
Else
	dDataAdmis := SRA->RA_ADMISSA
EndIf

Return ( dDataAdmis )
