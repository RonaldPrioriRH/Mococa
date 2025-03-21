#include 'protheus.ch'
#include 'parmtype.ch'

// Defini��es de Tipos de mensagem
#Define MT_TDEFAULT 0 // Adiciona somente o bot�o default "Fechar"
#Define MT_TYESNO   1 // Adiciona os bot�es "Sim" e "N�o", focando no "Sim"
#Define MT_TNOYES   2 // Adiciona os bot�es "N�o" e "Sim", focando no "N�o"

// Defini��es de �cones da mensagem
#Define MT_ISUCCES  "FWSKIN_SUCCES_ICO.PNG" // �cone Default Sucesso
#Define MT_IALERT   "FWSKIN_ALERT_ICO.PNG"  // �cone Default Alerta
#Define MT_IERROR   "FWSKIN_ERROR_ICO.PNG"  // �cone Default Erro
#Define MT_IINFO    "FWSKIN_INFO_ICO.PNG"   // �cone Default Informa��o

/*
Rotina para Integra��o com Balan�a
@author Luciano Alvarazo/Gilberto Martinosso
@since 07/06/2017
@version 1.0
@type function
*/

#include "rwmake.ch"
#INCLUDE "colors.ch"
#include "topconn.ch"

user function RESTA002()

	Private cAlias 	  := "Z19"
	Private cCadastro := "Ticket de Pesagem"
	Private aRotina   := {}

	Private aCpoZ19   := {;
		"NOUSER" ,;
		"Z19_TICKET" ,;
		"Z19_PLACA",;
		"Z19_PROD",;
		"Z19_DESC",;
		"Z19_NOME",;
		"Z19_DATAP1" ,;
		"Z19_HORAP1" ,;
		"Z19_P1" ,;
		"Z19_DATARE" ,;
		"Z19_HORARE" ,;
		"Z19_REPES" ,;
		"Z19_DATAP2" ,;
		"Z19_HORAP2" ,;
		"Z19_P2" ,;
		"Z19_DOCENT" ,;
		"Z19_DENS",;
		"Z19_CHVNFE"}
	//"Z19_VIAGEM"} //Caique

	Private aCoresZ19 := {;
		{"Z19->Z19_STATUS='C'", 	"BR_PRETO"},;
		{"Z19->Z19_STATUS='B'", 	"BR_VERMELHO"},;
		{"Z19->Z19_P2>0", 			"BR_VERDE"},;
		{"Empty(Z19->Z19_USRBX)", 	"BR_AMARELO"}}

	Private l_F5 := .T.


	//Op��es do menu
	aAdd(aRotina,{"Pesquisar"		,"AxPesqui"			, 0, 1})
	aAdd(aRotina,{"Visualizar"		,"AxVisual"			, 0, 2})
	aAdd(aRotina,{"1� Pesagem"		,"U_Peso1Z19"		, 0, 3})
	aAdd(aRotina,{"2� Pesagem"		,"U_Peso2Z19"		, 0, 4})
	aAdd(aRotina,{"Repesagem"		,"U_RepesoZ19"		, 0, 4})
	aAdd(aRotina,{"Cancelar Ticket"	,"U_DelZ19"			, 0, 4})
	aAdd(aRotina,{"Imprimir Ticket"	,"U_ImpZ19"			, 0, 4})
	aAdd(aRotina,{"Legenda"			,"U_PesoZ19Leg"	    , 0, 4})

	dbSelectArea(cAlias)
	dbSetOrder(1)
	mBrowse( 6,1,22,75,cAlias,,,,,,aCoresZ19)

return

User Function ImpZ19()
	Local wnrel
	Local cString  := "Z19"
	Local titulo   := "Ticket de Pesagem"
	Local NomeProg := "RESTA002"
	Local Tamanho := "P"

	PRIVATE aReturn := { "Zebrado", 1,"Administracao", 1, 2, 1, "",1 }

	wnrel:=SetPrint(cString,NomeProg,"",@titulo,"", "", "",.F.,.F.,.F.,Tamanho,,.F.)

	SetDefault(aReturn,cString)

	RptStatus({|lEnd| TestRel(@lEnd,wnRel,cString,Tamanho,NomeProg)},titulo)
Return


