#include "protheus.ch" 
#include "topconn.ch"
#include "fwmvcdef.ch"

/*/{Protheus.doc} RFATE031
Processa apuração de cláusulas, cuja aplicação seja igual a Apuração - Contratos
@author TOTVS
@since 26/04/2017
@version P12
@param cContrato,cTitFin,cNaturez,nVlrTit,cCgc,aItLog            
@return nulo
/*/

/*********************************************************************/
User Function RFATE031(cContrato,cTitFin,cNaturez,nVlrTit,cCgc,aItLog)
/*********************************************************************/

Local lRet 			:= .T.
//Local nI

Private nRecnoTit
Private cIdApur		:= ""

DbSelectArea("SA2")
SA2->(DbSetOrder(3)) //A2_FILIAL+A2_CGC

If cTitFin == "A" //A Pagar
	
	SA2->(DbSetOrder(3)) //A2_FILIAL+A2_CGC
	SA2->(DbGoTop())
	
	If !SA2->(DbSeek(xFilial("SA2")+cCgc))
		MsgInfo("Fornecedor com o CNPJ/CPF "+cCgc+" não localizado, título não gerado.","Aviso")
		lRet := .F.
	Else	
		lRet := GeraTitA(cContrato,cNaturez,nVlrTit,SA2->A2_COD,SA2->A2_LOJA)
		
		If lRet

			AtuItLog(aItLog)
			
			lRet := U_RFATE033(cContrato,SA2->A2_COD,SA2->A2_LOJA,cTitFin,cNaturez,nVlrTit,aItLog,@cIdApur)

			//Atualiza o título com informação/amarração do Log 
			If lRet
				AltTitA(nRecnoTit,cIdApur)//,cContrato)
			Endif
		Endif
	Endif
	
Else //NCC

	SA1->(DbSetOrder(3)) //A1_FILIAL+A1_CGC
	SA1->(DbGoTop())
	
	If SA1->(DbSeek(xFilial("SA1")+cCgc))

		lRet := GeraTitN(cContrato,cNaturez,nVlrTit,SA1->A1_COD,SA1->A1_LOJA)

		If lRet

			AtuItLog(aItLog)

			lRet := U_RFATE033(cContrato,SA1->A1_COD,SA1->A1_LOJA,cTitFin,cNaturez,nVlrTit,aItLog,@cIdApur)

			//Atualiza o título com informação/amarração do Log 
			If lRet
				AltTitN(nRecnoTit,cIdApur)//,cContrato)
			Endif
		Endif
	Endif
Endif

Return lRet

/******************************************************************/
Static Function GeraTitA(cContrato,cNaturez,nVlrTit,cFornece,cLoja)
/******************************************************************/

Local lRet			:= .T.
Local aFin050 		:= {}

Local cPref 		:= SuperGetMv("MV_XPREFCU",.F.,"APU")
Local cTipo			:= SuperGetMv("MV_XTIPOCT",.F.,"CTR")
Local dVencto		:= dDataBase + SuperGetMv("MV_XDIAVEN",.F.,5) 

Private lMsErroAuto := .F.
Private lMsHelpAuto := .T.

cParcela := RetParcSE2(cPref,cContrato,cTipo,cFornece,cLoja)

AAdd(aFin050, {"E2_FILIAL"	, xFilial("SE2")				,Nil } )
AAdd(aFin050, {"E2_PREFIXO"	, cPref							,Nil } )	
AAdd(aFin050, {"E2_NUM"		, cContrato						,Nil } )
AAdd(aFin050, {"E2_PARCELA"	, cParcela						,Nil } )
AAdd(aFin050, {"E2_TIPO"	, cTipo							,Nil } )
AAdd(aFin050, {"E2_NATUREZ"	, cNaturez						,Nil } )
AAdd(aFin050, {"E2_FORNECE"	, cFornece						,Nil } )
AAdd(aFin050, {"E2_LOJA"	, cLoja							,Nil } )
AAdd(aFin050, {"E2_EMISSAO"	, dDataBase						,Nil } )
AAdd(aFin050, {"E2_VENCTO"	, dVencto				   		,Nil } )
AAdd(aFin050, {"E2_VENCREA"	, DataValida(dVencto)			,Nil } )
AAdd(aFin050, {"E2_VALOR"	, nVlrTit						,Nil } )
AAdd(aFin050, {"E2_XCONTRA"	, cContrato						,Nil } )

MSExecAuto({|x,y| FINA050(x,y)},aFin050,3)               

If lMsErroAuto
	MostraErro()                    
	DisarmTransaction()
	lRet := .F.
Else
	nRecnoTit := SE2->(Recno())
EndIf

Return lRet

/******************************************************************/
Static Function GeraTitN(cContrato,cNaturez,nVlrTit,cCliente,cLoja)
/******************************************************************/

Local lRet 			:= .T.
Local aFin040 		:= {}  

Local cPref 		:= SuperGetMv("MV_XPREFCT",.F.,"APU")

Private lMsErroAuto := .F.
Private lMsHelpAuto := .F.   

cParcela := RetParcSE1(cPref,cContrato,"NCC")
                                              
