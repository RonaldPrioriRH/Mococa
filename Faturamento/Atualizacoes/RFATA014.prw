#INCLUDE 'Protheus.ch'
#include "topconn.ch"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³RFATA014  ºAutor  ³Tarcisio Silva MirandaºData³  16/02/2018 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Mapeamento de Pedidos.								      º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Mapeia todos os pedidos através de uma tela de rastreio.   º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function RFATA014()

	Local oGroup1
	Local oGroup2
	Local oGroup3
	Local oGroup4
	Local oGroup5
	Local oGroup6
	Local oGroup7
	Local oSay1
	Local oSay2
	Local oSay3
	Local oSay4
	Local oSay5
	Local oSay6
	Local oSay7 

	Private oButton1
	Private oButton2                    
	Private oCheckBo1
	Private lCheckBo1 := .F. //Posição
	Private oCheckBo2
	Private lCheckBo2 := .F. //Credito
	Private oCheckBo3
	Private lCheckBo3 := .F. //Liberado
	Private oCheckBo4
	Private lCheckBo4 := .F. //Rejeitado
	Private oCheckBo5
	Private lCheckBo5 := .F. //Em carga
	Private oCheckBo6
	Private lCheckBo6 := .F. //Expedição
	Private oCheckBo7
	Private lCheckBo7 := .F. //Em aberto
	Private oFolder1
	Private oGet1
	Private cGet1 := cTod("  /  /   ") //Periodo de.
	Private oGet2
	Private cGet2 := cTod("  /  /   ") //Periodo Ate.
	Private oGet3
	Private cGet3 := Space(4) //Filial de Estoque .
	Private oGet4
	Private cGet4 := Space(4)//Filial de Faturamento. 
	Private oGet5
	Private cGet5 := 0
	Private oGet6
	Private cGet6 := 0
	Private cSql  := ""
	Private cSql2 := ""
	Private cSql3 := ""
	Private cEol  := chr(13)+chr(10)
	Private cSatus := ""
	Private lTodas := .F.

	Static oDlg

	DEFINE MSDIALOG oDlg TITLE "Faturamento/Pedidos" FROM 000, 000  TO 520, 900 COLORS 0, 16777215 PIXEL

	@ 004, 003 GROUP oGroup1 TO 256, 446 PROMPT "Pedidos | " OF oDlg COLOR 0, 16777215 PIXEL
	@ 014, 008 FOLDER oFolder1 SIZE 433, 238 OF oDlg ITEMS "Faturado","Pedido" COLORS 0, 16777215 PIXEL
	@ 003, 004 GROUP oGroup2 TO 051, 425 PROMPT "Parametros | " OF oFolder1:aDialogs[1] COLOR 0, 16777215 PIXEL
	@ 054, 004 GROUP oGroup3 TO 183, 424 PROMPT "Informações | " OF oFolder1:aDialogs[1] COLOR 0, 16777215 PIXEL
	@ 186, 005 GROUP oGroup4 TO 222, 424 PROMPT "Totalizador | " OF oFolder1:aDialogs[1] COLOR 0, 16777215 PIXEL
	@ 014, 012 SAY oSay1 PROMPT "Periodo : " SIZE 024, 007 OF oFolder1:aDialogs[1] COLORS 0, 16777215 PIXEL
	@ 013, 036 MSGET oGet1 VAR cGet1 SIZE 060, 010 OF oFolder1:aDialogs[1] COLORS 0, 16777215 HASBUTTON  PIXEL
	@ 013, 098 MSGET oGet2 VAR cGet2 SIZE 060, 010 OF oFolder1:aDialogs[1] COLORS 0, 16777215 HASBUTTON  PIXEL
	@ 027, 012 SAY oSay2 PROMPT "Filial Est : " SIZE 025, 007 OF oFolder1:aDialogs[1] COLORS 0, 16777215 PIXEL
	@ 039, 012 SAY oSay3 PROMPT "Filial Fat :" SIZE 025, 006 OF oFolder1:aDialogs[1] COLORS 0, 16777215 PIXEL
	@ 025, 036 MSGET oGet3 VAR cGet3 SIZE 060, 010 OF oFolder1:aDialogs[1] COLORS 0, 16777215 HASBUTTON F3 "SM0" PIXEL
	@ 037, 036 MSGET oGet4 VAR cGet4 SIZE 060, 010 OF oFolder1:aDialogs[1] COLORS 0, 16777215 HASBUTTON F3 "SM0" PIXEL
	@ 203, 009 SAY oSay4 PROMPT "Total :" SIZE 017, 007 OF oFolder1:aDialogs[1] COLORS 0, 16777215 PIXEL
	@ 201, 027 MSGET oGet5 VAR cGet5 SIZE 076, 010 OF oFolder1:aDialogs[1] COLORS 0, 16777215 When .F.PIXEL
	@ 013, 163 BUTTON oButton1 PROMPT "Pesquisar " SIZE 037, 010 OF oFolder1:aDialogs[1] action Processa({|| fMSNewGe1()},"Processando...")PIXEL

	@ 001, 003 GROUP oGroup5 TO 050, 424 PROMPT "Parametros | " OF oFolder1:aDialogs[2] COLOR 0, 16777215 PIXEL
	@ 052, 003 GROUP oGroup6 TO 182, 424 PROMPT "Informações | " OF oFolder1:aDialogs[2] COLOR 0, 16777215 PIXEL
	@ 184, 004 GROUP oGroup7 TO 220, 424 PROMPT "Totalizador | " OF oFolder1:aDialogs[2] COLOR 0, 16777215 PIXEL
	@ 014, 043 CHECKBOX oCheckBo1 VAR lCheckBo1 PROMPT "Posição    " SIZE 032, 008 OF oFolder1:aDialogs[2] COLORS 0, 16777215 PIXEL ON CLICK(Processa({|| funAgrupa()},"Processando..."))
	@ 014, 009 SAY oSay6 PROMPT "Agrupar por :" SIZE 032, 007 OF oFolder1:aDialogs[2] COLORS 0, 16777215 PIXEL
	@ 200, 010 SAY oSay5 PROMPT "Total :" SIZE 017, 007 OF oFolder1:aDialogs[2] COLORS 0, 16777215 PIXEL
	@ 198, 029 MSGET oGet6 VAR cGet6 SIZE 076, 010 OF oFolder1:aDialogs[2] COLORS 0, 16777215 When .F.PIXEL
	@ 013, 076 BUTTON oButton2 PROMPT "Pesquisar" SIZE 033, 009 OF oFolder1:aDialogs[2] action Processa({|| fMSNewGe2()},"Processando...")PIXEL
	@ 009, 147 CHECKBOX oCheckBo2 VAR lCheckBo2 PROMPT "Credito" SIZE 028, 010 OF oFolder1:aDialogs[2] COLORS 0, 16777215 PIXEL ON CLICK(Processa({|| fMSNewGe2()},"Processando..."))
	@ 022, 147 CHECKBOX oCheckBo3 VAR lCheckBo3 PROMPT "Liberado" SIZE 032, 008 OF oFolder1:aDialogs[2] COLORS 0, 16777215 PIXEL ON CLICK(Processa({|| fMSNewGe2()},"Processando..."))
	@ 034, 187 CHECKBOX oCheckBo5 VAR lCheckBo5 PROMPT "Em Carga" SIZE 035, 008 OF oFolder1:aDialogs[2] COLORS 0, 16777215 PIXEL ON CLICK(Processa({|| fMSNewGe2()},"Processando..."))
	@ 034, 147 CHECKBOX oCheckBo6 VAR lCheckBo6 PROMPT "Expedição" SIZE 038, 008 OF oFolder1:aDialogs[2] COLORS 0, 16777215 PIXEL ON CLICK(Processa({|| fMSNewGe2()},"Processando..."))
	@ 009, 187 CHECKBOX oCheckBo7 VAR lCheckBo7 PROMPT "Em Aberto" SIZE 037, 008 OF oFolder1:aDialogs[2] COLORS 0, 16777215 PIXEL ON CLICK(Processa({|| fMSNewGe2()},"Processando..."))
	@ 022, 187 CHECKBOX oCheckBo4 VAR lCheckBo4 PROMPT "Rejeitado" SIZE 033, 008 OF oFolder1:aDialogs[2] COLORS 0, 16777215 PIXEL ON CLICK(Processa({|| fMSNewGe2()},"Processando..."))
	@ 022, 122 SAY oSay7 PROMPT "Status :" SIZE 022, 007 OF oFolder1:aDialogs[2] COLORS 0, 16777215 PIXEL

	fMSNewGe2()
	fMSNewGe1()

	ACTIVATE MSDIALOG oDlg CENTERED

