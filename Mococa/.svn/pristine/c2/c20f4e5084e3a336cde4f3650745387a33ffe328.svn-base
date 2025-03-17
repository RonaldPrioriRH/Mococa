#INCLUDE "Protheus.ch"
#INCLUDE "Report.ch"
#INCLUDE "TopConn.ch"
#INCLUDE "RwMake.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT041   บAutor  ณGuilherme Fran็a    บ Data ณ  23/08/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Relatorio da media de pre็o mensal de todas as filiais    บฑฑ
ฑฑบ          ณ somando o valor do frete.                                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function RGLT041()

Private cPerg := "PRGLT041"

AjustaSX1()

If !Pergunte(cPerg,.T.)
	Return
EndIf


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
Private _cAlias := GetNextAlias()
//Private aOrd := {"Nome","Codigo","Grupo Preco"}



DEFINE REPORT oReport NAME "RGLT041" TITLE "M้dia Pre็o Mensal" PARAMETER cPerg ACTION {|oReport| PrintReport(oReport)}

oReport:nLineHeight	:= 45            // Define a altura da linha.
//oReport:CFONTBODY   := "Courier New" // Define a fonte do relatorio
oReport:lParamPage		:= .F.
//oReport:lHeaderVisible 	:= .F.
//oReport:lFooterVisible 	:= .F.
oReport:SetLandscape(.t.)
oReport:GetOrientation(2)
oReport:SetTotalInLine(.F.)
oReport:nFontBody := 8

DEFINE SECTION oCab OF oReport TITLE "Cabe็alho" TABLES "ZLD"
DEFINE CELL NAME "CABEC" 		OF oCab ALIAS "" TITLE " " block {|| PadR("Resultado consolidado de todas as filiais do mix: "+MV_PAR01) } SIZE 150


DEFINE SECTION oDetalhe OF oCab  TITLE "Detalhes"
//ORDERS aOrd

DEFINE CELL NAME "SETOR" 		OF oDetalhe ALIAS "" TITLE "Setor"  	SIZE 15	// 01
DEFINE CELL NAME "NOMSET" 		OF oDetalhe ALIAS "" TITLE "Descricao"  SIZE 30			// 02
DEFINE CELL NAME "QTD" 			OF oDetalhe ALIAS "" TITLE "Litragem"   PICTURE "@E 99,999,999"  SIZE 16
DEFINE CELL NAME "MIXLTE" 		OF oDetalhe ALIAS "" TITLE "Mix Leite"	PICTURE "@E 9.99999"  SIZE 10
DEFINE CELL NAME "MIXFRT" 		OF oDetalhe ALIAS "" TITLE "Mix Frete"	PICTURE "@E 9.99999"  SIZE 10
DEFINE CELL NAME "MIXTOT" 		OF oDetalhe ALIAS "" TITLE "Mix Final"	PICTURE "@E 9.99999"  SIZE 10
DEFINE CELL NAME "VLRLTE" 		OF oDetalhe ALIAS "" TITLE "Valor Leite" PICTURE "@E 99,999,999.99"  SIZE 20
DEFINE CELL NAME "VLRFRT" 		OF oDetalhe ALIAS "" TITLE "Valor Frete" PICTURE "@E 99,999,999.99"  SIZE 20
DEFINE CELL NAME "VALOR" 		OF oDetalhe ALIAS "" TITLE "Valor Pagar" PICTURE "@E 99,999,999.99"  SIZE 20



//Desenha as bordas das celulas
For nI := 1 To 9
	//Monta as bordas
	oDetalhe:Cell(nI):SetBorder("LEFT")
	oDetalhe:Cell(nI):SetBorder("TOP")
	oDetalhe:Cell(nI):SetBorder("RIGHT")
	oDetalhe:Cell(nI):SetBorder("BOTTOM")
	//Alinha as bordas
	oDetalhe:Cell(nI):SetHeaderAlign("CENTER")
	oDetalhe:Cell(nI):SetAlign("CENTER")
Next nI

//Define cor para celula
//oDetalhe:Cell("MIXTOT"):SetClrBack(2556095)


oDetalhe:SetTotalInLine(.F.)

