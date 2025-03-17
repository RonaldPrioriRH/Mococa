#INCLUDE "PROTHEUS.CH"
#DEFINE LINHAS 999
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT019  � Autor � TOTVS                 � Data da Criacao  � 31/10/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Rotina desenvolvida para possibilitar visualizar os Eventos dos produtores.                                  ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Visualiza Eventos por produtor.			                                                                    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum						   							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum						  							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite.                                                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �00/00/0000�                               				   �00-000000 -                       � TI	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/
User Function AGLT019()

//��������������������������������������������������������������Ŀ
//� Define Variaveis Local                                       �
//����������������������������������������������������������������
Local aQuery     := {}
Local cCondicao  := " A2_L_TPFOR $ 'P/G/T'"
Local bFiltraBrw := {|| NIL }

//��������������������������������������������������������������Ŀ
//� Define Variaveis Private                                     �
//����������������������������������������������������������������
Private aRotina    := MenuDef()
Private cCadastro  := OemToAnsi("Eventos por Produtor")
Private cAlias     := "SA2"
Private bVisualiza := {|| GLTVisual('SA2',Recno('SA2'),1)}
Private bImprime   := {|| GLTImprime()}
Private cPerg      := "AGLT019"

//���������������������������������������������������������������������Ŀ
//� Chama funcao para criar os parametros caso nao existam.             �
//�����������������������������������������������������������������������
AjustaSX1()

//���������������������������������������������������������������������Ŀ
//� Chama a tela para preenchimento dos parametros.                     �
//�����������������������������������������������������������������������
If !Pergunte(cPerg,.T.)
	Return()
EndIf

//���������������������������������������������������������������������Ŀ
//� Posiciona no cadastro do MIX.                                       �
//�����������������������������������������������������������������������
DbSelectArea("ZLE")
DbSetOrder(1)
If DbSeek(xFILIAL("ZLE")+MV_PAR01)
	DbSelectArea("ZLF")
	DbSetOrder(1)
	DbSeek(xFILIAL("ZLF")+ZLE->ZLE_COD,.T.)
Else
	MsgAlert("Codigo de MIX n�o encontrado!","Alerta")
	Return
EndIf

//��������������������������������������������������������������Ŀ
//� Verifica se o Arquivo Esta Vazio                             �
//����������������������������������������������������������������
If !ChkVazio(cAlias)
	Return( NIL )
Endif

//������������������������������������������������������������������������Ŀ
//�Realiza o Filtro                                                        �
//��������������������������������������������������������������������������
bFiltraBrw := {|| FilBrowse(cAlias,@aQuery,@cCondicao) }
Eval(bFiltraBrw)

//��������������������������������������������������������������Ŀ
//� Endereca a funcao de BROWSE                                  �
//����������������������������������������������������������������
DbSelectArea(cAlias)
mBrowse( 6, 1,22,75,cAlias,,"A2_MSBLQL=='1'",,,,)

//������������������������������������������������������������������������Ŀ
//�Encerra o filtro da tabela.                                             �
//��������������������������������������������������������������������������
EndFilBrw(cAlias,aQuery)

Return( NIL )

