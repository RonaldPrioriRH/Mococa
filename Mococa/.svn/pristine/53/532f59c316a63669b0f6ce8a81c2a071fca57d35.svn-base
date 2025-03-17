#INCLUDE "RWMAKE.CH"
#INCLUDE "PROTHEUS.CH"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³RFATE023  ºAutor  ³Pedro Paulo         º Data ³  04/10/13   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ PE para validacao de toda tela do Pedido de Venda.         º±±
±±º          ³ Anterior a gravacao.                                       º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ TOTVS                                                      º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function RFATE023()
	
	Local lRet := .T.

	//If Len(aColsFor) = 0 
	//If (Len(aColsFor) = 0 .OR. empty(aColsFor[1,1])) .AND. M->C5_TIPO == 'N' //verifico se tem forma, percentual e o pedido é normal
	If FieldPos("C5_XFORPG") > 0 .AND. Empty (M->C5_XFORPG) .AND. M->C5_TIPO == 'N' .AND. FUNNAME() != "MATA310" //verifico se tem forma de pagamento e o pedido é normal
		Aviso("Atencao!","Informe pelo menos uma Forma de Pagamento.",{"Ok"})
		lRet := .F.
	EndIf
                   
	DbSelectArea("SE4")
	SE4->(DbSetOrder(1))

	//Valida se na condição pagamento tipo 9 - foram informados as parcelas
	if SE4->(DbSeek(xFilial("SE4")+M->C5_CONDPAG)) .AND. SE4->E4_TIPO == '9'
		if Empty(M->C5_PARC1) .OR. Empty(M->C5_DATA1)
			Aviso("Atencao!","Necessário informar as parcelas para condição tipo 9",{"Ok"})
			lRet := .F.
		Endif
	Endif	

Return(lRet)
