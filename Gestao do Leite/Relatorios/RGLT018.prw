#include "protheus.ch"
#include "report.ch"
/*/
������������������������������������������������������������������������������������������������������������������������������
������������������������������������������������������������������������������������������������������������������������������?
���������������������������������������������������������������������������������������������������������������������������ͻ�?
���Programa  ?RGLT018  ?Autor ?TOTVS                 ?Data da Criacao  ?09/12/2008                						��?
���������������������������������������������������������������������������������������������������������������������������͹�?
���Descricao ?Relatorio de Divergencia entre Estoque (SD3) e Recepcao de Leite (ZLD).                            			��?
��?         ?															                               						��?
���������������������������������������������������������������������������������������������������������������������������͹�?
���Uso       ?															                               						��?
��?         ?															                               						��?
���������������������������������������������������������������������������������������������������������������������������͹�?
���Parametros?Nenhum                 																					��?
��?		 ?													                                   						��?
���������������������������������������������������������������������������������������������������������������������������͹�?
���Retorno   ?Nenhum						  							                               						��?
��?		 ?													                                   						��?
��?		 ?													                                   						��?
���������������������������������������������������������������������������������������������������������������������������͹�?
���Usuario   ?Totvs / Microsiga											                             					��?
���������������������������������������������������������������������������������������������������������������������������͹�?
���Setor     ?Gestao do Leite                                                                          					��?
���������������������������������������������������������������������������������������������������������������������������͹�?
��?           			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						��?
���������������������������������������������������������������������������������������������������������������������������͹�?
���Autor     ?Data     ?Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ��?
���������������������������������������������������������������������������������������������������������������������������ĺ�?
��?         ?         ?                  							   ?                                 ? 	        ��?
��?---------?---------?-------------------------------------------------?---------------------------------?------------��?
��?         ?         ?                   							   ?                                 ?			��?
��?---------?---------?-------------------------------------------------?---------------------------------?------------��?
���������������������������������������������������������������������������������������������������������������������������ͼ�?
������������������������������������������������������������������������������������������������������������������������������?
������������������������������������������������������������������������������������������������������������������������������?
*/
User Function RGLT018


//����������������������������������������������������������������������?
//?Declaracao de Variaveis                                             ?
//����������������������������������������������������������������������?

Local cDesc1         := "Este programa tem como objetivo imprimir relatorio "
Local cDesc2         := "de acordo com os parametros informados pelo usuario."
Local cDesc3         := "Relatorio de Recepcao"
Local cPict          := ""
Local titulo       := "Relatorio de Diferen�a entre Estoque e Recepcao de Leite"
Local nLin         := 80

Local Cabec1       := " SETOR    DATA      TICKET    PRODUTOR                                     VOLUME         ESTOQUE             DIFERENCA"
Local Cabec2       := ""
Local imprime      := .T.
Local aOrd := {}
Private lEnd         := .F.
Private lAbortPrint  := .F.
Private limite           := 120
Private tamanho          := "M"
Private nomeprog         := "RGLT018" // Coloque aqui o nome do programa para impressao no cabecalho
Private nTipo            := 18
Private aReturn          := { "Zebrado", 1, "Administracao", 2, 2, 1, "", 1}
Private nLastKey        := 0
Private cbcont     := 00
Private CONTFL     := 01
Private m_pag      := 01
Private wnrel      := "RGLT018" // Coloque aqui o nome do arquivo usado para impressao em disco
Private cPerg := "RGLT018   "
Private cString := "ZLD"

ValidPerg()

Pergunte(cPerg,.f.)

dbSelectArea("ZLD")
dbSetOrder(1)


//����������������������������������������������������������������������?
//?Monta a interface padrao com o usuario...                           ?
//����������������������������������������������������������������������?

wnrel := SetPrint(cString,NomeProg,cPerg,@titulo,cDesc1,cDesc2,cDesc3,.T.,aOrd,.T.,Tamanho,,.T.)

If nLastKey == 27
	Return
Endif

SetDefault(aReturn,cString)

If nLastKey == 27
   Return
Endif

nTipo := If(aReturn[4]==1,15,18)

//����������������������������������������������������������������������?
//?Processamento. RPTSTATUS monta janela com a regua de processamento. ?
//����������������������������������������������������������������������?

RptStatus({|| RunReport(Cabec1,Cabec2,Titulo,nLin) },Titulo)
Return

/*/
����������������������������������������������������������������������������?
����������������������������������������������������������������������������?
�������������������������������������������������������������������������ͻ�?
���Fun��o    �RUNREPORT ?Autor ?AP6 IDE            ?Data ? 23/01/09   ��?
�������������������������������������������������������������������������͹�?
���Descri��o ?Funcao auxiliar chamada pela RPTSTATUS. A funcao RPTSTATUS ��?
��?         ?monta a janela com a regua de processamento.               ��?
�������������������������������������������������������������������������͹�?
���Uso       ?Programa principal                                         ��?
�������������������������������������������������������������������������ͼ�?
����������������������������������������������������������������������������?
����������������������������������������������������������������������������?
/*/

