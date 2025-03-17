#include 'protheus.ch'
#include 'parmtype.ch'
#include "fileio.ch"
#include "topconn.ch"

user function rpcpa001()
	LOCAL aArea := GetArea()
	LOCAL cPerg := "RPCPA001"
	ValidPerg(cPerg)


	if !alltrim(Upper(cUserName))$Alltrim(Upper((GetNewpar("MV_XUSRSD3","kleber.santos"))))
		ApMsgStop("Usuário não autorizado a executar essa rotina!")
		return
	endif

	if !Pergunte(cPerg,.t.)
		restarea(aArea)
		return
	endif


	Processa({|| RunProc() })

	restarea(aArea)	

return


Static Function RunProc()
	LOCAL aArea := GetArea()
	LOCAL cQuery
	LOCAL nCount
	LOCAL cFile
	LOCAL nHandle 


	//cFile := "/system/logpcp_"+cFilAnt+"_"+dtos(dDataBase)+"_"+StrTran(Time(),":")+".log"
	cFile := "C:\temp\logpcp_"+cFilAnt+"_"+dtos(dDataBase)+"_"+StrTran(Time(),":")+".log"
	nHandle := fCreate(cFile,FC_NORMAL)


	If nHandle == -1
		MsgStop("Falha ao criar arquivo de log - erro: "+str(ferror()))
		Return
	Endif


	fWrite(nHandle,"Recuperacao de requisições "+chr(13)+chr(10))
	fWrite(nHandle,""+chr(13)+chr(10))
	fWrite(nHandle,"Da OP: "+mv_par01+chr(13)+chr(10))
	fWrite(nHandle,"Ate OP: "+chr(13)+chr(10))
	fWrite(nHandle,"Operação: "+iif(mv_par03=1,"Analiser e gerar Log","Recuperar")+chr(13)+chr(10))
	fWrite(nHandle,""+chr(13)+chr(10))
	fWrite(nHandle,""+chr(13)+chr(10))
	fWrite(nHandle,"Usuário: "+cUsername+chr(13)+chr(10))
	fWrite(nHandle,""+chr(13)+chr(10))
	fWrite(nHandle,""+chr(13)+chr(10))

	cQuery := " Select Count(D3_FILIAL) as Count_D3 from "+RetSqlName("SD3")+" WHERE D3_FILIAL='"+cFilAnt+"' AND D3_OP >='"+mv_par01+"' AND D3_OP <= '"+mv_par02+"' AND D3_OP<>' ' AND D3_ESTORNO='S' AND SUBSTR(D3_CF,1,2)='RE' "
	if Select("QCount") > 0
		QCount->(DbCloseArea())
	endif
	TcQuery cQuery new alias "QCOUNT"
	nRegs := QCount->Count_D3
	QCount->(DbCloseArea())


	fWrite(nHandle,"Registros a serem processados: "+alltrim(Str(nRegs))+chr(13)+chr(10))
	fWrite(nHandle,""+chr(13)+chr(10))
	fWrite(nHandle,""+chr(13)+chr(10))

	cQuery := " Select SD3010.R_E_C_N_O_ as RECNOD3,SD3010.* from "+RetSqlName("SD3")+" WHERE D3_FILIAL='"+cFilAnt+"' AND D3_OP >='"+mv_par01+"' AND D3_OP <= '"+mv_par02+"' AND D3_OP<>' ' AND D3_ESTORNO='S' AND SUBSTR(D3_CF,1,2)='RE' "	
	if Select("QRED3") > 0
		QRED3->(DbCloseArea())
	endif
	TcQuery cQuery new alias "QRED3"

	ProcRegua(nRegs)

	nContador := 0




	While !QRED3->(Eof()) 	
		nContador++	 
		IncProc("Processando registro "+Alltrim(Str(nContador))+ "de "+Alltrim(Str(nRegs))+" ...")
		fWrite(nHandle,"Processando registro "+Alltrim(Str(nContador)) + " de "+Alltrim(Str(nRegs))+" ..."+chr(13)+chr(10))


		cQuery := " SELECT D3_ESTORNO,D3_NUMSEQ,SD3010.R_E_C_N_O_ AS RECNOD3 " 
		cQuery += " FROM "+RetSqlName("SD3")+" WHERE D3_FILIAL='"+QRED3->D3_FILIAL+"' AND D3_OP='"+QRED3->D3_OP+"' AND D3_NUMSEQ>='"+QRED3->D3_NUMSEQ+"'  AND D3_CF='PR0' AND ROWNUM = 1 ORDER BY SD3010.D3_NUMSEQ "  
		if Select("QPR0") > 0 
			QPR0->(DbCloseArea())
		endif
		TcQuery cQuery new alias "QPR0"

		if !QPR0->(Eof())
			if QPR0->D3_ESTORNO <>'S'
				if mv_par03 == 2
					//Voltar a SD3 Estornada
					cSql := "Update "+RetSqlName("SD3")+" SET D3_OBSERVA='*RECUPERADO*', D3_ESTORNO =' ', D_E_L_E_T_=' ',R_E_C_D_E_L_=0 WHERE R_E_C_N_O_= "+Alltrim(Str(QRED3->RECNOD3))
					nErroSql := TcSqlExec(cSql)					
					if nErroSql < 0
						fWrite(nHandle,"Erro na Instrução SQL: "+chr(13)+chr(10)+chr(13)+chr(10)+TcSqlError()+chr(13)+chr(10))
					else

						//Se o movimento do estorno "DE" referente ao registro que está sendo recuperado não estiver deletado, então deleta.
						cQuery := " SELECT R_E_C_N_O_ as RECNOD3 "
						cQuery += " From "
						cQuery += RetSqlName("SD3")
						cQuery += " WHERE D3_FILIAL = '"+QRED3->D3_FILIAL+"' AND "
						cQuery += " D3_NUMSEQ = '"+QRED3->D3_NUMSEQ+"' AND " 
						cQuery += " SUBSTR(D3_CF,1,2) = 'DE' AND "
						cQuery += " D3_ESTORNO ='S' AND "
						cQuery += " D_E_L_E_T_=' ' "
						if Select("QDED3") > 0
							QDED3->(DbCloseArea())
						endif
						TcQuery cQuery New alias "QDED3"
						if !QDED3->(Eof())					
							cSql := "Update "+RetSqlName("SD3")+" SET D3_OBSERVA='*APAGADO*', D_E_L_E_T_='*',R_E_C_D_E_L_= R_E_C_N_O_ WHERE R_E_C_N_O_= "+Alltrim(Str(QDED3->RECNOD3))
							nErroSql := TcSqlExec(cSql)
							if nErroSql < 0
								fWrite(nHandle,"Erro ao apagar movimento de Estorno. Erro na Instrução SQL: "+chr(13)+chr(10)+chr(13)+chr(10)+TcSqlError()+chr(13)+chr(10))
							else
								fWrite(nHandle,"Movimento de Estorno R_E_C_N_O_  "+Alltrim(Str(QDED3->RECNOD3))+" apagado. "+chr(13)+chr(10))							
							endif
						endif

						if !Empty(QRED3->D3_LOTECTL)
							cSql := " Update "+RetSqlName("SD5")+" set D5_ESTORNO =' ',D_E_L_E_T_=' ' where D5_FILIAL = '"+QRED3->D3_FILIAL+"' and D5_PRODUTO = '"+QRED3->D3_COD+"' AND D5_NUMSEQ = '"+QRED3->D3_NUMSEQ+"' AND D5_ORIGLAN ='510' "
							nErroSql := TcSqlExec(cSql)					
							if nErroSql < 0
								fWrite(nHandle,"Erro na Instrução SQL: "+chr(13)+chr(10)+chr(13)+chr(10)+TcSqlError()+chr(13)+chr(10))
							else					
								//Se o movimento do estorno "DE" do lote referente ao registro que está sendo recuperado não estiver deletado, então deleta.
								cQuery := " SELECT R_E_C_N_O_ as RECNOD5 "
								cQuery += " From "
								cQuery += RetSqlName("SD5")
								cQuery += " WHERE D5_FILIAL = '"+QRED3->D3_FILIAL+"' AND "
								cQuery += " D5_PRODUTO = '"+QRED3->D3_COD+"' AND "
								cQuery += " D5_NUMSEQ = '"+QRED3->D3_NUMSEQ+"' AND " 
								cQuery += " D5_ORIGLAN = '499' AND "
								cQuery += " D5_ESTORNO ='S' AND "
								cQuery += " D_E_L_E_T_=' ' "
								if Select("QDED5") > 0
									QDED5->(DbCloseArea())
								endif
								TcQuery cQuery New alias "QDED5"
								if !QDED5->(Eof())					
									cSql := "Update "+RetSqlName("SD5")+" SET D_E_L_E_T_='*' WHERE R_E_C_N_O_= "+Alltrim(Str(QDED5->RECNOD5))
									nErroSql := TcSqlExec(cSql)
									if nErroSql < 0
										fWrite(nHandle,"Erro ao apagar movimento de Estorno do lote. Erro na Instrução SQL: "+chr(13)+chr(10)+chr(13)+chr(10)+TcSqlError()+chr(13)+chr(10))
									else
										fWrite(nHandle,"Movimento de Estorno do lote  R_E_C_N_O_  "+Alltrim(Str(QDED5->RECNOD5))+" apagado. "+chr(13)+chr(10))							
									endif
								endif								
								fWrite(nHandle,"Exito ! Ordem de produção R_E_C_N_O_  "+Alltrim(Str(QPR0->RECNOD3))+" não está estornada. Requisição R_E_C_N_O_ "+Alltrim(Str(QRED3->RECNOD3))+" foi recuperado! "+chr(13)+chr(10))
							endif


						else						
							fWrite(nHandle,"Exito ! Ordem de produção R_E_C_N_O_  "+Alltrim(Str(QPR0->RECNOD3))+" não está estornada. Requisição R_E_C_N_O_ "+Alltrim(Str(QRED3->RECNOD3))+" foi recuperado! "+chr(13)+chr(10))
						endif	
					endif
				else
					fWrite(nHandle,"Exito ! Ordem de produção R_E_C_N_O_  "+Alltrim(Str(QPR0->RECNOD3))+" não está estornada. Requisição R_E_C_N_O_ "+Alltrim(Str(QRED3->RECNOD3))+" deve ser recuperado ! "+chr(13)+chr(10))
				endif
			else
				fWrite(nHandle,"Ordem de produção R_E_C_N_O_ = '"+Alltrim(Str(QPR0->RECNOD3))+"' está estornada. Erro código 2"+chr(13)+chr(10))
			endif
		else
			fWrite(nHandle,"Registro de apontamento de produção da requisição não encontrado. Erro código 1"+chr(13)+chr(10))	
		endif

		fWrite(nHandle,"-----"+chr(13)+chr(10))
		fWrite(nHandle,""+chr(13)+chr(10))
		fWrite(nHandle,""+chr(13)+chr(10))


		DbSelectArea("QRED3")
		DbSkip()
	Enddo
	*/	restarea(aArea)
