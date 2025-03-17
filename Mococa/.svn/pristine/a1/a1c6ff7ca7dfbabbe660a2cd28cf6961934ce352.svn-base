#INCLUDE "PROTHEUS.CH"
#INCLUDE 'FWMVCDEF.CH'
#INCLUDE 'TOTVS.CH'
#include "topconn.ch"
#Include "Colors.ch" 

	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ ROMSA005  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 12/11/2008                						บฑฑ
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
User Function ROMSA005()

Private oBrowse 	:= FwMBrowse():New()
//Private bExclui   := {|| DelZ29() } // falta valida็ใo para nใo deixar excluir quando tiver Z29 CADSTRADA
Private bAtualiza   := {|| Grvz29() } 


oBrowse:SetAmbiente(.T.)
oBrowse:SetWalkThru(.T.)

oBrowse := FWmBrowse():New()
oBrowse:SetAlias('Z29')
oBrowse:SetDescripton("Embarque") 

oBrowse:AddLegend("Z29_STATUS == 'B' ", 	"WHITE",	    "Nใo Embarcado") 
oBrowse:AddLegend("Z29_STATUS == 'D' ", 	"BLACK",	    "Com Devolu็ใo") 
oBrowse:AddLegend("Z29_STATUS == 'A' ", 	"BLUE",	    	"Atrasado") 
oBrowse:AddLegend("Z29_STATUS == 'P' ", 	"GREEN",		"Pendente") 
oBrowse:AddLegend("Z29_STATUS == 'E' ", 	"YELLOW",		"Entregue no Prazo") 
oBrowse:AddLegend("Z29_STATUS == 'F' ", 	"RED",	    	"Entregue fora do Prazo") 
oBrowse:AddLegend("Z29_STATUS == 'C' ", 	"GRAY",	    	"Cancelada") 

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
	
ADD OPTION aRotina TITLE 'Pesquisar'  		ACTION 'PesqBrw'       		OPERATION 1 ACCESS 0
ADD OPTION aRotina TITLE 'Visualizar'		ACTION 'VIEWDEF.ROMSA005'	OPERATION 2 ACCESS 0
ADD OPTION aRotina TITLE 'Atualiza Dados'   ACTION 'Eval(bAtualiza)'	OPERATION 3 ACCESS 0
//ADD OPTION aRotina TITLE 'Imprimir'   		ACTION 'U_RELSTATU()'		OPERATION 8 ACCESS 0 // Gera mesmo erro quando tento imprimir periodo maior
ADD OPTION aRotina TITLE 'Legenda'     		ACTION 'U_LogistLeg()'  	OPERATION 10 ACCESS 0    

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


	Local oStruct1	:=	FWFormStruct(1,'Z29', /*bAvalCampo*/, /*lViewUsado*/ )
	Local oModel
	
	
	//oModel	:=	MpFormModel():New('ID_MODEL',/*Pre-Validacao*/,/*Pos-Validacao*/,/*Commit*/,/*Commit*/,/*Cancel*/)
    oModel	:=	MpFormModel():New('ID_MODEL',/*Pre-Validacao*/,{|oModel| TUDOOK(oModel)}/*Pos-Validacao*/,/*Commit*/,/*Commit*/,/*Cancel*/)
	
	
	oModel:AddFields('ID_MODEL_FLD_Z29', /*cOwner*/, oStruct1, /*bPreValidacao*/, /*{|oModel| ATUASB2(oModel)}*/, /*bCarga*/ )
		
	oModel:SetPrimaryKey({'Z29_FILIAL','Z29_CARGA',})
	
	oModel:SetDescription('Embarque')
	oModel:GetModel( 'ID_MODEL_FLD_Z29' ):SetDescription( 'Embarque' )
	
Return(oModel)



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
	Local oStruct1	:=	FWFormStruct(2,'Z29')
	Local oModel	:=	FwLoadModel('ROMSA005') 
	Local oView		:=	FwFormView():New()
	
	oView:SetModel(oModel)	
	oView:AddField( 'ID_VIEW_FLD_Z29', oStruct1, 'ID_MODEL_FLD_Z29')
		
	oView:CreateHorizontalBox( 'ID_HBOX_100', 100 ) 
	oView:SetOwnerView( 'ID_VIEW_FLD_Z29', 'ID_HBOX_100' )

Return(oView)


