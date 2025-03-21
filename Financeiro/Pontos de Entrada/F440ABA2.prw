// Programa  : Novo PE F440ABA2
// Autor     : Caique Mercadante
// Data      : 27/12/2022
// Descricao : PE que permite alterar as bases de comiss�o para o vendedor
// considerar o valor l�quido da comiss�o, devido o fonte FINA440.prx estar fixado para desconsiderar
// apenas tipos de titulos AB- 	
// F440ABA2 - Alterar base de comiss�o - Evento Baixa
// https://tdn.totvs.com/pages/releaseview.action?pageId=732671904
// Ponto de entrada n�o validado aten��o! 


#INCLUDE 'Protheus.ch'
#INCLUDE 'Topconn.ch'

/*
*** Programa  : F440ABA2
    Data      : 10/01/2023
    Descricao : Permite alterar a base de comiss�o para o vendedor
*/

/*
User Function F440ABA2()

	LOCAL nX AS NUMERIC
	LOCAL cOperation AS CHARACTER
	LOCAL aBases AS ARRAY

	cOperation := ParamIxb[1]
	aBases := ACLONE(ParamIxb[2])

	IF cOperation == 'OP_NOLIQFAT'  //Sem origem em Fatura/Liquida��o
		FOR nX := 1 TO LEN(aBases)
			aBases[nX,4] := aBases[nX,4] - PAbat()
		NEXT nX
	ELSEIF cOperation == 'OP_LIQFAT'    //Provenientes de Fatura/Liquida��o
		FOR nX := 1 TO LEN(aBases)
			aBases[nX,4] := aBases[nX,4] - PAbat()
		NEXT nX

	ENDIF

Return ACLONE(aBases)
*/

/*
*** Defini��o de cada posi��o do array aBase ***
    1 - C�digo do vendedor
    2 - Base da comiss�o
    3 - Base na emiss�o
    4 - Base na baixa
    5 - Valor na emiss�o
    6 - Valor na baixa
    7 - % da comiss�o (se % � zero, conter� diversos caracteres de porcentagem - %)
    8 - PIS
    9 - COFINS
    10 - CSLL
    11 - IRRF
    12 - Valor original do t�tulo baixado (soma do valor dos t�tulos baixados por liquida��o)
    13 - RECNO do t�tulo Liquidado/Faturado
*/

Static Function PAbat()

	Local aArea    := GetArea()
	Local aAreaSE1 := SE1->(GetArea())
	Local cFilTit  := SE1->E1_FILIAL
	Local cNum     := SE1->E1_NUM
	Local cPrefix  := SE1->E1_PREFIXO
	Local cParcel  := SE1->E1_PARCELA
	Local nABMenos := 0
	Local cSql     := " "

	cSql := "SELECT SUM(E1_VALOR) ABATIMENTO FROM " + RetSqlName("SE1") +" "
	cSql += "WHERE  D_E_L_E_T_ = ' ' "
	cSql += "AND E1_FILIAL = '" + cFilTit + "' "
	cSql += "AND E1_PREFIXO = '" + cPrefix + "' "
	cSql += "AND E1_NUM = '" + cNum + "' "
	cSql += "AND E1_PARCELA = '" + cParcel + "' "
	cSql += "AND E1_TIPO IN ('AB-','VB-', 'VBC')  "


	If Select("QRYAB") > 0
		QRYAB->(DbCloseArea())
	EndIf

	TcQuery cSql NEW ALIAS "QRYAB"
	DbSelectArea("QRYAB")

	If !EOF()
		nABMenos := QRYAB->ABATIMENTO
	EndIf

	If Select("QRYAB") > 0
		QRYAB->(DbCloseArea())
	EndIf

	RestArea(aAreaSE1)
	RestArea(aArea)

Return nABMenos
