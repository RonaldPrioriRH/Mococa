#include "rwmake.ch"
#include 'protheus.ch'
#include 'totvs.ch'
#Include 'TopConn.ch'

/*
    Relatorio disciplinar

    Parametros:
        -filial
        -matiricula
        -CC
        -data
        -tipo da disciplina
*/

User Function fRelDisc()
	Local oReport
    Local cPerg := UPPER("fRelDisc")

	fAjustaSX1(cPerg)

	Pergunte(cPerg,.F.)
	oReport := ReportDef(cPerg)
	oReport:PrintDialog()
Return


Static Function ReportDef(cPerg)
	Local oReport
	Local oPedidos

	oReport := TReport():New(	cPerg,;
								"Disciplinar",;
								cPerg,;
								{|oReport| ReportPrint(oReport)},;
								"Relatorio contendo as ocorrencias disciplinares ocorridas.")

	oReport:SetPortrait()
	oReport:SetTotalInLine(.T.)
	oReport:nfontbody := 8

	oReport:SetLandscape(.f.)
	oPedidos := TRSection():New(oReport, "Ocorrencias" , {"TMP1"},{"Filial+Matricula", "Filial+Data"} , /*Campos do SX3*/,/*Campos do SIX*/)

	oPedidos:SetPageBreak(.f.)
	oPedidos:SetNoFilter({"TMP1"})

	TRCell():New(oPedidos,"FIL",		"TMP1","FILIAL"			,"@!"				,004,,/*lPixel*/,/*{|| code-block de impressao }*/)
	TRCell():New(oPedidos,"MAT",		"TMP1","MATRICULA"		,"@!"				,006,,/*lPixel*/,/*{|| code-block de impressao }*/)
	TRCell():New(oPedidos,"NOME",   	"TMP1","NOME"   		,"@!"				,030,,/*lPixel*/,/*{|| code-block de impressao }*/)
	TRCell():New(oPedidos,"DATA",	    "TMP1","DATA"   		,"@D"				,010,,/*lPixel*/,/*{|| code-block de impressao }*/)
	TRCell():New(oPedidos,"DISCIP",		"TMP1","DISCIPLINA"		,"@!"				,030,,/*lPixel*/,/*{|| code-block de impressao }*/)
	TRCell():New(oPedidos,"MOTIVO",	    "TMP1","MOTIVO"		    ,"@!"				,030,,/*lPixel*/,/*{|| code-block de impressao }*/)
	TRCell():New(oPedidos,"AFAST",      "TMP1","DIAS AFAST"	    ,"@E"		        ,009,,/*lPixel*/,/*{|| code-block de impressao }*/)
		
	/*
	//Quebra de linha
	oBrk := TRBreak():New(oClient,oClient:Cell("EMISSAO"),"  ",.F.)
	
	//Totalizadores
	TRFunction():New(oClient:Cell("PESO")	,"TOTAL PESO"		, "SUM"		, oBreak,"TOTAL PESO"		,"@E 999,999,999.99",        ,        .T.,       .T.,     .T.,       ,          ,        ,         )
	TRFunction():New(oClient:Cell("LIQUIDO"),"TOTAL VLR LIQUIDO", "SUM"		, oBreak,"TOTAL VLR LIQUIDO","@E 999,999,999.99",        ,        .T.,       .T.,     .T.,       ,          ,        ,         )
	TRFunction():New(oClient:Cell("BRUTO")	,"TOTAL VLR BRUTO"	, "SUM"		, oBreak,"TOTAL VLR BRUTO"	,"@E 999,999,999.99",        ,        .T.,       .T.,     .T.,       ,          ,        ,         )
	TRFunction():New(oClient:Cell("FRETE")	,"TOTAL FRETE"	    , "SUM"		, oBreak,"TOTAL VLR FRETE"	,"@E 999,999,999.99",        ,        .T.,       .T.,     .T.,       ,          ,        ,         )
	*/
Return(oReport)