/*
oDetalhe:SetTotalText("TOTAL LINHA:") //seta texto padrao que sera impresso

DEFINE FUNCTION FROM oDetalhe:Cell("QTD") OF oCab FUNCTION SUM
DEFINE FUNCTION FROM oDetalhe:Cell("MIXLTE") OF oCab FUNCTION AVERAGE
DEFINE FUNCTION FROM oDetalhe:Cell("MIXFRT") OF oCab FUNCTION AVERAGE
DEFINE FUNCTION FROM oDetalhe:Cell("MIXTOT") OF oCab FUNCTION AVERAGE
DEFINE FUNCTION FROM oDetalhe:Cell("VLRLTE") OF oCab FUNCTION SUM
DEFINE FUNCTION FROM oDetalhe:Cell("VLRFRT") OF oCab FUNCTION SUM
DEFINE FUNCTION FROM oDetalhe:Cell("VALOR") OF oCab FUNCTION SUM
*/

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


Local oDetalhe	:= oReport:Section(1):Section(1)
Local _cAlias := GetNextAlias()
Local _nTQtd := 0
Local _nTVlrLte := 0
Local _nTVlrFrt := 0

Private _aQtd := {}
Private _aValor := {}
Private _aFrete := {}

CriaTab()


LimpaDet(@oDetalhe)


oDetalhe:Init()

If Len(_aQtd)>0
	
	For ix:= 1 to Len(_aQtd)
		
		oDetalhe:Cell("SETOR"):SetValue(_aQtd[ix][1])
		oDetalhe:Cell("NOMSET"):SetValue(_aQtd[ix][2])
		oDetalhe:Cell("QTD"):SetValue(_aQtd[ix][3])
		oDetalhe:Cell("MIXLTE"):SetValue(_aValor[ix][2]/_aQtd[ix][3])
		oDetalhe:Cell("MIXFRT"):SetValue(_aFrete[ix][2]/_aQtd[ix][3])
		oDetalhe:Cell("MIXTOT"):SetValue((_aValor[ix][2]+_aFrete[ix][2])/_aQtd[ix][3])
		oDetalhe:Cell("VLRLTE"):SetValue(_aValor[ix][2])
		oDetalhe:Cell("VLRFRT"):SetValue(_aFrete[ix][2])
		oDetalhe:Cell("VALOR"):SetValue(_aValor[ix][2]+_aFrete[ix][2])
		
		_nTQtd += _aQtd[ix][3]
		_nTVlrLte += _aValor[ix][2]
		_nTVlrFrt += _aFrete[ix][2]

		oDetalhe:PrintLine()
		
		LimpaDet(@oDetalhe)
		
	Next ix
	
	// LEITE SPOT
	If MV_PAR02 > 0
		oDetalhe:Cell("SETOR"):SetValue("SPOT")
		oDetalhe:Cell("NOMSET"):SetValue("LEITE SPOT")
		oDetalhe:Cell("QTD"):SetValue(MV_PAR02)

		_nTQtd += MV_PAR02

		
		If MV_PAR03 >0
			oDetalhe:Cell("MIXLTE"):SetValue(MV_PAR03/MV_PAR02)
		Else
			oDetalhe:Cell("MIXLTE"):SetValue(0)
		EndIf
		
		If MV_PAR04 >0
			oDetalhe:Cell("MIXFRT"):SetValue(MV_PAR04/MV_PAR02)
		Else
			oDetalhe:Cell("MIXFRT"):SetValue(0)
		EndIf
		
		If MV_PAR03+MV_PAR04 > 0
			oDetalhe:Cell("MIXTOT"):SetValue((MV_PAR03+MV_PAR04)/MV_PAR02)
		Else
			oDetalhe:Cell("MIXTOT"):SetValue(0)
		EndIf
		
		oDetalhe:Cell("VLRLTE"):SetValue(MV_PAR03)
		_nTVlrLte += MV_PAR03
		
		oDetalhe:Cell("VLRFRT"):SetValue(MV_PAR04)
		_nTVlrFrt += MV_PAR04
		oDetalhe:Cell("VALOR"):SetValue(MV_PAR03+MV_PAR04)
		
		oDetalhe:PrintLine()
		
	EndIf
	
	LimpaDet(@oDetalhe)
	
