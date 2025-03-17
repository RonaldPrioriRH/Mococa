#INCLUDE "PROTHEUS.CH"
#INCLUDE "REPORT.CH"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ RGLT036  บ Autor ณ TOTVS              บ Data ณ  07/21/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ  Informe de Rendimentos do Produtor                        บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
////Fonte subistituido pelo RGLT303
User Function RGLT036()

Local oReport
Local oCab
Local oDet
Local oBreak
Local cAno   := ""
Local i := 0
Local cMasc1 := "@E 9,999,999"
Local cMasc2 := "@E 999,999.99"
Local cMasc3 := "@E 999,999,999.99"
Local cDesc  := "O objetivo deste relatorio ้ listar um resumo de todas as movimenta็๕es do produtor mensalmente. "+;
                "Normalmente esse relat๓rio ้ impresso e entregue ao produtor, para o mesmo fazer a declara็ใo de Imposto de Renda."

Private cPerg  := PADR("RGLT036",10)
Private cAlias := GetNextAlias()
Private cFiltro:= ""     
Private nCota := 0

//Cria e chama as perguntas
ValidPerg(cPerg)
Pergunte(cPerg,.T.)

//Tratamento para impressao do Periodo
cAno := SubStr(DTOS(MV_PAR02),1,4)

DEFINE REPORT oReport NAME cPerg TITLE "Informe de Rendimentos do Produtor - Exercicio "+cAno PARAMETER cPerg ACTION {|oReport| PrintReport(oReport)} DESCRIPTION cDesc

oReport:SetTotalInLine(.F.)
oReport:nFontBody   := 10//Define o tamanho da fonte
oReport:nLineHeight	:= 50//Define a altura da linha

//Cria a secao do cabecalho
DEFINE SECTION oCab OF oReport TITLE "Cabecalho" TABLES "SA2"
DEFINE CELL NAME "Produtor" OF oCab Title ' ' block {|| PadR("Produtor: " + (cAlias)->ZLF_RETIRO + space(2) + (cAlias)->ZLF_RETILJ + space(2) + Trim((cAlias)->A2_NOME),60) + "CPF: " + Transform((cAlias)->A2_CGC,"@R 999.999.999-99") } SIZE 150
DEFINE CELL NAME "Fazenda"  OF oCab Title ' ' block {|| PadR("Fazenda: " + Trim((cAlias)->A2_L_FAZEN),60) + "Inscri็ใo: " + (cAlias)->A2_INSCR } SIZE 150
DEFINE CELL NAME "Cota"   OF oCab  Title ' '  block {|| PadR("Cota: R$ " + Transform(nCota,"@E 999,999,999.99"),60) + " " } SIZE 150
DEFINE BREAK oBreak OF oCab WHEN {|| (cAlias)->ZLF_RETIRO+(cAlias)->ZLF_RETILJ }  
oCab:SetLineCondition({|| ProcLin( ) })
oCab:lLineStyle := .T.
oCab:SetPageBreak(.T.)


