#include 'protheus.ch'
#include 'parmtype.ch'
#INCLUDE "topconn.ch"

//--------------------------------------------------------------------------------------------------------
/*/ {Protheus.doc}  RESTR001
Relatorio para Inventário Diário
@author Luciano
@version 1.0
@since 10/05/2017
@return Nil
@obs 
chr(931) = Sinal Sigma (Somatório)
@sample

/*/
//--------------------------------------------------------------------------------------------------------
user function RESTR001()
	Local oReport
	Private c_Perg := "RESTR001"
	
	ValidPerg()

	//+------------------------------------------------------------------------+
	//|Interface de impressao  |
	//+------------------------------------------------------------------------+
	oReport := ReportDef()
	oReport:PrintDialog()
	
	
	
	
Return
//--------------------------------------------------------------------------------------------------------
/*/ {Protheus.doc}  ReporteDef
A funcao estatica ReportDef devera ser criada para todos os relatorios que poderao ser agendados pelo usuario.
@author Luciano
@version 1.0
@since 10/05/2017
@return oReport Objeto do Relatorio.
@obs Obs_Complementar
@sample
..........
Conterá um exemplo de utilização da função.
..........
/*/
//--------------------------------------------------------------------------------------------------------
Static Function ReportDef()
	Local oReport
	Local oSection1:= Nil // armazem
	Local oSection2:= Nil // Grupo
	Local oSection3:= Nil //Produto
	//Local oBreak
	//+------------------------------------------------------------------------+
	//|Criacao do componente de impressao      |
	//||
	//|TReport():New   |
	//|ExpC1 : Nome do relatorio       |
	//|ExpC2 : Titulo  |
	//|ExpC3 : Pergunte|
	//|ExpB4 : Bloco de codigo que sera executado na confirmacao da impressao  |
	//|ExpC5 : Descricao       |
	//||
	//+------------------------------------------------------------------------+
	oReport := TReport():New("RESTR001","Movimentações de Produtos Por Armazém",c_Perg, {|oReport| ReportPrint(oReport)},/*Descricao do relatório*/)
	oReport:SetLandscape(.F.)   //Define a orientação de página do relatório como paisagem  ou retrato. .F.=Retrato; .T.=Paisagem
	oReport:SetTotalInLine(.F.) //Define se os totalizadores serão impressos em linha ou coluna
	If !Empty(oReport:uParam)
		Pergunte(oReport:uParam,.F.)
	EndIf
	//+------------------------------------------------------------------------+
	//|Criacao da secao utilizada pelo relatorio       |
	//||
	//|TRSection():New |
	//|ExpO1 : Objeto TReport que a secao pertence     |
	//|ExpC2 : Descricao da seçao      |
	//|ExpA3 : Array com as tabelas utilizadas pela secao. A primeira tabela   |
	//|sera considerada como principal para a seção.   |
	//|ExpA4 : Array com as Ordens do relatório|
	//|ExpL5 : Carrega campos do SX3 como celulas      |
	//|Default : False |
	//|ExpL6 : Carrega ordens do Sindex|
	//|Default : False |
	//||
	//+------------------------------------------------------------------------+
	//oSection := TRSection():New(/*oReport*/,/*Nome da secao*/,/*{Tabelas da secao}*/,/*{Array com as ordens do relatório}*/,/*Campos do SX3*/,/*Campos do SIX*/)
	//Exemplo utilizando a tabela de clientes.
	oSection1 := TRSection():New(oReport,"Armazém",{"NNR"}, , .F., .T.)
	oSection1:SetTotalInLine(.F.)  //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	//Exemplo para imprimir as colunas abaixo do cadastro de cliente totalizando pela quantidade de registros da coluna A1_COD.
	TRCell():New(oSection1,"NNR_CODIGO"	,"TRBSD3"		,"Local"/*Titulo*/,"@!"/*Picture*/,/*Tamanho*/,/*lPixel*/,/*{|| code-block de impressao }*/)
	TRCell():New(oSection1,"NNR_DESCRI"	,"TRBSD3"		,"Descrição"/*Titulo*/,"@!"/*Picture*/,/*Tamanho*/,/*lPixel*/,/*{|| code-block de impressao }*/)
	
	//TRFunction():New(oSection:Cell("A1_COD"),,"COUNT")

	oSection2 := TRSection():New(oReport,"Grupo de Produto",{"SBM"}, , .F., .T.)
	oSection2:SetTotalInLine(.F.)  //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	TRCell():New(oSection2,"BM_GRUPO" 	,"TRBSD3"		,"Grupo"		,/*Picture*/,/*Tamanho*/,/*lPixel*/,/*{|| code-block de impressao }*/)
	TRCell():New(oSection2,"BM_DESC"	,"TRBSD3"		,"Descrição"	,/*Picture*/,/*Tamanho*/,/*lPixel*/,/*{|| code-block de impressao }*/)

	oSection3 := TRSection():New(oReport,"Movimentos",{"SB1","SBM","NNR","SD1","SD2","SD3"}, , .F., .T.)
	oSection3:SetTotalInLine(.F.)  //Define se os totalizadores serão impressos em linha ou coluna. .F.=Coluna; .T.=Linha
	TRCell():New(oSection3,"B1_COD"		,"TRBSD3"		,"Código"/*Titulo*/,/*Picture*/,/*Tamanho*/,/*lPixel*/,/*{|| code-block de impressao }*/)
	TRCell():New(oSection3,"B1_DESC"	,"TRBSD3"		,"Descrição"/*Titulo*/,/*Picture*/,/*Tamanho*/,/*lPixel*/,/*{|| code-block de impressao }*/)
	TRCell():New(oSection3,"_SLDREF"	,""				," Saldo Dt. Ref.",PesqPict("SB2","B2_QATU"),TamSX3("B2_QATU")[1],/*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,"RIGHT",/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	//oSection2:Cell("_SLDREF"):SetAlign("LEFT")
	TRCell():New(oSection3,"_SLDATU"	,""				," Saldo Atual",PesqPict("SB2","B2_QATU"),TamSX3("B2_QATU")[1],/*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,"RIGHT",/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
	//oSection2:Cell("_SLDATU"):SetAlign("LEFT")
	TRCell():New(oSection3,"_ENDERECO"	,"TRBSD3"		,"Endereço"/*Titulo*/,/*Picture*/,/*Tamanho*/,/*lPixel*/,/*{|| code-block de impressao }*/)
	
