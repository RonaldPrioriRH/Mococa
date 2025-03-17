#include "protheus.ch"
#include "report.ch"

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ?
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑ?
ฑฑบPrograma  ?RGLT016  ?Autor ?TOTVS                 ?Data da Criacao  ?09/12/2008                						บฑ?
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบDescricao ?Pagamento Fretista.           	                       										                บฑ?
ฑฑ?         ?															                               						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบUso       ?Lista os Fretistas com seus eventos e respectivos valores totalizando o valor liquido a pagar				บฑ?
ฑฑ?         ?															                               						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบParametros?Nenhum                  																				        บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบRetorno   ?Nenhum						  							                               						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบUsuario   ?Totvs / Microsiga											                             					บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบSetor     ?Gestao do Leite                                                                          					บฑ?
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑ?           			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑ?
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑ?
ฑฑบAutor     ?Data     ?Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑ?
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑ?
ฑฑ?         ?         ?                  							   ?                                 ? 	        บฑ?
ฑฑ?---------?---------?-------------------------------------------------?---------------------------------?------------บฑ?
ฑฑ?         ?         ?                   							   ?                                 ?			บฑ?
ฑฑ?---------?---------?-------------------------------------------------?---------------------------------?------------บฑ?
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑ?
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ?
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿?
*/
User Function RGLT016()

Local cDesc1			:= "Este programa tem como objetivo imprimir relatorio "
Local cDesc2			:= "de acordo com os parametros informados pelo usuario."
Local cDesc3			:= "Pagamento dos Fretista   "
Local cPict				:= ""
Local titulo			:= "Pagamento dos Fretista   "
Local nLin				:= 80
Local Cabec1			:= " "
Local Cabec2			:= ""
Local imprime			:= .T.
Local aOrd				:= {}
Local cQuery1			:= ""
Local cQuery2			:= ""
Private lEnd			:= .F.
Private lAbortPrint		:= .F.
Private CbTxt			:= ""
Private limite			:= 220
Private tamanho			:= "G"
Private nomeprog		:= "RGLT016" // Coloque aqui o nome do programa para impressao no cabecalho
Private nTipo			:= 18
Private aReturn			:= { "Zebrado", 1, "Administracao", 2, 2, 1, "", 1}
Private nLastKey		:= 0
Private cbtxt			:= Space(10)
Private cbcont			:= 00
Private CONTFL			:= 01
Private m_pag			:= 01
Private wnrel			:= "RGLT016" // Coloque aqui o nome do arquivo usado para impressao em disco
Private cPerg			:= "RGLT016   "
Private cString			:= "ZLF"

ValidPerg()
Pergunte(cPerg,.F.)

wnrel := SetPrint(cString,NomeProg,cPerg,@titulo,cDesc1,cDesc2,cDesc3,.T.,aOrd,.T.,Tamanho,,.T.)
If nLastKey == 27
	Return
EndIf
SetDefault(aReturn,cString)
If nLastKey == 27
	Return
