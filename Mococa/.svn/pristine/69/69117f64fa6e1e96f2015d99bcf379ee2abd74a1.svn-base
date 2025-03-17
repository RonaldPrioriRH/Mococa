#INCLUDE "PROTHEUS.CH"
#INCLUDE "RWMAKE.ch"
#INCLUDE "TOPCONN.ch"
#INCLUDE "COLORS.ch"

#DEFINE _ENTER CHR(13)+CHR(10)
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ AGLT010  º Autor ³ TOTVS                 º Data da Criacao  ³ 22/09/2008                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Rotina Modelo 2 para Lancamentos dos Convenios.			                               						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Tabela ZLL - Cadastro de Lancamentos dos Convenios		                               						º±±
±±º          ³ Tabela SA2 - Tabela de Fornecedores = (RETIROS)			                               						º±±
±±º          ³ Tabela SE2 - Contas a Pagar								                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Nenhum						   							                               						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum						  							                               						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ TOTVS - Microsiga											                             					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±ºAbrahao   ³10/02/09  ³ Alterei funcoes de gravacao na ZLL e SE2		   ³                                  ³ 			º±±
±±º          ³          ³ Adicionei: Evento, Acrescimo e Tx.Admin.         ³                                  ³             º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ºGuilherme ³03/04/13  ³ Criei a opção de importação de arquivo TXT na    ³                                  ³ 			º±±
±±º          ³          ³ inclusao de um convênio.                         ³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function AGLT010()

// Variaveis que controla o filtro da tela
Local cFiltra := "ZLL_CONVEN $ " //FiltraFornec()
Local _cGrpFor := "" //Alltrim(SUPERGETMV("LT_GRPUSR")) //Grupo de usuários dos fornecedors, de acordo com o configurado.
Local _cGrpRH :=  "" //Alltrim(SUPERGETMV("LT_GRPRH")) //Grupo de usuários do recursos humanos, de acordo com o configurado.
Private _lFiltra	:= .F.
Private bFiltraBrw //:= { || FilBrowse(cAlias,@aIndexZLL,@cFiltra,.t.) }
Private _aUser := PswRet() //Carrega dados do usuario logado
Private _cTipos	:= ""

Private cAlias    := "ZLL"
Private cCadastro := "Lançamento de Convênios"
Private aRotina   := {}
Private cCodigo   := ""
Private cNatNF    := ""//PADR(SUPERGETMV("LT_CONVNAT",,"000001"),10)//Natureza do titulo NF
Private cNatNDF   := "" //Busca a natureza do Evento
Private cParcela  := StrZero(1,TamSX3("E2_PARCELA")[1])
Private cObs      := Space(TamSx3("E2_HIST")[1]) //Observacao do evento gravada no E2_HIST
Private aIndexZLL := {}
Private _aVenctos	:={}
Private _lUserRH	:= .F.
Private OpcaoCred	:= 0

Public _FilSA2_L6	:= " .T. " //Variavel publica chamada na consulta padrao SA2_L6, usada para filtrar o tipo dos fornecedores a aparecer na consulta de retiro.

dbSelectArea(cAlias)
dbSetOrder(1)
dbGoTop()

aAdd(aRotina,{"Pesquisar" ,'PesqBrw',0,1})
aAdd(aRotina,{"Visualizar",'U_ZLLMnt',0,2})
aAdd(aRotina,{"Incluir"   ,'U_ZLLInc',0,3})
aAdd(aRotina,{"Alterar"   ,'U_ZLLMnt',0,4})
aAdd(aRotina,{"Excluir"   ,'U_ZLLMnt',0,5})
aAdd(aRotina,{"Legenda"   ,'U_ZLLLeg',0,6})
aAdd(aRotina,{"Relatorio"  ,'U_RGLT007',0,6})

aCores := {{"ZLL_STATUS == 'A'",'BR_AMARELO'},;	//EM ABERTO
{"ZLL_STATUS == 'S'",'DISABLE'},;  		//EM SUSPENSO
{"ZLL_STATUS == 'P'",'BR_AZUL'}}  		//PAGO

//Verifica se o usuario pertence ao grupo de fornecedores
For i := 1 To Len(_aUser[1][10])
	If ALLTRIM(_aUser[1][10][i]) == _cGrpFor 
		_lFiltra := .T. //Usuário logado esta amarrado ao grupo de fornecedores.
	ElseIf ALLTRIM(_aUser[1][10][i]) == _cGrpRH 
		_lUserRH := .T.
	EndIf
Next i

If _lFiltra
	cFiltra += "'"+FiltraFornec()+"'" // Filtra registros para o fornecedor enxergar apenas os seus lançamentos.

	If Substr(cFiltra,16,3) == 'XXX' // Se filtro nao retornar codigos de fornecedores, sai da rotina.
			xMagHelpFis("Registro não encontrado","Não existe nenhum código de fornecedor amarrado ao usuário "+Alltrim(cUserName),;
				"Informe esta mensagem ao suporte do sistema Protheus. Preencher campo Cod.Usuario(A2_L_USER)")
			Return
	Else
		//Caso encontre fornecedores amarrados ao usuario, carrega o filtro e chama a funcao mbrowse.
		bFiltraBrw:= { || FilBrowse(cAlias,@aIndexZLL,@cFiltra,.t.) }
		// Cria o filtro na MBrowse utilizando a função FilBrowse
		Eval(bFiltraBrw)
	
		mBrowse(6,1,22,75,cAlias,,,,,,aCores) // Chama mbrowse com filtro. 

		// Deleta o filtro utilizado na função FilBrowse
		EndFilBrw(cAlias,aIndexZLL)
	EndIf
//Filtro se usuário pertence ao grupo do RH
ElseIf _lUserRH 
		cFiltra := "SUBSTR(ZLL_RETIRO,1,1) == 'E' "
		bFiltraBrw:= { || FilBrowse(cAlias,@aIndexZLL,@cFiltra,.t.) }
		// Cria o filtro na MBrowse utilizando a função FilBrowse
		Eval(bFiltraBrw)
	
		mBrowse(6,1,22,75,cAlias,,,,,,aCores) // Chama mbrowse com filtro. 

		// Deleta o filtro utilizado na função FilBrowse
		EndFilBrw(cAlias,aIndexZLL)
Else
	// Se nao e um fornecedor, verifica se o usuario esta autorizado a utilizar a rotina.
	If Posicione("ZLU",1,xFilial("ZLU")+Padr(cUserName,25),"ZLU_CONVEN") != "S"
		xMagHelpFis("Permissao","Voce nao tem permissao para acessar essa rotina!","Comunique ao Suporte!")
		Return
	Else
		//Neste caso o usuario tem acesso a rotina, e o browse e aberto sem filtros.
		mBrowse(6,1,22,75,cAlias,,,,,,aCores) //Chama mbrowse sem filtro.
	Endif
EndIf



Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ ZLLINC	º Autor ³ Marcelo Sanches       º Data da Criacao  ³ 22/09/2008                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Rotina para inclusao de dados.		                               											º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Tabela ZLL - Cadastro de Lancamentos dos Convenios		                               						º±±
±±º          ³ Tabela SA2 - Tabela de Fornecedores = (RETIROS)			                               						º±±
±±º          ³ 															                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ ZLLMnt(cAlias,nReg,nOpc)						   							                      				º±±
±±º          ³ cAlias = Apelido da tabela em Uso   C  3																		º±±
±±º          ³ nReg   = Numero do registro corrente						   							                       	º±±
±±º          ³ nOpc   = Numero da Opcao no Menu																				º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum						  							                               						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ TOTVS - Microsiga											                             					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                   							   ³                                  ³  	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function ZLLInc(cAlias,nReg,nOpc)

Local aObjects 	:={},aPosObj  :={}
Local aSize    	:=MsAdvSize()
Local aInfo    	:={aSize[1],aSize[2],aSize[3],aSize[4],3,3}
Local oDlg
Local lBotOk    := .F.
Local _aCodFor	 := {}
Local _nDiaVctof  := "" //GetMV("LT_VENFUNC")

Private oGet
Private oTPanel1
Private oTPanel2
Private oValTot
Private oAcresc
Private oTxAdm,oObs
Private oPAdm
Private cSeq      := Soma1(ZLL->ZLL_SEQ)
Private dData     := dDataBase
Private nMesLcto  := Month(dData)
Private nMesVcto  := 0
Private nAno	  := Year(dData)
Private dVctoPr	  := CtoD("//")//Vencimento da NDF a ser debitada do produtor
Private dVctoCv	  := CtoD("//")//Vencimento da NF da loja conveniada
Private cConven   := Space(06)
Private cRetiro   := Space(06)
Private cLjReti   := Space(02)
Private cLjConv   := Space(02)
Private cNome     := Space(30)
Private cSetor    := ALLTRIM(GetMv("LT_CODSETO"))//Codigo default do setor
Private cEvento   := Space(6) //ALLTRIM(GetMv("LT_CONVEXT"))//Codigo default do convenio externo
Private nAcresc   := 0
Private nTxAdm    := 0
Private nPAdm     := 0
Private cResult1  := Space(01)
Private nValTot   := 0
Private aHeader   := {}
Private aCols     := {}
Private aREG      := {}
Private nDiaVcto  := Val(Alltrim(GetMV("LT_VENCTO"))) //Parametro que indica o dia de vencimento da NDF a ser debitada do produtor
Private nDiaConv  := 0//Indica o dia de vencimento da NF a ser paga a loja conveniada
Private nPosValor

Public _cFiltroF3ZLL	:= " .T. "


aButtons  := If(Type("aButtons") == "U", {}, aButtons)

If _lUserRH // Se for usuário do RH so ira mostrar funcionarios na consulta F3.
	_FilSA2_L6 := " (SA2->A2_L_TPFOR == 'E') "
EndIf

/*
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Na inclusao dos dados disponibiliza um botao                ³
//³para realizar a importacao do arquivo texto do convenio.    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
*/
If nOpc == 3
	Aadd( aButtons, {"PESQUISA" ,{||Import_txt(cConven)},"Importar TXT..." ,"Importar TXT" })
	Aadd( aButtons, {"VISUALIZA" ,{||U_ChamaDados(nOpc)},"Visualizar parcelas..." ,"Visualizar parcelas" })
	SetKey (VK_F7,{|a,b| U_ChamaDados(nOpc)})
EndIf

cCodigo := getNewNum()

// pega tamanhos das telas
AADD(aObjects,{100,050,.T.,.F.,.F.})
AADD(aObjects,{100,100,.T.,.T.,.F.})
aPosObj:=MsObjSize(aInfo,aObjects)

Do Case
	Case nMesLcto == 1
		nMesVcto := 2
	Case nMesLcto == 2
		nMesVcto := 3
	Case nMesLcto == 3
		nMesVcto := 4
	Case nMesLcto == 4
		nMesVcto := 5
	Case nMesLcto == 5
		nMesVcto := 6
	Case nMesLcto == 6
		nMesVcto := 7
	Case nMesLcto == 7
		nMesVcto := 8
	Case nMesLcto == 8
		nMesVcto := 9
	Case nMesLcto == 9
		nMesVcto := 10
	Case nMesLcto == 10
		nMesVcto := 11
	Case nMesLcto == 11
		nMesVcto := 12
	Case nMesLcto == 12
		nMesVcto := 1
		nAno := (nAno + 1)
EndCase

If _lUserRH // Se for usuario do RH, o vencimento utilizado é do funcionario
	dVctoPr := CtoD(StrZero(_nDiaVctof,2) + "/" + StrZero(nMesVcto,2) + "/" + SubSTR(STR(nAno,4),3,2))
Else
	dVctoPr := CtoD(StrZero(nDiaVcto,2) + "/" + StrZero(nMesVcto,2) + "/" + SubSTR(STR(nAno,4),3,2))
EndIf



If _lFiltra //Se o usuario logado estiver amarrado no grupo de filtro, o cabeçalho já vem preenchido.
	_aCodFor := strtokarr(FiltraFornec(),"/")
	cEvento := Posicione("SA2",1,xFilial("SA2")+_aCodFor[1],"A2_L_EVENT")
	nPAdm := Posicione("SA2",1,xFilial("SA2")+_aCodFor[1],"A2_L_TXCON")
	dbSelectArea('ZL8')
	ZL8->(dbSeek(xFILIAL("ZL8")+cEvento))
	_cTipos := Alltrim(ZL8->ZL8_TIPOS)
	//Verifica data limite que o fornecedor poderá incluir convenios
	If Day(dData) > ZL8->ZL8_LIMITE
		xMagHelpFis("Data Inválida","Data de inclusão acima do limite permitido para este evento!",;
					"Os lançamentos deste convênio são permitidos somente até o dia "+cValToChar(ZL8->ZL8_LIMITE)+"!")
		Return
	EndIf

	If ZL8->ZL8_PGMES == 'S' //Indica se o convenio é pago dentro do mes de lançamento para o fornecedor
		dVctoCv := CtoD(StrZero(ZL8->ZL8_PGTFOR,2) + "/" + StrZero(nMesLcto,2) + "/" + SubSTR(STR(Year(dData),4),3,2)) 
	Else
		dVctoCv := CtoD(StrZero(ZL8->ZL8_PGTFOR,2) + "/" + StrZero(nMesVcto,2) + "/" + SubSTR(STR(nAno,4),3,2)) 
	EndIf


	If Len(_aCodFor) == 1
		cConven := _aCodFor[1]
		cLJConv := Posicione("SA2",1,xFilial("SA2")+_aCodFor[1],"A2_LOJA")
		cNome := Posicione("SA2",1,xFilial("SA2")+_aCodFor[1],"A2_NOME")
	Else
		_cFiltroF3ZLL := " SA2->A2_COD $ '"+FiltraFornec()+"'" 
	EndIf

//	cObs := "CONVÊNIO "+Alltrim(ZL8->ZL8_NREDUZ)+(Space(TamSx3("E2_HIST")[1]) - 9 - len(Alltrim(ZL8->ZL8_NREDUZ)))
cObs := "CONVÊNIO "+Alltrim(ZL8->ZL8_NREDUZ)+(Space(TamSx3("E2_HIST")[1] - 9 - len(Alltrim(ZL8->ZL8_NREDUZ))))//+SUBSTR(SA2->A2_NREDUZ,1,TamSx3("E2_HIST")[1])
EndIf


dbSelectArea(cAlias)

Mod2aHeader(cAlias)
Mod2aCols(cAlias,nReg,nOpc)

DEFINE MSDIALOG oDlg TITLE cCadastro OF oMainWnd PIXEL FROM aSize[7],0 TO aSize[6],aSize[5]

