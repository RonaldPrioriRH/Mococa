#include 'totvs.ch'
#INCLUDE "FWPrintSetup.ch"
#INCLUDE "rptdef.CH"
#Include "TopConn.ch"
#INCLUDE "APWIZARD.CH"
#INCLUDE "FILEIO.CH"
#INCLUDE "PARMTYPE.CH"

/*/{Protheus.doc} FatTriang
Classe responsável por fazer processamentos do processo de faturamento triangular.
@type class
@author Danilo Brito
@since 02/03/2017
@version P12
/*/
CLASS FatTriang

	DATA lShowMsg
	DATA cMsgErro
	DATA cFilVen	//Filial de Venda
	DATA cFilEst	//Filial de Estoque
	DATA cFilInt	//Filial Intermediaria
	DATA cTipo 		//Tipo Processamento: 1=Por Carga, 2=Por Pedido
	DATA cStatus
	DATA cIdTriang	//Id da Triangulação
	DATA aPvSolicit	//Array de numero de pedidos da Solicitação de Triangulação
	DATA aItSolicit	//Array de Itens da Solicitação de Triangulação
	DATA aRecPvFE 	//Recno do pedido de transferência na FE gerado pela solicitação
	DATA aNumPvFE   //Numero do pedido de transferência na FE gerado pela solicitação
	DATA aPvNfFE 	//Array de numero de pedidos da Nf Transferencia FE
	DATA aItNfFE 	//Array de Itens da Nf Transferencia FE
	DATA aPvNfFI 	//Array de numero de pedidos da Nf Transferencia FI
	DATA aItNfFI 	//Array de Itens da Nf Transferencia FI
	DATA aPvNfFV 	//Array de numero de pedidos da Nf Transferencia FV
	DATA aSF2_FE	//Notas fiscais de saida FE
	DATA aSF2_FI	//Notas fiscais de saida FI
	DATA aSF1_FI	//Notas fiscais de entrada FI
	DATA aSF1_FV	//Notas fiscais de entrada FV
	DATA aProcLog	//Processos a mostrar no grid de log processamento
	DATA cProcExec	//Proximo Processo a executar
	DATA aPVsCarga   //Pedidos de venda que compõe a carga
	DATA aSF2_FV    //Documentos de saída dos pedidos de venda que compõe a carga

	//----------------- Metodos MANIPULAÇAO OBJETO --------------------\\
	//Metodo construtor da classe
	METHOD New(lShowMsg) CONSTRUCTOR

	//Metodo Interno para mostrar erros de processamento
	METHOD ShowError(lInfo, lMostraErro)

	//Metodo para obter erros de processamento
	METHOD GetError()

	//Metodo destrutor da classe
	METHOD Destroy()

	//--------------metodo de geracao da carga---------------------\\
	METHOD GERARCARGA(cFilCar,cChvCar,cPedCar,dDatCar,cStatCar)

	//----------------- Metodos para SOLICITAÇÃO --------------------\\
	//Metodo para fazer a solicitação da triangulação
	METHOD AbreSolicitacao(cPedido, cCarga,cFilCarga) // esse abre o pedido na filial que tem o estoque para atender a solicitacao

	//Metodo para validar se pode continuar a solicitação de triangulação, para carga ou pedido
	METHOD VldSolicitacao(cPedido, cCarga)

	//Metodo para montar tela de solicitação da triangulação
	METHOD TelaSolicitacao()

	//Metodo para montar grid de itens da solicitação
	METHOD DoGridSol(oDlg, nTop, nLeft, nBottom, nRight)

	//Metodo para gravar solicitação da triangulação
	METHOD GravaSolicitacao()

	//Metodo para gravar um pedido de venda na Fil Estoque
	METHOD GerarPvEst(cFilPV, aItens, cCli, cLoj, cCondPg, cC6Oper, cTipPrc, cTabPrc, nIndPrc, lLibEst, lEmpDif, cTranspDAK)

	//Metodo para obter o Recno do Pedido de Transferencia da FE gerado pela solicitação
	METHOD GetRecnoPvFE()

	//Metodo para obter o numero do Pedido de Transferencia da FE gerado pela solicitação
	METHOD GetNumPvFE()

	//----------------- Metodos para NF TRANSFERÊNCIA --------------------\\
	//Metodo para fazer/acompanhar NF de transferência dos itens para filial de venda
	METHOD NfTransferencia(cIdTriang)

	//Metodo para validar o Id Triangulaçao se pode ou não executar processos
	METHOD VldIdTriangNf()

	//Metodo para montar tela de Nf Transferência
	METHOD TelaNfTransf()

	//Metodo para montar grid de itens da Nf Transferência
	METHOD DoGridNfTran(oDlg, nTop, nLeft, nBottom, nRight)

	//Metodo para montar grid de log de processamento
	METHOD DoGridLogProc(oDlg, nTop, nLeft, nBottom, nRight)

	//Metodo para definir processos que serão executados e verificados
	METHOD MontaProcLog()

	//Metodo para atualizar o status do processamento (grid log)
	METHOD AtuStatusProc()

	//Metodo para executar processos pendentes
	METHOD DoProcNfTran(nRecDAK, nRecSC5)

	//Metodo para liberar estoque bloqueado
	METHOD LiberaEstoque(cProcess, cFilPv, aPvOri, aItOri, aNotas)

	//Metodo para faturar o pedido posicionado
	METHOD GerarDocSaida(cProcess, cFilPv, aPvOri, aItOri, aNotas,cTranspDAK,cCodCar)

	//Metodo para transmissão da NFe
	METHOD TransmiteNFe(cProcess, cFilNF, aNotas)

	//Metodo para monitorar a transmissão/retorno SEFAZ da NFe
	METHOD MonitorarNFe(cProcess, cFilNF, aNotas)

	//Metodo para impressao da DANFE
	METHOD ImpDANFE(cProcess, cFilNF, aNotas,cCodCar)

	//Metodo para gerar documento de entrada
	METHOD GerarDocEntrada(cProcess, cFilDoc, cFilOri, aNFSaida, aNFEntra)

	//Metodo para gerar Pedido de Venda intermediario
	METHOD GerarPVInt(cProcess)

	//Metodo para verificar se item do pedido ja está foi transferido para a filial
	METHOD VldItemTrf(cChavItem, cFilPv)

	//Metodo para distribuir os lotes no pedido
	METHOD DistribuiLotes(cProcess, aSF1)

	//----------------- Metodos AUXILIARES GERAIS --------------------\\
	//Metodo para obter sequencial da triangulação
	METHOD GetIdTriang()

	//Metodo para posicionar no cliente da filial
	METHOD PosCliFil(cFilGet, cCli, cLoj)

	//Metodo para posicionar no fornecedor da filial
	METHOD PosForFil(cFilGet, cForn, cLoj)

	//Metodo para obter o preço unitario do pedido
	METHOD GetPrcUnit(cTipPrc, cTabPrc, cProdut, nPrcVend, nIndPrc )

	//Metodo para criar perguntas da chave
	METHOD CriaSX1(cPerg)

	// Verifica se mesmo com erro no execauto, o pedido foi incluido.
	METHOD VerifIncPV(cFilPV)

	// Valida se conseguiu liberar os estoques.
	METHOD ValidBlqEst(aPedVen, cFilPv)

	//Pega o tipo da Carga
	METHOD GetTipoCarga()

	//Verifica os pedido de venda que compõe a carga para geração de doc. de saidas e transmissão
	METHOD GetPvsCarga(cCarga)

	METHOD GravaTabelaLog(aProcLog)

ENDCLASS


//********************************** Metodos MANIPULAÇAO OBJETO ************************************\\

//-----------------------------------------------------------------
// Metodo Contrutor da Classe
//-----------------------------------------------------------------
METHOD New(lShowMsg) CLASS FatTriang

	Default lShowMsg := .T.
	Default cLogPro  := ''
	Default cCarga   := ''


	//inicializando variaveis
	::lShowMsg	:= lShowMsg
	::cMsgErro	:= ""
	::cFilVen	:= ""
	::cFilEst	:= ""
	::cFilInt	:= ""
	::cTipo 	:= ""
	::cIdTriang	:= ""
	::aPvSolicit := {}
	::aItSolicit := {}
	::aRecPvFE  := {}
	::aNumPvFE  := {}
	::aPvNfFE := {}
	::aItNfFE := {}
	::aPvNfFI := {}
	::aItNfFI := {}
	::aSF2_FE := {}
	::aSF2_FI := {}
	::aSF1_FI := {}
	::aSF1_FV := {}
	::aProcLog  := {}
//	::cProcExec := "DOCSFE"
	::cProcExec := "LIBESTO"
	::aPVsCarga := {}
	::aSF2_FV   := {}
	::cStatus   := ""
Return

//-----------------------------------------------------------------
// Metodo para mostrar erro em tela ou via conout
//-----------------------------------------------------------------
METHOD ShowError(lInfo, lMostraErro) CLASS FatTriang
	Default lInfo := .T.
	Default lMostraErro := .F.
	if !empty(::cMsgErro)
		if ::lShowMsg
			if lInfo
				MsgInfo(::cMsgErro,"Atenção!")
			else
				MsgStop(::cMsgErro,"Atenção!")
			endif
			if lMostraErro
				MostraErro()
			endif
		else
			Conout(">> CLASS FatTriang: " + ::cMsgErro)
		endif
	endif
Return

//-----------------------------------------------------------------
// Metodo para retornar erro
//-----------------------------------------------------------------
METHOD GetError() CLASS FatTriang
Return ::cMsgErro

//-----------------------------------------------------------------
// Metodo para destrutor da classe
//-----------------------------------------------------------------
METHOD Destroy() CLASS FatTriang
	//freeObj(self)
Return


//********************************** Metodos para SOLICITAÇÃO **********************************\\

//-----------------------------------------------------------------
//Metodo para fazer a solicitação da triangulação
//-----------------------------------------------------------------
// colocar semaforo -  jackson
METHOD AbreSolicitacao(cPedido, cCarga,cFilCarga) CLASS FatTriang

	Local lOK	     := .F.
	Local lRet       := .F.
	Local cPerg      := "TBCFTRI2"
//	Local cFtra2	 := getNextAlias()

	Private cTranspDAK := ''

	Default cPedido := ""
	Default cCarga  := ""
	Default cFilCarga := cFilAnt

	::cFilVen := cFilAnt

	if ::lShowMsg
		if empty(cPedido+cCarga)
			::CriaSX1(cPerg)

			while Pergunte(cPerg, .T.) //Chama a tela de parametros
				if !empty(MV_PAR01+MV_PAR02)
					cCarga  := MV_PAR01
					cPedido := MV_PAR02
					lOK := .T.
					EXIT
				endif
			enddo
		else
			lOK := .T.
		endif
	else
		if empty(cPedido+cCarga)
			cLogPro += "Sem informações de Pedido ou Carga" + CRLF
			Return lRet
		endif
		lOK := .T.
	endif

	if lOK
		::cTipo := iif(empty(cCarga),"2","1") //1=Por Carga, 2=Por Pedido

		if lRet := ::VldSolicitacao(cPedido, cCarga)

			if ::lShowMsg //se automatico, gravo direto

				MsAguarde({|| lRet := ::GravaSolicitacao() },"Aguarde...","Gerando pedido de transferência...",.T.)
				if !lRet
					cLogPro += ::cMsgErro + CRLF
				Endif
			else //senao abro tela
				lRet := ::TelaSolicitacao()
				::MontaProcLog()
				nPosProc := aScan(::aProcLog, {|x| x[4] == "GERSOL"})

				if lRet
					//::aProcLog[2][1] := "BR_VERDE"
					//::aProcLog[2][3] := "Pedido de transferência gerada"
					::cProcExec := "LIBESTO" //proximo passo
				else
					//::aProcLog[nPosProc][1] := "BR_VERMELHO"
					//::aProcLog[nPosProc][3] := "Não foi possível gerar o pedido de transferência:"+::cMsgErro
					cLogPro += "Não foi possível gerar o pedido de transferência:"+::cMsgErro + CRLF
				endif

			endif
		else
			cLogPro += ::cMsgErro + CRLF
		endif
	endif

Return lRet

//-----------------------------------------------------------------------------------------
//Metodo para validar se pode continuar a solicitação de triangulação, para carga ou pedido
//Também é populado as variaveis de dados: aPvSolicit,aItSolicit,cFilEst,cFilInt
//-----------------------------------------------------------------------------------------
METHOD VldSolicitacao(cPedido, cCarga) CLASS FatTriang

	Local lRet := .T.
	//Local nX := 0
	//Local aTES := {}
	Local cSeq := "00"
	Local cPVFin := ""

	if ::cTipo == '1' //se por carga

		DbSelectArea("DAK")
		DAK->(DbSetOrder(1)) //DAK_FILIAL+DAK_COD+DAK_SEQCAR
		if DAK->(DbSeek(xFilial("DAK")+cCarga))
			if DAK->DAK_FEZNF == '2' .And. DAK->DAK_ACECAR == '2'.And.(DAK->DAK_BLQCAR == '2' .Or. DAK->DAK_BLQCAR == ' ') .And. (DAK->DAK_JUNTOU=='MANUAL'.Or.DAK->DAK_JUNTOU=='ASSOCI'.Or.DAK->DAK_JUNTOU=='JUNTOU')
				if empty(DAK->DAK_XIDTRI)
					//percorro pedidos da carga
					DbSelectArea("DAI")
					DAI->(DbSetOrder(1)) //DAI_FILIAL+DAI_COD+DAI_SEQCAR+DAI_SEQUEN+DAI_PEDIDO
					DAI->( dbSeek(xFilial("DAI") + DAK->DAK_COD) )
					while DAI->(!EOF()) .And. DAI->DAI_FILIAL+DAI->DAI_COD == xFilial("DAI")+DAK->DAK_COD

						//verifico se o pedido foi replicado para outra filial
						SC5->(DbSetOrder(1))
						SC5->(dbSeek(xFilial("SC5") + DAI->DAI_PEDIDO))
						if empty(SC5->C5_XFILEST)
							::cMsgErro := "Há pedidos na carga que não estão marcados para retirar estoque em outra filial."
							::ShowError()
							::aPvSolicit := {}
							lRet := .F.
							EXIT
							//Validação para não deixar Triangular sem antes faturar o PVFinanceiro primeiro
							if !empty(SC5->C5_XPVREMS)
								cPVFin := PVFin(SC5->C5_XPVREMS)
								If empty(Posicione("SD2",8,xFilial("SD2")+cPVFin,"D2_DOC"))
									::cMsgErro := "Pedido Financeiro:"+cPVFin+" no Protheus deve estar faturado primeiro! Ação nao permitida."
									::ShowError()
									::aPvSolicit := {}
									lRet := .F.
									EXIT
								endif
							Endif
						else
							if empty(::cFilEst)
								::cFilEst := SC5->C5_XFILEST
								::cFilInt := SC5->C5_XFILINT
							elseif SC5->C5_XFILEST <> ::cFilEst
								::cMsgErro := "Não é permitido pedidos com retirada de estoque em mais de uma filial, na mesma carga."
								::ShowError()
								::aPvSolicit := {}
								lRet := .F.
								EXIT
							endif
						endif

						aAdd(::aPvSolicit, SC5->C5_NUM)

						SC9->(DbSetOrder(5)) //C9_FILIAL+C9_CARGA+C9_SEQCAR+C9_SEQENT
						SC9->(DbSeek(xFilial("SC9")+DAI->DAI_COD+DAI->DAI_SEQCAR+DAI->DAI_SEQUEN ))
						While SC9->(!Eof()) .AND. SC9->C9_FILIAL+SC9->C9_CARGA+SC9->C9_SEQCAR+SC9->C9_SEQENT == xFilial("SC9")+DAI->DAI_COD+DAI->DAI_SEQCAR+DAI->DAI_SEQUEN

							SC6->(DbSetOrder(1)) //C6_FILIAL+C6_NUM+C6_ITEM+C6_PRODUTO
							SC6->(dbSeek( SC9->C9_FILIAL+SC9->C9_PEDIDO+SC9->C9_ITEM ) )
							SB1->(DbSetOrder(1))
							SB1->( dbSeek(xFilial("SB1")+SC6->C6_PRODUTO) )

							//verifico tes
							/*if aScan(aTES, SC6->C6_TES)==0
							aadd(aTES, SC6->C6_TES)
							endif*/

							cSeq := Soma1(cSeq)

							aAdd(::aItSolicit, {cSeq ,;
							SC6->C6_NUM,;
							SC6->C6_ITEM,;
							SC6->C6_PRODUTO,;
							SB1->B1_DESC,;
							SC6->C6_QTDVEN,;
							SC6->C6_UM,;
							SC5->C5_EMISSAO,;
							SC5->C5_CLIENTE,;
							SC5->C5_LOJACLI,;
							Posicione("SA1",1,xFilial("SA1")+SC5->C5_CLIENTE+SC5->C5_LOJACLI,"A1_NOME"),;
							SC6->(Recno()),;
							.F.; //deleted
							});


							SC9->(DbSkip())
						enddo

						DAI->(DbSkip())
					enddo
				else
					::cMsgErro := "Carga informada já possui solicitação de Triangulação."
					::ShowError()
					lRet := .F.
				endif
			else
				::cMsgErro := "Carga informada com bloqueio ou ja faturada."
				::ShowError()
				lRet := .F.
			endif
		else
			::cMsgErro := "Carga informada não encontrada nesta Filial."
			::ShowError()
			lRet := .F.
		endif

	else //por Pedido

		DbSelectArea("SC5")
		SC5->(DbSetOrder(1))
		if SC5->(DbSeek(xFilial("SC5")+cPedido))
			if empty(SC5->C5_XFILEST)
				::cMsgErro := "Pedido informado não marcado para retirar estoque em outra filial."
				::ShowError()
				lRet := .F.
			elseif Empty(SC5->C5_LIBEROK) .And. Empty(SC5->C5_NOTA) .And. Empty(SC5->C5_BLQ)
				::cMsgErro := "Pedido não liberado."
				::ShowError()
				lRet := .F.
			elseif !empty(SC5->C5_NOTA)
				::cMsgErro := "Pedido ja faturado. Ação não permitida."
				::ShowError()
				lRet := .F.
			elseif !empty(SC5->C5_XIDTRI)
				::cMsgErro := "Pedido já possui solicitção de Triangulação."
				::ShowError()
				lRet := .F.
			elseif !empty(SC5->C5_BLQ) .OR. SC5->C5_LIBEROK == 'E'
				::cMsgErro := "Pedido com bloqueio ou elminiado residuo."
				::ShowError()
				lRet := .F.
			elseif U_CORX(SC5->C5_NUM)
				::cMsgErro := "Pedido com bloqueio de Crédito."
				::ShowError()
				lRet := .F.
			else

				DbSelectArea("DAI")
				DAI->(DbSetOrder(4)) //DAI_FILIAL+DAI_PEDIDO+DAI_COD+DAI_SEQCAR
				if DAI->( dbSeek(xFilial("DAI") + SC5->C5_NUM) )
					::cMsgErro := "Pedido informado está vinculado a carga "+DAI->DAI_COD+". Ação não permitida."
					::ShowError()
					lRet := .F.
				else //tudo ok

					aAdd(::aPvSolicit, SC5->C5_NUM)

					::cFilEst := SC5->C5_XFILEST
					::cFilInt := SC5->C5_XFILINT

					SB1->(DbSetOrder(1))
					SC6->(DbSetOrder(1))
					SC6->(dbSeek(xFilial("SC6") + SC5->C5_NUM) )
					While SC6->(!Eof()) .AND. SC6->C6_FILIAL+SC6->C6_NUM == xFilial("SC6")+SC5->C5_NUM

						//verifico tes
						/*if aScan(aTES, SC6->C6_TES)==0
						aadd(aTES, SC6->C6_TES)
						endif*/

						SB1->( dbSeek(xFilial("SB1")+SC6->C6_PRODUTO) ) //posiciono no produto

						cSeq := Soma1(cSeq)

						aAdd(::aItSolicit, {cSeq ,;
						SC6->C6_NUM,;
						SC6->C6_ITEM,;
						SC6->C6_PRODUTO,;
						SB1->B1_DESC,;
						SC6->C6_QTDVEN,;
						SC6->C6_UM,;
						SC5->C5_EMISSAO,;
						SC5->C5_CLIENTE,;
						SC5->C5_LOJACLI,;
						Posicione("SA1",1,xFilial("SA1")+SC5->C5_CLIENTE+SC5->C5_LOJACLI,"A1_NOME"),;
						SC6->(Recno()),;
						.F.; //deleted
						});

						SC6->(DbSkip())
					enddo

				endif
			endif
		else
			::cMsgErro := "Pedido informado não encontrado nesta Filial."
			::ShowError()
			lRet := .F.
		endif
	endif

	//verificação do campo F4_XTESTRF da tes utilizada no pedido
	/*if lRet
	SF4->( dbSetOrder(1))
	for nX := 1 to len(aTES)
	if SF4->( dbSeek(xFilial("SF4") + aTES[nX] ) ) .AND. empty(SF4->F4_XTESTRF)
	::cMsgErro := "A TES "+aTES[nX]+" utilizada no pedido "+::aPvSolicit[nX]+" não está configurada para esse processo. Campo F4_XTESTRF."
	::ShowError()
	lRet := .F.
	::aPvSolicit := {}
	::aItSolicit := {}
	EXIT
	endif
	next nX
	endif*/

Return lRet

//-----------------------------------------------------------------
//Metodo para montar tela de solicitação da triangulação
//-----------------------------------------------------------------
METHOD TelaSolicitacao() CLASS FatTriang

	Local lRet := .F.
	Local nRecDAK, nRecSC5

	//dimensionamento de tela e componentes
	Local aSize 	:= MsAdvSize() // Retorna a área útil das janelas Protheus
	Local aInfo 	:= {aSize[1], aSize[2], aSize[3], aSize[4], 2, 2}
	Local aPObj 	:= MsObjSize(aInfo, {{ 100, 100, .T., .T.}, { 100, 000, .T., .F.}})

	//enchoicebar
	Local bOk := {|| MsAguarde({|| lRet := ::GravaSolicitacao(), oDlg:End() },"Aguarde...","Gerando pedido de transferência...",.T.) }
	Local bCancel := {|| oDlg:End() }
	Local aButtons := {}
	Local oFontTitle := TFont():New('Arial',,23,.T.,.F.)
	Local oFontGrid := TFont():New('Arial',,18,.T.,.T.)
	Local nCorGrid	:= 7888896

	//variáveis de dados
	Private cCadastro := "Solicitação de Triangulação"
	Private cSC5
	Private cDAK

	//variaveis objetos da tela
	Private oDlg
	Private oGridItens

	if ::cTipo == '1' //se por carga
		//faço lock na carga
		nRecDAK := DAK->(Recno())
		cDAK := DAK->DAK_COD
		cSC5 := ""
		SoftLock("DAK")
	else
		//faço lock no pedido
		nRecSC5 := SC5->(Recno())
		cDAK := ""
		cSC5 := SC5->C5_NUM
		SoftLock("SC5")
	endif

	//começa montagem do DLG
	DEFINE MSDIALOG oDlg TITLE cCadastro FROM aSize[7],aSize[1] TO aSize[6],aSize[5] PIXEL OF GetWndDefault() STYLE nOr(WS_VISIBLE, WS_POPUP)

	//barra de menus e titulo
	EnchoiceBar(oDlg, bOk, bCancel,.F.,@aButtons,0,"SC5", .F., .F., .T., .T., .F.)

	//campos da tela
	TSay():New( 38,10,{|| "Data Solicit." }, oDlg,,,,,,.T.,CLR_BLACK,,50,9 )
	TGet():New( 35,45,{|u| dDataBase },oDlg,50,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.T.,.F.,,"",,,,.T.,.F.)

	TSay():New( 38,120,{|| "Solicitante" }, oDlg,,,,,,.T.,CLR_BLACK,,50,9 )
	TGet():New( 35,155,{|u| USRRETNAME(RETCODUSR()) },oDlg,50,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.T.,.F.,,"",,,,.T.,.F.)

	TSay():New( 38,230,{|| "Cod.Carga" }, oDlg,,,,,,.T.,CLR_BLACK,,50,9 )
	TGet():New( 35,270,{|u| cDAK },oDlg,50,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.T.,.F.,,"",,,,.T.,.F.)

	TSay():New( 38,340,{|| "Num.Pedido" }, oDlg,,,,,,.T.,CLR_BLACK,,50,9 )
	TGet():New( 35,370,{|u| cSC5 },oDlg,50,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.T.,.F.,,"",,,,.T.,.F.)

	//grid Itens
	TSay():New( aPObj[1,1]+25,07,{|| "Itens da Solicitação" }, oDlg,,oFontGrid,,,,.T.,nCorGrid,,200,15 )
	TSay():New( aPObj[1,1]+25,aPObj[1,2],{|| Replicate("_",aPObj[1,4]) }, oDlg,,oFontTitle,,,,.T.,nCorGrid,,aPObj[1,4],15 )

	oGridItens := ::DoGridSol(oDlg, aPObj[1,1]+38, aPObj[1,2], aPObj[1,3]+15, aPObj[1,4]+3)
	oGridItens:aCols := ::aItSolicit

	//encerra montagem DLG
	oDlg:lCentered := .T.
	oDlg:Activate()

	if ::cTipo == '1' //se por carga
		DAK->(DbGoTo(nRecDAK))
		DAK->(MsUnlock())
	else
		SC5->(DbGoTo(nRecSC5))
		SC5->(MsUnlock())
	endif

