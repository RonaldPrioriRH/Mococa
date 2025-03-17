#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#DEFINE _ENTER CHR(13)+CHR(10)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ MGLT013  º Autor ³ TOTVS                 º Data da Criacao  ³ 18/12/2008                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Rotina desenvolvida para possibilitar o segundo ou mais Acerto do Leite junto aos produtores.                º±±
±±º          ³                        									                               				        º±±
±±º          ³ Serao calculados os dados Financeiros e gerado a nota fiscal Complementar para os produtores.                º±±
±±º          ³                        									                               				        º±±
±±º          ³                        									                               				        º±±
±±º          ³                        									                               				        º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Fechamento do 2o MIX.           						                                                        º±±
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
±±º          ³          ³                                                  ³                                  ³   	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function MGLT013

Local cPerSetor := ""
Local bProcess  := {|oSelf| MGLT5Exec(oSelf)}
Local oTProces

Private cPerg     := "MGLT013"
Private cMes      := SubStr(DTOS(ADDMes(dDataBase,1)),5,2)
Private cAno      := SubStr(DTOS(ADDMes(dDataBase,1)),1,4)
Private cVencto   := cAno+cMes+Alltrim(GetMv("LT_VENCTO"))//Dia de vencimento dos titulos
Private cDiaPgto  := ""
Private cHist     := "GLT "+cMes+"/"+cAno
Private dDtBase   := dDatabase+7500
Private cGLTalias := "GLT" //Nome do alias para as tabelas temporarias
Private lDeuErro  := .F.
Private nReg      := 0
Private nSldPro   := 0
Private cNroNota  := ""
Private cNroTit   := ""
Private cCodMIX   := ""
Private cVersao   := ""
Private cSetores  := ""
//Private cSerie    := ALLTRIM(GETMV("LT_PRESER")) //Prefixo do titulo e serie da Nota do produtor
Private cSerie	  := padr(ALLTRIM(GETMV("LT_SERIE")),TamSx3("F1_PREFIXO")[1]) // Serie da NF
Private cPrefixo  := padr(ALLTRIM(GETMV("LT_PRESER")),TamSx3("E2_PREFIXO")[1]) //Prefixo do titulo e serie da Nota do produtor
Private cNatureza := ALLTRIM(GETMV("LT_NATGLT")) //Natureza dos titulos do Produtor
Private cTesNFMun := ALLTRIM(GETMV("LT_TESNFE")) //TES utilizada na Nota do Municipio, nao gera contas a pagar

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
cGeraNF := Iif(MV_PAR01==1,"Sim","Nao")
cCodMIX  := MV_PAR02
cVersao  := MV_PAR03
cSetores := ALLTRIM(MV_PAR04)
cDiaPgto := MV_PAR05+"/"+cMes+"/"+cAno
cNroTit  := SUBSTR(DTOS(dDataBase),7,2)+cMes+SUBSTR(cAno,3,2)+STRZERO(VAL(cVersao),3) //Dia+Mes+Ano+versao do Mix
cHist    += "-"+cCodMIX+"/"+cVersao

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

If Val(cVersao) == 1
	xMagHelpFis("PARAMETRO VERSAO INCORRETO",;
	"O parametro Versao do MIX nao pode ser igual a 1.",;
	"Escolha um MIX na versao 2 ou superior.")
	Return()
EndIf

If Empty(cDiaPgto)
	xMagHelpFis("PARAMETRO DIA PAGTO",;
	"O parametro Dia de Pagamento nao foi informado.",;
	"Preencha nos parametros o dia de pagamento")
	Return()
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se existem Mix 2o Fechamento encerrados, se sim nao permite    ³
//³ executar o cancelamento do Acerto, tem que cancelar todos os Mix antes. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
//If VldMix2()                        
If !Fechado(cCodMix,cVersao,xfilial("ZLF"),cSetores) // by abrahao em 03/03/09
	xMagHelpFis("MIX 2o ACERTO",;
	"O 1o Mix não foi fechado.",;
	"Execute o Acerto para o 1o MIX em todos os setores, para depois criar o 2o MIX.")
	Return()
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se o usuario tem permissao para executar a rotina de Acerto.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
DbSelectArea("ZLU")
DbSetOrder(1)
If DbSeek(xFILIAL("ZLU")+U_UCFG001(2))
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
If (GetRpoRelease()>="R1.1")
	cTexto := "Esta rotina tem o objetivo de efetuar o Acerto do S E G U N D O MIX."+_ENTER
	cTexto += " "+_ENTER
	cTexto += "O usuário deve ficar atento também, quanto a data do sistema, que deverá ser o último dia do mês."+_ENTER
	cTexto += " "+_ENTER
	cTexto += "Observe tambem o parametro para geração da Nota, pois o mesmo só deverá ser igual a Sim, quando"+_ENTER
	cTexto += "não existir nenhuma movimentação mais em relação ao leite no período que se esta fazendo o fechamento."+_ENTER
	cTexto += "Ao preencher este campo com Sim o sistema, gerara financeiro para as bonificações do Mix que anida não"+_ENTER
	cTexto += "geraram financeiro e em seguida será gerada a Nota de Complemento."
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Sintaxe da tNewProcess():New( cFunction, cTitle, bProcess, cDescription, cPerg, aInfoCustom) ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	oTProces := tNewProcess():New("MGLT013","Acerto do 2o Mix",bProcess,cTexto,cPerg)
Else
	xMagHelpFis("ATUALIZACAO DO RELEASE",;
	"Você está utilizando uma versão do Protheus que não suporta as configurações desta rotina.",;
	"Atualize o sistema para o Release R1.1 ou superior.")
