#include "protheus.ch"

/*/{Protheus.doc} MNTA280E
description
@type function
@version  
@author caique.mercadante
@since 06/02/2023
@return variant, return_description
https://tdn.totvs.com/pages/releaseview.action?pageId=118885622
/*/

User Function MNTA280E()

Local cCodUser := RetCodUsr() //Retorna o código do usuário corrente
Local cSSAdm := SuperGetMv("MV_XSSADM",.F.,"") 
Local lRet := .F.

    If (AllTrim( TQB->TQB_CDSOLI ) != AllTrim(cCodUser) .And. !FwIsAdmin()) .And. AllTrim(cCodUser) $ cSSAdm  //Verifica se o usuario é o mesmo que abriu a SS.
        lRet := MsgYesNo( "O usuário não é o mesmo que abriu a solicitação de serviço ou não pertence ao grupo de Administradores. Deseja excluir mesmo assim?" )
    EndIf

Return lRet


