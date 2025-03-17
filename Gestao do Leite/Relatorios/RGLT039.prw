#include "protheus.ch"
#include "report.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT039   บAutor  ณMicrosiga           บ Data ณ  08/24/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿  
LER DADOS DO MIX - ZLF
. VALOR BASE - LEITE CRU - VER EVENTOS - GRUPPO - 000001
. VALOR C BONIF - VER EVENTOS - GRUPO BONIFICAวรO - 000002

*/

User Function RGLT039()
Local oReport
Local oCabec
Local oDet01
Local cMasc := "@E 999,999,999.99"
Private QRY
Private cLinha := ""
    
ValidPerg("RGLT039")
Pergunte("RGLT039",.F.)

DEFINE REPORT oReport NAME "RGLT039" TITLE "Total de Fornecimentos de "+DTOC(MV_PAR01)+" a "+dtoc(MV_PAR02) PARAMETER "RGLT039" ACTION {|oReport| PrintReport(oReport)}
                                                                                                                                   
oReport:SetTotalInLine(.F.)
//oReport:lOnPageBreak := .t.

	DEFINE SECTION oCabec OF oReport TITLE "Grupo" TABLES "SA2","ZL3","QRY"

		DEFINE CELL NAME "A2_L_LI_RO" OF oCabec ALIAS "SA2" SIZE 20
		DEFINE CELL NAME "ZL3_DESCRI" OF oCabec ALIAS "ZL3"		

		//oCabec:lLineStyle := .T.
		oCabec:SetLeftMargin(10)
		oCabec:SetColSpace(5)
		//oCabec:SetPageBreak(.T.)  
		oCabec:SetTotalInLine(.F.)				

	DEFINE SECTION oDet01 OF oCabec TITLE "Fornecimentos" TABLE "SA2","ZLD","ZLF","QRY"

		DEFINE CELL NAME "A2_COD" OF oDet01 TITLE "Codigo" SIZE 10
		DEFINE CELL NAME "A2_LOJA" OF oDet01 TITLE "Loja" SIZE 10		
		DEFINE CELL NAME "A2_NOME" OF oDet01 TITLE "Produtor" SIZE 50
		DEFINE CELL NAME "QTDDIAS" OF oDet01 TITLE "Dias"  SIZE 10
		DEFINE CELL NAME "ZLF_QTDBOM" OF oDet01 TITLE "Total(Lt)"  SIZE 20
		DEFINE CELL NAME "VLBRUTO" OF oDet01 TITLE "Valor Bruto"  SIZE 20  PICTURE cMasc		
		DEFINE CELL NAME "VLCBONIF" OF oDet01 TITLE "Valor c/ Bonif" SIZE 20 PICTURE cMasc      
		
		oDet01:Cell("QTDDIAS"):SetHeaderAlign("CENTER")
		oDet01:Cell("QTDDIAS"):SetAlign("CENTER")
		oDet01:Cell("ZLF_QTDBOM"):SetHeaderAlign("RIGHT")
		oDet01:Cell("VLBRUTO"):SetHeaderAlign("RIGHT")		
		oDet01:Cell("VLCBONIF"):SetHeaderAlign("RIGHT")				

		DEFINE FUNCTION from oDet01:Cell("ZLF_QTDBOM") FUNCTION SUM		
		DEFINE FUNCTION from oDet01:Cell("VLBRUTO") FUNCTION SUM		
		DEFINE FUNCTION from oDet01:Cell("VLCBONIF") FUNCTION SUM														
		
		oDet01:SetTotalInLine(.F.)
		oDet01:SetTotalText('Total da Linha: ' + cLinha )
		oDet01:OnPrintLine({|| cLinha := QRY->A2_L_LI_RO+" - "+QRY->ZL3_DESCRI  }) //Atualiza Variavel do Subtotal

oReport:PrintDialog()
Return

Static Function PrintReport(oReport)
Local cDtIni := dtos(mv_par01),cDtFim:=dTos(mv_par02)  
Local cSetor := mv_par03
Local cRotaDe := mv_par04,cRotaAte := mv_par05
Local cStatus := IIF(MV_PAR06==1,"A","F")

BEGIN REPORT QUERY oReport:Section(1)

