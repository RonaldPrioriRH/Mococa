#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"   
#INCLUDE "EICCONST.CH"
#include "rwmake.ch"

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ AGLT030  º Autor ³ TOTVS                 º Data da Criacao  ³ 17/06/2010                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Mbrowse para Inclusao e Exclusao de Nota de Complemento para o Produtor.                         	        º±±
±±º          ³ 															                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Gera Nota Complementar, quando Credito para o produtor.        		                                        º±±
±±º		     ³                                                                                                              º±±
±±º		     ³ Esta rotina so deve ser utilizada quando voce precisar complementar o preco pago pelo Leite, para acertos    º±±
±±º		     ³ de convenios, ou adiantamentos ou emprestimos lancados incorretamente, deve-se utilizar a rotina de Estorno  º±±
±±º		     ³ de movimento.                                                                                                º±±
±±º		     ³                                                                                                              º±±
±±º		     ³ So utilize esta rotina para casos que voce precisa aumentar o valor pago no leite, ou seja, para aumentar o  º±±
±±º		     ³ custo do leite. Lembrando que este acerto eh do mes ja pago, no entanto seu custo ficara no mes de lancamentoº±±
±±º		     ³ da Nota, pois devido a NF-e nao se pode retroagir a data desta nota.                                         º±±
±±º		     ³                                                                                                              º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Nenhum                                                                                 						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum											                                                 	        º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³                                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ GLT - Gestao do Leite.                                                                  						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                                                  ³                                  ³             º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function AGLT030()

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Declaracao de Variaveis                                             ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Private cCadastro := "Complemento Preco Produtor"
Private bRotina1  := {|| xRotina('V')}
Private bRotina2  := {|| xRotina('I')}
Private bRotina4  := {|| xRotina('E')}
Private bRotina5  := {|| LegComp()   }

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Monta um aRotina proprio                                            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Private aRotina := {;
{"Pesquisar"   ,"AxPesqui"      ,0,1},;
{"Visualizar"  ,"Eval(bRotina1)",0,2},;
{"Incluir"     ,"Eval(bRotina2)",0,3},;
{"Excluir"     ,"Eval(bRotina4)",0,5},;
{"Legenda"     ,"Eval(bRotina5)",0,4}}

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Monta um array com as regras para apresentacao de cada cor.         ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Private aCores := {;
{"ZLF_DEBCRE == 'C'",'ENABLE'  },;
{"ZLF_DEBCRE == 'D'",'DISABLE' }}

Private cDelFunc := ".T." // Validacao para a exclusao. Pode-se utilizar ExecBlock
Private cString  := "ZLF"
Private cPerg    := "AGLT030   "
Private cSerie   := ""//Serie da NF
Private cEvetCom := ALLTRIM(GetMv("LT_EVECOMP")) //Codigo do Evento de Complemento de Preco
Private cProdCmp := "" //Codigo do Produto Complemento
Private cCodMix  := "" //Codigo do MIX
Private cSetor   := "" //Codigo do Setor
Private cNatureza:= "" //Codigo da Natureza utilizada no titulo e na NF
Private cFiltra  := "" //Expressao do filtro do Browse
Private cNroNota := "" //Nro da Nota Fiscal
Private aIndexZLF:= {}
Private cForINSS := PADR(ALLTRIM(GetMv("MV_FORINSS")),6)
Private cLojINSS := "00"
Private nBasINSS := 0
Private nPerINSS := POSICIONE("ZL8",1,xFILIAL("ZL8")+ALLTRIM(GetMv("LT_EVEINSS")),"ZL8_VALOR")
Private cEvetInc := ALLTRIM(GetMv("LT_EVEINCE")) //Codigo do Evento de Incentivo(ICMS)
Private cEvetFun := AllTrim(GetMv("LT_EVEINSS")) //Codigo do evento de INSS (Funrural)
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cria as perguntas e chama a tela de parametros.                         ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
AjustaSX1()
If !Pergunte(cPerg,.T.)
	Return()
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Preenche o codigo do MIX.                                                 ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cSetor  := SubStr(MV_PAR01,1,6)
cCodMix := MV_PAR02

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cria o filtro na MBrowse utilizando a função FilBrowse. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cFiltra := "ZLF_SETOR == '"+cSetor+"' .AND. ZLF_CODZLE == '"+cCodMix+"' .AND. ZLF_VERSAO == '2'"
FilBrowse(cString,@aIndexZLF,@cFiltra)

dbSelectArea(cString)
dbSetOrder(1)

mBrowse( 6,1,22,75,cString,,"ZLF_DEBCRE",,,,aCores)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Deleta o filtro utilizado na funcao FilBrowse.          ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
EndFilBrw(cString,aIndexZLF)

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ LegComp  º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Monta com a Legenda.                                       º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AGLT030                                                    º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function LegComp()

Local aCores := {;
{'ENABLE' ,"Movimento Credito"}}

BrwLegenda(cCadastro,"Legenda",aCores)

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ xRotina  º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Monta a tela de alteracao, visualizacao e exclusao.        º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AOMS038                                                    º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function xRotina(cOpcBrw)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Declaracao das variaveis Locais.                  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Local nOpcao   := 0
Local aSize    := {}
Local aInfo    := {}
Local aPosObj  := {}
Local aPosEnch := {}
Local lBotaoOk := .F. //Valida se o usuario pressionou o botao de Ok da Tela
Local lAltera  := .F. //Valida se trata de Alteracao
Local lExclui  := .F. //Valida se trata de Exclusao
Local lEdita   := .F. //Define o acesso a rotina, Edicao(.T.) ou Visualizacao(.F.).
Local cAnoMes  := ""
Local oDlg1

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica qual opcao no Browse o usuario acessou.  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Do Case
	Case cOpcBrw == "V" // Visualizar
		nOpcao := 2
		lEdita := .F.
	Case cOpcBrw == "I" // INCLUIR
		nOpcao  := 3
		lAltera := .T.
		lEdita  := .T.
	Case cOpcBrw == "E" // Excluir
		nOpcao  := 2
		lExclui := .T.
		lEdita  := .F.
EndCase


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona no cadastro de MIX para conferir as datas.                    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("ZLE")
dbSetOrder(1)//ZLE_FILIAL+ZLE_COD+ZLE_VERSAO
dbSeek(xFILIAL("ZLE")+cCodMix+"1")

