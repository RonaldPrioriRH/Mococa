#INCLUDE "TopConn.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³RelPdCtb  ºAutor  ³**********************ºData³  05/03/2018 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Relatório Consiliação Contabil Mococa	  				  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ * Consiliação Contb. Mococa						          º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function RelPdCtb()

wnrel        := "RelPdCtb" // Coloque aqui o nome do arquivo usado para impressao em disco
cDesc1       := "Este programa tem como objetivo imprimir relatório "
cDesc2       := "Produção"
cDesc3       := "Pedreira"
cString      := "CT2"
cPict        := ""
//               000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111112222222222222222222222
//               000000000011111111112222222222333333333344444444445555555555666666666677777777778888888888999999999900000000001111111111222222222233333333334444444444555555555566666666667777777777888888888899999999990000000000111111111122
//               012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901
//Cabec1 :=       "COD. Descricao            Previsao" 
Cabec1 :=       "Nome                  Pref  Numero    Parc  Tipo  Natur  Codigo    Loja   Lançamento   Vlr Titulo     Sld Financ        Sld Contabil          Diferença "          
Cabec2 :=       ""
aReturn      := { "Zebrado", 1, "Administracao", 1, 2, 1, "", 1}
nomeprog     := "RelPdCtb" // Coloque aqui o nome do programa para impressao no cabecalho
tamanho      := "G"
aLinha       := {}
nLastKey     := 0
cPerg        := "PED029"    
m_pag        := 1  
titulo       := "Conciliação"


Pergunte(cPerg,.F.)

wnrel := SetPrint(cString,NomeProg,cPerg,@titulo,cDesc1,cDesc2,cDesc3,.F.,,.T.,Tamanho,,.T.)

If nLastKey == 27
	Return
Endif
                         	
SetDefault(aReturn,cString)

nTipo := IF(aReturn[4]==1,15,18) 

titulo := "Conciliação" 
                                     

//MV_PFDUPL = 1130400001=NF;FT
//MV_PFADTO = 2110100001=NDF;PA
//MV_PCDUPL = 1120100001=0;   ; 01;FT;NF;OP;RC;TF
//MV_PCCHEQ = 1120200001=CH
//MV_PCCART = 1120200009=CC
//MV_PCADTO = 2110600003=NCC;RA                        

cFilFor:= alltrim(substr(GETMV("MV_PFDUPL",,""),1,10))
  
IF ALLTRIM(MV_PAR09) = substr(GETMV("MV_PFDUPL",,""),1,10)
   cFilTp := alltrim(substr(GETMV("MV_PFDUPL",,""),12,50))
   msginfo("Será considerado os tipos do parametro MV_PFDUPL: "+alltrim(GETMV("MV_PFDUPL")),"Atenção")
ELSEIF ALLTRIM(MV_PAR09) = substr(GETMV("MV_PFADTO",,""),1,10)
   cFilTp := alltrim(substr(GETMV("MV_PFADTO",,""),12,50))
   msginfo("Será considerado os tipos do parametro MV_PFADTO: "+alltrim(GETMV("MV_PFADTO")),"Atenção")
ELSEIF ALLTRIM(MV_PAR09) = substr(GETMV("MV_PCDUPL",,""),1,10)
   cFilTp := alltrim(substr(GETMV("MV_PCDUPL",,""),12,50))   
   msginfo("Será considerado os tipos do parametro MV_PCDUPL: "+alltrim(GETMV("MV_PCDUPL")),"Atenção")
ELSEIF ALLTRIM(MV_PAR09) = substr(GETMV("MV_PCCHEQ",,""),1,10)
   cFilTp := alltrim(substr(GETMV("MV_PCCHEQ",,""),12,50))
   msginfo("Será considerado os tipos do parametro MV_PCCHEQ: "+alltrim(GETMV("MV_PCCHEQ")),"Atenção")
ELSEIF ALLTRIM(MV_PAR09) = substr(GETMV("MV_PCCART",,""),1,10)
   cFilTp := alltrim(substr(GETMV("MV_PCCART",,""),12,50))
   msginfo("Será considerado os tipos do parametro MV_PCCART: "+alltrim(GETMV("MV_PCCART")),"Atenção")
ELSEIF ALLTRIM(MV_PAR09) = substr(GETMV("MV_PCADTO",,""),1,10)
   cFilTp := alltrim(substr(GETMV("MV_PCADTO",,""),12,50))
   msginfo("Será considerado os tipos do parametro MV_PCADTO: "+alltrim(GETMV("MV_PCADTO")),"Atenção")
