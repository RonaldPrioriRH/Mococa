#Include "totvs.ch"

/*/{Protheus.doc} fPtOPE
Programa de estorno de produção integrado com a view da 
plataforma PackTrust.
Disponivel em Modulo 10 Atualizações -> Cadastros -> Produtos -> Teste FPTOP
Documentação do execauto:
https://tdn.totvs.com/display/public/PROT/DT_ExecAuto_Apontamento_e_Schedule
@type function
@version  1.0
@author marcio.katsumata
@since 19/07/2024
@param cEmpProc, character, Empresa do processamento
@param cFilProc, character, Filial do processamento
/*/
user function fPtOPE(cEmpProc, cFilProc)


	Local lRet      as logical
	Local cMsg      as character
	Local nAux      as numeric
	local cMsgErro  as character
	local cError    as character
	local oError    as object


	Private cAliasTmp     as character
	private cAliasApon     as character
	Private lJob           as logical
	private cFil           as character
	Private cSeq           as character
	Private lAutoErrNoFile as logical
	Private lMsErroAuto    as logical
	Private lMsHelpAuto    as logical

	default cEmpProc:= '01'
	default cFilProc:= '0102'

	__cInterNet := "AUTOMATICO"
	__lPYME     := .F.

	oError    	   := nil
	lRet      	   := .T.
	cMsg      	   := ""
	cQry      	   := ""
	cMsgErro  	   := ""
	cError    	   := ""
	lJob      	   := isBlind()
	cFil      	   := iif(!empty(cFilProc) .and. lJob,cFilProc, cFilAnt)
	lAutoErrNoFile := .T.
	lMsErroAuto    := .F.
	lMsHelpAuto    := .T.
	cAliasTmp      := getNextAlias()

	//---------------------------------
	//Realiza a preparação do ambiente
	//---------------------------------
	If lJob
		if ! fMntEnv(cEmpProc, cFilProc)
			return
		endIf
	endIf

	//---------------------------------------------
	//Verifica a data base que deve ser retroagida
	//---------------------------------------------
	dDataBase := daysub(date(), superGetMv("RETRO_PAC", .F., 90))

	dbSelectArea('ZA1')

	//-------------------------------------
	//Verifica se existe op para integrar
	//na view do PackTrust
	//Apontamento ou estorno
	//-------------------------------------
	If !fSelOPs()
		cMsg := "Erro na consulta ou nao ha resultado."+CRLF+"Para melhor analise consulte o arquivo de consulta PTOPs_SelOPs em Consultas."+CRLF
		conout("FTOPE 002: "+cMsg)
	endIf


	While !(cAliasTmp)->(EOF())

		cAliasApon := getNextAlias()

		conout("FTOPE 003:Executando EM JOB na QRY.")

		//----------------------------------
		//Processo de estorno de apontamento
		//-----------------------------------
		beginSql alias cAliasApon
				SELECT  
				   	   CODIGOERP, LOTE, CODPALLET, QTDCAIXA,
				   	   TO_CHAR(TO_DATE(DTEMBINICIO,'DD/MM/YYYY'),'YYYYMMDD') INICIO_DT, to_char(HREMBINICIO) INICIO_HR,
				   	   TO_CHAR(TO_DATE(DTEMBFINAL,'DD/MM/YYYY'),'YYYYMMDD') FINAL_DT,  to_char(HREMBFINAL) FINAL_HR,
				   	   OP, LINHAPROD 
				FROM MOCPP0001@SIGOFC
				WHERE OP = %exp:ALLTRIM((cAliasTmp)->OP_PT)% AND
					  TRIM(SUBSTR(DTEMBINICIO,7,4)||SUBSTR(DTEMBINICIO,4,2)||SUBSTR(DTEMBINICIO,1,2)) >= %exp:dtos(dDataBase)% AND
					  NOT EXISTS (SELECT 1
									FROM %table:ZA1% ZA1 
									WHERE ZA1.ZA1_FILIAL = %exp:xFilial("ZA1")% AND
									      ZA1.ZA1_STATUS <> 'R'                 AND
									      TRIM(ZA1_PALLET) = TRIM(CODPALLET)    AND
									      ZA1.ZA1_ESTORN = 1                    AND
									      ZA1.%notDel%
									) 
						AND  HREMBINICIO = %exp:(cAliasTmp)->HREMBINICIO%
						AND TO_NUMBER(ESTORNADO) = 1
				ORDER BY HREMBINICIO 
		endSql
		conout("FTOPE 006:Executando Scrip PT ."+getLastQuery()[2])


		If (cAliasApon)->(Eof())
			cMsg := "Erro na consulta ou nao ha resultado para o estorno para esta OP: "+ALLTRIM((cAliasTmp)->ORD_PROD)+"."+CRLF
			conout("FTOPE 007: "+cMsg)
			(cAliasTmp)->(dbskip())
			loop
		endIf

		//-------------------------
		//Retorna o seq. de reporte
		//--------------------------
		cNrsqrp := getCyv()

		//----------------------------------------------
		//Realiza o execauto de estorno de produção
		//----------------------------------------------
		conout("FTOPE: Iniciando execauto de estorno SFCA316.")
		oError    := ErrorBlock({|e| cError := e:Description +CRLF+ e:ErrorStack})

		if !empty(cNrsqrp)

			BEGIN SEQUENCE
				lRet := SFCA316(,2,{{"CYV_NRSQRP",cNrsqrp, nil }, {"CYV_DTEO", date(), nil}})
			END SEQUENCE

			if lMsErroAuto .or. !empty(cError) .or. !lRet
				cMsg := "FTOPE :Erro no ExecAuto."+CRLF

				if empty(cError) .or. "MOSTRAERRO(MATXFUNB.PRX)" $ cError
					aLogAuto := GetAutoGRLog()
					cMsg+=" Qtd de linhas de erro:"+str(len(aLogAuto))+CRLF
					For nAux := 1 To Len(aLogAuto)
						cMsg += aLogAuto[nAux] + Chr(13) + Chr(10)
					Next
					conout(cMsg)
				else
					cMsg += cError
				endIf

				if !lJob
					Help(" ", 1, "Erro",, cMsg ,1,0 )
				endIf
				fGrvLog(cMsg, (cAliasTmp)->ORD_PROD, .T.,(cAliasApon)->QTDCAIXA,(cAliasApon)->CODPALLET,(cAliasApon)->LINHAPROD,'E',1)

			else

				conout("FTOPE :ExecAuto de estorno executado com S U C E S S O.")
				cMsg := 'Atualizado com Sucesso'
				fGrvLog(cMsg, (cAliasTmp)->ORD_PROD, .T.,(cAliasApon)->QTDCAIXA,(cAliasApon)->CODPALLET,(cAliasApon)->LINHAPROD,'F',1)
			endIf
		else

			cMsg := "Erro na montagem do estorno de proDucao (CYV) da OP: "+Alltrim((cAliasTmp)->ORD_PROD)+"."+CRLF
			cMsg += "Não encontrado o conteúdo do campo CYV_NRSQRP "+CRLF
			fGrvLog(cMsg,(cAliasTmp)->ORD_PROD, .T.,(cAliasApon)->QTDCAIXA,(cAliasApon)->CODPALLET,(cAliasApon)->LINHAPROD,'E',1)

		endIf

		(cAliasApon)->(DbCloseArea())

		conout("FTOPE :Concluiu QRY.")
		(cAliasTmp)->(dbSkip())
		exit
	end

	(cAliasTmp)->(dbCloseArea())
	conout("FTOPE :Finalizando.")

	//----------------------------------------
	//Realiza a limpeza do ambiente preparado
	//----------------------------------------
	if lJob
		rpcClearEnv()
	endIf

