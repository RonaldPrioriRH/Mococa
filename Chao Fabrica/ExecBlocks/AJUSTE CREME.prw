#INCLUDE "PROTHEUS.CH"
#INCLUDE "RWMAKE.CH"
#INCLUDE "tbiconn.ch"
#INCLUDE "tbicode.ch"
#DEFINE  ENTER CHR(13)+CHR(10)
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ   AJUSTAD3                                       07/03/2019บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ   Ajuste SD3			                                      บฑฑ
ฑฑบ                                                                       บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿  */
User Function AJUSTAD3()
cPerg 	:= Padr("AJUSD3",10)
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

AADD(aSays,"Corre็ใo do Movimento das requisi็๕es ")
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
ฑฑบPrograma  ณ AJUSTAD3  บAutor  ณMicrosiga          บ Data ณ  07/03/2019 บฑฑ
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
cProdDe		 := mv_par05
cProdAte	 := mv_par06
cOPDe		 := mv_par07
cOPAte		 := mv_par08


cQuery := " select d.r_e_c_n_o_a as recnodel, " // Recno do registro que serแ deletado
cQuery += "     d.recno_max as recnoup, "  
cQuery += " 	d.Numseq_a as numseqa, "
cQuery += "     d.Numseq_b as numseqb, "      
cQuery += "     d.dquant_b as quantb,"
cQuery += "     d.dquant_a as quanta, "
cQuery += "     d.dquant_b - d.dquant_a as qtup "
cQuery += "      from (SELECT a.d3_cod     dcoda_a, "
cQuery += "                   b.d3_cod     dcoda_b, "
cQuery += "                   a.d3_quant   dquant_a, "
cQuery += "                   b.d3_quant   dquant_b, "
cQuery += "                   a.d3_op      dop_a, "
cQuery += "                   b.d3_op      dop_b, "
cQuery += "                   a.d3_emissao demis_a, " 
cQuery += "                   b.d3_emissao demis_b, "
cQuery += "                   a.d3_observa   obs_a, "
cQuery += "                   b.d3_observa   obs_b, "
cQuery += "                   a.d3_cf      dcf_a, "
cQuery += "                   b.d3_cf      dcf_b, "
cQuery += "                   a.d3_numseq      NumSeq_a, "
cQuery += "                   b.d3_numseq      NumSeq_b, "
cQuery += "                   a.r_e_c_n_o_ r_e_c_n_o_a, "
cQuery += "                   b.r_e_c_n_o_ r_e_c_n_o_b, "
cQuery += "                   (select max(b1.r_e_c_n_o_) "
cQuery += "                      from sd3010 b1 "
cQuery += "                     where B1.d3_filial  = a.d3_filial "
cQuery += "                       AND b1.d3_cod     = a.d3_cod "
cQuery += "                       and b1.d3_op      = a.d3_op "
cQuery += "                       and b1.d3_emissao = a.d3_emissao "
cQuery += "                       and b1.d_e_l_e_t_ =' ' "
cQuery += "                       AND b1.d3_estorno <> 'S' "
cQuery += "                       AND b1.d3_tm IN ('499') "
cQuery += "                       and b1.d3_quant = "
cQuery += "                                       (select max(b1.d3_quant) "
cQuery += "                                          from sd3010 b1 "
cQuery += "                                         where B1.d3_filial  = a.d3_filial "
cQuery += "                                           AND b1.d3_cod     = a.d3_cod "
cQuery += "                                           and b1.d3_op      = a.d3_op "
cQuery += "                                           and b1.d3_emissao = a.d3_emissao "
cQuery += "                                           and b1.d_e_l_e_t_ =' ' "
cQuery += "                                           AND b1.d3_estorno <> 'S' "
cQuery += "                                           AND b1.d3_tm IN ('499'))) as recno_max , "
cQuery += "                   (select max(b1.d3_quant) "
cQuery += "                      from sd3010 b1 "
cQuery += "                     where B1.d3_filial  = a.d3_filial "
cQuery += "                       AND b1.d3_cod     = a.d3_cod "
cQuery += "                       and b1.d3_op      = a.d3_op "
cQuery += "                       and b1.d3_emissao = a.d3_emissao "
cQuery += "                       and b1.d_e_l_e_t_ =' ' "
cQuery += "                       AND b1.d3_estorno <> 'S' "
cQuery += "                       AND b1.d3_tm IN ('499')) as dquant_max, "
cQuery += "                    (select count(*) "
cQuery += "                      from sd3010 b1 "
cQuery += "                     where B1.d3_filial  = a.d3_filial "
cQuery += "                       AND b1.d3_cod     = a.d3_cod "
cQuery += "                       and b1.d3_op      = a.d3_op "
cQuery += "                       and b1.d3_emissao = a.d3_emissao "
cQuery += "                       and b1.d_e_l_e_t_ = ' ' "
cQuery += "                       AND b1.d3_estorno <> 'S' "
cQuery += "                       AND b1.d3_tm IN ('499')) as qtreg "
cQuery += "           FROM sd3010 a "
cQuery += "          inner JOIN SD3010 B "
cQuery += "            ON B.d3_filial  = a.d3_filial "
cQuery += "           AND b.d3_cod     = a.d3_cod "
cQuery += "           and b.d3_op      = a.d3_op "
cQuery += "           AND b.d3_observa ='  ' "
cQuery += "           and b.d3_emissao = a.d3_emissao "
cQuery += "           and b.d_e_l_e_t_ =' ' "
cQuery += "           AND b.d3_estorno <> 'S' "
cQuery += "           AND b.d3_tm IN ('499') "
cQuery += "          WHERE a.d_e_l_e_t_ =' ' "
cQuery += "            AND a.d3_estorno <> 'S' " 
cQuery += "            AND a.d3_emissao BETWEEN '"+ dtos(mv_par03) +"' AND '"+ dtos(mv_par04) +"' " 
cQuery += "            AND a.d3_cod BETWEEN '"+ mv_par05 +"' AND '"+ mv_par06 +"' "
cQuery += "            AND a.d3_tm IN ('504') "
cQuery += "            AND a.d3_observa =' ' "
cQuery += "            AND a.d3_filial BETWEEN '"+ mv_par01 +"' AND '"+ mv_par02 +"' " 
cQuery += "     	   order by a.d3_filial, "
cQuery += "              a.d3_cod, "
cQuery += "              a.d3_op, "
cQuery += "              a.d3_emissao "
cQuery += "              ) d "
cQuery += "      where d.recno_max = d.r_e_c_n_o_b  "

