#include "protheus.ch"
#include "topconn.ch"

/*/{Protheus.doc} RFATE026
Realiza apuração de cláusulas, cuja aplicação é do tipo Apuração - Contratos
@author TOTVS
@since 06/04/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

/**********************/
User Function RFATE026()
/**********************/

Local aDados := {}
Local dBkpDBase := dDataBase
Local cPerg 	:= "RFATE026"

U_xPutSx1(cPerg,"01","Data Apuração ?","","","mv_ch1","D",08,0,0,"G","","","","","mv_par01","","","","","","","","","","","","","","","","",{"Informe a data da apuração a ser","tomada por base no calculo da","periodicidade."},{"",""},{"",""})
U_xPutSx1(cPerg,"02","Contrato De ?","","","mv_ch2","C",06,0,0,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",{"",""},{"",""},{"",""})
U_xPutSx1(cPerg,"03","Contrato Até ?","","","mv_ch3","C",06,0,0,"G","","","","","mv_par03","","","","","","","","","","","","","","","","",{"",""},{"",""},{"",""})

//mv_par01 := dDatabase
//mv_par02 := "000026"
//mv_par03 := "000026"

if Pergunte(cPerg,,"Apuração Contrato")

	if !empty(MV_PAR01)
       
	 dDataBase :=  MV_PAR01

		MsgRun("Realizando busca dos dados...","Aguarde",{|| aDados := BuscaDados()})

		If Len(aDados) > 0
		
			MontaTela(aDados)
		Else
			MsgInfo("Não foram localizados créditos para clientes a serem apurados, de acordo com a data atual.","Aviso")
		Endif
	else
		MsgInfo("Parametro nao preenchido! Operação abortada.")
	endif

endif

dDataBase := dBkpDBase

Return

/***************************/
Static Function BuscaDados()
/***************************/

Local cQry 		:= ""
Local cQry2		:= ""
Local cQry3		:= ""
Local cQry4		:= ""
Local cQry5		:= ""
Local aDados	:= {}
Local nVlrTit	:= 0
Local nVlrAnt	:= 0
Local nVlrFat	:= 0
Local dDtIni    := dDataBase
Local dDtFim	:= dDataBase

If Select("QRYAPUR") > 0
	QRYAPUR->(DbCloseArea())
EndIf

//BUSCANDO CONTRATOS X CLIENTE
cQry := " SELECT DISTINCT Z13.Z13_CONTRA, Z11.Z11_CLIENT, Z11.Z11_LOJA, Z11.Z11_NOME, Z11.Z11_CGC, Z13.Z13_TITFIN, Z13.Z13_NATTIT, Z13.Z13_BSCALC"
cQry += " FROM "+RetSqlName("Z13")+" Z13, "+RetSqlName("Z14")+" Z14, "+RetSqlName("Z11")+" Z11"
cQry += " WHERE Z13.D_E_L_E_T_	<> '*'"
cQry += " AND Z14.D_E_L_E_T_	<> '*'"
cQry += " AND Z11.D_E_L_E_T_	<> '*'"
cQry += " AND Z13.Z13_FILIAL	= Z14.Z14_FILIAL"
//cQry += " AND Z14.Z14_FILIAL	= '"+xFilial("Z14")+"'"
//cQry += " AND Z11.Z11_FILIAL	= '"+xFilial("Z11")+"'"
cQry += " AND Z13.Z13_CODIGO	= Z14.Z14_CODIGO"
cQry += " AND Z13.Z13_CONTRA	= Z11.Z11_CODIGO"
cQry += " AND Z14.Z14_ITCLAU	= Z11.Z11_ITEMFI"
cQry += " AND Z14.Z14_APLICA	= 'A'" //Tipo aplicação igual a apuração
cQry += " AND Z13.Z13_CONTRA BETWEEN '" + MV_PAR02 +"' AND '"+ MV_PAR03 +"' " 		
cQry += " AND Z14.Z14_APURAD	<> 'S'" //Não apurado
cQry += " AND Z11.Z11_TITAPU	= 'S'" //Cliente para apuração
cQry += " ORDER BY 1"

cQry := ChangeQuery(cQry)
MemoWrite("c:\temp\Contrato_Clientes.txt",cQry)
TcQuery cQry New Alias "QRYAPUR"

While QRYAPUR->(!EOF())

	nVlrTit := 0

	If Select("QRYCLAU") > 0
		QRYCLAU->(DbCloseArea())
	EndIf

	//BUSCANDO PEDIDOS PENDENTES DE APURAÇAO
	cQry2 := " SELECT DISTINCT Z13.Z13_PEDIDO, Z13.Z13_ITEMPV, Z14.Z14_VLRAPL, Z12.Z12_NRODIA, Z14.Z14_FXINIC, Z14.Z14_FXFINA, Z14.Z14_TPFAIX"
	if Z12->(FieldPos("Z12_TIPOP"))>0
		cQry2 += ", Z12.Z12_TIPOP "
	endif
	cQry2 += " FROM "+RetSqlName("Z13")+" Z13, "+RetSqlName("Z14")+" Z14, "+RetSqlName("Z12")+" Z12"
	cQry2 += " WHERE Z13.D_E_L_E_T_	<> '*'"
	cQry2 += " AND Z14.D_E_L_E_T_	<> '*'"
	cQry2 += " AND Z12.D_E_L_E_T_	<> '*'"
	cQry2 += " AND Z13.Z13_FILIAL	= Z14.Z14_FILIAL"
	//cQry2 += " AND Z14.Z14_FILIAL	= '"+xFilial("Z14")+"'"
	//cQry2 += " AND Z12.Z12_FILIAL	= '"+xFilial("Z12")+"'"
	cQry2 += " AND Z13.Z13_CODIGO	= Z14.Z14_CODIGO"
	cQry2 += " AND Z14.Z14_PERIOD	= Z12.Z12_CODIGO"
	cQry2 += " AND Z13.Z13_CONTRA	= '"+QRYAPUR->Z13_CONTRA+"'"
	cQry2 += " AND Z14.Z14_APLICA	= 'A'" //Tipo aplicação igual a apuração
	cQry2 += " AND Z14.Z14_APURAD	<> 'S'" //Não apurado

	cQry2 := ChangeQuery(cQry2)
	MemoWrite("c:\temp\pedidos_pendente_apuracao.txt",cQry2)
	TcQuery cQry2 New Alias "QRYCLAU"

	While QRYCLAU->(!EOF())

		nVlrFat := 0

		//BUSCO AS DATAS DE INICIO E FIM
		PeriodClausula(dDataBase, QRYCLAU->Z12_NRODIA, iif(Z12->(FieldPos("Z12_TIPOP"))>0,QRYCLAU->Z12_TIPOP,""), @dDtIni, @dDtFim )

		If Select("QRYFAT") > 0
			QRYFAT->(DbCloseArea())
		EndIf

		//BUSCANDO NOTAS DE SAIDA PARA COMPARAR EMISSÃO
	/*	cQry3 := " SELECT D2_EMISSAO, D2_TOTAL, D2_ICMSRET, D2_VALPIS, D2_VALCOF, D2_VALICM"
		cQry3 += " FROM "+RetSqlName("SD2")+""
		cQry3 += " WHERE D_E_L_E_T_	<> '*'"
		cQry3 += " AND D2_FILIAL	= '"+xFilial("SD2")+"'"
		cQry3 += " AND D2_PEDIDO	= '"+QRYCLAU->Z13_PEDIDO+"'"
		cQry3 += " AND D2_ITEMPV	= '"+QRYCLAU->Z13_ITEMPV+"'"
*/

		cQry3 := " SELECT DISTINCT SD2.D2_DOC, SD2.D2_SERIE, SD2.D2_ITEM, SD2.D2_COD, D2_PRCVEN,SB1.B1_DESC, SD2.D2_EMISSAO, SD2.D2_QUANT, Z13.Z13_VLRBAS, SD2.D2_TOTAL,"
		cQry3 +="Z13.Z13_ICMSST ,  Z13.Z13_PIS, Z13.Z13_COFINS,Z13.Z13_ICMS, Z14.z14_vlrapl"  
		cQry3 +="FROM   z13010 Z13 "
		cQry3  += "       INNER JOIN z14010 Z14 "
		cQry3  += "               ON z14.d_e_l_e_t_ = ' ' "
		cQry3  += "                  AND Z13.z13_filial = Z14.z14_filial "
		cQry3  += "                  AND Z13.z13_codigo = Z14.z14_codigo "
		cQry3  += "       INNER JOIN sd2010 sd2"
		cQry3  += "               ON sd2.d_e_l_e_t_ = ' ' "
		cQry3  += "                  AND Z13.z13_filial = sd2.d2_filial "
		cQry3  += "                  AND Z13.z13_pedido = sd2.d2_pedido "
		cQry3  += "                  AND Z13.z13_itempv = sd2.d2_itempv "
		cQry3  += "       INNER JOIN SB1010 SB1 ON SB1.D_E_L_E_T_=' '"
		cQry3  += "                  AND SD2.D2_COD = SB1.B1_COD"         
		cQry3  += "WHERE  z13.d_e_l_e_t_ = ' ' "
		cQry3  += " AND SD2.D2_PEDIDO		= '"+QRYCLAU->Z13_PEDIDO+"'"
		cQry3  += " AND SD2.D2_ITEMPV		= '"+QRYCLAU->Z13_ITEMPV+"'"
		cQry3  += " AND z14_aplica = 'A' "
		cQry3  += " ORDER BY 1,2"
		cQry3 := ChangeQuery(cQry3)
		MemoWrite("c:\temp\Notas_saida.txt",cQry3)
		TcQuery cQry3 New Alias "QRYFAT"

		While QRYFAT->(!EOF())

			If STOD(QRYFAT->D2_EMISSAO) >= dDtIni .AND. STOD(QRYFAT->D2_EMISSAO) <= dDtFim

				If QRYAPUR->Z13_BSCALC == "L" //Líquida
				//	nVlrFat += Round((QRYFAT->D2_TOTAL - QRYFAT->D2_VALPIS - QRYFAT->D2_VALCOF - QRYFAT->D2_VALICM) * (QRYCLAU->Z14_VLRAPL /100),6)
				//	nVlrFat += Round((QRYFAT->(Z13_vlrbas * D2_QUANT) - QRYFAT->(Z13_PIS * D2_QUANT) - QRYFAT->(d2_quant*Z13_COFINS) - QRYFAT->(d2_quant * Z13_ICMS)) * (QRYCLAU->Z14_VLRAPL /100),6)
				nVlrFat += Round((QRYFAT->(Z13_vlrbas * D2_QUANT)) * (QRYCLAU->Z14_VLRAPL /100),2)
				
				ElseIf QRYAPUR->Z13_BSCALC == "B" //Bruta
					nVlrFat += Round((QRYFAT->(Z13_vlrbas * D2_QUANT)  + QRYFAT->(d2_quant * Z13_ICMSST)) * (QRYCLAU->Z14_VLRAPL /100),6)

				Else //Bruta s/ ST
					nVlrFat += Round((QRYFAT->(d2_quant * Z13_VLRBAS)) * (QRYCLAU->Z14_VLRAPL /100),6)
				Endif
			Endif

			QRYFAT->(DbSkip())
		EndDo

		//CLAUSULAS POR FAIXA DE VALOR
		If QRYCLAU->Z14_FXINIC > 0 .Or. QRYCLAU->Z14_FXFINA > 0

			If QRYCLAU->Z14_TPFAIX == "R" //R$

				If nVlrFat >= QRYCLAU->Z14_FXINIC .And. nVlrFat <= QRYCLAU->Z14_FXFINA
					nVlrTit += nVlrFat
				Endif

			Else //% -> Período anterior

				nVlrAnt := 0

				If Select("QRYPERANT") > 0
					QRYPERANT->(DbCloseArea())
				EndIf

				cQry5 := " SELECT SD2.D2_EMISSAO, SD2.D2_TOTAL, SD2.D2_ICMSRET, SD2.D2_VALPIS, SD2.D2_VALCOF, SD2.D2_VALICM"
				cQry5 += " FROM "+RetSqlName("SD2")+" SD2, "+RetSqlName("SC6")+" SC6, "+RetSqlName("Z13")+" Z13"
				cQry5 += " WHERE SD2.D_E_L_E_T_	<> '*'"
				cQry5 += " AND SC6.D_E_L_E_T_	<> '*'"
				cQry5 += " AND Z13.D_E_L_E_T_	<> '*'"
				cQry5 += " AND SD2.D2_FILIAL	= '"+xFilial("SD2")+"'"
				cQry5 += " AND SC6.C6_FILIAL	= '"+xFilial("SC6")+"'"
				cQry5 += " AND Z13.Z13_FILIAL	= '"+xFilial("Z13")+"'"
				cQry5 += " AND SD2.D2_PEDIDO	= SC6.C6_NUM"
				cQry5 += " AND SD2.D2_ITEMPV	= SC6.C6_ITEM"
				cQry5 += " AND SC6.C6_XIDMOVI	= Z13.Z13_CODIGO"
				cQry5 += " AND Z13.Z13_CONTRA	= '"+QRYAPUR->Z13_CONTRA+"'"
				cQry5 += " AND SD2.D2_EMISSAO BETWEEN '"+DToS(dDtIni)+"' AND '"+DToS(dDtFim)+"'"

				cQry5 := ChangeQuery(cQry5)
				MemoWrite("c:\temp\identificar.txt",cQry5)
				TcQuery cQry5 New Alias "QRYPERANT"

				While QRYPERANT->(!EOF())

					If QRYAPUR->Z13_BSCALC == "L" //Líquida
						nVlrAnt += Round(QRYPERANT->D2_TOTAL - QRYPERANT->D2_VALPIS - QRYPERANT->D2_VALCOF - QRYPERANT->D2_VALICM,6)
                       					
					ElseIf QRYAPUR->Z13_BSCALC == "B" //Bruta
						nVlrAnt += Round(QRYPERANT->D2_TOTAL + QRYPERANT->D2_ICMSRET,6)

					Else //Bruta s/ ST
						nVlrAnt += Round(QRYPERANT->D2_TOTAL,6)
					Endif

					QRYPERANT->(DbSkip())
				EndDo

				If nVlrAnt > 0
					If (((nVlrFat - nVlrAnt) / nVlrAnt) * 100) >= QRYCLAU->Z14_FXINIC .And. (((nVlrFat - nVlrAnt) / nVlrAnt) * 100) <= QRYCLAU->Z14_FXFINA
						nVlrTit += nVlrFat

					Endif
				Endif
			Endif
		Else
			nVlrTit += nVlrFat
			
		Endif

		If nVlrTit > 0
			If Select("QRYDEV") > 0
				QRYDEV->(DbCloseArea())
			EndIf

			cQry4 := " SELECT SD1.D1_DOC, SD1.D1_SERIE, SD1.D1_ITEM, SD1.D1_COD, SD1.D1_EMISSAO, SD1.D1_QUANT, SD1.D1_VUNIT, SD1.D1_TOTAL,"
			cQry4 += " SD1.D1_ICMSRET, SD1.D1_VALPIS, SD1.D1_VALCOF, SD1.D1_VALICM"
			cQry4 += " FROM "+RetSqlName("SF1")+" SF1, "+RetSqlName("SD1")+" SD1, "+RetSqlName("SD2")+" SD2"
			cQry4 += " WHERE SF1.D_E_L_E_T_	<> '*'"
			cQry4 += " AND SD1.D_E_L_E_T_	<> '*'"
			cQry4 += " AND SD2.D_E_L_E_T_	<> '*'"
			cQry4 += " AND SF1.F1_FILIAL	= '"+xFilial("SF1")+"'"
			cQry4 += " AND SD1.D1_FILIAL	= '"+xFilial("SD1")+"'"
			cQry4 += " AND SD2.D2_FILIAL	= '"+xFilial("SD2")+"'"
			cQry4 += " AND SF1.F1_DOC		= SD1.D1_DOC"
			cQry4 += " AND SF1.F1_SERIE		= SD1.D1_SERIE"
			cQry4 += " AND SF1.F1_FORNECE	= SD1.D1_FORNECE"
			cQry4 += " AND SF1.F1_LOJA		= SD1.D1_LOJA"
			cQry4 += " AND SD1.D1_NFORI		= SD2.D2_DOC"
			cQry4 += " AND SD1.D1_SERIORI	= SD2.D2_SERIE"
			cQry4 += " AND SD1.D1_FORNECE	= SD2.D2_CLIENTE"
			cQry4 += " AND SD1.D1_LOJA		= SD2.D2_LOJA"
			cQry4 += " AND SD1.D1_COD		= SD2.D2_COD"
			cQry4 += " AND SD1.D1_ITEMORI	= SD2.D2_ITEM"
			cQry4 += " AND SF1.F1_TIPO		= 'D'" //Devolução
			cQry4 += " AND SD2.D2_PEDIDO	= '"+QRYCLAU->Z13_PEDIDO+"'"
			cQry4 += " AND SD2.D2_ITEMPV	= '"+QRYCLAU->Z13_ITEMPV+"'"

			cQry4 := ChangeQuery(cQry4)
			MemoWrite("c:\temp\devolucoes.txt",cQry4)
			TcQuery cQry4 New Alias "QRYDEV"

			While QRYDEV->(!EOF())

				If STOD(QRYDEV->D1_EMISSAO) >= dDtIni .AND. STOD(QRYDEV->D1_EMISSAO) <= dDtFim
					
					If QRYAPUR->Z13_BSCALC == "L" //Líquida
						nVlrTit -= Round((QRYDEV->D1_TOTAL - QRYDEV->D1_VALPIS - QRYDEV->D1_VALCOF - QRYDEV->D1_VALICM) * (QRYCLAU->Z14_VLRAPL /100),6)


					ElseIf QRYAPUR->Z13_BSCALC == "B" //Bruta
						nVlrTit -= Round((QRYDEV->D1_TOTAL + QRYDEV->D1_ICMSRET) * (QRYCLAU->Z14_VLRAPL /100),6)

					Else //Bruta s/ ST
						nVlrTit -= Round(QRYDEV->D1_TOTAL * (QRYCLAU->Z14_VLRAPL /100),6)
					Endif
				Endif

				QRYDEV->(DbSkip())
			EndDo
		Endif

		QRYCLAU->(DbSkip())
	EndDo

	If nVlrTit > 0

		AAdd(aDados,{QRYAPUR->Z13_CONTRA, QRYAPUR->Z11_CLIENT, QRYAPUR->Z11_LOJA, QRYAPUR->Z11_NOME, ;
					QRYAPUR->Z11_CGC, QRYAPUR->Z13_TITFIN,QRYAPUR->Z13_NATTIT, nVlrTit})
	
	Endif

	QRYAPUR->(DbSkip())
EndDo

If Select("QRYAPUR") > 0
	QRYAPUR->(DbCloseArea())
EndIf

If Select("QRYCLAU") > 0
	QRYCLAU->(DbCloseArea())
EndIf

If Select("QRYFAT") > 0
	QRYFAT->(DbCloseArea())
EndIf

If Select("QRYDEV") > 0
	QRYDEV->(DbCloseArea())
EndIf

Return aDados

/********************************/
Static Function MontaTela(aDados)
/********************************/

Local oSay1, oSay2, oSay3
Local oButton1
Local oFontTit := TFont():New('Arial',,20,.T.,.F.)

Private oGrid1, oGrid2, oGrid3, oGrid4

Static oDlgApura

aObjects := {}
aSizeAut := MsAdvSize(.F.,,)

//Largura, Altura, Modifica largura, Modifica altura
AAdd(aObjects,{100, 030, .T., .T.})
AAdd(aObjects,{100, 020, .T., .T.})
AAdd(aObjects,{100, 030, .T., .T.})
AAdd(aObjects,{100, 020, .T., .F.})

aInfo 	:= {aSizeAut[1],aSizeAut[2],aSizeAut[3],aSizeAut[4],4,4}
aPosObj := MsObjSize(aInfo,aObjects,.T.)

DEFINE MSDIALOG oDlgApura TITLE "Apuração de Contratos" FROM aSizeAut[7],aSizeAut[1] TO aSizeAut[6],aSizeAut[5] PIXEL OF oMainWnd PIXEL

//Titulo Grid 1
@ aPosObj[1,1], aPosObj[1,2] SAY oSay1 PROMPT "Contrato X Título a ser gerado" SIZE 200, 015 FONT oFontTit OF oDlgApura COLORS CLR_BLUE, 16777215 PIXEL
//Grid 1
oGrid1 := GetDados1()
oGrid1:oBrowse:bChange := {|| CargaGrid2(oGrid1:aCols[oGrid1:nAt][aScan(oGrid1:aHeader,{|x| AllTrim(x[2]) == "Z13_CONTRA"})])}

//Titulo Grid 2
@ aPosObj[2,1], aPosObj[2,2] SAY oSay2 PROMPT "Itens Movimentação" SIZE 070, 015 FONT oFontTit OF oDlgApura COLORS CLR_BLUE, 16777215 PIXEL
//Grid 2
oGrid2 := GetDados2()
oGrid2:oBrowse:bChange := {|| CargaGrid3(oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z13_PEDIDO"})],;
										oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z13_ITEMPV"})],;
										oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z14_VLRAPL"})],;
										oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z14_FXINIC"})],;
										oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z14_FXFINA"})],;
										oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z14_TPFAIX"})]),;							
								CargaGrid4(oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z13_PEDIDO"})],;
										oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z13_ITEMPV"})],;
										oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z14_VLRAPL"})])}

//Titulo Grid 3
@ aPosObj[3,1], aPosObj[3,2] SAY oSay3 PROMPT "Faturamento" SIZE 070, 015 FONT oFontTit OF oDlgApura COLORS CLR_BLUE, 16777215 PIXEL
//Grid 3
oGrid3 := GetDados3()

//Titulo Grid 4
@ aPosObj[3,1], aPosObj[3,4] / 2 SAY oSay4 PROMPT "Devolução" SIZE 070, 015 FONT oFontTit OF oDlgApura COLORS CLR_BLUE, 16777215 PIXEL
//Grid 4
oGrid4:= GetDados4()

//Carga nos grids
CargaGrid1(aDados)

//Linha horizontal
@ aPosObj[4,1] - 5, aPosObj[4,2] SAY oSay3 PROMPT Repl("_",aPosObj[4,4] - 5) SIZE aPosObj[4,4] - 5, 007 OF oDlgApura COLORS CLR_GRAY, 16777215 PIXEL

//Botões
@ aPosObj[4,1] + 5, aPosObj[4,4] - 96 BUTTON oButton1 PROMPT "Apurar" SIZE 040, 010 OF oDlgApura ACTION MsgRun("Realizando apuração...","Aguarde",{|| ConfApura()}) PIXEL
@ aPosObj[4,1] + 5, aPosObj[4,4] - 45 BUTTON oButton1 PROMPT "Fechar" SIZE 040, 010 OF oDlgApura ACTION oDlgApura:End() PIXEL

ACTIVATE MSDIALOG oDlgApura CENTERED

Return

/**************************/
Static Function GetDados1()
/**************************/

Local nX
Local aHeaderEx    := {}
Local aColsEx      := {}
Local aFieldFill   := {}
Local aFields      := {"Z13_CONTRA","Z13_CLIFOR","Z13_LOJA","Z13_NOME","Z13_CGC","Z13_TITFIN","Z13_NATTIT","VLR_TIT"}
Local aAlterFields := {}
Local nLinMax 	   := 999 //Quantidade de linha na getdados

// Define field properties
DbSelectArea("SX3")
SX3->(DbSetOrder(2))

For nX := 1 to Len(aFields)

	If SX3->(DbSeek(aFields[nX]))

		Aadd(aHeaderEx, {AllTrim(X3Titulo()),SX3->X3_CAMPO,SX3->X3_PICTURE,SX3->X3_TAMANHO,SX3->X3_DECIMAL,SX3->X3_VALID,;
						SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})

		If SX3->X3_TIPO == "N"
			AAdd(aFieldFill,0)
		ElseIf SX3->X3_TIPO == "D"
			AAdd(aFieldFill,CToD(""))
		ElseIf SX3->X3_TIPO == "L"
			AAdd(aFieldFill,.F.)
		Else
			AAdd(aFieldFill,"")
		Endif
	ElseIf aFields[nX] == "VLR_TIT"
		Aadd(aHeaderEx, {"Vlr titulo","VLR_TIT","@E 9,999,999,999,999.99",16,2,"","€€€€€€€€€€€€€€","N","","","",""})
		AAdd(aFieldFill,0)
	Endif
Next nX

AAdd(aFieldFill,.F.)
AAdd(aColsEx,aFieldFill)

Return MsNewGetDados():New(aPosObj[1,1] + 14,aPosObj[1,2],aPosObj[1,3],aPosObj[1,4],,"AllwaysTrue","AllwaysTrue",,aAlterFields,,nLinMax,;
							"AllwaysTrue","AllwaysTrue","AllwaysTrue",oDlgApura,aHeaderEx,aColsEx)

/*********************************/
Static Function CargaGrid1(aDados)
/*********************************/

Local nI

Local nPosContra	:= aScan(oGrid1:aHeader,{|x| AllTrim(x[2]) == "Z13_CONTRA"})
Local nPosCliFor	:= aScan(oGrid1:aHeader,{|x| AllTrim(x[2]) == "Z13_CLIFOR"})
Local nPosLoja		:= aScan(oGrid1:aHeader,{|x| AllTrim(x[2]) == "Z13_LOJA"})
Local nPosNome		:= aScan(oGrid1:aHeader,{|x| AllTrim(x[2]) == "Z13_NOME"})
Local nPosCGC		:= aScan(oGrid1:aHeader,{|x| AllTrim(x[2]) == "Z13_CGC"})
Local nPosTitFin	:= aScan(oGrid1:aHeader,{|x| AllTrim(x[2]) == "Z13_TITFIN"})
Local nPosNatTit	:= aScan(oGrid1:aHeader,{|x| AllTrim(x[2]) == "Z13_NATTIT"})
Local nPosVlrTit	:= aScan(oGrid1:aHeader,{|x| AllTrim(x[2]) == "VLR_TIT"})

aSize(oGrid1:aCols,0)

For nI :=  1 To Len(aDados)
	AAdd(oGrid1:aCols,{aDados[nI][nPosContra],;		//Contrato
						aDados[nI][nPosCliFor],;	//Cliente/forn
						aDados[nI][nPosLoja],;		//Loja
						aDados[nI][nPosNome],;		//Nome
						aDados[nI][nPosCGC],;		//CGC
						aDados[nI][nPosTitFin],;	//Tipo de título
						aDados[nI][nPosNatTit],;	//Natureza do título
						aDados[nI][nPosVlrTit],;	//Vlr. título
						.F.})
Next

oGrid1:oBrowse:Refresh()

CargaGrid2(oGrid1:aCols[oGrid1:nAt][nPosContra])

Return

/**************************/
Static Function GetDados2()
/**************************/

Local nX
Local aHeaderEx    := {}
Local aColsEx      := {}
Local aFieldFill   := {}
Local aFields      := {"Z13_PEDIDO","Z13_ITEMPV","Z14_CLAUSU","Z14_DESCCL","Z14_PERIOD","Z14_DESCPE","Z14_GRUPO","Z14_DESCGR","Z14_PRODUT",;
						"Z14_DESCPR","Z14_FXINIC","Z14_FXFINA","Z14_TPFAIX","Z14_VLRAPL","Z14_TPVLRA"}


Local aAlterFields := {}
Local nLinMax 	   := 999 //Quantidade de linha na getdados

// Define field properties
DbSelectArea("SX3")
SX3->(DbSetOrder(2))

For nX := 1 to Len(aFields)

	If SX3->(DbSeek(aFields[nX]))

		Aadd(aHeaderEx, {AllTrim(X3Titulo()),SX3->X3_CAMPO,SX3->X3_PICTURE,SX3->X3_TAMANHO,SX3->X3_DECIMAL,SX3->X3_VALID,;
						SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})

		If SX3->X3_TIPO == "N"
			AAdd(aFieldFill,0)
		ElseIf SX3->X3_TIPO == "D"
			AAdd(aFieldFill,CToD(""))
		ElseIf SX3->X3_TIPO == "L"
			AAdd(aFieldFill,.F.)
		Else
			AAdd(aFieldFill,"")
		Endif
	Endif
Next nX

AAdd(aFieldFill,.F.)
AAdd(aColsEx,aFieldFill)

Return MsNewGetDados():New(aPosObj[2,1] + 14,aPosObj[2,2],aPosObj[2,3],aPosObj[2,4],,"AllwaysTrue","AllwaysTrue",,aAlterFields,,nLinMax,;
							"AllwaysTrue","AllwaysTrue","AllwaysTrue",oDlgApura,aHeaderEx,aColsEx)

/************************************/
Static Function CargaGrid2(cContrato)
/************************************/

Local dDtIni, dDtFim
Local cQry := ""

aSize(oGrid2:aCols,0)

If Select("QRYCLAU") > 0
	QRYCLAU->(DbCloseArea())
EndIf

cQry := " SELECT DISTINCT Z13.Z13_PEDIDO, Z13.Z13_ITEMPV, Z14.Z14_CLAUSU, Z14.Z14_DESCCL, Z14.Z14_PERIOD, Z14.Z14_DESCPE, Z14.Z14_GRUPO, Z14.Z14_DESCGR,"
cQry += " Z14.Z14_PRODUT, Z14.Z14_DESCPR, Z14.Z14_FXINIC, Z14.Z14_FXFINA, Z14.Z14_TPFAIX, Z14.Z14_VLRAPL, Z14.Z14_TPVLRA, SD2.D2_EMISSAO, Z12.Z12_NRODIA"
if Z12->(FieldPos("Z12_TIPOP"))>0
	cQry += ", Z12.Z12_TIPOP "
endif
cQry += " FROM "+RetSqlName("Z13")+" Z13, "+RetSqlName("Z14")+" Z14, "+RetSqlName("Z12")+" Z12, "+RetSqlName("SD2")+" SD2"
cQry += " WHERE Z13.D_E_L_E_T_	<> '*'"
cQry += " AND Z14.D_E_L_E_T_	<> '*'"
cQry += " AND Z12.D_E_L_E_T_	<> '*'"
cQry += " AND SD2.D_E_L_E_T_	<> '*'"
cQry += " AND Z13.Z13_FILIAL	= Z14.Z14_FILIAL"
//cQry += " AND Z14.Z14_FILIAL	= '"+xFilial("Z14")+"'"
//cQry += " AND Z12.Z12_FILIAL	= '"+xFilial("Z12")+"'"
cQry += " AND SD2.D2_FILIAL		= '"+xFilial("SD2")+"'"
cQry += " AND Z13.Z13_CODIGO	= Z14.Z14_CODIGO"
cQry += " AND Z13.Z13_PEDIDO	= SD2.D2_PEDIDO"
cQry += " AND Z13.Z13_ITEMPV	= SD2.D2_ITEMPV"
cQry += " AND Z13.Z13_CONTRA	= '"+cContrato+"'"
cQry += " AND Z14.Z14_PERIOD	= Z12.Z12_CODIGO"
cQry += " AND Z14.Z14_APLICA	= 'A'" //Tipo aplicação igual a apuração
cQry += " AND Z14.Z14_APURAD	<> 'S'" //Não apurado
cQry += " ORDER BY 1,2 " //Não apurado

cQry := ChangeQuery(cQry)
MemoWrite("c:\temp\identificarII.txt",cQry)
TcQuery cQry New Alias "QRYCLAU"

While QRYCLAU->(!EOF())

	//BUSCO AS DATAS DE INICIO E FIM
	PeriodClausula(dDataBase, QRYCLAU->Z12_NRODIA, iif(Z12->(FieldPos("Z12_TIPOP"))>0,QRYCLAU->Z12_TIPOP,""), @dDtIni, @dDtFim )



	If STOD(QRYCLAU->D2_EMISSAO) >= dDtIni .AND. STOD(QRYCLAU->D2_EMISSAO) <= dDtFim

		AAdd(oGrid2:aCols,{QRYCLAU->Z13_PEDIDO,;	//Pedido
							QRYCLAU->Z13_ITEMPV,;	//Itemp PV
							QRYCLAU->Z14_CLAUSU,;	//Cláusula
							QRYCLAU->Z14_DESCCL,;	//Descrição cláusula
							QRYCLAU->Z14_PERIOD,;	//Periodicidade
							QRYCLAU->Z14_DESCPE,;	//Descrição periodicidade
							QRYCLAU->Z14_GRUPO,;	//Grupo de produto
							QRYCLAU->Z14_DESCGR,;	//Descrição grupo de produto
							QRYCLAU->Z14_PRODUT,;	//Produto
							QRYCLAU->Z14_DESCPR,;	//Descrição produto
							QRYCLAU->Z14_FXINIC,;	//Faixa inicial
							QRYCLAU->Z14_FXFINA,;	//Faixa final
							QRYCLAU->Z14_TPFAIX,;	//Tipo faixa
							QRYCLAU->Z14_VLRAPL,;	//Valor aplicação
							QRYCLAU->Z14_TPVLRA,;	//Tipo valor aplicação
							.F.})
	endif

	QRYCLAU->(DbSkip())
EndDO

If Select("QRYCLAU") > 0
	QRYCLAU->(DbCloseArea())
EndIf

oGrid2:oBrowse:Refresh()

CargaGrid3( oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z13_PEDIDO"})],;
			oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z13_ITEMPV"})],;
			oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z14_VLRAPL"})],;
			oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z14_FXINIC"})],;
			oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z14_FXFINA"})],;
			oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z14_TPFAIX"})])

CargaGrid4( oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z13_PEDIDO"})],;
			oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z13_ITEMPV"})],;
			oGrid2:aCols[oGrid2:nAt][aScan(oGrid2:aHeader,{|x| AllTrim(x[2]) == "Z14_VLRAPL"})])

Return

/**************************/
Static Function GetDados3()



Local nX
Local aHeaderEx    := {}
Local aColsEx      := {}
Local aFieldFill   := {}
Local aFields      := {"D2_DOC","D2_SERIE","D2_ITEM","D2_COD","B1_DESC","D2_EMISSAO","D2_QUANT","D2_PRCVEN","D2_TOTAL","D2_ICMSRET",;
						"D2_VALPIS","D2_VALCOF","D2_VALICM","PERC_APLIC","VLR_APLIC"}
Local aAlterFields := {}
Local nLinMax 	   := 999 //Quantidade de linha na getdados

// Define field properties
DbSelectArea("SX3")
SX3->(DbSetOrder(2))

For nX := 1 to Len(aFields)

	If SX3->(DbSeek(aFields[nX]))

		Aadd(aHeaderEx, {AllTrim(X3Titulo()),SX3->X3_CAMPO,SX3->X3_PICTURE,SX3->X3_TAMANHO,SX3->X3_DECIMAL,SX3->X3_VALID,;
						SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})

		If SX3->X3_TIPO == "N"
			AAdd(aFieldFill,0)
		ElseIf SX3->X3_TIPO == "D"
			AAdd(aFieldFill,CToD(""))
		ElseIf SX3->X3_TIPO == "L"
			AAdd(aFieldFill,.F.)
		Else
			AAdd(aFieldFill,"")
		Endif
	ElseIf aFields[nX] == "PERC_APLIC"
		Aadd(aHeaderEx, {"Perc aplicacao","PERC_APLIC","@E 9,999,999,999,999.99",16,2,"","€€€€€€€€€€€€€€","N","","","",""})
		AAdd(aFieldFill,0)
	ElseIf aFields[nX] == "VLR_APLIC"
		Aadd(aHeaderEx, {"Vlr apuracao","VLR_APLIC","@E 9,999,999,999,999.99",16,2,"","€€€€€€€€€€€€€€","N","","","",""})
		AAdd(aFieldFill,0)
	Endif
Next nX

AAdd(aFieldFill,.F.)
AAdd(aColsEx,aFieldFill)

Return MsNewGetDados():New(aPosObj[3,1] + 14,aPosObj[3,2],aPosObj[3,3],(aPosObj[3,4] / 2) - 10,,"AllwaysTrue","AllwaysTrue",,aAlterFields,,nLinMax,;
							"AllwaysTrue","AllwaysTrue","AllwaysTrue",oDlgApura,aHeaderEx,aColsEx)

/********************************************************************************/
Static Function CargaGrid3(cPedido,cItPedido,nPercAplic,nFxInic,nFxFina,cTpFaixa)
/********************************************************************************/

Local cQry := " "

aSize(oGrid3:aCols,0)

If Select("QRYFAT") > 0
	QRYFAT->(DbCloseArea())
EndIf


/*
cQry := " SELECT SD2.D2_DOC, SD2.D2_SERIE, SD2.D2_ITEM, SD2.D2_COD, SB1.B1_DESC, SD2.D2_EMISSAO, SD2.D2_QUANT, SD2.D2_PRCVEN, SD2.D2_TOTAL,"
cQry += " SD2.D2_ICMSRET, SD2.D2_VALPIS, SD2.D2_VALCOF, SD2.D2_VALICM"
cQry += " FROM "+RetSqlName("SD2")+" SD2, "+RetSqlName("SB1")+" SB1"
cQry += " WHERE SD2.D_E_L_E_T_	<> '*'"
cQry += " AND SB1.D_E_L_E_T_	<> '*'"
cQry += " AND SD2.D2_FILIAL		= '"+xFilial("SD2")+"'"
//cQry += " AND SB1.B1_FILIAL		= '"+xFilial("SB1")+"'"
cQry += " AND SD2.D2_COD		= SB1.B1_COD"
cQry += " AND SD2.D2_PEDIDO		= '"+cPedido+"'"
cQry += " AND SD2.D2_ITEMPV		= '"+cItPedido+"'"
cQry += " ORDER BY 1,2"
*/

cQry := " SELECT DISTINCT SD2.D2_DOC, SD2.D2_SERIE, SD2.D2_ITEM, SD2.D2_COD, D2_PRCVEN,SB1.B1_DESC, SD2.D2_EMISSAO, SD2.D2_QUANT, Z13.Z13_VLRBAS, SD2.D2_TOTAL,"
cQry += "Z13.Z13_ICMSST ,  Z13.Z13_PIS, Z13.Z13_COFINS,Z13.Z13_ICMS, Z14.z14_vlrapl"  
cQry += "FROM   z13010 Z13 "
cQry += "       INNER JOIN z14010 Z14 "
cQry += "               ON z14.d_e_l_e_t_ = ' ' "
cQry += "                  AND Z13.z13_filial = Z14.z14_filial "
cQry += "                  AND Z13.z13_codigo = Z14.z14_codigo "
cQry += "       INNER JOIN sd2010 sd2"
cQry += "               ON sd2.d_e_l_e_t_ = ' ' "
cQry += "                  AND Z13.z13_filial = sd2.d2_filial "
cQry += "                  AND Z13.z13_pedido = sd2.d2_pedido "
cQry += "                  AND Z13.z13_itempv = sd2.d2_itempv "
cQry += "       INNER JOIN SB1010 SB1 ON SB1.D_E_L_E_T_=' '"
cQry += "                  AND SD2.D2_COD = SB1.B1_COD"         
cQry += "WHERE  z13.d_e_l_e_t_ = ' ' "
cQry += " AND SD2.D2_PEDIDO		= '"+cPedido+"'"
cQry += " AND SD2.D2_ITEMPV		= '"+cItPedido+"'"
cQry += " AND z14_aplica = 'A' "
cQry += " ORDER BY 1,2"

cQry := ChangeQuery(cQry)
MemoWrite("c:\temp\RFATE026_QRYFAT.txt",cQry)
TcQuery cQry New Alias "QRYFAT"

While QRYFAT->(!EOF())

	AAdd(oGrid3:aCols,{QRYFAT->D2_DOC,;										//Documento
						QRYFAT->D2_SERIE,;									//Série
						QRYFAT->D2_ITEM,;									//Item
						QRYFAT->D2_COD,;									//Produto
						QRYFAT->B1_DESC,;									//Descrição produto
						SToD(QRYFAT->D2_EMISSAO),;							//Emissão
						QRYFAT->D2_QUANT,;									//Quantidade
						QRYFAT->D2_PRCVEN,;									//Valor unitário
						QRYFAT->D2_TOTAL,;									//Total
						QRYFAT->(Z13_ICMSST * D2_QUANT),;								//ICMS ST
						QRYFAT->(Z13_PIS * D2_QUANT),;									//PIS
						QRYFAT->(Z13_COFINS * D2_QUANT),;									//COFINS
						QRYFAT->(Z13_ICMS * D2_QUANT),;									//ICMS
						nPercAplic,;										//Percentual aplicação
						Round((Round((QRYFAT->z13_vlrbas * (QRYFAT->z14_vlrapl/ 100)),6)*QRYFAT->d2_quant),2),;	//Valor apuração
						.F.})

	QRYFAT->(DbSkip())
EndDo

If Select("QRYFAT") > 0
	QRYFAT->(DbCloseArea())
EndIf

oGrid3:oBrowse:Refresh()

Return

/**************************/
Static Function GetDados4()
/**************************/

Local nX
Local aHeaderEx    := {}
Local aColsEx      := {}
Local aFieldFill   := {}
Local aFields      := {"D1_DOC","D1_SERIE","D1_ITEM","D1_COD","B1_DESC","D1_EMISSAO","D1_QUANT","D1_VUNIT","D1_TOTAL","D1_ICMSRET",;
						"D1_VALPIS","D1_VALCOF","D1_VALICM","PERC_APLIC","VLR_APLIC"}
Local aAlterFields := {}
Local nLinMax 	   := 999 //Quantidade de linha na getdados

// Define field properties
DbSelectArea("SX3")
SX3->(DbSetOrder(2))

For nX := 1 to Len(aFields)

	If SX3->(DbSeek(aFields[nX]))

		Aadd(aHeaderEx, {AllTrim(X3Titulo()),SX3->X3_CAMPO,SX3->X3_PICTURE,SX3->X3_TAMANHO,SX3->X3_DECIMAL,SX3->X3_VALID,;
						SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})

		If SX3->X3_TIPO == "N"
			AAdd(aFieldFill,0)
		ElseIf SX3->X3_TIPO == "D"
			AAdd(aFieldFill,CToD(""))
		ElseIf SX3->X3_TIPO == "L"
			AAdd(aFieldFill,.F.)
		Else
			AAdd(aFieldFill,"")
		Endif
	ElseIf aFields[nX] == "PERC_APLIC"
		Aadd(aHeaderEx, {"Perc aplicacao","PERC_APLIC","@E 999,999,999.999999",16,2,"","€€€€€€€€€€€€€€","N","","","",""})
		AAdd(aFieldFill,0)
	ElseIf aFields[nX] == "VLR_APLIC"
		Aadd(aHeaderEx, {"Vlr apuracao","VLR_APLIC","@E 999,999,999.999999",16,2,"","€€€€€€€€€€€€€€","N","","","",""})
		AAdd(aFieldFill,0)
	Endif
Next nX

AAdd(aFieldFill,.F.)
AAdd(aColsEx,aFieldFill)

Return MsNewGetDados():New(aPosObj[3,1] + 14,aPosObj[3,4] / 2,aPosObj[3,3],aPosObj[3,4],,"AllwaysTrue","AllwaysTrue",,aAlterFields,,nLinMax,;
							"AllwaysTrue","AllwaysTrue","AllwaysTrue",oDlgApura,aHeaderEx,aColsEx)

/*******************************************************/
Static Function CargaGrid4(cPedido,cItPedido,nPercAplic)
/*******************************************************/

Local cQry := ""

aSize(oGrid4:aCols,0)

If Select("QRYDEV") > 0
	QRYDEV->(DbCloseArea())
EndIf

cQry := " SELECT SD1.D1_DOC, SD1.D1_SERIE, SD1.D1_ITEM, SD1.D1_COD, SD1.D1_EMISSAO, SD1.D1_QUANT, SD1.D1_VUNIT, SD1.D1_TOTAL, SB1.B1_DESC,"
cQry += " SD1.D1_ICMSRET, SD1.D1_VALPIS, SD1.D1_VALCOF, SD1.D1_VALICM"
cQry += " FROM "+RetSqlName("SF1")+" SF1, "+RetSqlName("SD1")+" SD1, "+RetSqlName("SD2")+" SD2, "+RetSqlName("SB1")+" SB1"
cQry += " WHERE SF1.D_E_L_E_T_	<> '*'"
cQry += " AND SD1.D_E_L_E_T_	<> '*'"
cQry += " AND SD2.D_E_L_E_T_	<> '*'"
cQry += " AND SB1.D_E_L_E_T_	<> '*'"
cQry += " AND SF1.F1_FILIAL		= '"+xFilial("SF1")+"'"
cQry += " AND SD1.D1_FILIAL		= '"+xFilial("SD1")+"'"
cQry += " AND SD2.D2_FILIAL		= '"+xFilial("SD2")+"'"
cQry += " AND SB1.B1_FILIAL		= '"+xFilial("SB1")+"'"
cQry += " AND SF1.F1_DOC		= SD1.D1_DOC"
cQry += " AND SF1.F1_SERIE		= SD1.D1_SERIE"
cQry += " AND SF1.F1_FORNECE	= SD1.D1_FORNECE"
cQry += " AND SF1.F1_LOJA		= SD1.D1_LOJA"
cQry += " AND SD1.D1_NFORI		= SD2.D2_DOC"
cQry += " AND SD1.D1_SERIORI	= SD2.D2_SERIE"
cQry += " AND SD1.D1_FORNECE	= SD2.D2_CLIENTE"
cQry += " AND SD1.D1_LOJA		= SD2.D2_LOJA"
cQry += " AND SD1.D1_COD		= SD2.D2_COD"
cQry += " AND SD1.D1_ITEMORI	= SD2.D2_ITEM"
cQry += " AND SD1.D1_COD		= SB1.B1_COD"
cQry += " AND SD2.D2_COD		= SB1.B1_COD"
cQry += " AND SF1.F1_TIPO		= 'D'" //Devolução
cQry += " AND SD2.D2_PEDIDO		= '"+cPedido+"'"
cQry += " AND SD2.D2_ITEMPV		= '"+cItPedido+"'"
cQry += " ORDER BY 1,2"

cQry := ChangeQuery(cQry)
MemoWrite("c:\temp\RFATE026_QRYDEV.txt",cQry)
TcQuery cQry New Alias "QRYDEV"

While QRYDEV->(!EOF())

	AAdd(oGrid4:aCols,{QRYDEV->D1_DOC,;										//Documento
						QRYDEV->D1_SERIE,;									//Série
						QRYDEV->D1_ITEM,;									//Item
						QRYDEV->D1_COD,;									//Produto
						QRYDEV->B1_DESC,;									//Descrição produto
						SToD(QRYDEV->D1_EMISSAO),;							//Emissão
						QRYDEV->D1_QUANT,;									//Quantidade
						QRYDEV->D1_VUNIT,;									//Valor unitário
						QRYDEV->D1_TOTAL,;									//Total
						QRYDEV->D1_ICMSRET,;								//ICMS ST
						QRYDEV->D1_VALPIS,;									//PIS
						QRYDEV->D1_VALCOF,;									//COFINS
						QRYDEV->D1_VALICM,;									//ICMS
						nPercAplic,;										//Percentual aplicação
						Round(QRYDEV->D1_TOTAL * (nPercAplic / 100),2),;	
						.F.})
						//nVlrPar,;
	QRYDEV->(DbSkip())
EndDo

If Select("QRYDEV") > 0
	QRYDEV->(DbCloseArea())
EndIf

oGrid4:oBrowse:Refresh()

Return

/**************************/
Static Function ConfApura()
/**************************/

Local lRet			:= .T.
Local nI
//Local nY
//Local nCont 		:= 0
Local nPosContra	:= aScan(oGrid1:aHeader,{|x| AllTrim(x[2]) == "Z13_CONTRA"})
Local nPosCGC		:= aScan(oGrid1:aHeader,{|x| AllTrim(x[2]) == "Z13_CGC"})
Local nPosTitFin	:= aScan(oGrid1:aHeader,{|x| AllTrim(x[2]) == "Z13_TITFIN"})
Local nPosNatTit	:= aScan(oGrid1:aHeader,{|x| AllTrim(x[2]) == "Z13_NATTIT"})
Local nPosVlrTit	:= aScan(oGrid1:aHeader,{|x| AllTrim(x[2]) == "VLR_TIT"})

Local aItLog		:= {}

If MsgYesNo("Será realizada apuração dos Contratos selecionados, deseja continuar?")

	Begin Transaction

	For nI := 1 To Len(oGrid1:aCols)

		aItLog := RetItLog(oGrid1:aCols[nI][nPosContra])

		lRet := U_RFATE031(oGrid1:aCols[nI][nPosContra],;
							oGrid1:aCols[nI][nPosTitFin],;
							oGrid1:aCols[nI][nPosNatTit],;
							oGrid1:aCols[nI][nPosVlrTit],;
							oGrid1:aCols[nI][nPosCgc],;
							aItLog)
	Next

	End Transaction

	MsgInfo("Processamento finalizado.","Aviso")

	oDlgApura:End()
Endif

Return

/**********************************/
Static Function RetItLog(cContrato)
/**********************************/

Local cQry		:= ""
Local cQry2		:= ""
Local cQry3		:= ""
Local dDtIni, dDtFim
Local aRet		:= {}
Local nVlrPar	:= 0

If Select("QRYCLAU") > 0
	QRYCLAU->(DbCloseArea())
EndIf

cQry := " SELECT DISTINCT Z13.Z13_BSCALC, Z13.Z13_PEDIDO, Z13.Z13_ITEMPV, Z14.Z14_CODIGO, Z14.Z14_ITEM, Z14.Z14_ITCLAU, Z14.Z14_CLAUSU, Z14.Z14_DESCCL,"
cQry += " Z14.Z14_FXINIC, Z14.Z14_FXFINA, Z14.Z14_VLRAPL, Z12.Z12_NRODIA"
if Z12->(FieldPos("Z12_TIPOP"))>0
	cQry += ", Z12.Z12_TIPOP "
endif
cQry += " FROM "+RetSqlName("Z13")+" Z13, "+RetSqlName("Z14")+" Z14, "+RetSqlName("SD2")+" SD2, "+RetSqlName("Z12")+" Z12""
cQry += " WHERE Z13.D_E_L_E_T_	<> '*'"
cQry += " AND Z14.D_E_L_E_T_	<> '*'"
cQry += " AND Z12.D_E_L_E_T_	<> '*'"
cQry += " AND SD2.D_E_L_E_T_	<> '*'"
cQry += " AND Z13.Z13_FILIAL	= '"+xFilial("Z13")+"'"
cQry += " AND Z14.Z14_FILIAL	= '"+xFilial("Z14")+"'"
cQry += " AND Z12.Z12_FILIAL	= '"+xFilial("Z12")+"'"
cQry += " AND SD2.D2_FILIAL		= '"+xFilial("SD2")+"'"
cQry += " AND Z13.Z13_CODIGO	= Z14.Z14_CODIGO"
cQry += " AND Z14.Z14_PERIOD	= Z12.Z12_CODIGO"
cQry += " AND Z13.Z13_PEDIDO	= SD2.D2_PEDIDO"
cQry += " AND Z13.Z13_ITEMPV	= SD2.D2_ITEMPV"
cQry += " AND Z13.Z13_CONTRA	= '"+cContrato+"'"
cQry += " AND Z14.Z14_APLICA	= 'A'" //Tipo aplicação igual a apuração
cQry += " AND Z14.Z14_APURAD	<> 'S'" //Não apurado

cQry := ChangeQuery(cQry)
MemoWrite("c:\temp\RFATE026_QRYCLAU.txt",cQry)
TcQuery cQry New Alias "QRYCLAU"

While QRYCLAU->(!EOF())

	//BUSCO AS DATAS DE INICIO E FIM
	PeriodClausula(dDataBase, QRYCLAU->Z12_NRODIA, iif(Z12->(FieldPos("Z12_TIPOP"))>0,QRYCLAU->Z12_TIPOP,""), @dDtIni, @dDtFim )

	If Select("QRYFAT") > 0
		QRYFAT->(DbCloseArea())
	EndIf

	cQry2 := " SELECT D2_EMISSAO, D2_TOTAL, D2_ICMSRET, D2_VALPIS, D2_VALCOF, D2_VALICM"
	cQry2 += " FROM "+RetSqlName("SD2")+""
	cQry2 += " WHERE D_E_L_E_T_	<> '*'"
	cQry2 += " AND D2_FILIAL	= '"+xFilial("SD2")+"'"
	cQry2 += " AND D2_PEDIDO	= '"+QRYCLAU->Z13_PEDIDO+"'"
	cQry2 += " AND D2_ITEMPV	= '"+QRYCLAU->Z13_ITEMPV+"'"

	cQry2 := ChangeQuery(cQry2)
	MemoWrite("c:\temp\RFATE026_QRYFAT.txt",cQry2)
	TcQuery cQry2 New Alias "QRYFAT"

	While QRYFAT->(!EOF())

		If STOD(QRYFAT->D2_EMISSAO) >= dDtIni .AND. STOD(QRYFAT->D2_EMISSAO) <= dDtFim

			If QRYCLAU->Z14_FXINIC > 0 .Or. QRYCLAU->Z14_FXFINA > 0

				If nVlrPar >= QRYCLAU->Z14_FXINIC .And. nVlrPar <= QRYCLAU->Z14_FXFINA

					If QRYCLAU->Z13_BSCALC == "L" //Líquida
						nVlrPar += (QRYFAT->D2_TOTAL - QRYFAT->D2_VALPIS - QRYFAT->D2_VALCOF - QRYFAT->D2_VALICM) * (QRYCLAU->Z14_VLRAPL /100)
					  
					ElseIf QRYCLAU->Z13_BSCALC == "B" //Bruta
						nVlrPar += (QRYFAT->D2_TOTAL + QRYFAT->D2_ICMSRET) * (QRYCLAU->Z14_VLRAPL /100)

					Else //Bruta s/ ST
						nVlrPar += QRYFAT->D2_TOTAL * (QRYCLAU->Z14_VLRAPL /100)
					Endif
				Endif
			Else
				If QRYCLAU->Z13_BSCALC == "L" //Líquida
					nVlrPar += (QRYFAT->D2_TOTAL - QRYFAT->D2_VALPIS - QRYFAT->D2_VALCOF - QRYFAT->D2_VALICM) * (QRYCLAU->Z14_VLRAPL /100)
		
				ElseIf QRYCLAU->Z13_BSCALC == "B" //Bruta
					nVlrPar += (QRYFAT->D2_TOTAL + QRYFAT->D2_ICMSRET) * (QRYCLAU->Z14_VLRAPL /100)

				Else //Bruta s/ ST
					nVlrPar += QRYFAT->D2_TOTAL * (QRYCLAU->Z14_VLRAPL /100)
				Endif
			Endif
		Endif

		QRYFAT->(DbSkip())
	EndDo

	If nVlrPar > 0

		If Select("QRYDEV") > 0
			QRYDEV->(DbCloseArea())
		EndIf

		cQry3 := " SELECT SD1.D1_DOC, SD1.D1_SERIE, SD1.D1_ITEM, SD1.D1_COD, SD1.D1_EMISSAO, SD1.D1_QUANT, SD1.D1_VUNIT, SD1.D1_TOTAL,"
		cQry3 += " SD1.D1_ICMSRET, SD1.D1_VALPIS, SD1.D1_VALCOF, SD1.D1_VALICM"
		cQry3 += " FROM "+RetSqlName("SF1")+" SF1, "+RetSqlName("SD1")+" SD1, "+RetSqlName("SD2")+" SD2"
		cQry3 += " WHERE SF1.D_E_L_E_T_	<> '*'"
		cQry3 += " AND SD1.D_E_L_E_T_	<> '*'"
		cQry3 += " AND SD2.D_E_L_E_T_	<> '*'"
		cQry3 += " AND SF1.F1_FILIAL	= '"+xFilial("SF1")+"'"
		cQry3 += " AND SD1.D1_FILIAL	= '"+xFilial("SD1")+"'"
		cQry3 += " AND SD2.D2_FILIAL	= '"+xFilial("SD2")+"'"
		cQry3 += " AND SF1.F1_DOC		= SD1.D1_DOC"
		cQry3 += " AND SF1.F1_SERIE		= SD1.D1_SERIE"
		cQry3 += " AND SF1.F1_FORNECE	= SD1.D1_FORNECE"
		cQry3 += " AND SF1.F1_LOJA		= SD1.D1_LOJA"
		cQry3 += " AND SD1.D1_NFORI		= SD2.D2_DOC"
		cQry3 += " AND SD1.D1_SERIORI	= SD2.D2_SERIE"
		cQry3 += " AND SD1.D1_FORNECE	= SD2.D2_CLIENTE"
		cQry3 += " AND SD1.D1_LOJA		= SD2.D2_LOJA"
		cQry3 += " AND SD1.D1_COD		= SD2.D2_COD"
		cQry3 += " AND SD1.D1_ITEMORI	= SD2.D2_ITEM"
		cQry3 += " AND SF1.F1_TIPO		= 'D'" //Devolução
		cQry3 += " AND SD2.D2_PEDIDO	= '"+QRYCLAU->Z13_PEDIDO+"'"
		cQry3 += " AND SD2.D2_ITEMPV	= '"+QRYCLAU->Z13_ITEMPV+"'"

		cQry3 := ChangeQuery(cQry3)
		MemoWrite("c:\temp\RFATE026_QRYDEV.txt",cQry3)
		TcQuery cQry3 New Alias "QRYDEV"

		While QRYDEV->(!EOF())

			If STOD(QRYDEV->D1_EMISSAO) >= dDtIni .AND. STOD(QRYDEV->D1_EMISSAO) <= dDtFim

				If QRYCLAU->Z13_BSCALC == "L" //Líquida
					nVlrPar -= (QRYDEV->D1_TOTAL - QRYDEV->D1_VALPIS - QRYDEV->D1_VALCOF - QRYDEV->D1_VALICM) * (QRYCLAU->Z14_VLRAPL /100)

				ElseIf QRYCLAU->Z13_BSCALC == "B" //Bruta
					nVlrPar -= (QRYDEV->D1_TOTAL + QRYDEV->D1_ICMSRET) * (QRYCLAU->Z14_VLRAPL /100)

				Else //Bruta s/ ST
					nVlrPar -= QRYDEV->D1_TOTAL * (QRYCLAU->Z14_VLRAPL /100)
				Endif
			Endif

			QRYDEV->(DbSkip())
		EndDo
	Endif

	AAdd(aRet,{QRYCLAU->Z14_CODIGO,QRYCLAU->Z14_ITEM,QRYCLAU->Z14_ITCLAU,QRYCLAU->Z14_CLAUSU,QRYCLAU->Z14_DESCCL,nVlrPar})

	QRYCLAU->(DbSkip())
EndDo

If Select("QRYCLAU") > 0
	QRYCLAU->(DbCloseArea())
EndIf

Return aRet

//Obtem datas de inicio e fim da clausula, de acordo com o tipo
Static Function PeriodClausula(dDataApu, nNumDias, cTipoPer, dDtIni, dDtFim)

	dDtFim := dDataApu - 1 //por padrão é a data base - 1 (pra desconsiderar a prorpria data)
	dDtIni := dDataApu - nNumDias //por padrão é a data fim - dias

	//se período está em meses, ajusto data inicial e final
	if nNumDias > 0 .AND. cTipoPer == "M"
		dDtIni := MonthSub(dDataApu, nNumDias) //subtraio os meses
		dDtIni := CTOD(cValToChar(FirstDay(dDtIni))+"/"+SubStr(DTOC(dDtIni),4)) //primeiro dia do mes
		dDtFim := MonthSub(dDataApu, 1) //retiro um mes apenas (mes anterior)
		dDtFim := CTOD( cValToChar(LastDay(dDtFim)) + "/" + SubStr(DTOC(dDtFim),4)) //ultimo dia do mes anterior
	endif

Return
