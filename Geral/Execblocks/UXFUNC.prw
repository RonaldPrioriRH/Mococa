#include "protheus.ch"
#include "topconn.ch"
#include "fileio.ch"

/*/{Protheus.doc} UXFUNC
Fonte responsavel pela criação de funções genericas do projeto
----------------------------------------------------------------------------
			Funções Contidas nesse arquivo
----------------------------------------------------------------------------
Funcao       Descrição				      Data                  Autor
----------------------------------------------------------------------------
ORDGRID       Funcao responsavel pela	  08/06/2016            Raphael Martins
			  ordenacao de Grids da
			  classe MsNewGetDados

LimpaAcolsMvc Funcao para Limpar Dados							Wellington Gonçalves
			  da GRID em telas do Tipo
			  MVC

CRIALOG       Funcao para Criar Arquivo   08/06/2016		    Andre Barrero
			  de Log no diretorio
			  desejado.

UXmlTag		  Funcao para montar uma tag						TOTVS GO
		      XML de acordo com o nome

UPROXIMO	  Função para fazer sequencia						Danilo Brito
			  via query (SLQ)

MultSel		  Função para montar consulta						TOTVS GO
			  específica com multiseleção

UHELP		  Função para mostrar help e						Danilo Brito
			  solução, sem necessidade de
			  inclusao de help padrão

toString	  Função para converter qualquer					Danilo Brito
			  tipo de variavel em string

NoChrEsp	  Função para remover/substituir					Danilo Brito
			  caracteres especiais de uma
			  string

EstHiVen	  Função para retornar estrutura 					Danilo Brito
			  hierarquica do vendedor, do seu
			  nível para baixo

zAtuPerg	  Função para alterar conteudo de MV_PARxx			TOTVS GO
			  antes de abrir o pergunte

@author TOTVS GOIÁS
@since 08/06/2016
@version P11
@param Nao recebe parametros
@return nulo
/*/
//----------------------------------------------------------------------------

/*/{Protheus.doc} ORDGRID
Funcao responsavel pela
ordenacao de Grids da
classe MsNewGetDados

@author TOTVS
@since 03/06/2016
@version P12
@param
	oObj   - Objeto MsNewGetDados para Ordenacao
	nColum - Coluna que sera ordenada na Grid
Atencao!
Os fontes que executam a funcao abaixo deverão ter
as seguintees variaveis
Private __XVEZ 		:= "0"
Private __ASC       := .T.
@return nulo
/*/

User Function OrdGrid(oObj,nColum) //U_OrdGrid(oNewGet,nColuna)

	Local nX 		:= 1
	Local aAux 		:= {}

	if __XVEZ == "0"
		__XVEZ := "1"
	else
		if __XVEZ == "1"
			__XVEZ := "2"
		endif
	endif

	if __XVEZ == "2"

		// reordeno o array do grid
		if __ASC
			if valtype(oObj) == "A"
				ASORT(oObj,,,{|x, y| x[nColum] < y[nColum] }) //ordena?o crescente
			else
				ASORT(oObj:aCols,,,{|x, y| x[nColum] < y[nColum] }) //ordena?o crescente
			endif
			__ASC := .F.
		else
			if valtype(oObj) == "A"
				ASORT(oObj,,,{|x, y| x[nColum] > y[nColum] }) //ordena?o decrescente
			else
				ASORT(oObj:aCols,,,{|x, y| x[nColum] > y[nColum] }) //ordena?o decrescente
			endif
			__ASC := .T.
		endif

		// fa? um refresh no grid
		if valtype(oObj) == "O"
			oObj:oBrowse:Refresh()
		endif
		__XVEZ := "0"

	endif

Return()


/*/{Protheus.doc} LimpaAcolsMVC
Função que limpa o acols MVC colocando uma linha em branco
@author TOTVS
@since 03/06/2016
@version P12
@param
	oGrid   - Objeto MsNewGetDados para Ordenacao
	oView   - Objeto View do MVC
Atencao!
@return nulo
/*/

