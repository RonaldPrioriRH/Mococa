#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ MGLT015  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/02/2009                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Rotina desenvolvida para possibilitar a Baixa de Titulos, gerando os cheques de forma automatizada.          บฑฑ
ฑฑบ          ณ                        									                               				        บฑฑ
ฑฑบ          ณ Gera um cheque para cada produtor, mesmo sendo varios titulos do mesmo produtor.                             บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Baixa e gera os cheques dos produtores automaticamente.                                                      บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                                                  ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function MGLT015

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Declaracao de Variaveis.             ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Private cMarca    := GetMark()
Private lInverte  := .F.
Private lDeuErro  := .F.
Private cPerg     := PADR("MGLT015",10)
Private cCadastro := "Geracao de Cheque para Produtor"
Private aCampos   := {}
Private aRotina   := {}
Private bGeraCh   := {|| GeraChq(cMarca)}
Private bImprCh   := {|| FINR480()}
Private cBanco    := ""
Private cAgencia  := ""
Private cConta    := ""
Private cSeqChq	  := ""

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Atribuicao de Valores no aRotina.    ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Private aRotina:={{"Gera Cheque",'Eval(bGeraCh)',0,2,0},;
{"Imprime Chq",'Eval(bImprCh)',0,2,0} }

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Chama funcao para criar os parametros caso nao existam.             ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
AjustaSX1()

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Chama a tela para preenchimento dos parametros.                     ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If !Pergunte(cPerg,.T.)
	Return()
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Atualiza os valores das variaveis.                                  ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
cBanco   := MV_PAR01
cAgencia := MV_PAR02
cConta   := MV_PAR03
cSeqChq	 := ALLTRIM(MV_PAR12)
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Cria o arquivo Temporario para insercao dos dados selecionados. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
MsgRun("Aguarde.... Criando arquivo temporario...",,{||CursorWait(), GLTCRIA(), CursorArrow()})

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Chama funcao para selecao dos dados.                                ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
MsgRun("Aguarde.... Selecionando dados...",,{||CursorWait(), GLTSEL(), CursorArrow()})

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Chama funcao para criar a MarkBrowse.                               ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
GLTMOST()

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ GLTMOST  บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Define os campos a serem apresentados na MarkBrowse.       บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GLTMost()

aadd(acampos ,{"TRB_OK"     ,"  "              ,"   "})
aadd(acampos ,{"TRB_FORNEC" ,"@!!!!!!"         ,"Prod/Fret"})
aadd(acampos ,{"TRB_LOJA"   ,"@!!!!"           ,"Loja"})
aadd(acampos ,{"TRB_NOME"   ,"@!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!","Nome"})
aadd(acampos ,{"TRB_PREFIX" ,"@!!!"            ,"Prefixo"})
aadd(acampos ,{"TRB_NUM"    ,"@!!!!!!!!!"      ,"Numero"})
aadd(acampos ,{"TRB_PARCEL" ,"@!!"             ,"Parcela"})
aadd(acampos ,{"TRB_TIPO"   ,"@!!!"            ,"Tipo"})
aadd(acampos ,{"TRB_VALOR"  ,"","Valor",PesqPict("SE2","E2_VALOR",14,2) })
aadd(acampos ,{"TRB_SALDO"  ,"","Saldo",PesqPict("SE2","E2_SALDO",14,2) })
aadd(acampos ,{"TRB_SETOR"  ,"@!!!!!!"         ,"Setor"})
aadd(acampos ,{"TRB_LINHA"  ,"@!!!!!!"         ,"Linha"})
aadd(acampos ,{"TRB_MIX"    ,"@!!!!!!"         ,"Mix"})


dbSelectArea("TRB")
TRB->(DbGotop())

MarkBrow("TRB","TRB_OK",,aCampos,.F.,cMarca,,,,,)

dbSelectArea("TRB")
DbCloseArea()

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ GeraChq  บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Gera o cheque do produtor.                                 บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GeraChq()

Local cChqIni  := cSeqChq
Local cChqFim  := cSeqChq
Local cNome    := ""
Local nCont    := 0
Local aTitulos := {}
Local aProdutor:= {}
Local nProc1   := 0
Local nProc2   := 0

