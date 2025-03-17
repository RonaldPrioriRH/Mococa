#include 'protheus.ch'
#include 'parmtype.ch'

//Ponto de entrada para atualização do campo e etiqeuta na tabela SH6
user function MT680VAL()
	if IsInCallStack('U_RACDA001') .OR. IsInCallStack('U_JobApon')
		if alltrim(M->H6_PRODUTO) == alltrim(cCodProPai)
			M->H6_X_ETQ := _cEtqPallet
		endif
	endif
return .T.