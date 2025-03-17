#INCLUDE "TOTVS.CH"
#INCLUDE "REPORT.CH"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT040   บAutor  ณGuilherme Fran็a    บ Data ณ  23/08/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Planilha de conferencia do fechamento mensal              บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function RGLT040()

Private cPerg := "PRGLT040"
Private _cEveCred := AllTrim(SuperGETMV("LT_EVECRED",,"300001")) //Evento utilizado no titulo aglutinado de credito
Private _cEveDeb := AllTrim(SuperGETMV("LT_EVEDEB",,"300002")) //Evento utilizado no titulo aglutinado de debito
Private _cEveINSS := AllTrim(SuperGETMV("LT_EVEINSS",,"120001")) //Codigo do evento de INSS (Funrural)

CriaSX1()

If !Pergunte(cPerg,.T.)
	Return
EndIf

MsgInfo("Este relat๓rio ้ melhor visualizado em impressใo Planilha, devido ao volume de inform็a๕es!","Formato de Impressใo")

oReport := ReportDef()
oReport:PrintDialog()

Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณReportDef บAutor  ณMicrosiga           บ Data ณ  24/02/2016 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Defini็ใo do lay-out do relatorio.                         บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ReportDef()

Local oReport
Local oDetalhe
Private _lAcerto := .F.
Private _cAlias := GetNextAlias()
Private cAliasEve := "EVE"
Private cAliasFin := "FIN"
Private aOrd := {"Nome","Codigo","Grupo Preco"}

Eventos() //Gera lista dos eventos que irใo virar celulas do relatorio

//DbSelectArea(cAliasEve)
//(cAliasEve)->(DbGoTop())


DEFINE REPORT oReport NAME "RGLT040" TITLE "Conferencia do fechamento mensal." PARAMETER cPerg ACTION {|oReport| PrintReport(oReport)}

oReport:SetLandscape()
oReport:SetTotalInLine(.F.)
oReport:nFontBody := 10   

DEFINE SECTION oDetalhe OF oReport  TITLE "Detalhes" ORDERS aOrd
oDetalhe:SetTotalInLine(.F.)

DEFINE CELL NAME "CODIGO" 		OF oDetalhe ALIAS "ZLF"	TITLE "C๓digo"  		// 01
DEFINE CELL NAME "LOJA" 		OF oDetalhe ALIAS "ZLF" TITLE "Loja"  			// 02
DEFINE CELL NAME "NOME" 		OF oDetalhe ALIAS "ZLF" TITLE "Nome"  			// 03

DEFINE CELL NAME "QTD_LEITE" 		OF oDetalhe ALIAS ""  	TITLE "Qtd. Leite" PICTURE "@E 99,999,999"  SIZE 14 	// 04

DEFINE CELL NAME "PRECO" 			OF oDetalhe ALIAS ""  	TITLE "Pr็.Unit.Brt." PICTURE "@E 9.9999"  SIZE 8    	// 05
DEFINE CELL NAME "PRECOL" 			OF oDetalhe ALIAS ""  	TITLE "Pr็.Unit.Liq." PICTURE "@E 9.9999"  SIZE 8    	// 05
DEFINE CELL NAME "VALOR" 			OF oDetalhe ALIAS ""  	TITLE "Valor Bruto" PICTURE "@E 99,999,999.99"  SIZE 16


If MV_PAR05 == 1
	//Celulas com eventos de precifica็ใo
	(cAliasEve)->(DbGoTop())
	While !(cAliasEve)->(Eof())
		_lAcerto := (cAliasEve)->ZLF_ACERTO == 'S' //Identifica se jแ rodou acerto do leite
		If Alltrim((cAliasEve)->EVENTO) <> _cEveINSS
			If (cAliasEve)->ORDEM == 1 .or. (cAliasEve)->ORDEM == 2
				DEFINE CELL NAME Alltrim((cAliasEve)->EVENTO)	OF oDetalhe ALIAS ""  	TITLE (cAliasEve)->NOME PICTURE "@E 9.9999"  SIZE 8
			EndIf
		Endif
		(cAliasEve)->(DbSkip())
	EndDo
