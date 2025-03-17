#INCLUDE "RWMAKE.CH"
#INCLUDE 'protheus.ch'
  
User Function A261TOK()
  
Local lRet:= .T.

    If (FunName()  <> 'MGLT22SKD' .And.  FunName()  <> 'MGLTSKD22')
        If DA261DATA  > dDataBase     
            msginfo("N�o � permitido Realizar Movimenta��o com data futura!", "Aten��o")
            lRet:= .F.
        Endif
    EndIf

Return lRet
