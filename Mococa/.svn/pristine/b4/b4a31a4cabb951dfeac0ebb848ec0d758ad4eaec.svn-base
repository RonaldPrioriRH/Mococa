#INCLUDE "RWMAKE.CH"
#INCLUDE "PROTHEUS.CH"
#include 'parmtype.ch'

// Definições de Tipos de mensagem
#Define MT_TDEFAULT 0 // Adiciona somente o botão default "Fechar"
#Define MT_TYESNO   1 // Adiciona os botões "Sim" e "Não", focando no "Sim"
#Define MT_TNOYES   2 // Adiciona os botões "Não" e "Sim", focando no "Não"

// Definições de Ícones da mensagem
#Define MT_ISUCCES  "FWSKIN_SUCCES_ICO.PNG" // Ícone Default Sucesso
#Define MT_IALERT   "FWSKIN_ALERT_ICO.PNG"  // Ícone Default Alerta
#Define MT_IERROR   "FWSKIN_ERROR_ICO.PNG"  // Ícone Default Erro
#Define MT_IINFO    "FWSKIN_INFO_ICO.PNG"   // Ícone Default Informação

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³RFATE043  ºAutor  ³Caique Mercadante   º Data ³  01/03/23   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ PE para validacao de toda tela do Pedido de Venda.         º±±
±±º          ³ Anterior a gravacao. (MTA410)                              º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ TOTVS                                                      º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function RFATE043()
	
SetPrvt("NI,_CALIAS,_LRET,_NPOSDATES,_NQTD")

_cAlias := Alias()
_lRet   := .T.

	// PV Transferência da 0102 para 0104 Ou da 0102 para Galvani
	If (AllTrim(SM0->M0_CODFIL) == "0102" .And. M->C5_TIPO = 'N');
		.And. ((M->C5_CLIENTE = 'C02641' .And. M->C5_LOJACLI = '05') .Or. (M->C5_CLIENTE = 'C05216' .And. M->C5_LOJACLI = '01'))
			_lRet  := ConfTransp(M->C5_CLIENTE)

	// PV Transferência da 0104 para 0102 Ou da 0104 para Galvani
	ElseIf (AllTrim(SM0->M0_CODFIL) == "0104" .And. M->C5_TIPO = 'N'); 
		.And. ((M->C5_CLIENTE = 'C02641' .And. M->C5_LOJACLI = '02') .Or. (M->C5_CLIENTE = 'C05216' .And. M->C5_LOJACLI = '01'))
			_lRet  := ConfTransp(M->C5_CLIENTE)

	// PV Transferêcia para Galvani material produtivo 
	ElseIf (AllTrim(SM0->M0_CODFIL) $ ("0102/0104") .And. M->C5_TIPO = 'B');
		.And. (M->C5_CLIENTE = 'F04470' .And. M->C5_LOJACLI = '01')
			_lRet  := ConfTransp(M->C5_CLIENTE)
	EndIf

dbSelectArea(_cAlias)

Return(_lRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ ConfTransp  ºAutor  ³Caique Mercadanteº Data ³  01/03/2023 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Obrigata Informar Transportadora             			 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Acelerador Totvs Goias                                     º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±º	Dados Adicionais de Alteracao/Ajustes do Fonte                        º±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºData      ³ Descricao:                                                 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º          ³ Confirme condição obriga PV estar com Transportadora       º±±
±±º 		 ³ 				                                              º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

Static Function ConfTransp(cCliente)

Local _lRet  := .T.
Local nI := 0

	If Len(aCols) != 0 
		
		_nPosdaTES := Ascan( aHeader,{|x| UPPER(Alltrim(x[2]))=="C6_TES"})
		_nQtd:= 0
	
		For nI:= 1 To Len(aCols)
			If aCols[ nI , Len(aCols[1]) ] == .F.	//Deletados na linha não considera para validação

				SF4->( dbSeek(xfilial("SF4")+aCols[nI,_nPosdaTES]) )
				If Alltrim(cCliente) == 'C02641'
					If (SF4->(FOUND()) .AND. SF4->F4_ESTOQUE == "S" .AND. SF4->F4_TRANFIL = "1")
						_nQtd++ 
					EndIf
				ElseIf Alltrim(cCliente) $ ('C05216/F04470')
					If (SF4->(FOUND()) .AND. SF4->F4_ESTOQUE == "S" .AND. SF4->F4_PODER3 = "R")
						_nQtd++ 
					EndIf
				EndIf

			Endif
		Next
		
		If ( _nQtd > 0 .And. (Empty(M->C5_TRANSP) .Or. M->C5_TRANSP = '000000')) //Transportadora a Definir não pode
			U_MsgTimer(10, "Este PV deve obrigatoriamente ser informada a sua Transportadora. Verifique...", "Atenção Transportadora", MT_IALERT, MT_TDEFAULT)
			_lRet:= .F.
		Endif
		
	EndIf

Return(_lRet)