Static Function TestRel(lEnd,WnRel,cString,Tamanho,NomeProg)
	LOCAL cabec1,cabec2
	//LOCAL cRodaTxt := oemtoansi("Ticket de Pesagem")
	Local nCntImpr
	Local nTipo

	nCntImpr := 0
	li := 80

	m_pag := 1
	//� Inicializa os codigos de caracter Comprimido da impressora �
	nTipo := 15//� Monta os Cabecalhos                                          �
	titulo:= oemtoansi("Ticket de Pesagem")
	cabec1:= oemtoansi("")
	cabec2:=""

	dbSelectArea("Z19")

	SetRegua(1)

	IncRegua()

	cabec(titulo,cabec1,cabec2,nomeprog,tamanho,15)
	Li++

	@ Li,01 PSAY SM0->M0_NOMECOM
	Li++

	@ Li,01 PSAY SM0->M0_ENDENT
	Li++

	@ Li,01 PSAY SM0->M0_BAIRENT
	Li++

	@ Li,01 PSAY SM0->(AllTrim(M0_CIDENT) + " - " + M0_ESTENT)
	Li++

	@ Li,01 PSAY "CEP: " + SM0->M0_CEPENT
	Li++
	Li++
	Li++

	@ Li,01 PSAY "Ticket............: " + Z19->Z19_TICKET
	Li++
	@ Li,01 PSAY "Tipo..............: " + Iif(Z19->Z19_TIPO <> 'S',"Entrada","Saida")
	Li++
	Li++

	@ Li,01 PSAY "Placa do Veiculo..: " + Z19->Z19_PLACA
	Li++

	@ Li,01 PSAY "Motorista.........: " + Z19->Z19_NOME
	Li++

	DbSelectArea("SB1")
	DbSetOrder(1)
	DbSeek(xFilial("SB1") + Z19->Z19_PROD)

	@ Li,01 PSAY "Produto...........: " + SB1->(AllTrim(B1_COD) + "-" + B1_DESC)
	Li++

	@ Li,01 PSAY "Unidade...........: "+ SB1->B1_UM
	Li++
	@ Li,01 PSAY "Viagem...........: "+ Z19->Z19_VIAGEM
	Li++
	Li++

	@ Li,01 PSAY "Peso de entrada...: " + TransForm(Z19->Z19_P1,"@E 999,999") + " Data: " + DtoC(Z19->Z19_DATAP1) + " Hora: " + Z19->Z19_HORAP1
	Li++

	If Z19->Z19_REPES > 0
		@ Li,01 PSAY "Repesagem.........: " + TransForm(Z19->Z19_REPES,"@E 999,999") + " Data: " + DtoC(Z19->Z19_DATARE) + " Hora: " + Z19->Z19_HORARE
		Li++
	Endif

	@ Li,01 PSAY "Peso de saida.....: " + TransForm(Z19->Z19_P2,"@E 999,999") + " Data: " + DtoC(Z19->Z19_DATAP2) + " Hora: " + Z19->Z19_HORAP2
	Li++

	if Z19->Z19_DENS > 0
		Li++
		@ Li,01 PSAY "Densidade.........:  " + TransForm(Z19->Z19_DENS,"@E 9.9999")
		Li++
	Endif

	@ Li,01 PSAY "Liquido...........: " + TransForm(U_LIQZ19(),"@E 999,999.999999")//Alterado por Marcos Godinho

	Li++

	Li++
	Li++


	@ Li,01 PSAY "Nota Fiscal Ref...: " + Z19->Z19_DOCENT
	Li++

	//Duplicando Impress�o
	Li++
	Li++
	Li++
	@ Li,01 PSAY REPLICATE("-",70)
	Li++
	Li++

	@ Li,01 PSAY SM0->M0_NOMECOM
	Li++

	@ Li,01 PSAY SM0->M0_ENDENT
	Li++

	@ Li,01 PSAY SM0->M0_BAIRENT
	Li++

	@ Li,01 PSAY SM0->(AllTrim(M0_CIDENT) + " - " + M0_ESTENT)
	Li++

	@ Li,01 PSAY "CEP: " + SM0->M0_CEPENT
	Li++
	Li++
	Li++

	@ Li,01 PSAY "Ticket............: " + Z19->Z19_TICKET
	Li++
	@ Li,01 PSAY "Tipo..............: " + Iif(Z19->Z19_TIPO <> 'S',"Entrada","Saida")
	Li++
	Li++

	@ Li,01 PSAY "Placa do Veiculo..: " + Z19->Z19_PLACA
	Li++

	@ Li,01 PSAY "Motorista.........: " + Z19->Z19_NOME
	Li++

	DbSelectArea("SB1")
	DbSetOrder(1)
	DbSeek(xFilial("SB1") + Z19->Z19_PROD)

	@ Li,01 PSAY "Produto...........: " + SB1->(AllTrim(B1_COD) + "-" + B1_DESC)
	Li++

	@ Li,01 PSAY "Unidade...........: "+ SB1->B1_UM
	Li++
	@ Li,01 PSAY "Viagem...........: "+ Z19->Z19_VIAGEM
	Li++
	Li++

	@ Li,01 PSAY "Peso de entrada...: " + TransForm(Z19->Z19_P1,"@E 999,999") + " Data: " + DtoC(Z19->Z19_DATAP1) + " Hora: " + Z19->Z19_HORAP1
	Li++

	If Z19->Z19_REPES > 0
		@ Li,01 PSAY "Repesagem.........: " + TransForm(Z19->Z19_REPES,"@E 999,999") + " Data: " + DtoC(Z19->Z19_DATARE) + " Hora: " + Z19->Z19_HORARE
		Li++
	Endif

	@ Li,01 PSAY "Peso de saida.....: " + TransForm(Z19->Z19_P2,"@E 999,999") + " Data: " + DtoC(Z19->Z19_DATAP2) + " Hora: " + Z19->Z19_HORAP2
	Li++

	if Z19->Z19_DENS > 0
		Li++
		@ Li,01 PSAY "Densidade.........:  " + TransForm(Z19->Z19_DENS,"@E 9.9999")
		Li++
	Endif

	@ Li,01 PSAY "Liquido...........: " + TransForm(U_LIQZ19(),"@E 999,999.999999")//Alterado por Marcos Godinho

	Li++

	Li++
	Li++


	@ Li,01 PSAY "Nota Fiscal Ref...: " + Z19->Z19_DOCENT
	Li++



	Set Device to Screen
	If aReturn[5] = 1
		Set Printer To
		dbCommitAll()
		OurSpool(wnrel)
	Endif
	MS_FLUSH()
