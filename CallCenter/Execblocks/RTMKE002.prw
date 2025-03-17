#Include 'Protheus.ch'
#Include 'TopConn.ch'

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  RTMKE002     บAutor  ณRaphael Martins   บ Data ณ  30/03/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Rotina de integra็ao com o SAC Service, consome o Web 	   ฑฑ
ฑฑบ          ณ Service do mesmo                                           บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function RTMKE002( cAtendimento )

Local aArea		:= GetArea()
Local aAreaSUC	:= SUC->( GetArea() )
	
SUC->( DbSetOrder(1) ) //UC_FILIAL + UC_CODIGO 


If SUC->( DbSeek( xFilial("SUC") + cAtendimento ) )
	
	//valido se a transportadora e homologacao para integracao com o SAC SERVICE
	If SUC->UC_XTRANSP $ AllTrim( SuperGetMV("MV_XTRANSS", ,"000001") )
	
		If MsgYesNo("Deseja realmente gerar um atendimento no Sistema Sac Service?")
		
			//so realizo a consulta, quando nao existe OS vinculada ao atendimento
			If Empty( SUC->UC_XOSSAC )
				//funcao para montar os dados a serem enviado ao WS
				FWMsgRun(,{|oSay| MontaDados() },'Aguarde...','Gerando atendimento no SAC Service...')
			Else
				Help( ,,'Help',,"O Atendimento selecionado jแ possui OS cadastrada no SAC Service, favor verifique o status da mesma!",1,0)
			EndIf
	
		EndIf
	Else
		Help( ,,'Help',,"Transportadora nao homologada para realizar integracao com Sac Service. Verifique o parametro MV_XTRANSS ",1,0)
	EndIf
Else
	Help( ,,'Help',,"Atendimento nใo encontrado, favor verifique os atendimento telemarketing!",1,0)	 
EndIf

RestArea(aArea) 
RestArea( aAreaSUC )

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  GeraAtendWS     บAutor  ณRaphael Martins   บ Data ณ  30/03/17บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao para realizar o consumo do WS do Sac Service	 	   ฑฑ
ฑฑบ          ณ 	                                          				  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function MontaDados() 

Local lRet 			:= .T. 
Local aConsumidor	:= {}
Local aTelefone		:= {}
Local aProdRec		:= {}
Local aProdRes		:= {}
Local aArea			:= GetArea()
Local aAreaSUD		:= SUD->( GetArea() )
Local aAreaSU5		:= SU5->( GetArea() ) 
Local cCodigoWS		:= ""
Local cHistorico	:= ""


SU5->( DbSetOrder( 1 ) ) //U5_FILIAL+U5_CODCONT+U5_IDEXC  

If SU5->( DbSeek( xFilial("SU5") + SUC->UC_CODCONT ) )
	
	//monto dados do consumidor
	aConsumidor := { SU5->U5_CONTAT,;
					 SU5->U5_EST,;
					 SU5->U5_MUN,;
					 SU5->U5_BAIRRO,;
					 SU5->U5_END,;
					 SU5->U5_CEP,  }
	
	/*
	Nใo obrigat๓rio, mas informado, terแ que ser vแlido.
 	Informar s๓ a sigla, como CEL, RES, COM, etc.
 	Lista de tipos vแlidos. CEL-Celular, RES-Residencial,
	COM-Comercial, OUTRO-Tipo nใo identificado, como fax
	por exemplo.
 	*/
	
	//verifico se o contato possui fone residencial
	If !Empty(SU5->U5_FONE)
	
		cFone		:= Alltrim( If(!Empty(SU5->U5_DDD),SU5->U5_DDD,"") )
		cFone		+= Alltrim(SU5->U5_FONE)
	
		aTelefone	:= { "RES", cFone} 
		
	//verifico se o contato possui fone comercial 1
	elseIf !Empty(SU5->U5_FCOM1)
			 
		cFone		:= Alltrim( If(!Empty(SU5->U5_DDD),SU5->U5_DDD,"") )
		cFone		+= Alltrim( SU5->U5_FCOM1 )
		
		aTelefone	:= {  "COM", cFone } 
		
	//verifico se o contato possui fone comercial 2
	elseIf !Empty(SU5->U5_FCOM2)
			 
		cFone		:= Alltrim(If(!Empty(SU5->U5_DDD),SU5->U5_DDD,""))
		cFone		+= Alltrim(SU5->U5_FCOM2)
		aTelefone	:= {"COM", cFone }
	
	//verifico se o contato possui fone celular
	elseIf !Empty(SU5->U5_CELULAR)
			 
		cFone		:= Alltrim(If(!Empty(SU5->U5_DDD),SU5->U5_DDD,""))
		cFone		+= Alltrim(SU5->U5_CELULAR)
		aTelefone	:= {"COM", cFone }
	else
		lRet := .F.
		Help( ,,'Help',,'Atendimento Nใo cadastrado - Contato do Atendimento nใo possui telefones cadastrados, favor realize o cadastro!',1,0) 
	endif
	
	//caso o contato possua telefones validos, realizo a validacao dos produtos
	If lRet
	 	
	 	//consulto os produtos do atendimento e se possuem quantidades de recolhimento e/ou ressarcimento
		aRetorno		:= aClone( RetProdutos() )
		aProdRec		:= aClone( aRetorno[1] ) //Produtos a recolher 
		aProdRes		:= aClone( aRetorno[2] ) //Produtos a ressarcir
		cHistorico		:= aRetorno[3]			 //Observacao do Produto
		
		If Len( aProdRec ) == 0 .And. Len( aProdRes ) == 0
			lRet := .F.
			Help( ,,'Help',,'Atendimento Nใo cadastrado - Nใo foram informados as quantidades de produtos para recolher ou ressarcir, verifique o atendimento!',1,0) 	
		else 	
			cCodigoWS := GeraAtendWS(aConsumidor,aTelefone,aProdRec,aProdRes,cHistorico)
			
			If cCodigoWS <> '0'
				
				M->UC_XOSSAC := cCodigoWS
				RecLock("SUC",.F.)
					SUC->UC_XOSSAC := cCodigoWS
				SUC->( MsUnlock() )
					 
			EndIf
			
		endif
		
	EndIf
	