Return()

//------------------------------------------------ 
Static Function fMSNewGe1()
	//------------------------------------------------ 
	Local nX
	Local aHeaderEx := {}
	Local aColsEx := {}
	Local aFieldFill := {}
	Local aFields := {"A1_NOME","A2_NOME","E2_VALOR","E1_VALOR","E5_VALOR"}
	Local aAlterFields := {}

	Static oMSNewGe1

	// Define field properties
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	For nX := 1 to Len(aFields)
		if aFields[nX] $ "A1_NOME"
			SX3->(DbSeek(aFields[nX]))
			Aadd(aHeaderEx, {"Filial Est.",SX3->X3_CAMPO,SX3->X3_PICTURE,22,SX3->X3_DECIMAL,SX3->X3_VALID,;
			SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})

		elseif aFields[nX] = "A2_NOME"
			SX3->(DbSeek(aFields[nX]))
			Aadd(aHeaderEx, {"Filial Fat.",SX3->X3_CAMPO,SX3->X3_PICTURE,22,SX3->X3_DECIMAL,SX3->X3_VALID,;
			SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})

		elseif aFields[nX] = "E2_VALOR"
			SX3->(DbSeek(aFields[nX]))
			Aadd(aHeaderEx, {"Valor Total",SX3->X3_CAMPO,SX3->X3_PICTURE,8,SX3->X3_DECIMAL,SX3->X3_VALID,;
			SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})

		elseif aFields[nX] = "E1_VALOR"
			SX3->(DbSeek(aFields[nX]))
			Aadd(aHeaderEx, {"Qtd. Clientes",SX3->X3_CAMPO,SX3->X3_PICTURE,5,SX3->X3_DECIMAL,SX3->X3_VALID,;
			SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})

		elseif aFields[nX] = "E5_VALOR"
			SX3->(DbSeek(aFields[nX]))
			Aadd(aHeaderEx, {"Qtd. Nfs",SX3->X3_CAMPO,SX3->X3_PICTURE,5,SX3->X3_DECIMAL,SX3->X3_VALID,;
			SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})
		endif
	Next nX

	cSql := " SELECT X.CD_FILIALNF, FF.AKF_DESCRI AS NM_FILIALNF, NVL(TRIM(X.CD_FILIALEST),X.CD_FILIALNF) AS CD_FILIALEST, 					" + cEol
	cSql += "        FE.AKF_DESCRI AS NM_FILIALEST, SUM(X.VLTOTAL) AS VLTOTAL, SUM(X.QTCLI) AS QT_CLI, SUM(X.QTNF) AS QT_NF 				" + cEol
	cSql += " FROM "+ RetSqlName("AKF") + " FE, "+RetSqlName("AKF") + " FF, 																" + cEol
	cSql += " (SELECT SD.D2_DOC AS NR_NOTA, SF.F2_VEND1 AS CD_VEND, SF.F2_FILIAL AS CD_FILIALNF, C5.C5_XFILEST AS CD_FILIALEST, 			" + cEol
	cSql += " NVL((SELECT DISTINCT X5.X5_DESCRI FROM "+ RetSqlName("SX5")+ " X5, 															" + cEol
	cSql += " "+ RetSqlName("SA3")+ " A3A WHERE A3A.A3_COD = SF.F2_VEND1 AND X5.X5_TABELA = 'Z4' 											" + cEol
	cSql += " AND X5.D_E_L_E_T_ = ' ' AND X5.X5_CHAVE  = A3A.A3_XREGVEN),'INDUSTRIA') AS NM_REGIONAL, SUM(SD.D2_TOTAL) AS VLTOTAL, 			" + cEol
	cSql += " COUNT(DISTINCT(SF.F2_CLIENTE||SF.F2_LOJA)) AS QTCLI,COUNT(DISTINCT(SF.F2_DOC||SF.F2_SERIE)) AS QTNF       					" + cEol
	cSql += " FROM "+ RetSqlName("SD2")+ " SD, "+ RetSqlName("SF2")+ " SF, "+ RetSqlName("SA1") +" SA, "+ RetSqlName("SA3")+" A3,			" + cEol 
	cSql += " "+ RetSqlName("SF4") +" F4, "+ RetSqlName("SC5")+" C5  																		" + cEol
	cSql += " WHERE  SD.D2_EMISSAO BETWEEN '"+dTos(cGet1)+"' AND '"+dTos(cGet2)+"'															" + cEol
	cSql += "   AND SF.F2_FILIAL   = SD.D2_FILIAL AND SF.F2_DOC = SD.D2_DOC AND SF.F2_CLIENTE  = SD.D2_CLIENTE AND SF.F2_LOJA = SD.D2_LOJA 	" + cEol
	cSql += "   AND SF.F2_SERIE    = SD.D2_SERIE AND SF.F2_TIPO = 'N' AND SF.F2_SERIE    = '001'    										" + cEol
	cSql += "   AND F4.F4_FILIAL   = SD.D2_FILIAL AND F4.F4_CODIGO = SD.D2_TES AND F4.F4_DUPLIC   = 'S' 									" + cEol
	cSql += "   AND SA.A1_COD      = SF.F2_CLIENTE AND SA.A1_LOJA = SF.F2_LOJA    	 														" + cEol
	cSql += "   AND A3.A3_COD(+)   = SF.F2_VEND1 																							" + cEol
	cSql += "   AND C5.C5_NUM      = SD.D2_PEDIDO AND C5.C5_FILIAL = SD.D2_FILIAL 															" + cEol
	cSql += "   AND SD.D_E_L_E_T_  = ' ' AND SF.D_E_L_E_T_  = ' ' 																			" + cEol
	cSql += "   AND SA.A1_CGC NOT IN ( '52502507006269', '52502507006269', '52502507000309', '52502507006854','52502507001208', 			" + cEol
	cSql += "						   '52502507006692', '52502507000813', '26687598000122','52502507001895', '52502507001623', 			" + cEol
	cSql += "						   '52502507002271', '52502507001976', '52502507000147', '52502507001380',  							" + cEol
	cSql += "						   '26687598000203', '26687598000475', '26687598000394', '52502507000651' )   							" + cEol                                      
	cSql += " GROUP BY SD.D2_DOC, SF.F2_VEND1, SF.F2_FILIAL, C5.C5_XFILEST) X 																" + cEol
	cSql += " WHERE TRIM(FE.AKF_CODIGO) = NVL(TRIM(X.CD_FILIALEST),X.CD_FILIALNF) AND FF.AKF_CODIGO = X.CD_FILIALNF  						" + cEol
	if !empty(cGet4)
		cSql += " AND X.CD_FILIALNF = '"+AllTrim(cGet4)+"' 																					" + cEol
	endif
	if !empty(cGet3)
		cSql += " AND CD_FILIALEST = '"+AllTrim(cGet3)+"'																					" + cEol		
	endif
	cSql += " GROUP BY X.CD_FILIALNF, X.CD_FILIALEST, FF.AKF_DESCRI, FE.AKF_DESCRI 															" + cEol
	cSql += " ORDER BY VLTOTAL DESC   																										" + cEol

	MemoWrite("c:\temp\1.sql",cSql)
	
	cSql := ChangeQuery(cSql)

	If Select("TMP") > 0
		TMP->(DbCloseArea())
	EndIf  

	TcQuery cSql New Alias "TMP"

	cGet5 := 0

	TMP->(dBGotop())
	While !TMP->(EOF())

		cGet5 += TMP->VLTOTAL

		Aadd(aFieldFill, {TMP->NM_FILIALNF,TMP->NM_FILIALEST,TMP->VLTOTAL,TMP->QT_CLI,TMP->QT_NF,  .F.})
		TMP->(dbskip())

	endDo

	cGet5   := alltrim(transform(cGet5,"@E 9,999,999,999.99"))

	// se não tiver nenhum registro no select .
	if len(aFieldFill) == 0
		Aadd(aFieldFill, {TMP->NM_FILIALNF,TMP->NM_FILIALEST,TMP->VLTOTAL,TMP->QT_CLI,TMP->QT_NF,  .F. } )
	endif

	aColsEx   := aClone(aFieldFill)
	oMSNewGe1 := MsNewGetDados():New(  062, 008, 178, 419, GD_UPDATE, "AllwaysTrue", "AllwaysTrue", "+Field1+Field2", aAlterFields,, 999, "AllwaysTrue", "", "AllwaysTrue", oFolder1:aDialogs[1], aHeaderEx, aColsEx)
	oMSNewGe1:REFRESH()
	oGet5:REFRESH()