Return


User Function PesoZ19Leg()
	Local aLegenda := {	{"BR_VERDE"		, 	"Liberado"},;
		{"BR_AMARELO"	, 	"Em Processo"},;
		{"BR_VERMELHO"	, 	"Baixado"},;
		{"BR_PRETO"		, 	"Cancelado"}}

	BrwLegenda(cCadastro,'Legenda',aLegenda)

Return


User Function Peso1Z19(cAlias,nReg,nOpc)
	Local nOpca
	Local aButtons	:= {}
	Local cTipo		:= 'P1'

	aCpoP1 := {"Z19_TICKET","Z19_PLACA","Z19_PROD","Z19_NOME","Z19_DOCENT","Z19_CHVNFE"}

	Private lPesoM	:= GetMV("MV_XPESOM")

	If lPesoM
		Aadd(aCpoP1,"Z19_P1")
	Endif

	aAdd( aButtons, {"AUTOM",{|| U_zPesagem(cTipo) }, "Leitura Balan�a F5",  "Leitura Balan�a F5"} )
	SETKEY(VK_F5, {|| U_zPesagem(cTipo)})

	nOpca := AxInclui(cAlias,nReg,nOpc,aCpoZ19,/*cFunc*/,aCpoP1,'U_Z19TOK(M->Z19_P1, 1 , M->Z19_VIAGEM )',/*lF3*/,'U_Z19COMP(1)',aButtons, /*<aParam>*/, /*<aAuto>*/, .T./*<lVirtual>*/, /*<lMaximized>*/)
	SETKEY(VK_F5, {|| })
return


User Function Z19TOK(nPesagem, nPeso , cViagPort)
	Local lret
	Local cProd 	:=  AllTrim(M->Z19_PROD)
	Local cCHVNFe	:=  AllTrim(M->Z19_CHVNFE)
	Local nDens		:=  M->Z19_DENS
	Local cSpot		:=  AllTrim(Posicione("SB1",1,xFilial("SB1")+cProd,"B1_XSPOT"))
	Local nDensMin 	:=  Posicione("SB1",1,xFilial("SB1")+cProd,"B1_XDENMIN")
	Local nDensMax 	:=  Posicione("SB1",1,xFilial("SB1")+cProd,"B1_XDENMAX")

	If nPesagem<=0
		MsgInfo("Peso Invalido","Aten��o")
		Return(.f.)
		//Anderson GLPI Nova valida��o Para n�o deixar Inserir duas chaves de Notas iguais desde que o status sej� A OU B Aberto ou Baixo
	ElseIf (nPeso = 1) .And. !Empty(cCHVNFe)
		If Len(cCHVNFe) = 44
			lret := ExistChv(cCHVNFe)
			Return(lret)
		Else
			U_MsgTimer(10, "Quantidade de digitos inv�lida para inclus�o da Chave da Nota!", "Aten��o", MT_IALERT, MT_TDEFAULT)
			Return(.f.)
		EndIf
	ElseIf (nPeso = 2  .And. M->Z19_PROD = '12010002') .And. Empty(cViagPort) .And. lHabilita == .T.
		MsgInfo("Viagem n�o pode estar em branco","Aten��o")
		Return(.f.)
	ElseIf (nPeso = 2  .And. M->Z19_PROD = '12010002') .And. !Empty(cViagPort) .And. lHabilita == .T.
		//Valida se j� existe essa viagem importada na ZX1
		//lret := ExistViag(xFilial("Z19"),M->Z19_VIAGEM)
		//Devido Filial 0107
		lret := ExistViag(M->Z19_VIAGEM)
		Return(lret)

	EndIf

	//Novas valida��es GLPI#10231 pedido Anderson Souza - Processo Importa��o autom�tica CNX
	If (nPeso = 2 ) //Segunda Pesagem

		//Densidade (Min - Max) Conforme Campos B1_XDENMIN e B1_XDENSMAX
		If (cSpot == 'S')
			If !(nDens >= nDensMin .And. nDens <= nDensMax)
				U_MsgTimer(10, "Densidade para o produto " +cProd+ " deve estar entre " +cValToChar(nDensMin)+ " at� "+cValToChar(nDensMax), "Aten��o", MT_IALERT, MT_TDEFAULT)
				//MsgInfo("Densidade para o produto " +cProd+ " deve estar entre " +cValToChar(Val(Substr(cP01 ,1,6)))+ " at� "+cValToChar(Val(Substr(cP01 ,8,6))),"Aten��o")
				Return(.f.)
			EndIf
		EndIf

	EndIf

Return(.t.)

