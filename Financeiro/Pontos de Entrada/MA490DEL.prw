#Include 'Protheus.ch'

/*/{Protheus.doc} MA490DEL

Ponto de Entrada 
Esse ponto de entrada está localizado na função A490Deleta. É chamado após a exclusão do SE3 (Comissão de Vendas).

@author Danilo Brito
@since 13/03/2017
@version P12
@param Nao recebe parametros
@return xRet
/*/

User Function MA490DEL()

	//Tratamento para exclusão do detalhamento da apuração comissão
	if SE3->E3_PREFIXO == "CLT" //se movimento foi gerado pela apuração de comissão CLT
		DbSelectArea("Z07")
		Z07->(DbSetOrder(1)) //Z07_FILIAL+Z07_CODIGO+Z07_PROD+Z07_GRUPO
		if Z07->(DbSeek(xFilial("Z07")+SE3->E3_NUM))
			While Z07->(!Eof()) .AND. Z07->Z07_FILIAL+Z07->Z07_CODIGO == xFilial("Z07")+SE3->E3_NUM
				Reclock("Z07", .F.)
					Z07->(DbDelete())
				Z07->(MsUnlock())
				
				Z07->(DbSkip())
			Enddo
		endif
	endif
	
Return

