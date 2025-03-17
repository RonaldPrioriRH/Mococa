#INCLUDE "TOTVS.CH"
#INCLUDE "REPORT.CH"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT065   บAutor  ณGuilherme Fran็a    บ Data ณ  27/07/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Planilha de conferencia do fechamento mensal carreteiro    บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function RGLT065()

Private cPerg := "PRGLT65"


CriaSX1()

If !Pergunte(cPerg,.T.)
	Return
EndIf
/*
MV_PAR01 := '000001'
MV_PAR02 := 'T00017'
MV_PAR03 := 'T00017'
*/
MsgInfo("Este relat๓rio ้ melhor visualizado em impressใo Planilha, devido ao volume de inform็a๕es!")

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
Local ix := 0
Local _cTitulo := ""
Private _cAlias := GetNextAlias()
Private cAliasEve := "EVE"
Private cAliasCel := "CEL"
Private aOrd := {"Nome","Codigo"}
Private _aCelulas := {}
Private _cCodIni := MV_PAR02
Private _cCodFim := MV_PAR03

DbSelectArea("ZLE")
DbSetOrder(1)
DbSeek(xFilial("ZLE")+MV_PAR01)
_cTitulo := "Folha de Pagamento Carreteiros - "+SubStr(DTOC(ZLE->ZLE_DTINI),4,7)+" - "+Alltrim(SM0->M0_FILIAL)

_aCelulas := Celulas() //Gera lista dos eventos que irใo virar celulas do relatorio

If Len(_aCelulas) == 1
	MsgInfo("Nใo existem dados para o relat๓rio! Verifique os parโmetros")
	Return
EndIf

DEFINE REPORT oReport NAME "RGLT065" TITLE _cTitulo PARAMETER cPerg ACTION {|oReport| PrintReport(oReport)}

oReport:SetLandscape()
oReport:SetTotalInLine(.F.)
oReport:nFontBody := 10   
oReport:lParamPage	:= .F.

DEFINE SECTION oDetalhe OF oReport  TITLE "Detalhes" ORDERS aOrd
oDetalhe:SetTotalInLine(.F.)

DEFINE CELL NAME "CODIGO" 		OF oDetalhe ALIAS "ZM0"	TITLE "C๓digo"  		// 01
DEFINE CELL NAME "LOJA" 		OF oDetalhe ALIAS "ZM0" TITLE "Loja"  			// 02
DEFINE CELL NAME "NOME" 		OF oDetalhe ALIAS "ZM0" TITLE "Nome"  			// 03

DEFINE CELL NAME "KM_ASFAL"			OF oDetalhe ALIAS ""  	TITLE "Km Asfalto" PICTURE "@E 999,999"  SIZE 12    	// 05
DEFINE CELL NAME "UN_ASFAL"			OF oDetalhe ALIAS ""  	TITLE "Unit.Km Asf" PICTURE "@E 999.9999"  SIZE 12    	// 05
DEFINE CELL NAME "TO_ASFAL"			OF oDetalhe ALIAS ""  	TITLE "Tot.Km Asf" PICTURE "@E 99,999,999.99"  SIZE 14    	// 05

DEFINE CELL NAME "KM_TERRA" 		OF oDetalhe ALIAS ""  	TITLE "Km Terra  " PICTURE "@E 999,999"  SIZE 12
DEFINE CELL NAME "UN_TERRA"			OF oDetalhe ALIAS ""  	TITLE "Unit.Km Ter" PICTURE "@E 999.9999"  SIZE 12    	// 05
DEFINE CELL NAME "TO_TERRA"			OF oDetalhe ALIAS ""  	TITLE "Tot.Km Ter" PICTURE "@E 99,999,999.99"  SIZE 14    	// 05

DEFINE CELL NAME "QTD_LEITE" 		OF oDetalhe ALIAS ""  	TITLE "Qtd. Leite" PICTURE "@E 999,999,999"  SIZE 14 	// 04
DEFINE CELL NAME "UN_LEITE"			OF oDetalhe ALIAS ""  	TITLE "Unit.Leite" PICTURE "@E 999.9999"  SIZE 12    	// 05
DEFINE CELL NAME "TO_LEITE"			OF oDetalhe ALIAS ""  	TITLE "Total Leite" PICTURE "@E 99,999,999.99"  SIZE 14    	// 05