//	//oSection2:Cell("_QT030D"):SetAlign("LEFT")
//	TRCell():New(oSection2,"_QT060D"	,"",chr(931)+" 60d",PesqPict("SC6","C6_VALOR"),TamSX3("C6_QTDVEN")[1]+2,/*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,"RIGHT",/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
//	//oSection2:Cell("_QT060D"):SetAlign("LEFT")
//	TRCell():New(oSection2,"_QT090D"	,"",chr(931)+" 90d",PesqPict("SC6","C6_VALOR"),TamSX3("C6_QTDVEN")[1]+2,/*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,"RIGHT",/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
//	//oSection2:Cell("_QT090D"):SetAlign("LEFT")
//	TRCell():New(oSection2,"_QT180D"	,"",chr(931)+" 180d",PesqPict("SC6","C6_VALOR"),TamSX3("C6_QTDVEN")[1]+2,/*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,"RIGHT",/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
//	//oSection2:Cell("_QT180D"):SetAlign("LEFT")
//	TRCell():New(oSection2,"_QT012M"	,"",chr(931)+" 12m",PesqPict("SC6","C6_VALOR"),TamSX3("C6_QTDVEN")[1]+2,/*lPixel*/,/*{|| code-block de impressao }*/,/*cAlign*/,/*lLineBreak*/,"RIGHT",/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)
//	//oSection2:Cell("_QT012M"):SetAlign("LEFT")

