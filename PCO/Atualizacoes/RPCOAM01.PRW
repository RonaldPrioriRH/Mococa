#INCLUDE 'Protheus.ch'
#INCLUDE 'Fwmvcdef.ch'
#INCLUDE "Rwmake.ch"
#INCLUDE "Topconn.ch"

/*/{Protheus.doc} RPCOAM01

Rotina para Importacao de GMR
@author Leandro Rodrigues
@since 30/06/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

User Function RPCOAM01()


	Local oBrowse

	Private aRotina
	Private cCadastro := 'Importação GMR'

	DbSelectArea("ZEO")

	oBrowse := FWmBrowse():New()
	oBrowse:SetAlias( 'ZEO' )
	oBrowse:SetDescription( cCadastro )
	
	oBrowse:Activate()

Return

//-------------------------------------------------------------------
// Definicao do Menu
//-------------------------------------------------------------------
Static Function MenuDef()

	aRotina := {}

	ADD OPTION aRotina TITLE 'Visualizar'      ACTION 'VIEWDEF.RPCOAM01' OPERATION 2 ACCESS 0
	ADD OPTION aRotina TITLE 'Incluir'         ACTION 'VIEWDEF.RPCOAM01' OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar'         ACTION 'VIEWDEF.RPCOAM01' OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE 'Excluir'         ACTION 'VIEWDEF.RPCOAM01' OPERATION 5 ACCESS 0
	ADD OPTION aRotina TITLE 'Copiar'          ACTION 'VIEWDEF.RPCOAM01' OPERATION 9 ACCESS 0
	ADD OPTION aRotina TITLE 'Importar'        ACTION 'U_PCO03IMP()' 	 OPERATION 3 ACCESS 0
	
Return aRotina

//-------------------------------------------------------------------
// Define Modelo de Dados
//-------------------------------------------------------------------
Static Function ModelDef()
  
Local oStruZEO	:= fwFormStruct(1, "ZEO", NIL, .F.)
Local oModel

// Cria a estrutura a ser usada no Modelo de Dados
oModel	:= mpFormModel():New("RPCOP003", /*bPreValidacao*/, /*bPosValidacao*/, /*bCommit*/, /*bCancel*/)

// Adiciona ao modelo uma estrutura de formulário de edição por campo
oModel:AddFields("ZEOMASTER", /*cOwner*/, oStruZEO)

// Liga o controle de nao repeticao de linha
oModel:SetPrimaryKey({"ZEO_FILIAL", "ZEO_AN0","ZEO_MES"})

// Adiciona a descricao do Modelo de Dados
oModel:SetDescription("Importacao GMR")
	
Return oModel
 

//-------------------------------------------------------------------
// Define camada de Visão
//-------------------------------------------------------------------
Static Function ViewDef()

Local oStruZEO	:= fwFormStruct(2, "ZEO")
Local oModel
Local oView

// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
oModel	:= fwLoadModel("RPCOAM01")

// Cria o objeto de View
oView	:= fwFormView():New()

// Define qual o Modelo de dados será utilizado
oView:SetModel(oModel)

//Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
oView:AddField("VIEW_ZEO", oStruZEO, "ZEOMASTER")

// Criar "box" horizontal para receber algum elemento da view
oView:CreateHorizontalBox("TELA", 100)

// Relaciona o ID da View com o "box" para exibicao
oView:SetOwnerView("VIEW_ZEO", "TELA")

// Liga a identificacao do componente
oView:EnableTitleView("VIEW_ZEO", "Importação GMR")


Return oView

