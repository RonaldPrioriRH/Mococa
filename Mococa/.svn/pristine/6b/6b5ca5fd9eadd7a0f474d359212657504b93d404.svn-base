#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#DEFINE _ENTER CHR(13)+CHR(10)

/*/
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммямммммммммммммммммммммммкммммммммммммммммммямммммммммммммммммммммммммммммммммммммммммммммммм╩╠╠
╠╠╨Programa  Ё MGLT012  ╨ Autor Ё FABIANO DIAS DA SILVA ╨ Data da Criacao  Ё 12/03/2012                						╨╠╠
╠╠лммммммммммьммммммммммймммммммомммммммммммммммммммммммйммммммммммммммммммомммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Descricao Ё Rotina desenvolvida para possibilitar o CANCELAMENTO do Acerto do Frete junto aos Fretistas.                 ╨╠╠
╠╠╨          Ё                        									                               				        ╨╠╠
╠╠╨          Ё                        									                               				        ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё CANCELAMENTO do Fechamento do Frete.            						                                        ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨ParametrosЁ Nenhum						   							                               						╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Retorno   Ё Nenhum						  							                               						╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Usuario   Ё Microsiga                                                                                					╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Setor     Ё Gestao do Leite.                                                                        						╨╠╠
╠╠лммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU─AO INICIAL                   						╨╠╠
╠╠лммммммммммяммммммммммяммммммммммммммммммммммммммммммммммммммммммммммммммяммммммммммммммммммммммммммммммммммяммммммммммммм╧╠╠
╠╠╨Autor     Ё Data     Ё Motivo da Alteracao  				               ЁUsuario(Filial+Matricula+Nome)    ЁSetor        ╨╠╠
╠╠╨ддддддддддеддддддддддеддддддддддддддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддеддддддддддддд╨╠╠
╠╠╨          Ё00/00/0000Ё                               				   Ё00-000000 -                       Ё TI	        ╨╠╠
╠╠╨----------Ё----------Ё--------------------------------------------------Ё----------------------------------Ё-------------╨╠╠
╠╠╨          Ё          Ё                    							   Ё                                  Ё 			╨╠╠
╠╠╨----------Ё----------Ё--------------------------------------------------Ё----------------------------------Ё-------------╨╠╠
╠╠хммммммммммоммммммммммоммммммммммммммммммммммммммммммммммммммммммммммммммоммммммммммммммммммммммммммммммммммоммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
/*/

User Function MGLT012

Local cPerSetor   := ""
Local bProcess    := {|oSelf| MGLT6Exec(oSelf)}
Local oTProces

Local _cBkpFil	  := cFilAnt

Private lNfe      := .F.
Private cPerg     := "MGLT012"
Private cMes      := SubStr(DTOS(ADDMes(dDataBase,1)),5,2)
Private cAno      := SubStr(DTOS(ADDMes(dDataBase,1)),1,4)
//Private cVencto   := cAno+cMes+Alltrim(GetMv("LT_VENCTO"))//Dia de vencimento dos titulos
Private cDiaPgto  := ""
Private cHistFrt  := "GLF "+SubStr(DTOS(dDataBase),5,2)+"/"+SubStr(DTOS(dDataBase),1,4)
Private cNroTit   := ""
Private cParcTit  := StrZero(1,TamSx3("E2_PARCELA")[1]) //Parcela do titulo do evento(NDF)
Private cParcFret := StrZero(1,TamSx3("E2_PARCELA")[1]) //Parcela do titulo do Fretista(NF)
Private dDtBase   := dDatabase+7500
Private cGLTalias := "GLF" //Nome do alias para as tabelas temporarias
Private lDeuErro  := .F.
Private nReg      := 0
Private nSldFrt   := 0
Private cCodSetor := ""

Private cCodMIX   := ""
Private cVersao   := ""
Private cSetores  := ""
Private cFreteDe  := ""
Private cFreteAte := ""
Private cLojaDe   := ""
Private cLojaAte  := ""

Private cPrefixo  := ALLTRIM(GETMV("LT_PREFRT")) //Prefixo do titulo do Fretista
Private cPrefConv := ALLTRIM(GETMV("LT_CONVPRE"))//Prefixo do titulo NF gerado pela rotina de convenio
Private cMotBaixa := ALLTRIM(GETMV("LT_MOTBX"))  //Motivo de baixa utilizado para a rotina do Leite
Private cNatureza := ALLTRIM(GETMV("LT_NATGLF")) //Natureza dos titulos do Fretista

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Chama funcao para criar os parametros caso nao existam.             Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
AjustaSX1()

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Chama a tela para preenchimento dos parametros.                     Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If !Pergunte(cPerg,.T.)
	Return()
EndIf

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Atribui valor a variaveis comuns a todas as Funcoes.                Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
cCodMIX   := MV_PAR01
cVersao   := MV_PAR02
cSetores  := ALLTRIM(MV_PAR03)
cFretDe   := MV_PAR04
cFretAte  := MV_PAR05
cLojaDe   := MV_PAR06
cLojaAte  := MV_PAR07
//cVencto   := cAno+cMes+strzero(val(mv_par08),2)//Dia de vencimento dos titulos

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Verifica se os parametros estao em branco.                          Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If Empty(cCodMIX)
	xMagHelpFis("PARAMETRO MIX VAZIO",;
				"O parametro Codigo do MIX nao foi informado.",;
				"Preencha nos parametros o codigo do MIX")
	Return()
EndIf

If Empty(cVersao)
	xMagHelpFis("PARAMETRO VERSAO VAZIO",;
				"O parametro Versao do MIX nao foi informado.",;
				"Preencha nos parametros a Versao do MIX")
	Return()
EndIf

If Val(cVersao) > 1
	xMagHelpFis("PARAMETRO VERSAO INCORRETO",;
				"O parametro Versao do MIX nao pode ser diferente de 1.",;
				"Escolha um MIX na versao 1.")
	Return()
EndIf

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Verifica se o usuario tem permissao para executar a rotina de Acerto.Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
DbSelectArea("ZLU")
ZLU->(DbSetOrder(1))
If ZLU->(DbSeek(xFILIAL("ZLU")+U_UCFG001(2)))

	If ZLU->ZLU_ACERTO != "S"
		xMagHelpFis("USUARIO SEM PERMISSAO",;
					"Usuario sem permissao para executar esta rotina.",;
					"Acesse o mСdulo Configurador e altere o usuАrio para ter acesso a esta rotina.")
		Return()
	EndIf
	
	cPerSetor := U_VldSetor(cSetores)//Retorna os setores que o usuario nao tem permissao para acessar.
	If !Empty(cPerSetor)
		xMagHelpFis("USUARIO SEM PERMISSAO",;
					"Usuario sem permissao para acessar os setores:"+cPerSetor,;
					"Acesse o mСdulo Configurador e altere o usuАrio para ter acesso a todos os setores selecionados "+;
					"ou informe nos parametros somente os setores que vc possue acesso.")
		Return()
	EndIf
	
Else
	xMagHelpFis("USUARIO LEITE",;
				"Usuario nЦo encontrado no cadastro de Acessos GLT.",;
				"Acesse o mСdulo Configurador e cadastre o usuАrio na rotina Acessos GLT.")
	Return()
EndIf

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Inicializa a tela de processamento.                          Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
//If (GetRpoRelease()>="R1.1")
	cTexto := "AtenГЦo -  Rotina para efetuar o cancelamento do pagamento dos Transportaodores. "+_ENTER
	cTexto += " "+_ENTER
	cTexto += " "+_ENTER
	cTexto += "Esta rotina irА efetuar o cancelamento do Frete. "+_ENTER
	cTexto += " "+_ENTER
	cTexto += " "+_ENTER
	cTexto += "Todas as baixas realizadas pelo fechamento do frete serЦo canceladas e os seus tМtulos excluМdos."+_ENTER
	
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Sintaxe da tNewProcess():New( cFunction, cTitle, bProcess, cDescription, cPerg, aInfoCustom) Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	oTProces := tNewProcess():New("MGLT012","CANCELAMENTO DO FRETE",bProcess,cTexto,cPerg)
/*
Else
	xMagHelpFis("ATUALIZACAO DO RELEASE",;
	"VocЙ estА utilizando uma versЦo do Protheus que nЦo suporta as configuraГУes desta rotina.",;
	"Atualize o sistema para o Release R1.1 ou superior.")
EndIf
*/     

