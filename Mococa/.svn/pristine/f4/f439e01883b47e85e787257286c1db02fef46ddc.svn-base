#include 'protheus.ch'
#INCLUDE 'ap5mail.ch'

User Function ROMSR003()
	
	RunProc('0103')

Return

Static Function RunProc(c_Fil)
	Local c_Qry := ""
	Local lImpar := .T.
	Local c_TpPed := ""
	Local c_BlqCrd := ""
	Local c_BlqEst := ""
	Local n_T01 := 0
	Local n_T02 := 0
	Local n_T03 := 0

	Local n_TD01 := 0
	Local n_TD02 := 0
	Local n_TD03 := 0

	Local n_TV01 := 0
	Local n_TV02 := 0
	Local n_TV03 := 0

	Local d_DtEn := CtoD("//")
	Local n_DSm := 0
	Local c_DSm := ""

	Local c_Vend := ""



	local nHandle
	Local cEmail := ""
	
	

	Private cHtm := ""
	Private cHtm01 := ""

	//If Select("SX2")=0
		RPCCLEARENV()
		RPCSetType(3)
		RPCSetEnv("01",c_Fil,"","","","",{})
	//EndIf
	
	cEmail  := GetMV("MV_XEMPED")  
	//'estevao.tavares@mococa.com.br;marcos.godinho@mococa.com.br;marina.ferreira@mococa.com.br;jose.vasques@totvs.com.br'
	

	c_Qry := "SELECT ZONA,SETOR,REF,C5_FILIAL,SUM(VALOR) AS VALOR,SUM(PESO) AS PESO,C6_ENTREG,C9_CARGA "
	c_Qry += "FROM ( "
	c_Qry += "SELECT "
	c_Qry += "NVL((SELECT DA7_PERCUR FROM DA7010 WHERE DA7010.D_E_L_E_T_ = ' ' AND DA7_FILIAL = '"+ xFilial("DA7") +"' AND A1_CEP BETWEEN DA7_CEPDE AND DA7_CEPATE),'N/I') AS ZONA, "
	c_Qry += "NVL((SELECT DA7_ROTA   FROM DA7010 WHERE DA7010.D_E_L_E_T_ = ' ' AND DA7_FILIAL = '"+ xFilial("DA7") +"' AND A1_CEP BETWEEN DA7_CEPDE AND DA7_CEPATE),'N/I') AS SETOR, "
	c_Qry += "NVL((SELECT DA7_REF    FROM DA7010 WHERE DA7010.D_E_L_E_T_ = ' ' AND DA7_FILIAL = '"+ xFilial("DA7") +"' AND A1_CEP BETWEEN DA7_CEPDE AND DA7_CEPATE),'N/I') AS REF, "
	c_Qry += "C5_FILIAL,A1_CEP, SUM(B.C6_VALOR) AS VALOR, SUM(B.C6_QTDVEN * B1_PESBRU) AS PESO, C6_ENTREG, NVL(C9_CARGA,' ') AS C9_CARGA " 
	c_Qry += "FROM SC5010 A, SB1010 D, SA1010 E, " 
	c_Qry += "SC6010 B LEFT JOIN SC9010 ON SC9010.D_E_L_E_T_ = ' ' AND C9_FILIAL = C6_FILIAL AND C9_PEDIDO = C6_NUM AND C9_ITEM = C6_ITEM AND C9_PRODUTO = C6_PRODUTO "
	c_Qry += "WHERE A.D_E_L_E_T_ = ' ' AND B.D_E_L_E_T_ = ' ' AND D.D_E_L_E_T_ = ' '  AND E.D_E_L_E_T_ = ' ' "
	c_Qry += "AND C5_FILIAL = C6_FILIAL "
	c_Qry += "AND B1_FILIAL = '"+ xFilial('SB1') +"' "
	c_Qry += "AND A1_FILIAL = '"+ xFilial('SA1') +"' "
	c_Qry += "AND A1_COD = C5_CLIENTE "
	c_Qry += "AND A1_LOJA = C5_LOJACLI "
	c_Qry += "AND C5_NUM = C6_NUM "
	c_Qry += "AND B1_COD = C6_PRODUTO "
	c_Qry += "AND C5_TIPO = 'N' "
	c_Qry += "AND C5_LIBEROK = 'S' "
	c_Qry += "AND C6_NOTA = ' ' "
	c_Qry += "AND C6_BLQ <> 'R' "
	c_Qry += "GROUP BY C5_FILIAL,C6_ENTREG,A1_CEP,NVL(C9_CARGA,' ') "
	c_Qry += "ORDER BY C5_FILIAL,C6_ENTREG,A1_CEP,NVL(C9_CARGA,' ')) X "
	c_Qry += "GROUP BY C5_FILIAL,C6_ENTREG,ZONA,SETOR,REF,C9_CARGA "
	c_Qry += "ORDER BY C5_FILIAL,C6_ENTREG,ZONA,SETOR,REF,C9_CARGA "

	PlsQuery(c_Qry,"_C5")

	If !Eof()
		U_HTMICOR2(@cHtm)

		U_HTMITAB2(@cHtm,0,2,0)
		U_HtmLinTTit(@cHtm,{'Mococa', 'TOTVS'}, '788EA7', 'FFFFFF', 4)
		U_HtmLinTTit(@cHtm,{'Pedidos Abertos '+ DtoC(Date()) +" - " + Time(), 'by Totvs Protheus'}, 'CCCCCC', '000000', -5)
		U_HTMFTAB2(@cHtm)
		U_HTMLINE(@cHtm,2)

		lImpar:= .t.

		U_HTMITAB2(@cHtm,0,2,0)
		U_HTMLTAB2(@cHtm,{'Resumo de Pedido por Filial'  }, '000000', 'FFFFFF', -1)
		U_HTMFTAB2(@cHtm)
		U_HTMITAB2(@cHtm,1,2,0)
		U_HTMLTAB2(@cHtm,{'Filial', 'Zona+Setor+Ref.', 'Qtd Ped', 'Valor', 'Peso','Dt. Entrega'}, '000000', 'FFFFFF', -1)

		DbSelectArea("_C5")
		DbGoTop()


		n_T01 := 0
		n_T02 := 0
		n_T03 := 0

		n_TD01 := 0
		n_TD02 := 0
		n_TD03 := 0

		n_TV01 := 0
		n_TV02 := 0
		n_TV03 := 0

		While !Eof()

			d_DtEn := _C5->C6_ENTREG

			c_Qry := "SELECT COUNT(1) AS QPD "
			c_Qry += "FROM SC5010 A, SA1010 B "
			c_Qry += "WHERE A.D_E_L_E_T_ = ' ' AND B.D_E_L_E_T_ = ' '  "
			c_Qry += "AND A1_FILIAL = '"+ xFilial('SA1') +"' "
			c_Qry += "AND A1_COD = C5_CLIENTE "
			c_Qry += "AND A1_LOJA = C5_LOJACLI "
			c_Qry += "AND RTRIM(NVL((SELECT DA7_PERCUR FROM DA7010 WHERE DA7010.D_E_L_E_T_ = ' ' AND DA7_FILIAL = '"+ xFilial("DA7") +"' AND A1_CEP BETWEEN DA7_CEPDE AND DA7_CEPATE),'N/I')) = '"+ ALLTRIM(_C5->ZONA) +"' "
			c_Qry += "AND RTRIM(NVL((SELECT DA7_ROTA   FROM DA7010 WHERE DA7010.D_E_L_E_T_ = ' ' AND DA7_FILIAL = '"+ xFilial("DA7") +"' AND A1_CEP BETWEEN DA7_CEPDE AND DA7_CEPATE),'N/I')) = '"+ ALLTRIM(_C5->SETOR) +"' "
			c_Qry += "AND RTRIM(NVL((SELECT DA7_REF    FROM DA7010 WHERE DA7010.D_E_L_E_T_ = ' ' AND DA7_FILIAL = '"+ xFilial("DA7") +"' AND A1_CEP BETWEEN DA7_CEPDE AND DA7_CEPATE),'N/I')) = '"+ ALLTRIM(_C5->REF) +"' "
			//c_Qry += "AND A1_CEP = '"+ _C5->A1_CEP +"' "
			//c_Qry += "AND C5_EMISSAO = '"+ DtoS(Date()) +"' "
			c_Qry += "AND C5_FILIAL = '"+ _C5->C5_FILIAL +"' "
			c_Qry += "AND C5_TIPO = 'N' "
			c_Qry += "AND C5_LIBEROK = 'S' "
			c_Qry += "AND C5_NUM IN ( "
			c_Qry += "SELECT C6_NUM FROM "
			c_Qry += "SC6010 INNER JOIN SC9010 ON SC9010.D_E_L_E_T_ = ' ' AND C9_FILIAL = C6_FILIAL AND C9_PEDIDO = C6_NUM AND C9_ITEM = C6_ITEM AND C9_PRODUTO = C6_PRODUTO " 
			c_Qry += "WHERE SC6010.D_E_L_E_T_ = ' ' " 
			c_Qry += "AND C6_FILIAL = C5_FILIAL " 
			c_Qry += "AND C6_NUM = C5_NUM " 
			c_Qry += "AND C6_NOTA = ' ' "
			c_Qry += "AND C9_CARGA = '" + _C5->C9_CARGA + "' "  
			c_Qry += "AND C6_BLQ <> 'R' " 
			c_Qry += "AND C6_ENTREG = '"+ DtoS(_C5->C6_ENTREG) +"' "
			c_Qry += "GROUP BY C6_NUM)"

			PlsQuery(c_Qry,"_Q01")

			If c_Vend <> _C5->C5_FILIAL

				U_HTMLTAB2(@cHtm, {_C5->C5_FILIAL,;
				_C5->(ZONA +' - '+ SETOR + ' - '+ REF) + IIF(_C5->C9_CARGA = ' ','','-(' + _C5->C9_CARGA + ')'),;
				StrZero(_Q01->QPD,3),;
				Transform(_C5->VALOR,"@E 999,999,999.99"),;
				Transform(_C5->PESO,"@E 999,999,999.99"),;
				DtoC(_C5->C6_ENTREG)}, IIF(_C5->C9_CARGA = ' ',IIF(lImpar, 'DDDDDD', 'CCCCCC'),'F5A9A9'), NIL, -2)
				lImpar:= !lImpar
				c_Vend := _C5->C5_FILIAL
			Else
				U_HTMLTAB2(@cHtm, {"",;
				_C5->(ZONA +' - '+ SETOR + ' - '+ REF) + IIF(_C5->C9_CARGA = ' ','','-(' + _C5->C9_CARGA + ')'),;
				StrZero(_Q01->QPD,3),;
				Transform(_C5->VALOR,"@E 999,999,999.99"),;
				Transform(_C5->PESO,"@E 999,999,999.99"),;
				DtoC(_C5->C6_ENTREG)}, IIF(_C5->C9_CARGA = ' ',IIF(lImpar, 'DDDDDD', 'CCCCCC'),'F5A9A9'), NIL, -2)
				lImpar:= !lImpar
			Endif

			n_T01 += _Q01->QPD
			n_T02 += _C5->VALOR
			n_T03 += _C5->PESO

			n_TD01 += _Q01->QPD
			n_TD02 += _C5->VALOR
			n_TD03 += _C5->PESO

			n_TV01 += _Q01->QPD
			n_TV02 += _C5->VALOR
			n_TV03 += _C5->PESO

			_Q01->(DbCloseArea())
			DbSelectArea("_C5")
			DbSkip()

			If d_DtEn <> _C5->C6_ENTREG
				U_HTMLTAB2(@cHtm, {"Total " + DtoC(d_DtEn),;
				"",;
				StrZero(n_TD01,5),;
				Transform(n_TD02,"@E 999,999,999.99"),;
				Transform(n_TD03,"@E 999,999,999.99"),;
				" "}, 'FFFFFF', NIL, -2)

				n_TD01 := 0
				n_TD02 := 0
				n_TD03 := 0

			Endif


			If c_Vend <> _C5->C5_FILIAL

				U_HTMLTAB2(@cHtm, {"",;
				"Total Filial:",;
				StrZero(n_TV01,5),;
				Transform(n_TV02,"@E 999,999,999.99"),;
				Transform(n_TV03,"@E 999,999,999.99"),;
				" "}, IIF(lImpar, 'DDDDDD', 'CCCCCC'), NIL, -2)

				U_HTMLTAB2(@cHtm, {" ",;
				" ",;
				" ",;
				" ",;
				" ",;
				" "}, 'FFFFFF', NIL, -2)

				n_TV01 := 0
				n_TV02 := 0
				n_TV03 := 0

			Endif


		EndDo

		U_HTMLTAB2(@cHtm, {"Total",;
		"",;
		StrZero(n_T01,5),;
		Transform(n_T02,"@E 999,999,999.99"),;
		Transform(n_T03,"@E 999,999,999.99"),;
		" "}, 'FFFFFF', NIL, -2)

		_C5->(DbCloseArea())

		U_HTMFTAB2(@cHtm)
		U_HTMLINE(@cHtm,1)

		//Resumo por Grupo