//Verifica se o usuario deixou em branco o parametro
//com o numero do cheque
If Empty(cSeqChq)
	MsgInfo("Informe o nro do primeiro cheque nos parametros.")
	Return()
EndIf

//Verifica se o numero do cheque informado ja existe
dbSelectArea("SEF")
dbSetOrder(1)//EF_FILIAL+EF_BANCO+EF_AGENCIA+EF_CONTA+EF_NUM
If dbSeek(xFilial("SEF")+cBanco+cAgencia+cConta+cChqFim)
	MsgInfo("Numero de cheque ja existe, informe outro nos parametros.")
	Return()
EndIf

//Verifica se o Banco existe
dbSelectArea("SA6")
dbSetOrder(1)//A6_FILIAL+A6_COD+A6_AGENCIA+A6_NUMCON
If !dbSeek(xFilial("SA6")+cBanco+cAgencia+cConta)
	MsgInfo("Banco+Agencia+Conta nao encontrados! Informe corretamente os parametros.")
	Return()
EndIf


If MsgYesNo("Deseja gerar CHEQUE para os produtores marcados? Sendo o Primeiro formulario No."+cSeqChq)
	
	DbSelectArea("TRB")
	TRB->(DbGoTop())
	cNome := ALLTRIM(TRB->TRB_NOME)
	
	While TRB->(!Eof())
		
		If IsMark( 'TRB_OK', cMarca )
			
			nAcho := Ascan(aProdutor,{|x| x[1] == TRB->(TRB_SETOR+TRB_LINHA+TRB_FORNEC+TRB_LOJA) })
			If nAcho == 0
				AAdd(aProdutor,{TRB->(TRB_SETOR+TRB_LINHA+TRB_FORNEC+TRB_LOJA),TRB->TRB_FORNEC,TRB->TRB_LOJA,ALLTRIM(TRB->TRB_NOME)})
			EndIf
			
			//Contador de controle do nro do cheque
			//Sem ele o primeiro cheque seria incrementado
			//e a sequencia de nro de cheque ficaria incorreta
			If nCont > 0
				cChqFim := SOMA1(cChqFim)
			EndIf
			
			//Numeracao automatica de cheque usa um asterisco na frente do nro
			//AAdd(aTitulos,{TRB->(TRB_SETOR+TRB_LINHA+TRB_FORNEC+TRB_LOJA),TRB->TRB_SALDO,TRB->TRB_PREFIXO,TRB->TRB_NUM,TRB->TRB_PARCELA,TRB->TRB_TIPO,"*"+cSeqChq,TRB->(Recno()),ALLTRIM(TRB->TRB_NOME)})
			AAdd(aTitulos,{TRB->(TRB_SETOR+TRB_LINHA+TRB_FORNEC+TRB_LOJA),TRB->TRB_SALDO,TRB->TRB_PREFIXO,TRB->TRB_NUM,TRB->TRB_PARCELA,TRB->TRB_TIPO,cChqFim,TRB->(Recno()),ALLTRIM(TRB->TRB_NOME)})
		EndIf
		
		nCont++
		TRB->(DbSkip())
	EndDo
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Gera o cheque para cada produtor marcado no arquivo TRB. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	For nProc1 := 1 To Len(aTitulos)
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณPosiciona no cadastro do Fornecedor.                        ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		DbSelectArea("SA2")
		DbSetOrder(1)
		DbSeek(xFILIAL("SA2")+aProdutor[nProc1][2]+aProdutor[nProc1][3])
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Inicia o controle de transacao. ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		Begin Transaction
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Processa todos os titulos, mas roda o SigaAuto, somente para o produtor posicionado no momento. ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		For nProc2 := 1 To Len(aTitulos)
			If aProdutor[nProc1][1] == aTitulos[nProc2][1]
				//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
				//ณExecuta o SigaAuto de Baixa de Titulo.                      ณ
				//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
				MsgRun("Gerando cheque para: "+aTitulos[nProc2][9],,{||CursorWait(),;
				BaixaSE2(aTitulos[nProc2][2],aTitulos[nProc2][3],aTitulos[nProc2][4],aTitulos[nProc2][5],aTitulos[nProc2][6],aTitulos[nProc2][7]), CursorArrow()})
				
				//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
				//ณDeleta o registro temporario do Titulo que foi selecionado.   ณ
				//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
				If !lDeuErro
					DbSelectArea("TRB")
					TRB->(DbGoTo(aTitulos[nProc2][8]))
					RecLock( 'TRB', .F. )
					DbDelete()
					MsUnLock()
				EndIf
			EndIf
		Next nProc2
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Se houve alguma falha, desfaz todas as transacoes.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		If lDeuErro
			DisarmTransaction()
			lDeuErro := .F.
		EndIf
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Finaliza o controle de transacao, caso nao hajam falhas. ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		End Transaction
	Next nProc1
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Alimenta grupo de perguntas do programa de impressao de Cheques. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	dbSelectArea("SX1")
	dbSetOrder(1)
	dbSeek("FIN480")
	
	While SX1->(!Eof()) .And. Alltrim(SX1->X1_GRUPO) == Alltrim("FIN480")
		
		If SX1->X1_ORDEM == "01"
			RecLock("SX1",.F.)
			SX1->X1_CNT01 := cBanco
			MsUnLock()
			
		ElseIf SX1->X1_ORDEM == "02"
			RecLock("SX1",.F.)
			SX1->X1_CNT01 := cAgencia
			MsUnLock()
			
		ElseIf SX1->X1_ORDEM == "03"
			RecLock("SX1",.F.)
			SX1->X1_CNT01 := cConta
			MsUnLock()
			
		ElseIf SX1->X1_ORDEM == "04"
			RecLock("SX1",.F.)
			SX1->X1_CNT01 := cChqIni //Do Cheque ?
			MsUnLock()
			
		ElseIf SX1->X1_ORDEM == "05"
			RecLock("SX1",.F.)
			SX1->X1_CNT01 := cChqFim //Ate o Cheque ?
			MsUnLock()
			
		ElseIf SX1->X1_ORDEM == "06"
			RecLock("SX1",.F.)
			SX1->X1_PRESEL := 2 //Numera automat. ? Nao
			MsUnLock()
			
		ElseIf SX1->X1_ORDEM == "07"
			RecLock("SX1",.F.)
			SX1->X1_CNT01 := " " //Numero do 1.Cheque ?
			MsUnLock()
			
		ElseIf SX1->X1_ORDEM == "08"
			RecLock("SX1",.F.)
			SX1->X1_CNT01 := DTOC(dDataBase) //Data Inicial ?
			MsUnLock()
			
		ElseIf SX1->X1_ORDEM == "09"
			RecLock("SX1",.F.)
			SX1->X1_CNT01 := DTOC(dDataBase) //Data Final ?
			MsUnLock()
			
		ElseIf SX1->X1_ORDEM == "10"
			RecLock("SX1",.F.)
			SX1->X1_PRESEL := 2 //Imp. Cheq. para PA ?
			MsUnLock()
			
		ElseIf SX1->X1_ORDEM == "11"
			RecLock("SX1",.F.)
			SX1->X1_PRESEL := 1 //LayOut do Cheque ?
			MsUnLock()
			
		ElseIf SX1->X1_ORDEM == "12"
			RecLock("SX1",.F.)
			SX1->X1_CNT01 := " " //Banco Destino (Tipo CPMF) ?
			MsUnLock()
			
		ElseIf SX1->X1_ORDEM == "13"
			RecLock("SX1",.F.)
			SX1->X1_CNT01 := " " //Agencia Destino (Tipo CPMF) ?
			MsUnLock()
			
		ElseIf SX1->X1_ORDEM == "14"
			RecLock("SX1",.F.)
			SX1->X1_CNT01 := " " //Conta Destino (Tipo CPMF) ?
			MsUnLock()
		EndIf
		dbSkip()
	EndDo
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Chama a tela para preenchimento dos parametros.                     ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If !Pergunte("FIN480",.T.)
		Return()
	Else
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Chama o programa de impressao de cheques.                ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		FINR480()
	EndIf
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Atualiza a sequencia de numeracao do cheque nos parametros.         ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Pergunte(cPerg,.F.)
	MV_PAR12 := SOMA1(cChqFim)
