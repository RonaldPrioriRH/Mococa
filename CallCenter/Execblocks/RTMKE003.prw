#Include "PROTHEUS.CH"
#include "topconn.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³RTMKE003  ºAutor  ³Raphael Martins Garciaº Data ³  04/05/2017±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Funcao para gerar um contato a partir da inclusao do cliente±±
±±º          ³ 				                                              º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Mococa													  º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function RTMKE003()

Local aArea   		:= GetArea()
Local aAreaSA1		:= SA1->(GetArea())
Local aAreaSU5 		:= SU5->(GetArea())
Local aAreaAC8 		:= AC8->(GetArea()) 
Local aContato		:= {}
Local cCodCont 		:= GetSxENum("SU5","U5_CODCONT")

Private lMsErroAuto	:= .F.

//valido se o contato ja existe na SU5
SU5->( DbSetOrder(8) ) //U5_FILIAL+U5_CPF

if !SU5->( DbSeek( xFilial("SU5") + SA1->A1_CGC ) )
	
	SU5->(DbSetOrder(1)) //U5_FILIAL + U5_CODCONT
	
	//valido se o codigo atribuido ja exista no cadastro de contatos
	While SU5->(DbSeek(xFilial("SU5") + cCodCont))
		ConfirmSX8()
		cCodCont := GetSxENum("SU5","U5_CODCONT")
	EndDo 
	
	Begin Transaction 
		
		AAdd(aContato,{"U5_FILIAL"		, xFilial("SU5") 															, Nil})
		AAdd(aContato,{"U5_CODCONT"	    , cCodCont																	, Nil})
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
	
	End Transaction 
else
	cCodCont := SU5->U5_CODCONT
endif

If lMsErroAuto
	MostraErro()
	Alert("Não foi possível cadastrar o contato deste cliente!")
Else   

	ConfirmSx8()  
	
	AC8->(DbSetOrder(1))
	//faco a amarracao entre contato x entidade
	If !AC8->(DbSeek(xFilial("AC8") + cCodCont + "SA1" + xFilial("SA1") + SA1->(A1_COD + A1_LOJA))) 

		if RecLock("AC8",.T.) 
	
			AC8->AC8_FILIAL := xFilial("AC8")
			AC8->AC8_FILENT := xFilial("SA1")
			AC8->AC8_ENTIDA := "SA1"
			AC8->AC8_CODENT := SA1->A1_COD + SA1->A1_LOJA
			AC8->AC8_CODCON := cCodCont
			AC8->(MsUnLock()) 
		
		endif    
	endif
		
EndIf

	
RestArea(aArea)
RestArea(aAreaAC8)
RestArea(aAreaSA1)
RestArea(aAreaSU5)

Return()