//Cria a secao dos Itens
DEFINE SECTION oDet OF oCab TITLE "Detalhes" TABLE "ZLF" TOTAL TEXT "Totais" TOTAL IN COLUMN //PAGE HEADER
DEFINE CELL NAME "Mes"    OF oDet ALIAS "ZLF" TITLE "Referencia   "                block {|| MesExtenso(StoD((cAlias)->ANOMES+'01')) }
DEFINE CELL NAME "Quanti" OF oDet ALIAS "ZLF" TITLE "Litragem     " PICTURE cMasc1 block {|| (cAlias)->QTDE       }
DEFINE CELL NAME "Rendto" OF oDet ALIAS "ZLF" TITLE "_Rendimentos_" PICTURE cMasc3 block {|| (cAlias)->RENDIMENTO }
//DEFINE CELL NAME "Compra" OF oDet ALIAS "ZLF" TITLE "Conv/Compra  " PICTURE cMasc2 block {|| (cAlias)->COMPRA     }
//DEFINE CELL NAME "Fincto" OF oDet ALIAS "ZLF" TITLE "Financiamento" PICTURE cMasc2 block {|| (cAlias)->FINANCTOS  }
//DEFINE CELL NAME "Adimto" OF oDet ALIAS "ZLF" TITLE "Adiantamento " PICTURE cMasc2 block {|| (cAlias)->ADTOS      }
DEFINE CELL NAME "Funrur" OF oDet ALIAS "ZLF" TITLE "Vlr. Funrural" PICTURE cMasc2 block {|| (cAlias)->FUNRURAL   }
DEFINE CELL NAME "Frete" OF oDet ALIAS "ZLF" TITLE "Vlr. Frete" PICTURE cMasc2 block {|| (cAlias)->FRETE   }
// DEFINE CELL NAME "Liquid" OF oDet ALIAS "ZLF" TITLE "Saldo Liquido" PICTURE cMasc3 block {|| (cAlias)->RENDIMENTO-(cAlias)->COMPRA-(cAlias)->FINANCTOS-(cAlias)->ADTOS-(cAlias)->FUNRURAL }


//Acrescenta Bordas nas colunas
oDet:Cell("Mes"   ):SetBorder("RIGHT")
oDet:Cell("Quanti"):SetBorder("RIGHT")
oDet:Cell("Rendto"):SetBorder("RIGHT")
//oDet:Cell("Compra"):SetBorder("RIGHT")
//oDet:Cell("Fincto"):SetBorder("RIGHT")
//oDet:Cell("Adimto"):SetBorder("RIGHT")
oDet:Cell("Funrur"):SetBorder("RIGHT")
oDet:Cell("Frete"):SetBorder("RIGHT")


//Totaliza as colunas
DEFINE FUNCTION FROM oDet:Cell("Quanti") FUNCTION SUM NO END REPORT
DEFINE FUNCTION FROM oDet:Cell("Rendto") FUNCTION SUM NO END REPORT
//DEFINE FUNCTION FROM oDet:Cell("Compra") FUNCTION SUM NO END REPORT
//DEFINE FUNCTION FROM oDet:Cell("Fincto") FUNCTION SUM NO END REPORT
//DEFINE FUNCTION FROM oDet:Cell("Adimto") FUNCTION SUM NO END REPORT
DEFINE FUNCTION FROM oDet:Cell("Funrur") FUNCTION SUM NO END REPORT
DEFINE FUNCTION FROM oDet:Cell("Frete") FUNCTION SUM NO END REPORT


oReport:PrintDialog()

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ RGLT036  บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function PrintReport(oReport)

Local cDataDe  := SUBSTR(DtoS(MV_PAR01),1,6)
Local cDataAte := SUBSTR(DtoS(MV_PAR02),1,6)
Local cProdDe  := MV_PAR03
Local cProdAte := MV_PAR04
Local cLojaDe  := MV_PAR05
Local cLojaAte := MV_PAR06
Local cRotaDe  := MV_PAR07
Local cRotaAte := MV_PAR08
Local cPrefVen   := ""  


#IFDEF TOP
	MakeSqlExp("REPORT")
	BEGIN REPORT QUERY oReport:Section(1)
	
	BeginSql alias cAlias
		%noparser% EXEC RGLT036 %exp:cDataDe%, %exp:cDataAte%, %exp:cProdDe%, %exp:cProdAte%, %exp:cLojaDe%, %exp:cLojaAte%
	EndSql
	
	END REPORT QUERY oReport:Section(1)
	
	oReport:Section(1):Section(1):SetParentQuery() 
	oReport:Section(1):Section(1):SetParentFilter({|cParam| (cAlias)->ZLF_RETIRO+(cAlias)->ZLF_RETILJ == cParam},{|| (cAlias)->ZLF_RETIRO+(cAlias)->ZLF_RETILJ})
	oReport:Section(1):Print()
