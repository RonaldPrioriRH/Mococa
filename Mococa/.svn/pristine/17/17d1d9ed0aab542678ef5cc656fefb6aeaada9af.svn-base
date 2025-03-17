#include "rwmake.ch"
#INCLUDE "PROTHEUS.CH"
#Include "SigaWin.ch"
Static lProcedure := Nil
Static lProcRetSld := Nil
Static lProcAtSld := Nil

#define TESTE          0

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCOVAL   ¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 08/07/13¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Rotinas de Validação PCO                                   ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ 															  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCOPlan  ¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 08/07/13¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Retorna o nome da planilha orçamentária                    ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKC/AKI          		  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function PCOPlan(dData)
Local cPlan:='Indefinida'
Local cTpPlan:=Upper(SuperGetMV("MV_XPCOTPP",.F.,"S"))

Do Case
	Case cTpPlan='S' //Formato >>> 1S2013
		cPlan:=IIF(MONTH(dData)>=1.AND.MONTH(dData)<=6,"1S","2S")+STRZERO(YEAR(dData),4,0)
	Case cTpPlan='T' //Formato >>> 1T2013
		cPlan:=IIF(MONTH(dData)>=1.AND.MONTH(dData)<=3,"1T",IIF(MONTH(dData)>=4.AND.MONTH(dData)<=6,"2T",IIF(MONTH(dData)>=7.AND.MONTH(dData)<=10,"3T","4T")))+STRZERO(YEAR(dData),4,0)
	Case cTpPlan='A' //Formato >>> ORC2013
		cPlan:="ORC"+STRZERO(YEAR(dData),4,0)
EndCase
Return cPlan

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCOPlaVer¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 08/07/13¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Retorna a versão da planilha orçamentária                  ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKC/AKI          		  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function PCOPlaVer(dData)
Local cVersao:='Indefinida'
Local cPlan:=''
cPlan:=U_PCOPlan(dData)
if cPlan<>cVersao
	cVersao:=POSICIONE("AK1",1,XFILIAL("AK1")+cPlan,"AK1_VERSAO")
endif
Return cVersao

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCOVClOrc¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 08/07/13¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Valida se a Classe é Controlada no PCO                     ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKC            		  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function PCOVClOrc(cClasse)
Local lUsada:=.t. 
Local dPCOInic:=SuperGetMV("MV_XPCODTI",.F.,ctod('01/01/2000')) 
Local cRotNPCO:=SuperGetMV("MV_XPCONRO",.F.,'XXXXXXX')

if dDatabase<dPCOInic  
	Return .f. //Não gera lançamento para data anterior ao inicio
endif

if Alltrim(FunName())$cRotNPCO  
	Return .f. //Não gera lançamento para rotinas no MV_XPCONRO
endif

//if !empty(cClasse)
if !empty(cClasse) .AND. Alltrim(cClasse) <> '999999' //Validação devido a alteração feita na classe '999999' campo AK6_GERLAN == '2' 21/08/19
	lUsada:=POSICIONE("AK6",1,XFILIAL("AK6")+cClasse,"AK6_GERLAN")=='1'
endif 


Return lUsada

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCOBClOrc¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 12/08/13¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Valida se a Classe gera Bloqueio no PCO                      ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKI             		  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function PCOBClOrc(cClasse)
Local lUsada:=SuperGetMV("MV_PCOVBLQ",.F.,.T.)
Local dPCOInic:=SuperGetMV("MV_XPCODTI",.F.,ctod('01/01/2000'))
Local cRotNPCO:=SuperGetMV("MV_XPCONRO",.F.,'XXXXXXX')

if dDatabase<dPCOInic  
	Return .f. //Não gera lançamento para data anterior ao inicio
endif 

if Alltrim(FunName())$cRotNPCO  
	Return .f. //Não gera lançamento para rotinas no MV_XPCONRO 
endif

if !empty(cClasse) .and. lUsada
	lUsada:=POSICIONE("AK6",1,XFILIAL("AK6")+cClasse,"AK6_GERBLQ")=='1'
endif 

Return lUsada

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCOVOper ¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 08/07/13¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Valida se a Classe Controla Operação no PCO                ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKC/AKI          		  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function PCOVOper(cClasse,cPonto,lBloq)
Local lOper:=.t.
Local cOper:=''
Default lBloq:=.f.

lOper:=POSICIONE("AK6",1,XFILIAL("AK6")+cClasse,"AK6_OPER")=='1'
if lOper
	If ExistBlock("PCOOPER")
		cOper:=ExecBlock("PCOOPER",.F.,.F.,{cPonto,cClasse,lBloq})
	Else
		cOper:='Verif. PE PCOOPER'
	endif
endif
Return cOper

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCOSetCl ¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 29/07/13¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Seta Classe como Publica no lançamento do PCO              ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKC/AKI          		  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function PCOSetCl(cClasse)
Public _ClOrc:=cClasse

If AK5->(FieldPos("AK5_CAPEX"))> 0
  //Localiza o CO
  AK5->(Dbsetorder(1))
  if AK5->(Dbseek(xFilial("AK5")+CTT->CTT_CO))
    if AK5->AK5_CAPEX='1' .and. SB1->B1_CLORC==cClasse .and. !Empty(SB1->B1_CLCPX)
      cClasse:=SB1->B1_CLCPX
      _ClOrc:=cClasse
    endif
  endif
endif

Return cClasse

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCOPedCO ¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 05/08/13¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Retorna CO p/ o Pedido de Venda no PCO                     ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKC/AKI          		  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function PCOPedCO(lBloq,cGrupo)
Local cCO:=''
Local cA1CO:=''
Local cA3CO:=''
Local aArea:=GetArea()
Default lBloq:=.f.
Default cGrupo:='XXXX'

If cGrupo$SuperGetMV("MV_XGRUMKT",.F.,"")
  cCO:=SuperGetMV("MV_XCOMKT",.F.,"")
  RestArea(aArea)
  Return cCO 
Endif  


SC5->(Dbsetorder(1))
SA3->(Dbsetorder(1))
SA1->(Dbsetorder(1))

if !lBloq
	SC5->(Dbseek(xFilial("SC5")+SC6->(C6_NUM)))
	SA3->(Dbseek(xFilial("SA3")+SC5->(C5_VEND1)))
	SA1->(Dbseek(xFilial("SA1")+SC5->(C5_CLIENTE+C5_LOJACLI)))
else
	SC5->(Dbseek(xFilial("SC5")+M->(C6_NUM)))
	SA3->(Dbseek(xFilial("SA3")+M->(C5_VEND1)))
	SA1->(Dbseek(xFilial("SA1")+M->(C5_CLIENTE+C5_LOJACLI)))
endif

If SA1->(FieldPos("A1_CO"))> 0
	cA1CO:= SA1->A1_CO
Endif
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
If SC5->(FieldPos("C5_XCC"))> 0 //Se tiver C.Custo no Pedido de Venda
  cCOPed:=Posicione("CTT",1,XFILIAL("CTT")+SC5->C5_XCC,"CTT_CO")    
  cCO:=iif(!empty(cCOPed),cCOPed,cCO)
Endif  
RestArea(aArea)
Return cCO

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCORecCO ¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 17/12/13¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Retorna CO p/ o Titulo receber no PCO                      ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKC/AKI          		  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function PCORecCO(lBloq)
Local cCO:=''
Local cA1CO:=''
Local cA3CO:=''
Local aArea:=GetArea()
Default lBloq:=.f.

SA3->(Dbsetorder(1))
SA1->(Dbsetorder(1))

if !lBloq
	SA1->(Dbseek(xFilial("SA1")+SE1->(E1_CLIENTE+E1_LOJA)))
	SA3->(Dbseek(xFilial("SA3")+SE1->(E1_VEND1)))
else
	SA1->(Dbseek(xFilial("SA1")+M->(E1_CLIENTE+E1_LOJA)))
	SA3->(Dbseek(xFilial("SA3")+M->(E1_VEND1)))
