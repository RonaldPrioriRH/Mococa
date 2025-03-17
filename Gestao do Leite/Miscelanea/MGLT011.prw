#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "RWMAKE.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "COLORS.CH"
#DEFINE _ENTER CHR(13)+CHR(10)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ MGLT011  º Autor ³ TOTVS                 º Data da Criacao  ³ 03/12/2008                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Rotina desenvolvida para possibilitar o Acerto do Frete junto aos Fretistas.                                 º±±
±±º          ³                        									                               				        º±±
±±º          ³ Serao calculados os dados Financeiros e gerado os titulos para os Fretistas.                                 º±±
±±º          ³                        									                               				        º±±
±±º          ³                        									                               				        º±±
±±º          ³                        									                               				        º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Fechamento do Frete.            						                                                        º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Nenhum						   							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum						  							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ Microsiga                                                                                					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite.                                                                        						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º TOTVS    ³ 03/12/08 ³ Foi criado outra funcao em substituicao a desen- ³                                  ³   	        º±±
±±º          ³          ³ volvida pelo Sr. Jeovane. Isso se deu devido as  ³                                  ³   	        º±±
±±º          ³          ³ mudancas relacionadas abaixo:                    ³                                  ³   	        º±±
±±º          ³          ³                                                  ³                                  ³   	        º±±
±±º          ³          ³-Mudanca devido a contabilizacao de titulos,      ³                                  ³ TI	        º±±
±±º          ³          ³ geracao do titulo pelo valor bruto da Nota,      ³                                  ³   	        º±±
±±º          ³          ³ baixa dos titulos do Fretista x titulo da Nota.  ³                                  ³   	        º±±
±±º          ³          ³-Mudanca no tratamento dos convenios, eles passa- ³                                  ³   	        º±±
±±º          ³          ³ ram a gerar contas a pagar.                      ³                                  ³   	        º±±
±±º          ³          ³-Mudanca na leitura dos Eventos, eles se tornaram ³                                  ³   	        º±±
±±º          ³          ³ dinamicos, com Condicao e Formula no cadastro.   ³                                  ³   	        º±±
±±º          ³          ³                                                  ³                                  ³   	        º±±
±±º          ³          ³                                                  ³                                  ³   	        º±±
±±º          ³          ³                                                  ³                                  ³   	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ºMarco     ³16/10/10  ³ Incluir Financiamento				               ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/

User Function MGLT011

Local cPerSetor   := ""
Local bProcess    := {|oSelf| MGLT6Exec(oSelf)}
Local oTProces    

Local _cBkpFil    := cFilAnt		

Private lNFE	  := .F.

Private cPerg     := "MGLT011"
Private cMes      := SubStr(DTOS(ADDMes(dDataBase,1)),5,2)
Private cAno      := SubStr(DTOS(ADDMes(dDataBase,1)),1,4)
Private cVencto   := cAno+cMes+ALLTRIM(GetMv("LT_VENCTO"))//Dia de vencimento dos titulos
Private cDiaPgto  := ""
Private cHistFrt  := "TRANSP. LTE "+SubStr(DTOS(dDataBase),5,2)+"/"+SubStr(DTOS(dDataBase),1,4)
Private cNroTit   := ""
Private cParcTit  := StrZero(1,TamSx3("E2_PARCELA")[1]) //Parcela do titulo do evento(NDF)
Private cParcFret := StrZero(1,TamSx3("E2_PARCELA")[1]) //Parcela do titulo do Fretista(NF)
Private dDtBase   := dDataBase+7500
Private cGLTalias := "GLF" //Nome do alias para as tabelas temporarias
Private lDeuErro  := .F.
Private nReg      := 0
Private nSldFrt   := 0
Private cCodMIX   := ""
Private cVersao   := ""
Private cSetores  := ""
Private cFreteDe  := ""
Private cFreteAte := ""
Private cLojaDe   := ""
Private cLojaAte  := ""
Private cTamParc  := Space(TamSx3("E2_PARCELA")[1]) //Parcela do titulo da Nota Fiscal, sempre em branco.
Private cPrefixo  := ALLTRIM(GETMV("LT_PREFRT")) //Prefixo do titulo do Fretista
Private cPrefConv := ALLTRIM(GETMV("LT_CONVPRE"))//Prefixo do titulo NF gerado pela rotina de convenio
Private cMotBaixa := ALLTRIM(GETMV("LT_MOTBX"))  //Motivo de baixa utilizado para a rotina do Leite
//Private cNatureza := ALLTRIM(GETMV("LT_NATGLF")) //Natureza dos titulos do Fretista
Private cXPrefix  := "" //ALLTRIM(GETMV("LT_PRFCTR")) // Prefixo do Titulo do CTRC
Private cXTipo	  := "NF " // Numero do Titulo do CTRC
Private cXNum	  := "" // Numero do Titulo do CTRC
Private cXParc	  := "" // Parcela do Titulo do CTRC
Private nXValor	  := 0
Private oDlg                    

Private dBaixa 	  := dDataBase //Compatibilizacao com a funcao padrao fa080Juros

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Armazena a filial corrente antes de iniciar o processo de fechamento.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Private _cFilEvent:= cFilAnt

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Chama funcao para criar os parametros caso nao existam.             ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
AjustaSX1()

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Chama a tela para preenchimento dos parametros.                     ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If !Pergunte(cPerg,.T.)
	Return()
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atribui valor a variaveis comuns a todas as Funcoes.                ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
//cTipoAct  := Iif(MV_PAR01==1,"Previsao","Definitivo")
cTipoAct  := "Definitivo"
cCodMIX   := MV_PAR01
cVersao   := MV_PAR02
cNroTit   := StrZero(Day(dDataBase),2)+StrZero(Month(dDataBase),2)+Substr(Dtos(dDataBase),3,2)+SubStr(MV_PAR01,4,3)
cSetores  := ALLTRIM(MV_PAR03)
cFreteDe  := MV_PAR04
cFreteAte := MV_PAR05
cLojaDe   := MV_PAR06
cLojaAte  := MV_PAR07  

if lNfE
	cMes := SubStr(DTOS( dDataBase ),5,2)
	cAno := SubStr(DTOS( dDataBase ),1,4)
Endif

cDiaPgto  := strzero(val(MV_PAR08),2)+"/"+cMes+"/"+cAno  
cVencto   := cAno+cMes+strzero(val(MV_PAR08),2)//Dia de vencimento dos titulos

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se os parametros estao em branco.                          ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
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

If Empty(MV_PAR08)
	xMagHelpFis("PARAMETRO DIA PAGTO",;
				"O parametro Dia de Pagamento nao foi informado.",;
				"Preencha nos parametros o dia de pagamento")
	Return()
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se o usuario tem permissao para executar a rotina de Acerto.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("ZLU")
ZLU->(dbSetOrder(1))
If ZLU->(dbSeek(xFILIAL("ZLU")+U_UCFG001(2)))

	If ZLU->ZLU_ACERTO != "S"
		xMagHelpFis("USUARIO SEM PERMISSAO",;
					"Usuario sem permissao para executar esta rotina.",;
					"Acesse o módulo Configurador e altere o usuário para ter acesso a esta rotina.")
		Return()
	EndIf
	
	cPerSetor := U_VldSetor(cSetores)//Retorna os setores que o usuario nao tem permissao para acessar.
	If !Empty(cPerSetor)
		xMagHelpFis("USUARIO SEM PERMISSAO",;
					"Usuario sem permissao para acessar os setores:"+cPerSetor,;
					"Acesse o módulo Configurador e altere o usuário para ter acesso a todos os setores selecionados "+;
					"ou informe nos parametros somente os setores que vc possue acesso.")
		Return()
	EndIf
	
Else
	xMagHelpFis("USUARIO LEITE",;
				"Usuario não encontrado no cadastro de Acessos GLT.",;
				"Acesse o módulo Configurador e cadastre o usuário na rotina Acessos GLT.")
	Return()
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Inicializa a tela de processamento.                          ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
//If (GetRpoRelease()>="R1.1")
cTexto := "Esta rotina tem o objetivo de efetuar o Acerto do FRETE dos Transportadores"+_ENTER
cTexto += " "+_ENTER
cTexto += "Antes de efetuar essa rotina, é preciso gerar os eventos de credito aos fretistas na rotina de MIX!"+_ENTER
cTexto += " "+_ENTER
cTexto += "A Previsao do acerto irá gerar todos os eventos automaticos de debito dos fretistas."+_ENTER
cTexto += "Se o acerto for Definitivo, além dos eventos, os titulos de debito e credito serao gerados no financeiro! "+_ENTER
cTexto += "Caso haja saldo, serao compensados os titulos de debitos. Caso contrario, esses debitos permanecerao"+_ENTER
cTexto += "no financeiro, e serao incluidos no proximo acerto!"+_ENTER
cTexto += " "+_ENTER
cTexto += "A Data-Base do sistema deve ser a ultima do periodo!"+_ENTER

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Sintaxe da tNewProcess():New( cFunction, cTitle, bProcess, cDescription, cPerg, aInfoCustom) ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oTProces := tNewProcess():New("MGLT011","Acerto do Frete",bProcess,cTexto,cPerg)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Restaura a filial antes de iniciar o processo.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cFilAnt:= _cBkpFil    

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt)) 

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³MGLT6Exec ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para chamar as rotinas de Acerto.                   ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpO01 - Objeto da Regua de processamento.                 ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT011()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function MGLT6Exec(oObjProc)

Local cFunc  	:= "1" //Codigo da Qry a ser executada
Local cArqTmp	:= cGLTalias+cFunc
Local nCont  	:= 1
Local nProd  	:= 0
Local cIndZLF	:= ""         

Local _lNoAcerto:= .F.
Local _lYesAcert:= .F.

Local cHoraIni  := TIME()   