ELSE
   cFilTp := ""
ENDIF                      
                         
                        
IF MV_PAR03 = 1
	cQuery :=   " SELECT E2_PREFIXO PREFIXO,E2_NUM NUMERO,E2_PARCELA PARCELA,E2_TIPO TIPO,E2_NATUREZ NATUREZA,E2_FORNECE CODIGO,E2_LOJA LOJA,E2_VALOR VALOR,E2_NOMFOR NOME ,E2_FILIAL FILIAL, E2_EMIS1 LANCADA, A2_CONTA CONTABIL "
	cQuery +=   " FROM "
	cQuery +=    RetSqlName("SE2")+" SE2, "
	cQuery +=    RetSqlName("SA2")+" SA2  "	
    cQuery +=   " WHERE E2_FORNECE = A2_COD "
	cQuery +=   " AND E2_FILIAL = '" +xFilial("SE2")+"'"
	cQuery +=   " AND E2_EMIS1   >= '" + dtos(mv_par01) +"'"
	cQuery +=   " AND E2_EMIS1   <= '" + dtos(mv_par02) +"'"
	cQuery +=   " AND E2_FORNECE >= '" + mv_par04 +"'"
	cQuery +=   " AND E2_FORNECE <= '" + mv_par05 +"'"   
	cQuery +=   " AND A2_CONTA    = '" + cFilFor  +"'"   
	if !empty(cFilTp)
	    cQuery +=   " AND TRIM(E2_TIPO) IN "  + FormatIn(cFilTp,";")
	endif
	cQuery +=   " AND SE2.D_E_L_E_T_ <> '*' "
	cQuery +=   " AND SA2.D_E_L_E_T_ <> '*' "	
	TCQUERY cQuery NEW ALIAS "TRBSE2"
	TRBSE2->(dbGoTop())
	cArqTmp := CriaTrab(NIL,.F.)
	DBSelectArea("TRBSE2")
	TcSetField("TRBSE2","VALOR","N",17,02)
	copy to &cArqTmp
	DBUSEAREA(.T.,,cArqTmp,"cArqTmp",.T.,.T.)
	TRBSE2->(DBCLOSEAREA())
	cIndTmp := CriaTrab(Nil,.F.)
	cChaTmp := "CODIGO+LOJA+LANCADA+PREFIXO+NUMERO+PARCELA"
	indregua("cArqTmp",cIndTmp,cChaTmp)
ELSEIF MV_PAR03 = 2
	cQuery :=   " SELECT E1_PREFIXO PREFIXO,E1_NUM NUMERO,E1_PARCELA PARCELA,E1_TIPO TIPO,E1_NATUREZ NATUREZA,E1_CLIENTE CODIGO,E1_LOJA LOJA, E1_VALOR VALOR,E1_NOMCLI NOME,E1_FILIAL FILIAL,E1_EMIS1 LANCADA "
	cQuery +=   " FROM "+ RetSqlName("SE1")+" SE1 "
	cQuery +=   " WHERE E1_FILIAL = '" +xFilial("SE1")+"'"
	cQuery +=   " AND E1_EMIS1   >= '" + dtos(mv_par01) +"'"
	cQuery +=   " AND E1_EMIS1   <= '" + dtos(mv_par02) +"'"
	cQuery +=   " AND E1_CLIENTE >= '" + mv_par04 +"'"
	cQuery +=   " AND E1_CLIENTE <= '" + mv_par05 +"'"   
	if !empty(cFilTp)
	    cQuery +=   " AND TRIM(E1_TIPO) IN "  + FormatIn(cFilTp,";")
	endif
	cQuery +=   " AND SE1.D_E_L_E_T_ <> '*' "
	TCQUERY cQuery NEW ALIAS "TRBSE1"
	TRBSE1->(dbGoTop())
	cArqTmp := CriaTrab(NIL,.F.)
	DBSelectArea("TRBSE1") 
	TcSetField("TRBSE1","VALOR","N",17,02)
	copy to &cArqTmp
	DBUSEAREA(.T.,,cArqTmp,"cArqTmp",.T.,.T.)
	TRBSE1->(DBCLOSEAREA())
	cIndTmp := CriaTrab(Nil,.F.)
	cChaTmp := "CODIGO+LOJA+LANCADA+PREFIXO+NUMERO+PARCELA"
	indregua("cArqTmp",cIndTmp,cChaTmp)
