#INCLUDE "PROTHEUS.CH"
#INCLUDE 'FWMVCDEF.CH'
#INCLUDE 'TOTVS.CH'

//Constantes
#Define STR_PULA		Chr(13)+Chr(10)
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ AGLT305  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 12/11/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Rotina desenvolvida para possibilitar o cadastramento de Veiculos utilizados na coleta de leite nos retiros. บฑฑ
ฑฑบ          ณ   												                               				                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ CADASTRO DE VEICULOS.           						                                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function AGLT305()

Private oBrowse 	:= FwMBrowse():New()
Private bExclui   := {|| DelZ26() } 

oBrowse:SetAlias('Z26')
oBrowse:SetDescripton("Cadastro Medidor de Vazใo") 

oBrowse:SetAmbiente(.T.)
oBrowse:SetWalkThru(.T.)
//oBrowse:DisableDetails()
oBrowse:Activate()


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAFAT006   บAutor  ณTOTVS TM    บ Data ณ  21/02/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao para Menu do Browse                                  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Valoriza                                                   บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function MenuDef()

Local aRotina := {}
	
ADD OPTION aRotina TITLE 'Pesquisar'  ACTION 'PesqBrw'       	OPERATION 1 ACCESS 0
ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.AGLT305'	OPERATION 2 ACCESS 0
ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.AGLT305' 	OPERATION 3 ACCESS 0
//ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.AGLT305' 	OPERATION 4 ACCESS 0
ADD OPTION aRotina TITLE 'Excluir'    ACTION 'Eval(bExclui)' 	OPERATION 5 ACCESS 0
	
Return(aRotina)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAFAT006   บAutor  ณTOTVS TM    บ Data ณ  21/02/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao de Modelo de Dados.                                  บฑฑ
ฑฑบ          ณOnde ้ definido a estrutura de dados                        บฑฑ
ฑฑบ          ณRegra de Negocio.                                           บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Valoriza                                                   บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function ModelDef()


	Local oStruct1	:=	FWFormStruct(1,'Z26', /*bAvalCampo*/, /*lViewUsado*/ )
	Local oModel
	
	
	//oModel	:=	MpFormModel():New('ID_MODEL',/*Pre-Validacao*/,/*Pos-Validacao*/,/*Commit*/,/*Commit*/,/*Cancel*/)
    oModel	:=	MpFormModel():New('ID_MODEL',/*Pre-Validacao*/,{|oModel| TUDOOK(oModel)}/*Pos-Validacao*/,/*Commit*/,/*Commit*/,/*Cancel*/)
	
	oModel:AddFields('ID_MODEL_FLD_Z26', /*cOwner*/, oStruct1, /*bPreValidacao*/, /*{|oModel| ATUASB2(oModel)}*/, /*bCarga*/ )
		
	oModel:SetPrimaryKey({'Z26_COD'})
	
	oModel:SetDescription('Cadastro Medidor de Vazใo"')
	oModel:GetModel( 'ID_MODEL_FLD_Z26' ):SetDescription( 'Cadastro Medidor de Vazใo"' )
	
Return(oModel)


Static Function TUDOOK(oModel)

Local nOperation	:=	oModel:GetOperation()
Local oStruct	    :=	oModel:GetModel('ID_MODEL_FLD_Z26')
Local _nQtde        := ""
Local _cViagem      := ""
Local lret  		:= .F.  
Private lHabilita := SuperGetMv("MV_XATIVCO", .F. ,.F.)     
	
_nQtde := oStruct:GetValue("Z26_QTDE")
_cViagem := oStruct:GetValue("Z26_VIAGEM")	


//Inclusใo
If nOperation	==	3 .OR.   nOperation == 5   // Corre็ใo exclusใo Medidor de Vazใo

    If _nQtde <=0
		MsgInfo("Informe o Volume","Aten็ใo")
		return (.F.)
    ElseIF  Empty(_cViagem)
        MsgInfo("Informe a Viagem","Aten็ใo")
		return (.F.)
	ElseIF lHabilita == .F.
		xMagHelpFis("Mensagem","Aten็ใo, Integra็ใo com Coleta Desabilitada verifique o parametro MV_XATIVCO")
		return (.F.)
    Else
        lret := ExistZ26(xFilial("Z26"),_cViagem)
    Endif

	If lret == .T. .And. nOperation	==	3 .And. lHabilita == .T.
		msginfo("Importa็ใo Coleta Leite, Viagem: "  + _cViagem)
		u_MGLT022( /*ticket*/,_cViagem, _nQtde)
	EndIf

