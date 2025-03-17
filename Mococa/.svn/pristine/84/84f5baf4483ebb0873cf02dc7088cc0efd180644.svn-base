#INCLUDE "PROTHEUS.ch"
#INCLUDE "TOPCONN.ch"
#DEFINE _ENTER CHR(13)+CHR(10)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ MGLT010  º Autor ³ TOTVS                 º Data da Criacao  ³ 14/10/2008                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Rotina desenvolvida para possibilitar o CANCELAMENTO do Acerto do Leite junto aos produtores.                º±±
±±º          ³                        									                               				        º±±
±±º          ³                        									                               				        º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ CANCELAMENTO do Fechamento do Leite.            						                                        º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Nenhum						   							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum						  							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ Microsiga                                                                                					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite.                                                                        						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³00/00/0000³                               				   ³00-000000 -                       ³ TI	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function MGLT010

Local cPerSetor   := ""
Local bProcess    := {|oSelf| MGLT5Exec(oSelf)}
Local oTProces

Local _cBkpFil	  := cFilAnt

Private _cTpNF	  := AllTrim(GetMv("LT_ESPECIE"))//Armazena a especie das notas fiscais dos produtores

Private _lNfe	  := .F.
Private _cPerg     := "MGLT010"
Private _cMes      := SubStr(DTOS(ADDMes(dDataBase,1)),5,2)
Private _cAno      := SubStr(DTOS(ADDMes(dDataBase,1)),1,4)
//Private cVencto   := _cAno+_cMes+AllTrim(GetMv("LT_VENCTO"))//Dia de vencimento dos titulos
Private cDiaPgto  := ""
Private cHist     := "GLT "+_cMes+"/"+_cAno
Private _dDtBase   := dDatabase+7500
Private cGLTalias := GetNextAlias() //"GLT" //Nome do alias para as tabelas temporarias
Private lDeuErro  := .F.
Private _nReg      := 0
Private nSldPro   := 0
Private cNroNota  := ""
Private cCodSetor := ""
Private cCodMIX   := ""
Private _cVersao   := ""
Private cSetores  := ""
Private cProdDe   := ""
Private cProdAte  := ""
Private cLojaDe   := ""
Private cLojaAte  := ""
Private cRotaDe   := ""
Private cRotaAte  := ""
Private cConvenio := ""
Private cEmpresti := ""
Private cAdiantam := ""
Private _cSerie	  := Padr(AllTrim(GETMV("LT_SERIE")) ,TamSx3("F1_PREFIXO")[1]) // Serie da NF
Private _cPrefixo := ""
//Private cMultNota := AllTrim(GETMV("LT_MULTNF")) //S para uma Nota por Produtor; N para uma Nota por Municipio
Private cMultNota := ""
Private cMotBaixa := AllTrim(GETMV("LT_MOTBX"))  //Motivo de baixa utilizado para a rotina do Leite
//Private cFornece  := SubStr(GetMv("LT_FORNEC"),1,6)
//Private cLojaFor  := SubStr(GetMv("LT_FORNEC"),7,4)
Private cOrigem   := ""
Private dZLEIni   := Ctod("")
Private dZLEFim   := Ctod("")

Private _cTpTribut:= ""

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

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atribui valor a variaveis comuns a todas as Funcoes.                ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cCodMIX   := MV_PAR01
_cVersao   := MV_PAR02
cSetores  := AllTrim(MV_PAR03)
cProdDe   := MV_PAR04
cProdAte  := MV_PAR05
cLojaDe   := MV_PAR06
cLojaAte  := MV_PAR07
cRotaDe   := "      "//MV_PAR08
cRotaAte  := "ZZZZZZ"//MV_PAR09
cHist     += "-"+cCodMIX+"/"+_cVersao

Private _cGrupoDe  	:= mv_par08
Private _cGrupoAte 	:= mv_par09


//***********************************
// Redefinindo variaveis
//***********************************
If _lNfe
	_cMes      := SubStr(DTOS( dDataBase ),5,2)
	_cAno      := SubStr(DTOS( dDataBase ),1,4)
EndIf

cDiaPgto  := ""
cHist     := "GLT "+_cMes+"/"+_cAno
_dDtBase   := dDatabase+7500


If cProdDe < cProdAte
	If !MsgYesNo(_ENTER+_ENTER;
		+_ENTER+"  FOI INDICADO UM INTERVALO COM MAIS DE UM PRODUTOR"+_ENTER;
					  +"ESTE PROCESSO IRA CANCELAR AS NOTAS FISCAIS GERADAS!!!"+_ENTER;
		+_ENTER+_ENTER+"	TEM CERTEZA QUE DESEJA CONTINUAR???	","::::: ATENCAO!!! :::::")			  
		Return()
	EndIf
EndIf



//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se os parametros estao em branco.                          ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If Empty(cCodMIX)
	xMagHelpFis("PARAMETRO MIX VAZIO",;
	"O parametro Codigo do MIX nao foi informado.",;
	"Preencha nos parametros o codigo do MIX")
	Return()
EndIf

If Empty(_cVersao)
	xMagHelpFis("PARAMETRO VERSAO VAZIO",;
	"O parametro Versao do MIX nao foi informado.",;
	"Preencha nos parametros a Versao do MIX")
	Return()
EndIf

If Val(_cVersao) > 1
	xMagHelpFis("PARAMETRO VERSAO INCORRETO",;
	"O parametro Versao do MIX nao pode ser diferente de 1.",;
	"Escolha um MIX na versao 1.")
	Return()
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se existem Mix 2o Fechamento encerrados, se sim nao permite    ³
//³ executar o cancelamento do Acerto, tem que cancelar todos os Mix antes. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If VldMix2()
	xMagHelpFis("MIX 2o ACERTO",;
	"Existem MIX do 2o Acerto ja encerrados, logo o MIX do 1o Acerto não pode ser cancelado.",;
	"Cancele todos os MIX versão superior a 1, para depois cancelar o MIX versão 1.")
	Return()
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se o usuario tem permissao para executar a rotina de Acerto.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("ZLU")
ZLU->(dbSetOrder(1))
If ZLU->(dbSeek(xFilial("ZLU")+U_UCFG001(2)))
	
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
cTexto := "ATENÇÃO - CANCELAMENTO LEITE - "+_ENTER
cTexto += " "+_ENTER
cTexto += " "+_ENTER
cTexto += "ESTA ROTINA FARA O CANCELAMENTO DO LEITE."+_ENTER
cTexto += " "+_ENTER
cTexto += " "+_ENTER
cTexto += "TODOS OS TITULOS E NOTAS SERÃO DELETADOS."+_ENTER

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Sintaxe da tNewProcess():New( cFunction, cTitle, bProcess, cDescription, _cPerg, aInfoCustom) ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oTProces := tNewProcess():New("MGLT010","CANCELAMENTO DO LEITE",bProcess,cTexto,_cPerg)

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
±±³Funcao    ³MGLT5Exec ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para chamar as rotinas de CANCELAMENTO do Acerto.   ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpO01 - Objeto da Regua de processamento.                 ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT010()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function MGLT5Exec(oObjProc)

Local cFunc  		:= "1" //Codigo da Qry a ser executada
Local _cArqTmp		:= cGLTalias+cFunc
Local nCont  		:= 1
Local nProd  		:= 0
Local lTitExc 		:= .F.
Local lNFExc  		:= .F.

Local _lNoAcerto 	:= .F.
Local _lYesAcert 	:= .F.

Local cHoraIni  	:= Time()

Local lContinue     := .T.

Local _cPLEITE 	:= 'P' //U_GETRELA1("1","ZL1_PLEITE") //#LETRAS

//Desconto Sindicato
Private _cEventEx
Private _cFornEx
Private _cFornLjEx