ELSE          
    cQuery :=   " SELECT CT4_ITEM ITEM,CT4_CONTA CONTA,A2_COD CODIGO,A2_LOJA LOJA,A2_NOME NOME,A2_CONTA CONTABIL "
	cQuery +=   " FROM "
	cQuery +=    RetSqlName("CT4")+" CT4, "
	cQuery +=    RetSqlName("SA2")+" SA2  "	
    cQuery +=   " WHERE SUBSTR(CT4_ITEM,2,6) = A2_COD "
    cQuery +=   " AND  SUBSTR(CT4_ITEM,8,2) = A2_LOJA "
    cQuery +=   " AND SUBSTR(CT4_ITEM,1,1) = 'F' "
    cQuery +=   " AND CT4_CONTA = '" + cFilFor  +"'"   
    cQuery +=   " AND A2_CONTA <> '" + cFilFor  +"'"   
	cQuery +=   " AND CT4.D_E_L_E_T_ <> '*' "
	cQuery +=   " AND SA2.D_E_L_E_T_ <> '*' "	
    cQuery +=   " GROUP BY CT4_ITEM,CT4_CONTA,A2_COD,A2_LOJA,A2_NOME,A2_CONTA "
	TCQUERY cQuery NEW ALIAS "TRBSE2"
	TRBSE2->(dbGoTop())
	cArqTmp := CriaTrab(NIL,.F.)
	DBSelectArea("TRBSE2")
	copy to &cArqTmp
	DBUSEAREA(.T.,,cArqTmp,"cArqTmp",.T.,.T.)
	TRBSE2->(DBCLOSEAREA())
	cIndTmp := CriaTrab(Nil,.F.)
	cChaTmp := "CODIGO+LOJA"
	indregua("cArqTmp",cIndTmp,cChaTmp)


ENDIF



RptStatus({||imprime()})      

dbcommitall()
               
OURSPOOL(wnRel) 

cArqTmp->(DBCLOSEAREA()) 
fErase(cArqTmp+GetDBExtension())
fErase(cIndTmp+OrdBagext())

return
                 
Static function imprime 

Private cbCont := 0 
Private cbtxt  := ""
nLin           := 80 
cAliasTit	   := ""
CCusto         := ""            
cConta         := MV_PAR09
nTSaldo        := 0
nTGSaldo       := 0
nTGItem        := 0
nTGDifer       := 0


setregua(cArqTmp->(recCount()))

if lEnd
   @PROW()+1,0 PSAY "Cancelado pelo operador"
endif

dbSelectArea("cArqTmp") 

IF MV_PAR03 = 1 .OR. MV_PAR03 = 2 
   