//		lImpar:= .t.
//
//
//
//		c_Qry := "SELECT C6_FILIAL,BM_DESC, SUM(C6_QTDVEN) AS QTD, SUM(C6_VALOR) AS VALOR, SUM(C6_QTDVEN * B1_PESBRU) AS PESO, C6_ENTREG "
//		c_Qry += "FROM SC6010 A, SC5010 B, SBM010 C, SB1010 D "
//		c_Qry += "WHERE A.D_E_L_E_T_ = ' ' AND B.D_E_L_E_T_ = ' ' AND C.D_E_L_E_T_ = ' ' AND D.D_E_L_E_T_ = ' ' "
//		c_Qry += "AND C5_FILIAL = C6_FILIAL "
//		c_Qry += "AND BM_FILIAL = '"+ xFilial("SBM") +"' "
//		c_Qry += "AND B1_FILIAL = '"+ xFilial("SB1") +"' "
//		c_Qry += "AND C5_NUM = C6_NUM "
//		c_Qry += "AND B1_COD = C6_PRODUTO "
//		c_Qry += "AND BM_GRUPO = B1_GRUPO "
//		c_Qry += "AND C5_TIPO = 'N' "
//		//c_Qry += "AND C5_EMISSAO = '"+ DtoS(Date()) +"' "
//		c_Qry += "AND C6_NOTA = ' ' "
//		c_Qry += "AND C6_BLQ <> 'R' "
//
//		c_Qry += "GROUP BY C6_FILIAL,BM_DESC, C6_ENTREG "
//		c_Qry += "ORDER BY C6_FILIAL,C6_ENTREG,BM_DESC"
//
//
//		PlsQuery(c_Qry,"_Q01")
//
//		If ! Eof()
//
//			U_HTMITAB2(@cHtm,0,2,0)
//			U_HTMLTAB2(@cHtm,{'Resumo de Pedido por Grupo'  }, '000000', 'FFFFFF', -1)
//			U_HTMFTAB2(@cHtm)
//			U_HTMITAB2(@cHtm,1,2,0)
//			U_HTMLTAB2(@cHtm,{'Filial','Grupo', 'Qtd Produto', 'Valor', 'Peso', 'Dt. Entrega'}, '000000', 'FFFFFF', -1)
//
//			n_TD01 := 0
//			n_TD02 := 0
//			n_TD03 := 0
//
//			While !Eof()
//				d_DtEn := _Q01->C6_ENTREG
//
//
//				U_HTMLTAB2(@cHtm, {_Q01->C6_FILIAL,_Q01->BM_DESC,;
//				StrZero(_Q01->QTD,6),;
//				Transform(_Q01->VALOR,"@E 999,999,999.99"),;
//				Transform(_Q01->PESO,"@E 999,999,999.99"),;
//				DtoC(_Q01->C6_ENTREG)}, IIF(lImpar, 'DDDDDD', 'CCCCCC'), NIL, -2)
//				lImpar:= !lImpar
//
//				n_TD01 += _Q01->QTD
//				n_TD02 += _Q01->VALOR
//				n_TD03 += _Q01->PESO
//
//
//				DbSelectArea("_Q01")
//				DbSkip()
//
//				If d_DtEn <> _Q01->C6_ENTREG
//					U_HTMLTAB2(@cHtm, {"Total " + DtoC(d_DtEn),;
//					StrZero(n_TD01,6),;
//					Transform(n_TD02,"@E 999,999,999.99"),;
//					Transform(n_TD03,"@E 999,999,999.99"),;
//					" "}, 'FFFFFF', NIL, -2)
//
//					n_TD01 := 0
//					n_TD02 := 0
//					n_TD03 := 0
//
//
//				Endif
//
//			EndDo
//		EndIf
//		_Q01->(DbCloseArea())
//		U_HTMFTAB2(@cHtm)
//		U_HTMLINE(@cHtm,1)






		//Pedidos com Observações
		lImpar:= .t.



		c_Qry := "SELECT C5_FILIAL,C5_NUM, A3_NOME, A1_NOME "
		c_Qry += "FROM SC5010 B, SA1010 E, SA3010 F "
		c_Qry += "WHERE B.D_E_L_E_T_ = ' ' AND E.D_E_L_E_T_ = ' ' AND F.D_E_L_E_T_ = ' ' "
		c_Qry += "AND A1_FILIAL = '"+ xFilial("SA1") +"' "
		c_Qry += "AND A3_FILIAL = '"+ xFilial("SA3") +"' "
		c_Qry += "AND A1_COD = C5_CLIENTE "
		c_Qry += "AND A1_LOJA = C5_LOJACLI "
		c_Qry += "AND A3_COD = C5_VEND1 "
		//c_Qry += "AND C5_EMISSAO = '"+ DtoS(Date()) +"' "
		c_Qry += "AND C5_NOTA = ' ' "
		c_Qry += "AND C5_XOBSPV IS NOT NULL "
		c_Qry += "AND C5_TIPO = 'N' "
		c_Qry += "ORDER BY C5_NUM, A3_NOME, A1_NOME "


		PlsQuery(c_Qry,"_Q01")

		If ! Eof()

			U_HTMITAB2(@cHtm,0,2,0)
			U_HTMLTAB2(@cHtm,{'Pedidos com Observações'  }, '000000', 'FFFFFF', -1)
			U_HTMFTAB2(@cHtm)
			U_HTMITAB2(@cHtm,1,2,0)
			U_HTMLTAB2(@cHtm,{'Pedido', 'Vendedor', 'Cliente','Observação'}, '000000', 'FFFFFF', -1)

			While !Eof()
				DbSelectArea("SC5")
				DbSetOrder(1)
				DbSeek(_Q01->C5_FILIAL + _Q01->C5_NUM)



				U_HTMLTAB2(@cHtm, {_Q01->C5_NUM,;
				_Q01->A3_NOME,;
				_Q01->A1_NOME,;
				SC5->C5_XOBSPV}, IIF(lImpar, 'DDDDDD', 'CCCCCC'), NIL, -2)
				lImpar:= !lImpar


				DbSelectArea("_Q01")
				DbSkip()
			EndDo

			U_HTMFTAB2(@cHtm)
			U_HTMLINE(@cHtm,1)
		EndIf
		_Q01->(DbCloseArea())





		//Pedidos Pendentes de Liberação
		lImpar:= .t.



		c_Qry := "SELECT C5_FILIAL, B1_DESC, SUM(C6_QTDVEN * B1_PESBRU) AS PESO "
		c_Qry += "FROM SC6010 A, SC5010 B, SB1010 D, SA1010 E, SA3010 F "
		c_Qry += "WHERE A.D_E_L_E_T_ = ' ' AND B.D_E_L_E_T_ = ' ' AND D.D_E_L_E_T_ = ' ' AND E.D_E_L_E_T_ = ' ' AND F.D_E_L_E_T_ = ' ' "
		c_Qry += "AND C5_FILIAL = C6_FILIAL "
		c_Qry += "AND B1_FILIAL = '"+ xFilial("SB1") +"' "
		c_Qry += "AND A1_FILIAL = '"+ xFilial("SA1") +"' "
		c_Qry += "AND A3_FILIAL = '"+ xFilial("SA3") +"' "
		c_Qry += "AND C5_NUM = C6_NUM "
		c_Qry += "AND B1_COD = C6_PRODUTO "
		c_Qry += "AND A1_COD = C5_CLIENTE "
		c_Qry += "AND A1_LOJA = C5_LOJACLI "
		c_Qry += "AND A3_COD = C5_VEND1 "
		//c_Qry += "AND C5_EMISSAO = '"+ DtoS(Date()) +"' "
		c_Qry += "AND C6_NOTA = ' ' "
		c_Qry += "AND C6_BLQ <> 'R' "

		c_Qry += "AND C5_TIPO = 'N' "
		c_Qry += "AND NOT EXISTS ("
		c_Qry += "SELECT * FROM SC9010 "
		c_Qry += "WHERE SC9010.D_E_L_E_T_ = ' ' "
		c_Qry += "AND C9_FILIAL = C5_FILIAL "
		c_Qry += "AND C6_NUM = C9_PEDIDO "
		c_Qry += "AND C6_PRODUTO = C6_PRODUTO "
		c_Qry += "AND C6_ITEM = C9_ITEM "
		c_Qry += "AND C9_NFISCAL = ' '"
		c_Qry += ") "
		c_Qry += "GROUP BY C5_FILIAL,B1_DESC "
		c_Qry += "ORDER BY C5_FILIAL,B1_DESC "


		PlsQuery(c_Qry,"_Q01")

		If ! Eof()
			U_HTMITAB2(@cHtm,0,2,0)
			U_HTMLTAB2(@cHtm,{'Pedidos Pendentes de Liberação'  }, '000000', 'FFFFFF', -1)
			U_HTMFTAB2(@cHtm)
			U_HTMITAB2(@cHtm,1,2,0)
			U_HTMLTAB2(@cHtm,{'Filial','Produto','Peso'}, '000000', 'FFFFFF', -1)

			While !Eof()


				U_HTMLTAB2(@cHtm, {_Q01->C5_FILIAL,;
				_Q01->B1_DESC,;
				Transform(_Q01->PESO,"@E 999,999,999.99")}, IIF(lImpar, 'DDDDDD', 'CCCCCC'), NIL, -2)
				lImpar:= !lImpar


				DbSelectArea("_Q01")
				DbSkip()
			EndDo
		Endif

		_Q01->(DbCloseArea())


		U_HTMFTAB2(@cHtm)
		U_HTMLINE(@cHtm,1)

		cHtm01 := cHtm
		cHtm := ""



		//Clientes sem ROTA
		lImpar:= .t.



		c_Qry := "SELECT C5_FILIAL,A1_COD,A1_LOJA,A1_NOME,A1_MUN, A1_CEP "
		c_Qry += "FROM SC5010 A, SA1010 B, SC6010 D "
		c_Qry += "WHERE A.D_E_L_E_T_ = ' ' AND B.D_E_L_E_T_ = ' ' AND D.D_E_L_E_T_ = ' ' "
		c_Qry += "AND A.C5_FILIAL =  D.C6_FILIAL "
		c_Qry += "AND B.A1_FILIAL = '"+ xFilial("SA1") +"' "
		c_Qry += "AND A.C5_CLIENTE = B.A1_COD "
		c_Qry += "AND A.C5_LOJACLI = B.A1_LOJA "
		c_Qry += "AND A.C5_NUM = D.C6_NUM "
		c_Qry += "AND D.C6_NOTA = ' '
		c_Qry += "AND C6_BLQ <> 'R' "

		//c_Qry += "AND D.C6_ENTREG = '"+ DtoS(Date()+1) +"' "
		c_Qry += "AND NOT EXISTS ( SELECT * FROM DA7010 D WHERE D.D_E_L_E_T_ = ' ' AND DA7_FILIAL = '"+ xFilial("DA7") +"' AND A1_CEP BETWEEN DA7_CEPDE AND DA7_CEPATE) "
		c_Qry += "AND C5_TIPO = 'N' "
		//c_Qry += "AND C5_EMISSAO = '"+ DtoS(Date()) +"' "
		c_Qry += "GROUP BY C5_FILIAL,A1_COD,A1_LOJA,A1_NOME,A1_MUN,A1_CEP "
		c_Qry += "ORDER BY C5_FILIAL,A1_COD,A1_LOJA,A1_NOME,A1_MUN,A1_CEP "


		PlsQuery(c_Qry,"_Q01")

		If ! Eof()

			U_HTMITAB2(@cHtm,0,2,0)
			U_HTMLTAB2(@cHtm,{'Clientes SEM Pontos por Setor' }, '000000', 'FFFFFF', -1)
			U_HTMFTAB2(@cHtm)
			U_HTMITAB2(@cHtm,1,2,0)
			U_HTMLTAB2(@cHtm,{'Filial','Cod. Cliente', 'Loja', 'Nome','Municipio',"CEP"}, '000000', 'FFFFFF', -1)

			While !Eof()


				U_HTMLTAB2(@cHtm, {_Q01->C5_FILIAL,;
				_Q01->A1_COD,;
				_Q01->A1_LOJA,;
				_Q01->A1_NOME,;
				_Q01->A1_MUN,;
				_Q01->A1_CEP}, IIF(lImpar, 'DDDDDD', 'CCCCCC'), NIL, -2)

				lImpar:= !lImpar


				DbSelectArea("_Q01")
				DbSkip()
			EndDo
		EndIf
		_Q01->(DbCloseArea())
		U_HTMFTAB2(@cHtm)
		U_HTMLINE(@cHtm,1)





		U_HTMITAB2(@cHtm,0,2,0)
		U_HtmLinTTit(@cHtm,{'TOTVS - Mensagem automática, favor não responder este e-mail.' + FunName()}, 'CCCCCC', '000000', -5)
		U_HTMFTAB2(@cHtm)

		U_HtmFimCorpo(@cHtm)

		//		cEmail  := Lower(Alltrim(GetMV("MV_X_EPEDD")))
		//		If GetMV("MV_X_EPED1") <> ' '
		//			cEmail  += ";" + Lower(Alltrim(GetMV("MV_X_EPED1")))
		//		EndIf

		//cEmail  := 'estevao.tavares@mococa.com.br;marcos.godinho@mococa.com.br;marina.ferreira@mococa.com.br;jose.vasques@totvs.com.br'



		//memowrite("\ROMSR003.html",cHtm01 + cHTM)


		conOut("Enviando Email para: " + cEmail)
		U_EnviarEMail(cEmail,'Pedidos '+ DtoC(Date()) + "-" + Time(),cHtm01 + cHTM)

	Endif

Return