//Grava็ใo dos Dados Z29 - Embarque
Static Function Grvz29()
Local 	aArea 		:= GetArea()
Local	cQry        := ""
Local 	cEol        := chr(13)+chr(10)

	cQry:=  " SELECT (CASE   " +cEOL
	cQry+=  "        	WHEN STATUS = 'ENTR NO PRAZO' THEN 'E'  " +cEOL
	cQry+=  "        	WHEN STATUS = 'ENTR PENDENTE' THEN 'P' " +cEOL
	cQry+=  "       	WHEN STATUS = 'ENTR ATRASADA' THEN 'A' " +cEOL
	cQry+=  "        	WHEN STATUS = 'ENTR COM ATRASO' THEN 'F'  " +cEOL
	cQry+=  "        	WHEN STATUS = 'NAO EMBARC' THEN 'B'  " +cEOL
	cQry+=  "        	WHEN STATUS = 'COM DEVOL' THEN 'D'  " +cEOL
	cQry+=  "        	WHEN STATUS = 'NF CANCELADA' THEN 'C'  " +cEOL
	cQry+=  "        END) ENTREGAS, PBI_FACOMPENTREGA.* FROM    PBI_FACOMPENTREGA   " +cEOL
	//WHERE NUMNOTA IN  ('000166388','000166389','000045280')   " +cEOL        

		MemoWrite("C:\temp\Z29Grav2.sql",cQry)

		cQry := ChangeQuery(cQry)

		if Select("TRB") > 0
			TRB->(DbCloseArea())
		endif

		TcQuery cQry New Alias "TRB"

		dbSelectArea("TRB")
		TRB->(dbGoTop())

		Z29->(DbSelectArea("Z29"))
		Z29->(DbSetOrder(1))
		Z29->(DbGotop())
		
		While !TRB->(Eof()) //.AND. Z29->(DbSeek(TRB->FILIAL+TRB->NR_NOTA)) 
			//Se nใo existe na tabela inclui 
			IF  !Z29->(DbSeek(ALLTRIM(TRB->CD_FILIALNF)+TRB->NUMNOTA+ALLTRIM(TRB->NR_CARREG)))
				
				RecLock("Z29",.T.)				
				Z29->Z29_FILIAL		:= TRB->CD_FILIALNF
				Z29->Z29_DOC		:= ALLTRIM(TRB->NUMNOTA) 
				Z29->Z29_CARGA		:= TRB->NR_CARREG
				Z29->Z29_DATEMI		:= TRB->DT_FATNFE //emissใo da nota
				Z29->Z29_DATEMB		:= TRB->DT_SAIDA //data embarque
				Z29->Z29_DATPRE		:= TRB->DT_PREV_ENT //data prevista de entrega
				Z29->Z29_DATREA		:= TRB->DT_ENTREGA  //data real de entrega
				Z29->Z29_CODCLI		:= SubStr(TRB->COD_CLIENTE, 1, 6)
				Z29->Z29_LOJACLI 	:= SubStr(TRB->COD_CLIENTE, 8, 2)
				Z29->Z29_NOME 		:= TRB->CLIENTE
				Z29->Z29_STATUS 	:= TRB->ENTREGAS
				Z29->Z29_ENTREG     := TRB->STATUS
				Z29->Z29_DATDEV		:= TRB->DT_DEVOL
				Z29->Z29_TPCARG		:= TRB->TIPO_CARGA
		
				Z29->(MsUnlock())

			TRB->(DbSkip())
			
			//Se existe e os campos forem modificados altera
			Elseif Z29->(DbSeek(ALLTRIM(TRB->CD_FILIALNF)+TRB->NUMNOTA+ALLTRIM(TRB->NR_CARREG))) .AND. (TRB->DT_PREV_ENT <>  Z29->Z29_DATPRE;
														 .OR. TRB->DT_ENTREGA <> Z29->Z29_DATREA .OR. TRB->DT_SAIDA <> Z29->Z29_DATEMB  )
			//Elseif Z29->(DbSeek(ALLTRIM(TRB->CD_FILIALNF)+TRB->NUMNOTA+ALLTRIM(TRB->NR_CARREG))) .AND. (TRB->DT_PREV_ENT <>  Z29->Z29_DATPRE;
			//											 .OR. TRB->DT_ENTREGA <> Z29->Z29_DATREA .OR. TRB->DT_SAIDA <> Z29->Z29_DATEMB  )
				RecLock("Z29",.F.)
				Z29->Z29_DATPRE		:= TRB->DT_PREV_ENT //data prevista de entrega
				Z29->Z29_DATREA     := TRB->DT_ENTREGA //data real de entrega
				Z29->Z29_STATUS 	:= TRB->ENTREGAS // legendas
				Z29->Z29_ENTREG     := TRB->STATUS  //descri็ใo
				Z29->Z29_DATEMB		:= TRB->DT_SAIDA  //data embarque
				Z29->Z29_DATDEV		:= TRB->DT_DEVOL  //data devolu็ใo

				Z29->(MsUnlock())

			TRB->(DbSkip())
			Else
				//Aviso("Aviso","Ja existe essa Carga!"+TRB->FAT_FILIAL +  TRB->NR_NOTA +  ALLTRIM(TRB->NR_CARREG),{"Ok"})
				TRB->(DbSkip())				
			endif
		enddo

		Aviso("Aviso","Processado com sucesso!",{"Ok"})

		//Else
		//Aviso("Aviso","Ja existe essa NF!"+TRB->FILIAL+TRB->NR_NOTA,{"Ok"})
		//endif	

RestArea(aArea)

return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ RFAT006L บ Autor ณ Raphael Martins		 Dataณ 22/03/2017 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Legenda do browser										  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Aviso Urgente	                                          บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function LogistLeg()

BrwLegenda("Status da Entrega","Legenda",{{"BR_VERDE","Pendente"},;
										  {"BR_AZUL","Atrasado"},;
										  {"BR_AMARELO","Entregue no Prazo"},;
										  {"BR_VERMELHO","Entregue fora do Prazo"},;
										  {"BR_BRANCO","Nใo Embarcado"},;
										  {"BR_PRETO","Com Devolu็ใo"},;
										  {"BR_CINZA","NF Cancelada"} })

Return()