Do while ! cArqTmp->(EOF()) 
       
      cCodigo := cArqTmp->CODIGO
      cNome   := cArqTmp->NOME
      cLoja   := cArqTmp->LOJA

      if MV_PAR03 = 1 
         cMovFin   := "P" 
         cAliasTit := "SE2"
         Item      := "F"+cArqTmp->CODIGO+cArqTmp->LOJA 
         lImpTit   := SE2->( MsSeek( xFilial("SE2")+(cAliasTit)->(cArqTmp->PREFIXO+cArqTmp->NUMERO+cArqTmp->PARCELA+cArqTmp->TIPO+cArqTmp->CODIGO+cArqTmp->LOJA ) ) )
      else 
         cMovFin   := "R"
         Item      := "C"+cArqTmp->CODIGO+cArqTmp->LOJA 
         cAliasTit := "SE1"
         lImpTit   := SE1->( MsSeek( xFilial("SE2")+(cAliasTit)->(cArqTmp->PREFIXO+cArqTmp->NUMERO+cArqTmp->PARCELA+cArqTmp->TIPO+cArqTmp->CODIGO+cArqTmp->LOJA ) ) )
      endif      

      if nLin > 55
         cabec(Titulo, Cabec1, Cabec2, nomeprog,Tamanho, nTipo)
         nLin := 09
      endif       
      
      _nSaldo   := SaldoTit(cArqTmp->PREFIXO,cArqTmp->NUMERO,cArqTmp->PARCELA,cArqTmp->TIPO,cArqTmp->NATUREZA,cMovFin,cArqTmp->CODIGO,1,MV_PAR06,MV_PAR06,cArqTmp->LOJA)  
      nTSaldo   += _nSaldo 

      if MV_PAR10 = 1                      
         @nlin,000 PSAY cNome
         @nlin,022 PSAY cArqTmp->PREFIXO
         @nlin,028 PSAY cArqTmp->NUMERO
         @nlin,038 PSAY cArqTmp->PARCELA
         @nlin,044 PSAY cArqTmp->TIPO
         @nlin,050 PSAY cArqTmp->NATUREZA
         @nlin,058 PSAY cCodigo
         @nlin,068 PSAY cLoja
         @nlin,075 PSAY stod(cArqTmp->LANCADA)
         @nlin,085 PSAY TRANSFORM(cArqTmp->VALOR, "@E 9,999,999.99")
         _nSldItem := SALDOITEM(cConta,CCusto,Item,stod(cArqTmp->LANCADA),"01","1",1) 
         if substr(cConta,1,1) = "1" 
           _nSldItem := _nSldItem * -1
         endif
         @nlin,100 PSAY TRANSFORM(_nSaldo,   "@E 9,999,999.99")
         @nlin,120 PSAY TRANSFORM(_nSldItem, "@E 9,999,999.99")
         nLin++               
      endif

      dbSelectArea("cArqTmp")
      cArqTmp->(DBSkip())       
      
      if cCodigo <> cArqTmp->CODIGO
         nTItem := SALDOITEM(cConta,CCusto,Item,MV_PAR06,"01","1",1) 
         if substr(cConta,1,1) = "1" 
           nTItem := nTItem * -1
         endif

         if MV_PAR10 = 1 .or. MV_PAR10 = 2 .or. (MV_PAR10 = 3 .and. nTSaldo-nTItem <> 0) 
            if(MV_PAR10 = 1,nLin++,)
            @nlin,000 PSAY substr(cNome,1,15)
            @nlin,017 PSAY substr(alltrim(cConta)+" - " + alltrim(Posicione("CT1",1,xFilial("CT1")+cConta,"CT1_DESC01")),1,38)            
            @nlin,057 PSAY cCodigo
            @nlin,067 PSAY cLoja
            @nlin,074 PSAY "Saldo em "
            @nlin,086 PSAY MV_PAR06
            @nlin,099 PSAY TRANSFORM(nTSaldo, "@E 9,999,999.99")
            @nlin,119 PSAY TRANSFORM(nTItem,  "@E 9,999,999.99")
            @nlin,139 PSAY TRANSFORM(nTSaldo-nTItem, "@E 9,999,999.99") 
            nTGSaldo +=nTSaldo
            nTGItem  +=nTItem
            nTGDifer +=(nTSaldo-nTItem) 
            if(MV_PAR10 = 1,nLin++,)               
            nLin++
         endif
         nTSaldo        := 0
      endif 
      
      loop               
      IncRegua()  
    
enddo  
            nLin++
            @nlin,074 PSAY "Total Geral "
            @nlin,099 PSAY TRANSFORM(nTGSaldo, "@E 9,999,999.99")
            @nlin,119 PSAY TRANSFORM(nTGItem,  "@E 9,999,999.99")
            @nlin,139 PSAY TRANSFORM(nTGDifer, "@E 9,999,999.99") 


ELSE



Do while ! cArqTmp->(EOF()) 
       
      cCodigo := cArqTmp->CODIGO
      cNome   := cArqTmp->NOME
      cLoja   := cArqTmp->LOJA 
      Item    := cArqTmp->ITEM
      cConta  := cArqTmp->CONTA

      if nLin > 55
         cabec(Titulo, Cabec1, Cabec2, nomeprog,Tamanho, nTipo)
         nLin := 09
      endif       
      
      nTItem := SALDOITEM(cConta,CCusto,Item,MV_PAR06,"01","1",1) 
     
      if substr(cConta,1,1) = "1" 
         nTItem := nTItem * -1
      endif

      if nTItem <> 0 
         @nlin,000 PSAY substr(cNome,1,15)
         @nlin,017 PSAY substr(alltrim(cConta)+" - " + alltrim(Posicione("CT1",1,xFilial("CT1")+cConta,"CT1_DESC01")),1,38)            
         @nlin,057 PSAY cCodigo
         @nlin,067 PSAY cLoja
         @nlin,074 PSAY "Saldo em "
         @nlin,086 PSAY MV_PAR06
         @nlin,119 PSAY TRANSFORM(nTItem,  "@E 9,999,999.99")  
         @nlin,160 PSAY if(empty(cArqTmp->CONTABIL),"Defina Fornecedor A2_CONTA",cArqTmp->CONTABIL) 
         nLin++
      endif 

      cArqTmp->(DBSkip())       
      
      loop               
      
      IncRegua()  
    
enddo  


ENDIF

roda(cbcont,cbtxt,tamanho)          

return // fim função imprime        