cAnoMes := SubStr(DTOS(ADDMes(ZLE->ZLE_DTINI,1)),1,6)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se a data do sistema correponde ao mes posterior ao mes do MIX.  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If cOpcBrw == "I"
	If cAnoMes <> SubStr(DTOS(dDataBase),1,6)
		xMagHelpFis("Data","O MIX selecionado, refere-se ao leite entregue no mês "+SubStr(DTOS(ZLE->ZLE_DTINI),5,2)+".",;
		"Altere a data do sistema para o período subsequente ao do MIX. Sugestão: Mês "+SubStr(cAnoMes,5,2)+" de "+SubStr(cAnoMes,1,4))
		Return()
	EndIf
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se o MIX esta fechado.                                           ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If cOpcBrw == "I"
	If ZLE->ZLE_STATUS <> "F"
		xMagHelpFis("Status","O MIX selecionado, não foi fechado, logo o mesmo não pode ter complementos",;
		"Você só deve lançar complemento de um MIX finalizado, porque senão o número da nota de complemento ficará menor que as notas dos produtores e com data superior.")
		Return()
	EndIf
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se eh uma exclusao, caso seja valida se houve fechamento.      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If cOpcBrw == "E"
	If ZLF->ZLF_ORIGEM <> "C"
		xMagHelpFis("Exclusao","Movimento diferente de COMPLEMENTO não pode ser excluído por esta rotina.",;
		"Verifique se você escolheu o movimento correto ou utilize o MIX para excluir este movimento.")
		Return()
	EndIf
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Carrega os campos do cabecalho como variaveis de Memoria( M->XX_XXX ).  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If cOpcBrw == "V" .OR. cOpcBrw == "E"
	RegToMemory(cString,.F.)
Else
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Carrega os campos como variaveis de memoria.                            ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	RegToMemory(cString,.T.)
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Grava os campos com os dados que nao podem ser alterados pelo usuario.  ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	M->ZLF_SETOR  := cSetor
	M->ZLF_DCRSET := POSICIONE("ZL2",1,xFilial("ZL2")+cSetor,"ZL2_DESCRI")
	M->ZLF_CODZLE := cCodMix
	M->ZLF_VERSAO := "2"
	M->ZLF_DTINI  := dDataBase
	M->ZLF_DTFIM  := dDataBase
	M->ZLF_DEBCRE := "C"
	M->ZLF_ORIGEM := "C"	
	M->ZLF_EVENTO := cEvetCom
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Define o tamanho da tela e faz tratamento para dimensionamento qdo usado resolucoes diferentes.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aSize := MsAdvSize()
aObjects := {}
AAdd( aObjects, { 100, 100, .T., .T. } )
AAdd( aObjects, { 100, 100, .T., .T. } )

aInfo    := {aSize[1],aSize[2],aSize[3],aSize[4],3,3}
aPosObj  := MsObjSize(aInfo,aObjects)

//Vetor com coordenadas para criação da enchoice no formato {<top>, <left>, <bottom>, <right>}
AAdd( aPosEnch, { aPosObj[1][1],aPosObj[1][2], aPosObj[2][3], aPosObj[2][4] } )

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Tela estilo Modelo 3 - Cabecalho e Itens.                                    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
DEFINE MSDIALOG oDlg1 TITLE cCadastro FROM aSize[7],0 TO aSize[6],aSize[5] OF oMainWnd PIXEL
EnChoice(cString,(cString)->(Recno()),nOpcao,,,,,aPosEnch[1],,3)
ACTIVATE MSDIALOG oDlg1 ON INIT EnchoiceBar(oDlg1 , {||lBotaoOk:=.T.,oDlg1:End()} , {||lBotaoOk:=.F.,oDlg1:End()} )

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Se o usuario confirmar no botao de Ok da tela.                               ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If lBotaoOk
	If lAltera
		IncArq()
	ElseIf lExclui
		ExcArq()
	EndIf
EndIf


Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ IncArq   º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Faz a gravacao dos dados no arquivo.                       º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AGLT030                                                    º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function IncArq()

Local lDeuErro := .F. //Flag pra saber se deu erro
Local lPagaNow := .F. //Flag pra saber se Gera Nota de Complemento ou debita no proximo MIX
Local cNroTit  := SubStr(DTOS(dDataBase),7,2)+SubStr(DTOS(dDataBase),5,2)+SubStr(DTOS(dDataBase),1,4)+"1"
Local cBkpFil  := cFilAnt
Local _nVlrFunr := 0 
Local _nVlrIncent := 0
Local _nVlrRet := 0
Local _cHist := ""

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona no cadastro de Produtor.                   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("SA2")
dbSetOrder(1)
dbSeek(xFILIAL("SA2")+M->ZLF_RETIRO+M->ZLF_RETILJ)

DbSelectArea("ZL2")
DbSetOrder(1)
DbSeek(xFILIAL("ZL2") + cSetor)


//cFilAnt := SA2->A2_L_FILIA
cFilAnt := U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,dDataBase)//Filial de entrega da linha do produtor
cSerie  := PADR(ALLTRIM(GETMV("LT_SERIE")),TAMSX3("F1_PREFIXO")[1])//Serie da NF

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona no Cadastro de Evento de Complemento. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("ZL8")
dbSetOrder(1)//ZL8_FILIAL+ZL8_COD
dbSeek(xFILIAL("ZL8")+cEvetCom)
cProdCmp := ZL8->ZL8_SB1COD //Produto Complemento Preco
cNatureza:= ZL8->ZL8_NATPRD //Natureza do titulo

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Confirma o numero da Nota com o usuario. ³ Sx5NumNota(@cSerie,SuperGetMV("MV_TPNRNFS"))
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cFilAnt := "010101"
If Sx5NumNota(cSerie)
	cNroNota := NxtSX5Nota(cSerie)
Else   

	xMagHelpFis("NAO CONFORMIDADE",;
	"Numero da Nota inválido!",;
	"É obrigatorio informar o número da Nota e série corretos.")
	Return()
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Monta o indice de busca da Nota. ³
//³ Usado para fazer amarracao entre ³
//³ ZLF X SF1 X SE2                  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cSeek := xFILIAL("SF1")+cNroNota+cSerie+M->ZLF_RETIRO+M->ZLF_RETILJ+"N"

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Inicia o controle de transacao.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Begin Transaction

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Gravacao dos campos Alterados no cabecalho.                            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea(cString)
RecLock(cString,.T.)
For nConCab := 1 To FCount()
	FieldPut(nConCab,M->&(FieldName(nConCab)))
Next nConCab
(cString)->ZLF_FILIAL := xFILIAL("ZLF")
(cString)->ZLF_L_SEEK := cSeek
(cString)->ZLF_ORIGEM := "C"
(cString)->ZLF_EVENTO := cEvetCom
(cString)->(MsUnlock())

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Chama inclusao da NF de Complemento ou inclusao de Contas a Pagar.     ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
MsgRun("Aguarde.... Gerando Nota de Complemento...",,{||CursorWait(), lDeuErro:=GrvNfCmp(M->ZLF_RETIRO,M->ZLF_RETILJ,M->ZLF_TOTAL,M->ZLF_OBCOMP), CursorArrow()})