Return(oReport)
//--------------------------------------------------------------------------------------------------------
/*/ {Protheus.doc}  ReportPrint
A funcao estatica ReportDef devera ser criada para todos os relatorios que poderao ser agendados pelo usuario.
@param oReport Objeto do relatório
@author Luciano
@version 1.0
@since 10/05/2017
@return Nil
@obs Obs_Complementar
@sample
..........
Conterá um exemplo de utilização da função.
..........
/*/
//--------------------------------------------------------------------------------------------------------
Static Function ReportPrint(oReport)
	Local c_Qry   := ""
	Local oSection1 := oReport:Section(1) // Armazem
	Local oSection2 := oReport:Section(2) //Grupo
	Local oSection3 := oReport:Section(3) //Produto
	
	//Local aSaldoK := {}
	Local nSaldo
	
	c_Qry := " SELECT FILIAL, LOCAL,RTRIM(NNR.NNR_DESCRI) AS ARMAZEM, GRUPO,RTRIM(BM.BM_DESC) AS NOGRUPO, CODIGO,RTRIM(B1.B1_DESC) AS DESCRICAO, ENDERECO, SUM(QTDE) AS QTD "
	c_Qry += " 	,(SELECT COALESCE(B2_QATU,0) FROM SB2010 WHERE D_E_L_E_T_='' AND B2_FILIAL=TAB_XX.FILIAL AND B2_COD=TAB_XX.CODIGO AND B2_LOCAL=TAB_XX.LOCAL ) AS QATU " 
	c_Qry += " FROM " 
	c_Qry += " ( " 
	//--MOVIMENTACAO INTERNA
	c_Qry += " SELECT 'SD3' AS TABELA,D3.D3_FILIAL AS FILIAL,D3.D3_LOCAL AS LOCAL,D3.D3_GRUPO AS GRUPO,D3.D3_COD AS CODIGO, D3.D3_LOCALIZ AS ENDERECO " 
	c_Qry += " 	,SUM(CASE WHEN SUBSTR(D3.D3_CF,1,2)='DE' THEN D3.D3_QUANT ELSE D3.D3_QUANT*-1 END) AS QTDE " 
	c_Qry += " FROM SD3010 D3 " 
	c_Qry += " WHERE D3.D3_FILIAL='" + FWxFilial("SD3") + "' AND D3.D_E_L_E_T_='' AND D3.D3_ESTORNO<>'S' " 
	c_Qry += " 	AND D3.D3_EMISSAO = '" + DTOS(MV_PAR01) + "' " //BETWEEN '20170510' AND '20170510' " 
	c_Qry += " 	AND D3.D3_LOCAL BETWEEN '" + MV_PAR02 + "' AND '" + MV_PAR03 + "' "
	c_Qry += " GROUP BY "  
	c_Qry += " 	D3.D3_FILIAL,D3.D3_LOCAL,D3.D3_GRUPO,D3.D3_COD, D3.D3_LOCALIZ " 
	c_Qry += " UNION " 
	//--COMPRAS
	c_Qry += " SELECT 'SD1' AS TABELA, D1.D1_FILIAL AS FILIAL,D1.D1_LOCAL AS LOCAL, D1.D1_GRUPO AS GRUPO, D1.D1_COD AS CODIGO, D1.D1_ENDER AS ENDERECO " 
	c_Qry += " 	,SUM(D1.D1_QUANT) AS QTDE " 
	c_Qry += " FROM SD1010 D1 " 
	c_Qry += " WHERE D1.D1_FILIAL='" + FWxFilial("SD1") + "' AND D1.D_E_L_E_T_='' " 
	c_Qry += " 	AND D1.D1_EMISSAO = '" + DTOS(MV_PAR01) + "' " 
	c_Qry += " 	AND D1.D1_LOCAL BETWEEN '" + MV_PAR02 + "' AND '" + MV_PAR03 + "' "
	c_Qry += " 	AND D1.D1_QTDEDEV =0 " 
	c_Qry += " GROUP BY D1.D1_FILIAL,D1.D1_LOCAL, D1.D1_GRUPO, D1.D1_COD, D1.D1_ENDER " 
	c_Qry += " UNION " 
	//--VENDAS
	c_Qry += " SELECT 'SD2' AS TABELA, D2.D2_FILIAL AS FILIAL,D2.D2_LOCAL AS LOCAL, D2.D2_GRUPO AS GRUPO, D2.D2_COD AS CODIGO, D2.D2_LOCALIZ AS ENDERECO " 
	c_Qry += " 	,SUM(D2.D2_QUANT)*-1 AS QTDE " 
	c_Qry += " FROM SD2010 D2 " 
	c_Qry += " WHERE D2.D2_FILIAL='" + FWxFilial("SD2") + "' AND D2.D_E_L_E_T_='' " 
	c_Qry += " 	AND D2.D2_EMISSAO = '" + DTOS(MV_PAR01) + "' " 
	c_Qry += " 	AND D2.D2_LOCAL BETWEEN '" + MV_PAR02 + "' AND '" + MV_PAR03 + "' "
	c_Qry += " 	AND D2.D2_QTDEDEV =0 " 
	c_Qry += " GROUP BY D2.D2_FILIAL,D2.D2_LOCAL, D2.D2_GRUPO, D2.D2_COD, D2.D2_LOCALIZ " 
	//--ORDER BY D2.D2_LOCAL, D2.D2_GRUPO, D2.D2_COD " 
	c_Qry += " ) TAB_XX " 
	c_Qry += " INNER JOIN SB1010 B1 ON (B1.B1_COD=TAB_XX.CODIGO AND B1.D_E_L_E_T_='' " 
	c_Qry += " 	AND B1.B1_GRUPO BETWEEN '" + MV_PAR04 +"' AND '" + MV_PAR05 +"' " 
	c_Qry += " 	AND B1.B1_COD BETWEEN '" + MV_PAR06 +"' AND '" + MV_PAR07 +"') " 
	c_Qry += " INNER JOIN NNR010 NNR ON (NNR.NNR_FILIAL='" + FWxFilial("NNR") + "' AND NNR.D_E_L_E_T_='' AND NNR.NNR_CODIGO=TAB_XX.LOCAL) " 
	c_Qry += " INNER JOIN SBM010 BM ON (BM.D_E_L_E_T_='' AND BM.BM_GRUPO=TAB_XX.GRUPO) " 
	c_Qry += " GROUP BY FILIAL, LOCAL,NNR.NNR_DESCRI, GRUPO,BM.BM_DESC, CODIGO,B1.B1_DESC, ENDERECO " 
	c_Qry += " ORDER BY FILIAL, LOCAL, GRUPO, CODIGO " 

	PlSQuery(c_Qry,"_Q01")

	Count to n_Reg
	oReport:SetMeter(n_Reg)
	DbGoTop()

	While !Eof() //laço por armazem
		If oReport:Cancel()
			Exit
		EndIf
		
		//inicializa a primeira seção
		oSection1:Init()
		oReport:IncMeter()
		
		IncProc("Imprimindo Armazem "+alltrim(_Q01->ARMAZEM))
		
		oSection1:Cell('NNR_CODIGO'):SetValue(_Q01->LOCAL)
		oSection1:Cell('NNR_DESCRI'):SetValue(_Q01->ARMAZEM)
		oSection1:PrintLine()

		cLocal 	:= _Q01->LOCAL
		
		While _Q01->LOCAL == cLocal //laço por GRUPO
			oReport:IncMeter()		
			//inicializo a segunda seção
			oSection2:init()
		
			IncProc("Imprimindo grupo "+alltrim(_Q01->GRUPO))
			oSection2:Cell("BM_GRUPO"):SetValue(_Q01->GRUPO)
			oSection2:Cell("BM_DESC"):SetValue(_Q01->NOGRUPO)
			oSection2:PrintLine()
			cGRUPO 	:= _Q01->GRUPO
			oSection3:init()
			While _Q01->GRUPO == cGRUPO //laço por PRODUTO
				oReport:IncMeter()
				IncProc("Imprimindo Produto "+alltrim(_Q01->CODIGO))
				
				aSaldo := CalcEst(_Q01->CODIGO,_Q01->LOCAL,MV_PAR01 + 1, _Q01->FILIAL)
				nSaldo := aSaldo[1] 
					
				oSection3:Cell("B1_COD"):SetValue(_Q01->CODIGO)
				oSection3:Cell("B1_DESC"):SetValue(_Q01->DESCRICAO)
				oSection3:Cell("_SLDREF"):SetValue(nSaldo)
				oSection3:Cell("_SLDATU"):SetValue(_Q01->QATU)
				oSection3:Cell("_ENDERECO"):SetValue(_Q01->ENDERECO)
				oSection3:PrintLine()			
				
				if MV_PAR08 == 1
					//Gravar o Lista Mestre
					dbSelectArea("CBA")
					CBA->(dbSetOrder(3)) //Filial+Tipo+Status+Almoxarifado+Produto+Data
					If !CBA->(dbSeek(FWxFilial("CBA")+"1"+"0"+_Q01->LOCAL+_Q01->CODIGO+DTOS(MV_PAR01)))
						alert("gravando lista mestre")
						RecLock('CBA',.T.)
						CBA->CBA_FILIAL	:= FWxFilial("CBA")
						CBA->CBA_CODINV := GETSXENUM("CBA","CBA_CODINV")
						CBA->CBA_DATA	:= DTOS(MV_PAR01)
						CBA->CBA_CONTS	:= 1
						CBA->CBA_LOCAL	:= _Q01->LOCAL
						CBA->CBA_TIPINV	:= '1'
						CBA->CBA_STATUS	:= '0'
						CBA->CBA_PROD	:= _Q01->CODIGO
						CBA->(MsUnlock())
						alert('lista mestre gravada')
					EndIf
				Endif
				_Q01->(dbSkip())
			EndDo //produto
			//finalizo a terceira seção para que seja reiniciada para o proximo registro
			oSection3:Finish()
			//imprimo uma linha para separar um grupo do outro
			oReport:ThinLine()
			//finalizo a segunda seção
			oSection2:Finish()
 		EndDo	//grupo
 		//finalizo a primeira  seção
 		oSection1:Finish()
		//imprimo uma linha para separar um local do outro
		oReport:ThinLine()
 	EndDo //armazem
 	oReport:EndPage(.T.)		// Finaliza pagina de impressao (zeras as linhas e colunas)
