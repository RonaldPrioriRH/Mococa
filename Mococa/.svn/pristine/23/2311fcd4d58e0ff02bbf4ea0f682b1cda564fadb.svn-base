#include "protheus.ch"

/*/{Protheus.doc} FTMSREL
Para que se possa utilizar o banco de conhecimentos utilizando uma tabela de usuário ( Ex. SZ1 ) torna-se necessário informar ao sistema qual a
chave primaria de relacionamento. Por exemplo, a chave primaria de relacionamento do cadastro de clientes  FILIAL+CODIGO+LOJA
@author TOTVS
@since 17/02/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

/**********************/
User Function FTMSREL()
/**********************/

Local aEntidade := {}

AAdd(aEntidade,{"Z09",{"Z09_CODIGO"},{||Z09->Z09_CODIGO}}) //Contratos
AAdd(aEntidade,{"ZE5",{"ZE5_CODIGO"},{|| "Contrato/Aditivo: " + ZE5->ZE5_CONTRA + "/" + ZE5->ZE5_ADITIV} } )

Return (aEntidade)