EndIf

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³MGLT5Exec ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para chamar as rotinas de Acerto.                   ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpO01 - Objeto da Regua de processamento.                 ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT013()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function MGLT5Exec(oObjProc)

Local cFunc    := "1" //Codigo da Qry a ser executada
Local cArqTmp  := cGLTalias+cFunc
Local nCont    := 1
Local nProd    := 0
Local cParc    := StrZero(0,TamSx3("E2_PARCELA")[1]) //Parcela do titulo
Local cProdutor:= ""
Local cLoja    := ""

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona no cadastro de MIX.                                    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
DbSelectArea("ZLE")
DbSetOrder(1)
If DbSeek(xFILIAL("ZLE")+cCodMIX+cVersao)
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Verifica se o Mix ja esta encerrado.                             ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If ZLE->ZLE_STATUS == 'F'
		xMagHelpFis("NAO CONFORMIDADE 00 - MIX FECHADO",;
		"Este Mix ja foi fechado, logo não pode ser rodado o Acerto para o mesmo.",;
		"Escolha outro código de Mix ou cancele o Acerto do mesmo.")
		Return()
	EndIf
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Verifica se a data informada nos parametros eh uma data valida.  ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If Month(ZLE->ZLE_DTINI) != Month(ZLE->ZLE_DTFIM)
		xMagHelpFis("NAO CONFORMIDADE 01 - PERIODO INVALIDO",;
		"Mes inicial "+ALLTRIM(STR(Month(ZLE->ZLE_DTINI)))+" é diferente do mes final "+ALLTRIM(STR(Month(ZLE->ZLE_DTINI)))+" !",;
		"Escolha um MIX onde a data Inicio e Fim estejam no mesmo mês.")
		Return()
	EndIf
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Verifica se a database do sistema esta com o ultimo dia do mes. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If LastDay(ZLE->ZLE_DTFIM) != dDataBase
		xMagHelpFis("NAO CONFORMIDADE 02 - DATABASE INVALIDA",;
		"A data do sistema("+DTOC(dDataBase)+") nao esta no ultimo dia do mes!",;
		"Altere a data do sistema para "+DTOC(LastDay(ZLE->ZLE_DTFIM)) )
		Return()
	EndIf
	
	oObjProc:SaveLog("INICIO - ACERTO DO 2o MIX")
	If oObjProc<>Nil
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Chama funcao para criar tabela Temporaria. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		MsgRun("Aguarde.... Filtrando dados para o Acerto...",,{||CursorWait(), MGLT5QRY(cFunc), CursorArrow()})
		nProd := nReg
		
		DbSelectArea(cArqTmp)
		DbGoTop()
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Armazena o Produto para controle do incremento da parcela do titulo. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		cProdutor := (cArqTmp)->ZLF_RETIRO
		cLoja     := (cArqTmp)->ZLF_RETILJ
		
		While (cArqTmp)->(!Eof())
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Inicia o controle de transacao.³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			Begin Transaction
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Cadastro de Fornecedor( Produtor ). ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			DbSelectArea("SA2")
			DbSetOrder(1)
			If DbSeek(xFILIAL("SA2")+(cArqTmp)->ZLF_RETIRO+(cArqTmp)->ZLF_RETILJ)
				
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Enquanto for o mesmo produtor incrementa a parcela, ³
				//³ quando mudar reinicia o contador da parcela.        ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				If cProdutor == SA2->A2_COD .And. cLoja == SA2->A2_LOJA
					cParc := SOMA1(cParc)
				Else
					cParc    := StrZero(1,TamSx3("E2_PARCELA")[1])
					cLoja    := SA2->A2_LOJA
					cProdutor:= SA2->A2_COD
				EndIf
				
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Posiciona na Linha/Rota do Produtor.                                            ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				DbSelectArea("ZL3")
				DbSetOrder(1)
				If DbSeek(xFILIAL("ZL3")+SA2->A2_L_LI_RO)
					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³ Posiciona no Setor do Produtor.                                                 ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
					DbSelectArea("ZL2")
					DbSetOrder(1)
					If !DbSeek(xFILIAL("ZL2")+ZL3->ZL3_SETOR)
						lDeuErro := .T.
						oObj:SaveLog("ERRO 01 - SETOR INEXISTENTE "+ZL3->ZL3_SETOR)
						xMagHelpFis("NAO CONFORMIDADE 04 - SETOR INEXISTENTE",;
						"O setor: "+ZL3->ZL3_SETOR+" não existe no cadastro de Setores.",;
						"Informe no cadastro de produtor uma linha com Setor existente no cadastro de Setores.")
					EndIf
				Else
					lDeuErro := .T.
					oObj:SaveLog("ERRO 02 - LINHA INEXISTENTE "+SA2->A2_L_LI_RO)
					xMagHelpFis("NAO CONFORMIDADE 05 - LINHA INEXISTENTE",;
					"A linha: "+SA2->A2_L_LI_RO+" não existe no cadastro de linhas.",;
					"Informe no cadastro de produtor uma linha existente no cadastro de linhas.")
				EndIf
				
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Atualiza a regua de processamento.³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				If oObjProc <> Nil
					oObjProc:SetRegua2(nProd)
					oObjProc:IncRegua1("Produtor "+Alltrim(Str(nCont))+" de "+Alltrim(Str(nProd))+" -> "+SA2->A2_COD +"/"+SA2->A2_LOJA +" - "+ALLTRIM(SA2->A2_NOME))
				Endif
				
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Calcula o Saldo contido na ZLF, considerando apenas valores gerados  ³
				//³ pelo MIX ou lancados manualmente pelo usuario.                       ³
				//³                                                                      ³
				//³ Essa variavel vai controlando o saldo do produtor, pois caso a mesma ³
				//³ fique zerada, os titulos nao serao baixados.                         ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				nSldPro  := (cArqTmp)->CREDITO
				cSeekSE2 := xFILIAL("SE2")+("GL"+cVersao)+cNroTit+cParc+"NF "
				cSeekZLF := GrvZLF((cArqTmp)->ZLF_EVENTO,(cArqTmp)->ZLF_SEQ,cSeekSE2)
				
				If !lDeuErro
					IncluiSE2(oObjProc,nSldPro,("GL"+cVersao),cNroTit,cParc,"NF ",cHist,cSeekZLF,"MGLT5Exec")
				EndIf
				
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Apos processar todas as funcoes, flag a ZLF informando que³
				//³ os eventos do produtor foram todos processados.           ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				If !lDeuErro
					
					_cUpdate := "UPDATE " + RetSqlName("ZLF")
					_cUpdate += " SET ZLF_ACERTO = 'S', ZLF_STATUS = 'F'"
					_cUpdate += " WHERE D_E_L_E_T_ = ' '"
					_cUpdate += " AND ZLF_FILIAL    = '" + xFilial("ZLF") + "'"
					_cUpdate += " AND ZLF_RETIRO     = '" + SA2->A2_COD + "'"
					_cUpdate += " AND ZLF_RETILJ    = '" + SA2->A2_LOJA + "'"
					_cUpdate += " AND ZLF_CODZLE    = '" + cCodMIX + "'"
					_cUpdate += " AND ZLF_VERSAO    = '" + cVersao + "'"
					_cUpdate += " AND ZLF_EVENTO    = '" +(cArqTmp)->ZLF_EVENTO + "'"
					_cUpdate += " AND ZLF_SEQ       = '" +(cArqTmp)->ZLF_SEQ + "'"
					_cUpdate += " AND ZLF_ACERTO <> 'S'"
					_cUpdate += " AND ZLF_TP_MIX = 'L' "
					lSqlOk := !(TCSqlExec(_cUpdate) < 0)
					
					If !lSqlOk
						lDeuErro := .T.
						oObj:SaveLog("ERRO 03 - ZLF_ACERTO=S")
						xMagHelpFis("NAO CONFORMIDADE 06 - UPDATE ACERTO",;
						TcSqlError(),;
						"Não Conformidade ao executar o Update de gravacao da Realizacao do Acerto! "+;
						"Não confirme esta mensagem e informe ao Suporte Técnico.")
					Endif
				EndIf
			Else
				oObj:SaveLog("ERRO 05 - Nao existe Produtor "+ALLTRIM((cArqTmp)->ZLF_RETIRO+(cArqTmp)->ZLF_RETILJ))
				xMagHelpFis("NAO CONFORMIDADE 08 - Nao existe Produtor",;
				"Produtor "+ALLTRIM((cArqTmp)->ZLF_RETIRO+(cArqTmp)->ZLF_RETILJ)+" não existe no cadastro!",;
				"Nao sera gerado Acerto para esse produtor. Verifique o código do produtor no MIX versus o cadastro!","Alerta")
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
			
			nCont++
			(cArqTmp)->(DbSkip())
		EndDo
	EndIf
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Apaga arquivo temporario.         ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	DbSelectArea(cArqTmp)
	DbCloseArea(cArqTmp)
	
	If cGeraNF == "Sim" //Se gera Nota Complementar
		If MsgYesNo("Deseja gerar a Nota Complementar?")
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Se gerado uma nota por municipio, ja define o nro do titulo. ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			If cGeraNF == "Sim"
				If Sx5NumNota(cSerie)
					cNroNota := NxtSX5Nota(cSerie)
					dbSelectArea("ZLE")
					RecLock("ZLE",.F.)
					ZLE->ZLE_NFCOMP := cNroNota+cSerie
					ZLE->ZLE_STATUS := 'F'
					MsUnlock()
					GrvNfCom(oObjProc) //Acerto Fiscal(Gera NF Municipio)
				Else
					xMagHelpFis("NAO CONFORMIDADE 03 - NRO NOTA",;
					"O numero da Nota não foi informado!",;
					"Ao executar o Acerto com o parametro Gera Nota = Sim, é obrigatorio informar o número da Nota.")
					Return()
				EndIf
			EndIf
		EndIf
	EndIf
	
	oObjProc:SaveLog("FIM - ACERTO DO 2o Mix")