Return lRet


//---------------------------------------------------------
// Monta Grid de Itens
//---------------------------------------------------------
METHOD DoGridSol(oDlg, nTop, nLeft, nBottom, nRight) CLASS FatTriang

	Local nX
	Local aHeaderEx    := {}
	Local aColsEx      := {}
	Local aFieldFill   := {}
	Local aFields      := {"D2_ITEM","C6_NUM","C6_ITEM","C6_PRODUTO","B1_DESC","C6_QTDVEN","C6_UM","C5_EMISSAO","C5_CLIENTE","C5_LOJACLI","A1_NOME"}
	Local aAlterFields := {}
	Local nLinMax 	   := 999  // Quantidade de linha na getdados
	Local cTitField	   := ""

	// Define field properties
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	For nX := 1 to Len(aFields)
		If SX3->(DbSeek(aFields[nX]))
			if aFields[nX] == "D2_ITEM"
				cTitField := "Seq."
			else
				cTitField := AllTrim(X3Titulo())
			endif

			Aadd(aHeaderEx, {cTitField,SX3->X3_CAMPO,SX3->X3_PICTURE,SX3->X3_TAMANHO,SX3->X3_DECIMAL,SX3->X3_VALID,;
			SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})

			if SX3->X3_TIPO == "N"
				Aadd(aFieldFill,0)
			elseif SX3->X3_TIPO == "D"
				Aadd(aFieldFill,CTOD(""))
			elseif SX3->X3_TIPO == "L"
				Aadd(aFieldFill,.F.)
			else
				Aadd(aFieldFill,"")
			endif
		Endif
	Next nX
	Aadd(aFieldFill,.F.) //deletado

	Aadd(aColsEx, aFieldFill)

Return MsNewGetDados():New( nTop, nLeft, nBottom, nRight, , "AllwaysTrue", "AllwaysTrue", "AllwaysTrue",;
aAlterFields, , nLinMax, "AllwaysTrue", "AllwaysTrue", "AllwaysTrue", oDlg, aHeaderEx, aColsEx)

//-----------------------------------------------------------------
//Metodo para gravar solicitação da triangulação
//-----------------------------------------------------------------
METHOD GravaSolicitacao() CLASS FatTriang

	Local lRet := .F.
	Local lLibEst := SuperGetMv("FT_LIBESTA",,.F.) //define se tenta liberar estoque automaticamente
	Local nX := 1
	Local cFilCli := ::cFilVen //::cFilEst
	Local cCli, cLoj
	Local cCondPg    := SuperGetMv("FT_CDPAGFE",,"",::cFilEst)
	Local cC6Oper    := SuperGetMv("FT_OPERFE",,"",::cFilEst) //operaçao quando tem filial intermediaria (transferencia)
	Local cTipPrc    := SuperGetMv("FT_TPPRCFE",,"2",::cFilEst)//1-tabela de preço;2-Custo SB2;3-Custo SB9;4-% do Preço de Venda Origem
	Local cTabPrc    := SuperGetMv("FT_TABPFE",,"",::cFilEst)
	Local nIndPrc    := SuperGetMv("FT_INDPRFE",,0,::cFilEst)
	Local nTamEmp    := len(alltrim(cEmpAnt))

	//caso tenha filial intermediaria, altero filial do cliente
	if !empty(::cFilInt)
		cFilCli := ::cFilInt
	Endif

	//se grupo empresa é diferente, a operação será venda
	if SubStr(cFilCli,1,nTamEmp) <> SubStr(::cFilEst,1,nTamEmp)
		cC6Oper := SuperGetMv("FT_OPERFEV",,"",::cFilEst) //mudo o tipo de operação, para venda
		//mudo os tipos de preço
		cTipPrc := SuperGetMv("FT_TPPRCFV",,"2",::cFilEst)		// 
		cTabPrc := SuperGetMv("FT_TABPFV",,"",::cFilEst)     	// Tabela de preço
		nIndPrc := SuperGetMv("FT_INDPRFV",,0,::cFilEst)		// 
		lEmpDif := .T.
	else
	
		lEmpDif := .F.
		
	endif

	if empty(cCondPg)
		::cMsgErro := "Condição de pagamento não parametrizada. "+CRLF+" Parametro: FT_CDPAGFE "
		::ShowError()
		Return lRet
	endif

	if empty(cC6Oper)
		::cMsgErro := "Tipo Operação não parametrizado. "+CRLF+"Parametro: FT_OPERFE" + iif(empty(::cFilInt),"V","")
		::ShowError()
		Return lRet
	endif

	if cTipPrc == "1" .and. empty(cTabPrc) //se tabela de preço não preenchido
		::cMsgErro := "Tabela de preço não parametrizada. "+CRLF+"Parametro: FT_TABPFE "
		::ShowError()
		Return .F.
	endif

	BeginTran()

	//posiciona no cliente da filial que será usado no pedido
	if ::PosCliFil(cFilCli, @cCli, @cLoj)

		if ::GerarPvEst(::aItSolicit, cCli, cLoj, cCondPg, cC6Oper, cTipPrc, cTabPrc, nIndPrc, lLibEst, lEmpDif, cTranspDAK)

			if lLibEst
				if !::ValidBlqEst(::GetNumPvFE(), ::cFilEst)
					/*
					if !::lShowMsg .or. !MsgYesNo("Há itens no pedido "+SC5->C5_NUM+" gerado pelo processamento que ficaram bloquedos por estoque."+CRLF+CRLF+;
					"Deseja manter o pedido e prosseguir com a solicitaçao de transferência?","Atenção")

						::cMsgErro := "Abortado por não liberaçao de estoque!"
						::ShowError()
						DisarmTransaction()
						Return .F.
					endif
					*/
				endif
			endif

			//gravando flag na carga
			if ::cTipo == "1"
				RecLock("DAK", .F.)
				DAK->DAK_XIDTRI := ::GetIdTriang()
				DAK->(MsUnlock())
			endif

			//gravando flag nos pedidos
			SC5->(DbSetOrder(1))
			for nX := 1 to len(::aPvSolicit)
				if SC5->(DbSeek(xFilial("SC5")+::aPvSolicit[nX]))
					Reclock("SC5",.F.)
					SC5->C5_XIDTRI := ::GetIdTriang()
					SC5->(MsUnlock())
				endif
			next nX

			lRet := .T.

		else
			DisarmTransaction()
			Return .F.
		endif

	else
		::cMsgErro := "Cliente da filial "+cFilCli+" não encontrado para geração do pedido de transferência!"
		::ShowError()
	endif

	EndTran()

Return lRet


//********************************** Metodos para NF TRANSFERÊNCIA **********************************\\

//-----------------------------------------------------------------
//Metodo para fazer/acompanhar NF de transferência dos itens para filial de venda
//-----------------------------------------------------------------
METHOD NfTransferencia(cIdTriang) CLASS FatTriang

	Local lOK	:= .F.
	Local cPerg := "TBCFTRI2"

	Default cIdTriang := ""

	if empty(cIdTriang)
		::CriaSX1(cPerg)

		while Pergunte(cPerg, .T.) //Chama a tela de parametros
			if !empty(MV_PAR01)
				cIdTriang  := MV_PAR01
				lOK := .T.
				EXIT
			endif
		enddo
	else
		lOK := .T.
	endif

	if lOK
		::cIdTriang := cIdTriang

		if ::VldIdTriangNf()

			::TelaNfTransf()

		endif
	endif

Return

//-----------------------------------------------------------------
//Metodo para validar o Id Triangulaçao se pode ou não executar processos
//-----------------------------------------------------------------
METHOD VldIdTriangNf() CLASS FatTriang

	Local nRecPv := 0
	Local lRet := .T.
	Local cSeq := "0000"

	DAK->(dbOrderNickName("IDTRIANG"))
	if DAK->(DbSeek(::cIdTriang))
		::cTipo := "1" //1=Por Carga, 2=Por Pedido
	endif

	SC5->(dbOrderNickName("IDTRIANG"))
	if SC5->(DbSeek(::cIdTriang))
		if empty(::cTipo)
			::cTipo := "2" //1=Por Carga, 2=Por Pedido
		endif
		//encontrando pedido da FV
		While SC5->(!Eof()) .AND. SC5->C5_XIDTRI == ::cIdTriang

			if !empty(SC5->C5_XFILEST)
				::cFilVen := SC5->C5_FILIAL
				::cFilEst := SC5->C5_XFILEST
				::cFilInt := SC5->C5_XFILINT
				nRecPv := SC5->(Recno())
				EXIT
			endif

			SC5->(DbSkip())
		enddo
	endif

	if empty(::cTipo) .OR. empty(::cFilVen)
		lRet := .F.
		::cMsgErro := "Id Triangulação não encontrado ou pedido/carga não configurados corretamente para essa transação!"
		::ShowError()
	endif

	if lRet

		//montando vetor de itens
		SC5->(dbOrderNickName("IDTRIANG"))
		if SC5->(DbSeek(::cIdTriang))
			While SC5->(!Eof()) .AND. SC5->C5_XIDTRI == ::cIdTriang
				//somente filial estoque
				if empty(SC5->C5_XFILEST) .AND. SC5->C5_FILIAL == xFilial("SC5",::cFilEst)

					aadd(::aPvNfFE, SC5->C5_NUM )

					SC6->(DbSetOrder(1))
					SB1->(DbSetOrder(1))
					SC9->(DbSetOrder(1))
					if SC9->(DbSeek(SC5->C5_FILIAL + SC5->C5_NUM))
						While SC9->(!Eof()) .AND. SC9->C9_FILIAL+SC9->C9_PEDIDO == SC5->C5_FILIAL+SC5->C5_NUM

							cSeq := Soma1(cSeq)

							SC6->(DbSeek(SC5->C5_FILIAL + SC5->C5_NUM + SC9->C9_ITEM)) //posiciono no item
							SB1->( dbSeek(xFilial("SB1")+SC6->C6_PRODUTO) ) //posiciono no produto

							//{"D2_ITEM","C6_PRODUTO","B1_DESC","C6_QTDVEN","C6_UM","C6_LOCAL","C6_LOTECTL","C6_LOCALIZ","C6_FILIAL","C6_NUM","C6_ITEM","C6_XTFIORI","C6_XTPVORI","C6_XTITORI"}
							aAdd(::aItNfFE, {cSeq ,;
							SC6->C6_PRODUTO,;
							SB1->B1_DESC,;
							SC9->C9_QTDLIB,;
							SC6->C6_UM,;
							SC9->C9_LOCAL,;
							SC9->C9_LOTECTL,;
							SC6->C6_LOCALIZ,;
							SC6->C6_FILIAL,;
							SC6->C6_NUM,;
							SC6->C6_ITEM,;
							SC6->C6_XTFIORI,;
							SC6->C6_XTPVORI,;
							SC6->C6_XTITORI,;
							SC6->(Recno()),;
							.F.; //deleted
							});

							SC9->(DbSkip())
						enddo
					else
						::cMsgErro := "Pedido de transferência "+SC5->C5_NUM+" não foi empenhado!"
						::ShowError()
						lRet := .F.
						EXIT
					endif
				endif

				SC5->(DbSkip())
			enddo
		endif

	endif

	//deixar posicionado no pedido da FV
	if lRet .AND. nRecPv > 0
		SC5->(DbGoTo(nRecPv))
	endif

	if lRet .AND.  empty(::aPvNfFE) .OR. empty(::aItNfFE)
		::cMsgErro := "Não foi possível carregar os itens para processamento!"
		::ShowError()
		lRet := .F.
	endif

Return lRet

//-----------------------------------------------------------------
//Metodo para montar tela de Nf Transferência
//-----------------------------------------------------------------
METHOD TelaNfTransf() CLASS FatTriang

	Local nRecDAK, nRecSC5
	//Local lRet := .F.

	//dimensionamento de tela e componentes
	Local aSize 	:= MsAdvSize() // Retorna a área útil das janelas Protheus
	Local aInfo 	:= {aSize[1], aSize[2], aSize[3], aSize[4], 2, 2}
	Local aPObj 	:= MsObjSize(aInfo, {{ 100, 100, .T., .T.}, { 100, 000, .T., .F.}})

	//enchoicebar
	Local bOk := {|| ::DoProcNfTran(nRecDAK, nRecSC5) }
	Local bCancel := {|| oDlg:End() }
	Local aButtons := {}
	Local oFontTitle := TFont():New('Arial',,23,.T.,.F.)
	Local oFontGrid := TFont():New('Arial',,18,.T.,.T.)
	Local nCorGrid	:= 7888896

	//variáveis de dados
	Private cCadastro := "Nota Fiscal Transferência - Faturamento Triangular"
	Private cSC5	  := ""
	Private cDAK 	  := ""

	//variaveis objetos da tela
	Private oDlg
	Private oGridItens
	Private oGridLog

	if ::cTipo == '1' //se por carga
		//faço lock na carga
		nRecDAK := DAK->(Recno())
		cDAK := DAK->DAK_COD
		cSC5 := ""
		SoftLock("DAK")
	else
		//faço lock no pedido
		nRecSC5 := SC5->(Recno())
		cDAK := ""
		cSC5 := SC5->C5_NUM
		SoftLock("SC5")
	endif
    
    if ::lShowMsg
	    //começa montagem do DLG
	    DEFINE MSDIALOG oDlg TITLE cCadastro FROM aSize[7],aSize[1] TO aSize[6],aSize[5] PIXEL OF GetWndDefault() STYLE nOr(WS_VISIBLE, WS_POPUP)

	    //barra de menus e titulo
	    EnchoiceBar(oDlg, bOk, bCancel,.F.,@aButtons,0,"SC5", .F., .F., .T., .T., .F.)
	    AltBtnEnch(oDlg, "Confirmar", "Processar")
	    AltBtnEnch(oDlg, "Cancelar", "Fechar")

	    //campos da tela
	    TSay():New( 38,10,{|| "Id. Triang." }, oDlg,,,,,,.T.,CLR_BLACK,,50,9 )
	    TGet():New( 35,45,{|u| ::cIdTriang },oDlg,50,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.T.,.F.,,"",,,,.T.,.F.)

	    TSay():New( 38,120,{|| "Data" }, oDlg,,,,,,.T.,CLR_BLACK,,50,9 )
	    TGet():New( 35,155,{|u| dDataBase },oDlg,50,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.T.,.F.,,"",,,,.T.,.F.)

	    TSay():New( 38,230,{|| "Carga FV" }, oDlg,,,,,,.T.,CLR_BLACK,,50,9 )
	    TGet():New( 35,270,{|u| cDAK },oDlg,50,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.T.,.F.,,"",,,,.T.,.F.)

	    TSay():New( 38,340,{|| "Pedido FV" }, oDlg,,,,,,.T.,CLR_BLACK,,50,9 )
	    TGet():New( 35,370,{|u| cSC5 },oDlg,50,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.T.,.F.,,"",,,,.T.,.F.)

	    //grid itens
	    TSay():New( aPObj[1,1]+25,07,{|| "Itens a Faturar" }, oDlg,,oFontGrid,,,,.T.,nCorGrid,,200,15 )
	    TSay():New( aPObj[1,1]+25,aPObj[1,2],{|| Replicate("_",aPObj[1,4]) }, oDlg,,oFontTitle,,,,.T.,nCorGrid,,aPObj[1,4],15 )

	    oGridItens := ::DoGridNfTran(oDlg, aPObj[1,1]+38, aPObj[1,2], aPObj[1,3]-100, aPObj[1,4]+3)
	    oGridItens:aCols := ::aItNfFE

	    //grid log processamento
	    TSay():New( aPObj[1,3]-95,07,{|| "Log do Processamento" }, oDlg,,oFontGrid,,,,.T.,nCorGrid,,200,15 )
	    TSay():New( aPObj[1,3]-95,aPObj[1,2],{|| Replicate("_",aPObj[1,4]) }, oDlg,,oFontTitle,,,,.T.,nCorGrid,,aPObj[1,4],15 )

	    oGridLog := ::DoGridLogProc(oDlg, aPObj[1,3]-82, aPObj[1,2], aPObj[1,3], aPObj[1,4]+3)
	    ::MontaProcLog()
	    oGridLog:aCols := ::aProcLog

	    @ aPObj[1,3]+5, 010 BITMAP ResName "BR_AZUL" OF oDlg Size 10, 10 NoBorder When .F. PIXEL
	    @ aPObj[1,3]+5, 110 BITMAP ResName "BR_VERDE" OF oDlg Size 10, 10 NoBorder When .F. PIXEL
	    @ aPObj[1,3]+5, 210 BITMAP ResName "BR_VERMELHO" OF oDlg Size 10, 10 NoBorder When .F. PIXEL

	    TSay():New( aPObj[1,3]+5,023,{|| "Agardando Execução" }, oDlg,,,,,,.T.,CLR_BLACK,,100,9 )
	    TSay():New( aPObj[1,3]+5,123,{|| "Processo Executado" }, oDlg,,,,,,.T.,CLR_BLACK,,100,9 )
	    TSay():New( aPObj[1,3]+5,223,{|| "Execução Abortada" }, oDlg,,,,,,.T.,CLR_BLACK,,100,9 )

	    @ aPObj[1,3]+5,aPObj[1,2] SAY ("Siglas: FE=Filial Estoque" + space(10) + "FI=Filial Intermediária" + space(10) + "FV=Filial Venda") RIGHT OF oDlg COLORS CLR_BLACK PIXEL

	    //encerra montagem DLG
	    oDlg:bInit := {||( MsAguarde({|| ::AtuStatusProc()  },"Aguarde...","Avaliando status processamento...",.T.) )}
	    oDlg:lCentered := .T.
	    oDlg:Activate()

    else
        oGridItens := ::DoGridNfTran()
	    oGridItens:aCols := ::aItNfFE
        ::DoProcNfTran(nRecDAK, nRecSC5) 
    endif

	if ::cTipo == '1' //se por carga
		DAK->(DbGoTo(nRecDAK))
		DAK->(MsUnlock())
	else
		SC5->(DbGoTo(nRecSC5))
		SC5->(MsUnlock())
	endif

Return

//-----------------------------------------------------------------
//Metodo para montar grid de itens da Nf Transferência
//-----------------------------------------------------------------
METHOD DoGridNfTran(oDlg, nTop, nLeft, nBottom, nRight) CLASS FatTriang

	Local nX
	Local aHeaderEx    := {}
	Local aColsEx      := {}
	Local aFieldFill   := {}
	Local aFields      := {"D2_ITEM","C6_PRODUTO","B1_DESC","C6_QTDVEN","C6_UM","C6_LOCAL","C6_LOTECTL","C6_LOCALIZ","C6_FILIAL","C6_NUM","C6_ITEM","C6_XTFIORI","C6_XTPVORI","C6_XTITORI"}
	Local aAlterFields := {}
	Local nLinMax 	   := 999  // Quantidade de linha na getdados
	Local cTitField	   := ""

    default oDlg := nil
    default nTop := 0
    default nLeft:= 0
    default nBottom := 0
    default nRight  := 0

	// Define field properties
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	For nX := 1 to Len(aFields)
		If SX3->(DbSeek(aFields[nX]))
			if aFields[nX] == "D2_ITEM"
				cTitField := "Seq."
			elseif aFields[nX] == "C6_FILIAL"
				cTitField := "Fil.Estoque"
			elseif aFields[nX] == "C6_NUM"
				cTitField := "Pedido FE"
			elseif aFields[nX] == "C6_ITEM"
				cTitField := "Item FE"
			elseif aFields[nX] == "C6_XTFIORI"
				cTitField := "Fil.Venda"
			elseif aFields[nX] == "C6_XTPVORI"
				cTitField := "Pedido FV"
			elseif aFields[nX] == "C6_XTITORI"
				cTitField := "Item FV"
			else
				cTitField := AllTrim(X3Titulo())
			endif

			Aadd(aHeaderEx, {cTitField,SX3->X3_CAMPO,SX3->X3_PICTURE,SX3->X3_TAMANHO,SX3->X3_DECIMAL,SX3->X3_VALID,;
			SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})

			if SX3->X3_TIPO == "N"
				Aadd(aFieldFill,0)
			elseif SX3->X3_TIPO == "D"
				Aadd(aFieldFill,CTOD(""))
			elseif SX3->X3_TIPO == "L"
				Aadd(aFieldFill,.F.)
			else
				Aadd(aFieldFill,"")
			endif
		Endif
	Next nX
	Aadd(aFieldFill,.F.) //deletado

	Aadd(aColsEx, aFieldFill)
	if ::lShowMsg
		xRet := MsNewGetDados():New( nTop, nLeft, nBottom, nRight, , "AllwaysTrue", "AllwaysTrue", "AllwaysTrue",;
				aAlterFields, , nLinMax, "AllwaysTrue", "AllwaysTrue", "AllwaysTrue", oDlg, aHeaderEx, aColsEx)
	else
		xRet := GridMock():new(aHeaderEx,aColsEx)
	endif

Return xRet

//-----------------------------------------------------------------
//Metodo para montar grid de log de processamento
//-----------------------------------------------------------------
METHOD DoGridLogProc(oDlg, nTop, nLeft, nBottom, nRight) CLASS FatTriang

	Local aHeaderEx    := {}
	Local aColsEx      := {}
	Local aFieldFill   := {}
	Local aAlterFields := {}
	Local nLinMax 	   := 999  // Quantidade de linha na getdados

	Aadd(aHeaderEx,{'','LEG','@BMP',2,0,'','€€€€€€€€€€€€€€','C','','','',''})
	Aadd(aFieldFill,"BR_AZUL")

	Aadd(aHeaderEx,{'Processo','PROCESSO','',40,0,'','€€€€€€€€€€€€€€','C','','','',''})
	Aadd(aFieldFill, space(40))

	Aadd(aHeaderEx,{'Processo','MENSAGEM','',150,0,'','€€€€€€€€€€€€€€','C','','','',''})
	Aadd(aFieldFill, space(150))

	Aadd(aFieldFill,.F.) //deletado

	Aadd(aColsEx, aFieldFill)

Return MsNewGetDados():New( nTop, nLeft, nBottom, nRight, , "AllwaysTrue", "AllwaysTrue", "AllwaysTrue",;
aAlterFields, , nLinMax, "AllwaysTrue", "AllwaysTrue", "AllwaysTrue", oDlg, aHeaderEx, aColsEx)