//здддддддддддддддддддддддддддддддддддддддддддддд©
//ЁRestaura a filial antes de iniciar o processo.Ё
//юдддддддддддддддддддддддддддддддддддддддддддддды
cFilAnt:= _cBkpFil

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt)) 

Return()

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    ЁMGLT6Exec Ё Autor ЁMicrosiga              Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Funcao para chamar as rotinas de CANCELAMENTO do Acerto.   Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ ExpO01 - Objeto da Regua de processamento.                 Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё MGLT012()                                                  Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function MGLT6Exec(oObjProc)

Local cFunc   	 := "1" //Codigo da Qry a ser executada
Local cArqTmp 	 := cGLTalias+cFunc
Local nCont   	 := 1
Local nProd   	 := 0
Local lTitExc 	 := .F.
Local _lCancel  

Local _lNoAcerto := .F. 
Local _lYesAcert := .F.

Local cHoraIni   := Time()

/*
//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁQuery para constatar se existem dados a serem excluidos na database     Ё
//Ёposicionada pelo usuario, para que nao ocorra problemas no cancelamento.Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
*/  
/*              
MsgRun("Aguarde.... Verificando se existem dados a serem cancelados...",,{||CursorWait(), _lCancel:=vldCancel(), CursorArrow()})

If !_lCancel
     
	Return

EndIf
*/

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Posiciona no cadastro de MIX.                                    Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
DbSelectArea("ZLE")
ZLE->(DbSetOrder(1))
If ZLE->(DbSeek(xFILIAL("ZLE") + cCodMIX + cVersao))	
	/*
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//ЁPelo fato do CTRC eletronico existe a necessidade que o fechamentoЁ
	//Ёseja efetuado com a data corrente.                                Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	*/
	if !lNfe                                	
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Verifica se a database do sistema esta com o ultimo dia do mes. Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		If LastDay(ZLE->ZLE_DTFIM) != dDataBase
			xMagHelpFis("NAO CONFORMIDADE 02 - DATABASE INVALIDA",;
						"A data do sistema("+DTOC(dDataBase)+") nao esta no ultimo dia do mes!",;
						"Altere a data do sistema para "+DTOC(LastDay(ZLE->ZLE_DTFIM)) )
			Return()
		EndIf
	EndIf
	
	oObjProc:SaveLog("INICIO - CANCELAMENTO DO FRETE")
	If oObjProc<>Nil
				
		//здддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Chama funcao para criar tabela Temporaria. Ё
		//юдддддддддддддддддддддддддддддддддддддддддддды
		MsgRun("Aguarde.... Filtrando dados para o Acerto...",,{||CursorWait(), MGLT5QRY(cFunc), CursorArrow()})
		nProd := nReg         
		oObjProc:SetRegua1(nProd)
		
		DbSelectArea(cArqTmp)
		DbGoTop()
		
		While (cArqTmp)->(!Eof())
		
			//здддддддддддддддддддддддддддддддд©
			//Ё Inicia o controle de transacao.Ё
			//юдддддддддддддддддддддддддддддддды
			Begin Transaction
			
			//зддддддддддддддддддддддддддддддддддддд©
			//Ё Cadastro de Fornecedor( Fretista ). Ё
			//юддддддддддддддддддддддддддддддддддддды
			DbSelectArea("SA2")
			SA2->(DbSetOrder(1))
			If SA2->(DbSeek(xFILIAL("SA2") + (cArqTmp)->ZLF_RETIRO + (cArqTmp)->ZLF_RETILJ))
		
			//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//Ё Armazena o Setor do Fretista.                                                   Ё
			//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			cCodSetor := (cArqTmp)->ZLF_SETOR
			
			//зддддддддддддддддддддддддддддддддддд©
			//Ё Atualiza a regua de processamento.Ё
			//юддддддддддддддддддддддддддддддддддды
			If oObjProc <> Nil				
				oObjProc:IncRegua1("Fretista " + Alltrim(Str(nCont)) + " de " + Alltrim(Str(nProd)) + " -> " + SA2->A2_COD + "/" + SA2->A2_LOJA + " - " + ALLTRIM(SA2->A2_NOME))
			Endif
		
			CancBxSE2(oObjProc)
			lTitExc	:= ExcluiSE2(oObjProc)
			
			if !lTitExc
				lDeuErro := .T.
			Endif
		
			//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//Ё Apos processar todas as funcoes, flag a ZLF informando queЁ
			//Ё os eventos do Fretista foram todos processados.           Ё
			//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			If !lDeuErro
			
				_cUpdate := " UPDATE " + RetSqlName("ZLF")
				_cUpdate += " SET ZLF_ACERTO = 'N', ZLF_L_SEEK = ' ', ZLF_STATUS = 'P'"
				_cUpdate += " WHERE D_E_L_E_T_ = ' '"
				_cUpdate += " AND ZLF_FILIAL    = '" + xFilial("ZLF") + "'"
				_cUpdate += " AND ZLF_RETIRO     = '" + SA2->A2_COD 	   + "'"
				_cUpdate += " AND ZLF_RETILJ    = '" + SA2->A2_LOJA   + "'"
				_cUpdate += " AND ZLF_CODZLE    = '" + cCodMIX 		   + "'"
				_cUpdate += " AND ZLF_VERSAO    = '" + cVersao 		   + "'"
				If !Empty(cSetores) //Se o parametro com os setores estiver vazio considera todos.
						_cUpdate += " AND ZLF_SETOR IN (" + U_AjustSet(cSetores) + ")"
				EndIf
				_cUpdate += " AND ZLF_TP_MIX    = 'F' "
				lSqlOk := !(TCSqlExec(_cUpdate) < 0)
			
				If !lSqlOk 
				
					lDeuErro := .T.           
					
					oObj:SaveLog("ERRO 01 - ZLF_ACERTO=N")
					xMagHelpFis("UPDATE ACERTO",;
								TcSqlError(),;
								"NЦo Conformidade ao executar o Update de gravacao da Realizacao do Acerto! "+;
								"NЦo confirme esta mensagem e informe ao Suporte TИcnico.")
				
				Endif    				
		    
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Chama funcao para deletar na ZLF os eventos gerados pela rotina de Fechamento. Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				MsgRun("Aguarde.... Deletando dados do Acerto...",,{||CursorWait(), MGLT5QRY("0"), CursorArrow()})    
			
				Else     
				
					xmaghelpfis("Falha",;
								"Ocorreu algum erro no cancelamento do Fretista:" + ALLTRIM((cArqTmp)->ZLF_RETIRO + '/' + (cArqTmp)->ZLF_RETILJ) + ", ou nЦo existe fechamento na DataBase selecionada.",;
								"Verifique a Database, se o problema persistir comunique ao suporte.")
				EndIf      
					
					Else
					
						oObj:SaveLog("ERRO 02 - Nao existe Fretista: " + ALLTRIM((cArqTmp)->ZLF_RETIRO + '/' + (cArqTmp)->ZLF_RETILJ))
						
						xMagHelpFis("NAO CONFORMIDADE 05 - Nao existe Fretista",;
									"Fretista "+ALLTRIM((cArqTmp)->ZLF_RETIRO+(cArqTmp)->ZLF_RETILJ)+" nЦo existe no cadastro!",;
									"Nao sera gerado o cancelamento do fechamento para esse Fretista. Verifique o cСdigo do Fretista no MIX versus o cadastro!","Alerta")				
			EndIf
		
		//зддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Se houve alguma falha, desfaz todas as transacoes.Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддды
		If lDeuErro
			DisarmTransaction()
			lDeuErro := .F.
		EndIf
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Finaliza o controle de transacao, caso nao hajam falhas. Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		End Transaction
		
		nCont++
		(cArqTmp)->(DbSkip())
		EndDo
		
	EndIf
	
	//зддддддддддддддддддддддддддддддддддд©
	//Ё Apaga arquivo temporario.         Ё
	//юддддддддддддддддддддддддддддддддддды
	DbSelectArea(cArqTmp)
	DbCloseArea(cArqTmp)
	
	//зддддддддддддддддддддддддддддддддддд©
	//Ё Atualiza a regua de processamento.Ё
	//юддддддддддддддддддддддддддддддддддды
	If oObjProc <> Nil
		oObjProc:SetRegua2(1)
		oObjProc:IncRegua1("Fim do Cancelamento Acerto - Atualizando Status!!")
	Endif
	
	//зддддддддддддддддддддддддддддддддддд©
	//Ё Altera o Status da ZLE.           Ё
	//юддддддддддддддддддддддддддддддддддды
	cQry := "SELECT"
	cQry += " COUNT(*) AS QTD,
	cQry += " ZLF_ACERTO FROM "
	cQry += RetSqlName("ZLF") + " "
	cQry += "WHERE"
	cQry += " D_E_L_E_T_ = ' '"
	cQry += " AND ZLF_CODZLE = '" + cCodMIX  + "'"
	cQry += " AND ZLF_VERSAO = '" + cVersao  + "' "
	cQry += "GROUP BY"
	cQry += " ZLF_ACERTO"
	
	TCQUERY cQry NEW ALIAS("GLT44")
	
	dbSelectArea("GLT44")  
	GLT44->(dbGoTop())
	
	While GLT44->(!Eof())	                           		
		/*
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁVerifica se foram encontrados registros sem efetuar o acerto.Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		*/
		If GLT44->ZLF_ACERTO == 'N' .And. GLT44->QTD > 0  
		
			_lNoAcerto:= .T.               		                        		     
			/*
			//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//ЁVerifica se foram encontrados registros que ja foram efetuados o acerto.Ё
			//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			*/
			ElseIf GLT44->ZLF_ACERTO == 'S' .And. GLT44->QTD > 0 
			
				_lYesAcert:= .T.
		
		EndIf
	
	GLT44->(dbSkip())
	EndDo        
	
	dbSelectArea("GLT44")
	dbCloseArea("GLT44")
	
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Posiciona no cadastro de MIX.                                    Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	dbSelectArea("ZLE")
	dbSetOrder(1)
	If dbSeek(xFilial("ZLE") + cCodMIX + cVersao)
	
		RecLock("ZLE",.F.)          
	                         	
		/*
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁIndica um Mix parcialmente fechado, ou seja, possui fechamentoЁ
		//Ёe alguns fretistas ou produtores sem efetuar o fechamento.    Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		*/
		If _lNoAcerto .And. _lYesAcert
		
			ZLE->ZLE_STATUS := 'P'
			            		
			/*
			//зддддддддддддддддддддддддддддддддддддддддд©
			//ЁMix que se encontra totalmente em aberto.Ё
			//юддддддддддддддддддддддддддддддддддддддддды
			*/
			ElseIf _lNoAcerto .And. !_lYesAcert  
				
				ZLE->ZLE_STATUS := 'A'
				                       			
				/*
				//зддддддддддддддддддддддддддддддддддддддд©
				//ЁMix que se encontra totalmente fechado.Ё
				//юддддддддддддддддддддддддддддддддддддддды
				*/
				ElseIf !_lNoAcerto .And. _lYesAcert 
				
					ZLE->ZLE_STATUS := 'F'
		
		EndIf           
		
		ZLE->(MsUnlock())
	
	EndIf
	
	
	oObjProc:SaveLog("FIM - CANCELAMENTO DO FRETE")