User Function LimpaAcolsMVC(oGrid,oView)

	Local aArea 	:= GetArea()
	Local aFields	:= {}
	Local aAux		:= {}
	Local nX		:= 1

	// deleto todos os itens
	For nX := 1 To oGrid:Length()

		// posiciono na primeira linha
		oGrid:GoLine(1)

		// deleto o item
		oGrid:DeleteLine()

	Next nX

	// crio um array com a estrutura da SX3
	SX3->(DbSetOrder(2)) // X3_CAMPO
	For nX := 1 To Len(oGrid:aHeader)

		If SX3->(DbSeek(oGrid:aHeader[nX,2]))
			Aadd(aFields, CriaVar(SX3->X3_CAMPO))
		Endif

	Next nX

	aadd(aFields,.F.)

	// copio a estrutura do array aDataModel
	aAux := aClone(oGrid:aDataModel[1])

	// atualizo a estrutura
	aAux[1,1] := aClone(aFields)

	// limpo a estrutura do aDataModel
	oGrid:aDataModel := {}

	// atualizo a estrutura doa aDataModel
	aadd(oGrid:aDataModel,aAux)

	// posiciono na primeira linha
	oGrid:GoLine(1)

	// se estiver deletada, tiro a deleção
	If oGrid:IsDeleted()
		oGrid:UnDeleteLine()
	EndIf

	// atualizo a View
	If oView <> nil
		oView:Refresh()
	EndIf

	RestArea(aArea)

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³CriaLog     ºAutor  ³André R. Barrero     ºData ³19/01/15   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Cria arquivo de log                                        º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                        º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function CriaLog(cPasta,cNomeArq,cTexto)

	Local cFile := cPasta+cNomeArq //"\temp\arquivo.txt"
	Local nH

	nH := FILE(cFile)
	If nH == .F.
		nH := fCreate(cFile,FC_NORMAL)
		If nH == -1
			MsgStop("Falha ao criar arquivo - erro "+str(ferror()))
			Return
		Endif
	Else
		nH := fOpen(cFile , FO_READWRITE + FO_SHARED)
		If nH == -1
			MsgStop('Erro de abertura : FERROR '+str(ferror(),4))
		Endif
	Endif

	// Posiciona no fim do arquivo
	FSeek(nH, 0, FS_END)

	// Escreve o texto mais a quebra de linha CRLF
	fWrite( nH,cTexto + chr(13)+chr(10) )

	fClose(nH)

Return


//Exemplo
//U_UXmlTag("TESTE","conteudo da tag aqui")
//retorno: <TESTE>conteudo da tag aqui</TESTE>
User Function UXmlTag(cNmTag, cContent, lEOL, cComplem)

	Local cRet := ""
	Default lEOL := .F.
	Default cComplem := ""

	cRet += "<"+cNmTag+cComplem+">"
	if lEOL
		cRet += chr(13)+chr(10)
	endif
	cRet += cContent
	cRet += "</"+cNmTag+">"
	cRet += chr(13)+chr(10)

Return cRet