endif

If SA1->(FieldPos("A1_CO"))> 0
	cA1CO:= SA1->A1_CO
Endif
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
RestArea(aArea)
Return cCO

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCONfsCO ¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 05/08/13¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Retorna CO p/ a Nota de Saida no PCO                       ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKC/AKI          		  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function PCONfsCO()
Local cCO:=''
Local cA1CO:=''
Local cA3CO:=''
Local aArea:=GetArea()
SF2->(Dbsetorder(1))
SF2->(Dbseek(xFilial("SF2")+SD2->(D2_DOC+D2_SERIE)))
SA3->(Dbsetorder(1))
SA3->(Dbseek(xFilial("SA3")+SF2->(F2_VEND1)))
SA1->(Dbsetorder(1))
SA1->(Dbseek(xFilial("SA1")+SD2->(D2_CLIENTE+D2_LOJA)))
If SA1->(FieldPos("A1_CO"))> 0
	cA1CO:= SA1->A1_CO
Endif
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
RestArea(aArea)
Return cCO

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCORetGd ¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 12/08/13¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Retorna Campo do aCols informado                           ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKI          		  	  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function PCORetGd(cField,aHeadPos,aColsPos,nPos)

cRet := aColsPos[nPos][aScan(aHeadPos,{|x| AllTrim(x[2])==cField})]
Return cRet

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCORetSD1¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 12/08/13¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Retorna Campo do aCols informado                           ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKI          		  	  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/  

//Mantido para o Legado. Substituida pela PCORetOld

User Function PCORetSD1(cField)
cRet := aOrigAcols[nOrigN][aScan(aOrigHeader,{|x| AllTrim(x[2])==cField})]
Return cRet   

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCORetOld¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 18/01/17¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Retorna Campo do aCols informado                           ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKI          		  	  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function PCORetOld(cField)
cRet := aOrigAcols[nOrigN][aScan(aOrigHeader,{|x| AllTrim(x[2])==cField})]
Return cRet

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ SCStq    ¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 11/02/14¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Retorna se a SC é para estoque                             ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKI          		  	  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function SCStq(lRat)
Local aArea:=GetArea()
Local lStq:=.f.     
Default lRat:=.f.
if !lRat
  POSICIONE("SC7",1,XFILIAL("SC7")+GdFieldGet('D1_PEDIDO')+GdFieldGet('D1_ITEM'),'C7_PRECO')
else
  POSICIONE("SC7",1,XFILIAL("SC7")+U_PCORetSD1('D1_PEDIDO')+U_PCORetSD1('D1_ITEM'),'C7_PRECO')
endif  
SC1->(Dbsetorder(1))
if SC1->(Dbseek(xFilial("SC1")+SC7->(C7_NUMSC+C7_ITEMSC)))
	lStq:=SC1->C1_ESTOQUE=='1'
endif
RestArea(aArea)
Return lStq


/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCOVSldAd¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 02/10/13¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Retorna o saldo do adiantamento associado ao pedido        ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKI            		  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function PCOVSldAd(cPedido)
Local aArea:=GetArea()
Local nSaldo:=0
FIE->(Dbsetorder(1))
FIE->(Dbseek(xFilial("FIE")+'P'+cPedido))
While !FIE->(EOF()) .and. FIE->FIE_CART='P' .and.FIE->FIE_PEDIDO=cPedido
	nSaldo+=FIE->FIE_SALDO  //SOMA DE TODOS RELAC EXISTENTES PARA O PA USADO
	FIE->(DbSkip())
Enddo

RestArea(aArea)
Return iif(nSaldo>0,.f.,.t.)

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCOTransf¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 04/04/14¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Retorna o valor case seja necessário transferir de periodo ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKC            		  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
                               
User Function PCOTransf()
Local aArea:=GetArea()
Local nValItem:=POSICIONE("SC7",1,XFILIAL("SC7")+SD1->(D1_PEDIDO+D1_ITEMPC),'C7_PRECO')+SC7->(C7_VALIPI/C7_QUANT)-SC7->(C7_VLDESC/C7_QUANT)
Local nSalPed :=SD1->D1_QTDPEDI*nValItem
//Local nValor:=SD1->(IIF(U_PCOVClOrc(_ClOrc).AND.!EMPTY(D1_PEDIDO).AND.POSICIONE("SF4",1,XFILIAL("SF4")+SC7->C7_TES,"F4_DUPLIC")<>'N'.AND.SF4->F4_ESTOQUE<>'S'.AND.POSICIONE("SC1",1,XFILIAL("SC1")+SC7->(C7_NUMSC+C7_ITEMSC),"C1_ESTOQUE")<>"1",nSalPed,0))
Local nValor:=SD1->(IIF(U_PCOVClOrc(_ClOrc).AND.!EMPTY(D1_PEDIDO).AND.POSICIONE("SF4",1,XFILIAL("SF4")+SC7->C7_TES,"F4_DUPLIC")<>'N'.AND.;
                    U_PCOVlStq(SF4->F4_CODIGO,_ClOrc).AND.POSICIONE("SC1",1,XFILIAL("SC1")+SC7->(C7_NUMSC+C7_ITEMSC),"C1_ESTOQUE")<>"1",nSalPed,0))
Local dDataNf:=SD1->D1_DTDIGIT
Local dDataPed:=IIF(SC7->C7_DATPRF>SC7->C7_EMISSAO, SC7->C7_DATPRF,SC7->C7_EMISSAO)
if !((Year(dDataNf)=Year(dDataPed)) .and. (Month(dDataNf)<>Month(dDataPed)) .and. (SuperGetMV("MV_XPCOTRF",.F.,.F.)))
	nValor:=0
Endif
RestArea(aArea)
Return nValor

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCOSalPed¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 10/04/15¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Retorna o saldo do pedido de compras                       ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKC            		  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function PCOSalPed(cChavePed,nQtdPed)
Local aArea:=GetArea()
Local nValItem:=0
Local nSalPed :=0
if !empty(cChavePed)
  dbSelectArea("SC7")
  dbSetOrder(1)
  //Localiza pedido
  dbSeek(xFilial('SC7')+cChavePed)
  if !empty(SC7->C7_TES)
     if POSICIONE("SF4",1,XFILIAL("SF4")+SC7->C7_TES,"F4_ESTOQUE")="S"    
	    RestArea(aArea)
		Return 0 //Foi lançado sem movimento de PCO
     endif
  endif   
  nValItem:=SC7->C7_PRECO+SC7->(C7_VALIPI/C7_QUANT)-SC7->(C7_VLDESC/C7_QUANT)
  nSalPed :=nQtdPed*nValItem
endif  
RestArea(aArea)
Return nSalPed

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCOSalSC¦ Utilizador ¦ Daniel Coelho      ¦ Data ¦ 10/04/15¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Retorna o saldo da solicitacao de compra                   ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKC            		  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function PCOSalSC(cChaveSC,nQtdSC,dDatprf)
Local aArea:=GetArea()
Local nValItem:=0
Local nSalSC  := 0
Default dDatprf = Ctod('')
if !empty(cChaveSC)

  dbSelectArea("SC1")
  dbSetOrder(1)
  //Localiza solicitação
  dbSeek(xFilial('SC1')+cChaveSC)
  if !empty(SC1->C1_DATPRF)
    if !empty(dDatprf)
       if Month(SC1->C1_DATPRF)<>Month(dDatprf)    
       		MsgAlert("A solicitação "+SC1->(C1_NUM+"/"+C1_ITEM)+" está com previsão de orçamento para o dia ("+dtoc(SC1->C1_DATPRF)+"). ","ATENCAO")
          	RestArea(aArea)
			Return 0
       endif
    endif
  endif

  nValItem:=POSICIONE("SC1",1,XFILIAL("SC1")+cChaveSC,'C1_XVALOR')
  nSalSC  :=nQtdSC*nValItem
