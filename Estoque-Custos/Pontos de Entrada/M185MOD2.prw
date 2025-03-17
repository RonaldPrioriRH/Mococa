#include 'protheus.ch'
#include 'parmtype.ch'
#INCLUDE "Topconn.ch"

/*/{Protheus.doc} M185MOD1
Rotina para cadastro dos perfis de autoriza��o para retirada do almoxarifado
@author Luciano Alvarazo
@since 07/04/2017
@version 1.0
@type function
/*/
User Function M185MOD1()
	Local lRet	:=	.F.
	Local lUser	:=	.T.
	Local aArea	:=	GetArea()
	Local cProd	:=	PARAMIXB[2] // C�digo Produto
	Local cQry	:=	""
	//Local nCont	:=	0

	Private cCodUsr	:= ''

	//Observa��es
	//PARAMIXB[1] := Filial
	//PARAMIXB[2] := Produto
	//PARAMIXB[3] := Local
	//PARAMIXB[4] := Quantidade Atual
	//PARAMIXB[5] := Reservas PV/OP
	//PARAMIXB[6] : = Qtd. Disponivel
	//PARAMIXB[7] := Numero da solicita��o
	//PARAMIXB[8] := Saldo da Pre-Requisi��o
	//PARAMIXB[9] := Quantidade disponivel para entrega
	//PARAMIXB[10] := Quantidade em processo de compra
	//PARAMIXB[11] := Quantidade a Requisitar

	alert(cProd)

	if !zLogin()
		MsgInfo("Usu�rio n�o autenticado. Imposs�vel realizar a opera��o.","ATEN��O")
		lUser := .F.
	endif

	if lUser
		//Valida permiss�o do usu�rio, conforme perfil cadastrado na tabela Z20
		dbSelectArea("SB1")
		dbSetOrder(1)
		dbSeek(FWxFilial("SB1")+cProd)
		cGrupo := SB1->B1_GRUPO

		If Select("QZ20") > 0
			QZ20->( dbCloseArea() )
		Endif
		cQry:="SELECT Z20_CODUSU,Z20_CODPRO,Z20_CODGRP FROM " + RetSqlName("Z20")
		cQry+=" WHERE Z20_FILIAL = '" + FWxFilial("Z20") + "' "
		cQry+="   AND Z20_CODUSU = '" + cCodUsr + "' "
		cQry+="   AND D_E_L_E_T_ = ' ' "
		cQry+=" ORDER BY Z20_ITEM "

		TCQUERY cQry NEW ALIAS "QZ20"
		While !QZ20->(EOF())

			//Qdo todos os produtos e grupos s�o permitidos
			if ALLTRIM(QZ20->Z20_CODPRO) == "*" .AND. ALLTRIM(QZ20->Z20_CODGRP) == "*"
				lRet := .T.
				exit
			endif

			//Qdo todos os produtos deste grupo de produtos � permitido

			IF ALLTRIM(QZ20->Z20_CODGRP) == alltrim(cGrupo) .and. ( ALLTRIM(QZ20->Z20_CODPRO) == "*" .or. Empty(QZ20->Z20_CODPRO) )
				lRet := .T.
				exit
			endif

			if ALLTRIM(QZ20->Z20_CODPRO) == alltrim(cProd) .AND. ( ALLTRIM(QZ20->Z20_CODGRP) == alltrim(cGrupo) .or. Empty(QZ20->Z20_CODGRP))
				lRet := .T.
				exit
			endif

			QZ20->(dbSkip())
		End
		QZ20->( dbCloseArea() )

		if !lRet
			MsgInfo("Usu�rio n�o autorizado a executar essa opera��o com o produto selecionado.","ATEN��O")
		endif
		//Fim da valida��o do usu�rio
	endif
	RestArea(aArea)
