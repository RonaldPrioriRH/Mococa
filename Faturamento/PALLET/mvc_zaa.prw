#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'
#Include "TOPCONN.CH"
 
//Variáveis Estáticas
Static cTitulo := "Palletização"
*----------------------*
User Function mvc_zaa()
*----------------------*
Local aArea   := GetArea()
Local oBrowse
Private lmvczaa := .t.  // Usado para tratar situações da rotina no momento da transmissão (M460FIM e outros)
dBselectArea('ZAA')

//Instânciando FWMBrowse - Somente com dicionário de dados
oBrowse := FWMBrowse():New()
    
//Setando a tabela de cadastro de Rotas
oBrowse:SetAlias("ZAA")

//Setando a descrição da rotina
oBrowse:SetDescription(cTitulo)

// Legendas
oBrowse:AddLegend( "ZAA->ZAA_STATUS = 'A' ","BR_VERDE","Aberto")
oBrowse:AddLegend( "ZAA->ZAA_STATUS = 'P' ","BR_AZUL","Com pendencia")
oBrowse:AddLegend( "ZAA->ZAA_STATUS = 'F' ","BR_VERMELHO","Finalizado")
    
//Ativa a Browse
oBrowse:Activate()
    
RestArea(aArea)
Return Nil
 
*-----------------------* 
Static Function MenuDef()
*-----------------------* 
Local aRot := {}
    
//Adicionando opções
ADD OPTION aRot TITLE 'Visualizar'      Action 'VIEWDEF.mvc_zaa' OPERATION MODEL_OPERATION_VIEW   ACCESS 0 //OPERATION 1
ADD OPTION aRot TITLE 'Incluir'         Action 'VIEWDEF.mvc_zaa' OPERATION MODEL_OPERATION_INSERT ACCESS 0 //OPERATION 3
ADD OPTION aRot TITLE 'Alterar'         Action 'VIEWDEF.mvc_zaa' OPERATION MODEL_OPERATION_UPDATE ACCESS 0 //OPERATION 4
ADD OPTION aRot TITLE 'Excluir'         Action 'VIEWDEF.mvc_zaa' OPERATION MODEL_OPERATION_DELETE ACCESS 0 //OPERATION 5
ADD OPTION aRot Title 'Processa'        Action 'U_Proczaa(1,"")' 	 OPERATION 6 ACCESS 0
ADD OPTION aRot Title 'Gera NF Chep'    Action 'U_gNfezaa()' 	 OPERATION 6 ACCESS 0
 
Return aRot
 
*-------------------------* 
Static Function ModelDef()
*-------------------------* 
Local oModel         := Nil
Local oStPai         := FWFormStruct(1, 'ZAA')
Local oStFilho       := FWFormStruct(1, 'ZAB')
Local aZABRel        := {}
    
//Criando o modelo e os relacionamentos
oModel := MPFormModel():New('mvc_zaaM')
oModel:AddFields('ZAAMASTER',/*cOwner*/,oStPai)
oModel:AddGrid('ZABDETAIL','ZAAMASTER',oStFilho,/*bLinePre*/, /*bLinePost*/,/*bPre - Grid Inteiro*/,/*bPos - Grid Inteiro*/,/*bLoad - Carga do modelo manualmente*/)  //cOwner é para quem pertence
    
//Fazendo o relacionamento entre o Pai e Filho
aAdd(aZABRel, {'ZAB_FILIAL' ,'xfilial("ZAA")' } )
aAdd(aZABRel, {'ZAB_CARGA' ,'ZAA_CARGA'})  
//aAdd(aZABRel, {'ZM5_LOJFOR' ,'ZM4_LOJFOR'}) 
//aAdd(aZABRel, {'ZM5_DTVALI','ZM4_DTVALI'}) 
    