//Celulas dinamicas
For ix := 1 to Len(_aCelulas)
	DEFINE CELL NAME Alltrim(_aCelulas[ix][1])	OF oDetalhe ALIAS ""  	TITLE Alltrim(_aCelulas[ix][2]) PICTURE "@E 9,999,999.99"  SIZE 14

Next ix


DEFINE CELL NAME "PROVENTOS" 			OF oDetalhe ALIAS ""  	TITLE "Proventos"  PICTURE "@E 99,999,999.99"  SIZE 16
DEFINE CELL NAME "DESCONTOS" 			OF oDetalhe ALIAS ""  	TITLE "Descontos"  PICTURE "@E 99,999,999.99"  SIZE 16
DEFINE CELL NAME "LIQUIDO"	 			OF oDetalhe ALIAS ""  	TITLE "Lํquido"  PICTURE "@E 99,999,999.99"  SIZE 16

oDetalhe:SetTotalInLine(.T.)

oDetalhe:SetTotalText("TOTALIZAวรO") //seta texto padrao que sera impresso

DEFINE FUNCTION FROM oDetalhe:Cell("QTD_LEITE") OF oDetalhe FUNCTION SUM
DEFINE FUNCTION FROM oDetalhe:Cell("PROVENTOS") OF oDetalhe FUNCTION SUM
DEFINE FUNCTION FROM oDetalhe:Cell("DESCONTOS") OF oDetalhe FUNCTION SUM
DEFINE FUNCTION FROM oDetalhe:Cell("LIQUIDO") OF oDetalhe FUNCTION SUM



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
Local _nDebito	:= 0
Local _nCredito	:= 0
Local _nLiquido := 0
Local iy := 0
Local _aDebitos := {}
Local _cAlias := GetNextAlias()

CriaTab(_cAlias,oDetalhe)

dbSelectArea(_cAlias)
Count to _nReg

LimpaDet(@oDetalhe)

(_cAlias)->(dbGoTop())
oDetalhe:Init()

While !(_cAlias)->(Eof())
	
	If Alltrim(_cRetiro+_cLoja) <> Alltrim((_cAlias)->CODSA2 + (_cAlias)->LOJA)
		
		oDetalhe:Cell("CODIGO"):SetValue((_cAlias)->CODSA2)
		oDetalhe:Cell("LOJA"):SetValue((_cAlias)->LOJA)
		oDetalhe:Cell("NOME"):SetValue((_cAlias)->NOME)
		//oDetalhe:Cell("QTD_LEITE"):SetValue((_cAlias)->QTDTOT)

		_cRetiro := (_cAlias)->CODSA2
		_cLoja   := (_cAlias)->LOJA
		_nCredito := 0
		_nDebito := 0				
		_nLiquido := 0
	
		//oDetalhe:Cell("NRONF"):SetValue(GetNF(_cRetiro, _cLoja))
		
	EndIf
	
	While !(_cAlias)->(Eof()) .and. Alltrim(_cRetiro+_cLoja) ==  Alltrim((_cAlias)->CODSA2 + (_cAlias)->LOJA)

		IF (_cAlias)->CODIGO == "0001" //KM ASFALTO
			oDetalhe:Cell("KM_ASFAL"):SetValue((_cAlias)->QTD )
			oDetalhe:Cell("UN_ASFAL"):SetValue((_cAlias)->UNIT )
			oDetalhe:Cell("TO_ASFAL"):SetValue((_cAlias)->VALOR )
		ElseIF (_cAlias)->CODIGO == "0002" //KM TERRA
			oDetalhe:Cell("KM_TERRA"):SetValue((_cAlias)->QTD )
			oDetalhe:Cell("UN_TERRA"):SetValue((_cAlias)->UNIT )
			oDetalhe:Cell("TO_TERRA"):SetValue((_cAlias)->VALOR )
		ElseIF (_cAlias)->CODIGO == "0003" //LITRAGEM
			oDetalhe:Cell("QTD_LEITE"):SetValue((_cAlias)->QTD )
			oDetalhe:Cell("UN_LEITE"):SetValue((_cAlias)->UNIT )
			oDetalhe:Cell("TO_LEITE"):SetValue((_cAlias)->VALOR )
		Else