Local _dDtBkpBas:= dDataBase

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona no cadastro de MIX.                                    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("ZLE")
ZLE->(dbSetOrder(1))
If ZLE->(dbSeek(xFILIAL("ZLE")+cCodMIX+cVersao))
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Verifica se a data informada nos parametros eh uma data valida.  ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If Month(ZLE->ZLE_DTINI) != Month(ZLE->ZLE_DTFIM)
		xMagHelpFis("NAO CONFORMIDADE 01 - PERIODO INVALIDO",;
					"Mes inicial "+ALLTRIM(STR(Month(ZLE->ZLE_DTINI)))+" é diferente do mes final "+ALLTRIM(STR(Month(ZLE->ZLE_DTFIM)))+" !",;
					"Escolha um MIX onde a data Inicio e Fim estejam no mesmo mês.")
		Return()
	EndIf
		
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Verifica se a database do sistema foi informada corretamente.	³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	
	if lNfe                                      
	
		if dDatabase <= ZLE->ZLE_DTFIM .or. date() != dDataBase
			xmaghelpfis("Falha",;
						"A database esta incorreta!",;
						"A database deve ser superior ao ultimo dia do mes a ser fechado e igual a data do servidor!") 
			Return()
		Endif
		
	else
	
		If LastDay(ZLE->ZLE_DTFIM) != dDataBase
			xMagHelpFis("NAO CONFORMIDADE 02 - DATABASE INVALIDA",;
						"A data do sistema("+DTOC(dDataBase)+") nao esta no ultimo dia do mes!",;
						"Altere a data do sistema para "+DTOC(LastDay(ZLE->ZLE_DTFIM)) )
			Return()
		EndIf
	Endif   	
	
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Verifica se a data de vencimento eh maior ou igual a data atual que sera a data de emissao dos titulos  ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	if lNfe	         
	
		If StoD(cVencto) < date()
		
			xMagHelpFis("NAO CONFORMIDADE - DIA DE PAGAMENTO INVALIDO",;
			   			"A data do sistema("+DTOC(dDataBase)+") usada para gerar a emissão do título não pode ser maior que a data de vencimento: " + DtoC(StoD(cVencto)),;
						"Favor alterar o parâmetro dia de pagamento com um dia maior ou igual a data de fechamento do Frete.") 
			Return() 		
		EndIf	
		
	EndIf
	
	oObjProc:SaveLog("INICIO - ACERTO DO FRETE")
	If oObjProc<>Nil
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Chama funcao para deletar na ZLF os eventos gerados pela rotina de Fechamento. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		MsgRun("Aguarde.... Preparando base para o Acerto...",,{||CursorWait(), MGLT5QRY("0"), CursorArrow()})
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Chama funcao para criar tabela Temporaria. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		MsgRun("Aguarde.... Filtrando dados para o Acerto...",,{||CursorWait(), MGLT5QRY(cFunc), CursorArrow()})
		nProd := nReg             
		oObjProc:SetRegua1(nProd)
		
		dbSelectArea(cArqTmp)
		dbGoTop()
		
		While (cArqTmp)->(!Eof())
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Inicia o controle de transacao.³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			Begin Transaction
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Cadastro de Fornecedor( Fretista ). ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			dbSelectArea("SA2")
			SA2->(dbSetOrder(1))
			If SA2->(dbSeek(xFILIAL("SA2")+(cArqTmp)->ZLF_RETIRO+(cArqTmp)->ZLF_RETILJ))
				
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Posiciona no Setor do Fretista.                                                 ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				dbSelectArea("ZL2")
				ZL2->(dbSetOrder(1))
				If !ZL2->(dbSeek(xFILIAL("ZL2")+(cArqTmp)->ZLF_SETOR))
					lDeuErro := .T.
					oObjProc:SaveLog("ERRO 01 - SETOR INEXISTENTE "+(cArqTmp)->ZLF_SETOR)
					xMagHelpFis("NAO CONFORMIDADE 03 - SETOR INEXISTENTE",;
								"O setor: "+(cArqTmp)->ZLF_SETOR+" não existe no cadastro de Setores.",;
								"Informe no cadastro de Fretista uma linha com Setor existente no cadastro de Setores.")
				EndIf
				
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Atualiza a regua de processamento.³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				If oObjProc <> Nil					
					oObjProc:IncRegua1("Fretista "+ALLTRIM(Str(nCont))+" de "+ALLTRIM(Str(nProd))+" -> "+SA2->A2_COD +"/"+SA2->A2_LOJA +" - "+ALLTRIM(SA2->A2_NOME))
				EndIf
				
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Calcula o Saldo contido na ZLF, considerando apenas valores gerados  ³
				//³ pelo MIX ou lancados manualmente pelo usuario.                       ³
				//³                                                                      ³
				//³ Essa variavel vai controlando o saldo do Fretista, pois caso a mesma ³
				//³ fique zerada, os titulos nao serao baixados.                         ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				nSldFrt := (cArqTmp)->CREDITO
				cIndZLF := xFILIAL("ZLF")+cCodMIX+"001"+cVersao+SA2->A2_COD+SA2->A2_LOJA
				
				If !lDeuErro .And. cTipoAct == "Definitivo"
					//***************************************************************
					// Se o fretista NAO emite CTRC, entao gera Titulo NF
					// Caso contrario, o usuario deve selecionar qual titulo
					// que esta no financeiro que devera sofrer as compensacoes.
					//***************************************************************
					//If SA2->A2_L_CTRC != "S"
					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³ Inclui o titulo do Fretista.                                                                       ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
					IncluiSE2(oObjProc,nSldFrt,cPrefixo,cNroTit,cParcFret,"NF ",cHistFrt,cIndZLF)
					/*
					Else
					If !getTitCTR(SA2->A2_COD,SA2->A2_LOJA)
					lDeuErro:=.T.
					EndIf
					If lDeuErro
					xmaghelpfis("Falha",;
					"Titulo referente ao CTRC nao foi encontrado!",;
					"Entre com o CTRC em Documento de Entrada gerando Financeiro!")
					EndIf
					
					If !lDeuErro .and. nSldFrt != nXValor
					lDeuErro:=.T.
					xmaghelpfis("Falha","Saldo do CTRC diferente do Valor da Folha de Pagamento.",;
					"O valor do CTRC deve ser o mesmo da Folha de Pagamento.")
					EndIf
					EndIf
					*/
				EndIf   
				
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³Incluido por Fabiano Dias e Elisa Junia no dia 12/07/12, para que as             ³
				//³baixas realizadas no titulo ja contemplem a data maxima do pagamento para o      ³
				//³calculo de juros por exemplo:                                                    ³
				//³Fechamento: 01/02/12 a 29/02/12 - somente era calculado o juros ate o dia        ³
				//³29/02/12, agora com a alteracao sera considerada a data de fechamento, atualmente³
				//³o 15 dia do mes posterior no nosso exemplo seria: 15/03/12.                      ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ					            
				dDataBase:= StoD(cVencto)
				dBaixa   := StoD(cVencto) //Compatibilizacao com a funcao padrao fa080Juros
												
				If !lDeuErro
					ActManual(oObjProc) //Acerto de Eventos digitados manualmente e Avulsos(Le a ZLF, gera e baixa SE2).
				EndIf     
				
				If !lDeuErro
					ActEvento(oObjProc) //Acerto de Eventos Avulsos(Le a ZL8, gera ZLF e SE2 e baixa SE2)
				EndIf
				
				If !lDeuErro
					ActFinanc(oObjProc) //Acerto Financeiro(Baixa e gera Contas a Pagar e ZLF)
				EndIf
								
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³Efetua a restauracao da database antes da realizacao das baixas.³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				dDataBase:= _dDtBkpBas
				dBaixa   := _dDtBkpBas				
								
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Apos processar todas as funcoes, flag a ZLF informando que³
				//³ os eventos do Fretista foram todos processados.           ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				If cTipoAct == "Definitivo" .And. !lDeuErro
					
					_cUpdate := " UPDATE " + RetSqlName("ZLF")
					_cUpdate += " SET ZLF_ACERTO = 'S', ZLF_STATUS = 'F'"
					_cUpdate += " WHERE D_E_L_E_T_ = ' '"
					_cUpdate += " AND ZLF_FILIAL    = '" + xFilial("ZLF") + "'"
					_cUpdate += " AND ZLF_RETIRO     = '" + SA2->A2_COD    + "'"
					_cUpdate += " AND ZLF_RETILJ    = '" + SA2->A2_LOJA   + "'"
					_cUpdate += " AND ZLF_CODZLE    = '" + cCodMIX        + "'"
					_cUpdate += " AND ZLF_VERSAO    = '" + cVersao        + "'"
					_cUpdate += " AND ZLF_ACERTO <> 'S'"
					_cUpdate += " AND ZLF_TP_MIX = 'F'"
					If !Empty(cSetores) //Se o parametro com os setores estiver vazio considera todos.
						_cUpdate += " AND ZLF_SETOR IN (" + U_AjustSet(cSetores) + ")"
					Endif
					lSqlOk := !(TCSqlExec(_cUpdate) < 0)
					
					If !lSqlOk     
					
						lDeuErro := .T.
						oObjProc:SaveLog("ERRO 02 - ZLF_ACERTO=S")
						xMagHelpFis("NAO CONFORMIDADE 04 - UPDATE ACERTO",;
									TcSqlError(),;
									"Não Conformidade ao executar o Update de gravacao da Realizacao do Acerto! "+;
									"Não confirme esta mensagem e informe ao Suporte Técnico.")
					EndIf
					
				EndIf
				
			Else    
			
				oObjProc:SaveLog("ERRO 03 - Nao existe Fretista "+ALLTRIM((cArqTmp)->ZLF_RETIRO+(cArqTmp)->ZLF_RETILJ))
				xMagHelpFis("NAO CONFORMIDADE 05 - Nao existe Fretista",;
							"Fretista "+ALLTRIM((cArqTmp)->ZLF_RETIRO+(cArqTmp)->ZLF_RETILJ)+" não existe no cadastro!",;
							"Nao sera gerado Acerto para esse Fretista. Verifique o código do Fretista no MIX versus o cadastro!","Alerta")
				
			EndIf
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Se houve alguma falha, desfaz todas as transacoes, efetuadas para o fretista.³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			If lDeuErro
				DisarmTransaction()
				lDeuErro := .F.
			EndIf
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Finaliza o controle de transacao, caso nao hajam falhas. ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			End Transaction
			
			nCont++
			(cArqTmp)->(dbSkip())
		EndDo				
		
	EndIf
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Apaga arquivo temporario.         ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	dbSelectArea(cArqTmp)
	DbCloseArea(cArqTmp)
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Altera o Status da ZLE.           ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If cTipoAct == "Definitivo"
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Atualiza a regua de processamento.³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		If oObjProc <> Nil
			oObjProc:SetRegua1(1)
			oObjProc:IncRegua1("Fim do Acerto - Atualizando Status!!")
		EndIf
		
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Altera o Status da ZLE.           ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
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
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Verifica se foram encontrados registros sem efetuar o acerto.³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		*/
		If GLT44->ZLF_ACERTO == 'N' .And. GLT44->QTD > 0  
		
			_lNoAcerto:= .T.               		                        		     
			/*
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³Verifica se foram encontrados registros que ja foram efetuados o acerto.³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			*/
			ElseIf GLT44->ZLF_ACERTO == 'S' .And. GLT44->QTD > 0 
			
				_lYesAcert:= .T.
		
		EndIf
	
	GLT44->(dbSkip())
	EndDo        
	
	dbSelectArea("GLT44")
	dbCloseArea("GLT44")
	
	RecLock("ZLE",.F.)          
	                         	
	/*
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Indica um Mix parcialmente fechado, ou seja, possui fechamento³
	//³e alguns fretistas ou produtores sem efetuar o fechamento.    ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	*/
	If _lNoAcerto .And. _lYesAcert
	
		ZLE->ZLE_STATUS := 'P'
		            		
		/*
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Mix que se encontra totalmente em aberto.³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		*/
		ElseIf _lNoAcerto .And. !_lYesAcert  
			
			ZLE->ZLE_STATUS := 'A'
			                       			
			/*
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³Mix que se encontra totalmente fechado.³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			*/
			ElseIf !_lNoAcerto .And. _lYesAcert 
			
				ZLE->ZLE_STATUS := 'F'
	
	EndIf 
	
	ZLE->(MsUnLock())	   
		
	EndIf
	
	oObjProc:SaveLog("FIM - ACERTO DO FRETE")
Else    

	xMagHelpFis("NAO CONFORMIDADE 06 - MIX nao encontrado.",;
				"O MIX informado nos parãmetros não foi encontrado!",;
				"Escolha um código de MIX que exista.")
	
EndIf

MsgInfo("Tempo gasto no processamento:" + ELAPTIME(cHoraIni,TIME()))

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ ActManual³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para realizar o Acerto dos Eventos digitados        ³±±
±±³          ³ manualmente e avulsos.                                     ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpO01 - Objeto da Regua de processamento.                 ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT050()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function ActManual(oObj)

Local cFunc    := "2"
Local cArqTmp  := cGLTalias+cFunc
Local _aArea   := {}
Local _aAlias  := {}
Local nTotReg  := 0
Local nCont    := 1
Local nVlrEvto := 0
Local nJurTit  := 0
Local nVlrBx   := 0
//Local cNroTit  := StrZero(Day(dDataBase),2)+StrZero(Month(dDataBase),2)+Substr(Dtos(dDataBase),3,2)+SubStr(cCodMIX,4,3)
Local cParc    := StrZero(1,TamSx3("E2_PARCELA")[1]) //Parcela do titulo do evento
Local cSeekZLF := ""

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³  Salva a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL2","ZL8","ZLF","SF1","SD1","SX1"})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("INICIO - Acerto Manual - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cria tabela temporaria com os dados dos Eventos(ZL8) para filtrar posteriormente o SE2. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
MsgRun("Aguarde.... Filtrando dados dos Eventos Manuais...",,{||CursorWait(), MGLT5QRY(cFunc), CursorArrow()})
nTotReg := nReg  
oObj:SetRegua2(nTotReg)

dbSelectArea(cArqTmp)
dbGoTop()

While (cArqTmp)->(!Eof())
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Atualiza a regua de processamento.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If oObj <> Nil
		oObj:IncRegua2("Eventos Manuais - Tarefa "+ALLTRIM(Str(nCont))+" de "+ALLTRIM(Str(nTotReg)))
		nCont++
	EndIf
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Posiciona no cadastro de Eventos. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	dbSelectArea("ZL8")
	ZL8->(dbSetOrder(1))
	ZL8->(dbSeek(xFILIAL("ZL8")+(cArqTmp)->EVENTO))
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Verifica se a condicao do Evento eh satisfatoria, nao eh necessario verificar esta condicao uma vez que isso eh verificado no³
    //³ mix no momento do lancamento do evento, desta forma inviabiliza este uso.  													 ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	//If &(ZL8->ZL8_CONDIC)
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Busca o valor do Evento na ZLF e grava no titulo.  ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		nVlrEvto := (cArqTmp)->TOTAL
		
		If nVlrEvto > 0       
		
			If cTipoAct == "Definitivo"
				
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Altera o registro na ZLF de Debito referente ao valor do evento lido.                              ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				//cSeekZLF := GrvZLF(ZL8->ZL8_COD,0,xFILIAL("SE2")+ZL8->ZL8_PREFIX+cNroTit+cParc+"NDF"+SA2->A2_COD+SA2->A2_LOJA,.F.,.T.,(cArqTmp)->ZLF_SEQ)
				cSeekZLF := xFILIAL("ZLF")+cCodMIX+cVersao+SA2->A2_COD+SA2->A2_LOJA+(cArqTmp)->EVENTO+(cArqTmp)->ZLF_SEQ
				
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Inclui o titulo relacionado ao evento lido.                                                        ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				IncluiSE2(oObj,nVlrEvto,ZL8->ZL8_PREFIX,cNroTit,cParc,"NDF",ZL8->ZL8_DESCRI,cSeekZLF,ZL8->ZL8_NATFRT)
				
				If (nSldFrt - nVlrEvto) >= 0
					  					       
					/*
					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³Comentado por Fabiano Dias no dia 12/03/12, pois a ESPECIFICO³
					//³nao trabalha com conhecimento de transporte.               ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
					*/
					/*
					If SA2->A2_L_CTRC == "S"
						//³ Baixa o titulo incluido atraves do evento lido.                                                    ³
						BaixaSE2(oObj,nVlrEvto,ZL8->ZL8_PREFIX,cNroTit,cParc,"NDF",ZL8->ZL8_PREFIX,cSeekZLF)
						//³ Baixa no titulo de valor bruto do Fretista o valor da baixa do evento.                             ³
						BaixaSE2(oObj,nVlrEvto,cXPrefix,cXNum,cXParc,cXTipo,"")
					Else
						BaixaSE2(oObj,nVlrEvto,ZL8->ZL8_PREFIX,cNroTit,cParc,"NDF",ZL8->ZL8_PREFIX,cSeekZLF)
						BaixaSE2(oObj,nVlrEvto,cPrefixo,cNroTit,cParcFret,"NF ","")
					EndIf
					*/  
					
					BaixaSE2(oObj,nVlrEvto,ZL8->ZL8_PREFIX,cNroTit,cParc,"NDF",ZL8->ZL8_PREFIX,cSeekZLF,_cFilEvent)
					BaixaSE2(oObj,nVlrEvto,cPrefixo,cNroTit,cParcFret,"NF ","","",_cFilEvent)
					
					cParc   := SOMA1(cParc)
					nSldFrt -= nVlrEvto   
					
					altZLF(cSeekZLF,nVlrEvto,nVlrEvto,nVlrEvto,ZL8->ZL8_DESCRI,xFilial("SE2") + ZL8->ZL8_PREFIX + cNroTit + cParc + "NDF" + SA2->A2_COD + SA2->A2_LOJA)
					
				ElseIf nSldFrt > 0   
				
					/*
					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³Comentado por Fabiano Dias no dia 12/03/12, pois a ESPECIFICO³
					//³nao trabalha com conhecimento de transporte.               ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
					*/
				
					/*
					If SA2->A2_L_CTRC == "S"
						//³ Baixa o titulo incluido atraves do evento lido.                                                    ³
						BaixaSE2(oObj,nSldFrt,ZL8->ZL8_PREFIX,cNroTit,cParc,"NDF",ZL8->ZL8_PREFIX,cSeekZLF)
						//³ Baixa no titulo de valor bruto do produtor o valor da baixa do evento.                             ³
						BaixaSE2(oObj,nSldFrt,cXPrefix,cXNum,cXParc,cXTipo,"")
					Else
						//³ Baixa o titulo incluido atraves do evento lido.                                                    ³
						BaixaSE2(oObj,nSldFrt,ZL8->ZL8_PREFIX,cNroTit,cParc,"NDF",ZL8->ZL8_PREFIX,cSeekZLF)
						//³ Baixa no titulo de valor bruto do produtor o valor da baixa do evento.                             ³
						BaixaSE2(oObj,nSldFrt,cPrefixo,cNroNota,cParcFret,"NF ","")
					EndIf
					*/    
					
					//³ Baixa o titulo incluido atraves do evento lido.                                                    ³
					BaixaSE2(oObj,nSldFrt,ZL8->ZL8_PREFIX,cNroTit,cParc,"NDF",ZL8->ZL8_PREFIX,cSeekZLF,_cFilEvent)
					//³ Baixa no titulo de valor bruto do produtor o valor da baixa do evento.                             ³
					BaixaSE2(oObj,nSldFrt,cPrefixo,cNroNota,cParcFret,"NF ","","",_cFilEvent)
					
					altZLF(cSeekZLF,nSldFrt,nVlrEvto,nVlrEvto,ZL8->ZL8_DESCRI,xFilial("SE2") + ZL8->ZL8_PREFIX + cNroTit + cParc + "NDF" + SA2->A2_COD + SA2->A2_LOJA)                         
					
					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³ Incrementa a parcela para o proximo titulo de evento, tambem decressce o saldo do produtor.        ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
					cParc   := SOMA1(cParc)
					nSldFrt -= nSldFrt       										
					
				EndIf
			EndIf
		EndIf
	//EndIf
	
	(cArqTmp)->(dbSkip())