/*	
	dbSelectArea("SX1")
	dbSetOrder(1)
	dbSeek(cPerg+"15")
	
	RecLock("SX1",.F.)
	SX1->X1_CNT01 := SOMA1(cChqFim)
	MsUnLock()
*/	
EndIf

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ GLTCRIA  บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Cria um arquivo Temporario com os campos a serem apresen-  บฑฑ
ฑฑบ          ณ tados na MarkBrowse.                                       บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GLTCria()

Local aEstru := {}
Local aArq2

aadd(aEstru,{"TRB_OK"      ,'C',02,0})
aadd(aEstru,{"TRB_FORNEC"  ,'C',06,0})
aadd(aEstru,{"TRB_LOJA"    ,'C',04,0})
aadd(aEstru,{"TRB_NOME"    ,'C',40,0})
aadd(aEstru,{"TRB_PREFIX"  ,'C',03,0})
aadd(aEstru,{"TRB_NUM"     ,'C',09,0})
aadd(aEstru,{"TRB_PARCEL"  ,'C',TamSx3("E2_PARCELA")[1],0})
aadd(aEstru,{"TRB_TIPO"    ,'C',03,0})
aadd(aEstru,{"TRB_VALOR"   ,'N',14,2})
aadd(aEstru,{"TRB_SALDO"   ,'N',14,2})
aadd(aEstru,{"TRB_LINHA"   ,'C',06,0})
aadd(aEstru,{"TRB_SETOR"     ,'C',06,0})
aadd(aEstru,{"TRB_MIX"     ,'C',06,0})


