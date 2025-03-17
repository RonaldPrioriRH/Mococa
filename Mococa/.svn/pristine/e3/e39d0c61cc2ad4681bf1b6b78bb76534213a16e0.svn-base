#Include 'Protheus.ch'
// Definições de Tipos de mensagem
#Define MT_TDEFAULT 0 // Adiciona somente o botão default "Fechar"
#Define MT_TYESNO   1 // Adiciona os botões "Sim" e "Não", focando no "Sim"
#Define MT_TNOYES   2 // Adiciona os botões "Não" e "Sim", focando no "Não"

// Definições de Ícones da mensagem
#Define MT_ISUCCES  "FWSKIN_SUCCES_ICO.PNG" // Ícone Default Sucesso
#Define MT_IALERT   "FWSKIN_ALERT_ICO.PNG"  // Ícone Default Alerta
#Define MT_IERROR   "FWSKIN_ERROR_ICO.PNG"  // Ícone Default Erro
#Define MT_IINFO    "FWSKIN_INFO_ICO.PNG"   // Ícone Default Informação

/*/{Protheus.doc} MT103FIM
Valida de Documento de Entrada poderá ser excluido
@author TOTVS
@since 18/05/2017
@version P12
@param nulo            
@return nulo
/*/

User Function RCOME005()

Local lRet	   := .T.
Local cTicket  := ""

DbSelectArea("SD1")
SD1->(DbSetOrder(1))

DbSelectArea("SB1")
SB1->(DbSetOrder(1))

DbSelectArea("ZEJ")
ZEJ->(DbSetOrder(2))

If SD1->(DbSeek(xFilial("SD1")+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA))
	
	While SD1->(!EOF()) ;
			.AND. SD1->D1_FILIAL+SD1->D1_DOC+SD1->D1_SERIE+SD1->D1_FORNECE+SD1->D1_LOJA == xFilial("SF1")+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA
		
		If SB1->(DbSeek(xFilial("SB1")+SD1->D1_COD)) //.AND. SB1->B1_XSPOT == "S" // Valida se produto é Leite Spot
		
			//Valido se foi vinculado ticket pesagem ao documento entrada
			If !Empty(SD1->D1_XTICKET) 
				cTicket		:= SD1->D1_XTICKET	
				//Verifico se ja foi gerado pedido de compra de nota complementar
				If ZEJ->(DbSeek(xFilial("ZEJ")+SD1->D1_FORNECE+SD1->D1_LOJA+SD1->D1_COD+SD1->D1_XTICKET))
					If !Empty(ZEJ->ZEJ_PEDIDO)
						Alert("Doc.Entrada não poderá ser excluida pois Nota Fiscal complementar já foi solicitada ao fornecedor!","Atenção")
						lRet := .F.
					Else
						If ZEJ->ZEJ_OPERAC == "1"  .OR. ZEJ->ZEJ_OPERAC == "2"//devoluçao
							//If MsgYesNo("Estornar movimento de estoque de devoluçao gerado pelo ticket :"+ cTicket + "?","Leite Spot")
								U_MsgTimer(5, "Estornando movimento de estoque gerado pelo ticket : "+cTicket+" ", "Leite Spot", MT_IALERT, MT_TDEFAULT)
								//Reabre ticket de pesagem 
								U_BxTicket(xFilial("Z19"), cTicket , "A")
								lRet := .T. //StaticCall(RCOME004, RCOMEST01, ZEJ->ZEJ_DIFERE,5,"1")					

							//Else
							//	lRet := .F.
							//EndIf
						EndIf
					EndIf
				Else			//Reabro ticket quando excluir NF
							 	U_BxTicket(xFilial("Z19"), cTicket , "A")
				EndIf	
			EndIf
		
		EndIf	
		SD1->(DbSkip())
	EndDo
EndIf

Return lRet
