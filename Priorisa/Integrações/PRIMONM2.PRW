#INCLUDE "totvs.ch"
#INCLUDE "protheus.ch"
#INCLUDE "parmtype.ch"
#include 'fwmvcdef.ch'
#Include 'FWEditPanel.ch'

Static cCamposSe1 := "C2TPOP-C2_DIASOCI"

/*/{Protheus.doc} User Function UNIPIXM2
    (long_description)
    @type  Function
    @author user
    @since 16/01/2023
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User function UNIPIXM2


return


Static function ModelDef()
	Local oModel 	 	as object
	Local oStrSC2  	    := FWFormStruct( 1, 'SC2',  )
	Local oStrZZ6  	    := FWFormStruct( 1, 'ZZ6',  )
	Local aRelation     := {{"ZZ6_FILIAL", "E1_FILIAL"}, {"ZZ6_PREFIX", "E1_PREFIXO"},{"ZZ6_NUM","E1_NUM"},{"ZZ6_PARCEL","E1_PARCELA"},{"ZZ6_TIPO","E1_TIPO"}}

	oModel    := MPFormModel():New( 'MDLUNIPIXM2' , /*bPre*/ , /*{|oModel| TudoOk(oModel) }*/ ,/*{|oModel| CommitMdl(oModel) }*/,/*{|oModel| CancelMdl(oModel) } */)

	oStrSC2:SetProperty("*", MODEL_FIELD_WHEN, {|| .F. })
	oStrZZ6:SetProperty("*", MODEL_FIELD_WHEN, {|| .F. })

	IF !FWIsInCallStack('U_gravaDetahamentoIntegracao')
		oStrZZ6:SetProperty("ZZ6_MSGENV", MODEL_FIELD_WHEN, {|| .T. })
		oStrZZ6:SetProperty("ZZ6_MSGRET", MODEL_FIELD_WHEN, {|| .T. })
		oStrZZ6:SetProperty("ZZ6_ERRO"	, MODEL_FIELD_WHEN, {|| .T. })
	EndIF

	oModel:addFields('SE1MASTER',,oStrSC2)
	oModel:addGrid('ZZ6DETAIL','SC2MASTER',oStrZZ6)
	oModel:SetRelation("ZZ6DETAIL",aRelation , ZZ6->(IndexKey(2))) //SE1->(E1_FILIAL + E1_PREFIXO + E1_NUM + E1_PARCELA + E1_TIPO + E1_XSTAINT
	oModel:SetPrimaryKey({"ZZ6_FILIAL", "ZZ6_PREFIX", "ZZ6_NUM", "ZZ6_PARCEL", "ZZ6_TIPO", "ZZ6_STATUS"})
	oModel:SetDescription("Detalhamento Monitor Pix")

	IF !FWIsInCallStack('U_gravaDetahamentoIntegracao')
		oModel:GetModel("ZZ6DETAIL"):SetNoInsertLine(.T.)	//Nao inseri linhas
		oModel:GetModel("ZZ6DETAIL"):SetNoDeleteLine(.T.)
	Endif

return oModel

Static Function ViewDef()
	Local oModel    := ModelDef()
	Local oView     := FWFormView():New()
	Local oStruSE1  := FWFormStruct(2,'SC2', { |cCampo | AllTrim(cCampo) $ cCamposSe1 })
	Local oStruZZ6  := FWFormStruct(2,'ZZ6')

	oStruZZ6:RemoveField("ZZ6_FILIAL")
	oStruZZ6:RemoveField("ZZ6_PREFIX")
	oStruZZ6:RemoveField("ZZ6_NUM")
	oStruZZ6:RemoveField("ZZ6_PARCEL")
	oStruZZ6:RemoveField("ZZ6_TIPO")

	oView:SetModel(oModel)
	oView:addField('VIEW_SE1',oStruSE1, "SE1MASTER")
	oView:addGrid('VIEW_ZZ6',oStruZZ6, "ZZ6DETAIL")

	oView:CreateHorizontalBox("BOX_SE1", 30)
	oView:CreateHorizontalBox("BOX_ZZ6", 70)

	oView:SetOwnerView("VIEW_SE1" , "BOX_SE1")
	oView:SetOwnerView("VIEW_ZZ6" , "BOX_ZZ6")

	oView:EnableTitleView("VIEW_SE1" , "Titulos a receber")
	oView:EnableTitleView("VIEW_ZZ6" , "Detalhamento")

	oView:ShowUpdateMsg(.F.)
	oView:showInsertMsg(.F.)

	oView:SetAfterViewActivate({ | oView | setModify(oView,oModel)})

Return oView

Static Function setModify(oView,oModel)
	Default oView         := FwViewActive()
	Default oModel        := FwModelActive()

	oView:lModify  	:=  .T.
	oModel:lModify  :=  .T.
return
