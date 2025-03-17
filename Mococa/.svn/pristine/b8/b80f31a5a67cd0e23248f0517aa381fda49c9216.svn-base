#include "PROTHEUS.CH"
#INCLUDE "rwmake.ch"
#INCLUDE "topconn.ch"
#Define CRLF CHR(13)+CHR(10)
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ MGLT007  º Autor ³ TOTVS                 º Data da Criacao  ³ 06/10/2008                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Rotina utilizada para fazer ajustes de dados    									                  			º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Gestao de Leite                                                     						                    º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Nenhum						   							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum						  							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ Microsiga                                                                                					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite.                                                                        						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³16/09/2008³Inclusao das tabelas ZL2,ZL4,  				   ³00-000000 -                       ³ TI	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function MGLT007()
Static mensagem:=""

Local _cCCORRE := U_GETRELA1("1","ZL1_CCORRE") //#LETRAS

//	if MsgYesNo("Tem certeza que quer importar o PC da CTB?")	
//			Processa({|| planoCTB() },"...")
//	endif


	//if MsgYesNo("Tem certeza que quer ajustar as agencias Bradesco?")	
	//		Processa({|| ajustBanco() },"...")
	//endif

	
	if MsgYesNo("Tem certeza que quer importar os lancamentos da CTB?")	
			Processa({|| lancCTB() },"...")
	endif
	/*
	if MsgYesNo("Tem certeza que quer Ajustar Titulos dos Convenios?")	
			Processa({|| conven() },"...")
	endif
	if MsgYesNo("Tem certeza que quer Ajustar Titulos dos Emprestimos?")	
			Processa({|| emprest() },"...")
	endif
	if MsgYesNo("Ajustar os dados de Tanque dos Produtores?")	
			Processa({|| produtor() },"...")
	endif
    */
return

Static function produtor()
Local aAux:={}
Local cAux:=""
	
	DbSelectArea("SA2")
	dbsetorder(1)
	
	ProcRegua(RecCount())
	
	while (!eof())
		incproc()
		//if SA2->A2_C_TPFOR $ "C/G/T" .and. SA2->A2_COD != SA2->A2_L_TANQ //#LETRAS
		if ((SA2->A2_C_TPFOR $ _cCCORRE) .and. (SA2->A2_COD != SA2->A2_L_TANQ)) //#LETRAS
			aAux:=GetCmps(SA2->A2_L_TANQ)
			if len(aAux)>0
				RECLOCK("SA2",.F.)            
				if !empty(aAux[1])
					SA2->A2_L_MARTQ	:=	aAux[1]
				endif
				if !empty(aAux[2])
					SA2->A2_L_RESFR	:=	aAux[2]	
				endif
				if !empty(aAux[3])
					SA2->A2_L_CAPAC	:=	aAux[3]	
				endif
				SA2->A2_L_CAPTQ	:=	aAux[4]	
				
				MSUNLOCK()
			endif
		endif
		dbskip()
	enddo

return

Static Function GetCmps(cCod)
Local aArea:=GetArea()
Local aRet:={}

	DbselectArea("SA2")
	dbsetorder(1)
	if dbseek(xfilial("SA2")+cCod)
		aRet:={SA2->A2_L_MARTQ,SA2->A2_L_RESFR,SA2->A2_L_CAPAC,SA2->A2_L_CAPTQ}
	endif
	
RestArea(aArea)
return aRet

Static Function emprest()
Local nOk:=0
Local lshow:=.t.

	DbSelectArea("ZLM")
	dbsetorder(1)
	
	ProcRegua(RecCount())
	
	while !eof()

		incproc()

		cPrefixo := "GL"+ZLM->ZLM_TIPO

		_cUpdate := " UPDATE " + RetSqlName("SE2")
		_cUpdate += " SET E2_L_SETOR = '"+ZLM->ZLM_SETOR+"'"
		_cUpdate += " WHERE D_E_L_E_T_ = ' '"
		_cUpdate += " AND E2_FILIAL    = '" + ZLM->ZLM_FILIAL + "'"
		_cUpdate += " AND E2_PREFIXO   = '" + cPrefixo + "'"
		_cUpdate += " AND E2_TIPO      = 'NDF'"
		_cUpdate += " AND E2_NUM       = '" + ZLM->ZLM_COD + "'"
		_cUpdate += " AND E2_FORNECE   = '" + ZLM->ZLM_SA2COD + "'"
		_cUpdate += " AND E2_LOJA      = '" + ZLM->ZLM_SA2LJ + "'"
		_cUpdate += " AND E2_L_SETOR   = ' ' "
		nok += TCSqlExec(_cUpdate)
        
		if lshow
			xmaghelpfis("",_cUpdate,"")
	        if MsgYesNo("Nao mostra SQL?")
	        	lshow:=.f.
	        endif
		endif

		
		dbskip()
	enddo   
	
