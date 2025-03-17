#INCLUDE "PROTHEUS.CH"
#INCLUDE "RWMAKE.CH"
#INCLUDE "TOPCONN.CH"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ MGLT023  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 05/03/2010                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Rotina de importacao dos convenios do SigaLeite para o Gestao do Leite.          						    บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Importacao dos convenios.                                                          						    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ TOTVS - Microsiga											                             					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite                                                                          					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/00  ณ                                         		   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function MGLT023

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Declaracao de Variaveis                                             ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Private oGera
Private cString := "SZ8"
Private cPerg   := "MGLT023   "

AjustaSX1()
Pergunte(cPerg,.T.)

dbSelectArea("SZ8")
dbSetOrder(1)

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Montagem da tela de processamento.                                  ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
@ 200,1 TO 380,380 DIALOG oGera TITLE OemToAnsi("Importacao dos Convenios")
@ 02,10 TO 080,190
@ 10,018 Say " Este programa ira ler a tabela SZ8 do ambiente SigaLeite e    "
@ 18,018 Say " fazer a importacao dos Movimentos do tipo CME - Compra mercado"
@ 26,018 Say " externo (convenios) para o ambiente Gestao do Leite na tabela "
@ 34,018 Say " ZLL e SE2. Data Limite serแ at้ o dia 12 do m๊s seguinte.     "

@ 70,098 BMPBUTTON TYPE 05 ACTION Pergunte(cPerg,.F.)
@ 70,128 BMPBUTTON TYPE 01 ACTION OkGera()
@ 70,158 BMPBUTTON TYPE 02 ACTION Close(oGera)

Activate Dialog oGera Centered

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ OkGera   บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao chamada pelo botao OK na tela inicial de processamenบฑฑ
ฑฑบ          ณ to. Executa a geracao do arquivo texto.                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function OkGera

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Inicializa a regua de processamento                                 ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Processa({|| RunCont() },"Processando...")

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ RunCont  บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao auxiliar chamada pela PROCESSA.  A funcao PROCESSA  บฑฑ
ฑฑบ          ณ monta a janela com a regua de processamento.               บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function RunCont

Local nVlrConv  := 0
Local nReg      := 0
Local nCont     := 1
Local cForConv  := ""
Local cLojConv  := ""
Local cNomConv  := ""
Local cISeq     := "001"
Local lErro     := .F.
Local cPrefixo  := SUPERGETMV("LT_CONVPRE")
Local cNatureza := PADR(SUPERGETMV("LT_CONVNAT"),10)
Local cDiaLimit := ALLTRIM(SUPERGETMV("LT_DIALIMI"))//Dia limite do mes seguinte para importacao dos convenios
Local dPriDia   := CTOD("01/"+MV_PAR01+"/"+MV_PAR02)//Data do primeiro dia do mes.
Local dUltDia   := CTOD(cDiaLimit+"/"+SubStr(DTOS( ADDMes(dPriDia,1) ),5,2)+"/"+SubStr(DTOS( ADDMes(dPriDia,1) ),1,4))//Data Limite sera ate o dia 12 do mes seguinte.
Local dIncDia   := LASTDAY(CTOD("01/"+MV_PAR01+"/"+MV_PAR02)) //Dia da Inclusao do Convenio
Local cTabela   := "SZ8"+STRZERO(VAL(MV_PAR01),2)+MV_PAR02
Local cNroTit   := GetCodZLL()//Pega o ultimo codigo + 1, da ZLL(Convenios).

//Tratamento para buscar os dados de uma tabela renomeada
If MV_PAR03 == 1//Movimentos Anteriores = Sim
	cQry := "SELECT COUNT(*) AS EXIST FROM sysobjects "
	cQry += "WHERE type = 'U' "
	cQry += "AND name = '"+cTabela+"'"
	TCQuery cQry NEW ALIAS "TMPQUERY"
	
	dbSelectArea("TMPQUERY")
	If TMPQUERY->EXIST == 0
		MsgInfo("Nao foi possํvel consultar a tabela SZ8"+MV_PAR01+MV_PAR02+", pois a mesma nใo existe no Banco de Dados.")
		Return()
	EndIf
	dbCloseArea("TMPQUERY")
Else
	cTabela := RetSqlName("SZ8")
EndIf