Else              

	xMagHelpFis("MIX nao encontrado.",;
	"O MIX informado nos parЦmetros nЦo foi encontrado!",;
	"Escolha um cСdigo de MIX que exista.")
	
EndIf      

MsgInfo("Tempo gasto no processamento:" + ELAPTIME(cHoraIni,TIME()))

Return

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    Ё CancBxSE2Ё Autor ЁMicrosiga              Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Cancela Baixa de titulo no contas a pagar via SigaAuto.    Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ Nenhum.                                                    Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё GENERICO                                                   Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/                       

Static Function CancBxSE2(oObj)

Local cFunc   		:= "2" //Codigo da Qry a ser executada
Local cArqTmp 		:= cGLTalias+cFunc
Local nCont   		:= 1
Local nTotReg 		:= 0
Local nModAnt 		:= nModulo
Local cModAnt 		:= cModulo
Local _aArea  		:= {}
Local _aAlias 		:= {}
                                     
Local _aTitulo      := {}      

Local _dDtBkpBas    := dDataBase

//зддддддддддддддддддддддддддддддддддд©
//ЁEfetua o backup da filial corrente.Ё
//юддддддддддддддддддддддддддддддддддды
Local _cBkpFil		:= cFilAnt

Private lMsErroAuto	:= .F.
Private lMsHelpAuto	:= .T.

//здддддддддддддддд©
//Ё  Salva a area. Ё
//юдддддддддддддддды
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL2","ZL8","ZLF","SF1","SD1","SX1"})

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza o log de processamento   Ё
//юддддддддддддддддддддддддддддддддддды
oObj:SaveLog("INICIO - Cancto Baixa - Fretista - " + SA2->A2_COD + SA2->A2_LOJA)

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Query para selecionar somente as baixas a serem canceladas que foram orginadas pela rotina de fechamento do frete. Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
MsgRun("Aguarde.... Filtrando dados cancelamento da baixa...",,{||CursorWait(), MGLT5QRY(cFunc), CursorArrow()})

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza a regua de processamento.Ё
//юддддддддддддддддддддддддддддддддддды
If oObj <> Nil
	nTotReg := nReg
	oObj:SetRegua2(nTotReg)
Endif

DbSelectArea(cArqTmp)
DbGoTop()
While (cArqTmp)->(!Eof()) .And. !lDeuErro

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//ЁPosiciona na database em que foram realizadas as baixas, isto porque        Ё
	//Ёo fechamento de 01/02/12 a 29/02/12 tera suas baixas efetuadas provavelmenteЁ
	//Ёno dia 15/03.                                                               Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	dDataBase:= StoD((cArqTmp)->E5_DATA)
	
	//зддддддддддддддддддддддддддддддддддд©
	//Ё Atualiza a regua de processamento.Ё
	//юддддддддддддддддддддддддддддддддддды
	If oObj <> Nil
		oObj:IncRegua2("Cancelamento Baixa - Tarefa "+Alltrim(Str(nCont))+" de "+Alltrim(Str(nTotReg)))
		nCont++
	Endif         
	
	/*
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//ЁAdicionado por Fabiano Dias no dia 30/05/12 para que as   Ё
	//Ёbaixas realizadas em outras filiais possam ser canceladas.Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	*/
