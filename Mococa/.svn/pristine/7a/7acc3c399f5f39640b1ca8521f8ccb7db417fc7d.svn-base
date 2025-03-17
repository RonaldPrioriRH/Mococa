#Include "Protheus.ch"

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³MA030TOK	 ºAutor  ³Tarcísio Silva    	Data ³ 29/01/2018 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Na TudOK (validação da digitação) na inclusão e alteração  º±±
±±º			 ³ de clientes.									 			  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Mococa - 								                  º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/  

User Function MA030TOK()

	Local aAreaSA1 	:= SA1->(GetArea())
	Local aArea 	:= GetArea()
	Local lRet		:= GetMv("MV_XINCCGC",,.F.)
	
	if INCLUI
	
		if !lRet
		
			SA1->(DbSelectArea("SA1"))
			SA1->(DbSetOrder(3))
			SA1->(DbGotop())
			if SA1->(DbSeek(xFilial("SA1")+M->A1_CGC))
				MsgAlert("Cnpj ou Cpf já cadastrado. Por favor entrar em contato com o Departamento Contábil (MV_XINCCGC)!","Atenção!")
				lRet := .F.
			else
				lRet := .T.
			endif
			
		endif
	
	else 
	
		lRet := .T.
		
	endif
	
 IF altera 
   	If FindFunction("U_RFATE034")
		U_RFATE034()
	EndIf
		
	//realizo a inclusao do contato
	If FindFunction("U_RTMKE003")
		U_RTMKE003()
	EndIf
	
endif
	RestArea(aAreaSA1)
	RestArea(aArea)

Return(lRet)