EndIf	


//Celulas com eventos de cr้dito
(cAliasEve)->(DbGoTop())
While !(cAliasEve)->(Eof())
	If Alltrim((cAliasEve)->EVENTO) <> _cEveINSS
		If (cAliasEve)->ORDEM == 4
			DEFINE CELL NAME Alltrim((cAliasEve)->EVENTO)	OF oDetalhe ALIAS ""  	TITLE (cAliasEve)->NOME PICTURE "@E 9,999,999.99"  SIZE 14
		EndIf
	EndIf
	(cAliasEve)->(DbSkip())
EndDo

(cAliasEve)->(DbGoTop())
//Celulas com eventos de Debitos
While !(cAliasEve)->(Eof())
	If Alltrim((cAliasEve)->EVENTO) <> _cEveINSS
		If (cAliasEve)->ORDEM == 3 .or. (cAliasEve)->ORDEM == 5
			DEFINE CELL NAME Alltrim((cAliasEve)->EVENTO)	OF oDetalhe ALIAS ""  	TITLE (cAliasEve)->NOME PICTURE "@E 9,999,999.99"  SIZE 14
		EndIf
	EndIf
	(cAliasEve)->(DbSkip())
EndDo

(cAliasEve)->(DbGoTop())
//Celulas com o evento de Funrural por ๚ltimo
While !(cAliasEve)->(Eof())
	If Alltrim((cAliasEve)->EVENTO) == _cEveINSS
		DEFINE CELL NAME Alltrim((cAliasEve)->EVENTO)	OF oDetalhe ALIAS ""  	TITLE (cAliasEve)->NOME PICTURE "@E 99,999.9999"  SIZE 14
	EndIf
	(cAliasEve)->(DbSkip())
EndDo


If !_lAcerto // Se nใo realizou acerto, busca dados do financeiro
	EventFin()
	While !(cAliasFin)->(Eof())
		DEFINE CELL NAME Alltrim((cAliasFin)->EVENTO)	OF oDetalhe ALIAS ""  	TITLE (cAliasFin)->NOME PICTURE "@E 99,999.9999"  SIZE 14
		(cAliasFin)->(DbSkip())
	EndDo
EndIf

DEFINE CELL NAME "LIQUIDO" 			OF oDetalhe ALIAS ""  	TITLE "Lํquido"  PICTURE "@E 99,999,999.99"  SIZE 16
DEFINE CELL NAME "FORMA" 			OF oDetalhe ALIAS ""  	TITLE "Forma.Pgto"

DEFINE CELL NAME "NRONF" 	 	    OF oDetalhe ALIAS ""  	TITLE "Nro. N.F. "

Return(oReport)  
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณPrintReport   บAutor  ณMicrosiga       บ Data ณ  11/24/15   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function PrintReport(oReport)

Local _nReg  	:= 0
Local oDetalhe	:= oReport:Section(1)
Local _lImpDif  := .f.
Local _cRetiro	:= ""
Local _cLoja    := ""
Local _nDebito, _nCredito
Local _nQtd := 0
Local _nLiquido := 0
Local _nPreco := 0
Local _cAlias := GetNextAlias()
Local _cAliasFin := GetNextAlias()
Local _nVlrImp := 0
Local _nPrcImp := 0
Local _nVlrINSS := 0
Local _lAcerto := .t.

CriaTab(_cAlias,oDetalhe)

dbSelectArea(_cAlias)
Count to _nReg

LimpaDet(@oDetalhe)

(_cAlias)->(dbGoTop())
oDetalhe:Init()

