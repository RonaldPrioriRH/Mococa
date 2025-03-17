#Include "Protheus.ch"
#Include "topconn.ch"
#Include "tbiconn.ch"
#Include "TOTVS.ch"
#Include "RPTDef.ch"
#Include "FWPrintSetup.ch"
// Disponivel em Modulo 10 Atualizações -> Cadastros -> Produtos -> Teste FPTOP
/*
Documentação do execauto:
https://tdn.totvs.com/display/public/PROT/DT_ExecAuto_Apontamento_e_Schedule
*/

user function fPtOP_She(cEmpProc, cFilProc)
	Local lRet      := .T.

	Local aCYV      := {}
	Local aCZP      := {}
	Local aCY0      := {}
	Local aCYW      := {}
	Local aCZ0      := {}
	Local aCZW      := {}
	Local cMsg      := ""
	Local nAux
	Local cQry      := ""
	local cMsgErro  := ""
	local cError    := ""

	__cInterNet := "AUTOMATICO"
	__lPYME     := .F.

	local oError    := nil

	default cEmpProc:= '01'
	default cFilProc:= '0102'

	Private lJob    := isBlind()
	private cFil    := iif(!empty(cFilProc) .and. lJob,cFilProc, cFilAnt)
	Private cEof    := chr(13)+chr(10)
	Private cSeq
	Private lAutoErrNoFile := .T.
	Private lMsErroAuto := .F.
	Private lMsHelpAuto := .T.



	If lJob
		fMntEnv(cEmpProc, cFilProc)
	Endif

	dDataBase := daysub(date(), superGetMv("RETRO_PAC", .F., 90))
	//Verifica se existe op para integrar

	DBSELECTAREA('ZA1')

	If !fSelOPs()
		cMsg := "Erro na consulta ou nao ha resultado."+cEof+"Para melhor analise consulte o arquivo de consulta PTOPs_SelOPs em Consultas."+cEof
		conout("FTOP 002: "+cMsg)

	EndIf
	While !QRY->(EOF())
		conout("FTOP 003:Executando EM JOB na QRY.")
/*        IF QRY->QTDE_APONTADA >= QRY->QTD_ORD
            cMsg := "A OP: "+QRY->ORD_PROD+" no PackTrust tem mais caixas para apontar que tem em ordem de producao em aberto."
            conout("FTOP 004: "+cMsg)


            QRY->(DBSKIP())
            LOOP
        ENDIF
*/			
		if QRY->ESTORNADO == 0
			cQry := "SELECT  "+cEof
			cQry += "   CODIGOERP, LOTE, CODPALLET, QTDCAIXA,"+cEof
			cQry += "   TO_CHAR(TO_DATE(DTEMBINICIO,'DD/MM/YYYY'),'YYYYMMDD') INICIO_DT, to_char(HREMBINICIO) INICIO_HR,"+cEof
			cQry += "   TO_CHAR(TO_DATE(DTEMBFINAL,'DD/MM/YYYY'),'YYYYMMDD') FINAL_DT,  to_char(HREMBFINAL) FINAL_HR,"+cEof
			cQry += '   OP, LINHAPROD '+cEof
			cQry += "FROM MOCPP0001@SIGOFC"+cEof
			//cQry += "FROM MOCPP0001@SIGTES"+cEof
			cQry += "WHERE OP = '"+ALLTRIM(QRY->OP_PT)+"'"+cEof
			//cQry += "AND TRIM(SUBSTR(DTEMBINICIO,7,4)||SUBSTR(DTEMBINICIO,4,2)||SUBSTR(DTEMBINICIO,1,2)) >= '"+DtoS(DDATABASE)+"' "
			cQry += "AND TRIM(SUBSTR(DTEMBINICIO,7,4)||SUBSTR(DTEMBINICIO,4,2)||SUBSTR(DTEMBINICIO,1,2)) >= '20240815' "
			cQry += "AND  ESTORNADO = '0' "
			cQry += "AND CODPALLET NOT IN ("+cEof
			cQry += "	SELECT TRIM(CYV_XPTCHV) "+cEof
			cQry += "	FROM "+RetSqlName("CYV")+" CYV "+cEof
			cQry += "	WHERE CYV.D_E_L_E_T_ = ' ' "+cEof
			cQry += "	AND CYV_XPTCHV <> ' ' "+cEof
			cQry += "	AND CYV_CDMQ = '1702' "+cEof
			cQry += "	GROUP BY CYV_XPTCHV "+cEof
			cQry += ") "+cEof
			cQry += "AND CODPALLET NOT IN (SELECT TRIM(ZA1_PALLET) "+cEof        //
			cQry += "	FROM ZA1010 ZA1 "+cEof        //
			cQry += "	WHERE ZA1.D_E_L_E_T_ = ' ' "+cEof        //
			cQry += "	AND ZA1.ZA1_STATUS <> 'R' "+cEof
			cQry += "	AND ZA1_PALLET <> ' ' "+cEof        //
			cQry += "	AND ZA1_ESTORN = 0 "+cEof        //
			cQry += "	GROUP BY ZA1_PALLET "+cEof        //
			cQry += ") ORDER BY HREMBINICIO "+cEof        //

			If lJob
				MemoWrite("\ftop\ptops_ptShefa.sql", cQry) //LOCAL
			Else
				MemoWrite("c:\temp\PTOPs_PTShefa.sql", cQry) //LOCAL
			Endif
			conout("FTOP 005:Executando EM JOB na QRY.")

			If Select("PT") > 0
				PT->(DbCloseArea())
			EndIf

			cQry := ChangeQuery(cQry)
			conout("FTOP 006:Executando Scrip PT ."+cQry)
			TcQuery cQry New Alias "PT"

			If PT->(Eof())
				cMsg := "Erro na consulta ou nao ha resultado para o apontamento para esta OP: "+ALLTRIM(QRY->ORD_PROD)+"."+cEof
				conout(cMsg)
				//cMsg, cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
				//(cMsg, cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
				//fGrvLog(cMsg, QRY->ORD_PROD, .T.,0,'','','E')
				conout("FTOP 007: "+cMsg)
				qry->(dbskip())
				loop
			EndIF

			While !PT->(EOF())

				dDataBase := Date()//stod(PT->INICIO_DT)
				aCYV := {}
				aCYP := {}
				aCYW := {}
				aCZ0 := {}
				aCZW := {}
				conout("FTOP 008:Navegando na PT")

				cSeq:=  getSxeNum("CYV", "CYV_NRSQRP" )//vRetSeq()

				conout("FTOP 009:Sequencia a ser usada: "+cSeq)

				If !validSC2(alltrim(PT->OP), alltrim(PT->LINHAPROD), @cMsgErro)
					cMsg := "Erro na validação da máquina: "+Alltrim(qry->ORD_PROD)+"."+CRLF
					cMsg += cMsgErro

					//(cMsg,cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
					fGrvLog(cMsg,QRY->ORD_PROD, .T.,PT->QTDCAIXA,PT->CODPALLET,PT->LINHAPROD,'E')

					PT->(DBSKIP())
					conout("FTOP: "+cMsg)
					conout("FTOP:loop por conta do Função validSC2().")
					RollBackSX8()
					LOOP
				endif

				If !fCYV(@aCYV)
					cMsg := "Erro na montagem do apontamento de proDucao (CYV) da OP: "+Alltrim(qry->ORD_PROD)+"."+cEof
					cMsg += "Já encontrado um lançamento para essa mesma data e horario "+cEof

					//(cMsg,cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
					fGrvLog(cMsg,QRY->ORD_PROD, .T.,PT->QTDCAIXA,PT->CODPALLET,PT->LINHAPROD,'E')

					PT->(DBSKIP())
					conout("FTOP: "+cMsg)
					conout("FTOP:loop por conta do Função fCYV().")
					RollBackSX8()
					LOOP
				EndIf

				// Componentes
				If !fCZP(@aCZP, QRY->TP_PROD_OP)
					cMsg := "Erro na montagem do componente de prouducao (CZP) da OP: "+QRY->ORD_PROD+"."+cEof
					//cMsg, cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
					fGrvLog(cMsg, QRY->ORD_PROD, .T.,PT->QTDCAIXA,PT->CODPALLET,PT->LINHAPROD,'E')
					PT->(DBSKIP())
					conout("FTOP: "+cMsg)
					conout("FTOP:loop por conta do Função fCZP().")
					RollBackSX8()
					LOOP
				EndIf

				// Mao de Obra
				If !fCYW(@aCYW)
					cMsg := "Erro na montagem da mao de obra da prouducao (CYW) da OP: "+QRY->ORD_PROD+"."+cEof
					//(cMsg, cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
					fGrvLog(cMsg, QRY->ORD_PROD, .T.,PT->QTDCAIXA,PT->CODPALLET,PT->LINHAPROD,'E')
					PT->(DBSKIP())
					conout("FTOP: "+cMsg)
					conout("FTOP:loop por conta do Função fCYW().")
					RollBackSX8()
					LOOP
				EndIf

            /*
            // Refugo e Retrabalho
            If !fCY0(@aCY0)
                return
            EndIf
            */
				// GGF
				If !fCZW(@aCZW, PT->LINHAPROD)
					conout("FTOP:Aportado por erro da CZW.")
					RollBackSX8()
					return
				EndIf

				conout("FTOP:Iniciando execauto SFCA316.")

				oError    := ErrorBlock({|e| cError := e:Description +CRLF+ e:ErrorStack})

				BEGIN SEQUENCE
					lRet := SFCA316(,1,aCYV,aCZP,aCY0,aCYW,aCZ0,aCZW)
				END SEQUENCE

				ErrorBlock(oError)

				IF lMsErroAuto .or. !empty(cError) .or. !lRet
					cMsg := "FTOP:Erro no ExecAuto."+cEof

					if empty(cError) .or. "MOSTRAERRO(MATXFUNB.PRX)" $ cError
						aLogAuto := GetAutoGRLog()
						cMsg+=" Qtd de linhas de erro:"+str(len(aLogAuto))+cEof
						For nAux := 1 To Len(aLogAuto)
							cMsg += aLogAuto[nAux] + Chr(13) + Chr(10)
						Next
						conout(cMsg)
					else
						cMsg += cError
					endif

					If !lJob
						Help(" ", 1, "Erro",, cMsg ,1,0 )
						//MostraErro()
					Endif
					//(cMsg, cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
					fGrvLog(cMsg, QRY->ORD_PROD, .T.,PT->QTDCAIXA,PT->CODPALLET,PT->LINHAPROD,'E')

				Else
					ConfirmSX8()
					conout("FTOP:ExecAuto executado com S U C E S S O.")
					cMsg := 'Atualizado com Sucesso'
					//(cMsg, cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
					fGrvLog(cMsg, QRY->ORD_PROD, .T.,PT->QTDCAIXA,PT->CODPALLET,PT->LINHAPROD,'F')
				Endif

				PT->(DBSkip())
				exit	
			END
		else

			cQry := "SELECT  "+cEof
			cQry += "   CODIGOERP, LOTE, CODPALLET, QTDCAIXA,"+cEof
			cQry += "   TO_CHAR(TO_DATE(DTEMBINICIO,'DD/MM/YYYY'),'YYYYMMDD') INICIO_DT, to_char(HREMBINICIO) INICIO_HR,"+cEof
			cQry += "   TO_CHAR(TO_DATE(DTEMBFINAL,'DD/MM/YYYY'),'YYYYMMDD') FINAL_DT,  to_char(HREMBFINAL) FINAL_HR,"+cEof
			cQry += '   OP, LINHAPROD '+cEof
			cQry += "FROM MOCPP0001@SIGOFC"+cEof
			//		cQry += "FROM MOCPP0001@SIGTES"+cEof
			cQry += "WHERE OP = '"+ALLTRIM(QRY->OP_PT)+"'"+cEof
			//cQry += "AND TRIM(SUBSTR(DTEMBINICIO,7,4)||SUBSTR(DTEMBINICIO,4,2)||SUBSTR(DTEMBINICIO,1,2)) >= '"+DtoS(DDATABASE)+"' "
			cQry += "AND TRIM(SUBSTR(DTEMBINICIO,7,4)||SUBSTR(DTEMBINICIO,4,2)||SUBSTR(DTEMBINICIO,1,2)) >= '20240815' "
			cQry += "AND  HREMBINICIO = '"+QRY->HREMBINICIO+"' "
			cQry += "AND  ESTORNADO = '0' "
			cQry += "AND CODPALLET NOT IN (SELECT TRIM(ZA1_PALLET) "+cEof        //
			cQry += "	FROM ZA1010 ZA1 "+cEof        //
			cQry += "	WHERE ZA1.D_E_L_E_T_ = ' ' "+cEof        //
			cQry += "	AND ZA1.ZA1_STATUS <> 'R' "+cEof
			cQry += "	AND ZA1_PALLET <> ' ' "+cEof        //
			cQry += "	AND ZA1_ESTORN = 1 "+cEof        //
			cQry += "	GROUP BY ZA1_PALLET )"+cEof        //

			If Select("PT") > 0
				PT->(DbCloseArea())
			EndIf

			cQry := ChangeQuery(cQry)
			conout("FTOP 006:Executando Scrip PT ."+cQry)
			TcQuery cQry New Alias "PT"

			If PT->(Eof())
				cMsg := "Erro na consulta ou nao ha resultado para o estorno para esta OP: "+ALLTRIM(QRY->ORD_PROD)+"."+cEof
				conout(cMsg)
				//cMsg, cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
				//(cMsg, cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
				//fGrvLog(cMsg, QRY->ORD_PROD, .T.,0,'','','E')
				conout("FTOP 007: "+cMsg)
				qry->(dbskip())
				loop
			EndIF

			conout("FTOP:Iniciando execauto de estorno SFCA316.")
			if PT->(!eof())
				dDataBase := Date()
				oError    := ErrorBlock({|e| cError := e:Description +CRLF+ e:ErrorStack})
				cNrsqrp := getCyv() 
				if !empty(cNrsqrp)
					BEGIN SEQUENCE
						lRet := SFCA316(,2,{{"CYV_NRSQRP",cNrsqrp, nil }, {"CYV_DTEO", date(), nil}})
					END SEQUENCE
					IF lMsErroAuto .or. !empty(cError) .or. !lRet
						cMsg := "FTOP:Erro no ExecAuto."+cEof

						if empty(cError) .or. "MOSTRAERRO(MATXFUNB.PRX)" $ cError
							aLogAuto := GetAutoGRLog()
							cMsg+=" Qtd de linhas de erro:"+str(len(aLogAuto))+cEof
							For nAux := 1 To Len(aLogAuto)
								cMsg += aLogAuto[nAux] + Chr(13) + Chr(10)
							Next
							conout(cMsg)
						else
							cMsg += cError
						endif

						If !lJob
							Help(" ", 1, "Erro",, cMsg ,1,0 )
							//MostraErro()
						Endif
						//(cMsg, cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
						fGrvLog(cMsg, QRY->ORD_PROD, .T.,PT->QTDCAIXA,PT->CODPALLET,PT->LINHAPROD,'E',1)

					Else

						conout("FTOP:ExecAuto de estorno executado com S U C E S S O.")
						cMsg := 'Atualizado com Sucesso'
						//(cMsg, cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
						fGrvLog(cMsg, QRY->ORD_PROD, .T.,PT->QTDCAIXA,PT->CODPALLET,PT->LINHAPROD,'F',1)
					Endif
				else

					cMsg := "Erro na montagem do estorno de proDucao (CYV) da OP: "+Alltrim(qry->ORD_PROD)+"."+cEof
					cMsg += "Não encontrado o conteúdo do campo CYV_NRSQRP "+cEof

					//(cMsg,cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
					fGrvLog(cMsg,QRY->ORD_PROD, .T.,PT->QTDCAIXA,PT->CODPALLET,PT->LINHAPROD,'E',1)

				endif
			endif
			PT->(DbCloseArea())
		endif
		conout("FTOP:Concluiu QRY.")
		QRY->(DBSKIP())
		exit
	END
	conout("FTOP:Finalizando.")
	if lJob
		rpcClearEnv()
	endif