AAdd(aFin040, {"E1_FILIAL"	, xFilial("SE1")				,Nil } )
AAdd(aFin040, {"E1_PREFIXO"	, cPref         				,Nil } ) 
AAdd(aFin040, {"E1_NUM"		, cContrato		 				,Nil } ) 
AAdd(aFin040, {"E1_PARCELA"	, cParcela						,Nil } )
AAdd(aFin040, {"E1_TIPO"	, "NCC"		 					,Nil } )
AAdd(aFin040, {"E1_NATUREZ"	, cNaturez						,Nil } )
AAdd(aFin040, {"E1_CLIENTE"	, cCliente						,Nil } )
AAdd(aFin040, {"E1_LOJA"	, cLoja							,Nil } )
AAdd(aFin040, {"E1_EMISSAO"	, dDataBase						,Nil } )
AAdd(aFin040, {"E1_VENCTO"	, dDataBase						,Nil } )
AAdd(aFin040, {"E1_VENCREA"	, DataValida(dDataBase)			,Nil } )
AAdd(aFin040, {"E1_VALOR"	, nVlrTit						,Nil } )
AAdd(aFin040, {"E1_XCONTRA"	, cContrato						,Nil } )

MSExecAuto({|x,y| FINA040(x,y)},aFin040,3)

If lMsErroAuto
	MostraErro()
	DisarmTransaction()
	lRet := .F.           
Else
	nRecnoTit := SE1->(Recno())
EndIf

Return lRet

/***************************************************************/
Static Function RetParcSE2(cPref,cContrato,cTipo,cFornece,cLoja)
/***************************************************************/

Local cParcela	:= ""
Local cQry		:= ""

If Select("QRYSE2") > 0
	QRYSE2->(DbCloseArea())
EndIf     

cQry := " SELECT MAX(E2_PARCELA) AS ULTPARC"
cQry += " FROM "+RetSqlName("SE2")+""
cQry += " WHERE D_E_L_E_T_	<> '*'"
cQry += " AND E2_FILIAL 	= '"+xFilial("SE2")+"'"
cQry += " AND E2_PREFIXO 	= '"+cPref+"'"
cQry += " AND E2_NUM 		= '"+cContrato+"'"
cQry += " AND E2_TIPO 		= '"+cTipo+"'"	
cQry += " AND E2_FORNECE	= '"+cFornece+"'"	
cQry += " AND E2_LOJA 		= '"+cLoja+"'"	

cQry := ChangeQuery(cQry)
TcQuery cQry New Alias "QRYSE2"   

If QRYSE2->(!EOF()) .And. !Empty(QRYSE2->ULTPARC)
	cParcela := Soma1(QRYSE2->ULTPARC)	
Else
	cParcela := PADL("1",TamSX3("E2_PARCELA")[1],"0")		
Endif

If Select("QRYSE2") > 0
	QRYSE2->(DbCloseArea())
EndIf 

Return cParcela

/***************************************************************/
Static Function RetParcSE1(cPref,cContrato,cTipo,cCliente,cLoja)
/***************************************************************/

Local cParcela	:= ""
Local cQry		:= ""

If Select("QRYSE1") > 0
	QRYSE1->(DbCloseArea())
EndIf     

cQry := " SELECT MAX(E1_PARCELA) AS ULTPARC"
cQry += " FROM "+RetSqlName("SE1")+""
cQry += " WHERE D_E_L_E_T_	<> '*'"
cQry += " AND E1_FILIAL 	= '"+xFilial("SE1")+"'"
cQry += " AND E1_PREFIXO 	= '"+cPref+"'"
cQry += " AND E1_NUM 		= '"+cContrato+"'"
cQry += " AND E1_TIPO 		= '"+cTipo+"'"	

cQry := ChangeQuery(cQry)
TcQuery cQry New Alias "QRYSE1"   

If QRYSE1->(!EOF()) .And. !Empty(QRYSE1->ULTPARC)
	cParcela := Soma1(QRYSE1->ULTPARC)	
Else
	cParcela := PADL("1",TamSX3("E1_PARCELA")[1],"0")		
Endif

If Select("QRYSE1") > 0
	QRYSE1->(DbCloseArea())
EndIf 

Return cParcela

/*****************************************/
Static Function AltTitA(nRecnoTit,cIdApur)
/*****************************************/

DbSelectArea("SE2")
SE2->(DbGoTo(nRecnoTit))

RecLock("SE2",.F.)
SE2->E2_XIDAPUR := cIdApur
SE2->(MsUnlock())                                              

Return

/*****************************************/
Static Function AltTitN(nRecnoTit,cIdApur)
/*****************************************/

DbSelectArea("SE1")
SE1->(DbGoTo(nRecnoTit))

RecLock("SE1",.F.)
SE1->E1_XIDAPUR := cIdApur
SE1->(MsUnlock())                                              

Return

/*******************************/
Static Function AtuItLog(aItLog)
/*******************************/

Local nI

DbSelectArea("Z14")
Z14->(DbSetOrder(1)) //Z14_FILIAL+Z14_CODIGO+Z14_ITEM

For nI := 1 To Len(aItLog)

	If Z14->(DbSeek(xFilial("Z14")+aItLog[nI][1]+aItLog[nI][2]))
	
		RecLock("Z14",.F.)
		Z14->Z14_APURAD := "S" //Apurado
		Z14->(MsUnlock())
	Endif
Next

Return
