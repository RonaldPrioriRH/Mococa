#include "protheus.ch"
#include "report.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT038   บAutor  ณMicrosiga           บ Data ณ  08/24/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function RGLT038()
Local oReport
Local oCabec
Local oDet01

Pergunte("RGLT038",.F.)

DEFINE REPORT oReport NAME "RGLT038" TITLE "Rela็ใo das Notas Fiscais Emitidas" PARAMETER "RGLT038" ACTION {|oReport| PrintReport(oReport)}

	DEFINE SECTION oCabec OF oReport TITLE "Municํpio" TABLES "SA1"

		DEFINE CELL NAME "A1_COD" OF oCabec ALIAS "SA1"

	DEFINE SECTION oDet01 OF oCabec TITLE "Pedido" TABLE "SC5"

		DEFINE CELL NAME "NUM" OF oDet01 TITLE "Produtor" SIZE 10
		DEFINE CELL NAME "C5_NUM" OF oDet01 TITLE "Nome" 
		DEFINE CELL NAME "C5_TIPO" OF oDet01 TITLE "Nr NF" 
		DEFINE CELL NAME "C5_VEND1" OF oDet01 TITLE "Cota" 
		DEFINE CELL NAME "C5_VEND1" OF oDet01 TITLE "EXCES" 		
		DEFINE CELL NAME "C5_VEND1" OF oDet01 TITLE "M GORDA" 		
		DEFINE CELL NAME "C5_VEND1" OF oDet01 TITLE "BON/PRM" 		
		DEFINE CELL NAME "C5_VEND1" OF oDet01 TITLE "Total" 		
		DEFINE CELL NAME "C5_VEND1" OF oDet01 TITLE "Funrural" 				
		DEFINE CELL NAME "C5_VEND1" OF oDet01 TITLE "Liquido" 				

		DEFINE FUNCTION FROM oDet01:Cell("COTA") FUNCTION SUM		
		DEFINE FUNCTION FROM oDet01:Cell("EXCES") FUNCTION SUM		
		DEFINE FUNCTION FROM oDet01:Cell("M GORDA") FUNCTION SUM		
		DEFINE FUNCTION FROM oDet01:Cell("BON/PRM") FUNCTION SUM		
		DEFINE FUNCTION FROM oDet01:Cell("TOTAL") FUNCTION SUM		
		DEFINE FUNCTION FROM oDet01:Cell("FUNRURAL") FUNCTION SUM		
		DEFINE FUNCTION FROM oDet01:Cell("LIQUIDO") FUNCTION SUM														


oReport:PrintDialog()
Return

Static Function PrintReport(oReport)
Local cAlias := GetNextAlias()

BEGIN REPORT QUERY oReport:Section(1)

BeginSql alias cAlias
	SELECT A1_COD,A1_NOME,A1_VEND,A1_MCOMPRA,
		C5_NUM NUM,C5_NUM,C5_TIPO,C5_VEND1,C5_CLIENTE,
		C6_ITEM,C6_PRODUTO,C6_UM,C6_QTDVEN,C6_PRCVEN,C6_VALOR,C6_NUM,
		B1_DESC,B1_GRUPO
	
	FROM %table:SA1% SA1, %table:SC5% SC5, %table:SC6% SC6, %table:SB1% SB1
	
	WHERE A1_FILIAL = %xfilial:SA1% AND SA1.%notDel% AND
		C5_FILIAL = %xfilial:SC5% AND SC5.%notDel% AND C5_CLIENTE = A1_COD AND
		C6_FILIAL = %xfilial:SC6% AND SC6.%notDel% AND C6_NUM = C5_NUM AND
		B1_FILIAL = %xfilial:SB1% AND SB1.%notDel% AND B1_COD = C6_PRODUTO
	
	ORDER BY A1_FILIAL,A1_COD,
		C5_FILIAL,C5_NUM,
		C6_FILIAL,C6_ITEM
EndSql

END REPORT QUERY oReport:Section(1) PARAM mv_par01

