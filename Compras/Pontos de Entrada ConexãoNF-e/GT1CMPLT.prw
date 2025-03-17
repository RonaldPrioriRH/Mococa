#INCLUDE "PROTHEUS.CH"

/*/{Protheus.doc} GT1CMPLT
// Ponto de entrada para permitir adicionar campos na importação do CTe por lote
@author ConexãoNF-e
@since 01/09/2022
@version 1.0
@return aCampos, Estrutura dos campos adicionais
/*/
User Function GT1CMPLT()
Local aCampos := {}

	//            Tabela, Campo      , Título    , F3  , Nil <reservado para conteúdo>
    aAdd(aCampos,{"SF1" ,"F1_MENNOTA","Mens.p/Nota"  ,""   ,Nil})
    
Return aCampos