oModel:SetRelation('ZABDETAIL', aZABRel, ZAB->(IndexKey(1))) //IndexKey -> quero a ordenação e depois filtrado
//    oModel:GetModel('ZM5DETAIL'):SetUniqueLine({"ZM5_FILIAL","ZM5_CODFOR","ZM5_LOJFOR","ZM5_UF"})    //Não repetir informações ou combinações {"CAMPO1","CAMPO2","CAMPOX"}
oModel:GetModel('ZABDETAIL'):SetUniqueLine({"ZAB_PEDIDO"})    //Não repetir informações ou combinações {"CAMPO1","CAMPO2","CAMPOX"}
oModel:SetPrimaryKey({"ZAB_FILIAL","ZAB_CARGA","ZAB_PEDIDO"})
    
//Setando as descrições
oModel:SetDescription("Palletização x pedidos")
oModel:GetModel('ZAAMASTER'):SetDescription('Cabeçalho Palletização')
oModel:GetModel('ZABDETAIL'):SetDescription('Itens Palletização')

Return oModel
 
*------------------------* 
Static Function ViewDef()
*------------------------* 
Local oView       := Nil
Local oModel      := FWLoadModel('mvc_zaa')
Local oStPai      := FWFormStruct(2, 'ZAA')
Local oStFilho    := FWFormStruct(2, 'ZAB')
    
//Criando a View
oView := FWFormView():New()
oView:SetModel(oModel)
    
//Adicionando os campos do cabeçalho e o grid dos filhos
oView:AddField('VIEW_ZAA',oStPai,'ZAAMASTER')
oView:AddGrid('VIEW_ZAB',oStFilho,'ZABDETAIL')
    
//Setando o dimensionamento de tamanho
oView:CreateHorizontalBox('CABEC',30)
oView:CreateHorizontalBox('GRID',70)
     
//Amarrando a view com as box
oView:SetOwnerView('VIEW_ZAA','CABEC')
oView:SetOwnerView('VIEW_ZAB','GRID')
    
//Habilitando título
oView:EnableTitleView('VIEW_ZAA','Carga')
oView:EnableTitleView('VIEW_ZAB','Itens')
    
//Força o fechamento da janela na confirmação
oView:SetCloseOnOk({||.T.})

Return oView
 
*--------------------------------*
User Function Proczaa(nPar,cCarga)
*--------------------------------*
// nPar == 1 chamado por este codigo no aRotina
// nPar == 2 chamado pelo ponto de entrada OS460NOT
Local cQry          := ''
Local cPerg         := "ProcZA8"
Local aPergs        := {}
Local lMsgSemP      := .f.
Local nqtde          := 0
aAdd(aPergs,{"Carga?","C",06,0,"    "})

u_sx1atu(cPerg,aPergs)

lContinua := Pergunte(cPerg,nPar == 1)

If lContinua .or. npar==2   // Se foi preenchido manualmente a pergunta ou a rotina foi acionada pelo PE OS460NOT
    If nPar == 1
	    cCarga 	:= mv_par01
    Endif
	cQry := montqry(cCarga)

	TcQuery cQry New Alias "TZAA"
    If !empty(tzaa->c9_carga)
        If !zaa->(dBseek(xFilial('ZAA')+tzaa->c9_carga))
            RecLock('ZAA',.t.)
            zaa->zaa_filial := xFilial('ZAA')
            zaa->zaa_carga  := tzaa->c9_carga
            zaa->zaa_status := 'A'
            //zaa->zaa_xlvxml := 'N'
        Else
            RecLock('ZAA',.F.)
        Endif 
        zaa->zaa_transp := tzaa->c5_transp
        zaa->(msunlock('ZAA'))
        Do While !tzaa->(eof())
            If tzaa->a1_xpallet == 'S'
                If !zab->(dBseek(xFilial('ZAB')+tzaa->(c9_carga+c9_pedido)))
                    RecLock('ZAB',.t.)
                    zab->zab_filial := xFilial('ZAA')
                    zab->zab_carga  := tzaa->c9_carga
                    zab->zab_pedido := tzaa->c9_pedido
                    nqtde++
                Else
                    RecLock('ZAA',.F.)
                Endif
                zab->zab_client := tzaa->c9_cliente
                zab->zab_loja   := tzaa->c9_loja
                zab->zab_qtdpal := tzaa->qtdpale
            Else
                lMsgSemP := .t.
            Endif
            tzaa->(dBskip())
        Enddo
        If RecLock('ZAA',.F.)
            zaa->zaa_qtdreg := nqtde
            zaa->(msunlock('ZAA'))
            MsUnlock()
        Endif
    Endif

    If lMsgSemP
        MsgInfo('Para a carga '+cCarga+' existe clientes não paletizado.','ATENÇÃO')
    Endif
    tzaa->(dBcloseArea())