Else
	xMagHelpFis("NAO CONFORMIDADE 09 - MIX nao encontrado.",;
	"O MIX informado nos parãmetros não foi encontrado!",;
	"Escolha um código de MIX que exista.")
EndIf

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ GrvNfCom ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para gerar a Nota Complementar.                     ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpO01 - Objeto da Regua de processamento.                 ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT013()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GrvNfCom(oObj)

Local cFunc    := "2" //Codigo da Qry a ser executada
Local cArqTmp  := cGLTalias+cFunc
Local cItem    := "0000"
Local nQtde    := 0
Local nVlrUnit := 0
Local nCont    := 1
Local nTotReg  := 0
Local cFornece := SubStr(GetMv("LT_FORNEC"),1,6) //Fornecedor da NF Complementar
Local cLoja    := SubStr(GetMv("LT_FORNEC"),7,4)
Local _aCab    := {}
Local _aItens  := {}
Local _aArea   := {}
Local _aAlias  := {}

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³  Salva a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL8","ZLF","SF1","SD1","ZLF","SX1"})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("INICIO - Nota por Municipio")

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Chama funcao para criar tabela Temporaria. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
MsgRun("Aguarde.... Filtrando dados para NF Municipio...",,{||CursorWait(), MGLT5QRY(cFunc), CursorArrow()})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza a regua de processamento.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If oObj <> Nil
	nTotReg := nReg
	oObj:SetRegua2(nTotReg)