endif  
RestArea(aArea)
Return nSalSC

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ WFPCO      ¦ Autor ¦ Claudio Ferreira    ¦ Data ¦ 30/08/13 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Workflow PCO                                               ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User function WFPCO( nOpcao, oProcess )

If ValType(nOpcao) = "A"
	nOpcao := nOpcao[1]
Endif

If nOpcao == NIL
	nOpcao := 0
End

ConOut("Opcao: "+Str(nOpcao,1))

If oProcess == NIL
	oProcess := TWFProcess():New( "WFPCO", "WF Aprovação de Contingência" )
End

Do Case
	Case nOpcao == 0
		SPCIniciar( oProcess, if(SuperGetMV("MV_WFPJUST",.F.,.T.),0,1) )
	Case nOpcao == 1
		SPCRetorno( oProcess )
	Case nOpcao == 2
		SPCTimeOut( oProcess )
EndCase

oProcess:Free()
RETURN

STATIC Function SPCIniciar( oProcess, nJust )
Local aCond:={},nTotal := 0
Local cAssunto
Local cEmailTST:=SuperGetMV("MV_WFETST",.F.,'')
Local lCtgRet:=SuperGetMV("MV_XCTGRET",.F.,.T.)
Local lJust:=if(nJust=0,.t.,.f.) 
Local lTransf:=if(nJust=2,.t.,.f.)
aMail:={}
if lJust                                             
	//Localiza o responsável pela justificativa no cadastro de Classe
	cUserGer := ''
	AK6->(Dbsetorder(1))
	If AK6->(Dbseek(xFilial("AK6")+ALJ->ALJ_CLASSE))
		cUserGer:=Alltrim(AK6->AK6_XRESP)       
	    If ExistBlock("PCOWFRCL")
	      cUserGer:=ExecBlock("PCOWFRCL",.F.,.F.,{cUserGer})
        endif 
 		ConOut("Tabela AK6 ("+Alltrim(AK6->AK6_CODIGO)+") >>> "+cUserGer)
   EndIf

	//Localiza o responsável pela justificativa
	
	If Empty(cUserGer)
		AK5->(Dbsetorder(1))
		AK5->(Dbseek(xFilial("AK5")+ALJ->ALJ_CO))
		For i:=1 to 10 //Maximo de 10 niveis
			cUserGer:=Alltrim(AK5->AK5_XRESP)
			If ExistBlock("PCOWFRCO")
	          cUserGer:=ExecBlock("PCOWFRCO",.F.,.F.,{cUserGer})
            endif 
			ConOut("Tabela AK5 "+Alltrim(Str(i))+" ("+Alltrim(AK5->AK5_CODIGO)+") >>> "+cUserGer)
			if !empty(cUserGer)
				Exit
			endif
			if !AK5->(Dbseek(xFilial("AK5")+AK5->AK5_COSUP))
				Exit
			endif
		Next i
	EndIf
	
	if empty(cUserGer)
		ConOut("Não foi encontrado responsável CO ")
		lJust:=.F.  //Envia para aprovação direto
		Reclock('ALI',.F.)
		ALI->ALI_XJUST:='Não foi encontrado responsável CO'
		ALI->(MsUnlock())		
	else
 	    nPos :=	AScan( aMail, {|x| AllTrim(x[3]) == cUserGer } )
 	    if nPos=0
		  aadd(aMail,{UsrRetName(cUserGer),UsrRetMail(cUserGer),cUserGer})
		endif  
	endif
endif
if !lJust
	cNum:=ALI->ALI_CDCNTG
	dbSelectArea("ALI")
	dbSetOrder(1)
	//Localiza contingencia
	dbSeek(xFilial('ALI')+cNum)
	While !ALI->(Eof()) .AND. ALI->ALI_CDCNTG=cNum .AND. xFilial('ALI')=ALI->ALI_FILIAL
		ConOut('ALI:'+ALI->ALI_CDCNTG+'-'+ALI->ALI_NOME)
 	    nPos :=	AScan( aMail, {|x| AllTrim(x[3]) == ALI->ALI_USER } )
 	    if nPos=0
			aadd(aMail,{UsrRetName(ALI->ALI_USER),UsrRetMail(ALI->ALI_USER),ALI->ALI_USER})
		endif  
		ALI->(DBSkip())
	Enddo
	ALI->(dbSeek(xFilial('ALI')+cNum))
Endif

//Abre o HTML criado. Repare que o mesmo se encontra abaixo do RootPath
cAssunto:= "Solicitação de Contingencia No "+ALI->ALI_CDCNTG
if lJust
	oProcess:NewTask( "WFPCO", "\workflow\pcojust.htm" )
else
	oProcess:NewTask( "WFPCO", "\workflow\pcowf.htm" )
endif
oProcess:cSubject := cAssunto
oProcess:bReturn := "U_WFPCO( 1 )"
if !Empty(SuperGetMV("MV_WFPSUP",.F.,""))
	//  Timeout                                  dia                    /        Hora                /  Minuto
	oProcess:bTimeOut := {{"U_WFPCO(2)", SuperGetMV("MV_WFPDIAS",.F.,0), SuperGetMV("MV_WFPHORA",.F.,2)  , 2 }}
Endif
oHTML := oProcess:oHTML
/*** Preenche os dados do cabecalho ***/
oHtml:ValByName( "solicita", ALI->ALI_NOMSOL )
oHtml:ValByName( "dtsol", Dtoc(ALI->ALI_DTSOLI) )
oHtml:ValByName( "dtval", Dtoc(ALI->ALI_DTVALI) )
oHtml:ValByName( "solnum", ALI->ALI_CDCNTG )
oHtml:ValByName( "codbloq", ALI->ALI_CODBLQ  )
oHtml:ValByName( "processo", ALJ->ALJ_PROCES )
oHtml:ValByName( "loteid", ALI->ALI_LOTEID )
oHtml:ValByName( "justif", "" )
if lJust
	oHtml:ValByName( "justif", "" )
	oHtml:ValByName( "type", "JUSTIFICAR" )
else
	oHtml:ValByName( "justif", if(lTransf,'O responsável pela Conta Orçamentária solicitou um remanejamento de verba<br>','')+OemToAnsi(ALI->ALI_XJUST) )
	oHtml:ValByName( "type", "APROVAR" )
endif

cObs := StrTran(ALI->ALI_MEMO,Chr(13)+Chr(10),'<BR>')

oHtml:ValByName( "obs", cObs )

WFSalvaID('ALI','ALI_PROCWF',oProcess:fProcessID)

//oProcess:ClientName( UsrRetName(WFCodUser("WF")) )
//oProcess:UserSiga := WFCodUser("WF")

oProcess:cTo :=  "wfpco"