return

static function fMntEnv(cEmp, cFil)

	conout("FTOP:Iniciar processo de conexão. Empresa: "+cEmp+" Filial: "+cFil)

	If RpcSetEnv(cEmp,cFil,"","","SFC","MATA410")
		conout("FTOP:Executnado EM JOB. ")
	Else
		conout("FTOP:Erro ao tentar conectar no ambinete pela função rpcsetenv(). ")
	Endif

return

Static Function fGrvLog(cMsg, cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus,nEstorno)
	Default cMsg    := ""
	Default cOP     := ""
	Default lGrava  := .F.
	default nEstorno := 0

	cMsg += "Servidor: \PackTrust\Consultas\PTOPs_SelOPs.sql"+CRLF
	cMsg += "Data: "+DtoC(Date())+" Hora: "+Time()+CRLF
	MemoWrite("\PackTrust\Logs\PtOP_"+DtoS(date())+"_"+StrTran(time(),":", "")+cOP, cMsg)

	If lGrava
		atualza1(cOP, cMsg,nQtd,cCodPall,cCodMq,cStatus,nEstorno)
	EndIf
Return

static Function atualza1(cOP, cMsg,nQtd,cCodPall,cCodMq,cStatus,nEstorno)
	Local aZA1 := GetArea("ZA1")
	Local lRet := .F.
	Local lExist := .F.


	cOp := Substr(cOp,1,20)
	cCodPall := Substr(cCodPall,1,20)
	cCodMq := Substr(cCodMq,1,4)


	Begin Transaction

		If !Empty(cFil+cOP+cCodPall+cCodMq)
			DBSelectArea("ZA1")
			ZA1->(DBSetOrder(2))

			If len(cOp) <> 20 .or. len(cCodPall) <> 20 .or. len(cCodMq) <> 4
				conout("FTOP:ERRO NO TAMANHO DA VARIAVEL cOp, VALOR ESPERADO 20, VALOR RECEBIDO "+STR(LEN(cOp)) + ' COP='+cOp)
				conout("FTOP:ERRO NO TAMANHO DA VARIAVEL cCodPall, VALOR ESPERADO 20, VALOR RECEBIDO "+STR(LEN(cCodPall))+ ' CODPALLET='+cOp)
				conout("FTOP:ERRO NO TAMANHO DA VARIAVEL cCodMq, VALOR ESPERADO 4, VALOR RECEBIDO "+STR(LEN(cCodMq))+ ' MAQUINA='+cOp)
				SLEEP(8000)
			Endif
			lExist := ZA1->(dBseek(cFil+cOP+cCodPall+cCodMq+alltrim(str(nEstorno))))
		else
			Return lRet
		EndIf

		If !lExist
			RecLock('ZA1',.t.)
			ZA1->ZA1_FILIAL  := cFil
			ZA1->ZA1_NRORPO  := cOp         // Tamanho 20
			ZA1->ZA1_PALLET  := cCodPall    // Tamanho 20
			ZA1->ZA1_CDMQ    := cCodMq      // Tamanho 4
			ZA1->ZA1_ESTORN  := nEstorno
		Else
			RecLock('ZA1',.f.)
		Endif
		ZA1->ZA1_QTD     := nQtd
		ZA1->ZA1_DESC    := alltrim(cMsg)
		ZA1->ZA1_STATUS  := cStatus
		ZA1->ZA1_LOG     := cMsg
		ZA1->ZA1_DATA    := date()
		ZA1->ZA1_HORA    := time()
		MsUnlock()

	End Transaction

	RestArea(aZA1)