Endif

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cabecalho da Nota Fiscal( SigaAuto). ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
DbSelectArea(cArqTmp)
DbGoTop()

_aCab :={{"F1_TIPO","N"			  ,NIL},;	// Tipo da Nota = Beneficiamento.
{"F1_FORMUL"	,"S"		      ,NIL},;	// Formulario Proprio = Sim.
{"F1_DOC"		,cNroNota         ,NIL},;	// Numero do Documento.
{"F1_SERIE"		,cSerie 	      ,NIL},;	// Serie do Documento.
{"F1_PREFIXO"	,cPrefixo         ,NIL},;	// Prefixo do Documento.
{"F1_EMISSAO"	,dDataBase	      ,NIL},;	// Data de Emissao.
{"F1_DESPESA"	,0			      ,NIL},;	// Despesa
{"F1_FORNECE"	,cFornece   	  ,NIL},;	// Codigo do Fornecedor.
{"F1_LOJA"	  	,cLoja      	  ,NIL},;	// Loja do Fornecedor.
{"F1_ESPECIE"	,"NFE"    	      ,NIL},;	// Especie do Documento.
{"F1_COND"		,"001"	          ,NIL},;	// Condicao de Pagamento.
{"F1_DESCONT"	,0	    	      ,NIL},;	// Desconto
{"F1_SEGURO"	,0	    	      ,NIL},;	// Seguro
{"F1_FRETE"		,0	    	      ,NIL},;	// Frete
{"F1_PESOL"		,0	              ,NIL}}	// Peso Liquido

