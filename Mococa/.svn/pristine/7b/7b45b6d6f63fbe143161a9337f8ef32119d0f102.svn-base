#Include 'Protheus.ch'
#Include 'TopConn.ch'

/*/{Protheus.doc} RFATE037
Limpa numero do nota de devolucao se documento for excluido
@author TOTVS
@since 02/06/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/


User Function RFATE037()

Local cQry := ""

DbSelectArea("ZEM")
ZEM->(DbSetOrder(2))
ZEM->(DbGoTop())

cQry := " SELECT 
cQry += " 	R_E_C_N_O_ RECNOZEJ"
cQry += " FROM " + RETSQLNAME("ZEJ") + " ZEJ"
cQry += " WHERE ZEJ.D_E_L_E_T_<> '*'"
cQry += " 	AND ZEJ_FILIAL  = '" + xFilial("ZEJ") + "'"
cQry += " 	AND ZEJ_NUMDEV = '" + SF2->F2_DOC    + "'"
cQry += " 	AND ZEJ_SERDEV = '" + SF2->F2_SERIE  + "'"

cQry := ChangeQuery(cQry)

If Select("QZEJ") > 0
	QZEJ->(DbCloseArea())
Endif

TcQuery cQry New Alias "QZEJ"

While QZEJ->(!EOF())

	ZEJ->(DbGoTo(QZEJ->RECNOZEJ))
	
		//Volta status do registro de apuracao
		If ZEM->(DbSeek(xFilial("ZEM")+ZEJ->ZEJ_CODIGO+ZEJ->ZEJ_NUM+ZEJ->ZEJ_SERIE))
			If Reclock("ZEM",.F.)
				ZEM->ZEM_STATUS := "A"
				ZEM->(MsUnLock())	
			Endif
		Endif
	
		If Reclock("ZEJ",.F.)
			ZEJ->ZEJ_NUMDEV := ""
			ZEJ->ZEJ_SERDEV := ""
			ZEJ->ZEJ_STATUS := "A"
			ZEJ->ZEJ_ENTFIL := "N"
			
			ZEJ->(MsUnLock())
		Endif
 QZEJ->(DbSkip())
EndDo

Return