if len(aMail)>0
	
	cMailID := oProcess:Start()
	//RastreiaWF(oProcess:fProcessID+'.'+oProcess:fTaskID,oProcess:fProcCode,'10001','Processo do PCO '+oProcess:oHtml:RetByName('solnum')+' iniciado!' )
	for i:=1 to len(aMail)
		if lJust
			cAviso:="Solicitação de Justificativa para Contingência No "+oProcess:oHtml:RetByName('solnum')
		else
			cAviso:="Solicitação de Contingência No "+oProcess:oHtml:RetByName('solnum')
		endif
		if TESTE=1 //teste
			cDestino:='claudio.fer@gmail.com'
		else
			if !empty(cEmailTST)
				cDestino:=cEmailTST
			else
				cDestino:=aMail[i,2]
			endif
		endif
		
		cLink:="http://"+SuperGetMV("MV_WFPWS",.F.,"MV_WFPWS")+"/messenger/emp"+cEmpAnt+"/wfpco/" + cMailID + ".htm"
		//Envia email de Aviso
		xHTM := '<HTML><BODY>'
		xHTM += '<hr>'
		xHTM += '<p  style="word-spacing: 0; line-height: 100%; margin-top: 0; margin-bottom: 0">'
		xHTM += '<b><font face="Verdana" SIZE=3>'+cAviso+' &nbsp; '+dtoc(date())+'&nbsp;&nbsp;&nbsp;'+time()+'</b></p>'
		xHTM += '<hr>'
		xHTM += '<br>'
		xHTM += '<b><font face="Verdana" SIZE=3> Prezado(a) '+aMail[i,1]+'</b></p>'
		xHTM += '<br>'
		xHTM += 'Favor clicar no link abaixo para '+iif(lJust,'justificar','visualizar/aprovar')+' a contingência em referencia<BR> <br>'
		xHTM += "<a href="+cLink+"?user="+aMail[i,3]+" title="+cLink+">Ver Solicitação</a> "
		if !empty(SuperGetMV("MV_WFPWS2",.F.,""))
			cLink2:="http://"+SuperGetMV("MV_WFPWS2",.F.,"MV_WFPWS2")+"/messenger/emp"+cEmpAnt+"/wfpco/" + cMailID + ".htm"
			xHTM += "<br><a href="+cLink2+"?user="+aMail[i,3]+" title="+cLink2+">Ver Solicitação (Link Externo)</a> "
		endif
		xHTM += '</BODY></HTML>'
		//lOk:=U_SendEMail('', 'Aviso - '+cAviso+'', 'Aviso - '+cAviso+'' , xHTM, .t., cDestino, '')
		
		//Parametros necessarios para a rotina
		// MV_RELACNT - Conta a ser utilizada no envio de E-Mail
		// MV_RELFROM - E-mail utilizado no campo FROM no envio
		// MV_RELSERV - Nome do Servidor de Envio de E-mail utilizado no envio
		// MV_RELAUTH - Determina se o Servidor de Email necessita de Autenticação
		// MV_RELAUSR - Usuário para Autenticação no Servidor de Email
		// MV_RELAPSW - Senha para Autenticação no Servidor de Email
		oMail := SendMail():new()
		oMail:SetTo(cDestino)
		cBcc:=SuperGetMV("MV_XWFCCO",.F.,"") 
		if !Empty(cBcc)  
		  oMail:SetBCC(cBcc)
		endif		
		oMail:SetFrom(Alltrim(GetMv("MV_RELFROM",," ")))
		oMail:SetSubject('Aviso - '+cAviso)
		oMail:SetBody(xHTM)
		oMail:SetEchoMsg(.t.) //(opc) Default .t. - define se exibe mensagens automaticamente na Tela (Schedule .f.) / Console (Schedule .t.)
		lOk:=oMail:Send()
		ConOut(cAviso)
		ConOut('Destino:'+cDestino+iif(lOk,' Ok',' Erro'))
		
		if lOk .and. lJust
			//Confirma solicitação para o usuário
			cAviso:="Confirmação de solicitação de Contingência No "+oProcess:oHtml:RetByName('solnum')
			//Envia email de Aviso
			xHTM := '<HTML><BODY>'
			xHTM += '<hr>'
			xHTM += '<p  style="word-spacing: 0; line-height: 100%; margin-top: 0; margin-bottom: 0">'
			xHTM += '<b><font face="Verdana" SIZE=3>'+cAviso+' &nbsp; '+dtoc(date())+'&nbsp;&nbsp;&nbsp;'+time()+'</b></p>'
			xHTM += '<hr>'
			xHTM += '<br>'
			xHTM += '<b><font face="Verdana" SIZE=3> Prezado(a), </b></p>'
			xHTM += '<br>'
			xHTM += 'A contingência em referencia foi enviada o email <a href=mailto:'+aMail[i,2]+'>'+aMail[i,1]+'</a> <BR> <br>'
			xHTM += 'Cópia: <BR> <br>'+cObs
			xHTM += '</BODY></HTML>'
			cDestino:=UsrRetMail(ALI->ALI_SOLIC)
			//lOk:=U_SendEMail('', 'Aviso - '+cAviso+'', 'Aviso - '+cAviso+'' , xHTM, .t., cDestino, '')
			oMail := SendMail():new()
			oMail:SetTo(cDestino)
			oMail:SetFrom(Alltrim(GetMv("MV_RELFROM",," ")))
			oMail:SetSubject('Aviso - '+cAviso)
			oMail:SetBody(xHTM)
			oMail:SetEchoMsg(.t.) //(opc) Default .t. - define se exibe mensagens automaticamente na Tela (Schedule .f.) / Console (Schedule .t.)
			lOk:=oMail:Send()
			
			ConOut(cAviso)
			ConOut('Destino:'+cDestino+iif(lOk,' Ok',' Erro'))
		endif
		
		//RastreiaWF(oProcess:fProcessID+'.'+oProcess:fTaskID,oProcess:fProcCode,'10002','Email enviado para  '+cDestino+'!' )
	next i
endif
Return


/*Faz o processamento da Ação*/
Static Function SPCRetorno( oProcess )
Local cEmailTST:=SuperGetMV("MV_WFETST",.F.,'')      
Local lCtgRet:=SuperGetMV("MV_XCTGRET",.F.,.T.)
Local lAprova,lJust,cJustif,cAcao,cNum,cTipo,lTransf
//RastreiaWF(oProcess:fProcessID+'.'+oProcess:fTaskID,oProcess:fProcCode,'10003',,"WF")
cNum:=oProcess:oHtml:RetByName('solnum')
cAcao:=oProcess:oHtml:RetByName('APROVA')
cJustif:=oProcess:oHtml:RetByName('justif')
cTipo:=oProcess:oHtml:RetByName('type')

dbSelectArea("ALJ")
dbSetOrder(1)
//Localiza o aprovador
dbSeek(xFilial('ALJ')+cNum)

dbSelectArea("ALI")
dbSetOrder(1)
//Localiza contingencia
dbSeek(xFilial('ALI')+cNum)

lAprova:=Upper(cAcao)='SIM'
lTransf:=Upper(cAcao)='TRF'
lJust:=Upper(cTipo)='JUSTIFICAR'
if !lJust
	codAprov:= oProcess:oHtml:RetByName('LB_APROVADOR')
else
	codAprov:=''
	//Localiza o responsável pela justificativa no cadastro de Classe
	cUserGer := ''
	AK6->(Dbsetorder(1))
	If AK6->(Dbseek(xFilial("AK6")+ALJ->ALJ_CLASSE))
		cUserGer:=Alltrim(AK6->AK6_XRESP) 
	    If ExistBlock("PCOWFRCL")
	      cUserGer:=ExecBlock("PCOWFRCL",.F.,.F.,{cUserGer})
        endif 		
		ConOut("Tabela AK6 ("+Alltrim(AK6->AK6_CODIGO)+") >>> "+cUserGer)
		If !empty(cUserGer)
			codAprov:=cUserGer
		EndIf
   EndIf

	//Localiza o responsável pela justificativa
	If Empty(cUserGer)
		AK5->(Dbsetorder(1))
		AK5->(Dbseek(xFilial("AK5")+ALJ->ALJ_CO))
		For i:=1 to 10 //Maximo de 10 niveis
			cUserGer:=Alltrim(AK5->AK5_XRESP)      
			If ExistBlock("PCOWFRCO")
	          cUserGer:=ExecBlock("PCOWFRCO",.F.,.F.,{cUserGer})
            endif 
			ConOut("Tabela AK5 "+Alltrim(Str(i))+" ("+Alltrim(AK5->AK5_CODIGO)+") >>> "+cUserGer)
			if !empty(cUserGer)
				codAprov:=cUserGer
				Exit
			endif
			if !AK5->(Dbseek(xFilial("AK5")+AK5->AK5_COSUP))
				Exit
			endif
		Next i
	EndIf	
endif
ConOut('Retorno solicitação No:'+cNum+'/'+cAcao+' Tipo:'+cTipo+' Aprov:'+codAprov)