While (cArqTmp)->(!Eof())
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Atualiza a regua de processamento.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If oObj <> Nil
		oObj:IncRegua2("Nota Fiscal - Item "+Alltrim(Str(nCont))+" de "+Alltrim(Str(nTotReg)))
		nCont++
	Endif
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Cadastro de Produtos. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	DbSelectArea("SB1")
	DbSetOrder(1)
	If DbSeek(xFILIAL("SB1")+(cArqTmp)->ZL8_SB1COD)
		
		nQtde    := Iif((cArqTmp)->ZLF_QTDBOM>0,(cArqTmp)->ZLF_QTDBOM,1)
		nVlrUnit := (cArqTmp)->ZLF_TOTAL/nQtde
		cItem    := SOMA1(cItem)
		
		aAdd(_aItens,{{"D1_ITEM",cItem				  ,NIL},;	// Sequencia Item Pedido
		{"D1_COD"		,SB1->B1_COD				  ,NIL},;	// Codigo do Produto
		{"D1_QUANT"		,nQtde						  ,NIL},;	// Quantidade
		{"D1_VUNIT"		,nVlrUnit		              ,NIL},;	// Valor Unitario
		{"D1_TOTAL"		,(cArqTmp)->ZLF_TOTAL        ,NIL},;	// Valor Total
		{"D1_TES"		,ALLTRIM(cTesNFMun)		      ,NIL},;	// Tipo de Entrada - TES
		{"D1_LOCAL"		,SB1->B1_LOCPAD				  ,NIL},;	// Armazem Padrao do Produto
		{"D1_SEGURO"	,0							  ,NIL},;	// Seguro
		{"D1_VALFRE"	,0							  ,NIL},;	// Frete
		{"D1_DESPESA"	,0							  ,NIL}})	// Despesa
	Else
		lDeuErro := .T.
		oObj:SaveLog("ERRO 08 - Produto "+ALLTRIM(ZL8->ZL8_SB1COD)+" / Produtor "+ALLTRIM((cArqTmp)->ZLF_RETIRO+(cArqTmp)->ZLF_RETILJ))
		xMagHelpFis("NAO CONFORMIDADE 11 - Produto nao encontrado",;
		"Produto "+ALLTRIM(ZL8->ZL8_SB1COD)+" não existe no cadastro!",;
		"Nao sera gerado Nota Fiscal para o produtor "+(cArqTmp)->ZLF_RETIRO+(cArqTmp)->ZLF_RETILJ)
		_aCab    := {}
		_aItens  := {}
	EndIf
	(cArqTmp)->(DbSkip())
EndDo

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ SigaAuto de Geracao da Nota.      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If Len(_aCab)>0 .And. Len(_aItens)>0
	MATA103(_aCab,_aItens,3)
	If lMsErroAuto
		lDeuErro := .T.
		oObj:SaveLog("ERRO 09 - SIGAAUTO DE NOTA")
		MostraErro()
	Endif
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atualiza o log de processamento   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oObj:SaveLog("FIM - Nota por Municipio")

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(2,_aArea,_aAlias)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Apaga arquivo temporario.         ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
DbSelectArea(cArqTmp)
DbCloseArea(cArqTmp)

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
±±³ Uso      ³ MGLT013()                                                  ³±±
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

Local _cTpFor	:= ""//U_GETRELA1("1","ZL1_PLEITE") //#LETRAS

DEFAULT cPrefSE2 := ""

_cTpFor	+= ""//U_GETRELA1("1","ZL1_GRANEL") //#LETRAS