EndIf


Return lret

Static Function ExistZ26(cZ26Fil,cZ26Viag)
//Static function ExistViag(cZ19Fil,cZ19Viag)
Local lRet	 := .T.
Local cQuery := ""
	
cQuery := "	SELECT DISTINCT Z26_FILIAL, Z26_COD, Z26_VIAGEM, ZX1_STATUS, ZX1_VIAGEM FROM Z26010, ZX1010 "
cQuery += " WHERE Z26010.D_E_L_E_T_ = ' ' "
cQuery += "  AND ZX1010.D_E_L_E_T_ = ' ' "
cQuery += "  AND ZX1_FILIAL||ZX1_VIAGEM = '"+cZ26Fil+cZ26Viag+"' "
//cQuery += "  AND ZX1_STATUS = 'I' "
cQuery += "  AND Z26_VIAGEM = '"+cZ26Viag+"'"

if Select("TRBZ26") > 0
	dbSelectArea("TRBZ26")
	dbCloseArea("TRBZ26")
endif

MemoWrite("C:\temp\Z26ViagemExiste.sql",cQuery)

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRBZ26',.F.,.T.)


If TRBZ26->(!Eof()) 

	If TRBZ26->ZX1_STATUS == 'I'
		Help( ,, "Verifique cadastro de Recep็ใo de Leite",,"Aten็ใo, nใo ้ permitido utilizar a mesma Viagem: "  + cZ26Viag + " que jแ foi importada", 1, 0 )
		//xMagHelpFis("Mensagem","Aten็ใo, nใo ้ permitido utilizar a mesma Viagem: "  + cZ26Viag + " que jแ foi importada","Verifique cadastro de Recep็ใo de Leite.")
		//MsgAlert(+Chr(13)+,"Aten็ใo")
		lRet := .F.
	Else
		Help( ,, "Exclua o medidor errado para realizar nova importa็ใo",,"Aten็ใo, jแ existe o Medidor: "  + TRBZ26->Z26_COD + " com estแ viagem", 1, 0 )
		//xMagHelpFis("Mensagem","Aten็ใo, jแ existe o Medidor : "  + TRBZ26->Z26_COD + " com estแ viagem","Exclua o medidor errado para realizar nova importa็ใo.")
		//MsgAlert(+Chr(13)+,"Aten็ใo")
		lRet := .F.
	EndIf

EndIF

Return(lRet)


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAFAT006   บAutor  ณTOTVS TM    บ Data ณ  21/02/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao de Visualizacao.                                     บฑฑ
ฑฑบ          ณOnde ้ definido a visualizacao da Regra de Negocio.         บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Valoriza                                                   บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function ViewDef()
	Local oStruct1	:=	FWFormStruct(2,'Z26')
	Local oModel	:=	FwLoadModel('AGLT305') 
	Local oView		:=	FwFormView():New()
	
	oView:SetModel(oModel)	
	oView:AddField( 'ID_VIEW_FLD_Z26', oStruct1, 'ID_MODEL_FLD_Z26')
		
	oView:CreateHorizontalBox( 'ID_HBOX_100', 100 ) 
	oView:SetOwnerView( 'ID_VIEW_FLD_Z26', 'ID_HBOX_100' )

Return(oView)



/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณChkZ26    ณ Autor ณMicrosiga              ณ Data ณ 00.00.00 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ Funcao para validar a exclusao.                            ณฑฑ
ฑฑณ          ณ Verifica se nao existem Veiculos, amarrados ao motorista.  ณฑฑ
ฑฑณ          ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ AGLT305()                                                  ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function ChkZ26(_cCod,_cViagem)