Static Function ReportPrint(oReport)
	//VARIAVEIS PARAMETROS
	/*  
		-Emissao
        -Vencto
        -Doc
        -Fornecedor
        -Natureza
	*/

	Local cFilDe 	    := MV_PAR01
    Local cFilAte 	    := MV_PAR02
    Local cMatDe 	    := MV_PAR03
    Local cMatAte 	    := MV_PAR04
    Local cCCDe 	    := MV_PAR05
    Local cCCAte 	    := MV_PAR06
    Local cDataDe 	    := dtos(MV_PAR07)
	Local cDataAte 	    := dtos(MV_PAR08)
    Local cTipo		    := MV_PAR09
	Local lTipo		    := iif(EMPTY(MV_PAR09) .OR. ALLTRIM(MV_PAR09) == "*", .F., .T.)

	Local oClient 	:= oReport:Section(1)
	Local cQry 		:= ''

	cQry += "SELECT "+CRLF
	cQry += "	TIT_FILIAL FIL,"+CRLF
	cQry += "	TIT_MAT MAT,"+CRLF
	cQry += "	RA_NOME NOME,"+CRLF
	cQry += "	TIT_DATA DATA,"+CRLF
	cQry += "	TIQ_DESCR DISCIP,"+CRLF
	cQry += "	TIS_DESCRI MOTIVO,"+CRLF
	cQry += "	TIT_QTDDIA AFAST"+CRLF
	cQry += "FROM "+CRLF
	cQry += "	"+RetSqlName("TIT")+" TIT"+CRLF
	cQry += "INNER JOIN "+CRLF
	cQry += "	"+RetSqlName("SRA")+" SRA"+CRLF
	cQry += "	ON  SRA.D_E_L_E_T_ = ' '"+CRLF
	cQry += "	AND RA_FILIAL = TIT_FILIAL"//'"+xFilial("SRA")+"'"+CRLF
	cQry += "	AND RA_MAT = TIT_MAT"+CRLF
	cQry += "LEFT JOIN"+CRLF
	cQry += "	"+RetSqlName("TIQ")+" TIQ"+CRLF
	cQry += "	ON  TIQ.D_E_L_E_T_ = ' '"+CRLF
	cQry += "	AND TIQ_FILIAL = ' '" //'"+xFilial("TIQ")+"'"+CRLF
	cQry += "	AND TIQ_CODIGO = TIT_CODTIQ"+CRLF
	cQry += "LEFT JOIN"+CRLF
	cQry += "	"+RetSqlName("TIS")+" TIS"+CRLF
	cQry += "	ON  TIS.D_E_L_E_T_ = ' '"+CRLF
	cQry += "	AND TIS_FILIAL = ' '" //'"+xFilial("TIS")+"'"+CRLF
	cQry += "	AND TIS_CODIGO = TIT_CODTIS"+CRLF
	cQry += "WHERE TIT.D_E_L_E_T_ = ' '"+CRLF
	cQry += "AND TIT_FILIAL BETWEEN '"+cFilDe   +"' AND '"+cFilAte+"'"+CRLF
	cQry += "AND TIT_MAT    BETWEEN '"+cMatDe   +"' AND '"+cMatAte+"'"+CRLF
    cQry += "AND RA_CC      BETWEEN '"+cCCDe    +"' AND '"+cCCAte +"'"+CRLF
	cQry += "AND TIT_DATA   BETWEEN '"+cDataDe  +"' AND '"+cDataAte+"'"+CRLF
    
    if lTipo
        cQry += "AND TIT_CODTIQ  = '"+cTipo+"'"+CRLF
    endIF
	
    cQry += "ORDER BY TIT_FILIAL, TIT_MAT"+CRLF

	MemoWrite("C:\temp\fRelDisc.txt",cQry)

	If select("TMP1") > 0
		TMP1->(DBCloseArea())
	EndIf

	TCQUERY cQry NEW ALIAS "TMP1"

	TMP1->(dbGoTop())

	oClient:Init()

	While !TMP1->(EOF())
		If oReport:Cancel()
			Exit
		EndIf

		oClient:Init()
		oReport:IncMeter()
		oClient:Cell("FIL"):SetValue(alltrim(TMP1->FIL))
		oClient:Cell("MAT"):SetValue(alltrim(TMP1->MAT))
        oClient:Cell("NOME"):SetValue(alltrim(TMP1->NOME))
		oClient:Cell("DATA"):SetValue(DtoC(StoD(TMP1->DATA)))
		oClient:Cell("DISCIP"):SetValue(alltrim(TMP1->DISCIP))
		oClient:Cell("MOTIVO"):SetValue(alltrim(TMP1->MOTIVO))
		oClient:Cell("AFAST"):SetValue(TMP1->AFAST)

		oClient:Printline()
		oReport:SkipLine()

		TMP1->(dbskip())
	EndDo
	
	TMP1->(dbclosearea())

	oClient:Finish()
