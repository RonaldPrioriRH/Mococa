#INCLUDE "PROTHEUS.CH"
#INCLUDE "RWMAKE.CH"
#INCLUDE "tbiconn.ch"
#INCLUDE "tbicode.ch"

#Define STR_PULA		Chr(13)+Chr(10)
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ   AJUSTPD3                                       07/03/2019บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ   Ajuste SD3			                                      บฑฑ
ฑฑบ                                                                       บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿  */
User Function AJUSTPD3()
cPerg 	:= Padr("AJUSP3",10)
Private _lReturn     := .F.

IF !fDigSenha()
	Return
Endif

Private lMsErroAuto := .F.

ValidPerg()
Pergunte(cPerg,.F.)

cCadastro     := " "
aSays         := {}
aButtons      := {}
_nOpc         := 0

AADD(aSays,"Corre็ใo dos Movimentos de Terceiros ")
AADD(aSays,"de Estoque ")
AADD(aSays,"")
AADD(aButtons,{5,.T.,{|| Pergunte(cPerg,.T.)	}})
AADD(aButtons,{1,.T.,{|| (_nOpc := 1, FechaBatch())	}})
AADD(aButtons,{2,.T.,{|| FechaBatch() 		  	}})

FormBatch(cCadastro, aSays, aButtons)

If _nOpc = 1
	Processa({|| AJUSTA()},cCadastro)
EndIf

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAJUSTA     บAutor  ณMicrosiga          บ Data ณ  07/03/2019 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function AJUSTA()

//Local aDados := {}
Local lSqlOk := .T.
cFilDe  	 := mv_par01
cFilAte    	 := mv_par02
cDataDe    	 := mv_par03
cDataAte     := mv_par04
cProd		 := mv_par05
cOP			 := mv_par06

//Montando consulta de dados
	cQuery := ""
	cQuery += "SELECT D3_FILIAL, D3_TM, D3_COD, D3_CF, D3_OP, D3_TM, D3_EMISSAO, D3_ESTORNO, D3_X_ETQ, R_E_C_N_O_ AS recnoup "		+ STR_PULA
	cQuery += "FROM   SD3010 "		+ STR_PULA
	cQuery += "WHERE  SD3010.D_E_L_E_T_ = ' ' "		+ STR_PULA
	cQuery += "       AND D3_FILIAL BETWEEN '"+ mv_par01 +"' AND '"+ mv_par02 +"' "  + STR_PULA
	cQuery += "       AND D3_EMISSAO BETWEEN '"+ dtos(mv_par03) +"' AND '"+ dtos(mv_par04) +"' " + STR_PULA
	cQuery += "       AND D3_ESTORNO <> 'S' "		+ STR_PULA
	cQuery += "       AND D3_TM IN ('510', '999') "		+ STR_PULA
	//cQuery += "       AND D3_COD IN '"+ mv_par05 +"' "
	If !Empty(cProd) // Produtos separados por ;
		cQuery   += " 		AND D3_COD  IN "+FormatIn(AllTrim(cProd),";") + STR_PULA
	EndIf
	//cQuery += "       AND D3_OP  IN '"+ mv_par06 +"' " 
	If !Empty(cOP) // Ordens de Pord. separadas por ;
		cQuery   += " 		AND D3_OP IN "+FormatIn(AllTrim(cOP),";") + STR_PULA 
	EndIf

dbUseArea(.T.,"TOPCONN",TCGENQRY(, ,cQuery),"SQL",.F.,.T.)
MemoWrite("C:\AJUSP3_CONSULTA.sql",cQuery)
DbSelectArea("SQL")

SQL->(DbGoTop())

	If SQL->(Eof())
		msginfo("Nใo existem dados para realizar altera็ใo")
	EndIF 