Static Function RunReport(Cabec1,Cabec2,Titulo,nLin)
Local nQtdReg := 0
Local nAux:=0
Local nQtdDif := 0

cQuery := "SELECT ZLD_FILIAL AS FILIAL,ZLD_SETOR AS SETOR,ZLD_TICKET AS TICKET,ZLD_CODREC AS CODREC, "
cQuery += "MAX(ZLD_RETIRO) AS PRODUTOR,MAX(ZLD_RETILJ) AS LOJA,MAX(ZLD_TOTBOM) AS VOLUME,MAX(ZLD_DTCOLE) AS DTCOLETA "
cQuery += " FROM " + RetSqlName("ZLD") + " ZLD "
cQuery += " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND ZLD_DTCOLE BETWEEN '" + dtos(mv_par01) + "' AND '" + dtos(mv_par02) + "' "
cQuery += " AND ZLD_SETOR = '" + mv_par03 + "'"
cQuery += " AND ZLD_FILIAL = '" + xFilial("ZLD") + "'"
cQuery += " GROUP BY ZLD_FILIAL,ZLD_SETOR,ZLD_TICKET,ZLD_CODREC"


if Select("TRB") > 0
	dbSelectArea("TRB")
	TRB->(dbCloseArea())
endif

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRB',.F.,.T.)

COUNT TO nQtdReg

SetRegua(nQtdReg)

TRB->(dbgotop())
while TRB->(!Eof())
   
	Incregua(TRB->TICKET)   	

   If lAbortPrint
      @nLin,00 PSAY "*** CANCELADO PELO OPERADOR ***"
      Exit
   Endif

   //����������������������������������������������������������������������?
   //?Impressao do cabecalho do relatorio. . .                            ?
   //����������������������������������������������������������������������?

   If nLin > 55 // Salto de P�gina. Neste caso o formulario tem 55 linhas...
      Cabec(Titulo,Cabec1,Cabec2,NomeProg,Tamanho,nTipo)
      nLin := 8
   Endif


	nAux:=getSD3Vol(TRB->CODREC,TRB->SETOR)    



		@nLin,001 PSAY TRB->SETOR
		@nLin,009 PSAY DTOC(STOD(TRB->DTCOLETA))
		@nLin,021 PSAY TRB->TICKET
		@nLin,030 PSAY TRB->PRODUTOR
		@nLin,038 PSAY TRB->LOJA
		@nLin,045 PSAY left(POSICIONE("SA2",1,XFILIAL("SA2")+TRB->PRODUTOR+TRB->LOJA,"A2_NOME"),30)
		@nLin,075 PSAY transform(TRB->VOLUME,"@E 999,999,999")
		@nLin,090 PSAY transform(nAux,"@E 999,999,999")
		@nLin,110 PSAY transform(TRB->VOLUME-nAux,"@E 999,999,999")
		nLin++

	if (nAux != TRB->VOLUME)
		nQtdDif++
		
	endif

   	TRB->(dbSkip()) // Avanca o ponteiro do registro no arquivo
EndDo

TRB->(dbclosearea())

nLin++
@nLin,010 PSAY "Total de Divergencias:"+transform(nQtdDif,"@E 999,999,999")

//����������������������������������������������������������������������?
//?Finaliza a execucao do relatorio...                                 ?
//����������������������������������������������������������������������?

SET DEVICE TO SCREEN

//����������������������������������������������������������������������?
//?Se impressao em disco, chama o gerenciador de impressao...          ?
//����������������������������������������������������������������������?

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

//Da Data
aHelpPor := {}
Aadd( aHelpPor, 'Data Inicial             ')
U_xPutSx1(cPerg,"01","Data Inicial"," "," ","mv_ch1","D",8,0,0,"G","","","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate a Data
aHelpPor := {}
Aadd( aHelpPor, 'Data Final              ')
U_xPutSx1(cPerg,"02","Data Final  "," "," ","mv_ch2","D",8,0,0,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Setor 
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo do Setor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"03","Setor   "," "," ","mv_ch3","C",6,0,0,"G",'U_ValSetPar()',"ZL2_01","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


return

Static Function getSD3Vol(cpTicket,cpSetor)
Local aArea := GetArea()
Local nRet:=0

	_cQuery := " SELECT D3_QUANT "
	_cQuery += " FROM "+RetSqlName("SD3")+" SD3 "
	_cQuery += " WHERE D_E_L_E_T_ = ' '"
	_cQuery += " AND D3_ESTORNO != 'S'"
	_cQuery += " AND D3_L_SETOR = '"+cpSetor+"'"
	_cQuery += " AND D3_L_ORIG = '"+cpTicket+"'"
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(_cQuery))),'TRC',.F.,.T.)
	while TRC->(!Eof())
		nRet+=TRC->D3_QUANT
		TRC->(dbskip())
	enddo
    TRC->(dbclosearea())

RestArea(aArea)
return nRet