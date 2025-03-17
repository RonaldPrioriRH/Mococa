#include "PROTHEUS.CH"
#INCLUDE "rwmake.ch"
#INCLUDE "TOPCONN.ch"
#INCLUDE "FWBROWSE.CH"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRFINA014   บAutor  ณMicrosiga           บ Data ณ  01/24/13  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ 	Rotina para Excluir Titulos do Bordero                    บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function RFINA014()

Local aEstrut     	:= {}     
Local cQuery      	:= ""     
Local nX          	:= 0
Local aCposBrw	   	:= {}	
Local cEmissDe 		:= ""
Local cEmissAte 	:= ""
Local cVencDe   	:= ""
Local cVencAte 		:= ""
Local cBanco 		:= Space(3)
Local cOrdem 		:= ""                  
Local lPerguntaOK	:= .T.   
Local cPulaLinha	:= CHR(13) + CHR(10)

Private cPerg			:= "EFIN901"

CriaPerguntas(@cEmissDe,@cEmissAte,@cVencDe,@cVencAte,@cBanco,@cOrdem,@lPerguntaOK)
pergunte(cPerg,.F.)

	cQuery:="SELECT * FROM "+RETSQLNAME("SE1")+" E1 					 " + cPulaLinha
 	cQuery+="WHERE E1_EMISSAO BETWEEN '"+cEmissDe+"' AND '"+cEmissAte+"' " + cPulaLinha
 	cQuery+="AND E1_VENCTO BETWEEN '"+cVencDe+"' AND '"+cVencAte+"' 	 " + cPulaLinha
 	cQuery+="AND E1_PORTADO LIKE '%"+MV_PAR05+"%' 						 " + cPulaLinha
   	cQuery+="AND E1_SALDO <> 0  										 " + cPulaLinha
 	cQuery+="AND E1_SITUACA <> '2' 										 " + cPulaLinha
  	cQuery+="AND E1.D_E_L_E_T_ <> '*' 									 " + cPulaLinha
	cQuery+="ORDER BY "+cOrdem+" 										 " + cPulaLinha
	
If !lPerguntaOK
	MsgAlert("Nใo existem registros para serem exibidos.")
	Return 
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณAbrir a Query ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
aCampos := {}                                           
aadd(aCampos,{ "E1_OK"		   	,"C"	,02,0 })   
aadd(aCampos,{ "E1_NUMBCO"   	,"C"	,len(SE1->E1_NUMBCO),0 })
aadd(aCampos,{ "E1_IDCNAB"   	,"C"	,len(SE1->E1_IDCNAB),0 })
aadd(aCampos,{ "E1_EMISSAO" 	,"D"	,08,0 })                     
aadd(aCampos,{ "E1_PREFIXO"		,"C"	,len(SE1->E1_PREFIXO),0}) 
aadd(aCampos,{ "E1_NUM"			,"C"	,len(SE1->E1_NUM),0 })
aadd(aCampos,{ "E1_PARCELA"		,"C"	,len(SE1->E1_PARCELA),0 })
aadd(aCampos,{ "E1_CLIENTE"		,"C"	,len(SE1->E1_CLIENTE),0 })
aadd(aCampos,{ "E1_NOMCLI"		,"C"	,len(SE1->E1_NOMCLI),0 })
aadd(aCampos,{ "E1_LOJA"  		,"C"	,len(SE1->E1_LOJA),0 })
aadd(aCampos,{ "E1_VENCTO" 		,"D"	,08,0 })
aadd(aCampos,{ "E1_VENCREA"		,"D"	,08,0 })
aadd(aCampos,{ "E1_VLCRUZ"		,"N"	,15,2 })  
aadd(aCampos,{ "E1_SALDO"		,"N"	,15,2 })  
aadd(aCampos,{ "E1_NCC"	      	,"N"	,08,2 })
aadd(aCampos,{ "E1_RA"	      	,"N"	,08,2 })
aadd(aCampos,{ "E1_CARGA"		,"C"	,06,0})
aadd(aCampos,{ "E1_NUMBOR"		,"C"	,06,0})
aadd(aCampos,{ "E1_TIPO"		,"C"	,03,0})
aadd(aCampos,{ "E1_NATUREZ"		,"C"	,10,0 })
aadd(aCampos,{ "E1_PORTADO"		,"C"	,03,0})
aadd(aCampos,{ "E1_FILIAL"	   	,"C"	,04,0 })
aadd(aCampos,{ "E1_VEND1"	   	,"C"	,06,0 })
aadd(aCampos,{ "E1_DESCFIN"		,"N"	,06,2 }) 

