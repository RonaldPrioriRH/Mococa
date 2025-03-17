#Include 'Protheus.ch'

/*/{Protheus.doc} ROMSE006

Gravação do Arquivo Temporário da Carga. DL200TRB
Após a  inclusão dos campos que irão gerar a estrutura do arquivo temporário de pedidos 
na montagem de carga. Os campos adicionais deverão ter suas características (Ver DL200BRW) 
e suas respectivas gravações (ver OM200GRV).

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function ROMSE006(aCampos)
	
	//adiciono o campo filial estoque e filial intermediaria
	aadd(aCampos, {"PED_FILEST" , "C", TamSX3("C5_FILIAL") [1], 0} )
	aadd(aCampos, {"PED_FILINT" , "C", TamSX3("C5_FILIAL") [1], 0} )
	aadd(aCampos, {"PED_SGAC"   , "C", TamSX3("C5_XPVSGAC")[1], 0} ) // Adicionado para trazer o pedido de venda SGAC
	aadd(aCampos, {"PRV_FAT"    , "D", TamSX3("C6_ENTREG")[1], 0} ) // Previsão de faturamento do pedido
	
Return