While !(_cAlias)->(Eof())
	
	If Alltrim(_cRetiro+_cLoja) <> Alltrim((_cAlias)->CODIGO + (_cAlias)->LOJA)
		
		oDetalhe:Cell("CODIGO"):SetValue((_cAlias)->CODIGO)
		oDetalhe:Cell("LOJA"):SetValue((_cAlias)->LOJA)
		oDetalhe:Cell("NOME"):SetValue((_cAlias)->NOME)
		oDetalhe:Cell("QTD_LEITE"):SetValue((_cAlias)->QTD)

		_cRetiro := (_cAlias)->CODIGO
		_cLoja   := (_cAlias)->LOJA
		_nQtd := (_cAlias)->QTD
		_nPreco := 0				
		_nLiquido := 0
	
		oDetalhe:Cell("NRONF"):SetValue(GetNF(_cRetiro, _cLoja))
		
		_lAcerto := (_cAlias)->ZLF_ACERTO == 'S' //Identifica se jแ rodou acerto do leite
	EndIf
	

	If Alltrim((_cAlias)->EVENTO) == _cEveINSS
		_nVlrINSS := (_cAlias)->VALOR
	EndIf

	_nVlrImp := (_cAlias)->VALOR
	_nPrcImp := (_cAlias)->PRECO

	
	oDetalhe:Cell(Alltrim((_cAlias)->EVENTO)):SetValue(IIF(_nPrcImp<>0,_nPrcImp,_nVlrImp) )
	_nPreco   += _nPrcImp
	_nLiquido += _nVlrImp

	_nVlrImp := 0
	_nPrcImp := 0


	(_cAlias)->(dbSkip())
	
	If Alltrim(_cRetiro+_cLoja) <> Alltrim((_cAlias)->CODIGO + (_cAlias)->LOJA)
		
		If !_lAcerto // Se o relatorio for gerado antes do fechamento do leite, gera colunas de dados do financeiro
			CriaFin(_cAliasFin,_cRetiro,_cLoja)
			While !(_cAliasFin)->(Eof())
				oDetalhe:Cell(Alltrim((_cAliasFin)->EVENTO)):SetValue((_cAliasFin)->VALOR*-1 )

				_nLiquido += (_cAliasFin)->VALOR * -1

				(_cAliasFin)->(DbSkip())
			EndDo
		EndIf
		


		_nLiquido -= _nVlrINSS
		// Cแlculo das colunas
		oDetalhe:Cell("PRECO"):SetValue(_nPreco)		
		oDetalhe:Cell("PRECOL"):SetValue(_nPreco - (_nVlrINSS/_nQtd)) //Valor unitario menos o funrural		
		oDetalhe:Cell("VALOR"):SetValue(_nPreco*_nQtd)		
		oDetalhe:Cell("LIQUIDO"):SetValue(_nLiquido)		

		dbSelectArea("SA2")
		SA2->(dbSetOrder(1))
		SA2->(dbSeek(xFilial("SA2") + _cRetiro + _cLoja ) )
		
		If SA2->A2_L_TPPAG == "B"
			oDetalhe:Cell("FORMA"):SetValue("Banco")
		Else
			oDetalhe:Cell("FORMA"):SetValue("Cheque")
		EndIf
		
		_nVlrINSS := 0
		
		oDetalhe:PrintLine()
		
		LimpaDet(@oDetalhe)
		
	EndIf
	
EndDo

oDetalhe:Finish()

Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณCriaTab บAutor  ณMicrosiga             บ Data ณ  04/11/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Cria tabela temporแria para impressใo do relat๓rio.        บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function CriaTab(_cAlias,oObj)

Local nOrdem := 1
Local cOrdem := ""
Local _cFiltro := "% ZLF_EVENTO NOT IN ('"+_cEveDeb+"','"+_cEveCred+"') %"

nOrdem := oObj:GetOrder()

If nOrdem == 1
	cOrdem := "% ZLF_A2NOME,ZLF_RETIRO,ZLF_RETILJ,ZLF_LINROT %"
ElseIf nOrdem == 2
	cOrdem := "% ZLF_RETIRO,ZLF_RETILJ,ZLF_A2NOME,ZLF_LINROT %"
