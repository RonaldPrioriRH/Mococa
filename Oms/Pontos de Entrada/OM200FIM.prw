#Include "topconn.ch"
#Include 'Protheus.ch'

/*/{Protheus.doc} OM200FIM

Ponto de entrada no final da montagem da carga.

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function OM200FIM()
	Local lRet := .t.
	Default lRoboCarga := .f.
	If c_x_Carga <> ' '
		DbSelectArea("DAK")
		RecLock("DAK",.F.)
		
		DAK->DAK_XTIPO := 'E'
		
		DAK->DAK_XCARGA := c_x_Carga
		 
		MsUnLock()
	EndIf

	If !lRoboCarga
		//  LIBERA ESTOQUE 
		If cFilAnt == '0104'
			lRet := u_LEstCar(dak->dak_cod)
		Endif
		//tratamentos Faturamento Triangular. Pergunta
		U_ROMSE010()
	Endif
Return lRet


User Function LEstCar(cCodCar)
Local cQry 			:= ''
Local aPedCar 		:= {}
Local nx
Local lUseOffBal	:= FindFunction("RskIsActive") .And. RskIsActive()
Local lHelp			:= .T.
Local lMTA456I		:= ExistBlock("MTA456I")
Local lRet			:= .f.
Local cLogErro		:= ''
Local cPedErro      := '' // Contem pedidos que geraram algum erro na geração das notas (qdo lrobocarga=.t.)
Local cQuebra       := chr(13)+chr(10)
Local lTodPedFat 	:= .t.     // Indica se todos os pedidos do array aPedCar foram faturados
Default lRoboCarga	:= .f.

If cFilAnt <> '0104'
	MsgINFO('Somente para filial 0104','ATENÇÃO')
	Return
Endif

cQry := "SELECT C9_FILIAL, C9_PEDIDO FROM "+RetSqlName('SC9')+" "
cQry += "WHERE C9_FILIAL = '"+cFilAnt+"' "
cQry += "AND C9_CARGA = '"+cCodCar+"' "
cQry += "AND D_E_L_E_T_ = ' ' "
cQry += "GROUP BY C9_FILIAL, C9_PEDIDO "
ChangeQuery(cQry)

TcQuery cQry New Alias "TSC9"

Do While !tsc9->(Eof())
	aadd(aPedCar,tsc9->c9_pedido)
	tsc9->(dBskip())
Enddo

tsc9->(dBcloseArea())
For nx := 1 to len(aPedCar)
	SC5->(DbSetOrder(1))
	SC5->(DbSeek(xFilial("SC5") + aPedCar[nX]) )
	cNumPV := sc5->c5_num

    ConOut("Analisando liberacao do pedido de venda")
	aPvlNfs := {}
	aBloqueio := {}
    Ma410LbNfs( 2, @aPvlNfs, @aBloqueio ) 
    Ma410LbNfs( 1, @aPvlNfs, @aBloqueio )
    aAreaSC9       := sc9->(GetArea())
    If !Empty(aBloqueio)
        ConOut("O pedido contem "+CValToChar(Len(aBloqueio))+" itens bloqueados.")

        // Força Liberação de estoque
        dbSelectArea("SC9")
        dbSetOrder(1)
        cFilSC9	:= xFilial("SC9")
        lQuery := .T.
        bValid := {|| .T.}

        cAliasSC9 := "A450LIBMAN"
        cQuery := "SELECT C9_FILIAL,C9_PEDIDO,C9_BLCRED,R_E_C_N_O_ SC9RECNO "+cQuebra
        cQuery += "FROM "+RetSqlName("SC9")+" SC9 "+cQuebra
        cQuery += "WHERE SC9.C9_FILIAL = '"+cFilSC9+"' AND "+cQuebra
        cQuery += "SC9.C9_PEDIDO = '"+cNumPV+"' AND "+cQuebra
        cQuery += "(SC9.C9_BLEST <> '  ' OR "
        cQuery += "SC9.C9_BLCRED <> '  ' ) AND "+cQuebra
        cQuery += "SC9.C9_BLCRED NOT IN('10','09') AND "+cQuebra
        cQuery += "SC9.C9_BLEST <> '10' AND "+cQuebra
        cQuery += "SC9.C9_DATALIB <= '"+DTOS(date()+10)+"' AND "+cQuebra
        cQuery += "SC9.D_E_L_E_T_ = ' ' "+cQuebra

        cQuery := ChangeQuery(cQuery)

        dbUseArea(.T.,"TOPCONN",TcGenQry(,,cQuery),cAliasSC9,.T.,.T.)
        If (cAliasSC9)->(Eof())
            lRefresh := .F.
        EndIf

        //nTotRec := SC9->(LastRec())

		Do	While (cAliasSC9)->(! Eof()) .And. (cAliasSC9)->C9_FILIAL == cFilSC9 .And. (cAliasSC9)->C9_PEDIDO == cNumPV .And. (cAliasSC9)->(Eval(bValid))
            If lQuery
                SC9->(MsGoto((cAliasSC9)->SC9RECNO))
            Else
                (cAliasSC9)->(dbSkip())
                nRecSc9 := (cAliasSC9)->(Recno())
                (cAliasSC9)->(dbSkip(-1))
            Endif

            If !( (Empty(SC9->C9_BLCRED)  .And. Empty(SC9->C9_BLEST))  .Or.;
                    (SC9->C9_BLCRED=="10" .And. SC9->C9_BLEST=="10") .Or.;
                    SC9->C9_BLCRED=="09" .Or. ;
                    ( lUseOffBal .And. ( SC9->C9_BLCRED $ "80|90|91|92" ) ) )
                    a450Grava(1,.T.,.T.,@lHelp)
            EndIf

            IF lMTA456I
                ExecBlock("MTA456I",.f.,.f.)
            EndIf

            If lQuery
                dbSelectArea(cAliasSC9)
                dbSkip()
            Else
                (cAliasSC9)->(MsGoto(nRecSc9))
            Endif
		EndDo
		(cAliasSC9)->(dBcloseArea())
    EndIf
    Ma410LbNfs( 2, @aPvlNfs, @aBloqueio ) 
    Ma410LbNfs( 1, @aPvlNfs, @aBloqueio )
	If empty(aBloqueio)
		lRet := .t.
	Else
		If !FWIsInCallStack("U_ROBOCARGA")
			MsgInfo('Não foi possivel liberaro o estoque','Atenção')
		Else
			cLogRobCa += 'Não foi possivel liberaro o estoque do pedido '+cNumPV+cQuebra
		Endif
		lTodPedFat := lret := .f.
	Endif
	sc5->(DBSeek(cFilAnt+cNumPV))
	sc9->(RestArea(aAreaSC9))
	If lRet 
		If empty(aPvlNfs)
			ConOut("Aparentemente foi zerado no momento da liberação, ignora a etapa para que retorno no proximo processamento da FILA")
			return .f.
		Endif
		ConOut("***** Faturando pedido de venda: "+cNumPV+" *****")
		cDocInt := MaPvlNfs(/*aPvlNfs*/     aPvlNfs,;       // 01 - Array com os itens a serem gerados
							/*cSerieNFS*/     '001',;       // 02 - Serie da Nota Fiscal
							/*lMostraCtb*/      .F.,;       // 03 - Mostra Lançamento Contábil
							/*lAglutCtb*/       .F.,;       // 04 - Aglutina Lançamento Contábil
							/*lCtbOnLine*/      .F.,;       // 05 - Contabiliza On-Line
							/*lCtbCusto*/       .F.,;       // 06 - Contabiliza Custo On-Line
							/*lReajuste*/       .F.,;       // 07 - Reajuste de preço na Nota Fiscal
							/*nCalAcrs*/        0,;         // 08 - Tipo de Acréscimo Financeiro
							/*nArredPrcLis*/    0,;         // 09 - Tipo de Arredondamento
							/*lAtuSA7*/         .T.,;       // 10 - Atualiza Amarração Cliente x Produto
							/*lECF*/            .F.,;       // 11 - Cupom Fiscal
							/*cEmbExp*/         "",;        // 12 - Número do Embarque de Exportação
							/*bAtuFin*/         {||},;      // 13 - Bloco de Código para complemento de atualização dos títulos financeiros
							/*bAtuPGerNF*/      {||},;      // 14 - Bloco de Código para complemento de atualização dos dados após a geração da Nota Fiscal
							/*bAtuPvl*/         {||},;      // 15 - Bloco de Código de atualização do Pedido de Venda antes da geração da Nota Fiscal
							/*bFatSE1*/         {|| .T. },; // 16 - Bloco de Código para indicar se o valor do Titulo a Receber será gravado no campo F2_VALFAT quando o parâmetro MV_TMSMFAT estiver com o valor igual a "2".
							/*dDataMoe*/        dDatabase,; // 17 - Data da cotação para conversão dos valores da Moeda do Pedido de Venda para a Moeda Forte
							/*lJunta*/          .F.)        // 18 - Aglutina Pedido Iguais

		If Empty(cDocInt)    
			lTodPedFat := lRet := .F.

			ConOut("-cFilAnt: " +cFilAnt    )
			ConOut("-FilVend: " +cFilEnt   )
			ConOut("-cNumPV: "  +cNumPV     )

			cLogErro += "Erro no faturamento do pedido: "+cNumPV

			ConOut(cLogErro)
			cPedErro += cNumPv+', '

		Else
			cLogErro += "Pedido de venda: "+cNumPV+" gerou a nota: "+cDocInt
			ConOut(cLogErro)
			lRet := .T.
		EndIf
	Endif 
