#INCLUDE "totvs.ch"
#INCLUDE "fileio.ch"
#INCLUDE "topconn.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRESTR003  บAutor  ณTarcisio Silva MirandaบDataณ  10/01/2018 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Relat๓rio Saldo Pedidos Faturados X Pedidos em Abertos.	  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Pedidos Faturados X Pedidos em Abertos.                    บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function RESTR003()

	// Declaracao de Variaveis
	Local 	aArea 		:= GetArea()
	Local	cQry        := ""
	Local 	cEol        := chr(13)+chr(10)
	Local 	dDataDe 	:= StoD("")
	Local 	dDataAte	:= StoD("")
	Local 	nMovEst 	:= 0
	Local 	nMovFin 	:= 0
	Local 	cProdDe		:= ""
	Local 	cProdAte	:= ""
	Local 	cDuplic		:= ""
	Local 	cEstoque	:= ""

	////////////////////////////////////////////////////////////////////////
	///Outras Variaveis
	////////////////////////////////////////////////////////////////////////
	Private cLocFile    := ""
	Private cPerg       := "RESTR003"

	////////////////////////////////////////////////////////////////////////
	///Cria as perguntas no SX1
	////////////////////////////////////////////////////////////////////////
	ValPer01()

	if !Pergunte(cPerg,.t.)
		return
	endif

	dDataDe		:= dTos(mv_par01)
	dDataAte	:= dTos(mv_par02)
	cProdDe 	:= mv_par03
	cProdAte  	:= mv_par04
	nMovEst		:= mv_par05
	nMovFin		:= mv_par06
	cLocFile 	:= mv_par07

	if nMovFin == 1
		cDuplic		:= "S" 																										
	elseif nMovFin == 2
		cDuplic		:= "N" 		 																										
	endif

	if nMovEst == 1
		cEstoque := "S"																										
	elseif nMovEst == 2
		cEstoque := "N"																											
	endif


	cQry+="	SELECT B2_FILIAL AS FILIAL,B2_COD AS PRODUTO,B1_DESC AS DESCRICAO,B2_LOCAL AS ARMAZEM, 				 						" +cEOL

	cQry+=" (SELECT COUNT(C6_QTDVEN)FROM "+ RetSqlName("SC6" )+  " 																			" +cEOL
	cQry+=" LEFT JOIN "+ RetSqlName("SC5") + " ON C5_NUM = C6_NUM AND C6_FILIAL = C5_FILIAL AND SC5010.D_E_L_E_T_ <> '*' 					" +cEOL
	cQry+=" LEFT JOIN "+ RetSqlName("SA1") + " ON A1_COD = C6_CLI AND A1_LOJA = C6_LOJA AND SA1010.D_E_L_E_T_ <> '*'						" +cEOL
	cQry+=" LEFT JOIN "+ RetSqlName("SF4") + " ON SF4010.D_E_L_E_T_ <> '*' AND F4_CODIGO = C6_TES AND C6_FILIAL = F4_FILIAL	 				" +cEOL
	cQry+=" WHERE SC6010.D_E_L_E_T_ <> '*' AND B2_COD = C6_PRODUTO AND B2_FILIAL = C6_FILIAL 												" +cEOL
	cQry+=" AND A1_CGC NOT IN ('52502507006269','52502507006269','52502507000309','52502507006854',											" +cEOL
	cQry+=" '52502507001208','52502507006692','52502507000813','26687598000122','52502507001895', 											" +cEOL
	cQry+=" '52502507001623','52502507002271','52502507001976','52502507000147','52502507001380', 											" +cEOL
	cQry+=" '26687598000203','26687598000475','26687598000394','52502507000651') 															" +cEOL
	cQry+=" AND B2_LOCAL = C6_LOCAL AND C6_NOTA = ' '  																					  	" +cEOL
	if !empty(cDuplic)
		cQry+=" AND F4_DUPLIC  = '"+cDuplic+"' 																								" +cEOL
	endif
	if !empty(cEstoque)
		cQry+=" AND F4_ESTOQUE = '"+cEstoque+"'																								" +cEOL
	endif
	cQry+=" AND C5_EMISSAO >= '"+dDataDe+"' AND C5_EMISSAO <= '"+dDataAte+"') AS QTDPEDIDOABERTO, 											" +cEOL

	cQry+=" (SELECT SUM(C6_QTDVEN) FROM "+ RetSqlName("SC6" ) +  "																			" +cEOL
	cQry+=" LEFT JOIN "+RetSqlName("SC5") + " ON C5_NUM = C6_NUM AND C6_FILIAL = C5_FILIAL AND SC5010.D_E_L_E_T_ <> '*' 					" +cEOL
	cQry+=" LEFT JOIN "+RetSqlName("SA1") + " ON A1_COD = C6_CLI AND A1_LOJA = C6_LOJA AND SA1010.D_E_L_E_T_ <> '*' 						" +cEOL
	cQry+=" LEFT JOIN "+RetSqlName("SF4") + " ON SF4010.D_E_L_E_T_ <> '*' AND F4_CODIGO = C6_TES AND C6_FILIAL = F4_FILIAL	 				" +cEOL
	cQry+=" WHERE SC6010.D_E_L_E_T_ <> '*' AND B2_COD = C6_PRODUTO AND B2_FILIAL = C6_FILIAL 												" +cEOL
	cQry+=" AND A1_CGC NOT IN ('52502507006269','52502507006269','52502507000309','52502507006854',											" +cEOL
	cQry+=" '52502507001208','52502507006692','52502507000813','26687598000122','52502507001895',											" +cEOL
	cQry+=" '52502507001623','52502507002271','52502507001976','52502507000147','52502507001380',											" +cEOL
	cQry+=" '26687598000203','26687598000475','26687598000394','52502507000651')															" +cEOL
	cQry+=" AND B2_LOCAL = C6_LOCAL AND C6_NOTA = ' ' 																						" +cEOL
	if !empty(cDuplic)
		cQry+=" AND F4_DUPLIC  = '"+cDuplic+"' 																								" +cEOL
	endif
	if !empty(cEstoque)
		cQry+=" AND F4_ESTOQUE = '"+cEstoque+"'																								" +cEOL
	endif
	cQry+=" AND C5_EMISSAO >= '"+dDataDe+"' AND C5_EMISSAO <= '"+dDataAte+"') AS VALORPEDABERTO,											" +cEOL

	cQry+=" (SELECT COUNT(C6_QTDVEN)FROM "+ RetSqlName("SC6" ) + " 																			" +cEOL
	cQry+=" LEFT JOIN "+ RetSqlName("SC5") + " ON C5_NUM = C6_NUM AND C6_FILIAL = C5_FILIAL AND SC5010.D_E_L_E_T_ <> '*' 					" +cEOL
	cQry+=" LEFT JOIN "+ RetSqlName("SA1") + " ON A1_COD = C6_CLI AND A1_LOJA = C6_LOJA AND SA1010.D_E_L_E_T_ <> '*' 						" +cEOL
	cQry+=" LEFT JOIN "+ RetSqlName("SF4") + " ON SF4010.D_E_L_E_T_ <> '*' AND F4_CODIGO = C6_TES AND C6_FILIAL = F4_FILIAL	 				" +cEOL
	cQry+=" WHERE SC6010.D_E_L_E_T_ <> '*' AND B2_COD = C6_PRODUTO AND B2_FILIAL = C6_FILIAL  												" +cEOL
	cQry+=" AND A1_CGC NOT IN ('52502507006269','52502507006269','52502507000309','52502507006854', 										" +cEOL
	cQry+=" '52502507001208','52502507006692','52502507000813','26687598000122','52502507001895',											" +cEOL
	cQry+=" '52502507001623','52502507002271','52502507001976','52502507000147','52502507001380', 											" +cEOL
	cQry+=" '26687598000203','26687598000475','26687598000394','52502507000651') 															" +cEOL
	cQry+=" AND B2_LOCAL = C6_LOCAL AND C6_NOTA <> ' '  																					" +cEOL
	if !empty(cDuplic)
		cQry+=" AND F4_DUPLIC  = '"+cDuplic+"' 																								" +cEOL
	endif
	if !empty(cEstoque)
		cQry+=" AND F4_ESTOQUE = '"+cEstoque+"'																								" +cEOL
	endif
	cQry+=" AND C5_EMISSAO >= '"+dDataDe+"' AND C5_EMISSAO <= '"+dDataAte+"') AS QTDPEDFATURADOS, 											" +cEOL

	cQry+=" (SELECT SUM(C6_QTDVEN) FROM "+ RetSqlName("SC6" ) + " 																			" +cEOL
	cQry+=" LEFT JOIN "+ RetSqlName("SC5") + " ON C5_NUM = C6_NUM AND C6_FILIAL = C5_FILIAL AND SC5010.D_E_L_E_T_ <> '*'					" +cEOL
	cQry+=" LEFT JOIN "+ RetSqlName("SA1") + " ON A1_COD = C6_CLI AND A1_LOJA = C6_LOJA AND SA1010.D_E_L_E_T_ <> '*'						" +cEOL
	cQry+=" LEFT JOIN "+ RetSqlName("SF4") + " ON SF4010.D_E_L_E_T_ <> '*' AND F4_CODIGO = C6_TES AND C6_FILIAL = F4_FILIAL	 				" +cEOL
	cQry+=" WHERE SC6010.D_E_L_E_T_ <> '*' AND B2_COD = C6_PRODUTO AND B2_FILIAL = C6_FILIAL 												" +cEOL
	cQry+=" AND A1_CGC NOT IN ('52502507006269','52502507006269','52502507000309','52502507006854',											" +cEOL
	cQry+=" '52502507001208','52502507006692','52502507000813','26687598000122','52502507001895',											" +cEOL
	cQry+=" '52502507001623','52502507002271','52502507001976','52502507000147','52502507001380',											" +cEOL
	cQry+=" '26687598000203','26687598000475','26687598000394','52502507000651')															" +cEOL
	cQry+=" AND B2_LOCAL = C6_LOCAL AND C6_NOTA <> ' '																						" +cEOL
	if !empty(cDuplic)
		cQry+=" AND F4_DUPLIC  = '"+cDuplic+"' 																								" +cEOL
	endif
	if !empty(cEstoque)
		cQry+=" AND F4_ESTOQUE = '"+cEstoque+"'																								" +cEOL
	endif
	cQry+=" AND C5_EMISSAO >= '"+dDataDe+"' AND C5_EMISSAO <= '"+dDataAte+"') AS VLRPEDFATURADOS,											" +cEOL

	cQry+=" (SELECT COUNT(C6_QTDVEN) FROM "+ RetSqlName("SC6" ) + "																			" +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("SC5") + " ON C5_NUM = C6_NUM AND C6_FILIAL = C5_FILIAL AND SC5010.D_E_L_E_T_ <> '*'					" +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("SA1") + " ON A1_COD = C6_CLI AND A1_LOJA = C6_LOJA AND SA1010.D_E_L_E_T_ <> '*'						" +cEOL
	cQry+=" LEFT JOIN "+ RetSqlName("SF4") + " ON SF4010.D_E_L_E_T_ <> '*' AND F4_CODIGO = C6_TES AND C6_FILIAL = F4_FILIAL	 				" +cEOL
	cQry+=" WHERE SC6010.D_E_L_E_T_ <> '*' AND B2_COD = C6_PRODUTO AND B2_FILIAL = C6_FILIAL 												" +cEOL
	cQry+=" AND A1_CGC NOT IN ('52502507006269','52502507006269','52502507000309','52502507006854',											" +cEOL
	cQry+=" '52502507001208','52502507006692','52502507000813','26687598000122','52502507001895',											" +cEOL
	cQry+=" '52502507001623','52502507002271','52502507001976','52502507000147','52502507001380',											" +cEOL
	cQry+=" '26687598000203','26687598000475','26687598000394','52502507000651')															" +cEOL
	cQry+=" AND B2_LOCAL = C6_LOCAL AND C6_NOTA <> ' ' AND C5_TIPO = 'D'																	" +cEOL
	if !empty(cDuplic)
		cQry+=" AND F4_DUPLIC  = '"+cDuplic+"' 																								" +cEOL
	endif
	if !empty(cEstoque)
		cQry+=" AND F4_ESTOQUE = '"+cEstoque+"'																								" +cEOL
	endif
	cQry+=" AND C5_EMISSAO >= '"+dDataDe+"' AND C5_EMISSAO <= '"+dDataAte+"') AS QTDPEDDEV,													" +cEOL

	cQry+=" (SELECT SUM(C6_QTDVEN) FROM "+ RetSqlName("SC6" ) + " 																			" +cEOL
	cQry+=" LEFT JOIN " +  RetSqlName("SC5") + " ON C5_NUM = C6_NUM AND C6_FILIAL = C5_FILIAL AND SC5010.D_E_L_E_T_ <> '*'					" +cEOL
	cQry+=" LEFT JOIN " +  RetSqlName("SA1") + " ON A1_COD = C6_CLI AND A1_LOJA = C6_LOJA AND SA1010.D_E_L_E_T_ <> '*'						" +cEOL
	cQry+=" LEFT JOIN "+ RetSqlName("SF4") + " ON SF4010.D_E_L_E_T_ <> '*' AND F4_CODIGO = C6_TES AND C6_FILIAL = F4_FILIAL	 				" +cEOL
	cQry+=" WHERE SC6010.D_E_L_E_T_ <> '*' AND B2_COD = C6_PRODUTO AND B2_FILIAL = C6_FILIAL 												" +cEOL
	cQry+=" AND A1_CGC NOT IN ('52502507006269','52502507006269','52502507000309','52502507006854',											" +cEOL
	cQry+=" '52502507001208','52502507006692','52502507000813','26687598000122','52502507001895',											" +cEOL
	cQry+=" '52502507001623','52502507002271','52502507001976','52502507000147','52502507001380',											" +cEOL
	cQry+=" '26687598000203','26687598000475','26687598000394','52502507000651')															" +cEOL
	cQry+=" AND B2_LOCAL = C6_LOCAL AND C6_NOTA <> ' ' AND C5_TIPO = 'D'																	" +cEOL
	if !empty(cDuplic)
		cQry+=" AND F4_DUPLIC  = '"+cDuplic+"' 																								" +cEOL
	endif
	if !empty(cEstoque)
		cQry+=" AND F4_ESTOQUE = '"+cEstoque+"'																								" +cEOL
	endif
	cQry+=" AND C5_EMISSAO >= '"+dDataDe+"' AND C5_EMISSAO <= '"+dDataAte+"') AS VLRPEDDEV													" +cEOL

	cQry+=" FROM "+ RetSqlName("SB2") + "																									" +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("SB1") + " ON SB1010.D_E_L_E_T_ <> '*' AND B1_COD = B2_COD 											" +cEOL
	cQry+=" WHERE SB2010.D_E_L_E_T_ <> '*' 																									" +cEOL
	cQry+=" AND B1_TIPO = 'PA' 																												" +cEOL
	cQry+=" AND B1_COD BETWEEN '"+cProdDe+"' AND '"+cProdAte+"' 																			" +cEOL

	cQry+=" ORDER BY B2_COD 																												" +cEOL

	MemoWrite("C:\temp\RESTR003.sql",cQry)

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

	U_xPutSx1(cPerg,"01","Emissใo de ?","."     	,"."       ,"mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Emissใo At้ ?","."     	,"."       ,"mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"03","Produto De ?","."     ,"."       ,"mv_CH3","C",15,0,0,"G","","SB1","","","MV_PAR03","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"04","Produto At้ ?","."     ,"."       ,"mv_CH4","C",15,0,0,"G","","SB1","","","MV_PAR04","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"05","Tes Movimenta Estoque ?"	,"."     ,".","mv_CH5","N",01,0,0,"C","","","","","MV_PAR05","Sim","Sim","Sim","Nใo","Nใo","Nใo","Ambas","Ambas","Ambas","","","",,,)
	U_xPutSx1(cPerg,"06","Tes Movimenta Financeiro ?","."     ,".","mv_CH6","N",01,0,0,"C","","","","","MV_PAR06","Sim","Sim","Sim","Nใo","Nใo","Nใo","Ambas","Ambas","Ambas","","","",,,)
	U_xPutSx1(cPerg,"07","Salvar Em ?","."     ,"."       ,"mv_CH7","C",50,0,0,"G","","","","","MV_PAR07","","","","","","","","","","","","","","","","")

	dbSelectArea(_sAlias)

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

	dbSelectArea("TRB")
	TRB->(dbGoTop())

	ProcRegua(TRB->(Reccount()) )

	_aHeadXls := {"Filial", "Produto",'Descri็ใo','Armaz้m',"Qtd. Pedidos em Aberto","Qtd. Produtos ", "Qtd. Pedidos Faturados", "Qtd. Produtos ", "Qtd. Pedidos de Devolu็ใo", "Qtd. Produtos"}

	While !TRB->(Eof())

		IncProc("Processando Relat๓rio: " + TRB->PRODUTO + "-" + TRB->FILIAL)

		aAdd(_aColsXls,{TRB->FILIAL,TRB->PRODUTO,TRB->DESCRICAO,TRB->ARMAZEM,TRB->QTDPEDIDOABERTO,TRB->VALORPEDABERTO,TRB->QTDPEDFATURADOS,TRB->VLRPEDFATURADOS,TRB->QTDPEDDEV,TRB->VLRPEDDEV})

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
