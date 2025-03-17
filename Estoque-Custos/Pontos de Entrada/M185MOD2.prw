#include 'protheus.ch'
#include 'parmtype.ch'
#INCLUDE "Topconn.ch"

/*/{Protheus.doc} M185MOD1
Rotina para cadastro dos perfis de autorização para retirada do almoxarifado
@author Luciano Alvarazo
@since 07/04/2017
@version 1.0
@type function
/*/
User Function M185MOD1()
	Local lRet	:=	.F.
	Local lUser	:=	.T.
	Local aArea	:=	GetArea()
	Local cProd	:=	PARAMIXB[2] // Código Produto
	Local cQry	:=	""
	//Local nCont	:=	0

	Private cCodUsr	:= ''

	//Observações
	//PARAMIXB[1] := Filial
	//PARAMIXB[2] := Produto
	//PARAMIXB[3] := Local
	//PARAMIXB[4] := Quantidade Atual
	//PARAMIXB[5] := Reservas PV/OP
	//PARAMIXB[6] : = Qtd. Disponivel
	//PARAMIXB[7] := Numero da solicitação
	//PARAMIXB[8] := Saldo da Pre-Requisição
	//PARAMIXB[9] := Quantidade disponivel para entrega
	//PARAMIXB[10] := Quantidade em processo de compra
	//PARAMIXB[11] := Quantidade a Requisitar

	alert(cProd)

	if !zLogin()
		MsgInfo("Usuário não autenticado. Impossível realizar a operação.","ATENÇÃO")
		lUser := .F.
	endif

	if lUser
		//Valida permissão do usuário, conforme perfil cadastrado na tabela Z20
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

			//Qdo todos os produtos e grupos são permitidos
			if ALLTRIM(QZ20->Z20_CODPRO) == "*" .AND. ALLTRIM(QZ20->Z20_CODGRP) == "*"
				lRet := .T.
				exit
			endif

			//Qdo todos os produtos deste grupo de produtos é permitido

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
			MsgInfo("Usuário não autorizado a executar essa operação com o produto selecionado.","ATENÇÃO")
		endif
		//Fim da validação do usuário
	endif
	RestArea(aArea)
Return lRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ M185MOD2 º Autor ³ Luciano Alvarazo   º Data ³  26/04/17   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Ponto de entrada utilizado na validação da baixa da pre-   º±±
±±º          ³ requisição modelo 2 (automatica)                           º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ ESTOQUE                                                    º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±º          ³                                                           -º±±
±±º          ³                                                            º±±
±±º          ³                                                            º±±
±±º          ³                                                            º±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function M185MOD2()
	Local aArea	:=	GetArea()
	Local lRet	:=	.f.
	Local aRegs	:=	PARAMIXB	//aCols MOD2 Baixa Pré-Requisição
	Local cQry	:=	""
	Local nCont	:=	0	
	Local aProds := {}
	Local i
	Local nZ

	Private cCodUsr	:= ''

	//Inicio validação do usuário, conforme regras contidas na tabela Z20
	for i=1 to len(aRegs)
		lRet := .f.

		cProd := Alltrim(aRegs[i][4])
		if i == 1 // Valida se o usuário existe e senha
			if !zLogin()
				MsgInfo("Usuário não autenticado. Impossível realizar a operação.","ATENÇÃO")
				lRet := .F.
				return(lRet)
			endif
		endif

		//Se o item não estiver selecinado, não é feita a validação nele.
		if !aRegs[i][1]
			Loop
		endif

		//Valida permissão do usuário, conforme perfil cadastrado na tabela Z20
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
			//Qdo todos os produtos e grupos são permitidos
			if ALLTRIM(QZ20->Z20_CODPRO) == "*" .AND. ALLTRIM(QZ20->Z20_CODGRP) == "*"
				lRet := .T.
				exit
			endif

			//Qdo todos os produtos deste grupo de produtos é permitido

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
			MsgInfo("Usuário não autorizado a executar essa operação com os produtos selecionados."+chr(10)+chr(13)+;
			"Produto: "+aProds[nz,1],"ATENÇÃO")
			exit
		endif
	next nZ
	//Fim da validação do usuário

	RestArea(aArea)