Return lRet

Static Function fSelOPs()
	Local lRet := .F.
	Local cQry := ""

    /*/
	/Logica
	Pegar todos ordens de producao que tbm esteja no packtrust
	verificar se a chave do packtrust nao esteja no apontamento
	e validar se a quantidade total de apontamento do packtrust nao ultrapassa a op

	OBS: Falta chave ou tem algo errado com o codigo de palete ja que ha mais de um palete comn o msm codigo
    /*/

	cQry += "SELECT CYQ_NRORPO ORD_PROD, PT_APONTAMENTOS.OP OP_PT, '0000000001' OPERACAO, APONTADOS.SPLIT SPLIT, CYQ_CDAC ITEM,"+CRLF
	cQry += "		SB1.B1_DESC DESC_ITEM, SB1.B1_TIPO TP_PROD_OP,PT_APONTAMENTOS.LINHAPROD MAQUINA, CYQ_QTOR QTD_ORD,"+CRLF
	cQry += "		APONTADOS.SPLIT MAIOR_SPLIT, APONTADOS.CYV_QTATRP QTDE_APONTADA, PT_APONTAMENTOS.HREMBINICIO, TO_NUMBER(PT_APONTAMENTOS.ESTORNADO) ESTORNADO "+CRLF
	cQry += "FROM "+RetSqlName("CYQ")+" CYQ "+CRLF
//    cQry += "-- LE A VIEW E COMPARA COM A SYV PARA IDENTIFICAR SE JÁ FOI APONTADA (COMPARANDO PALLET COM PALLET)"+CRLF
	cQry += "INNER JOIN ("+CRLF
	cQry += '	SELECT OP, LINHAPROD, SUM(QTDCAIXA) PT_QTDAPONT, HREMBINICIO, ESTORNADO '+CRLF
	cQry += "	FROM MOCPP0001@SIGOFC "+CRLF
	//cQry += "	FROM MOCPP0001@SIGTES "+CRLF
	//cQry += "	WHERE TRIM(SUBSTR(DTEMBINICIO,7,4)||SUBSTR(DTEMBINICIO,4,2)||SUBSTR(DTEMBINICIO,1,2)) >= '"+DtoS(DDATABASE)+"' "+CRLF
	cQry += "	WHERE TRIM(SUBSTR(DTEMBINICIO,7,4)||SUBSTR(DTEMBINICIO,4,2)||SUBSTR(DTEMBINICIO,1,2)) >= '20240815' "+CRLF
	cQry += "AND  ESTORNADO = '0' "
//    cQry += "   AND DTEMBINICIO >= '01/10/2023' "+CRLF
    cQry += "   AND CODPALLET NOT IN ( "+CRLF
	cQry += "    SELECT TRIM(CYV_XPTCHV) "+CRLF
	cQry += "    FROM CYV010 CYV "+CRLF
	cQry += "    WHERE CYV.D_E_L_E_T_ = ' '"+CRLF
	cQry += "    AND CYV_FILIAL  = '0102' "+CRLF
	cQry += "    AND TRIM(CYV_XPTCHV) <> ' '"+CRLF
	cQry += "    GROUP BY TRIM(CYV_XPTCHV) "+CRLF
	cQry += "    ) AND TO_NUMBER(ESTORNADO) = 0 "+CRLF
	cQry += '	GROUP BY OP, LINHAPROD, HREMBINICIO, ESTORNADO '+CRLF
	cQry += " ) PT_APONTAMENTOS"+CRLF
	cQry += "ON OP = RTRIM(CYQ_FILIAL)||RTRIM(CYQ_NRORPO)"+CRLF
//    cQry += "-- BUSCA INFORMAÇÕES DO QUE JÁ ESTA GRAVADO PARA GRAVAR OS NOVOS"+CRLF
	cQry += "LEFT JOIN ("+CRLF
	cQry += "	SELECT CYV_FILIAL, CYV_NRORPO, MAX(CYV_IDATQO) SPLIT, SUM(CYV_QTATRP) CYV_QTATRP,CYV_CDMQ "+CRLF
	cQry += "	FROM "+RetSqlName("CYV")+" CYV"+CRLF
	cQry += "	WHERE CYV.D_E_L_E_T_ = ' '"+CRLF
	cQry += "   AND CYV_FILIAL  = '0102' "+CRLF
	cQry += "	GROUP BY CYV_FILIAL, CYV_NRORPO, CYV_CDMQ"+CRLF
	cQry += ") APONTADOS"+CRLF
	cQry += "ON APONTADOS.CYV_FILIAL = CYQ_FILIAL "+CRLF
	cQry += "AND APONTADOS.CYV_NRORPO = CYQ_NRORPO"+CRLF
	cQry += "AND LTRIM(RTRIM(APONTADOS.CYV_CDMQ)) = LTRIM(RTRIM(PT_APONTAMENTOS.LINHAPROD))"+CRLF

//    cQry += "-- BUSCA DESCRIÇÃO DO PRODUTO"+CRLF
	cQry += "INNER JOIN "+RetSqlName("SB1")+" SB1"+CRLF
	cQry += "ON SB1.D_E_L_E_T_  = ' '"+CRLF
	cQry += "AND B1_COD = CYQ_CDAC"+CRLF
	cQry += "WHERE CYQ.D_E_L_E_T_  = ' '"+CRLF
	cQry += "AND CYQ_FILIAL  = '0102' "+CRLF
	cQry += "AND CYV_CDMQ = '1702' "+CRLF

	cQry += " UNION ALL "

	cQry += "SELECT CYQ_NRORPO ORD_PROD, PT_APONTAMENTOS.OP OP_PT, '0000000001' OPERACAO, APONTADOS.SPLIT SPLIT, CYQ_CDAC ITEM,"+CRLF
	cQry += "		SB1.B1_DESC DESC_ITEM, SB1.B1_TIPO TP_PROD_OP,PT_APONTAMENTOS.LINHAPROD MAQUINA, CYQ_QTOR QTD_ORD,"+CRLF
	cQry += "		APONTADOS.SPLIT MAIOR_SPLIT, APONTADOS.CYV_QTATRP QTDE_APONTADA, PT_APONTAMENTOS.HREMBINICIO, TO_NUMBER(PT_APONTAMENTOS.ESTORNADO) ESTORNADO "+CRLF
	cQry += "FROM "+RetSqlName("CYQ")+" CYQ "+CRLF
//    cQry += "-- LE A VIEW E COMPARA COM A SYV PARA IDENTIFICAR SE JÁ FOI APONTADA (COMPARANDO PALLET COM PALLET)"+CRLF
	cQry += "INNER JOIN ("+CRLF
	cQry += '	SELECT OP, LINHAPROD, SUM(QTDCAIXA) PT_QTDAPONT, HREMBINICIO, ESTORNADO '+CRLF
	cQry += "	FROM MOCPP0001@SIGOFC "+CRLF
	//cQry += "	FROM MOCPP0001@SIGTES "+CRLF
	//cQry += "	WHERE TRIM(SUBSTR(DTEMBINICIO,7,4)||SUBSTR(DTEMBINICIO,4,2)||SUBSTR(DTEMBINICIO,1,2)) >= '"+DtoS(DDATABASE)+"' "+CRLF
	cQry += "	WHERE TRIM(SUBSTR(DTEMBINICIO,7,4)||SUBSTR(DTEMBINICIO,4,2)||SUBSTR(DTEMBINICIO,1,2)) >= '20240815' "+CRLF
	cQry += "AND  ESTORNADO = '0' "
//    cQry += "   AND DTEMBINICIO >= '01/10/2023' "+CRLF
    cQry += "   AND CODPALLET IN ( "+CRLF
	cQry += "    SELECT TRIM(CYV_XPTCHV) "+CRLF
	cQry += "    FROM CYV010 CYV "+CRLF
	cQry += "    WHERE CYV.D_E_L_E_T_ = ' '"+CRLF
	cQry += "    AND CYV_FILIAL  = '0102' "+CRLF
	cQry += "    AND CYV_CDMQ  = '1702' "+CRLF
	cQry += "    AND TRIM(CYV_XPTCHV) <> ' '"+CRLF
	cQry += "    GROUP BY TRIM(CYV_XPTCHV) "+CRLF
	cQry += "    ) AND TO_NUMBER(ESTORNADO) = 1 "+CRLF
	cQry += '	GROUP BY OP, LINHAPROD, HREMBINICIO, ESTORNADO '+CRLF
	cQry += " ) PT_APONTAMENTOS"+CRLF
	cQry += "ON OP = RTRIM(CYQ_FILIAL)||RTRIM(CYQ_NRORPO)"+CRLF