BeginSql alias "QRY"
	select 
		SA2.A2_L_LI_RO, ZL3_DESCRI, A2_COD, A2_LOJA, A2_NOME
	   ,(select count(ZLD_DTCOLE) from %table:ZLD% ZLD 
		  where ZLD_FILIAL = %xfilial:ZLD% and ZLD.%notDel% 
		    and ZLD_SETOR = ZL3.ZL3_SETOR
		    and ZLD_LINROT = ZL3.ZL3_COD
		    and ZLD_RETIRO = SA2.A2_COD
		    and ZLD_RETILJ = SA2.A2_LOJA
   		  	and	ZLD_DTCOLE BETWEEN %exp:cDtIni% and %exp:cDtFim% 
		    ) as 'QTDDIAS'  
		,(select max(ZLFQ.ZLF_QTDBOM) from %table:ZLF% ZLFQ, %table:ZL8% ZL8  
		  where ZLFQ.ZLF_FILIAL = %xfilial:ZLF% and ZLFQ.%notDel% 
		  	and ZL8.ZL8_FILIAL = %xfilial:ZL8% and ZL8.%notDel%  		  
		  	and ZLFQ.ZLF_EVENTO = ZL8.ZL8_COD		  	
		    and ZLFQ.ZLF_SETOR = ZL3.ZL3_SETOR
		    and ZLFQ.ZLF_LINROT = ZL3.ZL3_COD
		    and ZLFQ.ZLF_RETIRO = SA2.A2_COD
		    and ZLFQ.ZLF_RETILJ = SA2.A2_LOJA
		    and ZLFQ.ZLF_DEBCRE = 'C'
		    and ZL8.ZL8_GRUPO = '000001'		    
		    and ZLFQ.ZLF_STATUS = %exp:cStatus%   		    
		    and ZLFQ.ZLF_DTINI >= %exp:cDtIni%
		    and ZLFQ.ZLF_DTFIM <= %exp:cDtFim% 	  
   		  	) as 'ZLF_QTDBOM'
		,(select SUM(ZLF_TOTAL) from %table:ZLF% ZLFB, %table:ZL8% ZL8 
		  where ZLFB.ZLF_FILIAL = %xfilial:ZLF% and ZLFB.%notDel% 
		  	and ZL8.ZL8_FILIAL = %xfilial:ZL8% and ZL8.%notDel%  
		  	and ZLFB.ZLF_EVENTO = ZL8.ZL8_COD
		    and ZLFB.ZLF_SETOR = ZL3.ZL3_SETOR
		    and ZLFB.ZLF_LINROT = ZL3.ZL3_COD
		    and ZLFB.ZLF_RETIRO = SA2.A2_COD
		    and ZLFB.ZLF_RETILJ = SA2.A2_LOJA  
		    and ZLFB.ZLF_DEBCRE = 'C'
		    and ZL8.ZL8_GRUPO = '000001'
		    and ZLFB.ZLF_STATUS = %exp:cStatus%   		    
		    and ZLFB.ZLF_DTINI >= %exp:cDtIni%
		    and ZLFB.ZLF_DTFIM <= %exp:cDtFim% 	  
   		  	) as 'VLBRUTO'
                             
		,(select SUM(ZLF_TOTAL) from %table:ZLF% ZLFCB, %table:ZL8% ZL8 
		  where ZLFCB.ZLF_FILIAL = %xfilial:ZLF% and ZLFCB.%notDel% 
		  	and ZL8.ZL8_FILIAL = %xfilial:ZL8% and ZL8.%notDel%  
		  	and ZLFCB.ZLF_EVENTO = ZL8.ZL8_COD
		    and ZLFCB.ZLF_SETOR = ZL3.ZL3_SETOR
		    and ZLFCB.ZLF_LINROT = ZL3.ZL3_COD
		    and ZLFCB.ZLF_RETIRO = SA2.A2_COD
		    and ZLFCB.ZLF_RETILJ = SA2.A2_LOJA 
		    and ZLFCB.ZLF_DEBCRE = 'C'
		    and ZL8.ZL8_GRUPO IN ('000001','000002','000007')
		    and ZLFCB.ZLF_STATUS = %exp:cStatus%   		    
		    and ZLFCB.ZLF_DTINI >= %exp:cDtIni%
		    and ZLFCB.ZLF_DTFIM <= %exp:cDtFim% 	  
   		  	) as 'VLCBONIF'

	from %table:SA2% SA2, %table:ZL3% ZL3
	
	where SA2.A2_L_LI_RO = ZL3.ZL3_COD  
	  and SA2.A2_FILIAL = %xfilial:SA2% and SA2.%notDel% 	  
	  and ZL3.ZL3_FILIAL = %xfilial:ZL3F% and ZL3.%notDel% 	 
	  and SA2.A2_L_LI_RO between %exp:cRotaDe% and %exp:cRotaAte%
	  and ZL3.ZL3_SETOR = %exp:cSetor%                                    
	  
	order by SA2.A2_L_LI_RO, SA2.A2_NOME