cArqSE1  := CriaTrab(aCampos, .T.)
cNtxSE1  := CriaTrab(nil,.f.)
dbUseArea(.T.,__LocalDriver,cArqSE1,"TSE1",.F.)

Processa({|| SqlToTrb(cQuery, aCampos, "TSE1")}) // Cria arquivo temporario
Do Case
	Case MV_PAR06 == 1                                                         
		INDEX ON E1_FILIAL+DTOS(E1_EMISSAO) TO &cNtxSE1
	Case MV_PAR06 == 2
		INDEX ON E1_FILIAL+DTOS(E1_VENCREA) TO &cNtxSE1
	Case MV_PAR06 == 3
		INDEX ON E1_FILIAL+E1_NUM+E1_PARCELA+E1_TIPO TO &cNtxSE1
EndCase

cMarca:=GetMark()
cMarca:=soma1(cMarca)

aStruSE1	:= {		{"E1_OK" 					,""					,02,0},;  
						{"E1_FILIAL" 				,"Filial"			,(SE1->E1_FILIAL),0},; 
						{"E1_NUMBCO" 				,"Nosso Num"		,len(SE1->E1_NUMBCO),0},; 
						{"E1_IDCNAB" 				,"ID Cnab"			,len(SE1->E1_IDCNAB),0},; 
                        {"E1_NUM" 					,"Titulo"			,len(SE1->E1_NUM),0},;
                        {"E1_VENCTO" 				,"Dt. Vencto"		,08,0},;//	,"@D 99/99/9999"},;
 						{"E1_VENCREA"				,"Dt. Vencto Real"	,08,0},;
                        {"E1_VLCRUZ"				,"Valor"			,"@E 999,999.99"},;
                        {"E1_CLIENTE" 				,"Cliente"			,len(SE1->E1_CLIENTE),0},; 
                        {"E1_NOMCLI" 				,"Nome Cliente"		,len(SE1->E1_NOMCLI),0},;
                        {"E1_LOJA" 					,"Loja"				,len(SE1->E1_LOJA),0},; 
                        {"E1_EMISSAO" 				,"Dt. Emissใo"		,08,0},;//	,"@D 99/99/9999"},;
                        {"E1_PREFIXO" 				,"Prefixo"			,len(SE1->E1_PREFIXO),0},;
                        {"E1_PARCELA" 				,"Parcela"			,len(SE1->E1_PARCELA),0},;  
                        {"E1_RA" 					,"RA"				,"@E 999,999.99"},;                                                                                                                          
                        {"E1_NCC" 					,"NCC"				,"@E 999,999.99"},;                                                                                                                          
                        {"E1_TIPO" 					,"Tipo"				,03,0},;
                        {"E1_CARGA" 				,"Carga"			,06,0},;
                        {"E1_NUMBOR" 				,"Bordero"			,06,0},;
                        {"E1_NATUREZ" 				,"Natureza"			,10,0},;
                        {"E1_VEND1" 				,"Vendedor"			,06,0},;
                        {"E1_PORTADO" 				,"Portado"			,03,0} }

TSE1->( dbGotop() )

@ 001,001 TO 400,700 DIALOG oDlg TITLE "Sele็ใo de Titulos"
@ 001,001 TO 170,350 BROWSE "TSE1" FIELDS aStruSE1 MARK "E1_OK"  Object oBrowIncPed

