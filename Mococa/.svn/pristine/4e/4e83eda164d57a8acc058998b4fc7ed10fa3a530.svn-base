#Include 'Protheus.ch'
#Include 'TopConn.ch'

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  RTMKE006     ºAutor  ³Raphael Martins   º Data ³  29/03/17   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Rotina para inclusao de endereco e fone do cabecalho  	   ±±
±±º          ³ nas tabelas AGA e AGB                                      º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function RTMKE006(cContato,cEndereco,cCep,cBairro,cMunicipio,cEstado,cComplem,cDDD,cFone)
					
Local aArea		:= GetArea()
Local aAreaSU5	:= SU5->( GetArea() )
Local aAreaAGA	:= AGA->( GetArea() )
Local aAreaAGB	:= AGB->( GetArea() )
Local cCodAGA	:= GetSxENum("AGA","AGA_CODIGO")

	AGA->(DbSetOrder(2)) //AGA_FILIAL + AGA_CODIGO
	AGB->(DbSetOrder(2)) //AGB_FILIAL+AGB_CODIGO
	 
	//valido se o codigo atribuido ja exista no cadastro de enderecos
	While AGA->(DbSeek(xFilial("AGA") + cCodAGA))
		ConfirmSX8()
		cCodAGA := GetSxENum("AGA","AGA_CODIGO")
	EndDo 

	RecLock("AGA",.T.)
		AGA->AGA_FILIAL		:= xFilial("AGA")
		AGA->AGA_CODIGO		:= cCodAGA
		AGA->AGA_CODENT		:= cContato
		AGA->AGA_ENTIDA		:= "SU5"
		AGA->AGA_TIPO		:= "1"
		AGA->AGA_TIPO		:= "1"
		AGA->AGA_PADRAO		:= "1"
		AGA->AGA_END		:= Alltrim(cEndereco)
		AGA->AGA_CEP   		:= Alltrim(cCep)
		AGA->AGA_BAIRRO 	:= Alltrim(cBairro)
		AGA->AGA_MUNDES 	:= Alltrim(cMunicipio)
		AGA->AGA_EST    	:= Alltrim(cEstado)
		AGA->AGA_COMP		:= Alltrim(cComplem)
	AGA->(MsUnlock())
	
	RecLock("SU5",.F.)
		SU5->U5_CODAGA		:= cCodAGA
		SU5->U5_END 		:= cEndereco
		SU5->U5_BAIRRO		:= cBairro
		SU5->U5_MUN    		:= cMunicipio
		SU5->U5_CEP    		:= cCep
		SU5->U5_EST   		:= cEstado
		SU5->U5_XCOMPLE		:= cComplem
		
		If !Empty(cDDD) .And. !Empty(cFone)
			SU5->U5_DDD			:= cDDD
			SU5->U5_FCOM1		:= cFone
		endif
		
	SU5->( MsUnlock() )
		   
	
RestArea(aArea)
RestArea(aAreaSU5)
RestArea(aAreaAGA)
RestArea(aAreaAGB)

Return()