//    cQry += "-- BUSCA INFORMAÇÕES DO QUE JÁ ESTA GRAVADO PARA GRAVAR OS NOVOS"+CRLF
	cQry += "LEFT JOIN ("+CRLF
	cQry += "	SELECT CYV_FILIAL, CYV_NRORPO, MAX(CYV_IDATQO) SPLIT, SUM(CYV_QTATRP) CYV_QTATRP,CYV_CDMQ "+CRLF
	cQry += "	FROM "+RetSqlName("CYV")+" CYV"+CRLF
	cQry += "	WHERE CYV.D_E_L_E_T_ = ' '"+CRLF
	cQry += "   AND CYV_FILIAL  = '0102' "+CRLF
	cQry += "	GROUP BY CYV_FILIAL, CYV_NRORPO, CYV_CDMQ"+CRLF
	cQry += ") APONTADOS"+CRLF
	cQry += "ON APONTADOS.CYV_FILIAL = CYQ_FILIAL "+CRLF
	cQry += "AND APONTADOS.CYV_NRORPO = CYQ_NRORPO"+CRLF
	cQry += "AND LTRIM(RTRIM(APONTADOS.CYV_CDMQ)) = LTRIM(RTRIM(PT_APONTAMENTOS.LINHAPROD))"+CRLF

//    cQry += "-- BUSCA DESCRIÇÃO DO PRODUTO"+CRLF
	cQry += "INNER JOIN "+RetSqlName("SB1")+" SB1"+CRLF
	cQry += "ON SB1.D_E_L_E_T_  = ' '"+CRLF
	cQry += "AND B1_COD = CYQ_CDAC"+CRLF
	cQry += "WHERE CYQ.D_E_L_E_T_  = ' '"+CRLF
	cQry += "AND CYQ_FILIAL  = '0102' "+CRLF
	cQry += "AND CYV_CDMQ  = '1702' "+CRLF

	cQry += " ORDER BY HREMBINICIO "


	If lJob
		MemoWrite("\ftop\ptops_selopsShefa.sql", cQry) //LOCAL
	Else
		MemoWrite("c:\temp\PTOPs_SelOPsShefa.sql", cQry) //LOCAL
	Endif

	If Select("QRY") > 0
		QRY->(DBCLOSEAREA())
	EndIf
	cQry := ChangeQuery(cQry)

	TcQuery cQry New Alias "QRY"

	If !QRY->(EOF())
		conout("FTOP 001:scritp da qry Executou com sucesso. "+cQry)
		lRet := .T.
	Else
		conout("FTOP 001:scritp da qry Não RETORNOU dados. "+cQry)
	EndIf

Return lRet

    /*/
	Os principais campos devem ser enviados na correta sequencia:
	CYV_NRORPO  - ORD PRODUCAO
	CYV_IDAT    - ID Oper SFC
	CYV_IDATQO  - Split
	CYV_CDMQ    - Maquina
	CYV_DTBGSU  - Dt Ini Prep
	CYV_HRBGSU  - Hr Ini Prep
	CYV_DTEDSU  - Dt Fim Prep
	CYV_HREDSU  - Hr Fim Prep
	CYV_CDSU    - Preparacao
	CYV_NRBG    - Ini Contador
	CYV_NRED    - Contador Fim
	CYV_QTATRP  - Qtd Report
	CYV_DTRPBG  - Data InÃ­cio
	CYV_HRRPBG  - Hora InÃ­cio
	CYV_DTRPED  - Data Fim
	CYV_HRRPED  - Hora Fim

	Os outros campos podem ser enviados a seguir.
	Os campos relacionados Ã  preparaÃ§Ã£o e mediÃ§Ã£o sÃ³ sÃ£o necessÃ¡rios se o apontamento precisar dessa informaÃ§Ã£o. Caso contrÃ¡rio, nÃ£o Ã© preciso enviÃ¡-los.

	Verificar como pegar a maquina referente ao apontamento.
    /*/
Static Function fCYV(aCYV)
	Local lRet := .T.
	Local cOP       := QRY->ORD_PROD
	Local cOperacao := StrZero(1, 2) //TamSX3("CYV_CDAT")[1])
//	Local cSplit    := IF(empty(QRY->SPLIT),STRZERO(1,5),QRY->SPLIT)  //Local cSplit    := QRY->SPLIT
	Local cIdOpSfc  := StrZero(1, TamSX3("CYV_IDAT")[1])
	Local cMaquina  := PT->LINHAPROD
	Local nQtdApon  := PT->QTDCAIXA
	Local dDtIni    := StoD(PT->INICIO_DT) //StoD(StrTran(SubStr(PT->EMBINICIO,1,10),"-",""))
	Local dDtFim    := StoD(PT->FINAL_DT )  //StoD(StrTran(SubStr(PT->EMBFINAL,1,10),"-",""))
	Local cHrIni    := Alltrim(PT->INICIO_HR) //"08:00:00" //SubStr(PT->EMBINICIO,12,8)
	Local cHrFim    := Alltrim(PT->FINAL_HR)  //"12:00:00" //SubStr(PT->EMBFINAL,12,8)
	Local cChvPT    := padr(PT->CODPALLET, TamSX3("CYV_XPTCHV")[1])
	local CCYY      := ''
	local CCYV      := ''
	local cProdSC2  := ""
	//local aRetCYV   := {}
	//local cSeqOP    := ""

	//verificando se já existe esse pallet na cyv, se sim nao deixar criar um novo
	CCYV := "SELECT COUNT(CYV_CDMQ) QTD,CYV_FILIAL, CYV_CDMQ, CYV_NRORPO, CYV_IDAT,  CYV_DTRPBG, CYV_HRRPBG , CYV_DTRPED, CYV_HRRPED, CYV_NRDO, CYV_XPTCHV "+CRLF
	CCYV += " FROM "+RetSqlName("CYV")+" CYV "+CRLF
	CCYV += " WHERE CYV.D_E_L_E_T_ = ' '     "+CRLF
	CCYV += " AND CYV.CYV_FILIAL  = '0102'   "+CRLF
	CCYV += " AND CYV_NRORPO = '"+cOP+"' AND CYV_CDMQ ='1702' "+CRLF //CYV_CDMQ ='"+Alltrim(cMaquina)+"' "+CRLF
	CCYV += " AND CYV_XPTCHV = '"+cChvPT+"' "+CRLF
	CCYV += " GROUP BY CYV_FILIAL, CYV_CDMQ, CYV_NRORPO, CYV_IDAT, CYV_DTRPBG, CYV_HRRPBG , CYV_DTRPED, CYV_HRRPED, CYV_NRDO, CYV_XPTCHV "+CRLF

	If Select("QCYY") > 0
		CCYV->(DBCLOSEAREA())
	EndIf
	CCYV := ChangeQuery(CCYV)

	conout("FTOP - "+CCYV)

	TcQuery CCYV New Alias "CCYV"

	CCYV->(DbGoTop())

	IF CCYV->QTD > 1
		lRet := .F.
	ENDIF

	if lRet
		// verificar se na CYY existe via query - filtrar filial / nrorpo / cdmq
		// se nao existir criar cyy com os campos filial / nrorpo / CYY_IDAT  = operacao / CYY_IDATQO = maquina / CYY_CDMQ  = maquina
		cProdSC2 := checkPrdSC2(PT->OP)

		CYB->(dbSetOrder(1))
		CYB->(dbSeek(xFilial("CYB")+AvKey(Alltrim(cMaquina), "CYB_CDMQ")))
		cCentroTrb := CYB->CYB_CDCETR

		CCYY := "SELECT R_E_C_N_O_ AS REGISTRO, CYY.* FROM "+RetSqlName("CYY")+" CYY "+CRLF
		CCYY += "WHERE CYY.D_E_L_E_T_ = ' ' AND CYY.CYY_FILIAL  = '0102' "+CRLF
		CCYY += " AND CYY_NRORPO = '"+cOP+"' AND  CYY_CDMQ ='"+Alltrim(cMaquina)+"' "+CRLF

		If Select("QCYY") > 0
			QCYY->(DBCLOSEAREA())
		EndIf
		CCYY := ChangeQuery(CCYY)

		conout("FTOP - "+CCYY)

		TcQuery CCYY New Alias "QCYY"

		QCYY->(DbGoTop())

		If QCYY->(EoF())
			conout("Cria CYY")
			RecLock("CYY", .T.)
			CYY->CYY_FILIAL := xFilial("CYY")
			CYY->CYY_NRORPO := cOP
			CYY->CYY_IDAT   := StrZero(1, 10)
			CYY->CYY_IDATQO := StrZero(VAL(cMaquina),5)
			CYY->CYY_CDMQ   := cMaquina
			CYY->CYY_DTBGAT := StoD(PT->INICIO_DT)
			CYY->CYY_HRBGAT := Alltrim(PT->INICIO_HR)
			CYY->CYY_TPSTAT := '3'
			CYY->CYY_QTATAP := nQtdApon
			CYY->CYY_QTAT   := QRY->QTD_ORD
			CYY->CYY_QTATRP := nQtdApon
			CYY->CYY_DTEDAT := StoD(PT->FINAL_DT)
			//CYY->CYY_DTTI   := StoD(PT->FINAL_DT)
			CYY->CYY_DTBGPL := StoD(PT->FINAL_DT)
			CYY->CYY_DTEDPL := StoD(PT->FINAL_DT)
			CYY->CYY_LGQOED := .F.
			CYY->CYY_CDCETR := cCentroTrb
			CYY->CYY_CDAC   := cProdSC2
			CYY->(MsUnlock())
		else
			//----------------------------------------------------
			//Ajustes do codigo do split e codigo do produto que
			//deve ser igual ao da OP
			//----------------------------------------------------
			dbSelectArea("CYY")
			CYY->(dbGoTo(QCYY->REGISTRO))
			reclock("CYY", .F.)
			CYY->CYY_IDATQO := StrZero(VAL(cMaquina),5)
			if alltrim(QCYY->CYY_CDAC) <> alltrim(cProdSC2) .and. !empty(cProdSC2)
				CYY->CYY_CDAC := cProdSC2
			endif
			CYY->(msUnlock())

			conout("nao entrou para criar a CYY")
		ENDIF
		// Os itens abaixo tem que ser nesta ordem
		/*if Len( aRetCYV := SFCA314VAP(cMaquina,dDtIni,dDtFim,cHrIni,cHrFim)) > 0 //INTEREÇANTE SERIA PEGAR O CODIGO DE PALETE E GRAVAR AKI O CODIGO NO CAMPO CUSTOMIZADO.
			cSeqOP := aRetCYV[1][1]
			TcSqlExec("UPDATE "+retSqlName("CYV")+" SET CYV_XPTCHV='"+cChvPT+"' WHERE CYV_NRSQRP='"+alltrim(cSeqOP)+"' AND CYV_CDMQ = '"+alltrim(cMaquina)+"' AND D_E_L_E_T_ = ' '")
			conout ("UPDATE "+retSqlName("CYV")+" SET CYV_XPTCHV='"+cChvPT+"' WHERE CYV_NRSQRP='"+alltrim(cSeqOP)+"' AND CYV_CDMQ = '"+alltrim(cMaquina)+"' AND D_E_L_E_T_ = ' '")
			conout("FTOP - FUNÇÃO SFCA314VAP impediu continuidade. Maquina:. "+cMaquina+" Data Ini:"+dtoc(dDtIni)+" Data Fim:"+dtoc(dDtFim)+" Hora Ini:"+cHrIni+" Hora fim:"+cHrFim)
			Return .F.
		EndIf*/

		aadd(aCYV,{"CYV_NRORPO", cOP,            })     // Ordem de Producao (CYQ)
		aadd(aCYV,{"CYV_CDAT"  , cOperacao,      })     // Operacao (CY9)
		aadd(aCYV,{"CYV_IDATQO", StrZero(VAL(cMaquina),5),         })     // Split	(CYY)
		aadd(aCYV,{"CYV_CDMQ"  , Alltrim(cMaquina),})   // Maquina (CYB)
		aadd(aCYV,{"CYV_QTATRP", nQtdApon,})            // Quantidade Reportada
		aadd(aCYV,{"CYV_DTRPBG", dDtIni,  })            // Data Inicial
		aadd(aCYV,{"CYV_HRRPBG", Alltrim(cHrIni),  })   // Hora Inicial
		aadd(aCYV,{"CYV_DTRPED", dDtFim,  })            // Data Final
		aadd(aCYV,{"CYV_HRRPED", Alltrim(cHrFim),  })   // Hora Final

		// A partir daqui as informações podem ser ordenadas a gosto
		aadd(aCYV,{"CYV_IDAT"  , cIdOpSFC,       })  // Identificador Operacao SFC
		aadd(aCYV,{"CYV_XPTCHV", cChvPT,  })     // Codigo do pallet do pack trust
		aadd(aCYV,{"CYV_NRSQRP", cSeq,    })     // Sequência Reporte
	ENDIF
