#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ MGLT016  º Autor ³ TOTVS                 º Data da Criacao  ³ 12/02/2009                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Rotina desenvolvida para possibilitar o cancelamento dos cheques dos produtores.                             º±±
±±º          ³                        									                               				        º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Cancelamento dos cheques dos produtores automaticamente.                                                     º±±
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
User Function MGLT016

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Declaracao de Variaveis.             ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Private cMarca    := GetMark()
Private lInverte  := .F.
Private lDeuErro  := .F.
Private cPerg     := "MGLT016"
Private cCadastro := "Cancelamento de Cheque do Produtor/Fretista"
Private aCampos   := {}
Private aRotina   := {}
Private bCancCh   := {|| CancChq(cMarca)}
Private cBanco    := ""
Private cAgencia  := ""
Private cConta    := ""
Private aTitulos  := {}
Private aProdutor := {}

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Atribuicao de Valores no aRotina.    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Private aRotina:={{"Cancela Chq",'Eval(bCancCh)',0,2,0}}

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
//³ Atualiza os valores das variaveis.                                  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cBanco   := MV_PAR01
cAgencia := MV_PAR02
cConta   := MV_PAR03

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cria o arquivo Temporario para insercao dos dados selecionados. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
MsgRun("Aguarde.... Criando arquivo temporario...",,{||CursorWait(), GLTCRIA(), CursorArrow()})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Chama funcao para selecao dos dados.                                ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
MsgRun("Aguarde.... Selecionando dados...",,{||CursorWait(), GLTSEL(), CursorArrow()})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Chama funcao para criar a MarkBrowse.                               ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
GLTMOST()

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ GLTMOST  º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Define os campos a serem apresentados na MarkBrowse.       º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa Principal.                                        º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GLTMost()

aadd(acampos ,{"TRB_OK"     ,"  "              ,"   "})
aadd(acampos ,{"TRB_FORNEC" ,"@!!!!!!"         ,"Prod/Fret"})
aadd(acampos ,{"TRB_LOJA"   ,"@!!!!"           ,"Loja"})
aadd(acampos ,{"TRB_NOME"   ,"@!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!","Nome"})
aadd(acampos ,{"TRB_CHEQUE" ,"@!!!!!!!!!!!!!!!","Cheque"})
aadd(acampos ,{"TRB_VALOR"  ,"","Valor",PesqPict("SE2","E2_VALOR",14,2) })
aadd(acampos ,{"TRB_IMPRES" ,"@!!!"            ,"Impresso"})
aadd(acampos ,{"TRB_BANCO"  ,"@!!!"            ,"Banco"})
aadd(acampos ,{"TRB_AGENCI" ,"@!!!!!"          ,"Agencia"})
aadd(acampos ,{"TRB_CONTA"  ,"@!!!!!!!!!!"     ,"Conta"})
aadd(acampos ,{"TRB_SETOR"  ,"@!!!!!!"         ,"Setor"})
aadd(acampos ,{"TRB_LINHA"  ,"@!!!!!!"         ,"Linha"})
aadd(acampos ,{"TRB_MIX"    ,"@!!!!!!"         ,"Mix"})
aadd(acampos ,{"TRB_VERSAO" ,"@!"              ,"Versao"})

dbSelectArea("TRB")
TRB->(DbGotop())

MarkBrow("TRB","TRB_OK",,aCampos,.F.,cMarca,,,,,)

dbSelectArea("TRB")
DbCloseArea()

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ CancChq  º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Gera o cheque do produtor.                                 º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa Principal.                                        º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function CancChq()

Local nProc1   := 0
Local nProc2   := 0

If MsgYesNo("Deseja cancelar CHEQUE para os produtores/fretistas marcados?")
	
	DbSelectArea("TRB")
	TRB->(DbGoTop())
	
	While TRB->(!Eof())
		
		If IsMark( 'TRB_OK', cMarca )
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Grava no array aProdutor que o cheque deve ser cancelado.  ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			nAcho := Ascan(aProdutor,{|x| x[1] == ALLTRIM(TRB->TRB_CHEQUE) })
			If nAcho > 0
				aProdutor[nAcho][8] := .T. // .T. cancela o cheque e a baixa do titulo.
			EndIf
		EndIf
		
		TRB->(DbSkip())
	EndDo

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Cancela o cheque para cada produtor marcado no arquivo TRB. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	For nProc1 := 1 To Len(aProdutor)
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Posiciona no cadastro do Fornecedor.                        ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		DbSelectArea("SA2")
		DbSetOrder(1)//A2_FILIAL+A2_COD+A2_LOJA
		DbSeek(xFILIAL("SA2")+aProdutor[nProc1][6]+aProdutor[nProc1][7])
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Inicia o controle de transacao. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		Begin Transaction
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Chama funcao para fazer o cancelamento do Cheque antes de cancelar a baixa do Titulo. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		If aProdutor[nProc1][8]
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³Executa a rotina de cancelamento de cheque.                 ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			MsgRun("Cancelando o cheque "+aProdutor[nProc1][3],,{||CursorWait(),;
			lDeuErro := CancCheq(aProdutor[nProc1][3],aProdutor[nProc1][4],aProdutor[nProc1][5],PADR(aProdutor[nProc1][1],TamSX3("EF_NUM")[1]) ), CursorArrow()})
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ Processa todos os titulos, do produtor.                                                         ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			For nProc2 := 1 To Len(aTitulos)
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³ Se cheque do Produtor = cheque do Titulo e cancela cheque = .T.                                 ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				If aProdutor[nProc1][1] == aTitulos[nProc2][1] .And. aProdutor[nProc1][8] .And. !lDeuErro
					//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
					//³Executa o SigaAuto de cancelamento de Baixa de Titulo.      ³
					//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
					MsgRun("Cancelando a baixa do titulo de "+aTitulos[nProc2][9],,{||CursorWait(),;
					CancBxSE2(aTitulos[nProc2][2],aTitulos[nProc2][3],aTitulos[nProc2][4],aTitulos[nProc2][5],aTitulos[nProc2][6],;
					aTitulos[nProc2][7],aTitulos[nProc2][8]), CursorArrow()})
				EndIf
			Next nProc2
		EndIf
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Deleta os cheques que foram selecionados.                   ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		If !lDeuErro .And. aProdutor[nProc1][8]
			DbSelectArea("TRB")
			TRB->(DbGoTo(aProdutor[nProc1][9]))
			RecLock( 'TRB', .F. )
			DbDelete()
			MsUnLock()
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
	Next nProc1
