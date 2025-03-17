#INCLUDE "PROTHEUS.CH"
#INCLUDE "RWMAKE.CH"
#INCLUDE "TOPCONN.CH"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT006  � Autor � TOTVS                 � Data da Criacao  � 29/10/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Rotina desenvolvida para possibilitar o cadastramento de Eventos                                   			���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Cadastro de Eventos           						                                                        ���
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
User Function AGLT006

//���������������������������������������������������������������������Ŀ
//� Declaracao de Variaveis                                             �
//�����������������������������������������������������������������������
Private aRotina   := MenuDef()
Private cCadastro := "Cadastro de Eventos"
Private cAlias    := "ZL8"
Private bExclusao := {|| GLTDeleta()}
Private bInclusao := {|| GLTInclui()}


//Vari�veis para serem utilizadas na cria��o dos eventos.
Public _pnVLEITE := 0
Public _pnGetRedut := 0 //U_GetRedut(cCodMIX,SA2->A2_COD,SA2->A2_LOJA,ZL2->ZL2_COD,ZL3->ZL3_COD,_cVersao)
Public _npGetCreditos := 0                        //



mBrowse( 6, 1,22,75,cAlias,,,,,,)

Return

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
{OemToAnsi("Visualizar"),"AxVisual"       , 0 , 2,0,nil},;
{OemToAnsi("Incluir")   ,'Eval(bInclusao)', 0 , 3,0,nil},;
{OemToAnsi("Alterar")   ,"AxAltera"       , 0 , 4,0,.F.},;
{OemToAnsi("Excluir")   ,'Eval(bExclusao)', 0 , 5,0,.F.}}

Return (aRotina)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �GLTInclui � Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Funcao para validar a Inclusao.                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � AGLT006()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function GLTInclui(aAcho,cFunc,aCpos,cTudoOk,lF3,cTransact,aButtons,aParam,aAuto,lVirtual,lMaximized)

Local cAlias   := "ZL8"
Local nReg     := ZL8->(Recno())
Local nOpc     := 3
Local aArea    := GetArea(cAlias)
Local aCRA     := { oemtoansi("Confirma"),oemtoansi("Redigita"),oemtoansi("Abandona") }
Local aSvRot   := Nil
Local aPosEnch := {}
Local cMemo    := ""
Local nX       := 0
Local nOpcA    := 0
Local nLenSX8  := GetSX8Len()
Local bCampo   := {|nCPO| Field(nCPO) }
Local bOk      := Nil
Local bOk2     := {|| .T.}
Local oDlg
Local nTop
Local nLeft
Local nBottom
Local nRight
Local cAliasMemo
Local bEndDlg := {|lOk| lOk:=oDlg:End(), nOpcA:=1, lOk}
Local oEnc01
Local lTela   := .T.

Private aTELA[0][0]
Private aGETS[0]

DEFAULT cTudoOk := ".T."
DEFAULT bOk     := &("{|| "+cTudoOk+"}")
DEFAULT lF3     := .F.
DEFAULT lVirtual:= .F.

//�������������������������������������������������������������������Ŀ
//� Processamento de codeblock de validacao de confirmacao            �
//���������������������������������������������������������������������
If !Empty(aParam)
	bOk2 := aParam[2]
EndIf

//��������������������������������������������������������������Ŀ
//� Monta a entrada de dados do arquivo							 �
//����������������������������������������������������������������
If nOpc == Nil
	nOpc := 3
	If Type("aRotina") == "A"
		aSvRot := aClone(aRotina)
	EndIf
	Private aRotina := { { " "," ",0,1 } ,{ " "," ",0,2 },{ " "," ",0,3 } }
EndIf
RegToMemory(cAlias, .T., lVirtual )

//����������������������������������������������������������������������Ŀ
//� Inicializa variaveis para campos Memos Virtuais (GILSON)			 �
//������������������������������������������������������������������������
If Type("aMemos")=="A"
	For nX :=1 To Len(aMemos)
		cMemo := aMemos[nX][2]
		If ExistIni(cMemo)
			&cMemo := InitPad(SX3->X3_RELACAO)
		Else
			&cMemo := ""
		EndIf
	Next nX
EndIf

//������������������������������������������������������Ŀ
//� Funcoes executadas antes da chamada da Enchoice      �
//��������������������������������������������������������
If cFunc != NIL
	&cFunc.()
EndIf

//�������������������������������������������������������������������Ŀ
//� Processamento de codeblock de antes da interface                  �
//���������������������������������������������������������������������
If !Empty(aParam)
	Eval(aParam[1],nOpc)
EndIf

//������������������������������������������������������Ŀ
//� Envia para processamento dos Gets					 �
//��������������������������������������������������������
If SetMDIChild()
	oMainWnd:ReadClientCoors()
	nTop := 40
	nLeft := 30
	nBottom := oMainWnd:nBottom-80
	nRight := oMainWnd:nRight-70
Else
	nTop := 135
	nLeft := 0
	nBottom := TranslateBottom(.T.,28)
	nRight := 632
