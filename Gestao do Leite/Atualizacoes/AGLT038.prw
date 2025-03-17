#INCLUDE "PROTHEUS.CH"
#INCLUDE "FWMVCDEF.CH"
#INCLUDE "RWMAKE.CH"
#INCLUDE "TOPCONN.CH"

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT038  � Autor � TOTVS                 � Data da Criacao  � 06/04/2013                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Rotina desenvolvida para possibilitar incluir, alterar, visualizar e excluir as novas rotas do leite         ���
���          � de leite existente nas propriedades rurais.  Amarrcao de rotas com com produtor                              ���
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

User Function AGLT038()

Private cCadastro 	:= "Recep��o de Leite"
Private bLegenda	:= {|| legenda()  }
Private aCores      := GetCores()
Private oBrowse 	:= FwMBrowse():New()

oBrowse:SetAlias('ZLY')

oBrowse:AddLegend( "ZLY_MSBLQL == '2'", "GREEN"			, "Ativo"	)
oBrowse:AddLegend( "ZLY_MSBLQL == '1'", "RED"			, "Desativado"	)

oBrowse:SetDescripton("Rodizio Rotas")

//oBrowse:SetAmbiente(.T.)
//oBrowse:SetWalkThru(.T.)
//oBrowse:DisableDetails()


oBrowse:Activate()


Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �AGLT038   �Autor  �Totvs TM            � Data �  21/02/13   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao para Menu do Browse                                  ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � GLT                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function MenuDef()
Local aMenu :=	{}

	ADD OPTION aMenu TITLE 'Pesquisar'  ACTION 'PesqBrw'       		OPERATION 1 ACCESS 0
	ADD OPTION aMenu TITLE 'Visualizar' ACTION 'VIEWDEF.AGLT038'	OPERATION 2 ACCESS 0
	ADD OPTION aMenu TITLE 'Incluir'    ACTION 'VIEWDEF.AGLT038' 	OPERATION 3 ACCESS 0
	ADD OPTION aMenu TITLE 'Alterar'    ACTION 'VIEWDEF.AGLT038' 	OPERATION 4 ACCESS 0
	ADD OPTION aMenu TITLE 'Excluir'    ACTION 'VIEWDEF.AGLT038' 	OPERATION 5 ACCESS 0
	ADD OPTION aMenu TITLE 'Imprimir'   ACTION 'VIEWDEF.AGLT038'	OPERATION 8 ACCESS 0
//	ADD OPTION aMenu TITLE 'Integracao Via Lactea'   ACTION 'U_AGLT042'			OPERATION 3 ACCESS 0
	ADD OPTION aMenu TITLE 'Copiar'     ACTION 'VIEWDEF.AGLT038'	OPERATION 9 ACCESS 0
	ADD OPTION aMenu Title 'Legenda'    Action 'Eval(bLegenda)'		OPERATION 2 ACCESS 0


Return(aMenu)



/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �AGLT038   �Autor  �Totvs TM            � Data �  21/02/13   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao de Modelo de Dados.                                  ���
���          �Onde � definido a estrutura de dados                        ���
���          �Regra de Negocio.                                           ���
�������������������������������������������������������������������������͹��
���Uso       � GLT                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function ModelDef()


	Local oStruct1	:=	FWFormStruct(1,'ZLY', /*bAvalCampo*/, /*lViewUsado*/ )
	Local oStruct2	:=	FWFormStruct(1,'ZLZ', /*bAvalCampo*/, /*lViewUsado*/ )
	Local oModel
	Local aTrigger := {}
	
	oStruct2:SetProperty("ZLZ_LJPROD" , MODEL_FIELD_VALID , {|| U_AG038VLDA()} )

	oModel	:=	MpFormModel():New('ID_MODEL',/*Pre-Validacao*/ , { |oModel| VALIDCOMIT(oModel)} ,  /*{ |oModel| AGLTCOMIT( oModel ) }*/ , /*bCancel*/)