//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Inclusão do incentivo a producao referente a nota de complemento.      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If !(lDeuErro) .and. SA2->A2_L_ICMS=="S" //Se Cooperado for optante pelo ICMS inclui credito de incentivo a produção.
	dbSelectArea("ZL8")
	dbSetOrder(1)//ZL8_FILIAL+ZL8_COD
	dbSeek(xFILIAL("ZL8")+cEvetInc)
	_nVlrIncent := (ZL8->ZL8_VALOR/100) *  M->ZLF_TOTAL //Valor do incentivo
	_nVlrIncent := Round(_nVlrIncent,2)
	_cHist := "INCENT.PROD.NF COMPL. LEITE"
	MsgRun("Aguarde.... Gerando INCENTIVO PRODUÇÃO...",,{||CursorWait(),lDeuErro:=IncluiSE2(_nVlrIncent,cNroNota,"01","NF ",M->ZLF_RETIRO,M->ZLF_RETILJ,cSeek,cEvetInc,_cHist),CursorArrow()})
EndIf


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Inclusão do titulo de retenção do ICMS                                 ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If !(lDeuErro) .and. SA2->A2_L_ICMS=="S" //Se Cooperado for optante pelo ICMS inclui credito de incentivo a produção.
	dbSelectArea("ZL8")
	dbSetOrder(1)//ZL8_FILIAL+ZL8_COD
	If dbSeek(xFILIAL("ZL8")+"120002")
		_nVlrRet := U_PAGTORETICM('000030',M->ZLF_TOTAL)
		_nVlrRet := Round(_nVlrRet,2)
		_cHist := "RETENÇÃO ICMS NF COMPL. LEITE"
		MsgRun("Aguarde.... Gerando RETENÇÃO ICMS...",,{||CursorWait(),lDeuErro:=IncluiSE2(_nVlrRet,cNroNota,"01","NDF",M->ZLF_RETIRO,M->ZLF_RETILJ,cSeek,"120002",_cHist),CursorArrow()})
	EndIf
EndIf



//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Inclusão do titulo de debito do FUNRURAL. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
_nVlrFunr += IIF(SA2->A2_L_INSS=="S", M->ZLF_TOTAL*0.021, 0)
_nVlrFunr += IIF(SA2->A2_L_SENAR=="S", M->ZLF_TOTAL*0.002, 0)

//Gera titulo de débito do Funrural ao cooperado
If !(lDeuErro) .and. _nVlrFunr > 0
	_cHist := "FUNRURAL NF COMPL. LEITE"
	MsgRun("Aguarde.... Gerando FUNRURAL...",,{||CursorWait(),lDeuErro:=IncluiSE2(_nVlrFunr,cNroNota,"01","NDF",M->ZLF_RETIRO,M->ZLF_RETILJ,cSeek,cEvetFun,_cHist),CursorArrow()})
EndIf



/* COMENTADO PARA NÃO GERAR TITULO DE TX DE PAGAMENTO DO FUNRURAL - COOPRATA 05/06/14
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Se nao houve falha, inclui titulo para pagamento do Funrural(INSS). ³
//³ Lembrando que exclusivamente para a Nota de Complemento o Funrural  ³
//³ nao sera debitado do Produtor, no entanto o laticinio assume a      ³
//³ a responsabilidade de paga-lo.                                      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If !(lDeuErro)
	MsgRun("Aguarde.... Gerando FUNRURAL...",,{||CursorWait(),lDeuErro:=IncluiSE2((nBasINSS * (nPerINSS/100)),cNroNota,"01","TX ",cForINSS,cLojINSS,cSeek),CursorArrow()})
EndIf
*/




//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a Filial Original.                       ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cFilAnt := cBkpFil

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Se houve alguma falha, desfaz todas as transacoes.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If lDeuErro
	DisarmTransaction()
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Finaliza o controle de transacao, caso nao hajam falhas. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
End Transaction

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ ExcArq   º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Estorno dos dados.                                         º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AOMS038                                                    º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function ExcArq()

Local lDeuErro := .F.
Local cBkpFil  := cFilAnt
Local cSeekSF1 := RTRIM(ZLF->ZLF_L_SEEK)//0101010000555853  C2997101N                       
Local cSeekSE2 := xFILIAL("SE2")+SubStr(cSeekSF1,15,3)+SubStr(cSeekSF1,7,9)+"01"+"TX "+cForINSS+cLojINSS    
Local cCodProd := SubStr(cSeekSF1,19,6)//Codigo do Produtor
Local cLjProd  := SubStr(cSeekSF1,25,2)//Loja do Produtor

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Inicia o controle de transacao.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Begin Transaction

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona no cadastro de Produtor.                   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
//dbSelectArea("SA2")
//dbSetOrder(1)
//dbSeek(xFILIAL("SA2")+cForINSS+cLojINSS)
//cFilAnt := SA2->A2_L_FILIA

cFilAnt := U_GetFilEnt(cCodProd,cLjProd,dDataBase)//Filial de entrega da linha do produtor
If !lDeuErro
	MsgRun("Aguarde.... Excluindo Nota de Complemento...",,{||CursorWait(), lDeuErro:=ExcNfCmp(cSeekSF1), CursorArrow()})
EndIf


If !lDeuErro
	MsgRun("Aguarde.... Excluindo FUNRURAL...",,{||CursorWait(),lDeuErro:=ExcluiSE2(cCodProd,cLjProd,SubStr(cSeekSF1,7,9),cEvetFun),CursorArrow()})
EndIf

If !lDeuErro
	MsgRun("Aguarde.... Excluindo INCENTIVO...",,{||CursorWait(), lDeuErro:=ExcluiSE2(cCodProd,cLjProd,SubStr(cSeekSF1,7,9),cEvetInc),CursorArrow()})
EndIf

If !lDeuErro
	MsgRun("Aguarde.... Excluindo RETENÇÃO ICM...",,{||CursorWait(), lDeuErro:=ExcluiSE2(cCodProd,cLjProd,SubStr(cSeekSF1,7,9),"120002"),CursorArrow()})
EndIf



//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Deleta os registros dos arquivos.  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If !lDeuErro
	dbSelectArea(cString)
	RecLock(cString,.F.)
	dbDelete()
	MsUnLock()
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a Filial Original.                       ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cFilAnt := cBkpFil

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Se houve alguma falha, desfaz todas as transacoes.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If lDeuErro
	DisarmTransaction()
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Finaliza o controle de transacao, caso nao hajam falhas. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
End Transaction

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ GrvNfCmp ³ Autor ³Microsiga              ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Funcao para incluir a Nota de Complemento.                 ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³                                                            ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Programa Principal.                                        ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function GrvNfCmp(cFornece,cLoja,nValor,cObsNf)

