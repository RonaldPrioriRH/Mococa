#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'FWMVCDEF.CH'
#INCLUDE 'TOPCONN.CH'      
#INCLUDE 'TOTVS.CH'

#DEFINE _ENTER CHR(13)+CHR(10)  
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT007  � Autor � Guilherme Fran�a      � Data da Criacao  � 11/08/2015  									���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Fun��o em MVC para montar a tela de transferencia de litros entre produtores, para gerar creditos e debitos  ���
���          � no fechamento do leite.                                                                    					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � 												                                                        		���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum						   							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum						  							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gest�o do Leite                                                                       						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor    	���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �00/00/0000�                               				   �00-000000 -                       � TI	    	���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
*/  

User Function AGLT007()

Local oBrowse       

Private _aNumPed	:= {}

oBrowse := FWmBrowse():New()
oBrowse:SetAlias( 'ZLJ' )
oBrowse:SetDescription( 'Transferencia de Litros' )       

oBrowse:Activate()                                  

Return NIL


//-------------------------------------------------------------------
Static Function MenuDef()
Local aRotina := {}

ADD OPTION aRotina Title 'Pesquisar'  	Action 'PesqBrw'         	OPERATION 1 ACCESS 0
ADD OPTION aRotina Title 'Visualizar'	Action 'VIEWDEF.AGLT007' 	OPERATION 2 ACCESS 0
ADD OPTION aRotina Title 'Incluir'   	Action 'VIEWDEF.AGLT007'	OPERATION 3 ACCESS 0
//ADD OPTION aRotina TITLE 'Alterar'    	ACTION 'VIEWDEF.AGLT007' 	OPERATION 4 ACCESS 0
ADD OPTION aRotina Title 'Alterar'    	Action 'U_AGLT7IN("A")'		OPERATION 4 ACCESS 0
//ADD OPTION aRotina TITLE 'Excluir'    	ACTION 'VIEWDEF.AGLT007' 	OPERATION 5 ACCESS 0
ADD OPTION aRotina Title 'Excluir'    	Action 'U_AGLT7IN("D")'		OPERATION 5 ACCESS 0

Return aRotina

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � ModelDef � Autor � Guilherme Fran�a   � Data � 11/08/2015  ���
�������������������������������������������������������������������������͹��
���Descri��o � Constru��o da View Def                                     ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/ 
Static Function ModelDef()
// Cria a estrutura a ser usada no Modelo de Dados
Local oStruZLJ	:= FWFormStruct( 1, 'ZLJ', /*bAvalCampo*/, /*lViewUsado*/ )
Local oStruZLI	:= FWFormStruct( 1, 'ZLI', /*bAvalCampo*/, /*lViewUsado*/ )
Local aTrigger := {}
Local oModel           
Local _i       := 0

// Cria o objeto do Modelo de Dados
oModel := 	MPFormModel():New( 'AGLT007M', /*bPreValidacao*/, { |oModel| TudoOk(oModel)}/*bPosValidacao*/,/*{ |oMdl| GeraPedid( oMdl ) }bCommit*/, /*bCancel*/ )

// criacao de trigger para preencher quantidade de litros do periodo
/*
[01] identificador (ID) do campo de origem
[02] identificador (ID) do campo de destino
[03] Bloco de c�digo de valida��o da execu��o do gatilho
[04] Bloco de c�digo de execu��o do gatilho


aQTDTrigger := {}
aQTDTrigger := FwStruTrigger('ZLJ_CODPRO'   ,'ZLJ_TOTMIX'   ,'U_AGLT007SLD(M->ZLJ_MIX)',.F.)//,'',0,'',NIL,'01')
oStruZLJ:AddTrigger(aQTDTrigger[1] ,aQTDTrigger[2] ,aQTDTrigger[3] ,aQTDTrigger[4] )

*/           
aAdd(aTrigger, FwStruTrigger('ZLJ_MIX'   ,'ZLJ_DATA'   ,'ZLE->ZLE_DTFIM',.T.,'ZL3',1,'xFilial("ZLE")+M->ZLJ_MIX'))
For _i := 1 to Len(aTrigger)
	oStruZLJ:AddTrigger(aTrigger[_i][1] ,aTrigger[_i][2] ,aTrigger[_i][3] ,aTrigger[_i][4] )
Next _i

// Adiciona ao modelo uma estrutura de formul�rio de edi��o por campo
oModel:AddFields( 'ZLJMASTER', /*cOwner*/, oStruZLJ )

// Adiciona ao modelo uma estrutura de formul�rio de edi��o por grid
oModel:AddGrid( 'ZLIDETAIL', 'ZLJMASTER', oStruZLI, /*bLinePre*/, /*bLinePost*/, /*bPreVal*/,{ || ValidaLin(1) } /*bPosVal*/, /*BLoad*/ )

// Adiciona a descricao do Componente do Modelo de Dados
oModel:SetDescription('Transferencia de Litros')
oModel:GetModel( 'ZLJMASTER' ):SetDescription( 'Produtor Origem' )
oModel:GetModel( 'ZLIDETAIL' ):SetDescription( 'Produtores Destino' )

// Faz relaciomaneto entre os compomentes do model
oModel:SetRelation( 'ZLIDETAIL', { { 'ZLI_FILIAL', 'xFilial( "ZLI" )' }, { 'ZLI_CODIGO', 'ZLJ_CODIGO' } }, ZLI->( IndexKey( 1 ) ) )