/*/{Protheus.doc} UPROXIMO

@author Totvs GO
@since 10/04/2014
@version 1.0

@param _alias, caracter, Alias da tabela
@param _campo, caracter, Nome do campo
@param _filial, caracter, Filial a ser considerada
@param _ntam, caracter, Tamanho da string sequencial
@param _where, caracter, Clausula sql adicional, a ser considerada na gera?o do sequencial

@return caracter, Proximo sequencial, conforme parametros informados

@description

Função que retorna o proximo codigo caracter sequencial de um campo. (substitui o getxnum)

@example

GETSXENUM("ZF1","ZF1_SEQUEN?)
No inicializador de campo: U_UPROXIMO("ZF1","ZF1_SEQUEN",xFilial("ZF1"), 10)

/*/
User Function UPROXIMO(_alias, _campo, _filial, _ntam, _where, _lDelet)

	Local _cLocal	:= getarea()
	Local _nProx	:= ""
	Local _cCampo	:= _campo
	Local _cAlias	:= _alias
	Local _cFilial	:= _filial
	Default _nTam	:= TamSx3(_campo)[1]
	Default _where  := ""
	Default _lDelet := .F.

	If Empty(_cCampo) .or. Empty(_cAlias)
		Return nil
	Endif

	//cQry := "SELECT MAX(CAST("+_cCampo+" AS FLOAT)) PROX "
	cQry := "SELECT MAX("+_cCampo+") PROX "
	cQry += " FROM " + RetSqlName(_cAlias)
	if _lDelet
		cQry += " WHERE D_E_L_E_T_ <> '*' "
	endif
	If !Empty(_cFilial)
		if "WHERE" $ cQry
			cQry += " AND "
		else
			cQry += " WHERE "
		endif
		//preenche filial do alias
		If Left(_cAlias,1)<>"S"
			cQry += _cAlias+"_FILIAL = '"+_cFilial+"' " //ZZZ_FILIAL := xfilial("ZZZ")
		Else
			cQry += right(_cAlias,2)+"_FILIAL = '"+_cFilial+"' " //Z1_FILIAL := xfilial("SZ1")
		Endif
	EndIf
	If !Empty(_where)
		if "WHERE" $ cQry
			cQry += " AND "
		else
			cQry += " WHERE "
		endif
		cQry += _where
	EndIf

	If Select("QAUX") > 0
		QAUX->(dbCloseArea())
	EndIf

	cQry := ChangeQuery(cQry)
	dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUX", .F., .T.)

	If Empty(QAUX->PROX)
		_nProx := strzero( 1, _nTam )
	Else
		_nProx := PADL(soma1(QAUX->PROX),_nTam,"0") //PADL(alltrim(&("M->"+cCampo)),nTamanho,"0") strzero( QAUX->PROX+1, _nTam )
		//_nAux  := val( _nProx )
		FreeUsedCode()
		While !MayIUseCode( _cAlias + xFilial(_cAlias) + _nProx /*strzero( _nAux,_nTam )*/ )
			_nProx := soma1(_nProx)//_nAux += 1
		EndDo
		//_nProx:=strzero( _nAux, _nTam )
	EndIf

	If Select("QAUX") > 0
		QAUX->(dbCloseArea())
	EndIf

	restarea( _cLocal )

Return _nProx



