// #########################################################################################
// Projeto:
// Modulo :
// Fonte  : LmpDB.prw
// -----------+-------------------+---------------------------------------------------------
// Data       | Autor             | Descricao
// -----------+-------------------+---------------------------------------------------------
// 24/05/2016 | V                 | Gerado com auxílio do Assistente de Código do TDS.
// -----------+-------------------+---------------------------------------------------------

#include "protheus.ch"
#include "vkey.ch"

user function CFGXLIMPDB()
	//-- variáveis -------------------------------------------------------------------------

	//Trabalho/apoio
	local aCampos := {}
	local cCampo := ""
	local aCores := {}

	
	
	Private  c_Als	:= "SZZ"

	Private c_SufTab := "010" //Chumbamos o sufixo da tabela, pois o comando RetSqlName cria a Tabela, e não é necessário criar tabelas

	//Indica a permissão ou não para a operação (pode-se utilizar 'ExecBlock')
	private cDelFunc := ".T." // Operacao: EXCLUSAO
	private cCadastro := "Tabelas para Limpeza" //Título das operações
	private aRotina := {} //Opçoes de operações

	//-- procedimentos ---------------------------------------------------------------------
	aAdd(aRotina, {"Pesquisar", "AxPesqui", 0, 1 })
	aAdd(aRotina, {"Visualizar", "AxVisual", 0, 2 })
	aAdd(aRotina, {"Alterar", "AxAltera", 0, 4 })
	aAdd(aRotina, {"Limpeza", "Processa({|| U_DltReg() },'Apagando Registros...')", 0, 4 })
	aAdd(aRotina, {"Legenda" ,"u_BLLmpDB" ,0 , 3})

	aAdd(aCores, {c_Als+"->(ZZ_PROP = 'S' .AND. ZZ_FIN = '1')", "BR_VERDE" })
	aAdd(aCores, {c_Als+"->(ZZ_PROP = 'S' .AND. ZZ_FIN = '2')", "BR_VERMELHO" })
	aAdd(aCores, {c_Als+"->(ZZ_PROP = 'S' .AND. ZZ_FIN = ' ')", "BR_AZUL" })
	aAdd(aCores, {c_Als+"->(ZZ_PROP = 'U')", "BR_LARANJA" })

	DbSelectArea(c_Als)
	DbSetOrder(1)

	If MsgYesNo( "Deseja Atualizar a Tabela?", "Confirma?" )
		Processa({|| RunProc() },"Atualizando Tabela...")
	Endif

	DbSelectArea(c_Als)
	DbSetOrder(1)

	mBrowse( 6, 1, 22, 75, c_Als,,,,,,aCores)

	//-- encerramento ----------------------------------------------------------------------

return

Static Function RunProc()
	Local c_Qry := ""
	Local lExistTab

	DbSelectArea("SX2")
	DbSetOrder(1)
	DbGoTop()

	ProcRegua(SX2->(RecCount()))

	DbGoTop()

	While ! Eof()

		IncProc(SX2->X2_CHAVE)

		
		
		c_Qry := "SELECT * FROM ALL_OBJECTS WHERE OBJECT_NAME = '"+ SX2->X2_CHAVE + c_SufTab +"' "
		PlsQuery(c_Qry,"_Q01")
		
		
		
		lExistTab :=  TcCanOpen(SX2->X2_CHAVE+c_SufTab)

		IF ! eOF()

			c_Qry := "SELECT COUNT(1) as QREG FROM "+ SX2->X2_CHAVE + c_SufTab

			PlsQuery(c_Qry,"_Q02")

			If !(c_Als)->(DbSeek(xFilial(c_Als) + SX2->X2_CHAVE))
				If _Q02->QREG > 0
					DbSelectArea(c_Als)
					RecLock(c_Als,.T.)

					(c_Als)->ZZ_FILIAL := '    '
					(c_Als)->ZZ_TABELA := SX2->X2_CHAVE
					(c_Als)->ZZ_DESC :=  UPPER(SX2->X2_NOME)
					(c_Als)->ZZ_PROP := Iif(SUBSTR(SX2->X2_CHAVE,1,2) = 'SZ','U',Iif(SUBSTR(SX2->X2_CHAVE,1,1) = 'Z','U','S'))
					(c_Als)->ZZ_FIN := ' '
					(c_Als)->ZZ_REGS := _Q02->QREG

					MsUnLock()
				Endif
			Else
				DbSelectArea(c_Als)
				RecLock(c_Als,.F.)

				(c_Als)->ZZ_REGS := _Q02->QREG

				MsUnLock()
			Endif

			_Q02->(DbCloseArea())
		Else
			If (c_Als)->(DbSeek(xFilial(c_Als) + SX2->X2_CHAVE))
				RecLock(c_Als,.F.)

				(c_Als)->ZZ_REGS := 0

				MsUnLock()
			Endif
		EndIf
		_Q01->(DbCloseArea()) 

		DbSelectArea("SX2")
		DbSkip()
	EndDo

Return

User Function DltReg()
	Local c_Qry := ""
	local cUsers := GetMv("MV_XUSRDEL")

	if !(alltrim(Upper(cUserName)) $ alltrim(Upper(cUsers)))
		ApMsgStop("Usuário sem autorização para deletar !","Não permitido")
		return
	endif
	c_Qry := "SELECT * FROM "+ RetSqlName(c_Als) +" "
	c_Qry += "WHERE D_E_L_E_T_ = ' ' "
	c_Qry += "AND ZZ_FIN = ' '"

	PlSQuery(c_Qry,"_Q01")

	If ! Eof()
		Alert("Ainda existe tabelas a Classificar, Verifique")
		_Q01->(DbCloseArea())
		Return
	Endif
	_Q01->(DbCloseArea())

	DbSelectArea(c_Als)
	DbGoTop()

	ProcRegua((c_Als)->(RecCount()))

	DbGoTop()

	While ! Eof()
		IncProc((c_Als)->ZZ_TABELA)

		If (c_Als)->ZZ_FIN = '1' .and. (c_Als)->ZZ_REGS > 0

			c_Sql := "DELETE FROM "+ (c_Als)->ZZ_TABELA + c_SufTab

						if TcSqlExec(c_Sql) != 0
							Aviso("Erro!!",TCSQLError(),{"Ok"},3)
							l_Ret := .F.
							Return
						Endif
		EndIf

		DbSelectArea(c_Als)
		DbSkip()
	EndDo

Return

//------------------------------------------------------------------------------------------
/*/{Protheus.doc} BLegenda
Apresenta diálogo com as legendas.

@author    V
@version   11.3.0.201604142013
@since     24/05/2016
/*/
//------------------------------------------------------------------------------------------
user function BLLmpDB()
	local aLegenda := {}

	aAdd(aLegenda, {"BR_VERMELHO", "Cadastro" })
	aAdd(aLegenda, {"BR_VERDE", "Movimento" })
	aAdd(aLegenda, {"BR_AZUL", "Classificar" })
	aAdd(aLegenda, {"BR_LARANJA", "Tab Usuario" })

	brwLegenda("Finalidades", "Legenda", aLegenda)

return nil

//-------------------------------------------------------------------------------------------
// Gerado pelo assistente de código do TDS tds_version em 24/05/2016 as 10:17:25
//-- fim de arquivo--------------------------------------------------------------------------
