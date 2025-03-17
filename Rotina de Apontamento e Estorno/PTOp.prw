#Include "totvs.ch"

/*/{Protheus.doc} fPtOP
Programa de apontamento e estorno de produção
integrado com a view da plataforma PackTrust.
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
user function fPtOP(cEmpProc, cFilProc)


	Local lRet      as logical
	Local aCYV      as array
	Local aCZP      as array
	Local aCY0      as array
	Local aCYW      as array
	Local aCZ0      as array
	Local aCZW      as array
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
	aCYV      	   := {}
	aCZP      	   := {}
	aCY0      	   := {}
	aCYW      	   := {}
	aCZ0      	   := {}
	aCZW      	   := {}
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
		conout("FTOP 002: "+cMsg)
	endIf


	While !(cAliasTmp)->(EOF())

		cAliasApon := getNextAlias()

		conout("FTOP 003:Executando EM JOB na QRY.")

		beginSql alias cAliasApon

				SELECT  
				   	   CODIGOERP, LOTE, CODPALLET, QTDCAIXA,
				   	   TO_CHAR(TO_DATE(DTEMBINICIO,'DD/MM/YYYY'),'YYYYMMDD') INICIO_DT, to_char(HREMBINICIO) INICIO_HR,
				   	   TO_CHAR(TO_DATE(DTEMBFINAL,'DD/MM/YYYY'),'YYYYMMDD') FINAL_DT,  to_char(HREMBFINAL) FINAL_HR,
				   	   OP, LINHAPROD 
				FROM MOCPP0001@SIGOFC
				WHERE OP = %exp:ALLTRIM((cAliasTmp)->OP_PT)% AND
					  TRIM(SUBSTR(DTEMBINICIO,7,4)||SUBSTR(DTEMBINICIO,4,2)||SUBSTR(DTEMBINICIO,1,2)) >= %exp:dtos(dDataBase)% AND
				      NOT EXISTS (
								   SELECT 1
								   FROM %table:CYV% CYV 
								   WHERE CYV_FILIAL = %exp:xFilial("CYV")%  AND
								         TRIM(CYV_XPTCHV) = TRIM(CODPALLET) AND 
										 ROWNUM = 1                         AND
								         CYV.%notDel%
									) AND
						NOT EXISTS (SELECT 1
									FROM %table:ZA1% ZA1 
									WHERE ZA1.ZA1_FILIAL = %exp:xFilial("ZA1")% AND
									      ZA1.ZA1_STATUS <> 'R'                 AND
									      TRIM(ZA1_PALLET) = TRIM(CODPALLET)    AND
									      ZA1.ZA1_ESTORN = 0                    AND
									      ZA1.%notDel%
									) 
				ORDER BY HREMBINICIO 
		endSql

		if lJob
			MemoWrite("\ftop\ptops_pt.sql", getLastQuery()[2]) //LOCAL
		else
			MemoWrite("c:\temp\PTOPs_PT.sql", getLastQuery()[2]) //LOCAL
		endIf

		conout("FTOP 005:Executando EM JOB na QRY.")
		conout("FTOP 006:Executando Scrip PT ."+getLastQuery()[2])


		if (cAliasApon)->(Eof())
			cMsg := "Erro na consulta ou nao ha resultado para o apontamento para esta OP: "+ALLTRIM((cAliasTmp)->ORD_PROD)+"."+CRLF
			conout("FTOP 007: "+cMsg)
			(cAliasTmp)->(dbskip())
			loop
		endIf

		while !(cAliasApon)->(EOF())

			dDataBase := stod((cAliasApon)->INICIO_DT)
			aCYV := {}
			aCYP := {}
			aCYW := {}
			aCZ0 := {}
			aCZW := {}
			conout("FTOP 008:Navegando na PT")

			cSeq:=  getSxeNum("CYV", "CYV_NRSQRP" )//vRetSeq()

			conout("FTOP 009:Sequencia a ser usada: "+cSeq)

			//---------------------------------------------------------------
			//Realiza a validação da SC2 (ordem de produção) x View PackTrust
			//----------------------------------------------------------------
			if !validSC2(alltrim((cAliasApon)->OP), alltrim((cAliasApon)->LINHAPROD), @cMsgErro)
				cMsg := "Erro na validação da máquina: "+Alltrim((cAliasTmp)->ORD_PROD)+"."+CRLF
				cMsg += cMsgErro

				//(cMsg,cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
				fGrvLog(cMsg,(cAliasTmp)->ORD_PROD, .T.,(cAliasApon)->QTDCAIXA,(cAliasApon)->CODPALLET,(cAliasApon)->LINHAPROD,'E')

				(cAliasApon)->(DBSKIP())
				conout("FTOP: "+cMsg)
				conout("FTOP:loop por conta do Função validSC2().")
				RollBackSX8()
				LOOP
			endIf
			//----------------------------------------------------------
			//Realiza o resgate de dados para o apontamento de produção
			//----------------------------------------------------------
			if !fCYV(@aCYV)
				cMsg := "Erro na montagem do apontamento de proDucao (CYV) da OP: "+Alltrim((cAliasTmp)->ORD_PROD)+"."+CRLF
				cMsg += "Já encontrado um lançamento para essa mesma data e horario "+CRLF

				//(cMsg,cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
				fGrvLog(cMsg,(cAliasTmp)->ORD_PROD, .T.,(cAliasApon)->QTDCAIXA,(cAliasApon)->CODPALLET,(cAliasApon)->LINHAPROD,'E')

				(cAliasApon)->(DBSKIP())
				conout("FTOP: "+cMsg)
				conout("FTOP:loop por conta do Função fCYV().")
				RollBackSX8()
				LOOP
			endIf

			//-----------------------------------------------------------
			// Realiza o resgate de dados de Componentes para apontamento
			//------------------------------------------------------------
			if !fCZP(@aCZP, (cAliasTmp)->TP_PROD_OP)
				cMsg := "Erro na montagem do componente de prouducao (CZP) da OP: "+(cAliasTmp)->ORD_PROD+"."+CRLF
				//cMsg, cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
				fGrvLog(cMsg, (cAliasTmp)->ORD_PROD, .T.,(cAliasApon)->QTDCAIXA,(cAliasApon)->CODPALLET,(cAliasApon)->LINHAPROD,'E')
				(cAliasApon)->(DBSKIP())
				conout("FTOP: "+cMsg)
				conout("FTOP:loop por conta do Função fCZP().")
				RollBackSX8()
				LOOP
			endIf

			//------------------------------------------------------------
			// Realiza o resgate de dados de Mao de Obra para apontamento
			//------------------------------------------------------------
			if !fCYW(@aCYW)
				cMsg := "Erro na montagem da mao de obra da prouducao (CYW) da OP: "+(cAliasTmp)->ORD_PROD+"."+CRLF
				//(cMsg, cOP,lGrava,nQtd,cCodPall,cCodMq,cStatus)
				fGrvLog(cMsg, (cAliasTmp)->ORD_PROD, .T.,(cAliasApon)->QTDCAIXA,(cAliasApon)->CODPALLET,(cAliasApon)->LINHAPROD,'E')
				(cAliasApon)->(DBSKIP())
				conout("FTOP: "+cMsg)
				conout("FTOP:loop por conta do Função fCYW().")
				RollBackSX8()
				LOOP
			endIf

			//----------------------------------------------------
			// Realiza o resgate de dados de GGF para apontamento
			//----------------------------------------------------
			If !fCZW(@aCZW, (cAliasApon)->LINHAPROD)
				conout("FTOP:Aportado por erro da CZW.")
				RollBackSX8()
				return
			endIf

			//----------------------------------------------
			//Realiza o execauto de apontamento de produção
			//----------------------------------------------
			conout("FTOP:Iniciando execauto SFCA316.")
			oError    := ErrorBlock({|e| cError := e:Description +CRLF+ e:ErrorStack})

			BEGIN SEQUENCE
				lRet := SFCA316(,1,aCYV,aCZP,aCY0,aCYW,aCZ0,aCZW)
			END SEQUENCE

			ErrorBlock(oError)

			if lMsErroAuto .or. !empty(cError) .or. !lRet
				cMsg := "FTOP:Erro no ExecAuto."+CRLF

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

				If !lJob
					Help(" ", 1, "Erro",, cMsg ,1,0 )
				endIf

				fGrvLog(cMsg, (cAliasTmp)->ORD_PROD, .T.,(cAliasApon)->QTDCAIXA,(cAliasApon)->CODPALLET,(cAliasApon)->LINHAPROD,'E')

			else
				ConfirmSX8()
				conout("FTOP:ExecAuto executado com S U C E S S O.")
				cMsg := 'Atualizado com Sucesso'
				fGrvLog(cMsg, (cAliasTmp)->ORD_PROD, .T.,(cAliasApon)->QTDCAIXA,(cAliasApon)->CODPALLET,(cAliasApon)->LINHAPROD,'F')
			endIf

			(cAliasApon)->(DBSkip())
			exit
		end
		(cAliasApon)->(dbCloseArea())


		conout("FTOP:Concluiu QRY.")
		(cAliasTmp)->(dbSkip())
		exit
	end

	(cAliasTmp)->(dbCloseArea())
	conout("FTOP:Finalizando.")

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

	conout("FTOP:Iniciar processo de conexão. Empresa: "+cEmp+" Filial: "+cFil)

	if (lRet:= RpcSetEnv(cEmp,cFil,"","","SFC","MATA410"))
		conout("FTOP:Executnado EM JOB. ")
	else
		conout("FTOP:Erro ao tentar conectar no ambinete pela função rpcsetenv(). ")
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
				conout("FTOP:ERRO NO TAMANHO DA VARIAVEL cOp, VALOR ESPERADO 20, VALOR RECEBIDO "+STR(LEN(cOp)) + ' COP='+cOp)
				conout("FTOP:ERRO NO TAMANHO DA VARIAVEL cCodPall, VALOR ESPERADO 20, VALOR RECEBIDO "+STR(LEN(cCodPall))+ ' CODPALLET='+cOp)
				conout("FTOP:ERRO NO TAMANHO DA VARIAVEL cCodMq, VALOR ESPERADO 4, VALOR RECEBIDO "+STR(LEN(cCodMq))+ ' MAQUINA='+cOp)
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
						APONTADOS.SPLIT MAIOR_SPLIT, APONTADOS.CYV_QTATRP QTDE_APONTADA, PT_APONTAMENTOS.HREMBINICIO, TO_NUMBER(PT_APONTAMENTOS.ESTORNADO) ESTORNADO, CODPALLET
				FROM %table:CYQ% CYQ 
				INNER JOIN (
					SELECT OP, LINHAPROD, SUM(QTDCAIXA) PT_QTDAPONT, HREMBINICIO, ESTORNADO, CODPALLET 
					FROM MOCPP0001@SIGOFC 
					WHERE   TRIM(SUBSTR(DTEMBINICIO,7,4)||SUBSTR(DTEMBINICIO,4,2)||SUBSTR(DTEMBINICIO,1,2))  >= %exp:DTOS(DDATABASE)% AND
				            NOT EXISTS ( 
				    					SELECT 1 
				    					FROM %table:CYV% CYV 
				    					WHERE CYV_FILIAL  = %exp:xFilial("CYV")% AND
				    					      TRIM(CYV_XPTCHV) = TRIM(CODPALLET) AND
											  ROWNUM = 1                         AND
											  CYV.%notDel% 
				    					) AND
						    TO_NUMBER(ESTORNADO) = 0 
					GROUP BY OP, LINHAPROD, HREMBINICIO, ESTORNADO, CODPALLET
				 ) PT_APONTAMENTOS ON (OP = RTRIM(CYQ_FILIAL)||RTRIM(CYQ_NRORPO))
				LEFT JOIN 	(
							SELECT CYV_FILIAL, CYV_NRORPO, MAX(CYV_IDATQO) SPLIT, SUM(CYV_QTATRP) CYV_QTATRP,CYV_CDMQ 
							FROM CYV010 CYV
							WHERE CYV_FILIAL  = %exp:xFilial("CYV")% AND 
							      CYV.%notDel% 
							GROUP BY CYV_FILIAL, CYV_NRORPO, CYV_CDMQ
							) APONTADOS ON (APONTADOS.CYV_FILIAL = CYQ_FILIAL AND
				              APONTADOS.CYV_NRORPO = CYQ_NRORPO               AND
				              LTRIM(RTRIM(APONTADOS.CYV_CDMQ)) = LTRIM(RTRIM(PT_APONTAMENTOS.LINHAPROD)))
				INNER JOIN %table:SB1% SB1 ON (B1_COD = CYQ_CDAC AND
				                               SB1.%notDel% )
				WHERE CYQ_FILIAL  = %exp:xFilial("CYQ")% AND
				      CYQ.%notDel%) 
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
		conout("FTOP 001:scritp da qry Executou com sucesso. "+cQry)
		lRet := .T.
	else
		conout("FTOP 001:scritp da qry Não RETORNOU dados. "+cQry)
	endIf

Return lRet


/*/{Protheus.doc} fCYV
	Montagem das informações do apontamento de produção. 
	Tabela CYV
	
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
	Os campos relacionados à  preparação e medição são necessários se o apontamento precisar dessa informação. Caso contrário, não é preciso enviá-los.

	Verificar como pegar a maquina referente ao apontamento.

