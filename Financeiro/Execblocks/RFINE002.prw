#Include 'Protheus.ch'
#INCLUDE "topconn.ch"

/*/{Protheus.doc} RFINE002

Comissão:
Grava motivo de devoluçao de NF de saída, nos movimentos de comissão negativos
Chamado no ponto de entrada MT103FIM
Ja vem posicionado no SF1

@author Danilo Brito
@since 20/03/2017
@version P12
@param Nao recebe parametros
@return xRet
/*/
User Function RFINE002(nOpcao,nConfirma)

	Local cQry 		:= ""
	Local aArea 	:= GetArea()
	Local aAreaSF1 	:= SF1->(GetArea())
	Local aAreaSE3 	:= SE3->(GetArea())
	Local nPNFOri 	:= aScan(aHEADER,{|x| Trim(x[2])=="D1_NFORI"})
	Local lDevolu	:= .F.

	if IsBlind() //se rotina automatica
		Return
	endif

	if nConfirma <> 1 .OR. nOpcao <> 3 //se não confirmou tela ou não é inclusao
		 Return
	endif

	//verifico se é nota de devolução de vendas,
	lDevolu := aScan(aCols, {|x| !empty(x[nPNFOri]) }) > 0

	if !lDevolu .OR. SF1->F1_TIPO <> "D" //se não é nota de devolução de venda
		Return
	endif

	//se motivo não foi preenchido, abre tela para obrigar
	if empty(SF1->F1_MOTRET)
		SelMotDev()
	endif

	cQry := " SELECT R_E_C_N_O_ FROM " + RetSqlName("SE3")
	cQry += " WHERE D_E_L_E_T_ <> '*' "
	cQry += "   AND E3_FILIAL = '"+xFilial("SE3")+"'"
	cQry += "   AND E3_NUM = '"+SF1->F1_DOC+"'"
	cQry += "   AND E3_SERIE = '"+SF1->F1_SERIE+"'"
	cQry += "   AND E3_CODCLI = '"+SF1->F1_FORNECE+"'"
	cQry += "   AND E3_LOJA = '"+SF1->F1_LOJA+"'"
	cQry += "   AND E3_TIPO = 'NCC'"
	cQry += "   AND E3_ORIGEM = 'D'" //devoluçao

	If Select("QAUXCOM") > 0
		QAUXCOM->(dbCloseArea())
	EndIf

	cQry := ChangeQuery(cQry)
	dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUXCOM", .F., .T.)

	BeginTran()

	DbSelectArea("SE3")
	While QAUXCOM->(!Eof())

		//posiciono no item comissão
		SE3->(DbGoTo( QAUXCOM->R_E_C_N_O_ ))

		//gravo motivo na comissão
		RecLock("SE3", .F.)
			SE3->E3_XMOTDEV := SF1->F1_MOTRET
		SE3->(MsUnlock())

		QAUXCOM->(DbSkip())
	Enddo

	EndTran()

	QAUXCOM->(dbCloseArea())

	RestArea(aAreaSE3)
	RestArea(aAreaSF1)
	RestArea(aArea)

Return

//---------------------------------------
// tela de seleçao do motivo devoluçao
//---------------------------------------
Static Function SelMotDev()

	Private cMotivo := Space(TamSX3("F1_MOTRET")[1])
	Private cDesMot := ""
	Private cHisMot := ""

	Private oDlgMD

	DEFINE MSDIALOG oDlgMD TITLE "Motivo Devolução" FROM 0,0 TO 300, 600 PIXEL STYLE DS_MODALFRAME
	oDlgMD:lEscClose := .F.

	TGroup():New(10,05,120,297,'Informe o Motivo de Devolução',oDlgMD,,,.T.)

	TSay():New( 32, 10,{|| "Código" }, oDlgMD,,,,,,.T.,CLR_BLACK,,50,9 )
	TGet():New( 30, 50, {|u| iif( PCount()==0,cMotivo,cMotivo:= u) },oDlgMD,45,12,,{|| VldMot() },,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.F.,.F.,"DHI","DHI_CODIGO",,,,.T.,.F.)
	TGet():New( 30, 100, {|u| iif( PCount()==0,cDesMot,cDesMot:= u) },oDlgMD,160,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .F.},.F.,.F.,/*bChange*/,.F.,.F.,,"cDesMot",,,,.T.,.F.)

	TSay():New( 52, 10,{|| "Histórico" }, oDlgMD,,,,,,.T.,CLR_BLACK,,50,9 )
	TMultiGet():new(50,50,{|u| iif( PCount()==0,cHisMot,cHisMot:= u)},oDlgMD,220,50,,,,,,.T.)

	TButton():New( 125, 240, "Confirmar", oDlgMD,{|| iif(VldMot(),oDlgMD:End(),MsgInfo("Informe o motivo da devolução!","Atenção")) }, 50,16,,,.F.,.T.,.F.,,.F.,,,.F. )

	oDlgMD:lCentered := .T.
	oDlgMD:Activate()

	//gravo motivo
	RecLock("SF1", .F.)
		SF1->F1_MOTRET := cMotivo
		SF1->F1_HISTRET := cHisMot
	SF1->(MsUnlock())

Return

//Valida campo motivo de devoluçao
Static Function VldMot()

	cDesMot := Posicione("DHI",1,xFilial("DHI")+cMotivo,"DHI_DESCRI")
	oDlgMD:Refresh()

Return !empty(cDesMot)