Else
	cOrdem := "% ZLF_LINROT,ZLF_A2NOME,ZLF_RETIRO,ZLF_RETILJ %"
EndIf

BeginSql Alias _cAlias

	SELECT ZLF_RETIRO AS CODIGO,ZLF_RETILJ AS LOJA,ZLF_A2NOME AS NOME, ZLF_EVENTO AS EVENTO, MAX(ZLF_DEBCRE) AS DEBCRE, ZLF_QTDBOM AS QTD,ZLF_LINROT AS GRUPO,
		SUM(CASE WHEN ZLF_DEBCRE = 'C' THEN (ZLF_TOTAL+ZLF_SE1ACR) ELSE -(ZLF_TOTAL+ZLF_SE1ACR) END) AS VALOR,
		SUM(CASE WHEN ZLF_DEBCRE = 'C' THEN ZLF_VLRLTR ELSE -ZLF_VLRLTR END) AS PRECO,ZLF_ACERTO
		FROM %Table:ZLF% ZLF 
	WHERE ZLF.ZLF_FILIAL = %xFilial:ZLF% 
	AND ZLF_CODZLE = %Exp:MV_PAR01% 
	AND ZLF_SETOR = %Exp:MV_PAR02% 
	AND ZLF_RETIRO  BETWEEN %Exp:MV_PAR03% AND %Exp:MV_PAR04%
	AND %Exp:_cFiltro%
	AND ZLF.%NotDel%
	GROUP BY ZLF_RETIRO,ZLF_RETILJ,ZLF_A2NOME, ZLF_EVENTO,ZLF_LINROT,ZLF_QTDBOM, ZLF_ACERTO
	ORDER BY %Exp:cOrdem%
	
EndSql

//memowrite("c:\query1.sql",GetLastQuery()[2])


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณCriaFin บAutor  ณMicrosiga             บ Data ณ  23/11/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Cria tabela temporแria para impressใo do relat๓rio.        บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function CriaFin(cAliasFin,xcRetiro,xcLoja)

Local _cFiltro := ""

If Select(cAliasFin) <> 0
	(cAliasFin)->(DbCloseArea())
EndIf

dbSelectArea("ZLE")
ZLE->(dbSetOrder(1))
ZLE->(dbSeek(xFilial("ZLE")+MV_PAR01))
_dDtIni := ZLE->ZLE_DTINI
_dDtFim := DaySum(ZLE->ZLE_DTFIM,30) //soma 30 dias para vencimento final

_cFiltro := "% E1_VENCTO BETWEEN '"+DTOS(_dDtIni)+"' AND '"+DTOS(_dDtFim)+"'  %"


BeginSql Alias cAliasFin

	SELECT E1_L_EVENT AS EVENTO, SUM(E1_SALDO+E1_SDACRES) AS VALOR
	FROM %Table:SE1% SE1
		JOIN %Table:ZL8% ZL8 ON ZL8_FILIAL = %xFilial:ZL8% AND ZL8_COD = E1_L_EVENT AND ZL8.%NotDel%
	WHERE SE1.E1_FILIAL = %xFilial:SE1%
	AND E1_CLIENTE = %Exp:xcRetiro%
	AND E1_LOJA = %Exp:xcLoja%
	AND %Exp:_cFiltro%
	AND SE1.E1_SALDO > 0
	AND SE1.E1_L_EVENT <> ' '
	GROUP BY E1_L_EVENT
	ORDER BY E1_L_EVENT 
EndSql

//memowrite("c:\query2.sql",GetLastQuery()[2])
Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณEventos   บAutor  ณMicrosiga           บ Data ณ  22/08/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function Eventos()

Local _cFiltro := "% ZLF_EVENTO NOT IN ('"+_cEveDeb+"','"+_cEveCred+"') %"

If Select(cAliasEve) <> 0
	(cAliasEve)->(DbCloseArea())
EndIf