Return lRet

Static Function vRetSeq()
	Local nSeq
	Local cQry := "SELECT LPAD((MAX(CYV_NRSQRP)+2),20,0) CYV_NRSQRP FROM CYV010"

	If Select("CSEQ") > 0
		CSEQ->(DBCLOSEAREA())
	EndIf
	cQry := ChangeQuery(cQry)

	TcQuery cQry New Alias "CSEQ"

	nSeq := CSEQ->CYV_NRSQRP

	CSEQ->(DBCLOSEAREA())

Return  nSeq

Static Function fCZP(aCZP, cTipo)
	Local lRet  := .F.
	Local cQry  := ""
	Local aItem := {}
	Default cTipo := "PA"

	If cTipo == "PA"
		cQry += "SELECT  (CYP_QTMT / CYQ_QTOR) * "+cValToChar(PT->QTDCAIXA)+" nProp, CYP_IDMTOR,CYP_CDACPI, CYP_CDDP ARMAZEM, CYP_QTMT QTD_RESERVA, CYP_QTRP QTD_ATENDIDA, CYP_CDUN UN, CYP_CDMT PROD, B1_DESC PROD_DESC"+CRLF
		cQry += "FROM "+RetSqlName("CYP")+" CYP"+CRLF
		cQry += "INNER JOIN "+RetSqlName("CYQ")+" CYQ"+CRLF
		cQry += "ON CYQ.D_E_L_E_T_  = ' '"+CRLF
		cQry += "AND CYQ_FILIAL = CYP_FILIAL"+CRLF
		cQry += "AND CYQ_NRORPO = CYP_NRORPO"+CRLF
		cQry += "INNER JOIN "+RetSqlName("SB1")+" SB1"+CRLF
		cQry += "ON SB1.D_E_L_E_T_ = ' '"+CRLF
		cQry += "AND B1_COD = CYP_CDMT  "+CRLF
		cQry += "WHERE CYP.D_E_L_E_T_ = ' '"+CRLF
		cQry += "AND CYP_FILIAL  = '0102' "+CRLF
		cQry += "AND CYP_NRORPO  = '"+QRY->ORD_PROD+"'"+CRLF
	Else
		cQry += "SELECT *"+CRLF
        cQry += "FROM MOCPP0002@SIGOFC CONSUMO"+CRLF
//		cQry += "FROM MOCPP0002@SIGTES CONSUMO"+CRLF
		//cQry += 'WHERE "CodPallet"'+" = '2GDH0039K8060001' "+CRLF
	EndIf

	If Select("qRES") > 0
		qRES->(dbCloseArea())
	EndIf

	TcQuery cQry New Alias "qRES"

	If !qRES->(EoF())
		While !qRES->(EoF())
			aItem := {}
			if cTipo == "PA"
				aadd(aItem,{"CZP_IDMTOR"  , qRES->CYP_IDMTOR, })
				aadd(aItem,{"CZP_CDACPI"  , qRES->CYP_CDACPI, })
			endif
			aadd(aItem,{"CZP_CDMT"  , qRES->PROD, })
			aadd(aItem,{"CZP_QTRPPO", qRES->nProp,})

			aadd(aCZP, aItem)
			qRES->(dbSkip())
		End
		lRet := .T.
	Else
		lRet := .F.
	EndIf

	qRES->(dbCloseArea())
Return lRet

Static Function fCYW(aCYW)
	Local lRet := .T.
	Local cOper     := "0001"
	Local dDtIni    := StoD(PT->INICIO_DT)  //StoD(StrTran(SubStr(PT->EMBINICIO,1,10),"-",""))
	Local dDtFim    := StoD(PT->FINAL_DT )  //StoD(StrTran(SubStr(PT->EMBFINAL,1,10),"-",""))
	//Local cHrIni    := "10:16:15" //SubStr(PT->EMBINICIO,12,8)
	//Local cHrFim    := "10:20:10" //SubStr(PT->EMBFINAL,12,8)
	Local cHrIni    := Alltrim(PT->INICIO_HR) //"08:00:00" //SubStr(PT->EMBINICIO,12,8)
	Local cHrFim    := Alltrim(PT->FINAL_HR)  //"12:00:00" //SubStr(PT->EMBFINAL,12,8)

	//Local cHrIni    := PT->INICIO_HR        //SubStr(PT->EMBINICIO,12,8)
	//Local cHrFim    := PT->FINAL_HR         //SubStr(PT->EMBFINAL,12,8)
	Local aItem     := {}

	// Mao de Obra
	aItem := {}
	aadd(aItem,{"CYW_CDOE"  ,cOper ,})
	aadd(aItem,{"CYW_DTBGRP",dDtIni,})
	aadd(aItem,{"CYW_HRBGRP",cHrIni,})
	aadd(aItem,{"CYW_DTEDRP",dDtFim,})
	aadd(aItem,{"CYW_HREDRP",cHrFim,})
	AADD(aCYW, aItem)
Return lRet

Static Function fCY0(aCY0)
	Local lRet := .F.
	Local aItem := {}

	AADD(aCY0,aItem)
Return lRet

Static Function fCZW(aCZW,cMaq)
	Local lRet := .t.
	Local aItem := {}
	local aAreaCYB := CYB->(getArea())
	local cCentroTrb := ""

    /*Field 1: CZW_FILIAL(C) :0102
    Field 2: CZW_NRSQRP(C) :00000000000014142238
    Field 3: CZW_CDCETR(C) :018       
    Field 4: CZW_QTTEGF(N) :180
    Field 5: CZW_HRTEGF(N) :0.05
    */
		CYB->(dbSetOrder(1))
		CYB->(dbSeek(xFilial("CYB")+AvKey(cMaq, "CYB_CDMQ")))
		cCentroTrb := CYB->CYB_CDCETR

		aItem := {}
		aadd(aItem,{"CZW_CDCETR",cCentroTrb})
		aadd(aItem,{"CZW_HRTEGF",0.5,})
		// aadd(aItem,{"CZW_NRSQRP",cSeq,})	  // xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
		// aadd(aItem,{"CZW_QTTEGF",1800,})      // xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

    /*
    adetalhe := {}
    aadd(adetalhe,{"CZW_CDCETR", "CT1",})	
    aadd(adetalhe,{"CZW_HRTEGF", 1,})	
    AADD(aCZW,adetalhe)		
    */

		AADD(aCZW,aItem)

		restArea(aAreaCYB)
		aSize(aAreaCYB,0)
		Return lRet