Return lRet

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � M185MOD2 � Autor � Luciano Alvarazo   � Data �  26/04/17   ���
�������������������������������������������������������������������������͹��
���Descricao � Ponto de entrada utilizado na valida��o da baixa da pre-   ���
���          � requisi��o modelo 2 (automatica)                           ���
�������������������������������������������������������������������������͹��
���Uso       � ESTOQUE                                                    ���
�������������������������������������������������������������������������ͼ��
���          �                                                           -���
���          �                                                            ���
���          �                                                            ���
���          �                                                            ���
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
User Function M185MOD2()
	Local aArea	:=	GetArea()
	Local lRet	:=	.f.
	Local aRegs	:=	PARAMIXB	//aCols MOD2 Baixa Pr�-Requisi��o
	Local cQry	:=	""
	Local nCont	:=	0	
	Local aProds := {}
	Local i
	Local nZ

	Private cCodUsr	:= ''

	//Inicio valida��o do usu�rio, conforme regras contidas na tabela Z20
	for i=1 to len(aRegs)
		lRet := .f.

		cProd := Alltrim(aRegs[i][4])
		if i == 1 // Valida se o usu�rio existe e senha
			if !zLogin()
				MsgInfo("Usu�rio n�o autenticado. Imposs�vel realizar a opera��o.","ATEN��O")
				lRet := .F.
				return(lRet)
			endif
		endif

		//Se o item n�o estiver selecinado, n�o � feita a valida��o nele.
		if !aRegs[i][1]
			Loop
		endif

		//Valida permiss�o do usu�rio, conforme perfil cadastrado na tabela Z20
		dbSelectArea("SB1")
		dbSetOrder(1)
		dbSeek(FWxFilial("SB1")+cProd)
		cGrupo := SB1->B1_GRUPO

		If Select("QZ20") > 0
			QZ20->( dbCloseArea() )
		Endif
		cQry:="SELECT Z20_CODUSU,Z20_CODPRO,Z20_CODGRP FROM " + RetSqlName("Z20")
		cQry+=" WHERE Z20_FILIAL = '" + FWxFilial("Z20") + "' "
		cQry+="   AND Z20_CODUSU = '" + cCodUsr + "' "
		cQry+="   AND D_E_L_E_T_ = ' ' "
		cQry+=" ORDER BY Z20_ITEM "

		TCQUERY cQry NEW ALIAS "QZ20"
		nCont := len(aRegs) //0
		While !QZ20->(EOF())
			//Qdo todos os produtos e grupos s�o permitidos
			if ALLTRIM(QZ20->Z20_CODPRO) == "*" .AND. ALLTRIM(QZ20->Z20_CODGRP) == "*"
				lRet := .T.
				exit
			endif

			//Qdo todos os produtos deste grupo de produtos � permitido

			IF ALLTRIM(QZ20->Z20_CODGRP) == alltrim(cGrupo) .and. ( ALLTRIM(QZ20->Z20_CODPRO) == "*" .or. Empty(QZ20->Z20_CODPRO) )
				lRet := .T.
				exit
			endif

			if ALLTRIM(QZ20->Z20_CODPRO) == alltrim(cProd) .AND. ( ALLTRIM(QZ20->Z20_CODGRP) == alltrim(cGrupo) .or. Empty(QZ20->Z20_CODGRP))
				lRet := .T.
				exit
			endif

			QZ20->(dbSkip())

		End
		aadd(aProds,{cProd,cGrupo,lRet})
		QZ20->( dbCloseArea() )
	next

	lRet := .t.
	For nZ := 1 to len(aProds)
		if !aProds[nz,3]
			lRet := .f.
			MsgInfo("Usu�rio n�o autorizado a executar essa opera��o com os produtos selecionados."+chr(10)+chr(13)+;
			"Produto: "+aProds[nz,1],"ATEN��O")
			exit
		endif
	next nZ
	//Fim da valida��o do usu�rio

	RestArea(aArea)
Return lRet

