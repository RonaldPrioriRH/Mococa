#include "protheus.ch"
#include "topconn.ch"
#include "rwmake.ch"
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ RGLT024  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 27/01/2009                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Mapa dos Fretistas.  				    		                          						            บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                          															  		บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum													                               						บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite                                                                      						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function RGLT024


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Declaracao de Variaveis                                             ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

Local cDesc1         := "Este programa tem como objetivo imprimir relatorio "
Local cDesc2         := "de acordo com os parametros informados pelo usuario."
Local cDesc3         := "Relatorio de Recepcao"
Local cPict          := ""
Local titulo       := "Mapa dos Fretistas  "
Local nLin         := 80

Local Cabec1       := ""
Local Cabec2       := ""
Local imprime      := .T.
Local aOrd := {}
Private lEnd         := .F.
Private lAbortPrint  := .F.
Private CbTxt        := ""
Private limite           := 220
Private tamanho          := "G"
Private nomeprog         := "RGLT024" // Coloque aqui o nome do programa para impressao no cabecalho
Private nTipo            := 18
Private aReturn          := { "Zebrado", 1, "Administracao", 2, 2, 1, "", 1}
Private nLastKey        := 0
Private cbtxt      := Space(10)
Private cbcont     := 00
Private CONTFL     := 01
Private m_pag      := 01
Private wnrel      := "RGLT024" // Coloque aqui o nome do arquivo usado para impressao em disco
Private cPerg := "RGLT024"
Private cString := "ZLD"

ValidPerg()

Pergunte(cPerg,.f.)

dbSelectArea("ZLD")
dbSetOrder(1)

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Monta a interface padrao com o usuario...                           ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

wnrel := SetPrint(cString,NomeProg,cPerg,@titulo,cDesc1,cDesc2,cDesc3,.T.,aOrd,.T.,Tamanho,,.T.)

If nLastKey == 27
	Return
Endif

SetDefault(aReturn,cString)

If nLastKey == 27
	Return
Endif

nTipo := If(aReturn[4]==1,15,18)

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Processamento. RPTSTATUS monta janela com a regua de processamento. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

RptStatus({|| RunReport(Cabec1,Cabec2,Titulo,nLin) },Titulo)
Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณRUNREPORT บ Autor ณ AP6 IDE            บ Data ณ  23/01/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Funcao auxiliar chamada pela RPTSTATUS. A funcao RPTSTATUS บฑฑ
ฑฑบ          ณ monta a janela com a regua de processamento.               บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function RunReport(Cabec1,Cabec2,Titulo,nLin)
Local nQtdReg := 0
Local nAux:=0
Local nQtdDif := 0
Local cAux := ""
Local dtAtual
Local x:=0
Local nTamCol := 7
Local nSubTotal := 0

Static dtini,dtfim
Private aTotal := {}

if len(alltrim(mv_par07)) != 2
	mv_par07 := strzero(val(mv_par07),2)
endif
if len(alltrim(mv_par06)) == 2
	mv_par06 := "20"+alltrim(mv_par06)
endif

dtini:=stod(mv_par06+mv_par07+"01")
dtfim:=lastday(dtini)


//--------------------------------
//  Monta Cabecalho com Dias
//--------------------------------
aTotal := {}
dtAtual := dtini
nAux:=0
while dtAtual <= dtfim
	nAux++
	aAdd(aTotal,0)
	Cabec1 += padr(strzero(nAux,2),nTamCol)
	dtAtual++
enddo

if mv_par08 == 1 // Leite
	cQuery := "SELECT ZLD_FRETIS,ZLD_LJFRET "
endif
if mv_par08 == 2 // km - quebra por linha
	cQuery := "SELECT ZLD_FRETIS,ZLD_LJFRET,ZLD_LINROT "
endif
cQuery += " FROM " + RetSqlName("ZLD") + " ZLD "
cQuery += " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND ZLD_SETOR = '" + mv_par01 + "'"
cQuery += " AND ZLD_DTCOLE BETWEEN '" + dtos(dtini) + "' AND '" + dtos(dtfim) + "' "
cQuery += " AND ZLD_FRETIS BETWEEN '" + mv_par02 + "' AND '" + mv_par04 + "' "
cQuery += " AND ZLD_LJFRET BETWEEN '" + mv_par03 + "' AND '" + mv_par05 + "' "
cQuery += " AND ZLD_FILIAL = '" + xFilial("ZLD") + "'"
if mv_par08 == 1 // Leite
	cQuery += " GROUP BY ZLD_FRETIS,ZLD_LJFRET"
	cQuery += " ORDER BY ZLD_FRETIS,ZLD_LJFRET"