//	oModel 	:=  MPFormModel():New( 'ATFA430', /*bPreValidacao*/, { |oModel| AF430POSVL(oModel)} ,  { |oModel| AF430GRVMD( oModel )} , /*bCancel*/ )

	aAdd(aTrigger, FwStruTrigger('ZLY_ROTA'   ,'ZLY_DATFIM'   ,'ZLW->ZLW_DATFIM',.T.,'ZLW',1,'xFilial("ZLW")+M->ZLY_ROTA'))
	aAdd(aTrigger, FwStruTrigger('ZLY_ROTA'   ,'ZLY_DIAPI'   ,'ZLW->ZLW_DIAPI',.T.,'ZLW',1,'xFilial("ZLW")+M->ZLY_ROTA'))
	aAdd(aTrigger, FwStruTrigger('ZLY_ROTA'   ,'ZLY_DATINI'   ,'DATE()',.F.,'ZLW',1,'xFilial("ZLW")+M->ZLY_ROTA'))	
	aAdd(aTrigger, FwStruTrigger('ZLY_ROTA'   ,'ZLY_DESROT'   ,'ZLW->ZLW_DESCRI',.T.,'ZLW',1,'xFilial("ZLW")+M->ZLY_ROTA'))
	aAdd(aTrigger, FwStruTrigger('ZLY_ROTA'   ,'ZLY_NOMEFR'   ,'ZLW->ZLW_NOMEFR',.T.,'ZLW',1,'xFilial("ZLW")+M->ZLY_ROTA'))
	//aAdd(aTrigger, FwStruTrigger('ZLY_ROTA'   ,'ZLY_VERSAO'   ,'U_GCFG004(2)',.F.))
	aAdd(aTrigger, FwStruTrigger('ZLY_ROTA'   ,'ZLY_VERSAO'   ,'"001"',.F.))


	For _i := 1 to Len(aTrigger)
		oStruct1:AddTrigger(aTrigger[_i][1] ,aTrigger[_i][2] ,aTrigger[_i][3] ,aTrigger[_i][4] )
	Next _i


	oModel:AddFields('ID_MODEL_FLD_ZLY', /*cOwner*/, oStruct1, /*bPreValidacao*/,/* {|oModel| ATUASB2(oModel)}*/, /*bCarga*/ )

	oModel:AddGrid( 'ID_MODEL_GRD_ZLZ', 'ID_MODEL_FLD_ZLY', oStruct2, /*bLinePre*/, {|oModel| VALIDFOR(oModel)}, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )

	oModel:SetRelation( 'ID_MODEL_GRD_ZLZ',{{'ZLZ_FILIAL','xFilial("ZLZ")' },{ 'ZLZ_ROTA', 'ZLY_ROTA' },{'ZLZ_VERSAO', 'ZLY_VERSAO' }}, ZLZ->(IndexKey(1)) )

	oModel:GetModel( 'ID_MODEL_GRD_ZLZ' ):SetUniqueLine( {'ZLZ_CODPRO','ZLZ_LJPROD'} )
	oModel:SetPrimaryKey({'ZLY_ROTA'})

	//If M->ZLY_MSBLQL = 1
	//	oModel:GetModel( 'ID_MODEL_GRD_ZLZ' ):SetNoDeleteLine( .T. )
	//EndIf

	oModel:SetDescription('Linhas/Rotas Produtores')
	oModel:GetModel( 'ID_MODEL_FLD_ZLY' ):SetDescription( 'Linhas/Rotas' )
	oModel:GetModel( 'ID_MODEL_GRD_ZLZ' ):SetDescription( 'Produtores' )

