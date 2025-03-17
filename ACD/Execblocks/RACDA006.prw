#include 'protheus.ch'
#include 'parmtype.ch'
#include "apvt100.ch"

user function RACDA006()
	Local nLin:=1
	Local n_Qtd := 0
	Local cEtq



	while .T.

		If ! U_VerDtFl(.F.)
			Return
		Endif

		cEtq	:= Space(U_DecEtq() + 1)//space(tamsx3("Z0A_PRODUT")[1] + tamsx3("Z0A_LOTE")[1] + tamsx3("Z0A_PALLET")[1] + 1)
		n_Qtd 	:= 0

		VtClear()
		nLin:=1
		@nLin,00 VtSay "Ajuste de Saldo do Palete "
		nLin++
		nLin++
		@nLin,00 VtSay "Etiqueta: "
		@nLin,10 VtGet cEtq
		nLin++
		@nLin,00 VtSay "Quantidade: "
		@nLin,10 VtGet n_Qtd PICTURE "@E 999" 
		nLin++

		VtRead

		If VTLastkey() == 27  // Tecla ESC
			VtClear()
			return
		EndIf

		AtuZ0D(cEtq,n_Qtd)
	EndDo
return

Static Function AtuZ0D(cEtq,n_Qtd)
	Local c_Prd := ""
	Local c_Lt := ""
	Local c_Plt := ""

	U_DecEtq(cEtq, @c_Prd, @c_Lt, ,@c_Plt)

	if c_Prd = " "
		VtClear()
		VTAlert("Etiqueta nao Encontrada!!!."+ Chr(13) + Chr(10) + cEtq ,"Falha")
		Return
	Endif

	if ! U_VerZ0D(cEtq)
		VtClear()
		VTAlert("Etiqueta Bloqueada pela Qualidade!!!."+ Chr(13) + Chr(10) + cEtq ,"Falha")
		Return
	Endif

	U_QtdZ0D(cEtq, n_Qtd)

Return