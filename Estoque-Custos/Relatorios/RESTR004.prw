#INCLUDE "totvs.ch"
#INCLUDE "fileio.ch"
#INCLUDE "topconn.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRESTR004  บAutor  ณTarcisio Silva MirandaบDataณ  11/01/2018 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Relat๓rio Audit๓ria e Rastreabilidade do Leite.			  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Relat๓rio de Leite.                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function RESTR004()

	// Declaracao de Variaveis
	Local 	aArea 		:= GetArea()
	Local	cQry        := ""
	Local 	cEol        := chr(13)+chr(10)
	Local 	dDataDe		:= StoD("")
	Local	dDataAte	:= StoD("")
	Local	cFilDe		:= ""
	Local 	cFilAte		:= ""
	Local 	cProdDe		:= ""
	Local	cProdAte	:= ""

	////////////////////////////////////////////////////////////////////////
	///Outras Variaveis
	////////////////////////////////////////////////////////////////////////
	Private cLocFile    := ""
	Private cPerg       := "RESTR004"

	////////////////////////////////////////////////////////////////////////
	///Cria as perguntas no SX1
	////////////////////////////////////////////////////////////////////////
	ValPer01()

	if !Pergunte(cPerg,.t.)
		return
	endif

	dDataDe	     	:= dTos(mv_par01)
	dDataAte	    := dTos(mv_par02)
	cProdDe			:= mv_par03
	cProdAte		:= mv_par04
	cFilDe			:= mv_par05
	cFilAte			:= mv_par06
	cLocFile 	    := mv_par07

	cQry+=" SELECT ' ' CALC,Z19_FILIAL,Z19_TICKET,D1_DOC,SUBSTR(F1_EMISSAO,7,2)||'/'||SUBSTR(F1_EMISSAO,5,2)||'/'||SUBSTR(F1_EMISSAO,1,4) EMISSAO, 		   	 " +cEOL
	cQry+=" SUBSTR(F1_DTDIGIT,7,2)||'/'||SUBSTR(F1_DTDIGIT,5,2)||'/'||SUBSTR(F1_DTDIGIT,1,4) DIGITACAO,SUM(D1_QUANT) QTDD1,SUM(ZLD_QTDBOM) QTDBOM,         	 " +cEOL
	cQry+=" D1_SERIE,A2_NOME,B1_DESC,ZLD_TKPESO,B1_COD,A2_COD,A2_LOJA,ZLD_TOTBOM,Z19_PLACA,Z19_TIPO, 													   	 " +cEOL
	cQry+=" 	CASE A2_TIPO 																															   	 " +cEOL
	cQry+="         WHEN 'J' THEN SUBSTR(A2_CGC,1,2)||'.'||SUBSTR(A2_CGC,3,3)||'.'||SUBSTR(A2_CGC,6,3)||'/'||SUBSTR(A2_CGC,9,4)||'-'||SUBSTR(A2_CGC,13,2)    " +cEOL
	cQry+="         WHEN ' ' THEN ' '  																													   	 " +cEOL
	cQry+="         ELSE SUBSTR(A2_CGC,1,2)||'.'||SUBSTR(A2_CGC,3,3)||'.'||SUBSTR(A2_CGC,6,3)||'/'||SUBSTR(A2_CGC,9,4)||'-'||SUBSTR(A2_CGC,13,2)   		   	 " +cEOL
	cQry+="     END CGC, 																																   	 " +cEOL
	cQry+=" SUBSTR(Z19_DATAP1,7,5)||'/'||SUBSTR(Z19_DATAP1,5,2)||'/'||SUBSTR(Z19_DATAP1,1,4) AS Z19_DATAP1,Z19_HORAP1,Z19_P1,Z19_TPP1,Z19_DATARE, 		   	 " +cEOL
	cQry+=" Z19_HORARE,Z19_REPES,Z19_TPRE,SUBSTR(Z19_DATAP2,7,5)||'/'||SUBSTR(Z19_DATAP2,5,2)||'/'||SUBSTR(Z19_DATAP2,1,4) AS Z19_DATAP2,Z19_HORAP2, 	     " +cEOL
	cQry+=" Z19_P2,Z19_TPP2,Z19_DTBX,Z19_HRBX,Z19_USRBX,Z19_STATUS,Z19_NOME,Z19_PROD,Z19_DENS,Z19_DOCENT,Z19_MSFIL,ZLW_COD CODROTA,ZLW_DESCRI AS DESCROTA, 	 " +cEOL
	cQry+=" ZL2_COD AS CODSETOR,ZL2_DESCRI AS DESCSETOR 																									 " +cEOL    
	cQry+=" FROM " + RetSqlName("Z19" )+  " 																												 " +cEOL   
	cQry+=" LEFT JOIN " + RetSqlName("SD1") + " ON SD1010.D_E_L_E_T_ <> '*' AND D1_FILIAL  = Z19_FILIAL AND Z19_TICKET = D1_XTICKET  						 " +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("SF1") + " ON SF1010.D_E_L_E_T_ <> '*' AND F1_FILIAL  = D1_FILIAL	 AND F1_DOC 	= D1_DOC 	 AND F1_SERIE = D1_SERIE " +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("ZLD") + " ON  ZLD010.D_E_L_E_T_ <> '*' AND ZLD_FILIAL = Z19_FILIAL AND Z19_TICKET = ZLD_TKPESO 						 " +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("SA2") + " ON  SA2010.D_E_L_E_T_ <> '*' AND A2_COD  	= D1_FORNECE AND A2_LOJA 	= D1_LOJA 							 " +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("SB1") + " ON  SB1010.D_E_L_E_T_ <> '*' AND B1_COD 	= Z19_PROD 														 " +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("ZL2") + " ON  ZL2010.D_E_L_E_T_ <> '*' AND ZL2_FILIAL = ZLD_FILIAL AND ZL2_COD 	= ZLD_SETOR 						 " +cEOL
	cQry+=" LEFT JOIN " + RetSqlName("ZLW") + " ON  ZLW010.D_E_L_E_T_ <> '*' AND ZLW_COD	= ZLD_LINROT  													 " +cEOL
	cQry+=" WHERE Z19010.D_E_L_E_T_ <> '*'  																												 " +cEOL
	cQry+=" AND Z19_DATAP1 BETWEEN '"+dDataDe+"' AND '"+dDataAte+"'  																						 " +cEOL
	cQry+=" AND Z19_FILIAL BETWEEN '"+cFilDe+"' AND '"+cFilAte+"'  																							 " +cEOL
	cQry+=" AND Z19_PROD   BETWEEN '"+cProdDe+"' AND '"+cProdAte+"'  																							 " +cEOL
	cQry+=" GROUP BY Z19_FILIAL,Z19_TICKET,D1_DOC,A2_NOME,B1_DESC,D1_DOC,D1_SERIE,D1_SERIE,ZLD_TKPESO,Z19_TICKET,B1_COD,A2_COD,A2_LOJA,A2_TIPO,A2_CGC,Z19_PLACA,Z19_TIPO, " +cEOL 
	cQry+=" Z19_DATAP1,Z19_HORAP1,Z19_P1,Z19_TPP1,Z19_DATARE,Z19_HORARE,Z19_REPES,Z19_TPRE,Z19_DATAP2,Z19_HORAP2,Z19_P2,Z19_TPP2,Z19_DTBX,Z19_HRBX,Z19_USRBX, " +cEOL
	cQry+=" Z19_STATUS,Z19_NOME,Z19_PROD,Z19_DENS,Z19_DOCENT,Z19_MSFIL,ZLW_COD,ZLW_DESCRI,ZL2_COD,ZL2_DESCRI,ZLD_TOTBOM,F1_EMISSAO,F1_DTDIGIT				  " +cEOL

	MemoWrite("C:\temp\RESTR004.sql",cQry)

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

	U_xPutSx1(cPerg,"01","Emissใo De ?","."     	,"."       ,"mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Emissใo At้ ?","."     	,"."       ,"mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"03","Produto De ?","."     ,"."       ,"mv_CH3","C",15,0,0,"G","","SB1","","","MV_PAR03","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"04","Produto At้ ?","."     ,"."       ,"mv_CH4","C",15,0,0,"G","","SB1","","","MV_PAR04","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"05","Filial De ?","."     ,"." ,"mv_CH5","C",04,0,0,"G","","SM0","","","MV_PAR05","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"06","Filial At้ ?","."     ,".","mv_CH6","C",04,0,0,"G","","SM0","","","MV_PAR06","","","","","","","","","","","","","","","","")
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
	Local nPesol	 := 0 

	dbSelectArea("TRB")
	TRB->(dbGoTop())

	ProcRegua(TRB->(Reccount()) )

	_aHeadXls := {"Filial",'N๚mero do Ticket',"Peso Lํquido","Nota Fiscal","Dt.Emissใo","Dt.Digita็ใo", "Qtd.Nota Fiscal", "Qtd. Leite Produtor",;
	"Serie","Nome","Descri็ใo","Tkt. Pesagem","Cod.Produto","Cod.Fornecedor","Lj.Fornecedor","Qtd. Leite Veiculo",;
	"Placa","Tipo","Cnpj-Cpf","Dt.1ชPesagem","Hr.1ชPesagem","1o Pesagem","Tipo Peso 1","Dt Repesagem",;
	"Hora Repesagem","Repesagem","Tipo Repeso","Data Pesagem 2","Hora Pesagem 2","Pesagem 2","Tipo Pesagem 2","Data Baixa",;
	"Hora Baixa","Usuแrio da Baixa","Status","Motorista","Produto","Densidade","Nota FIscal Entrada","Filial de Inclusao",;
	"Cod.Rota","Desc.Rota","Cod.Setor","Desc.Setor"}


	While !TRB->(Eof())

		IncProc("Processando Relat๓rio: " + TRB->Z19_FILIAL + "-" + TRB->Z19_TICKET)


		If TRB->Z19_P2>0
			If TRB->Z19_REPES>0
				IF TRB->Z19_REPES>TRB->Z19_P2
					nPesoL:=TRB->Z19_REPES-TRB->Z19_P2
				Else 
					nPesoL:=TRB->Z19_P2-TRB->Z19_REPES
				Endif
			Else 
				IF TRB->Z19_P2>TRB->Z19_P1
					nPesoL:=TRB->Z19_P2-TRB->Z19_P1
				Else
					nPesoL:=TRB->Z19_P1-TRB->Z19_P2
				Endif                               
			Endif
		Endif

		if TRB->Z19_DENS > 0
			nPesol := nPesol / TRB->Z19_DENS
		Endif


		aAdd(_aColsXls,{TRB->Z19_FILIAL, TRB->Z19_TICKET,nPesol, TRB->D1_DOC, TRB->EMISSAO, TRB->DIGITACAO, TRB->QTDD1, TRB->QTDBOM,;
		TRB->D1_SERIE, TRB->A2_NOME, TRB->B1_DESC, TRB->ZLD_TKPESO,TRB->B1_COD,TRB->A2_COD,TRB->A2_LOJA,TRB->ZLD_TOTBOM,;
		TRB->Z19_PLACA,TRB->Z19_TIPO,TRB->CGC,TRB->Z19_DATAP1,TRB->Z19_HORAP1,TRB->Z19_P1,TRB->Z19_TPP1,TRB->Z19_DATARE,;
		TRB->Z19_HORARE,TRB->Z19_REPES,TRB->Z19_TPRE,TRB->Z19_DATAP2,TRB->Z19_HORAP2,TRB->Z19_P2,TRB->Z19_TPP2,TRB->Z19_DTBX,;
		TRB->Z19_HRBX,TRB->Z19_USRBX,TRB->Z19_STATUS,TRB->Z19_NOME,TRB->Z19_PROD,TRB->Z19_DENS,TRB->Z19_DOCENT,TRB->Z19_MSFIL,;
		TRB->CODROTA,TRB->DESCROTA,TRB->CODSETOR,TRB->DESCSETOR})

		nPesol	 := 0

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
