#Include "Protheus.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณTMKBARLA  บAutor  ณMicrosiga           บ Data ณ  12/05/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ O ponto de entrada TMKBARLA ้ chamado na cria็ใo da tela   บฑฑ
ฑฑบ          ณ do Atendimento do Call Cente com o objetivo de              บฑฑ
ฑฑบ          ณ incluir bot๕es de usuแrio na toolbar lateral.  
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function TMKBARLA(aBotao, aTitulo)

Local cFolUsr	:= Posicione("SU7",4,XFILIAL("SU7")+ __cUserId,"U7_TIPOATE")  // Acesso usuario 2= Televendas, 3 = Telecobranca

If cFolUsr <> '3'
	
	aAdd(aBotao,{"RELATORIO" , {|| U_RTMKE002(M->UC_CODIGO) } ,"Sac Service"})
else
	aAdd(aBotao,{"BMPVISUAL" , {|| ViewPosTit() } ,"Posicao Titulos"})
endif

Return(aBotao)

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑบออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออบฑฑ
ฑฑบPrograma  ณ ViewPosTit บ Autor ณ Raphael Martins  		 	 Dataณ 18/05/2017 บฑฑ
ฑฑบออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออบฑฑ
ฑฑบDesc.     ณ Fun็ใo de visualiza็ใo de posicao de Titulos do Atendimento		  บฑฑ
ฑฑบออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออบฑฑ
ฑฑบUso       ณ Mococa		                    			                      บฑฑ
ฑฑบออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออบฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/    
Static Function ViewPosTit()
                     
Local aArea		:= GetArea()
Local aAreaSE1	:= SE1->( GetArea() )
Local aAreaACF	:= ACF->( GetArea() )
Local aAreaACG	:= ACG->( GetArea() )     
Local nPosFil	:= 0 
Local nPosPref	:= 0 
Local nPosNum	:= 0 
Local nPosParc	:= 0 
Local nPosTipo	:= 0 
Local cFilTit	:= ""
Local cPrefixo	:= ""
Local cTitulo	:= ""
Local cParcela	:= ""
Local cTipo		:= ""  

SE1->( DbSetOrder( 1 ) )  //E1_FILIAL+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO 

//valido se a Grid da tela de atendimentos existe
If Type("oGetTlc") == 'O' 
	            
	//pego as posicoes da chave na grid de titulos
	nPosFil		:= Ascan(aHeader, {|x|AllTrim(x[2]) == "ACG_FILORI"})
	nPosPref	:= Ascan(aHeader, {|x|AllTrim(x[2]) == "ACG_PREFIX"})
	nPosNum		:= Ascan(aHeader, {|x|AllTrim(x[2]) == "ACG_TITULO"})
	nPosParc	:= Ascan(aHeader, {|x|AllTrim(x[2]) == "ACG_PARCEL"})
	nPosTipo	:= Ascan(aHeader, {|x|AllTrim(x[2]) == "ACG_TIPO"})
    
    cFilTit		:= Acols[N,nPosFil]
	cPrefixo	:= Acols[N,nPosPref]
	cTitulo		:= Acols[N,nPosNum]
	cParcela	:= Acols[N,nPosParc]
	cTipo		:= Acols[N,nPosTipo] 
    
    //posiciono no titulo pois a rotina Fc040Con pega o titulo posicionado
	If SE1->( DbSeek( cFilTit + cPrefixo + cTitulo + cParcela + cTipo ) )
	              
	    //rotina de posicao de titulos
		Fc040Con()
	
	else
		Help(,,'Help',,"Titulo do Atendimento nใo encontrado, favor verifique o mesmo!",1,0)	
	EndIf
	 
		
EndIf

RestArea(aArea) 
RestArea(aAreaSE1) 
RestArea(aAreaACF) 
RestArea(aAreaACG) 

Return()