EndIf

Return

*-----------------------------------*
Static Function montqry(cCarga)
*-----------------------------------*
Local cQry := ''
Local cEof  := chr(13)+chr(10)

cQry += "SELECT C9_CARGA, C9_PEDIDO, C9_CLIENTE, C9_LOJA, C5_TRANSP, A1_XPALLET, SUM(ROUND((C9_QTDLIB/B1_XQTPALE),2)) QTDPALE  "+cEof
cQry += "FROM  "+RetSQLName("SC9")+"  SC9 "+cEof
cQry += "INNER JOIN "+RetSQLName("SB1")+" B1 ON B1.D_E_L_E_T_ = '  ' AND B1_COD = C9_PRODUTO "+cEof
cQry += "INNER JOIN "+RetSQLName("SC5")+" C5 ON C5.D_E_L_E_T_ = ' ' AND C5_FILIAL = C9_FILIAL AND C5_NUM = C9_PEDIDO "+cEof
cQry += "INNER JOIN "+RetSQLName("SA4")+" A4 ON A4.D_E_L_E_T_ = ' ' AND C5_TRANSP = A4_COD AND A4_XCROSDO = 'S' "+cEof
cQry += "INNER JOIN "+RetSQLName("SA1")+" A1 ON A1.D_E_L_E_T_ = ' ' AND A1_COD = C9_CLIENTE AND A1_LOJA = C9_LOJA "+cEof
cQry += "WHERE SC9.D_E_L_E_T_ = '  ' "+cEof
cQry += "AND C9_CARGA = '"+cCarga+"' "+cEof
cQry += "GROUP BY C9_PEDIDO, C9_CARGA, C9_CLIENTE, C9_LOJA, C5_TRANSP, A1_XPALLET "+cEof
MemoWrite("c:\temp\montqry.sql",cQry)

Return cQry

/*
 
SELECT C9_CARGA, C9_PEDIDO, C9_CLIENTE, C5_TRANSP, SUM(ROUND((C9_QTDLIB/B1_XQTPALE),2))QTDPALE 
FROM SC9010 SC9
INNER JOIN SB1010 B1 ON B1.D_E_L_E_T_ = '  ' AND B1_COD = C9_PRODUTO
INNER JOIN SC5010 C5 ON C5.D_E_L_E_T_ = ' ' AND C5_FILIAL = C9_FILIAL AND C5_NUM = C9_PEDIDO
WHERE SC9.D_E_L_E_T_ = '  '
AND C9_CARGA = '014305'
GROUP BY C9_PEDIDO, C9_CARGA, C9_CLIENTE, C5_TRANSP 

*/
*--------------------*
User Function gNfezaa()
*--------------------*
Local aLinha	    := {}
Local lret          := .t.
Local cStatus       := 'F'   // 
Local cFile         := ''  // cGetFile( '*.xml' , "Informe o diretorio de destino") //cGetFile( '*.xml' , "Informe o diretorio de destino", 16, , .F.,GETF_RETDIRECTORY+GETF_LOCALHARD,.F., .T. ) 
Local cXml          := ''
Local cPathTmp      :=  "\xmlnfe\"  // GetTempPath(),
Local cArquivo      := "xml_nota_"

Private aXmlGer  := {}		

