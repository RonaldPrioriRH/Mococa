#include "protheus.ch"
#include "rwmake.ch"
#include "topconn.ch"

/*/{Protheus.doc} RCONE001
Provisionamento Contábil - Contratos
@author TOTVS
@since 12/05/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

/***********************/
User Function RCONE001()
/***********************/

Private oDlg12

//variaveis dos parametros
Private cPerg 		:= "RCONE001"
Private lLancCtb	:= .F.
Private lAglutina	:= .F.
Private dDtInici	:= CToD("")
Private dDtFinal	:= CToD("")

AjustaSX1()
 
//Montando Dialog para parametrização
@ 200,1 TO 420,410 DIALOG oDlg12 TITLE OemToAnsi("Contabilização - Provisionamento Contratos")
@ 10,10 TO 080,197
@ 20,018 Say " Este programa tem o objetivo de efetuar contabilização dos titulos "
@ 28,018 Say " provisionados. Utilize os parâmetros para preparar as configurações"
@ 36,018 Say " do processamento. "

@ 90,108 BMPBUTTON TYPE 05 ACTION Pergunte(cPerg,.T.)
@ 90,138 BMPBUTTON TYPE 01 ACTION OkVldParam()
@ 90,168 BMPBUTTON TYPE 02 ACTION Close(oDlg12)

Activate Dialog oDlg12 Centered 

Return 

/***************************/
Static Function OkVldParam()
/***************************/

Local lRet := .T.

Pergunte(cPerg,.F.) //Força criar parametros pelo grupo de perguntas

//Setando valores dos parametros 
lLancCtb	:= iif(MV_PAR01 == 1,.T.,.F.) //1=Sim
lAglutina	:= iif(MV_PAR02 == 1,.T.,.F.) //1=Sim

dDtInici	:= MV_PAR03
dDtFinal	:= MV_PAR04

//Fazendo validações
If Empty(DToS(dDtInici)) .Or. Empty(DToS(dDtFinal))
	MsgInfo("O intervalo de datas deve ser preenchido.","Atenção!")
	lRet := .F.
Endif

If lRet
	Processa({|| lRet := DoCtbProv() },"Processando...")
	IIF(lRet, Close(oDlg12),)//Fecha oDlg
Endif
	
Return lRet

/**************************/
Static Function DoCtbProv()
/**************************/

Local lRet			:= .T.                               

Local cQry			:= ""

//Local nI  
Local aFlagCTB		:= {}                          

Local lLctPad00		:= VerPadrao("150") //Contabilização Contratos >> Faturamento           
//Local lLctPad01		:= VerPadrao("151") //Contabilização Contratos >> Apuração          
Local cLoteCtb		:= LoteCont("FIN")
Local lUsaFlag		:= GetNewPar("MV_CTBFLAG",.F.)  
Local cPadrao 
Local c100  
Local aCT5			:= {}  
Local cArquivo		:= "" 

Local dDataZ13		:= CToD("")
Local cNumMov		:= ""  

Local nTotalCtb		:= 0 
Local nHdlPrv		:= 0  
Local lHeader		:= .F.
Local oldDatabase	:= dDataBase //Salva a DataBase 

Private lDetProva 	:= .T.  

cPadrao := "150" //Movimentação Faturamento 

If Select("QRYMOVFAT") > 0
	QRYMOVFAT->(DbCloseArea())
Endif     

cQry := " SELECT Z13.Z13_CODIGO, Z13.Z13_DATA, Z13.Z13_CONTRA, Z14.Z14_ITEM"
cQry += " FROM "+RetSqlName("Z13")+" Z13, "+RetSqlName("Z14")+" Z14"
cQry += " WHERE Z13.D_E_L_E_T_	<> '*'"
cQry += " AND Z14.D_E_L_E_T_	<> '*'"
cQry += " AND Z13.Z13_FILIAL	= '"+xFilial("Z13")+"'"
cQry += " AND Z14.Z14_FILIAL	= '"+xFilial("Z14")+"'"
cQry += " AND Z13.Z13_CODIGO	= Z14.Z14_CODIGO"
cQry += " AND Z13.Z13_DATA		BETWEEN '"+DToS(dDtInici)+"' AND '"+DToS(dDtFinal)+"'"
//cQry += " AND Z14.Z14_APLICA	= 'F'" //Aplicação do tipo Faturamento
cQry += " AND Z14.Z14_LA		<> 'S'" //Não contabilizado
cQry += " ORDER BY 1"

cQry := ChangeQuery(cQry)
//MemoWrite("c:\temp\RCONE001.txt",cQry)
TcQuery cQry New Alias "QRYMOVFAT" 

If QRYMOVFAT->(EOF())
	lRet := .F.
Endif