EndDo

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("FIM - Acerto Manual - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Apaga arquivo temporario.         ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea(cArqTmp)
DbCloseArea(cArqTmp)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(2,_aArea,_aAlias)

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
±±³Parametros³ ExpO01 - Objeto da Regua de processamento.                 ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT011()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/                                                       

Static Function ActEvento(oObj)

Local cFunc    := "3"
Local cArqTmp  := cGLTalias+cFunc
Local _aArea   := {}
Local _aAlias  := {}
Local nTotReg  := 0
Local nCont    := 1
Local nVlrEvto := 0
Local nJurTit  := 0
Local nVlrBx   := 0
Local cSeekZLF := ""

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³  Salva a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL2","ZL8","ZLF","SF1","SD1","SX1"})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("INICIO - Acerto Evento - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cria tabela temporaria com os dados dos Eventos(ZL8) para filtrar posteriormente o SE2. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
MsgRun("Aguarde.... Filtrando dados dos Eventos...",,{||CursorWait(), MGLT5QRY(cFunc), CursorArrow()})
nTotReg := nReg    
oObj:SetRegua2(nTotReg)

dbSelectArea(cArqTmp)
dbGoTop()

While (cArqTmp)->(!Eof())
		
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Atualiza a regua de processamento.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If oObj <> Nil
		oObj:IncRegua2("Eventos - Tarefa "+ALLTRIM(Str(nCont))+" de "+ALLTRIM(Str(nTotReg)))
		nCont++
	EndIf
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Posiciona no cadastro de Eventos. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	dbSelectArea("ZL8")
	ZL8->(dbSetOrder(1))
	ZL8->(dbSeek(xFILIAL("ZL8")+(cArqTmp)->ZL8_COD))
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Verifica se a condicao do Evento eh satisfatoria.  ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If &(ZL8->ZL8_CONDIC)
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Busca o valor a ser gravado no Evento e no titulo. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		nVlrEvto := &(ZL8->ZL8_FORMUL)
		                                                		
		If nVlrEvto > 0                                
		
			If cTipoAct == "Definitivo"
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Grava um registro na ZLF de Debito referente ao valor do evento lido.                              ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				cSeekZLF := GrvZLF(ZL8->ZL8_COD,nVlrEvto,xFILIAL("SE2")+ZL8->ZL8_PREFIX+cNroTit+cParcTit+"NDF"+SA2->A2_COD+SA2->A2_LOJA,.F.,SA2->A2_L_LI_RO,nVlrEvto,nVlrEvto,dDataBase,ALLTRIM(ZL8->ZL8_DESCRI),0,0)
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Inclui o titulo relacionado ao evento lido.                                                        ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				IncluiSE2(oObj,nVlrEvto,ZL8->ZL8_PREFIX,cNroTit,cParcTit,"NDF",ZL8->ZL8_DESCRI,cSeekZLF,ZL8->ZL8_NATFRT)
				
				If (nSldFrt - nVlrEvto) >= 0
					  
					/*
					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³Comentado por Fabiano Dias no dia 12/03/12, pois a ESPECIFICO³
					//³nao trabalha com conhecimento de transporte.               ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
					*/
					/*
					If SA2->A2_L_CTRC == "S"
						//³ Baixa o titulo incluido atraves do evento lido.                                                    ³
						BaixaSE2(oObj,nVlrEvto,ZL8->ZL8_PREFIX,cNroTit,cParcTit,"NDF",ZL8->ZL8_PREFIX,cSeekZLF)
						//³ Baixa no titulo de valor bruto do Fretista o valor da baixa do evento.                             ³
						BaixaSE2(oObj,nVlrEvto,cXPrefix,cXNum,cXParc,cXTipo,"")
					Else
						//³ Baixa o titulo incluido atraves do evento lido.                                                    ³
						BaixaSE2(oObj,nVlrEvto,ZL8->ZL8_PREFIX,cNroTit,cParcTit,"NDF",ZL8->ZL8_PREFIX,cSeekZLF)
						//³ Baixa no titulo de valor bruto do Fretista o valor da baixa do evento.                             ³
						BaixaSE2(oObj,nVlrEvto,cPrefixo,cNroTit,cParcFret,"NF ","")
					EndIf
					*/
					
					//³ Baixa o titulo incluido atraves do evento lido.                                                    ³
					BaixaSE2(oObj,nVlrEvto,ZL8->ZL8_PREFIX,cNroTit,cParcTit,"NDF",ZL8->ZL8_PREFIX,cSeekZLF,_cFilEvent)
					//³ Baixa no titulo de valor bruto do Fretista o valor da baixa do evento.                             ³
					BaixaSE2(oObj,nVlrEvto,cPrefixo,cNroTit,cParcFret,"NF ","","",_cFilEvent)
					
					cParcTit   := SOMA1(cParcTit)
					nSldFrt -= nVlrEvto
					
				ElseIf nSldFrt > 0
					
					/*
					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³Comentado por Fabiano Dias no dia 12/03/12, pois a ESPECIFICO³
					//³nao trabalha com conhecimento de transporte.               ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
					*/
					        
					/*
					If SA2->A2_L_CTRC == "S"
						//³ Baixa o titulo incluido atraves do evento lido.                                                    ³
						BaixaSE2(oObj,nSldFrt,ZL8->ZL8_PREFIX,cNroTit,cParcTit,"NDF",ZL8->ZL8_PREFIX,cSeekZLF)
						//³ Baixa no titulo de valor bruto do Fretista o valor da baixa do evento.                             ³
						BaixaSE2(oObj,nSldFrt,cXPrefix,cXNum,cXParc,"NF ","")
					Else
						//³ Baixa o titulo incluido atraves do evento lido.                                                    ³
						BaixaSE2(oObj,nSldFrt,ZL8->ZL8_PREFIX,cNroTit,cParcTit,"NDF",ZL8->ZL8_PREFIX,cSeekZLF)
						//³ Baixa no titulo de valor bruto do Fretista o valor da baixa do evento.                             ³
						BaixaSE2(oObj,nSldFrt,cPrefixo,cNroTit,cParcFret,"NF ","")
					EndIf
					*/
					
					//³ Baixa o titulo incluido atraves do evento lido.                                                    ³
					BaixaSE2(oObj,nSldFrt,ZL8->ZL8_PREFIX,cNroTit,cParcTit,"NDF",ZL8->ZL8_PREFIX,cSeekZLF,_cFilEvent)
					//³ Baixa no titulo de valor bruto do Fretista o valor da baixa do evento.                             ³
					BaixaSE2(oObj,nSldFrt,cPrefixo,cNroTit,cParcFret,"NF ","","",_cFilEvent)
					
					cParcTit   := SOMA1(cParcTit)
					nSldFrt -= nSldFrt         
					
					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³ Grava o valor baixado na ZLF (baixa parcial) by Fabiano Dias em 17/03/10                                                      ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
                	altZLF(cSeekZLF,nSldFrt,nVlrEvto,nVlrEvto,ALLTRIM(ZL8->ZL8_DESCRI),xFILIAL("SE2")+ZL8->ZL8_PREFIX+cNroTit+cParcTit+"NDF"+SA2->A2_COD+SA2->A2_LOJA)
					
				EndIf
			Else
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Grava um registro na ZLF de Debito referente ao valor do evento lido.                              ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				GrvZLF(ZL8->ZL8_COD,nVlrEvto,"PREVISAO",.F.,SA2->A2_L_LI_RO,0,0,CtoD(""),"",0,0)
			EndIf
		EndIf
	EndIf
	
	(cArqTmp)->(dbSkip())
EndDo

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("FIM - Acerto Evento - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Apaga arquivo temporario.         ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea(cArqTmp)
DbCloseArea(cArqTmp)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(2,_aArea,_aAlias)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ActFinanc ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para realizar o Acerto Financeiro(Gera Ctas a Pagar)³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpO01 - Objeto da Regua de processamento.                 ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT011()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function ActFinanc(oObj)
                                   
Local cArqTmp1 := cGLTalias+"4"
Local cArqTmp2 := cGLTalias+"5"
Local _aArea   := {}
Local _aAlias  := {}
Local nTotReg  := 0
Local nCont    := 1
Local nSldTit  := 0
Local nJurTit  := 0
Local nVlrBx   := 0
Local cSeekZLF := ""
Local cMyLinha := GetFrtLin(ZL2->ZL2_COD,SA2->A2_COD,SA2->A2_LOJA)// obtem linha do setor

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Efetua o backup da filial corrente.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Local _cBkpFil := cFilAnt

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³  Salva a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL2","ZL8","ZLF","SF1","SD1","SX1"})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("INICIO - Acerto Financeiro - " + SA2->A2_COD + "/" + SA2->A2_LOJA)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cria tabela temporaria com os dados dos Eventos(ZL8) para filtrar posteriormente o SE2. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
MsgRun("Aguarde.... Filtrando dados dos Eventos...",,{||CursorWait(), MGLT5QRY("4"), CursorArrow()})

DbSelectArea(cArqTmp1)
DbGoTop()

While (cArqTmp1)->(!Eof())
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Cria tabela temporaria com os dados do SE2 filtrados a partir do prefixo informado no Evento(ZL8). ³
	//³ Este filtro segue a ordem de prioridade informada no ZL8_PRIORI.                                   ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	MsgRun("Aguarde.... Filtrando dados do Contas a Pagar...",,{||CursorWait(), MGLT5QRY( "5",(cArqTmp1)->ZL8_PREFIX ) , CursorArrow()})
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Atualiza a regua de processamento.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If oObj <> Nil
		nTotReg := nReg
		nCont   := 1
		oObj:SetRegua2(nTotReg)
	Endif
	
	DbSelectArea(cArqTmp2)
	DbGoTop()
	
	While (cArqTmp2)->(!Eof())
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Atualiza a regua de processamento.³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		If oObj <> Nil
			oObj:IncRegua2("Financeiro - Tarefa "+Alltrim(Str(nCont))+" de "+Alltrim(Str(nTotReg)))
			nCont++
		Endif     
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Adicionado por Fabiano Dias no dia 31/05/12.                        ³
		//³Posiciona na filial correta para calculo do valor da baixa do titulo³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
//		cFilAnt:= (cArqTmp2)->E2_FILIAL       
		
		SM0->(dbSetOrder(1))   // forca o indice na ordem certa
		SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt)) 
		
		DbSelectArea("SE2")
		SE2->(DbSetOrder(1))//E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA
		If SE2->(DbSeek(xFILIAL("SE2")+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+(cArqTmp2)->E2_FORNECE+(cArqTmp2)->E2_LOJA))
		
		//Comentado por Fabiano Dias da Silva no dia 15/05/10 alinhamento feito junto ao Tiago         
		//nSldTit := SaldoTit((cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO,;
		//(cArqTmp2)->E2_NATUREZ,"P",(cArqTmp2)->E2_FORNECE,1,If((cArqTmp2)->E2_MOEDA<>1,dDataBase,dDtBase),,(cArqTmp2)->E2_LOJA,,Nil)  
		
		nSldTit := SE2->E2_SALDO+SE2->E2_SDACRES-SE2->E2_SDDECRE
		         		
		/*
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Codigo fonte comentado por Fabiano Dias no dia: 18/04/12,          ³
		//³pois foi constatado que o valor do juros que estava sendo calculado³
		//³pela funcao FaJuros estava sendo cobrado acima de quando por       ³
		//³exemplo se solicitava para fazer uma baixa manual do titulo        ³
		//³no financerio a funcao fa080Juros ja calcula corretamente.         ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		*/
		/*                                       T
		nJurTit := FaJuros((cArqTmp2)->E2_VALOR,(cArqTmp2)->E2_SALDO,STOD((cArqTmp2)->E2_VENCTO),(cArqTmp2)->E2_VALJUR,(cArqTmp2)->E2_PORCJUR,;
		(cArqTmp2)->E2_MOEDA,STOD((cArqTmp2)->E2_EMISSAO),dDataBase,(cArqTmp2)->E2_TXMOEDA,STOD((cArqTmp2)->E2_BAIXA))
		*/
		
		nJurTit  := fa080Juros()
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Valor a ser baixado no titulo sem o juros e acrescimos porque o sigaauto ja calcula. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		//Comentado por Fabiano Dias da Silva no dia 15/05/10
		//nVlrBx  := ( nSldTit + (cArqTmp2)->E2_DECRESC ) - (cArqTmp2)->E2_ACRESC
		nVlrBx  := ( nSldTit + nJurTit)
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Valor do titulo considerando juros, usado para gravar na ZLF e baixar do saldo do Fretista. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		nSldTit := nSldTit + nJurTit
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Se o saldo do Fretista for maior que zero, baixa os titulos no SE2.³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

		If nSldFrt > 0

			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Se o saldo do Fretista menos o saldo do titulo maior ou igual a zero, baixa o SE2.³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			If ( nSldFrt - nSldTit ) >= 0

				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Grava registro na ZLF, com o valor do saldo do titulo.  ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				If cTipoAct == "Definitivo"
					cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,xFILIAL("SE2")+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA,.T.,cMyLinha,SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES)
				Else
					cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,"PREVISAO",.T.,cMyLinha,SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES)
				EndIf
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Descresce o saldo do Fretista.                          ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				nSldFrt -= nSldTit
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Se o acerto eh definitivo baixa o titulo no SE2.        ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				If cTipoAct == "Definitivo"
				
					/*
					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³Comentado por Fabiano Dias no dia 12/03/12, pois a ESPECIFICO³
					//³nao trabalha com conhecimento de transporte.               ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
					*/
				
					/*
					if SA2->A2_L_CTRC == "S"
						//³ Baixa os titulos de convenio, emprestimo, adiantamentos e antecipacoes. ³
						BaixaSE2(oObj,nVlrBx,(cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO,(cArqTmp1)->ZL8_PREFIX,cSeekZLF)
						//³ Baixa no titulo de valor bruto do Fretista o valor das baixas dos emprestimos, adiantamentos, etc. ³
						BaixaSE2(oObj,nSldTit,cXPrefix,cXNum,cXParc,cXTipo,"")
					else
						//³ Baixa os titulos de convenio, emprestimo, adiantamentos e antecipacoes. ³
						BaixaSE2(oObj,nVlrBx,(cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO,(cArqTmp1)->ZL8_PREFIX,cSeekZLF)
						//³ Baixa no titulo de valor bruto do Fretista o valor das baixas dos emprestimos, adiantamentos, etc. ³
						BaixaSE2(oObj,nSldTit,cPrefixo,cNroTit,cParcFret,"NF ","")
					endif
					*/     
					
					//³ Baixa os titulos de convenio, emprestimo, adiantamentos e antecipacoes. ³
					BaixaSE2(oObj,nVlrBx,(cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO,(cArqTmp1)->ZL8_PREFIX,cSeekZLF,(cArqTmp2)->E2_FILIAL,nJurTit)
					//³ Baixa no titulo de valor bruto do Fretista o valor das baixas dos emprestimos, adiantamentos, etc. ³
					BaixaSE2(oObj,nVlrBx,cPrefixo,cNroTit,cParcFret,"NF ","","",_cFilEvent)
					
				EndIf
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Se o saldo do Fretista menos o saldo do titulo eh menor que zero, faz baixa parcial. ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			Else
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Grava registro na ZLF, com o valor do saldo do titulo mesmo fazendo baixa parcial.  ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				If cTipoAct == "Definitivo"
					//cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,xFILIAL("SE2")+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA,.T.,cMyLinha)
					cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldFrt,xFILIAL("SE2")+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA,.T.,cMyLinha,SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES)
				Else                     										
					cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldFrt,"PREVISAO",.T.,cMyLinha,SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES)
				EndIf
						 
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Valor a ser baixado parcialmente no titulo. ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				nVlrBx := nSldFrt
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Se o acerto eh definitivo e a situacao do evento eh de baixa parcial do titulo qdo na ha saldo suficiente. ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				If cTipoAct == "Definitivo" //.And. (cArqTmp1)->ZL8_SITUAC == 'B' 
				
					//³ Baixa os titulos de convenio, emprestimo, adiantamentos e antecipacoes. ³
					BaixaSE2(oObj,nVlrBx,(cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO,(cArqTmp1)->ZL8_PREFIX,cSeekZLF,(cArqTmp2)->E2_FILIAL,nJurTit)
					
					/*
					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³Comentado por Fabiano Dias no dia 12/03/12, pois a ESPECIFICO³
					//³nao trabalha com conhecimento de transporte.               ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
					*/
					/*
					if SA2->A2_L_CTRC == "S"
						//³ Baixa NO titulo gerado pela nota do Fretista, o valor das baixas dos emprestimos, adiantamentos, etc. ³
						BaixaSE2(oObj,nVlrBx,cXPrefix,cXNum,cXParc,cXTipo,"")
					else
						//³ Baixa NO titulo gerado pela nota do Fretista, o valor das baixas dos emprestimos, adiantamentos, etc. ³
						BaixaSE2(oObj,nVlrBx,cPrefixo,cNroTit,cParcFret,"NF ","")
					endif
					*/       
					
					//³ Baixa NO titulo gerado pela nota do Fretista, o valor das baixas dos emprestimos, adiantamentos, etc. ³
					BaixaSE2(oObj,nVlrBx,cPrefixo,cNroTit,cParcFret,"NF ","","",_cFilEvent)					
                	
					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³ Descresce o saldo do Fretista.                          ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
					nSldFrt -= nSldFrt
					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³ Se o acerto eh definitivo e a situacao do evento eh de Delecao do titulo qdo na ha saldo suficiente para baixalo. ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				ElseIf cTipoAct == "Definitivo" //.And. (cArqTmp1)->ZL8_SITUAC == 'D' // .AND.  SA2->A2_L_CTRC != "S"
					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³ Deleta o titulo de convenio quando nao ha saldo suficiente para paga-lo. ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
					//DeletaSE2(oObj,(cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO)
				EndIf
			EndIf
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Se o saldo do Fretista esta zerado, NAO baixa os titulos no SE2.   ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		Else
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Mesmo nao baixando o SE2 grava na ZLF o debito que o Fretista possui. ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			If cTipoAct == "Definitivo"
				//GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,xFILIAL("SE2")+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA,.T.,cMyLinha)
			Else
				GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,"PREVISAO",.T.,cMyLinha,SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES)
			EndIf
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Se o acerto eh definitivo e a situacao do evento eh de Delecao do titulo qdo na ha saldo suficiente para baixalo. ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			
			If cTipoAct == "Definitivo" //.And. (cArqTmp1)->ZL8_SITUAC == 'D'
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Deleta o titulo de convenio quando nao ha saldo suficiente para paga-lo. ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				//DeletaSE2(oObj,(cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO)
			EndIf			
			
		EndIf
		
		EndIf
		
		(cArqTmp2)->(DbSkip())
	EndDo
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Apaga arquivo temporario.         ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	DbSelectArea(cArqTmp2)
	DbCloseArea(cArqTmp2)
	
	(cArqTmp1)->(DbSkip())
