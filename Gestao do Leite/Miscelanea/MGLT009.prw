#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#include "rwmake.ch"

#DEFINE _ENTER CHR(13)+CHR(10)

/*/
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммямммммммммммммммммммммммкммммммммммммммммммямммммммммммммммммммммммммммммммммммммммммммммммм╩╠╠
╠╠╨Programa  Ё MGLT009  ╨ Autor Ё TOTVS                 ╨ Data da Criacao  Ё 14/10/2008                						╨╠╠
╠╠лммммммммммьммммммммммймммммммомммммммммммммммммммммммйммммммммммммммммммомммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Descricao Ё Rotina desenvolvida para possibilitar o Acerto do Leite junto aos produtores.                                ╨╠╠
╠╠╨          Ё                        						  '			                               				        ╨╠╠
╠╠╨          Ё Serao calculados os dados Financeiros e gerado as notas fiscais para os produtores.                          ╨╠╠
╠╠╨          Ё                        									                               				        ╨╠╠
╠╠╨          Ё                        									                               				        ╨╠╠
╠╠╨          Ё                        									                               				        ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Fechamento do Leite.            						                                                        ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨ParametrosЁ Nenhum						   							                               						╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Retorno   Ё Nenhum						  							                               						╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Usuario   Ё Microsiga                                                                                					╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Setor     Ё Gestao do Leite.                                                                        						╨╠╠
╠╠лммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						╨╠╠
╠╠лммммммммммяммммммммммяммммммммммммммммммммммммммммммммммммммммммммммммммяммммммммммммммммммммммммммммммммммяммммммммммммм╧╠╠
╠╠╨Autor     Ё Data     Ё Motivo da Alteracao  				               ЁUsuario(Filial+Matricula+Nome)    ЁSetor        ╨╠╠
╠╠╨ддддддддддеддддддддддеддддддддддддддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддеддддддддддддд╨╠╠
╠╠╨ Totvs    Ё20/11/2008Ё-Mudanca devido a contabilizacao de titulos,      Ё                                  Ё TI	        ╨╠╠
╠╠╨          Ё          Ё geracao do titulo pelo valor bruto da Nota,      Ё                                  Ё   	        ╨╠╠
╠╠╨          Ё          Ё baixa dos titulos do produtor x titulo da Nota.  Ё                                  Ё   	        ╨╠╠
╠╠╨          Ё          Ё-Mudanca no tratamento dos convenios, eles passa- Ё                                  Ё   	        ╨╠╠
╠╠╨          Ё          Ё ram a gerar contas a pagar.                      Ё                                  Ё   	        ╨╠╠
╠╠╨          Ё          Ё-Mudanca na leitura dos Eventos, eles se tornaram Ё                                  Ё   	        ╨╠╠
╠╠╨          Ё          Ё dinamicos, com Condicao e Formula no cadastro.   Ё                                  Ё   	        ╨╠╠
╠╠╨ Totvs    Ё09/12/2008Ё-Criada a funcao ActMIX() para considerar os      Ё                                  Ё TI	        ╨╠╠
╠╠╨          Ё          Ё eventos de Debito incluidos na ZLF pelo MIX.     Ё                                  Ё   	        ╨╠╠
╠╠╨ Totvs    Ё16/12/2008Ё-Implementacoes para considerar o novo indice do  Ё                                  Ё TI	        ╨╠╠
╠╠╨          Ё          Ё MIX. Passou a considerar a Versao do MIX.        Ё                                  Ё   	        ╨╠╠
╠╠╨          Ё          Ё                                                  Ё                                  Ё   	        ╨╠╠
╠╠╨----------Ё----------Ё--------------------------------------------------Ё----------------------------------Ё-------------╨╠╠
╠╠╨          Ё          Ё                    							   Ё                                  Ё 			╨╠╠
╠╠╨----------Ё----------Ё--------------------------------------------------Ё----------------------------------Ё-------------╨╠╠
╠╠хммммммммммоммммммммммоммммммммммммммммммммммммммммммммммммммммммммммммммоммммммммммммммммммммммммммммммммммоммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
/*/
User Function MGLT009

Local cPerSetor   := ""
Local _bProcess    := {|oSelf| MGLT5Exec(oSelf)}
Local _oTProces

Local _cBkpFil    := cFilAnt

Private lNfe	  := .F.
Private _cPerg     := PADR("MGLT009",10)
//Private _cTpNF	  := "SPED"
Private _cTpNF	  := AllTrim(GetMv("LT_ESPECIE"))//Armazena a especie das notas fiscais dos produtores
Private _cMes      := SubStr(DtoS( ADDMes(dDataBase,1) ),5,2)
Private _cAno      := SubStr(DtoS( ADDMes(dDataBase,1) ),1,4)
//Private dUltDia   := LASTDAY(STOD(SubStr(DtoS(dDataBase),1,6)+"10")) //Ultimo dia do mes
Private _cVencto   := " " //Data de vencimento do titulo da Nota do Produtor
Private cDtSelect := _cAno+_cMes+AllTrim(GetMv("LT_VENCTO")) //Data de selecao dos titulos NDF
Private _cHist     := "Fechamento GLT "+SubStr(DtoS(dDataBase),5,2)+"/"+SubStr(DtoS(dDataBase),1,4)
Private _dDtBase   := dDatabase+7500 //Tratamento especifico para funcao SaldoTit funcionar corretamente.
Private cGLTalias := GetNextAlias() //"GLT" //Nome do alias para as tabelas temporarias
Private lDeuErro  := .F.
Private _lStatus   := .F.
Private _nReg      := 0
Private _nSldPro   := 0
Private _cNroNota  := ""
Private cCodMIX   := ""
// Private cDtIniMIX := ZLE->ZLE_DTINI
Private _cVersao   := "1"
Private _cSetores  := ""
Private _cProdDe   := ""
Private cProdAte  := ""
Private cLojaDe   := ""
Private cLojaAte  := ""
Private cRotaDe   := ""
Private cRotaAte  := ""
Private _aPrdMin   := {}
Private _cTamParc  := StrZero(1,TamSx3("E2_PARCELA")[1]) //Parcela do titulo do evento(NDF)
Private _cParcNF   := Space(TamSx3("E2_PARCELA")[1]) //Tamanho da Parcela do titulo da Nota
Private _cSerie	  := PADR(AllTrim(GETMV("LT_SERIE")),TamSx3("F1_PREFIXO")[1]) // Serie da NF
Private _cPrefixo  := _cSerie
Private cPrefConv := AllTrim(GETMV("LT_CONVPRE"))//Prefixo do titulo NF gerado pela rotina de convenio
//Private _cMultNota := AllTrim(GETMV("LT_MULTNF")) //S para uma Nota por Produtor; N para uma Nota por Municipio
Private _cMultNota := "" //S para uma Nota por Produtor; N para uma Nota por Municipio
Private _cMotBaixa := AllTrim(GETMV("LT_MOTBX"))  //Motivo de baixa utilizado para a rotina do Leite
Private _cNatureza := AllTrim(GETMV("LT_NATGLT")) //Natureza dos titulos do Produtor
Private cTesNFMun := AllTrim(GETMV("LT_TESNFE")) //TES utilizada na Nota do Municipio, nao gera contas a pagar
Private cEvetInc  := ALLTRIM(GetMv("LT_EVEINCE")) //Codigo do Evento de Incentivo(ICMS)
Private cProdInc  := POSICIONE("ZL8",1,xFilial("ZL8")+AllTrim(GetMv("LT_EVEINCE")),"ZL8_SB1COD")//Encontra o produto de incentivo.
Private cCodINSS := AllTrim(GetMv("LT_EVEINSS")) //Codigo do evento de INSS (Funrural)
Private _aLista    := {}
Private aPrdMun   := {}
Private cHoraIni  := TIME()
Private nTxPar := GetMv("LT_TXPER")
Private _lNovoLayout:= .F.
Private dBaixa     := dDataBase //Compatibilizacao com a funcao padrao fa080Juros
Private nVlEstrang := 0
Private _nTamFil    := TamSx3("ZLF_FILIAL")[1]
Private _nTamLoj    := TamSx3("ZLF_RETILJ")[1]
Private _nTamFor    := TamSx3("ZLF_RETIRO")[1]
Private _lUsaSA5 := SuperGetMv("LT_CRIASA5",,.T.) //Valida se a empresa usa amarraГЦo Produto X Fornecedor
Private _nTotDebito := 0 //Recebe total de debitos da funГЦo MGLT032

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁVariavel criada para armazenar o numero da primeira NF gerada         Ё
//Ёpara que o usuario saiba posteriormente o numero da primeira e ultima Ё
//ЁNF que foi gerada.                                                    Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
Private _cNumPriNF := ""
Private _cNumUltNF := ""

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁArmazena a filial corrente antes de iniciar o processo de fechamento.Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
Private _cFilEvent := cFilAnt
Private _cFil_SE2  := xFILIAL("SE2")

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Armazena o tipo da tributacao para ser usado nas formulas ( ZL8_FORMUL ).  Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
Private	_cTributac := ""

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁVariaveis inseridas para armazenar                                      Ё
//Ёos codigos do produtos que serao utilizados na geracao das notas fiscaisЁ
//Ёde acordo com o tipo de tributacao, em vez de pegar para cada NF.       Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
Private _cProdTrib := PADR(AllTrim(GetMv("LT_PRTRIBU")),TamSx3("B1_COD")[1]) //Tributado
Private _cProdIsen := PADR(AllTrim(GetMv("LT_PRISENT")),TamSx3("B1_COD")[1]) //Isento
Private _cProdDife := PADR(AllTrim(GetMv("LT_PRDIFER")),TamSx3("B1_COD")[1]) //Diferido

Private _cFreteLit := "" //Rtrim(GetMv("LT_EVEDES"))
Private _cFunrural := Rtrim(GetMv("LT_EVEINSS"))
Private _cMsgNota := ""


//If MsgYesNo("Utilizar novo Layout?")
_lNovoLayout := .T.
//EndIf


/*
//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁValidacao documentada , pois                                        Ё
//Ёesta validacao somente verifica se o usuario esta posicionado em    Ё
//Ёum ultimo dia de qualquer mes e nao do periodo de fechamento, abaixoЁ
//Ёtem uma validacao que substitui corretamente esta validacao.        Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
*/
/*
//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Verifica se esta no ultimo dia do mes.                              Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If dUltDia != dDataBase
MsgInfo("Ajuste a database para o ultimo dia do mes!")
Return()
EndIf
*/

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Chama funcao para criar os parametros caso nao existam.             Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
AjustaSX1()

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Chama a tela para preenchimento dos parametros.                     Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If !Pergunte(_cPerg,.T.)
	Return()
EndIf
/*
xAreaX:=GetArea()
dbSelectArea("ZZ1")
RecLock("ZZ1",.T.)
ZZ1->ZZ1_FILIAL		:= xFilial("ZZ1")
ZZ1->ZZ1_FECHAM		:= "Fechamento Leite"
ZZ1->ZZ1_OPERAC		:= "ConfirmaГЦo dos parametros"
ZZ1->ZZ1_DATA		:= dToc(Date())
ZZ1->ZZ1_HORA		:= Time()
MsUnLock()
ZZ1->(dbCloseArea())
RestArea(xAreaX)*/

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Atribui valor a variaveis comuns a todas as Funcoes.                Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁComentado                                                                Ё
//ЁO tipo de fechamento previsao foi removido da rotina de fechamento       Ё
//Ёpois anteriormente o fechamento dos titulos financeiros somente ocorreriaЁ
//Ёpara os codigos e lojas dos produtores neste caso as baixas do financeiroЁ
//Ёpodem considerar somente a loja outro impacto seria o tipo de tributacao Ё
//Ёdesta forma seriam gerados duplicados na ZLF os debitos.                 Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
//cTipoAct := Iif(MV_PAR06==1,"Previsao","Definitivo")

cTipoAct := "Definitivo"
cCodMIX  := MV_PAR01
//_cVersao  := MV_PAR02
_cSetores := AllTrim(MV_PAR02)
_cProdDe  := MV_PAR03
cProdAte := MV_PAR04
cLojaDe  := "    "
cLojaAte := "ZZZZ"
cRotaDe  := MV_PAR06
cRotaAte := MV_PAR07
//_cVencto  := _cAno+_cMes+STRZERO(VAL(MV_PAR11),2) //Dia de vencimento dos titulos
_cVencto  := _cAno+_cMes+STRZERO(VAL(MV_PAR05),2) //Dia de vencimento dos titulos
cDtSelect:= _cAno+_cMes+STRZERO(VAL(MV_PAR05),2) //Dia de vencimento dos titulos
//Se For NFE, a data de emissao deve ser a database e nao mais o ultimo dia do mes

_cMsgNota := Alltrim(MV_PAR08)+" "+Alltrim(MV_PAR09)+" "+Alltrim(MV_PAR10)

Private _cGrupoDe  	:= MV_PAR06
Private _cGrupoAte 	:= MV_PAR07


If lNfe
	
	_cMes     := SubStr(DtoS(dDataBase),5,2)
	_cAno     := SubStr(DtoS(dDataBase),1,4)
	
EndIf

//_cHist    += "-"+cCodMIX+"/"+_cVersao

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Verifica se os parametros estao em branco.                          Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If Empty(cCodMIX)
	xMagHelpFis("PARAMETRO MIX VAZIO",;
	"O parametro Codigo do MIX nao foi informado.",;
	"Preencha nos parametros o codigo do MIX")
	Return()
EndIf

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Verifica se o usuario tem permissao para executar a rotina de Acerto.Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
dbSelectArea("ZLU")
dbSetOrder(1)
If dbSeek(xFilial("ZLU")+U_UCFG001(2))
	
	If ZLU->ZLU_ACERTO != "S"
		xMagHelpFis("USUARIO SEM PERMISSAO",;
		"Usuario sem permissao para executar esta rotina.",;
		"Acesse o mСdulo Configurador e altere o usuАrio para ter acesso a esta rotina.")
		Return()
	EndIf
	
	cPerSetor := U_VldSetor(_cSetores)//Retorna os setores que o usuario nao tem permissao para acessar.
	If !Empty(cPerSetor)
		xMagHelpFis("USUARIO SEM PERMISSAO",;
		"Usuario sem permissao para acessar os setores:"+cPerSetor,;
		"Acesse o mСdulo Configurador e altere o usuАrio para ter acesso a todos os setores selecionados "+;
		"ou informe nos parametros somente os setores que vc possue acesso.")
		Return()
	EndIf
	
Else
	
	xMagHelpFis("USUARIO LEITE",;
	"Usuario nЦo encontrado no cadastro de Acessos GLT.",;
	"Acesse o mСdulo Configurador e cadastre o usuАrio na rotina Acessos GLT.")
	Return()
	
EndIf

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Inicializa a tela de processamento.                          Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	cTexto := "Esta rotina tem o objetivo de efetuar o Acerto do LEITE dos Produtores"+_ENTER
	cTexto += " "+_ENTER
	cTexto += "Antes de executar essa rotina, И preciso gerar os eventos de crИdito aos produtores no rotina de MIX!"+_ENTER
	cTexto += " "+_ENTER
	cTexto += "Ao confirmar a execuГЦo da rotina os tМtulos de dИbito e crИdito serЦo gerados no financeiro! "+_ENTER
	cTexto += "Caso haja saldo, serao compensados os titulos de dИbitos. Caso contrario, esses dИbitos permanecerЦo"+_ENTER
	cTexto += "no financeiro, e serЦo incluМdos no proximo acerto! Por fim serА gerado a NF."+_ENTER
	cTexto += " "+_ENTER
	cTexto += "A Data-Base do sistema deve ser a ultima do periodo!"+_ENTER
	
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Sintaxe da tNewProcess():New( cFunction, cTitle, _bProcess, cDescription, _cPerg, aInfoCustom) Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	_oTProces := tNewProcess():New("MGLT009","Acerto do Leite",_bProcess,cTexto,_cPerg)
Else
	Processa({|| MGLT5Exec() })
EndIf

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁRestaura a filial antes de iniciar o processo de fechamento.Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
//cFilAnt:= _cBkpFil

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt))

Return()

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    ЁMGLT5Exec Ё Autor ЁMicrosiga              Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Funcao para chamar as rotinas de Acerto.                   Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ ExpO01 - Objeto da Regua de processamento.                 Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё MGLT009()                                                  Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function MGLT5Exec(oObjProc)

Local cFunc    		:= "1" //Codigo da Qry a ser executada
Local cArqTmp  		:= cGLTalias+cFunc
Local nCont    		:= 1
Local nProd    		:= 0
Local lContinue		:= .T.
Local cxSetor  		:= ""
Local cxLinha  		:= ""
Local cxForn   		:= ""
Local cxLoja   		:= ""
Local cxTribu  		:= ""
Local nxSaldo  		:= 0
Local nxCredito  		:= 0
Local nxDebito  		:= 0
Local aStruct  		:= {}

Local cAux1    		:= ""
Local cAux2    		:= ""
Local cHoraInicial 	:= TIME()

Local _dDtBkpBas    := dDataBase

Local _lNoAcerto	:= .F.
Local _lYesAcert	:= .F.

Public _pnVLEITE := 0
Public _pnGetRedut := 0 //U_GetRedut(cCodMIX,SA2->A2_COD,SA2->A2_LOJA,ZL2->ZL2_COD,ZL3->ZL3_COD,_cVersao)
Public _npGetCreditos := 0                        //

Private cArqTRZ  		:= ""
Private cInd1TRZ 		:= ""

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Posiciona no cadastro de MIX.                                    Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
/*xAreaX:=GetArea()
dbSelectArea("ZZ1")
RecLock("ZZ1",.T.)
ZZ1->ZZ1_FILIAL		:= xFilial("ZZ1")
ZZ1->ZZ1_FECHAM		:= "Fechamento Leite"
ZZ1->ZZ1_OPERAC		:= "Inicio do processamento"
ZZ1->ZZ1_DATA		:= dToc(Date())
ZZ1->ZZ1_HORA		:= Time()
MsUnLock()
ZZ1->(dbCloseArea())
RestArea(xAreaX)*/