cQry := "SELECT Z8_DATA,Z8_VENCTO,Z8_FORNECE,Z8_LOJA,Z8_FAZENDA,Z8_VALOR"
cQry += " FROM "+cTabela
cQry += " WHERE D_E_L_E_T_ = ' '"
//Deve importar das duas filiais
//cQry += " AND Z8_FILIAL = '"+xFILIAL("SZ8")+"'"
cQry += " AND Z8_TPMOV  = 'CME'"
cQry += " AND Z8_STATUS = 'B'"
cQry += " AND Z8_DATA BETWEEN '"+DTOS(dPriDia)+"' AND '"+DTOS(dUltDia)+"'"
cQry += " ORDER BY Z8_FORNECE,Z8_LOJA,Z8_DATA"
TCQUERY cQry NEW ALIAS ("TMP01")
dbSelectArea("TMP01")
Count To nReg

dbSelectArea("TMP01")
dbGoTop()

dbSelectArea("SA2")
dbSetOrder(1)
dbSeek(xFILIAL("SA2")+TMP01->Z8_FORNECE+TMP01->Z8_LOJA)

cForConv := SA2->A2_COD
cLojConv := SA2->A2_LOJA
cNomConv := "CONV. "+ALLTRIM(SA2->A2_NREDUZ)
ProcRegua(nReg) // Numero de registros a processar

While TMP01->(!Eof())
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Incrementa a regua.                                                 ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	IncProc("Importando convenio "+ALLTRIM(Str(nCont))+" de "+ALLTRIM(Str(nReg)))
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Grava o Titulo para credito da Operadora do convenio.               ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If TMP01->Z8_FORNECE <> cForConv .And. TMP01->Z8_LOJA == cLojConv
		
		//If U_Inc_SE2(cPrefixo,cNroTit+"000","01","NF ",TMP01->Z8_FORNECE,TMP01->Z8_LOJA,cNatureza,dIncDia,dUltDia,nVlrConv,0,0,cForConv+cLojConv,cNomConv)
		If U_Inc_SE2(cPrefixo,cNroTit+"000","01","NF ",cForConv,cLojConv,cNatureza,dIncDia,dUltDia,nVlrConv,0,0,cForConv+cLojConv,cNomConv)
			dbSelectArea("SA2")
			dbSetOrder(1)
			dbSeek(xFILIAL("SA2")+TMP01->Z8_FORNECE+TMP01->Z8_LOJA)
			
			cForConv := SA2->A2_COD
			cLojConv := SA2->A2_LOJA
			cNomConv := "CONV. "+ALLTRIM(SA2->A2_NREDUZ)
			nVlrConv  := 0
			cISeq     := "001"
			cNroTit   := SOMA1(cNroTit)
		Else
			xMagHelpFis("Inclusao NF",;
			"A NF do convenio "+TMP01->Z8_FORNECE+"-"+TMP01->Z8_LOJA+" nao foi incluida!",;
			"Verifique o motivo da incossistencia, delete os registros importados e reprocesse a importacao.")
		EndIf
	EndIf
	
	/*
	//Posiciona no Cadastro de Fazenda
	dbSelectArea("SZ0")
	dbSetOrder(1)//Filial + Cod. Fazenda
	dbSeek(xFILIAL("SZ0")+TMP01->Z8_FAZENDA)
	
	//Posiciona no Cadastro de Fornecedor/Produtor
	dbSelectArea("SA2")
	dbOrderNickName("GLT_SA2001")//Busca Produtor pelo codigo antigo
	If dbSeek(xFILIAL("SA2")+SZ0->Z0_FORNECE+SZ0->Z0_LOJA)
	*/
	//Posiciona no Cadastro de Fornecedor/Produtor
	dbSelectArea("SA2")
	dbOrderNickName("GLT_SA2002")//Busca Produtor pelo codigo antigo da fazenda
	If dbSeek(xFILIAL("SA2")+TMP01->Z8_FAZENDA)
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Grava o titulo para debito do usuario do convenio, no caso o Produtor.    ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		Begin Transaction
		/*
		ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
		ฑฑบParametrosณ   Prefixo,  Num,  Parcela,  Tipo,  Forn,  Loja,  Natureza,  Emissao,  Vencto,  Valor, Acrescimo, Decrescimo. บฑฑ
		ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
		ฑฑบRetorno   ณ Verdadeiro = Se gravou corretamente							                         						บฑฑ
		ฑฑบ			 ณ Falso = Se ocorreu erro								                                   						บฑฑ
		ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
		*/
		If U_Inc_SE2(cPrefixo,cNroTit+cISeq,"01","NDF",SA2->A2_COD,SA2->A2_LOJA,cNatureza,dIncDia,dUltDia,TMP01->Z8_VALOR,0,0,cForConv+cLojConv,cNomConv)
			/*
			ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
			ฑฑบParametrosณ Codigo,Sequencia,Retiro,Loja,Nome,Valor,Status)																บฑฑ
			ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
			ฑฑบRetorno   ณ Nenhum               								    	                           						บฑฑ
			ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
			*/
			U_Inc_ZLL(cNroTit,cISeq,SA2->A2_COD,SA2->A2_LOJA,SA2->A2_NOME,TMP01->Z8_VALOR,"A",dIncDia,dUltDia,cForConv,cLojConv,"000001",cNatureza,"000021",0,0,,cNomConv)
			cISeq := SOMA1(cISeq)
			nVlrConv += TMP01->Z8_VALOR
		Else
			xMagHelpFis("Inclusao NDF",;
			"A NDF do produtor "+SA2->A2_COD+"-"+SA2->A2_LOJA+" nao foi incluida!",;
			"Verifique o motivo da incossistencia, delete os registros importados e reprocesse a importacao.")
			DisarmTransaction()
		EndIf
		End Transaction
	Else
		/*
		xMagHelpFis("Produtor",;
		"O produtor "+SZ0->Z0_FORNECE+"-"+SZ0->Z0_LOJA+" nao foi encontrado, consequentemente seu convenio nao sera importado!",;
		"Verifique se o codigo desse produtor existe no cadastro de produtores, no campo Codigo Antigo.")
		*/
		xMagHelpFis("Fazenda",;
		"A Fazenda "+TMP01->Z8_FAZENDA+" nao foi encontrada, consequentemente seu convenio nao sera importado!",;
		"Cadastre o produtor, informando no campo Faz. Antiga o c๓digo desta fazenda.")
	EndIf
	
	nCont++
	TMP01->(dbSkip())