//oTPanel1 		:= TPanel():New(0,0,"",oDlg,Nil,.T.,.F.,Nil,Nil,0,70,.T.,.F.)
oTPanel1 		:= TPanel():New(0,0,"",oDlg,Nil,.T.,.F.,Nil,Nil,0,80,.T.,.F.)
oTPanel1:Align 	:= CONTROL_ALIGN_TOP
nValTot			:= 0

@ 05,005 SAY "Codigo:"	SIZE 70,7 PIXEL OF oTPanel1
@ 05,035 MSGET cCodigo												WHEN .F. SIZE 025,7 PIXEL OF oTPanel1
@ 05,070 SAY "Setor:"	SIZE 70,7 PIXEL OF oTPanel1
@ 05,085 MSGET cSetor F3 "ZL2_01" PICTURE "@!" 	WHEN .F. VALID U_valSetor() SIZE 030,7 PIXEL OF oTPanel1 	
@ 05,120 SAY "Evento:"	SIZE 70,7 PIXEL OF oTPanel1
@ 05,145 MSGET cEvento F3 "ZL8_02" PICTURE "@!" VALID vldEvento()	WHEN !_lFiltra SIZE 040,7 PIXEL OF oTPanel1
@ 20,005 SAY "Convênio:"  		SIZE 70,7 PIXEL OF oTPanel1
@ 20,035 MSGET cConven F3 "SA2_L5" PICTURE "@!"	VALID U_Mod2Forn(cConven,@cLjConv) 	WHEN .T./* Empty(cConven)*/ SIZE 030,7 PIXEL OF oTPanel1
@ 20,070 SAY "Loja:"      		SIZE 70,7 PIXEL OF oTPanel1
@ 20,085 MSGET cLJConv 							VALID U_Mod2Forn(cConven,cLjConv)	WHEN .T./*Empty(cLJConv)*/ SIZE 020,7 PIXEL OF oTPanel1
@ 20,115 SAY "Nome:"      		SIZE 70,7 PIXEL OF oTPanel1
@ 20,135 MSGET cNome   							When .F.            				SIZE 110,7 PIXEL OF oTPanel1

@ 35,005 SAY "Emissão:"   		SIZE 70,7 PIXEL OF oTPanel1
@ 35,035 MSGET dData   							PICTURE "99/99/99"  	WHEN !_lFiltra SIZE 040,7 PIXEL OF oTPanel1
@ 35,080 SAY "Vencto Prod."		SIZE 70,7 PIXEL OF oTPanel1
@ 35,110 MSGET dVctoPr							PICTURE "99/99/99" VALID valVencto() WHEN !_lFiltra SIZE 040,7 PIXEL OF oTPanel1
@ 35,175 SAY "Vencto Conv."		SIZE 70,7 PIXEL OF oTPanel1
@ 35,210 MSGET dVctoCv	        				PICTURE "99/99/99" VALID valVencto() WHEN !_lFiltra SIZE 040,7 PIXEL OF oTPanel1

@ 50,005 SAY "Vlr. Aberto"	 	SIZE 70,7 PIXEL OF oTPanel1
@ 50,035 MSGET oValTot	var nValTot				When .F. PICTURE "999,999,999.99"	SIZE 050,7 pixel of oTPanel1
//@ 50,090 SAY "Acrescimo"	 	SIZE 70,7 PIXEL OF oTPanel1
//@ 50,120 MSGET oAcresc	var nAcresc				When .F. PICTURE "999,999,999.99"	SIZE 050,7 pixel of oTPanel1
@ 50,175 SAY "(%)Taxa Adm."		SIZE 70,7 PIXEL OF oTPanel1
@ 50,210 MSGET oPAdm	var nPAdm				/*When U_GLT_012Z(__CUSERID,"JUROS")*/ valid (nPAdm<99) PICTURE "999.99"	SIZE 040,7 pixel of oTPanel1
@ 50,255 SAY "Taxa Adm."		SIZE 50,7 PIXEL OF oTPanel1
@ 50,280 MSGET oTxAdm	var nTxAdm				When .F. PICTURE "999,999.99"	SIZE 050,7 pixel of oTPanel1

@ 65,005 SAY "Observação"	 	SIZE 70,7 PIXEL OF oTPanel1
@ 65,035 MSGET oObs	var cObs				When .T. SIZE 150,7 pixel of oTPanel1

nPosValor	:= ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLL_VALOR"})

oGet := MSGetDados():New(aPosObj[2,1],aPosObj[2,2],aPosObj[2,3]-10,aPosObj[2,4]-10,nOpc,"U_Mod2LOk()",".T.","+ZLL_SEQ",.T.,,,,999)
oGet:oBrowse:Align := CONTROL_ALIGN_ALLCLIENT

//ACTIVATE MSDIALOG oDlg ON INIT EnchoiceBar(oDlg,{|| IIF(U_Mod2TOk(),(Grava(nOpc),oDlg:End()),(oDlg:End(),Nil))},{|| oDlg:End()})



ACTIVATE MSDIALOG oDlg ON INIT EnchoiceBar(oDlg,;
{|| If(U_Mod2TOk(),lBotOk:=.T.,lBotOk:=.F.),If(lBotOk,MsgRun("Aguarde.... Atualizando dados do convenio...",,{||CursorWait(),Grava(nOpc),CursorArrow()}),Nil),If(lBotOk,oDlg:End(),Nil) },{|| oDlg:End()},,aButtons)//Botao Cancelar

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ ZLLMnt	º Autor ³ Marcelo Sanches       º Data da Criacao  ³ 22/09/2008                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Rotina para Visualizar, Alterar e Excluir dados.                   											º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Tabela ZLL - Cadastro de Lancamentos dos Convenios		                               						º±±
±±º          ³ Tabela SA2 - Tabela de Fornecedores = (RETIROS)			                               						º±±
±±º          ³ 															                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ ZLLMnt(cAlias,nReg,nOpc)						   							                      				º±±
±±º          ³ cAlias = Apelido da tabela em Uso   C  3																		º±±
±±º          ³ nReg   = Numero do registro corrente						   							                       	º±±
±±º          ³ nOpc   = Numero da Opcao no Menu																				º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum						  							                               						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ TOTVS - Microsiga											                             					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                   							   ³                                  ³  	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function ZLLMnt(cAlias,nReg,nOpc)

Local aArea := GetArea()
Local oDlg
Local aSize    	:= MsAdvSize()
Local cMensagem := "Alteração não autorizada. Título já baixado no Financeiro."
Local lBotOk    := .F.

Private oGet
Private oTPanel1
Private oTPanel2
Private oAcresc
Private oTxAdm
Private cFilial  := ZLL->ZLL_FILIAL
Private cConven  := ZLL->ZLL_CONVEN
Private cLjConv  := ZLL->ZLL_LJCONV
Private cSetor 	 := ZLL->ZLL_SETOR
Private cNatureza:= ZLL->ZLL_NATURE
Private cEvento  := ZLL->ZLL_EVENTO
Private nAcresc  := ZLL->ZLL_ACRESC
Private nTxAdm   := ZLL->ZLL_TXADM
Private cObs     := ZLL_OBSERV
Private cCodigo  := ZLL->ZLL_COD
Private cNome    := Posicione("SA2",1,xFILIAL("SA2")+cConven+cLjConv,"A2_NOME")
Private dData    := ZLL->ZLL_DATA
Private dVctoPr	 := ZLL->ZLL_VENCTO//Vencimento da NDF a ser debitada do produtor
Private dVctoCv  := ZLL->ZLL_VENCON//Vencimento da NF da loja conveniada
Private aHeader	 := {}
Private aCols 	 := {}
Private aREG 	 := {}
Private cResult1 := ZLL->ZLL_STATUS
Private nValTot  := 0
Private cPrefixo := SuperGetMV("LT_CONVPRE")
Private cNum	 := StrZero(Val(cCodigo),9)
Private cTipo	 := "NF "
Private nPosValor
Private oValTot
Private nPAdm    := 0 //Posicione("SA2",1,xFilial("SA2")+cConven+cLjConv,"A2_L_TXCON")
Private oPAdm 

aButtons  := If(Type("aButtons") == "U", {}, aButtons)

/*
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Na alteracao ou visualizacao dos dados disponibiliza botao  ³
//³para realizar consulta parcelas							   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
*/
If nOpc == 2 .OR. nOpc == 4
	Aadd( aButtons, {"VISUALIZA" ,{||U_ChamaDados(nOpc)},"Visualizar parcelas..." ,"Visualizar parcelas" })
	SetKey (VK_F7,{|a,b| U_ChamaDados(nOpc)})
EndIf                                           


dbSelectArea("SE2")
dbSetOrder(1)
dbSeek(xFILIAL("SE2")+cPrefixo+cNum+cParcela+cTipo+cConven+cLjConv)
If Found()
	If SE2->E2_SALDO == 0
		xMagHelpFis("Mensagem",cMensagem,"Favor verificar com o Financeiro!")
		Return
	EndIf
EndIf
dbSelectArea("ZLL")

Mod2aHeader(cAlias)
Mod2aCols(cAlias,nReg,nOpc)

nPosValor	:= ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLL_VALOR"})

DEFINE MSDIALOG oDlg TITLE cCadastro OF oMainWnd PIXEL FROM aSize[7],0 TO aSize[6],aSize[5]

oTPanel1 		:= TPanel():New(0,0,"",oDlg,Nil,.T.,.F.,Nil,Nil,0,80,.T.,.F.)
oTPanel1:Align 	:= CONTROL_ALIGN_TOP

@ 05,005 SAY "Codigo:"	SIZE 70,7 PIXEL OF oTPanel1
@ 05,035 MSGET cCodigo												 WHEN .F.	SIZE 025,7 PIXEL OF oTPanel1
@ 05,070 SAY "Setor:"	SIZE 70,7 PIXEL OF oTPanel1
@ 05,085 MSGET cSetor F3 "ZL2_01" PICTURE "@!" WHEN .F. 	VALID U_valSetor() SIZE 030,7 PIXEL OF oTPanel1 
@ 05,120 SAY "Evento:"	SIZE 70,7 PIXEL OF oTPanel1
@ 05,145 MSGET cEvento F3 "ZL8_02" PICTURE "@!" WHEN .F. SIZE 040,7 PIXEL OF oTPanel1

@ 20,005 SAY "Convênio:"  		SIZE 70,7 PIXEL OF oTPanel1
@ 20,035 MSGET cConven F3 "SA2_L5" PICTURE "@!"	VALID U_Mod2Forn(cConven,@cLjConv) WHEN .F. SIZE 030,7 PIXEL OF oTPanel1
@ 20,070 SAY "Loja:"      		SIZE 70,7 PIXEL OF oTPanel1
@ 20,085 MSGET cLJConv 							VALID U_Mod2Forn(cConven,cLjConv)	 WHEN .F. SIZE 020,7 PIXEL OF oTPanel1
@ 20,115 SAY "Nome:"      		SIZE 70,7 PIXEL OF oTPanel1
@ 20,135 MSGET cNome   							When .F.            				 WHEN .F. SIZE 110,7 PIXEL OF oTPanel1

@ 35,005 SAY "Emissão:"   		SIZE 70,7 PIXEL OF oTPanel1
@ 35,035 MSGET dData   							PICTURE "99/99/99"  				 WHEN .F. SIZE 040,7 PIXEL OF oTPanel1
@ 35,080 SAY "Vencto Prod."		SIZE 70,7 PIXEL OF oTPanel1
@ 35,110 MSGET dVctoPr							PICTURE "99/99/99"					 WHEN !_lFiltra SIZE 040,7 PIXEL OF oTPanel1
@ 35,175 SAY "Vencto Conv."		SIZE 70,7 PIXEL OF oTPanel1
@ 35,210 MSGET dVctoCv	        				PICTURE "99/99/99"				WHEN !_lFiltra SIZE 040,7 PIXEL OF oTPanel1

@ 50,005 SAY "Vlr. Aberto"	 	SIZE 70,7 PIXEL OF oTPanel1
@ 50,035 MSGET oValTot	var nValTot				When .F. PICTURE "999,999,999.99"	SIZE 050,7 pixel of oTPanel1
//@ 50,090 SAY "Acrescimo"	 	SIZE 70,7 PIXEL OF oTPanel1
//@ 50,120 MSGET oAcresc	var nAcresc				When .F. PICTURE "999,999,999.99"	SIZE 050,7 pixel of oTPanel1
@ 50,175 SAY "(%)Taxa Adm."		SIZE 70,7 PIXEL OF oTPanel1
@ 50,210 MSGET oPAdm	var nPAdm				/*When U_GLT_012Z(__CUSERID,"JUROS")*/ valid (nPAdm<99) PICTURE "999,999,999.99"	SIZE 040,7 pixel of oTPanel1
@ 50,255 SAY "Taxa Adm."		SIZE 50,7 PIXEL OF oTPanel1
@ 50,280 MSGET oTxAdm	var nTxAdm				When .F. PICTURE "999,999,999.99"	SIZE 050,7 pixel of oTPanel1

//INCLUIDO POR MARCO TUB027
@ 65,005 SAY "Observação"	 	SIZE 70,7 PIXEL OF oTPanel1
@ 65,035 MSGET oObs	var cObs	When .F. SIZE 150,7 pixel of oTPanel1


oTPanel2 := TPanel():New(0,0,"",oDlg,Nil,.T.,.F.,Nil,Nil,0,50,.T.,.F.)
oTPanel2:Align := CONTROL_ALIGN_BOTTOM


If nOpc == 4
	//Bloqueia a alteração de registros lançados em outro mes caso seja um fornecedor que esteja logado.
	If _lFiltra .and. Month(dData) <> Month(DDATABASE)
		xMagHelpFis("Data Inválida","Não é permitido alterar registros incluídos em mês diferente do atual.",;
					"Selecione outro registro, ou solicite apoio ao administrativo.")
		Return
	EndIf
	//Bloqueia a edição de registros incluidos por outro usuario caso seja um fornecedor que esteja lojago.
	If _lFiltra .and. (FWLeUserlg("ZLL_USERGI") <> _aUser[1][2])
		xMagHelpFis("Valida Alteracao","Alteração não permitida pois o registro posicionado foi incluido por outro usuário!",;
					"Selecione outro registro, ou solicite apoio ao administrativo.")
		Return					
	EndIf

	oGet := MSGetDados():New(0,0,0,0,nOpc,"U_MOD2LOK()",".T.","+ZLL_SEQ",.T.,,,,999)