/*/{Protheus.doc} MultSel

@author Totvs GO
@since 10/04/2014
@version 1.0

@param _cTitulo, caracter, Titulo da tela a ser motada
@param _cAlias, caracter, Alias a ser usado para busca dos registros
@param _cColuna, caracter, Colunas a ser mostrada na grid
@param _cColOrd, caracter, Coluna a ser considerada para ordenação
@param _cCond, caracter, Condição para quando quiser ja trazer filtrados registros
@param _cInf, caracter, String de dados iniciais a ser marcados
@param _cSep, caracter, Separador a ser utilizado
@param _lSelObr, logico, define se será obrigado a selecionar pelo menos um registro

@return Lógico, .T. = Pode usar o abastecimento

@description
Monta tela de Multi-seleção de registros.

@example
//Campo com Botao
cGet6 := U_MultSel("Clientes","SA1","A1_COD,A1_NOME","A1_NOME","A1_MSBLQL = '2'",cGet6)
oGet6:Refresh()

//Consulta Especifica (F3)
Em Express?: Colocar .T.
Em Retorno: U_MultSel("Tipos de Titulo","SX5","X5_CHAVE,X5_DESCRI","X5_CHAVE","X5_TABELA = '05'",&(ReadVar()))
/*/
User Function MultSel(_cTitulo,_cAlias,_cColuna,_cColOrd,_cCond,_cInf,_cSep,_lSelObr)

	Local cQry			:= ""
	Local aColunas 		:= {}
	Local aInf			:= {}
	Local aDados		:= {}

	Local aCampos		:= {}
	Local aCampos2		:= {}

	Local oBut1, oBut2, oBut3
	Local nPosIt		:= 0
	Local nI

	if "X5Descri()" $ _cColuna
		_cColuna := StrTran( _cColuna, "X5Descri()", "X5_DESCRI" )
	endif

	Default _cSep		:= "/" //separador de retorno
	Default _lSelObr	:= .T. //obrigatorio selecionar pelo menos 1 registro

	aColunas 		:= StrTokArr(_cColuna,",")
	aCampos			:= {{"OK","C",002,0},{"COL1","C",TamSX3(aColunas[1])[1],0},{"COL2","C",TamSX3(aColunas[2])[1],0}}
	aCampos2		:= {{"OK","","",""},{"COL1","","Codigo",""},{"COL2","","Nome/Descricao",""}}


	aInf				:= IIF(!Empty(_cInf),StrTokArr(AllTrim(StrTran(_cInf,Chr(13)+Chr(10),"")),_cSep),{})

	Private cRet		:= ""
	Private cArqTrab	:= CriaTrab(aCampos) // Criando arquivo temporario

	Private oDlgSel
	Private oMark
	Private cMarca	 	:= "mk"
	Private lImpFechar	:= .F.

	Private oSay1, oSay2, oSay3, oSay4, oSay5
	Private oTexto
	Private cTexto		:= Space(40)
	Private oLoja
	Private cLoja		:= Space(2)
	Private nContSel	:= 0

	Private cInf := _cInf

	If _cAlias == "SA1"
		aCampos		:= {{"OK","C",002,0},{"COL1","C",TamSX3(aColunas[1])[1],0},{"COL2","C",TamSX3(aColunas[2])[1],0},{"COL3","C",TamSX3(aColunas[3])[1],0}}
		aCampos2	:= {{"OK","","",""},{"COL1","","Codigo",""},{"COL2","","Loja",""},{"COL3","","Nome/Descricao",""}}
		cArqTrab	:= CriaTrab(aCampos) // Criando arquivo temporario
	Endif

	If Select("QRYAUX") > 0
		QRYAUX->(DbCloseArea())
	Endif

	cQry := "SELECT DISTINCT "+_cColuna+""
	cQry += " FROM "+RetSqlName(_cAlias)+""
	cQry += " WHERE D_E_L_E_T_ <> '*'"
	cQry += " AND "+IIF(SubStr(_cAlias,1,1) == "S",SubStr(_cAlias,2,2),_cAlias)+"_FILIAL = '"+xFilial(_cAlias)+"'"

	If ValType(_cCond) <> "U" .AND. !empty(_cCond)
		cQry += " AND "+_cCond
	Endif

	cQry += " ORDER BY "+_cColOrd+""

	cQry := ChangeQuery(cQry)
	TcQuery cQry NEW Alias "QRYAUX"

	While QRYAUX->(!EOF())

		If _cAlias == "SA1"
			aAdd(aDados,{&("QRYAUX->"+aColunas[1]),&("QRYAUX->"+aColunas[2]),&("QRYAUX->"+aColunas[3])})
		Else
			aAdd(aDados,{&("QRYAUX->"+aColunas[1]),&("QRYAUX->"+aColunas[2])})
		Endif

		QRYAUX->(dbSkip())
	EndDo

	If Select("QRYAUX") > 0
		QRYAUX->(DbCloseArea())
	Endif

	DBUseArea(.T.,,cArqTrab,"TRBAUX",If(.F. .OR. .F., !.F., NIL), .F.)  // Criando Alias para o arquivo temporario

	DbSelectArea("TRBAUX")

	If Len(aDados) > 0

		For nI := 1 to Len(aDados)

			TRBAUX->(RecLock("TRBAUX",.T.))

			If Len(aInf) > 0

				If _cAlias == "SA1"
					nPosIt := aScan(aInf,{|x| AllTrim(SubStr(x,1,6)) == AllTrim(aDados[nI][1]) .And. AllTrim(SubStr(x,7,2)) == AllTrim(aDados[nI][2])})
				Else
					nPosIt := aScan(aInf,{|x| AllTrim(x) == AllTrim(aDados[nI][1])})
				Endif

				If nPosIt > 0
					TRBAUX->OK := "mk"
					nContSel++
				Else
					TRBAUX->OK := "  "
				Endif
			Else
				TRBAUX->OK := "  "
			Endif
			TRBAUX->COL1 := aDados[nI][1]
			TRBAUX->COL2 := aDados[nI][2]
			If _cAlias == "SA1"
				TRBAUX->COL3 := aDados[nI][3]
			Endif
			TRBAUX->(MsUnlock())
		Next
	Else
		TRBAUX->(RecLock("TRBAUX",.T.))
		TRBAUX->OK		:= "  "
		TRBAUX->COL1	:= Space(6)
		If _cAlias == "SA1"
			TRBAUX->COL2 	:= Space(2)
			TRBAUX->COL3 	:= Space(40)
		Else
			TRBAUX->COL2 	:= Space(40)
		Endif

		TRBAUX->(MsUnlock())
	Endif

	TRBAUX->(DbGoTop())

	DEFINE MSDIALOG oDlgSel TITLE "Selecao de Dados - " + _cTitulo From 000,000 TO 450,700 COLORS 0, 16777215 PIXEL

	@ 005, 005 SAY oSay1 PROMPT "Nome/Descricao:" SIZE 060, 007 OF oDlgSel COLORS 0, 16777215 PIXEL

	If _cAlias == "SA1"
		@ 004, 050 MSGET oTexto VAR cTexto SIZE 160, 010 OF oDlgSel COLORS 0, 16777215 PIXEL Picture "@!"
		@ 005, 220 SAY oSay5 PROMPT "Loja:" SIZE 030, 007 OF oDlgSel COLORS 0, 16777215 PIXEL
		@ 004, 235 MSGET oLoja VAR cLoja SIZE 020, 010 OF oDlgSel COLORS 0, 16777215 PIXEL Picture "@!"
	Else
		@ 004, 050 MSGET oTexto VAR cTexto SIZE 200, 010 OF oDlgSel COLORS 0, 16777215 PIXEL Picture "@!"
	Endif

	@ 005, 272 BUTTON oBut1 PROMPT "Localizar" SIZE 040, 010 OF oDlgSel ACTION Localiza(_cAlias,cTexto,cLoja) PIXEL

	//Browse
	oMark := MsSelect():New("TRBAUX","OK","",aCampos2,,@cMarca,{020,005,190,348})
	oMark:bMark 				:= {||MarcaIt()}
	oMark:oBrowse:LCANALLMARK 	:= .T.
	oMark:oBrowse:LHASMARK    	:= .T.
	oMark:oBrowse:bAllMark 		:= {||MarcaT()}

	@ 193, 005 SAY oSay2 PROMPT "Total de registros selecionados:" SIZE 200, 007 OF oDlgSel COLORS 0, 16777215 PIXEL
	@ 193, 090 SAY oSay3 PROMPT cValToChar(nContSel) SIZE 040, 007 OF oDlgSel COLORS 0, 16777215 PIXEL

	//Linha horizontal
	@ 203, 005 SAY oSay4 PROMPT Repl("_",342) SIZE 342, 007 OF oDlgSel COLORS CLR_GRAY, 16777215 PIXEL

	@ 213, 272 BUTTON oBut2 PROMPT "Confirmar" SIZE 040, 010 OF oDlgSel ACTION Conf001(_cAlias,1,_cSep,_lSelObr) PIXEL  //Conf001(1,_cSep)
	@ 213, 317 BUTTON oBut3 PROMPT "Fechar" SIZE 030, 010 OF oDlgSel ACTION Fech001(1) PIXEL

	ACTIVATE MSDIALOG oDlgSel CENTERED VALID lImpFechar //impede o usuario fechar a janela atraves do [X]