EndIf

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ GLTCRIA  º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Cria um arquivo Temporario com os campos a serem apresen-  º±±
±±º          ³ tados na MarkBrowse.                                       º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa Principal.                                        º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GLTCria()

Local aEstru := {}
Local aArq2

aadd(aEstru,{"TRB_OK"      ,'C',02,0})
aadd(aEstru,{"TRB_FORNEC"  ,'C',06,0})
aadd(aEstru,{"TRB_LOJA"    ,'C',04,0})
aadd(aEstru,{"TRB_NOME"    ,'C',40,0})
aadd(aEstru,{"TRB_CHEQUE"  ,'C',15,0})
aadd(aEstru,{"TRB_VALOR"   ,'N',14,2})
aadd(aEstru,{"TRB_IMPRES"  ,'C',01,0})
aadd(aEstru,{"TRB_BANCO"   ,'C',03,0})
aadd(aEstru,{"TRB_AGENCI"  ,'C',05,0})
aadd(aEstru,{"TRB_CONTA"   ,'C',10,0})
aadd(aEstru,{"TRB_SETOR"   ,'C',06,0})
aadd(aEstru,{"TRB_LINHA"   ,'C',06,0})
aadd(aEstru,{"TRB_MIX"     ,'C',06,0})
aadd(aEstru,{"TRB_VERSAO"  ,'C',01,0})

aArq2 := CriaTrab(aEstru,.T.)
If Select("TRB") <> 0
	TRB->(dbCloseArea())
EndIf
Use &aArq2 Alias TRB NEW
Index on TRB_CHEQUE To &aArq2

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ GLTSEL   º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Seleciona os dados a serem apresentados na MarkBrowse.     º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa Principal.                                        º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GLTSel()

Local cQuery  := ""
Local cPrdFab := ""
Local nTabFor := 0
Local nVlrIPI := 0

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Query para Selecao dos dados.                                   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cQuery := "SELECT E2_BCOPAG,E2_NUMBCO,E2_IMPCHEQ,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO,E2_FORNECE,E2_LOJA,"
cQuery += "E2_VALOR,E2_SALDO,E2_L_LINRO,E2_L_SETOR,E2_L_MIX,E2_L_VERSA,"
cQuery += "E5_VALOR,E5_SEQ,E5_MOTBX,E5_DATA,E5_BANCO,E5_AGENCIA,E5_CONTA,E5_NUMCHEQ FROM "
cQuery += RetSqlName("SE2")+" SE2, "+RetSqlName("SE5")+" SE5"
cQuery += " WHERE SE2.D_E_L_E_T_ = ' ' AND SE5.D_E_L_E_T_ = ' ' "
cQuery += "AND SE2.E2_FILIAL  = '"+xFILIAL("SE2")+"' "
cQuery += "AND SE5.E5_FILIAL  = '"+xFILIAL("SE5")+"' "
cQuery += "AND SE2.E2_L_MIX   = '"+MV_PAR04+"' "
cQuery += "AND SE2.E2_L_VERSA BETWEEN '"+MV_PAR05+"' AND '"+MV_PAR06+"' "
cQuery += "AND SE2.E2_FORNECE BETWEEN '"+MV_PAR08+"' AND '"+MV_PAR09+"' "
cQuery += "AND SE2.E2_LOJA    BETWEEN '"+MV_PAR10+"' AND '"+MV_PAR11+"' "
cQuery += "AND SE2.E2_L_LINRO BETWEEN '"+MV_PAR12+"' AND '"+MV_PAR13+"' "
If !Empty(Alltrim(MV_PAR07))    //Se o parametro com os setores estiver vazio considera todos.
	cQuery += " AND SE2.E2_L_SETOR IN (" + U_AjustSet(Alltrim(MV_PAR07)) + ") "
EndIf
cQuery += "AND SE2.E2_TIPO  = 'NF ' "   //Somente titulos a pagar para o Produtor
cQuery += "AND SE2.E2_SALDO = 0 "       //Somente titulos baixados totalmente
cQuery += "AND SE2.E2_PREFIXO = SE5.E5_PREFIXO "
cQuery += "AND SE2.E2_NUM     = SE5.E5_NUMERO "
cQuery += "AND SE2.E2_PARCELA = SE5.E5_PARCELA "
cQuery += "AND SE2.E2_TIPO    = SE5.E5_TIPO "
cQuery += "AND SE2.E2_FORNECE = SE5.E5_FORNECE "
cQuery += "AND SE2.E2_LOJA    = SE5.E5_LOJA "
cQuery += "AND SE5.E5_BANCO   = '"+MV_PAR01+"' "
cQuery += "AND SE5.E5_AGENCIA = '"+MV_PAR02+"' "
cQuery += "AND SE5.E5_CONTA   = '"+MV_PAR03+"' "
cQuery += "AND SE5.E5_NUMCHEQ <> ' ' "
cQuery += "AND SE5.E5_SITUACA <> 'C' "
cQuery += "AND SE5.E5_RECPAG  = 'P' "
cQuery += "AND SE5.E5_TIPODOC = 'BA' "
cQuery += "AND SE5.E5_MOTBX   = 'NOR' "
TCQUERY cQuery NEW ALIAS "TMP"

