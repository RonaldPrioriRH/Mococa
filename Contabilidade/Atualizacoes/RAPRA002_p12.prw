#INCLUDE "protheus.ch"
#INCLUDE "rwmake.ch"
#INCLUDE "topconn.ch"

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ RAPRA002    ¦ Autor ¦ Totvs            ¦ Data ¦ 02/04/2014 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Rotina de Contabilizaçao - Despesas a Apropriar	      		¦¦¦
¦¦¦          ¦ Controle de Apropriação de Parcelas                        ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function RAPRA002()

Private oDlg08

//variaveis dos parametros
Private cPerg     := "RAPRA002"
Private lLancCtb  := .F.
Private lAglutina := .F.
Private dDtRef    := ctod("")
Private dDtInici  := ctod("")
Private dDtFinal  := ctod("")
Private cDesDe    := space(6)
Private cDesAte   := space(6)
Private cLote     := space(6) //"000120"
Private nSepPor   := 0
Private cFilDe    := space(TamSX3("E1_FILIAL")[1])
Private cFilAte   := space(TamSX3("E1_FILIAL")[1])

AjustaSX1()
//Pergunte(cPerg,.T.) //chama perguntas antes da tela explicativa

//Montando Dialog para parametrização
@ 200,1 TO 420,410 DIALOG oDlg08 TITLE OemToAnsi("Contabilização - Aprop. de Despesas")
@ 10,10 TO 080,197
@ 20,018 Say " Este programa tem o objetivo de efetuar contabilização dos movimentos "
@ 28,018 Say " das apropriação de despesas. Utilize os parâmetros para preparar "
@ 36,018 Say " as configurações do processamento."

@ 90,108 BMPBUTTON TYPE 05 ACTION Pergunte(cPerg,.T.)
@ 90,138 BMPBUTTON TYPE 01 ACTION OkVldParam()
@ 90,168 BMPBUTTON TYPE 02 ACTION Close(oDlg08)

Activate Dialog oDlg08 Centered

Return

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ OkVldParam    ¦ Autor ¦ Totvs          ¦ Data ¦ 02/04/2014 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Validaçao para o Processamento da rotina de Contabilização ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
Static Function OkVldParam()
Local lRet := .T.

Pergunte(cPerg,.F.) //força criar parametros pelo grupo de perguntas

//setando valores dos parametros
dDtRef    := MV_PAR01
cDesDe    := MV_PAR02
cDesAte   := MV_PAR03
cLote     := MV_PAR04
lLancCtb  := iif(MV_PAR05==1,.T.,.F.) //1=Sim
lAglutina := iif(MV_PAR06==1,.T.,.F.) //1=Sim
nSepPor   := MV_PAR07
cFilDe    := MV_PAR08
cFilAte   := MV_PAR09

//Fazendo validações
if empty(dtos(dDtRef))
	MSGInfo("A data de referencia de ser preenchida.","Atenção!")
	lRet := .F.
else
	dDtInici := FirstDate(dDtRef)
	dDtFinal := LastDate(dDtRef)
endif

if lRet
	Processa({|| lRet := DoCtbAprop() },"Processando...")
	iif(lRet, Close(oDlg08),)//fecha dlg
endif

Return lRet

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ DoCtbAprop    ¦ Autor ¦ Totvs          ¦ Data ¦ 02/04/2014 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Faz o Processamento da rotina de Contabilização			      ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                              ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
Static Function DoCtbAprop()
Local _cSQL     := ""
Local lRet      := .T.
Local nI
Local aFlagCTB  := {}
Local lLctPad20 := VerPadrao("120")
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica o numero do Lote 									                 ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Local cLoteCtb  := cLote
Local lUsaFlag  := GetNewPar("MV_CTBFLAG",.F.)
Local cPadrao   := "120"
Local c120
Local aCT5      := {}
Local cArquivo  := ""
Local dDataZC5  := ctod("")
Local nTotalCtb := 0
Local nHdlPrv   := 0
Local lHeader   := .F.
Local oldDatabase := dDataBase //Salva a DataBase
Local _aEmp     := SM0->( GetArea() )
Local _cOldE    := cEmpAnt
Local _cOldF    := cFilAnt
Local _nregsm0  := SM0->(recno())
Local aAreaPCO := {}
Private lDetProva := .T.

