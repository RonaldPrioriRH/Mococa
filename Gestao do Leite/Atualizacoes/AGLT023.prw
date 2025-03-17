#INCLUDE "TOTVS.CH"
#INCLUDE "FwMvcDef.ch"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT023  � Autor � TOTVS                 � Data da Criacao  � 20/10/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Rotina desenvolvida para realizar cadastramento do usuarios e suas permissoes                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Fechamento do Frete.           						                                                        ���
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
User Function AGLT023()

Private oBrowse 	:= FwMBrowse():New()				//Variavel de Browse

oBrowse:SetAlias('ZLU')

//Descri��o da Parte Superior Esquerda do Browse
oBrowse:SetDescripton("Cadastro de Usu�rios do Gest�o do Leite")

//Habilita os Bot�es Ambiente e WalkThru
oBrowse:SetAmbiente(.F.)
oBrowse:SetWalkThru(.F.)

//Desabilita os Detalhes da parte inferior do Browse
oBrowse:DisableDetails()


//Ativa o Browse
oBrowse:Activate()

Return
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MenuDef   �Autor  �Fernando W S Furtado� Data �  05/27/12   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao para Menu do Browse                                  ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function MenuDef()

Local aRotina := {}

aAdd( aRotina, { 'Visualizar'		, 'VIEWDEF.AGLT023', 0, 2, 0, NIL } )
aAdd( aRotina, { 'Incluir' 			, 'VIEWDEF.AGLT023', 0, 3, 0, NIL } )
aAdd( aRotina, { 'Alterar' 			, 'VIEWDEF.AGLT023', 0, 4, 0, NIL } )
aAdd( aRotina, { 'Excluir' 			, 'VIEWDEF.AGLT023', 0, 5, 0, NIL } )
//aAdd( aRotina, { 'Copiar' 			, 'VIEWDEF.AGLT023', 0, 9, 0, NIL } )
//aAdd( aRotina, { 'Imprimir' 		, 'VIEWDEF.AGLT023', 0, 8, 0, NIL } )

Return aRotina

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �ModelDef  �Autor  �Fernando W S Furtado� Data �  05/27/12   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao de Modelo de Dados.                                  ���
���          �Onde � definido a estrutura de dados                        ���
���          �Regra de Negocio.                                           ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function ModelDef()

Local oStruZLU  :=  FWFormStruct(1,'ZLU') //Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
Local oModel

//Instancia do Objeto de Modelo de Dados
oModel	:=	MpFormModel():New('MODELAGLT023', /*Pre-Validacao*/,/*Pos-Validacao*/,/*Commit*/,/*Commit*/,/*Cancel*/)

//Adiciona um modelo de Formulario de Cadastro Similar � Enchoice ou Msmget
oModel:AddFields('ID_M_FLD_ZLU', /*cOwner*/, oStruZLU, { ||.T. }/*bPreValidacao*/, /*bPosValidacao*/, /*bCarga*/ )

//Adiciona um Modelo de Grid similar � MsNewGetDados, BrGetDb
//oModel:AddGrid('ID_M_GRD_ZEC', 'ID_M_FLD_ZEC', oStruZL1, /* bLinePre */, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )

// Faz relaciomaneto entre os compomentes do model
//oModel:SetRelation( 'ID_M_GRD_ZL1', { { 'ZL1_FILIAL', 'xFilial("ZL0")' }, { 'ZL1_CODZL0', 'ZL0_CODIGO' } }, ZL1->(IndexKey( )))

// Define chave primaria
oModel:SetPrimaryKey( { "ZLU_FILIAL", "ZLU_USER" } )


//Adiciona Descricao do Modelo de Dados
oModel:SetDescription( 'Usu�rios' )

//Adiciona Descricao dos Componentes do Modelo de Dados
oModel:GetModel( 'ID_M_FLD_ZLU' ):SetDescription( 'Usu�rios' )
//oModel:GetModel( 'ID_M_GRD_ZL1' ):SetDescription( 'Itens' )

Return(oModel)
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �ViewDef   �Autor  �Fernando W S Furtado� Data �  05/27/12   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao de Visualizacao.                                     ���
���          �Onde � definido a visualizacao da Regra de Negocio.         ���
�������������������������������������������������������������������������͹��
���Uso       � Aula de MVC                                                ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function ViewDef()

Local oStruZLU  :=  FWFormStruct(2,'ZLU') //Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
//Local oStruZL1	:=	FWFormStruct(2,'ZL1')

Local oModel	:=	FwLoadModel('AGLT023')	//Retorna o Objeto do Modelo de Dados
Local oView		:=	FwFormView():New()      //Instancia do Objeto de Visualiza��o

//Define o Modelo sobre qual a Visualizacao sera utilizada
oView:SetModel(oModel)


//Vincula o Objeto visual de Cadastro com o modelo
oView:AddField( 'ID_V_FLD_ZLU', oStruZLU, 'ID_M_FLD_ZLU') 

Return(oView)