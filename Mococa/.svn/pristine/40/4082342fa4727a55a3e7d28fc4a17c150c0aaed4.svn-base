//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"
/*
O ponto de entrada MT103DRF permite alterar o combobox com as informações para geração da DIRF e o código de retenção. 
Disponível para IRPF, ISS, PIS, COFINS e CSLL.
*/
User Function MT103DRF()

Local nValor  := PARAMIXB[1]
Local cCodRet := PARAMIXB[2]
//Local oCombo  := PARAMIXB[3]
//Local oCodRet := PARAMIXB[4]
Local aImpRet := {}
    
nValor := 1

    cCodRet := "1708"
aadd(aImpRet, {"IRR", nValor, cCodRet})
    cCodRet := "5952"
aadd(aImpRet, {"PIS", nValor, cCodRet})
    cCodRet := "5952"
aadd(aImpRet, {"COF", nValor, cCodRet})
    cCodRet := "5952"
aadd(aImpRet, {"CSL", nValor, cCodRet})

Return aImpRet