Static function ExistViag(cZ19Viag)
//Static function ExistViag(cZ19Fil,cZ19Viag)
	Local lRet	 := .T.
	Local cQuery := ""

	cQuery := "	SELECT DISTINCT Z19_FILIAL||Z19_TICKET, Z19_TICKET, Z19_VIAGEM, ZX1_STATUS, ZX1_VIAGEM FROM Z19010, ZX1010 "
	cQuery += " WHERE Z19010.D_E_L_E_T_ = ' ' "
	cQuery += "  AND ZX1010.D_E_L_E_T_ = ' ' "
	cQuery += "  AND ZX1_FILIAL||ZX1_VIAGEM = '"+cZ19Viag+"' "
	cQuery += "  AND ZX1_STATUS = 'I' "
	cQuery += "  AND Z19_VIAGEM = '"+cZ19Viag+"'"
	cQuery += "  AND Z19_STATUS = 'A' "

	if Select("TRBZ19") > 0
		dbSelectArea("TRBZ19")
		dbCloseArea()
	endif

	MemoWrite("C:\temp\Z19ViagemExiste.sql",cQuery)

	dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRBZ19',.F.,.T.)


	If TRBZ19->(!Eof())
		xMagHelpFis("Mensagem","Aten��o, N�o � permitido utilizar a mesma Viagem: " + cZ19Viag + " que j� foi importada!","Verifique cadastro de Recep��o de Leite.")

		lRet := .F.
	EndIf

Return(lRet)



User Function Z19COMP(nPesagem)

	RecLock("Z19",.F.)
	If lPesoM
		If nPesagem==1
			Z19_TPP1 :='M'
		ElseIf nPesagem==2
			Z19_TPP2 :='M'
		Else
			Z19_TPRE :='M'
		Endif
	Else
		If nPesagem==1
			Z19_TPP1 :='I'
		ElseIf nPesagem==2
			Z19_TPP2 :='I'
		Else
			Z19_TPRE :='I'
		Endif
	Endif
	If Z19_P2>0
		If Z19_REPES>0
			IF Z19_REPES>Z19_P2
				Z19_TIPO:='E'
			Else
				Z19_TIPO:='S'
			Endif
		Else
			IF Z19_P2>Z19_P1
				Z19_TIPO:='S'
			Else
				Z19_TIPO:='E'
			Endif
		Endif
	Else
		Z19_TIPO:='P'
	Endif
	Z19->(MsUnLock())
Return

User Function RePesoZ19(cAlias,nReg,nOpc)
	Local nOpca
	Local aButtons	:= {}
	Local cTipo		:= 'RP'
	Local aParam	:= {}
	Local bCod1 := {|X| IniPad(cTipo), .T. }
	Local bCod2 := {|X| nProcess := 2, .T. }
	Local bCod3 := {|X| nProcess := 3, .T. }
	Local bCod4 := {|X| nProcess := 4, .T. }

	if Z19->Z19_STATUS <> "A"
		MsgInfo("Ticket n�o disponivel. Imposs�vel continuar!","Aten��o")
		return
	endif

	if Z19->Z19_P2 > 0
		MsgInfo("Segunda pesagem j� efetuada para o ticket selecionado. Imposs�vel continuar!","Aten��o")
		return
	endif

	if Z19->Z19_REPES > 0
		MsgInfo("Repesagem j� efetuada para o ticket selecionado. Imposs�vel continuar!","Aten��o")
		return
	endif

	AADD(aParam, bCod1  )
	AADD(aParam, bCod2  )
	AADD(aParam, bCod3  )
	AADD(aParam, bCod4  )


	aAdd( aButtons, {"AUTOM",{|| U_zPesagem(cTipo) }, "Ler Balan�a <F5>",  "Ler Balan�a <F5>"} )
	SETKEY(VK_F5, {|| U_zPesagem(cTipo)})

	aCpoRP := {}

	Private lPesoM	:= GetMV("MV_XPESOM")

	If lPesoM
		Aadd(aCpoRP,"Z19_REPES")
	Endif

	//	AxAltera( <cAlias>, <nReg>, <nOpc>, <aAcho>, <aCpos>, <nColMens>, <cMensagem>, <cTudoOk>, <cTransact>, <cFunc>, <aButtons>, <aParam>, <aAuto>, <lVirtual>, <lMaximized>)
	Begin Transaction
		nOpcA := AxAltera(cAlias,nReg,nOpc,aCpoZ19,aCpoRP,,,'U_Z19TOK(M->Z19_REPES,2, M->Z19_VIAGEM','U_Z19COMP(3)',,aButtons, aParam/*<aParam>*/,  /*<aAuto>*/, .T./*<lVirtual>*/, /*<lMaximized>*/)

	End Transaction

	SETKEY(VK_F5, {|| })
return