Return cRet

/***********************************************************/
//SubFunção da MultSel - Conf001
/***********************************************************/
Static Function Conf001(_cAlias,_nOri,_cSep,_lSelObr)

	Local lAux 	:= .F.
	Local nAux	:= 0

	Default _cSep := "/"

	If nContSel == 0 .AND. _lSelObr
		MsgInfo("Nenhum registro selecionado!!","Atenção")
		Return
	Endif

	TRBAUX->(dbGoTop())

	While TRBAUX->(!EOF())
		If TRBAUX->OK == "mk"
			If !lAux
				If _cAlias == "SA1"
					cRet += AllTrim(TRBAUX->COL1) + AllTrim(TRBAUX->COL2)
				Else
					cRet += AllTrim(TRBAUX->COL1)
				Endif
				lAux := .T.
			Else
				If _cAlias == "SA1"
					cRet += _cSep + AllTrim(TRBAUX->COL1) + AllTrim(TRBAUX->COL2)
				Else
					cRet += _cSep + AllTrim(TRBAUX->COL1)
				Endif
			Endif
			nAux += Len(TRBAUX->COL1)
		Endif

		If _nOri == 1
			If nAux >= 65
				cRet += Chr(13)+Chr(10)
				nAux := 0
			Endif
		Else
			If nAux >= 25
				cRet += Chr(13)+Chr(10)
				nAux := 0
			Endif
		Endif

		TRBAUX->(dbSkip())
	EndDo

	Fech001(2)