dbUseArea(.T.,"TOPCONN",TCGENQRY(, ,cQuery),"SQL",.F.,.T.)
MemoWrite("C:\AJUSD3.sql",cQuery)
DbSelectArea("SQL")

SQL->(DbGoTop())

DO While !SQL->(Eof())

	
	IncProc("Processando SD3... ")

    // CORRIGE A TM 499	
	_cQuery := ""
	
	_cQuery += " UPDATE " + RetSqlName("SD3")
    _cQuery += " SET D3_QUANT =  " + alltrim(str(qtup)) + ",
    //_cQuery += " D3_X_ETQ = 'Aj. Creme valor anterior' " 
	_cQuery += " D3_OBSERVA =  '" + alltrim(str(quanta)) +'/' + numseqb + "'"
	_cQuery	+= " WHERE R_E_C_N_O_ =  " + alltrim(str(recnoup)) "
	
	
	MemoWrite("C:\AJUSD3_update.sql",_cQuery)
	
	lSqlOk := !(TCSQLExec(_cQuery) < 0)
	if lSqlOk .and. (TcGetDB() == 'ORACLE')
		lSqlOk := !(TCSQLExec("COMMIT") <0)
	endif
	
	If !lSqlOk
		msginfo("ERRO QUERY UPDATE TM 499")
		msginfo(TCSQLError())
		msginfo("Verifiquei a Sintaxe da Query.")
	
	endif

    // EXCLUI A TM 504	
	_cQuery := ""
	_cQuery += " UPDATE "+ RetSqlName("SD3") 
	_cQuery += " SET D_E_L_E_T_ = '*'," 
	_cQuery += " R_E_C_D_E_L_ =  " + alltrim(str(recnodel)) + ", 
	_cQuery += " D3_OBSERVA = '" + alltrim(str(quantb)) +'/' + numseqa  + "'"
	//_cQuery += " D3_X_ETQ = 'Deletado e ajustado no D3_NUMSEQ' " 
	_cQuery += " WHERE R_E_C_N_O_ = " + alltrim(str(recnodel)) "

	MemoWrite("C:\AJUSD3_exluir.sql",_cQuery)
	
	lSqlOk := !(TCSQLExec(_cQuery) < 0)
	if lSqlOk .and. (TcGetDB() == 'ORACLE')
		lSqlOk := !(TCSQLExec("COMMIT") <0)
	endif
	
	If !lSqlOk
		msginfo("ERRO QUERY EXCLUIR TM 504")
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

Aadd(aRegs,{cPerg,"01","Filial de?     	", "Filial 	    ?",		"Filial 	?",		"mv_ch1","C",06,0,0,"G" ,"","mv_par01","","","","","","","","","","","","","","","","","","",""	,""	,""	,""	,"","","SM0",""})
Aadd(aRegs,{cPerg,"02","Filial Ate?    	", "Filial  	?",		"Filial    	?",		"mv_ch2","C",06,0,0,"G" ,"","mv_par02","","","","","","","","","","","","","","","","","","","",""	,""	,""	,"","","SM0",""})
Aadd(aRegs,{cPerg,"03","Data de?    	", "Data      	?",		"Data      	?",		"mv_ch3","D",08,0,0,"G" ,"","mv_par03","","","","","","","","","","","","","","","","","","",""	,""	,""	,""	,"","","",""})
Aadd(aRegs,{cPerg,"04","Data Ate?   	", "Data      	?",		"Data      	?",		"mv_ch4","D",08,0,0,"G" ,"","mv_par04","","","","","","","","","","","","","","","","","","","",""	,""	,""	,"","","",""})
Aadd(aRegs,{cPerg,"05","Produto de?  	", "Produto 	?",		"Produto 	?",		"mv_ch5","C",10,0,0,"G" ,"","mv_par05","","","","","","","","","","","","","","","","","","",""	,""	,""	,""	,"","","SB1",""})
Aadd(aRegs,{cPerg,"06","Produto Ate? 	", "Produto 	?",		"Produto 	?",		"mv_ch6","C",10,0,0,"G" ,"","mv_par06","","","","","","","","","","","","","","","","","","","",""	,""	,""	,"","","SB1",""})
Aadd(aRegs,{cPerg,"07","Ordem Prod. de? ","Ordem Prod. ?",	    "Ordem Prod.?",		"mv_ch7","C",11,0,0,"G" ,"","mv_par07","","","","","","","","","","","","","","","","","","","",""	,""	,""	,"","","SC2",""})
Aadd(aRegs,{cPerg,"08","Ordem Prod Ate? ","Ordem Prod.  ?",	    "Ordem Prod.?",		"mv_ch8","C",11,0,0,"G" ,"","mv_par08","","","","","","","","","","","","","","","","","","","",""	,""	,""	,"","","SC2",""})

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
	Private cSenhAce := GETMV("MV_AJCRE")
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

