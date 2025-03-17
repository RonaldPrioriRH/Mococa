#include 'protheus.ch'
#include 'parmtype.ch'



User function RPCPR001()

	RunProc('0102')

	RunProc('0103')

Return

Static Function RunProc(c_Fil)
	Local c_Qry := ""
	Local lImpar := .T.
	Local cEmail := ""
	Local c_Prod := ""
	Local a_Tt   := {0,0,0,0,0,0,0,0,0}



	Private cHtm := ""
	Private cHtmCab := ""
	Private cHtmCabS := ""

	//If Select("SX2")=0
	RPCCLEARENV()
	RPCSetType(3)
	RPCSetEnv("01",c_Fil,"","","","",{})
	//EndIf

	cEmail  := GetMV("MV_XEMRPL") 
	//'marcos.godinho@mococa.com.br;kleberrsantos@totvs.com.br;adilson.goncalves@mococa.com.br'
	//'marcos.godinho@mococa.com.br;kleberrsantos@totvs.com.br;cristiano.andrade@mococa.com.br'

	c_Qry := "SELECT X.Z0E_OPP, " 
	c_Qry += "(C2_QUANT - C2_QUJE) AS SALDO, "
	c_Qry += "SUM(X.APONTADAS) AS APONT, "
	c_Qry += "SUM(X.AGUARDANDO) AS AGUARD, "
	c_Qry += "SUM(X.ERRO) AS ERRO, "
	c_Qry += "SUM(X.AGUARDANDO_SUSPENSAS) AS AGUARD_S, "
	c_Qry += "SUM(X.ERRO_SUSPENSAS) AS ERRO_S, "
	//c_Qry += "SUM((APONTADAS + AGUARDANDO + ERRO + AGUARDANDO_SUSPENSAS + ERRO_SUSPENSAS) - (NVL(Y.ENDER,0) + NVL(Y.AGUAR_E,0) + NVL(Y.ERRO_E,0))) AS PRDLGS, "
	c_Qry += "NVL(SUM(Y.ENDER),0) AS ENDERECADAS, "
	c_Qry += "NVL(SUM(Y.AGUAR_E),0) AS AGUAR_ENDER, "
	c_Qry += "NVL(SUM(Y.ERRO_E),0) AS ERRO_ENDER "
	c_Qry += "FROM SC2010, "
	c_Qry += "(SELECT Z0E_OPP,Z0E_ETIQ, "
	c_Qry += "(CASE WHEN Z0E_STATUS = '0' AND Z0E_SUSPEN <> 'S' AND Z0E_ESTORN <> 'S' THEN 1 ELSE 0 END) AS APONTADAS, "
	c_Qry += "(CASE WHEN Z0E_STATUS = '1' AND Z0E_SUSPEN <> 'S' AND Z0E_ESTORN <> 'S' THEN 1 ELSE 0 END) AS AGUARDANDO, "
	c_Qry += "(CASE WHEN Z0E_STATUS = '2' AND Z0E_SUSPEN <> 'S' AND Z0E_ESTORN <> 'S' THEN 1 ELSE 0 END) AS ERRO, "
	c_Qry += "(CASE WHEN Z0E_STATUS = '1' AND Z0E_SUSPEN = 'S' AND Z0E_ESTORN <> 'S' THEN 1 ELSE 0 END) AS AGUARDANDO_SUSPENSAS, "
	c_Qry += "(CASE WHEN Z0E_STATUS = '2' AND Z0E_SUSPEN = 'S' AND Z0E_ESTORN <> 'S' THEN 1 ELSE 0 END) AS ERRO_SUSPENSAS "
	c_Qry += "FROM Z0E010 "
	c_Qry += "WHERE Z0E010.D_E_L_E_T_ = ' ' " 
	c_Qry += "AND Z0E_FILIAL = '"+ xFilial("Z0E") +"' "
	c_Qry += "AND Z0E_ESTORN <> 'S' ) X " 
	c_Qry += "LEFT JOIN (SELECT Z0G_ETIQ, "
	c_Qry += "(CASE WHEN Z0G_STATUS = '0' THEN 1 ELSE 0 END) AS ENDER, "
	c_Qry += "(CASE WHEN Z0G_STATUS = '1' THEN 1 ELSE 0 END) AS AGUAR_E, "
	c_Qry += "(CASE WHEN Z0G_STATUS = '2' THEN 1 ELSE 0 END) AS ERRO_E "
	c_Qry += "FROM Z0G010 "
	c_Qry += "WHERE D_E_L_E_T_ = ' ' " 
	c_Qry += "AND Z0G_FILIAL = '"+ xFilial("Z0G") +"') Y ON X.Z0E_ETIQ = Y.Z0G_ETIQ "
	c_Qry += "WHERE SC2010.D_E_L_E_T_ = ' ' " 
	c_Qry += "AND C2_DATRF = ' ' "
	c_Qry += "AND C2_FILIAL = '"+ xFilial("SC2") +"' " 
	c_Qry += "AND C2_NUM = SUBSTR(Z0E_OPP,1,6) " 
	c_Qry += "AND C2_ITEM = SUBSTR(Z0E_OPP,7,2) " 
	c_Qry += "AND C2_SEQUEN = SUBSTR(Z0E_OPP,9,3) "
	c_Qry += "GROUP BY X.Z0E_OPP,C2_QUANT,C2_QUJE "
	c_Qry += "ORDER BY X.Z0E_OPP"


	PlsQuery(c_Qry,"_Q01")

	If ! Eof()
		U_HTMICOR2(@cHtm)

		cHtm += '<head>'

		cHtmCab := cHtm
		cHtmCabS := cHtm

		cHtm := ""

		cHtmCabS += '<meta http-equiv="content-type" content="text/html; charset=windows-1252"/>'
		cHtmCabS += '<meta HTTP-EQUIV="refresh" CONTENT="20;url=http://10.0.5.41:8085/centraldeajuda/helpcenter/das'+ cFilAnt +'.html">'
		cHtm += '<title>Resumo Produção / Logística '+ DtoC(Date()) +" - " + Time()+'</title>'
		cHtm += '</head>'

		cHtmCab += cHtm
		cHtmCabS += cHtm

		cHtmCabS += '<p style="color: rgb(255, 255, 255);"> <a href="http://10.0.5.41:8085/centraldeajuda/helpcenter/pl'+ cFilAnt +'.html">Parar saltos</a></p>'
		cHtmCab += '<p style="color: rgb(255, 255, 255);"> <a href="http://10.0.5.41:8085/centraldeajuda/helpcenter/pls'+ cFilAnt +'.html">Voltar saltos</a></p>'

		cHtm := ""

		U_HTMITAB2(@cHtm,0,2,0)
		U_HtmLinTTit(@cHtm,{'Mococa - ' + cFilAnt, 'TOTVS'}, '788EA7', 'FFFFFF', 4)
		U_HtmLinTTit(@cHtm,{'Resumo Produção / Logística '+ DtoC(Date()) +" - " + Time(), 'by Totvs Protheus'}, 'CCCCCC', '000000', -5)
		U_HTMFTAB2(@cHtm)
		U_HTMLINE(@cHtm,2)

		lImpar:= .t.

		U_HTMITAB2(@cHtm,0,2,0)
		U_HTMLTAB2(@cHtm,{'Etiquetas x OP'  }, '000000', 'FFFFFF', -1)
		U_HTMFTAB2(@cHtm)
		U_HTMITAB2(@cHtm,1,2,0)
		U_HTMLTAB2(@cHtm,{'OP','Saldo','Produto', 'Aguard. Apontamento','Apontadas','Com Erro','Aguard. (Suspensas)','Com Erro (Suspensas)','Aguard. Endereçamento','Endereçadas','Com Erro','Dif. Produção x Logistica'}, '000000', 'FFFFFF', -1)

		While !Eof()
			c_Prod := Posicione("SC2",1,xFilial("SC2") + _Q01->Z0E_OPP, "C2_PRODUTO")



			U_HTMLTAB2(@cHtm, {_Q01->Z0E_OPP,;
			Transform(_Q01->SALDO,"@E 999,999.99"),;
			Posicione("SB1",1,xFilial("SB1") + c_Prod, "B1_DESC"),;
			AllTrim(Str(_Q01->AGUARD)),;
			AllTrim(Str(_Q01->APONT)),;
			AllTrim(Str(_Q01->ERRO)),;
			AllTrim(Str(_Q01->AGUARD_S)),;
			AllTrim(Str(_Q01->ERRO_S)),;
			AllTrim(Str(_Q01->AGUAR_ENDER)),;
			AllTrim(Str(_Q01->ENDERECADAS)),;
			AllTrim(Str(_Q01->ERRO_ENDER)),;
			AllTrim(Str(_Q01->((AGUARD + APONT + ERRO + AGUARD_S + ERRO_S) - (AGUAR_ENDER + ENDERECADAS + ERRO_ENDER))))}, IIF(lImpar, 'DDDDDD', 'CCCCCC'), NIL, -2)
			lImpar:= !lImpar

			a_Tt[1] += _Q01->AGUARD
			a_Tt[2] += _Q01->APONT
			a_Tt[3] += _Q01->ERRO
			a_Tt[4] += _Q01->AGUARD_S
			a_Tt[5] += _Q01->ERRO_S
			a_Tt[6] += _Q01->AGUAR_ENDER
			a_Tt[7] += _Q01->ENDERECADAS
			a_Tt[8] += _Q01->ERRO_ENDER
			a_Tt[9] += _Q01->((AGUARD + APONT + ERRO + AGUARD_S + ERRO_S) - (AGUAR_ENDER + ENDERECADAS + ERRO_ENDER))



			DbSelectArea("_Q01")
			DbSkip()
		EndDo
		_Q01->(DbCloseArea())


		U_HTMLTAB2(@cHtm, {" ",;
		" ",;
		"Totais",;
		AllTrim(Str(a_Tt[1])),;
		AllTrim(Str(a_Tt[2])),;
		AllTrim(Str(a_Tt[3])),;
		AllTrim(Str(a_Tt[4])),;
		AllTrim(Str(a_Tt[5])),;
		AllTrim(Str(a_Tt[6])),;
		AllTrim(Str(a_Tt[7])),;
		AllTrim(Str(a_Tt[8])),;
		AllTrim(Str(a_Tt[9]))}, IIF(lImpar, 'DDDDDD', 'CCCCCC'), NIL, -2)



		U_HTMFTAB2(@cHtm)
		U_HTMLINE(@cHtm,1)


		//Erros
		c_Qry := "SELECT Z0E_OPP,Z0E_SUSPEN,SUBSTR(UTL_RAW.CAST_TO_VARCHAR2(DBMS_LOB.SUBSTR(Z0E_MENS,2000,1)),20) AS MS, COUNT(1) AS QETQ, MAX(Z0E_DTUATU||'-'|| Z0E_HRUATU) AS ULTDTHR FROM Z0E010 "
		c_Qry += "WHERE D_E_L_E_T_ = ' '  "
		c_Qry += "AND Z0E_ESTORN <> 'S' "
		c_Qry += "AND Z0E_STATUS = '2' "
		c_Qry += "AND Z0E_FILIAL = '"+ xFilial("Z0E") +"' "
		c_Qry += "GROUP BY Z0E_OPP,Z0E_SUSPEN,  SUBSTR(UTL_RAW.CAST_TO_VARCHAR2(DBMS_LOB.SUBSTR(Z0E_MENS,2000,1)),20) "
		c_Qry += "ORDER BY Z0E_OPP"

		PlsQuery(c_Qry,"_Q01")

		If ! Eof()
			U_HTMITAB2(@cHtm,0,2,0)
			U_HTMLTAB2(@cHtm,{'Inconsistência Apontamento por O.P.'  }, '000000', 'FFFFFF', -1)
			U_HTMFTAB2(@cHtm)
			U_HTMITAB2(@cHtm,1,2,0)
			U_HTMLTAB2(@cHtm,{'O.P.','Suspenso','Inconsistência','Ult Dt Hr Apon','Qtd Etiqueta'}, '000000', 'FFFFFF', -1)

			While !Eof()


				U_HTMLTAB2(@cHtm, {_Q01->Z0E_OPP,;
				IIF(_Q01->Z0E_SUSPEN = 'S',"Sim","Nao"),;
				_Q01->MS,;
				DtoC(StoD(SubStr(_Q01->ULTDTHR,1,8))) + SubStr(_Q01->ULTDTHR,9),;
				AllTrim(Str(_Q01->QETQ))}, IIF(lImpar, 'DDDDDD', 'CCCCCC'), NIL, -2)
				lImpar:= !lImpar


				DbSelectArea("_Q01")
				DbSkip()
			EndDo
		Endif

		_Q01->(DbCloseArea())


		U_HTMFTAB2(@cHtm)
		U_HTMLINE(@cHtm,1)

		U_HTMITAB2(@cHtm,0,2,0)
		U_HtmLinTTit(@cHtm,{'TOTVS - Mensagem automática, favor não responder este e-mail.' + FunName()}, 'CCCCCC', '000000', -5)
		U_HTMFTAB2(@cHtm)

		U_HtmFimCorpo(@cHtm)

		MemoWrite("\centraldeajuda\helpcenter\PL"+ cFilAnt +".html", cHtmCab + cHtm)

		MemoWrite("\centraldeajuda\helpcenter\PLs"+ cFilAnt +".html",cHtmCabS + cHtm)

		//cEmail  := 'jose.vasques@totvs.com.br'



		//conOut(FunName() + " Enviando Email para: " + cEmail)
		//U_EnviarEMail(cEmail,'Resumo Produção / Logística '+ DtoC(Date()) + "-" + Time(),cHtmCab + cHtm)





		DrAc()

	EndIf


