#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ PROXIMO    	¦ Autor ¦ Totvs    	¦ Data ¦ 08/11/2013 	  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ FUNCAO PARA RETORNAR O PROXIMO CODIGO.					  ¦¦¦
¦¦¦          ¦ DEVE SER PASSADO O ALIAS E O CAMPO DO CODIGO e FILIAL.	  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ TOTVS - GO		                                          ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/ 
User Function PROXIMO(_alias,_campo,_filial,_complm,_ntam)

Local _cLocal	:= GETAREA()
Local _nProx	:= ''
Local _cCampo	:= _campo
Local _cAlias	:= _alias
Local _cFilial	:= _filial       
Default _complm := ""
Default _ntam	:= TamSX3(_campo)[1]

If empty(_cCampo) .or. empty(_cAlias)
	return 0
Endif

cQry := " SELECT MAX("+_cCampo+") PROX "
cQry += " FROM "+RetSqlName(_cAlias)
cQry += " WHERE D_E_L_E_T_ <> '*' "
If !Empty(_cFilial)
	//preenche filial do alias
	If left(_cAlias,1)<>"S"
		cQry += " AND "+_cAlias+"_FILIAL = '"+_cFilial+"' " //ZZZ_FILIAL := xfilial("ZZZ")
	Else
		cQry += " AND "+right(_cAlias,2)+"_FILIAL = '"+_cFilial+"' " //Z1_FILIAL := xfilial("SZ1")
	Endif
EndIf 
if !empty(_complm) //complemento da query
	cQry += " AND "+_complm 
endif

If Select("QAUX") > 0
	QAUX->(dbCloseArea())
EndIf
	
cQry := ChangeQuery(cQry)
dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUX", .F., .T.)

IF EMPTY(QAUX->PROX)
	_nProx := STRZERO(1,_ntam)
ELSE
	_nProx := Soma1(Substr(QAUX->PROX,1,_ntam))
	FreeUsedCode()
	While !MayIUseCode(_cAlias+xFilial(_cAlias)+_nProx)
		_nProx := Soma1(Substr(QAUX->PROX,1,_ntam))
	EndDo
ENDIF
QAUX->(DBCLOSEAREA())

RESTAREA(_cLocal)

RETURN _nProx