lPrim:=.t.
While !ALI->(Eof()) .AND. ALI->ALI_CDCNTG=cNum .AND. xFilial('ALI')=ALI->ALI_FILIAL
	ConOut('ALI:'+ALI->ALI_CDCNTG+'-'+ALI->ALI_NOME)
	Reclock('ALI',.F.)
	if lAprova 
		if !lJust
			ALI->ALI_STATUS:='03'
		endif
		//RastreiaWF(oProcess:fProcessID+'.'+oProcess:fTaskID,oProcess:fProcCode,'10004',,"WF")
	elseif (lJust .and. !lTransf) .or. (!lJust .and. (lTransf .or. !lAprova)) 
		ALI->ALI_STATUS:='04'
		PcoIniLan("000356",.F.)
		PcoDetLan("000356","02","PCOA530",.T.)
		PcoFinLan("000356",,,.F.)
		//RastreiaWF(oProcess:fProcessID+'.'+oProcess:fTaskID,oProcess:fProcCode,'10005',,"WF")
	endif
	if !lJust
		ALI->ALI_USRLIB:=codAprov
		ALI->ALI_DTLIB:=DATE()
		ALI->ALI_HORAL:=TIME()
		ALI->ALI_NOMLIB:=UsrRetName(codAprov)
	endif
	if lPrim
		cJustif:=ALI->ALI_XJUST+iif(!lJust,' Gestor: ',' Gerente: ')+AllTrim(UsrRetName(codAprov))+"-"+OemToAnsi(cJustif)+CHR(13)+CHR(10)
		lPrim:=.f.
	endif
	ALI->ALI_XJUST:=cJustif
	ALI->(MsUnlock())
	ALI->(DBSkip())
Enddo
ALI->(dbSeek(xFilial('ALI')+cNum))
//RastreiaWF(oProcess:fProcessID+'.'+oProcess:fTaskID,oProcess:fProcCode,'10006',,"WF")

if (lJust .and. !lAprova .and. !lTransf) .or. !lJust
	//Avisa o usuário
	cAviso:="NOTIFICAÇÃO - Atendimento da Contingência No "+cNum
	//Mensagem
	xHTM := '<HTML><BODY>'
	xHTM += '<hr>'
	xHTM += '<p  style="word-spacing: 0; line-height: 100%; margin-top: 0; margin-bottom: 0">'
	xHTM += '<b><font face="Verdana" SIZE=3>'+cAviso+' &nbsp; '+dtoc(date())+'&nbsp;&nbsp;&nbsp;'+time()+'</b></p>'
	xHTM += '<hr>'
	xHTM += '<br>'
	xHTM += '<br>'
	xHTM += 'A solicitação da contingência foi <b>'+iif(lAprova,'APROVADA</b>','REJEITADA</b>')+iif(lJust,' pelo Gerente do CO',' pelo Gestor do Orçamento'+'-'+UsrRetName(codAprov))+' <BR><BR>'+'-Data <b>'  +DTOC(date())+'</b> hora: <b>'+time()+'</b> <br><br>'
	xHTM += '<br>'
	xHTM += 'Justificativas '
	xHTM += '<br>'+cJustif 
	if !lJust .and. lTransf
		xHTM += '<br><br>A contingência foi REJEITADA devido ao remanejamento de verbas, <b><u>repita o lançamento</u></b>.' 
	endif                               
	
	//  Ajuste para enviar os dados da contingencia no email de retorno             21/12/2017  MV_XCTGRET
	If lCtgRet
		cObs := StrTran(ALI->ALI_MEMO,Chr(13)+Chr(10),'<BR>')
                   
		xHTM += '<br>' 
		xHTM += '<br>'	
		xHTM += 'Cópia: <br>'+cObs
	EndIf		
	// Fim ajuste                    
	
	xHTM += '</BODY></HTML>'
	
	cCC:='' //Com Cópia
	if !lJust .and. SuperGetMV("MV_WFPJUST",.F.,.F.)

		//Localiza o responsável pela justificativa no cadastro de Classe
		cUserGer := ''
		AK6->(Dbsetorder(1))
		If AK6->(Dbseek(xFilial("AK6")+ALJ->ALJ_CLASSE))
			cUserGer:=Alltrim(AK6->AK6_XRESP)    
	    	If ExistBlock("PCOWFRCL")
	      		cUserGer:=ExecBlock("PCOWFRCL",.F.,.F.,{cUserGer})
        	endif 			
			ConOut("Tabela AK6 ("+Alltrim(AK6->AK6_CODIGO)+") >>> "+cUserGer)
	   EndIf

		//Localiza o responsável pela justificativa
		If Empty(cUserGer)
			AK5->(Dbsetorder(1))
			AK5->(Dbseek(xFilial("AK5")+ALJ->ALJ_CO))
			For i:=1 to 10 //Maximo de 10 niveis
				cUserGer:=Alltrim(AK5->AK5_XRESP)  
				If ExistBlock("PCOWFRCO")
	          		cUserGer:=ExecBlock("PCOWFRCO",.F.,.F.,{cUserGer})
            	endif 
				ConOut("Tabela AK5 "+Alltrim(Str(i))+" ("+Alltrim(AK5->AK5_CODIGO)+") >>> "+cUserGer)
				if !empty(cUserGer)
					Exit
				endif
				if !AK5->(Dbseek(xFilial("AK5")+AK5->AK5_COSUP))
					Exit
				endif
			Next i
		EndIf
		
		if empty(cUserGer)
			ConOut("Não foi encontrado responsável CO ")
		else				
			if !empty(cEmailTST)
				cCC:=cEmailTST
			else
				cCC:=UsrRetMail(cUserGer)
			endif
		endif
	endif
	//Localiza os demais aprovadores
	if !lJust
		dbSelectArea("ALI")
		dbSetOrder(1)
		//Localiza contingencia
		dbSeek(xFilial('ALI')+cNum)
		While !ALI->(Eof()) .AND. ALI->ALI_CDCNTG=cNum .AND. xFilial('ALI')=ALI->ALI_FILIAL
			ConOut('ALI:'+ALI->ALI_CDCNTG+'-'+ALI->ALI_NOME)
			if ALI->ALI_USER<>codAprov
				cCC+=';'+UsrRetMail(ALI->ALI_USER)
			endif
			ALI->(DBSkip())
		Enddo
		ALI->(dbSeek(xFilial('ALI')+cNum))
	endif
	if TESTE=1 //teste
		cDestino:='claudio.fer@gmail.com'
	else
		if !empty(cEmailTST)
			cDestino:=cEmailTST
		else
			cDestino:=UsrRetMail(ALI->ALI_SOLIC)
		endif
	endif
	
	//Envia email de Aviso
	//lOk:=U_SendEMail('', cAviso+'', cAviso+'' , xHTM, .t., cDestino, cCC)
	oMail := SendMail():new()
	oMail:SetTo(cDestino)
	oMail:SetCc(cCC) // (opc)   
	cBcc:=SuperGetMV("MV_XWFCCO",.F.,"") 
	if !Empty(cBcc)  
	  oMail:SetBCC(cBcc)
	endif
	oMail:SetFrom(Alltrim(GetMv("MV_RELFROM",," ")))
	oMail:SetSubject('Aviso - '+cAviso)
	oMail:SetBody(xHTM)
	oMail:SetEchoMsg(.t.) //(opc) Default .t. - define se exibe mensagens automaticamente na Tela (Schedule .f.) / Console (Schedule .t.)
	lOk:=oMail:Send()
	ConOut(cAviso)
	ConOut('Destino:'+cDestino+' c/c '+cCC+iif(lOk,' Ok',' Erro'))
endif


if (lJust .and. (lAprova.or.lTransf)) //Gera novo WF para o APROVADOR do orçamento
	SPCIniciar( oProcess, if(lAprova,1,2) )
else
	//finaliza o processo
	oProcess:Finish()