User Function  fLogTela()
	Local oDlgLog
	Local oGrpMsg
	Local oLbxLog
	Local oBtnFim
	Local aCampos := {}

	Aadd(aCampos,{"", "", ""})

	DEFINE MSDIALOG oDlgLog TITLE "Log de Pedido" FROM 000, 000  TO 258, 498 COLORS 0, 16777215 PIXEL

	@ 008, 008 GROUP oGrpMsg TO 033, 245 PROMPT "Logs" OF oDlgLog COLOR 0, 16777215 PIXEL
	@ 019, 013 Say "Abaixo segue os log - "+CYQ->CYQ_NRORPO+"." Size 240, 030 COLOR CLR_BLACK PIXEL OF oGrpMsg
	@ 040, 008 LISTBOX oLbxLog FIELDS HEADER "Data", "Hora" SIZE 236, 065, 15 OF oDlgLog PIXEL
	@ 109, 208 BUTTON oBtnFim PROMPT "&Finalizar" SIZE 037, 012 OF oDlgLog ACTION (oDlgLog:end()) PIXEL

	fCarrgaList(@aCampos, @oLbxLog)

	oLbxLog:bLDblClick := {|| fDescLog(CYQ->CYQ_NRORPO) }

	ACTIVATE MSDIALOG oDlgLog CENTERED
return

Static Function fDescLog(cOP)
	Local oDlg := nil
	Local oEdit := nil

	Default cOP := ""

	TAB_LOG := "ZA0"

	DbSelectArea(TAB_LOG)
	(TAB_LOG)->(dbSetOrder(2))
	(TAB_LOG)->(DbGoTop())

	If (TAB_LOG)->(dbSeek(xFilial("CYQ")+cOP))
		DEFINE DIALOG oDlg TITLE "Historico" FROM 180, 180 TO 550, 700 PIXEL
		oEdit := tSimpleEditor():New(0, 0, oDlg, 260, 184)
		oEdit:Load(STRTRAN((TAB_LOG)->&(TAB_LOG+"_LOG"), CHR(10), '<BR>'))
		ACTIVATE DIALOG oDlg CENTERED
	else
		MsgStop("Ordem de produção nao possui log de registro.")
	EndIf
Return

//função que carrega os campos
Static Function fCarrgaList(aCampos, oLbx)
	Processa( {|| fCarregaCampos(aCampos) }, "Aguarde...", "Carregando definição dos campos...",.F.)
	oLbx:SetArray(aCampos)
	oLbx:bLine := {|| {aCampos[oLbx:nAt,1], aCampos[oLbx:nAt,2], aCampos[oLbx:nAt, 3]}}
	oLbx:Refresh()
Return

//função que vai alimentar os campos
Static Function fCarregaCampos (aCampos)
	aCampos := {}

	DbSelectArea(TAB_LOG)
	(TAB_LOG)->(dbSetOrder(1))
	(TAB_LOG)->(DbGoTop())

	IF (TAB_LOG)->(dbSeek(xFilial("SC5")+SC5->C5_NUM))
		ProcRegua(RecCount())

		WHILE (TAB_LOG)->(!Eof())  .and. (TAB_LOG)->&(TAB_LOG+"_PEDIDO") == SC5->C5_NUM
			IncProc()
			Aadd(aCampos, {&(TAB_LOG+"_DATA"), &(TAB_LOG+"_HORA"), &(TAB_LOG+"_USER")})
			DbSkip()
		END
	ELSE
		Aadd(aCampos,{"", "", "", ""})
	ENDIF
return


/*/{Protheus.doc} validSC2
Valida SC2 x View maquina
@type function
@version  1.0
@author marcio.katsumata
@since 3/18/2024
@param cOPView, character, OP da view
@param cLinView, character, Máquina da view
@param cMsgErro, character, mensagem de erro
@return logical, ok?
/*/
static function validSC2(cOPView, cLinView, cMsgErro)

	local cAliasSC2 as character
	local cFilView as character
	local nPosAtu as numeric
	local cNumOpView as character
	local cItemView as character
	local cSeqView as character
	local lRet as logical


	if !empty(cOpView)
		lRet := .T.
		cAliasSC2 := getNextAlias()

		cFilView := substr(cOpView, 1,tamSx3("C2_FILIAL")[1])
		nPosAtu := tamSx3("C2_FILIAL")[1]+1
		cNumOpView := substr(cOpView, nPosAtu,tamSx3("C2_NUM")[1])
		nPosAtu := nPosAtu + tamSx3("C2_NUM")[1]
		cItemView := substr(cOpView, nPosAtu,tamSx3("C2_ITEM")[1])
		nPosAtu := nPosAtu + tamSx3("C2_ITEM")[1]
		cSeqView := substr(cOpView, nPosAtu,tamSx3("C2_SEQUEN")[1])

		beginSql alias cAliasSC2
			SELECT C2_PACLINH
			FROM %table:SC2% SC2
			WHERE SC2.C2_FILIAL = %exp:cFilView%   AND
			      SC2.C2_NUM = %exp:cNumOpView%    AND
				  SC2.C2_ITEM = %exp:cItemView%    AND
				  SC2.C2_SEQUEN = %exp:cSeqView%   AND
				  SC2.C2_PACLINH <> %exp:cLinView% AND
				  SC2.C2_PACLINH <> ''             AND
				  SC2.%notDel%
		endSql


		if (cAliasSC2)->(!eof())
			cMsgErro := "OP "+ cOPView + " máquina divergente da Ordem de Produção. View ["+cLinView+"]" + " Ordem de Produção ["+(cAliasSC2)->C2_PACLINH+"]"
			lRet := .F.
		endif

		(cAliasSC2)->(dbCloseArea())
	else
		cMsgErro := "OP não informada"
	endif

return lRet

/*/{Protheus.doc} checkPrdSC2
Verifica o produto da OP
@type function
@version  1.0
@author marci0.katsumata
@since 3/18/2024
@param cOPView, character, op
@return character, cod do produto 
/*/
static function checkPrdSC2(cOPView)


	local cAliasSC2 as character
	local cFilView as character
	local nPosAtu as numeric
	local cNumOpView as character
	local cItemView as character
	local cSeqView as character
	local lRet as logical
	local cProduto as character

	if !empty(cOpView)
		lRet := .T.
		cAliasSC2 := getNextAlias()

		cFilView := substr(cOpView, 1,tamSx3("C2_FILIAL")[1])
		nPosAtu := tamSx3("C2_FILIAL")[1]+1
		cNumOpView := substr(cOpView, nPosAtu,tamSx3("C2_NUM")[1])
		nPosAtu := nPosAtu + tamSx3("C2_NUM")[1]
		cItemView := substr(cOpView, nPosAtu,tamSx3("C2_ITEM")[1])
		nPosAtu := nPosAtu + tamSx3("C2_ITEM")[1]
		cSeqView := substr(cOpView, nPosAtu,tamSx3("C2_SEQUEN")[1])

		beginSql alias cAliasSC2
			SELECT C2_PRODUTO
			FROM %table:SC2% SC2
			WHERE SC2.C2_FILIAL = %exp:cFilView%   AND
			      SC2.C2_NUM = %exp:cNumOpView%    AND
				  SC2.C2_ITEM = %exp:cItemView%    AND
				  SC2.C2_SEQUEN = %exp:cSeqView%   AND
				  SC2.%notDel%
		endSql

		if (cAliasSC2)->(!eof())
			cProduto := (cAliasSC2)->C2_PRODUTO
		endif

		(cAliasSC2)->(dbCloseArea())
	endif

return cProduto


/*/{Protheus.doc} getCyv
Retorna o conteúdo do campo CYV_NRSQRP
@type function
@version  1.0
@author marcio.katsumata
@since 31/03/2024
@return character, CYV_NRSQRP
/*/
static function getCyv()
	Local cOP       as character
	Local cMaquina  as character
	Local cChvPT    as character
	local cAliasCyv as character
	local cNrsqrp   as character

	cAliasCyv := getNextAlias()
	cOP       := QRY->ORD_PROD
	cMaquina  := PT->LINHAPROD
	cChvPT    := padr(PT->CODPALLET, TamSX3("CYV_XPTCHV")[1])


	beginSql alias cAliasCyv
		SELECT DISTINCT CYV_NRSQRP
		FROM %table:CYV% CYV 
		WHERE CYV.D_E_L_E_T_ = ' '     
			  AND CYV.CYV_FILIAL  = '0102'   
			  AND CYV_NRORPO = %exp:cOP% AND  CYV_CDMQ = %exp:Alltrim(cMaquina)%
			  AND CYV_XPTCHV = %exp:cChvPT%
	endSql

	if (cAliasCyv)->(!eof())
		cNrsqrp := (cAliasCyv)->CYV_NRSQRP
	endif
	(cAliasCyv)->(dbCloseArea())

return cNrsqrp