EndIf
nTipo := If(aReturn[4]==1,15,18)
RptStatus({|| RunReport(Cabec1,Cabec2,Titulo,nLin) },Titulo)
Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ?
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ?
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑ?
ฑฑบPrograma  ?RUNREPORT   ?Autor ?Abrahao P. Santos     ?Data da Criacao  ?09/12/2008             						บฑ?
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบDescricao ?uncao auxiliar chamada pela RPTSTATUS. A funcao RPTSTATUS monta a janela com a regua de processamento.		บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑ?         ?															                               						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบUso       ?	Programa principal										                               						บฑ?
ฑฑ?         ?															                               						บฑ?
ฑฑ?         ?															                               						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบParametros?	Nenhum																										บฑ?
ฑฑ?		 ?											   					                       						บฑ?
ฑฑ?		 ?																											บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบRetorno   ?Nenhum						  							                               						บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบUsuario   ?Totvs / Microsiga											                             					บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบSetor     ?Gestao do Leite                                                                          					บฑ?
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑ?           			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑ?
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑ?
ฑฑบAutor     ?Data     ?Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑ?
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑ?
ฑฑ?         ?         ?                  							   ?                                 ? 	        บฑ?
ฑฑ?---------?---------?-------------------------------------------------?---------------------------------?------------บฑ?
ฑฑ?         ?         ?                   							   ?                                 ?			บฑ?
ฑฑ?---------?---------?-------------------------------------------------?---------------------------------?------------บฑ?
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑ?
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ?
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿?
/*/
Static Function RunReport(Cabec1,Cabec2,Titulo,nLin)
Local nOrdem
Local nTotDeb := 0
Local nTotCre := 0
Local nTotVol := 0
Local nAux:= 0
Local VlrPrd := 0
Local cUltFret:=""
Local cUltLin :=""
Local nqtdregs:=0
Local nTotDeb:=0
Local nTotCre:=0
Static nTamCmp := 11
Static nLiq := 0
Static aSubTots := {}
Static nSubVol := 0
Static nSubKm := 0
Static nSubDia := 0
Static nSubLiq := 0
Static nPos1 := 0
Static nMaxCol := 12 // maximo de colunas
Static nMaxLin := 60 // maximo de linhas
Static nOutros := 0
Static nqtdlin:=0
Static dt1,dt2
Static aStruct := {}

// posiciona no Mix pra pegar datas
dbselectarea("ZLE")
dbsetorder(1)
dbseek(xfilial("ZLE")+mv_par02)
dt1:=ZLE->ZLE_DTINI
dt2:=ZLE->ZLE_DTFIM
dbclosearea("ZLE")

Cabec1 := "Setor: "+mv_par01+" Mix: "+mv_par02

nLin := nMaxLin

// obtem campos dinamicos (eventos)
aStruct := getStruct(mv_par01,mv_par02)

// zera subtotal
for x:=1 to len(aStruct)
	aAdd(aSubTots,0)
next

// cabecalho
Cabec2:=padr("CODIGO LINHA",29)
Cabec2+=padr("VOLUME",10)
Cabec2+=padr("KM RODADO",10)
Cabec2+=padr("VIAGENS",10)
for i:=1 to len(aStruct)
	if i<=nMaxCol
		Cabec2 += padr(aStruct[i,2],nTamCmp)
	endif
	if i==len(aStruct)
		Cabec2 += padr("OUTROS",nTamCmp)
	endif
next i
Cabec2:=padr(Cabec2,205)
Cabec2+="VLR LIQUIDO"

// obtem fretistas que movimentaram
cQuery1 := " SELECT ZLD_FRETIS,ZLD_LJFRET,ZLD_LINROT "
cQuery1 += " FROM " + RetSqlName("ZLD") + " ZLD "
cQuery1 += " WHERE D_E_L_E_T_ = ' ' "
cQuery1 += " AND ZLD.ZLD_FILIAL = '" + XFILIAL("ZLD") + "' "
cQuery1 += " AND ZLD.ZLD_SETOR = '" + AllTrim(MV_PAR01) + "' "
cQuery1 += " AND ZLD.ZLD_DTCOLE BETWEEN '" + dtos(dt1) + "' AND '"+ dtos(dt2) +"' "
cQuery1 += " AND ZLD.ZLD_FRETIS BETWEEN '" + MV_PAR03 + "' AND '"+MV_PAR05+"' "
cQuery1 += " AND ZLD.ZLD_LJFRET BETWEEN '" + MV_PAR04 + "' AND '"+MV_PAR06+"' "
cQuery1 += " AND ZLD.ZLD_LINROT BETWEEN '" + MV_PAR07 + "' AND '"+MV_PAR08+"' "
cQuery1 += " GROUP BY ZLD_FRETIS,ZLD_LJFRET,ZLD_LINROT "
cQuery1 += " ORDER BY ZLD_FRETIS,ZLD_LJFRET,ZLD_LINROT "
If Select("TRX") > 0
	dbSelectArea("TRX")
	dbCloseArea("TRX")
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery1), "TRX", .T., .F. )

COUNT TO nqtdregs
setRegua(nqtdregs)

TRX->(dbgotop())

while TRX->(!eof())
	
	incregua()
	
	if nLin >= nMaxLin
		Cabec(Titulo,Cabec1,Cabec2,NomeProg,Tamanho,nTipo)
		nLin := 9
	endif
	
	// MOSTRA CABECALHO (LINHA E FRETISTA)
	if cUltFret != TRX->ZLD_FRETIS+TRX->ZLD_LJFRET
		
		nLin := showSubTotal(nLin)
		
		@ nLin,000 PSay __PrtThinLine()
		nLin++
		
		@nLin,000 PSAY "Fretista: "+TRX->ZLD_FRETIS+"-"+TRX->ZLD_LJFRET+" "+POSICIONE("SA2",1,XFILIAL("SA2")+TRX->ZLD_FRETIS+TRX->ZLD_LJFRET,"A2_NOME")
		nLin++
	endif
	cUltFret:= TRX->ZLD_FRETIS+TRX->ZLD_LJFRET
	
	
	// MOSTRA PRODUTOR E SEUS RESPECTIVOS VALORES
	@nLin,000 PSAY TRX->ZLD_LINROT+" "+LEFT(POSICIONE("ZLW",1,XFILIAL("ZLW")+TRX->ZLD_LINROT,"ZLW_DESCRI"),15)
	
	// Volume de leite coletado
	nAux := U_VolFret(xfilial("ZLD"),mv_par01,TRX->ZLD_LINROT,TRX->ZLD_FRETIS,TRX->ZLD_LJFRET,dt1,dt2,1)
	nSubVol += nAux
	@nLin,025 PSAY nAux Picture "@E 9,999,999"
	
	// Km percorrido
	nAux:= U_GetKm(xfilial("ZLD"),mv_par01,TRX->ZLD_LINROT,TRX->ZLD_FRETIS,TRX->ZLD_LJFRET,dt1,dt2)
	nSubKm += nAux
	@nLin,035 PSAY nAux Picture "@E 9,999,999"
	
	// Viagens realizadas (dias)
	nAux:= u_getDiaFrt(xfilial("ZLD"),mv_par01,TRX->ZLD_LINROT,TRX->ZLD_FRETIS,TRX->ZLD_LJFRET,dt1,dt2)
	nSubDia += nAux
	@nLin,045 PSAY nAux Picture "@E 9,999,999"
	
	// conta qtd de linhas por fretista
	nQtdlin++
	
	nPos1:=55
	for i:=1 to len(aStruct)
		nVlrEvt := u_getEvtFrt(xfilial("ZLD"),mv_par01,TRX->ZLD_LINROT,TRX->ZLD_FRETIS,TRX->ZLD_LJFRET,aStruct[i,1],mv_par02)
		aStruct[i,3] += nVlrEvt // total geral
		if i<=nMaxCol
			@nLin,nPos1 PSAY nVlrEvt Picture "@E 99,999.99"
			nPos1 += nTamCmp
			aSubTots[i] += nVlrEvt // subtotal
		else
			nOutros += nVlrEvt
		endif
		if i==len(aStruct) .and. nOutros <> 0
			@nLin,nPos1 PSAY nOutros Picture "@E 99,999.99"
			nPos1 += nTamCmp
			aSubTots[i] += nOutros // subtotal
		endif
		nLiq+=nVlrEvt
		nSubLiq += nVlrEvt
	next i
	
	// MOSTRA VLR LIQUIDO
	@nLin,205 PSAY nLiq Picture "@E 99,999,999.99"
	nLiq:=0
	nOutros:=0
	
	nLin++
	
	
	TRX->(DBSKIP())
enddo
TRX->(dbclosearea())

nLin := showSubTotal(nLin)

@ nLin,000 PSay __PrtThinLine()
nLin++

@nLin,000 PSAY "Resumo Geral"
nLin += 2

@nLin,000 PSAY "Codigo"
@nLin,008 PSAY "Evento"
@nLin,030 PSAY "Creditos"
@nLin,050 PSAY "Debitos"
nLin++

@nLin,000 PSAY Replicate("-",60)
nLin++
for i:=1 to len(aStruct)
	@nLin,000 PSAY aStruct[i,1]
	@nLin,008 PSAY aStruct[i,2]
	if aStruct[i,3] >= 0
		@nLin,020 PSAY aStruct[i,3] Picture "@E 999,999,999,999.99"
		nTotCre+=aStruct[i,3]
	else
		@nLin,040 PSAY aStruct[i,3] Picture "@E 999,999,999,999.99"
		nTotDeb+=aStruct[i,3]
	endif
	nLin++
	
	if nLin > nMaxLin
		Cabec(Titulo,Cabec1,Cabec2,NomeProg,Tamanho,nTipo)
		nLin := 9
	Endif
	
next i
@nLin,000 PSAY Replicate("-",60)
nLin++
@nLin,000 PSAY "Total"
@nLin,020 PSAY nTotCre Picture "@E 999,999,999,999.99"
@nLin,040 PSAY nTotDeb Picture "@E 999,999,999,999.99"
nLin++
@nLin,000 PSAY "Valor Liquido"
if (nTotcre+ntotDeb) >= 0
	@nLin,020 PSAY (nTotcre+ntotDeb) Picture "@E 999,999,999,999.99"
else
	@nLin,040 PSAY (nTotcre+ntotDeb) Picture "@E 999,999,999,999.99"
endif
nLin++

@ nLin,000 PSay __PrtThinLine()
nLin++

SET DEVICE TO SCREEN
If aReturn[5]==1
	dbCommitAll()
	SET PRINTER TO
	OurSpool(wnrel)
EndIf
MS_FLUSH()
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ?
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ?
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑ?
ฑฑบPrograma  ?showSubTotal?Autor ?Abrahao P. Santos     ?Data da Criacao  ?11/12/2008             						บฑ?
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบDescricao ?Imprime subtotal do fretista                                                            						บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑ?         ?															                               						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบParametros?nLin   																										บฑ?
ฑฑ?		 ?											   					                       						บฑ?
ฑฑ?		 ?																											บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบRetorno   ?nLin  						  							                               						บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบUsuario   ?Totvs / Microsiga											                             					บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบSetor     ?Gestao do Leite                                                                          					บฑ?
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑ?           			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑ?
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑ?
ฑฑบAutor     ?Data     ?Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑ?
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑ?
ฑฑ?         ?         ?                  							   ?                                 ? 	        บฑ?
ฑฑ?---------?---------?-------------------------------------------------?---------------------------------?------------บฑ?
ฑฑ?         ?         ?                   							   ?                                 ?			บฑ?
ฑฑ?---------?---------?-------------------------------------------------?---------------------------------?------------บฑ?
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑ?
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ?
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿?
*/
Static Function showSubTotal(nLin)