Local aCab     := {}
Local aItens   := {}
Local aArea    := {}
Local aAlias   := {}
Local nVlrInc  := 0
Local lDeuErro := .F. //.F. nao deu erro, .T. deu erro.
Local cProdInc := "" //Produto Incentivo
Local cSeekZLF := ""
Local cNatComp := ALLTRIM(GetMv("LT_NATNFCO")) //Codigo da natureza do titulo da nota de Complemento de Preco
Local cCondPgt := ALLTRIM(GETMV("LT_CODPGTO"))
//Local cCondPgt := '001'

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³  Salva a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(1,@aArea ,@aAlias ,{"SA2","SB1","ZL8","ZLF","SF1","SD1","ZL3","ZLE","SE2","SX1"})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona no Cadastro de Evento para saber qual o codigo do produto de Incentivo. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("ZL8")
dbSetOrder(1)//ZL8_FILIAL+ZL8_COD
dbSeek(xFILIAL("ZL8")+cEvetInc)
cProdInc := ZL8->ZL8_SB1COD //Produto Incentivo

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cadastro de Produtos. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("SB1")
dbSetOrder(1)
dbSeek(xFILIAL("SB1")+cProdCmp)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona no Cadastro de Fornecedor.     ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("SA2")
dbSetOrder(1)//A2_FILIAL+A2_COD+A2_LOJA
dbSeek(xFILIAL("SA2")+cFornece+cLoja)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄvÄÄÄÄÄÄÄÄ¿
//³ Posiciona no cadastro de Linha/Rota, para saber o setor do Produtor. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("ZL3")
dbSetOrder(1)//ZL3_FILIAL+ZL3_COD+ZL3_TIPO
dbSeek(xFILIAL("ZL3")+SA2->A2_L_LI_RO,.T.)

cSeekZLF := cCodMix+"2"+SA2->A2_COD+SA2->A2_LOJA+cEvetCom+"000"

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cabecalho da Nota Fiscal( SigaAuto). ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aCab  :={{"F1_TIPO","N"			   ,NIL},;	// Tipo da Nota = Normal.
{"F1_FORMUL"	,"S"		       ,NIL},;	// Formulario Proprio = Sim.
{"F1_DOC"		,cNroNota          ,NIL},;	// Numero do Documento.
{"F1_SERIE"		,cSerie   	       ,NIL},;	// Serie do Documento.
{"F1_PREFIXO"	,cSerie 	       ,NIL},;	// Serie do Documento.
{"F1_EMISSAO"	,dDataBase	       ,NIL},;	// Data de Emissao.
{"F1_DESPESA"	,0			       ,NIL},;	// Despesa
{"F1_FORNECE"	,SA2->A2_COD   	   ,NIL},;	// Codigo do Fornecedor.
{"F1_LOJA"	  	,SA2->A2_LOJA  	   ,NIL},;	// Loja do Fornecedor.
{"F1_ESPECIE"	,"SPED"    	       ,NIL},;	// Especie do Documento.
{"F1_COND"		,cCondPgt          ,NIL},;	// Condicao de Pagamento.
{"F1_DESCONT"	,0	    	       ,NIL},;	// Desconto
{"F1_SEGURO"	,0	    	       ,NIL},;	// Seguro
{"F1_FRETE"		,0	    	       ,NIL},;	// Frete
{"F1_PESOL"		,0	               ,NIL},;	// Peso Liquido
{"F1_L_MENSG"	,cObsNf            ,NIL},;	// Mensagem a ser impressa na DANFE
{"E2_NATUREZ"	,cNatureza        ,NIL}}	// Natureza do titulo a pagar.

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se o Produtor eh optante pelo ICMS, caso seja, inclui o item Incentivo a Producao. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If SA2->A2_L_ICMS == "S"
	nVlrInc := nValor*(U_GETFAIXA(xFILIAL("ZL9"),"000001","000006",U_VLEITE("","","N"))/100)
	nValor  := nValor -  nVlrInc
	nBasINSS:= nValor
Else
	nBasINSS:= nValor
EndIf

aAdd(aItens ,{;
{"D1_ITEM"      ,"0001"				          ,NIL},;	// Sequencia Item Pedido
{"D1_COD"		,SB1->B1_COD				  ,NIL},;	// Codigo do Produto
{"D1_NOMPROD"   ,SB1->B1_DESC                 ,NIL},;	// Descricao do produto
{"D1_QUANT"		,1						      ,NIL},;	// Quantidade
{"D1_VUNIT"		,nValor		                  ,NIL},;	// Valor Unitario
{"D1_TOTAL"		,nValor                       ,NIL},;	// Valor Total
{"D1_TES"		,SB1->B1_TE		              ,NIL},;	// Tipo de Entrada - TES
{"D1_LOCAL"		,SB1->B1_LOCPAD				  ,NIL},;	// Armazem Padrao do Produto
{"D1_SEGURO"	,0							  ,NIL},;	// Seguro
{"D1_VALFRE"	,0							  ,NIL},;	// Frete
{"D1_DESPESA"	,0							  ,NIL}})	// Despesa
//{"D1_NATUREZ"	,cNatureza      			  ,NIL}})	// Natureza

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se o Produtor eh optante pelo ICMS, caso seja, inclui o item Incentivo a Producao. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
/*
If SA2->A2_L_ICMS == "S"
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Cadastro de Produtos. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	dbSelectArea("SB1")
	dbSetOrder(1)
	dbSeek(xFILIAL("SB1")+cProdInc)
	
	aAdd(aItens ,{;
	{"D1_ITEM"      ,"0002"				          ,NIL},;	// Sequencia Item Pedido
	{"D1_COD"		,SB1->B1_COD				  ,NIL},;	// Codigo do Produto
	{"D1_NOMPROD"   ,SB1->B1_DESC                 ,NIL},;	// Descricao do produto
	{"D1_QUANT"		,1						      ,NIL},;	// Quantidade
	{"D1_VUNIT"		,nVlrInc	                  ,NIL},;	// Valor Unitario
	{"D1_TOTAL"		,nVlrInc                      ,NIL},;	// Valor Total
	{"D1_TES"		,SB1->B1_TE		              ,NIL},;	// Tipo de Entrada - TES
	{"D1_Local"		,SB1->B1_LOCPAD				  ,NIL},;	// Armazem Padrao do Produto
	{"D1_SEGURO"	,0							  ,NIL},;	// Seguro
	{"D1_VALFRE"	,0							  ,NIL},;	// Frete
	{"D1_DESPESA"	,0							  ,NIL}})	// Despesa
//	{"D1_NATUREZ"	,cNatureza      			  ,NIL}})	// Natureza
EndIf
*/
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ SigaAuto de Geracao da Nota.      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If Len(aCab )>0 .And. Len(aItens )>0
	MATA103(aCab ,aItens ,3)
	If lMsErroAuto
		xMagHelpFis("NAO CONFORMIDADE",;
		"Ocorreu um erro na inclusão da Nota de Complemento.",;
		"Anote o número da Nota ("+cNroNota+") e série ("+cSerie+") para que seja possível reutilizá-lo.")
		lDeuErro := .T.
		MostraErro()
	Else
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Posiciona no titulo gerado pela Nota para atualizar campos de usuario.              ³
		//³ Deve existir so uma parcela.                                                        ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		dbSelectArea("SE2")
		dbSetOrder(1)
		If dbSeek(xFILIAL("SE2")+cSerie+cNroNota+SPACE(TAMSX3("E2_PARCELA")[1])+"NF "+SA2->A2_COD+SA2->A2_LOJA)
		    
			RecLock("SE2",.F.)
			SE2->E2_PORTADO := SA2->A2_BANCO
			SE2->E2_NATUREZ := cNatComp
			SE2->E2_HIST    := "COMPLEMENTO DE PRECO"
			SE2->E2_L_LINRO := SA2->A2_L_LI_RO
			SE2->E2_L_SETOR := ZL3->ZL3_SETOR
			SE2->E2_L_MIX   := cCodMix
			SE2->E2_L_VERSA := "2"
			SE2->E2_L_SITUA := "I"
			SE2->E2_L_SEEK  := cSeekZLF
			SE2->E2_L_BANCO := SA2->A2_BANCO
			SE2->E2_L_AGENC := SA2->A2_AGENCIA
			SE2->E2_L_CONTA := SA2->A2_NUMCON
			SE2->E2_L_FILEN := cFilAnt  
			//SE2->E2_L_EVENT := cEvetCom  //Comentado para não aparecer na regra geral do extrato

			MsUnLock()

		EndIf
	EndIf
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(2,aArea ,aAlias )

