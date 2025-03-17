#INCLUDE "rwmake.ch"

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ RPCOE003    ¦ Autor ¦ TOTVS		      ¦ Data ¦ 20/04/2017 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Execblock para estornar o PCO                              ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ Mococa		                                          	  ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function RPCOE003()
//-- Inicializa a gravacao dos lancamentos do SIGAPCO pelo ponto personalizado
cPCLib := Substr(SCR->CR_NUM,1,len(SC7->C7_NUM))                               
dbSelectArea("SC7")
dbSetOrder(1)
MsSeek(xFilial("SC7")+cPCLib)                                      	
//-- Inicializa a gravacao dos lancamentos do SIGAPCO pelo ponto personalizado
PcoIniLan("900003")
While !SC7->(Eof()) .And. SC7->C7_FILIAL+SC7->C7_NUM == xFilial("SC7")+cPCLib
	PcoDetLan("900003","01","MATA097",.T.)
	SC7->(dbSkip())
EndDo

//-- Finaliza a gravacao dos lancamentos do SIGAPCO
PcoFinLan("900003")
Return 