_cSQL := " SELECT *"
_cSQL += " FROM " + RetSqlName("ZC5") + " ZC5"
_cSQL += " WHERE ZC5_FILIAL BETWEEN '"+cFilDe+"' and '"+cFilAte+"'" // = '" + xFilial("ZC5") + "'"
_cSQL += " AND ZC5.D_E_L_E_T_ <> '*'" //nao deletados
_cSQL += " AND ZC5_LA != 'S'" //nao contabilizado
_cSQL += " AND ZC5_STATUS != 'N' " //somente despesas ativas
_cSQL += " AND ZC5_DTREF BETWEEN '"+Dtos(dDtInici)+"' and '"+Dtos(dDtFinal)+"'"
_cSQL += " AND ZC5_CODIGO BETWEEN '"+cDesDe+"' and '"+cDesAte+"'"
_cSQL += " ORDER BY ZC5_FILIAL, ZC5_CODIGO, ZC5_PARCEL, ZC5_DTREF"

_cSQL := ChangeQuery(_cSQL) //comando para evitar erros de incompatibilidade de bancos

if select("QRYZC5") > 0
	QRYZC5->(dbCloseArea())
endif

TcQuery _cSQL New Alias "QRYZC5" // Cria uma nova area com o resultado do query

TCSetField("QRYZC5","ZC5_DTREF","D")

QRYZC5->(DbGoTop())

if QRYZC5->(EOF())
	MSGInfo("Não foram encontrados contratos para o processamento.","Apropriação")
	lRet := .F.
endif

ProcRegua(QRYZC5->(RecCount()))

if lRet
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Define as chaves de relacionamento SIGACTB
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If lLctPad20
		c120 := CtRelation(cPadrao,.F.,{{"QRYZC5","ZC5"},{"QRYZC5","QRYZC5"},{"QRYZC5","RAPRA002"}})
	Endif
	
	While QRYZC5->(!EOF()) 
	cFilAnt := QRYZC5->ZC5_FILIAL
	
	//posiciones
	dbSelectArea("SM0")
	dbSeek(cEmpAnt+cFilAnt)
	
	if nSepPor == 2 //se por dia
		dDataZC5 := QRYZC5->ZC5_DTREF
	else //se por periodo
		dDataZC5 := dDtRef
	endif
	
	While QRYZC5->(!EOF()) .and. cFilAnt == QRYZC5->ZC5_FILIAL
		
		IncProc("Processando despesas " + QRYZC5->(ZC5_FILIAL+ZC5_CODIGO) + "...")
		
		//posiciones
		DbSelectArea("ZC5")
		ZC5->(DbSetOrder(1), DbGoTop(), DbSeek(QRYZC5->ZC5_FILIAL+QRYZC5->ZC5_CODIGO+QRYZC5->ZC5_PARCEL))
		
		if nSepPor == 2 .AND. dDataZC5 != ZC5->ZC5_DTREF //se por dia
			dDatabase := dDataZC5
			//RodaProva
			RodaProva(nHdlPrv,nTotalCtb)
			If nTotalCtb > 0
				nTotalCtb := 0
				cA100Incl(cArquivo,nHdlPrv,1,cLoteCtb,lLancCtb,lAglutina,,,,@aFlagCTB)
			EndIf
			nTotalCtb := 0
			lHeader   := .F.
		endif
		
		If lUsaFlag
			aAdd(aFlagCTB,{"ZC5_LA","S","ZC5",ZC5->(Recno()),0,0,0})
		EndIf
		
		//HeadProva
		If !lHeader
			nHdlPrv:=HeadProva(cLoteCtb,"RAPRA002",Substr(cUsuario,7,6),@cArquivo)
			
			If nHdlPrv <= 0
				HELP(" ",1,"SEM_LANC")
				lHeader := .F.
			Else
				lHeader := .T.
			EndIf
			
		EndIf
		
		If lHeader
			
			//DetProva
			lDetProva := .T.
			nParcCtb  := DetProva(nHdlPrv,cPadrao,"RAPRA002",cLoteCtb,,,,,@c120,@aCT5,,@aFlagCTB)
			
			If lDetProva .AND. !lUsaFlag //se nao usa flag,
				Reclock("ZC5", .F.) //reclock "ZC5" para LA = S
				ZC5->ZC5_LA := "S"
				ZC5->(MsUnlock())
			EndIf
			
			nTotalCtb += nParcCtb
			aAreaPCO := GetArea()
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Inicializa a gravacao dos lancamentos do SIGAPCO          ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			PcoIniLan("900007")
			PcoDetLan("900007","01",'RAPRA002')
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Finaliza a gravacao dos lancamentos do SIGAPCO e apaga lancamentos de bloqueio nao utilizados ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			PcoFinLan("900007")
			RestArea(aAreaPCO)				
		Endif
	
		if nSepPor == 2 //se por dia
			dDataZC5 := ZC5->ZC5_DTREF
		else //se por periodo
			dDataZC5 := dDtRef
		endif
		
		QRYZC5->(dbskip()) //proximo
	enddo
	
	if lHeader //RodaProva
		dDatabase := dDataZC5
		RodaProva(nHdlPrv,nTotalCtb)
		if nTotalCtb > 0
			nTotalCtb := 0
			cA100Incl(cArquivo,nHdlPrv,1,cLoteCtb,lLancCtb,lAglutina,,,,@aFlagCTB)
		endIf
	endif
	
	enddo