Return(oModel)


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �AGLT038   �Autor  �Totvs TM            � Data �  21/02/13   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao de Visualizacao.                                     ���
���          �Onde � definido a visualizacao da Regra de Negocio.         ���
�������������������������������������������������������������������������͹��
���Uso       � GLT                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function ViewDef()
	Local oStruct1	:=	FWFormStruct(2,'ZLY')
	Local oStruct2	:=	FWFormStruct(2,'ZLZ')
	Local oModel	:=	FwLoadModel('AGLT038')
	Local oView		:=	FwFormView():New()

	oView:SetModel(oModel)
	oView:AddField( 'ID_VIEW_FLD_ZLY', oStruct1, 'ID_MODEL_FLD_ZLY')
	oView:AddGrid(  'ID_VIEW_GRD_ZLZ', oStruct2, 'ID_MODEL_GRD_ZLZ')

	oView:CreateHorizontalBox( 'ID_HBOX_40', 40 )
	oView:SetOwnerView( 'ID_VIEW_FLD_ZLY', 'ID_HBOX_40' )
	oView:EnableTitleView('ID_VIEW_FLD_ZLY'	,'Linhas/Rotas')


	oView:CreateHorizontalBox( 'ID_HBOX_60',60 )
	oView:SetOwnerView( 'ID_VIEW_GRD_ZLZ', 'ID_HBOX_60' )
	oView:EnableTitleView('ID_VIEW_GRD_ZLZ'	,'Produtores')


	oView:AddIncrementField( 'ID_VIEW_GRD_ZLZ', 'ZLZ_ITEM' )

Return(oView)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �VALIDEXC  �Autor  �Totvs TM            � Data �  21/02/13   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao validacao de exclus�o para saber se h� movimenta��o  ���
���          �de entrega                                                  ���
�������������������������������������������������������������������������͹��
���Uso       � GLT                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function VALIDCOMIT(oModel)
	Local nOperation	:=	oModel:GetOperation()
	Local oModelGrid	:=	oModel:GetModel('ID_MODEL_GRD_ZLZ')
	Local oModelCab		:=	oModel:GetModel('ID_MODEL_FLD_ZLY')
	Local lRet			:=	.T.
	Local cRot			:= FwFldGet('ZLY_ROTA')
    Local _cVer			:= FwFldGet('ZLY_VERSAO')
    Local lLoop			:=.T.
    Local xArea			:=GetArea()
	If nOperation	==	5

		cQuery:=" SELECT COUNT(ZLD_LINROT) AS ROTA FROM "+RetSqlName("ZLD")+ " ZLD "
		cQuery+="  WHERE ZLD_LINROT = '"+cRot+"' AND ZLD_FILIAL = '"+xFilial("ZLD")+"  ' AND D_E_L_E_T_ = ' ' "

		TcQuery ChangeQuery(cQuery) New Alias "TMP"

		IF TMP->ROTA <> 0
			Alert("J� existe movimenta��o para esta roda a mesma n�o poder� ser exclu�da")
			lRet:=.F.
		EndIF
		TMP->(dbCloseArea())
	EndIF

	If nOperation == 3
		xArea:=GetArea()
		dbSelectArea("ZLY")
		ZLY->(dbSetOrder(3))
		If dbSeek(xFilial("ZLY")+cRot)
			While lLoop
				 cRota:=ZLY->ZLY_ROTA
			     RecLock("ZLY",.F.)
			     	ZLY->ZLY_MSBLQL:='1'
			     	IF  Val(_cVer) - Val(ZLY->ZLY_VERSAO) = 1
			     		ZLY->ZLY_DATFIM:=Date()
			     	EndIF
			     MsUnlock()

				ZLY->(dbSkip())
				IF Alltrim(cRot) <> Alltrim(ZLY->ZLY_ROTA)
					lLoop:=.F.
				EndIF
			EndDO

		EndIf

	EndIF
	RestArea(xArea)