oReport:Section(1):Section(1):SetParentQuery()
oReport:Section(1):Section(1):SetParentFilter({|cParam| (cAlias)->C5_CLIENTE == cParam},{|| (cAlias)->A1_COD})

oReport:Section(1):Print()
Return  

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT040   บAutor  ณMicrosiga           บ Data ณ  08/24/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
http://tdn.totvs.com/home#23803

U_xPutSx1( < cGrupo>, < cOrdem>, < cPergunt>, < cPergSpa>, < cPergEng>, < cVar>, < cTipo>,;
< nTamanho>, [ nDecimal], [ nPreSel], < cGSC>, [ cValid], [ cF3], [ cGrpSXG], [ cPyme],;
< cVar01>, [ cDef01], [ cDefSpa1], [ cDefEng1], [ cCnt01], [ cDef02], [ cDefSpa2], [ cDefEng2],;
[ cDef03], [ cDefSpa3], [ cDefEng3], [ cDef04], [ cDefSpa4], [ cDefEng4], [ cDef05], [ cDefSpa5],;
[ cDefEng5], [ aHelpPor], [ aHelpEng], [ aHelpSpa], [ cHelp] )

*/
static function validPerg(cPerg)
Local nOrdem,cPergunt,cPergSpa,cPergEng,cTipo,nTamanho,nDecimal,nPreSel,cGSC,cValid,cF3,cGrpSXG,cPyme
Local cDef01,cDefSpa1,cDefEng1,cCnt01,cDef02,cDefSpa2,cDefEng2,cDef03,cDefSpa3,cDefEng3,cDef04,cDefSpa4
Local cDefEng4,cDef05,cDefSpa5,cDefEng5,aHelpPor,aHelpEng,aHelpSpa,cHelp

aHelpPor :={}
aHelpIng :={}
aHelpEsp :={}
Aadd( aHelpPor, "Informe a opera็ใo para gerar as ")
Aadd( aHelpPor, "movimenta็๕es." )
aHelpIng := aHelpEsp := aHelpPor

nOrdem := 1
cPergunt := "Data De?"  ; cTipo := "D" ; nTamanho := 8 ; nDecimal := 0
nPreSel := 0 ; cGsc := "G" ; cValid := "" ; cF3 := "" ; cGrpSxG := "" ; cPyme := ""
cDef01 := ""  ; cDefSpa1 := "" ; cDefEng1 := "" ; cCnt01 := "" ; cDef02 := "" ; cDefSpa2 := "" ; cDefEng2 := ""
cDef03 := "" ; cDefSpa3 := "" ; cDefEng3 := "" ; cDef04 := "" ; cDefSpa4 := "" ; cDefEng4 := ""
cDef05 := "" ; cDefSpa5 := "" ; cDefEng5 := "" ;  cHelp := "cHelp"

U_xPutSx1(cPerg,strzero(nOrdem,2),cPergunt,cPergunt,cPergunt,"mv_ch" + strzero(nOrdem,1),cTipo,nTamanho,nDecimal,nPreSel,cGSC,cValid,cF3,cGrpSXG,cPyme,;
"MV_PAR" + StrZero(nOrdem,2),cDef01,cDefSpa1,cDefEng1,cCnt01,cDef02,cDefSpa2,cDefEng2,cDef03,cDefSpa3,cDefEng3,cDef04,cDefSpa4,;
cDefEng4,cDef05,cDefSpa5,cDefEng5,aHelpPor,aHelpEng,aHelpSpa,cHelp)

nOrdem++
cPergunt := "Data Ate?"  ; cTipo := "D" ; nTamanho := 8 ; cGsc := "G" 

U_xPutSx1(cPerg,strzero(nOrdem,2),cPergunt,cPergunt,cPergunt,"mv_ch" + strzero(nOrdem,1),cTipo,nTamanho,nDecimal,nPreSel,cGSC,cValid,cF3,cGrpSXG,cPyme,;
"MV_PAR" + StrZero(nOrdem,2),cDef01,cDefSpa1,cDefEng1,cCnt01,cDef02,cDefSpa2,cDefEng2,cDef03,cDefSpa3,cDefEng3,cDef04,cDefSpa4,;
cDefEng4,cDef05,cDefSpa5,cDefEng5,aHelpPor,aHelpEng,aHelpSpa,cHelp)
                                                                    
