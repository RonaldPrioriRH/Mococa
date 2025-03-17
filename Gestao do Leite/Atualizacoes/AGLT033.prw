#INCLUDE "PROTHEUS.ch"
#INCLUDE "RWMAKE.ch"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT033  � Autor � TOTVS                 � Data da Criacao  � 17/06/2010                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Mbrowse para Inclusao e Exclusao de Debitos ou Creditos para o Produtor.                	                    ���
���          � 															                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Gera contas a pagar do tipo NDF quando debito e gera contas a pagar do tipo NF quando Credito. 		        ���
���		     � Situacao: Foi lancado um convenio para um produtor, quando deveria ter sido outro.                           ���
���		     � Nesse caso o sistema lancara um NF para o Produtor A e um NDF para o Produtor B. A NF devera ser paga pelo   ���
���		     � Financeiro e nao deve sair no Extrato, para que o total de creditos da Nota nao seja diferente dos creditos  ���
���		     � no extrato, ou seja, sera um acerto fianceiro.                                                               ���
���		     � Ja a NDF devera ser impressa no Extrato do Produtor e compensada no Fechamento do Leite. A NDF ate poderia   ���
���		     � ser digitada junto com os convenios, pois se trata de um desconto de convenio, no entanto isso nao existira  ���
���		     � porque se esse debito fosse lancado junto do convenio, a loja conveniada receberia duas vezes, pois este     ���
���		     � ja foi pago quando foi lancado para o produtor errado.                                                       ���
���		     �					 												                                            ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum                                                                                 						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum											                                                 	        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   �                                                                                          					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � GLT - Gestao do Leite.                                                                  						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �          �                                                  �                                  �             ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/
User Function AGLT033()

//���������������������������������������������������������������������Ŀ
//� Declaracao de Variaveis                                             �
//�����������������������������������������������������������������������
Private cCadastro := "Estorno de Movimento"
Private bRotina1  := {|| xRotina('V')}
Private bRotina2  := {|| xRotina('I')}
Private bRotina3  := {|| xRotina('E')}
Private bRotina4  := {|| LegComp()   }

//���������������������������������������������������������������������Ŀ
//� Monta um aRotina proprio                                            �
//�����������������������������������������������������������������������
Private aRotina := {;
{"Pesquisar"   ,"AxPesqui"      ,0,1},;
{"Visualizar"  ,"Eval(bRotina1)",0,2},;
{"Incluir"     ,"Eval(bRotina2)",0,3},;
{"Excluir"     ,"Eval(bRotina3)",0,5},;
{"Legenda"     ,"Eval(bRotina4)",0,4}}

//���������������������������������������������������������������������Ŀ
//� Monta um array com as regras para apresentacao de cada cor.         �
//�����������������������������������������������������������������������
Private aCores := {;
{"E2_SALDO == 0"       ,'BR_VERMELHO'},;//Titulo Pago totalmente
{"E2_SALDO < E2_VALOR" ,'BR_AZUL'    },;//Titulo Pago parcialmente
{"E2_SALDO == E2_VALOR",'BR_VERDE'   }} //Titulo em Aberto

Private cDelFunc := ".T." // Validacao para a exclusao. Pode-se utilizar ExecBlock
Private cString  := "SE2"
Private cPerg    := "AGLT033   "
Private cEvtEst  := ALLTRIM(GetMv("LT_EVEESTO"))//Codigo do evento de ESTORNO DE LANCAMENTO INDEVIDO
Private cCodMix  := "" //Codigo do MIX
Private cSetor   := "" //Codigo do Setor
Private cNatNF   := ALLTRIM(GetMv("LT_NATEST1")) //Codigo da Natureza utilizada no titulo NF
Private cNatNDF  := ALLTRIM(GetMv("LT_NATEST2")) //Codigo da Natureza utilizada no titulo NDF
Private cPrefixo := "" //Prefixo do titulo qdo debito
Private cFiltra  := "" //Expressao do filtro do Browse
Private aIndexZLF:= {}
Private nTamParc := TamSx3("E2_PARCELA")[1] //Tamanho da Parcela do titulo, usado para achar o codigo do produtor na variavel cTit02