EndDo                    

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Restaura a filial corrente antes do processo.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cFilAnt:= _cBkpFil      

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt)) 

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("FIM - Acerto Financeiro - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Apaga arquivo temporario.         ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
DbSelectArea(cArqTmp1)
DbCloseArea(cArqTmp1)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(2,_aArea,_aAlias)

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
±±³ Uso      ³ MGLT011()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function MGLT5QRY(cOpc,cPrefSE2)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Declaracao de variavies locais. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Local cQry   := ""
Local lSqlOk := .T.

Local _cGRANEL 	:= ""//U_GETRELA1("1","ZL1_GRANEL") //#LETRAS

DEFAULT cPrefSE2 := ""

Do Case
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Deleta os registros gerados na ZLF pela rotina de Acerto.   ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Case cOpc == "0"
		cQry := "DELETE FROM"
		cQry += " "+RETSQLNAME("ZLF")
		cQry += " WHERE D_E_L_E_T_ = ' '"
		cQry += " AND ZLF_FILIAL = '" + xFilial("ZLF") + "'"
		cQry += " AND ZLF_CODZLE = '" + cCodMIX        + "'"
		cQry += " AND ZLF_VERSAO = '" + cVersao        + "'"
		cQry += " AND ZLF_ORIGEM =  'F'" //So deleta originados pela rotina do Acerto
		cQry += " AND ZLF_ACERTO <> 'S'" //Deleta se nao realizou acerto definitivo
		cQry += " AND ZLF_TP_MIX = 'F' " //Deleta apenas registros do Frete
		
		If !Empty(cSetores) //Se o parametro com os setores estiver vazio considera todos.
			cQry += " AND ZLF_SETOR IN (" + U_AjustSet(cSetores) + ")"
		EndIf
		
		lSqlOk := !(TCSqlExec(cQry) < 0) 				
		
		If !lSqlOk
			xMagHelpFis("NAO CONFORMIDADE 07 - NO DELETE",;
						TcSqlError(),;
						"Verifique a Sintaxe da Query de DELETE.")
		EndIf
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Filtra os Fretistaes do MIX para iniciar o processamento.   ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Case cOpc == "1"
		cQry := "SELECT ZLF_RETIRO,ZLF_RETILJ,ZLF_SETOR,"
		cQry += " SUM(CASE WHEN ZL8_DEBCRE = 'C'"
		cQry += "        THEN ZLF_TOTAL"
		cQry += "        Else 0"
		cQry += "     END) AS CREDITO,"
		cQry += " SUM(CASE WHEN ZL8_DEBCRE = 'D'"
		cQry += "        THEN ZLF_TOTAL"
		cQry += "        Else 0"
		cQry += "     END) AS DEBITO"
		cQry += " FROM "+RetSqlName("ZLF")+" ZLF, "+RetSqlName("ZL8")+" ZL8"
		cQry += " JOIN "+RetSqlName("SA2")+" SA2 ON ZLF.ZLF_RETIRO = SA2.A2_COD AND ZLF.ZLF_RETILJ = SA2.A2_LOJA " //#LETRAS
		cQry += " WHERE ZLF.D_E_L_E_T_ = ' '"
		cQry += " AND ZL8.D_E_L_E_T_ = ' '"
		cQry += " AND SA2.D_E_L_E_T_ = ' '" //#LETRAS
		cQry += " AND SA2.SA2_FILIAL = '" + xFilial("SA2")	+ "'" //#LETRAS
		cQry += " AND ZLF.ZLF_FILIAL = '"       + xFILIAL("ZLF") + "'"
		cQry += " AND ZL8.ZL8_FILIAL = '"       + xFILIAL("ZL8") + "'"
		If !Empty(cSetores) //Se o parametro com os setores estiver vazio considera todos.
			cQry += " AND ZLF.ZLF_SETOR IN ("   + U_AjustSet(cSetores) + ")"
		EndIf
		cQry += " AND ZLF.ZLF_RETIRO BETWEEN '"  + cFreteDe + "' AND '" + cFreteAte + "'"
		cQry += " AND ZLF.ZLF_RETILJ BETWEEN '" + cLojaDe  + "' AND '" + cLojaAte  + "'"
		cQry += " AND ZLF.ZLF_CODZLE = '" + cCodMIX + "'"
		cQry += " AND ZLF.ZLF_VERSAO = '" + cVersao + "'"
		cQry += " AND SUBSTRING(ZLF.ZLF_RETIRO,1,1) = 'T'" //#LETRAS
		//cQry += " AND SA2.A2_C_TPFOR IN " + U_ajusSQL(_cGRANEL) + " " //#LETRAS
		cQry += " AND ZLF.ZLF_ORIGEM <> 'F'" //Origem Fechamento
		cQry += " AND ZLF.ZLF_ACERTO <> 'S'" //Nao foi feito acerto
		cQry += " AND ZLF.ZLF_STATUS = 'P'" //Somente os fretista que estejam aprovados
		cQry += " AND ZLF.ZLF_TP_MIX = 'F'"  //Tipo do Mix para Frete
		cQry += " AND ZLF.ZLF_EVENTO = ZL8.ZL8_COD"
		//cQry += " AND (ZL8.ZL8_SB1COD <> ' ' OR ZL8.ZL8_PREFIX <> ' ')" //Os dois campos nao podem estar preenchidos ao mesmo tempo
		cQry += " GROUP BY ZLF_RETIRO,ZLF_RETILJ,ZLF_SETOR"
		cQry += " ORDER BY ZLF_SETOR,ZLF_RETIRO,ZLF_RETILJ"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To nReg
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Acerto Manual(Le ZLF e gera e baixa SE2). ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Case cOpc == "2"
		cQry := "SELECT ZLF_EVENTO AS EVENTO,ZLF_TOTAL AS TOTAL,ZLF_SEQ FROM "
		cQry += RetSqlName("ZLF")+" ZLF "
		cQry += " JOIN "+RetSqlName("SA2")+" SA2 ON ZLF.ZLF_RETIRO = SA2.A2_COD AND ZLF.ZLF_RETILJ = SA2.A2_LOJA " //#LETRAS
		cQry += " WHERE ZLF.D_E_L_E_T_ = ' '"
		cQry += " AND SA2.D_E_L_E_T_ = ' '" //#LETRAS
		cQry += " AND SA2.SA2_FILIAL = '" + xFilial("SA2")	+ "'" //#LETRAS
		cQry += " AND ZLF.ZLF_FILIAL = '" + xFILIAL("ZLF")+ "'"
		
		//Acrescentado por Fabiano Dias para que se possa no acerto manual pegar somente do setor informado para que nao tenha problema de baixar erradamente quando um fretista atuar em dois setores
		If !Empty(cSetores) //Se o parametro com os setores estiver vazio considera todos.
			cQry += " AND ZLF.ZLF_SETOR IN (" + U_AjustSet(cSetores) + ")"
		EndIf
		
		cQry += " AND ZLF.ZLF_CODZLE = '" + cCodMIX      + "'"
		cQry += " AND ZLF.ZLF_VERSAO = '" + cVersao      + "'"
		cQry += " AND ZLF.ZLF_RETIRO  = '" + SA2->A2_COD  + "'"
		cQry += " AND ZLF.ZLF_RETILJ = '" + SA2->A2_LOJA + "'"
		cQry += " AND SUBSTRING(ZLF.ZLF_RETIRO,1,1) = 'P'"
		//cQry += " AND SA2.A2_C_TPFOR IN " + U_ajusSQL(_cGRANEL) + " " //#LETRAS
		cQry += " AND ZLF.ZLF_ORIGEM = 'M' "  // M-Gerado no Mix
		cQry += " AND ZLF.ZLF_DEBCRE = 'D'" // DEBITOS
		cQry += " AND ZLF.ZLF_ACERTO <> 'S'" //Nao foi realizado acerto
		cQry += " AND ZLF.ZLF_TP_MIX = 'F'"  //L para Mix de Leite, F para Mix de Frete
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To nReg
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Acerto Eventos Automaticos.       ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Case cOpc == "3"
		cQry := "SELECT ZL8_COD FROM " + RetSqlName("ZL8")
		cQry += " WHERE D_E_L_E_T_ = ' '"
		cQry += " AND ZL8_FILIAL = '"  + xFILIAL("ZL8") + "'"
		cQry += " AND ZL8_TPEVEN = 'A'"
		cQry += " AND ZL8_DEBCRE = 'D'"   
		cQry += " AND ZL8_PERTEN IN " + U_ajusSQL(_cGRANEL) + " "  //#LETRAS
		cQry += " AND ZL8_PREFIX <> ' '"
		cQry += " ORDER BY ZL8_PRIORI"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To nReg
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Acerto Financeiro - Eventos( 1 de 2 ). ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Case cOpc == "4"
		cQry := "SELECT ZL8_COD,ZL8_DESCRI,ZL8_PREFIX FROM " + RetSqlName("ZL8")
		cQry += " WHERE D_E_L_E_T_ = ' '"
		cQry += " AND ZL8_FILIAL = '" + xFILIAL("ZL8") + "'"
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Comentado por Fabiano Dias no dia 04/06/12 pois pode ocorrer       ³
		//³de se efetuar um debito ao fornecedor na funcao acertoMix e o      ³
		//³produtor nao tiver saldo para finalizar o seu pagamento no proximo ³
		//³fechamento ou na funcao acertoFinanceiro e acertoLoja tem que ser  ³
		//³pago este debito.                                                  ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		//cQry += " AND ZL8_TPEVEN = 'F'"
		cQry += " AND ZL8_DEBCRE = 'D'"
		cQry += " AND ZL8_PREFIX <> ' '"

		cQry += " ORDER BY ZL8_PRIORI"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To nReg
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Acerto Financeiro - Titulos( 2 de 2 ).  ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Case cOpc == "5"
		cQry := "SELECT E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO,E2_FORNECE,E2_LOJA,E2_SALDO,E2_VENCTO,E2_NATUREZ,E2_MOEDA,"
		cQry += " E2_VALOR,E2_VALJUR,E2_PORCJUR,E2_EMISSAO,E2_TXMOEDA,E2_BAIXA,E2_DECRESC,E2_ACRESC FROM " + RetSqlName("SE2")
		cQry += " WHERE D_E_L_E_T_ = ' '" 
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Comentado por Fabiano Dias no dia 13/06/12 para que fossem      ³
		//³considerados titulos em aberto de outras filiais que não fossem ³
		//³somente da filial de fechamento.                                ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		//cQry += " AND E2_FILIAL = '"  + xFilial("SE2")+ "'"
		cQry += " AND E2_PREFIXO = '"  + cPrefSE2      			+ "'"
		cQry += " AND E2_TIPO = 'NDF'"
		cQry += " AND E2_SALDO   > 0"          
		cQry += " AND E2_EMISSAO <= '" + DtoS(ZLE->ZLE_DTFIM) 	+ "'"
		cQry += " AND E2_VENCTO <= '"  + cVencto       			+ "'"
		cQry += " AND E2_FORNECE = '"  + SA2->A2_COD   			+ "'"
		cQry += " AND E2_LOJA    = '"  + SA2->A2_LOJA  			+ "'"
		 
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³O codigo abaixo foi comentado por Fabiano Dias no dia 13/06/12,  ³
		//³pois nao havera a necessidade de se verificar o setor ou a filial³
		//³tudo ficara armazenado na tabela SE5 para cancelamentos.         ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		/*
		If !Empty(cSetores) //Se o parametro com os setores estiver vazio considera todos.
			cQry += " AND E2_L_SETOR IN (" + U_AjustSet(cSetores) + ")" // adic. por abrahao em 15/06/09
		Endif                                               
		*/
		
		/*
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Alterado por Fabiano Dias no dia 12/03/12 para que fossem baixados   ³
		//³os titulos com vencimento primeiro por questoes de cobranca de juros.³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		*/
		//cQry += " ORDER BY E2_SALDO,E2_VENCTO"     		
		cQry += " ORDER BY E2_VENCTO"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To nReg
EndCase

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ DeletaSE2³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Inclui titulo no contas a pagar via SigaAuto.              ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ Nenhum.                                                    ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ GENERICO                                                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function DeletaSE2(oObj,cPrefixo,cNroTit,cParcela,cTipo)

Local nModAnt := nModulo
Local cModAnt := cModulo
Local nValor  := 0

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se o titulo existe na base.  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("SE2")
dbSetOrder(1)
If dbSeek(xFILIAL("SE2")+cPrefixo+cNroTit+cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA)
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Armazena o valor do titulo de convenio do Fretista para subtrair do titulo do convenio. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	nValor := SE2->E2_VALOR
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Array com os dados a serem passados para o SigaAuto. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	aAutoSE2:={{"E2_PREFIXO",SE2->E2_PREFIXO,Nil},;
	{"E2_NUM"    ,SE2->E2_NUM    ,Nil},;
	{"E2_TIPO"   ,SE2->E2_TIPO   ,Nil},;
	{"E2_PARCELA",SE2->E2_PARCELA,Nil},;
	{"E2_NATUREZ",SE2->E2_NATUREZ,Nil},;
	{"E2_FORNECE",SA2->A2_COD    ,Nil},;
	{"E2_LOJA"   ,SA2->A2_LOJA   ,Nil}}
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Altera o modulo para Financeiro, senao o SigaAuto nao executa.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	nModulo := 6
	cModulo := "FIN"
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Roda SigaAuto de Exclusao de Titulos a Pagar. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	MSExecAuto({|x,y,z| Fina050(x,y,z)},aAutoSE2,.T.,5)
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Restaura o modulo em uso. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	nModulo := nModAnt
	cModulo := cModAnt
	
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se houve erro no SigaAuto, caso haja mostra o erro. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If lMsErroAuto
	lDeuErro := .T.
	oObj:SaveLog("ERRO 04 - SIGAAUTO EXCLUSAO TITULO")
	xMagHelpFis("NAO CONFORMIDADE 08 - EXCLUSAO - TITULO NAO EXCLUIDO",;
	"O titulo "+xFILIAL("SE2")+cPrefixo+cNroTit+cParcela+cTipo+;
	" não foi excluido! Fretista: "+SA2->A2_COD+"/"+SA2->A2_LOJA+"-"+SA2->A2_NOME,;
	"Verifique no financeiro se este titulo ja foi baixado ou o motivo pelo qual não pode ser excluído."+;
	" Ao confimar esta tela, sera apresentada a tela do SigaAuto, que possui informações mais detalhadas.")
	Mostraerro()
Else  
	
	/*
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Comentado por Fabiano Dias no dia 12/03/12, pois nao existira a³
	//³necessidade do codigo fonte abaixo.                            ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	*/
	/*
	_cUpdate := " UPDATE " + RetSqlName("ZLL")
	_cUpdate += " SET ZLL_STATUS = 'S'"
	_cUpdate += " WHERE D_E_L_E_T_ = ' '"
	_cUpdate += " AND ZLL_FILIAL   = '" + xFilial("SE2") + "'"
	_cUpdate += " AND ZLL_COD      = '" + SubStr(cNroTit,1,6) + "'"
	_cUpdate += " AND ZLL_SEQ      = '" + SubStr(cNroTit,7,3) + "'"
	_cUpdate += " AND ZLL_RETIRO   = '" + SA2->A2_COD  + "'"
	_cUpdate += " AND ZLL_RETILJ   = '" + SA2->A2_LOJA + "'"
	lSqlOk := !(TCSqlExec(_cUpdate) < 0)
	
	If !lSqlOk
		lDeuErro := .T.
		oObj:SaveLog("ERRO 05 - UPDATE ZLL")
		xMagHelpFis("NAO CONFORMIDADE 09 - UPDATE DO STATUS DA ZLL",;
		TcSqlError(),;
		"Não Conformidade ao executar o Update de gravacao do Status do Convenio! "+;
		"Não confirme esta mensagem e informe ao Suporte Técnico.")
	EndIf
	
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Tratamento para subtrair do Titulo NF o valor do titulo NDF de convenio que foi deletado. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	dbSelectArea("SE2")
	dbSetOrder(1)
	If dbSeek(xFILIAL("SE2")+ cPrefConv +(SubStr(cNroTit,1,6)+"000")+cVersao+"NF "+SA2->A2_COD+SA2->A2_LOJA)
		If SE2->E2_SALDO == SE2->E2_VALOR
			RecLock("SE2",.F.)
			SE2->E2_VALOR  := SE2->E2_VALOR - nValor
			SE2->E2_SALDO  := SE2->E2_VALOR - nValor
			SE2->E2_VLCRUZ := SE2->E2_VALOR - nValor
			MsUnlock()
		Else
			lDeuErro := .T.
			oObj:SaveLog("ERRO 06 - ALTERA VALOR TITULO")
			xMagHelpFis("NAO CONFORMIDADE 10 - ALTERA VALOR TITULO",;
			"O titulo NF do Convenio ja foi baixado.",;
			"Não confirme esta mensagem e informe ao Suporte Técnico.")
		EndIf
	EndIf   
	*/
EndIf

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ IncluiSE2³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Inclui titulo no contas a pagar via SigaAuto.              ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ Nenhum.                                                    ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ GENERICO                                                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function IncluiSE2(oObj,nVlrTit,cPrefixo,cNroTit,cParcela,cTipo,cHistori,cSeek,cNatz)

Local nModAnt  		:= nModulo
Local cModAnt  		:= cModulo
Local aAutoSE2 		:= {}
Local lNoExist 		:=.T.

Local _dbkpData     := dDataBase

//Local cEntrg   := U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,dDataBase)//Filial de entrega da linha do produtor

Private lMsErroAuto	:= .F.
Private lMsHelpAuto	:= .T.

DEFAULT cSeek 		:= ""
DEFAULT cNatz 		:= ""
                    
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Todos os titulo incluidos na tabela SE2 devem ser incluidos no ultimo dia     ³
//³referente ao intervalo de fechamento do mix, isto se faz necessario pelo fato ³
//³das baixas serem realizadas no ultimo dia de pagamento para calculo de juros. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dDataBase:= ZLE->ZLE_DTFIM

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se o titulo ja existe na base, para nao duplicar. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("SE2")
SE2->(dbSetOrder(1))
If SE2->(dbSeek(xFILIAL("SE2")+cPrefixo+cNroTit+cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA))

	xMagHelpFis("NAO CONFORMIDADE 11 - TITULO DUPLICADO",;
				"O titulo "+xFILIAL("SE2")+cPrefixo+cNroTit+cParcela+cTipo+SE2->E2_FORNECE+SE2->E2_LOJA+;
				" ja existe para o Fretista "+SA2->A2_COD+"\"+SA2->A2_LOJA,;
				"Verifique no financeiro porque ja existe um titulo com estas caracteristicas e exclua-o.")
	lDeuErro := .T.
	oObj:SaveLog("ERRO 07 - TITULO DUPLICADO")
	lNoExist:=.F.             
	
	If MsgYesNo("Deseja gerar o titulo como nova parcela?")
		cParcela:=soma1(cParcela)
		cTamParc:=cParcela
		lNoExist:=.T.
		lDeuErro:=.F.
	EndIf
	
EndIf

If lNoExist
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Obtem natureza do cadastro de Eventos (by Abrahao)   ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If Len(ALLTRIM(cNatz)) > 0
	
		cNatureza:=cNatz
				
		/*
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Caso contrario obtem natureza do cadastro do fornecedor.³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		*/
		Else 
		
			cNatureza:= SA2->A2_NATUREZ
		
	EndIf
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Array com os dados a serem passados para o SigaAuto. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	aAutoSE2:={;
	{"E2_PREFIXO",cPrefixo       		,Nil},;
	{"E2_NUM"    ,cNroTit        		,Nil},;
	{"E2_TIPO"   ,cTipo          		,Nil},;
	{"E2_PARCELA",cParcela       		,Nil},;
	{"E2_NATUREZ",cNatureza     		,Nil},;
	{"E2_FORNECE",SA2->A2_COD    		,Nil},;
	{"E2_LOJA"   ,SA2->A2_LOJA   		,Nil},;
	{"E2_EMISSAO",dDataBase      		,Nil},;
	{"E2_VENCTO" ,CTOD(cDiaPgto) 		,Nil},;
	{"E2_VENCREA",CTOD(cDiaPgto) 		,Nil},;
	{"E2_HIST"   ,cHistori       		,Nil},;
	{"E2_VALOR"  ,nVlrTit        		,Nil},;
	{"E2_PORCJUR",0		           		,Nil},;
	{"E2_DATALIB",dDataBase      		,Nil},;
	{"E2_USUALIB",ALLTRIM(cUserName)	,Nil},;
	{"E2_L_LINRO",""             		,Nil},;
	{"E2_L_SETOR",ZL2->ZL2_COD   		,Nil},;
	{"E2_L_MIX"  ,cCodMIX        		,Nil},;
	{"E2_L_VERSA",cVersao        		,Nil},;
	{"E2_L_TPPAG",SA2->A2_L_TPPAG		,Nil},;
	{"E2_L_SITUA","I"            		,Nil},;
	{"E2_L_SEEK" ,cSeek          		,Nil}}
	//{"E2_L_FLALE",cEntrg         ,Nil}}
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Altera o modulo para Financeiro, senao o SigaAuto nao executa.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	nModulo := 6
	cModulo := "FIN"
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Roda SigaAuto de inclusao de Titulos a Pagar. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	MSExecAuto({|x,y| Fina050(x,y)},aAutoSE2,3)
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Restaura o modulo em uso. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	nModulo := nModAnt
	cModulo := cModAnt
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Verifica se houve erro no SigaAuto, caso haja mostra o erro. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If lMsErroAuto            
	
		lDeuErro := .T.
		oObj:SaveLog("ERRO 08 - SIGAAUTO INCLUSAO TITULO") 
		
		xMagHelpFis("INFORMAÇÃO",;
					"Erro na inclusão do título: " + cNroTit + '\' + cParcela + ' Prefixo\Tipo: '+ cPrefixo + '\' + cTipo + "do Produtor: " + SA2->A2_COD + '\' + SA2->A2_LOJA,;
					"Favor copiar esta mensagem e informar ao departamento de informática")
		
		Mostraerro()
	
		Else	
	
			dbSelectArea("SE2")
			SE2->(dbSetOrder(1))
			If SE2->(dbSeek(xFILIAL("SE2")+cPrefixo+cNroTit+cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA))
			
				RecLock("SE2",.F.)
				//SE2->E2_L_BANCO	:= SA2->A2_CONTA - Alterado por Fabiano Dias - Deve ser o banco e nao a conta contabil
				SE2->E2_L_BANCO	:= SA2->A2_BANCO
				SE2->E2_L_AGENC := SA2->A2_AGENCIA
				SE2->E2_L_CONTA	:= SA2->A2_NUMCON
				
				SE2->(MsUnlock())
				
			EndIf   	
	EndIf	
	
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Restaura a database antes de iniciar o processo de inclusao do titulo.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dDataBase:= _dbkpData     

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ BaixaSE2 ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Baixa titulo no contas a pagar via SigaAuto.               ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ Nenhum.                                                    ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ GENERICO                                                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function BaixaSE2(oObj,nVlrBx,cPrefixo,cNroTit,cParcela,cTipo,cConvPref,cSeek,_cFil,_nJuros)

Local nModAnt      := nModulo
Local cModAnt      := cModulo
//Local lConven    := ALLTRIM(cPrefixo) == ALLTRIM(GetMv("LT_CONVPRE"))//Veririca se eh convenio externo

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Efetua o backup da filial corrente.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Local _cBkpFil     := cFilAnt  

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

DEFAULT cConvPref  := ""
DEFAULT cSeek      := ""    
DEFAULT _nJuros    := 0

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Inserido por Fabiano Dias no dia 30-05-12 para que seja      ³
//³possicionado na filial correta para efetuar a baixa do titulo³
//³uma vez que podem existir convenios em uma filial diferente  ³
//³da filial de fechamento.                                     ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cFilAnt:= _cFil                             

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt)) 

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Tratamento para liberar o titulo para baixa no financeiro. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("SE2")
SE2->(dbSetOrder(1))
If SE2->(dbSeek(xFILIAL("SE2")+cPrefixo+cNroTit+cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA))
	If Empty(SE2->E2_DATALIB)//Se nao foi liberado ainda        
	
		RecLock("SE2",.F.)
		
			SE2->E2_DATALIB := dDataBase
			SE2->E2_USUALIB := ALLTRIM(cUserName)
		
		MsUnLock()
		
	EndIf