MsgInfo(alltrim(str(nok))+" atualizados")

return

Static Function conven()
Local nOk := 0
Local nReg:=0

	DbselectArea("ZLL")
	Dbsetorder(1)
	               
	ProcRegua(RecCount())
	
	while !eof()

		incproc()

		cPrefixo  := POSICIONE("ZL8",1,XFILIAL("ZL8")+ZLL->ZLL_EVENTO,"ZL8_PREFIX")
		
	    lok:= se2update(ZLL->ZLL_FILIAL,cPrefixo,ZLL->ZLL_COD+ZLL->ZLL_SEQ,"1 ","NDF",ZLL->ZLL_RETIRO,ZLL->ZLL_RETILJ,ZLL->ZLL_SETOR)
	    
	    if lok
	    	nok++
	    endif
	    
		dbskip()
	enddo

MsgInfo( alltrim(str(nok)) +" atualizados! " )

return

Static Function se2update(cpFilial,cpPrefixo,cpNum,cpParcela,cpTipo,cpForn,cpLoja,cpSetor)
Local lret:= .f.
Local aArea:=GetArea()

		dbSelectArea("SE2")
		dbSetOrder(1)
		dbgotop()
		dbSeek(cpFilial+cpPrefixo+cpNum+cpParcela+cpTipo+cpForn+cpLoja)
		If Found() .and. empty(alltrim(SE2->E2_L_SETOR))
			RECLOCK("SE2",.F.)
			SE2->E2_L_SETOR := cpSetor
			MSUNLOCK()
			lRet:=.t.
		endif

RestArea(aArea)
return lRet

Static Function planoCTB()
Local _aAutoCT1:={}
Local cAlias:="ZZ1" 
Local _aAutoCT1:={}
Local cConta:=""
Local cTipo:=""    
Local aArea:={} 


DbSelectArea(cAlias)
Dbsetorder(1)

ProcRegua(RecCount())

while !eof()


	cConta:=(cAlias)->&(cAlias+"_COD")
	cConta:=ajusta(cConta)
	cConta:=strtran(cConta,".","") // retira pontos
	cConta:=alltrim(cConta)

	incproc(cConta)

	cTipo:=(cAlias)->&(cAlias+"_MOV")
	if cTipo == "N"
		cTipo:="1" //Sintetico
	else
		cTipo:="2" //Analitico
	endif
	if left(cConta,1)=="1" .or. left(cConta,1)=="3"
		cNormal:="1" // devedor
	elseif left(cConta,1)=="2"
		cNormal:="2" // credor
	endif                                   
	
	cTitulo:=(cAlias)->&(cAlias+"_TITULO")
	if empty(alltrim(cTitulo))
	     cTitulo:="***"
	endif
	
	_aAutoCT1:={}
	AAdd( _aAutoCT1, { "CT1_FILIAL"	,XFILIAL("CT1")	, nil } )		// Filial
	AAdd( _aAutoCT1, { "CT1_CONTA"	,cConta	, nil } )		// Codigo
	AAdd( _aAutoCT1, { "CT1_DESC01"	,cTitulo	, nil } )		// Descricao
	AAdd( _aAutoCT1, { "CT1_CLASSE"	,cTipo	 , nil } )		// Classe(sintetica ou analitica
	AAdd( _aAutoCT1, { "CT1_NORMAL"	,cNormal , nil } )		// Tipo(Devedora ou Credora)
	AAdd( _aAutoCT1, { "CT1_CTASUP"	,CtbCtaSup(cConta)	, nil } )	
	if cTipo=="2"
		AAdd( _aAutoCT1, { "CT1_RES"	,(cAlias)->&(cAlias+"_REDUZ")	, nil } )		// Codigo Reduziro
	endif
    
	aArea:=GetArea()
	lMsErroAuto := .F.
	MsExecAuto({|x|CTBA020(_aAutoCT1)},,3)
	IF lMsErroAuto
		mostraerro()
		IF MsgYesNo("Sair?")
		     exit
		endif
	endif
	RestArea(aArea)
               
	DbSelectArea(cAlias)
	dbskip()