//�������������������������������������������������������������������������Ŀ
//� Cria as perguntas e chama a tela de parametros.                         �
//���������������������������������������������������������������������������
AjustaSX1()
If !Pergunte(cPerg,.T.)
	Return()
EndIf

//���������������������������������������������������������������������������Ŀ
//� Preenche o codigo do MIX.                                                 �
//�����������������������������������������������������������������������������
cSetor  := SubStr(MV_PAR01,1,6)
cCodMix := MV_PAR02

//�������������������������������������������������Ŀ
//� Posiciona no Cadastro de Evento.                �
//���������������������������������������������������
dbSelectArea("ZL8")
dbSetOrder(1)//ZL8_FILIAL+ZL8_COD
dbSeek(xFILIAL("ZL8")+cEvtEst)
cPrefixo := ZL8->ZL8_PREFIX //Prefixo do titulo

//���������������������������������������������������������Ŀ
//� Cria o filtro na MBrowse utilizando a fun��o FilBrowse. �
//�����������������������������������������������������������
dbSelectArea(cString)
dbSetOrder(1)
cFiltra := "E2_PREFIXO == '"+cPrefixo+"' .AND. E2_L_SETOR == '"+cSetor+"' .AND. E2_L_MIX == '"+cCodMix+"' .AND. E2_TIPO $ 'NF /NDF'"
FilBrowse(cString,@aIndexZLF,@cFiltra)

dbSelectArea(cString)
dbSetOrder(1)

mBrowse( 6,1,22,75,cString,,"E2_SALDO",,,,aCores)

//���������������������������������������������������������Ŀ
//� Deleta o filtro utilizado na funcao FilBrowse.          �
//�����������������������������������������������������������
EndFilBrw(cString,aIndexZLF)

Return

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � LegComp  � Autor � Microsiga          � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Desc.     � Monta com a Legenda.                                       ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AGLT033                                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function LegComp()

Local aCores := {;
{'BR_VERDE'   ,"Titulo em Aberto"},;
{'BR_AZUL'    ,"Titulo pago Parcialmente"},;
{'BR_VERMELHO',"Titulo pago Totalmente"}}

BrwLegenda(cCadastro,"Legenda",aCores)

Return

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � xRotina  � Autor � Microsiga          � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Desc.     � Monta a tela de alteracao, visualizacao e exclusao.        ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AOMS038                                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function xRotina(cOpcBrw)

//���������������������������������������������������Ŀ
//� Declaracao das variaveis Locais.                  �
//�����������������������������������������������������
Local aArea    := GetArea()
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

//���������������������������������������������������Ŀ
//� Verifica qual opcao no Browse o usuario acessou.  �
//�����������������������������������������������������
Do Case
	Case cOpcBrw == "V" // Visualizar
		nOpcao := 2
		lEdita := .F.
		cString := "SE2"
	Case cOpcBrw == "I" // Incluir
		nOpcao  := 3
		lAltera := .T.
		lEdita  := .T.
		cString := "ZLF"
	Case cOpcBrw == "E" // Excluir
		nOpcao  := 2
		lExclui := .T.
		lEdita  := .F.
		cString := "SE2"
EndCase

//�������������������������������������������������������������������������Ŀ
//� Posiciona no cadastro de MIX para conferir as datas.                    �
//���������������������������������������������������������������������������
dbSelectArea("ZLE")
dbSetOrder(1)//ZLE_FILIAL+ZLE_COD+ZLE_VERSAO
dbSeek(xFILIAL("ZLE")+cCodMix+"1")

cAnoMes := SubStr(DTOS(ADDMes(ZLE->ZLE_DTINI,1)),1,6)

//���������������������������������������������������������������������������Ŀ
//� Verifica se a data do sistema correponde ao mes posterior ao mes do MIX.  �
//�����������������������������������������������������������������������������
If cOpcBrw == "I"
	If cAnoMes <> SubStr(DTOS(dDataBase),1,6)
		xMagHelpFis("Data","O MIX selecionado, refere-se ao leite entregue no m�s "+SubStr(DTOS(ZLE->ZLE_DTINI),5,2)+".",;
		"Altere a data do sistema para o per�odo subsequente ao do MIX. Sugest�o: M�s "+SubStr(cAnoMes,5,2)+" de "+SubStr(cAnoMes,1,4))
		Return()
	EndIf
