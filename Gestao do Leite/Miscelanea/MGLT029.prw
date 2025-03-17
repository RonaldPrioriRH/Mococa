
#INCLUDE "PROTHEUS.ch"
#INCLUDE "RWMAKE.ch"
#INCLUDE "TOPCONN.ch"
#INCLUDE "MSGRAPHI.ch"
      
#DEFINE _ENTER CHR(13)+CHR(10)
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ MGLT029  ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para realizar o Acerto dos Eventos Avulsos.         ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ 									                  		  ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT029()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function MGLT029()

	Local _bProcess	:= {|oSelf| ActEvento(oSelf)}
	Local cTextadmio	
	Private _cPerg		:= "MGLT029"         
	Private cGLTalias := "GLT"    
	Private cHoraInicial 	:= TIME()
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Chama funcao para criar os parametros caso nao existam.             ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	AjustaSX1()
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Chama a tela para preenchimento dos parametros.                     ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If !Pergunte(_cPerg,.T.)
		Return()
	EndIf
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Verifica se o usuario tem permissao para executar a rotina de Eventos.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If Posicione("ZLU",1,xFilial("ZLU")+Padr(cUserName,25),"ZLU_GEREVE") != "S"
		xMagHelpFis("Permissao","Voce nao tem permissao para acessar essa rotina!","Comunique ao Suporte!")
		Return
	EndIf
	
	
	If LastDay(dDatabase) != dDataBase
		xMagHelpFis("NAO CONFORMIDADE 02 - DATABASE INVALIDA",;
		"A Data do sistema("+DTOC(dDataBase)+") nao esta no ultimo dia do mes!",;
		"A Data deve ser alterada para "+DTOC(LastDay(dDatabase))+" , para poder continuar a rotina." ) 
		Return
	EndIf 
	
	cTexto := "Esta rotina tem o objetivo de efetuar o Acerto dos Eventos dos Produtores,"+_ENTER
	cTexto += "por favor preencha os parÂmetros da rotina. "+_ENTER
	cTexto += " "+_ENTER
		
	_oTProces := tNewProcess():New("MGLT029","Acerto dos Eventos",_bProcess,cTexto,_cPerg)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ ActEvento³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para realizar o Acerto dos Eventos Avulsos.         ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ 									                  		  ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT029()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function ActEvento(oObj)

	Local cFunc    := "1"
	Local cArqTmp  := cGLTalias+cFunc
	Local _aArea   := {}
	Local _aAlias  := {}
	Local nTotReg  := 0
	Local nCont    := 1
	Local nVlrEvto := 0
	Local nJurTit  := 0
	Local nVlrBx   := 0
	Local cParc    := StrZero(1,TamSx3("E2_PARCELA")[1]) //Parcela do titulo do evento
	
	//Variaveis Query
	Local _cDia			:= mv_par03
	Local _cMes      	:= SubStr(DtoS( ADDMes(dDataBase,1) ),5,2)
	Local _cAno      	:= SubStr(DtoS( ADDMes(dDataBase,1) ),1,4)
	Local _cVencto  	:= _cAno+_cMes+_cDia //Dia de vencimento dos titulos
	
	Local _cTipo 
	Local _lRetFun    