User Function Peso2Z19(cAlias,nReg,nOpc)
	Local nOpca
	Local aButtons	:= {}
	Local cTipo		:= 'P2'
	Local aParam	:= {}
	Local bCod1 := {|X| IniPad(cTipo), .T. }
	Local bCod2 := {|X| nProcess := 2, .T. }
	Local bCod3 := {|X| nProcess := 3, .T. }
	Local bCod4 := {|X| nProcess := 4, .T. }
	Local lSpotN := .F.
	Private lHabilita := SuperGetMv("MV_XATIVCO", .F. ,.F.)

	if Z19->Z19_STATUS <> "A"
		MsgInfo("Ticket n�o disponivel. Imposs�vel continuar!","Aten��o")
		return
	endif

	if Z19->Z19_P2 > 0
		MsgInfo("Segunda pesagem j� efetuada para o ticket selecionado. Imposs�vel continuar!","Aten��o")
		return
	endif

	AADD(aParam, bCod1  )
	AADD(aParam, bCod2  )
	AADD(aParam, bCod3  )
	AADD(aParam, bCod4  )

	aAdd( aButtons, {"AUTOM",{|| U_zPesagem(cTipo) }, "Leitura Balan�a F5",  "Leitura Balan�a F5"} )
	SETKEY(VK_F5, {|| U_zPesagem(cTipo)})

	aCpoP2 := {}

	If lHabilita == .T.
		Aadd(aCpoZ19,"Z19_VIAGEM")
	EndIF

	Private lPesoM	:= GetMV("MV_XPESOM")

	If lPesoM
		Aadd(aCpoP2,"Z19_P2")
	Endif

	Aadd(aCpoP2,"Z19_DENS")
	//Aadd(aCpoP2,"Z19_CHVNFE") Removido
	If(Alltrim(Z19->Z19_PROD) == '12010002')
		Aadd(aCpoP2,"Z19_VIAGEM") //Caique habilita para visualizar tela
	EndIf


	//	AxAltera( <cAlias>, <nReg>, <nOpc>, <aAcho>, <aCpos>, <nColMens>, <cMensagem>, <cTudoOk>, <cTransact>, <cFunc>, <aButtons>, <aParam>, <aAuto>, <lVirtual>, <lMaximized>)
	Begin Transaction
		nOpcA := AxAltera(cAlias, nReg,nOpc,aCpoZ19,aCpoP2,,,'U_Z19TOK(M->Z19_P2,2,M->Z19_VIAGEM)','U_Z19COMP(2)',,aButtons, aParam/*<aParam>*/, /*<aAuto>*/, .T./*<lVirtual>*/, /*<lMaximized>*/)
		lSpotN := Posicione("SB1",1,FWxFilial("SB1")+Z19_PROD,"B1_XSPOT") == "N"

		If lSpotN
			SF1->(dbSetOrder(8))
			If SF1->(dbSeek(FWxFilial("SF1") + Z19->Z19_CHVNFE))
				//Realiza Baixa do Ticket
				U_RCOME013(4, 1)
			EndIf
		EndIf
	End Transaction
	//	nOpca(numerico)
	//Retorna 1 se usu�rio clicou no bot�o OK da Enchoice, 2 se clicou em Cancelar.

	If nOpcA == 1 .And. Alltrim(Z19->Z19_PROD) == '12010002' .And. lHabilita == .T. .And. Substr(Z19->Z19_VIAGEM,1,4) == '0102'
		//msginfo(Z19->Z19_TICKET +   Z19->Z19_VIAGEM    + Z19->Z19_PROD )
		msginfo("Importa��o Coleta Leite, Ticket Portaria: " + Z19->Z19_TICKET + "Viagem: "+  SUBSTR(Z19->Z19_VIAGEM,5,14))

		u_MGLT022(Z19->Z19_TICKET,SUBSTR(Z19->Z19_VIAGEM,5,14))
	EndIf
	//Apenas quando chamar bot�o OK

	SETKEY(VK_F5, {|| })

return

User Function DelZ19(cAlias,nReg,nOpc)
	//Local nOpca
	//Local aButtons	:= {}
	//Local cTipo		:= 'P1'

	if Z19->Z19_STATUS == "C"
		MsgAlert("Ticket j� foi cancelado. Imposs�vel continuar!","Aten��o")
		return
	endif

	//Valida��o Cancelamento ZLD

	//Antigo
	/*
	If msgyesno('Deseja cancelar o Ticket selecionado?', "Ticket: " + Z19->Z19_TICKET + " / Placa: " + Z19->Z19_PLACA)

		RecLock("Z19",.F.)
		Z19->Z19_STATUS := "C"
		Z19->(MsUnLock())
	
	endif	
	*/

	If MsgYesNo('Deseja cancelar o Ticket selecionado?', "Ticket: " + Z19->Z19_TICKET + " / Placa: " + Z19->Z19_PLACA)
		//Chama rotina de valida��o se j� existe lan�amento na ZLD e verifica se j� existe NF lan�ada
		VlZLD(xFilial("Z19"),Z19->Z19_TICKET,Z19->Z19_CHVNFE)
	endif

return