EndDo

dbCloseArea("TMP01")
Close(oGera)
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ GetCodZLLบ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Busca o ultimo codigo da ZLL e soma + 1.                   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GetCodZLL()

Local aArea   := GetArea()
Local cQry    := ""
Local cCodZLL := "000001"

cQry := " SELECT MAX(ZLL_COD) AS CODIGO"
cQry += " FROM " + RetSqlName("ZLL")
cQry += " WHERE "+ RetSqlName("ZLL")+".D_E_L_E_T_ = ' '"
TcQuery cQry New Alias "QRY"

dbSelectArea("QRY")
dbGotop()

If QRY->(!Eof())
	If !Empty(QRY->CODIGO)
		cCodZLL := SOMA1(QRY->CODIGO)
	EndIf
EndIf

dbSelectArea("QRY")
dbCloseArea("QRY")

RestArea(aArea)
Return(cCodZLL)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ AjustaSX1บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para criacao das perguntas caso elas nao existam.   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function AjustaSX1()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o mes que se deseja importar.  ')
Aadd( aHelpSpa, 'Informe o mes que se deseja importar.  ')
Aadd( aHelpEng, 'Informe o mes que se deseja importar.  ')
U_xPutSx1(cPerg,"01","Mes ?","Mes ?","Mes ?","mv_ch1","C",2,0,0,"G",'',"","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o ano que se deseja importar.  ')
Aadd( aHelpSpa, 'Informe o ano que se deseja importar.  ')
Aadd( aHelpEng, 'Informe o ano que se deseja importar.  ')
U_xPutSx1(cPerg,"02","Ano ?","Ano ?","Ano ?","mv_ch2","C",4,0,0,"G",'',"","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Define se busca os dados da SZ8, mes    ')
Aadd( aHelpPor, 'atual ou SZ8+Mes+Ano, meses anteriores. ')
Aadd( aHelpSpa, 'Define se busca os dados da SZ8, mes    ')
Aadd( aHelpSpa, 'atual ou SZ8+Mes+Ano, meses anteriores. ')
Aadd( aHelpEng, 'Define se busca os dados da SZ8, mes    ')
Aadd( aHelpEng, 'atual ou SZ8+Mes+Ano, meses anteriores. ')
U_xPutSx1(cPerg,"03","Movimentos Anteriores?","Movimentos Anteriores?","Movimentos Anteriores?","mv_ch3","C",1,0,0,"C",'',"","","","mv_par03","Sim","","","","Nao","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return