	#include 'protheus.ch'
#include 'parmtype.ch'
#include 'topconn.ch'
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ RPCPR002 บAutor  ณ                    บ Data ณ  23/01/2018 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Rotina que gera planilha xml com informa็๕es industriais   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ MOCOCA          .                                           บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/


user function RPCPR002()
	LOCAL aArea := GetArea()
	LOCAL cPerg := "RPCPR002"
	ValidPerg(cPerg)

	if !Pergunte(cPerg,.t.)
		restarea(aArea)
		return
	endif


	Processa({|| RunProc() })

	restarea(aArea)	
return



Static Function RunProc()
	LOCAL aArea := GetArea()
	LOCAL cQUery
	Local oExcel	:= FWMSEXCEL():New() 
	Local cWorkP1
	Local cQuery
	Local aEstLibFat := {} 
	Local cMRefFatAt := Substr(dtos(mv_par06),5,2)
	Local cARefFatAt := Substr(dtos(mv_par06),1,4)
	Local cMRefFatAn 
	Local cARefFatAn 
	Local cPerFatAt
	Local cPerFatAn
	Local aMeses := {"Jan","Fev","Mar","Abr","Mai","Jun","Jul","Ago","Set","Out","Nov","Dez"}
	Local cTitMesAt
	Local cTitMesAn
	
	
	cMRefFatAn := val(cMRefFatAt)-1
	cARefFatAn := val(cARefFatAt)
	
	if cMRefFatAn == 0
		cMRefFatAn := 12
		cARefFatAn := val(cARefFatAt)-1
	endif
	
	
	cMRefFatAn := StrZero(cMRefFatAn,2)
	cARefFatAn := StrZero(cARefFatAn,4)
	
	cPerFatAt := cARefFatAt+cMRefFatAt
	cPerFatAn := cARefFatAn+cMRefFatAn
	
	cTitMesAt := aMeses[Val(cMRefFatAt)]+"/"+cARefFatAt
	cTitMesAn := aMeses[Val(cMRefFatAn)]+"/"+cARefFatAn
	

	//Reserva as Filiais que serใo analisadas estoque disponํvel para faturamento
	//Nใo considera a filial 0102 pois ้ a unidade de Mococa, onde o Armaz้m 09 nใo faz faturamento direto a cliente, apenas transfere o disponํvel
	//para o armaz้m 0104.
	cQUery := " SELECT DISTINCT B2_FILIAL FROM "+RetSqlName("SB2")+"  "
	cQUery += " LEFT JOIN "+RetSqlName("SB1")+" ON (B1_FILIAL =' ' AND B1_COD = B2_COD AND SB1010.D_E_L_E_T_=' ') "
	cQuery += " WHERE B2_FILIAL BETWEEN ' ' AND 'ZZZZ' AND B2_FILIAL<>'0102' AND B2_LOCAL='09' AND SB2010.D_E_L_E_T_=' ' AND B1_TIPO IN('PA','ME') AND B1_UM <>'UN' "
	cQuery += " ORDER BY B2_FILIAL "
	if Select("QB2") > 0
		QB2->(DbCloseArea())
	endif	
	TcQuery cQuery new alias "QB2"
	While !QB2->(Eof())
		aadd(aEstLibFat,{QB2->B2_FILIAL,0})
		DbSelectArea("QB2")
		DbSkip()
	Enddo
	QB2->(DbCloseArea())


	cQuery := "SELECT A.B1_COD, "
	cQuery +=  "A.B1_DESC, "
	//cQuery += " SUM(ROUND(CASE WHEN B.C2_DATPRF  >='"+dtos(mv_par03)+"' AND B.C2_DATPRF  <='"+dtos(mv_par04)+"' THEN B.C2_QUANT ELSE 0 END,0)) PREV_P1, "
	//cQuery += " SUM(ROUND(CASE WHEN C.D3_EMISSAO >='"+dtos(mv_par03)+"' AND C.D3_EMISSAO <='"+dtos(mv_par04)+"' THEN C.D3_QUANT ELSE 0 END,0)) REAL_P1, "
	cQuery += " 0 PREV_P1, "
	cQuery += " 0 REAL_P1, "
	cQuery += " 0 NIVEL_SERVICO, "
	//cQuery += " SUM(ROUND(CASE WHEN B.C2_DATPRF  >='"+dtos(mv_par05)+"' AND B.C2_DATPRF  <='"+dtos(mv_par06)+"' THEN B.C2_QUANT ELSE 0 END,0)) PREV_P2, "
	//cQuery += " SUM(ROUND(CASE WHEN C.D3_EMISSAO >='"+dtos(mv_par05)+"' AND C.D3_EMISSAO <='"+dtos(mv_par06)+"' THEN C.D3_QUANT ELSE 0 END,0)) REAL_P2, "
	cQuery += " 0 PREV_P2, "
	cQuery += " 0 REAL_P2, "
	cQuery += " 0 FALTA_PRODUZIR, "
	cQuery += " 0 ESTOQUE_ATUAL, "
	cQuery += " 0 ESTOQUE_ANALISE_MOCOCA, "
	cQuery += " 0 ESTOQUE_ANALISE_CERQUEIRA, "
	cQuery += " 0 ESTOQUE_LIB_TRANSF_MOC " 
	cQuery += " FROM "+RetSqlName("SB1")+" A "
	//cQuery += " LEFT JOIN "+RetSqlName("SC2")+" B ON (B.C2_FILIAL >= '0102' AND B.C2_FILIAL <= '0103' AND B.C2_DATPRF  >='"+dtos(MV_PAR05)+"' AND B.C2_DATPRF  <= '"+dtos(mv_par06)+"' AND B.C2_PRODUTO = A.B1_COD AND B.D_E_L_E_T_=' ') "
	//cQuery += " LEFT JOIN "+RetSqlName("SD3")+" C ON (C.D3_FILIAL >= '0102' AND C.D3_FILIAL <= '0103' AND C.D3_EMISSAO >='"+dtos(MV_PAR05)+"' AND C.D3_EMISSAO <= '"+dtos(mv_par06)+"' AND C.D3_COD     = A.B1_COD AND C.D3_CF='PR0' AND C.D3_ESTORNO<>'S' AND C.D_E_L_E_T_=' ')
	cQuery += " WHERE A.B1_FILIAL='"+FwxFilial("SB1")+"' AND B1_COD >='"+mv_par01+"' and B1_COD <='"+mv_par02+"' AND B1_TIPO IN('PA','ME') AND A.B1_UM<>'UN' AND A.D_E_L_E_T_=' ' "
	cQuery += " GROUP BY A.B1_COD,A.B1_DESC "
	if Select("QRYPROC") > 0
		qryproc->(DbCloseArea())
	endif
	TcQuery cQuery new alias "QRYPROC"

	Count to nContProc
	ProcRegua(nContProc)
	
	DbGoTop()

	cWorkP1 := 'Pasta1'
	oExcel:AddworkSheet(cWorkP1)
	oExcel:AddTable(cWorkP1,"Relatorio")
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Produto"	,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Descri็ใo"	,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Previsto_P1"	,1		,1			,.F.	) 
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Realizado_P1"	,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Nivel_Servico"	,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Previsto_P2"	,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Realizado_P2"	,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Falta_Produzir"	,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Estoque_Atual"	,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Estoque_Analise_Mococa"	,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Estoque_Analise_Cerqueira"	,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Estoque_Retido_Mococa"	,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Estoque_Retido_Cerqueira"	,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Estoque_Lib_Transf_Mococa"	,1		,1			,.F.	)
	For nZ :=1 to Len(aEstLibFat)
		oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Estoque_LibFat_"+Alltrim(aEstLibFat[nZ,1])	,1		,1			,.F.	)		
	Next nZ
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Estoque_Liquido"	,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Pedidos_Carteira"	,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Fat_"+cTitMesAt	,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Fat_"+cTitMesAn	,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Devolu็๕es"		,1		,1			,.F.	)
	oExcel:AddColumn(cWorkP1		,"Relatorio"	,"Fat_Antecipado"		,1		,1			,.F.	)

	While !QRYProc->(Eof())
		IncProc("Processando ...")
		
		//Previsto 1.o Periodo
		cQuery := " SELECT SUM(C2_QUANT) AS QUANT FROM "+RetSqlName("SC2")+" WHERE C2_FILIAL>='0102' AND C2_FILIAL<='0103' " 
        cQuery += " AND C2_PRODUTO ='"+QRYProc->B1_COD+"' AND C2_DATPRF >='"+dtos(mv_par03)+"' AND C2_DATPRF <='"+dtos(mv_par04)+"' AND D_E_L_E_T_=' '
		if Select("QPREV_P1") > 0
			QPREV_P1->(DbCloseArea())
		endif
		TcQUery cQuery new alias "QPREV_P1"
		nPrev_P1 := QPREV_P1->QUANT
		QPREV_P1->(DbCloseArea())
		
		//Relizado 1.o Periodo
		cQuery := " SELECT SUM(D3_QUANT) AS QUANT FROM "+RetSqlName("SD3")+" WHERE D3_FILIAL>='0102' AND D3_FILIAL <='0103' AND D3_COD ='"+QRYProc->B1_COD+"'
		cQuery += " AND D3_EMISSAO >='"+dtos(mv_par03)+"' AND D3_EMISSAO <='"+dtos(mv_par04)+"' AND D3_CF='PR0' AND D3_ESTORNO<>'S' "
		if Select("QREAL_P1") > 0
			QREAL_P1->(DbCloseArea())
		endif
		TcQUery cQuery new alias "QREAL_P1"
		nReal_P1 := QREAL_P1->QUANT
		QReal_P1->(DbCloseArea())
		
		
		//Coluna nํvel de servi็o:
		nNivServ := iif(nPrev_P1 > 0, nReal_P1 / nPrev_P1, 0 )
		
		
		//Previsto 2.o Periodo
		cQuery := " SELECT SUM(C2_QUANT) AS QUANT FROM "+RetSqlName("SC2")+" WHERE C2_FILIAL>='0102' AND C2_FILIAL<='0103' " 
        cQuery += " AND C2_PRODUTO ='"+QRYProc->B1_COD+"' AND C2_DATPRF >='"+dtos(mv_par05)+"' AND C2_DATPRF <='"+dtos(mv_par06)+"' AND D_E_L_E_T_=' '
		if Select("QPREV_P1") > 0
			QPREV_P2->(DbCloseArea())
		endif
		TcQUery cQuery new alias "QPREV_P2"
		nPrev_P2 := QPREV_P2->QUANT
		QPREV_P2->(DbCloseArea())
		
		//Relizado 2.o Periodo
		cQuery := " SELECT SUM(D3_QUANT) AS QUANT FROM "+RetSqlName("SD3")+" WHERE D3_FILIAL>='0102' AND D3_FILIAL <='0103' AND D3_COD ='"+QRYProc->B1_COD+"'
		cQuery += " AND D3_EMISSAO >='"+dtos(mv_par05)+"' AND D3_EMISSAO <='"+dtos(mv_par06)+"' AND D3_CF='PR0' AND D3_ESTORNO<>'S' "
		if Select("QREAL_P2") > 0
			QREAL_P2->(DbCloseArea())
		endif
		TcQUery cQuery new alias "QREAL_P2"
		nReal_P2 := QREAL_P2->QUANT
		QReal_P2->(DbCloseArea())

		//Coluna Falta produzir:
		nFaltaPrd := nPrev_P2 - nReal_P2

		//Coluna Estoque Atual
		cQuery := " SELECT SUM(ROUND(B2_QATU,0)) as SLDATU "
		cQuery += " From "
		cQuery += RetSqlName("SB2")
		cQuery += " Where "
		cQuery += " B2_FILIAL >='0102' AND B2_FILIAL <='0103' and "
		cQuery += " B2_COD = '"+QRYPROC->B1_COD+"' and "
		cQuery += " D_E_L_E_T_=' ' "
		if Select("QB2") > 0
			QB2->(DbCloseArea())
		endif
		TcQUery cQuery new alias "QB2"
		nSldAtu := QB2->SLDATU
		QB2->(DbCloseArea())

		//Estoque em Anแlise Mococa e Cerqueira
		cQuery := " SELECT A.D7_FILIAL,ROUND(SUM(A.D7_SALDO),0) SALDO, ROUND(SUM(B.D7_QTDE),0) QTDE FROM "+RetSqlName("SD7")+" A "   
		cQuery += " LEFT JOIN "+RetSqlName("SD7")+" B ON (B.D7_FILIAL=A.D7_FILIAL AND B.D7_NUMERO =A.D7_NUMERO AND B.D7_DATA <='"+dtos(mv_par05)+"' AND B.D_E_L_E_T_=' ' AND B.D7_TIPO<>'0') "
		cQuery += " WHERE A.D7_FILIAL >= '0102' AND A.D7_FILIAL <='0103' AND A.D_E_L_E_T_=' ' AND A.D7_PRODUTO ='"+QRYProc->B1_COD+"' AND A.D7_DATA <='"+dtos(mv_par05)+"' AND A.D7_ORIGLAN='PR' AND A.D7_TIPO='0' "
		cQuery += " GROUP BY A.D7_FILIAL "
		if Select("QD7") > 0
			QD7->(DbCloseArea())
		endif
		TcQUery cQuery new alias "QD7"

		nEstAn0102 := nEstAn0103 := 0
		while !QD7->(Eof())
			if QD7->D7_FILIAL =='0102'
				nEstAn0102 := QD7->SALDO-QD7->QTDE
			elseif QD7->D7_FILIAL =='0103'
				nEstAn0103 := QD7->SALDO-QD7->QTDE
			endif
			DbsKip()
		Enddo
		QD7->(DbCloseArea())
		
		
		//Estoque Retido Mococa e Cerqueira
		cQuery := " SELECT A.D7_FILIAL,ROUND(SUM(A.D7_SALDO),0) SALDO, ROUND(SUM(B.D7_QTDE),0) QTDE FROM "+RetSqlName("SD7")+" A "   
		cQuery += " LEFT JOIN "+RetSqlName("SD7")+" B ON (B.D7_FILIAL=A.D7_FILIAL AND B.D7_NUMERO =A.D7_NUMERO AND B.D7_DATA <='"+dtos(mv_par05)+"' AND B.D_E_L_E_T_=' ' AND B.D7_TIPO<>'0') "
		cQuery += " WHERE A.D7_FILIAL >= '0102' AND A.D7_FILIAL <='0103' AND A.D_E_L_E_T_=' ' AND A.D7_PRODUTO ='"+QRYProc->B1_COD+"' AND A.D7_DATA <='"+dtos(mv_par05)+"' AND A.D7_ORIGLAN='TR' AND A.D7_TIPO='0' "
		cQuery += " GROUP BY A.D7_FILIAL "
		if Select("QD7RET") > 0
			QD7RET->(DbCloseArea())
		endif
		TcQUery cQuery new alias "QD7RET"

		nEstRe0102 := nEstRe0103 := 0
		while !QD7RET->(Eof())
			if QD7RET->D7_FILIAL =='0102'
				nEstRe0102 := QD7RET->SALDO-QD7RET->QTDE
			elseif QD7RET->D7_FILIAL =='0103'
				nEstRe0103 := QD7RET->SALDO-QD7RET->QTDE
			endif
			DbsKip()
		Enddo
		QD7RET->(DbCloseArea())

		//Estoque Liberado para Transfer๊ncia Mococa
		cQuery := " SELECT ROUND(B2_QATU,0) SLDLIBTRAN FROM "+RetSqlName("SB2")+" WHERE B2_FILIAL='0102' AND B2_COD='"+QRYProc->B1_COD+"' AND B2_LOCAL='09' AND D_E_L_E_T_=' ' "
		if Select("QB2") > 0
			QB2->(DbCloseArea())
		endif
		TcQUery cQuery new alias "QB2"
		nSldLibTran := QB2->SLDLIBTRAN
		QB2->(DbCloseArea())

		//Estoque disponํvel para Faturamento

		nTotLibFat := 0
		For nZ :=1 to Len(aEstLibFat)
			cQuery := " SELECT ROUND(B2_QATU,0) QATU FROM "+RetSqlName("SB2")+"  
			cQuery += " WHERE B2_FILIAL  = '"+aEstLibFat[nZ,1]+"' AND B2_COD = '"+QRYProc->B1_COD+"' AND B2_LOCAL='09' AND SB2010.D_E_L_E_T_=' ' "
			if Select("QESTLIBFAT") > 0
				QESTLIBFAT->(DbCloseArea())
			endif
			TcQuery cQuery new alias "QESTLIBFAT"
			aEstLibFat[nZ,2] := QESTLIBFAT->QATU
			nTotLibFat += QESTLIBFAT->QATU
			QESTLIBFAT->(DbCloseArea())
		next nZ
		



		//Pedidos de Venda em Carteira
		//Nใo considero os clientes C02641 e C02642 pois sใo a pr๓pria Mococa e representam transfer๊ncia entre filiais
		//Considero todos os pedidos que vใo movimentar estoque.
		nPedCart := 0
		cQuery := " SELECT ROUND(SUM(C6_QTDVEN-C6_QTDENT),0) AS QTD_ENTREGAR "
		cQUery += " FROM "+RetSqlName("SC6")
		cQUery += " LEFT  JOIN "+RetSqlName("SF4")+" ON (F4_FILIAL = C6_FILIAL AND F4_CODIGO = C6_TES AND SF4010.D_E_L_E_T_=' ' )  "
		cQUery += " WHERE "
		cQUery += " C6_FILIAL >=' ' AND C6_FILIAL <='ZZZZ'  "
		cQUery += " AND C6_PRODUTO ='"+QRYProc->B1_COD+"'  "
		cQUery += " AND F4_ESTOQUE='S' AND C6_CLI<>'C02641' AND C6_CLI<>'C02642' ""
		cQUery += " AND SC6010.D_E_L_E_T_=' ' "
		if Select("QSC6") > 0
			QSC6->(DbCloseArea())
		endif
		TcQuery cQuery new alias "QSC6"
		nPedCart := QSC6->QTD_ENTREGAR
		QSC6->(DbCloseArea())
		
		

		
		//Estoque Liquido
		
		nEstoqLiq := nTotLibFat - nPedCart
		
		
		
		//Faturamento M๊s Atual
		cQuery := " SELECT ROUND(SUM(D2_QUANT),0) QTDFAT FROM "+RetSqlName("SD2")
		cQuery += " LEFT JOIN "+RetSqlName("SF2")+" ON (F2_FILIAL = D2_FILIAL AND F2_DOC = D2_DOC AND F2_SERIE = D2_SERIE AND F2_CLIENTE = D2_CLIENTE AND F2_LOJA = D2_LOJA AND SF2010.D_E_L_E_T_=' ') "
		cQuery += " WHERE D2_FILIAL >= ' ' AND D2_FILIAL <='ZZZZ' AND "
		cQuery += " SUBSTR(D2_EMISSAO,1,6) = '"+cPerFatAt+"' AND "
		cQuery += " D2_COD = '"+QRYProc->B1_COD+"' AND D2_CLIENTE <>'C02641' AND D2_CLIENTE<>'C02642'  AND F2_VALFAT > 0 AND "
		cQuery += " SD2010.D_E_L_E_T_= ' ' "
		if Select("QFatAtu") > 0
			QFatAtu->(DbCloseArea())
		endif
		TcQuery cQuery new alias "QFatAtu"
		nQtdFatAtu := QFatAtu->QtdFat
		
		
		
		//Faturamento M๊s Anterior
		cQuery := " SELECT ROUND(SUM(D2_QUANT),0) QTDFAT FROM "+RetSqlName("SD2")
		cQuery += " LEFT JOIN "+RetSqlName("SF2")+" ON (F2_FILIAL = D2_FILIAL AND F2_DOC = D2_DOC AND F2_SERIE = D2_SERIE AND F2_CLIENTE = D2_CLIENTE AND F2_LOJA = D2_LOJA AND SF2010.D_E_L_E_T_=' ') "
		cQuery += " WHERE D2_FILIAL >= ' ' AND D2_FILIAL <='ZZZZ' AND "
		cQuery += " SUBSTR(D2_EMISSAO,1,6) = '"+cPerFatAn+"' AND "
		cQuery += " D2_COD = '"+QRYProc->B1_COD+"' AND D2_CLIENTE <>'C02641' AND D2_CLIENTE<>'C02642'  AND F2_VALFAT > 0 AND "
		cQuery += " SD2010.D_E_L_E_T_= ' ' "
		if Select("QFatAnt") > 0
			QFatAnt->(DbCloseArea())
		endif
		TcQuery cQuery new alias "QFatAnt"
		nQtdFatAnt := QFatAnt->QtdFat
		
		//Devolu็๕es
		
		cQuery := " SELECT ROUND(SUM(D1_QUANT),0) QUANT FROM "+RetSqlName("SD1") 
		cQuery += " LEFT JOIN "+RetSqlName("SF2")+" ON (F2_FILIAL = D1_FILIAL AND F2_DOC = D1_NFORI AND F2_SERIE =D1_SERIORI AND F2_CLIENTE = D1_FORNECE AND F2_LOJA = D1_LOJA AND SF2010.D_E_L_E_T_=' ')
		cQuery += " WHERE D1_FILIAL >= ' ' AND D1_FILIAL <='ZZZZ' AND SUBSTR(D1_DTDIGIT,1,6)='"+cPerFatAt+"' " 
		cQuery += " AND D1_COD ='"+QRYProc->B1_COD+"' AND D1_FORNECE <> 'C02641' AND D1_FORNECE <>'C02642' "
		cQuery += " AND SD1010.D_E_L_E_T_=' ' AND D1_TIPO='D' AND F2_VALFAT > 0 "
		if Select("QDevol") > 0
			QDevol->(DbCloseArea())
		endif
		TcQuery cQuery new alias "QDevol"
		nQtdDevol := QDevol->QUANT
		
		//Faturamento Antecipado
		
		cQuery := " SELECT ROUND(SUM(C6_QTDVEN-C6_QTDENT),0) QUANT "
		cQuery += " FROM "+RetSqlName("SC6")
		cQuery += " LEFT JOIN "+RetSqlName("SC5")+" ON ( C5_FILIAL = C6_FILIAL AND C5_NUM = C6_NUM AND SC5010.D_E_L_E_T_=' ' ) "
		cQuery += " LEFT JOIN "+RetSqlName("SF4")+" ON ( F4_FILIAL = C6_FILIAL AND F4_CODIGO = C6_TES AND SF4010.D_E_L_E_T_=' ') "
		cQuery += " WHERE C6_FILIAL >= ' ' AND C6_NUM <= 'ZZZZ' "
		cQuery += " AND C6_PRODUTO ='"+QryProc->B1_COD+"' "
		cQuery += " AND C5_XPEDIDO<>' ' AND F4_ESTOQUE='S'  AND C6_CLI<>'C02641' AND C6_CLI<>'C02641' AND SC6010.D_E_L_E_T_=' '
		if Select("QAntecip") > 0
			QAntecip->(DbCloseArea())
		endif
		TcQuery cQuery new alias "QAntecip"
		nQtdAntecip := QAntecip->QUANT
		
		
		aRowExcel := {}
		aadd(aRowExcel,QRYProc->B1_COD)
		aadd(aRowExcel,QRYProc->B1_DESC)
		aadd(aRowExcel,nPrev_P1)
		aadd(aRowExcel,nReal_P1)
		aadd(aRowExcel,nNivServ)
		aadd(aRowExcel,nPrev_P2)
		aadd(aRowExcel,nReal_P2)
		aadd(aRowExcel,nFaltaPrd)
		aadd(aRowExcel,nSldAtu)
		aadd(aRowExcel,nEstAn0102)
		aadd(aRowExcel,nEstAn0103)
		aadd(aRowExcel,nEstRe0102)
		aadd(aRowExcel,nEstRe0103)
		aadd(aRowExcel,nSldLibTran)

		For nZ :=1 to Len(aEstLibFat)
			aadd(aRowExcel,aEstLibFat[nZ,2])
		Next nZ

		aadd(aRowExcel,nEstoqLiq)
		aadd(aRowExcel,nPedCart)
		aadd(aRowExcel,nQtdFatAtu)
		aadd(aRowExcel,nQtdFatAnt)
		aadd(aRowExcel,nQtdDevol)
		aadd(aRowExcel,nQtdAntecip)

		oExcel:AddRow(cWorkP1, "Relatorio", aRowExcel )

		DbSelectArea("QRYProc")
		DbSkip()
	Enddo

	QRYProc->(DbCloseArea())

	If !Empty(oExcel:aWorkSheet)
		cFileXML := ( FwTemporaryTable( NIL, .F. ) + ".xls" )
		While File( cFileXML )
			cFileXML := ( FwTemporaryTable( NIL, .F. ) + ".xls" )
		End While

		cFileXml := lower(cFileXml)

		oExcel:Activate()
		oExcel:GetXMLFile(cFileXML)
		oExcel:DeActivate()

		IF .NOT.( File( cFileXML ) )
			MsgStop("Falha ao tentar criar arquivo "+cFileXML)
			cFileXML := ""
			BREAK
		EndIF

		cLocFile := AllTrim(mv_par07)

		

		IF .NOT.( __CopyFile( cFileXML , cLocFile ) )
			MsgStop("Falha ao tentar salvar arquivo "+cLocFile)
			fErase( cFileXML )
			cFileXML := ""
			BREAK
		EndIF

		oExcelApp := MsExcel():New()
		oExcelApp:WorkBooks:Open(cLocFile) // Abre uma planilha
		oExcelApp:SetVisible(.T.)
		oExcelApp:Destroy()
		ApMsgInfo("Arquivo "+cLocFile+" gerado com sucesso !!!")
	Else
		MsgAlert("Nใo hแ valores para exporta็ใo.","")
	EndIf



	RestArea(aArea)