Private cProdPall   := SUPERGETMV( "XX_PRODPAL", .T., "16110130")
Private cTpOpSai    := SUPERGETMV( "XX_OPPALL", .T., "30")
Private cNumPV
Private aItmPV      := {}  
Private cTipo       := 'N'
Private cCliente    := sa1->a1_cod
Private cLojaCli    := sa1->a1_loja
Private cTabPreco   := sa1->a1_tabela
Private cNaturez    := sa1->a1_naturez
Private cCondPag    := sa1->a1_cond

If zaa->zaa_status == 'F'
    MsgStop('Processamento finalizado')
    return
Endif
zab->(dBsetOrder(1))
nqtd := 0
If zab->(dBseek(zaa->(zaa_filial+zaa_carga)))
    Do While zab->(zab_filial+zab_carga) == zaa->(zaa_filial+zaa_carga)
        // Tratando Pedido de Vendas
        aItmPV      := {}          
        If empty(zab->zab_newped)
            nqtd++
            If !RetCodCli()
                exit
            Endif
            /*
            If zab->zab_qtpman > 0 .or. (int(zab->zab_qtdpal) - zab->zab_qtdpal) = 0
                cTipo := 'N'
                sa1->(DBSetOrder(1))
                If sa1->(dBseek(xFilial('SA1')+zab->(zab_client+zab_loja)))
                    cCliente := sa1->a1_cod
                    cLojaCli := sa1->a1_loja
                    cTabPreco:= sa1->a1_tabela
                    cNaturez := sa1->a1_naturez
                    cCondPag := sa1->a1_cond
                Else
                    MsgInfo('Existe erro de relacionado na pesquisa do cliente '+zab->(zab_client+zab_loja),'ATENÇÃO')
                    exit
                Endif
            Else
                cTipo := 'B'
                If sa4->(dBseek(xFilial('ZA4') + zaa->zaa_transp))
                    sa2->(dBsetOrder(3))
                    If sa2->(dBseek(xFilial('SA2')+sa4->a4_cgc))
                        cCliente := sa2->a2_cod
                        cLojaCli := sa2->a2_loja
                        cTabPreco:= '   ' // sa2->a2_tabela
                        cNaturez := sa2->a2_naturez
                        cCondPag := sa2->a2_cond
                    Else
                        MsgInfo('Existe erro de relacionado na pesquisa do fornecedor a partir da transportador '+zaa->zaa_transp,'ATENÇÃO')
                        exit
                    Endif
                Else
                    MsgInfo('Existe erro de relacionado na transportadora '+zaa->zaa_transp,'ATENÇÃO')
                    exit
                Endif
            Endif
            */
            nQtdVen      := if(zab->zab_qtpman>0,zab->zab_qtpman,zab->zab_qtdpal)
            cFilPed     := zaa->zaa_filial
            cNumPV      := GetSx8Num("SC5","C5_NUM")
            DbSelectArea("DA1")
            da1->(DBSetOrder(1))

            If da1->(DBSeek(xFilial('DA1')+cTabPreco+cProdPall))
                nPrcVen := da1->da1_prcven
            Else
                ConOut("XX Sem tabela: "+cProdPall+" XX")
                nPrcVen := 1
            EndIf
            aAdd(aLinha,{"C6_FILIAL"	,cFilPed            ,Nil}) // Filial do Pedido de Venda
            aAdd(aLinha,{"C6_NUM"		,cNumPV			    ,Nil}) // Numero do Pedido de Venda (Chave Estrangeira)
            aAdd(aLinha,{"C6_ITEM"		,'001'              ,Nil}) // Sequencial do Item
            aAdd(aLinha,{"C6_PRODUTO"	,cProdPall      	,Nil}) // Codigo do Produto
            aAdd(aLinha,{"C6_LOCAL"		,'01'			    ,Nil}) // Codigo do Produto
            aAdd(aLinha,{"C6_QTDVEN"	,nQtdVen			,Nil}) // Quantidade
            aAdd(aLinha,{"C6_QTDLIB"	,nQtdVen			,Nil}) // Quantidade
            aAdd(aLinha,{"C6_PRCVEN"	,nPrcVen       		,Nil}) // Preco da tabela de venda
            aAdd(aLinha,{"C6_VALOR"		,nPrcVen*nQtdVen    ,Nil}) // Valor Total
            aAdd(aLinha,{"C6_OPER"		,cTpOpSai		    ,Nil}) // Tipo de operação para tes inteligente
            aAdd(aLinha,{"C6_CLI"		,cCliente	        ,Nil}) // Codigo do Cliente
            aAdd(aLinha,{"C6_LOJA"		,cLojaCli			,Nil}) // Loja do Cliente
            aadd(aItmPV,aLinha)

            lRet := GrvPVInt(cFilPed, cTipo, cCliente, cLojaCli,zaa->zaa_carga)

        Endif
        
        If empty(zab->zab_nota) .and. lret // Tratando preparação documento de saida 
            cDocInt := zab->zab_nota

            lRet := FatPVInt(zab->zab_filial, zab->zab_newped, @cDocInt)

            If !lRet 
                cStatus := 'P'
                exit
            EndIf
        ElseIf !empty(zab->zab_nota) .and. lret .and. zab->zab_status == 'T' // Verifica se a nota teve retorno da sefaz
            cAreaSF2 := sf2->(getarea())
            sf2->(dBsetOrder(1))
            If !RetCodCli()
                cStatus := 'P'
                exit
            Endif
            If sf2->(dBseek(xFilial('SF2')+zab->(zab_nota+zab_serie) + cCliente+cLojaCli)) 
                If sf2->f2_fimp =='T' // Nota transmitida, deve forçar o rotina de retorno do monitor
                    If !U_RFATA015()  // Força busca pelo monitoramento da nota (retorno)
                        cStatus := 'P'
                    Endif
                Endif

                If sf2->f2_fimp == 'S'          // Retorno OK da Sefaz
                    If RecLock('ZAB',.F.)
                        zab->zab_status := 'F'  // Indica que a nota foi transmitida e teve retorno com sucesso
                        zab->(MsUnlock())
                    Endif
                Endif

            Else
                cStatus := 'P'
            Endif
            sf2->(RestArea(cAreaSF2))
        Endif
        // Tratando da rotina que salva o XML
        If zab->zab_status =='F' .and. zab->zab_slvxml <> 'S'
            cXml := u_ExpXml(zab->zab_filial,zab->zab_serie,zab->zab_nota,cFile)
            If !empty(cXml)
                cArquivo := zab->zab_nota+"_serie_"+zab->zab_serie+".xml"
                MemoWrite(cPathTmp+cArquivo,cXml)
                If RecLock('ZAB',.F.)
                    zab->zab_slvxml := 'S'  // Indica que a nota foi transmitida e teve retorno com sucesso
                    zab->(MsUnlock())
                Endif
            Endif
        Endif
