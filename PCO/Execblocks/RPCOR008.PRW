#INCLUDE "rwmake.ch"

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ RPCOE008    ¦ Autor ¦ TOTVS		      ¦ Data ¦ 20/04/2017 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Execblock para finalizar o PCO                             ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ Mococa		                                          	  ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function RPCOE008()
Local aArea := GetArea()
Local cPedNum   := SC7->C7_NUM
Local lRet := .t.
Local lRet2 := .t.
Local aAreaSC7 := SC7->(GetArea())

SC7->(dbSetOrder(1))
If SC7->(MsSeek(xFilial("SC7")+cPedNum))
	While SC7->( !Eof() ) .And. SC7->C7_FILIAL == xFilial("SC7") .And. SC7->C7_NUM == cPedNum
	    lRet2 := PcoVldLan('900003','01','MATA097',/*lUsaLote*/,/*lDeleta*/, .T.)
		if !lRet2 .and. lRet
		  lRet := .f.
		Endif  
		SC7->(dbSkip())
	EndDo
Endif
if !lRet
  MSGINFO('Houveram restrinções orçamentárias, o Pedido não foi Liberado!')
endif 
PcoFreeBlq('900003')
RestArea(aAreaSC7)
RestArea(aArea)
Return lRet