// Liga o controle de nao repeticao de linha
oModel:GetModel( 'ZLIDETAIL' ):SetUniqueLine( { 'ZLI_CODPRO','ZLI_LOJPRO' } )


// Indica que � opcional ter dados informados na Grid
oModel:GetModel( 'ZLIDETAIL' ):SetOptional(.F.)
//oModel:GetModel( 'ZA2DETAIL' ):SetOnlyView(.T.)    

//oModel:GetModel( 'ZLI2DETAIL' ):SetNoInsertLine( .T. )
//oModel:GetModel( 'ZLI2DETAIL' ):SetNoUpdateLine( .T. )


//oModel:GetModel( 'ZLI2DETAIL' ):SetDescription( 'Destino' )

oModel:SetPrimaryKey({'ZLJ_CODIGO'}) 


Return oModel

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � ViewDef  � Autor � Vin�cius Fernandes � Data � 11/06/2015  ���
�������������������������������������������������������������������������͹��
���Descri��o � Constru��o da View Def                                     ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/                                                                         

Static Function ViewDef()
// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
Local oStruZLJ 	:= FWFormStruct( 2, 'ZLJ' )
Local oStruZLI	:= FWFormStruct( 2, 'ZLI' )

// Cria a estrutura a ser usada na View
Local oModel   	:= FWLoadModel( 'AGLT007' ) 
Local oView

oStruZLI:RemoveField( 'ZLI_CODIGO' )


// Cria o objeto de View
oView := FWFormView():New()

// Define qual o Modelo de dados ser� utilizado
oView:SetModel( oModel )

//Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
oView:AddField( 'VIEW_ZLJ', oStruZLJ, 'ZLJMASTER' )

//Adiciona no nosso View um controle do tipo FormGrid(antiga newgetdados)
oView:AddGrid(  'VIEW_ZLI', oStruZLI, 'ZLIDETAIL' )  


// Criar um "box" horizontal para receber algum elemento da view
oView:CreateHorizontalBox( 'SUPERIOR'	, 35 )
oView:CreateHorizontalBox( 'INFERIOR' 	, 65 )

// Relaciona o ID da View com o "box" para exibicao
oView:SetOwnerView( 'VIEW_ZLJ'	, 'SUPERIOR' )
oView:SetOwnerView( 'VIEW_ZLI'	, 'INFERIOR' )

/*
// Criar um "box" horizontal para receber algum elemento da view
oView:CreateHorizontalBox( 'SUPERIOR'	, 30 )
oView:CreateHorizontalBox( 'MEIO'		, 35 ) 
oView:CreateHorizontalBox( 'INFERIOR' 	, 35 )

// Relaciona o ID da View com o "box" para exibicao
oView:SetOwnerView( 'VIEW_ZLJ'	, 'SUPERIOR' )
oView:SetOwnerView( 'VIEW_ZLI1'	, 'MEIO' ) 
oView:SetOwnerView( 'VIEW_ZLI2'	, 'INFERIOR' )
*/
// Define campos que terao Auto Incremento
oView:AddIncrementField( 'VIEW_ZLI', 'ZLI_ITEM' ) 


// Criar novo botao na barra de botoes
//oView:AddUserButton( 'Inclui Autor', 'CLIPS', { |oView| COMP021BUT() } )

// Liga a identificacao do componente
//oView:EnableTitleView('VIEW_ZA2')
//oView:EnableTitleView('VIEW_ZLI1','LOTES')

// Liga a Edi��o de Campos na FormGrid
//oView:SetViewProperty( 'VIEW_ZD4', "ENABLEDGRIDDETAIL", { 50 } )

Return oView    

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � AGLT7IN  �Autor  � Guilherme Fran�a   � Data �  18/08/15   ���
�������������������������������������������������������������������������͹��
���Descricao �                                                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
USER Function AGLT7IN(_cTipo)


IF _cTipo	= "I"                                                                            
	lOk := ( FWExecView('Valida��o de Inclusao','AGLT007', MODEL_OPERATION_INSERT,, ,  ) == 0 )
ELSEIF _cTipo	= "A" 
	IF VldMIX(ZLJ->ZLJ_MIX)
		lOk := ( FWExecView('Valida��o de Altera��o','AGLT007', MODEL_OPERATION_UPDATE,, ,  ) == 0 )   
	ELSE
		ALERT("N�O � permitido ALTERAR este movimento pois o MIX j� est� fechado!")
	ENDIF
ELSEIF _cTipo = 'D'
	IF VldMIX(ZLJ->ZLJ_MIX)
		lOk := ( FWExecView('Valida��o de Altera��o','AGLT007', MODEL_OPERATION_DELETE,, ,  ) == 0 )
	ELSE
		ALERT(	"N�O � permitido EXCLUIR este movimento pois o MIX j� st� fechado!")
	ENDIF		
ENDIF        

RETURN 


/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � ZLIQTD  � Autor � Guilherme Fran�a   � Data � 11/08/2015  ���
�������������������������������������������������������������������������͹��
���Descri��o � Fun��o de valida��o do campo ZLI_QTD para que n�o permita  ���
���          � digitar quantidade maior que o saldo do produtor de origem ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

user Function ZLIQTD(_nQtd)  