//-------------------------------------------------------------------
// Faz importação dos dados de metas por arquivo CSV
//-------------------------------------------------------------------
User Function PCO03IMP()

	Local aMensagem := {}
	Local aBotoes   := {}
	Local bSair     := .T.
    Local bOk 		:= {|| iif(ValidImp(),(oDlgFil:End(),Processa({|| ProcImp() })),) }  
	Local bCancel 	:= {|| oDlgFil:End() }    
	
    Static oDlgFil                    
	Private cTitulo := "Importação de GMR"
	Private oArq
	Private cArq	:= ""
	Private oTipo	
	Private nTipo	:= 1
	Private aTipos	:= {}
		
	Aadd( aMensagem, OemToAnsi("Este programa tem como objetivo importar GMR através de arquivo textos *.CSV ."))
	Aadd( aMensagem, OemToAnsi("    "))
	Aadd( aMensagem, OemToAnsi("Este arquivo deverá ser separado por ponto-e-virgula e o primeiro registro conterá os nomes dos campos a serem importados."))
	Aadd( aMensagem, OemToAnsi("    "))
	
	AAdd( aBotoes, { 19, .T., { || FechaBatch(), bSair     := .F. } } )
	AAdd( aBotoes, { 02, .T., { || FechaBatch(), bSair     := .T. } } )
	
	FormBatch( cTitulo, aMensagem, aBotoes, , 260,700  )
	
	if !bSair
		
		oDlgFil := TDialog():New(0,0,260,700,cTitulo,,,,,,,,,.T.)
			
			TGroup():New(10,10,100,340,'',oDlgFil,,,.T.)
			
			TSay():New( 20,20,{|| "Selecione o Arquivo:" }, oDlgFil,,,,,,.T.,CLR_BLACK,,100,9 )
			oArq := TGet():New( 30, 20, {|u| iif( PCount()==0,cArq,cArq:= u) },oDlgFil,180,9,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .F.},.F.,.F.,/*bChange*/,.F.,.F.,,"cArq",,,,.T.,.F.)
			SButton():New( 30, 202, 14, {|| DoSelFile() } ,oDlgFil,.T.,,) //avançar
			
			TSay():New( 60,20,{|| "Importação GMR:" }, oDlgFil,,,,,,.T.,CLR_BLACK,,100,9 )
	//		aadd(aTipos, "Adicionar registros do arquivo mesclando com dados ja existentes.")
			aadd(aTipos, "Esta Importacao irá apagar os dados ja existentes, e incluir registros do arquivo.")
			oTipo := TRadMenu():New(70,20,aTipos,{|u| iif( PCount()==0,nTipo,nTipo:= u) },oDlgFil,,,,,,,,300,12,,,,.T.)
			
			SButton():New( 110,275,19,bOk,oDlgFil,.T.,,) //avançar
			SButton():New( 110,305,02,bCancel,oDlgFil,.T.,,) //cancelar
			
			oDlgFil:lCentered := .T.
		oDlgFil:Activate()
		
	endif

Return