oBtn1 := tButton():New(180,050,"Desmarca Todos   " ,oDlg,{|| fMarTudo(cMarca,1)},060,015,,,,.T.)
oBtn2 := tButton():New(180,110,"Marca Todos      " ,oDlg,{|| fMarTudo(cMarca,2)},060,015,,,,.T.)
oBtn3 := tButton():New(180,170,"Inverte Sele็ใo  " ,oDlg,{|| fMarTudo(cMarca,3)},060,015,,,,.T.)
oBtn4 := tButton():New(180,230,"Limpa Border๔    " ,oDlg,{|| lExec := .T.,LimpaBor(),Close(oDlg)},060,015,,,,.T.)
oBtn4 := tButton():New(180,290,"    Cancelar     " ,oDlg,{|| lExec := .F.,Close(oDlg)},060,015,,,,.T.)

ACTIVATE DIALOG oDlg CENTERED

TSE1->( dbCloseArea() )
fErase(cArqSE1 + ".DBF")
fErase(cNtxSE1 + ordBagExt())

return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณEFIN901   บAutor  ณ				    บ Data ณ  09/01/2013 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Fun็ใo para criar as perguntas do relatorio                บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                      บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function CriaPerguntas(cEmissDe,cEmissAte,cVencDe,cVencAte,cBanco,cOrdem)

Default cPerg		:= "EFIN901"
Default cEmissDe 	:= ""
Default cEmissAte 	:= ""
Default cVencDe   	:= ""
Default cVencAte 	:= ""
Default cBanco 		:= Space(3)
Default cOrdem 		:= ""

AjustaSx1(cPerg)
if pergunte(cPerg,.T.) //Chama a tela de parametros
	
	cEmissDe  		:= DTOS(mv_par01)
	cEmissAte  		:= DTOS(mv_par02)	
	cVencDe			:= DTOS(mv_par03) 
	cVencAte  		:= DTOS(mv_par04)
		
	if mv_par06 == 1
		cOrdem  := "E1.E1_VALOR"
	elseif mv_par06 == 2 
		cOrdem	:= "E1.E1_EMISSAO"
	elseif mv_par06 == 3
		cOrdem 	:= "E1.E1_VENCREA"
	elseif mv_par06 == 4
		cOrdem  := "E1.E1_NUM"
	endif
	
	lPerguntaOK := .T.
	
else
	
	lPerguntaOK := .F.
	
endif


Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณEFIN901   บAutor  ณ				    บ Data ณ  09/01/2013 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Fun็ใo que cria as perguntas na SX1                        บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                      บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function AjustaSX1(cPerg)

Local aRegs   	:= {}
Local nI 		:= 0

Default cPerg		:= "EFIN901"

aAdd(aRegs,{cPerg,'01','Emissao De  '                    ,'','','mv_ch1','D', 08,0,0,'G','','mv_par01','','','','','',''})
aAdd(aRegs,{cPerg,'02','Emissao At้ '                    ,'','','mv_ch2','D', 08,0,0,'G','','mv_par02','','','','','',''})
aAdd(aRegs,{cPerg,'03','Vencto De '                    	 ,'','','mv_ch3','D', 08,0,0,'G','','mv_par03','','','','','',''})
aAdd(aRegs,{cPerg,'04','Vencto Ate '                     ,'','','mv_ch4','D', 08,0,0,'G','','mv_par04','','','','','',''})
aAdd(aRegs,{cPerg,'05','Banco'                       	 ,'','','mv_ch5','C', 03,0,0,'G','','mv_par05','','','','','','SA6'})
aAdd(aRegs,{cPerg,'06','Ordem '                 		 ,'','','mv_ch6','N', 01,0,1,'C','','mv_par06','Emissao','Vencimento','Titulo','','',''})

dbSelectArea('SX1')
SX1->(dbSetOrder(1))

