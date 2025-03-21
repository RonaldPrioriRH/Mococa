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
			
			//旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
			//� Array com os dados a serem passados para o SigaAuto. �
			//읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
			aAutoSE2:={{"E2_PREFIXO",SE2->E2_PREFIXO,Nil},;
			{"E2_NUM"    ,SE2->E2_NUM    ,Nil},;
			{"E2_TIPO"   ,SE2->E2_TIPO   ,Nil},;
			{"E2_PARCELA",SE2->E2_PARCELA,Nil},;
			{"E2_NATUREZ",SE2->E2_NATUREZ,Nil},;
			{"E2_FORNECE",SA2->A2_COD    ,Nil},;
			{"E2_LOJA"   ,SA2->A2_LOJA   ,Nil},;
			{"E2_PORTADO",cPortador      ,Nil}}
			
			//旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
			//� Altera o modulo para Financeiro, senao o SigaAuto nao executa.�
			//읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
			nModulo := 6
			cModulo := "FIN"
			
			//旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
			//쿝oda SigaAuto de Exclusao de Titulos a Pagar. �
			//읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
			MSExecAuto({|x,y,z| Fina050(x,y,z)},aAutoSE2,.T.,4)

			If lMsErroAuto
				MostraErro()
			Else
				Conout("Titutlo alterado para o portador "+cPortador)
			EndIf
			
			//旼컴컴컴컴컴컴컴컴컴컴컴컴컴�
			//� Restaura o modulo em uso. �
			//읕컴컴컴컴컴컴컴컴컴컴컴컴컴�
			nModulo := nModAnt
			cModulo := cModAnt

			se2->(dBskip())
		Enddo
	Endif

	RestArea(aAreaSe2)
Return
