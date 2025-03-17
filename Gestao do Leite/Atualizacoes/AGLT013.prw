#INCLUDE "PROTHEUS.CH"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT013  � Autor � TOTVS                 � Data da Criacao  � 02/10/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Rotina desenvolvida para possibilitar o cadastramento dos Tipos de Faixas existentes.                        ���
���          � Existem tipos de faixas para analise de Proteina, Gordura, volume de leite entregue, fidelidade, etc.        ���
���          � Os Tipos de Faixa, serao vinculados as Faixas de Indicacao. Cada Faixa de Indicacao possui uma escala        ���
���          � diferente e a mesma sera utilizada para verificar os limites inferior e superior das faixas.                 ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Cadastro de Tipos de Faixa. 						                                                            ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum						   							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum						  							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite.                                                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						���
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
User Function AGLT013

//���������������������������������������������������������������������Ŀ
//� Declaracao de Variaveis                                             �
//�����������������������������������������������������������������������
Private aRotina   := MenuDef()
Private bManipula := {|| GLTDeleta()}
Private cCadastro := "Cadastro de Tipos de Faixas"
Private cAlias    := "ZL9"

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
��� Uso      � AGLT013()                                                  ���
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
���          � Verifica se nao existem Faixas de Analise, amarradas ao    ���
���          � Tipo de Analise.                                           ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � AGLT013()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function GLTDeleta

Local _cAlias  := "ZL9"
Local _nOrdZL9 := ZL9->(IndexOrd())
Local _nRecZL9 := ZL9->(Recno())
Local nOpcao   := AxVisual(_cAlias,_nRecZL9,5)

If nOpcao == 1
	DbSelectArea("ZLA")
	DbSetOrder(1)//ZLA_FILIAL+ZLA_CODIGO
	If DbSeek(xFILIAL("ZLA")+ZL9->ZL9_COD)
		xmaghelpfis("Mensagem","Este Tipo de Analise "+ZL9->ZL9_COD+" esta sendo utilizado na Faixa "+ZLA->ZLA_COD,"Solu��o: Voc� precisa excluir a Faixa "+ZLA->ZLA_COD+", antes de excluir o Tipo de Analise.")
	Else
		//�������������������Ŀ
		//�Restaura o Ambiene.�
		//���������������������
		dbSelectArea(_cAlias)
		dbSetOrder(_nOrdZL9)
		dbGoto(_nRecZL9)
		
		RecLock("ZL9",.F.)
		DbDelete()
		MsUnLock()
		Return()
	EndIf
EndIf

//�������������������Ŀ
//�Restaura o Ambiene.�
//���������������������
dbSelectArea(_cAlias)
dbSetOrder(_nOrdZL9)
dbGoto(_nRecZL9)

Return()