endif

if select("QRYZC5") > 0
	QRYZC5->(dbCloseArea())
endif

/*
if lRet
MsgInfo("Contabilização efetuada com sucesso!", "Sucesso!")
endif
*/

dDataBase := oldDatabase //Restaura a DataBase
//cEmpAnt   := _cOldE
cFilAnt   := _cOldF
SM0->( RestArea(_aEmp) )
//SM0->( dbgoto(_nregsm0) )
Return lRet

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ AjustaSX1   ¦ Autor ¦ Totvs            ¦ Data ¦ 02/04/2014 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Cria perguntas da rotina									  								¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                          ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
Static Function AjustaSX1()

Local aHelpPor	:= {}
Local aHelpEng	:= {}
Local aHelpSpa	:= {}

u_xPutSx1( cPerg, "01","Data Ref ?","¿Fecha Ref ?","Ref. Date ?","mv_ch1","D",10,0,0,"G","","","","",;
"mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
u_xPutSx1( cPerg, "02","Despesa de ?","Despesa de ?","Despesa de ?","mv_ch2","C",6,0,0,"G","","ZC5","","",;
"mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
u_xPutSx1( cPerg, "03","Despesa ate ?","Despesa ate ?","Despesa ate ?","mv_ch3","C",6,0,0,"G","","ZC5","","",;
"mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
u_xPutSx1( cPerg, "04","Lote","Lote","Lote","mv_ch4","C",6,0,0,"G","","","","",;
"mv_par04","","","","000120","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
u_xPutSx1( cPerg, "05","Mostra Lanç Contab ?","¿Muestra Asientos ?","Display Acc. Entry ?","mv_ch5","N",1,0,0,"C","","","","",;
"mv_par05","Sim","Si","Yes","Não","Não","No","No","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
u_xPutSx1( cPerg, "06","Aglut. Lancamentos ?","¿Agrupa Asientos ?","Group Entries ?","mv_ch6","N",1,0,0,"C","","","","",;
"mv_par06","Sim","Si","Yes","Não","Não","No","No","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
u_xPutSx1( cPerg, "07","Gera Lanc. Por ?","¿Genera Asiento Por ?","Generate Entry by ?","mv_ch7","N",1,0,0,"C","","","","",;
"mv_par07","Periodo","Periodo","Period","Periodo","Dia","Dia","Day","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor	:= {} 
aHelpEng	:= {}
aHelpSpa	:= {}
Aadd(aHelpPor,"Informe a filial inicial a processar ")
Aadd(aHelpEng,"Enter a initial branch to process ")
Aadd(aHelpSpa,"Informe la sucursal inicial a procesar ")
xPutSx1( cPerg, "08","Filial De  ?","®De Sucursal ?","From Branch ?","mv_ch8","C",TamSX3("E1_FILIAL")[1],0,0,"G","","SM0_01","","",;
"mv_par08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor	:= {} 
aHelpEng	:= {}
aHelpSpa	:= {}
Aadd(aHelpPor,"Informe a filial final a processar ")
Aadd(aHelpEng,"Enter a final branch to process ")
Aadd(aHelpSpa,"Informe la sucursal final a procesar ")
xPutSx1( cPerg, "09","Filial Ate ?","®A Sucursal  ?","To Branch   ?","mv_ch9","C",TamSX3("E1_FILIAL")[1],0,0,"G","","SM0_01","","",;
"mv_par09","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return      

Static Function xPutSx1(cGrupo,cOrdem,cPergunt,cPerSpa,cPerEng,cVar,;
	cTipo ,nTamanho,nDecimal,nPresel,cGSC,cValid,;
	cF3, cGrpSxg,cPyme,;
	cVar01,cDef01,cDefSpa1,cDefEng1,cCnt01,;
	cDef02,cDefSpa2,cDefEng2,;
	cDef03,cDefSpa3,cDefEng3,;
	cDef04,cDefSpa4,cDefEng4,;
	cDef05,cDefSpa5,cDefEng5,;
	aHelpPor,aHelpEng,aHelpSpa,cHelp)

LOCAL aArea := GetArea()
Local cKey
Local lPort := .f.
Local lSpa  := .f.
Local lIngl := .f. 

cKey  := "P." + AllTrim( cGrupo ) + AllTrim( cOrdem ) + "."

cPyme    := Iif( cPyme 		== Nil, " ", cPyme		)
cF3      := Iif( cF3 		== NIl, " ", cF3		)
cGrpSxg  := Iif( cGrpSxg	== Nil, " ", cGrpSxg	)
cCnt01   := Iif( cCnt01		== Nil, "" , cCnt01 	)
cHelp	 := Iif( cHelp		== Nil, "" , cHelp		)

dbSelectArea( "SX1" )
dbSetOrder( 1 )

// Ajusta o tamanho do grupo. Ajuste emergencial para valida?o dos fontes.
// RFC - 15/03/2007
cGrupo := PadR( cGrupo , Len( SX1->X1_GRUPO ) , " " )

If !( DbSeek( cGrupo + cOrdem ))

    cPergunt:= If(! "?" $ cPergunt .And. ! Empty(cPergunt),Alltrim(cPergunt)+" ?",cPergunt)
	cPerSpa	:= If(! "?" $ cPerSpa  .And. ! Empty(cPerSpa) ,Alltrim(cPerSpa) +" ?",cPerSpa)
	cPerEng	:= If(! "?" $ cPerEng  .And. ! Empty(cPerEng) ,Alltrim(cPerEng) +" ?",cPerEng)

	Reclock( "SX1" , .T. )

	Replace X1_GRUPO   With cGrupo
	Replace X1_ORDEM   With cOrdem
	Replace X1_PERGUNT With cPergunt
	Replace X1_PERSPA  With cPerSpa
	Replace X1_PERENG  With cPerEng
	Replace X1_VARIAVL With cVar
	Replace X1_TIPO    With cTipo
	Replace X1_TAMANHO With nTamanho
	Replace X1_DECIMAL With nDecimal
	Replace X1_PRESEL  With nPresel
	Replace X1_GSC     With cGSC
	Replace X1_VALID   With cValid

	Replace X1_VAR01   With cVar01

	Replace X1_F3      With cF3
	Replace X1_GRPSXG  With cGrpSxg

	If Fieldpos("X1_PYME") > 0
		If cPyme != Nil
			Replace X1_PYME With cPyme
		Endif
	Endif

	Replace X1_CNT01   With cCnt01
	If cGSC == "C"			// Mult Escolha
		Replace X1_DEF01   With cDef01
		Replace X1_DEFSPA1 With cDefSpa1
		Replace X1_DEFENG1 With cDefEng1

		Replace X1_DEF02   With cDef02
		Replace X1_DEFSPA2 With cDefSpa2
		Replace X1_DEFENG2 With cDefEng2

		Replace X1_DEF03   With cDef03
		Replace X1_DEFSPA3 With cDefSpa3
		Replace X1_DEFENG3 With cDefEng3

		Replace X1_DEF04   With cDef04
		Replace X1_DEFSPA4 With cDefSpa4
		Replace X1_DEFENG4 With cDefEng4

		Replace X1_DEF05   With cDef05
		Replace X1_DEFSPA5 With cDefSpa5
		Replace X1_DEFENG5 With cDefEng5
	Endif

	Replace X1_HELP  With cHelp

	PutSX1Help(cKey,aHelpPor,aHelpEng,aHelpSpa)

	MsUnlock()
Else

   lPort := ! "?" $ X1_PERGUNT .And. ! Empty(SX1->X1_PERGUNT)
   lSpa  := ! "?" $ X1_PERSPA  .And. ! Empty(SX1->X1_PERSPA)
   lIngl := ! "?" $ X1_PERENG  .And. ! Empty(SX1->X1_PERENG)

   If lPort .Or. lSpa .Or. lIngl
		RecLock("SX1",.F.)
		If lPort 
         SX1->X1_PERGUNT:= Alltrim(SX1->X1_PERGUNT)+" ?"
		EndIf
		If lSpa 
			SX1->X1_PERSPA := Alltrim(SX1->X1_PERSPA) +" ?"
		EndIf
		If lIngl
			SX1->X1_PERENG := Alltrim(SX1->X1_PERENG) +" ?"
		EndIf
		SX1->(MsUnLock())
	EndIf
Endif

RestArea( aArea )

Return

