#include "protheus.ch"

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ MSD2460    ¦ Autor ¦ Claudio Ferreira   ¦ Data ¦ 07/06/2012¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Ponto de Entrada apos o faturamento preenche o C.Custo     ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function MSD2460()
Local cA1CO:= ""
Local cA3CO:= ""
SD2->(Reclock("SD2",.f.))

If SC5->(FieldPos("C5_XCC"))> 0
  SD2->D2_CCUSTO := SC5->C5_XCC
Endif  
If SC5->(FieldPos("C5_XITEMC"))> 0
  SD2->D2_ITEMCC := SC5->C5_XITEMC
Endif  
If SC5->(FieldPos("C5_XCLVL"))> 0
  SD2->D2_CLVL := SC5->C5_XCLVL
Endif 

//Trata C.Custo a partir do Cliente Claudio 11.01.18 
If SA1->(FieldPos("A1_CO"))> 0
	cA1CO:= SA1->A1_CO
Endif

//Trata C.Custo a partir do Vendedor Claudio 11.01.18 
SA3->(Dbsetorder(1))
SA3->(Dbseek(xFilial("SA3")+SC5->(C5_VEND1)))
If SA3->(FieldPos("A3_CONTORC"))> 0 
	cA3CO:= SA3->A3_CONTORC
	if empty(cA3CO) .and. !empty(SA3->A3_SUPER)
		SA3->(Dbseek(xFilial("SA3")+SA3->A3_SUPER))
		cA3CO:= SA3->A3_CONTORC
	endif
	if empty(cA3CO) .and. !empty(SA3->A3_GEREN)
		SA3->(Dbseek(xFilial("SA3")+SA3->A3_GEREN))
		cA3CO:= SA3->A3_CONTORC
	endif
Endif 
cCO:=iif(!empty(cA1CO),cA1CO,iif(!empty(cA3CO),cA3CO,SuperGetMV("MV_XPCOCOP",.F.,"MV_XPCOCOP")))
if Empty(SD2->D2_CCUSTO)
  SD2->D2_CCUSTO := cCO 
endif  

SD2->(MsUnlock())

Return