Return

Static Function ValidPerg()
	Local _sAlias,i,j
	_sAlias := GetArea()
	//Retirado Sangelles 22/03/2022 ->dbSelectArea("SX1")
	//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
	cPerg := PADR(c_Perg,10)
	aRegs:={}

	AADD(aRegs,{cPerg,"01","Data de Referência   ?","","","mv_ch1","D",08,00,00,"G","","mv_par01","","","","","","","","","","","","","","","","","","","","","","","","","",""})
	AADD(aRegs,{cPerg,"02","Armazém de           ?","","","mv_ch2","C",02,00,00,"G","","mv_par02","","","","","","","","","","","","","","","","","","","","","","","","","",""})
	AADD(aRegs,{cPerg,"03","Armazém até          ?","","","mv_ch3","C",02,00,00,"G","","mv_par03","","","","","","","","","","","","","","","","","","","","","","","","","",""})
	AADD(aRegs,{cPerg,"04","Grupo de             ?","","","mv_ch4","C",04,00,00,"G","","mv_par04","","","","","","","","","","","","","","","","","","","","","","","","","SBM",""})
	AADD(aRegs,{cPerg,"05","Grupo até            ?","","","mv_ch5","C",04,00,00,"G","","mv_par05","","","","","","","","","","","","","","","","","","","","","","","","","SBM",""})
	AADD(aRegs,{cPerg,"06","Produto de           ?","","","mv_ch6","C",15,00,00,"G","","mv_par06","","","","","","","","","","","","","","","","","","","","","","","","","SB1",""})
	aAdd(aRegs,{cPerg,"07","Produto até          ?","","","mv_ch7","C",15,00,00,"G","","mv_par07","","","","","","","","","","","","","","","","","","","","","","","","","SB1",""})
	aAdd(aRegs,{cPerg,"08","Gerar Inventário     ?","","","mv_ch8","N",01,00,00,"C","","mv_par08","1=Sim","","","","","2=Nao","","","","","","","","","","","","","","","","","","","",""})


	For i:=1 to Len(aRegs)
		//Retirado Sangelles 22/03/2022 ->If !dbSeek(cPerg+aRegs[i,2])
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
				If j <= Len(aRegs[i])
					FieldPut(j,aRegs[i,j])
				Endif
			Next j

			MsUnlock()
			dbCommit()
		endIf
	Next i

	RestArea(_sAlias)
Return