aArq2 := CriaTrab(aEstru,.T.)
If Select("TRB") <> 0
	TRB->(dbCloseArea())
EndIf
Use &aArq2 Alias TRB NEW
Index on TRB_SETOR+TRB_LINHA+TRB_FORNEC+TRB_LOJA To &aArq2

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ GLTSEL   บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Seleciona os dados a serem apresentados na MarkBrowse.     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GLTSel()

Local cQuery  := ""
Local cPrdFab := ""
Local nTabFor := 0
Local nVlrIPI := 0

Local _cCCORRE 	:= "" //U_GETRELA1("1","ZL1_CCORRE") //#LETRAS

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Query para Selecao dos dados.                                   ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
cQuery := "SELECT SE2.E2_FORNECE,SE2.E2_LOJA,SE2.E2_PREFIXO,SE2.E2_NUM,SE2.E2_PARCELA,SE2.E2_TIPO,SE2.E2_VALOR,SE2.E2_SALDO,SE2.E2_L_MIX, SA2.A2_L_LI_RO "
cQuery += "FROM "+RetSqlName("SE2")+" SE2 "
cQuery += " JOIN "+RetSqlName("SA2")+" SA2 ON SE2.E2_FORNECE = SA2.A2_COD AND SE2.E2_LOJA = SA2.A2_LOJA  "
If MV_PAR11 == 1 //Banco
	cQuery += "AND SA2.A2_L_TPPAG = 'B'"
ElseIf MV_PAR11 == 2 //Cheque
	cQuery += "AND SA2.A2_L_TPPAG = 'C'"
ElseIf MV_PAR11 == 3 //Dinheiro
	cQuery += "AND SA2.A2_L_TPPAG = 'D'"
EndIf
cQuery += "		AND SA2.A2_L_LI_RO BETWEEN '"+MV_PAR09+"' AND '"+MV_PAR10+"' "
cQuery += "WHERE SE2.D_E_L_E_T_ = ' ' "
cQuery += " AND SA2.D_E_L_E_T_ = ' '" //#LETRAS
cQuery += "AND SE2.E2_FILIAL  = '"+xFILIAL("SE2")+"' "
cQuery += " AND SA2.A2_FILIAL = '" + xFilial("SA2")	+ "'" //#LETRAS
cQuery += "AND (SE2.E2_L_MIX   = '"+MV_PAR04+"' OR SE2.E2_L_MIX   = '' "

