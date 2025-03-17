#Include 'Protheus.ch'
/*----------------------*/
// PE: que verifica se a regra do colaborador está no parametro PRI_REGRA
// Se tiver exclui TODOS os apontaamentos do array __aResult
User Function PONAPO4()
Local __aMarcacoes  := aClone( ParamIxb[1] )
Local __aTabCalend  := aClone( ParamIxb[2] )
Local __aCodigos    := aClone( ParamIxb[3] )
Local __aEvesIds    := aClone( ParamIxb[4] )
Local __aEventos    := aClone( aEventos )
Local __aResult     := aClone( aEventos )
Local aArea         := GetArea()
Local cRegras       := Alltrim(SuperGetMv("PRI_REGRA"))
Local _nx           :=0

For _nx := 1 to len(__aTabCalend)
   dDataApo := __aTabCalend[_nX,48]
   cRegra   := __aTabCalend[_nX,23]

   IF cRegra $ cRegras
      while ascan(__aResult, {|x|  x[1] == dDataApo}) > 0
         nPos := ascan(__aResult, {|x|  x[1] == dDataApo}) 
         adel(__aResult, nPos) 
         aSize(__aResult,Len(__aResult)-1)
      EndDo
   EndIf
Next

aEventos := aClone( __aResult )  
RestArea(aArea)

Return()