DbSelectArea("TMP")
TMP->(DbGoTop())

While TMP->(!EOF())
	
	DbSelectArea("TRB")
	TRB->(DbGoTop())
	
	DbSelectArea("SA2")
	DbSetOrder(1)
	DbSeek(xFILIAL("SA2")+TMP->E2_FORNECE+TMP->E2_LOJA)
	
	nAcho := Ascan(aProdutor,{|x| x[1] == ALLTRIM(TMP->E5_NUMCHEQ) })
	If nAcho == 0
		RecLock("TRB",.T.)
		TRB->TRB_FORNEC  := TMP->E2_FORNECE
		TRB->TRB_LOJA    := TMP->E2_LOJA
		TRB->TRB_NOME    := ALLTRIM(SA2->A2_NOME)
		TRB->TRB_CHEQUE  := TMP->E5_NUMCHEQ
		TRB->TRB_VALOR   := TMP->E5_VALOR
		TRB->TRB_IMPRES  := If(SubStr(TMP->E5_NUMCHEQ,1,1)=="*","N","S")
		TRB->TRB_BANCO   := TMP->E5_BANCO
		TRB->TRB_AGENCI  := TMP->E5_AGENCIA
		TRB->TRB_CONTA   := TMP->E5_CONTA
		TRB->TRB_SETOR   := TMP->E2_L_SETOR
		TRB->TRB_LINHA   := TMP->E2_L_LINRO
		TRB->TRB_MIX     := TMP->E2_L_MIX
		TRB->TRB_VERSAO  := TMP->E2_L_VERSA
		MsUnlock("TRB")
		
		AAdd(aProdutor,{ALLTRIM(TMP->E5_NUMCHEQ),TMP->E5_VALOR,TMP->E5_BANCO,TMP->E5_AGENCIA,TMP->E5_CONTA,;
		TMP->E2_FORNECE,TMP->E2_LOJA,.F.,TRB->(Recno())})
	Else
		aProdutor[nAcho][2] += TMP->E5_VALOR
	EndIf
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Armazena os titulos do cheque, para depois cancelar as suas baixas. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	AAdd(aTitulos,{ALLTRIM(TMP->E5_NUMCHEQ),TMP->E5_VALOR,TMP->E2_PREFIXO,TMP->E2_NUM,TMP->E2_PARCELA,TMP->E2_TIPO,;
	TMP->E5_SEQ,TMP->E5_DATA,ALLTRIM(SA2->A2_NOME)})
	
	TMP->(DbSkip())
EndDo

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Ordena o array por ordem de Cheque. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aSort(aProdutor,,,{|x, y| x[1] < y[1]})
aSort(aTitulos,,,{|x, y| x[1] < y[1]})

DbSelectArea("TMP")
DbCloseArea("TMP")

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ CancBxSE2³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Cancela Baixa titulo no contas a pagar via SigaAuto.       ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpN01 - Valor a ser baixado no titulo.                    ³±±
±±³          ³ ExpC02 - Prefixo do titulo a ser baixado.                  ³±±
±±³          ³ ExpC03 - Numero do titulo a ser baixado.                   ³±±
±±³          ³ ExpC04 - Parcela do titulo a ser baixado.                  ³±±
±±³          ³ ExpC05 - Tipo do titulo a ser baixado.                     ³±±
±±³          ³ ExpC06 - Sequencia de Baixa.                               ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ GENERICO                                                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function CancBxSE2(nVlrBx,cPrefixo,cNroTit,cParcela,cTipo,cSeq,dData)

Local nModAnt := nModulo
Local cModAnt := cModulo
Local aAreaTRB:= TRB->(GetArea())
Local aAreaSA2:= SA2->(GetArea())

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona no titulo antes de executar o cancelamento da baixa. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
DbSelectArea("SE2")
DbSetOrder(1)
If DbSeek(xFILIAL("SE2")+cPrefixo+cNroTit+cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA)
	
	aTitulo := {{"E2_PREFIXO",cPrefixo     ,Nil},;
	{"E2_NUM"	    ,cNroTit	            ,Nil},;
	{"E2_PARCELA"   ,cParcela               ,Nil},;
	{"E2_TIPO"	    ,cTipo                  ,Nil},;
	{"E2_FORNECE"   ,SA2->A2_COD            ,Nil},;
	{"E2_LOJA"	    ,SA2->A2_LOJA           ,Nil},;
	{"AUTJUROS"		,0				        ,Nil},;
	{"AUTDESCONT"	,0		 		        ,Nil},;
	{"AUTMOTBX"		,"NOR"                  ,Nil},;
	{"AUTDTBAIXA"	,dData                  ,Nil},;
	{"AUTDTCREDITO"	,dData                  ,Nil},;
	{"AUTHIST"		,"Cancto Bx - "+SA2->A2_COD+SA2->A2_LOJA,Nil},;
	{"AUTVLRPG"		,nVlrBx	                ,Nil},;
	{"AUTVALREC"	,nVlrBx	                ,Nil}}
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Altera o modulo para Financeiro, senao o SigaAuto nao executa.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	nModulo := 6
	cModulo := "FIN"
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Busca o numero da Baixa.                                      ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	nBaixa := NroSeq(cPrefixo,cNroTit,cParcela,cTipo,SA2->A2_COD,SA2->A2_LOJA,cSeq)
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ SigaAuto de Cancelamento de Baixa de Contas a Pagar. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	MSExecAuto( {|x,y,z,k| Fina080(x,y,z,k)},aTitulo,5,,nBaixa)
	
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
		xMagHelpFis("SIGAAUTO BAIXA TITULO",;
		"Existe uma não conformidade no SigaAuto de CANCELAMENTO de Baixa de Contas a Pagar!",;
		xFilial("SE2")+cPrefixo+cNroTit+cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA+;
		"     <-  Copie essas informações para voce pesquisar no Contas a Pagar o titulo que esta com não conformidade. "+;
		"Após confirmar esta tela, sera apresentada a tela de Não Conformidade do SigaAuto.")
		MostraErro()
	EndIf