Static Function VlZLD(cZ19Fil,cZ19Tic,cCHVNFe)
	Local lRet	 := .F.
	Local cQuery := ""
	Local cQuery2 := ""

	cQuery := "	SELECT DISTINCT Z19_FILIAL, Z19_TICKET, Z19_VIAGEM, ZLD_FILIAL, ZLD_TKPESO, ZLD_TICKET FROM Z19010, ZLD010 "
	cQuery += " WHERE Z19010.D_E_L_E_T_ = ' ' "
	cQuery += "  AND ZLD010.D_E_L_E_T_ = ' ' "
	cQuery += "  AND Z19_FILIAL||Z19_TICKET = ZLD_FILIAL||ZLD_TKPESO "
	cQuery += "  AND Z19_FILIAL = '" + cZ19Fil + "' AND Z19_TICKET = '" + cZ19Tic + "' "

	if Select("TRBZLD") > 0
		dbSelectArea("TRBZLD")
		dbCloseArea()
	endif

	MemoWrite("C:\temp\ZLDValidaDeleta.sql",cQuery)

	dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRBZLD',.F.,.T.)

	//Novas valida��es GLPI#10231 pedido Anderson Souza - Processo Importa��o autom�tica CNX

	cQuery2 := "SELECT DISTINCT Z19_STATUS, D1_XTICKET,  F1_DOC, F1_CHVNFE  FROM SF1010 "
	cQuery2 += "LEFT JOIN  SD1010 ON SD1010.D_E_L_E_T_ = ' ' "
	cQuery2 += "	AND D1_FILIAL  = F1_FILIAL "
	cQuery2 += "	AND D1_DOC     = F1_DOC "
	cQuery2 += "	AND D1_SERIE   = D1_SERIE "
	cQuery2 += "	AND D1_FORNECE = F1_FORNECE "
	cQuery2 += "	AND D1_LOJA    = F1_LOJA "
	cQuery2 += "LEFT JOIN Z19010 ON Z19010.D_E_L_E_T_ = ' ' "
	cQuery2 += "	AND Z19_FILIAL = F1_FILIAL "
	cQuery2 += "	AND Z19_CHVNFE = F1_CHVNFE "
	cQuery2 += "WHERE SF1010.D_E_L_E_T_ = ' ' "
	cQuery2 += "	AND Z19_CHVNFE = '" + cCHVNFe + "' "
	cQuery2 += "	AND D1_FILIAL = '" + cZ19Fil + "' "
	cQuery2 += "	AND D1_XTICKET = '" + cZ19Tic + "' "
	cQuery2 += "	AND Z19_STATUS IN ('B','A') "  //Aberto ou Baixado Apenas

	if Select("TRBCHV") > 0
		dbSelectArea("TRBCHV")
		dbCloseArea()
	endif

	MemoWrite("C:\temp\Z19CHV.sql",cQuery2)

	dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery2))),'TRBCHV',.F.,.T.)

	If TRBZLD->(Eof()) .And. TRBCHV->(Eof())

		lRet:= .T.
		RecLock("Z19",.F.)
		Z19->Z19_STATUS := "C"
		Z19->(MsUnLock())

	ElseIf TRBZLD->(!Eof())

		xMagHelpFis("Mensagem","Aten��o, existem lan�amentos de recep��o de leite: " + TRBZLD->ZLD_TICKET + " para este registro!","Verifique cadastro de Recep��o de Leite.")

	ElseIf TRBCHV->(!Eof())

		xMagHelpFis("Mensagem","Aten��o, Nota Fiscal : " + TRBCHV->F1_DOC + " lan�ada no sistema para este ticket: " + TRBCHV->D1_XTICKET + ", n�o � permitido Cancelamento!","Entrar em contato com o Departamento Fiscal.")

	EndIf

Return(lRet)


//Iniciadores Padrao.
Static Function IniPad(cTipo)
	if cTipo == 'P1' //Pesagem 1�
		M->Z19_DATAP1 := dDatabase
		M->Z19_HORAP1 := Time()
	elseif cTipo == 'P2' // Pesagem 2�
		M->Z19_DATAP2 := dDatabase
		M->Z19_HORAP2 := Time()
	elseif cTipo == 'RP' // RePesagem
		M->Z19_DATARE := dDatabase
		M->Z19_HORARE := Time()
	endif
return


User Function zPesagem(cTipo)
	Local cPeso		:= 0
	Local cBuffer	:= space(100)
	//Local cCfg		:= SuperGetMV("MV_XBALCO",.F.,"COM3:9600,N,8,2")
	//Local nH   		:= 0
	//Local lRet		:= .F.

	If l_F5
		l_F5 := .F.

		cBuffer := U_Balanca()

		If !Empty(cBuffer)
			//		Alert("3")

			cPeso :=IsNumber(cBuffer)

			if cTipo == 'P1' //Pesagem 1�
				M->Z19_P1 := cPeso
			elseif cTipo == 'P2' // Pesagem 2�
				M->Z19_P2 := cPeso
			elseif cTipo == 'RP' // RePesagem
				M->Z19_REPES := cPeso
			endif

		Endif
		l_F5 := .T.
	Endif

return

Static Function IsNumber(cNum)
	Local cNumeros := "1234567890,"
	Local cResult  := ""
	Local ncont := 0

	for ncont := 1 To Len(cNum)
		if(SubStr(cNum,ncont,1)$cNumeros)
			cResult += SubStr(cNum,ncont,1)
		EndIf
	Next

	cResult := Replace(cResult,",",".")
	cNum 	:= Val(cResult)

Return  cNum