Private _cxProd := ""
Private _cxLoja := ""

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona no cadastro de MIX.                                    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("ZLE")
ZLE->(dbSetOrder(1))
If ZLE->(dbSeek(xFilial("ZLE")+cCodMIX+_cVersao))
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Verifica se a database do sistema esta com o ultimo dia do mes. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	//dDataBase := STOD("20140131")
	//If LastDay(ZLE->ZLE_DTFIM) != dDataBase
	If ZLE->ZLE_DTFIM != dDataBase
		xMagHelpFis("NAO CONFORMIDADE 01 - DATABASE INVALIDA",;
		"A data do sistema("+DTOC(dDataBase)+") nao esta no ultimo dia do mes!",;
		"Altere a data do sistema para "+DTOC(LastDay(ZLE->ZLE_DTFIM)) )
		Return()
	Else
		dZLEIni := ZLE->ZLE_DTINI
		dZLEFim := ZLE->ZLE_DTFIM
	EndIf
	
	oObjProc:SaveLog("INICIO - CANCELAMENTO DO LEITE")
	If oObjProc<>Nil
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Chama funcao para criar tabela Temporaria. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		MsgRun("Aguarde.... Filtrando dados para o Acerto...",,{||CursorWait(), MGLT5QRY(cFunc), CursorArrow()})
		nProd := _nReg
		
		oObjProc:SetRegua1(nProd)
		
		dbSelectArea(_cArqTmp)
		dbGoTop()
		
		While (_cArqTmp)->(!Eof())
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Inicia o controle de transacao.³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			Begin Transaction
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Cadastro de Fornecedor( Produtor ). ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			dbSelectArea("SA2")
			SA2->(dbSetOrder(1))
			If SA2->(dbSeek(xFilial("SA2")+(_cArqTmp)->ZLF_RETIRO+(_cArqTmp)->ZLF_RETILJ))
				
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Posiciona na Linha/Rota  .                                                      ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				
				_cTpTribut:= (_cArqTmp)->ZLF_TRIBUT
				
				cCodSetor := (_cArqTmp)->ZLF_SETOR
				
				_cxProd := SA2->A2_COD
				_cxLoja := SA2->A2_LOJA
				
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Atualiza a regua de processamento.³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				If oObjProc <> Nil
					oObjProc:IncRegua1("Produtor "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nProd))+" ("+AllTrim(str( round((nCont/nProd)*100,0) ))+"%) -> Tributacao: " + _cTpTribut + " - " + SA2->A2_COD +"/"+SA2->A2_LOJA +" - "+SA2->A2_NOME)
				EndIf
				
				//**************************
				// Cancela Baixas
				//**************************
				//CancBxSE2(oObjProc)
				
				//*******************************************
				// Cancela titulos gerados pelo fechamento
				//*******************************************
				
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³Comentado por Fabiano Dias no dia 30/05/12 pois no fechamento   ³
				//³do produtor podem haver produtores que nao foram gerados titulos³
				//³automaticamente, desta forma somente a validacao senao encontrar³
				//³tittulos que sera removida.                                     ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				//lTitExc := ExcluiSE2(oObjProc)
				
				U_MGLT033(cCodMIX,SA2->A2_COD,oObjProc) //Executa cancelamento financeiro
				//Reposiciona SA2 apos cancelamento financeiro.
				dbSelectArea("SA2")
				SA2->(dbSetOrder(1))
				SA2->(dbSeek(xFilial("SA2")+_cxProd+_cxLoja))

				
				ExcluiSE2(oObjProc)
				
				ExcluiSE1(oObjProc)
				
				//**************************************
				// Se for nota por produtor exclui NF
				//***************************************
				cMultNota := Posicione("ZL2",1,xFilial("ZL2")+(_cArqTmp)->ZLF_SETOR,"ZL2_MULTNF")
				
				If cMultNota == "S" .OR. Empty(AllTrim((_cArqTmp)->F1SEEK)) //Uma Nota por produtor
					//Se o produtor NAO existe no parametro, entao so gerou financeiro, nao tem nota pra excluir
					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³Comentado por Fabiano Dias no dia 06/06/12 para que fosse    ³
					//³checado no cadastro do produtor se este emite uma NF de venda³
					//³destinada a ESPECIFICO referente as entradas de leite, e se o  ³
					//³mesmo nao eh uma associacao, nao se emite nota a associacao. ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
					//If !(   AllTrim(SA2->A2_COD+SA2->A2_LOJA) $ AllTrim(GetMv("LT_SEMNOTA"))   )
					//					If SA2->A2_L_EMINF != 'S' .And. SA2->A2_L_TPPRO != 'A'
					If SA2->A2_L_TPFOR == 'P' 
						lNfExc := DeletaSF1(oObjProc)
						//lNfExc := .T.
						//Qdo se trata de produtor que nao possui nota
						//seta como se tivesse excluido tudo
						
						//Reavaliar este item
					Else
						//lTitExc := .T.
						lNfExc  := .T.
					EndIf
				EndIf
				
				//***********************************
				// Se nao encontrou titulos ou nfs
				// do produtor gera erro.
				//***********************************
				//If !lTitExc .and. !lNfExc
				If !lNfExc
					lDeuErro := .T.
				EndIf
				
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Apos processar todas as funcoes, flag a ZLF informando que³
				//³ os eventos do produtor foram todos processados.           ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				If !lDeuErro
					
					U_AtuStatus(" ",SA2->A2_COD,SA2->A2_LOJA,,,"",cMultNota,SA2->A2_COD_MUN,SA2->A2_EST,dZLEIni,dZLEFim)
					
					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³ Chama funcao para deletar na ZLF os eventos gerados pela rotina de Fechamento. ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
					MsgRun("Aguarde.... Deletando dados do Acerto...",,{||CursorWait(), MGLT5QRY("0"), CursorArrow()})
					
				Else
					
					xMagHelpFis("Sem Fechamento",;
					"Ocorreu uma não conformidade no cancelamento do Produtor em questão, ou não existe fechamento na DataBase selecionada.",;
					"Verifique a DataBase do sistema, se o erro persistir comunique ao Suporte.")
					
					
					If MsgYesNo("Ocorreram não conformidades no processo. Deseja continuar a rotina?")
						lContinue:=.T.
					Else
						lContinue:=.F.
					EndIf
					
				EndIf
			Else
				oObjProc:SaveLog("ERRO 03 - Nao existe Produtor "+AllTrim((_cArqTmp)->ZLF_RETIRO+(_cArqTmp)->ZLF_RETILJ))
				xMagHelpFis("NAO CONFORMIDADE 04 - Nao existe Produtor",;
				"Produtor "+AllTrim((_cArqTmp)->ZLF_RETIRO+(_cArqTmp)->ZLF_RETILJ)+" não existe no cadastro!",;
				"Nao sera gerado Acerto para esse produtor. Verifique o código do produtor no MIX versus o cadastro!","Alerta")
			EndIf
			
			If !lDeuErro
				AtualizaSld(oObjProc) //Grava dados do fechamento na tabela ZLV
			EndIf					

			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Se houve alguma falha, desfaz todas as transacoes.³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			If lDeuErro
				DisarmTransaction()
				lDeuErro := .F.
			EndIf
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Finaliza o controle de transacao, caso nao hajam falhas. ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			End Transaction
			
			If !lContinue
				
				exit
				
			EndIf
			
			nCont++
			(_cArqTmp)->(dbSkip())
		EndDo
	EndIf
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Apaga arquivo temporario.         ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	dbSelectArea(_cArqTmp)
	dbCloseArea(_cArqTmp)
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Atualiza a regua de processamento.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If oObjProc <> Nil
		oObjProc:SetRegua2(1)
		oObjProc:IncRegua1("Fim do Cancelamento Acerto - Atualizando Status!!")
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
	cQry += " AND ZLF_VERSAO = '" + _cVersao  + "' "
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
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Posiciona no cadastro de MIX.                                    ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	dbSelectArea("ZLE")
	ZLE->(dbSetOrder(1))
	If ZLE->(dbSeek(xFilial("ZLE") + cCodMIX + _cVersao))
		
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
		
		ZLE->(MsUnlock())
		
	EndIf
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Altera o Status dos Cadastros.    ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	cQry := "SELECT COUNT(*) AS QTD FROM "
	cQry += RetSqlName("ZLF")+" ZLF "
	cQry += " JOIN "+RetSqlName("SA2")+" SA2 ON ZLF.ZLF_RETIRO = SA2.A2_COD AND ZLF.ZLF_RETILJ = SA2.A2_LOJA " //#LETRAS
	cQry += " WHERE ZLF.D_E_L_E_T_ = ' '"
	cQry += " AND SA2.D_E_L_E_T_ = ' '" //#LETRAS
	cQry += " AND ZLF.ZLF_FILIAL = '" +xFilial("ZLF")+ "'"
	cQry += " AND SA2.A2_FILIAL = '" + xFilial("SA2")	+ "'" //#LETRAS
	cQry += " AND ZLF.ZLF_CODZLE = '" +cCodMIX+ "'"
	cQry += " AND ZLF.ZLF_VERSAO = '" +_cVersao+ "'"
	cQry += " AND SUBSTR(ZLF_RETIRO,1,1) = 'P'" //Produtor
	//cQry += " AND SA2.A2_C_TPFOR IN " + U_ajusSQL(_cPLEITE) + " " //#LETRAS
	cQry += " AND ZLF.ZLF_ACERTO = 'S'"//Teve acerto
	TCQUERY cQry NEW ALIAS("GLT44")
	dbSelectArea("GLT44")
	
	//Se ninguem esta fechado
	//O Status dos cadastros fica em aberto
	If GLT44->QTD == 0
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³                                                                        ³
		//³ Se pelo menos um produtor estiver fechado, o status dos cadastros de   ³
		//³ TIPOS DE FAIXAS / VLR X GRUPO BONIFICACAO / ANALISES X DATA CALCULO /  ³
		//³ FAIXA DE INDICACAO /GRUPO BONIF. X TP FAIXAS/ CABECALHO DESCONTO FRETE ³
		//³ eh alterado para ficar com o Status Fechado, caso contrario fica em    ³
		//³ aberto.                                                                ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		U_AtuStatus(" ","","",,,"",,,,dZLEIni,dZLEFim)
	EndIf
	
	dbSelectArea("GLT44")
	dbCloseArea("GLT44")
	
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Exclui NF Sindicato Rural					³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	//ExcluiSE2(oObjProc,"NFSind")
	
	
	oObjProc:SaveLog("FIM - CANCELAMENTO DO LEITE")
	
Else
	xMagHelpFis("NAO CONFORMIDADE 05 - MIX nao encontrado.",;
	"O MIX informado nos parãmetros não foi encontrado!",;
	"Escolha um código de MIX que exista.")
EndIf

MsgInfo("Tempo gasto no processamento:"+ELAPTIME(cHoraIni,TIME()))

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ CancBxSE2³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Cancela Baixa de titulo no contas a pagar via SigaAuto.    ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ Nenhum.                                                    ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ GENERICO                                                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function CancBxSE2(oObj)

Local cFunc   		:= "2" //Codigo da Qry a ser executada
Local _cArqTmp 		:= cGLTalias+cFunc
Local nCont   		:= 1
Local nTotReg 		:= 0
Local nModAnt 		:= nModulo
Local cModAnt 		:= cModulo
Local _aArea  		:= {}
Local _aAlias 		:= {}
Local aAreaTmp		:= {}