EndIf

RestArea(aAreaSA2)
RestArea(aAreaTRB)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ CancCheq ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Cancela o cheque dos titulos.                              ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpC1 = Banco do cheque.                                   ³±±
±±³          ³ ExpC2 = Agencia do cheque.                                 ³±±
±±³          ³ ExpC3 = Conta do cheque.                                   ³±±
±±³          ³ ExpC4 = Numero do cheque.                                  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³ .T. deu erro; .F. nao deu erro.                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ GENERICO                                                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function CancCheq(cBco,cAg,cCta,cChq)

Local nReg       := 0
Local lDeleta    := .F. // Contr. Delecao do SEF
Local lDeletaSE5 := .F. // Indica se o SE5 sera deletado
Local nProxChq   := 0
Local nEfValor   := 0
Local nRegSE5    := 0
Local cChave     := xFilial("SEF")+cBco+cAg+cCta+cChq
Local dEfData    := Ctod("")
Local aTitulo    := {}
Local cNatur190  := GetMv("MV_NTCHEST")		// Natureza Cheque estornado
Local lBxConc  	 := GetNewPar("MV_BXCONC","2") == "1"
Local cFilialSe2 := xFilial("SE2")
Local cFilialSe5 := xFilial("SE5")
Local cFilialSef := xFilial("SEF")
Local lNaturChq	 := .F.
Local aAreaSA2   := SA2->(GetArea("SA2"))
Local aAreaSE2   := SE2->(GetArea("SE2"))
Local aAreaSE5   := SE5->(GetArea("SE5"))
Local aAreaSEF   := SEF->(GetArea("SEF"))

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona no cheque. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
DbSelectArea("SEF")
DbSetOrder(1)//EF_FILIAL+EF_BANCO+EF_AGENCIA+EF_CONTA+EF_NUM
DbSeek(xFILIAL("SEF")+cBco+cAg+cCta+cChq)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Percorre todos os registros do cheque para encontrar o registro totalizador do cheque. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
While SEF->(!Eof()) .And. ALLTRIM(SEF->(EF_FILIAL+EF_BANCO+EF_AGENCIA+EF_CONTA+EF_NUM)) == ALLTRIM(xFILIAL("SEF")+cBco+cAg+cCta+cChq)
	If SEF->EF_IMPRESS <> "A" .AND. SEF->EF_IMPRESS <> "C" .AND. nReg == 0
		nReg := SEF->(Recno())
	EndIf
	SEF->(DbSkip())
EndDo

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona no cheque para fazer o cancelamento.                    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
DbSelectArea("SEF")
DbGoTo(nReg)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se data do movimento nao eh menor que data limite de ³
//³ movimentacao no financeiro.                                   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If !DtMovFin()
	Return(.T.)
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se data da exclusao do cheque, maior q. a data sist.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If SEF->EF_DATA > dDataBase
	Help(" ",1,"DTCANCH")
	Return(.T.)
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se o cheque ja foi cancelado.                       ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If ( SEF->EF_IMPRESS == "C" )
	Help(" ",1,"JA CANCELA")
	Return(.T.)
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ So cancela os cheques gerados pelo FINA080.                    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If ( Empty(SEF->EF_NUM) .And. !(AllTrim(SEF->EF_ORIGEM)$"FINA100PAG$FINA050") )
	Help(" ",1,"NAO GERADO")
	Return(.T.)
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se vc esta posicionado no cheque ou no SEF dos titulos. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If ( SEF->EF_IMPRESS == "A" )
	Help(" ",1,"AGLUTINADO")
	Return(.T.)
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona nos movimentos bancarios para verificar as conciliacoes. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
SE5->(dbSetOrder(11))
If SE5->(dbSeek(xfilial("SE5")+SEF->EF_BANCO+SEF->EF_AGENCIA+SEF->EF_CONTA+SEF->EF_NUM,.T.) )
	While ( SE5->(!Eof()).And. xfilial("SE5")==SE5->E5_FILIAL .And.	SE5->E5_BANCO   == SEF->EF_BANCO   .And. ;
		SE5->E5_AGENCIA == SEF->EF_AGENCIA .And. ;
		SE5->E5_CONTA   == SEF->EF_CONTA .and. ;
		SE5->E5_NUMCHEQ == SEF->EF_NUM )
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Verifica se a baixa ja foi conciliada. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		If !Empty(SE5->E5_RECONC) .And. SE5->E5_TIPODOC=="CH"
			Help(" ",1,"BXCONCIL")
			Return(.T.)
		EndIf
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Nao permito cancelamento de baixa se a mesma foi conciliada e se³
		//³ o parametro MV_BXCONC estiver como 2(Padrao) - Nao permite.     ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		If !Empty(SE5->E5_RECONC) .And. !lBxConc .And. SE5->E5_TIPODOC=="CH" .AND. !F190EstCh()
			Help(" ",1,"BXCONCIL")
			Return(.T.)
		EndIf
		
		SE5->(dbSkip())
	EndDo
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica a origem e o tipo do cheque. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If ( !Empty(SEF->EF_ORIGEM) .And.;
	!(AllTrim(SEF->EF_ORIGEM)$"FINA080#FINA190#FINA050#FINA090") .And. ;
	!(AllTrim(SEF->EF_ORIGEM)$"FINA070" .And. AllTrim(SEF->EF_TIPO)$MV_CRNEG) .And. ;
	!(AllTrim(SEF->EF_ORIGEM)$"FINA100PAG" .And. Empty(SEF->EF_NUM)) ) .or. ;
	SEF->EF_TIPO $ MVPAGANT
	Help(" ",1,"ORIGEM190")
	Return(.T.)
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Salva a ordem utilizada na pesquisa e ativa a ordem 1, mais ³
//³ apropriada  a tarefa de cancelamento do cheque.             ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("SEF")
dbSetOrder(1)