Return

/***********************************************************/
//SubFunção da MultSel - Fech001
/***********************************************************/
Static Function Fech001(_nOpc)

	lImpFechar := .T.

	If _nOpc == 1
		cRet := cInf
	Endif

	If Select("TRBAUX") > 0
		TRBAUX->(DbCloseArea())
	Endif

	//????????????????????????????????????
	//?Apagando arquivo temporario                                         ?
	//????????????????????????????????????

	FErase(cArqTrab + GetDBExtension())
	FErase(cArqTrab + OrdBagExt())

	oDlgSel:End()

Return

/***********************************************************/
//SubFunção da MultSel - LimpMemo
/***********************************************************/
User Function LimpMemo(_oObjeto,_cInf)

	_cInf := Space(200)
	_oObjeto:Refresh()

Return

/***********************************************************/
//SubFunção da MultSel - RetIn
/***********************************************************/
User Function RetIn(_cInf,_cSep)

	Local cRet := ""
	Local nI
	Local aAux := {}
	Default _cSep := "/"

	aAux := StrTokArr(_cInf,_cSep)

	For nI := 1 To Len(aAux)
		If nI <> Len(aAux)
			cRet += "'" + aAux[nI] + "'" + ","
		Else
			cRet += "'" + aAux[nI] + "'"
		Endif
	Next

Return cRet

/***********************************************************/
//SubFunção da MultSel - MarcaIt
/***********************************************************/
Static Function MarcaIt()

	If TRBAUX->OK == "mk"
		nContSel++
	Else
		--nContSel
	Endif

	oSay3:Refresh()

Return

/***********************************************************/
//SubFunção da MultSel - MarcaT
/***********************************************************/
Static Function MarcaT()

	Local lMarca 	:= .F.
	Local lNMarca 	:= .F.

	nContSel := 0

	TRBAUX->(dbGoTop())

	While TRBAUX->(!EOF())
		If TRBAUX->OK == "mk" .And. !lMarca
			RecLock("TRBAUX",.F.)
			TRBAUX->OK := "  "
			TRBAUX->(MsUnlock())
			lNMarca := .T.
		Else
			If !lNMarca
				RecLock("TRBAUX",.F.)
				TRBAUX->OK := "mk"
				TRBAUX->(MsUnlock())
				nContSel++
				lMarca := .T.
			Endif
		Endif

	    TRBAUX->(dbSkip())
	EndDo

	TRBAUX->(dbGoTop())

	oSay3:Refresh()

Return

/***********************************************************/
//SubFunção da MultSel - Localiza
/***********************************************************/
Static Function Localiza(_cAlias,_cTexto, _cLoja)

	If _cAlias == "SA1"

		If !Empty(_cTexto) .Or. !Empty(_cLoja)

			If !Empty(_cTexto) .And. !Empty(_cLoja)

				TRBAUX->(dbSkip())

				While TRBAUX->(!EOF())
					If AllTrim(_cTexto) $ TRBAUX->COL3 .And. AllTrim(_cLoja) $ TRBAUX->COL2
						Exit
					Endif

					TRBAUX->(dbSkip())
				EndDo

			ElseIf !Empty(_cTexto) .And. Empty(_cLoja)

				TRBAUX->(dbSkip())

				While TRBAUX->(!EOF())
					If AllTrim(_cTexto) $ TRBAUX->COL3
						Exit
					Endif

					TRBAUX->(dbSkip())
				EndDo

			Else
				TRBAUX->(dbSkip())

				While TRBAUX->(!EOF())
					If AllTrim(_cLoja) $ TRBAUX->COL2
						Exit
					Endif

					TRBAUX->(dbSkip())
				EndDo
			Endif

		Else
			TRBAUX->(dbGoTop())
		Endif
	Else

		If !Empty(_cTexto)

			TRBAUX->(dbSkip())

			While TRBAUX->(!EOF())
				If AllTrim(_cTexto) $ TRBAUX->COL2
					Exit
				Endif

				TRBAUX->(dbSkip())
			EndDo
		Else
			TRBAUX->(dbGoTop())
		Endif
	Endif

