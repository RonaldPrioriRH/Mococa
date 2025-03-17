#include "rwmake.ch"      
/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ APL05INC   ¦ Autor ¦ Claudio Ferreira   ¦ Data ¦ 25/02/2014¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Ponto de Entrada apos a inclusao do contrato preenche      ¦¦¦
¦¦¦          ¦ a tabela CTD - Item Contabil                               ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function APL05INC()          

// Inclusao no Item Contabil. //Contrato
Dbselectarea("CTD")
Dbsetorder(1)
IF CTD->(Dbseek(xFilial("CTD")+ZE5->(ZE5_CODIGO)))
	_lGrv :=.f.
ELSE
	_lGrv :=.t.
ENDIF

If RecLock("CTD",_lGrv)
	CTD->CTD_FILIAL := xFilial("CTD")
	CTD->CTD_ITEM   := ZE5->(ZE5_CODIGO)
	CTD->CTD_DESC01 := ZE5->(Alltrim(ZE5_DESCR)+'-'+ZE5_CONTRA)
	CTD->CTD_CLASSE := "2"
	CTD->CTD_NORMAL := "1"
	CTD->CTD_BLOQ   := "2"
	CTD->CTD_DTEXIS := CtoD("01/01/2010")
	CTD->CTD_ITLP   := CTD->CTD_ITEM
	CTD->CTD_CLOBRG := "2"
	CTD->CTD_ACCLVL := "1"  
	CTD->CTD_BOOK   := "AUTO"
	MsUnlock("CTD")
EndIf

Return