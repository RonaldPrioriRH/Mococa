#INCLUDE "topconn.ch"
#INCLUDE "protheus.ch"
 // https://tdn.totvs.com/pages/releaseview.action?pageId=514431886
 // ExecAuto rotina automatica de liquidação a pagar (FINA565)

User Function liquidapg(lAutoLiqd)
	Local cQry     	:= ''
	Local nQtd		:= 0
	Local cBkpFil   := cFilAnt
	Local cEof      := chr(13) + chr(10)
	Local dVencTo   := dtos(dDatabase)
	Private cCodNat
	
	cFilAnt := cDaFil
	cQry += "SELECT DISTINCT * "+cEof
	cQry += "FROM( "+cEof
	cQry += "    SELECT "
	cQry += "        F2_FILIAL, "
	cQry += "        TITULO, "
	cQry += "        PREFIXO, "
	cQry += "        TIPO, "
	cQry += "        FORNECEDOR, "
	cQry += "        LOJA, "
	cQry += "        NATUREZA, "
	cQry += "        E2_NATUREZ, "
	cQry += "        VENCREA, "
	cQry += "        E2_EMISSAO, "
	cQry += "        SALDO_PG "+cEof
	cQry += "    FROM ACOMPANHAMENTO_CTE "+cEof
	cQry += "    INNER JOIN ( "+cEof
	cQry += "        SELECT E2_FILIAL, E2_NUM, E2_PREFIXO, E2_TIPO, E2_FORNECE, E2_LOJA, E2_NATUREZ, "+cEof
	cQry += "               E2_VENCREA VENCREA,  E2_EMISSAO E2_EMISSAO, SUM(E2_SALDO) SALDO_PG "+cEof
	cQry += "        FROM SE2010 E2 "+cEof
	cQry += "        WHERE E2.D_E_L_E_T_ = ' ' "+cEof 
	cQry += "        AND E2_SALDO > 0 "+cEof
	cQry += "        AND E2_ORIGEM <> 'FINA565' "+cEof
	cQry += "		 AND E2_VENCREA <= '"+dVencTo+"' "+cEof
	cQry += "        GROUP BY E2_FILIAL, E2_NUM, E2_PREFIXO, E2_TIPO, E2_FORNECE, E2_LOJA,"+cEof
	cQry += "                 E2_NATUREZ, E2_VENCREA, E2_EMISSAO "+cEof
	cQry += "    ) PAGAR "+cEof
	cQry += "    ON E2_PREFIXO = PREFIXO "
	cQry += "    AND E2_NUM  = TITULO "
	cQry += "    AND E2_FORNECE = FORNECEDOR "
	cQry += "    AND E2_LOJA = LOJA "
	cQry += "    AND E2_TIPO = TIPO "
	cQry += "    AND E2_NATUREZ = NATUREZA "
	cQry += "    WHERE DT_ENCERRA IS NOT NULL "+cEof
	cQry += "    UNION "+cEof
	cQry += "    SELECT "
	cQry += "        E2_FILIAL F2_FILIAL, "
	cQry += "        E2_NUM TITULO, "
	cQry += "        E2_PREFIXO PREFIXO, 
	cQry += "        E2_TIPO TIPO, "
	cQry += "        E2_FORNECE FORNECEDOR, "
	cQry += "        E2_LOJA LOJA, "
	cQry += "        '' NATUREZA, "
	cQry += "        E2_NATUREZ E2_NATUREZ, "
	cQry += "        E2_VENCREA VENCREA, "
	cQry += "        E2_EMISSAO E2_EMISSAO, "
	cQry += "        SUM(E2_SALDO) SALDO_PG "+cEof
	cQry += "    FROM SE2010 E2 "+cEof
	cQry += "    WHERE E2.D_E_L_E_T_ = ' ' "+cEof
	cQry += "    AND E2_SALDO > 0 "+cEof
	cQry += "    AND E2_NATUREZ = '0203001' "+cEof
	cQry += "    AND E2_VENCREA <= '"+dVencTo+"' "+cEof
	cQry += "    GROUP BY E2_FILIAL, E2_NUM, E2_PREFIXO, E2_TIPO, E2_FORNECE, E2_LOJA, "+cEof
	cQry += "             E2_NATUREZ, E2_VENCREA, E2_EMISSAO ) "+cEof
	cQry += "WHERE F2_FILIAL BETWEEN '"+cDaFil+"' AND '"+cAteFil+"' "+cEof
	cQry += "AND VENCREA <= '"+dVencTo+"' "+cEof
	cQry += "AND FORNECEDOR BETWEEN '"+cDoFor+"' AND '"+cAteFor+"' "+cEof
	cQry += "AND E2_EMISSAO BETWEEN '"+dtos(dDaEmis)+"' AND '"+dtos(dAteEmis)+"' "+cEof
	cQry += "AND E2_NATUREZ IN "+cNaturez+" "+cEof
	cQry += "ORDER BY FORNECEDOR, LOJA, E2_EMISSAO, TIPO, TITULO "+cEof
	
	/*	
	SELECT F2_FILIAL, TITULO, PREFIXO, TIPO, FORNECEDOR, LOJA, NATUREZA, EMISSAO, DT_ENCERRA "
	cQry += "FROM ACOMPANHAMENTO_CTE "
	cQry += "INNER JOIN ( "
	cQry += "	SELECT E2_FILIAL, E2_NUM, E2_PREFIXO, E2_TIPO, E2_FORNECE, E2_LOJA, E2_NATUREZ, SUM(E2_VALOR) E2_VALOR "
	cQry += "	FROM SE2010 E2 "
	cQry += "	WHERE E2.D_E_L_E_T_ = ' ' "
	cQry += "	AND E2_SALDO > 0 "
	cQry += "	AND E2_FILIAL = '"+cFilAnt+"' "
	cQry += "	AND E2_ORIGEM <> 'FINA565' "
	cQry += "	AND E2_VENCREA < '"+dtos(date())+"' "
	If !lAutoLiqd
		cQry += "	AND E2_FORNECE BETWEEN '"+cDoFor+"' AND '"+cAteFor+"' "
		cQry += "	AND E2_EMISSAO BETWEEN '"+dtos(dDaEmis)+"' AND '"+dtos(dAteEmis)+"' "
		cQry += "	AND E2_NATUREZ BETWEEN '"+cDaNatu+"' AND '"+cAteNatu+"' "
	Endif
	cQry += "	GROUP BY E2_FILIAL, E2_NUM, E2_PREFIXO, E2_TIPO, E2_FORNECE, E2_LOJA, E2_NATUREZ "
	cQry += ") ON E2_PREFIXO = PREFIXO AND E2_NUM  = TITULO AND E2_FORNECE = FORNECEDOR AND E2_LOJA = LOJA AND E2_TIPO = TIPO "
	cQry += "AND E2_NATUREZ = NATUREZA "
	cQry += "WHERE FORNECEDOR BETWEEN '"+cDoFor+"' AND '"+cAteFor+"' "
	cQry += "AND NATUREZA BETWEEN '"+cDaNatu+"' AND '"+cAteNatu+"' "
	cQry += "AND EMISSAO BETWEEN '"+dtoc(dDaEmis)+"' AND '"+dtoc(dAteEmis)+"' "
	cQry += "ORDER BY FORNECEDOR, LOJA, EMISSAO, TIPO, TITULO "
	*/

	If Select("CSE2")
		csm0->(dBcloseArea())
	Endif
	TcQuery cQry New Alias "CSE2"

	Do While !cse2->(eof())
		nQtd++
		cDataIni := stod(cse2->e2_emissao)
		cCodFor  := cse2->fornecedor
		cCodLoja := cse2->loja
		cCodNat  := cse2->e2_naturez
		cDataFim := stod(cse2->e2_emissao)
		cDoTit   := cse2->titulo
		cAteTit  := cse2->titulo
		cDoPrf   := cse2->prefixo
		cAtePrf  := cse2->prefixo
		Do While cse2->(fornecedor+loja+e2_naturez) == cCodFor+cCodLoja+cCodNat
			cDataFim := stod(cse2->e2_emissao)
			cAteTit   := cse2->titulo
			cAtePrf  := cse2->prefixo
			cse2->(dBskip())
		Enddo

		FWMsgRun(, {|oSay| liquidae2(cDataIni,cDataFim,cCodFor,cCodLoja,cCodNat,cDoTit,cAteTit,cDoPrf,cAtePrf) }, "Liquidando cte´s "+cCodFor, "AGUARDE ..." )

		If nQtd >3
			Exit
		Endif
	Enddo
	cFilAnt   := cBkpFil

