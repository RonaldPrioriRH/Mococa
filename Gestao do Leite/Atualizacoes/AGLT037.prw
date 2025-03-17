#Include 'Protheus.ch'
#Include "FwMvcDef.ch"

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT036  � Autor � TOTVS                 � Data da Criacao  � 06/04/2013                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Rotina desenvolvida para possibilitar incluir, alterar, visualizar e excluir as novas rotas do leite      ���
���          � de leite existente nas propriedades rurais.                                                                  ���
���          �                                                                                                              ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Gestao do Leite.                                                                                             ���
���          �                                                                                                              ���
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
User Function AGLT037()
Private oBrowse 	:= FwMBrowse():New() 

oBrowse:SetAlias('ZLW')
oBrowse:SetDescripton("Cadastro de Rotas") 

oBrowse:SetAmbiente(.T.)
oBrowse:SetWalkThru(.T.)
//oBrowse:DisableDetails()
oBrowse:Activate()


Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �AFAT006   �Autor  �TOTVS TM    � Data �  21/02/13   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao para Menu do Browse                                  ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Valoriza                                                   ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function MenuDef()
Local aMenu :=	{}
	
	ADD OPTION aMenu TITLE 'Pesquisar'  ACTION 'PesqBrw'       	OPERATION 1 ACCESS 0
	ADD OPTION aMenu TITLE 'Visualizar' ACTION 'VIEWDEF.AGLT037'	OPERATION 2 ACCESS 0
	ADD OPTION aMenu TITLE 'Incluir'    ACTION 'VIEWDEF.AGLT037' 	OPERATION 3 ACCESS 0
	ADD OPTION aMenu TITLE 'Alterar'    ACTION 'VIEWDEF.AGLT037' 	OPERATION 4 ACCESS 0
	ADD OPTION aMenu TITLE 'Excluir'    ACTION 'VIEWDEF.AGLT037' 	OPERATION 5 ACCESS 0
	ADD OPTION aMenu TITLE 'Imprimir'   ACTION 'VIEWDEF.AGLT037'	OPERATION 8 ACCESS 0
	ADD OPTION aMenu TITLE 'Copiar'     ACTION 'VIEWDEF.AGLT037'	OPERATION 9 ACCESS 0
	
	
Return(aMenu)



/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �AFAT006   �Autor  �TOTVS TM    � Data �  21/02/13   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao de Modelo de Dados.                                  ���
���          �Onde � definido a estrutura de dados                        ���
���          �Regra de Negocio.                                           ���
�������������������������������������������������������������������������͹��
���Uso       � Valoriza                                                   ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function ModelDef()


	Local oStruct1	:=	FWFormStruct(1,'ZLW', /*bAvalCampo*/, /*lViewUsado*/ )
	Local oModel
	
	
	oModel	:=	MpFormModel():New('ID_MODEL',/*Pre-Validacao*/,{|oModel| TUDOOK(oModel)}/*Pos-Validacao*/,/*Commit*/,/*Commit*/,/*Cancel*/)
	
	
	oModel:AddFields('ID_MODEL_FLD_ZLW', /*cOwner*/, oStruct1, /*bPreValidacao*/, , /*bCarga*/ )
		
	oModel:SetPrimaryKey({'ZLW_COD'})
	
	oModel:SetDescription('Cadastro de Rotas')
	oModel:GetModel( 'ID_MODEL_FLD_ZLW' ):SetDescription( 'Cadastro de Rotas' )
	
Return(oModel)


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �AFAT006   �Autor  �TOTVS TM    � Data �  21/02/13   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao de Visualizacao.                                     ���
���          �Onde � definido a visualizacao da Regra de Negocio.         ���
�������������������������������������������������������������������������͹��
���Uso       � Valoriza                                                   ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function ViewDef()
	Local oStruct1	:=	FWFormStruct(2,'ZLW')
	Local oModel	:=	FwLoadModel('AGLT037') 
	Local oView		:=	FwFormView():New()
	
	oView:SetModel(oModel)	
	oView:AddField( 'ID_VIEW_FLD_ZLW', oStruct1, 'ID_MODEL_FLD_ZLW')
		
	oView:CreateHorizontalBox( 'ID_HBOX_100', 100 ) 
	oView:SetOwnerView( 'ID_VIEW_FLD_ZLW', 'ID_HBOX_100' )