cQuery += "AND SE2.E2_FORNECE BETWEEN '"+mv_par05+"' AND '"+MV_PAR06+"' "
cQuery += "AND SE2.E2_LOJA    BETWEEN '"+MV_PAR07+"' AND '"+MV_PAR08+"' "
cQuery += "AND SE2.E2_PREFIXO = 'GL1' "  //Somente titulos a pagar para o Produtor
cQuery += "AND SE2.E2_TIPO = 'NF ' "  //Somente titulos a pagar para o Produtor
cQuery += "AND SE2.E2_SALDO > 0 "    //Somente titulos em aberto ou baixados parcialmente



If Select("TRA") > 0
	dbSelectArea("TRA")
	dbCloseArea("TRA")
endif

//TCQUERY cQuery NEW ALIAS "TRA"
dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRA',.F.,.T.)

DbSelectArea("TRA")
TRA->(DbGoTop())

While TRA->(!EOF())
	
	DbSelectArea("TRB")
	TRB->(DbGoTop())
	
	RecLock("TRB",.T.)
	TRB->TRB_FORNEC  := TRA->E2_FORNECE
	TRB->TRB_LOJA    := TRA->E2_LOJA
	TRB->TRB_NOME    := POSICIONE("SA2",1,xFILIAL("SA2")+TRA->E2_FORNECE+TRA->E2_LOJA,"A2_NOME")
	TRB->TRB_PREFIX  := TRA->E2_PREFIXO
	TRB->TRB_NUM     := TRA->E2_NUM
	TRB->TRB_PARCEL  := TRA->E2_PARCELA
	TRB->TRB_TIPO    := TRA->E2_TIPO
	TRB->TRB_VALOR   := TRA->E2_VALOR
	TRB->TRB_SALDO   := TRA->E2_SALDO
	TRB->TRB_LINHA   := TRA->A2_L_LI_RO
	TRB->TRB_MIX     := TRA->E2_L_MIX
	TRB->TRB_SETOR   := "000001"
	MsUnlock("TRB")
	
	TRA->(DbSkip())
EndDo

DbSelectArea("TRA")
DbCloseArea("TRA")

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณ BaixaSE2 ณ Autor ณMicrosiga              ณ Data ณ 00.00.00 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ Baixa titulo no contas a pagar via SigaAuto.               ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณParametrosณ ExpN01 - Valor a ser baixado no titulo.                    ณฑฑ
ฑฑณ          ณ ExpC02 - Prefixo do titulo a ser baixado.                  ณฑฑ
ฑฑณ          ณ ExpC03 - Numero do titulo a ser baixado.                   ณฑฑ
ฑฑณ          ณ ExpC04 - Parcela do titulo a ser baixado.                  ณฑฑ
ฑฑณ          ณ ExpC05 - Tipo do titulo a ser baixado.                     ณฑฑ
ฑฑณ          ณ ExpC06 - Numero do Cheque.                                 ณฑฑ
ฑฑณ          ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ GENERICO                                                   ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function BaixaSE2(nVlrBx,cPrefixo,cNroTit,cParcela,cTipo,cNroChq)

Local _cTpFor	:= ""//U_GETRELA1("1","ZL1_CCORRE") //#LETRAS