Return


Static Function fAjustaSX1(cPerg)
	Local aPerg := {}

	aAdd(aPerg,{"Filial De"		    ,"C", 06, 0,,,})
    aAdd(aPerg,{"Filial Ate"		,"C", 06, 0,,,})
	aAdd(aPerg,{"Matricula De"		,"C", TamSX3("RA_MAT")[1], 0, "SRA",,})
    aAdd(aPerg,{"Matricula Ate"		,"C", TamSX3("RA_MAT")[1], 0, "SRA",,})
    aAdd(aPerg,{"C.Custo De"		,"C", TamSX3("RA_CC")[1],  0, "CTT",,})
    aAdd(aPerg,{"C.Custo Ate"		,"C", TamSX3("RA_CC")[1],  0, "CTT",,})
    aAdd(aPerg,{"Data De"		    ,"D", 8,  0,,,})
    aAdd(aPerg,{"Data Ate"		    ,"D", 8,  0,,,})
    aAdd(aPerg,{"Tipo de Discipl"	,"C", 06, 0, "TIQ",,})

	INFPUTX1(cPerg,aPerg)
Return

/*
Funcao responsavel por criar e corrigir os campos nas perguntas do protheus.
*/
Static Function INFPUTX1(_cGRP,_aPar)
	Local _I := 0
	Local _cSeq := "00"
	Local _cVrvl := "0"
	Local _lRec := .F.
	Local _cGSC := "G"
	_cGrp := Pad(_cGRP,Len(SX1->X1_GRUPO))
	SX1->(dbSetOrder(1))
	//Primeiro Cria ou Altera os registros

	SX1->(dbGoTop())
	If SX1->(dbSeek(_cGrp+"01"))
		While !SX1->(EOF()) .AND. SX1->X1_GRUPO == _cGrp
			If SX1->X1_ORDEM > _cSeq
				RecLock("SX1",_lRec)
					SX1->(dbDelete())
				SX1->(MsUnLock())
			EndIf
			SX1->(dbSkip())
		EndDo
	EndIf

	For _I := 1 To Len(_aPar)
		_cSeq := Soma1(_cSeq)
		_cVrvl := Soma1(_cVrvl)
		_cGSC := "G"
		_lRec := !SX1->(dbSeek(_cGrp+_cSeq))
		RecLock("SX1",_lRec)
		SX1->X1_GRUPO		:= _cGrp
		SX1->X1_ORDEM		:= _cSeq
		SX1->X1_PERGUNT	:= _aPar[_I,01]
		SX1->X1_TIPO		:= _aPar[_I,02]
		SX1->X1_TAMANHO	:= _aPar[_I,03]
		SX1->X1_DECIMAL	:= _aPar[_I,04]
		SX1->X1_F3			:= _aPar[_I,05]
		If Len(_aPar[_I]) >= 6 .AND. _aPar[_I,6] <> Nil
			SX1->X1_DEF01		:= _aPar[_I,06,1]
			SX1->X1_DEF02		:= _aPar[_I,06,2]
			SX1->X1_DEF03		:= _aPar[_I,06,3]
			SX1->X1_DEF04		:= _aPar[_I,06,4]
			SX1->X1_DEF05		:= _aPar[_I,06,5]
			_cGSC := "C"
		Else
			SX1->X1_DEF01		:= ""
			SX1->X1_DEF02		:= ""
			SX1->X1_DEF03		:= ""
			SX1->X1_DEF04		:= ""
			SX1->X1_DEF05		:= ""
		EndIf
		If Len(_aPar[_I]) >= 7
			SX1->X1_VALID	:= _aPar[_I,07]
		EndIf
		SX1->X1_VAR01		:= ("MV_PAR"+_cSeq)
		SX1->X1_GSC		:= _cGSC
		SX1->X1_VARIAVL	:= ("MV_CH"+_cVrvl)
		SX1->(MsUnLock())
	Next _I
Return
