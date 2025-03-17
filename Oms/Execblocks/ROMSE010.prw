#Include 'Protheus.ch'
#INCLUDE "topconn.ch"

#DEFINE CRLF CHR(13)+CHR(10)

/*/{Protheus.doc} OM200FIM

Ponto de entrada no final da montagem da carga.
Usado para perguntar se faz Solicitaçao Fat.Triangular

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function ROMSE010()

	Local lRet := .F.
	Local aArea := GetArea()
	Local aAreaDAK := DAK->(GetArea())
	Local cQry  := ""
	Local lSOLTAUT := SuperGetMv("FT_SOLTAUT",,.F.)
	
	if !lSOLTAUT //se nao habilitado, apenas retorno
		Return
	endif
	
	cQry := " SELECT COUNT(*) QUANT "
	cQry += " FROM " + RetSqlName("DAI") + " DAI "
	cQry += " INNER JOIN " + RetSqlName("SC5") + " SC5 ON (SC5.D_E_L_E_T_ <> '*' AND C5_FILIAL = DAI_FILIAL AND C5_NUM = DAI_PEDIDO)"
	cQry += " WHERE DAI.D_E_L_E_T_ <> '*' " 
	cQry += "   AND DAI_FILIAL = '"+DAK->DAK_FILIAL+"' " 
	cQry += "   AND DAI_COD = '"+DAK->DAK_COD+"' " 
	cQry += "   AND DAI_SEQCAR = '"+DAK->DAK_SEQCAR+"' " 
	cQry += "   AND C5_XFILEST <> '' " 
	
	If Select("QAUX") > 0
		QAUX->(dbCloseArea())
	EndIf
	
	cQry := ChangeQuery(cQry)
	dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUX", .F., .T.)
	
	If QAUX->QUANT > 0
		lRet := .T.
	endif
	
	QAUX->(dbCloseArea())
		
	if lRet .AND. MsgYesNo(	"Esta carga possui pedidos para retirada de estoque em outra filial."+CRLF+;
							"Deseja fazer solicitaçao de transferência agora?","Fat. Triangular")
							
		U_ROMSA002(, DAK->DAK_COD, .T./*lAuto*/)
	endif
	
	RestArea(aAreaDAK)
	RestArea(aArea)
	
Return