return


Static Function ValidPerg(cPerg)
	Local _sAlias,i,j
	_sAlias := Alias()
	//Retirado Sangelles 22/03/2022 ->dbSelectArea("SX1")
	//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
	cPerg := PADR(cPerg,10)
	aRegs:={}                                                  
	// Grupo/Ordem/Pergunta/Variavel/Tipo/Tamanho/Decimal/Presel/GSC/Valid/Var01/Def01/Cnt01/Var02/Def02/Cnt02/Var03/Def03/Cnt03/Var04/Def04/Cnt04/Var05/Def05/Cnt05/f3
	AADD(aRegs,{cPerg,"01","Da Ordem Producao ?","","","mv_ch1","C",TamSX3("D3_OP")[1],0,0,"G","","mv_par01","","","","","","","","","","","","","","","","","","","","","","","","","SC2","","","","",""})
	AADD(aRegs,{cPerg,"02","Ate Ordem Producao?","","","mv_ch2","C",TamSX3("D3_OP")[1],0,0,"G","","mv_par02","","","","","","","","","","","","","","","","","","","","","","","","","SC2","","","","",""})
	AADD(aRegs,{cPerg,"03","Operação          ?","","","mv_ch3","N",01,0,0,"C","","mv_par03","Analisa e Gera Log","Analise e Gera Log","Analisa Gera Log","Recupera Registro","Recupera Registro","Recupera Registro","","","","","","","","","","","","","","","","","","","","","","","",""})


	For i:=1 to Len(aRegs)
		cPulaLinha	:= chr(13)+chr(10)
		cQry			:= ""
		// verifico se nao existe este alias criado
		If Select("TMP") > 0
			TMP->(DbCloseArea())
		EndIf
		cQry := " SELECT * FROM " 				  + cPulaLinha
		cQry += " " + RetSqlName("SX1") + " SX1 " + cPulaLinha
		cQry += " WHERE " 						  + cPulaLinha
		cQry += " SX1.D_E_L_E_T_	<> '*' " 	  + cPulaLinha
		cQry += " AND X1_FILIAL = '" + xFilial("SX1") 	+ "' " + cPulaLinha
		cQry += " AND X1_GRUPO = '" +cPerg+StrZero(i,2)+ "' "	+ cPulaLinha

		TcQuery cQry New Alias "TMP" // Cria uma nova area com o resultado do query   
	
		if empty(TMP->X1_GRUPO)
			RecLock("SX1",.T.)
			For j:=1 to FCount()
				FieldPut(j,aRegs[i,j])
			Next
			MsUnlock()
			dbCommit()
		EndIf
	Next
	dbSelectArea(_sAlias)
Return
