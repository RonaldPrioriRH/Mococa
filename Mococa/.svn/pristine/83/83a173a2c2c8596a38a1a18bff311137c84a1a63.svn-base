// #########################################################################################
// Projeto: Cooprata
// Modulo : Gestão do Leite
// Fonte  : RGLT073
// ---------+-------------------+-----------------------------------------------------------
// Data     | Autor Cláudio Gonçalves| INFORMATIVO DA QUALIDADE                              
// ---------+-------------------+-----------------------------------------------------------
// 31/01/14 | TOTVS Developer Studio | Gerado pelo Assistente de Código
// ---------+-------------------+-----------------------------------------------------------

#include "rwmake.ch"

//------------------------------------------------------------------------------------------
/*/{Protheus.doc} novo
Montagem da tela de processamento

Impressão do INFORMATIVO DA QUALIDADE                      
/*/
//------------------------------------------------------------------------------------------
USER FUNCTION RGLT073(cCMatr)

Private cPerg	:= "RGLT073"

If Empty(cCMatr)  
	AjustaSX1(cPerg)
	Pergunte(cPerg,.T.)
Else
	MV_PAR01 := STRZERO((MONTH(DDATABASE)),2,0)
	MV_PAR02 := ALLTRIM(STR(YEAR(DDATABASE)))
	MV_PAR03 := cCMatr
	MV_PAR04 := cCMatr 
EndIf

oReport := ReportDef(cCMatr)

If Empty(cCMatr)  	
	oReport:PrintDialog()
EndIf

Return

Static Function ReportDef(cCMatr)

Local _cMsgImp    :=  "Imprimindo... "
Private oReport
Private oSec1, oSec2, oSec3, oSec4, oSec5  
Private aTam := {}
Private cParam := ""

oReport := TReport():NEW("RGLT073" ,"INFORMATIVO DE QUALIDADE (Mês: "+cvaltochar(mv_par01)+" | Ano: "+cvaltochar(mv_par02)+").",cPerg,{|oReport|PrintReport(oReport)} ,"Este relatório imprime o INFORMATIVO DE QUALIDADE")

oReport:nFontBody	:= 8// Define o tamanho da fonte.
oReport:nLineHeight	:= 40 // Define a altura da linha.
oReport:CFONTBODY:="Courier New" 
//oReport:SetBorder("ALL")

oSec1 := TRSection():new(oReport,"Parâmetros de Qualidade",{""})
TRCELL():NEW(oSec1,"OPCAO"		,,"Opção de Análise"					,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec1,"CLASSE1"	,,"Classe 1 (Remunerada)"	  			,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec1,"CLASSE2"	,,"Classe 2 (Neutra)"					,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec1,"CLASSE3"	,,"Classe 3 (Sujeito à penalidade)"		,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)

oSec2 := TRSection():new(oReport,"Seus Resultados no Período",{""})
TRCELL():NEW(oSec2,"OPCAO"		,,"Opção de Análise"					,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec2,"CLASSE1"	,,"Classe 1 (Remunerada)"	  			,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec2,"CLASSE2"	,,"Classe 2 (Neutra)"					,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec2,"CLASSE3"	,,"Classe 3 (Sujeito à penalidade)"		,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)

oSec3 := TRSection():new(oReport,"Seus Resultados Históricos para Composição do Preço",{""})
TRCELL():NEW(oSec3,"DATA"		,,"Data analise"		,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec3,"GOR"		,,"GOR (%)"	  			,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec3,"CCS"		,,"CCS (mil/ml)"		,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec3,"PRT"		,,"PRT (%)"				,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec3,"CBT"		,,"CBT (mil/ml)"		,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)

oSec4 := TRSection():new(oReport,"Diferencial de Qualidade no Preço (Período Referência)",{""})
TRCELL():NEW(oSec4,"EVENTO"			,,"Evento"				,	,30	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec4,"VALOR"			,,"Valor (R$)"	  		,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec4,"VALORLITRO"		,,"Unitario (R$/L)"		,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)