/*/
���������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Programa  � MenuDef  � Autor � Microsiga             � Data �00/00/0000���
�������������������������������������������������������������������������Ĵ��
���Descri��o � Utilizacao de Menu Funcional                               ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
���Retorno   � Array com opcoes da rotina                                 ���
�������������������������������������������������������������������������Ĵ��
���Parametros�Array aRotina:                                              ���
���          �                                                            ���
���          �1. Nome a aparecer no cabecalho                             ���
���          �2. Nome da Rotina associada                                 ���
���          �3. Reservado                                                ���
���          �4. Tipo de Transa��o a ser efetuada:                        ���
���          � 	  1 - Pesquisa e Posiciona em um Banco de Dados           ���
���          �    2 - Simplesmente Mostra os Campos                       ���
���          �    3 - Inclui registros no Bancos de Dados                 ���
���          �    4 - Altera o registro corrente                          ���
���          �    5 - Remove o registro corrente do Banco de Dados        ���
���          �5. Nivel de acesso                                          ���
���          �6. Habilita Menu Funcional                                  ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � AGLT001()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function MenuDef()

Private aRotina	:=  {{OemToAnsi("Pesquisar"),"AxPesqui", 0,1,0,.F.},;
{OemToAnsi("Visualizar"),'Eval(bVisualiza)' , 0 , 2,0,nil},;
{OemToAnsi("Imprimir"),'Eval(bImprime)' , 0 , 6,,,.F.}}

Return (aRotina)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �GLTVisual � Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Funcao para Visualizar os eventos do produtor.             ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � AGLT001()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function GLTVisual(cAlias,nReg,nOpc)

Local cTitulo    := "Eventos por Produtor"
Local aObjects 	 := {}
Local aPosObj    := {}
Local aSize    	 := MsAdvSize()
Local aInfo    	 := {aSize[1],aSize[2],aSize[3],aSize[4],3,3}
Local aNoFields	 := {"ZLF_FILIAL","ZLF_CODZLE","ZLF_DTINI","ZLF_DTFIM","ZLF_STATUS"}
Local aYesFields := {"ZLF_SETOR","ZLF_DCRSET","ZLF_LINROT","ZLF_DCRLIN","ZLF_RETIRO","ZLF_RETILJ","ZLF_DCRRET","ZLF_EVENTO","ZLF_DCREVE","ZLF_DEBCRE","ZLF_QTDBOM","ZLF_QTDACI","ZLF_VLRLTR","ZLF_TOTAL"}
Local nOffSet    := 0

Private cSeek     := xFilial("ZLF")+MV_PAR01+SA2->A2_COD+SA2->A2_LOJA
Private cMIX      := ZLE->ZLE_COD
Private dDataIni  := ZLE->ZLE_DTINI
Private dDataFim  := ZLE->ZLE_DTFIM
Private cSetor	  := ZLF->ZLF_SETOR
Private cDescSet  := ZLF->ZLF_DCRSET
Private cLinRot	  := ZLF->ZLF_LINROT
Private cDcrLR    := ZLF->ZLF_DCRLIN
Private cTipoLR   := ZLF->ZLF_TP_RL
Private cProdutor := ZLF->ZLF_RETIRO
Private cLoja	  := ZLF->ZLF_RETILJ
Private cNome	  := ZLF->ZLF_DCRRET
Private nQtdBom   := ZLF->ZLF_QTDBOM
Private nVlrLtr   := ZLF->ZLF_VLRLTR
Private nVlrTot   := ZLF->ZLF_QTDBOM*ZLF->ZLF_VLRLTR
Private nVlrCre   := 0
Private nVlrDeb   := 0
Private nSldLiq   := 0
Private bVldLin	  := {|| GLTlinOK()}
Private bVldTela  := {|| GLTtudoOk()}
Private lFlat     := .F.
Private aButtons  := If(Type("aButtons") == "U", {}, aButtons)
Private nPosRetiro,nPosLoja,nPosProdu,nPosLocal,nPosQtdBom,nPosQtdAcid,nPosNomRet
Private oDlg,oLteBom,oLteAci,oSetor,oLinRota,oDif
Private aHeader[0]
Private aCols[0]

//��������������������������������������������������������������Ŀ
//� Cria aHeader.                                                �
//����������������������������������������������������������������
nUsado:=0
DbSelectArea("SX3")
DbSeek("ZLF")
While !Eof().And.(X3_ARQUIVO=="ZLF")
	If Alltrim(X3_CAMPO) $ "ZLF_EVENTO#ZLF_DCREVE#ZLF_DEBCRE#ZLF_TOTAL"
		nUsado:=nUsado+1
		Aadd(aHeader,{ TRIM(X3Titulo()), X3_CAMPO, X3_PICTURE,;
		X3_TAMANHO, X3_DECIMAL,X3_VALID,;
		X3_USADO, X3_TIPO, X3_ARQUIVO, X3_CONTEXT, X3_RELACAO, X3_RESERV } )
		wVar  := "M->"+X3_CAMPO
		&wVar := CriaVar(X3_CAMPO)
	Endif
	DbSkip()
EndDo

//��������������������������������������������������������������Ŀ
//� Cria aCols.                                                  �
//����������������������������������������������������������������
aCols:={}
DbSelectArea("ZLF")
DbSetOrder(1)
DbSeek(cSeek,.T.)
While ZLF->(!Eof()) .And. ZLF->ZLF_FILIAL==xFilial("ZLF");
	.And. ZLF->ZLF_CODZLE == MV_PAR01;
	.And. ZLF->ZLF_RETIRO == SA2->A2_COD;
	.And. ZLF->ZLF_RETILJ == SA2->A2_LOJA
	
	AADD(aCols,Array(nUsado+1))
	For _ni:=1 to nUsado
		aCols[Len(aCols),_ni] := If(aHeader[_ni,10] # "V",FieldGet(FieldPos(aHeader[_ni,2])),CriaVar(aHeader[_ni,2]))
	Next
	aCols[Len(aCols),nUsado+1]:=.F.
	
	//����������������������������������������������������
	//� Calcula o valor liquido a pagar para o produtor. �
	//����������������������������������������������������
	If ZLF->ZLF_DEBCRED == "C"
		nVlrCre += ZLF->ZLF_TOTAL
	Else
		nVlrDeb += ZLF->ZLF_TOTAL
	EndIf
	ZLF->(DbSkip())
EndDo

//����������������������������������������������������
//� Ordena o Acols por Credito + Debitos.            �
//����������������������������������������������������
aSort(aCols,,,{|x,y| x[3] < y[3] })

AADD(aObjects,{100,055,.T.,.F.,.T.})
AADD(aObjects,{100,100,.T.,.T.})
AADD(aObjects,{100,002,.T.,.F.})

nPosRetiro	:= ascan(aHeader,{|x| alltrim(x[2]) == "ZLF_RETIRO"})
nPosLoja	:= ascan(aHeader,{|x| alltrim(x[2]) == "ZLF_RETILJ"})
nPosQtdBom 	:= ascan(aHeader,{|x| alltrim(x[2]) == "ZLF_QTDBOM"})
nPosQtdAcid	:= ascan(aHeader,{|x| alltrim(x[2]) == "ZLF_QTDACI"})
nPosNomRet	:= ascan(aHeader,{|x| alltrim(x[2]) == "ZLF_DCRRET"})
aPosObj     := MsObjSize(aInfo,aObjects)
nSldLiq     := nVlrCre - nVlrDeb

//���������������������������Ŀ
//�Tratamento para tema "Flat"�
//�����������������������������
If "P10" $ oApp:cVersion
	If (Alltrim(GetTheme()) == "FLAT") .Or. SetMdiChild()
		lFlat := .T.
		nOffSet := 7
	EndIf
EndIf

DEFINE MSDIALOG oDlg TITLE cTitulo OF oMainWnd PIXEL FROM aSize[7],0 TO aSize[6],aSize[5]

@ 1.6,00.7 SAY "MIX"
@ 1.5,04.7 MSGET cMIX Picture PesqPict("ZLE","ZLE_COD") Valid CheckSX3("ZLE_COD") .And.  VldUser('ZLE_COD') WHEN .F.
@ 1.6,09.5 SAY "Data Inicio"
@ 1.5,13.2 MSGET dDataIni Valid CheckSX3("ZLE_DTINI") .And. VldUser('ZLE_DTINI') WHEN .F.
@ 1.6,20.0 SAY "Data Fim"
@ 1.5,23.5 MSGET dDataFim Valid CheckSX3("ZLE_DTFIM") .And. VldUser('ZLE_DTFIM') WHEN .F.

@ 2.6,00.7 SAY "Produtor"
@ 2.5,04.7 MSGET cProdutor Valid CheckSX3("ZLF_RETIRO") .And.  VldUser('ZLF_RETIRO') WHEN .F.
@ 2.5,07.5 MSGET cLoja     Valid CheckSX3("ZLF_RETILJ") .And.  VldUser('ZLF_RETILJ') WHEN .F.
@ 2.5,13.2 MSGET cNome WHEN .F.

@ 3.6,00.7 SAY "Linha/Rota"
@ 3.5,04.7 MSGET oLinRota var cLinRot WHEN .F.
@ 3.5,09.4 MSGET cDcrLR WHEN .F.
@ 3.6,40.7 SAY "Tipo"
@ 3.5,44.0 MSGET cTipoLR WHEN .F.

@ 4.6,00.5 SAY "Setor"
@ 4.5,04.7 MSGET oSetor var cSetor  WHEN .F.
@ 4.5,09.4 MSGET cDescSet  WHEN .F.

@ aPosObj[3,1]-nOffSet,005 SAY "Leite Bom" OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,030 	MSGET nQtdBom Picture "@E 999,999" WHEN .F. SIZE 50,7 OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,090 SAY "Vlr. Litro" OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,120 MSGET nVlrLtr Picture "@E 999,999.9999" WHEN .F. SIZE 50,7 OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,175 SAY "Total Leite" OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,200 MSGET nVlrTot Picture "@E 999,999.99" WHEN .F. SIZE 50,7 OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,260 SAY "Creditos" OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,290 MSGET nVlrCre Picture "@E 999,999.99" WHEN .F. SIZE 50,7 OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,375 SAY "Debitos" OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,405 MSGET nVlrDeb Picture "@E 999,999.99" WHEN .F. SIZE 50,7 OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,490 SAY "Saldo" OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,520 MSGET nSldLiq Picture "@E 999,999.99" WHEN .F. SIZE 50,7 OF oDlg PIXEL

oGet := MSGetDados():New(aPosObj[2,1]+20,aPosObj[2,2],aPosObj[2,3]-10,aPosObj[2,4],nOpc,"Eval(bVldLin)","Eval(bVldTela)","",.T.,NIL,NIL,NIL,LINHAS)

ACTIVATE MSDIALOG oDlg ON INIT EnchoiceBar(oDlg,{|| .T.,oDlg:End()},{||oDlg:End()},,aButtons)

Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �GLTlinOK  � Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Funcao para validacao da linha do Acols.                   ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � AGLT001()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function GLTlinOK()
Local lRet := .T.
Return lRet

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �GLTtudoOk � Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Funcao para validacao da tela.                             ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � AGLT001()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function GLTtudoOk()
Local lRet := .T.
Return lRet

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �GLTImprime� Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Funcao para Imprimir os eventos do produtor.               ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � AGLT001()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function GLTImprime()
Return

/*
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
*/
Static Function AjustaSX1()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

Aadd( aHelpPor, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpPor, 'zado para o Fechamento.                ')
Aadd( aHelpPor, 'ATENCAO: Escolha um MIX calculado e com')
Aadd( aHelpPor, 'periodo correto.                       ')
Aadd( aHelpSpa, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpSpa, 'zado para o Fechamento.                ')
Aadd( aHelpSpa, 'ATENCAO: Escolha um MIX calculado e com')
Aadd( aHelpSpa, 'periodo correto.                       ')
Aadd( aHelpEng, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpEng, 'zado para o Fechamento.                ')
Aadd( aHelpEng, 'ATENCAO: Escolha um MIX calculado e com')
Aadd( aHelpEng, 'periodo correto.                       ')
PutSx1(cPerg,"01","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch1","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_01","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return