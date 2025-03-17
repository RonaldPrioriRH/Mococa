#Include 'Protheus.ch'

/*/{Protheus.doc} DL200TRB

Gravação do Arquivo Temporário da Carga.
Após a  inclusão dos campos que irão gerar a estrutura do arquivo temporário de pedidos 
na montagem de carga. Os campos adicionais deverão ter suas características (Ver DL200BRW) 
e suas respectivas gravações (ver OM200GRV).

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function DL200TRB()

	Local aCampos := ParamIXB
	
	aadd(aCampos, {"PED_OBSNF" , "C", 200, 0} )
	
	//tratamentos para faturamento triangular
	U_ROMSE006(@aCampos)
	
Return aCampos

