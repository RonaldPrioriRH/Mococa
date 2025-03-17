#INCLUDE "PROTHEUS.ch"
#INCLUDE "RWMAKE.ch"
#INCLUDE "TOPCONN.ch"
#INCLUDE "MSGRAPHI.ch"
               
#DEFINE _ENTER CHR(13)+CHR(10)
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ MGLT031  ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para realizar o Acerto dos Eventos Avulsos.         ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ 									                  		  ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT031()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function MGLT031()

	Local _bProcess	:= {|oSelf| EstEvento(oSelf)}
	Local cTexto	
	Private _cPerg		:= "MGLT031"    
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
	
	cTexto := "Esta rotina tem o objetivo de efetuar o Estorno dos Eventos dos Produtores."+_ENTER
	cTexto += "Por favor preencha os par‰metros da rotina. "+_ENTER
	cTexto += " "+_ENTER
		
	_oTProces := tNewProcess():New("MGLT031","Estorno do Acerto dos Eventos",_bProcess,cTexto,_cPerg)

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ EstEvento³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para realizar o Acerto dos Eventos Avulsos.         ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ 									                          ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT029()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function EstEvento(oObj)

	Local cFunc    := "1"
	Local cArqTmp  := cGLTalias+cFunc
	Local _aArea   := {}
	Local _aAlias  := {}
	Local nTotReg  := 0
	Local nCont    := 1
	
	//Variaveis Query
	Local _cDia			:= mv_par03
	Local _cMes      	:= SubStr(DtoS( ADDMes(dDataBase,1) ),5,2)
	Local _cAno      	:= SubStr(DtoS( ADDMes(dDataBase,1) ),1,4)