Return

Static Function liquidae2(cDataIni,cDataFim,cCodFor,cCodLoja,cCodNat,cDoTit,cAteTit,cDoPrf,cAtePrf)
    Local aTela1 := {}
    Local aTela2 := {}
    Local aEdtVlr := {}
    Local aCols := {}
    Local aItens := {}
    Local cPrefixo := 'LIQ'
    Local cFornec  := cCodFor
    Local cLoja    := cCodLoja
    Local nRotina  := 2 // Liquidar
    // Variáveis utilizadas para o controle de erro da rotina automática
    Private lMsErroAuto := .F.
    Private lAutoErrNoFile := .T.

	// Define Parâmetros da Rotina
	Pergunte('FIN565',.F.)

	// Array de desvio de tela - Caso não seja passado nenhum dos parametros
	// a liquidação ira considerar o título posicionado
	aAdd(aTela1, {'cFornDe', cCodFor}) 			//- Fornecedor De:
	aAdd(aTela1, {'cLojaDe', cCodLoja }) 		//- Loja De:
	aAdd(aTela1, {'cFornAte', cCodFor}) 		//- Fornecedor Até:
	aAdd(aTela1, {'cLojaAte', cCodLoja }) 		//- Loja Até:
	aAdd(aTela1, {'cForn565', cCodFor}) 		//- Gerar p/:
	aAdd(aTela1, {'cLoja', cCodLoja}) 			//- Loja:
	aAdd(aTela1, {'nValorMax', 0.00}) 			//- Valor:
	aAdd(aTela1, {'nValorDe', 0.00}) 			//- Titulos no valor De:
	aAdd(aTela1, {'nValorAte', 999999999999}) 	//- Até o Valor De:
	aAdd(aTela1, {'cMoeda565', '1'}) 			//- Moeda:
	aAdd(aTela1, {'cOutrMoed', '2'}) 			//- Outras moedas: (Não controla)
	aAdd(aTela1, {'cIntervalo', '1'}) 			//- Intervalo por:
	aAdd(aTela1, {'dData565I', cDataIni}) 		//- Data De:
	aAdd(aTela1, {'dData565F', cDataFim}) 		//- Data Até:
	aAdd(aTela1, {'cPrefDe', cDoPrf}) 			//- Prefx De:
	aAdd(aTela1, {'cPrefAte', cAtePrf}) 		//- Prefx Até:
	aAdd(aTela1, {'cNumDe', cDoTit}) 			//- Titulo De:
	aAdd(aTela1, {'cNumAte',cAteTit}) 			//- Titulo Até:

	//aHeader - Cabeçalho
	aAdd(aTela2, {'cLoja', cLoja }) 			//- Loja
	aAdd(aTela2, {'cCondicao', 'V01' }) 		//- Condicao (opcional)
	aAdd(aTela2, {'cTipo', 'FT ' }) 			//- Tipo
	aAdd(aTela2, {'cNatureza', cCodNat }) 		//- Natureza
	aAdd(aTela2, {'NTXLIQ', 4}) 				//- TX Moeda (opcional)
	aAdd(aTela2, {'cFornece', cFornec }) 		//- Fornecedor

	// Itens/aCols
	//Utilizando condição de pagamento torna-se obrigatório apenas esses campos
	cNumChq := numchq()
	aItens := {}
	AADD(aItens, {'E2_PREFIXO', cPrefixo}) 		//- Prefixo
	AADD(aItens, {'E2_BCOCHQ' , 'XXX'}) 		//- Banco
	AADD(aItens, {'E2_AGECHQ' , 'XXXXX'}) 		//- Agencia
	AADD(aItens, {'E2_CTACHQ' , 'XXXXXXXXXX'}) 	//- Conta
	AADD(aItens, {'E2_NUM' , cNumChq}) 			//- Num Cheque
	AADD(aCols, ACLONE(aItens))

	//Array que controla edição dos títulos a serem liquidados.
	aEdtVlr := {}
	AAdd( aEdtVlr, {'Editar', .T. } ) //- Se necessario Editar Valores
	aAdd( aEdtVlr, { {'chave','E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA'},;
		{'nCotMoed', 3},;
		{'nValJur', 0},;
		{'nValDes', 0},;
		{'nValLiq', 6005} } )

	MSEXECAUTO( { |a, b, c, d, e, f, g| FINA565( a, b, c, d, e, f, g )}, nRotina, aTela1, Nil, aTela2, aCols, aEdtVlr, .T. )

	If lMsErroAuto
		MostraErro()
	Else
		Conout("Liquidação gerada com sucesso!")
	EndIf

	//Processa({|| IntegZkd()}, If(!lJob,"Processando...",""))
	conout("REFAZKD: FINALIZANDO PROCESSOS.")

Return

Static Function numchq()
	Local cQry     := ''
	Local cNumChq  := '000000001'

	cQry += "SELECT E2_FILIAL, MAX(E2_NUM) E2_NUM "
	cQry += "FROM SE2010 E2 "
	cQry += "WHERE E2.D_E_L_E_T_ =  ' ' "
	cQry += "AND E2_PREFIXO = 'LIQ' "
	cQry += "AND E2_ORIGEM = 'FINA565' "
	cQry += "GROUP BY E2_FILIAL "

	If Select("CNUMCH")
		cnumch->(dBcloseArea())
	Endif
	TcQuery cQry New Alias "CNUMCH"

	If !cNumCh->(eof())
		cNumChq := soma1(cNumCh->e2_num)
	Endif
Return cNumChq