Return lRet

/*/{Protheus.doc} zLogin
Função para montar a tela de login simplificada
@type function
@author Luciano
@since 17/09/2015
@version 1.0
@return lRet, Retorno lógico se conseguiu encontrar o usuário digitado
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
	//Dimensões da janela
	Private nJanLarg := 200
	Private nJanAltu := 200

	//Criando a janela
	DEFINE MSDIALOG oDlgPvt TITLE "Usuário" FROM 000, 000  TO nJanAltu, nJanLarg COLORS 0, 16777215 PIXEL
	//Grupo de Login
	@ 003, 001 	GROUP oGrpLog TO (nJanAltu/2)-1, (nJanLarg/2)-3 		PROMPT "" 	OF oDlgPvt COLOR 0, 16777215 PIXEL
	//Label e Get de Usuário
	@ 013, 006   SAY   oSayUsr PROMPT "Usuário:"        SIZE 030, 007 OF oDlgPvt                    PIXEL
	@ 020, 006   MSGET oGetUsr VAR    cGetUsr           SIZE (nJanLarg/2)-12, 007 OF oDlgPvt COLORS 0, 16777215 PIXEL

	//Label e Get da Senha
	@ 033, 006   SAY   oSayPsw PROMPT "Senha:"          SIZE 030, 007 OF oDlgPvt                    PIXEL
	@ 040, 006   MSGET oGetPsw VAR    cGetPsw           SIZE (nJanLarg/2)-12, 007 OF oDlgPvt COLORS 0, 16777215 PIXEL PASSWORD

	//Get de Log, pois se for Say, não da para definir a cor
	@ 060, 006   MSGET oGetErr VAR    cGetErr        SIZE (nJanLarg/2)-12, 007 OF oDlgPvt COLORS 0, 16777215 NO BORDER PIXEL
	oGetErr:lActive := .F.
	oGetErr:setCSS("QLineEdit{color:#FF0000; background-color:#FEFEFE;}")

	//Botões
	@ (nJanAltu/2)-18, 006 BUTTON oBtnConf PROMPT "Confirmar"             SIZE (nJanLarg/2)-12, 015 OF oDlgPvt ACTION (fVldUsr()) PIXEL
	oBtnConf:SetCss("QPushButton:pressed { background-color: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #dadbde, stop: 1 #f6f7fa); }")
	ACTIVATE MSDIALOG oDlgPvt CENTERED

	//Se a rotina foi confirmada e deu certo, atualiza o usuário e a senha
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
| Desc:  Função para validar se o usuário existe                      |
*---------------------------------------------------------------------*/

Static Function fVldUsr()
	Local cUsrAux := Alltrim(cGetUsr)
	Local cPswAux := Alltrim(cGetPsw)
	Local cCodAux := ""

	//Pega o código do usuário
	PswOrder(2)
	If !Empty(cUsrAux) .And. PswSeek(cUsrAux)
		cCodAux := PswRet(1)[1][1]
		cCodLog	:= cCodAux // alimenta variavel private

		//Agora verifica se a senha bate com o usuário
		If !PswName(cPswAux)
			//Desativado porque a senha não passa de forma alguma
			lRetorno := .T. 
			//cGetErr := "Senha inválida!"
			//oGetErr:Refresh()
			//Return

			//Senão, atualiza o retorno como verdadeiro
		Else
			lRetorno := .T.
		endif

		//Senão atualiza o erro e retorna para a rotina
	Else
		cGetErr := "Usuário não encontrado!"
		oGetErr:Refresh()
		Return
	EndIf

	//Se o retorno for válido, fecha a janela
	If lRetorno
		oDlgPvt:End()
	EndIf

Return