EndIf

//�������������������������������������������������������������������������Ŀ
//� Verifica se eh uma exclusao, caso seja valida se houve fechamento.      �
//���������������������������������������������������������������������������
RestArea(aArea)
If cOpcBrw == "E"
	If !(&cFiltra)
		xMagHelpFis("Exclusao","Registro diferente de ESTORNO DE MOVIMENTO n�o pode ser exclu�do por esta rotina.",;
		"Verifique se voc� escolheu o registro correto ou utilize o Contas a Pagar para excluir este movimento.")
		Return()
	EndIf
EndIf

//�������������������������������������������������������������������������Ŀ
//� Carrega os campos do cabecalho como variaveis de Memoria( M->XX_XXX ).  �
//���������������������������������������������������������������������������
If cOpcBrw == "V" .OR. cOpcBrw == "E"
    dbSelectArea(cString)
	RegToMemory(cString,.F.)
Else
	//�������������������������������������������������������������������������Ŀ
	//� Carrega os campos como variaveis de memoria.                            �
	//���������������������������������������������������������������������������
	dbSelectArea(cString)
	RegToMemory(cString,.T.)
	
	//�������������������������������������������������������������������������Ŀ
	//� Grava os campos com os dados que nao podem ser alterados pelo usuario.  �
	//���������������������������������������������������������������������������
	M->ZLF_SETOR  := cSetor
	M->ZLF_DCRSET := POSICIONE("ZL2",1,xFilial("ZL2")+cSetor,"ZL2_DESCRI")
	M->ZLF_CODZLE := cCodMix
	M->ZLF_VERSAO := "2"
	M->ZLF_DTINI  := dDataBase
	M->ZLF_DTFIM  := dDataBase
	M->ZLF_DEBCRE := "C"
EndIf

//������������������������������������������������������������������������������������������������Ŀ
//� Define o tamanho da tela e faz tratamento para dimensionamento qdo usado resolucoes diferentes.�
//��������������������������������������������������������������������������������������������������
aSize := MsAdvSize()
aObjects := {}
AAdd( aObjects, { 100, 100, .T., .T. } )
AAdd( aObjects, { 100, 100, .T., .T. } )

aInfo    := {aSize[1],aSize[2],aSize[3],aSize[4],3,3}
aPosObj  := MsObjSize(aInfo,aObjects)

//Vetor com coordenadas para cria��o da enchoice no formato {<top>, <left>, <bottom>, <right>}
AAdd( aPosEnch, { aPosObj[1][1],aPosObj[1][2], aPosObj[2][3], aPosObj[2][4] } )

//������������������������������������������������������������������������������Ŀ
//� Tela estilo Modelo 3 - Cabecalho e Itens.                                    �
//��������������������������������������������������������������������������������
DEFINE MSDIALOG oDlg1 TITLE cCadastro FROM aSize[7],0 TO aSize[6],aSize[5] OF oMainWnd PIXEL
EnChoice(cString,(cString)->(Recno()),nOpcao,,,,,aPosEnch[1],,3)
ACTIVATE MSDIALOG oDlg1 ON INIT EnchoiceBar(oDlg1 , {||lBotaoOk:=.T.,oDlg1:End()} , {||lBotaoOk:=.F.,oDlg1:End()} )

//������������������������������������������������������������������������������Ŀ
//� Se o usuario confirmar no botao de Ok da tela.                               �
//��������������������������������������������������������������������������������
If lBotaoOk
	If lAltera
		IncArq(cOpcBrw)
	ElseIf lExclui
		ExcArq(cOpcBrw)
	EndIf
EndIf

Return

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � IncArq   � Autor � Microsiga          � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Desc.     � Faz a gravacao dos dados no arquivo.                       ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AOMS038                                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function IncArq(cOpcBrw)

Local lDeuErro := .F. //Flag pra saber se deu erro
Local cNroTit  := SubStr(DTOS(dDataBase),7,2)+SubStr(DTOS(dDataBase),5,2)+SubStr(DTOS(dDataBase),1,4)+"1"
Local cBkpFil  := cFilAnt
Local nValor   := M->ZLF_TOTAL
Local cSeek1   := ""
Local cSeek2   := ""
Local cParcela := StrZero(1,TamSx3("E2_PARCELA")[1]) //Parcela do titulo
Local cNewParc := cParcela

