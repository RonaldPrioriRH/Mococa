#include "protheus.ch" 
#include "fwmvcdef.ch"

/*/{Protheus.doc} RFATE001
Realiza inclusão de clientes X Cláusula - Contratos
@author TOTVS
@since 08/03/2017
@version P12
@param Nao recebe parametros            
@return nulo
/*/

/**********************/
User Function RFATE001()
/**********************/

Local lRet			:= .T.
Local nCont			:= 0

Local oModel		:= FWModelActive()    
Local oView			:= FWViewActive()

Local oModelZ11 	:= oModel:GetModel("Z11DETAIL")

If !Empty(M->Z09_CLIENT) //Cliente selecionado
	
	//Se a primeira linha não estiver em branco, insiro uma nova linha
	If !Empty(oModelZ11:GetValue("Z11_CLIENT")) 
		oModelZ11:DelAllLine()
		oModelZ11:AddLine()
		oModelZ11:GoLine(oModelZ11:Length())
   	Endif
   	
	oModelZ11:SetValue("Z11_CLIENT",M->Z09_CLIENT)
	oModelZ11:SetValue("Z11_LOJA",M->Z09_LOJA)	
	oModelZ11:SetValue("Z11_TITAPU","S")	
Else 

	If !Empty(M->Z09_GRPCLI) //Grupo de clientes selecionado
	
		DbSelectArea("SA1")
		SA1->(DbSetOrder(6)) //A1_FILIAL+A1_GRPVEN
		
		If SA1->(DbSeek(xFilial("SA1")+M->Z09_GRPCLI))
		
			While SA1->(!EOF()) .And. SA1->A1_FILIAL == xFilial("SA1") .And. SA1->A1_GRPVEN == M->Z09_GRPCLI
	
				//Se a primeira linha não estiver em branco, insiro uma nova linha
				If !Empty(oModelZ11:GetValue("Z11_CLIENT"))
					
					If nCont := 0 
						oModelZ11:DelAllLine()
					Endif
					oModelZ11:AddLine()
					oModelZ11:GoLine(oModelZ11:Length())
			   	Endif
					   			
				//Utilizado LoadValue em função dos gatilhos desposicionarem a SA1
				oModelZ11:LoadValue("Z11_CLIENT",SA1->A1_COD)
				oModelZ11:LoadValue("Z11_LOJA",SA1->A1_LOJA)
				oModelZ11:LoadValue("Z11_NOME",SA1->A1_NOME)
				oModelZ11:LoadValue("Z11_CGC",SA1->A1_CGC)
				oModelZ11:LoadValue("Z11_TITAPU","N")	
			
				nCont++
				SA1->(DbSkip())
			EndDo
		Endif
	Endif
Endif

oModelZ11:GoLine(1)

If oView <> Nil
	oView:Refresh() 
EndIf

Return lRet