/*

Filial OP
OP
CODIGO PALLET
MAQUINA
QTD 
Obs. Memo


Function SFCA314VAP ( cMaq, dIni, dFim, cHoraIni, cHoraFim )
	Local aArea  := GetArea()
	Local cIni   := dToS(dIni)
	Local cFim   := dToS(dFim)
	Local cTmp   := GetNextAlias()
	Local aRet   := {}
	Local cQuery := ""

	cQuery := " SELECT CYV.CYV_NRSQRP, CYV.CYV_DTRPBG, CYV.CYV_HRRPBG, CYV.CYV_DTRPED, CYV.CYV_HRRPED, "
	cQuery +=   " ( "
	cQuery +=     " SELECT COUNT(*) "
	cQuery +=       " FROM " + RetSqlName("CYY") + " CYY "
	cQuery +=      " WHERE CYY_TPSTAT = '5' "
	cQuery +=        " AND CYY.D_E_L_E_T_ = ' ' "
	If "MSSQL" $ AllTrim(Upper(TCGETDB()))
		cQuery +=    " AND CYY.CYY_FILIAL+CYY.CYY_NRORPO+CYY.CYY_IDAT+CYY.CYY_IDATQO = CYV.CYV_FILIAL+CYV.CYV_NRORPO+CYV.CYV_IDAT+CYV.CYV_IDATQO "
	Else
		cQuery +=    " AND CYY.CYY_FILIAL||CYY.CYY_NRORPO||CYY.CYY_IDAT||CYY.CYY_IDATQO = CYV.CYV_FILIAL||CYV.CYV_NRORPO||CYV.CYV_IDAT||CYV.CYV_IDATQO "
	EndIf
	cQuery +=   " ) AS SPTFIN "
	cQuery +=   " FROM " + RetSqlName("CYV") + " CYV "
	cQuery +=  " WHERE CYV_FILIAL     = '" + xFilial("CYV") + "' "
	cQuery +=    " AND CYV_CDMQ       = '" + cMaq + "' "
	cQuery +=    " AND CYV.D_E_L_E_T_ = ' ' "
	cQuery +=    " AND CYV_LGRPEO     = 'F' "
	cQuery +=    " AND CYV_TPSTRP     <> '1' "
	cQuery +=    " AND ( "
	cQuery +=      " ( "
	cQuery +=        " ( "
	cQuery +=          " CYV_DTRPBG < '" + cIni + "' OR "
	cQuery +=          " CYV_DTRPBG = '" + cIni + "' AND CYV_HRRPBG <= '" + cHoraIni + "' "
	cQuery +=        " ) AND ( "
	cQuery +=          " CYV_DTRPED > '" + cIni + "' OR "
	cQuery +=          " CYV_DTRPED = '" + cIni + "' AND CYV_HRRPED > '" + cHoraIni + "' "
	cQuery +=        " ) "
	cQuery +=      " ) OR ( "
	cQuery +=        " ( "
	cQuery +=          " CYV_DTRPBG < '" + cFim + "' OR "
	cQuery +=          " CYV_DTRPBG = '" + cFim + "' AND CYV_HRRPBG < '" + cHoraFim + "' "
	cQuery +=        " ) AND ( "
	cQuery +=          " CYV_DTRPED > '" + cFim + "' OR "
	cQuery +=          " CYV_DTRPED = '" + cFim + "' AND CYV_HRRPED >= '" + cHoraFim + "' "
	cQuery +=        " ) "
	cQuery +=      " ) OR ( "
	cQuery +=        " ( "
	cQuery +=          " CYV_DTRPBG > '" + cIni + "' OR "
	cQuery +=          " CYV_DTRPBG = '" + cIni + "' AND CYV_HRRPBG >= '" + cHoraIni + "' "
	cQuery +=        " ) AND ( "
	cQuery +=          " CYV_DTRPED < '" + cFim + "' OR "
	cQuery +=          " CYV_DTRPED = '" + cFim + "' AND CYV_HRRPED < '" + cHoraFim + "' "
	cQuery +=        " ) "
	cQuery +=      " ) "
	cQuery +=    " ) "

	cQuery := ChangeQuery(cQuery)

	dbUseArea( .T., 'TOPCONN', TcGenQry(,,cQuery), cTmp, .T., .F. )

	While !(cTmp)->(Eof())
		aAdd(aRet, {(cTmp)->CYV_NRSQRP, (cTmp)->SPTFIN, (cTmp)->CYV_DTRPBG, (cTmp)->CYV_HRRPBG, (cTmp)->CYV_DTRPED, (cTmp)->CYV_HRRPED} )
		(cTmp)->(dbSkip())
	End

	(cTmp)->(dbCloseArea())

	RestArea(aArea)

Return aRet


/*
Static Function SFCA314CRE (cNRORPO, cIDAT, oModelCZP, nQtdReportar, nQtdOriginal)
    Local nPropProd    := 0
    Local nQtdAtendida := 0
    Local nQtdReserva  := 0
    Local lUltOp       := .F.
    Local nI           := 0
    Local nI2          := 0
    Local cCDAT        := ''
    Local cCDAC        := ''
    Local aArea        := GetArea()
    Local aAreaCY9     := CY9->( GetArea() )
    Local aAreaCYQ     := CYQ->( GetArea() )
    Local aAreaCYP     := CYP->( GetArea() )
    Local nRecNumb     := 0
    Local lExiste      := .F.
    Local aCYPArea
    Local iTam         := 0
    Default lAutomacao := .F.

    dbSelectArea('CY9')
    CY9->(dbSetOrder(1))
    CY9->(dbGoTop())
    CY9->(dbSeek(xFilial('CY9')+cNRORPO+cIDAT))

    if CY9->CY9_LGATED
        lUltOp := .T.
    Endif

    dbSelectArea('CYQ')
    CYQ->(dbSetOrder(1))
    CYQ->(dbGoTop())
    CYQ->(dbSeek(xFilial('CYQ')+cNRORPO))

    cCDAT := CY9->CY9_CDAT
    cCDAC := CYQ->CYQ_CDAC

    If !lAutomacao
        oModelCZP:DeActivate(.T.)
        oModelCZP:Activate()
        oModelCZP:SetNoInsertLine(.F.)
        oModelCZP:SetNoUpdateLine(.F.)
    EndIf

    if IsInCallStack('SFCA314QTR') .And. !IsInCallStack("MATI681") // AlteraÃ§Ã£o de quantidade

        For nI := 1 To oModelCZP:Length()
            oModelCZP:GoLine( nI ) 

            if !oModelCZP:IsDeleted()

                nQtdReserva  := oModelCZP:GetValue('CZP_QTMT')
                nQtdAtendida := oModelCZP:GetValue('CZP_QTRP')

                nPropProd := nQtdReserva / CYQ->CYQ_QTOR  // qtd reservada / qtd da ordem de producao

                oModelCZP:SetValue( 'CZP_QTRPPO', IF(nQtdAtendida < nQtdReserva,nQtdReportar * nPropProd,0))//qtd utilizada
                oModelCZP:SetValue( 'CZP_QTMT'  , nQtdReserva) //qtd reserva
                oModelCZP:SetValue( 'CZP_QTRP'  , nQtdAtendida ) // qtd atendida
            Endif
        Next
    Else
        if !IsInCallStack('SFCA314PRE')
            If !lAutomacao
                For nI := 1 to oModelCZP:GetQtdLine()
                    oModelCZP:GoLine(nI)

                    oModelCZP:ClearField('CZP_CDMT'  )
                    oModelCZP:ClearField('CZP_DSMT'  )
                    oModelCZP:ClearField('CZP_QTRPPO')
                    oModelCZP:ClearField('CZP_QTRP'  )
                    oModelCZP:ClearField('CZP_CDUN'  )
                    oModelCZP:ClearField('CZP_CDACPI')
                    oModelCZP:ClearField('CZP_DSACPI')
                    oModelCZP:ClearField('CZP_DTMT'  )
                    oModelCZP:ClearField('CZP_QTMT'  )
                    oModelCZP:ClearField('CZP_CDLO'  )
                    oModelCZP:ClearField('CZP_CDAT'  )
                    oModelCZP:ClearField('CZP_CDDP'  )
                    oModelCZP:ClearField('CZP_TPST'  )
                    oModelCZP:ClearField('CZP_CDRT'  )
                    oModelCZP:ClearField('CZP_CDRE'  )
                    oModelCZP:ClearField('CZP_NRORRE')
                    oModelCZP:ClearField('CZP_CDLC'  )
                    oModelCZP:ClearField('CZP_CDTBMT')

                    oModelCZP:DeleteLine()
                Next
            EndIf
        Endif

        If !lAutomacao
            SFCA314CLG(oModelCZP)
        EndIf

        nI := 1

        dbSelectArea('CYP')
        CYP->(dbSetOrder(2))
        if CYP->(dbSeek(xFilial('CYP')+cNRORPO+cCDAT+cCDAC))

            While CYP->(!EOF()) .AND. CYP->CYP_NRORPO == cNRORPO .AND.;
                                    CYP->CYP_CDAT   == cCDAT .AND.;
                                    CYP->CYP_CDACPI == cCDAC

                lExiste := .F.
                For nI2 := 1 to oModelCZP:GetQtdLine()
                    oModelCZP:GoLine(nI2)

                    if !oModelCZP:IsDeleted()
                        if oModelCZP:GetValue('CZP_CDMT') == CYP->CYP_CDMT  .And. ;
                            oModelCZP:GetValue('CZP_CDLO') == CYP->CYP_CDLO .And. ;
                            oModelCZP:GetValue('CZP_CDDP') == CYP->CYP_CDDP .And. ;
                            oModelCZP:GetValue('CZP_CDRT') == CYP->CYP_CDRT .And. ;
                            oModelCZP:GetValue('CZP_CDRE') == CYP->CYP_CDRE .And. ;
                            oModelCZP:GetValue('CZP_CDLC') == CYP->CYP_CDLC

                            nQtdReserva  := oModelCZP:GetValue('CZP_QTMT')
                            nQtdReserva  := nQtdReserva + CYP->CYP_QTMT

                            nQtdAtendida := oModelCZP:GetValue('CZP_QTRP')
                            nQtdAtendida := nQtdAtendida + CYP_QTRP

                            nPropProd := nQtdReserva / CYQ->CYQ_QTOR  // qtd reserva / qtd ordem

                            oModelCZP:SetValue( 'CZP_QTRPPO', IF(nQtdAtendida < nQtdReserva,nQtdReportar * nPropProd,0))//qtd utilizada
                            oModelCZP:SetValue( 'CZP_QTMT'  , nQtdReserva) //qtd reserva
                            oModelCZP:SetValue( 'CZP_QTRP'  , nQtdAtendida ) // qtd atendida

                            lExiste := .T.
                            exit
                        Endif
                    Endif
                Next

                if !lExiste
                    nPropProd := CYP->CYP_QTMT / CYQ->CYQ_QTOR
                    nRecNumb := CYP->(RecNo())

                    if nI > oModelCZP:GetQtdLine()
                        aCYPArea := CYP->(getArea())
                        oModelCZP:AddLine()
                        CYP->( RestArea(aCYPArea) )
                    Else
                        oModelCZP:GoLine(nI)

                        if oModelCZP:IsDeleted()
                            oModelCZP:UnDeleteLine()
                        Endif
                    Endif

                    CYP->(dbGoTo(nRecNumb))

                    nI++

                    oModelCZP:SetNoUpdateLine(.F.)

                    oModelCZP:SetValue( 'CZP_NRORPO', cNRORPO ) //ordem
                    oModelCZP:SetValue( 'CZP_IDMTOR', CYP->CYP_IDMTOR ) //id
                    oModelCZP:SetValue( 'CZP_QTRPPO', IF(CYP->CYP_QTRP < CYP->CYP_QTMT,nQtdReportar * nPropProd,0)) //qtd utilizada
                    oModelCZP:SetValue( 'CZP_CDMT'  , CYP->CYP_CDMT )   //componente
                    oModelCZP:SetValue( 'CZP_CDACPI', cCDAC )  //item pai
                    oModelCZP:SetValue( 'CZP_CDES'  , Posicione("CYQ", 1, xFilial("CYQ")+cNRORPO, "CYQ_CDES") ) //estab
                    oModelCZP:SetValue( 'CZP_DTMT'  , CYP->CYP_DTMT ) //data reserva
                    oModelCZP:SetValue( 'CZP_QTMT'  , CYP->CYP_QTMT ) //qtd reserva
                    oModelCZP:SetValue( 'CZP_QTRP'  , CYP->CYP_QTRP ) // qtd atendida
                    oModelCZP:SetValue( 'CZP_CDLO'  , CYP->CYP_CDLO ) // lote
                    oModelCZP:SetValue( 'CZP_CDAT'  , cCDAT ) //operaÃ§Ã£o
                    oModelCZP:SetValue( 'CZP_CDDP'  , CYP->CYP_CDDP )   //deposito
                    oModelCZP:SetValue( 'CZP_TPST'  , CYP->CYP_TPST ) //estado
                    oModelCZP:SetValue( 'CZP_CDRT'  , CYP->CYP_CDRT ) // roteiro
                    oModelCZP:SetValue( 'CZP_CDRE'  , CYP->CYP_CDRE ) // referencia
                    oModelCZP:SetValue( 'CZP_NRORRE', CYP->CYP_NRORRE ) // ordem refer
                    oModelCZP:SetValue( 'CZP_CDLC'  , CYP->CYP_CDLC ) //localizaÃ§Ã£o
                    oModelCZP:SetValue( 'CZP_CDTBMT', CYP->CYP_CDTBMT ) //processo ordem
                EndIf

                CYP->(dbSkip())
            End
        Endif

        if lUltOp

            dbSelectArea('CYP')
            CYP->(dbSetOrder(1))
            CYP->(dbGoTop())
            CYP->(dbSeek(xFilial('CYP')+cNRORPO))

            While CYP->(!EOF()) .AND. CYP->CYP_NRORPO == cNRORPO

                if Empty(CYP->CYP_CDAT)
                    lExiste := .F.
                    For nI2 := 1 to oModelCZP:GetQtdLine()
                        oModelCZP:GoLine(nI2)
                        if !oModelCZP:IsDeleted()
                            if oModelCZP:GetValue('CZP_CDMT') == CYP->CYP_CDMT  .And. ;
                                oModelCZP:GetValue('CZP_CDLO') == CYP->CYP_CDLO .And. ;
                                oModelCZP:GetValue('CZP_CDDP') == CYP->CYP_CDDP .And. ;
                                oModelCZP:GetValue('CZP_CDRT') == CYP->CYP_CDRT .And. ;
                                oModelCZP:GetValue('CZP_CDRE') == CYP->CYP_CDRE .And. ;
                                oModelCZP:GetValue('CZP_CDLC') == CYP->CYP_CDLC

                                nQtdReserva  := oModelCZP:GetValue('CZP_QTMT')
                                nQtdReserva  := nQtdReserva + CYP->CYP_QTMT

                                nQtdAtendida := oModelCZP:GetValue('CZP_QTRP')
                                nQtdAtendida := nQtdAtendida + CYP_QTRP

                                nPropProd := nQtdReserva / CYQ->CYQ_QTOR  // qtd reserva / qtd ordem

                                oModelCZP:SetValue( 'CZP_QTRPPO', IF(nQtdAtendida < nQtdReserva,nQtdReportar * nPropProd,0))//qtd utilizada

                                oModelCZP:SetValue( 'CZP_QTMT'  , nQtdReserva) //qtd reserva
                                oModelCZP:SetValue( 'CZP_QTRP'  , nQtdAtendida ) // qtd atendida
                                lExiste := .T.
                                Exit
                            Endif
                        Endif
                    Next

                    If !lExiste
                        if nI > oModelCZP:GetQtdLine()
                            aCYPArea := CYP->(getArea())
                            oModelCZP:AddLine()
                            CYP->( RestArea(aCYPArea) )
                        Else
                            oModelCZP:GoLine(nI)

                            if oModelCZP:IsDeleted()
                                oModelCZP:UnDeleteLine()
                            Endif
                        Endif

                        nI++

                        oModelCZP:SetNoUpdateLine(.F.)

                        proporcao do produto =  quantidade reservada / pela quantidade 
                        nPropProd := CYP->CYP_QTMT / CYQ->CYQ_QTOR

                        oModelCZP:SetValue( 'CZP_NRSQRP', M->CYV_NRSQRP )
                        oModelCZP:SetValue( 'CZP_NRORPO', M->CYV_NRORPO )
                        oModelCZP:SetValue( 'CZP_IDMTOR', CYP->CYP_IDMTOR )
                        oModelCZP:SetValue( 'CZP_QTRPPO', IF(CYP->CYP_QTRP < CYP->CYP_QTMT,nQtdReportar * nPropProd,0))
                        oModelCZP:SetValue( 'CZP_CDMT'  , CYP->CYP_CDMT )
                        oModelCZP:SetValue( 'CZP_DTMT'  , CYP->CYP_DTMT )
                        oModelCZP:SetValue( 'CZP_QTMT'  , CYP->CYP_QTMT )
                        oModelCZP:SetValue( 'CZP_CDUN'  , CYP->CYP_CDUN )
                        oModelCZP:SetValue( 'CZP_QTRP'  , CYP->CYP_QTRP )
                        oModelCZP:SetValue( 'CZP_CDLO'  , CYP->CYP_CDLO )
                        oModelCZP:SetValue( 'CZP_CDAT'  , CYP->CYP_CDAT )
                        oModelCZP:SetValue( 'CZP_CDDP'  , CYP->CYP_CDDP )
                        oModelCZP:SetValue( 'CZP_TPST'  , CYP->CYP_TPST )
                        oModelCZP:SetValue( 'CZP_CDACPI', CYP->CYP_CDACPI )
                        oModelCZP:SetValue( 'CZP_CDRT'  , CYP->CYP_CDRT )
                        oModelCZP:SetValue( 'CZP_CDRE'  , CYP->CYP_CDRE )
                        oModelCZP:SetValue( 'CZP_NRORRE', CYP->CYP_NRORRE )
                        oModelCZP:SetValue( 'CZP_CDLC'  , CYP->CYP_CDLC )
                        oModelCZP:SetValue( 'CZP_CDTBMT', CYP->CYP_CDTBMT )
                    Endif
                Endif

                CYP->(dbSkip())
            End
        Endif
    Endif

    if nI > 1
        iTam := LEN(oModelCZP:ADATAMODEL)
        oModelCZP:AddLine()
        ASIZE(oModelCZP:aDataModel, iTam)
    Endif

    IF SFCIntegra() == 1
        if GetMV("MV_REQAUT") == 'D'
            oModelCZP:SetNoInsertLine(.F.)
            oModelCZP:SetNoUpdateLine(.F.)
        Else
            oModelCZP:SetNoInsertLine(.T.)
            oModelCZP:SetNoUpdateLine(.T.)
        Endif

    Endif

    If !lAutomacao
        oModelCZP:GoLine(1)
    EndIf

    RestArea(aAreaCY9)
    RestArea(aAreaCYQ)
    RestArea(aAreaCYP)
    RestArea(aArea)

Return .T.
*/