Private cObs1  := ALLTRIM(M->ZLF_DCREVE)//Usado como descricao do evento ou historico do titulo
Private cObs2  := M->ZLF_DCREVE//Usado como descricao do evento ou historico do titulo
Private cProd1 := M->ZLF_RETIRO
Private cLoja1 := M->ZLF_RETILJ
Private cProd2 := Space(6)
Private cLoja2 := Space(2)
Private cNome  := Space(40)
Private oGet1
Private oGet2
Private oGet3
Private oGet4
Private oDlg2

//������������������������������������������������������Ŀ
//� Monta tela para escolha do produtor a ser debitado.  �
//��������������������������������������������������������
While Empty(cProd2)
	DEFINE MSDIALOG oDlg2 TITLE "Produtor para Debito" FROM C(219),C(183) TO C(324),C(635) PIXEL
	@ (002),(069) Say "Nome"     Size (018),(008) COLOR CLR_BLACK PIXEL OF oDlg2
	@ (004),(043) Say "Loja"     Size (018),(008) COLOR CLR_BLACK PIXEL OF oDlg2
	@ (005),(005) Say "Produtor" Size (024),(008) COLOR CLR_BLACK PIXEL OF oDlg2
	@ (015),(006) MsGet oGet1 Var cProd2 F3 "SA2_L4" Valid Vazio().Or.(ExistCpo("SA2",cProd2).And. xNome())         Size (032),(009) COLOR CLR_BLACK Picture "@!" PIXEL OF oDlg2
	@ (015),(044) MsGet oGet2 Var cLoja2             Valid Vazio().Or.(ExistCpo("SA2",cProd2+cLoja2) .And. xNome()) Size (018),(009) COLOR CLR_BLACK Picture "@!" PIXEL OF oDlg2
	@ (015),(067) MsGet oGet3 Var cNome             Size (154),(009) COLOR CLR_BLACK Picture "@!" WHEN .F. PIXEL OF oDlg2
	@ (032),(044) Say "Obs:" Size (024),(008) COLOR CLR_BLACK PIXEL OF oDlg2
	@ (030),(067) MsGet oGet4 Var cObs2             Size (154),(009) COLOR CLR_BLACK Picture "@!" WHEN .T. PIXEL OF oDlg2
	@ (050),(183) Button "Ok" Size (037),(012) PIXEL OF oDlg2 ACTION(Close(oDlg2))
	ACTIVATE MSDIALOG oDlg2 CENTERED	
EndDo

//�������������������������������������������������������������������������������������������Ŀ
//� Preenche a chave de busca dos titulos, para que atraves de um titulo se encontre o outro. �
//���������������������������������������������������������������������������������������������
cSeek1 := xFILIAL("SE2")+cPrefixo+cNroTit+cParcela+"NF "+cProd1+cLoja1
cSeek2 := xFILIAL("SE2")+cPrefixo+cNroTit+cParcela+"NDF"+cProd2+cLoja2

//�������������������������������������������������������������������������������������Ŀ
//� Verifica se o titulo 01 ja existe na base e incrementa a parcela para nao duplicar. �
//���������������������������������������������������������������������������������������
dbSelectArea("SE2")
dbSetOrder(1)
While dbSeek(cSeek1)
	cNewParc := SOMA1(cNewParc)
	cSeek1   := xFILIAL("SE2")+cPrefixo+cNroTit+cNewParc+"NF "+cProd1+cLoja1
	cSeek2   := xFILIAL("SE2")+cPrefixo+cNroTit+cNewParc+"NDF"+cProd2+cLoja2
EndDo

//�������������������������������������������������������������������������������������Ŀ
//� Verifica se o titulo 02 ja existe na base e incrementa a parcela para nao duplicar. �
//���������������������������������������������������������������������������������������
dbSelectArea("SE2")
dbSetOrder(1)
While dbSeek(cSeek2)
	cNewParc := SOMA1(cNewParc)
	cSeek1   := xFILIAL("SE2")+cPrefixo+cNroTit+cNewParc+"NF "+cProd1+cLoja1
	cSeek2   := xFILIAL("SE2")+cPrefixo+cNroTit+cNewParc+"NDF"+cProd2+cLoja2