Local oModel 	:= FWModelActive()
Local oStruZLJ	:= oModel:GetModel('ZLJMASTER')
Local _nTransf 	:= oStruZLJ:GetValue("ZLJ_QTDTRA")
Local _nSaldo 	:= oStruZLJ:GetValue("ZLJ_SALDO")

If _nQtd > _nSaldo
	xMagHelpFis("Valida��o ZLIQTD","Quantidade digita � maior que o saldo dispon�vel para transfer�ncia!",;
			+"Digite volume menor ou igual a "+cValToChar(M->ZLJ_SALDO))
	Return .f.
EndIf

ValidaLin(2)
/*
_nSaldo  -= _nQtd  
_nTransf += _nQtd  

//M->ZLJ_SALDO := _nSaldo
oStruZLJ:LoadValue("ZLJ_SALDO",_nSaldo)
oStruZLJ:LoadValue("ZLJ_QTDTRA",_nTransf)
*/

RETURN .T.

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � AGLT007SLD � Autor � Guilherme Fran�a � Data � 17/08/2015  ���
�������������������������������������������������������������������������͹��
���Descri��o � Fun��o usada no gatilho do ZLJ_CODPRO para preencher o     ���
���          � volume de produto total do produtor no mes do mix informado���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function AGLT007SLD(xMIX)

Local oModel 	:= FWModelActive() 
Local oStruZLJ	:= oModel:GetModel('ZLJMASTER')
Local _nRet := 0
Local _cFiltro := ""
Local _dDtIni := Posicione("ZLE",1,xFilial("ZLE")+xMIX,"ZLE_DTINI")
Local _dDtFim := Posicione("ZLE",1,xFilial("ZLE")+xMIX,"ZLE_DTFIM")
Local _cLoja	:= IIf(Empty(M->ZLJ_LOJPRO),"01",M->ZLJ_LOJPRO)
_cFiltro := "% '"+Dtos(_dDtIni)+"' AND '"+DTOS(_dDtFim)+"'  %"

If Select("QTD") <> 0
	QTD->(dbCloseArea())
EndIf

BeginSql alias "QTD"
	SELECT SUM(ZLD_QTDBOM) QTDTOT FROM %Table:ZLD% ZLD
	WHERE ZLD_FILIAL = %Exp:xFilial("ZLD")%
	AND ZLD.ZLD_RETIRO = %Exp:M->ZLJ_CODPRO%
	AND ZLD.ZLD_RETILJ = %Exp:M->ZLJ_LOJPRO%
	AND ZLD.%NOTDEL%
	AND ZLD_DTCOLE BETWEEN %Exp:_cFiltro%
EndSql

If !QTD->(Eof())
	_nRet	:= QTD->QTDTOT      
EndIf
QTD->(dbCloseArea())	

oStruZLJ:LoadValue("ZLJ_SALDO",_nRet)
oStruZLJ:LoadValue("ZLJ_TOTMIX",_nRet)


Return 

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � VldMIX   � Autor � Guilherme Fran�a   � Data � 11/08/2015  ���
�������������������������������������������������������������������������͹��
���Descri��o � Valida se o registro pertence a algum MIX j� encerrado     ���
���          � antes de alterado ou exclu�lo.                             ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function VldMIX(xMix)

Local oModel 	:= FWModelActive()
//Local oStruZLJ	:= oModel:GetModel('ZLJMASTER')
Local _cMix		:= xMix //oStruZLJ:GetValue("ZLJ_MIX")

DbSelectarea("ZLE")
DbSetOrder(1)
DbSeek(xFilial("ZLE")+_cMix)
If ZLE->ZLE_STATUS == 'F'
	Return .f.
EndIf


Return .t.


/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � ValidaLin� Autor � Guilherme Fran�a   � Data � 11/08/2015  ���
�������������������������������������������������������������������������͹��
���Descri��o � Fun��o de valida��o de exclus�o da linha na inclus�o e     ���
���          � altera��o.                                                 ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function ValidaLin(xOpc)

Local oModel 	:= FWModelActive()
Local nOperation	:=	oModel:GetOperation()
Local oStruZLJ	:= oModel:GetModel('ZLJMASTER')
Local oStruZLI	:= oModel:GetModel('ZLIDETAIL')
Local _nQtdMix	:= oStruZLJ:GetValue("ZLJ_TOTMIX")
Local _nTransf 	:= 0 //oStruZLJ:GetValue("ZLJ_QTDTRA")
Local _nSaldo 	:= _nQtdMix //oStruZLJ:GetValue("ZLJ_SALDO")
Local _nQtd 	:= oStruZLI:GetValue("ZLI_QTD")
Local _nLin		:= oStruZLI:GetQTDLine()
Local _lDel	:=	IIf(xOpc==1,.t.,.f.)
//Se a linha foi deletada, retorna o saldo do produtor origem
If nOperation == 3 .or. nOperation == 4
	For nL := 1 TO _nLin
		oStruZLI:GoLine(nL) 
		_nQtd 	:= oStruZLI:GetValue("ZLI_QTD")
		IF !oStruZLI:IsDeleted(nL) .and. _nQtd>0
			_nSaldo	-= _nQtd
			_nTransf += _nQtd
		ENDIF

		If _lDel .and. _nQtd == 0
			oStruZLI:DeleteLine()					
        EndIf

    Next nL
	oStruZLJ:LoadValue("ZLJ_SALDO",_nSaldo)
	oStruZLJ:LoadValue("ZLJ_QTDTRA",_nTransf)
