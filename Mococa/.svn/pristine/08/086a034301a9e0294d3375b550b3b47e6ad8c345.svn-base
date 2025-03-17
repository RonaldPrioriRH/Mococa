#include "rwmake.ch"
#include "protheus.ch"
#include "topconn.ch"   
#INCLUDE "TbiConn.ch"

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³RFINA015	 ºAutor  ³Sangelles Moraes    	Data ³ 20/01/2018 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ RELATO (RELATÓRIO DE COMPORTAMENTO EM NEGÓCIOS)			  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Mococa - Ajustado por Tarcísio Silva.                      º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/  

User Function RFINA015() 

Private cPulaLinha	:= chr(13)+chr(10)
Private oButton1
Private oButton2     
Private oButton3
Private oGet1
Private cGet1 		:= date() //ctod("  /  /   ")
Private oGet2
Private cGet2 		:= date() //ctod("  /  /   ")
Private oGroup1
Private oSay1
Private oSay2
Private oSay3 
Private oComboBo1  
Private nComboBo1 	:= "1"
Private cFilials 	:= ""
Private nSelFil 	:= FunSelcFil()
	
if nSelFil==1

	cFilials := "02"
	
Elseif nSelFil==2

	cFilials := "01"

endif

Static oDlg

  DEFINE MSDIALOG oDlg TITLE "Exportação do Arquivo RELATO/SERASA" FROM 000, 000  TO 150, 350 COLORS 0, 16777215 PIXEL

    @ 005, 007 GROUP oGroup1 TO 047, 170 OF oDlg COLOR 0, 16777215 PIXEL
    @ 014, 024 SAY oSay1 PROMPT "Data Inicial" SIZE 067, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 023, 024 MSGET oGet1 VAR cGet1 SIZE 060, 010 OF oDlg COLORS 0, 16777215 PIXEL
    @ 014, 098 SAY oSay2 PROMPT "Data Final" SIZE 067, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 023, 098 MSGET oGet2 VAR cGet2 SIZE 060, 010 OF oDlg COLORS 0, 16777215 PIXEL
    //@ 055, 006 SAY oSay3 PROMPT "Periocidade" SIZE 033, 007 OF oDlg COLORS 0, 16777215 PIXEL
    //@ 063, 006 MSCOMBOBOX oComboBo1 VAR nComboBo1 ITEMS {"D=Diário","S=Semanal","M=Mensal  ","Q=Quinzenal"} SIZE 066, 010 OF oDlg COLORS 0, 16777215 PIXEL
                                                                                                                                 
    @ 057, 077 BUTTON oButton1 PROMPT "Exportar" SIZE 037, 012 OF oDlg PIXEL action Processa({|| funExportar() },"Exportando...")
	@ 057, 004 BUTTON oButton3 PROMPT "Conciliar" SIZE 037, 012 OF oDlg PIXEL action Processa({|| funConcilia() },"Conciliando...")
    @ 057, 120 BUTTON oButton2 PROMPT "Sair" SIZE 037, 012 OF oDlg PIXEL action oDlg:end()

  ACTIVATE MSDIALOG oDlg CENTERED

Return                                                                                            