//        If nqtd>1
//            cStatus:= 'P'
//            exit
//        Endif
        zab->(dBskip())
    Enddo
Endif

If RecLock('ZAA',.f.)
    zaa->zaa_status := cStatus
    MsUnlock()
Endif
Return

*-------------------------------------------------------------------*
Static Function GrvPVInt(cFilPed, cTipo, cCliente, cLojaCli, cCarga)
*-------------------------------------------------------------------*
Local lRet := .t.
Local nX
Local nY
Local aCabPv := {}
Local aErroAuto     := {}
Private lMsErroAuto := .F.
Private lMsHelpAuto := .T.

ConOut(Repl("-",80))
ConOut(PadC("Função: MVC_ZAA->GrvPVInt", 80))
ConOut(Repl("-",80))
ConOut("-Inicio: "+DtoC(Date())+Time())
ConOut("--Preparando Ambiente"+cFilPed)
    
ConOut("--Numero para o Pedido (GetSX8Num): "+cNumPV)

aAdd(aCabPV, {"C5_FILIAL"	, cFilPed	        ,Nil})
aAdd(aCabPV, {"C5_NUM"		, cNumPV		    ,Nil})
aAdd(aCabPV, {"C5_TIPO"		, cTipo	    	    ,Nil})
aAdd(aCabPV, {"C5_CLIENTE"	, cCliente		    ,Nil})
aAdd(aCabPV, {"C5_LOJACLI"	, cLojaCli 		    ,Nil})
aAdd(aCabPV, {"C5_CONDPAG"	, cCondPag		    ,Nil})
aAdd(aCabPV, {"C5_TABELA"	, cTabPreco         ,Nil})
aAdd(aCabPV, {"C5_NATUREZ"	, cNaturez	        ,Nil})  
aAdd(aCabPV, {"C5_EMISSAO"	, dDataBase		    ,Nil})
aAdd(aCabPV, {"C5_MOEDA"	, 1                 ,Nil})
aAdd(aCabPV, {"C5_TPFRETE"	, 'C'			    ,Nil})
//aAdd(aCabPV, {"C5_TRANSP"	, '000001'		    ,Nil})