DO While !SQL->(Eof())

	
	IncProc("Processando SD3... ")

    //CORRIGE A TM 509 E CF RE9
	
	//Montando consulta de dados
	_cQuery := ""
	_cQuery += "UPDATE " + RetSqlName("SD3") + STR_PULA
	//_cQuery += "SET D3_X_ETQ = D3_TM||D3_CF||"+"'07/2019', "		+ STR_PULA
	_cQuery += "SET D3_X_ETQ = D3_TM||D3_CF||'"+AllTrim(str(Month(Date())))+'/'+AllTrim(str(Year(Date())))+"', "+ STR_PULA
	_cQuery += "	D3_TM ='509', "		+ STR_PULA
	_cQuery += "	D3_CF ='RE9' "		+ STR_PULA
	_cQuery	+= "WHERE R_E_C_N_O_ =  " + alltrim(str(recnoup)) "
	
	MemoWrite("C:\AJUSP3_update.sql",_cQuery)
	
	lSqlOk := !(TCSQLExec(_cQuery) < 0)
	if lSqlOk .and. (TcGetDB() == 'ORACLE')
		lSqlOk := !(TCSQLExec("COMMIT") <0)
	endif
	
	If !lSqlOk
		msginfo("ERRO QUERY UPDATE TM 509, CF RE9")
		msginfo(TCSQLError())
		msginfo("Verifiquei a Sintaxe da Query.")
	endif
		
	SQL->( dbSkip())
	
EndDo
		
SQL->(DbCloseArea())

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAJUSTAD3  บAutor  ณMicrosiga           บ Data ณ  07/03/2019 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function ValidPerg

Local _sAlias, aRegs, i,j

_sAlias := Alias()
aRegs := {}
I := 0
J := 0

dbSelectArea("SX1")
dbSetOrder(1)

Aadd(aRegs,{cPerg,"01","Filial de?     	", "Filial 	    ?",		"Filial 	?",		"mv_ch1","C",04,0,0,"G" ,"","mv_par01","","","","","","","","","","","","","","","","","","",""	,""	,""	,""	,"","","SM0",""})
Aadd(aRegs,{cPerg,"02","Filial Ate?    	", "Filial  	?",		"Filial    	?",		"mv_ch2","C",04,0,0,"G" ,"","mv_par02","","","","","","","","","","","","","","","","","","","",""	,""	,""	,"","","SM0",""})
Aadd(aRegs,{cPerg,"03","Data de?    	", "Data      	?",		"Data      	?",		"mv_ch3","D",08,0,0,"G" ,"","mv_par03","","","","","","","","","","","","","","","","","","",""	,""	,""	,""	,"","","",""})
Aadd(aRegs,{cPerg,"04","Data Ate?   	", "Data      	?",		"Data      	?",		"mv_ch4","D",08,0,0,"G" ,"","mv_par04","","","","","","","","","","","","","","","","","","","",""	,""	,""	,"","","",""})
Aadd(aRegs,{cPerg,"05","Produtos ?  	", "Produto 	?",		"Produto 	?",		"mv_ch5","C",90,0,0,"G" ,"","mv_par05","","","","","","","","","","","","","","","","","","",""	,""	,""	,""	,"","","",""})
Aadd(aRegs,{cPerg,"06","Ordens Produ็ใo? ","Ordem Prod. ?",	    "Ordem Prod.?",		"mv_ch6","C",99,0,0,"G" ,"","mv_par06","","","","","","","","","","","","","","","","","","","",""	,""	,""	,"","","",""})

For i:=1 to Len(aRegs)
	If !dbSeek(cPerg+aRegs[i,2])
		RecLock("SX1",.T.)
		For j:=1 to FCount()
			If j <= Len(aRegs[i])
				FieldPut(j,aRegs[i,j])
			Endif
		Next
		MsUnlock()
	Endif
Next

dbSelectArea(_sAlias)

Return

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Static Function fDigSenha()
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	Private cSenha   := Space(10)
	Private cSenhAce := GETMV("MV_AJTERCE")
	@ 067,020 To 169,312 Dialog Senhadlg Title OemToAnsi("Libera็ใo de Acesso")
	@ 015,005 Say OemToAnsi("Informe a senha para o acesso ?") Size 80,8
	@ 015,089 Get cSenha Size 50,10 Password
	@ 037,106 BmpButton Type 1 Action fOK()
	@ 037,055 BmpButton Type 2 Action Close(Senhadlg)
	Activate Dialog Senhadlg CENTERED
Return(_lReturn)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Static Function fOK()
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	If ALLTRIM(cSenha)<> cSenhAce
		MsgStop("Senha nใo Confere !!!")
		cSenha  := Space(10)
		dlgRefresh(Senhadlg)
	Else
		_lReturn  := .T.
		Close(Senhadlg)
	Endif
Return

