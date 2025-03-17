#INCLUDE "TOTVS.CH"
 
User Function POSFilOp()
    Local cTipoApon := PARAMIXB[1] //Tipo do apontamento | 1-Simples MATA250; 3-MOD 2 MATA681; 4-SFC
    Local cOp       := PARAMIXB[2] //Ordem de Produ��o
    Local cStatusOp := PARAMIXB[3] //Status da Ordem de Produ��o | 1-Prevista; 2-Em aberto; 3-Iniciada; 5-Encerrada Parcialmente; 6-Encerrada Totalmente
    Local cSplit    := PARAMIXB[4] //C�digo do Split (SFC) - Nil quando n�o for do SFC
    Local cOperacao := PARAMIXB[5] //C�digo da Opera��o - Nil quando for valida��o da Ordem de Produ��o
    Local cFormCode := PARAMIXB[6] //C�digo do Formul�rio de Apontamento utilizado para chamar a PE
    Local lRetOp    := .T.
 
    If cStatusOp $ ('6') 
        lRetOp := .F. //N�o ir� apresentar OP Encerrada Totalmente na Consulta de OP pelo APP Minha Produ��o.
    EndIf

    If cTipoApon $ ('1/2/3/5/6')
        lRetOp := .F. //N�o ir� apresentar OP Encerrada Totalmente na Consulta de OP pelo APP Minha Produ��o.
    EndIf
 
 Return lRetOp

