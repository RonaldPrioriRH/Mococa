#Include 'Protheus.ch'


/*/{Protheus.doc} RESTE003

Função utilizada no calculo do Custo para considerar Hedge. uso MOCOCA.
 

@author Cláudio Ferreira
@since 04/05/2017
@version 1.0
@return ${return}, ${return_description}
@example
(examples)
@see (links_or_references)
/*/

User Function RESTE003(aCusto)
Local aArea		:=GetArea()
Local nTxPed	:=0
Local nVarHedge :=0

SC7->(Dbsetorder(1))
if SC7->(Dbseek(xFilial("SC7")+SD1->(D1_PEDIDO+D1_ITEMPC)))
	if SC7->C7_MOEDA<>1
	  nTxPed:=SC7->C7_TXMOEDA
	endif
endif

//Calcula variação 
nTxNF:=SF1->F1_TXMOEDA
if nTxNF>0 .and. nTxPed>0 .and. nTxNF<>nTxPed
  nVarHedge:=(nTxNF-nTxPed)*SD1->D1_QUANT
endif

//Estorno no Custo 
if nVarHedge<>0
	//Grava na SD1 o valor calculado
	if RecLock("SD1",.F.)
		SD1->D1_CUSRP2  := nVarHedge
		SD1->(MsUnlock())
	endIf
   	aCusto[1,1] := (aCusto[1,1]-nVarHedge) 
Endif

RestArea(aArea)
Return aCusto 