//	cFilAnt:= (cArqTmp)->E2_FILIAL      	
	
	SM0->(dbSetOrder(1))   // forca o indice na ordem certa
	SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt)) 
	
	DbSelectArea("SE2")
	SE2->(DbSetOrder(1))
	//E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA                                                                                               
	If SE2->(dbSeek(xFilial("SE2") + (cArqTmp)->E2_PREFIXO + (cArqTmp)->E2_NUM + (cArqTmp)->E2_PARCELA + (cArqTmp)->E2_TIPO + SA2->A2_COD + SA2->A2_LOJA))
			
		   _aTitulo:={}
		   AADD(_aTitulo,{"E2_PREFIXO"  ,(cArqTmp)->E2_PREFIXO     				,Nil})//01
		   AADD(_aTitulo,{"E2_NUM"      ,(cArqTmp)->E2_NUM         				,Nil})//02
		   AADD(_aTitulo,{"E2_PARCELA"  ,(cArqTmp)->E2_PARCELA     				,Nil})//03
		   AADD(_aTitulo,{"E2_TIPO"     ,(cArqTmp)->E2_TIPO        				,Nil})//04
		   AADD(_aTitulo,{"E2_FORNECE"  ,SA2->A2_COD               					,Nil})//05
		   AADD(_aTitulo,{"E2_LOJA"     ,SA2->A2_LOJA              					,Nil})//06
		   AADD(_aTitulo,{"AUTMOTBX"    ,(cArqTmp)->E5_MOTBX       				,Nil})//07
		   AADD(_aTitulo,{"AUTDTBAIXA"  ,(cArqTmp)->E5_DATA         				,Nil})//08 
		   AADD(_aTitulo,{"AUTHIST"     ,"Cancto Bx - "+ SA2->A2_COD + SA2->A2_LOJA,Nil})//09 
		   AADD(_aTitulo,{"AUTDESCONT"  ,0                 							,Nil})//10
		   AADD(_aTitulo,{"AUTMULTA"    ,0                 							,Nil})//11 
		   AADD(_aTitulo,{"AUTJUROS"    ,0                 							,Nil})//12
		   AADD(_aTitulo,{"AUTOUTGAS"   ,0                 							,Nil})//13
		   AADD(_aTitulo,{"AUTVLRPG"    ,(cArqTmp)->E5_VALOR        				,Nil})//14
		   AADD(_aTitulo,{"AUTVALREC"   ,(cArqTmp)->E5_VALOR        				,Nil})//15
		   AADD(_aTitulo,{"AUTVLRME"    ,(cArqTmp)->E5_VALOR        				,Nil})//16		   
		   AADD(_aTitulo,{"AUTDTDEB"    ,(cArqTmp)->E5_DATA        				,Nil})//17
		   AADD(_aTitulo,{"AUTDTCREDITO",(cArqTmp)->E5_DATA        				,Nil})//18
		   
		
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Altera o modulo para Financeiro, senao o SigaAuto nao executa.Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		nModulo := 6
		cModulo := "FIN"
			
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Busca o numero da Baixa - Este numero eh usado para obter posteriormente pelo siga-auto a sequencia da baixa.Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		nBaixa := NroSeq((cArqTmp)->E5_SEQ)
			
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё SigaAuto de Cancelamento de Baixa de Contas a Pagar. Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддды
		MSExecAuto( {|x,y,z,k| Fina080(x,y,z,k)},_aTitulo,5,,nBaixa)
		
		//зддддддддддддддддддддддддддд©
		//Ё Restaura o modulo em uso. Ё
		//юддддддддддддддддддддддддддды
		nModulo := nModAnt
		cModulo := cModAnt
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Verifica se houve erro no SigaAuto, caso haja mostra o erro. Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		If lMsErroAuto   
		
			lDeuErro := .T.
			
			oObj:SaveLog("ERRO 03 - SIGAAUTO CANCELAMENTO BAIXA")
			xMagHelpFis("SIGAAUTO CANCELAMENTO BAIXA TITULO",;
						"Existe uma nЦo conformidade no SigaAuto de cancelamento de Baixa de Contas a Pagar!",;
						xFilial("SE2")+(cArqTmp)->E2_PREFIXO+(cArqTmp)->E2_NUM+;
						(cArqTmp)->E2_PARCELA+(cArqTmp)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA+;
						"     <-  Copie essas informaГУes para voce pesquisar no Contas a Pagar o titulo que esta com nЦo conformidade. "+;
						"ApСs confirmar esta tela, sera apresentada a tela de NЦo Conformidade do SigaAuto.")
			
			MostraErro()
			
		Else
			_cUpdate := " UPDATE " + RetSqlName("SE2")                                                        
			
			/*
			//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//ЁLinha comentada por Fabiano Dias no dia 14/03/12, pois a seguinte         Ё
			//Ёsituacao poderia via a ocorrer supondo que um titulo que fosse gerado     Ё
			//Ёautomaticamente pelo mix de numero 000001 sofresse uma baixa              Ё
			//Ёparcial e depois o mix de numero 000002 realiza-se outra baixa neste      Ё
			//Ёmesmo titulo, apos isso fosse solicitada o cancelamento do mix de numero  Ё
			//Ё000002 este titulo seria atualizado com o codigo do mix 000002 e depois o Ё
			//Ёmesmo seria selecionado para realizar a sua exclusao erradamente, pois    Ё
			//Ёfoi gerado pelo mix de numero 000001.  							         Ё
			//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			*/
			//_cUpdate += " SET E2_L_MIX = '" + cCodMIX + "', E2_L_VERSA = '" + cVersao + "', E2_DATALIB = ' '"
			_cUpdate += " SET E2_DATALIB = ' '"
			_cUpdate += " WHERE D_E_L_E_T_ = ' '"
			_cUpdate += " AND E2_FILIAL    = '" + xFilial("SE2") 		 + "'"
			_cUpdate += " AND E2_PREFIXO   = '" + (cArqTmp)->E2_PREFIXO + "'"
			_cUpdate += " AND E2_NUM       = '" + (cArqTmp)->E2_NUM 	 + "'"
			_cUpdate += " AND E2_PARCELA   = '" + (cArqTmp)->E2_PARCELA + "'"
			_cUpdate += " AND E2_TIPO      = '" + (cArqTmp)->E2_TIPO 	 + "'"
			_cUpdate += " AND E2_FORNECE   = '" + SA2->A2_COD 			 + "'"
			_cUpdate += " AND E2_LOJA      = '" + SA2->A2_LOJA 			 + "'"
			lSqlOk := !(TCSqlExec(_cUpdate) < 0)
			
			If !lSqlOk
				lDeuErro := .T.
				oObj:SaveLog("ERRO 04 - UPDATE E2_DATALIB")
				xMagHelpFis("UPDATE DO E2_DATALIB",;
							TcSqlError(),;
							"NЦo Conformidade ao executar o Update de gravacao da data de liberacao do titulo." + ;
							"NЦo confirme esta mensagem e informe ao Suporte TИcnico.")
			EndIf
			
		EndIf	         
		
		Else
		
			lDeuErro := .T.
			xMagHelpFis("ERRO 05 - NAO FOI ENCONTRADO TITULO",;
						"NЦo foi o encontrado o tМtulo mencionado abaixo para realizar o cancelamento de sua baixa, favor comunicar ao departamento de informАtica.",;
						"Filial: " + xFilial("SE2") + " - Prefixo: " + (cArqTmp)->E2_PREFIXO + " - Tipo: " +  (cArqTmp)->E2_TIPO + " - Numero: " + (cArqTmp)->E2_NUM +;
						" - Parcela: " + (cArqTmp)->E2_PARCELA + " - Fornecedor: " + SA2->A2_COD + "/" + SA2->A2_LOJA)
	
	EndIf
	
	//здддддддддддддддддд©
	//Ё Restaura a area. Ё
	//юдддддддддддддддддды
	CtrlArea(2,_aArea,_aAlias)
	
	(cArqTmp)->(DbSkip())
EndDo
       

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁRestaura a database antes de efetuar o cancelamento das baixas.Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
dDataBase:= _dDtBkpBas

//зддддддддддддддддддддддддддддддддддддддддддддд©
//ЁRestaura a filial corrente antes do processo.Ё
//юддддддддддддддддддддддддддддддддддддддддддддды
cFilAnt:= _cBkpFil    

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt)) 

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza o log de processamento   Ё
//юддддддддддддддддддддддддддддддддддды
oObj:SaveLog("FIM - Cancto Baixa - Fretista "+SA2->A2_COD+SA2->A2_LOJA)