nOrdem++
cPergunt := "Setor?"  ; cTipo := "C" ; nTamanho := 6 ; cGsc := "C" ; cF3 := "ZL2_01" 

U_xPutSx1(cPerg,strzero(nOrdem,2),cPergunt,cPergunt,cPergunt,"mv_ch" + strzero(nOrdem,1),cTipo,nTamanho,nDecimal,nPreSel,cGSC,cValid,cF3,cGrpSXG,cPyme,;
"MV_PAR" + StrZero(nOrdem,2),cDef01,cDefSpa1,cDefEng1,cCnt01,cDef02,cDefSpa2,cDefEng2,cDef03,cDefSpa3,cDefEng3,cDef04,cDefSpa4,;
cDefEng4,cDef05,cDefSpa5,cDefEng5,aHelpPor,aHelpEng,aHelpSpa,cHelp)

nOrdem++
cPergunt := "Rota De?"  ; cTipo := "C" ; nTamanho := 6 ; cGsc := "G" ; cF3 := "ZLW_01" 

U_xPutSx1(cPerg,strzero(nOrdem,2),cPergunt,cPergunt,cPergunt,"mv_ch" + strzero(nOrdem,1),cTipo,nTamanho,nDecimal,nPreSel,cGSC,cValid,cF3,cGrpSXG,cPyme,;
"MV_PAR" + StrZero(nOrdem,2),cDef01,cDefSpa1,cDefEng1,cCnt01,cDef02,cDefSpa2,cDefEng2,cDef03,cDefSpa3,cDefEng3,cDef04,cDefSpa4,;
cDefEng4,cDef05,cDefSpa5,cDefEng5,aHelpPor,aHelpEng,aHelpSpa,cHelp)

nOrdem++
cPergunt := "Rota Ate?"  ; cTipo := "C" ; nTamanho := 6 ; cGsc := "G" ; cF3 := "ZLW_01" 

U_xPutSx1(cPerg,strzero(nOrdem,2),cPergunt,cPergunt,cPergunt,"mv_ch" + strzero(nOrdem,1),cTipo,nTamanho,nDecimal,nPreSel,cGSC,cValid,cF3,cGrpSXG,cPyme,;
"MV_PAR" + StrZero(nOrdem,2),cDef01,cDefSpa1,cDefEng1,cCnt01,cDef02,cDefSpa2,cDefEng2,cDef03,cDefSpa3,cDefEng3,cDef04,cDefSpa4,;
cDefEng4,cDef05,cDefSpa5,cDefEng5,aHelpPor,aHelpEng,aHelpSpa,cHelp)

nOrdem++
cPergunt := "Movimento?"  ; cTipo := "N" ; nTamanho := 1 ; cGsc := "C"     
cDef01 := "Aberto"  ; cDefSpa1 := "Aberto" ; cDefEng1 := "Aberto" ; cDef02 := "Fechado" ; cDefSpa2 := "Fechado" ; cDefEng2 := "Fechado"

U_xPutSx1(cPerg,strzero(nOrdem,2),cPergunt,cPergunt,cPergunt,"mv_ch" + strzero(nOrdem,1),cTipo,nTamanho,nDecimal,nPreSel,cGSC,cValid,cF3,cGrpSXG,cPyme,;
"MV_PAR" + StrZero(nOrdem,2),cDef01,cDefSpa1,cDefEng1,cCnt01,cDef02,cDefSpa2,cDefEng2,cDef03,cDefSpa3,cDefEng3,cDef04,cDefSpa4,;
cDefEng4,cDef05,cDefSpa5,cDefEng5,aHelpPor,aHelpEng,aHelpSpa,cHelp)

return