ConOut("**** Gerando Pedido de Venda ****")

MsExecAuto({|X,Y,Z| MATA410(X,Y,Z)}, aCabPV, aItmPV, 3) // 3 = INCLUSAO

IF LMSERROAUTO
    lRet := .F.
    RollBackSX8()
    MostraErro()

    cLog := "Ocorreu um erro na geracao do pedido de venda, "+cNumPV+", na filial: "+cFilPed

    ConOut(cLog)

    ConOut(PadC("Dados do Pedido", 80))
    ConOut("CABEC:")
    For nX := 1 to Len(aCabPV)
        ConOut('-'+aCabPV[nX][1]+": "+U_fConvChar(aCabPV[nX][2]))
    Next

    ConOut("ITENS:")
    cLogErro := ''
    For nY := 1 to Len(aItmPV)
        ConOut("-"+StrZero(nY,3))
        For nX := 1 to Len(aItmPV[nY])
            ConOut("--"+aItmPV[nY][nX][1]+": "+U_fConvChar(aItmPV[nY][nX][2]))
        Next
    Next
    
    aErroAuto := GetAutoGRLog()
    For nX := 1 To Len(aErroAuto)
        cLogErro += StrTran(StrTran(aErroAuto[nX], "<", ""), "-", "") + " "
        ConOut(cLogErro)
    Next

Else
    ConfirmSX8()
    If RecLock('ZAB',.F.)
        zab->zab_newped := cNumPV
        zab->(MsUnlock())
    Endif
Endif 

ConOut("-Fim: MVC_ZAA - PEDIDO VENDA "+DtoC(Date())+Time())

Return lRet

*---------------------------------------------------------*
Static Function FatPVInt(cFilPed, cNumPV, cDocInt)
*---------------------------------------------------------*
Local lRet          := .T.
Local aPvlNfs       := {}
Local aBloqueio     := {}
Local cLogErro      := ''   
Local cSerSai       := '001'

ConOut(Repl("-",80))
ConOut(PadC("Função: MVC_ZAA -> FatPVInt", 80))
ConOut(Repl("-",80))
ConOut("-Inicio: "+DtoC(Date())+Time())
ConOut("--Preparando Ambiente: "+cFilPed)
    
cFilAnt := cFilPed
cNumEmp := cEmpAnt+cFilPed

DBSelectArea("SC5")
SC5->(DbSetOrder(1))
SC5->(DbGoTop())

If !SC5->(DBSeek(cFilPed+cNumPV))
    ConOut("Xx Erro no posicionamento dos Itens da Intercompany SC5 xX")
    cLogErro += "Xx Erro no posicionamento dos Itens da Intercompany SC5 xX"+cEof
    lRet  := .f.
EndIf
/*
Vou verificar se o pedido esta faturado, caso positivo posiciona a tabela de processos com encerrada e inicia a proxima fila
*/
If !empty(sc5->c5_nota)
    If RecLock('ZAB',.F.)
        zab->zab_nota := sc5->c5_nota
        zab->zab_serie:= sc5->c5_serie
        MsUnlock()
    Endif
    Return lret