Return(lDeuErro)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºFuncao    ³ ExcNfCmp º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ SigaAuto de Exclusao da Nota de Complemento.               º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ ExpC01 - Chave de busca da SF1.                            º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ ExcArq().                                                  º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function ExcNfCmp(cSeekSF1)

Local aCab    := {}
Local aItens  := {}
Local aArea   := {}
Local aAlias  := {}
Local lDeuErro:=.F.

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.                                             


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³  Salva a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(1,@aArea,@aAlias,{"SA2","SB1","ZL8","ZLF","SF1","SD1","ZLF","SX1"})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cabecalho da Nota Fiscal( SigaAuto). ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("SF1")
dbSetOrder(1)//F1_FILIAL+F1_DOC+F1_SERIE+F1_FORNECE+F1_LOJA+F1_TIPO
If dbSeek(cSeekSF1)
	
	aCab :={;
	{"F1_FILIAL"    ,SubStr(cSeekSF1,1,6)  ,NIL},;	// Filial
	{"F1_TIPO"      ,"N"			  ,NIL},;	// Tipo da Nota = Normal
	{"F1_FORMUL"	,"S"		      ,NIL},;	// Formulario Proprio = Sim.
	{"F1_DOC"		,SF1->F1_DOC      ,NIL},;	// Numero do Documento.
	{"F1_SERIE"		,SF1->F1_SERIE    ,NIL},;	// Serie do Documento.
	{"F1_EMISSAO"	,SF1->F1_EMISSAO  ,NIL},;	// Data de Emissao.
	{"F1_FORNECE"	,SF1->F1_FORNECE  ,NIL},;	// Codigo do Fornecedor.
	{"F1_LOJA"	  	,SF1->F1_LOJA     ,NIL},;	// Loja do Fornecedor.
	{"F1_ESPECIE"	,"SPED"    	      ,NIL}}	// Especie do Documento.
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Item da Nota.         ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	dbSelectArea("SD1")
	SD1->(dbSetOrder(1))//D1_FILIAL+D1_DOC+D1_SERIE+D1_FORNECE+D1_LOJA+D1_COD+D1_ITEM
	SD1->(dbSeek(SF1->F1_FILIAL+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA))
	
	While SD1->(!Eof()) .And. SD1->D1_FILIAL+SD1->D1_DOC+SD1->D1_SERIE+SD1->D1_FORNECE+SD1->D1_LOJA ==;
		SF1->F1_FILIAL+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA
		
		aAdd(aItens,{;
		{"D1_FILIAL",SD1->D1_FILIAL ,NIL},;	// Sequencia Item Pedido
		{"D1_ITEM"  ,SD1->D1_ITEM ,NIL},;	// Sequencia Item Pedido
		{"D1_COD"	,SD1->D1_COD  ,NIL},;	// Codigo do Produto
		{"D1_QUANT"	,SD1->D1_QUANT,NIL},;	// Quantidade
		{"D1_VUNIT"	,SD1->D1_VUNIT,NIL},;	// Valor Unitario
		{"D1_TOTAL"	,SD1->D1_TOTAL,NIL}})	// Valor Total
		
		SD1->(DbSkip())
	EndDo
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ SigaAuto de Exclusao da Nota.     ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If Len(aCab)>0 .And. Len(aItens)>0
		MATA103(aCab,aItens,5)
		If lMsErroAuto
			lDeuErro := .T.
			MostraErro()
		EndIf
	EndIf
Else
	xMagHelpFis("EXCLUSAO DA NOTA",;
	"A nota "+cSeekSF1+" não foi encontrada!",;
	"Comunique ao Suporte.")
	lDeuErro :=.T.
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(2,aArea,aAlias)

Return(lDeuErro)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ IncluiSE2³ Autor ³ Microsiga             ³ Data ³ 00.00.00 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Inclui titulo no contas a pagar via SigaAuto.              ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpN01 - Valor do titulo a ser incluido.                   ³±±
±±³          ³ ExpC02 - Numero do titulo a ser incluido.                  ³±±
±±³          ³ ExpC03 - Parcela do titulo a ser incluido.                 ³±±
±±³          ³ ExpC04 - Tipo do titulo a ser incluido.                    ³±±
±±³          ³ ExpC05 - Fornecedor.                                       ³±±
±±³          ³ ExpC06 - Loja do Fornecedor.                               ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ GENERICO                                                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function IncluiSE2(nVlrTit,cNroTit,cParcela,cTipo,cForn,cLj,cSeek,cEvento,cHist)

Local aArea    := {}
Local aAlias   := {}
Local nModAnt  := nModulo
Local cModAnt  := cModulo
Local lDeuErro := .F.
Local aAutoSE2 := {}
Local cSeekZLF := ""
Local cNatINSS := ALLTRIM(GetMv("LT_NATCOMP")) //Natureza do titulo de INSS da NF de Complemento de Preco
Local dVencto  := STOD(SUBStr(DTOS(ADDMes(dDataBase,1)),1,6)+"20")//Data de Vencimento do Funrural - sempre dia 20 do mes seguinte
Local nVlTxPer := If(cTipo=="NDF",GetMv("LT_TXPER "),0)//Se eh debito do produtor, grava valor da Taxa de Permanencia para cobrar juros.

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³  Salva a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(1,@aArea ,@aAlias ,{"SA2","SB1","ZL8","ZLF","SF1","SD1","ZLE","SE2","SX1"})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona no cadastro de Produtor.                   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("SA2")
dbSetOrder(1)
dbSeek(xFILIAL("SA2")+cForn+cLj)


