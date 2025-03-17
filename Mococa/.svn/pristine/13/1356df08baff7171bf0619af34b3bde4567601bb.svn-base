#Include 'Protheus.ch'


/*/{Protheus.doc} RESTE002

Função utilizada no Gatilho do Campo BM_GRUPO para gerar codificação automática do campo BM_GRUPO de acordo com 
definição da MOCOCA.
 

@author Kleber Santos
@since 03/05/2017
@version 1.0
@return ${return}, ${return_description}
@example
(examples)
@see (links_or_references)
/*/

User Function RESTE002()
LOCAL aArea := GetArea()
LOCAL cAliasTMP
LOCAL cProxCod

//Validação do tamanho digitado:

if !Empty(M->BM_XGRPS) .and. Len(alltrim(M->BM_XGRPS))<>2 
    ApMsgInfo("A quantidade de dígitos para esse campo deve ser:"+chr(13)+chr(10)+;
    "2 digitos para grupos sintéticos. Somente grupos sintéticos podem ser informados."+chr(13)+chr(10)+;
    "Grupos analítios são calculados automaticmente.","Tamanho inválido")
    return (Space(TamSx3("BM_GRUPO")[1]))
elseif Empty(M->BM_XGRPS)
    return(TamSx3("BM_GRUPO")[1])
endif

//Verifica se o grupo sintético informado já existe:
cAliasTMP := GetNextAlias()
BeginSQL Alias cAliasTMP

Select COUNT(BM_GRUPO) COUNT_GRUPO
From %Table:SBM% SBM

where 

BM_FILIAL = %xFilial:SBM% AND 
RTRIM(LTRIM(BM_GRUPO)) = %Exp:Alltrim(M->BM_XGRPS)+"00"% AND
SBM.%notDel%

EndSql
nCountSBM := (cAliasTMP)->COUNT_GRUPO
(cAliasTMP)->(DbCloseArea())

if nCountSBM == 0 //Não existe o grupo sintético informado
    return(Substr(M->BM_XGRPS,1,2)+"00")
else

    cAliasTMP := GetNextAlias()
    BeginSQL Alias cAliasTMP

        Select Max(Substring(BM_GRUPO,1,2)) MAXCOD
        From %Table:SBM% SBM

        where

        BM_FILIAL = %xFilial:SBM% AND
        BM_GRUPO = %Exp:Substr(M->BM_XGRPS,1,2)% AND
        SBM.%notDel%

    EndSql


 
    cProxSeq := iif( Empty( (cAliasTMP)->MAXCOD ),"01",Soma1(Alltrim((cAliasTMP)->MAXCOD)))
    cProxCod := Padr((M->BM_XGRPS),2)+Alltrim(cProxSeq)

    While SBM->(DbSeek(FWxFilial("SBM")+cProxCod)) .Or. !MayIUseCode(cProxCod)
        cProxSeq := Soma1(Alltrim((cProxSeq)))
        cProxCod := Padr((M->BM_XGRPS),2)+Alltrim(cProxSeq)
    Enddo

    M->BM_GRUPO := cProxCod

Endif

(cAliasTMP)->(DbCloseArea())
RestArea(aArea)
Return(cProxCod)

