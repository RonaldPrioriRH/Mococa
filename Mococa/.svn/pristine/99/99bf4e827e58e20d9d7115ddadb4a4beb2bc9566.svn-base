#INCLUDE 'PROTHEUS.CH'

//------------------------------------------------------------
/*/{Protheus.doc} CNTPRSE1
Ponto de Entrada CNTPRSE1

LOCALIZAÇÃO:  Function CN100CTit - Função chamada na geração dos títulos financeiro de previsão do contrato.
EM QUE PONTO:  Executado na gravação do SE1, permite alterar e preencher campos específicos.
Link oficial de rotinas relacionadas: http://tdn.totvs.com/pages/releaseview.action?pageId=6089600

@param Nenhum (nulo)
@return Nenhum (nulo)
@author Pablo Cavalcante

@history
23/11/2015 - Programação inicial

/*/
//------------------------------------------------------------

User Function CNTPRSE1()
	If CN9->(FieldPos("CN9_NATURE")) > 0 .and. !Empty(CN9->CN9_NATURE)
		SE1->E1_NATUREZ := CN9->CN9_NATURE //MV_CNNATCL
	EndIf
Return