Do Case
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Filtra os produtores do MIX para iniciar o processamento.   ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Case cOpc == "1"
		cQry := "SELECT ZLF_RETIRO,ZLF_RETILJ,ZLF_EVENTO,ZLF_SEQ,ZLF_SETOR,ZLF_LINROT,SUM(ZLF_TOTAL) AS CREDITO"
		cQry += " FROM "+RetSqlName("ZLF")+" ZLF, "+RetSqlName("ZL8")+" ZL8"
		cQry += " JOIN "+RetSqlName("SA2")+" SA2 ON ZLF.ZLF_RETIRO = SA2.A2_COD AND ZLF.ZLF_RETILJ = SA2.A2_LOJA " //#LETRAS
		cQry += " WHERE ZLF.D_E_L_E_T_ = ' '"
		cQry += " AND ZL8.D_E_L_E_T_ = ' '"
		cQry += " AND SA2.D_E_L_E_T_ = ' '" //#LETRAS
		cQry += " AND ZLF.ZLF_FILIAL = '" +xFILIAL("ZLF")+ "'"
		cQry += " AND ZL8.ZL8_FILIAL = '" +xFILIAL("ZL8")+ "'"
		cQry += " AND SA2.SA2_FILIAL = '" + xFilial("SA2")	+ "'" //#LETRAS
		If !Empty(cSetores) //Se o parametro com os setores estiver vazio considera todos.
			cQry += " AND ZLF.ZLF_SETOR IN (" + U_AjustSet(cSetores) + ")"
		EndIf
		cQry += " AND ZLF.ZLF_CODZLE = '" + cCodMIX + "'"
		cQry += " AND ZLF.ZLF_VERSAO = '" + cVersao + "'"
		cQry += " AND SUBSTR(ZLF.ZLF_RETIRO,1,1) IN ('P','G')" //#LETRAS
		//cQry += " AND SA2.A2_C_TPFOR IN " + U_ajusSQL(_cTpFor) + " " //#LETRAS
		cQry += " AND ZLF.ZLF_ACERTO <> 'S'" //Nao tiveram acerto
		cQry += " AND ZLF.ZLF_ORIGEM = 'M'"	 //ZLF gerada pelo Mix
		cQry += " AND ZLF.ZLF_TP_MIX = 'L'"  //Tipo do Mix igual a Leite
		cQry += " AND ZLF.ZLF_DEBCRE = 'C'"
		cQry += " AND ZLF.ZLF_EVENTO = ZL8.ZL8_COD"
		cQry += " AND ZL8.ZL8_SB1COD <> ' '" //Somente eventos com codigo de produto.
		//cQry += " AND ZL8.ZL8_IMPNF = 'N'"   //Somente eventos que nao sao impressos na Nota.
		cQry += " AND ZL8.ZL8_DEBCRE = 'C'"  //Somente eventos de Credito.
		cQry += " GROUP BY ZLF_RETIRO,ZLF_RETILJ,ZLF_EVENTO,ZLF_SEQ,ZLF_SETOR,ZLF_LINROT"
		cQry += " ORDER BY ZLF_SETOR,ZLF_LINROT,ZLF_RETIRO,ZLF_RETILJ"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		xmaghelpfis("",cQry,"")
		dbSelectArea(cGLTalias+cOpc)
		Count To nReg
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Acerto Complementar(Gera NF Complementar). ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Case cOpc == "2"
		cQry := "SELECT ZLF_EVENTO,ZL8_SB1COD,SUM(ZLF_QTDBOM) AS ZLF_QTDBOM,SUM(ZLF_TOTAL) AS ZLF_TOTAL FROM "
		cQry += RetSqlName("ZLF")+" ZLF, "+RetSqlName("ZL8")+" ZL8"
		cQry += " JOIN "+RetSqlName("SA2")+" SA2 ON ZLF.ZLF_RETIRO = SA2.A2_COD AND ZLF.ZLF_RETILJ = SA2.A2_LOJA " //#LETRAS
		cQry += " WHERE ZLF.D_E_L_E_T_ = ' '"
		cQry += " AND ZL8.D_E_L_E_T_ = ' '"
		cQry += " AND SA2.D_E_L_E_T_ = ' '" //#LETRAS
		cQry += " AND ZLF.ZLF_FILIAL = '" +xFILIAL("ZLF")+ "'"
		cQry += " AND ZL8.ZL8_FILIAL = '" +xFILIAL("ZL8")+ "'"
		cQry += " AND SA2.SA2_FILIAL = '" + xFilial("SA2")	+ "'" //#LETRAS
		cQry += " AND ZLF.ZLF_CODZLE = '" +cCodMIX+ "'"
		cQry += " AND ZLF.ZLF_VERSAO <= '" +cVersao+ "'"
		cQry += " AND ZLF.ZLF_EVENTO = ZL8.ZL8_COD"
		cQry += " AND SUBSTR(ZLF.ZLF_RETIRO,1,1) IN ('P','G')" //#LETRAS
		//cQry += " AND SA2.A2_C_TPFOR IN " + U_ajusSQL(_cTpFor) + " " //#LETRAS
		cQry += " AND ZLF.ZLF_DEBCRE = 'C'"
		cQry += " AND ZLF.ZLF_ACERTO = 'S'"
		cQry += " AND ZLF.ZLF_TP_MIX = 'L'"
		cQry += " AND ZL8.ZL8_SB1COD <> ' '"
		cQry += " AND ZL8.ZL8_IMPNF  = 'N'"   //Somente eventos que nao sao impressos na Nota.
		cQry += " AND ZL8.ZL8_DEBCRE = 'C'"  //Somente eventos de Credito.
		cQry += " GROUP BY ZLF_EVENTO,ZL8_SB1COD"
		cQry += " ORDER BY ZLF_EVENTO"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To nReg
EndCase

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ IncluiSE2³ Autor ³ Microsiga             ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Inclui titulo no contas a pagar via SigaAuto.              ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpO01 - Objeto da regua de Processamento.                 ³±±
±±³          ³ ExpN02 - Valor do titulo a ser incluido.                   ³±±
±±³          ³ ExpC03 - Prefixo do titulo a ser incluido.                 ³±±
±±³          ³ ExpC04 - Numero do titulo a ser incluido.                  ³±±
±±³          ³ ExpC05 - Parcela do titulo a ser incluido.                 ³±±
±±³          ³ ExpC06 - Tipo do titulo a ser incluido.                    ³±±
±±³          ³ ExpC07 - Historico do titulo a ser incluido.               ³±±
±±³          ³ ExpC08 - Chave de pesquisa para vincular o titulo na ZLF.  ³±±
±±³          ³ ExpC09 - Nome da Static Function que chamou a IncluiSE2(). ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ GENERICO                                                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function IncluiSE2(oObj,nVlrTit,cPrefixo,cNroTit,cParcela,cTipo,cHistTit,cSeek,cFunName)

