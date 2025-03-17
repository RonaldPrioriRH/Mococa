#Include "PROTHEUS.CH"
#INCLUDE "rwmake.ch"

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ RFATE042    ¦ Autor ¦ Caique Mercadante¦ Data ¦ 24/11/2020 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Ponto de entrada antes exclusao do documento de saida, para¦¦¦
¦¦¦          ¦ validar ou não a exclusao.                      			  ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ Mococa   		                                          ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Validação Necessária devido estarmos usando o FATJOBNFE
https://tdn.totvs.com/pages/releaseview.action?pageId=272154294#FATJOB-FATJOB
*/
User Function RFATE042() 

Local aAreaSF2  := SF2->(GetArea())
Local aAreaSD2  := SD2->(GetArea())
Local nSpedExc 	:= GetNewPar("MV_SPEDEXC",24) // Padrão caso não exista
Local nCancExc 	:= GetNewPar("MV_CANCEXT",0)  // Envio Cancelamento Cancelamento Extemporâneo.    
Local lRet 		:= .T. 

SD2->(DbSetOrder(3)) //D2_FILIAL+D2_DOC+D2_SERIE+D2_CLIENTE+D2_LOJA+D2_COD+D2_ITEM

If SD2->(DbSeek(xFilial("SD2")+SF2->F2_DOC+SF2->F2_SERIE+SF2->F2_CLIENTE+SF2->F2_LOJA))
	
	While SD2->(!EOF()) .And.;
	 SD2->D2_FILIAL+SD2->D2_DOC+SD2->D2_SERIE+SD2->D2_CLIENTE+SD2->D2_LOJA == xFilial("SF2")+SF2->F2_DOC+SF2->F2_SERIE+SF2->F2_CLIENTE+SF2->F2_LOJA
				
		If !Empty(SF2->F2_DAUTNFE) 
			   nHoras := SubtHoras(SF2->F2_DAUTNFE, SF2->F2_HAUTNFE,date(), substr(Time(),1,2)+":"+substr(Time(),4,2) )
		
			//MsgAlert("Tempo Cancelamento Validação " + Alltrim(STR(nHoras)) +" horas")

			// Bloquei Cancelamento NF após 24 Horas
			If nHoras >= nSpedExc .And. nHoras >= (nCancExc * 24)
					MsgAlert("Não foi possivel excluir a(s) nota(s), pois o prazo para o cancelamento da(s) NF-e é de " + Alltrim(STR(nSpedExc)) +" horas")
				lRet := .F.

			//Permite o Envio do Cancelamento Extemporâneo quando parametro MV_CANCEXT	for maior ou igual a qtd de Horas permitidas
			ElseIf nHoras >= nSpedExc .And. nHoras <= (nCancExc * 24)
					MsgAlert("Cancelamento Extemporâneo Autorizado" + Alltrim(STR(nCancExc)) +" Dias")
				lRet := .T.
			
			Endif
			
		EndIf
	
		SD2->(DbSkip())
	EndDo
Endif

RestArea(aAreaSD2)
RestArea(aAreaSF2)

Return lRet