User Function LIQZ19()
	Local nPesoL:=0
	If Z19->Z19_P2>0
		If Z19->Z19_REPES>0
			IF Z19->Z19_REPES>Z19->Z19_P1
				nPesoL:=Z19->Z19_REPES-Z19->Z19_P1
			Else
				nPesoL:=Z19->Z19_P1-Z19->Z19_REPES
			Endif
		Else
			IF Z19->Z19_P2>Z19->Z19_P1
				nPesoL:=Z19->Z19_P2-Z19->Z19_P1
			Else
				nPesoL:=Z19->Z19_P1-Z19->Z19_P2
			Endif
		Endif
	Endif

	if Z19->Z19_DENS > 0
		nPesol := nPesol / Z19->Z19_DENS
	Endif

Return(nPesol)


Static Function vFecha()
	Sleep(1000)
	Close(oDlgAv)
Return

// Funcao para Baixa/Cancelamento de Baixa de Ticket
user function BxTicket(cZ19Fil,cZ19Tic,cOpera)

	Local aArea := GetArea()
	Local lRet	:= .F.
	//Local lSpot := .F.

	dbSelectArea("Z19")
	Z19->(dbSetOrder(1))
	If Z19->(dBSeek(cZ19Fil+cZ19Tic))
		//cSpot := Posicione("SB1",1,xFilial("SB1")+Z19_PROD,"B1_XSPOT") == "S"
		If Z19->Z19_P2 > 0 .AND. Z19->Z19_STATUS != 'C'
			RecLock("Z19",.F.)
			If cOpera=="B"
				Z19_DTBBX  :=dDatabase
				Z19_USRBX  :=RETCODUSR()
				Z19_STATUS :="B"
				lRet	   :=.T.
			ElseIf cOpera=="E"
				Z19_STATUS :="A"
				Z19_DTBBX  :=ctod("")
				Z19_USRBX  :=""
				lRet	   :=.T.
			ElseIf cOpera=="A" //Volta o Status do Ticket apenas quando for Exclus�o da Nota
				Z19_STATUS :="A"
				Z19_DTBBX  :=ctod("")
				Z19_USRBX  :=""
				lRet	   :=.T.
			Endif
			Z19->(MsUnLock())
		Endif
	Endif
	RestArea(aArea)

	//MemoWrite("c:\temp\CaiqueBaixa.txt",cOpera)
Return(lRet)

// Funcao para Validacao de Ticket livre para uso
user function VlTicket(cZ19Fil,cZ19Tic)

	Local aArea := GetArea()
	Local lRet	:= .F.

	dbSelectArea("Z19")
	Z19->(dbSetOrder(1))
	If Z19->(dBSeek(cZ19Fil+cZ19Tic))
		If Z19->Z19_P2>0 .AND. Z19->Z19_STATUS<>'C'
			lRet:= .T.
		Endif
	Endif
	RestArea(aArea)

Return(lRet)

// Funcao para buscar Peso Liquido do Ticket
user function BuscaPeso(cZ19Fil,cZ19Tic)

	Local aArea := GetArea()
	Local nRet	:= 0

	dbSelectArea("Z19")
	dbSetOrder(1)
	If Z19->(dBSeek(cZ19Fil+cZ19Tic))
		If Z19->Z19_P2>0 .AND. Z19->Z19_STATUS<>'C'
			nRet := U_LIQZ19()
		Endif
	Endif
	RestArea(aArea)

Return(nRet)


//Victor
User Function BALANCA()

	Local nHand   := 1
	Local nTempo := 700
	Local cPorta := SuperGetMV("MV_XBALCO",.F.,"COM3:9600,N,8,2")
	Local cString := ""
	Local cRetVar := "-1"
	Local cMens   := "Deseja repesar?"
	Local bEstab := .T.
	Local x := 0
	Local c_Leia := ""

	Private cPeso := ""

	//	Alert("Balanca")

	While .T.

		cString := ""
		cPeso   := ""
		c_Leia := ""
		aPesos := {}
		bEstab := .T.

		If MsOpenPort(nHand,cPorta) // Abrindo porta

			Sleep(nTempo)           // Tempo para capturar os dados
			MSRead(nHand, @c_Leia)   // Capturando os dados

			MsClosePort(nHand)      // Fechando porta

			nIni := At(chr(2), c_Leia) + 1
			nFim := Rat(chr(2), c_Leia)

			// Irregularidade de cones�o ou falta dos caracteres delimitadores
			If nIni = -1 .or. nFim = -1
				cMsg := "A balan�a est� desligada ou o cabo est� desconectado ou a" + chr(13)
				cMsg += "conex�o informada no parametro est� errada," + chr(13)
				cMsg += "pois n�o foi poss�vel encontrar os caracteres delimitadores."
				MsgBox(cMsg)
				If MsgYesNo(cMens,OemToAnsi('ATENCAO'))
					Loop
				Else
					Exit
				EndIf
			EndIf

			//Aviso("Balan�a",c_Leia,{"Ok"})

			cPeso := substr(c_Leia, nIni, (nFim - nIni) + 1 )

			//Aviso("Balan�a",cPeso,{"Ok"})

			aPesos := explode(chr(2), cPeso)

			// Poucas Amostras
			If len(aPesos) < 3
				MsgBox("N�o foi poss�vel adquirir o peso devido a poucas amostas." + chr(13) + "Por favor, repesar o veiculo.")
				If MsgYesNo(cMens,OemToAnsi('ATENCAO'))
					Loop
				Else
					Exit
				EndIf
			EndIf

			// Verificando a Estabilidade
			For x := 2 to len(aPesos)
				If aPesos[x] != aPesos[1]
					bEstab := .F.
					Exit
				EndIf
			Next

			If ! bEstab
				MsgBox("O peso da balan�a n�o est� estabilizado." + chr(13) + "Por favor, repesar o veiculo.")
				If MsgYesNo(cMens,OemToAnsi('ATENCAO'))
					Loop
				Else
					Exit
				EndIf
			Endif



			// Balan�a Zerada
			If substr(aPesos[1], 5, 5) = "00000"
				MsgBox("BALAN�A SEM CARGA !!!" + chr(13) + "Por favor, posicione o veiculo sobre a balan�a.")
				If MsgYesNo(cMens,OemToAnsi('ATENCAO'))
					Loop
				Else
					Exit
				EndIf
			EndIf

			// Peso Correto
			cRetVar := substr(aPesos[1], 5, 5)
			Exit
		Else
			MsgBox("N�o foi poss�vel conectar a porta especificada." + chr(13) +"Verifique se o cabo da balan�a est� conectado" + chr(13) + chr(13) + cPorta)
			If MsgYesNo(cMens,OemToAnsi('ATENCAO'))
				Loop
			Else
				Exit
			EndIf
		EndIf
	EndDo