Local nModAnt  := nModulo
Local cModAnt  := cModulo
Local aAutoSE2 := {}

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

DEFAULT cSeek := ""

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se o titulo ja existe na base, para nao duplicar. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("SE2")
dbSetOrder(1)
If DbSeek(xFILIAL("SE2")+cPrefixo+cNroTit+cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA)
	lDeuErro := .T.
	oObj:SaveLog("ERRO 12 - TITULO DUPLICADO - "+cFunName)
	xMagHelpFis("NAO CONFORMIDADE 16 - TITULO DUPLICADO",;
	"O titulo "+xFILIAL("SE2")+cPrefixo+cNroTit+cParcela+cTipo+;
	" ja existe para o produtor"+SA2->A2_COD+"/"+SA2->A2_LOJA+"-"+SA2->A2_NOME,;
	"Verifique no financeiro porque ja existe um titulo com estas caracteristicas e exclua-o.")
Else
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Array com os dados a serem passados para o SigaAuto. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	aAutoSE2:={{"E2_PREFIXO",cPrefixo,Nil},;
	{"E2_NUM"    ,cNroTit        ,Nil},;
	{"E2_TIPO"   ,cTipo          ,Nil},;
	{"E2_PARCELA",cParcela       ,Nil},;
	{"E2_NATUREZ",cNatureza      ,Nil},;
	{"E2_FORNECE",SA2->A2_COD    ,Nil},;
	{"E2_LOJA"   ,SA2->A2_LOJA   ,Nil},;
	{"E2_EMISSAO",dDataBase      ,Nil},;
	{"E2_VENCTO" ,CTOD(cDiaPgto) ,Nil},;
	{"E2_VENCREA",CTOD(cDiaPgto) ,Nil},;
	{"E2_HIST"   ,cHistTit       ,Nil},;
	{"E2_VALOR"  ,nVlrTit        ,Nil},;
	{"E2_PORCJUR",0.03           ,Nil},;
	{"E2_DATALIB",dDataBase      ,Nil},;
	{"E2_USUALIB",Alltrim(cUserName),Nil},;
	{"E2_L_LINRO",SA2->A2_L_LI_RO,Nil},;
	{"E2_L_SETOR",ZL2->ZL2_COD   ,Nil},;
	{"E2_L_MIX"  ,cCodMIX        ,Nil},;
	{"E2_L_VERSA",cVersao        ,Nil},;
	{"E2_L_TPPAG",SA2->A2_L_TPPAG,Nil},;
	{"E2_L_SITUA","I"            ,Nil},;
	{"E2_L_SEEK" ,cSeek          ,Nil}}
	
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
		oObj:SaveLog("ERRO 13 - SIGAAUTO INCLUSAO TITULO - "+cFunName)
		Mostraerro()
	Endif
EndIf

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ GrvZLF   ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para alterar registros na tabela ZLF.               ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpC02 - Codigo do Evento.                                 ³±±
±±³          ³ ExpC03 - Sequencia do Evento.                              ³±±
±±³          ³ ExpC04 - Conteudo do indice para identificar o Titulo(SE2).³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ GENERICO                                                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GrvZLF(cEvento,cSeq,cSeek)

DbSelectArea("ZL8")
DbSetOrder(1)//ZL8_FILIAL+ZL8_COD
DbSeek(xFILIAL("ZL8")+cEvento)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona na ZLF para alterar o campo ZLF_L_SEEK do registro.                             ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
DbSelectArea("ZLF")
DbSetOrder(1)//ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_RETIRO+ZLF_RETILJ+ZLF_EVENTO+ZLF_SEQ
If DbSeek(xFILIAL("ZLF")+cCodMIX+cVersao+SA2->A2_COD+SA2->A2_LOJA+cEvento+cSeq)
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Gravacao dos dados.                                                    ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	dbSelectArea("ZLF")
	RecLock("ZLF",.F.)
	ZLF->ZLF_L_SEEK := cSeek
	ZLF->(MsUnlock())
EndIf

Return(ZLF->ZLF_FILIAL+ZLF->ZLF_CODZLE+ZLF->ZLF_VERSAO+ZLF->ZLF_RETIRO+ZLF->ZLF_RETILJ+ZLF->ZLF_EVENTO+ZLF->ZLF_SEQ)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ VldMix2  ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Valida MIX versao 1 ja foi encerrado. So permite rodar     ³±±
±±³          ³ o Acerto do 2o Mix caso o acerto do 1o Mix ja tenha sido   ³±±
±±³          ³ executado.                                                 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ Nenhum.                                                    ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ MGLT010()                                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function VldMix2(cpSetor)

Local lRet := .F.
Local cQry := ""