if nqtdlin > 1
	@nlin,000 PSAY "Subtotal"+Replicate(".",15)
	@nlin,025 PSAY nSubVol Picture "@E 9,999,999"
	@nlin,035 PSAY nSubKm Picture  "@E 9,999,999"
	@nlin,045 PSAY nSubDia Picture "@E 9,999,999"
	nPos1:=55
	for i:=1 to len(aStruct)
		if i<=nMaxCol
			@nLin,nPos1 PSAY aSubTots[i] Picture "@E 99,999.99"
			nPos1 += nTamCmp
		endif
		if i==len(aStruct) .and. nOutros <> 0
			@nLin,nPos1 PSAY aSubTots[i] Picture "@E 99,999.99"
			nPos1 += nTamCmp
		endif
		aSubTots[i]:=0
	next i
	@nLin,205 PSAY nSubLiq Picture "@E 99,999,999.99"
	nLin++
endif
for y:=1 to len(aSubTots)
	aSubTots[y]:=0
next
nqtdlin:=0
nSubVol:=0
nSubKm :=0
nSubDia:=0
nSubLiq:=0

return nLin

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ?
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ?
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑ?
ฑฑบPrograma  ?getStruct   ?Autor ?Abrahao P. Santos     ?Data da Criacao  ?09/12/2008             						บฑ?
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบDescricao ?Retorna campos dinamicos que estao na ZLF                                               						บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑ?         ?															                               						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบUso       ?															                               						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบParametros?	Nenhum																										บฑ?
ฑฑ?		 ?											   					                       						บฑ?
ฑฑ?		 ?																											บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบRetorno   ?Nenhum						  							                               						บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบUsuario   ?Totvs / Microsiga											                             					บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบSetor     ?Gestao do Leite                                                                          					บฑ?
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑ?           			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑ?
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑ?
ฑฑบAutor     ?Data     ?Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑ?
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑ?
ฑฑ?         ?         ?                  							   ?                                 ? 	        บฑ?
ฑฑ?---------?---------?-------------------------------------------------?---------------------------------?------------บฑ?
ฑฑ?         ?         ?                   							   ?                                 ?			บฑ?
ฑฑ?---------?---------?-------------------------------------------------?---------------------------------?------------บฑ?
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑ?
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ?
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿?
*/
Static Function getStruct(cpSetor,cpMix)