//-----------------------------------------------------------------
//Metodo para definir processos que serão executados e verificados
//-----------------------------------------------------------------
METHOD MontaProcLog() CLASS FatTriang

	Local cLegInicial := "BR_AZUL"
	Local cAguardando := "Aguardando Execução..."

    if !::lShowMsg
        aadd(::aProcLog, {cLegInicial,"Gerar Carga ("+::cFilVen+")", cAguardando, "DOCCRG", .F.})
        aadd(::aProcLog, {cLegInicial,"Gerar Sol.Transf.("+::cFilVen+")", cAguardando, "GERSOL", .F.})
    endif

	aadd(::aProcLog, {cLegInicial,"Liberar Estoque ("+::cFilEst+")", cAguardando, "LIBESTO", .F.}) // Priorisa
	aadd(::aProcLog, {cLegInicial,"Gerar Documento Saída FE ("+::cFilEst+")", cAguardando, "DOCSFE", .F.})
	aadd(::aProcLog, {cLegInicial,"Transmitir NF-e FE ("+::cFilEst+")", cAguardando, "NFE_FE", .F.})
	aadd(::aProcLog, {cLegInicial,"Autorização NF-e FE ("+::cFilEst+")", cAguardando, "AUT_FE", .F.})
	aadd(::aProcLog, {cLegInicial,"Imprimir DANFE FE ("+::cFilEst+")", cAguardando, "DAN_FE", .F.})
	if !empty(::cFilInt)
		aadd(::aProcLog, {cLegInicial,"Gerar Documento Entrada FI ("+::cFilInt+")", cAguardando, "DOCEFI", .F.})
		aadd(::aProcLog, {cLegInicial,"Gerar Pedido de Venda FI ("+::cFilInt+")", cAguardando, "PEDVFI", .F.})
		aadd(::aProcLog, {cLegInicial,"Gerar Documento Saída FI ("+::cFilInt+")", cAguardando, "DOCSFI", .F.})
		aadd(::aProcLog, {cLegInicial,"Transmitir NF-e FI ("+::cFilInt+")", cAguardando, "NFE_FI", .F.})
		aadd(::aProcLog, {cLegInicial,"Autorização NF-e FI ("+::cFilInt+")", cAguardando, "AUT_FI", .F.})
		aadd(::aProcLog, {cLegInicial,"Imprimir DANFE FI ("+::cFilInt+")", cAguardando, "DAN_FI", .F.})
	endif
	
	aadd(::aProcLog, {cLegInicial,"Gerar Documento Entrada FV ("+::cFilVen+")", cAguardando, "DOCEFV", .F.})
	aadd(::aProcLog, {cLegInicial,"Distribuir Lotes nos Pedidos FV ("+::cFilVen+")", cAguardando, "DLOTFV", .F.})
	aadd(::aProcLog, {cLegInicial,"Liberar Estoque FV ("+::cFilVen+")", cAguardando, "LIBESTO2", .F.})
	aadd(::aProcLog, {cLegInicial,"Gerar Documento Saída  FV ("+::cFilVen+")", cAguardando, "DOCSFV", .F.})
	aadd(::aProcLog, {cLegInicial,"Transmitir NF-e FV ("+::cFilVen+")", cAguardando, "NFE_FV", .F.})
	aadd(::aProcLog, {cLegInicial,"Autorização NF-e FV ("+::cFilVen+")", cAguardando, "AUT_FV", .F.})
	aadd(::aProcLog, {cLegInicial,"Imprimir DANFE FV ("+::cFilEst+")", cAguardando, "DAN_FV", .F.})

Return

//-----------------------------------------------------------------
//Metodo para atualizar o status do processamento (grid log)
//-----------------------------------------------------------------
METHOD AtuStatusProc() CLASS FatTriang

	Local lContinua := .T.
	Local cNFAux := ""
	Local nX := 1
	Local cPVAtu := ""
	Local nPosFilFE := aScan(oGridItens:aHeader,{|x| AllTrim(x[2])=="C6_FILIAL"})
	Local nPosPvFE := aScan(oGridItens:aHeader,{|x| AllTrim(x[2])=="C6_NUM"})
	Local nPosItFE := aScan(oGridItens:aHeader,{|x| AllTrim(x[2])=="C6_ITEM"})
	Local nPosFilFV := aScan(oGridItens:aHeader,{|x| AllTrim(x[2])=="C6_XTFIORI"})
	Local nPosPvFV := aScan(oGridItens:aHeader,{|x| AllTrim(x[2])=="C6_XTPVORI"})
	Local nPosItFV := aScan(oGridItens:aHeader,{|x| AllTrim(x[2])=="C6_XTITORI"})
	Local nPosLote := aScan(oGridItens:aHeader,{|x| AllTrim(x[2])=="C6_LOTECTL"})
	Local cBkpFil := cFilAnt
	Local lPreNota := .F.
	Local lCtrEnd := .F.
	Local nPosProc := 1
	Local lEnderecar := .F.

	//limpo variaveis
	::aSF2_FE	:= {} //Notas fiscais de saida FE
	::aSF2_FI	:= {} //Notas fiscais de saida FI
	::aSF1_FI	:= {} //Notas fiscais de entrada FI
	::aSF1_FV	:= {} //Notas fiscais de entrada FV
	::aPvNfFI 	:= {} //Pedidos na FI
	::aItNfFI 	:= {} //Itens pedido na FI

	::cProcExec := "LIBESTO" // processo inicial
//	::cProcExec := "DOCSFE" // processo inicial
	cFilAnt := ::cFilEst
	//verifico se ja fez as NFs de Saída da FE
	SC6->(DbSetOrder(1))
	SF2->(DbSetOrder(1))
	cPVAtu := ""
	For nX := 1 to len(::aItNfFE)
		if ::aItNfFE[nX][nPosPvFE] <> cPVAtu //verifico só um item de cada pedido
			cPVAtu := ::aItNfFE[nX][nPosPvFE]
			if SC6->(DbSeek( ::aItNfFE[nX][nPosFilFE] + ::aItNfFE[nX][nPosPvFE] + ::aItNfFE[nX][nPosItFE] ))
				if !empty(SC6->C6_NOTA)
					if aScan(::aSF2_FE, {|x| x[1]+x[2] == SC6->C6_NOTA+SC6->C6_SERIE }) == 0
						if SF2->(DbSeek(xFilial("SF2")+SC6->C6_NOTA+SC6->C6_SERIE))
							aAdd(::aSF2_FE, {SC6->C6_NOTA, SC6->C6_SERIE, SF2->F2_FIMP, iif(!Empty(SF2->F2_CHVNFE),SF2->F2_CHVNFE,SF2->F2_XIDTRI)} )
							cNFAux += SC6->C6_NOTA+"/"+SC6->C6_SERIE + " "
						endif
					endif
				endif
			endif
		endif
	next nX

	if empty(::aSF2_FE) //se não há notas
		lContinua := .F. 
	else
		//VarInfo( "FatTri:"+ ::cIdTriang +" AtuStatusProc:aSF2_FE", ::aSF2_FE,, .F. )
		nPosProc := aScan(::aProcLog, {|x| x[4] == "DOCSFE"})
		//::aProcLog[nPosProc][1] := "BR_VERDE"
		//::aProcLog[nPosProc][3] := "Documento Saída gerado: " + cNFAux
		::cProcExec := "NFE_FE" //proximo passo

		// Se nota faturada forço a legenda para verda da etapa de liberçaão de estoque
		If nPosProc > 0
			nPosEst := aScan(::aProcLog, {|x| x[4] == "LIBESTO"})
			//::aProcLog[nPosEst][1] := "BR_VERDE"
			//::aProcLog[nPosEst][3] := "Liberação de estoque executada: " + cNFAux

		Endif
	endif


	if lContinua
		nPosProc := aScan(::aProcLog, {|x| x[4] == "NFE_FE"})
		if ::GetTipoCarga() <> 'E' .AND. aScan(::aSF2_FE, {|x| empty(x[3]) }) > 0  //::aSF2_FE={{SC6->C6_NOTA, SC6->C6_SERIE, SF2->F2_FIMP, SF2->F2_CHVNFE}} If ::GetTipoCarga() <> 'E'
			lContinua := .F.
		else
			//::aProcLog[nPosProc][1] := "BR_VERDE"
			//::aProcLog[nPosProc][3] := "NF-e Transmitida para SEFAZ"
			::cProcExec := "AUT_FE" //proximo passo
		endif
	endif

	//verifico se as notas foram autorizadas
	if lContinua
		nPosProc := aScan(::aProcLog, {|x| x[4] == "AUT_FE"})
		if ::GetTipoCarga() <> 'E' .AND. aScan(::aSF2_FE, {|x| x[3]<>"S" }) > 0  //::aSF2_FE={{SC6->C6_NOTA, SC6->C6_SERIE, SF2->F2_FIMP, SF2->F2_CHVNFE}}
			//::aProcLog[nPosProc][1] := "BR_VERMELHO"
			//::aProcLog[nPosProc][3] := "NF-e não autorizada ou aguardando retorno! Verifique na rotina NF-e Sefaz."
			lContinua := .F.
		else
			//::aProcLog[nPosProc][1] := "BR_VERDE"
			//::aProcLog[nPosProc][3] := "NF-e Autorizadas pelo SEFAZ"
            
			nPosProc := aScan(::aProcLog, {|x| x[4] == "DAN_FE"})
			//::aProcLog[nPosProc][1] := "BR_VERDE"
			//::aProcLog[nPosProc][3] := "DANFE Impressa"
            
			::cProcExec := "DOCEFV" //proximo passo
		endif
	endif

	//processos na filial intermediaria
	if lContinua .AND. !empty(::cFilInt)
		cFilAnt := ::cFilInt //vou para filial intermediaria
		::cProcExec := "DOCEFI" //proximo passo
		//verifico se ja foi gerado doc de entrada para cada nf
		if lContinua
			cNFAux := ""
			lPreNota := .F.
			lCtrEnd := GetMV("MV_LOCALIZ",, "N") == "S"
			nPosProc := aScan(::aProcLog, {|x| x[4] == "DOCEFI"})
			for nX := 1 to len(::aSF2_FE)
				SF1->(DbSetOrder(8)) //F1_FILIAL+F1_CHVNFE
				if !empty(::aSF2_FE[nX][4]) .AND. SF1->(DbSeek(xFilial("SF1")+::aSF2_FE[nX][4] ))
					aadd(::aSF1_FI, {SF1->F1_DOC, SF1->F1_SERIE, SF1->F1_FORNECE, SF1->F1_LOJA, SF1->F1_CHVNFE} )
					cNFAux += SF1->F1_DOC +"/"+ SF1->F1_SERIE + " "
					if Empty(SF1->F1_STATUS)
						cNFAux += "(Pré-Nota) "
						lPreNota := .T.
						lContinua := .F. //falta gerar
					else
						//verifico saldo a endereçar
						SD1->( dbSetOrder(1)) //D1_FILIAL+D1_DOC+D1_SERIE+D1_FORNECE+D1_LOJA+D1_COD+D1_ITEM
						SD1->( dbSeek(SF1->F1_FILIAL+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA) )
						while SD1->(!EOF()) .And. SD1->D1_FILIAL+SD1->D1_DOC+SD1->D1_SERIE+SD1->D1_FORNECE+SD1->D1_LOJA == SF1->F1_FILIAL+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA

							SB1->(DbSetOrder(1))
							SB1->(dbSeek(xFilial("SB1") + SD1->D1_COD) )
							if SB1->B1_LOCALIZ <> "S"
								SD1->( dbSkip() )
								LOOP
							endif
							//verifico se o saldo ficou a endereçar
							SDA->(DbSetOrder(1)) //DA_FILIAL+DA_PRODUTO+DA_LOCAL+DA_NUMSEQ
							if SDA->(DBSeek(xFilial("SDA")+SD1->D1_COD+SD1->D1_LOCAL+SD1->D1_NUMSEQ )) .AND. SDA->DA_SALDO > 0
								lContinua := .F. //falta endereçar
								alert("Falta Endereçar: " + SD1->D1_COD+SD1->D1_LOCAL+SD1->D1_NUMSEQ)
								lEnderecar := .T.
								EXIT
							endif

							SD1->(DbSkip())
						enddo
					endif
				else
					lContinua := .F. //falta gerar
				endif
			next nX
			if lContinua
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "Documento Entrada gerado: " + cNFAux
				::cProcExec := "PEDVFI" //proximo passo
			else
				//::aProcLog[nPosProc][1] := "BR_VERMELHO"
				if lPreNota
					cNFAux += " >> Classifique manualmente"
					if lCtrEnd
						cNFAux += " e aponte saldo a endereçar dos produtos habilitados"
					endif
					cNFAux += "."
					//::aProcLog[nPosProc][3] := "Documento Entrada gerado: " + cNFAux
				endif
				if lEnderecar
					cNFAux += " >> Falta produtos a endereçar."
					//::aProcLog[nPosProc][3] := "Documento Entrada gerado: " + cNFAux
				endif
			endif
			//VarInfo( "FatTri:"+ ::cIdTriang +" AtuStatusProc:aSF1_FI", ::aSF1_FI,, .F. )
		endif

		lEnderecar := .F.

		//verifico se ja gerou pedido venda na FI
		if lContinua
			cNFAux := ""
			nPosProc := aScan(::aProcLog, {|x| x[4] == "PEDVFI"})
			cSeq := "0000"

			//montando vetor de itens
			SC5->(dbOrderNickName("IDTRIANG"))
			if SC5->(DbSeek(::cIdTriang))
				While SC5->(!Eof()) .AND. SC5->C5_XIDTRI == ::cIdTriang

					//somente pedidos da filial intermediaria
					if empty(SC5->C5_XFILEST) .AND. SC5->C5_FILIAL == xFilial("SC5",::cFilInt)

						aadd(::aPvNfFI, SC5->C5_NUM )
						cNFAux += SC5->C5_NUM + " "

						SB1->(DbSetOrder(1))
						SC6->(DbSetOrder(1))
						SC6->(DbSeek(SC5->C5_FILIAL + SC5->C5_NUM))
						While SC6->(!Eof()) .AND. SC6->C6_FILIAL+SC6->C6_NUM == SC5->C5_FILIAL+SC5->C5_NUM

							cSeq := Soma1(cSeq)

							SB1->( dbSeek(xFilial("SB1")+SC6->C6_PRODUTO) ) //posiciono no produto

							//{"D2_ITEM","C6_PRODUTO","B1_DESC","C6_QTDVEN","C6_UM","C6_LOCAL","C6_LOTECTL","C6_LOCALIZ","C6_FILIAL","C6_NUM","C6_ITEM","C6_XTFIORI","C6_XTPVORI","C6_XTITORI"}
							aAdd(::aItNfFI, {cSeq ,;
								SC6->C6_PRODUTO,;
								SB1->B1_DESC,;
								SC6->C6_QTDVEN,;
								SC6->C6_UM,;
								SC6->C6_LOCAL,;
								SC6->C6_LOTECTL,;
								SC6->C6_LOCALIZ,;
								SC6->C6_FILIAL,;
								SC6->C6_NUM,;
								SC6->C6_ITEM,;
								SC6->C6_XTFIORI,;
								SC6->C6_XTPVORI,;
								SC6->C6_XTITORI,;
								SC6->(Recno()),;
								.F.; //deleted
							});

						    SC6->(DbSkip())
						enddo
					endif

					SC5->(DbSkip())
				enddo
			endif
			//VarInfo( "FatTri:"+ ::cIdTriang +" AtuStatusProc:aPvNfFI", ::aPvNfFI,, .F. )
			//se nao tem pedido ou está incompleto (qtd itens)
		    if empty(::aPvNfFI) .OR. empty(::aItNfFI) .OR. len(::aItNfFI) <> len(::aItNfFE)
				lContinua := .F. //falta gerar
			else
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "Pedido de Venda gerado: " + cNFAux
				::cProcExec := "DOCSFI" //proximo passo
			endif

		endif
		//verifico se ja fez as NFs de Saída da FI
		if lContinua
			nPosProc := aScan(::aProcLog, {|x| x[4] == "DOCSFI"})
			SC6->(DbSetOrder(1))
			SF2->(DbSetOrder(1))
			cPVAtu := ""
			cNFAux := ""
			For nX := 1 to len(::aItNfFI)
				if ::aItNfFI[nX][nPosPvFE] <> cPVAtu //verifico só um item de cada pedido
					cPVAtu := ::aItNfFI[nX][nPosPvFE]
					if SC6->(DbSeek( ::aItNfFI[nX][nPosFilFE] + ::aItNfFI[nX][nPosPvFE] + ::aItNfFI[nX][nPosItFE] ))
						if !empty(SC6->C6_NOTA)
							if aScan(::aSF2_FI, {|x| x[1]+x[2] == SC6->C6_NOTA+SC6->C6_SERIE }) == 0
								if SF2->(DbSeek(xFilial("SF2")+SC6->C6_NOTA+SC6->C6_SERIE))
									aAdd(::aSF2_FI, {SC6->C6_NOTA, SC6->C6_SERIE, SF2->F2_FIMP, SF2->F2_CHVNFE} )
									cNFAux += SC6->C6_NOTA+"/"+SC6->C6_SERIE + " "
								endif
							endif
						endif
					endif
				endif
			next nX

			if empty(::aSF2_FI) //se não há notas
				lContinua := .F.
			else
				//VarInfo( "FatTri:"+ ::cIdTriang +" AtuStatusProc:aSF2_FI", ::aSF2_FI,, .F. )
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "Documento Saída gerado: " + cNFAux
				::cProcExec := "NFE_FI" //proximo passo
			endif
		endif

		//verifico se há notas sem transmitir
		if lContinua
			nPosProc := aScan(::aProcLog, {|x| x[4] == "NFE_FI"})
			if ::GetTipoCarga() <> 'E' .AND. aScan(::aSF2_FI, {|x| empty(x[3]) }) > 0  //::aSF2_FI={{SC6->C6_NOTA, SC6->C6_SERIE, SF2->F2_FIMP, SF2->F2_CHVNFE}}
				lContinua := .F.
			else
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "NF-e Transmitida para SEFAZ"
				::cProcExec := "AUT_FI" //proximo passo
			endif
		endif

		//verifico se as notas foram autorizadas
		if lContinua
			nPosProc := aScan(::aProcLog, {|x| x[4] == "AUT_FI"})
			if ::GetTipoCarga() <> 'E' .AND. aScan(::aSF2_FI, {|x| x[3]<>"S" }) > 0  //::aSF2_FI={{SC6->C6_NOTA, SC6->C6_SERIE, SF2->F2_FIMP, SF2->F2_CHVNFE}}
				//::aProcLog[nPosProc][1] := "BR_VERMELHO"
				//::aProcLog[nPosProc][3] := "NF-e não autorizada ou aguardando retorno! Verifique na rotina NF-e Sefaz."
				lContinua := .F.
			else
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "NF-e Autorizadas pelo SEFAZ"
                
				nPosProc := aScan(::aProcLog, {|x| x[4] == "DAN_FI"})
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "DANFE Impressa"
                
				::cProcExec := "DOCEFV" //proximo passo
			endif
		endif

		cFilAnt := ::cFilVen //vou para filial de venda

		//verifico se ja foi gerado doc de entrada para cada nf, a partir das nota FI
		if lContinua
			cNFAux := ""
			lPreNota := .F.
			lCtrEnd := GetMV("MV_LOCALIZ",, "N") == "S"
			nPosProc := aScan(::aProcLog, {|x| x[4] == "DOCEFV"})
			for nX := 1 to len(::aSF2_FI)
				SF1->(DbSetOrder(8)) //F1_FILIAL+F1_CHVNFE
				if !empty(::aSF2_FI[nX][4]) .AND. SF1->(DbSeek(xFilial("SF1")+::aSF2_FI[nX][4] ))
					aadd(::aSF1_FV, {SF1->F1_DOC, SF1->F1_SERIE, SF1->F1_FORNECE, SF1->F1_LOJA, SF1->F1_CHVNFE} )
					cNFAux += SF1->F1_DOC +"/"+ SF1->F1_SERIE + " "
					if Empty(SF1->F1_STATUS)
						cNFAux += "(Pré-Nota) "
						lPreNota := .T.
						lContinua := .F. //falta gerar
					else
						//verifico saldo a endereçar
						SD1->( dbSetOrder(1)) //D1_FILIAL+D1_DOC+D1_SERIE+D1_FORNECE+D1_LOJA+D1_COD+D1_ITEM
						SD1->( dbSeek(SF1->F1_FILIAL+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA) )
						while SD1->(!EOF()) .And. SD1->D1_FILIAL+SD1->D1_DOC+SD1->D1_SERIE+SD1->D1_FORNECE+SD1->D1_LOJA == SF1->F1_FILIAL+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA
                            
							SB1->(DbSetOrder(1))
							SB1->(dbSeek(xFilial("SB1") + SD1->D1_COD) )
							if SB1->B1_LOCALIZ <> "S"
								SD1->( dbSkip() )
								LOOP
							endif
							//verifico se o saldo ficou a endereçar
							SDA->(DbSetOrder(1)) //DA_FILIAL+DA_PRODUTO+DA_LOCAL+DA_NUMSEQ
							if SDA->(DBSeek(xFilial("SDA")+SD1->D1_COD+SD1->D1_LOCAL+SD1->D1_NUMSEQ )) .AND. SDA->DA_SALDO > 0
								lContinua := .F. //falta gerar
								lEnderecar := .T.
								EXIT
							endif
                            
							SD1->(DbSkip())
						enddo
					endif
				else
					lContinua := .F. //falta gerar
				endif
			next nX
			if lContinua
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "Documento Entrada gerado: " + cNFAux
				::cProcExec := "DLOTFV" //proximo passo
			else
				::aProcLog[nPosProc][1] := "BR_VERMELHO"
				if lPreNota
					cNFAux += " >> Classifique manualmente"
					if lCtrEnd
						cNFAux += " e aponte saldo a endereçar dos produtos habilitados"
					endif
					cNFAux += "."
					//::aProcLog[nPosProc][3] := "Documento Entrada gerado: " + cNFAux
				endif
				if lEnderecar
					cNFAux += " >> Falta produtos a endereçar."
					//::aProcLog[nPosProc][3] := "Documento Entrada gerado: " + cNFAux
				endif
			endif
			//VarInfo( "FatTri:"+ ::cIdTriang +" AtuStatusProc:aSF1_FV", ::aSF1_FV,, .F. )
		endif

	else
		cFilAnt := ::cFilVen  //vou para filial de venda
		lEnderecar := .F.

		//verifico se ja foi gerado doc de entrada para cada nf
		if lContinua
			cNFAux := ""
			lPreNota := .F.
			lCtrEnd := GetMV("MV_LOCALIZ",, "N") == "S"
			nPosProc := aScan(::aProcLog, {|x| x[4] == "DOCEFV"})
			for nX := 1 to len(::aSF2_FE)
				SF1->(DbSetOrder(8)) //F1_FILIAL+F1_CHVNFE
				if !empty(::aSF2_FE[nX][4]) .AND. SF1->(DbSeek(xFilial("SF1")+::aSF2_FE[nX][4] ))
					aadd(::aSF1_FV, {SF1->F1_DOC, SF1->F1_SERIE, SF1->F1_FORNECE, SF1->F1_LOJA, SF1->F1_CHVNFE} )
					cNFAux += SF1->F1_DOC +"/"+ SF1->F1_SERIE + " "
					if Empty(SF1->F1_STATUS)
						cNFAux += "(Pré-Nota) "
						lPreNota := .T.
						lContinua := .F. //falta gerar
					else
						//verifico saldo a endereçar
						SD1->( dbSetOrder(1)) //D1_FILIAL+D1_DOC+D1_SERIE+D1_FORNECE+D1_LOJA+D1_COD+D1_ITEM
						SD1->( dbSeek(SF1->F1_FILIAL+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA) )
						while SD1->(!EOF()) .And. SD1->D1_FILIAL+SD1->D1_DOC+SD1->D1_SERIE+SD1->D1_FORNECE+SD1->D1_LOJA == SF1->F1_FILIAL+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA

							SB1->(DbSetOrder(1))
							SB1->(dbSeek(xFilial("SB1") + SD1->D1_COD) )
							if SB1->B1_LOCALIZ <> "S"
								SD1->( dbSkip() )
								LOOP
							endif
							//verifico se o saldo ficou a endereçar
							SDA->(DbSetOrder(1)) //DA_FILIAL+DA_PRODUTO+DA_LOCAL+DA_NUMSEQ
							if SDA->(DBSeek(xFilial("SDA")+SD1->D1_COD+SD1->D1_LOCAL+SD1->D1_NUMSEQ )) .AND. SDA->DA_SALDO > 0
								lContinua := .F. //falta gerar
								lEnderecar := .T.
								EXIT
							endif

							SD1->(DbSkip())
						enddo
					endif
				else
					lContinua := .F. //falta gerar
				endif
			next nX
			if lContinua
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "Documento Entrada gerado: " + cNFAux
				::cProcExec := "DLOTFV" //proximo passo
			else
				//::aProcLog[nPosProc][1] := "BR_VERMELHO"
				if lPreNota
					cNFAux += " >> Classifique manualmente"
					if lCtrEnd
						cNFAux += " e aponte saldo a endereçar dos produtos habilitados"
					endif
					cNFAux += "."
					//::aProcLog[nPosProc][3] := "Documento Entrada gerado: " + cNFAux
				endif
				if lEnderecar
					cNFAux += " >> Falta produtos a endereçar."
					//::aProcLog[nPosProc][3] := "Documento Entrada gerado: " + cNFAux
				endif
			endif
			//VarInfo( "FatTri:"+ ::cIdTriang +" AtuStatusProc:aSF1_FV", ::aSF1_FV,, .F. )
		endif
	endif

	//verifico se lotes foram distribuidos
	if lContinua
		nPosProc := aScan(::aProcLog, {|x| x[4] == "DLOTFV"})

		SC9->(DbSetOrder(1))
		For nX := 1 to len(::aItNfFE)
			lLoteOk := .F.
			if SC9->(DbSeek( ::aItNfFE[nX][nPosFilFV] + ::aItNfFE[nX][nPosPvFV] + ::aItNfFE[nX][nPosItFV] ))
				While SC9->(!Eof()) .AND. SC9->C9_FILIAL+SC9->C9_PEDIDO+SC9->C9_ITEM == ::aItNfFE[nX][nPosFilFV]+::aItNfFE[nX][nPosPvFV]+::aItNfFE[nX][nPosItFV]
					if ::aItNfFE[nX][nPosLote] == SC9->C9_LOTECTL //procuro lote
						lLoteOk := .T.
						EXIT
					endif
					SC9->(DbSkip())
				enddo
				if !lLoteOk
					lContinua := .F. //falta distribuir
					EXIT
				endif
			else
				lContinua := .F. //falta distribuir
				EXIT
			endif
		next nX

	    if lContinua
	    	//::aProcLog[nPosProc][1] := "BR_VERDE"
	    	//::aProcLog[nPosProc][3] := "Lotes distribuidos com sucesso!"
	    	::cProcExec := "LIBESTO2"


			nPosProc := aScan(::aProcLog, {|x| x[4] == "LIBESTO2"})
			cPvAux := ""
			cNFAux := ""

			::aPvsCarga := ::GetPvsCarga(DAK->(recno()), 0)
			nIndPv := 1
			while nIndPv <= len(::aPvsCarga) .and. lContinua

				dbSelectArea("SC5")
				SC5->(dbSetOrder(1))
				if SC5->(dbSeek(xFilial("SC5")+::aPvsCarga[nIndPv]))
					cPvAux += iif(!empty(cPvAux), " / ", "")+SC5->C5_NUM
					if empty(SC5->C5_NOTA)
						dbSelectArea("SC6")
						SC6->(dbSetOrder(1))
						cChaveSC6 := SC5->(C5_FILIAL+C5_NUM)
						if SC6->(dbSeek(cChaveSC6))

						    while SC6->(C6_FILIAL+C6_NUM) == cChaveSC6 .and. lContinua
						    	dbSelectArea("SC9")
						    	SC9->(dbSetOrder(1))
						    	lContinua := SC9->(dbSeek(SC6->(C6_FILIAL+C6_NUM+C6_ITEM))) .and. empty(SC9->C9_BLEST)
						    	SC6->(dbSkip())
						    enddo
						endif
					else
						dbSelectArea("SF2")
						if SF2->(dbSeek(SC5->(C5_FILIAL+C5_NOTA+C5_SERIE+C5_CLIENTE+C5_LOJACLI)))
							aadd(::aSF2_FV, {SF2->F2_DOC, SF2->F2_SERIE,SF2->F2_FIMP, SF2->F2_CHVNFE})
							cNFAux += SF2->F2_DOC +"/"+ SF2->F2_SERIE + " "
						endif
					endif
				endif
				nIndPv++
			enddo

			if lContinua
				if len(::aSF2_FV ) == len(::aPvsCarga)
					nPosProc := aScan(::aProcLog, {|x| x[4] == "DOCSFV"})
					//::aProcLog[nPosProc][1] := "BR_VERDE"
					//::aProcLog[nPosProc][3] := "Documentos de saída gerados : "+cNFAux

					nPosProc := aScan(::aProcLog, {|x| x[4] == "NFE_FV"})
					if ::GetTipoCarga() <> 'E' .AND. aScan(::aSF2_FV, {|x| empty(x[3]) }) > 0  //::aSF2_FI={{SC6->C6_NOTA, SC6->C6_SERIE, SF2->F2_FIMP, SF2->F2_CHVNFE}}
						lContinua := .F.
					else
						//::aProcLog[nPosProc][1] := "BR_VERDE"
						//::aProcLog[nPosProc][3] := "NF-e Transmitida para SEFAZ na FV"
						::cProcExec := "AUT_FV" //proximo passo
					endif
				else
					//::aProcLog[nPosProc][1] := "BR_VERDE"
					//::aProcLog[nPosProc][3] := "Liberação do estoque na FV realizada: "+cPvAux
					::cProcExec := "DOCSFV"
					lContinua := .F.
				endif
			endif

		    //verifico se as notas foram autorizadas
			if lContinua
				nPosProc := aScan(::aProcLog, {|x| x[4] == "AUT_FV"})
				if ::GetTipoCarga() <> 'E' .AND. aScan(::aSF2_FV, {|x| x[3]<>"S" }) > 0  //::aSF2_FI={{SC6->C6_NOTA, SC6->C6_SERIE, SF2->F2_FIMP, SF2->F2_CHVNFE}}
					//::aProcLog[nPosProc][1] := "BR_VERMELHO"
					//::aProcLog[nPosProc][3] := "NF-e não autorizada ou aguardando retorno! Verifique na rotina NF-e Sefaz."
					lContinua := .F.
				else
					//::aProcLog[nPosProc][1] := "BR_VERDE"
					//::aProcLog[nPosProc][3] := "NF-e Autorizadas pelo SEFAZ na FV"

					nPosProc := aScan(::aProcLog, {|x| x[4] == "DAN_FV"})
					//::aProcLog[nPosProc][1] := "BR_VERDE"
					//::aProcLog[nPosProc][3] := "DANFE Impressa na FV"
					::cProcExec := "FIM" //proximo passo
				endif
			endif
		endif
	endif

	if ::lShowMsg