EndIf

Return .t.

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � ZLJCODPRO� Autor � Guilherme Fran�a   � Data � 19/08/2015  ���
�������������������������������������������������������������������������͹��
���Descri��o � Fun��o de valida��o do campo ZLJ_LOJPRO que retorna o      ���
���          � preenchimento da grid com produtores do mesmo grupo.       ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
User Function ZLJCODPRO(_cProd,_cLoja)  

Local _cGrupo	:= Posicione("SA2",1,xFilial("SA2")+_cProd+_cLoja,"A2_L_GRUPO")
Local _lCarrega := .f.
If !Empty(Alltrim(_cGrupo))
	If MsgYesNo("Este produtor est� amarrado a um grupo de produtores!"+_ENTER;
			 +"Deseja preencher a grid com os produtores do grupo?")
		_lCarrega := .t.
	EndIf
EndIf
MsAguarde({|| GeraGrid(_cGrupo,_lCarrega)},"Aguarde...","Atualizando grid...")

//Fun�cao para preencher a quantidade do produtor no mes
AGLT007SLD(M->ZLJ_MIX)	

	
RETURN .T.


/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � GERAGRID � Autor � Vin�cius Fernandes � Data � 11/06/2015  ���
�������������������������������������������������������������������������͹��
���Descri��o � Fun��o para preencher o primeiro grid, com os produtos     ���
���          � disponiveis para transferencia                             ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

STATIC FUNCTION GERAGRID(xGrupo,xlCarrega)

Local _lCarrega := xlCarrega
Local oModel 	:= FWModelActive() 
Local oStruZLJ	:= oModel:GetModel('ZLJMASTER')
Local oStruZLI	:= oModel:GetModel('ZLIDETAIL')
Local oView 	:= FWViewActive()               
Local nLinAtu	:= 0
Local _cCodigo	:= oStruZLJ:GetValue("ZLJ_CODIGO")
Local _cProd	:= oStruZLJ:GetValue("ZLJ_CODPRO")
lOCAL _cLoja	:= oStruZLJ:GetValue("ZLJ_LOJPRO")
Local _cGrupo	:= xGrupo //Posicione("SA2",1,xFilial("SA2")+_cProd+_cLoja,"A2_L_GRUPO")
Local _nItem	:= 1	
Local _nQuatLinha := oStruZLI:GetQTDLine()
Local _nLinha	:= 1

If _nQuatLinha > 1
	FOR NI := 1 TO _nQuatLinha
		oStruZLI:GoLine(NI)
		oStruZLI:DeleteLine()		
	NEXT
EndIf

If !_lCarrega
	Return .t.
Endif


IncProc("Localizando Produtores...")                                    

If Select("TTRB") > 0
	TTRB->(DBCLOSEAREA())
EndIF

BeginSql alias "TTRB"
	SELECT A2_COD, A2_LOJA, A2_NOME
	FROM %Table:SA2% A2
	WHERE A2_L_GRUPO = %Exp:_cGrupo%
	AND A2_COD <> %Exp:_cProd%
	AND A2.%NOTDEL%
EndSql

If !TTRB->(Eof())
	While !TTRB->(Eof())

		IF _nLinha <= _nQuatLinha
			oStruZLI:GoLine(_nLinha) 
			IF oStruZLI:IsDeleted(_nLinha)
				oStruZLI:UnDeleteLine()
			ENDIF
		ELSE
			oStruZLI:AddLine()
		ENDIF

		oStruZLI:LoadValue("ZLI_CODIGO",_cCodigo)
		oStruZLI:LoadValue("ZLI_ITEM",StrZero(_nItem,3))
		oStruZLI:LoadValue("ZLI_CODPRO",TTRB->A2_COD)
		oStruZLI:LoadValue("ZLI_LOJPRO",TTRB->A2_LOJA)
		oStruZLI:LoadValue("ZLI_NOME",TTRB->A2_NOME)
//		oStruZLI:LoadValue("ZLI_QTD",1)		
		TTRB->(DbSkip())
		_nItem++
		_nLinha++
	EndDo
	oStruZLI:GoLine(1)
Else
	MsgInfo("N�o foram encontrados produtores amarrados ao grupo: "+_cGrupo)
Endif

TTRB->(DBCLOSEAREA())

Return .T.             


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �TUDOOK   �Autor  �Microsiga           � Data �  11/26/15   ���
�������������������������������������������������������������������������͹��
���Desc.     �                                                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function TudoOk(oModel)
                     
Local _aArea    := GetArea()
Local _aAreaZLE := ZLE->(GetArea())
Local _lRetorno := .T.
Local oModelZLJ := oModel:GetModel("ZLJMASTER")
Local oGridZLI  := oModel:GetModel("ZLIDETAIL")
Local _i
Local _cProdutor := oModelZLJ:GetValue("ZLJ_CODPRO")
Local _cLojaP     := oModelZLJ:GetValue("ZLJ_LOJPRO")
Local _cMix      := oModelZLJ:GetValue("ZLJ_MIX")
Local _nOpc      := oModel:GetOperation()
Local _lDelete   := _nOpc == 5
Local _lInclui   := _nOpc == 3
Local _lAltera   := _nOpc == 4
Local _nQtdLeite := 0
Local _cRetiro   := ""
Local _cLoja     := ""