Local aArea := GetArea()
Local aCampos := {}

cQuery1 := " SELECT ZLF_EVENTO AS CODIGO,MAX(ZLF_DEBCRE) AS DEBCRE "
cQuery1 += " FROM " + RetSqlName("ZLF") + " ZLF "
cQuery1 += " WHERE ZLF.D_E_L_E_T_ = ' ' "
cQuery1 += " AND ZLF.ZLF_SETOR = '" + AllTrim(cpSetor) + "' "
cQuery1 += " AND ZLF.ZLF_CODZLE = '" + AllTrim(cpMix) + "' "
cQuery1 += " AND ZLF.ZLF_TP_MIX = 'F' "
cQuery1 += " GROUP BY ZLF_EVENTO ORDER BY ZLF_EVENTO "
If Select("TRB") > 0
	dbSelectArea("TRB")
	dbCloseArea("TRB")
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery1), "TRB", .T., .F. )
while !TRB->(eof())
	aAdd(aCampos,{TRB->CODIGO,POSICIONE("ZL8",1,XFILIAL("ZL8")+TRB->CODIGO,"ZL8_NREDUZ"),0})
	TRB->(dbskip())
enddo
TRB->(dbclosearea())

restArea(aArea)
Return aCampos

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ?
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ?
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑ?
ฑฑบPrograma  ?ValidPerg   ?Autor ?Abrahao P. Santos     ?Data da Criacao  ?09/12/2008             						บฑ?
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบDescricao ?Funcao estatica que cria as perguntas/parametros da tabela SX1.                         						บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑ?         ?															                               						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบUso       ?	SX1 - Tabela de Parametros								                               						บฑ?
ฑฑ?         ?															                               						บฑ?
ฑฑ?         ?															                               						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบParametros?	Nenhum																										บฑ?
ฑฑ?		 ?											   					                       						บฑ?
ฑฑ?		 ?																											บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบRetorno   ?Nenhum						  							                               						บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบUsuario   ?Totvs / Microsiga											                             					บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบSetor     ?Gestao do Leite                                                                          					บฑ?
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑ?           			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑ?
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑ?
ฑฑบAutor     ?Data     ?Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑ?
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑ?
ฑฑ?         ?         ?                  							   ?                                 ? 	        บฑ?
ฑฑ?---------?---------?-------------------------------------------------?---------------------------------?------------บฑ?
ฑฑ?         ?         ?                   							   ?                                 ?			บฑ?
ฑฑ?---------?---------?-------------------------------------------------?---------------------------------?------------บฑ?
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑ?
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ?
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿?
*/
Static Function ValidPerg()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