EndIf
If FindFunction("ISPDA") .and. IsPDA()
	nTop := 0
	nLeft := 0
	nBottom := PDABOTTOM
	nRight  := PDARIGHT
EndIf

// Build com corre��o no tratamento dos controles pendentes na dialog ao executar o m�todo End()
If GetBuild() >= "7.00.060302P"
	bEndDlg := {|lOk| If(lOk:=oDlg:End(),nOpcA:=1,nOpcA:=3), lOk}
EndIf


DEFINE MSDIALOG oDlg TITLE cCadastro FROM nTop,nLeft TO nBottom,nRight PIXEL OF oMainWnd

If lMaximized <> NIL
	oDlg:lMaximized := lMaximized
EndIf

If FindFunction("ISPDA") .and. IsPDA()
	aPosEnch := {,,,}
	oEnc01:= MsMGet():New( cAlias, nReg, nOpc, aCRA,"CRA",oemtoansi("Quanto � inclus�o?"),aAcho, aPosEnch , aCpos, , , ,cTudoOk,,lF3,lVirtual,.t.)
	oEnc01:oBox:align := CONTROL_ALIGN_ALLCLIENT
Else
	aPosEnch := {,,(oDlg:nClientHeight - 4)/2,}
	EnChoice( cAlias, nReg, nOpc, aCRA,"CRA",oemtoansi("Quanto � inclus�o?"),aAcho, aPosEnch , aCpos, , , ,cTudoOk,,lF3,lVirtual)
EndIf
If lF3  // Esta na conpad, desabilita o trigger por execblock
	SetEntryPoint(.f.)
EndIf

ACTIVATE MSDIALOG oDlg ON INIT EnchoiceBar(oDlg,{|| If(Obrigatorio(aGets,aTela).And.Eval(bOk).And.Eval(bOk2,nOpc).And.ValCmpos(),Eval(bEndDlg),(nOpcA:=3,.f.))},{|| nOpcA := 3,oDlg:End()},,aButtons)

//������������������������������������������������������Ŀ
//� Gravacao da enchoice                                 �
//��������������������������������������������������������
If nOpcA == 1
	Begin Transaction
	RecLock(cAlias,.T.)
	For nX := 1 TO FCount()
		If "_FILIAL"$FieldName(nX)
			FieldPut(nX,xFilial(cAlias))
		Else
			FieldPut(nX,M->&(EVAL(bCampo,nX)))
		EndIf
	Next nX
	
	//���������������������������������������Ŀ
	//�Grava os campos Memos Virtuais         �
	//�����������������������������������������
	If Type("aMemos") == "A"
		For nX := 1 to Len(aMemos)
			cVar := aMemos[nX][2]
			//Incluido parametro com o nome da tabela de memos => para modulo APT
			cAliasMemo := If(len(aMemos[nX]) == 3,aMemos[nX][3],Nil)
			MSMM(,TamSx3(aMemos[nX][2])[1],,&cVar,1,,,cAlias,aMemos[nX][1],cAliasMemo)
		Next nX
	EndIf
	While ( GetSX8Len() > nLenSX8 )
		//������������������������������������������������������������������Ŀ
		//�Confirma a numeracao com a verificacao do numero gravado ativado  �
		//��������������������������������������������������������������������
		ConfirmSx8()
	EndDo
	If cTransact != Nil
		If !("("$cTransact)
			cTransact+="()"
		EndIf
		&cTransact
	EndIf
	//�������������������������������������������������������������������Ŀ
	//� Processamento de codeblock dentro da transacao                    �
	//���������������������������������������������������������������������
	If !Empty(aParam)
		Eval(aParam[3],nOpc)
	EndIf
	End Transaction
	//�������������������������������������������������������������������Ŀ
	//� Processamento de codeblock fora da transacao                      �
	//���������������������������������������������������������������������
	If !Empty(aParam)
		Eval(aParam[4],nOpc)
	EndIf
Else
	While ( GetSX8Len() > nLenSX8 )
		RollBackSX8()
	EndDo
EndIf

//�������������������������������������������������������������������Ŀ
//� Restaura a integridade dos dados                                  �
//���������������������������������������������������������������������
If aSvRot != Nil
	aRotina := aClone(aSvRot)
EndIf

RestArea(aArea)
lRefresh := .T.

Return(nOpcA)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    � ValCmpos � Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Funcao para validar os campos preenchidos pelo usuario.    ���
���          � Verifica se os valores dos campos estao de acordo com o    ���
���          � tipo do Evento escolhido.                                  ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � GLTInclui()                                                ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function ValCmpos()

Local lRet := .T.