Local _aTicket   := {}
Local _cTicket   := oModelZLJ:GetValue("ZLJ_TICKET")


If Empty(_cTicket) .and. !_lDelete
	_nOpc := 3
	_lInclui := .t.
	_lAltera := .f.
EndIf


dbSelectArea("ZLE")
ZLE->(dbSetOrder(1))
If dbSeek(xFilial("ZLE")+_cMix)
	
	For _i := 1 to oGridZLI:Length()
		
		oGridZLI:GoLine(_i)
		If !oGridZLI:IsDeleted()
			_nQtdLeite := oGridZLI:GetValue("ZLI_QTD")
			_cRetiro   := oGridZLI:GetValue("ZLI_CODPRO")
			_cLoja     := oGridZLI:GetValue("ZLI_LOJPRO")
			
			aAdd(_aTicket,{_cProdutor, _cLojaP, ZLE->ZLE_DTINI, ZLE->ZLE_DTFIM, _nQtdLeite, _cRetiro, _cLoja, oGridZLI:IsDeleted()})
		EndIf
	Next _i
	
	If Len(_aTicket) > 0
		/*
		Adiciona lan�amento com valor negativo para deduzir da quantidade de leite
		do produtor que estiver pagando aluguel de tanque com transfer�ncia de leite.
		*/
		aAdd(_aTicket,{_cProdutor, _cLojaP, ZLE->ZLE_DTINI, ZLE->ZLE_DTFIM, -oModelZLJ:GetValue("ZLJ_QTDTRA"), _cProdutor, _cLojaP, .F.})
		If _lDelete
			ExcZld(oMOdelZLJ:GetValue("ZLJ_TICKET"), , , oModelZLJ:GetValue("ZLJ_CODIGO"))
		Else
			If _lInclui
				_cTicket :=  GrvZld(_aTicket, _nOpc,,oMOdelZLJ:GetValue("ZLJ_CODIGO"))
				oModelZLJ:SetValue("ZLJ_TICKET", _cTicket)
			ElseIf _lAltera
				GrvZld(_aTicket, _nOpc, oModelZLJ:GetValue("ZLJ_TICKET"), oMOdelZLJ:GetValue("ZLJ_CODIGO"))
			EndIf
		EndIf
	EndIf
	
Else
	
	Help( ,, 'Help',," Mix " + _cMix + " N�o est� cadastrado.", 1, 0 )
	_lRetorno := .F.
	
EndIf

Return(_lRetorno)


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �ExcZld �Autor  �Microsiga           � Data �  11/27/15   ���
�������������������������������������������������������������������������͹��
���Desc.     �Exclui dados de recep��o feita por transferencia            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function ExcZld(_pcTicket, _pcProdutor, _pcLoja, _pcCodTrf)

Local _aArea := GetArea()

Default _pcProdutor := ""
Default _pcLoja     := ""

BEGIN TRANSACTION

dbSelectArea("ZLD")
dbSetOrder(3) //ZLD_FILIAL, ZLD_TICKET, ZLD_FRETIS, ZLD_LJFRET, R_E_C_N_O_, D_E_L_E_T_
If dbSeek(xFilial("ZLD")+_pcTicket)
	
	If Empty(_pcProdutor)
		While !ZLD->(Eof()) .AND. Alltrim(_pcTicket) == Alltrim(ZLD->ZLD_TICKET)
			
			If Empty(ZLD->ZLD_STATUS)
				
				ExcZLB(_pcCodTrf, ZLD->ZLD_RETIRO, ZLD->ZLD_RETILJ)
				
				RecLock("ZLD", .F.)
				ZLD->(dbDelete())
				ZLD->(MsUnLock())
				
				dbSeek(xFilial("ZLD")+_pcTicket)
				
			Else
				Help( ,, 'Help',,"Transfer�ncia n�o pode ser excluida. Existe MIX montado para o ticket " +_pcTicket +"." , 1, 0 )
				DisarmTransaction()
				Exit
			EndIf
			
		EndDo
		
	Else
		dbSelectArea("ZLD")
		ZLD->(dbSetOrder(2)) //ZLD_FILIAL, ZLD_CODREC, ZLD_RETIRO, ZLD_RETILJ, R_E_C_N_O_, D_E_L_E_T_
		If dbSeek(xFilial("ZLD")+ZLD->ZLD_CODREC+_pcProdutor+_pcLoja)
			RecLock("ZLD", .F.)
			ZLD->(dbDelete())
			ZLD->(MsUnLock())
		EndIf
	EndIf

EndIf

END TRANSACTION

RestArea(_aArea)

Return
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �GrvZld �Autor  �Microsiga           � Data �  11/26/15      ���
�������������������������������������������������������������������������͹��
���Desc.     � Grava dados de recep��o de leite por transferencia na      ���
���          � tabela ZLD                                                 ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function GrvZld(_paTicket, _nOpc, _pcTicket, _pcCodTrf)

Local _aArea    := GetArea()                    
Local _aAreaSX3 := SX3->(GetArea())     
Local cAlias   := GetNextAlias()
Local cTicket  := ""
Local _cNumRec := ""
Local _lAltera := _nOpc == 4
Local _lInclui := _nOpc == 3
Local _lLock   := _lInclui          
Local _lDeleted := .F.

Default _pcTicket := ""