Next
If lRoboCarga
	//u_grvlogza5(cza5->za5_carlog,cCodCar,cLogRobCa,if(lTodPedFat,'4','3'),cza5->za5_filial)
Endif
If lRet .and. !FWIsInCallStack("U_ROBOCARGA")
	MsgInfo('Carga faturada com sucesso, por favor emitir o danfe','ATENÇÃO')
Endif

Return lRet


Static Function VldBlqEst(aPedVen, cFilPv) //CLASS FatTriang
	//-------------------------------------------------------------
	// Valida se consegui liberar os estoques.
	//-------------------------------------------------------------
	Local lRet := .T.
	Local nX
	Local cQry  := ""

	cQry := " SELECT C9_PEDIDO "
	cQry += " FROM " + RetSqlName("SC9") + " SC9 "
	cQry += " WHERE SC9.D_E_L_E_T_ <> '*' "
	//cQry += "   AND C9_FILIAL = "+xFilial("SC9",cFilPv)+""
	cQry += "  AND C9_FILIAL = '" + xFilial("SC9",cFilPV)+ "'" 
	
	cQry += "   AND C9_PEDIDO IN ("
	for nX := 1 to len(aPedVen)
		if nX > 1
			cQry += ","
		endif
		cQry += "'"+aPedVen[nX]+"'"
	next nX
	cQry += " 	) "
	cQry += "   AND C9_BLEST <> '  '" //com bloqueio de estoque

	If Select("QAUX") > 0
		QAUX->(dbCloseArea())
	EndIf

	cQry := ChangeQuery(cQry)
	dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUX", .F., .T.)

	If QAUX->(!Eof()) .AND. !empty(QAUX->C9_PEDIDO)
		lRet := .F.
	endif

	QAUX->(dbCloseArea())

Return lRet

//-------------------------------------------------------------
// Liberação de estoque automatica (chama rotina da MATA455)
// Emulo mesmo nome de função pq fonte padrao olha IsInCallStack("MATA455")
//-------------------------------------------------------------
Static Function MATA455

	Local aArea := GetArea()
	Local cPerg    := "LIBAT2"
	Local cRotina 	:= FunName()

	SetFunName("MATA455")

	Pergunte( cPerg, .F. )
	MV_PAR01 := SC5->C5_NUM
	MV_PAR02 := SC5->C5_NUM
	MV_PAR03 := SC5->C5_CLIENTE
	MV_PAR04 := SC5->C5_CLIENTE
	MV_PAR05 := SC5->C5_EMISSAO
	MV_PAR06 := SC5->C5_EMISSAO + 365
	MV_PAR07 := 1

	DbSelectArea("SC9")
	Ma450Processa("SC9",.F., .T., .F., Nil, MV_PAR07==2)

	SetFunName(cRotina)
	RestArea(aArea)

Return