//		oGridLog:GoTo(nPosProc)
//		oGridLog:oBrowse:Refresh()
	endif

	cFilAnt := cBkpFil

Return

//-----------------------------------------------------------------
//Metodo para executar processos pendentes
//-----------------------------------------------------------------
METHOD DoProcNfTran(nRecDAK, nRecSC5) CLASS FatTriang

	Local lOk := .T.

	//posiciono na carga ou pedido principal
	if ::cTipo == '1' //se por carga
		DAK->(DbGoTo(nRecDAK))
		DAK->(MsUnlock())
	else
		SC5->(DbGoTo(nRecSC5))
		SC5->(MsUnlock())
	endif


	if ::cProcExec <> "FIM"

		// PRIORISA
		if ::cProcExec == "LIBESTO"
			MsAguarde({|| lOk := ::LiberaEstoque(::cProcExec, ::cFilEst, ::aPvNfFE, ::aItNfFE, @::aSF2_FE) },"Aguarde...","Liberando estoque ...",.T.)
			//VarInfo( "FatTri:"+ ::cIdTriang +" DOCSFE:aSF2_FE", ::aSF2_FE,, .F. )
			if lOk
				//::cMsgErro
				::cProcExec := "DOCSFE" //proximo passo
			endif
		endif

		if ::cProcExec == "DOCSFE"
			MsAguarde({|| lOk := ::GerarDocSaida(::cProcExec, ::cFilEst, ::aPvNfFE, ::aItNfFE, @::aSF2_FE) },"Aguarde...","Gerando documento de saída na FE...",.T.)
			//VarInfo( "FatTri:"+ ::cIdTriang +" DOCSFE:aSF2_FE", ::aSF2_FE,, .F. )
			if lOk
				//::cMsgErro
				::cProcExec := "NFE_FE" //proximo passo
			endif
		endif

		if ::cProcExec == "NFE_FE"
			If ::GetTipoCarga() <> 'E'
				MsAguarde({|| lOk := ::TransmiteNFe(::cProcExec, ::cFilEst, @::aSF2_FE) },"Aguarde...","Transmitindo notas para SEFAZ...",.T.)
			Else
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "NF-e Transmitida para SEFAZ"
			Endif
			//VarInfo( "FatTri:"+ ::cIdTriang +" NFE_FE:aSF2_FE", ::aSF2_FE,, .F. )
			if lOk
				::cProcExec := "AUT_FE" //proximo passo
			endif
		endif


		if ::cProcExec == "AUT_FE"
			If ::GetTipoCarga() <> 'E'
				MsAguarde({|| lOk := ::MonitorarNFe(::cProcExec, ::cFilEst, @::aSF2_FE) },"Aguarde...","Monitorando retorno do SEFAZ...",.T.)
			Else
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "NF-e Autorizadas pelo SEFAZ"
			Endif
			//VarInfo( "FatTri:"+ ::cIdTriang +" AUT_FE:aSF2_FE", ::aSF2_FE,, .F. )
			if lOk
				::cProcExec := "DAN_FE" //proximo passo
			endif
		endif

		if ::cProcExec == "DAN_FE"
			If ::GetTipoCarga() <> 'E'
				MsAguarde({|| lOk := ::ImpDANFE(::cProcExec, ::cFilEst, @::aSF2_FE) },"Aguarde...","Imprimindo DANFEs...",.T.)
			Else
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "DANFEs Impressas"
			Endif

			if lOk
				if !empty(::cFilInt)
					::cProcExec := "DOCEFI" //proximo passo
				else
					::cProcExec := "DOCEFV" //proximo passo
				endif
			endif
		endif

		if ::cProcExec == "DOCEFI"
			MsAguarde({|| lOk := ::GerarDocEntrada( ::cProcExec,;
				::cFilInt,; //destino
			::cFilEst,; //origem
			::aSF2_FE,;
				@::aSF1_FI) },"Aguarde...","Gerando documento entrada na FI...",.T.)
			//VarInfo( "FatTri:"+ ::cIdTriang +" DOCEFI:aSF1_FI", ::aSF1_FI,, .F. )
			if lOk
				::cProcExec := "PEDVFI" //proximo passo
			endif
		endif

		if ::cProcExec == "PEDVFI"
			MsAguarde({|| lOk := ::GerarPVInt(::cProcExec) },"Aguarde...","Criando pedido de venda na FI...",.T.)
			//VarInfo( "FatTri:"+ ::cIdTriang +" PEDVFI:aPvNfFI", ::aPvNfFI,, .F. )
			//VarInfo( "FatTri:"+ ::cIdTriang +" PEDVFI:aItNfFI", ::aItNfFI,, .F. )
			if lOk
				::cProcExec := "DOCSFI" //proximo passo
			endif
		endif

		if ::cProcExec == "DOCSFI"
			MsAguarde({|| lOk := ::GerarDocSaida(::cProcExec, ::cFilInt, ::aPvNfFI, ::aItNfFI, @::aSF2_FI) },"Aguarde...","Gerando documento de saída na FI...",.T.)
			//VarInfo( "FatTri:"+ ::cIdTriang +" DOCSFI:aSF2_FI", ::aSF2_FI,, .F. )
			if lOk
				//::cMsgErro
				::cProcExec := "NFE_FI" //proximo passo
			endif
		endif

		if ::cProcExec == "NFE_FI"
			If ::GetTipoCarga() <> 'E'
				MsAguarde({|| lOk := ::TransmiteNFe(::cProcExec, ::cFilInt, @::aSF2_FI) },"Aguarde...","Transmitindo notas para SEFAZ...",.T.)
			Else
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "NF-e Transmitida para SEFAZ"
			Endif
			//VarInfo( "FatTri:"+ ::cIdTriang +" NFE_FI:aSF2_FI", ::aSF2_FI,, .F. )
			if lOk
				::cProcExec := "AUT_FI" //proximo passo
			endif
		endif

		if ::cProcExec == "AUT_FI"
			If ::GetTipoCarga() <> 'E'
				MsAguarde({|| lOk := ::MonitorarNFe(::cProcExec, ::cFilInt, @::aSF2_FI) },"Aguarde...","Monitorando retorno do SEFAZ...",.T.)
			Else
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "NF-e Autorizadas pelo SEFAZ"
			Endif
			//VarInfo( "FatTri:"+ ::cIdTriang +" AUT_FI:aSF2_FI", ::aSF2_FI,, .F. )
			if lOk
				::cProcExec := "DAN_FI" //proximo passo
			endif
		endif

		if ::cProcExec == "DAN_FI"
			If ::GetTipoCarga() <> 'E'
				MsAguarde({|| lOk := ::ImpDANFE(::cProcExec, ::cFilInt, @::aSF2_FI) },"Aguarde...","Imprimindo DANFEs...",.T.)
			Else
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "DANFEs Impressas"
			Endif

			if lOk
				::cProcExec := "DOCEFV" //proximo passo
			endif
		endif

		if ::cProcExec == "DOCEFV"
			MsAguarde({|| lOk := ::GerarDocEntrada( ::cProcExec,;
				::cFilVen,::cFilEst,::aSF2_FE,@::aSF1_FV) },"Aguarde...","Gerando documento entrada na FV...",.T.)
			if lOk
				::cProcExec := "DLOTFV" //proximo passo
			endif
		endif

		if ::cProcExec == "DLOTFV"
			MsAguarde({|| lOk := ::DistribuiLotes(::cProcExec, ::aSF1_FV) },"Aguarde...","Distribuindo lotes no pedido da FV...",.T.)

			if lOk
				::cProcExec := "LIBESTO2" //proximo passo
			endif
		endif


		if ::cProcExec == "LIBESTO2"
			::aPvsCarga := ::GetPvsCarga(nRecDak, nRecSC5)
			MsAguarde({|| lOk := ::LiberaEstoque(::cProcExec, ::cFilVen, ::aPVsCarga, ::aItNfFE, @::aSF2_FV) },"Aguarde...","Liberando estoque na FV...",.T.)
			//VarInfo( "FatTri:"+ ::cIdTriang +" DOCSFE:aSF2_FE", ::aSF2_FE,, .F. )
			if lOk
				//::cMsgErro
				::cProcExec := "DOCSFV" //proximo passo
			endif
		endif

		if ::cProcExec == "DOCSFV"
			MsAguarde({|| lOk := ::GerarDocSaida(::cProcExec, ::cFilVen, ::aPVsCarga, ::aItNfFE, @::aSF2_FV) },"Aguarde...","Gerando documento de saída na FV...",.T.)
			//VarInfo( "FatTri:"+ ::cIdTriang +" DOCSFE:aSF2_FE", ::aSF2_FE,, .F. )
			if lOk
				//::cMsgErro
				::cProcExec := "NFE_FV" //proximo passo
			endif
		endif

		if ::cProcExec == "NFE_FV"
			If ::GetTipoCarga() <> 'E'
				MsAguarde({|| lOk := ::TransmiteNFe(::cProcExec, ::cFilVen, @::aSF2_FV) },"Aguarde...","Transmitindo notas para SEFAZ na FV...",.T.)
			Else
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "NF-e Transmitida para SEFAZ"
			Endif
			//VarInfo( "FatTri:"+ ::cIdTriang +" NFE_FE:aSF2_FE", ::aSF2_FE,, .F. )
			if lOk
				::cProcExec := "AUT_FV" //proximo passo
			endif
		endif

		if ::cProcExec == "AUT_FV"
			If ::GetTipoCarga() <> 'E'
				MsAguarde({|| lOk := ::MonitorarNFe(::cProcExec, ::cFilVen, @::aSF2_FV) },"Aguarde...","Monitorando retorno do SEFAZ na FV...",.T.)
			Else
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "NF-e Autorizadas pelo SEFAZ"
			Endif
			//VarInfo( "FatTri:"+ ::cIdTriang +" AUT_FE:aSF2_FE", ::aSF2_FE,, .F. )
			if lOk
				::cProcExec := "DAN_FV" //proximo passo
			endif
		endif

		if ::cProcExec == "DAN_FV"
			If ::GetTipoCarga() <> 'E'
				MsAguarde({|| lOk := ::ImpDANFE(::cProcExec, ::cFilVen, @::aSF2_FV) },"Aguarde...","Imprimindo DANFEs na FV...",.T.)
			Else
				//::aProcLog[nPosProc][1] := "BR_VERDE"
				//::aProcLog[nPosProc][3] := "DANFEs Impressas"
			Endif

			if lOk

				::cProcExec := "FIM" //proximo passo
                if ::lShowMsg
				    MsgInfo("Processamento Finalizado com Sucesso!")
                else
                    ::gravaTabelaLog(::aProcLog)
                endif

			endif
		endif

	else
		MsgInfo("Processamento já realizado por completo!")
	endif

Return

//-----------------------------------------------------------------
//Metodo para faturar o pedido posicionado
//-----------------------------------------------------------------
//PrioriSA
METHOD LiberaEstoque(cProcess, cFilPv, aPvOri, aItOri, aNotas) CLASS FatTriang
	Local lOK := .T.
	Local nX := 1
	Local cMsgRet := ''
//	Local cCli, cLoj, cCondPg, cC6Oper, cTipPrc, cTabPrc, nIndPrc
	//Local nPosProc := aScan(::aProcLog, {|x| x[4] == cProcess})
	Local cBkpFil := cFilAnt
	Local cPVAux := ""
//	Local aCabAuto := {}
//	Local aIteAuto := {}
//	Local aAux := {}
//	Local cItem := replicate("0", tamSX3("C6_ITEM")[1])
//	Local cSeq := "0000"
//	Local nPrcUnit := 0, nPrcOrig := 0
//	Local aRecSC5 := {}
//	Local c_TpCrg := ' '
//	Local c_Tes := ' '
	Local aPvlNfs := {}, aBloqueio := {}
	//Local cAliasSC9     := "A450LIBMAN"
	//Local bValid        := {|| .T.}
	//Local lMTA456I		:= ExistBlock("MTA456I")
	//Local lQuery        := .T.
	//Local lUseOffBal	:= FindFunction("RskIsActive") .And. RskIsActive()
	//Local lHelp			:= .T.
	//Local cQuebra		:= chr(13)+chr(10)

	//mudo a filial
	cFilAnt := ::cFilInt
	cFilAnt := cFilPv

	cCondPg := SuperGetMv("FT_CDPAGFI",,"")
	cC6Oper := SuperGetMv("FT_OPERFI",,"")
	cTipPrc := SuperGetMv("FT_TPPRCFI",,"2")//1-tabela de preço;2-Custo SB2;3-Custo SB9;4-% do Preço de Venda Origem
	cTabPrc := SuperGetMv("FT_TABPFI",,"")
	nIndPrc := SuperGetMv("FT_INDPRFI",,0)
	//	c_TpCrg := GetTipoCarga()
	//
	//	If c_TpCrg = 'E'
	//		cC6Oper := SuperGetMv("FT_OPFIE",,"",::cFilEst)
	//	ElseIf c_TpCrg = 'F'
	//		cC6Oper := SuperGetMv("FT_OPFIF",,"",::cFilEst)
	//	EndIf


	if lOk .AND. empty(cCondPg)
		cLogPro += "Condição de pagamento não parametrizada. Parametro: FT_CDPAGFI "+CRLF
		cMsgRet := "Condição de pagamento não parametrizada. Parametro: FT_CDPAGFI "
		lOk := .F.
	endif

	if lOk .AND. !empty(cCondPg) .AND. empty(Posicione("SE4",1,xFilial("SE4")+cCondPg,"E4_CODIGO"))
		cLogPro += "Condição de Pagamento não encontrada na filial "+cFilAnt+"."+CRLF
		cMsgRet := "Condição de Pagamento não encontrada na filial "+cFilAnt+"."
		lOk := .F.
	endif

	if lOk .AND. empty(cC6Oper)
		cLogPro += "Tipo Operação não parametrizado. Parametro: FT_OPERFI "+CRLF
		cMsgRet := "Tipo Operação não parametrizado. Parametro: FT_OPERFI "
		lOk := .F.
	endif

	if lOk .AND. cTipPrc == "1" .AND. empty(cTabPrc) //se tabela de preço não preenchido
		cLogPro += "Tabela de preço não parametrizada. Parametro: FT_TABPFI "+CRLF
		cMsgRet := "Tabela de preço não parametrizada. Parametro: FT_TABPFI "
		lOk := .F.
	endif

	if lOk .AND. cTipPrc == "1" .AND. empty(Posicione("DA0",1,xFilial("DA0")+cTabPrc,"DA0_CODTAB"))
		cLogPro += "Tabela de preço não encontrada na filial "+cFilAnt+"."+CRLF
		cMsgRet := "Tabela de preço não encontrada na filial "+cFilAnt+"."
		lOk := .F.
	endif

	SC5->(DbSetOrder(1))
	cPedBloque:=''
	For nX := 1 to len(aPvOri)
		cPVAux += iif(!empty(cPVAux), " / ", "") +aPvOri[nX]
		SC5->(DbSeek(xFilial("SC5") + aPvOri[nX]) )
		MATA455()   // chama rotina para liberar estoque AUTOMATICA (STATICA)
		Ma410LbNfs(1,@aPvlNfs,@aBloqueio)
		if !empty(aBloqueio) .OR. !empty(SC5->C5_BLQ)
			cPedBloque += if(empty(cPedBloque),'',', ')+SC5->C5_NUM 
			lOk := .F.
		endif

	Next
	If !empty(cPedBloque)
		cLogPro += "Pedido(s) "+cPedBloque+" com algum bloqueio de crédito ou estoque. Operação Abortada!"+CRLF
		cMsgRet += "Pedido(s) "+cPedBloque+" com algum bloqueio de crédito ou estoque. Operação Abortada!"+CRLF
	Endif
	/*
	For nX := 1 to len(aPvOri)

		aItensFat := {}
		lOk := .T.

		//posiciono no pedido
		SC5->(DbSetOrder(1))
		SC5->(DbSeek(xFilial("SC5") + aPvOri[nX]) )
		cNumPV := aPvOri[nX]
		cPVAux += iif(!empty(cPVAux), " / ", "") +aPvOri[nX]
		SC6->(DbSetOrder(1))
		if SC6->( dbSeek(xFilial("SC6") + SC5->C5_NUM) )
			if !empty(SC6->C6_NOTA) //ja faturado
				lOk := .F. //não processa, pula pedido
				cNFAux += SC6->C6_NOTA+"/"+SC6->C6_SERIE + " "
			endif
		Else
			cLogPro += "Não encontrou itens do pedido de vendas para liberar estoque "+cFilAnt+"."+CRLF
			cMsgRet := "Não encontrou itens do pedido de vendas para liberar estoque "+cFilAnt+"."
			lOk := .F.
		endif

		//verifica liberação do pedido
		if lOk
			aPvlNfs := {}
			aBloqueio := {}
			Ma410LbNfs(1,@aPvlNfs,@aBloqueio)
			if !empty(aBloqueio) .OR. !empty(SC5->C5_BLQ)

				cQuery := "SELECT C9_FILIAL,C9_PEDIDO,C9_BLCRED,R_E_C_N_O_ SC9RECNO "+cQuebra
				cQuery += "FROM "+RetSqlName("SC9")+" SC9 "+cQuebra
				cQuery += "WHERE SC9.C9_FILIAL = '"+sc5->c5_filial+"' AND "+cQuebra
				cQuery += "SC9.C9_PEDIDO = '"+sc5->c5_num+"' AND "+cQuebra
				cQuery += "(SC9.C9_BLEST <> '  ' OR "
				cQuery += "SC9.C9_BLCRED <> '  ' ) AND "+cQuebra
				cQuery += "SC9.C9_BLCRED NOT IN('10','09') AND "+cQuebra
				cQuery += "SC9.C9_BLEST <> '10' AND "+cQuebra
				cQuery += "SC9.C9_DATALIB <= '"+DTOS(date()+10)+"' AND "+cQuebra
				cQuery += "SC9.D_E_L_E_T_ = ' ' "+cQuebra

				cQuery := ChangeQuery(cQuery)

				dbUseArea(.T.,"TOPCONN",TcGenQry(,,cQuery),cAliasSC9,.T.,.T.)

				Do	While (cAliasSC9)->(! Eof()) .And. (cAliasSC9)->C9_FILIAL == cFilAnt .And. (cAliasSC9)->C9_PEDIDO == cNumPV .And. (cAliasSC9)->(Eval(bValid))
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
				Ma410LbNfs( 2, @aPvlNfs, @aBloqueio )
				Ma410LbNfs( 1, @aPvlNfs, @aBloqueio )
				if !empty(aBloqueio) .OR. !empty(SC5->C5_BLQ)
					cLogPro += "Pedido "+SC5->C5_NUM+" com algum bloqueio de crédito ou estoque. Operação Abortada!"+CRLF
					cMsgLog := "Pedido "+SC5->C5_NUM+" com algum bloqueio de crédito ou estoque. Operação Abortada!"
					lOk := .F.
					EXIT
				endif

			endif
		endif
	next nX
	*/

	if lOk
		//::aProcLog[nPosProc][1] := "BR_VERDE"
		//::aProcLog[nPosProc][3] := "Pedido de transferencia com estoque liberado: " + cPVAux
	else
		//::aProcLog[nPosProc][1] := "BR_VERMELHO"
		//::aProcLog[nPosProc][3] := cMsgRet
	endif

	cFilAnt := cBkpFil
	if ::lShowMsg
