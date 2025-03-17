#INCLUDE "rwmake.ch"

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ RPCOE010    ¦ Autor ¦ TOTVS		      ¦ Data ¦ 20/04/2017 ¦¦¦
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

User Function RPCOE010()
Local aArea := GetArea()
Local nPosCC    := aScan(aHeader,{|x| AllTrim(x[2])=="C7_CC"})
Local nPosPrd   := aScan(aHeader,{|x| AllTrim(x[2]) == "C7_PRODUTO"})
Local nPosTes   := aScan(aHeader,{|x| Alltrim(x[2]) == "C7_TES"})
Local lRet := .t.
Local lDespesa := .f.

If ValType(aCols[n,Len(aCols[n])]) == "L"
	lDeleted := aCols[n,Len(aCols[n])]      // Verifica se esta Deletado
EndIf

SB1->(dbSetOrder(1))
SB1->(MsSeek(xFilial("SB1")+aCols[n][nPosPrd]))

SF4->(dbSetOrder(1))
SF4->(MsSeek(xFilial("SF4")+aCols[n][nPosTes]))
If SF4->F4_ESTOQUE == "N" .Or. Empty(aCols[n][nPosTes]) 
  lDespesa := .t.
Endif

If !lDeleted .and. SB1->(FieldPos("B1_CLORC"))> 0
  if !Empty(SB1->B1_CLORC) .AND. Alltrim(SB1->B1_CLORC) <> '999999' //Caique Validação 
     if U_PCOVClOrc(SB1->B1_CLORC) .and. empty(aCols[n,nPosCC]) .and. lDespesa
		  MSGINFO('Atenção, Informe o Centro de Custo!')
		  lRet := .f.
     Endif
  Endif   
Endif 
RestArea(aArea)
Return lRet