EndDo

//��������������������������������Ŀ
//� Inicia o controle de transacao.�
//����������������������������������
Begin Transaction

//������������������������������������������������������������������������Ŀ
//� Chama inclusao da NF para o produtor que recebera o credito.           �
//��������������������������������������������������������������������������
dbSelectArea("SA2")
dbSetOrder(1)
dbSeek(xFILIAL("SA2")+cProd1+cLoja1)
//cFilAnt := SA2->A2_L_FILIA
cFilAnt := U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,dDataBase)//Filial de entrega da linha do produtor

MsgRun("Aguarde.... Gerando Credito no Financeiro...",,{||CursorWait(),lDeuErro:=IncluiSE2(nValor,cNroTit,cNewParc,"NF ",cProd1,cLoja1,cSeek2,cObs1),CursorArrow()})


//������������������������������������������������������������������������Ŀ
//� Chama inclusao da NDF para o produtor que recebera o Debito.           �
//��������������������������������������������������������������������������
dbSelectArea("SA2")
dbSetOrder(1)
dbSeek(xFILIAL("SA2")+cProd2+cLoja2)
//cFilAnt := SA2->A2_L_FILIA
cFilAnt := U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,dDataBase)//Filial de entrega da linha do produtor
MsgRun("Aguarde.... Gerando Debito no Financeiro..." ,,{||CursorWait(),lDeuErro:=IncluiSE2(nValor,cNroTit,cNewParc,"NDF",cProd2,cLoja2,cSeek1,cObs2),CursorArrow()})


//���������������������������������������������������Ŀ
//� Restaura a Filial Original.                       �
//�����������������������������������������������������
cFilAnt := cBkpFil

//���������������������������������������������������Ŀ
//� Se houve alguma falha, desfaz todas as transacoes.�
//�����������������������������������������������������
If lDeuErro
	DisarmTransaction()
EndIf

//����������������������������������������������������������Ŀ
//� Finaliza o controle de transacao, caso nao hajam falhas. �
//������������������������������������������������������������
End Transaction

Return

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � xNome    � Autor � Microsiga          � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Desc.     � Preenche o nome do produtor escolhido na tela.             ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Generico                                                   ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function xNome()

Local lRet := .T.

//������������������������������������������������������Ŀ
//� Verifica se usou o mesmo produtor.                   �
//��������������������������������������������������������
If cProd1+cLoja1 == cProd2+cLoja2
	xMagHelpFis("Duplicado","O produtor selecionado � o mesmo informado na tela anterior",;
	"De acordo com a regra definida, voc� deve Creditar um produtor e Debitar outro.")
	cProd2 := Space(6)
	cLoja2 := Space(2)
	cNome  := Space(40)
	lRet   := .F.
Else
	//������������������������������������������������������Ŀ
	//� Posiciona no cadastro de Produtor.                   �
	//��������������������������������������������������������
	dbSelectArea("SA2")
	dbSetOrder(1)
	dbSeek(xFILIAL("SA2")+cProd2+cLoja2)
	cNome := SA2->A2_NOME
EndIf

oGet1:Refresh()
oGet2:Refresh()
oGet3:Refresh()

Return(lRet)

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � ExcArq   � Autor � Microsiga          � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Desc.     � Estorno dos dados.                                         ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AOMS038                                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function ExcArq()

Local lDeuErro := .F.
Local cBkpFil  := cFilAnt
Local cTit01   := RTRIM(SE2->E2_L_SEEK)
Local cTit02   := ""

//��������������������������������������������������������������������������Ŀ
//� Busca os dados do segundo titulo, s� se exclui um se excluirmos o outro. �
//����������������������������������������������������������������������������
dbSelectArea("SE2")
dbSetOrder(1)
If dbSeek(cTit01)
	cTit02 := RTRIM(SE2->E2_L_SEEK)
Else
	xMagHelpFis("Exclusao","N�o foi encontrado o titulo "+cTit01,;
	"Para que a rotina de Estorno de Movimento funcione corretamente, � preciso existirem dois titulos, um NF e outro NDF"+;
	" com as mesmas caracter�sticas, por�m Produtores diferentes e isso n�o aconteceu, por isso esse titulo n�o poder� ser "+;
	" exclu�do ou ent�o voc� selecionou um titulo para exclus�o que n�o pertence a esta rotina.")
	Return()