EndIf

//Totais
If _nTQtd > 0

	oDetalhe:Cell("SETOR"):Hide();oDetalhe:Cell("QTD"):Hide();oDetalhe:Cell("MIXLTE"):Hide();oDetalhe:Cell("MIXFRT"):Hide();oDetalhe:Cell("MIXTOT"):Hide();	oDetalhe:Cell("VLRLTE"):Hide();	oDetalhe:Cell("VLRFRT"):Hide();oDetalhe:Cell("VALOR"):Hide()

	oDetalhe:PrintLine()

	oDetalhe:Cell("SETOR"):Show();oDetalhe:Cell("QTD"):Show();oDetalhe:Cell("MIXLTE"):Show();oDetalhe:Cell("MIXFRT"):Show();oDetalhe:Cell("MIXTOT"):Show();	oDetalhe:Cell("VLRLTE"):Show();	oDetalhe:Cell("VLRFRT"):Show();oDetalhe:Cell("VALOR"):Show()

	oDetalhe:Cell("SETOR"):SetValue("Resultado Final -->")
	oDetalhe:Cell("QTD"):SetValue(_nTQtd)
	oDetalhe:Cell("MIXLTE"):SetValue(_nTVlrLte/_nTQtd)
	oDetalhe:Cell("MIXFRT"):SetValue(_nTVlrFrt/_nTQtd)
	oDetalhe:Cell("MIXTOT"):SetValue((_nTVlrLte+_nTVlrFrt)/_nTQtd)
	oDetalhe:Cell("VLRLTE"):SetValue(_nTVlrLte)
	oDetalhe:Cell("VLRFRT"):SetValue(_nTVlrFrt)
	oDetalhe:Cell("VALOR"):SetValue(_nTVlrLte+_nTVlrFrt)
	
	oDetalhe:PrintLine()
	LimpaDet(@oDetalhe)
EndIf

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
Static Function CriaTab()


Local _cFiltro := ""
Local _cNotIn := ""
/*
If !Empty(MV_PAR05)
	If AT(",",MV_PAR05) > 0
		_cNotIn := StrTran(Alltrim(MV_PAR05),",","','")
	EndIf
	If AT("/",MV_PAR05) > 0
		_cNotIn := StrTran(Alltrim(MV_PAR05),"/","','")
	EndIf
	If AT(";",MV_PAR05) > 0
		_cNotIn := StrTran(Alltrim(MV_PAR05),"/","','")
	EndIf
	_cNotIn := "('"+_cNotIn+"')"
EndIf
*/	
	

dbSelectArea("ZLE")
ZLE->(dbSetOrder(1))
ZLE->(dbSeek(xFilial("ZLE")+MV_PAR01))

_cFiltro := "%	'"+DTOS(ZLE->ZLE_DTINI)+"' AND '"+DTOS(ZLE->ZLE_DTFIM)+"'  "
//If !Empty(MV_PAR05)
//_cFiltro += " AND ZLD_RETIRO NOT IN "+_cNotIn
//EndIf
_cFiltro += " %"

// Select para buscar quantidades do MIX
BeginSql alias "TQTD"
	
	SELECT ZLD_FILIAL AS SETOR,L2.ZL2_DESCRI AS DESCRI, SUM(ZLD_QTDBOM) AS QTD
	FROM %Table:ZLD% ZLD
	JOIN %Table:ZL2% L2 ON ZL2_FILIAL = ZLD_FILIAL AND ZL2_COD = ZLD_SETOR AND L2.%NotDel%
	WHERE ZLD_DTCOLE BETWEEN %Exp:_cFiltro%
	AND ZLD.%NotDel%
	GROUP BY ZLD_FILIAL,ZL2_DESCRI
	ORDER BY ZLD_FILIAL
EndSql

DbSelectArea("TQTD")
("TQTD")->(DbGoTop())

//Preenche array de quantidade
While !("TQTD")->(Eof())
	AADD(_aQtd,{("TQTD")->SETOR,("TQTD")->DESCRI,("TQTD")->QTD})
	("TQTD")->(DbSkip())
EndDo