return

/*/{Protheus.doc} fMntEnv
Realiza a preparação do ambiente de acordo
com a empresa e filial informada.
@type function
@version  1.0
@author marcio.katsumata
@since 19/07/2024
@param cEmp, character, codigo da empresa
@param cFil, character, codigo da filial
@return logical, preparação do ambiente ok?
/*/
static function fMntEnv(cEmp, cFil)
	local lRet as logical

	conout("FTOPE:Iniciar processo de conexão. Empresa: "+cEmp+" Filial: "+cFil)

	if (lRet:= RpcSetEnv(cEmp,cFil,,,"SFC","MATA410"))
		conout("FTOPE:Executnado EM JOB. ")
	else
		conout("FTOPE:Erro ao tentar conectar no ambinete pela função rpcsetenv(). ")
	endIf

return lRet

/*/{Protheus.doc} fGrvLog
Realiza gravação de log de processamento
@type function
@version  1.0
@author marcio.katsumata
@since 19/07/2024
@param cMsg, character, mensagem
@param cOP, character, codigo da OP
@param lGrava, logical, realiza a gravação
@param nQtd, numeric, quantidade
@param cCodPall, character, codigo do pallet
@param cCodMq, character, codigo da maquina
@param cStatus, character, status do log
                           E = ERRO
						   F = FINALIZADO
						   R = REPROCESSAMENTO
						   P = PENDENTE
@param nEstorno, numeric, 0 = Não
                          1 = Sim
/*/
static function fGrvLog(cMsg, cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus,nEstorno)
	default cMsg    := ""
	default cOP     := ""
	default lGrava  := .F.
	default nEstorno := 0

	cMsg += "Servidor: \PackTrust\Consultas\PTOPs_SelOPs.sql"+CRLF
	cMsg += "Data: "+DtoC(Date())+" Hora: "+Time()+CRLF
	MemoWrite("\PackTrust\Logs\PtOP_"+DtoS(date())+"_"+StrTran(time(),":", "")+cOP, cMsg)

	if lGrava
		atualza1(cOP, cMsg,nQtd,cCodPall,cCodMq,cStatus,nEstorno)
	endIf

