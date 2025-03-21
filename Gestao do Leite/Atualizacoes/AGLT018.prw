#INCLUDE "PROTHEUS.CH"
#INCLUDE "rwmake.ch"
#INCLUDE "topconn.ch"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT018  � Autor � TOTVS                 � Data da Criacao  � 29/10/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Rotina desenvolvida para possibilitar o cadastramento de Grupos de Eventos                                   ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Cadastro de Grupo de Eventos    						                                                        ���
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
User Function AGLT018

//���������������������������������������������������������������������Ŀ
//� Declaracao de Variaveis                                             �
//�����������������������������������������������������������������������
Private aRotina   := MenuDef()
Private bManipula := {|| GLTDeleta()}
Private cCadastro := "Grupo de Eventos"
Private cAlias    := "ZL7"

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
{OemToAnsi("Visualizar"),"AxVisual" , 0 , 2,0,nil},;
{OemToAnsi("Incluir")   ,"AxInclui" , 0 , 3,0,nil},;
{OemToAnsi("Alterar")   ,"AxAltera" , 0 , 4,0,.F.},;
{OemToAnsi("Excluir")   ,'Eval(bManipula)', 0 , 5,0,.F.}}

Return (aRotina)

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

Local _cAlias  := "ZL7"
Local _nOrdZL0 := ZL7->(IndexOrd())
Local _nRecZL0 := ZL7->(Recno())
Local nOpcao   := AxVisual(_cAlias,_nRecZL0,5)
Local bdel := .t.


_cQuery := " SELECT COUNT(*) AS QUANT"
_cQuery += " FROM "+RetSqlName("ZL8")+" ZL8 "
_cQuery += " WHERE "
_cQuery += " D_E_L_E_T_ = ' '"
_cQuery += " AND ZL8_GRUPO = '"+ZL7->ZL7_COD+"'"

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(_cQuery))),'TRB',.F.,.T.)

if TRB->(!Eof()) .And. TRB->QUANT > 0
	bdel := .f.
	MsgBox("Registro nao pode ser excluido por haver relacionamentos com os Eventos!")
	TRB->(dbskip())
Endif
TRB->(dbclosearea())

if bdel
	dbSelectArea(_cAlias)
	dbSetOrder(_nOrdZL0)
	dbGoto(_nRecZL0)
	
	RecLock("ZL7",.F.)
	DbDelete()
	MsUnLock()
	Return()
endif

//�������������������Ŀ
//�Restaura o Ambiene.�
//���������������������
dbSelectArea(_cAlias)
dbSetOrder(_nOrdZL0)
dbGoto(_nRecZL0)

Return()