If M->ZL8_TPEVEN == "F" //Financeiro
	Do Case
		Case Empty(M->ZL8_PREFIX)
			xMagHelpFis("Prefixo",;
			"Para eventos do tipo Financeiro, � obrigat�rio o preenchimento do Prefixo.",;
			"Preencha o campo Prefixo no cadastro de Eventos.")
			lRet := .F.
		Case !Empty(M->ZL8_SB1COD)
			xMagHelpFis("Produto",;
			"Para eventos do tipo Financeiro, o campo Cod. Produto deve ficar em branco.",;
			"Deixe o conteudo do campo Cod. Produto vazio no cadastro de Eventos.")
			lRet := .F.
		Case Empty(M->ZL8_PRIORI)
			xMagHelpFis("Prioridade",;
			"Para eventos do tipo Financeiro, � obrigat�rio o preenchimento da Sequencia de Prioridade de Acerto do Leite.",;
			"Preencha o campo Seq. Priorid. no cadastro de Eventos.")
			lRet := .F.
		Case Empty(M->ZL8_NATFRT) .or. Empty(M->ZL8_NATPRD)
			xMagHelpFis("Natureza Fiannceira",;
			"Para eventos do tipo Financeiro, � obrigat�rio o preenchimento dos campos de natureza financeira.",;
			"Preencha a natureza que ser� utilizada nos t�tulos a pagar (Nat. Tit Pag), e t�tulos a receber (Nat. Tit Rec). ")
			lRet := .F.
/*
		Case M->ZL8_DEBCRE == "C"
			xMagHelpFis("Debito/Credito",;
			"Para eventos do tipo Financeiro, � obrigat�rio o preenchimento do campo Debit/Credit como D�bito.",;
			"Preencha o campo Debit/Credit como D�bito no cadastro de Eventos.")
			lRet := .F.

*/
	EndCase
ElseIf M->ZL8_TPEVEN == "A" //Automatico
	Do Case
		Case Empty(M->ZL8_PREFIX) .And. M->ZL8_DEBCRE == "D"
			xMagHelpFis("Prefixo",;
			"Para eventos do tipo Autom�tico de D�bito/Cr�dito, � obrigat�rio o preenchimento do Prefixo.",;
			"Preencha o campo Prefixo no cadastro de Eventos.")
			lRet := .F.
		Case Empty(M->ZL8_SB1COD) .And. M->ZL8_DEBCRE == "C"
			xMagHelpFis("Cod. Produto",;
			"Para eventos do tipo Autom�tico de Cr�dito, � obrigat�rio o preenchimento do campo Cod. Produto.",;
			"Preencha o campo Cod. Produto no cadastro de Eventos.")
			lRet := .F.
	EndCase
EndIf

Return(lRet)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �GLTDeleta � Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Funcao para validar a exclusao.                            ���
���          � Verifica se nao existem Veiculos, amarrados ao motorista.  ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � AGLT001()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function GLTDeleta

Local _cAlias  := "ZL8"
Local _nOrdZL8 := ZL8->(IndexOrd())
Local _nRecZL8 := ZL8->(Recno())
Local nOpcao   := AxVisual(_cAlias,_nRecZL8,5)
Local bDel     := .T.

If nOpcao == 1
	_cQuery := " SELECT COUNT(*) AS QUANT"
	_cQuery += " FROM "+RetSqlName("ZLF")+" ZLF "
	_cQuery += " WHERE "
	_cQuery += " D_E_L_E_T_ = ' '"
	_cQuery += " AND ZLF_FILIAL = '"+xFILIAL("ZLF")+"'"
	_cQuery += " AND ZLF_EVENTO = '"+ZL8->ZL8_COD+"'"
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(_cQuery))),'TRB',.F.,.T.)
	
	If TRB->(!Eof()) .And. TRB->QUANT > 0
		bDel := .F.
		xmaghelpfis("Restricao",;
		"Registro nao pode ser excluido por haver relacionamentos com o MIX!",;
		"Somente poder� ser excluido se nao existirem movimentos no MIX!")
		TRB->(dbskip())
	EndIf
	TRB->(dbclosearea())
	
	If bDel
		dbSelectArea(_cAlias)
		dbSetOrder(_nOrdZL8)
		dbGoto(_nRecZL8)
		If MsgYesNo("Tem absoluta certeza que deseja Excluir?")
			RecLock(_cAlias,.F.)
			DbDelete()
			MsUnLock()
		EndIf
		
		Return()
	EndIf
EndIf

//�������������������Ŀ
//�Restaura o Ambiene.�
//���������������������
dbSelectArea(_cAlias)
dbSetOrder(_nOrdZL8)
dbGoto(_nRecZL8)

Return()



/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �ZL8COD    �Autor  �Microsiga           � Data �  03/16/15   ���
�������������������������������������������������������������������������͹��
���Desc.     � Gera numeracao para o evento.                              ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
User function ZL8COD(_xCod)

Local _aArea := GetArea()
Local _cRet:= ""
Local _cAlias := GetNextAlias()
Local _cCod := Alltrim(_xCod)


BeginSql alias _cAlias
	SELECT MAX(ZL8_COD) AS CODZL8
	FROM %Table:ZL8% ZL8
	WHERE ZL8_GRUPO = %Exp:_cCod%
	AND ZL8.D_E_L_E_T_ = ' '
EndSql

If !(_cAlias)->(Eof()) .and. !Empty((_cAlias)->CODZL8)
	_cRet := Soma1((_cAlias)->CODZL8)
Else
	_cRet := SubStr(_cCod,5,2)+"0001"
EndIf

DbCloseArea(_cAlias)

RestArea(_aArea)

Return _cRet