ElseIf nOpc == 5
    
	//Guarda status da operacao se a mesma for exclusão
	//Utilizado para nao validar limite de credito na exclusao do convenio
	OpcaoCred	:=	nOpc

	//Bloqueia a exclusao de registros lançados em outro mes caso seja um fornecedor que esteja logado.
	If _lFiltra .and. Month(dData) <> Month(DDATABASE)
		xMagHelpFis("Data Inválida","Não é permitido excluir registros incluídos em mês diferente do atual.",;
					"Selecione outro registro, ou solicite apoio ao administrativo.")
		Return
	EndIf
	//Bloqueia a exclusao de registros incluidos por outro usuario caso seja um fornecedor que esteja lojago.
	If _lFiltra .and. (FWLeUserlg("ZLL_USERGI") <> _aUser[1][2])
		xMagHelpFis("Valida Alteracao","Exclusão não permitida pois o registro posicionado foi incluido por outro usuário!",;
					"Selecione outro registro, ou solicite apoio ao administrativo.")
		Return					
	EndIf
	oGet := MSGetDados():New(0,0,0,0,nOpc,,,,,,,,999)
Else
	oGet := MSGetDados():New(0,0,0,0,nOpc,,,,,,,,999)
EndIf
oGet:oBrowse:Align := CONTROL_ALIGN_ALLCLIENT

//ACTIVATE MSDIALOG oDlg ON INIT EnchoiceBar(oDlg,{||(IIF(nOpc==4.AND.U_Mod2TOk(),Grava(nOpc),IIF(nOpc==5,Grava(nOpc),oDlg:End())),oDlg:End())},	{||oDlg:End()})

//ACTIVATE MSDIALOG oDlg ON INIT EnchoiceBar(oDlg,{||(IIF(nOpc==4.AND.U_Mod2TOk(),MsgRun("Aguarde.... Atualizando dados do convenio...",,{||CursorWait(),Grava(nOpc),CursorArrow()}),;
//IIF(nOpc==5,MsgRun("Aguarde.... Atualizando dados do convenio...",,{||CursorWait(),Grava(nOpc),CursorArrow()}),;//else do botao ok
//oDlg:End())),oDlg:End())},{||oDlg:End()})

ACTIVATE MSDIALOG oDlg ON INIT EnchoiceBar(oDlg,;
{|| If(U_Mod2TOk(),lBotOk:=.T.,lBotOk:=.F.),If(lBotOk.And.nOpc==4,MsgRun("Aguarde.... Atualizando dados do convenio...",,{||CursorWait(),Grava(nOpc),CursorArrow()}),Nil),If(lBotOk.And.nOpc==5,MsgRun("Aguarde.... Atualizando dados do convenio...",,{||CursorWait(),Grava(nOpc),CursorArrow()}),Nil),If(lBotOk,oDlg:End(),Nil) },{||oDlg:End()},,aButtons)//Botao Cancelar
//{|| If(U_Mod2TOk(),lBotOk:=.T.,lBotOk:=.F.),If(lBotOk.And.nOpc==4,MsgRun("Aguarde.... Atualizando dados do convenio...",,{||CursorWait(),Grava(nOpc),CursorArrow()}),Nil),If(lBotOk.And.nOpc==5,MsgRun("Aguarde.... Atualizando dados do convenio...",,{||CursorWait(),Grava(nOpc),CursorArrow()}),Nil),If(lBotOk,oDlg:End(),Nil) },{||oDlg:End()} )//Botao Cancelar


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ Mod2aHeader º Autor ³ Marcelo Sanches       º Data da Criacao  ³ 22/09/2008             						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Rotina para montar o vetor aHeader - (Cabecalho).                   											º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Tabela ZLL - Cadastro de Lancamentos dos Convenios		                               						º±±
±±º          ³ Tabela SX3 - Dicionario de Dados							                               						º±±
±±º          ³ 															                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Mod2aHeader(cAlias)			   							                               						º±±
±±º			 ³ cAlias = Apelido da tabela em uso					                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum						  							                               						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ TOTVS - Microsiga											                             					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                   							   ³                                  ³  	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function Mod2aHeader(cAlias)
Local aArea := GetArea()

dbSelectArea("SX3")
dbSetOrder(1)
dbSeek(cAlias)
While !Eof() .And. X3_ARQUIVO == cAlias
	// Feita esta exclusao de campos sem utilizar o USADO no configurador.
	If ((SX3->X3_CAMPO == "ZLL_CONVEN") .Or. (ALLTRIM(SX3->X3_CAMPO) == "ZLL_COD") .Or. (SX3->X3_CAMPO == "ZLL_LJCONV") .Or. ;
		(SX3->X3_CAMPO == "ZLL_DATA") .Or. (SX3->X3_CAMPO == "ZLL_OBSERV") .Or. (SX3->X3_CAMPO == "ZLL_NATURE") .Or. (SX3->X3_CAMPO == "ZLL_SETOR");
		.Or. (SX3->X3_CAMPO == "ZLL_EVENTO") .Or. (SX3->X3_CAMPO == "ZLL_ACRESC")  .Or. (SX3->X3_CAMPO == "ZLL_TXADM ")  )
	Else
		If X3Uso(X3_USADO) .And. _aUser[1][25] >= X3_NIVEL
			AADD(aHeader,{Trim(X3Titulo()),;
			X3_CAMPO,;
			X3_PICTURE,;
			X3_TAMANHO,;
			X3_DECIMAL,;
			/*X3_VALID*/"U_VldEdit()",;
			X3_USADO,;
			X3_TIPO,;
			X3_ARQUIVO,;
			X3_CONTEXT})
		EndIf
	EndIf
	dbSkip()
EndDo
RestArea(aArea)
Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ Mod2aCols   º Autor ³ Marcelo Sanches       º Data da Criacao  ³ 22/09/2008             						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Rotina para montar o vetor aCols. - (detalhes).                   											º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Tabela ZLL - Cadastro de Lancamentos dos Convenios		                               						º±±
±±º          ³ Tabela SA2 - Tabela de Fornecedores = (RETIROS)			                               						º±±
±±º          ³ 															                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Mod2aCols(cAlias,nReg,nOpc)																					º±±
±±º          ³ cAlias = Apelido da tabela em Uso   C  3																		º±±
±±º          ³ nReg   = Numero do registro corrente						   							                       	º±±
±±º          ³ nOpc   = Numero da Opcao no Menu																				º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum						  							                               						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ TOTVS - Microsiga											                             					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                   							   ³                                  ³  	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function Mod2aCols(cAlias,nReg,nOpc)

Local aArea  := GetArea()
Local cChave := (ZLL->ZLL_FILIAL+ZLL->ZLL_CONVEN+ZLL->ZLL_LJCONV+ZLL->ZLL_SEQ+ZLL->ZLL_RETIRO+ZLL->ZLL_RETILJ)
Local nI 	 := 0
Local _aParcela

If nOpc <> 3
	dbSelectArea("ZLL")
	dbSetOrder(1)
	dbSeek(xFILIAL("ZLL")+ZLL->ZLL_COD,.T.)
	While !Eof() .AND. ZLL->ZLL_FILIAL == xFILIAL("ZLL") .And. 	ZLL->ZLL_COD == cCodigo
		AADD(aREG,ZLL->(RecNo()))
		AADD(aCols,Array(Len(aHeader)+1))
		For nI := 1 To Len(aHeader)
			If aHeader[nI,10] == "V"
				aCols[Len(aCols),nI] := CriaVar(aHeader[nI,2],.T.)
			Else
				aCols[Len(aCols),nI] := FieldGet(FieldPos(aHeader[nI,2]))
			EndIf
		Next nI
		aCols[Len(aCols),Len(aHeader)+1] := .F.
		If ZLL->ZLL_STATUS == "A"
			nValTot := (nValTot + ZLL->ZLL_VALOR)
			nPAdm :=  (nTxAdm/nValTot)*100
		EndIf

		ZLL->(dbSkip())
	EndDo
Else
	AADD(aCols,Array(Len(aHeader)+1))
	For nI := 1 To Len(aHeader)
		aCols[1,nI] := CriaVar(aHeader[nI,2],.T.)
	Next nI
	aCols[1,1] := "001"
	aCols[1,Len(aHeader)+1] := .F.
	If ZLL->ZLL_STATUS == "A"
		nValTot := (nValTot + ZLL->ZLL_VALOR)
	EndIf
EndIf


Restarea(aArea)
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ Mod2Forn    º Autor ³ Marcelo Sanches       º Data da Criacao  ³ 22/09/2008             						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Rotina para validar o codigo do Fornecedor.                         											º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Tabela SA2 - Tabela de Fornecedores = (RETIROS)			                               						º±±
±±º          ³ 			                               																		º±±
±±º          ³ 															                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Mod2Forn(cConven,cLjConv) 							                               							º±±
±±º          ³ cConven = Codigo do Convenio   C  6																			º±±
±±º          ³ cLjConv = Loja do Convenio     C  6																			º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ cNome	= Nome do Convenio	  							                               						º±±
±±º			 ³ cLjConv	= Loja do Convenio							                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ TOTVS - Microsiga											                             					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                   							   ³                                  ³  	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function Mod2Forn(cConven,cLjConv)

Local aArea := GetArea()
Local _cxTipos := ""

dbSelectArea("SA2")
dbSetOrder(1)
dbSeek(xFILIAL("SA2")+cConven+ALLTRIM(cLjConv))

DbSelectArea("ZL8")
DbSetOrder(1)
DbSeek(xFilial("ZL8")+cEvento)

// O evento 100003 é utilizado para transferir debitos de um produtor para outro, portanto apresenta o tipo P e T na consulta padrao.

If cEvento == '100003'
	_cxTipo := "P/T"
Else
	_cxTipo := "F"
EndIf


//_cxTipo := "F"

If Found()
	If SA2->A2_L_TPFOR $ _cxTipo
		If SA2->A2_MSBLQL <> '1'
			If _lFiltra
				If !&_cFiltroF3ZLL
					xMagHelpFis("Atencao","Convenio não encontrado ou inválido!","Informe um convênio existente e válido! Pressione F3 e selecione o convênio.")
					Return .F.
				Endif
			EndIf 
			cNome    := SA2->A2_NOME
			cLjConv  := SA2->A2_LOJA
			cObs := "CONVÊNIO "+Alltrim(ZL8->ZL8_NREDUZ)+(Space(TamSx3("E2_HIST")[1] - 9 - len(Alltrim(ZL8->ZL8_NREDUZ))))//+SUBSTR(SA2->A2_NREDUZ,1,TamSx3("E2_HIST")[1])
			nPAdm 	 := 0 //SA2->A2_L_TXCON
		Else
			xMagHelpFis("Atencao","Este Convenio/Fornecedor esta bloqueado!","InForme um Convenio/Fornecedor não bloqueado ou altere o Status de bloqueio.")
			Return .F.
		EndIf
	Else
		xMagHelpFis("Atencao","Produtores ou Fretistas não podem ser lojas conveniadas!","InForme um Convenio/Fornecedor valido.")
		Return .F.
	EndIf
Else
	xMagHelpFis("Atencao","Convenio não encontrado ou inválido!","Informe um convênio existente e válido! Pressione F3 e selecione o convênio.")
	Return .F.
EndIf

RestArea(aArea)
Return(cNome,cLjConv)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ Mod2LOk	   º Autor ³ Marcelo Sanches       º Data da Criacao  ³ 22/09/2008             						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Funcao de usuario para validar a linha de dados.                    											º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Tabela SA2 - Tabela de Fornecedores = (RETIROS)			                               						º±±
±±º          ³ Tabela ZLL - Cadastro de Lancamentos dos Convenios		                               						º±±
±±º          ³ O campo ZLL_RETIRO nao pode estar vazio					                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Nenhum						   							                               						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ .T. ou .F.					  							                               						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ TOTVS - Microsiga											                             					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                   							   ³                                  ³  	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function Mod2LOk()

Local lRet      := .T.
Local cMensagem := "Não será permitido linhas sem o Produtor."
Local cMsg2		:= "Esta opção de Status só poderá ser incluída pelo Módulo Financeiro."
Local cSetPrd   := ""
Local nMes,nAno,dMvIni,dMvFim,cFornCod,cFornlj
Local _aParcela
Local _nPosic := 0
Local _cRetiro
Local _nAcumulado, _nSaldo
Local _aValores	:= {}

Private cObserv
Private nReg

dbSelectArea('ZL8')
ZL8->(dbSeek(xFILIAL("ZL8")+cEvento))


nValTot:=0
For z:=1 To Len(aCols)
	
	If !aCols[z, Len(aHeader)+1]
		
		If Empty(aCols[z,GdFieldPos("ZLL_RETIRO")])
			xMagHelpFis("Mensagem",cMensagem,"InForme o produtor!")
			lRet := .F.
		EndIf
		
		If GdFieldPos("ZLL_STATUS") > 0 .and. (z == n)
			If aCols[z,GdFieldPos("ZLL_STATUS")] == "P"  
			   //xMagHelpFis("Mensagem",cMsg2,"Favor escolha entre as opções: A=Aberto e S=Suspenso")
			 	//lRet := .F.
			EndIf
		EndIf
				
		If aCols[z,GdFieldPos("ZLL_VALOR")] == 0
			xMagHelpFis("Mensagem","Convenio zerado.","Informe o valor do convenio.")
			lRet := .F.
		EndIf
		
		//cSetPrd:=POSICIONE("SA2",1,xFILIAL("SA2")+aCols[z,GdFieldPos("ZLL_RETIRO")]+aCols[z,GdFieldPos("ZLL_RETILJ")],"A2_L_LI_RO")
		dbSelectArea("SA2")
		dbSetOrder(1)
		dbSeek(xFILIAL("SA2")+aCols[z,GdFieldPos("ZLL_RETIRO")]+aCols[z,GdFieldPos("ZLL_RETILJ")])
		
		cSetPrd := SA2->A2_L_LI_RO
		//If left(cSetPrd,2) != left(cSetor,2) 
		//	xMagHelpFis("Mensagem","Produtor nao pertence ao Setor selecionado!","InForme outro Produtor ou altere o Setor.")
		//	lRet := .F.
		//EndIf
		
		// Valida movimentacao do produtor
		If lRet
			nMes:=Val(SubSTR(dtos(dVctoPr),5,2))
			nAno:=Val(SubSTR(dtos(dVctoPr),1,4))
			nMes:=nMes-1
			If nMes == 0
				nMes:=12
				nAno:=nAno-1
			EndIf
			dMvIni:= stod(ALLTRIM(STR(nAno))+StrZero(nMes,2)+"01")
			dMvFim:= LastDay(dMvIni)
			cFornCod:=aCols[z,GdFieldPos("ZLL_RETIRO")]
			cFornLj :=aCols[z,GdFieldPos("ZLL_RETILJ")]
			If left(cFornCod,1)$"C/T"
				//Retirado temporariamente, ate que entre em producao
				//If u_VolLeite(xFILIAL("ZLL"),dMvIni,dMvFim,cSetor,,cFornCod,cFornLj,"") <= 0
				//	xMagHelpFis("Falha","O produtor "+cFornCod+"-"+cFornLj+" em questao nao tem movimentacao de Leite!","Lance um produtor que tenha movimentacao!")
				//lRet:=.F.
				//EndIf
			Else
				//Retirado temporariamente, ate que entre em producao
				//If U_VolFret(xFILIAL("ZLL"),cSetor,,cFornCod,cFornLj,dMvIni,dMvFim,1) <= 0
				//	xMagHelpFis("Falha","O fretista "+cFornCod+"-"+cFornLj+" em questao nao tem movimentacao de Leite!","Lance um produtor que tenha movimentacao!")
				//lRet:=.F.
				//EndIf
			EndIf
		EndIf

		 // Atualiza campos ZLL_TXPARC, ZLL_VLRPAR, ZLL_VLRTOT
		_aParcela := CalculaJuros(z)
		If Len(_aParcela) == 3 .and. GdFieldPos("ZLL_TXPARC") > 0
			aCols[z,GdFieldPos("ZLL_TXPARC")] := _aParcela[1]
			aCols[z,GdFieldPos("ZLL_VLRPAR")] := _aParcela[2]
			aCols[z,GdFieldPos("ZLL_VLRTOT")] := _aParcela[3]
		EndIf

		nValTot += aCols[z,nPosValor]
	EndIf