Return lRet
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �VALIDFOR  �Autor  �Totvs TM            � Data �  21/02/13   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao validacao se o produtor est� ativo em outra rota     ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � GLT                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function VALIDFOR(oModel)
	Local nOperation	:=	oModel:GetOperation()
	Local oModelGrid	:=	oModel:GetModel('ID_MODEL_GRD_ZLZ')
	Local oModelCab		:=	oModel:GetModel('ID_MODEL_FLD_ZLY')
	Local lRet			:=	.T.
	Local cProd			:= FwFldGet('ZLZ_CODPRO')
	Local cLoj			:= FwFldGet('ZLZ_LJPROD')
	Local cRot			:= FwFldGet('ZLY_ROTA')
	Local cVerl			:= FwFldGet('ZLY_VERSAO')
	Local cQuery	:=	""



	If nOperation	==	3 .OR. nOperation == 4
       IF M->ZLY_MSBLQL ='1'
       		msgAlert("Cadastro Bloqueado","Aten��o")
       		lRet:=.F.
       EndIF
        
		cQuery:=" SELECT COUNT(ZLZ_CODPRO) AS ROTA FROM "+RetSqlName("ZLZ")+" ZLZ INNER JOIN "+RetSqlName("ZLY")+" ZLY ON ZLY_ROTA = ZLZ_ROTA AND ZLY_FILIAL = ZLZ_FILIAL AND ZLZ_VERSAO = ZLY_VERSAO "
		cQuery+=" WHERE ZLZ_CODPRO = '"+cProd+"' AND ZLZ_LJPROD = '"+cLoj+"'AND ZLZ_ROTA <> '"+cRot+"' AND ZLZ_VERSAO <> '"+cVerl+"' AND ZLZ.D_E_L_E_T_ = ' ' "
		cQuery+=" AND ZLZ_FILIAL = '"+xFilial("ZLZ")+" '"

		TcQuery ChangeQuery(cQuery) New Alias "TMP"

		IF TMP->ROTA <> 0
			Alert("Produtor j� cadastrado em outra rota ativa!")
			lRet:=.F.
		EndIF
		TMP->(dbCloseArea())
		
	EndIF