//		oGridLog:GoTo(nPosProc)
//		oGridLog:oBrowse:Refresh()
	endif
 
Return lOk

//-----------------------------------------------------------------
//Metodo para faturar o pedido posicionado
//-----------------------------------------------------------------
METHOD GerarDocSaida(cProcess, cFilPv, aPvOri, aItOri, aNotas,cTranspDAK,cCodCar) CLASS FatTriang

	Local nX
	Local lOk       := .T.
//	Local nPosProc := aScan(::aProcLog, {|x| x[4] == cProcess})
	Local cBkpFil   := cFilAnt
	Local aItensFat := {}
	Local aPvlNfs   :={}, aBloqueio := {}
	Local cNFAux    := ""
	Local cMsgLog   := ""
	Local cNota, cSerie, lMostraCtb, lAglutCtb, lCtbOnLine, lCtbCusto, lReajuste, nCalAcrs, nArredPrcLis, lAtuSA7, lECF
	Local aPVIn     := {}

	default aNotas := {}
	//BeginTran()

	cFilAnt := iif(cProcess="DOCSFE",::cFilEst ,cFilPv)
	aPVIn   := iif(cProcess="DOCSFE",::aNumPvFE,aPvOri)

	cSerie := PadR(SuperGetMv("FT_SERTRSF",,""),TamSx3("F2_SERIE")[1]) //serie para NF

	If ::GetTipoCarga() = 'E'
		cSerie := PadR(SuperGetMv("FT_STRSFAF",,""),TamSx3("F2_SERIE")[1]) //serie para NF
	EndIf

	For nX := 1 to len(aPVIn)

		aItensFat := {}
		lOk := .T.

		//posiciono no pedido
		SC5->(DbSetOrder(1))
		SC5->(DbSeek(xFilial("SC5") + aPVIn[nX]) )
		SC6->(DbSetOrder(1))
		if SC6->( dbSeek(xFilial("SC6") + SC5->C5_NUM) )
			if !empty(SC6->C6_NOTA) //ja faturado
				lOk := .F. //não processa, pula pedido
				cNFAux += SC6->C6_NOTA+"/"+SC6->C6_SERIE + " "
			endif
		endif

		//verifica liberação do pedido
		if lOk
			aPvlNfs := {}
			aBloqueio := {}
			Ma410LbNfs( 2, @aPvlNfs, @aBloqueio )
			Ma410LbNfs( 1, @aPvlNfs, @aBloqueio )
			if !empty(aBloqueio) .OR. !empty(SC5->C5_BLQ)
				aPvlNfs := {}
				aBloqueio := {}
				Ma410LbNfs(2,@aPvlNfs,@aBloqueio) //tenta liberar
				Ma410LbNfs(1,@aPvlNfs,@aBloqueio) //verifica se há bloqueios
				if !empty(aBloqueio) .OR. !empty(SC5->C5_BLQ)
//					LiberarPV(aPvOri[nX],@aPvlNfs) //retirado funcao original
					sc5->(DBSeek(xFilial("SC5") + aPVIn[nX]) )
					//cMsgLog := "Pedido "+SC5->C5_NUM+" com algum bloqueio de crédito ou estoque. Operação Abortada!"
					//cLogPro += "Pedido "+SC5->C5_NUM+" com algum bloqueio de crédito ou estoque. Operação Abortada!"+CRLF
					//DisarmTransaction()
					//lOk := .F.
					//EXIT
				endif
			else	
//				LiberarPV(aPVIn[nX],@aPvlNfs) //retirado funcao original
				sc5->(DBSeek(xFilial("SC5") + aPVIn[nX]) )
			endif
		endif

		if lOK
			if !Empty(aPvlNfs)
				//ALTERADO A PEDIDO DA MOCOCA, PARA EVITAR ERROS DE USUARIO SELECIONAR SERIE ERRADA.
				//AGORA IRÁ PEGAR DOS PARMETROS FT_SERTRSF OU FT_STRSFAF, SE PREENCHIDOS
				If !empty(cSerie) .OR. Sx5NumNota(@cSerie,SuperGetMV("MV_TPNRNFS")) //para escolher numero da NF
					// Declarei as variáveis para lembrar o que é cada posição da função MaPvlNfs.
					lMostraCtb   := .F.
					lAglutCtb    := .F.
					lCtbOnLine   := .F.
					lCtbCusto    := .F.
					lReajuste    := .F.
					nCalAcrs     := 0
					nArredPrcLis := 0
					lAtuSA7      := .T.
					lECF         := .F.

					cNota := MaPvlNfs(aPvlNfs, cSerie, lMostraCtb, lAglutCtb, lCtbOnLine, lCtbCusto, lReajuste, nCalAcrs, nArredPrcLis, lAtuSA7, lECF)
					if !empty(cNota)
						//aAreaf2 := sf2->(GetArea())
						sf2->(dBseek(xFilial('SF2') + cNota+cSerie +sc5->(c5_cliente+c5_lojacli) ))
						//Contratos
						U_RFATE010(0)

						//INFORMAR O PESO E VOLUME NA NOTA APENAS DOS ITENS FATURADOS
						U_RFATE014()

						//sf2->(RestArea(aAreaf2))

						cNota := PadR(cNota, TamSX3("F2_DOC")[1])
						aAdd(aNotas, {cNota, cSerie, " ", "",{}} ) //adiciono a nota no vetor de notas fiscais
						cNFAux += cNota+"/"+cSerie + " "
					else
						cMsgLog := "Falha ao gerar Documento Saída sobre o Pedido "+SC5->C5_NUM+". Operação Abortada! (MaPvlNfs)"
						cLogPro += "Falha ao gerar Documento Saída sobre o Pedido "+SC5->C5_NUM+". Operação Abortada! (MaPvlNfs)"+CRLF
						//DisarmTransaction()
						lOk := .F.
						EXIT
					endif

					RecLock('SF2',.f.)
					SF2->F2_TRANSP := cTranspDAK
					SF2->(MsUnLock())

				else
					cMsgLog := "Falha ao gerar Documento Saída sobre o Pedido "+SC5->C5_NUM+". Operação Abortada! (Sx5NumNota)"
					cLogPro += "Falha ao gerar Documento Saída sobre o Pedido "+SC5->C5_NUM+". Operação Abortada! (Sx5NumNota)"+CRLF
					//DisarmTransaction()
					lOk := .F.
					EXIT
				endif
			else
				cMsgLog := "Pedido "+SC5->C5_NUM+" com algum bloqueio de crédito ou estoque. Operação Abortada!"
				cLogPro += "Pedido "+SC5->C5_NUM+" com algum bloqueio de crédito ou estoque. Operação Abortada!"+CRLF
				//DisarmTransaction()
				lOk := .F.
				EXIT
			endif
		endif

	next nX

	if lOK
		//EndTran()
		//::aProcLog[nPosProc][1] := "BR_VERDE"
		//::aProcLog[nPosProc][3] := "Documento Saída gerado: " + cNFAux
		cLogPro += "Documento Saída gerado: " + cNFAux+CRLF
	else
		//::aProcLog[nPosProc][1] := "BR_VERMELHO"
		//::aProcLog[nPosProc][3] := cMsgLog
	endif

	cFilAnt := cBkpFil
	if ::lShowMsg
//		oGridLog:GoTo(nPosProc)
//		oGridLog:oBrowse:Refresh()
	else
	//	::gravaTabelaLog(::aProcLog)
	endif

Return lOk

//-----------------------------------------------------------------
//Metodo para transmissão da NFe
//-----------------------------------------------------------------
METHOD TransmiteNFe(cProcess, cFilNF, aNotas,cCodCar)  CLASS FatTriang

	Local cSerie := cDocIni := cDocFim := ""
	Local lOK := .F.
	Local nX := 0
	Local nRecSM0 := SM0->(Recno())
	Local cBkpFil := cFilAnt
	Default cLogPro := ''
	cFilAnt := cFilNF
	SM0->( dbSeek( cEmpAnt + cFilAnt ) )

	For nX := 1 to len(aNotas)
		cSerie  := aNotas[nX][2]
		cDocIni := aNotas[nX][1]
		cDocFim := aNotas[nX][1]

		SF2->(DbSetOrder(1))
		SF2->(DbSeek(xFilial("SF2")+cDocIni+cSerie ))

		//if za0->(dBseek(STR(VAL(cCodCar),10)))
		//	cTranspDAK := ZA0->ZA0_CLIENT
		//endif

		if empty(SF2->F2_FIMP) //se nao foi transmitida ainda

			u_autoNfeEnv(cEmpAnt, cFilAnt, "", "", cSerie, cDocIni, cDocFim) //Produção

			Sleep(3000) //espera 3 segundos

			if !empty(SF2->F2_FIMP)
				aNotas[nX][3] := SF2->F2_FIMP
				lOK := .T.
			endif
		endif
	next nX

	if lOK
		cLogPro += "NF-e Transmitida para SEFAZ"+CRLF
	else
		cLogPro += "Não foi possível transmitir NF-e para SEFAZ. Verifique configurações do SPED."+CRLF
	endif

	cFilAnt := cBkpFil
	SM0->(DbGoTo(nRecSM0))

Return lOK

//-----------------------------------------------------------------
//Metodo para monitorar a transmissão/retorno SEFAZ da NFe
//-----------------------------------------------------------------
METHOD MonitorarNFe(cProcess, cFilNF, aNotas) CLASS FatTriang
	//Local nPosProc := aScan(::aProcLog, {|x| x[4] == cProcess})
	Local lOK 			:= .F.
	Local cBkpFil 		:= cFilAnt
	Local nRet 			:= 1, nVezes := 5, nX := 0
	Local cMsgRet 		:= ""
	Local nRecSM0 		:= SM0->(Recno())
	Local nRecSF2 		:= 0
	local cUrl			:= Padr( GetNewPar("MV_SPEDURL",""), 250 )
	Local aParam   		:= {}
	Local cParNfeRem	:= ""
	local aPerg 		:= {}
	local cIdEnt 		:= ""
	local cAviso 		:= ""
	Default aNotas 		:= {}
	Default cLogPro		:= ''
	Default lCarcSaf2   := .f.

	cFilAnt := cFilNF
	SM0->( dbSeek( cEmpAnt + cFilAnt ) )
	cParNfeRem := SM0->M0_CODIGO+SM0->M0_CODFIL+"SPEDNFEREM"
	cIdEnt := RetIdEnti()

	while nRet == 1

		nQtd := 0
		For nX := 1 to len(aNotas)

			SF2->(DbSetOrder(1))
			SF2->(DbSeek(xFilial("SF2")+aNotas[nX][1]+aNotas[nX][2] ))
			nRecSF2 := SF2->(Recno())

			//monitora NF-e
			if ::lShowMsg
				SpedNFe6Mnt(SF2->F2_SERIE,SF2->F2_DOC,SF2->F2_DOC,,,,,.T./*lAutoColab*/)
			else
				aParam   := {SF2->F2_SERIE,SF2->F2_DOC,SF2->F2_DOC,CtoD(""),CtoD("")}
				aPerg    := {}
				aadd(aPerg,{1, "Serie da Nota Fiscal" ,aParam[01],"",".T.","",".T.",30,.F.})
				aadd(aPerg,{1,SF2->F2_DOC,aParam[02],"",".T.","",".T.",30,.T.})
				aadd(aPerg,{1,SF2->F2_DOC,aParam[03],"",".T.","",".T.",30,.T.})
				aadd(aPerg,{1, "Dt. Emissão De"	,aParam[04],"@R 99/99/9999",".T.","",".T.",50,.F.})
				aadd(aPerg,{1,"Dt. Emissão Até"	,aParam[05],"@R 99/99/9999",".T.","",".T.",50,.F.})

				dDataDe := aParam[04] := ParamLoad(cParNfeRem,aPerg,4,aParam[04])
				dDataAte := aParam[05] := ParamLoad(cParNfeRem,aPerg,5,aParam[05])

				aRetorno := procMonitorDoc(cIdEnt, cUrl, aParam, 1, "55", .F., @cAviso)
				aNotas[nX][5]:= aClone(aRetorno)

			endif

			SF2->(DbGoTo(nRecSF2)) //posiciono novamente, para garantir

			if empty(SF2->F2_FIMP) .OR. SF2->F2_FIMP == 'T' //verifico
				nQtd++
			endif

		next nX

		if nQtd == 0
			EXIT //finalizou todas
		endif
		If !lCarcSaf2
			nRet := Aviso("Aguarde...Monitorando nota(s)", "De " + cValToChar(len(aNotas)) + " nota(s) falta obter retorno de " + cValToChar(nQtd) + " nota(s). "+CRLF+"Aguarde alguns segundos e faça a checagem novamente.", iif(nVezes<=0,{"Checar", "Sair"},{"Checar"}),2)
		Endif
		nVezes-- //controle de escape do laço
	enddo

	For nX := 1 to len(aNotas)
		SF2->(DbSetOrder(1))
		SF2->(DbSeek(xFilial("SF2")+aNotas[nX][1]+aNotas[nX][2] ))

		aNotas[nX][4] := SF2->F2_CHVNFE

		if SF2->F2_FIMP <> "S" //se nao autorizada
			cMsgRet += "NF: "+aNotas[nX][1]+"/"+aNotas[nX][2]+" NÃO autorizada! " + iif(!empty(aNotas[nX][5]), aNotas[nX][5][5]+"-"+aNotas[nX][5][6],"")
			if ::lShowMsg .and. MsgYesNo("Nota nao autorizada! Deseja ver tela monitor?")
				//monitora NF-e
				SpedNFe6Mnt(SF2->F2_SERIE,SF2->F2_DOC,SF2->F2_DOC,,,,,,.T./*lExibTela*/)
			endif
		endif
	next nX

	if empty(cMsgRet)
		lOk := .T. //todas autorizadas
		//::aProcLog[nPosProc][1] := "BR_VERDE"
		//::aProcLog[nPosProc][3] := "NF-e Autorizadas pelo SEFAZ"
		cLogPro += "NF-e Autorizadas pelo SEFAZ"+CRLF
	else
		//::aProcLog[nPosProc][1] := "BR_VERMELHO"
		//::aProcLog[nPosProc][3] := cMsgRet+"Verifique na rotina NF-e Sefaz."
		cLogPro += cMsgRet+"Verifique na rotina NF-e Sefaz."+CRLF
	endif

	cFilAnt := cBkpFil
	SM0->(DbGoTo(nRecSM0))

	if ::lShowMsg
//		oGridLog:GoTo(nPosProc)
//		oGridLog:oBrowse:Refresh()
	else
		//	::gravaTabelaLog(::aProcLog)
	endif

Return lOK

//-----------------------------------------------------------------
//Metodo para impressao da DANFE
//-----------------------------------------------------------------
METHOD ImpDANFE(cProcess, cFilNF, aNotas,cCodCar) CLASS FatTriang
	Local lOK := .T.
//	Local nPosProc := aScan(::aProcLog, {|x| x[4] == cProcess})
	Local cBkpFil := cFilAnt
	Local cMsgRet := ""
	Local nRecSM0 := SM0->(Recno())
	Local cDocIni := cDocFim := cSerie := ""
	Local nX := 0
	local cEntidade := ""
	local oDanfe        := Nil
	local oSetup        := Nil
	local lFile         := .F.
	local lIsLoja       := .F.
	local cProg		    := iif(existBlock("DANFEProc"),"U_DANFEProc",iif(isRdmPad("DANFEProc"),"DANFEProc", ""))
	Local lDanfe        := !empty(cProg)
	local nTimes        := 0
	local lExistNfe     := .F.
	Private aFilBrw := {"SF2",".T."}
	Default lCarcSaf2   := .f.

	cFilAnt := cFilNF
	sm0->( dbSeek( cEmpAnt + cFilAnt ) )
	cEntidade := RetIdEnti()

	For nX := 1 to len(aNotas)
		SF2->(DbSetOrder(1))
		SF2->(DbSeek(xFilial("SF2")+aNotas[nX][1]+aNotas[nX][2] ))

		if SF2->F2_FIMP == "S" //se nao autorizada

			cDocIni := iif(empty(cDocIni),SF2->F2_DOC,iif(SF2->F2_DOC < cDocIni, SF2->F2_DOC, cDocIni))
			cDocFim := iif(empty(cDocFim),SF2->F2_DOC,iif(SF2->F2_DOC > cDocFim, SF2->F2_DOC, cDocFim))
			cSerie  := SF2->F2_SERIE

		endif
	next nX

	if !empty(cDocIni+cDocFim)

		Pergunte("NFSIGW",.F.)

		SetMVValue("NFSIGW","MV_PAR01",cDocIni)
		SetMVValue("NFSIGW","MV_PAR02",cDocFim)
		SetMVValue("NFSIGW","MV_PAR03",cSerie)
		if dDataBase < MV_PAR07 .OR. dDataBase > MV_PAR08
			SetMVValue("NFSIGW","MV_PAR07",dDataBase)
			SetMVValue("NFSIGW","MV_PAR08",dDataBase)
		endif
		if ::lShowMsg
			SpedDanfe()
		else
			oDANFE := FWMSPrinter():New(cFilAnt+"_"+cDocIni+"_"+cDocFim, IMP_PDF, .F. /*lAdjustToLegacy*/,::cPathDanfe/*cPathInServer*/,.T.,/*lTReport*/,/*oPrintSetup*/,/*cPrinter*/,/*lServer*/,/*lPDFAsPNG*/,/*lRaw*/,.F.,/*nQtdCopy*/)
			oDanfe:SetResolution(78)
			oDanfe:SetPortrait()
			oDanfe:SetPaperSize(DMPAPER_A4)
			oDanfe:SetMargin(60,60,60,60)
			oDanfe:lServer := .T.
			oDanfe:nDevice := IMP_PDF
			oDanfe:cPathPDF := ::cPathDanfe
			oDANFE:SetCopies( 1 )

			oDanfe:lInJob := .T.
			If !lDanfe
				//PRTMSG( "Fonte de impressao de DANFE nao compilado! Acesse o portal do cliente, baixe os fontes DANFEII.PRW, DANFEIII.PRW e compile em seu ambiente", LOG_ERROR )
				return .T.
			Else
				&cProg.(@oDanfe, nil, cEntidade, nil, nil, @lExistNfe, lIsLoja)
				if !oDanfe:Preview()
					//PRTMSG( "Nao foi possivel gerar a DANFE para Empresa: "+ cEmpresa + cFilial + " nota: " + alltrim(cNFE_ID), LOG_PRINT )
					return("")
				EndIf
				if !lExistNfe
					//PRTMSG( "Nao foi gerado a DANFE para Empresa: "+ cEmpresa + cFilial + " nota: " + alltrim(cNFE_ID), LOG_ERROR )
					return ("")
				endif
			EndIf

			cArquivo    := ::cPathDanfe+cFilAnt+"_"+cDocIni+"_"+cDocFim+".pdf"

			while( !lFile.or. nTimes < 10)
				lFile := file(cArquivo)
				if(!lFile)
					nTimes++
					sleep(500)
				else
					exit
				endif
			end
			if !lFile
				cMsgRet := "DANFEs Não Impressas. Imprimir manualmente."
			endif

			fwFreeObj(oSetup)
			fwFreeObj(oDanfe)

			oSetup := nil
			oDanfe := nil

		endif
	else
		cMsgRet := "DANFEs Não Impressas. Imprimir manualmente."
	endif

	if empty(cMsgRet)
		//::aProcLog[nPosProc][1] := "BR_VERDE"
		//::aProcLog[nPosProc][3] := "DANFEs Impressas"
	else
		//::aProcLog[nPosProc][1] := "BR_VERMELHO"
		//::aProcLog[nPosProc][3] := cMsgRet
	endif

	cFilAnt := cBkpFil
	SM0->(DbGoTo(nRecSM0))

	if ::lShowMsg
//		oGridLog:GoTo(nPosProc)
//		oGridLog:oBrowse:Refresh()
	else
		//	::gravaTabelaLog(::aProcLog)
	endif

Return lOk

//-----------------------------------------------------------------
//Metodo para gerar documento de entrada
//-----------------------------------------------------------------
METHOD GerarDocEntrada(cProcess, cFilDoc, cFilOri, aNFSaida, aNFEntra) CLASS FatTriang

	Local lOK := .F.
	Local cBkpFil := cFilAnt
	Local cLocTrf, lCtrEnd, cEndTrf
	Local cForn := "", cLoj := "", cMsgRet := "", cNFAux := ""
	Local nX := 0
	Local aCab := {}, aIte := {}, aAux := {}
	Local aCEnd := {}, aIEnd := {}
	Local cSeq := "0000"
	Local lPreNota := .F.
	Local lAuxPreNF := .F. //indica se tem pre nota no geral
	Local nRecSDA := 0
	Local aAreaSD1
	Local cMsgChv := ""

	Default aNFEntra := {}

	cFilAnt := cFilDoc

	//verificando parametros
	cLocTrf := SuperGetMv("FT_LOCTRF",,"") //Define local de estoque a ser considerado no doc de entrada, no processo de transferência. Preencher por filial.
	lCtrEnd := GetMV("MV_LOCALIZ",, "N") == "S"
	cEndTrf := SuperGetMv("FT_ENDTRF",,"") //Define endereço de estoque a ser considerado no doc de entrada, no processo de transferência. Preencher por filial.

	if ::PosForFil(cFilOri, @cForn, @cLoj)

		lOk := .T.

		if lCtrEnd .AND. empty(cEndTrf)
			cMsgRet := "Parametro FT_ENDTRF não configurado corretamente!"
			cLogPro += "Parametro FT_ENDTRF não configurado corretamente!"+CRLF
			lOk := .F.
		endif

		if lOk

			BeginTran()
			lOk := .F.  //Define .F. para processar Claudio 11.01.18
			For nX := 1 to len(aNFSaida)

				aCab := {}
				aIte := {}
				cSeq := "0000"
				lPreNota := .F.
// Melhoria para enviar o ID de triangulação para a nota de entrada 29.01.2018
// Alexandre e Tarcisio
				if empty(aNFSaida[nX][4])

					aNFSaida[nX][4] := SF2->F2_XIDTRI

				endif
