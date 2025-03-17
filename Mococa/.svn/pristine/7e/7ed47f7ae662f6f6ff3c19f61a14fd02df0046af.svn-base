#INCLUDE "RWMAKE.CH"
#INCLUDE 'protheus.ch'
  
User Function A261TOK()
  
Local lRet:= .T.

    If (FunName()  <> 'MGLT22SKD' .And.  FunName()  <> 'MGLTSKD22')
        If DA261DATA  > dDataBase     
            msginfo("Não é permitido Realizar Movimentação com data futura!", "Atenção")
            lRet:= .F.
        Endif
    EndIf

Return lRet
