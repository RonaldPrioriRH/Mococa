#include "topconn.ch"
#Include "Protheus.ch"

//Compilado PRODUCAO 2 4 5 falta PRODUCAO E ambiente COMPILA 

User Function SaldoOri()
	
	local lRet 

//旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
//� Nao permite alterar saldo original para qtd menor que a qtd ja requisitada �
//읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
	If lRet .And. Altera .And. lMT380SE
	 	If l380
	 		If (SD4->D4_QTDEORI - SD4->D4_QUANT) <> (M->D4_QTDEORI - M->D4_QUANT)
	 			Help(" ",1,"A380AQTOR")
	 			lRet:= .F.
	 		EndIf
	 	EndIf
	EndI

return lRet