endif
if mv_par08 == 2 // Km
	cQuery += " GROUP BY ZLD_FRETIS,ZLD_LJFRET,ZLD_LINROT"
	cQuery += " ORDER BY ZLD_FRETIS,ZLD_LJFRET,ZLD_LINROT"
endif

if Select("TRB") > 0
	dbSelectArea("TRB")
	dbCloseArea("TRB")
endif

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRB',.F.,.T.)

COUNT TO nQtdReg

SetRegua(nQtdReg)

TRB->(dbgotop())
while TRB->(!Eof())
	
	Incregua()
	
	If lAbortPrint
		@nLin,00 PSAY "*** CANCELADO PELO OPERADOR ***"
		Exit
	Endif
	
	If nLin > 55
		//--------------------------------
		// Imprime Cabecalho
		//--------------------------------
		@00,00 psay AvalImp(220)
		nLin:=1
		@nLin,000 PSAY SM0->M0_NOMECOM+Space(16)+"CNPJ: "+Transform(SM0->M0_CGC,"@R X9.999.999/9999-99")
		nLin++
		@nLin,000 PSAY SubStr(SM0->M0_ENDENT,1,20)+" "+SubStr(SM0->M0_BAIRENT,1,17)+" "+SubStr(SM0->M0_CIDENT,1,13)+" "+SM0->M0_ESTENT+" Insc.E.: "+SM0->M0_INSC
		nLin++
		@nLin,000 PSAY __PrtThinLine()
		nLin++
		@nLin,90 PSAY "M A P A   D E   "+iif(mv_par08 == 1,"L E I T E","K M")+"   D O S   F R E T I S T A S - " +mv_par07+"/"+mv_par06
		nLin++
		@nLin,000 PSAY __PrtThinLine()
		nLin++
		@nLin,000 PSAY Cabec1
		nLin++
		@nLin,000 PSAY __PrtThinLine()
		nLin++
	endif
	
	//--------------------------------
	// Mostra Fretista
	//--------------------------------
	@nLin,000 PSAY __PrtThinLine()
	nLin++
	if !empty(alltrim(TRB->ZLD_FRETIS))
		@nLin,000 PSAY TRB->ZLD_FRETIS+"-"+TRB->ZLD_LJFRET+" "+LEFT(POSICIONE("SA2",1,XFILIAL("SA2")+TRB->ZLD_FRETIS+TRB->ZLD_LJFRET,"A2_NOME"),30)
		if mv_par08 == 2 // km
			@nLin,050 PSAY "LINHA: "+TRB->ZLD_LINROT+POSICIONE("ZLW",1,XFILIAL("ZLW")+TRB->ZLD_LINROT,"ZLW_DESCRI")
		endif
	else
		@nLin,000 PSAY "PLATAFORMA"
		if mv_par08 == 2 // km
			@nLin,050 PSAY "LINHA: "+TRB->ZLD_LINROT+POSICIONE("ZLW",1,XFILIAL("ZLW")+TRB->ZLD_LINROT,"ZLW_DESCRI")
		endif
	endif
	nLin++
	
	//--------------------------------
	// Mostra valores dos dias do mes solicitado
	//--------------------------------
	nPos := 0
	x:=0
	dtAtual := dtini
	while dtAtual <= dtfim
		
		//--------------------------------
		// obtem volume do fretista no data atual
		//--------------------------------
		if mv_par08 == 1 // Leite
			nAux :=  gtVol(TRB->ZLD_FRETIS,TRB->ZLD_LJFRET,dtAtual,"ZLD_QTDBOM")
		endif
		if mv_par08 == 2 // Km
			nAux :=  gtKm(mv_par01,TRB->ZLD_LINROT,TRB->ZLD_FRETIS,TRB->ZLD_LJFRET,dtAtual,dtAtual)
		endif
		@nLin,nPos PSAY transform(nAux,"@ 999999")
		
		//--------------------------------
		// armazena totais
		//--------------------------------
		x++
		aTotal[x] += nAux
		nSubTotal += nAux
		
		//--------------------------------
		// proxima data
		//--------------------------------
		dtAtual++
		nPos += nTamCol
		
	enddo
	
	//--------------------------------
	// mostra total do fretista
	//--------------------------------
	@nLin,nPos PSAY transform(nSubTotal,"@ 9999999")
	nSubTotal := 0
	
	nLin++
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Impressao do cabecalho do relatorio. . .                            ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	/*If nLin > 55 // Salto de Pแgina. Neste caso o formulario tem 55 linhas...
	Cabec(Titulo,Cabec1,Cabec2,NomeProg,Tamanho,nTipo)
	nLin := 8
	Endif
	*/
	
	
	
	TRB->(dbSkip()) // Avanca o ponteiro do registro no arquivo
