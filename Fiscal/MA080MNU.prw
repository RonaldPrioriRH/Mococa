#INCLUDE 'PROTHEUS.CH'
#include "rwmake.ch"
#INCLUDE  "Topconn.ch"
#INCLUDE  "FWMVCDEF.CH"
 
/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Funçào    ¦ MA080MNU  ¦ Autor ¦ Claudio Ferreira     ¦ Data ¦ 21.10.11 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Ponto de entrada para alterar opção no menu da TES         ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ Hospfar                                                    ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
 
User Function MA080MNU()
 
Local aRotina := ParamIxb[1]
 
	ADD OPTION aRotina TITLE "Copiar" ACTION 'u_DlgCopyTES' OPERATION 3 ACCESS 0 //"Incluir"
 
Return aRotina

/*
 Não funciona mais, some os MENUS da rotina
 User Function MA080MNU()
   Local aRotina := ParamIxb[1]
   aadd(aRotina,{'Copiar','u_DlgCopyTES' ,0, 1, 0, nil})
 return   
*/

User Function DlgCopyTES()  
Private oDlg1
Private cTES:=Space(3)
Private _cFil:=Space(Len(cFilAnt))
 
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Dialogo de copia                                             ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

@ 96,42 TO 323,505 DIALOG oDlg1 TITLE "Copia TES"
@ 8,10 TO 84,222
@ 91,168 BMPBUTTON TYPE 1 ACTION OkProcCP(cTES)
@ 91,196 BMPBUTTON TYPE 2 ACTION Close(oDlg1)
@ 23,14 SAY "TES Destino :"
@ 23,52 Get cTES  SIZE 040,60
@ 43,14 SAY "Fil Destino :"
@ 43,52 Get _cFil  SIZE 040,60
ACTIVATE DIALOG oDlg1 CENTERED
Return

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Executa OK                                                   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

Static Function OkProcCP(cTES)
Local nReg   := SF4->( Recno() )
Local aFilsCalc	:= MatFilCalc(.f.)
Local cFiliais:=''
  
  aEval(aFilsCalc, {|e, nX| cFiliais+=e[2]+"#"  } )
  
  if !_cFil$cFiliais .and. !empty(_cFil)
    msgbox("Filial destino não encontrada!")
	DbGoto(nReg)
  	return 
  endif

  dbSelectArea("SF4")
  dbSetOrder(1) 
  if !empty(_cFil)
    _cFilTes:=_cFil
  else  
    _cFilTes:=cFilAnt
  endif
  if dbSeek(_cFilTes+cTES)
    msgbox("TES já existente")
	DbGoto(nReg)
  	return 
  endif
  DbGoto(nReg)
  RegToMemory("SF4",.f.)		
  RecLock("SF4",.T.)    
  M->F4_CODIGO  := cTES
  MemToReg("SF4")
  if !empty(_cFil)
    SF4->F4_FILIAL  := _cFil
  endif  
  SF4->(MsUnLock())
  Msgbox("TES Criado com sucesso")  
  Close(oDlg1)
Return .t.



/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³MemToReg  ºAutor  ³Cláudio Ferreira    º Data ³  12/12/08   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Função para gravar as variaveis de memory para o registro  º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³u_MemToReg(cAlias) 										  º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function MemToReg(cAlias)
Local aArea    := GetArea()
Local nX    := 0           
Local bCampo := { |nField| FieldName(nField) }

dbSelectArea(cAlias)
For nX := 1 To FCount()
	If "FILIAL" $ FieldName(nX)
		FieldPut(nX,xFilial(cAlias))
	Else
		FieldPut(nX,M->&(Eval(bCampo,nX)))
	Endif
Next
RestArea(aArea)
Return(Nil)
