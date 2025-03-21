#include 'protheus.ch'
#include 'parmtype.ch'

/*/{Protheus.doc} GT1ITEM
// Ponto de entrada do Importador XML para carregar campos para o Documento de Entrada.
@author Conex�oNF-e
@since 25/02/2019
@version undefined

@type function

// Historico de alteracoes:
// 29/03/20023 - Caique Mercadante - Alterado SQL para entrada dos produtos B1_XSPOT = 'N'

/*/

User Function GT1ITEM()
	Local aAreaAnt := GetArea()
	//Local aItens := PARAMIXB[1]
	Local aAdItem := {} // PARAMIXB[1]
	Local cTab1 := ""
	Local cCmp1 := ""
	Local cAliasQry := ""
	Local cTicket := ""
	//Local cFunName := FunName()

	cTab1 := Upper(AllTrim(GetNewPar("MV_XGTTAB1", "")))
	cCmp1 := IIf(SubStr(cTab1, 1, 1) == "S", SubStr(cTab1, 2, 2), cTab1)

	cAliasQry := GetNextAlias()
	BeginSql alias cAliasQry
	  SELECT Z19.Z19_TICKET
	    FROM %table:Z19% Z19
		LEFT JOIN  %table:SB1% SB1
				ON SB1.%notDel%
		AND Z19.Z19_PROD = SB1.B1_COD
		   WHERE Z19.Z19_FILIAL = %xfilial:Z19%
		     AND Z19.Z19_CHVNFE = %exp:(cTab1)->&(cCmp1 + "_CHAVE")%
			 AND (Z19.Z19_P2 > 0 //Caique chamar apenas quando tiver Peso2
			 OR SB1.B1_XSPOT = 'N')
			 AND Z19.Z19_STATUS = 'A'
		     AND Z19.%notDel%
			 
	%noparser%
	EndSql

	If (cAliasQry)->(!Eof())
		cTicket := (cAliasQry)->Z19_TICKET
	EndIf
	(cAliasQry)->(dbCloseArea())

	If !Empty(cTicket)
		aAdd(aAdItem, {"D1_XTICKET", cTicket, Nil})  // Ticket de pesagem
	EndIf

	RestArea(aAreaAnt)
Return(aAdItem)