cQry := "SELECT COUNT(*) AS QTD FROM "
cQry += RetSqlName("ZLE")
cQry += " WHERE D_E_L_E_T_ = ' '"
cQry += " AND ZLE_FILIAL = '" +xFILIAL("ZLE")+ "'"
cQry += " AND ZLE_COD = '" + cCodMIX + "'"
cQry += " AND ZLE_VERSAO = '1'"
cQry += " AND ZLE_STATUS <> 'F'"
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
Aadd( aHelpPor, 'Informe Sim para ser gerado a Nota     ')
Aadd( aHelpPor, 'Complementar e o financeiro neste      ')
Aadd( aHelpPor, 'momento ou Nao p/ gerar somente o      ')
Aadd( aHelpPor, 'financeiro.                            ')
Aadd( aHelpSpa, 'Informe Sim para ser gerado a Nota     ')
Aadd( aHelpSpa, 'Complementar e o financeiro neste      ')
Aadd( aHelpSpa, 'momento ou Nao p/ gerar somente o      ')
Aadd( aHelpSpa, 'financeiro.                            ')
Aadd( aHelpEng, 'Informe Sim para ser gerado a Nota     ')
Aadd( aHelpEng, 'Complementar e o financeiro neste      ')
Aadd( aHelpEng, 'momento ou Nao p/ gerar somente o      ')
Aadd( aHelpEng, 'financeiro.                            ')
U_xPutSx1(cPerg,"01","Gera Nota?","Gera Nota?","Gera Nota?","mv_ch1","C",1,0,0,"C",'',"","","","mv_par01","Sim","","","","Nao","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

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
U_xPutSx1(cPerg,"02","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch2","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_01","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Versao do MIX. Utilizar versao 2 ou    ')
Aadd( aHelpPor, 'superior. Informe a versao inicial.    ')
Aadd( aHelpSpa, 'Versao do MIX. Utilizar versao 2 ou    ')
Aadd( aHelpSpa, 'superior. Informe a versao inicial.    ')
Aadd( aHelpEng, 'Versao do MIX. Utilizar versao 2 ou    ')
Aadd( aHelpEng, 'superior. Informe a versao inicial.    ')
U_xPutSx1(cPerg,"03","Versao do MIX ?","Da Versao MIX ?","Da Versao MIX ?","mv_ch3","C",1,0,0,"G",,,"","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

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
U_xPutSx1(cPerg,"04","Acerto do Setor?","Acerto do Setor?","Acerto do Setor?","mv_ch4","C",60,0,0,"G",'VAZIO().OR.SUBSTR(MV_PAR04,LEN(ALLTRIM(MV_PAR04)),1)=="/"',"U_F302","","","mv_par04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Dia de pagamento dos titulos ')
Aadd( aHelpPor, 'que serao gerados para o produtor.     ')
Aadd( aHelpSpa, 'Informe o Dia de pagamento dos titulos ')
Aadd( aHelpSpa, 'que serao gerados para o produtor.     ')
Aadd( aHelpEng, 'Informe o Dia de pagamento dos titulos ')
Aadd( aHelpEng, 'que serao gerados para o produtor.     ')
U_xPutSx1(cPerg,"05","Dia de Pagamento","Dia de Pagamento","Dia de Pagamento","mv_ch5","C",2,0,0,"G","","","","","mv_par05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºFuncao    ³ Fechado  º Autor ³ Abrahao            º Data ³  03/03/09   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Verifica se os setores estao fechados                      º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa principal                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

Static Function Fechado(cpMix,cpVersao,cpFilial,cpSetores)
Local nQtd	:=	0
Local lRet	:=	.F. 
Local aSetores:={}

aSetores :=strtokarr(cpSetores,"/")
for x:=1 to len(aSetores)
	cpSetores+="'"+aSetores[x]+"'"
	if x != len(aSetores)
		cpSetores += ","
	endif
next x

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ,ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Obtem quantidade de registros nao abertos                           ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cQuery := "SELECT COUNT(*) AS QTDREG FROM " + RetSqlName("ZLF") + " ZLF "
cQuery += " WHERE D_E_L_E_T_ = ' '"
cQuery += " AND ZLF_FILIAL ='"+cpFilial+"'"
cQuery += " AND ZLF_VERSAO ='"+cpVersao+"'"
cQuery += " AND ZLF_CODZLE ='"+cpMix+"'"
cQuery += " AND ZLF_SETOR IN ("+cpSetores+") "
cQuery += " AND ZLF_TP_MIX = 'L' "
cQuery += " AND ZLF_STATUS != 'F' "

If Select("TRX") <> 0
	TRX->(dbCloseArea("TRX"))
Endif

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRX", .T., .F. )
if !TRX->(eof())
	nQtd:=TRX->QTDREG
endif
TRX->(dbcloseArea())

if nQtd > 0
	lRet:=.F.
else
	lRet:=.T.
endif

return lRet