//здддддддддддддддддд©
//Ё Restaura a area. Ё
//юдддддддддддддддддды
CtrlArea(2,_aArea,_aAlias)

//зддддддддддддддддддддддддддддддддддд©
//Ё Apaga arquivo temporario.         Ё
//юддддддддддддддддддддддддддддддддддды
DbSelectArea(cArqTmp)
DbCloseArea(cArqTmp)

Return

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    Ё ExcluiSE2Ё Autor ЁMicrosiga              Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Exlcui titulo no contas a pagar via SigaAuto.              Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ Nenhum.                                                    Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё GENERICO                                                   Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function ExcluiSE2(oObj)

Local cFunc   		:= "3" //Codigo da Qry a ser executada
Local cArqTmp 		:= cGLTalias+cFunc
Local nCont   		:= 1
Local nTotReg 		:= 0
Local nModAnt 		:= nModulo
Local cModAnt 		:= cModulo
Local _aArea  		:= {}
Local _aAlias 		:= {}
Local lRet			:= .F.

Private lMsErroAuto	:= .F.
Private lMsHelpAuto	:= .T.

//здддддддддддддддд©
//Ё  Salva a area. Ё
//юдддддддддддддддды
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL2","ZL8","ZLF","SF1","SD1","SX1"})

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza o log de processamento   Ё
//юддддддддддддддддддддддддддддддддддды
oObj:SaveLog("INICIO - Exclusao Titulo - Fretista - "+SA2->A2_COD+SA2->A2_LOJA)

//здддддддддддддддддддддддддддддддддддддддддддд©
//Ё Chama funcao para criar tabela Temporaria. Ё
//юдддддддддддддддддддддддддддддддддддддддддддды
MsgRun("Aguarde.... Filtrando dados exclusao do titulo...",,{||CursorWait(), MGLT5QRY(cFunc), CursorArrow()})

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza a regua de processamento.Ё
//юддддддддддддддддддддддддддддддддддды
If oObj <> Nil
	nTotReg := nReg
	oObj:SetRegua2(nTotReg)
Endif

DbSelectArea(cArqTmp)
DbGoTop()
While (cArqTmp)->(!Eof()) .And. !lDeuErro
	
	lRet:= .T.
	
	//зддддддддддддддддддддддддддддддддддд©
	//Ё Atualiza a regua de processamento.Ё
	//юддддддддддддддддддддддддддддддддддды
	If oObj <> Nil
		oObj:IncRegua2("Exclusao Titulo - Tarefa "+Alltrim(Str(nCont))+" de "+Alltrim(Str(nTotReg)))
		nCont++
	Endif
	
	DbSelectArea("SE2")
	SE2->(DbSetOrder(1))
	If SE2->(DbSeek(xFILIAL("SE2")+(cArqTmp)->E2_PREFIXO+(cArqTmp)->E2_NUM+(cArqTmp)->E2_PARCELA+(cArqTmp)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA))
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Array com os dados a serem passados para o SigaAuto. Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддды
		aAutoSE2:={{"E2_PREFIXO"	,SE2->E2_PREFIXO,Nil},;
		{"E2_NUM"    				,SE2->E2_NUM    ,Nil},;
		{"E2_TIPO"   				,SE2->E2_TIPO   ,Nil},;
		{"E2_PARCELA"				,SE2->E2_PARCELA,Nil},;
		{"E2_NATUREZ"				,SE2->E2_NATUREZ,Nil},;
		{"E2_FORNECE"				,SA2->A2_COD    ,Nil},;
		{"E2_LOJA"   				,SA2->A2_LOJA   ,Nil}}
		
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Altera o modulo para Financeiro, senao o SigaAuto nao executa.Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		nModulo := 6
		cModulo := "FIN"
		
		//здддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁRoda SigaAuto de Exclusao de Titulos a Pagar. Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддды
		MSExecAuto({|x,y,z| Fina050(x,y,z)},aAutoSE2,,5)
		
		//зддддддддддддддддддддддддддд©
		//Ё Restaura o modulo em uso. Ё
		//юддддддддддддддддддддддддддды
		nModulo := nModAnt
		cModulo := cModAnt
	Else
		lDeuErro := .T.
		
		oObj:SaveLog("ERRO 05 - SIGAAUTO EXCLUSAO TITULO")
		xMagHelpFis("EXCLUSAO - TITULO NAO EXCLUIDO",;
					"O titulo "+xFILIAL("SE2")+(cArqTmp)->E2_PREFIXO+(cArqTmp)->E2_NUM+(cArqTmp)->E2_PARCELA+(cArqTmp)->E2_TIPO+;
					" nЦo foi encontrado! Fretista: "+SA2->A2_COD+"/"+SA2->A2_LOJA+"-"+SA2->A2_NOME,;
					"Verifique no financeiro se este titulo existe, pois o mesmo nЦo foi encontrado.")								
	EndIf
	
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Verifica se houve erro no SigaAuto, caso haja mostra o erro. Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	If lMsErroAuto
	
		lDeuErro := .T.     
		
		oObj:SaveLog("ERRO 06 - SIGAAUTO EXCLUSAO TITULO")
		xMagHelpFis("EXCLUSAO - TITULO NAO EXCLUIDO",;
					"O titulo "+xFILIAL("SE2")+SE2->E2_PREFIXO+SE2->E2_NUM+SE2->E2_PARCELA+SE2->E2_TIPO+;
					" nЦo foi excluido! Fretista: "+SA2->A2_COD+"/"+SA2->A2_LOJA+"-"+SA2->A2_NOME,;
					"Verifique no financeiro se este titulo ja foi baixado ou o motivo pelo qual nЦo pode ser excluМdo."+;
					" Ao confimar esta tela, sera apresentada a tela do SigaAuto, que possui informaГУes mais detalhadas.")
					
		Mostraerro()
				
	Endif      
	
	//здддддддддддддддддд©
	//Ё Restaura a area. Ё
	//юдддддддддддддддддды
	CtrlArea(2,_aArea,_aAlias)
		
	(cArqTmp)->(DbSkip())
	
EndDo

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza o log de processamento   Ё
//юддддддддддддддддддддддддддддддддддды
oObj:SaveLog("FIM - Exclusao Titulo - Fretista "+SA2->A2_COD+SA2->A2_LOJA)

//здддддддддддддддддд©
//Ё Restaura a area. Ё
//юдддддддддддддддддды
CtrlArea(2,_aArea,_aAlias)

//зддддддддддддддддддддддддддддддддддд©
//Ё Apaga arquivo temporario.         Ё
//юддддддддддддддддддддддддддддддддддды
DbSelectArea(cArqTmp)
DbCloseArea(cArqTmp)

Return lRet

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    ЁMGLT5QRY  Ё Autor ЁMicrosiga              Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Funcao para executar querys e gerar arquivo temporario com Ё╠╠
╠╠Ё          Ё o resultado da query.                                      Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ ExpC01 - Caracter que identifica a query a ser chamada de  Ё╠╠
╠╠Ё          Ё          acordo com a rotina de Acerto em execucao.        Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё MGLT012()                                                  Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/

Static Function MGLT5QRY(cOpc,cPrefSE2)

//зддддддддддддддддддддддддддддддддд©
//Ё Declaracao de variavies locais. Ё
//юддддддддддддддддддддддддддддддддды
Local cQry   := ""
Local lSqlOk := .T.

Local _cGRANEL 	:= ""//U_GETRELA1("1","ZL1_GRANEL") //#LETRAS

DEFAULT cPrefSE2 := ""