oSec5 := TRSection():new(oReport,"Diário do Produtor (Período Referência)",{""})
TRCELL():NEW(oSec5,"RECEPCAO1"		,,"Recepcao"		,	,15	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec5,"VOLUME1"		,,"Volume"	  		,	,10	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec5,"AGUA1"			,,"Agua (L)"		,	,10	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec5,"RECEPCAO2"		,,"Recepcao"		,	,15	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec5,"VOLUME2"		,,"Volume"	  		,	,10	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec5,"AGUA2"			,,"Agua (L)"		,	,10	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec5,"RECEPCAO3"		,,"Recepcao"		,	,15	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec5,"VOLUME3"		,,"Volume"	  		,	,10	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec5,"AGUA3"			,,"Agua (L)"		,	,10	,,,"LEFT",	,"LEFT",,,,,,.F.)


oReport:lParamPage := .F.
oReport:GetOrientation(1)
//oReport:SetTotalInLine(.T.)    


If Empty(cCMatr)  
	oReport:SetPortrait(.T.)
	oReport:nLineHeight	:= 45
Else
	oReport:cPrinterName	:= ALLTRIM(GETMV("MV_C_PRINT"))//"PDFCreator"//"HP LaserJet M1530 MFP Series PCL 6 - COOPRATA"
	oReport:SetPreview(.F.)
	oReport:SetDevice(2)
	oReport:SetEnvironment(2)
	oReport:SetMsgPrint(_cMsgImp)
	oReport:SetPortrait(.T.)
	oReport:nLineHeight	:= 45
	oReport:Print(.F.,,.T.)  
EndIf


Return oReport

Static Function PrintReport(oReport)

Private oSec1	:= oReport:Section(1)
Private oSec2	:= oReport:Section(2)
Private oSec3	:= oReport:Section(3)
Private oSec4	:= oReport:Section(4)
Private oSec5	:= oReport:Section(5)
Private oBreak 

Private cQry1, cQry2, cQry3, cQry4, cQry5

oSec1:SetLeftMargin(10) 
oSec2:SetLeftMargin(10) 
oSec3:SetLeftMargin(10) 
oSec4:SetLeftMargin(10) 
oSec5:SetLeftMargin(5) 

If len(alltrim(cvaltochar(mv_par01))) == 1
	dDataProc := cvaltochar(mv_par02)+"0"+cvaltochar(mv_par01)
Else
	dDataProc := cvaltochar(mv_par02)+cvaltochar(mv_par01)
EndIF 

cQry0 := " SELECT DISTINCT ZLD_RETIRO, ZLD_RETILJ, A2_L_LI_RO, A2_NOME "  
cQry0 += " FROM "+RetSqlName("ZLD")+" ZLD INNER JOIN "+RetSqlName("SA2")+" SA2 "    
cQry0 += " ON (SA2.D_E_L_E_T_ = ' ' AND A2_COD = ZLD_RETIRO AND A2_LOJA = ZLD_RETILJ) "    
cQry0 += " WHERE ZLD.D_E_L_E_T_ = ' ' "
cQry0 += " AND ZLD_RETIRO BETWEEN '"+mv_par03+"' AND '"+mv_par04+"' "
cQry0 += " ORDER BY 1, 2 "

If Select("_QRY") <> 0
	_QRY->(DBCLOSEAREA())
EndIF              
dbUseArea(.T.,"TOPCONN",TCGenQry(,,cQry0),"_QRY",.F.,.T.)
_QRY->(dbGoTop())
While _QRY->(!Eof()) 

// Enddo

/*
dbSelectArea("SA2") 
dbSetOrder(1)
SA2->(dbGoTop())
If !EMPTY(mv_par03) 
	SA2->(dbSeek(xFilial("SA2")+mv_par03))
Else
	SA2->(dbSeek(xFilial("SA2")+"C"))
EndIF
*/

	cProdutor := _QRY->ZLD_RETIRO
	cLojaProd := _QRY->ZLD_RETILJ  
	cNomeProd := _QRY->A2_NOME
	cCodGrupo := _QRY->A2_L_LI_RO

	dbSelectArea("ZL3")
	dbSetOrder(1)
	ZL3->(dbGoTop())
	ZL3->(dbSeek(xFilial("SA2")+cCodGrupo)) 

	cCodSetor := ZL3->ZL3_SETOR
	dDtFim	:= LastDay(STOD(dDataProc+'01'))