If !SoftLock( "SEF" )
	Return(.T.)
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica bloqueio de conta corrente. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
DbSelectArea("SEF")
If CCBLOCKED(EF_BANCO,EF_AGENCIA,EF_CONTA)
	Return(.T.)
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se tem filial de origem e se a tabela NAO eh compartilhada. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If !Empty(SEF->EF_FILORIG) .And. !(Empty(xFilial("SEF")))
	cFilialSef := SEF->EF_FILORIG
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica a origem do titulo para posicionar no SEF.                  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If ( !AllTrim(SEF->EF_ORIGEM) $ "FINA100PAG#FINA050" )
	dbSelectArea("SEF")
	dbSetOrder( 1 )
	SEF->( dbSeek(cFilialSef+cBco+cAg+cCta+cChq,.F.) )
EndIf

While ( !Eof() .And. cFilialSef+SEF->EF_BANCO+SEF->EF_AGENCIA+;
	SEF->EF_CONTA+SEF->EF_NUM == cChave )
	
	SEF->( dbSkip() )
	nProxChq := SEF->( Recno() )
	SEF->( dbSkip(-1) )
	
	If ( SEF->EF_IMPRESS == "A" )
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Quando o Cheque for Aglutinado deve-se limpar seus dados    ³
		//³ mas nao pode-se apaga-lo, pois nao foi gerado pelo FINA190  ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		Reclock("SEF",.F.)
		If !Empty(SEF->EF_FILORIG)
			SEF->EF_FILIAL := SEF->EF_FILORIG
		EndIf
		If lNaturChq
			SEF->EF_NATUR := cNatur190
		EndIf
		SEF->EF_NUM     := ""
		SEF->EF_IMPRESS := ""
		SEF->EF_LIBER   := ""
		MsUnlock()
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Limpa Numero do Cheque nos registros do SE5                 ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		If !Empty(SEF->EF_FILORIG) .and. !(Empty(xFilial("SE2")))
			cFilialSe2 := SEF->EF_FILORIG
		EndIf
		
		dbSelectArea("SE2")
		dbSetOrder(1)
		If dbSeek(cFilialSe2+SEF->EF_PREFIXO+SEF->EF_TITULO+;
			SEF->EF_PARCELA+SEF->EF_TIPO+SEF->EF_FORNECE+SEF->EF_LOJA)
			
			If !Empty(SEF->EF_FILORIG) .and. !(Empty(xFilial("SE5")))
				cFilialSe5 := SEF->EF_FILORIG
			EndIf
			
			dbSelectArea("SE5")
			SE5->( dbSetOrder(7))
			SE5->( dbSeek(cFilialSe5+SEF->(EF_PREFIXO+EF_TITULO+EF_PARCELA+EF_TIPO)+SE2->E2_FORNECE+SE2->E2_LOJA+SEF->EF_SEQUENC))
			
			While SE5->( !Eof() ) .And. cFilialSe5+SEF->(EF_PREFIXO+EF_TITULO+EF_PARCELA+EF_TIPO)+SE2->E2_FORNECE+SE2->E2_LOJA=;
				E5_FILIAL+E5_PREFIXO+E5_NUMERO+E5_PARCELA+E5_TIPO+E5_CLIFOR+E5_LOJA
				
				If ( SE5->E5_CLIFOR+SE5->E5_LOJA == SE2->E2_FORNECE+SE2->E2_LOJA ) .and. ;
					Substr(SE5->E5_BANCO,1,2) != "CX" .and. ;
					!(SE5->E5_BANCO $ GetMv("MV_CARTEIR")) .and. ;
					SE5->E5_SEQ == SEF->EF_SEQUENC
					
					RecLock("SE5",.F.)
					SE5->E5_NUMCHEQ   := ""
					MsUnlock()
					
				EndIf
				
				SE5->(dbSkip())
			EndDo
		EndIf
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Monta array com titulos do cheque               ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		Aadd(aTitulo,{ SEF->EF_PREFIXO,;
		SEF->EF_TITULO ,;
		SEF->EF_PARCELA,;
		SEF->EF_TIPO   ,;
		SEF->EF_VALOR  ,;
		SEF->EF_FORNECE,;
		SEF->EF_LOJA	,;
		SEF->(Recno())})
	ElseIf ( SEF->EF_IMPRESS $ " S" )
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Quando o Cheque estiver impresso deve-se cancela-lo  		³
		//³ e quando o cheque ainda nao foi impresso pode-se exclui-lo. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		If ( SEF->EF_IMPRESS == "S" )
			
			Reclock("SEF",.F.)
			If lNaturChq
				SEF->EF_NATUR := cNatur190
			EndIf
			SEF->EF_IMPRESS := "C"
			MsUnlock()
			lDeleta := .F.
			
			If !Empty(SEF->EF_FILORIG) .and. !(Empty(xFilial("SE2")))
				cFilialSe2 := SEF->EF_FILORIG
			EndIf
			
			dbSelectArea("SE2")
			dbSetOrder(1)
			If SE2->(dbSeek(cFilialSe2+SEF->EF_PREFIXO+SEF->EF_TITULO+SEF->EF_PARCELA+;
				SEF->EF_TIPO+SEF->EF_FORNECE+SEF->EF_LOJA,.F.) )
				RecLock("SE2")
				SE2->E2_NUMBCO := ""
				MsUnlock()
			EndIf
			dbSelectArea("SEF")
		Else
			lDeleta  := .T.
		EndIf
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Atualizacao do Saldo Bancario                 ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		dEfData  := IIf(SEF->EF_DATA > dDataBase, SEF->EF_DATA, dDataBase)
		nEfValor += SEF->EF_VALOR
		
		If !Empty(SEF->EF_FILORIG) .and. !(Empty(xFilial("SE5")))
			cFilialSe5 := SEF->EF_FILORIG
		EndIf
		
		dbSelectArea( "SE5" )
		dbSetOrder( 11 )
		SE5->( dbSeek(cFilialSe5+SEF->EF_BANCO+SEF->EF_AGENCIA+SEF->EF_CONTA+SEF->EF_NUM,.T.) )
		While ( SE5->(!Eof()) .And.	SE5->E5_BANCO   == SEF->EF_BANCO   .And. ;
			SE5->E5_AGENCIA == SEF->EF_AGENCIA .And. ;
			SE5->E5_CONTA   == SEF->EF_CONTA .and. ;
			SE5->E5_NUMCHEQ == SEF->EF_NUM )
			
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³ So deleta quando for cheque da baixa ou da mov bancaria   ³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			If ( SE5->E5_NUMCHEQ == SEF->EF_NUM .And.;
				!(SE5->E5_TIPODOC $ "VL/BA/CM/MT/DC/JR/TL/V2/D2/V2/IS/ES") .And.;
				SE5->E5_MOEDA $ "C1/C2/C3/C4/C5/CH  " )
				lDeletaSE5 := .T.
				dEfData 	  := dDatabase
				nRegSE5    := SE5->( Recno() )
			EndIf
			SE5->(dbSkip())
		EndDo
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Limpa Numero do Cheque no SE5 ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		If !Empty(SEF->EF_FILORIG) .and. !(Empty(xFilial("SE2")))
			cFilialSe2 := SEF->EF_FILORIG
		EndIf
		
		dbSelectArea("SE2")
		dbSetOrder(1)
		If dbSeek(cFilialSe2+SEF->EF_PREFIXO+SEF->EF_TITULO+;
			SEF->EF_PARCELA+SEF->EF_TIPO+SEF->EF_FORNECE+SEF->EF_LOJA)
			
			If !Empty(SEF->EF_FILORIG) .and. !(Empty(xFilial("SE5")))
				cFilialSe5 := SEF->EF_FILORIG
			EndIf
			
			dbSelectArea("SE5")
			SE5->( dbSetOrder(7))
			SE5->( dbSeek(cFilialSe5+SEF->(EF_PREFIXO+EF_TITULO+EF_PARCELA+EF_TIPO+EF_SEQUENC)))
			
			While SE5->( !Eof() ) .And. cFilialSe5+SEF->(EF_PREFIXO+EF_TITULO+EF_PARCELA+EF_TIPO+EF_SEQUENC)=;
				E5_FILIAL+E5_PREFIXO+E5_NUMERO+E5_PARCELA+E5_TIPO+E5_SEQ
				
				If ( SE5->E5_CLIFOR+SE5->E5_LOJA == SE2->E2_FORNECE+SE2->E2_LOJA ) .and. ;
					Substr(SE5->E5_BANCO,1,2) != "CX" .and. ;
					!(SE5->E5_BANCO $ GetMv("MV_CARTEIR")) .and. ;
					SE5->E5_SEQ == SEF->EF_SEQUENC .and. SE5->E5_TIPODOC != "VL"
					RecLock("SE5",.F.)
					SE5->E5_NUMCHEQ := ""
					MsUnlock()
				EndIf
				
				SE5->(dbSkip())
			EndDo
		EndIf
		
		If ( AllTrim(SEF->EF_ORIGEM) $ "FINA100PAG#FINA050" ) .AND. ;
			!(SEF->EF_TIPO $ MVPAGANT)
			cChave   := ""
			nEfValor := 0 // Nao atualiza Mov. Bancaria.
		EndIf
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Nao atualiza Saldo Bancario quando o cheque comecar com * ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		If substr( cChq,1,1 ) == "*"
			nEfValor := 0
		EndIf
		
		If ( nEfValor != 0 .And. SEF->EF_LIBER != "N" )
			AtuSalBco( cBco,cAg,cCta,dEfData,nEfvalor,"+")
		EndIf
	EndIf
	
	dbSelectArea( "SEF" )
	SEF->( dbGoto(nProxChq) )
