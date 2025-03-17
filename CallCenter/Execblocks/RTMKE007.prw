#Include "PROTHEUS.CH"
#include "topconn.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³RTMKE007  ºAutor  ³Raphael Martins Garciaº Data ³  04/05/2017±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Funcao para Reprocessar os clientes e gerar contatos a partir±
±±º          ³ dos mesmos	                                              º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Mococa													  º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function RTMKE007()

If MsgYesNo("Desejar gerar contatos a partir do cliente cadastrado?")
	FWMsgRun(,{|oSay| Reprocessa(oSay)},'Aguarde...','Carregando informacoes para reprocessamento...')
EndIf


Return()

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ºÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍº±±
±±ºPrograma  ³ Reprocessa º Autor ³ Raphael Martins		   º Data³ 21/06/2017 	  º±±
±±ºÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍº±±
±±ºDesc.     ³ Funcao para reprocessar os contatos a partir dos clientes   		  º±±
±±ºÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍº±±
±±ºUso       ³ Mococa	                    			                 	      º±±
±±ºÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍº±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/ 
Static Function Reprocessa(oSay)

Local aArea			:= GetArea()
Local aAreaSA1		:= SA1->( GetArea() )
Local aAreaSU5		:= SU5->( GetArea() )
Local aContato		:= {}
Local cCodigo		:= GetSxENum("SU5","U5_CODCONT")

Private lMsErroAuto	:= .F.

SA1->( DbSetOrder(1) ) //A1_FILIAL + A1_COD + A1_LOJA

SA1->( DbGotop() )

While SA1->( !EOF() )
	
	oSay:cCaption := ("Processando Cliente: " + SA1->A1_COD + " - " + SA1->A1_LOJA + " ")
	ProcessMessages()
	
	//valido se o codigo atribuido ja exista no cadastro de contatos
	While SU5->(DbSeek(xFilial("SU5") + cCodigo))
		ConfirmSX8()
		cCodigo := GetSxENum("SU5","U5_CODCONT")
	EndDo 
	
	BeginTran()
		
		AAdd(aContato,{"U5_FILIAL"		, xFilial("SU5") 															, Nil})
		AAdd(aContato,{"U5_CODCONT"	    , cCodigo																	, Nil})
		AAdd(aContato,{"U5_CONTAT"		, IIF(!Empty(SA1->A1_CONTATO),SA1->A1_CONTATO,SA1->A1_NOME)	                , Nil})
		AAdd(aContato,{"U5_END"			, Alltrim(SA1->A1_END)													  	, Nil})
		AAdd(aContato,{"U5_COMPEND"	    , Alltrim(SA1->A1_COMPLEM)											  	 	, Nil})
		AAdd(aContato,{"U5_BAIRRO"		, Alltrim(SA1->A1_BAIRRO)											  		, Nil})
		AAdd(aContato,{"U5_MUN"			, Alltrim(SA1->A1_MUN)											  	  		, Nil})
		AAdd(aContato,{"U5_EST"			, Alltrim(SA1->A1_EST)											  	  		, Nil})
		AAdd(aContato,{"U5_CEP"			, SA1->A1_CEP													  	 		, Nil})
		AAdd(aContato,{"U5_DDD"			, SA1->A1_DDD													  	 		, Nil})
		AAdd(aContato,{"U5_FCOM1"		, SA1->A1_TEL													  	 		, Nil})
		AAdd(aContato,{"U5_RG"			, SA1->A1_PFISICA													  		, Nil})
		AAdd(aContato,{"U5_URL"			, SA1->A1_HPAGE													  		    , Nil})
		AAdd(aContato,{"U5_EMAIL"		, SA1->A1_EMAIL													  		    , Nil})
		AAdd(aContato,{"U5_CPF"			, If(SA1->A1_PESSOA='F',SA1->A1_CGC,'')					 		            , Nil})
		AAdd(aContato,{"U5_ATIVO"		, "1"													  	  				, Nil})
		AAdd(aContato,{"U5_STATUS"		, '2'													  	 				, Nil})
		AAdd(aContato,{"U5_ORIGEM"		, FunName()													  				, Nil})
		AAdd(aContato,{"U5_CLIENTE"	    , SA1->A1_COD													  			, Nil})
		AAdd(aContato,{"U5_LOJA"	    , SA1->A1_LOJA													  			, Nil})
		
		lMsErroAuto := .F.
	   	//no final desse fonte consta execauto com as tabelas aga/agb caso seja necessario
	   	MSExecAuto({|x,y|TMKA070(x,y)},aContato,3) 
		
	If lMsErroAuto
		MostraErro()
		// aborto a transação
		DisarmTransaction()
	Else   
	
		ConfirmSx8()  
		EndTran() 
			
		AC8->(DbSetOrder(1))
		//faco a amarracao entre contato x entidade
		If !AC8->(DbSeek(xFilial("AC8") + cCodigo + "SA1" + xFilial("SA1") + SA1->(A1_COD + A1_LOJA))) 
		
			if RecLock("AC8",.T.) 
			
				AC8->AC8_FILIAL := xFilial("AC8")
				AC8->AC8_FILENT := xFilial("SA1")
				AC8->AC8_ENTIDA := "SA1"
				AC8->AC8_CODENT := SA1->A1_COD + SA1->A1_LOJA
				AC8->AC8_CODCON := cCodigo
				AC8->(MsUnLock()) 
				
			endif    
			
		EndIf			
		
	EndIf
		
	SA1->( DbSkip() )
	
EndDo
 


	
	
RestArea(aArea)
RestArea(aAreaSA1)
RestArea(aAreaSU5)
 

Return()

