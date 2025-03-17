#include "protheus.ch"
#include "topconn.ch"

/*/{Protheus.doc} RFATE034
Verifica se o cliente incluído, pertence a um grupo de cliente relacionado a Contrato vigente - PE MALTCLI
@author TOTVS
@since 27/04/2017
@version P12
@param nulo
@return nulo
/*/

/***********************/
User Function RFATE034()
/***********************/

Local cQry		:= ""
Local cGCG		:= SA1->A1_CGC
Local cQry2 	:= ""
Local cQry3 	:= ""
Local cQry4 	:= ""
//Local nContCli	:= 0

If !Empty(SA1->A1_GRPVEN)

	If Select("QRYVLD") > 0
		QRYVLD->(DbCloseArea())
	EndIf

	cQry4 := " SELECT Z09_CODIGO"
	cQry4 += " FROM "+RetSqlName("Z09")+""
	cQry4 += " WHERE D_E_L_E_T_	= ' '"
	cQry4 += " AND Z09_FILIAL	= '"+xFilial("Z09")+"'"
	cQry4 += " AND Z09_STATUS 	= 'A' AND (Z09_DTFINA >= '"+DToS(dDataBase)+"' OR Z09_RENAUT = 'T')" //Contrato vigente
	cQry4 += " AND Z09_GRPCLI	= '"+SA1->A1_GRPVEN+"'"
	
	MemoWrite("C:\temp\QRYVLD.sql",cQry4)

	cQry4 := ChangeQuery(cQry4)
	TcQuery cQry4 New Alias "QRYVLD"

	If Select("QRYCTR") > 0
		QRYCTR->(DbCloseArea())
	EndIf

	cQry := " SELECT COUNT(Z09_CODIGO) AS QTD "
	cQry += " FROM "+RetSqlName("Z09")+""
	cQry += " WHERE D_E_L_E_T_	= ' '"
	cQry += " AND Z09_FILIAL	= '"+xFilial("Z09")+"'"
	cQry += " AND Z09_STATUS 	= 'A' AND (Z09_DTFINA >= '"+DToS(dDataBase)+"' OR Z09_RENAUT = 'T')" //Contrato vigente
	cQry += " AND Z09_GRPCLI	= '"+SA1->A1_GRPVEN+"'"
	cQry += " AND TRIM(Z09_FILIAL||Z09_CODIGO||'"+SA1->A1_CGC+"')  IN	 ( SELECT TRIM(Z11_FILIAL||Z11_CODIGO||Z11_CGC) "
	cQry += "		FROM Z11010 "
	cQry += "		WHERE Z11010.D_E_L_E_T_=' ' "
	cQry += "		AND  Z11_CGC = '"+SA1->A1_CGC+"') "

	MemoWrite("C:\temp\QRYCTR.sql",cQry)

	cQry := ChangeQuery(cQry)
	TcQuery cQry New Alias "QRYCTR"

	If QRYVLD->(!EOF()) .And. QRYCTR->QTD == 0
	//	MsgInfo("Há Contrato vigente relacionado ao Grupo de Cliente deste cadastro. Favor entrar em contato com Departamento Comercial, para analise se é necessário inclusão manual da Cláusula X Contrato","Atenção")
		
		If MsgYesNo("Há Contrato vigente relacionado ao Grupo de Cliente do respectivo Cliente incluído. Deseja relacionar este Cliente as cláusulas deste Contrato?")

			If Select("QRYCLAU") > 0
				QRYCLAU->(DbCloseArea())
			EndIf

			cQry2 := " SELECT Z10_ITEM"
			cQry2 += " FROM "+RetSqlName("Z10")+""
			cQry2 += " WHERE D_E_L_E_T_	= ' '"
			cQry2 += " AND Z10_FILIAL	= '"+xFilial("Z10")+"'"
			cQry2 += " AND Z10_CODIGO	= '"+QRYVLD->Z09_CODIGO+"'"

			MemoWrite("C:\temp\QRYCLAU.sql",cQry2)
			cQry2 := ChangeQuery(cQry2)
			TcQuery cQry2 New Alias "QRYCLAU"

			While QRYCLAU->(!EOF())

				//nContCli := 0

				If Select("QRYCLI") > 0
					QRYCLI->(DbCloseArea())
				EndIf

				cQry3 := " SELECT MAX(Z11_ITEM) AS MAX"
				cQry3 += " FROM "+RetSqlName("Z11")+""
				cQry3 += " WHERE D_E_L_E_T_	= ' '"
				cQry3 += " AND Z11_FILIAL	= '"+xFilial("Z11")+"'"
				cQry3 += " AND Z11_CODIGO	= '"+QRYVLD->Z09_CODIGO+"'"
				cQry3 += " AND Z11_ITEMFI	= '"+QRYCLAU->Z10_ITEM+"'"
				
				MemoWrite("C:\temp\QRYCLI.sql",cQry3)
				cQry3 := ChangeQuery(cQry3)
				TcQuery cQry3 New Alias "QRYCLI"

				While QRYCLI->(!EOF())
					RecLock("Z11",.T.)
					Z11->Z11_FILIAL	:= xFilial("Z11")
					Z11->Z11_CODIGO	:= QRYVLD->Z09_CODIGO
					Z11->Z11_ITEM	:= Soma1(AllTrim(QRYCLI->MAX))//StrZero(nContCli + 1,2)//StrZero(nContCli + 1,2)
					Z11->Z11_CLIENT	:= SA1->A1_COD
					Z11->Z11_LOJA	:= SA1->A1_LOJA
					Z11->Z11_NOME	:= SA1->A1_NOME
					Z11->Z11_CGC	:= SA1->A1_CGC
					Z11->Z11_ITEMFI	:= QRYCLAU->Z10_ITEM
					Z11->Z11_TITAPU	:= "N"
					Z11->(MsUnlock())
					QRYCLI->(DbSkip())
				EndDo
				QRYCLAU->(DbSkip())
			EndDo

			MsgInfo("Inclusão realizada.","Atenção")
		Endif
		
	Endif

	If Select("QRYCLI") > 0
		QRYCLI->(DbCloseArea())
	EndIf

	If Select("QRYCLAU") > 0
		QRYCLAU->(DbCloseArea())
	EndIf

	If Select("QRYCTR") > 0
		QRYCTR->(DbCloseArea())
	EndIf

	If Select("QRYVLD") > 0
		QRYVLD->(DbCloseArea())
	EndIf
Endif

Return