BeginSql alias cAliasEve


	SELECT ZLF_EVENTO AS EVENTO,MAX(ZLF_DEBCRE) AS DEBCRE,
	ZL8_GRUPO AS GRUPO,ZL8_NREDUZ AS NOME, ZL8_TPEVEN AS TIPO, ZL8_MIX AS ENTMIX, ZLF_ACERTO,
		CASE WHEN ZL8_TPEVEN = 'L' THEN 1 
				WHEN ZL8_TPEVEN = 'R' THEN 2 			
				WHEN ZL8_TPEVEN = 'A' THEN 3 
				WHEN ZL8_TPEVEN = 'F' AND ZL8_DEBCRE = 'C' THEN 4
				WHEN ZL8_TPEVEN = 'F' AND ZL8_DEBCRE = 'D' THEN 5			
				END AS ORDEM
	FROM %Table:ZLF% ZLF
		JOIN %Table:ZL8% ZL8 ON ZL8_FILIAL = %xFilial:ZL8% AND ZL8_COD = ZLF_EVENTO AND ZL8.%NotDel%
	WHERE ZLF.ZLF_FILIAL = %xFilial:ZLF%
	AND ZLF.ZLF_CODZLE =  %Exp:MV_PAR01%
	AND ZLF.ZLF_SETOR = %Exp:MV_PAR02%
	AND ZLF.ZLF_TP_MIX = 'L' 
	AND %Exp:_cFiltro%
	AND ZLF.%NotDel%
	GROUP BY ZLF_EVENTO ,ZL8_GRUPO,ZL8_NREDUZ, ZL8_TPEVEN, ZL8_MIX,ZL8_DEBCRE, ZLF_ACERTO
	ORDER BY ORDEM,ZLF_EVENTO

EndSql	

//memowrite("c:\query3.sql",GetLastQuery()[2])
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณEventFin   บAutor  ณMicrosiga           บ Data ณ  22/08/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function EventFin()

Local _cFiltro := ""
Local _dDtIni	:= ""
Local _dDtFim	:= ""

If Select(cAliasFin) <> 0
	(cAliasFin)->(DbCloseArea())
EndIf

dbSelectArea("ZLE")
ZLE->(dbSetOrder(1))
ZLE->(dbSeek(xFilial("ZLE")+MV_PAR01))
_dDtIni := ZLE->ZLE_DTINI
_dDtFim := DaySum(ZLE->ZLE_DTFIM,30) //soma 30 dias para vencimento final

_cFiltro := "% E1_VENCTO BETWEEN '"+DTOS(_dDtIni)+"' AND '"+DTOS(_dDtFim)+"'  %"

BeginSql alias cAliasFin


	SELECT E1_L_EVENT AS EVENTO, 'D' AS DEBCRE,
	ZL8_GRUPO AS GRUPO,ZL8_NREDUZ AS NOME, ZL8_TPEVEN AS TIPO, ZL8_MIX AS ENTMIX, 
		CASE WHEN ZL8_TPEVEN = 'L' THEN 1 
				WHEN ZL8_TPEVEN = 'R' THEN 2 			
				WHEN ZL8_TPEVEN = 'A' THEN 3 
				WHEN ZL8_TPEVEN = 'F' AND ZL8_DEBCRE = 'C' THEN 4
				WHEN ZL8_TPEVEN = 'F' AND ZL8_DEBCRE = 'D' THEN 5			
				END AS ORDEM
	FROM %Table:SE1% SE1
		JOIN %Table:ZL8% ZL8 ON ZL8_FILIAL = %xFilial:ZL8% AND ZL8_COD = E1_L_EVENT AND ZL8.%NotDel%
	WHERE SE1.E1_FILIAL = %xFilial:SE1%
	AND E1_SALDO > 0
	AND E1_CLIENTE BETWEEN %Exp:MV_PAR03% AND %Exp:MV_PAR04%
	AND %Exp:_cFiltro%
	AND SE1.E1_L_EVENT <> ' '
	GROUP BY E1_L_EVENT ,ZL8_GRUPO,ZL8_NREDUZ, ZL8_TPEVEN, ZL8_MIX,ZL8_DEBCRE
	ORDER BY ORDEM,E1_L_EVENT

