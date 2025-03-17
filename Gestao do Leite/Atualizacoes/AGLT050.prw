#Include 'Protheus.ch'
#Include "FwMvcDef.ch"

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT050  � Autor � Guilherme Fran�a      � Data da Criacao  � 06/09/2016                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Rotina desenvolvida para possibilitar inclus�o o calculo automatico para pagamento do frete do leite para os ���
���          � transportadores de leite.                                                                                    ���
���          � Espec�fico - PROMILAT                                                                                        ���
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
User Function AGLT050()
Private oBrowse 	:= FwMBrowse():New() 

oBrowse:SetAlias('ZLP')
oBrowse:SetDescripton("Pagamento de Frete") 

oBrowse:SetAmbiente(.T.)
oBrowse:SetWalkThru(.T.)
//oBrowse:DisableDetails()
oBrowse:Activate()


Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MenuDef   �Autor  �TOTVS TM            � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao para Menu do Browse                                  ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AGLT050                                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function MenuDef()
Local aMenu :=	{}
	
	ADD OPTION aMenu TITLE 'Pesquisar'  ACTION 'PesqBrw'       	OPERATION 1 ACCESS 0
	ADD OPTION aMenu TITLE 'Visualizar' ACTION 'VIEWDEF.AGLT050'	OPERATION 2 ACCESS 0
	ADD OPTION aMenu TITLE 'Incluir'    ACTION 'VIEWDEF.AGLT050' 	OPERATION 3 ACCESS 0
	ADD OPTION aMenu TITLE 'Alterar'    ACTION 'VIEWDEF.AGLT050' 	OPERATION 4 ACCESS 0
	ADD OPTION aMenu TITLE 'Excluir'    ACTION 'VIEWDEF.AGLT050' 	OPERATION 5 ACCESS 0
	ADD OPTION aMenu TITLE 'Imprimir'   ACTION 'VIEWDEF.AGLT050'	OPERATION 8 ACCESS 0
//	ADD OPTION aMenu TITLE 'Copiar'     ACTION 'VIEWDEF.AGLT050'	OPERATION 9 ACCESS 0
	
	
Return(aMenu)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �ModelDef  �Autor  �TOTVS TM            � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao para Menu do Browse                                  ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AGLT050                                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function ModelDef()


	Local oStruct1	:=	FWFormStruct(1,'ZLP', /*bAvalCampo*/, /*lViewUsado*/ )
	Local oModel
	
	
	oModel	:=	MpFormModel():New('ID_MODEL',{|oModel| FilialOK(oModel)}/*Pre-Validacao*/,/*Pos-Validacao*/,/*Commit*/,/*Commit*/,/*Cancel*/)
	
	// criacao de trigger para preencher campos
	/*
	[01] identificador (ID) do campo de origem
	[02] identificador (ID) do campo de destino
	[03] Bloco de c�digo de valida��o da execu��o do gatilho
	[04] Bloco de c�digo de execu��o do gatilho
	
	*/           
	aAdd(aTrigger, FwStruTrigger('ZLP_FRETIS'   ,'ZLP_CODIGO' ,'Alltrim(M->ZLP_MIX)+ Alltrim(M->ZLP_FRETIS)+Alltrim(M->ZLP_LOJA)',.F.,'',,'','','001'))
	aAdd(aTrigger, FwStruTrigger('ZLP_FRETIS'   ,'ZLP_NOMEFR' ,'Alltrim(SA2->A2_NOME)',.T.,'SA2',1,'xFilial("SA2")+M->ZLP_FRETIS+"01"','','002'))
	aAdd(aTrigger, FwStruTrigger('ZLP_FRETIS'   ,'ZLP_FRMPG'  ,'ZLW->ZLW_FRMPG',.T.,'ZLW',3,'xFilial("ZLW")+M->ZLP_FRETIS+"01"','','003'))
	aAdd(aTrigger, FwStruTrigger('ZLP_FRETIS'   ,'ZLP_VLRFRT' ,'ZLW->ZLW_VLRFRT',.T.,'ZLW',3,'xFilial("ZLW")+M->ZLP_FRETIS+"01"','','004'))
	aAdd(aTrigger, FwStruTrigger('ZLP_FRETIS'   ,'ZLP_LITROS' ,'U_AGLT50G("1",M->ZLP_MIX,M->ZLP_FRETIS,M->ZLP_LOJA,M->ZLP_SETOR)',.F.,'',,'','','005'))
	aAdd(aTrigger, FwStruTrigger('ZLP_FRETIS'   ,'ZLP_KM'     ,'U_AGLT50G("2",M->ZLP_MIX,M->ZLP_FRETIS,M->ZLP_LOJA,M->ZLP_SETOR)',.F.,'',,'','','006'))
	aAdd(aTrigger, FwStruTrigger('ZLP_FRETIS'   ,'ZLP_QTDTKT' ,'U_AGLT50G("3",M->ZLP_MIX,M->ZLP_FRETIS,M->ZLP_LOJA,M->ZLP_SETOR)',.F.,'',,'','','007'))
	aAdd(aTrigger, FwStruTrigger('ZLP_FRETIS'   ,'ZLP_VALOR' ,'IIF(ZLP_FRMPG=="L",M->ZLP_LITROS*M->ZLP_VLRFRT,M->ZLP_KM*M->ZLP_VLRFRT)',.F.,'',,'','','008'))
	aAdd(aTrigger, FwStruTrigger('ZLP_LITROS'   ,'ZLP_VALOR' ,'IIF(ZLP_FRMPG=="L",M->ZLP_LITROS*M->ZLP_VLRFRT,M->ZLP_VALOR)',.F.,'',,'','','009'))
	aAdd(aTrigger, FwStruTrigger('ZLP_KM'       ,'ZLP_VALOR' ,'IIF(ZLP_FRMPG!="L",M->ZLP_KM*M->ZLP_VLRFRT,M->ZLP_VALOR)',.F.,'',,'','','010'))	
	For _i := 1 to Len(aTrigger)
		oStruct1:AddTrigger(aTrigger[_i][1] ,aTrigger[_i][2] ,aTrigger[_i][3] ,aTrigger[_i][4] )
	Next _i
	

	
	oModel:AddFields('ID_MODEL_FLD_ZLP', /*cOwner*/, oStruct1, /*bPreValidacao*/, /*{|oModel| ATUASB2(oModel)}*/, /*bCarga*/ )
		
	oModel:SetPrimaryKey({'ZLP_CODIGO'})
	
	oModel:SetDescription('Pagamento de Frete')
	oModel:GetModel( 'ID_MODEL_FLD_ZLP' ):SetDescription( 'Pagamento de Frete' )
	