Do Case
	//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Deleta os registros gerados na ZLF pela rotina de Acerto.   Ё
	//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	Case cOpc == "0"
		cQry := "DELETE FROM"
		cQry += " "+RETSQLNAME("ZLF")
		cQry += " WHERE D_E_L_E_T_ = ' '"
		cQry += " AND ZLF_FILIAL = '" + xFilial("ZLF") + "'"
		cQry += " AND ZLF_CODZLE = '" + cCodMIX			+ "'"
		cQry += " AND ZLF_VERSAO = '" + cVersao			+ "'"
		cQry += " AND ZLF_ORIGEM =  'F'" //So deleta originados pela rotina do Acerto
		cQry += " AND ZLF_ACERTO <> 'S'" //Deleta se nao realizou acerto definitivo
		cQry += " AND ZLF_TP_MIX = 'F' " //Deleta apenas registros do Frete
		cQry += " AND ZLF_RETIRO  = '" + SA2->A2_COD 	+ "'"
		cQry += " AND ZLF_RETILJ = '" + SA2->A2_LOJA 	+ "'"
		If !Empty(cSetores) //Se o parametro com os setores estiver vazio considera todos.
		cQry += " AND ZLF_SETOR IN (" + U_AjustSet(cSetores) + ")"
		EndIf
		lSqlOk := !(TCSqlExec(cQry) < 0)
		
		If !lSqlOk
			xMagHelpFis("NAO CONFORMIDADE 04 - NO DELETE",;
			TcSqlError(),;
			"Verifique a Sintaxe da Query de DELETE.")
		Endif 
		
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Filtra os Fretistaes do MIX para iniciar o processamento.   Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	Case cOpc == "1"
		cQry := "SELECT ZLF.ZLF_SETOR,ZLF.ZLF_RETIRO,ZLF.ZLF_RETILJ"
		cQry += " FROM " + RetSqlName("ZLF")+" ZLF"
		cQry += " JOIN "+RetSqlName("SA2")+" SA2 ON ZLF.ZLF_RETIRO = SA2.A2_COD AND ZLF.ZLF_RETILJ = SA2.A2_LOJA " //#LETRAS
		cQry += " WHERE D_E_L_E_T_ = ' '"
		cQry += " AND SA2.D_E_L_E_T_ = ' '" //#LETRAS
		cQry += " AND ZLF.ZLF_FILIAL = '" + xFILIAL("ZLF") + "'"
		cQry += " AND SA2.SA2_FILIAL = '" + xFilial("SA2")	+ "'" //#LETRAS
		If !Empty(cSetores) //Se o parametro com os setores estiver vazio considera todos.
			cQry += " AND ZLF.ZLF_SETOR IN (" + U_AjustSet(cSetores) + ")"
		EndIf
		cQry += " AND ZLF.ZLF_RETIRO  BETWEEN '" + cFretDe +"' AND '"+ cFretAte +"'"
		cQry += " AND ZLF.ZLF_RETILJ BETWEEN '" + cLojaDe +"' AND '"+ cLojaAte +"'"
		cQry += " AND ZLF.ZLF_CODZLE = '" + cCodMIX + "'"
		cQry += " AND ZLF.ZLF_VERSAO = '" + cVersao + "'"
		cQry += " AND SUBSTRING(ZLF_RETIRO,1,1) = 'T'" //#LETRAS
		//cQry += " AND SA2.A2_C_TPFOR IN " + U_ajusSQL(_cGRANEL) + " " //#LETRAS
		cQry += " AND ZLF.ZLF_ACERTO = 'S'"
		cQry += " AND ZLF.ZLF_TP_MIX = 'F' "
		cQry += " GROUP BY ZLF.ZLF_SETOR,ZLF.ZLF_RETIRO,ZLF.ZLF_RETILJ"
		cQry += " ORDER BY ZLF.ZLF_SETOR,ZLF.ZLF_RETIRO,ZLF.ZLF_RETILJ"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To nReg
		
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Seleciona os titulos do Fretista para terem sua baixas canceladas.Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	Case cOpc == "2"
		/*
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁCodigo fonte comentado abaixo por Fabiano no dia 09/08/11 em detrimento doЁ
		//Ёcodigo subsequente, pois foi constatado problema no cancelamento          Ё
		//Ёdo fretista.                                                              Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		*/   
		
		/*
		cQry := "SELECT E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO,E5_VALOR,E5_SEQ,E5_MOTBX,E5_DATA FROM "
		cQry += RetSqlName("SE2")+" SE2, "+RetSqlName("SE5")+" SE5"
		cQry += " WHERE SE2.D_E_L_E_T_ = ' ' AND SE5.D_E_L_E_T_ = ' '"
		cQry += " AND SE2.E2_FILIAL  = '" +xFILIAL("SE2")+ "'"
		cQry += " AND SE5.E5_FILIAL  = '" +xFILIAL("SE5")+ "'"
		cQry += " AND SE2.E2_L_MIX   = '" + cCodMIX + "'"
		cQry += " AND SE2.E2_L_VERSA = '" + cVersao + "'"  
		If !Empty(cSetores) //Se o parametro com os setores estiver vazio considera todos.
		cQry += " AND SE2.e2_l_setor IN ("+ U_AjustSet(cSetores) +") " 
		EndIf
		cQry += " AND SE2.E2_FORNECE = '" + SA2->A2_COD + "'"
		cQry += " AND SE2.E2_LOJA    = '" + SA2->A2_LOJA + "'"   
		cQry += " AND SE5.E5_CLIFOR  = '" + SA2->A2_COD + "'"
		cQry += " AND SE5.E5_LOJA    = '" + SA2->A2_LOJA + "'"   
		cQry += " AND SE2.E2_SALDO   <> SE2.E2_VALOR"
		//cQry += " AND SE2.E2_EMISSAO = '"+dtos(dDatabase)+"'"
		cQry += " AND SE2.E2_VENCTO <= '"+cVencto+"'"
		cQry += " AND SE2.E2_TIPO IN('NDF','NF ')"
		cQry += " AND SE2.E2_PREFIXO = SE5.E5_PREFIXO"
		cQry += " AND SE2.E2_NUM     = SE5.E5_NUMERO"
		cQry += " AND SE2.E2_PARCELA = SE5.E5_PARCELA"
		cQry += " AND SE2.E2_TIPO    = SE5.E5_TIPO"
		cQry += " AND SE5.E5_SITUACA <> 'C'"
		cQry += " AND SE5.E5_TIPODOC = 'BA'"
		cQry += " AND SE5.E5_MOTBX   = '"+cMotBaixa+"'"
		cQry += " ORDER BY E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To nReg   
		*/
		                      
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁPodem existir convenios e emprestimos de filiais diferentes da filial    Ё
		//Ёde fechamento que foram baixados anteriormente pela rotina de fechamento.Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		
		cQry := "SELECT E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO,E5_VALOR,E5_SEQ,E5_MOTBX,E5_DATA FROM "
		cQry += RetSqlName("SE2") + " SE2, "+RetSqlName("SE5") + " SE5"
		cQry += " WHERE SE2.D_E_L_E_T_ = ' ' AND SE5.D_E_L_E_T_ = ' '"
		//cQry += " AND SE2.E2_FILIAL  = '" + xFILIAL("SE2") + "'"
		//cQry += " AND SE5.E5_FILIAL  = '" + xFILIAL("SE5") + "'"
		//cQry += " AND SE2.E2_L_MIX   = '" + cCodMIX + "'"
		//cQry += " AND SE2.E2_L_VERSA = '" + cVersao + "'"
		cQry += " AND SE2.E2_FORNECE = '" + SA2->A2_COD    + "'"
		cQry += " AND SE2.E2_LOJA    = '" + SA2->A2_LOJA   + "'" 
		cQry += " AND SE5.E5_CLIFOR  = '" + SA2->A2_COD    + "'"
		cQry += " AND SE5.E5_LOJA    = '" + SA2->A2_LOJA   + "'" 
		cQry += " AND SE2.E2_SALDO   <> SE2.E2_VALOR"
		//cQry += " AND SE2.E2_VENCTO <= '"+cVencto+"'"
		cQry += " AND SE2.E2_TIPO IN ('NDF','NF ')"
		cQry += " AND SE2.E2_FILIAL  = SE5.E5_FILIAL"
		cQry += " AND SE2.E2_PREFIXO = SE5.E5_PREFIXO"
		cQry += " AND SE2.E2_NUM     = SE5.E5_NUMERO"
		cQry += " AND SE2.E2_PARCELA = SE5.E5_PARCELA"
		cQry += " AND SE2.E2_TIPO    = SE5.E5_TIPO"
		cQry += " AND SE2.E2_FORNECE = SE5.E5_CLIFOR"
		cQry += " AND SE2.E2_LOJA    = SE5.E5_LOJA"
		cQry += " AND SE5.E5_SITUACA <> 'C'"
		cQry += " AND SE5.E5_TIPODOC = 'BA'"
		cQry += " AND SE5.E5_MOTBX   = '" + cMotBaixa         + "'"      
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁComentado por Fabiano Dias no dia 12/07/12 pois como agora                        Ё
		//Ёa data da baixa depende da data de pagamento informada no fechamento              Ё
		//Ёisto para efetuar a deducao correta dos juros pode haver datas diferentes de baixaЁ
		//Ёentao pegaremos a data da baixa na SE5.                                           Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		//cQry += " AND SE5.E5_DATA    = '" + dtos(dDatabase)   + "'"
		cQry += " AND SE5.E5_L_SEEK  = '" + cCodMIX + cVersao + cCodSetor + "'"
		cQry += " ORDER BY E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To nReg
		
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Seleciona os titulos do Fretista para serem excluidos, so exclui os que foram gerados automaticamente.Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	Case cOpc == "3"
		cQry := "SELECT E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO FROM "
		cQry += RetSqlName("SE2")
		cQry += " WHERE D_E_L_E_T_ = ' '"
		cQry += " AND E2_FILIAL  = '" + xFILIAL("SE2") 	+ "'"
		cQry += " AND E2_L_MIX   = '" + cCodMIX 		+ "'"
		cQry += " AND E2_L_VERSA = '" + cVersao 		+ "'"
		cQry += " AND E2_FORNECE = '" + SA2->A2_COD 	+ "'"
		cQry += " AND E2_LOJA    = '" + SA2->A2_LOJA 	+ "'"
		If !Empty(cSetores) //Se o parametro com os setores estiver vazio considera todos.
		cQry += " AND e2_l_setor IN ("+ U_AjustSet(cSetores) +") " 
		EndIf
		//cQry += " AND E2_VENCTO <= '" + cVencto			+ "'"
		cQry += " AND E2_EMISSAO = '" + dtos(dDataBase) + "'"
		cQry += " AND E2_L_SITUA = 'I'"
		cQry += " AND E2_TIPO IN('NDF','NF ')"
		//cQry += " AND E2_SALDO > 0"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To nReg