@type function
@version  1.0
@author marcio.katsumata
@since 19/07/2024
@param aCYV, array, array com os dados da tabela CYV
@return logical, ok?
/*/
Static Function fCYV(aCYV)
	local lRet      as logical
	local cOP       as character
	local cOperacao as character
	local cIdOpSfc  as character
	local cMaquina  as character
	local nQtdApon  as numeric
	local dDtIni    as date
	local dDtFim    as date
	local cHrIni    as character
	local cHrFim    as character
	local cChvPT    as character
	local cProdSC2  as character
	local cAliasCYV as character
	local cAliasCYY as character

	cAliasCYV := getNextAlias()
	cAliasCYY := getNextAlias()
	lRet      := .T.
	cOP       := (cAliasTmp)->ORD_PROD
	cOperacao := StrZero(1, 2) //TamSX3("CYV_CDAT")[1])
	cIdOpSfc  := StrZero(1, TamSX3("CYV_IDAT")[1])
	cMaquina  := (cAliasApon)->LINHAPROD
	nQtdApon  := (cAliasApon)->QTDCAIXA
	dDtIni    := StoD((cAliasApon)->INICIO_DT) //StoD(StrTran(SubStr((cAliasApon)->EMBINICIO,1,10),"-",""))
	dDtFim    := StoD((cAliasApon)->FINAL_DT )  //StoD(StrTran(SubStr((cAliasApon)->EMBFINAL,1,10),"-",""))
	cHrIni    := Alltrim((cAliasApon)->INICIO_HR) //"08:00:00" //SubStr((cAliasApon)->EMBINICIO,12,8)
	cHrFim    := Alltrim((cAliasApon)->FINAL_HR)  //"12:00:00" //SubStr((cAliasApon)->EMBFINAL,12,8)
	cChvPT    := padr((cAliasApon)->CODPALLET, TamSX3("CYV_XPTCHV")[1])
	CCYY      := ''
	CCYV      := ''
	cProdSC2  := ""

	//verificando se já existe esse pallet na cyv, se sim nao deixar criar um novo
	beginSql alias cAliasCYV
		SELECT COUNT(CYV_CDMQ) QTD,CYV_FILIAL, CYV_CDMQ, CYV_NRORPO, CYV_IDAT,
		       CYV_DTRPBG, CYV_HRRPBG , CYV_DTRPED, CYV_HRRPED, CYV_NRDO, CYV_XPTCHV 
		 FROM %table:CYV% CYV 
		 WHERE CYV.CYV_FILIAL  = %exp:xFilial("CYV")% AND                         
		       CYV_NRORPO = %exp:cOP%                 AND  
		       CYV_CDMQ = %exp:Alltrim(cMaquina)%     AND
		       CYV_XPTCHV = %exp:cChvPT%              AND
		  	   CYV.%notDel%
		 GROUP BY CYV_FILIAL, CYV_CDMQ, CYV_NRORPO, CYV_IDAT, 
		          CYV_DTRPBG, CYV_HRRPBG , CYV_DTRPED, CYV_HRRPED, 
				  CYV_NRDO, CYV_XPTCHV 
	endSql

	conout("FTOP - "+CCYV)

	IF (cAliasCYV)->QTD > 1
		lRet := .F.
	endIf

	(cAliasCYV)->(dbCloseArea())

	if lRet
		// verificar se na CYY existe via query - filtrar filial / nrorpo / cdmq
		// se nao existir criar cyy com os campos filial / nrorpo / CYY_IDAT  = operacao / CYY_IDATQO = maquina / CYY_CDMQ  = maquina

		//--------------------------------------
		//Verifica produto da ordem de produção
		//--------------------------------------
		cProdSC2 := checkPrdSC2((cAliasApon)->OP)

		CYB->(dbSetOrder(1))
		CYB->(dbSeek(xFilial("CYB")+AvKey(Alltrim(cMaquina), "CYB_CDMQ")))
		cCentroTrb := CYB->CYB_CDCETR

		beginSql alias cAliasCYY

			SELECT R_E_C_N_O_ AS REGISTRO, CYY.* 
			FROM %table:CYY% CYY 
			WHERE CYY.CYY_FILIAL  = %exp:xFilial("CYY")% AND
			      CYY_NRORPO = %exp:cOP%                 AND  
				  CYY_CDMQ = %exp:Alltrim(cMaquina)%     AND
				  CYY.%notDel%
		endSql



		conout("FTOP - "+CCYY)

		(cAliasCYY)->(DbGoTop())

		if (cAliasCYY)->(EoF())
			conout("Cria CYY")
			RecLock("CYY", .T.)
			CYY->CYY_FILIAL := xFilial("CYY")
			CYY->CYY_NRORPO := cOP
			CYY->CYY_IDAT   := StrZero(1, 10)
			CYY->CYY_IDATQO := StrZero(VAL(cMaquina),5)
			CYY->CYY_CDMQ   := cMaquina
			CYY->CYY_DTBGAT := StoD((cAliasApon)->INICIO_DT)
			CYY->CYY_HRBGAT := Alltrim((cAliasApon)->INICIO_HR)
			CYY->CYY_TPSTAT := '3'
			CYY->CYY_QTATAP := nQtdApon
			CYY->CYY_QTAT   := (cAliasTmp)->QTD_ORD
			CYY->CYY_QTATRP := nQtdApon
			CYY->CYY_DTEDAT := StoD((cAliasApon)->FINAL_DT)
			CYY->CYY_DTBGPL := StoD((cAliasApon)->FINAL_DT)
			CYY->CYY_DTEDPL := StoD((cAliasApon)->FINAL_DT)
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
			CYY->(dbGoTo((cAliasCYY)->REGISTRO))
			reclock("CYY", .F.)
			CYY->CYY_IDATQO := StrZero(VAL(cMaquina),5)
			if alltrim((cAliasCYY)->CYY_CDAC) <> alltrim(cProdSC2) .and. !empty(cProdSC2)
				CYY->CYY_CDAC := cProdSC2
			endIf
			CYY->(msUnlock())

			conout("nao entrou para criar a CYY")
		endIf

		(cAliasCYY)->(dbCloseArea())

		// Os itens abaixo tem que ser nesta ordem
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
	endIf

Return lRet

/*/{Protheus.doc} vRetSeq
Retorna sequência numérica da tabela CYV
@type function
@version  1.0
@author marcio.katsumata
@since 19/07/2024
@return numeric, sequência numérica da tabela CYV
/*/
Static Function vRetSeq()
	Local nSeq      as numeric
	local cAliasSeq as character

	cAliasSeq := getNextAlias()

	beginSql alias cAliasSeq
		SELECT LPAD((MAX(CYV_NRSQRP)+2),20,0) CYV_NRSQRP 
		FROM %table:CYV%
	endSql

	nSeq := (cAliasSeq)->CYV_NRSQRP

	(cAliasSeq)->(dbCloseArea())

Return  nSeq


/*/{Protheus.doc} fCZP
Montagm das informações das reservas usadas ( tabela CZP)
para utilização no execauto.
@type function
@version  1.0
@author marcio.katsumata
@since 7/19/2024
@param aCZP, array, informações da CZP
@param cTipo, character, tipo do produto
@return logical, informações da CZP ok?
/*/
Static Function fCZP(aCZP, cTipo)
	local lRet       as logical
	local cQry       as character
	local aItem      as array
	local cAliasQRes as character
	local cExpQtd    as character
	default cTipo := "PA"

	lRet       := .F.
	cQry       := ""
	aItem      := {}
	cExpQtd    := cValToChar((cAliasApon)->QTDCAIXA)
	cAliasQRes := getNextAlias()

	If cTipo == "PA"
		beginSql alias cAliasQRes
			SELECT  (CYP_QTMT / CYQ_QTOR) * %exp:cExpQtd% nProp, 
			         CYP_IDMTOR,CYP_CDACPI, CYP_CDDP ARMAZEM, 
					 CYP_QTMT QTD_RESERVA, CYP_QTRP QTD_ATENDIDA, 
					 CYP_CDUN UN, CYP_CDMT PROD, B1_DESC PROD_DESC
			FROM %table:CYP% CYP 
			INNER JOIN %table:CYQ% CYQ ON (CYQ_FILIAL = CYP_FILIAL AND
			                               CYQ_NRORPO = CYP_NRORPO AND
										   CYQ.%notDel%)
			INNER JOIN %table:SB1% SB1 ON (B1_COD = CYP_CDMT       AND
			                               SB1.%notDel%)
			WHERE CYP_FILIAL  = %exp:xFilial("CYP")%         AND
			      CYP_NRORPO  = %exp:(cAliasTmp)->ORD_PROD%  AND
				  CYP.%notDel%
		endSql
	else

		beginSql alias cAliasQRes
			SELECT *
        	FROM MOCPP0002@SIGOFC CONSUMO
		endSql

	endIf

	If !(cAliasQRes)->(EoF())
		While !(cAliasQRes)->(EoF())
			aItem := {}
			if cTipo == "PA"
				aadd(aItem,{"CZP_IDMTOR"  , (cAliasQRes)->CYP_IDMTOR, })
				aadd(aItem,{"CZP_CDACPI"  , (cAliasQRes)->CYP_CDACPI, })
			endIf
			aadd(aItem,{"CZP_CDMT"  , (cAliasQRes)->PROD, })
			aadd(aItem,{"CZP_QTRPPO", (cAliasQRes)->nProp,})

			aadd(aCZP, aItem)
			(cAliasQRes)->(dbSkip())
		End
		lRet := .T.
	else
		lRet := .F.
	endIf

	(cAliasQRes)->(dbCloseArea())
Return lRet


/*/{Protheus.doc} fCYW
Dados do apontamento de mão de obra 
@type function
@version  1.0
@author marcio.katsumata
@since 19/07/2024
@param aCYW, array, dados do apontamento de mão de obra
@return logical, retorno ok?
/*/
Static Function fCYW(aCYW)
	Local lRet      as logical
	Local cOper     as character
	Local dDtIni    as date
	Local dDtFim    as date
	Local cHrIni    as character
	Local cHrFim    as character
	Local aItem     as array

	lRet      := .T.
	cOper     := "0001"
	dDtIni    := StoD((cAliasApon)->INICIO_DT)  //StoD(StrTran(SubStr((cAliasApon)->EMBINICIO,1,10),"-",""))
	dDtFim    := StoD((cAliasApon)->FINAL_DT )  //StoD(StrTran(SubStr((cAliasApon)->EMBFINAL,1,10),"-",""))
	cHrIni    := Alltrim((cAliasApon)->INICIO_HR) //"08:00:00" //SubStr((cAliasApon)->EMBINICIO,12,8)
	cHrFim    := Alltrim((cAliasApon)->FINAL_HR)  //"12:00:00" //SubStr((cAliasApon)->EMBFINAL,12,8)
	aItem     := {}

	// Mao de Obra
	aadd(aItem,{"CYW_CDOE"  ,cOper ,})
	aadd(aItem,{"CYW_DTBGRP",dDtIni,})
	aadd(aItem,{"CYW_HRBGRP",cHrIni,})
	aadd(aItem,{"CYW_DTEDRP",dDtFim,})
	aadd(aItem,{"CYW_HREDRP",cHrFim,})
	AADD(aCYW, aItem)
Return lRet


/*/{Protheus.doc} fCZW
Apontamento de GGF
@type function
@version  1.0
@author marcio.katsumata
@since 19/07/2024
@param aCZW, array, dados de GGF
@param cMaq, character, código da máquina
@return logical, retorno ok?
/*/
Static Function fCZW(aCZW,cMaq)
	Local lRet := .t.
	Local aItem := {}
	local aAreaCYB := CYB->(getArea())
	local cCentroTrb := ""

	CYB->(dbSetOrder(1))
	CYB->(dbSeek(xFilial("CYB")+AvKey(cMaq, "CYB_CDMQ")))
	cCentroTrb := CYB->CYB_CDCETR

	aItem := {}
	aadd(aItem,{"CZW_CDCETR",cCentroTrb})
	aadd(aItem,{"CZW_HRTEGF",0.5,})


	AADD(aCZW,aItem)

	restArea(aAreaCYB)
	aSize(aAreaCYB,0)

Return lRet

/*/{Protheus.doc} fLogTela
Tela de log 
@type function
@version  1.0
@author marcio.katsumata
@since 19/07/2024
/*/
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

/*/{Protheus.doc} fDescLog
Tela de detalhes do log
@type function
@version  1.0
@author marcio.katsumata
@since 19/07/2024
@param cOP, character, código da OP
/*/
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
	endIf
Return

/*/{Protheus.doc} fCarrgaList
Função que carrega os campos
@type function
@version 1.0  
@author marcio.katsumata
@since 22/07/2024
@param aCampos, array, campos da tela
@param oLbx, object, objeto LIST BOX
/*/
Static Function fCarrgaList(aCampos, oLbx)
	Processa( {|| fCarregaCampos(aCampos) }, "Aguarde...", "Carregando definição dos campos...",.F.)
	oLbx:SetArray(aCampos)
	oLbx:bLine := {|| {aCampos[oLbx:nAt,1], aCampos[oLbx:nAt,2], aCampos[oLbx:nAt, 3]}}
	oLbx:Refresh()
Return

/*/{Protheus.doc} fCarregaCampos
Função que vai alimentar os campos
@type function
@version  1.0
@author marcio.katsumata
@since 22/07/2024
@param aCampos, array, campos da tela
/*/
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
	else
		Aadd(aCampos,{"", "", "", ""})
	endIf
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
		endIf

		(cAliasSC2)->(dbCloseArea())
	else
		cMsgErro := "OP não informada"
	endIf

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
		endIf

		(cAliasSC2)->(dbCloseArea())
	endIf

return cProduto