// Fim
				if empty(aNFSaida[nX][4])
					if empty(aNFSaida[nX][4])
						cMsgChv+="NFe "+aNFSaida[nX][1]+"/"+aNFSaida[nX][2]+" sem Chave; "
						LOOP
					endif
					LOOP
				endif

				//verifico se ja gerou nota da chave, se sim, pula
				SF1->(DbSetOrder(8)) //F1_FILIAL+F1_CHVNFE
				if !SF1->(DbSeek(xFilial("SF1")+aNFSaida[nX][4] ))

					//vou para filial de origem para montar vetores execauto
					cFilAnt := cFilOri

					//posiciono na NF saída
					SF2->( dbSetOrder(1) )
					SF2->( dbSeek(xFilial("SF2") + aNFSaida[nX][1] + aNFSaida[nX][2]) )

					aAdd(aCab, {"F1_TIPO"   , "N"                               , nil})
					aAdd(aCab, {"F1_FORMUL" , "N"                               , nil})
					aAdd(aCab, {"F1_DOC"    , StrZero(Val(SF2->F2_DOC),9)       , nil})
					aAdd(aCab, {"F1_SERIE"  , SF2->F2_SERIE                     , nil})
					aAdd(aCab, {"F1_EMISSAO", SF2->F2_EMISSAO                   , nil})
					aAdd(aCab, {"F1_FORNECE", cForn								, nil})
					aAdd(aCab, {"F1_LOJA"   , cLoj								, nil})
					If ::GetTipoCarga() <> 'E'
						aAdd(aCab, {"F1_ESPECIE", "SPED"                            , nil})
					Else
						aAdd(aCab, {"F1_ESPECIE", "NF"                            , nil})
					Endif
					aAdd(aCab, {"F1_COND"	, SF2->F2_COND                      , nil})
					aAdd(aCab, {"F1_CHVNFE" , iif(!Empty(SF2->F2_CHVNFE),SF2->F2_CHVNFE,SF2->F2_XIDTRI) , nil}) //Claudio Utiliza o ID para NF sem chave
					aAdd(aCab, {"F1_XIDTRI" , SF2->F2_XIDTRI                    , nil})

					SD2->( dbSetOrder(3) )
					SD2->( dbSeek(SF2->F2_FILIAL+SF2->F2_DOC+SF2->F2_SERIE+SF2->F2_CLIENTE+SF2->F2_LOJA) )
					while SD2->(!EOF()) .And. SD2->D2_FILIAL+SD2->D2_DOC+SD2->D2_SERIE+SD2->D2_CLIENTE+SD2->D2_LOJA == SF2->F2_FILIAL+SF2->F2_DOC+SF2->F2_SERIE+SF2->F2_CLIENTE+SF2->F2_LOJA
						aAux := {}
						cSeq  := soma1(cSeq)

						SF4->( dbSetOrder(1))
						SF4->( dbSeek(xFilial("SF4") + SD2->D2_TES) )
						if empty(SF4->F4_XTESTRF)
							lPreNota := .T.
							lAuxPreNF := .T.
						endif

						//aAdd(aAux, {"D1_ITEM"   , cSeq           , nil}) //ajuste realizado para corrigir a entrada na filial destino
						//aAdd(aAux, {"D1_ITEM"   , SD2->D2_ITEM     , nil}) //ajuste abaixo realizado para corrigir triangulação aonde SD2 campo Item tamanho 2 e na SD1 campo Item tamanho 4 gerando problemas no custo incluimos zeros.
						aAdd(aAux,{"D1_ITEM"	,StrZero(Val(SD2->D2_ITEM),TamSx3("D1_ITEM")[1]),Nil}) // 17/04/19  Transferência entre Filiais MATR715	 NF 000139266 Filial 0104 para 0105
						aAdd(aAux, {"D1_COD"    , SD2->D2_COD    , nil})
						aAdd(aAux, {"D1_UM"    , SD2->D2_UM     , nil})
						aAdd(aAux, {"D1_QUANT"  , SD2->D2_QUANT  , nil})
						aAdd(aAux, {"D1_TES"    , SF4->F4_XTESTRF, nil})
						aAdd(aAux, {"D1_VUNIT"  , SD2->D2_PRCVEN , nil})
						aAdd(aAux, {"D1_TOTAL"  , SD2->D2_TOTAL  , nil})
						if empty(cLocTrf)
							aAdd(aAux, {"D1_LOCAL" , SD2->D2_LOCAL    , nil})
						else
							aAdd(aAux, {"D1_LOCAL", cLocTrf		 , nil})
						endif
						aAdd(aAux, {"D1_LOTECTL", SD2->D2_LOTECTL, nil})
						aAdd(aAux ,{"D1_DTVALID", SD2->D2_DTVALID, nil})
						aAdd(aAux ,{"D1_XTFIORI", SD2->D2_XTFIORI, nil})  // cFilOri       //"SD2->D2_XTFIORI"
						aAdd(aAux ,{"D1_XTPVORI", SD2->D2_XTPVORI, nil})
						aAdd(aAux ,{"D1_XTITORI", SD2->D2_XTITORI, nil})

						aAdd(aIte, aClone(aAux))

						SD2->( dbSkip() )
					enddo

					Private lMsErroAuto := .F.

					//vou para filial de destino para gravaçao
					cFilAnt := cFilDoc

					SF1->(dbSetOrder(1))
					if lPreNota
						MSExecAuto({|x, y, z| MATA140(x, y, z)}, aCab, aIte, 3) //pré-nota
					else
						MSExecAuto({|x, y, z| MATA103(x, y, z)}, aCab, aIte, 3) //doc classificado
					endif

					if lMsErroAuto
						MostraErro()

						//verifico se mesmo com erros incluiu o documento
						SF1->( dbSetOrder(1) ) //F1_FILIAL+F1_DOC+F1_SERIE+F1_FORNECE+F1_LOJA+F1_TIPO
						if !SF1->( dbSeek(xFilial("SF1") + aNFSaida[nX][1] + aNFSaida[nX][2] + cForn + cLoj) )
							lOk := .F.
							cNFAux := ""
							cMsgRet := "Falha ao incluir documento de entrada."
							cLogPro += "Falha ao incluir documento de entrada."+CRLF
							DisarmTransaction()
							EXIT
						endif
					else
						lOk := .T.  //Define .T se Ok Claudio 11.01.18
					endif
					if lOk
						aadd(aNFEntra, {SF1->F1_DOC, SF1->F1_SERIE, SF1->F1_FORNECE, SF1->F1_LOJA, SF1->F1_CHVNFE} )
						if lPreNota
							cMsgRet := "Documento de Entrada gerado: "
						endif
						cNFAux += SF1->F1_DOC + "/" + SF1->F1_SERIE + iif(lPreNota," (Pré-Nota) "," ")
					endif
				else
					cNFAux += SF1->F1_DOC + "/" + SF1->F1_SERIE
				endif

				if lOk

					// Endereçando os produtos.
					if lCtrEnd .AND. !lPreNota

						SD1->( dbSetOrder(1)) //D1_FILIAL+D1_DOC+D1_SERIE+D1_FORNECE+D1_LOJA+D1_COD+D1_ITEM
						SD1->( dbSeek(SF1->F1_FILIAL+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA) )
						while ! SD1->( EOF() ) .And. SD1->D1_FILIAL+SD1->D1_DOC+SD1->D1_SERIE+SD1->D1_FORNECE+SD1->D1_LOJA == SF1->F1_FILIAL+SF1->F1_DOC+SF1->F1_SERIE+SF1->F1_FORNECE+SF1->F1_LOJA

							aAreaSD1 := SD1->(GetArea())

							SB1->(DbSetOrder(1))
							SB1->(dbSeek(xFilial("SB1") + SD1->D1_COD) )
							if SB1->B1_LOCALIZ <> "S"
								SD1->( dbSkip() )
								LOOP
							endif

							//verifico se o saldo ficou a endereçar realmente
							SDA->(DbSetOrder(1)) //DA_FILIAL+DA_PRODUTO+DA_LOCAL+DA_NUMSEQ
							if SDA->(DBSeek(xFilial("SDA")+SD1->D1_COD+SD1->D1_LOCAL+SD1->D1_NUMSEQ )) .AND. SDA->DA_SALDO > 0

								//alert("Tenta Endereçar: " + SD1->D1_COD+SD1->D1_LOCAL+SD1->D1_NUMSEQ)
								nRecSDA := SDA->(Recno())

								//Tratamento para endereço nao ficar com status de ocupado
								SBE->(DbSetOrder(1)) //BE_FILIAL+BE_LOCAL+BE_LOCALIZ+BE_ESTFIS
								if SBE->(DbSeek(xFilial("SBE")+SD1->D1_LOCAL+Alltrim(cEndTrf) )) .AND. SBE->BE_STATUS == "2"
									Reclock("SBE", .F.)
									SBE->BE_STATUS := '1' //forço ser desocupado
									SBE->(MsUnlock())
								endif

								//cabeçalho
								aCEnd := {  {"DA_FILIAL" , xFilial("SDA") , nil},;
									{"DA_PRODUTO", SD1->D1_COD    , nil},;
									{"DA_LOCAL"  , SD1->D1_LOCAL  , nil},;
									{"DA_NUMSEQ" , SD1->D1_NUMSEQ , nil} }

								//itens
								aIEnd := {}
								aAdd(aIEnd, {   {"DB_FILIAL" , xFilial("SDB"), nil},;
									{"DB_ITEM"   , "0001"        , nil},;
									{"DB_ESTORNO", " "			 , nil},;
									{"DB_DATA"   , dDataBase     , nil},;
									{"DB_LOCALIZ", Padr(cEndTrf,TamSx3("DB_LOCALIZ")[1])       , nil},; //{"DB_NUMSERI", ""            , nIL},;
									{"DB_QUANT"  , SDA->DA_SALDO , nil}})

								lMsErroAuto := .F.
								MsExecAuto({|x, y, z| MATA265(x, y, z)}, aCEnd, aIEnd, 3)

								IF lMsErroAuto
									lOk := .F.
									MostraErro()
									cNFAux := ""
									cMsgRet := "Problemas ao endereçar os produtos da nota de entrada."
									cLogPro += "Problemas ao endereçar os produtos da nota de entrada."+CRLF
									DisarmTransaction()
									EXIT
								ENDIF

								SDA->(DbGoTo(nRecSDA))
								if SDA->DA_SALDO > 0
									lOk := .F.
									cNFAux := ""
									cMsgRet := "Problemas ao endereçar os produtos da nota de entrada."
									cLogPro += "Problemas ao endereçar os produtos da nota de entrada."+CRLF
									DisarmTransaction()
									EXIT
								endif
							endif

							RestArea(aAreaSD1)

							SD1->( dbSkip() )
						enddo
					endif

					if !lOk //saio do laço for
						EXIT
					endif

				endif

			Next nX

			if lOk
				EndTran()
				if lAuxPreNF
					cNFAux += " >> Classifique manualmente"
					if lCtrEnd
						cNFAux += " e aponte saldo a endereçar dos produtos habilitados"
					endif
					cNFAux += "."
				endif
			else
				DisarmTransaction()
			endif
		endif
	elseif lOk
		cMsgRet := "Fornecedor da filial "+cFilOri+" não encontrado para geração do Doc.Entrada!"
		cLogPro += "Fornecedor da filial "+cFilOri+" não encontrado para geração do Doc.Entrada!"+CRLF
		lOk := .F.
	endif

	if lOk .AND. !lAuxPreNF
		//	::aProcLog[nPosProc][1] := "BR_VERDE"
		//	::aProcLog[nPosProc][3] := "Documento de Entrada gerado: " + cNFAux
	else
		lOk := .F.
		//	::aProcLog[nPosProc][1] := "BR_VERMELHO"
		//	::aProcLog[nPosProc][3] := cMsgRet + cNFAux + cMsgChv
	endif

	cFilAnt := cBkpFil

	if ::lShowMsg
//		oGridLog:GoTo(nPosProc)
//		oGridLog:oBrowse:Refresh()
	else
		//	::gravaTabelaLog(::aProcLog)
	endif

Return lOk

//-----------------------------------------------------------------
//Metodo para gerar Pedido de Venda intermediario
//-----------------------------------------------------------------
METHOD GerarPVInt(cProcess) CLASS FatTriang

	Local lOK := .T.
	Local nX := 1
	Local cCli, cLoj, cCondPg, cC6Oper, cTipPrc, cTabPrc, nIndPrc
//	Local nPosProc := aScan(::aProcLog, {|x| x[4] == cProcess})
	Local cBkpFil := cFilAnt
	Local cPVAux := ""
	Local aCabAuto := {}
	Local aIteAuto := {}
	Local aAux := {}
	Local cItem := replicate("0", tamSX3("C6_ITEM")[1])
	Local cSeq := "0000"
	Local nPrcUnit := 0, nPrcOrig := 0
	Local aRecSC5 := {}
	Local c_TpCrg := ' '
	Local c_Tes := ' '

	//mudo a filial
	cFilAnt := ::cFilInt

	cCondPg := SuperGetMv("FT_CDPAGFI",,"")
	cC6Oper := SuperGetMv("FT_OPERFI",,"")
	cTipPrc := SuperGetMv("FT_TPPRCFI",,"2")//1-tabela de preço;2-Custo SB2;3-Custo SB9;4-% do Preço de Venda Origem
	cTabPrc := SuperGetMv("FT_TABPFI",,"")
	nIndPrc := SuperGetMv("FT_INDPRFI",,0)

	//	c_TpCrg := GetTipoCarga()
	//
	//	If c_TpCrg = 'E'
	//		cC6Oper := SuperGetMv("FT_OPFIE",,"",::cFilEst)
	//	ElseIf c_TpCrg = 'F'
	//		cC6Oper := SuperGetMv("FT_OPFIF",,"",::cFilEst)
	//	EndIf


	if lOk .AND. empty(cCondPg)
		cMsgRet := "Condição de pagamento não parametrizada. Parametro: FT_CDPAGFI "
		lOk := .F.
	endif

	if lOk .AND. !empty(cCondPg) .AND. empty(Posicione("SE4",1,xFilial("SE4")+cCondPg,"E4_CODIGO"))
		cMsgRet := "Condição de Pagamento não encontrada na filial "+cFilAnt+"."
		lOk := .F.
	endif

	if lOk .AND. empty(cC6Oper)
		cMsgRet := "Tipo Operação não parametrizado. Parametro: FT_OPERFI "
		lOk := .F.
	endif

	if lOk .AND. cTipPrc == "1" .AND. empty(cTabPrc) //se tabela de preço não preenchido
		cMsgRet := "Tabela de preço não parametrizada. Parametro: FT_TABPFI "
		lOk := .F.
	endif

	if lOk .AND. cTipPrc == "1" .AND. empty(Posicione("DA0",1,xFilial("DA0")+cTabPrc,"DA0_CODTAB"))
		cMsgRet := "Tabela de preço não encontrada na filial "+cFilAnt+"."
		lOk := .F.
	endif

	if lOK
		BeginTran()

		//posiciona no cliente da filial que será usado no pedido
		if ::PosCliFil(::cFilVen, @cCli, @cLoj)

			aAdd(aCabAuto, {"C5_TIPO"   , "N"           , nil}) // TIPO DO PEDIDO
			aAdd(aCabAuto, {"C5_CLIENTE", cCli          , nil}) // CÓDIGO DO CLIENTE
			aAdd(aCabAuto, {"C5_LOJACLI", cLoj          , nil}) // LOJA DO CLIENTE
			aAdd(aCabAuto, {"C5_EMISSAO", dDataBase     , nil}) // DATA DE EMISSÃO
			aAdd(aCabAuto, {"C5_CONDPAG", cCondPg    	, nil}) // CONDIÇÃO
			aAdd(aCabAuto, {"C5_TIPLIB", "2"    		, nil}) // libera por item
			aAdd(aCabAuto, {"C5_XIDTRI" , ::GetIdTriang() , nil}) // ID TRIANGULAÇÂO

			for nX := 1 to len(::aSF1_FI)

				cItem := replicate("0", tamSX3("C6_ITEM")[1])
				aIteAuto := {}

				//montando itens
				SD1->(DbSetOrder(1)) //D1_FILIAL+D1_DOC+D1_SERIE+D1_FORNECE+D1_LOJA+D1_COD+D1_ITEM
				SD1->(DbSeek(xFilial("SF1")+::aSF1_FI[nX][1]+::aSF1_FI[nX][2]+::aSF1_FI[nX][3]+::aSF1_FI[nX][4] ))
				While SD1->(!Eof()) .AND. SD1->D1_FILIAL+SD1->D1_DOC+SD1->D1_SERIE+SD1->D1_FORNECE+SD1->D1_LOJA == xFilial("SF1")+::aSF1_FI[nX][1]+::aSF1_FI[nX][2]+::aSF1_FI[nX][3]+::aSF1_FI[nX][4]

					//verifica se o item não está em algum pedido nesta filial
					//COMENTADO POIS TUDO QUE TEM NA SD1 DEVE IR PARA O PEDIDO, OBRIGATORIAMENTE
					//if ::VldItemTrf(SD1->D1_XTFIORI+SD1->D1_XTPVORI+SD1->D1_XTITORI, ::cFilInt)

					aAux := {}
					cItem := soma1(cItem)

					//preço original na FV
					nPrcOrig := Posicione("SC6",1,SD1->D1_XTFIORI+SD1->D1_XTPVORI+SD1->D1_XTITORI,"C6_PRCVEN")
					//se tipo preço é % sobre preço origem, pego aliquota do cadastro SB1
					if cTipPrc=="4"
						nIndPrc := Posicione("Z06",1,xFilial("Z06")+SD1->D1_COD,"Z06_INDICE")
					endif
					nPrcUnit := ::GetPrcUnit(cTipPrc, cTabPrc, SD1->D1_COD, nPrcOrig, nIndPrc )

					c_Tes := U_MaTesInt(2,cC6Oper,cCli,cLoj,"C",SC6->C6_PRODUTO,"C6_TES")

					c_TpCrg := ::GetTipoCarga()

					If c_TpCrg = 'E'
						c_Tes := Posicione("SF4",1, xFilial("SF4") + c_Tes, "F4_XTESEST")
					ElseIf c_TpCrg = 'F'
						c_Tes := Posicione("SF4",1, xFilial("SF4") + c_Tes, "F4_XTESFIN")
					EndIf

					aAdd(aAux, {"C6_ITEM"   , cItem                       			, nil}) //  ITEM DO PEDIDO
					aAdd(aAux, {"C6_PRODUTO", SD1->D1_COD             				, nil}) //  CÓDIGO DO PRODUTO
					aAdd(aAux, {"C6_QTDVEN" , SD1->D1_QUANT              			, nil}) //  QUANTIDADE VENDIDA
					aAdd(aAux, {"C6_PRCVEN" , NoRound(nPrcUnit,2)   				, nil}) //  PREÇO DE VENDA
					aAdd(aAux, {"C6_VALOR"  , NoRound(SD1->D1_QUANT * NoRound(nPrcUnit,2),2) , nil}) //  VALOR TOTAL

					If c_TpCrg <> ' '
						aAdd(aAux, {"C6_TES"   , c_Tes                     			, nil}) //  TES
					Else
						aAdd(aAux, {"C6_OPER"   , cC6Oper                     			, nil}) //  TIPO OPERAÇÂO TRANSFERENCIA
					Endif

					aAdd(aAux, {"C6_LOCAL"  , SD1->D1_LOCAL                			, nil}) //  FILLIAL PEDIDO DE ORIGEM
					aAdd(aAux, {"C6_XTFIORI", SD1->D1_XTFIORI              			, nil}) //  FILLIAL PEDIDO DE ORIGEM
					aAdd(aAux, {"C6_XTPVORI", SD1->D1_XTPVORI              			, nil}) //  NUMERO PEDIDO DE ORIGEM
					aAdd(aAux, {"C6_XTITORI", SD1->D1_XTITORI              			, nil}) //  ITEM PEDIDO DE ORIGEM
					aadd(aAux, {"C6_QTDLIB" , SD1->D1_QUANT							, nil}) //  LIBERAÇAO ESTOQUE AUTOMATICA
					if c_TpCrg = 'E'
						aadd(aAux, {"C6_LOTECTL", SD1->D1_LOTECTL						, nil}) //  LOTE PRODUTO
						aadd(aAux, {"C6_DTVALID", SD1->D1_DTVALID						, nil}) //  VALIDADE LOTE
					endif

					aAdd(aIteAuto, aClone(aAux) )

					//endif

					SD1->(DbSkip())
				enddo

				if !empty(aIteAuto)
					Private lMsErroAuto := .F.

					MSExecAuto({|x,y,z| Mata410(x,y,z)}, aCabAuto, aIteAuto, 3)

					If lMsErroAuto
						if !::VerifIncPV(::cFilInt)
							DisarmTransaction()
							lOk := .F.
							cMsgRet := "Falha execauto inclusão do pedido de vendas!"
							MostraErro()
							EXIT
						endif
					endif

					if lOk

						aadd(aRecSC5, SC5->(Recno()))
						aadd(::aPvNfFI, SC5->C5_NUM )
						cPVAux += SC5->C5_NUM + " "

						//itens
						SB1->(DbSetOrder(1))
						SC6->(DbSetOrder(1))
						SC6->(DbSeek(SC5->C5_FILIAL + SC5->C5_NUM))
						While SC6->(!Eof()) .AND. SC6->C6_FILIAL+SC6->C6_NUM == SC5->C5_FILIAL+SC5->C5_NUM

							cSeq := Soma1(cSeq)

							SB1->( dbSeek(xFilial("SB1")+SC6->C6_PRODUTO) ) //posiciono no produto

							//{"D2_ITEM","C6_PRODUTO","B1_DESC","C6_QTDVEN","C6_UM","C6_LOCAL","C6_LOTECTL","C6_LOCALIZ","C6_FILIAL","C6_NUM","C6_ITEM","C6_XTFIORI","C6_XTPVORI","C6_XTITORI"}
							aAdd(::aItNfFI , {cSeq ,;
								SC6->C6_PRODUTO,;
								SB1->B1_DESC,;
								SC6->C6_QTDVEN,;
								SC6->C6_UM,;
								SC6->C6_LOCAL,;
								SC6->C6_LOTECTL,;
								SC6->C6_LOCALIZ,;
								SC6->C6_FILIAL,;
								SC6->C6_NUM,;
								SC6->C6_ITEM,;
								SC6->C6_XTFIORI,;
								SC6->C6_XTPVORI,;
								SC6->C6_XTITORI,;
								SC6->(Recno()),;
								.F.; //deleted
							});

							SC6->(DbSkip())
						enddo

					endif
				else
					DisarmTransaction()
					cMsgRet := "Falha ao gerar montar itens do pedido."
					lOk := .F.
					EXIT
				endif

			next nX
		else
			DisarmTransaction()
			cMsgRet := "Cliente da filial "+::cFilVen+" não encontrado para geração do pedido de transferência!"
			lOk := .F.
		endif

		if lOk
			EndTran()

			//se nao liberou automatico pedidos, tenta forçar liberar
			for nX := 1 to len(aRecSC5)
				SC5->(DbGoTo(aRecSC5[nX]))
				if !::ValidBlqEst({SC5->C5_NUM}, ::cFilInt)
					&("StaticCall(FatTriang, MATA455)") //chamo rotina de liberaçao automatica
				endif
			next nX
		endif

	endif

	if lOk
		//::aProcLog[nPosProc][1] := "BR_VERDE"
		//::aProcLog[nPosProc][3] := "Pedido de Venda gerado: " + cPVAux
	else
		//::aProcLog[nPosProc][1] := "BR_VERMELHO"
		//::aProcLog[nPosProc][3] := cMsgRet
	endif

	cFilAnt := cBkpFil

	if ::lShowMsg
//		oGridLog:GoTo(nPosProc)
//		oGridLog:oBrowse:Refresh()
	else
		//	::gravaTabelaLog(::aProcLog)
	endif

Return lOk

//-----------------------------------------------------------------
// Verifica se o item do pedido da FV ja foi transferido para a filial informada
//-----------------------------------------------------------------
METHOD VldItemTrf(cChavItem, cFilPv) CLASS FatTriang

	Local lRet := .T.
	Local cQry  := ""

	cQry := " SELECT COUNT(*) QTDPED "
	cQry += " FROM " + RetSqlName("SC6") + " SC6"
	cQry += " WHERE C6_FILIAL = '"+xFilial("SC6",cFilPV)+"'"
	cQry += "   AND SC6.D_E_L_E_T_ <> '*' "
	cQry += "   AND (C6_XTFIORI||C6_XTPVORI||C6_XTITORI) = '"+cChavItem+"' "

	If Select("QAUX") > 0
		QAUX->(dbCloseArea())
	EndIf

	cQry := ChangeQuery(cQry)

	dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUX", .F., .T.)

	if QAUX->(!Eof()) .AND. QAUX->QTDPED > 0
		lRet := .F. //item ja transferido para esta filial
	endif

	QAUX->(dbCloseArea())

Return lRet

//-----------------------------------------------------------------
//Metodo para distribuir os lotes no pedido
//-----------------------------------------------------------------
METHOD DistribuiLotes(cProcess, aSF1) CLASS FatTriang

	Local lOk := .T.
	Local aSaldos := {}
	Local nX := 0, nY := 0, nZ := 0, nPosX := 0