//	Local _cVencto  	:= _cAno+_cMes+_cDia //Dia de vencimento dos titulos
	
	Local _cTipo 
	Local _lRetFun
	
	Private _cProdDe  	:= mv_par01
	Private _cProdAte 	:= mv_par02
	Private cSeek 	:= SUBSTR(DTOS(dDataBase),1,6)+"Eventos"
	Private cFunOrigem := "MGLT029"  
	
	Private _nReg
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³  Salva a area. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL8","ZLF","SF1","SD1","SX1"})
	
	oObj:SaveLog("INICIO - Estornos T’tulos do Eventos")
	
	MsgRun("Aguarde.... Filtrando T’tulos...",,{||CursorWait(), MGLTQRY(cFunc), CursorArrow()})
	
	nTotReg := _nReg
	
	oObj:SetRegua2(nTotReg)

	dbSelectArea(cArqTmp)
	dbGoTop()
	
	BEGIN TRANSACTION
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Percorre eventos automaticos encontrados. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ	
	While (cArqTmp)->(!Eof()) 
	        
		If oObj <> Nil
			oObj:IncRegua1("COOPERADO - "+AllTrim((cArqTmp)->A2COD ) )
		EndIf 
		  
		If oObj <> Nil
			oObj:IncRegua2("Excluindo Eventos - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
			nCont++
		EndIf
	
		If (cArqTmp)->TIPOTIT == "SE2"                      
			//E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA                                                                                               
			_cSeekZP3	:= POSICIONE("SE2",1,XFILIAL("SE2")+(cArqTmp)->PREFIXO + (cArqTmp)->NUM + (cArqTmp)->PARCELA + (cArqTmp)->TIPO + (cArqTmp)->A2COD + (cArqTmp)->A2LOJA,"E2_L_SEEK")
			_lRetFun 	:= U_ExcluSE2((cArqTmp)->PREFIXO,(cArqTmp)->NUM,(cArqTmp)->PARCELA,(cArqTmp)->TIPO,(cArqTmp)->A2COD,(cArqTmp)->A2LOJA)
			IF _lRetFun
				DBSELECTAREA("ZP3")
				DBSETORDER(2) 
				IF DBSEEK(_cSeekZP3)
					RecLock("ZP3",.F.)  
						ZP3->ZP3_FINANC	:= ""
					MsUnLock()					
				ENDIF	 
				DBCLOSEAREA("ZP3")			
			ENDIF		
		Else                                             
			//E1_FILIAL+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO                                                                                                                  
			_cSeekZP3	:= POSICIONE("SE1",1,XFILIAL("SE1")+(cArqTmp)->PREFIXO + (cArqTmp)->NUM + (cArqTmp)->PARCELA + (cArqTmp)->TIPO ,"E1_L_SEEK")		
			_lRetFun 	:= U_ExcluSE1((cArqTmp)->PREFIXO,(cArqTmp)->NUM,(cArqTmp)->PARCELA,(cArqTmp)->TIPO,(cArqTmp)->A2COD,(cArqTmp)->A2LOJA)
			IF _lRetFun
				DBSELECTAREA("ZP3")
				DBSETORDER(2) 
				IF DBSEEK(_cSeekZP3)
					RecLock("ZP3",.F.)  
						ZP3->ZP3_FINANC	:= ""
					MsUnLock()					
				ENDIF	 
				DBCLOSEAREA("ZP3")			
			ENDIF		
		EndIf
		
		If !_lRetFun
			DisarmTransaction()
			Return
		EndIf	           
				
		(cArqTmp)->(dbSkip()) 
		
	EndDo
	
	END TRANSACTION
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Atualiza o log de processamento   ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	oObj:SaveLog("FIM - Estorno Eventos ")
		
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
Static Function MGLTQRY(cOpc)
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Declaracao de variavies locais. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Local cQry   := ""
	Local lSqlOk := .T.
	                                                                           
	Local _cPLEITE := U_GETRELA1("1","ZL1_PLEITE") //#LETRAS
	
	Do Case
	
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Filtra os titulos 	              ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ	
		Case cOpc == "1"
			cQry := "SELECT 'SE2' AS TIPOTIT,E2_FILIAL,E2_PREFIXO as PREFIXO,E2_NUM AS NUM,E2_PARCELA AS PARCELA,E2_TIPO AS TIPO,E2_FORNECE AS A2COD,E2_LOJA AS A2LOJA FROM "
			cQry += RetSqlName("SE2")
			cQry += " WHERE D_E_L_E_T_ = ' '"
			cQry += " AND E2_FILIAL  = '" + xFilial("SE2") + "'"
			cQry += " AND E2_FORNECE  BETWEEN '" + _cProdDe +"' AND '"+ _cProdAte +"'" 
			cQry += " AND E2_TIPO = 'NF' "
			cQry += " AND E2_EMISSAO = '" + dtos(dDatabase)+ "'"
			cQry += " AND E2_L_EVENT <> ' ' "
//			cQry += " AND E2_L_SEEK = '" + cSeek + "'"
			cQry += " AND E2_ORIGEM = '" + cFunOrigem + "'"
			cQry += " UNION "
			cQry += "SELECT 'SE1' AS TIPOTIT,E1_FILIAL,E1_PREFIXO as PREFIXO,E1_NUM AS NUM,E1_PARCELA AS PARCELA,E1_TIPO AS TIPO,E1_CLIENTE AS A2COD,E1_LOJA AS A2LOJA FROM "
			cQry += RetSqlName("SE1")
			cQry += " WHERE D_E_L_E_T_ = ' '"
			cQry += " AND E1_FILIAL  = '" + xFilial("SE1") + "'"
			cQry += " AND E1_CLIENTE  BETWEEN '" + _cProdDe +"' AND '"+ _cProdAte +"'" 
			cQry += " AND E1_TIPO = 'NF' "
			cQry += " AND E1_EMISSAO = '" + dtos(dDatabase)+ "'"
			cQry += " AND E1_L_EVENT <> ' ' "
//			cQry += " AND E1_L_SEEK = '" + cSeek + "'"
			cQry += " AND E1_ORIGEM = '" + cFunOrigem + "'"
			cQry += " ORDER BY TIPOTIT"
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
	U_xPutSx1(_cPerg,"02","Produtor Ate?","Produtor Ate?","Produtor Ate?","mv_ch2","C",6,0,0,"G",,"SA2_L4","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

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
	U_xPutSx1(_cPerg,"03","Fornecedor de Leite","Fornecedor de Leite","Fornecedor de Leite","mv_ch3","C",1,0,0,"C","","","","","MV_PAR03","1-Apenas Fornecedores de Leite","","","","2-Apenas NÃO Fornecedores de Leite","","","3-Ambos","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)	
	
Return

