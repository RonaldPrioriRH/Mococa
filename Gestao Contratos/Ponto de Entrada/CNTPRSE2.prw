#INCLUDE 'PROTHEUS.CH'

//------------------------------------------------------------
/*/{Protheus.doc} CNTPRSE2
Ponto de Entrada CNTPRSE2

LOCALIZAÇÃO:  Function CN100CTit - Função chamada na geração dos títulos financeiro de previsão do contrato.
EM QUE PONTO:  Executado na gravação do SE2, permite alterar e preencher campos específicos.
Link oficial de rotinas relacionadas: http://tdn.totvs.com/pages/releaseview.action?pageId=6089601

@param Nenhum (nulo)
@return Nenhum (nulo)
@author Pablo Cavalcante

@history
23/11/2015 - Programação inicial

/*/
//------------------------------------------------------------

User Function CNTPRSE2()
	If CN9->(FieldPos("CN9_NATURE")) > 0 .and. !Empty(CN9->CN9_NATURE)
		SE2->E2_NATUREZ := CN9->CN9_NATURE //MV_CNNAT
	EndIf
Return