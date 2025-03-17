#include "TOTVS.CH"

/*/{Protheus.doc} MCJOB01A
Função para schedule envio de relatorio por email
@author Natalia Perioto
@since 22/04/2024
@version 1.0
/*/

User Function MCJOB01A()

	Local cAlias := GetNextAlias()
	Local aPergs   := {}
	Local cVendDe  := Space(TamSX3("A3_COD")[01])
	Local cVendAt  := Space(TamSX3("A3_COD")[01])
	Local dDataDe  := FirstDate(Date())
	Local dDataAt  := LastDate(Date())
	//Local cEmbMococa  := GetEnvServer()
	aAdd(aPergs, {1, "Da Data",  dDataDe,  "",             ".T.",        "",    ".T.", 60,  .F.})
	aAdd(aPergs, {1, "Até a Data", dDataAt,  "",             ".T.",        "",    ".T.", 60,  .T.})
	aAdd(aPergs, {1, "Do Vendedor",     cVendDe, "", ".T.", "SA3",    ".T.", 40, .F.})
	aAdd(aPergs, {1, "Até o Vendedor",  cVendAt,  "", ".T.", "SA3", ".T.", 40,  .T.})

	If ParamBox(aPergs, "Informe os parâmetros")

		BeginSql Alias cAlias

			SELECT SA3.A3_EMAIL , SA3.A3_COD
			FROM %table:SA3%  SA3
			WHERE SA3.A3_COD BETWEEN %Exp:MV_PAR03% AND %Exp:MV_PAR04% 
			AND SA3.A3_MSBLQL <> '1'
			AND SA3.A3_EMAIL <> ' ' 
			AND SA3.%NotDel% 
			ORDER BY A3_COD
		EndSql
		(cAlias)->(DbGoTop())

		
		while !(cAlias)->(Eof())
			
		
			If !Empty((cAlias)->A3_EMAIL)

				If __cuserid == '000950'
					cEmail := 'iris@grupopriorisa.com.br'
					//MsgRun("Enviando Emails...", "Relatório comissão", {|| U_xMatr540((cAlias)->A3_COD,cEmail,MV_PAR01,MV_PAR02) })
					MsgRun("Enviando Emails para: "+(cAlias)->A3_COD, "Relatório comissão", {|| U_xMatr540((cAlias)->A3_COD,cEmail,dDataDe,dDataAt) })
				Else
					MsgRun("Enviando Email para: "+(cAlias)->A3_COD+(cAlias)->A3_EMAIL, "Relatório comissão", {|| U_xMatr540((cAlias)->A3_COD,(cAlias)->A3_EMAIL,dDataDe,dDataAt) })
				Endif
				
			EndIf	


			(cAlias)->(DbSkip())

		EndDo	

		(cAlias)->(DbCloseArea())

	EndIf	

Return