return

/*/{Protheus.doc} atualza1
Realiza a atualização/gravação da ZA1 , tabela de log 
do processamento
@type function
@version  1.0
@author marcio.katsumata
@since 19/07/2024
@param cOP, character, codigo da OP
@param cMsg, character, mensagem do log
@param nQtd, numeric, quantidade
@param cCodPall, character, codigo do pallet
@param cCodMq, character, codigo da maquina
@param cStatus, character, status do log
                           E = ERRO
						   F = FINALIZADO
						   R = REPROCESSAMENTO
						   P = PENDENTE
@param nEstorno, numeric, 0 = Não
                          1 = Sim
/*/
static Function atualza1(cOP, cMsg,nQtd,cCodPall,cCodMq,cStatus,nEstorno)
	Local aZA1   as array
	Local lRet   as logical
	Local lExist as logical

	aZA1 := ZA1->(getArea())
	lRet := .F.
	lExist := .F.

	cOp := Substr(cOp,1,20)
	cCodPall := Substr(cCodPall,1,20)
	cCodMq := Substr(cCodMq,1,4)


	Begin Transaction

		If !Empty(cFil+cOP+cCodPall+cCodMq)
			DBSelectArea("ZA1")
			ZA1->(DBSetOrder(2))

			If len(cOp) <> 20 .or. len(cCodPall) <> 20 .or. len(cCodMq) <> 4
				conout("FTOPE:ERRO NO TAMANHO DA VARIAVEL cOp, VALOR ESPERADO 20, VALOR RECEBIDO "+STR(LEN(cOp)) + ' COP='+cOp)
				conout("FTOPE:ERRO NO TAMANHO DA VARIAVEL cCodPall, VALOR ESPERADO 20, VALOR RECEBIDO "+STR(LEN(cCodPall))+ ' CODPALLET='+cOp)
				conout("FTOPE:ERRO NO TAMANHO DA VARIAVEL cCodMq, VALOR ESPERADO 4, VALOR RECEBIDO "+STR(LEN(cCodMq))+ ' MAQUINA='+cOp)
				SLEEP(8000)
			endIf
			lExist := ZA1->(dBseek(cFil+cOP+cCodPall+cCodMq+alltrim(str(nEstorno))))
		else
			Return lRet
		endIf

		If !lExist
			RecLock('ZA1',.t.)
			ZA1->ZA1_FILIAL  := cFil
			ZA1->ZA1_NRORPO  := cOp         // Tamanho 20
			ZA1->ZA1_PALLET  := cCodPall    // Tamanho 20
			ZA1->ZA1_CDMQ    := cCodMq      // Tamanho 4
			ZA1->ZA1_ESTORN  := nEstorno
		else
			RecLock('ZA1',.f.)
		endIf
		ZA1->ZA1_QTD     := nQtd
		ZA1->ZA1_DESC    := alltrim(cMsg)
		ZA1->ZA1_STATUS  := cStatus
		ZA1->ZA1_LOG     := cMsg
		ZA1->ZA1_DATA    := date()
		ZA1->ZA1_HORA    := time()
		MsUnlock()

	End Transaction

	RestArea(aZA1)
	aSize(aZA1,0)
Return lRet