//	Local _nCont := 0
	Local _nContSE1	:= VAL(U_NextSE1())
	Local _nContSE2	:= VAL(U_NextSE2())
		
	Private _cProdDe  	:= mv_par01
	Private _cProdAte 	:= mv_par02 
	
	Private _cFornLei	:= MV_PAR04   
	
	Private _nReg
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³  Salva a area. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL8","ZLF","SF1","SD1","SX1"})
	
	oObj:SaveLog("INICIO - Acerto Eventos")
	
	MsgRun("Aguarde.... Filtrando Cooperados...",,{||CursorWait(), MGLTQRY(cFunc), CursorArrow()})
	
	nTotReg := _nReg 
	
	oObj:SetRegua1(_nReg)
	
	dbSelectArea(cArqTmp)
	dbGoTop()
	
	BEGIN TRANSACTION
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Percorre eventos automaticos encontrados. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ	
	While (cArqTmp)->(!Eof())
	
		DbSelectArea("SA2")
		SA2->(DbSetOrder(1))
		SA2->(DbSeek(xFilial("SA2")+(cArqTmp)->A2_COD+(cArqTmp)->A2_LOJA))  
		               
		If oObj <> Nil
			oObj:IncRegua1("COOPERADO - "+AllTrim((cArqTmp)->A2_COD ) )
		EndIf   
		
		cFunc    := "2"
		cArqTmp2  := cGLTalias+cFunc	
		MsgRun("Aguarde.... Filtrando dados dos Eventos...",,{||CursorWait(), MGLTQRY(cFunc), CursorArrow()})
     		          
		nCont := 1
		nTotReg := _nReg    
				 
		oObj:SetRegua2(nTotReg)
	
		dbSelectArea(cArqTmp2)
		dbGoTop()
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Percorre eventos automaticos encontrados. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ	
		While (cArqTmp2)->(!Eof())
			
			If oObj <> Nil
				oObj:IncRegua2("Eventos - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
				nCont++
			EndIf
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Posiciona no cadastro de Eventos. ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			dbSelectArea("ZL8")
			ZL8->(dbSetOrder(1))
			ZL8->(dbSeek(xFilial("ZL8") + (cArqTmp2)->ZL8_COD))    
			
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Verifica se a condicao do Evento eh satisfatoria.  ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			If &(ZL8->ZL8_CONDIC)
		
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Busca o valor a ser gravado no Evento e no titulo. ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				nVlrEvto := &(ZL8->ZL8_FORMUL)
				nVlrEvto := Round(nVlrEvto,2) //Arredondo pra nao dar erro na baixa do SE2
				
				If nVlrEvto > 0  
				
//						_nCont++
//					    cNroTit := SubStr(DTOS(dDatabase),3,4)+StrZero(_nCont,5)
				
						If ZL8->ZL8_DEBCRE = 'D'
//							cNroTit := U_NextSE2(ZL8->ZL8_PREFIX)	
						    cNroTit := SubStr(DTOS(dDatabase),3,4)+StrZero(_nContSE1,5)
						    _nContSE1++
							_lRetFun := U_IncluSE1(ZL8->ZL8_PREFIX,cNroTit,cParc,"NF ",(cArqTmp)->A2_COD,(cArqTmp)->A2_LOJA,ZL8->ZL8_NATPRD,dDataBase,STOD(_cVencto),nVlrEvto,0,0,;
										"",ZL8->ZL8_DESCRI,0,ZL8->ZL8_COD,"MGLT029",XFILIAL("ZP3")+(cArqTmp)->A2_COD+(cArqTmp)->A2_LOJA+ZL8->ZL8_PROGRA+SUBSTR(DTOS(DDATABASE),1,6))
						Else
//							cNroTit := U_NextSE1(ZL8->ZL8_PREFIX)	
						    cNroTit := SubStr(DTOS(dDatabase),3,4)+StrZero(_nContSE2,5)
						    _nContSE2++
							_lRetFun := U_IncluSE2(ZL8->ZL8_PREFIX,cNroTit,cParc,"NF ",(cArqTmp)->A2_COD,(cArqTmp)->A2_LOJA,ZL8->ZL8_NATPRD,dDataBase,STOD(_cVencto),nVlrEvto,0,0,;
										"",ZL8->ZL8_DESCRI,0,ZL8->ZL8_COD,"MGLT029",XFILIAL("ZP3")+(cArqTmp)->A2_COD+(cArqTmp)->A2_LOJA+ZL8->ZL8_PROGRA+SUBSTR(DTOS(DDATABASE),1,6))
						EndIf
							
						If !_lRetFun
							DisarmTransaction()
							Return
						EndIf	
						
				EndIf
			EndIf
			
			(cArqTmp2)->(dbSkip())
		EndDo
		
	
		dbSelectArea(cArqTmp2)
		dbCloseArea(cArqTmp2)
		
		(cArqTmp)->(dbSkip())
		
	EndDo
	
	END TRANSACTION
		
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Atualiza o log de processamento   ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	oObj:SaveLog("FIM - Acerto Evento ")
		
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Apaga arquivo temporario.         ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	dbSelectArea(cArqTmp)
	dbCloseArea(cArqTmp)
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Restaura a area. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	CtrlArea(2,_aArea,_aAlias)   
	
	MsgInfo("Tempo gasto no processamento:"+ELAPTIME(cHoraInicial,TIME()))

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³MGLT5QRY  ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para executar querys e gerar arquivo temporario com ³±±
±±³          ³ o resultado da query.                                      ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpC01 - Caracter que identifica a query a ser chamada de  ³±±
±±³          ³          acordo com a rotina de Acerto em execucao.        ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT009()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function MGLTQRY(cOpc,cPrefSE2)
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Declaracao de variavies locais. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Local cQry   := ""
	Local lSqlOk := .T.
	                                                                           
	Local _cPLEITE := U_GETRELA1("1","ZL1_PLEITE") //#LETRAS
	
	DEFAULT cPrefSE2 := ""
	
	Do Case
	
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Filtra os produtores 	          ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ	
		Case cOpc == "1"
			cQry := "SELECT A2_COD,A2_LOJA FROM " + RetSqlName("SA2")
			cQry += " WHERE D_E_L_E_T_ = ' ' "
			cQry += " AND A2_FILIAL = '" + xFilial("SA2") + "'"
			cQry += " AND A2_C_TPFOR = 'P'" //Produtor Cooperado
			cQry += " AND A2_COD  BETWEEN '" + _cProdDe +"' AND '"+ _cProdAte +"'"   
			IF _cFornLei == 1
				cQry += " AND A2_C_PROD  LIKE '%04%'"
			ELSEIF _cFornLei == 2
				cQry += " AND NOT (A2_C_PROD  LIKE '%04%')"
			ENDIF
			cQry += " ORDER BY A2_COD"
			TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
			dbSelectArea(cGLTalias+cOpc)
			Count To _nReg
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Acerto Eventos Automatico.        ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		Case cOpc == "2"
			cQry := "SELECT ZL8_COD,ZL8_NATPRD,ZL8_DEBCRE FROM " + RetSqlName("ZL8")
			cQry += " WHERE D_E_L_E_T_ = ' ' "
			cQry += " AND ZL8_FILIAL = '" + xFilial("ZL8") + "'"
			cQry += " AND ZL8_TPEVEN = 'A'" //Evento Automatico
			//cQry += " AND ZL8_DEBCRE = 'D'" //Evento de Debito
			cQry += " AND ZL8_PREFIX <> ' '"//Prefixo diferente de vazio
			cQry += " ORDER BY ZL8_PRIORI"
			TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
			dbSelectArea(cGLTalias+cOpc)
			Count To _nReg
	EndCase

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ CtrlArea º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Static Function auxiliar no GetArea e ResArea retornando   º±±
±±º          ³ o ponteiro nos Aliases descritos na chamada da Funcao.     º±±
±±º          ³ Exemplo:                                                   º±±
±±º          ³ Local _aArea  := {} // Array que contera o GetArea         º±±
±±º          ³ Local _aAlias := {} // Array que contera o                 º±±
±±º          ³                     // Alias(), IndexOrd(), Recno()        º±±
±±º          ³                                                            º±±
±±º          ³ // Chama a Funcao como GetArea                             º±±
±±º          ³ P_CtrlArea(1,@_aArea,@_aAlias,{"SL1","SL2","SL4"})         º±±
±±º          ³                                                            º±±
±±º          ³ // Chama a Funcao como RestArea                            º±±
±±º          ³ P_CtrlArea(2,_aArea,_aAlias)                               º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ nTipo   = 1=GetArea / 2=RestArea                           º±±
±±º          ³ _aArea  = Array passado por referencia que contera GetArea º±±
±±º          ³ _aAlias = Array passado por referencia que contera         º±±
±±º          ³           {Alias(), IndexOrd(), Recno()}                   º±±
±±º          ³ _aArqs  = Array com Aliases que se deseja Salvar o GetArea º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ GENERICO                                                   º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function CtrlArea(_nTipo,_aArea,_aAlias,_aArqs)
	
	Local _nN := 0
	
	// Tipo 1 = GetArea()
	If _nTipo == 1
		_aArea := GetArea()
		For _nN := 1 To Len(_aArqs)
			dbSelectArea(_aArqs[_nN])
			AAdd(_aAlias,{ _aArqs[_nN], IndexOrd(), Recno() })
		Next
		// Tipo 2 = RestArea()
	Else
		For _nN := 1 To Len(_aAlias)
			dbSelectArea(_aAlias[_nN,1])
			dbSetOrder(_aAlias[_nN,2])
			DbGoto(_aAlias[_nN,3])
		Next
		RestArea(_aArea)
	EndIf
	
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºFuncao    ³ AjustaSX1º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Funcao para criacao das perguntas caso elas nao existam.   º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa principal                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function AjustaSX1()
	
	Local aHelpPor := {}
	Local aHelpSpa := {}
	Local aHelpEng := {}
	
	aHelpPor := {}
	aHelpSpa := {}
	aHelpEng := {}
	Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
	Aadd( aHelpPor, 'considerado no Acerto. Vc pode informar')
	Aadd( aHelpPor, 'de " " a ZZZZZZ, para considerar todos ')
	Aadd( aHelpPor, 'ou entao do P00001 ao P00001 para      ')
	Aadd( aHelpPor, 'considerar apenas este produtor.       ')
	Aadd( aHelpSpa, 'Informe o Codigo do Produtor para ser  ')
	Aadd( aHelpSpa, 'considerado no Acerto. Vc pode informar')
	Aadd( aHelpSpa, 'de " " a ZZZZZZ, para considerar todos ')
	Aadd( aHelpSpa, 'ou entao do P00001 ao P00001 para      ')
	Aadd( aHelpSpa, 'considerar apenas este produtor.       ')
	Aadd( aHelpEng, 'Informe o Codigo do Produtor para ser  ')
	Aadd( aHelpEng, 'considerado no Acerto. Vc pode informar')
	Aadd( aHelpEng, 'de " " a ZZZZZZ, para considerar todos ')
	Aadd( aHelpEng, 'ou entao do P00001 ao P00001 para      ')
	Aadd( aHelpEng, 'considerar apenas este produtor.       ')
	U_xPutSx1(_cPerg,"01","Produtor de?","Produtor de?","Produtor de?","mv_ch1","C",6,0,0,"G",,"SA2_L4","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	
	aHelpPor := {}
	aHelpSpa := {}
	aHelpEng := {}
	Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
	Aadd( aHelpPor, 'considerado no Acerto.                 ')
	Aadd( aHelpSpa, 'Informe o Codigo do Produtor para ser  ')
	Aadd( aHelpSpa, 'considerado no Acerto.                 ')
	Aadd( aHelpEng, 'Informe o Codigo do Produtor para ser  ')
	Aadd( aHelpEng, 'considerado no Acerto.                 ')
	U_xPutSx1(_cPerg,"02","Produtor Ate?","Produtor Ate?","Produtor Ate?","mv_ch2","C",6,0,0,"G",,"SA2_L4","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	
	aHelpPor := {}
	aHelpSpa := {}
	aHelpEng := {}
	Aadd( aHelpPor, 'Informe o Dia de pagamento do produtor.')
	Aadd( aHelpPor, 'Este dia sera considerado na data de   ')
	Aadd( aHelpPor, 'vencimento do titulo gerado para o     ')
	Aadd( aHelpPor, 'produtor.                              ')
	Aadd( aHelpSpa, 'Informe o Dia de pagamento do produtor.')
	Aadd( aHelpSpa, 'Este dia sera considerado na data de   ')
	Aadd( aHelpSpa, 'vencimento do titulo gerado para o     ')
	Aadd( aHelpSpa, 'produtor.                              ')
	Aadd( aHelpEng, 'Informe o Dia de pagamento do produtor.')
	Aadd( aHelpEng, 'Este dia sera considerado na data de   ')
	Aadd( aHelpEng, 'vencimento do titulo gerado para o     ')
	Aadd( aHelpEng, 'produtor.                              ')
	U_xPutSx1(_cPerg,"03","Dia de Pagamento","Dia de Pagamento","Dia de Pagamento","mv_ch3","C",2,0,0,"G","","","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	
	aHelpPor := {}
	aHelpSpa := {}
	aHelpEng := {}
	Aadd( aHelpPor, 'Para o processamento considerar:       ')
	Aadd( aHelpPor, '1 - Apenas Fornecedores de Leite;      ')
	Aadd( aHelpPor, '2 - Apenas NÃO Fornecedores de Leite;  ')
	Aadd( aHelpPor, '3 - Ambos .                            ')
	Aadd( aHelpSpa, 'Para o processamento considerar:       ')
	Aadd( aHelpSpa, '1 - Apenas Fornecedores de Leite;      ')
	Aadd( aHelpSpa, '2 - Apenas NÃO Fornecedores de Leite;  ')
	Aadd( aHelpSpa, '3 - Ambos .                            ')
	Aadd( aHelpEng, 'Para o processamento considerar:       ')
	Aadd( aHelpEng, '1 - Apenas Fornecedores de Leite;      ')
	Aadd( aHelpEng, '2 - Apenas NÃO Fornecedores de Leite;  ')
	Aadd( aHelpEng, '3 - Ambos .                            ')
	U_xPutSx1(_cPerg,"04","Fornecedor de Leite","Fornecedor de Leite","Fornecedor de Leite","mv_ch4","C",1,0,0,"C","","","","","MV_PAR04","1-Fornec Leite","","","","2-NÃO Fornec Leite","","","3-Ambos","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)	
	
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³MGLT29A   ³ Autor ³Vinicius Fernandes     ³ Data ³ 02/10/14 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para verificar se já existe o titulo do educampo    ³±±
±±³          ³ no mes corrente.                                           ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³                                                            ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT29A()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
user Function MGLT29A(_cCodProd,_cPrefixo)
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Declaracao de variavies locais. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Local cQry   	:= ""
	Local _lReturn 	:= .T.	 
	Local _aArea	:= GETAREA()
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Filtra os produtores 	          ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ	

	cQry := " SELECT E1_NUM FROM " + RetSqlName("SE1") + " "
	cQry += " WHERE	E1_PREFIXO 	= '"+_cPrefixo+"' "
	cQry += " 	AND E1_CLIENTE	= '"+_cCodProd+"' "
	cQry += "	AND SUBSTRING(E1_EMISSAO,1,6) = '"+SUBSTR(DTOS(DDATABASE),1,6)+"' "
	cQry += "	AND D_E_L_E_T_	= ' ' "

	TCQUERY cQry NEW ALIAS ("TSE1")
	dbSelectArea("TSE1")   
	
	IF TSE1->(!EOF())
		_lReturn	:= .F.
	ENDIF

	TSE1->(DBCLOSEAREA())
	
	RestArea(_aArea)

Return _lReturn