//	Local nPosProc := aScan(::aProcLog, {|x| x[4] == cProcess})
	Local cBkpFil := cFilAnt
	Local cEndTrf //lCtrEnd,
	Local aCarga := {}
	//Local aPvLiber := {}

	BeginTran()

	//mudo a filial
	cFilAnt := ::cFilVen
	cEndTrf := SuperGetMv("FT_ENDTRF",,"") //Define endereço de estoque a ser considerado no doc de entrada, no processo de transferência. Preencher por filial.

	//percorrendo as notas de entrada
	SD1->(DbSetOrder(1)) //D1_FILIAL+D1_DOC+D1_SERIE+D1_FORNECE+D1_LOJA+D1_COD+D1_ITEM
	for nX := 1 to len(aSF1)

		aCarga := {} //pra cada nota vejo a carga

		//montando array de saldo por lote
		SD1->(DbSeek(xFilial("SF1")+aSF1[nX][1]+aSF1[nX][2]+aSF1[nX][3]+aSF1[nX][4] ))
		While SD1->(!Eof()) .AND. SD1->D1_FILIAL+SD1->D1_DOC+SD1->D1_SERIE+SD1->D1_FORNECE+SD1->D1_LOJA == xFilial("SF1")+aSF1[nX][1]+aSF1[nX][2]+aSF1[nX][3]+aSF1[nX][4]

			if (nPosX := aScan(aSaldos, {|x| x[1]==SD1->D1_XTFIORI+SD1->D1_XTPVORI+SD1->D1_XTITORI }) ) == 0
				aadd(aSaldos, {SD1->D1_XTFIORI+SD1->D1_XTPVORI+SD1->D1_XTITORI, Nil, Nil, Nil, Nil })
				nPosX := len(aSaldos)
			endif

			if Rastro(SD1->D1_COD) .OR. Localiza(SD1->D1_COD)
				if aSaldos[nPosX][2] == Nil
					aSaldos[nPosX][2] := {}
				endif

				aadd(aSaldos[nPosX][2], {{;
					SD1->D1_LOTECTL,; //Lote
				SD1->D1_NUMLOTE,; //Sub Lote
				iif(Localiza(SD1->D1_COD),cEndTrf,""),; //Endereço
				"",; //Num.Serie
				SD1->D1_QUANT,; //Quantidade
				SD1->D1_QTSEGUM,; //Qtd Seg.UM
				SD1->D1_DTVALID,; //Validade lote
				"","","",SD1->D1_LOCAL,0 ;
					}})

			endif

			SD1->(DbSkip())
		Enddo

		//processando alteraçao lote
		//MaLibDoFat(nRegSC6,nQtdaLib,lCredito,lEstoque,lAvCred,lAvEst,lLibPar,lTrfLocal,aEmpenho,bBlock,aEmpPronto,lTrocaLot,lGeraDCF,nVlrCred,nQtdalib2)
		For nY := 1 to len(aSaldos)
			SC6->(DbSetOrder(1))
			if SC6->(DbSeek(aSaldos[nY][1]))
				//posiciono no pedido
				SC5->(DbSetOrder(1))
				SC5->(DbSeek(SC6->C6_FILIAL+SC6->C6_NUM ))

				aSaldos[nY][3] := SC5->C5_LIBEROK
				aSaldos[nY][4] := SC5->C5_BLQ
				aSaldos[nY][5] := SC6->C6_BLOQUEI

				//estornando SC9 dos itens, percorro as SC9
				SC9->(DbSetOrder(1))
				if SC9->(DbSeek(aSaldos[nY][1])) //posiciono no item
					While SC9->(!Eof()) .AND. SC9->(C9_FILIAL+C9_PEDIDO+C9_ITEM) == aSaldos[nY][1]
						if empty(SC9->C9_NFISCAL)
							if aScan(aCarga, {|x| x[1] == aSaldos[nY][1]}) == 0
								AAdd(aCarga,{aSaldos[nY][1], SC9->C9_CARGA, SC9->C9_SEQCAR, SC9->C9_SEQENT, SC9->C9_ENDPAD })
							endif
							Reclock("SC9", .F.)
							SC9->C9_CARGA := ""
							SC9->C9_SEQCAR := ""
							SC9->C9_SEQENT := ""
							SC9->C9_ENDPAD := ""
							SC9->(MsUnlock())

							SC9->(a460Estorna()) //estorna SC9
						endif
						SC9->(DbSkip())
					enddo
				endif

				RecLock("SC5",.F.)
				SC5->C5_BLQ := aSaldos[nY][4]

				//faço liberação
				if aSaldos[nY][2] == Nil //sem lote e endereço
					RecLock("SC6", .F.)
					SC6->C6_BLOQUEI := aSaldos[nY][5]
					SC6->C6_QTDLIB := SC6->C6_QTDVEN - SC6->C6_QTDENT
					MaLibDoFat(SC6->(RecNo()),SC6->C6_QTDLIB,.T.,.T.,.F.,.F.,.F.,.F.)
					SC6->(MsUnlock())
				else //quando tem lote e/ou endereço
					RecLock("SC6", .F.)
					SC6->C6_BLOQUEI := aSaldos[nY][5]
					For nZ := 1 to len(aSaldos[nY][2])
						MaLibDoFat(SC6->(RecNo()),aSaldos[nY][2][nZ][1][5],.T.,.T.,.F.,.F.,.F.,.F.,/*aEmpenho*/,/*bBlock*/, aSaldos[nY][2][nZ])
					next nZ
					SC6->(MsUnlock())
				endif

				SC5->C5_LIBEROK := aSaldos[nY][3]
				SC5->(MsUnlock())
			endif
		next nY

		//regravo informaçoes da carga
		SC9->(DbSetOrder(1))
		For nY := 1 to len(aCarga)
			if SC9->(DbSeek(aCarga[nY][1]))
				While SC9->(!Eof()) .AND. SC9->(C9_FILIAL+C9_PEDIDO+C9_ITEM) == aCarga[nY][1]
					if empty(SC9->C9_NFISCAL)
						Reclock("SC9", .F.)
						SC9->C9_CARGA := aCarga[nY][2]
						SC9->C9_SEQCAR := aCarga[nY][3]
						SC9->C9_SEQENT := aCarga[nY][4]
						SC9->C9_ENDPAD := aCarga[nY][5]
						SC9->(MsUnlock())
					endif
					SC9->(DbSkip())
				Enddo
			endif
		next nY

	next nX

	if lOk
		EndTran()
	endif

	if lOk
		//::aProcLog[nPosProc][1] := "BR_VERDE"
		//::aProcLog[nPosProc][3] := "Lotes distribuidos e saldo empenhado!"
	else
		//::aProcLog[nPosProc][1] := "BR_VERMELHO"
		//::aProcLog[nPosProc][3] := cMsgRet
	endif

	cFilAnt := cBkpFil
//	oGridLog:GoTo(nPosProc)
//	oGridLog:oBrowse:Refresh()

Return lOk

//********************************** Metodos AUXILIARES GERAIS **********************************\\

//-----------------------------------------------------------------
// Metodo para obter sequencial da triangulação
//-----------------------------------------------------------------
METHOD GetIdTriang() CLASS FatTriang

	Local cMyIDTri	:= ""
	Local cCampo	:= "C5_XIDTRI"
	Local _cAlias	:= "SC5"
	Local nTamCod	:= TamSx3(cCampo)[1]

	if empty(::cIdTriang)

		cQry := "SELECT MAX("+cCampo+") PROX "
		cQry += " FROM " + RetSqlName(_cAlias)

		If Select("QAUX") > 0
			QAUX->(dbCloseArea())
		EndIf

		cQry := ChangeQuery(cQry)
		dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUX", .F., .T.)

		If Empty(QAUX->PROX)
			cMyIDTri := strzero( 1, nTamCod )
		Else
			cMyIDTri := PADL(soma1(QAUX->PROX),nTamCod,"0")

			//FreeUsedCode()
			While !MayIUseCode( "TRIANG" + cMyIDTri )
				cMyIDTri := soma1(cMyIDTri)
			EndDo

		EndIf

		If Select("QAUX") > 0
			QAUX->(dbCloseArea())
		EndIf

		::cIdTriang := cMyIDTri
	endif

Return ::cIdTriang

//-----------------------------------------------------------------
//Metodo para gravar um pedido de venda
//cFilPV: Filial onde será incluido o pedido
//aItens: array de itens dos pedidos, com recno do item origem
//		  na penultima posição de cada linha
//Cliente ja deve estar posicionado
//-----------------------------------------------------------------
METHOD GerarPvEst(aItens, cCli, cLoj, cCondPg, cC6Oper, cTipPrc, cTabPrc, nIndPrc, lLibEst, lEmpDif, cTranspDAK ) CLASS FatTriang

	Local nX := 0, nCount := 0
	Local lRet := .T.
	Local cBkpFil := cFilAnt
	Local aCabAuto := {}
	Local aIteAuto := {}
	Local aAux := {}
	Local nMax := SuperGetMV("FT_MAXITNF",, 400)
	Local nPosRecno := len(aItens[1])-1
	Local cItem := replicate("0", tamSX3("C6_ITEM")[1])
	Local nPrcUnit := 0
	Local c_Tes := ''
	Private lTrasp := .F. //Caique
	Private lMsErroAuto := .F.
	Default lEmpDif := .F.

	cFilAnt := ::cFilEst //MUDOU FILIAL

	if !empty(cCondPg) .AND. empty(Posicione("SE4",1,xFilial("SE4")+cCondPg,"E4_CODIGO"))
		::cMsgErro := "Condição de Pagamento não encontrada na filial "+cFilAnt+"."
		::ShowError()
		Return .F.
	endif

	if cTipPrc == "1" .and. !empty(cTabPrc) .AND. empty(Posicione("DA0",1,xFilial("DA0")+cTabPrc,"DA0_CODTAB"))
		::cMsgErro := "Tabela de preço não encontrada na filial "+cFilAnt+"."
		::ShowError()
		Return .F.
	elseif cTipPrc == "1" .and. empty(Posicione("SA1",1,xFilial("SA1")+cCli+cLoj,"A1_TABELA"))//Validar se a tabela esta vinculada ao cliente, solicitado pelo Sr.Godinho, 14/02/2018, as 17:25.  Tarcísio Silva
		::cMsgErro := "Tabela não vinculada ao cliente!"
		::ShowError()
		Return(.F.)
	endif

	aAdd(aCabAuto, {"C5_TIPO"   , "N"           , nil}) // TIPO DO PEDIDO
	aAdd(aCabAuto, {"C5_CLIENTE", cCli          , nil}) // CÓDIGO DO CLIENTE
	aAdd(aCabAuto, {"C5_LOJACLI", cLoj          , nil}) // LOJA DO CLIENTE
	aAdd(aCabAuto, {"C5_EMISSAO", dDataBase     , nil}) // DATA DE EMISSÃO
	aAdd(aCabAuto, {"C5_CONDPAG", cCondPg    	, nil}) // CONDIÇÃO
	aAdd(aCabAuto, {"C5_TRANSP", cTranspDAK   	, nil}) // TRANSPORTADORA da DAK
	aAdd(aCabAuto, {"C5_TABELA", cTabPrc	   	, nil}) // TABELA DE PREÇO

	for nX := 1 to len(aItens)
		SC6->(DbGoTo(aItens[nX][nPosRecno])) //Posiciona no item de origem
		nCount++

		aAux := {}
		cItem := soma1(cItem)

		//se tipo preço é % sobre preço origem, pego aliquota do cadastro SB1
		if cTipPrc=="4"
			nIndPrc := Posicione("Z06",1,xFilial("Z06")+SC6->C6_PRODUTO,"Z06_INDICE")
		endif
		nPrcUnit := ::GetPrcUnit(cTipPrc, cTabPrc, SC6->C6_PRODUTO, SC6->C6_PRCVEN, nIndPrc )

		c_Tes := U_MaTesInt(2,cC6Oper,cCli,cLoj,"C",SC6->C6_PRODUTO,"C6_TES")

		c_TpCrg := DAK->DAK_XTIPO

		If c_TpCrg = 'E'
			c_Tes := Posicione("SF4",1, xFilial("SF4") + c_Tes, "F4_XTESEST")
		ElseIf c_TpCrg = 'F'
			c_Tes := Posicione("SF4",1, xFilial("SF4") + c_Tes, "F4_XTESFIN")
		EndIf

		aAdd(aAux, {"C6_ITEM"   , cItem                       			, nil}) //  ITEM DO PEDIDO
		aAdd(aAux, {"C6_PRODUTO", SC6->C6_PRODUTO             			, nil}) //  CÓDIGO DO PRODUTO
		aAdd(aAux, {"C6_QTDVEN" , SC6->C6_QTDVEN              			, nil}) //  QUANTIDADE VENDIDA
		//aAdd(aAux, {"C6_PRCVEN" , NoRound(nPrcUnit,2)		  			, nil}) //  PREÇO DE VENDA //O ExecAuto ja faz a validação do preço automaticamente, solicitado pelo Sr.Godinho, 14/02/2018, as 17:25. Tarcísio Silva
		//aAdd(aAux, {"C6_VALOR"  , NoRound(SC6->C6_QTDVEN * NoRound(nPrcUnit,2),2)	, nil}) //  VALOR TOTAL //O ExecAuto ja faz a validação do preço automaticamente, solicitado pelo Sr.Godinho, 14/02/2018, as 17:25.  Tarcísio Silva

		aAdd(aAux, {"C6_PRCVEN" , NoRound(nPrcUnit,2)		  			, nil}) //  PREÇO DE VENDA
		aAdd(aAux, {"C6_VALOR"  , NoRound(SC6->C6_QTDVEN * NoRound(nPrcUnit,2),2)	, nil}) //  VALOR TOTAL

		If c_TpCrg <> ' '
			aAdd(aAux, {"C6_TES"   , c_Tes                     			, nil}) //  TES
		Else
			aAdd(aAux, {"C6_OPER"   , cC6Oper                     			, nil}) //  TIPO OPERAÇÂO TRANSFERENCIA
		Endif

//		aAdd(aAux, {"C6_TES"   , c_Tes                     				, nil}) //  TES

		aAdd(aAux, {"C6_XTFIORI", SC6->C6_FILIAL              			, nil}) //  FILLIAL PEDIDO DE ORIGEM
		aAdd(aAux, {"C6_XTPVORI", SC6->C6_NUM                 			, nil}) //  NUMERO PEDIDO DE ORIGEM
		aAdd(aAux, {"C6_XTITORI", SC6->C6_ITEM                			, nil}) //  ITEM PEDIDO DE ORIGEM
		if lLibEst
			aadd(aAux, {"C6_QTDLIB", SC6->C6_QTDVEN						, nil}) //  LIBERAÇAO ESTOQUE AUTOMATICA
		endif

		aAdd(aIteAuto, aClone(aAux) )

		if nCount >= nMax .OR. nX == len(aItens)

			aAdd(aCabAuto, {"C5_XIDTRI", ::GetIdTriang() , nil}) // ID TRIANGULAÇÂO

			MSExecAuto({|x,y,z| Mata410(x,y,z)}, aCabAuto, aIteAuto, 3)

			If lMsErroAuto
				if !::VerifIncPV(::cFilEst)
					lRet := .F.
					::cMsgErro := "Falha na inclusão do pedido de vendas!"
					::ShowError(.F., .T.)
					EXIT
				endif
			endif

			aadd(::aRecPvFE, SC5->(Recno()))
			aadd(::aNumPvFE, SC5->C5_NUM )

			nCount := 0
			aIteAuto := {}
			cItem := replicate("0", tamSX3("C6_ITEM")[1])
		endif

	next nX

	cFilAnt := cBkpFil

Return lRet

//-----------------------------------------------------------------------------
//Metodo para posicionar no cliente da filial
//-----------------------------------------------------------------------------
METHOD PosCliFil(cFilGet, cCli, cLoj) CLASS FatTriang

	Local lRet := .F.
	Local cArea := getNextAlias()

	BEGINSQL ALIAS cArea
	SELECT A1_COD, A1_LOJA
	FROM %table:SA1% SA1
	WHERE SA1.%notdel%
	AND A1_FILTRF = %exp:cFilGet%
	ENDSQL

	IF (cArea)->(!EOF())
		lRet := .T.
		cCli := (cArea)->A1_COD
		cLoj := (cArea)->A1_LOJA
	ENDIF

	(cArea)->( dbCloseArea() )

Return lRet

//-----------------------------------------------------------------------------
//Metodo para posicionar no fornecedor da filial
//-----------------------------------------------------------------------------
METHOD PosForFil(cFilGet, cForn, cLoj) CLASS FatTriang

	Local lRet := .F.
	Local cArea := getNextAlias()

	BEGINSQL ALIAS cArea
	SELECT A2_COD, A2_LOJA
	FROM %table:SA2% SA2
	WHERE SA2.%notdel%
	AND A2_FILTRF = %exp:cFilGet%
	ENDSQL

	IF (cArea)->(!EOF())
		lRet := .T.
		cForn := (cArea)->A2_COD
		cLoj := (cArea)->A2_LOJA
	ENDIF

	(cArea)->( dbCloseArea() )

Return lRet


//-----------------------------------------------------------------------------
//Metodo para obter o preço unitario do pedido
//-----------------------------------------------------------------------------
METHOD GetPrcUnit(cTipPrc, cTabPrc, cProdut, nPrcVend, nIndPrc ) CLASS FatTriang

	Local aSaldos := {}
	Local nRet := 0
	Local dDataCusto

	//por padrão, mantem preço do pedido original
	nRet := nPrcVend

	if cTipPrc == "1" //Tabela de Preço

		DA1->(DbSetOrder(1))
		if DA1->(DbSeek(xFilial("DA1")+cTabPrc+cProdut))
			nRet := DA1->DA1_PRCVEN
		endif

	elseif cTipPrc == "2" .OR. cTipPrc == "3" //Custo SB2 ou Custo SB9

		dDataCusto := iif(cTipPrc == "3", SuperGetMv("MV_ULMES",,dDataBase) ,dDataBase)
		SB1->(DbSetOrder(1))
		if SB1->(DbSeek(xFilial("SB1")+cProdut))

			aSaldos := CalcEst(SB1->B1_COD, SB1->B1_LOCPAD, dDataCusto) //retorno:{nQtd, nValor}
			if aSaldos[1] < 0.01
				aSaldos[2]:=0
			endif

			nRet:= aSaldos[2]/aSaldos[1]
		endif

		//segue com preço de venda nesses casos
		if nRet < 0.01 .OR. nRet > nPrcVend
			nRet := nPrcVend
		endif

		if nIndPrc > 0
			nRet := Round(nRet * nIndPrc / 100, 2)
		endif

	elseif cTipPrc == "4" //% Preço Venda (indice produto)

		if nIndPrc > 0 //aplicando indice
			nRet := Round(nPrcVend * nIndPrc / 100, 2)
		endif

	endif

Return nRet

//-----------------------------------------------------------------------------
//Metodo para obter o Recno do Pedido de Transferencia gerado pela solicitação
//-----------------------------------------------------------------------------
METHOD GetRecnoPvFE() CLASS FatTriang
Return ::aRecPvFE

//-----------------------------------------------------------------------------
//Metodo para obter os numeros dos Pedido de Transferencia gerado pela solicitação
//-----------------------------------------------------------------------------
METHOD GetNumPvFE() CLASS FatTriang
Return ::aNumPvFE

//-----------------------------------------------------------------
//Metodo para criar perguntas da chave
//-----------------------------------------------------------------
METHOD CriaSX1(cPerg) CLASS FatTriang

	//Local nIndexId := 0

	if cPerg == "TBCFTRI2"

		U_xPutSx1(cPerg,"01","Carga ?"	  ,"","","mv_ch1","C",6,0,0,"G","U_TBCFTRI2('DAK')","DAK","","","mv_par01","","","","","","","","","","","","","","","","",{"Informe o numero da carga que tenha ","pedidos configurado para tirar estoque ","de outra filial."},{"",""},{"",""})
		U_xPutSx1(cPerg,"02","Pedido ?"	  ,"","","mv_ch2","C",6,0,0,"G","U_TBCFTRI2('SC5')","SC5","","","mv_par02","","","","","","","","","","","","","","","","",{"Informe o numero do pedito que está ","configurado para tirar estoque de outra ","filial."},{"",""},{"",""})

	elseif cPerg == "TBCFTRI2"

		U_xPutSx1(cPerg,"01","Id Triangulação ?","","","mv_ch1","C",10,0,0,"G","U_TBCFTRI2('IDT')","IDTRI","","","mv_par01","","","","","","","","","","","","","","","","",{"Informe o Id da Triangulação gerado ","pela rotina de Solicitar Transferência. ","Esse Id pode ser encontrado na Carga ou ","Pedido."},{"",""},{"",""})

	endif

Return

//----------------------------------------------------------------
// Verifica se mesmo com erro no execauto, o pedido foi incluido.
//----------------------------------------------------------------
METHOD VerifIncPV(cFilPV) CLASS FatTriang

	Local lRet := .F.
	Local cQry  := ""

	cQry := " SELECT COUNT(*) QTDPED "
	cQry += " FROM " + RetSqlName("SC5") + " SC5"
	cQry += " WHERE C5_FILIAL = '"+xFilial("SC5",cFilPV)+"'"
	cQry += "   AND SC5.D_E_L_E_T_ <> '*' "
	cQry += "   AND C5_XIDTRI = '"+::GetIdTriang()+"' "

	If Select("QAUX") > 0
		QAUX->(dbCloseArea())
	EndIf

	cQry := ChangeQuery(cQry)

	dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUX", .F., .T.)

	if QAUX->(!Eof()) .AND. QAUX->QTDPED > 0
		lRet := .T. //tem pedido
	endif

	QAUX->(dbCloseArea())

Return lRet

//-------------------------------------------------------------
// Valida se consegui liberar os estoques.
//-------------------------------------------------------------
METHOD ValidBlqEst(aPedVen, cFilPv) CLASS FatTriang

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

/*/{Protheus.doc} FatTriang::GetPvsCarga
Método responsável por regastar os pedidos de vendas
que compõe a carga para gerar doc.de saida e transmissão.
@type method
@version 1.0 
@author marcio.katsumata
@since 27/05/2024
@return array, pedidos
/*/
METHOD GetPvsCarga(nRecDAK,nRecSC5) class FatTriang

	if !empty(nRecDAK)

		DbSelectArea("DAK")
		DAK->(dbGoTo(nRecDAK))

		if DAK->DAK_FEZNF == '2' .And. DAK->DAK_ACECAR == '2'.And.(DAK->DAK_BLQCAR == '2' .Or. DAK->DAK_BLQCAR == ' ') .And. (DAK->DAK_JUNTOU=='MANUAL'.Or.DAK->DAK_JUNTOU=='ASSOCI'.Or.DAK->DAK_JUNTOU=='JUNTOU')
			if !empty(DAK->DAK_XIDTRI)
				//percorro pedidos da carga
				DbSelectArea("DAI")
				DAI->(DbSetOrder(1)) //DAI_FILIAL+DAI_COD+DAI_SEQCAR+DAI_SEQUEN+DAI_PEDIDO
				DAI->( dbSeek(xFilial("DAI") + DAK->DAK_COD) )
				while DAI->(!EOF()) .And. DAI->DAI_FILIAL+DAI->DAI_COD == xFilial("DAI")+DAK->DAK_COD
					if (aScan(::aPvsCarga, {|cPedCarg| alltrim(cPedCarg) == DAI->DAI_PEDIDO})) == 0
						aAdd(::aPVsCarga, DAI->DAI_PEDIDO)
					endif
					DAI->(DbSkip())
				enddo
			endif
		endif

	else
		DbSelectArea("SC5")
		SC5->(DbSetOrder(1))
		SC5->(dbGoTo(nRecSC5))
		aAdd(::aPVsCarga, SC5->C5_NUM)

	endif

return ::aPVsCarga

/*/{Protheus.doc} FatTriang::GravaTabelaLog
Método que realiza a gravação da tabela de log.
@type method
@version 1.0
@author marcio.katsumata
@since 31/08/2024
@param aProcLog, array, log de processo
/*/
method GravaTabelaLog (aProcLog) class FatTriang



return

//-----------------------------------------------------------------
//Validação de perguntas
//-----------------------------------------------------------------
User Function TBCFTRI2(_cAlias)

	Local lRet := .T.
	Local nIndexId := 1

	if _cAlias == "DAK"
		lRet := empty(MV_PAR01).OR.ExistCpo('DAK',MV_PAR01)
		if !empty(MV_PAR01)
			MV_PAR02 := Space(len(MV_PAR02))
		endif
	elseif _cAlias == "SC5"
		lRet := empty(MV_PAR02).OR.ExistCpo('SC5',MV_PAR02)
		if !empty(MV_PAR02)
			MV_PAR01 := Space(len(MV_PAR01))
		endif
	elseif _cAlias == "IDT"
		SC5->(dbOrderNickName("IDTRIANG"))
		nIndexId := SC5->(IndexOrd())
		lRet := empty(MV_PAR02).OR. ExistCpo('SC5',MV_PAR01,nIndexId)
	endif

Return lRet

//---------------------------------------------------------------
// muda nome do botão da enchoicebar
//---------------------------------------------------------------
Static Function AltBtnEnch(oObjDlg, cOldCap, cNewCap)
	Local nX := 0
	if oObjDlg:aControls <> Nil
		for nX := 1 to len(oObjDlg:aControls)
			if valtype(oObjDlg:aControls[nX])=="O"
				if "TBROWSEBUTTON" == Alltrim(Upper(oObjDlg:aControls[nX]:ClassName()))
					if oObjDlg:aControls[nX]:cCaption == OemToAnsi( cOldCap )
						oObjDlg:aControls[nX]:cCaption := OemToAnsi( cNewCap )
						oObjDlg:aControls[nX]:Refresh()
						exit
					endif
				endif
			endif
		next nX
	endif
return



//-------------------------------------------------------------
// Liberação de estoque automatica (chama rotina da MATA455)
// Emulo mesmo nome de função pq fonte padrao olha IsInCallStack("MATA455")
//-------------------------------------------------------------
Static Function MATA455()

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
	//Ma450Processa("SC9",.F., .T., .F., Nil, MV_PAR07==2)
	Ma450Proces("SC9",.F., .T., .F., Nil, MV_PAR07==2)

	SetFunName(cRotina)
	RestArea(aArea)

