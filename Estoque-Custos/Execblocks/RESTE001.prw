#Include 'Protheus.ch'


/*/{Protheus.doc} RESTE001

Função utilizada no Gatilho do Campo B1_GRUPO para gerar codificação automática do campo B1_COD de acordo com 
definição da MOCOCA.
 

@author Kleber Santos
@since 19/04/2017
@version 1.0
@return ${return}, ${return_description}
@example
(examples)
@see (links_or_references)
/*/

User Function RESTE001()
LOCAL aArea := GetArea()
LOCAL cAliasTMP
LOCAL cProxCod

cAliasTMP := GetNextAlias()
BeginSQL Alias cAliasTMP

Select Max(Substring(B1_COD,5,4)) MAXCOD
From %Table:SB1% SB1

where 

B1_FILIAL = %xFilial:SB1% AND 
B1_GRUPO = %Exp:M->B1_GRUPO% AND
SB1.%notDel%

EndSql
 
cProxSeq := iif( Empty( (cAliasTMP)->MAXCOD ),"0001",Soma1(Alltrim((cAliasTMP)->MAXCOD)))
cProxCod := Padr((M->B1_GRUPO),4)+Alltrim(cProxSeq) 

While SB1->(DbSeek(FWxFilial("SB1")+cProxCod)) .Or. !MayIUseCode(cProxCod)
    cProxSeq := Soma1(Alltrim((cProxSeq)))
    cProxCod := Padr((M->B1_GRUPO),4)+Alltrim(cProxSeq)
Enddo

(cAliasTMP)->(DbCloseArea())
RestArea(aArea)
Return(cProxCod)

