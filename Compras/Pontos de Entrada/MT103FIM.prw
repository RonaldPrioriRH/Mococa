#include "protheus.ch" 

/*/{Protheus.doc} MT103FIM
Ponto de entrada executado ap�s o destravamento de todas as tabelas envolvidas na grava��o do documento de entrada,
depois de fechar a opera��o realizada neste, � utilizado para realizar alguma opera��o ap�s a grava��o da NFE.
@author TOTVS
@since 06/04/2017
@version P12
@param nulo            
@return nulo
/*/

User Function MT103FIM()
	Local aArea 	:= GetArea()
	Local nOpcao 	:= PARAMIXB[1] //Opcao escolhida pelo usuario no aRotina
	Local nConfirma := PARAMIXB[2] //Se o usuario confirmou a operacao de gravacao da NFE  

	// Ponto de chamada Conex�oNF-e
	U_GTPE002()

	// Ir� fazer as valida��es abaixo quando n�o for chamado atrav�s do Importador Conex�oNfe ou Quando for pelo Conex�oNfe e
	// esteja na tela do Documento de Entrada
	If !FwIsInCallStack('U_GATI001') .Or. (FwIsInCallStack('U_GATI001') .And. !l103Auto) .And. PARAMIXB[2] <> 0
			//alert("passei por aqui!") 
			//Contratos
		U_RCOME003(nOpcao,nConfirma)
			
		//chama tratamentos para motivo devolu�ao na comiss�o
		//se gerou SE3 negativo (configurar MV_COMIDEV = T)
		U_RFINE002(nOpcao,nConfirma)
			
		//chama tratamentos para vincular nota de servi�o de comiss�o, emitida pelo vendedor
		//nos itens SE3 e no titulo SE1			
		U_RFINE006(nOpcao,nConfirma)
					
		//Gera ocorrencia de pesagem para produto Leite Spot
		U_RCOME004(nOpcao,nConfirma)

		//Realiza Baixa do Ticket ap�s Importa��o da  NF de Entrada
		U_RCOME013(nOpcao,nConfirma)
					  
	EndIf

	RestArea(aArea)

Return