dbSelectArea("ZLE")
ZLE->(dbSetOrder(1))
If ZLE->(dbSeek(xFilial("ZLE")+cCodMIX+_cVersao))
	
	Private	_dDtIni	:=	ZLE->ZLE_DTINI
	Private _dDtFim	:=	ZLE->ZLE_DTFIM
	
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Verifica se o Mix ja esta encerrado.                             Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	If ZLE->ZLE_STATUS == 'F'
		xMagHelpFis("NAO CONFORMIDADE 00 - MIX FECHADO",;
		"Este Mix ja foi fechado, logo nЦo pode ser rodado o Acerto para o mesmo.",;
		"Escolha outro cСdigo de Mix ou cancele o Acerto do mesmo.")
		Return()
	EndIf
	
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Verifica se a data informada nos parametros eh uma data valida.  Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	If Month(ZLE->ZLE_DTINI) != Month(ZLE->ZLE_DTFIM)
		xMagHelpFis("NAO CONFORMIDADE 01 - PERIODO INVALIDO",;
		"Mes inicial "+AllTrim(STR(Month(ZLE->ZLE_DTINI)))+" И diferente do mes final "+AllTrim(STR(Month(ZLE->ZLE_DTFIM)))+" !",;
		"Escolha um MIX onde a data Inicio e Fim estejam no mesmo mЙs.")
		Return()
	EndIf
	
	//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Verifica se a database do sistema esta com o ultimo dia do mes. Ё
	//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	//If LastDay(ZLE->ZLE_DTFIM) != dDataBase
	If ZLE->ZLE_DTFIM != dDataBase
		xMagHelpFis("NAO CONFORMIDADE 02 - DATABASE INVALIDA",;
		"A data do sistema("+DTOC(dDataBase)+") nao esta no ultimo dia do mes!",;
		"Altere a data do sistema para "+DTOC(LastDay(ZLE->ZLE_DTFIM)) )
		Return()
	EndIf
	
	//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Verifica se existem cadastros bloqueados no SA2 com leite entregue.
	//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	If !ValidaBloqueio()
		Return()
	EndIf
	
	If oObjProc<>Nil .or. !_lNovoLayout
		
		If _lNovoLayout
			oObjProc:SaveLog("INICIO - ACERTO DO LEITE")
		EndIf
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Chama funcao para deletar na ZLF os eventos gerados pela rotina de Fechamento. Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		If _lNovoLayout
			MsgRun("Aguarde.... Preparando base para o Acerto...",,{||CursorWait(), MGLT5QRY("0"), CursorArrow()})
		Else
			MGLT5QRY("0")
		EndIf
		
		//здддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Cria Tabela temporaria para relacao
		//юдддддддддддддддддддддддддддддддддддддддддддды
		TabelaTemp(1) //Criar tabela TRZ
		
		//здддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Obtendo dados da ZLF                       Ё
		//юдддддддддддддддддддддддддддддддддддддддддддды
		MsgRun("Aguarde.... Verificando Produtores...",,{||CursorWait(), MGLT5QRY(cFunc), CursorArrow()})
		nProd:=_nReg
		
		
		//*********************************
		// Grava dados da ZLF na TRZ
		//*********************************
		GravaTRZ(1,cArqTmp)
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁNao existira no fechamento o tipo de previsao devido as particularidadesЁ
		//Ёdo fechamento financeiro.                                               Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		
		If !_lNovoLayout
			
			ProcRegua(nProd)
		Else
			oObjProc:SetRegua1(nProd)
		EndIf
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Tratamento para chamar a numeracao da primeira nota fiscal.					   Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		dbSelectArea("TRZ")
		//dbSetOrder(1)//TRZ_FILIA+TRZ_FORN+TRZ_LOJA
		dbGoTop()
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁComentado para que nao                                        Ё
		//Ёseja neessario ao usuario informar o o numero da primeira notaЁ
		//Ёuma vez que a serie ja foi definida.                          Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		
		//If TRZ->(!Eof()) .And. !(AllTrim(TRZ->TRZ_FORN+TRZ->TRZ_LOJA) $ AllTrim(GetMv("LT_SEMNOTA")))
		
		If TRZ->(!Eof()) //.And. (Posicione("SA2",1,xFilial("SA2") + TRZ->TRZ_FORN + TRZ->TRZ_LOJA,"SA2->A2_L_EMINF") != 'S')
			
			_cPrefixo:= _cSerie
			
			If cTipoAct == "Definitivo"
				If Sx5NumNota(_cSerie)
					_cNroNota := NxtSX5Nota(_cSerie)
					_cNroNota := IIF(Len(_cNroNota)<9,_cNroNota+"   ",_cNroNota)
				Else
					xMagHelpFis("NAO CONFORMIDADE 03 - NRO NOTA",;
					"O numero da Nota nЦo foi informado!",;
					"Ao executar o Acerto no modo Definitivo, И obrigatorio informar o nЗmero da Nota.")
					Return()
				EndIf
			EndIf
		EndIf
		
		While TRZ->(!Eof())
			
			// Substituindo variaveis pra facilitar modificacoes
			cxSetor := TRZ->TRZ_SETOR
			//cxLinha := TRZ->TRZ_LINHA
			cxLinha := ""
			cxForn  := TRZ->TRZ_FORN
			cxLoja  := TRZ->TRZ_LOJA
			nxSaldo := TRZ->TRZ_VALOR
			nxCredito := TRZ->TRZ_CREDIT
			nxDebito := TRZ->TRZ_DEBITO
			cxTribu := TRZ->TRZ_TRIBU
			
			_pnVLEITE := TRZ->TRZ_VLEITE
			//Compatibilizacao com a variavel utilizada no campo ZL8_FORMUL na geracao de eventos automaticos
			_cTributac := TRZ->TRZ_TRIBU
			//_cTributac := cxTribu
			
			If !_lNovoLayout
				IncProc("Produtor:"+cxForn+"-"+cxLoja)
			EndIf
			
			//зддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//Ё Verifica se a Linha e o produtor estao preparados     Ё
			//юддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			//If  cTipoAct == "Previsao" .OR. isPreparad(cCodMix,_cVersao,xFilial("ZLF"),cxSetor,cxLinha,cxForn,cxLoja,cxTribu)
			If isPreparad(cCodMix,_cVersao,xFilial("ZLF"),cxSetor,cxLinha,cxForn,cxLoja,cxTribu)
				
				//здддддддддддддддддддддддддддддддд©
				//Ё Inicia o controle de transacao.Ё
				//юдддддддддддддддддддддддддддддддды
				Begin Transaction       `
				
				//зддддддддддддддддддддддддддддддддддддд©
				//Ё Cadastro de Fornecedor( Produtor ). Ё
				//юддддддддддддддддддддддддддддддддддддды
				dbSelectArea("SA2")
				SA2->(dbSetOrder(1))
				If SA2->(dbSeek(xFilial("SA2")+cxForn+cxLoja))
					/*
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//ЁAdicionado pois nao estava                                    Ё
					//Ёposicionando no setor que foi gerado os eventos do produtor	 Ё
					//Ёe estava se utilizando a referencia do setor.                 Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					*/
					//_cTributac := SA2->A2_L_TRIBU
					//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Posiciona no Setor do Produtor.                                                 Ё
					//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					DbSelectArea("ZL2")
					ZL2->(DbSetOrder(1))
					If !ZL2->(DbSeek(xFILIAL("ZL2") + cxSetor))
						
						lDeuErro := .T.
						
						if _lNovoLayout
							oObjProc:SaveLog("ERRO 01 - SETOR INEXISTENTE " + cxSetor)
						endif
						
						xMagHelpFis("NAO CONFORMIDADE 04 - SETOR INEXISTENTE",;
						"O setor: " + cxSetor + " nЦo existe no cadastro de Setores.",;
						"Informe no cadastro de produtor uma linha com Setor existente no cadastro de Setores.")
						
					Else
						
						//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//ЁArmazena se o tipo da nota fiscal a ser gerada eh por municipioЁ
						//Ёou uma nota para cada produtor.                                Ё
						//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						_cMultNota:= ZL2->ZL2_MULTNF
					EndIf
					
					//зддддддддддддддддддддддддддддддддддд©
					//Ё Atualiza a regua de processamento.Ё
					//юддддддддддддддддддддддддддддддддддды
					If oObjProc <> Nil
						oObjProc:IncRegua1("Produtor "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nProd))+" ("+AllTrim(str( round((nCont/nProd)*100,0) ))+"%) -> " + SA2->A2_COD +"/"+SA2->A2_LOJA +" - "+SA2->A2_NOME)
					EndIf
					/*xAreaX:=GetArea()
					dbSelectArea("ZZ1")
					RecLock("ZZ1",.T.)
					ZZ1->ZZ1_FILIAL		:= xFilial("ZZ1")
					ZZ1->ZZ1_FECHAM		:= "Fechamento Leite"
					ZZ1->ZZ1_OPERAC		:= " Inicio de processamento fornecedor "+TRZ->TRZ_FORN+" Loja "+TRZ->TRZ_LOJA
					ZZ1->ZZ1_DATA		:= dToc(Date())
					ZZ1->ZZ1_HORA		:= Time()
					MsUnLock()
					ZZ1->(dbCloseArea())
					RestArea(xAreaX)*/
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Calcula o Saldo contido na ZLF, considerando apenas valores gerados  Ё
					//Ё pelo MIX ou lancados manualmente pelo usuario.                       Ё
					//Ё                                                                      Ё
					//Ё Essa variavel vai controlando o saldo do produtor, pois caso a mesma Ё
					//Ё fique zerada, os titulos nao serao baixados.                         Ё
					//Ё                                                                      Ё
					//Ё 21/05/12                                                             Ё
					//Ё Essa variavel eh atualizada nesse momento, pois existem casos que    Ё
					//Ё o produtor eh uma empresa e ela envia a nota.                        Ё
					//Ё Para os demais produtores, essa variavel vai ser atualizada na       Ё
					//Ё funcao GrvNfPro(), pois o credito do produtor sera lido da SE2.      Ё
					//Ё                                                                      Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					_nSldPro := Round(nxSaldo,2)
					
					
					//Grava variavel publica que serА usada nos eventos
					_pnGetRedut := nxDebito//U_GetRedut(cCodMIX,SA2->A2_COD,SA2->A2_LOJA,ZL2->ZL2_COD,ZL3->ZL3_COD,_cVersao)
					_npGetCreditos := nxCredito //U_GetCredPr(ZLE->ZLE_COD,SA2->A2_COD,SA2->A2_LOJA,ZL2->ZL2_COD,ZL3->ZL3_COD,,.F.)
					
					
					//If !lDeuErro //.And. cTipoAct == "Definitivo"
					If !lDeuErro .And. cTipoAct == "Definitivo"
						
						//Se produtor diferente de pessoa jurМdica, gera a nota. Caso contrario so inclui titulo no financeiro
						//If SA2->A2_TIPO <> "J" .and. Empty(SA2->A2_L_GRUPO)
						If SA2->A2_L_GERNF = "S" //Campo controle para identificar se serА gerada a nota.
							/*xAreaX:=GetArea()
							dbSelectArea("ZZ1")
							RecLock("ZZ1",.T.)
							ZZ1->ZZ1_FILIAL		:= xFilial("ZZ1")
							ZZ1->ZZ1_FECHAM		:= "Fechamento Leite"
							ZZ1->ZZ1_OPERAC		:= " Inicio cricao nota produtor "+ SA2->A2_NREDUZ
							ZZ1->ZZ1_DATA		:= dToc(Date())
							ZZ1->ZZ1_HORA		:= Time()
							MsUnLock()
							ZZ1->(dbCloseArea())
							RestArea(xAreaX)  */
							
							
							GrvNfPro(oObjProc) //Acerto Fiscal(Gera NF produtor)
							
							/*xAreaX:=GetArea()
							dbSelectArea("ZZ1")
							RecLock("ZZ1",.T.)
							ZZ1->ZZ1_FILIAL		:= xFilial("ZZ1")
							ZZ1->ZZ1_FECHAM		:= "Fechamento Leite"
							ZZ1->ZZ1_OPERAC		:= " Final cricao nota produtor "+ SA2->A2_NREDUZ
							ZZ1->ZZ1_DATA		:= dToc(Date())
							ZZ1->ZZ1_HORA		:= Time()
							MsUnLock()
							ZZ1->(dbCloseArea())
							RestArea(xAreaX) */
						Else
							//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
							//Ё Calcula o desconto da NF, FUNRURAL E FRETE DE DESCONTO                               Ё
							//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
							/* DBSelectArea("ZL8")
							ZL8->(dbSetOrder(1))//ZL8_FILIAL+ZL8_COD
							
							//DESCONTO DE FRETE
							IF ZL8->(dbSeek(xFilial("ZL8") + _cFreteLit))
							_nvlFret := &(ZL8->ZL8_FORMULA)
							ENDIF
							
							// FUNRURAL
							IF ZL8->(dbSeek(xFilial("ZL8") + _cFunrural))
							_nvlFun := &(ZL8->ZL8_FORMULA)
							ENDIF
							_nSldPro := _nSldPro -(_nvlFret + _nvlFun)  // Total creditos do produtor menos frete e funrural.
							*/
							//_cNroNota := SubStr(SA2->A2_COD,2,5)+ SubStr(cCodMIX,3,4) // Numero da nota igual matricula sem o C e 4 ultimos digitos do mix Ex: 311500002
							//IncluiSE2(oObjProc,_nSldPro,_cPrefixo,_cNroNota,_cTamParc,"NF ","NOTA DO LEITE",xFilial("ZLF")+cCodMIX+_cVersao+SA2->A2_COD+SA2->A2_LOJA,"MGLT5Exec",_cNatureza,"")
							
						EndIf
					EndIf
					
					//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//ЁIncluido, para que as                                                            Ё
					//Ёbaixas realizadas no titulo ja contemplem a data maxima do pagamento para o      Ё
					//Ёcalculo de juros por exemplo:                                                    Ё
					//ЁFechamento: 01/02/12 a 29/02/12 - somente era calculado o juros ate o dia        Ё
					//Ё29/02/12, agora com a alteracao sera considerada a data de fechamento, atualmenteЁ
					//Ёo 15 dia do mes posterior no nosso exemplo seria: 15/03/12.                      Ё
					//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					//dDataBase:= StoD(_cVencto)
					dBaixa   := StoD(_cVencto) //Compatibilizacao com a funcao padrao fa080Juros
					
					
					If !lDeuErro
						ActMix(oObjProc) //Acerto de Eventos de Debito incluidos pelo Mix(Le a ZLF, gera e baixa SE2).
					EndIf
					
					If !lDeuErro
						ActEvento(oObjProc) //Acerto de Eventos Automatico(Le a ZL8, gera ZLF e SE2 e baixa SE2)
					EndIf

					If !lDeuErro
						_nTotDebito := U_MGLT032(cCodMIX,cxForn,cxLoja,oObjProc) //Executa a rotina de fechamento fiannceiro para o produtor
						//O acerto financeiro desposiciona a loja, necessario reposicionar	
						dbSelectArea("SA2")
						SA2->(dbSetOrder(1))
						SA2->(dbSeek(xFilial("SA2")+cxForn+cxLoja))


					EndIf
					/*
					If !lDeuErro
					CompesTit(SA2->A2_COD,SA2->A2_LOJA,_cTributac,cFilant,_dDtIni,_dDtFim,cDtSelect) //Compensacao financeira NCC e NDF
					EndIf
					
					If !lDeuErro
					ActCreditos(oObjProc) //Acerto Creditos(Compensa creditos do produtor com os NDFs em aberto e gera ZLF )
					EndIf
					
					If !lDeuErro
					ActFinanc(oObjProc) //Acerto Financeiro(Baixa Contas a Pagar da loja corrente do produtor e gera ZLF )
					EndIf
					

					*/
					
					If !lDeuErro 
						dbSelectArea("SF1")
						SF1->(dbSetOrder(1))//F1_FILIAL+F1_DOC+F1_SERIE+F1_FORNECE+F1_LOJA+F1_TIPO
						If SF1->(dbSeek(xFilial("SF1") + _cNroNota + _cSerie + cxForn+cxLoja + "N"))
							RecLock("SF1",.F.)
							SF1->F1_L_MENSG	:= GetDescNF(SF1->F1_FILIAL,SF1->F1_DOC,SF1->F1_SERIE,SF1->F1_FORNECE,SF1->F1_LOJA,SF1->F1_VALBRUT,SF1->F1_VALICM,cCodMix,_cVersao,ZL2->ZL2_COD,_cTributac)
							SF1->(MsUnlock())
						Endif
					EndIf

					If !lDeuErro
						AtualizaSld(oObjProc) //Grava dados do fechamento na tabela ZLV
					EndIf					
					
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//ЁEfetua a restauracao da database antes da realizacao das baixas.Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					dDataBase:= _dDtBkpBas
					dBaixa   := _dDtBkpBas
					
					//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Apos processar todas as funcoes, flag a ZLF informando queЁ
					//Ё os eventos do produtor foram todos processados.           Ё
					//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					If cTipoAct == "Definitivo" .And. !lDeuErro
						//U_AtuStatus("S",SA2->A2_COD,SA2->A2_LOJA,cxTribu,_cMultNota,SA2->A2_COD_MUN,SA2->A2_EST,ZLE->ZLE_DTINI,ZLE->ZLE_DTFIM)
						U_AtuStatus("F",cxForn,cxLoja,"","",cxTribu,_cMultNota,SA2->A2_COD_MUN,SA2->A2_EST,ZLE->ZLE_DTINI,ZLE->ZLE_DTFIM)
					EndIf
				Else
					If _lNovoLayout
						oObjProc:SaveLog("ERRO 05 - Nao existe Produtor "+AllTrim(cxForn+cxLoja))
					EndIf
					xMagHelpFis("NAO CONFORMIDADE 08 - Nao existe Produtor",;
					"Produtor "+AllTrim(SA2->A2_COD+SA2->A2_LOJA)+" nЦo existe no cadastro!",;
					"Nao sera gerado Acerto para esse produtor. Verifique o cСdigo do produtor no MIX versus o cadastro!","Alerta")
				EndIf
				
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Grava Descricao dos Descontos na NF e zera NroNota               Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				If cTipoAct == "Definitivo" .And. _cMultNota == "S" //Uma Nota por produtor
					_cNroNota := ""
					_cParcNF  := Space(TamSx3("E2_PARCELA")[1]) //Tamanho da Parcela do titulo da Nota
				EndIf
				
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё                                                                        Ё
				//Ё Se pelo menos um produtor estiver fechado, o status dos cadastros de   Ё
				//Ё TIPOS DE FAIXAS / VLR X GRUPO BONIFICACAO / ANALISES X DATA CALCULO /  Ё
				//Ё FAIXA DE INDICACAO /GRUPO BONIF. X TP FAIXAS/ CABECALHO DESCONTO FRETE Ё
				//Ё eh alterado para ficar com o Status Fechado.                           Ё
				//Ё                                                                        Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				If !_lStatus //Se nao rodou o update
					_lStatus := U_AtuStatus("S","","","","",_cTributac,,,,ZLE->ZLE_DTINI,ZLE->ZLE_DTFIM)
				EndIf
				
				//зддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Se houve alguma falha, desfaz todas as transacoes.Ё
				//юддддддддддддддддддддддддддддддддддддддддддддддддддды
				If lDeuErro
					lContinue := .F.
					DisarmTransaction()
					lDeuErro := .F.
				EndIf
				
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Finaliza o controle de transacao, caso nao hajam falhas. Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				End Transaction
			Else
				
				xMagHelpFix("Aprovacao",;
				"O Produtor "+cxForn+"-"+cxLoja+" nao esta preparado para finalizar!",;
				"Efetue a autorizacao de acerto no Mix para esse Produtor em todas as linhas/rotas! ")
				lContinue := .F.
				
			EndIf // se isPreparad
			
			// Seta numero da parcela como 01 (by Abrahao em 02/02/2009)
			_cTamParc  := StrZero(1,TamSx3("E2_PARCELA")[1])
			
			If !lContinue
				If MsgYesNo("Ocorreram nЦo conformidades no processo. Deseja continuar a rotina?")
					lContinue:=.T.
				Else
					lContinue:=.F.
				EndIf
			EndIf
			
			If !lContinue
				exit
			EndIf
			
			nCont++
			/*xAreaX:=GetArea()
			dbSelectArea("ZZ1")
			RecLock("ZZ1",.T.)
			ZZ1->ZZ1_FILIAL		:= xFilial("ZZ1")
			ZZ1->ZZ1_FECHAM		:= "Fechamento Leite"
			ZZ1->ZZ1_OPERAC		:= " Final de processamento fornecedor "+TRZ->TRZ_FORN+" Loja "+TRZ->TRZ_LOJA
			ZZ1->ZZ1_DATA		:= dToc(Date())
			ZZ1->ZZ1_HORA		:= Time()
			MsUnLock()
			ZZ1->(dbCloseArea())
			RestArea(xAreaX) */
			
			TRZ->(dbSkip())
			
			If TRZ->(Eof())
				TabelaTemp(2)
				TabelaTemp(1)
				GravaTRZ(2,cArqTmp)
			EndIf
			
		EndDo
		
		// Deleta Tabela TRZ temporaria
		TabelaTemp(2)
		
		
	EndIf
	
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//ЁIncluido, pois a EMPRESA                                  Ё
	//Ёnao trabalha com a emissao de nota fiscal por Municipio.  Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	/*
	If _cMultNota == "N" .And. cTipoAct == "Definitivo" //Uma Nota por MUNICIPIO e acerto definitivo
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Foi colocada essa pergunta, porque pode ocorrer do usuario cancelar o fechamento de 3 produtores por exemplo,Ё
	//Ё nesse caso somente quando For fazer o Acerto novamente e estando no calculo do ultimo produtor eh que deve   Ё
	//Ё ser gerado a Nota do Municipio.                                                                              |
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	If MsgYesNo("Deseja gerar a(s) Nota(s) do(s) Municipio(s)?")
	Processa( {|| gerNFS() } )
	EndIf
	EndIf
	*/
	
	//зддддддддддддддддддддддддддддддддддд©
	//Ё Altera o Status da ZLE.           Ё
	//юддддддддддддддддддддддддддддддддддды
	If cTipoAct == "Definitivo"
		
		//зддддддддддддддддддддддддддддддддддд©
		//Ё Altera o Status da ZLE.           Ё
		//юддддддддддддддддддддддддддддддддддды
		cQry := "SELECT"
		cQry += " COUNT(*) AS QTD,
		cQry += " ZLF_ACERTO FROM "
		cQry += RetSqlName("ZLF") + " "
		cQry += "WHERE"
		cQry += " D_E_L_E_T_ = ' '"
		cQry += " AND ZLF_CODZLE = '" + cCodMIX  + "'"
		cQry += " AND ZLF_VERSAO = '" + _cVersao  + "' "
		cQry += "GROUP BY"
		cQry += " ZLF_ACERTO"
		
		TCQUERY cQry NEW ALIAS("GLT44")
		
		dbSelectArea("GLT44")
		GLT44->(dbGoTop())
		
		While GLT44->(!Eof())
			/*
			//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//ЁVerifica se foram encontrados registros sem efetuar o acerto.Ё
			//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			*/
			If GLT44->ZLF_ACERTO == 'N' .And. GLT44->QTD > 0
				
				_lNoAcerto:= .T.
				/*
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//ЁVerifica se foram encontrados registros que ja foram efetuados o acerto.Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				*/
			ElseIf GLT44->ZLF_ACERTO == 'S' .And. GLT44->QTD > 0
				
				_lYesAcert:= .T.
				
			EndIf
			
			GLT44->(dbSkip())
		EndDo
		
		dbSelectArea("GLT44")
		dbCloseArea("GLT44")
		
		RecLock("ZLE",.F.)
		
		/*
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁIndica um Mix parcialmente fechado, ou seja, possui fechamentoЁ
		//Ёe alguns fretistas ou produtores sem efetuar o fechamento.    Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		*/
		If _lNoAcerto .And. _lYesAcert
			
			ZLE->ZLE_STATUS := 'P'
			
			/*
			//зддддддддддддддддддддддддддддддддддддддддд©
			//ЁMix que se encontra totalmente em aberto.Ё
			//юддддддддддддддддддддддддддддддддддддддддды
			*/
		ElseIf _lNoAcerto .And. !_lYesAcert
			
			ZLE->ZLE_STATUS := 'A'
			
			/*
			//зддддддддддддддддддддддддддддддддддддддд©
			//ЁMix que se encontra totalmente fechado.Ё
			//юддддддддддддддддддддддддддддддддддддддды
			*/
		ElseIf !_lNoAcerto .And. _lYesAcert
			
			ZLE->ZLE_STATUS := 'F'
			
		EndIf
		
		ZLE->(MsUnLock())
		
	EndIf
	
	If _lNovoLayout
		oObjProc:SaveLog("FIM - ACERTO DO LEITE")
	EndIf
Else
	xMagHelpFis("NAO CONFORMIDADE 09 - MIX nao encontrado.",;
	"O MIX informado nos parЦmetros nЦo foi encontrado!",;
	"Escolha um cСdigo de MIX que exista.")
EndIf

DbCloseArea(cArqTmp)

MsgInfo("Tempo gasto no processamento:"+ELAPTIME(cHoraInicial,TIME()))

/*xAreaX:=GetArea()
dbSelectArea("ZZ1")
RecLock("ZZ1",.T.)
ZZ1->ZZ1_FILIAL		:= xFilial("ZZ1")
ZZ1->ZZ1_FECHAM		:= "Fechamento Leite"
ZZ1->ZZ1_OPERAC		:= " Final do processamento "
ZZ1->ZZ1_DATA		:= dToc(Date())
ZZ1->ZZ1_HORA		:= Time()
MsUnLock()
ZZ1->(dbCloseArea())
RestArea(xAreaX)  */


//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁVerifica se alguma nota fiscal foi gerada para imprimir o intervaloЁ
//Ёinicial e final.                                                   Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If Len(AllTrim(_cNumPriNF)) > 0
	
	MsgInfo("O nЗmero da(s) nota(s) inicial e final gerada(s) ao(s) produtor(es):" + _ENTER + _ENTER +;
	"N.F. Inicial: " + AllTrim(_cNumPriNF) + '/'+ _cSerie + _ENTER +;
	"N.F. Final  : " + AllTrim(_cNumUltNF) + '/'+ _cSerie,"Alerta")
	
EndIf

Return

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    Ё GrvNfPro Ё Autor ЁMicrosiga              Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Funcao p/ realizar o Acerto Fiscal( Geracao da NF Produtor)Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ ExpO01 - Objeto da Regua de processamento.                 Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё MGLT009()                                                  Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/

Static Function GrvNfPro(oObj)

Local cFunc    := "2" //Codigo da Qry a ser executada
Local cArqTmp  := cGLTalias+cFunc
Local cItem    := "0001"
Local cParcSE2 := Space(TamSx3("E2_PARCELA")[1])
Local nPeso	:= 0
Local nDescto  := 0
Local nTotNF   := 0
Local cUltItem := ""
Local nCont    := 1
Local nTotReg  := 0
Local _aCab    := {}
Local _aItens  := {}
Local _aArea   := {}
Local _aAlias  := {}
Local cSeekZLF := ""
Local cSeekSD1 := ""
Local nTotalNF := 0
Local cCondPgt := AllTrim(GETMV("LT_CODPGTO"))
Local aAreaSA2 := SA2->(GetArea())
//Local cSemICM  := AllTrim(GETMV("LT_TESICMS"))
Local cTes     := ""
Local cTesTrib     := AllTrim(GETMV("LT_TESTRIB")) //TES tributada com ICMS
Local cTesDife     := AllTrim(GETMV("LT_TESDIFE")) //TES diferida de ICMS
Local cTesDiSe     := AllTrim(GETMV("LT_TESDISE")) //TES Diferido sem cАlculo de Funrural, somente SENAR
Local cTesIsen     := AllTrim(GETMV("LT_TESISEN")) //TES isenta de ICMS
Local cTesNfun     := AllTrim(GETMV("LT_TESNFUN")) //TES NЦo desconta Senar/Funrural //Alterado por Godinho - 01/02/2019
Local nPosProd := 0
Local cProdSB1 := ""
Local _nVolAno := 0
Local _nvlFret := 0
Local _nvlFun  := 0
Local _nTotalSD1 := 0
Local _nModAnt := nModulo
Local _cModAnt := cModulo

Private nQtde  := 0
Private nVlrUnit := 0
Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

//здддддддддддддддд©
//Ё  Salva a area. Ё
//юдддддддддддддддды
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL2","ZL8","ZLF","SF1","SD1","SX1"})

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁSeleciona o codigo do produto de acordo com a tributacao corrente.Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If _cTributac == "T"//Produto Tributado
	cProdSB1 := _cProdTrib
ElseIf _cTributac == "I"//Produto Isento
	cProdSB1 := _cProdIsen
ElseIf _cTributac == "D"//Produto Diferido
	cProdSB1 := _cProdDife
Else
	xMagHelpFis("INFORMAгцO",;
	"NЦo foi encontrado um tipo de tributaГЦo para o produtor: " + SA2->A2_COD + '/' + SA2->A2_LOJA,;
	"Desta forma nЦo serА possМvel proseguir com o fechamento deste produtor, favor comunicar ao departamento de informАtica")
	lDeuErro := .T.
	Return()
EndIf

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza o log de processamento   Ё
//юддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	oObj:SaveLog("INICIO - Nota por Produtor - "+SA2->A2_COD +"/"+SA2->A2_LOJA)
EndIf

//здддддддддддддддддддддддддддддддддддддддддддд©
//Ё Chama funcao para criar tabela Temporaria. Ё
//юдддддддддддддддддддддддддддддддддддддддддддды
//If _lNovoLayout
//	MsgRun("Aguarde.... Filtrando dados para NF Produtor...",,{||CursorWait(), MGLT5QRY(cFunc), CursorArrow()})
//Else
	MGLT5QRY(cFunc)
//EndIf

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza a regua de processamento.Ё
//юддддддддддддддддддддддддддддддддддды
If oObj <> Nil
	nTotReg := _nReg
	oObj:SetRegua2(nTotReg)
EndIf

//зддддддддддддддддддддддддддддддддддд©
//Ё Pega o Numero da proxima Nota.    Ё
//юддддддддддддддддддддддддддддддддддды
If Len(AllTrim(_cNroNota)) == 0
	_cNroNota := NxtSX5Nota(_cSerie)
	_cNroNota := IIF(Len(_cNroNota)<9,_cNroNota+"   ",_cNroNota)
EndIf

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁTratamento efetuado para armazenar o numero da primeira e       Ё
//Ёultima nota do produtor, para que seja possМvel emitir no final Ё
//Ёdo fechamento estas numeracoes ao usuario.                      Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If Len(AllTrim(_cNumPriNF)) == 0
	
	_cNumPriNF:= _cNroNota
	
EndIf

_cNumUltNF:= _cNroNota


//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Chama funcao para calcular o desconto gerado pela penalizacao(Redutor) da qualidade. Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
dbSelectArea(cArqTmp)
dbGoTop()

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Chama funcao para calcular o desconto gerado pela penalizacao(Redutor) da qualidade. Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
//nDescto := U_GetRedut(cCodMIX,SA2->A2_COD,SA2->A2_LOJA,ZL2->ZL2_COD,ZL3->ZL3_COD,_cVersao)

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Calcula o desconto da NF, FUNRURAL E FRETE DE DESCONTO                               Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды

dbSelectArea("ZL8")
ZL8->(dbSetOrder(1))//ZL8_FILIAL+ZL8_COD
/*
//DESCONTO DE FRETE
IF ZL8->(dbSeek(xFilial("ZL8") + _cFreteLit))
_nvlFret := &(ZL8->ZL8_FORMULA)
ENDIF

// FUNRURAL
IF ZL8->(dbSeek(xFilial("ZL8") + _cFunrural))
_nvlFun := &(ZL8->ZL8_FORMULA)
ENDIF
// nDescto := _nvlFret + _nvlFun  // Soma FUNRURAL e DESCONTO DE FRETE - foi retirado do campo desconto, indo para o extrato
*/

/*
//Busca volume do leite no ano corrente
//_nVolAno := U_VLEITE("","","N",.T.)

//Se o volume for menor ou igual a 657mil litros e o
//produtor for optante pelo ICMS a NF e tributada
If (_nVolAno <= 657000) .AND. SA2->A2_L_ICMS == "S"
	cTes := cTesTrib
	_cTributac := "T"
Else
	If SA2->A2_TIPO == "J" //Se pessoa juridica a NF И diferida
		cTes := cTesDife
		_cTributac := "D"
		Else
		cTes := cTesIsen
		_cTributac := "I"
	EndIf
EndIf
*/
/*
If SA2->A2_EST == "MG" .AND. SA2->A2_L_ICMS == "S"
	cTes := cTesTrib
	_cTributac := "T"
eLSE
	cTes := cTesIsen
	_cTributac := "I"
EndIf
*/
If SA2->A2_TIPO == "J" //Se pessoa juridica a NF И diferida
	cTes := cTesDife
	_cTributac := "D"
ElseIf SA2->A2_L_TRIBU == "T"
	cTes := cTesTrib
	_cTributac := "T"
ElseIf SA2->A2_L_TRIBU == "D" .and. SA2->A2_L_INSS == "S" .and. SA2->A2_L_SENAR == "S" 
	cTes := cTesDife
	_cTributac := "D"
ElseIf SA2->A2_L_TRIBU == "D" .and. SA2->A2_L_INSS == "N" .and. SA2->A2_L_SENAR == "S"
	cTes := cTesDiSe
	_cTributac := "D"
ElseIf SA2->A2_L_TRIBU == "I"
	cTes := cTesIsen
	_cTributac := "I"
ElseIf SA2->A2_L_TRIBU == "D" .and. SA2->A2_L_INSS == "N" .and. SA2->A2_L_SENAR == "N"
	cTes := cTesNfun
	_ctributac :="D"	
EndIf

//здддддддддддддддддддддддддддддддддддддд©
//Ё Cabecalho da Nota Fiscal( SigaAuto). Ё
//юдддддддддддддддддддддддддддддддддддддды
_aCab :={;
{"F1_TIPO"      ,"N"			  ,NIL},;	// Tipo da Nota = Normal
{"F1_FORMUL"	,"S"		      ,NIL},;	// Formulario Proprio = Sim.
{"F1_DOC"		,_cNroNota        ,NIL},;	// Numero do Documento.
{"F1_SERIE"		,_cSerie 	      ,NIL},;	// Serie do Documento.
{"F1_PREFIXO"	,_cPrefixo 	      ,NIL},;	// Serie do Documento.
{"F1_EMISSAO"	,dDataBase	      ,NIL},;	// Data de Emissao.
{"F1_DESPESA"	,0			      ,NIL},;	// Despesa
{"F1_FORNECE"	,SA2->A2_COD	  ,NIL},;	// Codigo do Fornecedor.
{"F1_LOJA"	  	,SA2->A2_LOJA 	  ,NIL},;	// Loja do Fornecedor.
{"F1_ESPECIE"	,_cTpNF    	      ,NIL},;	// Especie do Documento.
{"F1_COND"		,cCondPgt         ,NIL},;	// Condicao de Pagamento.
{"F1_SEGURO"	,0	    	      ,NIL},;	// Seguro
{"F1_FRETE"		,0	    	      ,NIL},;	// Frete
{"F1_DESCONT"	,nDescto          ,NIL},;   // Desconto (FUNRURAL + FRETE)
{"F1_PESOL"		,0	              ,NIL},;	// Peso Liquido
{"F1_HORA"		,Left(Time(),5)   ,NIL},;	// Hora de geraГЦo da NF.
{"E2_NATUREZ"	,_cNatureza       ,NIL}}	// Natureza do titulo a pagar.

dbSelectArea(cArqTmp)
dbGoTop()
While (cArqTmp)->(!Eof())
	
	
	//	_nTotalSD1 := (cArqTmp)->ZLF_TOTAL - U_GetRedut(cCodMIX,SA2->A2_COD,SA2->A2_LOJA,ZL2->ZL2_COD,ZL3->ZL3_COD,_cVersao)
	_nTotalSD1 := (cArqTmp)->ZLF_TOTAL - _pnGetRedut
	
	//зддддддддддддддддддддддддддддддддддд©
	//Ё Atualiza a regua de processamento.Ё
	//юддддддддддддддддддддддддддддддддддды
	If oObj <> Nil
		oObj:IncRegua2("Nota Fiscal - Item "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
		nCont++
	EndIf
	
	//Adicionado em 05/09/2013 para gerar uma linha para cada produto na NF.
	cProdSB1 := AllTrim(Posicione("ZL8",1,xFilial("ZL8")+(cArqTmp)->ZLF_EVENTO,"ZL8_SB1COD"))
	
	//зддддддддддддддддддддддд©
	//Ё Cadastro de Produtos. Ё
	//юддддддддддддддддддддддды
	dbSelectArea("SB1")
	SB1->(dbSetOrder(1))
	If SB1->(dbSeek(xFilial("SB1") + cProdSB1 ))
		
		nQtde    := If((cArqTmp)->ZLF_QTDBOM>0,(cArqTmp)->ZLF_QTDBOM,1)
		cSeekSD1 := _cFilEvent + _cNroNota + _cSerie + SA2->A2_COD + SA2->A2_LOJA + SB1->B1_COD + cItem
		nPeso := SB1->B1_PESO		
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁComentado, pois da forma                                      Ё
		//Ёque estava nao seria armazenado na ZLF o seek dos eventos que Ё
		//Ёcomporam a nota.                                              Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		
		//cSeekZLF := GrvZLF( AllTrim(GetMv("LT_EVELTE")),0,cSeekSD1,.F.,.T.,"001","GrvNfPro",,0,0,CTOD(""),"")
		cSeekZLF := GrvZLF((cArqTmp)->ZLF_EVENTO,0,cSeekSD1,.F.,.T.,(cArqTmp)->ZLF_SEQ,"GrvNfPro","",0,0,CTOD(""),"",0,0,SA2->A2_COD,SA2->A2_LOJA,"",cFilAnt,.F.)
		
		//Se o array esta vazio entao zera a variavel para adicionar os dados no array;
		//caso contrario verifica se o produto ja existe no array;
		//Se existir apenas soma-se os valores, senao adiciona o novo produto no array.
		If Len(_aItens) == 0
			nPosProd := 0
		Else
			nPosProd := ASCAN(_aItens,{|x| ALLTRIM(x[2][2]) == ALLTRIM(SB1->B1_COD)})
		EndIf
		
		//Se o produto nao existe no Array adiciona, caso contrario so incrementa valor
		If nPosProd == 0
			aAdd(_aItens,{;
			{"D1_ITEM"      ,cItem				          ,NIL},;	// Sequencia Item Pedido
			{"D1_COD"		,SB1->B1_COD         		  ,NIL},;	// Codigo do Produto
			{"D1_QUANT"		,nQtde						  ,NIL},;	// Quantidade
			{"D1_VUNIT"		,0							  ,NIL},;	// Valor Unitario
			{"D1_TOTAL"		,_nTotalSD1			          ,NIL},;	// Valor Total
			{"D1_TES"		,cTes		     			  ,NIL},;	// Tipo de Entrada - TES
			{"D1_LOCAL"		,SB1->B1_LOCPAD				  ,NIL},;	// Armazem Padrao do Produto
			{"D1_SEGURO"	,0							  ,NIL},;	// Seguro
			{"D1_VALFRE"	,0							  ,NIL},;	// Frete
			{"D1_DESPESA"	,0							  ,NIL},;	// Despesa
			{"D1_L_SEEK"	,cSeekZLF		              ,NIL}})	// Chave de pesquisa da SD1 na ZLF
			
			//{"D1_VALDESC"	,nDescto  				      ,NIL},;	// Desconto comentado para ser deduzido no valor total da nota fiscal
			//{"D1_VLINCMG"	,0							  ,NIL},;	// Vl.Incentivo Prod.Leite
			//{"D1_PRINCMG"	,SB1->B1_PRINCMG			  ,NIL},;	// Perc.Incentivo Prod.Leite
			cItem    := SOMA1(cItem)
		Else
			_aItens[nPosProd,5,2] += (cArqTmp)->ZLF_TOTAL
			
		EndIf
		
		nTotalNf += (cArqTmp)->ZLF_TOTAL
	Else
		
		lDeuErro := .T.
		If _lNovoLayout
			oObj:SaveLog("ERRO 06 - Produto "+AllTrim(cProdSB1)+" / Produtor "+AllTrim(SA2->A2_COD+SA2->A2_LOJA) )
		EndIf
		
		xMagHelpFis("NAO CONFORMIDADE 10 - Produto nao encontrado",;
		"Produto "+AllTrim(cProdSB1)+" nЦo existe no cadastro!",;
		"Nao sera gerado Nota Fiscal para o produtor "+SA2->A2_COD+SA2->A2_LOJA)
		_aCab    := {}
		_aItens  := {}
		
	EndIf
	
	(cArqTmp)->(dbSkip())
EndDo

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё                                                                         Ё
//Ё Calcula o valor unitario baseado no Valor Total divido pela Quantidade. Ё
//Ё                                                                         Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
//_aItens[1,5,2] := _aItens[1,5,2] - nDescto//Considera o desconto no valor total da nota
//_aItens[1,4,2] := _aItens[1,5,2] / _aItens[1,3,2]

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё                                                                         Ё
//Ё Arredondamento de unitario e total.                                     Ё
//Ё                                                                         Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If Len(_aCab)>0 .And. Len(_aItens)>0
	For i:= 1 to Len(_aItens)
		_aItens[i,5,2]  := NoRound(_aItens[i,5,2],2)		// Define D1_TOTAL com 2 casas
		_aItens[i,4,2]  := (_aItens[i,5,2] / _aItens[i,3,2])// Divide D1_TOTAL por D1_QUANT para obter D1_VUNIT
		//	_aItens[i,4,2]  := Round(_aItens[i,4,2],4)			// Arredonda D1_VUNIT para 4 casas decimais
		// ARREDONDAMENTO COMENTADO POIS ESTAVA CAUSANDO ERRO DE TRANSMISSцO - GUILHERME FRANгA 07/03/2014
	Next i
EndIf

//Altera o modulo para compras para incluir a nota
nModulo := 2
cModulo := "COM"



If _lUsaSA5 //Valida se irА criar amarraГЦo Produto X Fornecedor
	CriaSA5(SA2->A2_COD, SA2->A2_LOJA,cProdSB1)
EndIf

//зддддддддддддддддддддддддддддддддддд©
//Ё SigaAuto de Geracao da Nota.      Ё
//юддддддддддддддддддддддддддддддддддды
If Len(_aCab)>0 .And. Len(_aItens)>0 .and. _aItens[1,5,2]>0 .and. _aItens[1,4,2]>0

    Pergunte("MTA103",.F.)//Chama os parametros da rotina para nao gerar erro	
	MATA103(_aCab,_aItens,3)
	Pergunte(_cPerg,.F.)
	If lMsErroAuto
		lDeuErro := .T.
		If _lNovoLayout
			oObj:SaveLog("ERRO 07 - SIGAAUTO DE NOTA")
		EndIf
		MostraErro()
	Else
		
		dbSelectArea("SF1")
		SF1->(dbSetOrder(1))//F1_FILIAL+F1_DOC+F1_SERIE+F1_FORNECE+F1_LOJA+F1_TIPO
		If SF1->(dbSeek(xFilial("SF1") + _cNroNota + _cSerie + SA2->A2_COD + SA2->A2_LOJA + "N"))
			RecLock("SF1",.F.)
			SF1->F1_PLIQUI	:= nQtde * nPeso
			SF1->F1_PBRUTO	:= nQtde * nPeso
			SF1->F1_VOLUME1	:= nQtde
			SF1->F1_ESPECI1 := "LITROS"

			SF1->F1_L_MIX	:= cCodMix
			SF1->F1_L_SETOR	:= ZL2->ZL2_COD//Nao esta posicionado na ZL2
			//SF1->F1_L_LINHA	:= ZL3->ZL3_COD
			SF1->F1_L_TPNF	:= "P"
			SF1->F1_L_TRIBU := _cTributac
			//			SF1->F1_L_MENSG	:= GetDescNF(SF1->F1_FILIAL,SF1->F1_DOC,SF1->F1_SERIE,SF1->F1_FORNECE,SF1->F1_LOJA,SF1->F1_VALBRUT,SF1->F1_VALICM,cCodMix,_cVersao,ZL2->ZL2_COD,_cTributac)
			SF1->(MsUnlock())
			_cPrefixo := SF1->F1_PREFIXO
			
			// Atualiza informaГУes na tabela ZLF.
			GrvF1Seek(SA2->A2_COD, SA2->A2_LOJA, cCodMix, "1", ZL2->ZL2_COD, _cNroNota, _cSerie )
			
		Else
			xMagHelpFis("Nota nao econtrada","Nao foi possivel encontrar NF "+_cNroNota+" Serie:"+_cSerie,"Consulte Suporte!"+xFilial("SF1")+_cNroNota+_cSerie+SA2->A2_COD+SA2->A2_LOJA+"N")
			lDeuErro := .T.
		EndIf
		
	EndIf
Else
	
	xMagHelpFis("Dados incompletos","Dados incompletos para gerar NF do Produtor "+SA2->A2_COD,"Comunique ao Suporte!")
	lDeuErro := .T.
	
EndIf


//зддддддддддддддддддддддддддд©
//Ё Restaura o modulo em uso. Ё
//юддддддддддддддддддддддддддды
nModulo := _nModAnt
cModulo := _cModAnt



RestArea(aAreaSA2)

dbSelectArea("SE2")
SE2->(dbSetOrder(1))
If SE2->(dbSeek(xFilial("SE2") + _cPrefixo + _cNroNota + cParcSE2 + "NF " + SA2->A2_COD + SA2->A2_LOJA))
	
	/*
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//ЁIncluido, devido ao valor                                         Ё
	//Ёdo incentivo na ZLF ser somente uma simulacao, sendo que o real   Ё
	//Ёvalor do incentivo eh gerado na insercao do documento de entrada  Ё
	//Ёja considerando os redutores desta forma o valor a ser consideradoЁ
	//Ёtem que ser o da SE2.                                             Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	*/
	_nSldPro := Round(SE2->E2_SALDO,2)
	
	RecLock("SE2",.F.)
	
	SE2->E2_L_MIX   := cCodMix
	SE2->E2_L_VERSA := _cVersao
	SE2->E2_HIST    := "NOTA DE PRODUTOR"
	SE2->E2_L_SETOR := ZL2->ZL2_COD
	//SE2->E2_L_LINRO := ZL3->ZL3_COD //Comentado, este campo nao sera mais necessario
	
	
	If SA2->A2_L_TPPAG == "B"
		SE2->E2_L_TPPAG := SA2->A2_L_TPPAG
		SE2->E2_L_BANCO := SA2->A2_BANCO
		SE2->E2_L_AGENC := SA2->A2_AGENCIA
		SE2->E2_L_CONTA := SA2->A2_NUMCON
		SE2->E2_PORTADO := SA2->A2_BANCO
	EndIf
	
	MsUnlock()
	
Else
	
	xMagHelpFix("Titulo",;
	"A NF do Produtor nao gerou o titulo no Financeiro!",;
	"Verifique se a TES gera Duplicata ou se a sИrie da Nota foi informada no parБmetro LT_SERIE ou se a Parcela tem tamanho maior que 1 ou se a condiГЦo de pagamento informada no parБmetro LT_CODPGTO existe!")
	lDeuErro := .T.
	
EndIf

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza o log de processamento   Ё
//юддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	oObj:SaveLog("FIM - Nota por Produtor - " + SA2->A2_COD + "/" + SA2->A2_LOJA)
EndIf

//здддддддддддддддддд©
//Ё Restaura a area. Ё
//юдддддддддддддддддды
CtrlArea(2,_aArea,_aAlias)

//зддддддддддддддддддддддддддддддддддд©
//Ё Apaga arquivo temporario.         Ё
//юддддддддддддддддддддддддддддддддддды
dbSelectArea(cArqTmp)
dbCloseArea(cArqTmp)

Return
/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    Ё ActMix   Ё Autor ЁMicrosiga              Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Funcao para realizar o Acerto dos Eventos de Debito e      Ё╠╠
╠╠Ё          Ё gerados na ZLF pelo Mix.                                   Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ ExpO01 - Objeto da Regua de processamento.                 Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё MGLT009()                                                  Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function ActMix(oObj)

Local cFunc    := "3"
Local cArqTmp  := cGLTalias+cFunc
Local _aArea   := {}
Local _aAlias  := {}
Local nTotReg  := 0
Local nCont    := 1
Local nVlrEvto := 0
Local nJurTit  := 0
Local nVlrBx   := 0
//Local cNroTit  := StrZero(Day(dDataBase),2)+StrZero(Month(dDataBase),2)+SubStr(DtoS(dDataBase),3,2)+SubStr(cCodMIX,4,3)
Local cNroTit  := _cNroNota//Usa o nro da nota do produtor como nro do titulo
Local cParc    := StrZero(1,TamSx3("E2_PARCELA")[1]) //Parcela do titulo do evento
Local cSeekZLF := ""

If Empty(cNroTit)  //Caso nЦo seja gerada NF, cria um cСdigo para os tМtulos (acontece com pessoa jurМdica)
	cNroTit:= Substr(SA2->A2_COD,2,5)+RIGHT(cCodMix,3)+StrZero(Val(_cVersao),1)
EndIf

//здддддддддддддддд©
//Ё  Salva a area. Ё
//юдддддддддддддддды
CtrlArea(1,@_aArea,@_aAlias,{"SA2","ZL2","SB1","ZL8","ZLF","SF1","SD1","SX1"})

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza o log de processamento   Ё
//юддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	oObj:SaveLog("INICIO - Acerto Mix - "+SA2->A2_COD +"/"+SA2->A2_LOJA)
EndIf

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Cria tabela temporaria com os dados dos Eventos(ZL8) para filtrar posteriormente o SE2. Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	MsgRun("Aguarde.... Filtrando dados dos Eventos do Mix...",,{||CursorWait(), MGLT5QRY(cFunc), CursorArrow()})
Else
	MGLT5QRY(cFunc)
EndIf

nTotReg := _nReg

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza contador de registros    Ё
//юддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	oObj:SetRegua2(nTotReg)
EndIf

dbSelectArea(cArqTmp)
dbGoTop()

While (cArqTmp)->(!Eof())
	
	//зддддддддддддддддддддддддддддддддддд©
	//Ё Atualiza a regua de processamento.Ё
	//юддддддддддддддддддддддддддддддддддды
	If oObj <> Nil
		oObj:IncRegua2("Eventos Deb. Mix - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
		nCont++
	EndIf
	
	//зддддддддддддддддддддддддддддддддддд©
	//Ё Posiciona no cadastro de Eventos. Ё
	//юддддддддддддддддддддддддддддддддддды
	dbSelectArea("ZL8")
	ZL8->(dbSetOrder(1))
	ZL8->(dbSeek(xFilial("ZL8")+(cArqTmp)->ZL8_COD))
	
	//здддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Busca o valor do Evento na ZLF e grava no titulo.  Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддды
	nVlrEvto := Round((cArqTmp)->ZLF_TOTAL,2)
	
	If nVlrEvto > 0
		
		If cTipoAct == "Definitivo"
			
			
			//cNroTit := RIGHT(cCodMix,3)+StrZero(Val(_cVersao),2)+RIGHT(ZL3->ZL3_COD,4)
			
			//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//Ё Altera o registro na ZLF de Debito referente ao valor do evento lido.                              Ё
			//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			//cSeekZLF := GrvZLF(ZL8->ZL8_COD,0,_cFilEvent+ZL8->ZL8_PREFIX+cNroTit+cParc+"NDF"+SA2->A2_COD+SA2->A2_LOJA,.F.,.T.,(cArqTmp)->ZLF_SEQ,"ActMix","",nVlrEvto,nVlrEvto,dDataBase,AllTrim(ZL8->ZL8_DESCRI),0,0,SA2->A2_COD,SA2->A2_LOJA,"",cFilAnt,.F.)
			cSeekZLF := GrvZLF(ZL8->ZL8_COD,0,cCodMIX+_cFil_SE2+ZL8->ZL8_PREFIX+cNroTit+cParc+"NDF"+SA2->A2_COD+SA2->A2_LOJA,.F.,.T.,(cArqTmp)->ZLF_SEQ,"ActMix","",nVlrEvto,nVlrEvto,dDataBase,AllTrim(ZL8->ZL8_DESCRI),0,0,SA2->A2_COD,SA2->A2_LOJA,"",cFilAnt,.F.)
			
			//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//Ё Inclui o titulo relacionado ao evento lido.                                                        Ё
			//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			//IncluiSE2(oObj,nVlrEvto,ZL8->ZL8_PREFIX,cNroTit,cParc,"NDF",ZL8->ZL8_DESCRI,cSeekZLF,"ActMix",ZL8->ZL8_NATPRD,ZL8->ZL8_COD)
			U_IncluSE1(ZL8->ZL8_PREFIX,cNroTit,cParc,"NF ",SA2->A2_COD,SA2->A2_LOJA,ZL8->ZL8_NATPRD,ZLE->ZLE_DTFIM,dBaixa,nVlrEvto,0,0,,ZL8->ZL8_DESCRI,NoRound(nTxPar,2),ZL8->ZL8_COD,"MGLT009",_cAno+_cMes,cFilAnt,cCodMIX)
			
			If (_nSldPro - nVlrEvto) >= 0
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Baixa o titulo incluido atraves do evento lido.                                                    Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				//BaixaSE2(oObj,nVlrEvto,ZL8->ZL8_PREFIX,cNroTit,cParc,"NDF",ZL8->ZL8_PREFIX,cSeekZLF,.T.,"ActMix",SA2->A2_COD,SA2->A2_LOJA,cFilAnt)
				//U_BaixaSE1(nVlrEvto,ZL8->ZL8_PREFIX,cNroTit,cParc,"NF ",SA2->A2_COD,SA2->A2_LOJA,_cMotBaixa,_cHist+_cPrefixo+_cNroNota,ZL8->ZL8_COD,"","","",.T.,xFilial("SF1"))
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Baixa no titulo de valor bruto do produtor o valor da baixa do evento.                             Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				//BaixaSE2(oObj,nVlrEvto,_cPrefixo,_cNroNota,Iif(_cMultNota=="S",_cParcNF,_cTamParc),"NF ","",,,"ActMix",SA2->A2_COD,SA2->A2_LOJA,cFilAnt)
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Incrementa a parcela para o proximo titulo de evento, tambem decressce o saldo do produtor.        Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				cParc   := SOMA1(cParc)
				_nSldPro -= nVlrEvto
			ElseIf _nSldPro > 0
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Baixa o titulo incluido atraves do evento lido.                                                    Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				//BaixaSE2(oObj,_nSldPro,ZL8->ZL8_PREFIX,cNroTit,cParc,"NDF",ZL8->ZL8_PREFIX,cSeekZLF,.T.,"ActMix",SA2->A2_COD,SA2->A2_LOJA,cFilAnt)
				//U_BaixaSE1(_nSldPro,ZL8->ZL8_PREFIX,cNroTit,cParc,"NF ",SA2->A2_COD,SA2->A2_LOJA,_cMotBaixa,_cHist+_cPrefixo+_cNroNota,ZL8->ZL8_COD,"","","",.T.)
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Baixa no titulo de valor bruto do produtor o valor da baixa do evento.                             Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				//BaixaSE2(oObj,_nSldPro,_cPrefixo,_cNroNota,Iif(_cMultNota=="S",_cParcNF,_cTamParc),"NF ","",,,"ActMix",SA2->A2_COD,SA2->A2_LOJA,cFilAnt)
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Grava o valor baixado na ZLF (baixa parcial) by Abrahao em 16/02/09                                Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				altZLF(cSeekZLF,_nSldPro)
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Incrementa a parcela para o proximo titulo de evento, tambem decressce o saldo do produtor.        Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				cParc   := SOMA1(cParc)
				_nSldPro -= _nSldPro
			EndIf
		EndIf
	EndIf
	
	//здддддддддддддддддд©
	//Ё Restaura a area. Ё
	//юдддддддддддддддддды
	CtrlArea(2,_aArea,_aAlias)
	
	(cArqTmp)->(dbSkip())
EndDo

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza o log de processamento   Ё
//юддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	oObj:SaveLog("FIM - Acerto Mix - "+SA2->A2_COD +"/"+SA2->A2_LOJA)
EndIf

//зддддддддддддддддддддддддддддддддддд©
//Ё Apaga arquivo temporario.         Ё
//юддддддддддддддддддддддддддддддддддды
dbSelectArea(cArqTmp)
dbCloseArea(cArqTmp)

//здддддддддддддддддд©
//Ё Restaura a area. Ё
//юдддддддддддддддддды
CtrlArea(2,_aArea,_aAlias)

Return


/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    Ё ActEventoЁ Autor ЁMicrosiga              Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Funcao para realizar o Acerto dos Eventos Avulsos.         Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ ExpO01 - Objeto da Regua de processamento.                 Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё MGLT009()                                                  Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function ActEvento(oObj)

Local cFunc    := "4"
Local cArqTmp  := cGLTalias+cFunc
Local _aArea   := {}
Local _aAlias  := {}
Local nTotReg  := 0
Local nCont    := 1
Local nVlrEvto := 0
Local nJurTit  := 0
Local nVlrBx   := 0
//Local cNroTit  := StrZero(Day(dDataBase),2)+StrZero(Month(dDataBase),2)+SubStr(DtoS(dDataBase),3,2)+SubStr(cCodMIX,4,3)
Local cNroTit  := _cNroNota//Usa o nro da nota do produtor como nro do titulo
Local cParc    := StrZero(1,TamSx3("E2_PARCELA")[1]) //Parcela do titulo do evento
Local cSeekZLF := ""
Local cDebCred := ""


If Empty(cNroTit)  //Caso nЦo seja gerada NF, cria um cСdigo para os tМtulos (acontece com pessoa jurМdica)
	cNroTit:= Substr(SA2->A2_COD,2,5)+RIGHT(cCodMix,3)+StrZero(Val(_cVersao),1)
EndIf


//здддддддддддддддд©
//Ё  Salva a area. Ё
//юдддддддддддддддды
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL8","ZLF","SF1","SD1","SX1"})

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza o log de processamento   Ё
//юддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	oObj:SaveLog("INICIO - Acerto Evento - "+SA2->A2_COD +"/"+SA2->A2_LOJA)
EndIf

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Cria tabela temporaria com os dados dos Eventos(ZL8) para filtrar posteriormente o SE2. Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
//If _lNovoLayout
//	MsgRun("Aguarde.... Filtrando dados dos Eventos...",,{||CursorWait(), MGLT5QRY(cFunc), CursorArrow()})
//Else
	MGLT5QRY(cFunc)
//EndIf

nTotReg := _nReg

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza contador de registros    Ё
//юддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	oObj:SetRegua2(nTotReg)
EndIf

dbSelectArea(cArqTmp)
dbGoTop()

While (cArqTmp)->(!Eof())
	
	//зддддддддддддддддддддддддддддддддддд©
	//Ё Atualiza a regua de processamento.Ё
	//юддддддддддддддддддддддддддддддддддды
	If oObj <> Nil
		oObj:IncRegua2("Eventos - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
		nCont++
	EndIf
	
	
	//зддддддддддддддддддддддддддддддддддд©
	//Ё Posiciona no cadastro de Eventos. Ё
	//юддддддддддддддддддддддддддддддддддды
	dbSelectArea("ZL8")
	ZL8->(dbSetOrder(1))
	ZL8->(dbSeek(xFilial("ZL8") + (cArqTmp)->ZL8_COD))
	
	//здддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Verifica se a condicao do Evento eh satisfatoria.  Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддды
	If &(ZL8->ZL8_CONDIC)
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Busca o valor a ser gravado no Evento e no titulo. Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддды
		nVlrEvto := &(ZL8->ZL8_FORMUL)
		nVlrEvto := Round(nVlrEvto,2) //Arredondo pra nao dar erro na baixa do SE2
		
		If nVlrEvto > 0
			
			ZL8->(dbSeek(xFilial("ZL8") + (cArqTmp)->ZL8_COD)) //Posiciona novamente a ZL8, pois a condiГЦo do evento pode ter desposicionado.
			
			If cTipoAct == "Definitivo"
				
				//cNroTit := RIGHT(cCodMix,3)+StrZero(Val(_cVersao),2)+RIGHT(ZL3->ZL3_COD,4)
				
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Inclui um registro na ZLF de Debito referente ao valor do evento lido.                             Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				
				//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//ЁA linha logo abaixo foi comentada,                                           Ё
				//Ёpara que o tipo da tributacao do evento seja passado na sua geracao e retirarЁ
				//Ёo campo ZL3->ZL3_COD referente a linha que nao tem mais                      Ё
				//Ёposicionamento no fechamento do produtor.                                    Ё
				//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				
				//cSeekZLF := GrvZLF(ZL8->ZL8_COD,nVlrEvto,xFilial("SE2")+ZL8->ZL8_PREFIX+cNroTit+cParc+"NDF"+SA2->A2_COD+SA2->A2_LOJA,.T.,,,"ActEvento",ZL3->ZL3_COD,nVlrEvto,nVlrEvto,dDataBase,AllTrim(ZL8->ZL8_DESCRI))
				//cSeekZLF := GrvZLF(ZL8->ZL8_COD,nVlrEvto,_cFilEvent+ZL8->ZL8_PREFIX+cNroTit+cParc+"NDF"+SA2->A2_COD+SA2->A2_LOJA,.T.,.F.,,"ActEvento","",nVlrEvto,nVlrEvto,dDataBase,AllTrim(ZL8->ZL8_DESCRI),0,0,SA2->A2_COD,SA2->A2_LOJA,_cTributac,cFilAnt,.F.)
				_cHistor := AllTrim(ZL8->ZL8_DESCRI)
				
				//Tratamento para informar o volume de litros que estao sendo descontados na penalidade de crioscopia.
				If ZL8->ZL8_COD = "050001"
					_nVlCrio := U_CRIOSCOPIA(3,SA2->A2_COD,SA2->A2_LOJA,ZLE->ZLE_DTFIM)
					_cHistor := _cHistor +" ("+cValTochar(_nVlCrio)+" litros)"
				EndIf
				
				
				//				If ZL8->ZL8_DEBCRE=="C"
				cDebCre:="NF "
				//	_nSldPro := _nSldPro + nVlrEvto
				//				Else
				//					cDebCre:="NDF"
				//				EndIf
				
				cSeekZLF := GrvZLF(ZL8->ZL8_COD,nVlrEvto,cCodMIX+_cFil_SE2+ZL8->ZL8_PREFIX+cNroTit+cParc+cDebCre+SA2->A2_COD+SA2->A2_LOJA,.T.,.F.,,"ActEvento","",nVlrEvto,nVlrEvto,dDataBase,_cHistor,0,0,SA2->A2_COD,SA2->A2_LOJA,_cTributac,cFilAnt,.F.)
				
				//If  (ZL8->ZL8_COD <> _cFreteLit .AND. ZL8->ZL8_COD <> _cFunrural)
				//Caso seja os eventos de frete ou funrural, nao gera NDF pois ja entra como desconto na nota - Guilherme Franca 01/02/14
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Inclui o titulo relacionado ao evento lido.                                                        Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				If ZL8->ZL8_DEBCRE=="C"
					IncluiSE2(oObj,nVlrEvto,ZL8->ZL8_PREFIX,cNroTit,cParc,cDebCre,ZL8->ZL8_DESCRI,cSeekZLF,"ActEvento",ZL8->ZL8_NATPRD,ZL8->ZL8_COD)
				Else
					U_IncluSE1(ZL8->ZL8_PREFIX,cNroTit,cParc,"NF ",SA2->A2_COD,SA2->A2_LOJA,ZL8->ZL8_NATPRD,ZLE->ZLE_DTFIM,dBaixa,nVlrEvto,0,0,,_cHistor,NoRound(nTxPar,2),ZL8->ZL8_COD,"MGLT009",_cAno+_cMes,cFilAnt,cCodMIX)
				EndIf
				
				If ZL8->ZL8_DEBCRE=="D" .And. (_nSldPro - nVlrEvto) >= 0
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Baixa o titulo incluido atraves do evento lido.                                                    Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					
					// Comentado para ganho de desempenho - Guilherme FranГa 20/11/14
					//BaixaSE2(oObj,nVlrEvto,ZL8->ZL8_PREFIX,cNroTit,cParc,"NDF",ZL8->ZL8_PREFIX,cSeekZLF,.T.,"ActEvento",SA2->A2_COD,SA2->A2_LOJA,cFilAnt)
					
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Baixa no titulo de valor bruto do produtor o valor da baixa do evento.                             Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					
					// Comentado para ganho de desempenho - Guilherme FranГa 20/11/14
					//BaixaSE2(oObj,nVlrEvto,_cPrefixo,_cNroNota,Iif(_cMultNota=="S",_cParcNF,_cTamParc),"NF ","",,,"ActEvento",SA2->A2_COD,SA2->A2_LOJA,cFilAnt)
					
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Incrementa a parcela para o proximo titulo de evento, tambem decressce o saldo do produtor.        Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					//cParc   := SOMA1(cParc)
					_nSldPro -= nVlrEvto
				ElseIf ZL8->ZL8_DEBCRE=="D" .And. _nSldPro > 0
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Baixa o titulo incluido atraves do evento lido.                                                    Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					// Comentado para ganho de desempenho - Guilherme FranГa 20/11/14
					//	BaixaSE2(oObj,_nSldPro,ZL8->ZL8_PREFIX,cNroTit,cParc,"NDF",ZL8->ZL8_PREFIX,cSeekZLF,.T.,"ActEvento",SA2->A2_COD,SA2->A2_LOJA,cFilAnt)
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Baixa no titulo de valor bruto do produtor o valor da baixa do evento.                             Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					
					// Comentado para ganho de desempenho - Guilherme FranГa 20/11/14
					//	BaixaSE2(oObj,_nSldPro,_cPrefixo,_cNroNota,Iif(_cMultNota=="S",_cParcNF,_cTamParc),"NF ","",,,"ActEvento",SA2->A2_COD,SA2->A2_LOJA,cFilAnt)
					
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Grava o valor baixado na ZLF (baixa parcial) by Abrahao em 16/02/09                                Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					altZLF(cSeekZLF,_nSldPro)
					
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Incrementa a parcela para o proximo titulo de evento, tambem decressce o saldo do produtor.        Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					//cParc   := SOMA1(cParc)
					_nSldPro -= _nSldPro
				EndIf
				//EndIf
			Else
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Grava um registro na ZLF de Debito referente ao valor do evento lido.                              Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				//GrvZLF(ZL8->ZL8_COD,nVlrEvto,"PREVISAO",.T.,,,"ActEvento",ZL3->ZL3_COD,0,0,CTOD(""),"")
				GrvZLF(ZL8->ZL8_COD,nVlrEvto,"PREVISAO",.T.,.F.,,"ActEvento","",0,0,CTOD(""),"",0,0,SA2->A2_COD,SA2->A2_LOJA,_cTributac,cFilAnt,.F.)
			EndIf
		EndIf
	EndIf
	
	(cArqTmp)->(dbSkip())
EndDo

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza o log de processamento   Ё
//юддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	oObj:SaveLog("FIM - Acerto Evento - "+SA2->A2_COD +"/"+SA2->A2_LOJA)
EndIf

//зддддддддддддддддддддддддддддддддддд©
//Ё Apaga arquivo temporario.         Ё
//юддддддддддддддддддддддддддддддддддды
dbSelectArea(cArqTmp)
dbCloseArea(cArqTmp)

//здддддддддддддддддд©
//Ё Restaura a area. Ё
//юдддддддддддддддддды
CtrlArea(2,_aArea,_aAlias)

Return

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    ЁActFinanc Ё Autor ЁMicrosiga              Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Funcao para realizar Acerto Financeiro(Baixa Ctas a Pagar).Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ ExpO01 - Objeto da Regua de processamento.                 Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё MGLT009()                                                  Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function ActFinanc(oObj)

Local cArqTmp1 := cGLTalias+"5"
Local cArqTmp2 := cGLTalias+"6A"
Local _aArea   := {}
Local _aAlias  := {}
Local nTotReg  := 0
Local nCont    := 1
Local nSldTit  := 0
Local nJurTit  := 0
Local nVlrBx   := 0
Local cSeekZLF := ""

//зддддддддддддддддддддддддддддддддддд©
//ЁEfetua o backup da filial corrente.Ё
//юддддддддддддддддддддддддддддддддддды
Local _cBkpFil := cFilAnt

//здддддддддддддддд©
//Ё  Salva a area. Ё
//юдддддддддддддддды
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL2","ZL8","ZLF","SF1","SD1","SX1"})

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza o log de processamento   Ё
//юддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	oObj:SaveLog("INICIO - Acerto Financeiro - "+SA2->A2_COD +"/"+SA2->A2_LOJA)
EndIf

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Cria tabela temporaria com os dados dos Eventos(ZL8) para filtrar posteriormente o SE2. Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	MsgRun("Aguarde.... Filtrando dados dos Eventos...",,{||CursorWait(), MGLT5QRY("5"), CursorArrow()})
Else
	MGLT5QRY("5")
EndIf

dbSelectArea(cArqTmp1)
dbGoTop()

While (cArqTmp1)->(!Eof())
	
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Cria tabela temporaria com os dados do SE2 filtrados a partir do prefixo informado no Evento(ZL8). Ё
	//Ё Este filtro segue a ordem de prioridade informada no ZL8_PRIORI.                                   Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	If _lNovoLayout
		MsgRun("Aguarde.... Filtrando dados do Contas a Pagar...",,{||CursorWait(), MGLT5QRY( "6A",(cArqTmp1)->ZL8_PREFIX,(cArqTmp1)->ZL8_COD ) , CursorArrow()})
	Else
		MGLT5QRY( "6A",(cArqTmp1)->ZL8_PREFIX,(cArqTmp1)->ZL8_COD )
	EndIf
	
	//зддддддддддддддддддддддддддддддддддд©
	//Ё Atualiza a regua de processamento.Ё
	//юддддддддддддддддддддддддддддддддддды
	If oObj <> Nil
		nTotReg := _nReg
		nCont   := 1
		oObj:SetRegua2(nTotReg)
	EndIf
	
	dbSelectArea(cArqTmp2)
	dbGoTop()
	
	While (cArqTmp2)->(!Eof())
		
		//зддддддддддддддддддддддддддддддддддд©
		//Ё Atualiza a regua de processamento.Ё
		//юддддддддддддддддддддддддддддддддддды
		If oObj <> Nil
			oObj:IncRegua2("Financeiro - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
			nCont++
		EndIf
		
		//зддддддддддддддддддддддддддддддддддд©
		//Ё Posiciona no cadastro de Eventos. Ё
		//юддддддддддддддддддддддддддддддддддды
		dbSelectArea("ZL8")
		ZL8->(dbSetOrder(1))
		ZL8->(dbSeek(xFilial("ZL8")+(cArqTmp1)->ZL8_COD))
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁAdicionado.                                                         Ё
		//ЁPosiciona na filial correta para calculo do valor da baixa do tituloЁ
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		//		cFilAnt:= (cArqTmp2)->E2_FILIAL
		
		SM0->(dbSetOrder(1))   // forca o indice na ordem certa
		SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt))
		
		dbSelectArea("SE2")
		SE2->(dbSetOrder(1))//E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA
		If SE2->(dbSeek(xFilial("SE2") + (cArqTmp2)->E2_PREFIXO + (cArqTmp2)->E2_NUM +(cArqTmp2)->E2_PARCELA + (cArqTmp2)->E2_TIPO + (cArqTmp2)->E2_FORNECE + (cArqTmp2)->E2_LOJA))
			
			//nJurTit := fa080Juros(SE2->E2_MOEDA, SE2->E2_SALDO ,"SE2")
			nJurTit := fa080Juros()
			nJurTit := Round(nJurTit,2)
			//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//ЁComentador por nao haver                                       Ё
			//Ёa necessidade dos comandos abaixo, o padrao do sistema nao usa.Ё
			//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			/*
			If nJurTit > 0 .And. nJurTit < 0.01
			nJurTit := nJurTit
			Else
			nJurTit := NOROUND(nJurTit,2)
			EndIf
			*/
			
			nSldTit := (SE2->E2_SALDO + nJurTit + SE2->E2_SDACRES) - SE2->E2_SDDECRE
			
			//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//Ё Valor a ser baixado no titulo com juros, passado para o sigaauto.                    Ё
			//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			nVlrBx  := Round(nSldTit,2)
			
			//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//Ё Se o saldo do produtor For maior que zero, baixa os titulos no SE2.Ё
			//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			If _nSldPro > 0
				//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Se o saldo do produtor menos o saldo do titulo maior ou igual a zero, baixa o SE2.Ё
				//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				If ( _nSldPro - nSldTit ) >= 0
					//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Grava registro na ZLF, com o valor do saldo do titulo.  Ё
					//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					If cTipoAct == "Definitivo"
						//cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,_cFilEvent+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA,.T.,.F.,,"ActFinanc","",SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES,SA2->A2_COD,SA2->A2_LOJA,_cTributac,_cBkpFil,.T.)
						cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,cCodMIX+_cFil_SE2+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA,.T.,.F.,,"ActFinanc","",SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES,SA2->A2_COD,SA2->A2_LOJA,_cTributac,_cBkpFil,.T.)
					Else
						cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,"PREVISAO",.T.,.F.,,"ActFinanc","",0,0,CTOD(""),"",0,0,SA2->A2_COD,SA2->A2_LOJA,_cTributac,_cBkpFil,.F.)
					EndIf
					
					//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Descresce o saldo do produtor.                          Ё
					//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					_nSldPro -= nSldTit
					//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Se o acerto eh definitivo baixa o titulo no SE2.        Ё
					//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					If cTipoAct == "Definitivo"
						
						
						//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Baixa os titulos de convenio, emprestimo, adiantamentos e finaciamentos.Ё
						//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						BaixaSE2(oObj,nVlrBx,(cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO,(cArqTmp1)->ZL8_PREFIX,cSeekZLF,.T.,"ActFinanc",SA2->A2_COD,SA2->A2_LOJA,(cArqTmp2)->E2_FILIAL,nJurTit)
						//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Baixa no titulo de valor bruto do produtor o valor das baixas dos emprestimos, adiantamentos, etc. Ё
						//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						BaixaSE2(oObj,nVlrBx,_cPrefixo,_cNroNota,Iif(_cMultNota=="S",_cParcNF,_cTamParc),"NF ","",,,"ActFinanc",SA2->A2_COD,SA2->A2_LOJA,_cFilEvent,nJurTit)
					EndIf
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Se o saldo do produtor menos o saldo do titulo eh menor que zero, faz baixa parcial. Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				Else
					
					//xMagHelpFis("Saldo Devedor","O Produtor "+SA2->A2_COD+"-"+SA2->A2_LOJA+" nao tem saldo para baixar o convenio. Saldo:"+TransForm(_nSldPro,"@E 999,999,999.99")+" Convenio:"+TransForm(nSldTit,"@E 999,999,999.99"))//,"O Convenio sera suspenso e o titulo excluido!")
					//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Grava registro na ZLF, com o valor do saldo do titulo mesmo fazendo baixa parcial.  Ё
					//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					If cTipoAct == "Definitivo"
						//cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,xFilial("SE2")+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA,.T.,,,"ActFinanc",,SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,"",_cBkpFil)
						
						//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//ЁAlterado para que fosse gravado                                             Ё
						//Ёna ZLF somente o valor que realmente foi baixado do convennio ou emprestimo.Ё
						//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						//cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,_nSldPro,_cFilEvent+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA,.T.,.F.,,"ActFinanc","",SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES,SA2->A2_COD,SA2->A2_LOJA,_cTributac,_cBkpFil,.T.)
						cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,_nSldPro,cCodMIX+_cFil_SE2+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA,.T.,.F.,,"ActFinanc","",SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES,SA2->A2_COD,SA2->A2_LOJA,_cTributac,_cBkpFil,.T.)
					Else
						cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,"PREVISAO",.T.,.F.,,"ActFinanc","",0,0,CTOD(""),"",0,0,SA2->A2_COD,SA2->A2_LOJA,_cTributac,_cBkpFil,.F.)
					EndIf
					//зддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Valor a ser baixado parcialmente no titulo. Ё
					//юддддддддддддддддддддддддддддддддддддддддддддды
					nVlrBx := _nSldPro
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Se o acerto eh definitivo e a situacao do evento eh de baixa parcial do titulo qdo na ha saldo suficiente. Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					If cTipoAct == "Definitivo" //.And. (cArqTmp1)->ZL8_SITUAC == 'B'
						// MARCO-TUB027
						// Baixa os titulos de convenio, emprestimo, adiantamentos e financiamentos.
						BaixaSE2(oObj,nVlrBx,(cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO,(cArqTmp1)->ZL8_PREFIX,cSeekZLF,.T.,"ActFinanc",SA2->A2_COD,SA2->A2_LOJA,(cArqTmp2)->E2_FILIAL,nJurTit)
						//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Baixa NO titulo gerado pela nota do produtor, o valor das baixas dos emprestimos, adiantamentos, etc. Ё
						//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						BaixaSE2(oObj,nVlrBx,_cPrefixo,_cNroNota,Iif(_cMultNota=="S",_cParcNF,_cTamParc),"NF ","",,,"ActFinanc",SA2->A2_COD,SA2->A2_LOJA,_cFilEvent,nJurTit)
						//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Grava o valor baixado na ZLF (baixa parcial) by Abrahao em 16/02/09                                Ё
						//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						altZLF(cSeekZLF,nVlrBx)
						//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Descresce o saldo do produtor.                          Ё
						//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						_nSldPro -= _nSldPro
						//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Se o acerto eh definitivo e a situacao do evento eh de Delecao do titulo qdo na ha saldo suficiente para baixalo. Ё
						//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					ElseIf cTipoAct == "Definitivo" //.And. (cArqTmp1)->ZL8_SITUAC == 'D'
						//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Deleta o titulo de convenio quando nao ha saldo suficiente para paga-lo. Ё
						//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						//	xMagHelpFis("Saldo Devedor","O Produtor "+SA2->A2_COD+"-"+SA2->A2_LOJA+" nao tem saldo para baixar o convenio. Saldo:"+TransForm(_nSldPro,"@E 999,999,999.99")+" Convenio:"+TransForm(nSldTit,"@E 999,999,999.99"),"O Convenio sera suspenso e o titulo excluido!")
						/*
						xMagHelpFis("Saldo Devedor","O Produtor "+SA2->A2_COD+"-"+SA2->A2_LOJA+" nao tem saldo para baixar o convenio. Saldo:"+TransForm(_nSldPro,"@E 999,999,999.99")+" Convenio:"+TransForm(nSldTit,"@E 999,999,999.99"),"O Convenio pode ser suspenso e o titulo excluido. Confirme esta tela para decidir.")
						If MsgNoYes("Deseja excluir o convЙnio ?")
						DeletaSE2(oObj,(cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO,"ActFinanc")
						DelZLF(cSeekZLF)
						EndIf
						*/
					EndIf
				EndIf
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Se o saldo do produtor esta zerado, NAO baixa os titulos no SE2.   Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			Else
				//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Mesmo nao baixando o SE2 grava na ZLF o debito que o produtor possui. Ё
				//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				If cTipoAct == "Definitivo"
					
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//ЁComentado pois caso nao                                     Ё
					//Ёhaja nenhuma deducao do evento do tipo financeiro nao existeЁ
					//Ёa necessidade de se efetuar o seu lancamento.               Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					//cSeekZLF:=GrvZLF((cArqTmp1)->ZL8_COD,0,_cFilEvent+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA,.T.,.F.,,"ActFinanc","",SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES,SA2->A2_COD,SA2->A2_LOJA,"",_cBkpFil)
					//Habilitado para gravar na ZLF os valores mesmo quando nao foi baixado/pago
					cSeekZLF:=GrvZLF((cArqTmp1)->ZL8_COD,0,cCodMIX+_cFil_SE2+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA,.T.,.F.,,"ActFinanc","",SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES,SA2->A2_COD,SA2->A2_LOJA,_cTributac,_cBkpFil,.T.)
				Else
					cSeekZLF:=GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,"PREVISAO",.T.,.F.,,"ActFinanc","",0,0,CTOD(""),"",0,0,SA2->A2_COD,SA2->A2_LOJA,_cTributac,_cBkpFil,.F.)
				EndIf
				//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Se o acerto eh definitivo e a situacao do evento eh de Delecao do titulo qdo na ha saldo suficiente para baixalo. Ё
				//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				If cTipoAct == "Definitivo" //.And. (cArqTmp1)->ZL8_SITUAC == 'D'
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Deleta o titulo de convenio quando nao ha saldo suficiente para paga-lo. Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					//	xMagHelpFis("Saldo Devedor","O Produtor "+SA2->A2_COD+"-"+SA2->A2_LOJA+" nao tem saldo para baixar o convenio. Saldo:"+TransForm(_nSldPro,"@E 999,999,999.99")+" Convenio:"+TransForm(nSldTit,"@E 999,999,999.99"),"O Convenio sera suspenso e o titulo excluido!")
					/*
					xMagHelpFis("Saldo Devedor","O Produtor "+SA2->A2_COD+"-"+SA2->A2_LOJA+" nao tem saldo para baixar o convenio. Saldo:"+TransForm(_nSldPro,"@E 999,999,999.99")+" Convenio:"+TransForm(nSldTit,"@E 999,999,999.99"),"O Convenio pode ser suspenso e o titulo excluido. Confirme esta tela para decidir.")
					If MsgNoYes("Deseja excluir o convЙnio ?")
					DeletaSE2(oObj,(cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO,"ActFinanc")
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Deleta o registro na ZLF - by Abrahao em 16/02/09                        Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					delZLF(cSeekZLF)
					EndIf
					*/
				EndIf
			EndIf
		EndIf
		(cArqTmp2)->(dbSkip())
	EndDo
	
	//зддддддддддддддддддддддддддддддддддд©
	//Ё Apaga arquivo temporario.         Ё
	//юддддддддддддддддддддддддддддддддддды
	dbSelectArea(cArqTmp2)
	dbCloseArea(cArqTmp2)
	
	(cArqTmp1)->(dbSkip())
EndDo

//зддддддддддддддддддддддддддддддддддддддддддддд©
//ЁRestaura a filial corrente antes do processo.Ё
//юддддддддддддддддддддддддддддддддддддддддддддды
cFilAnt:= _cBkpFil

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt))

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza o log de processamento   Ё
//юддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	oObj:SaveLog("FIM - Acerto Financeiro - "+SA2->A2_COD +"/"+SA2->A2_LOJA)
EndIf
//зддддддддддддддддддддддддддддддддддд©
//Ё Apaga arquivo temporario.         Ё
//юддддддддддддддддддддддддддддддддддды
dbSelectArea(cArqTmp1)
dbCloseArea(cArqTmp1)

//здддддддддддддддддд©
//Ё Restaura a area. Ё
//юдддддддддддддддддды
CtrlArea(2,_aArea,_aAlias)

Return

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    ЁActCreditos Ё Autor ЁMicrosiga              Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Funcao para realizar Acerto Financeiro(Baixa Ctas a Pagar).Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ ExpO01 - Objeto da Regua de processamento.                 Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё MGLT033()                                                  Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function ActCreditos(oObj)

Local cArqTmp1 := cGLTalias+"5"
Local cArqTmp2 := cGLTalias+"6A"
Local cArqTmp3  := cGLTalias+"B"
Local _aArea   := {}
Local _aAlias  := {}
Local nTotReg  := 0
Local nCont    := 1
Local nSldTit  := 0
Local nJurTit  := 0
Local nVlrBx   := 0
Local cSeekZLF := ""
Local _nSldCred := 0
//зддддддддддддддддддддддддддддддддддд©
//ЁEfetua o backup da filial corrente.Ё
//юддддддддддддддддддддддддддддддддддды
Local _cBkpFil := cFilAnt

//здддддддддддддддд©
//Ё  Salva a area. Ё
//юдддддддддддддддды
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL2","ZL8","ZLF","SF1","SD1","SX1"})

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza o log de processamento   Ё
//юддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	oObj:SaveLog("INICIO - Acerto Creditos - "+SA2->A2_COD +"/"+SA2->A2_LOJA)
EndIf

If _lNovoLayout
	MsgRun("Aguarde.... Filtrando creditos...",,{||CursorWait(), MGLT5QRY("B"), CursorArrow()})
Else
	MGLT5QRY("B")
EndIf

dbSelectArea(cArqTmp3)
dbGoTop()


While (cArqTmp3)->(!Eof())
	
	//Busca saldo do crИdito a baixar.
	_nSldCred := (cArqTmp3)->E2_SALDO + (cArqTmp3)->E2_SDACRES - (cArqTmp3)->E2_SDDECRE
	
	//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Cria tabela temporaria com os dados dos Eventos(ZL8) para filtrar posteriormente o SE2. Ё
	//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	If _lNovoLayout
		MsgRun("Aguarde.... Filtrando dados dos Eventos...",,{||CursorWait(), MGLT5QRY("5"), CursorArrow()})
	Else
		MGLT5QRY("5")
	EndIf
	
	dbSelectArea(cArqTmp1)
	dbGoTop()
	
	While (cArqTmp1)->(!Eof()) .and. _nSldCred > 0
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Cria tabela temporaria com os dados do SE2 filtrados a partir do prefixo informado no Evento(ZL8). Ё
		//Ё Este filtro segue a ordem de prioridade informada no ZL8_PRIORI.                                   Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		If _lNovoLayout
			MsgRun("Aguarde.... Filtrando dados do Contas a Pagar...",,{||CursorWait(), MGLT5QRY( "6A",(cArqTmp1)->ZL8_PREFIX,(cArqTmp1)->ZL8_COD ) , CursorArrow()})
		Else
			MGLT5QRY( "6A",(cArqTmp1)->ZL8_PREFIX,(cArqTmp1)->ZL8_COD )
		EndIf
		
		//зддддддддддддддддддддддддддддддддддд©
		//Ё Atualiza a regua de processamento.Ё
		//юддддддддддддддддддддддддддддддддддды
		If oObj <> Nil
			nTotReg := _nReg
			nCont   := 1
			oObj:SetRegua2(nTotReg)
		EndIf
		
		dbSelectArea(cArqTmp2)
		dbGoTop()
		
		While (cArqTmp2)->(!Eof())
			
			//зддддддддддддддддддддддддддддддддддд©
			//Ё Atualiza a regua de processamento.Ё
			//юддддддддддддддддддддддддддддддддддды
			If oObj <> Nil
				oObj:IncRegua2("Financeiro - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
				nCont++
			EndIf
			
			//зддддддддддддддддддддддддддддддддддд©
			//Ё Posiciona no cadastro de Eventos. Ё
			//юддддддддддддддддддддддддддддддддддды
			dbSelectArea("ZL8")
			ZL8->(dbSetOrder(1))
			ZL8->(dbSeek(xFilial("ZL8")+(cArqTmp1)->ZL8_COD))
			
			//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//ЁAdicionado.                                                         Ё
			//ЁPosiciona na filial correta para calculo do valor da baixa do tituloЁ
			//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			//		cFilAnt:= (cArqTmp2)->E2_FILIAL
			
			SM0->(dbSetOrder(1))   // forca o indice na ordem certa
			SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt))
			
			dbSelectArea("SE2")
			SE2->(dbSetOrder(1))//E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA
			If SE2->(dbSeek(xFilial("SE2") + (cArqTmp2)->E2_PREFIXO + (cArqTmp2)->E2_NUM +(cArqTmp2)->E2_PARCELA + (cArqTmp2)->E2_TIPO + (cArqTmp2)->E2_FORNECE + (cArqTmp2)->E2_LOJA))
				
				//nJurTit := fa080Juros(SE2->E2_MOEDA, SE2->E2_SALDO ,"SE2")
				nJurTit := fa080Juros()
				nJurTit := Round(nJurTit,2)
				//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//ЁComentador por nao haver                                       Ё
				//Ёa necessidade dos comandos abaixo, o padrao do sistema nao usa.Ё
				//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				/*
				If nJurTit > 0 .And. nJurTit < 0.01
				nJurTit := nJurTit
				Else
				nJurTit := NOROUND(nJurTit,2)
				EndIf
				*/
				
				nSldTit := (SE2->E2_SALDO + nJurTit + SE2->E2_SDACRES) - SE2->E2_SDDECRE
				
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Valor a ser baixado no titulo com juros, passado para o sigaauto.                    Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				nVlrBx  := Round(nSldTit,2)
				
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Se o saldo do produtor For maior que zero, baixa os titulos no SE2.Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				If _nSldCred > 0
					//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Se o saldo do produtor menos o saldo do titulo maior ou igual a zero, baixa o SE2.Ё
					//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					If ( _nSldCred - nSldTit ) >= 0
						//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Grava registro na ZLF, com o valor do saldo do titulo.  Ё
						//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						If cTipoAct == "Definitivo"
							If (cArqTmp1)->ZL8_COD <> '120002' //Nao grava o evento retenГЦo pois ele jА existe na ZLF
								cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,cCodMIX+_cFil_SE2+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA,.T.,.F.,,"ActCreditos","",SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES,SA2->A2_COD,SA2->A2_LOJA,_cTributac,_cBkpFil,.T.)
							EndIf
						Else
							cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,"PREVISAO",.T.,.F.,,"ActCreditos","",0,0,CTOD(""),"",0,0,SA2->A2_COD,SA2->A2_LOJA,_cTributac,_cBkpFil,.F.)
						EndIf
						
						//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Descresce o saldo do produtor.                          Ё
						//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						_nSldCred -= nSldTit
						//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Se o acerto eh definitivo baixa o titulo no SE2.        Ё
						//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						If cTipoAct == "Definitivo"
							
							
							//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
							//Ё Baixa os titulos de convenio, emprestimo, adiantamentos e finaciamentos.Ё
							//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
							BaixaSE2(oObj,nVlrBx,(cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO,(cArqTmp1)->ZL8_PREFIX,cSeekZLF,.T.,"ActCreditos",SA2->A2_COD,(cArqTmp2)->E2_LOJA,(cArqTmp2)->E2_FILIAL,nJurTit)
							//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
							//Ё Baixa no titulo de valor bruto do produtor o valor das baixas dos emprestimos, adiantamentos, etc. Ё
							//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
							BaixaSE2(oObj,nVlrBx,(cArqTmp3)->E2_PREFIXO,(cArqTmp3)->E2_NUM,(cArqTmp3)->E2_PARCELA,(cArqTmp3)->E2_TIPO,"",,,"ActCreditos",SA2->A2_COD,(cArqTmp3)->E2_LOJA,(cArqTmp3)->E2_FILIAL,0)
						EndIf
						//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Se o saldo do produtor menos o saldo do titulo eh menor que zero, faz baixa parcial. Ё
						//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					Else
						
						//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Grava registro na ZLF, com o valor do saldo do titulo mesmo fazendo baixa parcial.  Ё
						//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						If cTipoAct == "Definitivo"
							
							
							//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
							//ЁAlterado para que fosse gravado                                             Ё
							//Ёna ZLF somente o valor que realmente foi baixado do convennio ou emprestimo.Ё
							//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
							
							cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,_nSldCred,cCodMIX+_cFil_SE2+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+(cArqTmp2)->E2_LOJA,.T.,.F.,,"ActCreditos","",SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES,SA2->A2_COD,SA2->A2_LOJA,_cTributac,_cBkpFil,.T.)
						Else
							cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,"PREVISAO",.T.,.F.,,"ActCreditos","",0,0,CTOD(""),"",0,0,SA2->A2_COD,SA2->A2_LOJA,_cTributac,_cBkpFil,.F.)
						EndIf
						//зддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Valor a ser baixado parcialmente no titulo. Ё
						//юддддддддддддддддддддддддддддддддддддддддддддды
						nVlrBx := _nSldCred
						//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Se o acerto eh definitivo e a situacao do evento eh de baixa parcial do titulo qdo na ha saldo suficiente. Ё
						//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						If cTipoAct == "Definitivo" //.And. (cArqTmp1)->ZL8_SITUAC == 'B'
							// MARCO-TUB027
							// Baixa os titulos de convenio, emprestimo, adiantamentos e financiamentos.
							BaixaSE2(oObj,nVlrBx,(cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO,(cArqTmp1)->ZL8_PREFIX,cSeekZLF,.T.,"ActCreditos",SA2->A2_COD,(cArqTmp2)->E2_LOJA,(cArqTmp2)->E2_FILIAL,nJurTit)
							//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
							//Ё Baixa NO titulo gerado pela nota do produtor, o valor das baixas dos emprestimos, adiantamentos, etc. Ё
							//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
							BaixaSE2(oObj,nVlrBx,(cArqTmp3)->E2_PREFIXO,(cArqTmp3)->E2_NUM,(cArqTmp3)->E2_PARCELA,(cArqTmp3)->E2_TIPO,"",,,"ActCreditos",SA2->A2_COD,(cArqTmp3)->E2_LOJA,(cArqTmp3)->E2_FILIAL,0)
							//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
							//Ё Grava o valor baixado na ZLF (baixa parcial) by Abrahao em 16/02/09                                Ё
							//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
							altZLF(cSeekZLF,nVlrBx)
							//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
							//Ё Descresce o saldo do produtor.                          Ё
							//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
							_nSldCred -= _nSldCred
							//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
							//Ё Se o acerto eh definitivo e a situacao do evento eh de Delecao do titulo qdo na ha saldo suficiente para baixalo. Ё
							//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						ElseIf cTipoAct == "Definitivo" //.And. (cArqTmp1)->ZL8_SITUAC == 'D'
							//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
							//Ё Deleta o titulo de convenio quando nao ha saldo suficiente para paga-lo. Ё
							//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						EndIf
					EndIf
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Se o saldo do produtor esta zerado, NAO baixa os titulos no SE2.   Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				Else
					//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Mesmo nao baixando o SE2 grava na ZLF o debito que o produtor possui. Ё
					//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					If cTipoAct == "Definitivo"
						
						//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//ЁComentado pois caso nao                                     Ё
						//Ёhaja nenhuma deducao do evento do tipo financeiro nao existeЁ
						//Ёa necessidade de se efetuar o seu lancamento.               Ё
						//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						//cSeekZLF:=GrvZLF((cArqTmp1)->ZL8_COD,0,_cFilEvent+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA,.T.,.F.,,"ActFinanc","",SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES,SA2->A2_COD,SA2->A2_LOJA,"",_cBkpFil)
						//Habilitado para gravar na ZLF os valores mesmo quando nao foi baixado/pago
						cSeekZLF:=GrvZLF((cArqTmp1)->ZL8_COD,0,cCodMIX+_cFil_SE2+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+SA2->A2_LOJA,.T.,.F.,,"ActCreditos","",SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES,SA2->A2_COD,SA2->A2_LOJA,_cTributac,_cBkpFil,.T.)
					Else
						cSeekZLF:=GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,"PREVISAO",.T.,.F.,,"ActCreditos","",0,0,CTOD(""),"",0,0,SA2->A2_COD,SA2->A2_LOJA,_cTributac,_cBkpFil,.F.)
					EndIf
					//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Se o acerto eh definitivo e a situacao do evento eh de Delecao do titulo qdo na ha saldo suficiente para baixalo. Ё
					//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					If cTipoAct == "Definitivo" //.And. (cArqTmp1)->ZL8_SITUAC == 'D'
						//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Deleta o titulo de convenio quando nao ha saldo suficiente para paga-lo. Ё
						//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						
					EndIf
				EndIf
			EndIf
			(cArqTmp2)->(dbSkip())
		EndDo
		
		//зддддддддддддддддддддддддддддддддддд©
		//Ё Apaga arquivo temporario.         Ё
		//юддддддддддддддддддддддддддддддддддды
		dbSelectArea(cArqTmp2)
		dbCloseArea(cArqTmp2)
		
		(cArqTmp1)->(dbSkip())
	EndDo
	
	dbSelectArea(cArqTmp1)
	dbCloseArea(cArqTmp1)
	
	(cArqTmp3)->(dbSkip())
	
EndDo
//зддддддддддддддддддддддддддддддддддддддддддддд©
//ЁRestaura a filial corrente antes do processo.Ё
//юддддддддддддддддддддддддддддддддддддддддддддды
cFilAnt:= _cBkpFil

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt))

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza o log de processamento   Ё
//юддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	oObj:SaveLog("FIM - Acerto Creditos - "+SA2->A2_COD +"/"+SA2->A2_LOJA)
EndIf
//зддддддддддддддддддддддддддддддддддд©
//Ё Apaga arquivo temporario.         Ё
//юддддддддддддддддддддддддддддддддддды
dbSelectArea(cArqTmp3)
dbCloseArea(cArqTmp3)

//здддддддддддддддддд©
//Ё Restaura a area. Ё
//юдддддддддддддддддды
CtrlArea(2,_aArea,_aAlias)

Return

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Funcao    Ё CompesTit╨ Autor ЁAriclenes M. Costa  ╨ Data Ё  14/01/14   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Descricao Ё Funcao que faz compensassЦo de titulos NDF e NCC no acerto ╨╠╠
╠╠╨          Ё do Leite                                                   ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Programa principal                                         ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/

Static Function CompesTit(_cProdutor,_cLoja,_cTributac,_cBkpFil, _dDTIni, _dDtfim)

Private _aZFL		:=  {}
Private _lNDF		:=	.F.
Private _lNCC		:= 	.F.
Private aAutoCab	:=	{}

If Select ("TMPSE1") <> 0
	TMPSE1->(dbCloseArea())
EndIf
//Busca todos os titulos NCC em aberto para o produtor e que tenha saldo
cQuery	:=	"SELECT E1_CLIENTE,"
cQuery	+=	"E1_LOJA,"
cQuery	+=	"E1_FILIAL,"
cQuery	+=	"E1_PREFIXO,"
cQuery	+=	"E1_NUM,"
cQuery	+=	"E1_PARCELA,"
cQuery	+=	"E1_VALOR,"
cQuery	+=	"E1_SALDO,"
cQuery	+=	"E1_EMISSAO,"
cQuery	+=	"E1_HIST,"
cQuery	+=	"E1_JUROS,"
cQuery	+=	"E1_ACRESC "
cQuery	+=	"FROM "+RetSqlName("SE1")
cQuery	+=	"WHERE D_E_L_E_T_ = ' '"
cQuery	+=	"AND E1_TIPO = 'NCC'"
cQuery	+=	"AND E1_CLIENTE = '"+_cProdutor+"'"
//cQuery	+=	"AND E1_LOJA = '"+_cLoja+"'"
cQuery	+=	"AND E1_SALDO > 0"
cQuery	+=	"AND E1_VENCREA <= '"+DTOS(_dDtfim)+"'"

TcQuery ChangeQuery(cQuery) New Alias "TMPSE1"
DbSelectArea("TMPSE1")
TMPSE1->(DbGoTop())

While TMPSE1->(!Eof())
	
	aAutoCab := { {"AUTDVENINI450", cTod('01/01/2013') , nil},;
	{"AUTDVENFIM450", cTod('31/12/2049') , nil},;
	{"AUTNLIM450" , 1000000 , nil},;
	{"AUTCCLI450" , TMPSE1->E1_CLIENTE , nil},;
	{"AUTCLJCLI" , TMPSE1->E1_LOJA , nil},;
	{"AUTCFOR450" , TMPSE1->E1_CLIENTE , nil},;
	{"AUTCLJFOR" , TMPSE1->E1_LOJA , nil},;
	{"AUTCMOEDA450" , "01" , nil},;
	{"AUTNDEBCRED" , 2 , nil},;
	{"AUTLTITFUTURO", .F. , nil},;
	{"AUTARECCHAVE" , {} , nil},;
	{"AUTAPAGCHAVE" , {} , nil}}
	Private lMsHelpAuto := .T.
	Private lMsErroAuto := .F.
	
	//Adiciona todos os titulos NCC do produtor
	AAdd( aAutoCab[11,2], { xFilial( "SE1" ) + PadR( TMPSE1->E1_PREFIXO ,TamSX3( "E1_PREFIXO" )[ 1 ] ) + ;
	PadR( TMPSE1->E1_NUM , TamSX3( "E1_NUM" )[ 1 ] ) + ;
	PadR( TMPSE1->E1_PARCELA , TamSX3( "E1_PARCELA" )[ 1 ] ) + ;
	PadR( "NCC" , TamSX3( "E1_TIPO" )[ 1 ] ) } )
	
	/*	cEvento,nValor,cSeek,lGrvZLF,lAltZLF,_cSeq,cFunName,cLinha,;
	nSE2VLR,nSE2SLD,dSE2VEN,cSE2HIS,nSE2JUR,nSE2ACRES,;
	_cCodForn,_cLojForn,_cTpTrib,_cFil,_lFecham
	*/
	
	//Adiciona todos titulos NCC ao array para posterior insercao na tabela ZLF
	AADD(_aZFL,{"100065",TMPSE1->E1_VALOR,TMPSE1->E1_FILIAL+_cPrefixo+TMPSE1->E1_NUM+TMPSE1->E1_PARCELA+"NCC"+TMPSE1->E1_CLIENTE+TMPSE1->E1_LOJA,.T.,.F.,,"CompesTit","",TMPSE1->E1_VALOR,TMPSE1->E1_SALDO,TMPSE1->E1_EMISSAO,TMPSE1->E1_HIST,TMPSE1->E1_JUROS, TMPSE1->E1_ACRESC,TMPSE1->E1_CLIENTE,TMPSE1->E1_LOJA,_cTributac,_cBkpFil,.F.})
	//Criar parametro codigo evento
	_lNCC	:=	.T.
	TMPSE1->(DbSkip())
Enddo

// Dados do titulo a pagar
cQry3 := "SELECT SE2.E2_FILIAL, "
cQry3 += "SE2.E2_PREFIXO, "
cQry3 += "SE2.E2_NUM, "
cQry3 += "SE2.E2_PARCELA, "
cQry3 += "SE2.E2_FORNECE, "
cQry3 += "SE2.E2_LOJA, "
cQry3 += "SE2.E2_SALDO, "
cQry3 += "SE2.E2_BAIXA, "
cQry3 += "SE2.E2_VALOR, "
cQry3 += "SE2.E2_EMISSAO, "
cQry3 += "SE2.E2_HIST, "
cQry3 += "SE2.E2_JUROS, "
cQry3 += "SE2.E2_ACRESC, "
cQry3 += "SE2.E2_L_EVENT "
cQry3 += "FROM "+RetSQLName("SE2")+" SE2 "
cQry3 += "WHERE SE2.E2_TIPO = 'NDF' "
cQry3 += "AND D_E_L_E_T_ = ' ' "
cQry3 += "AND SE2.E2_FORNECE  = '"+_cProdutor+"' "
//	cQry3 += "AND SE2.E2_LOJA  = '"+_cLoja+"' "
cQry3 += "AND SE2.E2_L_EVENT <> ' ' "
cQry3 += "AND E2_VENCTO <= '"+cDtSelect+"'"
cQry3 += "AND E2_EMISSAO <= '"+DTOS(_dDtfim)+"'"
cQry3 += "AND E2_L_EVENT IN("
cQry3 += "SELECT ZL8_COD FROM "+RetSQLName("ZL8")+" ZL8 "
cQry3 += "WHERE D_E_L_E_T_ = ' ' "
cQry3 += "AND ZL8_MSBLQL <> '1' "
cQry3 += "AND ZL8_TPEVEN = 'F' "
cQry3 += "AND ZL8_DEBCRE = 'D' "
cQry3 += "AND ZL8_PREFIX <> ' ' "
cQry3 += "AND D_E_L_E_T_ = ' ' )"


//	cQry3 += "AND SE2.E2_NUM = (SELECT SD1.D1_NFORI "
//	cQry3 += "FROM "+RetSQLName("SD1")+" SD1, "+RetSQLName("SF1")+ " SF1 "
//	cQry3 += "WHERE SF1.F1_DOC = '"+SF1->F1_DOC+"' AND "
//	cQry3 += "SF1.F1_SERIE = '"+SF1->F1_SERIE+"' AND "
//	cQry3 += "SF1.F1_FORNECE = '"+SF1->F1_FORNECE+"' AND "
//	cQry3 += "SF1.F1_DOC = SD1.D1_DOC AND "
//	cQry3 += "SF1.F1_SERIE = SD1.D1_SERIE)"

//Verifica area aberta
If Select("QRY3") <> 0
	QRY3->(DBCLOSEAREA())
EndIF

//Executa o SQL
cQry3 := ChangeQuery(cQry3)
dbUseArea( .T., "TOPCONN", TCGENQRY(,,cQry3),"QRY3", .F., .T.)

Private _cPrefixo	:=	""

QRY3->(Dbgotop())
While QRY3->(!Eof())
	//So baixa a parcela do titulo se esta tiver saldo pendente ou ainda nЦo foi baixada
	If QRY3->E2_SALDO <> 0 .AND. Empty(QRY3->E2_BAIXA)
		AAdd( aAutoCab[12,2], { xFilial( "SE2" ) + PadR( QRY3->E2_PREFIXO ,   TamSX3( "E2_PREFIXO" )[ 1 ] ) + ;
		PadR( QRY3->E2_NUM , TamSX3( "E2_NUM" )[ 1 ] ) + ;
		PadR( QRY3->E2_PARCELA , TamSX3( "E2_PARCELA" )[ 1 ] ) + ;
		PadR( "NDF" , TamSX3( "E2_TIPO" )[ 1 ] ) + ;
		PadR( QRY3->E2_FORNECE , TamSX3( "E2_FORNECE" )[ 1 ] ) + ;
		PadR( QRY3->E2_LOJA , TamSX3( "E2_LOJA" )[ 1 ] ) } )
		
		_cPrefixo	:=	POSICIONE("ZL8", 1, xFilial("ZL8") + QRY3->E2_L_EVENT, "ZL8_PREFIX")
		
		/*	cEvento,nValor,cSeek,lGrvZLF,lAltZLF,_cSeq,cFunName,cLinha,;
		nSE2VLR,nSE2SLD,dSE2VEN,cSE2HIS,nSE2JUR,nSE2ACRES,;
		_cCodForn,_cLojForn,_cTpTrib,_cFil,_lFecham
		*/
		
		//Adiciona todos titulos NDF ao array para posterior insercao na tabela ZLF
		AADD(_aZFL,{QRY3->E2_L_EVENT,QRY3->E2_VALOR,QRY3->E2_FILIAL+_cPrefixo+QRY3->E2_NUM+QRY3->E2_PARCELA+"NDF"+QRY3->E2_FORNECE+QRY3->E2_LOJA,.T.,.F.,,"CompesTit","",QRY3->E2_VALOR,QRY3->E2_SALDO,QRY3->E2_EMISSAO,QRY3->E2_HIST,QRY3->E2_JUROS, QRY3->E2_ACRESC,QRY3->E2_FORNECE,QRY3->E2_LOJA,_cTributac,_cBkpFil,.F.})
		_lNDF	:=	.T.
	EndIf
	QRY3->(DbSkip())
EndDo


If _lNCC == .T. .AND. _lNDF == .T.
	
	MSExecAuto({|x,y,z| Fina450(x,y,z)}, nil , aAutoCab , 3 )
	
	If !lMsErroAuto
		//msgalert("Incluido com sucesso! ")
		
		For i=1 To Len(_aZFL)
			GrvZLF(_aZFL[i][1],_aZFL[i][2],_aZFL[i][3],_aZFL[i][4],_aZFL[i][5],_aZFL[i][6],_aZFL[i][7],_aZFL[i][8],_aZFL[i][9],_aZFL[i][10],_aZFL[i][11],_aZFL[i][12],_aZFL[i][13],_aZFL[i][14],_aZFL[i][15],_aZFL[i][16],_aZFL[i][17],_aZFL[i][18],_aZFL[i][19])
		Next
	Else
		//msgalert("Erro na inclusao!")
		
		MostraErro()
		lDeuErro := .T.
	EndIf
	
EndIf

Return

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    Ё ActLojas Ё Autor ЁMicrosiga              Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Funcao para realizar Acerto das lojas do Produtor.         Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ ExpO01 - Objeto da Regua de processamento.                 Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё MGLT009()                                                  Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function ActLojas(oObj)
Local cArqTmp1  := cGLTalias+"5"
Local cArqTmp2  := cGLTalias+"6B"
Local _aArea    := {}
Local _aAlias   := {}
Local nTotReg   := 0
Local nCont     := 1
Local nSldTit   := 0
Local nJurTit   := 0
Local nVlrBx    := 0
Local cSeekZLF  := ""
Local cLoja     := ""

Local _cLojEvent:= ""

//зддддддддддддддддддддддддддддддддддд©
//ЁEfetua o backup da filial corrente.Ё
//юддддддддддддддддддддддддддддддддддды
Local _cBkpFil  := cFilAnt

//здддддддддддддддд©
//Ё  Salva a area. Ё
//юдддддддддддддддды
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SB1","ZL8","ZLF","SF1","SD1","ZLF","SX1"})

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza o log de processamento   Ё
//юддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	oObj:SaveLog("INICIO - Acerto Financeiro - "+SA2->A2_COD +"/"+SA2->A2_LOJA)
EndIf

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Cria tabela temporaria com os dados dos Eventos(ZL8) para filtrar posteriormente o SE2. Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	MsgRun("Aguarde.... Filtrando dados dos Eventos...",,{||CursorWait(), MGLT5QRY("5"), CursorArrow()})
Else
	MGLT5QRY("5")
EndIf

dbSelectArea(cArqTmp1)
dbGoTop()

While (cArqTmp1)->(!Eof())
	
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Cria tabela temporaria com os dados do SE2 filtrados a partir do prefixo informado no Evento(ZL8). Ё
	//Ё Este filtro segue a ordem de prioridade informada no ZL8_PRIORI.                                   Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	If _lNovoLayout
		MsgRun("Aguarde.... Filtrando dados do Contas a Pagar...",,{||CursorWait(), MGLT5QRY( "6B",(cArqTmp1)->ZL8_PREFIX ) , CursorArrow()})
	Else
		MGLT5QRY( "6B",(cArqTmp1)->ZL8_PREFIX )
	EndIf
	
	//зддддддддддддддддддддддддддддддддддд©
	//Ё Atualiza a regua de processamento.Ё
	//юддддддддддддддддддддддддддддддддддды
	If oObj <> Nil
		nTotReg := _nReg
		nCont   := 1
		oObj:SetRegua2(nTotReg)
	EndIf
	
	dbSelectArea(cArqTmp2)
	dbGoTop()
	
	While (cArqTmp2)->(!Eof())
		
		//зддддддддддддддддддддддддддддддддддд©
		//Ё Atualiza a regua de processamento.Ё
		//юддддддддддддддддддддддддддддддддддды
		If oObj <> Nil
			oObj:IncRegua2("Financeiro - Tarefa "+AllTrim(Str(nCont))+" de "+AllTrim(Str(nTotReg)))
			nCont++
		EndIf
		
		//зддддддддддддддддддддддддддддддддддд©
		//Ё Posiciona no cadastro de Eventos. Ё
		//юддддддддддддддддддддддддддддддддддды
		dbSelectArea("ZL8")
		ZL8->(dbSetOrder(1))
		ZL8->(dbSeek(xFilial("ZL8")+(cArqTmp1)->ZL8_COD))
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁAdicionado                                                          Ё
		//ЁPosiciona na filial correta para calculo do valor da baixa do tituloЁ
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		//		cFilAnt:= (cArqTmp2)->E2_FILIAL
		
		SM0->(dbSetOrder(1))   // forca o indice na ordem certa
		SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt))
		
		dbSelectArea("SE2")
		SE2->(dbSetOrder(1))//E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA
		If SE2->(dbSeek(xFilial("SE2")+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+(cArqTmp2)->E2_FORNECE+(cArqTmp2)->E2_LOJA))
			
			//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//ЁVerifica se o tipo do produtor corrente eh um produtor que nao ehЁ
			//Ёpertencente a uma associacao, pois isto impacta diretamente para Ё
			//Ёqual o debito deve ser gerado.                                   Ё
			//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			_cLojEvent:= SA2->A2_LOJA
			/*
			If SA2->A2_L_TPPRO == 'N'
			
			_cLojEvent:= SA2->A2_LOJA
			
			Else
			
			_cLojEvent:= (cArqTmp2)->E2_LOJA
			EndIf
			*/
			
			//nJurTit := fa080Juros(SE2->E2_MOEDA, SE2->E2_SALDO ,"SE2")
			nJurTit := fa080Juros()
			
			//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//ЁComentador por nao haver                                       Ё
			//Ёa necessidade dos comandos abaixo, o padrao do sistema nao usa.Ё
			//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			
			/*
			If nJurTit > 0 .And. nJurTit < 0.01
			nJurTit := nJurTit
			Else
			nJurTit := NOROUND(nJurTit,2)
			EndIf
			*/
			
			nSldTit := (SE2->E2_SALDO + nJurTit + SE2->E2_SDACRES) - SE2->E2_SDDECRE
			
			//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//Ё Valor a ser baixado no titulo com juros, passado para o sigaauto.                    Ё
			//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			nVlrBx  := nSldTit
			
			//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//Ё Se o saldo do produtor For maior que zero, baixa os titulos no SE2.Ё
			//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			If _nSldPro > 0
				//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Se o saldo do produtor menos o saldo do titulo maior ou igual a zero, baixa o SE2.Ё
				//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				If ( _nSldPro - nSldTit ) >= 0
					//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Grava registro na ZLF, com o valor do saldo do titulo.  Ё
					//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					If cTipoAct == "Definitivo"
						//cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,_cFilEvent+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+_cLojEvent,.T.,.F.,,"ActFinanc","",SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES,(cArqTmp2)->E2_FORNECE,_cLojEvent,_cTributac,_cBkpFil,.T.)
						cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,cCodMIX+_cFil_SE2+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+_cLojEvent,.T.,.F.,,"ActFinanc","",SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES,(cArqTmp2)->E2_FORNECE,_cLojEvent,_cTributac,_cBkpFil,.T.)
					Else
						cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,"PREVISAO",.T.,.F.,,"ActFinanc","",0,0,CTOD(""),"",0,0,(cArqTmp2)->E2_FORNECE,_cLojEvent,_cTributac,_cBkpFil,.F.)
					EndIf
					//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Descresce o saldo do produtor.                          Ё
					//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					_nSldPro -= nSldTit
					//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Se o acerto eh definitivo baixa o titulo no SE2.        Ё
					//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					If cTipoAct == "Definitivo"
						//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Baixa os titulos de convenio, emprestimo, adiantamentos e finaciamentos.Ё
						//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						BaixaSE2(oObj,nVlrBx,(cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO,(cArqTmp1)->ZL8_PREFIX,cSeekZLF,.T.,"ActFinanc",(cArqTmp2)->E2_FORNECE,(cArqTmp2)->E2_LOJA,(cArqTmp2)->E2_FILIAL,nJurTit)
						//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Baixa no titulo de valor bruto do produtor o valor das baixas dos emprestimos, adiantamentos, etc. Ё
						//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						BaixaSE2(oObj,nVlrBx,_cPrefixo,_cNroNota,Iif(_cMultNota=="S",_cParcNF,_cTamParc),"NF ","",,,"ActFinanc",SA2->A2_COD,SA2->A2_LOJA,_cFilEvent,nJurTit)
					EndIf
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Se o saldo do produtor menos o saldo do titulo eh menor que zero, faz baixa parcial. Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				Else
					//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Grava registro na ZLF, com o valor do saldo do titulo mesmo fazendo baixa parcial.  Ё
					//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					If cTipoAct == "Definitivo"
						//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//ЁAlterado para que fosse gravado                                             Ё
						//Ёna ZLF somente o valor que realmente foi baixado do convennio ou emprestimo.Ё
						//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						//cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,xFilial("SE2")+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+cLoja,.T.,,,"ActFinanc",,SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,"",_cBkpFil)
						
						//cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,_nSldPro,_cFilEvent+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+_cLojEvent,.T.,.F.,,"ActFinanc","",SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES,(cArqTmp2)->E2_FORNECE,_cLojEvent,_cTributac,_cBkpFil,.T.)
						cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,_nSldPro,cCodMIX+_cFil_SE2+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+_cLojEvent,.T.,.F.,,"ActFinanc","",SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES,(cArqTmp2)->E2_FORNECE,_cLojEvent,_cTributac,_cBkpFil,.T.)
						
					Else
						cSeekZLF := GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,"PREVISAO",.T.,.F.,,"ActFinanc","",0,0,CTOD(""),"",0,0,(cArqTmp2)->E2_FORNECE,_cLojEvent,_cTributac,_cBkpFil,.F.)
					EndIf
					//зддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Valor a ser baixado parcialmente no titulo. Ё
					//юддддддддддддддддддддддддддддддддддддддддддддды
					nVlrBx := _nSldPro
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Se o acerto eh definitivo e a situacao do evento eh de baixa parcial do titulo qdo na ha saldo suficiente. Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					If cTipoAct == "Definitivo" //.And. (cArqTmp1)->ZL8_SITUAC == 'B'
						// MARCO-TUB027
						// Baixa os titulos de convenio, emprestimo, adiantamentos e financiamentos.
						BaixaSE2(oObj,nVlrBx,(cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO,(cArqTmp1)->ZL8_PREFIX,cSeekZLF,.T.,"ActFinanc",(cArqTmp2)->E2_FORNECE,(cArqTmp2)->E2_LOJA,(cArqTmp2)->E2_FILIAL,nJurTit)
						//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Baixa NO titulo gerado pela nota do produtor, o valor das baixas dos emprestimos, adiantamentos, etc. Ё
						//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						BaixaSE2(oObj,nVlrBx,_cPrefixo,_cNroNota,Iif(_cMultNota=="S",_cParcNF,_cTamParc),"NF ","",,,"ActFinanc",SA2->A2_COD,SA2->A2_LOJA,_cFilEvent,nJurTit)
						//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Grava o valor baixado na ZLF (baixa parcial) by Abrahao em 16/02/09                                Ё
						//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						altZLF(cSeekZLF,nVlrBx)
						//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Descresce o saldo do produtor.                          Ё
						//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						_nSldPro -= _nSldPro
						//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Se o acerto eh definitivo e a situacao do evento eh de Delecao do titulo qdo na ha saldo suficiente para baixalo. Ё
						//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					ElseIf cTipoAct == "Definitivo" //.And. (cArqTmp1)->ZL8_SITUAC == 'D'
						//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
						//Ё Deleta o titulo de convenio quando nao ha saldo suficiente para paga-lo. Ё
						//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
						//xMagHelpFis("Saldo Devedor","O Produtor "+SA2->A2_COD+"-"+cLoja+" nao tem saldo para baixar o convenio. Saldo:"+TransForm(_nSldPro,"@E 999,999,999.99")+" Convenio:"+TransForm(nSldTit,"@E 999,999,999.99"),"O Convenio sera suspenso e o titulo excluido!")
						/*
						xMagHelpFis("Saldo Devedor","O Produtor "+SA2->A2_COD+"-"+cLoja+" nao tem saldo para baixar o convenio. Saldo:"+TransForm(_nSldPro,"@E 999,999,999.99")+" Convenio:"+TransForm(nSldTit,"@E 999,999,999.99"),"O Convenio pode ser suspenso e o titulo excluido. Confirme esta tela para decidir.")
						If MsgNoYes("Deseja excluir o convЙnio ?")
						DeletaSE2(oObj,(cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO,"ActFinanc")
						DelZLF(cSeekZLF)
						EndIf
						*/
					EndIf
				EndIf
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Se o saldo do produtor esta zerado, NAO baixa os titulos no SE2.   Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			Else
				//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Mesmo nao baixando o SE2 grava na ZLF o debito que o produtor possui. Ё
				//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				If cTipoAct == "Definitivo"
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//ЁComentado por caso nao                                      Ё
					//Ёhaja nenhuma deducao do evento do tipo financeiro nao existeЁ
					//Ёa necessidade de se efetuar o seu lancamento.               Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					//cSeekZLF:=GrvZLF((cArqTmp1)->ZL8_COD,0,_cFilEvent+(cArqTmp2)->E2_PREFIXO+(cArqTmp2)->E2_NUM+(cArqTmp2)->E2_PARCELA+(cArqTmp2)->E2_TIPO+SA2->A2_COD+_cLojEvent,.T.,.F.,,"ActFinanc","",SE2->E2_VALOR,SE2->E2_SALDO,SE2->E2_VENCTO,SE2->E2_HIST,nJurTit,SE2->E2_SDACRES,(cArqTmp2)->E2_FORNECE,_cLojEvent,"",_cBkpFil)
				Else
					cSeekZLF:=GrvZLF((cArqTmp1)->ZL8_COD,nSldTit,"PREVISAO",.T.,.F.,,"ActFinanc","",0,0,CTOD(""),"",0,0,(cArqTmp2)->E2_FORNECE,_cLojEvent,_cTributac,_cBkpFil,.F.)
				EndIf
				//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//Ё Se o acerto eh definitivo e a situacao do evento eh de Delecao do titulo qdo na ha saldo suficiente para baixalo. Ё
				//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				If cTipoAct == "Definitivo"// .And. (cArqTmp1)->ZL8_SITUAC == 'D'
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Deleta o titulo de convenio quando nao ha saldo suficiente para paga-lo. Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					//xMagHelpFis("Saldo Devedor","O Produtor "+SA2->A2_COD+"-"+cLoja+" nao tem saldo para baixar o convenio. Saldo:"+TransForm(_nSldPro,"@E 999,999,999.99")+" Convenio:"+TransForm(nSldTit,"@E 999,999,999.99"),"O Convenio sera suspenso e o titulo excluido!")
					/*
					xMagHelpFis("Saldo Devedor","O Produtor "+SA2->A2_COD+"-"+cLoja+" nao tem saldo para baixar o convenio. Saldo:"+TransForm(_nSldPro,"@E 999,999,999.99")+" Convenio:"+TransForm(nSldTit,"@E 999,999,999.99"),"O Convenio pode ser suspenso e o titulo excluido. Confirme esta tela para decidir.")
					If MsgNoYes("Deseja excluir o convЙnio ?")
					DeletaSE2(oObj,(cArqTmp2)->E2_PREFIXO,(cArqTmp2)->E2_NUM,(cArqTmp2)->E2_PARCELA,(cArqTmp2)->E2_TIPO,"ActFinanc")
					//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
					//Ё Deleta o registro na ZLF - by Abrahao em 16/02/09                        Ё
					//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
					delZLF(cSeekZLF)
					EndIf
					*/
				EndIf
			EndIf
		EndIf
		(cArqTmp2)->(dbSkip())
	EndDo
	
	//зддддддддддддддддддддддддддддддддддд©
	//Ё Apaga arquivo temporario.         Ё
	//юддддддддддддддддддддддддддддддддддды
	dbSelectArea(cArqTmp2)
	dbCloseArea(cArqTmp2)
	
	(cArqTmp1)->(dbSkip())
EndDo

//зддддддддддддддддддддддддддддддддддддддддддддд©
//ЁRestaura a filial corrente antes do processo.Ё
//юддддддддддддддддддддддддддддддддддддддддддддды
cFilAnt:= _cBkpFil

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt))

//зддддддддддддддддддддддддддддддддддд©
//Ё Atualiza o log de processamento   Ё
//юддддддддддддддддддддддддддддддддддды
If _lNovoLayout
	oObj:SaveLog("FIM - Acerto Financeiro - "+SA2->A2_COD +"/"+SA2->A2_LOJA)
EndIf
//зддддддддддддддддддддддддддддддддддд©
//Ё Apaga arquivo temporario.         Ё
//юддддддддддддддддддддддддддддддддддды
dbSelectArea(cArqTmp1)
dbCloseArea(cArqTmp1)

//здддддддддддддддддд©
//Ё Restaura a area. Ё
//юдддддддддддддддддды
CtrlArea(2,_aArea,_aAlias)

Return

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    ЁMGLT5QRY  Ё Autor ЁMicrosiga              Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Funcao para executar querys e gerar arquivo temporario com Ё╠╠
╠╠Ё          Ё o resultado da query.                                      Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ ExpC01 - Caracter que identifica a query a ser chamada de  Ё╠╠
╠╠Ё          Ё          acordo com a rotina de Acerto em execucao.        Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё MGLT009()                                                  Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function MGLT5QRY(cOpc,cPrefSE2,cCodEve)

//зддддддддддддддддддддддддддддддддд©
//Ё Declaracao de variavies locais. Ё
//юддддддддддддддддддддддддддддддддды
Local cQry   := ""
Local lSqlOk := .T.

DEFAULT cPrefSE2 := ""

Do Case
	//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Deleta os registros gerados na ZLF pela rotina de Acerto.   Ё
	//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	Case cOpc == "0"
		cQry := "DELETE FROM"
		cQry += " " + RETSQLNAME("ZLF")
		cQry += " WHERE D_E_L_E_T_ = ' '"
		cQry += " AND ZLF_FILIAL = '" + xFilial("ZLF") 	+ "'"
		cQry += " AND ZLF_CODZLE = '" + cCodMIX			+ "'"
		cQry += " AND ZLF_VERSAO = '" + _cVersao			+ "'"
		cQry += " AND ZLF_A2COD  BETWEEN '" + _cProdDe +"' AND '"+ cProdAte +"'"//Alterado em 09/07/10
		cQry += " AND ZLF_A2LOJA BETWEEN '" + cLojaDe +"' AND '"+ cLojaAte +"'"//Alterado em 09/07/10
		cQry += " AND ZLF_LINROT BETWEEN '" + cRotaDe +"' AND '"+ cRotaAte +"'"//Alterado em 09/07/10
		cQry += " AND ZLF_ORIGEM =  'F'" //So deleta originados pela rotina do Acerto
		cQry += " AND ZLF_ACERTO <> 'S'" //Deleta se nao realizou acerto definitivo
		cQry += " AND ZLF_TP_MIX = 'L' " //Deleta apenas registros do leite
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁIncluido pois caso o usuario                                            Ё
		//Ёefetua-se a previsao de todos os setores e depois pedi-se para          Ё
		//Ёrodar somente a previsao de um determinado setor ele apagaria           Ё
		//Ёos dados de todos os setores, impossibilitando a retirada dos relatoriosЁ
		//Ёpara conferencia.                                                       Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		If !Empty(_cSetores) //Se o parametro com os setores estiver vazio considera todos.
			cQry += " AND ZLF_SETOR IN (" + U_AjustSet(_cSetores) + ")"
		EndIf
		
		lSqlOk := !(TCSqlExec(cQry) < 0)

		If lSqlOk .and.  (TcGetDB() == 'ORACLE')
			lSqlOk := !(TCSqlExec(" COMMIT ") < 0)
		EndIf
		
		
		If !lSqlOk
			xMagHelpFis("NAO CONFORMIDADE 12 - NO DELETE",;
			TcSqlError(),;
			"Verifique a Sintaxe da Query de DELETE.")
		EndIf
		
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Filtra os produtores do MIX para iniciar o processamento.   Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	Case cOpc == "1"
		
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁAlterado pode-se ter mais Ё
		//Ёde um setor dentro da mesma filial de fechamento.          Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		cQry := "SELECT ZLF_FILIAL,ZLF_SETOR,ZLF_A2COD,ZLF_A2LOJA,ZLF.ZLF_A2NOME,ZLF_QTDBOM AS VLEITE,ZLF_LINROT,"
		//cQry := "SELECT ZLF.ZLF_SETOR,ZLF.ZLF_A2COD,ZLF.ZLF_A2LOJA,ZLF.ZLF_TRIBUT,SA2.A2_L_EMINF,"
		cQry += " SUM(Case WHEN ZL8_DEBCRE = 'C'"
		cQry += "        THEN ZLF_TOTAL"
		cQry += "        Else 0"
		cQry += "     END) AS CREDITO,"
		cQry += " SUM(Case WHEN ZL8_DEBCRE = 'D'"
		cQry += "        THEN ZLF_TOTAL"
		cQry += "        Else 0"
		cQry += "     END) AS DEBITO"
		cQry += " FROM "+RetSqlName("ZLF")+" ZLF, "+RetSqlName("ZL8")+" ZL8, "+RetSqlName("SA2")+" SA2"
		cQry += " WHERE ZLF.D_E_L_E_T_ = ' '"
		cQry += " AND ZL8.D_E_L_E_T_ = ' '"
		cQry += " AND SA2.D_E_L_E_T_ = ' '"
		cQry += " AND ZL8.ZL8_MSBLQL <> '1'"
		cQry += " AND ZLF.ZLF_FILIAL = '" +xFilial("ZLF")+ "'"
		cQry += " AND ZL8.ZL8_FILIAL = '" +xFilial("ZL8")+ "'"
		cQry += " AND SA2.A2_FILIAL = '"  +xFilial("SA2")+ "'"
		If !Empty(_cSetores) //Se o parametro com os setores estiver vazio considera todos.
			cQry += " AND ZLF.ZLF_SETOR IN (" + U_AjustSet(_cSetores) + ")"
		EndIf
		cQry += " AND ZLF.ZLF_A2COD BETWEEN  '" + _cProdDe +"' AND '"+ cProdAte +"'"
		cQry += " AND ZLF.ZLF_A2LOJA BETWEEN '" + cLojaDe +"' AND '"+ cLojaAte +"'"

		//cQry += "  AND ZLF.ZLF_LINROT BETWEEN '" + _cGrupoDe +"' AND '"+ _cGrupoAte +"'"

		cQry += " AND ZLF.ZLF_LINROT BETWEEN '" + cRotaDe +"' AND '"+ cRotaAte +"'"
		cQry += " AND ZLF.ZLF_CODZLE = '" + cCodMIX + "'"
		cQry += " AND ZLF.ZLF_VERSAO = '" + _cVersao + "'"
//		cQry += " AND SubString(ZLF.ZLF_A2COD,1,1) = 'P'"
		cQry += " AND SubStr(ZLF.ZLF_A2COD,1,1) = 'P'"
		cQry += " AND ZLF.ZLF_ACERTO <> 'S'"//Nao tiveram acerto
		cQry += " AND ZLF.ZLF_ORIGEM = 'M'"	//ZLF gerada pelo Mix
		cQry += " AND ZLF.ZLF_TP_MIX = 'L'" //Tipo do Mix igual a Leite
		cQry += " AND ZL8.ZL8_COD NOT IN ('" + _cFunrural + "')" //NЦo considera evento INSS pois o cАlculo do Funrual И padrЦo
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁComentado, pois o campo: ZL8_IMPNF sera            Ё
		//Ёconsiderado somente nos eventos de debitos que sejam diferentes de redutores        Ё
		//Ёpara verificar se os mesmos serao impressos nas mensagens adicionais da nota fiscal.Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		//cQry += " AND ZL8.ZL8_IMPNF  = 'S'" //Somente eventos que sao impressos na Nota.
		cQry += " AND ZLF.ZLF_EVENTO = ZL8.ZL8_COD"
		cQry += " AND ZLF.ZLF_A2COD  = SA2.A2_COD"
		cQry += " AND ZLF.ZLF_A2LOJA = SA2.A2_LOJA"
		
		cQry += " GROUP BY ZLF.ZLF_FILIAL,ZLF.ZLF_SETOR,ZLF.ZLF_A2NOME,ZLF.ZLF_A2COD,ZLF.ZLF_A2LOJA,ZLF_QTDBOM,ZLF_LINROT"
		cQry += " ORDER BY ZLF.ZLF_A2NOME "
		
		If Select(cGLTalias+cOpc)<> 0
			dbSelectArea(cGLTalias+cOpc)
			DbCloseArea(cGLTalias+cOpc)
		EndIf
		
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
		//зддддддддддддддддддддддддддддддддд©
		//Ё Acerto Fiscal(Gera NF Produtor).Ё
		//юддддддддддддддддддддддддддддддддды
	Case cOpc == "2"
		cQry := "SELECT ZLF_EVENTO,ZLF_SEQ,ZLF_QTDBOM,ZLF_TOTAL,ZLF_TRIBUT"
		cQry += " FROM "+RetSqlName("ZLF")
		cQry += " WHERE D_E_L_E_T_ = ' '"
		cQry += " AND ZLF_FILIAL = '" + xFilial("ZLF")	+ "'"
		cQry += " AND ZLF_CODZLE = '" + cCodMIX		   	+ "'"
		cQry += " AND ZLF_VERSAO = '" + _cVersao			+ "'"
		cQry += " AND ZLF_A2COD  = '" + SA2->A2_COD		+ "'"
		cQry += " AND ZLF_A2LOJA = '" + SA2->A2_LOJA	+ "'"
		cQry += " AND ZLF_SETOR  = '" + ZL2->ZL2_COD	+ "'"
		cQry += " AND ZLF_ORIGEM <> 'F'" //Somente registros gerados por rotinas diferentes do Acerto.
		cQry += " AND ZLF_ACERTO <> 'S'" //Somente registros que nao tiveram acerto.
		cQry += " AND ZLF_TP_MIX = 'L'"  //Somente registros do tipo Leite, exceto Frete.
		//		cQry += " AND ZLF_EVENTO <> '" + cEvetInc       + "'" //Nao pega o incentivo a producao, porque ele eh gravado na ZLF so a nivel de visualizacao no demomnstrativo
		cQry += " AND ZLF_DEBCRE = 'C'"   //Somente movimentos de credito
		//cQry += " AND ZLF_TRIBUT = '"  + TRZ->TRZ_TRIBU + "'"//Filtra por tipo de tributo pois sao notas diferentes cada tributo
		cQry += " ORDER BY ZLF_SEQ, ZLF_EVENTO "
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
		//зддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Acerto MIX (Le ZLF e gera e baixa SE2).   Ё
		//Ё Sao eventos do tipo Leite porem de Debito.Ё
		//Ё Sao eventos Incluidos pela rotina do Mix. Ё
		//юддддддддддддддддддддддддддддддддддддддддддды
	Case cOpc == "3"
		cQry := "SELECT ZLF_EVENTO,ZLF_SEQ,ZL8_COD,ZLF_TOTAL,ZL8_NATPRD FROM "
		cQry += RetSqlName("ZLF")+" ZLF, "+RetSqlName("ZL8")+" ZL8"
		cQry += " WHERE ZLF.D_E_L_E_T_ = ' '"
		cQry += " AND ZL8.D_E_L_E_T_ = ' '"
		cQry += " AND ZL8.ZL8_MSBLQL <> '1'"
		cQry += " AND ZLF.ZLF_FILIAL = '" + xFilial("ZLF")	+ "'"
		cQry += " AND ZL8.ZL8_FILIAL = '" + xFilial("ZL8")	+ "'"
		cQry += " AND ZLF.ZLF_CODZLE = '" + cCodMIX			+ "'"
		cQry += " AND ZLF.ZLF_VERSAO = '" + _cVersao			+ "'"
		cQry += " AND ZLF.ZLF_SETOR  = '" + ZL2->ZL2_COD	+ "'"
		cQry += " AND ZLF.ZLF_A2COD  = '" + SA2->A2_COD		+ "'"
		cQry += " AND ZLF.ZLF_A2LOJA = '" + SA2->A2_LOJA	+ "'"
		cQry += " AND ZLF.ZLF_EVENTO = ZL8.ZL8_COD"
//		cQry += " AND SubString(ZLF.ZLF_A2COD,1,1) = 'P'"
		cQry += " AND SubStr(ZLF.ZLF_A2COD,1,1) = 'P'"
		cQry += " AND ZLF.ZLF_ORIGEM = 'M'"  //M-> incluido pelo MIX
		cQry += " AND ZLF.ZLF_DEBCRE = 'D'"  //Somente Debito
		cQry += " AND ZLF.ZLF_ACERTO <> 'S'" //Nao foi realizado acerto
		cQry += " AND ZLF.ZLF_TP_MIX = 'L'"  //L para Mix de Leite, F para Mix de Frete
		cQry += " AND ZL8.ZL8_PREFIX <> ' '" //Prefixo diferente de vazio
		cQry += " AND ZL8.ZL8_TPEVEN <> 'R'" //Nao considera os redutores de qualidade
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁAdicionado, pois tem que ser   Ё
		//Ёconsiderado os eventos por tipo de tributacao senao pode ocorrerЁ
		//Ёde gerar um mesmo evento duas vezes.                            Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
//		cQry += " AND ZLF_TRIBUT = '" + TRZ->TRZ_TRIBU + "'"//Filtra por tipo de tributo pois sao notas diferentes cada tributo
		
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
		//зддддддддддддддддддддддддддддддддддд©
		//Ё Acerto Eventos Automatico.        Ё
		//юддддддддддддддддддддддддддддддддддды
	Case cOpc == "4"
		cQry := "SELECT ZL8_COD,ZL8_NATPRD FROM " + RetSqlName("ZL8")
		cQry += " WHERE D_E_L_E_T_ = ' ' "
		cQry += " AND ZL8_FILIAL = '" + xFilial("ZL8") + "'"
		cQry += " AND ZL8_TPEVEN = 'A'" //Evento Automatico
		cQry += " AND ZL8_DEBCRE IN ('C','D')" //Evento de Debito
		cQry += " AND ZL8_PREFIX <> ' '"//Prefixo diferente de vazio
		cQry += " AND ZL8_MSBLQL <> '1'"//Evento nЦo bloqueado
		cQry += " ORDER BY ZL8_PRIORI"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
		//"здддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Acerto Financeiro - Eventos de dИbitos( 1 de 2 ). Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддды
	Case cOpc == "5"
		cQry := "SELECT ZL8_COD,ZL8_DESCRI,ZL8_PREFIX FROM "+RetSqlName("ZL8")
		cQry += " WHERE D_E_L_E_T_ = ' ' "
		cQry += " AND ZL8_FILIAL = '" + xFilial("ZL8")+ "'"
		cQry += " AND ZL8_MSBLQL <> '1'"
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁComentado pois pode ocorrer       Ё
		//Ёde se efetuar um debito ao fornecedor na funcao acertoMix e o      Ё
		//Ёprodutor nao tiver saldo para finalizar o seu pagamento, no proximoЁ
		//Ёfechamento ou na funcao acertoFinanceiro e acertoLoja tem que ser  Ё
		//Ёpago este debito.                                                  Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		cQry += " AND ZL8_TPEVEN = 'F'" //Eventos Financeiros
		cQry += " AND ZL8_DEBCRE = 'D'" //Evento de Debito
		cQry += " AND ZL8_PREFIX <> ' '"//Prefixo diferente de vazio
//		cQry += " AND ZL8_SITUAC <> ' '"//Situacao de baixa ou delecao diferente de vazio
		cQry += " ORDER BY ZL8_PRIORI"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
		//"здддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Acerto Financeiro - Eventos de crИdito( 1 de 2 ). Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддды
	Case cOpc == "5B"
		cQry := "SELECT ZL8_COD,ZL8_DESCRI,ZL8_PREFIX FROM "+RetSqlName("ZL8")
		cQry += " WHERE D_E_L_E_T_ = ' ' "
		cQry += " AND ZL8_FILIAL = '" + xFilial("ZL8")+ "'"
		cQry += " AND ZL8_MSBLQL <> '1'"
		cQry += " AND ZL8_TPEVEN = 'F'" //Eventos Financeiros
		cQry += " AND ZL8_DEBCRE = 'C'" //Evento de Debito
		cQry += " AND ZL8_PREFIX <> ' '"//Prefixo diferente de vazio
		//cQry += " AND ZL8_SITUAC <> ' '"//Situacao de baixa ou delecao diferente de vazio
		cQry += " ORDER BY ZL8_PRIORI"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
		
		//зддддддддддддддддддддддддддддддддддддддддд©
		//Ё Acerto Financeiro - Titulos( 2 de 2 ).  Ё
		//юддддддддддддддддддддддддддддддддддддддддды
	Case cOpc == "6A"
		cQry := "SELECT E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO,E2_FORNECE,E2_LOJA,E2_SALDO,E2_VENCTO,E2_NATUREZ,E2_MOEDA,"
		cQry += " E2_VALOR,E2_VALJUR,E2_PORCJUR,E2_EMISSAO,E2_TXMOEDA,E2_BAIXA,E2_DECRESC,E2_ACRESC FROM "+RetSqlName("SE2")
		cQry += " WHERE D_E_L_E_T_ = ' '"
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁA filial foi comentada pois  Ё
		//Ёterao que ser considerados os debitos de todas as filiais nao Ё
		//Ёsomente da filial de fechamento.                              Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		//cQry += " AND E2_FILIAL  = '" +xFilial("SE2")+ "'"
		cQry += " AND E2_PREFIXO = '" + cPrefSE2    			+ "'"
		cQry += " AND E2_TIPO = 'NDF'" //Somente titulos de Debito do Produtor
		cQry += " AND E2_SALDO   > 0"  //Somente titulos em aberto ou baixados parcialmente
		cQry += " AND E2_EMISSAO <= '" + DtoS(ZLE->ZLE_DTFIM) 	+ "'"
		cQry += " AND E2_VENCTO <= '"  + cDtSelect   			+ "'"
		cQry += " AND E2_FORNECE = '"  + SA2->A2_COD 			+ "'"
		cQry += " AND E2_LOJA    = '"  + SA2->A2_LOJA			+ "'"
		cQry += " AND E2_L_EVENT = '" + cCodEve    			+ "'"
		
		cQry += " ORDER BY E2_VENCTO, E2_SALDO"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
		//зддддддддддддддддддддддддддддддддддддддддд©
		//Ё Acerto Lojas - Titulos( 2 de 2 ).       Ё
		//юддддддддддддддддддддддддддддддддддддддддды
	Case cOpc == "6B"
		cQry := "SELECT E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO,E2_FORNECE,E2_LOJA,E2_SALDO,E2_VENCTO,E2_NATUREZ,E2_MOEDA,"
		cQry += " E2_VALOR,E2_VALJUR,E2_PORCJUR,E2_EMISSAO,E2_TXMOEDA,E2_BAIXA,E2_DECRESC,E2_ACRESC FROM "+RetSqlName("SE2")
		cQry += " WHERE D_E_L_E_T_ = ' '"
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁA filial foi comentada pois  Ё
		//Ёterao que ser considerados os debitos de todas as filiais nao Ё
		//Ёsomente da filial de fechamento.                              Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		//cQry += " AND E2_FILIAL  = '" +xFilial("SE2")+ "'"
		cQry += " AND E2_PREFIXO = '"	+ cPrefSE2				+ "'"
		cQry += " AND E2_TIPO = 'NDF'" //Somente titulos de Debito do Produtor
		cQry += " AND E2_SALDO   > 0"  //Somente titulos em aberto ou baixados parcialmente
		cQry += " AND E2_EMISSAO <= '" + DtoS(ZLE->ZLE_DTFIM) 	+ "'"
		cQry += " AND E2_VENCTO <= '"  + cDtSelect				+ "'"
		cQry += " AND E2_FORNECE = '"  + SA2->A2_COD			+ "'"//Filtra somente o codigo, para compensar todas as lojas
		
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁAlterado para que fossem baixados   Ё
		//Ёos titulos com vencimento primeiro por questoes de cobranca de juros.Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		//cQry += " ORDER BY E2_FORNECE,E2_LOJA,E2_SALDO,E2_VENCTO"
		
		cQry += " ORDER BY E2_VENCTO,E2_LOJA"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Filtra os produtores do MIX para incluir os titulos do 2o Mix. Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	Case cOpc == "7"
		
		cQry := "SELECT ZLF_EVENTO,ZL8_PREFIX,ZLF_SEQ,ZLF_SETOR,ZLF_LINROT,SUM(ZLF_TOTAL) AS CREDITO"
		//cQry := "SELECT ZLF_EVENTO,ZLF_SEQ,ZLF_SETOR,SUM(ZLF_TOTAL) AS CREDITO"
		cQry += " FROM "+RetSqlName("ZLF")+" ZLF, "+RetSqlName("ZL8")+" ZL8"
		cQry += " WHERE ZLF.D_E_L_E_T_ = ' '"
		cQry += " AND ZL8.D_E_L_E_T_ = ' '"
		cQry += " AND ZL8.ZL8_MSBLQL <> '1'"
		cQry += " AND ZLF.ZLF_FILIAL = '" +xFilial("ZLF")+ "'"
		cQry += " AND ZL8.ZL8_FILIAL = '" +xFilial("ZL8")+ "'"
		If !Empty(_cSetores) //Se o parametro com os setores estiver vazio considera todos.
			cQry += " AND ZLF.ZLF_SETOR IN (" + U_AjustSet(_cSetores) + ")"
		EndIf
		cQry += " AND ZLF.ZLF_CODZLE = '" + cCodMIX + "'"
		cQry += " AND ZLF.ZLF_VERSAO = '" + _cVersao + "'"
		cQry += " AND ZLF.ZLF_A2COD  = '" + SA2->A2_COD + "'"
		cQry += " AND ZLF.ZLF_A2LOJA = '" + SA2->A2_LOJA + "'"
//		cQry += " AND SubString(ZLF.ZLF_A2COD,1,1) = 'P'"
		cQry += " AND SubStr(ZLF.ZLF_A2COD,1,1) = 'P'"
		cQry += " AND ZLF.ZLF_ACERTO <> 'S'" //Nao tiveram acerto
		cQry += " AND ZLF.ZLF_ORIGEM = 'M'"	 //ZLF gerada pelo Mix
		cQry += " AND ZLF.ZLF_TP_MIX = 'L'"  //Tipo do Mix igual a Leite
		cQry += " AND ZLF.ZLF_DEBCRE = 'C'"
		cQry += " AND ZLF.ZLF_EVENTO = ZL8.ZL8_COD"
		//cQry += " AND ZL8.ZL8_SB1COD <> ' '" //Somente eventos com codigo de produto.
		cQry += " AND ZL8.ZL8_IMPNF = 'N'"   //Somente eventos que nao sao impressos na Nota.
		cQry += " AND ZL8.ZL8_DEBCRE = 'C'"  //Somente eventos de Credito.
		cQry += " GROUP BY ZLF_EVENTO,ZL8_PREFIX,ZLF_SEQ,ZLF_SETOR,ZLF_LINROT"
		cQry += " ORDER BY ZLF_SETOR,ZLF_LINROT"
		//cQry += " GROUP BY ZLF_EVENTO,ZLF_SEQ,ZLF_SETOR"
		//cQry += " ORDER BY ZLF_SETOR"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
		//зддддддддддддддддддддддддддддддддддд©
		//Ё Acerto Fiscal(Gera NF Municipio). Ё
		//юддддддддддддддддддддддддддддддддддды
	Case cOpc == "8"
		//cQry := "SELECT ZLF_EVENTO,ZL8_SB1COD,MAX(ZL8_DESCRI) AS DESCRI,SUM(ZLF_QTDBOM) AS ZLF_QTDBOM,SUM(ZLF_TOTAL) AS ZLF_TOTAL FROM "
		cQry := "SELECT ZLF_EVENTO,MAX(ZL8_DESCRI) AS DESCRI,SUM(ZLF_QTDBOM) AS ZLF_QTDBOM,SUM(ZLF_TOTAL) AS ZLF_TOTAL FROM "
		cQry += RetSqlName("ZLF")+" ZLF, "+RetSqlName("ZL8")+" ZL8"
		cQry += " WHERE ZLF.D_E_L_E_T_ = ' '"
		cQry += " AND ZL8.D_E_L_E_T_ = ' '"
		cQry += " AND ZLF.ZLF_FILIAL = '" +xFilial("ZLF")+ "'"
		cQry += " AND ZL8.ZL8_FILIAL = '" +xFilial("ZL8")+ "'"
		cQry += " AND ZLF.ZLF_CODZLE = '" +cCodMIX+ "'"
		cQry += " AND ZLF.ZLF_VERSAO = '" +_cVersao+ "'"
		cQry += " AND ZLF.ZLF_EVENTO = ZL8.ZL8_COD"
//		cQry += " AND SubString(ZLF.ZLF_A2COD,1,1) = 'P'"
		cQry += " AND SubStr(ZLF.ZLF_A2COD,1,1) = 'P'"
		cQry += " AND ZLF.ZLF_DEBCRE = 'C'"
		cQry += " AND ZLF.ZLF_ACERTO = 'S'"
		cQry += " AND ZLF.ZLF_TP_MIX = 'L'"
		//cQry += " AND ZL8.ZL8_SB1COD <> ' '"
		cQry += " AND ZL8.ZL8_IMPNF = 'S'"  //Somente eventos que sao impressos na Nota.
		//cQry += " GROUP BY ZLF_EVENTO,ZL8_SB1COD"
		cQry += " GROUP BY ZLF_EVENTO"
		cQry += " ORDER BY ZLF_EVENTO"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
		//здддддддддддддддддддддддддддддддд©
		//Ё Acerto de Custos dos Produtos. Ё
		//юдддддддддддддддддддддддддддддддды
	Case cOpc == "9"
		cQry := "SELECT ZLD_RETIRO,ZLD_RETILJ FROM "+RetSqlName("ZLD")
		cQry += " WHERE ZLD_FILIAL = '"  + xFilial("ZLD") + "' AND  D_E_L_E_T_ = ' '"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
	Case cOpc == "A"
		//зддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Obtem produtores com debitos financeiros. Ё
		//юддддддддддддддддддддддддддддддддддддддддддды
		//cQry := " SELECT E2_L_FLALE,E2_FORNECE,E2_LOJA"
		cQry := " SELECT E2_FILIAL,E2_FORNECE,E2_LOJA"
		cQry += " FROM "+RetSqlName("SE2")+" SE2, "+RetSqlName("ZL8")+" ZL8 "
		cQry += " WHERE SE2.D_E_L_E_T_ = ' ' "
		cQry += " AND ZL8.D_E_L_E_T_ = ' ' "
		cQry += " AND ZL8.ZL8_MSBLQL <> '1'"
		cQry += " AND ZL8.ZL8_FILIAL = '" + xFilial("ZL8") + "' "
		cQry += " AND SE2.E2_FILIAL = '"  + xFilial("SE2") + "' "
		cQry += " AND E2_PREFIXO = ZL8_PREFIX "
		cQry += " AND ZL8_TPEVEN = 'F' "
		cQry += " AND E2_TIPO = 'NDF' "
		cQry += " AND E2_SALDO > 0 "
		
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁCodigo abaixo comentado,Ё
		//Ёmediante o codigo logo abaixo.                           Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		//cQry += " AND E2_L_SETOR IN (" + U_AjustSet(_cSetores) + ")"
		//If !Empty(_cSetores) //Se o parametro com os setores estiver vazio considera todos.
		//	cQry += " AND E2_L_SETOR IN (" 	+ U_AjustSet(_cSetores) + ")"
		//EndIf
		cQry += " AND E2_EMISSAO <= '" 		+ DtoS(ZLE->ZLE_DTFIM) 	+ "'"
		cQry += " AND E2_VENCTO <= '"		+ cDtSelect				+ "' "
//		cQry += " AND SubString(E2_FORNECE,1,1)='C' "
		cQry += " AND SubStr(E2_FORNECE,1,1)='P' "
		
		cQry += " GROUP BY E2_FILIAL,E2_FORNECE,E2_LOJA "
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		
	Case cOpc == "B"
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Acerto Creditos - Titulos de creditos com vencimento no mЙs.  Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		
		cQry := "SELECT E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO,E2_FORNECE,E2_LOJA,E2_SALDO,E2_VENCTO,E2_NATUREZ,E2_MOEDA,"
		cQry += " E2_VALOR,E2_VALJUR,E2_PORCJUR,E2_EMISSAO,E2_TXMOEDA,E2_BAIXA,E2_DECRESC,E2_ACRESC,E2_SDACRES,E2_SDDECRE "
		cQry += " FROM "+RetSqlName("SE2")+" E2 "
		cQry += " WHERE E2.D_E_L_E_T_ = ' '  "
		cQry += " AND E2_TIPO = 'NF'" //Somente titulos de credito do produtor
		cQry += " AND E2_SALDO   > 0 "  //Somente titulos em aberto ou baixados parcialmente
		cQry += " AND E2_EMISSAO <= '" + DtoS(ZLE->ZLE_DTFIM) 	+ "'"
		cQry += " AND E2_VENCTO <= '"  + cDtSelect   			+ "'"
		cQry += " AND E2_FORNECE = '"  + SA2->A2_COD 			+ "'"
		cQry += " AND E2_LOJA    = '"  + SA2->A2_LOJA			+ "'"
		cQry += " AND E2_PREFIXO NOT IN ('GLE','GLA') " //Nao buscar creditos de emprestimo e adiantamentos
		cQry += " AND LEFT(E2_PREFIXO,1) = 'G' "
		cQry += " AND E2_L_EVENT <> ' ' "
		
		cQry += " ORDER BY E2_VENCTO, E2_SALDO"
		TCQUERY cQry NEW ALIAS (cGLTalias+cOpc)
		dbSelectArea(cGLTalias+cOpc)
		Count To _nReg
		
EndCase

Return()

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    Ё DeletaSE2Ё Autor Ё Microsiga             Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Deleta o titulo no contas a pagar via SigaAuto.            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ ExpO01 - Objeto da regua de processamento.                 Ё╠╠
╠╠Ё          Ё ExpC02 - Prefixo do titulo a ser deletado.                 Ё╠╠
╠╠Ё          Ё ExpC03 - Nuermo do titulo a ser deletado.                  Ё╠╠
╠╠Ё          Ё ExpC04 - Parcela do titulo a ser deletado.                 Ё╠╠
╠╠Ё          Ё ExpC05 - Tipo do titulo a ser deletado.                    Ё╠╠
╠╠Ё          Ё ExpC06 - Nome da Static Function que chamou a DeletaSE2(). Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё GENERICO                                                   Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function DeletaSE2(oObj,_cPrefixo,cNroTit,cParcela,cTipo,cFunName)

Local _nModAnt := nModulo
Local _cModAnt := cModulo
Local nValor  := 0

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

//зддддддддддддддддддддддддддддддддддддддд©
//Ё Verifica se o titulo existe na base.  Ё
//юддддддддддддддддддддддддддддддддддддддды
dbSelectArea("SE2")
dbSetOrder(1)
If dbSeek(xFilial("SE2")+_cPrefixo+cNroTit+cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA)
	
	//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Armazena o valor do titulo de convenio do produtor para subtrair do titulo do convenio. Ё
	//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	nValor := SE2->E2_VALOR
	
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com os dados a serem passados para o SigaAuto. Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aAutoSE2:={{"E2_PREFIXO",SE2->E2_PREFIXO,Nil},;
	{"E2_NUM"    ,SE2->E2_NUM    ,Nil},;
	{"E2_TIPO"   ,SE2->E2_TIPO   ,Nil},;
	{"E2_PARCELA",SE2->E2_PARCELA,Nil},;
	{"E2_NATUREZ",SE2->E2_NATUREZ,Nil},;
	{"E2_FORNECE",SA2->A2_COD    ,Nil},;
	{"E2_LOJA"   ,SA2->A2_LOJA   ,Nil}}
	
	//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Altera o modulo para Financeiro, senao o SigaAuto nao executa.Ё
	//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	nModulo := 6
	cModulo := "FIN"
	
	//здддддддддддддддддддддддддддддддддддддддддддддд©
	//ЁRoda SigaAuto de Exclusao de Titulos a Pagar. Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддды
	Pergunte("FIN050",.F.) //Chama perguntas da rotina FINA050 para evitar erros na execuГЦo do sigaauto.
	
	MSExecAuto({|x,y,z| Fina050(x,y,z)},aAutoSE2,.T.,5)
	
	
	Pergunte(_cPerg,.F.) //Restaura perguntas da funГЦo principal
	
	//	MSExecAuto({|x,y,z| Fina050(x,y,z)},aAutoSE2,,5)
	
	//зддддддддддддддддддддддддддд©
	//Ё Restaura o modulo em uso. Ё
	//юддддддддддддддддддддддддддды
	nModulo := _nModAnt
	cModulo := _cModAnt
EndIf

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Verifica se houve erro no SigaAuto, caso haja mostra o erro. Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If lMsErroAuto
	lDeuErro := .T.
	If _lNovoLayout
		oObj:SaveLog("ERRO 09 - SIGAAUTO EXCLUSAO TITULO - "+cFunName)
	EndIf
	xMagHelpFis("NAO CONFORMIDADE 13 - EXCLUSAO - TITULO NAO EXCLUIDO",;
	"O titulo "+xFilial("SE2")+_cPrefixo+cNroTit+cParcela+cTipo+;
	" nЦo foi excluido! Produtor: "+SA2->A2_COD+"/"+SA2->A2_LOJA+"-"+SA2->A2_NOME,;
	"Verifique no financeiro se este titulo ja foi baixado ou o motivo pelo qual nЦo pode ser excluМdo."+;
	" Ao confimar esta tela, sera apresentada a tela do SigaAuto, que possui informaГУes mais detalhadas.")
	Mostraerro()
Else
	_cUpdate := " UPDATE " + RetSqlName("ZLL")
	_cUpdate += " SET ZLL_STATUS = 'S'"
	_cUpdate += " WHERE D_E_L_E_T_ = ' '"
	_cUpdate += " AND ZLL_FILIAL   = '" + xFilial("ZLL") + "'"
	_cUpdate += " AND ZLL_COD      = '" + SubStr(cNroTit,1,6) + "'"
	_cUpdate += " AND ZLL_SEQ      = '" + SubStr(cNroTit,7,3) + "'"
	_cUpdate += " AND ZLL_RETIRO   = '" + SA2->A2_COD  + "'"
	_cUpdate += " AND ZLL_RETILJ   = '" + SA2->A2_LOJA + "'"
	lSqlOk := !(TCSqlExec(_cUpdate) < 0)
	If lSqlOk .and.  (TcGetDB() == 'ORACLE')
		lSqlOk := !(TCSqlExec(" COMMIT ") < 0)
	EndIf
	
	
	If !lSqlOk
		lDeuErro := .T.
		If _lNovoLayout
			oObj:SaveLog("ERRO 10 - UPDATE ZLL - "+cFunName)
		EndIf
		xMagHelpFis("NAO CONFORMIDADE 14 - UPDATE DO STATUS DA ZLL",;
		TcSqlError(),;
		"NЦo Conformidade ao executar o Update de gravacao do Status do Convenio! "+;
		"NЦo confirme esta mensagem e informe ao Suporte TИcnico.")
	EndIf
	
	//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Tratamento para subtrair do Titulo NF o valor do titulo NDF de convenio que foi deletado. Ё
	//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	dbSelectArea("SE2")
	dbSetOrder(1)
	If dbSeek(xFilial("SE2")+ cPrefConv +(SubStr(cNroTit,1,6)+"000")+_cVersao+"NF "+SA2->A2_COD+SA2->A2_LOJA)
		If SE2->E2_SALDO == SE2->E2_VALOR
			RecLock("SE2",.F.)
			SE2->E2_VALOR  := SE2->E2_VALOR - nValor
			SE2->E2_SALDO  := SE2->E2_VALOR - nValor
			SE2->E2_VLCRUZ := SE2->E2_VALOR - nValor
			MsUnlock()
		Else
			lDeuErro := .T.
			If _lNovoLayout
				oObj:SaveLog("ERRO 11 - ALTERA VALOR TITULO - "+cFunName)
			EndIf
			xMagHelpFis("NAO CONFORMIDADE 15 - ALTERA VALOR TITULO",;
			"O titulo NF do Convenio ja foi baixado.",;
			"NЦo confirme esta mensagem e informe ao Suporte TИcnico.")
		EndIf
	EndIf
EndIf

Return

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    Ё IncluiSE2Ё Autor Ё Microsiga             Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Inclui titulo no contas a pagar via SigaAuto.              Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ ExpO01 - Objeto da regua de Processamento.                 Ё╠╠
╠╠Ё          Ё ExpN02 - Valor do titulo a ser incluido.                   Ё╠╠
╠╠Ё          Ё ExpC03 - Prefixo do titulo a ser incluido.                 Ё╠╠
╠╠Ё          Ё ExpC04 - Numero do titulo a ser incluido.                  Ё╠╠
╠╠Ё          Ё ExpC05 - Parcela do titulo a ser incluido.                 Ё╠╠
╠╠Ё          Ё ExpC06 - Tipo do titulo a ser incluido.                    Ё╠╠
╠╠Ё          Ё ExpC07 - Historico do titulo a ser incluido.               Ё╠╠
╠╠Ё          Ё ExpC08 - Chave de pesquisa para vincular o titulo na ZLF.  Ё╠╠
╠╠Ё          Ё ExpC09 - Nome da Static Function que chamou a IncluiSE2(). Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё GENERICO                                                   Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function IncluiSE2(oObj,nVlrTit,_cPrefixo,cNroTit,cParcela,cTipo,_cHistTit,cSeek,cFunName,cNatz,xcEvento)

Local _nModAnt  := nModulo
Local _cModAnt  := cModulo
Local aAutoSE2 := {}
Local lNoExist := .T.
Local nVlTxPer := If(cTipo=="NDF",GetMv("LT_TXPER "),0)//Se eh debito do produtor, grava valor da Taxa de Permanencia para cobrar juros.
Local cBcoSA2  := ""
//Local cEntrg   := U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,dDataBase)//Filial de entrega da linha do produtor
// IncluiSE2(oObj,nVlrEvto,ZL8->ZL8_PREFIX,cNroTit,cParc,cDebCre,ZL8->ZL8_DESCRI,cSeekZLF,"ActEvento",ZL8->ZL8_NATPRD)
Local _dbkpData:= dDataBase

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

DEFAULT cSeek := ""

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁTodos os titulo incluidos na tabela SE2 devem ser incluidos no ultimo dia     Ё
//Ёreferente ao intervalo de fechamento do mix, isto se faz necessario pelo fato Ё
//Ёdas baixas serem realizadas no ultimo dia de pagamento para calculo de juros. Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
dDataBase:= ZLE->ZLE_DTFIM

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Verifica se o tipo do titulo eh NF e se o tipo de pagamento eh banco, Ё
//Ё caso afirmativo, grava o portador.                                    Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If cTipo=="NF "//Tipo do Titulo = NF
	If SA2->A2_L_TPPAG == "B"//Tipo de pagamento B=Banco;C=Cheque;D=Dinheiro
		cBcoSA2 := SA2->A2_BANCO
	Else
		cBcoSA2 := ""
	EndIf
EndIf

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Verifica se o titulo ja existe na base, para nao duplicar. Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
dbSelectArea("SE2")
SE2->(dbSetOrder(1))
If SE2->(dbSeek(xFilial("SE2") + _cPrefixo + cNroTit + cParcela + cTipo + SA2->A2_COD + SA2->A2_LOJA))
	lDeuErro := .T.
	If _lNovoLayout
		oObj:SaveLog("ERRO 12 - TITULO DUPLICADO - "+cFunName)
	EndIf
	xMagHelpFis("NAO CONFORMIDADE 16 - TITULO DUPLICADO",;
	"O titulo "+xFilial("SE2")+_cPrefixo+cNroTit+cParcela+cTipo+;
	" ja existe para o produtor"+SA2->A2_COD+"/"+SA2->A2_LOJA+"-"+SA2->A2_NOME,;
	"Verifique no financeiro porque ja existe um titulo com estas caracteristicas e exclua-o.")
	lNoExist:=.F.
	If MsgYesNo("Deseja gerar o titulo como nova parcela?")
		cParcela:=soma1(cParcela)
		_cTamParc:=cParcela
		lNoExist:=.T.
		lDeuErro:=.F.
	EndIf
EndIf

If lNoExist
	
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Obtem natureza do cadastro de Eventos (by Abrahao)   Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддды
	_cNatureza:=AllTrim(GETMV("LT_NATGLT"))
	If Len(AllTrim(cNatz)) > 0
		_cNatureza:=cNatz
	EndIf
	
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com os dados a serem passados para o SigaAuto. Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aAutoSE2:={;
	{"E2_PREFIXO",_cPrefixo       		,Nil},;
	{"E2_NUM"    ,cNroTit        		,Nil},;
	{"E2_TIPO"   ,cTipo          		,Nil},;
	{"E2_PARCELA",cParcela       		,Nil},;
	{"E2_NATUREZ",_cNatureza      		,Nil},;
	{"E2_PORTADO",cBcoSA2        		,Nil},;
	{"E2_FORNECE",SA2->A2_COD    		,Nil},;
	{"E2_LOJA"   ,SA2->A2_LOJA   		,Nil},;
	{"E2_EMISSAO",dDataBase      		,Nil},;
	{"E2_VENCTO" ,STOD(_cVencto)  		,Nil},;
	{"E2_VENCREA",STOD(_cVencto)  		,Nil},;
	{"E2_HIST"   ,_cHistTit       		,Nil},;
	{"E2_VALOR"  ,nVlrTit        		,Nil},;
	{"E2_PORCJUR",nVlTxPer       		,Nil},;
	{"E2_DATALIB",dDataBase      		,Nil},;
	{"E2_USUALIB",AllTrim(cUserName)	,Nil},;
	{"E2_L_SETOR",ZL2->ZL2_COD   		,Nil},;
	{"E2_L_MIX"  ,cCodMIX        		,Nil},;
	{"E2_L_VERSA",_cVersao        		,Nil},;
	{"E2_L_SITUA","I"            		,Nil},;
	{"E2_L_SEEK" ,cSeek          		,Nil},;
	{"E2_L_EVENT" ,xcEvento          		,Nil},;
	{"E2_L_LIMIN",SA2->A2_L_LIMIN		,Nil}}
	//{"E2_L_FLALE",cEntrg         ,Nil},;
	
	/*	Comentado por Abrahao
	{"E2_L_TPPAG",SA2->A2_L_TPPAG,Nil},;
	{"E2_L_BANCO",Iif(SA2->A2_L_TPPAG=="B",SA2->A2_BANCO,"")  ,Nil},;
	{"E2_L_AGENC",Iif(SA2->A2_L_TPPAG=="B",SA2->A2_AGENCIA,"") ,Nil},;
	{"E2_L_CONTA",Iif(SA2->A2_L_TPPAG=="B",SA2->A2_NUMCON,"") ,Nil},;
	*/
	
	//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Altera o modulo para Financeiro, senao o SigaAuto nao executa.Ё
	//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	nModulo := 6
	cModulo := "FIN"
	
	//здддддддддддддддддддддддддддддддддддддддддддддд©
	//ЁRoda SigaAuto de inclusao de Titulos a Pagar. Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддды
	Pergunte("FIN050",.F.) //Chama perguntas da rotina FINA050 para evitar erros na execuГЦo do sigaauto.
	
	MSExecAuto({|x,y| Fina050(x,y)},aAutoSE2,3)
	
	
	Pergunte(_cPerg,.F.) //Restaura perguntas da funГЦo principal
	
	
	//зддддддддддддддддддддддддддд©
	//Ё Restaura o modulo em uso. Ё
	//юддддддддддддддддддддддддддды
	nModulo := _nModAnt
	cModulo := _cModAnt
	
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Verifica se houve erro no SigaAuto, caso haja mostra o erro. Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	If lMsErroAuto
		
		lDeuErro := .T.
		
		If _lNovoLayout
			oObj:SaveLog("ERRO 13 - SIGAAUTO INCLUSAO TITULO - "+cFunName)
		EndIf
		
		xMagHelpFis("INFORMAгцO",;
		"Erro na inclusЦo do tМtulo: " + cNroTit + '\' + cParcela + ' Prefixo\Tipo: '+ _cPrefixo + '\' + cTipo + "do Produtor: " + SA2->A2_COD + '\' + SA2->A2_LOJA,;
		"Favor copiar esta mensagem e informar ao departamento de informАtica")
		
		Mostraerro()
		
	Else
		
		dbSelectArea("SE2")
		SE2->(dbSetOrder(1))
		If SE2->(dbSeek(xFilial("SE2") + _cPrefixo + cNroTit + cParcela + cTipo + SA2->A2_COD +SA2->A2_LOJA))
			
			RecLock("SE2",.F.)
			
			If SA2->A2_L_TPPAG == "B"
				
				SE2->E2_L_TPPAG	:= SA2->A2_L_TPPAG
				SE2->E2_L_BANCO	:= SA2->A2_BANCO
				SE2->E2_L_AGENC := SA2->A2_AGENCIA
				SE2->E2_L_CONTA	:= SA2->A2_NUMCON
				
			EndIf
			
			SE2->(MsUnlock())
			
		EndIf
		
	EndIf
EndIf

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁRestaura a database antes de iniciar o processo de inclusao do titulo.Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
dDataBase:= _dbkpData

Return

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    Ё BaixaSE2 Ё Autor ЁMicrosiga              Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Baixa titulo no contas a pagar via SigaAuto.               Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ ExpO01 - Objeto da regua de processamento.                 Ё╠╠
╠╠Ё          Ё ExpN02 - Valor a ser baixado no titulo.                    Ё╠╠
╠╠Ё          Ё ExpC03 - Prefixo do titulo a ser baixado.                  Ё╠╠
╠╠Ё          Ё ExpC04 - Numero do titulo a ser baixado.                   Ё╠╠
╠╠Ё          Ё ExpC05 - Parcela do titulo a ser baixado.                  Ё╠╠
╠╠Ё          Ё ExpC06 - Tipo do titulo a ser baixado.                     Ё╠╠
╠╠Ё          Ё ExpC07 - Prefixo dos titulos de convenio(Param. LT_CONVPRE)Ё╠╠
╠╠Ё          Ё ExpC08 - Chave de pesquisa para vincular a Baixa na ZLF.   Ё╠╠
╠╠Ё          Ё ExpL09 - Indica se deve gravar o campo ZLF_VLRPAG.         Ё╠╠
╠╠Ё          Ё ExpC10 - Nome da Static Function que chamou a BaixaSE2().  Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё GENERICO                                                   Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function BaixaSE2(oObj,nVlrBx,_cPrefixo,cNroTit,cParcela,cTipo,cConvPref,cSeek,lVlPago,cFunName,cFornece,cLoja,_cFil,_nJuros)

Local _nModAnt      := nModulo
Local _cModAnt      := cModulo
//Local cPrefCv    := POSICIONE("ZL8",1,xFilial("ZL8")+AllTrim(GetMv("LT_CONVEXT")),"ZL8_PREFIX") //Evento de convenio

//Local aAreaSA2   := SA2->(GetArea())

Local _aArea       := {}
Local _aAlias      := {}

Local _aTitulo      := {}

//зддддддддддддддддддддддддддддддддддд©
//ЁEfetua o backup da filial corrente.Ё
//юддддддддддддддддддддддддддддддддддды
Local _cBkpFil     := cFilAnt

Local _cBkpFilEv   := ""

Local _nMaxSeq     := 0

Private lMsErroAuto:= .F.
Private lMsHelpAuto:= .T.

DEFAULT cConvPref  := ""
DEFAULT cSeek      := ""
DEFAULT lVlPago    := .F.

DEFAULT _nJuros    := 0

//########## INCLUIDO O RETURN AQUI PARA ANULAR ESTA FUNCAO NO FECHAMENTO DO LEITE POIS O FECHAMENTO FINANCEIRO REALIZARA AS BAIXAS
Return()
//##################################################



//здддддддддддддддд©
//Ё  Salva a area. Ё
//юдддддддддддддддды
CtrlArea(1,@_aArea,@_aAlias,{"SA2","SE2"})

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁInserido para que seja      Ё
//Ёpossicionado na filial correta para efetuar a baixa do tituloЁ
//Ёuma vez que podem existir convenios em uma filial diferente  Ё
//Ёda filial de fechamento.                                     Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
cFilAnt:= _cFil

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt))

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Posiciona no SA2 novamente, pois agora pode ser de outra loja.     Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
dbSelectArea("SA2")
SA2->(dbSetOrder(1))
If SA2->(dbSeek(xFilial("SA2") + cFornece + cLoja))
	
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Tratamento para liberar o titulo para baixa no financeiro. Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	dbSelectArea("SE2")
	SE2->(dbSetOrder(1))
	If SE2->(dbSeek(xFilial("SE2") + _cPrefixo + cNroTit + cParcela + cTipo + SA2->A2_COD + SA2->A2_LOJA))
		//cOrigem := SE2->E2_ORIGEM
		
		
		If Empty(SE2->E2_DATALIB)//Se nao foi liberado ainda
			RecLock("SE2",.F.)
			SE2->E2_DATALIB := dDataBase
			SE2->E2_USUALIB := AllTrim(cUserName)
			MsUnLock()
		EndIf
		
		AADD( _aTitulo, {"E2_PREFIXO"  	,_cPrefixo	  	, Nil } )
		AADD( _aTitulo, {"E2_NUM"	   	,cNroTit	    , Nil } )
		AADD( _aTitulo, {"E2_PARCELA"  	,cParcela      	, Nil } )
		AADD( _aTitulo, {"E2_TIPO"	   	,cTipo         	, Nil } )
		AADD( _aTitulo, {"E2_FORNECE"  	,SA2->A2_COD   	, Nil } )
		AADD( _aTitulo, {"E2_LOJA"	   	,SA2->A2_LOJA  	, Nil } )
		AADD( _aTitulo, { "AUTMOTBX"  	, _cMotBaixa		, Nil } )	// 08
		AADD( _aTitulo, { "AUTBANCO"  	, ""			, Nil } )	// 09
		AADD( _aTitulo, { "AUTAGENCIA"  	, ""			, Nil } )	// 10
		AADD( _aTitulo, { "AUTCONTA"  	, ""			, Nil } )	// 11
		AADD( _aTitulo, { "AUTCHEQUE"    ,""             ,Nil  } )	// 11
		AADD( _aTitulo, { "AUTDTBAIXA"	, dDataBase		, Nil } )	// 12
		AADD( _aTitulo, { "AUTDTCREDITO" ,dDataBase 	    , Nil } )	// 12
		AADD( _aTitulo, { "AUTBENEF"     ,SA2->A2_COD+" - "+AllTrim(SA2->A2_NOME),Nil} )	// 12
		AADD( _aTitulo, { "AUTHIST"   	, _cHist			, Nil } )	// 13
		AADD( _aTitulo, { "AUTDESCONT" 	, 0				, Nil } )	// 14
		AADD( _aTitulo, { "AUTMULTA"	 	, 0				, Nil } )	// 15
		AADD( _aTitulo, { "AUTOUTGAS" 	, 0				, Nil } )	// 17
		AADD( _aTitulo, { "AUTVLRPG"  	, nVlrBx   		, Nil } )	// 18
		
		/*
		If cTipo <> "NDF"
		AADD( _aTitulo, { "AUTVLRPG"  	, nVlrBx   		, Nil } )	// 18
		Else
		AADD( _aTitulo, { "AUTVLRPG"  	, nVlrBx + _nJuros  , Nil } )	// 18
		EndIf
		*/
		//AADD( _aTitulo, { "AUTVLRME"  	, nVlrBx		, Nil } )	// 19
		
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Altera o modulo para Financeiro, senao o SigaAuto nao executa.Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		nModulo := 6
		cModulo := "FIN"
		
		//здддддддддддддддддддддддддддддддддддддд©
		//Ё SigaAuto de Baixa de Contas a Pagar. Ё
		//юдддддддддддддддддддддддддддддддддддддды
		Pergunte("FIN080",.F.) //Chama perguntas da rotina FINA080 para evitar erros na execuГЦo do sigaauto.
		
		MSExecAuto({|x,y| Fina080(x,y)},_aTitulo,3)
		
		Pergunte(_cPerg,.F.) //Restaura perguntas da funГЦo principal
		
		
		//зддддддддддддддддддддддддддд©
		//Ё Restaura o modulo em uso. Ё
		//юддддддддддддддддддддддддддды
		nModulo := _nModAnt
		cModulo := _cModAnt
		
		
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Verifica se houve erro no SigaAuto, caso haja mostra o erro. Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		If lMsErroAuto
			lDeuErro := .T.
			If _lNovoLayout
				oObj:SaveLog("ERRO 14 - SIGAAUTO BAIXA - "+cFunName)
			EndIf
			xMagHelpFis("NAO CONFORMIDADE 17 - SIGAAUTO BAIXA TITULO",;
			"Existe uma nЦo conformidade no SigaAuto de Baixa de Contas a Pagar!",;
			xFilial("SE2")+_cPrefixo+cNroTit+;
			cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA+;
			"     <-  Copie essas informaГУes para voce pesquisar no Contas a Pagar o titulo que esta com nЦo conformidade. "+;
			"ApСs confirmar esta tela, sera apresentada a tela de NЦo Conformidade do SigaAuto.")
			MostraErro()
		Else
			
			//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//ЁCodigo inserido.             Ё
			//ЁPara que no momento de cancelamento de fechamento nao         Ё
			//Ёocorra cancelamente de baixas indevidas, pois podem existir   Ё
			//Ёbaixas de convenios de outras filiais que nao a de fechamento.Ё
			//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			_lRet:= U_atualizSE5(cCodMIX,_cVersao,ZL2->ZL2_COD,_cPrefixo,cTipo,cNroTit,cParcela,SA2->A2_COD,SA2->A2_LOJA,_cMotBaixa,nVlrBx,_nMaxSeq)
			
			If !_lRet
				
				lDeuErro := .T.
				//if _lNovoLayout
				oObj:SaveLog("ERRO - UPDATE E5_L_SEEK")
				//endif
				xMagHelpFis("NAO CONFORMIDADE - UPDATE DO CAMPO E5_L_SEEK",;
				"NЦo Conformidade ao executar o Update de gravacao do campo E5_L_SEEK! ",;
				xFilial("SE2")+_cPrefixo+cNroTit+cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA+;
				"<-  Copie essas informaГУes para voce pesquisar no Contas a Pagar o titulo que esta com nЦo conformidade.")
				
			Else
				
				//здддддддддддддддддддддддддддддддддддддддддд©
				//Ё Grava o codigo do MIX no Contas a Pagar. Ё
				//юдддддддддддддддддддддддддддддддддддддддддды
				
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//ЁCodigo comentado pois            Ё
				//Ёum mesmo titulo pode sofrer baixas de dois fechamentos ficando    Ё
				//Ёincorreto esta referencia, para tanto foi criado um campo SE5 paraЁ
				//Ёarmazenar estas informacoes.                                      Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				
				/*
				_cUpdate := " UPDATE " + RetSqlName("SE2")
				If !Empty(cSeek)
				_cUpdate += " SET E2_L_MIX = '"+cCodMIX+"', E2_L_VERSA = '"+_cVersao+"', E2_L_SEEK = '"+cSeek+"'"
				Else
				_cUpdate += " SET E2_L_MIX = '"+cCodMIX+"', E2_L_VERSA = '"+_cVersao+"'"
				EndIf
				_cUpdate += " WHERE D_E_L_E_T_ = ' '"
				_cUpdate += " AND E2_FILIAL    = '" + xFilial("SE2") + "'"
				_cUpdate += " AND E2_PREFIXO   = '" + _cPrefixo + "'"
				_cUpdate += " AND E2_NUM       = '" + cNroTit + "'"
				_cUpdate += " AND E2_PARCELA   = '" + cParcela + "'"
				_cUpdate += " AND E2_TIPO      = '" + cTipo + "'"
				_cUpdate += " AND E2_FORNECE   = '" + SA2->A2_COD + "'"
				_cUpdate += " AND E2_LOJA      = '" + SA2->A2_LOJA + "'"
				lSqlOk := !(TCSqlExec(_cUpdate) < 0)
				
				If !lSqlOk
				lDeuErro := .T.
				If _lNovoLayout
				oObj:SaveLog("ERRO 15 - UPDATE E2_L_MIX - "+cFunName)
				EndIf
				xMagHelpFis("NAO CONFORMIDADE 18 - UPDATE DO COD. MIX",;
				TcSqlError(),;
				"NЦo Conformidade ao executar o Update de gravacao do cod. MIX no E2_MIX! "+;
				"NЦo confirme esta mensagem e informe ao Suporte TИcnico.")
				EndIf
				*/
			EndIf
			
			//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//Ё Se lVlPago = .T., significa que devemos atualizar o campo ZLF_VLRPG.     Ё
			//Ё Este campo existe para diferenciar o valor original do evento em relacao Ё
			//Ё ao valor que foi pago nesse evento. Isso ocorre em baixas parciais.      Ё
			//Ё As baixas parciais existem qdo o produtor nao possui credito suficiente  Ё
			//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			
			//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//ЁCodigo fonte comentado             Ё
			//Ёpois nas proprias baixas efetuas ja eh gravado na ZLF o valor corretoЁ
			//Ёantes de chamar a rotina a rotina de baixaSE2.                       Ё
			//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			If lVlPago
				
				_cBkpFilEv:= cFilAnt
				
				//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
				//ЁInserido para que fosse posicionado          Ё
				//Ёna filial de fechamento do leite onde todos os valores de eventos sao gerados.Ё
				//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
				cFilAnt:= _cFilEvent
				
				dbSelectArea("ZLF")
				ZLF->(dbSetOrder(1))//ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_A2COD+ZLF_A2LOJA+ZLF_EVENTO+ZLF_SEQ
				If ZLF->(dbSeek(cSeek))
					
					RecLock("ZLF",.F.)
					ZLF->ZLF_VLRPAG := nVlrBx
					ZLF->(MsUnlock())
					
				Else
					lDeuErro := .T.
					If _lNovoLayout
						oObj:SaveLog("ERRO 17 - RecLock ZLF_VLRPAG - "+cFunName)
					EndIf
					xMagHelpFis("NAO CONFORMIDADE 20 - ZLF_VLRPAG NAO GRAVADO",;
					"Nao foi encontrado na ZLF o registro correspondente a baixa do titulo: "+xFilial("SE2")+_cPrefixo+cNroTit+cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA+ZL8->ZL8_COD,;
					"NЦo confirme esta mensagem e informe ao Suporte TИcnico.")
				EndIf
				
				cFilAnt:= _cBkpFilEv
				
			EndIf
			
		EndIf
	Else
		
		lDeuErro := .T.
		
		xMagHelpFis("NAO CONFORMIDADE 17 - TITULO NAO ENCONTRADO",;
		"Existe uma nЦo conformidade no SigaAuto de Baixa de Contas a Pagar!",;
		xFilial("SE2")+_cPrefixo+cNroTit+;
		cParcela+cTipo+SA2->A2_COD+SA2->A2_LOJA+;
		"     <-  Copie essas informaГУes para voce verificar no Contas a Pagar. O titulo nЦo foi encontrado.")
	EndIf
Else
	
	lDeuErro := .T.
	
	xMagHelpFis("NAO CONFORMIDADE 017 - FORNECEDOR NAO ENCONTRADO",;
	"O produtor + Loja "+cFornece+cLoja+" nao foram encontrados no cadastro de Fornecedores",;
	"Comunique o suporte sobre esta situaГЦo.")
	
EndIf

//RestArea(aAreaSA2)

//зддддддддддддддддддддддддддддддддддддддддддддд©
//ЁRestaura a filial corrente antes do processo.Ё
//юддддддддддддддддддддддддддддддддддддддддддддды
cFilAnt:= _cBkpFil

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt))

//здддддддддддддддддд©
//Ё Restaura a area. Ё
//юдддддддддддддддддды
CtrlArea(2,_aArea,_aAlias)

Return()

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    Ё GrvZLF   Ё Autor ЁMicrosiga              Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Funcao para gravar registros na tabela ZLF.                Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ ExpC01 - Codigo do Evento.                                 Ё╠╠
╠╠Ё          Ё ExpN02 - Valor do Evento.                                  Ё╠╠
╠╠Ё          Ё ExpC03 - Conteudo do indice para identificar o Titulo(SE2).Ё╠╠
╠╠Ё          Ё ExpL04 - Se .T. grava novo registro na ZLF, se .F. e nao   Ё╠╠
╠╠Ё          Ё          existir o registro na ZLF grava um novo.          Ё╠╠
╠╠Ё          Ё ExpL05 - Se .T. indica para alterar um registro na ZLF, se Ё╠╠
╠╠Ё          Ё          .F. nao faz nada.                                 Ё╠╠
╠╠Ё          Ё ExpC06 - Codigo Sequencial do Evento. Se vazio eh porque   Ё╠╠
╠╠Ё          Ё          sera feito inclusao na ZLF, se informado eh porqueЁ╠╠
╠╠Ё          Ё          se trata de alteracao de algum registro na ZLF.   Ё╠╠
╠╠Ё          Ё ExpC07 - Nome da Static Function que chamou a GrvZLF().    Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё GENERICO                                                   Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/

/*
//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁFuncao comentada no final               Ё
//Ёdo fonte foi recriada esta funcao para atender a necessidade da COOPRATA.Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
*/

/*
Static Function GrvZLF(cEvento,nValor,cSeek,lGrvZLF,lAltZLF,_cSeq,cFunName,cLinha,nSE2VLR,nSE2SLD,dSE2VEN,cSE2HIS,nSE2JUR,_cTpTrib)

DEFAULT _cSeq    := LastZLF()
DEFAULT cSeek   := ""
DEFAULT lGrvZLF := .T.
DEFAULT lAltZLF := .F.
DEFAULT nSE2VLR := 0
DEFAULT nSE2SLD := 0
DEFAULT nSE2JUR := 0
DEFAULT dSE2VEN := CTOD("")
DEFAULT cSE2HIS := ""

dbSelectArea("ZL8")
dbSetOrder(1)//ZL8_FILIAL+ZL8_COD
dbSeek(xFilial("ZL8")+cEvento)

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Se altera a ZLF. Usado quando o Evento foi lancado na ZLF.                          Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If lAltZLF
//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Posiciona na ZLF para alterar o campo ZLF_L_SEEK do registro.                             Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
dbSelectArea("ZLF")
dbSetOrder(1)//ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_A2COD+ZLF_A2LOJA+ZLF_EVENTO+ZLF_SEQ
If dbSeek(xFilial("ZLF")+cCodMIX+_cVersao+SA2->A2_COD+SA2->A2_LOJA+cEvento+_cSeq)
//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Gravacao dos dados.                                                    Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
dbSelectArea("ZLF")
RecLock("ZLF",.F.)
ZLF->ZLF_L_SEEK := cSeek
ZLF->(MsUnlock())
EndIf

Return(ZLF->ZLF_FILIAL+ZLF->ZLF_CODZLE+ZLF->ZLF_VERSAO+ZLF->ZLF_A2COD+ZLF->ZLF_A2LOJA+ZLF->ZLF_EVENTO+ZLF->ZLF_SEQ)
Else
//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Posiciona na ZLF para verificar se ja existe um registro para o mesmo evento.                     Ё
//Ё Se existir e a variavel lGrvZLF estiver como .T., ele grava um novo registro para o mesmo evento. Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
dbSelectArea("ZLF")
dbSetOrder(1)//ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_A2COD+ZLF_A2LOJA+ZLF_EVENTO+ZLF_SEQ
dbSeek(xFilial("ZLF")+cCodMIX+_cVersao+SA2->A2_COD+SA2->A2_LOJA+cEvento,.T.)
If ZLF->(ZLF_FILIAL+ZLF_CODZLE+_cVersao+ZLF_A2COD+ZLF_A2LOJA+ZLF_EVENTO) == xFilial("ZLF")+cCodMIX+_cVersao+SA2->A2_COD+SA2->A2_LOJA+cEvento
If lGrvZLF

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Alimenta as variaveis de memoria.                                      Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
RegToMemory("ZLF",.F.)

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Gravacao dos dados.                                                    Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
dbSelectArea("ZLF")
RecLock("ZLF",.T.)
For nContador := 1 To FCount()
If ("FILIAL" $ FieldName(nContador) )
FieldPut(nContador,xFilial("ZLF"))
ElseIf ("EVENTO" $ FieldName(nContador) )
FieldPut(nContador,cEvento)
ElseIf ("DCREVE" $ FieldName(nContador) )
FieldPut(nContador,ZL8->ZL8_DESCRI)
ElseIf ("QTDBOM" $ FieldName(nContador) )
FieldPut(nContador,0)
ElseIf ("QTDACI" $ FieldName(nContador) )
FieldPut(nContador,0)
ElseIf ("VLRLTR" $ FieldName(nContador) )
FieldPut(nContador,0)
ElseIf ("TOTAL" $ FieldName(nContador) )
FieldPut(nContador,nValor)
ElseIf ("DEBCRE" $ FieldName(nContador) )
FieldPut(nContador,"D")
ElseIf ("ORIGEM" $ FieldName(nContador) )
FieldPut(nContador,"F")
ElseIf ("L_SEEK" $ FieldName(nContador) )
FieldPut(nContador,cSeek)
ElseIf ("SEQ" $ FieldName(nContador) )
FieldPut(nContador,_cSeq)
ElseIf ("VLRPAG" $ FieldName(nContador) )
FieldPut(nContador,0)
ElseIf ("LINROT" $ FieldName(nContador) .And. !Empty(cLinha) ) // by Abrahao em 23/03/09
FieldPut(nContador,cLinha)
//ElseIf ("FILENT" $ FieldName(nContador))//Alterado 29/09/10
//	FieldPut(nContador,U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,dDataBase) )
ElseIf ("SE2VLR" $ FieldName(nContador))//Alterado 14/10/10
FieldPut(nContador,nSE2VLR )
ElseIf ("SE2SLD" $ FieldName(nContador))//Alterado 14/10/10
FieldPut(nContador,nSE2SLD )
ElseIf ("SE2VEN" $ FieldName(nContador))//Alterado 14/10/10
FieldPut(nContador,dSE2VEN )
ElseIf ("SE2HIS" $ FieldName(nContador))//Alterado 14/10/10
FieldPut(nContador,cSE2HIS )
ElseIf ("SE2JUR" $ FieldName(nContador))//Alterado 20/10/10
FieldPut(nContador,nSE2JUR )
ElseIf ("TRIBUT" $ FieldName(nContador))
FieldPut(nContador,_cTpTrib )
Else
FieldPut(nContador,M->&(FieldName(nContador)))
EndIf
Next nContador
ZLF->(MsUnlock())
EndIf
Else
//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Posiciona na ZLF para obter dados para gerar um novo registro na propria ZLF.             Ё
//Ё O novo registro criado possui os mesmos valores nos campos, exceto para os campos abaixo. Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
dbSelectArea("ZLF")
dbSetOrder(1)//ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_A2COD+ZLF_A2LOJA+ZLF_EVENTO+ZLF_SEQ
dbSeek(xFilial("ZLF")+cCodMIX+_cVersao+SA2->A2_COD+SA2->A2_LOJA,.T.)
If ZLF->(ZLF_FILIAL+ZLF_CODZLE+_cVersao+ZLF_A2COD+ZLF_A2LOJA) == xFilial("ZLF")+cCodMIX+_cVersao+SA2->A2_COD+SA2->A2_LOJA
//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Alimenta as variaveis de memoria.                                      Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
RegToMemory("ZLF",.F.)

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Gravacao dos dados.                                                    Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
dbSelectArea("ZLF")
RecLock("ZLF",.T.)
For nContador := 1 To FCount()
If ("FILIAL" $ FieldName(nContador) )
FieldPut(nContador,xFilial("ZLF"))
ElseIf ("EVENTO" $ FieldName(nContador) )
FieldPut(nContador,cEvento)
ElseIf ("DCREVE" $ FieldName(nContador) )
FieldPut(nContador,ZL8->ZL8_DESCRI)
ElseIf ("ENTMIX" $ FieldName(nContador) )
FieldPut(nContador,ZL8->ZL8_MIX)
ElseIf ("QTDBOM" $ FieldName(nContador) )
FieldPut(nContador,0)
ElseIf ("QTDACI" $ FieldName(nContador) )
FieldPut(nContador,0)
ElseIf ("VLRLTR" $ FieldName(nContador) )
FieldPut(nContador,0)
ElseIf ("TOTAL" $ FieldName(nContador) )
FieldPut(nContador,nValor)
ElseIf ("DEBCRE" $ FieldName(nContador) )
FieldPut(nContador,"D")
ElseIf ("ORIGEM" $ FieldName(nContador) )
FieldPut(nContador,"F")
ElseIf ("L_SEEK" $ FieldName(nContador) )
FieldPut(nContador,cSeek)
ElseIf ("SEQ" $ FieldName(nContador) )
FieldPut(nContador,_cSeq)
ElseIf ("VLRPAG" $ FieldName(nContador) )
FieldPut(nContador,0)
ElseIf ("LINROT" $ FieldName(nContador) .And. !Empty(cLinha) ) // by Abrahao em 23/03/09
FieldPut(nContador,cLinha)
//ElseIf ("FILENT" $ FieldName(nContador) )//Alterado 29/09/10
//	FieldPut(nContador,U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,dDataBase))
ElseIf ("SE2VLR" $ FieldName(nContador))//Alterado 14/10/10
FieldPut(nContador,nSE2VLR )
ElseIf ("SE2SLD" $ FieldName(nContador))//Alterado 14/10/10
FieldPut(nContador,nSE2SLD )
ElseIf ("SE2VEN" $ FieldName(nContador))//Alterado 14/10/10
FieldPut(nContador,dSE2VEN )
ElseIf ("SE2HIS" $ FieldName(nContador))//Alterado 14/10/10
FieldPut(nContador,cSE2HIS )
ElseIf ("SE2JUR" $ FieldName(nContador))//Alterado 20/10/10
FieldPut(nContador,nSE2JUR )
ElseIf ("TRIBUT" $ FieldName(nContador))
FieldPut(nContador,_cTpTrib )
Else
FieldPut(nContador,M->&(FieldName(nContador)))
EndIf
Next nContador
ZLF->(MsUnlock())
Else

// Se For necessario incluir o evento, usar funcao abaixo, disponivel em AGLT020
// gEvtPrd(cpFilial,cpMix,_cVersao,cpSetor,cpLinha,cpEvento,cpEveDC,cpEveMix,cpForn,cpLoja,nForm)

lDeuErro := .T.
If _lNovoLayout
//oObj:SaveLog("ERRO 18 - Produtor "+AllTrim(SA2->A2_COD+SA2->A2_LOJA)+" - "+cFunName)
EndIf
xMagHelpFis("NAO CONFORMIDADE 21 - Produtor nao encontrado",;
"Erro ao gerar o evento "+cEvento+". Produtor "+AllTrim(SA2->A2_COD+SA2->A2_LOJA)+" nЦo encontrado no MIX! Provavelmente nao ha pagamento a ele, mas possui dИbitos. ",;
"Retire os debitos (convenios, emprestimos, etc...) desse produtor caso realmente nao haja nenhum pagamento a ser feito!")

EndIf
EndIf
EndIf

Return(xFilial("ZLF")+cCodMIX+_cVersao+SA2->A2_COD+SA2->A2_LOJA+cEvento+_cSeq)
*/

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
╠╠ЁFuncao    Ё LastZLF  Ё Autor ЁMicrosiga              Ё Data Ё 00.00.00 Ё╠╠
╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
╠╠ЁDescricao Ё Funcao para retornar o ultimo sequencial + 1 da ZLF.       Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠ЁParametrosЁ Nenhum.                                                    Ё╠╠
╠╠Ё          Ё                                                            Ё╠╠
╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
╠╠Ё Uso      Ё GENERICO                                                   Ё╠╠
╠╠юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function LastZLF()

Local _cSeq := ""
Local cQry := ""

cQry := "SELECT MAX(ZLF_SEQ) AS COD FROM "+RetSqlName("ZLF")
cQry += " WHERE D_E_L_E_T_ = ' '"
cQry += " AND ZLF_FILIAL = '" + xFILIAL("ZLF") + "'"
cQry += " AND ZLF_CODZLE = '" + cCodMIX        + "'"
cQry += " AND ZLF_VERSAO = '" + _cVersao       + "'"
cQry += " AND ZLF_A2COD  = '" + SA2->A2_COD    + "'"
cQry += " AND ZLF_A2LOJA = '" + SA2->A2_LOJA   + "'"
TCQUERY cQry NEW ALIAS "GLT99"
dbSelectArea("GLT99")

If GLT99->(!Eof())
	_cSeq := SOMA1(GLT99->COD)
EndIf

dbSelectArea("GLT99")
dbCloseArea("GLT99")

Return(_cSeq)

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  Ё CtrlArea ╨ Autor Ё Microsiga          ╨ Data Ё  00/00/00   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Descricao Ё Static Function auxiliar no GetArea e ResArea retornando   ╨╠╠
╠╠╨          Ё o ponteiro nos Aliases descritos na chamada da Funcao.     ╨╠╠
╠╠╨          Ё Exemplo:                                                   ╨╠╠
╠╠╨          Ё Local _aArea  := {} // Array que contera o GetArea         ╨╠╠
╠╠╨          Ё Local _aAlias := {} // Array que contera o                 ╨╠╠
╠╠╨          Ё                     // Alias(), IndexOrd(), Recno()        ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠╨          Ё // Chama a Funcao como GetArea                             ╨╠╠
╠╠╨          Ё P_CtrlArea(1,@_aArea,@_aAlias,{"SL1","SL2","SL4"})         ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠╨          Ё // Chama a Funcao como RestArea                            ╨╠╠
╠╠╨          Ё P_CtrlArea(2,_aArea,_aAlias)                               ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨ParametrosЁ nTipo   = 1=GetArea / 2=RestArea                           ╨╠╠
╠╠╨          Ё _aArea  = Array passado por referencia que contera GetArea ╨╠╠
╠╠╨          Ё _aAlias = Array passado por referencia que contera         ╨╠╠
╠╠╨          Ё           {Alias(), IndexOrd(), Recno()}                   ╨╠╠
╠╠╨          Ё _aArqs  = Array com Aliases que se deseja Salvar o GetArea ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё GENERICO                                                   ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function CtrlArea(_nTipo,_aArea,_aAlias,_aArqs)

Local _nN := 0

// Tipo 1 = GetArea()
If _nTipo == 1
	_aArea := GetArea()
	For _nN := 1 To Len(_aArqs)
		dbSelectArea(_aArqs[_nN])
		AAdd(_aAlias,{ _aArqs[_nN], IndexOrd(), Recno() })
	Next
	// Tipo 2 = RestArea()
Else
	For _nN := 1 To Len(_aAlias)
		dbSelectArea(_aAlias[_nN,1])
		dbSetOrder(_aAlias[_nN,2])
		DbGoto(_aAlias[_nN,3])
	Next
	RestArea(_aArea)
EndIf

Return

/*/
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммямммммммммммммммммммммммкммммммммммммммммммямммммммммммммммммммммммммммммммммммммммммммммммм╩╠╠
╠╠╨Programa  ЁisPreparad╨ Autor Ё Microsiga             ╨ Data da Criacao  Ё 09/02/2009                						╨╠╠
╠╠лммммммммммьммммммммммймммммммомммммммммммммммммммммммйммммммммммммммммммомммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Descricao Ё Verifica se o produtor esta preparado para acerto                                                            ╨╠╠
╠╠╨          Ё                        									                               				        ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Fechamento do Leite.            						                                                        ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨ParametrosЁ Mix,Versao,Filial,Setor,Linha,Produtor,Loja									          						╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Retorno   Ё .T. ou .F.		  							                               									╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Usuario   Ё Microsiga                                                                                					╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Setor     Ё Gestao do Leite.                                                                        						╨╠╠
╠╠лммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						╨╠╠
╠╠лммммммммммяммммммммммяммммммммммммммммммммммммммммммммммммммммммммммммммяммммммммммммммммммммммммммммммммммяммммммммммммм╧╠╠
╠╠╨Autor     Ё Data     Ё Motivo da Alteracao  				               ЁUsuario(Filial+Matricula+Nome)    ЁSetor        ╨╠╠
╠╠╨ддддддддддеддддддддддеддддддддддддддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддеддддддддддддд╨╠╠
╠╠╨          Ё          Ё                                                  Ё                                  Ё   	        ╨╠╠
╠╠╨----------Ё----------Ё--------------------------------------------------Ё----------------------------------Ё-------------╨╠╠
╠╠╨          Ё          Ё                    							   Ё                                  Ё 			╨╠╠
╠╠╨----------Ё----------Ё--------------------------------------------------Ё----------------------------------Ё-------------╨╠╠
╠╠хммммммммммоммммммммммоммммммммммммммммммммммммммммммммммммммммммммммммммоммммммммммммммммммммммммммммммммммоммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
/*/
Static Function isPreparad(cpNumMix,cpVersao,cpFilial,cpSetor,cpLinha,cpRetiro,cpLjRet,cxTribu)

Local aArea  := GetArea()
Local bRet   :=.F.
Local nAbert := 0
Local nPrep  := 0
Local nFech  := 0

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Obtem Status agrupados e calcula qtd de cada status                 Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
cQuery := "SELECT ZLF_STATUS AS CSTATUS,COUNT(*) NUMREG FROM " + RetSqlName("ZLF") + " ZLF "
cQuery += " WHERE D_E_L_E_T_ = ' '"
cQuery += " AND ZLF_FILIAL ='" + cpFilial + "'"
cQuery += " AND ZLF_VERSAO ='" + cpVersao + "'"
cQuery += " AND ZLF_CODZLE ='" + cpNumMix + "'"
cQuery += " AND ZLF_TRIBUT ='" + cxTribu  + "'"
cQuery += " AND ZLF_TP_MIX = 'L'"
If !Empty(AllTrim(cpSetor))
	cQuery += " AND ZLF_SETOR = '"  + cpSetor  + "'"
EndIf
If !Empty(AllTrim(cpLinha))
	cQuery += " AND ZLF_LINROT = '" + cpLinha  + "'"
EndIf
If !Empty(AllTrim(cpRetiro))
	cQuery += " AND ZLF_A2COD = '"  + cpRetiro + "'"
EndIf
If !Empty(AllTrim(cpLjRet))
	cQuery += " AND ZLF_A2LOJA = '" +cpLjRet   +"'"
EndIf
cQuery += " GROUP BY ZLF_STATUS "

If Select("TRX") <> 0
	TRX->(dbCloseArea("TRX"))
EndIf

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRX", .T., .F. )

dbSelectArea("TRX")
TRX->(dbGoTop())

While !TRX->(Eof())
	
	Do Case
		
		Case TRX->CSTATUS == ""
			
			nAbert += TRX->NUMREG
			
		Case TRX->CSTATUS == "A"
			
			nAbert += TRX->NUMREG
			
		Case TRX->CSTATUS == "P"
			
			nPrep:= TRX->NUMREG
			
		Case TRX->CSTATUS == "F"
			
			nFech:= TRX->NUMREG
			
		OtherWise
			
			nAbert+= TRX->NUMREG
			
	EndCase
	
	TRX->(dbSkip())
EndDo

TRX->(dbCloseArea())

If nPrep > 0 .And. nAbert == 0 .And. nFech == 0
	bRet:=.T.
EndIf

RestArea(aArea)

Return(bRet)

/*/
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммямммммммммммммммммммммммкммммммммммммммммммямммммммммммммммммммммммммммммммммммммммммммммммм╩╠╠
╠╠╨Programa  Ё delZLF   ╨ Autor Ё Microsiga             ╨ Data da Criacao  Ё 16/02/2009                						╨╠╠
╠╠лммммммммммьммммммммммймммммммомммммммммммммммммммммммйммммммммммммммммммомммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Descricao Ё Deleta registro na ZLF                                                                                       ╨╠╠
╠╠╨          Ё                        									                               				        ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Fechamento do Leite.            						                                                        ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨ParametrosЁ cSeek -> Numero do campo ZLF_SEEK          								          						    ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Retorno   Ё Nada       	  							                               									    ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Usuario   Ё Microsiga                                                                                					╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Setor     Ё Gestao do Leite.                                                                        						╨╠╠
╠╠лммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						╨╠╠
╠╠лммммммммммяммммммммммяммммммммммммммммммммммммммммммммммммммммммммммммммяммммммммммммммммммммммммммммммммммяммммммммммммм╧╠╠
╠╠╨Autor     Ё Data     Ё Motivo da Alteracao  				               ЁUsuario(Filial+Matricula+Nome)    ЁSetor        ╨╠╠
╠╠╨ддддддддддеддддддддддеддддддддддддддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддеддддддддддддд╨╠╠
╠╠╨          Ё          Ё                                                  Ё                                  Ё   	        ╨╠╠
╠╠╨----------Ё----------Ё--------------------------------------------------Ё----------------------------------Ё-------------╨╠╠
╠╠╨          Ё          Ё                    							   Ё                                  Ё 			╨╠╠
╠╠╨----------Ё----------Ё--------------------------------------------------Ё----------------------------------Ё-------------╨╠╠
╠╠хммммммммммоммммммммммоммммммммммммммммммммммммммммммммммммммммммммммммммоммммммммммммммммммммммммммммммммммоммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
/*/
Static Function DelZLF(cSeek)

dbSelectArea("ZLF")
dbSetOrder(1)
If dbSeek(cSeek)
	RecLock("ZLF",.F.)
	DbDelete()
	MsUnlock()
Else
	xMagHelpFis("Erro-DelZLF","Nao foi possivel deletar o lancamento do Evento correspondente ao Titulo Deletado!",;
	"Comunique ao Suporte! Seek:"+cSeek)
EndIf

Return

/*/
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммямммммммммммммммммммммммкммммммммммммммммммямммммммммммммммммммммммммммммммммммммммммммммммм╩╠╠
╠╠╨Programa  Ё altZLF   ╨ Autor Ё Microsiga             ╨ Data da Criacao  Ё 16/02/2009                						╨╠╠
╠╠лммммммммммьммммммммммймммммммомммммммммммммммммммммммйммммммммммммммммммомммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Descricao Ё Altera o valor do registro na ZLF                                                                            ╨╠╠
╠╠╨          Ё (Usado quando For baixa parcial)							                               				        ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Fechamento do Leite.            						                                                        ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨ParametrosЁ cSeek -> Numero do campo ZLF_SEEK          									          						╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Retorno   Ё Nada       	  							                    	           									╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Usuario   Ё Microsiga                                                                                					╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Setor     Ё Gestao do Leite.                                                                        						╨╠╠
╠╠лммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						╨╠╠
╠╠лммммммммммяммммммммммяммммммммммммммммммммммммммммммммммммммммммммммммммяммммммммммммммммммммммммммммммммммяммммммммммммм╧╠╠
╠╠╨Autor     Ё Data     Ё Motivo da Alteracao  				               ЁUsuario(Filial+Matricula+Nome)    ЁSetor        ╨╠╠
╠╠╨ддддддддддеддддддддддеддддддддддддддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддеддддддддддддд╨╠╠
╠╠╨          Ё          Ё                                                  Ё                                  Ё   	        ╨╠╠
╠╠╨----------Ё----------Ё--------------------------------------------------Ё----------------------------------Ё-------------╨╠╠
╠╠╨          Ё          Ё                    							   Ё                                  Ё 			╨╠╠
╠╠╨----------Ё----------Ё--------------------------------------------------Ё----------------------------------Ё-------------╨╠╠
╠╠хммммммммммоммммммммммоммммммммммммммммммммммммммммммммммммммммммммммммммоммммммммммммммммммммммммммммммммммоммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
/*/
Static Function AltZLF(cSeek,nVlr)

dbSelectArea("ZLF")
dbSetOrder(1)
If dbSeek(cSeek)
	RecLock("ZLF",.F.)
	
	ZLF->ZLF_TOTAL  := nVlr
	ZLF->ZLF_VLRLTR := ZLF->ZLF_TOTAL/ZLF->ZLF_QTDBOM
	
	MsUnlock()
EndIf

Return

/*/
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммямммммммммммммммммммммммкммммммммммммммммммямммммммммммммммммммммммммммммммммммммммммммммммм╩╠╠
╠╠╨Programa  Ё GERNF    ╨ Autor Ё Microsiga             ╨ Data da Criacao  Ё 26/05/2009                						╨╠╠
╠╠лммммммммммьммммммммммймммммммомммммммммммммммммммммммйммммммммммммммммммомммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨	1-Obtem os Municipios dos produtores que estao em ZLF.                                                                  ╨╠╠
╠╠╨	2-Localiza eventos gerados na ZLF pra os produtores do Municipio Corrente.                                              ╨╠╠
╠╠╨	3-Gera NF para o Municipio.                                                                                             ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Implantacao das rotinas referente a Gestao do Leite.                						                    ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨ParametrosЁ aDados                                                                               						╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Retorno   Ё Nenhum                                                                                						╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Usuario   Ё Microsiga                                                                                					╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Setor     Ё Gestao do Leite.                                                                        						╨╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
/*/
Static Function gerNFS()

Local aRet:={}
Local ultMun:=""
Local ultEst:=""
Local cMun,cLjPrd,cCodPrd,cEst
Local aItens:={}
Local cAlias:="TMPNF"

// Obtem produtores e seus municipios para gerar nfs
// [1] Cod. Municipio
// [2] Estado
// [3] Cod. Produtor
// [4] Cod. Loja
aDados:=GetMunPrd()

ProcRegua(Len(aDados))

// Ordena por municipio
//aDados := ASORT(aDados,,,{ |x, y| x[1] < y[1] })

// Le array aDados
// Cria itens da nf em aItens
// Gera nf quando mudar o Municipio
For nx:=1 To Len(aDados)
	
	cMun	:=	aDados[nx,1]
	cEst	:=	aDados[nx,2]
	cCodPrd	:=	aDados[nx,3]
	cLjPrd	:=	aDados[nx,4]
	
	IncProc("Gerando Nota do Municipio: "+POSICIONE("CC2",1,xFilial("CC2")+cEst+cMun,"CC2_MUN"))
	
	
	If cEst+cMun != ultEst+ultMun .And. ultMun!=""
		gravaNF(ultMun,ultEst,aItens)
		aItens:={}
		aPrdMun:={}
	EndIf
	ultMun:=cMun
	ultEst:=cEst
	
	
	cQry := " SELECT ZLF_A2COD,ZLF_A2LOJA,ZLF_EVENTO,SUM(ZLF_QTDBOM) AS ZLF_QTDBOM,SUM(ZLF_TOTAL) AS ZLF_TOTAL FROM "
	cQry += RetSqlName("ZLF")+" ZLF, "+RetSqlName("ZL8")+" ZL8"
	cQry += " WHERE ZLF.D_E_L_E_T_ = ' '"
	cQry += " AND ZL8.D_E_L_E_T_ = ' '"
	cQry += " AND ZLF.ZLF_FILIAL = '" +xFilial("ZLF")+ "'"
	cQry += " AND ZL8.ZL8_FILIAL = '" +xFilial("ZL8")+ "'"
	cQry += " AND ZLF.ZLF_CODZLE = '" +cCodMIX+ "'"
	cQry += " AND ZLF.ZLF_VERSAO = '" +_cVersao+ "'"
	cQry += " AND ZLF.ZLF_A2COD  = '" + cCodPrd + "'"
	cQry += " AND ZLF.ZLF_A2LOJA = '" + cLjPrd + "'"
	cQry += " AND ZLF.ZLF_F1SEEK = ' ' " // IMPORTANTE: PEGA APENAS EVENTOS QUE NAO FORAM EMITIDAS NFS
	cQry += " AND ZLF.ZLF_EVENTO = ZL8.ZL8_COD"
//	cQry += " AND SubString(ZLF.ZLF_A2COD,1,1) = 'P'"
	cQry += " AND SubStr(ZLF.ZLF_A2COD,1,1) = 'P'"
	cQry += " AND ZLF.ZLF_DEBCRE = 'C'"
	cQry += " AND ZLF.ZLF_ACERTO = 'S'"
	cQry += " AND ZLF.ZLF_TP_MIX = 'L'"
	//cQry += " AND ZL8.ZL8_SB1COD <> ' '"
	cQry += " AND ZLF.ZLF_MUN <> ' '" // IMPORTANTE: PEGA APENAS EVENTOS COM MUNICIPIO
	cQry += " AND ZLF.ZLF_EST <> ' '"// IMPORTANTE: PEGA APENAS EVENTOS COM ESTADO
	cQry += " AND ZL8.ZL8_IMPNF = 'S'"  //Somente eventos que sao impressos na Nota.
	cQry += " GROUP BY ZLF_A2COD,ZLF_A2LOJA,ZLF_EVENTO"
	cQry += " ORDER BY ZLF_A2COD,ZLF_A2LOJA,ZLF_EVENTO"
	dbUseArea( .T., "TOPCONN", TcGenQry(,,cQry),cAlias, .T., .F. )
	
	dbSelectArea(cAlias)
	While (cAlias)->(!Eof())
		nPos := achouPos(aItens,(cAlias)->ZLF_EVENTO)
		
		If nPos != 0
			aItens[nPos,3] += (cAlias)->ZLF_QTDBOM
			aItens[nPos,4] += (cAlias)->ZLF_TOTAL
		Else
			aAdd(aItens,{;
			(cAlias)->ZLF_EVENTO,;
			POSICIONE("ZL8",1,xFilial("ZL8")+(cAlias)->ZLF_EVENTO,"ZL8_SB1COD"),;
			(cAlias)->ZLF_QTDBOM,;
			(cAlias)->ZLF_TOTAL	})
		EndIf
		Aadd(aPrdMun,{(cAlias)->ZLF_A2COD,(cAlias)->ZLF_A2LOJA})
		
		(cAlias)->(dbSkip())
	EndDo
	(cAlias)->(dbCloseArea())
	
	// prox. produtor
Next nx

// Ultima nf
If Len(aItens) > 0
	gravaNF(ultMun,ultEst,aItens)
	aItens:={}
	aPrdMun:={}
EndIf

Return aRet


/*/
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммямммммммммммммммммммммммкммммммммммммммммммямммммммммммммммммммммммммммммммммммммммммммммммм╩╠╠
╠╠╨Programa  ЁAchouPos  ╨ Autor Ё Microsiga             ╨ Data da Criacao  Ё 26/05/2009                						╨╠╠
╠╠лммммммммммьммммммммммймммммммомммммммммммммммммммммммйммммммммммммммммммомммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨	DescricaoЁ Localiza um dado na posicao 1 do array.                                                                      ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Implantacao das rotinas referente a Gestao do Leite.                						                    ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨ParametrosЁ aResult - Array                                                                         						╨╠╠
╠╠╨ParametrosЁ cEvento - String procurada                                                              						╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Retorno   Ё Posicao no Array ou 0                                                                 						╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Usuario   Ё Microsiga                                                                                					╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Setor     Ё Gestao do Leite.                                                                        						╨╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
/*/
Static Function achouPos(aResult,cEvento)

For r:=1 To Len(aResult)
	If aResult[r,1] == cEvento
		Return r
	EndIf
Next r

Return 0

/*/
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммямммммммммммммммммммммммкммммммммммммммммммямммммммммммммммммммммммммммммммммммммммммммммммм╩╠╠
╠╠╨Programa  ЁExistDados╨ Autor Ё Microsiga             ╨ Data da Criacao  Ё 26/05/2009                						╨╠╠
╠╠лммммммммммьммммммммммймммммммомммммммммммммммммммммммйммммммммммммммммммомммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨	DescricaoЁ Verifica se Produtor,Loja e Municipio ja estao no array.                                                     ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Implantacao das rotinas referente a Gestao do Leite.                						                    ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨ParametrosЁ aInfo   - Array                                                                        						╨╠╠
╠╠╨ParametrosЁ cpMun   - Cod. do Muncipio                                                              						╨╠╠
╠╠╨ParametrosЁ cpCod   - Cod. do Fornecdor                                                             						╨╠╠
╠╠╨ParametrosЁ cpLoja  - Cod. da Loja                                                                  						╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Retorno   Ё Verdadeiro se existe                                                                  						╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Usuario   Ё Microsiga                                                                                					╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Setor     Ё Gestao do Leite.                                                                        						╨╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
/*/
Static Function ExistDados(aInfo,cpMun,cpCod,cpLoja)

For z:=1 To Len(aInfo)
	If aInfo[1]==cpMun .And. aInfo[2]==cpCod .And. aInfo[3]==cpLoja
		Return .T.
	EndIf
Next z

Return .F.


/*/
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммямммммммммммммммммммммммкммммммммммммммммммямммммммммммммммммммммммммммммммммммммммммммммммм╩╠╠
╠╠╨Programa  ЁGravaNF   ╨ Autor Ё Microsiga             ╨ Data da Criacao  Ё 26/05/2009                						╨╠╠
╠╠лммммммммммьммммммммммймммммммомммммммммммммммммммммммйммммммммммммммммммомммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨	DescricaoЁ Executa sigaauto de inclusao de NF de Entrada de Municipio.                                                  ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Implantacao das rotinas referente a Gestao do Leite.                						                    ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨ParametrosЁ cMun    - Cod. do Municipio                                                                  	            ╨╠╠
╠╠╨ParametrosЁ aItens  - Array com itens da NF                                                              				╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Retorno   Ё Nenhum                                                                                						╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Usuario   Ё Microsiga                                                                                					╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Setor     Ё Gestao do Leite.                                                                        						╨╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
/*/
Static Function gravaNF(cMun,cEst,aItens)
/*
Local cForn,cLoja
Local cEvento,cDrcEvt,cProdut,nQuant,nValor
Local _aItens:={}
Local _aCab:={}
Local cInEvento:=""
Local xSetor := left(_cSetores,6)
Local xTES := ""

Private lMsErroAuto:=.F.

xTES :=POSICIONE("ZL2",1,xFilial("ZL2")+xSetor,"ZL2_TES")
cForn:=POSICIONE("ZL2",1,xFilial("ZL2")+xSetor,"ZL2_SA2COD")
cLoja:=POSICIONE("ZL2",1,xFilial("ZL2")+xSetor,"ZL2_SA2LJ")

If Empty(AllTrim(cForn)) .or. Empty(AllTrim(cLoja))
xMagHelpFis("Municipio",;
"O Municipio "+cMun+" nao possui fornecedor vinculado!",;
"Informe o codigo do fornecedor no cadastro do municipio!")
Return
EndIf

dbSelectArea("SF1")
dbSetOrder(1)
If dbSeek(xFilial("SF1")+_cNroNota+_cSerie+cForn+cLoja+"N")
xMagHelpFis("Falha","NF "+_cNroNota+" nao pode ser inserida por ja existir!","Gere novamente com outro numero!")
Return
EndIf

_aCab :={;
{"F1_TIPO","N"			  ,NIL},;	// Tipo da Nota = Beneficiamento.
{"F1_FORMUL"	,"S"		      ,NIL},;	// Formulario Proprio = Sim.
{"F1_DOC"		,_cNroNota         ,NIL},;	// Numero do Documento.
{"F1_SERIE"		,_cSerie 	      ,NIL},;	// Serie do Documento.
{"F1_PREFIXO"	,_cPrefixo 	      ,NIL},;	// Serie do Documento.
{"F1_EMISSAO"	,dDataBase	      ,NIL},;	// Data de Emissao.
{"F1_DESPESA"	,0			      ,NIL},;	// Despesa
{"F1_FORNECE"	,cForn			  ,NIL},;	// Codigo do Fornecedor.
{"F1_LOJA"	  	,cLoja		 	  ,NIL},;	// Loja do Fornecedor.
{"F1_ESPECIE"	,_cTpNF    	      ,NIL},;	// Especie do Documento.
{"F1_COND"		,"001"            ,NIL},;	// Condicao de Pagamento.
{"F1_DESCONT"	,0	    	      ,NIL},;	// Desconto
{"F1_SEGURO"	,0	    	      ,NIL},;	// Seguro
{"F1_FRETE"		,0	    	      ,NIL},;	// Frete
{"F1_L_TPNF"	,"M"			,NIL},;	// Tipo NF M-Municipio
{"F1_PESOL"		,0	              ,NIL}}	// Peso Liquido

For i:=1 To Len(aItens)

cEvento:=aItens[i,1]
cDrcEvt:=POSICIONE("ZL8",1,xFilial("ZL8")+cEvento,"ZL8_DESCRI")
cProdut:=aItens[i,2]
nQuant :=aItens[i,3]
nValor :=aItens[i,4]

dbSelectArea("SB1")
dbSetOrder(1)
dbSeek(xFilial("SB1")+cProdut)

aAdd(_aItens,{;
{"D1_ITEM",StrZero(i,3),NIL},;	// Sequencia Item Pedido
{"D1_COD"		,cProdut			  ,NIL},;	// Codigo do Produto
{"D1_QUANT"		,nQuant				  ,NIL},;	// Quantidade
{"D1_VUNIT"		,nValor/nQuant		  ,NIL},;	// Valor Unitario
{"D1_TOTAL"		,nValor        		  ,NIL},;	// Valor Total
{"D1_TES"		,SB1->B1_TE   		  ,NIL},;	// Tipo de Entrada - TES
{"D1_Local"		,SB1->B1_LOCPAD		  ,NIL},;	// Armazem Padrao do Produto
{"D1_SEGURO"	,0					  ,NIL},;	// Seguro
{"D1_VALFRE"	,0					  ,NIL},;	// Frete
{"D1_DESPESA"	,0					  ,NIL},;	// Despesa
{"D1_L_EVENT"	,cEvento		  	  ,NIL},;	// Descricao do Evento
{"D1_L_DESCR"	,cDrcEvt		  	  ,NIL}})	// Descricao do Evento

If i!=Len(aItens)
cInEventos:="'"+cEvento+"',"
Else
cInEventos:="'"+cEvento+"'"
EndIf

Next i

If Len(_aCab)>0 .And. Len(_aItens)>0

MATA103(_aCab,_aItens,3)

If lMsErroAuto

lDeuErro := .T.
MostraErro()

Else

nNroNota:=""

// Grava NF,Estado e Municipio nos eventos da ZLF
For zZ:=1 To Len(aPrdMun)
_cUpdate := "UPDATE " + RetSqlName("ZLF")
_cUpdate += " SET ZLF_F1SEEK = '"+xFilial("SF1")+_cNroNota+_cSerie+cForn+cLoja+"N"+"',"
_cUpdate += " ZLF_EST = '"+cEst+"',"
_cUpdate += " ZLF_MUN = '"+cMun+"'"
_cUpdate += " WHERE D_E_L_E_T_ = ' '"
_cUpdate += " AND ZLF_FILIAL  = '" + xFilial("ZLF") + "'"
_cUpdate += " AND ZLF_A2COD   = '" + aPrdMun[zZ,1] + "'"
_cUpdate += " AND ZLF_A2LOJA  = '" + aPrdMun[zZ,2] + "'"
_cUpdate += " AND ZLF_CODZLE  = '" + cCodMIX + "'"
_cUpdate += " AND ZLF_VERSAO  = '" + _cVersao + "'"
_cUpdate += " AND ZLF_SETOR   = '" + xSetor + "'"
//_cUpdate += " AND ZLF_EVENTO IN (" + cInEvento + ") "
_cUpdate += " AND ZLF_ACERTO = 'S'"
_cUpdate += " AND ZLF_TP_MIX = 'L' "
_cUpdate += " AND ZLF_EST <> ' ' "
_cUpdate += " AND ZLF_MUN <> ' ' "
lSqlOk := !(TCSqlExec(_cUpdate) < 0)
Next zZ

dbSelectArea("SF1")
dbSetOrder(1)
If dbSeek(xFilial("SF1")+_cNroNota+_cSerie+cForn+cLoja+"N")
RecLock("SF1",.F.)
SF1->F1_L_MIX	:= cCodMix
SF1->F1_L_SETOR	:= _cSetores
SF1->F1_L_TPNF := "M"
//SF1->F1_I_MENSA := "Relacao de Descontos:;"+GetDescImp(xFilial("SF1")+_cNroNota+_cSerie+cForn+cLoja+"N")+"NF referente aos produtores do municipio: "+GetEstMun(xFilial("SF1")+_cNroNota+_cSerie+cForn+cLoja+"N") // OBTEM MUNICIPIO
MsUnlock()
Else
xMagHelpFis("Falha","Nao foi possivel setar a NF "+_cNroNota+" como de Municipio por nao ter sido encontrada!",;
"Comunique ao Suporte!")
EndIf

EndIf
Else
xMagHelpFis("Falha","Nao foram encontrados itens a serem inseridos na NF.","Veririque se existem eventos Produtores do Municipio "+cMun+"-"+cEst)
EndIf

//Incrementa numero da NF
_cNroNota := NxtSX5Nota(_cSerie)
*/
Return

/*/
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммямммммммммммммммммммммммкммммммммммммммммммямммммммммммммммммммммммммммммммммммммммммммммммм╩╠╠
╠╠╨Programa  ЁGetMunPrd ╨ Autor Ё Microsiga             ╨ Data da Criacao  Ё 26/05/2009                						╨╠╠
╠╠лммммммммммьммммммммммймммммммомммммммммммммммммммммммйммммммммммммммммммомммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨	DescricaoЁ Obtem array com produtores e seus municipios para posteriormente gerar NFs									╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Implantacao das rotinas referente a Gestao do Leite.                						                    ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨ParametrosЁ Nenum                                                                                        				╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Retorno   Ё aRet[1] Cod. Municipio                                                                                		╨╠╠
╠╠╨Retorno   Ё aRet[2] Estado                                                                                        		╨╠╠
╠╠╨Retorno   Ё aRet[3] Cod. Produtor                                                                                 		╨╠╠
╠╠╨Retorno   Ё aRet[4] Cod. Loja                                                                                     		╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Usuario   Ё Microsiga                                                                              					    ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Setor     Ё Gestao do Leite.                                                                        						╨╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
/*/
Static Function GetMunPrd()

Local xAlias:="TMPPRD"
Local xMun:=""
Local xEst:=""
Local aRet:={}

cQry := " SELECT ZLF_EST,ZLF_MUN,ZLF_A2COD,ZLF_A2LOJA "
cQry += " FROM "+RetSqlName("ZLF")+" ZLF "
cQry += " WHERE ZLF.D_E_L_E_T_ = ' '"
cQry += " AND ZLF.ZLF_FILIAL = '" +xFilial("ZLF")+ "'"
cQry += " AND ZLF.ZLF_CODZLE = '" +cCodMIX+ "'"
cQry += " AND ZLF.ZLF_VERSAO = '" +_cVersao+ "'"
cQry += " AND ZLF.ZLF_SETOR IN (" + U_AjustSet(_cSetores) + ")"
//cQry += " AND SubString(ZLF.ZLF_A2COD,1,1) = 'P'"
cQry += " AND SubStr(ZLF.ZLF_A2COD,1,1) = 'P'"
cQry += " AND ZLF.ZLF_DEBCRE = 'C'"
cQry += " AND ZLF.ZLF_ACERTO = 'S'"
cQry += " AND ZLF.ZLF_TP_MIX = 'L'"
cQry += " AND ZLF.ZLF_EST != ' ' "
cQry += " AND ZLF.ZLF_MUN != ' ' "
cQry += " GROUP BY ZLF_EST,ZLF_MUN,ZLF_A2COD,ZLF_A2LOJA"
cQry += " ORDER BY ZLF_EST,ZLF_MUN,ZLF_A2COD,ZLF_A2LOJA"
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQry),xAlias, .T., .F. )

dbSelectArea(xAlias)
While (xAlias)->(!Eof())
	aAdd(aRet,{(xAlias)->ZLF_MUN,(xAlias)->ZLF_EST,(xAlias)->ZLF_A2COD,(xAlias)->ZLF_A2LOJA})
	(xAlias)->(dbSkip())
EndDo
(xAlias)->(dbCloseArea())

If Len(aRet) == 0
	xMagHelpFis("Falha","Nenhum Produtor encontrado!","Verique se existem produtores fechados para geracao das NF.")
EndIf

Return aRet


/*/
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммямммммммммммммммммммммммкммммммммммммммммммямммммммммммммммммммммммммммммммммммммммммммммммм╩╠╠
╠╠╨Programa  ЁGetDescNF ╨ Autor Ё                       ╨ Data da Criacao  Ё 16/07/2012                						╨╠╠
╠╠лммммммммммьммммммммммймммммммомммммммммммммммммммммммйммммммммммммммммммомммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨	DescricaoЁ Gera a mensagem que sera impressa na nota fiscal do produtor.												╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Implantacao das rotinas referente a Gestao do Leite.                						                    ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Retorno	 Ё _cMensagem - Mensagem que sera impressa na nota fiscal.                                        				╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨ParametrosЁ _cFil - Filial em que a nota do produtor foi gerada.                                                    		╨╠╠
╠╠╨		     Ё _cDoc - Numero da nota fiscal                                                                           		╨╠╠
╠╠╨			 Ё __cSerie - Serie da nota fiscal                                                                          		╨╠╠
╠╠╨			 Ё _cFornec - Codigo do Produtor                                                                           		╨╠╠
╠╠╨		     Ё _cLoja   - Loja do Produtor                                                                             		╨╠╠
╠╠╨			 Ё _nValBruto - Valor bruto da nota fiscal gerada                                                          		╨╠╠
╠╠╨			 Ё _nValICM   - Valor do ICMS gerado na nota fiscal                                                        		╨╠╠
╠╠╨		     Ё _cCodMix   - Codigo do mix                                                                              		╨╠╠
╠╠╨			 Ё _cVersMix  - Versao do mix                                                                             		╨╠╠
╠╠╨			 Ё _cSetor    - Codigo do Setor                                                                            		╨╠╠
╠╠╨			 Ё _cTpTribu  - Tipo de Tributacao                                                                        		╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Usuario   Ё Microsiga                                                                              					    ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Setor     Ё Gestao do Leite.                                                                        						╨╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
/*/

Static Function GetDescNF(_cFil,_cDoc,__cSerie,_cFornec,_cLoja,_nValBruto,_nValICM,_cCodMix,_cVersMix,_cSetor,_cTpTribu)

Local aArea 	:= GetArea()

/*
Local nRet	 	:=0
Local cQuery 	:= ""
Local cRet	  	:=""
Local nTotDesc	:=0
Local aTemp		:={}
Local dtAtual
*/

Local _cAliasSD1:= GetNextAlias()
Local _cAliasZLF:= ""
Local _cAliasFUNR := ""
Local _nVlrIncet:= 0
Local _nPreco := 0

Local _cMensagem:= ""
Local _nTotDeb  := 0
Local _cFiltro	:= ""
Local _nvlFret := 0
Local _nvlFun  := 0
Local _nvlSen  := 0
Local _nvlInc  := 0
Local _nPrcBase := Transform(Posicione("ZL8",1,xFilial("ZL8")+'010001',"ZL8_VALOR"),"@E 99.99")

Local _cFreteLit := "" //Rtrim(GetMv("LT_EVEDES"))
Local _cIncentiv := Rtrim(GetMv("LT_EVEINCE"))
Local _cFunrural := Rtrim(GetMv("LT_EVEINSS"))
Local _cAnaGordu:= Rtrim(GetMv("LT_ANAGORD"))

Local nVlrInd    := 0





dbSelectArea("ZL8")
ZL8->(dbSetOrder(1))//ZL8_FILIAL+ZL8_COD


// FUNRURAL
_nvlFun := SF1->F1_CONTSOC
//SENAR
_nvlSen := SF1->F1_VLSENAR

/*	   	//DESCONTO DE FRETE

IF ZL8->(dbSeek(xFilial("ZL8") + _cFreteLit))
_nvlFret := &(ZL8->ZL8_FORMULA)
ENDIF


// Incentivo
IF ZL8->(dbSeek(xFilial("ZL8") + _cIncentiv))
_nvlInc := &(ZL8->ZL8_FORMULA)
ENDIF
*/
If .T. //_cTpTribu == 'T' .Or. _cTpTribu == 'I'
	
	BeginSql alias _cAliasSD1
		SELECT
		(SUM(D1_TOTAL) / MAX(D1_QUANT)) PRECO,
		MAX(D1_QUANT) QUANT
		FROM
		%Table:SD1%
		WHERE
		D_E_L_E_T_ = ' '
		AND D1_FILIAL  = %Exp:_cFil%
		AND D1_DOC     = %Exp:_cDoc%
		AND D1_SERIE   = %Exp:__cSerie%
		AND D1_FORNECE = %Exp:_cFornec%
		AND D1_LOJA    = %Exp:_cLoja%
	EndSql
	
	
	dbSelectArea(_cAliasSD1)
	(_cAliasSD1)->(dbGoTop())
	
	If !(_cAliasSD1)->(Eof())
		_nPreco:= (_cAliasSD1)->PRECO
		_nPreco -= (_nvlFun+_nvlSen) / (_cAliasSD1)->QUANT
	EndIf
	
	
	
	dbSelectArea(_cAliasSD1)
	(_cAliasSD1)->(dbGoTop())
	
	If !(_cAliasSD1)->(Eof())
		
		
		_cAliasZLF:= GetNextAlias()
		
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁQuery para selecionar os eventos de debito que devem aparecerЁ
		//Ёna nota fiscal do produtor, nas informacoes adicionais.      Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		
		BeginSql alias _cAliasZLF
			SELECT
			ZLF.ZLF_EVENTO,
			MAX(ZL8.ZL8_DESCRI) DESCRICAO,
			SUM(ZLF.ZLF_TOTAL) AS DEBITO
			FROM
			%Table:ZLF% ZLF
			JOIN %Table:ZL8% ZL8 ON ZL8.ZL8_COD = ZLF.ZLF_EVENTO 
				AND ZL8.ZL8_TPEVEN IN ('A','F') AND ZL8.ZL8_IMPNF = 'S' AND ZL8.%NotDel%

			WHERE
			ZLF.ZLF_FILIAL = %Exp:xFilial("ZLF")%
			AND ZL8.ZL8_FILIAL = %Exp:xFilial("ZL8")%
			AND ZLF.ZLF_A2COD  = %Exp:_cFornec%
			AND ZLF.ZLF_A2LOJA = %Exp:_cLoja%
			AND ZLF.ZLF_CODZLE = %Exp:_cCodMix%
			AND ZLF.ZLF_SETOR  = %Exp:_cSetor%
			AND ZLF.ZLF_DEBCRE = 'D'
			AND ZLF.%NotDel%
			GROUP BY
			ZLF.ZLF_EVENTO
		EndSql
		
		
		
		// Busca o Teor de Gordura
		/*
		dbSelectArea("ZL9")//GLT - TIPOS DE FAIXAS
		dbSetOrder(1)//ZL9_FILIAL+ZL9_COD
		If dbSeek(xFILIAL("ZL9")+_cAnaGordu)
		*/
		//Obtem o valor que esta na Analise da Qualidade.
		//Se nao encontrar nenhuma analise, retorna zero
		//nVlrInd := u_getMIndice(xFILIAL("ZL8"),ZL2->ZL2_COD,SA2->A2_COD,SA2->A2_LOJA,_cAnaGordu,"A",ZLE->ZLE_DTFIM)
//		nVlrInd := round(nVlrInd,4)
		//	EndIf
		/*
		_cMensagem += "Teor De Gordura = " + AllTrim(Transform( nVlrInd ,"@E 999,999,999.99")) + " " + _ENTER
		_cMensagem += "INCENTIVO = " + AllTrim(Transform( _nvlInc ,"@E 999,999,999.99")) + " " + _ENTER
		_cMensagem += "FUNRURAL = " + AllTrim(Transform(_nvlFun ,"@E 999,999,999.99")) + " " + _ENTER
		_cMensagem += "FRETE = " + AllTrim(Transform(_nvlFret,"@E 999,999,999.99")) + " " + _ENTER
		*/
		_cMensagem += " Lei.No.12.669, de junho de 2012: Comunicado ao fornecedor de leite: No mes de "+AllTrim(MesExtenso(Month(MonthSum(dDataBase,2))))+" de "+AllTrim(str(year(MonthSum(dDataBase,2))))+"		
		_cMensagem += " o preco base a ser pago por litro de leite sera R$ "+_nPrcBase+". As variaveis que compoem o preco como ex. bonif. volume, bonif. mercado e bonif.qualidade serao medidas no decorrer do "
		_cMensagem += " referido mes e acrescidas ao preco base conforme praxe/necessidade mercado. | "
		_cMensagem += " |  "+_cMsgNota+" |  "
		_cMensagem += "Cod. Produtor: " +SA2->A2_COD +"-"+SA2->A2_LOJA+" " + _ENTER		
		_cMensagem += "| Valor do INSS(Funrural) = R$" + AllTrim(Transform(_nvlFun,"@E 999,999.99")) + " "+ _ENTER
		_cMensagem += "| Valor do SENAR = R$" + AllTrim(Transform(_nvlSen,"@E 999,999.99")) + " "+ _ENTER
		_cMensagem += "referente a leite recebido no periodo de "+dtoc(ZLE->ZLE_DTINI)+" a "+dtoc(ZLE->ZLE_DTFIM) + " "+ _ENTER
		_cMensagem += "| PreГo liquido p/ litro: R$"+ AllTrim(Transform(Round(_nPreco,4),"@E 999.9999")) + _ENTER
		
		_nTotDeb   += (_nvlFun+_nvlSen)
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//ЁEfetua a deducao dos eventos de debito que devem aparecer nas informacoes adicionais da nota.Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		dbSelectArea(_cAliasZLF)
		(_cAliasZLF)->(dbGoTop())
		
		While !(_cAliasZLF)->(Eof())
		
			_cMensagem += Alltrim((_cAliasZLF)->DESCRICAO) + " = " + AllTrim(Transform((_cAliasZLF)->DEBITO,"@E 999,999,999.99")) + " " + _ENTER
			_nTotDeb   += (_cAliasZLF)->DEBITO
		
		(_cAliasZLF)->(dbSkip())
		EndDo

		_cMensagem += "TOT.CRED = " + AllTrim(Transform(_nValBruto,"@E 999,999,999.99")) + " "  + _ENTER
		_cMensagem += "TOT.DEB. = "	+ AllTrim(Transform(_nTotDeb,"@E 999,999,999.99"))   + " " + _ENTER
		_cMensagem += "SALDO = " 	+ AllTrim(Transform(_nValBruto - _nTotDeb,"@E 999,999,999.99")) + _ENTER
		
		//зддддддддддддддддддддддддддддддддддддд©
		//ЁFinaliza a area criada anteriormente.Ё
		//юддддддддддддддддддддддддддддддддддддды
		dbSelectArea(_cAliasZLF)
		(_cAliasZLF)->(dbCloseArea())
	
		
	EndIf
	
	dbSelectArea(_cAliasSD1)
	(_cAliasSD1)->(dbCloseArea())
	
EndIf



RestArea(aArea)

Return _cMensagem


/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  ЁRaytoDesc ╨Autor  Ё Microsiga          ╨ Data Ё  00/00/00   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     Ё Converte array com recepcoes de leite para o layout        ╨╠╠
╠╠╨          Ё de impressao na Danfe.                                     ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨ParametrosЁ aTemp - Array {cDia,cQuant}                                ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function RaytoDesc(aTemp)

Local cRet:=""
Local cCabec:=""
Local cString1:=""
Local cString2:=""
Local cString3:=""
Local cString4:=""
Local nAux:=0

For x:=1 To Len(aTemp)
	nAux++
	If nAux==1
		cString1+=aTemp[x,1]+"-"+aTemp[x,2]+"   "
		cCabec+="Dia  Vol   "
	EndIf
	If nAux==2
		cString2+=aTemp[x,1]+"-"+aTemp[x,2]+"   "
	EndIf
	If nAux==3
		cString3+=aTemp[x,1]+"-"+aTemp[x,2]+"   "
	EndIf
	If nAux==4
		cString4+=aTemp[x,1]+"-"+aTemp[x,2]+"   "
		nAux:=0
	EndIf
Next x

cRet:=cCabec+";"+cString1+";"+cString2+";"+cString3+";"+cString4+";"

Return(cRet)


/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  ЁgetDescMu ╨ Autor Ё Microsiga          ╨ Data Ё  00/00/00   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     Ё Obtem descricao dos eventos de impostos.                   ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Imprime descricao dos eventos de impostos na mensagem da NF╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function GetDescImp(cSeek)

Local cDescMun := ""
Local aArea := GetArea()
Local nRet:=0
Local cQuery := ""
Local cGrpImp := "000007" // Grupo de evento dos impostos


cQuery := " SELECT SUM(ZLF.ZLF_TOTAL) AS TOTAL "
cQuery += " FROM "+RetSqlName("ZLF")+" ZLF  "
cQuery += " JOIN " +RetSqlName("ZL8")+" ZL8 ON ZLF.ZLF_EVENTO = ZL8.ZL8_COD "
cQuery += " WHERE ZLF.D_E_L_E_T_ = ' ' AND ZL8.D_E_L_E_T_ = ' '"
cQuery += " AND ZLF.ZLF_FILIAL = '"+xFilial("ZLF")+"' "
cQuery += " AND ZL8.ZL8_FILIAL = '"+xFilial("ZL8")+"' "
cQuery += " AND ZLF_F1SEEK = '"+cSeek+"' "
cQuery += " AND ZLF_DEBCRE = 'D' "
cQuery += " AND ZL8_GRUPO  != '"+cGrpImp+"' "

If Select("TRD") <> 0
	TRD->(dbCloseArea("TRD"))
EndIf

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRD", .T., .F. )

If !TRD->(Eof())
	If TRD->TOTAL > 0
		cDescMun += "999999-DESCONTOS EM FOLHA -----> "+TransForm(TRD->TOTAL,"@E 999,999,999.99")+";"
	EndIf
EndIf
TRD->(dbCloseArea())

cQuery := " SELECT ZLF.ZLF_EVENTO AS EVENTO, SUM(ZLF.ZLF_TOTAL) AS TOTAL "
cQuery += " FROM "+RetSqlName("ZLF")+" ZLF  "
cQuery += " JOIN " +RetSqlName("ZL8")+" ZL8 ON ZLF.ZLF_EVENTO = ZL8.ZL8_COD "
cQuery += " WHERE ZLF.D_E_L_E_T_ = ' ' AND ZL8.D_E_L_E_T_ = ' '"
cQuery += " AND ZLF.ZLF_FILIAL = '"+xFilial("ZLF")+"' "
cQuery += " AND ZL8.ZL8_FILIAL = '"+xFilial("ZL8")+"' "
cQuery += " AND ZLF_F1SEEK = '"+cSeek+"' "
cQuery += " AND ZLF_DEBCRE = 'D' "
cQuery += " AND ZL8_GRUPO  = '"+cGrpImp+"' "
cQuery += " GROUP BY ZLF_EVENTO "

If Select("TRD") <> 0
	TRD->(dbCloseArea("TRD"))
EndIf

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRD", .T., .F. )

While !TRD->(Eof())
	If TRD->TOTAL > 0
		cDescMun+=TRD->EVENTO+"-"+POSICIONE("ZL8",1,xFilial("ZL8")+TRD->EVENTO,"ZL8_DESCRI")+"--->"+TransForm(TRD->TOTAL,"@E 999,999,999.99")+";"
	EndIf
	TRD->(dbSkip())
EndDo
TRD->(dbCloseArea())

RestArea(aArea)
Return cDescMun

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  Ё GetEstMun╨ Autor Ё Microsiga          ╨ Data Ё  00/00/00   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     Ё Nome do estado e Municipio do Produtor.                    ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Imprime descricao do municipio na mensagem da Nota.        ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function GetEstMun(cSeek)

Local cRet  := ""
Local aArea := GetArea()

cQuery := " SELECT ZLF_EST,ZLF_MUN "
cQuery += " FROM "+RetSqlName("ZLF")+" ZLF  "
cQuery += " WHERE ZLF.D_E_L_E_T_ = ' ' "
cQuery += " AND ZLF.ZLF_FILIAL = '"+xFilial("ZLF")+"' "
cQuery += " AND ZLF_F1SEEK = '"+cSeek+"' "
cQuery += " AND ZLF_EST != ' ' "
cQuery += " AND ZLF_MUN != ' ' "
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRD", .T., .F. )

If !TRD->(Eof())
	dbSelectArea("CC2")
	dbSetOrder(1)
	If dbSeek(xFilial("CC2")+TRD->ZLF_EST+TRD->ZLF_MUN)
		cRet:=AllTrim(CC2->CC2_MUN)+"-"+CC2->CC2_EST+";"
	EndIf
EndIf
TRD->(dbCloseArea())

RestArea(aArea)
Return(cRet)

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  Ё GetTitPr ╨ Autor Ё TOTVS              ╨ Data Ё  07/05/12   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     Ё Mostra uma lista de titulos existentes no financeiro do    ╨╠╠
╠╠╨          Ё produtor em questЦo.                                       ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Usado para buscar o titulo referente a nota de entrada dos ╨╠╠
╠╠╨          Ё produtores pessoa juridica, que nao tem a nota emitida pelo╨╠╠
╠╠╨          Ё laticinio, ou seja, o proprio produtor/empresa emite a NF. ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function GetTitPr()

Local oDlgTit
Local nSelItem := 0
Local lOk      := .F.
Local lRet     := .F.
Local cAlias   := GetNextAlias()

Private oBrt
Private aDadTit := {}

cQuery := " SELECT E2_FILIAL,E2_PREFIXO,E2_NUM,E2_PARCELA,E2_TIPO,E2_LOJA,E2_VALOR,E2_FORNECE,E2_LOJA,E2_EMISSAO "
cQuery += " FROM  " + RetSqlName("SE2") + " SE2 "
cQuery += " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND E2_FILIAL    = '"+ xFilial("SE2") +"'"
cQuery += " AND E2_FORNECE   = '"+ SA2->A2_COD    +"'"
cQuery += " AND E2_LOJA      = '"+ SA2->A2_LOJA   +"'"
cQuery += " AND E2_VENCTO    <='"+ _cVencto        +"'"
cQuery += " AND E2_TIPO      = 'NF '"
cQuery += " AND E2_VALOR     > 0 "
cQuery += " AND E2_SALDO     > 0 "
//cQuery += " AND E2_PREFIXO IN (" + GetSqlSeq(AllTrim(GETMV("LT_PRFNOTA")),"\") + ") "// Prefixo do Titulo
cQuery += " AND E2_PREFIXO IN " + FormatIn(AllTrim(GETMV("LT_PRFNOTA")),"\") // Prefixo do Titulo
cQuery += " ORDER BY E2_EMISSAO DESC "
TCQUERY cQuery NEW ALIAS(cAlias)

dbSelectArea(cAlias)
(cAlias)->(dbGoTop())

While (cAlias)->(!Eof())
	Aadd(aDadTit,{(cAlias)->E2_FILIAL,(cAlias)->E2_PREFIXO,(cAlias)->E2_NUM,(cAlias)->E2_PARCELA,StoD((cAlias)->E2_EMISSAO),(cAlias)->E2_VALOR})
	(cAlias)->(dbSkip())
EndDo
(cAlias)->(dbcloseArea())

If Len(aDadTit) > 0
	
	//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Tela de Selecao do Titulo                                           Ё
	//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	DEFINE MSDIALOG oDlgTit FROM 0,0 TO 220,415 PIXEL TITLE 'SELECAO DO TITULO - PRODUTOR QUE EMITE NOTA A COOPERATIVA'
	@007,005 say "Produtor: "+SA2->A2_COD+"-"+SA2->A2_LOJA+"-"+Left(SA2->A2_NOME,20)+"  R$: "+TransForm(_nSldPro,"@E 999,999,999.99") Pixel Of oDlgTit
	
	oBrT := VCBrowse():New(020,001,210,70,,{'Filial','Prefixo','Numero','Parcela','Emissao','Valor'},{20,20,30,30,30,30,30}, oDlgTit, ,,,,{||},,,,,,,.F.,,.T.,,.F.,,, )
	oBrT:SetArray(aDadTit)
	If len(aDadTit) > 0
		oBrT:bLine := {||{;
		aDadTit[oBrT:nAt,01], ;
		aDadTit[oBrT:nAt,02], ;
		aDadTit[oBrT:nAt,03], ;
		aDadTit[oBrT:nAt,04], ;
		aDadTit[oBrT:nAt,05], ;
		TransForm(aDadTit[oBrT:nAt,06],"@E 999,999,999,999.99") } }
		//oBrT:bLDblClick := {|| nSelItem:=aDadTit[oBrT:nAt][2]} //Acionado pelo clique do mouse
	EndIf
	
	TButton():New(095,005, 'Confirmar', oDlgTit,{|| lOk:=.T. , If( VldTit(),oDlgTit:End(),lOk:=.F. )  },40,10,,,,.T.)
	TButton():New(095,060, 'Nenhum'   , oDlgTit,{|| oDlgTit:End()                                       },40,10,,,,.T.)
	ACTIVATE MSDIALOG oDlgTit CENTERED
	
	If !lOk
		MsgAlert("NЦo foi selecionado nenhum Titulo! Logo nЦo serА realizado fechamento deste produtor.")
	Else
		lRet := .T.
	EndIf
	
Else
	
	xMagHelpFis("INFORMAгцO",;
	"O produtor: " + SA2->A2_COD + '/' + SA2->A2_LOJA + '-' + SA2->A2_NOME + " emite nota fiscal a cooperativa, no entanto nЦo foi encontrada a nota referente ao fechamento corrente.",;
	"Desta forma nЦo serА realizado o fechamento do produtor, favor realizar a inserГЦo do documento de entrada antes de efetuar o fechamento.")
	
EndIf

Return(lRet)

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  Ё VldTit   ╨ Autor Ё TOTVS              ╨ Data Ё  09/05/12   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     Ё Verifica se o titulo selecionado tem valor igual ao valor  ╨╠╠
╠╠╨          Ё do saldo do produtor.                                      ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Uso       Ё GetTitPr()                                                 ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function VldTit()

Local lRet := .T.

dbSelectArea("SE2")
SE2->(dbSetOrder(1))//E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA
If SE2->(dbSeek( aDadTit[oBrT:nAt,01]+aDadTit[oBrT:nAt,02]+aDadTit[oBrT:nAt,03]+aDadTit[oBrT:nAt,04]+"NF "+SA2->A2_COD+SA2->A2_LOJA ))
	If SE2->E2_VALOR <> _nSldPro
		MsgAlert( "O valor selecionado R$ "+AllTrim(Str(SE2->E2_VALOR))+" И diferente do saldo do produtor: R$ "+AllTrim(Str(_nSldPro))  )
		lRet := .F.
	Else
		//Atualiza as variaveis de busca do titulo na compensacao
		_cNroNota := SE2->E2_NUM
		_cPrefixo := SE2->E2_PREFIXO
		_cParcNF  := SE2->E2_PARCELA
		
		//Somente se o titulo selecionado tiver o mesmo valor do saldo a pagar ao Fretista que
		//altera o titulo informado pelo usuario
		RecLock("SE2",.F.)
		SE2->E2_L_MIX   := cCodMix
		SE2->E2_L_VERSA := _cVersao
		SE2->E2_L_SETOR := ZL2->ZL2_COD
		SE2->E2_L_BANCO := SA2->A2_BANCO
		SE2->E2_L_AGENC := SA2->A2_AGENCIA
		SE2->E2_L_CONTA := SA2->A2_NUMCON
		SE2->E2_DATALIB := dDataBase
		SE2->E2_USUALIB := AllTrim(SubStr(cUsuario,7,15))
		MsUnlock()
	EndIf
EndIf

Return(lRet)

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  Ё GetSqlSeq╨ Autor Ё TOTVS              ╨ Data Ё  07/05/12   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     Ё Converte string com separador em formatcao IN para SQL     ╨╠╠
╠╠╨          Ё DE: 1;2;3;   PARA: ('1','2','3')                           ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Parametro Ё cValores - String                                          ╨╠╠
╠╠╨          Ё cChar    - Caracter separador                              ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function GetSqlSeq(cValores,cChar)

Local cRet := ""
Local nI   := 0
Local aAux := StrToKarr(cValores,cChar)

For nI := 1 To Len(aAux)
	
	cRet += "'"+aAux[nI]+"'"
	
	If nI!=len(aAux)
		cRet+=","
	EndIf
Next nI

Return(cRet)

/*/
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммямммммммммммммммммммммммкммммммммммммммммммямммммммммммммммммммммммммммммммммммммммммммммммм╩╠╠
╠╠╨Programa  Ё GrvZLF   ╨ Autor Ё                       ╨ Data da Criacao  Ё 29/05/2012                						╨╠╠
╠╠лммммммммммьммммммммммймммммммомммммммммммммммммммммммйммммммммммммммммммомммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Descricao Ё Funcao usada para realizar a gravacao dos eventos automaticos e dos eventos de debitos referentes a convenios╨╠╠
╠╠╨          Ё e emprestimos.																					            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Fechamento do Leite.            						                                                        ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨ParametrosЁ cEvento - Codigo do Evento			       									          						╨╠╠
╠╠╨			 Ё nValor  - Valor do Evento			       									          						╨╠╠
╠╠╨			 Ё cSeek   - Conteudo do indice para identificar o Titulo(SE2)					          						╨╠╠
╠╠╨			 Ё lGrvZLF - Se .T. grava novo registro na ZLF mesmo se o evento ja existir, se .F. e nao	existir o registro  ╨╠╠
╠╠╨			 Ё 			 na ZLF grava um novo.																				╨╠╠
╠╠╨			 Ё lAltZLF - Se .T. indica para alterar um registro na ZLF, se .F. nao faz nada.								╨╠╠
╠╠╨			 Ё _cSeq    - Codigo Sequencial do Evento. Se vazio eh porque sera feito inclusao na ZLF, se informado eh porque ╨╠╠
╠╠╨			 Ё 			 se trata de alteracao de algum registro na ZLF.													╨╠╠
╠╠╨			 Ё cFunName- Nome da Static Function que chamou a GrvZLF().														╨╠╠
╠╠╨			 Ё cLinha  - Codigo da linha.																					╨╠╠
╠╠╨			 Ё nSE2VLR - Valor do titulo na SE2.																			╨╠╠
╠╠╨			 Ё nSE2SLD - Saldo do titulo na SE2.																			╨╠╠
╠╠╨			 Ё dSE2VEN - Data de vencimento do titulo na SE2.																╨╠╠
╠╠╨			 Ё cSE2HIS - Historico do titulo na SE2.																		╨╠╠
╠╠╨			 Ё nSE2JUR - Juros do titulo na SE2.																			╨╠╠
╠╠╨			 Ё nSE2ACRES- Saldo do acrescimo do titulo na SE2.																╨╠╠
╠╠╨			 Ё _cCodForn- Codigo do Fornecedor.																				╨╠╠
╠╠╨			 Ё _cLojForn- Loja do Fornecedor.																				╨╠╠
╠╠╨			 Ё _cTpTrib - Tipo de tributacao.																				╨╠╠
╠╠╨			 Ё _cFil    - Filial para geracao dos eventos, pois podem existir debitos de outros filiais, mas os eventos 	╨╠╠
╠╠╨			 Ё 			  devem ser gerados somente na filial que esta ocorrendo o fechamento.								╨╠╠
╠╠╨			 Ё_lFecham  - Como os titulos do tipo financeiro nao possuem um tipo de tributacao o evento referente a eles    ╨╠╠
╠╠╨			 Ё			  deve entrar com o status indicando o seu fechamento.											    ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Retorno   Ё Nada       	  							                    	           									╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Usuario   Ё Microsiga                                                                                					╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Setor     Ё Gestao do Leite.                                                                        						╨╠╠
╠╠лммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						╨╠╠
╠╠лммммммммммяммммммммммяммммммммммммммммммммммммммммммммммммммммммммммммммяммммммммммммммммммммммммммммммммммяммммммммммммм╧╠╠
╠╠╨Autor     Ё Data     Ё Motivo da Alteracao  				               ЁUsuario(Filial+Matricula+Nome)    ЁSetor        ╨╠╠
╠╠╨ддддддддддеддддддддддеддддддддддддддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддеддддддддддддд╨╠╠
╠╠╨          Ё          Ё                                                  Ё                                  Ё   	        ╨╠╠
╠╠╨----------Ё----------Ё--------------------------------------------------Ё----------------------------------Ё-------------╨╠╠
╠╠╨          Ё          Ё                    							   Ё                                  Ё 			╨╠╠
╠╠╨----------Ё----------Ё--------------------------------------------------Ё----------------------------------Ё-------------╨╠╠
╠╠хммммммммммоммммммммммоммммммммммммммммммммммммммммммммммммммммммммммммммоммммммммммммммммммммммммммммммммммоммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
/*/

Static Function GrvZLF(cEvento,nValor,cSeek,lGrvZLF,lAltZLF,_cSeq,cFunName,cLinha,;
nSE2VLR,nSE2SLD,dSE2VEN,cSE2HIS,nSE2JUR,nSE2ACRES,;
_cCodForn,_cLojForn,_cTpTrib,_cFil,_lFecham)

//зддддддддддддддддддддддддддддддддддд©
//ЁEfetua o backup da filial corrente.Ё
//юддддддддддддддддддддддддддддддддддды
Local _cBkpFil      := cFilAnt

Local _cSeekRet     := ""

DEFAULT _cSeq   	:= LastZLF()
DEFAULT cSeek   	:= ""
DEFAULT lGrvZLF 	:= .T.
DEFAULT lAltZLF 	:= .F.
DEFAULT nSE2VLR 	:= 0
DEFAULT nSE2SLD 	:= 0
DEFAULT dSE2VEN 	:= CTOD("")
DEFAULT cSE2HIS 	:= ""
DEFAULT nSE2JUR 	:= 0
DEFAULT nSE2ACRES	:= 0
DEFAULT _lFecham    := .F.

//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁPosiciona na filial de fechamento para gravacao ou alteracaoЁ
//Ёde um determinado evento.                                   Ё
//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
cFilAnt:= _cFilEvent

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt))

dbSelectArea("ZL8")
ZL8->(dbSetOrder(1))//ZL8_FILIAL+ZL8_COD
ZL8->(dbSeek(xFilial("ZL8") + cEvento))

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//Ё Se altera a ZLF. Usado quando o Evento foi lancado na ZLF.                          Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
If lAltZLF
	//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Posiciona na ZLF para alterar o campo ZLF_L_SEEK do registro.                             Ё
	//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	dbSelectArea("ZLF")
	ZLF->(dbSetOrder(1))//ZLF_FILIAL + ZLF_CODZLE + ZLF_VERSAO + ZLF_A2COD + ZLF_A2LOJA + ZLF_EVENTO + ZLF_SEQ
	If ZLF->(dbSeek(xFilial("ZLF") + cCodMIX + _cVersao + _cCodForn + _cLojForn + cEvento + _cSeq))
		//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Gravacao dos dados.                                                    Ё
		//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		dbSelectArea("ZLF")
		RecLock("ZLF",.F.)
		ZLF->ZLF_L_SEEK := cSeek
		ZLF->(MsUnlock())
	EndIf
	
	Return(ZLF->ZLF_FILIAL + ZLF->ZLF_CODZLE + ZLF->ZLF_VERSAO + ZLF->ZLF_A2COD + ZLF->ZLF_A2LOJA + ZLF->ZLF_EVENTO + ZLF->ZLF_SEQ)
	
Else
	//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Posiciona na ZLF para verificar se ja existe um registro para o mesmo evento.                     Ё
	//Ё Se existir e a variavel lGrvZLF estiver como .T., ele grava um novo registro para o mesmo evento. Ё
	//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	dbSelectArea("ZLF")
	ZLF->(dbSetOrder(1))//ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_A2COD+ZLF_A2LOJA+ZLF_EVENTO+ZLF_SEQ
	If ZLF->(dbSeek(xFilial("ZLF") + cCodMIX + _cVersao + _cCodForn + _cLojForn + cEvento))
		//If ZLF->(ZLF_FILIAL+ZLF_CODZLE+_cVersao+ZLF_A2COD+ZLF_A2LOJA+ZLF_EVENTO) == xFilial("ZLF")+cCodMIX+_cVersao+SA2->A2_COD+SA2->A2_LOJA+cEvento
		
		If lGrvZLF
			
			//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//Ё Alimenta as variaveis de memoria.                                      Ё
			//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			RegToMemory("ZLF",.F.)
			
			//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//Ё Gravacao dos dados.                                                    Ё
			//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			dbSelectArea("ZLF")
			RecLock("ZLF",.T.)
			For nContador := 1 To FCount()
				If ("FILIAL" $ FieldName(nContador) )
					FieldPut(nContador,xFilial("ZLF"))
				ElseIf ("EVENTO" $ FieldName(nContador) )
					FieldPut(nContador,cEvento)
				ElseIf ("DCREVE" $ FieldName(nContador) )
					FieldPut(nContador,cSE2HIS)// ZL8->ZL8_DESCRI)
				ElseIf ("QTDBOM" $ FieldName(nContador) )
					FieldPut(nContador,0)
				ElseIf ("QTDACI" $ FieldName(nContador) )
					FieldPut(nContador,0)
				ElseIf ("VLRLTR" $ FieldName(nContador) )
					FieldPut(nContador,0)
				ElseIf ("TOTAL" $ FieldName(nContador) )
					FieldPut(nContador,nValor)
				ElseIf ("DEBCRE" $ FieldName(nContador) )
					FieldPut(nContador,ZL8->ZL8_DEBCRE)
				ElseIf ("ORIGEM" $ FieldName(nContador) )
					FieldPut(nContador,"F")
				ElseIf ("L_SEEK" $ FieldName(nContador) )
					FieldPut(nContador,cSeek)
				ElseIf ("SEQ" $ FieldName(nContador) )
					FieldPut(nContador,_cSeq)
				ElseIf ("VLRPAG" $ FieldName(nContador) )
					FieldPut(nContador,0)
				ElseIf ("LINROT" $ FieldName(nContador) .And. !Empty(cLinha) ) // by Abrahao em 23/03/09
					FieldPut(nContador,cLinha)
					//ElseIf ("FILENT" $ FieldName(nContador))//Alterado 29/09/10
					//	FieldPut(nContador,U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,dDataBase) )
				ElseIf ("SE1VLR" $ FieldName(nContador))//Alterado 14/10/10
					FieldPut(nContador,nSE2VLR )
				ElseIf ("SE1SLD" $ FieldName(nContador))//Alterado 14/10/10
					FieldPut(nContador,nSE2SLD )
				ElseIf ("SE1VEN" $ FieldName(nContador))//Alterado 14/10/10
					FieldPut(nContador,dSE2VEN )
				ElseIf ("SE1HIS" $ FieldName(nContador))//Alterado 14/10/10
					FieldPut(nContador,cSE2HIS )
				ElseIf ("SE1JUR" $ FieldName(nContador))//Alterado 20/10/10
					FieldPut(nContador,nSE2JUR )
				ElseIf ("TRIBUT" $ FieldName(nContador))
					FieldPut(nContador,_cTpTrib )
				ElseIf ("ACERTO" $ FieldName(nContador) .And. _lFecham)
					FieldPut(nContador,"S")
				ElseIf ("STATUS" $ FieldName(nContador) .And. _lFecham)
					FieldPut(nContador,"F")
				Else
					FieldPut(nContador,M->&(FieldName(nContador)))
				EndIf
			Next nContador
			
			ZLF->(MsUnlock())
			
		EndIf
	Else
		//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
		//Ё Posiciona na ZLF para obter dados para gerar um novo registro na propria ZLF.             Ё
		//Ё O novo registro criado possui os mesmos valores nos campos, exceto para os campos abaixo. Ё
		//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
		dbSelectArea("ZLF")
		ZLF->(dbSetOrder(1))//ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_A2COD+ZLF_A2LOJA+ZLF_EVENTO+ZLF_SEQ
		If ZLF->(dbSeek(xFilial("ZLF") + cCodMIX + _cVersao + _cCodForn + _cLojForn))
			//If ZLF->(ZLF_FILIAL+ZLF_CODZLE+_cVersao+ZLF_A2COD+ZLF_A2LOJA) == xFilial("ZLF")+cCodMIX+_cVersao+SA2->A2_COD+SA2->A2_LOJA
			//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//Ё Alimenta as variaveis de memoria.                                      Ё
			//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			RegToMemory("ZLF",.F.)
			
			//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//Ё Gravacao dos dados.                                                    Ё
			//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			dbSelectArea("ZLF")
			RecLock("ZLF",.T.)
			For nContador := 1 To FCount()
				If ("FILIAL" $ FieldName(nContador) )
					FieldPut(nContador,xFilial("ZLF"))
				ElseIf ("EVENTO" $ FieldName(nContador) )
					FieldPut(nContador,cEvento)
				ElseIf ("DCREVE" $ FieldName(nContador) )
					FieldPut(nContador,cSE2HIS) //ZL8->ZL8_DESCRI)
				ElseIf ("ENTMIX" $ FieldName(nContador) )
					FieldPut(nContador,ZL8->ZL8_MIX)
				ElseIf ("QTDBOM" $ FieldName(nContador) )
					FieldPut(nContador,0)
				ElseIf ("QTDACI" $ FieldName(nContador) )
					FieldPut(nContador,0)
				ElseIf ("VLRLTR" $ FieldName(nContador) )
					FieldPut(nContador,0)
				ElseIf ("TOTAL" $ FieldName(nContador) )
					FieldPut(nContador,nValor)
				ElseIf ("DEBCRE" $ FieldName(nContador) )
					FieldPut(nContador,ZL8->ZL8_DEBCRE)
				ElseIf ("ORIGEM" $ FieldName(nContador) )
					FieldPut(nContador,"F")
				ElseIf ("L_SEEK" $ FieldName(nContador) )
					FieldPut(nContador,cSeek)
				ElseIf ("SEQ" $ FieldName(nContador) )
					FieldPut(nContador,_cSeq)
				ElseIf ("VLRPAG" $ FieldName(nContador) )
					FieldPut(nContador,0)
				ElseIf ("LINROT" $ FieldName(nContador) .And. !Empty(cLinha) ) // by Abrahao em 23/03/09
					FieldPut(nContador,cLinha)
					//ElseIf ("FILENT" $ FieldName(nContador) )//Alterado 29/09/10
					//	FieldPut(nContador,U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,dDataBase))
				ElseIf ("SE1VLR" $ FieldName(nContador))//Alterado 14/10/10
					FieldPut(nContador,nSE2VLR )
				ElseIf ("SE1SLD" $ FieldName(nContador))//Alterado 14/10/10
					FieldPut(nContador,nSE2SLD )
				ElseIf ("SE1VEN" $ FieldName(nContador))//Alterado 14/10/10
					FieldPut(nContador,dSE2VEN )
				ElseIf ("SE1HIS" $ FieldName(nContador))//Alterado 14/10/10
					FieldPut(nContador,cSE2HIS )
				ElseIf ("SE1JUR" $ FieldName(nContador))//Alterado 20/10/10
					FieldPut(nContador,nSE2JUR )
				ElseIf ("TRIBUT" $ FieldName(nContador))
					FieldPut(nContador,_cTpTrib )
				ElseIf ("ACERTO" $ FieldName(nContador) .And. _lFecham)
					FieldPut(nContador,"S")
				ElseIf ("STATUS" $ FieldName(nContador) .And. _lFecham)
					FieldPut(nContador,"F")
				Else
					FieldPut(nContador,M->&(FieldName(nContador)))
				EndIf
			Next nContador
			
			ZLF->(MsUnlock())
			
			/*
			//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//ЁInserido esta possibilidade                    Ё
			//Ёvisa ao nao encontrar um evento com o codigo e loja do associado ou              Ё
			//Ёnao encontrar um evento gerado na ZLF com o codigo e loja                        Ё
			//Ёisto pode indicar que se trata de debito de uma associacao ou um                 Ё
			//Ёdebito referente a um cooperado em determinada loja que nao teve saldo           Ё
			//Ёno fechamento anterior para quitar suas dividas e serao cobradas neste fechamentoЁ
			//Ёem uma outra loja de fechamento.                                                 Ё
			//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			*/
		Else
			
			// Se For necessario incluir o evento, usar funcao abaixo, disponivel em AGLT020
			// gEvtPrd(cpFilial,cpMix,_cVersao,cpSetor,cpLinha,cpEvento,cpEveDC,cpEveMix,cpForn,cpLoja,nForm)
			/*
			lDeuErro := .T.
			If _lNovoLayout
			//oObj:SaveLog("ERRO 18 - Produtor "+AllTrim(SA2->A2_COD+SA2->A2_LOJA)+" - "+cFunName)
			EndIf
			xMagHelpFis("NAO CONFORMIDADE 21 - Produtor nao encontrado",;
			"Erro ao gerar o evento "+cEvento+". Produtor "+AllTrim(SA2->A2_COD+SA2->A2_LOJA)+" nЦo encontrado no MIX! Provavelmente nao ha pagamento a ele, mas possui dИbitos. ",;
			"Retire os debitos (convenios, emprestimos, etc...) desse produtor caso realmente nao haja nenhum pagamento a ser feito!")
			*/
			
			//здддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
			//ЁSomente sera gravado o evento caso na chamada da rotina Ё
			//Ёseja indicado que sera necessario a gravacao do evento. Ё
			//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддды
			If lGrvZLF
				
				_cSeq:= U_GetSeqZLF(cCodMIX,cEvento,_cCodForn,_cLojForn)
				
				RecLock("ZLF", .T.)
				
				ZLF->ZLF_FILIAL := xFilial("ZLF")
				ZLF->ZLF_CODZLE := cCodMIX
				ZLF->ZLF_VERSAO := _cVersao
				ZLF->ZLF_SETOR  := ZL2->ZL2_COD
				ZLF->ZLF_LINROT := ""
				ZLF->ZLF_RETIRO := _cCodForn
				ZLF->ZLF_RETILJ := _cLojForn
				ZLF->ZLF_A2COD  := _cCodForn
				ZLF->ZLF_A2LOJA := _cLojForn
				ZLF->ZLF_EVENTO := cEvento
				ZLF->ZLF_DCREVE := cSE2HIS //ZL8->ZL8_DESCRI
				ZLF->ZLF_ENTMIX := ZL8->ZL8_MIX
				ZLF->ZLF_DEBCRED:= ZL8->ZL8_DEBCRE
				ZLF->ZLF_DTINI  := ZLE->ZLE_DTINI
				ZLF->ZLF_DTFIM  := ZLE->ZLE_DTFIM
				ZLF->ZLF_ORIGEM := "F"
				//Quando ocorrer o registro por aqui quer disser que o codigo + loja do produtor nao teve entrada de leite
				// no periodo, pode ser que nem o codigo como o caso da associacao que somente sera debitado os convenios e emprestimos
				ZLF->ZLF_QTDBOM := 0
				ZLF->ZLF_TOTAL  := nValor
				ZLF->ZLF_VLRLTR := 0
				ZLF->ZLF_ACERTO := "S"
				ZLF->ZLF_TP_MIX := "L"
				ZLF->ZLF_TIPO   := "L"
				ZLF->ZLF_STATUS := "F"
				ZLF->ZLF_SEQ	:= _cSeq
				ZLF->ZLF_DCRSET := ZL2->ZL2_DESCRI
				ZLF->ZLF_TRIBUT := _cTpTrib
				
				ZLF->(MsUnLock())
				
			EndIf
			
		EndIf
		
	EndIf
	
EndIf

//ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_A2COD+ZLF_A2LOJA+ZLF_EVENTO+ZLF_SEQ
_cSeekRet:=  xFilial("ZLF") + cCodMIX + _cVersao + _cCodForn + _cLojForn + cEvento + _cSeq

//зддддддддддддддддддддддддддддддддддддддддддддд©
//ЁRestaura a filial corrente antes do processo.Ё
//юддддддддддддддддддддддддддддддддддддддддддддды
cFilAnt:= _cBkpFil

SM0->(dbSetOrder(1))   // forca o indice na ordem certa
SM0->(dbSeek(SUBS(cNumEmp,1,2) + cFilAnt))

Return _cSeekRet

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Funcao    Ё AjustaSX1╨ Autor Ё Microsiga          ╨ Data Ё  00/00/00   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Descricao Ё Funcao para criacao das perguntas caso elas nao existam.   ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё Programa principal                                         ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function AjustaSX1()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
//ЁO tipo de fechamento previsao foi removido da rotina de fechamento       Ё
//Ёpois anteriormente o fechamento dos titulos financeiros somente ocorreriaЁ
//Ёpara os codigos e lojas dos cooperados neste caso as baixas do financeiroЁ
//Ёpodem considerar somente a loja outro impacto seria o tipo de tributacao Ё
//Ёdesta forma seriam gerados duplicados na ZLF os debitos.                 Ё
//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
/*
aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o tipo do Acerto. No modo      ')
Aadd( aHelpPor, 'Previsao serao gerados somente os      ')
Aadd( aHelpPor, 'eventos(ZLF), ja no modo Definitivo,   ')
Aadd( aHelpPor, 'serao gerados titulos no financeiro,   ')
Aadd( aHelpPor, 'Nota Fiscal, baixa de titulos e eventos')
Aadd( aHelpSpa, 'Informe o tipo do Acerto. No modo      ')
Aadd( aHelpSpa, 'Previsao serao gerados somente os      ')
Aadd( aHelpSpa, 'eventos(ZLF), ja no modo Definitivo,   ')
Aadd( aHelpSpa, 'serao gerados titulos no financeiro,   ')
Aadd( aHelpSpa, 'Nota Fiscal, baixa de titulos e eventos')
Aadd( aHelpEng, 'Informe o tipo do Acerto. No modo      ')
Aadd( aHelpEng, 'Previsao serao gerados somente os      ')
Aadd( aHelpEng, 'eventos(ZLF), ja no modo Definitivo,   ')
Aadd( aHelpEng, 'serao gerados titulos no financeiro,   ')
Aadd( aHelpEng, 'Nota Fiscal, baixa de titulos e eventos')
U_xPutSx1(_cPerg,"01","Tipo do Acerto?","Tipo do Acerto?","Tipo do Acerto?","mv_ch1","C",1,0,0,"C",'',"","","","MV_PAR01","Previsao","","","","Definitivo","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
*/

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpPor, 'zado para o Fechamento.                ')
Aadd( aHelpPor, 'ATENCAO: Escolha um MIX aberto e com   ')
Aadd( aHelpPor, 'periodo correto.                       ')
Aadd( aHelpSpa, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpSpa, 'zado para o Fechamento.                ')
Aadd( aHelpSpa, 'ATENCAO: Escolha um MIX aberto e com   ')
Aadd( aHelpSpa, 'periodo correto.                       ')
Aadd( aHelpEng, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpEng, 'zado para o Fechamento.                ')
Aadd( aHelpEng, 'ATENCAO: Escolha um MIX aberto e com   ')
Aadd( aHelpEng, 'periodo correto.                       ')
U_xPutSx1(_cPerg,"01","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch1","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_02","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe os codigos dos setores a serem ')
Aadd( aHelpPor, 'considerados no Acerto. Se deixado em  ')
Aadd( aHelpPor, 'branco, serao considerados todos.      ')
Aadd( aHelpSpa, 'Informe os codigos dos setores a serem ')
Aadd( aHelpSpa, 'considerados no Acerto. Se deixado em  ')
Aadd( aHelpSpa, 'branco, serao considerados todos.      ')
Aadd( aHelpEng, 'Informe os codigos dos setores a serem ')
Aadd( aHelpEng, 'considerados no Acerto. Se deixado em  ')
Aadd( aHelpEng, 'branco, serao considerados todos.      ')
U_xPutSx1(_cPerg,"02","Acerto do Setor?","Acerto do Setor?","Acerto do Setor?","mv_ch2","C",60,0,0,"G",'VAZIO().OR.SubStr(MV_PAR02,Len(AllTrim(MV_PAR02)),1)=="/"',"U_F302","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no Acerto. Vc pode informar')
Aadd( aHelpPor, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpPor, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpPor, 'considerar apenas este produtor.       ')
Aadd( aHelpSpa, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpSpa, 'considerado no Acerto. Vc pode informar')
Aadd( aHelpSpa, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpSpa, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpSpa, 'considerar apenas este produtor.       ')
Aadd( aHelpEng, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpEng, 'considerado no Acerto. Vc pode informar')
Aadd( aHelpEng, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpEng, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpEng, 'considerar apenas este produtor.       ')
U_xPutSx1(_cPerg,"03","Produtor de?","Produtor de?","Produtor de?","mv_ch3","C",6,0,0,"G",,"SA2_L4","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no Acerto.                 ')
Aadd( aHelpSpa, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpSpa, 'considerado no Acerto.                 ')
Aadd( aHelpEng, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpEng, 'considerado no Acerto.                 ')
U_xPutSx1(_cPerg,"04","Produtor Ate?","Produtor Ate?","Produtor Ate?","mv_ch4","C",6,0,0,"G",,"SA2_L4","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Dia de pagamento do produtor.')
Aadd( aHelpPor, 'Este dia sera considerado na data de   ')
Aadd( aHelpPor, 'vencimento do titulo gerado para o     ')
Aadd( aHelpPor, 'produtor.                              ')
Aadd( aHelpSpa, 'Informe o Dia de pagamento do produtor.')
Aadd( aHelpSpa, 'Este dia sera considerado na data de   ')
Aadd( aHelpSpa, 'vencimento do titulo gerado para o     ')
Aadd( aHelpSpa, 'produtor.                              ')
Aadd( aHelpEng, 'Informe o Dia de pagamento do produtor.')
Aadd( aHelpEng, 'Este dia sera considerado na data de   ')
Aadd( aHelpEng, 'vencimento do titulo gerado para o     ')
Aadd( aHelpEng, 'produtor.                              ')
U_xPutSx1(_cPerg,"05","Dia de Pagamento","Dia de Pagamento","Dia de Pagamento","mv_ch5","C",2,0,0,"G","","","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


//dia de pagamento
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial do grupo de PreГo/Linha ')
Aadd( aHelpPor, 'para busca dos produtores. ')
U_xPutSx1(_cPerg,"06","Do Grupo PreГo/Linha"," "," ","mv_ch6","C",6,0,0,"G","","ZL3_01","","","MV_PAR06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Detalha o saldo devedor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final do grupo de PreГo/Linha ')
Aadd( aHelpPor, 'para busca dos produtores. ')
U_xPutSx1(_cPerg,"07","Ate o Grupo PreГo/Linha","","","mv_ch7","C",6,0,0,"G","","ZL3_01","","","MV_PAR07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe mensagem adicional a ser impressa ')
Aadd( aHelpPor, 'nas observacoes na nota do produtor. ')
U_xPutSx1(_cPerg,"08","Mensagem 01","","","mv_ch8","C",99,0,0,"G","","","","","MV_PAR08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe mensagem adicional a ser impressa ')
Aadd( aHelpPor, 'nas observacoes na nota do produtor. ')
U_xPutSx1(_cPerg,"09","Mensagem 02","","","mv_ch9","C",99,0,0,"G","","","","","MV_PAR09","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe mensagem adicional a ser impressa ')
Aadd( aHelpPor, 'nas observacoes na nota do produtor. ')
U_xPutSx1(_cPerg,"10","Mensagem 03","","","mv_cha","C",99,0,0,"G","","","","","MV_PAR10","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

/*
aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o tipo do Acerto. No modo      ')
Aadd( aHelpPor, 'Previsao serao gerados somente os      ')
Aadd( aHelpPor, 'eventos(ZLF), ja no modo Definitivo,   ')
Aadd( aHelpPor, 'serao gerados titulos no financeiro,   ')
Aadd( aHelpPor, 'Nota Fiscal, baixa de titulos e eventos')
Aadd( aHelpSpa, 'Informe o tipo do Acerto. No modo      ')
Aadd( aHelpSpa, 'Previsao serao gerados somente os      ')
Aadd( aHelpSpa, 'eventos(ZLF), ja no modo Definitivo,   ')
Aadd( aHelpSpa, 'serao gerados titulos no financeiro,   ')
Aadd( aHelpSpa, 'Nota Fiscal, baixa de titulos e eventos')
Aadd( aHelpEng, 'Informe o tipo do Acerto. No modo      ')
Aadd( aHelpEng, 'Previsao serao gerados somente os      ')
Aadd( aHelpEng, 'eventos(ZLF), ja no modo Definitivo,   ')
Aadd( aHelpEng, 'serao gerados titulos no financeiro,   ')
Aadd( aHelpEng, 'Nota Fiscal, baixa de titulos e eventos')
U_xPutSx1(_cPerg,"06","Tipo do Acerto?","Tipo do Acerto?","Tipo do Acerto?","mv_ch6","C",1,0,0,"C",'',"","","","mv_par06","Previsao","","","","Definitivo","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
*/
Return


/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  ЁMGLT009   ╨Autor  ЁMicrosiga           ╨ Data Ё  11/20/14   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     Ё                                                            ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё AP                                                        ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function TabelaTemp(xOpc)

Local aStruct :={}

If xOpc == 1 //CriaГЦo da tabela
	
	If Select("TRZ") <> 0
		TRZ->(dbCloseArea("TRZ"))
	EndIf
	
	AAdd(aStruct,{"TRZ_FILIA"  ,"C",_nTamFil})
	AAdd(aStruct,{"TRZ_SETOR"  ,"C",6})
	AAdd(aStruct,{"TRZ_LINHA"  ,"C",6})
	AAdd(aStruct,{"TRZ_FORN"   ,"C",_nTamFor})
	AAdd(aStruct,{"TRZ_LOJA"   ,"C",_nTamLoj})
	AAdd(aStruct,{"TRZ_VALOR"  ,"N",14,2})
	AAdd(aStruct,{"TRZ_TRIBU"  ,"C",1})
	AAdd(aStruct,{"TRZ_VLEITE" ,"N",14,2})
	AAdd(aStruct,{"TRZ_CREDIT"  ,"N",14,2})
	AAdd(aStruct,{"TRZ_DEBITO"  ,"N",14,2})
	cArqTRZ := CriaTrab(aStruct,.T.)
	dbUseArea(.T.,,cArqTRZ,"TRZ",.F.,.F.)
	
	
	cInd1TRZ := CriaTrab(Nil,.F.)
	IndRegua("TRZ",cInd1TRZ,"TRZ_FILIA+TRZ_FORN+TRZ_LOJA",,,)
	dbClearIndex()
	dbSetIndex(cInd1TRZ+OrdBagExt())
	
ElseIf xOpc == 2 //Apaga arquivo temporАrio
	
	Ferase(cArqTRZ + GetDbExtension())
	Ferase(cArqTRZ + OrdBagExt())
EndIf

Return


/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  ЁMGLT009   ╨Autor  ЁMicrosiga           ╨ Data Ё  11/20/14   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     Ё                                                            ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё AP                                                        ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/

Static Function GravaTRZ(xOpc,xAlias)

Local _nDados := 0
Local cArqTmp := xAlias

If xOpc == 1
	dbSelectArea(cArqTmp)
	dbGoTop()
	While (cArqTmp)->(!Eof()) .and. (_nDados < 20)
		dbSelectArea("TRZ")
		RecLock("TRZ",.T.)
		
		TRZ->TRZ_FILIA := xFilial("ZLF")
		TRZ->TRZ_SETOR := (cArqTmp)->ZLF_SETOR
		//TRZ->TRZ_LINHA := (cArqTmp)->ZLF_LINROT
		TRZ->TRZ_FORN  := (cArqTmp)->ZLF_A2COD
		TRZ->TRZ_LOJA  := (cArqTmp)->ZLF_A2LOJA
		TRZ->TRZ_VALOR := (cArqTmp)->CREDITO-(cArqTmp)->DEBITO
		TRZ->TRZ_TRIBU := 'I'
		TRZ->TRZ_VLEITE := (cArqTmp)->VLEITE
		TRZ->TRZ_CREDIT := (cArqTmp)->CREDITO
		TRZ->TRZ_DEBITO := (cArqTmp)->DEBITO
		MsUnlock()
		
		(cArqTmp)->(dbSkip())
		_nDados++
		
	EndDo
	//(cArqTmp)->(dbCloseArea())
	
ElseIf xOpc == 2
	While (cArqTmp)->(!Eof()) .and. (_nDados < 20)
		dbSelectArea("TRZ")
		RecLock("TRZ",.T.)
		
		TRZ->TRZ_FILIA := xFilial("ZLF")
		TRZ->TRZ_SETOR := (cArqTmp)->ZLF_SETOR
		//TRZ->TRZ_LINHA := (cArqTmp)->ZLF_LINROT
		TRZ->TRZ_FORN  := (cArqTmp)->ZLF_A2COD
		TRZ->TRZ_LOJA  := (cArqTmp)->ZLF_A2LOJA
		TRZ->TRZ_VALOR := (cArqTmp)->CREDITO-(cArqTmp)->DEBITO
		TRZ->TRZ_TRIBU := 'I' //(cArqTmp)->ZLF_TRIBUT
		TRZ->TRZ_VLEITE := (cArqTmp)->VLEITE
		TRZ->TRZ_CREDIT := (cArqTmp)->CREDITO
		TRZ->TRZ_DEBITO := (cArqTmp)->DEBITO
		
		MsUnlock()
		
		(cArqTmp)->(dbSkip())
		_nDados++
	EndDo
EndIf

dbSelectArea("TRZ")
//dbSetOrder(1)//TRZ_FILIA+TRZ_FORN+TRZ_LOJA
dbGoTop()


Return


/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  ЁMGLT009   ╨Autor  ЁMicrosiga           ╨ Data Ё  11/27/14   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     Ё                                                            ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё AP                                                        ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function ValidaBloqueio()

Local _cMatriculas := ""
Local _cFiltro := "% BETWEEN '"+DTOS(_dDtIni)+"' AND '"+DTOS(_dDtFim)+"' %"

BeginSql alias "BLQ"
	SELECT (LD.ZLD_RETIRO+"-"+LD.ZLD_RETILJ) MAT
	FROM %Table:ZLD% LD
	JOIN %Table:SA2% A2 ON A2.A2_COD = LD.ZLD_RETIRO AND A2.A2_LOJA = LD.ZLD_RETILJ AND A2.A2_MSBLQL = '1' AND A2.D_E_L_E_T_ = ' '
	WHERE LD.ZLD_FILIAL = %Exp:xFilial("ZLD")% AND LD.ZLD_DTCOLE %Exp:_cFiltro%
	AND LD.D_E_L_E_T_ = ' '
EndSql

BLQ->(DbGoTop())
While !BLQ->(Eof())
	_cMatriculas := _cMatriculas + BLQ->MAT+"/ "
	BLQ->(DbSkip())
EndDo

DbCloseArea("BLQ")

If !Empty(_cMatriculas)
	xMagHelpFis("Bloqueio","Existem cooperados deste MIX com cadastro bloqueado!",;
	"Desbloqueie os cadastros abaixo antes de prosseguir com o fechamento:"+_ENTER;
	+_cMatriculas)
	Return .f.
EndIf

Return .t.

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  ЁMGLT009   ╨Autor  ЁMicrosiga           ╨ Data Ё  07/02/16   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     Ё                                                            ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё AP                                                        ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function GrvF1Seek(_pcRetiro, _pcLoja, _pcMix, _pcVersao, _pcSetor, _pcNumNf, _pcSerie )

// Grava NF nos eventos da ZLF
Local _cUpdate := ""

_cUpdate := "UPDATE " + RetSqlName("ZLF")
_cUpdate += " SET ZLF_F1SEEK = '"+xFilial("SF1")+_pcNumNf+_pcSerie+_pcRetiro+_pcLoja+"N"+"'"
_cUpdate += " WHERE D_E_L_E_T_ = ' '"
_cUpdate += " AND ZLF_FILIAL  = '" + xFilial("ZLF") + "'"
_cUpdate += " AND ZLF_RETIRO  = '" + _pcRetiro + "'"
_cUpdate += " AND ZLF_RETILJ  = '" + _pcLoja + "'"
_cUpdate += " AND ZLF_CODZLE  = '" + _pcMix + "'"
_cUpdate += " AND ZLF_VERSAO  = '" + _pcVersao + "'"
_cUpdate += " AND ZLF_SETOR   = '" + _pcSetor + "'"
//_cUpdate += " AND ZLF_EVENTO IN (" + cInEvento + ") "
_cUpdate += " AND ZLF_ACERTO = 'N'"
_cUpdate += " AND ZLF_TP_MIX = 'L' "

lSqlOk := !(TCSqlExec(_cUpdate) < 0)

If lSqlOk .and.  (TcGetDB() == 'ORACLE')
	lSqlOk := !(TCSqlExec(" COMMIT ") < 0)
EndIf

Return


/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  ЁCriaSA5   ╨Autor  ЁMicrosiga           ╨ Data Ё  07/02/16   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     Ё  Verifica se existe amarraГЦo Produto X Fornecedor e a cria ╨╠╠
╠╠╨          Ё  caso necessАrio.                                          ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё AP                                                        ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function CriaSA5(xcCod, xcLoja,xcProduto)

Local _cDesc := Posicione("SB1",1,xFilial("SB1")+xcProduto,"B1_DESC")

DbSelectArea("SA5")
DbSetOrder(1) //A5_FILIAL, A5_FORNECE, A5_LOJA, A5_PRODUTO, R_E_C_N_O_, D_E_L_E_T_
If !(DbSeek(xFilial("SA5")+xcCod+xcLoja+xcProduto))
	RecLock("SA5",.t.)
	SA5->A5_FILIAL := xFilial("SA5")
	SA5->A5_FORNECE := xcCod
	SA5->A5_LOJA := xcLoja
	SA5->A5_NOMEFOR := SA2->A2_NOME
	SA5->A5_PRODUTO := xcProduto
	SA5->A5_NOMPROD := _cDesc
	MsUnlock()
EndIf

Return

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммммкмммммммяммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  Ё AtualizaSld╨ Autor ЁGuilherme FranГa  ╨ Data Ё  00/00/00   ╨╠╠
╠╠лммммммммммьммммммммммммймммммммоммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     Ё Atualiza os saldos na tabela ZLV.                          ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё                                                            ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
Static Function AtualizaSld(Obj)

Local _cAno := Alltrim(Str(year(ZLE->ZLE_DTFIM)))
Local _cMes := StrZero(Month(ZLE->ZLE_DTFIM),2)

DbSelectArea("ZLV")
DbSetOrder(1)
If !ZLV->(DbSeek(xFilial("ZLV")+_cAno+_cMes+SA2->A2_COD+SA2->A2_LOJA))
	RecLock("ZLV",.T.)
	ZLV->ZLV_FILIAL := xFilial("SF2")
	ZLV->ZLV_PERIOD := _cAno+_cMes
	ZLV->ZLV_MIX := ZLE->ZLE_COD
	ZLV->ZLV_SA2COD := SA2->A2_COD
	ZLV->ZLV_SA2LJ := SA2->A2_LOJA	
	ZLV->ZLV_SA2NOM := SA2->A2_NOME
	ZLV->ZLV_DATA	:= dDataBase  
	ZLV->ZLV_VLRNF 	:= SF1->F1_VALBRUT
	ZLV->ZLV_PRECO 	:= Round((SF1->F1_VALBRUT / SF1->F1_VOLUME1),4)	 
	ZLV->ZLV_PRCNEG := SA2->A2_L_ADICI
	ZLV->ZLV_QTD := SF1->F1_VOLUME1    
	ZLV->ZLV_ROTA  	:= ""
	ZLV->ZLV_NF    	:= SF1->F1_DOC
	ZLV->ZLV_DEBITO := _nTotDebito
	ZLV->ZLV_FUNRUR := SF1->F1_CONTSOC
	ZLV->ZLV_SENAR  := SF1->F1_VLSENAR	
	ZLV->ZLV_VLRLIQ := SF1->F1_VALBRUT - SF1->F1_CONTSOC - SF1->F1_VLSENAR - _nTotDebito
	
	ZLV->(MsUnlock())
Else
	RecLock("ZLV",.F.)
	ZLV->ZLV_MIX := ZLE->ZLE_COD
	ZLV->ZLV_SA2NOM := SA2->A2_NOME
	ZLV->ZLV_DATA	:= dDataBase  
	ZLV->ZLV_VLRNF 	:= SF1->F1_VALBRUT
	ZLV->ZLV_PRECO 	:= Round((SF1->F1_VALBRUT / SF1->F1_VOLUME1),4)	 
	ZLV->ZLV_PRCNEG := SA2->A2_L_ADICI
	ZLV->ZLV_QTD := SF1->F1_VOLUME1    
	ZLV->ZLV_ROTA  	:= ""
	ZLV->ZLV_NF    	:= SF1->F1_DOC
	ZLV->ZLV_DEBITO := _nTotDebito
	ZLV->ZLV_FUNRUR := SF1->F1_CONTSOC
	ZLV->ZLV_SENAR  := SF1->F1_VLSENAR	
	ZLV->ZLV_VLRLIQ := SF1->F1_VALBRUT - SF1->F1_CONTSOC - SF1->F1_VLSENAR - _nTotDebito

	ZLV->(MsUnlock())

EndIf


Return