EndIf

//������������������������������������������������������Ŀ
//� Posiciona no cadastro de Produtor.                   �
//��������������������������������������������������������
dbSelectArea("SA2")
dbSetOrder(1)
dbSeek(xFILIAL("SA2")+SE2->E2_FORNECE+SE2->E2_LOJA)
//cFilAnt := SA2->A2_L_FILIA
cFilAnt := U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,dDataBase)//Filial de entrega da linha do produtor


//��������������������������������Ŀ
//� Inicia o controle de transacao.�
//����������������������������������
Begin Transaction

//������������������������������������������������������������������������Ŀ
//� Chama exclusao da NF e NDF de Estorno de Movimento.                    �
//��������������������������������������������������������������������������
MsgRun("Aguarde.... Excluindo Credito no Financeiro...",,{||CursorWait(),lDeuErro:=ExcluiSE2(cTit01),CursorArrow()})

//�������������������������������������������������������������������������Ŀ
//� Se nao houve falha, exclui o outro titulo, caso contrario desfaz tudo.  �
//���������������������������������������������������������������������������
If !lDeuErro
	//������������������������������������������������������Ŀ
	//� Posiciona no cadastro de Produtor.                   �
	//��������������������������������������������������������
	dbSelectArea("SA2")
	dbSetOrder(1)
	dbSeek(xFILIAL("SA2")+SubStr(cTit02,18+nTamParc,6)+SubStr(cTit02,24+nTamParc,2) )
	//cFilAnt := SA2->A2_L_FILIA
	cFilAnt := U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,dDataBase)//Filial de entrega da linha do produtor
	
	MsgRun("Aguarde.... Excluindo Debito no Financeiro..." ,,{||CursorWait(),lDeuErro:=ExcluiSE2(cTit02),CursorArrow()})
EndIf

//���������������������������������������������������Ŀ
//� Restaura a Filial Original.                       �
//�����������������������������������������������������
cFilAnt := cBkpFil

//���������������������������������������������������Ŀ
//� Se houve alguma falha, desfaz todas as transacoes.�
//�����������������������������������������������������
If lDeuErro
	DisarmTransaction()
EndIf

//����������������������������������������������������������Ŀ
//� Finaliza o controle de transacao, caso nao hajam falhas. �
//������������������������������������������������������������
End Transaction

Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    � IncluiSE2� Autor � Microsiga             � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Inclui titulo no contas a pagar via SigaAuto.              ���
�������������������������������������������������������������������������Ĵ��
���Parametros� ExpN01 - Valor do titulo a ser incluido.                   ���
���          � ExpC02 - Numero do titulo a ser incluido.                  ���
���          � ExpC03 - Parcela do titulo a ser incluido.                 ���
���          � ExpC04 - Tipo do titulo a ser incluido.                    ���
���          � ExpC05 - Fornecedor.                                       ���
���          � ExpC06 - Loja do Fornecedor.                               ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � GENERICO                                                   ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function IncluiSE2(nVlrTit,cNroTit,cParcela,cTipo,cForn,cLj,cSeek,cHist)

Local aArea    := {}
Local aAlias   := {}
Local nModAnt  := nModulo
Local cModAnt  := cModulo
Local lDeuErro := .F.
Local aAutoSE2 := {}
Local cSeekZLF := ""
Local nVlTxPer := If(cTipo=="NDF",GetMv("LT_TXPER "),0) //Se eh debito do produtor, grava valor da Taxa de Permanencia para cobrar juros.
Local cNatureza:= If(cTipo=="NDF",cNatNDF,cNatNF)

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

//����������������Ŀ
//�  Salva a area. �
//������������������
CtrlArea(1,@aArea ,@aAlias ,{"SA2","SB1","ZL8","ZLF","SF1","SD1","ZLE","SE2","SX1"})

//������������������������������������������������������Ŀ
//� Posiciona no cadastro de Produtor.                   �
//��������������������������������������������������������
dbSelectArea("SA2")
dbSetOrder(1)
dbSeek(xFILIAL("SA2")+cForn+cLj)