EndDo

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona no cheque para buscar os dados a serem gravados no SE5. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectarea( "SEF" )
SEF->( dbGoTo( nReg ) )

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona o Cadastro de Bancos            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("SA6")
dbSeek(xFilial()+cBco+cAg+cCta)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se ira cancelar o SE5                      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If ( lDeletaSe5 )
	dbSelectArea("SE5")
	SE5->( dbGoto(nRegSE5) )
	cNatur190 := IIf (Empty(cNatur190), SE5->E5_NATUREZ , cNatur190)
	If SE5->E5_LA == "S " .or. !lDeleta .or.;
		(SE5->E5_DTDISPO <= dDatabase .And. SEF->EF_LIBER $ "S")
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Cancela a Geracao do cheque totalizador gerando um lancamento  ³
		//³de estorno no SE5    										  ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		Reclock("SE5",.T.)
		SE5->E5_FILIAL    := xFilial("SE5")
		SE5->E5_BANCO     := SEF->EF_BANCO
		SE5->E5_AGENCIA   := SEF->EF_AGENCIA
		SE5->E5_CONTA     := SEF->EF_CONTA
		SE5->E5_DATA      := dDatabase
		SE5->E5_VALOR     := SEF->EF_VALOR
		SE5->E5_NATUREZ   := cNatur190
		SE5->E5_RECPAG    := "R"
		SE5->E5_LA        := "N"
		SE5->E5_TIPODOC   := "EC"
		SE5->E5_BENEF     := SEF->EF_BENEF
		SE5->E5_DTDIGIT   := dDataBase
		SE5->E5_SEQ       := SEF->EF_SEQUENC
		SE5->E5_DTDISPO   := dDataBase
		SE5->E5_NUMCHEQ	  := SEF->EF_NUM
		SE5->E5_HISTOR	  := "Cancto de Cheque do Prod/Fret"
		If SpbInUse()
			SE5->E5_MODSPB := "3"
		EndIf
		MsUnlock()
	Else
		dbSelectArea("SE5")
		SE5->( dbGoto(nRegSE5) )
		Reclock("SE5",.F.)
		dbDelete()
		MsUnlock()
	EndIf
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se ira deletar cheque                      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If ( lDeleta )
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Libera o numero do cheque no SE2.                            ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If !Empty(SEF->EF_PREFIXO+SEF->EF_TITULO+SEF->EF_PARCELA)
		
		If !Empty(SEF->EF_FILORIG) .and. !(Empty(xFilial("SE2")))
			cFilialSe2 := SEF->EF_FILORIG
		EndIf
		
		DbSelectArea("SE2")
		DbSetOrder(1)
		If ( dbSeek(cFilialSe2+SEF->EF_PREFIXO+SEF->EF_TITULO+SEF->EF_PARCELA+SEF->EF_TIPO+SEF->EF_FORNECE))
			Reclock("SE2",.F.)
			SE2->E2_NUMBCO := ""
			MsUnlock()
		EndIf
		
	EndIf
	Reclock("SEF",.F.)
	SEF->( dbDelete() )
	MsUnlock()
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a area dos arquivos. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
RestArea(aAreaSA2)
RestArea(aAreaSE2)
RestArea(aAreaSE5)
RestArea(aAreaSEF)