// While SA2->(!EoF()) .AND. SA2->A2_L_TPFOR == "C" .AND. SA2->A2_COD <= mv_par04

	CABECPROD()
    
	cQry1 := " SELECT ZL9_DESCRI, CLASSE_1, CLASSE_2, CLASSE_3  "
	cQry1 += " FROM "+RetSqlName("ZL9")+" ZL9 "
	cQry1 += " INNER JOIN  "
	cQry1 += " 	( SELECT CONVERT(VARCHAR,ZLA_FXINI)+' - '+CONVERT(VARCHAR,ZLA_FXFIM) CLASSE_1, ZLA_COD "
	cQry1 += " 	FROM "+RetSqlName("ZLA")+" ZLA WHERE D_E_L_E_T_ = ' ') ) C1  "
	cQry1 += " 	ON (C1.ZLA_COD = ZL9_COD) "
	cQry1 += " INNER JOIN "
	cQry1 += " 	( SELECT CONVERT(VARCHAR,ZLA_FXINI)+' - '+CONVERT(VARCHAR,ZLA_FXFIM) CLASSE_2, ZLA_COD  "
	cQry1 += " 	FROM "+RetSqlName("ZLA")+" ZLA WHERE D_E_L_E_T_ = ' ') ) C2 "
	cQry1 += " 	ON (C2.ZLA_COD = ZL9_COD) "
	cQry1 += " INNER JOIN "
	cQry1 += " 	( SELECT CONVERT(VARCHAR,ZLA_FXINI)+' - '+CONVERT(VARCHAR,ZLA_FXFIM) CLASSE_3, ZLA_COD  "
	cQry1 += " 	FROM "+RetSqlName("ZLA")+" ZLA WHERE D_E_L_E_T_ = ' ') ) C3 "
	cQry1 += " 	ON (C3.ZLA_COD = ZL9_COD) "
	cQry1 += " WHERE D_E_L_E_T_ = ' ') "
	cQry1 += " ORDER BY ZL9_COD "
	
	cQry2 := " SELECT ZL9_DESCRI "
	cQry2 += " , C1.ZLA_FXINI CLASSE_1_INI, C1.ZLA_FXFIM CLASSE_1_FIM "
	cQry2 += " , C2.ZLA_FXINI CLASSE_2_INI, C2.ZLA_FXFIM CLASSE_2_FIM "
	cQry2 += " , C3.ZLA_FXINI CLASSE_3_INI, C3.ZLA_FXFIM CLASSE_3_FIM "
	cQry2 += " ,  '0'+SUBSTRING(ZL9_COD,2,5) ZL9_COD "
	cQry2 += " FROM "+RetSqlName("ZL9")+" ZL9 "
	cQry2 += " INNER JOIN "
	cQry2 += " 	( SELECT ZLA_FXINI, ZLA_FXFIM, ZLA_COD FROM "+RetSqlName("ZLA")+" ZLA WHERE D_E_L_E_T_ = ' ' "
	cQry2 += " 	AND ZLA_SEQ = '001' AND ZLA_COD IN ('100001','100002','100003','100004') ) C1 "
	cQry2 += " 	ON (C1.ZLA_COD = ZL9_COD) "
	cQry2 += " INNER JOIN "
	cQry2 += " 	( SELECT ZLA_FXINI, ZLA_FXFIM, ZLA_COD FROM "+RetSqlName("ZLA")+" ZLA WHERE D_E_L_E_T_ = ' ' "
	cQry2 += " 	AND ZLA_SEQ = '002' AND ZLA_COD IN ('100001','100002','100003','100004') ) C2 "
	cQry2 += " 	ON (C2.ZLA_COD = ZL9_COD) "
	cQry2 += " INNER JOIN "
	cQry2 += " 	( SELECT ZLA_FXINI, ZLA_FXFIM, ZLA_COD FROM "+RetSqlName("ZLA")+" ZLA WHERE D_E_L_E_T_ = ' ' "
	cQry2 += " 	AND ZLA_SEQ = '003' AND ZLA_COD IN ('100001','100002','100003','100004') ) C3 "
	cQry2 += " 	ON (C3.ZLA_COD = ZL9_COD) "
	cQry2 += " WHERE D_E_L_E_T_ = ' ') "
	cQry2 += " ORDER BY ZL9_COD "

	cQry3 := " SELECT DISTINCT ZLB1.ZLB_DATA
	cQry3 += "  , ISNULL(CONVERT(VARCHAR,ZLB2.ZLB_VLRANA),'-') VLRGOR
	cQry3 += "  , ISNULL(CONVERT(VARCHAR,ZLB3.ZLB_VLRANA),'-') VLRPRT
	cQry3 += "  , ISNULL(CONVERT(VARCHAR,ZLB4.ZLB_VLRANA),'-') VLRCCS
	cQry3 += "  , ISNULL(CONVERT(VARCHAR,ZLB5.ZLB_VLRANA),'-') VLRCBT
	cQry3 += "  FROM "+RetSqlName("ZLB")+" ZLB1
	cQry3 += "   LEFT JOIN "+RetSqlName("ZLB")+" ZLB2 ON (ZLB2.D_E_L_E_T_ = ' ' 
	cQry3 += "   AND ZLB2.ZLB_TIPOFX = '000001' AND ZLB1.ZLB_RETIRO+ZLB1.ZLB_RETILJ = ZLB2.ZLB_RETIRO+ZLB2.ZLB_RETILJ AND ZLB1.ZLB_DATA = ZLB2.ZLB_DATA)
	cQry3 += "   LEFT JOIN "+RetSqlName("ZLB")+" ZLB3 ON (ZLB3.D_E_L_E_T_ = ' ' 
	cQry3 += "   AND ZLB3.ZLB_TIPOFX = '000002' AND ZLB1.ZLB_RETIRO+ZLB1.ZLB_RETILJ = ZLB3.ZLB_RETIRO+ZLB3.ZLB_RETILJ AND ZLB1.ZLB_DATA = ZLB3.ZLB_DATA)
	cQry3 += "   LEFT JOIN "+RetSqlName("ZLB")+" ZLB4 ON (ZLB4.D_E_L_E_T_ = ' ' 
	cQry3 += "   AND ZLB4.ZLB_TIPOFX = '000003' AND ZLB1.ZLB_RETIRO+ZLB1.ZLB_RETILJ = ZLB4.ZLB_RETIRO+ZLB4.ZLB_RETILJ AND ZLB1.ZLB_DATA = ZLB4.ZLB_DATA)
	cQry3 += "   LEFT JOIN "+RetSqlName("ZLB")+" ZLB5 ON (ZLB5.D_E_L_E_T_ = ' ' 
	cQry3 += "   AND ZLB5.ZLB_TIPOFX = '000004' AND ZLB1.ZLB_RETIRO+ZLB1.ZLB_RETILJ = ZLB5.ZLB_RETIRO+ZLB5.ZLB_RETILJ AND ZLB1.ZLB_DATA = ZLB5.ZLB_DATA)
	cQry3 += "  WHERE ZLB1.D_E_L_E_T_ = ' ')
	cQry3 += "  AND ZLB1.ZLB_RETIRO = '"+cProdutor+"' AND ZLB1.ZLB_RETILJ = '"+cLojaProd+"'
	cQry3 += "  AND ZLB1.ZLB_DATA BETWEEN 
	cQry3 += "  		CONVERT(CHAR(8),DATEADD(m, -1, CONVERT(DATE,'"+dDataProc+"'+'01')),112) 
	cQry3 += "  	AND CONVERT(CHAR(8),DATEADD(D, -1, DATEADD(m, +1, CONVERT(DATE,'"+dDataProc+"'+'01'))),112)
	cQry3 += "  ORDER BY ZLB1.ZLB_DATA"
	
	cQry4 := " SELECT ZLF_DCREVE "
	cQry4 += " , CASE WHEN ZLF_DEBCRE = 'C' THEN ZLF_TOTAL WHEN ZLF_DEBCRE = 'D' THEN ZLF_TOTAL*-1 END AS ZLF_TOTAL "
	cQry4 += " , CASE WHEN ZLF_DEBCRE = 'C' THEN ZLF_VLRLTR WHEN ZLF_DEBCRE = 'D' THEN ZLF_VLRLTR*-1 END AS ZLF_VLRLTR "
	cQry4 += " FROM "+RetSqlName("ZLF")+" " 
	cQry4 += " WHERE D_E_L_E_T_ = ' ' "
	cQry4 += " AND ZLF_RETILJ = '"+cLojaProd+"' AND ZLF_EVENTO IN ('040001','040002','040003','040004','050004','020005') "
	cQry4 += " AND SUBSTRING(ZLF_DTINI,1,6) = '"+dDataProc+"' "

	cQry5 := " SELECT DISTINCT ZLD1.ZLD_DTCOLE "
	cQry5 += " , ISNULL(ZLD2.ZLD_QTDBOM,0) QTD "
	cQry5 += " , ISNULL(ZLD2.ZLD_AGUA,0) AGUA "
	cQry5 += " FROM "+RetSqlName("ZLD")+" (NOLOCK) ZLD1 "
	cQry5 += " LEFT JOIN ( "
	cQry5 += "  	SELECT ZLD_FILIAL, ZLD_DTCOLE, "
	//cQry5 += "  	SUM(ZLD_QTDBOM+ZLD_QTDACI) ZLD_QTDBOM," 
	cQry5 += "  	SUM(ZLD_QTDBOM) ZLD_QTDBOM," 
    cQry5 += "  	SUM(ZLD_BRTBOM - ZLD_QTDBOM) ZLD_AGUA "
	cQry5 += "  	FROM "+RetSqlName("ZLD")+"  (NOLOCK) "
	cQry5 += " 		WHERE D_E_L_E_T_ = ' ' "
	cQry5 += " 		AND ZLD_RETIRO = '"+cProdutor+"' AND ZLD_RETILJ = '"+cLojaProd+"'"
	cQry5 += " 		GROUP BY ZLD_FILIAL, ZLD_DTCOLE "
	cQry5 += "  ) ZLD2 " 
	cQry5 += " ON (ZLD1.ZLD_FILIAL = ZLD2.ZLD_FILIAL AND ZLD1.ZLD_DTCOLE = ZLD2.ZLD_DTCOLE ) "    
	cQry5 += " WHERE ZLD1.D_E_L_E_T_ = ' ' ORDER BY ZLD1.ZLD_DTCOLE "  

	//==========> CONSULTA 1 <==========
	// Verifica area aberta
	If Select("QRY") <> 0
		QRY->(DBCLOSEAREA())
	EndIF
	
	cQry1 := ChangeQuery(cQry1)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,cQry1),"QRY",.F.,.T.)
	
	QRY->(dbGoTop())
	
	oSec1:Init()  
	
	oReport:SkipLine()
	oReport:SkipLine() 
	oReport:PrintText(SPACE(5)+ "PARÂMETROS DE QUALIDADE") 
	oReport:SkipLine() 
		
	While QRY->(!Eof())
	
		oSec1:Cell("OPCAO"):SetValue(QRY->ZL9_DESCRI)
		oSec1:Cell("CLASSE1"):SetValue(QRY->CLASSE_1)
		oSec1:Cell("CLASSE2"):SetValue(QRY->CLASSE_2)
		oSec1:Cell("CLASSE3"):SetValue(QRY->CLASSE_3)
			
		oSec1:PrintLine()
	
		QRY->(dbSkip())
		
	Enddo
	
	oSec1:Finish()    
	// oReport:SkipLine() 
	// oReport:ThinLine()
	
	//==========> CONSULTA 2 <==========
	// Verifica area aberta
	If Select("QRY") <> 0
		QRY->(DBCLOSEAREA())
	EndIF
	
	cQry2 := ChangeQuery(cQry2)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,cQry2),"QRY",.F.,.T.)
	
	QRY->(dbGoTop())
	
	oSec2:Init()
	
	oReport:SkipLine()
	oReport:SkipLine() 
	oReport:PrintText(SPACE(5)+"SEUS RESULTADOS NO PERÍODO") 
	
	
