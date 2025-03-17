#INCLUDE "TOTVS.CH"
 
User Function POSFilOp()
    Local cTipoApon := PARAMIXB[1] //Tipo do apontamento | 1-Simples MATA250; 3-MOD 2 MATA681; 4-SFC
    Local cOp       := PARAMIXB[2] //Ordem de Produção
    Local cStatusOp := PARAMIXB[3] //Status da Ordem de Produção | 1-Prevista; 2-Em aberto; 3-Iniciada; 5-Encerrada Parcialmente; 6-Encerrada Totalmente
    Local cSplit    := PARAMIXB[4] //Código do Split (SFC) - Nil quando não for do SFC
    Local cOperacao := PARAMIXB[5] //Código da Operação - Nil quando for validação da Ordem de Produção
    Local cFormCode := PARAMIXB[6] //Código do Formulário de Apontamento utilizado para chamar a PE
    Local lRetOp    := .T.
 
    If cStatusOp $ ('6') 
        lRetOp := .F. //Não irá apresentar OP Encerrada Totalmente na Consulta de OP pelo APP Minha Produção.
    EndIf

    If cTipoApon $ ('1/2/3/5/6')
        lRetOp := .F. //Não irá apresentar OP Encerrada Totalmente na Consulta de OP pelo APP Minha Produção.
    EndIf
 
 Return lRetOp

