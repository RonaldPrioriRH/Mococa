#include "protheus.ch" 
#include "topconn.ch"
#include "fwmvcdef.ch"

/*/{Protheus.doc} RFATE003
Realiza apuração de cláusulas, cuja aplicação seja igual a Eventual - Contratos
@author TOTVS
@since 10/03/2017
@version P12
@param cCodigo,cTitFin,cNaturez,cItClausu,nVlrTit,aClientes            
@return nulo
/*/

/***************************************************************************/
User Function RFATE003(cCodigo,cTitFin,cNaturez,cItClausu,nVlrTit,aClientes)
/***************************************************************************/

Local lRet 			:= .T.

Local nI
Local aItClausu		:= {}

Private nRecnoTit
Private cIdMovCtr	:= ""

DbSelectArea("SA2")
SA2->(DbSetOrder(3)) //A2_FILIAL+A2_CGC

If cTitFin == "A" //A Pagar
	
	Begin TransacTion
	
	For nI := 1 To Len(aClientes)
	
		cIdMovCtr := ""
	
		SA2->(DbSetOrder(3)) //A2_FILIAL+A2_CGC
		SA2->(DbGoTop())
		
		If !SA2->(DbSeek(xFilial("SA2")+aClientes[nI][3]))
			MsgInfo("Fornecedor com o CGC "+Transform(aClientes[nI][3],"@R 99.999.999/9999-99")+" não localizado, operação cancelada.","Aviso")
			DisarmTransaction()
			lRet := .F.
			Exit
		Else	
			lRet := U_GeraTitA(cCodigo,cNaturez,nVlrTit,SA2->A2_COD,SA2->A2_LOJA,aClientes[nI][1],aClientes[nI][2])
			
			If lRet
				
				//Gera Log da movimentação
				AAdd(aItClausu,cItClausu)
				lRet := U_RFATE004("AE",cCodigo,aItClausu,SA2->A2_COD,SA2->A2_LOJA,@cIdMovCtr)
				
				//Atualiza o título com informação/amarração do Log 
				If lRet
					AltTitA(nRecnoTit,cIdMovCtr,cCodigo)
				Else
					DisarmTransaction()
					lRet := .F.
					Exit
				Endif
			Endif
		Endif
	Next
	
	End TransacTion
Else //NCC

	Begin TransacTion

	For nI := 1 To Len(aClientes)
	
		lRet := U_GeraTitN(cCodigo,cNaturez,nVlrTit,aClientes[nI][1],aClientes[nI][2])
		
		If lRet
			//Gera Log da movimentação
			AAdd(aItClausu,cItClausu)
			lRet := U_RFATE004("AE",cCodigo,aItClausu,aClientes[nI][1],aClientes[nI][2],@cIdMovCtr)
			
			//Atualiza o título com informação/amarração do Log 
			If lRet
				AltTitN(nRecnoTit,cIdMovCtr,cCodigo)
			Else
				DisarmTransaction()
				lRet := .F.
				Exit
			Endif
		Endif
	Next
	
	End TransacTion
Endif

Return lRet

/****************************************************************/
User Function GeraTitA(cContrato,cNaturez,nVlrTit,cFornece,cLoja,cCliente,cLojCli)
/****************************************************************/

Local lRet			:= .T.
Local aFin050 		:= {}

Local cPref 		:= SuperGetMv("MV_XPREFCT",.F.,"EVE")
Local cTipo			:= SuperGetMv("MV_XTIPOCT",.F.,"CTR")
Local dVencto		:= dDataBase + SuperGetMv("MV_XDIAVEN",.F.,5) 

Local cCO:=''
Local cA1CO:=''
Local cA3CO:=''
Local aArea:=GetArea()

Private lMsErroAuto := .F.
Private lMsHelpAuto := .T.

cParcela := RetParcSE2(cPref,cContrato,cTipo,cFornece,cLoja)

//Trata PCO Claudio 22.12.17

SA1->(Dbsetorder(1))
SA1->(Dbseek(xFilial("SA1")+cCliente+cLojCli))
SA3->(Dbsetorder(1))
SA3->(Dbseek(xFilial("SA3")+SA1->A1_VEND))
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
AAdd(aFin050, {"E2_CCD"		, cCO				 	  		,Nil } )

MSExecAuto({|x,y| FINA050(x,y)},aFin050,3)               

If lMsErroAuto
	MostraErro()                    
	DisarmTransaction()
	lRet := .F.
Else
	nRecnoTit := SE2->(Recno())
EndIf
RestArea(aArea)
Return lRet

/****************************************************************/
User Function GeraTitN(cContrato,cNaturez,nVlrTit,cCliente,cLoja)
/****************************************************************/

Local lRet 			:= .T.
Local aFin040 		:= {}  

Local cPref 		:= SuperGetMv("MV_XPREFCT",.F.,"EVE")
Local cCO:=''
Local cA1CO:=''
Local cA3CO:=''
Local aArea:=GetArea()

Private lMsErroAuto := .F.
Private lMsHelpAuto := .F.   

//Trata PCO Claudio 22.12.17

SA1->(Dbsetorder(1))
SA1->(Dbseek(xFilial("SA1")+cCliente+cLoja))
SA3->(Dbsetorder(1))
SA3->(Dbseek(xFilial("SA3")+SA1->A1_VEND))
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
AAdd(aFin050, {"E1_CCD"		, cCO				 	  		,Nil } )
MSExecAuto({|x,y| FINA040(x,y)},aFin040,3)

If lMsErroAuto
	MostraErro()
	DisarmTransaction()
	lRet := .F.           
Else
	nRecnoTit := SE1->(Recno())
EndIf
RestArea(aArea)
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

/*****************************************************/
Static Function AltTitA(nRecnoTit,cIdMovCtr,cContrato)
/*****************************************************/

DbSelectArea("SE2")
SE2->(DbGoTo(nRecnoTit))

RecLock("SE2",.F.)
SE2->E2_XIDMOVI := cIdMovCtr
SE2->E2_XCONTRA := cContrato
SE2->(MsUnlock())                                              

Return

/*****************************************************/
Static Function AltTitN(nRecnoTit,cIdMovCtr,cContrato)
/*****************************************************/

DbSelectArea("SE1")
SE1->(DbGoTo(nRecnoTit))

RecLock("SE1",.F.)
SE1->E1_XIDMOVI := cIdMovCtr
SE1->E1_XCONTRA := cContrato
SE1->(MsUnlock())                                              

Return