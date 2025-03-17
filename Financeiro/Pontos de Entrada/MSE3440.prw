#Include 'Protheus.ch'
#Include 'FWMVCDEF.ch'
#Include 'RestFul.CH'
#Include 'TbiConn.CH'
#Include 'TopConn.CH'


User Function MSE3440
    Local nVlrReceb := VlrReceb()
    //Local nAbat     := PAbat2()
    //Local nPercBase := nVlrReceb / (se1->e1_valor - nAbat)
    //Local nNovoAbat := nAbat * nPercBase
    If se1->(e1_filial+e1_prefixo)== '0104001' .AND. se1->E1_NUM $ '000217142,000241785'
        xDebug:='0'
    Endif
    se3->e3_base    := nVlrReceb
    se3->e3_comis   := (nVlrReceb/100) * se3->e3_porc

Return


Static Function PAbat2()
    Local aArea    := GetArea()
    Local aAreaSE1 := SE1->(GetArea())
    Local nValAbat  := 0 
    Local cAlias    := GetNextAlias()  
    Local cAlias1   := GetNextAlias()
    Local cAlias2   := GetNextAlias()  
    Local cDtComiss := GetMV("MC_DTCOMIS")  

    BeginSql Alias cAlias

        SELECT SE1.E1_VALOR
        FROM %table:SE1% SE1
        WHERE SE1.E1_FILIAL = %xFilial:SE1%   
        AND SE1.E1_NUM = %Exp:SE1->E1_NUM%
        AND SE1.E1_PREFIXO = %Exp:SE1->E1_PREFIXO%
        AND SE1.E1_TIPO = 'AB-'
        AND SE1.%NotDel%

    EndSql 

    If (cAlias)->(!eof())
        nValAbat := (cAlias)->E1_VALOR  
    EndIf  
    
    BeginSql Alias cAlias2

        SELECT SE1.E1_VALOR
        FROM %table:SE1% SE1
        WHERE SE1.E1_FILIAL = %xFilial:SE1%   
        AND SE1.E1_NUM = %Exp:SE1->E1_NUM%
        AND SE1.E1_PREFIXO = %Exp:SE1->E1_PREFIXO%
        AND SE1.E1_TIPO = 'VB-'
        AND SE1.%NotDel%

    EndSql 

    If (cAlias2)->(!eof())
        nValAbat += (cAlias2)->E1_VALOR  
    EndIf  


    BeginSql Alias cAlias1

        SELECT COUNT(*) QTBAIXA
        FROM %table:SE5% SE5
        WHERE SE5.E5_FILIAL = %xFilial:SE5%   
        AND SE5.E5_NUMERO   = %Exp:SE1->E1_NUM%
        AND SE5.E5_PREFIXO  = %Exp:SE1->E1_PREFIXO%
        AND SE5.E5_PARCELA  = %Exp:SE1->E1_PARCELA%
        AND SE5.E5_CLIFOR   = %Exp:SE1->E1_CLIENTE%
        AND SE5.E5_LOJA     = %Exp:SE1->E1_LOJA%
        AND SE5.E5_TIPODOC  = 'VL'
        AND SE5.E5_DATA     < %Exp:cDtComiss%
        AND SE5.%NotDel%

    EndSql 

    If (cAlias1)->(!eof())
        If (cAlias1)->QTBAIXA > 0 
            nValAbat := 0
        EndIf    
    EndIf  
  
    (cAlias)->(DbCloseArea())
    (cAlias1)->(DbCloseArea())
    (cAlias2)->(DbCloseArea())
        
     RestArea(aAreaSE1)
     RestArea(aArea)
     
Return nValAbat       


Static Function VlrReceb()
    Local aArea    := GetArea()
    Local aAreaSE3 := SE3->(GetArea())
    Local nVlrReceb:= 0 
    Local cAlias   := GetNextAlias()  

    BeginSql Alias cAlias

        SELECT SUM(E5_VALOR) E5_VALOR
        FROM %table:SE5% SE5
        WHERE SE5.E5_FILORIG = %xFilial:SE5%   
        AND SE5.E5_NUMERO   = %Exp:SE3->E3_NUM%
        AND SE5.E5_PREFIXO  = %Exp:SE3->E3_PREFIXO%
        AND SE5.E5_PARCELA  = %Exp:SE3->E3_PARCELA%
        AND SE5.E5_CLIFOR   = %Exp:SE3->E3_CODCLI%
        AND SE5.E5_LOJA     = %Exp:SE3->E3_LOJA%
        AND SE5.E5_SEQ      = %Exp:SE3->E3_SEQ%
        AND SE5.E5_TIPODOC  IN ('VL','CP')
        AND SE5.%NotDel%

    EndSql 

    If (cAlias)->(!eof())
        nVlrReceb := (cAlias)->E5_VALOR
    EndIf  
 
    (cAlias)->(DbCloseArea())

     RestArea(aAreaSE3)
     RestArea(aArea)

Return nVlrReceb       