EndCase

Return()

/*/
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммямммммммммммммммммммммммкммммммммммммммммммямммммммммммммммммммммммммммммммммммммммммммммммм╩╠╠
╠╠╨Programa  Ё NroSeq   ╨ Autor Ё Fabiano Dias          ╨ Data da Criacao  Ё 15/03/2012                						╨╠╠
╠╠лммммммммммьммммммммммймммммммомммммммммммммммммммммммйммммммммммммммммммомммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Descricao Ё Busca numero de sequencia da baixa no array de baixas do titulo                                              ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё cancBaixa                       						                                                        ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨ParametrosЁ cSeq - Numero da sequencia da baixa realizada na tabela SE5                                                  ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Retorno   Ё Numero da baixa a ser cancelado, este numero pode ser diferente do E5_SEQ                                    ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Usuario   Ё Microsiga                                                                                					╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Setor     Ё Gestao do Leite.                                                                        						╨╠╠
╠╠лммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU─AO INICIAL                   						╨╠╠
╠╠лммммммммммяммммммммммяммммммммммммммммммммммммммммммммммммммммммммммммммяммммммммммммммммммммммммммммммммммяммммммммммммм╧╠╠
╠╠╨Autor     Ё Data     Ё Motivo da Alteracao  				               ЁUsuario(Filial+Matricula+Nome)    ЁSetor        ╨╠╠
╠╠╨ддддддддддеддддддддддеддддддддддддддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддеддддддддддддд╨╠╠
╠╠╨          Ё00/00/0000Ё                               				   Ё00-000000 -                       Ё TI	        ╨╠╠
╠╠╨----------Ё----------Ё--------------------------------------------------Ё----------------------------------Ё-------------╨╠╠
╠╠╨          Ё          Ё                    							   Ё                                  Ё 			╨╠╠
╠╠╨----------Ё----------Ё--------------------------------------------------Ё----------------------------------Ё-------------╨╠╠
╠╠хммммммммммоммммммммммоммммммммммммммммммммммммммммммммммммммммммммммммммоммммммммммммммммммммммммммммммммммоммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
/*/
Static Function NroSeq(cSeq)

Local nRet 		  := 0
Local nPos 		  := 0     

Private lBaixaAbat:= .F.
Private lNotBax   := .F.
Private lAglImp   := .F.
Private lBxCec    := .F.
Private nTotImpost:= 0
Private nTotAdto  := 0      
Private nTotaIRPF := 0
Private aBaixaSE5 := {}                

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁProcura pelas baixas deste titulo                                     Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
Sel080Baixa("VL /V2 /BA /RA /CP /LJ /NCC/",SE2->E2_PREFIXO,SE2->E2_NUM,SE2->E2_PARCELA,SE2->E2_TIPO,@nTotAdto,;
			@lBaixaAbat,SE2->E2_FORNECE,SE2->E2_LOJA,@lBxCec,.T.,@lNotBax,@nTotImpost,@lAglImp;
			,,,@nTotaIRPF,SE2->E2_IDENTEE) 

If Len(aBaixaSE5) > 0                           

	For nPos := 1 to len(aBaixaSE5) 
				
		If aBaixaSE5[nPos,09] == cSeq 
		
			nRet:= nPos
			exit
		
		EndIf    
		
	Next nPos            

EndIf

Return nRet

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  Ё CtrlArea ╨ Autor Ё Microsiga          ╨ Data Ё  00/00/00   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Descricao Ё Static Function auxiliar no GetArea e ResArea retornando   ╨╠╠
╠╠╨          Ё o ponteiro nos Aliases descritos na chamada da Funcao.     ╨╠╠
╠╠╨          Ё Exemplo:                                                   ╨╠╠
╠╠╨          Ё Local _aArea  := {} // Array que contera o GetArea         ╨╠╠
╠╠╨          Ё Local _aAlias := {} // Array que contera o                 ╨╠╠
╠╠╨          Ё                     // Alias(), IndexOrd(), Recno()        ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠╨          Ё // Chama a Funcao como GetArea                             ╨╠╠
╠╠╨          Ё P_CtrlArea(1,@_aArea,@_aAlias,{"SL1","SL2","SL4"})         ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠╨          Ё // Chama a Funcao como RestArea                            ╨╠╠
╠╠╨          Ё P_CtrlArea(2,_aArea,_aAlias)                               ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨ParametrosЁ nTipo   = 1=GetArea / 2=RestArea                           ╨╠╠
╠╠╨          Ё _aArea  = Array passado por referencia que contera GetArea ╨╠╠
╠╠╨          Ё _aAlias = Array passado por referencia que contera         ╨╠╠
╠╠╨          Ё           {Alias(), IndexOrd(), Recno()}                   ╨╠╠
╠╠╨          Ё _aArqs  = Array com Aliases que se deseja Salvar o GetArea ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё GENERICO                                                   ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function CtrlArea(_nTipo,_aArea,_aAlias,_aArqs)

Local _nN := 0

// Tipo 1 = GetArea()
If _nTipo == 1
	_aArea := GetArea()
	For _nN := 1 To Len(_aArqs)
		DbSelectArea(_aArqs[_nN])
		AAdd(_aAlias,{ _aArqs[_nN], IndexOrd(), Recno() })
	Next
	// Tipo 2 = RestArea()