endif
Return


STATIC Function SPCTimeOut( oProcess )
Local cEmailTST:=SuperGetMV("MV_WFETST",.F.,'')
//RastreiaWF(oProcess:fProcessID+'.'+oProcess:fTaskID,oProcess:fProcCode,'10009',,"WF")
cTipo:=oProcess:oHtml:RetByName('type')
lJust:=Upper(cTipo)='JUSTIFICAR'
ConOut("Funcao de TIMEOUT executada Contingência "+oProcess:oHtml:RetByName('solnum')+' '+cTipo  )
cAviso:="NOTIFICAÇÃO - Solicitação de "+iif(lJust,'Justificativa de ','')+" Contingência PENDENTE - No "+oProcess:oHtml:RetByName('solnum')

if TESTE=1 //teste
	cDestino:='claudio.fer@gmail.com'
else
	if !empty(cEmailTST)
		cDestino:=cEmailTST
	else
		cDestino:=SuperGetMV("MV_WFPSUP",.F.,"")
	endif
endif
if !empty(cDestino)
	//Envia email de Aviso
	xHTM := '<HTML><BODY>'
	xHTM += '<hr>'
	xHTM += '<p  style="word-spacing: 0; line-height: 100%; margin-top: 0; margin-bottom: 0">'
	xHTM += '<b><font face="Verdana" SIZE=3>'+cAviso+' &nbsp; '+dtoc(date())+'&nbsp;&nbsp;&nbsp;'+time()+'</b></p>'
	xHTM += '<hr>'
	xHTM += '<br>'
	xHTM += '<br>'
	xHTM += 'A contigência em referencia ainda não foi '+iif(lJust,'justificada ','atendida')+' <BR> <br>'
	xHTM += '</BODY></HTML>'
	//lOk:=U_SendEMail('', cAviso+'', cAviso+'' , xHTM, .t., cDestino, '')
	oMail := SendMail():new()
	oMail:SetTo(cDestino)
	cBcc:=SuperGetMV("MV_XWFCCO",.F.,"") 
	if !Empty(cBcc)  
	  oMail:SetBCC(cBcc)
	endif	
	oMail:SetFrom(Alltrim(GetMv("MV_RELFROM",," ")))
	oMail:SetSubject('Aviso - '+cAviso)
	oMail:SetBody(xHTM)
	oMail:SetEchoMsg(.t.) //(opc) Default .t. - define se exibe mensagens automaticamente na Tela (Schedule .f.) / Console (Schedule .t.)
	lOk:=oMail:Send()
	
	ConOut(cAviso)
	ConOut('Destino:'+cDestino)
endif
//oProcess:Finish()  //Finalizo o Processo
Return


User Function ReprPCO(dData,cCo,cClasse,cOper)
Processa({|| ProcSld(dData,cCo,cClasse,cOper) },"Aguarde","Verificando saldos do orçamento ...",.T.)
Return .t.

Static Function ProcSld(dData,cCo,cClasse,cOper)

Local aArea:=GetArea()
Local aAreaAL1:=AL1->(GetArea())
Local aAreaAL2:=AL2->(GetArea())
Local aAreaAKI:=AKI->(GetArea())
Local aAreaAKA:=AKA->(GetArea())
Local aAreaAKB:=AKB->(GetArea())
Local aAreaAKC:=AKC->(GetArea())
Local aAreaAKD:=AKD->(GetArea())
Local aAreaAK8:=AK8->(GetArea())
Local aAreaAKT:=AKT->(GetArea())
Local aAreaAKS:=AKS->(GetArea())
Local aAreaAKW:=AKW->(GetArea())
Local aAreaAKE:=AKE->(GetArea())
Local aAreaAK5:=AK5->(GetArea())
Local aAreaAK6:=AK6->(GetArea())
Local aAreaAKF:=AKF->(GetArea())
Local cConfig:='01'
Local lRet:=.T.
Local dDataIni
Local dDataFim

Default dData:=&(AKI->AKI_DATA)
Default cCo:=&(AKI->AKI_CO)
Default cClasse:=&(AKI->AKI_CLASSE)
Default cOper:=&(AKI->AKI_OPER)

dDataIni:=FirstDay(dData)
dDataFim:=LastDay(dData)

dbSelectArea("AL1")
dbSeek(xFilial("AL1")+cConfig,.T.)


cQuery	:= " DELETE FROM  "+RetSqlName('AKT')
cQuery += " WHERE AKT_FILIAL='" + xFilial('AKT') + "' AND "
cQuery += " AKT_CONFIG = '" + cConfig +"' AND "
cQuery += " AKT_DATA BETWEEN '" + DToS(dDataIni) + "' AND '" + DToS(dDataFim)+"' "
cQuery += " AND AKT_NIV02     =  '"+cCo+"'"
cQuery += " AND AKT_NIV03 =  '"+cClasse+"'"
cQuery += " AND AKT_NIV04   =  '"+cOper+"'"
cQuery += " AND AKT_TPSALD IN ('00','40','50','99') "
If TcSqlExec(cQuery) <> 0
	//Forcar o Commit para DB2 para nao estourar o LOG (mesmo sem ter iniciado transacao)
	If Upper(TcGetDb()) == 'DB2' .Or. Upper(TcGetDb()) == 'SYBASE'
		TcSqlExec('commit')
	Endif
Endif

cQuery	:= " DELETE FROM  "+RetSqlName('AKS')
cQuery += " WHERE AKS_FILIAL='" + xFilial('AKS') + "' AND "
cQuery += " AKS_CONFIG = '" + cConfig +"' AND "
cQuery += " AKS_DATA BETWEEN '" + DToS(dDataIni) + "' AND '" + DToS(dDataFim)+"' "
cQuery += " AND AKS_NIV02     =  '"+cCo+"'"
cQuery += " AND AKS_NIV03 =  '"+cClasse+"'"
cQuery += " AND AKS_NIV04   =  '"+cOper+"'"
cQuery += " AND AKS_TPSALD IN ('00','40','50','99') "
If TcSqlExec(cQuery) <> 0
	//Forcar o Commit para DB2 para nao estourar o LOG (mesmo sem ter iniciado transacao)
	If Upper(TcGetDb()) == 'DB2' .Or. Upper(TcGetDb()) == 'SYBASE'
		TcSqlExec('commit')
	Endif
Endif