ProcRegua(QRYMOVFAT->(RecCount()))

If lRet 
    
	If lLctPad00
		c100 := CtRelation(cPadrao,.F.,{{"QRYMOVFAT","Z13"},{"QRYMOVFAT","Z14"},{"QRYMOVFAT","RCONE001"}})
	Endif
	
	cNumMov 	:= QRYMOVFAT->Z13_CODIGO
	dDataZ13	:= QRYMOVFAT->Z13_DATA
	
	While QRYMOVFAT->(!EOF())

		IncProc("Processando Movimentação " + QRYMOVFAT->Z13_CODIGO + "...")
		
		//Movimentação  
		DbSelectArea("Z13")
		Z13->(DbSetOrder(1), DbGoTop(), DbSeek(xFilial("Z13")+QRYMOVFAT->Z13_CODIGO))

		//Itens Movimentação
		DbSelectArea("Z14")
		Z14->(DbSetOrder(1), DbGoTop(), DbSeek(xFilial("Z14")+QRYMOVFAT->Z13_CODIGO+QRYMOVFAT->Z14_ITEM))

		If lHeader .And. cNumMov != QRYMOVFAT->Z13_CODIGO //Separa por movimento
		    
		    dDatabase := dDataZ13
			RodaProva(nHdlPrv,nTotalCtb) 
			
			If nTotalCtb > 0
				nTotalCtb := 0			
				cA100Incl(cArquivo,nHdlPrv,1,cLoteCtb,lLancCtb,lAglutina,,,,@aFlagCTB)
			Endif
			
			nTotalCtb := 0 
			lHeader := .F.
		Endif  
		
		If lUsaFlag
			AAdd(aFlagCTB,{"Z14_LA","S","Z14",Z14->(Recno()),0,0,0})
        Endif 
        
        If !lHeader  

	   		nHdlPrv:=HeadProva(cLoteCtb,"RCONE001",Substr(cUsuario,7,6),@cArquivo)  

	   		If nHdlPrv <= 0
				HELP(" ",1,"SEM_LANC")
				lHeader := .F. 
			Else
				lHeader := .T.
			Endif
	  	Endif
		
		If lHeader 
		    
			lDetProva	:= .T.
			nParcCtb	:= DetProva(nHdlPrv,cPadrao,"RCONE001",cLoteCtb,,,,,@c100,@aCT5,,@aFlagCTB) 
			
			If lDetProva .And. !lUsaFlag
				Reclock("Z14",.F.)
				Z14->Z14_LA := 'S'
				Z14->(MsUnlock())
			Endif
			
			nTotalCtb += nParcCtb
		Endif
		
		dDataZ13	:= Z13->Z13_DATA
		cNumMov		:= QRYMOVFAT->Z13_CODIGO
				
		QRYMOVFAT->(DbSkip()) 		
	EndDo  
	
	If lHeader //RodaProva 
		
		dDatabase := dDataZ13
		RodaProva(nHdlPrv,nTotalCtb) 
		
		If nTotalCtb > 0
			nTotalCtb := 0			
			cA100Incl(cArquivo,nHdlPrv,1,cLoteCtb,lLancCtb,lAglutina,,,,@aFlagCTB)
		Endif
	Endif
Else
	MsgInfo("Nenhuma Movimentação de Faturamento selecionada Ou Todas apurações contabilizadas.","Atenção")
Endif
	
QRYMOVFAT->(DbCloseArea())

cPadrao := "151" //Movimentação Apuração 
lRet 	:= .T.

If Select("QRYMOVAPU") > 0
	QRYMOVAPU->(DbCloseArea())
Endif     

cQry := " SELECT Z21.Z21_CODIGO, Z21.Z21_DATA, Z21.Z21_CONTRA, Z22.Z22_ITEM"
cQry += " FROM "+RetSqlName("Z21")+" Z21, "+RetSqlName("Z22")+" Z22"
cQry += " WHERE Z21.D_E_L_E_T_	<> '*'"
cQry += " AND Z22.D_E_L_E_T_	<> '*'"
cQry += " AND Z21.Z21_FILIAL	= '"+xFilial("Z21")+"'"
cQry += " AND Z22.Z22_FILIAL	= '"+xFilial("Z22")+"'"
cQry += " AND Z21.Z21_CODIGO	= Z22.Z22_CODIGO"
cQry += " AND Z21.Z21_DATA		BETWEEN '"+DToS(dDtInici)+"' AND '"+DToS(dDtFinal)+"'"
cQry += " AND Z22.Z22_LA		<> 'S'" //Não contabilizado
cQry += " ORDER BY 1"

cQry := ChangeQuery(cQry)
//MemoWrite("c:\temp\RCONE001.txt",cQry)
TcQuery cQry New Alias "QRYMOVAPU" 