Return lRet

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �CriaGat   �Autor  �                           �  05/27/12   ���
�������������������������������������������������������������������������͹��
���Desc.     �Cria��o de gatilhos.                                        ���
�������������������������������������������������������������������������͹��
���Uso       � Aula de MVC                                                ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function CriaGat(oStruZM0, oStruZM1, oStruZM2)

	Local _aGatilho := {}
	Local _iGat

	//Gatilhos na tabela ZM0
	aAdd(_aGatilho, FwStruTrigger('ZM0_MIX'   , 'ZM0_DATINI', "ZLE->ZLE_DTINI", .T., 'ZLE', 1, 'xFilial("ZLE") + M->ZM0_MIX + "1"' ))
	aAdd(_aGatilho, FwStruTrigger('ZM0_MIX'   , 'ZM0_DATFIM', "ZLE->ZLE_DTFIM", .T., 'ZLE', 1, 'xFilial("ZLE") + M->ZM0_MIX + "1"' ))
	aAdd(_aGatilho, FwStruTrigger('ZM0_CODSA2', 'ZM0_NOME'  , 'SA2->A2_NOME', .T., 'SA2', 1, 'xFilial("SA2") + M->ZM0_CODSA2 + M->ZM0_LOJSA2' ))
	aAdd(_aGatilho, FwStruTrigger('ZM0_LOJSA2', 'ZM0_NOME'  , "SA2->A2_NOME", .T., 'SA2', 1, 'xFilial("SA2") + M->ZM0_CODSA2 + M->ZM0_LOJSA2' ))
	aAdd(_aGatilho, FwStruTrigger('ZM0_TOTTRP', 'ZM0_QUEBRA', "M->ZM0_TOTPRD - M->ZM0_TOTTRP", .F.,"ZM0",,"","","001" ))
	aAdd(_aGatilho, FwStruTrigger('ZM0_TOTPRD', 'ZM0_QUEBRA', "M->ZM0_TOTPRD - M->ZM0_TOTTRP", .F.,"ZM0",,"","","001" ))
	aAdd(_aGatilho, FwStruTrigger('ZM0_TOTPRD', 'ZM0_QTDTOL', "Int(M->ZM0_TOTTRP * (M->ZM0_PERCQB / 100  ))", .F.,"ZM0",,"","","002" ))
	aAdd(_aGatilho, FwStruTrigger('ZM0_TOTPRD', 'ZM0_QTDDES', "If(M->ZM0_QUEBRA > 0,M->ZM0_QUEBRA - M->ZM0_QTDTOL, 0)", .F.,"ZM0",,"","","003" ))
	aAdd(_aGatilho, FwStruTrigger('ZM0_TOTPRD', 'ZM0_DSCQBR', "IIF(M->ZM0_QTDDES > M->ZM0_QTDTOL , 'S', 'N')", .F.,"ZM0",,"","","004" ))

	For _iGat := 1 to Len(_aGatilho)

		oStruZM0:AddTrigger( _aGatilho[_iGat][1], _aGatilho[_iGat][2], _aGatilho[_iGat][3], _aGatilho[_iGat][4] )

	Next _iGat

	// Gatilhos nos campos da tabela ZM1
	aAdd(_aGatilho	,FwStruTrigger('ZM1_OCORRE'   , 'ZM1_DSCOCO'   , "ZLQ->ZLQ_DSCRED" , .T., 'ZLQ', 1, 'xFilial("ZLQ") + M->ZM1_OCORRE'))
	aAdd(_aGatilho	,FwStruTrigger('ZM1_OCORRE'   , 'ZM1_DEBCRE'   , "ZLQ->ZLQ_TIPO"   , .T., 'ZLQ', 1, 'xFilial("ZLQ") + M->ZM1_OCORRE'))
	aAdd(_aGatilho	,FwStruTrigger('ZM1_OCORRE'   , 'ZM1_ALTCTE'   , "ZLQ->ZLQ_DEDCTE" , .T., 'ZLQ', 1, 'xFilial("ZLQ") + M->ZM1_OCORRE' ))
	aAdd(_aGatilho	,FwStruTrigger('ZM1_QTDADE'   , 'ZM1_VLRTOT'   , "M->ZM1_VALOR * M->ZM1_QTDADE" , .F.))
	//aAdd(_aGatilho	,FwStruTrigger('ZM1_QTDADE'   , 'ZM1_QTDADE'   , "U_AGL046A()" , .F., /*cAlias*/, /*nOrdem*/, /*cChave*/, "M->ZM1_OCORRE == '0003'"  ))
	aAdd(_aGatilho	,FwStruTrigger('ZM1_VALOR'    , 'ZM1_VLRTOT'   , "M->ZM1_VALOR * M->ZM1_QTDADE" , .F. ))
	//aAdd(_aGatilho	,FwStruTrigger('ZM1_VALOR'    , 'ZM1_QTDADE'   , "-(M->ZM1_QTDADE)" , .F., /*cAlias*/, /*nOrdem*/, /*cChave*/, "M->ZM1_DEBCRE == 'D'"  ))

	For _iGat := 1 to Len(_aGatilho)

		oStruZM1:AddTrigger( _aGatilho[_iGat][1], _aGatilho[_iGat][2], _aGatilho[_iGat][3], _aGatilho[_iGat][4] )

	Next _iGat

	//Gatilhos nos campos da tabela ZM2
	aAdd(_aGatilho	,FwStruTrigger('ZM2_EVENTO'   , 'ZM2_DESCRI'   , "ZL8->ZL8_DESCRI" , .T., 'ZL8', 1, 'xFilial("ZL8") + M->ZM2_EVENTO' ))

	For _iGat := 1 to Len(_aGatilho)

		oStruZM2:AddTrigger( _aGatilho[_iGat][1], _aGatilho[_iGat][2], _aGatilho[_iGat][3], _aGatilho[_iGat][4] )

	Next _iGat