Next z
If !aCols[n, Len(aHeader)+1]
	dbSelectArea("SA2")
	dbSetOrder(1)
	dbSeek(xFILIAL("SA2")+aCols[n,GdFieldPos("ZLL_RETIRO")]+aCols[n,GdFieldPos("ZLL_RETILJ")])
	
	If lRet .And. SA2->A2_MSBLQL == "1"//Bloqueado
		xMagHelpFis("Mensagem","Produtor "+SA2->A2_COD+"-"+SA2->A2_LOJA+" "+ALLTRIM(SA2->A2_NOME)+" bloqueado.","Desbloqueie o produtor ou utilize outro produtor.")
		lRet := .F.
	EndIf
	_cTipos := Alltrim(ZL8->ZL8_TIPOS)
//	If _lUserRH // Se o usuario logado for do RH, somente podera lançar debitos para funcionários.
//		_cTipos := "E"
//	EndIf
	If !Empty(_cTipos)
		If !SA2->A2_L_TPFOR $ _cTipos
			xMagHelpFis("Mensagem","Não é permitida a inclusao de convenios para cadastros do tipo "+LEFT(SA2->A2_COD,1)+" utilizando este código de evento!",;
			"Selecione outro cadastro ou contato o suporte.")
			lRet := .F.
		EndIf
	EndIf
EndIf

nPAdm := 0 //Posicione("SA2",1,xFilial("SA2")+cConven+cLjConv,"A2_L_TXCON")
nTxAdm:=nValTot*(nPAdm/100)
oValTot:Refresh()
oTxAdm:Refresh()
oTPanel1:Refresh()

OpcaoCred := 0

