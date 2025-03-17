#INCLUDE "Protheus.ch"
#INCLUDE "rwmake.ch"
#include "topconn.ch"
#INCLUDE "TbiConn.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³RFATE020  ³Microsiga           º Data ³  05/01/13     º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Evitar Alteração de PV na carga                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
 

User Function RFATE020()
Local _cSQL := ""
Local lRet 	:= .T., nQtd := 0

_cSQL := "SELECT Count(*) NTOT "
	_cSQL += "FROM " + RetSqlName("SC9") + " SC9 "
    _cSQL += "WHERE SC9.C9_FILIAL = '" + xFilial("SC9") + "' "
	    _cSQL += "AND SC9.C9_PEDIDO = '" + SC5->C5_NUM + "' AND C9_CARGA <> ' ' AND C9_NFISCAL = ' ' "
	    _cSQL += "AND SC9.D_E_L_E_T_ = ' ' "
    
_cSQL := ChangeQuery(_cSQL) //comando para evitar erros de incompatibilidade de bancos

TcQuery _cSQL New Alias "QRYOP" // Cria uma nova area com o resultado do query
	nQtd := QRYOP->nTot
QRYOP->( DbCloseArea() )

if nQtd > 0 .and. Procname(11) == "MATA410" .and. altera
	lRet := .F.
endif
Return lRet