EndIf

aTitulo := {;
{"E2_PREFIXO"  ,cPrefixo	  ,Nil},;
{"E2_NUM"	   ,cNroTit	      ,Nil},;
{"E2_PARCELA"  ,cParcela      ,Nil},;
{"E2_TIPO"	   ,cTipo         ,Nil},;
{"E2_FORNECE"  ,SA2->A2_COD   ,Nil},;
{"E2_LOJA"	   ,SA2->A2_LOJA  ,Nil},;
{"AUTBANCO"    ,""            ,Nil},;
{"AUTAGENCIA"  ,""            ,Nil},;
{"AUTCONTA"    ,""            ,Nil},;
{"AUTCHEQUE"   ,""            ,Nil},;
{"AUTMOTBX"	   ,cMotBaixa     ,Nil},;
{"AUTDTBAIXA"  ,dDataBase	  ,Nil},;
{"AUTDTCREDITO",dDataBase 	  ,Nil},;
{"AUTBENEF"    ,SA2->A2_COD+" - "+ALLTRIM(SA2->A2_NOME),Nil},;
{"AUTHIST"	   ,cHistFrt      ,Nil},;
{"AUTVLRPG"    ,nVlrBx        ,Nil }}

/*
If cTipo <> "NDF"

	AADD( aTitulo, { "AUTVLRPG"  	, nVlrBx   		, Nil } )	// 18     
	  
	Else
	    AADD( aTitulo, { "AUTVLRPG"  	, nVlrBx + _nJuros  , Nil } )	// 18  
EndIf
*/


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Altera o modulo para Financeiro, senao o SigaAuto nao executa.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
nModulo := 6
cModulo := "FIN"

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ SigaAuto de Baixa de Contas a Pagar. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
MSExecAuto({|x,y| Fina080(x,y)},aTitulo,3)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura o modulo em uso. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
nModulo := nModAnt
cModulo := cModAnt

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se houve erro no SigaAuto, caso haja mostra o erro. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If lMsErroAuto
	lDeuErro := .T.
	oObj:SaveLog("ERRO 09 - SIGAAUTO BAIXA")
	xMagHelpFis("NAO CONFORMIDADE 12 - SIGAAUTO BAIXA TITULO",;
				"Existe uma não conformidade no SigaAuto de Baixa de Contas a Pagar!",;
				xFilial("SE2")+cPrefixo+cNroTit+;
				cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA+;
				"     <-  Copie essas informações para voce pesquisar no Contas a Pagar o titulo que esta com não conformidade. "+;
				"Após confirmar esta tela, sera apresentada a tela de Não Conformidade do SigaAuto.")
	MostraErro()