Return()

//------------------------------------------------ 
Static Function fMSNewGe2()
	//------------------------------------------------ 
	Local nX
	Local aHeaderEx := {}
	Local aColsEx := {}
	Local aFieldFill := {}
	Local aFields := {"A1_NOME","A2_NOME","A3_NOME","E1_VALOR"}
	Local aAlterFields := {}
	Static oMSNewGe2

	// Define field properties
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	For nX := 1 to Len(aFields)
		if aFields[nX] $ "A1_NOME"
			SX3->(DbSeek(aFields[nX]))
			Aadd(aHeaderEx, {"Filial Fat.",SX3->X3_CAMPO,SX3->X3_PICTURE,25,SX3->X3_DECIMAL,SX3->X3_VALID,;
			SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})

		elseif aFields[nX] = "A2_NOME"
			SX3->(DbSeek(aFields[nX]))
			Aadd(aHeaderEx, {"Filial Est.",SX3->X3_CAMPO,SX3->X3_PICTURE,25,SX3->X3_DECIMAL,SX3->X3_VALID,;
			SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})

		elseif aFields[nX] = "A3_NOME"
			SX3->(DbSeek(aFields[nX]))
			Aadd(aHeaderEx, {"Posição",SX3->X3_CAMPO,SX3->X3_PICTURE,15,SX3->X3_DECIMAL,SX3->X3_VALID,;
			SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})

		elseif aFields[nX] = "E1_VALOR"
			SX3->(DbSeek(aFields[nX]))
			Aadd(aHeaderEx, {"Vlr.Total",SX3->X3_CAMPO,SX3->X3_PICTURE,10,SX3->X3_DECIMAL,SX3->X3_VALID,;
			SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})
		endif
	Next nX

	cSql2 := " SELECT CD_FILIALEST,CODFILNF,X.NM_FILIALNF, X.NM_FILIALEST, DECODE(X.EM_CARGA,'EM CARGA',X.EM_CARGA,X.STATUS) AS STATUS, SUM(X.C6_VALOR) AS VLTOTAL  FROM ( " + cEol   
	cSql2 += " SELECT DISTINCT C5_FILIAL AS CODFILNF, FF.AKF_DESCRI AS NM_FILIALNF, C5_NUM, C5_XPVSGAC, B1_COD, B1_DESC, C6_LOCAL, A1_COD, A1_LOJA, A1_NOME,	 " + cEol
	cSql2 += " C6_QTDVEN, C6_VALOR, C5_XFILEST, NVL(TRIM(C5_XFILEST),C5_FILIAL) AS CD_FILIALEST, FE.AKF_DESCRI AS NM_FILIALEST, C5_XFILINT,			 " + cEol
	cSql2 += " DECODE(TRIM(C9_CARGA),NULL,'','EM CARGA') AS EM_CARGA, CASE WHEN C9_BLEST <> '10' AND C9_BLCRED <> '09' AND C9_BLCRED = ' '			 " + cEol
	cSql2 += " AND C9_BLEST <> ' ' THEN 'EXPEDICAO' WHEN C9_BLCRED = '09' THEN 'REJEITADO' WHEN C9_BLCRED <> ' ' AND C9_BLCRED <> '10'				 " + cEol
	cSql2 += " AND C9_BLCRED <> '09' THEN 'CREDITO' WHEN C9_BLCRED = ' ' AND C9_BLEST = ' ' THEN 'LIBERADO' ELSE 'ABERTO' END AS STATUS				 " + cEol
	cSql2 += " FROM "+RetSqlName("SC6")+ " 																											 " + cEol
	cSql2 += " LEFT JOIN SC9010 ON SC9010.D_E_L_E_T_ <> '*' AND C9_PEDIDO  = C6_NUM AND C6_FILIAL  = C9_FILIAL AND C6_PRODUTO = C9_PRODUTO			 " + cEol
	cSql2 += " AND C6_ITEM = C9_ITEM AND C6_LOCAL = C9_LOCAL AND C6_NOTA = C9_NFISCAL																 " + cEol
	cSql2 += " LEFT JOIN "+RetSqlName("SC5") + " 	ON  SC5010.D_E_L_E_T_ <> '*' AND C5_NUM = C6_NUM AND C5_FILIAL = C6_FILIAL						 " + cEol
	cSql2 += " LEFT JOIN "+RetSqlName("AKF") + " FE 	ON  TRIM(FE.AKF_CODIGO) = NVL(TRIM(C5_XFILEST),C5_FILIAL)									 " + cEol
	cSql2 += " LEFT JOIN "+RetSqlName("AKF") + " FF 	ON  FF.AKF_CODIGO = C5_FILIAL																 " + cEol
	cSql2 += " LEFT JOIN "+RetSqlName("SB1") + "    	ON  SB1010.D_E_L_E_T_ <> '*' AND B1_COD = C6_PRODUTO										 " + cEol
	cSql2 += " LEFT JOIN "+RetSqlName("SA1") + " 	ON  SA1010.D_E_L_E_T_ <> '*' AND A1_COD = C6_CLI AND A1_LOJA = C6_LOJA							 " + cEol
	cSql2 += " LEFT JOIN "+RetSqlName("SF4") + " 	ON  SF4010.D_E_L_E_T_ <> '*'AND F4_CODIGO = C6_TES  AND F4_FILIAL = C6_FILIAL					 " + cEol
	cSql2 += " WHERE SC6010.D_E_L_E_T_ <> '*'AND C9_NFISCAL = ' ' AND F4_DUPLIC = 'S'																 " + cEol
	cSql2 += " AND A1_CGC NOT IN ( '52502507006269', '52502507006269', '52502507000309', '52502507006854', '52502507001208', 						 " + cEol
	cSql2 += " 					  '52502507006692', '52502507000813', '26687598000122', '52502507001895', '52502507001623', 						 " + cEol
	cSql2 += "     				  '52502507002271', '52502507001976', '52502507000147', '52502507001380', 											 " + cEol
	cSql2 += " 					  '26687598000203', '26687598000475', '26687598000394', '52502507000651' ) ) X										 " + cEol
	cSql2 += " WHERE 1=1																															 " + cEol
	
	if !empty(cGet4)
		cSql2 += " AND CODFILNF = '"+AllTrim(cGet4)+"' 																								 " + cEol
	endif
	if !empty(cGet3)
		cSql2 += " AND CD_FILIALEST = '"+AllTrim(cGet3)+"'																							 " + cEol		
	endif
	
	cSql2 += "  GROUP BY X.NM_FILIALNF, X.NM_FILIALEST, DECODE(X.EM_CARGA,'EM CARGA',X.EM_CARGA,X.STATUS),CD_FILIALEST,CODFILNF						 " + cEol

	MemoWrite("c:\temp\2.sql",cSql2)

	cSql2 := ChangeQuery(cSql2)

	If Select("TMP2") > 0
		TMP2->(DbCloseArea())
	EndIf  

	TcQuery cSql2 New Alias "TMP2"

	cGet6  := 0
	cSatus := ""
	lTodas := .F.

	if !lCheckBo2 .AND. !lCheckBo3 .AND. !lCheckBo4 .AND. !lCheckBo5 .AND. !lCheckBo6  .AND. !lCheckBo7

		lTodas := .T.

	else

		cSatus := iif(lCheckBo2,"CREDITO;","")
		cSatus += iif(lCheckBo3,"LIBERADO;","")
		cSatus += iif(lCheckBo4,"REJEITADO;","")
		cSatus += iif(lCheckBo5,"EM CARGA;","")
		cSatus += iif(lCheckBo6,"EXPEDICAO;","")
		cSatus += iif(lCheckBo7,"ABERTO;","")

		cSatus := Upper(AllTrim(cSatus))

	endif

	if lTodas

		TMP2->(dBGotop())
		While !TMP2->(EOF())

			cGet6 += TMP2->VLTOTAL

			Aadd(aFieldFill, {TMP2->NM_FILIALNF,TMP2->NM_FILIALEST,TMP2->STATUS,TMP2->VLTOTAL,  .F.})

			TMP2->(dbskip())

		endDo

	else 

		TMP2->(dBGotop())
		While !TMP2->(EOF())

			if AllTrim(Upper(TMP2->STATUS))$cSatus

				cGet6 += TMP2->VLTOTAL

				Aadd(aFieldFill, {TMP2->NM_FILIALNF,TMP2->NM_FILIALEST,TMP2->STATUS,TMP2->VLTOTAL,  .F.})

			endif

			TMP2->(dbskip())

		endDo


	endif



	cGet6   := alltrim(transform(cGet6,"@E 9,999,999,999.99"))

	// se não tiver nenhum registro no select .
	if len(aFieldFill) == 0
		Aadd(aFieldFill, {TMP2->NM_FILIALNF,TMP2->NM_FILIALEST,TMP2->STATUS,TMP2->VLTOTAL,  .F. } )
	endif

	aColsEx   := aClone(aFieldFill)
	oMSNewGe2 := MsNewGetDados():New( 061, 009, 177, 419, GD_UPDATE, "AllwaysTrue", "AllwaysTrue", "+Field1+Field2", aAlterFields,, 999, "AllwaysTrue", "", "AllwaysTrue", oFolder1:aDialogs[2], aHeaderEx, aColsEx)
	oMSNewGe2:REFRESH()
	oGet6:REFRESH()

