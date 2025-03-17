#INCLUDE "totvs.ch"
#INCLUDE "fileio.ch"
#INCLUDE "topconn.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ RFATR004 บAutor  ณTarcisio Silva MirandaบDataณ  20/03/2018 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Pedidos vs Impostos.			 							  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ 						                                      บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function RFATR004()

	// Declaracao de Variaveis
	Local 	aArea 		:= GetArea()
	Local	cQry        := ""
	Local 	cEol        := chr(13)+chr(10)

	Local 	dDtPedDe	:= StoD("")
	Local	dDtPedAte	:= StoD("")	
	Local 	cPedDe		:= ""
	Local	cPedAte		:= ""	
	Local	cCliDe		:= ""
	Local 	cCliAte		:= ""	
	Local 	cLjCliDe	:= ""
	Local	cLjCliAte	:= ""	
	Local 	cFilDe		:= ""
	Local	cFilAte		:= ""

	////////////////////////////////////////////////////////////////////////
	///Outras Variaveis
	////////////////////////////////////////////////////////////////////////
	Private cLocFile    := ""
	Private cPerg       := "RFATR004"

	////////////////////////////////////////////////////////////////////////
	///Cria as perguntas no SX1
	////////////////////////////////////////////////////////////////////////
	ValPer01()

	if !Pergunte(cPerg,.t.)
		return
	endif

	dDtPedDe	:= dTos(mv_par01)
	dDtPedAte	:= dTos(mv_par02)	
	cPedDe		:= mv_par03
	cPedAte		:= mv_par04	
	cCliDe		:= mv_par05
	cCliAte		:= mv_par06	
	cLjCliDe	:= mv_par07
	cLjCliAte	:= mv_par08	
	cFilDe		:= mv_par09
	cFilAte		:= mv_par10

	cLocFile 	:= mv_par11

	cQry:=" SELECT C5_XPVSGAC AS PEDIDO_WINT,C6_NUM AS PEDIDO, SUBSTR(C5_EMISSAO,7,2)||'/'||SUBSTR(C5_EMISSAO,5,2)||'/'||SUBSTR(C5_EMISSAO,1,4) AS DATA_PEDIDO,  						" +cEOL
	cQry+=" SUBSTR(C5_EMISSAO,5,2) AS MES_PEDIDO, SUBSTR(C5_EMISSAO,1,4) AS ANO_PEDIDO,C6_PRCVEN AS PRCVEN,																				" +cEOL
	cQry+=" A1_XWINTHO AS CLIENTE_WINT, A1_COD AS COD_CLI,TRIM(A1_NOME) AS  NOMECLI,A1_LOJA AS LOJA_CLI,A1_GRPVEN AS COD_GRUPO_ECON, ACY_DESCRI AS GRUPO_ECON, A1_NREDUZ AS FATASI_CLI, " +cEOL
	cQry+=" A1_CODSEG AS COD_SEG,AOV_DESSEG AS DESC_SEG, TRIM(A1_END) AS END_CLI,TRIM(A1_BAIRRO) AS BAIRRO,TRIM(A1_MUN) AS MUNICIPIO,A1_EST AS EST,SA3010.A3_NOME AS NM_VEND, 			" +cEOL
	cQry+=" CASE SA3010.A3_TIPO WHEN 'I' THEN 'INTERNO' WHEN 'E' THEN 'EXTERNO' ELSE 'A DEFINIR' END AS TIPO_VENDEDOR, 																	" +cEOL
	cQry+=" SA3010.A3_XREGVEN AS COD_REG,Z4.X5_DESCRI AS DESC_REG, B1_XWINTHO AS PROD_WINT,C6_PRODUTO AS COD_PROD, B1_DESC AS DESC_PROD,  B1_GRUPO AS GRP_PROD, 						" +cEOL
	cQry+=" BM_DESC AS DESC_GRP, C6_QTDVEN AS QTD_VEN, B1_PESBRU AS PESO,  																												" +cEOL
	cQry+=" C5_CONDPAG AS COND_PAGT_PED, E4_DESCRI AS DESC_COND_PAGT,C6_QTDVEN*C6_PRCVEN AS VENDABRUTA, C6_QTDVEN AS QTD_PED, 															" +cEOL
	cQry+="  (C6_QTDVEN * B1_PESBRU) AS VENDAKG, (C6_QTDVEN*B1_CONV) AS VENDAUN,SA3010.A3_XWINTHO AS VEND_WINT,SA3010.A3_COD AS COD_VEND, 												" +cEOL
	cQry+=" CASE A1_PESSOA     WHEN 'F' THEN SUBSTR(A1_CGC,1,3)||'.'||SUBSTR(A1_CGC,4,3)||'.'||SUBSTR(A1_CGC,7,3)||'-'||SUBSTR(A1_CGC,10,2)  											" +cEOL
	cQry+="                 WHEN 'J' THEN SUBSTR(A1_CGC,1,2)||'.'||SUBSTR(A1_CGC,3,3)||'.'||SUBSTR(A1_CGC,6,3)||'.'||SUBSTR(A1_CGC,9,4)||'.'||SUBSTR(A1_CGC,13,2) 						" +cEOL
	cQry+="                 ELSE A1_CGC 																																				" +cEOL
	cQry+=" END AS CPF_CNPJ_CLI, 	 																																					" +cEOL
	cQry+=" C5_XFILEST AS FILIAL_ESTOQUE, C5_FILIAL AS FILIAL,C6_TES AS TES, 																											" +cEOL
	cQry+=" (SELECT SUBSTR(MAX(E1_VENCREA),7,2)||'/'||SUBSTR(MAX(E1_VENCREA),5,2)||'/'||SUBSTR(MAX(E1_VENCREA),1,4)  																	" +cEOL
	cQry+=" FROM " + RetSqlName("SE1") + " WHERE D_E_L_e_T_ <> '*' AND E1_CLIENTE = C5_CLIENTE AND E1_LOJA = C5_LOJACLI) AS ULTIMOVENCIMENTO, 											" +cEOL
	cQry+=" (SELECT SUBSTR(MAX(F2_EMISSAO),7,2)||'/'||SUBSTR(MAX(F2_EMISSAO),5,2)||'/'||SUBSTR(MAX(F2_EMISSAO),1,4)  																	" +cEOL
	cQry+=" FROM " + RetSqlName("SF2") + " WHERE D_E_L_e_T_ <> '*' AND F2_CLIENTE = C5_CLIENTE AND F2_LOJA = C5_LOJACLI ) AS ULTIMACOMPRA, 												" +cEOL
	cQry+=" SA3010.A3_SUPER AS COD_REGIAO,SP.A3_NOME AS DESC_REGIAO, C6_XVBCDES AS DESC_VBC,  C6_XVBCVER AS VL_VERBA, 																	" +cEOL
	cQry+=" SUBSTR(C6_ENTREG,7,2)||'/'||SUBSTR(C6_ENTREG,5,2)||'/'||SUBSTR(C6_ENTREG,1,4) AS DT_ENTREGA 																				" +cEOL
	cQry+=" FROM " + RetSqlName("SC6") + " 																																				" +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("SC5") + "     ON SC5010.D_E_L_E_T_ <> '*' AND C5_FILIAL = C6_FILIAL AND C5_NUM = C6_NUM 															" +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("SA1") + "     ON SA1010.D_E_L_E_T_ <> '*' AND A1_COD = C6_CLI AND A1_LOJA = C6_LOJA 																" +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("ACY") + "     ON ACY010.D_E_L_E_T_ <> '*' AND A1_GRPVEN = ACY_GRPVEN										 										" +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("AOV") + "     ON AOV010.D_E_L_E_T_ <> '*' AND AOV_CODSEG = A1_CODSEG 																				" +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("SA3") + "     ON SA3010.D_E_L_E_T_ <> '*' AND SA3010.A3_COD = C5_VEND1 																			" +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("SX5") + " Z4 	ON     Z4.D_E_L_E_T_ <> '*' AND Z4.X5_TABELA = 'Z4' AND Z4.X5_CHAVE = SA3010.A3_XREGVEN 											" +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("SB1") + "    	ON SB1010.D_E_L_E_T_ <> '*' AND B1_COD = C6_PRODUTO 																				" +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("SBM") + "    	ON SBM010.D_E_L_E_T_ <> '*' AND BM_GRUPO = B1_GRUPO 																				" +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("SD2") + "     ON SD2010.D_E_L_E_T_ <> '*' AND D2_FILIAL = C6_FILIAL AND D2_PEDIDO = C6_NUM AND D2_COD = C6_PRODUTO AND D2_ITEM = C6_ITEM 			" +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("SE4") + "     ON SE4010.D_E_L_E_T_ <> '*' AND E4_CODIGO = C5_CONDPAG 																				" +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("SA3") + " SP 	ON     SP.D_E_L_E_T_ <> '*' AND SP.A3_COD = SA3010.A3_SUPER 																		" +cEOL
	cQry+=" WHERE C5_NOTA = ' '		  																																					" +cEOL
	cQry+=" AND SC6010.D_E_L_E_T_ <> '*'  																																				" +cEOL
	cQry+=" AND C5_EMISSAO BETWEEN '"+dDtPedDe+"' AND '"+dDtPedAte+"' 																													" +cEOL
	cQry+=" AND C6_NUM BETWEEN '"+cPedDe+"' AND '"+cPedAte+"' 																												" +cEOL
	cQry+=" AND A1_COD BETWEEN '"+cCliDe+"' AND '"+cCliAte+"' 																															" +cEOL
	cQry+=" AND A1_LOJA BETWEEN '"+cLjCliDe+"' AND '"+cLjCliAte+"'  																													" +cEOL
	cQry+=" AND C5_FILIAL BETWEEN '"+cFilDe+"' AND '"+cFilAte+"' 																														" +cEOL
	
	MemoWrite("C:\temp\RFATR004.sql",cQry)

	cQry := ChangeQuery(cQry)

	if Select("TRB") > 0
		TRB->(DbCloseArea())
	endif

	TcQuery cQry New Alias "TRB"

	dbSelectArea("TRB")
	TRB->(dbGoTop())


	Processa( {|| SPCPR01Excel() }, "Aguarde...", "Gerando planilha eletronica com as informa็๕es...",.F.)


	TRB->(DbCloseArea())
	RestArea(aArea)