Else      

	//Para que no momento de cancelamento de fechamento nao ocorra cancelamente de baixas indevidas
	_lRet:= U_atualizSE5(cCodMIX,cVersao,ZL2->ZL2_COD,cPrefixo,cTipo,cNroTit,cParcela,SA2->A2_COD,SA2->A2_LOJA,cMotBaixa,nVlrBx)         
	
	If !_lRet
	                 
		lDeuErro := .T.
		//if lNovoLayout
		oObj:SaveLog("ERRO - UPDATE E5_L_SEEK") 
		//endif
		xMagHelpFis("NAO CONFORMIDADE - UPDATE DO CAMPO E5_L_SEEK",;
					"Não Conformidade ao executar o Update de gravacao do campo E5_L_SEEK! ",;
					xFilial("SE2")+cPrefixo+cNroTit+cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA+;
	   				"<-  Copie essas informações para voce pesquisar no Contas a Pagar o titulo que esta com não conformidade.")  
	   
		Else	   	   		
	
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Grava o codigo do MIX no Contas a Pagar. ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³Codigo comentado por Fabiano Dias no dia 31/05/12 pois            ³
			//³um mesmo titulo pode sofrer baixas de dois fechamentos ficando    ³
			//³incorreto esta referencia, para tanto foi criado um campo SE5 para³
			//³armazenar estas informacoes.                                      ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			
			/*		
			_cUpdate := " UPDATE " + RetSqlName("SE2")
			If !Empty(cSeek)
				_cUpdate += " SET E2_L_MIX = '"+cCodMIX+"', E2_L_VERSA = '"+cVersao+"', E2_L_SEEK = '"+cSeek+"'"
			Else
				_cUpdate += " SET E2_L_MIX = '"+cCodMIX+"', E2_L_VERSA = '"+cVersao+"'"
			EndIf
			_cUpdate += " WHERE D_E_L_E_T_ = ' '"
			_cUpdate += " AND E2_FILIAL    = '" + xFilial("SE2") + "'"
			_cUpdate += " AND E2_PREFIXO   = '" + cPrefixo 		  + "'"
			_cUpdate += " AND E2_NUM       = '" + cNroTit 		  + "'"
			_cUpdate += " AND E2_PARCELA   = '" + cParcela 		  + "'"
			_cUpdate += " AND E2_TIPO      = '" + cTipo 		  + "'"
			_cUpdate += " AND E2_FORNECE   = '" + SA2->A2_COD    + "'"
			_cUpdate += " AND E2_LOJA      = '" + SA2->A2_LOJA   + "'"
			lSqlOk := !(TCSqlExec(_cUpdate) < 0)
			
			If !lSqlOk
				lDeuErro := .T.
				oObj:SaveLog("ERRO 10 - UPDATE E2_L_MIX")
				xMagHelpFis("NAO CONFORMIDADE 13 - UPDATE DO COD. MIX",;
				TcSqlError(),;
				"Não Conformidade ao executar o Update de gravacao do cod. MIX no E2_MIX! "+;
				"Não confirme esta mensagem e informe ao Suporte Técnico.")
			EndIf 
			*/
	
	EndIf
	   	
	/*
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³O codigo abaixo foi comentado por Fabiano Dias no dia 12/03/12,³
	//³pois na nova rotina de convenio ao efetuar uma baixa o valor   ³
	//³baixado do convenio ja eh atualizado na tabela de convenio.    ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	*/
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Se for um titulo originado do Convenio entao seta como Pago              ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	/*
	If lConven
		_cUpdate := " UPDATE " + RetSqlName("ZLL")
		_cUpdate += " SET ZLL_STATUS = 'P'"
		_cUpdate += " WHERE D_E_L_E_T_ = ' '"
		_cUpdate += " AND ZLL_FILIAL   = '" + xFilial("SE2") + "'"
		_cUpdate += " AND ZLL_COD      = '" + SubStr(cNroTit,1,6) + "'"
		_cUpdate += " AND ZLL_SEQ      = '" + SubStr(cNroTit,7,3) + "'"
		_cUpdate += " AND ZLL_RETIRO   = '" + SA2->A2_COD  + "'"
		_cUpdate += " AND ZLL_RETILJ   = '" + SA2->A2_LOJA + "'"
		lSqlOk := !(TCSqlExec(_cUpdate) < 0)
		
		If !lSqlOk
			lDeuErro := .T.
			oObj:SaveLog("ERRO 11 - UPDATE ZLL")
			xMagHelpFis("NAO CONFORMIDADE 14 - UPDATE DO STATUS DA ZLL",;
			TcSqlError(),;
			"Não Conformidade ao executar o Update de gravacao do Status do Convenio! "+;
			"Não confirme esta mensagem e informe ao Suporte Técnico.")
		EndIf
	EndIf
	*/
	