Return()

//------------------------------------------------ 
Static Function funAgrupa()
	//------------------------------------------------ 
	Local nX
	Local aHeaderEx := {}
	Local aColsEx := {}
	Local aFieldFill := {}
	Local aFields := {"A2_NOME","E1_VALOR"}
	Local aAlterFields := {}
	Static oMSNewGe2

	// Define field properties
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	For nX := 1 to Len(aFields)

		if aFields[nX] = "A2_NOME"
			SX3->(DbSeek(aFields[nX]))
			Aadd(aHeaderEx, {"Posição",SX3->X3_CAMPO,SX3->X3_PICTURE,10,SX3->X3_DECIMAL,SX3->X3_VALID,;
			SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})


		elseif aFields[nX] = "E1_VALOR"
			SX3->(DbSeek(aFields[nX]))
			Aadd(aHeaderEx, {"Vlr.Total",SX3->X3_CAMPO,SX3->X3_PICTURE,10,SX3->X3_DECIMAL,SX3->X3_VALID,;
			SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})
		endif
	Next nX

	cSql3 := " SELECT DECODE(X.EM_CARGA,'EM CARGA',X.EM_CARGA,X.STATUS) AS STATUS,SUM(X.C6_VALOR) AS VLTOTAL 					" + cEol 
	cSql3 += " FROM (SELECT DISTINCT C5_FILIAL, FF.AKF_DESCRI AS NM_FILIALNF, C5_NUM,C5_XPVSGAC,B1_COD,B1_DESC, 				" + cEol 
	cSql3 += " C6_LOCAL,A1_COD,A1_LOJA,A1_NOME,C6_QTDVEN,C6_VALOR,C5_XFILEST,nvl(trim(C5_XFILEST),C5_FILIAL) as cd_filialest, 	" + cEol 
	cSql3 += " fe.akf_descri as nm_filialest,C5_XFILINT,DECODE(TRIM(C9_CARGA),NULL,'','EM CARGA') AS EM_CARGA,					" + cEol 
	cSql3 += " CASE WHEN C9_BLEST <> '10' AND C9_BLCRED <> '09' AND C9_BLCRED = ' ' AND C9_BLEST <> ' ' THEN 'EXPEDICAO'		" + cEol 
	cSql3 += " WHEN C9_BLCRED = '09' THEN 'REJEITADO' WHEN C9_BLCRED <> ' ' AND C9_BLCRED <> '10' AND C9_BLCRED <> '09' 		" + cEol 
	cSql3 += " THEN 'CREDITO' WHEN C9_BLCRED = ' ' AND C9_BLEST = ' ' THEN 'LIBERADO' ELSE 'ABERTO' END AS STATUS				" + cEol 
	cSql3 += " FROM "+RetSqlName("SC6") + " 																					" + cEol 
	cSql3 += " LEFT JOIN SC9010 ON SC9010.D_E_L_E_T_ <> '*' AND C9_PEDIDO  = C6_NUM AND C6_FILIAL  = C9_FILIAL					" + cEol 
	cSql3 += " AND C6_PRODUTO = C9_PRODUTO AND C6_ITEM    = C9_ITEM AND C6_LOCAL   = C9_LOCAL AND C6_NOTA    = C9_NFISCAL		" + cEol 
	cSql3 += " LEFT JOIN "+RetSqlName("SC5") + "  ON SC5010.D_E_L_E_T_ <> '*' AND C5_NUM    = C6_NUM AND C5_FILIAL = C6_FILIAL	" + cEol 
	cSql3 += " LEFT JOIN "+RetSqlName("AKF") + " FE ON TRIM(FE.AKF_CODIGO) = nvl(trim(C5_XFILEST),C5_FILIAL)					" + cEol 
	cSql3 += " LEFT JOIN "+RetSqlName("AKF") + " FF ON FF.AKF_CODIGO = C5_FILIAL												" + cEol 
	cSql3 += " LEFT JOIN "+RetSqlName("SB1") + " ON  SB1010.D_E_L_E_T_ <> '*'AND B1_COD = C6_PRODUTO							" + cEol 
	cSql3 += " LEFT JOIN "+RetSqlName("SA1") + "  ON  SA1010.D_E_L_E_T_ <> '*' AND A1_COD = C6_CLI AND A1_LOJA = C6_LOJA		" + cEol 
	cSql3 += " LEFT JOIN "+RetSqlName("SF4") + "  ON SF4010.D_E_L_E_T_ <> '*' AND F4_CODIGO = C6_TES  AND F4_FILIAL = C6_FILIAL	" + cEol 
	cSql3 += " WHERE SC6010.D_E_L_E_T_ <> '*' AND C9_NFISCAL = ' ' AND F4_DUPLIC = 'S'											" + cEol 
	cSql3 += " AND A1_CGC NOT IN ( '52502507006269', '52502507006269', '52502507000309', '52502507006854', 						" + cEol 
	cSql3 += "                            '52502507001208', '52502507006692', '52502507000813', 								" + cEol 
	cSql3 += "                                '26687598000122','52502507001895', '52502507001623', '52502507002271', 			" + cEol 
	cSql3 += "                                '52502507001976', '52502507000147', '52502507001380', '26687598000203', 			" + cEol 
	cSql3 += "                                '26687598000475', '26687598000394', '52502507000651' ) 							" + cEol 
	cSql3 += " ) X																												" + cEol 
	cSql3 += " WHERE 1=1  
	
	if !empty(cGet4)
		cSql3 += " AND C5_XFILEST = '"+AllTrim(cGet4)+"' 																		" + cEol
	endif
	if !empty(cGet3)
		cSql3 += " AND C5_FILIAL = '"+AllTrim(cGet3)+"'																		    " + cEol		
	endif
	
	cSql3 += " GROUP BY DECODE(X.EM_CARGA,'EM CARGA',X.EM_CARGA,X.STATUS)														" + cEol 

	MemoWrite("c:\temp\3.sql",cSql3)
	
	cSql3 := ChangeQuery(cSql3)

	If Select("TMP3") > 0
		TMP3->(DbCloseArea())
	EndIf  

	TcQuery cSql3 New Alias "TMP3"

	cGet6 := 0

	TMP2->(dBGotop())
	While !TMP3->(EOF())

		cGet6 += TMP3->VLTOTAL

		Aadd(aFieldFill, {TMP3->STATUS,TMP3->VLTOTAL,  .F.})
		TMP3->(dbskip())

	endDo

	cGet6   := alltrim(transform(cGet6,"@E 9,999,999,999.99"))

	// se não tiver nenhum registro no select .
	if len(aFieldFill) == 0
		Aadd(aFieldFill, {TMP3->STATUS,TMP3->VLTOTAL,  .F. } )
	endif

	aColsEx   := aClone(aFieldFill)
	oMSNewGe2 := MsNewGetDados():New( 061, 009, 177, 419, GD_UPDATE, "AllwaysTrue", "AllwaysTrue", "+Field1+Field2", aAlterFields,, 999, "AllwaysTrue", "", "AllwaysTrue", oFolder1:aDialogs[2], aHeaderEx, aColsEx)
	oMSNewGe2:REFRESH()
	oGet6:REFRESH()

Return()