#ENDIF

Return



Static Function ProcLin()
	nCota := U_getSldCota(DtoS(MV_PAR01),DtoS(MV_PAR02),(cAlias)->ZLF_RETIRO)
return .T.

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT036   บAutor  ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Cria as perguntas do relatorio, caso nao existam.          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao de Leite                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ValidPerg()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

//Periodo Inicial
Aadd( aHelpPor, 'Informe a data inicial do periodo que')
Aadd( aHelpPor, 'deseja verificar a movimentacao.')
U_xPutSx1(cPerg,"01","Periodo de:","","","mv_ch1","D",8,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Periodo Final
Aadd( aHelpPor, 'Informe a data final do periodo que')
Aadd( aHelpPor, 'deseja verificar a movimentacao.')
U_xPutSx1(cPerg,"02","Periodo At้:","","","mv_ch2","D",8,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"03","Do Produtor:"," "," ","mv_ch3","C",6,0,0,"G","","SA2_L9","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"04","Ate Produtor:"," "," ","mv_ch4","C",6,0,0,"G","","SA2_L9","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe a loja inicial do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"05","Da Loja:"," "," ","mv_ch5","C",2,0,0,"G","","","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate a Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe a loja final do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"06","Ate Loja:"," "," ","mv_ch6","C",2,0,0,"G","","","","","MV_PAR06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Rota
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial da rota   ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"07","Da Rota"," "," ","mv_ch7","C",6,0,0,"G","","ZLW_01","","","MV_PAR07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate a Rota
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final   da rota   ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"08","Ate a Rota"," "," ","mv_ch8","C",6,0,0,"G","","ZLW_01","","","MV_PAR08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return

/*

ALTER PROCEDURE [dbo].[RGLT036] (@MESINI CHAR(6), @MESFIM CHAR(6), @CODINI CHAR(6), @CODFIM CHAR(6), @LJINI CHAR(2), @LJFIM CHAR(2)) AS
-- =============================================
-- Author:		Pedro Tobaruela Ortiz
-- Create date: 24/07/14
-- Description:	Responsแvel por gerar o Informe de Rendimentos - COOPRATA
-- =============================================

BEGIN


	-- O PRIMEIRO BLOCO DESTA PROCEDURE IRม GERAR VมRIAS TABELAS TEMPORมRIAS QUE SERรO AMARRADAS NO FIM


//			SELECT DISTINCT SUBSTRING(ZLF_DTINI,1,6) PERIODO, ZLF_RETIRO+'/'+ZLF_RETILJ MATRICULA INTO #MATRICULAS 
//			FROM ZLF010 (NOLOCK) 
//			WHERE D_E_L_E_T_ = '' AND (ZLF_EVENTO = '010001' OR ZLF_VERSAO = '2')
//			AND SUBSTRING(ZLF_DTINI,1,6) BETWEEN @MESINI AND @MESFIM
//			AND ZLF_RETIRO BETWEEN @CODINI AND @CODFIM
//			AND ZLF_RETILJ BETWEEN @LJINI AND @LJFIM

		-- RELAวรO DAS MATRอCULAS QUE TIVERAM MOVIMENTAวรO NO C/C NO MสS
		  SELECT DISTINCT SUBSTRING(ZLF_DTINI,1,6) PERIODO, A2_COD+'/'+A2_LOJA MATRICULA INTO #MATRICULAS 
			FROM SA2010 (NOLOCK) A2
			LEFT JOIN ZLF010  LF ON  A2.A2_COD = ZLF_RETIRO AND  A2.A2_LOJA = ZLF_RETILJ 
				AND (ZLF_EVENTO = '010001' OR ZLF_VERSAO = '2')
				AND SUBSTRING(ZLF_DTINI,1,6) BETWEEN @MESINI AND @MESFIM
				AND LF.D_E_L_E_T_ = ''
			WHERE A2.D_E_L_E_T_ = ''
			AND A2_COD BETWEEN @CODINI AND @CODFIM
			AND A2_LOJA BETWEEN @LJINI AND @LJFIM
--			AND A2_LOJA = ( SELECT MIN(A2_LOJA) FROM SA2010 SA21 WHERE SA21.A2_COD = A2.A2_COD AND SA21.D_E_L_E_T_ = '')			

			-- QUANTIDADES DE LEITE COTA E มCIDO E DOS VALORES CONTIDOS NOS EVENTOS DE BASE
			SELECT SUBSTRING(ZLF_DTINI,1,6) PERIODO, ZLF_RETIRO+'/'+ZLF_RETILJ MATRICULA
			, MAX(ZLF_QTDBOM) QTD_COTA, MAX(ZLF_QTDACI) QTD_ACIDO, SUM(ZLF_TOTAL) VLR_COTA, 0 VLR_ACIDO
			INTO #BASELEITE
			FROM ZLF010 (NOLOCK) ZLF
			WHERE D_E_L_E_T_ = '' 
			AND SUBSTRING(ZLF.ZLF_EVENTO,1,2) IN ('01','02') AND ZLF.ZLF_EVENTO <> '020005'
			AND SUBSTRING(ZLF.ZLF_DTINI,1,6) BETWEEN @MESINI AND @MESFIM
			AND ZLF.ZLF_RETIRO BETWEEN @CODINI AND @CODFIM
			AND ZLF.ZLF_RETILJ BETWEEN @LJINI AND @LJFIM
			GROUP BY SUBSTRING(ZLF_DTINI,1,6), ZLF_RETIRO, ZLF_RETILJ

			-- VALORES CONTIDOS NOS EVENTOS DE BONIFICAวรO DE QUALIDADE
			SELECT SUBSTRING(ZLF_DTINI,1,6) PERIODO, ZLF_RETIRO+'/'+ZLF_RETILJ MATRICULA
			, SUM(ZLF_TOTAL) VLR_QUAL
			INTO #QUALIDADE
			FROM ZLF010 (NOLOCK) ZLF
			WHERE ZLF.D_E_L_E_T_ = '' 
			AND ZLF.ZLF_EVENTO IN ('020005','040001','040002','040003','040004','040005') --ALTERADO 02.03.17-ERIVELTON ACRESCENTOU 040005 TEMP
			AND SUBSTRING(ZLF.ZLF_DTINI,1,6) BETWEEN @MESINI AND @MESFIM
			AND ZLF.ZLF_RETIRO BETWEEN @CODINI AND @CODFIM
			AND ZLF.ZLF_RETILJ BETWEEN @LJINI AND @LJFIM
			GROUP BY SUBSTRING(ZLF_DTINI,1,6), ZLF.ZLF_RETIRO, ZLF.ZLF_RETILJ

			-- VALORES CONTIDOS NOS EVENTOS REDUTORES DE QUALIDADE
			SELECT SUBSTRING(ZLF_DTINI,1,6) PERIODO, ZLF_RETIRO+'/'+ZLF_RETILJ MATRICULA
			, SUM(ZLF_TOTAL) VLR_RQUAL
			INTO #RQUALIDADE
			FROM ZLF010 (NOLOCK) ZLF
			WHERE ZLF.D_E_L_E_T_ = '' 
			AND ZLF.ZLF_EVENTO IN ('050004','050005') --ALTERADO 02.03.17-ERIVELTON ACRESCENTOU 050005 DESC DA TEMP
			AND SUBSTRING(ZLF.ZLF_DTINI,1,6) BETWEEN @MESINI AND @MESFIM
			AND ZLF.ZLF_RETIRO BETWEEN @CODINI AND @CODFIM
			AND ZLF.ZLF_RETILJ BETWEEN @LJINI AND @LJFIM
			GROUP BY SUBSTRING(ZLF_DTINI,1,6), ZLF.ZLF_RETIRO, ZLF.ZLF_RETILJ

			-- VALORES DE REPASSE DE FRETE
			SELECT SUBSTRING(ZLF_DTINI,1,6) PERIODO, ZLF.ZLF_RETIRO+'/'+ZLF.ZLF_RETILJ MATRICULA
			, ZLF.ZLF_TOTAL FRT_TOTAL
			INTO #FRETES
			FROM ZLF010 (NOLOCK) ZLF
			INNER JOIN (SELECT SUBSTRING(ZLF_DTINI,1,6) PERIODO, ZLF_RETIRO, ZLF_RETILJ, MIN(ZLF_SEQ) ZLF_SEQ FROM ZLF010 (NOLOCK) 
						WHERE D_E_L_E_T_ = '' 
						AND ZLF_EVENTO IN ('070001')
						AND SUBSTRING(ZLF_DTINI,1,6) BETWEEN @MESINI AND @MESFIM
						AND ZLF_RETIRO BETWEEN @CODINI AND @CODFIM
						AND ZLF_RETILJ BETWEEN @LJINI AND @LJFIM
						GROUP BY SUBSTRING(ZLF_DTINI,1,6), ZLF_RETIRO, ZLF_RETILJ
						) MINIMO 
			ON (MINIMO.PERIODO = SUBSTRING(ZLF.ZLF_DTINI,1,6) AND MINIMO.ZLF_RETIRO = ZLF.ZLF_RETIRO AND MINIMO.ZLF_RETILJ = ZLF.ZLF_RETILJ AND MINIMO.ZLF_SEQ = ZLF.ZLF_SEQ)
			WHERE ZLF.D_E_L_E_T_ = '' 
			AND ZLF.ZLF_EVENTO = '070001'
			AND SUBSTRING(ZLF.ZLF_DTINI,1,6) BETWEEN @MESINI AND @MESFIM

			-- VALORES DE FUNRURAL E SENAR
			SELECT SUBSTRING(E2_EMISSAO,1,6) PERIODO, E2_FORNECE+'/'+E2_LOJA MATRICULA, SUM(E2_VALOR) FUN_TOTAL 
			INTO #FUNRURAL
			FROM SE2010 (NOLOCK) WHERE D_E_L_E_T_ = '' AND E2_L_EVENT IN ('120000','120001') 
			AND SUBSTRING(E2_EMISSAO,1,6) BETWEEN @MESINI AND @MESFIM 
			AND E2_FORNECE BETWEEN @CODINI AND @CODFIM AND E2_LOJA BETWEEN @LJINI AND @LJFIM
			GROUP BY SUBSTRING(E2_EMISSAO,1,6), E2_FORNECE, E2_LOJA 

			INSERT INTO #FUNRURAL
			SELECT SUBSTRING(ZLF_DTINI,1,6) PERIODO, ZLF.ZLF_RETIRO+'/'+ZLF.ZLF_RETILJ MATRICULA
			, SUM(ZLF.ZLF_TOTAL) FUN_TOTAL 
			FROM ZLF010 (NOLOCK) ZLF
			INNER JOIN (SELECT DISTINCT SUBSTRING(ZLF_DTINI,1,6) PERIODO, ZLF_RETIRO, ZLF_RETILJ, ZLF_SE2HIS, MIN(R_E_C_N_O_) REC   
						FROM ZLF010 (NOLOCK) 
						WHERE D_E_L_E_T_ = '' 
						AND ZLF_EVENTO IN ('120000','120001') AND ZLF_CODZLE IN ('000001','000002')
						AND SUBSTRING(ZLF_DTINI,1,6) BETWEEN @MESINI AND @MESFIM
						AND CONVERT(CHAR(6),DATEADD(d,1,CONVERT(DATE,ZLF_DTFIM)),112) = SUBSTRING(ZLF_SE2VEN,1,6)
						AND ZLF_RETIRO BETWEEN @CODINI AND @CODFIM
						AND ZLF_RETILJ BETWEEN @LJINI AND @LJFIM
						GROUP BY SUBSTRING(ZLF_DTINI,1,6), ZLF_RETIRO, ZLF_RETILJ, ZLF_SE2HIS 
						) MINIMO 
			ON (MINIMO.PERIODO = SUBSTRING(ZLF.ZLF_DTINI,1,6) AND MINIMO.ZLF_RETIRO = ZLF.ZLF_RETIRO AND MINIMO.ZLF_RETILJ = ZLF.ZLF_RETILJ 
			AND MINIMO.REC = ZLF.R_E_C_N_O_)
			WHERE ZLF.D_E_L_E_T_ = '' 
			AND ZLF.ZLF_EVENTO IN ('120000','120001') AND ZLF.ZLF_CODZLE IN ('000001','000002')
			AND SUBSTRING(ZLF.ZLF_DTINI,1,6) BETWEEN @MESINI AND @MESFIM
			GROUP BY SUBSTRING(ZLF_DTINI,1,6), ZLF.ZLF_RETIRO+'/'+ZLF.ZLF_RETILJ


			SELECT PERIODO, MATRICULA, SUM(ZLF_TOTAL) ZLF_TOTAL 
			INTO #COMPLEMENTO
			FROM (
				SELECT SUBSTRING(ZLF_DTINI,1,6) PERIODO, ZLF_RETIRO+'/'+ZLF_RETILJ MATRICULA
				, ZLF_TOTAL
				FROM ZLF010 
				WHERE D_E_L_E_T_ = '' AND ZLF_VERSAO = '2' 
				AND SUBSTRING(ZLF_DTINI,1,6) BETWEEN @MESINI AND @MESFIM
				AND ZLF_RETIRO BETWEEN @CODINI AND @CODFIM
				AND ZLF_RETILJ BETWEEN @LJINI AND @LJFIM
				UNION
				SELECT SUBSTRING(D1_EMISSAO,1,6), D1_FORNECE+'/'+D1_LOJA, D1_TOTAL  FROM SD1010 SD1
				WHERE SD1.D_E_L_E_T_ = '' AND D1_FILIAL = '010101' AND D1_TES = '017' AND D1_UM = 'L' AND D1_LOCAL = '90' AND D1_TIPO = 'C' 
				AND SUBSTRING(D1_EMISSAO,1,6) BETWEEN @MESINI AND @MESFIM  
				AND D1_FORNECE BETWEEN @CODINI AND @CODFIM
				AND D1_LOJA BETWEEN @LJINI AND @LJFIM
			) COMPLEMENTOS GROUP BY PERIODO, MATRICULA	


			--SELECT SUBSTRING(ZLF_DTINI,1,6) PERIODO, ZLF_RETIRO+'/'+ZLF_RETILJ MATRICULA
			--, ZLF_TOTAL
			--INTO #COMPLEMENTO
			--FROM ZLF010 
			--WHERE D_E_L_E_T_ = '' AND ZLF_VERSAO = '2' 
			--AND SUBSTRING(ZLF_DTINI,1,6) BETWEEN @MESINI AND @MESFIM
			--AND ZLF_RETIRO BETWEEN @CODINI AND @CODFIM
			--AND ZLF_RETILJ BETWEEN @LJINI AND @LJFIM
			--UNION
			--SELECT SUBSTRING(D1_EMISSAO,1,6), D1_FORNECE+'/'+D1_LOJA, D1_TOTAL  FROM SD1010 SD1
			--WHERE SD1.D_E_L_E_T_ = '' AND D1_FILIAL = '010101' AND D1_TES = '017' AND D1_UM = 'L' AND D1_LOCAL = '90' AND D1_TIPO = 'C' 
			--AND SUBSTRING(D1_EMISSAO,1,6) BETWEEN @MESINI AND @MESFIM  
			--AND D1_FORNECE BETWEEN @CODINI AND @CODFIM
			--AND D1_LOJA BETWEEN @LJINI AND @LJFIM	

	-- GERA O MAPA AMARRANDO TODAS AS TABELAS TEMPORมRIAS
	SELECT PERIODO ANOMES, SUBSTRING(MATRICULA,1,6) ZLF_RETIRO, SUBSTRING(MATRICULA,8,2) ZLF_RETILJ
		, A2_NOME, A2_L_FAZEN, A2_CGC, A2_INSCR
		, QTD_COTA+QTD_ACIDO QTDE
		, VLR_COTA+VLR_ACIDO+VLR_QUAL-VLR_RQUAL+CPM_TOTAL RENDIMENTO, FUN_TOTAL FUNRURAL, FRT_TOTAL FRETE
	FROM (
		SELECT DISTINCT MATRICULAS.PERIODO, MATRICULAS.MATRICULA
				, ISNULL(BASELEITE.QTD_COTA,0) QTD_COTA, ISNULL(BASELEITE.QTD_ACIDO,0) QTD_ACIDO
				, ISNULL(BASELEITE.VLR_COTA,0) VLR_COTA, ISNULL(BASELEITE.VLR_ACIDO,0) VLR_ACIDO
				, ISNULL(QUALIDADE.VLR_QUAL,0) VLR_QUAL, ISNULL(RQUALIDADE.VLR_RQUAL,0) VLR_RQUAL
				, ISNULL(FRETES.FRT_TOTAL,0) FRT_TOTAL, ISNULL(FUNRURAL.FUN_TOTAL,0) FUN_TOTAL
				, ISNULL(COMPLEMENTO.ZLF_TOTAL,0) CPM_TOTAL
		FROM #MATRICULAS MATRICULAS
		LEFT JOIN #BASELEITE BASELEITE ON (MATRICULAS.PERIODO = BASELEITE.PERIODO AND MATRICULAS.MATRICULA = BASELEITE.MATRICULA)
		LEFT JOIN #QUALIDADE QUALIDADE ON (MATRICULAS.PERIODO = QUALIDADE.PERIODO AND MATRICULAS.MATRICULA = QUALIDADE.MATRICULA)
		LEFT JOIN #RQUALIDADE RQUALIDADE ON (MATRICULAS.PERIODO = RQUALIDADE.PERIODO AND MATRICULAS.MATRICULA = RQUALIDADE.MATRICULA)
		LEFT JOIN #FRETES FRETES ON (MATRICULAS.PERIODO = FRETES.PERIODO AND MATRICULAS.MATRICULA = FRETES.MATRICULA)
		LEFT JOIN #FUNRURAL FUNRURAL ON (MATRICULAS.PERIODO = FUNRURAL.PERIODO AND MATRICULAS.MATRICULA = FUNRURAL.MATRICULA)
		LEFT JOIN #COMPLEMENTO COMPLEMENTO ON (MATRICULAS.PERIODO = COMPLEMENTO.PERIODO AND MATRICULAS.MATRICULA = COMPLEMENTO.MATRICULA)
	) MAPA 
	INNER JOIN SA2010 A2 ON (A2.D_E_L_E_T_ = '' AND A2_COD+'/'+A2_LOJA = MATRICULA)

	ORDER BY 2, 3, 1

	-- EXCLUI AS TABELAS TEMPORมRIAS DA MEMำRIA DO BANCO DE DADOS
	DROP TABLE #MATRICULAS
	DROP TABLE #BASELEITE
	DROP TABLE #QUALIDADE
	DROP TABLE #RQUALIDADE
	DROP TABLE #FRETES
	DROP TABLE #FUNRURAL
	DROP TABLE #COMPLEMENTO

END
GO

*/