Return(oView)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �TUDOOK   �Autor  �TOTVS TM    � Data �  21/02/13   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao para valida��o dos dados digitados.                  ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � 			                                                  ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function TUDOOK(oModel)

Local nOperation	:=	oModel:GetOperation()
Local oStruct	:=	oModel:GetModel('ID_MODEL_FLD_ZLW')
Local lRet			:=	.T.
Local _cRota	:= ""
Local _cVer	:= ""
Local _cDesc := ""
Local _cUpd  := ""	


_cRota := oStruct:GetValue("ZLW_COD")
_cVer := oStruct:GetValue("ZLW_VERSAO")	
_cDesc := oStruct:GetValue("ZLW_DESCRI")

//Atualiza a descri��o no cadastro de amarra��o Rotas X Produtor
If nOperation	==	4
	_cUpd := " UPDATE "
	_cUpd += RetSqlName("ZLY")
	_cUpd += " SET ZLY_DESROT = '"+Alltrim(_cDesc)+"' "
	_cUpd += " WHERE "		
	_cUpd += " ZLY_FILIAL = '"+xFilial("ZLY")+"' "
	_cUpd += " AND ZLY_ROTA = '"+_cRota+"' "
	_cUpd += " AND ZLY_VERSAO = '"+_cVer+"' "
	_cUpd += " AND D_E_L_E_T_ = ' ' "		
	_cUpd := CHANGEQUERY(_cUpd)
	TCSqlExec(_cUpd)
	
	If TCGetDB() == 'ORACLE'
	_cUpd := "  COMMIT "
	TCSqlExec(_cUpd)
	
	
	EndIf
EndIf
/*
//Cria registro no grupo de pre�os igual a rota, para ser atualizado no cadastro do fornecedor A2_L_LI_RO
If nOperation	==	3 .or. nOperation	==	4
	DbSelectArea("ZL3")
	DbSetOrder(1)
	If !ZL3->(DbSeek(xFilial("ZL3")+_cRota))
		RecLock("ZL3",.T.)
		ZL3->ZL3_FILIAL := xFilial("ZL3")
		ZL3->ZL3_COD := _cRota
		ZL3->ZL3_DESCRI := _cDesc
		ZL3->ZL3_SETOR := "000001"
    	ZL3->(MsUnLock())
	Else
		RecLock("ZL3",.F.)
		ZL3->ZL3_DESCRI := _cDesc
    	ZL3->(MsUnLock())
	EndIf		
EndIf
*/
Return .t.

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �GeraVers	�Autor  �TOTVS TM            � Data �  06/06/13   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao para gerar funcao atraves do codigo	              ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Cadastro                                                   ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function GeraVers()

	Local _aArea    := GetArea()
	Local _cQuery   := ""
	Local _cVersao  := ""
	
	_cQuery := " SELECT MAX(ZLW_VERSAO) AS VERSAO"
	_cQuery += " FROM " + RetSqlName("ZLW")
	_cQuery += " WHERE ZLW_COD = '" + M->ZLW_COD + "' "

	_cQuery    := ChangeQuery( _cQuery )
	dbUseArea( .T., "TOPCONN", TcGenQry(,,_cQuery), "QRY" , .F., .T. )
	
	dbSelectArea("QRY")
	dbGotop()
	
	_cVersao := QRY->VERSAO 
	
	dbSelectArea("QRY")
	dbCloseArea("QRY")
	
	If !Empty(_cVersao)
		_cVersao := StrZero(Val(_cVersao)+1,3)
	Else 
		_cVersao := "001"	
	EndIf

	//�����������������������������������������������������������������������������������Ĉ
	//� Tratamento para evitar que dois usuarios cadastrem o mesmo codigo ao mesmo tempo. �
	//�����������������������������������������������������������������������������������Ĉ
	While !MayIUseCode("ZLW_VERSAO"+xFilial("ZLW")+_cVersao)  //verifica se esta na memoria, sendo usado
		_cVersao := StrZero(Val(_cVersao)+1,3)				   // busca o proximo numero disponivel
	EndDo
	
	RestArea(_aArea)
	
Return(_cVersao)