static function funConcilia       
	Local nX 
	Private cDirDocs  	:= MsDocPath()               
	Private cArquivo    := "SERASA"           
	Private nArquiv     := 1     
	Private nTempo      := 0
	Private cArq := cFile := cGetFile('Arquivo *|*.*|Arquivo JPG|*.Jpg','Selecione arquivo',0,'C:\Dir\',.T.,,.F.)
	                                         
	Private cArqBkp := upper(cArq+"BKP"+dtos(date())+replace(time(),":",""))
		
	Private nStatus1 := frename(upper(cArq) ,upper(cArqBkp))
    
    if nStatus1 == -1
	   MsgStop('Falha na operação 1 : FError '+str(ferror(),4))
	Endif  
	
	Private nHdl 	:= FT_FUSE(cArqBkp)
		
	If nHdl == -1
	    MsgAlert("O arquivo de nome "+cArqBkp+" nao pode ser aberto! Verifique os parametros.","Atencao!")
	    Return
	Endif
	
	FT_FGOTOP()
	ProcRegua(FT_FLASTREC())  
	cNewLinha := ""                   
	lPrimeiraVez := .T. 
    aTexto := {}
    
	While !FT_FEOF()
		cLinha 	  := FT_FREADLN()
      		
		if lPrimeiraVez
			if	"CONCILIA" $ cLinha //Primeira Linha é de Conciliação   
				cData := substring(cLinha,45,8)
				lPrimeiraVez := .F.            
				aadd(aTexto,cLinha)
			else
				Aviso("Atenção","Erro ao ler o arquivo! Verifique se o mesmo é de conciliação",{"OK"})				
				return
			endif          
		else
			cNumTit := alltrim(str(val(substr(cLinha,19,10))))
			if Select("TMP") > 0
				TMP->(DbCloseArea())
			endif			
			cQry := "SELECT case when  E1_BAIXA > '"+alltrim(cData)+"' then '' else E1_BAIXA END E1_BAIXA  FROM "+ RetSqlName("SE1") +" SE1 "
			cQry += " WHERE R_E_C_N_O_ = "+cNumTit+ " "
				
			TcQuery cQry New Alias "TMP"
	                                               
	  		if empty(TMP->E1_BAIXA)   
	  			cCpo := replace(cLinha,"99999999                                   ","                                           ")  
	  		else
				cCpo := replace(cLinha,"99999999                                   ",TMP->E1_BAIXA+"                                   ")           		
			endif
			aadd(aTexto,cCpo)
		 endif                 
	 	 FT_FSKIP()
    enddo                          
    fClose(nHdl)
                         
    Private nHdlNew    := fCreate(upper(cArq)) 

	If nHdlNew == -1
		    MsgAlert("O arquivo de nome "+cArqTxt+" nao pode ser executado! Verifique os parametros.","Atenção!")
		    Return
	Endif

    Private cEOL    := "CHR(13)+CHR(10)"
	If Empty(cEOL)
	    cEOL := CHR(13)+CHR(10)
	Else
	    cEOL := Trim(cEOL)
	    cEOL := &cEOL
	Endif

    
    for nX := 1 to len(aTexto)
    
    	nTamLin := 2
		cLin    := Space(nTamLin)+cEOL 
		cCpo 	:= aTexto[nX]
    	cLin := Stuff(cLin,01,02,cCpo)
	    if fWrite(nHdlNew,cLin,Len(cLin)) != Len(cLin)
	       	Alert("Ocorreu um erro na gravacao do arquivo.")
	    endif  
    next nX   
    
    fClose(nHdlNew)
    Aviso("Informação","Arquivo de Conciliação reprocessado com sucesso!",{"OK"})	
return

static function funExportar

	Private cDirDocs  	:= MsDocPath()               
	Private cArquivo    := "SERASA"           
	Private nArquiv     := 1     
	Private nTempo      := 0
	cArq := cGetFile( '*.TXT' , 'Arquivos') //cGetFile( '*.TXT' , 'Arquivos', 1, 'C:\', .F., nOR( GETF_LOCALHARD, GETF_LOCALFLOPPY, GETF_RETDIRECTORY ),.T., .T. )
	nHandle := MsfCreate(cArq+ UPPER(cArquivo)+alltrim(str(nArquiv)) +".TXT",0)
	
	fWrite(nHandle, "00")
	fWrite(nHandle, "RELATO COMP NEGOCIOS")
	fWrite(nHandle, GETMV("MV_XSERASA"))	
	fWrite(nHandle, dtos(cGet1))
	fWrite(nHandle, dtos(cGet2))
	fWrite(nHandle, "S")
	fWrite(nHandle, PADL("",15,""))
	fWrite(nHandle, PADL("",03,""))
	fWrite(nHandle, PADL("",29,""))	
	fWrite(nHandle, "V.")
	fWrite(nHandle, "01")
	fWrite(nHandle, PADL("",26,""))	
	fWrite(nHandle, cPulaLinha )
	
	if Select("QRY") > 0
		QRY->(DbCloseArea())
	endif
		
	cQry := "SELECT DISTINCT E1_PARCELA,E1_CLIENTE,E1_LOJA, A1_CGC, E1_FILIAL, E1_EMISSAO, CASE WHEN SE1.D_E_L_E_T_ = '*' THEN 99999999999999 ELSE E1_VALOR END E1_VALOR, E1_VENCREA, E1_EMISSAO, E1_BAIXA, SE1.R_E_C_N_O_, SE1.D_E_L_E_T_  FROM "+ RetSqlName("SE1") +" SE1, "+ RetSqlName("SA1") +" SA1 "
	cQry += " WHERE 0=0 "//SE1.D_E_L_E_T_ <> '*' "
	cQry += "   AND SA1.D_E_L_E_T_ <> '*' "
	cQry += "   AND A1_COD  = E1_CLIENTE AND LENGTH(LTRIM(RTRIM(A1_CGC))) = 14   " //AND E1_TIPO = 'NF'
	cQry += "   AND A1_LOJA = E1_LOJA AND A1_CGC <> '"+ALLTRIM(GETMV("MV_XSERASA"))+"' " 
	cQry += "   AND ((E1_EMISSAO BETWEEN '"+dtos(cGet1)+"' AND '"+dtos(cGet2)+"' AND E1_SALDO > 0) "
	cQry += "     OR    (E1_BAIXA BETWEEN '"+dtos(cGet1)+"' AND '"+dtos(cGet2)+"') ) "
	cQry += "    AND A1_CGC NOT IN ('52502507006269','52502507006269','52502507000309','52502507006854', "
 	cQry += "    '52502507001208','52502507006692','52502507000813','26687598000122','52502507001895', "	
 	cQry += "    '52502507001623','52502507002271','52502507001976','52502507000147','52502507001380',	"
 	cQry += "    '26687598000203','26687598000475','26687598000394','52502507000651')  AND SUBSTR(E1_FILIAL,1,2) = '"+cFilials+"' "

	MemoWrite("c:\temp\Rfina015.sql",cQry)
	
	TcQuery cQry New Alias "QRY"
	                               
	nReg := 0   
	
	//ProcRegua(QRY->(Reccount()) )
	
	while !QRY->(EOF()) 
	
	//IncProc("Processando Relatório: " + TRB->E1_CLIENTE + "-" + TRB->E1_LOJA)
	
	    SA1->(dbsetorder(1))
	    SA1->(dbgotop())
	    if SA1->(dbseek(xFilial("SA1")+QRY->E1_CLIENTE+QRY->E1_LOJA))	    
		    if SA1->A1_XRELSER != "1" //1=Sim;2=Nao
		    	fWrite(nHandle, "01")
				fWrite(nHandle, SA1->A1_CGC)
				fWrite(nHandle, "01") 
				if !empty(SA1->A1_DTCAD)				
					fWrite(nHandle, dtos(SA1->A1_DTCAD))
					IF year(date()) - year(SA1->A1_DTCAD) >= 1
						fWrite(nHandle, "1") 
					else
						fWrite(nHandle, "2")	 
					endif	
				else
						fWrite(nHandle, dtos(date()))
						fWrite(nHandle, "2")										
				endif
				fWrite(nHandle, PADL("",34,""))	
				fWrite(nHandle, PADL("",01,""))	  
				fWrite(nHandle, PADL("",30,""))	 
				fWrite(nHandle, cPulaLinha ) 

				SA1->( Reclock("SA1",.F.))
				SA1->A1_XRELSER := "1" 
				if empty(SA1->A1_DTCAD)
					SA1->A1_DTCAD := date()	
				endif
				SA1->(MsUnLock())	
				nTempo += 1	
		    endif
	    endif
			
		fWrite(nHandle, "01")
		fWrite(nHandle, QRY->A1_CGC)
		fWrite(nHandle, "05")                               
		fWrite(nHandle, PADL(alltrim(str(QRY->R_E_C_N_O_))  ,10,""))
		fWrite(nHandle, QRY->E1_EMISSAO) 
		
		fWrite(nHandle, PADL(alltrim(str(QRY->E1_VALOR*100)),13,"0"))

		IF QRY->E1_VENCREA < QRY->E1_EMISSAO		
			fWrite(nHandle, QRY->E1_EMISSAO)         
		else  
			fWrite(nHandle, QRY->E1_VENCREA)
		endif

		if !empty(QRY->E1_BAIXA)    			
			if QRY->E1_BAIXA <= dtos(cGet2) 
				IF QRY->E1_BAIXA < QRY->E1_EMISSAO      
			    	fWrite(nHandle, PADL(QRY->E1_EMISSAO,8,""))
				else
					fWrite(nHandle, PADL(QRY->E1_BAIXA,8,""))
				endif             
			else        
					fWrite(nHandle, PADL(dtos(cGet2) ,8,""))			
			endif       
		else
			fWrite(nHandle, PADL(QRY->E1_BAIXA,8,""))	
		endif
		fWrite(nHandle, PADL("",34,""))
		fWrite(nHandle, PADL("",02,""))
		fWrite(nHandle, PADL("",32,""))
		fWrite(nHandle, PADL("",01,""))
		fWrite(nHandle, PADL("",24,""))
		fWrite(nHandle, PADL("",02,""))
		fWrite(nHandle, PADL("",01,""))
		fWrite(nHandle, PADL("",01,""))
		fWrite(nHandle, PADL("",02,""))	
		fWrite(nHandle, cPulaLinha )
		nReg += 1
		QRY->(dbskip())  
		if nReg > 4000
				nArquiv += 1			
				fWrite(nHandle, "99")
				fWrite(nHandle, PADL("0",11,"0"))
				fWrite(nHandle, PADL("",44,""))	
				fWrite(nHandle, PADL(alltrim(str(nReg)),11,"0"))
				fWrite(nHandle, PADL("",11,""))
				fWrite(nHandle, PADL("",11,""))
				fWrite(nHandle, PADL("",10,""))
				fWrite(nHandle, PADL("",30,""))	
				fWrite(nHandle, cPulaLinha ) 
				fClose(nHandle)     
					nHandle := MsfCreate(cArq+ UPPER(cArquivo)+alltrim(str(nArquiv)) +".TXT",0)	
					fWrite(nHandle, "00")
					fWrite(nHandle, "RELATO COMP NEGOCIOS")
					fWrite(nHandle, GETMV("MV_XSERASA"))	
					fWrite(nHandle, dtos(cGet1))
					fWrite(nHandle, dtos(cGet2))
					fWrite(nHandle, "S")
					fWrite(nHandle, PADL("",15,""))
					fWrite(nHandle, PADL("",03,""))
					fWrite(nHandle, PADL("",29,""))	
					fWrite(nHandle, "V.")
					fWrite(nHandle, "01")
					fWrite(nHandle, PADL("",26,""))	
					fWrite(nHandle, cPulaLinha )
				nReg := 0						
		endif
	enddo
	fWrite(nHandle, "99")
	fWrite(nHandle, PADL(alltrim(str(nTempo)),11,"0"))
	fWrite(nHandle, PADL("",44,""))	
	fWrite(nHandle, PADL(alltrim(str(nReg)),11,"0"))
	fWrite(nHandle, PADL("",11,""))
	fWrite(nHandle, PADL("",11,""))
	fWrite(nHandle, PADL("",10,""))
	fWrite(nHandle, PADL("",30,""))	
	fWrite(nHandle, cPulaLinha ) 
	fClose(nHandle)
	Aviso("Informação","Arquivo 'SERASA.TXT' gerado com sucesso!",{"OK"})		
return()

Static Function FunSelcFil()                        
Private oButton5
Private oGroup1
Private oRadMenu1
Private nRadMenu1 := 0
Static oDlg2

  DEFINE MSDIALOG oDlg2 TITLE "Seleção de Filiais" FROM 000, 000  TO 123, 175 COLORS 0, 16777215 PIXEL

    @ 005, 008 GROUP oGroup1 TO 057, 083 PROMPT "Seleção de Empresa | " OF oDlg2 COLOR 0, 16777215 PIXEL
    @ 018, 015 RADIO oRadMenu1 VAR nRadMenu1 ITEMS "Mococa Alimentos ","Mococa S.a" SIZE 061, 018 OF oDlg2 COLOR 0, 16777215 PIXEL
    @ 038, 016 BUTTON oButton5 PROMPT "Ok" SIZE 037, 012 OF oDlg2 Action oDlg2:end() PIXEL

  ACTIVATE MSDIALOG oDlg2 CENTERED
  
return(nRadMenu1)
