#INCLUDE "RWMAKE.CH"
#INCLUDE 'protheus.ch'
  
//=================================================================================
/*/{Protheus.doc} MT260TOK
Bloqueio de Transf. Simples com data divergente a data atual do sistema    (MATA260)
  
@type       function
@author     Caique Mercadante
@since      23/09/2022
@version    1.0
@return     .T. Libera transferencia
/*/
//=================================================================================
User Function MT260TOK()    
  
Local lRet:= .T.
  
        //If DA241DATA  <> dDataBase
        If (FunName()  <> 'MGLT22SKD' .And.  FunName()  <> 'MGLTSKD22')
            If DEMIS260  > dDataBase
                msginfo("Não é permitido Realizar Movimentação com data futura!", "Atenção")
                lRet:= .F.
            Endif
        EndIf

Return lRet