While QRY->(!Eof())                            
//User Function getMIndice(cpFilial,cpSetor,cpProd,cpLj,cpTpFaixa,cpMedia,dpData)
	nVlrInd := u_getMIndice(xFILIAL("SA2"),cCodSetor,cProdutor,cLojaProd,QRY->ZL9_COD,'A',dDtFim)
	nVlrInd := round(nVlrInd,4)	   

		oSec2:Cell("OPCAO"):SetValue(QRY->ZL9_DESCRI)

		If nVlrInd >= QRY->CLASSE_1_INI .AND. nVlrInd <= QRY->CLASSE_1_FIM
			oSec2:Cell("CLASSE1"):SetValue(nVlrInd)
		Else                                       
			oSec2:Cell("CLASSE1"):SetValue('')
		Endif

		If nVlrInd >= QRY->CLASSE_2_INI .AND. nVlrInd <= QRY->CLASSE_2_FIM
			oSec2:Cell("CLASSE2"):SetValue(nVlrInd)
		Else                                       
			oSec2:Cell("CLASSE2"):SetValue('')
		Endif

		If nVlrInd >= QRY->CLASSE_3_INI .AND. nVlrInd <= QRY->CLASSE_3_FIM
			oSec2:Cell("CLASSE3"):SetValue(nVlrInd)
		Else                                       
			oSec2:Cell("CLASSE3"):SetValue('')
		Endif

		oSec2:PrintLine()
	
		QRY->(dbSkip())
	
	Enddo
	
	oSec2:Finish()     
	// oReport:SkipLine() 
	// oReport:ThinLine()


	//==========> CONSULTA 3 <==========
	// Verifica area aberta
	If Select("QRY") <> 0
		QRY->(DBCLOSEAREA())
	EndIF
	
	cQry3 := ChangeQuery(cQry3)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,cQry3),"QRY",.F.,.T.)
	
	QRY->(dbGoTop())
    
    nAvgGor := 0
    nTotGor := 0
    nAvgPrt := 0
    nTotPrt := 0
    nAvgCcs := 0
    nTotCcs := 0
    nAvgCbt := 0
    nTotCbt := 0

	oSec3:Init()
	
	oReport:SkipLine()
	oReport:SkipLine()  
	oReport:PrintText(SPACE(5)+"SEUS RESULTADOS HISTORICOS PARA COMPOSICAO DO PRECO") 
	
	
	While QRY->(!Eof())
	
		oSec3:Cell("DATA"):SetValue(STOD(QRY->ZLB_DATA))
		oSec3:Cell("GOR"):SetValue(QRY->VLRGOR)
		oSec3:Cell("CCS"):SetValue(QRY->VLRCCS)
		oSec3:Cell("PRT"):SetValue(QRY->VLRPRT)
		oSec3:Cell("CBT"):SetValue(QRY->VLRCBT)
                                  
		oSec3:PrintLine() 
		
		If QRY->VLRGOR <> '-'   
			    nAvgGor += Val(QRY->VLRGOR)
			    nTotGor += 1
		EndIf
		If QRY->VLRCCS <> '-'   
			    nAvgCcs += Val(QRY->VLRCCS)
			    nTotCcs += 1
		EndIf
		If QRY->VLRPRT <> '-'   
			    nAvgPrt += Val(QRY->VLRPRT)
			    nTotPrt += 1
		EndIf
		If QRY->VLRCBT <> '-'   
			    nAvgCbt += Val(QRY->VLRCBT)
			    nTotCbt += 1
		EndIf
	
		QRY->(dbSkip())
		
	Enddo

	oSec3:Cell("DATA"):SetValue("MEDIA")
	oSec3:Cell("GOR"):SetValue(nAvgGor/nTotGor)
	oSec3:Cell("CCS"):SetValue(nAvgCcs/nTotCcs)  
	oSec3:Cell("PRT"):SetValue(nAvgPrt/nTotPrt)  
	oSec3:Cell("CBT"):SetValue(nAvgCbt/nTotCbt)  
	oSec3:PrintLine()


	oSec3:Finish() 
	// oReport:SkipLine()

         
	
	//==========> CONSULTA 4 <==========
	// Verifica area aberta
	If Select("QRY") <> 0
		QRY->(DBCLOSEAREA())
	EndIF
	
	cQry4 := ChangeQuery(cQry4)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,cQry4),"QRY",.F.,.T.)
	
	QRY->(dbGoTop())
	
	nVlrTot := 0
	nVlrLtr := 0
		
	oSec4:Init()
	
	oReport:SkipLine()
	oReport:SkipLine()  
	oReport:PrintText(SPACE(5)+"DIFERENCIAL DE QUALIDADE NO PREÇO (PERÍODO REFERÊNCIA)") 

	
	While QRY->(!Eof())
	
		oSec4:Cell("EVENTO"):SetValue(QRY->ZLF_DCREVE)
		oSec4:Cell("VALOR"):SetValue(QRY->ZLF_TOTAL)
		oSec4:Cell("VALORLITRO"):SetValue(QRY->ZLF_VLRLTR)
			
		oSec4:PrintLine() 
		
		nVlrTot += QRY->ZLF_TOTAL
		nVlrLtr += QRY->ZLF_VLRLTR
	
		QRY->(dbSkip())
		
	Enddo

	oSec4:Cell("EVENTO"):SetValue("TOTAL")
	oSec4:Cell("VALOR"):SetValue(nVlrTot)
	oSec4:Cell("VALORLITRO"):SetValue(nVlrLtr)  
	oSec4:PrintLine()
	
	oSec4:Finish() 
	// oReport:SkipLine() 
	// oReport:ThinLine()
	
	//==========> CONSULTA 5 <==========
	// Verifica area aberta
	If Select("QRY") <> 0
		QRY->(DBCLOSEAREA())
	EndIF
	
	cQry5 := ChangeQuery(cQry5)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,cQry5),"QRY",.F.,.T.)
	
	QRY->(dbGoTop())
	
	oSec5:Init()
	
	oReport:SkipLine()
	oReport:SkipLine()
	oReport:PrintText(SPACE(5)+"DIÁRIO DO PRODUTOR") 
	
	nTotalLeite := 0
	nTotalAgua  := 0
	
	While QRY->(!Eof())
	
		oSec5:Cell("RECEPCAO1"):SetValue(DTOC(STOD(QRY->ZLD_DTCOLE)))
		oSec5:Cell("VOLUME1"):SetValue(QRY->QTD) 
		oSec5:Cell("AGUA1"):SetValue(QRY->AGUA)
 		                                          
 		nTotalLeite += QRY->QTD
 		nTotalAgua  += QRY->AGUA
 		
 		oSec5:Cell("RECEPCAO1"):SetBorder("LEFT") 
		oSec5:Cell("RECEPCAO1"):SetBorder("RIGHT") 
		oSec5:Cell("VOLUME1"):SetBorder("RIGHT")
		oSec5:Cell("AGUA1"):SetBorder("RIGHT") 
		
		oSec5:Cell("RECEPCAO1"):SetHeaderAlign("CENTER")
		oSec5:Cell("RECEPCAO1"):SetAlign("CENTER")
		oSec5:Cell("VOLUME1"):SetHeaderAlign("CENTER")
		oSec5:Cell("VOLUME1"):SetAlign("CENTER")
		oSec5:Cell("AGUA1"):SetHeaderAlign("CENTER")
		oSec5:Cell("AGUA1"):SetAlign("CENTER")
		
		QRY->(dbSkip())
		
		oSec5:Cell("RECEPCAO2"):SetValue(DTOC(STOD(QRY->ZLD_DTCOLE)))
		oSec5:Cell("VOLUME2"):SetValue(QRY->QTD) 
		oSec5:Cell("AGUA2"):SetValue(QRY->AGUA)  

 		nTotalLeite += QRY->QTD
 		nTotalAgua  += QRY->AGUA
		
		oSec5:Cell("RECEPCAO2"):SetBorder("RIGHT") 
		oSec5:Cell("VOLUME2"):SetBorder("RIGHT")
		oSec5:Cell("AGUA2"):SetBorder("RIGHT") 
		
		oSec5:Cell("RECEPCAO2"):SetHeaderAlign("CENTER")
		oSec5:Cell("RECEPCAO2"):SetAlign("CENTER")
		oSec5:Cell("VOLUME2"):SetHeaderAlign("CENTER")
		oSec5:Cell("VOLUME2"):SetAlign("CENTER")
		oSec5:Cell("AGUA2"):SetHeaderAlign("CENTER")
		oSec5:Cell("AGUA2"):SetAlign("CENTER")
		
		QRY->(dbSkip())
		
		oSec5:Cell("RECEPCAO3"):SetValue(DTOC(STOD(QRY->ZLD_DTCOLE)))
		oSec5:Cell("VOLUME3"):SetValue(QRY->QTD) 
		oSec5:Cell("AGUA3"):SetValue(QRY->AGUA)  

 		nTotalLeite += QRY->QTD
 		nTotalAgua  += QRY->AGUA
		
		oSec5:Cell("RECEPCAO3"):SetBorder("RIGHT") 
		oSec5:Cell("VOLUME3"):SetBorder("RIGHT")
		oSec5:Cell("AGUA3"):SetBorder("RIGHT") 
		
		oSec5:Cell("RECEPCAO3"):SetHeaderAlign("CENTER")
		oSec5:Cell("RECEPCAO3"):SetAlign("CENTER")
		oSec5:Cell("VOLUME3"):SetHeaderAlign("CENTER")
		oSec5:Cell("VOLUME3"):SetAlign("CENTER")
		oSec5:Cell("AGUA3"):SetHeaderAlign("CENTER")
		oSec5:Cell("AGUA3"):SetAlign("CENTER")
		
		oSec5:PrintLine()
	
		QRY->(dbSkip())
		
	Enddo
	
	oReport:SkipLine() 

	oSec5:Cell("RECEPCAO1"):SetValue("GERAL")
	oSec5:Cell("VOLUME1"):SetValue(nTotalLeite) 
	oSec5:Cell("AGUA1"):SetValue(nTotalAgua)

	oSec5:Cell("RECEPCAO2"):SetValue("")
	oSec5:Cell("VOLUME2"):SetValue("") 
	oSec5:Cell("AGUA2"):SetValue("")
	oSec5:Cell("RECEPCAO3"):SetValue("")
	oSec5:Cell("VOLUME3"):SetValue("") 
	oSec5:Cell("AGUA3"):SetValue("")



	oSec5:PrintLine()    
	
	oSec5:Finish() 
	// oReport:SkipLine() 
  //oReport:FatLine()
	
	//==========> FINAL CONSULTAS <==========
	
	oReport:EndPage()
	oReport:StartPage()
			
	QRY->(dbCloseArea()) 
	
	_QRY->(dbSkip())
	// SA2->(dbSkip()) 
	// cProdutor := SA2->A2_COD
	// cLojaProd := SA2->A2_LOJA