Return(.F.)

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
±±ºParametros³ cPrefixo   = Prefixo do titulo a ser cancelado a baixa                                                       º±±
±±º          ³ cNum       = Numero do titulo a ser cancelado a baixa                                                        º±±
±±º          ³ cParc      = Parcela do titulo a ser cancelado a baixa                                                       º±±
±±º          ³ cTipo      = Tipo do titulo a ser cancelado a baixa                                                          º±±
±±º          ³ cFor       = Fornecedor do titulo a ser cancelado a baixa                                                    º±±
±±º          ³ cLoja      = Loja do Fornecedor do titulo a ser cancelado a baixa                                            º±±
±±º          ³ cSeq       = Sequencia da baixa                                                                              º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Numero da baixa a ser cancelado, este numero pode ser diferente do E5_SEQ                                    º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ Microsiga                                                                                					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite.                                                                        						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						º±±
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
Static Function NroSeq(cPrefixo,cNum,cParcela,cTipo,cFor,cLoja,cSeq)

Local nRet := 0
Local nPos := 0

Private lBaixaAbat:= .F.
Private lNotBax   := .F.
Private lAglImp   := .F.
Private lBxCec    := .F.
Private nTotImpost:= 0
Private nTotAdto  := 0
Private aBaixaSE5 := {}

DbSelectArea("SE2")
DbSetOrder(1)
DbSeek(xFilial("SE2")+cPrefixo+cNum+cParcela+cTipo+cFor+cLoja)

//Funcao Padrao do Sistema que retorna um array com as baixas a serem canceladas
aBaixaSE5 := Sel080Baixa("VL /V2 /BA /RA /CP /LJ /NCC/",cPrefixo,cNum,cParcela,cTipo,@nTotAdto,@lBaixaAbat,cFor,cLoja,@lBxCec,.T.,@lNotBax,@nTotImpost,@lAglImp)
For nPos := 1 to len(aBaixaSE5)
	If Substr(aBaixaSE5[nPos],LEN(aBaixaSE5[nPos])-1,2) == cSeq
		nRet := nPos
		Exit
	EndIf