//se apagou saldos mensais (AKS) e saldos diarios (AKT) procede o reprocessamento
If lRet
	
	//Trazer o AKD agrupado por data e pela chave do cubo
	cCampos := StrTran(AL1->AL1_CHAVER, "+", ",")  //mudar de sinal (+) para virgula (,)
	cCampos	:=	StrTran(cCampos, "AKD->" , "") // tira o alias AKD-> q esta fixo
	cCampos	:=	Alltrim(cCampos)
	
	cQuery	:=	" SELECT AKD_TIPO, AKD_DATA, "
	cQuery	+=	cCampos+" , "    //campos do cubo gerencial
	cQuery	+=	" SUM(AKD_VALOR1) AKD_VALOR1, "
	cQuery	+=	" SUM(AKD_VALOR2) AKD_VALOR2, "
	cQuery	+=	" SUM(AKD_VALOR3) AKD_VALOR3, "
	cQuery	+=	" SUM(AKD_VALOR4) AKD_VALOR4, "
	cQuery	+=	" SUM(AKD_VALOR5) AKD_VALOR5 "
	cQuery	+=	" FROM " + RetSqlName('AKD') + " AKD "
	cQuery	+=	" WHERE AKD_FILIAL = '" + xFilial('AKD') + "' "
	cQuery	+=	" AND AKD_DATA BETWEEN '"+DToS(dDataIni)+"' AND '"+DToS(dDataFim)+"' "
	cQuery	+=	" AND AKD_STATUS='1' "
	cQuery	+=	" AND AKD_TIPO IN ( '1', '2') "
	cQuery  +=  " AND AKD_CO     =  '"+cCo+"'"
	cQuery  +=  " AND AKD_CLASSE =  '"+cClasse+"'"
	cQuery  +=  " AND AKD_OPER   =  '"+cOper+"'"
	cQuery  +=  " AND AKD_TPSALD IN ('00','40','50','99') "
	cQuery	+=	" AND D_E_L_E_T_<>'*'"
	cQuery	+=	" GROUP BY AKD_TIPO,AKD_DATA, "+AllTrim(cCampos)
	cQuery	+=	" ORDER BY AKD_DATA "
	cQuery	:=	ChangeQuery(cQuery)
	cAliasQry	:=	CriaTrab(,.F.)
	dbUseArea( .T., "TopConn", TCGenQry(,,cQuery),cAliasQry, .F., .F. )
	
	TcSetField(cAliasQry,'AKD_DATA','D',8,0)
	TcSetField(cAliasQry,'AKD_VALOR1','N', TamSx3('AKD_VALOR1')[1],TamSx3('AKD_VALOR1')[2])
	TcSetField(cAliasQry,'AKD_VALOR2','N', TamSx3('AKD_VALOR2')[1],TamSx3('AKD_VALOR2')[2])
	TcSetField(cAliasQry,'AKD_VALOR3','N', TamSx3('AKD_VALOR3')[1],TamSx3('AKD_VALOR3')[2])
	TcSetField(cAliasQry,'AKD_VALOR4','N', TamSx3('AKD_VALOR4')[1],TamSx3('AKD_VALOR4')[2])
	TcSetField(cAliasQry,'AKD_VALOR5','N', TamSx3('AKD_VALOR5')[1],TamSx3('AKD_VALOR5')[2])
	
	//Processar o AKD Agrupado da query
	While (cAliasQry)->( ! Eof() )
		If (cAliasQry)->AKD_TIPO=="1"
			PcoAtuSld( "C" /*cTipoMov*/, (cAliasQry)/*cAliasAKD*/, {(cAliasQry)->AKD_VALOR1,(cAliasQry)->AKD_VALOR2,(cAliasQry)->AKD_VALOR3,(cAliasQry)->AKD_VALOR4,(cAliasQry)->AKD_VALOR5}, (cAliasQry)->AKD_DATA, AL1->AL1_CONFIG/*cConfigDe*/, AL1->AL1_CONFIG/*cConfigAte*/, .T./*lReproc*/, .T./*lForcaAtu*/ )
		Else
			PcoAtuSld( "D" /*cTipoMov*/, (cAliasQry)/*cAliasAKD*/, {(cAliasQry)->AKD_VALOR1,(cAliasQry)->AKD_VALOR2,(cAliasQry)->AKD_VALOR3,(cAliasQry)->AKD_VALOR4,(cAliasQry)->AKD_VALOR5}, (cAliasQry)->AKD_DATA, AL1->AL1_CONFIG/*cConfigDe*/, AL1->AL1_CONFIG/*cConfigAte*/, .T./*lReproc*/, .T./*lForcaAtu*/ )
		EndIf
		(cAliasQry)->(DbSkip())
	EndDo // cAliasQry
	DbSelectArea(cAliasQry)
	DbCloseArea()
EndIf

AL1->(RestArea(aAreaAL1))
AL2->(RestArea(aAreaAL2))
AKI->(RestArea(aAreaAKI))
AKA->(RestArea(aAreaAKA))
AKB->(RestArea(aAreaAKB))
AKC->(RestArea(aAreaAKC))
AKD->(RestArea(aAreaAKD))
AK8->(RestArea(aAreaAK8))
AKT->(RestArea(aAreaAKT))
AKS->(RestArea(aAreaAKS))
AKW->(RestArea(aAreaAKW))
AKE->(RestArea(aAreaAKE))
AK5->(RestArea(aAreaAK5))
AK6->(RestArea(aAreaAK6))
AKF->(RestArea(aAreaAKF))
RestArea(aArea)
Return .t.

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCOPedImp¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 12/05/14¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Retorna o valor dos impostos no Pedido de Venda            ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKI/AKC        		  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
User Function PCOPedImp(lBloq)
Local aArea:=GetArea()
Local nValIpi	:= 0
Local nValST	:= 0
Default lBloq:=.f.

SC5->(Dbsetorder(1))
SA3->(Dbsetorder(1))
SA1->(Dbsetorder(1))

if !lBloq
	SC5->(Dbseek(xFilial("SC5")+SC6->(C6_NUM)))
	SA3->(Dbseek(xFilial("SA3")+SC5->(C5_VEND1)))
	SA1->(Dbseek(xFilial("SA1")+SC5->(C5_CLIENTE+C5_LOJACLI)))
	cCliente:=SC5->(C5_CLIENTE)
	cLoja:=SC5->(C5_LOJACLI)
	cTipo:=SC5->(C5_TIPO)
	cProduto:=SC6->(C6_PRODUTO)
	cTes:=SC6->(C6_TES)
	nQtd:=SC6->(C6_QTDVEN)
	nPrc:=SC6->(C6_PRCVEN)
else
	SC5->(Dbseek(xFilial("SC5")+M->(C6_NUM)))
	SA3->(Dbseek(xFilial("SA3")+M->(C5_VEND1)))
	SA1->(Dbseek(xFilial("SA1")+M->(C5_CLIENTE+C5_LOJACLI)))
	cCliente:=M->(C5_CLIENTE)
	cLoja:=M->(C5_LOJACLI)
	cTipo:=M->(C5_TIPO)
	cProduto:=M->(C6_PRODUTO)
	cTes:=M->(C6_TES)
	nQtd:=M->(C6_QTDVEN)
	nPrc:=M->(C6_PRCVEN)
endif


MaFisSave()
MaFisEnd()

MaFisIni(cCliente,cLoja,"C","N",SA1->A1_TIPO,,,,,"TMKA271")
MaFisAdd(AllTrim(cProduto), cTes, 1, nPrc , 0, "", "", 0 , 0 , 0 , 0 , 0 , nPrc , 0)

nValIpi		:= MaFisRet(1,"IT_VALIPI")
nValST		:= MaFisRet(1,"LF_ICMSRET")

MaFisEnd()
MaFisRestore()
RestArea(aArea)
Return (Round((nValIpi + nValST)*nQtd,2))

User Function ValUsrCo()
Local	lRetDef:=SuperGetMV("MV_XPCOBTF",.F.,.F.) 
Local	cConteudo	:=	AllTrim(&(ReadVar()))
Private cRelUser := RetCodUsr()
Private lRet:=.f.

//Valida configuração de usuário

dbSelectArea("AL7")
dbSetOrder(1)
if MsSeek(xFilial("AL7")+Padr('AK5',5)+cRelUser) //C.O
  While AL7->(AL7_FILIAL+AL7_ENTIDA+AL7_USER)=xFilial("AL7")+Padr('AK5',5)+cRelUser
	if AL7->AL7_DIREIT='1'
	    DbSkip()
	    Loop
	endif
    if (cConteudo>=AllTrim(AL7->AL7_FX_INI) .and. cConteudo<=AllTrim(AL7->AL7_FX_FIN)) .OR. Empty(cConteudo)
        lRet:=.t.
      exit
    endif
    DbSkip()
  Enddo
  if !lRet
     MsgAlert("Lançamento não permitido para o C.O informado!")
  endif
else
  lRet:=lRetDef 
endif
Return lRet

User Function ValUsrCl()
Local	lRetDef:=SuperGetMV("MV_XPCOBTF",.F.,.F.) 
Local	cConteudo	:=	AllTrim(&(ReadVar()))
Private cRelUser := RetCodUsr()
Private lRet:=.f.

//Valida configuração de usuário