Return

/*??????????????????????????????????????????????????????????????????????????????????
????????????????????????????????????????????????????????????????????????????????????
???????????????????????????????????????????????????????????????????????????????????
???Programa   ? ValPerg()  ? Autor ? Diego Bueno               ? Data ?20/03/2014???
????????????????????????????????????????????????????????????????????????????????J??
???Descricao  ? Cria perguntas no SX1	                                         ???
????????????????????????????????????????????????????????????????????????????????J??
???Observacao ?                                                                  ???
???           ?                                                                  ???
???????????????????????????????????????????????????????????????????????????????????
????????????????????????????????????????????????????????????????????????????????????
??????????????????????????????????????????????????????????????????????????????????*/

Static Function ValPer01()
	_sAlias	:=	Alias()
	//Retirado Sangelles 22/03/2022 ->dbSelectArea("SX1")
	//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
	cPerg 	:=	PADR(cPerg,10)

	U_xPutSx1(cPerg,"01","Dt.Pedido De ?","."     	,"."       ,"mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Dt.Pedido At้ ?","."     	,"."       ,"mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"03","Pedido De ?","."     ,"."       ,"mv_CH3","C",06,0,0,"G","","SC5","","","MV_PAR03","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"04","Pedido At้ ?","."     ,"."       ,"mv_CH4","C",06,0,0,"G","","SC5","","","MV_PAR04","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"05","Cliente De ?","."     ,"."       ,"mv_CH5","C",06,0,0,"G","","SA1","","","MV_PAR05","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"06","Cliente At้ ?","."     ,"."       ,"mv_CH6","C",06,0,0,"G","","SA1","","","MV_PAR06","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"07","Loja De ?","."     ,"."       ,"mv_CH7","C",02,0,0,"G","","","","","MV_PAR07","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"08","Loja At้ ?","."     ,"."       ,"mv_CH8","C",02,0,0,"G","","","","","MV_PAR08","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"09","Filial De ?","."     ,"."       ,"mv_CH9","C",04,0,0,"G","","SM0","","","MV_PAR09","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"10","Filial At้ ?","."     ,"."       ,"mv_CHA","C",04,0,0,"G","","SM0","","","MV_PAR10","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"11","Salvar Em ?","."     ,"."       ,"mv_CHB","C",50,0,0,"G","","","","","MV_PAR11","","","","","","","","","","","","","","","","")

	//Retirado Sangelles 22/03/2022 ->dbSelectArea(_sAlias)

Return()

/*
?????????????????????????????????????????????????????????????????????????????
????????????????????????????????????????????????????????????????????????????
???Programa  SPCPR01Excel   ?Autor ?Diego Bueno      ? Data ?  20/03/14   ???
????????????????????????????????????????????????????????????????????????????
???Desc.     ? Gera a impress?o em planilha eletronica.                   ???
???          ?                                                            ???
????????????????????????????????????????????????????????????????????????????
???Uso       ? Concebra                                                   ???
????????????????????????????????????????????????????????????????????????????
?????????????????????????????????????????????????????????????????????????????
?????????????????????????????????????????????????????????????????????????????
*/
Static Function SPCPR01Excel()
	Local oFWMSExcel := FWMSExcel():New()
	Local oMsExcel
	Local aCells
	Local cType
	Local cColumn
	Local cFile
	Local cFileTMP
	//Local cPicture
	Local lTotal
	Local nRow
	Local nRows
	Local nField
	Local nFields
	Local nAlign
	Local nFormat
	Local uCell
	Local _aHeadXls :={}
	Local _aColsXls :={}

	Local cWorkSheet := "Relat๓rio de Rastreabilidade "
	Local cTable     := "Relat๓rio de Rastreabilidade "+DtoC(Date())+" as "+Time()
	//Local lTotalize  := .F.
	//Local lPicture   := .F.
	//Local nPesol	 := 0 

	dbSelectArea("TRB")
	TRB->(dbGoTop())

	ProcRegua(TRB->(Reccount()) )
	
	_aHeadXls := {"Ped.Winthor","Pedido","Dt.Pedido","M๊s.Pedido","Ano.Pedido","Cli.Winthor","Cod.Cliente","Nome cliente","Loja","Cod.Grp.Econ.","Grp.Economico","Nome Fantasia",;
	"Cod.Seg","Segmento","Endere็o","Bairro","Municipio","Estado","Nome.Vendedor","Tp.Vendedor","Cod.Regiใo","Desc.Regiใo","Cod.Prod.Winthor","Cod.Prdrod","Desc.Prod",;
	"Grp.Prod","Desc.Grp","Qtd.Vendida","Vlr.Unit","Vlr.Total","Peso","Cond.Pagto","Desc.Cond.Pagto","Venda Bruta","Qtd.Pedido","Venda.Kg",;
	"Venda.Un","Vendedor.Wintor","Cod.Vendedor","Cnpj.Cpf","Filial Estoque","Filial Fat.","Ult.Vencimento","Ult.Compra","Cod.Regiใo","Desc.Regiใo","Desc.Vbc","Desc.Verba","Dt.Entrega",;
	"Prazo M้dio","Valor do ICMS Normal(nICMS)","Valor ICMS Retido(nST)","Valor do PIS 2(nPIS)","Valor do COFINS 2(nCOFINS)",;
	"Valor do IPI(nIPI)","Valor do desconto da Zona Franca do item(nSUFRAMA)","Valor do desconto da Zona Franca do item-Desconto do PIS-Desconto do Cofins(nZFICMS)",;
	"Desconto do PIS(nZFPIS)","Desconto do Cofins(nZFCOFINS)"}

	nPrazoMedio := 0
	aImpostos 	:= {}

	While !TRB->(Eof())

		IncProc("Processando Relat๓rio: " + TRB->PEDIDO + "-" + TRB->MUNICIPIO)
		
		aImpostos	:= u_RFATE040(TRB->TES,TRB->COD_CLI,TRB->LOJA_CLI,Posicione("SA1",1,xFilial("SA1")+TRB->COD_CLI+TRB->LOJA_CLI,"A1_TIPO"),TRB->COD_PROD,TRB->PRCVEN)
		nPrazoMedio := u_RFATE039(TRB->COND_PAGT_PED,TRB->PRCVEN,cTod(TRB->DATA_PEDIDO)) 
	
		aAdd(_aColsXls,{TRB->PEDIDO_WINT,TRB->PEDIDO,TRB->DATA_PEDIDO,TRB->MES_PEDIDO,TRB->ANO_PEDIDO,TRB->CLIENTE_WINT,TRB->COD_CLI,TRB->NOMECLI,TRB->LOJA_CLI,TRB->COD_GRUPO_ECON,TRB->GRUPO_ECON,;
		TRB->FATASI_CLI,TRB->COD_SEG,TRB->DESC_SEG,TRB->END_CLI,TRB->BAIRRO,TRB->MUNICIPIO,TRB->EST,TRB->NM_VEND,TRB->TIPO_VENDEDOR,TRB->COD_REG,TRB->DESC_REG,TRB->PROD_WINT,TRB->COD_PROD,;
		TRB->DESC_PROD,TRB->GRP_PROD,TRB->DESC_GRP,TRB->QTD_VEN,TRB->PRCVEN,(TRB->QTD_VEN*TRB->PRCVEN),TRB->PESO,TRB->COND_PAGT_PED,TRB->DESC_COND_PAGT,;
		TRB->VENDABRUTA,TRB->QTD_PED,TRB->VENDAKG,TRB->VENDAUN,TRB->VEND_WINT,TRB->COD_VEND,TRB->CPF_CNPJ_CLI,TRB->FILIAL_ESTOQUE,TRB->FILIAL,TRB->ULTIMOVENCIMENTO,TRB->ULTIMACOMPRA,;
		TRB->COD_REGIAO,TRB->DESC_REGIAO,TRB->DESC_VBC,TRB->VL_VERBA,TRB->DT_ENTREGA,;
		nPrazoMedio,aImpostos[1],aImpostos[2],aImpostos[3],aImpostos[4],aImpostos[5],aImpostos[6],aImpostos[7],aImpostos[8],aImpostos[9]})

		nPrazoMedio := 0
		aImpostos 	:= {}


		TRB->(DbSkip())

	End

	If Len(_aColsXls) > 0

		BEGIN SEQUENCE

			oFWMSExcel:AddworkSheet(cWorkSheet)
			oFWMSExcel:AddTable(cWorkSheet,cTable)

			nFields := Len( _aHeadXls )
			For nField := 1 To nFields
				cType   := "C"
				cType := ValType(_aColsXls[1][nField])
				nAlign  := IF(cType=="C",1,IF(cType=="N",3,2))
				nFormat := IF(cType=="D",4,IF(cType=="N",2,1))
				cColumn := _aHeadXls[nField]
				lTotal  := .F. // ( lTotalize .and. cType == "N" )
				oFWMSExcel:AddColumn(@cWorkSheet,@cTable,@cColumn,@nAlign,@nFormat,@lTotal)
			Next nField

			oFWMSExcel:CBGCOLOR2LINE := '#FFFFFF'
			oFWMSExcel:CBGCOLORLINE  := '#FFFFFF'

			aCells := Array(nFields)
			nRows  := Len( _aColsXls )
			For nRow := 1 To nRows
				IncProc("Gerando planilha.. [Linha: "+TRANSFORM(nRow,"@E 999999")+" de "+TRANSFORM(Len(_aColsXls),"@E 999999")+" ]    ")
				For nField := 1 To nFields
					uCell := _aColsXls[nRow][nField]
					If Valtype(uCell) == "D" .AND. EMPTY(uCell)
						aCells[nField] := space(8)
					Else
						aCells[nField] := uCell
					Endif
				Next nField
				oFWMSExcel:AddRow(@cWorkSheet,@cTable,aClone(aCells))
			Next nRow
			oFWMSExcel:Activate()

			cFile := ( FwTemporaryTable( NIL, .F. ) + ".xls" )

			While File( cFile )
				cFile := ( FwTemporaryTable( NIL, .F. ) + ".xls" )
			End While

			oFWMSExcel:GetXMLFile( cFile )
			oFWMSExcel:DeActivate()

			IF .NOT.( File( cFile ) )
				MsgStop("Falha ao tentar criar arquivo "+cFile)
				cFile := ""
				BREAK
			EndIF

			cLocFile := AllTrim(cLocFile)
			if SubStr(cLocFile,Len(cLocFile),1) <> '\'
				cLocFile += '\'
			endif

			cFileTMP := ( cLocFile + cFile )
			IF .NOT.( __CopyFile( cFile , cFileTMP ) )
				MsgStop("Falha ao tentar salvar arquivo em "+cLocFile)
				fErase( cFile )
				cFile := ""
				BREAK
			EndIF

			fErase( cFile )

			cFile := cFileTMP

			IF .NOT.( File( cFile ) )
				MsgStop("Falha ao tentar salvar arquivo em "+cLocFile)
				cFile := ""
				BREAK
			EndIF

			IF .NOT.( ApOleClient("MsExcel") )
				MsgStop("Falha ao tentar abrir arquivo "+cFile+". Excel n?o instalado!")
				BREAK
			EndIF

			oMsExcel:= MsExcel():New()
			oMsExcel:WorkBooks:Open( cFile )
			oMsExcel:SetVisible( .T. )
			oMsExcel:= oMsExcel:Destroy()
		END SEQUENCE

		oFWMSExcel := FreeObj( oFWMSExcel )


	else
		MsgInfo("Nใo hแ dados para serem impressos!","VERIFIQUE OS PARAMETROS")
	endif

Return()