Next nPos

Return nRet

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
Aadd( aHelpPor, 'Informe o codigo do Banco do Cheque.   ')
Aadd( aHelpSpa, 'Informe o codigo do Banco do Cheque.   ')
Aadd( aHelpEng, 'Informe o codigo do Banco do Cheque.   ')
U_xPutSx1(cPerg,"01","Banco Cheque","Banco Cheque","Banco Cheque","mv_ch1","C",3,0,0,"G",'ExistCpo("SA6")',"SA6","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o codigo da Agencia do Cheque. ')
Aadd( aHelpSpa, 'Informe o codigo da Agencia do Cheque. ')
Aadd( aHelpEng, 'Informe o codigo da Agencia do Cheque. ')
U_xPutSx1(cPerg,"02","Ag. Cheque","Ag. Cheque","Ag. Cheque","mv_ch2","C",5,0,0,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o codigo da Conta do Cheque.   ')
Aadd( aHelpSpa, 'Informe o codigo da Conta do Cheque.   ')
Aadd( aHelpEng, 'Informe o codigo da Conta do Cheque.   ')
U_xPutSx1(cPerg,"03","Cta. Cheque","Cta. Cheque","Cta. Cheque","mv_ch3","C",10,0,0,"G","","","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

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
U_xPutSx1(cPerg,"04","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch4","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_01","","","mv_par04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

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
U_xPutSx1(cPerg,"05","Versao MIX de?","Versao MIX de?","Versao MIX de?","mv_ch5","C",1,0,0,"G",,,"","","mv_par05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

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
U_xPutSx1(cPerg,"06","Versao MIX Ate?","Versao MIX Ate?","Versao MIX Ate?","mv_ch6","C",1,0,0,"G",,,"","","mv_par06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

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
U_xPutSx1(cPerg,"07","Setor ?","Setor ?","Setor ?","mv_ch7","C",60,0,0,"G",'VAZIO().OR.SUBSTR(MV_PAR07,LEN(ALLTRIM(MV_PAR07)),1)=="/"',"U_F302","","","mv_par07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Prod/Fretist p/ ser')
Aadd( aHelpPor, 'considerado no Acerto. Vc pode informar')
Aadd( aHelpPor, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpPor, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpPor, 'considerar apenas este produtor.       ')
Aadd( aHelpSpa, 'Informe o Codigo do Prod/Fretist p/ ser')
Aadd( aHelpSpa, 'considerado no Acerto. Vc pode informar')
Aadd( aHelpSpa, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpSpa, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpSpa, 'considerar apenas este produtor.       ')
Aadd( aHelpEng, 'Informe o Codigo do Prod/Fretist p/ ser')
Aadd( aHelpEng, 'considerado no Acerto. Vc pode informar')
Aadd( aHelpEng, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpEng, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpEng, 'considerar apenas este produtor.       ')
U_xPutSx1(cPerg,"08","Prod/Fret de?","Prod/Fret de?","Prod/Fret de?","mv_ch8","C",6,0,0,"G",,"SA2_L6","","","mv_par08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Prod/Fret para ser ')
Aadd( aHelpPor, 'considerado no Acerto.                 ')
Aadd( aHelpSpa, 'Informe o Codigo do Prod/Fret para ser ')
Aadd( aHelpSpa, 'considerado no Acerto.                 ')
Aadd( aHelpEng, 'Informe o Codigo do Prod/Fret para ser ')
Aadd( aHelpEng, 'considerado no Acerto.                 ')
U_xPutSx1(cPerg,"09","Prod/Fret Ate?","Prod/Fret Ate?","Prod/Fret Ate?","mv_ch9","C",6,0,0,"G",,"SA2_L6","","","mv_par09","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Prod/Fretis')
Aadd( aHelpSpa, 'Informe o Codigo da Loja do Prod/Fretis')
Aadd( aHelpEng, 'Informe o Codigo da Loja do Prod/Fretis')
U_xPutSx1(cPerg,"10","Loja de?","Loja de?","Loja de?","mv_cha","C",2,0,0,"G",,"","","","mv_par10","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Prod/Fretis')
Aadd( aHelpSpa, 'Informe o Codigo da Loja do Prod/Fretis')
Aadd( aHelpEng, 'Informe o Codigo da Loja do Prod/Fretis')
U_xPutSx1(cPerg,"11","Loja Ate?","Loja Ate?","Loja Ate?","mv_chb","C",2,0,0,"G",,"","","","mv_par11","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Rota/Linha inicial ')
Aadd( aHelpSpa, 'Informe o Codigo da Rota/Linha inicial ')
Aadd( aHelpEng, 'Informe o Codigo da Rota/Linha inicial ')
U_xPutSx1(cPerg,"12","Rota/Linha de?","Rota/Linha de?","Rota/Linha de?","mv_chc","C",6,0,0,"G",,"ZL3_01","","","mv_par12","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Rota/Linha final.  ')
Aadd( aHelpSpa, 'Informe o Codigo da Rota/Linha final.  ')
Aadd( aHelpEng, 'Informe o Codigo da Rota/Linha final.  ')
U_xPutSx1(cPerg,"13","Rota/Linha Ate?","Rota/Linha Ate?","Rota/Linha Ate?","mv_chd","C",6,0,0,"G",,"ZL3_01","","","mv_par13","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return