//			oDetalhe:Cell(Alltrim((_cAlias)->CODIGO)):SetValue((_cAlias)->QTD )
//			oDetalhe:Cell(Alltrim((_cAlias)->CODIGO)+"UN"):SetValue((_cAlias)->UNIT )
//			oDetalhe:Cell(Alltrim((_cAlias)->CODIGO)+"TO"):SetValue((_cAlias)->VALOR )
			oDetalhe:Cell(Alltrim((_cAlias)->CODIGO)):SetValue((_cAlias)->VALOR )
		EndIf		

		IF (_cAlias)->DEBCRE = 'C'
			_nLiquido += (_cAlias)->VALOR
			_nCredito += (_cAlias)->VALOR			
		Else
			_nLiquido -= (_cAlias)->VALOR	
			_nDebito += (_cAlias)->VALOR	
		EndIf
	
		(_cAlias)->(dbSkip())
	EndDo
	
		_aDebitos := CriaZM2(_cRetiro,_cLoja)
		
		If Len(_aDebitos) > 0
			For iy := 1 to Len(_aDebitos)
				If !Empty(_aDebitos[iy][1])
					oDetalhe:Cell(Alltrim(_aDebitos[iy][1])):SetValue(_aDebitos[iy][2] )			
					_nLiquido -= _aDebitos[iy][2]
					_nDebito += _aDebitos[iy][2]
				EndIf	
			Next iy 
		EndIf
		_aDebitos := {}
		
		// Cแlculo das colunas
		oDetalhe:Cell("PROVENTOS"):SetValue(_nCredito)		
		oDetalhe:Cell("DESCONTOS"):SetValue(_nDebito)		
		oDetalhe:Cell("LIQUIDO"):SetValue(_nLiquido)		
/*
		dbSelectArea("SA2")
		SA2->(dbSetOrder(1))
		SA2->(dbSeek(xFilial("SA2") + _cRetiro + _cLoja ) )
		
		If SA2->A2_L_TPPAG == "B"
			oDetalhe:Cell("FORMA"):SetValue("Banco")
		Else
			oDetalhe:Cell("FORMA"):SetValue("Cheque")
		EndIf
*/		
	oDetalhe:PrintLine()
	LimpaDet(@oDetalhe)
	
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

nOrdem := oObj:GetOrder()

If nOrdem == 1
	cOrdem := "% ZM0_NOME,ZM0_CODSA2,ZM0_LOJSA2 %"
Else
	cOrdem := "% ZM0_CODSA2,ZM0_LOJSA2 %"
EndIf

BeginSql Alias _cAlias

	SELECT ZM0_CODSA2 AS CODSA2,
	ZM0_LOJSA2 AS LOJA,
	ZM0_NOME AS NOME,
	ZM1_OCORRE AS CODIGO,
	    SUM(ZM1_QTDADE) AS QTD,
	    AVG(ZM1_VALOR) AS UNIT,
	    SUM(ZM1_VLRTOT) AS VALOR,
	    ZM1_DEBCRE AS DEBCRE,
	    ZM0_TOTTRP AS QTDTOT
	FROM %Table:ZM1% M1
	JOIN %Table:ZM0% M0 ON M0.ZM0_FILIAL = M1.ZM1_FILIAL AND M0.ZM0_MIX = M1.ZM1_MIX AND M0.ZM0_CODSA2 = M1.ZM1_CODSA2 
	    AND M0.ZM0_LOJSA2 = M1.ZM1_LOJSA2 AND M0.%NotDel%
	WHERE ZM1_FILIAL = %xFilial:ZM1% AND M1.ZM1_MIX =  %Exp:MV_PAR01% 
	AND M1.ZM1_CODSA2 BETWEEN %Exp:MV_PAR02% AND %Exp:MV_PAR03%
	AND M1.%NotDel%
	GROUP BY ZM0_CODSA2,ZM0_LOJSA2,ZM0_NOME,ZM1_OCORRE,ZM1_DEBCRE,ZM0_TOTTRP
	ORDER BY %Exp:cOrdem%

EndSql


Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณCriaZM2 บAutor  ณMicrosiga             บ Data ณ  04/11/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Cria tabela temporแria para impressใo do relat๓rio.        บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function CriaZM2(xcCodigo,xcLoja)

Local _cAliasZM2 := GetNextAlias()
Local _aRet := {}


If Select(_cAliasZM2) <> 0
	(_cAliasZM2)->(DbCloseArea())
EndIf