Local cQuery := ""
Local aArea  := GetArea()
Local nCont  := 0

	cQuery := ""
	cQuery += "SELECT   COUNT (ZLD_TICKET) AS COLETAS, ZLD_TICKET"		+ STR_PULA
	cQuery += "  FROM      ZX1010"		+ STR_PULA
	cQuery += "            LEFT JOIN Z26010"		+ STR_PULA
	cQuery += "            ON Z26010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQuery += "               AND ZX1_FILIAL || ZX1_VIAGEM = Z26_FILIAL || Z26_VIAGEM"		+ STR_PULA
	cQuery += "         LEFT JOIN ZLD010"		+ STR_PULA
	cQuery += "         ON ZLD010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQuery += "               AND   ZX1_FILIAL"		+ STR_PULA
	cQuery += "                   || ZX1_ITEM"		+ STR_PULA
	cQuery += "                   || ZX1_DTCOLE"		+ STR_PULA
	cQuery += "                   || ZX1_SETOR"		+ STR_PULA
	cQuery += "                   || ZX1_RETIRO"		+ STR_PULA
	cQuery += "                   || ZX1_RETILJ"		+ STR_PULA
	cQuery += "                   || ZX1_QTDBOM"		+ STR_PULA
	cQuery += "                   || ZX1_LINROT"		+ STR_PULA
	cQuery += "                   || ZX1_VERSAO"		+ STR_PULA
	cQuery += "                   || ZX1_VEICUL"		+ STR_PULA
	cQuery += "                   || ZX1_MOTOR = ZLD_FILIAL"		+ STR_PULA
	cQuery += "                                  || ZLD_ITEM"		+ STR_PULA
	cQuery += "                                  || ZLD_DTCOLE"		+ STR_PULA
	cQuery += "                                  || ZLD_SETOR"		+ STR_PULA
	cQuery += "                                  || ZLD_RETIRO"		+ STR_PULA
	cQuery += "                                  || ZLD_RETILJ"		+ STR_PULA
	cQuery += "                                  || ZLD_QTDBOM"		+ STR_PULA
	cQuery += "                                  || ZLD_LINROT"		+ STR_PULA
	cQuery += "                                  || ZLD_VERSAO"		+ STR_PULA
	cQuery += "                                  || ZLD_VEICUL"		+ STR_PULA
	cQuery += "                                  || ZLD_MOTOR"		+ STR_PULA
	cQuery += " WHERE       ZX1010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQuery += "         AND Z26_VIAGEM = '"+_cViagem+"'"		+ STR_PULA
	//cQuery += "         AND Z26_COD    = '"+_cCod+"'"		+ STR_PULA
	cQuery += "         AND Z26_FILIAL = '"+xFilial("Z26")+"' "	+ STR_PULA
	cQuery += "         AND ZX1_STATUS = 'I'"		+ STR_PULA
	cQuery += " GROUP BY   ZLD_TICKET"		+ STR_PULA

	If Select("TRB") > 0
		dbSelectArea("TRB")
		dbCloseArea("TRB")
	EndIf

	MemoWrite("C:\temp\Z26Valid.sql",cQuery)

	dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(UpPer(cQuery))),'TRB',.F.,.T.)

	If TRB->(!Eof())
		nCont 	:= TRB->COLETAS
		cTicket	:= TRB->ZLD_TICKET
	EndIf

	dbSelectArea("TRB")
	dbCloseArea("TRB")

	RestArea(aArea)

	If nCont > 0
		xMagHelpFis("Mensagem","Aten็ใo, existem lan็amentos de recep็ใo de leite: " + cTicket + " para este registro!","Verifique cadastro de Recep็ใo de Leite.")
		//MsgAlert(+Chr(13)+,"Aten็ใo")
	EndIf

Return nCont == 0


Static Function DelZ26()

Local _aAlias  := GetArea()
Local _nOrd26  := Z26->(IndexOrd())
Local _nRecZ26 := Z26->(Recno())

//Verifica se existem Linhas e Recpecao de Leite relacionados a este setor
If (u_ChkZ26(Z26->Z26_COD,Z26->Z26_VIAGEM))
	//axDeleta(_cAlias,_nRecZL4,nOpcao)	
	lOk := ( FWExecView('Valida็ใo de Exclusใo','AGLT305', MODEL_OPERATION_DELETE,, ,  ) == 0 )
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณRestaura o Ambiene.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
RestArea(_aAlias)

Return()
