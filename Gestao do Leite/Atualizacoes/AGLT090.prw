#INCLUDE "PROTHEUS.CH"  

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT090  � Autor � TOTVS                 � Data da Criacao  � 10/02/2011                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Rotina desenvolvida para possibilitar o cadastramento dos tanques.                				            ���
���          �                                                                                   				            ���
���          � Os tanques ser�o utilizados para vincular os produtores/cooperados, a seus respectivos tanques de coleta.    ���
���          �                                                                                   				            ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � MIX do Leite.                   						                                                        ���
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
User Function AGLT090

//���������������������������������������������������������������������Ŀ
//� Declaracao de Variaveis                                             �
//�����������������������������������������������������������������������
Private aRotina   := MenuDef()
Private cCadastro := "Cadastro Tanques"
Private cAlias    := "ZLT"

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
��� Uso      � AGLT014()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function MenuDef()

Private aRotina	:=  {{OemToAnsi("Pesquisar"),"AxPesqui", 0,1,0,.F.},;
{OemToAnsi("Visualizar"),"AxVisual" , 0 , 2,0,nil},;
{OemToAnsi("Incluir")   ,"AxInclui" , 0 , 3,0,nil},;
{OemToAnsi("Alterar")   ,"AxAltera" , 0 , 4,0,.F.},;
{OemToAnsi("Excluir")   ,"AxDeleta" , 0 , 5,0,.F.},;
{OemToAnsi("Produtores"),"U_VINCPRD()" , 0 , 2,0,nil}}

Return (aRotina)


User function VINCPRD()

//*******************************************************//
//Monta base e executa replica��o para cada empresa selecionada.....
//*******************************************************//



Local aCampos1	:= {{"FLAG"   ,"C",2,0 },;
{"CODIGO"   ,"C",6,0 },;
{"LOJA"   ,"C",2,0 },;
{"NOME"   ,"C",40,0 },;
{"FAZENDA"   ,"C",40,0}}
Local cArqTrab1  := CriaTrab(aCampos1)
dbUseArea( .T.,, cArqTrab1, "AD2", if(.F. .OR. .F., !.F., NIL), .F. )

Private lInverte := .F.
Private cMarca   := Getmark()           

_lvinc := .f.     
                                                                                   
If msgyesno("Mostra somente vinculados?")
	_lvinc := .t.     
Endif

cQuer4 := ""
cQuer4 := "SELECT A2_COD,A2_LOJA,A2_NOME,A2_L_FAZEN,A2_L_TANQ FROM " + RetSqlName("SA2") + " SA2 "
cQuer4 += " WHERE A2_FILIAL = '" + xfilial("SA2") + "'"
cQuer4 += " AND A2_L_LI_RO = '" + ZLT->ZLT_LINROT +"'"
If _lvinc
	cQuer4 += " AND (A2_L_TANQ = '"+ZLT->ZLT_COD+"')"
Else
	cQuer4 += " AND (A2_L_TANQ = ' ' OR A2_L_TANQ = '"+ZLT->ZLT_COD+"')"
Endif
cQuer4 += " AND A2_MSBLQL <> '1' "
cQuer4 += " AND (SA2.D_E_L_E_T_ = ' ')"
cQuer4 += " AND A2_L_TPFOR IN ('P','T') "
//cQuer4 += " AND A2_L_TPFOR IN ('C','G') "
cQuer4 += " ORDER BY A2_COD,A2_LOJA"
If Select("TRAB5") <> 0
	TRAB5->(dbCloseArea("TRAB5"))
Endif
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuer4), "TRAB5", .T., .F. )
TRAB5->(dbGoTop())

dbSelectArea("TRAB5")
TRAB5->(dbGoTop())
While TRAB5->(!Eof())
	dbSelectArea( "AD2" )
	RecLock("AD2",.T.)
	If TRAB5->A2_L_TANQ == ZLT->ZLT_COD
		AD2->FLAG := cMarca
	Endif
	AD2->CODIGO := TRAB5->A2_COD
	AD2->LOJA := TRAB5->A2_LOJA
	AD2->NOME := TRAB5->A2_NOME
	AD2->FAZENDA := TRAB5->A2_L_FAZEN
	MsUnlock()
	dbSelectArea("TRAB5")
	TRAB5->(dbSkip())
Enddo

TRAB5->(Dbclosearea())

//monta tela de sele��o de empresa para replicar as contas
DEFINE MSDIALOG oDlg TITLE 'TANQUE: '+ZLT->ZLT_COD FROM 00,00 TO 360,600 PIXEL

aCpoBro := {}
AADD(aCpoBro, {"FLAG" ,""," "    , })
AADD(aCpoBro, {"CODIGO" ,"","Codigo"    , })
AADD(aCpoBro, {"LOJA" ,"","Loja"    , })
AADD(aCpoBro, {"NOME" ,"","Nome"    , })
AADD(aCpoBro, {"FAZENDA" ,"","Fazenda"    , })
//AADD(aCampos2,{"CLASSE",,"Classe"})


Dbselectarea('AD2')
AD2->(Dbgotop())

oMark := MsSelect():New("AD2","FLAG","",aCpoBro,@lInverte,@cMarca,{15, 05, 180, 300})
//oMark:bMark := {| | PedDisplay()}

ACTIVATE MSDIALOG oDlg ON INIT EnchoiceBar(oDlg,{||nopca:=1,oDlg:End(),atuavinc()},{||nOpca:=0,oDlg:End()}) CENTERED

Dbselectarea("AD2")
dbCloseArea("AD2")
fErase( cArqTrab1 + ".DBF" )
fErase( cArqTrab1 + OrdBagExt() )

return
        
static function atuavinc()
Dbselectarea('AD2')
AD2->(Dbgotop())
While AD2->(!Eof())
	dbSelectArea( "SA2" )
	If SA2->(dbseek(xfilial('SA2')+AD2->(CODIGO+LOJA)))
	RecLock("SA2",.F.)
	If empty(AD2->FLAG)     
		SA2->A2_L_TANQ := space(6) 
	Else
		SA2->A2_L_TANQ := ZLT->ZLT_COD
	Endif
	MsUnlock()         
	Endif
	dbSelectArea("AD2")
	AD2->(dbSkip())
Enddo


return