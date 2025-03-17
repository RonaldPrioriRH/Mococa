//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} PNA280ROT
description
@type function
@version  
@author caique.mercadante
@since 21/10/2022
@return variant, return_description
/*/
User Function PNA280ROT()
Local aArea 	:= GetArea()
Local aRotina 	:= ParamixB[1]


    aAdd(aRotina, { "Troca de Turno","Pona160()", 0 , 7, ,.F.})
    aAdd(aRotina, { "Exceções Por Funcionários","Pona140()", 0 , 8, ,.F.})
    aAdd(aRotina, { "Exceções Por Período","Pona090()", 0 , 9, ,.F.})
    aAdd(aRotina, { "Afastamento","Gpea240()", 0 , 10, ,.F.})
    aAdd(aRotina, { "Marcações","Pona040()", 0 , 11, ,.F.})
    aAdd(aRotina, { "Banco de Horas","Pona200()", 0 , 12, ,.F.})
    aAdd(aRotina, { "*Espelho de Ponto","u_ImpEsp()", 0 , 13, ,.F.})
    aAdd(aRotina, { "Leitura/Apontamento","Ponm010()", 0 , 14, ,.F.})
    aAdd(aRotina, { "Calculo Mensal","Ponm070()", 0 ,15, ,.F.})
    aAdd(aRotina, { "Resultados","Pona170()", 0 , 16, ,.F.})
    aAdd(aRotina, { "Fechamento Banco","Ponm080()", 0 , 17, ,.F.})
    aAdd(aRotina, { "Rdmake UpdLintur","u_UpdLintur()", 0 , 18, ,.F.})
    aAdd(aRotina, { "Integração Folha","Ponm040()", 0 , 18, ,.F.})


RestArea(aArea)

Return (aRotina)