EndDo
	
Return oReport


Static Function AjustaSX1(cPerg)  

aHelpPor := {}
Aadd( aHelpPor, 'Informe o mês para calculo de   ')
Aadd( aHelpPor, 'informacoes de qualidade')
U_xPutSx1(cPerg,"01","Mês Processamento: "," "," ","mv_ch1","N",2,0,0,"G",'NaoVazio()',"","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,{},{})

aHelpPor := {}
Aadd( aHelpPor, 'Informe o ano para calculo de  ')
Aadd( aHelpPor, 'informacoes de qualidade')
U_xPutSx1(cPerg,"02","Ano Processamento: "," "," ","mv_ch2","N",4,0,0,"G",'NaoVazio()',"","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,{},{})

aHelpPor := {} 
aTam	:= TamSX3("A2_COD") 
aAdd( aHelpPor, "Do Produtor: ")
U_xPutSx1(cPerg, "03","Do Produtor ","","","mv_ch3",aTam[3],aTam[1],aTam[2],0,"G","","SA2","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,{},{})

aHelpPor := {} 
aTam	:= TamSX3("A2_COD") 
aAdd( aHelpPor, "Ao Produtor: ")
U_xPutSx1(cPerg, "04","Ao Produtor ","","","mv_ch4",aTam[3],aTam[1],aTam[2],0,"G","","SA2","","","mv_par04","","","","","","","","","","","","","","","","",aHelpPor,{},{})

Return  


STATIC FUNCTION CABECPROD()

oReport:FatLine() 
oReport:SkipLine()
oReport:PrintText(SPACE(10)+"COD/LOJA   : " + cProdutor + " - " + cLojaProd + " ") 
oReport:PrintText(SPACE(10)+"NOME       : " + ALLTRIM(cNomeProd) + " ")
oReport:SkipLine()
oReport:FatLine() 

RETURN