enddo

return

Static Function ajusta(ccod)
Local lacho:=.f.
Local newcod:=""
Local qtd:=0 
Local n:=0
Local lachou:=.f.

pos1:=substr(ccod,1,1)
pos2:=substr(ccod,3,1)
pos3:=substr(ccod,5,2)
pos4:=substr(ccod,8,2)
pos5:=substr(ccod,11,4)

if val(pos1)!= 0
	newcod:=pos1
endif
if val(pos2)!= 0
	newcod+=pos2
endif
if val(pos3)!= 0
	newcod+=pos3
endif
if val(pos4)!= 0
	newcod+=pos4
endif
if val(pos5)!= 0
	newcod+=pos5
endif
	
return newcod  


Static Function LancCTB()
Local cAlias:="ZZ2"
Local cConta,nVlrCred,nVlrDebi,nValor,cHist,dData,cTipo,cLanc
Local nConta:=0       
Local aDados:={}
Local cErro:=""
Local cDoc:="000001"
Local cLin:="001"
Local cUltDay:=""
Local odt1,odt2
Local dt1:=ddatabase
Local dt2:=ddatabase
Local nDoc:=1          
Local lContinua:=.T.
Local nCerto:=0
Local nNoCont:=0
Local nLin:=0
Private aCab:={}
Private aItens:={}
Private lMsErroAuto:=.f.
Private cLote:="000001"

@ 00,00 To 200,350 Dialog oDlgVen1 Title "Periodo"
@ 20,010 say "Periodo Inicial" Pixel Of oDlgVen1
@ 20,050 MsGet odt1 Var dt1 Picture "99/99/99"  Pixel Of oDlgVen1
@ 35,010 SAY "Periodo Final" Pixel Of oDlgVen1
@ 35,050 MsGet odt2 Var dt2 Picture "99/99/99"  Pixel Of oDlgVen1
@ 50,010 SAY "Lote" Pixel Of oDlgVen1
@ 50,050 MsGet oLote Var cLote Pixel Of oDlgVen1
@ 65,050 BmpButton Type 1 Action close(oDlgVen1)
Activate Dialog oDlgVen1 Center   

// u_gravaCtb("","1101020051",100,"","","","","TESTE",dDatabase,"1")

if !MsgYesNo("Confirma dados?")
	return
endif

DbSelectArea("ZZ2")
Dbsetorder(1)
Dbgotop()
dbseek(xfilial("ZZ2")+DTOS(dt1))
while !eof() .and. ZZ2->ZZ2_DATA >= dt1 .and. ZZ2->ZZ2_DATA <= dt2
                       	
	nConta++
    
	// obtem dados da tabela
	cLanc:=LEFT((cAlias)->&(cAlias+"_LANC"),5)
	cConta:=LEFT((cAlias)->&(cAlias+"_COD"),5)
	nVlrCred:=(cAlias)->&(cAlias+"_CRED")
	nVlrDebi:=(cAlias)->&(cAlias+"_DEB")
	cHist:=(cAlias)->&(cAlias+"_HIST")	
	dData:=(cAlias)->&(cAlias+"_DATA")

	cTipo:=iif(nVlrCred!=0,"C","D")
	cTipo:=iif(nVlrDebi!=0,"D","C")

	if cTipo=="C"
		nValor:=nVlrCred
	else
		nValor:=nVlrDebi
	endif

	// armazena lanc. no array
	If (cAlias)->&(cAlias+"_DATA") >= dt1 .and. (cAlias)->&(cAlias+"_DATA") <= dt2 
			aAdd(aDados,{cTipo,cConta,nValor,cHist,dData,cLanc})
	endif

	dbskip()
enddo           

//MsgInfo("Array montado!")
nModulo := 34
cModulo := "CTB"