EndSql

END REPORT QUERY oReport:Section(1) 

oReport:Section(1):Section(1):SetParentQuery()
oReport:Section(1):Section(1):SetParentFilter({|cParam| QRY->A2_L_LI_RO == cParam},{|| QRY->A2_L_LI_RO})

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
cDef05 := "" ; cDefSpa5 := "" ; cDefEng5 := "" ;  cHelp := ""

U_xPutSx1(cPerg,strzero(nOrdem,2),cPergunt,cPergunt,cPergunt,"mv_ch" + strzero(nOrdem,1),cTipo,nTamanho,nDecimal,nPreSel,cGSC,cValid,cF3,cGrpSXG,cPyme,;
"MV_PAR" + StrZero(nOrdem,2),cDef01,cDefSpa1,cDefEng1,cCnt01,cDef02,cDefSpa2,cDefEng2,cDef03,cDefSpa3,cDefEng3,cDef04,cDefSpa4,;
cDefEng4,cDef05,cDefSpa5,cDefEng5,aHelpPor,aHelpEng,aHelpSpa,cHelp)

nOrdem++
cPergunt := "Data Ate?"  ; cTipo := "D" ; nTamanho := 8 ; cGsc := "G" 

U_xPutSx1(cPerg,strzero(nOrdem,2),cPergunt,cPergunt,cPergunt,"mv_ch" + strzero(nOrdem,1),cTipo,nTamanho,nDecimal,nPreSel,cGSC,cValid,cF3,cGrpSXG,cPyme,;
"MV_PAR" + StrZero(nOrdem,2),cDef01,cDefSpa1,cDefEng1,cCnt01,cDef02,cDefSpa2,cDefEng2,cDef03,cDefSpa3,cDefEng3,cDef04,cDefSpa4,;
cDefEng4,cDef05,cDefSpa5,cDefEng5,aHelpPor,aHelpEng,aHelpSpa,cHelp)
                                                                    
nOrdem++
cPergunt := "Setor?"  ; cTipo := "C" ; nTamanho := 6 ; cGsc := "G" ; cF3 := "ZL2_01" 

U_xPutSx1(cPerg,strzero(nOrdem,2),cPergunt,cPergunt,cPergunt,"mv_ch" + strzero(nOrdem,1),cTipo,nTamanho,nDecimal,nPreSel,cGSC,cValid,cF3,cGrpSXG,cPyme,;
"MV_PAR" + StrZero(nOrdem,2),cDef01,cDefSpa1,cDefEng1,cCnt01,cDef02,cDefSpa2,cDefEng2,cDef03,cDefSpa3,cDefEng3,cDef04,cDefSpa4,;
cDefEng4,cDef05,cDefSpa5,cDefEng5,aHelpPor,aHelpEng,aHelpSpa,cHelp)

nOrdem++
cPergunt := "Grupo De?"  ; cTipo := "C" ; nTamanho := 6 ; cGsc := "G" ; cF3 := "ZL3_01" 

U_xPutSx1(cPerg,strzero(nOrdem,2),cPergunt,cPergunt,cPergunt,"mv_ch" + strzero(nOrdem,1),cTipo,nTamanho,nDecimal,nPreSel,cGSC,cValid,cF3,cGrpSXG,cPyme,;
"MV_PAR" + StrZero(nOrdem,2),cDef01,cDefSpa1,cDefEng1,cCnt01,cDef02,cDefSpa2,cDefEng2,cDef03,cDefSpa3,cDefEng3,cDef04,cDefSpa4,;
cDefEng4,cDef05,cDefSpa5,cDefEng5,aHelpPor,aHelpEng,aHelpSpa,cHelp)

nOrdem++
cPergunt := "Grupo Ate?"  ; cTipo := "C" ; nTamanho := 6 ; cGsc := "G" ; cF3 := "ZL3_01" 

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