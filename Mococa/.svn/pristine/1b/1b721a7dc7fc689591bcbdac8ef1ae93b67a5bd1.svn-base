#INCLUDE "PROTHEUS.CH"
#INCLUDE "RWMAKE.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "TBICODE.CH"
#DEFINE NAME_PROC    "Gestão do Leite"
#DEFINE LAST_UPDATED "01.201501" 
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ MGLT001  º Autor ³ TOTVS                 º Data da Criacao  ³ 11/09/2008                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Rotina desenvolvida para incluir ou alterar campos, indices, tabelas e gatilhos para uso das rotinas de      º±±
±±º          ³ Gestao do Leite. 												                               				º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Implantacao das rotinas referente a Gestao do Leite.                						                    º±±
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
±±º          ³          ³                                			       ³00-000000 -                       ³ TI	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function MGLT001()
Private i
Static upNFE    := .F. // SD1 Item da Nota de Entrada
//Static upMun	:= .F. // CC2 Municipios
Static upMix	:= .T. // ZLE/ZLF Mix
Static upFinan	:= .F. // SE2 e SE5 Financeiro
Static upForne	:= .F. // SA2 fornecedores
//Static upClien	:= .F. // SA1 clientes
Static upMotor	:= .F. // ZL0 Motorista
Static upSetor	:= .F. // ZL2 Setores
Static upGrupo	:= .F. // ZL3 Grupo
Static upVeicu 	:= .F. // ZL4 Veiculos
Static upPreEv	:= .F. // ZL6 prefixo do evento
Static upGrpEv	:= .F. // ZL7 grupo de eventos
Static upEvent	:= .F. // ZL8 eventos
Static upTpAna	:= .F. // ZL9 Tipo de analise
Static upFxQua	:= .F. // ZLA Faixa de qualidade
Static upAnali	:= .F. // ZLB Analise da qualidade
Static upRecep	:= .F. // ZLC/ZLD/ZLH Recpcao de leite
Static upFret	:= .F. // ZLI/ZLJ Calculo do Frete Granel
Static upConve	:= .F. // ZLL Convenios
Static upEmpre	:= .F. // ZLM/ZLO Emprestimos
Static upUsuar	:= .F. // ZLU Acessos de usuarios
Static upFrete	:= .F. // ZLL Frete
Static upGrpPr  := .F. // ZL5 Grupo de produtores
Static upComp   := .F. // Complemento de Preco
Static upEsto   := .F. // Estorno de Movimentacao
Static upHelp	:= .T. // Atualizacao de Help de Campos
Static upLoja   := .F. // Integracao com a Loja de Racao
Static upFect   := .F. // Rotina de Fechamento do leite
Static upTanq   := .F. // ZLT/ZLS Cadastro de tanques
Static upLinha	:= .F. // Cadastro de rotas e amarracoes rotas produtor
Static upConfig	:= .F. // Parametros de configuracao para implantacao
Static upParam	:= .F. //#LETRAS
Static _cOrder  := 0
Static upPInct	:= .F. // // marcosilva - capal - programas e incentivos ao produtor 
Static upCapal  := .F.   

/*
Tabelas Afetadas
six Indices
sx2 Tabelas
sx3 Campos
sx6 Parametros
sx7 Gatilhos
sxb Consulta
sxa Pastas
<<<<<<< .mine




=======
>>>>>>> .r81

*/


/*
NOMES DE TABELA LIVRES
<<<<<<< .mine
ZLI
=======
ZL1
ZLI PEDRO
>>>>>>> .r81
ZLJ
ZLK
ZLN
ZLP
ZLQ
ZLR
ZLV
ZL1

*/

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Declaracao de variaveis Padroes.          ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cArqEmp     := "SigaMat.Emp"
nModulo		:= 44
__cInterNet := Nil
__lPyme     := .F.
//oAPP        := Nil

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Declaracao de variaveis Private.          ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
PRIVATE cMessage := " "
PRIVATE aArqUpd	 := {}
PRIVATE aREOPEN	 := {}
PRIVATE oMainWnd := Nil

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Desliga Refresh no Lock do Top.           ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
#IFDEF TOP
	TCInternal(5,'*OFF')
#EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Habilita somente registros nao deletados. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Set Dele On

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Abre o arquivo de empresas.               ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
OpenSm0()
dbGoTop()
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Monta tela de integracao com o usuario.   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If Aviso("Implantação "+NAME_PROC+" Release " + LAST_UPDATED  ,"Esta rotina tem o objetivo de efetuar a atualizaçao do dicionario de dados de acordo com as necessidades estabelecidas pela "+NAME_PROC+" Release "+LAST_UPDATED+"."+CHR(13)+CHR(10)+"Para maior segurança, é importante realizar um backup completo dos dicionários e base de dados do sistema antes da execução desta rotina. Esta rotina deverá será executada no modo exclusivo.",{"Continuar","Sair"})==1
	lEmpenho	:= .F.
	lAtuMnu		:= .F.

	DEFINE WINDOW oMainWnd FROM 0, 0 TO 1, 1 TITLE "Efetuando Atualizacao do Dicionario"+NAME_PROC

	ACTIVATE WINDOW oMainWnd ICONIZED ON INIT (OpenSm0Excl(),lHistorico := MsgYesNo("Sistema em modo exclusivo - Ok !"+CHR(13)+CHR(10)+"Deseja continuar com a atualizacao do Dicionario "+NAME_PROC+" Release " + LAST_UPDATED + " neste momento ? ", "Atenção"),If(lHistorico,(Processa({|lEnd| UpdProcGLT(@lEnd)},"Processando Atualizações "+NAME_PROC,"Aguarde, processando preparacao dos arquivos",.F.) , oMainWnd:End()),oMainWnd:End()))
	//ACTIVATE WINDOW oMainWnd ICONIZED ON INIT (OpenSm0Excl(),lHistorico := MsgYesNo("Sistema em modo exclusivo - Ok !"+CHR(13)+CHR(10)+"Deseja continuar com a atualizacao do Dicionario "+NAME_PROC+" Release " + LAST_UPDATED + " neste momento ? ", "Atenção"),If(lHistorico,(MsgRun("Aguarde.... Atualizando dados...",,{||CursorWait(),UpdProcGLT(),CursorArrow()}), oMainWnd:End()),oMainWnd:End()))
EndIf

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³UpdProcGLT³ Autor ³ TOTVS                 ³ Data ³ 00/00/00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao de processamento da gravacao dos arquivos.          ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Implantacao Gestao do Leite.                               ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function UpdProcGLT(lEnd)

Local cTexto   := " "
Local cFile    := " "
Local cMask    := "Arquivos Texto (*.TXT) |*.txt|"
Local cCodigo  := "DM"
Local nRecno   := 0
Local nX       := 0
Private cPast:= "8"

ProcRegua(100)
IncProc("Verificando Empresas e Filiais existentes....")

dbSelectArea("SM0")
dbGoTop()
While !Eof()
	RpcSetType(2)
	RpcSetEnv(SM0->M0_CODIGO, SM0->M0_CODFIL)
	SM0->(dbSkip())
	nRecno := SM0->(Recno())
	SM0->(dbSkip(-1))
	RpcClearEnv()
	OpenSm0Excl()
	SM0->(DbGoTo(nRecno))
EndDo
IncProc("Verificando integridade dos dicionarios....")


dbSelectArea("SM0")
dbGoTop()
While !Eof()

	RpcSetType(2)
	RpcSetEnv(SM0->M0_CODIGO, SM0->M0_CODFIL)
	cTexto += Replicate("-",128)+CHR(13)+CHR(10)
	cTexto += "Empresa : "+SM0->M0_CODIGO+" Filial : "+SM0->M0_CODFIL+"-"+SM0->M0_NOME+CHR(13)+CHR(10)
	ProcRegua(9)

	// atualiza SX2 - dicionario de arquivos
	IncProc("[" + AllTrim(SM0->M0_CODIGO) + "/" + AllTrim(SM0->M0_CODFIL) + "] " + ;
	"Atualizando dicionario de arquivos...")
	cTexto += GLTAtuSX2()

	// atualiza SXA - folder's de cadastro
	IncProc("[" + AllTrim(SM0->M0_CODIGO) + "/" + AllTrim(SM0->M0_CODFIL) + "] " + ;
	"Atualizando folders de cadastros...")
	GLTAtuSXA()

	// atualiza SX3 - dicionario de dados
	IncProc("[" + AllTrim(SM0->M0_CODIGO) + "/" + AllTrim(SM0->M0_CODFIL) + "] " + ;
	"Atualizando dicionario de dados...")
	cTexto += GLTAtuSX3()

	// atualiza SIX - indices
	IncProc("[" + AllTrim(SM0->M0_CODIGO) + "/" + AllTrim(SM0->M0_CODFIL) + "] " + ;
	"Atualizando arquivos de indices...")
	cTexto += GLTAtuSIX()

	// atualiza SX7 - gatilhos
	IncProc("[" + AllTrim(SM0->M0_CODIGO) + "/" + AllTrim(SM0->M0_CODFIL) + "] " + ;
	"Atualizando gatilhos...")
	GLTAtuSX7()

	// atualiza SXB - consultas padroes
	IncProc("[" + AllTrim(SM0->M0_CODIGO) + "/" + AllTrim(SM0->M0_CODFIL) + "] " + ;
	"Atualizando consultas padroes...")
	GLTAtuSXB()

	// atualiza SX5 - parametros
	IncProc("[" + AllTrim(SM0->M0_CODIGO) + "/" + AllTrim(SM0->M0_CODFIL) + "] " + ;
	"Atualizando tabelas...")
	GLTAtuSX5()

	// atualiza SX6 - parametros
	IncProc("[" + AllTrim(SM0->M0_CODIGO) + "/" + AllTrim(SM0->M0_CODFIL) + "] " + ;
	"Atualizando parametros...")
	cTexto += GLTAtuSX6()

	// atualiza Help de Campo
	If upHelp
		IncProc("[" + AllTrim(SM0->M0_CODIGO) + "/" + AllTrim(SM0->M0_CODFIL) + "] " + ;
		"Atualizando Help...")
		cTexto += GLTAtuHlp()
	EndIf

	ProcRegua(Len(aArqUpd))
	__SetX31Mode(.F.)
	For nX := 1 To Len(aArqUpd)
		IncProc("Atualizando estruturas. Aguarde... ["+aArqUpd[nx]+"]"+"Empresa : "+SM0->M0_CODIGO+" Filial : "+SM0->M0_CODFIL+"-"+SM0->M0_NOME)
		If Select(aArqUpd[nx])>0
			dbSelectArea(aArqUpd[nx])
			dbCloseArea()
		EndIf
		X31UpdTable(aArqUpd[nx])
		If __GetX31Error()
			Alert(__GetX31Trace())
			Aviso("Atencao!","Ocorreu um erro desconhecido durante a atualizacao da tabela : "+ aArqUpd[nx] + ". Verifique a integridade do dicionario e da tabela.",{"Continuar"},2)
			cTexto += "Ocorreu um erro desconhecido durante a atualizacao da estrutura da tabela : "+aArqUpd[nx] +CHR(13)+CHR(10)
		EndIf
	Next nX

	SM0->(dbSkip())
	nRecno := SM0->(Recno())
	SM0->(dbSkip(-1))
	//RpcClearEnv()
	OpenSm0Excl()
	SM0->(DbGoTo(nRecno))
EndDo

dbSelectArea("SM0")
dbGoTop()
RpcSetEnv(SM0->M0_CODIGO, SM0->M0_CODFIL,,,,, { "AE1" })

cTexto := "Log da atualizacao "+CHR(13)+CHR(10)+cTexto
__cFileLog := MemoWrite(Criatrab(,.f.)+".LOG",cTexto)
DEFINE FONT oFont NAME "Mono AS" SIZE 5,12   //6,15
DEFINE MSDIALOG oDlg TITLE "Atualizacao concluida." From 3,0 to 340,417 PIXEL
@ 5,5 GET oMemo  VAR cTexto MEMO SIZE 200,145 OF oDlg PIXEL
oMemo:bRClicked := {||AllwaysTrue()}
oMemo:oFont:=oFont

DEFINE SBUTTON  FROM 153,175 TYPE 1 ACTION oDlg:End() ENABLE OF oDlg PIXEL //Apaga
DEFINE SBUTTON  FROM 153,145 TYPE 13 ACTION (cFile:=cGetFile(cMask,""),If(cFile="",.T.,MemoWrite(cFile,cTexto))) ENABLE OF oDlg PIXEL


ACTIVATE MSDIALOG oDlg CENTER


Return(.T.)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ GLTAtuSX2³ Autor ³ TOTVS                 ³ Data ³ 00/00/00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao de processamento da gravacao do SX2                 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Implantacao Gestao do Leite.                               ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GLTAtuSX2()

Local aSX2   := {}
Local aEstrut:= {}
Local i      := 0
Local j      := 0
Local cTexto := ''
Local lSX2	 := .F.
Local cAlias := ''
Local cNome
Local cPath

aEstrut:= {"X2_CHAVE","X2_ARQUIVO","X2_NOME","X2_NOMESPA","X2_NOMEENG","X2_ROTINA","X2_MODO","X2_MODOUN","X2_MODOEMP","X2_DELET","X2_TTS","X2_UNICO","X2_PYME","X2_MODULO","X2_DISPLAY"}

If upMotor
	aAdd(aSX2,{"ZL0","ZL0010","GLT - CADASTRO DE MOTORISTA","GLT - CADASTRO DE MOTORISTA","GLT - CADASTRO DE MOTORISTA","","C","C","C",0,"","","",0,""})
EndIF

If upSetor
	aAdd(aSX2,{"ZL2","ZL2010","GLT - SETOR"                ,"GLT - SETOR"                ,"GLT - SETOR"                ,"","C","C","C",0,"","","",0,""})
EndIf
If upGrupo
	aAdd(aSX2,{"ZL3","ZL3010","GLT - GRUPO PRECO LEITE"        ,"GLT - GRUPO PRECO LEITE"        ,"GLT - GRUPO PRECO LEITE"        ,"","C","C","C",0,"","","",0,""})
    aAdd(aSX2,{"ZLG","ZLG010","GLT - FILIAL ENTREGA/LINHA" ,"GLT - FILIAL ENTREGA/LINHA" ,"GLT - FILIAL ENTREGA/LINHA" ,"","C","C","C",0,"","","",0,""})
EndIf
If upVeicu
	aAdd(aSX2,{"ZL4","ZL4010","GLT - CADASTRO DE VEICULO"  ,"GLT - CADASTRO DE VEICULO"  ,"GLT - CADASTRO DE VEICULO"  ,"","C","C","C",0,"","","",0,""})
EndIf
If upGrpPr
	aAdd(aSX2,{"ZL5","ZL5010","GLT - GRUPO DE PRODUTORES"  ,"GLT - GRUPO DE PRODUTORES"  ,"GLT - GRUPO DE PRODUTORES"  ,"","C","C","C",0,"","","",0,""})
EndIf
If upPreEv
	aAdd(aSX2,{"ZL6","ZL6010","GLT - PREFIXO DO EVENTO"    ,"GLT - PREFIXO DO EVENTO"    ,"GLT - PREFIXO DO EVENTO"    ,"","C","C","C",0,"","","",0,""})
EndIf
If upGrpEv
	aAdd(aSX2,{"ZL7","ZL7010","GLT - GRUPOS DE EVENTOS"    ,"GLT - GRUPOS DE EVENTOS"    ,"GLT - GRUPOS DE EVENTOS"    ,"","C","C","C",0,"","","",0,""})
EndIf
If upEvent
	aAdd(aSX2,{"ZL8","ZL8010","GLT - CADASTRO DE EVENTOS"  ,"GLT - CADASTRO DE EVENTOS"  ,"GLT - CADASTRO DE EVENTOS"  ,"","C","C","C",0,"","","",0,""})
EndIf
If upTpAna
	aAdd(aSX2,{"ZL9","ZL9010","GLT - TIPOS DE FAIXAS "     ,"GLT - TIPOS DE FAIXAS "     ,"GLT - TIPOS DE FAIXAS "     ,"","C","C","C",0,"","","",0,""})
EndIf
If upFxQua
	aAdd(aSX2,{"ZLA","ZLA010","GLT - FAIXA DE INDICACAO"   ,"GLT - FAIXA DE INDICACAO"   ,"GLT - FAIXA DE INDICACAO"   ,"","C","C","C",0,"","","",0,""})
EndIf
If upAnali
	aAdd(aSX2,{"ZLB","ZLB010","GLT - ANALISE DE QUALIDADE" ,"GLT - ANALISE DE QUALIDADE" ,"GLT - ANALISE DE QUALIDADE" ,"","C","C","C",0,"","","",0,""})
EndIf
If upRecep
	aAdd(aSX2,{"ZLC","ZLC010","GLT - DESVIOS DE ROTA  "    ,"GLT - DESVIOS DE ROTA  "    ,"GLT - DESVIOS DE ROTA  "    ,"","C","C","C",0,"","","",0,""})
	aAdd(aSX2,{"ZLD","ZLD010","GLT - RECEPCAO DE LEITE"    ,"GLT - RECEPCAO DE LEITE"    ,"GLT - RECEPCAO DE LEITE"    ,"","C","C","C",0,"","","",0,""})
	aAdd(aSX2,{"ZLH","ZLH010","GLT - CADASTRO OCORRENCIAS" ,"GLT - CADASTRO OCORRENCIAS" ,"GLT - CADASTRO OCORRENCIAS" ,"","C","C","C",0,"","","",0,""})
//	aAdd(aSX2,{"ZLX","ZLX010","GLT - SALDO INC. PRODUC"    ,"GLT - SALDO INC. PRODUC"    ,"GLT - SALDO INC. PRODUC"    ,"","C","C","C",0,"","","",0,""})
EndIf
If upMIX
	aAdd(aSX2,{"ZLE","ZLE010","GLT - CABECALHO DO MIX"     ,"GLT - CABECALHO DO MIX"     ,"GLT - CABECALHO DO MIX"     ,"","C","C","C",0,"","","",0,""})
	aAdd(aSX2,{"ZLF","ZLF010","GLT - ITENS DO MIX"         ,"GLT - ITENS DO MIX"         ,"GLT - ITENS DO MIX"         ,"","C","C","C",0,"","","",0,""})
EndIf
If upFret
	aAdd(aSX2,{"ZLI","ZLI010","GLT - PARAMETROS DE FRETE"   ,"GLT - PARAMETROS DE FRETE"   ,"GLT - PARAMETROS DE FRETE"   ,"","C","C","C",0,"","","",0,""})
//	aAdd(aSX2,{"ZLJ","ZLJ010","GLT - NOTA DO TRANSP. GRANEL"   ,"GLT - NOTA DO TRANSP. GRANEL"   ,"GLT - NOTA DO TRANSP. GRANEL"   ,"","C","C","C",0,"","","",0,""})
EndIf

If upConve
	aAdd(aSX2,{"ZLL","ZLL010","GLT - LCTO DOS CONVENIOS"   ,"GLT - LCTO DOS CONVENIOS"   ,"GLT - LCTO DOS CONVENIOS"   ,"","C","C","C",0,"","","",0,""})
EndIf

If upEmpre
	aAdd(aSX2,{"ZLM","ZLM010","GLT - SOLIC. EMPRESTIMO "   ,"GLT - SOLIC. EMPRESTIMO "   ,"GLT - SOLIC. EMPRESTIMO "   ,"","C","C","C",0,"","","",0,""})
	aAdd(aSX2,{"ZLO","ZLO010","GLT - ITENS DO EMPRESTIMO"  ,"GLT - ITENS DO EMPRESTIMO " ,"GLT - ITENS DO EMPRESTIMO " ,"","C","C","C",0,"","","",0,""})
EndIf
If upTanq
	aAdd(aSX2,{"ZLS","ZLS010","GLT - CABEC. CAD. TANQUES"  ,"GLT - CABEC. CAD. TANQUES" ,"GLT - CABEC. CAD. TANQUES" ,"","C","C","C",0,"","","",0,""})
	aAdd(aSX2,{"ZLT","ZLT010","GLT - ITENS CAD. TANQUES "  ,"GLT - ITENS CAD. TANQUES " ,"GLT - ITENS CAD. TANQUES " ,"","C","C","C",0,"","","",0,""})
EndIf

If upUsuar
	aAdd(aSX2,{"ZLU","ZLU010","GLT - ACESSOS DE USUARIOS"  ,"GLT - ACESSOS DE USUARIOS " ,"GLT - ACESSOS DE USUARIOS " ,"","C","C","C",0,"","","",0,""})
EndIf

if upLinha
	aAdd(aSX2,{"ZLW","ZLW010","GLT - LINHAS ROTAS "   ,"GLT - LINHAS ROTAS "   ,"GLT - LINHAS ROTAS "   ,"","C","C","C",0,"","","",0,""})
	aAdd(aSX2,{"ZLY","ZLY010","GLT - CABEC. LINHA PRODUTOR "   ,"GLT - CABEC. LINHA PRODUTOR "   ,"GLT - CABEC. LINHA PRODUTOR "   ,"","C","C","C",0,"","","",0,""})
	aAdd(aSX2,{"ZLZ","ZLZ010","GLT - ITENS LINHA PRODUTOR "   ,"GLT - ITENS LINHA PRODUTOR "   ,"GLT - ITENS LINHA PRODUTOR "   ,"","C","C","C",0,"","","",0,""})
EndIF

If upParam
	aAdd(aSX2,{"ZLK","ZLK010","GLT - PARAMETROS DO LEITE  "   ,"GLT - PARAMETROS DO LEITE  "   ,"GLT - PARAMETROS DO LEITE  "   ,"","C","C","C",0,"","","",0,""})
EndIF
	
If upConfig
	aAdd(aSX2,{"ZL1","ZL1010","GLT - PARAM CONFIG LETRAS  "   ,"GLT - PARAM CONFIG LETRAS  "   ,"GLT - PARAM CONFIG LETRAS  "   ,"","C","C","C",0,"","","",0,""})
EndIF

// marcosilva - capal    
If upPInct
//	ZP0 – Programas: onde todos os programas deverão ser cadastrados;
	aAdd(aSX2,{"ZP0","ZP0010","GLT - PROGRAMAS E INCENTIVOS"  ,"GLT - PROGRAMAS E INCENTIVOS" ,"GLT - PROGRAMAS E INCENTIVOS" ,"","C","C","C",0,"","","",0,""})
//	ZP1 – Parâmetros de Programas: onde os valores dos parâmetros (descritos na tabela anterior) são informados;
	aAdd(aSX2,{"ZP1","ZP1010","GLT - PARAMETROS DE PROGRAMAS"  ,"GLT - PARAMETROS DE PROGRAMAS" ,"GLT - PARAMETROS DE PROGRAMAS" ,"","C","C","C",0,"","","",0,""})
//	ZP2 – Subsídio de Programas: onde os valores de subsídios (caso exista subsídio para o programa) são informados;
	aAdd(aSX2,{"ZP2","ZP2010","GLT - SUBSÍDIO DE PROGRAMAS"  ,"GLT - SUBSÍDIO DE PROGRAMAS" ,"GLT - SUBSÍDIO DE PROGRAMAS" ,"","C","C","C",0,"","","",0,""})
//	ZP3 – Valores de Programas: onde os valores a serem pagos por cooperados/mês/programa são gravados;		
	aAdd(aSX2,{"ZP3","ZP3010","GLT - VALORES DE PROGRAMAS"  ,"GLT - VALORES DE PROGRAMAS" ,"GLT - VALORES DE PROGRAMAS" ,"","C","C","C",0,"","","",0,""})
//	ZP4 – Movimentação de Produtores: responsável por registrar as entradas e saídas de produtores por programa;
	aAdd(aSX2,{"ZP4","ZP4010","GLT - MOVIMENTAÇÃO DE PRODUTORES"  ,"GLT - MOVIMENTAÇÃO DE PRODUTORES" ,"GLT - MOVIMENTAÇÃO DE PRODUTORES" ,"","C","C","C",0,"","","",0,""})
//	ZP5 – Visitas Técnicas: responsável por registrar as visitas realizadas por programa;		
	aAdd(aSX2,{"ZP5","ZP5010","GLT - VISITAS TÉCNICAS"  ,"GLT - VISITAS TÉCNICAS" ,"GLT - VISITAS TÉCNICAS" ,"","C","C","C",0,"","","",0,""})
//  ZP6 – Registro de Inseminações: responsável por controlar inseminações realizadas e também as já bonificadas;	
	aAdd(aSX2,{"ZP6","ZP6010","GLT - REGISTRO DE INSEMINAÇÕES"  ,"GLT - REGISTRO DE INSEMINAÇÕES" ,"GLT - REGISTRO DE INSEMINAÇÕES" ,"","C","C","C",0,"","","",0,""})
EndIf
//fim marcosilva - capal


ProcRegua(Len(aSX2))

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona em uma tabela padrao, para pegar o codigo da empresa. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("SX2")
dbSetOrder(1)
dbSeek("SF1")
cNome := Substr(SX2->X2_ARQUIVO,4,5)
cPath	:= SX2->X2_PATH

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Varre o Array para substituir nome do arquivo e gravar os dados( considerando a empresa atual ).³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
For i:= 1 To Len(aSX2)
	If !Empty(aSX2[i][1])
		If !dbSeek(aSX2[i,1])
			lSX2	:= .T.
			If !(aSX2[i,1]$cAlias)
				cAlias += aSX2[i,1]+"/"
			EndIf
			RecLock("SX2",.T.)
			For j:=1 To Len(aSX2[i])
				If FieldPos(aEstrut[j]) > 0
					FieldPut(FieldPos(aEstrut[j]),aSX2[i,j])
				EndIf
			Next j
			SX2->X2_PATH    := cPath
			SX2->X2_ARQUIVO := aSX2[i,1]+cNome
			SX2->X2_MODO    := aSX2[i,7]
			SX2->X2_MODOUN  := aSX2[i,7]
			SX2->X2_MODOEMP := aSX2[i,7]
			dbCommit()
			MsUnLock()
		EndIf
	EndIf
Next i

Return cTexto

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ GLTAtuSX3³ Autor ³ TOTVS                 ³ Data ³ 00/00/00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao de processamento da gravacao do SX3.                ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Implantacao Gestao do Leite.                               ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GLTAtuSX3()

Local aSX3   := {}
Local cOrdem
Local aEstrut:= {}
Local i      := 0
Local j      := 0
Local lSX3	 := .F.
Local cTexto := ''
Local cAlias := ''
Local nPosSXG := 0
Local nPosTam := 0
Local nTamCod	:= 6
Local cPicCod	:= '!@'
Local nTamLj	:= 2
Local cPicLj	:= '!@'
Local nTamFil := 4
Local i, _n

dbSelectArea("SXG")
dbSetOrder(1)
dbSeek("001")
nTamCod := XG_SIZE
cPicCod	:= XG_PICTURE

dbSeek("002")
nTamLj  := XG_SIZE
cPicLj	:= XG_PICTURE

dbSeek("033")
nTamFil := XG_SIZE


aEstrut := {"X3_ARQUIVO","X3_ORDEM","X3_CAMPO","X3_TIPO","X3_TAMANHO","X3_DECIMAL","X3_TITULO","X3_TITSPA","X3_TITENG","X3_DESCRIC","X3_DESCSPA","X3_DESCENG","X3_PICTURE","X3_VALID","X3_USADO","X3_RELACAO","X3_F3","X3_NIVEL","X3_RESERV","X3_CHECK","X3_TRIGGER","X3_PROPRI","X3_BROWSE","X3_VISUAL","X3_CONTEXT","X3_OBRIGAT","X3_VLDUSER","X3_CBOX","X3_CBOXSPA","X3_CBOXENG","X3_PICTVAR","X3_WHEN","X3_INIBRW","X3_GRPSXG","X3_FOLDER","X3_PYME","X3_CONDSQL","X3_CHKSQL","X3_IDXSRV","X3_ORTOGRA","X3_IDXFLD","X3_TELA"}

//Cadastro de Fornecedor/Retiro/Fretista
If upForne
	aAdd(aSX3, {"SA2","AA","A2_L_TPFOR","C",001,0,"Tipo Fornec.","Tipo Fornec.","Tipo Fornec.","Tipo Fornecedor/Produtor ","Tipo Fornecedor/Produtor ","Tipo Fornecedor/Produtor ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","S","A","R","",'Pertence("PTFERN")',"P=Produtor;T=Transp. Leite;F=Fornecedor;E=Funcionario empresa;N=Nao Cooperado","","","","","","","1","","","","","","",""})    
	aAdd(aSX3, {"SA2","H9","A2_L_LI_RO","C",006,0,"Grupo Preco  ","Grupo Preco ","Grupo Preco","Grupo de Preço	","Grupo de Preço		      ","Grupo de Preço              ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL3_01",1,"şÀ","","","U","N","A","R","",'EXISTCPO("ZL3")',"","","","",'',"","",cPast,"","","","","","",""})
//	aAdd(aSX3, {"SA2","I0","A2_L_TP_LR","C",001,0,"Tipo:       ","Tipo:       ","Tipo:       ","Tipo Linha/Rota          ","Tipo Linha/Rota          ","Tipo Linha/Rota          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","L=Linha;R=Rota;P=Plataforma","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","I1","A2_L_TANQ ","C",006,0,"Cod.Tanque  ","Cod.Tanque  ","Cod.Tanque  ","Codigo do Tanque         ","Codigo do Tanque         ","Codigo do Tanque         ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZLT_01",1,"şÀ","","","U","N","A","R","",'VAZIO().OR.U_ValidTq(M->A2_COD,M->A2_LOJA,M->A2_L_TANQ)',"","","","",'',"","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","I2","A2_L_DESLI","D",008,0,"Desligamento","Desligamento","Desligamento","Data de desligamento.    ","Data de desligamento.    ","Data de desligamento.    ","@!"                   ,""							   ,"€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","I3","A2_L_TPPAG","C",001,0,"Tipo Pagto  ","Tipo Pagto  ","Tipo Pagto  ","Tipo Pagto               ","Tipo Pagto               ","Tipo Pagto               ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","B=Banco;C=Cheque;D=Dinheiro","","","","","","",cPast,"","","","","","",""})	
    aAdd(aSX3, {"SA2","I4","A2_L_NIRF ","C",011,0,"Nr.ITR/NIRF ","Nr.ITR/NIRF ","Nr.ITR/NIRF ","Nr.ITR/NIRF              ","Nr.ITR/NIRF              ","Nr.ITR/NIRF              ","@R 9.999.999-9"       ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","I5","A2_L_SIGSI","C",003,0,"SIGSIF      ","SIGSIF      ","SIGSIF      ","Nro no SIGSIF            ","Nro no SIGSIF            ","Nro no SIGSIF            ","@R 999"               ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})	
	aAdd(aSX3, {"SA2","I6","A2_L_CEP  ","C",008,0,"Cep Corresp.","Cep Corresp.","Cep Corresp.","CEP de correspondecia.   ","CEP de correspondecia.   ","CEP de correspondecia.   ","@R 99999-999"         ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","I7","A2_L_END  ","C",050,0,"End. Correp.","End. Correp.","End. Correp.","Endereco para correspond.","Endereco para correspond.","Endereco para correspond.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","I8","A2_L_BAIRR","C",020,0,"Bairro Corr.","Bairro Corr.","Bairro Corr.","Bairro para correspond.  ","Bairro para correspond.  ","Bairro para correspond.  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","I9","A2_L_EST  ","C",002,0,"Estado Corr.","Estado Corr.","Estado Corr.","Estado Correspondencia.  ","Estado Correspondencia.  ","Estado Correspondencia.  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J0","A2_L_MUN  ","C",015,0,"Municip. Cor","Municip. Cor","Municip. Cor","Municipio Correspondencia","Municipio Correspondencia","Municipio Correspondencia","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J1","A2_L_CX_PO","C",005,0,"Cx Postal Co","Cx Postal Co","Cx Postal Co","Caixa Postal Correspond. ","Caixa Postal Correspond. ","Caixa Postal Correspond. ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J2","A2_L_TEL  ","C",050,0,"Tel. Corresp","Tel. Corresp","Tel. Corresp","Telefone Correspondencia.","Telefone Correspondencia.","Telefone Correspondencia.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J3","A2_L_FAX  ","C",015,0,"Fax Corresp.","Fax Corresp.","Fax Corresp.","Fax para Correspondencia.","Fax para Correspondencia.","Fax para Correspondencia.","@R 9999-9999"         ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J4","A2_L_CONTA","C",015,0,"Contato Cor.","Contato Cor.","Contato Cor.","Contato Correspondecia.  ","Contato Correspondecia.  ","Contato Correspondecia.  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J5","A2_L_FAZEN","C",040,0,"Fazenda     ","Fazenda     ","Fazenda     ","Fazenda do Produtor      ","Fazenda do Produtor      ","Fazenda do Produtor      ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","J6","A2_L_POSSE","C",002,0,"Cond. Posse ","Cond. Posse ","Cond. Posse ","Condicao de Posse da Faz.","Condicao de Posse da Faz.","Condicao de Posse da Faz.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","PR=Propriet.;LO=Locat.;AR=Arrend.;CO=Comodatario;PA=Parceria;CE=Cessionario;AS=Assentado;CD=Condomino;SB=Subrendat;US=Usufrut.","","","","","","",cPast,"","","","","","",""})	
	aAdd(aSX3, {"SA2","J7","A2_L_CAPAC","C",001,0,"Cap. Resfri.","Cap. Resfri.","Cap. Resfri.","Capacidade Resfriamento  ","Capacidade Resfriamento  ","Capacidade Resfriamento  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","0=Nenhuma;2=Duas Ordenhas;4=Quatro Ordenhas;","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J8","A2_L_TIPOR","C",001,0,"Tipo Ordenha","Tipo Ordenha","Tipo Ordenha","Tipo Ordenha(Manual/Mec.)","Tipo Ordenha(Manual/Mec.)","Tipo Ordenha(Manual/Mec.)","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","A=Manual;E=Mecanica;N=Nenhuma","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J9","A2_L_NROOR","C",001,0,"Nro Ordenhas","Nro Ordenhas","Nro Ordenhas","Numero de Ordenhas       ","Numero de Ordenhas       ","Numero de Ordenhas       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","0=Nenhuma;1=Uma;2=Duas;3=Tres","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","K0","A2_L_INCRA","C",012,0,"Nr. no INCRA","Nr. no INCRA","Nr. no INCRA","Numero no INCRA          ","Numero no INCRA          ","Numero no INCRA          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""}) 	
    aAdd(aSX3, {"SA2","K1","A2_L_FREQC","C",005,0,"Freq. Coleta","Freq. Coleta","Freq. Coleta","Frequencia de Coleta.    ","Frequencia de Coleta.    ","Frequencia de Coleta.    ","@E 99:99"             ,"","€€€€€€€€€€€€€€ ",'"48:00"'                   ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","K2","A2_L_HORAC","C",005,0,"Hora Coleta ","Hora Coleta ","Hora Coleta ","Hora da Coleta na fazenda","Hora da Coleta na fazenda","Hora da Coleta na fazenda","@E 99:99"             ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})    
    aAdd(aSX3, {"SA2","K3","A2_L_VOLUM","N",011,0,"Volume Diari","Volume Diari","Volume Diari","Volume diario de leite.  ","Volume diario de leite.  ","Volume diario de leite.  ","@E 999,999,999"       ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","K4","A2_L_ACESS","N",009,1,"Acesso (KM) ","Acesso (KM) ","Acesso (KM) ","Acessibilidade em KM.    ","Acessibilidade em KM.    ","Acessibilidade em KM.    ","@E 999,999.9"         ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})        
    aAdd(aSX3, {"SA2","K5","A2_L_TPLTE","C",001,0,"Tipo Leite  ","Tipo Leite  ","Tipo Leite  ","Tipo do Leite.           ","Tipo do Leite.           ","Tipo do Leite.           ","@!"                   ,"","€€€€€€€€€€€€€€ ",'"L"'                       ,"",1,"şÀ","","","U","N","A","R","","","L=Leite Cru Refrigerado;N=Leite Cru Nao Refrig","","","","","","",cPast,"","","","","","",""})    
    aAdd(aSX3, {"SA2","K6","A2_L_ENTDC","C",001,0,"Entrega Docs","Entrega Docs","Entrega Docs","Local Entrega Documentos","Local Entrega Documentos","Local Entrega Documentos   ","@!"                   ,"","€€€€€€€€€€€€€€ ",'"L"'                       ,"",1,"şÀ","","","U","N","A","R","",'Pertence("TLC")',"T=Transportador;L=Laticínio;C=Correio","","","","","","",cPast,"","","","","","",""})    
    aAdd(aSX3, {"SA2","K7","A2_L_INSS ","C",001,0,"Debita INSS?","Debita INSS?","Debita INSS?","Debita FUNRURAL Produtor.","Debita FUNRURAL Produtor.","Debita FUNRURAL Produtor.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","K8","A2_L_FUNDE","C",001,0,"FUNDEPEC    ","FUNDEPEC    ","FUNDEPEC    ","Debita FUNDEPEC Produtor.","Debita FUNDEPEC Produtor.","Debita FUNDEPEC Produtor.","@!"                   ,"","€€€€€€€€€€€€€€ ",'"N"'                       ,"",1,"şÀ","","","U","N","A","R","","","S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})    
	aAdd(aSX3, {"SA2","K9","A2_L_ICMS ","C",001,0,"Optante ICMS","Optante ICMS","Optante ICMS","Produtor optante pelo ICM","Produtor optante pelo ICM","Produtor optante pelo ICM","@!"                   ,"","€€€€€€€€€€€€€€ ",'"S"'                       ,"",1,"şÀ","","","U","N","A","R","",'Pertence("SN")',"S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","L0","A2_L_CTRC ","C",001,0,"Emite CTRC  ","Emite CTRC  ","Emite CTRC  ","Transp.  emite CTRC      ","Transp.  emite CTRC      ","Transp.  emite CTRC      ","@!"                   ,"","€€€€€€€€€€€€€€ ",'"N"'                       ,"",1,"şÀ","","","U","N","A","R","","","S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})	
    aAdd(aSX3, {"SA2","L1","A2_L_ADICI","N",012,4,"Preco Negoc.","Preco Negoc.","Preco Negoc.","Preco Negociado(Adc. Mer)","Preco Negociado(Adc. Mer)","Preco Negociado(Adc. Mer)","@E 999,999.9999"      ,"","€€€€€€€€€€€€€€€",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","L2","A2_L_BKPAD","N",012,4,"Bkp Prc Nego","Bkp Prc Nego","Bkp Prc Nego","Backup do Preco Negociado","Backup do Preco Negociado","Backup do Preco Negociado","@E 999,999.9999"      ,"","€€€€€€€€€€€€€€€",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})    
    aAdd(aSX3, {"SA2","L3","A2_L_GRUPO","C",006,0,"Grp Produtor","Grp Produtor","Grp Produtor","Grupo de Produtores.     ","Grupo de Produtores.     ","Grupo de Produtores.     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL5_01",1,"şÀ","","","U","N","A","R","",'VAZIO().OR.EXISTCPO("ZL5")',"","","","","","","",cPast,"","","","","","",""})    
    aAdd(aSX3, {"SA2","L4","A2_L_TPPRO","C",001,0,"Entra Grupo?","Entra Grupo?","Entra Grupo?","Entra no grupo d produtor","Prod. Pertence associacao","Prod. Pertence associacao","@!"                   ,"","€€€€€€€€€€€€€€ ",'"S"'                       ,"",1,"şÀ","","","U","N","A","R","",'Pertence("SN")',"S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})	    
    aAdd(aSX3, {"SA2","L5","A2_L_NASCI","D",008,0,"Nascimento  ","Nascimento  ","Nascimento  ","Data Nascimento Produtor.","Data Nascimento Produtor.","Data Nascimento Produtor.","@!"                   ,""							   ,"€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","L7","A2_L_SENAR","C",001,0,"Senar ?     ","Senar ?     ","Senar ?     ","Debita Senar do Produtor.","Debita Senar do Produtor.","Debita Senar do Produtor.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})	
    aAdd(aSX3, {"SA2","L8","A2_L_LIMIN","C",001,0,"Liminar ?   ","Liminar ?   ","Liminar ?   ","Liminar de Funrural.     ","Liminar de Funrural.     ","Liminar de Funrural.     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})	    
	aAdd(aSX3, {"SA2","L9","A2_L_EXTRA","N",014,4,"Bonif. Extra","Bonif. Extra","Bonif. Extra","Bonificacao Extra (MIX)  ","Bonificacao Extra (MIX)  ","Bonificacao Extra (MIX)  ","@E 9,999,999.9999"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","M0","A2_L_FIDEL","N",014,4,"Bonif. Fidel","Bonif. Fidel","Bonif. Fidel","Bonificacao Fidelidade   ","Bonificacao Fidelidade   ","Bonificacao Fidelidade   ","@E 9,999,999.9999"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})	
	aAdd(aSX3, {"SA2","M1","A2_L_VFIXO","N",014,2,"Vlr Fix Ener","Vlr Fix Ener","Vlr Fix Ener","Valor Fixo Energia Tanque","Valor Fixo Energia Tanque","Valor Fixo Energia Tanque","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","M2","A2_L_TRIBU","C",001,0,"Tributacao  ","Tributacao  ","Tributacao  ","Tipo tributacao produtor ","Tipo tributacao produtor ","Tipo tributacao produtor ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","S","A","R","","","I=Isento;T=Tributado;D=Diferido","","","","","","",cPast,"","","","","","",""})              
	aAdd(aSX3, {"SA2","M3","A2_L_TPPRO","C",001,0,"Associado ? ","Associado ? ","Associado ? ","Prod. Pertence associacao","Prod. Pertence associacao","Prod. Pertence associacao","@!"                   ,"","€€€€€€€€€€€€€€ ",'"S"'                       ,"",1,"şÀ","","","U","N","A","R","",'Pertence("SN")',"S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","M4","A2_L_ALTAN","N",014,2,"Al. Tanque  ","Al. Tanque  ","Al. Tanque  ","Desconto aluguel do tanq.","Desconto aluguel do tanq.","Desconto aluguel do tanq.","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","P7","A2_L_ASSOC","C",001,0,"Associação?     ","Associação?     ","Associação?     ","Associação?     ","Associação?     ","Associação?     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","S=Sim;N=Nao","","","",'M->A2_L_TPFOR == "P"',"","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","O9","A2_L_COMPL","C",200,0,"Comp. Info  ","Comp. Info  ","Comp. Info  ","Complemento de Informacao","Complemento de Informacao","Complemento de Informacao","@!"                   ,"","€€€€€€€€€€€€€€ ",""						  ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
//    aAdd(aSX3, {"SA2","M5","A2_L_VLPEN","N",014,2,"Pens. Alim. ","Pens. Alim. ","Pens. Alim. ","Desconto Pensao Aliment. ","Desconto Pensao Aliment. ","Desconto Pensao Aliment. ","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
//    aAdd(aSX3, {"SA2","M6","A2_L_BOLES","N",014,2,"Bolsa Est.  ","Bolsa Est.  ","Bolsa Est.  ","Desconto Bolsa de Estudos","Desconto Bolsa de Estudos","Desconto Bolsa de Estudos","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})    
//    aAdd(aSX3, {"SA2","M7","A2_L_CVMED","N",014,2,"Desc. Unimed","Desc. Unimed","Desc. Unimed","Desconto Convenio Unimed ","Desconto Convenio Unimed ","Desconto Convenio Unimed ","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})    
//	aAdd(aSX3, {"SA2","M8","A2_L_TXCON","N",005,2,"Tx Adm Conv","Tx Adm Conv","Tx Adm Conv","Taxa desconto do conveniado","Taxa desconto do conveniado","Taxa desconto do convenio","@E 99.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","",'A2_L_TPFOR=="F"',"","",cPast,"","","","","","",""})
//	aAdd(aSX3, {"SA2","M9","A2_L_ACRES","N",005,2,"Tx Acr Conv","Tx Acr Conv","Tx Acr Conv","Taxa acresc. ao conveniado","Taxa acresc. ao conveniado","Taxa acresc. ao conveniado","@E 99.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","",'A2_L_TPFOR=="F"',"","",cPast,"","","","","","",""})

/*	aAdd(aSX3, {"SA2","H9","A2_L_LI_RO","C",006,0,"Grupo Preco  ","Grupo Preco ","Grupo Preco","Grupo de Preço	","Grupo de Preço		      ","Grupo de Preço              ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL3_01",1,"şÀ","","","U","N","A","R","",'EXISTCPO("ZL3")',"","","","",'',"","",cPast,"","","","","","",""})
	//aAdd(aSX3, {"SA2","I0","A2_L_TP_LR","C",001,0,"Tipo:       ","Tipo:       ","Tipo:       ","Tipo Linha/Rota          ","Tipo Linha/Rota          ","Tipo Linha/Rota          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","L=Linha;R=Rota;P=Plataforma","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","I1","A2_L_TANQ ","C",006,0,"Cod.Tanque  ","Cod.Tanque  ","Cod.Tanque  ","Codigo do Tanque         ","Codigo do Tanque         ","Codigo do Tanque         ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZLT_02",1,"şÀ","","","U","N","A","R","",'VAZIO().OR.U_ValidTq(M->A2_COD,M->A2_LOJA,M->A2_L_TANQ)',"","","","",'',"","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","I2","A2_L_DESLI","D",008,0,"Dt. Desliga.","Dt. Desliga.","Dt. Desliga.","Data de desligamento.    ","Data de desligamento.    ","Data de desligamento.    ","@!"                   ,""							   ,"€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","I3","A2_L_TPPAG","C",001,0,"Tipo Pagto  ","Tipo Pagto  ","Tipo Pagto  ","Tipo Pagto               ","Tipo Pagto               ","Tipo Pagto               ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","B=Banco;C=Cheque;D=Dinheiro","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","I4","A2_L_NIRF ","C",011,0,"Nr.ITR/NIRF ","Nr.ITR/NIRF ","Nr.ITR/NIRF ","Nr.ITR/NIRF              ","Nr.ITR/NIRF              ","Nr.ITR/NIRF              ","@R 9.999.999-9"       ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","I5","A2_L_SIGSI","C",003,0,"SIGSIF      ","SIGSIF      ","SIGSIF      ","Nro no SIGSIF            ","Nro no SIGSIF            ","Nro no SIGSIF            ","@R 999"               ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","I6","A2_L_CEP  ","C",008,0,"Cep Corresp.","Cep Corresp.","Cep Corresp.","CEP de correspondecia.   ","CEP de correspondecia.   ","CEP de correspondecia.   ","@R 99999-999"         ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","I7","A2_L_END  ","C",050,0,"End. Correp.","End. Correp.","End. Correp.","Endereco para correspond.","Endereco para correspond.","Endereco para correspond.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","I8","A2_L_BAIRR","C",020,0,"Bairro Corr.","Bairro Corr.","Bairro Corr.","Bairro para correspond.  ","Bairro para correspond.  ","Bairro para correspond.  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","I9","A2_L_EST  ","C",002,0,"Estado Corr.","Estado Corr.","Estado Corr.","Estado Correspondencia.  ","Estado Correspondencia.  ","Estado Correspondencia.  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J0","A2_L_MUN  ","C",015,0,"Municip. Cor","Municip. Cor","Municip. Cor","Municipio Correspondencia","Municipio Correspondencia","Municipio Correspondencia","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J1","A2_L_CX_PO","C",005,0,"Cx Postal Co","Cx Postal Co","Cx Postal Co","Caixa Postal Correspond. ","Caixa Postal Correspond. ","Caixa Postal Correspond. ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J2","A2_L_TEL  ","C",050,0,"Tel. Corresp","Tel. Corresp","Tel. Corresp","Telefone Correspondencia.","Telefone Correspondencia.","Telefone Correspondencia.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J3","A2_L_FAX  ","C",015,0,"Fax Corresp.","Fax Corresp.","Fax Corresp.","Fax para Correspondencia.","Fax para Correspondencia.","Fax para Correspondencia.","@R 9999-9999"         ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J4","A2_L_CONTA","C",015,0,"Contato Cor.","Contato Cor.","Contato Cor.","Contato Correspondecia.  ","Contato Correspondecia.  ","Contato Correspondecia.  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J5","A2_L_FAZEN","C",040,0,"Fazenda     ","Fazenda     ","Fazenda     ","Fazenda do Produtor      ","Fazenda do Produtor      ","Fazenda do Produtor      ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","J6","A2_L_POSSE","C",002,0,"Cond. Posse ","Cond. Posse ","Cond. Posse ","Condicao de Posse da Faz.","Condicao de Posse da Faz.","Condicao de Posse da Faz.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","PR=Propriet.;LO=Locat.;AR=Arrend.;CO=Comodatario;PA=Parceria;CE=Cessionario;AS=Assentado;CD=Condomino;SB=Subrendat;US=Usufrut.","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J7","A2_L_CAPAC","C",001,0,"Cap. Resfri.","Cap. Resfri.","Cap. Resfri.","Capacidade Resfriamento  ","Capacidade Resfriamento  ","Capacidade Resfriamento  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","0=Nenhuma;2=Duas Ordenhas;4=Quatro Ordenhas;","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J8","A2_L_TIPOR","C",001,0,"Tipo Ordenha","Tipo Ordenha","Tipo Ordenha","Tipo Ordenha(Manual/Mec.)","Tipo Ordenha(Manual/Mec.)","Tipo Ordenha(Manual/Mec.)","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","A=Manual;E=Mecanica;N=Nenhuma","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","J9","A2_L_NROOR","C",001,0,"Nro Ordenhas","Nro Ordenhas","Nro Ordenhas","Numero de Ordenhas       ","Numero de Ordenhas       ","Numero de Ordenhas       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","0=Nenhuma;1=Uma;2=Duas;3=Tres","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","K0","A2_L_INCRA","C",012,0,"Nr. no INCRA","Nr. no INCRA","Nr. no INCRA","Numero no INCRA          ","Numero no INCRA          ","Numero no INCRA          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","K1","A2_L_FREQC","C",005,0,"Freq. Coleta","Freq. Coleta","Freq. Coleta","Frequencia de Coleta.    ","Frequencia de Coleta.    ","Frequencia de Coleta.    ","@E 99:99"             ,"","€€€€€€€€€€€€€€ ",'"48:00"'                   ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","K2","A2_L_HORAC","C",005,0,"Hora Coleta ","Hora Coleta ","Hora Coleta ","Hora da Coleta na fazenda","Hora da Coleta na fazenda","Hora da Coleta na fazenda","@E 99:99"             ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","K3","A2_L_VOLUM","N",011,0,"Volume Diari","Volume Diari","Volume Diari","Volume diario de leite.  ","Volume diario de leite.  ","Volume diario de leite.  ","@E 999,999,999"       ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","K4","A2_L_ACESS","N",009,1,"Acesso (KM) ","Acesso (KM) ","Acesso (KM) ","Acessibilidade em KM.    ","Acessibilidade em KM.    ","Acessibilidade em KM.    ","@E 999,999.9"         ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","K5","A2_L_TPLTE","C",001,0,"Tipo Leite  ","Tipo Leite  ","Tipo Leite  ","Tipo do Leite.           ","Tipo do Leite.           ","Tipo do Leite.           ","@!"                   ,"","€€€€€€€€€€€€€€ ",'"L"'                       ,"",1,"şÀ","","","U","N","A","R","","","L=Leite Cru Refrigerado;N=Leite Cru Nao Refrig","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","K6","A2_L_ENTDC","C",001,0,"Entrega Docs","Entrega Docs","Entrega Docs","Local Entrega Documentos","Local Entrega Documentos","Local Entrega Documentos   ","@!"                   ,"","€€€€€€€€€€€€€€ ",'"L"'                       ,"",1,"şÀ","","","U","N","A","R","",'Pertence("TLC")',"T=Transportador;L=Laticínio;C=Correio","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","K7","A2_L_INSS ","C",001,0,"Debita INSS?","Debita INSS?","Debita INSS?","Debita FUNRURAL Produtor.","Debita FUNRURAL Produtor.","Debita FUNRURAL Produtor.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","K8","A2_L_FUNDE","C",001,0,"FUNDEPEC    ","FUNDEPEC    ","FUNDEPEC    ","Debita FUNDEPEC Produtor.","Debita FUNDEPEC Produtor.","Debita FUNDEPEC Produtor.","@!"                   ,"","€€€€€€€€€€€€€€ ",'"N"'                       ,"",1,"şÀ","","","U","N","A","R","","","S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","K9","A2_L_ICMS ","C",001,0,"Optante ICMS","Optante ICMS","Optante ICMS","Produtor optante pelo ICM","Produtor optante pelo ICM","Produtor optante pelo ICM","@!"                   ,"","€€€€€€€€€€€€€€ ",'"S"'                       ,"",1,"şÀ","","","U","N","A","R","",'Pertence("SN")',"S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","L0","A2_L_CTRC ","C",001,0,"Emite CTRC  ","Emite CTRC  ","Emite CTRC  ","Transp.  emite CTRC      ","Transp.  emite CTRC      ","Transp.  emite CTRC      ","@!"                   ,"","€€€€€€€€€€€€€€ ",'"N"'                       ,"",1,"şÀ","","","U","N","A","R","","","S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","L1","A2_L_ADICI","N",012,4,"Preco Negoc.","Preco Negoc.","Preco Negoc.","Preco Negociado(Adc. Mer)","Preco Negociado(Adc. Mer)","Preco Negociado(Adc. Mer)","@E 999,999.9999"      ,"","€€€€€€€€€€€€€€€",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","L2","A2_L_BKPAD","N",012,4,"Bkp Prc Nego","Bkp Prc Nego","Bkp Prc Nego","Backup do Preco Negociado","Backup do Preco Negociado","Backup do Preco Negociado","@E 999,999.9999"      ,"","€€€€€€€€€€€€€€€",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","L3","A2_L_GRUPO","C",006,0,"Grp Produtor","Grp Produtor","Grp Produtor","Grupo de Produtores.     ","Grupo de Produtores.     ","Grupo de Produtores.     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL5_01",1,"şÀ","","","U","N","A","R","",'VAZIO().OR.EXISTCPO("ZL5")',"","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","L4","A2_L_TPPRO","C",001,0,"Entra Grupo?","Entra Grupo?","Entra Grupo?","Entra no grupo d produtor","Prod. Pertence associacao","Prod. Pertence associacao","@!"                   ,"","€€€€€€€€€€€€€€ ",'"S"'                       ,"",1,"şÀ","","","U","N","A","R","",'Pertence("SN")',"S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","L5","A2_L_NASCI","D",008,0,"Nascimento  ","Nascimento  ","Nascimento  ","Data Nascimento Produtor.","Data Nascimento Produtor.","Data Nascimento Produtor.","@!"                   ,""							      ,"€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","L6","A2_L_TPFOR","C",001,0,"Tipo Fornec.","Tipo Fornec.","Tipo Fornec.","Tipo Fornecedor/Produtor ","Tipo Fornecedor/Produtor ","Tipo Fornecedor/Produtor ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","S","A","R","",'Pertence("PTFGAC")',"P=Produtor Cooperado;T=Produtor Terceiro;F=Fornecedor;G=Transportador Granel;A=Cooperativa/Associacao;C=Cliente;","","","","","","","1","","","","","","",""})
    //aAdd(aSX3, {"SA2","L6","A2_C_TPFOR","C",001,0,"Tipo Fornec.","Tipo Fornec.","Tipo Fornec.","Tipo Fornecedor/Produtor ","Tipo Fornecedor/Produtor ","Tipo Fornecedor/Produtor ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","S","A","R","",'Pertence(U_GETRELA1("1","ZL1_GFORNE"))',"P=Produtor Cooperado;T=Produtor Terceiro;F=Fornecedor;G=Transportador Granel;A=Cooperativa/Associacao;C=Cliente;","","","","","","","1","","","","","","",""})  //
    aAdd(aSX3, {"SA2","L7","A2_L_SENAR","C",001,0,"Senar ?     ","Senar ?     ","Senar ?     ","Debita Senar do Produtor.","Debita Senar do Produtor.","Debita Senar do Produtor.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","L8","A2_L_LIMIN","C",001,0,"Liminar ?   ","Liminar ?   ","Liminar ?   ","Liminar de Funrural.     ","Liminar de Funrural.     ","Liminar de Funrural.     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","L9","A2_L_EXTRA","N",014,4,"Bonif. Extra","Bonif. Extra","Bonif. Extra","Bonificacao Extra (MIX)  ","Bonificacao Extra (MIX)  ","Bonificacao Extra (MIX)  ","@E 9,999,999.9999"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","M0","A2_L_FIDEL","N",014,4,"Bonif. Fidel","Bonif. Fidel","Bonif. Fidel","Bonificacao Fidelidade   ","Bonificacao Fidelidade   ","Bonificacao Fidelidade   ","@E 9,999,999.9999"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","M1","A2_L_VFIXO","N",014,2,"Vlr Fix Ener","Vlr Fix Ener","Vlr Fix Ener","Valor Fixo Energia Tanque","Valor Fixo Energia Tanque","Valor Fixo Energia Tanque","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","M2","A2_L_TRIBU","C",001,0,"Tributacao  ","Tributacao  ","Tributacao  ","Tipo tributacao produtor ","Tipo tributacao produtor ","Tipo tributacao produtor ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",2,"şÀ","","","U","S","A","R","","","I=Isento;T=Tributado;D=Diferido","","","","","","",cPast,"","","","","","",""})
	//aAdd(aSX3, {"SA2","M3","A2_L_TPPRO","C",001,0,"Associado ? ","Associado ? ","Associado ? ","Prod. Pertence associacao","Prod. Pertence associacao","Prod. Pertence associacao","@!"                   ,"","€€€€€€€€€€€€€€ ",'"S"'                       ,"",1,"şÀ","","","U","N","A","R","",'Pertence("SN")',"S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})	// Removido Leandro (campo A2_L_TPPRO duplicado)
    aAdd(aSX3, {"SA2","M4","A2_L_ALTAN","N",014,2,"Al. Tanque  ","Al. Tanque  ","Al. Tanque  ","Desconto aluguel do tanq.","Desconto aluguel do tanq.","Desconto aluguel do tanq.","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    //aAdd(aSX3, {"SA2","M5","A2_L_VLPEN","N",014,2,"Pens. Alim. ","Pens. Alim. ","Pens. Alim. ","Desconto Pensao Aliment. ","Desconto Pensao Aliment. ","Desconto Pensao Aliment. ","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    //aAdd(aSX3, {"SA2","M6","A2_L_BOLES","N",014,2,"Bolsa Est.  ","Bolsa Est.  ","Bolsa Est.  ","Desconto Bolsa de Estudos","Desconto Bolsa de Estudos","Desconto Bolsa de Estudos","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
    //aAdd(aSX3, {"SA2","M7","A2_L_CVMED","N",014,2,"Desc. Unimed","Desc. Unimed","Desc. Unimed","Desconto Convenio Unimed ","Desconto Convenio Unimed ","Desconto Convenio Unimed ","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","M8","A2_L_CDASS","C",nTamCod,0,"Cod. Assoc. ","Cod. Assoc. ","Cod. Assoc. ","Código da associação     ","Código da associação     ","Código da associação     ",cPicCod            ,"","€€€€€€€€€€€€€€ ",""                          ,"SA2_LB",1,"şÀ","","","U","N","A","R","",'EXISTCPO("SA2")',"","","","",'M->A2_C_TPFOR == "A"',"","001",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","M9","A2_L_DTINC","D",008,0,"Dt Alt Incet","Dt Alt Incet","Dt Alt Incet","Dt alt.status Incent.Prod","Dt alt.status Incent.Prod","Dt alt.status Incent.Prod","@!"                   ,"","€€€€€€€€€€€€€€ ",""						  ,"",1,"şÀ","","","U","S","A","R","","","","","","","","","",cPast,"","","","","","",""})
	//aAdd(aSX3, {"SA2","N0","A2_L_CUNMD","C",006,0,"Conv. Unimed","Conv. Unimed","Conv. Unimed","Conv. Unimed Cod.Familia","Conv.Unimed","Conv.Unimed",															   "@!"                   ,""," ",""               ,"",1,"şÀ","","","U","S","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	//aAdd(aSX3, {"SA2","N1","A2_L_CODFU","C",006,0,"Cod Func.","Cod Func.","Cod Func.","Cod Func.","Cod Func.","Cod Func.",                  "@!"                   ,""," ",""                          ,"",1,"şÀ","","","U","S","A","R","",'',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SA2","N2","A2_L_NOTA","N",006,2,"Nota Transp","Nota Transp","Nota Transp","Nota Transp","Nota Transp","Nota Transp",															   "@E 999.99"                   ,""," ",""                          ,"",1,"şÀ","","","U","S","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","N3","A2_L_USER","C",006,0,"Cod.Usuario","Cod.Usuario","Cod.Usuario","Cod. usuario do sistema.","Cod. usuario do sistema.","Cod. usuario do sistema.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"USR",1,"şÀ","","","U","N","A","R","",'VAZIO().OR.USRExist(M->A2_L_USER)',"","","","",'A2_C_TPFOR=="F"',"","",cPast,"","","","","","",""})
    //aAdd(aSX3, {"SA2","N4","A2_L_EVENT","C",006,0,"Evento Conv.","Evento Conv.","Evento Conv.","Evento do Convenio  ","Evento do Convenio  ","Evento do Convenio  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL8_01",1,"şÀ","","","U","N","A","R","",'VAZIO().OR. EXISTCPO("ZL8")',"","","","",'A2_C_TPFOR=="F"',"","",cPast,"","","","","","",""})
    aAdd(aSX3, {"SA2","N5","A2_L_BPF","C",001,0,"BPF?     ","BPF?     ","BPF?     ","Participante de BPF.","Participante de BPF.","Participante de BPF.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})
	//aAdd(aSX3, {"SA2","N6","A2_L_TXCON","N",005,2,"Tx Adm Conv","Tx Adm Conv","Tx Adm Conv","Taxa desconto do conveniado","Taxa desconto do conveniado","Taxa desconto do convenio","@E 99.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","",'A2_C_TPFOR=="F"',"","",cPast,"","","","","","",""})
	//aAdd(aSX3, {"SA2","N7","A2_L_ACRES","N",005,2,"Tx Acr Conv","Tx Acr Conv","Tx Acr Conv","Taxa acresc. ao conveniado","Taxa acresc. ao conveniado","Taxa acresc. ao conveniado","@E 99.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","",'A2_C_TPFOR=="F"',"","",cPast,"","","","","","",""})
//	aAdd(aSX3, {"SA2","N8","A2_L_NTFR","N",002,0,"Nota Transp.","Nota Transp.","Nota Transp.","Nota do Transportador","Nota do Transportador","Nota do Transportador","@E 99"    ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","A","R","€","","","","","",'',"","","1","","","","","","",""})
//	aAdd(aSX3, {"SA2","N9","A2_L_MATRI","C",006,0,"Matricula","Matricula","Matricula","Matricula Cooperado","Matricula Cooperado","Matricula do Cooperado",                  "@R 999999"                   ,""," ",""                          ,"",1,"şÀ","","","U","N","A","R","€",'',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SA2","N9","A2_L_MATRI","C",006,0,"Matricula","Matricula","Matricula","Matricula Cooperado","Matricula Cooperado","Matricula do Cooperado",                  "@R 999999"                   ,""," ",""                          ,"",1,"şÀ","","","U","N","A","R","",'IIF((M->A2_C_TPFOR == "P") , NaoVazio() .AND. U_MGLT302(M->A2_L_MATRI,M->A2_CGC) ,Empty(M->A2_L_MATRI))',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","O0","A2_L_DTADM","D",008,0,"Dt Admissao ","Dt Admissao ","Dt Admissao ","Dt Admissao Funcionario  ","Dt Admissao Funcionario  ","Dt Admissao Funcionario  ",""                   ,"","€€€€€€€€€€€€€€ ",""						  ,"",1,"şÀ","","","U","S","A","R","",'IIF((M->A2_C_TPFOR == "P") , NaoVazio() , Empty(M->A2_L_DTADM))',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","O1","A2_L_DTADM","D",008,0,"Dt Demissão ","Dt Demissão","Dt Demissão ","Dt Demissao Funcionario  ","Dt Demissao Funcionario  ","Dt Demissao Funcionario  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""						  ,"",1,"şÀ","","","U","S","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","O2","A2_L_NRP  ","C",011,0,"NRP         ","NRP         ","NRP         ","Codigo NRP               ","Codigo NRP               ","Codigo NRP               ","@R 99999999-99"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","O3","A2_L_AREAT","N",010,1,"Area Total  ","Area Total  ","Area Total  ","Area Total (Ha)          ","Area Total (Ha)          ","Area Total (Ha)          ","@E 999,999.99"         ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","O4","A2_L_RENDA","C",060,0,"Renda Auxili","Renda Auxili","Renda Auxili","Outra Fonte de Renda     ","Outra Fonte de Renda     ","Outra Fonte de Renda     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","O5","A2_L_PASTO","C",060,0,"Pasto Princi","Pasto Princi","Pasto Princi","Pasto Principal Forrageir","Pasto Principal Forrageir","Pasto Principal Forrageir","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","O6","A2_L_AREAP","N",010,1,"Area Pasto  ","Area Pasto  ","Area Pasto  ","Area Pasto (Ha)          ","Area Pasto (Ha)          ","Area Pasto (Ha)          ","@E 999,999.99"         ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","O7","A2_L_TECNI","C",060,0,"Tec Responsa","Tec Responsa","Tec Responsa","Tecnico Responsavel      ","Tecnico Responsavel      ","Tecnico Responsavel      ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","O8","A2_L_DTFIC","D",008,0,"Data Ficha  ","Data Ficha  ","Data Ficha  ","Data Preenchimento Ficha ","Data Preenchimento Ficha ","Data Preenchimento Ficha ","@!"                   ,"","€€€€€€€€€€€€€€ ",""						  ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","O9","A2_L_COMPL","C",200,0,"Comp. Info  ","Comp. Info  ","Comp. Info  ","Complemento de Informacao","Complemento de Informacao","Complemento de Informacao","@!"                   ,"","€€€€€€€€€€€€€€ ",""						  ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","P1","A2_L_TPDES","C",001,0,"Desligamento","Desligamento","Desligamento","Tipo De Desligamento     ","Tipo De Desligamento     ","Tipo De Desligamento     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""						  ,"",1,"şÀ","","","U","N","A","R","","","D=DEMISSAO;E=ELIMINACAO;X=EXCLUSAO","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","P2","A2_L_MOTIV","C",200,0,"Mot. Desliga","Mot. Desliga","Mot. Desliga","Motivo Desligamento      ","Motivo Desligamento      ","Motivo Desligamento      ","@!"                   ,"","€€€€€€€€€€€€€€ ",""						  ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
	//aAdd(aSX3, {"SA2","P3","A2_L_RPERD","C",001,0,"Rat. Perdas ","Rat. Perdas ","Rat. Perdas ","Rateio de Perdas         ","Rateio de Perdas         ","Rateio de Perdas         ","@!"                   ,"","€€€€€€€€€€€€€€ ",'"N"'                          ,"",1,"şÀ","","","U","N","A","R","€","","S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})
	//aAdd(aSX3, {"SA2","P4","A2_L_VPERD","N",010,1,"Vlr. Perdas ","Vlr. Perdas ","Vlr. Perdas ","Valor Perdas Pendente    ","Valor Perdas Pendente    ","Valor Perdas Pendente    ","@!"			          ,"","€€€€€€€€€€€€€€ ",'0'                        ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})	
    //aAdd(aSX3, {"SA2","P5","A2_L_PREVI","C",001,0,"Prev. Privad","Prev. Privad","Prev. Privad","Previdência Privada      ","Previdência Privada      ","Previdência Privada      ","@!"                   ,"","€€€€€€€€€€€€€€ ",'"N"'                          ,"",1,"şÀ","","","U","N","A","R","€","","S=Sim;N=Nao","","","","","","",cPast,"","","","","","",""})
	//aAdd(aSX3, {"SA2","P6","A2_L_VLRPR","N",010,1,"Valor Previd","Valor Previd","Valor Previd","Valor Previdência Privada","Valor Previdência Privada","Valor Previdência Privada","@E 999,999.99"         ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","",cPast,"","","","","","",""})
	//aAdd(aSX3, {"SA2","P7","A2_L_ASSOC","C",001,0,"Associação?     ","Associação?     ","Associação?     ","Associação?     ","Associação?     ","Associação?     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","S=Sim;N=Nao","","","",'M->A2_C_TPFOR == "P"',"","",cPast,"","","","","","",""})
	aAdd(aSX3, {"SA2","P3","A2_L_LINHA","C",002,0,"Linha","Linha","Linha","Linha Produtor","Linha Produtor","Linha Produtor",                  "@R 99"                   ,""," ",""                          ,"",1,"şÀ","","","U","N","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
*/	   
	_cOrder:=GLTOrdX3("SA2")
	//Preenche o array dos campos
	For _n:=1 to Len(aSX3)
		IF aSX3[_n][1] == "SA2"
			_cOrder:=Soma1(_cOrder)
			aSX3[_n][2]:=_cOrder
		EndIF
	Next
	//Cadastro de Clientes
 	AAdd(aSX3, {"SA1","L6","A1_L_TPCLI","C",001,0,"Tipo Cliente","Tipo Cliente","Tipo Cliente","Tipo Client/Produtor/Fret","Tipo Client/Produtor/Fret","Tipo Client/Produtor/Fret","@!"                   ,"","€€€€€€€€€€€€€€ ","'C'"                          ,"",1,"şÀ","","","U","S","A","R","",'Pertence("PTFGAC")',"C=Cliente;P=Produtor Cooperado;T=Produtor Terceiro;F=Fornecedor;G=Transportador Granel;A=Cooperativa/Associacao;","","","","","","","1","","","","","","",""})	// Alterado X3_RELACAO = 'C'
	//aAdd(aSX3, {"SA1","L6","A1_L_TPCLI","C",001,0,"Tipo Cliente","Tipo Cliente","Tipo Cliente","Tipo Client/Produtor/Fret","Tipo Client/Produtor/Fret","Tipo Client/Produtor/Fret","@!"                   ,"","€€€€€€€€€€€€€€ ","'C'"                          ,"",1,"şÀ","","","U","S","A","R","",'Pertence(U_GETRELA1("1,"ZL1_GCLIEN"))',"C=Cliente;P=Produtor Cooperado;T=Produtor Terceiro;F=Fornecedor;G=Transportador Granel;A=Cooperativa/Associacao;","","","","","","","1","","","","","","",""})	// Alterado X3_RELACAO = 'C' //#LETRAS
	//aAdd(aSX3, {"SA1","L7","A1_L_ENGRP","C",001,0,"Tipo Cliente","Tipo Cliente","Tipo Cliente","Tipo Client/Produtor/Fret","Tipo Client/Produtor/Fret","Tipo Client/Produtor/Fret","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","S","A","R","",'Pertence("CEGLT")',"C=Cliente;P=Produtor;G=Transp. leite granel;A=Associacao;B=Produtor Associado","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SA1","L8","A1_L_CDASS","C",nTamCod,0,"Cod. Assoc. ","Cod. Assoc. ","Cod. Assoc. ","Código da associação     ","Código da associação     ","Código da associação     ",cPicCod              ,"","€€€€€€€€€€€€€€ ",""                          ,"SA1",1,"şÀ","","","U","N","A","R","",'EXISTCPO("SA1")',"","","","",'Alltrim(M->A1_L_TPCLI) == "A"',"","",cPast,"","","","","","",""})
	//aAdd(aSX3, {"SA1","L9","A1_L_CODFU","C",006,0,"Cod Func.","Cod Func.","Cod Func.","Cod Func.","Cod Func.","Cod Func.",															   "@!"                   ,""," ",""                          ,"",1,"şÀ","","","U","S","A","R","",'',"","","","","","","","1","","","","","","",""})
    
	_cOrder:=GLTOrdX3("SA1") 
	//Preenche o array dos campos

	For _n:=1 to Len(aSX3)
		IF aSX3[_n][1] == "SA1"
			_cOrder:=Soma1(_cOrder)
			aSX3[_n][2]:=_cOrder
		EndIF
	Next
EndIf

//Contas a Receber
If upFinan
	aAdd(aSX3, {"SE2","K0","E2_L_SETOR","C",006,0,"Setor       ","Setor       ","Setor       ","Setor                    ","Setor                    ","Setor                    ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL2_01",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SE2","K1","E2_L_MIX  ","C",006,0,"Cod. do MIX ","Cod. do MIX ","Cod. do MIX ","Codigo do MIX.           ","Codigo do MIX.           ","Codigo do MIX.           ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZLE_01",1,"şÀ","","","U","N","V","R","",'EXISTCPO("ZLE")',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SE2","K2","E2_L_VERSA","C",001,0,"Versao MIX  ","Versao MIX  ","Versao MIX  ","Versao do MIX.           ","Versao do MIX.           ","Versao do MIX.           ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SE2","K3","E2_L_TPPAG","C",001,0,"Tipo Pagto  ","Tipo Pagto  ","Tipo Pagto  ","Tipo Pagto               ","Tipo Pagto               ","Tipo Pagto               ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","B=Banco;C=Cheque;D=Dinheiro","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SE2","K4","E2_L_CDFEC","C",006,0,"Cod Fechamen","Cod Fechamen","Cod Fechamen","Cod Fechamento           ","Codigo do Fechamento     ","Codigo do Fechamento     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","8","","","","","","",""})
	aAdd(aSX3, {"SE2","K5","E2_L_SITUA","C",001,0,"Situacao Act","Situacao Act","Situacao Act","Situacao Acerto: Inc/Bax.","Situacao Acerto: Inc/Bax.","Situacao Acerto: Inc/Bax.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","I=Incluido;B=Baixado","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SE2","K6","E2_L_SEEK ","C",050,0,"Seek GLT    ","Seek GLT    ","Seek GLT    ","Amarracao MIXxAcertoxFina","Amarracao MIXxAcertoxFina","Amarracao MIXxAcertoxFina","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SE2","K7","E2_L_BANCO","C",003,0,"Banco do Prd","    ","    ","Banco do Produtor  ","","","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SE2","K8","E2_L_AGENC","C",005,0,"Agenc do Prd","    ","    ","Agencia do Produtor","","","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SE2","K9","E2_L_CONTA","C",010,0,"Conta do Prd","    ","    ","Conta do Prd       ","","","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"SE2","L0","E2_L_PAICV","C",008,0,"Pai Convenio","Pai Convenio","Pai Convenio","Convenio pai dos titulos.","Convenio pai dos titulos.","Convenio pai dos titulos.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","7","","","","","","",""})
	aAdd(aSX3, {"SE2","M4","E2_L_EVENT","C",006,0,"Evento Leite","Evento Leite","Evento Leite","Codigo do Evento Leite","Codigo do Evento Leite","Codigo do Evento Leite","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",0,"şÀ","","","U","N","A","R","","","","","","","","","","","","","","N","N","",""})

	_cOrder:=GLTOrdX3("SE2")
	//Preenche o array dos campos
	For _n:=1 to Len(aSX3)
		IF aSX3[_n][1] == "SE2"
			_cOrder:=Soma1(_cOrder)
			aSX3[_n][2]:=_cOrder
		EndIF
	Next



	aAdd(aSX3, {"SE1","K0","E1_L_SETOR","C",006,0,"Setor       ","Setor       ","Setor       ","Setor                    ","Setor                    ","Setor                    ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL2_01",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SE1","K1","E1_L_MIX  ","C",006,0,"Cod. do MIX ","Cod. do MIX ","Cod. do MIX ","Codigo do MIX.           ","Codigo do MIX.           ","Codigo do MIX.           ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZLE_01",1,"şÀ","","","U","N","V","R","",'EXISTCPO("ZLE")',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SE1","K2","E1_L_VERSA","C",001,0,"Versao MIX  ","Versao MIX  ","Versao MIX  ","Versao do MIX.           ","Versao do MIX.           ","Versao do MIX.           ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SE1","K3","E1_L_TPPAG","C",001,0,"Tipo Pagto  ","Tipo Pagto  ","Tipo Pagto  ","Tipo Pagto               ","Tipo Pagto               ","Tipo Pagto               ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","B=Banco;C=Cheque;D=Dinheiro","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SE1","K4","E1_L_CDFEC","C",006,0,"Cod Fechamen","Cod Fechamen","Cod Fechamen","Cod Fechamento           ","Codigo do Fechamento     ","Codigo do Fechamento     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","8","","","","","","",""})
	aAdd(aSX3, {"SE1","K5","E1_L_SITUA","C",001,0,"Situacao Act","Situacao Act","Situacao Act","Situacao Acerto: Inc/Bax.","Situacao Acerto: Inc/Bax.","Situacao Acerto: Inc/Bax.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","I=Incluido;B=Baixado","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SE1","K6","E1_L_SEEK ","C",050,0,"Seek GLT    ","Seek GLT    ","Seek GLT    ","Amarracao MIXxAcertoxFina","Amarracao MIXxAcertoxFina","Amarracao MIXxAcertoxFina","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SE1","K7","E1_L_BANCO","C",003,0,"Banco do Prd","    ","    ","Banco do Produtor  ","","","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SE1","K8","E1_L_AGENC","C",005,0,"Agenc do Prd","    ","    ","Agencia do Produtor","","","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SE1","K9","E1_L_CONTA","C",010,0,"Conta do Prd","    ","    ","Conta do Prd       ","","","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"SE1","L0","E1_L_PAICV","C",008,0,"Pai Convenio","Pai Convenio","Pai Convenio","Convenio pai dos titulos.","Convenio pai dos titulos.","Convenio pai dos titulos.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","7","","","","","","",""})
	aAdd(aSX3, {"SE1","M4","E1_L_EVENT","C",006,0,"Evento Leite","Evento Leite","Evento Leite","Codigo do Evento Leite","Codigo do Evento Leite","Codigo do Evento Leite","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",0,"şÀ","","","U","N","A","R","","","","","","","","","","","","","","N","N","",""})
	aAdd(aSX3, {"SE1","00","E1_L_FORPG ","C",002,0,"Forma Pgto","Forma Pgto","Forma Pgto","Forma Pagamento","Forma Pagamento","Forma Pagamento","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","","1","","","","","","",""})
	_cOrder:=GLTOrdX3("SE1")
	//Preenche o array dos campos
	For _n:=1 to Len(aSX3)
		IF aSX3[_n][1] == "SE1"
			_cOrder:=Soma1(_cOrder)
			aSX3[_n][2]:=_cOrder
		EndIF
	Next

	aAdd(aSX3, {"SE5","89","E5_L_SEEK ","C",050,0,"Seek GLT    ","Seek GLT    ","Seek GLT    ","Amarracao MIXxAcertoxFina","Amarracao MIXxAcertoxFina","Amarracao MIXxAcertoxFina","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	_cOrder:=GLTOrdX3("SE5")
	//Preenche o array dos campos
	For _n:=1 to Len(aSX3)
		IF aSX3[_n][1] == "SE5"
			_cOrder:=Soma1(_cOrder)
			aSX3[_n][2]:=_cOrder
		EndIF
	Next


	aAdd(aSX3, {"SE4","00","E4_L_FORPG ","C",002,0,"Forma Pgto","Forma Pgto","Forma Pgto","Forma Pagamento","Forma Pagamento","Forma Pagamento","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","","1","","","","","","",""})
	_cOrder:=GLTOrdX3("SE4")
	//Preenche o array dos campos
	For _n:=1 to Len(aSX3)
		IF aSX3[_n][1] == "SE4"
			_cOrder:=Soma1(_cOrder)
			aSX3[_n][2]:=_cOrder
		EndIF
	Next

EndIf

//Item da Nota de Entrada
If upNFE
	aAdd(aSX3, {"SF1","D0","F1_L_TPNF ","C",001,0,"Tipo NF     ","Tipo NF     ","Tipo NF     ","Tipo NF","Tipo NF","Tipo NF","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","P=PRODUTOR;M=MUNICIPIO","P=PRODUTOR;M=MUNICIPIO","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SF1","D1","F1_L_MIX  ","C",006,0,"Mix       ","Mix       ","Mix       ","Mix  ","Mix  ","Mix","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SF1","D2","F1_L_SETOR","C",006,0,"Setor       ","Setor       ","Setor       ","Setor  ","Setor  ","Setor","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SF1","D3","F1_L_LINHA","C",006,0,"Linha       ","Linha       ","Linha       ","Linha  ","Linha  ","Linha","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"SF1","D4","F1_L_TRIBU","C",001,0,"Tributacao  ","Tributacao  ","Tributacao  ","Tipo tributacao produtor ","Tipo tributacao produtor ","Tipo tributacao produtor ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","A","R","€",'                            ',"I=Isento;T=Tributado;D=Diferido","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SF1","D5","F1_L_MENSG","M",010,0,"Mensagem NFe","Mensagem NFe","Mensagem NFe","Mensagem NFe","Mensagem NFe","Mensagem NFe","","","€€€€€€€€€€€€€€ ",""                 ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	_cOrder:=GLTOrdX3("SF1")
	//Preenche o array dos campos
	For _n:=1 to Len(aSX3)
		IF aSX3[_n][1] == "SF1"
			_cOrder:=Soma1(_cOrder)
			aSX3[_n][2]:=_cOrder
		EndIF
	Next

	aAdd(aSX3, {"SD1","M6","D1_L_SEEK ","C",050,0,"Seek GLT    ","Seek GLT    ","Seek GLT    ","Amarracao MIXxAcertoxFina","Amarracao MIXxAcertoxFina","Amarracao MIXxAcertoxFina","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SD1","M7","D1_L_DESCR","C",025,0,"Descricao NF","Descricao NF","Descricao NF","Descricao NF             ","Descricao NF             ","Descricao Nf             ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"SD1","M8","D1_L_EVENT","C",006,0,"Evento","Evento","Evento","Evento             ","Evento             ","Evento             ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})

	_cOrder:=GLTOrdX3("SD1")
	//Preenche o array dos campos
	For _n:=1 to Len(aSX3)
		IF aSX3[_n][1] == "SD1"
			_cOrder:=Soma1(_cOrder)
			aSX3[_n][2]:=_cOrder
		EndIF
	Next
EndIf

//Movimento Interno SD3
If upRecep
	aAdd(aSX3, {"SD3","81","D3_L_ORIG ","C",009,0,"Ticket      ","Ticket      ","Ticket      ","Ticket                    ","Ticket                  ","Ticket                    ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","","7","","","","","","",""})
	aAdd(aSX3, {"SD3","82","D3_L_SETOR","C",009,0,"Setor       ","Setor       ","Setor       ","Setor                     ","Setor                   ","Setor                     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","","7","","","","","","",""})

	_cOrder:=GLTOrdX3("SD3")
	//Preenche o array dos campos
	For _n:=1 to Len(aSX3)
		IF aSX3[_n][1] == "SD3"
			_cOrder:=Soma1(_cOrder)
			aSX3[_n][2]:=_cOrder
		EndIF
	Next
EndIf

//Cadastro de Motorista
If upMotor
	aAdd(aSX3, {"ZL0","01","ZL0_FILIAL","C",nTamFil,0,"Filial      ","Filial      ","Filial      ","Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,""                            ,"€€€€€€€€€€€€€€€","","",1," ","","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","02","ZL0_COD   ","C",006,0,"Codigo      ","Codigo      ","Codigo      ","Codigo do Motorista      ","Codigo do Motorista      ","Codigo do Motorista      ","@!"                   ,""                            ,"€€€€€€€€€€€€€€ ",'GetSxeNum("ZL0","ZL0_COD")',"",1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","03","ZL0_NOME  ","C",040,0,"Nome        ","Nome        ","Nome        ","Nome do Motorista        ","Nome do Motorista        ","Nome do Motorista        ","@!"                   ,""                            ,"€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","04","ZL0_CGC   ","C",014,0,"CPF         ","CPF         ","CPF         ","CPF do Motorista         ","CPF do Motorista         ","CPF do Motorista         ","@R 999.999.999-99"    ,"Vazio() .Or. CGC(M->ZL0_CGC)","€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","05","ZL0_CNH   ","C",011,0,"CNH         ","CNH         ","CNH         ","CNH do Motorista         ","CNH do Motorista         ","CNH do Motorista         ","@R 99999999999"       ,""                            ,"€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","06","ZL0_CATEG ","C",002,0,"Categoria   ","Categoria   ","Categoria   ","Categoria da CNH         ","Categoria da CNH         ","Categoria da CNH         ","@R AA"                ,""							   ,"€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","07","ZL0_VENCTO","D",008,0,"Vencimento  ","Vencimento  ","Vencimento  ","Vencimento da CNH        ","Vencimento da CNH        ","Vencimento da CNH        ","@!"                   ,""							   ,"€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","08","ZL0_RG    ","C",014,0,"RG          ","RG          ","RG          ","RG                       ","RG                       ","RG                       ","@!"                   ,""							   ,"€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","09","ZL0_EST   ","C",002,0,"Estado 		","Estado      ","Estado      ","Estado                   ","Estado                   ","Municipio               ","@!"                   ,""							   ,"€€€€€€€€€€€€€€ ","","12",1,"şÀ","","S","U","S","A","R","",'ExistCpo("SX5","12"+M->ZL0_EST)',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","10","ZL0_MUN   ","C",005,0,"Cod.Municip ","Cod.Municip ","Cod.Municip ","Cod.Municip              ","Cod.Municip              ","Cod.Municip              ","@!"                   ,""							   ,"€€€€€€€€€€€€€€ ","","ZL0_03",1,"şÀ","","S","U","N","A","R","",'ExistCpo("CC2",M->ZL0_EST+M->ZL0_CMUN)',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","11","ZL0_CMUN  ","C",035,0,"Municipio   ","Municipio   ","Municipio   ","Municipio                ","Municipio                ","Municipio                ","@!"                   ,""							   ,"€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","12","ZL0_CEP   ","C",008,0,"CEP    		","CEP         ","CEP         ","CEP                      ","CEP                      ","CEP                     ","@R 99999-999"         ,""							   ,"€€€€€€€€€€€€€€ ","","",1,"şÀ","","S","U","N","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","13","ZL0_END   ","C",030,0,"Endereco    ","Endereco    ","Endereco    ","Endereco                 ","Endereco                 ","Endereco                 ","@!"                   ,""							   ,"€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","14","ZL0_BAIRRO","C",020,0,"Bairro      ","Bairro      ","Bairro      ","Bairro                   ","Bairro                   ","Bairro                   ","@!"                   ,""							   ,"€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","",'',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","15","ZL0_FONE  ","C",020,0,"Fone        ","Fone        ","Fone        ","Fone                     ","Fone                     ","Fone                     ","@R 9999-9999/9999-9999",""							   ,"€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","16","ZL0_AGECOL","C",001,0,"Agente Colet","Agente Colet","Agente Colet","Agente de Coleta         ","Agente de Coleta         ","Agente de Coleta         ","@!"                   ,""							   ,"€€€€€€€€€€€€€€ ","'N'","",1,"şÀ","","","U","S","A","R","","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","17","ZL0_TREINA","C",002,0,"Treinado    ","Treinado    ","Treinado    ","Treinado                 ","Treinado                 ","Treinado                 ","@!"                   ,""							   ,"€€€€€€€€€€€€€€ ","'N'","",1,"şÀ","","","U","S","A","R","","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","18","ZL0_FRETIS","C",006,0,"Transportad.","Transportad.","Transportad.","Codigo do Transportador  ","Codigo do Transportador  ","Codigo do Transportador  ","@!"                   ,""							   ,"€€€€€€€€€€€€€€ ","","SA2_L1",1,"şÀ","","S","U","S","A","R","€",'ExistCpo("SA2",M->ZL0_FRETIS).And.SubStr(M->ZL0_FRETIS,1,1)=="T"',"","","","","","","","1","","","","","","",""}) //#LETRAS
	//aAdd(aSX3, {"ZL0","18","ZL0_FRETIS","C",nTamCod,0,"Transportad.","Transportad.","Transportad.","Codigo do Transportador  ","Codigo do Transportador  ","Codigo do Transportador  ","@!"                   ,""							   ,"€€€€€€€€€€€€€€ ","","SA2_L1",1,"şÀ","","S","U","S","A","R","€",'ExistCpo("SA2",M->ZL0_FRETIS).And.U_CGLT01A(M->ZL0_FRETIS)',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","19","ZL0_FRETLJ","C",nTamLj,0,"Loja Transp.","Loja Transp.","Loja Transp.","Loja do Transportador    ","Loja do Transportador    ","Loja do Transportador    ","@!"                   ,""                              ,"€€€€€€€€€€€€€€ ","",""      ,1,"şÀ","","S","U","S","V","R","€",'ExistCpo("SA2",M->ZL0_FRETIS+M->ZL0_FRETLJ)',"","","","","","","002","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","20","ZL0_NOMEFR","C",040,0,"Nome Transp.","Nome Transp.","Nome Transp.","Nome do Transportador    ","Nome do Transportador    ","Nome do Transportador    ","@!"                   ,""                              ,"€€€€€€€€€€€€€€ ","",""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","21","ZL0_MSBLQL","C",001,0,"Bloqueado?  ","Bloqueado?  ","Bloqueado?  ","Registro bloqueado       ","Registro bloqueado       ","Registro bloqueado       ","  "                   ,""                              ,"€€€€€€€€€€€€€€ ","'2'",""   ,1,"‚€","","","L","N","A","R","","","1=Sim;2=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL0","22","ZL0_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZL0","23","ZL0_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
EndIf

//Cadastro de Setor
If upSetor
	aAdd(aSX3, {"ZL2","01","ZL2_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZL2","02","ZL2_COD   ","C",006,0,"Codigo      ","Codigo"      ,"Codigo"      ,"Codigo Setor             ","Codigo do Setor          ","Codigo do Setor          ","@!"                   ,"","€€€€€€€€€€€€€€ ",'U_GETCODN("ZL2_COD")'      ,""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL2","03","ZL2_DESCRI","C",040,0,"Descricao   ","Descricao"   ,"Descricao"   ,"Descricao Setor          ","Descricao Steor          ","Descricao Setor          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€",'',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL2","04","ZL2_LOCAL ","C",002,0,"Armazem     ","Armazem"     ,"Armazem  "   ,"Armazem                  ","Armazem                  ","Armazem                  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL2","06","ZL2_TICKET","C",006,0,"Ticket      ","Ticket"      ,"Ticket   "   ,"Ticket                   ","Ticket                  ","Ticket                    ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL2","07","ZL2_ULTMIX","N",011,4,"Vlr.Ult.Mix ","Vlr.Ult.Mix ","Vlr.Ult.Mix ","Valor do Ultimo Mix      ","Valor do Ultimo Mix     ","Valor do Ultimo Mix       ","@E 99,999.9999"       ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL2","08","ZL2_SA2COD","C",nTamCod,0,"Fornecedor  ","Fornecedor  ","Fornecedor  ","Fornecedor da NF Municip.","Fornecedor da NF Municip.","Fornecedor da NF Municip.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"SA2_L5",1,"şÀ","","","U","S","V","R","",'EXISTCPO("SA2")',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL2","09","ZL2_SA2LJ ","C",nTamLj,0,"Loja        ","Loja        ","Fornecedor  ","Loja do Fornecedor       ","Loja do Fornecedor       ","Loja do Fornecedor       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","002","1","","","","","","",""})
	aAdd(aSX3, {"ZL2","10","ZL2_TES   ","C",003,0,"TES da NF   ","TES da NF   ","TES da NF   ","TES da NF do Municipio   ","TES da NF do Municipio   ","TES da NF do Municipio   ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"SF4"   ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL2","11","ZL2_MULTNF","C",001,0,"NF por Prod.","NF por Prd. ","NF por Prd. ","NF por Produtor          ","NF por Produtor          ","NF por Produtor          ","@!"                   ,"","€€€€€€€€€€€€€€ ",'"S"'                       ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
//	aAdd(aSX3, {"ZL2","12","ZL2_SERIE ","C",003,0,"Serie da NF ","Serie da NF ","Serie da NF ","Serie da NF              ","Serie da NF              ","Serie da NF              ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL2","12","ZL2_MSBLQL","C",001,0,"Bloqueado?  ","Bloqueado?  ","Bloqueado?  ","Registro bloqueado       ","Registro bloqueado       ","Registro bloqueado       ","  "                   ,""                              ,"€€€€€€€€€€€€€€ ","'2'",""   ,1,"‚€","","","L","N","A","R","","","1=Sim;2=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL2","13","ZL2_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZL2","14","ZL2_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
EndIf

//Cadastro de Grupo de Precos
//Remocao dos campos (comentados)
If upGrupo
	aAdd(aSX3, {"ZL3","01","ZL3_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZL3","02","ZL3_COD   ","C",006,0,"Codigo      ","Codigo"      ,"Codigo"      ,"Codigo                   ","Codigo                   ","Codigo                   ","@!"                   ,"","€€€€€€€€€€€€€€ ",'U_GETCODN("ZL3_COD")'      ,""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL3","03","ZL3_DESCRI","C",040,0,"Descricao   ","Descricao"   ,"Descricao"   ,"Descricao                ","Descricao                ","Descricao                ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	//aAdd(aSX3, {"ZL3","04","ZL3_FRETIS","C",nTamCod,0,"Transportad.","Transportad.","Transportad.","Codigo do Transportador  ","Codigo do Transportador  ","Codigo do Transportador  ",cPicCod              ,"","€€€€€€€€€€€€€€ ",""                          ,"SA2_L1",1,"şÀ","","S","U","S","A","R","€",'ExistCpo("SA2",M->ZL3_FRETIS).And.SubStr(M->ZL3_FRETIS,1,1)=="G"',"","","","","INCLUI","","001","1","","","","","","",""})
	//aAdd(aSX3, {"ZL3","05","ZL3_FRETLJ","C",nTamLj,0,"Loja Transp.","Loja Transp.","Loja Transp.","Loja do Transp.          ","Loja do Transp.          ","Loja do Transp.          ",cPicLj               ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","S","U","S","A","R","€",'ExistCpo("SA2",M->ZL3_FRETIS+M->ZL3_FRETLJ)',"","","","","INCLUI","","002","1","","","","","","",""})
	//aAdd(aSX3, {"ZL3","06","ZL3_NOMEFR","C",040,0,"Nome Transp.","Nome Transp.","Nome Transp.","Nome do Transp.          ","Nome do Transp.          ","Nome do Transp.          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	//aAdd(aSX3, {"ZL3","07","ZL3_VEICUL","C",006,0,"Veiculo     ","Veiculo"     ,"Veiculo"     ,"Veiculo                  ","Veiculo                  ","Veiculo                  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL4_02",1,"şÀ","","","U","S","A","R","€",'ExistCpo("ZL4",M->ZL3_VEICUL).and.U_ValFrtVei(M->ZL3_FRETIS,M->ZL3_FRETLJ,M->ZL3_VEICUL)',"","","","","","","","1","","","","","","",""})
	//aAdd(aSX3, {"ZL3","08","ZL3_TIPO  ","C",001,0,"Tipo        ","Tipo"        ,"Tipo"        ,"Tipo                     ","Tipo                     ","Tipo                     ","@!"                   ,"","€€€€€€€€€€€€€€ ","'L'"                        ,""      ,1,"şÀ","","","U","S","A","R","€","","L=Linha;R=Rota;P=Plataforma","","","","","","","1","","","","","","",""})
	//aAdd(aSX3, {"ZL3","09","ZL3_FRMPG ","C",001,0,"Forma Pag   ","Forma Pag"   ,"Forma Pag"   ,"Forma Pag                ","Forma Pag                ","Forma Pag                ","@!"                   ,"","€€€€€€€€€€€€€€ ","'L'"                       ,""      ,1,"şÀ","","","U","S","A","R","€","","L=Litro;K=KM","","","","","","","1","","","","","","",""})
	//aAdd(aSX3, {"ZL3","10","ZL3_VLRFRT","N",014,4,"Valor Frete ","Valor Frete" ,"Valor Frete" ,"Valor Frete              ","Valor Frete              ","Valor Pagamento          ","@E 9,999,999.9999   " ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","",'M->ZL3_TIPO!="P"',"","","1","","","","","","",""})
	//aAdd(aSX3, {"ZL3","11","ZL3_PCTPG ","N",014,2,"(%)Vlr Pag  ","(%)Vlr Pag"  ,"(%)Vlr Pag"  ,"Porcentagem do Vlr Pagto ","Porcentagem do Vlr Pagto ","Porcentagem do Vlr Pagto ","@E 99,999,999,999.99" ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,"şÀ","","","U","N","A","R","",'',"","","","",'M->ZL3_FRMPG=="L".AND.M->ZL3_TIPO!="P"',"","","1","","","","","","",""})
	aAdd(aSX3, {"ZL3","04","ZL3_SETOR ","C",006,0,"Setor       ","Setor       ","Setor       ","Setor da Rota/Linha      ","Setor da Rota/Linha      ","Setor da Rota/Linha      ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL2_01",1,"şÀ","","","U","S","A","R","€",'U_valSetor()',"","","","","INCLUI","","","1","","","","","","",""})
	//aAdd(aSX3, {"ZL3","13","ZL3_KM    ","N",014,0,"Km          ","Km          ","Km          ","Km da Linha              ","Km da Linha              ","Km da Linha              ","@E 99,999,999,999"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","",'M->ZL3_TIPO!="P"',"","","1","","","","","","",""})
	//aAdd(aSX3, {"ZL3","14","ZL3_PLATAF","C",001,0,"Plataforma  ","Plataforma  ","Plataforma  ","Leite entregue plataforma","Leite entregue plataforma","Leite entregue plataforma","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL3","05","ZL3_FILENT","C",nTamFil,0,"Filial Entrg","Filial Entrg","Filial Entrg","Filial de Entrega leite. ","Filial de Entrega leite. ","Filial de Entrega leite. ","@!"                   ,"","€€€€€€€€€€€€€€ ",""           		           ,"SM0",1,"şÀ","","","U","N","A","R","",'EXISTCPO("SM0",SM0->M0_CODIGO+M->ZL3_FILENT)',"","","","","","","","7","","","","","","",""})
	//aAdd(aSX3, {"ZL3","05","ZL3_FILENT","C",002,0,"Filial Entrg","Filial Entrg","Filial Entrg","Filial de Entrega leite. ","Filial de Entrega leite. ","Filial de Entrega leite. ","@!"                   ,""," ",xFilial("SF1")           ,"SM0",1,"şÀ","","","U","N","A","R","",'EXISTCPO("SM0",SM0->M0_CODIGO+M->ZL3_FILENT)',"","","","","","","","7","","","","","","",""})
	aAdd(aSX3, {"ZL3","06","ZL3_MSBLQL","C",001,0,"Bloqueado?  ","Bloqueado?  ","Bloqueado?  ","Registro bloqueado       ","Registro bloqueado       ","Registro bloqueado       ","  "                   ,"","€€€€€€€€€€€€€€ ","'2'"                       ,""   ,1,"‚€","","","L","N","A","R","","","1=Sim;2=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL3","07","ZL3_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,"","€€€€€€€€€€€€€€€",""   ,""                    ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZL3","08","ZL3_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,"","€€€€€€€€€€€€€€€",""   ,""                    ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})

    //FILIAL DE ENTREGA DA ROTA/LINHA
	aAdd(aSX3, {"ZLG","01","ZLG_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZLG","02","ZLG_COD   ","C",006,0,"Codigo      ","Codigo"      ,"Codigo"      ,"Codigo                   ","Codigo                   ","Codigo                   ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL3_01",1,"şÀ","","","U","S","V","R","€",'EXISTCPO("ZL3",XFILIAL("ZL3)+M->ZLG_COD")',"","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLG","03","ZLG_DESCRI","C",040,0,"Descricao   ","Descricao"   ,"Descricao"   ,"Descricao                ","Descricao                ","Descricao                ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLG","04","ZLG_FILENT","C",nTamFil,0,"Filial Entrg","Filial Entrg","Filial Entrg","Filial de Entrega leite. ","Filial de Entrega leite. ","Filial de Entrega leite. ","@!"                   ,"","€€€€€€€€€€€€€€ ",xFilial("SF1")            ,"SM0",1,"şÀ","","","U","N","A","R","",'EXISTCPO("SM0",SM0->M0_CODIGO+M->ZLG_FILENT)',"","","","","","","","7","","","","","","",""})
    aAdd(aSX3, {"ZLG","05","ZLG_VENCTO","D",008,0,"Vencimento  ","Vencimento  ","Vencimento  ","Vencimento Linha X Filial","Vencimento Linha X Filial","Vencimento Linha X Filial","@!"                   ,""							   ,"€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLG","06","ZLG_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLG","07","ZLG_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,""             ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
EndIf

//Cadastro de Veiculo
If upVeicu
	aAdd(aSX3, {"ZL4","01","ZL4_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZL4","02","ZL4_COD   ","C",006,0,"Codigo      ","Codigo"      ,"Codigo"      ,"Codigo do Veiculo        ","Codigo do Veiculo        ","Codigo do Veiculo        ","@!"                   ,"","€€€€€€€€€€€€€€ ",'GetSxeNum("ZL4","ZL4_COD")',""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL4","03","ZL4_MOTORI","C",006,0,"Motorista   ","Motorista"   ,"Motorista"   ,"Codigo do Motorista      ","Codigo do Motorista      ","Codigo do Motorista      ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL0_01",1,"şÀ","","S","U","S","A","R","€",'ExistCpo("ZL0",M->ZL4_MOTORI)',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL4","04","ZL4_NOME  ","C",040,0,"Nome        ","Nome"        ,"Nome"        ,"Nome do Motorista        ","Nome do Motorista        ","Nome do Motorista        ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL4","05","ZL4_PLACA ","C",007,0,"Placa       ","Placa"       ,"Placa"       ,"Placa do Veiculo         ","Placa do Veiculo         ","Placa do Veiculo         ","@R AAA-9999"          ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL4","06","ZL4_TIPO  ","C",001,0,"Tipo Veiculo","Tipo Veiculo","Tipo Veiculo","Tipo do Veiculo          ","Tipo do Veiculo          ","Tipo do Veiculo          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","T=Tanque;L=Latao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL4","07","ZL4_CAPACI","N",014,0,"Capacidade  ","Capacidade  ","Capacidade  ","Capacidade de Volume     ","Capacidade de Volume     ","Capacidade de Volume     ","@E 99,999,999,999"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL4","08","ZL4_MARCA ","C",001,0,"Marca Tanque","Marca Tanque","Marca Tanque","Marca do Tanque          ","Marca do Tanque          ","Marca do Tanque          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","1=Plurinox;2=Etscheid;3=Dec;4=Tecnox;5=Multinox;6=Motorque;7=Lider;8=Outros","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL4","09","ZL4_QTDDIV","C",001,0,"Qtd Divisoes","Qtd Divisoes","Qtd Divisoes","Quantidade de Divisoes   ","Quantidade de Divisoes   ","Quantidade de Divisoes   ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","1=Uma;2=Duas;3=Tres","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL4","10","ZL4_NSERIE","C",015,0,"Equipamento","Equipamento","Equipamento","Equipamento","Equipamento","Equipamento","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL4","11","ZL4_TPTANQ","C",001,0,"Dados Tanque","Dados Tanque","Dados Tanque","Dados sao do Tanque do?  ","Dados sao do Tanque do?  ","Dados sao do Tanque do?  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","V=Veiculo;R=Reboque","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL4","12","ZL4_PLCREB","C",007,0,"Placa Reboq ","Placa"       ,"Placa"       ,"Placa do Reboque         ","Placa do Reboque         ","Placa do Reboque         ","@R AAA-9999"          ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","",'M->ZL4_TPTANQ=="R"',"","","1","","","","","","",""})
	aAdd(aSX3, {"ZL4","13","ZL4_MSBLQL","C",001,0,"Bloqueado?  ","Bloqueado?  ","Bloqueado?  ","Registro bloqueado       ","Registro bloqueado       ","Registro bloqueado       ","  "                   ,""                              ,"€€€€€€€€€€€€€€ ","'2'",""   ,1,"‚€","","","L","N","A","R","","","1=Sim;2=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL4","14","ZL4_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZL4","15","ZL4_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
EndIf

//Grupo de Produtores
If upGrpPr
	aAdd(aSX3, {"ZL5","01","ZL5_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZL5","02","ZL5_COD   ","C",006,0,"Codigo      ","Codigo"      ,"Codigo"      ,"Codigo do grupo          ","Codigo do Grupo          ","Codigo do grupo          ","@!"                   ,"","€€€€€€€€€€€€€€ ",'GetSxeNum("ZL5","ZL5_COD")',""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL5","03","ZL5_DESCRI","C",040,0,"Descricao   ","Descricao"   ,"Descricao"   ,"Descricao do grupo       ","Descricao do grupo       ","Descricao do grupo       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
EndIf

//Prefixo do Evento
If upPreEv
	aAdd(aSX3, {"ZL6","01","ZL6_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZL6","02","ZL6_COD   ","C",003,0,"Codigo      ","Codigo"      ,"Codigo"      ,"Codigo do grupo          ","Codigo do Grupo          ","Codigo do grupo          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€",'ExistChav("ZL6",M->ZL6_COD,1)',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL6","03","ZL6_DESCRI","C",040,0,"Descricao   ","Descricao"   ,"Descricao"   ,"Descricao do grupo       ","Descricao do grupo       ","Descricao do grupo       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL6","04","ZL6_MSBLQL","C",001,0,"Bloqueado?  ","Bloqueado?  ","Bloqueado?  ","Registro bloqueado       ","Registro bloqueado       ","Registro bloqueado       ","  "                   ,""                              ,"€€€€€€€€€€€€€€ ","'2'",""   ,1,"‚€","","","L","N","A","R","","","1=Sim;2=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL6","05","ZL6_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZL6","06","ZL6_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
EndIf

//Grupos de Eventos do Leite
If upGrpEv
	aAdd(aSX3, {"ZL7","01","ZL7_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZL7","02","ZL7_COD   ","C",006,0,"Codigo      ","Codigo"      ,"Codigo"      ,"Codigo do grupo          ","Codigo do Grupo          ","Codigo do grupo          ","@!"                   ,"","€€€€€€€€€€€€€€ ",'GetSxeNum("ZL7","ZL7_COD")',""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL7","03","ZL7_DESCRI","C",040,0,"Descricao   ","Descricao"   ,"Descricao"   ,"Descricao do grupo       ","Descricao do grupo       ","Descricao do grupo       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL7","04","ZL7_NREDUZ","C",011,0,"Nome Redzido","Nome Redzido","Nome Redzido","Nome Reduzido            ","Nome Reduzido            ","Nome Redzido             ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL7","05","ZL7_MSBLQL","C",001,0,"Bloqueado?  ","Bloqueado?  ","Bloqueado?  ","Registro bloqueado       ","Registro bloqueado       ","Registro bloqueado       ","  "                   ,""                              ,"€€€€€€€€€€€€€€ ","'2'",""   ,1,"‚€","","","L","N","A","R","","","1=Sim;2=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL7","06","ZL7_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZL7","07","ZL7_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
EndIf

//Cadastro de Eventos do Leite
If upEvent
	aAdd(aSX3, {"ZL8","01","ZL8_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","02","ZL8_COD   ","C",006,0,"Codigo      ","Codigo"      ,"Codigo"      ,"Codigo do Evento         ","Codigo do Evento         ","Codigo do Evento         ","@!"                   ,"","€€€€€€€€€€€€€€ ",'GetSxeNum("ZL8","ZL8_COD")',""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","03","ZL8_DESCRI","C",040,0,"Descricao   ","Descricao"   ,"Descricao"   ,"Descricao do evento      ","Descricao do evento      ","Descricao do evento      ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","04","ZL8_TPEVEN","C",001,0,"Tipo        ","Tipo"        ,"Tipo"        ,"Tipo de evento           ","Tipo de Evento           ","Tipo de Evento           ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","L=Leite;F=Financeiro;A=Automatico;M=Mensagens;R=Redutor","","","","!ALTERA","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","05","ZL8_IMPNF ","C",001,0,"Imp NF      ","Imp. NF     ","Imp. NF     ","Imp. NF                  ","Imp NF                   ","Imp. NF                  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","06","ZL8_SB1COD","C",015,0,"Cod. Produto","Cod. Produto","Cod. Produto","Codigo do Produto.       ","Codigo do Produto.       ","Codigo do Produto.       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"SB1"   ,1,"şÀ","","","U","S","A","R","" ,'Vazio().or.ExistCpo("SB1",M->ZL8_SB1COD)',"","","","","INCLUI.AND.Empty(M->ZL8_PREFIX).AND.!ALTERA","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","07","ZL8_PREFIX","C",003,0,"Cod. Prefixo","Cod. Prefixo","Cod. Prefixo","Cod. do Prefixo do Titulo","Cod. do Prefixo do Titulo","Cod. do Prefixo do Titulo","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL6_01",1,"şÀ","","","U","S","A","R","" ,'Vazio().or.ExistCpo("ZL6",M->ZL8_PREFIX)',"","","","","INCLUI.AND.Empty(M->ZL8_SB1COD).AND.!ALTERA","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","08","ZL8_MIX   ","C",001,0,"Entra MIX?  ","Entra MIX?  ","Entra MIX?  ","Entra no MIX?            ","Entra no MIX?            ","Entra no MIX?            ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","09","ZL8_NREDUZ","C",010,0,"Nome Redzido","Nome Redzido","Nome Redzido","Nome Reduzido            ","Nome Reduzido            ","Nome Redzido             ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","10","ZL8_GRUPO ","C",010,0,"Grupo       ","Grupo       ","Grupo       ","Grupo do Evento          ","Grupo do Evento          ","Grupo do Evento          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL7_01",1,"şÀ","","","U","S","A","R","€","","","","","","!ALTERA","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","11","ZL8_DEBCRE","C",001,0,"Debit/Credit","Debit/Credit","Debit/Credit","Evento de Debito ou Cred.","Evento de Debito ou Cred.","Evento de Debito ou Cred.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","D=Debito;C=Credito","","","","!ALTERA","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","12","ZL8_CONDIC","C",250,0,"Condicao    ","Condicao    ","Condicao    ","Condicao p\ criar Evento.","Condicao p\ criar Evento.","Condicao p\ criar Evento.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","A370VerFor()","","","","","","","","2","","","","","","",""})
	aAdd(aSX3, {"ZL8","13","ZL8_FORMUL","C",250,0,"Formula     ","Formula     ","Formula     ","Formula p\ criar Evento. ","Formula p\ criar Evento. ","Formula p\ criar Evento. ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","A370VerFor()","","","","","","","","2","","","","","","",""})
	aAdd(aSX3, {"ZL8","14","ZL8_SITUAC","C",001,0,"Situacao B/D","Situacao B/D","Situacao B/D","Situacao B baixa D deleta","Situacao B baixa D deleta","Situacao B baixa D deleta","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","B=Baixa;D=Deleta","","","",'!ALTERA.AND.M->ZL8_TPEVEN$"FA"',"","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","15","ZL8_ALTERA","C",001,0,"Perm.Alterar","Perm.Alterar","Perm.Alterar","Permite Alterar no Mix   ","Permite Alterar no Mix   ","Permite Alterar no Mix   ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","16","ZL8_PRIORI","C",003,0,"Seq. Priorid","Seq. Priorid","Seq. Priorid","Sequencia de Prioridade. ","Sequencia de Prioridade. ","Sequencia de Prioridade. ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","" ,'ExistChav("ZL8",M->ZL8_PRIORI,4)',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","17","ZL8_VALOR ","N",011,4,"Valor Padrao","Valor Padrao","Valor Padrao","Valor Padrao             ","Valor Padrao             ","Valor Padrao             ","@E 99,999.9999"       ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","18","ZL8_PERTEN","C",001,0,"Pertence    ","Pertence    ","Pertence    ","Pertence                 ","Pertence                 ","Pertence                 ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","P=Produtor;E=Funcionários;G=Transp. Granel;T=Todos","","","","","","","1","","","","","","",""})//#LETRAS
	//aAdd(aSX3, {"ZL8","18","ZL8_PERTEN","C",001,0,"Pertence    ","Pertence    ","Pertence    ","Pertence                 ","Pertence                 ","Pertence                 ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","U_CGLT01B()","","","","","","","1","","","","","","",""}) //#LETRAS
	aAdd(aSX3, {"ZL8","19","ZL8_OBS   ","C",200,0,"Observacao  ","Observacao  ","Observacao  ","Observacao               ","Observacao               ","Observacao               ","@!"			          ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","20","ZL8_RECIBO","C",001,0,"Imp.Recibo  ","Imp.Recibo  ","Imp.Recibo  ","Imprime no Recibo        ","Imprime no Recibo        ","Imprime no Recibo        ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","21","ZL8_NATPRD","C",010,0,"Natureza Prd","Natureza Prd","Natureza Prd","Natureza do Produtor     ","Natureza do Produtor     ","Natureza do Produtor     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"SED   ",1,"şÀ","","","U","S","A","R","",'ExistCpo("SED")',"","","","",'M->ZL8_PERTEN=="P".OR.M->ZL8_PERTEN=="T"',"","","1","","","","","","",""}) //#LETRAS
	//aAdd(aSX3, {"ZL8","21","ZL8_NATPRD","C",010,0,"Natureza Prd","Natureza Prd","Natureza Prd","Natureza do Produtor     ","Natureza do Produtor     ","Natureza do Produtor     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"SED   ",1,"şÀ","","","U","S","A","R","",'ExistCpo("SED")',"","","","",'M->ZL8_PERTEN==U_GETRELA1("1","ZL1_PLEITE")',"","","1","","","","","","",""}) //#LETRAS
	aAdd(aSX3, {"ZL8","22","ZL8_NATFRT","C",010,0,"Natureza Frt","Natureza Frt","Natureza Frt","Natureza do Fretista     ","Natureza do Fretista     ","Natureza do Fretista     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"SED   ",1,"şÀ","","","U","S","A","R","",'ExistCpo("SED")',"","","","",'M->ZL8_PERTEN=="F".OR.M->ZL8_PERTEN=="T"',"","","1","","","","","","",""}) //##LETRAS
	//aAdd(aSX3, {"ZL8","22","ZL8_NATFRT","C",010,0,"Natureza Frt","Natureza Frt","Natureza Frt","Natureza do Fretista     ","Natureza do Fretista     ","Natureza do Fretista     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"SED   ",1,"şÀ","","","U","S","A","R","",'ExistCpo("SED")',"","","","",'M->ZL8_PERTEN==U_GETRELA1("1","ZL1_GRANEL")',"","","1","","","","","","",""}) //##LETRAS
	aAdd(aSX3, {"ZL8","23","ZL8_MSBLQL","C",001,0,"Bloqueado?  ","Bloqueado?  ","Bloqueado?  ","Registro bloqueado       ","Registro bloqueado       ","Registro bloqueado       ","  "                   ,"","€€€€€€€€€€€€€€ ","'2'"                       ,""      ,1,"‚€","","","L","N","A","R","","","1=Sim;2=Nao","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZL8","24","ZL8_GERNFC","C",001,0,"Gera NF Conv","Gera NF Conv","Gera NF Conv","Gera Titulo NF Convenio  ","Gera Titulo NF Convenio  ","Gera Titulo NF Convenio  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","3","","","","","","",""})
    aAdd(aSX3, {"ZL8","25","ZL8_CONVEN","C",001,0,"Convenio    ","Convenio    ","Convenio    ","Evento utilizado em conv.","Evento utilizado em conv.","Evento utilizado em conv.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","3","","","","","","",""})
//    aAdd(aSX3, {"ZL8","26","ZL8_RATEIO","C",001,0,"Existe Ratei","Existe Ratei","Existe Ratei","Existe rateio no evento  ","Existe rateio no evento  ","Existe rateio no evento  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","27","ZL8_BASINS","C",001,0,"Base INSS   ","Base INSS   ","Base INSS   ","Base INSS                ","Base INSS                ","Base INSS                ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZL8","28","ZL8_BASADI","C",001,0,"Base Adic. M","Base Adic. M","Base Adic. M","Base Adicional Mercado.  ","Base Adicional Mercado.  ","Base Adicional Mercado.  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","29","ZL8_SENAR ","C",001,0,"Base Senar  ","Base Senar  ","Base Senar  ","Base de calculo do SENAR ","Base de calculo do SENAR ","Base de calculo do SENAR ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","30","ZL8_SEST  ","C",001,0,"Base Sest   ","Base Sest   ","Base Sest   ","Base de calculo do SEST  ","Base de calculo do SEST  ","Base de calculo do SEST  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","31","ZL8_COFINS","C",001,0,"Base Cofins ","Base Cofins ","Base Cofins ","Base de calculo do COFINS","Base de calculo do COFINS","Base de calculo do COFINS","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","32","ZL8_PIS   ","C",001,0,"Base Pis    ","Base Pis    ","Base Pis    ","Base de calculo do PIS   ","Base de calculo do PIS   ","Base de calculo do PIS   ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","33","ZL8_INCENT","C",001,0,"Base Inc. Pr","Base Inc. Pr","Base Inc. Pr","Base Incentivo a Producao","Base Incentivo a Producao","Base Incentivo a Producao","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","34","ZL8_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
   	aAdd(aSX3, {"ZL8","35","ZL8_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL8","36","ZL8_PARCEL","N",002,0,"Qtd. Parcela","Qtd. Parcela","Qtd. Parcela","Qtd. Parcela Maxima 		","Qtd. Parcela Maxima 		","Qtd. Parcela Maxima 		  ","99"                  ,"","€€€€€€€€€€€€€€ ",""                   		 ,""    ,1,"şÀ","","","U","S","A","R","",'Positivo() .and. (M->ZL8_PARCEL > 0)',"","","","","","","","3","","","","","","",""})
	aAdd(aSX3, {"ZL8","37","ZL8_PGTFOR","N",002,0,"Dia Pgt.Forn","Dia Pgt.Forn","Dia Pgt.Forn","Dia pagamento fornecedor.","Dia pagamento fornecedor.","Dia pagamento fornecedor.","99"                  ,"","€€€€€€€€€€€€€€ ",""                   		 ,""    ,1,"şÀ","","","U","S","A","R","",'Positivo() .and. (M->ZL8_PGTFOR < 32)',"","","","","","","","3","","","","","","",""})
//	aAdd(aSX3, {"ZL8","38","ZL8_LIMITE","N",002,0,"Dia Limite  ","Dia Limite  ","Dia Limite  ","Dia Limite p/lcto.conveni","Dia Limite p/lcto.conveni","Dia Limite p/lcto.conveni","99"                  ,"","€€€€€€€€€€€€€€ ",""                   		 ,""    ,1,"şÀ","","","U","S","A","R","",'Positivo() .and. (M->ZL8_LIMITE < 32)',"","","","","","","","3","","","","","","",""})
	aAdd(aSX3, {"ZL8","39","ZL8_TIPOS" ,"C",008,0,"Tipos Fornec","Tipos Fornec","Tipos Fornec","Tipos Fornec. lib. p/conv.","Tipos Fornec. lib. p/conv.","Tipos Fornec. lib. p/conv.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                       ,""    ,1,"şÀ","","","U","S","A","R","","","","","","","","","","3","","","","","","",""})
	//aAdd(aSX3, {"ZL8","33","ZL8_MODEDI","C",001,0,"Evt. Manual ","Evt. Manual ","Evt. Manual ","Evento Manual p/ Fretista","Evento Manual p/ Fretista","Evento Manual p/ Fretista","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1,"şÀ","","","U","S","V","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	_cOrder:="00"
	//Preenche o array dos campos
	For _n:=1 to Len(aSX3)
		IF aSX3[_n][1] == "ZL8"
			_cOrder:=Soma1(_cOrder)
			aSX3[_n][2]:=_cOrder
		EndIF
	Next

EndIf

//Cadastro de Tipos de Faixa
If upTpAna
	aAdd(aSX3, {"ZL9","01","ZL9_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZL9","02","ZL9_COD   ","C",006,0,"Codigo      ","Codigo"      ,"Codigo"      ,"Codigo da Faixa          ","Codigo da Faixa          ","Codigo da Faixa          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","INCLUI","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL9","03","ZL9_DESCRI","C",040,0,"Descricao   ","Descricao"   ,"Descricao"   ,"Descricao Faixa          ","Descricao Faixa          ","Descricao Faixa          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL9","04","ZL9_TIPO  ","C",001,0,"Tipo        ","Tipo        ","Tipo        ","Tipo                     ","Tipo                     ","Tipo                     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","Q=Qualidade;O=Outros","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL9","05","ZL9_REFERE","C",020,0,"Referencia  ","Referencia  ","Referencia  ","Referencia Faixa         ","Referencia Faixa         ","Referencia Faixa         ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL9","06","ZL9_MEDIA ","C",001,0,"Media       ","Media       ","Media       ","Media                    ","Media                    ","Media                    ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","A=Aritmetica;G=Geometrica","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL9","07","ZL9_MSBLQL","C",001,0,"Bloqueado?  ","Bloqueado?  ","Bloqueado?  ","Registro bloqueado       ","Registro bloqueado       ","Registro bloqueado       ","  "                   ,""                              ,"€€€€€€€€€€€€€€ ","'2'",""   ,1,"‚€","","","L","N","A","R","","","1=Sim;2=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL9","08","ZL9_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZL9","09","ZL9_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
EndIf



// {"ZLA","10","ZLA_STEP ",	"N", 014,4,"Step   ","Step   ",	"Step   ",	"Step              ","Step              ","Step              ","@E 9,999,999.9999","","€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
// {"ZLA","11","ZLA_STEPOR ","C", 001,0,"Ordem Step  ",	"Ordem Step",	"Ordem Step",	"Ordenar Steps","Ordenar Steps","Ordenar Steps","@!","","€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","€","","C=Crescente;D=Decrescente","","","","","","","1","","","","","","",""})
// {"ZLA","12","ZLA_ACUMULA ","C",	001,0,"Acumula?   ",	"Acumula?", "Acumula?","Acumula Valores?", "Acumula Valores?",	"Acumula Valores?", "@!", "", "€€€€€€€€€€€€€€ ",	"", "",1,"şÀ","",	"", "U", "S","A", "R", "€",	"","S=Sim;N=Nao",	"","","","","","","1","","","","","","",""})



//Cadastro de Faixa de Indicacao
If upFxQua
	aAdd(aSX3, {"ZLA","01","ZLA_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZLA","02","ZLA_SETOR ","C",006,0,"Setor       ","Setor"       ,"Setor"       ,"Setor correspondente     ","Setor correspondente     ","Setor correspondente     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL2_01",1,"şÀ","","S","U","S","A","R","€",'u_valSetor()',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLA","03","ZLA_DCRSET","C",040,0,"Descr. Setor","Descr. Setor","Descr. Setor","Descricao do Setor       ","Descricao do Setor       ","Descricao do Setor       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLA","04","ZLA_COD   ","C",006,0,"Cod. Faixa  ","Cod. Faixa  ","Cod. Faixa  ","Codigo da Faixa          ","Codigo da Analise        ","Codigo da Analise        ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL9_01",1,"şÀ","","S","U","S","A","R","€",'ExistCpo("ZL9",M->ZLA_COD)',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLA","05","ZLA_DCRANA","C",040,0,"Desc Faixa  ","Desc Faixa  ","Desc Faixa  ","Descricao da Faixa       ","Descricao da Faixa       ","Descricao da Faixa       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLA","06","ZLA_SEQ   ","C",003,0,"Sequencia   ","Sequencia"   ,"Sequencia"   ,"Sequencia da Faixa       ","Sequencia da Faixa       ","Sequencia da Faixa       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLA","07","ZLA_VALOR ","N",010,5,"Valor       ","Valor       ","Valor       ","Valor                    ","Valor                    ","Valor                    ","@E 9,999.99999"        ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLA","08","ZLA_FXINI ","N",014,4,"Faixa Inicio","Faixa Inicio","Faixa Inicio","Faixa Inicial            ","Faixa Inicial            ","Faixa Inicial            ","@E 9,999,999.9999"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLA","09","ZLA_FXFIM ","N",014,4,"Faixa Fim   ","Faixa Fim   ","Faixa Fim   ","Faixa Final              ","Faixa Final              ","Faixa Final              ","@E 9,999,999.9999"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLA","10","ZLA_STEP ",	"N", 014,4,"Step   ","Step   ",	"Step   ",	"Step              ","Step              ","Step              ","@E 9,999,999.9999","","€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLA","11","ZLA_STEPOR ","C", 001,0,"Ordem Step  ",	"Ordem Step",	"Ordem Step",	"Ordenar Steps","Ordenar Steps","Ordenar Steps","@!","","€€€€€€€€€€€€€€ ","","",1,"şÀ","","","U","S","A","R","€","","C=Crescente;D=Decrescente","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLA","12","ZLA_ACUMULA ","C",	001,0,"Acumula?   ",	"Acumula?", "Acumula?","Acumula Valores?", "Acumula Valores?",	"Acumula Valores?", "@!", "", "€€€€€€€€€€€€€€ ",	"", "",1,"şÀ","",	"", "U", "S","A", "R", "€",	"","S=Sim;N=Nao",	"","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLA","13","ZLA_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
   aAdd(aSX3, {"ZLA","14","ZLA_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
EndIf

//Cadastro de Analise de Qualidade
If upAnali
	aAdd(aSX3, {"ZLB","01","ZLB_FILIAL","C",nTamFil,0,"Filial      ","Filial      ","Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"               ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZLB","02","ZLB_SETOR ","C",006,0,"Setor       ","Setor       ","Setor       ","Setor do Produtor        ","Setor do Produtor        ","Setor do Produtor        ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL2_01",1,"şÀ","","S","U","S","A","R","€",'u_valSetor()',"","","","","INCLUI","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLB","03","ZLB_DCRSET","C",040,0,"Descr. Setor","Descr. Setor","Descr. Setor","Descricao do Setor       ","Descricao do Setor       ","Descricao do Setor       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLB","04","ZLB_DATA  ","D",008,0,"Data        ","Data        ","Data        ","Data                     ","Data                     ","Data                     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","INCLUI","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLB","05","ZLB_LAUDO ","C",006,0,"Laudo       ","Laudo       ","Laudo       ","Laudo                    ","Laudo                    ","Laudo                    ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","N","A","R","","","","","","","INCLUI","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLB","06","ZLB_HORA  ","C",008,0,"Hora        ","Hora        ","Hora        ","Hora                     ","Hora                     ","Hora                     ","@R 99:99:99"          ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","N","A","R","",'(M->ZLB_HORA > "00:00:00") .AND. (M->ZLB_HORA <= "24:00:00")',"","","","","INCLUI","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLB","07","ZLB_ETIQTA","C",006,0,"Etiqueta    ","Etiqueta    ","Etiqueta    ","Etiqueta                 ","Etiqueta                 ","Etiqueta                 ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","N","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLB","08","ZLB_RETIRO","C",nTamCod,0,"Produtor    ","Produtor    ","Produtor    ","Produtor                 ","Produtor                 ","Produtor                 ",cPicCod            ,"","€€€€€€€€€€€€€€ ",""                          ,"SA2_L4",1,"şÀ","","S","U","S","A","R","€",'ExistCpo("SA2",M->ZLB_RETIRO)',"","","","","","","001","1","","","","","","",""})
	aAdd(aSX3, {"ZLB","09","ZLB_RETILJ","C",nTamLj,0,"Loja Retiro ","Loja        ","Loja        ","Loja do Produtor         ","Loja do Produtor         ","Loja do Produtor         ",cPicLj                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","S","U","S","A","R","€",'ExistCpo("SA2",M->ZLB_RETIRO+M->ZLB_RETILJ)',"","","","","","","002","1","","","","","","",""})
	aAdd(aSX3, {"ZLB","10","ZLB_DCRRET","C",040,0,"Descr Retiro","Descr. Setor","Descr. Setor","Descricao do Setor       ","Descricao do Setor       ","Descricao do Setor       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLB","11","ZLB_TIPOFX","C",006,0,"Tipo Faixa  ","Tipo Faixa  ","Tipo Faixa  ","Tipo de Faixa            ","Tipo de Faixa            ","Tipo da Faixa            ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL9_01",1,"şÀ","","S","U","S","A","R","€",'ExistCpo("ZL9",M->ZLB_TIPOFX)',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLB","12","ZLB_DCRTPF","C",020,0,"Descr Faixa ","Descr. Faixa","Descr. Faixa","Descricao da faixa       ","Descricao do Faixa       ","Descricao da Faixa       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLB","13","ZLB_VLRANA","N",014,4,"Valor Analis","Valor Analis","Valor Analis","Valor da Analise.        ","Valor da Analise.        ","Valor da Analise.        ","@E 9,999,999.9999"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLB","14","ZLB_DESQUA","C",001,0,"Desqualifica","Desqualifica","Desqualifica","Desqualifica Analise.    ","Desqualifica Analise.    ","Desqualifica Analise.    ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLB","15","ZLB_FILENT","C",nTamFil,0,"Filial Entrg","Filial Entrg","Filial Entrg","Filial de Entrega leite. ","Filial de Entrega leite. ","Filial de Entrega leite. ","@!"                   ,"","€€€€€€€€€€€€€€ ",xFilial("SF1")            ,"SM0",1,"şÀ","","","U","N","A","R","€",'EXISTCPO("SM0",SM0->M0_CODIGO+M->ZLB_FILENT)',"","","","","","","","7","","","","","","",""})
	aAdd(aSX3, {"ZLB","16","ZLB_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLB","17","ZLB_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
EndIf

//Cadastro de Desvio de Rota
If upRecep
	aAdd(aSX3, {"ZLC","01","ZLC_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZLC","02","ZLC_TICKET","C",006,0,"Ticket      ","Ticket"      ,"Ticket"      ,"Ticket      "             ,"Ticket             "      ,"Ticket              "     ,"@!"                   ,"","€€€€€€€€€€€€€€ ",'If(Funname()=="AGLT003",ZLD_TICKET,"")',"ZLD_01",1,"şÀ","","","U","S","A","R","€",' ',"","","","",'!(FUNNAME()=="AGLT003")',"","","1","","","","","","",""})
	aAdd(aSX3, {"ZLC","03","ZLC_DTCOLE","D",008,0,"Data Coleta ","Data Coleta" ,"Data Coleta ","Data da Coleta           ","Data da Coleta           ","Data da Coleta           ",""                   ,"","€€€€€€€€€€€€€€ ",'If(Funname()=="AGLT003",ZLD_DTCOLE,"")',""      ,1,"şÀ","","","U","S","A","R","€","","","","","",'!(FUNNAME()=="AGLT003")',"","","1","","","","","","",""})
	aAdd(aSX3, {"ZLC","04","ZLC_SETOR ","C",006,0,"Setor       ","Setor       ","Setor       ","Setor da Rota/Linha      ","Setor da Rota/Linha      ","Setor da Rota/Linha      ","@!"                   ,"","€€€€€€€€€€€€€€ ",'If(Funname()=="AGLT003",ZLD_SETOR,"")',"ZL2_01",1,"şÀ","","","U","S","A","R","€",'u_valSetor()',"","","","",'!(FUNNAME()=="AGLT003")',"","","1","","","","","","",""})
	aAdd(aSX3, {"ZLC","05","ZLC_LINROT","C",006,0,"Linha       ","Linha       ","Linha       ","Linha Rota da Recepcao   ","Linha Rota da Recepcao   ","Linha Rota da Recepcao   ","@!"                   ,"","€€€€€€€€€€€€€€ ",'If(Funname()=="AGLT003",ZLD_LINROT,"")',"ZL3_01",1,"şÀ","","","U","S","A","R","€",'Vazio() .or. ExistCpo("ZL3")',"","","","",'!(FUNNAME()=="AGLT003")',"","","1","","","","","","",""})
	aAdd(aSX3, {"ZLC","06","ZLC_FRETIS","C",nTamCod,0,"Transp.     ","Transp.     ","Transp.     ","Transportador            ","Transportador            ","Transportador            ",cPicCod              ,"","€€€€€€€€€€€€€€ ",'If(Funname()=="AGLT003",ZLD_FRETIS,"")',"SA2_L1",1,"şÀ","","S","U","S","A","R","€",'Vazio() .or. ExistCpo("SA2")',"","","","",'!(FUNNAME()=="AGLT003")',"","001","1","","","","","","",""})
	aAdd(aSX3, {"ZLC","07","ZLC_LJFRET","C",nTamLj,0,"Loja        ","Loja        ","Loja Transp.","Loja                     ","Loja                     ","Loja                     ",cPicLj                ,"","€€€€€€€€€€€€€€ ",'If(Funname()=="AGLT003",ZLD_LJFRET,"")',"      ",1,"şÀ","","","U","S","V","R","€",'',"","","","",'!(FUNNAME()=="AGLT003")',"","002","1","","","","","","",""})
	aAdd(aSX3, {"ZLC","08","ZLC_DCRFRT","C",040,0,"Nome        ","Nome        ","Nome        ","Nome                     ","Nome                     ","Nome                     ","@!"                   ,"","€€€€€€€€€€€€€€ ",'If(Funname()=="AGLT003",POSICIONE("SA2",1,xFILIAL("SA2")+ZLD->ZLD_FRETIS+ZLD->ZLD_LJFRET,"A2_NOME"),"")',"      ",1,"şÀ","","","U","S","V","R","€",'',"","","","",'!(FUNNAME()=="AGLT003")',"","","1","","","","","","",""})
	aAdd(aSX3, {"ZLC","09","ZLC_FORPAG","C",001,0,"Forma Pag   ","Forma Pag"   ,"Forma Pag"   ,"Forma Pag                ","Forma Pag                ","Forma Pag                ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","L=Litro;K=Km;F=Fixo","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLC","10","ZLC_QTD   ","N",014,2,"Quantidade  ","Quantidade " ,"Quantidade " ,"Quantidade               ","Quantidade               ","Quantidade               ","@E 99,999,999,999.99" ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLC","11","ZLC_VALOR ","N",014,2,"Valor Unit. ","Valor Unit." ,"Valor Unit." ,"Valor Unitario           ","Valor Unitario           ","Valor Unitario           ","@E 99,999,999,999.99" ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLC","12","ZLC_OBS   ","C",100,0,"Observacao  ","Observacao " ,"Observacao " ,"Observacao               ","Observacao               ","Observacao               ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLC","13","ZLC_FILENT","C",nTamFil,0,"Filial Entrg","Filial Entrg","Filial Entrg","Filial de Entrega leite. ","Filial de Entrega leite. ","Filial de Entrega leite. ","@!"                   ,"","€€€€€€€€€€€€€€ ",xFilial("SF1")                          ,"SM0"   ,1,"şÀ","","","U","N","A","R","€",'EXISTCPO("SM0",SM0->M0_CODIGO+M->ZLC_FILENT)',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLC","14","ZLC_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,"","€€€€€€€€€€€€€€€",""     ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLC","15","ZLC_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,"","€€€€€€€€€€€€€€€",""     ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLC","16","ZLC_CODZLH","C",003,0,"Codigo   ","Codigo      ","Codigo       ","Codigo                  ","Codigo                 ","Codigo                    ","999"                   ,"","€€€€€€€€€€€€€€ ","","ZLH_01",1,"şÀ","","","U","S","A","R","€",'',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLC","17","ZLC_DESZLH","C",030,0,"Descricao   ","Descricao "   ,"Descricao  ","Descricao                ","Descricao              ","Descricao                 ","@!"                   ,"","€€€€€€€€€€€€€€ ",""         ,"" ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLC","18","ZLC_STATUS","C",001,0,"Status Aprov","Status Aprov","Status Aprov","Status Aprovação         ","Status Aprovação       ","Status Aprovação          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""         ,"" ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})	
EndIf

//Cadastro Recepcao de Leite
If upRecep
	aAdd(aSX3, {"ZLD","01","ZLD_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
    aAdd(aSX3, {"ZLD","02","ZLD_ITEM  ","C",003,0,"Item        ","Item        ","Item        ","Item da Recepcao de Leite","Item da Recepcao de Leite","Item da Recepcao de Leite","@!"                   ,"","€€€€€€€€€€€€€€ ",""                         ,""      ,1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","03","ZLD_TICKET","C",006,0,"Ticket      ","Ticket"      ,"Ticket"      ,"Ticket      "             ,"Ticket             "      ,"Ticket              "     ,"@!"                   ,"","€€€€€€€€€€€€€€ ",'GETMV("LT_TICKET")'        ,""      ,1,"şÀ","","","U","S","V","R","€",' ',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","04","ZLD_DTCOLE","D",008,0,"Data Coleta ","Data Coleta" ,"Data Coleta ","Data da Coleta           ","Data da Coleta           ","Data da Coleta           ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","05","ZLD_DTLANC","D",008,0,"Data Lancto ","Data Lancto" ,"Data Lancto ","Data do Lancamento       ","Data do Lancamento       ","Data do Lancamento       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","06","ZLD_CODREC","C",006,0,"Cod. Rec.   ","Cod. Rec.  " ,"Cod. Rec,   ","Cod. Recebimento         ","Cod. Recebimento         ","Cod. Recebimento          ","@!"                   ,"","€€€€€€€€€€€€€€ ","                 "        ,""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","07","ZLD_SETOR ","C",006,0,"Setor       ","Setor       ","Setor       ","Setor da Rota/Linha      ","Setor da Rota/Linha      ","Setor da Rota/Linha      ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL2_01",1,"şÀ","","","U","S","A","R","€",'u_valSetor()',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","08","ZLD_LINROT","C",006,0,"Rota       ","Rota       ","Rota       ","Linha Rota da Recepcao   ","Linha Rota da Recepcao   ","Linha Rota da Recepcao   ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZLD_LI",1,"şÀ","","","U","S","A","R","€",'',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {'ZLD','09','ZLD_VERSAO','C',003,0,'Versao'		,'Versao'		,'Versao'	  ,'VersaodaRota'			  ,'VersaodaRota'			  ,'VersaodaRota'			  ,'@R999'				  ,'','€€€€€€€€€€€€€€ ',''							,''		 ,1 ,'şÀ','','','U','N','A','R','€' ,'','','','','','','','','1','','','','','','',''})
	aAdd(aSX3, {"ZLD","10","ZLD_DESLIN","C",040,0,"Desc. Linha ","Desc. Linha ","Desc. Linha ","Descricao da Linha       ","Descricao da Linha       ","Descricao da Linha       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
//	aAdd(aSX3, {"ZLD","11","ZLD_TP_RL ","C",001,0,"Tipo L/R    ","Tipo L/R    ","Tipo L/R    ","Tipo da Linha/Rota       ","Tipo da Linha/Rota       ","Tipo da Linha/Rota       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","A","R","",'                            ',"L=Linha;R=Rota","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","12","ZLD_RETIRO","C",nTamCod,0,"Produtor    ","Produtor    ","Produtor    ","Produtor                 ","Produtor                 ","Produtor                 ",cPicCod              ,"","€€€€€€€€€€€€€€ ",""                          ,"SA2_L8",1,"şÀ","","","U","S","A","R","€",'U_CHKRETIR()                ',"","","","","","","001","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","13","ZLD_RETILJ","C",nTamLJ,0,"Loja        ","Loja        ","Loja        ","Loja do Produtor         ","Loja Produtor            ","Loja do Produtor         ",cPicLj               ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","A","R","€",'U_CHKRETIR()                ',"","","","","","","002","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","14","ZLD_DCRRET","C",040,0,"Nome        ","Nome        ","Nome        ","Nome do Produtor         ","Nome do Produtor         ","Nome do Produtor         ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","15","ZLD_GRPRC ","C",006,0,"Grupo Preco       ","Grupo Preco       ","Grupo Preco       ","Grupo Preco       ","Grupo Preco       ","Grupo Preco       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL3_01",1,"şÀ","","","U","S","V","R","€",'',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","16","ZLD_QTDBOM","N",014,0,"Qtd LTE Prod","Qtd LTE Prod","Qtd LTE Prod","Qtde de Leite do Produtor","Qtde de Leite do Produtor","Qtde de Leite do Produtor","@E 99,999,999,999"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","S","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","16","ZLD_QTDH2O","N",014,0,"Qtd Agua","Qtd Agua","Qtd Agua","Qtde agua da crioscopia","Qtde agua da crioscopia","Qtde agua da crioscopia","@E 99,999,999,999"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","S","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","17","ZLD_FRETIS","C",nTamCod,0,"Transp.     ","Transp.     ","Transp.     ","Transportador            ","Transportador            ","Transportador            ",cPicCod                   ,"","€€€€€€€€€€€€€€ ",""                          ,"SA2_L1",1,"şÀ","","","U","S","A","R","€",'Vazio() .or. ExistCpo("SA2")',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","18","ZLD_LJFRET","C",nTamLJ,0,"Loja        ","Loja        ","Loja Fretist","Loja do Fretista         ","Loja do Fretista         ","Loja do Fretista         ",cPicLj                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","A","R","€",'                            ',"","","","","","","002","1","","","","","","",""})
//	aAdd(aSX3, {"ZLD","19","ZLD_NOTA","N",006,2,"Nota Transp","Nota Transp","Nota Transp","Nota Transp","Nota Transp","Nota Transp",															   "@E 999.99"                   ,""," ",""                          ,"",1,"şÀ","","","U","S","A","R","",'',"","","","","","","",cPast,"","","","","","",""})
	aAdd(aSX3, {"ZLD","20","ZLD_VEICUL","C",006,0,"Veiculo     ","Veiculo     ","Veiculo     ","Veiculo                  ","Veiculo                  ","Veiculo                  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"FOR   ",1,"şÀ","","","U","S","A","R","€",'Vazio() .or. ExistCpo("ZL4")',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","21","ZLD_MOTOR ","C",006,0,"Motorista   ","Motorista   ","Motorista   ","Motorista                ","Motorista                ","Motorista                ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL0_01",1,"şÀ","","","U","S","A","R","",'Vazio() .or. ExistCpo("ZL0") ',"","","","","","","","1","","","","","","",""})
//	aAdd(aSX3, {"ZLD","22","ZLD_QTDACI","N",014,0,"Qtde Lte Aci","Qtde Acido  ","Qtde Acido  ","Quantidade Leite Acido   ","Quantidade Leite Acido   ","Quantidade Leite Acido   ","@E 99,999,999,999"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","N","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","23","ZLD_STATUS","C",001,0,"Status      ","Status      ","Status      ","Status                   ","Status                   ","Status                   ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","24","ZLD_TOTBOM","N",014,0,"LTE Veiculo ","LTE Veiculo ","LTE Veiculo ","Qtde de Leite no Veiculo ","Qtde de Leite no Veiculo ","Qtde de Leite no Veiculo ","@E 99,999,999,999"    ,"","€€€€€€€€€€€€€€ ",""                   ,""      ,1,"şÀ","","","U","N","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","25","ZLD_TOTACI","N",014,0,"Dif.de Vol. ","Dif.de Vol. ","Dif.de Vol. ","Diferenca volume coletado","Diferenca volume coletado","Diferenca volume coletado","@E 99,999,999,999"    ,"","€€€€€€€€€€€€€€ ",""                   ,""      ,1,"şÀ","","","U","N","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","26","ZLD_TOTAL ","N",014,0,"Volume Veic.","Volume Veic.","Volume Veic.","Volume no Veiculo ","Volume no Veiculo ","Volume no Veiculo ","@E 99,999,999,999","","€€€€€€€€€€€€€€ ",""                                 ,""      ,1,"şÀ","","","U","N","A","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLD","27","ZLD_KM    ","N",014,0,"Total Km    ","Total KM    ","Total KM    ","Total KM                 ","Total KM                 ","Total KM                 ","@E 99,999,999,999,999","","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLD","28","ZLD_USER  ","C",015,0,"Usuario     ","Usuario     ","Usuario     ","Usuario                  ","Usuario                  ","Usuario                  ","@!"                   ,"","€€€€€€€€€€€€€€ ","U_UCFG001(2)"              ,"      ",1,"şÀ","","","U","S","R","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","29","ZLD_VFRELT","N",014,2,"Vr Fret Litr","Vr Fret Litr","Vr Fret Litr","Valor do frete por litro ","Valor do frete por litro ","Valor do frete por litro ","@E 99,999,999,999.99" ,"","€€€€€€€€€€€€€€ ",""                  ,""      ,1,"şÀ","","","U","N","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","30","ZLD_VFREPR","N",014,2,"Vr Fret Prod","Vr Fret Prod","Vr Fret Prod","Valor do frete por Produt","Valor do frete por Produto","Valor do frete por produt","@E 99,999,999,999.99" ,"","€€€€€€€€€€€€€€ ",""                 ,""      ,1,"şÀ","","","U","N","A","R","","","","","","","","","","1","","","","","","",""})
//	aAdd(aSX3, {"ZLD","31","ZLD_TQ_LT ","C",001,0,"Tanque/Latao","Tanque/Latao","Tanque/Latao","Tanque/Latao             ","Tanque/Latao             ","Tanque/Latao             ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                         ,""      ,1,"şÀ","","","U","N","A","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLD","32","ZLD_IMPORT","C",001,0,"Importado   ","Importado   ","Importado   ","Importado                ","Importado                ","Importado                ","  "                   ,"","€€€€€€€€€€€€€€€","'D'"   ,""   ,9,"şA","","","U","S","V","R","","","I=Importado;D=Digitado","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLD","33","ZLD_FILENT","C",nTamFil,0,"Filial Entrg","Filial Entrg","Filial Entrg","Filial de Entrega leite. ","Filial de Entrega leite. ","Filial de Entrega leite. ","@!"                   ,"","€€€€€€€€€€€€€€ ",xFilial("SF1")   ,"SM0",1,"şÀ","","","U","N","A","R","",'EXISTCPO("SM0",SM0->M0_CODIGO+M->ZLD_FILENT)',"","","","","","","","7","","","","","","",""})
	aAdd(aSX3, {"ZLD","34","ZLD_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,"","€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLD","35","ZLD_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,"","€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","36","ZLD_HORA  ","C",005,0,"Hora Coleta ","Hora Coleta ","Hora Coleta ","Hora da Coleta           ","Hora da Coleta           ","Hora da Coleta           ","@R 99:99"             ,"","€€€€€€€€€€€€€€ ",""                                 ,""      ,1,"şÀ","","","U","N","A","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLD","37","ZLD_TEMP  ","N",004,1,"Temperatura ","Temperatura ","Temperatura ","Temperatura da Coleta    ","Temperatura da Coleta    ","Temperatura da Coleta    ","@E 99.9"              ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLD","38","ZLD_REGUA ","N",005,1,"Regua       ","Regua       ","Regua       ","Regua                    ","Regua                    ","Regua                    ","@E 99.9"              ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLD","39","ZLD_TEMPCA","N",004,1,"Temperatura ","Temperatura ","Temperatura ","Temperatura no caminhao  ","Temperatura no caminhao  ","Temperatura no caminhao  ","@E 99.9"              ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLD","40","ZLD_TRIBUT","C",001,0,"Produto     ","Produto     ","Produto     ","Tipo tributacao produto  ","Tipo tributacao produto  ","Tipo tributacao produto  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","V","R","€",'',"I=Isento;T=Tributado;D=Diferido","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLD","41","ZLD_ROTCAB","C",006,0,"Linha       ","Linha       ","Linha       ","Linha Rota da Recepcao   ","Linha Rota da Recepcao   ","Linha Rota da Recepcao   ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZLD_RO",1,"şÀ","","","U","S","A","R","€",'',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLD","41","ZLD_DESCAB","C",040,0,"Desc. Linha ","Desc. Linha ","Desc. Linha ","Descricao da Linha       ","Descricao da Linha       ","Descricao da Linha       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})

	_cOrder:="00" //GLTOrdX3("SD3")
	//Preenche o array dos campos
	For _n:=1 to Len(aSX3)
		IF aSX3[_n][1] == "ZLD"
			_cOrder:=Soma1(_cOrder)
			aSX3[_n][2]:=_cOrder
		EndIF
	Next

EndIf


//Saldo do Incentivo a Producao
If upRecep
//	aAdd(aSX3, {"ZLX","01","ZLX_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
//	aAdd(aSX3, {"ZLX","02","ZLX_PRODUT","C",006,0,"Produtor    ","Produtor    ","Produtor    ","Produtor                 ","Produtor                 ","Produtor                 ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"SA2_L8",1,"şÀ","","","U","S","A","R","€",'',"","","","","","","","1","","","","","","",""})
//	aAdd(aSX3, {"ZLX","03","ZLX_DATA  ","D",008,0,"Data Saldo  ","Data Saldo " ,"Data Saldo  ","Data do Saldo Incentivo  ","Data do Saldo Incentivo  ","Data do Saldo Incentivo  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
// 	aAdd(aSX3, {"ZLX","04","ZLX_LITRAG","N",014,0,"Qtd LTE Prod","Qtd LTE Prod","Qtd LTE Prod","Qtde de Leite do Produtor","Qtde de Leite do Produtor","Qtde de Leite do Produtor","@E 99,999,999,999"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","S","U","S","A","R","","","","","","","","","","1","","","","","","",""})
//	aAdd(aSX3, {"ZLX","05","ZLX_FLAG  ","C",001,0,"Flag        ","Flag        ","Flag        ","Flag de Marcacao         ","Flag de Marcacao         ","Flag de Marcacao         ","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
EndIf


//Cdastro de ocorrencias do desvio de rotas.
If upRecep
	aAdd(aSX3, {"ZLH","01","ZLH_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZLH","02","ZLH_COD   ","C",003,0,"Codigo      ","Codigo      ","Codigo       ","Codigo                   ","Codigo                 ","Codigo                    ","999"                   ,"","€€€€€€€€€€€€€€ ",'GetSx8Num("ZLH","ZLH_COD")',""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLH","03","ZLH_DESCRI","C",030,0,"Descricao  ","Descricao "   ,"Descricao  ","Descricao                  ","Descricao              ","Descricao                 ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLH","04","ZLH_FINANC","C",001,0,"Altera Pgto.","Altera Pgto.","Altera Pgto.","Altera Pagamento           ","Altera Pagamento       ","Altera Pagamento         ","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLH","05","ZLH_FATOR" ,"C",001,0,"Acresc/Decr.","Acresc/Decr.","Acresc/Decr.","Acrescimo / Decrescimo       ","Acrescimo / Decrescimo  ","Acrescimo / Decrescimo   ","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1,"şÀ","","","U","S","A","R","€","","A=Acrescimo;D=Decrescimo","","","","","","","1","","","","","","",""})
	//aAdd(aSX3, {"ZLH","05","ZLH_FATOR" ,"C",001,0,"Acresc/Decr.","Acresc/Decr.","Acresc/Decr.","Acrescimo / Decrescimo       ","Acrescimo / Decrescimo  ","Acrescimo / Decrescimo   ","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1,"şÀ","","","U","S","A","R","€","","A=Acrescimo;D=Decrescimo","","","","","","","1","","","","","","",""})
EndIf


//Cabecalho do Mix do Leite
If upMix
	aAdd(aSX3, {"ZLE","01","ZLE_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZLE","02","ZLE_COD   ","C",006,0,"Codigo      ","Codigo"      ,"Codigo"      ,"Codigo do Mix            ","Codigo do Mix            ","Codigo do Mix            ","@!"                   ,"","€€€€€€€€€€€€€€ ",'GetSxeNum("ZLE","ZLE_COD")',""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLE","03","ZLE_VERSAO","C",001,0,"Versao      ","Versao      ","Versao      ","Versao MIX (Complemento).","Versao MIX (Complemento).","Versao MIX (Complemento).","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLE","04","ZLE_DTINI ","D",008,0,"Data Inicial","Data Inicial","Data Inicial","Data Inicial             ","Data Inicial             ","Data Inicial             ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLE","05","ZLE_DTFIM ","D",008,0,"Data Final  ","Data Final  ","Data Final  ","Data Final               ","Data Final               ","Data Final               ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLE","06","ZLE_STATUS","C",001,0,"Status      ","Status      ","Status      ","Status                   ","Status                   ","Status                   ",""                     ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","A=Aberto;P=Preparado;F=Fechado","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLE","07","ZLE_NFCOMP","C",012,0,"NF Complemen","NF Complemen","NF Complemen","Serie+Nro NF Complementar","Serie+Nro NF Complementar","Serie+Nro NF Complementar",""                     ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLE","08","ZLE_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLE","09","ZLE_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})

	//Itens do Mix do leite
	aAdd(aSX3, {"ZLF","01","ZLF_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","02","ZLF_CODZLE","C",006,0,"Codigo      ","Codigo"      ,"Codigo"      ,"Codigo do Mix            ","Codigo do Mix            ","Codigo do Mix            ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","03","ZLF_VERSAO","C",001,0,"Versao      ","Versao      ","Versao      ","Versao MIX (Complemento).","Versao MIX (Complemento).","Versao MIX (Complemento).","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","04","ZLF_DTINI ","D",008,0,"Dt Inicial  ","Dt Inicial"  ,"Dt Ini"      ,"Data Inicial             ","Data Inicial             ","Data Inicial             ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","05","ZLF_DTFIM ","D",008,0,"Dt Final    ","Dt Final  "  ,"Dt Fim"      ,"Data Final               ","Data Final               ","Data Inicial             ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","06","ZLF_SETOR ","C",006,0,"Cod.Setor   ","Cod.Set"     ,"Cod.Se"      ,"Codigo do Setor          ","Codigo do Setor          ","Codigo do Setor          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","07","ZLF_DCRSET","C",040,0,"Nome Setor  ","Nome Se"     ,"Nome S"      ,"Nome do Setor            ","Nome do Setor            ","Nome do Setor            ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLF","08","ZLF_RETIRO","C",nTamCod,0,"Cod. Retiro ","Cod.Produtor","Cod.Produtor","Codigo do Produtor       ","Codigo do Produtor       ","Codigo do Produtor       ",cPicCod             ,"","€€€€€€€€€€€€€€ ",""                          ,"SA2_L4",1,"şÀ","","","U","S","A","R","","ExistCpo('SA2',M->ZLF_RETIRO)","","","","","","","001","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","09","ZLF_RETILJ","C",nTamLj,0,"Loja Retiro ","Loja Prod.  ","Loja Prod.  ","Loja do Produtor         ","Loja do Produtor         ","Loja do Produtor         ",cPicLj               ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","ExistCpo('SA2',M->ZLF_RETIRO+M->ZLF_RETILJ)","","","","","","","002","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","10","ZLF_DCRRET","C",040,0,"Desc. Retiro","Desc. Prod. ","Desc. Prod. ","Descricao do Produtor    ","Descricao do Produtor    ","Descricao do Produtor    ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","11","ZLF_LINROT","C",006,0,"Cod.Rot/Lin ","Rot/Lin"     ,"Rot/Lin"     ,"Codigo Rota/Linha        ","Codigo Rota/Linha        ","Codigo Rota/Linha        ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","12","ZLF_TP_RL ","C",001,0,"Tipo L/R    ","Tipo L/R    ","Tipo L/R    ","Tipo da Linha/Rota       ","Tipo da Linha/Rota       ","Tipo da Linha/Rota       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","€","","L=Linha;R=Rota","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","13","ZLF_DCRLIN","C",040,0,"Nome Rot/Lin","N.RotLin"    ,"NRotLin"     ,"Nome Rota/Linha          ","Nome Rota/Linha          ","Nome Rota/Linha          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","14","ZLF_A2COD ","C",nTamCod,0,"Prod/Transp.","Prod/Transp.","Prod/Transp.","Produtor ou Transportador","Produtor ou Transportador","Produtor ou Transportador",cPicCod             ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","15","ZLF_A2LOJA","C",nTamLj,0,"Loja Prd/Trt","Loja Prd/Trt","Loja Prd/Trt","Loja Produtor/Transportad","Loja Produtor/Transportad","Loja Produtor/Transportad",cPicLj               ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","16","ZLF_A2NOME","C",040,0,"Nome Prd/Trt","Nome Prd/Trt","Nome Prd/Trt","Nome Produtor/Transportad","Nome Produtor/Transportad","Nome Produtor/Transportad","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	
	//aAdd(aSX3, {"ZLF","14","ZLF_RETIRO ","C",nTamCod,0,"Prod/Transp.","Prod/Transp.","Prod/Transp.","Produtor ou Transportador","Produtor ou Transportador","Produtor ou Transportador",cPicCod             ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	//aAdd(aSX3, {"ZLF","15","ZLF_RETILJ","C",nTamLj,0,"Loja Prd/Trt","Loja Prd/Trt","Loja Prd/Trt","Loja Produtor/Transportad","Loja Produtor/Transportad","Loja Produtor/Transportad",cPicLj               ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","002","1","","","","","","",""})
	//aAdd(aSX3, {"ZLF","16","ZLF_DCRRET","C",040,0,"Nome Prd/Trt","Nome Prd/Trt","Nome Prd/Trt","Nome Produtor/Transportad","Nome Produtor/Transportad","Nome Produtor/Transportad","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","17","ZLF_EVENTO","C",006,0,"Cod. Evento ","Cod. Evento" ,"Cod. Evento" ,"Codigo do Evento         ","Codigo do Evento         ","Codigo do Evento         ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL8_01",1,"şÀ","","S","U","S","V","R","","ExistCpo('ZL8') ","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","18","ZLF_SEQ   ","C",003,0,"Sequencia   ","Sequencia   ","Sequencia   ","Sequencia do cod. do MIX.","Sequencia do cod. do MIX.","Sequencia do cod. do MIX.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","19","ZLF_DCREVE","C",060,0,"Desc. Evento","Desc. Evento","Desc. Evento","Descricao do Evento      ","Descricao do Evento      ","Descricao do Evento      ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","20","ZLF_DEBCRE","C",001,0,"Debit/Credit","Debit/Credit","Debit/Credit","Evento de Debito ou Cred.","Evento de Debito ou Cred.","Evento de Debito ou Cred.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","€","","D=Debito;C=Credito","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","21","ZLF_QTDBOM","N",011,0,"Leite Bom   ","Leite Bom"   ,"LeitBom"     ,"Total Leite Bom          ","Total Leite Bom          ","Total Leite Bom          ","@E 999,999,999"       ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","22","ZLF_QTDACI","N",011,0,"Leite Acido ","Leite Aci"   ,"LeitAci"     ,"Total Leite Acido        ","Total Leite Acido        ","Total Leite Acido        ","@E 999,999,999"       ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","23","ZLF_VLRLTR","N",012,4,"Valor Litro ","Valor Litro ","Valor Litro ","Valor por litro de Leite ","Valor por litro de Leite ","Valor por litro de Leite ","@E 999,999.9999"      ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","24","ZLF_TOTAL ","N",014,2,"Valor Total ","Valor Total ","Valor Total ","Valor Total do Evento.   ","Valor Total do Evento.   ","Valor Total do Evento.   ","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLF","30","ZLF_SE1PRE","C",TamSx3("E1_PREFIXO")[1],0,"PrefixoSE1","PrefixoSE1","PrefixoSE1","Prefixo SE1  ","Prefixo SE1   ","Prefixo SE1  ","@!"                   ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLF","46","ZLF_SE1NUM","C",009,0,"Num.Titulo","Num.Titulo","Num.Titulo","Numero Titulo Financeiro","Numero Titulo Financeiro","Numero Titulo Financeiro",""    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLF","30","ZLF_SE1PAR","C",TamSx3("E1_PARCELA")[1],0,"Parcel.SE1","Parcel.SE1","Parcel.SE1","Parcela SE1  ","Parcela SE1   ","Parcela SE1  ","@!"                   ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLF","25","ZLF_SE1VLR","N",014,2,"Valor no SE1","Valor no SE1","Valor no SE1","Valor do titulo na SE1.  ","Valor do titulo na SE1.  ","Valor do titulo na SE1.  ","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLF","26","ZLF_SE1SLD","N",014,2,"Valor Saldo ","Valor Saldo ","Valor Saldo ","Saldo do tit. no fechmto.","Saldo do tit. no fechmto.","Saldo do tit. no fechmto.","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLF","27","ZLF_SE1JUR","N",014,2,"Valor Juros ","Valor Juros ","Valor Juros ","Valor dos Juros do Titulo","Valor dos Juros do Titulo","Valor dos Juros do Titulo","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","28","ZLF_VLRPAG","N",014,2,"Valor Pago  ","Valor Pago  ","Valor Pago  ","Valor Pago(Baixa Parcial)","Valor Pago(Baixa Parcial)","Valor Pago(Baixa Parcial)","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLF","29","ZLF_SE1VEN","D",008,0,"Vencto SE1  ","Vencto SE1  ","Vencto SE1  ","Vencimento no SE1.       ","Vencimento no SE1.       ","Vencimento no SE1.       ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLF","30","ZLF_SE1HIS","C",TamSx3("E1_HIST")[1],0,"Historic SE1","Historic SE1","Historic SE1","Historico do SE1.        ","Historico do SE1.        ","Historico do SE1.        ","@!"                   ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","31","ZLF_ORIGEM","C",001,0,"Origem      ","Origem"      ,"Origem"      ,"Origem do Lancamento     ","Origem do lancamento     ","Origem do lancamento     ",""                     ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","M=Mix;F=Fechamento;R=Frete;C=Complemento","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","32","ZLF_ACERTO","C",001,0,"Acerto Leite","Acerto Leite","Acerto Leite","Indica se realizou Acerto","Indica se realizou Acerto","Indica se realizou Acerto",""                     ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","33","ZLF_TP_MIX","C",001,0,"Tipo Mix    ","Tipo Mix    ","Tipo Mix    ","Tipo do Mix              ","Tipo do Mix              ","Tipo do Mix              ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","€","","L=Leite;F=Frete","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","34","ZLF_TIPO  ","C",001,0,"TP Leite/Fre","TP Leite/Fre","TP Leite/Fre","Tipo do Mix Leite/Frete  ","Tipo do Mix Leite/Fret.  ","Tipo do Mix Leite/Fret.  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","",""," ","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","35","ZLF_ENTMIX","C",001,0,"Entra no Mix","Entra no Mix","Entra no Mix","Entra no Mix             ","Entra no Mix             ","Entra no Mix             ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","36","ZLF_STATUS","C",001,0,"Status      ","Status      ","Status      ","Status                   ","Status do Mix            ","Status do Mix             ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","A=Aberto;F=Fechado","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","37","ZLF_L_SEEK","C",050,0,"Seek GLT    ","Seek GLT    ","Seek GLT    ","Amarracao MIXxAcertoxFina","Amarracao MIXxAcertoxFina","Amarracao MIXxAcertoxFina","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","38","ZLF_EST   ","C",002,0,"Estado      ","Estado    ","Estado    ","","","","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","39","ZLF_MUN   ","C",005,0,"Municipio   ","Municipio ","Municipio ","","","","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLF","40","ZLF_F1SEEK","C",002,0,"NF Seek     ","NF Seek   ","NF Seek   ","","","","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLF","41","ZLF_FILENT","C",nTamFil,0,"Filial Entrg","Filial Entrg","Filial Entrg","Filial de Entrega leite. ","Filial de Entrega leite. ","Filial de Entrega leite. ","@!"                   ,"","€€€€€€€€€€€€€€ ",xFilial("SF1")   ,"SM0",1,"şÀ","","","U","N","V","R","",'EXISTCPO("SM0",SM0->M0_CODIGO+M->ZLF_FILENT)',"","","","","","","","7","","","","","","",""})
	aAdd(aSX3, {"ZLF","42","ZLF_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLF","43","ZLF_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLF","44","ZLF_SE1ACR","N",014,2,"Valor Acresc","Valor Acresc","Valor Acresc","Vlr Acrescimo Financeiro.","Vlr Acrescimo Financeiro.","Vlr Acrescimo Financeiro.","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLF","45","ZLF_TRIBUT","C",001,0,"Tributacao  ","Tributacao  ","Tributacao  ","Tipo tributacao produtor ","Tipo tributacao produtor ","Tipo tributacao produtor ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","A","R","€",'                            ',"I=Isento;T=Tributado;D=Diferido","","","","","","","1","","","","","","",""})

	_cOrder:="00" //GLTOrdX3("SA1") 
	//Organiza a sequencia dos campos
	For _n:=1 to Len(aSX3)
		IF aSX3[_n][1] == "ZLF"
			_cOrder:=Soma1(_cOrder)
			aSX3[_n][2]:=_cOrder
		EndIF
	Next

EndIf

//Lancamento dos Parametros para Calculo de Frete
If upFret
	aAdd(aSX3, {"ZLI","01","ZLI_FILIAL","C",nTamFil,0,"Filial      ","Filial      ","Filial      ","Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                         ,""      ,1,"şÀ"  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZLI","02","ZLI_PERIOD","C",006,0,"Periodo","Periodo","Periodo","Periodo (AAAAMM)","Periodo (AAAAMM)","Periodo (AAAAMM)","@!"                   ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLI","03","ZLI_VLKM  ","N",006,4,"Km","Km","Km","Valor Km","Valor Km","Valor Km","@E 9.9999"    ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","A","R","€","","","","","",'',"","","1","","","","","","",""})
	aAdd(aSX3, {"ZLI","04","ZLI_VLVOL ","N",006,4,"Vol.","Vol.","Vol.","Valor/L","Valor/L","Valor/L","@E 9.9999"    ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","A","R","€","","","","","",'',"","","1","","","","","","",""})
	aAdd(aSX3, {"ZLI","05","ZLI_VLPT  ","N",006,4,"Ptos","Ptos","Ptos","Valor Ptos","Valor Ptos","Valor Ptos","@E 9.9999"    ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","A","R","€","","","","","",'',"","","1","","","","","","",""})
	aAdd(aSX3, {"ZLI","06","ZLI_VLRELP","N",006,4,"Rel Ptos","Rel Ptos","Rel Ptos","Valor Rel. Ptos.","Valor Rel. Ptos.","Valor Rel. Ptos.","@E 9.9999"    ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","A","R","€","","","","","",'',"","","1","","","","","","",""})

/*	aAdd(aSX3, {"ZLJ","01","ZLJ_FILIAL","C",nTamFil,0,"Filial      ","Filial      ","Filial      ","Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                         ,""      ,1,"şÀ"  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZLJ","02","ZLJ_PERIOD","C",006,0,"Periodo","Periodo","Periodo","Periodo (AAAAMM)","Periodo (AAAAMM)","Periodo (AAAAMM)","@!"                   ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLJ","03","ZLJ_FRETIS","C",nTamCod,0,"Transportad.","Transportad.","Transportad.","Codigo do Transportador  ","Codigo do Transportador  ","Codigo do Transportador  ",cPicCod              ,"","€€€€€€€€€€€€€€ ",""                          ,"SA2_L1",1	,"şÀ","","S","U","S","A","R","€",'ExistCpo("SA2",M->ZLJ_FRETIS).And.SubStr(M->ZLJ_FRETIS,1,1)=="G"',"","","","","INCLUI","","001","1","","","","","","",""})
	aAdd(aSX3, {"ZLJ","04","ZLJ_FRETLJ","C",nTamLj,0,"Loja Transp.","Loja Transp.","Loja Transp.","Loja do Transp.          ","Loja do Transp.          ","Loja do Transp.          ",cPicLj                ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1	,"şÀ","","S","U","S","A","R","€",'ExistCpo("SA2",M->ZLJ_FRETIS+M->ZLJ_FRETLJ)',"","","","","INCLUI","","002","1","","","","","","",""})
	aAdd(aSX3, {"ZLJ","05","ZLJ_VLNOTA","N",002,0,"Nota Transp.","Nota Transp.","Nota Transp.","Nota do Transportador","Nota do Transportador","Nota do Transportador","@E 99"    ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","A","R","€","","","","","",'',"","","1","","","","","","",""})
*/
EndIf

//Lancamento dos Convenios
If upConve
	aAdd(aSX3, {"ZLL","01","ZLL_FILIAL","C",nTamFil,0,"Filial      ","Filial      ","Filial      ","Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                         ,""      ,1,"şÀ"  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","02","ZLL_SEQ   ","C",003,0,"Sequencia   ","Sequencia   ","Sequencia   ","Sequencia                ","Sequencia                ","Sequencia                ","@!"                   ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","03","ZLL_COD   ","C",006,0,"Codigo      ","Codigo      ","Codigo      ","Codigo                   ","Codigo                   ","Codigo                   ","@!"                   ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","04","ZLL_DATA  ","D",008,0,"Data        ","Data        ","Data        ","Data                     ","Data                     ","Data                     ",""                     ,"","€€€€€€€€€€€€€€€",""                         ,""      ,1,"şÀ"  ,"","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","05","ZLL_VENCTO","D",008,0,"Vencto Prod.","Vencto Prod.","Vencto Prod.","Data de Vencto Produtor. ","Data de Vencto Produtor. ","Data de Vencto Produtor. ",""                     ,"","€€€€€€€€€€€€€€€",""                         ,""      ,1,"şÀ"  ,"","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","06","ZLL_VENCON","D",008,0,"Vencto Conv.","Vencto Conv.","Vencto Conv.","Data de Vencto Convenio. ","Data de Vencto Convenio. ","Data de Vencto Convenio. ",""                     ,"","€€€€€€€€€€€€€€€",""                         ,""      ,1,"şÀ"  ,"","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","07","ZLL_CONVEN","C",nTamCod,0,"Convenio    ","Convenio    ","Convenio    ","Convenio                 ","Convenio                 ","Convenio                 ",cPicCod             ,"","€€€€€€€€€€€€€€" ,""                         ,"SA2_L7",1,"şÀ"  ,"","","U","S","A","R","€",'EXISTCPO("SA2",M->ZLL_CONVEN)',"","","","","","","001","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","08","ZLL_LJCONV","C",nTamLj,0,"Loja Conv   ","Loja Conv   ","Loja Conv   ","Loja Convenio            ","Loja Convenio            ","Loja Convenio            ",cPicLj               ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","A","R","€","","","","","","","","002","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","09","ZLL_RETIRO","C",nTamCod,0,"Entidade    ","Entidade    ","Entidade    ","Produtor/Fretsta         ","Produtor/Fretista        ","Produtor/Fretista        ",cPicCod             ,"","€€€€€€€€€€€€€€" ,""                         ,"SA2_L6",1,"şÀ"  ,"","S","U","S","A","R","€",'EXISTCPO("SA2",M->ZLL_RETIRO)',"","","","",'',"","001","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","10","ZLL_RETILJ","C",nTamLj,0,"Loja        ","Loja        ","Loja        ","Loja                     ","Loja                     ","Loja                     ",cPicLj                ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","S","U","S","A","R","€",'EXISTCPO("SA2",M->ZLL_RETIRO+M->ZLL_RETILJ)',"","","","",'',"","002","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","11","ZLL_DCRRET","C",025,0,"Descricao   ","Descricao   ","Descricao   ","Descricao                ","Descricao                ","Descricao                ","@!"                   ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","12","ZLL_VALOR ","N",014,2,"Valor       ","Valor       ","Valor       ","Valor                    ","Valor                    ","Valor                    ","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","A","R","€","","","","","",'',"","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","13","ZLL_STATUS","C",001,0,"Status      ","Status      ","Status      ","Status                   ","Status                   ","Status                   ","@!"                   ,"","€€€€€€€€€€€€€€" ,'"A"'                      ,""      ,1,"şÀ"  ,"","","U","S","A","R","",'PERTENCE("AS")','A=Aberto;P=Pago;S=Suspenso',"","","",'ALTERA',"","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","14","ZLL_SETOR ","C",006,0,"Setor       ","Setor       ","Setor       ","Setor                    ","Setor                    ","Status                   ","@!"                   ,"","€€€€€€€€€€€€€€€",""                         ,"ZL2_01",1,"şÀ"  ,"","","U","S","A","R","",'u_valSetor()',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","15","ZLL_OBSERV","C",TamSx3("E1_HIST")[1],0,"Observacao  ","Observacao  ","Observacao  ","Observacao do Status     ","Observacao do Status     ","Observacao do Status     ","@!"  ,"","€€€€€€€€€€€€€€" ,""                         ,""      ,1,"şÀ"  ,"","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","16","ZLL_NATURE","C",010,0,"Natureza    ","Natureza    ","Natureza    ","Natureza                 ","Natureza                 ","Natureza                 ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"SED   ",1,"şÀ","","","U","S","A","R","",'ExistCpo("SED")',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","17","ZLL_EVENTO","C",006,0,"Evento      ","Evento      ","Evento      ","Evento                   ","Evento                   ","Evento                   ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL8_01",1,"şÀ","","","U","S","A","R","",'ExistCpo("ZL8")',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","18","ZLL_ACRESC","N",014,2,"Acrescimo   ","Acrescimo   ","Acrescimo   ","Acrescimo                ","Acrescimo                ","Acrescimo                ","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,""		,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","19","ZLL_TXADM ","N",014,2,"Taxa Adm.   ","Tx. Admin   ","Tx. Admin   ","Taxa Admin.              ","Taxa Admin.              ","Taxa Admin.              ","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,""		,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
//	aAdd(aSX3, {"ZLL","20","ZLL_FILENT","C",nTamFil,0,"Filial Entrg","Filial Entrg","Filial Entrg","Filial de Entrega leite. ","Filial de Entrega leite. ","Filial de Entrega leite. ","@!"                   ,"","€€€€€€€€€€€€€€ ",xFilial("SF1")             ,"SM0",1,"şÀ","","","U","N","A","R","",'EXISTCPO("SM0",SM0->M0_CODIGO+M->ZLL_FILENT)',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","21","ZLL_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,"","€€€€€€€€€€€€€€€",""   							,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLL","22","ZLL_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,"","€€€€€€€€€€€€€€€",""   							,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","23","ZLL_PARCEL","N",002,0,"Qtd.Parcelas","Qtd.Parcelas","Qtd.Parcelas","Qtd.Parcelas				  ","Qtd.Parcelas		  ","Qtd.Parcelas			  ","99"				 ,"","€€€€€€€€€€€€€€€","1"								,""	  ,1,"şA","","S","U","N","A",	"R","",'Positivo()',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","24","ZLL_TXPARC","N",004,2,"Taxa Parcela","Taxa Parcela","Taxa Parcela","Taxa Parcela				  ","Taxa Parcela		  ","Taxa Parcela			  ","@E 9.99"			 ,"","€€€€€€€€€€€€€€€",""								,""	  ,1,"şA","","","U","N","V","R","",'Positivo()',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","25","ZLL_VLRPAR","N",014,2,"Vlr. Parcela","Vlr. Parcela","Vlr. Parcela","Vlr. Parcela				  ","Vlr. Parcela		  ","Vlr. Parcela			  ","@E 99,999,999,999.99" ,"","€€€€€€€€€€€€€€€",""								,""	  ,1,"şA","","","U","N","V","R","",'Positivo()',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLL","26","ZLL_VLRTOT","N",014,2,"Vlr. Total	","Vlr. Total	","Vlr. Total	  ","Vlr. Total				  ","Vlr. Total			  ","Vlr. Total				  ","@E 99,999,999,999.99" ,"","€€€€€€€€€€€€€€€",""								,""	  ,1,"şA","","","U","N","V","R","",'Positivo()',"","","","","","","","1","","","","","","",""})
//	aAdd(aSX3, {"ZLL","27","ZLL_INSS"  ,"N",008,2,"Vlr.INSS Uni","Vlr.INSS Uni","Vlr.INSS Uni","Vlr.INSS Unimed  		  ","Vlr.INSS Unimed  		","Vlr.INSS Unimed  		  ","@E 99,999.99" ,"","€€€€€€€€€€€€€€€",""								,""	  ,5,"şA","","","U","N","V","R","",'Positivo()',"","","","","","","","1","","","","","","",""})		

	_cOrder:="00" //GLTOrdX3("SD3")
	//Preenche o array dos campos
	For _n:=1 to Len(aSX3)
		IF aSX3[_n][1] == "ZLL"
			_cOrder:=Soma1(_cOrder)
			aSX3[_n][2]:=_cOrder
		EndIF
	Next
EndIf

//Solicitacao de Emprestimo ao Produtor
If upEmpre
	aAdd(aSX3, {"ZLM","01","ZLM_FILIAL","C",nTamFil,0,"Filial      ","Filial      ","Filial      ","Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","02","ZLM_COD   ","C",009,0,"Codigo      ","Codigo"      ,"Codigo"      ,"Codigo                   ","Codigo                   ","Codigo                   ","@!"                   ,"","€€€€€€€€€€€€€€ ",'GETSXENUM("ZLM","ZLM_COD")',""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","03","ZLM_SA2COD","C",nTamCod,0,"Entidade    ","Entidade    ","Entidade    ","Produtor / Fretista      ","Produtor / Fretista      ","Produtor / Fretista      ",cPicCod             ,"","€€€€€€€€€€€€€€ ",""                          ,"SA2_L6",1,"şÀ","","S","U","S","A","R","€",'EXISTCPO("SA2",M->ZLM_SA2COD)',"","","","","","","001","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","04","ZLM_SA2LJ ","C",nTamLj,0,"Loja        ","Loja        ","Loja        ","Loja                     ","Loja                     ","Loja                     ",cPicLj               ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","S","U","S","V","R","€",'EXISTCPO("SA2",M->ZLM_SA2COD+M->ZLM_SA2LJ)',"","","","","","","002","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","05","ZLM_SA2NOM","C",040,0,"Nome        ","Nome        ","Nome        ","Nome                     ","Nome                     ","Nome                     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","S","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","06","ZLM_DATA  ","D",008,0,"Data        ","Data        ","Data        ","Data                     ","Data                     ","Data                     ",""                     ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","07","ZLM_OBS   ","C",025,0,"Observacao  ","Observacao  ","Observacao  ","Observacao               ","Observacao               ","Observacao               ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","" ,"","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","08","ZLM_VENCTO","D",008,0,"1o. Vencto  ","1o. Vencto  ","1o. Vencto  ","1o. Vencto               ","1o. Vencto               ","1o. Vencto               ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","S","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","09","ZLM_TOTAL ","N",014,2,"Valor Total ","Valor Total ","Valor Total ","Valor Total              ","Valor Total              ","Valor Total              ","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","S","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","10","ZLM_PARC  ","N",014,0,"Qtd Parcelas","Qtd Parcelas","Qtd Parcelas","Qtd Parcelas             ","Qtd Parcelas             ","Qtd Parcelas             ","@E 99,999,999,999"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","S","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","11","ZLM_JUROS ","N",014,6,"Juros(%)a.m.","Juros(%)a.m.","Juros(%)a.m.","Juros(%)a.m.             ","Juros(%)a.m.             ","Juros(%)a.m.             ","@E 99.999999"         ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","S","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","12","ZLM_VLRPAR","N",014,6,"Vlr.Parcela ","Vlr.Parcela ","Vlr.Parcela ","Vlr.Parcela              ","Vlr.Parcela              ","Vlr.Parcela              ","@E 999,999.99"	        ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","S","U","S","V","R","" ,"","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","13","ZLM_DTAPRO","D",008,0,"Dt.Avaliacao","Dt.Avaliacao","Dt.Avaliacao","Dt.Avaliacao             ","Dt.Avaliacao             ","Dt.Avaliacao             ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","S","U","S","V","R","" ,"","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","14","ZLM_STATUS","C",001,0,"Status      ","Status      ","Status      ","Status                   ","Status                   ","Status                   ","@!"                   ,"","€€€€€€€€€€€€€€ ",'"1"'                       ,""      ,1,"şÀ","","","U","S","V","R","","","1=Aberto;2=Aprovado;3=Reprovado;4=Efetivado","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","15","ZLM_USER  ","C",008,0,"Cod.Solicit.","Cod.Solicit.","Cod.Solicit.","Solicitante              ","Solicitante              ","Solicitante              ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","16","ZLM_NUSER ","C",025,0,"Solicitante ","Solicitante ","Solicitante ","Solicitante              ","Solicitante              ","Solicitante              ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","17","ZLM_USERAP","C",008,0,"Cod.Aprovad.","Cod.Aprovad.","Cod.Aprovad.","Aprovador                ","Aprovador                ","Aprovador                ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","18","ZLM_NUSEAP","C",025,0,"Aprovador   ","Aprovador   ","Aprovador   ","Aprovador                ","Aprovador                ","Aprovador                ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","19","ZLM_PAGTO ","N",014,2,"Vlr a Pagar ","Vlr a Pagar ","Vlr a Pagar ","Vlr a Pagar              ","Vlr a Pagar              ","Vlr a Pagar              ","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","20","ZLM_DTLIB ","D",008,0,"Referencia  ","Referencia  ","Referencia  ","Referencia               ","Referencia               ","Referencia               ",""                     ,"","€€€€€€€€€€€€€€ ","LASTDAY(DDATABASE)"                 ,""      ,1,"şÀ","","","U","N","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","21","ZLM_TIPO  ","C",001,0,"Tipo        ","Tipo        ","Tipo        ","Tipo do Emprestimo       ","Tipo do Emprestimo       ","Tipo do Emprestimo       ","@!"                   ,"","€€€€€€€€€€€€€€ ",'"E"'                       ,""      ,1,"şÀ","","","U","S","A","R","€","","A=Adiantamento;E=Emprestimo;C=Cota Capital;I=Incentivo","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLM","22","ZLM_SETOR ","C",006,0,"Setor       ","Setor       ","Setor       ","Setor                    ","Setor                    ","Setor                    ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL2_01",1,"şÀ","","","U","S","A","R","€",'u_valSetor()',"","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLM","23","ZLM_FLAG  ","C",002,0,"Flag        ","Flag        ","Flag        ","Flag de Marcacao         ","Flag de Marcacao         ","Flag de Marcacao         ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLM","24","ZLM_FILENT","C",nTamFil,0,"Filial Entrg","Filial Entrg","Filial Entrg","Filial de Entrega leite. ","Filial de Entrega leite. ","Filial de Entrega leite. ","@!"                   ,"","€€€€€€€€€€€€€€ ",""              ,"SM0",1,"şÀ","","","U","N","V","R","€",'EXISTCPO("SM0",SM0->M0_CODIGO+M->ZLM_FILENT)',"","","","","","","","7","","","","","","",""})
	aAdd(aSX3, {"ZLM","25","ZLM_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLM","26","ZLM_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})


	//Itens da Solicitacao de Emprestimo ao Produtor
	aAdd(aSX3, {"ZLO","01","ZLO_FILIAL","C",nTamFil,0,"Filial      ","Filial      ","Filial      ","Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZLO","02","ZLO_COD   ","C",009,0,"Codigo      ","Codigo"      ,"Codigo"      ,"Codigo                   ","Codigo                   ","Codigo                   ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLO","03","ZLO_ITEM  ","C",003,0,"Item        ","Item        ","Item        ","Item                     ","Item                     ","Produtor                 ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLO","04","ZLO_VECTO ","D",008,0,"Vencimento  ","Vencimento  ","Vencimento  ","Vencimento               ","Vencimento               ","Vencimento               ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLO","05","ZLO_VALOR ","N",014,2,"Valor       ","Valor Total ","Valor Total ","Valor Total              ","Valor Total              ","Valor Total              ","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLO","06","ZLO_FILENT","C",nTamFil,0,"Filial Entrg","Filial Entrg","Filial Entrg","Filial de Entrega leite. ","Filial de Entrega leite. ","Filial de Entrega leite. ","@!"                   ,"","€€€€€€€€€€€€€€ ",""            ,"SM0",1,"şÀ","","","U","N","A","R","",'EXISTCPO("SM0",SM0->M0_CODIGO+M->ZLO_FILENT)',"","","","","","","","7","","","","","","",""})
	aAdd(aSX3, {"ZLO","07","ZLO_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLO","08","ZLO_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
EndIf

//Acessos de Usuarios
If upUsuar
	aAdd(aSX3, {"ZLU","01","ZLU_FILIAL","C",nTamFil,0,"Filial      ","Filial      ","Filial      ","Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","03","ZLU_USER  ","C",025,0,"Usuario     ","Usuario     ","Usuario     ","Usuario                  ","Usuario                  ","Usuario                  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","04","ZLU_SETOR ","C",250,0,"Setores     ","Setores     ","Setores     ","Setores                  ","Setor                    ","Setor                    ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"U_F302",1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","05","ZLU_CODUSU","C",006,0,"Cod.Usuario ","Cod.Usuario ","Cod.Usuario ","Cod.Usuario              ","Cod.Usuario              ","Cod.Usuario              ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","06","ZLU_NOME  ","C",030,0,"Nome        ","Nome        ","Nome        ","Nome                     ","Nome                     ","Nome                     ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","07","ZLU_MATRIC","C",008,0,"Matricula   ","Matricula   ","Matricula   ","Matricula                ","Matricula                ","Matricula                ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,"şÀ","","","U","S","A","R"," ","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","08","ZLU_EMPSOL","C",001,0,"Soli.Emprest","Soli.Emprest","Soli.Emprest","Solicita Emprestimo      ","Solicita Emprestimo      ","Solicita Emprestimo      ","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1,"şÀ","","","U","S","A","R","","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","09","ZLU_EMPAPR","C",001,0,"Aprv.Emprest","Aprv.Emprest","Aprv.Emprest","Aprova Emprestimo        ","Aprova Emprestimo        ","Aprova Emprestimo        ","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1,"şÀ","","","U","S","A","R","","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","10","ZLU_EMPEFE","C",001,0,"Efet.Emprest","Efet.Emprest","Efet.Emprest","Efetiva Emprestimo       ","Efetiva Emprestimo       ","Efetiva Emprestimo       ","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1,"şÀ","","","U","S","A","R","","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","11","ZLU_ACERTO","C",001,0,"Acto Lte/Frt","Acto Lte/Frt","Acto Lte/Frt","Acerto Leite ou Frete ?  ","Acerto Leite ou Frete ?  ","Acerto Leite ou Frete ?  ","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1,"şÀ","","","U","S","A","R","","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","12","ZLU_CANCEL","C",001,0,"Cancela Act.","Cancela Act.","Cancela Act.","Cancela Acto. Leite/Frete","Cancela Acto. Leite/Frete","Cancela Acto. Leite/Frete","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1,"şÀ","","","U","S","A","R","","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","13","ZLU_GEREVE","C",001,0,"Gera Eventos","Gera Eventos","Gera Eventos","Gera Eventos do Mix      ","Gera Eventos do Mix      ","Gera Eventos do Mix      ","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1,"şÀ","","","U","S","A","R","","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","14","ZLU_APRMIX","C",001,0,"Aprova Mix  ","Aprova Mix  ","Aprova Mix  ","Aprova Valores do Mix    ","Aprova Valores do Mix    ","Aprova Valores do Mix    ","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1,"şÀ","","","U","S","A","R","","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","15","ZLU_NIVEL ","C",001,0,"Nivel       ","Nivel       ","Nivel       ","Nivel                    ","Nivel                    ","Nivel                    ","@!"                   ,"","€€€€€€€€€€€€€€€","'1'"                       ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","16","ZLU_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLU","17","ZLU_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,""                              ,"€€€€€€€€€€€€€€€",""   ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","18","ZLU_DESVRO","C",001,0,"Inclui Desv.","Inclui Desv.","Inclui Desv.","Inclui Desv.de Rotas     ","Inclui Desv.de rotas     ","Inclui Desv.de rotas     ","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1,"şÀ","","","U","S","A","R","","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","19","ZLU_APDESV","C",001,0,"Aprov.Desvio","Aprov.Desvio","Aprov.Desvio","Aprov.Desvio de Rotas    ","Aprov.Desvio de Rotas    ","Aprov.Desvio de Rotas    ","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1,"şÀ","","","U","S","A","R","","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLU","20","ZLU_CONVEN","C",001,0,"Uti.Convenio","Uti.Convenio","Uti.Convenio","Utiliza rotina convenios.","Utiliza rotina convenios.","Utiliza rotina convenios.","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1,"şÀ","","","U","S","A","R","","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})	
EndIf

//Cadastro de Tanques
If upTanq
    //Cabecalho
	aAdd(aSX3, {"ZLS","01","ZLS_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","","","","","","","",""})
	aAdd(aSX3, {"ZLS","02","ZLS_COD   ","C",006,0,"Codigo      ","Codigo      ","Codigo      ","Codigo                   ","Codigo                   ","Codigo                   ","@!"                   ,"","€€€€€€€€€€€€€€ ",'GETSXENUM("ZLS","ZLS_COD")',""      ,1,"şÀ","","","U","S","V","R","€",'ExistChav("ZLS",M->ZLS_COD,1) .AND. U_COMPZERO()',"","","","","","","","","","","","","","",""})
    aAdd(aSX3, {"ZLS","03","ZLS_DESCRI","C",040,0,"Descricao   ","Descricao   ","Descricao   ","Descricao                ","Descricao                ","Descricao                ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","","","","","","","",""})
	aAdd(aSX3, {"ZLS","04","ZLS_TPRES ","C",001,0,"Tipo TX Resf","Tipo TX Resf","Tipo TX Resf","Tipo de Taxa Resfriamento","Tipo de Taxa Resfriamento","Tipo de Taxa Resfriamento","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","S","A","R","","Pertence('VFN')","V=Por Volume;F=Valor Fixo;N=Nenhum","","","","","","","","","","","","","",""})
	aAdd(aSX3, {"ZLS","05","ZLS_TXRES ","N",014,2,"Vlr. TX Resf","Vlr. TX Resf","Vlr. TX Resf","Valor Taxa Resfriamento  ","Valor Taxa Resfriamento  ","Valor Taxa Resfriamento  ","@E 999,999,999.99"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","S","A","R","","","","","","","",'!M->ZLS_TPRES $ "V/N"',"","","","","","","","",""})
	aAdd(aSX3, {"ZLS","06","ZLS_TPFRT ","C",001,0,"Tipo TX Fret","Tipo TX Fret","Tipo TX Fret","Tipo de Taxa de Frete    ","Tipo de Taxa de Frete    ","Tipo de Taxa de Frete    ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","S","A","R","","Pertence('LKN')","L=Por Litro;K=Por KM;N=Nenhum","","","","","","","","","","","","","",""})
	aAdd(aSX3, {"ZLS","07","ZLS_TXFRT ","N",014,2,"Vlr. TX Fret","Vlr. TX Fret","Vlr. TX Fret","Valor da taxa de Frete.  ","Valor da taxa de Frete.  ","Valor da taxa de Frete.  ","@E 9,999,999.9999"    ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","S","A","R","","(M->ZLS_TPFRT$ 'L/K' .AND.M->ZLS_TXFRT>0).OR.(!M->ZLS_TPFRT $  'L/K' .AND. M->ZLS_TXFRT == 0)","","","","","",'!M->ZLS_TPFRT $ "V/N"',"","7","","","","","","",""})
    aAdd(aSX3, {"ZLS","08","ZLS_CLASTQ","C",001,0,"Classif.    ","Classif.    ","Classif.    ","Classificacao do Tanque  ","Classificacao do Tanque  ","Classificacao do Tanque  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","S","A","R","€","","I=Individual;C=Coletivo;U=Comunitario;P=Plataforma","","","","","INCLUI","","","","","","","","",""})
	aAdd(aSX3, {"ZLS","09","ZLS_ENTIDA","C",001,0,"Dono Tanque ","Dono Tanque ","Dono Tanque ","Dono do Tanque           ","Dono do Tanque           ","Dono do Tanque           ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","P=Produtor;L=Laticinio;A=Associacao;E=Prefeitura","","","","","INCLUI","","","","","","","","",""})
	aAdd(aSX3, {"ZLS","10","ZLS_TPRESF","C",001,0,"Resfriamento","Resfriamento","Resfriamento","Resfriamento do Tanque   ","Resfriamento do Tanque   ","Resfriamento do Tanque   ","@!"                   ,"","€€€€€€€€€€€€€€ ",'"E"'                       ,"",1,"şÀ","","","U","N","A","R","","","E=Expansao;I=Imersao;N=Nenhum","","","","","","","","","","","","","",""})
	aAdd(aSX3, {"ZLS","11","ZLS_MARCA ","C",002,0,"Marca Tanque","Marca Tanque","Marca Tanque","Marca do Tanque          ","Marca do Tanque          ","Marca do Tanque          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","01=Outros;02=Plurinox;03=Etscheid;04=Dec;05=Alfalaval;06=Congel;07=Boumatic;08=Imbras;09=Kepler;10=Delaval;11=DM;12=Westfalia","","","","","","","","","","","","","",""})
	aAdd(aSX3, {"ZLS","12","ZLS_CAPACI","N",014,0,"Capacidade  ","Capacidade  ","Capacidade  ","Capacidade de Volume     ","Capacidade de Volume     ","Capacidade de Volume     ","@E 99,999,999,999"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","","","","","","","",""})
	aAdd(aSX3, {"ZLS","13","ZLS_KM    ","N",014,0,"Km          ","Km          ","Km          ","Km da Linha              ","Km da Linha              ","Km da Linha              ","@E 99,999,999,999"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","",'',"","","","","","","","","",""})
	aAdd(aSX3, {"ZLS","14","ZLS_NUMSER","C",020,0,"Num de Serie","Num de Serie","Num de Serie","NUMERO DE SERIE DO TANQUE","NUMERO DE SERIE DO TANQUE","NUMERO DE SERIE DO TANQUE","@!"                   ,"","€€€€€€€€€€€€€€ ","" 		                    ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","","","","","","","",""})
	aAdd(aSX3, {"ZLS","15","ZLS_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,"","€€€€€€€€€€€€€€€",""     ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","","","","","","","",""})
    aAdd(aSX3, {"ZLS","16","ZLS_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,"","€€€€€€€€€€€€€€€",""     ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","","","","","","","",""})
    aAdd(aSX3, {"ZLS","17","ZLS_LCTANQ","C",030,0,"Local. Tanque","Local. Tanque","Local. Tanque","Localizacao do Tanque ","Localizacao do Tanque    ","Localizacao do Tanque    ","@!"                   ,"","€€€€€€€€€€€€€€ ","" 		                    ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","","","","","","","",""})

    //Item
	aAdd(aSX3, {"ZLT","01","ZLT_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","","","","","","","",""})
	aAdd(aSX3, {"ZLT","02","ZLT_COD   ","C",006,0,"Codigo      ","Codigo"      ,"Codigo"      ,"Codigo                   ","Codigo                   ","Codigo                   ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","","","","","","","","","","","","","","","","",""})
	aAdd(aSX3, {"ZLT","03","ZLT_SA2COD","C",nTamCod,0,"Participante","Participante","Participante","Participante do Tanque   ","Participante do Tanque   ","Participante do Tanque   ",cPicCod              ,"","€€€€€€€€€€€€€€ ",""                          ,"ZLT_01",1,"şÀ","","S","U","S","A","R","€","ExistCpo('SA2',M->ZLT_SA2COD).AND.U_VldProd(M->ZLS_COD,M->ZLT_SA2COD,GDFieldGet('ZLT_SA2LJ',n))","","","","","","","001","","","","","","","",""})
	aAdd(aSX3, {"ZLT","04","ZLT_SA2LJ ","C",nTamLj,0,"Loja Partic.","Loja Partic.","Loja Partic.","Loja do participante tanq","Loja do participante tanq","Loja do participante tanq",cPicLj               ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","S","U","S","A","R","€","ExistCpo('SA2',GDFieldGet('ZLT_SA2COD',n)+M->ZLT_SA2LJ).AND.U_VldProd(M->ZLS_COD,GDFieldGet('ZLT_SA2COD',n),M->ZLT_SA2LJ)","","","","","","","002","","","","","","","",""})
    aAdd(aSX3, {"ZLT","05","ZLT_SA2NOM","C",040,0,"Nome Partic.","Nome Partic.","Nome Partic.","Nome participante tanque.","Nome participante tanque.","Nome participante tanque.","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","V","R","€","","","","","","","","","","","","","","","",""})
    aAdd(aSX3, {"ZLT","06","ZLT_TITULA","C",001,0,"Titular     ","Titular     ","Titular     ","Produtor Titular do Tanq.","Produtor Titular do Tanq.","Produtor Titular do Tanq.","@!"                   ,"","€€€€€€€€€€€€€€ ",'"N"'                       ,"",1,"şÀ","","","U","N","A","R","€","Pertence('SN')","S=Sim;N=Nao","","","","","","","","","","","","","",""})
    aAdd(aSX3, {"ZLT","07","ZLT_LEITEI","C",001,0,"Leiteiro    ","Leiteiro    ","Leiteiro    ","Produtor Leiteiro do Tanq","Produtor Leiteiro do Tanq","Produtor Leiteiro do Tanq","@!"                   ,"","€€€€€€€€€€€€€€ ",'"N"'                       ,"",1,"şÀ","","","U","N","A","R","€","Pertence('SN')","S=Sim;N=Nao","","","","","","","","","","","","","",""})
	aAdd(aSX3, {"ZLT","08","ZLT_DESCRE","C",001,0,"Descta. Resf","Descta. Resf","Descta. Resf","Descta Taxa Resfriamento.","Descta Taxa Resfriamento.","Descta Taxa Resfriamento.","@!"                   ,"","€€€€€€€€€€€€€€ ",'"N"'                       ,"",1,"şÀ","","","U","N","A","R","€","Pertence('SN')","S=Sim;N=Nao","","","","","","","","","","","","","",""})
	aAdd(aSX3, {"ZLT","09","ZLT_DESCFR","C",001,0,"Descta. Fret","Descta. Fret","Descta. Fret","Descta Taxa Frete 1o Per.","Descta Taxa Frete 1o Per.","Descta Taxa Frete 1o Per.","@!"                   ,"","€€€€€€€€€€€€€€ ",'"N"'                       ,"",1,"şÀ","","","U","N","A","R","€","Pertence('SN')","S=Sim;N=Nao","","","","","","","","","","","","","",""})
	aAdd(aSX3, {"ZLT","10","ZLT_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,"","€€€€€€€€€€€€€€€",""     ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","","","","","","","",""})
    aAdd(aSX3, {"ZLT","11","ZLT_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,"","€€€€€€€€€€€€€€€",""     ,""   ,9,"şA","","","L","N","V","R","","","","","","","","","","","","","","","","",""})
EndIf

If upLinha
	aAdd(aSX3, {"ZLW","01","ZLW_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	//Cadastro de Rota
	aAdd(aSX3, {"ZLW","02","ZLW_COD   ","C",006,0,"Codigo      ","Codigo"      ,"Codigo"      ,"Codigo                   ","Codigo                   ","Codigo                   ","@!"                   ,"","€€€€€€€€€€€€€€ ",""      ,""      ,1	,"şÀ","","","U","S","A","R","€","","","","","","INCLUI","","","1","","","","","","",""})
	aAdd(aSX3, {'ZLW','03','ZLW_VERSAO','C',003,0,'Versao'		,'Versao'		,'Versao'	  ,'VersaodaRota'			  ,'VersaodaRota'			  ,'VersaodaRota'			  ,'@R999'				    ,'','€€€€€€€€€€€€€€ ','001'						  ,''		,1 ,'şÀ','','','U','N','V','R','€' ,'','','','','','','','','1','','','','','','',''})
	aAdd(aSX3, {"ZLW","04","ZLW_DESCRI","C",040,0,"Descricao   ","Descricao"   ,"Descricao"   ,"Descricao                ","Descricao                ","Descricao                ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1	,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLW","05","ZLW_FRETIS","C",nTamCod,0,"Transportad.","Transportad.","Transportad.","Codigo do Transportador  ","Codigo do Transportador  ","Codigo do Transportador  ",cPicCod              ,"","€€€€€€€€€€€€€€ ",""                          ,"SA2_L1",1	,"şÀ","","S","U","S","A","R","€",'ExistCpo("SA2",M->ZLW_FRETIS).And.SubStr(M->ZLW_FRETIS,1,1)=="T"',"","","","","INCLUI","","001","1","","","","","","",""}) //#LETRAS
//	aAdd(aSX3, {"ZLW","05","ZLW_FRETIS","C",nTamCod,0,"Transportad.","Transportad.","Transportad.","Codigo do Transportador  ","Codigo do Transportador  ","Codigo do Transportador  ",cPicCod              ,"","€€€€€€€€€€€€€€ ",""                          ,"SA2_L1",1	,"şÀ","","S","U","S","A","R","€",'ExistCpo("SA2",M->ZLW_FRETIS).And.U_CGLT01A(M->ZLW_FRETIS)',"","","","","INCLUI","","001","1","","","","","","",""}) //#LETRAS
	aAdd(aSX3, {"ZLW","06","ZLW_FRETLJ","C",nTamLj,0,"Loja Transp.","Loja Transp.","Loja Transp.","Loja do Transp.          ","Loja do Transp.          ","Loja do Transp.          ",cPicLj                ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1	,"şÀ","","S","U","S","A","R","€",'ExistCpo("SA2",M->ZLW_FRETIS+M->ZLW_FRETLJ)',"","","","","INCLUI","","002","1","","","","","","",""})
	aAdd(aSX3, {"ZLW","07","ZLW_NOMEFR","C",040,0,"Nome Transp.","Nome Transp.","Nome Transp.","Nome do Transp.          ","Nome do Transp.          ","Nome do Transp.          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1	,"şÀ","","","U","S","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLW","08","ZLW_VEICUL","C",006,0,"Veiculo     ","Veiculo"     ,"Veiculo"     ,"Veiculo                  ","Veiculo                  ","Veiculo                  ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL4_03",1	,"şÀ","","","U","S","A","R","€",'ExistCpo("ZL4",M->ZLW_VEICUL).and.U_ValFrtVei(M->ZLW_FRETIS,M->ZLW_FRETLJ,M->ZLW_VEICUL)',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLW","09","ZLW_TIPO  ","C",001,0,"Tipo        ","Tipo"        ,"Tipo"        ,"Tipo                     ","Tipo                     ","Tipo                     ","@!"                   ,"","€€€€€€€€€€€€€€ ","'L'"                        ,""      ,1,"şÀ","","","U","S","A","R","€","","L=Linha;R=Rota;P=Plataforma","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLW","10","ZLW_FRMPG ","C",001,0,"Forma Pag   ","Forma Pag"   ,"Forma Pag"   ,"Forma Pag                ","Forma Pag                ","Forma Pag                ","@!"                   ,"","€€€€€€€€€€€€€€ ","'L'"                       ,""      ,1	,"şÀ","","","U","S","A","R","€","","L=Litro;K=KM","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLW","11","ZLW_VLRFRT","N",014,4,"Valor Frete ","Valor Frete" ,"Valor Frete" ,"Valor Frete              ","Valor Frete              ","Valor Pagamento          ","@E 9,999,999.9999   " ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1		,"şÀ","","","U","S","A","R","","","","","","",'M->ZLW_TIPO!="P"',"","","1","","","","","","",""})
	aAdd(aSX3, {"ZLW","12","ZLW_PCTPG ","N",014,2,"(%)Vlr Pag  ","(%)Vlr Pag"  ,"(%)Vlr Pag"  ,"Porcentagem do Vlr Pagto ","Porcentagem do Vlr Pagto ","Porcentagem do Vlr Pagto ","@E 99,999,999,999.99" ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1		,"şÀ","","","U","N","A","R","",'',"","","","",'M->ZLW_FRMPG=="L".AND.M->ZLW_TIPO!="P"',"","","1","","","","","","",""})
	aAdd(aSX3, {"ZLW","13","ZLW_SETOR ","C",006,0,"Setor       ","Setor       ","Setor       ","Setor da Rota/Linha      ","Setor da Rota/Linha      ","Setor da Rota/Linha      ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZL2_01"	,1	,"şÀ","","","U","S","A","R","€",'U_valSetor()',"","","","","INCLUI","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLW","14","ZLW_KM    ","N",014,0,"Km          ","Km          ","Km          ","Km da Linha              ","Km da Linha              ","Km da Linha              ","@E 99,999,999,999"    ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1		,"şÀ","","","U","S","A","R","","","","","","",'M->ZLW_TIPO!="P"',"","","1","","","","","","",""})
	aAdd(aSX3, {"ZLW","15","ZLW_PLATAF","C",001,0,"Plataforma  ","Plataforma  ","Plataforma  ","Leite entregue plataforma","Leite entregue plataforma","Leite entregue plataforma","@!"                   ,"","€€€€€€€€€€€€€€ ","'N'"                       ,""      ,1	,"şÀ","","","U","S","A","R","€","","S=Sim;N=Nao","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLW","16","ZLW_DIAPI","C",001,0,"Dia Coleta"	,"Dia Coleta"	,"Dia Coleta","Dia de coleta do leite "	,"Dia de coleta do leite "	,"Dia de coleta do leite "	,"@!"                   ,"","?????????????? ",""             				," ",1			,"şÀ","","","U","N","A","R",'€' ,'',"1=Ambos;2=Pares;3=Impares","","","","","","","7","","","","","","",""})
	aAdd(aSX3, {'ZLW','17','ZLW_DATINI','D',008,0,'Dat Inicial'	,'DataInicial'	,'DataInicial','DataInicialdaRota'		  ,'DataInicialdaRota'		  ,'DataInicialdaRota'		  ,''					  ,'','€€€€€€€€€€€€€€ ',''	 ,''					,0,'şÀ','','','U','S','A','R','€','','','','','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZLW','18','ZLW_DATFIM','D',008,0,'Dat Final'	,'DataFinal'	,'DataFinal'  ,'DataFinaldaRota'		  ,'DataFinaldaRota'		  ,'DataFinaldaRota'		  ,''					  ,'','€€€€€€€€€€€€€€ ',''	 ,''					,0             ,'şÀ','','','U','S','A','R','','U_DatLInha(M->ZLW_DATINI, M->ZLW_DATFIM,.T.)','','','','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZLW','19','ZLW_HRPRSA','C',005,0,'Hor Prv Saida'	,'HoraPrvSaida'	,'HoraPrvSaida','HoraPrevistadeSaida'	  ,'HoraPrevistadeSaida'	  ,'HoraPrevistadeSaida'	  ,'@E 99:99'					  ,'','€€€€€€€€€€€€€€ ',''	 ,''					,0,'şÀ','','','U','N','A','R','€' ,'','','','','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZLW','20','ZLW_HRPRCH','C',005,0,'Hor Prv Chegada'	,'HoraPrvCheg'	,'HoraPrvCheg','HoraprevistadeChegada'	  ,'HoraprevistadeChegada'	  ,'HoraprevistadeChegada'	  ,'@E 99:99'					  ,'','€€€€€€€€€€€€€€ ',''	 ,''				,0 ,'şÀ','','','U','N','A','R','€' ,'U_DatLinha(M->ZLW_HRPRSA,M->ZLW_HRPRCH,.F.)','','','','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZLW','21','ZLW_VLMPR' ,'N',008,2,'Vol Previst'	,'Vol Previst'	,'Vol Previso','Volume previsto'		  ,'Volume previsto'		  ,'Volume previsto','@E 99,999.99'					  ,'','€€€€€€€€€€€€€€ ',''	 ,''								,0,'şÀ','','','U','N','A','R','€' ,'','','','','','','','','','','','','','N','N',''})
	aAdd(aSX3, {"ZLW","22","ZLW_MSBLQL","C",001,0,"Bloqueado?  ","Bloqueado?  ","Bloqueado?  ","Registro bloqueado       ","Registro bloqueado       ","Registro bloqueado       ","  "                   ,"","€€€€€€€€€€€€€€ ","'2'"                       ,""   ,1,		"‚€" ,"","","L","N","A","R","","","1=Sim;2=Nao","","","","ZLW->ZLW_MSBLQL <> '1'","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLW","23","ZLW_USERGI","C",017,0,"Log de Inclu","Log de Inclu","Log de Inclu","Log de Inclusao          ","Log de Inclusao          ","Log de Inclusao          ","  "                   ,"","€€€€€€€€€€€€€€€",""   ,""                    ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZLW","24","ZLW_USERGA","C",017,0,"Log de Alter","Log de Alter","Log de Alter","Log de Alteracao         ","Log de Alteracao         ","Log de Alteracao         ","  "                   ,"","€€€€€€€€€€€€€€€",""   ,""                    ,9,"şA","","","L","N","V","R","","","","","","","","","","1","","","","","","",""})

	_cOrder:="00" //GLTOrdX3("SD3")
	//Preenche o array dos campos
	For _n:=1 to Len(aSX3)
		IF aSX3[_n][1] == "ZLW"
			_cOrder:=Soma1(_cOrder)
			aSX3[_n][2]:=_cOrder
		EndIF
	Next

	aAdd(aSX3, {'ZLY','01','ZLY_FILIAL'		,'C',nTamFil,0,'Filial'			,'Filial'				,'Filial'				,'FilialdoSistema'			,'FilialdoSistema'			,'FilialdoSistema'			,'@!'					,'','€€€€€€€€€€€€€€€',''						  ,''		,1,''  ,'','','U','N','','','','','','','','','','','033','1','','','','','','',''})
	aAdd(aSX3, {'ZLY','02','ZLY_ROTA'		,'C',006,0,'Linha/Rota'			,'Linha/Rota'			,'Linha/Rota'					,'CodigodaRota'				,'CodigodaRota'				,'CodigodaRota'				,'@!'					,'','€€€€€€€€€€€€€€',''						 	  ,'ZLWLI2'	,1,'şÀ','','S','U','S','A','R','€','IIF(INCLUI,U_PrenDad(),.T.)','','','','','INCLUI','','','1','','','','','N','N',''})
	aAdd(aSX3, {'ZLY','03','ZLY_VERSAO'		,'C',003,0,'Versão'		,'Versão'			,'Versão'			,'VersaodaRota'				,'VersaodaRota'				,'VersaodaRota'				,''						,'','€€€€€€€€€€€€€€',''						  ,''		,0,'şÀ','','','U','S','V','R','€','','','','','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZLY','04','ZLY_DESROT'		,'C',040,0,'Desc. Rota'		,'Desc. Rota'			,'Desc. Rota'			,'DescricaodaRota'			,'DescricaodaRota'			,'DescricaodaRota'			,'@!'					,'','€€€€€€€€€€€€€€' ,''						  ,''		,1,'şÀ','','','U','S','V','R','€','','','','','','','','','1','','','','','','',''})
	aAdd(aSX3, {'ZLY','05','ZLY_NOMEFR'		,'C',040,0,'Nome Transp.'	,'Nome Transp.'			,'Nome Transp.'			,'NomedoTransp.'			,'NomedoTransp.'			,'NomedoTransp.'			,'@!'					,'','€€€€€€€€€€€€€€' ,''						  ,''		,1,'şÀ','','','U','S','V','R','€','','','','','','','','','1','','','','','','',''})
	aAdd(aSX3, {'ZLY','06','ZLY_DATINI'		,'D',008,0,'Data Inicial'	,'Data Inicial'			,'Data Inicial'			,'Datainicialdaamarracao'	,'Datainicialdaamarracao'	,'Datainicialdaamarracao'	,''						,'','€€€€€€€€€€€€€€',''						  ,''		,0,'şÀ','','','U','N','A','R','€' ,'','','','','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZLY','07','ZLY_DATFIM'		,'D',008,0,'Data Final'		,'Data Final'			,'Data Final'			,'Datafinaldarota'			,'Datafinaldarota'			,'Datafinaldarota'			,''						,'','€€€€€€€€€€€€€€',''						  ,''		,0,'şÀ','','','U','N','A','R','','','','','','','','','','','','','','','N','N',''})
	aAdd(aSX3, {"ZLY","08","ZLY_DIAPI"		,"C",001,0,"Dia Entrega"	,"Dia Entrega"			,"Dia Entrega"			,"Dia de entrega do leite "	,"Dia de entrega do leite "	,"Dia de entrega do leite ","@!"                   ,"","€€€€€€€€€€€€€€ ",""             				," ",1			,"şÀ","","","U","N","A","R","",'',"1=Ambos;2=Pares;3=Impares","","","","","","","7","","","","","","",""})
	aAdd(aSX3, {'ZLY','09','ZLY_MSBLQL'		,'C',001,0,'Bloqueado?'		,'Bloqueado?'			,'Bloqueado?'			,'Registrobloqueado'		,'Registrobloqueado'		,'Registrobloqueado'		,''						,'','€€€€€€€€€€€€€€',''						  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})

	aAdd(aSX3, {"ZLZ","01","ZLZ_FILIAL"		,"C",nTamFil,0,"Filial     "	,"Filial"      ,"Filial"		,"Filial do Sistema","Filial do Sistema        ","Filial do Sistema"	,"@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      	,1,""  ,""," ","U","N"," "," "," ","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZLZ","02","ZLZ_ITEM"		,"C",003,0,"Item"			,"Item"			,"Item"			,"Item  			","Item  "					,"Item  "				,"@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""			,1,"şÀ","","S","U","S","A","R","€",'',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLZ","03","ZLZ_CODPRO"		,"C",nTamCod,0,"Produtor"		,"Produtor"		,"Produtor"		,"Produtor  "		,"Produtor  "				,"Produtor  "			,cPicCod           	  ,"","€€€€€€€€€€€€€€ ",""                          ,"SA2_L4"	,1,"şÀ","","S","U","S","A","R","€",'',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLZ","04","ZLZ_LJPROD"		,"C",nTamLj,0,"Loja Produt."	,"Loja Produt."	,"Loja Produt."	,"Loja do Produtor"	,"Loja do Produtor          ","Loja do Produtor"	,cPicLj        ,"","€€€€€€€€€€€€€€ ",""                          ,""      	,2,"şÀ","","S","U","S","A","R","€",'ExistCPO("SA2",aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLZ_CODPRO" })]+M->ZLZ_LJPROD,1) ',"","","","","","","002","1","","","","","","",""})
	aAdd(aSX3, {"ZLZ","05","ZLZ_NOMEPR"		,"C",040,0,"Nome Produt."	,"Nome Produt."	,"Nome Produtor","Nome do Produtor"	,"Nome do Produtor          ","Nome do Produtor"	,"@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      	,2,"şÀ","","S","U","S","V","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLZ","06","ZLZ_ROTA"		,"C",006,0,"Rota        "	,"Rota  "		,"Rota  "      	,"Codigo da Rota"	,"Codigo da Rota           ","Codigo da Rota"		,"@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""			,2,""  ,"","S","U","S","A","R","€",'',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZLZ",'07','ZLZ_VERSAO'		,'C',003,0,'Versao'			,'Versao'		,'Versao'		,''					,''							,''						,''						,'','€€€€€€€€€€€€€€€',''						  ,''			,0,'şÀ','','S','U','N','V','R',' ','','','','','','','','','','','','','','N','N',''})
	aAdd(aSX3, {"ZLZ","08","ZLZ_DIAPI"		,"C",001,0,"Dia Entrega"	,"Dia Entrega"			,"Dia Entrega"			,"Dia de entrega do leite "	,"Dia de entrega do leite "	,"Dia de entrega do leite ","@!"                   ,"","€€€€€€€€€€€€€€ ",""             				," ",1			,"şÀ","","","U","N","A","R","",'',"1=Ambos;2=Pares;3=Impares","","","","","","","7","","","","","","",""})
	aAdd(aSX3, {'ZLZ','09','ZLZ_HRPRCH'		,'C',005,0,'Hor Chegada'	,'HoraChegada'			,'HoraChegada'			,'HoraprevistadeChegada'	,'HoraprevistadeChegada'	 ,'HoraprevistadeChegada'	  ,'@E 99:99'					  ,'','€€€€€€€€€€€€€€ ',''	 ,''					,0,'şÀ','','','U','N','A','R','','','','','','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZLZ','10','ZLZ_HRPRSA'		,'C',005,0,'Hor Previst'	,'HoraPrevist'			,'HoraPrevist'			,'HoraPrevistadeSaida'	  	,'HoraPrevistadeSaida'	  	,'HoraPrevistadeSaida'	  ,'@E 99:99'					  ,'','€€€€€€€€€€€€€€ ',''	 ,''					,0,'şÀ','','','U','N','A','R','','','','','','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZLZ','11','ZLZ_VLMPR' 		,'N',008,2,'Vol Previst'	,'Vol Previst'			,'Vol Previso'			,'Volume previsto'		  	,'Volume previsto'		  	,'Volume previsto','@E 99,999.99'					  ,'','€€€€€€€€€€€€€€ ',''	 ,''					,0,'şÀ','','','U','N','A','R','','','','','','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZLZ','12','ZLZ_MSBLQL'		,'C',001,0,'Bloqueado?'		,'Bloqueado?'			,'Bloqueado?'			,'Registrobloqueado'		,'Registrobloqueado'		,'Registrobloqueado'		,''						,'','€€€€€€€€€€€€€€',''						  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})

EndIf

/* Parametros do Leite */
If upParam
	aAdd(aSX3, {"ZLK","01","ZLK_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZLK","02","ZLK_LETRA ","C",001,0,"Codigo      ","Codigo"      ,"Codigo"      ,"Codigo da Faixa          ","Codigo da Faixa          ","Codigo da Faixa          ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","€","","","","","","INCLUI","","","1","","","","","","",""})
EndIF

//Cdastro de Tipo de Entidade x Letra
If upConfig
	aAdd(aSX3, {"ZL1","01","ZL1_FILIAL","C",nTamFil,0,"Filial      ","Filial"      ,"Filial"      ,"Filial do Sistema        ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","033","1","","","","","","",""})
	aAdd(aSX3, {"ZL1","02","ZL1_LETRA ","C",001,0,"Letra TP    ","Letra TP    ","Letra TP     ","Letra Tipo Entidade      ","Letra Tipo Entidade    ","Letra Tipo Entidade       ","@! "                   ,"","€€€€€€€€€€€€€€ ","",""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZL1","03","ZL1_DESC  ","C",030,0,"Desc Categor","Desc Categor","Desc Categor","Descricao da Categoria   ","Descricao da Categoria ","Descricao da Categoria    ","@! "                   ,"","€€€€€€€€€€€€€€ ","",""      ,1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {'ZL1','04','ZL1_GCLIEN'	,'C',001,0,'Grava Cli?','Grava Cli?','Grava Cli?'			,'Grava Letra Clien'		,'Grava Letra Clien'		,'Grava Letra Clien'		,''						,'','€€€€€€€€€€€€€€',''		  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZL1','05','ZL1_GFORNE'	,'C',001,0,'Grava For?','Grava For?','Grava For?'			,'Grava Letra Forne'		,'Grava Letra Forne'		,'Grava Letra Forne'		,''						,'','€€€€€€€€€€€€€€',''		  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZL1','06','ZL1_RCLIEN'	,'C',001,0,'Repli Cli?','Repli Cli?','Repli Cli?'			,'Replica em Client'		,'Replica em Client'		,'Replica em Client'		,''						,'','€€€€€€€€€€€€€€',''		  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZL1','07','ZL1_RFORNE'	,'C',001,0,'Repli For?','Repli For?','Repli For?'			,'Replica em Fornec'		,'Replica em Fornec'		,'Replica em Fornec'		,''						,'','€€€€€€€€€€€€€€',''		  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZL1','08','ZL1_GRANEL'	,'C',001,0,'Tr Granel?','Tr Granel?','Tr Granel?'			,'Transp Graneleiro'		,'Transp Graneleiro'		,'Transp Graneleiro'		,''						,'','€€€€€€€€€€€€€€',''		  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZL1','09','ZL1_PLEITE'	,'C',001,0,'Pdz Leite?','Pdz Leite?','Pdz Leite?'			,'Produtor de Leite'		,'Produtor de Leite'		,'Produtor de Leite'		,''						,'','€€€€€€€€€€€€€€',''		  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZL1','10','ZL1_FUNCIO'	,'C',001,0,'Funcionar?','Funcionar?','Funcionar?'			,'Funcionario?     '		,'Funcionario?     '		,'Funcionario?     '		,''						,'','€€€€€€€€€€€€€€',''		  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZL1','11','ZL1_LOJA  '	,'C',001,0,'Loja?     ','Loja?     ','Loja?     '			,'Cadastro Tp Loja '		,'Cadastro Tp Loja '		,'Cadastro TP Loja '		,''						,'','€€€€€€€€€€€€€€',''		  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZL1','12','ZL1_FORCVE'	,'C',001,0,'Forn Conve','Forn Conve','Forne Conv'		 	,'Fornece Convenio '		,'Fornece Convenio '		,'Fornece Convenio '		,''						,'','€€€€€€€€€€€€€€',''		  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZL1','13','ZL1_CONCVE'	,'C',001,0,'C Cven Ext','C Cven Ext','C Cven Ext'			,'Cons Conv Externo'		,'Cons Conv Externo'		,'Cons Conv Externo'		,''						,'','€€€€€€€€€€€€€€',''		  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZL1','14','ZL1_CONCVI'	,'C',001,0,'C Cven Int','C Cven Int','C Cven Int'			,'Cons Conv Interno'		,'Cons Conv Interno'		,'Cons Conv Interno'		,''						,'','€€€€€€€€€€€€€€',''		  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZL1','15','ZL1_COTACP'	,'C',001,0,'Cot Capita','Cot Capita','Cot Capita'			,'Cota Capital     '		,'Cota Capital     '		,'Cota Capital     '		,''						,'','€€€€€€€€€€€€€€',''		  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZL1','16','ZL1_EMPRES'	,'C',001,0,'Emprestimo','Emprestimo','Emprestimo'			,'Solicita Empresti'		,'Solicita Empresti'		,'Solicita Empresti'		,''						,'','€€€€€€€€€€€€€€',''		  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZL1','17','ZL1_TANQUE'	,'C',001,0,'Tanque Co ','Tanque Co ','Tanque Co '			,'Tanque Cole-Comun'		,'Tanque Cole-Comun'		,'Tanque Cole-Comun'		,''						,'','€€€€€€€€€€€€€€',''		  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZL1','18','ZL1_EVENTO'	,'C',001,0,'Tem Evento','Tem Evento','Tem Evento'			,'Possui Evento?   '		,'Possui Evento?   '		,'Possui Evento?   '		,''						,'','€€€€€€€€€€€€€€',''		  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})
	aAdd(aSX3, {'ZL1','19','ZL1_CCORRE'	,'C',001,0,'Ct Corrent','Ct Corrent','Ct Corrent'			,'Tem Cnt Corrente?'		,'Tem Cnt Corrente?'		,'Tem Cnt Corrente?'		,''						,'','€€€€€€€€€€€€€€',''		  ,''		,1,'€' ,'','','L','N','A','R','€' ,'2','1=Sim;2=Não','1=Si;2=No','1=Yes;2=No','','','','','','','','','','N','N',''})
EndIf

// marcosilva - capal    
If upPInct        

/* Novos campos no cadastro de Produtor - Educampo Cafe
	•	A2_L_ARHAC – Área em Hectares de Café;
	•	A2_L_VLRHA – Valor em R$ por Hectare;
*/
aAdd(aSX3, {"SA2","M8","A2_L_ARHAC","N",04,0,"Area Café","Area Café","Area Café","Area em Hectares de Café","Area em Hectares de Café","Area em Hectares de Café","9999"      ,"","€€€€€€€€€€€€€€€",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","","8","","","","","","",""})
aAdd(aSX3, {"SA2","M9","A2_L_VLRHA" ,"N",08,4,"Vl Hectare","Vl Hectare","Vl Hectare","Valor por Hectare","Valor por Hectare","Valor por Hectare","@E 999.9999"      ,"","€€€€€€€€€€€€€€€",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","","8","","","","","","",""})    
     
/*	ZP0 – Programas: onde todos os programas deverão ser cadastrados;
o	ZP0_COD – código do programa, numérico;
o	ZP0_DESCR – descrição do programa, texto;
o	ZP0_DESP1 – descrição do parâmetro 1 do programa (informativo), texto;
o	ZP0_DESP2 – descrição do parâmetro 2 do programa (informativo), texto;
o	ZP0_DESP3 – descrição do parâmetro 3 do programa (informativo), texto;
o	ZP0_DESCAL – descrição do cálculo (informativo), texto;
o	ZP0_NOMROT – nome da rotina de cálculo, texto;
o	Observações:
?	Os campos ZP0_DESP1, ZP0_DESP2 e ZP0_DESP3 irão permitir que, em uma mesma tabela, sejam controlados todos os programas, contendo nenhum, um, dois ou até três parâmetros base. O valor desses parâmetros será gravado em outra tabela (especificada logo a seguir).
?	O campo ZP0_DESCAL é um campo meramente informativo, proporcionando fácil visualização da fórmula de cálculo de um programa;
?	O campo ZP0_NOMROT deverá conter nome da rotina ADVPL responsável pelo cálculo de valores do programa. Quando uma rotina for acessada, ela poderá buscar de maneira dinâmica quais os dados e parâmetros do programa a que ela se refere.
o	Registros iniciais:
{01| Educampo Leite 	   	| base leite (1%*R$0,33)	| 1/2 salário	| valor km  | | XXX1}
{02| Balde Cheio	   	   	| base leite (1%*R$0,33)	| 1/4 salário	| valor km  | | XXX2}
{03| Educampo Café  	   	| valor km		|           	|	   | | XXX3}
{04| Manutenção de Ordenhas 	| cod tabela padrao  	| cod tab extra  	| valor km  | | XXX4}
{05| Bon. Inseminação Artificial	| vlr. Inseminação	| teto bonif.	|   	   | | XXX5}
*/	
	aAdd(aSX3, {"ZP0","01","ZP0_FILIAL","C",002,0,"Filial      ","Filial"      ,"Filial"     ,"Filial do Sistema         ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP0","02","ZP0_COD","C",002,0,"Programa      ","Programa"      ,"Programa"     ,"Código do Programa","Código do Programa","Código do Programa","999999"                   ,"","€€€€€€€€€€€€€€ ",'GetSxeNum("ZP0","ZP0_COD")',""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP0","03","ZP0_DESCR","C",030,0,"Descrição","Descrição"      ,"Descrição"     ,"Descrição do Programa","Descrição do Programa","Descrição do Programa","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP0","04","ZP0_DESP1","C",020,0,"Parâmetro 1","Parâmetro 1"      ,"Parâmetro 1"     ,"Descrição do Parâmetro 1","Descrição do Parâmetro 1","Descrição do Parâmetro 1","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP0","05","ZP0_DESP2","C",020,0,"Parâmetro 2","Parâmetro 2"      ,"Parâmetro 2"     ,"Descrição do Parâmetro 2","Descrição do Parâmetro 2","Descrição do Parâmetro 2","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP0","06","ZP0_DESP3","C",020,0,"Parâmetro 3","Parâmetro 3"      ,"Parâmetro 3"     ,"Descrição do Parâmetro 3","Descrição do Parâmetro 3","Descrição do Parâmetro 3","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP0","07","ZP0_DESCAL","C",015,0,"Calculo","Calculo"      ,"Calculo"    ,"Descrição do Calculo","Descrição do PCalculo","Descrição do Calculo","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP0","08","ZP0_NOMROT","C",015,0,"Rotina","Rotina"      ,"Rotina"    ,"Descrição do Calculo","Descrição do PCalculo","Descrição do Calculo","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
/*
•	ZP1 – Parâmetros de Programas: onde os valores dos parâmetros (descritos na tabela anterior) são informados;
o	ZP1_COD – código do programa, numérico;
o	ZP1_DTINIV – data inicial de vigência, char(6);
o	ZP1_VLRP1 – valor do parâmetro 1 do programa, numérico;
o	ZP1_VLRP2 – valor do parâmetro 2 do programa, numérico;
o	ZP1_VLRP3 – valor do parâmetro 3 do programa, numérico;
o	ZP1_VIGENT – vigente?, caracter(1), opções (S=Sim;N=Não);
o	Observações:
?	O campo ZP1_DTINIV deverá controlar a data em que os parâmetros passaram a entrar em vigência;
?	O campo ZP1_VIGENT deverá indicar qual conjunto de parâmetros está vigente atualmente;
•	Caso existam outros registros antigos para um determinado programa, deverão estar marcados com opção “N”.
o	Registros iniciais:
		{01| 201301 | 0,0033	| 339		| 0,95	| S	}
		{02| 201301 | 0,0033	| 169,5		| 0,95	| S	}
		{03| 201301 | 0,95	|    		|   	| S	}
		{04| 201301 | 000001	| 000002   	| 0,60	| S	}
		{05| 201301 | 15		| 10 (%)		|   	| S	}
*/
	
	aAdd(aSX3, {"ZP1","01","ZP1_FILIAL","C",002,0,"Filial      ","Filial"      ,"Filial"     ,"Filial do Sistema         ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP1","02","ZP1_COD","C",002,0,"Programa","Programa"      ,"Programa"     ,"Código do Programa","Código do Programa","Código do Programa","999999"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP1","03","ZP1_DTINIV","C",006,0,"Vigência","Vigência"      ,"Vigência"     ,"Data Inicial Vigência","Data Inicial Vigência","Data Inicial Vigência","999999"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZP1","04","ZP1_VLRP1","N",008,4,"Valor Par 1","Valor Par 1","Valor Par 1","Valor do Parâmetro 1","Valor do Parâmetro 1","Valor do Parâmetro 1","@E 999.9999"              ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})	
    aAdd(aSX3, {"ZP1","05","ZP1_VLRP2","N",008,4,"Valor Par 2","Valor Par 2","Valor Par 2","Valor do Parâmetro 2","Valor do Parâmetro 2","Valor do Parâmetro 2","@E 999.9999"              ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})	
    aAdd(aSX3, {"ZP1","06","ZP1_VLRP3","N",008,4,"Valor Par 3","Valor Par 3","Valor Par 3","Valor do Parâmetro 3","Valor do Parâmetro 3","Valor do Parâmetro 3","@E 999.9999"              ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})	
    aAdd(aSX3, {"ZP1","07","ZP1_VIGENT","C",001,0,"Vigente?","Vigente?","Vigente?","Grupo de Parâmetros Vigente?","Grupo de Parâmetros Vigente?","Grupo de Parâmetros Vigente?","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","S=Sim;N=Nao","","","","","","","8","","","","","","",""})

/*
•	ZP2 – Subsídio de Programas: onde os valores de subsídios (caso exista subsídio para o programa) são informados;
o	ZP2_COD – código do programa, numérico;
o	ZP2_QTDMI – quantidade de meses inicial, numérico;
o	ZP2_QTDMF – quantidade de meses final, numérico;
o	ZP2_SUBPAR – subsídio parceiro, numérico;
o	ZP2_SUBCAP – subsídio Capal, numérico;
o	ZP2_VLRCOO – valor cooperado, numérico;
o	Observações:
?	Os campos ZP2_QTDMI e ZP2_QTDMF deverão conter a quantidade de meses inicial e final de um cooperado/propriedade dentro de um programa para que recebam os subsídios;
?	O campo ZP2_SUBPAR deverá conter valor em porcentagem referente ao subsídio que será dado ao cooperado/propriedade por parte da entidade parceira (atualmente Itambé);
?	O campo ZP2_SUBCAP deverá conter valor em porcentagem referente ao subsídio que será dado ao cooperado/propriedade por parte da Capal;
INIPADRAO ALTERACAO E GATILHO - ?	O campo ZP2_VLRCOO deverá ser somente exibição, calculado automaticamente, subtraindo 100%- ZP2_SUBPAR- ZP2_SUBCAP.
o	Registros iniciais:
		{01| 01	| 12 | 40 | 10 | 50 }
		{01| 13	| 24 | 30 | 10 | 60 }
		{01| 25	| 36 | 20 | 10 | 70 }
		{01| 37	| 99 | 10 | 10 | 80 }
		{02| 01	| 12 | 40 | 40 |	20 }
		{02| 13	| 24 | 30 | 30 |	40 }
		{02| 25	| 36 | 20 | 20 |	60 }
		{02| 37	| 99| 10 | 10 |	80 }    

--------------------------------------------------------------------------------------		
ini padrão: IF(INCLUI,'',POSICIONE("ZP0",1,XFILIAL("ZP0")+M->ZP2_COD,"ZP0_DESCR"))
ini browse: POSICIONE("ZP0",1,XFILIAL("ZP0")+ZP2->ZP2_COD,"ZP0_DESCR") 

GATILHOS ZP2_SUBCAP, ZP2_SUBPAR		
GATILHO ZP2_COD
EXISTCPO("ZP0")  
MUDAR DESCRIÇÃO DO CAMPO PROGRAMA E INDICE    
--------------------------------------------------------------------------------------
*/
	
	aAdd(aSX3, {"ZP2","01","ZP2_FILIAL","C",002,0,"Filial      ","Filial"      ,"Filial"     ,"Filial do Sistema         ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP2","02","ZP2_COD","C",002,0,"Programa","Programa","Programa"     ,"Código do Programa","Código do Programa","Código do Programa","999999"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZP0",1,"şÀ","","","U","N","V","R","",'EXISTCPO("ZP0")',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP2","03","ZP2_DESCR","C",030,0,"Descrição","Descrição"      ,"Descrição"     ,"Descrição do Programa","Descrição do Programa","Descrição do Programa","@!"                   ,"","€€€€€€€€€€€€€€ ","IF(INCLUI,'',LEFT(POSICIONE('ZP0',1,XFILIAL('ZP0')+M->ZP2_COD,'ZP0_DESCR'),30))",""      ,1,"","","","U","S","V","V","","","","","","","",'POSICIONE("ZP0",1,XFILIAL("ZP0")+ZP2->ZP2_COD,"ZP0_DESCR")',"","1","","","","","","",""})	
    aAdd(aSX3, {"ZP2","04","ZP2_QTDMI","N",003,0,"Meses Inicio","Meses Inicio","Meses Inicio","Quantidade de meses inicial","Quantidade de meses inicial","Quantidade de meses inicial","999"              ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})	
    aAdd(aSX3, {"ZP2","05","ZP2_QTDMF","N",003,0,"Meses Final","Meses Final","Meses Final","Quantidade de meses final","Quantidade de meses final","Quantidade de meses final","999"              ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})	
    aAdd(aSX3, {"ZP2","06","ZP2_SUBPAR","N",002,0,"SubS Parceiro","Valor Par 1","Valor Par 1","Subsidio Parceiro","Subsidio Parceiro","Subsidio Parceiro","99"              ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})	
    aAdd(aSX3, {"ZP2","07","ZP2_SUBCAP","N",002,0,"SubS Capal","Subsidio Capal","Subsidio Capal","Subsidio Capal","Subsidio Capal","Subsidio Capal","99"              ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})	
    aAdd(aSX3, {"ZP2","08","ZP2_VLRCOO","N",002,0,"Vl cooperado","Vl cooperado","Vl cooperado","Valor Cooperado","Valor Cooperado","Valor Cooperado","99"              ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})	

/*
•	ZP3 – Valores de Programas: onde os valores a serem pagos por cooperados/mês/programa são gravados;
o	ZP3_COD – código do programa, numérico;
o	ZP3_CODCOO – código do cooperado (SA2), numérico;
o	ZP3_LJCOO – loja do cooperado (SA2), numérico;
o	ZP3_PERIOD – período de referência (AAAAMM), char(6);
o	ZP3_VLR – valor líquido para o programa em um determinado mês/cooperado, numérico;
o	Observações:
?	Esta tabela deverá ser abastecida pelas rotinas específicas de cada um dos programas.
*/	
	aAdd(aSX3, {"ZP3","01","ZP3_FILIAL","C",002,0,"Filial      ","Filial"      ,"Filial"     ,"Filial do Sistema         ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP3","02","ZP3_COD","C",002,0,"Programa","Programa"      ,"Programa"     ,"Código do Programa","Código do Programa","Código do Programa","999999"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZP0",1,"şÀ","","","U","N","V","R","",'EXISTCPO("ZP0")',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP3","03","ZP3_DESCR","C",030,0,"Descrição","Descrição"      ,"Descrição"     ,"Descrição do Programa","Descrição do Programa","Descrição do Programa","@!"                   ,"","€€€€€€€€€€€€€€ ","IF(INCLUI,'',LEFT(POSICIONE('ZP0',1,XFILIAL('ZP0')+M->ZP3_COD,'ZP0_DESCR'),30))",""      ,1,"şÀ","","","U","S","V","V","","","","","","","",'POSICIONE("ZP0",1,XFILIAL("ZP0")+ZP3->ZP3_COD,"ZP0_DESCR")',"","1","","","","","","",""})	
	aAdd(aSX3, {"ZP3","04","ZP3_CODCOO","C",006,0,"Cooperado   ","Cooperado    ","Cooperado    ","Cooperado                 ","Cooperado                 ","Cooperado                 ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"SA2_L8",1,"şÀ","","","U","S","A","R","€",'U_CHKRETIR()                ',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP3","05","ZP3_LJCOO","C",002,0,"Loja        ","Loja        ","Loja        ","Loja do Produtor         ","Loja Produtor            ","Loja do Produtor         ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","S","A","R","€",'U_CHKRETIR()                ',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP3","06","ZP3_NOMCOO","C",040,0,"Nome        ","Nome        ","Nome        ","Nome do Cooperado","Nome do Cooperado","Nome do Cooperado","@!"                   ,"","€€€€€€€€€€€€€€ ","IF(INCLUI,'', POSICIONE('SA2',1,XFILIAL('SA2')+M->ZP3_CODCOO+M->ZP3_LJCOO,'A2_NOME'))",""      ,1,"şÀ","","","U","S","V","V","","","","","","","","POSICIONE('SA2',1,xFILIAL('SA2')+ZP3->ZP3_CODCOO+ZP3->ZP3_LJCOO,'A2_NOME')","","1","","","","","","",""})	
	aAdd(aSX3, {"ZP3","07","ZP3_PERIOD","C",006,0,"Período","Período","Período","Período de referência","Período de referência","Período de referência","999999"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZP3","08","ZP3_VLR","N",012,4,"Vl Líquido","Vl Líquido","Vl Líquido","Valor Líquido","Valor Líquido","Valor Líquido","99"              ,"","€€€€€€€€€€€€€€ ",""                          ,""     ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})	
	aAdd(aSX3, {"ZP3","09","ZP3_MIX  ","C",006,0,"Cod. do MIX ","Cod. do MIX ","Cod. do MIX ","Codigo do MIX.           ","Codigo do MIX.           ","Codigo do MIX.           ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"ZLE_01",1,"şÀ","","","U","N","V","R","",'EXISTCPO("ZLE")',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP3","10","ZP3_VERSAO","C",001,0,"Versao MIX  ","Versao MIX  ","Versao MIX  ","Versao do MIX.           ","Versao do MIX.           ","Versao do MIX.           ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP3","11","ZP3_MARCA","C",001,0,"Marca","Marca  ","Marca","Selecionado","Selecionado","Selecionado",""                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","V","R","","","","","","","","","","1","","","","","","",""})
    
/*
•	ZP4 – Movimentação de Produtores: responsável por registrar as entradas e saídas de produtores por programa;
o	ZP4_COD – código do programa, numérico;
o	ZP4_CODCOO – código do cooperado (SA2), numérico;
o	ZP4_LJCOO – loja do cooperado (SA2), numérico;
o	ZP4_DATA – data da entrada ou saída, data;
o	ZP4_ENTSA – se é entrada ou saída, caracter(1), opções (E=Entrada; S=Saída);
o	ZP4_VIGENT – se o registro de movimentação é o último registro, caracter(1), opções (S=Sim; N=Não).   

IF(INCLUI,'',POSICIONE("ZP0",1,XFILIAL("ZP0")+M->ZP4_COD,"ZP0_DESCR"))
POSICIONE("ZP0",1,XFILIAL("ZP0")+ZP4->ZP4_COD,"ZP0_DESCR")  
EXISTCPO("ZP0")  
GATILHO ZP4_COD - ZP4_DESCR - ZP0->ZP0_DESCR - xFilial("ZP0")+M->ZP2_COD                                                                           

INIPAD: IF(INCLUI,'', POSICIONE("SA2",1,XFILIAL("SA2")+M->ZP4_CODCOO+M->ZP4_LJCOO,"A2_NOME"))
INIBROW: POSICIONE("SA2",1,xFILIAL("SA2")+ZP4->ZP4_CODCOO+ZP4->ZP4_LJCOO,"A2_NOME") 

ZP4_COD
ZP4_ENTSA

*/	
	aAdd(aSX3, {"ZP4","01","ZP4_FILIAL","C",002,0,"Filial      ","Filial"      ,"Filial"     ,"Filial do Sistema         ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP4","02","ZP4_COD","C",002,0,"Programa","Programa"      ,"Programa"     ,"Código do Programa","Código do Programa","Código do Programa","999999"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP4","03","ZP4_DESCR","C",030,0,"Descrição","Descrição"      ,"Descrição"     ,"Descrição do Programa","Descrição do Programa","Descrição do Programa","@!"                   ,"","€€€€€€€€€€€€€€ ","IF(INCLUI,'',LEFT(POSICIONE('ZP0',1,XFILIAL('ZP0')+M->ZP4_COD,'ZP0_DESCR'),30))",""      ,1,"","","","U","S","V","V","","","","","","","",'POSICIONE("ZP0",1,XFILIAL("ZP0")+ZP4->ZP4_COD,"ZP0_DESCR")',"","1","","","","","","",""})	
	aAdd(aSX3, {"ZP4","04","ZP4_CODCOO","C",006,0,"Cooperado   ","Cooperado    ","Cooperado    ","Cooperado                 ","Cooperado                 ","Cooperado                 ","@!"                   ,"","€€€€€€€€€€€€€€ ","","SA2_L8",1,"şÀ","","","U","S","A","R","€",'U_CHKRETIR()                ',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP4","05","ZP4_LJCOO","C",002,0,"Loja        ","Loja        ","Loja        ","Loja do Produtor         ","Loja Produtor            ","Loja do Produtor         ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","A","R","€",'U_CHKRETIR()                ',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP4","06","ZP4_NOMCOO","C",040,0,"Nome        ","Nome        ","Nome        ","Nome do Cooperado","Nome do Cooperado","Nome do Cooperado","@!"                   ,"","€€€€€€€€€€€€€€ ","IF(INCLUI,'', POSICIONE('SA2',1,XFILIAL('SA2')+M->ZP4_CODCOO+M->ZP4_LJCOO,'A2_NOME'))",""      ,1,"","","","U","S","V","V","","","","","","","","POSICIONE('SA2',1,xFILIAL('SA2')+ZP4->ZP4_CODCOO+ZP4->ZP4_LJCOO,'A2_NOME')","","1","","","","","","",""})	
	aAdd(aSX3, {"ZP4","07","ZP4_DATA","D",008,0,"Data","Data","Data","Data Entrada ou Saida","Data Entrada ou Saida","Data Entrada ou Saida","@D"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZP4","08","ZP4_ENTSA","C",001,0,"Entr ou Saida?","Entr ou Saida?","Entr ou Saida?","Entrada ou Saida?","Entrada ou Saida?","Entrada ou Saida?","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","E=Entrada;S=Saida","","","","","","","8","","","","","","",""})
    aAdd(aSX3, {"ZP4","09","ZP4_VIGENT","C",001,0,"Vigente?","Vigente?","Vigente?","Grupo de Parâmetros Vigente?","Grupo de Parâmetros Vigente?","Grupo de Parâmetros Vigente?","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","S=Sim;N=Nao","","","","","","","8","","","","","","",""})

/*
•	ZP5 – Visitas Técnicas: responsável por registrar as visitas realizadas por programa;
o	ZP5_COD – código do programa, é o ano e o mês da visita (AAAAMM);
o	ZP5_DESCR – Descrição tabela, caracter(20);
o	ZP5_ITEM – Item;
o	ZP5_CODCOO – código do cooperado (SA2), numérico;
o	ZP5_LJCOO – loja do cooperado (SA2), numérico;
o	ZP5_NOMCOO – nome do cooperado (SA2), caracter(40);
o 	ZP5_KMCOO – Km cooperado (SA2), campo visual, preenchimento automático, numérico; gatilho ler de A2_L_ACESS
o	ZP5_DATA – data da visita, data;
o	ZP5_PROGR – se é uma visita programada, caracter(1), opções (S=Sim;N=Não);
o	Observações:
?	O campo ZP5_PROGR, considerando as regras atuais, só será relevante em visitas do programa “Manutenção de Ordenhas”.

IF(INCLUI,'',POSICIONE("ZP0",1,XFILIAL("ZP0")+M->ZP5_COD,"ZP0_DESCR"))
POSICIONE("ZP0",1,XFILIAL("ZP0")+ZP5->ZP5_COD,"ZP0_DESCR")  
EXISTCPO("ZP0")  
GATILHO ZP5_COD - ZP5_DESCR - ZP0->ZP0_DESCR - xFilial("ZP0")+M->ZP2_COD                                                                           

INIPAD: IF(INCLUI,'', POSICIONE("SA2",1,XFILIAL("SA2")+M->ZP5_CODCOO+M->ZP5_LJCOO,"A2_NOME"))
INIBROW: POSICIONE("SA2",1,xFILIAL("SA2")+ZP5->ZP5_CODCOO+ZP5->ZP5_LJCOO,"A2_NOME") 
gatilho: ZP5_KMCOO - POSICIONE("SA2",1,XFILIAL("SA2")+M->ZP5_CODCOO+M->ZP5_LJCOO,"A2_L_ACESS")

ZP5_KMCOO - multiplicar por 2     

*/
	aAdd(aSX3, {"ZP5","01","ZP5_FILIAL","C",002,0,"Filial      ","Filial"      ,"Filial"     ,"Filial do Sistema         ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP5","02","ZP5_COD","C",002,0,"Programa","Programa"      ,"Programa"     ,"Código do Programa","Código do Programa","Código do Programa","999999"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","N","","","","","","","","","","","","1","","","","","","",""})

	aAdd(aSX3, {"ZP5","03","ZP5_DESCR","C",030,0,"Descrição","Descrição"      ,"Descrição"     ,"Descrição do Programa","Descrição do Programa","Descrição do Programa","@!"                   ,"","€€€€€€€€€€€€€€ ","IF(INCLUI,'',LEFT(POSICIONE('ZP0',1,XFILIAL('ZP0')+M->ZP5_COD,'ZP0_DESCR'),30))",""      ,1,"şÀ","","","U","S","V","V","","","","","","","",'POSICIONE("ZP0",1,XFILIAL("ZP0")+ZP5->ZP5_COD,"ZP0_DESCR")',"","1","","","","","","",""})	

   //	aAdd(aSX3, {"ZP5","04","ZP5_ITEM","C",002,0,"Item","Item","Item","Item","Item","Item","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP5","04","ZP5_CODCOO","C",006,0,"Cooperado   ","Cooperado    ","Cooperado    ","Cooperado                 ","Cooperado                 ","Cooperado                 ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"SA2_L8",1,"şÀ","","","U","S","A","R","€",'U_CHKRETIR()                ',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP5","05","ZP5_LJCOO","C",002,0,"Loja        ","Loja        ","Loja        ","Loja do Produtor         ","Loja Produtor            ","Loja do Produtor         ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","A","R","€",'U_CHKRETIR()                ',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP5","06","ZP5_NOMCOO","C",040,0,"Nome        ","Nome        ","Nome        ","Nome do Cooperado","Nome do Cooperado","Nome do Cooperado","@!"                   ,"","€€€€€€€€€€€€€€ ","IF(INCLUI,'', POSICIONE('SA2',1,XFILIAL('SA2')+M->ZP5_CODCOO+M->ZP5_LJCOO,'A2_NOME'))",""      ,1,"şÀ","","","U","S","V","V","","","","","","","","POSICIONE('SA2',1,xFILIAL('SA2')+ZP5->ZP5_CODCOO+ZP5->ZP5_LJCOO,'A2_NOME')","","1","","","","","","",""})	
    aAdd(aSX3, {"ZP5","07","ZP5_KMCOO","N",009,1,"Acesso (KM) ","Acesso (KM) ","Acesso (KM) ","Acessibilidade em KM.    ","Acessibilidade em KM.    ","Acessibilidade em KM.    ","@E 999,999.9"         ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","","","","","","","","8","","","","","","",""})        
	aAdd(aSX3, {"ZP5","08","ZP5_DATA","D",008,0,"Data","Data","Data","Data da Visita","Data da Visita","Data da Visita","@D"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZP5","09","ZP5_PROGR","C",001,0,"Programada?","Programada?","Programada?","Visita Programada?","Visita Programada?","Visita Programada?","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","S=Sim;N=Não","","","","","","","8","","","","","","",""})
	aAdd(aSX3, {"ZP5","10","ZP5_DTCALC","C",006,0,"Dt Calc","Dt Calc","Dt Calc","Data do Calculo","Data do Calculo","Data do Calculo","999999"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
/*
•	ZP6 – Registro de Inseminações: responsável por controlar inseminações realizadas e também as já bonificadas;
o	ZP6_CODCOO – código do cooperado (SA2), numérico;
o	ZP6_LJCOO – loja do cooperado (SA2), numérico;
o	ZP6_PERIOD – período de referência (AAAAMM), char(6);
o	ZP6_QTD – quantidade de vacas do período, numérico;
o	ZP6_INSBON – se o registro é referente à quantidade de vacas inseminadas ou bonificadas no período, caracter(1), opções (I=Inseminação; B=Bonificação).
*/

	aAdd(aSX3, {"ZP6","01","ZP6_FILIAL","C",002,0,"Filial      ","Filial"      ,"Filial"     ,"Filial do Sistema         ","Filial do Sistema        ","Filial do Sistema        ","@!"                   ,"","€€€€€€€€€€€€€€€",""                          ,""      ,1,""  ,"","","U","N","","","","","","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP6","02","ZP6_CODCOO","C",006,0,"Cooperado   ","Cooperado    ","Cooperado    ","Cooperado                 ","Cooperado                 ","Cooperado                 ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"SA2_L8",1,"şÀ","","","U","S","A","R","€",'U_CHKRETIR()                ',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP6","03","ZP6_LJCOO","C",002,0,"Loja        ","Loja        ","Loja        ","Loja do Produtor         ","Loja Produtor            ","Loja do Produtor         ","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","A","R","€",'U_CHKRETIR()                ',"","","","","","","","1","","","","","","",""})
	aAdd(aSX3, {"ZP6","04","ZP6_NOMCOO","C",040,0,"Nome        ","Nome        ","Nome        ","Nome do Cooperado","Nome do Cooperado","Nome do Cooperado","@!"                   ,"","€€€€€€€€€€€€€€ ","IF(INCLUI,'', POSICIONE('SA2',1,XFILIAL('SA2')+M->ZP6_CODCOO+M->ZP6_LJCOO,'A2_NOME'))",""      ,1,"şÀ","","","U","S","V","V","","","","","","","","POSICIONE('SA2',1,xFILIAL('SA2')+ZP6->ZP6_CODCOO+ZP6->ZP6_LJCOO,'A2_NOME')","","1","","","","","","",""})	
	aAdd(aSX3, {"ZP6","05","ZP6_PERIOD","C",006,0,"Período","Período","Período","Período de referência","Período de referência","Período de referência","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
    aAdd(aSX3, {"ZP6","06","ZP6_QTD","N",004,0,"Qtd Vacas","Qtd Vacas","Qtd Vacas","Quantidade de Vacas","Quantidade de Vacas","Quantidade de Vacas","99"              ,"","€€€€€€€€€€€€€€ ",""                          ,""      ,1,"şÀ","","","U","S","A","R","","","","","","","","","","1","","","","","","",""})	
    aAdd(aSX3, {"ZP6","07","ZP6_INSBON","C",001,0,"Insem ou Bonif?","Insem ou Bonif?","Insem ou Bonif?","Inseminação ou Bonificação?","Inseminação ou Bonificação?","Inseminação ou Bonificação?","@!"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"",1,"şÀ","","","U","N","A","R","","","I=Inseminação;B=Bonificação","","","","","","","8","","","","","","",""})
	aAdd(aSX3, {"ZP6","08","ZP6_DTCALC","C",006,0,"Dt Calc","Dt Calc","Dt Calc","Data do Calculo","Data do Calculo","Data do Calculo","999999"                   ,"","€€€€€€€€€€€€€€ ",""                          ,"      ",1,"şÀ","","","U","S","A","R","€","","","","","","","","","1","","","","","","",""})
EndIf
// fim marcosilva - capal    

ProcRegua(Len(aSX3))

dbSelectArea("SX3")
dbSetOrder(2)

For i:= 1 To Len(aSX3)
	If !Empty(aSX3[i][1])//Se o Alias foi informado
		If !dbSeek(aSX3[i,3])//Se nao encontrou o campo
			dbSelectArea("SX3")
			dbSetOrder(1)
			dbSeek(aSX3[i,1]+"ZZ",.T.)
			If SX3->X3_ARQUIVO+SX3->X3_ORDEM == aSX3[i,1]+"ZZ"
				cOrdem := "ZZ"
			Else
				dbSkip(-1)
				If SX3->X3_ARQUIVO == aSX3[i,1]
					If SubStr(SX3->X3_ORDEM,2,1) == "9"
						aSX3[i,2] := SomaOrd(SX3->X3_ORDEM)
					Else
						aSX3[i,2] := Soma1(SX3->X3_ORDEM)
					EndIf
				Else
					aSX3[i,2] := "01"
				EndIf
			EndIf
			dbSelectArea("SX3")
			dbSetOrder(2)
			lSX3 := .T.
			If !(aSX3[i,1]$cAlias)
				cAlias += aSX3[i,1]+"/"
				aAdd(aArqUpd,aSX3[i,1])
			EndIf

			//Grava os dados do campo no SX3
			RecLock("SX3",.T.)
			For j:=1 To Len(aSX3[i])
				If FieldPos(aEstrut[j]) > 0
					FieldPut(FieldPos(aEstrut[j]),aSX3[i,j])
				EndIf
			Next j
			dbCommit()
			MsUnLock()

			cTexto += "Criado " + aSx3[i][1] + " - " + aSx3[i][3] + Chr(13) + Chr(10)
		Else
			// verificando diferencas
			chek := ""
			chek+=IIF(X3_ARQUIVO==aSX3[i][1],"","Arquivo,")
			//chek+=IIF(X3_ORDEM  ==aSX3[i][2],"","2,")
			chek+=IIF(alltrim(X3_CAMPO)  ==alltrim(aSX3[i][3]),"","Campo,")
			chek+=IIF(alltrim(X3_TIPO)   ==alltrim(aSX3[i][4]),"","Tipo,")
			chek+=IIF(X3_TAMANHO==aSX3[i][5],"","Tamanho,")
			chek+=IIF(X3_DECIMAL==aSX3[i][6],"","Decimal,")
			chek+=IIF(alltrim(X3_TITULO) ==alltrim(aSX3[i][7]),"","Titulo,")
			//chek+=IIF(X3_DESCRIC==aSX3[i][10],"","Descricao,")
			chek+=IIF(alltrim(X3_PICTURE)==alltrim(aSX3[i][13]),"","Picture,")
			chek+=IIF(alltrim(X3_VALID)==alltrim(aSX3[i][14]),"","Valid,")
			//chek+=IIF(LEN(alltrim(X3_USADO))==LEN(alltrim(aSX3[i][15])),"","Usado,")
			chek+=IIF(alltrim(X3_RELACAO)==alltrim(aSX3[i][16]),"","Relacao,")
			chek+=IIF(alltrim(X3_F3)==alltrim(aSX3[i][17]),"","F3,")

			chek+=IIF(X3_NIVEL  ==aSX3[i][18],"","Nivel,")
			//chek+=IIF(X3_RESERV ==aSX3[i][19],"","Reserv,")
			//chek+=IIF(X3_CHECK  ==aSX3[i][20],"","Check,")
			chek+=IIF(alltrim(X3_TRIGGER)==alltrim(aSX3[i][21]),"","Trigger,")
			chek+=IIF(X3_PROPRI ==aSX3[i][22],"","Propri,")
			chek+=IIF(X3_BROWSE ==aSX3[i][23],"","Browse,")
			chek+=IIF(ALLTRIM(X3_VISUAL) ==ALLTRIM(aSX3[i][24]),"","Visual,")
			chek+=IIF(alltrim(X3_CONTEXT)==alltrim(aSX3[i][25]),"","Context,"+X3_CONTEXT+"-"+aSX3[i][25]+"]")
			chek+=IIF(alltrim(X3_OBRIGAT)==alltrim(aSX3[i][26]),"","Obrigat,")
			//chek+=IIF(X3_VLDUSER==aSX3[i][29],"","VldUser,")
			chek+=IIF(ALLTRIM(X3_CBOX)==ALLTRIM(aSX3[i][28]),"","Cbox["+ALLTRIM(X3_CBOX)+"-"+ALLTRIM(aSX3[i][28])+"],")
			//chek+=IIF(X3_PICTVAR==aSX3[i][31],"","PictVar,")
			chek+=IIF(ALLTRIM(X3_WHEN)==ALLTRIM(aSX3[i][32]),"","When,")
			//chek+=IIF(X3_INIBRW ==aSX3[i][33],"","IniBrw,")
			chek+=IIF(alltrim(X3_FOLDER) ==alltrim(aSX3[i][35]),"","Folder,")

			If empty(alltrim(chek))
				//cTexto += "O campo "  + aSx3[i][3] + " ja existe em " + aSx3[i][1] + " e nao foi alterado." + Chr(13) + Chr(10)
			else
				cTexto += "O campo "  + aSx3[i][3] + " existe mas esta diferente: " + chek + Chr(13) + Chr(10)
			EndIf
		EndIf
	EndIf
Next i

cTexto := "Tabelas atualizadas : " + cAlias + Chr(13) + Chr(10) + cTexto

Return cTexto


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ GLTOrdX3 ³ Autor ³ TOTVS                 ³ Data ³ 00/00/00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para retornar a ordem do campo para cricao          ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Implantacao Gestao do Leite.                               ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GLTOrdX3(cTabela)

Local _cOrder
	//Pega o ultima ordem dos campos SA1
	xArea:=GetArea("SX3")
	dbSelectArea("SX3")
	dbSetorder(1)
	dbSeek(cTabela)

	While !SX3->(EOF())
		IF SX3->X3_ARQUIVO <> cTabela
		   Exit
		EndIF
		_cOrder:=SX3->X3_ORDEM
		SX3->(dbSkip())
	EndDo
	RestArea(xArea)

Return _cOrder

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ SomaOrd  ³ Autor ³ TOTVS                 ³ Data ³ 00/00/00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Soma a ordem dos campos.                                   ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Implantacao Gestao do Leite.                               ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function SomaOrd(cOrd)

Local cRet := "01"

If SubStr(cOrd,1,1) $ "1/2/3/4/5/6/7/8/9"
	cRet := cOrd
Else
	cRet := ALLTRIM(SOMA1(SubStr(cOrd,1,1)))+"0"
EndIf

Return(cRet)


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ GLTAtuSIX³ Autor ³ TOTVS                 ³ Data ³ 00/00/00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao de processamento da gravacao do SIX.                ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Implantacao Gestao do Leite.                               ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GLTAtuSIX()

Local cTexto := ''
Local lSIX   := .F.
Local lNew   := .F.
Local aSIX   := {}
Local aEstrut:= {}
Local i      := 0
Local j      := 0
Local cAlias := ''
Local _n

aEstrut:= {"INDICE","ORDEM","CHAVE","DESCRICAO","DESCSPA","DESCENG","PROPRI","F3","NICKNAME","SHOWPESQ"}


// Cadastro De Fornecedor
If upForne
//	Aadd(aSIX,{"SA2","9","A2_FILIAL+A2_L_MATRI","Matricula","Matricula","Matricula","U","","Matricula","S"})
//	Aadd(aSIX,{"SA2","A","A2_FILIAL+A2_COD+A2_L_LINHA","Codigo+Linha","Codigo+Linha","Codigo+Linha","U","","GLTSA2_LI","S"})
EndIf

//Contas a Pagar
If upFinan
	Aadd(aSIX,{"SE2","H","E2_FILIAL+E2_L_SEEK","Seek GLT","Seek GLT","Seek GLT","U","","GLT_SE2001","S"})

EndIf

//Contas a Pagar
If upRecep
	//Aadd(aSIX,{"SD3","D","D3_FILIAL+D3_QUANT+D3_ESTORNO+D3_L_ORIG+D3_L_SETOR","Quantidade+Estornado+Ticket+Setor","Quantidade+Estornado+Ticket+Setor","Quantidade+Estornado+Ticket+Setor","U","","GLT_SD3001","S"})

EndIf


//Item da Nota de Entrada
If upNFE
	//Aadd(aSIX,{"SD1","D","D1_FILIAL+D1_L_SEEK","Seek GLT","Seek GLT","Seek GLT","U","","GLT_SD1001","S"})
EndIf

//Cadastro de Motorista
If upMotor
	Aadd(aSIX,{"ZL0","1","ZL0_FILIAL+ZL0_COD" ,"Codigo" ,"Codigo" ,"Codigo" ,"U","","","S"})
	Aadd(aSIX,{"ZL0","2","ZL0_FILIAL+ZL0_NOME","Nome"   ,"Nome"   ,"Nome"   ,"U","","","S"})
	Aadd(aSIX,{"ZL0","3","ZL0_FILIAL+ZL0_CGC" ,"CPF/CGC","CPF/CGC","CPF/CGC","U","","","S"})
EndIf

//Cadastro de Veiculo
If upVeicu
	Aadd(aSIX,{"ZL4","1","ZL4_FILIAL+ZL4_COD"              ,"Codigo"       ,"Codigo"       ,"Codigo"       ,"U","","","S"})
	Aadd(aSIX,{"ZL4","2","ZL4_FILIAL+ZL4_PLACA"            ,"Placa"        ,"Placa"        ,"Placa"        ,"U","","","S"})
	Aadd(aSIX,{"ZL4","3","ZL4_FILIAL+ZL4_MOTORI"           ,"Motorista"    ,"Motorista"    ,"Motorista"    ,"U","ZL0_01","","S"})
EndIf

//Grupo de Produtores
If upGrpPr
	Aadd(aSIX,{"ZL5","1","ZL5_FILIAL+ZL5_COD","Codigo","Codigo","Codigo","U","ZL5","","S"})
EndIf

If upSetor
	//Cadastro do Setor
	Aadd(aSIX,{"ZL2","1","ZL2_FILIAL+ZL2_COD"   ,"Codigo"   ,"Codigo"   ,"Codigo"   ,"U","","","S"})
	Aadd(aSIX,{"ZL2","2","ZL2_FILIAL+ZL2_DESCRI","Descricao","Descricao","Descricao","U","","","S"})
EndIf

//Cadastro de Linha e Rotas
If upGrupo
	//Aadd(aSIX,{"ZL3","1","ZL3_FILIAL+ZL3_COD+ZL3_TIPO","Codigo+Tipo","Codigo+Tipo","Codigo+Tipo","U","ZLF","","S"})
	Aadd(aSIX,{"ZL3","1","ZL3_FILIAL+ZL3_COD","Codigo","Codigo","Codigo","U","ZLF","","S"})
	Aadd(aSIX,{"ZL3","2","ZL3_FILIAL+ZL3_DESCRI","Descricao","Descricao","Descricao","U","","","S"})
	//Aadd(aSIX,{"ZL3","3","ZL3_FILIAL+ZL3_FRETIS+ZL3_FRETLJ","Fretista+Loja","Fretista+Loja","Fretista+Loja","U","SA2_L1","","S"})
	Aadd(aSIX,{"ZL3","3","ZL3_FILIAL+ZL3_SETOR","Setor","Setor","Setor","U","","","S"})

    Aadd(aSIX,{"ZLG","1","ZLG_FILIAL+ZLG_COD+DTOS(ZLG_VENCTO)","Codigo+Vencimento","Codigo+Vencimento","Codigo+Vencimento","U","ZLF","","S"})
EndIf

//Prefixo do evento
If upPreEv
	Aadd(aSIX,{"ZL6","1","ZL6_FILIAL+ZL6_COD","Codigo","Codigo","Codigo","U","ZL6","","S"})
EndIf

//Grupo de eventos do leite
If upGrpEv
	Aadd(aSIX,{"ZL7","1","ZL7_FILIAL+ZL7_COD","Codigo","Codigo","Codigo","U","ZL7","","S"})
	//Aadd(aSIX,{"ZL7","2","ZL7_FILIAL+ZL7_DEBCRE+ZL7_COD","Debit/Credit+Codigo","Debit/Credit+Codigo","Debit/Credit+Codigo","U","ZL7","","S"})
EndIf

//Cadastro de Eventos do leite
If upEvent
	Aadd(aSIX,{"ZL8","1","ZL8_FILIAL+ZL8_COD"          ,"Codigo","Codigo","Codigo","U","ZL8","","S"})
	Aadd(aSIX,{"ZL8","2","ZL8_FILIAL+ZL8_DESCRI"       ,"Descricao","Descricao","Descricao","U","","","S"})
	Aadd(aSIX,{"ZL8","3","ZL8_FILIAL+ZL8_GRUPO+ZL8_COD","Grupo+Codigo","Grupo+Codigo","Grupo+Codigo","U","","","S"})
	Aadd(aSIX,{"ZL8","4","ZL8_FILIAL+ZL8_PRIORI"       ,"Seq. Prioridade","Seq. Prioridade","Seq. Prioridade","U","","","S"})
EndIf

//Cadstro de Tipos de Analise
If upTpAna
	Aadd(aSIX,{"ZL9","1","ZL9_FILIAL+ZL9_COD"   ,"Codigo"   ,"Codigo"   ,"Codigo"   ,"U","ZL9","","S"})
	Aadd(aSIX,{"ZL9","2","ZL9_FILIAL+ZL9_DESCRI","Descricao","Descricao","Descricao","U","","","S"})
EndIf

//Cadstro de Faixa de Qualidade
If upFxQua
	Aadd(aSIX,{"ZLA","1","ZLA_FILIAL+ZLA_SETOR+ZLA_COD+ZLA_SEQ","Setor+Codigo+Sequencial","Setor+Codigo+Sequencial","Setor+Codigo+Sequencial","U","ZL2","","S"})
	Aadd(aSIX,{"ZLA","2","ZLA_FILIAL+ZLA_DCRSET","Descricao do Setor","Descricao Setor","Descricao Setor","U","","","S"})
	Aadd(aSIX,{"ZLA","3","ZLA_FILIAL+ZLA_DCRANA","Descricao Tp. Analise","Descricao Tp. Analise","Descricao Tp. Analise","U","","","S"})
EndIf

//Cadstro de Analise de Qualidade
If upAnali
	Aadd(aSIX,{"ZLB","1","ZLB_FILIAL+ZLB_RETIRO+ZLB_RETILJ+DTOS(ZLB_DATA)","Cod. Produtor+Loja+Data","Cod. Produtor+Loja+Data","Cod. Produtor+Loja+Data","U","SA2_L4","","S"})
	Aadd(aSIX,{"ZLB","2","ZLB_FILIAL+ZLB_SETOR+DTOS(ZLB_DATA)+ZLB_LAUDO+ZLB_HORA","Setor+Data+Laudo+Hora","Setor+Data+Laudo+Hora","Setor+Data+Laudo+Hora","U","ZL2","","S"})
    Aadd(aSIX,{"ZLB","3","ZLB_FILIAL+ZLB_SETOR+ZLB_RETIRO+ZLB_RETILJ+ZLB_TIPOFX+DTOS(ZLB_DATA)","Setor+Cod. Produtor+Loja+Tipo Faixa+Data","Setor+Cod. Produtor+Loja+Tipo Faixa+Data","Setor+Cod. Produtor+Loja+Tipo Faixa+Data","U","SA2_L4","","S"})
    Aadd(aSIX,{"ZLB","4","ZLB_FILIAL+ZLB_DCRRET","Nome Produtor","Nome Produtor","U","","","S"})
EndIf

//Desvio de Rota
If upRecep
	Aadd(aSIX,{"ZLC","1","ZLC_FILIAL+ZLC_TICKET+ZLC_DTCOLE+ZLC_SETOR+ZLC_LINROT+ZLC_FRETIS+ZLC_LJFRET+ZLC_FORPAG","Ticket+Data+Setor+Linha+Fretista+Loja+FormPagto","Ticket+Data+Setor+Linha+Fretista+Loja+FormPagto","Ticket+Data+Setor+Linha+Fretista+Loja+FormPagto","U","ZLC","","S"})
	Aadd(aSIX,{"ZLC","2","ZLC_FILIAL+ZLC_DTCOLE+ZLC_SETOR+ZLC_LINROT+ZLC_FRETIS+ZLC_LJFRET","Data+Setor+Linha+Fretista+Loja","Data+Setor+Linha+Fretista+Loja","Data+Setor+Linha+Fretista+Loja","U","ZLC","","S"})
EndIf

//Cadastro Recepacao de Leite
If upRecep
	Aadd(aSIX,{"ZLD","1","ZLD_FILIAL+ZLD_CODREC"                      ,"Codigo"              ,"Codigo"              ,"Codigo"              ,"U","ZLD","","S"})
	Aadd(aSIX,{"ZLD","2","ZLD_FILIAL+ZLD_CODREC+ZLD_RETIRO+ZLD_RETILJ","Codigo+Retiro+Loja"  ,"Codigo+Retiro+Loja"  ,"Codigo+Retiro+Loja"  ,"U","ZLD","","S"})
	Aadd(aSIX,{"ZLD","3","ZLD_FILIAL+ZLD_TICKET+ZLD_FRETIS+ZLD_LJFRET","Ticket+Fretista+Loja","Ticket+Fretista+Loja","Ticket+Fretista+Loja","U","ZLD","","S"})
	Aadd(aSIX,{"ZLD","4","ZLD_FILIAL+ZLD_RETIRO+ZLD_RETILJ+ZLD_DTCOLE","Produtor+Loja+Data Coleta","Produtor+Loja+Data Coleta","Produtor+Loja+Data Coleta","U","ZLD","","S"})
	Aadd(aSIX,{"ZLD","5","ZLD_FILIAL+ZLD_DCRRET+ZLD_DTCOLE"           ,"Nome Produtor+Data Coleta","Nome Produtor+Data Coleta","Nome Produtor+Data Coleta","U","ZLD","","S"})
    Aadd(aSIX,{"ZLD","6","ZLD_FILIAL+ZLD_QTDBOM"                      ,"Qtde Leite Produtor"      ,"Qtde Leite Produtor"      ,"Qtde Leite Produtor"      ,"U","ZLD","","S"})
    Aadd(aSIX,{"ZLD","7","ZLD_FILIAL+ZLD_DTCOLE"                      ,"Data Coleta"              ,"Data Coleta"              ,"Data Coleta"              ,"U","ZLD","","S"})


EndIf

If upRecep
	Aadd(aSIX,{"ZLH","1","ZLH_FILIAL+ZLH_COD","Codigo","Codigo","Codigo","U","ZLH","","S"})
	Aadd(aSIX,{"ZLH","2","ZLH_FILIAL+ZLH_DESCRI","Descricao","Descricao","Descricao","U","ZLH","","S"})
EndIf


//Saldo do Incentivo a Producao
If upRecep
//	Aadd(aSIX,{"ZLX","1","ZLX_FILIAL+ZLX_PRODUT+ZLX_DATA","Produtor+Data","Produtor+Data","Produtor+Data","U","ZLX","","S"})
EndIf

//Cabecalho do Mix
If upMix
	Aadd(aSIX,{"ZLE","1","ZLE_FILIAL+ZLE_COD+ZLE_VERSAO","Codigo+Versao","Codigo+Versao","Codigo+Versao","U","ZLE","","S"})

	//Itens do Mix do leite
	Aadd(aSIX,{"ZLF","1","ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_RETIRO+ZLF_RETILJ+ZLF_EVENTO+ZLF_SEQ","Codigo+Versao+Ret/Frt+Loja+Evento+Sequencia","Codigo+Versao+Ret/Frt+Loja+Evento+Sequencia","Codigo+Versao+Ret/Frt+Loja+Evento+Sequencia","U","ZLF","","S"})
	Aadd(aSIX,{"ZLF","2","ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_LINROT+ZLF_RETIRO+ZLF_RETILJ+ZLF_EVENTO","Codigo+Lin/Rota+Ret/Frt+Loja+Evento","Codigo+Lin/Rota+Ret/Frt+Loja+Evento","Codigo+Lin/Rota+Ret/Frt+Loja+Evento","U","ZLF","","S"})
	Aadd(aSIX,{"ZLF","3","ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_SETOR+ZLF_LINROT+ZLF_EVENTO+ZLF_RETIRO+ZLF_RETILJ","Codigo+Setor+Linha+Evento+Ret/Frt+Loja","Codigo+Setor+Linha+Evento+Ret/Frt+Loja","Codigo+Setor+Linha+Evento+Ret/Frt+Loja","U","ZLF","","S"})
	Aadd(aSIX,{"ZLF","4","ZLF_FILIAL+ZLF_L_SEEK" ,"Seek GLT","Seek GLT","Seek GLT","U","","","S"})
	Aadd(aSIX,{"ZLF","5","ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_SETOR+ZLF_LINROT+ZLF_EVENTO+ZLF_A2COD+ZLF_A2LOJA+ZLF_RETIRO+ZLF_RETILJ","Codigo+Setor+Evento+Fretista+Loja+Produtor+Loja","Codigo+Setor+Evento+Fretista+Loja+Produtor+Loja","Codigo+Setor+Evento+Fretista+Loja+Produtor+Loja","U","ZLF","","S"})
EndIf

If upFret
	Aadd(aSIX,{"ZLI","1","ZLI_FILIAL+ZLI_PERIOD","Periodo","Periodo","Periodo","U","ZLI","","S"})
EndI


//Lancamento de Convenios
If upConve
	Aadd(aSIX,{"ZLL","1","ZLL_FILIAL+ZLL_COD+ZLL_SEQ","Codigo+Sequencia","Codigo+Sequencia","Codigo+Sequencia","U","ZLL","","S"})
	Aadd(aSIX,{"ZLL","2","ZLL_FILIAL+ZLL_CONVEN+ZLL_LJCONV+ZLL_RETIRO+ZLL_RETILJ","Convenio+Loja Conv+Retiro+Loja Retiro","Convenio+Loja Conv+Retiro+Loja Retiro","Convenio+Loja Conv+Retiro+Loja Retiro","U","ZLL","","S"})
EndIf


//solicitacao de emprestimo
If upEmpre
	Aadd(aSIX,{"ZLM","1","ZLM_FILIAL+ZLM_COD","Codigo","Codigo","Codigo","U","ZLM","","S"})
	Aadd(aSIX,{"ZLM","2","ZLM_FILIAL+ZLM_SA2COD+ZLM_SA2LJ","Produtor+Loja","Fornecedor+Loja","Fornecedor+Loja","U","ZLM","","S"})
	Aadd(aSIX,{"ZLM","3","ZLM_FILIAL+ZLM_SA2NOM","Nome","Nome","Nome","U","ZLM","","S"})
	Aadd(aSIX,{"ZLM","4","ZLM_FILIAL+STR(ZLM_VLRPAR)","Vlr.Parcela","Vlr.Parcela","Vlr.Parcela","U","ZLM","","S"})
	//Itens solicitacao de emprestimo
	Aadd(aSIX,{"ZLO","1","ZLO_FILIAL+ZLO_COD+ZLO_ITEM","Codigo+Item","Codigo+Item","Codigo+Item","U","ZLO","","S"})
EndIf


// Permissao de Acessos de Usuarios
If upUsuar
	Aadd(aSIX,{"ZLU","1","ZLU_FILIAL+ZLU_USER","User","User","User","U","ZLU","","S"})
EndIf

//Cadastro de Tanques
If upTanq
	Aadd(aSIX,{"ZLS","1","ZLS_FILIAL+ZLS_COD","Codigo","Codigo","Codigo","U","ZLS","","S"})
	Aadd(aSIX,{"ZLT","1","ZLT_FILIAL+ZLT_COD+ZLT_SA2COD+ZLT_SA2LJ","Codigo + Agregado + Loja","Codigo + Agregado + Loja","Codigo + Agregado + Loja","U","ZLT","","S"})
Endif

If upLinha
	Aadd(aSIX,{"ZLW","1","ZLW_FILIAL+ZLW_COD+ZLW_TIPO","Codigo+Tipo","Codigo+Tipo","Codigo+Tipo","U","","","S"})
	Aadd(aSIX,{"ZLW","2","ZLW_FILIAL+ZLW_DESCRI","Descricao","Descricao","Descricao","U","","","S"})
	Aadd(aSIX,{"ZLW","3","ZLW_FILIAL+ZLW_FRETIS+ZLW_FRETLJ","Fretista+Loja","Fretista+Loja","Fretista+Loja","U","","","S"})
	Aadd(aSIX,{"ZLW","4","ZLW_FILIAL+ZLW_COD+ZLW_VERSAO","Codigo+Versao","Codigo+Versao","Codigo+Versao","U","","","S"})

	Aadd(aSIX,{"ZLY","1","ZLY_FILIAL+ZLY_ROTA","Rota","Rota","Rota","U","","","S"})
	Aadd(aSIX,{"ZLY","2","ZLY_FILIAL+ZLY_DESROT","Descri Rota","Descri Rota","Descri Rota","U","","","S"})
	Aadd(aSIX,{"ZLY","3","ZLY_FILIAL+ZLY_ROTA+ZLY_VERSAO","Rota+Versao","Rota+Versao","Rota+Versao","U","","","S"})

	Aadd(aSIX,{"ZLZ","1","ZLZ_FILIAL+ZLZ_ROTA","Rota","Rota","Rota","U","","","S"})
	Aadd(aSIX,{"ZLZ","2","ZLZ_FILIAL+ZLZ_CODPRO","Produtor","Produtor","Produtor","U","","","S"})
	Aadd(aSIX,{"ZLZ","3","ZLZ_FILIAL+ZLZ_ROTA+ZLZ_CODPRO+ZLZ_LJPROD","Rota+Produtor+Loja Produt","U","","","S"})
EndIF

//Saldo do Incentivo a Producao
If upConfig
	Aadd(aSIX,{"ZL1","1","ZL1_FILIAL+ZL1_LETRA","Filial+Marca","Filial+Marca","Filial+Marca","U","ZL1","","S"})
EndIf

// marcosilva - capal    
If upPInct      
//	ZP0 – Programas: onde todos os programas deverão ser cadastrados;
	Aadd(aSIX,{"ZP0","1","ZP0_FILIAL+ZP0_COD","Programa","Programa","Programa","U","ZP0","","S"})
	Aadd(aSIX,{"ZP0","2","ZP0_FILIAL+ZP0_DESCR","Descrição","Descrição","Descrição","U","ZP0","","S"})	

//	ZP1 – Parâmetros de Programas: onde os valores dos parâmetros (descritos na tabela anterior) são informados;
	Aadd(aSIX,{"ZP1","1","ZP1_FILIAL+ZP1_COD","Programa","Programa","Programa","U","ZP0","","S"})
	Aadd(aSIX,{"ZP1","2","ZP1_FILIAL+ZP1_DTINIV","Vigência","Vigência","Vigência","U","ZP0","","S"})	

//	ZP2 – Subsídio de Programas: onde os valores de subsídios (caso exista subsídio para o programa) são informados;
	Aadd(aSIX,{"ZP2","1","ZP2_FILIAL+ZP2_COD","Programa","Programa","Programa","U","ZP2","","S"})

//	ZP3 – Valores de Programas: onde os valores a serem pagos por cooperados/mês/programa são gravados;
	Aadd(aSIX,{"ZP3","1","ZP3_FILIAL+ZP3_COD+ZP3_PERIOD","Programa+AnoMes","Programa+AnoMes","Programa+AnoMes","U","ZP3","","S"})
	Aadd(aSIX,{"ZP3","2","ZP3_FILIAL+ZP3_CODCOO+ZP3_LJCOO+ZP3_COD+ZP3_PERIOD","Cooperado+Loja+Programa+AnoMes","Cooperado+Loja+Programa+AnoMes","Cooperado+Loja+Programa+AnoMes","U","ZP3","","S"})	

//	ZP4 – Movimentação de Produtores: responsável por registrar as entradas e saídas de produtores por programa;
	Aadd(aSIX,{"ZP4","1","ZP4_FILIAL+ZP4_COD","Programa","Programa","Programa","U","ZP4","","S"})
	Aadd(aSIX,{"ZP4","2","ZP4_FILIAL+ZP4_CODCOO+ZP4_LJCOO","Cooperado+Loja","Cooperado+Loja","Cooperado+Loja","U","ZP4","","S"})	

//	ZP5 – Visitas Técnicas: responsável por registrar as visitas realizadas por programa;
	Aadd(aSIX,{"ZP5","1","ZP5_FILIAL+ZP5_COD","Programa","Programa","Programa","U","ZP5","","S"})
	Aadd(aSIX,{"ZP5","2","ZP5_FILIAL+ZP5_CODCOO+ZP5_LJCOO","Cooperado+Loja","Cooperado+Loja","Cooperado+Loja","U","ZP5","","S"})	

//	ZP6 – Registro de Inseminações: responsável por controlar inseminações realizadas e também as já bonificadas;
	Aadd(aSIX,{"ZP6","1","ZP6_FILIAL+ZP6_PERIOD","Período","Período","Período","U","ZP6","","S"})
	Aadd(aSIX,{"ZP6","2","ZP6_FILIAL+ZP6_CODCOO+ZP6_LJCOO","Cooperado+Loja","Cooperado+Loja","Cooperado+Loja","U","ZP6","","S"})	
EndIf
// fim - marcosilva - capal    

ProcRegua(Len(aSIX))
dbSelectArea("SIX")
dbSetOrder(1)

For i:= 1 To Len(aSIX)
	If !Empty(aSIX[i,1])
		If !dbSeek(aSIX[i,1]+aSIX[i,2])
			lNew:= .T.
		Else
			lNew:= .F.
		EndIf

		If lNew.Or.UPPER(Alltrim(aSIX[i,3]))!=UPPER(AllTrim(CHAVE))
			aAdd(aArqUpd,aSIX[i,1])
			lSIX := .T.
			If !(aSIX[i,1]$cAlias)
				cAlias += aSIX[i,1]+"/"
			EndIf

			cTexto  += (aSix[i][1] + " - " + aSix[i][3] + Chr(13) + Chr(10))

			RecLock("SIX",lNew)
			For j:=1 To Len(aSIX[i])
				If FieldPos(aEstrut[j])>0
					FieldPut(FieldPos(aEstrut[j]),aSIX[i,j])
				EndIf
			Next j
			dbCommit()
			MsUnLock()
		EndIf
	EndIf
Next i

If lSIX
	cTexto := "Indices atualizados  : " + cAlias + CHR(13) + CHR(10) + cTexto
EndIf

Return cTexto

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ GLTAtuSX7³ Autor ³ TOTVS                 ³ Data ³ 00/00/00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao de processamento da gravacao do SX7.                ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Implantacao Gestao do Leite.                               ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GLTAtuSX7()

Local aSX7   := {}
Local aEstrut:= {}
Local i      := 0
Local j      := 0
// GATILHOS
aEstrut:= {"X7_CAMPO","X7_SEQUENC","X7_REGRA","X7_CDOMIN","X7_TIPO","X7_SEEK","X7_ALIAS","X7_ORDEM","X7_CHAVE","X7_CONDIC","X7_PROPRI"}

//Cadastro de Fornecedor
If upForne
	aAdd(aSX7, {"A2_L_TPFOR","001","U_GCFG001()"	   ,"A2_COD"     	,"P","N",""   ,1,"","","U"}) 
	//aAdd(aSX7, {"A2_L_LI_RO","001",'ZL3->ZL3_TIPO'    ,"A2_L_TP_LR"     ,"P","S","ZL3",1,'xFILIAL("ZL3")+M->A2_L_LI_RO',"","U"})
    aAdd(aSX7, {"A2_L_ADICI","001",'M->A2_L_ADICI'    ,"A2_L_BKPAD"     ,"P","N",""   ,1,"","","U"})
	//aAdd(aSX7, {"A2_L_CDASS","001","M->A2_L_CDASS"    ,"A2_COD"         ,"P","N",""   ,0,"","","U"})
	//aAdd(aSX7, {"A2_L_CDASS","002","U_RetLojaFor(M->A2_COD)","A2_LOJA"  ,"P","N","",0,"","","U"})
	aAdd(aSX7, {"A2_L_PREVI","001",'(GetMv("LT_VLRPREV")/2)',"A2_L_VLRPR"  ,"P","N","",0,"","","U"})
EndIf

/*if upClien
	aAdd(aSX7, {"A1_L_TPCLI","001","U_GCFG005()"	   ,"A1_COD"     	,"P","N",""   ,1,"","","U"})
EndIf*/

If upMotor
	aAdd(aSX7, {"ZL0_MUN   ","001","CC2->CC2_MUN" ,"ZL0_CMUN"  ,"P","S","CC2",1,'xFILIAL("CC2")+M->ZL0_EST+M->ZL0_MUN',"","U"})
	aAdd(aSX7, {"ZL0_FRETIS","001","SA2->A2_LOJA" ,"ZL0_FRETLJ","P","S","SA2",1,'xFILIAL("SA2")+M->ZL0_FRETIS',"","U"})
	aAdd(aSX7, {"ZL0_FRETIS","002","SA2->A2_NOME" ,"ZL0_NOMEFR","P","S","SA2",1,'xFILIAL("SA2")+M->ZL0_FRETIS',"","U"})
	aAdd(aSX7, {"ZL0_FRETLJ","001","SA2->A2_NOME" ,"ZL0_NOMEFR","P","S","SA2",1,'xFILIAL("SA2")+M->ZL0_FRETIS+M->ZL0_FRETLJ',"","U"})
EndIf

//Cadastro de Veiculo
If upVeicu
	aAdd(aSX7, {"ZL4_MOTORI","001","ZL0->ZL0_NOME","ZL4_NOME  ","P","S","ZL0",1,'xFILIAL("ZL0")+M->ZL4_MOTORI',"","U"})
EndIf

//Cadastro de Linhas
/* Comentado pela exclusao do campo ZL3_FRETIS,ZL3_FRETLJ
If upGrupo
	aAdd(aSX7, {"ZL3_FRETIS","001","SA2->A2_LOJA" ,"ZL3_FRETLJ","P","S","SA2",1,'xFILIAL("SA2")+M->ZL3_FRETIS',"","U"})
	aAdd(aSX7, {"ZL3_FRETIS","002","SA2->A2_NOME" ,"ZL3_NOMEFR","P","S","SA2",1,'xFILIAL("SA2")+M->ZL3_FRETIS',"","U"})
    aAdd(aSX7, {"ZL3_FRETIS","003","Space(6)"     ,"ZL3_VEICUL","P","N","",0,"","","U"})
	aAdd(aSX7, {"ZL3_FRETLJ","001","SA2->A2_NOME" ,"ZL3_NOMEFR","P","S","SA2",1,'xFILIAL("SA2")+M->ZL3_FRETIS+M->ZL3_FRETLJ',"","U"})
	aAdd(aSX7, {"ZL3_FRETLJ","002","Space(6)"     ,"ZL3_VEICUL","P","N","",0,"","","U"})
EndIf*/

//Cadastro de Faixa de Qualidade
If upFxQua
	aAdd(aSX7, {"ZLA_SETOR ","001","ZL2->ZL2_DESCRI","ZLA_DCRSET","P","S","ZL2",1,'xFILIAL("ZL2")+M->ZLA_SETOR',"","U"})
	aAdd(aSX7, {"ZLA_COD   ","001","ZL9->ZL9_DESCRI","ZLA_DCRANA","P","S","ZL9",1,'xFILIAL("ZL9")+M->ZLA_COD',"","U"})
	aAdd(aSX7, {"ZLA_COD   ","002",'U_AtuSeq("ZLA",1,xFILIAL("ZLA")+M->ZLA_SETOR+M->ZLA_COD,28,"ZLA_SEQ")',"ZLA_SEQ","P","N","",0,"","","U"})
EndIf

//Cadastro de Analise de Qualidade
If upAnali
	aAdd(aSX7, {"ZLB_SETOR ","001","ZL2->ZL2_DESCRI","ZLB_DCRSET","P","S","ZL2",1,'xFILIAL("ZL2")+M->ZLB_SETOR',"","U"})
	aAdd(aSX7, {"ZLB_RETIRO","001","SA2->A2_LOJA"   ,"ZLB_RETILJ","P","S","SA2",1,'xFILIAL("SA2")+M->ZLB_RETIRO',"","U"})
	aAdd(aSX7, {"ZLB_RETIRO","002","SA2->A2_NOME"   ,"ZLB_DCRRET","P","S","SA2",1,'xFILIAL("SA2")+M->ZLB_RETIRO+M->ZLB_RETILJ',"","U"})
	aAdd(aSX7, {"ZLB_RETILJ","001","SA2->A2_NOME"   ,"ZLB_DCRRET","P","S","SA2",1,'xFILIAL("SA2")+M->ZLB_RETIRO',"","U"})
	aAdd(aSX7, {"ZLB_TIPOFX","001","ZL9->ZL9_DESCRI","ZLB_DCRTPF","P","S","ZL9",1,'xFILIAL("ZL9")+M->ZLB_TIPOFX',"","U"})
EndIf

//Desvio de Rota
If upRecep
	aAdd(aSX7, {"ZLC_FRETIS","001","SA2->A2_LOJA" ,"ZLC_LJFRET","P","S","SA2",1,'xFILIAL("SA2")+M->ZLC_FRETIS',"","U"})
	aAdd(aSX7, {"ZLC_FRETIS","002","SA2->A2_NOME" ,"ZLC_DCRFRT","P","S","SA2",1,'xFILIAL("SA2")+M->ZLC_FRETIS+M->ZLC_LJFRET',"","U"})
EndIf

//Recepcao de leite
If upRecep
	//aAdd(aSX7, {"ZLD_RETIRO","001",'IIF(SA2->A2_L_CLASS!="N","T","L")',"ZLD_TQ_LT","P","S","SA2",1,'xFILIAL("SA2")+M->ZLD_RETIRO+M->ZLD_RETILJ',"","U"})
	//aAdd(aSX7, {"ZLD_RETILJ","001",'IIF(SA2->A2_L_CLASS!="N","T","L")',"ZLD_TQ_LT","P","S","SA2",1,'xFILIAL("SA2")+M->ZLD_RETIRO+M->ZLD_RETILJ',"","U"})
	aAdd(aSX7, {"ZLD_QTDBOM","001",'nLeiteBom:=U_GetTotCol(),nLtDIf := nTotBom-nLeiteBom,oLteBom:Refresh(),oDif:Refresh()',"ZLD_TOTBOM","P","N","",0,"","","U"})
	aAdd(aSX7, {"ZLD_RETIRO","001",'POSICIONE("SA2",1,XFILIAL("SA2")+M->ZLD_RETIRO,"A2_L_TRIBU")',"ZLD_TRIBUT","P","N","SA2",0,"","","U"})
	aAdd(aSX7, {"ZLD_RETIRO","002",'POSICIONE("SA2",1,XFILIAL("SA2")+M->ZLD_RETIRO+M->ZLD_RETILJ,"A2_L_LI_RO")',"ZLD_GRPRC","P","N","SA2",0,"","","U"})
	aAdd(aSX7, {"ZLD_RETILJ","001",'POSICIONE("SA2",1,XFILIAL("SA2")+M->ZLD_RETIRO+M->ZLD_RETILJ,"A2_L_TRIBU")',"ZLD_TRIBUT","P","N","SA2",0,"","","U"})
	aAdd(aSX7, {"ZLD_LINROT","001",'U_GetVerRot(M->ZLD_LINROT)',"ZLD_VERSAO","P","N","",0,"","","U"})
	aAdd(aSX7, {"ZLD_LINROT","002",'POSICIONE("ZLW",1,XFILIAL("ZLW")+M->ZLD_LINROT,"ZLW_DESCRI")',"ZLD_DESLIN","P","N","",0,"","","U"})
	aEstrut:= {"X7_CAMPO","X7_SEQUENC","X7_REGRA","X7_CDOMIN","X7_TIPO","X7_SEEK","X7_ALIAS","X7_ORDEM","X7_CHAVE","X7_CONDIC","X7_PROPRI"}
EndIf

//Lancamentos dos convenios
If upConve
	aAdd(aSX7, {"ZLL_RETIRO","001","SA2->A2_LOJA"   ,"ZLL_RETILJ","P","S","SA2",1,'xFILIAL("SA2")+M->ZLL_RETIRO',"","U"})
	aAdd(aSX7, {"ZLL_RETIRO","002","SA2->A2_NOME"   ,"ZLL_DCRRET","P","S","SA2",1,'xFILIAL("SA2")+M->ZLL_RETIRO',"","U"})
	aAdd(aSX7, {"ZLL_RETILJ","001","SA2->A2_NOME"   ,"ZLL_DCRRET","P","S","SA2",1,'xFILIAL("SA2")+M->ZLL_RETIRO+M->ZLL_RETILJ',"","U"})
	aAdd(aSX7, {"ZLL_PARCEL","001","U_PARCELAZLL()" ,"ZLL_PARCEL","P","N","",0,"","","U"})
EndIf

// SOLIC. EMPRESTIMO
If upEmpre
	//aAdd(aSX7, {"ZLM_SA2COD","001","SA2->A2_LOJA" ,"ZLM_SA2LJ","P","S","SA2",1,'xFILIAL("SA2")+M->ZLM_SA2COD',"","U"})
	aAdd(aSX7, {"ZLM_SA2COD","001",'POSICIONE("SA2",1,xFILIAL("SA2")+M->ZLM_SA2COD+M->ZLM_SA2LJ,"A2_NOME")',"ZLM_SA2NOM","P","N","",1,"","","U"})
	//aAdd(aSX7, {"ZLM_SA2COD","002","U_GetSetor(M->ZLM_SA2COD,M->ZLM_SA2LJ)" ,"ZLM_SETOR","P","N","",0,"","","U"})
	aAdd(aSX7, {"ZLM_SA2COD","002","U_GetFilEnt(M->ZLM_SA2COD,M->ZLM_SA2LJ,dDataBase)" ,"ZLM_FILENT","P","N","",0,"","","U"})
	//aAdd(aSX7, {"ZLM_SA2LJ ","001","U_GetSetor(M->ZLM_SA2COD,M->ZLM_SA2LJ)" ,"ZLM_SETOR","P","N","",0,"","","U"})
	aAdd(aSX7, {"ZLM_SA2LJ ","001",'POSICIONE("SA2",1,xFILIAL("SA2")+M->ZLM_SA2COD+M->ZLM_SA2LJ,"A2_NOME")',"ZLM_SA2NOM","P","N","",1,"","","U"})
    aAdd(aSX7, {"ZLM_SA2LJ ","002","U_GetFilEnt(M->ZLM_SA2COD,M->ZLM_SA2LJ,dDataBase)" ,"ZLM_FILENT","P","N","",0,"","","U"})
	aAdd(aSX7, {"ZLM_TOTAL ","001","U_GLT_012JR()","ZLM_PAGTO","P","N","",0,"","","U"})
	aAdd(aSX7, {"ZLM_PARC  ","001","U_GLT_012JR()","ZLM_PAGTO","P","N","",0,"","","U"})
	aAdd(aSX7, {"ZLM_JUROS ","001","U_GLT_012JR()","ZLM_PAGTO","P","N","",0,"","","U"})
	aAdd(aSX7, {"ZLM_VENCTO","001","U_GLT_012JR()","ZLM_PAGTO","P","N","",0,"","","U"})
EndIf

//Itens do Mix
If upMix
	aAdd(aSX7, {"ZLF_EVENTO","001",'POSICIONE("ZL8",1,xFILIAL("ZL8")+M->ZLF_EVENTO,"ZL8_DESCRI")',"ZLF_DCREVE","P","N","",1,"","","U"})
	aAdd(aSX7, {"ZLF_EVENTO","002",'POSICIONE("ZL8",1,xFILIAL("ZL8")+M->ZLF_EVENTO,"ZL8_DEBCRE")',"ZLF_DEBCRE","P","N","",1,"","","U"})
	aAdd(aSX7, {"ZLF_RETIRO","001",'U_GCFG003("ZLF_RETIRO")',"ZLF_RETIRO","P","N","",0,"","","U"})
	aAdd(aSX7, {"ZLF_RETILJ","001",'U_GCFG003("ZLF_RETILJ")',"ZLF_RETILJ","P","N","",0,"","","U"})
EndIf

//Tanques
If upTanq
	aAdd(aSX7, {"ZLS_TPRES","001","0","ZLS_TXRES","P","N","",0,"","M->ZLS_TPRES<>'F'","U"})
	aAdd(aSX7, {"ZLS_TPFRT","001","0","ZLS_TXFRT","P","N","",0,"","M->ZLS_TPRES=='N'","U"})

	aAdd(aSX7, {"ZLT_SA2COD","001","SA2->A2_NOME" ,"ZLT_SA2NOM","P","S","SA2",1,'xFILIAL("SA2")+M->ZLT_SA2COD',"","U"})
    aAdd(aSX7, {"ZLT_SA2LJ ","001","SA2->A2_NOME" ,"ZLT_SA2NOM","P","S","SA2",1,'xFILIAL("SA2")+M->ZLT_SA2COD+M->ZLT_SA2LJ',"","U"})
EndIf

If upLinha
	aAdd(aSX7, {"ZLW_FRETIS","001","SA2->A2_LOJA" ,"ZLW_FRETLJ","P","S","SA2",1,'xFILIAL("SA2")+M->ZLW_FRETIS',"","U"})
	aAdd(aSX7, {"ZLW_FRETIS","002","SA2->A2_NOME" ,"ZLW_NOMEFR","P","S","SA2",1,'xFILIAL("SA2")+M->ZLW_FRETIS',"","U"})
    aAdd(aSX7, {"ZLW_FRETIS","003","Space(6)"     ,"ZLW_VEICUL","P","N","",0,"","","U"})
	aAdd(aSX7, {"ZLW_FRETLJ","001","SA2->A2_NOME" ,"ZLW_NOMEFR","P","S","SA2",1,'xFILIAL("SA2")+M->ZLW_FRETIS+M->ZLW_FRETLJ',"","U"})
	aAdd(aSX7, {"ZLW_FRETLJ","002","Space(6)"     ,"ZLW_VEICUL","P","N","",0,"","","U"})

	aAdd(aSX7, {"ZLY_ROTA","001","ZLW->ZLW_DESCRI" ,"ZLY_DESROT","P","S","ZLW",1,'xFILIAL("ZLW")+M->ZLY_ROTA',"","U"})
	aAdd(aSX7, {"ZLY_ROTA","002","ZLW->ZLW_NOMEFR" ,"ZLY_NOMEFR","P","S","ZLW",1,'xFILIAL("ZLW")+M->ZLY_ROTA',"","U"})
	aAdd(aSX7, {"ZLY_ROTA","003","U_GCFG004(2)"      ,"ZLY_VERSAO"     	,"P","N",""   ,1,"","","U"})
	//aAdd(aSX7, {"ZLY_ROTA","003","ZLW->ZLW_VERSAO" ,"ZLY_VERSAO","P","S","ZLW",1,'xFILIAL("ZLW")+M->ZLY_ROTA',"","U"})
	aAdd(aSX7, {"ZLY_ROTA","004","DATE()" ,"ZLY_DATINI","P","S","ZLW",1,'xFILIAL("ZLW")+M->ZLY_ROTA',"","U"})

	aAdd(aSX7, {"ZLZ_CODPRO","001","SA2->A2_NOME" ,"ZLZ_NOMEPR","P","S","SA2",1,'xFILIAL("SA2")+M->ZLZ_CODPRO',"","U"})
	aAdd(aSX7, {"ZLZ_CODPRO","002","SA2->A2_LOJA" ,"ZLZ_LJPROD","P","S","SA2",1,'xFILIAL("SA2")+M->ZLZ_CODPRO',"","U"})

EndIf

ProcRegua(Len(aSX7))

dbSelectArea("SX7")
dbSetOrder(1)
For i:= 1 To Len(aSX7)
	If !Empty(aSX7[i][1])
		If !dbSeek(Padr(aSX7[i,1],10)+aSX7[i,2])
			RecLock("SX7",.T.)

			For j:=1 To Len(aSX7[i])
				If !Empty(FieldName(FieldPos(aEstrut[j])))
					FieldPut(FieldPos(aEstrut[j]),aSX7[i,j])
				EndIf
			Next j

			dbCommit()
			MsUnLock()
		EndIf
	EndIf
Next i

Return(.T.)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ GLTAtuSXB³ Autor ³ TOTVS                 ³ Data ³ 00/00/00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao de processamento da gravacao do SXB.                ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Implantacao Gestao do Leite.                               ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GLTAtuSXB()

Local aSXB   := {}
Local aEstrut:= {}
Local i      := 0
Local j      := 0

aEstrut:= {"XB_ALIAS","XB_TIPO","XB_SEQ","XB_COLUNA","XB_DESCRI","XB_DESCSPA","XB_DESCENG","XB_CONTEM","XB_WCONTEM"}

//Consulta Fretista no cadastro de linhas e veiculos
If upGrupo .or. upVeicu
	aAdd(aSXB, {"SA2_L1","1","01","DB","Transp. G","Transp. G","Transp. G","SA2",""})
	aAdd(aSXB, {"SA2_L1","2","01","02","Nome","Nombre","Name","",""})
	aAdd(aSXB, {"SA2_L1","2","02","01","Codigo","Codigo","Code","",""})
	aAdd(aSXB, {"SA2_L1","2","03","03","CNPJ/CPF","CNPJ/CPF","CNPJ/CPF","",""})
	aAdd(aSXB, {"SA2_L1","4","01","01","Codigo","Codigo","Code","A2_COD",""})
	aAdd(aSXB, {"SA2_L1","4","01","02","Loja"  ,"Tienda","Unit","A2_LOJA",""})
	aAdd(aSXB, {"SA2_L1","4","01","03","Nome"  ,"Nombre","Name","Substr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_L1","4","02","01","Codigo","Codigo","Code","A2_COD",""})
	aAdd(aSXB, {"SA2_L1","4","02","02","Loja"  ,"Tienda","Unit","A2_LOJA",""})
	aAdd(aSXB, {"SA2_L1","4","02","03","Nome"  ,"Nombre","Name","Substr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_L1","4","03","01","CNPJ/CPF","CNPJ/CPF","CNPJ/CPF","A2_CGC",""})
	aAdd(aSXB, {"SA2_L1","4","03","02","Nome"    ,"Nombre"  ,"Name"    ,"SubStr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_L1","5","01","","","","","SA2->A2_COD",""})
	aAdd(aSXB, {"SA2_L1","5","02","","","","","SA2->A2_LOJA",""})
	aAdd(aSXB, {"SA2_L1","6","01","01","","","",'SA2->A2_L_TPFOR $ "T" .AND. SA2->A2_MSBLQL<>"1" ',""}) // Filtro //#LETRAS
	//aAdd(aSXB, {"SA2_L1","6","01","01","","","",'SA2->A2_C_TPFOR $ &(READVAR())',""}) // Filtro //#LETRAS
	//aAdd(aSXB, {"SA2_L1","6","01","","","","",'SA2->A2_C_TPFOR $ U_GETRELA1("1","ZL1_GRANEL") .AND. SA2->A2_MSBLQL<>"1" ',""})                        // Filtro //#LETRAS
EndIf

If upRecep
	//Consulta Padrao usada na tela Recepcao de Leite - Filtra Linha Rota
	aAdd(aSXB, {"SA2_L2","1","01","DB","SA2_L2  ","SA2_L2   ","SA2_L2   ","SA2",""})
	aAdd(aSXB, {"SA2_L2","2","01","02","Razao Social + Loja","Razon Social + Tiend","Name + Unit","",""})
	aAdd(aSXB, {"SA2_L2","2","02","01","Codigo + Loja"   ,"Codigo + Tienda","Supplier + Unit","",""})        // Colunas
	aAdd(aSXB, {"SA2_L2","4","01","01","Codigo","Codigo","Codigo","A2_COD",""}) // Colunas
	aAdd(aSXB, {"SA2_L2","4","01","02","Loja","Loja","Loja","A2_LOJA",""}) // Colunas
	aAdd(aSXB, {"SA2_L2","4","01","03","Razao Social","Razao Social","Razao Social","A2_NOME",""}) // Colunas
	aAdd(aSXB, {"SA2_L2","4","02","01","Codigo","Codigo","Codigo","A2_COD",""}) // Colunas
	aAdd(aSXB, {"SA2_L2","4","02","02","Loja","Loja","Loja","A2_LOJA",""}) // Colunas
	aAdd(aSXB, {"SA2_L2","4","02","03","Razao Social","Razao Social","Razao Social","A2_NOME",""}) // Colunas
	aAdd(aSXB, {"SA2_L2","5","01","","","","","SA2->A2_COD",""})                        // Retorno
	aAdd(aSXB, {"SA2_L2","5","02","","","","","SA2->A2_LOJA",""})                        // Retorno
	//aAdd(aSXB, {"SA2_L2","6","01","","","","","U_filtroLR()",""})                        // Filtro
EndIf

//Consulta Padrao usada na tela Recepcao de Leite - Filtra fornecedores iniciados com G - para Fretista
/*If upRecep - - Substituida pela SA2_L1
	aAdd(aSXB, {"SA2_L3","1","01","DB","Granel Recepcao  ","Granel Recepcao  ","Granel Recepcao  ","SA2",""})
	aAdd(aSXB, {"SA2_L3","2","01","02","Razao Social + Loja","Razon Social + Tiend","Name + Unit","",""})
	aAdd(aSXB, {"SA2_L3","2","02","01","Codigo + Loja"   ,"Codigo + Tienda","Supplier + Unit","",""})        // Colunas
	aAdd(aSXB, {"SA2_L3","4","01","01","Codigo","Codigo","Codigo","A2_COD",""}) // Colunas
	aAdd(aSXB, {"SA2_L3","4","01","02","Loja","Loja","Loja","A2_LOJA",""}) // Colunas
	aAdd(aSXB, {"SA2_L3","4","01","03","Razao Social","Razao Social","Razao Social","A2_NOME",""}) // Colunas
	aAdd(aSXB, {"SA2_L3","4","02","01","Codigo","Codigo","Codigo","A2_COD",""}) // Colunas
	aAdd(aSXB, {"SA2_L3","4","02","02","Loja","Loja","Loja","A2_LOJA",""}) // Colunas
	aAdd(aSXB, {"SA2_L3","4","02","03","Razao Social","Razao Social","Razao Social","A2_NOME",""}) // Colunas
	aAdd(aSXB, {"SA2_L3","5","01","","","","","SA2->A2_COD",""})                        // Retorno
	aAdd(aSXB, {"SA2_L3","5","02","","","","","SA2->A2_LOJA",""})                        // Retorno
	aAdd(aSXB, {"SA2_L3","6","01","","","","",'SA2->A2_C_TPFOR $ "G" ',""})                        // Filtro //#LETRAS   
EndIf*/

//Consulta Retiro
If upAnali .or. upConve .or. upEmpre .or. upForne
	aAdd(aSXB, {"SA2_L4","1","01","DB","Produtor","Produtor","Produtor","SA2",""})
	aAdd(aSXB, {"SA2_L4","2","01","02","Nome","Nombre","Name","",""})
	aAdd(aSXB, {"SA2_L4","2","02","01","Codigo","Codigo","Code","",""})
	aAdd(aSXB, {"SA2_L4","2","03","03","CNPJ/CPF","CNPJ/CPF","CNPJ/CPF","",""})
	aAdd(aSXB, {"SA2_L4","4","01","01","Codigo","Codigo","Code","A2_COD",""})
	aAdd(aSXB, {"SA2_L4","4","01","02","Loja"  ,"Tienda","Unit","A2_LOJA",""})
	aAdd(aSXB, {"SA2_L4","4","01","03","Nome"  ,"Nombre","Name","Substr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_L4","4","02","01","Codigo","Codigo","Code","A2_COD",""})
	aAdd(aSXB, {"SA2_L4","4","02","02","Loja"  ,"Tienda","Unit","A2_LOJA",""})
	aAdd(aSXB, {"SA2_L4","4","02","03","Nome"  ,"Nombre","Name","Substr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_L4","4","03","01","CNPJ/CPF","CNPJ/CPF","CNPJ/CPF","A2_CGC",""})
	aAdd(aSXB, {"SA2_L4","5","01","","","","","SA2->A2_COD",""})
	aAdd(aSXB, {"SA2_L4","5","02","","","","","SA2->A2_LOJA",""})
	//aAdd(aSXB, {"SA2_L4","6","01","","","","",'SA2->A2_C_TPFOR $ U_GETRELA1("1","ZL1_PLEITE") .AND. SA2->A2_MSBLQL<>"1"  ',""})
	aAdd(aSXB, {"SA2_L4","6","01","01","","","",'SA2->A2_L_TPFOR $ "P" ',""}) // Filtro   //#LETRAS
	//aAdd(aSXB, {"SA2_L4","6","01","01","","","",'SA2->A2_C_TPFOR $ U_GETRELA1("1","ZL1_PLEITE")',""}) // Filtro   //#LETRAS
EndIf

//Consulta Fornecedor ( Convenios )
If upConve
	aAdd(aSXB, {"SA2_L5","1","01","DB","Fornec.","Fornec.","Fornec.","SA2",""})
	aAdd(aSXB, {"SA2_L5","2","01","02","Razao Social + Loja","Razon Social + Tiend","Name + Unit","",""})
	aAdd(aSXB, {"SA2_L5","2","02","01","Codigo + Loja"   ,"Codigo + Tienda","Supplier + Unit","",""})        // Colunas
	aAdd(aSXB, {"SA2_L5","4","01","01","Codigo","Codigo","Codigo","A2_COD",""}) // Colunas
	aAdd(aSXB, {"SA2_L5","4","01","02","Loja","Loja","Loja","A2_LOJA",""}) // Colunas
	aAdd(aSXB, {"SA2_L5","4","01","03","Razao Social","Razao Social","Razao Social","A2_NOME",""}) // Colunas
	aAdd(aSXB, {"SA2_L5","4","02","01","Codigo","Codigo","Codigo","A2_COD",""}) // Colunas
	aAdd(aSXB, {"SA2_L5","4","02","02","Loja","Loja","Loja","A2_LOJA",""}) // Colunas
	aAdd(aSXB, {"SA2_L5","4","02","03","Razao Social","Razao Social","Razao Social","A2_NOME",""}) // Colunas
	aAdd(aSXB, {"SA2_L5","5","01","","","","","SA2->A2_COD",""})                        // Retorno
	aAdd(aSXB, {"SA2_L5","5","02","","","","","SA2->A2_LOJA",""})                        // Retorno
	//AAdd(aSXB, {"SA2_L5","6","01","01","","","",'SubStr(SA2->A2_COD,1,1)==""',""}) // Filtro //#LETRAS
	//aAdd(aSXB, {"SA2_L5","6","01","","","","",'SA2->A2_C_TPFOR $ U_GETRELA1("1","ZL1_CONCVE") .AND. SA2->A2_MSBLQL<>"1"  ',""})
	//aAdd(aSXB, {"SA2_L5","6","01","01","","","",'SA2->A2_C_TPFOR $ U_GETRELA1("1","ZL1_CONCVE")',""}) // Filtro //#LETRAS
EndIf

//Consulta Fornecedor ( emprestimos )
If upEmpre  .or. upConve
	aAdd(aSXB, {"SA2_L6","1","01","DB","Prd/Trans","Prd/Trans","Prd/Trans","SA2",""})
	aAdd(aSXB, {"SA2_L6","2","01","02","Razao Social + Loja","Razon Social + Tiend","Name + Unit","",""})
	aAdd(aSXB, {"SA2_L6","2","02","01","Codigo + Loja"   ,"Codigo + Tienda","Supplier + Unit","",""})        // Colunas
	aAdd(aSXB, {"SA2_L6","4","01","01","Codigo","Codigo","Codigo","A2_COD",""}) // Colunas
	aAdd(aSXB, {"SA2_L6","4","01","02","Loja","Loja","Loja","A2_LOJA",""}) // Colunas
	aAdd(aSXB, {"SA2_L6","4","01","03","Razao Social","Razao Social","Razao Social","A2_NOME",""}) // Colunas
	aAdd(aSXB, {"SA2_L6","4","02","01","Codigo","Codigo","Codigo","A2_COD",""}) // Colunas
	aAdd(aSXB, {"SA2_L6","4","02","02","Loja","Loja","Loja","A2_LOJA",""}) // Colunas
	aAdd(aSXB, {"SA2_L6","4","02","03","Razao Social","Razao Social","Razao Social","A2_NOME",""}) // Colunas
	aAdd(aSXB, {"SA2_L6","5","01","","","","","SA2->A2_COD",""})                        // Retorno
	aAdd(aSXB, {"SA2_L6","5","02","","","","","SA2->A2_LOJA",""})                        // Retorno
	//aAdd(aSXB, {"SA2_L6","6","01","01","","","",'SubStr(SA2->A2_COD,1,1)=="C" .or. SubStr(SA2->A2_COD,1,1)=="G" ',""}) // Filtro
	aAdd(aSXB, {"SA2_L6","6","01","01","","","",'SA2->A2_L_TPFOR $ "P/T" .AND.SA2->A2_MSBLQL<>"1"',""}) // Filtro //#LETRAS
	//aAdd(aSXB, {"SA2_L6","6","01","","","","",'SA2->A2_C_TPFOR $ U_GETRELA1("1","ZL1_EMPRES") .AND. SA2->A2_MSBLQL<>"1"  ',""})
EndIf

//Consulta Fornecedor(Empresa conveniada) de convenios
If upConve
	aAdd(aSXB, {"Fornec","1","01","DB","Fornecedor","Fornecedor","Fornecedor","SA2",""})
	aAdd(aSXB, {"Fornec","2","01","02","Razao Social + Loja","Razon Social + Tiend","Name + Unit","",""})
	aAdd(aSXB, {"Fornec","2","02","01","Codigo + Loja"   ,"Codigo + Tienda","Supplier + Unit","",""})        // Colunas
	aAdd(aSXB, {"Fornec","4","01","01","Codigo","Codigo","Codigo","A2_COD",""}) // Colunas
	aAdd(aSXB, {"Fornec","4","01","02","Loja","Loja","Loja","A2_LOJA",""}) // Colunas
	aAdd(aSXB, {"Fornec","4","01","03","Razao Social","Razao Social","Razao Social","A2_NOME",""}) // Colunas
	aAdd(aSXB, {"Fornec","4","02","01","Codigo","Codigo","Codigo","A2_COD",""}) // Colunas
	aAdd(aSXB, {"Fornec","4","02","02","Loja","Loja","Loja","A2_LOJA",""}) // Colunas
	aAdd(aSXB, {"Fornec","4","02","03","Razao Social","Razao Social","Razao Social","A2_NOME",""}) // Colunas
	aAdd(aSXB, {"Fornec","5","01","","","","","SA2->A2_COD",""})                        // Retorno
	aAdd(aSXB, {"Fornec","5","02","","","","","SA2->A2_LOJA",""})                        // Retorno
	aAdd(aSXB, {"Fornec","6","01","01","","","",'SA2->A2_L_TPFOR $ "F" .AND. &_cFiltroF3ZLL .AND. SA2->A2_MSBLQL <> "1"',""}) // Filtro //#LETRAS
	//aAdd(aSXB, {"SA2_L7","6","01","01","","","",'SA2->A2_C_TPFOR $ U_GETRELA1("1","ZL1_FORCVE").AND. &_cFiltroF3ZLL .AND. SA2->A2_MSBLQL <> "1"  ',""}) // Filtro //#LETRAS


	aAdd(aSXB, {"SA2_LB","1","01","DB","Produtor","Produtor","Produtor","SA2",""})
	aAdd(aSXB, {"SA2_LB","2","01","02","Nome","Nombre","Name","",""})
	aAdd(aSXB, {"SA2_LB","2","02","01","Codigo","Codigo","Code","",""})
	aAdd(aSXB, {"SA2_LB","2","03","03","CNPJ/CPF","CNPJ/CPF","CNPJ/CPF","",""})
	aAdd(aSXB, {"SA2_LB","4","01","01","Codigo","Codigo","Code","A2_COD",""})
	aAdd(aSXB, {"SA2_LB","4","01","02","Loja"  ,"Tienda","Unit","A2_LOJA",""})
	aAdd(aSXB, {"SA2_LB","4","01","03","Nome"  ,"Nombre","Name","Substr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_LB","4","02","01","Codigo","Codigo","Code","A2_COD",""})
	aAdd(aSXB, {"SA2_LB","4","02","02","Loja"  ,"Tienda","Unit","A2_LOJA",""})
	aAdd(aSXB, {"SA2_LB","4","02","03","Nome"  ,"Nombre","Name","Substr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_LB","4","03","01","CNPJ/CPF","CNPJ/CPF","CNPJ/CPF","A2_CGC",""})
	aAdd(aSXB, {"SA2_LB","4","03","02","Nome"    ,"Nombre"  ,"Name"    ,"SubStr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_LB","5","01","","","","","SA2->A2_COD",""})
	//aAdd(aSXB, {"SA2_LB","5","02","","","","","SA2->A2_LOJA",""})
	//aAdd(aSXB, {"SA2_LB","6","01","01","","","",'SA2->A2_C_TPFOR $ "P" .AND. U_TitTq(SA2->A2_COD,SA2->A2_LOJA)=="S"',""}) // Filtro //#LETRAS
	aAdd(aSXB, {"SA2_LB","6","01","01","","","",'SA2->A2_L_ASSOC == "S" .AND. SA2->A2_LOJA == "01" .AND. SA2->A2_MSBLQL <> "1"',""}) // Filtro //#LETRAS
	//aAdd(aSXB, {"SA2_LB","6","01","01","","","",'SA2->A2_C_TPFOR $ U_GETRELA1("1","ZL1_PLEITE") .AND. U_TitTq(SA2->A2_COD,SA2->A2_LOJA)=="S" .AND. SA2->A2_MSBLQL <> "1"  ',""}) // Filtro //#LETRAS
EndIf

//Consulta Retiro na Recepcao de Leite
If upRecep
	aAdd(aSXB, {"SA2_L8","1","01","DB","Produtor","Produtor","Produtor","SA2",""})
	aAdd(aSXB, {"SA2_L8","2","01","02","Nome","Nombre","Name","",""})
	aAdd(aSXB, {"SA2_L8","2","02","01","Codigo","Codigo","Code","",""})
	aAdd(aSXB, {"SA2_L8","2","03","03","CNPJ/CPF","CNPJ/CPF","CNPJ/CPF","",""})
	aAdd(aSXB, {"SA2_L8","4","01","01","Codigo","Codigo","Code","A2_COD",""})
	aAdd(aSXB, {"SA2_L8","4","01","02","Loja"  ,"Tienda","Unit","A2_LOJA",""})
	aAdd(aSXB, {"SA2_L8","4","01","03","Nome"  ,"Nombre","Name","Substr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_L8","4","01","04","Grupo Preco","Grupo Preco","Grupo Preco","A2_L_LI_RO",""})
	aAdd(aSXB, {"SA2_L8","4","01","05","Fazenda"   ,"Fazenda"   ,"Fazenda"   ,"A2_L_FAZEN",""})
	aAdd(aSXB, {"SA2_L8","4","02","01","Codigo","Codigo","Code","A2_COD",""})
	aAdd(aSXB, {"SA2_L8","4","02","02","Loja"  ,"Tienda","Unit","A2_LOJA",""})
	aAdd(aSXB, {"SA2_L8","4","02","03","Nome"  ,"Nombre","Name","Substr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_L8","4","03","01","CNPJ/CPF","CNPJ/CPF","CNPJ/CPF","A2_CGC",""})
	aAdd(aSXB, {"SA2_L8","4","03","02","Nome"    ,"Nombre"  ,"Name"    ,"SubStr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_L8","5","01","","","","","SA2->A2_COD",""})
	aAdd(aSXB, {"SA2_L8","5","02","","","","","SA2->A2_LOJA",""})
	aAdd(aSXB, {"SA2_L8","5","03","","","","","SA2->A2_NOME",""})
	aAdd(aSXB, {"SA2_L8","5","04","","","","","SA2->A2_L_LI_RO",""})
	//aAdd(aSXB, {"SA2_L8","6","01","01","","","",'SubStr(SA2->A2_COD,1,1)=="C".And.SA2->A2_L_LI_RO==cLinRot',""}) // Filtro
	aAdd(aSXB, {"SA2_L8","6","01","01","","","",'SA2->A2_L_TPFOR $ "P"',""}) // Filtro //#LETRAS
	//aAdd(aSXB, {"SA2_L8","6","01","01","","","",'SA2->A2_C_TPFOR $ U_GETRELA1("1","ZL1_PLEITE") .AND. SA2->A2_MSBLQL <> "1"  ',""}) // Filtro //#LETRAS
EndIf


//Fechamento
If upFect
	aAdd(aSXB, {"SA2_L9","1","01","DB","Produtor","Produtor","Produtor","SA2",""})
	aAdd(aSXB, {"SA2_L9","2","01","02","Nome","Nombre","Name","",""})
	aAdd(aSXB, {"SA2_L9","2","02","01","Codigo","Codigo","Code","",""})
	aAdd(aSXB, {"SA2_L9","2","03","03","CNPJ/CPF","CNPJ/CPF","CNPJ/CPF","",""})
	aAdd(aSXB, {"SA2_L9","4","01","01","Codigo","Codigo","Code","A2_COD",""})
	aAdd(aSXB, {"SA2_L9","4","01","02","Loja"  ,"Tienda","Unit","A2_LOJA",""})
	aAdd(aSXB, {"SA2_L9","4","01","03","Nome"  ,"Nombre","Name","Substr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_L9","4","02","01","Codigo","Codigo","Code","A2_COD",""})
	aAdd(aSXB, {"SA2_L9","4","02","02","Loja"  ,"Tienda","Unit","A2_LOJA",""})
	aAdd(aSXB, {"SA2_L9","4","02","03","Nome"  ,"Nombre","Name","Substr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_L9","4","03","01","CNPJ/CPF","CNPJ/CPF","CNPJ/CPF","A2_CGC",""})
	aAdd(aSXB, {"SA2_L9","4","03","02","Nome"    ,"Nombre"  ,"Name"    ,"SubStr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_L9","5","01","","","","","SA2->A2_COD",""})
	aAdd(aSXB, {"SA2_L9","6","01","01","","","",'SA2->A2_L_TPFOR $ "P/G/T"',""}) // Filtro  //#LETRAS
	//aAdd(aSXB, {"SA2_L9","6","01","01","","","",'SA2->A2_C_TPFOR $ U_GETRELA1("1","ZL1_EVENTO") .AND. SA2->A2_MSBLQL <> "1"  ',""}) // Filtro //#LETRAS
EndIf

//Fechamento - Substituida pela SA2_L1
/*If upFect
	aAdd(aSXB, {"SA2_LA","1","01","DB","SA2_LA  ","SA2_LA   ","SA2_LA   ","SA2",""})
	aAdd(aSXB, {"SA2_LA","2","01","02","Razao Social + Loja","Razon Social + Tiend","Name + Unit","",""})
	aAdd(aSXB, {"SA2_LA","2","02","01","Codigo + Loja"   ,"Codigo + Tienda","Supplier + Unit","",""})        // Colunas
	aAdd(aSXB, {"SA2_LA","4","01","01","Codigo","Codigo","Codigo","A2_COD",""}) // Colunas
	aAdd(aSXB, {"SA2_LA","4","01","02","Loja","Loja","Loja","A2_LOJA",""}) // Colunas
	aAdd(aSXB, {"SA2_LA","4","01","03","Razao Social","Razao Social","Razao Social","A2_NOME",""}) // Colunas
	aAdd(aSXB, {"SA2_LA","4","02","01","Codigo","Codigo","Codigo","A2_COD",""}) // Colunas
	aAdd(aSXB, {"SA2_LA","4","02","02","Loja","Loja","Loja","A2_LOJA",""}) // Colunas
	aAdd(aSXB, {"SA2_LA","4","02","03","Razao Social","Razao Social","Razao Social","A2_NOME",""}) // Colunas
	aAdd(aSXB, {"SA2_LA","5","01","","","","","SA2->A2_COD",""})                        // Retorno
	//aAdd(aSXB, {"SA2_LA","6","01","","","","",'SA2->A2_C_TPFOR $ "G" ',""})                        // Filtro //#LETRAS
	aAdd(aSXB, {"SA2_LA","6","01","","","","",'SA2->A2_C_TPFOR $ U_GETRELA1("1","ZL1_GRANEL") .AND. SA2->A2_MSBLQL <> "1"  ',""}) // Filtro //#LETRAS
EndIf*/

//Fechamento
If upFect
	aAdd(aSXB, {"SA2_LC","1","01","DB","Cooperado/Granel/Fun","Cooperado/Granel/Fun","Cooperado/Granel/Fun","SA2",""})
	aAdd(aSXB, {"SA2_LC","2","01","02","Nome","Nombre","Name","",""})
	aAdd(aSXB, {"SA2_LC","2","02","01","Codigo","Codigo","Code","",""})
	aAdd(aSXB, {"SA2_LC","2","03","03","CNPJ/CPF","CNPJ/CPF","CNPJ/CPF","",""})
	aAdd(aSXB, {"SA2_LC","4","01","01","Codigo","Codigo","Code","A2_COD",""})
	aAdd(aSXB, {"SA2_LC","4","01","02","Loja"  ,"Tienda","Unit","A2_LOJA",""})
	aAdd(aSXB, {"SA2_LC","4","01","03","Nome"  ,"Nombre","Name","Substr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_LC","4","02","01","Codigo","Codigo","Code","A2_COD",""})
	aAdd(aSXB, {"SA2_LC","4","02","02","Loja"  ,"Tienda","Unit","A2_LOJA",""})
	aAdd(aSXB, {"SA2_LC","4","02","03","Nome"  ,"Nombre","Name","Substr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_LC","4","03","01","CNPJ/CPF","CNPJ/CPF","CNPJ/CPF","A2_CGC",""})
	aAdd(aSXB, {"SA2_LC","4","03","02","Nome"    ,"Nombre"  ,"Name"    ,"SubStr(A2_NOME,1,30)",""})
	aAdd(aSXB, {"SA2_LC","5","01","","","","","SA2->A2_COD",""})
	aAdd(aSXB, {"SA2_LC","6","01","01","","","",'SA2->A2_L_TPFOR $ "P/E/G"',""}) // Filtro  //#LETRAS
	//aAdd(aSXB, {"SA2_LC","6","01","01","","","",'SA2->A2_C_TPFOR $ U_GETRELA1("1","ZL1_CCORRE") .AND. SA2->A2_MSBLQL <> "1"  ',""}) // Filtro //#LETRAS 
EndIf

//Consulta ARMAZENS
If upSetor
/*
	aAdd(aSXB, {"ZA4_L1","1","01","DB","Armazens","Armazens","Armazens","ZA4",""})
	aAdd(aSXB, {"ZA4_L1","2","01","01","Armazem","Armazem","Armazem","",""})
	aAdd(aSXB, {"ZA4_L1","4","01","01","Armazem"   ,"Armazem"   ,"Armazem" ,"ZA4_ARMAZ",""})   // Colunas
	aAdd(aSXB, {"ZA4_L1","4","01","02","Descricao","Descricao","Descricao","ZA4_DESC",""})  // Colunas
	aAdd(aSXB, {"ZA4_L1","5","01","","","","","ZA4->ZA4_COD",""})
*/
EndIf

//Consulta Motorista
If upVeicu
	aAdd(aSXB, {"ZL0_01","1","01","DB","Motorista","Motorista","Motorista","ZL0",""})
	aAdd(aSXB, {"ZL0_01","2","01","02","Nome"     ,"Nombre","Name","",""})
	aAdd(aSXB, {"ZL0_01","2","02","01","Codigo"   ,"Codigo","Code","",""})
	aAdd(aSXB, {"ZL0_01","4","01","01","Codigo"   ,"Codigo","Code","ZL0_COD",""})
	aAdd(aSXB, {"ZL0_01","4","01","02","Nome"     ,"Nombre","Name","Substr(ZL0_NOME,1,30)",""})
	aAdd(aSXB, {"ZL0_01","4","01","03","CPF/CNPJ" ,"CPF/CNPJ","CPF/CNPJ","ZL0_CGC",""})
	aAdd(aSXB, {"ZL0_01","4","02","01","Codigo"   ,"Codigo","Code","ZL0_COD",""})
	aAdd(aSXB, {"ZL0_01","4","02","02","Nome"     ,"Nombre","Name","Substr(ZL0_NOME,1,30)",""})
	aAdd(aSXB, {"ZL0_01","4","02","03","CPF/CNPJ" ,"CPF/CNPJ","CPF/CNPJ","ZL0_CGC",""})
	aAdd(aSXB, {"ZL0_01","5","01","","","","","ZL0->ZL0_COD",""})
EndIf

//Consulta Motorista na recepcao de leite
If upRecep
	aAdd(aSXB, {"ZL0_02","1","01","DB","Motorista","Motorista","Motorista","ZL0",""})
	aAdd(aSXB, {"ZL0_02","2","01","02","Nome"     ,"Nombre","Name","",""})
	aAdd(aSXB, {"ZL0_02","2","02","01","Codigo"   ,"Codigo","Code","",""})
	aAdd(aSXB, {"ZL0_02","4","01","01","Codigo"   ,"Codigo","Code","ZL0_COD",""})
	aAdd(aSXB, {"ZL0_02","4","01","02","Nome"     ,"Nombre","Name","Substr(ZL0_NOME,1,30)",""})
	aAdd(aSXB, {"ZL0_02","4","01","03","CPF/CNPJ" ,"CPF/CNPJ","CPF/CNPJ","ZL0_CGC",""})
	aAdd(aSXB, {"ZL0_02","4","02","01","Codigo"   ,"Codigo","Code","ZL0_COD",""})
	aAdd(aSXB, {"ZL0_02","4","02","02","Nome"     ,"Nombre","Name","Substr(ZL0_NOME,1,30)",""})
	aAdd(aSXB, {"ZL0_02","4","02","03","CPF/CNPJ" ,"CPF/CNPJ","CPF/CNPJ","ZL0_CGC",""})
	aAdd(aSXB, {"ZL0_02","5","01","","","","","ZL0->ZL0_COD",""})
	aAdd(aSXB, {"ZL0_02","6","01","01","","","",'ZL0->ZL0_FRETIS = cFretist',""}) // Filtro
EndIf

//Consulta Municipio para Motorista na recepcao de leite
If upRecep
	aAdd(aSXB, {"ZL0_03","1","01","DB","Municipios Forneced.","Municipios Forneced.","Municipios Forneced.","CC2"            ,""})
    aAdd(aSXB, {"ZL0_03","1","02","DB","Municipios Forneced.","Municipios Forneced.","Municipios Forneced.","CC2"            ,""})
	aAdd(aSXB, {"ZL0_03","2","01","01","Estado+cod.IBGE     ","Estado+cod.IBGE     ","Estado+cod.IBGE     ",""               ,""})
	aAdd(aSXB, {"ZL0_03","2","02","02","Municipio           ","Municipio           ","Municipio           ",""               ,""})
	aAdd(aSXB, {"ZL0_03","4","01","01","Estado              ","Estado              ","Estado              ","CC2_EST"        ,""})
	aAdd(aSXB, {"ZL0_03","4","01","02","Cod.IBGE            ","Cod.IBGE            ","Cod.IBGE            ","CC2_CODMUN"     ,""})
	aAdd(aSXB, {"ZL0_03","4","01","03","Municipio           ","Municipio           ","Municipio           ","CC2_MUN"        ,""})
    aAdd(aSXB, {"ZL0_03","4","02","01","Estado              ","Estado              ","Estado              ","CC2_EST"        ,""})
    aAdd(aSXB, {"ZL0_03","4","02","02","Cod.IBGE            ","Cod.IBGE            ","Cod.IBGE            ","CC2_CODMUN"     ,""})
	aAdd(aSXB, {"ZL0_03","4","02","03","Municipio           ","Municipio           ","Municipio           ","CC2_MUN"        ,""})
    aAdd(aSXB, {"ZL0_03","4","02","04","Estado              ","Estado              ","Estado              ","CC2_EST"        ,""})
    aAdd(aSXB, {"ZL0_03","4","02","05","Cod.IBGE            ","Cod.IBGE            ","Cod.IBGE            ","CC2_CODMUN"     ,""})
	aAdd(aSXB, {"ZL0_03","4","02","06","Municipio           ","Municipio           ","Municipio           ","CC2_MUN"        ,""})
	aAdd(aSXB, {"ZL0_03","5","01","  ","                    ","                    ","                    ","CC2->CC2_CODMUN",""})
	aAdd(aSXB, {"ZL0_03","5","02","  ","                    ","                    ","                    ","CC2->CC2_CODMUN",""})
	aAdd(aSXB, {"ZL0_03","6","01","  ","                    ","                    ","                    ","CC2->CC2_EST==M->ZL0_EST",""})
	aAdd(aSXB, {"ZL0_03","6","02","  ","                    ","                    ","                    ","CC2->CC2_EST==M->ZL0_EST",""})
EndIf

//Consulta Setor
If upSetor
	aAdd(aSXB, {"ZL2_01","1","01","DB","Setor    ","Setor    ","Setor    ","ZL2",""})
	aAdd(aSXB, {"ZL2_01","2","01","02","Descricao","Descri","Descri","",""})
	aAdd(aSXB, {"ZL2_01","2","02","01","Codigo"   ,"Codigo","Code","",""})
	aAdd(aSXB, {"ZL2_01","4","01","01","Codigo"   ,"Codigo","Code"     ,"ZL2_COD",""})
	aAdd(aSXB, {"ZL2_01","4","01","02","Descricao","Descri","Descricao","ZL2_DESCRI",""})
	aAdd(aSXB, {"ZL2_01","4","01","03","Local"    ,"Local" ,"Local"    ,"ZL2_LOCAL",""})
	aAdd(aSXB, {"ZL2_01","4","02","01","Codigo"   ,"Codigo","Code"     ,"ZL2_COD",""})
	aAdd(aSXB, {"ZL2_01","4","02","02","Descricao","Descri","Descricao","ZL2_DESCRI",""})
	aAdd(aSXB, {"ZL2_01","4","02","03","Local"    ,"Local" ,"Local"    ,"ZL2_LOCAL",""})
	aAdd(aSXB, {"ZL2_01","5","01","","","","","ZL2->ZL2_COD",""})
	aAdd(aSXB, {"ZL2_01","6","01","","","","",'&(U_filSetor("ZL2_COD"))',""})
EndIf

//Consulta Setor sem filtra (usada no Bordero)
If upSetor
	aAdd(aSXB, {"ZL2_02","1","01","DB","Setor    ","Setor    ","Setor    ","ZL2",""})
	aAdd(aSXB, {"ZL2_02","2","01","02","Descricao","Descri","Descri","",""})
	aAdd(aSXB, {"ZL2_02","2","02","01","Codigo"   ,"Codigo","Code","",""})
	aAdd(aSXB, {"ZL2_02","4","01","01","Codigo"   ,"Codigo","Code"     ,"ZL2_COD",""})
	aAdd(aSXB, {"ZL2_02","4","01","02","Descricao","Descri","Descricao","ZL2_DESCRI",""})
	aAdd(aSXB, {"ZL2_02","4","01","03","Local"    ,"Local" ,"Local"    ,"ZL2_LOCAL",""})
	aAdd(aSXB, {"ZL2_02","4","02","01","Codigo"   ,"Codigo","Code"     ,"ZL2_COD",""})
	aAdd(aSXB, {"ZL2_02","4","02","02","Descricao","Descri","Descricao","ZL2_DESCRI",""})
	aAdd(aSXB, {"ZL2_02","4","02","03","Local"    ,"Local" ,"Local"    ,"ZL2_LOCAL",""})
	aAdd(aSXB, {"ZL2_02","5","01","","","","","ZL2->ZL2_COD",""})
EndIf


//Consulta Grupo de Preco
If upGrupo
	aAdd(aSXB, {"ZL3_01","1","01","DB","GrupoPreco ","GrupoPreco","GrupoPreco","ZL3",""})
	aAdd(aSXB, {"ZL3_01","2","01","02","Descricao","Descricao","Descricao","",""})
	aAdd(aSXB, {"ZL3_01","2","02","01","Codigo"   ,"Codigo","Code","",""})
	aAdd(aSXB, {"ZL3_01","4","01","01","Codigo"   ,"Codigo"   ,"Code" ,"ZL3_COD",""})   // Colunas
	//aAdd(aSXB, {"ZL3_01","4","01","02","Tipo"     ,"Tipo  "   ,"Tipo" ,"ZL3_TIPO",""})  // Colunas
	aAdd(aSXB, {"ZL3_01","4","01","03","Descricao","Descricao","Desc" ,"ZL3_DESCRI",""})// Colunas
	aAdd(aSXB, {"ZL3_01","4","01","04","Setor"    ,"Setor"    ,"Setor","ZL3_SETOR",""}) // Colunas
	//aAdd(aSXB, {"ZL3_01","4","01","05","Veiculo"  ,"Veiculo"  ,"Veic" ,"ZL3_VEICUL",""})// Colunas
	aAdd(aSXB, {"ZL3_01","4","02","01","Codigo"   ,"Codigo"   ,"Code" ,"ZL3_COD",""})   // Colunas
	//aAdd(aSXB, {"ZL3_01","4","02","02","Tipo"     ,"Tipo  "   ,"Tipo" ,"ZL3_TIPO",""})  // Colunas
	aAdd(aSXB, {"ZL3_01","4","02","03","Descricao","Descricao","Desc" ,"ZL3_DESCRI",""})// Colunas
	aAdd(aSXB, {"ZL3_01","4","02","04","Setor"    ,"Setor"    ,"Setor","ZL3_SETOR",""}) // Colunas
	//aAdd(aSXB, {"ZL3_01","4","02","05","Veiculo"  ,"Veiculo"  ,"Veic" ,"ZL3_VEICUL",""})// Colunas
	aAdd(aSXB, {"ZL3_01","5","01","","","","","ZL3->ZL3_COD",""})                       // Retorno
EndIf

//Consulta Rota e Linha na recepcao de leite
If upRecep
	aAdd(aSXB, {"ZL3_02","1","01","DB","Linha Recepcao","Linha Recepcao","Linha Recepcao","ZL3",""})
	aAdd(aSXB, {"ZL3_02","2","01","02","Descricao","Descricao","Descricao","",""})
	aAdd(aSXB, {"ZL3_02","4","01","01","Codigo"   ,"Codigo"   ,"Code" ,"ZL3_COD",""})   // Colunas
	aAdd(aSXB, {"ZL3_02","4","01","02","Descricao","Descricao","Descricao","ZL3_DESCRI",""})  // Colunas
	aAdd(aSXB, {"ZL3_02","5","01","","","","","ZL3->ZL3_COD",""})
	aAdd(aSXB, {"ZL3_02","6","01","01","","","","ZL3->ZL3_SETOR=cSetor",""}) // Filtro
EndIf

//Consulta Veiculo
If upVeicu
	aAdd(aSXB, {"ZL4_01","1","01","DB","Veiculo" ,"Veiculo","Veiculo","ZL4",""})
	aAdd(aSXB, {"ZL4_01","2","01","02","Placa"   ,"Placa"  ,"Placa","",""})
	aAdd(aSXB, {"ZL4_01","2","02","01","Codigo"  ,"Codigo" ,"Codigo","",""})
	aAdd(aSXB, {"ZL4_01","4","01","01","Codigo"  ,"Codigo" ,"Code","ZL4_COD",""})
	aAdd(aSXB, {"ZL4_01","4","01","02","Placa"   ,"Placa"  ,"Placa","ZL4_PLACA",""})
	aAdd(aSXB, {"ZL4_01","4","01","03","Motorista","Motorista","Motorista","ZL4_MOTORI",""})
	aAdd(aSXB, {"ZL4_01","4","01","04","Nome"     ,"Nome"     ,"Nome"     ,"ZL4_NOME",""})
	aAdd(aSXB, {"ZL4_01","4","02","01","Codigo"  ,"Codigo" ,"Code","ZL4_COD",""})
	aAdd(aSXB, {"ZL4_01","4","02","02","Placa"   ,"Placa"  ,"Placa","ZL4_PLACA",""})
	aAdd(aSXB, {"ZL4_01","4","02","03","Motorista","Motorista","Motorista","ZL4_MOTORI",""})
	aAdd(aSXB, {"ZL4_01","4","02","04","Nome"     ,"Nome"     ,"Nome"     ,"ZL4_NOME",""})
	aAdd(aSXB, {"ZL4_01","5","01","","","","","ZL4->ZL4_COD",""})

	aAdd(aSXB, {"ZL4_02","1","01","DB","Veiculo" ,"Veiculo","Veiculo","ZL4",""})
	aAdd(aSXB, {"ZL4_02","2","01","02","Placa"   ,"Placa"  ,"Placa","",""})
	aAdd(aSXB, {"ZL4_02","2","02","01","Codigo"  ,"Codigo" ,"Codigo","",""})
	aAdd(aSXB, {"ZL4_02","4","01","01","Veiculo" ,"Veiculo","Veiculo","ZL4_COD",""})
	aAdd(aSXB, {"ZL4_02","4","01","02","Placa"   ,"Placa"  ,"Placa","ZL4_PLACA",""})
	aAdd(aSXB, {"ZL4_02","4","01","03","Motorista","Motorista","Motorista","ZL4_MOTORI",""})
	aAdd(aSXB, {"ZL4_02","4","01","04","Nome"     ,"Nome"     ,"Nome"     ,"ZL4_NOME",""})
	aAdd(aSXB, {"ZL4_02","4","02","01","Veiculo"  ,"Veiculo" ,"Code","ZL4_COD",""})
	aAdd(aSXB, {"ZL4_02","4","02","02","Placa"    ,"Placa"  ,"Placa","ZL4_PLACA",""})
	aAdd(aSXB, {"ZL4_02","4","02","03","Motorista","Motorista","Motorista","ZL4_MOTORI",""})
	aAdd(aSXB, {"ZL4_02","4","02","04","Nome"     ,"Nome"     ,"Nome"     ,"ZL4_NOME",""})
	aAdd(aSXB, {"ZL4_02","5","01","","","","","ZL4->ZL4_COD",""})
	//aAdd(aSXB, {"ZL4_02","6","01","01","","","","ZL4->ZL4_COD $ U_VeiTransp(M->ZL3_FRETIS,M->ZL3_FRETLJ)",""}) // Filtro
EndIf

//Consulta Grupo de Produtores
If upGrpPr
	aAdd(aSXB, {"ZL5_01","1","01","DB","Codigo   ","Codigo   ","Codigo   ","ZL5",""})
	aAdd(aSXB, {"ZL5_01","2","01","01","Codigo   ","Codigo   ","Codigo    ","",""})
	aAdd(aSXB, {"ZL5_01","4","01","01","Codigo"   ,"Codigo","Code","ZL5_COD",""})        // Colunas
	aAdd(aSXB, {"ZL5_01","4","01","02","Descricao","Descricao","Desc.","ZL5_DESCRI",""}) // Colunas
	aAdd(aSXB, {"ZL5_01","5","01","","","","","ZL5->ZL5_COD",""})                        // Retorno
EndIf

//Consulta prefixo de Eventos do Leite
If upPreEv
	aAdd(aSXB, {"ZL6_01","1","01","DB","Codigo   ","Codigo   ","Codigo   ","ZL6",""})
	aAdd(aSXB, {"ZL6_01","2","01","01","Codigo   ","Codigo   ","Codigo    ","",""})
	aAdd(aSXB, {"ZL6_01","4","01","01","Codigo"   ,"Codigo","Code","ZL6_COD",""})        // Colunas
	aAdd(aSXB, {"ZL6_01","4","01","02","Descricao","Descricao","Desc.","ZL6_DESCRI",""}) // Colunas
	aAdd(aSXB, {"ZL6_01","5","01","","","","","ZL6->ZL6_COD",""})                        // Retorno
EndIf

//Consulta Grupo de Eventos do Leite
If upGrpEv
	aAdd(aSXB, {"ZL7_01","1","01","DB","Codigo   ","Codigo   ","Codigo   ","ZL7",""})
	aAdd(aSXB, {"ZL7_01","2","01","01","Codigo   ","Codigo   ","Codigo    ","",""})
	aAdd(aSXB, {"ZL7_01","4","01","01","Codigo"   ,"Codigo","Code","ZL7_COD",""})        // Colunas
	aAdd(aSXB, {"ZL7_01","4","01","02","Descricao","Descricao","Desc.","ZL7_DESCRI",""}) // Colunas
	aAdd(aSXB, {"ZL7_01","5","01","","","","","ZL7->ZL7_COD",""})                        // Retorno
EndIf

//Consulta Eventos do Leite
If upEvent
	aAdd(aSXB, {"ZL8_01","1","01","DB","Codigo   ","Codigo   ","Codigo   ","ZL8",""})
	aAdd(aSXB, {"ZL8_01","2","01","02","Descricao","Descricao","Descricao","",""})
	aAdd(aSXB, {"ZL8_01","4","01","01","Codigo"   ,"Codigo","Code","ZL8_COD",""})        // Colunas
	aAdd(aSXB, {"ZL8_01","4","01","02","Descricao","Descricao","Desc.","ZL8_DESCRI",""}) // Colunas
	aAdd(aSXB, {"ZL8_01","5","01","","","","","ZL8->ZL8_COD",""})                        // Retorno

	aAdd(aSXB, {"ZL8_02","1","01","DB","Codigo   ","Codigo   ","Codigo   ","ZL8",""})
	aAdd(aSXB, {"ZL8_02","2","01","02","Descricao","Descricao","Descricao","",""})
	aAdd(aSXB, {"ZL8_02","4","01","01","Codigo"   ,"Codigo","Code","ZL8_COD",""})        // Colunas
	aAdd(aSXB, {"ZL8_02","4","01","02","Descricao","Descricao","Desc.","ZL8_DESCRI",""}) // Colunas
	aAdd(aSXB, {"ZL8_02","5","01","","","","","ZL8->ZL8_COD",""})                        // Retorno
	//aAdd(aSXB, {"ZL8_02","6","01","01","","","",'ZL8->ZL8_CONVEN=="S".AND.ZL8->ZL8_TPEVEN=="F".AND.ZL8->ZL8_PREFIX<>"".AND.ZL8->ZL8_DEBCRE=="D"',""}) // Filtro
	aAdd(aSXB, {"ZL8_02","6","01","01","","","",'ZL8->ZL8_GRUPO=="000077    ".OR.ZL8->ZL8_COD=="100021"',""}) // Filtro
EndIf

//Consulta Tipos de Analise da Qualidade
If upTpAna
	aAdd(aSXB, {"ZL9_01","1","01","DB","Analise"  ,"Analise  ","Analise  ","ZL9",""})
	aAdd(aSXB, {"ZL9_01","2","01","02","Descricao","Descricao","Descricao","",""})
	aAdd(aSXB, {"ZL9_01","2","02","01","Codigo","Codigo","Code","",""})
	aAdd(aSXB, {"ZL9_01","4","01","01","Codigo"   ,"Codigo"   ,"Code" ,"ZL9_COD",""})   // Colunas
	aAdd(aSXB, {"ZL9_01","4","01","02","Descricao","Descricao","Desc" ,"ZL9_DESCRI",""})// Colunas
	aAdd(aSXB, {"ZL9_01","4","02","01","Codigo"   ,"Codigo"   ,"Code" ,"ZL9_COD",""})   // Colunas
	aAdd(aSXB, {"ZL9_01","4","02","02","Descricao","Descricao","Desc" ,"ZL9_DESCRI",""})// Colunas
	aAdd(aSXB, {"ZL9_01","5","01","","","","","ZL9->ZL9_COD",""})                       // Retorno
EndIf

//Consulta Recepcao de Leite (usado no desvio de rota)
If upRecep
	aAdd(aSXB, {"ZLD_01","1","01","DB","Rec.Leite","Rec.Leite","Rec.Leite","ZLD",""})
	aAdd(aSXB, {"ZLD_01","2","01","03","Ticket"   ,"Ticket"   ,"Ticket"  ,"",""})
	aAdd(aSXB, {"ZLD_01","4","01","01","Ticket"   ,"Ticket"   ,"Ticket"    ,"ZLD_TICKET",""})                   // Colunas
	aAdd(aSXB, {"ZLD_01","4","01","02","Transp."  ,"Transp."  ,"Transp."   ,"ZLD_FRETIS",""}) // Colunas
	aAdd(aSXB, {"ZLD_01","4","01","03","Data  "   ,"Data  "   ,"Data  "    ,"ZLD_DTCOLE",""})                   // Colunas
	aAdd(aSXB, {"ZLD_01","5","01","","","","","ZLD->ZLD_TICKET",""})
	aAdd(aSXB, {"ZLD_01","5","02","","","","","ZLD->ZLD_DTCOLE",""})
	aAdd(aSXB, {"ZLD_01","5","03","","","","","ZLD->ZLD_SETOR",""})
	aAdd(aSXB, {"ZLD_01","5","04","","","","","ZLD->ZLD_LINROT",""})
	aAdd(aSXB, {"ZLD_01","5","05","","","","","ZLD->ZLD_FRETIS",""})
	aAdd(aSXB, {"ZLD_01","5","06","","","","","ZLD->ZLD_LJFRET",""})
	aAdd(aSXB, {"ZLD_01","5","07","","","","",'POSICIONE("SA2",1,xFILIAL("SA2")+ZLD->ZLD_FRETIS+ZLD->ZLD_LJFRET,"A2_NOME")',""})
	aAdd(aSXB, {"ZLD_01","6","01","01","","","",'&(U_filSetor("ZLD->ZLD_SETOR"))',""}) // Filtro
	
	aAdd(aSXB, {"ZLD_RO","1","01","DB","Consulta De Rota","Consulta De Rota","Consulta De Rota","ZLW",""})
	aAdd(aSXB, {"ZLD_RO","2","01","04","Codigo+versao","Codigo+versao","Codigo+versao","",""})
	aAdd(aSXB, {"ZLD_RO","4","01","01","Codigo","Codigo","Codigo","ZLW_COD",""})
	aAdd(aSXB, {"ZLD_RO","4","01","02","Versao","Versao","Versao","ZLW_VERSAO",""})
	aAdd(aSXB, {"ZLD_RO","4","01","03","Descricao","Descricao","Descricao","ZLW_DESCRI",""})
	aAdd(aSXB, {"ZLD_RO","4","01","04","Km","Km","Km","ZLW_KM",""})
	aAdd(aSXB, {"ZLD_RO","5","01","","","","","ZLW->ZLW_COD",""})
	aAdd(aSXB, {"ZLD_RO","6","01","","","","","ZLW_MSBLQL <> '1'",""})
	
EndIf

//Consulta Cadastro de Ocorrências no desvio de rotas
If upRecep
	aAdd(aSXB, {"ZLH_01","1","01","DB","Ocorrencias"  ,"Ocorrencias  ","Ocorrencias  ","ZLH",""})
	aAdd(aSXB, {"ZLH_01","2","01","02","Descricao","Descricao","Descricao","",""})
	aAdd(aSXB, {"ZLH_01","2","02","01","Codigo","Codigo","Code","",""})
	aAdd(aSXB, {"ZLH_01","4","01","01","Codigo"   ,"Codigo"   ,"Code" ,"ZLH_COD",""})   // Colunas
	aAdd(aSXB, {"ZLH_01","4","01","02","Descricao","Descricao","Desc" ,"ZLH_DESCRI",""})// Colunas
	aAdd(aSXB, {"ZLH_01","4","01","03","Alt.Pgto.","Alt.Pgto.","Alt.Pgto.","ZLH_FINANC",""})// Colunas
	aAdd(aSXB, {"ZLH_01","4","02","01","Codigo"   ,"Codigo"   ,"Code" ,"ZLH_COD",""})   // Colunas
	aAdd(aSXB, {"ZLH_01","4","02","02","Descricao","Descricao","Desc" ,"ZLH_DESCRI",""})// Colunas
	aAdd(aSXB, {"ZLH_01","4","02","03","Alt.Pgto.","Alt.Pgto.","Alt.Pgto.","ZLH_FINANC",""})// Colunas
	aAdd(aSXB, {"ZLH_01","5","01","","","","","ZLH->ZLH_COD",""})                       // Retorno
	aAdd(aSXB, {"ZLH_01","5","02","","","","","ZLH->ZLH_DESCRI",""})                       // Retorno
EndIf

//Consulta o MIX
If upMix
	aAdd(aSXB, {"ZLE_01","1","01","DB","MIX","MIX","MIX","ZLE",""})
	aAdd(aSXB, {"ZLE_01","2","01","01","Codigo"   ,"Codigo","Codigo","",""})
	aAdd(aSXB, {"ZLE_01","4","01","01","Codigo"   ,"Codigo","Code"  ,"ZLE_COD",""})                   // Colunas
	aAdd(aSXB, {"ZLE_01","4","01","02","Versao"   ,"Versao","Versao","ZLE_VERSAO",""})                   // Colunas
	aAdd(aSXB, {"ZLE_01","4","01","03","Data Inicio","Data Inicio","Data Inicio","ZLE_DTINI",""}) // Colunas
	aAdd(aSXB, {"ZLE_01","4","01","04","Data Fim"   ,"Data Fim"   ,"Data Fim"   ,"ZLE_DTFIM",""}) // Colunas
	aAdd(aSXB, {"ZLE_01","5","01","","","","","ZLE->ZLE_COD",""})                                 // Retorno
	aAdd(aSXB, {"ZLE_01","5","02","","","","","ZLE->ZLE_VERSAO",""})                                 // Retorno

	aAdd(aSXB, {"ZLE_02","1","01","DB","MIX","MIX","MIX","ZLE",""})
	aAdd(aSXB, {"ZLE_02","2","01","01","Codigo"   ,"Codigo","Codigo","",""})
	aAdd(aSXB, {"ZLE_02","4","01","01","Codigo"   ,"Codigo","Code"  ,"ZLE_COD",""})                   // Colunas
	aAdd(aSXB, {"ZLE_02","4","01","02","Data Inicio","Data Inicio","Data Inicio","ZLE_DTINI",""}) // Colunas
	aAdd(aSXB, {"ZLE_02","4","01","03","Data Fim"   ,"Data Fim"   ,"Data Fim"   ,"ZLE_DTFIM",""}) // Colunas
	aAdd(aSXB, {"ZLE_02","5","01","","","","","ZLE->ZLE_COD",""})                                 // Retorno
EndIf


//Consulta arquivos com extensao CSV - Consulta Personalizada
If upAnali
	aAdd(aSXB, {"U_CSV ","1","01","RE","Seleciona Arq. CSV","Seleciona Arq. CSV","Seleciona Arq. CSV","SA2",""})
	aAdd(aSXB, {"U_CSV ","2","01","01","","","",'U_PutArqCsv("MV_PAR04")',""})
	aAdd(aSXB, {"U_CSV ","5","01","","","","","MV_PAR04",""})
EndIf

//Consulta arquivos com extensao TXT - Consulta Personalizada
If upAnali
	aAdd(aSXB, {"U_TXT ","1","01","RE","Seleciona Arq. TXT","Seleciona Arq. TXT","Seleciona Arq. TXT","SA2",""})
	aAdd(aSXB, {"U_TXT ","2","01","01","","","",'U_PutArqTXT("MV_PAR01")',""})
	aAdd(aSXB, {"U_TXT ","5","01","","","","","MV_PAR01",""})
EndIf

//Consulta montada para ser usada com qualquer tabela.
//Mostra codigo e descricao e ListBox com opcao de marcar e desmarcar os registros.
If upAnali
	aAdd(aSXB, {"U_F301","1","01","RE","Consulta Mark F3","Consulta Mark F3","Consulta Mark F3","SA2",""})
	aAdd(aSXB, {"U_F301","2","01","01","","","",'U_MostraF3("SM0","M0_CODFIL","M0_FILIAL","Consulta Filiais","Filiais")',""})
	aAdd(aSXB, {"U_F301","5","01","","","","","MV_PAR03",""})
EndIf

//Mostra codigo e descricao e ListBox com opcao de marcar e desmarcar os registros (espec. Acessos Usuarios)
If upUsuar
	aAdd(aSXB, {"U_F302","1","01","RE","Consulta Mark F3","Setores Mark","Setores Mark","ZL2",""})
	aAdd(aSXB, {"U_F302","2","01","01","","","",'U_MostraF3("ZL2","ZL2_COD","ZL2_DESCRI","Consulta Setores","Setores","ZL2_FILIAL")',""})
	aAdd(aSXB, {"U_F302","5","01","","","","","M->ZLU_SETOR",""})
EndIf


//Cria consulta especifica para listar Tanques - Busca codigos dos tanques no cadastro de fornecedor
If upTanq
	aAdd(aSXB, {"ZLS_01","1","01","DB","Tanques de Leite","Tanques de Leite","Tanques de Leite","ZLS",""})
	aAdd(aSXB, {"ZLS_01","2","01","01","Codigo","Codigo","Codigo","",""})
	aAdd(aSXB, {"ZLS_01","4","01","01","Codigo","Codigo","Code","ZLS_COD",""})        // Colunas
	aAdd(aSXB, {"ZLS_01","4","01","02","Descricao","Descricao","Desc" ,"ZLS_DESCRI",""})// Colunas
	aAdd(aSXB, {"ZLS_01","5","01","","","","","ZLS->ZLS_COD",""})                                 // Retorno
	
	//Produtores do Tanque
	aAdd(aSXB, {"ZLT_01","1","01","DB","Produtores Tanque","Produtores Tanque","Produtores Tanque","SA2",""})
	aAdd(aSXB, {"ZLT_01","2","01","10","Matricula","Matricula","Matricula","",""})
	aAdd(aSXB, {"ZLT_01","2","02","01","Codigo + Loja","Codigo + Loja","Codigo + Loja","",""})
	aAdd(aSXB, {"ZLT_01","4","01","01","Codigo","Codigo","Codigo",'A2_COD',""})
	aAdd(aSXB, {"ZLT_01","4","01","02","Loja","Loja","Loja","A2_LOJA",""})
	aAdd(aSXB, {"ZLT_01","4","01","03","Razao Social","Razao Social","Razao Social","A2_NOME",""})
  	//aAdd(aSXB, {"ZLT_01","4","01","04","Matricula","Matricula","Matricula","A2_L_MATRI",""})
	aAdd(aSXB, {"ZLT_01","4","02","01","Codigo","Codigo","Codigo",'A2_COD',""})
	aAdd(aSXB, {"ZLT_01","4","02","02","Loja","Loja","Loja","A2_LOJA",""})
	aAdd(aSXB, {"ZLT_01","4","02","03","Razao Social","Razao Social","Razao Social","A2_NOME",""})
	aAdd(aSXB, {"ZLT_01","5","01","","","","","SA2->A2_COD",""})// Retorno
	aAdd(aSXB, {"ZLT_01","5","02","","","","","SA2->A2_LOJA",""})// Retorno
	aAdd(aSXB, {"ZLT_01","6","01","","","","","SA2->A2_L_TPFOR $ 'AP' .AND. SA2->A2_MSBLQL == '2'",""})// Filtro

	//Taques na SA2
	aAdd(aSXB, {"ZLT_02","1","01","DB","Tanques de Leite","Tanques de Leite","Tanques de Leite","ZLT",""})
	aAdd(aSXB, {"ZLT_02","2","01","01","Codigo","Codigo","Codigo","",""})
	aAdd(aSXB, {"ZLT_02","4","01","01","Codigo","Codigo","Code","ZLT_COD",""})
	aAdd(aSXB, {"ZLT_02","4","01","02","Descricao","Descricao","Descricao",'POSICIONE("ZLS",1,xFILIAL("ZLS")+ZLT->ZLT_COD,"ZLS_DESCRI")',""})
	aAdd(aSXB, {"ZLT_02","4","01","03","Produtor","Produtor","Produtor","ZLT_SA2COD",""})
	aAdd(aSXB, {"ZLT_02","4","01","04","Loja","Loja","Loja","ZLT_SA2LJ",""})
	aAdd(aSXB, {"ZLT_02","4","01","05","Nome","Nome","Nome","ZLT_SA2NOM",""})
	aAdd(aSXB, {"ZLT_02","4","01","06","Descta Resf","Descta Resf","Descta Resf","ZLT_DESCRE",""})
	aAdd(aSXB, {"ZLT_02","4","01","07","Descta Fret","Descta Fret","Descta Fret","ZLT_DESCFR",""})
    aAdd(aSXB, {"ZLT_02","5","01","","","","","ZLT->ZLT_COD",""})// Retorno
    aAdd(aSXB, {"ZLT_02","6","01","01","","","",'M->A2_COD == ZLT->ZLT_SA2COD .AND. M->A2_LOJA == ZLT->ZLT_SA2LJ',""})
   
EndIf

If uplinha

	aAdd(aSXB, {'ZLWLIN','1','01','DB'	,'ROTAS'		,'ROTAS'		,'ROTAS','ZLW',''})
	aAdd(aSXB, {'ZLWLIN','2','01','01'	,'Codigo+tipo'	,'Codigo+tipo'	,'Codigo+tipo',''})
	aAdd(aSXB, {'ZLWLIN','2','02','02'	,'Descricao'	,'Descricao'	,'Descricao','',''})
	aAdd(aSXB, {'ZLWLIN','2','03','03'	,'Fretista+loja','Fretista+loja','Fretista+loja','',''})
	aAdd(aSXB, {'ZLWLIN','4','01','01'	,'Codigo'		,'Codigo'		,'Codigo','ZLW_COD',''})
	aAdd(aSXB, {'ZLWLIN','4','01','02'	,'Descricao'	,'Descricao'	,'Descricao','ZLW_DESCRI',''})
	aAdd(aSXB, {'ZLWLIN','4','01','03'	,'Transportad.'	,'Transportad.'	,'Transportad.','ZLW_FRETIS',''})
	aAdd(aSXB, {'ZLWLIN','4','01','04'	,'LojaTransp.'	,'LojaTransp.'	,'LojaTransp.','ZLW_FRETLJ',''})
	aAdd(aSXB, {'ZLWLIN','4','01','05'	,'NomeTransp.'	,'NomeTransp.'	,'NomeTransp.','ZLW_NOMEFR',''})
	aAdd(aSXB, {'ZLWLIN','4','02','01'	,'Codigo'		,'Codigo','Codigo','ZLW_COD',''})
	aAdd(aSXB, {'ZLWLIN','4','02','02'	,'Descricao'	,'Descricao','Descricao','ZLW_DESCRI',''})
	aAdd(aSXB, {'ZLWLIN','4','02','03'	,'Transportad.'	,'Transportad.','Transportad.','ZLW_FRETIS',''})
	aAdd(aSXB, {'ZLWLIN','4','02','04'	,'LojaTransp.'	,'LojaTransp.','LojaTransp.','ZLW_FRETLJ',''})
	aAdd(aSXB, {'ZLWLIN','4','02','05'	,'NomeTransp.'	,'NomeTransp.','NomeTransp.','ZLW_NOMEFR',''})
	aAdd(aSXB, {'ZLWLIN','4','03','01'	,'Codigo'		,'Codigo','Codigo','ZLW_COD',''})
	aAdd(aSXB, {'ZLWLIN','4','03','02'	,'Descricao'	,'Descricao','Descricao','ZLW_DESCRI',''})
	aAdd(aSXB, {'ZLWLIN','4','03','03'	,'Transportad.'	,'Transportad.','Transportad.','ZLW_FRETIS',''})
	aAdd(aSXB, {'ZLWLIN','4','03','04'	,'LojaTransp.'	,'LojaTransp.','LojaTransp.','ZLW_FRETLJ',''})
	aAdd(aSXB, {'ZLWLIN','4','03','05'	,'NomeTransp.'	,'NomeTransp.','NomeTransp.','ZLW_NOMEFR',''})
	aAdd(aSXB, {'ZLWLIN','5','01',''	,''				,''			  ,''			,'ZLW->ZLW_COD',''})
	aAdd(aSXB, {'ZLWLIN','5','02',''	,''				,''			  ,''			,'ZLW->ZLW_VERSAO',''})
	aAdd(aSXB, {'ZLWLIN','5','03',''	,''				,''			  ,''			,'ZLW->ZLW_DESCRI',''})
	aAdd(aSXB, {'ZLWLIN','5','04',''	,''				,''			  ,''			,'ZLW->ZLW_NOMEFR',''})
	aAdd(aSXB, {'ZLWLIN','5','05',''	,''				,''			  ,''			,'ZLW->ZLW_DATINI',''})

	aAdd(aSXB, {'ZLWLI2','1','01','DB'	,'ROTAS'		,'ROTAS'		,'ROTAS','ZLW',''})
	aAdd(aSXB, {'ZLWLI2','2','01','01'	,'Codigo+tipo'	,'Codigo+tipo'	,'Codigo+tipo',''})
	aAdd(aSXB, {'ZLWLI2','2','02','02'	,'Descricao'	,'Descricao'	,'Descricao','',''})
	aAdd(aSXB, {'ZLWLI2','2','03','03'	,'Fretista+loja','Fretista+loja','Fretista+loja','',''})
	aAdd(aSXB, {'ZLWLI2','4','01','01'	,'Codigo'		,'Codigo'		,'Codigo','ZLW_COD',''})
	aAdd(aSXB, {'ZLWLI2','4','01','02'	,'Descricao'	,'Descricao'	,'Descricao','ZLW_DESCRI',''})
	aAdd(aSXB, {'ZLWLI2','4','01','03'	,'Transportad.'	,'Transportad.'	,'Transportad.','ZLW_FRETIS',''})
	aAdd(aSXB, {'ZLWLI2','4','01','04'	,'LojaTransp.'	,'LojaTransp.'	,'LojaTransp.','ZLW_FRETLJ',''})
	aAdd(aSXB, {'ZLWLI2','4','01','05'	,'NomeTransp.'	,'NomeTransp.'	,'NomeTransp.','ZLW_NOMEFR',''})
	aAdd(aSXB, {'ZLWLI2','4','02','01'	,'Codigo'		,'Codigo','Codigo','ZLW_COD',''})
	aAdd(aSXB, {'ZLWLI2','4','02','02'	,'Descricao'	,'Descricao','Descricao','ZLW_DESCRI',''})
	aAdd(aSXB, {'ZLWLI2','4','02','03'	,'Transportad.'	,'Transportad.','Transportad.','ZLW_FRETIS',''})
	aAdd(aSXB, {'ZLWLI2','4','02','04'	,'LojaTransp.'	,'LojaTransp.','LojaTransp.','ZLW_FRETLJ',''})
	aAdd(aSXB, {'ZLWLI2','4','02','05'	,'NomeTransp.'	,'NomeTransp.','NomeTransp.','ZLW_NOMEFR',''})
	aAdd(aSXB, {'ZLWLI2','4','03','01'	,'Codigo'		,'Codigo','Codigo','ZLW_COD',''})
	aAdd(aSXB, {'ZLWLI2','4','03','02'	,'Descricao'	,'Descricao','Descricao','ZLW_DESCRI',''})
	aAdd(aSXB, {'ZLWLI2','4','03','03'	,'Transportad.'	,'Transportad.','Transportad.','ZLW_FRETIS',''})
	aAdd(aSXB, {'ZLWLI2','4','03','04'	,'LojaTransp.'	,'LojaTransp.','LojaTransp.','ZLW_FRETLJ',''})
	aAdd(aSXB, {'ZLWLI2','4','03','05'	,'NomeTransp.'	,'NomeTransp.','NomeTransp.','ZLW_NOMEFR',''})
	aAdd(aSXB, {'ZLWLI2','5','01',''	,''				,''			  ,''			,'ZLW->ZLW_COD',''})
	aAdd(aSXB, {'ZLWLI2','5','02',''	,''				,''			  ,''			,'U_GCFG004(1)',''})
	aAdd(aSXB, {'ZLWLI2','5','03',''	,''				,''			  ,''			,'ZLW->ZLW_DESCRI',''})
	aAdd(aSXB, {'ZLWLI2','5','04',''	,''				,''			  ,''			,'ZLW->ZLW_NOMEFR',''})
	aAdd(aSXB, {'ZLWLI2','5','05',''	,''				,''			  ,''			,'DATE()',''})
	aAdd(aSXB, {"ZLWLI2","6","01","01","","","","ZLW->ZLW_MSBLQL <> '1' ",""}) // Filtro    

	aAdd(aSXB, {'ZLWLI3','1','01','DB'	,'ROTAS'		,'ROTAS'		,'ROTAS','ZLW',''})
	aAdd(aSXB, {'ZLWLI3','2','01','01'	,'Codigo+tipo'	,'Codigo+tipo'	,'Codigo+tipo',''})
	aAdd(aSXB, {'ZLWLI3','2','02','02'	,'Descricao'	,'Descricao'	,'Descricao','',''})
	aAdd(aSXB, {'ZLWLI3','2','03','03'	,'Fretista+loja','Fretista+loja','Fretista+loja','',''})
	aAdd(aSXB, {'ZLWLI3','4','01','01'	,'Codigo'		,'Codigo'		,'Codigo','ZLW_COD',''})
	aAdd(aSXB, {'ZLWLI3','4','01','02'	,'Descricao'	,'Descricao'	,'Descricao','ZLW_DESCRI',''})
	aAdd(aSXB, {'ZLWLI3','4','01','03'	,'Transportad.'	,'Transportad.'	,'Transportad.','ZLW_FRETIS',''})
	aAdd(aSXB, {'ZLWLI3','4','01','04'	,'LojaTransp.'	,'LojaTransp.'	,'LojaTransp.','ZLW_FRETLJ',''})
	aAdd(aSXB, {'ZLWLI3','4','01','05'	,'NomeTransp.'	,'NomeTransp.'	,'NomeTransp.','ZLW_NOMEFR',''})
	aAdd(aSXB, {'ZLWLI3','4','02','01'	,'Codigo'		,'Codigo','Codigo','ZLW_COD',''})
	aAdd(aSXB, {'ZLWLI3','4','02','02'	,'Descricao'	,'Descricao','Descricao','ZLW_DESCRI',''})
	aAdd(aSXB, {'ZLWLI3','4','02','03'	,'Transportad.'	,'Transportad.','Transportad.','ZLW_FRETIS',''})
	aAdd(aSXB, {'ZLWLI3','4','02','04'	,'LojaTransp.'	,'LojaTransp.','LojaTransp.','ZLW_FRETLJ',''})
	aAdd(aSXB, {'ZLWLI3','4','02','05'	,'NomeTransp.'	,'NomeTransp.','NomeTransp.','ZLW_NOMEFR',''})
	aAdd(aSXB, {'ZLWLI3','4','03','01'	,'Codigo'		,'Codigo','Codigo','ZLW_COD',''})
	aAdd(aSXB, {'ZLWLI3','4','03','02'	,'Descricao'	,'Descricao','Descricao','ZLW_DESCRI',''})
	aAdd(aSXB, {'ZLWLI3','4','03','03'	,'Transportad.'	,'Transportad.','Transportad.','ZLW_FRETIS',''})
	aAdd(aSXB, {'ZLWLI3','4','03','04'	,'LojaTransp.'	,'LojaTransp.','LojaTransp.','ZLW_FRETLJ',''})
	aAdd(aSXB, {'ZLWLI3','4','03','05'	,'NomeTransp.'	,'NomeTransp.','NomeTransp.','ZLW_NOMEFR',''})
	aAdd(aSXB, {'ZLWLI3','5','01',''	,''				,''			  ,''			,'ZLW->ZLW_COD',''})




	aAdd(aSXB, {"ZL4_03","1","01","DB","Veiculo" ,"Veiculo","Veiculo","ZL4",""})
	aAdd(aSXB, {"ZL4_03","2","01","02","Placa"   ,"Placa"  ,"Placa","",""})
	aAdd(aSXB, {"ZL4_03","2","02","01","Codigo"  ,"Codigo" ,"Codigo","",""})
	aAdd(aSXB, {"ZL4_03","4","01","01","Veiculo" ,"Veiculo","Veiculo","ZL4_COD",""})
	aAdd(aSXB, {"ZL4_03","4","01","02","Placa"   ,"Placa"  ,"Placa","ZL4_PLACA",""})
	aAdd(aSXB, {"ZL4_03","4","01","03","Motorista","Motorista","Motorista","ZL4_MOTORI",""})
	aAdd(aSXB, {"ZL4_03","4","01","04","Nome"     ,"Nome"     ,"Nome"     ,"ZL4_NOME",""})
	aAdd(aSXB, {"ZL4_03","4","02","01","Veiculo"  ,"Veiculo" ,"Code","ZL4_COD",""})
	aAdd(aSXB, {"ZL4_03","4","02","02","Placa"    ,"Placa"  ,"Placa","ZL4_PLACA",""})
	aAdd(aSXB, {"ZL4_03","4","02","03","Motorista","Motorista","Motorista","ZL4_MOTORI",""})
	aAdd(aSXB, {"ZL4_03","4","02","04","Nome"     ,"Nome"     ,"Nome"     ,"ZL4_NOME",""})
	aAdd(aSXB, {"ZL4_03","5","01","","","","","ZL4->ZL4_COD",""})
	aAdd(aSXB, {"ZL4_03","6","01","01","","","","ZL4->ZL4_COD $ U_VeiTransp(M->ZLW_FRETIS,M->ZLW_FRETLJ)",""}) // Filtro


	aAdd(aSXB, {"ZLY_02","1","01","DB","LinhasRotaparaRec","LinhasRotaparaRec","LinhasRotaparaRec","ZLY",""})
	aAdd(aSXB, {"ZLY_02","2","01","01","Rota","Rota","Rota","",""})
	aAdd(aSXB, {"ZLY_02","2","02","02","DescriRota","DescriRota","DescriRota","",""})
	aAdd(aSXB, {"ZLY_02","2","03","03","Rota+versao","Rota+versao","Rota+versao","",""})
	aAdd(aSXB, {"ZLY_02","4","01","01","Rota","Rota","Rota","ZLY_ROTA",""})
	aAdd(aSXB, {"ZLY_02","4","01","02","VersaoRota","VersaoRota","VersaoRota","ZLY_VERSAO",""})
	aAdd(aSXB, {"ZLY_02","4","01","03","DescriRota","DescriRota","DescriRota","ZLY_DESROT",""})
	aAdd(aSXB, {"ZLY_02","4","02","01","Rota","Rota","Rota","ZLY_ROTA",""})
	aAdd(aSXB, {"ZLY_02","4","02","02","VersaoRota","VersaoRota","VersaoRota","ZLY_VERSAO",""})
	aAdd(aSXB, {"ZLY_02","4","02","03","DescriRota","DescriRota","DescriRota","ZLY_DESROT",""})
	aAdd(aSXB, {"ZLY_02","4","03","01","Rota","Rota","Rota","ZLY_ROTA",""})
	aAdd(aSXB, {"ZLY_02","4","03","02","VersaoRota","VersaoRota","VersaoRota","ZLY_VERSAO",""})
	aAdd(aSXB, {"ZLY_02","4","03","03","DescriRota","DescriRota","DescriRota","ZLY_DESROT",""})
	aAdd(aSXB, {"ZLY_02","5","01","","","","","ZLY->ZLY_ROTA",""})
	aAdd(aSXB, {"ZLY_02","5","02","","","","","ZLY->ZLY_VERSAO",""})
	aAdd(aSXB, {"ZLY_02","5","03","","","","","ZLY->ZLY_DESROT",""})
	aAdd(aSXB, {"ZLY_02","6","01","","","","","ZLY->ZLY_MSBLQL<>'1'",""})


EndIf
ProcRegua(Len(aSXB))

dbSelectArea("SXB")
dbSetOrder(1)
For i:= 1 To Len(aSXB)
	If !Empty(aSXB[i][1])
		If !dbSeek(aSXB[i,1]+aSXB[i,2]+aSXB[i,3]+aSXB[i,4])
			RecLock("SXB",.T.)

			For j:=1 To Len(aSXB[i])
				If !Empty(FieldName(FieldPos(aEstrut[j])))
					FieldPut(FieldPos(aEstrut[j]),aSXB[i,j])
				EndIf
			Next j

			dbCommit()
			MsUnLock()
		EndIf
	EndIf
Next i

Return(.T.)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³GLTAtuSX5 ³ Autor ³ TOTVS                 ³ Data ³ 00/00/00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao de processamento da gravacao do SX5                 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Implantacao Gestao do Leite                                ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GLTAtuSX5()
//  "X5_FILIAL","X5_TABELA","X5_CHAVE","X5_DESCRI","X5_DESCSPA","X5_DESCENG"

Local aSX5   := {}
Local aEstrut:= {}
Local i      := 0
Local j      := 0
Local lSX5	 := .F.

If (cPaisLoc == "BRA")
	aEstrut:= { "X5_FILIAL","X5_TABELA","X5_CHAVE","X5_DESCRI","X5_DESCSPA","X5_DESCENG"}
Else
	aEstrut:= { "X5_FILIAL","X5_TABELA","X5_CHAVE","X5_DESCRI","X5_DESCSPA","X5_DESCENG"}
EndIf

ProcRegua(Len(aSX5))

dbSelectArea("SX5")
dbSetOrder(1)
For i:= 1 To Len(aSX5)
	If !Empty(aSX5[i][2])
		If !dbSeek(aSX5[i,1]+aSX5[i,2]+aSX5[i,3])
			lSX5	:= .T.
			RecLock("SX5",.T.)

			For j:=1 To Len(aSX5[i])
				If !Empty(FieldName(FieldPos(aEstrut[j])))
					FieldPut(FieldPos(aEstrut[j]),aSX5[i,j])
				EndIf
			Next j

			dbCommit()
			MsUnLock()
		EndIf
	EndIf
Next i

Return(.T.)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³GLTAtuSX6 ³ Autor ³ TOTVS                 ³ Data ³ 00/00/00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao de processamento da gravacao do SX6                 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Implantacao Gestao do Leite                                ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GLTAtuSX6()
//  X6_FIL   X6_VAR     X6_TIPO    X6_DESCRIC X6_DSCSPA  X6_DSCENG  X6_DESC1 X6_DSCSPA1 X6_DSCENG1
//  X6_DESC2 X6_DSCSPA2 X6_DSCENG2 X6_CONTEUD X6_CONTSPA X6_CONTENG X6_PROPRI



Local aSX6   := {}
Local aEstrut:= {}
Local aFiliais := {}
Local i      := 0
Local j      := 0
Local lSX6	 := .F.
Local cTexto := ''
Local cAlias := ''
Local lCria	 :=	.T.
Local _cTamFil := Space(TamSx3("A1_FILIAL")[1]) //Busca tamanho padrão do campo filial

dbSelectArea("SM0")
SM0->(dbGoTop())
AADD(aFiliais,_cTamFil)
While SM0->(!EOF())
	AADD(aFiliais,SM0->M0_CODFIL)
	SM0->(dbSkip())	
EndDO


aEstrut := {"X6_VAR","X6_TIPO","X6_DESCRIC","X6_DSCSPA","X6_DSCENG","X6_DESC1","X6_DSCSPA1","X6_DSCENG1","X6_DESC2","X6_DSCSPA2","X6_DSCENG2","X6_CONTEUD","X6_CONTSPA","X6_CONTENG","X6_PROPRI","X6_PYME"}

If upConfig
	aAdd(asx6,{"LT_LETRCP" , "L","T Indica que a letra do campo TPFOR e TPCLI serao utiliza-", " ", " ","dos na geracao do codigo."," "," "," "," ",".F.",".F.",".F.","U"," "}) 
EndIF

If upRecep
	aAdd(asx6,{"LT_TICKET" , "C","Cod.do Ticket do Recto de Leite                 ","","","","","","","","","000001","000001","000001","U"," "})
	aAdd(asx6,{"LT_ENTTM " , "C","Cod.do TM do Mov.Interno do Recto de Leite      ","","","","","","","","","100"   ,"100"   ,"100"   ,"U"," "})
	aAdd(asx6,{"LT_ENTPRO" , "C","Cod. do Produto do Mov.Interno do Recto de Leite","","","","","","","","","000100"  ,"000100"  ,"000100"  ,"U"," "})
	aAdd(asx6,{"LT_PRESER" , "C","Prefixo do titulo da Nota do produtor.          ","","","","","","","","","GLT","GLT","GLT","U"," "})
	aAdd(asx6,{"LT_PREFRT" , "C","Prefixo do titulo do Transportador              ","","","","","","","","","GLF","GLF","GLF","U"," "})
	aAdd(asx6,{"LT_SERIE"  , "C","Serie na NF de compra de leite do Produtor      ","","","","","","","","","GLT" ,"GLT" ,"GLT" ,"U"," "})
	aAdd(asx6,{"LT_MULTNF" , "C","Informe S, uma Nota para cada produtor.         ","","","Informe N, uma Nota por municipio.                ","","","","","","S","S","S","U"," "})
	aAdd(asx6,{"LT_FORNEC" , "C","Codigo + Loja do Fornecedor da NF do Municipio  ","","","ou Fornecedor da Nota Complementar.               ","","","","","","","","","U"," "})
	aAdd(asx6,{"LT_VENCTO" , "C","Dia de Vencimento do titulo da Nota do Produtor ","","","ou Transportador.                                 ","","","","","","17","17","17","U"," "})
	aAdd(asx6,{"LT_ULTMIX" , "C","Ultimo valor do Mix                             ","","","                                                  ","","","","","","0.50","0.50","0.50","U"," "})
	aAdd(asx6,{"LT_MOTBX " , "C","Motivo de baixa usado na baixa dos titulos do   ","","","Produtor ou Transport. Cadastre-o no Financeiro.  ","","","","","","GLT","GLT","GLT","U"," "})
	aAdd(asx6,{"LT_NATGLT" , "C","Codigo da natureza usada na geracao de titulos  ","","","pela rotina de Acerto do Leite.                   ","","","","","","51000","51000","51000","U"," "})
	aAdd(asx6,{"LT_NATGLF" , "C","Codigo da natureza usada na geracao de titulos  ","","","pela rotina de Acerto do Frete.                   ","","","","","","52000","52000","52000","U"," "})
	aAdd(asx6,{"LT_NATINS" , "C","Codigo da natureza usada na geracao de titulos  ","","","de INSS pelo o Acerto do Frete.                   ","","","","","","","","","U"," "})
	aAdd(asx6,{"LT_NATFUD" , "C","Codigo da natureza usada na geracao de titulos  ","","","de FUNDEPEC no Acerto do Frete.                   ","","","","","","","","","U"," "})
	aAdd(asx6,{"LT_TESNFE" , "C","Codigo da TES utilizada na Nota por Municipio.  ","","","Esta TES nao deve gerar Contas a Pagar.           ","","","","","","","","","U"," "})
	aAdd(asx6,{"LT_EVEDES" , "C","Codigo do Evento de Desconto de Frete           ","","","                                                  ","","","","","","","","","U"," "})
	aAdd(asx6,{"LT_DIASRE" , "N","Diferenca em dias, permitida entre a data da    "," ", " ", "coleta e do sistema.                          ","","","","","","60","60","60","U"," "})
    aAdd(asx6,{"LT_EVELTE" , "C" ,"Evento Leite Cru In Natura."," "," " , " "," "," "," "," "," ","010001','010002','010003","","","U"," "})
    aAdd(asx6,{"LT_DIASMC" , "N" ,"Dias para calculo de media."," "," " , " "," "," "," "," "," ","180","180","180","U"," "})
    aAdd(asx6,{"LT_DESVMC" , "N" ,"Percentual de desvio na media de coletas."," "," " , " "," "," "," "," "," ","10","10","10","U"," "})
    aAdd(asx6,{"LT_PRTRIBU" , "C" ,"Codigo do produto usado na recepcao do leite","","","do tipo TRIBUTADO."," "," "," "," "," ","001271","001271","001271","U"," "})
    aAdd(asx6,{"LT_PRISENT" , "C" ,"Codigo do produto usado na recepcao do leite","","","do tipo ISENTO."," "," "," "," "," ","001271","001271","001271","U"," "})
    aAdd(asx6,{"LT_PRDIFER" , "C" ,"Codigo do produto usado na recepcao do leite","","","do tipo DIFERIDO."," "," "," "," "," ","001271","001271","001271","U"," "})
    aAdd(asx6,{"LT_LIMINCE" , "N" ,"Armazena a litragem maxima anual que o produtor","","" ,"podera ter para ter seu leite do tipo TRIBUTADO,","","","ao superar este limite muda para ISENTO."," "," ","650000","650000","650000","U"," "})
    aAdd(asx6,{"LT_VARCLT" , "N","Variacao da Coleta     ","","","","","","","","","10"   ,"10"   ,"10"   ,"U"," "})
    aAdd(asx6,{"LT_MEDCLT" , "N","Media de Coleta      ","","","","","","","","","5"   ,"5"   ,"5"   ,"U"," "})
	aAdd(asx6,{"LT_PRXADI" , "C","Prefixo SE1 Adiantamento      ","","","","","","","","","GLA"   ,"GLA"   ,"GLA"   ,"U"," "})
	aAdd(asx6,{"LT_ADIANT" , "N","Porcentagem do Adiantamento      ","","","","","","","","","40"   ,"40"   ,"40"   ,"U"," "})
EndIf

If upEmpre
    aAdd(asx6,{"LT_GRPEMP" , "C", "Grupo Eventos Emprestimo GLT","","","","","","","","","000011","000011","000011","U","S"})
    aAdd(asx6,{"LT_EVTEMP" , "C", "Eventos Emprestimo GLT","","","","","","","","","110023","","","U","S"})
    aAdd(asx6,{"LT_EVTADT" , "C", "Eventos Adiantamento GLT","","","","","","","","","110024","","","U","S"})

	aAdd(asx6,{"LT_EMPPX1" , "C","Prefixo do titulo a receber de Emprestimos GLT  ","","","","","","","","","GLE","GLE","GLE","U","S"})
	aAdd(asx6,{"LT_EMPPX2" , "C","Prefixo do titulo a pagar de   Emprestimos GLT  ","","","","","","","","","GLE","GLE","GLE","U","S"})
	aAdd(asx6,{"LT_EMPTP1" , "C","Tipo    do titulo a receber de Emprestimos GLT  ","","","","","","","","","NDF","NDF","NDF","U","S"})
	aAdd(asx6,{"LT_EMPTP2" , "C","Tipo    do titulo a pagar   de Emprestimos GLT  ","","","","","","","","","NF","NF","NF","U","S"})
	aAdd(asx6,{"LT_EMPNT1" , "C","Natureza do titulo a receber de Emprestimos GLT ","","","aos Produtores","","","","","","51003","51003","51003","U","S"})
	aAdd(asx6,{"LT_EMPNT2" , "C","Natureza do titulo a pagar   de Emprestimos GLT ","","","aos Produtores","","","","","","51003","51003","51003","U","S"})
	aAdd(asx6,{"LT_EMPNT3" , "C","Natureza do titulo a receber de Emprestimos GLT ","","","aos Transport.","","","","","","52003","52003","52003","U","S"})
	aAdd(asx6,{"LT_EMPNT4" , "C","Natureza do titulo a pagar   de Emprestimos GLT ","","","aos Transport.","","","","","","52003","52003","52003","U","S"})

	aAdd(asx6,{"LT_ADTPX1" , "C","Prefixo do titulo a receber de Adiantamentos GLT","","","","","","","","","GLA","GLA","GLA","U"," "})
	aAdd(asx6,{"LT_ADTPX2" , "C","Prefixo do titulo a pagar de   Adiantamentos GLT","","","","","","","","","GLA","GLA","GLA","U"," "})
	aAdd(asx6,{"LT_ADTTP1" , "C","Tipo do titulo a receber de Adiantamentos GLT","","","","","","","","","NDF","NDF","NDF","U"," "})
	aAdd(asx6,{"LT_ADTTP2" , "C","Tipo do titulo a pagar   de Adiantamentos GLT","","","","","","","","","NF","NF","NF","U"," "})
	aAdd(asx6,{"LT_ADTNT1" , "C","Natureza do titulo a receber   Adiantamentos GLT","","","aos Produtores","","","","","","51001","51001","51001","U"," "})
	aAdd(asx6,{"LT_ADTNT2" , "C","Natureza do titulo a pagar  de Adiantamentos GLT","","","aos Produtores","","","","","","51001","51001","51001","U"," "})
	aAdd(asx6,{"LT_ADTNT3" , "C","Natureza do titulo a receber   Adiantamentos GLT","","","aos Transport.","","","","","","52001","52001","52001","U"," "})
	aAdd(asx6,{"LT_ADTNT4" , "C","Natureza do titulo a pagar  de Adiantamentos GLT","","","aos Transport.","","","","","","52001","52001","52001","U"," "})

	aAdd(asx6,{"LT_ANTPX1" , "C","Prefixo do titulo a receber de Financiamento GLT ","","","","","","","","","GLN","GLN","GLN","U"," "})
	aAdd(asx6,{"LT_ANTPX2" , "C","Prefixo do titulo a pagar de   Financiamento GLT ","","","","","","","","","GLN","GLN","GLN","U"," "})
	aAdd(asx6,{"LT_ANTTP1" , "C","Tipo do titulo a receber de Financiamento GLT ","","","","","","","","","NDF","NDF","NDF","U"," "})
	aAdd(asx6,{"LT_ANTTP2" , "C","Tipo do titulo a pagar   de Financiamento GLT ","","","","","","","","","NF","NF","NF","U"," "})
	aAdd(asx6,{"LT_ANTNT1" , "C","Natureza do titulo a receber de Financiamento GLT","","","","","","","","","1203002","1203002","1203002","U"," "})
	aAdd(asx6,{"LT_ANTNT2" , "C","Natureza do titulo a pagar de Financiamento GLT","","","","","","","","","1203002","1203002","1203002","U"," "})
	aAdd(asx6,{"LT_ANTNT3" , "C","Natureza do titulo a receber de Financiamento GLT","","","","","","","","","1203002","1203002","1203002","U"," "})
	aAdd(asx6,{"LT_ANTNT4" , "C","Natureza do titulo a pagar de Financiamento GLT","","","","","","","","","1203002","1203002","1203002","U"," "})
	aAdd(asx6,{"LT_TXPER " , "N","Taxa de permanencia usada nos titulos do SE1 do produtor"," ", " ", "","","","","","","0.02","0.02","0.02","U"," "})

	aAdd(asx6,{"LT_COTPX1" , "C","Prefixo do titulo a receber de Cota Capital GLT  ","","","","","","","","","CCP","CCP","CCP","U","S"})
	aAdd(asx6,{"LT_COTTP1" , "C","Tipo    do titulo a receber de Cota Capital GLT  ","","","","","","","","","NDF","NDF","NDF","U","S"})
	aAdd(asx6,{"LT_COTNT1" , "C","Natureza do titulo a receber de Cota Capital GLT ","","","aos Produtores","","","","","","","","","U","S"})
EndIf

If upFrete
	aAdd(asx6,{"LT_VRFRELT" , "N", "Valor do frete por litro    "," ", " ", " "," "," "," "," "," ","0","0","0","U"," "})
	aAdd(asx6,{"LT_VRFREKM" , "N", "Valor do frete por km rodado"," ", " ", " "," "," "," "," "," ","0","0","0","U"," "})
	aAdd(asx6,{"LT_VRFREDI" , "N", "Valor do frete por dia      "," ", " ", " "," "," "," "," "," ","0","0","0","U"," "})

	//Controla o Codigo sequencial do fechamento do frete na amarracao das tabelas se5  e sef
	aAdd(asx6,{"LT_IDFECHF" , "C", "Id Fechamento Frete.        "," "," " , " "," "," "," "," "," ","000001","000001","000001","U"," "})
	aAdd(asx6,{"LT_FREPRE " , "C", "Prefixo Tit. de Transport.  "," "," " , " "," "," "," "," "," ","GLF","GLF","GLF","U"," "})
	aAdd(asx6,{"LT_FRETIP " , "C", "Tipo Tit. de Transport.     "," "," " , " "," "," "," "," "," ","NF ","NF ","NF ","U"," "})
	aAdd(asx6,{"LT_FRENAT " , "C", "Natureza Tit. de Transport. "," "," " , " "," "," "," "," "," ","52000","52000","52000","U"," "})
EndIf

If upMix
	aAdd(asx6,{"LT_GRPBON"  , "C" , "Codigo do Grupo das Bonificacoes","","","","","","","","","","","000002","U","S"})
	aAdd(asx6,{"LT_CODBON"  , "C" , "Codigo da Bonificacao de Leite","","","","","","","","","","","020100033","U","S"})
    aAdd(asx6,{"LT_EVEINSS" , "C" , "Codigo do Evento INSS(FUNRURAL)","","","","","","","","","","","","U","S"})
    aAdd(asx6,{"LT_EVESENA" , "C" , "Codigo do Evento SENAR","","","","","","","","","","","","U","S"})
    aAdd(asx6,{"LT_EVEFRET" , "C" , "Codigo do Evento Frete Geral","","","","","","","","","","","","U","S"})
    aAdd(asx6,{"LT_EVEFUND" , "C" , "Codigo do Evento de Fundepec  ","","","","","","","","","","","","U","S"})
	aAdd(asx6,{"LT_EVELTR"  , "C" , "Evento Frete p/ Litro Leite."," "," " , " "," "," "," "," "," ","","","","U"," "})
	aAdd(asx6,{"LT_EVEKM "  , "C" , "Evento Frete p/ Km rodado.  "," "," " , " "," "," "," "," "," ","","","","U"," "})
	aAdd(asx6,{"LT_EVEDIA"  , "C" , "Evento Frete p/ dia.        "," "," " , " "," "," "," "," "," ","","","","U"," "})
    aAdd(asx6,{"LT_EVEFALT" , "C" , "Evento Falta de Leite.      "," "," " , " "," "," "," "," "," ","","","","U"," "})
    aAdd(asx6,{"LT_EVEADIC" , "C" , "Evento Adicional de Mercado."," "," " , " "," "," "," "," "," ","","","","U"," "})
    aAdd(asx6,{"LT_EVEINCE" , "C" , "Evento Incentivo (ICMS).    "," "," " , " "," "," "," "," "," ","","","","U"," "})
	aAdd(asx6,{"LT_SOMAFRT" , "L" , "Soma o frete no MIX ou nao. "," ", " ", " "," "," "," "," "," ",".F.",".F.",".F.","U"," "})
    aAdd(asx6,{"LT_EVEQUA " , "C" , "Codigo dos Eventos de Reducao da qualidade","","","","","","","","","","","","U","S"})
    aAdd(asx6,{"LT_DETALHA" , "L" , "Detalha convenio interno no Demonstrativo. "," ", " ", " "," "," "," "," "," ",".F.",".F.",".F.","U"," "})
	aAdd(asx6,{"LT_FTRBONI" , "N" , "Fator utilizado no cálculo de bonifica. "," ", " ", " "," "," "," "," "," ","30.5","30.5","30.5","U","S"})
	aAdd(asx6,{"LT_MESBONI" , "N" , "Qtd meses exigidas p/ bon. fidelidade. "," ", " ", " "," "," "," "," "," ","13","13","13","U","S"})

	//Relatorio de Apuracao de IRRF ou Informe de Rendimentos
	aAdd(asx6,{"LT_EVEBONI" , "C" , "Eventos de Bonificacao p/ Rel. IRRF."," "," " , " "," "," "," "," "," ","","","010001','010002','010003','020001','020002','020003','020004','020005','020006','030001','030002','040001','040002','040003','040004','990010","U"," "})

EndIf

If upConve
	aAdd(asx6,{"LT_VENCONV" , "N" , "Dia de vencto do convenio GLT","","","","","","","","","25","25","25","U","S"})
	aAdd(asx6,{"LT_CONVPRE" , "C" , "Prefixo do titulo a Pagar do Convenio GLT","","","","","","","","","GLC","GLC","GLC","U","S"})
	aAdd(asx6,{"LT_CONVTIP" , "C" , "Tipo do titulo a Pagar do Convenio GLT","","","","","","","","","DP","DP","DP","U","S"})
	aAdd(asx6,{"LT_CONVNAT" , "C" , "Natureza do titulo a Pagar do Convenio GLT","","","","","","","","","51002","51002","51002","U","S"})
    aAdd(asx6,{"LT_CONVEXT" , "C" , "Evento de Convenio Externo. GLT","","","","","","","","","100021","","","U","S"})
    aAdd(asx6,{"LT_CONVINT" , "C" , "Evento de Convenio Interno. GLT","","","","","","","","","100022","","","U","S"})
    aAdd(asx6,{"LT_GRPCNV" , "C"  , "Grupo Eventos Convenios GLT","","","","","","","","","000010","000010","000010","U","S"})
    aAdd(asx6,{"LT_GEVEMFN" , "C" , "Grupo Eventos Emprestimo,Financ. GLT","","","","","","","","","000011","000011","000011","U","S"})
    aAdd(asx6,{"LT_DIALIMI" , "C" , "Dia limite do mes seguinte p/ importacao convenios","","","","","","","","","20","20","20","U","S"})
    aAdd(asx6,{"LT_CODSETO" , "C" , "Codigo do Setor Padrao sugerido na rotina Convenio","","","","","","","","","000001","000001","000001","U","S"})
    aAdd(asx6,{"LT_EVEENER" , "C" , "Evento de Desconto de Energia do tanque."," "," " , " "," "," "," "," "," ","770007","770007","770007","U"," "})
    aAdd(asx6,{"LT_TELACON" , "L" , "Informe se utiliza filtro na tela de lancamento","", "", "dos convenios."," "," ","Filtrado pelo campo A2_L_USER."," "," ",".T.",".T.",".T.","U"," "})
    aAdd(asx6,{"LT_EVEUNI" , "C" , "Evento de Convenio UNIMED. GLT","","","","","","","","","770002","770002","770002","U","S"})
    aAdd(asx6,{"LT_UNIMED" , "C" , "Codigo + Loja da UNIMED conveniada. GLT","","","","","","","","","","","","U","S"})    
    aAdd(asx6,{"LT_GRPUSR" , "C" , "Grupo de usuarios dos fornecedores que","","","utilizam a rotina de convenios.","","","","","","000015","000015","000015","U","S"})
EndIf

If upAnali
	aAdd(asx6,{"LT_ANAGORD" , "C" , "Cod. da analise de Gordura no Tp. de Faixa","","","","","","","","","010001","010001","010001","U","S"})
	aAdd(asx6,{"LT_ANAPROT" , "C" , "Cod. da analise de Proteina no Tp de Faixa","","","","","","","","","010002","010002","010002","U","S"})
	aAdd(asx6,{"LT_ANACCS " , "C" , "Cod. da analise de CCS no Tipo de Faixa.  ","","","","","","","","","010003","010003","010003","U","S"})
	aAdd(asx6,{"LT_ANACBT " , "C" , "Cod. da analise de CBT no Tipo de Faixa.  ","","","","","","","","","010004","010004","010004","U","S"})
	aAdd(asx6,{"LT_VLRCBT " , "N" , "Valor limite para CBT, acima desse valor a","","","analise sera desqualificada."," "," "," "," "," ","0","0","0","U"," "})
	aAdd(asx6,{"LT_VLRCCS " , "N" , "Valor limite para CCS, acima desse valor a","","","analise sera desqualificada."," "," "," "," "," ","0","0","0","U"," "})
    aAdd(asx6,{"LT_BON_RED" , "C" , "Eventos de Bonificacao e Reducao da qualidade","","","","","","","","","'040001','040002','040003','040004','050001','050002','050003','050004'","","'","U","S"})
EndIf

If upComp
    aAdd(asx6,{"LT_EVECOMP" , "C" , "Evento Complemento de Preco."," "," " , " "," "," "," "," "," ","990010","990010","990010","U"," "})
    aAdd(asx6,{"LT_NATCOMP" , "C" , "Natureza do INSS de NF Complemento."," "," " , " "," "," "," "," "," ","51005","51005","51005","U"," "})
    aAdd(asx6,{"LT_NATNFCO" , "C" , "Natureza do titulo da NF Complemento do Produtor."," "," " , " "," "," "," "," "," ","51000","51000","51000","U"," "})
    aAdd(asx6,{"LT_FXCOMPL" , "C" , "Codigo da Faixa do Complemento de Preco."," "," " , " "," "," "," "," "," ","","000077","000077","U"," "})

    //Estorno de Movimentos
    aAdd(asx6,{"LT_NATEST1" , "C" , "Natureza do Titulo NF de estorno."," "," " , " "," "," "," "," "," ","51004","51004","51004","U"," "})
    aAdd(asx6,{"LT_NATEST2" , "C" , "Natureza do Titulo NDF de estorno."," "," " , " "," "," "," "," "," ","51004","51004","51004","U"," "})
EndIf

If upEsto
    aAdd(asx6,{"LT_EVEESTO" , "C" , "Evento estorno de lancamento indevido"," "," " , " "," "," "," "," "," ","990028","990028","990028","U"," "})
EndIf

If upLoja
    aAdd(asx6,{"LT_CONDPGT" , "C" , "Codigo das condicoes de pagamento usadas pelos","","","produtores na venda da loja de racao."," "," "," "," "," ","","","","U"," "})
    aAdd(asx6,{"LT_NATCLIE" , "C" , "Codigo da Natureza usada para o produtor no   ","","","cadastro de clientes.                "," "," "," "," "," ","51000","51000","51000","U"," "})
EndIf

If upFect
	aAdd(asx6,{"LT_CODPGTO" , "C","Condicao de Pagamento da Nota do Produtor.       ","","","","","","","","","001","001","001","U"," "})
    aAdd(asx6,{"LT_TESICMS" , "C","TES que nao calcula ICMS. Usado quando o produtor","","","eh nao optante pelo ICMS","","","","","","037","037","037","U"," "})
//    aAdd(asx6,{"LT_EVEREP1" , "C","Evento repasse resfriamento por Volume."," "," " , " "," "," "," "," "," ","060003","060003","060003","U"," "})
//    aAdd(asx6,{"LT_EVEREP2" , "C","Evento repasse resfriamento por Valor Fixo."," "," " , " "," "," "," "," "," ","060002","060002","060002","U"," "})
//    aAdd(asx6,{"LT_JUNTAPR" , "L","T indica que produtos iguais devem ser aglutinados na Nota", " ", " ","na nota do produtor."," "," "," "," ",".T.",".T.",".T.","U"," "})
//    aAdd(asx6,{"LT_EVEFRT1" , "C","Evento frete 1o percurso."," "," " , " "," "," "," "," "," ","060001","060001","060001","U"," "})
    aAdd(asx6,{"LT_AGRUBON" , "L","T indica que eventos bonificacao serao aglutinados", " ", " ","no demonstrativo."," "," "," "," ","",".F.",".F.",".F."," "})
//    aAdd(asx6,{"LT_GRPREPA" , "C", "Grupo dos Eventos de Repasse","","","","","","","","","000006","000006","000006","U","S"})
    aAdd(asx6,{"LT_ESPECIE" , "C", "Armazena a especie da nota fiscal do produtor     ","","","","","","","","","SPED","SPED","SPED","U","S"})
//	aAdd(asx6,{"LT_VLRPREV" , "N" , "Valor cheio a ser pago Previdencia Privada","","","","","","","","","1000","1000","1000","U","S"})
//	aAdd(asx6,{"LT_EVPREV"  , "C", "Evento da Previdencia Privada.     ","","","","","","","","","","","","U","S"})
//	aAdd(asx6,{"LT_FORNPRE" , "C", "Fornecedor da Previdencia Privada (A2_COD+A2_LOJA).   ","","","","","","","","","","","","U","S"})
//	aAdd(asx6,{"LT_COTAIN" , "C", "Data Do Inicio da Cota de Leite MMDD.   ","","","","","","","","","0501","0501","0501","U","S"})
//	aAdd(asx6,{"LT_COTAFIM" , "C", "Data Do Final da Cota de Leite MMDD  ","","","","","","","","","0930","0930","0930","U","S"})
EndIf

If upCapal
	aAdd(asx6,{"LT_SETMIX" , "C","Setor utilizado no Recepção/MIX pela Importação       ","","","","","","","","","000001","000001","000001","U"," "})
	aAdd(asx6,{"LT_LINMIX" , "C","Linha utilizado no Recepção/MIX pela Importação       ","","","","","","","","","000001","000001","000001","U"," "})
	aAdd(asx6,{"LT_FRTMIX" , "C","Fretista utilizado no Recepção/MIX pela Importação    ","","","","","","","","","T00002","T00002","T00002","U"," "})
	aAdd(asx6,{"LT_VEIREC" , "C","Veiculo utilizado na Recepção pela Importação         ","","","","","","","","","000001","000001","000001","U"," "})
	aAdd(asx6,{"LT_MOTREC" , "C","Motorista utilizado na Recepção pela Importação       ","","","","","","","","","000001","000001","000001","U"," "})
EndIf


                                                                                                                                               

ProcRegua(Len(aSX6))

dbSelectArea("SX6")
dbSetOrder(1)
For i:= 1 To Len(aSX6)
	If !Empty(aSX6[i][1])
		For nX:=1 to Len (aFiliais)
			IF dbSeek(aFiliais[nX]+aSX6[i,1])
				lCria:=.F.
				Exit
			EndIF
		Next
		IF lCria
			If !dbSeek(_cTamFil+aSX6[i,1]) .And. !dbSeek(cFilAnt+aSX6[i,1])
				lSX6	:= .T.
				If !(aSX6[i,1]$cAlias)
					cAlias += aSX6[i,1] //+ ":"+aSX6[i,4]+aSX6[i,7]+aSX6[i,10]+CHR(13)+CHR(10)
				EndIf
				RecLock("SX6",.T.)
				FieldPut(FieldPos("X6_FIL"),_cTamFil) //_cTamFil
				For j:=1 To Len(aSX6[i])
					If !Empty(FieldName(FieldPos(aEstrut[j])))
						FieldPut(FieldPos(aEstrut[j]),aSX6[i,j])
					EndIf
				Next j

				dbCommit()
				MsUnLock()
				cTexto += "Incluido o parametro " + aSX6[i,1] + Chr(13) + Chr(10)
			EndIF
		Else
			cTexto += "O parametro " + aSX6[i,1] + " ja existe e nao foi alterado." + Chr(13) + Chr(10)
		EndIf
		lCria:=.T.
	EndIf
Next i




//If lSX6
cTexto := 'Incluidos novos parametros. Verifique as suas configuracoes e funcionalidades : '+ Chr(13) + Chr(10) + cTexto + Chr(13) + Chr(10)
//Else
//	cTexto := 'Incluídos novos parametros. Verifique as suas configuracoes e funcionalidades : '+ Chr(13) + Chr(10) + cTexto + Chr(13) + Chr(10)
//EndIf

Return cTexto
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ GLTOrdIX ³ Autor ³ TOTVS                 ³ Data ³ 00/00/00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Fucao para retornar ordem do ultimo indice                 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Implantacao Gestao do Leite.                               ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GLTOrdIX(cTabela)

	Local _cOrder
	//Pega o ultima ordem dos campos SA1
	xArea:=GetArea("SIX")
	dbSelectArea("SIX")
	dbSetorder(1)
	dbSeek(cTabela)

	While !SIX->(EOF())
		IF SIX->INDICE <> cTabela
		   Exit
		EndIF
		_cOrder:=SIX->ORDEM
		SIX->(dbSkip())
	EndDo
	RestArea(xArea)

Return _cOrder

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ GLTOrdIX ³ Autor ³ TOTVS                 ³ Data ³ 00/00/00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Fucao para retornar ordem do ultimo pasta                 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Implantacao Gestao do Leite.                               ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GLTOrdXA(cTabela)

Local _cOrder := "0"
//Pega o ultima ordem dos campos SA1
xArea:=GetArea("SXA")
dbSelectArea("SXA")
dbSetorder(1)
dbSeek(cTabela)

While !SXA->(EOF())
	If SXA->XA_ALIAS <> cTabela .And. AllTrim(SXA->XA_DESCRIC) == "Gestao Leite"
		Exit
	EndIf
	_cOrder:=SXA->XA_ORDEM
	SXA->(dbSkip())
EndDo
RestArea(xArea)

Return(_cOrder)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³GLTAtuSXA ³ Autor ³ TOTVS                 ³ Data ³ 00/00/00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao de processamento da gravacao do SXA                 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Implantacao Gestao do Leite                                ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GLTAtuSXA()

Local aSXA   := {}
Local aEstrut:= {}
Local i      := 0
Local j      := 0
Local aSX3	 := {}
Local nX		 := 0

aEstrut:= {"XA_ALIAS","XA_ORDEM","XA_DESCRIC","XA_DESCSPA","XA_DESCENG","XA_PROPRI"}

If upForne
	//cPast:=Soma1(GLTOrdXA("SA2"))
	If cPast <> "0"
		aAdd(aSXA,{"SA2",cPast,"Gestao Leite                  ","Gestao Leite","Gestao Leite","U"})
	EndIf
EndIf

If upEvent
	aAdd(aSXA,{"ZL8","1","Cadastrais                    ","Cadastrais","Cadastrais","U"})
	aAdd(aSXA,{"ZL8","2","Formulas                      ","Formulas  ","Formulas  ","U"})
	aAdd(aSXA,{"ZL8","3","Convenios                     ","Convenios  ","Convenios  ","U"})
EndIf

ProcRegua(Len(aSXA))

dbSelectArea("SXA")
dbSetOrder(1)
For i:= 1 To Len(aSXA)
	If !Empty(aSXA[i][1])
		If !dbSeek(aSXA[i,1]+aSXA[i,2])
			RecLock("SXA",.T.)
			For j:=1 To Len(aSXA[i])
				If !Empty(FieldName(FieldPos(aEstrut[j])))
					FieldPut(FieldPos(aEstrut[j]),aSXA[i,j])
				EndIf
			Next j

			dbCommit()
			MsUnLock()
		EndIf
	EndIf
Next i

aSX3 := {}

dbSelectArea("SX3")
dbSetOrder(2)
For nx := 1 to Len(aSX3)
	If dbSeek(aSX3[nx][1])
		RecLock("SX3",.F.)
		SX3->X3_FOLDER := aSX3[nx][2]
		MsUnlock()
	EndIf
Next

Return(.T.)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ GLTAtuHlp³ Autor ³ TOTVS                 ³ Data ³ 00/00/00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao de processamento da gravacao do Help de Campo.      ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Implantacao Gestao do Leite                                ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function GLTAtuHlp()

Local cTexto   := "Help de campo Incluido."
Local aHelpPor := {}
Local aHelpEng := {}
Local aHelpSpa := {}

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Fornecedores.              ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o codigo de classificação do")
Aadd(aHelpPor,"fornecedor entre: Produtor,Transportador, ")
Aadd(aHelpEng,"Fornecedor, Funcionario                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_TPFOR",aHelpPor,aHelpEng,aHelpSpa,.T.)


aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o codigo do Grupo de Preço ")
Aadd(aHelpPor,"a qual o produtor faz parte.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_LI_RO",aHelpPor,aHelpEng,aHelpSpa,.T.)
/*
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe se é uma linha ou rota.    ")
Aadd(aHelpPor,"Usado para armazenar informações   ")
Aadd(aHelpPor,"complementares do produtor.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_TP_LR",aHelpPor,aHelpEng,aHelpSpa,.T.)
*/  
 
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Data de Desligamento do produtor   ")
Aadd(aHelpPor,"junto a empresa. Campo informativo.")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_DESLI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Motivo do desligamento             ")
Aadd(aHelpPor,"do produtor                        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_MOTIV",aHelpPor,aHelpEng,aHelpSpa,.T.)        

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Saldo de Rateio de                 ")
Aadd(aHelpPor,"de volume do rateio                ")
Aadd(aHelpEng,"de perdas                          ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_VPERD",aHelpPor,aHelpEng,aHelpSpa,.T.)   
 

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informacoes diversas sobre         ")
Aadd(aHelpPor,"o produtor                         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_COMPL",aHelpPor,aHelpEng,aHelpSpa,.T.)        

 
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informa se o produtor participa do ")
Aadd(aHelpPor,"rateio de perdas, referente aos    ")
Aadd(aHelpPor,"produtores que eram associados de  ")
Aadd(aHelpPor,"2000 a 2001                        ") 
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_RPERD",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Se o produtor for o próprio dono do")
Aadd(aHelpPor,"tanq esse campo deve ser preenchido")
Aadd(aHelpPor,"com seu próprio cód. Qdo o produtor")
Aadd(aHelpPor,"não tem tanque próprio é necessário")
Aadd(aHelpPor,"informar o cód. do produtor em que ")
Aadd(aHelpPor,"ele armazena o leite.              ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_TANQ ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"SIGSIF - Sistema de Informações    ")
Aadd(aHelpPor,"Gerenciais do Serviço de Inspeção  ")
Aadd(aHelpPor,"Federal. Informe neste campo o nro ")
Aadd(aHelpPor,"usado no SIGSIF, para que Protheus ")
Aadd(aHelpPor,"consiga se integrar com o SIGSIF,  ")
Aadd(aHelpPor,"possibilitando importar as analises")
Aadd(aHelpPor,"de qualidade. LQL - Laboratório de ")
Aadd(aHelpPor,"Qualidade do Leite em Goiás e      ")
Aadd(aHelpPor,"Clínica do Leite em Minas, são     ")
Aadd(aHelpPor,"parceiros do SIGSIF.               ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_SIGSI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Capacidade de Resfriamento. Usado  ")
Aadd(aHelpPor,"para armazenar informações         ")
Aadd(aHelpPor,"complementares do produtor.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_CAPAC",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Tipo de Ordenha. Usado para     ")
Aadd(aHelpPor,"armazenar informações              ")
Aadd(aHelpPor,"complementares do produtor.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_TIPOR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Numero de Ordenhas. Usado para     ")
Aadd(aHelpPor,"armazenar informações              ")
Aadd(aHelpPor,"complementares do produtor.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_NROOR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informar o nome da fazenda do      ")
Aadd(aHelpPor,"produtor. Usado como informação    ")
Aadd(aHelpPor,"complementar.                      ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_FAZEN",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informar como o produtor/fretista  ")
Aadd(aHelpPor,"vai receber seu pagamento: Banco,  ")
Aadd(aHelpPor,"cheque ou dinheiro.                ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_TPPAG",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informar o numero de inscrição do  ")
Aadd(aHelpPor,"imóvel rural na Secretaria da      ")
Aadd(aHelpPor,"Receita Federal. NIRF - NÚMERO DO  ")
Aadd(aHelpPor,"IMÓVEL NA RECEITA FEDERAL.         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_NIRF ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informar o numero do registro da   ")
Aadd(aHelpPor,"propriedade no Instituto Nacional  ")
Aadd(aHelpPor,"de Colonização e Reforma Agrária   ")
Aadd(aHelpPor,"- INCRA.                           ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_INCRA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe SIM, caso o sistema deva   ")
Aadd(aHelpPor,"gerar um débito de FUNRURAL (INSS) ")
Aadd(aHelpPor,"ao produtor no fechamento do leite.")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_INSS ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe SIM, caso o sistema deva   ")
Aadd(aHelpPor,"gerar um débito de FUNDEPEC ao     ")
Aadd(aHelpPor,"produtor no fechamento do leite.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_FUNDE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Se o Fretista emite Conhecimento de")
Aadd(aHelpPor," Transporte para o Laticinio no    ")
Aadd(aHelpPor,"final do mês, para pagamento do    ")
Aadd(aHelpPor,"frete de leite In Natura.          ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_CTRC ",aHelpPor,aHelpEng,aHelpSpa,.T.)

//Especificos do laticinio
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe a condição de posse da     ")
Aadd(aHelpPor,"fazenda do produtor. Usado para    ")
Aadd(aHelpPor,"informações complementares.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_POSSE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"CEP para envio de correspondencia(Etiquetas).")
Aadd(aHelpEng,"                                             ")
Aadd(aHelpSpa,"                                             ")
PutHelp("P"+"A2_L_CEP  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Endereço para envio de             ")
Aadd(aHelpPor,"correspondecias(Etiquetas).        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_END  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Bairro para envio de               ")
Aadd(aHelpPor,"correspondencias(Etiquetas).       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_BAIRR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Estado (UF) para envio de          ")
Aadd(aHelpPor,"correspondencias(Etiquetas).       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_EST  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Município para envio de            ")
Aadd(aHelpPor,"correspondencias(Etiquetas).       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_MUN  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Caixa Postal para envio de         ")
Aadd(aHelpPor,"correspondencias(Etiquetas).       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_CX_PO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Telefone para envio de             ")
Aadd(aHelpPor,"correspondencias(Etiquetas).       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_TEL  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Fax para envio de correspondencias(Etiquetas).")
Aadd(aHelpEng,"                                              ")
Aadd(aHelpSpa,"                                              ")
PutHelp("P"+"A2_L_FAX  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do repsonsavel para envio de  ")
Aadd(aHelpPor,"correspondencias(Etiquetas).       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_CONTA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indique se o produtor é optante    ")
Aadd(aHelpPor,"pelo INCENTIVO A PRODUCAO dado pelo")
Aadd(aHelpPor,"governo. O produtor recebe 2,5% ou ")
Aadd(aHelpPor,"menos, sobre o valor do leite. O   ")
Aadd(aHelpPor,"laticínio credita 12% de ICMS ou   ")
Aadd(aHelpPor,"menos, caso o produtor seja optante")
Aadd(aHelpPor," ou não.                           ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_ICMS ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Tipo do Fornecedor. Usado p/ gerar ")
Aadd(aHelpPor,"sequencia automatica do fornecedor.")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_TPFOR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o codigo do grupo de       ")
Aadd(aHelpPor,"produtores, caso este produtor     ")
Aadd(aHelpPor,"pertença a algum grupo, caso       ")
Aadd(aHelpPor,"contrario deixe em branco.         ")
Aadd(aHelpPor,"Usado para aumentar a escala       ")
Aadd(aHelpPor,"faixa de bonificação por volume.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_GRUPO",aHelpPor,aHelpEng,aHelpSpa,.T.)
/*
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Frequencia de Coleta. Campo informativo.")
Aadd(aHelpEng,"                                        ")
Aadd(aHelpSpa,"                                        ")
PutHelp("P"+"A2_L_FREQC",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Hora da Coleta na fazenda. Campo informativo.")
Aadd(aHelpEng,"                                             ")
Aadd(aHelpSpa,"                                             ")
PutHelp("P"+"A2_L_HORAC",aHelpPor,aHelpEng,aHelpSpa,.T.)
*/
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Volume diario de leite. Campo informativo.")
Aadd(aHelpEng,"                                          ")
Aadd(aHelpSpa,"                                          ")
PutHelp("P"+"A2_L_VOLUM",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Tipo do Leite. Campo informativo.")
Aadd(aHelpEng,"                                 ")
Aadd(aHelpSpa,"                                 ")
PutHelp("P"+"A2_L_TPLTE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o valor do Adicional de    ")
Aadd(aHelpPor,"Mercado. A tarefa deste evento é   ")
Aadd(aHelpPor,"ajustar seu valor no MIX até que a ")
Aadd(aHelpPor,"soma das bonificações do Produtor  ")
Aadd(aHelpPor,"sejam maiores ou iguais ao valor   ")
Aadd(aHelpPor,"informado neste campo.             ")
Aadd(aHelpPor,"Este Adicional também é chamado de ")
Aadd(aHelpPor," TETO ou de Preço Negociado.       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A2_L_ADICI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe neste campo a kilometragem do")
Aadd(aHelpPor,"Laticinio até a propriedade rural.   ")
Aadd(aHelpPor,"Inicialmente este campo será         ")
Aadd(aHelpPor,"informativo, no entanto poderão ser  ")
Aadd(aHelpPor,"criados futuros eventos baseados no  ")
Aadd(aHelpPor,"mesmo.                               ")
Aadd(aHelpEng,"                                     ")
Aadd(aHelpSpa,"                                     ")
PutHelp("P"+"A2_L_ACESS",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Backup Preco Negociado. Campo usado ")
Aadd(aHelpPor," internamente pelo sistema para     ")
Aadd(aHelpPor,"armazenar o ultimo preço Adicional  ")
Aadd(aHelpPor,"de Mercado. Através deste campo o   ")
Aadd(aHelpPor,"sistema restaura o ultimo valor do  ")
Aadd(aHelpPor,"Adicional de Mercado(Preco Negociado")
Aadd(aHelpPor," ou Teto).                          ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_BKPAD",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Data de nascimento do produtor.     ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_NASCI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indique a forma de entrega de       ")
Aadd(aHelpPor,"documentos e demonstrativo para esse")
Aadd(aHelpPor,"produtor.                           ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_ENTDC",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indique se deve descontar o SENAR   ")
Aadd(aHelpPor,"deste produtor. Caso informado NAO  ")
Aadd(aHelpPor,"a taxa de Funrural sera integral,   ")
Aadd(aHelpPor,"caso contrario sera parcial.        ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_SENAR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indique se o produtor precisa fazer ")
Aadd(aHelpPor,"deposito do FUNRURAL em juizo. Nos  ")
Aadd(aHelpPor,"casos de liminar judicial.          ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_LIMIN",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indique o valor da bonificacao Extra")
Aadd(aHelpPor,"para ser calculada no MIX.          ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_EXTRA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indique o valor da bonificacao de   ")
Aadd(aHelpPor,"Fidelidade para ser calculada no MIX")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_FIDEL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indique o valor Fixo de desconto de ")
Aadd(aHelpPor,"energia do tanque.Usado na digitacao")
Aadd(aHelpPor,"do convenio de Energia do Tanque.   ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_VFIXO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Data de Desligamento do produtor    ")
Aadd(aHelpPor,"junto a empresa. Campo informativo. ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_DESLI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Relacionado ao campo A2_L_GRUPO ->  ")
Aadd(aHelpPor,"Grupo de Produtores. Usado para     ")
Aadd(aHelpPor,"compor o volume do grupo, porém o   ")
Aadd(aHelpPor,"produtor não recebe a bonificação,  ")
Aadd(aHelpPor,"caso este campo esteja com NÃO.     ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_TPPRO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indique o tipo de tributação do     ")
Aadd(aHelpPor,"produtor. Usado para geração        ")
Aadd(aHelpPor,"automática da Nota com Incentivo a  ")
Aadd(aHelpPor,"produção nos casos em que o produtor")
Aadd(aHelpPor,"excede o limite de 650.000 litros   ")
Aadd(aHelpPor,"por ano.                            ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_TRIBU",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indique se o produtor pertence a uma")
Aadd(aHelpPor,"associação. Usado para geração      ")
Aadd(aHelpPor,"automática da Nota com Incentivo a  ")
Aadd(aHelpPor,"produção nos casos em que o produtor")
Aadd(aHelpPor,"excede o limite de 650.000 litros   ")
Aadd(aHelpPor,"por ano.                            ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_TPPRO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o valor do Aluguel do Tanque")
Aadd(aHelpPor,".Que sera descontado do produtor no ")
Aadd(aHelpPor,"fechamento do leite.                ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_ALTAN",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o valor Pensão Alimentícia  ")
Aadd(aHelpPor,"Que sera descontada do produtor no  ")
Aadd(aHelpPor,"fechamento do leite.                ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_VLPEN",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o valor do desconto do      ")
Aadd(aHelpPor,"Bolsa de Estudo. Que sera descontado")
Aadd(aHelpPor,"do produtor no fechamento do leite. ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_BOLES",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o valor do desconto do      ")
Aadd(aHelpPor,"Convenio Unimed. Que sera descontado")
Aadd(aHelpPor,"do produtor no fechamento do leite. ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_CVMED",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o codigo da familia do      ")
Aadd(aHelpPor,"cooperado utilizado pela UNIMED.    ")
Aadd(aHelpPor,"Utilizado na rotina de importaçao do")
Aadd(aHelpPor,"convenio UMIED.                     ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_CUNMD",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Código da associação a qual o produ-tor")
Aadd(aHelpPor,"tor está associado. Este campo deverá  ")
Aadd(aHelpPor,"ser preenchido somente quando o campo  ")
Aadd(aHelpPor,"Tipo Fornec for iguai a A=Associacao.  ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_CDASS",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Data da alteração do status do produtor")
Aadd(aHelpPor,"referente ao incentivo ao produtor.    ")
Aadd(aHelpPor,"Quando o produto entrega mais de 670000")
Aadd(aHelpPor,"no ano, passa de Tributado para        ")
Aadd(aHelpPor,"diferido. Campo preenchido na rotina")
Aadd(aHelpPor,"de recepcao de leite.               ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_DTINC",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo de usuario do sistema, utilizado")
Aadd(aHelpPor,"para filtrar os registros na tela de   ")
Aadd(aHelpPor,"lançamento de convenios, para que os   ")
Aadd(aHelpPor,"fornecedores visualizem somente os seus")
Aadd(aHelpPor,"lançamentos.                        ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_USER",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do evento amarrado ao fornecedor")
Aadd(aHelpPor,"para aparecer na tela de lançamento    ")
Aadd(aHelpPor,"dos convenios e validar regras para o  ")
Aadd(aHelpPor,"lançamento.                        ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_EVENT",aHelpPor,aHelpEng,aHelpSpa,.T.)


aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se produtor/propriedade são ")
Aadd(aHelpPor,"participantes do Programa de Boas  ")
Aadd(aHelpPor,"Práticas de Fabricação.				 ")
Aadd(aHelpPor,"                                    ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_BPF",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Taxa administrativa cobrada da empresa")
Aadd(aHelpPor,"conveniada a cooperativa no lança- ")
Aadd(aHelpPor,"mento de convenios.    				 ")
Aadd(aHelpPor,"                                    ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_TXCON",aHelpPor,aHelpEng,aHelpSpa,.T.)


aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se produtor/propriedade são ")
Aadd(aHelpPor,"contribuintes da previdencia privada.")
Aadd(aHelpPor,"					    				 ")
Aadd(aHelpPor,"                                    ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_PREVI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor que o produtor/propriedade irá ")
Aadd(aHelpPor,"contribuir para previdencia privada. ")
Aadd(aHelpPor,"					    				")
Aadd(aHelpPor,"                                     ")
Aadd(aHelpEng,"                                     ")
Aadd(aHelpSpa,"                                     ")
PutHelp("P"+"A2_L_VLRPR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Taxa de acrescimo adicionada ao valor")
Aadd(aHelpPor,"pago a empresa conveniada a cooperativa")
Aadd(aHelpPor,"no lançamentos de convenios.        ")
Aadd(aHelpPor,"                                    ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"A2_L_ACRES",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Este produtor é classificado como ")
Aadd(aHelpPor,"Associação, pode ter produtores ")
Aadd(aHelpPor,"vinculados.	    				")
Aadd(aHelpEng,"                                     ")
Aadd(aHelpSpa,"                                     ")
PutHelp("P"+"A2_L_ASSOC",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Clientes.                  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Tipo do Cliente. Usado p/ gerar ")
Aadd(aHelpPor,"sequencia automatica do codigo.    ")
Aadd(aHelpPor,"Não preencher quando Produtor ou   ")
Aadd(aHelpPor,"Transportador Leite Granel.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"A1_L_TPCLI",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Financeiro - Contas a Receber.         ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Cod. do Setor do Produtor de Leite.")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E1_L_SETOR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do MIX do Leite.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E1_L_MIX  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Versão do MIX do Leite.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E1_L_VERSA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informa como o produtor/fretista   ")
Aadd(aHelpPor,"vai receber seu pagamento: Banco,  ")
Aadd(aHelpPor,"cheque ou dinheiro.                ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E1_L_TPPAG",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informa se o titulo é incluido ou  ")
Aadd(aHelpPor,"baixado pelo Gestão do Leite.      ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E1_L_SITUA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indice de amarracao ZLF versus SE2.")
Aadd(aHelpPor,"Usado no ambiente Gestão do Leite. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E1_L_SEEK ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Cod. do banco do produtor/fretista.")
Aadd(aHelpPor,"Usado no ambiente Gestão do Leite. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E1_L_BANCO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Cod da Agencia do produtor/fretista")
Aadd(aHelpPor," no Banco.                         ")
Aadd(aHelpPor,"Usado no ambiente Gestão do Leite. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E1_L_AGENC",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Cod. da Conta do produtor/fretista ")
Aadd(aHelpPor,"no Banco.                          ")
Aadd(aHelpPor,"Usado no ambiente Gestão do Leite. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E1_L_CONTA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do evento que originou o lan-")
Aadd(aHelpPor,"çamento no conta corrente do produtor")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"E1_L_EVENT",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Financeiro - Contas a Pagar³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Cod. do Setor do Produtor de Leite.")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E2_L_SETOR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do MIX do Leite.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E2_L_MIX  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Versão do MIX do Leite.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E2_L_VERSA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informa como o produtor/fretista   ")
Aadd(aHelpPor,"vai receber seu pagamento: Banco,  ")
Aadd(aHelpPor,"cheque ou dinheiro.                ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E2_L_TPPAG",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informa se o titulo é incluido ou  ")
Aadd(aHelpPor,"baixado pelo Gestão do Leite.      ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E2_L_SITUA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indice de amarracao ZLF versus SE2.")
Aadd(aHelpPor,"Usado no ambiente Gestão do Leite. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E2_L_SEEK ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Cod. do banco do produtor/fretista.")
Aadd(aHelpPor,"Usado no ambiente Gestão do Leite. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E2_L_BANCO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Cod da Agencia do produtor/fretista")
Aadd(aHelpPor," no Banco.                         ")
Aadd(aHelpPor,"Usado no ambiente Gestão do Leite. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E2_L_AGENC",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Cod. da Conta do produtor/fretista ")
Aadd(aHelpPor,"no Banco.                          ")
Aadd(aHelpPor,"Usado no ambiente Gestão do Leite. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"E2_L_CONTA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do evento que originou o lan-")
Aadd(aHelpPor,"çamento no conta corrente do produtor")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"E2_L_EVENT",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cabecalho da Nota de Entrada.          ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informa se foi gerado uma nota por ")
Aadd(aHelpPor,"produtor ou por municipio.         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"F1_L_TPNF ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Linha/Rota do Produtor.  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"F1_L_LINHA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Cod. do Setor do Produtor de Leite.")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"F1_L_SETOR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do MIX do Leite.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"F1_L_MIX  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Itens da Nota de Entrada.              ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Evento que gerou o item  ")
Aadd(aHelpPor,"da Nota de Entrada de Leite.       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"D1_L_EVENT",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descricao do Evento gravado no item")
Aadd(aHelpPor,"da Nota de Entrada de Leite.       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"D1_L_DESCR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indice de amarracao ZLF versus SD1.")
Aadd(aHelpPor,"Usado no ambiente Gestão do Leite. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"D1_L_SEEK ",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Movimentos Internos de Estoque.        ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nro do Tickect da Recepcao de Leite")
Aadd(aHelpPor,"que gerou a Movimentação no Estoque")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"D3_L_ORIG ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Cod. do Setor do Produtor de Leite.")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"D3_L_SETOR",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Motorista.                 ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Filial do Motorista.               ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Código do Motorista.               ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_COD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do Motorista.                 ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_NOME  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"CPF do Motorista.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_CGC   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Número da CNH do motorista.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_CNH   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Categoria da CNH do motorista.     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_CATEG ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Data de Vencimento da CNH.         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_VENCTO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"RG do Motorista.                   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_RG    ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Endereço do motorista.             ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_END   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Estado (UF) do motorista.          ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_EST   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Código do Município do motorista.  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_MUN   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição do Município do motorista")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_CMUN  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o CEP do motorista.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_CEP   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o bairro do motorista.     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_BAIRRO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o telefone do motorista.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_FONE  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe se este motorista é ou não ")
Aadd(aHelpPor,"um agente de coleta.               ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_AGECOL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe se este motorista recebeu  ")
Aadd(aHelpPor,"treinamento p/ realização da coleta")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_TREINA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe se este cadastro esta Ativo")
Aadd(aHelpPor," pois caso contrario ele não poderá")
Aadd(aHelpPor," ser utilizado.                    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_ATIVO ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Código do Transportador ou         ")
Aadd(aHelpPor,"transportadora do Motorista.       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_FRETIS",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Loja do Transportador de Leite.    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_FRETLJ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do Transportador de Leite.    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL0_NOMEFR",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Setor.                     ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial do Setor.         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL2_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Setor.                   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL2_COD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição do Setor.                ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL2_DESCRI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Local p/ entrada de leite no Estoq.")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL2_LOCAL ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe se este cadastro esta Ativo")
Aadd(aHelpPor," pois caso contrario ele não poderá")
Aadd(aHelpPor," ser utilizado.                    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL2_ATIVO ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Número do ultimo ticket (Recepção  ")
Aadd(aHelpPor," de Leite) incluído. Usado para    ")
Aadd(aHelpPor," controlar a seqüência dos tickets ")
Aadd(aHelpPor,"por setor.                         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL2_TICKET",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor do custo utilizado na geração")
Aadd(aHelpPor,"do estoque da recepção de leite.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL2_ULTMIX",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"código do Município (Fornecedor)   ")
Aadd(aHelpPor,"para quem será emitida a nota de   ")
Aadd(aHelpPor,"compra do leite dos produtores.    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL2_SA2COD",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da loja do Município        ")
Aadd(aHelpPor,"para quem será emitida a nota de   ")
Aadd(aHelpPor,"compra do leite dos produtores.    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL2_SA2LJ ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da TES da Nota do Município ")
Aadd(aHelpPor,"de compra do leite dos produtores. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL2_TES   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Define se deve emitir uma nota por ")
Aadd(aHelpPor,"produtor para o fechto. desse Setor")
Aadd(aHelpPor,"Se for NÃO, será emitida uma NF    ")
Aadd(aHelpPor,"para o município.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL2_MULTNF",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Define a série da Nota do Leite.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL2_SERIE ",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Grupo de precos            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial da Linha/Rota.    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL3_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Linha/Rota.              ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL3_COD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição da Linha/Rota            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL3_DESCRI",aHelpPor,aHelpEng,aHelpSpa,.T.)

/* Comentado pela exclusao dos campos
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Código do Fretista que normalmente ")
Aadd(aHelpPor,"faz essa linha ou rota.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL3_FRETIS",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Loja do Fretista que normalmente   ")
Aadd(aHelpPor,"faz essa linha ou rota.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL3_FRETLJ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do Fretista que normalmente   ")
Aadd(aHelpPor,"faz essa linha ou rota.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL3_NOMEFR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Código do Veículo que normalmente  ")
Aadd(aHelpPor,"faz essa linha ou rota.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL3_VEICUL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Se é Linha ou Rota ou Plataforma.  ")
Aadd(aHelpPor,"No caso da plataforma, é permitido ")
Aadd(aHelpPor,"fazer uma recepção de leite sem    ")
Aadd(aHelpPor,"sem informar o Fretista.           ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL3_TIPO  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"A forma como Frestista dessa linha ")
Aadd(aHelpPor,"recebe: Por Litro, por Km ou por   ")
Aadd(aHelpPor,"Viagem/Dia. Essa informação é muito")
Aadd(aHelpPor,"importante no pagamento do Fretista")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL3_FRMPG ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor por litro ou  km ou por dia  ")
Aadd(aHelpPor,"que o Fretista ganha.              ")
Aadd(aHelpPor,"Essa informação é muito importante ")
Aadd(aHelpPor,"pois impacta no pagto do Fretista. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL3_VLRFRT",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Percentual sobre o valor pago no   ")
Aadd(aHelpPor,"leite do produtor.                 ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL3_PCTPG ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Distância em Km dessa linha.       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL3_KM    ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe se esta linha/rota entrega ")
Aadd(aHelpPor,"o leite na plataforma.             ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL3_PLATAF",aHelpPor,aHelpEng,aHelpSpa,.T.)
*/

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Setor a que pertence a Linha/Rota. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL3_SETOR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o codigo da filial, onde o  ")
Aadd(aHelpPor,"leite do produtor deve ser entregue.")
Aadd(aHelpPor,"Usado para armazenar a filial a qual")
Aadd(aHelpPor,"o produtor pertence, Filial I ou II.")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZL3_FILENT",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Veiculo.                   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial do veiculo.       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL4_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do veiculo.              ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL4_COD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Motorista.               ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL4_MOTORI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do Motorista.                 ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL4_NOME  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Placa do veiculo.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL4_PLACA ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Tipo do veiculo.                   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL4_TIPO  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Capacidade do veiculo.             ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL4_CAPACI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Marca do tanque do veiculo.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL4_MARCA ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Quantidade de divisoes.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL4_QTDDIV",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Numero de serie.                   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL4_NSERIE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Dados do Tanque.                   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL4_TPTANQ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Placa do Reboque.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL4_PLCREB",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Prefixo do Evento.         ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial do Prefixo Evento.")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL6_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Prefixo.                 ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL6_COD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição do Prefixo do evento.    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL6_DESCRI",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Grupo de Eventos.          ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial do Grupo do Evento")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL7_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Grupo.                   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL7_COD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição do Grupo de evento.      ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL7_DESCRI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição reduzida do Grupo, usada ")
Aadd(aHelpPor,"para listar o grupo no MIX.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL7_NREDUZ",aHelpPor,aHelpEng,aHelpSpa,.T.)



//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Eventos.                   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial do Evento.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Evento.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_COD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição do evento.               ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_DESCRI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Leite - Evento que pode ser gerado,")
Aadd(aHelpPor,"alterado e excluído pelo usuário   ")
Aadd(aHelpPor,"no MIX. Financeiro - Evento gerado ")
Aadd(aHelpPor,"a partir do financeiro, como       ")
Aadd(aHelpPor,"convênios e empréstimos. Automático")
Aadd(aHelpPor,"são eventos gerados automaticamente")
Aadd(aHelpPor,"pelo sistema no fechto(Ex:FUNDEPEC)")
Aadd(aHelpPor,"Mensagens - são eventos que nao    ")
Aadd(aHelpPor,"entram no calculo mas são listados.")
Aadd(aHelpPor,"Redutor - são eventos de           ")
Aadd(aHelpPor,"penalização da qualidade.          ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_TPEVEN",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Se esse evento entra ou não na NF. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_IMPNF ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Se o evento entra ou não na base de")
Aadd(aHelpPor," cálculo do INSS.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_BASINS",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Código do produto a ser usado na NF")
Aadd(aHelpPor,"Usado quando o evento é de crédito ")
Aadd(aHelpPor,"e entra na NF.                     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_SB1COD",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Prefixo em que o evento utiliza na ")
Aadd(aHelpPor,"geração dos títulos no financeiro. ")
Aadd(aHelpPor,"Usado quando o evento é de débito. ")
Aadd(aHelpPor,"Todo evento de débito gera  titulo ")
Aadd(aHelpPor,"a descontar do produtor, com o     ")
Aadd(aHelpPor,"prefixo informado nesse campo.     ")
Aadd(aHelpPor,"Utilize um prefixo pra cada evento.")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_PREFIX",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Se esse evento deve compor o Mix,  ")
Aadd(aHelpPor,"ou seja, se ele gera ônus a empresa")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_MIX   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome reduzido dado ao evento que   ")
Aadd(aHelpPor,"aparece em relatórios e no MIX.    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_NREDUZ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o grupo o qual o evento faz")
Aadd(aHelpPor,"parte. Usado para visualizar no MIX")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_GRUPO ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Se o evento gera um débito ou um   ")
Aadd(aHelpPor,"crédito para o produtor.           ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_DEBCRE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Condição para que esse evento seja ")
Aadd(aHelpPor,"gerado. Nessa condição utilizamos  ")
Aadd(aHelpPor,"sintaxe ADVPL.                     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_CONDIC",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Fórmula que obtém o valor do evento")
Aadd(aHelpPor,"Utilizamos sintaxe ADVPL para      ")
Aadd(aHelpPor,"calcular a fórmula.                ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_FORMUL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Esse campo só é preenchido quando  ")
Aadd(aHelpPor,"for um débito. Nesse caso devemos  ")
Aadd(aHelpPor,"definir o que fazer com esse débito")
Aadd(aHelpPor,", caso não haja saldo do produtor: ")
Aadd(aHelpPor,"Baixar (Parcialmente) ou Deletar.  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_SITUAC",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Na rotina de manutenção do Mix,    ")
Aadd(aHelpPor,"podemos editar os valores dos      ")
Aadd(aHelpPor,"eventos que estiverem como SIM     ")
Aadd(aHelpPor,"nesse campo.                       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_ALTERA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Seqüência de prioridade dos eventos")
Aadd(aHelpPor,"de débito. A sequência 001 tem     ")
Aadd(aHelpPor,"precedência sobre a sequência 002. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_PRIORI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor padrão do evento. Esse valor ")
Aadd(aHelpPor,"pode ser utilizado na fórmula.     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_VALOR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"A quem pertence o evento: Produtor,")
Aadd(aHelpPor,"Transportador ou a Ambos.          ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_PERTEN",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o propósito do evento e/ou ")
Aadd(aHelpPor,"suas regras.                       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_OBS   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Se esse evento pode ser impresso no")
Aadd(aHelpPor,"Demonstrativo do Produtor(Extrato).")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_RECIBO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Código da Natureza do titulo(SE2)  ")
Aadd(aHelpPor,"gerado para o Produtor.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_NATPRD",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Código da Natureza do titulo(SE2)  ")
Aadd(aHelpPor,"gerado para o Fretista.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL8_NATFRT",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Se o evento entra ou não na base de ")
Aadd(aHelpPor," cálculo do Evento Adicional Mercado")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZL8_BASADI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Se o evento entra ou não na base de ")
Aadd(aHelpPor," cálculo do Evento Senar.           ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZL8_SENAR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Se o evento entra ou não na base de ")
Aadd(aHelpPor," cálculo do Evento Sest.            ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZL8_SEST  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Se o evento entra ou não na base de ")
Aadd(aHelpPor," cálculo do Evento Cofins.          ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZL8_COFINS",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Se o evento entra ou não na base de ")
Aadd(aHelpPor," cálculo do Evento Pis.             ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZL8_PIS   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Se o evento entra ou não na base de ")
Aadd(aHelpPor," cálculo do Evento Incentivo.       ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZL8_INCENT",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Quando informado SIM, indica que    ")
Aadd(aHelpPor,"este evento será usado na tela de   ")
Aadd(aHelpPor,"digitação do Convênio, porém ele    ")
Aadd(aHelpPor,"gerará apenas o débito para o       ")
Aadd(aHelpPor,"produtor, ou seja, não será gerado  ")
Aadd(aHelpPor,"pagamento para a Loja conveniada.   ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZL8_CONVEN",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Quando informado SIM, indica que    ")
Aadd(aHelpPor,"este evento é lançado para o dono de")
Aadd(aHelpPor,"tanque e rateado entre os usuários  ")
Aadd(aHelpPor,"do tanque.                          ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZL8_RATEIO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Quando informado SIM, indica que    ")
Aadd(aHelpPor,"este evento ira gerar o Titulo tipo ")
Aadd(aHelpPor,"NF para pagamento do Comercio, caso ")
Aadd(aHelpPor,"contrario so gera a NDF para        ")
Aadd(aHelpPor,"descontar do produtor.              ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZL8_GERNFC",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informar quantidade máxima de     ")
Aadd(aHelpPor,"parcelas permitidas no lançamento ")
Aadd(aHelpPor,"de convenios.					    ")
Aadd(aHelpPor,"Campo utilizado somente para eventos ")
Aadd(aHelpPor,"de convênios.			            ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZL8_PARCEL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informar o dia de pagamento do    ")
Aadd(aHelpPor,"fornecedor que utiliza este evento")
Aadd(aHelpPor,"de convenios.					    ")
Aadd(aHelpPor,"Campo utilizado somente para eventos")
Aadd(aHelpPor,"de convênios.			            ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZL8_PGTFOR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informar o dia limite para 		 ")
Aadd(aHelpPor,"lançamentos do convênio para venci")
Aadd(aHelpPor,"mento dentro do mes.			    ")
Aadd(aHelpPor,"Campo utilizado somente para eventos")
Aadd(aHelpPor,"de convênios.			            ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZL8_LIMITE",aHelpPor,aHelpEng,aHelpSpa,.T.)


aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informar os tipos dos fornecedores ")
Aadd(aHelpPor,"que este evento permitira na tela ")
Aadd(aHelpPor,"de lançamento dos convenios.      ")
//Aadd(aHelpPor,"Permitidos:C=Cooperado;E=Funcionários") //#LETRAS
Aadd(aHelpPor,"U_CGLT01C()")  //#LETRAS
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZL8_TIPOS",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Tipos de Análise.          ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial do Tipo de Analise")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL9_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Tipo de Analise.         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL9_COD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição do tipo de analise.      ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL9_DESCRI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,'Definimos como "Qualidade" quando é')
Aadd(aHelpPor,' um tipo de faixa referente a      ')
Aadd(aHelpPor,'qualidade do leite (Ex: Gordura) e ')
Aadd(aHelpPor,'"Outros" para qualquer outra       ')
Aadd(aHelpPor,'modalidade de faixa.               ')
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL9_TIPO  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Texto ou valor que indique uma     ")
Aadd(aHelpPor,"referencia para ser comparada com o")
Aadd(aHelpPor," valor apurado pela Análise da     ")
Aadd(aHelpPor,"Qualidade. Este campo é impresso no")
Aadd(aHelpPor,"Demonstrativo do Produtor.         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL9_REFERE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe se a faixa deve usar média ")
Aadd(aHelpPor,"aritmética ou geométrica na impres.")
Aadd(aHelpPor," do demonstrativo do Produtor.     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL9_MEDIA ",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Faixa de Indicação.        ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Cod. Filial da Faixa de Indicação. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLA_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Setor.                   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLA_SETOR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição do Setor.                ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLA_DCRSET",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Tipo da Faixa(sequencial)")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLA_COD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição do Tipo da Faixa.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLA_DCRANA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Sequencia automatica para as faixas")
Aadd(aHelpPor,"cadastradas com mesmo codigo de    ")
Aadd(aHelpPor,"tipo de faixa.                     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLA_SEQ   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor a pagar referente aos        ")
Aadd(aHelpPor,"intervalos. Pode ser negativo,     ")
Aadd(aHelpPor,"nesse caso será uma penalização.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLA_VALOR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Escala inferior da faixa.          ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLA_FXINI ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Escala superior da faixa.          ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLA_FXFIM",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Tamanho de cada step dentro de uma ")
Aadd(aHelpPor,"faixa, exemplo:")
Aadd(aHelpPor,"Faixa ini: 100; Faixa fim: 200")
Aadd(aHelpPor,"Step: 5")
Aadd(aHelpPor,"O sistema mudará de step a cada 5,")
Aadd(aHelpPor,"totalizando 20 steps na faixa")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLA_STEP",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Determina se os steps serão per-")
Aadd(aHelpPor,"corridos em ordem crescente ou")
Aadd(aHelpPor,"decrescente.")
Aadd(aHelpPor,"Crescente percorre a partir da")
Aadd(aHelpPor,"faixa inicial, decrescente a")
Aadd(aHelpPor,"partir da final")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLA_STEPOR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Define se a faixa considera apenas seu")
Aadd(aHelpPor,"valor, ou se acumula o valor da faixa")
Aadd(aHelpPor,"anterior.")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLA_ACUMUL",aHelpPor,aHelpEng,aHelpSpa,.T.)


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Analise da Qualidade.      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo Filial da Analise. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLB_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Setor.                   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLB_SETOR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição do Setor.                ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLB_DCRSET",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Data da analise.                   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLB_DATA  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do laudo da analise.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLB_LAUDO ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Hora da realização da analise.     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLB_HORA  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Código da etiqueta da analise.     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLB_ETIQTA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Código do Produtor.                ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLB_RETIRO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Loja do Produtor. Usado p/ separar ")
Aadd(aHelpPor,"as fazendas do produtor.           ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLB_RETILJ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do Produtor ou da Fazenda.    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLB_DCRRET",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Tipo da Faixa enquadrada ")
Aadd(aHelpPor,"nessa análise.                     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLB_TIPOFX",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descricao do Tipo da Faixa.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLB_DCRTPF",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor da Análise.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLB_VLRANA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se a análise do produtor    ")
Aadd(aHelpPor,"sera desqualificada, ou seja, todas")
Aadd(aHelpPor,"as bonificações de qualidade que   ")
Aadd(aHelpPor,"ele adquirir deverão ser perdidas. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLB_DESQUA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o codigo da filial, onde o  ")
Aadd(aHelpPor,"leite do produtor deve ser entregue.")
Aadd(aHelpPor,"Usado para armazenar a filial a qual")
Aadd(aHelpPor,"o produtor pertence, Filial I ou II.")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLB_FILENT",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Desvio de Rota.            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLC_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o nro do ticket referente  ")
Aadd(aHelpPor,"a viagem realizada.                ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLC_TICKET",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Data em que foi realizada a coleta ")
Aadd(aHelpPor,"do leite na propriedade do produtor")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLC_DTCOLE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Setor da Rota/Linha.               ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLC_SETOR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Rota/Linha.              ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLC_LINROT",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Transportador de leite.  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLC_FRETIS",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Loja do Transportador de leite.    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLC_LJFRET",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do Transportador de leite.    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLC_DCRFRT",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Como será pago o Tranportador:     ")
Aadd(aHelpPor,"Por km, Por Litro, Por Viagem.     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLC_FORPAG",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Quantidade de km, litro ou viagem, ")
Aadd(aHelpPor,"conforme o pagto do Transportador. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLC_QTD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor unitário referente á qtde.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLC_VALOR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Motivo do pagto do desvio de rota. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLC_OBS   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o codigo da filial, onde o  ")
Aadd(aHelpPor,"leite do produtor deve ser entregue.")
Aadd(aHelpPor,"Usado para armazenar a filial a qual")
Aadd(aHelpPor,"o produtor pertence, Filial I ou II.")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLC_FILENT",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Recepcao de Leite.         ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o nro do ticket referente  ")
Aadd(aHelpPor,"a viagem realizada.                ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_TICKET",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Data em que foi realizada a coleta ")
Aadd(aHelpPor,"do leite na propriedade do produtor")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_DTCOLE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Data em que foi digitado a recepcao")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_DTLANC",aHelpPor,aHelpEng,aHelpSpa,.T.)


aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo sequencial de recebimento.  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_CODREC",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Setor da Rota/Linha.               ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_SETOR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Rota/Linha.              ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_LINROT",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se o trecho percorrido eh do")
Aadd(aHelpPor,"rota ou linha.                     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_TP_RL ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Produtor de leite.       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_RETIRO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Loja do Produtor de leite.         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_RETILJ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do Produtor de leite.         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_DCRRET",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Transportador de leite.  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_FRETIS",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Loja do Transportador de leite.    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_LJFRET",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do veiculo utilizado no     ")
Aadd(aHelpPor,"transporte de leite.               ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_VEICUL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do motorista que transportou")
Aadd(aHelpPor,"o leite do produtor.               ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_MOTOR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Quantidade de leite do produtor.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_QTDBOM",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Esse campo nao eh mais utilizado.  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_QTDACI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Total KM percorrido da Linha/Rota. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_KM    ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se ocorreu fechamento para a")
Aadd(aHelpPor,"recepção de leite ou não. F=Fechado")
Aadd(aHelpPor,"e em branco significa em aberto.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_STATUS",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do usuario que digitou a      ")
Aadd(aHelpPor,"recepção de leite.                 ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_USER  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Quantidade total de Leite.         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_TOTBOM",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Esse campo não é mais utilizado.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_TOTACI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Volume de leite no veiculo.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_TOTAL ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor do Frete por litro de leite. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_VFRELT",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor do Frete por Produtor.       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_VFREPR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informa o uso de tanque ou latao.  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_TQ_LT ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o codigo da filial, onde o  ")
Aadd(aHelpPor,"leite do produtor deve ser entregue.")
Aadd(aHelpPor,"Usado para armazenar a filial a qual")
Aadd(aHelpPor,"o produtor pertence, Filial I ou II.")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLD_FILENT",aHelpPor,aHelpEng,aHelpSpa,.T.)


aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Item sequencial da recepção de Leite")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_ITEM  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Temperatura no caminhão.           ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_TEMPCA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição da Linha/Rota.           ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_DESLIN",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indique o tipo de tributação do     ")
Aadd(aHelpPor,"produtor. Usado para geração        ")
Aadd(aHelpPor,"automática da Nota com Incentivo a  ")
Aadd(aHelpPor,"produção nos casos em que o produtor")
Aadd(aHelpPor,"excede o limite de 650.000 litros   ")
Aadd(aHelpPor,"por ano.                            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLD_TRIBUT",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cabecalho do MIX.                      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLE_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo sequencial do MIX.          ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLE_COD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Versão do MIX. Caso existam mais de")
Aadd(aHelpPor,"um MIX no mesmo período, usa-se    ")
Aadd(aHelpPor,"versões diferentes e sequenciais.  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLE_VERSAO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Periodo inicial do MIX.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLE_DTINI ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Periodo final do MIX.              ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLE_DTFIM ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Define o status do MIX: F=Fechado  ")
Aadd(aHelpPor,"A=Aberto(Sem nenhuma aprovação);   ")
Aadd(aHelpPor,"P=Preparado(Com linhas aprovadas). ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLE_STATUS",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Serie e Numero da Nota Complementar")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLE_NFCOMP",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cabecalho do MIX.                      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo sequencial do MIX.          ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_CODZLE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Versão do MIX. Caso existam mais de")
Aadd(aHelpPor,"um MIX no mesmo período, usa-se    ")
Aadd(aHelpPor,"versões diferentes e sequenciais.  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_VERSAO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Periodo inicial do MIX.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_DTINI ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Periodo final do MIX.              ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_DTFIM ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Setor do MIX.                      ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_SETOR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do Setor do MIX.              ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_DCRSET",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Linha/Rota.              ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_LINROT",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Tipo: Linha ou Rota.               ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_TP_RL ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descricao da Linha ou Rota.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_DCRLIN",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Transportador ou Produtor")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_RETIRO ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Loja do Transportador ou ")
Aadd(aHelpPor,"Produtor                           ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_RETILJ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do Transportador ou Produtor. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_DCRRET",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Evento usado no MIX.     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_EVENTO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição do Evento.               ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_DCREVE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Sequencia do codigo do MIX.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_SEQ   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se o evento é de Debito ou  ")
Aadd(aHelpPor,"crédito.                           ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_DEBCRE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Quantidade total de Leite.         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_QTDBOM",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Esse campo não é utilizado.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_QTDACI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor por litro de Leite.          ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_VLRLTR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor total do Evento.             ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_TOTAL ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor pago no titulo. Pode ser     ")
Aadd(aHelpPor,"realizado baixa parcial no titulo. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_VLRPAG",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor original do titulo.          ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_SE1VLR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor do saldo do titulo no dia do ")
Aadd(aHelpPor,"fechamento do leite.               ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_SE1SLD",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor do juro  do titulo no dia do ")
Aadd(aHelpPor,"fechamento do leite.               ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_SE1JUR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Vencimento do titulo(E1_VENCTO).   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_SE1VEN",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Historico do titulo(E1_HIST).      ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_SE1HIS",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Origem do registro no MIX: M=Gerado")
Aadd(aHelpPor," pelo Mix;F=Gerado pelo fechamento ")
Aadd(aHelpPor,"do Leite;R=Gerado pelo Fechto Frete")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_ORIGEM",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Produtor de leite.       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_RETIRO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Loja do Produtor de leite.         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_RETILJ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do Produtor de leite.         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_DCRRET",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se realizou acerto do leite.")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_ACERTO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se é um MIX de LTE. ou Frete")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_TP_MIX",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se é um MIX de LTE. ou Frete")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_TIPO  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se o evento entra no MIX.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_ENTMIX",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se o MIX esta aberto ou nao.")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_STATUS",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Armazena o indice de pesquisa da   ")
Aadd(aHelpPor,"tabela na ZLF. SE2xSD1xZLF.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_L_SEEK",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Estado (UF) do municipio.          ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_EST   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Município do Produtor.             ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_MUN   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indice de pesquisa da Nota na ZLF. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLF_F1SEEK",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o codigo da filial, onde o  ")
Aadd(aHelpPor,"leite do produtor deve ser entregue.")
Aadd(aHelpPor,"Usado para armazenar a filial a qual")
Aadd(aHelpPor,"o produtor pertence, Filial I ou II.")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLF_FILENT",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ FILIAL ENTREGA versus LINHA.           ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLG_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Linha/Rota.              ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLG_COD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição da Linha/Rota            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLG_DESCRI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o codigo da filial, onde o  ")
Aadd(aHelpPor,"leite do produtor deve ser entregue.")
Aadd(aHelpPor,"Usado para armazenar a filial a qual")
Aadd(aHelpPor,"o produtor pertence, Filial I ou II.")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLG_FILENT",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Guarda ate que data a rota pertencia")
Aadd(aHelpPor,"a determinada filial.               ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLG_VENCTO",aHelpPor,aHelpEng,aHelpSpa,.T.)


aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indique o tipo de tributação do     ")
Aadd(aHelpPor,"produtor. Usado para geração        ")
Aadd(aHelpPor,"automática da Nota com Incentivo a  ")
Aadd(aHelpPor,"produção nos casos em que o produtor")
Aadd(aHelpPor,"excede o limite de 650.000 litros   ")
Aadd(aHelpPor,"por ano.                            ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLF_TRIBUT",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Lancamento dos convenios.              ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo sequencial do Convenio.     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_SEQ   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Convenio.                ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_COD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Data de Emissao do Convenio.       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_DATA  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Data de Vencimento do titulo NDF   ")
Aadd(aHelpPor,"a ser descontado do produtor.      ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_VENCTO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Dia de vencimento do titulo NF a ser")
Aadd(aHelpPor," pago para a loja conveniada.       ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLL_VENCON",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Código do Convenio(Fornecedor).    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_CONVEN",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Loja do Convenio(Fornecedor).      ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_LJCONV",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Código do Produtor.                ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_RETIRO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Loja do Produtor.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_RETILJ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do Produtor.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_DCRRET",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor do Convenio.                 ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_VALOR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Situação do Evento: A=Aberto( nao  ")
Aadd(aHelpPor,"gerou financeiro); P=Pago ( gerou  ")
Aadd(aHelpPor,"financeiro); S=Suspenso(Produtor s/")
Aadd(aHelpPor,"saldo para quitar o convenio).     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_STATUS",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Setor onde o convenio foi lançado. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_SETOR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Observação do Convenio.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_OBSERV",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Natureza a ser usada na geração do ")
Aadd(aHelpPor,"titulo gerado no contas a pagar.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_NATURE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do evento a ser usado para o")
Aadd(aHelpPor,"convenio.                          ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_EVENTO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Gera um acréscimo a favor da loja  ")
Aadd(aHelpPor,"conveniada.                        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_ACRESC",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Gera um desconto contra a loja     ")
Aadd(aHelpPor,"conveniada.                        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLL_TXADM ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o codigo da filial, onde o  ")
Aadd(aHelpPor,"leite do produtor deve ser entregue.")
Aadd(aHelpPor,"Usado para armazenar a filial a qual")
Aadd(aHelpPor,"o produtor pertence, Filial I ou II.")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLL_FILENT",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Solicitacao de Emprestimos.            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Emprestimo.              ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_COD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Produtor ou Fretista.    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_SA2COD",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Loja do Produtor ou Fretista.      ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_SA2LJ ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do Produtor ou Fretista.      ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_SA2NOM",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Observação do Emprestimo.          ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_OBS   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Data de solicitação do Empréstimo e")
Aadd(aHelpPor,"data de emissao do titulo, gerado  ")
Aadd(aHelpPor,"no contas a pagar para pagamento do")
Aadd(aHelpPor,"empréstimo ao produtor.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_DATA  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Data de Vencimento do Empréstimo e ")
Aadd(aHelpPor,"data de Vencimento do titulo,gerado")
Aadd(aHelpPor,"no contas a pagar para pagamento do")
Aadd(aHelpPor,"empréstimo ao produtor.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_VENCTO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Data da avaliação do empréstimo.   ")
Aadd(aHelpPor,"Não influência nos titulos.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_DTAPRO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Data de Liberação do Empréstimo e  ")
Aadd(aHelpPor,"data de emissao do titulo, gerado  ")
Aadd(aHelpPor,"no contas a pagar para descontar o ")
Aadd(aHelpPor,"empréstimo do produtor.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_DTLIB ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor total do empréstimo.         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_TOTAL ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Quantidade de parcelas do emprést. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_PARC  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Percentual de juros cobrados ao mês")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_JUROS ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor da Parcela.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_VLRPAR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Status do Empréstimo: 1=Aberto;    ")
Aadd(aHelpPor,"2=Aprovado;3=Reprovado;4=Efetivado ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_STATUS",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do usuario que solicitou o  ")
Aadd(aHelpPor,"emprestimo.                        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_USER  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do usuario que solicitou o    ")
Aadd(aHelpPor,"emprestimo.                        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_NUSER ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do usuario que aprovou o    ")
Aadd(aHelpPor,"emprestimo.                        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_USERAP",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do usuario que aprovou o      ")
Aadd(aHelpPor,"emprestimo.                        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_NUSEAP",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor total do empréstimo.         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_PAGTO ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor total do empréstimo.         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_TIPO  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Tipo do Empréstimo: A=Adiantamento;")
Aadd(aHelpPor,"E=Emprestimo; N=Financiamento.     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_SETOR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Flag de Marcacao usado para motar o")
Aadd(aHelpPor,"browse na rotina consulta produtor.")
Aadd(aHelpPor,"Marca e desmarca os emprestimos.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLM_FLAG ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o codigo da filial, onde o  ")
Aadd(aHelpPor,"leite do produtor deve ser entregue.")
Aadd(aHelpPor,"Usado para armazenar a filial a qual")
Aadd(aHelpPor,"o produtor pertence, Filial I ou II.")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLM_FILENT",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Itens da Solicitacao de Emprestimo ao Produtor. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLO_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Emprestimo.              ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLO_COD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Item do Emprestimo.                ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLO_ITEM  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Data de Vencimento da parcela de   ")
Aadd(aHelpPor,"empréstimo gerada no contas pagar, ")
Aadd(aHelpPor,"para descontar do produtor.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLO_VECTO ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor da parcela de empréstimo     ")
Aadd(aHelpPor,"gerada no contas a pagar, para     ")
Aadd(aHelpPor,"descontar do produtor.             ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLO_VALOR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o codigo da filial, onde o  ")
Aadd(aHelpPor,"leite do produtor deve ser entregue.")
Aadd(aHelpPor,"Usado para armazenar a filial a qual")
Aadd(aHelpPor,"o produtor pertence, Filial I ou II.")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLO_FILENT",aHelpPor,aHelpEng,aHelpSpa,.T.)



//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Mensagens.                          ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome reduzido do usuario.          ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_USER  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Setores que o usuario terá acesso. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_SETOR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do usuario no configurador. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_CODUSU",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do usuario.                   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_NOME  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do usuario no cadastro de   ")
Aadd(aHelpPor,"funcionarios, vinculado ao usuario ")
Aadd(aHelpPor,"no configurador.                   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_MATRIC",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se o usuario tem permissão  ")
Aadd(aHelpPor,"para incluir solicitação de        ")
Aadd(aHelpPor,"empréstimo.                        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_EMPSOL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se o usuario tem permissão  ")
Aadd(aHelpPor,"para Aprovar solicitação de        ")
Aadd(aHelpPor,"empréstimo.                        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_EMPAPR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se o usuario tem permissão  ")
Aadd(aHelpPor,"para Efetivar solicitação de       ")
Aadd(aHelpPor,"empréstimo.                        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_EMPEFE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se o usuario tem permissão  ")
Aadd(aHelpPor,"para executar a rotina de          ")
Aadd(aHelpPor,"fechamento de Leite ou Frete.      ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_ACERTO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se o usuario tem permissão  ")
Aadd(aHelpPor,"para executar a rotina de          ")
Aadd(aHelpPor,"cancelamento do fechamento de Leite")
Aadd(aHelpPor," ou Frete.                         ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_CANCEL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se o usuario tem permissão  ")
Aadd(aHelpPor,"para incluir eventos no MIX.       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_GEREVE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se o usuario tem permissão  ")
Aadd(aHelpPor,"para aprovar o MIX.                ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_APRMIX",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se o usuario tem permissão  ")
Aadd(aHelpPor,"para incluir desvios de rotas na   ")
Aadd(aHelpPor,"rotina de recebimento de leite.    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_DESVRO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se o usuario tem permissão  ")
Aadd(aHelpPor,"para aprovar desvios de rotas      ")
Aadd(aHelpPor,"lançados na rotina de recebimento  ")
Aadd(aHelpPor,"de leite.  							 ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_APDESV",aHelpPor,aHelpEng,aHelpSpa,.T.)


aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica nivel do usuario. Este campo")
Aadd(aHelpPor,"não esta sendo utilizado.          ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_NIVEL ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Indica se o usuario tem permissão  ")
Aadd(aHelpPor,"para utiliza a rotina de convenios.")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLU_CONVEN",aHelpPor,aHelpEng,aHelpSpa,.T.)


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Grupo de Produtores.       ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial do Grupo Produtor.")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL5_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Grupo de produtores.     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL5_COD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição do Grupo de Produtores.  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZL5_DESCRI",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Tanque.                    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo sequencial do tanque.       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_COD",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome ou descricao do tanque.       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_DESCRI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Produtor responsavel por administrar")
Aadd(aHelpPor,"o tanque.Essa figura existe quando ")
Aadd(aHelpPor,"a classificação é Coletiva.        ")
Aadd(aHelpPor,"Se comunitaria pode existir ou não ")
Aadd(aHelpPor,"o administrador do tanque.         ")
Aadd(aHelpPor,"Se Individual, o Titular e Agregado")
Aadd(aHelpPor,"devem ser informados igualmente.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_TITCOD",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Loja do produtor responsavel por   ")
Aadd(aHelpPor,"administrar o tanque.              ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_TITLOJ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do produtor responsavel por   ")
Aadd(aHelpPor,"administrar o tanque.              ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_TITNOM",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Tipo da Taxa de Resfriamento a ser ")
Aadd(aHelpPor,"paga ao Titular. A despesa sera    ")
Aadd(aHelpPor,"rateada entre os agregados.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_TPRES",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor da Taxa de Resfriamento a ser")
Aadd(aHelpPor,"paga ao Titular. A despesa sera    ")
Aadd(aHelpPor,"rateada entre os agregados.        ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_TXRES",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do Produtor responsável por ")
Aadd(aHelpPor,"transportar o leite das fazendas   ")
Aadd(aHelpPor,"ate o tanque de resfriamento.      ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_CODLTE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Loja do Produtor responsável por   ")
Aadd(aHelpPor,"transportar o leite das fazendas   ")
Aadd(aHelpPor,"ate o tanque de resfriamento.      ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_LOJLTE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do Produtor responsável por   ")
Aadd(aHelpPor,"transportar o leite das fazendas   ")
Aadd(aHelpPor,"ate o tanque de resfriamento.      ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_NOMLTE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Tipo da Taxa de Frete 1o Percurso  ")
Aadd(aHelpPor,"a ser paga ao Leiteiro. A despesa  ")
Aadd(aHelpPor,"sera rateada entre os agregados.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_TPFRT",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor da Taxa de Frete 1o Percurso ")
Aadd(aHelpPor,"a ser paga ao Leiteiro. A despesa  ")
Aadd(aHelpPor,"sera rateada entre os agregados.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_TXFRT",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Classificacao do tanque Individual:")
Aadd(aHelpPor,"apenas uma pessoa usa o tanque;    ")
Aadd(aHelpPor,"Coletivo: varias pessoas usam porem")
Aadd(aHelpPor,"a analise é apenas de uma e replica")
Aadd(aHelpPor,"para os demais; Comunitario: varias")
Aadd(aHelpPor,"pessoas usam e a analise de qualid.")
Aadd(aHelpPor,"qualidade é individual.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_CLASTQ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Entidade proprietaria do tanque.   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_ENTIDA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Capacidade em litros do tanque.    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_CAPACI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Tipo de Refriamento usado no tanque")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_TPRESF",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Marca do tanque.                   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_MARCA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Serie do tanque.                   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_SERIE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Distancia em KM do tanque até o    ")
Aadd(aHelpPor,"local de descarregamento do leite. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_KM",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe SIM para que este tanque   ")
Aadd(aHelpPor,"fique bloqueado e não seja usado   ")
Aadd(aHelpPor,"em nenhum tipo de movimentação.    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLS_MSBLQL",aHelpPor,aHelpEng,aHelpSpa,.T.)

//ITENS
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial.                  ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLT_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo sequencial do tanque.       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLT_COD",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Produtor agregado ou participante  ")
Aadd(aHelpPor,"ou usuario do tanque.              ")
Aadd(aHelpPor,"                                   ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLT_SA2COD",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Loja do produtor participante do   ")
Aadd(aHelpPor,"tanque.                            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLT_SA2LJ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do produtor participante do   ")
Aadd(aHelpPor,"tanque.                            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLT_SA2NOM",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe SIM para que a taxa de     ")
Aadd(aHelpPor,"resfriamento paga ao Titular seja  ")
Aadd(aHelpPor,"descontada deste agregado. Informe ")
Aadd(aHelpPor,"NAO para nao descontar a taxa.     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLT_DESCRE",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe SIM para que a taxa de Frete")
Aadd(aHelpPor,"1o percurso paga ao Leiteiro, seja ")
Aadd(aHelpPor,"descontada deste agregado. Informe ")
Aadd(aHelpPor,"NAO para nao descontar a taxa.     ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLT_DESCFR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe a ocorrencia referente  ")
Aadd(aHelpPor,"a este desvio para indicar se a ")
Aadd(aHelpPor,"diferença no KM será pago ao	 ")
Aadd(aHelpPor,"transportador.					 ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLC_CODZLH",aHelpPor,aHelpEng,aHelpSpa,.T.)


aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe se esta ocorrencia ira     ")
Aadd(aHelpPor,"gerar impacto financeiro no calculo")
Aadd(aHelpPor,"do frete.                          ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLH_FINANC",aHelpPor,aHelpEng,aHelpSpa,.T.)


aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe se esta ocorrencia ira   ")
Aadd(aHelpPor,"reduzir ou aumentar o valor a ser")
Aadd(aHelpPor,"pago para o transportador. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLH_FATOR",aHelpPor,aHelpEng,aHelpSpa,.T.)


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Linhas Rotas               ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Filial da Linha/Rota.    ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLW_FILIAL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da Linha/Rota.              ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLW_COD   ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição da Linha/Rota            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLW_DESCRI",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Código do Fretista que normalmente ")
Aadd(aHelpPor,"faz essa linha ou rota.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLW_FRETIS",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Loja do Fretista que normalmente   ")
Aadd(aHelpPor,"faz essa linha ou rota.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLW_FRETLJ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do Fretista que normalmente   ")
Aadd(aHelpPor,"faz essa linha ou rota.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLW_NOMEFR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Código do Veículo que normalmente  ")
Aadd(aHelpPor,"faz essa linha ou rota.            ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLW_VEICUL",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Se é Linha ou Rota ou Plataforma.  ")
Aadd(aHelpPor,"No caso da plataforma, é permitido ")
Aadd(aHelpPor,"fazer uma recepção de leite sem    ")
Aadd(aHelpPor,"sem informar o Fretista.           ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLW_TIPO  ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"A forma como Frestista dessa linha ")
Aadd(aHelpPor,"recebe: Por Litro, por Km ou por   ")
Aadd(aHelpPor,"Viagem/Dia. Essa informação é muito")
Aadd(aHelpPor,"importante no pagamento do Fretista")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLW_FRMPG ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Valor por litro ou  km ou por dia  ")
Aadd(aHelpPor,"que o Fretista ganha.              ")
Aadd(aHelpPor,"Essa informação é muito importante ")
Aadd(aHelpPor,"pois impacta no pagto do Fretista. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLW_VLRFRT",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Percentual sobre o valor pago no   ")
Aadd(aHelpPor,"leite do produtor.                 ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLW_PCTPG ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Setor a que pertence a Linha/Rota. ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLW_SETOR ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Distância em Km dessa linha.       ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLW_KM    ",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe se esta linha/rota entrega ")
Aadd(aHelpPor,"o leite na plataforma.             ")
Aadd(aHelpEng,"                                   ")
Aadd(aHelpSpa,"                                   ")
PutHelp("P"+"ZLW_PLATAF",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Informe o codigo da filial, onde o  ")
Aadd(aHelpPor,"leite do produtor deve ser entregue.")
Aadd(aHelpPor,"Usado para armazenar a filial a qual")
Aadd(aHelpPor,"o produtor pertence, Filial I ou II.")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLW_FILENT",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Se a rota será executada em dias   ")
Aadd(aHelpPor,"pares ou dias impares somente ou   ")
Aadd(aHelpPor,"será para todos os dias            ")
Aadd(aHelpPor,"                                   ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLW_DIAPI",aHelpPor,aHelpEng,aHelpSpa,.T.)


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Amarração de Linhas Rotas com Produtores³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ


aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo da rota para ser amarrada   ")
Aadd(aHelpPor,"aos produtores pertecentes a mesma ")
Aadd(aHelpPor,"                                   ")
Aadd(aHelpPor,"                                   ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLY_ROTA",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Descrição da rota a ser amarrada   ")
Aadd(aHelpPor,"aos produtores pertecentes a mesma ")
Aadd(aHelpPor,"                                   ")
Aadd(aHelpPor,"                                   ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLY_DESROT",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do fretista que faz a rota    ")
Aadd(aHelpPor,"                                   ")
Aadd(aHelpPor,"                                   ")
Aadd(aHelpPor,"                                   ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLY_NOMEFR",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Codigo do produtor a ser amarrado  ")
Aadd(aHelpPor,"a rota de entrega                  ")
Aadd(aHelpPor,"                                   ")
Aadd(aHelpPor,"                                   ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLZ_CODPRO",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Loja   do produtor a ser amarrado  ")
Aadd(aHelpPor,"a rota de entrega                  ")
Aadd(aHelpPor,"                                   ")
Aadd(aHelpPor,"                                   ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLZ_LJPROD",aHelpPor,aHelpEng,aHelpSpa,.T.)

aHelpPor := {}
aHelpEng := {}
aHelpSpa := {}
Aadd(aHelpPor,"Nome do produtor a ser amarrado  ")
Aadd(aHelpPor,"a rota de entrega                  ")
Aadd(aHelpPor,"                                   ")
Aadd(aHelpPor,"                                   ")
Aadd(aHelpEng,"                                    ")
Aadd(aHelpSpa,"                                    ")
PutHelp("P"+"ZLZ_NOMEPR",aHelpPor,aHelpEng,aHelpSpa,.T.)

Return(cTexto)
