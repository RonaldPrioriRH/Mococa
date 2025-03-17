#include 'protheus.ch'
#include 'parmtype.ch'

user function VldLote()
LOCAL aArea		 := GetArea()
//Local aAreaB5    := SB5->(GetArea())
//LOCAL cVar  	 := &(MemoRead())
LOCAL cProduto   := M->CYV_CDACRP 
LOCAL lRet       := .t.
Alert(cVar)

//Verifica se o produto é Granel:
DbSelectArea("SB5")
DbSetOrder(1)
if DbSeek(FWxFilial("SB5")+cProduto) .and. SB6->B5_TPUNIT

else
	return(lRet)
endif

restarea(aArea)	
return


User Function VctoProd()
Local dRet := dDataBase
Local aArea := GetArea()
//Local aAreaB1 := SB1->(GetArea())
sb1->(DbSetOrder(1))
if sb1->(DbSeek(FwxFilial("SB1")+M->CYV_CDACRP)) .and. Rastro(M->CYV_CDACRP)
	dRet := dDataBase + SB1->B1_PRVALID
endif
restarea(aArea)
return(dRet)