ProcRegua(len(aDados))
For x:=1 to len(aDados)

	incproc()                      
        
    // Se mudar o dia ou atingir 999 itens, entao grava Lancto.
    if dtos(aDados[x,5]) != cUltDay .or. cLin=="ZZZ" //nLin == 999
    		if len(aCab)>0 .and. len(aItens)>0
    			If DayNoImp(cUltDay)
	
	    			//if MsgYesNo(" O dia "+cUltDay+" nao consta na CT2. Deseja importa-lo?")
		    			lMsErroAuto:=.f.
		    			MSExecAuto( {|X,Y,Z| CTBA102(X,Y,Z)},aCab,aItens,3)
		    			if lMsErroAuto
	    				     MostraErro()
	    				endif	    				
    				//endif
    			
				Endif

    		endif
    		aCab:={}
    		aItens:={}
			nLin:=0 
			cLin:="001"         
			nDoc++
    endif
    cUltDay:=dtos(aDados[x,5])

	aCab:= {{"dDataLanc"	,aDados[x,5],NIL},;
			{"cLote"		,"000001"  		,NIL},;
			{"cDoc"	    	,strzero(nDoc,6),NIL},;
			{"cSubLote"		,"001"	,NIL},;
			{"cTpSald"		,"1"	,NIL}}

	if x+1 <= len(aDados)
 
		// Se valores forem iguais E tipo de lanc. D/C forem diferentes E contas diferentes
		// grava como partida dobrada
		if aDados[x,3]==aDados[x+1,3] .AND. aDados[x,1] != aDados[x+1,1] .AND. aDados[x,2] != aDados[x+1,2] 
			
		
			if aDados[x,1] == "C"
				_cCredito := POSICIONE("CT1",2,XFILIAL("CT1")+aDados[x,2],"CT1_CONTA")
			else
				_cDebito := POSICIONE("CT1",2,XFILIAL("CT1")+aDados[x,2],"CT1_CONTA")
			endif

			if aDados[x+1,1] == "C"
				_cCredito := POSICIONE("CT1",2,XFILIAL("CT1")+aDados[x+1,2],"CT1_CONTA")
			else
				_cDebito := POSICIONE("CT1",2,XFILIAL("CT1")+aDados[x+1,2],"CT1_CONTA")
			endif

			/*if left(_cCredito,6) == "110206" .or. left(_cDebito,6) == "210101" ;
			   .or. left(_cCredito,6) == "210101" .or. left(_cDebito,6) == "110206"
				lContinua:=.t.
			else
				lContinua:=.f.
			endif
			*/
			if lContinua
				nCerto++
				nLin++
				cLin:=soma1(cLin)
				Aadd(aItens, {{"CT2_FILIAL"	,xFilial("CT2")				, NIL},;
							 {"CT2_LINHA"	,cLin						, NIL},;
							 {"CT2_MOEDLC"	,"01"						, NIL},;
							 {"CT2_TPSALD"	,"1"						, NIL},;
						     {"CT2_DC"		,"3"						, NIL},;
						     {"CT2_DEBITO"	,_cDebito					, NIL},;
						     {"CT2_CREDIT"	,_cCredito					, NIL},;
							 {"CT2_DCD"		,CtbDigCont(_cDebito)		, NIL},;
							 {"CT2_DCC"		,CtbDigCont(_cCredito)		, NIL},;
						     {"CT2_VALOR"	,aDados[x,3]				, NIL},;
						     {"CT2_HIST"	,aDados[x,4]         		, NIL}})
			else
				nNoCont++
			endif
			x++
			incproc()
		else
		    // grava partida simples
			if aDados[x,1] == "C"
				_cCredito := POSICIONE("CT1",2,XFILIAL("CT1")+aDados[x,2],"CT1_CONTA")
				_cDebito:=""
			else
				_cDebito := POSICIONE("CT1",2,XFILIAL("CT1")+aDados[x,2],"CT1_CONTA")
				_cCredito := ""
			endif

			/*if left(_cCredito,6) == "110206" .or. left(_cDebito,6) == "210101" ;
			   .or. left(_cCredito,6) == "210101" .or. left(_cDebito,6) == "110206"
				lContinua:=.t.
			else
				lContinua:=.f.
			endif
            */
			if lContinua
				nCerto++
				nLin++
				cLin:=soma1(cLin)
				Aadd(aItens, {{"CT2_FILIAL"	,xFilial("CT2")				, NIL},;
							 {"CT2_LINHA"	,cLin						, NIL},;
							 {"CT2_MOEDLC"	,"01"						, NIL},;
							 {"CT2_TPSALD"	,"1"						, NIL},;
						     {"CT2_DC"		,iif(aDados[x,1]=="D","1","2")	, NIL},;
						     {"CT2_DEBITO"	,_cDebito					, NIL},;
						     {"CT2_CREDIT"	,_cCredito					, NIL},;
							 {"CT2_DCD"		,CtbDigCont(_cDebito)		, NIL},;
							 {"CT2_DCC"		,CtbDigCont(_cCredito)		, NIL},;
						     {"CT2_VALOR"	,aDados[x,3]				, NIL},;
						     {"CT2_HIST"	,aDados[x,4]         			, NIL}})
			else
				nNoCont++
			endif
		    
		endif
	endif