dbSelectArea("ZL8")
dbSetOrder(1)//ZL8_FILIAL+ZL8_COD
dbSeek(xFILIAL("ZL8")+cEvento)


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Array com os dados a serem passados para o SigaAuto. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
aAutoSE2:={;
{"E2_PREFIXO",ZL8->ZL8_PREFIX         ,Nil},;
{"E2_NUM"    ,cNroTit        ,Nil},;
{"E2_TIPO"   ,cTipo          ,Nil},;
{"E2_FILIAL",cFilAnt        ,Nil},;
{"E2_PARCELA",cParcela       ,Nil},;
{"E2_NATUREZ",ZL8->ZL8_NATPRD ,Nil},;
{"E2_FORNECE",SA2->A2_COD    ,Nil},;
{"E2_LOJA"   ,SA2->A2_LOJA   ,Nil},;
{"E2_EMISSAO",dDataBase      ,Nil},;
{"E2_VENCTO" ,dVencto        ,Nil},;
{"E2_VENCREA",dVencto        ,Nil},;
{"E2_HIST"   ,cHist			 ,Nil},;
{"E2_VALOR"  ,nVlrTit        ,Nil},;
{"E2_PORCJUR",nVlTxPer       ,Nil},;
{"E2_L_LINRO",SA2->A2_L_LI_RO,Nil},;
{"E2_L_SETOR",cSetor         ,Nil},;
{"E2_L_MIX"  ,cCodMix        ,Nil},;
{"E2_L_VERSA","2"            ,Nil},;
{"E2_L_SITUA","I"            ,Nil},;
{"E2_L_SEEK" ,cSeek          ,Nil},;
{"E2_L_BANCO",SA2->A2_BANCO  ,Nil},;
{"E2_L_AGENC",SA2->A2_AGENCIA,Nil},;
{"E2_L_CONTA",SA2->A2_NUMCON ,Nil},;
{"E2_L_EVENT",cEvento		 ,Nil},;
{"E2_L_FILEN",cFilAnt        ,Nil}}

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Altera o modulo para Financeiro, senao o SigaAuto nao executa.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
nModulo := 6
cModulo := "FIN"

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Roda SigaAuto de inclusao de Titulos a Pagar. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Pergunte("FIN050",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto
MSExecAuto({|x,y| Fina050(x,y)},aAutoSE2,3)

Pergunte(cPerg,.F.) // Chama perguntas da rotina para evitar erros no Sigaauto
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
	Mostraerro()
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(2,aArea ,aAlias )

Return(lDeuErro)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºFuncao    ³ ExcluiSE2º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ SigaAuto de Exclusao do Contas a Pagar.                    º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ ExpC01 - Chave de busca da SE2.                            º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ ExcArq().                                                  º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function ExcluiSE2(_cCoop,_cLoja,_cNum,_cEvento)

Local aArea   := {}
Local aAlias  := {}
Local nModAnt := nModulo
Local cModAnt := cModulo
Local lDeuErro:= .F.
Local cQry := ""
Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³  Salva a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(1,@aArea,@aAlias,{"SA2","SB1","ZL8","ZLF","SF1","SD1","ZLF","SX1"})

cQry := "SELECT E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO FROM "
cQry += RetSqlName("SE2")
cQry += " WHERE D_E_L_E_T_ = ' '"
cQry += " AND E2_NUM   = '" + _cNum	+ "'"
cQry += " AND E2_FILIAL  = '" + xFilial("SE2") + "'"
cQry += " AND E2_L_MIX   = '" + cCodMIX 		+ "'"
cQry += " AND E2_FORNECE = '" + _cCoop 	+ "'"
cQry += " AND E2_LOJA    = '" + _cLoja 	+ "'"
//cQry += " AND E2_VENCTO <= '"+cVencto+"'"
cQry += " AND E2_L_SITUA = 'I'"
cQry += " AND E2_L_VERSA = '2'"
cQry += " AND E2_L_EVENT = '" + _cEvento	+ "'"
cQry += " AND E2_TIPO IN ('NDF','NF ')"
cQry += " AND E2_EMISSAO = '" + dtos(dDatabase)+ "'"

If Select("E2EXC") <> 0
	E2EXC->(dbCloseArea("E2EXC"))
EndIf

TCQUERY cQry NEW ALIAS "E2EXC"
dbSelectArea("E2EXC")
E2EXC->(DbGoTop())

While !E2EXC->(Eof())

	dbSelectArea("SE2")
	dbSetOrder(1)
	If dbSeek(E2EXC->E2_FILIAL+E2EXC->E2_PREFIXO+E2EXC->E2_NUM+E2EXC->E2_PARCELA+E2EXC->E2_TIPO)
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Posiciona no cadastro de Produtor.                   ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		dbSelectArea("SA2")
		dbSetOrder(1)
		dbSeek(xFILIAL("SA2")+SE2->E2_FORNECE+SE2->E2_LOJA)
		
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Array com os dados a serem passados para o SigaAuto. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		aAutoSE2:={;
		{"E2_PREFIXO",SE2->E2_PREFIXO,Nil},;
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
		Pergunte("FIN050",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto
		MSExecAuto({|x,y,z| Fina050(x,y,z)},aAutoSE2,.T.,5)
	
		Pergunte(cPerg,.F.) // Chama perguntas da rotina para evitar erros no Sigaauto
		
	
		If lMsErroAuto
			lDeuErro := .T.
			xMagHelpFis("EXCLUSAO TITULO",;
			"O titulo "+E2EXC->E2_PREFIXO+E2EXC->E2_NUM+" não foi excluido! Produtor: "+SA2->A2_COD+"/"+SA2->A2_LOJA+"-"+SA2->A2_NOME,;
			"Verifique no financeiro se este titulo ja foi baixado ou o motivo pelo qual não pode ser excluído.")
			MostraErro()
		EndIf
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Restaura o modulo em uso. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		nModulo := nModAnt
		cModulo := cModAnt
	Else
		lDeuErro := .T.
		xMagHelpFis("EXCLUSAO TITULO",;
		"O titulo "+E2EXC->E2_PREFIXO+E2EXC->E2_NUM+" não foi encontrado! Produtor: "+SA2->A2_COD+"/"+SA2->A2_LOJA+"-"+SA2->A2_NOME,;
		"Verifique no financeiro se este titulo existe, pois o mesmo não foi encontrado.")
	EndIf
	E2EXC->(DbSkip())
EndDo

E2EXC->(dbCloseArea("E2EXC"))
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Restaura a area. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CtrlArea(2,aArea,aAlias)

Return(lDeuErro)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ CtrlArea º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Static Function auxiliar no GetArea e ResArea retornando   º±±
±±º          ³ o ponteiro nos Aliases descritos na chamada da Funcao.     º±±
±±º          ³ Exemplo:                                                   º±±
±±º          ³ Local aArea   := {} // Array que contera o GetArea         º±±
±±º          ³ Local aAlias  := {} // Array que contera o                 º±±
±±º          ³                     // Alias(), IndexOrd(), Recno()        º±±
±±º          ³                                                            º±±
±±º          ³ // Chama a Funcao como GetArea                             º±±
±±º          ³ P_CtrlArea(1,@aArea ,@aAlias ,{"SL1","SL2","SL4"})         º±±
±±º          ³                                                            º±±
±±º          ³ // Chama a Funcao como RestArea                            º±±
±±º          ³ P_CtrlArea(2,aArea ,aAlias )                               º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ nTipo   = 1=GetArea / 2=RestArea                           º±±
±±º          ³ aArea   = Array passado por referencia que contera GetArea º±±
±±º          ³ aAlias  = Array passado por referencia que contera         º±±
±±º          ³           {Alias(), IndexOrd(), Recno()}                   º±±
±±º          ³ _aArqs  = Array com Aliases que se deseja Salvar o GetArea º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ GENERICO                                                   º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function CtrlArea(nTipo,aArea,aAlias,aArqs)

Local nProc := 0

// Tipo 1 = GetArea()
If nTipo == 1
	aArea  := GetArea()
	For nProc := 1 To Len(aArqs)
		dbSelectArea(aArqs[nProc])
		AAdd(aAlias,{ aArqs[nProc], IndexOrd(), Recno() })
	Next
	// Tipo 2 = RestArea()
Else
	For nProc := 1 To Len(aAlias )
		dbSelectArea(aAlias[nProc,1])
		dbSetOrder(aAlias[nProc,2])
		dbGoto(aAlias[nProc,3])
	Next
	RestArea(aArea)
EndIf

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³SX5NumNota³ Autor ³Eduardo Riera          ³ Data ³27.08.1999³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³Verifica qual a serie de Nota a ser considerada             ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³ExpL1: Serie escolhida                                      ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ExpC1: cSerie                                               ³±±
±±³          ³ExpC2: Tipo de Numeracao utilizada                          ³±±
±±³          ³       [1] Numeracao controla pelo SX5                      ³±±
±±³          ³       [2] Numeracao controla pelo SXE/SXF                  ³±±
±±³          ³       [3] Numeracao controla pelo SD9                      ³±±
±±³          ³ExpC3: Filial a ser apresentada na tela                     ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³   DATA   ³ Programador   ³Manutencao Efetuada                         ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³          ³               ³                                            ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function Sx5NumNotaP(cSerNF,cTpNrNfs,cFilTela,cTab,cAliTp)

Local nVezes    := 0
Local nTamNota  := Len(SF2->F2_DOC)
Local lContinua := .T.
Local lLockSX5  := .T.
Local lSx5Nota  := ExistBlock("SX5NOTA")
Local nTimeOut  := GetNewPar("MV_NOTAOUT",20)*1000
Local nOpcA     := 0
Local aSerNF    := {}
Local aSerNFAnt := {}
Local cNumNF    := ""
Local oDlg
Local oQual
Local oTimer
Local oBmp
Local oBold 
Local cCadastro := OemToAnsi("Notas") //"Notas"
Local cFilSx5		:= xFilial("SX5")
Local lValRPS	:= ExistBlock("MTVALRPS")
Local nSizeFil  := 2
LOCAL cFilEF	:= ""      
STATIC __lChgX5Fil

// Verifica permissao para alterar numero da nota (utilizado apenas para MV_ESTADO = SC)
Local lCanChange  := SuperGetMv("MV_MUDANUM",,.F.)

DEFAULT cTpNrNfs := "1"
DEFAULT cFilTela := cFilAnt                      
DEFAULT cTab	 := "01"                                
DEFAULT cAliTp	 := 'NFF'

// Verifica se arquivo criado no meio da versao 710 existe
If cTpNrNfs == "3" 
	SX3->(dbSetOrder(1))
	If !(SX3->(dbSeek("SD9")))
		cTpNrNfs := "1"
	EndIf
EndIf
lLockSX5 := IIf(cTpNrNFS == "1",lLockSX5,.F.)

IF __lChgX5Fil == Nil
	__lChgX5FIL := ExistBlock("CHGX5FIL")
Endif

IF __lChgX5FIL
	cFilSx5 := ExecBlock("CHGX5FIL",.f.,.f.) 	
Endif
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Trava o parametro do SX6 por seguranca                                  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If ( GetMv("MV_NUMITEN",.T.) )
	
	While ( lContinua .And. !SX6->(MsRLock()) )
		Inkey(1)
		nVezes++
		If ( nVezes > 200 )
			lContinua := .F.
		EndIf
	EndDo
Else
	lContinua := .F.
EndIf

//-- Atualiza o conteúdo da filial
If FindFunction("FWSizeFilial")
	nSizeFil := FWSizeFilial()
EndIf
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Defini filial do xe xf												   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If PadR(cSerNF,3) == "PLS"
	cFilEF := PadR(xFilial("SE1")+X2PATH("SE1"),45+nSizeFil)
Else
	cFilEF := PadR(xFilial("SF2")+X2PATH("SF2"),45+nSizeFil)
EndIf	
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Verifica as series de notas fiscais validas                             ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If ( lContinua )
	DbSelectArea("SX5")
	dbSetOrder(1)
	MsSeek(cFilSX5+cTab,.F.)
	
	While ( SX5->X5_FILIAL == cFilSX5 .And. ;
			SX5->X5_TABELA == cTab .And. lContinua )
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Se a S‚rie for CPF, n„o mostra no aChoice, pois ‚ utilizada ³
		//³ internamente para emissao de Cupom Fiscal.             ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		If (  AllTrim(SX5->X5_CHAVE)!="CPF".And.AllTrim(SX5->X5_CHAVE)!="CP")
			nVezes := 0
			While ( IIf(lLockSX5,!SX5->(MsRLock()),.F.) .And. lContinua )
				nVezes ++
				If ( nVezes > 20 )
					aSerNF   := {}
					lContinua := .F.
				EndIf
			EndDo
			If lContinua
				//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
				//³Quando a Numeracao eh controlado pelo SXE/SXF                           ³
				//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
				If cTpNrNFS == "2"
					cNumNF := GetSX8Num(cAliTp,,PadR(SX5->X5_CHAVE,3)+cFilEF)
					// Mantem nota com tamanho 6, se alterado pelo usuario. Para retornar ao tamanho 9 e necessario
					// alterar a tabelas SXE/SXF.
					If cPaisloc == "BRA" .And. Len(AllTrim(cNumNF)) < Len(SF2->F2_DOC)
						nTamNota := 6
					Else
						nTamNota  := Len(SF2->F2_DOC)
					EndIf
					RollBackSx8()
					AADD( aSerNF,{PadR(SX5->X5_CHAVE,3),StrZero(Val(cNumNF),nTamNota)})
				Else
					// Mantem nota com tamanho 6, se alterado pelo usuario. Para retornar ao tamanho 9 e necessario
					// alterar a tabela "01" pelo configurador.
					If cPaisloc == "BRA" .And. Len(AllTrim(SX5->X5_DESCRI)) < Len(SF2->F2_DOC)
						nTamNota := 6
					Else
						nTamNota  := Len(SF2->F2_DOC)
					EndIf
					AADD( aSerNF,{PadR(SX5->X5_CHAVE,3), MaConvNNota(X5Descri(),nTamNota)})
				EndIf
				If ( lSx5Nota )
					If ( !ExecBlock("SX5NOTA",.F.,.F.) )
						aSize(aSerNF,Len(aSerNF)-1)
					EndIf
				EndIf
			EndIf
		EndIf
		dbSelectArea("SX5")
		dbSkip()
	EndDo
EndIf
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Montagem da janela de exibicao                                          ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If ( Len(aSerNF) != 0 )
	
	aSerNFAnt := aClone(aSerNF)
	DEFINE MSDIALOG oDlg TITLE CCADASTRO+" - "+Alltrim(RetTitle("A1_FILIAL"))+" "+cFilTela FROM 0,0 TO 264,378 OF oMainWnd	PIXEL 

	DEFINE FONT oBold NAME "Arial" SIZE 0, -13 BOLD
	
	@  0, -25 BITMAP oBmp RESNAME "PROJETOAP" oF oDlg SIZE 55, 1000 NOBORDER WHEN .F. PIXEL
	@ 14, 30 TO 16 ,400 LABEL '' OF oDlg PIXEL
	@ 03, 40 SAY "teste" + " / " + CCADASTRO FONT oBold PIXEL
	
	If FindFunction("A103UnlkPC")
		 oTimer:= TTimer():New(nTimeOut,{|| A103UnlkPC(),oDlg:End() },oDlg)
	Else
		 oTimer:= TTimer():New(nTimeOut,{|| oDlg:End() },oDlg)
	EndIf
	oTimer:Activate()

	@ 025,040 LISTBOX oQual VAR cVarQ ;
		FIELDS HEADER OemToAnsi("teste"),cCadastro ; //"Serie"
		SIZE 140,080 ;
		ON DBLCLICK (If(SX5Troca(@aSerNF,oQual:nAt,@oTimer,nTimeOut,oQual,cTpNrNfs),(oQual:Refresh(),If(lCanChange,lMudouNum := .T.,)),oDlg:End())) NOSCROLL PIXEL
		
	oQual:SetArray(aSerNF)
	oQual:bLine := { || {aSerNf[oQual:nAT,1],aSerNf[oQual:nAT,2]}}
	DEFINE SBUTTON FROM 113,119 TYPE 1 ACTION If	(	cTpNrNfs $ "2",;
																		IIf(VldSX5Num(aSerNF[oQual:nAt][2],aSerNF[oQual:nAt][1],.T.),(nOpcA:=oQual:nAt,oDlg:End()),nil),;
																		(nOpcA:=oQual:nAt,oDlg:End())) ENABLE OF oDlg PIXEL
	If ( cModulo != "TMK" )
		If FindFunction("A103UnlkPC")
			 DEFINE SBUTTON FROM 113,152 TYPE 2 ACTION (A103UnlkPC(),oDlg:End()) ENABLE OF oDlg
		Else
			 DEFINE SBUTTON FROM 113,152 TYPE 2 ACTION (oDlg:End()) ENABLE OF oDlg
		EndIf
	EndIf
	ACTIVATE MSDIALOG oDlg VALID (oTimer:End(),.T.) CENTERED
	If ( lContinua .And. nOpcA != 0 )
		cSerNF := aSerNF[nOpcA][1]
		cNumNF:= aSerNF[nOpcA][2]
	Else
		lContinua := .F.
	EndIf
Else
	Help(" ",1,"A460FLOCK")
EndIf
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Ponto de entrada para validar a serie escolhida com a emissao de RPS³
//³referente a Nota Fiscal Eletronica de ISS de Sao Paulo              ³
//³SC9 posicionado e serie escolhida passada por parametro             ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If lContinua .And. lValRPS 
	lContinua := Execblock("MTVALRPS",.F.,.F.,{cSerNF}) 
Endif            
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Trava o registro escolhido                                              ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If ( lContinua )
	If cTpNrNFS == "1"
		dbSelectArea("SX5")
		dbSetOrder(1)
		If ( MsSeek(cFilSX5+cTab+cSerNF) )
			nVezes := 0
			While ( !SX5->(MsRLock()) )
				nVezes ++
				If ( nVezes > 10 )
					Help(" ",1,"A460FLOCK")
					lContinua := .F.
					Exit
				EndIf
				Sleep(100)
			EndDo
			If ( lContinua )
				SX5->X5_DESCRI  := cNumNF
				SX5->X5_DESCSPA := cNumNF
				SX5->X5_DESCENG := cNumNF
			EndIf
		EndIf
	ElseIf cTpNrNFS == "2"
		__cSX5NUM := cNumNF
		
		cNumNF := GetSX8Num(cAliTp,,PadR(cSerNF,3)+cFilEF)
		
		RollBackSX8()
		If __cSX5NUM == cNumNF
			__cSX5NUM := Nil 
		Else
			 cNumNF := __cSX5NUM	
		EndIf
	EndIf
EndIf
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Destrava os registro do SX5                                             ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
SX5->(MsRUnLock())
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Destrava o parametro                                                    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If ( GetMv("MV_NUMITEN",.T.) )
	SX6->(MsRUnLock())
EndIf
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Compatibilizacao com versoes antigas                                    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cSerie  := cSerNF
cNumero := cNumNF
// Verifica se o usuario alterou o numero da nota em MV_TPNRNFS == "3" ou "2" (sistema deve respeitar o novo numero)
If nOpcA <> 0 .And. cNumero <> aSerNFAnt[nOpcA][2] .And. (cTpNrNfs == "3" .Or. cTpNrNfs == "2")
	lMudouNum := .T.
EndIf
Return(lContinua)




/*/
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
/*/
Static Function AjustaSX1()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe os codigos dos setores a serem ')
Aadd( aHelpPor, 'considerados no Complemento.           ')
Aadd( aHelpSpa, 'Informe os codigos dos setores a serem ')
Aadd( aHelpSpa, 'considerados no Complemento.           ')
Aadd( aHelpEng, 'Informe os codigos dos setores a serem ')
Aadd( aHelpEng, 'considerados no Complemento.           ')
PutSx1(cPerg,"01","Setor?","Setor?","Setor?","mv_ch1","C",60,0,0,"G",'VAZIO().OR.SUBSTR(MV_PAR01,Len(ALLTRIM(MV_PAR01)),1)=="/"',"U_F302","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpPor, 'zado para o Complemento.               ')
Aadd( aHelpPor, 'ATENCAO: Escolha um MIX aberto e com   ')
Aadd( aHelpPor, 'periodo correto.                       ')
Aadd( aHelpSpa, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpSpa, 'zado para o Complemento.               ')
Aadd( aHelpSpa, 'ATENCAO: Escolha um MIX aberto e com   ')
Aadd( aHelpSpa, 'periodo correto.                       ')
Aadd( aHelpEng, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpEng, 'zado para o Complemento.               ')
Aadd( aHelpEng, 'ATENCAO: Escolha um MIX aberto e com   ')
Aadd( aHelpEng, 'periodo correto.                       ')
PutSx1(cPerg,"02","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch2","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_01","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return