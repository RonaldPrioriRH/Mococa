#include "protheus.ch"

/*/{Protheus.doc} M460FIM
Ponto de entrada executado após a gravação da NF de Saída, e fora da transação.
@author TOTVS
@since 05/04/2017
@version P12
@param nulo
@return nulo
/*/

/**********************/
User Function M460FIM()
/**********************/

	Local aArea := GetArea()

	//Contratos
	If funname() <> 'ROBOCWIZ'
		U_RFATE010()
	Endif

	//INFORMAR O PESO E VOLUME NA NOTA APENAS DOS ITENS FATURADOS
	If funname() <> 'ROBOCWIZ'
		U_RFATE014()
	Endif
	//Fat.Triangular
	U_RFATE035()

	//Apresenta uma tela para informar o container para gravar na sf2.
	If funname() <> 'ROBOCWIZ'
		U_RFATA011()
	Endif
	//Grava o numero da carga no titulo a receber SE1 e o Id na Sd2.
	U_RFATA013()

	//Movimenta uma nota fiscal de transferencia no ato do faturamento.
	//Trativa na apuração do Leite Spot
	if alltrim(FunName()) <> "RCOMA001"
		if alltrim(FunName()) <> "CARC5AF2" .and. alltrim(FunName()) <> "ROBOCWIZ"
			U_RFATA015()
			//MsUnlockAll()
		Endif
	endIf

	//DbUnlockAll() //destrava tudo
	//MsUnlockAll()

	//DbUnlockAll() //destrava tudo

	RestArea(aArea)

Return