Return


//---------------------------------------
// tela de seleçao Transportadora
//---------------------------------------
Static Function SelTransp(cTranspDAK)

	Private cTransp := cTranspDAK
	Private cNtrans := Posicione("SA4",1,xFilial("SA4")+cTransp,"A4_NREDUZ")
	Private cNovaTransp := Posicione("SA4",1,xFilial("SA4")+cTransp,"A4_NREDUZ")
	Private oDlgTRSP

	//STYLE DS_MODALFRAME Remove o botão "x" NÃO DEIXA FECHAR A ROTINA
	DEFINE MSDIALOG oDlgTRSP TITLE "Transportadora" FROM 0,0 TO 180, 600 COLORS 0, 16777215 PIXEL STYLE DS_MODALFRAME

	oDlgTRSP:lEscClose := .F.
	TGroup():New(10,05,80,297,'Informe o Codigo da Transportadora de Transferência!',oDlgTRSP,,,.T.)

	TSay():New( 32, 10,{|| "Código" }, oDlgTRSP,,,,,,.T.,CLR_BLACK,,50,9 )
	TGet():New( 30, 50, {|u| iif( PCount()==0,cTransp,cTransp:= u) },oDlgTRSP,45,12,,{|| VldNomTr() },,,,.F.,,.T.,,.F.,{|| .T.},.F.,.F.,/*bChange*/,.F.,.F.,"SA4","A4_COD",,,,.T.,.F.)
	TGet():New( 30, 100, {|u| iif( PCount()==0,cNtrans,cNtrans:= u) },oDlgTRSP,160,12,,/*bValid*/,,,,.F.,,.T.,,.F.,{|| .F.},.F.,.F.,/*bChange*/,.F.,.F.,,"cNtrans",,,,.T.,.F.)

	TButton():New( 55, 240, "Confirmar", oDlgTRSP,{|| iif(VldNomTr(),oDlgTRSP:End(), MsgInfo("Informe a Transportadora de Transferência","Atenção")) }, 50,16,,,.F.,.T.,.F.,,.F.,,,.F. )

	oDlgTRSP:lCentered := .T.
	oDlgTRSP:Activate()

	cNovaTransp := cTransp

	//msginfo("Nova Transportadora DIGITADO: ",cNovaTransp)

Return cNovaTransp

//Valida campo motivo de devoluçao
Static Function VldNomTr()

	Local aAreaSA4  := GetArea()

	cNtrans := Posicione("SA4",1,xFilial("SA4")+cTransp,"A4_NREDUZ")
	oDlgTRSP:Refresh()

	RestArea( aAreaSA4 )

Return !empty(cNtrans)


Static Function PVFin(cPvSGAC)

	Local cQuery 	as character
	Local cNumPed	as character

	cQuery := "SELECT C5_FILIAL,C5_NUM"
	cQuery += " FROM " + RetSqlName("SC5") + " sc5"
	cQuery += " WHERE c5_filial = '" + FWxFilial("SC5") + "'"
	cQuery += " AND C5_XPVSGAC = '" + AllTrim(cPvSGAC) + "'"
	cQuery += " AND D_E_L_E_T_ = ' '"

	cNumPed := MpSysExecScalar(cQuery, "C5_NUM")

Return cNumPed


//-------------------------------------------------------------
// Tipo da Carga
//-------------------------------------------------------------
METHOD GetTipoCarga() CLASS FatTriang

	Local c_Ret := ''
	Local cQry  := ""

	cQry := "SELECT DAK_XTIPO "
	cQry += "FROM " + RetSqlName("DAK") + " DAK "
	cQry += "WHERE DAK.D_E_L_E_T_ = ' ' "
	cQry += "AND DAK_XIDTRI = '"+ ::GetIdTriang() +"' "

	PlSQuery(cQry,"_DAKTP")

	If _DAKTP->(!Eof())
		c_Ret := _DAKTP->DAK_XTIPO
	endif

	_DAKTP->(dbCloseArea())

Return c_Ret

//
// Ponto de entrada
// 
	*---------------------*
User Function MTA455P()
	*---------------------*
	Local lRet := .t.
	Local c9Area := sc9->(GetArea())
	Public aPedCarga := {}
	If cFilAnt == '0104'
		AAdd(aPedCarga,{sc9->(c9_filial+c9_pedido+c9_item+c9_sequen+c9_produto),;
			sc9->c9_carga, sc9->c9_seqcar, sc9->c9_seqent, sc9->c9_endpad })
	Endif
	sc9->(RestArea(c9Area))
Return lRet


User Function MTA455NL()
	Local c9Area := sc9->(GetArea())
	Local nx
	If cFilAnt == '0104'
		For nx := 1 to len(aPedCarga)
			sc9->(DbSetOrder(1))
			if sc9->(DbSeek(aPedCarga[nx,1])) //posiciono no item
				iF RecLock('SC9',.F.)
					sc9->c9_carga   := aPedCarga[nx,2]
					sc9->c9_seqcar  := aPedCarga[nx,3]
					sc9->c9_seqent  := aPedCarga[nx,4]
					sc9->c9_endpad  := aPedCarga[nx,5]
					MsUnlock()
				Endif
			Endif
		Next nx
	Endif
	sc9->(RestArea(c9Area))

Return

METHOD GERARCARGA(cFilCar,cChvCar,cPedCar,dDatCar,cStatCar,cCodCar) CLASS FatTriang

	Local aCab     		:= {}
	Local aItem    		:= {}
	Local cTraPad  		:= ''
	Local nZ       		:= 0
	Local nx
	Local lRetCar  		:= .f.
	Local cFTrans  		:= getNextAlias()
	Local aPvlNfs  		:= {}
	Local aBloqueio		:= {}
	Local lBloqCred 	:= .f.
	Local cMsgBlqC		:= ''
	Local cEmbMococa  	:= GetEnvServer()
	//Local aPed0105		:= {}
	Private lmshelpauto := .t.
	Private lMsErroAuto := .F.

	Default aPedOk 		:= {}
	Default cCarga 		:= ''
	Default aPedCar		:= {}
	Default cTranspDAK 	:= ''

/*
	BEGINSQL Alias cFTrans
		SELECT ID_TRANSP TRPCAR FROM sigaofc.MOCFATAUTO2
		WHERE NR_CARGA_LOG = %EXP:cCodCar%		
			AND C5_FILIAL = %EXP:cFilCar%			
	ENDSQL
*/
	If upper(substr(cEmbMococa,1,5)) == 'TESTE'
		BEGINSQL Alias cFTrans
			SELECT ID_TRANSP TRPCAR FROM MOCFATAUTO2
			WHERE NR_CARGA_LOG = %EXP:cChvCar%		
				AND C5_FILIAL = %EXP:cFilCar%			
		ENDSQL
	Else
		BEGINSQL Alias cFTrans
			SELECT ID_TRANSP TRPCAR FROM MOCFATAUTO
			WHERE NR_CARGA_LOG = %EXP:cChvCar%		
				AND C5_FILIAL = %EXP:cFilCar%			
		ENDSQL
	Endif
	MemoWrit("c:\temp\CFTRAMSF.sql", GetLastQuery()[2])
	cTraPad    := Alltrim((cFTrans)->TRPCAR)
	cTranspDak := Alltrim((cFTrans)->TRPCAR)

	(cFTrans)->(dbCloseArea())

	aPedCar := StrTokArr( SubStr(cPedCar,2,Len(cPedCar)), "|" )
	cCarga  := GETSX8NUM("DAK","DAK_COD")

	aCab := {;
		{"DAK_FILIAL", xFilial("DAK"),  Nil},;
		{"DAK_COD"   , cCarga,          Nil},; //Campo com inicializador padrão para pegar GESX8NUM
		{"DAK_SEQCAR", "01",            Nil},;
		{"DAK_ROTEIR", "999999",        Nil},;
		{"DAK_CAMINH", "",              Nil},;
		{"DAK_MOTORI", "",              Nil},;
		{"DAK_PESO"  , 0,               Nil},; // Calculado pelo OMSA200
		{"DAK_CAPVOL", 0,               Nil},;
		{"DAK_PTOENT", 0,               Nil},;
		{"DAK_VALOR" , 0,               Nil},;
		{"DAK_FEZNF" , '2',             Nil},;
		{"DAK_DATA"  , DATE(),          Nil},;
		{"DAK_HORA"  , TIME(),          Nil},;
		{"DAK_JUNTOU", "Manual",        Nil},;
		{"DAK_ACECAR", "2",             Nil},;
		{"DAK_ACEVAS", "2",             Nil},;
		{"DAK_ACEFIN", "2",             Nil},;
		{"DAK_FLGUNI", "2",             Nil},; //Campo com inicializador padrão  - 2
		{"DAK_TRANSP", cTraPad,         Nil},;
		{"DAK_VEIC3" , '',              Nil},;
		{"DAK_CDCLFR", '0001',          Nil}}

	For Nz := 1 to Len(aPedCar)
		aPvlNfs  		:= {}
		aBloqueio		:= {}
		//Libera Pedido para carga
		SC5->(DbSetOrder(1))
		// POSICIONA NO PEDIDO
		SC5->(DbSeek(xFilial("SC5") + aPedCar[Nz]) )

		// POSICIONA NO CLIENTE DO PEDIDO
		SA1->(dBseek(xFilial('SA1')+('SC5')->(SC5->C5_CLIENTE+SC5->C5_LOJACLI)))

		cLogPro += CRLF

		/*
		If cFilAnt == '0105'
			If !LibeEstCar(aPedCar[Nz])
				MSGSTOP('NÃO CONSEGUIU LIBERAR ESTOQUE DA FILIAL '+cFilAnt)
				exit
			Endif
			//Ma410LbNfs( 2, @aPvlNfs, @aBloqueio )  	// Libera pedidos (manual)
			Ma410LbNfs( 1, @aPvlNfs, @aBloqueio )	// Verifica se o pedido foi liberados
		Else*/
		If cFilAnt == '0104'
			MATA455()   // chama rotina para liberar estoque AUTOMATICA (STATICA)
			Ma410LbNfs(1,@aPvlNfs,@aBloqueio)
			if !empty(aBloqueio) .OR. !empty(SC5->C5_BLQ)
				//cPedBloque += if(empty(cPedBloque),'',', ')+SC5->C5_NUM 
				If cFilAnt <> '0105'
					lOk := .F.
					msgstop('Não foi possivel liberar estoque do pedido: '+sc5->c5_num)
					return lOk
				Endif
			endif
			For nx := 1 to len(aBloqueio)
				If aBloqueio[nx,6] $ '01,04,05,09,ZZ'
					/*
					C9_BLCRED – Crédito:
						01 – Bloqueio de Crédito por Valor
						04 – Vencimento do Limite de Crédito – Data de Crédito Vencida
						05 – Bloqueio Manual/Estorno
						09 – Liberação de Crédito Rejeitada
						10 – Faturado
						ZZ – Liberação Tardia
					*/
					lBloqCred := .t.
					cMsgBlqC += if(!empty(cMsgBlqC),', ','')+sc5->c5_num
				Endif
			Next
		Endif

		Aadd(aPedOk,SC5->C5_NUM)

		Aadd(aItem,{     ;
			cCarga      ,; // 01 - Código da carga
		"999999"        ,; // 02 - Código da Rota - 999999 (Genérica)
		"999999"        ,; // 03 - Código da Zona - 999999 (Genérica)
		"999999"        ,; // 04-  Código do Setor - 999999 (Genérico)
		sc5->c5_num     ,; // 05 - Código do Pedido Venda
		sa1->a1_COD     ,; // 06 - Código do Cliente
		sa1->a1_LOJA    ,; // 07 - Loja do Cliente
		sa1->a1_NOME    ,; // 08 - Nome do Cliente
		sa1->a1_BAIRRO  ,; // 09 - Bairro do Cliente
		sa1->a1_MUN     ,; // 10 - Município do Cliente
		sa1->a1_EST     ,; // 11 - Estado do Cliente
		sc5->c5_filial  ,; // 12 - Filial do Pedido Venda
		sa1->a1_FILIAL  ,; // 13 - Filial do Cliente
		sc5->c5_pbruto  ,; // 14 - Peso Total dos Itens
		sc5->c5_volume1 ,; // 15 - Volume Total dos Itens
		"08:00"         ,; // 16 - Hora Chegada
		"0000:00"       ,; // 17 - Time Service
		Nil             ,; // 18 - Não Usado
		dDatabase       ,; // 19 - Data Chegada
		dDatabase       ,; // 20 - Data Saída
		Nil             ,; // 21 - Não Usado
		Nil             ,; // 22 - Não Usado
		0               ,; // 23 - Valor do Frete
		0               ,; // 24- Frete Autonomo
		0               ,; // 25 - Valor Total dos Itens (Calculado pelo OMSA200)
		0               ,; // 26 - Quantidade Total dos Itens (Calculado pelo OMSA200)
		Nil             ,; // 27 - Não usado
		cTraPad})          // 28 - Transportadora redespachante (não obrigatório)
		/*
		If cFilAnt == '0105'
			If sc9->(dBseek(xFilial('SC9') + SC5->C5_NUM ))
				Do While xFilial('SC9') + SC5->C5_NUM == sc9->(c9_filial+c9_pedido)
					If empty(sc9->c9_nfiscal) .and. sc9->c9_blest =='02'
						aadd(aPed0105,{sc9->(c9_filial+c9_pedido+c9_item+c9_sequen),sc9->c9_blest})
						If RecLock('SC9',.F.)
							sc9->c9_blest := ' '
							msUnlock()
						Endif
					Endif
					sc9->(dBskip())
				Enddo
			Endif
		Endif
		*/
	Next Nz
	If !lBloqCred
		MSExecAuto( { |x, y, z| OMSA200(x, y, z) }, aCab, aItem, 3 )
		/*
		For ny := 1 to len(aPed0105)
			If sc9->(dBseek(aPed0105[ny,1] ))

				If RecLock('SC9',.F.)
					sc9->c9_blest := aPed0105[ny,2]
					msUnlock()
				Endif

			Endif
		Next
		*/
		If lMsErroAuto 
			if ::lShowMsg
				MostraErro()
			endif
			cLogPro += "Erro na Emissão da Carga : "+cCarga+CRLF
			lRetCar := .f.

		Else

			cLogPro += "Ok - Emissão da Carga : "+dak->dak_cod+CRLF
			lRetCar := .t.

			RecLock("DAK",.f.)
			DAK->DAK_TRANSP := cTranspDAK
			MsUnLock()
			//cCodCar  		:= dak->dak_cod
		EndIf
	Else
		If lBloqCred
			MsgInfo('Existem pedido(s) com bloqueio de credito: '+cMsgBlqC,'ATENÇÃO')
		Endif
		lRetCar := .f.
	Endif



Return lRetCar

Static Function libestoq(cNumPV)

	Local lUseOffBal	:= FindFunction("RskIsActive") .And. RskIsActive()
	Local lHelp			:= .T.
	Local lMTA456I		:= ExistBlock("MTA456I")
	Local aAreaSC9      := sc9->(GetArea())
	Local aPvlNfs       := {}
	Local aBloqueio     := {}
	Local cQuery        := ''
	Local cFilSC9	    := xFilial("SC9")
	Local lQuery        := .T.
	Local bValid        := {|| .T.}
	Local cAliasSC9     := "A450LIBMAN"
	Local nRecSc9       := 0
	Local lLib          := .f.

	Ma410LbNfs( 2, @aPvlNfs, @aBloqueio )
	Ma410LbNfs( 1, @aPvlNfs, @aBloqueio )

	If !Empty(aBloqueio)
		ConOut("O pedido contem "+CValToChar(Len(aBloqueio))+" itens bloqueados.")

		// Força Liberação de estoque
		dbSelectArea("SC9")
		dbSetOrder(1)

		cQuery := "SELECT C9_FILIAL,C9_PEDIDO,C9_BLCRED,R_E_C_N_O_ SC9RECNO "+CRLF
		cQuery += "FROM "+RetSqlName("SC9")+" SC9 "+CRLF
		cQuery += "WHERE SC9.C9_FILIAL = '"+cFilSC9+"' AND "+CRLF
		cQuery += "SC9.C9_PEDIDO = '"+cNumPV+"' AND "+CRLF
		cQuery += "(SC9.C9_BLEST <> '  ' OR "
		cQuery += "SC9.C9_BLCRED <> '  ' ) AND "+CRLF
		cQuery += "SC9.C9_BLCRED NOT IN('10','09') AND "+CRLF
		cQuery += "SC9.C9_BLEST <> '10' AND "+CRLF
		cQuery += "SC9.C9_DATALIB <= '"+DTOS(date()+10)+"' AND "+CRLF
		cQuery += "SC9.D_E_L_E_T_ = ' ' "+CRLF

		cQuery := ChangeQuery(cQuery)

		dbUseArea(.T.,"TOPCONN",TcGenQry(,,cQuery),cAliasSC9,.T.,.T.)

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
		lLib := .t.
	Else
		lLib := .f.
	Endif

	SC9->(RestArea(aAreaSC9))

Return lLib
Static Function LiberarPV(cNumPV,aPvlNfs)
	Local cQuery    := ""
	Local nQtdLib   := 0
	Local lRet := .t.

	cQuery := " SELECT"
	cQuery += "     C5.R_E_C_N_O_ AS C5_RECNO,"
	cQuery += "     C6.R_E_C_N_O_ AS C6_RECNO,"
	cQuery += "     C5.*, "
	cQuery += "     C6.* "
	cQuery += " FROM " + RetSqlName("SC5") + " C5 (NOLOCK)"
	cQuery += " INNER JOIN " + RetSqlName("SC6") + " C6 (NOLOCK) ON"
	cQuery += "     C5.C5_FILIAL = C6.C6_FILIAL"
	cQuery += " AND C5.C5_NUM = C6.C6_NUM"
	cQuery += " AND C5.C5_CLIENT = C6.C6_CLI"
	cQuery += " AND C5.C5_LOJACLI = C6.C6_LOJA"
	cQuery += " WHERE C5.D_E_L_E_T_ = ''"
	cQuery += "   AND C6.D_E_L_E_T_ = ''"
	cQuery += "   AND C5.C5_FILIAL = '" + cFilAnt + "'"
	cQuery += "   AND C5.C5_NUM = '" + cNumPV + "'"
	cQuery += " ORDER BY C5.C5_FILIAL, C5.C5_NUM, C6.C6_ITEM "

	cQuery := ChangeQuery(cQuery)

	If Select("TSC5") > 0
		TSC5->(dbCloseArea())
	EndIf
	TcQuery cQuery New Alias TSC5

	If TSC5->(EoF())
		lRet := .F.
		cMsg := "Erro ao Liberar Pedido de Venda: Pedido de Venda n? " + cNumPV + " não encontrado no sistema."
		Return lRet
	EndIf

	While !TSC5->(EoF())
		dbSelectArea("SC5")
		SC5->(dbSetOrder(1))
		SC5->(MsGoTo(TSC5->C5_RECNO))

		dbSelectArea("SC6")
		SC6->(dbSetOrder(1))
		SC6->(MsGoTo(TSC5->C6_RECNO))

		dbSelectArea("SC9")
		SC9->(dbSetOrder(1))

		if SC9->(MsSeek(TSC5->C5_FILIAL + TSC5->C5_NUM + TSC5->C6_ITEM))

			nQtdLib := MaLibDoFat(TSC5->C6_RECNO, TSC5->C6_QTDVEN, .T., .T.)

			If TSC5->C6_QTDVEN <> nQtdLib
				lRet := .F.
				cMsg := "Erro ao Liberar o Pedido de Venda No " + cNumPV + ": Item " + Alltrim(TSC5->C6_ITEM) + " - " + Alltrim(TSC5->C6_PRODUTO) + " não liberado. Quantidade a Liberar: " + cValToChar(TSC5->C6_QTDVEN) + " / Quantidade Liberada: " + cValToChar(nQtdLib) + "."
				exit
			EndIf

			aAdd(aPvlNfs,{ SC9->C9_PEDIDO,;
				SC9->C9_ITEM,;
				SC9->C9_SEQUEN,;
				SC9->C9_QTDLIB,;
				SC6->C6_PRCVEN,;
				SC9->C9_PRODUTO,;
				.f.,;
				SC9->(RecNo()),;
				SC5->(RecNo()),;
				SC6->(RecNo()),;
				SE4->(RecNo()),;
				SB1->(RecNo()),;
				SB2->(RecNo()),;
				SF4->(RecNo()),;
				SB2->B2_LOCAL,;
				0,;
				SC9->C9_QTDLIB2})
		else
			lRet := .F.
			exit
		Endif
		TSC5->(dbSkip())
	EndDo
	TSC5->(dbCloseArea())

	MaLiberOk({cNumPV}, .T.)
Return lRet


Static Function LibeEstCar(cNumPv)
	// Liberado o estoque de pedidos da filial 5 para gerar a carga
	//Local nx
	Local lRet 		:= .f.
	Local aPvlNfs 	:= {}
	Local aBloqueio := {}
	Local aItensFat := {}
	Local lOk
	Local lQuery        := .T.
	Local bValid        := {|| .T.}
	Local cAliasSC9     := "A450LIBMAN"
	Local lUseOffBal	:= FindFunction("RskIsActive") .And. RskIsActive()
	Local lHelp			:= .T.
	Local lMTA456I		:= ExistBlock("MTA456I")
	//For nX := 1 to len(aPvOri)

		aItensFat := {}
		lOk := .T.

		//posiciono no pedido
		SC5->(DbSetOrder(1))
		SC5->(DbSeek(xFilial("SC5") + cNumPv) )
		SC6->(DbSetOrder(1))
		if SC6->( dbSeek(xFilial("SC6") + SC5->C5_NUM) )
			if !empty(SC6->C6_NOTA) //ja faturado
				lOk := .F. //não processa, pula pedido
				cNFAux += SC6->C6_NOTA+"/"+SC6->C6_SERIE + " "
			endif
		Else
			cLogPro += "Não encontrou itens do pedido de vendas para liberar estoque "+cFilAnt+"."+CRLF
			cMsgRet := "Não encontrou itens do pedido de vendas para liberar estoque "+cFilAnt+"."
			lOk := .F.
		endif

		//verifica liberação do pedido
		if lOk
			aPvlNfs := {}
			aBloqueio := {}
			Ma410LbNfs(1,@aPvlNfs,@aBloqueio)
			if !empty(aBloqueio) .OR. !empty(SC5->C5_BLQ)

				cQuery := "SELECT C9_FILIAL,C9_PEDIDO,C9_BLCRED,R_E_C_N_O_ SC9RECNO "+cQuebra
				cQuery += "FROM "+RetSqlName("SC9")+" SC9 "+cQuebra
				cQuery += "WHERE SC9.C9_FILIAL = '"+sc5->c5_filial+"' AND "+cQuebra
				cQuery += "SC9.C9_PEDIDO = '"+sc5->c5_num+"' AND "+cQuebra
				cQuery += "(SC9.C9_BLEST <> '  ' OR "
				cQuery += "SC9.C9_BLCRED <> '  ' ) AND "+cQuebra
				cQuery += "SC9.C9_BLCRED NOT IN('10','09') AND "+cQuebra
				cQuery += "SC9.C9_BLEST <> '10' AND "+cQuebra
				cQuery += "SC9.C9_DATALIB <= '"+DTOS(date()+10)+"' AND "+cQuebra
				cQuery += "SC9.D_E_L_E_T_ = ' ' "+cQuebra

				cQuery := ChangeQuery(cQuery)

				dbUseArea(.T.,"TOPCONN",TcGenQry(,,cQuery),cAliasSC9,.T.,.T.)

				Do	While (cAliasSC9)->(! Eof()) .And. (cAliasSC9)->C9_FILIAL == cFilAnt .And. (cAliasSC9)->C9_PEDIDO == cNumPV .And. (cAliasSC9)->(Eval(bValid))
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
				Ma410LbNfs( 2, @aPvlNfs, @aBloqueio )
				Ma410LbNfs( 1, @aPvlNfs, @aBloqueio )
				if !empty(aBloqueio) .OR. !empty(SC5->C5_BLQ)
					cLogPro += "Pedido "+SC5->C5_NUM+" com algum bloqueio de crédito ou estoque. Operação Abortada!"+CRLF
					cMsgLog := "Pedido "+SC5->C5_NUM+" com algum bloqueio de crédito ou estoque. Operação Abortada!"
					lOk := .F.
					return lOk
				Else
					lRet := .t.
				endif

			endif
		endif
	//next nX

Return lRet