Return


//abre janela do tipo help, mostrando o problema e solução
User Function UHELP(cTitulo, cMsg, cSolu)

	Local oGetMsg
	Local cGetMsg := ""
	Local oGetSol
	Local cGetSol := ""
	Local oSButton1
	Private oHelp

	Default cTitulo := "HELP"
	Default cMsg := ""
	Default cSolu := ""

	cGetMsg := cMsg
	cGetSol := cSolu

	DEFINE MSDIALOG oHelp TITLE cTitulo FROM 000, 000  TO 300, 290 COLORS 0, 16777215 PIXEL

		@ 006, 010 SAY "Mensagem" SIZE 031, 007 OF oHelp COLORS 0, 16777215 PIXEL
	    @ 014, 010 GET oGetMsg VAR cGetMsg OF oHelp MULTILINE SIZE 125, 050 COLORS 0, 16777215 READONLY NOBORDER PIXEL

	    @ 066, 010 SAY "Solução" SIZE 025, 007 OF oHelp COLORS 0, 16777215 PIXEL
	    @ 074, 010 GET oGetSol VAR cGetSol OF oHelp MULTILINE SIZE 125, 050 COLORS 0, 16777215 READONLY NOBORDER PIXEL

	    DEFINE SBUTTON oSButton1 FROM 131, 108 TYPE 01 OF oHelp ACTION (oHelp:end()) ENABLE

	ACTIVATE MSDIALOG oHelp CENTERED ON INIT (oSButton1:SetFocus())

Return

//--------------------------------------------
// Funcao para transformar variavis em string
// muito util para conouts, ver arrays.
//--------------------------------------------
User Function toString(xValue)

	Local cRet, nI, cType

	cType := valType(xValue)

	DO CASE
		case cType == "C"
			return '"'+ xValue +'"'
		case cType == "N"
			return CvalToChar(xValue)
		case cType == "L"
			return if(xValue,"true","false")
		case cType == "D"
			return '"'+ DtoC(xValue) +'"'
		case cType == "U"
			return "null"
		case cType == "A"
			cRet := '['
			For nI := 1 to len(xValue)
				if(nI != 1)
					cRet += ', '
				endif
				cRet += U_toString(xValue[nI])
			Next
			return cRet + ']'
		case cType == "B"
			return '"Type Block"'
		case cType == "M"
			return '"Type Memo"'
		case cType =="O"
  			return '"Type Object"'
  		case cType =="H"
	  		return '"Type Object"'
	ENDCASE


return "invalid type"


//---------------------------------------------------------------
// remove caracteres especiais da string
// U_NoChrEsp("%TÉSE¨")
// retorno: *TESE*
//---------------------------------------------------------------
User Function NoChrEsp(cMyString, cSubst)

	//lista de caracteres aceitos pela funçao
	Local cCharOK := "ABCDEFGHIJKLMNOPRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 /-_.!?:;,@*()"+chr(13)+chr(10)
	Local nX := 0
	Local cChrAtu := ""

	Default cSubst := "*"

	//primeiro tira os acentos
	cMyString := FwNoAccent(cMyString)

	for nX := 1 to len(cMyString)

		cChrAtu := SubStr(cMyString,nX,1)

		if !(cChrAtu $ cCharOK) //se o caractere nao tem na string permitida
			cMyString := StrTran(cMyString, cChrAtu, cSubst)
		endif

	Next nX

Return cMyString