Return(oModel)


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �AFAT006   �Autor  �TOTVS TM    		 � Data �  21/02/13   ���
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
	Local oStruct1	:=	FWFormStruct(2,'ZLP')
	Local oModel	:=	FwLoadModel('AGLT050') 
	Local oView		:=	FwFormView():New()
	
	oView:SetModel(oModel)	
	oView:AddField( 'ID_VIEW_FLD_ZLP', oStruct1, 'ID_MODEL_FLD_ZLP')
		
	oView:CreateHorizontalBox( 'ID_HBOX_100', 100 ) 
	oView:SetOwnerView( 'ID_VIEW_FLD_ZLP', 'ID_HBOX_100' )

Return(oView)


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �AGLT50G   �Autor  �Microsiga           � Data �  09/06/16   ���
�������������������������������������������������������������������������͹��
���Desc.     � Funcao ativada nos gatilhos da rotina.                     ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
User Function AGLT50G(xcOpc,xcMix,xcFretista,xcLoja,xcSetor)

Local _nRet := 0
Local _cAlias := GetNextAlias()
Local _cFiltro := ""
Local _nCont := 0
Local _nQtd := 0
Local _nKM	:= 0

DEFAULT xcLoja := "01"

dbSelectArea("ZLE")
ZLE->(dbSetOrder(1))
ZLE->(dbSeek(xFilial("ZLE")+xcMix))
	
_cFiltro := "%	'"+DTOS(ZLE->ZLE_DTINI)+"' AND '"+DTOS(ZLE->ZLE_DTFIM)+"'  %"


BeginSql alias _cAlias
	SELECT DISTINCT ZLD_TICKET,SUM(ZLD_QTDBOM) AS LITROS, ZLD_KM AS KM 
	FROM %Table:ZLD% LD
	WHERE ZLD_FRETIS = %Exp:xcFretista%
	AND ZLD_LJFRET  = %Exp:xcLoja%
	AND ZLD_SETOR  = %Exp:xcSetor%	
	AND ZLD_DTCOLE BETWEEN %Exp:_cFiltro%
	AND LD.%NotDel%
	GROUP BY ZLD_TICKET, ZLD_KM
EndSql		

dbSelectArea(_cAlias)
(_cAlias)->(DbGoTop())

While !(_cAlias)->(Eof())
	_nCont++
	_nQtd	+= (_cAlias)->LITROS
	_nKM	+= (_cAlias)->KM
	
	(_cAlias)->(DbSkip())
EndDo

dbSelectArea(_cAlias)
(_cAlias)->(DbCloseArea())



Do Case
	Case xcOpc == "1"
		_nRet := _nQtd
	Case xcOpc == "2"
		_nRet := _nKM
	Case xcOpc == "3"
		_nRet := _nCont
EndCase

Return _nRet

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �FilialOK  �Autor  �TOTVS TM            � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Desc.     �Verifica se o usuario est� logado na filial do leite.       ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function FilialOK(oModel)

Local nOperation	:=	oModel:GetOperation()
Local lRet			:=	.T.
	

If nOperation	==	3
	If SubStr(cFilAnt,1,2) <> "53"
		Help( ,, 'Help',," Posicione na empresa 53 antes de prosseguir!", 1, 0 )
		lRet := .f.
	EndIf
EndIf
	///

Return lRet