EndIf          

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Restaura a filial corrente antes do processo.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cFilAnt:= _cBkpFil 

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt)) 

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ GrvZLF   ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para gravar registros na tabela ZLF.                ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpC01 - Codigo do Evento.                                 ³±±
±±³          ³ ExpN02 - Valor do Evento.                                  ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ GENERICO                                                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GrvZLF(cEvento,nValor,cSeek,lGrvZLF,cpLinha,nSE2VLR,nSE2SLD,dSE2VEN,cSE2HIS,nSE2JUR,nSE2ACRES)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Efetua o backup da filial corrente.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Local _cBkpFil      := cFilAnt      
Local _cSeekRet     := ""
Local cSeq 			:= ""

DEFAULT cSeek := ""

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Posiciona na filial de fechamento para gravacao ou alteracao³
//³de um determinado evento.                                   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cFilAnt:= _cFilEvent          

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt)) 

cSeq := LastZLF()

dbSelectArea("ZL8")
ZL8->(dbSetOrder(1))//ZL8_FILIAL+ZL8_COD
ZL8->(dbSeek(xFILIAL("ZL8")+cEvento))


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona na ZLF para verificar se ja existe um registro para o mesmo evento.                     ³
//³ Se existir e a variavel lGrvZLF estiver como .T., ele grava um novo registro para o mesmo evento. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("ZLF")
ZLF->(dbSetOrder(1))//ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_RETIRO+ZLF_RETILJ+ZLF_EVENTO+ZLF_SEQ
//dbSeek(xFILIAL("ZLF")+cCodMIX+cVersao+SA2->A2_COD+SA2->A2_LOJA,.T.)
If ZLF->(dbSeek(xFILIAL("ZLF")+cCodMIX+cVersao+SA2->A2_COD+SA2->A2_LOJA+cEvento))
//If ZLF->(ZLF_FILIAL+ZLF_CODZLE+cVersao+ZLF_RETIRO+ZLF_RETILJ+ZLF_EVENTO) == xFILIAL("ZLF")+cCodMIX+cVersao+SA2->A2_COD+SA2->A2_LOJA+cEvento
	
	If lGrvZLF
				
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Alimenta as variaveis de memoria.                                      ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		RegToMemory("ZLF",.F.)
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Gravacao dos dados.                                                    ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		dbSelectArea("ZLF")
		RecLock("ZLF",.T.)
		For nContador := 1 To FCount()
			If ("FILIAL" $ FieldName(nContador) )
				FieldPut(nContador,xFilial("ZLF"))
			ElseIf ("EVENTO" $ FieldName(nContador) )
				FieldPut(nContador,cEvento)
			ElseIf ("DCREVE" $ FieldName(nContador) )
				FieldPut(nContador,ZL8->ZL8_DESCRI) 
			ElseIf ("ENTMIX" $ FieldName(nContador) )
				FieldPut(nContador,ZL8->ZL8_MIX)	
			ElseIf ("QTDBOM" $ FieldName(nContador) )
				FieldPut(nContador,0)
			ElseIf ("QTDACI" $ FieldName(nContador) )
				FieldPut(nContador,0)
			ElseIf ("VLRLTR" $ FieldName(nContador) )
				FieldPut(nContador,0)
			ElseIf ("TOTAL" $ FieldName(nContador) )
				FieldPut(nContador,nValor)
			ElseIf ("DEBCRE" $ FieldName(nContador) )
				FieldPut(nContador,"D")
			ElseIf ("ORIGEM" $ FieldName(nContador) )
				FieldPut(nContador,"F")
			ElseIf ("L_SEEK" $ FieldName(nContador) )
				FieldPut(nContador,cSeek)
			ElseIf ("SEQ" $ FieldName(nContador) )
				FieldPut(nContador,cSeq)
			ElseIf ("SETOR" $ FieldName(nContador) )
				FieldPut(nContador,ZL2->ZL2_COD)
			ElseIf ("DCRSET" $ FieldName(nContador) )
				FieldPut(nContador,ZL2->ZL2_DESCRI)
			ElseIf ("LINROT" $ FieldName(nContador) .and. !empty(cpLinha) )
				FieldPut(nContador,cpLinha)
			ElseIf ("SE2VLR" $ FieldName(nContador))//Incluido por Fabiano no dia 12/03/12
				FieldPut(nContador,nSE2VLR )
			ElseIf ("SE2SLD" $ FieldName(nContador))//Incluido por Fabiano no dia 12/03/12
				FieldPut(nContador,nSE2SLD )
			ElseIf ("SE2VEN" $ FieldName(nContador))//Incluido por Fabiano no dia 12/03/12
				FieldPut(nContador,dSE2VEN )
			ElseIf ("SE2HIS" $ FieldName(nContador))//Incluido por Fabiano no dia 12/03/12
				FieldPut(nContador,cSE2HIS )
			ElseIf ("SE2JUR" $ FieldName(nContador))//Incluido por Fabiano no dia 12/03/12
				FieldPut(nContador,nSE2JUR )				                              
			ElseIf ("SE2ACR" $ FieldName(nContador))//Incluido por Fabiano no dia 12/03/12
				FieldPut(nContador,nSE2ACRES )					
			Else
				FieldPut(nContador,M->&(FieldName(nContador)))
			EndIf
		Next nContador
		ZLF->(MsUnlock())
	EndIf
Else
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Posiciona na ZLF para obter dados para gerar um novo registro na propria ZLF.             ³
	//³ O novo registro criado possui os mesmos valores nos campos, exceto para os campos abaixo. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	
	dbSelectArea("ZLF")
	ZLF->(dbSetOrder(1))//ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_RETIRO+ZLF_RETILJ+ZLF_EVENTO+ZLF_SEQ
	//dbSeek(xFILIAL("ZLF")+cCodMIX+cVersao+SA2->A2_COD+SA2->A2_LOJA,.T.)
	If ZLF->(dbSeek(xFILIAL("ZLF")+cCodMIX+cVersao+SA2->A2_COD+SA2->A2_LOJA))
	//If ZLF->(ZLF_FILIAL+ZLF_CODZLE+cVersao+ZLF_RETIRO+ZLF_RETILJ) == xFILIAL("ZLF")+cCodMIX+cVersao+SA2->A2_COD+SA2->A2_LOJA
						
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Alimenta as variaveis de memoria.                                      ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		RegToMemory("ZLF",.F.)
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Gravacao dos dados.                                                    ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		dbSelectArea("ZLF")
		RecLock("ZLF",.T.)
		For nContador := 1 To FCount()
			If ("FILIAL" $ FieldName(nContador) )
				FieldPut(nContador,xFilial("ZLF"))
			ElseIf ("EVENTO" $ FieldName(nContador) )
				FieldPut(nContador,cEvento)
			ElseIf ("DCREVE" $ FieldName(nContador) )
				FieldPut(nContador,ZL8->ZL8_DESCRI)
			ElseIf ("ENTMIX" $ FieldName(nContador) )
				FieldPut(nContador,ZL8->ZL8_MIX)	
			ElseIf ("QTDBOM" $ FieldName(nContador) )
				FieldPut(nContador,0)
			ElseIf ("QTDACI" $ FieldName(nContador) )
				FieldPut(nContador,0)
			ElseIf ("VLRLTR" $ FieldName(nContador) )
				FieldPut(nContador,0)
			ElseIf ("TOTAL" $ FieldName(nContador) )
				FieldPut(nContador,nValor)
			ElseIf ("DEBCRE" $ FieldName(nContador) )
				FieldPut(nContador,"D")
			ElseIf ("ORIGEM" $ FieldName(nContador) )
				FieldPut(nContador,"F")
			ElseIf ("L_SEEK" $ FieldName(nContador) )
				FieldPut(nContador,cSeek)
			ElseIf ("SEQ" $ FieldName(nContador) )
				FieldPut(nContador,cSeq)
			ElseIf ("SETOR" $ FieldName(nContador) )
				FieldPut(nContador,ZL2->ZL2_COD)
			ElseIf ("DCRSET" $ FieldName(nContador) )
				FieldPut(nContador,ZL2->ZL2_DESCRI)
			ElseIf ("LINROT" $ FieldName(nContador) .and. !empty(ALLTRIM(cpLinha)) )
				FieldPut(nContador,cpLinha)                        
			ElseIf ("SE2VLR" $ FieldName(nContador))//Incluido por Fabiano no dia 12/03/12
				FieldPut(nContador,nSE2VLR )
			ElseIf ("SE2SLD" $ FieldName(nContador))//Incluido por Fabiano no dia 12/03/12
				FieldPut(nContador,nSE2SLD )
			ElseIf ("SE2VEN" $ FieldName(nContador))//Incluido por Fabiano no dia 12/03/12
				FieldPut(nContador,dSE2VEN )
			ElseIf ("SE2HIS" $ FieldName(nContador))//Incluido por Fabiano no dia 12/03/12
				FieldPut(nContador,cSE2HIS )
			ElseIf ("SE2JUR" $ FieldName(nContador))//Incluido por Fabiano no dia 12/03/12
				FieldPut(nContador,nSE2JUR )	
			ElseIf ("SE2ACR" $ FieldName(nContador))//Incluido por Fabiano no dia 12/03/12
				FieldPut(nContador,nSE2ACRES )								
			Else				
				FieldPut(nContador,M->&(FieldName(nContador)))
			EndIf
		Next nContador
		ZLF->(MsUnlock())
	Else
		lDeuErro := .T.
		oObj:SaveLog("ERRO 12 - Fretista "+ALLTRIM(SA2->A2_COD+SA2->A2_LOJA) )
		xMagHelpFis("NAO CONFORMIDADE 15 - Fretista nao encontrado",;
					"Fretista "+ALLTRIM(SA2->A2_COD+SA2->A2_LOJA)+" não encontrado no MIX!",;
					"Nao serão gerados eventos no MIX para esse Fretista")
	EndIf
EndIf             

_cSeekRet:=  xFILIAL("ZLF") + cCodMIX + cVersao + SA2->A2_COD + SA2->A2_LOJA + cEvento + cSeq            

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Restaura a filial corrente antes do processo.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cFilAnt:= _cBkpFil                          

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt)) 

Return _cSeekRet 

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ LastZLF  ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para retornar o ultimo sequencial + 1 da ZLF.       ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ Nenhum.                                                    ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ GENERICO                                                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function LastZLF()

Local cSeq := ""
Local cQry := ""

cQry := "SELECT MAX(ZLF_SEQ) AS COD FROM " + RetSqlName("ZLF")
cQry += " WHERE D_E_L_E_T_ = ' '"
cQry += " AND ZLF_FILIAL = '" +xFILIAL("ZLF")+ "'"
cQry += " AND ZLF_CODZLE = '" + cCodMIX      + "'"
cQry += " AND ZLF_VERSAO = '" + cVersao      + "'"
cQry += " AND ZLF_RETIRO  = '" + SA2->A2_COD  + "'"
cQry += " AND ZLF_RETILJ = '" + SA2->A2_LOJA + "'"
TCQUERY cQry NEW ALIAS "GLT99"
dbSelectArea("GLT99")

If GLT99->(!Eof())
	cSeq := SOMA1(GLT99->COD)
EndIf

dbSelectArea("GLT99")
dbCloseArea("GLT99")

Return(cSeq)

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
±±ºPrograma  ³getTitCTR ºAutor  ³Abrahao             º Data ³  09/04/09   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Mostra uma lista de selecao dos titulos existentes no       º±±
±±º          ³financeiro do fretista corrente                             º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Codigo e Loja do Fretista                                  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Verdadeiro se algum titulo foi selecionado                 º±±
±±º          ³ Os campos cXPrefix,cXNum,cXParc,cXTipo devem ser           º±±
±±º          ³ preenchidos para Localizar o titulo a ser compensado.      º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function getTitCTR(cCod,cLoja)

Local xAlias := GetNextAlias()
Local lret   := .F.
Local aDados := {}
Local Item   := 0

Private nSelItem:=0
Private oBrt

cXPrefix  := ALLTRIM(GETMV("LT_PRFCTR")) // Prefixo do Titulo do CTRC

cQuery := " SELECT E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO,E2_LOJA,E2_VALOR,E2_FORNECE,E2_LOJA,E2_EMISSAO "
cQuery += " FROM  "+RETSQLNAME("SE2")+" SE2 "
cQuery += " WHERE d_e_l_e_t_ = ' ' "
cQuery += " AND E2_FILIAL = '"+XFILIAL("SE2")+"' "
cQuery += " AND E2_FORNECE = '"+cCod+"' "
cQuery += " AND E2_LOJA = '"+cLoja+"' "
cQuery += " AND E2_TIPO = '"+cXTipo+"' "
cQuery += " AND E2_VENCTO <= '"+cVencto+"' "
cQuery += " AND E2_VALOR > 0 "
cQuery += " AND E2_PREFIXO IN ("+GetSQLSeq(cXPrefix,"/")+") "
cQuery += " ORDER BY E2_EMISSAO DESC "
TCQUERY cQuery NEW ALIAS(xAlias)

dbSelectArea(xAlias)

While (xAlias)->(!Eof())
	Item++
	Aadd(aDados,{Item,(xAlias)->E2_PREFIXO,(xAlias)->E2_NUM,(xAlias)->E2_TIPO,StoD((xAlias)->E2_EMISSAO),(xAlias)->E2_VALOR})
	(xAlias)->(dbSkip())
EndDo

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Tela de Selecao do CTRC                                             ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
DEFINE MSDIALOG oDlg FROM 0,0 TO 220,415 PIXEL TITLE 'Selecao do CTRC'
@007,005 say "Fretista: "+cCod+"-"+cLoja+"-"+left(SA2->A2_NOME,20)+" "+TRANSFORM(nSldFrt,"@E 999,999,999.99") Pixel Of oDlg