next x

if len(aCab)>0 .and. len(aItens)>0
	If DayNoImp(cUltDay)
		alert(cUltDay)
		//if MsgYesNo(" O dia "+cUltDay+" nao consta na CT2. Deseja importa-lo?")
			lMsErroAuto:=.f.
			MSExecAuto( {|X,Y,Z| CTBA102(X,Y,Z)},aCab,aItens,3)
			if lMsErroAuto
				mostraErro()	
			endif
		//Endif
	Endif		

endif

MsgInfo("Concluido! Registros Lidos:"+str(len(aDados))+char(10)+" Registros incluidos:"+str(nCerto)+char(10)+" Registros fora do filtro:"+str(nNoCont)) 
if !empty(alltrim(cErro))
	xmaghelpfis("","Erros:"+cErro,"")
endif
nHdl := fCreate("c:\log2.txt")
fWrite(nHdl,cErro,len(cErro))
fClose(nHdl)	

return      

Static Function grvDireto(_cCredito,_cDebito,_nValor,_cCustoC,_cCustoD,_cItemC,_cItemD,_cHist,_dData,_cTipoDC,_cDoc,_cLinha)
      RECLOCK("CT2",.T.)
      CT2->CT2_DATA := _dData
      CT2->CT2_LOTE := "000001"
      CT2->CT2_SBLOTE := "001"
      CT2->CT2_DOC := _cDoc
      CT2->CT2_LINHA := _cLinha
      CT2->CT2_MOEDLC := "01"
      CT2->CT2_DC := _cTipoDC
      CT2->CT2_DEBITO := _cDebito
      CT2->CT2_CREDIT := _cCredito
      CT2->CT2_VALOR := _nValor
      CT2->CT2_HIST := _cHist
      CT2->CT2_EMPORI := "01"
      CT2->CT2_FILORI := "01"
      CT2->CT2_TPSALD := "9"
      CT2->CT2_MANUAL := "1"
      CT2->CT2_ROTINA := "CTBA102   "
      CT2->CT2_AGLUT := "2"
      CT2->CT2_SEQHIST := "001"
      CT2->CT2_SEQLAN := "001"
      CT2->CT2_CRCONV := "1"
      CT2->CT2_DTCONF := ddatabase
      MSUNLOCK()
return .T.

Static Function gravaCtb(_cCredito,_cDebito,_nValor,_cCustoC,_cCustoD,_cItemC,_cItemD,_cHist,_dData,_cTipoDC,_cDoc,_cLinha)
/*
 ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ³ Gravando registros no sigaCTB ...                            ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
*/

Local dDataLanc := CTOD("")
Local cLote     := space(6)
Local cSubLote  := space(3)
Local cDoc      := space(6)
Local cCab  	:= {}
Local aItens 	:= {}
Local lRet:=.T.
Private lMsErroAuto := .f.

nModulo := 34
cModulo := "CTB"

 
aCab:= {{"dDataLanc"	,_dData,NIL},;
		{"cLote"		,"000001"  		,NIL},;
		{"cDoc"	    	,_cDoc		,NIL},;
		{"cSubLote"		,_cLinha	,NIL},;
		{"cTpSald"		,"1"	,NIL}}
     