//-------------------------------------------------------------------
// Busca arquivo para importação e valida-o
//-------------------------------------------------------------------
Static Function DoSelFile()

	
	Local cMaskFile := "Arquivos csv (*.csv) |*.CSV | "
	
	cArq := cGetFile(cMaskFile, OemToAnsi("Selecione o arquivo..."), 0, iif(empty(cArq),'C:\',cArq), .F., GETF_LOCALFLOPPY + GETF_LOCALHARD + GETF_NETWORKDRIVE ,.T., .T.)
	
	if empty(cArq)
		cArq := space(300)
	elseif Right(upper(alltrim(cArq)),3) != "CSV"
		MsgStop("Selecione um arquivo do tipo CSV!","ATENCAO")
		cArq := space(300)
	endif
	
	oArq:Refresh()
	
Return

//-------------------------------------------------------------------
// Processa a importação dos dados
//-------------------------------------------------------------------
Static Function ValidImp()

	Local lRet := .T.
	
	if empty(cArq)
		MsgStop("Informe um arquivo para ser importado!","ATENCAO")
		lRet := .F.	
	elseif !File(cArq)
		MsgStop("O arquivo " +cArq + " não foi encontrado. Selecione um arquivo válido!","ATENCAO")
		lRet := .F.
	elseif empty(nTipo)
		MsgStop("Selecione o tipo de importação!","ATENCAO")
		lRet := .F.
	EndIf	
	
Return lRet

//-------------------------------------------------------------------
// Processa a importação dos dados
//-------------------------------------------------------------------
Static Function ProcImp()

	Local cLinha    := ''
	Local lPrim     := .T.
	Local aCampos   := {"ZEO_FILIAL","ZEO_ANO","ZEO_MES","ZEO_MERC","ZEO_PRODUT","ZEO_UFCLI"	,;
						"ZEO_CLIENT","ZEO_LOJA","ZEO_VEND","ZEO_CODSEG","ZEO_VLRFAT","ZEO_QTDSKU","ZEO_ICMS",;
						"ZEO_ICMSOU","ZEO_PIS","ZEO_COFINS","ZEO_VLRDEV","ZEO_COMIS","ZEO_VERBA",;
						"ZEO_DESCTT","ZEO_FRETE","ZEO_CUSTOT","ZEO_ICMSST","ZEO_VBC"}
	Local aTipos	:= {}
	Local aCpArq	:= {}
	Local aDados    := {}
	Local aExcluir	:= {}
	Local aLog		:= {}
	Local nCampos   := 0
	Local cSQL      := ''
	Local nI 		:= 0
	Local cTipo     := ''
	Local cItem		:= ''
	Local lProc		:= .T.	
	Local aChaves	:= {}
	Local nPosFil	:= 0
	Local cFilOri	:= cFilAnt 
	Local aArea		:= GetArea()
		
	If !File(cArq)
		MsgStop("O arquivo " + cArq + " não foi encontrado. A importação será abortada!","ATENCAO")
		Return
	EndIf
	
	FT_FUSE(cArq)
	FT_FGOTOP()
	cLinha    := FT_FREADLN()
	aCpArq	  := Separa(cLinha,";",.T.)
	cTipo     := SUBSTR(aCpArq[1],1,3)

	IF !(cTIPO == 'ZEO')
		MsgAlert('Arquivo com sintaxe incorreta! Primeira linha deve conter o nome dos campos da tabela ZEO!')
		Return
	Endif
		
	dbSelectArea("SX3")
	DbSetOrder(2)
	For nI := 1 To Len(aCpArq)
		IF cTipo <> SUBSTR(aCpArq[nI],1,3)
			MsgAlert('Todos os campos devem pertencer a tabela ZEO!')
			Return
		ENDIF
		IF !SX3->(dbSeek(Alltrim(aCpArq[nI])))
			MsgAlert('Campo não encontrado na tabela: '+aCpArq[nI]+' !')
			Return
		ELSEIF (SX3->X3_VISUAL $ ('V') ) .OR. (SX3->X3_CONTEXT == "V"  )
			MsgAlert('Campo marcado na tabela como visual: '+aCpArq[nI]+' ! Não necessita estar no arquivo de importação!')
			Return
		ELSE
			aadd(aTipos, SX3->X3_TIPO) //gravo o tipo do campo 
		ENDIF
	Next nI
	
	//lendo dados do arquivo, e preenchendo no vetor aDados
	ProcRegua(FT_FLASTREC())
	FT_FGOTOP()
	nI := 1
	While !FT_FEOF()
		IncProc("Lendo arquivo texto... linha: " + cValToChar(nI) )
		cLinha := FT_FREADLN()
		if !empty(cLinha)
			If lPrim
				aCampos := Separa(Upper(cLinha),";",.T.)
				lPrim := .F.
			Else
				AADD(aDados,Separa(cLinha,";",.T.))
			EndIf
		endif
		nI++
		FT_FSKIP()
	EndDo
	
	FT_FUSE() //fecha arquivo
	
	ProcRegua(Len(aDados))
	For nI:=1 to  Len(aDados)
			
		cLinha := 'Linha ' + cValToChar(nI+1) + ' >> '	
		IncProc("Validando dados... linha: " + cValToChar(nI+1))
		
		if len(aCampos) <> len(aDados[nI])		
			lProc := .F.
			cLog := 'Linha não está estruturada corretamente.'
			aadd(aLog, cLinha+cLog)
		endif
		
		If lProc
			For nCampos := 1 To Len(aCampos)
				
				aDados[nI][nCampos] := AjustaVal(aDados[nI][nCampos], aTipos[nCampos], aCampos[nCampos] )
				
				//pego posicao da filial
				nPosFil := aScan(aCampos,"ZEO_FILIAL")
					
				If cFilAnt != StrZero(Val(aDados[nI][nPosFil]),TamSx3("ZEO_FILIAL")[1])
					cFilAnt := StrZero(Val(aDados[nI][nPosFil]),TamSx3("ZEO_FILIAL")[1])
				Endif
							
				if nCampos == aScan(aCampos,"ZEO_VEND")
					
					aDados[nI][nCampos] := StrZero(Val(aDados[nI][nCampos]),TamSx3("ZEO_VEND")[1])
											
					if empty(Posicione("SA3",1,xFilial("SA3")+aDados[nI][nCampos],"A3_COD"))
						cLog := 'Inconsistência: Código Vendedor não cadastrado ['+aDados[nI][nCampos]+'] !'
						aadd(aLog, cLinha+cLog)
						lProc := .F.
					endif
				elseif nCampos == aScan(aCampos,"ZEO_ANO")
					//compatibilizando ano
					aDados[nI][nCampos] := StrZero(val(aDados[nI][nCampos]),4)
					if aDados[nI][nCampos] == "0000"
						cLog := 'Inconsistência: Ano informado inválido!'
						aadd(aLog, cLinha+cLog)
						lProc := .F.
					endif
				elseif nCampos == aScan(aCampos,"ZEO_MES")
				
					aDados[nI][nCampos] := StrZero(Val(aDados[nI][nCampos]),2)
				
					//compatibilizando ano
					aDados[nI][nCampos] := StrZero(val(aDados[nI][nCampos]),2)
					if aDados[nI][nCampos] == "00" .OR. aDados[nI][nCampos] > "12"
						cLog := 'Inconsistência: Mes informado inválido!'
						aadd(aLog, cLinha+cLog)
						lProc := .F.
					endif
				elseif nCampos == aScan(aCampos,"ZEO_PRODUT")
								
					if !empty(aDados[nI][nCampos])
						if empty(Posicione("SB1",1,xFilial("SB1")+aDados[nI][nCampos],"B1_COD"))
							cLog := 'Inconsistência: Código Produto não cadastrado ['+aDados[nI][nCampos]+'] !'
							aadd(aLog, cLinha+cLog)
							lProc := .F.
						endif
					endif
				elseif nCampos == aScan(aCampos,"ZEO_CODSEG") 
				
				//	aDados[nI][nCampos] := StrZero(Val(aDados[nI][nCampos]),TamSx3("ZEO_CODSEG")[1])
					
					if !empty(aDados[nI][nCampos])
						if empty(Posicione("AOV",1,xFilial("AOV")+aDados[nI][nCampos],"AOV_CODSEG"))
							cLog := 'Inconsistência: Código Segmento não cadastrado ['+aDados[nI][nCampos]+'] !'
							aadd(aLog, cLinha+cLog)
							lProc := .F.
						endif
					endif
				elseif nCampos == aScan(aCampos,"ZEO_UFCLI") 
					if !empty(aDados[nI][nCampos])
					
							if empty(Posicione("SX5",1,xFilial("SX5")+"12"+aDados[nI][nCampos],"X5_CHAVE"))
								
								cLog := 'Inconsistência: Codigo UF Incorreta[' +aDados[nI][nCampos] + '] !'
								aadd(aLog, cLinha+cLog)
								lProc := .F.
							Endif
					endif
				/*elseif nCampos == aScan(aCampos,"ZEO_VLRFAT")
					if empty(aDados[nI][nCampos])
						cLog := 'Inconsistência: Informe o valor Faturado[ZEO_VLRFAT] !'
						aadd(aLog, cLinha+cLog)
						lProc := .F.
					endif
					
				elseif nCampos == aScan(aCampos,"ZEO_QTDSKU")
					if empty(aDados[nI][nCampos])
						cLog := 'Inconsistência: Informe a Quantidade SKU[ZEO_QTDSKU] !'
						aadd(aLog, cLinha+cLog)
						lProc := .F.
					endif*/

				endif
							
			Next nCampos
									
		endif				
	Next nI
	
	//Volto para filial original
	cFilAnt := cFilOri
	
	//inicia gravação dos dados
	if lProc
		
		DbSelectArea("ZEO")
			
		cLog := 'Iniciando Gravações dos Dados...'
		aadd(aLog, cLog)
		
		BeginTran()
		
		//processa exclusões
		if nTipo == 1//se exclui pra depois importar
			
			cMsgExcl := ""
			For nI:=1 to  Len(aDados)
				if aScan(aExcluir, aDados[nI][aScan(aCampos,"ZEO_FILIAL")]+aDados[nI][aScan(aCampos,"ZEO_ANO")]+aDados[nI][aScan(aCampos,"ZEO_MES")]) == 0 //vend+ano+mes
					aadd(aExcluir, aDados[nI][aScan(aCampos,"ZEO_FILIAL")]+aDados[nI][aScan(aCampos,"ZEO_ANO")]+aDados[nI][aScan(aCampos,"ZEO_MES")])
					cMsgExcl += "FILIAL.: ["+aDados[nI][aScan(aCampos,"ZEO_FILIAL")]+"], ANO.: ["+aDados[nI][aScan(aCampos,"ZEO_ANO")]+"], MES.: ["+aDados[nI][aScan(aCampos,"ZEO_MES")]+"]" + chr(13) + chr(10)
				endif
			next nI
			
			if !empty(cMsgExcl)
				if MsgYesNo("Confirma exclusão dos registros com as chaves: " + chr(13) + chr(10) + cMsgExcl)
					
					cLog := 'Buscando Registros para exclusão...'
					aadd(aLog, cLog)
										
					cSQL := "SELECT R_E_C_N_O_ FROM " + RetSqlName("ZEO")+ " WHERE D_E_L_E_T_ <> '*' AND ZEO_FILIAL||ZEO_ANO||ZEO_MES IN ("
					For nI:=1 to  Len(aExcluir)
						if nI > 1
							cSQL += ","
						endif
						cSQL += "'" + aExcluir[nI] + "'"
					next nI
					cSQL += ")"
					
					If Select("QRYEXCL") > 0
						QRYEXCL->(DbCloseArea())
					EndIf
					
					cSQL := ChangeQuery(cSQL)
					TcQuery cSQL New Alias "QRYEXCL" // Cria uma nova area com o resultado do query
					
					cLog := 'Excluindo Registros...'
					aadd(aLog, cLog)
					while !QRYEXCL->( Eof() )
						
						ZEO->(DbGoTo(QRYEXCL->R_E_C_N_O_))
						if Reclock("ZEO", .F.)
							ZEO->(DbDelete())						
							ZEO->(MsUnlock())
							
							cLog := 'EXCLUIDO >> Recno: ' + cValtoChar(QRYEXCL->R_E_C_N_O_) + " Indice 1: " + ZEO->(&(IndexKey(1)))
							aadd(aLog, cLog)
						else
							cLog := 'Falha ao tentar excluir registros! Processo abortado!'
							aadd(aLog, cLog)
							lProc := .F.
							EXIT
						endif
						QRYEXCL->(DbSkip())
				  	enddo
				else
					cLog := 'Exclusão! Abortado pelo Usuário!'
					aadd(aLog, cLog)
					lProc := .F.				
				endif
			endif
		endif
		
		//processa gravações
		if lProc
		
			ProcRegua(Len(aDados))
			For nI:=1 to  Len(aDados)				
				
				IncProc("Processando Gravações...")	
				    cFilOld:=cFilAnt			
				    cFilant:=aDados[nI][aScan(aCampos,"ZEO_FILIAL" )]	
					Reclock("ZEO", .T.) //inclui
						ZEO->ZEO_FILIAL := xFilial("ZEO")
						//ZEO->ZEO_FILORI	:= aDados[nI][aScan(aCampos,"ZEO_FILIAL" )]					
						ZEO->ZEO_MERC	:= aDados[nI][aScan(aCampos,"ZEO_MERC"	 )]
						ZEO->ZEO_ANO	:= aDados[nI][aScan(aCampos,"ZEO_ANO"	 )]
						ZEO->ZEO_MES	:= aDados[nI][aScan(aCampos,"ZEO_MES"	 )]
						ZEO->ZEO_PRODUT	:= aDados[nI][aScan(aCampos,"ZEO_PRODUT" )]
						ZEO->ZEO_CLIENT	:= aDados[nI][aScan(aCampos,"ZEO_CLIENT" )]
						ZEO->ZEO_LOJA	:= aDados[nI][aScan(aCampos,"ZEO_LOJA" )]
						ZEO->ZEO_UFCLI	:= aDados[nI][aScan(aCampos,"ZEO_UFCLI" )]
						ZEO->ZEO_VEND	:= aDados[nI][aScan(aCampos,"ZEO_VEND"	 )]
						ZEO->ZEO_CODSEG	:= aDados[nI][aScan(aCampos,"ZEO_CODSEG" )]
						ZEO->ZEO_VLRFAT	:= aDados[nI][aScan(aCampos,"ZEO_VLRFAT" )]
						ZEO->ZEO_QTDSKU	:= aDados[nI][aScan(aCampos,"ZEO_QTDSKU" )]
						ZEO->ZEO_ICMS	:= aDados[nI][aScan(aCampos,"ZEO_ICMS"   )]
						ZEO->ZEO_ICMSOU	:= aDados[nI][aScan(aCampos,"ZEO_ICMSOU" )]
						ZEO->ZEO_PIS	:= aDados[nI][aScan(aCampos,"ZEO_PIS" 	 )]
						ZEO->ZEO_COFINS	:= aDados[nI][aScan(aCampos,"ZEO_COFINS" )]
						ZEO->ZEO_VLRDEV	:= aDados[nI][aScan(aCampos,"ZEO_VLRDEV" )]
						ZEO->ZEO_COMIS	:= aDados[nI][aScan(aCampos,"ZEO_COMIS" )]
						ZEO->ZEO_VERBA	:= aDados[nI][aScan(aCampos,"ZEO_VERBA"  )]
						ZEO->ZEO_DESCTT	:= aDados[nI][aScan(aCampos,"ZEO_DESCTT" )]
						ZEO->ZEO_FRETE	:= aDados[nI][aScan(aCampos,"ZEO_FRETE"  )]
						ZEO->ZEO_CUSTOT	:= aDados[nI][aScan(aCampos,"ZEO_CUSTOT" )]
						ZEO->ZEO_ICMSST	:= aDados[nI][aScan(aCampos,"ZEO_ICMSST" )]
						
					ZEO->(MsUnlock())	
					cFilAnt:=cFilOld							
			Next nI
			
			cLog := 'Processo finalizado com sucesso!'
			aadd(aLog, cLog)
			EndTran() 
		else
			cLog := 'Desfazendo gravações realizadas... OK'
			aadd(aLog, cLog)
			DisarmTransaction()
		endif
		
	endif
	
	if lProc
		if MsgYesNo('Arquivo importado com sucesso! Deseja ver arquivo de LOG?')
			ShowLog(aLog)
		endif
	else
		if MsgYesNo('Arquivo não processado por erros! Deseja ver arquivo de LOG?')
			ShowLog(aLog)
		endif
	endif
	
	
RestArea(aArea)

Return 

//-------------------------------------------------------------------
// Faz ajustedo valor de acordo com tipo
//-------------------------------------------------------------------
Static Function AjustaVal(xValor, cTipo, cCampo)

	if cTipo == "C"
		xValor := PadR(xValor, TamSx3(cCampo)[1])
	elseif cTipo == "N"
		xValor := Val(StrTran(StrTran(xValor,".",""),",","."))
		
		if xValor < 0
			xValor := xValor * (-1)
		Endif
	endif
	
Return xValor

//-------------------------------------------------------------------
// Relatório de impressão de log
//-------------------------------------------------------------------
Static Function ShowLog(aLog)

	Local oReport := TReport():New("RPCOAM01","Log de Importação GMR",/*SX1*/,{|oReport| PrintReport(oReport, aLog)},"Este relatorio ira imprimir a relacao de logs de importação GMR.") 
	Local oSection := TRSection():New(oReport,OemToAnsi("Log de Importação Arquivos"),{"TMP"})	
	
	TRCell():New(oSection,"ITEMLOG"	,"TMP", "Descricao do Log", ,200)
	
	//oReport:PrintDialog()
	oReport:Print()	

Return	

//-------------------------------------------------------------------
// Relatório de impressão de log
//-------------------------------------------------------------------	
Static Function PrintReport(oReport, aLog)

	Local oSection 	:= oReport:Section(1)
	Local nX 		:= 1
	
	oReport:SetMeter(len(aLog))
	
	oSection:Init()
	
	For nX := 1 to len(aLog)
		
		If oReport:Cancel()
			Exit
		EndIf
		
		oSection:Cell("ITEMLOG"):SetValue(aLog[nX])
		oSection:PrintLine()
		
		oReport:IncMeter()
	Next nX
	
	oSection:Finish()

Return