// Select para buscar valor do mix
_cFiltro := "% %"
//If !Empty(MV_PAR05)
//	_cFiltro := "% AND ZLF_RETIRO NOT IN "+_cNotIn+" %"
//EndIf



BeginSql alias "TVLR"
	
	SELECT ZLF_FILIAL AS FILIAL,SUM(CASE WHEN ZLF_DEBCRE = 'C' THEN ZLF_TOTAL ELSE -ZLF_TOTAL END) AS VALOR
	FROM %Table:ZLF% ZLF
	WHERE ZLF_CODZLE = %Exp:MV_PAR01%
	AND ZLF_ORIGEM = 'M'
	%Exp:_cFiltro%
	AND ZLF.%NotDel%
	GROUP BY ZLF_FILIAL
	ORDER BY ZLF_FILIAL
	
EndSql

DbSelectArea("TVLR")
("TVLR")->(DbGoTop())

//Preenche array de valor
While !("TVLR")->(Eof())
	AADD(_aValor,{("TVLR")->FILIAL,("TVLR")->VALOR})
	("TVLR")->(DbSkip())
EndDo


// Select para buscar frete
BeginSql alias "TFRT"
 
	SELECT ZM1_FILIAL AS FILIAL, ZM1_MIX, 
	SUM(CASE WHEN ZM1_DEBCRE = 'C' THEN ZM1_VLRTOT ELSE -ZM1_VLRTOT END) AS VALOR 
	FROM %Table:ZM1% ZM1
	WHERE ZM1_MIX = %Exp:MV_PAR01% 
	AND ZM1.%NotDel% 
	GROUP BY ZM1_FILIAL, ZM1_MIX
/*
	SELECT ZLP_SETOR AS SETOR, SUM(ZLP_VALOR) AS VALOR
	FROM %Table:ZLP% ZLP
	WHERE ZLP_MIX = %Exp:MV_PAR01%
	AND ZLP.%NotDel%
	GROUP BY ZLP_SETOR
*/
EndSql


DbSelectArea("TFRT")
("TFRT")->(DbGoTop())

//Preenche array de valor
While !("TFRT")->(Eof())
	AADD(_aFrete,{("TFRT")->FILIAL,("TFRT")->VALOR})
	("TFRT")->(DbSkip())
EndDo

//Tratamento para zerar frete caso nใo seja informado
If Len(_aFrete)<1
	DbSelectArea("TVLR")
	("TVLR")->(DbGoTop())
	
	//Preenche array de valor
	While !("TVLR")->(Eof())
		AADD(_aFrete,{("TVLR")->FILIAL,0})
		("TVLR")->(DbSkip())
	EndDo
	
EndIf

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



//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Funcao que monta a configuracao dos parametros(Perguntas)            ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Static Function AjustaSX1()


Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

Aadd( aHelpPor, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpPor, 'zado para filtrar os produtores.         ')
U_xPutSx1(cPerg,"01","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch1","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_02","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Aadd( aHelpPor, 'Informe o volume de leite SPOT.')
U_xPutSx1(cPerg,"02","Qtde. leite SPOT ?","Qtde. leite SPOT ?","Qtde. leite SPOT ?","mv_ch2","N",8,0,0,"G",'Positivo()',"","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Aadd( aHelpPor, 'Informe o valor de leite SPOT.')
U_xPutSx1(cPerg,"03","Valor leite SPOT (R$)?","Valor leite SPOT (R$)?","Valor leite SPOT (R$)?","mv_ch3","N",12,2,0,"G",'Positivo()',"","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Aadd( aHelpPor, 'Informe o valor do frete SPOT.')
U_xPutSx1(cPerg,"04","Valor frete SPOT (R$)?","Valor frete SPOT (R$)?","Valor frete SPOT (R$)?","mv_ch4","N",12,2,0,"G",'Positivo()',"","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
/*
Aadd( aHelpPor, 'Informe os codigos dos produtores MASTER')
Aadd( aHelpPor, 'que deverใo ser desconsiderados para os ')
Aadd( aHelpPor, 'calculos do relat๓rio. Ex: P00477,P00478 ')
PutSx1(cPerg,"05","Desconsidera produtores:","Desconsidera produtores:","","mv_ch5","C",40,0,0,"G",'',"","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
*/


Return

