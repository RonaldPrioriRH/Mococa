#Include "Protheus.ch"

/*/{Protheus.doc} GT1VLNFE
Ponto de entrada para validar se a NFe possui ticket de pesagem para os produtos especificos.
Retornando falso e caso esteja no modo automático, mantendo na fila para próxima tentativa.
@author ConexãoNF-e
@since 27/07/2022
@version 1.0
@param Nil, Nil
@return lExists, Retorno verdadeiro ou falso indicando se continua ou não com a importação.

// Historico de alteracoes:
// 29/03/20023 - Caique Mercadante - Alterado SQL para entrada dos produtos B1_XSPOT = 'N'

/*/
User Function GT1VLNFE()
	Local aAreaAnt := GetArea()
	Local aItens := PARAMIXB[1]
	Local cAliasQry := ""
	Local cTab1 := ""
	Local cCmp1 := ""
	Local cTab2 := ""
	Local cCmp2 := ""
	Local cProd := ""
	Local cTipo := ""
	//Local cSpot := ""
	Local nI := 0
	Local nPosProd := 0
	Local lExists := .T.
	Local lContinue := .F.
	//Local cFunName := FunName()
	Local lAuto := IsBlind()

	cTab1 := Upper(AllTrim(GetNewPar("MV_XGTTAB1", "")))
	cCmp1 := IIf(SubStr(cTab1, 1, 1) == "S", SubStr(cTab1, 2, 2), cTab1)

	cTab2 := Upper(AllTrim(GetNewPar("MV_XGTTAB2", "")))
	cCmp2 := IIf(SubStr(cTab2, 1, 1) == "S", SubStr(cTab2, 2, 2), cTab2)

	// Somente para tipo 'Normal'
	If !((cTab1)->&(cCmp1 + "_TIPOEN") == "N")
		RestArea(aAreaAnt)
		Return .T.
	EndIf

	nPosProd := aScan(aHeader, {|x| AllTrim(x[2]) == cCmp2 + "_COD"})
	// Verifica se existe produto com B1_XSPOT igual a S
	For nI := 1 To Len(aItens)
		If nPosProd > 0
			cProd := aItens[nI][nPosProd]
		EndIf

		If !Empty(cProd)
			cTipo := Posicione("SB1",1,xFilial("SB1")+cProd,"B1_TIPO")
			/*
			cSpot := Posicione("SB1",1,xFilial("SB1")+cProd,"B1_XSPOT")
			If cSpot == "S"
				lConEtinue := .T.
				Exit
			EndIf
			*/

			If AllTrim(cTipo) $ ('MP/PI/EM')
				lContinue := .T.
				Exit
			EndIf

		EndIf

	Next nI

	If lContinue

		// Procura pela chave de acesso na tabela de tickets de pesagem
		cAliasQry := GetNextAlias()
		BeginSql alias cAliasQry
		  SELECT 1
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

		If (cAliasQry)->(Eof())
			lExists := .F.
		EndIf
		(cAliasQry)->(dbCloseArea())

		If !lExists
			If lAuto
				// Modo automático mantém o XML na fila
				RecLock(cTab1,.F.)
				(cTab1)->&(cCmp1 + "_SIT") := "3" // Segunda fila de importação
				(cTab1)->&(cCmp1 + "_TIPERR") := "C" // Erro ao efetuar o lançamento
				(cTab1)->&(cCmp1 + "_ERRO") := "Não foi encontrado o Ticket de Pesagem para a nota fiscal. XML continuará na fila para próxima tentativa."
				(cTab1)->(MsUnlock())
			Else
				// Modo manual critica mensagem em tela
				//	if MsgYesNo("Não foi encontrado o Ticket de Pesagem para a nota fiscal! Deseja continuar com a importação?")
				//		lExists	:= .T.
				//	else
				RecLock(cTab1,.F.)
				(cTab1)->&(cCmp1 + "_TIPERR") := "C" // Erro ao efetuar o lançamento
				(cTab1)->&(cCmp1 + "_ERRO") := "Não foi encontrado o Ticket de Pesagem para a nota fiscal."
				(cTab1)->(MsUnlock())
				//	endif
				MsgAlert("Não foi encontrado o Ticket de Pesagem para a nota fiscal.","GT1VLNFE")
			EndIf
		EndIf

	EndIf

	RestArea(aAreaAnt)
Return lExists