Aadd(aItens, {{"CT2_FILIAL"	,xFilial("CT2")				, NIL},;
			 {"CT2_LINHA"	,"001"					, NIL},;
			 {"CT2_MOEDLC"	,"01"						, NIL},;
			 {"CT2_TPSALD"	,"1"						, NIL},;
		     {"CT2_DC"		,_cTipoDC					, NIL},;
		     {"CT2_DEBITO"	,_cDebito					, NIL},;
		     {"CT2_CREDIT"	,_cCredito					, NIL},;
			 {"CT2_DCD"		,CtbDigCont(_cDebito)		, NIL},;
			 {"CT2_DCC"		,CtbDigCont(_cCredito)		, NIL},;
		     {"CT2_VALOR"	,_nValor					, NIL},;
		     {"CT2_ORIGEM"	,""  						, NIL},;
		     {"CT2_HP"		,""							, NIL},;
   		     {"CT2_CCC"		,_cCustoC   				, NIL},;
   		     {"CT2_CCD"		,_cCustoD   				, NIL},;
   		     {"CT2_ITEMD"	,_cItemD     				, NIL},;
   		     {"CT2_ITEMC"	,_cItemC     				, NIL},;
		     {"CT2_HIST"	,_cHist         			, NIL}})

MSExecAuto( {|X,Y,Z| CTBA102(X,Y,Z)},aCab,aItens,3) 
// lMsErroAuto
	//mostraerro()
//	lRet:=.F.
//endif

Return lRet


Static Function compare()
Local cTp
Local nVlr:=0
Local cText:=""
              

DbSelectArea("ZZ2")
DbSetorder(1)

ProcRegua(RecCount())

dbgotop()
while !eof()                            
	incproc()
	if ZZ2->ZZ2_CRED != 0 
		cTp:="C"
		nVlr:=ZZ2->ZZ2_CRED
	else       
		cTp:="D"
		nVlr:=ZZ2->ZZ2_DEB
	endif
    if !HaveCTB(ZZ2_DATA,ZZ2_LANC,ZZ2_COD,nVlr,cTp) 
        cText+=dtoc(ZZ2_DATA)+" "+ZZ2_LANC+" "+ZZ2_COD+" "+str(nVlr)+char(13)+char(10)
    endif
	Dbskip()
enddo

nHdl := fCreate("c:\dif.txt")
fWrite(nHdl,cText,len(cText))
fClose(nHdl)	


return   

Static Function HaveCTB(dData,cDoc,cConta,nVlr,nTp)

cQuery:= " SELECT COUNT(*) AS QTDREG "
cQuery+= " FROM  "+retsqlname("CT2")+" CT2 "
cQuery+= " WHERE CT2.D_E_L_E_T_ = ' ' "
cQuery+= " AND CT2_DATA = '"+dtos(dData)+"' "
cQuery+= " AND CT2_DOC    = '"+cDoc+"' "
cQuery+= " AND CT2_VALOR  = "+alltrim(str(nVlr))+" "
if nTp=="C"
	cQuery+= " AND CT2_CREDIT = '"+cConta+"' "
else
	cQuery+= " AND CT2_DEBIT  = '"+cConta+"' "
endif


return .t.


Static Function DayNoImp(cpData)
Local lRet
Local nregCT2 := 0
Local nregZZ2 := 0

cQuery:= " SELECT COUNT(*) AS QTDREG "
cQuery+= " FROM  "+retsqlname("CT2")+" CT2 "
cQuery+= " WHERE CT2.D_E_L_E_T_ = ' ' "
cQuery+= " AND CT2_DATA = '"+cpData+"' "
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRX", .T., .F. )
if TRX->(!eof())
	nregCT2:=TRX->QTDREG
endif
TRX->(DbCloseArea())


cQuery:= " SELECT COUNT(*) AS QTDREG "
cQuery+= " FROM  "+retsqlname("ZZ2")+" ZZ2 "
cQuery+= " WHERE ZZ2.D_E_L_E_T_ = ' ' "
cQuery+= " AND ZZ2_DATA = '"+cpData+"' "
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRX", .T., .F. )
if TRX->(!eof())
	nregZZ2:=TRX->QTDREG
endif
TRX->(DbCloseArea())

if nRegZZ2 != 0 .and. nRegCT2 == 0
	lRet:=.t.
else 
	lRet:=.f.
endif

return lRet
                                                                     

Static Function ajustBanco()
Local nqtdreg:=0
Local aDados:={}