Local _dDtBkpBas    := dDataBase
Local _cFilBkp 		:= cFilAnt
//Local cPrefCv := Posicione("ZL8",1,xFilial("ZL8")+AllTrim(GetMv("LT_CONVEXT")),"ZL8_PREFIX") //Evento de convenio

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Efetua o backup da filial corrente.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Local _cBkpFil		:= cFilAnt

Private lMsErroAuto := .F.
Private lMsHelpAuto := .T.

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³  Salva a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL8","ZLF","SF1","SD1","SX1"})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("INICIO - Cancto Baixa - Produtor - " + SA2->A2_COD + SA2->A2_LOJA)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Chama funcao para criar tabela Temporaria. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
MsgRun("Aguarde.... Filtrando dados cancelamento da baixa...",,{||CursorWait(), MGLT5QRY(cFunc), CursorArrow()})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza a regua de processamento.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If oObj <> Nil
	nTotReg := _nReg
	oObj:SetRegua2(nTotReg)
EndIf

dbSelectArea(_cArqTmp)
dbGoTop()
While (_cArqTmp)->(!Eof()) .And. !lDeuErro
	
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Atualiza a regua de processamento.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If oObj <> Nil
		oObj:IncRegua2("Cancelamento Baixa - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
		nCont++
	EndIf
	
	//lOk := u_u_nBaixa((_cArqTmp)->E2_PREFIXO,(_cArqTmp)->E2_NUM,(_cArqTmp)->E2_PARCELA,(_cArqTmp)->E2_TIPO,SA2->A2_COD,SA2->A2_LOJA,(_cArqTmp)->E5_MOTBX,;
	//	(_cArqTmp)->E5_DATA,(_cArqTmp)->E5_VALOR,(_cArqTmp)->E5_SEQ)
	
	
	
	SM0->(dbSetOrder(1))   // forca o indice na ordem certa
	SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt))
	
	DbSelectArea("SE2")
	SE2->(DbSetOrder(1))
	//E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA
	If SE2->(dbSeek(xFilial("SE2") + (_cArqTmp)->E2_PREFIXO + (_cArqTmp)->E2_NUM + (_cArqTmp)->E2_PARCELA + (_cArqTmp)->E2_TIPO + SA2->A2_COD + (_cArqTmp)->E2_LOJA))

		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Posiciona na database em que foram realizadas as baixas, isto porque        ³
		//³o fechamento de 01/02/12 a 29/02/12 tera suas baixas efetuadas provavelmente³
		//³no dia 15/03.                                                               ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		dDataBase:= SE2->E2_BAIXA
		
		_aTitulo := {{"E2_PREFIXO",(_cArqTmp)->E2_PREFIXO					,Nil},;
		{"E2_NUM"	    ,(_cArqTmp)->E2_NUM	     							,Nil},;
		{"E2_PARCELA"   ,(_cArqTmp)->E2_PARCELA  							,Nil},;
		{"E2_TIPO"	    ,(_cArqTmp)->E2_TIPO     							,Nil},;
		{"E2_FORNECE"   ,SA2->A2_COD            							,Nil},;
		{"E2_LOJA"	    ,(_cArqTmp)->E2_LOJA     							,Nil},;
		{"AUTJUROS"		,0				        							,Nil},;
		{"AUTDESCONT"	,0		 		        							,Nil},;
		{"AUTMOTBX"		,(_cArqTmp)->E5_MOTBX    							,Nil},;
		{"AUTDTBAIXA"	,(_cArqTmp)->E5_DATA	    							,Nil},;
		{"AUTDTCREDITO"	,(_cArqTmp)->E5_DATA    								,Nil},;
		{"AUTHIST"		,"Cancto Bx - " + SA2->A2_COD + (_cArqTmp)->E2_LOJA	,Nil},;
		{"AUTVLRPG"		,(_cArqTmp)->E5_VALOR								,Nil},;
		{"AUTVALREC"	,(_cArqTmp)->E5_VALOR								,Nil}}
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Altera o modulo para Financeiro, senao o SigaAuto nao executa.³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		nModulo := 6
		cModulo := "FIN"
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Busca o numero da Baixa.                                      ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		_nBaixa := NroSeq((_cArqTmp)->E2_PREFIXO,(_cArqTmp)->E2_NUM,(_cArqTmp)->E2_PARCELA,(_cArqTmp)->E2_TIPO,SA2->A2_COD,(_cArqTmp)->E2_LOJA,(_cArqTmp)->E5_SEQ)
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ SigaAuto de Cancelamento de Baixa de Contas a Pagar. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		Pergunte("FIN080",.F.)//Chama os parametros da rotina para nao gerar erro
		MSExecAuto( {|x,y,z,k| Fina080(x,y,z,k)},_aTitulo,5,.F.,_nBaixa)
		//		MSExecAuto( {|x,y,z| Fina080(x,y,z)},_aTitulo,5,.T.)
		
		Pergunte(_cPerg,.F.)//Chama os parametros da rotina para nao gerar erro
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
			oObj:SaveLog("ERRO 04 - SIGAAUTO BAIXA")
			xMagHelpFis("NAO CONFORMIDADE 06 - SIGAAUTO BAIXA TITULO",;
			"Existe uma não conformidade no SigaAuto de Baixa de Contas a Pagar!",;
			xFilial("SE2")+(_cArqTmp)->E2_PREFIXO+(_cArqTmp)->E2_NUM+;
			(_cArqTmp)->E2_PARCELA+(_cArqTmp)->E2_TIPO+SA2->A2_COD+(_cArqTmp)->E2_LOJA+;
			"     <-  Copie essas informações para voce pesquisar no Contas a Pagar o titulo que esta com não conformidade. "+;
			"Após confirmar esta tela, sera apresentada a tela de Não Conformidade do SigaAuto.")
			MostraErro()
		Else
			
			_cUpdate := " UPDATE " + RetSqlName("SE2")
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³Linha comentada por Fabiano Dias no dia 14/03/12, pois a seguinte         ³
			//³situacao poderia via a ocorrer supondo que um titulo que fosse gerado     ³
			//³automaticamente pelo mix de numero 000001 sofresse uma baixa              ³
			//³parcial e depois o mix de numero 000002 realiza-se outra baixa neste      ³
			//³mesmo titulo, apos isso fosse solicitada o cancelamento do mix de numero  ³
			//³000002 este titulo seria atualizado com o codigo do mix 000002 e depois o ³
			//³mesmo seria selecionado para realizar a sua exclusao erradamente, pois    ³
			//³foi gerado pelo mix de numero 000001.  							         ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			
			//_cUpdate += " SET E2_L_MIX = '"+cCodMIX+"', E2_L_VERSA = '"+_cVersao+"', E2_DATALIB = ' '"
			_cUpdate += " SET E2_DATALIB = ' '"
			_cUpdate += " WHERE D_E_L_E_T_ = ' '"
			_cUpdate += " AND E2_FILIAL    = '" + xFilial("SE2") + "'"
			_cUpdate += " AND E2_PREFIXO   = '" + (_cArqTmp)->E2_PREFIXO + "'"
			_cUpdate += " AND E2_NUM       = '" + (_cArqTmp)->E2_NUM     + "'"
			_cUpdate += " AND E2_PARCELA   = '" + (_cArqTmp)->E2_PARCELA + "'"
			_cUpdate += " AND E2_TIPO      = '" + (_cArqTmp)->E2_TIPO    + "'"
			_cUpdate += " AND E2_FORNECE   = '" + SA2->A2_COD           + "'"
			_cUpdate += " AND E2_LOJA      = '" + (_cArqTmp)->E2_LOJA    + "'"
			lSqlOk := !(TCSqlExec(_cUpdate) < 0)
			If lSqlOk .and.  (TcGetDB() == 'ORACLE')
				lSqlOk := !(TCSqlExec(" COMMIT ") < 0)
			EndIf
			
			
			If !lSqlOk
				lDeuErro := .T.
				oObj:SaveLog("ERRO 05 - UPDATE E2_L_MIX")
				xMagHelpFis("NAO CONFORMIDADE 07 - UPDATE DO COD. MIX",;
				TcSqlError(),;
				"Não Conformidade ao executar o Update de gravacao do cod. MIX no E2_MIX! "+;
				"Não confirme esta mensagem e informe ao Suporte Técnico.")
			EndIf
			
		EndIf
		
	Else
		
		lDeuErro := .T.
		xMagHelpFis("ERRO 05 - NAO FOI ENCONTRADO TITULO",;
		"Não foi o encontrado o título mencionado abaixo para realizar o cancelamento de sua baixa, favor comunicar ao departamento de informática.",;
		"Filial: " + xFilial("SE2") + " - Prefixo: " + (_cArqTmp)->E2_PREFIXO + " - Tipo: " +  (_cArqTmp)->E2_TIPO + " - Numero: " + (_cArqTmp)->E2_NUM +;
		" - Parcela: " + (_cArqTmp)->E2_PARCELA + " - Fornecedor: " + SA2->A2_COD + "/" + (_cArqTmp)->E2_LOJA)
		
	EndIf
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Restaura a area. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	CtrlArea(2,_aArea,_aAlias)
	
	(_cArqTmp)->(dbSkip())
EndDo

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("FIM - Cancto Baixa - Produtor "+SA2->A2_COD+SA2->A2_LOJA)


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Restaura a database antes de efetuar o cancelamento das baixas.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dDataBase:= _dDtBkpBas

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Restaura a filial corrente antes do processo.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cFilAnt:= _cBkpFil

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt))

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(2,_aArea,_aAlias)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Apaga arquivo temporario.         ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea(_cArqTmp)
dbCloseArea(_cArqTmp)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ ExcluiSE2³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Exlcui titulo no contas a pagar via SigaAuto.              ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ Nenhum.                                                    ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ GENERICO                                                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function ExcluiSE2(oObj,cFunName)