dbSelectArea("AL7")
dbSetOrder(1)
if MsSeek(xFilial("AL7")+Padr('AK6',5)+cRelUser) //Classe
  While AL7->(AL7_FILIAL+AL7_ENTIDA+AL7_USER)=xFilial("AL7")+Padr('AK6',5)+cRelUser
	if AL7->AL7_DIREIT='1'
	    DbSkip()
	    Loop
	endif
    if cConteudo>=AllTrim(AL7->AL7_FX_INI) .and. cConteudo<=AllTrim(AL7->AL7_FX_FIN)
        lRet:=.t.
      exit
    endif
    DbSkip()
  Enddo
  if !lRet
     MsgAlert("Lançamento não permitido para o Classe informada!")
  endif
else
  lRet:=lRetDef
endif
Return lRet

User Function ValUsrOp()
Local	lRetDef:=SuperGetMV("MV_XPCOBTF",.F.,.F.) 
Local	cConteudo	:=	AllTrim(&(ReadVar()))
Private cRelUser := RetCodUsr()
Private lRet:=.f.

//Valida configuração de usuário

dbSelectArea("AL7")
dbSetOrder(1)
if MsSeek(xFilial("AL7")+Padr('AKF',5)+cRelUser) //Operação
  While AL7->(AL7_FILIAL+AL7_ENTIDA+AL7_USER)=xFilial("AL7")+Padr('AKF',5)+cRelUser
	if AL7->AL7_DIREIT='1'
	    DbSkip()
	    Loop
	endif
    if (cConteudo>=AllTrim(AL7->AL7_FX_INI) .and. cConteudo<=AllTrim(AL7->AL7_FX_FIN)) .OR. Empty(cConteudo)
        lRet:=.t.
      exit
    endif
    DbSkip()
  Enddo
  if !lRet
     MsgAlert("Lançamento não permitido para a Operação informada!")
  endif
else
  lRet:=lRetDef 
endif
Return lRet             


/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCOValStq ¦ Utilizador ¦ Daniel Coelho   ¦ Data ¦ 06/10/16 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Retorna se a movimentação controla ou nao estoque          ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKC e funções (PCOVAL)  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function PCOVlStq(_cTES,_cCl)
Local aArea   := GetArea()
Local _lRet   := .F. 
Local _cStqCl := SuperGetMV("MV_XSTQCL",.F.,"")     
Local _lCampo := AK6->(FieldPos("AK6_XCTRPC"))> 0         

If Alltrim(_cTES) = '' 																					.or.;
	Posicione("SF4",1,xFilial("SF4")+_cTES,"F4_ESTOQUE") <> "S" 							.or.;
	If(_lCampo , (Posicione("AK6",1,xFilial("AK6")+_cCl,"AK6_XCTRPC") = "S") , .F.) 	.or.;
	Alltrim(_cCl) $ _cStqCl
	_lRet := .T.
EndIf   

RestArea(aArea)
Return _lRet
    
User Function PCOSaldo(dData,cCO,cClasse,cOper)
Local aArea   := GetArea()
Local cQry 			:= ''
Local dDataIni:=FirstDay(dData)
Local dDataFim:=LastDay(dData)
Local nValPrv:=nValReal:=0
Local _cTpSld := ''
   
DbSelectArea("AKJ")
_cTpSld := AKJ->AKJ_TPSLD
   
If		 _cTpSld = '6'   		        /// Anual
		 dDataIni := CtoD( '01/01/' + Alltrim(Str(Year(dData))))
		 dDataFim := CtoD( '31/12/' + Alltrim(Str(Year(dData))))     
ElseIf _cTpSld = '7'   		    	///  Trimestral
		 If 	 Month(dData) <= 3
				 dDataIni := CtoD( '01/01/' + Alltrim(Str(Year(dData))))
 				 dDataFim := CtoD( '31/03/' + Alltrim(Str(Year(dData))))     
		 ElseIf Month(dData) <= 6
		 		 dDataIni := CtoD( '01/04/' + Alltrim(Str(Year(dData))))
				 dDataFim := CtoD( '30/06/' + Alltrim(Str(Year(dData))))     
		 ElseIf Month(dData) <= 9
				 dDataIni := CtoD( '01/07/' + Alltrim(Str(Year(dData))))
				 dDataFim := CtoD( '30/09/' + Alltrim(Str(Year(dData))))     
		 Else
				 dDataIni := CtoD( '01/10/' + Alltrim(Str(Year(dData))))
				 dDataFim := CtoD( '31/12/' + Alltrim(Str(Year(dData))))     
		 EndIf
ElseIf _cTpSld = '5'					/// Semestral
		 If Month(dData) <= 6
			 dDataIni := CtoD( '01/01/' + Alltrim(Str(Year(dData))))
			 dDataFim := CtoD( '30/06/' + Alltrim(Str(Year(dData))))     
    	 Else
			 dDataIni := CtoD( '01/07/' + Alltrim(Str(Year(dData))))
			 dDataFim := CtoD( '31/12/' + Alltrim(Str(Year(dData))))     
    	 EndIf
EndIf

	cQry:="SELECT AKD_CO,AKD_CLASSE,AKD_OPER, "+;            
		"SUM(CASE WHEN AKD_TPSALD='00' THEN AKD_VALOR1 * (CASE WHEN AKD_TIPO='1' THEN 1 ELSE -1 END) ELSE 0 END) ORC, "+;
		"SUM(CASE WHEN AKD_TPSALD='40' THEN AKD_VALOR1 * (CASE WHEN AKD_TIPO='1' THEN 1 ELSE -1 END) ELSE 0 END) CTG, "+;
		"SUM(CASE WHEN AKD_TPSALD='50' THEN AKD_VALOR1 * (CASE WHEN AKD_TIPO='1' THEN 1 ELSE -1 END) ELSE 0 END) EMP, "+;
		"SUM(CASE WHEN AKD_TPSALD='99' THEN AKD_VALOR1 * (CASE WHEN AKD_TIPO='1' THEN 1 ELSE -1 END) ELSE 0 END) REA, "+;
		"SUM(CASE WHEN AKD_TPSALD='00' THEN AKD_VALOR1 * (CASE WHEN AKD_TIPO='1' THEN 1 ELSE -1 END) ELSE 0 END)-SUM(CASE WHEN AKD_TPSALD IN ('40','50','99') THEN AKD_VALOR1 * (CASE WHEN AKD_TIPO='1' THEN 1 ELSE -1 END) ELSE 0 END) AS SALDO  "+;
		"FROM "+RetSqlName("AKD")+" A "+;
		"WHERE A.D_E_L_E_T_<>'*' "+;
		"AND AKD_DATA   BETWEEN '"+DTOS(dDataIni)+"' AND '"+DTOS(dDataFim)+"' "+;
		"AND AKD_CO    =  '"+cCO+"'"+;
		"AND AKD_CLASSE =  '"+cClasse+"'"+;
		"AND AKD_OPER   =  '"+cOper+"'"+;
		"AND AKD_STATUS = '1' "+;
		"GROUP BY AKD_CO,AKD_CLASSE,AKD_OPER "+;
		"ORDER BY AKD_CO,AKD_CLASSE,AKD_OPER "

//		"AND AKD_VERSAO = '" + U_PCOPlaVer(dData) + "'"+;		

	dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry), 'QRY', .F., .T.)
	QRY->(dbGoTop())

	nValPrv:= QRY->(ORC+CTG)
	nValReal:=QRY->(EMP+REA)

	QRY->(dbCloseArea())
RestArea(aArea)
Return(nValPrv-nValReal)

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PCORetChv¦ Utilizador ¦ Claudio Ferreira  ¦ Data ¦ 23/11/17¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Retorna chave para contingência                            ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ Utilizado nos Pontos de Lançamento AKI          		  	  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function PCORetChv() 
Local cRet :=AKD->(AKD_CO+AKD_CLASSE+AKD_OPER+STRZERO(AKD_VALOR1*100,14,0)) 
Return cRet