Local nModAnt := nModulo
Local cModAnt := cModulo
Local aAreaTRB:= TRB->(GetArea())
Local aAreaSA2:= SA2->(GetArea())
Local cHistSE2:= "Pagto Produtor em Cheque" //#LETRAS
//Local cHistSE2:= If(SA2->A2_C_TPFOR $ _cTpFor,"Pagto Produtor em Cheque","Pagto Fretista em Cheque") //#LETRAS
Local _cBefenf	:= ""
Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Tratamento para liberar o titulo para baixa no financeiro. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
DbSelectArea("SE2")
DbSetOrder(1)
If DbSeek(xFILIAL("SE2")+cPrefixo+cNroTit+cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA)
	If Empty(SE2->E2_DATALIB)//Se nao foi liberado ainda
		RecLock("SE2",.F.)
		SE2->E2_DATALIB := dDataBase
		SE2->E2_USUALIB := Alltrim(cUserName)
		MsUnLock()
	EndIf
	
	If SA2->(FieldPos("A2_L_FAVCH"))<>0
		If !EMPTY(SA2->A2_L_FAVCH)
			_cBefenf := Alltrim(SA2->A2_L_FAVCH)
		Else
			_cBefenf := Alltrim(SA2->A2_NOME)			
		EndIf
	Else
		_cBefenf := Alltrim(SA2->A2_NOME)			
	EndIf
		
	aTitulo := {;
	{"E2_PREFIXO"  ,cPrefixo	,Nil},;
	{"E2_NUM"	   ,cNroTit	      ,Nil},;
	{"E2_PARCELA"  ,cParcela      ,Nil},;
	{"E2_TIPO"	   ,cTipo         ,Nil},;
	{"E2_FORNECE"  ,SA2->A2_COD   ,Nil},;
	{"E2_LOJA"	   ,SA2->A2_LOJA  ,Nil},;
	{"AUTBANCO"    ,cBanco        ,Nil},;
	{"AUTAGENCIA"  ,cAgencia      ,Nil},;
	{"AUTCONTA"    ,cConta        ,Nil},;
	{"AUTCHEQUE"   ,cNroChq       ,Nil},;
	{"AUTMOTBX"	   ,"CHQ"         ,Nil},;
	{"AUTDTBAIXA"  ,dDataBase	  ,Nil},;
	{"AUTDTCREDITO",dDataBase 	  ,Nil},;
	{"AUTBENEF"    ,_cBefenf		,Nil},;
	{"AUTHIST"	   ,cHistSE2      ,Nil},;
	{"AUTVLRPG"    ,nVlrBx        ,Nil }}
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Altera o modulo para Financeiro, senao o SigaAuto nao executa.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	nModulo := 6
	cModulo := "FIN"
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ SigaAuto de Baixa de Contas a Pagar. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	MSExecAuto({|x,y| Fina080(x,y)},aTitulo,3)
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Restaura o modulo em uso. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	nModulo := nModAnt
	cModulo := cModAnt
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Verifica se houve erro no SigaAuto, caso haja mostra o erro. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If lMsErroAuto
		lDeuErro := .T.
		xMagHelpFis("SIGAAUTO BAIXA TITULO",;
		"Existe uma nใo conformidade no SigaAuto de Baixa de Contas a Pagar!",;
		xFilial("SE2")+cPrefixo+cNroTit+;
		cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA+;
		"     <-  Copie essas informa็๕es para voce pesquisar no Contas a Pagar o titulo que esta com nใo conformidade. "+;
		"Ap๓s confirmar esta tela, sera apresentada a tela de Nใo Conformidade do SigaAuto.")
		MostraErro()
	EndIf
	
EndIf