Else
	For _nN := 1 To Len(_aAlias)
		DbSelectArea(_aAlias[_nN,1])
		DbSetOrder(_aAlias[_nN,2])
		DbGoto(_aAlias[_nN,3])
	Next
	RestArea(_aArea)
Endif

Return

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Funcao    Ё AjustaSX1╨ Autor Ё Microsiga          ╨ Data Ё  00/00/00   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Descricao Ё Funcao para criacao das perguntas caso elas nao existam.   ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Programa principal                                         ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function AjustaSX1()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpPor, 'zado para Cancelamento do Fechamento.  ')
Aadd( aHelpSpa, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpSpa, 'zado para Cancelamento do Fechamento.  ')
Aadd( aHelpEng, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpEng, 'zado para Cancelamento do Fechamento.  ')
U_xPutSx1(cPerg,"01","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch1","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_01","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Versao do MIX. Versao 1 significa que  ')
Aadd( aHelpPor, 'se trata do 1o Fechto. Algumas filiais ')
Aadd( aHelpPor, 'terao mais de um fechamento por mes.   ')
Aadd( aHelpSpa, 'Versao do MIX. Versao 1 significa que  ')
Aadd( aHelpSpa, 'se trata do 1o Fechto. Algumas filiais ')
Aadd( aHelpSpa, 'terao mais de um fechamento por mes.   ')
Aadd( aHelpEng, 'Versao do MIX. Versao 1 significa que  ')
Aadd( aHelpEng, 'se trata do 1o Fechto. Algumas filiais ')
Aadd( aHelpEng, 'terao mais de um fechamento por mes.   ')
U_xPutSx1(cPerg,"02","Versao do MIX ?","Versao do MIX ?","Versao do MIX ?","mv_ch2","C",1,0,0,"G",,,"","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe os codigos dos setores a serem ')
Aadd( aHelpPor, 'considerados no Cancto. Se deixado em  ')
Aadd( aHelpPor, 'branco, serao considerados todos.      ')
Aadd( aHelpSpa, 'Informe os codigos dos setores a serem ')
Aadd( aHelpSpa, 'considerados no Cancto. Se deixado em  ')
Aadd( aHelpSpa, 'branco, serao considerados todos.      ')
Aadd( aHelpEng, 'Informe os codigos dos setores a serem ')
Aadd( aHelpEng, 'considerados no Cancto. Se deixado em  ')
Aadd( aHelpEng, 'branco, serao considerados todos.      ')
U_xPutSx1(cPerg,"03","Acerto do Setor?","Acerto do Setor?","Acerto do Setor?","mv_ch3","C",60,0,0,"G",'VAZIO().OR.SUBSTR(MV_PAR03,LEN(ALLTRIM(MV_PAR03)),1)=="/"',"U_F302","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Fretista para ser  ')
Aadd( aHelpPor, 'considerado no Cancto. Vc pode informar')
Aadd( aHelpPor, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpPor, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpPor, 'considerar apenas este Fretista.       ')
Aadd( aHelpSpa, 'Informe o Codigo do Fretista para ser  ')
Aadd( aHelpSpa, 'considerado no Cancto. Vc pode informar')
Aadd( aHelpSpa, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpSpa, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpSpa, 'considerar apenas este Fretista.       ')
Aadd( aHelpEng, 'Informe o Codigo do Fretista para ser  ')
Aadd( aHelpEng, 'considerado no Cancto. Vc pode informar')
Aadd( aHelpEng, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpEng, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpEng, 'considerar apenas este Fretista.       ')
U_xPutSx1(cPerg,"04","Fretista de?","Fretista de?","Fretista de?","mv_ch4","C",6,0,0,"G",,"SA2_L1","","","mv_par04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Fretista para ser  ')
Aadd( aHelpPor, 'considerado no Acerto.                 ')
Aadd( aHelpSpa, 'Informe o Codigo do Fretista para ser  ')
Aadd( aHelpSpa, 'considerado no Acerto.                 ')
Aadd( aHelpEng, 'Informe o Codigo do Fretista para ser  ')
Aadd( aHelpEng, 'considerado no Acerto.                 ')
U_xPutSx1(cPerg,"05","Fretista Ate?","Fretista Ate?","Fretista Ate?","mv_ch5","C",6,0,0,"G",,"SA2_L1","","","mv_par05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Fretista.  ')
Aadd( aHelpSpa, 'Informe o Codigo da Loja do Fretista.  ')
Aadd( aHelpEng, 'Informe o Codigo da Loja do Fretista.  ')
U_xPutSx1(cPerg,"06","Loja de?","Loja de?","Loja de?","mv_ch6","C",4,0,0,"G",,"","","","mv_par06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Fretista.  ')
Aadd( aHelpSpa, 'Informe o Codigo da Loja do Fretista.  ')
Aadd( aHelpEng, 'Informe o Codigo da Loja do Fretista.  ')
U_xPutSx1(cPerg,"07","Loja Ate?","Loja Ate?","Loja Ate?","mv_ch7","C",4,0,0,"G",,"","","","mv_par07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

/*
aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe a Data de Vencto dos Titulos   ')
Aadd( aHelpSpa, 'Informe a Data de Vencto dos Titulos   ')
Aadd( aHelpEng, 'Informe a Data de Vencto dos Titulos   ')
U_xPutSx1(cPerg,"08","Data Pagto?","","","mv_ch8","C",2,0,0,"G",,"","","","mv_par08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
*/

Return
/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Funcao    ЁvldCancel ╨ Autor Ё Fabiano Dias       ╨ Data Ё  16/09/11   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Descricao Ё Verifica no financeiro se existem dados a serem cancelados ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Idem                                                       ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/

Static Function vldCancel()
                              
Local _lRet     := .T.
Local _cAliasCan:= GetNextAlias()
Local _cFiltrCan:= "%"    
                             
/*
//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁQuery para constatar se existem dados a serem excluidos na database     Ё
//Ёposicionada pelo usuario, para que nao ocorra problemas no cancelamento.Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
*/       
_cFiltrCan += " AND E2_FILIAL = '" 		  + xFilial("SE2") + "'"
_cFiltrCan += " AND E2_FORNECE BETWEEN '" + cFretDe + "' AND '" + cFretAte + "'"
_cFiltrCan += " AND E2_LOJA BETWEEN '"    + cLojaDe + "' AND '" + cLojaAte + "'"    
_cFiltrCan += " AND E2_L_MIX = '"     	  + cCodMIX + "'"    

If !Empty(cSetores) //Se o parametro com os setores estiver vazio considera todos.
_cFiltrCan += " AND E2_L_SETOR IN ("+ U_AjustSet(cSetores) +") " 
EndIf        

_cFiltrCan += " AND E2_EMISSAO = '"       + DtoS(dDataBase) + "'"
_cFiltrCan += "%"

BeginSql alias _cAliasCan
	SELECT
	      COUNT(*) NUMREG
	FROM
	      %Table:SE2%
	WHERE
	      D_E_L_E_T_ = ' '
	      AND E2_TIPO = 'NF '
	      %Exp:_cFiltrCan%
EndSql 
                 
dbSelectArea(_cAliasCan)
(_cAliasCan)->(dbGotop())

If (_cAliasCan)->NUMREG == 0
     
	xMagHelpFis("INFORMAгцO",;
				"NЦo foram encontrados dados no financeiro para realizar o cancelamento dos fretistas.",;
				"Favor checar se os dados fornecidos para o cancelamento estЦo corretos, e se a database informada И a mesma da realizaГЦo do fechamento que esta sendo solicitado o cancelamento.") 
	_lRet:= .F.	                                          
	
EndIf  

dbSelectArea(_cAliasCan)
(_cAliasCan)->(dbCloseArea())

Return _lRet