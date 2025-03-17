/*/GP670ARR
Ponto de Entrada responsavel por posicionar a conta contabil da folha no titulo de contas a pagar
ao realizar a integracao financeira.
/*/

User Function GP670ARR()

    Local aArea := getArea()
    Local aRet  := {}   
    aadd(aRet, {"E2_CCD"    ,rc1->rc1_cc    , Nil})

    RestArea(aArea) 
Return(aRet)