aAdd(aDados,{'237','0199','6'})
aAdd(aDados,{'237','0250','0'})
aAdd(aDados,{'237','0257','7'})
aAdd(aDados,{'237','0265','8'})
aAdd(aDados,{'237','0267','4'})
aAdd(aDados,{'237','0506','1'})
aAdd(aDados,{'237','0579','7'})
aAdd(aDados,{'237','0604','1'})
aAdd(aDados,{'237','0626','2'})
aAdd(aDados,{'237','0737','4'})
aAdd(aDados,{'237','0819','2'})
aAdd(aDados,{'237','0820','6'})
aAdd(aDados,{'237','0901','6'})
aAdd(aDados,{'237','0903','2'})
aAdd(aDados,{'237','1112','6'})
aAdd(aDados,{'237','1175','4'})
aAdd(aDados,{'237','1245','9'})
aAdd(aDados,{'237','1484','2'})
aAdd(aDados,{'237','1660','8'})
aAdd(aDados,{'237','1706','0'})
aAdd(aDados,{'237','1840','6'})
aAdd(aDados,{'237','1874','0'})
aAdd(aDados,{'237','1879','1'})
aAdd(aDados,{'237','1894','5'})
aAdd(aDados,{'237','1901','1'})
aAdd(aDados,{'237','1923','2'})
aAdd(aDados,{'237','2219','5'})
aAdd(aDados,{'237','2255','1'})
aAdd(aDados,{'237','2321','3'})
aAdd(aDados,{'237','2344','2'})
aAdd(aDados,{'237','2443','0'})
aAdd(aDados,{'237','2478','3'})
aAdd(aDados,{'237','2488','0'})
aAdd(aDados,{'237','2644','1'})
aAdd(aDados,{'237','2711','1'})
aAdd(aDados,{'237','2808','8'})
aAdd(aDados,{'237','2886','0'})
aAdd(aDados,{'237','3123','2'})
aAdd(aDados,{'237','3243','3'})
aAdd(aDados,{'237','3288','3'})
aAdd(aDados,{'237','3345','6'})
aAdd(aDados,{'237','3678','1'})
aAdd(aDados,{'237','3681','1'})
aAdd(aDados,{'151','0014','1'})

ProcRegua(len(aDados))
For i:=1 to LEN(aDados)
	incProc()
	_cUpdate := " UPDATE " + RetSqlName("SA2")
	_cUpdate += " SET A2_AGENCIA = '"+aDados[i,2]+aDados[i,3]+"'"
	_cUpdate += " WHERE D_E_L_E_T_ = ' '"
	_cUpdate += " AND A2_FILIAL    = '" + XFILIAL("SA2") + "'"
	_cUpdate += " AND A2_BANCO     = '" + aDados[i,1] + "'"
	_cUpdate += " AND A2_AGENCIA   = '" + aDados[i,2] +"'"
	TCSqlExec(_cUpdate)
Next i

return


Static Function incForne(xCNPJ)

aadd(_aFornecedores,{"A2_FILIAL"  ,xfilial("SA2")               ,Nil}) // FILIAL
aadd(_aFornecedores,{"A2_COD" 		,NewCodFor()	              ,Nil}) // TIPO DE CLIENTE /FORNECEDOR
aadd(_aFornecedores,{"A2_LOJA"    ,"0001"		                 ,Nil}) // LOJA
aadd(_aFornecedores,{"A2_NOME"    ,"****"		                 ,Nil}) // NOME
aadd(_aFornecedores,{"A2_NREDUZ"  ,"****"			               ,Nil}) // NOME REDUZIDO
aadd(_aFornecedores,{"A2_END"     ,"****"                  ,Nil}) // ENDERECO
aadd(_aFornecedores,{"A2_BAIRRO"  ,"****"               ,Nil}) // BAIRRO
aadd(_aFornecedores,{"A2_MUN"     ,"***"                  ,Nil}) // MUNICIPIO
aadd(_aFornecedores,{"A2_TIPO"    ,IIF(LEN(xCNPJ)<14,"F","J")               ,Nil}) // PESSOA FISICA OU JURIDICA
aadd(_aFornecedores,{"A2_CGC"     ,xCNPJ                  ,Nil}) // CGC
aadd(_aFornecedores,{"A2_INSCR"   ,SA1->A1_INSCR                ,Nil}) // INSCRICAO
	
IF Len(_aFornecedores) > 0
	MSExecAuto({|x,y,z|mata020(x,y,z)},_aFornecedores,,3) // SIGA AUTO PARA A INCLUSÃO DO FORNECEDORFornecedor
	If lMsErroAuto
		mostraErro()
		DisarmTransaction()
	EndIf
EndIf

return 


Static function newcodfor()



Return