return






Static Function ValidPerg(cPerg)
	Local _sAlias,i,j
	_sAlias := Alias()
	//Retirado Sangelles 22/03/2022 ->dbSelectArea("SX1")
	//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
	cPerg := PADR(cPerg,10)
	aRegs:={}                                                  
	// Grupo/Ordem/Pergunta/Variavel/Tipo/Tamanho/Decimal/Presel/GSC/Valid/Var01/Def01/Cnt01/Var02/Def02/Cnt02/Var03/Def03/Cnt03/Var04/Def04/Cnt04/Var05/Def05/Cnt05/f3
	AADD(aRegs,{cPerg,"01","Do Produto         ","","","mv_ch1","C",TamSX3("B1_COD")[1],0,0,"G","","mv_par01","","","","","","","","","","","","","","","","","","","","","","","","","SB1","","","","",""})
	AADD(aRegs,{cPerg,"02","Ate o Produto      ","","","mv_ch2","C",TamSX3("B1_COD")[1],0,0,"G","","mv_par02","","","","","","","","","","","","","","","","","","","","","","","","","SB1","","","","",""})
	AADD(aRegs,{cPerg,"03","Da Data (Periodo 1)","","","mv_ch3","D",8,0,0,"G","","mv_par03","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""})
	AADD(aRegs,{cPerg,"04","Ate Data(Periodo 1)","","","mv_ch4","D",8,0,0,"G","","mv_par04","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""})
	AADD(aRegs,{cPerg,"05","Da Data (Periodo 2)","","","mv_ch5","D",8,0,0,"G","","mv_par05","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""})
	AADD(aRegs,{cPerg,"06","Ate Data(Periodo 2)","","","mv_ch6","D",8,0,0,"G","","mv_par06","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""})
	AADD(aRegs,{cPerg,"07","Salvar Planilha em ","","","mv_ch7","C",60,0,0,"G","","mv_par07","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""})


	For i:=1 to Len(aRegs)
		cPulaLinha	:= chr(13)+chr(10)
		cQry			:= ""
		// verifico se nao existe este alias criado
		If Select("TMP") > 0
			TMP->(DbCloseArea())
		EndIf
		cQry := " SELECT * FROM " 				  + cPulaLinha
		cQry += " " + RetSqlName("SX1") + " SX1 " + cPulaLinha
		cQry += " WHERE " 						  + cPulaLinha
		cQry += " SX1.D_E_L_E_T_	<> '*' " 	  + cPulaLinha
		cQry += " AND X1_FILIAL = '" + xFilial("SX1") 	+ "' " + cPulaLinha
		cQry += " AND X1_GRUPO = '" +cPerg+StrZero(i,2)+ "' "	+ cPulaLinha

		TcQuery cQry New Alias "TMP" // Cria uma nova area com o resultado do query   
	
		if empty(TMP->X1_GRUPO)
		
			RecLock("SX1",.T.)
			For j:=1 to FCount()
				FieldPut(j,aRegs[i,j])
			Next
			MsUnlock()
			dbCommit()
		EndIf
	Next
	dbSelectArea(_sAlias)
Return
