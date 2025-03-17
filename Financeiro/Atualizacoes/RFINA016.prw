#include "protheus.ch"
#include "topconn.ch"

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRFINA016	 บAutor  ณTarcํsio Silva    	Data ณ 29/01/2018 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Atualizar Borderos.										  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa - 								                  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿*/  

User Function RFINA016() 

	Local aArea 	:= GetArea()
	Local aAreaSE1 	:= SE1->(GetArea())
	Local aAreaFI2	:= FI2->(GetArea())

	Begin Transaction
	
		Processa({|| FunSelect() },"Processando a Importa็ใo ...")

	End Transaction

	Aviso("Aviso","Rotina Finalizada com sucesso!",{"Ok"})

	RestArea(aAreaSE1)
	RestArea(aAreaFI2)
	RestArea(aArea)

return()

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ FunSelect	 บAutor  ณTarcํsio Silva    Data ณ 29/01/2018 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Monta o Select do programa.  							  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa - 								                  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿*/

Static Function FunSelect()

	Local cEOL 		:= Chr(13)+Chr(10)
	Local cSql 		:= ""

	cSql := " SELECT E1_FILIAL, E1_PREFIXO, E1_XCARGA, E1_NUM, E1_PARCELA, E1_TIPO, E1_VALOR,E1_NUMBOR,E1_SITUACA, " +cEOL
	cSql += "   SUBSTR(E1_EMISSAO,7,2)||'/'||SUBSTR(E1_EMISSAO,5,2)||'/'||SUBSTR(E1_EMISSAO,1,4) AS EMISSAO, " +cEOL
	cSql += "   SUBSTR(E1_VENCTO,7,2)||'/'||SUBSTR(E1_VENCTO,5,2)||'/'||SUBSTR(E1_VENCTO,1,4) AS VENCIMENTO, " +cEOL
	cSql += "   SUBSTR(E1_VENCREA,7,2)||'/'||SUBSTR(E1_VENCREA,5,2)||'/'||SUBSTR(E1_VENCREA,1,4) AS VENCTOREAL, " +cEOL
	cSql += "   E1_CLIENTE, E1_LOJA, E1_NOMCLI, E1_PORTADO, E1_HIST, E1_BAIXA, SC5010.C5_XCONDPG,SE1010.R_E_C_N_O_ UNICSEQ, " +cEOL
	cSql += "   SUBSTR(DAK_XDTEMB,7,2)||'/'||SUBSTR(DAK_XDTEMB,5,2)||'/'||SUBSTR(DAK_XDTEMB,1,4) AS DATAEMBARQUE " +cEOL
	cSql +=	" FROM "+ RetSqlName("SE1")+" 	
	cSql += " LEFT JOIN " + RetSqlName("DAK") + " ON DAK010.D_E_L_E_T_ <> '*' AND DAK010.DAK_FILIAL = SE1010.E1_FILIAL AND DAK010.DAK_COD = SE1010.E1_XCARGA " +cEOL
	cSql += " LEFT JOIN " + RetSqlName("SC5") + " ON SC5010.D_E_L_E_T_ <> '*' AND SC5010.C5_FILIAL  = SE1010.E1_FILIAL AND SC5010.C5_NOTA = SE1010.E1_NUM " +cEOL
	//cSql += " WHERE E1_XCARGA <> ' ' AND E1_BAIXA = ' ' AND SE1010.D_E_L_E_T_ <> '*' AND E1_NUMBOR <> ' ' " +cEOL
	//cSql += " WHERE E1_EMISSAO BETWEEN '20180101' AND '20180105' AND E1_BAIXA = ' ' AND SE1010.D_E_L_E_T_ <> '*' AND E1_NUMBOR <> ' ' " +cEOL
	cSql += " WHERE E1_HIST = 'PRORROGAวรO' AND E1_BAIXA = ' ' AND SE1010.D_E_L_E_T_ <> '*' AND E1_NUMBOR <> ' ' " +cEOL
	

	If Select("TMP") > 0
		TMP->(DbCloseArea())
	EndIf  

	MemoWrite("c:\temp\RFINA016.sql",cSql)

	cSql := ChangeQuery(cSql)

	TcQuery cSql New Alias "TMP"

	TMP->(DbSelectArea("TMP"))
	TMP->(DbGotop())

	While !TMP->(Eof())

		SE1->(DbGoto(TMP->UNICSEQ))

		funIncFI2(TMP->E1_FILIAL,TMP->E1_PREFIXO,TMP->E1_NUM,TMP->E1_PARCELA,TMP->E1_TIPO,TMP->E1_CLIENTE,TMP->E1_LOJA,TMP->E1_NUMBOR,TMP->E1_SITUACA,TMP->VENCIMENTO,TMP->VENCTOREAL)

		TMP->(DbSkip())

	Enddo

Return()

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ funIncFI2	 บAutor  ณTarcํsio Silva    Data ณ 29/01/2018 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Inclui os registros de acordo com o Select.				  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa - 								                  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿*/

Static Function funIncFI2(_cFilial,_cPrefixo,_cNum,_cParcela,_cTipo,_cCliente,_cLoja,_cNumBor,_cSituac,_dVencto,_dVencReal)

	Default _cFilial  	:= ""
	Default _cPrefixo 	:= ""
	Default _cNum 		:= ""
	Default _cParcela 	:= ""
	Default _cTipo 		:= ""
	Default _cCliente 	:= ""
	Default _cLoja 		:= ""
	Default _cNumBor	:= ""
	Default _cSituac 	:= ""
	Default _dVencto 	:= ""
	Default _dVencReal 	:= ""


	FI2->(RecLock("FI2",.T.))

	FI2->FI2_FILIAL	:= _cFilial
	FI2->FI2_OCORR	:= "01"
	FI2->FI2_DESCOC	:= "REMESSA"
	FI2->FI2_PREFIX	:= _cPrefixo
	FI2->FI2_TITULO	:= _cNum
	FI2->FI2_PARCEL	:= _cParcela
	FI2->FI2_TIPO	:= _cTipo
	FI2->FI2_CODCLI	:= _cCliente
	FI2->FI2_LOJCLI	:= _cLoja
	FI2->FI2_CODFOR	:= ""
	FI2->FI2_LOJFOR	:= ""
	FI2->FI2_GERADO	:= "2"
	FI2->FI2_NUMBOR	:= _cNumBor
	FI2->FI2_CARTEI	:= _cSituac
	FI2->FI2_DTGER	:= Date()
	FI2->FI2_DTOCOR	:= Date()
	FI2->FI2_VALANT	:= dTos(cTod(_dVencto)) 
	FI2->FI2_VALNOV	:= dTos(cTod(_dVencReal))
	FI2->FI2_CAMPO	:= "E1_VENCTO"
	FI2->FI2_TIPCPO	:= "D"
	FI2->FI2_SEQ	:= ""
	FI2->FI2_HISTOR	:= ""

	FI2->(MsUnlock())

Return()