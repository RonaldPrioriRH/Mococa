#include "rwmake.ch"
#include "topconn.ch"
#include "protheus.ch"
#include "TBICONN.CH"

/*
_____________________________________________________________________________
�����������������������������������������������������������������������������
��+-----------------------------------------------------------------------+��
���Programa  � RPCOME02  � Autor � Claudio Ferreira    � Data � 20/12/17  ���
��+----------+------------------------------------------------------------���
���Descri��o � Fun��o para gerar lan�amento PCO                           ���
���          �                                                            ���
��+----------+------------------------------------------------------------���
��� Uso      � MOCOCA                                                     ���
��+-----------------------------------------------------------------------+��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function RPCOME02()

Private cCadastro := "Movimentos de Folha PCO"

//���������������������������������������������������������������������Ŀ
//� Monta um aRotina proprio                                            �
//�����������������������������������������������������������������������

Private aRotina := { {"Pesquisar","AxPesqui",0,1} ,;
				{"Visualizar","AxVisual",0,2},;
	            {"Importar","u_ImpPco",0,3} ,;
	            {"Limpar","u_LimpPco",0,3} ,;
	            {"Gerar PCO","u_GeraPco",0,4}}
//             {"Excluir","AxDeleta",0,5} }

Private cDelFunc := ".T." // Validacao para a exclusao. Pode-se utilizar ExecBlock

Private cString := "ZPA"
                    
dbSelectArea("ZPA")
dbSetOrder(1)

dbSelectArea(cString)
mBrowse( 6,1,22,75,cString)

   
Return
                
User Function ImpPco(cAlias,nReg,nOpc)
@ 00,000 TO 227,463 DIALOG oDlg TITLE "Importacao de lan�amentos"
@ 08,010 TO 84,222
@ 23,016 SAY OemToAnsi("Este programa ir� Importar os lan�amentos"+space(30))
@ 91,168 BMPBUTTON TYPE 1 ACTION OkProc()
@ 91,196 BMPBUTTON TYPE 2 ACTION Close(oDlg)
ACTIVATE DIALOG oDlg CENTERED

Return


Static Function OkProc()
Processa( {|| RunProc() } )
Return


Static Function RunProc()
Local nTamLinha:=352
Local cArq := TelaArq()
Local cEOL := CHR(13)+CHR(10) 
Local cFilOld:=cFilAnt
Private aLog:={}
Private nHandle


FT_FUSE(cArq) // abre o arquivo


ProcRegua(0)


cString  := FT_FREADLN()
_cSeq     :="000"

while Alltrim(cString) <> ''  
	
		_filial   := subst(cString,1,4)
		_dData    := Ctod(subst(cString,16,2)+"/"+subst(cString,18,2)+"/"+subst(cString,20,4))
		_cConta   := subst(cString,44,20)
		_cCusto   := subst(cString,64,8)
		if empty(_cCusto)				
			//_cCusto   := subst(cString,65,8)
		endif	
		_cHist    := subst(cString,142,40)
		_nValor   := Val(subst(cString,182,17))/100
		_cClasse   := subst(cString,199,6)
		_cSeq     := Soma1(_cSeq)

		dbSelectArea("ZPA")
		RecLock("ZPA",.T.)
		ZPA_FILIAL := _filial
		ZPA_CONTA  := _cConta
		ZPA_CLASSE := _cClasse
		ZPA_DATA   := _dData
		ZPA_CC     := _cCusto
		ZPA_HIST   := _cHist 
		ZPA_VALOR  := _nValor
		ZPA_SEQ    := _cSeq
		MsUnLock()

		cMsg :="OK: Foi importado lan�amento no valor de R$ "+Alltrim(Transform(_nValor,'@e 9,999,999.99'))+" - "+_cHist
	    if ascan(aLog,cMsg)==0
		  aadd(aLog,cMsg)
	    endif
	//Proxima linha
	FT_FSKIP()
	cString  := FT_FREADLN()
	incProc()	
enddo
cFilAnt:=cFilOld
FCLOSE(nHandle)

if len(aLog)>0
	LogProc("IMPORTACAO LANCAMENTOS",aLog)
endif

Return

User Function GeraPco
Private cPerg        := "GERAPCO"

ValidPerg()          // Cria pergunta

if !pergunte(cPerg,.T.)
	return
endif


if msgyesno("Confirma processamento do PCO ?")
	Processa( {|| RunProc2() } )
endif
Return


Static Function RunProc2()
Local cConta:= ''
Local nConta:=0
Local oldFilAnt:=cFilAnt

If Lastday(mv_par01)<>Lastday(mv_par02)
    Alert('Periodo inv�lido')
	Return
EndIf


Dbselectarea("ZPA")
Dbsetorder(1)
Dbseek(mv_par03+dtos(mv_par01),.t.)
dDataPCO := LastDay(MV_PAR02)
While ZPA->ZPA_FILIAL<=mv_par04
    cFilAnt:=ZPA->ZPA_FILIAL
    Dbseek(xFilial("ZPA")+dtos(mv_par01),.t.)
	While !Eof() .and. cFilAnt=ZPA->ZPA_FILIAL .and. ZPA->ZPA_DATA<=mv_par02
		nConta++
		DbSkip()
	Enddo
Enddo

ProcRegua(nConta)

Dbselectarea("ZPA")
Dbsetorder(1)
Dbseek(mv_par03,.t.)
dDataPCO := LastDay(MV_PAR02)
PcoIniLan("900020",.F.)
While ZPA->ZPA_FILIAL<=mv_par04
    cFilAnt:=ZPA->ZPA_FILIAL
    Dbseek(xFilial("ZPA")+dtos(mv_par01),.t.)
	While !Eof() .and. cFilAnt=ZPA->ZPA_FILIAL .and. ZPA->ZPA_DATA<=mv_par02
		IncProc("Atualizando saldos do PCO...")
		PcoDetLan("900020","01","GERFOL")
		DbSkip()
	Enddo
Enddo
IncProc("Atualizando saldos do PCO...")
PcoFinLan("900020",,,.F.)
cFilAnt:=oldFilAnt
Return
  
User Function LimpPCO()
Private cPerg        := "GERAPCO"

ValidPerg()          // Cria pergunta

if !pergunte(cPerg,.T.)
	return
endif

If Lastday(mv_par01)<>Lastday(mv_par02)
    Alert('Periodo inv�lido')
	Return
EndIf

if !msgyesno("Confirma apagar os lan�amentos do periodo de "+Dtoc(mv_par01)+" a "+Dtoc(mv_par02)+" ?")
	Return
endif
//Estorna PCO
Dbselectarea("ZPA")
Dbsetorder(1)
Dbseek(mv_par03,.t.)
dDataPCO := LastDay(MV_PAR02)
PcoIniLan("900020",.F.)
While ZPA->ZPA_FILIAL<=mv_par04
    cFilAnt:=ZPA->ZPA_FILIAL
    Dbseek(xFilial("ZPA")+dtos(mv_par01),.t.)
	While !Eof() .and. cFilAnt=ZPA->ZPA_FILIAL .and. ZPA->ZPA_DATA<=mv_par02
		  Dbselectarea("ZPA")
		  If  RecLock("ZPA",.F.)
			PcoDetLan("900020","01",'GERFOL',.T.)
			ZPA->(DbDelete())
			ZPA->(DbUnLock())
		  EndIf
		  DbSkip()
	Enddo
Enddo
PcoFinLan("900020",,,.F.)
Return

Static Function ValidPerg()

//Local cPerg
_sAlias	:=	Alias()
//Retirado Sangelles 22/03/2022 ->dbSelectArea("SX1")
//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
cPerg 	:=	PADR(cPerg,10)
u_xputSx1(     cPerg,"01","Data de    ?","."     ,"." ,"mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
u_xputSx1(     cPerg,"02","Data ate   ?","."     ,"." ,"mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")
U_xPutSx1(	   cPerg,"03","Filial de  ?","."     ,"." ,"mv_CH3","C",04,0,0,"G","","SM0","","","MV_PAR03","","","","","","","","","","","","","","","","")
U_xPutSx1(     cPerg,"04","Filial ate ?","."     ,"." ,"mv_CH4","C",04,0,0,"G","","SM0","","","MV_PAR04","","","","","","","","","","","","","","","","")

dbSelectArea(_sAlias)

Return


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �RUNDLG    �Autor  �Microsiga           � Data �  06/10/08   ���
�������������������������������������������������������������������������͹��
���Desc.     � SELECAO DO ARQUIVO                                         ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function TelaArq

cTipo :=         "Arquivos textos    (*.TXT) | *.TXT | "
cTipo := cTipo + "Todos os Arquivos  (*.*)   | *.*     "

cFile := cGetFile(cTipo,"Selecione arquivo a ser importado")

Return(cFile)    

/*
_____________________________________________________________________________
�����������������������������������������������������������������������������
��+-----------------------------------------------------------------------+��
���Programa  � LogProc  � Autor � Claudio Ferreira      � Data � 26/08/16 ���
��+----------+------------------------------------------------------------���
���Descri��o � Relatorio de Log de Processos                              ���
��+----------+------------------------------------------------------------���
��� Uso      � Generico                                                   ���
���          �                                                            ���
��+-----------------------------------------------------------------------+��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function LogProc(cOrigem,aLog)
                                              
titulo   := "LOG DO PROCESSO - "+cOrigem
cDesc1   := "Este programa ir� emitir um Log de Processo"
cDesc2   := "conforme parametros especificados."
cDesc3   := ""
cString  := ""
aReturn  := { "Zebrado", 1,"Administracao", 2, 2, 1, "",1 }
nLastKey := 0
ntamanho := "M"
wnrel    := "LOGPROC"
nomeProg := "LOGPROC"
li       := 99
m_pag    := 1
nTipo    := IIF(aReturn[4]==1,15,18)
wnrel    := SetPrint(cString,wnrel,,@titulo,cDesc1,cDesc2,cDesc3,.F.,,.F.,)
If LastKey() == 27 .Or. nLastKey == 27
	Return
Endif
SetDefault(aReturn,cString)
RptStatus({|| ILogPro2(cOrigem,aLog)},Titulo)

Return Nil

Static Function ILogPro2(cOrigem,aLog)
cabec1  := "Descricao do Evento"
cabec2  := ""
SetRegua(len(aLog))
For _xi:=1 to len(aLog)
	incregua()
	if li > 60
		li:=Cabec(titulo,cabec1,cabec2,nomeprog,nTamanho,nTipo)+1
	endif
	@ li,000 Psay aLog[_xi]
	li++
Next

Roda(0,nTamanho)

Set Device to Screen

If aReturn[5] == 1
	Set Printer To
	dbCommitAll()
	ourspool(wnrel)
endif

MS_FLUSH()

Return Nil


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �SqlRet    �Autor  �Cl�udio Ferreira    � Data �  14/01/09   ���
�������������������������������������������������������������������������͹��
���Desc.     � Fun��o para retornar o campo via SQL                       ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �u_SqlRet(cCampo,cCond)									  ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function SqlRet(cCampo,cCond,cEmp)
Local  cAlias:= Alias()
Local cQuery:=''
Local QAux,Retorno
Local cTabela:=Substr(cCampo,1,At('_',cCampo)-1) 
Local cFil:=cTabela+'_FILIAL'  
Default cEmp:=''

cTabela:=iif(len(cTabela)==2,"S","")+cTabela

if empty(cEmp)
  cFrom:=RetSqlName(cTabela)
else
  cFrom:=cTabela+cEmp+'0'
endif 
         
	cQuery := "SELECT "+cCampo+" as cRet  FROM "+cFrom+" WHERE "
	cQuery += "D_E_L_E_T_<>'*' AND "
	cQuery += cFil+" = '"+xfilial(cTabela)+"' AND  "
	cQuery += cCond
	cQuery:=Changequery(cQuery)
	TCQUERY cQuery NEW ALIAS "QAux"
	Retorno:=QAux->cRet
	QAux->(dbCloseArea())
    
dbselectarea(cAlias)    
Return Retorno  