BeginSql Alias _cAliasZM2

	SELECT ZM2_EVENTO AS CODIGO,
	       ZM2_VALOR AS VALOR
	FROM %Table:ZM2% M2
	WHERE ZM2_FILIAL = %xFilial:ZM2%
		AND ZM2_MIX = %Exp:MV_PAR01%
		AND ZM2_CODSA2 = %Exp:xcCodigo%
		AND ZM2_LOJSA2 = %Exp:xcLoja%
		AND M2.%NotDel%

EndSql

While !(_cAliasZM2)->(Eof())
	If !Empty((_cAliasZM2)->CODIGO) .and. (_cAliasZM2)->VALOR > 0
		AADD(_aRet,{(_cAliasZM2)->CODIGO,(_cAliasZM2)->VALOR})
	EndIf
	(_cAliasZM2)->(DbSkip())
EndDo


Return _aRet


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณCelulas   บAutor  ณMicrosiga           บ Data ณ  22/08/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function Celulas()

Local _aRet := {}
Local _cFiltro := "%  ZM1_OCORRE NOT IN ('0001','0002','0003')  %"

If Select(cAliasCel) <> 0
	(cAliasCel)->(DbCloseArea())
EndIf
BeginSql alias cAliasCel
	SELECT ZM1_MIX, ZM1_OCORRE AS CODIGO, ZM1_DSCOCO AS DESCRI,ZM1_DEBCRE AS DEBCRE 
	FROM %Table:ZM1% ZM1
	WHERE ZM1_FILIAL = %xFilial:ZM1% AND ZM1_MIX = %Exp:MV_PAR01%
	AND %Exp:_cFiltro%
	AND ZM1.%NotDel%
	GROUP BY ZM1_MIX, ZM1_OCORRE, ZM1_DSCOCO,ZM1_DEBCRE
	ORDER BY ZM1_OCORRE,ZM1_DEBCRE
EndSql

While !(cAliasCel)->(Eof())
	AADD(_aRet,{(cAliasCel)->CODIGO,(cAliasCel)->DESCRI,(cAliasCel)->DEBCRE})
//	AADD(_aRet,{(cAliasCel)->CODIGO+"UN","Unit. "+(cAliasCel)->DESCRI,(cAliasCel)->DEBCRE})	
//	AADD(_aRet,{(cAliasCel)->CODIGO+"TO","Tot. "+(cAliasCel)->DESCRI,(cAliasCel)->DEBCRE})	
	(cAliasCel)->(DbSkip())
EndDo

If Select(cAliasEve) <> 0
	(cAliasEve)->(DbCloseArea())
EndIf

BeginSql alias cAliasEve

	SELECT ZM2_EVENTO AS CODIGO,ZL8_NREDUZ AS DESCRI, 'D' AS DEBCRE
	FROM %Table:ZM2% ZM2
		JOIN %Table:ZL8% ZL8 ON ZL8_FILIAL = %xFilial:ZL8% AND ZL8_COD = ZM2_EVENTO AND ZL8.%NotDel%
	WHERE ZM2.ZM2_FILIAL = %xFilial:ZM2%
	AND ZM2.ZM2_MIX =  %Exp:MV_PAR01%
	AND ZM2.%NotDel%
	GROUP BY ZM2_EVENTO ,ZL8_NREDUZ
	ORDER BY 1

EndSql	

While !(cAliasEve)->(Eof())
	AADD(_aRet,{(cAliasEve)->CODIGO,(cAliasEve)->DESCRI,(cAliasEve)->DEBCRE})
	(cAliasEve)->(DbSkip())
EndDo

If Len(_aRet)>0
	//ASORT(_aRet, , , { | x,y | x[3] > y[3] } ) //Ordena para os creditos ficarem em primeiro
EndIf

Return _aRet

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

//Do Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial do carreteiro')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"02","Do Carreteiro"," "," ","mv_ch2","C",6,0,0,"G","","SA2_L1","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final do produtor')
Aadd( aHelpPor, 'que deseja filtrar.               ')
U_xPutSx1(cPerg,"03","Ate Carreteiro"," "," ","mv_ch3","C",6,0,0,"G","","SA2_L1","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

/*
aHelpPor := {}
Aadd( aHelpPor, 'Informe SIM para demonstrar o fechamento')
Aadd( aHelpPor, 'de todas as filiais no mesmo relatorio. ')
Aadd( aHelpPor, 'ou NรO para somente a filial logada.   ')
U_xPutSx1(cPerg,"04","Todas as Filiais?","","","mv_ch4","C",1,0,0,"C",'',"","","","MV_PAR04","Sim","","","","Nao","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
*/

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