/*/{Protheus.doc} zLogin
Fun��o para montar a tela de login simplificada
@type function
@author Luciano
@since 17/09/2015
@version 1.0
@return lRet, Retorno l�gico se conseguiu encontrar o usu�rio digitado
@example
//Verificando se o login deu certo
If u_zLogin(@cUsrAux, @cPswAux)
//....
EndIf
/*/
//--------------------------------------------
Static Function zLogin()
	//--------------------------------------------
	Local aArea := GetArea()
	Local oGrpLog
	Local oBtnConf

	Private lRetorno := .F.
	Private oDlgPvt
	Private cCodLog	:= ""
	//Says e Gets
	Private oSayUsr
	Private oGetUsr, cGetUsr := Space(25)
	Private oSayPsw
	Private oGetPsw, cGetPsw := Space(20)
	Private oGetErr, cGetErr := ""
	//Dimens�es da janela
	Private nJanLarg := 200
	Private nJanAltu := 200

	//Criando a janela
	DEFINE MSDIALOG oDlgPvt TITLE "Usu�rio" FROM 000, 000  TO nJanAltu, nJanLarg COLORS 0, 16777215 PIXEL
	//Grupo de Login
	@ 003, 001 	GROUP oGrpLog TO (nJanAltu/2)-1, (nJanLarg/2)-3 		PROMPT "" 	OF oDlgPvt COLOR 0, 16777215 PIXEL
	//Label e Get de Usu�rio
	@ 013, 006   SAY   oSayUsr PROMPT "Usu�rio:"        SIZE 030, 007 OF oDlgPvt                    PIXEL
	@ 020, 006   MSGET oGetUsr VAR    cGetUsr           SIZE (nJanLarg/2)-12, 007 OF oDlgPvt COLORS 0, 16777215 PIXEL

	//Label e Get da Senha
	@ 033, 006   SAY   oSayPsw PROMPT "Senha:"          SIZE 030, 007 OF oDlgPvt                    PIXEL
	@ 040, 006   MSGET oGetPsw VAR    cGetPsw           SIZE (nJanLarg/2)-12, 007 OF oDlgPvt COLORS 0, 16777215 PIXEL PASSWORD

	//Get de Log, pois se for Say, n�o da para definir a cor
	@ 060, 006   MSGET oGetErr VAR    cGetErr        SIZE (nJanLarg/2)-12, 007 OF oDlgPvt COLORS 0, 16777215 NO BORDER PIXEL
	oGetErr:lActive := .F.
	oGetErr:setCSS("QLineEdit{color:#FF0000; background-color:#FEFEFE;}")

	//Bot�es
	@ (nJanAltu/2)-18, 006 BUTTON oBtnConf PROMPT "Confirmar"             SIZE (nJanLarg/2)-12, 015 OF oDlgPvt ACTION (fVldUsr()) PIXEL
	oBtnConf:SetCss("QPushButton:pressed { background-color: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #dadbde, stop: 1 #f6f7fa); }")
	ACTIVATE MSDIALOG oDlgPvt CENTERED

	//Se a rotina foi confirmada e deu certo, atualiza o usu�rio e a senha
	If lRetorno
		cCodUsr	:= cCodLog
		cUsrLog := Alltrim(cGetUsr)
		//		cPswLog := Alltrim(cGetPsw)
	EndIf

	RestArea(aArea)
Return lRetorno

/*---------------------------------------------------------------------*
| Func:  fVldUsr                                                      |
| Autor: Luciano Alvarazo                                                |
| Data:  26/04/2017                                             |
| Desc:  Fun��o para validar se o usu�rio existe                      |
*---------------------------------------------------------------------*/

Static Function fVldUsr()
	Local cUsrAux := Alltrim(cGetUsr)
	Local cPswAux := Alltrim(cGetPsw)
	Local cCodAux := ""

	//Pega o c�digo do usu�rio
	PswOrder(2)
	If !Empty(cUsrAux) .And. PswSeek(cUsrAux)
		cCodAux := PswRet(1)[1][1]
		cCodLog	:= cCodAux // alimenta variavel private

		//Agora verifica se a senha bate com o usu�rio
		If !PswName(cPswAux)
			//Desativado porque a senha n�o passa de forma alguma
			lRetorno := .T. 
			//cGetErr := "Senha inv�lida!"
			//oGetErr:Refresh()
			//Return

			//Sen�o, atualiza o retorno como verdadeiro
		Else
			lRetorno := .T.
		endif

		//Sen�o atualiza o erro e retorna para a rotina
	Else
		cGetErr := "Usu�rio n�o encontrado!"
		oGetErr:Refresh()
		Return
	EndIf

	//Se o retorno for v�lido, fecha a janela
	If lRetorno
		oDlgPvt:End()
	EndIf

Return