EndDo

TRB->(dbclosearea())


//--------------------------------
// Mostra Total Geral
//--------------------------------
@nLin,000 PSAY __PrtThinLine()
nLin++

@nLin,000 PSAY "TOTAL GERAL"
nLin++

nPos:=0
x:=0
nAux:=0
dtAtual := dtini
while dtAtual <= dtfim
	x++
	@nLin,nPos PSAY transform(aTotal[x],"@ 9999999")
	
	nAux+=aTotal[x] // total geral
	
	nPos+=nTamCol
	dtAtual++
enddo
@nLin,nPos PSAY transform(nAux,"@ 9999999")


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Finaliza a execucao do relatorio...                                 ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

SET DEVICE TO SCREEN

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Se impressao em disco, chama o gerenciador de impressao...          ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

If aReturn[5]==1
	dbCommitAll()
	SET PRINTER TO
	OurSpool(wnrel)
Endif

MS_FLUSH()

Return



Static Function ValidPerg()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

//Do Setor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo do Setor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"01","Setor   "," "," ","mv_ch1","C",6,0,0,"G",'U_ValSetPar()',"ZL2_01","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Transportador')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"02","Do Fretista"," "," ","mv_ch2","C",6,0,0,"G","","SA2_L3","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Loja         ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"03","Da Loja    "," "," ","mv_ch3","C",2,0,0,"G","","","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Transportador')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"04","Ao Fretista"," "," ","mv_ch4","C",6,0,0,"G","","SA2_L3","","","mv_par04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Loja         ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"05","Ate a Loja"," "," ","mv_ch5","C",2,0,0,"G","","","","","mv_par05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Ano           ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"06","Do Ano   "," "," ","mv_ch6","C",4,0,0,"G","","","","","mv_par06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Mes           ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"07","Do Mes   "," "," ","mv_ch7","C",2,0,0,"G","","","","","mv_par07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o tipo de MAPA: ')
Aadd( aHelpPor, 'Leite ou Km             ')
U_xPutSx1(cPerg,"08","Tipo     "," "," ","mv_ch8","N",1,0,0,"C","","","","","mv_par08","Leite","Leite","Leite","","Km","Km","Km","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

return

/**/
Static Function gtVol(cpFretis,cpLoja,dtcole,cpNameCmp)
Local nRet:= 0

cQuery := "SELECT SUM("+cpNameCmp+") AS TOTAL "
cQuery += " FROM " + RetSqlName("ZLD") + " ZLD "
cQuery += " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND ZLD_SETOR = '" + mv_par01 + "'"
cQuery += " AND ZLD_DTCOLE BETWEEN '" + dtos(dtcole) + "' AND '" + dtos(dtcole) + "' "
cQuery += " AND ZLD_FRETIS BETWEEN '" + cpFretis + "' AND '" + cpFretis + "' "
cQuery += " AND ZLD_LJFRET BETWEEN '" + cpLoja + "' AND '" + cpLoja + "' "
cQuery += " AND ZLD_FILIAL = '" + xFilial("ZLD") + "'"

if Select("TRC") > 0
	dbSelectArea("TRC")
	dbCloseArea("TRC")
endif

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRC',.F.,.T.)

if !TRC->(eof())
	nRet := TRC->TOTAL
endif
TRC->(dbclosearea())

return nRet

Static Function gtKm(cpSetor,cpLinha,cpFretis,cpLoja,dtini,dtfim)
Local nRet:= 0

cQuery := " SELECT MAX(ZLD_KM) AS TOTAL "
cQuery += " FROM " + RetSqlName("ZLD") + " ZLD "
cQuery += " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND ZLD_FILIAL = '" + xFilial("ZLD") + "'"
cQuery += " AND ZLD_SETOR = '" + cpSetor + "'"
cQuery += " AND ZLD_LINROT = '" + cpLinha + "'"
cQuery += " AND ZLD_DTCOLE BETWEEN '" + dtos(dtini) + "' AND '" + dtos(dtfim) + "' "
cQuery += " AND ZLD_FRETIS BETWEEN '" + cpFretis + "' AND '" + cpFretis + "' "
cQuery += " AND ZLD_LJFRET BETWEEN '" + cpLoja + "' AND '" + cpLoja + "' "
cQuery += " GROUP BY ZLD_FILIAL,ZLD_FRETIS,ZLD_LJFRET,ZLD_SETOR,ZLD_TICKET,ZLD_LINROT"

if Select("TRC") > 0
	dbSelectArea("TRC")
	dbCloseArea("TRC")
endif

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRC',.F.,.T.)

while !TRC->(eof())
	nRet += TRC->TOTAL
	TRC->(dbskip())
enddo
TRC->(dbclosearea())

return nRet