// Cria tabela tempor�ria com registro modelo para inclus�o dos dados da recep��o do leite
BeginSql Alias cAlias
	
	SELECT  *
	
	FROM %Table:ZLD% ZLD
	
	WHERE ZLD_FILIAL = %xFilial:ZLD%
	AND ZLD_RETIRO   = %Exp:_paTicket[1][1]%
	AND ZLD_RETILJ 	 = %Exp:_paTicket[1][2]%
	AND ZLD_DTCOLE   BETWEEN %Exp:DtoS(_paTicket[1][3])% AND %Exp:DtoS(_paTicket[1][4])%
	AND ZLD.D_E_L_E_T_ = ' '
	ORDER BY ZLD.ZLD_CODREC DESC
	
EndSql                   
                    
dbSelectArea(cAlias)
(cAlias)->(dbGoTop())

dbSelectArea("SA2")
SA2->(dbSetOrder(1))
dbSeek(xFilial("SA2")+_paTicket[1][1]+_paTicket[1][2])

If _lInclui         
	_cNumRec := GetNumRec()          
	GetNwTicket( , @cTicket, "000001")
EndIf

If _lAltera   
	dbSelectArea("ZLD")
	ZLD->(dbSetOrder(3)) //ZLD_FILIAL, ZLD_TICKET, ZLD_FRETIS, ZLD_LJFRET, R_E_C_N_O_, D_E_L_E_T_
	dbSeek(xFilial("ZLD")+_pcTicket)
	_cNumRec := ZLD->ZLD_CODREC
	cTicket  := ZLD->ZLD_TICKET
EndIf

BEGIN TRANSACTION

For _i := 1 to Len(_paTicket)
	
	_lDeleted := _paTicket[_i, 8]

	If _lAltera
		dbSelectArea("ZLD")
		ZLD->(dbSetOrder(2)) //ZLD_FILIAL, ZLD_CODREC, ZLD_RETIRO, ZLD_RETILJ, R_E_C_N_O_, D_E_L_E_T_
		If dbSeek(xFilial("ZLD")+_cNumRec + _paTicket[_i][6] + _paTicket[_i][7])
			_lLock := .F.
		Else             
			_lLock := .T.
		EndIf   
		
		If _lDeleted     
			ExcZld(ZLD->ZLD_TICKET, ZLD->ZLD_RETIRO, ZLD->ZLD_RETILJ, _pcCodTrf)
		EndIf
	EndIf
	
	If !Empty((cAlias)->ZLD_RETIRO) .AND. !_lDeleted
		
		RecLock("ZLD", _lLock)
		
		ZLD->ZLD_FILIAL	:= xFilial("ZLD")
		
		/*
		Se for inclus�o ou altera��o e for necess�rio inlcuir
		registros na tabela ZLD.
		*/
		If _lInclui .or. (_lAltera .and. _lLock)
			ZLD->ZLD_ITEM   := StrZero(_i, 3)
		EndIf
		
		ZLD->ZLD_TICKET := cTicket
		ZLD->ZLD_DTCOLE := _paTicket[1][4]
		ZLD->ZLD_DTLANC := _paTicket[1][4]
		ZLD->ZLD_CODREC := _cNumRec
		ZLD->ZLD_SETOR  := (cAlias)->ZLD_SETOR
		ZLD->ZLD_RETIRO := _paTicket[_i][6]
		ZLD->ZLD_RETILJ := _paTicket[_i][7]
		ZLD->ZLD_DCRRET := Posicione("SA2", 1, xFilial("SA2")+_paTicket[_i][6]+_paTicket[_i][7], "A2_NOME")
		ZLD->ZLD_QTDBOM := _paTicket[_i][5]
		ZLD->ZLD_LINROT := Posicione("ZLZ",2,xFilial("ZLZ")+_paTicket[_i][6],"ZLZ_ROTA")//(cAlias)->ZLD_LINROT
		ZLD->ZLD_VERSAO := (cAlias)->ZLD_VERSAO
		ZLD->ZLD_DESLIN := (cAlias)->ZLD_DESLIN
		ZLD->ZLD_GRPRC  := Posicione("SA2",1, xFilial("SA2")+_paTicket[_i][6]+_paTicket[_i][7], "A2_L_LI_RO") //(cAlias)->ZLD_GRPRC
		ZLD->ZLD_FRETIS := (cAlias)->ZLD_FRETIS
		ZLD->ZLD_VFRELT := (cAlias)->ZLD_VFRELT
		ZLD->ZLD_USER   := CriaVar("ZLD_USER")
		ZLD->ZLD_MOTOR  := (cAlias)->ZLD_MOTOR
		ZLD->ZLD_VEICUL := (cAlias)->ZLD_VEICUL
		ZLD->ZLD_LJFRET := (cAlias)->ZLD_LJFRET
		ZLD->ZLD_TOTBOM := 0//_paTicket[_i][5]
		ZLD->ZLD_FILENT := (cAlias)->ZLD_FILENT
		ZLD->ZLD_ROTCAB := (cAlias)->ZLD_ROTCAB
		ZLD->ZLD_DESCAB := (cAlias)->ZLD_DESCAB
		ZLD->ZLD_TRIBUT := (cAlias)->ZLD_TRIBUT
		//ZLD->ZLD_ORIGEM := "TRANSFEREN"
		ZLD->(MsUnLock())

	EndIf
	