/*/{Protheus.doc} fSelOPs
Realiza a seleção dos registros a serem apontados
ou estornados qo PackTrust.
@type function
@version  1.0
@author marcio.katsumata
@since 19/07/2024
/*/
static function fSelOPs()
	local lRet as logical
	lRet := .F.
    /*/
	/Logica
	Pegar todos ordens de producao que tbm esteja no packtrust
	verificar se a chave do packtrust nao esteja no apontamento
	e validar se a quantidade total de apontamento do packtrust nao ultrapassa a op
    /*/

	beginSql alias cAliasTmp
		SELECT ORD_PROD, OP_PT, OPERACAO, SPLIT, ITEM,
				DESC_ITEM, TP_PROD_OP,MAQUINA, QTD_ORD,
				MAIOR_SPLIT, QTDE_APONTADA, HREMBINICIO,ESTORNADO FROM (
				//---------------
                //Apontamentos
				//---------------			
				SELECT CYQ_NRORPO ORD_PROD, PT_APONTAMENTOS.OP OP_PT, '0000000001' OPERACAO, APONTADOS.SPLIT SPLIT, CYQ_CDAC ITEM,
						SB1.B1_DESC DESC_ITEM, SB1.B1_TIPO TP_PROD_OP,PT_APONTAMENTOS.LINHAPROD MAQUINA, CYQ_QTOR QTD_ORD,
						APONTADOS.SPLIT MAIOR_SPLIT, APONTADOS.CYV_QTATRP QTDE_APONTADA, PT_APONTAMENTOS.HREMBINICIO, TO_NUMBER(PT_APONTAMENTOS.ESTORNADO) ESTORNADO,CODPALLET
				FROM %table:CYQ% CYQ 
				INNER JOIN (
							SELECT OP, LINHAPROD, SUM(QTDCAIXA) PT_QTDAPONT, HREMBINICIO, ESTORNADO,CODPALLET
							FROM MOCPP0001@SIGOFC 
							WHERE   TRIM(SUBSTR(DTEMBINICIO,7,4)||SUBSTR(DTEMBINICIO,4,2)||SUBSTR(DTEMBINICIO,1,2)) >= %exp:dtos(dDataBase)% AND
				    		        EXISTS ( 
				    			  				  SELECT 1
				    			  				  FROM %table:CYV%  CYV 
				    			  				  WHERE CYV_FILIAL  = %exp:xFilial("CYV")% AND 
				    			  				        TRIM(CYV_XPTCHV) = TRIM(CODPALLET) AND
														ROWNUM = 1                         AND
														CYV.%notDel%
				    			  				  ) AND 
								    TO_NUMBER(ESTORNADO) = 1 
							GROUP BY OP, LINHAPROD, HREMBINICIO, ESTORNADO, CODPALLET
							) PT_APONTAMENTOS ON (OP = RTRIM(CYQ_FILIAL)||RTRIM(CYQ_NRORPO))
				LEFT JOIN (
				   			SELECT CYV_FILIAL, CYV_NRORPO, MAX(CYV_IDATQO) SPLIT, SUM(CYV_QTATRP) CYV_QTATRP,CYV_CDMQ 
				   			FROM %table:CYV% CYV
				   			WHERE CYV_FILIAL  = %exp:xFilial("CYV")% AND
							      CYV.%notDel%
							GROUP BY CYV_FILIAL, CYV_NRORPO, CYV_CDMQ
							) APONTADOS ON (APONTADOS.CYV_FILIAL = CYQ_FILIAL AND
				 							APONTADOS.CYV_NRORPO = CYQ_NRORPO AND
											LTRIM(RTRIM(APONTADOS.CYV_CDMQ)) = LTRIM(RTRIM(PT_APONTAMENTOS.LINHAPROD)))
				INNER JOIN %table:SB1% SB1 ON  (SB1.B1_COD = CYQ_CDAC AND
					                            SB1.%notDel%)
				WHERE CYQ_FILIAL  = %exp:xFilial("CYQ")% AND
				       CYQ.%notDel%

				ORDER BY HREMBINICIO ) 
		WHERE
		    CODPALLET NOT IN (SELECT TRIM(ZA1_PALLET)
			FROM ZA1010 ZA1     
			WHERE ZA1.D_E_L_E_T_ = ' ' 
			AND ZA1.ZA1_STATUS <> 'R' 
			AND ZA1_PALLET <> ' ' 
			AND ZA1_ESTORN = ESTORNADO
			GROUP BY ZA1_PALLET )
			
		GROUP BY ORD_PROD, OP_PT, OPERACAO, SPLIT, ITEM,
				 DESC_ITEM, TP_PROD_OP,MAQUINA, QTD_ORD,
				 MAIOR_SPLIT, QTDE_APONTADA, HREMBINICIO,ESTORNADO

	endSql

	If lJob
		MemoWrite("\ftop\ptops_selops.sql", getLastQuery()[2]) //LOCAL
	else
		MemoWrite("c:\temp\PTOPs_SelOPs.sql",  getLastQuery()[2]) //LOCAL
	endIf


	If !(cAliasTmp)->(EOF())
		conout("FTOPE 001:scritp da qry Executou com sucesso. "+cQry)
		lRet := .T.
	else
		conout("FTOPE 001:scritp da qry Não RETORNOU dados. "+cQry)
	endIf

Return lRet


/*/{Protheus.doc} getCyv
Retorna o conteúdo do campo Seq. Reporte (CYV_NRSQRP)
@type function
@version  1.0
@author marcio.katsumata
@since 31/03/2024
@return character, Seq. Reporte 
/*/
static function getCyv()
	Local cOP       as character
	Local cMaquina  as character
	Local cChvPT    as character
	local cAliasCyv as character
	local cNrsqrp   as character

	cAliasCyv := getNextAlias()
	cOP       := (cAliasTmp)->ORD_PROD
	cMaquina  := (cAliasApon)->LINHAPROD
	cChvPT    := padr((cAliasApon)->CODPALLET, TamSX3("CYV_XPTCHV")[1])


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
	endIf
	(cAliasCyv)->(dbCloseArea())

return cNrsqrp