return


Static Function DrAc()
	Local c_html2 := ""
	Local a_Vl := {}
	Local c_Qry := ""


	c_Qry := "SELECT SUM(X.APONTADAS) AS APONT, "
	c_Qry += "NVL(SUM(Y.ENDER),0) AS ENDERECADAS "
	c_Qry += "FROM SC2010, "
	c_Qry += "(SELECT Z0E_OPP,Z0E_ETIQ, "
	c_Qry += "(CASE WHEN Z0E_ESTORN <> 'S' THEN 1 ELSE 0 END) AS APONTADAS "
	c_Qry += "FROM Z0E010 "
	c_Qry += "WHERE Z0E010.D_E_L_E_T_ = ' ' " 
	c_Qry += "AND Z0E_FILIAL = '"+ xFilial("Z0E") +"' "
	c_Qry += "AND Z0E_DATA = '"+ DTOS(Date()) +"' "
	c_Qry += "AND Z0E_ESTORN <> 'S' ) X " 
	c_Qry += "LEFT JOIN (SELECT Z0G_ETIQ, "
	c_Qry += "1  AS ENDER "
	c_Qry += "FROM Z0G010 "
	c_Qry += "WHERE D_E_L_E_T_ = ' ' " 
	c_Qry += "AND Z0G_FILIAL = '"+ xFilial("Z0G") +"' "
	c_Qry += ") Y ON X.Z0E_ETIQ = Y.Z0G_ETIQ "
	c_Qry += "WHERE SC2010.D_E_L_E_T_ = ' ' " 
	c_Qry += "AND C2_DATRF = ' ' "
	c_Qry += "AND C2_FILIAL = '"+ xFilial("SC2") +"' " 
	c_Qry += "AND C2_NUM = SUBSTR(Z0E_OPP,1,6) " 
	c_Qry += "AND C2_ITEM = SUBSTR(Z0E_OPP,7,2) " 
	c_Qry += "AND C2_SEQUEN = SUBSTR(Z0E_OPP,9,3) "



	PlsQuery(c_Qry,"_Q01")

	If ! Eof()
		AADD(a_Vl,AllTrim(Str(_Q01->APONT)))
		AADD(a_Vl,AllTrim(Str(_Q01->ENDERECADAS)))
		AADD(a_Vl,AllTrim(Str(_Q01->APONT - _Q01->ENDERECADAS)))
	Endif

	_Q01->(DbCloseArea())

	c_Qry := "SELECT SUM(X.APONTADAS) AS APONT, "
	c_Qry += "NVL(SUM(Y.ENDER),0) AS ENDERECADAS "
	c_Qry += "FROM SC2010, "
	c_Qry += "(SELECT Z0E_OPP,Z0E_ETIQ, "
	c_Qry += "(CASE WHEN Z0E_ESTORN <> 'S' THEN 1 ELSE 0 END) AS APONTADAS "
	c_Qry += "FROM Z0E010 "
	c_Qry += "WHERE Z0E010.D_E_L_E_T_ = ' ' " 
	c_Qry += "AND Z0E_FILIAL = '"+ xFilial("Z0E") +"' "
	//c_Qry += "AND Z0E_DATA = '"+ DTOS(Date()) +"' "
	c_Qry += "AND Z0E_ESTORN <> 'S' ) X " 
	c_Qry += "LEFT JOIN (SELECT Z0G_ETIQ, "
	c_Qry += "1  AS ENDER "
	c_Qry += "FROM Z0G010 "
	c_Qry += "WHERE D_E_L_E_T_ = ' ' " 
	c_Qry += "AND Z0G_FILIAL = '"+ xFilial("Z0G") +"' "
	c_Qry += ") Y ON X.Z0E_ETIQ = Y.Z0G_ETIQ "
	c_Qry += "WHERE SC2010.D_E_L_E_T_ = ' ' " 
	c_Qry += "AND C2_DATRF = ' ' "
	c_Qry += "AND C2_FILIAL = '"+ xFilial("SC2") +"' " 
	c_Qry += "AND C2_NUM = SUBSTR(Z0E_OPP,1,6) " 
	c_Qry += "AND C2_ITEM = SUBSTR(Z0E_OPP,7,2) " 
	c_Qry += "AND C2_SEQUEN = SUBSTR(Z0E_OPP,9,3) "



	PlsQuery(c_Qry,"_Q01")

	If ! Eof()
		AADD(a_Vl,AllTrim(Str(_Q01->APONT)))
		AADD(a_Vl,AllTrim(Str(_Q01->ENDERECADAS)))
		AADD(a_Vl,AllTrim(Str(_Q01->APONT - _Q01->ENDERECADAS)))
	Endif

	_Q01->(DbCloseArea())

	c_html2 := '<html>'
	c_html2 += '	<head>'

	cHtmCab := c_html2
	cHtmCabS := c_html2

	c_html2 := ""

	cHtmCabS += '<meta http-equiv="content-type" content="text/html; charset=windows-1252"/>'
	cHtmCabS += '<meta HTTP-EQUIV="refresh" CONTENT="20;url=http://10.0.5.41:8085/centraldeajuda/helpcenter/pls'+ cFilAnt +'.html">'
	c_html2 += '		<title></title>'
	c_html2 += '	</head>'

	cHtmCab += c_html2
	cHtmCabS += c_html2

	cHtmCabS += '<p style="color: rgb(255, 255, 255);"> <a href="http://10.0.5.41:8085/centraldeajuda/helpcenter/da'+ cFilAnt +'.html">Parar saltos</a></p>'
	cHtmCab += '<p style="color: rgb(255, 255, 255);"> <a href="http://10.0.5.41:8085/centraldeajuda/helpcenter/das'+ cFilAnt +'.html">Voltar saltos</a></p>'

	c_html2 := ""



	c_html2 += '	<body style="background-color: rgb(0, 0, 0);">'
	c_html2 += '		<table border="0" cellpadding="1" cellspacing="1" style="color: rgb(255, 255, 255); width: 100%;">'
	c_html2 += '			<tbody>'
	c_html2 += '				<tr>'
	c_html2 += '					<td style="text-align: center;">'
	c_html2 += '						<span style="color:#add8e6;"><span style="font-size:48px;">Hoje</span></span></td>'
	c_html2 += '					<td style="text-align: center;">'
	c_html2 += '						<span style="color:#add8e6;"><span style="font-size:48px;">Acumulado</span></span></td>'
	c_html2 += '				</tr>'
	c_html2 += '				<tr>'
	c_html2 += '					<td style="text-align: center;">'
	c_html2 += '						<span style="font-size:48px;">Paletes Apontados</span></td>'
	c_html2 += '					<td style="text-align: center;">'
	c_html2 += '						<span style="font-size:48px;">Paletes Apontados</span></td>'
	c_html2 += '				</tr>'
	c_html2 += '				<tr>'
	c_html2 += '					<td style="text-align: center;">'
	c_html2 += '						<span style="font-size:48px;"><strong>'+ a_Vl[1] +'</strong></span></td>'
	c_html2 += '					<td style="text-align: center;">'
	c_html2 += '						<span style="font-size: 48px;"><b>'+ a_Vl[4] +'</b></span></td>'
	c_html2 += '				</tr>'
	c_html2 += '				<tr>'
	c_html2 += '					<td style="text-align: center;">'
	c_html2 += '						<span style="font-size:48px;">Endere&ccedil;ados pela Log&iacute;stica</span></td>'
	c_html2 += '					<td style="text-align: center;">'
	c_html2 += '						<span style="font-size:48px;">Endere&ccedil;ados pela Log&iacute;stica</span></td>'
	c_html2 += '				</tr>'
	c_html2 += '				<tr>'
	c_html2 += '					<td style="text-align: center;">'
	c_html2 += '						<strong style="font-size: 48px;">'+ a_Vl[2] +'</strong></td>'
	c_html2 += '					<td style="text-align: center;">'
	c_html2 += '						<span style="font-size: 48px;"><b>'+ a_Vl[5] +'</b></span></td>'
	c_html2 += '				</tr>'
	c_html2 += '				<tr>'
	c_html2 += '					<td style="text-align: center;">'
	c_html2 += '						<span style="font-size:48px;">Na Produ&ccedil;&atilde;o</span></td>'
	c_html2 += '					<td style="text-align: center;">'
	c_html2 += '						<span style="font-size:48px;">Na Produ&ccedil;&atilde;o</span></td>'
	c_html2 += '				</tr>'
	c_html2 += '				<tr>'
	c_html2 += '					<td style="text-align: center;">'
	c_html2 += '						<font color="#ff0000"><span style="font-size: 48px;"><b>'+ a_Vl[3] +'</b></span></font></td>'
	c_html2 += '					<td style="text-align: center;">'
	c_html2 += '						<font color="#ff0000"><span style="font-size: 48px;"><b>'+ a_Vl[6] +'</b></span></font></td>'
	c_html2 += '				</tr>'
	c_html2 += '			</tbody>'
	c_html2 += '		</table>'
	c_html2 += '		<p style="color: rgb(255, 255, 255);">'
	c_html2 += '			&nbsp;</p>'
	c_html2 += '	</body>'
	c_html2 += '</html>'

	MemoWrite("\centraldeajuda\helpcenter\DA"+ cFilAnt +".html",cHtmCab + c_html2)

	MemoWrite("\centraldeajuda\helpcenter\DAs"+ cFilAnt +".html",cHtmCabS + c_html2)
Return