Next _i

// Replica an�lise
If MsgYesNo("Replicar analises do produtor original para destino?")
	RepAnalise()
EndIf

END TRANSACTION

RestArea(_aArea)
RestArea(_aAreaSX3)

Return(cTicket)
/*
��������������������������������������������������������������������������������
��������������������������������������������������������������������������������
����������������������������������������������������������������������������ͻ��
���Programa  � GetNwTicket � Autor � TOTVS              � Data �  00/00/00   ���
����������������������������������������������������������������������������͹��
���Desc.     � Funcao usada para pegar numero maximo do Ticket               ���
���          �                                                               ���
����������������������������������������������������������������������������͹��
���Uso       �                                                               ���
����������������������������������������������������������������������������ͼ��
��������������������������������������������������������������������������������
��������������������������������������������������������������������������������
*/
Static Function GetNwTicket(lValid, cTicket, cSetor)

Local cRet    := ""
Local lRet    := .F.
Local cQuery  := ""
Local aArea   := GetArea()

If lValid
	If !Empty(ALLTRIM(cTicket))
		Return .T.
	EndIf
EndIf

dbSelectArea("ZL2")
dbSetOrder(1)
dbSeek(xFILIAL("ZL2")+cSetor)
If Found() .And. xFILIAL("ZL2")+cSetor == ZL2->ZL2_FILIAL+ZL2->ZL2_COD
	cRet:= U_MaxCodigo("ZLD_TICKET")
	
	cRet := StrZero(Val(cRet)+1,6)
	If Empty(ALLTRIM(cRet))
		cRet:=StrZero(1,6)
	EndIf
	RecLock("ZL2",.F.)
	ZL2->ZL2_TICKET:= cRet
	MsUnLock()
	cTicket := cRet
	lRet:=.T.
Else
	xMagHelpFis("Setor","Setor nao encontrado!","Selecione um Setor v�lido!")
	If Empty(ALLTRIM(cSetor))
		lRet:=.T.
	EndIf
EndIf

ZL2->(DBCLOSEAREA())
RestArea(aArea)
Return lRet

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �GetNumRec � Autor � Jeovane               � Data da Criacao  � 11/09/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Funcao usada para pegar numero maximo de recebimento                                                         ���
���          �                  												                               				���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Implantacao das rotinas referente a Gestao do Leite.                						                    ���
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
���          �          �                               				   �                                  �   	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/
Static Function GetNumRec()

Local cRet   := ""
Local cQuery := ""
Local aArea  := GetArea()

cQuery := "SELECT MAX(ZLD_CODREC) AS ULTIMO FROM "
cQuery += RetSqlName("ZLD") + " WHERE D_E_L_E_T_ = ' ' "
cQuery += "  AND ZLD_FILIAL = '" + xFILIAL("ZLD") + "'"

If Select("TRB") > 0
	dbSelectArea("TRB")
	TRB->(DBCLOSEAREA())
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRB',.F.,.T.)

If TRB->(!Eof())
	cRet := soma1(TRB->ULTIMO)
EndIf

dbSelectArea("TRB")
TRB->(DBCLOSEAREA())

While !MayIUseCode("ZLD_CODREC" + xFilial("ZLD") + cRet)  //verifica se esta na memoria, sendo usado
	cRet := Soma1(cRet)						           // busca o proximo numero disponivel
EndDo

RestArea(aArea)

Return cRet

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �RepAnalise � Autor � Jeovane               � Data da Criacao  � 11/09/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Replica an�lise para o produtor que recebeu leite como pagamento                                             ���
���          �                  												                               				���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Implantacao das rotinas referente a Gestao do Leite.                						                    ���
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
���          �          �                               				   �                                  �   	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/
Static Function RepAnalise()

Local oModel 	:= FWModelActive() 
Local oStruZLJ	:= oModel:GetModel('ZLJMASTER')
Local oStruZLI  := oModel:GetModel('ZLIDETAIL')
Local _cAliasZLB := GetNextAlias()
Local _iGrid    := 0  
Local _nField   := 0
Local _nQtdfField := 0
Local _iCpo     := 0
Local _cRetiro  := "" 
Local _cLoja    := ""                         
Local _cCodTrf  := ""
Local _cExcCpo  := "ZLB_RETIRO/ZLB_RETILJ/R_E_C_N_O_/D_E_L_E_T_/ZLB_CODTRF/R_E_C_D_E_L_"
Local _nOpc      := oModel:GetOperation()
Local _lDelete   := _nOpc == 5

GetAnalises(oStruZLJ:GetValue("ZLJ_CODPRO") , oStruZLJ:GetValue("ZLJ_LOJPRO"), _cAliasZLB)

