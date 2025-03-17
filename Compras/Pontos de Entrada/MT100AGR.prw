#include "protheus.ch" 
// MV_CTLIPAG deve esta habilitado como verdadeiro
User Function MT100AGR()
	Local aAreaSe2 	:= se2->(GetArea())
	Local cPortador	:= 'BLQ'
	Local nModAnt := nModulo
	Local cModAnt := cModulo

	Private lMsErroAuto := .F.


	se2->(Dbselectarea("SE2"))
	se2->(Dbsetorder(6))

	If se2->(Dbseek(xFilial("SE2")+sf1->(f1_fornece+f1_loja+f1_prefixo+f1_doc)))
		Do While xFilial('SE2') == se2->e2_filial .and. sf1->(f1_fornece+f1_loja+f1_prefixo+f1_doc) == se2->(e2_fornece+e2_loja+e2_prefixo+e2_num)

			nValor := SE2->E2_VALOR
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Array com os dados a serem passados para o SigaAuto. ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			aAutoSE2:={{"E2_PREFIXO",SE2->E2_PREFIXO,Nil},;
			{"E2_NUM"    ,SE2->E2_NUM    ,Nil},;
			{"E2_TIPO"   ,SE2->E2_TIPO   ,Nil},;
			{"E2_PARCELA",SE2->E2_PARCELA,Nil},;
			{"E2_NATUREZ",SE2->E2_NATUREZ,Nil},;
			{"E2_FORNECE",SA2->A2_COD    ,Nil},;
			{"E2_LOJA"   ,SA2->A2_LOJA   ,Nil},;
			{"E2_PORTADO",cPortador      ,Nil}}
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Altera o modulo para Financeiro, senao o SigaAuto nao executa.³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			nModulo := 6
			cModulo := "FIN"
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³Roda SigaAuto de Exclusao de Titulos a Pagar. ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			MSExecAuto({|x,y,z| Fina050(x,y,z)},aAutoSE2,.T.,4)

			If lMsErroAuto
				MostraErro()
			Else
				Conout("Titutlo alterado para o portador "+cPortador)
			EndIf
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Restaura o modulo em uso. ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			nModulo := nModAnt
			cModulo := cModAnt

			se2->(dBskip())
		Enddo
	Endif

	RestArea(aAreaSe2)
Return