//������������������������������������������������������Ŀ
//� Array com os dados a serem passados para o SigaAuto. �
//��������������������������������������������������������
aAutoSE2:={;
{"E2_PREFIXO",cPrefixo       ,Nil},;
{"E2_NUM"    ,cNroTit        ,Nil},;
{"E2_TIPO"   ,cTipo          ,Nil},;
{"E2_PARCELA",cParcela       ,Nil},;
{"E2_NATUREZ",cNatureza      ,Nil},;
{"E2_PORTADO",SA2->A2_BANCO  ,Nil},;
{"E2_FORNECE",SA2->A2_COD    ,Nil},;
{"E2_LOJA"   ,SA2->A2_LOJA   ,Nil},;
{"E2_EMISSAO",dDataBase      ,Nil},;
{"E2_VENCTO" ,dDataBase      ,Nil},;
{"E2_VENCREA",dDataBase      ,Nil},;
{"E2_HIST"   ,cHist          ,Nil},;
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
{"E2_L_FILEN",cFilAnt        ,Nil}}

//���������������������������������������������������������������Ŀ
//� Altera o modulo para Financeiro, senao o SigaAuto nao executa.�
//�����������������������������������������������������������������
nModulo := 6
cModulo := "FIN"

//����������������������������������������������Ŀ
//�Roda SigaAuto de inclusao de Titulos a Pagar. �
//������������������������������������������������

Pergunte("FIN050",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto
MSExecAuto({|x,y| Fina050(x,y)},aAutoSE2,3)

Pergunte(cPerg,.F.) // Chama perguntas da rotina para evitar erros no Sigaauto

//���������������������������Ŀ
//� Restaura o modulo em uso. �
//�����������������������������
nModulo := nModAnt
cModulo := cModAnt

//��������������������������������������������������������������Ŀ
//� Verifica se houve erro no SigaAuto, caso haja mostra o erro. �
//����������������������������������������������������������������
If lMsErroAuto
	lDeuErro := .T.
	Mostraerro()
EndIf

//������������������Ŀ
//� Restaura a area. �
//��������������������
CtrlArea(2,aArea ,aAlias )

Return(lDeuErro)

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � ExcluiSE2� Autor � Microsiga          � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � SigaAuto de Exclusao do Contas a Pagar.                    ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Parametros� ExpC01 - Chave de busca da SE2.                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
�������������������������������������������������������������������������͹��
���Uso       � ExcArq().                                                  ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function ExcluiSE2(cSeekSE2)

Local aArea   := {}
Local aAlias  := {}
Local nModAnt := nModulo
Local cModAnt := cModulo
Local lDeuErro:= .F.

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

//����������������Ŀ
//�  Salva a area. �
//������������������
CtrlArea(1,@aArea,@aAlias,{"SA2","SB1","ZL8","ZLF","SF1","SD1","ZLF","SX1"})

dbSelectArea("SE2")
dbSetOrder(1)
If dbSeek(cSeekSE2)
	
	//������������������������������������������������������Ŀ
	//� Array com os dados a serem passados para o SigaAuto. �
	//��������������������������������������������������������
	aAutoSE2:={;
	{"E2_PREFIXO",SE2->E2_PREFIXO,Nil},;
	{"E2_NUM"    ,SE2->E2_NUM    ,Nil},;
	{"E2_TIPO"   ,SE2->E2_TIPO   ,Nil},;
	{"E2_PARCELA",SE2->E2_PARCELA,Nil},;
	{"E2_NATUREZ",SE2->E2_NATUREZ,Nil},;
	{"E2_FORNECE",SA2->A2_COD    ,Nil},;
	{"E2_LOJA"   ,SA2->A2_LOJA   ,Nil}}
	
	//���������������������������������������������������������������Ŀ
	//� Altera o modulo para Financeiro, senao o SigaAuto nao executa.�
	//�����������������������������������������������������������������
	nModulo := 6
	cModulo := "FIN"
	
	//����������������������������������������������Ŀ
	//�Roda SigaAuto de Exclusao de Titulos a Pagar. �
	//������������������������������������������������

	Pergunte("FIN050",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto
	MSExecAuto({|x,y,z| Fina050(x,y,z)},aAutoSE2,.T.,5)

	Pergunte(cPerg,.F.) // Chama perguntas da rotina para evitar erros no Sigaauto

	If lMsErroAuto
		lDeuErro := .T.
		xMagHelpFis("EXCLUSAO TITULO",;
		"O titulo "+cSeekSE2+" n�o foi encontrado! Produtor: "+SA2->A2_COD+"/"+SA2->A2_LOJA+"-"+SA2->A2_NOME,;
		"Verifique no financeiro se este titulo ja foi baixado ou o motivo pelo qual n�o pode ser exclu�do.")
		MostraErro()
	EndIf
	
	//���������������������������Ŀ
	//� Restaura o modulo em uso. �
	//�����������������������������
	nModulo := nModAnt
	cModulo := cModAnt
Else
	lDeuErro := .T.
	xMagHelpFis("EXCLUSAO TITULO",;
	"O titulo "+cSeekSE2+" n�o foi encontrado! Produtor: "+SA2->A2_COD+"/"+SA2->A2_LOJA+"-"+SA2->A2_NOME,;
	"Verifique no financeiro se este titulo existe, pois o mesmo n�o foi encontrado.")
EndIf

//������������������Ŀ
//� Restaura a area. �
//��������������������
CtrlArea(2,aArea,aAlias)

Return(lDeuErro)

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � CtrlArea � Autor � Microsiga          � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Static Function auxiliar no GetArea e ResArea retornando   ���
���          � o ponteiro nos Aliases descritos na chamada da Funcao.     ���
���          � Exemplo:                                                   ���
���          � Local aArea   := {} // Array que contera o GetArea         ���
���          � Local aAlias  := {} // Array que contera o                 ���
���          �                     // Alias(), IndexOrd(), Recno()        ���
���          �                                                            ���
���          � // Chama a Funcao como GetArea                             ���
���          � P_CtrlArea(1,@aArea ,@aAlias ,{"SL1","SL2","SL4"})         ���
���          �                                                            ���
���          � // Chama a Funcao como RestArea                            ���
���          � P_CtrlArea(2,aArea ,aAlias )                               ���
�������������������������������������������������������������������������͹��
���Parametros� nTipo   = 1=GetArea / 2=RestArea                           ���
���          � aArea   = Array passado por referencia que contera GetArea ���
���          � aAlias  = Array passado por referencia que contera         ���
���          �           {Alias(), IndexOrd(), Recno()}                   ���
���          � _aArqs  = Array com Aliases que se deseja Salvar o GetArea ���
�������������������������������������������������������������������������͹��
���Uso       � GENERICO                                                   ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
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

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � AjustaSX1� Autor � Microsiga          � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao para criacao das perguntas caso elas nao existam.   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function AjustaSX1()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe os codigos dos setores a serem ')
Aadd( aHelpPor, 'considerados no Estorno.   .           ')
Aadd( aHelpSpa, 'Informe os codigos dos setores a serem ')
Aadd( aHelpSpa, 'considerados no Estorno.               ')
Aadd( aHelpEng, 'Informe os codigos dos setores a serem ')
Aadd( aHelpEng, 'considerados no Estorno.               ')
PutSx1(cPerg,"01","Setor?","Setor?","Setor?","mv_ch1","C",60,0,0,"G",'VAZIO().OR.SUBSTR(MV_PAR01,Len(ALLTRIM(MV_PAR01)),1)=="/"',"U_F302","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpPor, 'zado para o Estorno.                   ')
Aadd( aHelpPor, 'ATENCAO: Escolha um MIX aberto e com   ')
Aadd( aHelpPor, 'periodo correto.                       ')
Aadd( aHelpSpa, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpSpa, 'zado para o Estorno.   .               ')
Aadd( aHelpSpa, 'ATENCAO: Escolha um MIX aberto e com   ')
Aadd( aHelpSpa, 'periodo correto.                       ')
Aadd( aHelpEng, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpEng, 'zado para o Estorno.                   ')
Aadd( aHelpEng, 'ATENCAO: Escolha um MIX aberto e com   ')
Aadd( aHelpEng, 'periodo correto.                       ')
PutSx1(cPerg,"02","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch2","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_01","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return