Else
	lRet := .F.
	Help( ,,'Help',,'Atendimento Nใo cadastrado - Contato do Atendimento nใo encontrado, favor verifique o cadastro de contatos!',1,0) 		
EndIf
//http://www.sistema.sacservice.com.br/site/files/down/wssac.pdf

RestArea(aArea)
RestArea(aAreaSUD)
RestArea(aAreaSU5)

Return(lRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  RetProdRec     บAutor  ณRaphael Martins   บ Data ณ  30/03/17บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ funcao para retornar os produtos a serem recolhidos	 	   ฑฑ
ฑฑบ          ณ 	                                          				  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function RetProdutos()

Local aArea			:= GetArea()
Local aAreaSUC		:= SUC->( GetArea() )
Local aAreaSUD		:= SUD->( GetArea() ) 
Local aProdRec		:= {}
Local aProdRes		:= {}
Local cHistorico	:= ""
Local cPulaLinha	:= Chr(13) + Chr(10)

SUD->( DbSetOrder( 1 ) ) //UD_FILIAL+UD_CODIGO+UD_ITEM 

If SUD->( DbSeek( xFilial("SUD") + SUC->UC_CODIGO ) )

	While SUD->( !EOF() ) .And. SUD->UD_CODIGO == SUC->UC_CODIGO
		
		//valido se devo enviar o produto para a SAC Service
		If !Empty( SUD->UD_PRODUTO ) .And. SUD->UD_XENVSAC == 'S'

			
			//valido se existe quantidade a recolher
			If SUD->UD_XQTDCOL > 0 
				Aadd( aProdRec, {SUD->UD_PRODUTO,; 											  //Codigo do Produto
								 RetField("SB1",1,xFilial("SB1")+SUD->UD_PRODUTO,"B1_DESC"),; //Descricao do Produto
								 SUD->UD_XQTDCOL,;											  //Quantidade a coletar		
								 SUD->UD_XLOTE,;											  //Lote
								 SUD->UD_XDTFAB,;											  //Data de Fabrica็ใo
								 SUD->UD_XVALIDA} )											  //Data de Validade
			
			EndIf
			//valido se existe quantidade a ressarcir
			If SUD->UD_XQTDAVA > 0 
				Aadd( aProdRes, {SUD->UD_PRODUTO,; 											  //Codigo do Produto
								 RetField("SB1",1,xFilial("SB1")+SUD->UD_PRODUTO,"B1_DESC"),; //Descricao do Produto
								 SUD->UD_XQTDCOL,;											  //Quantidade a coletar		
								 SUD->UD_XLOTE} )											  //Lote
			EndIf
			
			//Observacao do produto
			cHistorico := Alltrim(SUD->UD_OBS) + cPulaLinha
						
		EndIf			
		
		SUD->( DbSkip() )
	EndDo
EndIf


RestArea(aArea)
RestArea(aAreaSUC)
RestArea(aAreaSUD)

Return({aProdRec,aProdRes,cHistorico})


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  GeraAtendWS     บAutor  ณRaphael Martins   บ Data ณ  30/03/17บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ funcao para montar os dados a serem enviado ao WS	 	   ฑฑ
ฑฑบ          ณ 	                                          				  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GeraAtendWS(aConsumidor,aTelefone,aProdRec,aProdRes,cHistorico)

Local oWs 				:= NIL 
Local oDadosCliente		:= NIL
Local oDadosConsumidor	:= NIL
Local oDadosTelefone	:= NIL
Local oItemTelefone		:= NIL
Local oDadosHistorico	:= NIL
Local oHistoricoItem	:= NIL
//Local oReclamacao		:= NIL
Local oProdRecolher		:= NIL
Local oItemRecolher		:= NIL 
Local oProdRessarcir	:= NIL
Local oItemRessarcir	:= NIL
Local cSenhaWS			:= AllTrim( SuperGetMV("MV_XSENHWS", ,"HomologMococA52502") ) //Senha cadastrada no Sac Service // SacService2017 
Local cCnpj				:= AllTrim( SuperGetMV("MV_XCNPJSS", ,"52502507000147") ) //CNPJ cadastrado no Sac Service
Local cMsgErro			:= ""
Local cCodigoWS			:= ""			
Local nX				:= 0

Private oXmlRet			:= NIL //variavel que contem o erro retornado pelo WS

// instancio o objeto do WebService
oWs := WSws_sacservice():New()  

/* Para chamar o m้todo CADASTRAR_ATENDIMENTO, ้ necessแrio informar:
- OWSCLIENTE
- OWSCONSUMIDOR
- OWSHISTORICO
- OWSPRODUTORECOLHER
- OWSPRODUTORESSARCIR
- OWSRECLAMACAO 
*/

////////////////////////////////////////////////////////////////////////
//			PREENCHO OS DADOS DO CLIENTE
///////////////////////////////////////////////////////////////////////
// pego a estrutua do cliente
oDadosCliente := ws_sacservice_SdtAtendimento_Cliente():New

oDadosCliente:cCNPJ    				:= cCnpj //52.502.507/0001-47
oDadosCliente:cSenha				:= cSenhaWS


// preencho o objeto do cliente, com sua estrutura
oWs:oWSSDTATENDIMENTO:oWsCliente := oDadosCliente


////////////////////////////////////////////////////////////////////////
//			PREENCHO OS DADOS DO CONSUMIDOR
///////////////////////////////////////////////////////////////////////

// pego a estrutura do consumidor
oDadosConsumidor := ws_sacservice_SdtAtendimento_Consumidor():New 

// preencho os dados do consumidor

oDadosConsumidor:cNome 					:= aConsumidor[1]
oDadosConsumidor:cUF					:= aConsumidor[2] 
oDadosConsumidor:cCidade 				:= aConsumidor[3]
oDadosConsumidor:cBairro 				:= aConsumidor[4]
oDadosConsumidor:cEndereco 		   		:= aConsumidor[5] 
oDadosConsumidor:cCEP 					:= aConsumidor[6]


////////////////////////////////////////////////////////////////////////
//			PREENCHO OS DADOS DE TELEFONE
///////////////////////////////////////////////////////////////////////

// o telefone do consumidor ้ uma estrutura
// pego a estrutura do telefone
oDadosTelefone:= ws_sacservice_Telefone():New


// o telefone ้ um array de telefones
// pego a estrutura do array de telefones   
oItemTelefone := ws_sacservice_SdtAtendimento_Consumidor_TelefoneItem():New  

// preencho os dados do telefone
oItemTelefone:cTipo						:= aTelefone[1]
oItemTelefone:cNumero					:= aTelefone[2]


// preencho o array de telefones
oDadosTelefone:oWsTelefoneItem			:= {oItemTelefone}    

// preencho o objeto do telefone do consumidor
oDadosConsumidor:oWsTelefone			:= oDadosTelefone  

// preencho o objeto do consumidor, com sua estrutura
oWs:oWSSDTATENDIMENTO:oWsConsumidor := oDadosConsumidor

////////////////////////////////////////////////////////////////////////
//			PREENCHO OS DADOS DE HISTORICO
///////////////////////////////////////////////////////////////////////

// pego a estrutura do historico
oDadosHistorico := ws_sacservice_Historico():New

// o historicoitem ้ um array de historico
// pego a estrutura do array de historico   
oHistoricoItem	:= ws_sacservice_SdtAtendimento_HistoricoItem():New

// preencho os dados do historico
oHistoricoItem:cDescricaoHistorico := "GERADO PELO PROTHEUS - ATENDIMENTO CALLCENTER"
oHistoricoItem:cDescricaoHistorico += Chr(13) + Chr(10) + Alltrim(cHistorico)


// preencho o array de historico
oDadosHistorico:oWSHistoricoItem := {oHistoricoItem}

// preencho o objeto do historico
oWs:oWSSDTATENDIMENTO:oWSHistorico  := oDadosHistorico


////////////////////////////////////////////////////////////////////////
//			PREENCHO OS DADOS DA RECLAMACAO
///////////////////////////////////////////////////////////////////////

// pego os dados da estrutura de reclamacao

/*
oReclamacao := ws_sacservice_SdtAtendimento_Reclamacao():New


oReclamacao:cDataReclamacao 	:= DtoC(dDataBase)
oReclamacao:cNumeroCaso 		:= '99999'
oReclamacao:cObservacao			:= 'OCORRENCIA DE INCIDENTES EM PRODUTOS'
oReclamacao:cAnalise			:= 'OCORRENCIA DE INCIDENTES EM PRODUTOS'
oReclamacao:cDataAgendamento	:= DtoC(dDataBase)

// preencho o objeto de reclamacao
oWs:oWSSDTATENDIMENTO:oWSReclamacao	:= oReclamacao
*/

////////////////////////////////////////////////////////////////////////
//			PREENCHO OS DADOS DOS PRODUTOS A SEREM RECOLHIDOS
///////////////////////////////////////////////////////////////////////

// pego a estrutura do produto recolher
oProdRecolher := ws_sacservice_ProdutoRecolher():New

// o produtoressarcirItem ้ um array de recolher
// pego a estrutura do array de recolher   
oItemRecolher	:= ws_sacservice_SdtAtendimento_ProdutoRecolherItem():New

//valido se existem produtos a serem recolhidos
If Len(aProdRec)
	For nX := 1 To Len( aProdRec )
	
		oItemRecolher:cCodigo 			:= Alltrim( aProdRec[nX,1] )
		oItemRecolher:cNomeProduto		:= Alltrim( aProdRec[nX,2] )
		oItemRecolher:nQtdeRecolher		:= aProdRec[nX,3]
		oItemRecolher:cLoteFabricacao	:= Alltrim( aProdRec[nX,4] )
		oItemRecolher:cDataFabricacao	:= DtoC(aProdRec[nX,5])
		oItemRecolher:cDataValidade		:= DtoC(aProdRec[nX,5])
		
		// preencho o array de produtos recolher 
		Aadd(oProdRecolher:oWSProdutoRecolherItem,oItemRecolher:Clone() )
		
		
		//FreeObj(oItemRecolher)
		
		//oItemRecolher	:= ws_sacservice_SdtAtendimento_ProdutoRecolherItem():New
		
		
	Next nX
	// preencho o objeto de produtos a recolher
	oWs:oWSSDTATENDIMENTO:oWSProdutoRecolher	:= oProdRecolher

EndIf


////////////////////////////////////////////////////////////////////////
//			PREENCHO OS DADOS DOS PRODUTOS A SEREM RESSARCIDOS		 //
///////////////////////////////////////////////////////////////////////


//valido se existem produtos a serem recolhidos
If Len(aProdRes)
	
	// pego a estrutura do produto ressarcir
	oProdRessarcir := ws_sacservice_ProdutoRessarcir():New
	
	// o produtoressarcirItem ้ um array de ressarcir
	// pego a estrutura do array de ressarcir   
	oItemRessarcir	:= ws_sacservice_SdtAtendimento_ProdutoRessarcirItem():New

	For nX := 1 To Len( aProdRes )
	
		// preencho os dados do produto ressarcir
		oItemRessarcir:cCodigo 			:= Alltrim(aProdRes[nX,1])
		oItemRessarcir:cNomeProduto		:= Alltrim(aProdRes[nX,2])
		oItemRessarcir:nQtdeRessarcir	:= aProdRes[nX,3]

		// preencho o array de produtos ressarcir 
		Aadd(oProdRessarcir:oWSProdutoRessarcirItem,oItemRessarcir:Clone())
		
		
	Next nX
	
	oWs:oWSSDTATENDIMENTO:oWSProdutoRessarcir	:= oProdRessarcir
	
EndIf

//metodo de geracao de atendimento no SAC Service
oWs:CADASTRAR_ATENDIMENTO() 

//codigo do atendimento gerado pelo Sac Service
cCodigoWS	:= oXmlRet:_WS_SACSERVICE_CADASTRAR_ATENDIMENTORESPONSE:_SDTRETORNO:_CODIGO:TEXT
	
If cCodigoWS <> '0' 	
	
	Aviso("Sucesso" , "Atendimento Cadastrado com sucesso. Codigo: " + cCodigoWS  , {"OK"} , 1)
else
	//retorno do erro do Webservice
	cMsgErro := oXmlRet:_WS_SACSERVICE_CADASTRAR_ATENDIMENTORESPONSE:_SDTRETORNO:_ERRMSG:TEXT
		
	Help( ,,'Help',,'Nใo foi possivel realizar o cadastro do atendimento no SAC SERVICE.' + CRLF +;
	 ' Motivo: ' + cMsgErro,1,0)
EndIf

Return(cCodigoWS)
