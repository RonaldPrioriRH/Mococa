#INCLUDE "protheus.ch"
#INCLUDE "rwmake.ch"
#INCLUDE "topconn.ch"
#INCLUDE "totvs.ch"
#include "msole.ch"

#DEFINE PLIN CHR(13)+CHR(10) //QUEBRA DE LINHA

User Function fwordDisc() 
	Local nOpca			:= 0
	Local aSays			:= {}
	Local aButtons 		:= {}

	Private cPerg 	  	:= "WORDDISC"
	Private cCadastro 	:= "Geração de Termo de Responsabilidade!"

	fPergunta(cPerg)

	Pergunte(cPerg,.F.)

	AADD(aSays,OemToAnsi("Este programa tem o objetivo de imprimir o documento de oficio dis-  ") )
	AADD(aSays,OemToAnsi("ciplinar de acordo com os parametros aqui informados.                ") ) 
	AADD(aSays,OemToAnsi("O arquivo modelo se encontra amarrado nos tipos de disciplinas.") ) 

	AADD(aButtons, { 5,.T.,{|| Pergunte(cPerg,.T. ) } } )
	AADD(aButtons, { 1,.T.,{|o| nOpca := 1, FechaBatch()} })
	AADD(aButtons, { 2,.T.,{|o| FechaBatch()}})

	FormBatch( cCadastro, aSays, aButtons )

	If nOpca == 1
		Processa({|lEnd| U_fGeraArq(MV_PAR01), "Gerando Modelo Disiciplinar!"})
	Endif
return

Static Function fPergunta(cPerg)
	Local aPerg := {}

    aAdd(aPerg,{"Tipo de Impressao?","C", 01, 0,,{'01-Abrir Word', '02-Imprimir Direto','','',''}})
	aAdd(aPerg,{"Filial De"		    ,"C", 06, 0,,,})
    aAdd(aPerg,{"Filial Ate"		,"C", 06, 0,,,})
	aAdd(aPerg,{"Matricula De"		,"C", TamSX3("RA_MAT")[1], 0, "SRA",,})
    aAdd(aPerg,{"Matricula Ate"		,"C", TamSX3("RA_MAT")[1], 0, "SRA",,})
    aAdd(aPerg,{"C.Custo De"		,"C", TamSX3("RA_CC")[1],  0, "CTT",,})
    aAdd(aPerg,{"C.Custo Ate"		,"C", TamSX3("RA_CC")[1],  0, "CTT",,})
    aAdd(aPerg,{"Data De"		    ,"D", 8,  0,,,})
    aAdd(aPerg,{"Data Ate"		    ,"D", 8,  0,,,})
    aAdd(aPerg,{"Tipo de Discipl"	,"C", 06, 0, "TIQ",,})
    aAdd(aPerg,{"Destino?"			,"C", 70, 0,,,})

    INFPUTX1(cPerg, aPerg)
Return