RestArea(aAreaSA2)
RestArea(aAreaTRB)

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ AjustaSX1บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para criacao das perguntas caso elas nao existam.   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
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
U_xPutSx1(cPerg,"01","Banco","Banco","Banco","mv_ch1","C",TamSx3("A6_COD")[1],0,0,"G",'ExistCpo("SA6")',"SA6","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o codigo da Agencia do Cheque. ')
Aadd( aHelpSpa, 'Informe o codigo da Agencia do Cheque. ')
Aadd( aHelpEng, 'Informe o codigo da Agencia do Cheque. ')
U_xPutSx1(cPerg,"02","Agencia","Agencia","Agencia","mv_ch2","C",TamSx3("A6_AGENCIA")[1],0,0,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o codigo da Conta do Cheque.   ')
Aadd( aHelpSpa, 'Informe o codigo da Conta do Cheque.   ')
Aadd( aHelpEng, 'Informe o codigo da Conta do Cheque.   ')
U_xPutSx1(cPerg,"03","Conta","Conta","Conta","mv_ch3","C",TamSx3("A6_NUMCON")[1],0,0,"G","","","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

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
U_xPutSx1(cPerg,"05","Produtor de?","Prod/Fret de?","Prod/Fret de?","mv_ch5","C",6,0,0,"G",,"SA2_L6","","","mv_par05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Prod/Fret para ser ')
Aadd( aHelpPor, 'considerado no Acerto.                 ')
Aadd( aHelpSpa, 'Informe o Codigo do Prod/Fret para ser ')
Aadd( aHelpSpa, 'considerado no Acerto.                 ')
Aadd( aHelpEng, 'Informe o Codigo do Prod/Fret para ser ')
Aadd( aHelpEng, 'considerado no Acerto.                 ')
U_xPutSx1(cPerg,"06","Produtor Ate?","Prod/Fret Ate?","Prod/Fret Ate?","mv_ch6","C",6,0,0,"G",,"SA2_L6","","","mv_par06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Prod/Fretis')
Aadd( aHelpSpa, 'Informe o Codigo da Loja do Prod/Fretis')
Aadd( aHelpEng, 'Informe o Codigo da Loja do Prod/Fretis')
U_xPutSx1(cPerg,"07","Loja de?","Loja de?","Loja de?","mv_ch7","C",2,0,0,"G",,"","","","mv_par07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Prod/Fretis')
Aadd( aHelpSpa, 'Informe o Codigo da Loja do Prod/Fretis')
Aadd( aHelpEng, 'Informe o Codigo da Loja do Prod/Fretis')
U_xPutSx1(cPerg,"08","Loja Ate?","Loja Ate?","Loja Ate?","mv_ch8","C",2,0,0,"G",,"","","","mv_par08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Rota/Linha inicial ')
Aadd( aHelpSpa, 'Informe o Codigo da Rota/Linha inicial ')
Aadd( aHelpEng, 'Informe o Codigo da Rota/Linha inicial ')
U_xPutSx1(cPerg,"09","Rota/Linha de?","Rota/Linha de?","Rota/Linha de?","mv_ch9","C",6,0,0,"G",,"ZL3_01","","","mv_par09","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Rota/Linha final.  ')
Aadd( aHelpSpa, 'Informe o Codigo da Rota/Linha final.  ')
Aadd( aHelpEng, 'Informe o Codigo da Rota/Linha final.  ')
U_xPutSx1(cPerg,"10","Rota/Linha Ate?","Rota/Linha Ate?","Rota/Linha Ate?","mv_cha","C",6,0,0,"G",,"ZL3_01","","","mv_par10","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Escolha o Tipo de Pagto a ser filtrado.')
Aadd( aHelpPor, 'Obs:O tipo de pagto considerado ้ o que')
Aadd( aHelpPor, 'esta no titulo, ou seja, nใo haverแ    ')
Aadd( aHelpPor, 'influencia se voce mudar no cadastro   ')
Aadd( aHelpPor, 'neste momento.                         ')
Aadd( aHelpSpa, 'Escolha o Tipo de Pagto a ser filtrado.')
Aadd( aHelpSpa, 'Obs:O tipo de pagto considerado ้ o que')
Aadd( aHelpSpa, 'esta no titulo, ou seja, nใo haverแ    ')
Aadd( aHelpSpa, 'influencia se voce mudar no cadastro   ')
Aadd( aHelpSpa, 'neste momento.                         ')
Aadd( aHelpEng, 'Escolha o Tipo de Pagto a ser filtrado.')
Aadd( aHelpEng, 'Obs:O tipo de pagto considerado ้ o que')
Aadd( aHelpEng, 'esta no titulo, ou seja, nใo haverแ    ')
Aadd( aHelpEng, 'influencia se voce mudar no cadastro   ')
Aadd( aHelpEng, 'neste momento.                         ')
U_xPutSx1(cPerg,"11","Tipo de Pagto?","Tipo de Pagto?","Tipo de Pagto?","mv_chb","C",1,0,0,"C",'',"","","","mv_par11","Banco","","","","Cheque","","","Dinheiro","","","Ambos","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o numero do primeiro formulario')
Aadd( aHelpSpa, 'Informe o Codigo da Rota/Linha final.  ')
Aadd( aHelpEng, 'Informe o Codigo da Rota/Linha final.  ')
U_xPutSx1(cPerg,"12","Num.Form.Chq.?","Num.Form.Chq.?","Num.Form.Chq.?","mv_chc","C",10,0,0,"G",,"","","","mv_par15","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
Return
