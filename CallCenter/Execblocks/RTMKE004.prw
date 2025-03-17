#Include "PROTHEUS.CH"
#include "topconn.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³RTMKE004  ºAutor  ³Raphael Martins Garciaº Data ³  04/05/2017±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Funcao para gerar um contato a partir da inclusao do 	   ±±
±±º          ³ Prospect		                                              º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Mococa													  º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function RTMKE004()

Local aArea   		:= GetArea()
Local aAreaSA1		:= SA1->(GetArea())
Local aAreaSU5 		:= SU5->(GetArea())
Local aAreaAC8 		:= AC8->(GetArea()) 
Local aContato		:= {}
Local cCodCont 		:= GetSxENum("SU5","U5_CODCONT")

Private lMsErroAuto	:= .F.

SU5->(DbSetOrder(1)) //U5_FILIAL + U5_CODCONT

//valido se o codigo atribuido ja exista no cadastro de contatos
While SU5->(DbSeek(xFilial("SU5") + cCodCont))
	ConfirmSX8()
	cCodigo := GetSxENum("SU5","U5_CODCONT")
EndDo 

Begin Transaction 
	
	
	AAdd(aContato,{"U5_FILIAL"	, xFilial("SU5") 				, Nil})
	AAdd(aContato,{"U5_CODCONT"	, cCodCont						, Nil})
	AAdd(aContato,{"U5_CONTAT"	, SUS->US_NOME					, Nil})
	AAdd(aContato,{"U5_END"		, Alltrim(SUS->US_END)			, Nil})
	AAdd(aContato,{"U5_BAIRRO"	, Alltrim(SUS->US_BAIRRO)		, Nil})
	AAdd(aContato,{"U5_MUN"		, Alltrim(SUS->US_MUN)			, Nil})
	AAdd(aContato,{"U5_EST"		, SUS->US_EST					, Nil})
	AAdd(aContato,{"U5_CEP"		, SUS->US_CEP					, Nil})
	AAdd(aContato,{"U5_CODPAIS"	, SUS->US_DDI					, Nil})
	AAdd(aContato,{"U5_DDD"		, SUS->US_DDD					, Nil})
	AAdd(aContato,{"U5_FCOM1"	, SUS->US_TEL					, Nil})
	AAdd(aContato,{"U5_URL"		, SUS->US_URL					, Nil})
	AAdd(aContato,{"U5_EMAIL"	, SUS->US_EMAIL					, Nil})
	AAdd(aContato,{"U5_CPF"		, SUS->US_CGC					, Nil})
	AAdd(aContato,{"U5_ATIVO"	, "1"							, Nil})
	AAdd(aContato,{"U5_STATUS"	, '2'							, Nil})
	AAdd(aContato,{"U5_TIPO"	, "3"							, Nil})
	AAdd(aContato,{"U5_ORIGEM"	, FunName()						, Nil})
	AAdd(aContato,{"U5_PROSPEC"	, SUS->US_COD    				, Nil})
	AAdd(aContato,{"U5_LOJAPRO"	, SUS->US_LOJA    				, Nil})
	
   	//no final desse fonte consta execauto com as tabelas aga/agb caso seja necessario
   	MSExecAuto({|x,y|TMKA070(x,y)},aContato,3) 

End Transaction 

If lMsErroAuto
		Alert("Não foi possível cadastrar o contato deste prospect!")
Else
		
	ConfirmSx8()
	
	AC8->(DbSetOrder(1))
	If !( AC8->( DbSeek( xFilial("AC8") + cCodCont + "SUS" + xFilial("SUS") + SUS->US_COD + SUS->US_LOJA ) ) )
		
		RecLock("AC8",.T.)  
		
			AC8->AC8_FILIAL 	:= xFilial("AC8")
			AC8->AC8_FILENT 	:= xFilial("SUS")
			AC8->AC8_ENTIDA 	:= "SUS"
			AC8->AC8_CODENT 	:= SUS->US_COD + SUS->US_LOJA
			AC8->AC8_CODCON 	:= cCodCont
		
		AC8->( MsUnlock() ) 
		
	endIf

endif
	

	
RestArea(aArea)
RestArea(aAreaAC8)
RestArea(aAreaSA1)
RestArea(aAreaSU5)

Return()