// Mostra Selecao da NF
oBrT := VCBrowse():New(020,001,210,70,,{'Item','Prefixo','Numero','Tipo','Emissao','Valor'},{20,30,30,30,30,30}, oDlg, ,,,,{||},,,,,,,.F.,,.T.,,.F.,,, )
oBrT:SetArray(aDados)
If len(aDados) > 0
	oBrT:bLine := {||{;
	aDados[oBrT:nAt,01],;
	aDados[oBrT:nAt,02], ;
	aDados[oBrT:nAt,03], ;
	aDados[oBrT:nAt,04], ;
	aDados[oBrT:nAt,05], ;
	transform(aDados[oBrT:nAt,06],"@E 999,999,999,999.99") } }
	oBrT:bLDblClick := {|| nSelItem:=aDados[oBrT:nAt][1] }
EndIf

TButton():New(095,005, 'Confirmar', oDlg,{|| nSelItem:=aDados[oBrT:nAt][1],close(oDlg) },40,10,,,,.T.)
TButton():New(095,060, 'Nenhum', oDlg,{|| Close(oDlg) },40,10,,,,.T.)
ACTIVATE MSDIALOG oDlg CENTERED

(xAlias)->(dbGoTop())
nItem:=0
While (xAlias)->(!Eof())
	nItem++
	If nItem == nSelItem
		dbSelectArea("SE2")
		dbSetOrder(1)//E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA
		If dbSeek(XFILIAL("SE2")+(xAlias)->E2_PREFIXO+(xAlias)->E2_NUM+(xAlias)->E2_PARCELA+(xAlias)->E2_TIPO+(xAlias)->E2_FORNECE+(xAlias)->E2_LOJA)
			
			cXNum := SE2->E2_NUM
			cXPrefix:= SE2->E2_PREFIXO
			cXParc:= SE2->E2_PARCELA
			nXValor:= SE2->E2_SALDO
			
			lRet := .T.
			RecLock("SE2",.F.)
			SE2->E2_L_MIX   := cCodMix
			SE2->E2_L_SETOR := ZL2->ZL2_COD
			SE2->E2_L_BANCO := SA2->A2_BANCO
			SE2->E2_L_AGENC := SA2->A2_AGENCIA
			SE2->E2_L_CONTA := SA2->A2_NUMCON
			SE2->E2_DATALIB := dDataBase
			SE2->E2_USUALIB := ALLTRIM(cUserName)
			MsUnlock()
			
		EndIf
	EndIf
	(xAlias)->(dbSkip())
EndDo
(xAlias)->(dbcloseArea())

Return lRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³GetSQLSeq ºAutor  ³Microsiga           º Data ³  09/30/09   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Converte string com separador em formatcao IN para SQL     º±±
±±º          ³ DE: 1;2;3;   PARA: ('1','2','3')                           º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ cValores - String                                          º±±
±±ºParametros³ cChar    - Caracter separador                              º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GetSQLSeq(cValores,cChar)

Local aAux := {}
Local cRet := ""
Local nP   := 0

aAux:=strtokarr(cValores,cChar)
For nP := 1 To Len(aAux)
	cRet += "'"+aAux[nP]+"'"
	If nP != Len(aAux)
		cRet+=","
	EndIf
Next nP

Return(cRet)


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  GetFrtLin  ºAutor  ³Abrahao             º Data ³       /2009 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Obtem uma linha que Fretista tenha movimentado             º±±
±±º          ³ de um setor especifico.                                    º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GetFrtLin(xSetor,xFornece,xLoja)

Local cRet  := ""
Local oAlias:= GetNextAlias()

cQuery:=" SELECT ZLF_LINROT FROM "+RETSQLNAME("ZLF")+" ZLF "
cQuery+=" WHERE D_E_L_E_T_ = ' ' "
cQuery+=" AND ZLF_CODZLE  = '" + cCodMix  + "' "
cQuery+=" AND ZLF_VERSAO  = '" + cVersao  + "' "
cQuery+=" AND ZLF_RETIRO   = '" + xFornece + "' "
cQuery+=" AND ZLF_RETILJ  = '" + xLoja    + "' "
cQuery+=" AND ZLF_SETOR   = '" + xSetor   + "' "
cQuery+=" AND ZLF_DEBCRE  = 'C' "
cQuery+=" GROUP BY ZLF_LINROT "  

DbUseArea(.T.,"TOPCONN",TCGENQRY(,,ALLTRIM(UPPER(CQUERY))),oAlias,.T.,.F.)

dbSelectArea(oAlias)            
(oAlias)->(dbGoTop())

If (oAlias)->(!Eof())
	cRet:=(oAlias)->ZLF_LINROT
EndIf

dbSelectArea(oAlias)
(oAlias)->(DbCloseArea())

Return(cRet)


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

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Comentado por Fabiano Dias e Elisa Junia no dia 13/07/12 para que              ³
//³a previsao nao fosse mais utilizada nas rotinas de fechamento do leite, pois   ³
//³no produtor nao seria possivel utilizar a previsao, desta forma padronizamos as³
//³rotinas de fechamento do pagamento do leite.                                   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

/*
aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o tipo do Acerto. No modo      ')
Aadd( aHelpPor, 'Previsao serao gerados somente os      ')
Aadd( aHelpPor, 'eventos(ZLF), ja no modo Definitivo,   ')
Aadd( aHelpPor, 'serao gerados titulos no financeiro,   ')
Aadd( aHelpPor, 'Nota Fiscal, baixa de titulos e eventos')
Aadd( aHelpSpa, 'Informe o tipo do Acerto. No modo      ')
Aadd( aHelpSpa, 'Previsao serao gerados somente os      ')
Aadd( aHelpSpa, 'eventos(ZLF), ja no modo Definitivo,   ')
Aadd( aHelpSpa, 'serao gerados titulos no financeiro,   ')
Aadd( aHelpSpa, 'Nota Fiscal, baixa de titulos e eventos')
Aadd( aHelpEng, 'Informe o tipo do Acerto. No modo      ')
Aadd( aHelpEng, 'Previsao serao gerados somente os      ')
Aadd( aHelpEng, 'eventos(ZLF), ja no modo Definitivo,   ')
Aadd( aHelpEng, 'serao gerados titulos no financeiro,   ')
Aadd( aHelpEng, 'Nota Fiscal, baixa de titulos e eventos')
U_xPutSx1(cPerg,"01","Tipo do Acerto?","Tipo do Acerto?","Tipo do Acerto?","mv_ch1","C",1,0,0,"C",'',"","","","MV_PAR01","Previsao","","","","Definitivo","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
*/

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpPor, 'zado para o Fechamento.                ')
Aadd( aHelpPor, 'ATENCAO: Escolha um MIX aberto e com   ')
Aadd( aHelpPor, 'periodo correto.                       ')
Aadd( aHelpSpa, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpSpa, 'zado para o Fechamento.                ')
Aadd( aHelpSpa, 'ATENCAO: Escolha um MIX aberto e com   ')
Aadd( aHelpSpa, 'periodo correto.                       ')
Aadd( aHelpEng, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpEng, 'zado para o Fechamento.                ')
Aadd( aHelpEng, 'ATENCAO: Escolha um MIX aberto e com   ')
Aadd( aHelpEng, 'periodo correto.                       ')
U_xPutSx1(cPerg,"01","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch1","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_01","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

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
U_xPutSx1(cPerg,"02","Versao do MIX ?","Versao do MIX ?","Versao do MIX ?","mv_ch2","C",1,0,0,"G",,,"","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe os codigos dos setores a serem ')
Aadd( aHelpPor, 'considerados no Acerto. Se deixado em  ')
Aadd( aHelpPor, 'branco, serao considerados todos.      ')
Aadd( aHelpSpa, 'Informe os codigos dos setores a serem ')
Aadd( aHelpSpa, 'considerados no Acerto. Se deixado em  ')
Aadd( aHelpSpa, 'branco, serao considerados todos.      ')
Aadd( aHelpEng, 'Informe os codigos dos setores a serem ')
Aadd( aHelpEng, 'considerados no Acerto. Se deixado em  ')
Aadd( aHelpEng, 'branco, serao considerados todos.      ')
U_xPutSx1(cPerg,"03","Acerto do Setor?","Acerto do Setor?","Acerto do Setor?","mv_ch3","C",60,0,0,"G",'VAZIO().OR.SUBSTR(MV_PAR03,LEN(ALLTRIM(MV_PAR03)),1)=="/"',"U_F302","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Fretista para ser  ')
Aadd( aHelpPor, 'considerado no Acerto. Vc pode informar')
Aadd( aHelpPor, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpPor, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpPor, 'considerar apenas este Fretista.       ')
Aadd( aHelpSpa, 'Informe o Codigo do Fretista para ser  ')
Aadd( aHelpSpa, 'considerado no Acerto. Vc pode informar')
Aadd( aHelpSpa, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpSpa, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpSpa, 'considerar apenas este Fretista.       ')
Aadd( aHelpEng, 'Informe o Codigo do Fretista para ser  ')
Aadd( aHelpEng, 'considerado no Acerto. Vc pode informar')
Aadd( aHelpEng, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpEng, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpEng, 'considerar apenas este Fretista.       ')
U_xPutSx1(cPerg,"04","Fretista de?","Fretista de?","Fretista de?","mv_ch4","C",6,0,0,"G",,"SA2_L1","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Fretista para ser  ')
Aadd( aHelpPor, 'considerado no Acerto.                 ')
Aadd( aHelpSpa, 'Informe o Codigo do Fretista para ser  ')
Aadd( aHelpSpa, 'considerado no Acerto.                 ')
Aadd( aHelpEng, 'Informe o Codigo do Fretista para ser  ')
Aadd( aHelpEng, 'considerado no Acerto.                 ')
U_xPutSx1(cPerg,"05","Fretista Ate?","Fretista Ate?","Fretista Ate?","mv_ch5","C",6,0,0,"G",,"SA2_L1","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Fretista.  ')
Aadd( aHelpSpa, 'Informe o Codigo da Loja do Fretista.  ')
Aadd( aHelpEng, 'Informe o Codigo da Loja do Fretista.  ')
U_xPutSx1(cPerg,"06","Loja de?","Loja de?","Loja de?","mv_ch6","C",4,0,0,"G",,"","","","MV_PAR06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Fretista.  ')
Aadd( aHelpSpa, 'Informe o Codigo da Loja do Fretista.  ')
Aadd( aHelpEng, 'Informe o Codigo da Loja do Fretista.  ')
U_xPutSx1(cPerg,"07","Loja Ate?","Loja Ate?","Loja Ate?","mv_ch7","C",4,0,0,"G",,"","","","MV_PAR07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Dia de pagamento do Fretista.')
Aadd( aHelpPor, 'Este dia sera considerado na data de   ')
Aadd( aHelpPor, 'vencimento do titulo gerado para o     ')
Aadd( aHelpPor, 'Fretista.                              ')
Aadd( aHelpSpa, 'Informe o Dia de pagamento do Fretista.')
Aadd( aHelpSpa, 'Este dia sera considerado na data de   ')
Aadd( aHelpSpa, 'vencimento do titulo gerado para o     ')
Aadd( aHelpSpa, 'Fretista.                              ')
Aadd( aHelpEng, 'Informe o Dia de pagamento do Fretista.')
Aadd( aHelpEng, 'Este dia sera considerado na data de   ')
Aadd( aHelpEng, 'vencimento do titulo gerado para o     ')
Aadd( aHelpEng, 'Fretista.                              ')
U_xPutSx1(cPerg,"08","Dia de Pagamento","Dia de Pagamento","Dia de Pagamento","mv_ch8","C",2,0,0,"G","","","","","MV_PAR08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ altZLF   | Autor ³ Fabiano Dias da Silva º Data da Criacao  ³ 13/03/2012                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Altera o valor do registro na ZLF informando os valores que foram baixados.                                  º±±
±±º          ³ 															                               				        º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Fechamento do Leite.            						                                                        º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ cSeek     -> Seek para encontrar o registro do evento na ZLF													º±±
±±º			 ³ nVlrBx    -> Valor que foi baixado do evento         								          				º±±
±±º			 ³ _nValor   -> Valor original do evento		         								          				º±±
±±º			 ³ _nSaldo   -> Saldo do evento         			 									          				º±±
±±º			 ³ _cHistoric-> Historico					         									          				º±±
±±º			 ³ _SeekFin  -> Armazena dados para identificacao do titulo no financeiro.				          				º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nada       	  							                    	           									º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ Microsiga                                                                                					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite.                                                                        						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                                                  ³                                  ³   	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function AltZLF(cSeek,nVlrBx,_nValor,_nSaldo,_cHistoric,_SeekFin)

	DbselectArea("ZLF")
	ZLF->(dbsetorder(1))
	If ZLF->(dbseek(cSeek))   
	
		RecLock("ZLF",.f.)
		
		ZLF->ZLF_TOTAL  := nVlrBx
		ZLF->ZLF_VLRLTR := ZLF->ZLF_TOTAL/ZLF->ZLF_QTDBOM   
		ZLF->ZLF_SE1VLR	:= _nValor
		ZLF->ZLF_SE1SLD := _nSaldo
		ZLF->ZLF_SE1HIS := _cHistoric 
		ZLF->ZLF_L_SEEK := _SeekFin
		
		ZLF->(MsUnlock())    
		
	endif	

return