Return(lRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ Mod2TOk	   º Autor ³ Marcelo Sanches       º Data da Criacao  ³ 22/09/2008             						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Funcao de usuario para validar toda as linhas de dados.          											º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Tabela SA2 - Tabela de Fornecedores = (RETIROS)			                               						º±±
±±º          ³ Tabela ZLL - Cadastro de Lancamentos dos Convenios		                               						º±±
±±º          ³ O campo ZLL_RETIRO nao pode estar vazio					                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Nenhum						   							                               						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ .T. ou .F.					  							                               						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ TOTVS - Microsiga											                             					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                   							   ³                                  ³  	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function Mod2TOk()

Local lRet 	:= .T.
Local nI 	:= 0
Local cMensagem := "Não será permitido linhas sem o Produtor."
Local _aParcela

For nI := 1 To Len( aCols )
	If aCols[nI,Len(aHeader)+1]
		Loop
	EndIf
	
	If !aCols[nI, Len(aHeader)+1]
		If Empty(aCols[nI,GdFieldPos("ZLL_RETIRO")])
			xMagHelpFis("Mensagem",cMensagem,"InForme o produtor!")
			lRet := .F.
			Exit
		EndIf
		
		 // Atualiza campos ZLL_TXPARC, ZLL_VLRPAR, ZLL_VLRTOT
		_aParcela := CalculaJuros(nI)
		If Len(_aParcela) == 3 .and. GdFieldPos("ZLL_TXPARC") > 0
			aCols[nI,GdFieldPos("ZLL_TXPARC")] := _aParcela[1]
			aCols[nI,GdFieldPos("ZLL_VLRPAR")] := _aParcela[2]
			aCols[nI,GdFieldPos("ZLL_VLRTOT")] := _aParcela[3]
		EndIf
		
		
		dbSelectArea("SA2")
		dbSetOrder(1)
		dbSeek(xFILIAL("SA2")+aCols[nI,GdFieldPos("ZLL_RETIRO")]+aCols[nI,GdFieldPos("ZLL_RETILJ")])
		
		If lRet .And. SA2->A2_MSBLQL == "1"//Bloqueado
			xMagHelpFis("Mensagem","Produtor "+SA2->A2_COD+"-"+SA2->A2_LOJA+" "+ALLTRIM(SA2->A2_NOME)+" bloqueado.","Desbloqueie o produtor ou utilize outro produtor.")
			lRet := .F.
		EndIf
	EndIf
Next nI

If dVctoPr < dData
	xMagHelpFis("Mensagem","Vencimento Incorreto!","O vencimento deve ser maior ou igual a Emissao.")
	lRet := .F.
EndIf

If Empty(cSetor) .Or. Empty(cConven) .Or. Empty(cLjConv) .Or. Empty(dData) .Or. Empty(dVctoPr)  .Or. Empty(cEvento) .Or. Empty(dVctoCv)
	xMagHelpFis("Mensagem","Alguns campos obrigatorios nao Foram preenchidos","Preencha os campos obrigatorios.")
	lRet := .F.
EndIf

//If lRet
//	lRet:=vldEvento()
//EndIf

If lRet
	lRet:=U_Mod2LOk()
EndIf

Return(lRet)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ ZLLLEG	º Autor ³ Marcelo Sanches       º Data da Criacao  ³ 11/11/2008                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Mostra Legenda                                                                                               º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Mostra Legenda                                             	                                        		º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Nenhum                                                                                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum						  							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ Microsiga                                                                                					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite.                                                                        						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³00/00/0000³                               				   ³00-000000 -                       ³ TI	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function ZLLLEG()
BrwLegenda("Legenda","Status dos Convênios",{{"BR_AMARELO","Em Aberto"},{"DISABLE","Suspenso"},{"BR_AZUL","Pago"}})
Return(.T.)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ STATOBS  º Autor ³ Marcelo Sanches       º Data da Criacao  ³ 14/11/2008                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Funcao que abre uma janela e solicita o preenchimento de observacao quando o Status eh alterado para			º±±
±±º          ³ Suspenso													                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³                                                                   											º±±
±±º          ³ 	 							                                                                                º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³                                                                                      						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum					                                                                                  	º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³															                             						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite	                                                                       						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ÌÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ¹±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
/*
Static Function STATOBS()

Local oDlgConv
Private lVolta := .F.

DEFINE MSDIALOG oDlgConv	TITLE "Motivo da Suspensão"	FROM 0,0 TO 120,950 PIXEL OF oDlgConv
@ 08,09 SAY "Por favor, digite o motivo da suspensão:"	PIXEL OF oDlgConv
@ 20,09 MSGet cObserv		PICTURE "@!"	SIZE 460,10	PIXEL OF oDlgConv
@ 40,09 BUTTON "Ok"			SIZE  40,10 				PIXEL ACTION (OkFecha(), Close(oDlgConv))
@ 40,59 BUTTON "Cancela"	SIZE  40,10					PIXEL ACTION (Close(oDlgConv))
ACTIVATE DIALOG oDlgConv	CENTERED

Return
*/
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ OKFECHA  º Autor ³ Marcelo Sanches       º Data da Criacao  ³ 14/11/2008                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Funcao chamada pelo botao OK da janela anterior que se posiciona na tabela e grava a variavel digitada		º±±
±±º          ³ no campo correspondente													                               		º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Tabela ZLL                                                          											º±±
±±º          ³ 	 							                                                                                º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³                                                                                      						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum					                                                                                  	º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³															                             						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite	                                                                       						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ÌÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ¹±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
/*
Static Function OkFecha()

Local aArea := GetArea()

ZLL->(MSGoTo(nReg))

RecLock("ZLL",.F.)
Replace ZLL->ZLL_OBSERV With cObserv
MsUnlock()

lVolta := .T.
MSGSTOP("Motivo da Suspensão gravada com sucesso!!!")

RestArea(aArea)
Return lVolta
*/

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ dElse2   º Autor ³ Abrahao P. Santos     º Data da Criacao  ³ 10/02/2009                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Deleta titulo da SE2                            		    	                           						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Prefixo,Numero,Parcela,Tipo,Forn,Loja,Natureza																º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Verdadeiro = Se gravou corretamente							                         						º±±
±±º			 ³ Falso = Se ocorreu erro								                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ TOTVS - Microsiga											                             					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                   							   ³                                  ³  	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function dElse2(cpPrefixo,cpNum,cpParcela,cpTipo,cpForn,cpLoja,cpNatureza)

Local _aAutoSE2 := {}
Local lOk       := .T.

Private lMsErroAuto := .F.
/*
AAdd( _aAutoSE2, { "E2_PREFIXO"	, cpPrefixo, Nil } )
AAdd( _aAutoSE2, { "E2_NUM"		, cpNum, Nil } )
AAdd( _aAutoSE2, { "E2_PARCELA"	, cpParcela, Nil } )
AAdd( _aAutoSE2, { "E2_TIPO"	, cpTipo, Nil } )
AAdd( _aAutoSE2, { "E2_NATUREZ"	, cpNatureza, Nil } )
AAdd( _aAutoSE2, { "E2_ForNECE"	, cpForn, Nil } )
AAdd( _aAutoSE2, { "E2_LOJA"	, cpLoja, Nil } )
*/
nModulo := 6
cModulo := "FIN"

dbSelectArea("SE2")
dbSetOrder(1)
dbGoTop()
While dbSeek(xFILIAL("SE2")+cpPrefixo+cpNum+cpParcela+cpTipo+cpForn+cpLoja) .and. !Eof()
	AAdd( _aAutoSE2, { "E2_PREFIXO"	, cpPrefixo, Nil } )
	AAdd( _aAutoSE2, { "E2_NUM"		, cpNum, Nil } )
	AAdd( _aAutoSE2, { "E2_PARCELA"	, cpParcela, Nil } )
	AAdd( _aAutoSE2, { "E2_TIPO"	, cpTipo, Nil } )
	AAdd( _aAutoSE2, { "E2_NATUREZ"	, cpNatureza, Nil } )
	AAdd( _aAutoSE2, { "E2_ForNECE"	, cpForn, Nil } )
	AAdd( _aAutoSE2, { "E2_LOJA"	, cpLoja, Nil } )
	If Found()

		Pergunte("FIN050",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto
		MSExecAuto({|x,y,z| Fina050(x,y,z)},_aAutoSE2,,5)


		If lMsErroAuto
			lOk := .F.
			xMagHelpFis("Erro","Erro ao excluir o Titulo: "+cpPrefixo+cpNum+"-"+cpForn+", portanto os lançamentos deste convênio não podem ser excluídos","Comunique ao Suporte!!!")
			mostraerro()
		EndIf
	Else
		xMagHelpFis("Erro - Exclusao ","O Titulo nao foi encontrado!","Comunique ao Suporte! Indice:"+cpPrefixo+cpNum+cpParcela+cpTipo+cpForn+cpLoja)
		If MsgYesNo("Tentar gerar o titulo NF assim mesmo? ")
			lOk := .T.
		Else
			lOk := .F.
		EndIf
	EndIf
	cpParcela := Soma1(cpParcela)
	_aAutoSE2 := {}
EndDo

nModulo := 2
cModulo := "COM"

Return lOk

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ Inc_SE2  º Autor ³TOTVS TM			       º Data da Criacao  ³ 10/02/2009                					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Inclui titulo na SE2                            		    	                           						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³   Prefixo,  Num,  Parcela,  Tipo,  Forn,  Loja,  Natureza,  Emissao,  Vencto,  Valor, Acrescimo, Decrescimo. º±±
±±º			 ³	 Codigo+Loja da Operadora do Convênio, Historico do Titulo SE2.                        						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Verdadeiro = Se gravou corretamente							                         						º±±
±±º			 ³ Falso = Se ocorreu erro								                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ TOTVS - Microsiga											                             					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                   							   ³                                  ³  	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
ATENCAO - ESTA FUNCAO TAMBEM E UTILIZADA PELO FONTE MGLT025 (IMPORTACAO CONVENIO UNIMED)
*/
User Function Inc_SE2(cpPrefixo,cpNum,cpParcela,cpTipo,cpForn,cpLoja,cpNatureza,cpEmissao,cpVencto,npValor,npAcres,npDesc,cTitPai,cHist,nVlTxPer,cpEvento,_cnGuia)

Local _aAutoSE2 :={}
Local lOk       := .T.
Local aArea     := GetArea()
Local aAreaSA2  := SA2->(GetArea())
Local cEntrg    := ""
Local _nDiaVcto  := Alltrim(GetMV("LT_VENCTO")) //Parametro que indica o dia de vencimento da NDF a ser debitada do produtor
Local _nDiaVctof  := ""//Alltrim(str(GetMV("LT_VENFUNC")))
Local _nDiaVctot  := ""//Alltrim(str(GetMV("LT_VENTRAN")))

Private lMsErroAuto := .F.

DEFAULT nVlTxPer  := 0 //If(cpTipo=="NDF",Round((U_BUSCATAXA("BOL","BO")/30),4),0)//Se eh debito do produtor, grava valor da Taxa de Permanencia para cobrar juros.
DEFAULT cTitPai := ""
DEFAULT cHist   := "GLT-CONVENIO"


dbSelectArea("SA2")
dbSetOrder(1)
dbSeek(xFILIAL("SA2")+cpForn+cpLoja)
cEntrg := "010101" // U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,cpEmissao)//Filial de entrega da linha do produtor
        

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Tratamento para evitar erro, quando a funcao Inc_SE2 eh chamada pela importacao dos convenios.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If Type("cSetor") == "U"
	cSetor := ALLTRIM(GetMv("LT_CODSETO"))//Codigo default do setor
EndIf

AAdd( _aAutoSE2, { "E2_PREFIXO"	, cpPrefixo , Nil } )
AAdd( _aAutoSE2, { "E2_NUM"		, cpNum     , Nil } )
AAdd( _aAutoSE2, { "E2_PARCELA"	, cpParcela , Nil } )
AAdd( _aAutoSE2, { "E2_TIPO"	, cpTipo    , Nil } )
AAdd( _aAutoSE2, { "E2_NATUREZ"	, cpNatureza, Nil } )
AAdd( _aAutoSE2, { "E2_FORNECE"	, cpForn    , Nil } )
AAdd( _aAutoSE2, { "E2_LOJA"	, cpLoja    , Nil } )
AAdd( _aAutoSE2, { "E2_EMISSAO"	, cpEmissao , Nil } )
AAdd( _aAutoSE2, { "E2_EMIS1"	, cpEmissao , Nil } )
AAdd( _aAutoSE2, { "E2_VENCTO"	, cpVencto  , Nil } )//Data base do sistema
AAdd( _aAutoSE2, { "E2_VENCREA"	, cpVencto  , Nil } )
AAdd( _aAutoSE2, { "E2_VALOR"	, npValor   , Nil } )
AAdd( _aAutoSE2, { "E2_PORCJUR" , nVlTxPer  , Nil } )
AAdd( _aAutoSE2, { "E2_ACRESC"	, npAcres   , Nil } )
AAdd( _aAutoSE2, { "E2_DECRESC"	, npDesc    , Nil } )
AAdd( _aAutoSE2, { "E2_HIST"	, cHist     , Nil } )
AAdd( _aAutoSE2, { "E2_DATALIB"	, cpEmissao , Nil } )
AAdd( _aAutoSE2, { "E2_USUALIB"	, ALLTRIM(cUserName), Nil } )
AAdd( _aAutoSE2, { "E2_L_SETOR"	, cSetor    , Nil } )
AAdd( _aAutoSE2, { "E2_L_PAICV"	, cTitPai   , Nil } )
AAdd( _aAutoSE2, { "E2_L_FILEN" , cEntrg    , Nil } )
If !Empty(_cnGuia)
	AAdd( _aAutoSE2, { "E2_C_NGUIA" , _cnGuia    , Nil } ) //Caso título seja guia medica 
EndIf
AAdd( _aAutoSE2, { "E2_L_EVENT"	, cpEvento    , Nil } )

//AAdd( _aAutoSE2, { "E2_ORIGEM"	, "AGLT010" , Nil } )
nModulo := 6
cModulo := "FIN"

Pergunte("FIN050",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto
MSExecAuto({|x,y| Fina050(x,y)},_aAutoSE2,3) //Inclusao dos lancamentos do convenio no financeiro.
If lMsErroAuto
	lOk := .F.
	xMagHelpFis("Erro","Erro ao incluir Titulo: "+cpPrefixo+cpNum+"-"+cpForn,"Comunique ao Suporte!!!")
	mostraerro()
EndIf
nModulo := 2
cModulo := "COM"

RestArea(aArea)
RestArea(aAreaSA2)
Return lOk

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ Grava    º Autor ³ Abrahao P. Santos     º Data da Criacao  ³ 10/02/2009                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Grava inclusao,alteracao e exclusao na SE2 e ZLL		    	                           						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ nOpc = 3-Inclusao 4-Alteracao 5-exclusao            		                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum              									                               							º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ TOTVS - Microsiga											                             					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                   							   ³                                  ³  	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function Grava(nOpcao)

Local aArea     := GetArea()
Local nVlrTotal := 0
Local nX        := 0
Local cPrefixo  := "" //GetMv("LT_CONVPRE")
Local cCod      := cCodigo
Local dVecto    := dVctoPr
Local lContinue := .F.
Local lDeuErro  := .F.
Local lIncSE2ok	:= .T.
Local nVlrSE2	:= 0
Local nAcrSE2	:= 0
Local cCarencia	:= "N"
Local aDadosBanc := {}
Local _nX := 0


If nOpcao == 3
	lContinue := .T.
EndIf

// ------------------------------------------------
// Preenche a Natureza do titulo NDF e o Prefixo
// ------------------------------------------------
dbSelectArea('ZL8')
ZL8->(dbSeek(xFILIAL("ZL8")+cEvento))
cNatNDF  := ZL8->ZL8_NATPRD
cNatNF	:= ZL8->ZL8_NATFRT
cPrefixo := ZL8->ZL8_PREFIX
cGerNfCv := ZL8->ZL8_GERNFC//Define se gera Titulo NF do convenio

//Semaforo para pemitir a gravação de mais de um usuário por vez
While !LockByName("AGLT10",.T.,.F. )
	MsAguarde({|| Sleep(2000) }, "Semaforo de processamento...", "Aguarde, salvando registros")              
	If _nX > 60
		If !MsgYesNo("O processo está preso por outro usuário. Deseja continuar aguardando?"+_ENTER;
				+"Caso você clique em NAO, os dados digitados serão perdidos!!")
				FreeUsedCode()  //libera codigos de correlativos reservados pela MayIUseCode()
				Return
		EndIf
		_nX := 0
	EndIf
	_nX++
EndDo 



Begin Transaction
// ----------------------------------------
// Exclui titulo NF da loja conveniada
// quando For alteracao ou exclusao
// ----------------------------------------
//Se alteracao
If nOpcao == 4
	//Se gera o titulo NF do convenio igual a Sim
	If cGerNfCv == "S"
		If dElse2(cPrefixo,cCod+"000",cParcela,"NF ",cConven,cLjConv,cNatNF)
			lContinue := .T.
		Else
			lDeuErro := .T.
		EndIf
	Else
		lContinue:=.T.
	EndIf
	
	//Se Exclusao
ElseIf nOpcao == 5
	//Se gera o titulo NF do convenio igual a Sim
	If cGerNfCv == "S"
		If dElse2(cPrefixo,cCod+"000",cParcela,"NF ",cConven,cLjConv,cNatNF)
			lContinue:=.T.
		Else
			lDeuErro := .T.
		EndIf
	Else
		lContinue:=.T.
	EndIf
ElseIf nOpcao == 3//Inclusao
	//Verifica se o codigo esta ou nao duplicado
	//caso esteja duplicado incrementa o codigo

	dbSelectArea("ZLL")
	dbSetOrder(1)
	While ( dbSeek(xFILIAL("ZLL")+cCod+"001") .or. !MayIUseCode("ZLL" + xFilial("ZLL") + cCod) )
		//verifica se esta na memoria, sendo usado e busca o proximo numero disponivel
		cCod := SOMA1(cCod)			  
	EndDo
	RestArea(aArea)

EndIf

// --------------------------------------------
// Se ocorreu erros na exclusao ou alteracao
// cancela a gravacao
// --------------------------------------------
If !lContinue
	DisarmTransaction()
	UnLockByName("AGLT10",.T.,.F.)   //Libera o semáforo  
	FreeUsedCode()  //libera codigos de correlativos reservados pela MayIUseCode()
	Return()
EndIf

// ----------------
// Trata os NDF's
// ----------------
For nX:=1 To Len(aCols)
	
	cISeq 	:= aCols[nX,GdFieldPos("ZLL_SEQ")]
	cIPrd 	:= aCols[nX,GdFieldPos("ZLL_RETIRO")]
	cIPrdlj := aCols[nX,GdFieldPos("ZLL_RETILJ")]
	cIDescri:= aCols[nX,GdFieldPos("ZLL_DCRRET")]
	nIVlr 	:= aCols[nX,GdFieldPos("ZLL_VALOR")]
	cIStat 	:= IIf(GdFieldPos("ZLL_STATUS")==0,"A",aCols[nX,GdFieldPos("ZLL_STATUS")])	
	cCarencia	:= IIF(GdFieldPos("ZLL_CARENC")==0,"N",aCols[nX,GdFieldPos("ZLL_CARENC")])
	nIVlrparc 	:= IIf(GdFieldPos("ZLL_VLRPAR")==0,aCols[nX,GdFieldPos("ZLL_VALOR")],aCols[nX,GdFieldPos("ZLL_VLRPAR")])
	nParcela 	:= IIF(GdFieldPos("ZLL_PARCEL")==0,1,aCols[nX,GdFieldPos("ZLL_PARCEL")])
	nIVlrtot 	:= IIF(GdFieldPos("ZLL_VLRTOT")==0,aCols[nX,GdFieldPos("ZLL_VALOR")],aCols[nX,GdFieldPos("ZLL_VLRTOT")])
	nTxPar 	:= IIF(GdFieldPos("ZLL_TXPARC")==0,0,aCols[nX,GdFieldPos("ZLL_TXPARC")])

	lLinDeleted := aCols[nX,Len(aHeader)+1]

	
	If nIVlrparc == 0
		nIVlrparc := nIVlr
		nIVlrtot	:= nIVlr
	EndIf

	nVlrSE2 := nIVlr / nParcela		//Valor a ser gravano no E2_VALOR quando for NDF
	nAcrSE2	:= nIVlrparc - nVlrSE2	//Valor a ser gravado no E2_ACRESC quando for NDF
	
	// ----------------------------
	// INCLUSAO - Gera SE2 e ZLL
	// ----------------------------
	If nOpcao == 3
		// ----------------------------
		// Se a linha NAO foi deletada
		// ----------------------------
		If !lLinDeleted
			_aVenctos := SomaMes(dVctoPr,nParcela)
			

			
			For nPrc:= 1 to nParcela
				//lIncSE2ok := U_Inc_SE2(cPrefixo,cCod+cISeq,cParcela,"NDF",cIPrd,cIPrdLj,cNatNDF,dData,_aVenctos[nPrc],nVlrSE2,nAcrSE2,0,cConven+cLjConv,cObs,NoRound(nTxPar/30,4),cEvento,"")
				lIncSE2ok := U_IncluSE1(cPrefixo,cCod+cISeq,cParcela,"NF",cIPrd,cIPrdLj,cNatNDF,dData,_aVenctos[nPrc],nVlrSE2,nAcrSE2,0,cConven+cLjConv,cObs,NoRound(nTxPar/30,2),cEvento,"AGLT010")				

			
			
				cParcela := SOMA1(cParcela)
				
			Next nPrc
			cParcela  := StrZero(1,TamSX3("E2_PARCELA")[1])			
			If lIncSE2ok
				U_Inc_ZLL(cCod,cISeq,cIPrd,cIPrdLj,cIDescri,nIVlr,cIStat,,,,,,,,,,,cObs,nParcela,nIVlrparc,nIVlrtot,nTxPar,0,cCarencia)
				nVlrTotal += nIVlr
			Else
				lDeuErro := .T.
			EndIf
		EndIf
	EndIf
	
	// ----------------------------
	// ALTERACAO - Verifica mudancas
	// ----------------------------
	If nOpcao == 4
	
		// ----------------------------
		// Se a linha NAO foi deletada
		// ----------------------------
		If !lLinDeleted
			// -------------------------------------------------------------------------
			// Se a Linha foi alterada entao deleta SE2,ZLL e gera com novos valores
			// -------------------------------------------------------------------------
			If Alterado(cCod,cISeq,cIPrd,nIVlr,cIStat,nIVlrparc,nParcela,dVctoCv,dData)
				//Alterado para deletar o titulo quando o mesmo For suspenso
				If dElse1(cPrefixo,cCod+cISeq,cParcela,"NF ","","",cNatNDF) //dElse2(cPrefixo,cCod+cISeq,cParcela,"NDF","","",cNatNDF)
					DelZLL(cCod,cISeq)
					If cIStat <> "S" //Se status diferente de suspenso grava SE2 e ZLL
						_aVenctos := SomaMes(dVctoPr,nParcela)
												
						For nPrc:= 1 to nParcela
							//lIncSE2ok := U_Inc_SE2(cPrefixo,cCod+cISeq,cParcela,"NDF",cIPrd,cIPrdLj,cNatNDF,dData,_aVenctos[nPrc],nVlrSE2,nAcrSE2,0,cConven+cLjConv,cObs,NoRound(nTxPar/30,2),cEvento)
							lIncSE2ok := U_IncluSE1(cPrefixo,cCod+cISeq,cParcela,"NF",cIPrd,cIPrdLj,cNatNDF,dData,_aVenctos[nPrc],nVlrSE2,nAcrSE2,0,cConven+cLjConv,cObs,NoRound(nTxPar/30,2),cEvento,"AGLT010")				
							cParcela := SOMA1(cParcela)
						Next nPrc
						cParcela  := StrZero(1,TamSX3("E2_PARCELA")[1])			
						If lIncSE2ok // U_Inc_SE2(cPrefixo,cCod+cISeq,cParcela,"NDF",cIPrd,cIPrdLj,cNatNDF,dData,dVecto,nIVlr,0,0,cConven+cLjConv,cObs)
							U_Inc_ZLL(cCod,cISeq,cIPrd,cIPrdLj,cIDescri,nIVlr,cIStat,,,,,,,,,,,cObs,nParcela,nIVlrparc,nIVlrtot,nTxPar,0,cCarencia)
							nVlrTotal +=nIVlr
						Else
							lDeuErro := .T.
						EndIf
					Else//Senao, ja deleto o SE2 e grava somente ZLL
						U_Inc_ZLL(cCod,cISeq,cIPrd,cIPrdLj,cIDescri,nIVlr,cIStat,,,,,,,,,,,cObs,nParcela,nIVlrparc,nIVlrtot,nTxPar,0,cCarencia)
					EndIf
				Else
					lDeuErro := .T.
				EndIf
			Else
				//Verifica se existe na ZLL, caso exista verifica se foi suspenso
				dbSelectArea("ZLL")
				dbSetOrder(1)
				If dbSeek(xFILIAL("ZLL")+cCod+cISeq)
					If ZLL->ZLL_STATUS <> "S" //Se o status For diferente de Suspenso
						If naoExist(cPrefixo,cCod+cISeq,cParcela,"NF ",cIPrd,cIPrdLj)
						_aVenctos := SomaMes(dVctoPr,nParcela)
							For nPrc:= 1 to nParcela
								//lIncSE2ok := U_Inc_SE2(cPrefixo,cCod+cISeq,cParcela,"NDF",cIPrd,cIPrdLj,cNatNDF,dData,_aVenctos[nPrc],nVlrSE2,nAcrSE2,0,cConven+cLjConv,cObs,NoRound(nTxPar/30,2),cEvento)
								lIncSE2ok := U_IncluSE1(cPrefixo,cCod+cISeq,cParcela,"NF",cIPrd,cIPrdLj,cNatNDF,dData,_aVenctos[nPrc],nVlrSE2,nAcrSE2,0,cConven+cLjConv,cObs,NoRound(nTxPar/30,2),cEvento,"AGLT010")				
								cParcela := SOMA1(cParcela)
							Next nPrc
							cParcela  := StrZero(1,TamSX3("E2_PARCELA")[1])			
							If lIncSE2ok // U_Inc_SE2(cPrefixo,cCod+cISeq,cParcela,"NDF",cIPrd,cIPrdLj,cNatNDF,dData,dVecto,nIVlr,0,0,cConven+cLjConv,cObs)
								U_Inc_ZLL(cCod,cISeq,cIPrd,cIPrdLj,cIDescri,nIVlr,cIStat,,,,,,,,,,,cObs,nParcela,nIVlrparc,nIVlrtot,nTxPar,0,cCarencia)
							Else
								lDeuErro := .T.
							EndIf
						EndIf
						nVlrTotal +=nIVlr//Valor total do titulo NF
					EndIf
				Else//Se nao existe na ZLL eh porque alterou o convenio e criou uma nova linha
					If naoExist(cPrefixo,cCod+cISeq,cParcela,"NF ",cIPrd,cIPrdLj)
						_aVenctos := SomaMes(dVctoPr,nParcela)
						For nPrc:= 1 to nParcela
							//lIncSE2ok := U_Inc_SE2(cPrefixo,cCod+cISeq,cParcela,"NDF",cIPrd,cIPrdLj,cNatNDF,dData,_aVenctos[nPrc],nVlrSE2,nAcrSE2,0,cConven+cLjConv,cObs,NoRound(nTxPar/30,2),cEvento)
							lIncSE2ok := U_IncluSE1(cPrefixo,cCod+cISeq,cParcela,"NF",cIPrd,cIPrdLj,cNatNDF,dData,_aVenctos[nPrc],nVlrSE2,nAcrSE2,0,cConven+cLjConv,cObs,NoRound(nTxPar/30,2),cEvento,"AGLT010")				
							cParcela := SOMA1(cParcela)
						Next nPrc
						cParcela  := StrZero(1,TamSX3("E2_PARCELA")[1])			
						If lIncSE2ok // U_Inc_SE2(cPrefixo,cCod+cISeq,cParcela,"NDF",cIPrd,cIPrdLj,cNatNDF,dData,dVecto,nIVlr,0,0,cConven+cLjConv,cObs)
							U_Inc_ZLL(cCod,cISeq,cIPrd,cIPrdLj,cIDescri,nIVlr,cIStat,,,,,,,,,,,cObs,nParcela,nIVlrparc,nIVlrtot,nTxPar,0,cCarencia)
						Else
							lDeuErro := .T.
						EndIf
					EndIf
					nVlrTotal +=nIVlr//Valor total do titulo NF
				EndIf
			EndIf
			// ---------------------------------------------------------------------
			// Se a linha foi deletada, deleta no SE2 e ZLL
			// ---------------------------------------------------------------------
		Else
			If dElse1(cPrefixo,cCod+cISeq,cParcela,"NF ",cIPrd,cIPrdLj,cNatNDF) //dElse2(cPrefixo,cCod+cISeq,cParcela,"NDF",cIPrd,cIPrdLj,cNatNDF)
				DelZLL(cCod,cISeq)
			Else
				lDeuErro := .T.
			EndIf
		EndIf
	EndIf
	
	// ----------------------------
	// EXCLUSAO - Deleta SE2 e ZLL
	// ----------------------------
	If nOpcao == 5

		dbSelectArea("ZLL")
		dbSetOrder(1)
		If dbSeek(xFILIAL("ZLL")+cCod+cISeq)
			If ZLL->ZLL_STATUS <> "S" //Se o status For diferente de Suspenso
				If dElse1(cPrefixo,cCod+cISeq,cParcela,"NF ",cIPrd,cIPrdLj,cNatNDF)  //dElse2(cPrefixo,cCod+cISeq,cParcela,"NDF",cIPrd,cIPrdLj,cNatNDF)
					DelZLL(cCod,cISeq)
				Else
					lDeuErro := .T.
				EndIf
			Else//Se For suspenso, deleta so a ZLL, pois nao existe SE2
				DelZLL(cCod,cISeq)
			EndIf
		EndIf
	EndIf
Next nX

// -------------------------------------
// Trata o NF (titulo da loja conveniada)
// -------------------------------------
//Se inclusao e Gera Titulo NF de convenio igual a Sim
If nOpcao == 3 .And. cGerNfCv == 'S'
	If !U_Inc_SE2(cPrefixo,cCod+"000",cParcela,"NF ",cConven,cLjConv,cNatNF,dData,dVctoCv,nVlrTotal,nAcresc,nTxAdm,"",cObs,0,cEvento)
		lDeuErro := .T.
	EndIf
	//Se alteracao e Gera Titulo NF de convenio igual a Sim
ElseIf nOpcao == 4 .and. cGerNfCv == 'S'
	If !U_Inc_SE2(cPrefixo,cCod+"000",cParcela,"NF ",cConven,cLjConv,cNatNF,dData,dVctoCv,nVlrTotal,nAcresc,nTxAdm,"",cObs,0,cEvento)
		//AtuTaxas()
		lDeuErro := .T.
	EndIf
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Se houve alguma falha, desfaz todas as transacoes.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If lDeuErro
	DisarmTransaction()
	UnLockByName("AGLT10",.T.,.F.)     
	FreeUsedCode()  //libera codigos de correlativos reservados pela MayIUseCode()
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Finaliza o controle de transacao, caso nao hajam falhas. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
End Transaction

If !lDeuErro
	UnLockByName("AGLT10",.T.,.F.)     
	FreeUsedCode()  //libera codigos de correlativos reservados pela MayIUseCode()

EndIf

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ Inc_ZLL  º Autor ³ Abrahao P. Santos     º Data da Criacao  ³ 10/02/2009                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Grava registro na ZLL                           		    	                           						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Codigo,Sequencia,Retiro,Loja,Nome,Valor,Status)																º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum               								    	                           						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ TOTVS - Microsiga											                             					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                   							   ³                                  ³  	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
ATENCAO - ESTA FUNCAO TAMBEM E UTILIZADA PELO FONTE MGLT025 (IMPORTACAO CONVENIO UNIMED)
*/
User Function Inc_ZLL(cCod,cSeq,cRetiro,cLoja,cNome,nValor,cStatus,_dData,_dVcto,_cConven,_cLjConv,_cSetor,_cNatur,_cEvento,_nAcresc,_nTxAdm,_FilOri,cObs,nParcela,nIVlrparc,nIVlrtot,nTxPar,_nVlrINSS,_cCarencia)


DEFAULT _dData   := dData
DEFAULT _dVcto   := dVctoPr
DEFAULT _cConven := cConven
DEFAULT _cLjConv := cLjConv
DEFAULT _cSetor  := cSetor
DEFAULT _cNatur  := ""
DEFAULT _cEvento := cEvento
DEFAULT _nAcresc := nAcresc
DEFAULT _nTxAdm  := nTxAdm
DEFAULT _nVlrINSS := 0 	// Utilizado no programa MGLT025 Importação UNIMED
DEFAULT _cCarencia := "N"

dbSelectArea("ZLL")
dbSetOrder(1)

RecLock("ZLL",.T.)
ZLL->ZLL_FILIAL	:= xFILIAL("ZLL")
ZLL->ZLL_COD	:= cCod
ZLL->ZLL_SEQ	:= cSeq
ZLL->ZLL_DATA	:= _dData
ZLL->ZLL_VENCTO	:= _dVcto
ZLL->ZLL_VENCON := dVctoCv
ZLL->ZLL_CONVEN	:= _cConven
ZLL->ZLL_LJCONV	:= _cLjConv
ZLL->ZLL_RETIRO	:= cRetiro
ZLL->ZLL_RETILJ	:= cLoja
ZLL->ZLL_DCRRET	:= cNome
ZLL->ZLL_VALOR	:= nValor
ZLL->ZLL_STATUS	:= "A" //cStatus
ZLL->ZLL_SETOR	:= _cSetor
ZLL->ZLL_NATURE	:= _cNatur
ZLL->ZLL_EVENTO := _cEvento
ZLL->ZLL_ACRESC := _nAcresc
ZLL->ZLL_TXADM  := _nTxAdm
ZLL->ZLL_OBSERV := cObs
ZLL->ZLL_PARCEL	:= nParcela
ZLL->ZLL_VLRPAR	:= nIVlrparc
ZLL->ZLL_VLRTOT	:= nIVlrtot
ZLL->ZLL_TXPARC	:= nTxPar
//ZLL->ZLL_FILENT := "010101" //U_GetFilEnt(cRetiro+cLoja,_dData)//Filial de entrega da linha do produtor
//ZLL->ZLL_INSS	:= _nVlrINSS
//ZLL->ZLL_CARENC	:= _cCarencia


MsUnLock()
         

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ DelZLL   º Autor ³ Abrahao P. Santos     º Data da Criacao  ³ 10/02/2009                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Deleta registro na ZLL                          		    	                           						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Codigo, Sequencia                                   		                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum             										                               						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ TOTVS - Microsiga											                             					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                   							   ³                                  ³  	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function DelZLL(cCod,cSeq)

dbSelectArea("ZLL")
dbSetOrder(1)
dbSeek(xFILIAL("ZLL")+cCod+cSeq)

If Found()
	RecLock("ZLL",.F.)
	dbDelete()
	MsUnlock()
EndIf

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ Alterado º Autor ³ Abrahao P. Santos     º Data da Criacao  ³ 10/02/2009                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Verifica se o item foi alterado                 		    	                           						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Codigo,Sequencia,Fornecedor,Valor                   		                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Verdadeiro = se foi alterado	                               													º±±
±±º			 ³ Falso = se nao foi alterado										                     						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ TOTVS - Microsiga											                             					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                   							   ³                                  ³  	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function Alterado(cCod,cSeq,nPrd,nVlr,cStat,nVlrparc,nParc,xdVctoCv,xdData)

dbSelectArea("ZLL")
dbSetOrder(1)
dbSeek(xFILIAL("ZLL")+cCod+cSeq)
If Found()
	If ZLL->ZLL_RETIRO != nPrd .Or. ZLL->ZLL_VALOR != nVlr .Or. ZLL->ZLL_STATUS != cStat  .Or.;
	 ZLL->ZLL_VLRPAR != nVlrparc  .Or. ZLL->ZLL_PARCEL != nParc .Or. ZLL->ZLL_VENCON != xdVctoCv .and. ZLL->ZLL_DATA != xdData
		Return .T.
	EndIf
EndIf

Return(.F.)


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³naoExist  ºAutor  ³Abrahao             º Data ³  09/10/09   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Verifica se o titulo nao existe no financeiro               º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP10                                                       º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function naoExist(cpPrefixo,cpNum,cpParcela,cpTipo,cpForn,cpLoja)

dbSelectArea("SE1")
dbSetOrder(1)
dbGoTop()

If dbSeek(xFILIAL("SE1")+cpPrefixo+cpNum+cpParcela+cpTipo)
	Return .F.
EndIf

/*
dbSelectArea("SE2")
dbSetOrder(1)
dbGoTop()

If dbSeek(xFILIAL("SE2")+cpPrefixo+cpNum+cpParcela+cpTipo+cpForn+cpLoja)
	Return .F.
EndIf
*/
Return(.T.)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ getNewNumº Autor ³ Abrahao P. Santos     º Data da Criacao  ³ 10/02/2009                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Retorna novo numero sequencial do ZLL_COD       		    	                           						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Nenhum                                              		                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Codigo do Convenio          	                               													º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ TOTVS - Microsiga											                             					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                   							   ³                                  ³  	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function getNewNum()

Local aArea := GetArea()
Local cRet  := ""

cQuery:=" SELECT MAX(ZLL_COD) AS ULTIMO "
cQuery+=" FROM "+RetSqlName("ZLL")+" ZLL "
cQuery+=" WHERE D_E_L_E_T_ = ' ' "
cQuery+=" AND ZLL_FILIAL = '"+xFILIAL("ZLL")+"' "

If Select("TRB") > 0
	TRB->(dbCloseArea())
EndIf

DbUseArea(.T., "TOPCONN", TCGenQry(,,cQuery), "TRB", .F., .T.)


If !TRB->(Eof())
	cRet := StrZero(Val(TRB->ULTIMO)+1,6)
	While !MayIUseCode("ZLL" + xFilial("ZLL") + cRet)  //verifica se esta na memoria, sendo usado
		cRet := Soma1(cRet)					           // busca o proximo numero disponivel
	EndDo
EndIf
TRB->(dbCloseArea())
/*

cRet := GETSXENUM( "ZLL","ZLL_COD")
While !MayIUseCode("ZLL_COD" + xFilial("ZLL") + cRet)  //verifica se esta na memoria, sendo usado
	cRet := GETSXENUM( "ZLL","ZLL_COD")		           // busca o proximo numero disponivel
EndDo
*/

RestArea(aArea)
Return cRet


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ValVencto ºAutor  ³Abrahao             º Data ³  09/10/09   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Valida data do vencimento                                   º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP10                                                       º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function valVencto()
/*
Local dDtValida := CTOD("")
Local nCont     := 0
Local nDiaAux   := nDiaConv

If dData > dVctoPr
xMagHelpFis("Vencimento","Vencimento incorreto!","O vencimento deve ser maior ou igual a emissao.")
Return .F.
Else
dDtValida := STOD(SubSTR(DTOS(dVctoPr),1,6)+StrZero(nDiaAux,2))
EndIf

//Tratamento para garantir que caso seja vencimento em 31 e o mes atual so tenha 30 dias
//sera alterado automaticamente do dia 31 para 30.
While nCont == 0
If !Empty(dDtValida)
nCont := 1
Else
nDiaAux  := nDiaAux - 1
dDtValida := STOD(SubSTR(DTOS(dVctoPr),1,6)+StrZero(nDiaAux,2))
nCont := 0
EndIf
EndDo

//Atualiza a data do convenio baseada no dia de vencimento do cadastro e vencimento informado pelo usuario
dVctoCv := dDtValida
*/

If dData > dVctoPr
	xMagHelpFis("Produtor","Vencimento do Produtor incorreto!","O vencimento deve ser maior ou igual a emissao.")
	Return .F.
ElseIf !Empty(dVctoCv)//So valida se o usuario digitar o campo
	If dData > dVctoCv
		xMagHelpFis("Convenio","Vencimento da Loja Conveniada incorreto!","O vencimento deve ser maior ou igual a emissao.")
		Return .F.
	EndIf
EndIf

Return .T.


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³vldEvento ºAutor  ³Abrahao             º Data ³  09/10/09   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Valida se evento e financeiro                              º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP10                                                       º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function vldEvento()

dbSelectArea("ZL8")
dbSetOrder(1)
If dbSeek(xFILIAL("ZL8")+cEvento)
	If ZL8->ZL8_TPEVEN != "F" .Or. ZL8->ZL8_PREFIX == "" .Or. ZL8->ZL8_DEBCRE != "D"
		xMagHelpFis("Evento Incorreto","O Evento precisa ser Financeiro e de Débito com Prefixo para ser utilizado!","Selecione um evento tipo Financeiro tipo Débito com Prefixo!")
		Return(.F.)
	EndIf
	If ZL8->ZL8_CONVEN != "S"
		xMagHelpFis("Evento Incorreto","O Evento precisa estar com campo Usado em convenio = Sim!","Selecione um evento de convenio ou corrija o cadastro de convenio!")
		Return(.F.)
	EndIf
//	If ZL8->ZL8_CONVEN == 'S' .AND. ZL8->ZL8_RATEIO == 'S'
 //		ProcRat()
 //	EndIf
Else
	Return(.F.)
EndIf

Return(.T.)


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ ProcRat  º Autor ³ IRENIO S. OLIVEIRA º Data ³  24/11/10   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ GERA DADOS NO ACOLS CONFORME REGRA DE RATEIO               º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³                                                            º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function ProcRat()

Local oDlgConv
Local oValRat
Local nValRat := 0
Local oGroup1
Local oGroup2
Local oSay1
Local oSay2
Local oSay3
Local oSay4
Local oSay5
Local oSay6
Local oSButton1
Local oSButton2

Local cOpc    := 0
Local nX      := 0
Local aDadRat := {}
Local cQuery  := ""
Local nResul  := 0
Local nSldDev := 0
Local nTotRat := 0//Valor Total do Rateio

Private oTanque
Private cTanque := Space(6)
Private oNomTq
Private cNomTq  := Space(40)
Private oCodPro
Private cCodPro := Space(6)
Private oLojPro
Private cLojPro := Space(2)
Private oNomPro
Private cNomPro := Space(40)
Private oValFix
Private nValFix := 0

DEFINE MSDIALOG oDlgConv TITLE "Informe os Dados do Rateio" FROM 000,000 TO 450,495 PIXEL OF oDlgConv

@ 006,004 GROUP oGroup1 TO 078, 245 PROMPT "Dados do Tanque" OF oDlgConv PIXEL

@ 018,009 SAY oSay1 PROMPT "Codigo" SIZE 025,007 PIXEL OF oDlgConv
@ 028,009 MSGET oTanque VAR cTanque SIZE 060,010 WHEN .T. VALID VldTanq(cTanque) OF oDlgConv F3 "ZLS_01" PIXEL
@ 028,075 MSGET oNomTq  VAR cNomTq  SIZE 163,010 WHEN .F. OF oDlgConv PIXEL

@ 047,009 SAY oSay2 PROMPT "Valor Rateio" SIZE 041, 007   OF oDlgConv PIXEL
@ 057,009 MSGET oValRat VAR nValRat PICTURE "@E 999,999.99" SIZE 060,010 WHEN .T. OF oDlgConv PIXEL

@ 094,004 GROUP oGroup2 TO 201, 245 PROMPT "Dados do Titular" OF oDlgConv PIXEL

@ 110,009 SAY oSay3 PROMPT "Codigo" SIZE 025,007 OF oDlgConv PIXEL
@ 121,009 MSGET oCodPro VAR cCodPro SIZE 060,010 WHEN .F. OF oDlgConv PIXEL

@ 110,082 SAY oSay4 PROMPT "Loja"   SIZE 025,007 OF oDlgConv PIXEL
@ 121,080 MSGET oLojPro VAR cLojPro SIZE 022,010 WHEN .F. OF oDlgConv PIXEL

@ 139,009 SAY oSay5 PROMPT "Nome"   SIZE 025,007 OF oDlgConv PIXEL
@ 148,009 MSGET oNomPro VAR cNomPro SIZE 225,010 WHEN .F. OF oDlgConv PIXEL

@ 166,009 SAY oSay6 PROMPT "Valor Fixo" SIZE 025,007 OF oDlgConv PIXEL
@ 178,009 MSGET oValFix VAR nValFix     PICTURE "@E 999,999.99" SIZE 060,010 WHEN .T. OF oDlgConv PIXEL

DEFINE SBUTTON oSButton1 FROM 209, 186 TYPE 01 OF oDlgConv ENABLE ACTION (cOpc:= 1,Close(oDlgConv))
DEFINE SBUTTON oSButton2 FROM 209, 217 TYPE 02 OF oDlgConv ENABLE ACTION (Close(oDlgConv))

ACTIVATE MSDIALOG oDlgConv CENTERED

If cOpc == 1
	
	//Rateia a conta de energia menos o valor fixo, porque o valor fixo
	//quem paga eh o titular, pois se trata da energia da casa dele
	nResul := nValRat - nValFix
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Posiciona no cadastro de Tanques - Cabecalho. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	dbSelectArea("ZLS")
	dbSetOrder(1)
	If dbSeek(xFILIAL("ZLS")+cTanque)
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Posiciona no cadastro de Tanques - Itens.     ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		dbSelectArea("ZLT")
		dbSetOrder(1)//ZLT_FILIAL+ZLT_COD+ZLT_SA2COD+ZLT_SA2LJ
		dbSeek(xFILIAL("ZLT")+cTanque,.T.)
		While ZLT->(!Eof()) .And. ZLT->(ZLT_FILIAL+ZLT_COD) == xFILIAL("ZLT")+cTanque
			
			//Se for o titular ele paga o valor fixo mais o rateio
			//O valor fixo eh a despesa de energia da casa dele
			//e o valor do rateio eh a despesa de energia do tanque
			If ZLT->ZLT_TITULA == "S"
				//Uso o Round de 2 pois o campo ZLL_VALOR e E2_VALOR so tem duas casas decimais
				nSldDev := Round(nResul * (U_PercAgr(cTanque,"E",ZLT->ZLT_SA2COD,ZLT->ZLT_SA2LJ,FirstDay(dDataBase),LastDay(dDataBase))/100),2)
				nTotRat += nSldDev
				nSldDev := nValFix + nSldDev
				AADD(aDadRat,{ZLT->ZLT_SA2COD,ZLT->ZLT_SA2LJ,ZLT->ZLT_SA2NOM,nSldDev})
			Else
				nSldDev := Round(nResul * (U_PercAgr(cTanque,"E",ZLT->ZLT_SA2COD,ZLT->ZLT_SA2LJ,FirstDay(dDataBase),LastDay(dDataBase))/100),2)
				AADD(aDadRat,{ZLT->ZLT_SA2COD,ZLT->ZLT_SA2LJ,ZLT->ZLT_SA2NOM,nSldDev})
				nTotRat += nSldDev
			EndIf
			
			ZLT->(dbSkip())
		EndDo
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Verifica o tamanho da diferenca                 ³
		//³ Se o valor total do que foi rateado             ³
		//³ menos o valor total do que tem que ser rateado  ³
		//³ for ate r$ 0,05 centavos, ajusta.               ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		nDif := nResul - nTotRat
		If nDif >= -0.05 .And. nDif <= 0.05
			aDadRat[Len(aDadRat)][4] += nDif
		EndIf
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Preenche o aCols com os produtores participantes do tanque. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		aCols := {}
		For nX := 1 To Len(aDadRat)
			aAdd(aCols, Array(Len(aHeader) + 1))
			For nConFie := 1 To Len(aHeader)
				aCols[Len(aCols), nConFie] := CriaVar(aHeader[nConFie, 2])
			Next nConFie
			aCols[Len(aCols), Len(aHeader) + 1] := if(aDadRat[nX][4] >0,.F.,.T.)
			GdFieldPut("ZLL_SEQ"   , StrZero(nX,3), Len(aCols))
			GdFieldPut("ZLL_RETIRO"   , aDadRat[nX][1], Len(aCols))
			GdFieldPut("ZLL_RETILJ"   , aDadRat[nX][2], Len(aCols))
			GdFieldPut("ZLL_DCRRET"   , aDadRat[nX][3], Len(aCols))
			GdFieldPut("ZLL_VALOR"    , aDadRat[nX][4], Len(aCols))
			GdFieldPut("ZLL_STATUS"   , 'A', Len(aCols))
			
			nValTot += aCols[nX,GdFieldPos("ZLL_VALOR")]
		Next nX
	EndIf
EndIf

//Atualiza os dados do aCols
oGet:Refresh()
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ VldTanq  º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Valida se o codigo de tanque informado existe e atualiza   º±±
±±º          ³ os demais campos da tela.                                  º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ ProcRat()                                                  º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function VldTanq()

Local lRet     := .F.
Local aArea    := GetArea()
Local cEvtEner := "" //ALLTRIM(GetMv("LT_EVEENER"))//'770007'

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona no cadastro de Tanques - Cabecalho. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("ZLS")
dbSetOrder(1)
If dbSeek(xFILIAL("ZLS")+cTanque)
	
	dbSelectArea("SA2")
	dbSetOrder(1)
	If dbSeek(xFILIAL("SA2")+U_ProdTit(cTanque))
		cNomTq  := ZLS->ZLS_DESCRI
		cCodPro := SA2->A2_COD
		cLojPro := SA2->A2_LOJA
		cNomPro := SA2->A2_NOME
		nValFix := SA2->A2_L_VFIXO
		lRet    := .T.
	Else
		MsgAlert('Titular do Tanque não encontrado no cadastro de Fornecedor!')
	EndIf
Else
	MsgAlert('Codigo de Tanque invalido!')
EndIf

RestArea(aArea)
Return(lRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ AtuTaxas º Autor ³ TOTVS              º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ ATUALIZA CAMPOS DE ACRESCIMO E DESCONTO DA TABELA ZLL      º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³                                                            º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function AtuTaxas()

cQuery := " UPDATE "+RetSqlName("ZLL")
cQuery += " SET ZLL_TXADM = "+ALLTRIM(STR(nTxAdm))+", "
cQuery += " ZLL_ACRESC = "+ALLTRIM(STR(nAcresc))+" "
cQuery += " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND ZLL_COD = '"+cCodigo+"' "
TCSqlExec(cQuery)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ Import_txt     º Autor ³ Guilherme Françaº Data ³  03/04/13   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Funcao usada para que o usuario informe onde esta a           º±±
±±º          ³ localizacao do arquivo do com os dados enviados pelo fornecedor±±
±±º          ³ para importação na na tela de convênios.                    º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa Principal.                                           º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function import_txt(cConv)

Private _cPerg:= "AGLT010a"

ValidPerg()

If Empty(cConv)
	MsgAlert("Os dados do cabeçalho devem ser prenchidos antes de realizar a importação.","Validação Importação arquivo TXT")
EndIf


If pergunte(_cPerg,.T.)
	/*
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Verifica se foi fornecido um arquivo a ser importado.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	*/
	If Len(AllTrim(MV_PAR01)) > 0
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Inicializa o processamento de leitura do arquivo.		³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		
		Processa({|| lerArquivo() },"Processando...")
		
	EndIf
	
EndIf

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ lerArquivo  º Autor ³ TOTVS              º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Funcao usada para realizar a importacao do arquivo gerado peloº±±
±±º          ³ coletor.                                                      º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa Principal.                                           º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß

O arquivo CSV ou TXT deve ter duas colunas sendo:
codigo+loja;valor
P0005001;45,50;
P1234501;500;
P0009602;669,50;
P0006903;123;


*/
Static Function lerArquivo()

Local _aArea    := GetArea()
Local _aDados   := {}
Local _cAlias   := ""
Local _cDesAssoc:= ""
Local _nNumLinh := 1
Local _cItem    := "000"
Local _aLinProbl:= {}
Local _cLinhas  := ""
Local _cLoja	:= "01"

If FT_FUSE(MV_PAR01) == -1         //fOpen(_cNomeArq,68)
	
	xmaghelpfis("Arquivo inválido",;
	"Não foi possível abrir o arquivo informado.",;
	"Favor verificar se o arquivo informado esta correto.")
	
	Return
	
EndIf

FT_FGOTOP()                          //PONTO NO TOPO

If FT_FLASTREC() == 0 .And. _lRet   //O arquivo informado nao possui nenhuma linha de dados
	
	xmaghelpfis("Arquivo inválido",;
	"O arquivo informado para relizar a importação não possui dados.",;
	"Favor verificar se o arquivo informado esta correto.")
	
	Return
	
EndIf

ProcRegua(FT_FLASTREC())

aCols:={}

While !FT_FEOF()  //FACA ENQUANTO NAO FOR FIM DE ARQUIVO
	
	_cDesAssoc:= ""
	
	IncProc("Processando validacoes, favor aguarde!")
	
	
	_aDados := strtokarr(FT_FREADLN(),";") // retorna array dos campos
	/*
	Aadd(_aDados,Substr(FT_FREADLN(),1,8))
	Aadd(_aDados,Substr(FT_FREADLN(),6,10))
	Aadd(_aDados,Substr(FT_FREADLN(),16,5))
	Aadd(_aDados,Substr(FT_FREADLN(),21,2))
	*/
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³O tamanho da primeira posição precisa ser 8 (codigo_loja)³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If Len(_aDados[1]) == 8
		
		
		_cItem:=Soma1(_cItem)
		
		// Localiza nome do cooperado.
		_cDesAssoc:= Posicione("SA2",1,xFilial("SA2")+_aDados[1],"A2_NOME")
		If !Empty(_cDesAssoc)
			
			/*
			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//³Adiciona os dados do arquivo no acols.³
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			*/

			_cValor := StrTran(_aDados[2],",",".")
			
			aAdd(aCols, Array(Len(aHeader) + 1))
			aCols[Len(aCols), Len(aHeader) + 1] := if(Val(_cValor) >0,.F.,.T.)
			GdFieldPut("ZLL_SEQ"   , _cItem, Len(aCols))
			GdFieldPut("ZLL_RETIRO"   , SubStr(_aDados[1],1,6), Len(aCols))
			GdFieldPut("ZLL_RETILJ"   , SubStr(_aDados[1],7,2), Len(aCols))
			GdFieldPut("ZLL_DCRRET"   , _cDesAssoc, Len(aCols))
			GdFieldPut("ZLL_VALOR"    , Val(_cValor), Len(aCols))
			GdFieldPut("ZLL_STATUS"   , 'A', Len(aCols))
			GdFieldPut("ZLL_VLRPAR"    , Val(_cValor), Len(aCols))
			GdFieldPut("ZLL_VLRTOT"    , Val(_cValor), Len(aCols))
			GdFieldPut("ZLL_PARCEL"    , 1, Len(aCols))
//			GdFieldPut("ZLL_CARENC"    , 'N', Len(aCols))
			GdFieldPut("ZLL_TXPARC"    , 0, Len(aCols))			
			//GdFieldPut("ZLL_FILENT"    , "010101", Len(aCols))			
			//GdFieldPut("ZLL_INSS"    , 0, Len(aCols))						

						
		Else
			aAdd(_aLinProbl,{_nNumLinh})
		EndIf
		/*				aAdd(aCols,Array(Len(aHeader)+1))
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³ Informa que a linha do Acols nao esta deletada. ³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		aCols[Len(aCols)][Len(aHeader)+1] := .F.
		
		aCols[Len(aCols)][nPosItem]  := _cItem							      //Item
		aCols[Len(aCols)][nPosRetiro]:= _aDados[2]							  //Codigo do Produtor
		aCols[Len(aCols)][nPosLoja]  := _aDados[3]							  //Loja do Produtor
		aCols[Len(aCols)][nPosNomRet]:= _cDesAssoc							  //Descricao do Produtor
		aCols[Len(aCols)][nPosLinha] := _cLinha   							  //Linha que se pertence o Produtor encontrada em seu cadastro
		aCols[Len(aCols)][nPosDesLin]:= _cDesLinha							  //Descricao da Linha
		aCols[Len(aCols)][nPosQtdBom]:= Val(_aDados[4])					  //Quantidade de Leite
		aCols[Len(aCols)][nPosTemp]  := Val(Transform(_aDados[5],"@R 99.9"))//Temperatura
		aCols[Len(aCols)][nPosHora]  := _aDados[6] + ':' + _aDados[7]       //Hora no formato Hora:minutos
		aCols[Len(aCols)][nPosRegua] := Val(_aDados[13])/10                 //Regua
		aCols[Len(aCols)][nPosTribut]:= ' '                 				  //Tipo de Tributacao da recepcao de leite
		
		*/
		
		//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		//³Numero de colunas do arquivo de importacao incorreto.³
		//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Else
		
		aAdd(_aLinProbl,{_nNumLinh})
	EndIf
	
	_nNumLinh++
	
	FT_FSKIP()   //próximo registro no arquivo txt
	
EndDo

FT_FUSE()//Fecha o arquivo

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Verifica se foram encontrados problemas na importacao do arquivo³
//³para emitir mensagem de alerta ao usuario.                      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If Len(_aLinProbl) > 0
	
	_cLinhas:= ""
	aEval(_aLinProbl,{|X| _cLinhas += ";" + AllTrim(Str(X[1])) })
	
	_cLinhas:= SubStr(_cLinhas,2,Len(_cLinhas))
	
	xMagHelpFis("INFORMAÇÃO",;
	"Foi(ram) encontrada(s) uma(algumas) linha(s) que se encontra(m) com problema de estrutura. Esta(s) linha(s) não será(ão) considerada(s) na importação, abaixo segue uma relação destas linhas:",;
	"Confira se o código+loja está correto."+_ENTER + _cLinhas)
	
EndIf

restArea(_aArea)

//Atualiza os dados do aCols
oGet:Refresh()


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ validperg   º Autor ³ TOTVS              º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Funcao usada para validar se pergunta AGLT003 existe no       º±±
±±º          ³ dicionario de dados, caso nao existe cria a pergunta.         º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa Principal.                                           º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function ValidPerg()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

Aadd( aHelpPor, 'Informe o caminho e o nome do ')
Aadd( aHelpPor, 'arquivo a ser importado.      ')
Aadd( aHelpPor, 'Ex.: c:\totvs\convenios.txt   ')
U_xPutSx1(_cPerg,"01","Arquivo "," "," ","mv_ch1","C",90,0,0,"G","","DIR","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ FiltraFornecº Autor ³ GUILHERME FRANÇA   º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Realiza filtro na tela de lançamento dos convenios para que   º±±
±±º          ³ os fornecedores so enxerguem seus lançamentos.                º±±
±±º          ³ O campo A2_L_USER deve contar o codigo de usuário de sistema. º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa Principal.                                           º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function FiltraFornec()

Local _cFiltro := "% AND A2_L_USER = '"+__CUSERID+"' %"
Local _cRet := ""

BeginSql alias "FORNEC"
	SELECT A2_COD
	FROM %Table:SA2% SA2
	WHERE SA2.%notDel%
	%exp:_cFiltro%
EndSql

DbSelectArea("FORNEC")
FORNEC->(DbGoTop())

While !FORNEC->(Eof())
	_cRet += FORNEC->A2_COD+"/"  //Incrementa os códigos de fornecedor que estão amarrados ao usuário logado.
	FORNEC->(Dbskip())
EndDo

DbCloseArea("FORNEC")
	
If Len(_cRet) < 3 // Verifica se foram adicionados codigos de fornecedor ao retorno.
	_cRet := "XXXXXX"
//Else
//	_cRet := " '"+_cRet+"' "
EndIf

Return _cRet


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ CalculaJurosº Autor ³ GUILHERME FRANÇA   º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Realiza calculo dos juros compostos e aplica nas parcelas     º±±
±±º          ³ caso seja informado mais de uma.                              º±±
±±º          ³ Retorna array:	                            				    º±±
±±º          ³ aReturn[1]: Taxa de juros                                     º±±
±±º          ³ aReturn[2]: Valor da parcela                                  º±±
±±º          ³ aReturn[3]: Total parcelado                                   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa Principal.                                           º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function CalculaJuros(_nPos)

Local _aReturn := {}
Local _nVlrAcum
Local _nVlrPar := 0
Local _nTxJuro := 0
Local _nTemp   := 0
Local _nTemp2  := 0
Local _nTemp3  := 0
Local _nQtdPar := 0
Local _nCarencia := 0
Local _lParcela := .T. //(Posicione("ZLU",1,xFilial("ZLU")+Padr(cUserName,25),"ZLU_PRCCON") == "S")
Local _cTipoJur := Alltrim(SuperGetMv("LT_TIPOJUR",,"2")) // conteúdo "1" indica calculo Price, "2" indica SAC

If GdFieldPos("ZLL_PARCEL") > 0

 //	If !(U_GLT_012Z(__CUSERID,"JUROS") ) // Se o usuario tiver permissao de alterar os juros, o preenchimento sera manual
//		_nTxJuro := U_BuscaTaxa("CON",Alltrim(ZL8->ZL8_GRUPO))
//	Else
		_nTxJuro := aCols[_nPos,GdFieldPos("ZLL_TXPARC")]
//	EndIf
	_nQtdPar := aCols[_nPos,GdFieldPos("ZLL_PARCEL")]
	_nVlrPar := aCols[_nPos,GdFieldPos("ZLL_VLRPAR")]
	_nVlrAcum :=aCols[_nPos,GdFieldPos("ZLL_VALOR")]
	_nCarencia := 0 //IIF(aCols[_nPos,GdFieldPos("ZLL_CARENC")]=="S",1,0)
	
//For i:=1 To int(_nQtdPar)
//	_nVlrAcum 	*= ((_nTxJuro/100)+1)
//Next i
	If !_lParcela
		Alert("Usuário nõ possui permissao para parcelar convênios!","Acesso de Usuários")
		aCols[_nPos,GdFieldPos("ZLL_PARCEL")] := 1
		_nQtdPar := 1
	EndIf



	If (_nTxJuro == 0 .or. _nQtdPar == 1) //.and. ZL8->ZL8_COD <> "100112"
		aCols[_nPos,GdFieldPos("ZLL_VLRPAR")] := aCols[_nPos,GdFieldPos("ZLL_VALOR")] / _nQtdPar
		aCols[_nPos,GdFieldPos("ZLL_VLRTOT")] := aCols[_nPos,GdFieldPos("ZLL_VALOR")]
	else
		_nVlrPar := U_CalcJuros("P",_nTxJuro,_nVlrAcum,_nQtdPar,_nCarencia,"","",_cTipoJur)
		_nVlrAcum := round(_nVlrPar*int(_nQtdPar),2)
		
	//	AADD(_aReturn,Round(_nTxJuro*100,2))
		AADD(_aReturn,Round(_nTxJuro,2))
		AADD(_aReturn,_nVlrPar)
		AADD(_aReturn,_nVlrAcum)
	EndIf

Else
	_nVlrAcum :=aCols[_nPos,GdFieldPos("ZLL_VALOR")]
	AADD(_aReturn,Round(0,2))
	AADD(_aReturn,_nVlrAcum)
	AADD(_aReturn,_nVlrAcum)

EndIf                                                                             


Return _aReturn    


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ChamaDadosºAutor  ³Ariclenes M. Costa  º Data ³  03/12/13   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Funcao chama tela que exibe parcelas convenio              º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                        º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function ChamaDados(nOpc)
   	   	
Private _cRetiro	:=	aCols[N,GdFieldPos("ZLL_RETIRO")]
Private _cConvenio	:=	cConven
Private _cEvento	:=	cEvento
Private _cCodigo	:=	cCodigo
Private _nParcela 	:= 	IIF(GdFieldPos("ZLL_PARCEL")>0,aCols[N,GdFieldPos("ZLL_PARCEL")],1)
Private _nValParc	:= 	IIF(GdFieldPos("ZLL_VLRPAR")>0,aCols[N,GdFieldPos("ZLL_VLRPAR")],0)
Private _nTxParc	:=	IIF(GdFieldPos("ZLL_TXPARC")>0,aCols[N,GdFieldPos("ZLL_TXPARC")],0)
Private	_ntot		:=  aCols[N,GdFieldPos("ZLL_VALOR")]
Private _nCodRet 	:= 	aCols[N,GdFieldPos("ZLL_RETIRO")]
Private _nCaren 	:= 	0//IIF(GdFieldPos("ZLL_TXPARC")>0,IIF(aCols[N,GdFieldPos("ZLL_CARENC")]=="S",1,0),0)

U_AGLT049(_cRetiro,_cConvenio,_cEvento,_cCodigo,_nParcela,_nValParc,_ntot,_nTxParc,_nCaren)
If nOpc == 2
	//Monta tela consulta parcelas na Alteração e Visualização
	//U_AGLT048(_cRetiro,_cConvenio,_cEvento,_cCodigo,DAY(dVctoPr))
ElseIf nOpc == 3 .OR. nOpc == 4 
	//Monta tela consulta parcelas na Inclusão
	//U_AGLT049(_cRetiro,_cConvenio,_cEvento,_cCodigo,_nParcela,_nValParc,_ntot,_nTxParc,_nCaren)
EndIf

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³Somames   ºAutor  ³Microsiga           º Data ³  12/27/13   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Retorna array com vencimentos                              º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                        º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function SomaMes(dData,dParc)
Local sdata
Local firstDay := substr(dtos(dData),7,2)
Local ret:={}
Local ax:=0

For z:=1 To dParc
	aadd(ret,dData)
	sData := dtos(dData)
	ano := substr(SData,1,4)
	mes := substr(SData,5,2)
	dia := firstDay
	
	mes   := strzero(val(mes)+1,2)
	If (mes=="13")
		mes := "01"
		ax:= val(ano)
		ax++
		ano := ALLTRIM(str(ax))
	EndIf
	
	dData := stod(ano+mes+dia)
	If Empty(dData)
		dData := lastday(stod(ano+mes+"01"))
	EndIf
Next z

Return ret

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³VldEdit   ºAutor  ³Microsiga           º Data ³  12/27/13   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Valida Edição de campos de linhas de convenio com status   º±±
±±º          ³ igual a P - Pago.                                          º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function VldEdit()

Local _lReturn := .T.
Local _nPosStatus := ascan(aHeader,{|x| ALLTRIM(x[2]) == "ZLL_STATUS"})

If _nPosStatus > 0 .AND. n > 0
	If aCols[n][_nPosStatus] == "P"   
		MsgStop("Esta linha não pode ser alterada porque seu status está igual a Pago.")
		_lReturn := .F.
	EndIf
Else
/*
	If aCols[1][_nPosStatus] == "P"   
		MsgStop("Esta linha não pode ser alterada porque seu status está igual a Pago.")
		_lReturn := .F.
	EndIf
*/
EndIf

Return(_lReturn)



/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³dElse1    ºAutor  ³Microsiga           º Data ³  03/24/15   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Delete titulo na tabela SE1                                 º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                        º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function dElse1(cpPrefixo,cpNum,cpParcela,cpTipo,cpForn,cpLoja,cpNatureza) 


Local nModAnt := nModulo
Local cModAnt := cModulo
Local _aAutoSE1 := {}

Local lOk       := .T.

Private lMsErroAuto := .F.

nModulo := 6
cModulo := "FIN"  

dbSelectArea("SE1")
dbSetOrder(1) //E1_FILIAL+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO                                                                                                                  
dbGoTop()       
While dbSeek(xFILIAL("SE1")+cpPrefixo+cpNum+cpParcela+cpTipo) .and. !Eof()

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Array com os dados a serem passados para o SigaAuto. ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	_aAutoSE1:={{"E1_PREFIXO",SE1->E1_PREFIXO,Nil},;
	{"E1_NUM"    ,SE1->E1_NUM    ,Nil},;
	{"E1_TIPO"   ,SE1->E1_TIPO   ,Nil},;
	{"E1_PARCELA",SE1->E1_PARCELA,Nil},;
	{"E1_NATUREZ",SE1->E1_NATUREZ,Nil}}    

	If Found()
        
		Pergunte("FIN040",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto
		MSExecAuto({|x,y| FINA040(x,y)},_aAutoSE1,5)
        
		If lMsErroAuto
			lOk := .F.
			xMagHelpFis("Erro","Erro ao excluir o Titulo: "+cpPrefixo+cpNum+"-"+cpForn+", portanto os lançamentos deste convênio não podem ser excluídos","Comunique ao Suporte!!!")
			mostraerro()
		EndIf
	Else
		xMagHelpFis("Erro - Exclusao ","O Titulo nao foi encontrado!","Comunique ao Suporte! Indice:"+cpPrefixo+cpNum+cpParcela+cpTipo+cpForn+cpLoja)
		If MsgYesNo("Tentar gerar o titulo NF assim mesmo? ")
			lOk := .T.
		Else
			lOk := .F.
		EndIf
	EndIf
	cpParcela := Soma1(cpParcela)
	_aAutoSE1 := {}
EndDo

nModulo := nModAnt
cModulo := cModAnt

Return lOk