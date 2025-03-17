#include "protheus.ch"
#include "report.ch"

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ?
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑ?
ฑฑบPrograma  ?RGLT011  ?Autor ?TOTVS                 ?Data da Criacao  ?22/10/2008                						บฑ?
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบDescricao ?Resumo dos Eventos.												                       						บฑ?
ฑฑ?		 ?													                                   						บฑ?
ฑฑ?         ?															                               						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบUso       ?Tabela ZL8 - Cadastro de Eventos							                               						บฑ?
ฑฑ?		 ?Tabela ZLF - Detalhes do Mix							                                   						บฑ?
ฑฑ?         ?															                               						บฑ?
ฑฑ?         ?															                               						บฑ?
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑ?
ฑฑบParametros?	mv_par01 = Evento de:																						บฑ?
ฑฑ?		 ?mv_par02 = Evento ate:						   					                       						บฑ?
ฑฑ?		 ?mv_par03 = Data de:																							บฑ?
ฑฑ?		 ?mv_par04 = Data ate:														                                บฑ?
ฑฑ?		 ?mv_par05 = Filial de:																						บฑ?
ฑฑ?		 ?mv_par06 = Filial ate:														                                บฑ?
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
ฑฑบAbrahao   ?9/12/09  ณmodificacao nos campos	das tabelas				   ?                                 ? 	        บฑ?
ฑฑ?---------?---------?-------------------------------------------------?---------------------------------?------------บฑ?
ฑฑ?         ?         ?                   							   ?                                 ?			บฑ?
ฑฑ?---------?---------?-------------------------------------------------?---------------------------------?------------บฑ?
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑ?
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ?
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿?
*/
User Function RGLT011()

Local cDesc1			:= "Este programa tem como objetivo imprimir relatorio "
Local cDesc2			:= "de acordo com os parametros informados pelo usuario."
Local cDesc3			:= "RESUMO DE EVENTOS"
Local cPict				:= ""
Local titulo			:= "RESUMO DE EVENTOS"
Local nLin				:= 80
Local Cabec1			:= " "
Local Cabec2			:= "CODIGO    EVENTO                           VOLUME    CREDITOS R$     DEBITOS R$   VALOR P/ LTS MIX"
Local imprime			:= .T.
Local aOrd				:= {}
Local cQuery1			:= ""
Local cQuery2			:= ""
Private lEnd			:= .F.
Private lAbortPrint		:= .F.
Private CbTxt			:= ""
Private limite			:= 80
Private tamanho			:= "M"
Private nomeprog		:= "RGLT011" // Coloque aqui o nome do programa para impressao no cabecalho
Private nTipo			:= 18
Private aReturn			:= { "Zebrado", 1, "Administracao", 2, 2, 1, "", 1}
Private nLastKey		:= 0
Private cbtxt			:= Space(10)
Private cbcont			:= 00
Private CONTFL			:= 01
Private m_pag			:= 01
Private wnrel			:= "RGLT011" // Coloque aqui o nome do arquivo usado para impressao em disco
Private cPerg			:= "RGLT011   "
Private cString			:= "ZLD"

validperg()
pergunte("RGLT011",.F.)

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
ฑฑบPrograma  ?RUNREPORT   ?Autor ?Marcelo Sanches       ?Data da Criacao  ?13/10/2008             						บฑ?
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
Local dtini,dtfim

// posiciona no Mix pra pegar datas
dbselectarea("ZLE")
dbsetorder(1)
dbseek(xfilial("ZLE")+mv_par02)
	dtini:=ZLE->ZLE_DTINI
	dtfim:=ZLE->ZLE_DTFIM
dbclosearea("ZLE")

Cabec1 := "Setor: "+mv_par01+" Mix: "+mv_par02

nLin := 50

cQuery1 := " SELECT ZLF_EVENTO,MAX(ZLF_DEBCRE) AS DEBCRE,SUM(ZLF_QTDBOM) AS VOLUME, "
cQuery1 += " SUM(ZLF_TOTAL) AS TOTAL,MAX(ZLF_ENTMIX) AS MIX FROM " + RetSqlName("ZLF") + " ZLF "
cQuery1 += " WHERE ZLF.ZLF_SETOR = '" + AllTrim(MV_PAR01) + "' "
cQuery1 += " AND ZLF.ZLF_CODZLE = '" + AllTrim(MV_PAR02) + "' "
cQuery1 += " AND ZLF.D_E_L_E_T_ = ' ' "
cQuery1 += " GROUP BY ZLF_EVENTO ORDER BY ZLF_EVENTO "
If Select("TEMP") > 0
	dbSelectArea("TEMP")
	dbCloseArea("TEMP")
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery1), "TEMP", .T., .F. )
while !TEMP->(eof())
	if nLin >= 50
		Cabec(Titulo,Cabec1,Cabec2,NomeProg,Tamanho,nTipo)
		nLin := 9
	endif
	@nLin,001 PSAY TEMP->ZLF_EVENTO
	@nLin,010 PSAY LEFT(POSICIONE("ZL8",1,XFILIAL("ZL8")+TEMP->ZLF_EVENTO,"ZL8_DESCRI"),20)
	@nLin,035 PSAY TEMP->VOLUME Picture "@E 999,999,999.99"
	if TEMP->DEBCRE == "C"
		@nLin,050 PSAY TEMP->TOTAL Picture "@E 999,999,999.99"
		nTotCre += TEMP->TOTAL
	else
		@nLin,065 PSAY TEMP->TOTAL Picture "@E 999,999,999.99"
		nTotDeb += TEMP->TOTAL
	endif
	@nLin,080 PSAY (TEMP->TOTAL/TEMP->VOLUME) Picture "@E 9,999,999.9999"
	@nLin,95 PSAY iif(TEMP->MIX=="S","Sim","Nao")
	nLin++
	TEMP->(dbskip())
enddo
@ nLin,000 PSay __PrtThinLine()
nLin++

nTotVol := U_VolLeite(xfilial("ZL8"),dtini,dtfim,mv_par01,"","","","")

@nLin,000 PSAY "Totais"
@nLin,035 PSAY nTotVol Picture "@E 999,999,999.99"
@nLin,050 PSAY nTotCre Picture "@E 999,999,999.99"
@nLin,065 PSAY nTotDeb Picture "@E 999,999,999.99"
nLin++
@ nLin,000 PSay __PrtThinLine()

TEMP->(dbclosearea())


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
ฑฑบPrograma  ?ValidPerg   ?Autor ?Marcelo Sanches       ?Data da Criacao  ?13/10/2008             						บฑ?
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

RETURN