Return


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �EXISTROTA �Autor  �Totvs TM            � Data �  21/02/13   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao validacao se j� existe amarra��o para esta rota      ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � GLT                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function EXISTROTA()

	Local oModel	:=	FwLoadModel('AGLT038')
	Local lRet:=.T.
	Local xArea:=GetArea("ZLY")
	Local cQuery:=""
	Local nOperation	:=	oModel:GetOperation()
	Local oModelGrid	:=	oModel:GetModel('ID_MODEL_GRD_ZLZ')
	Local oModelCab		:=	oModel:GetModel('ID_MODEL_FLD_ZLY')
	Local cRot			:= FwFldGet('ZLY_ROTA')
	Local cVerl			:= FwFldGet('ZLY_VERSAO')

	cQuery+=" SELECT COUNT(ZLY_ROTA) AS ROTA FROM "+RetSqlName("ZLY")+" WHERE ZLY_MSBLQL <> 1 AND D_E_L_E_T_ ='' "
	cQuery+=" AND ZLY_ROTA = '"+cRot+"' "
	TcQuery ChangeQuery(cQuery) New Alias "TMP"
	IF TMP->ROTA <> 0
		Alert("J� relacionamento ativo para esta Rota!")
		lRet:=.F.
	EndIF
	TMP->(dbCloseArea())

    RestArea(xArea)
Return lRet


Static Function  AGLTCOMIT(oModel)
	Local lRet:=.T.

	//Realiza a grava��o do Modelo
	//FWFormCommit( oModel )

Return lRet

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �Legenda   �Autor  �TOTVS TM            � Data �  06/08/12   ���
�������������������������������������������������������������������������͹��
���Desc.     �                                                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � FUNDO INTEGRATIVO                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/


Static Function Legenda(aCores)

Local aLegenda := {}

aAdd(aLegenda,{"BR_VERDE"   ,"Ativo"}) //Sem Status
aAdd(aLegenda,{"BR_VERMELHO"   ,"Desativado"}) //Sem Status
BrwLegenda(cCadastro,"Legenda",aLegenda) //"Legenda"

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �GetCores  � Autor � Jeovane               � Data da Criacao  � 11/09/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Funcao usada para criar array aCores, usado na legenda                                                       ���
���          �                  												                               				���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Implantacao das rotinas referente a Gestao do Leite.                						                    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum						   							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � array com cores da legenda                                                            						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite.                                                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �          �                               				   �                                  �   	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/
Static Function GetCores()
Local aCores:= {;
{ "ZLY_MSBLQL == '2'", 'BR_VERDE'			},;
{ "ZLY_MSBLQL == '1'", 'BR_VERMELHO'		}}
Return aCores


/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �PrencheDad� Autor � Jeovane               � Data da Criacao  � 11/09/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Funcao usada para preencher grid com os dados da versao anterior                                             ���
���          �                  												                               				���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Implantacao das rotinas referente a Gestao do Leite.                						                    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum						   							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � array com cores da legenda                                                            						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite.                                                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �          �                               				   �                                  �   	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/

User Function PrenDad(cRota, cVers)
Local oModel		:=	FwModelActive()//FwLoadModel('AGLT038')
Local nOperation	:=	oModel:GetOperation()
Local oModelGrid	:=	oModel:GetModel('ID_MODEL_GRD_ZLZ')
Local oModelCab		:=	oModel:GetModel('ID_MODEL_FLD_ZLY')
Local nLinha:=0
Local cQuery:=''

Default cRota		:= FwFldGet('ZLY_ROTA')

oModel:Activate()


cQuery:="Select MAX(ZLY_VERSAO) AS VERSAO FROM "+RetSqlName("ZLY")+" WHERE ZLY_ROTA = "+cRota+" AND D_E_L_E_T_ = ' '"
TcQuery ChangeQuery(cQuery) New Alias "TEMP"

cVers:=TEMP->VERSAO
TEMP->(dbCloseArea("TEMP"))