For _iGrid := 1 to oStruZLI:Length()
	
	oStruZLI:GoLine(_iGrid)
	_cRetiro := oStruZLI:GetValue("ZLI_CODPRO")
	_cLoja   := oStruZLI:GetValue("ZLI_LOJPRO")
	_cCodTrf := oStruZLJ:GetValue("ZLJ_CODIGO")

	If !oStruZLI:IsDeleted()
		
		dbSelectArea("ZLB")
		dbSetOrder(3)  //ZLB_FILIAL, ZLB_SETOR, ZLB_RETIRO, ZLB_RETILJ, ZLB_TIPOFX, ZLB_DATA, R_E_C_N_O_, D_E_L_E_T_
		
		dbSelectArea(_cAliasZLB)
		(_cAliasZLB)->(dbGoTop())
		_nQtdfField := FCount()
		
		While !(_cAliasZLB)->(Eof())
			
			dbSelectArea("ZLB")
			ZLB->(dbSetOrder(3))
			If !dbSeek(xFilial("ZLB") + (_cAliasZLB)->ZLB_SETOR + _cRetiro + _cLoja + (_cAliasZLB)->ZLB_TIPOFX + (_cAliasZLB)->ZLB_DATA)
				
				RecLock("ZLB", .t.)
				
				ZLB->ZLB_RETIRO := _cRetiro
				ZLB->ZLB_RETILJ := _cLoja
				ZLB->ZLB_CODTRF := oStruZLJ:GetValue("ZLJ_CODIGO")
				
				For _iCpo := 1 to _nQtdfField
					If !(Alltrim((_cAliasZLB)->(Field(_iCpo))) $ _cExcCpo)
						If ValType(&("ZLB->"+(_cAliasZLB)->(Field(_iCpo)))) == "D"
							&("ZLB->"+(_cAliasZLB)->(Field(_iCpo))) := StoD(&(_cAliasZLB+"->"+Field(_iCpo)))
						Else
							&("ZLB->"+(_cAliasZLB)->(Field(_iCpo))) := &(_cAliasZLB+"->"+Field(_iCpo))
						EndIf
						
					EndIf
				Next _iCpo
				
				ZLB->(MsUnLock())
				
			EndIf
			
			(_cAliasZLB)->(dbSkip())
			
		EndDo
    Else
    	ExcZlb(_cCodTrf, _cRetiro, _cLoja)
	EndIf

Next _iGrid

dbSelectArea(_cAliasZLB)
(_cAliasZLB)->(dbCloseArea())

Return()

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �GetAnalises�Autor  �Microsiga           � Data �  12/21/15   ���
�������������������������������������������������������������������������͹��
���Desc.     � Cria tabela temporaria para replica��o de an�lises        ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function GetAnalises(_pcProdutor, _pcLoja, _pcAlias)

Local _sData := RetDtAnalise(_pcProdutor, _pcLoja)

BeginSql Alias _pcAlias
	
	SELECT ZLB.*
	
	FROM %Table:ZLB% ZLB 
	
	WHERE ZLB_FILIAL = %xFilial:ZLB%
	AND ZLB_RETIRO   = %Exp:_pcProdutor%
	AND ZLB_RETILJ   = %Exp:_pcLoja%  
	AND ZLB_DATA    >= %Exp:_sData%
	AND ZLB.D_E_L_E_T_ = ' '
	
EndSql

Return    

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �RetDtAnalise �Autor  �Microsiga        � Data �  12/22/15   ���
�������������������������������������������������������������������������͹��
���Desc.     � Retorna data de ocorrencia de an�lise mais recente.       ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function RetDtAnalise(_pcProdutor, _pcLoja)

Local _aArea    := GetArea()
Local _cAliasDT := GetNextAlias()
Local _sData    := "" 

BeginSql Alias _cAliasDT

	SELECT MAX(ZLB_DATA) ZLB_DATA
	
	FROM %Table:ZLB% ZLB
	
	WHERE ZLB_FILIAL = %xFilial:ZLB%
	AND ZLB_RETIRO   = %Exp:_pcProdutor%
	AND ZLB_RETILJ   = %Exp:_pcLoja%
	AND ZLB.D_E_L_E_T_   =  ' '

EndSql

dbSelectArea(_cAliasDT)
(_cAliasDT)->(dbGoTop())

If !Empty((_cAliasDT)->ZLB_DATA)
	_sData := Left((_cAliasDT)->ZLB_DATA,6)+"01"
EndIf

(_cAliasDT)->(dbCloseArea())   

RestArea(_aArea)

Return(_sData)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �ExcZLB   �Autor  �Microsiga           � Data �  12/22/15   ���
�������������������������������������������������������������������������͹��
���Desc.     � Exclui dados de an�lises                                   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function ExcZlb(_pcCodTrf, _pcCodigo, _pcLoja)
                     
Local _aArea := GetArea()
Local _cAliasZLB := GetNextAlias()

BeginSql Alias _cAliasZLB
	
	SELECT R_E_C_N_O_
	
	FROM %Table:ZLB% ZLB
	
	WHERE ZLB_FILIAL = %xFilial:ZLB%
	AND ZLB_RETIRO   = %Exp:_pcCodigo%
	AND ZLB_RETILJ   = %Exp:_pcLoja%
	AND ZLB_CODTRF   = %Exp:_pcCodTrf%
	AND ZLB.D_E_L_E_T_ =  ' '
	
EndSql

 
dbSelectArea(_cAliasZLB)
(_cAliasZLB)->(dbGoTop())
While !(_cAliasZLB)->(Eof())
	
	dbSelectArea("ZLB")
	ZLB->(dbGoTo((_cAliasZLB)->R_E_C_N_O_))  
	
	RecLock("ZLB", .F.)
	ZLB->(dbDelete())
	ZLB->(MsUnLock())
	
	(_cAliasZLB)->(dbSkip())
	
EndDo
      
dbSelectArea(_cAliasZLB)
(_cAliasZLB)->(dbCloseArea())

RestArea(_aArea)

Return