Endif

If lRet
    cCodCli := sc5->c5_cliente
    cLojCli := sc5->c5_lojacli
    ConOut("Analisando liberacao do pedido de venda")
    Ma410LbNfs( 2, @aPvlNfs, @aBloqueio )
    Ma410LbNfs( 1, @aPvlNfs, @aBloqueio )

    If !Empty(aBloqueio)
        aAreaSC9 := sc9->(GetArea())
        ConOut("O pedido contem "+CValToChar(Len(aBloqueio))+" itens bloqueados.")
        cLogErro += "O pedido contem "+CValToChar(Len(aBloqueio))+" itens bloqueados."+cEof
    Else
        If Empty(aPvlNfs)
            ConOut("O pedido sem itens para faturar bloqueados.")
            cLogErro += "O pedido sem itens para faturar bloqueados."+cEof
            lRet  := .f.
        EndIf
    EndIf
Endif
If lRet 
    If empty(aPvlNfs)
        ConOut("Aparentemente foi zerado no momento da liberação, ignora a etapa para que retorno no proximo processamento da FILA")
        return .f.
    Endif
    ConOut("***** Faturando pedido de venda: "+cNumPV+" *****")
    cDocInt := MaPvlNfs(/*aPvlNfs*/     aPvlNfs,;       // 01 - Array com os itens a serem gerados
                        /*cSerieNFS*/   cSerSai,;       // 02 - Serie da Nota Fiscal
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
        lRet := .F.

        ConOut("-cFilAnt: " +cFilAnt    )
        ConOut("-FilForn: " +cFilPed   )
        ConOut("-FilVend: " +cFilEnt   )
        ConOut("-cCarga: "  +cCarga     )
        ConOut("-cNumPV: "  +cNumPV     )

        cLogErro += "Erro no faturamento do pedido: "+cNumPV

        ConOut(cLogErro)

    Else
        cLogErro += "Pedido de venda: "+cNumPV+" gerou a nota: "+cDocInt
        If RecLock('ZAB',.F.)
            zab->zab_nota := cDocInt
            zab->zab_serie:= cSerSai
            zab->(msUnlock())
        Endif
        ConOut(cLogErro)
        lRet := .T.
    EndIf
Endif    

Return lRet



*------------------------*
Static Function RetCodCli()
*------------------------*
Local lRet := .t.
If zab->zab_qtpman > 0 .or. (int(zab->zab_qtdpal) - zab->zab_qtdpal) = 0
    cTipo := 'N'
    sa1->(DBSetOrder(1))
    If sa1->(dBseek(xFilial('SA1')+zab->(zab_client+zab_loja)))
        cCliente := sa1->a1_cod
        cLojaCli := sa1->a1_loja
        cTabPreco:= sa1->a1_tabela
        cNaturez := sa1->a1_naturez
        cCondPag := sa1->a1_cond
    Else
        MsgInfo('Existe erro de relacionado na pesquisa do cliente '+zab->(zab_client+zab_loja),'ATENÇÃO')
        lRet := .f.
    Endif
Else
    cTipo := 'B'
    If sa4->(dBseek(xFilial('ZA4') + zaa->zaa_transp))
        sa2->(dBsetOrder(3))
        If sa2->(dBseek(xFilial('SA2')+sa4->a4_cgc))
            cCliente := sa2->a2_cod
            cLojaCli := sa2->a2_loja
            cTabPreco:= '   ' // sa2->a2_tabela
            cNaturez := sa2->a2_naturez
            cCondPag := sa2->a2_cond
        Else
            MsgInfo('Existe erro de relacionado na pesquisa do fornecedor a partir da transportador '+zaa->zaa_transp,'ATENÇÃO')
        lRet := .f.
        Endif
    Else
        MsgInfo('Existe erro de relacionado na transportadora '+zaa->zaa_transp,'ATENÇÃO')
        lRet := .f.
    Endif
Endif

Return lRet