User Function fGeraArq(cTpImp)
    Local cDestino  := ALLTRIM(MV_PAR11)

	cDestino    := alltrim(cDestino)
	cDestino    += iif(subs(cDestino,len(alltrim(cDestino)),1) == '\', '', '\' )

    If !ExistDir(MV_PAR11)
        FWAlertError ("O caminho do arquivo nao foi encontrado!"+CRLF+"PARAMETETRO: "+MV_PAR11, "Destino")
        Return
    EndIf	

    Default cTpImp := "1"

	If !fConsulta()
		FWAlertError("Valores informados no parametro nao retornou nenhum resultado favor verifique novamente os parametros informados!", "Consulta")
		Return
	EndIf

	While !TMP1->(EOF())
		BeginMsOle()

		//Cria um ponteiro e já chama o arquivo
		oWord := OLE_CreateLink("TMSOLEWORD97")

		if cTpImp == 1
			OLE_SetProperty( oWord, oleWdVisible,   .T. )
			OLE_SetProperty( oWord, oleWdPrintBack, .F. )
		Else
			OLE_SetProperty( oWord, oleWdVisible,   .F. )
			OLE_SetProperty( oWord, oleWdPrintBack, .T. )
		Endif

		/*
		OLE_SetProperty(oWord,OLEWDLEFT ,000)
		OLE_SetProperty(oWord,OLEWDTOP ,090)
		OLE_SetProperty(oWord,OLEWDWIDTH ,480)
		OLE_SetProperty(oWord,OLEWDHEIGHT,250)
		*/

		OLE_NewFile(oWord, "\modelos\advertencia_disciplinar.dot") //cArquivo deve conter o endereço que o dot está na máquina, por exemplo, C:\arquivos_dot\teste.dotx
		
		//Setando o conteúdo das DocVariables
		OLE_SetDocumentVar(oWord, "VarData", 	RIGHT(TMP1->DTDISC,2)+' DE '+UPPER(MesExtenso(RIGHT( LEFT(TMP1->DTDISC,6), 2 )))+' DE '+LEFT(TMP1->DTDISC,4))
		OLE_SetDocumentVar(oWord, "VarNome", 	Capital(TMP1->NOME))
		OLE_SetDocumentVar(oWord, "VarMat", 	TMP1->MAT)
		OLE_SetDocumentVar(oWord, "VarCodigo", 	TMP1->COD)
		OLE_SetDocumentVar(oWord, "VarDesc", 	TMP1->DESCTXT)
		OLE_SetDocumentVar(oWord, "VarDiscip", 	TMP1->DISCIP)
		OLE_SetDocumentVar(oWord, "VarMotivo", 	TMP1->MOTIVO)
		OLE_SetDocumentVar(oWord, "VarDt", 		DtoC(StoD(TMP1->DTDISC)))
		
		//Atualizando campos
		OLE_UpdateFields(oWord)
		
		If cTpImp == 2
			OLE_SetProperty( oWord, '208', .F. )
			OLE_PrintFile( oWord, "ALL",,, 1 )
		else		
			Aviso("Atenção", "Alterne para o programa do Ms-Word para visualizar o documento " + strTran(ALLTRIM(DTOS(DDATABASE)+TIME()),':','_') + ".doc ou clique no botao para fechar.", {"Fechar"})
			OLE_SaveAsFile(oWord,cDestino+strTran(ALLTRIM(DTOS(DDATABASE)+TIME()),':','_')+".doc")
		Endif

		//Fechando o arquivo e o link
		OLE_CloseFile(oWord)
		OLE_CloseLink(oWord)

		TMP1->(DBSKIP())

		EndMsOle()
	END
return

Static Function fConsulta()
	Local lRet 			:= .T.
    Local cFilDe 	    := MV_PAR02
    Local cFilAte 	    := MV_PAR03
    Local cMatDe 	    := MV_PAR04
    Local cMatAte 	    := MV_PAR05
    Local cCCDe 	    := MV_PAR06
    Local cCCAte 	    := MV_PAR07
    Local cDataDe 	    := dtos(MV_PAR08)
	Local cDataAte 	    := dtos(MV_PAR09)
    Local cTipo		    := MV_PAR10
	Local lTipo		    := iif(EMPTY(MV_PAR10) .OR. ALLTRIM(MV_PAR10) == "*", .F., .T.)

	Local cQry 		:= ''

	cQry += "SELECT "+CRLF
	cQry += "	TIT_FILIAL FIL"+CRLF
    cQry += "	,TIT_CODIGO COD"+CRLF
	cQry += "	,TIT_MAT MAT"+CRLF
	cQry += "	,RA_NOME NOME"+CRLF
	cQry += "	,TIT_DATA DTDISC"+CRLF
    cQry += "	,TIQ_DESCR DISCIP"+CRLF
	cQry += "	,TIS_DESCRI MOTIVO"+CRLF
	cQry += "	,TIT_DESCRI DESCTXT"+CRLF
	//cQry += "	,TIQ_XMODELO MODELO"+CRLF
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

	If TMP1->(EOF())
		lRet := .F.
	EndIf

return lRet

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