Return cRetVar


Static Function explode(cSeparator, cString)
	Local aRetVar := {}
	Local cTemp
	Local bExec := .T.
	Local nPos

	While bExec
		nPos := At(cSeparator, cString)
		If nPos = 0
			bExec := .F.
			Exit
		EndIf
		cTemp := substr(cString, 1, nPos)
		aadd(aRetVar, cTemp)
		cString := substr(cString, nPos + 1)
	EndDo
Return aRetVar

User Function ExistZ19(cViagem)

	Local lRet	 := .T.
	Local cQuery := ""

/* Formatted on 15/02/2021 12:37:26 (QP5 v5.115.810.9015) */
	cQuery := " SELECT * FROM ZX1010 WHERE ZX1_FILIAL||ZX1_VIAGEM = '"+AllTrim(cViagem)+"' AND ZX1010.D_E_L_E_T_ = ' '	 "

//cQuery += "  LEFT JOIN ZX1010 ON ZX1010.D_E_L_E_T_ = ' '  "
//cQuery += "  AND ZX1_FILIAL|| ZX1_VIAGEM = Z19_VIAGEM "
//cQuery += " WHERE Z19010.D_E_L_E_T_ = ' ' "
//cQuery += "  AND ZX1010.D_E_L_E_T_ = ' ' "
//cQuery += "  AND ZX1_FILIAL||ZX1_VIAGEM = '"+AllTrim(cViagem)+"' "
//cQuery += "  AND ZX1_STATUS = 'I' "
//cQuery += "  AND Z19_STATUS = 'A' "

	if Select("TRBEXT") > 0
		dbSelectArea("TRBEXT")
		dbCloseArea()
	endif

	MemoWrite("C:\temp\TRBEXT.sql",cQuery)

	dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRBEXT',.F.,.T.)


	If TRBEXT->(!Eof())
		//xMagHelpFis("Mensagem","Existe a Viagem","Verifique cadastro de Recep��o de Leite.")
		lRet := .T.
	ELSE
		MsgInfo("Viagem n�o existe !","Aten��o")
		//xMagHelpFis("Mensagem","Digitar uma viagem Valida para importa��o","Verifique cadastro de Recep��o de Leite.")
		lRet := .F.
	EndIf

Return(lRet)


Static function ExistChv(cCHVNFe)
//Static function ExistViag(cZ19Fil,cZ19Viag)
	Local lRet	 := .T.
	Local cQuery := ""

	cQuery := "	SELECT Z19_FILIAL, Z19_TICKET, Z19_STATUS,Z19_CHVNFE FROM Z19010 "
	cQuery += " WHERE Z19010.D_E_L_E_T_ = ' ' "
	cQuery += "  AND Z19_CHVNFE = '"+cCHVNFe+"'"
	cQuery += "  AND Z19_STATUS IN ('A','B') "

	if Select("TRBKEY") > 0
		dbSelectArea("TRBKEY")
		dbCloseArea()
	endif

	MemoWrite("C:\temp\Z19ExisteChave.sql",cQuery)

	dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRBKEY',.F.,.T.)


	If TRBKEY->(!Eof())
		U_MsgTimer(10, "N�o � permitido utilizar a mesma Chave de Nota: " + cCHVNFe + " que j� foi utilizada anteriormente!", "Aten��o, verifique o lan�amento do Ticket", MT_IALERT, MT_TDEFAULT)
		//xMagHelpFis("Mensagem","Aten��o, N�o � permitido utilizar a mesma Chave de Nota: " + cCHVNFe + " que j� foi utilizada anteriormente!","Verifique lan�amento do Ticket.")
		lRet := .F.
	EndIf

Return(lRet)
