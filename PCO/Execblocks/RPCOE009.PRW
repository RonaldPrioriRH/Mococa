#INCLUDE "rwmake.ch"

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ RPCOE009    ¦ Autor ¦ TOTVS		      ¦ Data ¦ 20/04/2017 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Execblock para validar o PCO                               ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ Mococa		                                          	  ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function RPCOE009()
Local aArea := GetArea()
Local nPosPrd   := aScan(aHeader,{|x| AllTrim(x[2]) == "C1_PRODUTO"})
Local nPosCC    := aScan(aHeader,{|x| AllTrim(x[2])=="C1_CC"})
Local nPosOP    := aScan(aHeader,{|x| AllTrim(x[2])=="C1_OP"})
Local nPosStq   := aScan(aHeader,{|x| AllTrim(x[2])=="C1_ESTOQUE"})
Local lRet := .t.

If ValType(aCols[n,Len(aCols[n])]) == "L"
	lDeleted := aCols[n,Len(aCols[n])]      // Verifica se esta Deletado
EndIf

SB1->(dbSetOrder(1))
SB1->(MsSeek(xFilial("SB1")+aCols[n][nPosPrd]))

If !lDeleted .and. SB1->(FieldPos("B1_CLORC"))> 0
  if !Empty(SB1->B1_CLORC)
     if U_PCOVClOrc(SB1->B1_CLORC) .and. empty(aCols[n,nPosCC]) .and. empty(aCols[n,nPosOP]) .and. aCols[n,nPosStq ]<>"1" 
		  MSGINFO('Atenção, Informe o Centro de Custo!')
		  lRet := .f.
     Endif
  Endif   
Endif 
RestArea(aArea)
Return lRet