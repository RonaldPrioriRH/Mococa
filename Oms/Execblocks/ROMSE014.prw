#Include 'Protheus.ch'

/*/{Protheus.doc} ROMSE014
PE OM200MNU 
Este ponto de entrada pode ser utilizado para inserir novas opções no array aRotina.
@author TOTVS
@since 29/03/2017
@version P12
@param nulo            
@return nulo
/*/

User Function ROMSE014()

	Local lHabFatAnt := GetMv("MV_XFATANT",,.F.)//Habilita Faturamento antecipado. 

	aadd(aRotina, {	"Calc. Frete (GFE) *" ,'U_GFE_DAI()' , 0 ,4 ,0 ,.F. })

	if lHabFatAnt

		aadd(aRotina, {	"A. Fat. *" ,'U_ROMSE016()' , 0 ,4 ,0 ,.F. })

	endif
	aadd(aRotina, {	"Faturar Carga*" ,'u_LEstCar(dak->dak_cod)' , 0 ,4 ,0 ,.F. })
	aadd(aRotina, {	"Dt Embarque *" ,'U_DTEMBRQ()' , 0 ,4 ,0 ,.F. })
	aadd(aRotina, {	"Sol.Transfer. (Ft.Triang)" ,'U_ROMSE14B()' , 0, 4, 0, .F. })
	aadd(aRotina, {	"NF Transferencia (Ft.Triang)" ,'U_ROMSE14A()' , 0, 4, 0, .F. })
	aadd(aRotina, {'Imprimir PickList','U_ROMSE14C()', 0, 2, 0, .F.})

Return

User Function ROMSE14A
	Local cRet := NIL
	if empty(DAK->DAK_XIDTRI)
		If !lRoboCarga
			MsgInfo("Carga não está em processo de Faturamento Triangular.")
			Return
		Else
			cRet := '2'  // Retorna para fazer que gera a solicitação
		Endif
	endif

	cRet := U_ROMSA003(DAK->DAK_XIDTRI)
	If lRoboCarga .and. empty(cRet)
		cRet := 'D'
	Endif
Return cRet

User Function ROMSE14B
	Default lrobocarga := .f.
	Local cRet := NIL
	if !empty(DAK->DAK_XIDTRI)
		If !lRoboCarga
			MsgInfo("Carga já está em processo de Faturamento Triangular.")
			Return cRet
		Else   
			cRet := '3'  // Transfere para etapa de processar transferencia
			//u_grvlogza5(cza5->za5_carlog,dak->dak_cod,"Carga já está em processo de Faturamento Triangular.",cRet,cza5->za5_filial)  // Com estoque liberado muda etapa para faturar nota
			Return cRet   // Indica que a etapa de liberação de estoque na rotina de robocarga foi concluida
		endif
	Endif

//	U_ROMSA002("",DAK->DAK_COD,.F./*lAuto*/)
	cRet := U_ROMSA002("",DAK->DAK_COD,lrobocarga/*lAuto*/)

Return cRet

User Function ROMSE14C

	U_ROMSR001(,DAK->DAK_COD)

Return()
