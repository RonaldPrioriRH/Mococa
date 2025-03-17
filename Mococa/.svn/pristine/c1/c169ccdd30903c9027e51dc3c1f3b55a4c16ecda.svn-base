#Include 'Protheus.ch'

/*/{Protheus.doc} ROMSE011
Utilizado no PE M410PVNF - Validação para Faturamento
@author Danilo 
@since 25/04/2017
@version P12
@param nulo          
@return nulo
/*/
User Function ROMSE011()

	Local lRet		:= .T.
	
	if !empty(SC5->C5_XPVREMS) .AND. !empty(SC5->C5_XFILEST)
		xmaghelpfis("Atenção","Pedido "+SC5->C5_NUM+" está em processo de Fat.Triangular!","Faça primeiro a Solicitação da Transferência atraves da rotina: Atualizações - Específicos - Faturamento Triangular - Solicitar Transferência")
		lRet := .F.
	endif
	
	//verifico se é o pedido gerado na Fil Estoque
	if !empty(SC5->C5_XIDTRI) .AND. empty(SC5->C5_XFILEST)
		xmaghelpfis("Atenção","Pedido "+SC5->C5_NUM+" está em processo de Fat.Triangular! Id. Triang.: "+SC5->C5_XIDTRI,"O Faturamento deste deverá ocorrer atraves da rotina: Atualizações - Específicos - Faturamento Triangular - NF Transferência")
		lRet := .F.
	endif
	
	//verifico se é o pedido origem na Fil Venda
	if !empty(SC5->C5_XIDTRI) .AND. !empty(SC5->C5_XFILEST)
		SF1->(dbOrderNickName("IDTRIANG"))
		if SF1->(DbSeek(SC5->C5_XIDTRI))
			if SF1->F1_TIPO <> "N"
				xmaghelpfis("Atenção","Pedido "+SC5->C5_NUM+" está em processo de Fat.Triangular! Nota de Entrada dos itens não classificada! Id. Triang.: "+SC5->C5_XIDTRI,"Classifique a nota para dar entrada no saldo dos itens.")
				lRet := .F.
			endif
		else
			xmaghelpfis("Atenção","Pedido "+SC5->C5_NUM+" está em processo de Fat.Triangular! Nota de Entrada dos itens não localizada! Id. Triang.: "+SC5->C5_XIDTRI,"Faça o faturamento do pedido de transferência primeiro atraves da rotina: Atualizações - Específicos - Faturamento Triangular - NF Transferência")
			lRet := .F.
		endif
	endif

Return lRet