EndSql	

//memowrite("c:\query4.sql",GetLastQuery()[2])
Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณLimpaDet  บAutor  ณMicrosiga           บ Data ณ  04/11/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Limpa c้lulas da sessใo oDetalhe.                          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function LimpaDet(oDetalhe)

Local nTamanho := Len(oDetalhe:aCell)
// Limpa os dados das c้lulas do relat๓rio.
For _iCol := 1 to nTamanho
 If oDetalhe:Cell(_iCol):cType == "D"
  oDetalhe:Cell(_iCol):SetValue(CtoD("  /  /  "))
 ElseIf oDetalhe:Cell(_iCol):cType == "C"
  oDetalhe:Cell(_iCol):SetValue("")
 Else
  oDetalhe:Cell(_iCol):SetValue(0)
 EndIf
Next _iCol

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGetNF บAutor  ณMicrosiga               บ Data ณ  04/11/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna n๚mero da nota fiscal de compra de leite.          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GetNF(_pcProdutor, _pcLoja)

Local _cRetorno := ""
Local _cArq   := GetNextAlias()

BeginSql Alias _cArq
	
	SELECT F1_DOC
	
	FROM %Table:SF1% SF1
	
	WHERE F1_FILIAL >= ' '
	AND F1_FORNECE = %Exp:_pcProdutor%
	AND F1_LOJA    = %Exp:_pcLoja%
	AND F1_L_MIX  = %Exp:MV_PAR01%
	AND SF1.D_E_L_E_T_ = ' '
	
EndSql 

memowrite("c:\query5.sql",GetLastQuery()[2])          

dbSelectArea(_cArq)
(_cArq)->(dbGoTop())

_cRetorno := (_cArq)->F1_DOC

(_cArq)->(dbCloseArea())

If Empty(_cRetorno)
	_cRetorno := "ABERTO"
EndIf

Return(_cRetorno)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ CriaSX1  บ Autor ณ TOTVS              บ Data ณ  14/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para criacao das perguntas caso elas nao existam.   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function CriaSX1()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

//Do Mix
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo do Mix.   ')
Aadd( aHelpPor, '.                      ')
U_xPutSx1(cPerg,"01","Do Mix"," "," ","mv_ch1","C",6,0,0,"G","","ZLE_01","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Setor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo do Setor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"02","Setor   "," "," ","mv_ch2","C",6,0,0,"G",'U_ValSetPar()',"ZL2_01","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


//Do Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"03","Do Produtor"," "," ","mv_ch3","C",6,0,0,"G","","SA2_L4","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final do produtor')
Aadd( aHelpPor, 'que deseja filtrar.               ')
U_xPutSx1(cPerg,"04","Ate Produtor"," "," ","mv_ch4","C",6,0,0,"G","","SA2_L4","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Imprime Produtor sem movimento de leite
aHelpPor := {}
Aadd( aHelpPor, 'Informe SIM para demonstrar adicionais')
Aadd( aHelpPor, 'e redutores de qualidade na forma็ao  ')
Aadd( aHelpPor, 'do pre็o.   ')
U_xPutSx1(cPerg,"05","Detalha pre็o?","","","mv_ch5","C",1,0,0,"C",'',"","","","MV_PAR05","Sim","","","","Nao","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

/*
//Imprime Produtor sem movimento de leite
aHelpPor := {}
Aadd( aHelpPor, 'Informe SIM para demonstrar adicionais')
Aadd( aHelpPor, 'e redutores de qualidade na forma็ao  ')
Aadd( aHelpPor, 'do pre็o.   ')
U_xPutSx1(cPerg,"06","Detalha pre็o?","","","mv_ch6","C",1,0,0,"C",'',"","","","MV_PAR06","Aberto","","","","Nao","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
*/

Return
