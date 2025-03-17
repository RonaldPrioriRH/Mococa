#INCLUDE "PROTHEUS.CH"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT025  � Autor � TOTVS                 � Data da Criacao  � 17/11/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Cadastro de Desvio de Rotas/Linhas                                                                           ���
���          �                     												                               				���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Cadastro de Desvio de Rotas/Linhas				                                                            ���
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
User Function AGLT025(aArea)

Local aQuery     := {}
Local aSetor	 := {}
Local cCondicao  := ""
Local bFiltraBrw := {|| NIL }

//���������������������������������������������������������������������Ŀ
//� Declaracao de Variaveis                                             �
//�����������������������������������������������������������������������
Private aRotina   := MenuDef()
Private bManipula := {|| GLTDeleta()}
Private bInclui := {|| AGLT25Inc()}
Private bAltera := {|| AGLT25Alt()}
Private bAprov := {|| AGLT25Aprov()}
Private bLegenda := {|| Legenda()}
Private cCadastro := "Cadastro de Desvios"
Private _cAlias    := "ZLC"
Private _cUser		:= U_UCFG001(1)

Private aCores := {{"ZLC_STATUS == 'A'",'ENABLE' },;// APROVADO
{ "ZLC_STATUS == 'N'",'DISABLE'}}   // DESAPROVADO


//������������������������������������������������������Ŀ
//� Obtem Setores que podem ser acessados                �
//��������������������������������������������������������
//cCondicao := u_filSetor("ZLC_SETOR")



	//������������������������������������������������������Ŀ
	//� Seta filtro dos Setores                              �
	//��������������������������������������������������������
//	bFiltraBrw := {|| FilBrowse(cAlias,@aQuery,@cCondicao) }
//	Eval(bFiltraBrw)
	
	mBrowse( 6, 1,22,75,_cAlias,,,,,,aCores)
	
	//������������������������������������������������������Ŀ
	//� Finaliza filtro                                      �
	//��������������������������������������������������������
//	EndFilBrw(cAlias,aQuery)

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

Local _aRotina	:=  {{OemToAnsi("Pesquisar"),"AxPesqui", 0,1,0,.F.},;
{OemToAnsi("Visualizar"),"AxVisual" , 0 , 2},;
{OemToAnsi("Incluir")   ,"Eval(bInclui)" , 0 ,3},;
{OemToAnsi("Alterar")   ,"Eval(bAltera)" , 0 , 4},;
{OemToAnsi("Aprova��o")   ,"Eval(bAprov)", 0 , 4},;
{OemToAnsi("Excluir")   ,"Eval(bManipula)", 0 , 5},;
{OemToAnsi("LegEnda")  ,"Eval(bLegenda)", 0 , 3}} // LegEnda
/*Private aRotina := { {"Pesquisar","AxPesqui",0,1} ,;
             {"Visualizar","AxVisual",0,2} ,;
             {"Incluir","AxInclui",0,3} ,;
             {"Alterar","AxAltera",0,4} ,;
             {"Excluir","AxDeleta",0,5} }
*/

Return (_aRotina)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �AGLT25Inc � Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Funcao para validar a inclus�o.                            ���
���          � 																	 ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � AGLT025                                                    ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function AGLT25Inc()

Local _aArea	:= GetArea()
Local _cAlias := "ZLC"
Local _nReg   := Recno()
Local _nOpc   := 3

If Permissao(_cUser,"1")
	AxInclui(_cAlias,_nReg,_nOpc)
Else
	xMagHelpFis("Atencao","Seu usuario nao possui permissao para efetuar essa rotina!","Solicite essa permissao ao administrador do sistema!")
EndIf

Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �AGLT25Alt � Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Funcao para validar a altera��o                            ���
���          � 																	 ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � AGLT025                                                    ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function AGLT25Alt()

Local _lFlag := .f.
Local _aArea	:= GetArea()
Local cAlias := "ZLC"
Local nReg   := ZLC->(recno())
Local nOpc   := 4

If Permissao(_cUser,"2")
	If ZLC->ZLC_STATUS == 'S'
		If MsgYesNo("O registro j� foi aprovado, sua altera��o ir� causar o bloqueio. Deseja continuar?","Registro Aprovado")
			If AxAltera(cAlias,nReg,nOpc) == 1 // Se clicar em OK altera o status para nao autorizado.
				RecLock("ZLC",.F.)
				ZLC->ZLC_STATUS := "N"
				MsUnlock()
			EndIf
		EndIf
	Else
		AxAltera(cAlias,nReg,nOpc)
	endIf

Else
	xMagHelpFis("Aten��o","Seu usuario nao possui permiss�o para executar essa rotina!","Solicite essa permiss�o ao administrador do sistema!")
EndIf

RestArea(_aArea)

Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �AGLT25Aprov� Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Funcao para validar e executar a aprova��o do desvio de    ���
���          � rota.																 ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � AGLT025                                                    ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function AGLT25Aprov()

Local _aArea	:= GetArea()

If Permissao(_cUser,"3")
	RecLock("ZLC",.f.)
	ZLC->ZLC_STATUS := "A"
	MsUnlock()
Else
	xMagHelpFis("Aten��o","Seu usuario nao possui permiss�o para executar essa rotina!","Solicite essa permiss�o ao administrador do sistema!")
EndIf

RestArea(_aArea)

Return


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
��� Uso      � AGLT025                                                    ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function GLTDeleta()

Local _cAlias  := "ZLC"
Local _nOrdZLC := ZLC->(IndexOrd())
Local _nRecZLC := ZLC->(Recno())
Local nOpcao   := AxVisual(_cAlias,_nRecZLC,5)


If Permissao(_cUser,"2")
	axDeleta(_cAlias,_nRecZLC,nOpcao)
Else
	xMagHelpFis("Aten��o","Seu usuario nao possui permiss�o para executar essa rotina!","Solicite essa permiss�o ao administrador do sistema!")
EndIf
	

//�������������������Ŀ
//�Restaura o Ambiene.�
//���������������������
dbSelectArea(_cAlias)
dbSetOrder(_nOrdZLC)
dbGoto(_nRecZLC)

Return()


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �Legenda   � Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Mostra legenda com status dos registros.                   ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � AGLT025()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function Legenda()
BrwLegEnda("Status dos Registros","Desvio Rotas",{ ;
{"ENABLE"   ,"Aprovado" },;// A - Verde    - Aprovado
{"DISABLE"  ,"Reprovado"}})// N - Vermelho - Reprovado
Return(.T.)


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �Permissao � Autor �Microsiga              � Data � 00.00.00 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Mostra legenda com status dos registros.                   ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � AGLT025()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function Permissao(_cCod,_cOper)

Local cArea := GetArea()
Local _lRet:= .F.
Local _cFiltro := "% AND ZLU_CODUSU = '"+_cCod+"' %"

BeginSql alias 'TRB'
	SELECT * FROM %table:ZLU% ZLU
	WHERE ZLU.%notDel% 
	%exp:_cFiltro%
Endsql

DbSelectArea("TRB")

If TRB->(!Eof())
	If _cOper $ '1/2' //Inclusao ou Altera��o
		If TRB->ZLU_DESVRO == "S"
			_lRet:=.T.
		EndIf
	EndIf

	If _cOper == '3' // Aprova��o
		If TRB->ZLU_APDESV == "S"
			_lRet:=.T.
		EndIf
	EndIf
EndIf

TRB->(dbclosearea())

RestArea(cArea)
Return _lRet