//Do Setor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo do Setor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"01","Setor   "," "," ","mv_ch1","C",6,0,0,"G",'U_ValSetPar()',"ZL2_01","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Mix
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo do Mix  ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"02","Mix     "," "," ","mv_ch2","C",6,0,0,"G","","ZLE_01","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Fretista
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial do Fretista  ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"03","Do Fretista"," "," ","mv_ch3","C",6,0,0,"G","","SA2_L3","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial da Loja  ')
Aadd( aHelpPor, 'do fretista que deseja filtrar.   ')
U_xPutSx1(cPerg,"04","Da Loja   "," "," ","mv_ch4","C",2,0,0,"G","","","","","mv_par04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ao Fretista
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final do Fretista  ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"05","Ao Fretista"," "," ","mv_ch5","C",6,0,0,"G","","SA2_L3","","","mv_par05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final   da Loja  ')
Aadd( aHelpPor, 'do fretista que deseja filtrar.   ')
U_xPutSx1(cPerg,"06","Ate a Loja "," "," ","mv_ch6","C",2,0,0,"G","","","","","mv_par06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Linha
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial da linha  ')
Aadd( aHelpPor, 'que deseja filtrar.   ')
U_xPutSx1(cPerg,"07","Da Linha  "," "," ","mv_ch7","C",6,0,0,"G","","ZLW_01","","","mv_par07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//ate a Linha
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final da linha  ')
Aadd( aHelpPor, 'que deseja filtrar.   ')
U_xPutSx1(cPerg,"08","Ate a Linha"," "," ","mv_ch8","C",6,0,0,"G","","ZLW_01","","","mv_par08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return