//---------------------------------------------------------------
//Função para retornar estrutura hierarquica do vendedor, apenas nives abaixo
//Parametros: 	cVend - Código do vendedor
//				nTipo - Define o tipo de retorno
//					1:retorna array - {cVend, cFilho, cNeto...}
//					2:retorna string para utilizar na em condiçao IN do select.
//					3:retorna array - {cVend, aFilhos}, em que aFilhos:{{cVend, aFilhos},...}
//---------------------------------------------------------------
User Function EstHiVen(cVend, nTipo)

	Local cQry := ""
	Local cAliasQry := GetNextAlias()
	Local aAux := {}
	Local xRet
	Local cRet := ""
	Default nTipo := 1

	xRet := iif(nTipo==2,"",{})

	if empty(cVend)
		Return xRet
	endif

	if nTipo == 1
		aadd(xRet, cVend)
	elseif nTipo == 2
		xRet := "'"+cVend+"'"
	endif

	//verifico se tem vendedores abaixo dele
	cQry := " SELECT A3_COD FROM "+RetSqlName("SA3")
	cQry += " WHERE D_E_L_E_T_ <> '*' "
	cQry += "   AND A3_FILIAL = '"+xFilial("SA3")+"' "
	cQry += "   AND A3_SUPER = '"+cVend+"' "

	If Select(cAliasQry) > 0
		(cAliasQry)->(dbCloseArea())
	EndIf

	cQry := ChangeQuery(cQry)
	dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), cAliasQry, .F., .T.)

	While (cAliasQry)->(!Eof())

		if nTipo == 1
			aAux := U_EstHiVen((cAliasQry)->A3_COD, nTipo)
			AEval( aAux, {|cAux| aadd(xRet, cAux)} )
		elseif nTipo == 2
			xRet += ","
			xRet += U_EstHiVen((cAliasQry)->A3_COD, nTipo)
		elseif nTipo == 3
			aadd(aAux, aClone(U_EstHiVen((cAliasQry)->A3_COD, nTipo)) )
		endif

		(cAliasQry)->(DbSkip())
	Enddo

	(cAliasQry)->(dbCloseArea())

	if nTipo == 3
		//preparo vetor de retorno
		xRet := {cVend, aClone(aAux)}
	endif

Return xRet

//--------------------------------------------
// Funcao para retornar a Picture
// GLT - Guilherme França
//--------------------------------------------
User Function PictFav()

Return( PICPES(M->A2_L_TPFAV) )


/*/{Protheus.doc} zAtuPerg
Função que atualiza o conteúdo de uma pergunta no X1_CNT01 / SXK / Profile
@author Atilio
@since 06/10/2016
@version 1.0
@type function
    @param cPergAux, characters, Código do grupo de Pergunta
    @param cParAux, characters, Código do parâmetro
    @param xConteud, variavel, Conteúdo do parâmetro
    @example u_zAtuPerg("LIBAT2", "MV_PAR01", "000001")
/*/
User Function zAtuPerg(cPergAux, cParAux, xConteud)
	Local aArea      := GetArea()
	Local nPosCont   := 8
	Local nPosPar    := 14
	Local nLinEncont := 0
	Local aPergAux   := {}
	Default xConteud := ''

    //Se não tiver pergunta, ou não tiver ordem
	If Empty(cPergAux) .Or. Empty(cParAux)
		Return
	EndIf

    //Chama a pergunta em memória
	Pergunte(cPergAux, .F., /*cTitle*/, /*lOnlyView*/, /*oDlg*/, /*lUseProf*/, @aPergAux)

    //Procura a posição do MV_PAR
	nLinEncont := aScan(aPergAux, {|x| Upper(Alltrim(x[nPosPar])) == Upper(cParAux) })

    //Se encontrou o parâmetro
	If nLinEncont > 0
        //Caracter
		If ValType(xConteud) == 'C'
			&(cParAux+" := '"+xConteud+"'")

        //Data
		ElseIf ValType(xConteud) == 'D'
			&(cParAux+" := sToD('"+dToS(xConteud)+"')")

        //Numérico ou Lógico
		ElseIf ValType(xConteud) == 'N' .Or. ValType(xConteud) == 'L'
			&(cParAux+" := "+cValToChar(xConteud)+"")

		EndIf

        //Chama a rotina para salvar os parâmetros
		__SaveParam(cPergAux, aPergAux)
	EndIf

	RestArea(aArea)
Return