IF Alltrim(cRota) <> '' .AND. !(Empty(cVers))

	cQuery:=" SELECT ZLZ_ITEM, ZLZ_CODPRO, ZLZ_LJPROD, ZLZ_NOMEPR, ZLZ_ROTA, ZLZ_VERSAO, ZLZ_DIAPI,ZLZ_HRPRSA, ZLZ_HRPRCH, ZLZ_VLMPR, ZLZ_MSBLQL "
	cQuery+=" FROM "+RetSqlName("ZLZ")
	cQuery+=" WHERE ZLZ_ROTA = '"+cRota+"' AND ZLZ_VERSAO = '"+cVers+"' AND D_E_L_E_T_ = ' ' "
	cQuery+=" ORDER BY ZLZ_ITEM "
	TcQuery ChangeQuery(cQuery) New Alias "TEMP"

	While TEMP->(!EOF())
		nLinha++
	 	IF (nItErro:= oModelGrid:AddLine()) == nLinha
			oModel:SetValue( 'ID_MODEL_GRD_ZLZ', 'ZLZ_ITEM'			, TEMP->ZLZ_ITEM )
			oModel:SetValue( 'ID_MODEL_GRD_ZLZ', 'ZLZ_CODPRO'		, TEMP->ZLZ_CODPRO )
			oModel:SetValue( 'ID_MODEL_GRD_ZLZ', 'ZLZ_LJPROD'		, TEMP->ZLZ_LJPROD )
			oModel:SetValue( 'ID_MODEL_GRD_ZLZ', 'ZLZ_NOMEPR'		, TEMP->ZLZ_NOMEPR )
			oModel:SetValue( 'ID_MODEL_GRD_ZLZ', 'ZLZ_DIAPI'		, TEMP->ZLZ_DIAPI )
			oModel:SetValue( 'ID_MODEL_GRD_ZLZ', 'ZLZ_HRPRSA'		, TEMP->ZLZ_HRPRSA )
			oModel:SetValue( 'ID_MODEL_GRD_ZLZ', 'ZLZ_HRPRCH'		, TEMP->ZLZ_HRPRCH )
			oModel:SetValue( 'ID_MODEL_GRD_ZLZ', 'ZLZ_VLMPR'		, TEMP->ZLZ_VLMPR )
			oModel:SetValue( 'ID_MODEL_GRD_ZLZ', 'ZLZ_MSBLQL'		, '2' )
	   	Else
			MsgAlert("N�o foi poss�vel inserir os �tens entre em contato com o administrador do sistema")
	   	EndIf
		TEMP->(dbSkip())
	EndDo
	TEMP->(dbCloseArea("TEMP"))
EndIF

Return (.T.)

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AG038VLDA � Autor � Jeovane               � Data da Criacao  � 11/09/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Fun��o para valida��o do preenchimento dos campos c�digo e loja do produtor                                  ���
���          �                  												                               				���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Implantacao das rotinas referente a Gestao do Leite.                						                    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum						   							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Verdadeiro ou Falso                                                          						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite.                                                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �          �                               				   �                                  �   	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/

User Function AG038VLDA()

Local _aArea    := GetArea()
Local _lRetorno := .F.
Local oModel 	:= FWModelActive()
Local oGridZLZ  := oModel:GetModel('ID_MODEL_GRD_ZLZ')
Local _cProdutor := oGridZLZ:GetValue("ZLZ_CODPRO")
Local _cLjProd   := oGridZLZ:GetValue("ZLZ_LJPROD")


dbSelectArea("SA2")
SA2->(dbSetOrder(1))

If !dbSeek(xFilial("SA2") + _cProdutor + _cLjProd)
	Help( ,, "Produtor" ,, "N�o existe produtor para o c�digo e loja informados", 1, 0 )
Else
	_lRetorno := .T.	
EndIf

RestArea(_aArea)

Return(_lRetorno)