For nI :=1 to Len(aRegs)
	If  RecLock('SX1',Iif(!SX1->(DbSeek(PadR(aRegs[nI][01],10)+aRegs[nI][02])),.T.,.F.))
		Replace SX1->X1_GRUPO       With aRegs[nI][01]
		Replace SX1->X1_ORDEM       With aRegs[nI][02]
		Replace SX1->X1_PERGUNTE    With aRegs[nI][03]
		Replace SX1->X1_PERSPA      With aRegs[nI][04]
		Replace SX1->X1_PERENG      With aRegs[nI][05]
		Replace SX1->X1_VARIAVL     With aRegs[nI][06]
		Replace SX1->X1_TIPO        With aRegs[nI][07]
		Replace SX1->X1_TAMANHO     With aRegs[nI][08]
		Replace SX1->X1_DECIMAL     With aRegs[nI][09]
		Replace SX1->X1_PRESEL      With aRegs[nI][10]
		Replace SX1->X1_GSC         With aRegs[nI][11]
		Replace SX1->X1_VALID       With aRegs[nI][12]
		Replace SX1->X1_VAR01       With aRegs[nI][13]
		Replace SX1->X1_DEF01       With aRegs[nI][14]
		Replace SX1->X1_DEF02       With aRegs[nI][15]
		Replace SX1->X1_DEF03       With aRegs[nI][16]
		Replace SX1->X1_DEF04       With aRegs[nI][17]
		Replace SX1->X1_DEF05       With aRegs[nI][18]
		Replace SX1->X1_F3          With aRegs[nI][19]
		MsUnlock('SX1')
	Else
		Help('',1,'REGNOIS')
	Endif
Next nI

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณPrograma  ณ  fMarTudoณ Autor ณ Brando                ณ Data ณ 19/07/07 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescri…o ณ IMPRESSAO DO BOLETO LASER COM CODIGO DE BARRAS		      ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
/*/
STATIC Function fMarTudo(cMarca, ltudo)
Local aArea := TSE1->(GetArea())

TSE1->( dbGoTop() )

While !TSE1->( Eof() )

	RecLock("TSE1",.F.)
	if lTudo == 1        // Marca todos os Itens
		TSE1->E1_OK := cMarca

	elseIf lTudo == 2   // Desmarca todos os itens
		TSE1->E1_OK := "  "

	else                   // Inverte a Sele็ใo

		if TSE1->E1_OK != "  "
			TSE1->E1_OK := "  "
		else
			TSE1->E1_OK := cMarca
		endif

	endIf
	
	TSE1->( MsUnLock() )
	TSE1->( dbSkip() )

Enddo     

RestArea(aArea)

oDlg:Refresh()

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณEFIN901   บAutor  ณMicrosiga           บ Data ณ  01/29/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
STATIC FUNCTION LimpaBor()

Local aArea := TSE1->(GetArea())

TSE1->( dbGoTop() )

While !TSE1->( Eof() )

	if TSE1->E1_OK != cMarca        
		//Marca Como deletado o movimento do bordero referente ao titulo
		DBSELECTAREA("SEA")
		SEA->(DBSETORDER(1))
		IF SEA->(DBSEEK(XFILIAL("SEA")+TSE1->(E1_NUMBOR+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO+E1_CLIENTE+E1_LOJA)))
			RECLOCK("SEA",.F.)
			
			SEA->(DBDELETE())//DELETA A LINHA
			
			SEA->(MSUNLOCK())
		ENDIF			
		//Altera informacoes do titulo	
		DBSELECTAREA("SE1")
		SE1->(DBSETORDER(2))
		IF SE1->(DBSEEK(XFILIAL("SE1")+TSE1->(E1_CLIENTE+E1_LOJA+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO)))
			RECLOCK("SE1",.F.)
			//MUDAR OS CAMPOS
			SE1->E1_NUMBOR 		:= "    "
// 			SE1->E1_DATABOR		:= "    "
			SE1->E1_SITUACA		:= "0"
			
			SE1->(MSUNLOCK())
		ENDIF
		
	endIf
	
	TSE1->( dbSkip() )

Enddo     

RestArea(aArea)

RETURN