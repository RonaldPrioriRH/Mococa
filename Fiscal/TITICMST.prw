//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"

User Function TITICMST()
//Local cOrigem := PARAMIXB[1]
Local cTipoImp := PARAMIXB[2]
//Local lDifal := PARAMIXB[3]
 

If AllTrim(cTipoImp)='1' // ICMS ST
    SE2->E2_VENCTO  := DataValida(dDataBase,.T.)
    SE2->E2_VENCREA := DataValida(dDataBase,.T.)
EndIf
 
Return {SE2->E2_NUM,SE2->E2_VENCTO}