Local cFunc   		:= "3" //Codigo da Qry a ser executada
Local _cArqTmp 		:= cGLTalias+cFunc
Local nCont   		:= 1
Local nTotReg 		:= 0
Local nModAnt 		:= nModulo
Local cModAnt 		:= cModulo
Local _aArea  		:= {}
Local _aAlias 		:= {}
Local lRet			:= .F.

Default cFunName := ""

Private lMsErroAuto := .F.
Private lMsHelpAuto := .T.

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³  Valida Query. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If cFunName == "NFSind"
	cFunc := "3A"
	_cEventEx 	:= ALLTRIM(GETMV("LT_EVESIND"))
	_cFornEx	:= SubStr(Alltrim(GETMV("LT_FORSIND")),1,6)
	_cFornLjEx	:= SubStr(Alltrim(GETMV("LT_FORSIND")),7,2)
	SA2->(DBSEEK(xFilial("SA2")+_cFornEx+_cFornLjEx))
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³  Salva a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL8","ZLF","SF1","SD1","ZLF","SX1"})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("INICIO - Exclusao Titulo - Produtor - "+SA2->A2_COD+SA2->A2_LOJA)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Chama funcao para criar tabela Temporaria. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
MsgRun("Aguarde.... Filtrando dados exclusao do titulo...",,{||CursorWait(), MGLT5QRY(cFunc), CursorArrow()})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza a regua de processamento.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If oObj <> Nil
	nTotReg := _nReg
	oObj:SetRegua2(nTotReg)
EndIf