If QRYMOVAPU->(EOF())
	lRet := .F.
Endif

ProcRegua(QRYMOVAPU->(RecCount()))

If lRet 
    
	If lLctPad00
		c100 := CtRelation(cPadrao,.F.,{{"QRYMOVAPU","Z21"},{"QRYMOVAPU","Z22"},{"QRYMOVAPU","RCONE001"}})
	Endif
	
	cNumMov 	:= QRYMOVAPU->Z21_CODIGO
	dDataZ21	:= QRYMOVAPU->Z21_DATA
	
	While QRYMOVAPU->(!EOF())

		IncProc("Processando Movimentação " + QRYMOVAPU->Z21_CODIGO + "...")
		
		//Apuração  
		DbSelectArea("Z21")
		Z21->(DbSetOrder(1), DbGoTop(), DbSeek(xFilial("Z21")+QRYMOVAPU->Z21_CODIGO))

		//Itens Apuração
		DbSelectArea("Z22")
		Z22->(DbSetOrder(1), DbGoTop(), DbSeek(xFilial("Z22")+QRYMOVAPU->Z21_CODIGO+QRYMOVAPU->Z22_ITEM))

		If lHeader .And. cNumMov != QRYMOVAPU->Z21_CODIGO //Separa por movimento
		    
		    dDatabase := dDataZ21
			RodaProva(nHdlPrv,nTotalCtb) 
			
			If nTotalCtb > 0
				nTotalCtb := 0			
				cA100Incl(cArquivo,nHdlPrv,1,cLoteCtb,lLancCtb,lAglutina,,,,@aFlagCTB)
			Endif
			
			nTotalCtb := 0 
			lHeader := .F.
		Endif  
		
		If lUsaFlag
			AAdd(aFlagCTB,{"Z22_LA","S","Z22",Z22->(Recno()),0,0,0})
        Endif 
        
        If !lHeader  

	   		nHdlPrv := HeadProva(cLoteCtb,"RCONE001",Substr(cUsuario,7,6),@cArquivo)  

	   		If nHdlPrv <= 0
				HELP(" ",1,"SEM_LANC")
				lHeader := .F. 
			Else
				lHeader := .T.
			Endif
	  	Endif
		
		If lHeader 
		    
			lDetProva	:= .T.
			nParcCtb	:= DetProva(nHdlPrv,cPadrao,"RCONE001",cLoteCtb,,,,,@c100,@aCT5,,@aFlagCTB) 
			
			If lDetProva .And. !lUsaFlag
				Reclock("Z22",.F.)
				Z22->Z22_LA := 'S'
				Z22->(MsUnlock())
			Endif
			
			nTotalCtb += nParcCtb
		Endif
		
		dDataZ21	:= Z21->Z21_DATA
		cNumMov		:= QRYMOVAPU->Z21_CODIGO
				
		QRYMOVAPU->(DbSkip()) 		
	EndDo  
	
	If lHeader //RodaProva 
		
		dDatabase := dDataZ21
		RodaProva(nHdlPrv,nTotalCtb) 
		
		If nTotalCtb > 0
			nTotalCtb := 0			
			cA100Incl(cArquivo,nHdlPrv,1,cLoteCtb,lLancCtb,lAglutina,,,,@aFlagCTB)
		Endif
	Endif
Else
	MsgInfo("Nenhuma Movimentação de Apuração selecionada.","Atenção")
Endif
	
QRYMOVAPU->(DbCloseArea())

dDataBase := oldDatabase  //Restaura a DataBase
	
Return lRet	

/**************************/
Static Function AjustaSX1()
/**************************/

Local aHelpPor	:= {}
Local aHelpEng	:= {}
Local aHelpSpa	:= {}

u_xPutSx1( cPerg, "01","Mostra Lanç Contab ?","¿Muestra Asientos ?","Display Acc. Entry ?","mv_ch1","N",1,0,0,"C","","","","",;
	"mv_par01","Sim","Si","Yes","Não","Não","No","No","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)           
u_xPutSx1( cPerg, "02","Aglut. Lancamentos ?","¿Agrupa Asientos ?","Group Entries ?","mv_ch2","N",1,0,0,"C","","","","",;
	"mv_par02","Sim","Si","Yes","Não","Não","No","No","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
u_xPutSx1( cPerg, "03","Data Inicial ?","¿Fecha Inicial ?","Initial Date ?","mv_ch3","D",10,0,0,"G","","","","",;
	"mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa) 	                  
u_xPutSx1( cPerg, "04","Data Final ?","¿Fecha Final ?","Final Date ?","mv_ch4","D",10,0,0,"G","","","","",;
	"mv_par04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa) 
		
Return 