dbSelectArea(_cArqTmp)
dbGoTop()
While (_cArqTmp)->(!Eof()) .And. !lDeuErro
	
	lRet:=.T.
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Atualiza a regua de processamento.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If oObj <> Nil
		oObj:IncRegua2("Exclusao Titulo - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
		nCont++
	EndIf
	
	dbSelectArea("SE2")
	SE2->(dbSetOrder(1))
	If SE2->(dbSeek(xFilial("SE2")+(_cArqTmp)->E2_PREFIXO+(_cArqTmp)->E2_NUM+(_cArqTmp)->E2_PARCELA+(_cArqTmp)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA))
		
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
		Pergunte("FIN050",.F.)//Chama os parametros da rotina para nao gerar erro
		MSExecAuto({|x,y,z| Fina050(x,y,z)},aAutoSE2,.T.,5)
		Pergunte(_cPerg,.F.)//Chama os parametros da rotina para nao gerar erro
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Restaura o modulo em uso. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		nModulo := nModAnt
		cModulo := cModAnt
		
		
		If lMsErroAuto
			
			lDeuErro := .T.
			oObj:SaveLog("ERRO 07 - SIGAAUTO EXCLUSAO TITULO")
			xMagHelpFis("NAO CONFORMIDADE 09 - TITULO NAO EXCLUIDO",;
			"O titulo "+xFilial("SE2")+SE2->E2_PREFIXO+SE2->E2_NUM+SE2->E2_PARCELA+SE2->E2_TIPO+;
			" não foi excluido! Produtor: "+SA2->A2_COD+"/"+SA2->A2_LOJA+"-"+SA2->A2_NOME,;
			"Verifique no financeiro se este titulo ja foi baixado ou o motivo pelo qual não pode ser excluído."+;
			" Ao confimar esta tela, sera apresentada a tela do SigaAuto, que possui informações mais detalhadas.")
			Mostraerro()
			
		EndIf
		
	Else
		
		lDeuErro := .T.
		oObj:SaveLog("ERRO 06 - SIGAAUTO EXCLUSAO TITULO")
		xMagHelpFis("NAO CONFORMIDADE 08 - TITULO NAO EXCLUIDO",;
		"O titulo "+xFilial("SE2")+(_cArqTmp)->E2_PREFIXO+(_cArqTmp)->E2_NUM+(_cArqTmp)->E2_PARCELA+(_cArqTmp)->E2_TIPO+;
		" não foi encontrado! Produtor: "+SA2->A2_COD+"/"+SA2->A2_LOJA+"-"+SA2->A2_NOME,;
		"Verifique no financeiro se este titulo existe, pois o mesmo não foi encontrado.")
		
	EndIf
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Restaura a area. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	CtrlArea(2,_aArea,_aAlias)
	
	(_cArqTmp)->(dbSkip())
EndDo

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("FIM - Exclusao Titulo - Produtor "+SA2->A2_COD+SA2->A2_LOJA)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(2,_aArea,_aAlias)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Apaga arquivo temporario.         ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea(_cArqTmp)
dbCloseArea(_cArqTmp)

Return lRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ExcluiSE1 ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para realizar o Cancelamento Financeiro.		      ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpO01 - Objeto da Regua de processamento.                 ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT032()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function ExcluiSE1(oObj)

Local cArqTmp1 := cGLTalias+"5"

Local cArqTmp3 := cGLTalias+"6"


Local _aArea   := {}
Local _aAlias  := {}
Local nTotReg  := 0
Local nCont    := 1

//Variaveis Valores
Local nJurTit
Local nSldTit
Local _nSldCred
Local nVlrBx
Local nTotBai

Local lRetorno := .T.

Local _cMotBaixa := AllTrim(GETMV("LT_MOTBX"))
Private lRetSe2 := .T.
Private lRetSe1 := .T.
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³  Salva a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL8","ZLF","SF1","SD1","SX1"})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("INICIO - Busca Baixas Contas a Receber - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

MsgRun("Aguarde.... Filtrando Contas a Receber...",,{||CursorWait(), MGLT5QRY("5"), CursorArrow()})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza a regua de processamento.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If oObj <> Nil
	nTotReg := _nReg
	nCont   := 1
	oObj:SetRegua2(nTotReg)
EndIf

dbSelectArea(cArqTmp1)
(cArqTmp1)->(dbGoTop())

While (cArqTmp1)->(!Eof())
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Atualiza a regua de processamento.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If oObj <> Nil
		oObj:IncRegua2("Financeiro - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
		nCont++
	EndIf
	
	dbSelectArea("SE1")
	SE1->(dbSetOrder(1))//E1_FILIAL+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO
	If SE1->(dbSeek(xFilial("SE1") + (cArqTmp1)->E1_PREFIXO + (cArqTmp1)->E1_NUM +(cArqTmp1)->E1_PARCELA + (cArqTmp1)->E1_TIPO ))
		// Cancela as Baixas Dos Titulos a receber
		//CancBxSe1(cFornec,cLoja,cPrefix,cNumSe1,cParc,cTipo,cDtBx,cMotBx,cVlrBx)
		lRetSe1:=CancBxSe1((cArqTmp1)->E1_CLIENTE,(cArqTmp1)->E1_LOJA,(cArqTmp1)->E1_PREFIXO,(cArqTmp1)->E1_NUM,(cArqTmp1)->E1_PARCELA,(cArqTmp1)->E1_TIPO,(cArqTmp1)->E5_DATA,(cArqTmp1)->E5_MOTBX,(cArqTmp1)->E5_VALOR)
		If lRetSe1
			//Atualiza o saldo do titulo na ZLF
			cSeek := cCodMIX+xFilial("SE1")+(cArqTmp1)->E1_PREFIXO + (cArqTmp1)->E1_NUM +(cArqTmp1)->E1_PARCELA + (cArqTmp1)->E1_TIPO+(cArqTmp1)->E1_CLIENTE+(cArqTmp1)->E1_LOJA
			DbSelectArea("ZLF")
			DbSetOrder(4)
			If DbSeek(xFilial("ZLF")+cSeek)
				U_GrvZLF(cCodMIX,SE1->E1_L_EVENT,-(SE1->E1_SALDO),cSeek,"","MGLT033","","",0,0,"","",0,0)
			EndIf
		EndIf

	Else
		xMagHelpFis("ERRO Baixa SE1 - NAO FOI ENCONTRADO TITULO",;
		"Não foi o encontrado o título mencionado abaixo para realizar o cancelamento de sua baixa, favor comunicar ao departamento de informática.",;
		"Filial: " + xFilial("SE1") + " - Prefixo: " + (cArqTmp1)->E1_PREFIXO + " - Tipo: " +  (cArqTmp1)->E1_TIPO + " - Numero: " + (cArqTmp1)->E1_NUM +;
		" - Parcela: " + (cArqTmp1)->E1_PARCELA + " - Fornecedor: " + (cArqTmp1)->E1_CLIENTE+ "/" + (cArqTmp1)->E1_LOJA)
		lDeuErro  := .T.
	EndIf
	
	(cArqTmp1)->(DbSkip())
	
EndDo

dbSelectArea(cArqTmp1)
dbCloseArea(cArqTmp1)


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("INICIO - Busca Titulos Contas a Receber a Excluir - "+SA2->A2_COD +"/"+SA2->A2_LOJA)

MsgRun("Aguarde.... Filtrando Titulos a Receber para Excluir...",,{||CursorWait(), MGLT5QRY("6"), CursorArrow()})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza a regua de processamento.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If oObj <> Nil
	nTotReg := _nReg
	nCont   := 1
	oObj:SetRegua2(nTotReg)
EndIf

dbSelectArea(cArqTmp3)
(cArqTmp3)->(dbGoTop())

While (cArqTmp3)->(!Eof())
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Atualiza a regua de processamento.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If oObj <> Nil
		oObj:IncRegua2("Financeiro - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
		nCont++
	EndIf
	
	dbSelectArea("SE1")
	SE1->(dbSetOrder(1))//E1_FILIAL+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO
	If SE1->(dbSeek(xFilial("SE1") + (cArqTmp3)->E1_PREFIXO + (cArqTmp3)->E1_NUM +(cArqTmp3)->E1_PARCELA + (cArqTmp3)->E1_TIPO ))
		// Exclui Titulos a receber
		lRetSe1:= U_ExcluSE1((cArqTmp3)->E1_FILIAL,(cArqTmp3)->E1_PREFIXO,(cArqTmp3)->E1_NUM,(cArqTmp3)->E1_PARCELA,(cArqTmp3)->E1_TIPO,(cArqTmp3)->E1_CLIENTE,(cArqTmp3)->E1_LOJA)
	Else
		xMagHelpFis("ERRO Baixa SE1 - NAO FOI ENCONTRADO TITULO",;
		"Não foi o encontrado o título mencionado abaixo para realizar sua exclusao, favor comunicar ao departamento de informática.",;
		"Filial: " + xFilial("SE1") + " - Prefixo: " + (cArqTmp3)->E1_PREFIXO + " - Tipo: " +  (cArqTmp3)->E1_TIPO + " - Numero: " + (cArqTmp3)->E1_NUM +;
		" - Parcela: " + (cArqTmp3)->E1_PARCELA + " - Fornecedor: " + (cArqTmp3)->E1_CLIENTE+ "/" + (cArqTmp3)->E1_LOJA)
		lDeuErro  := .T.
	EndIf
	
	(cArqTmp3)->(DbSkip())
	
EndDo

dbSelectArea(cArqTmp3)
dbCloseArea(cArqTmp3)


If lRetSe1 == .T. .OR. lRetSe2 == .T.
	lDeuErro := .F.
Else
	lDeuErro := .T.
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(2,_aArea,_aAlias)

Return lRetorno

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ CancBxSe1³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Exclui titulo no contas a pagar via SigaAuto.              ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³  								                 	      ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ GENERICO                                                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function CancBxSe1(cFornec,cLoja,cPrefix,cNumSe1,cParc,cTipo,cDtBx,cMotBx,cVlrBx)

Local _lRetorno	  := .T.
Local _cQry
Local _cArqTmp 	  := GetNextAlias()
Local nModAnt 	  := nModulo
Local cModAnt 	  := cModulo
Local _aArea	  := GetArea()
Local lMsErroAuto := .F.
Local lMsHelpAuto := .T.
Local _dDataBase  := dDataBase

DbSelectArea("SE1")
SE1->(DbSetOrder(1))
//E1_FILIAL+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO
If SE1->(dbSeek(xFilial("SE1") + cPrefix + cNumSe1+ cParc + cTipo + cFornec + cLoja))

	dDataBase := SE1->E1_BAIXA
	
	aBaixa := {{"E1_PREFIXO"  ,cPrefix  ,Nil    },;
	{"E1_NUM"      ,cNumSe1   ,Nil    },;
	{"E1_TIPO"     ,cTipo	  ,Nil    },;
	{"AUTMOTBX"    ,cMotBx 	  ,Nil    },;
	{"AUTBANCO"    ,"	"     ,Nil    },;
	{"AUTAGENCIA"  ,"	"     ,Nil    },;
	{"AUTCONTA"    ,"	"     ,Nil    },;
	{"AUTDTBAIXA"  ,SE1->E1_BAIXA ,Nil    },;
	{"AUTDTCREDITO",cDtBx      ,Nil    },;
	{"AUTHIST"     ,"Cancto Bx - " + cFornec + cLoja,Nil},;
	{"AUTJUROS"    ,0          ,Nil	  },;
	{"AUTVALREC"   ,cVlrBx     ,Nil   }}
	
	nModulo := 6
	cModulo := "FIN"
	
	//³ Busca o numero da Baixa.
	_nBaixa := 0//u_SeqSE1(cPrefix,cNumSe1,cParc,cTipo,cFornec,cLoja)
	
	Pergunte("FIN070",.F.)//Chama os parametros da rotina para nao gerar erro
	
	MSExecAuto({|x,y| Fina070(x,y)},aBaixa,5,,_nBaixa)
	
	Pergunte(_cPerg,.F.)//Chama os parametros da rotina para nao gerar erro
	dDataBase := _dDataBase
	
	nModulo := nModAnt
	cModulo := cModAnt
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Verifica se houve erro no SigaAuto, caso haja mostra o erro. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If lMsErroAuto
		xMagHelpFis("NAO CONFORMIDADE 01 - SIGAAUTO BAIXA TITULO",;
		"Existe uma não conformidade no SigaAuto de Baixa de Contas a Receber!",;
		xFilial("SE1")+cPrefix+cNumSe1+;
		cParc+cTipo+cFornece+ cLoja+;
		"     <-  Copie essas informações para voce pesquisar no Contas a Receber o titulo que esta com não conformidade. "+;
		"Após confirmar esta tela, sera apresentada a tela de Não Conformidade do SigaAuto.")
		MostraErro()
		Return .F.
	EndIf
	
Else
	
	xMagHelpFis("ERRO 02 - NAO FOI ENCONTRADO TITULO",;
	"Não foi o encontrado o título mencionado abaixo para realizar o cancelamento de sua baixa, favor comunicar ao departamento de informática.",;
	"Filial: " + xFilial("SE1") + " - Prefixo: " + cPrefix+ " - Tipo: " +  cTipo + " - Numero: " + cNumSe1 +;
	" - Parcela: " + cParc + " - Fornecedor: " + cFornece + "/" +  cLoja)
	Return .F.
EndIf

RestArea(_aArea)

Return _lRetorno


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ DeletaSF1³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao p/ realizar o Cancelamento da Nota do Produtor.     ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpO01 - Objeto da Regua de processamento.                 ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT010()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

Static Function DeletaSF1(oObj)

Local cFunc    		:= "4" //Codigo da Qry a ser executada
Local _cArqTmp  		:= cGLTalias+cFunc
Local nCont    		:= 1
Local nTotReg  		:= 0
Local _aCab    		:= {}
Local _aItens  		:= {}
Local _aArea   		:= {}
Local _aAlias  		:= {}

//Local cCodFor  := Iif(cMultNota == "N",cFornece,SA2->A2_COD)
//Local cCodLoj  := Iif(cMultNota == "N",cLojaFor,SA2->A2_LOJA)
Local cCodFor  		:= SA2->A2_COD
Local cCodLoj  		:= SA2->A2_LOJA

Local lRet			:= .T.
Local _lNota		:= .F.

Local nModAnt 		:= nModulo
Local cModAnt 		:= cModulo


Private lMsErroAuto	:= .F.
Private lMsHelpAuto	:= .T.


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³  Salva a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL8","ZLF","SF1","SD1","SX1"})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("INICIO - Nota por Produtor - "+cCodFor+"/"+cCodLoj)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Chama funcao para criar tabela Temporaria. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
MsgRun("Aguarde.... Filtrando dados para NF Produtor...",,{||CursorWait(), MGLT5QRY(cFunc), CursorArrow()})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza a regua de processamento.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If oObj <> Nil
	nTotReg := _nReg
	oObj:SetRegua2(nTotReg)
EndIf

dbSelectArea(_cArqTmp)
dbGoTop()
While (_cArqTmp)->(!Eof())
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Inserido por Fabiano Dias no dia 31/05/12 para indicar que   ³
	//³foi encontrada a nota fiscal a ser cancelada uma vez que cada³
	//³produtor deve ter no minimo uma nota fiscal a ser excluida.  ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	_lNota:= .T.
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Atualiza a regua de processamento.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If oObj <> Nil
		oObj:IncRegua2("Excluindo Nota Fiscal - Tarefa "+AllTrim(Str(nCont)) + " de " + AllTrim(Str(nTotReg)))
		nCont++
	EndIf
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Cabecalho da Nota Fiscal( SigaAuto). ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	dbSelectArea("SF1")
	SF1->(dbSetOrder(1))//F1_FILIAL+F1_DOC+F1_SERIE+F1_FORNECE+F1_LOJA+F1_TIPO
	If SF1->(dbSeek(xFilial("SF1") + (_cArqTmp)->F1_DOC + (_cArqTmp)->F1_SERIE + cCodFor + cCodLoj + "N"))
		
		_aCab :={{"F1_TIPO","N"			  ,NIL},;	// Tipo da Nota = Normal.
		{"F1_FORMUL"	,"S"		      ,NIL},;	// Formulario Proprio = Sim.
		{"F1_DOC"		,SF1->F1_DOC      ,NIL},;	// Numero do Documento.
		{"F1_SERIE"		,SF1->F1_SERIE    ,NIL},;	// Serie do Documento.
		{"F1_EMISSAO"	,SF1->F1_EMISSAO  ,NIL},;	// Data de Emissao.
		{"F1_FORNECE"	,cCodFor  	      ,NIL},;	// Codigo do Fornecedor.
		{"F1_LOJA"	  	,cCodLoj 	      ,NIL},;	// Loja do Fornecedor.
		{"F1_ESPECIE"	,_cTpNF    	      ,NIL}}	// Especie do Documento.
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Item da Nota.         ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		dbSelectArea("SD1")
		SD1->(dbSetOrder(1))//D1_FILIAL+D1_DOC+D1_SERIE+D1_FORNECE+D1_LOJA+D1_COD+D1_ITEM
		If SD1->(dbSeek(xFilial("SD1") + SF1->F1_DOC + SF1->F1_SERIE + cCodFor + cCodLoj))
			
			While SD1->(!Eof()) .And. SD1->D1_FILIAL + SD1->D1_DOC + SD1->D1_SERIE + SD1->D1_FORNECE + SD1->D1_LOJA ==;
				xFilial("SD1") + SF1->F1_DOC + SF1->F1_SERIE + cCodFor         + cCodLoj
				
				If SD1->D1_TIPO == "N" .And. SD1->D1_FORMUL == "S"
					
					aAdd(_aItens,{{"D1_ITEM",SD1->D1_ITEM	      ,NIL},;	// Sequencia Item Pedido
					{"D1_COD"		,SD1->D1_COD				  ,NIL},;	// Codigo do Produto
					{"D1_QUANT"		,SD1->D1_QUANT  			  ,NIL},;	// Quantidade
					{"D1_VUNIT"		,SD1->D1_VUNIT    		      ,NIL},;	// Valor Unitario
					{"D1_TOTAL"		,SD1->D1_TOTAL                ,NIL}})	// Valor Total
					
				EndIf
				
				SD1->(dbSkip())
			EndDo
			
		EndIf
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ SigaAuto de Exclusao da Nota.     ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		
		nModulo := 2
		cModulo := "COM"
		
		
		If Len(_aCab)>0 .And. Len(_aItens)>0
			
			MATA103(_aCab,_aItens,5)
			
			If lMsErroAuto
				
				lRet:= .F.
				oObj:SaveLog("ERRO 09 - SIGAAUTO NA EXCLUSAO DA NOTA FISCAL DO PRODUTOR")
				
				xMagHelpFis("Exclusao da NF",;
				"Houve um erro na exclusão da nota fiscal do produtor: " + cCodFor + '/' + cCodLoj + ' com o seguinte tipo de tributação: ' + _cTpTribut,;
				"Favor comunicar ao departamento de informática do problema encontrado!")
				
				MostraErro()
				
			EndIf
		EndIf
		
		
		nModulo := nModAnt
		cModulo := cModAnt
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Confirma a Exclusao da NF            ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		dbSelectArea("SF1")
		SF1->(dbSetOrder(1))//F1_FILIAL+F1_DOC+F1_SERIE+F1_FORNECE+F1_LOJA+F1_TIPO
		If SF1->(dbSeek(xFilial("SF1") + (_cArqTmp)->F1_DOC + (_cArqTmp)->F1_SERIE + cCodFor + cCodLoj + "N"))
			
			xMagHelpFis("Exclusao da NF",;
			"Nao foi possivel excluir a NF " + (_cArqTmp)->F1_DOC + " do Produtor " + SA2->A2_COD + "/" + SA2->A2_LOJA,;
			"Comunique ao Suporte: " + xFilial("SF1") + (_cArqTmp)->F1_DOC + (_cArqTmp)->F1_SERIE + cCodFor + cCodLoj + "N")
			
			lRet:= .F.
			
		EndIf
		
	Else
		
		oObj:SaveLog("ERRO 10 - EXCLUSAO DE NOTA")
		xMagHelpFis("NAO CONFORMIDADE 11 - EXCLUSAO DA NOTA",;
		"A nota " + xFilial("SF1") + (_cArqTmp)->F1_DOC + (_cArqTmp)->F1_SERIE + cCodFor + cCodLoj + "N" + " nao foi encontrada!",;
		"Contate o suporte Técnico.")
		lRet:= .F.
		
	EndIf
	
	(_cArqTmp)->(dbSkip())
EndDo


/*
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Verifica se foi encontrada no minimo uma nota.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
*/
If !_lNota                                   
/*
	lRet:= .F.
	
	xMagHelpFis("Exclusao da NF",;
	"Não foi encontrada nenhuma nota para exclusão do produtor: " + cCodFor + '/' + cCodLoj + ' com o seguinte tipo de tributação: ' + _cTpTribut,;
	"Favor comunicar ao departamento de informática do problema encontrado.")
*/	
EndIf



//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("FIM - Nota por Produtor - "+cCodFor+"/"+cCodLoj)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(2,_aArea,_aAlias)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Apaga arquivo temporario.         ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea(_cArqTmp)
dbCloseArea(_cArqTmp)

Return lRet

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
±±³ Uso      ³ MGLT010()                                                  ³±±
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

Local _cPLEITE 	:= "P" //U_GETRELA1("1","ZL1_PLEITE") //#LETRAS

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
		cQry += " AND ZLF_CODZLE = '"+cCodMIX+"'"
		cQry += " AND ZLF_ORIGEM =  'F'" //So deleta originados pela rotina do Acerto
		cQry += " AND ZLF_ACERTO <> 'S'" //Deleta se nao realizou acerto definitivo
		cQry += " AND ZLF_TP_MIX = 'L' " //Deleta apenas registros do leite
		cQry += " AND ZLF_RETIRO  = '" + SA2->A2_COD + "'"
		cQry += " AND ZLF_RETILJ = '" + SA2->A2_LOJA + "'"
		lSqlOk := !(TCSqlExec(cQry) < 0)
		If lSqlOk .and.  (TcGetDB() == 'ORACLE')
			lSqlOk := !(TCSqlExec(" COMMIT ") < 0)
		EndIf
		
		
		If !lSqlOk
			xMagHelpFis("NAO CONFORMIDADE 12 - NO DELETE",;
			TcSqlError(),;
			"Verifique a Sintaxe da Query de DELETE.")
		EndIf
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Filtra os produtores do MIX para iniciar o processamento.   ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Case cOpc == "1"
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³As alteracoes na query foram efetuadas por Fabiano Dias no dia         ³
		//³30-05-12 para adequar a rotina de cancelamento a reliadade da ESPECIFICO.³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		
		cQry := "SELECT ZLF_SETOR,ZLF_RETIRO,ZLF_RETILJ,ZLF_TRIBUT,MAX(ZLF_F1SEEK) AS F1SEEK"
		cQry += " FROM "+RetSqlName("ZLF") + " ZLF "
		cQry += " JOIN "+RetSqlName("SA2")+" SA2" 
		cQry += " ON A2_FILIAL = '" + xFilial("SA2") + "' "
		cQry += " AND ZLF.ZLF_RETIRO = SA2.A2_COD" 
		cQry += " AND ZLF.ZLF_RETILJ = SA2.A2_LOJA " //#LETRAS
		cQry += " AND A2_L_GRUPO BETWEEN '" + _cGrupoDe +"' AND '"+ _cGrupoAte +"'"
		cQry += " AND SA2.D_E_L_E_T_ = ' '"
		cQry += " WHERE ZLF.D_E_L_E_T_ = ' '"
		cQry += " AND ZLF.ZLF_FILIAL = '"  + xFilial("ZLF") + "'"
		If !Empty(cSetores) //Se o parametro com os setores estiver vazio considera todos.
			cQry += " AND ZLF.ZLF_SETOR IN (" + U_AjustSet(cSetores) + ")"
		EndIf
		cQry += " AND ZLF.ZLF_RETIRO BETWEEN '"  + cProdDe + "' AND '" + cProdAte + "'"
		cQry += " AND ZLF.ZLF_RETILJ BETWEEN '" + cLojaDe + "' AND '" + cLojaAte + "'"
		cQry += " AND ZLF.ZLF_LINROT BETWEEN '" + cRotaDe + "' AND '" + cRotaAte + "'"
		cQry += " AND ZLF.ZLF_CODZLE = '" + cCodMIX + "'"
		cQry += " AND ZLF.ZLF_VERSAO = '" + _cVersao + "'"
		//cQry += " AND ZLF.ZLF_ACERTO = 'S'"
		cQry += " AND ZLF.ZLF_TP_MIX = 'L'"
		cQry += " AND ZLF.ZLF_ENTMIX = 'S'"		
		cQry += " GROUP BY ZLF_SETOR,ZLF_RETIRO,ZLF_RETILJ,ZLF_TRIBUT"
		cQry += " ORDER BY ZLF_SETOR,ZLF_RETIRO,ZLF_RETILJ"
		
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Seleciona os titulos do produtor para terem sua baixas canceladas.³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Case cOpc == "2"
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Query comentada por Fabiano Dias no dia 30/05/12 em detrimento³
		//³da query logo abaixo.                                         ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		
		/*
		cQry := "SELECT E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO,E5_VALOR,E5_SEQ,E5_MOTBX,E5_DATA FROM "
		cQry += RetSqlName("SE2")+" SE2, "+RetSqlName("SE5")+" SE5"
		cQry += " WHERE SE2.D_E_L_E_T_ = ' ' AND SE5.D_E_L_E_T_ = ' '"
		cQry += " AND SE2.E2_FILIAL  = '" +xFilial("SE2")+ "'"
		cQry += " AND SE5.E5_FILIAL  = '" +xFilial("SE5")+ "'"
		cQry += " AND SE2.E2_L_MIX   = '" + cCodMIX + "'"
		cQry += " AND SE2.E2_L_VERSA = '" + _cVersao + "'"
		cQry += " AND SE2.E2_FORNECE = '" + SA2->A2_COD + "'"
		cQry += " AND SE2.E2_LOJA    = '" + SA2->A2_LOJA + "'"
		cQry += " AND SE2.E2_SALDO   <> SE2.E2_VALOR"
		//cQry += " AND SE2.E2_VENCTO <= '"+cVencto+"'"
		cQry += " AND SE2.E2_TIPO IN('NDF','NF ')"
		cQry += " AND SE2.E2_PREFIXO = SE5.E5_PREFIXO"
		cQry += " AND SE2.E2_NUM     = SE5.E5_NUMERO"
		cQry += " AND SE2.E2_PARCELA = SE5.E5_PARCELA"
		cQry += " AND SE2.E2_TIPO    = SE5.E5_TIPO"
		cQry += " AND SE2.E2_FORNECE = SE5.E5_FORNECE"
		cQry += " AND SE2.E2_LOJA    = SE5.E5_LOJA"
		cQry += " AND SE5.E5_SITUACA <> 'C'"
		cQry += " AND SE5.E5_TIPODOC = 'BA'"
		cQry += " AND SE5.E5_MOTBX   = '"+cMotBaixa+"'"
		cQry += " AND SE5.E5_DATA    = '"+dtos(dDatabase)+"'"
		cQry += " ORDER BY E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO"
		*/
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Os filtros de loja foram comentador por causa da baixa da associacao³
		//³que nao tem fechamento mas sao efetuadas baixas em sua loja         ³
		//³que tem o mesmo codigo de um associado.                             ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Podem existir convenios e emprestimos de filiais diferentes da filial    ³
		//³de fechamento que foram baixados anteriormente pela rotina de fechamento.³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		
		cQry := "SELECT SE2.E2_FILIAL,SE2.E2_PREFIXO,SE2.E2_NUM,SE2.E2_PARCELA,SE2.E2_TIPO,SE2.E2_LOJA,SE5.E5_VALOR,SE5.E5_SEQ,E5_MOTBX,SE5.E5_DATA FROM "
		cQry += RetSqlName("SE2") + " SE2, "+RetSqlName("SE5") + " SE5"
		cQry += " WHERE SE2.D_E_L_E_T_ = ' ' AND SE5.D_E_L_E_T_ = ' '"
		cQry += " AND SE2.E2_FILIAL  = '" + xFILIAL("SE2") + "'"
		cQry += " AND SE5.E5_FILIAL  = '" + xFILIAL("SE5") + "'"
		//cQry += " AND SE2.E2_L_MIX   = '" + cCodMIX + "'"
		//cQry += " AND SE2.E2_L_VERSA = '" + _cVersao + "'"
		cQry += " AND SE2.E2_FORNECE = '" + SA2->A2_COD + "'"
		//cQry += " AND SE2.E2_LOJA    = '" + SA2->A2_LOJA + "'"
		cQry += " AND SE5.E5_CLIFOR  = '" + SA2->A2_COD + "'"
		//cQry += " AND SE5.E5_LOJA    = '" + SA2->A2_LOJA + "'"
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
		//cQry += " AND SE5.E5_MOTBX   = '" + cMotBaixa       + "'"
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Comentado por Fabiano Dias no dia 12/07/12 pois como agora                        ³
		//³a data da baixa depende da data de pagamento informada no fechamento              ³
		//³isto para efetuar a deducao correta dos juros pode haver datas diferentes de baixa³
		//³entao pegaremos a data da baixa na SE5.                                           ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		//cQry += " AND SE5.E5_DATA    = '" + dtos(dDatabase) + "'"
		//cQry += " AND SE5.E5_L_SEEK  = '" + cCodMIX + _cVersao + cCodSetor + "'"
		cQry += " AND SE5.E5_L_SEEK  = '" + cCodMIX + "'"
		cQry += " ORDER BY E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO"
		
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Seleciona os titulos do produtor para serem excluidos, so exclui os que foram gerados automaticamente.³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Case cOpc == "3"
		cQry := "SELECT E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO FROM "
		cQry += RetSqlName("SE2")
		cQry += " WHERE D_E_L_E_T_ = ' '"
		cQry += " AND E2_FILIAL  = '" + xFilial("SE2") + "'"
		cQry += " AND E2_L_MIX   = '" + cCodMIX 		+ "'"
		cQry += " AND E2_L_VERSA = '" + _cVersao 		+ "'"
		cQry += " AND E2_FORNECE = '" + SA2->A2_COD 	+ "'"
		cQry += " AND E2_LOJA    = '" + SA2->A2_LOJA 	+ "'"
		//cQry += " AND E2_VENCTO <= '"+cVencto+"'"
		cQry += " AND E2_L_SITUA = 'I'"
		cQry += " AND E2_TIPO IN('NDF','NF ')"
		//cQry += " AND E2_SALDO > 0"
		cQry += " AND E2_EMISSAO = '" + dtos(dDatabase)+ "'"
		cQry += " AND E2_L_SETOR = '" + cCodSetor      + "'"

		cQry += " UNION ALL "

		cQry += "SELECT E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO FROM "
		cQry += RetSqlName("SE2")
		cQry += " WHERE D_E_L_E_T_ = ' '"
		cQry += " AND E2_FILIAL  = '" + xFilial("SE2") + "'"
		cQry += " AND E2_FORNECE = '" + SA2->A2_COD 	+ "'"
		cQry += " AND E2_LOJA    = '" + SA2->A2_LOJA 	+ "'"
		//cQry += " AND E2_VENCTO <= '"+cVencto+"'"
		cQry += " AND E2_L_SITUA = 'I'"
		cQry += " AND E2_TIPO IN('NDF','NF ')"
		//cQry += " AND E2_SALDO > 0"
		cQry += " AND E2_EMISSAO = '" + dtos(dDatabase)+ "'"
		cQry += " AND E2_L_SEEK = '" + _cAno+_cMes      + "'"
		cQry += " AND E2_ORIGEM = 'MGLT032' "


		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
	Case cOpc == "3A"
		cQry := "SELECT E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO FROM "
		cQry += RetSqlName("SE2")
		cQry += " WHERE D_E_L_E_T_ = ' '"
		cQry += " AND E2_FILIAL  = '" + xFilial("SE2") + "'"
		cQry += " AND E2_L_MIX   = '" + cCodMIX 		+ "'"
		cQry += " AND E2_L_VERSA = '" + _cVersao 		+ "'"
		cQry += " AND E2_FORNECE = '" + _cFornEx 	+ "'"
		cQry += " AND E2_LOJA    = '" + _cFornLjEx	+ "'"
		cQry += " AND E2_L_SEEK    = '" + _cEventEx 	+ "'"
		//cQry += " AND E2_VENCTO <= '"+cVencto+"'"
		cQry += " AND E2_L_SITUA = 'I'"
		cQry += " AND E2_TIPO = 'NF '"
		//cQry += " AND E2_SALDO > 0"
		cQry += " AND E2_EMISSAO = '" + dtos(dDatabase)+ "'"
		cQry += " AND E2_L_SETOR = '" + cCodSetor      + "'"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Seleciona a nota do produtor. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Case cOpc == "4"
		cQry := "SELECT F1_DOC,F1_SERIE FROM "
		cQry += RetSqlName("SF1")
		cQry += " WHERE D_E_L_E_T_ = ' '"
		cQry += " AND F1_FILIAL  = '" + xFilial("SF1")	+ "'"
		cQry += " AND F1_L_MIX   = '" + cCodMix 		+ "'"
		cQry += " AND F1_L_SETOR = '" + cCodSetor 		+ "'"
		//cQry += " AND F1_L_LINHA = '" + ZL3->ZL3_COD + "'"
		cQry += " AND F1_EMISSAO = '" + DTOS(dDataBase)+ "'"
		cQry += " AND F1_FORNECE = '" + SA2->A2_COD 	+ "'"
		cQry += " AND F1_LOJA    = '" + SA2->A2_LOJA 	+ "'"
		//cQry += " AND F1_L_TRIBU = '" + _cTpTribut		+ "'"
		
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg

		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Busca Baixas Contas a Receber     ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Case cOpc == "5"
		cQry := "SELECT SE1.E1_FILIAL,SE1.E1_PREFIXO,SE1.E1_NUM,SE1.E1_PARCELA,SE1.E1_TIPO,SE1.E1_CLIENTE,SE1.E1_LOJA,SE5.E5_VALOR,SE5.E5_SEQ,E5_MOTBX,SE5.E5_DATA FROM "
		cQry += RetSqlName("SE1") + " SE1, "+RetSqlName("SE5") + " SE5"
		cQry += " WHERE SE1.D_E_L_E_T_ = ' ' AND SE5.D_E_L_E_T_ = ' '"
		cQry += " AND SE1.E1_FILIAL  = '"+xFilial("SE1")+"' "
		cQry += " AND SE1.E1_CLIENTE = '" + SA2->A2_COD   + "'"
		cQry += " AND SE5.E5_CLIFOR  = '" + SA2->A2_COD   + "'"
		cQry += " AND SE1.E1_SALDO <> SE1.E1_VALOR"
		//cQry += " AND SE1.E1_TIPO = 'NF' "
		cQry += " AND SE1.E1_FILIAL  = SE5.E5_FILIAL"
		cQry += " AND SE1.E1_PREFIXO = SE5.E5_PREFIXO"
		cQry += " AND SE1.E1_NUM     = SE5.E5_NUMERO"
		cQry += " AND SE1.E1_PARCELA = SE5.E5_PARCELA"
		cQry += " AND SE1.E1_TIPO    = SE5.E5_TIPO"
		cQry += " AND SE1.E1_CLIENTE = SE5.E5_CLIFOR"
		//cQry += " AND SE1.E1_LOJA    = SE5.E5_LOJA"
		cQry += " AND SE5.E5_SITUACA <> 'C'"
		cQry += " AND SE5.E5_TIPODOC = 'BA'"
		If (TcGetDB() == 'ORACLE')
			cQry += " AND SUBSTR(SE5.E5_L_SEEK,1,6)  = '" + _cAno+_cMes      + "'"
			//cQry += "SUBSTR(SE5.E5_L_SEEK,1,6)  = '" + _cAno+_cMes      + "'"
		Else
			cQry += " AND LEFT(SE5.E5_L_SEEK,6)  = '" + _cAno+_cMes      + "'"
			 //cQry += " LEFT(SE5.E5_L_SEEK,6)  = '" + _cAno+_cMes      + "'"
		EndIf		
		cQry += " ORDER BY E1_FILIAL,E1_PREFIXO,E1_NUM,E1_PARCELA,E1_TIPO"

		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg


	Case cOpc == "6"
		cQry := "SELECT SE1.E1_FILIAL,SE1.E1_PREFIXO,SE1.E1_NUM,SE1.E1_PARCELA,SE1.E1_TIPO,SE1.E1_CLIENTE,SE1.E1_LOJA FROM "
		cQry += RetSqlName("SE1") + " SE1 "
		cQry += " WHERE SE1.D_E_L_E_T_ = ' ' "
		cQry += " AND SE1.E1_FILIAL  = '"+xFilial("SE1")+"' "
		cQry += " AND SE1.E1_CLIENTE = '" + SA2->A2_COD   + "'"
		cQry += " AND SE1.E1_EMISSAO  = '"+DTOS(dDataBase)+"' "
		cQry += " AND SE1.E1_SALDO  = SE1.E1_VALOR"
		cQry += " AND SE1.E1_L_SITUA  = 'I' "
		cQry += " ORDER BY E1_FILIAL,E1_PREFIXO,E1_NUM,E1_PARCELA,E1_TIPO"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg


		
EndCase

Return()

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ NroSeq   º Autor ³ Jeovane               º Data da Criacao  ³ 19/11/2008                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Busca numero de sequencia da baixa no array de baixas do titulo                                              º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ cancBaixa                       						                                                        º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ _cPrefixo   = Prefixo do titulo a ser cancelado a baixa                                                      º±±
±±º          ³ cNum       = Numero do titulo a ser cancelado a baixa                                                        º±±
±±º          ³ cParc      = Parcela do titulo a ser cancelado a baixa                                                       º±±
±±º          ³ cTipo      = Tipo do titulo a ser cancelado a baixa                                                          º±±
±±º          ³ cFor       = Fornecedor do titulo a ser cancelado a baixa                                                    º±±
±±º          ³ cLoja      = Loja do Fornecedor do titulo a ser cancelado a baixa                                            º±±
±±º          ³ _cSeq       = Sequencia da baixa                                                                             º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Numero da baixa a ser cancelado, este numero pode ser diferente do E5_SEQ                                    º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ Microsiga                                                                                					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite.                                                                        						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³00/00/0000³                               				   ³00-000000 -                       ³ TI	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function NroSeq(_cPrefixo,cNum,cParcela,cTipo,cFor,cLoja,_cSeq)

Local nRet 		  := 0
Local _nPos 		  := 0

Private lBaixaAbat:= .F.
Private lNotBax   := .F.
Private lAglImp   := .F.
Private lBxCec    := .F.
Private nTotImpost:= 0
Private nTotAdto  := 0
Private nTotaIRPF := 0
Private aBaixaSE5 := {}

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Comentado por Fabiano Dias no dia 30/05/12 mediante o codigo³
//³logo abaixo.                                                ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

/*
dbSelectArea("SE2")
dbSetOrder(1)
dbGoTop()
dbSeek(xFilial("SE2")+_cPrefixo+cNum+cParcela+cTipo+cFor+cLoja)

cOrigem:=SE2->E2_ORIGEM

//Funcao Padrao do Sistema que retorna um array com as baixas a serem canceladas
aBaixaSE5 := Sel080Baixa("VL /V2 /BA /RA /CP /LJ /NCC/",_cPrefixo,cNum,cParcela,cTipo,@nTotAdto,@lBaixaAbat,cFor,cLoja,@lBxCec,.T.,@lNotBax,@nTotImpost,@lAglImp)
For _nPos := 1 To Len(_aBaixaSE5)
If Substr(_aBaixaSE5[_nPos],LEN(_aBaixaSE5[_nPos])-1,2) == _cSeq
nRet := _nPos
Exit
EndIf
Next _nPos
*/

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Procura pelas baixas deste titulo                                     ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
//aBaixaSE5 :=
Sel080Baixa("VL /V2 /BA /RA /CP /LJ /NCC/",SE2->E2_PREFIXO,SE2->E2_NUM,SE2->E2_PARCELA,SE2->E2_TIPO,@nTotAdto,;
@lBaixaAbat,SE2->E2_FORNECE,SE2->E2_LOJA,@lBxCec,.T.,@lNotBax,@nTotImpost,@lAglImp;
,,,@nTotaIRPF,SE2->E2_IDENTEE)

If Len(aBaixaSE5) > 0
	
	For _nPos := 1 to len(aBaixaSE5)
		
		If aBaixaSE5[_nPos,09] == _cSeq
			
			nRet:= _nPos
			exit
			
		EndIf
		
	Next _nPos
	
EndIf

Return nRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ VldMix2  ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Valida MIX versao 2 ou superior. Se existir Mix 2o Acerto  ³±±
±±³          ³ encerrado, nao permite executar o cancelamento do Acerto,  ³±±
±±³          ³ tem que cancelar os Mix's versao superior a 1 antes.       ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ Nenhum.                                                    ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT010()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function VldMix2()

Local lRet := .F.
Local cQry := ""

cQry := "SELECT COUNT(*) AS QTD FROM "
cQry += RetSqlName("ZLE")
cQry += " WHERE D_E_L_E_T_ = ' '"
cQry += " AND ZLE_FILIAL = '" +xFilial("ZLE")+ "'"
cQry += " AND ZLE_COD = '" + cCodMIX + "'"
cQry += " AND ZLE_VERSAO > '1'"
cQry += " AND ZLE_STATUS = 'F'"
TCQUERY cQry NEW ALIAS ("GLT33")
dbSelectArea("GLT33")

If GLT33->QTD > 0
	lRet := .T.
EndIf

dbSelectArea("GLT33")
dbCloseArea("GLT33")

Return(lRet)

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
Aadd( aHelpPor, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpPor, 'zado para Cancelamento do Fechamento.  ')
Aadd( aHelpSpa, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpSpa, 'zado para Cancelamento do Fechamento.  ')
Aadd( aHelpEng, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpEng, 'zado para Cancelamento do Fechamento.  ')
U_xPutSx1(_cPerg,"01","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch1","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_01","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

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
U_xPutSx1(_cPerg,"02","Versao do MIX ?","Versao do MIX ?","Versao do MIX ?","mv_ch2","C",1,0,0,"G",,,"","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

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
U_xPutSx1(_cPerg,"03","Acerto do Setor?","Acerto do Setor?","Acerto do Setor?","mv_ch3","C",60,0,0,"G",'VAZIO().OR.SUBSTR(MV_PAR03,LEN(AllTrim(MV_PAR03)),1)=="/"',"U_F302","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no Cancto. Vc pode informar')
Aadd( aHelpPor, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpPor, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpPor, 'considerar apenas este produtor.       ')
Aadd( aHelpSpa, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpSpa, 'considerado no Cancto. Vc pode informar')
Aadd( aHelpSpa, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpSpa, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpSpa, 'considerar apenas este produtor.       ')
Aadd( aHelpEng, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpEng, 'considerado no Cancto. Vc pode informar')
Aadd( aHelpEng, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpEng, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpEng, 'considerar apenas este produtor.       ')
U_xPutSx1(_cPerg,"04","Produtor de?","Produtor de?","Produtor de?","mv_ch4","C",6,0,0,"G",,"SA2_L4","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no Acerto.                 ')
Aadd( aHelpSpa, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpSpa, 'considerado no Acerto.                 ')
Aadd( aHelpEng, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpEng, 'considerado no Acerto.                 ')
U_xPutSx1(_cPerg,"05","Produtor Ate?","Produtor Ate?","Produtor Ate?","mv_ch5","C",6,0,0,"G",,"SA2_L4","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Produtor.  ')
Aadd( aHelpSpa, 'Informe o Codigo da Loja do Produtor.  ')
Aadd( aHelpEng, 'Informe o Codigo da Loja do Produtor.  ')
U_xPutSx1(_cPerg,"06","Loja de?","Loja de?","Loja de?","mv_ch6","C",2,0,0,"G",,"","","","MV_PAR06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Produtor.  ')
Aadd( aHelpSpa, 'Informe o Codigo da Loja do Produtor.  ')
Aadd( aHelpEng, 'Informe o Codigo da Loja do Produtor.  ')
U_xPutSx1(_cPerg,"07","Loja Ate?","Loja Ate?","Loja Ate?","mv_ch7","C",2,0,0,"G",,"","","","MV_PAR07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)



aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Rota/Linha inicial ')
Aadd( aHelpSpa, 'Informe o Codigo da Rota/Linha inicial ')
Aadd( aHelpEng, 'Informe o Codigo da Rota/Linha inicial ')
U_xPutSx1(_cPerg,"08","Rota/Linha de?","Rota/Linha de?","Rota/Linha de?","mv_ch8","C",6,0,0,"G",,"ZL3_01","","","MV_PAR08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Rota/Linha final.  ')
Aadd( aHelpSpa, 'Informe o Codigo da Rota/Linha final.  ')
Aadd( aHelpEng, 'Informe o Codigo da Rota/Linha final.  ')
U_xPutSx1(_cPerg,"09","Rota/Linha Ate?","Rota/Linha Ate?","Rota/Linha Ate?","mv_ch9","C",6,0,0,"G",,"ZL3_01","","","MV_PAR09","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ AtualizaSldº Autor ³Guilherme França  º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Atualiza os saldos na tabela ZLV.                          º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³                                                            º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function AtualizaSld(Obj)

Local _cAno := Alltrim(Str(year(ZLE->ZLE_DTFIM)))
Local _cMes := StrZero(Month(ZLE->ZLE_DTFIM),2)

DbSelectArea("ZLV")
DbSetOrder(1)
If ZLV->(DbSeek(xFilial("ZLV")+_cAno+_cMes+SA2->A2_COD+SA2->A2_LOJA))
	RecLock("ZLV",.F.)
	ZLV->(DbDelete())
	ZLV->(MsUnlock())
EndIf


Return

